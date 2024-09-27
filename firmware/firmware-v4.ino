/*------------
  MIDI_PsychoGalvanometer v2.0
  Accepts pulse inputs from a Galvanic Conductance sensor
  consisting of a 555 timer set as an astablemultivibrator and two electrodes.
  Through sampling pulse widths and identifying fluctuations, MIDI note and control messages
  are generated.  Features include Threshold, Scaling, Control Number, and Control Voltage
  using PWM through an RC Low Pass filte

  r.
  MIDIsprout.com

  modified by 13-37.org:
  - added EEPROM support and menu functionality from the Arduino shield version https://github.com/electricityforprogress/BiodataSonificationBreadboardKit
  -------------*/
#include <Arduino.h>
#include <EEPROM.h>
#include <LEDFader.h>
#include "version.h"
#include <MIDIUSB.h>
#include <util/atomic.h> // Diese Bibliothek fügt das ATOMIC_BLOCK-Makro ein.

#include <avr/eeprom.h>
#include <avr/interrupt.h>
#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/power.h>

#define F_CPU 16000000UL //MCU runs at 8MHz
const word PWM_FREQ_HZ = 32000; //Adjust this value to adjust the frequency
const word TCNT1_TOP = 16000000 / (2 * PWM_FREQ_HZ);


#define LED_D1_R_PIN 13 // PC7 - D1 R
#define LED_D1_G_PIN 5  // PC6 - D1 G
#define LED_D1_B_PIN 10 // PB6 - D1 B
#define LED_D2_R_PIN 9  // PB5 - D2 R 
#define LED_D2_G_PIN 3 // PD0  - D2 G
#define LED_D2_B_PIN 6 // PD7 - D2 B

#define LED_NUM 7
LEDFader leds[LED_NUM] = { // 6 LEDs (perhaps 2 RGB LEDs)
  LEDFader(LED_D1_R_PIN),
  LEDFader(LED_D2_R_PIN),
  LEDFader(LED_D1_G_PIN),
  LEDFader(LED_D2_G_PIN),
  LEDFader(LED_D1_B_PIN),
  LEDFader(LED_D2_B_PIN),
  LEDFader(11) // PB7 / CV-Out
};

#define INTERRUPT_PIN 2 //galvanometer input
#define KNOB_PIN A4
//#define STATUS_LED 4

//#define SAMPLEDEBUG
//#define DEBUG_SERIAL_KNOB

// Settings
//******************************
//set scaled values, sorted array, first element scale length
const uint8_t scaleCount = 6;
const uint8_t scaleLen = 13; //maximum scale length plus 1 for 'used length'

uint8_t currScale = 0; //current scale, default Chrom // SETTING
uint8_t maxBrightness = 127; // SETTING
uint8_t channel = 0;  //setting channel to 11 or 12 often helps simply computer midi routing setups // SETTING

uint8_t sensitivity = 5; //above 8 notes may run out of ram
uint8_t polyphony = 5; //above 8 notes may run out of ram
#define MAX_POLYPHONY 8

uint8_t noteMin = 36; //C2  - keyboard note minimum
uint8_t noteMax = 96; //C7  - keyboard note maximum
uint16_t noteDurMin = 100;
uint16_t noteDurMax = 2500;

byte QY8 = 0; //sends each note out chan 1-4, for use with General MIDI like Yamaha QY8 sequencer
uint8_t controlNumber = 80; //set to mappable control, low values may interfere with other soft synth controls!!
//byte controlVoltage = 1; //output PWM CV on controlLED, pin 17, PB3, digital 11 *lowpass filter

uint16_t randomness = 0;
uint8_t knobFunction = 0;

float threshold = 1.7;   //2.3;  //change threshold multiplier // SETTING
float threshMin = 0.1; //scaling threshold min
float threshMax = 4.91; //scaling threshold max

float knobMin = 1;
float knobMax = 1024;

