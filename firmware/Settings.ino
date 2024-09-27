

template <class T> int EEPROM_writeAnything(int ee, const T& value)
{
  const byte* p = (const byte*)(const void*)&value;
  unsigned int i;
  for (i = 0; i < sizeof(value); i++)
    EEPROM.write(ee++, *p++);
  return i;
}

template <class T> int EEPROM_readAnything(int ee, T& value)
{
  byte* p = (byte*)(void*)&value;
  unsigned int i;
  for (i = 0; i < sizeof(value); i++)
    *p++ = EEPROM.read(ee++);
  return i;
}

void initializeEEPROM() {
  int addr = 0;
  addr += EEPROM_writeAnything(addr, schema);
  addr += EEPROM_writeAnything(addr, currScale); // curScale default value
  addr += EEPROM_writeAnything(addr, maxBrightness); // maxBrightness default value
  addr += EEPROM_writeAnything(addr, channel); // MIDI channel default value
  addr += EEPROM_writeAnything(addr, sensitivity); // threshold default value
  addr += EEPROM_writeAnything(addr,  polyphony);
  addr += EEPROM_writeAnything(addr,  root);
  addr += EEPROM_writeAnything(addr,  controlNumber);
  addr += EEPROM_writeAnything(addr,  noteMin);
  addr += EEPROM_writeAnything(addr,  noteMax);
  addr += EEPROM_writeAnything(addr,  noteDurMin);
  addr += EEPROM_writeAnything(addr,  noteDurMax);
  addr += EEPROM_writeAnything(addr,  randomness);
  addr += EEPROM_writeAnything(addr,  knobFunction);
}
 


void saveSettings() {
  int addr = 0;
  addr += EEPROM_writeAnything(addr, schema);
  addr += EEPROM_writeAnything(addr,  currScale);
  addr += EEPROM_writeAnything(addr,  maxBrightness);
  addr += EEPROM_writeAnything(addr,  channel);
  addr += EEPROM_writeAnything(addr,  sensitivity);
  addr += EEPROM_writeAnything(addr,  polyphony);
  addr += EEPROM_writeAnything(addr,  root);
  addr += EEPROM_writeAnything(addr,  controlNumber);
  addr += EEPROM_writeAnything(addr,  noteMin);
  addr += EEPROM_writeAnything(addr,  noteMax);
  addr += EEPROM_writeAnything(addr,  noteDurMin);
  addr += EEPROM_writeAnything(addr,  noteDurMax);
  addr += EEPROM_writeAnything(addr,  randomness);
  addr += EEPROM_writeAnything(addr,  knobFunction);
}

void loadDefaultSettings() {
  currScale=0;        // 0-5 0=Chromatic, 1=Major, 2=Indian, 3=Minor, 4=Pentatonic Major, 5=Pentatonic Minor
  maxBrightness = 127;// 0-255
  channel=0;          // 1-16
  //sensitivity = 2.7;  // 0.1-5.0
  polyphony =5;       // 1-8
  root=1;             // ?
  controlNumber=81;   // 0-255
  noteMin=36;         // 0-128
  noteMax=96;         // 0-128
  noteDurMin=100;     // 0-65535
  noteDurMax=2500;    // 0-65535
  randomness = 0;     // 0-255
  knobFunction=0;     // 0-3
  saveSettings();
  }
 
void readSettings() {
  // check if eeprom is emtpy or not
  uint16_t val;
  EEPROM_readAnything(0, val);
  if (val != schema) {
    initializeEEPROM();
  }

  // read!
  EEPROM_readAnything(2, currScale);
  EEPROM_readAnything(3, maxBrightness);
  EEPROM_readAnything(4, channel);
  EEPROM_readAnything(5, sensitivity);
  EEPROM_readAnything(6,  polyphony);
  EEPROM_readAnything(7,  root);
  EEPROM_readAnything(8,  controlNumber);
  EEPROM_readAnything(9,  noteMin);
  EEPROM_readAnything(10 , noteMax);
  EEPROM_readAnything(11,  noteDurMin); //uint16
  EEPROM_readAnything(13,  noteDurMax); //uint16
  EEPROM_readAnything(15,  randomness); //uint16
  EEPROM_readAnything(17,  knobFunction);
}



void printSettings() {
  Serial.print("scale: ");
  Serial.println(currScale);
  Serial.print("britghness: ");
  Serial.println(maxBrightness);
  Serial.print("channel: ");
  Serial.println( channel);
  Serial.print("sensitivity: ");
  Serial.println(sensitivity);
  Serial.print("poly: ");
  Serial.println(polyphony);
  Serial.print("root: " );
  Serial.println(root);
  Serial.print("cc: ");
  Serial.println(controlNumber);
  Serial.print("noteMin: ");
  Serial.println( noteMin);
  Serial.print("noteMax: ");
  Serial.println(noteMax);
  Serial.print("noteDurMin: ");
  Serial.println( noteDurMin); //uint16
  Serial.print("noteDurMax: ");
  Serial.println(noteDurMax); //uint16
  Serial.print("random: ");
  Serial.println(randomness); //uint16
  Serial.print("knobFunction: ");
  Serial.println(knobFunction);
}