int scale[scaleCount][scaleLen] = {
  {12, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, // Chromatic
  {7, 0, 2, 4, 5, 7, 9, 11}, //Major
  {7, 0, 1, 1, 4, 5, 8, 10}, //Indian
  {7, 0, 2, 3, 5, 7, 8, 10}, //Minor
  {5, 0, 2, 4, 7, 9}, // Pentatonic Major
  {5, 0, 3, 5, 7, 10} // Pentatonic Minor
};

// 1 midi cc
// scales
// scale root

uint8_t root = 0; //initialize for root, pitch shifting

const byte samplesize = 10; //set sample array size
const byte analysize = samplesize - 1;  //trim for analysis array

int value = 0;
int prevValue = 0;

volatile unsigned long microseconds; //sampling timer
volatile byte index = 0;
volatile unsigned long samples[samplesize];

unsigned long currentMillis = 1;
unsigned long previousButtonMillis = 0;
unsigned long previousMillis = 0;

byte controlLED = 6; //array index1 of control LED (CV out)
uint8_t noteLEDs = 1;  //performs lightshow set at noteOn event

typedef struct MIDImessage { //build structure for Note and Control MIDImessages
  unsigned int type;
  int value;
  int velocity;
  long duration;
  long period;
  int channel;
};

MIDImessage;
MIDImessage noteArray[MAX_POLYPHONY]; //manage MIDImessage data as an array with size polyphony
int noteindex1 = 0;
MIDImessage controlMessage; //manage MIDImessage data for Control Message (CV out)

int hwrev = 0;
//provide float map function
float mapfloat(float x, float in_min, float in_max, float out_min, float out_max) {
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}


//interrupt timing sample array
void isr() {
  if (index < samplesize) {
    samples[index] = micros() - microseconds ;//- random(250);
    microseconds = samples[index] + microseconds; //rebuild micros() value w/o recalling
    index += 1;
  }
}

int lastKnobValue = 0;
void checkKnob() {
  //float knobValue
  int knobValue = analogRead(KNOB_PIN);
  if (lastKnobValue != knobValue) {
    //set threshold to knobValue mapping
    threshold = mapfloat(knobValue, knobMin, knobMax, threshMin, threshMax);
    lastKnobValue = knobValue;
    //Serial.print("debug: new threshold:");
#ifdef DEBUG_SERIAL_KNOB
    Serial.println(threshold);
#endif
  }
}



void setup()
{
  MCUSR &= ~(1 << WDRF);
  wdt_disable();
  clock_prescale_set(clock_div_1);

  Serial.begin(115200);  //initialize at MIDI rate
  Serial1.begin(31250);  //initialize at MIDI rate


  bootLightshow(); //a light show to display on system boot

  pinMode(INTERRUPT_PIN, INPUT_PULLUP);

  // initBatteryCheck();

  /*if (batVoltage < batteryLimit) {
    blinkLED(2, 1);
    powerDown();
    }*/

  readSettings();

  /*if (midiMode) {
    Serial.begin(31250); // MIDI
    } else {
    Serial.begin(500000); // Serial
    Serial.println("PlantWave started");
    }*/

  attachInterrupt(digitalPinToInterrupt(INTERRUPT_PIN), isr, RISING);  //begin sampling from interrupt

  int freq = 500;
  int resolution = 8;

  //bootLightshow(); //a light show to display on system boot

  controlMessage.value = 0;  //begin CV at 0
}

void loop() {
  //timerWrite(timer, 0); //reset timer (feed watchdog)
  currentMillis = millis();   //manage time
  //checkBattery(); //on low power, shutoff lightShow, continue MIDI operation

  /*if ((currentMillis - buttonPressed ) < 100) {
    checkButton();
    }*/

  if (index >= samplesize)  {
    analyzeSample();  //if samples array full, also checked in analyzeSample(), call sample analysis
  }

  checkNote();  //turn off expired notes
  checkControl();  //update control value
  checkKnob();
  checkLED();  //LED management without delay()
  //  MidiUSB.flush();
  checkSerial();
}

void setThreshold(int percentage) {
  threshold = mapfloat(percentage, 0, 100, threshMax, threshMin);
  sensitivity = percentage;
}

void checkSerial() {
  while (Serial.available()) {

    String rxValue = Serial.readString(); // read the incoming data as string

    String command = getValue(rxValue, ' ', 0);
    String setting = getValue(rxValue, ' ', 1);
    String value1 = getValue(rxValue, ' ', 2);
    String value2 = getValue(rxValue, ' ', 3);

    if (command == "set") {
      if (setting == "sense") {
        int intValue = value1.toInt();
        if ((intValue > 0) && (intValue <= 100)) {
          setThreshold(intValue);
          Serial.print("INFO: set sensitivity to ");
          Serial.println(intValue);
        }
      }

      // CHANNEL
      if (setting == "channel") {
        int intValue = value1.toInt();
        if ((intValue > 0) && (intValue < 17)) {
          channel = intValue - 1;
          Serial.print("INFO: set channel to ");
          Serial.println(intValue);
        }
      }

      // SCALE
      if (setting == "scale") {
        int intValue = value1.toInt();
        if ((intValue >= 0) && (intValue <= 5)) {
          currScale = intValue;
          Serial.print("INFO: set scale to ");
          Serial.println(intValue);
        }
      }

      // POLY
      if (setting == "poly") {
        int intValue = value1.toInt();
        if ((intValue >= 0) && (intValue <= 8)) {
          polyphony = intValue;
          Serial.print("INFO: set polyphony to ");
          Serial.println(intValue);
        }
      }
      // ROOT
      if (setting == "root") {
        int intValue = value1.toInt();
        if ((intValue >= 0) && (intValue <= 11)) {
          root = intValue;
          Serial.print("INFO: set root note to ");
          Serial.println(intValue);
        }
      }

      // LED-MODE
      if (setting == "noteLEDs") {
        int intValue = value1.toInt();
        if ((intValue >= 0) && (intValue <= 2)) {
          noteLEDs = intValue;
          Serial.print("INFO: set noteLEDs to ");
          Serial.println(intValue);
        }
      }

      // USB-MODE
      /*if (setting == "usbmode") {
        int intValue = value1.toInt();
        if ((intValue >= 0) && (intValue <= 2)) {
          debugMode = intValue;
        }
        }*/

      // LED Brightness
      if (setting == "brightness") {
        int intValue = value1.toInt();
        if ((intValue >= 0) && (intValue <= 255)) {
          maxBrightness = intValue;
          Serial.print("INFO: set brightness to ");
          Serial.println(intValue);
        }
      }

      // controlNumber
      if (setting == "controlNumber") {
        int intValue = value1.toInt();
        if ((intValue >= 0) && (intValue <= 127)) {
          controlNumber = intValue;
          Serial.print("INFO: set controlNumber to ");
          Serial.println(intValue);
        }
      }

      // noteMin
      if (setting == "noteMin") {
        int intValue = value1.toInt();
        if ((intValue >= 0) && (intValue <= 127)) {
          noteMin = intValue;
          Serial.print("INFO: set noteMin to ");
          Serial.println(intValue);
        }
      }
      // noteMax
      if (setting == "noteMax") {
        int intValue = value1.toInt();
        if ((intValue >= 0) && (intValue <= 127)) {
          noteMax = intValue;
          Serial.print("INFO: set noteMax to ");
          Serial.println(intValue);

        }
      }

      // noteDurMin
      if (setting == "noteDurMin") {
        int intValue = value1.toInt();
        if ((intValue >= 0) && (intValue <= 60000)) {
          noteDurMin = intValue;
          Serial.print("INFO: set noteDurMin to ");
          Serial.println(intValue);
        }
      }

      // noteDurMax
      if (setting == "noteDurMax") {
        int intValue = value1.toInt();
        if ((intValue >= 0) && (intValue <= 60000)) {
          noteDurMax = intValue;
          Serial.print("INFO: set noteDurMax to ");
          Serial.println(intValue);
        }
      }

      // random
      if (setting == "random") {
        int intValue = value1.toInt();
        if ((intValue >= 0) && (intValue <= 255)) {
          randomness = intValue;
          Serial.print("INFO: set random to ");
          Serial.println(intValue);
        }
      }

      // knob-function
      if (setting == "knob-function") {
        int intValue = value1.toInt();
        if ((intValue >= 0) && (intValue <= 3)) {
          knobFunction = intValue;
          Serial.print("INFO: set knobFunction to ");
          Serial.println(intValue);
        }
      }
    } else if (command == "show") {
      Serial.println("INFO: Active settings: ");

      printSettings();

    } else if (command == "save") {
      saveSettings();
      Serial.println("INFO: Settings stored");
    } else if (command == "load") {
      readSettings();
      Serial.println("INFO: Settings loaded");
    } else if (command == "factory-reset") {
      loadDefaultSettings();
      readSettings();
      Serial.println("INFO: Settings restored to factory defaults");
    }
  }
}

String getValue(String data, char separator, int index)
{
  int found = 0;
  int strIndex[] = { 0, -1 };
  int maxIndex = data.length() - 1;

  for (int i = 0; i <= maxIndex && found <= index; i++) {
    if (data.charAt(i) == separator || i == maxIndex) {
      found++;
      strIndex[0] = strIndex[1] + 1;
      strIndex[1] = (i == maxIndex) ? i + 1 : i;
    }
  }
  return found > index ? data.substring(strIndex[0], strIndex[1]) : data;
}

void fadeOn(int ledNum) {
  LEDFader *led = &leds[ledNum];
  led->fade(255, 1000);
  while (led->is_fading()) {
    led->update();
  }
}

void blinkLED(int ledNum, int count) {
  LEDFader *led = &leds[ledNum];
  for (int i = 0; i < count; i++) {
    led->fade(255, 500);
    while (led->is_fading()) {
      led->update();
    }
    led->fade(0, 500);
    while (led->is_fading()) {
      led->update();
    }
  }
}

void setNote(int value, int velocity, long duration, int notechannel) {
  //find available note in array (velocity = 0);
  for (int i = 0; i < polyphony; i++) {
    if (!noteArray[i].velocity) {
      //if velocity is 0, replace note in array
      noteArray[i].type = 0;
      noteArray[i].value = value;
      noteArray[i].velocity = velocity;
      noteArray[i].duration = currentMillis + duration;
      noteArray[i].channel = notechannel;

      midiSerial(144, channel, value, velocity);
      noteOn(channel, value, velocity);

      if (noteLEDs == 1) { //normal mode
        for (byte j = 0; j < (LED_NUM - 1); j++) { //find available LED and se1
          if (!leds[j].is_fading()) {
            rampUp(i, maxBrightness, duration);
            break;
          }
        }
      } else if (noteLEDs == 2) { //threshold special display mode
        for (byte j = 1; j < (LED_NUM - 1); j++) { //find available LED above first and set
          if (!leds[j].is_fading()) {
            rampUp(i, maxBrightness, duration);
            break;
          }
        }
      }
      break;
    }
  }
}

void setControl(int type, int value, int velocity, long duration)
{
  controlMessage.type = type;
  controlMessage.value = value;
  controlMessage.velocity = velocity;
  controlMessage.period = duration;
  controlMessage.duration = currentMillis + duration; //schedule for update cycle
}


void checkControl()
{
  //need to make this a smooth slide transition, using high precision
  //distance is current minus goal
  signed int distance =  controlMessage.velocity - controlMessage.value;
  //if still sliding
  if (distance != 0) {
    //check timing
    if (currentMillis > controlMessage.duration) { //and duration expired
      controlMessage.duration = currentMillis + controlMessage.period; //extend duration
      //update value
      if (distance > 0) {
        controlMessage.value += 1;
      } else {
        controlMessage.value -= 1;
      }

      //send MIDI control message after ramp duration expires, on each increment
      midiSerial(176, channel, controlMessage.type, controlMessage.value);
      controlChange(channel, controlMessage.type, controlMessage.value);


      //send out control voltage message on pin 17, PB3, digital 11
      //if (controlVoltage) {
      if (distance > 0) {
        rampUp(controlLED, map(controlMessage.value, 0, 127, 255 , 0), 5);
      }
      else {
        rampDown(controlLED, map(controlMessage.value, 0, 127, 255 , 0), 5);
      }
    }
  }
}

void checkNote()
{
  for (uint8_t i = 0; i < polyphony; i++) {
    if (noteArray[i].velocity) {
      if (noteArray[i].duration <= currentMillis) {
        //send noteOff for all notes with expired duration
        if (QY8) {
          midiSerial(144, noteArray[i].channel, noteArray[i].value, 0);
          // noteOff(noteArray[i].channel, noteArray[i].value, 0 );
        }
        else {
          midiSerial(144, noteArray[i].channel, noteArray[i].value, 0);
          noteOff(channel, noteArray[i].value, 0);
        }
        noteArray[i].velocity = 0;
        if (noteLEDs == 1) rampDown(i, 0, 225);
        if (noteLEDs == 2) rampDown(i + 1, 0, 225); //special threshold display mode
      }
    }
  }
}

void MIDIpanic()
{
  //120 - all sound off
  //123 - All Notes off
  // midiSerial(21, panicChannel, 123, 0); //123 kill all notes

  //brute force all notes Off
  for (byte i = 1; i < 128; i++) {
    delay(1); //don't choke on note offs!
    midiSerial(144, channel, i, 0); //clear notes on main channel
    noteOff(channel, i, 0);
  }
}


// First parameter is the event type (0x09 = note on, 0x08 = note off).
// Second parameter is note-on/note-off, combined with the channel.
// Channel can be anything between 0-15. Typically reported to the user as 1-16.
// Third parameter is the note number (48 = middle C).
// Fourth parameter is the velocity (64 = normal, 127 = fastest).

void noteOn(byte channel, byte pitch, byte velocity) {
  if (MidiUSB.isAvailable() == 0) {
    midiEventPacket_t noteOn = {0x09, 0x90 | channel, pitch, velocity};
    MidiUSB.sendMIDI(noteOn);
  }
  MidiUSB.flush();
}

void noteOff(byte channel, byte pitch, byte velocity) {
  if (MidiUSB.isAvailable() == 0) {

    midiEventPacket_t noteOff = {0x08, 0x80 | channel, pitch, velocity};
    MidiUSB.sendMIDI(noteOff);
  }
  MidiUSB.flush();
}

// First parameter is the event type (0x0B = control change).
// Second parameter is the event type, combined with the channel.
// Third parameter is the control number number (0-119).
// Fourth parameter is the control value (0-127).

void controlChange(byte channel, byte control, byte value) {
  if (MidiUSB.isAvailable() == 0) {
    midiEventPacket_t event = {0x0B, 0xB0 | channel, control, value};
    MidiUSB.sendMIDI(event);
  }
  MidiUSB.flush();
}

void midiSerial(int type, int channel, uint8_t data1, int data2) {
  //  Note type = 144
  //  Control type = 176
  // remove MSBs on data
  data1 &= 0x7F;  //number
  data2 &= 0x7F;  //velocity
  byte statusbyte = (type | ((channel - 1) & 0x0F));


  Serial1.write(statusbyte);
  Serial1.write(data1);
  Serial1.write(data2);
#ifdef DEBUG_SERIAL_MIDI
  Serial.println(statusbyte);
  Serial.println(data1);
  Serial.println(data2);
#endif

}


void rampUp(int ledPin, int value, int time) {
  LEDFader *led = &leds[ledPin];
  //scale the value parameter against a new maxBrightness global variable
  //led->fade(value, time);
  led->fade(map(value, 0, 255, 0, maxBrightness), time);
}

void rampDown(int ledPin, int value, int time) {
  LEDFader *led = &leds[ledPin];
  led->fade(value, time); //fade out
}

void checkLED() {
  //iterate through LED array and call update
  for (byte i = 0; i < LED_NUM; i++) {
    LEDFader *led = &leds[i];
    led->update();
  }
}


void pulse(int ledPin, int maxValue, int time) {
  LEDFader *led = &leds[ledPin];
  //check on the state of the LED and force it to pulse
  if (led->is_fading() == false) { //if not fading
    if (led->get_value() > 0) { //and is illuminated
      led->fade(0, time); //fade down
    } else {
      led->fade(maxValue, time); //fade up
    }
  }
}

void bootLightshow() {
  //light show to be displayed on boot
  for (byte i = 1; i <= 6; i++) {
    LEDFader *led = &leds[i - 1];
    //led->set_value(200); //set to max

    led->fade(200, 150); //fade up
    while (led->is_fading()) checkLED();
    //move to next LED
  }

  for (byte i = 1; i <= 6; i++) {
    LEDFader *led = &leds[i - 1];
    //led->set_value(200); //set to max

    led->fade(0, 150 + i * 17); //fade down
    while (led->is_fading()) checkLED();
    //move to next LED
  }
}

void analyzeSample()
{
  //eating up memory, one long at a time!
  unsigned long averg = 0;
  unsigned long maxim = 0;
  unsigned long minim = 100000;
  float stdevi = 0;
  unsigned long delta = 0;
  byte change = 0;
  bool idle = true;

  if (index == samplesize) { //array is full
    unsigned long sampanalysis[analysize];
    // Irgendwo im Code, z.B. in loop()


    for (byte i = 0; i < analysize; i++) {
      //skip first element in the array
      ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
        // Code mit geblockten Interrupts hier (Mehrere atomare Operationen hintereinander werden nicht durch Interrupts unterbrochen)
        sampanalysis[i] = samples[i + 1] + random(randomness); //load analysis table (due to volitle)
      }
      //#define SAMPLEDEBUG
#ifdef SAMPLEDEBUG
      Serial.print("sample");
      Serial.println(sampanalysis[i]);
      //Serial.flush();
#endif

      if (sampanalysis[i] < 100000) {
        idle = false;
      }

      //manual calculation
      if (sampanalysis[i] > maxim) {
        maxim = sampanalysis[i];
      }
      if (sampanalysis[i] < minim) {
        minim = sampanalysis[i];
      }
      averg += sampanalysis[i];
      stdevi += sampanalysis[i] * sampanalysis[i];  //prep stdevi
    }

    if (idle) {
      index = 0;
      return;
    }

    //manual calculation
    averg = averg / analysize;
    stdevi = pow(stdevi / analysize - averg * averg, 0.5); //calculate stdevi
    if (stdevi < 1) {
      stdevi = 1.0;  //min stdevi of 1
    }

    delta = maxim - minim;

    //**********perform change detection
    if (delta > (stdevi * threshold)) {
      change = 1;
    }
    //*********

    if (change) { // set note and control vector
      int dur = 150 + (map(delta % 127, 1, 127, noteDurMin, noteDurMax)); //length of note
      int ramp = 3 + (dur % 100); //control slide rate, min 25 (or 3 ;)
      int notechannel = random(1, 5); //gather a random channel for QY8 mode

      //set scaling, root key, note
      int setnote = map(averg % 127, 1, 127, noteMin, noteMax); //derive note, min and max note
#ifdef SAMPLEDEBUG
      Serial.println(setnote);
#endif
      setnote = scaleNote_fast(setnote, root);  //scale the note
      //setnote = scaleNote_slow(setnote, scale[currScale], root);  //scale the note
      // setnote = setnote + root; // (apply root?)

      if (QY8) {
        setNote(setnote, 100, dur, notechannel);  //set for QY8 mode
      } else {
        setNote(setnote, 100, dur, channel);
      }

      //derive control parameters and set
      setControl(controlNumber, controlMessage.value, delta % 127, ramp); //set the ramp rate for the control
    }

    //reset array for next sample
    index = 0;
  }

#ifdef SAMPLEDEBUG
  Serial.print("delta:");
  Serial.println(delta);
  Serial.print("averg:");
  Serial.println(averg);
  Serial.print("stdevi:");
  Serial.println(stdevi);
  Serial.print("minim: ");
  Serial.println(minim);
  Serial.print("maxim: ");
  Serial.println(maxim);
  Serial.print("change: ");
  Serial.println(change);
#endif
}

int scaleSearch(int note, int scalesize) {
  for (byte i = 1; i < scalesize; i++) {

    if (note == scale[currScale][i]) {
#ifdef SAMPLEDEBUG
      Serial.print("scale-hit");
      Serial.println(scale[currScale][i]);
#endif
      return note;
    }
    else {
      if (note < scale[currScale][i]) {
#ifdef SAMPLEDEBUG
        Serial.print("scale-out");
        Serial.println(note);
#endif
        return scale[currScale][i];  //highest scale value less than or equal to note
      }
    }
    //otherwise continue search
  }
  //didn't find note and didn't pass note value, uh oh!
#ifdef SAMPLEDEBUG
  Serial.print("scale-fail");
#endif
  return 6;//give arbitrary value rather than fail
}

int scaleNote_fast(int note, int root) {
#ifdef SAMPLEDEBUG
  Serial.print("pre-scale:");
  Serial.println(note);
#endif
  //input note mod 12 for scaling, note/12 octave
  //search array for nearest note, return scaled*octave
  int scaled = note % 12;
#ifdef SAMPLEDEBUG
  Serial.print("scaled:");
  Serial.println(scaled);
#endif
  int octave = note / 12;
  int scalesize = (scale[currScale][0]);
  //search entire array and return closest scaled note
  scaled = scaleSearch(scaled,  scalesize);
  scaled = (scaled + (12 * octave)) + root; //apply octave and root
  return scaled;
}
