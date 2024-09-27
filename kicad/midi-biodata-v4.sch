EESchema Schematic File Version 4
LIBS:midi-biodata-v4-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L midi-biodata-v4-rescue:LM555-Timer U2
U 1 1 5D79E40E
P 8450 5550
F 0 "U2" H 8150 5200 50  0000 C CNN
F 1 "LM555" H 8450 5550 50  0000 C CNN
F 2 "Package_SO:VSSOP-8_3.0x3.0mm_P0.65mm" H 8450 5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm555.pdf" H 8450 5550 50  0001 C CNN
	1    8450 5550
	1    0    0    -1  
$EndComp
Text GLabel 8950 5350 2    50   Input ~ 0
555
Wire Wire Line
	7950 5350 7800 5350
$Comp
L Device:R R9
U 1 1 5D8133D8
P 9600 5250
F 0 "R9" H 9650 5250 50  0000 L CNN
F 1 "100K" V 9600 5150 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9530 5250 50  0001 C CNN
F 3 "~" H 9600 5250 50  0001 C CNN
	1    9600 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 5D818A22
P 7800 5200
F 0 "C9" H 8000 5200 50  0000 R CNN
F 1 "4200pF" H 8050 5300 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7838 5050 50  0001 C CNN
F 3 "~" H 7800 5200 50  0001 C CNN
	1    7800 5200
	-1   0    0    1   
$EndComp
Connection ~ 7800 5350
Connection ~ 8450 5050
Wire Wire Line
	8450 5050 8450 5150
$Comp
L Device:C C12
U 1 1 5D8D3C07
P 8300 4950
F 0 "C12" V 8350 4900 50  0000 R CNN
F 1 "0.1uF" V 8150 5000 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8338 4800 50  0001 C CNN
F 3 "~" H 8300 4950 50  0001 C CNN
	1    8300 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	8450 4950 8450 5050
Connection ~ 8450 4950
NoConn ~ 7950 5550
Wire Wire Line
	8950 5750 9000 5750
Wire Wire Line
	9000 5750 9000 6200
Wire Wire Line
	9000 6200 7800 6200
Wire Wire Line
	7800 6200 7800 5350
Connection ~ 9000 5750
Wire Notes Line
	10600 4450 10600 6450
Wire Notes Line
	7450 6450 7450 4450
Wire Notes Line
	7450 4450 10600 4450
Wire Notes Line
	7450 6450 10600 6450
Text Notes 10050 6350 0    90   ~ 18
LM555
Text GLabel 9100 2850 0    50   Input ~ 0
555
Text GLabel 10200 2650 2    50   Input ~ 0
ISO_OUT
$Comp
L power:GND #PWR026
U 1 1 5E55615E
P 8150 3350
F 0 "#PWR026" H 8150 3100 50  0001 C CNN
F 1 "GND" H 8155 3177 50  0000 C CNN
F 2 "" H 8150 3350 50  0001 C CNN
F 3 "" H 8150 3350 50  0001 C CNN
	1    8150 3350
	-1   0    0    1   
$EndComp
$Comp
L power:GNDA #PWR034
U 1 1 5E57FE1C
P 10650 3900
F 0 "#PWR034" H 10650 3650 50  0001 C CNN
F 1 "GNDA" H 10750 3750 50  0000 R CNN
F 2 "" H 10650 3900 50  0001 C CNN
F 3 "" H 10650 3900 50  0001 C CNN
	1    10650 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 3550 9950 3600
$Comp
L power:GND #PWR027
U 1 1 5E5EC687
P 8300 3850
F 0 "#PWR027" H 8300 3600 50  0001 C CNN
F 1 "GND" H 8305 3677 50  0000 C CNN
F 2 "" H 8300 3850 50  0001 C CNN
F 3 "" H 8300 3850 50  0001 C CNN
	1    8300 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR033
U 1 1 5E61F15E
P 10150 2850
F 0 "#PWR033" H 10150 2600 50  0001 C CNN
F 1 "GND" H 10155 2677 50  0000 C CNN
F 2 "" H 10150 2850 50  0001 C CNN
F 3 "" H 10150 2850 50  0001 C CNN
	1    10150 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8150 4950 7800 4950
Wire Wire Line
	7800 4950 7800 5050
Wire Wire Line
	9600 5050 9600 5100
Wire Wire Line
	9600 5400 9600 5550
Connection ~ 9600 5550
Wire Wire Line
	8950 5550 9600 5550
Wire Wire Line
	8450 5050 9600 5050
Wire Wire Line
	9000 5750 9800 5750
Wire Wire Line
	9600 5550 9800 5550
$Comp
L Device:R R8
U 1 1 5DED04AE
P 9250 2650
F 0 "R8" H 9300 2650 50  0000 L CNN
F 1 "1K" V 9250 2600 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9180 2650 50  0001 C CNN
F 3 "~" H 9250 2650 50  0001 C CNN
	1    9250 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9100 2850 9400 2850
$Comp
L Device:R R10
U 1 1 5DED2908
P 10100 2500
F 0 "R10" H 10150 2500 50  0000 L CNN
F 1 "10K" V 10100 2400 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10030 2500 50  0001 C CNN
F 3 "~" H 10100 2500 50  0001 C CNN
	1    10100 2500
	1    0    0    -1  
$EndComp
$Comp
L Isolator:LTV-355T U4
U 1 1 5DED4335
P 9700 2750
F 0 "U4" H 9700 3075 50  0000 C CNN
F 1 "LTV-355T" H 9700 2984 50  0000 C CNN
F 2 "Package_SO:SO-4_4.4x2.3mm_P1.27mm" H 9500 2550 50  0001 L CIN
F 3 "http://optoelectronics.liteon.com/upload/download/DS70-2001-006/S_110_LTV-355T%2020140520.pdf" H 9700 2750 50  0001 L CNN
	1    9700 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 2650 10100 2650
Wire Wire Line
	10000 2850 10150 2850
Connection ~ 10100 2650
Wire Wire Line
	10100 2650 10200 2650
$Comp
L power:GNDA #PWR024
U 1 1 5DED84A6
P 7800 4950
F 0 "#PWR024" H 7800 4700 50  0001 C CNN
F 1 "GNDA" V 7800 4850 50  0000 R CNN
F 2 "" H 7800 4950 50  0001 C CNN
F 3 "" H 7800 4950 50  0001 C CNN
	1    7800 4950
	0    1    1    0   
$EndComp
$Comp
L power:GNDA #PWR029
U 1 1 5DED94A8
P 8450 5950
F 0 "#PWR029" H 8450 5700 50  0001 C CNN
F 1 "GNDA" V 8350 6050 50  0000 R CNN
F 2 "" H 8450 5950 50  0001 C CNN
F 3 "" H 8450 5950 50  0001 C CNN
	1    8450 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 4700 8450 4750
Connection ~ 7800 4950
Connection ~ 8450 4750
Wire Wire Line
	8450 4750 8450 4950
$Comp
L midi-biodata-v4-rescue:ATmega32U4-MU-MCU_Microchip_ATmega U1
U 1 1 602A2300
P 3150 5750
F 0 "U1" H 3150 3861 50  0000 C CNN
F 1 "ATmega32U4-MU" H 3150 3770 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-44-1EP_7x7mm_P0.5mm_EP5.2x5.2mm" H 3150 5750 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7766-8-bit-AVR-ATmega16U4-32U4_Datasheet.pdf" H 3150 5750 50  0001 C CNN
	1    3150 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 5200 2000 5200
Wire Wire Line
	2000 5200 2000 5350
Wire Wire Line
	2000 5350 2100 5350
$Comp
L Device:R R3
U 1 1 602B2A48
P 2250 5350
F 0 "R3" H 2300 5350 50  0000 L CNN
F 1 "27R" V 2250 5300 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2180 5350 50  0001 C CNN
F 3 "~" H 2250 5350 50  0001 C CNN
	1    2250 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	2400 5350 2550 5350
Wire Wire Line
	2550 5250 2400 5250
$Comp
L Device:R R4
U 1 1 602B67B1
P 2250 5500
F 0 "R4" H 2300 5500 50  0000 L CNN
F 1 "27R" V 2250 5450 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2180 5500 50  0001 C CNN
F 3 "~" H 2250 5500 50  0001 C CNN
	1    2250 5500
	0    1    1    0   
$EndComp
Wire Wire Line
	2100 5500 1850 5500
Wire Wire Line
	1850 5500 1850 5400
Wire Wire Line
	2400 5250 2400 5500
Connection ~ 3050 3950
Wire Wire Line
	3050 3950 3150 3950
Connection ~ 3150 3950
Wire Wire Line
	3150 3950 3250 3950
$Comp
L Device:Crystal_GND24 Y1
U 1 1 602BD3C5
P 2300 4550
F 0 "Y1" V 2254 4681 50  0000 L CNN
F 1 "Crystal" V 2345 4681 50  0000 L CNN
F 2 "Crystal:Crystal_SMD_3225-4Pin_3.2x2.5mm" H 2300 4550 50  0001 C CNN
F 3 "~" H 2300 4550 50  0001 C CNN
	1    2300 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	2550 4450 2450 4450
Wire Wire Line
	2450 4450 2450 4400
Wire Wire Line
	2450 4400 2300 4400
Wire Wire Line
	2300 4700 2550 4700
Wire Wire Line
	2550 4700 2550 4650
$Comp
L Device:C C5
U 1 1 602C07EE
P 2300 4250
F 0 "C5" H 2450 4150 50  0000 R CNN
F 1 "22pF" H 2250 4150 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2338 4100 50  0001 C CNN
F 3 "~" H 2300 4250 50  0001 C CNN
	1    2300 4250
	1    0    0    -1  
$EndComp
Connection ~ 2300 4400
$Comp
L Device:C C6
U 1 1 602C0FA3
P 2300 4850
F 0 "C6" H 2450 4750 50  0000 R CNN
F 1 "22pF" H 2250 4750 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2338 4700 50  0001 C CNN
F 3 "~" H 2300 4850 50  0001 C CNN
	1    2300 4850
	1    0    0    -1  
$EndComp
Connection ~ 2300 4700
Text GLabel 3750 5550 2    50   Input ~ 0
ISO_OUT
$Comp
L power:+5V #PWR023
U 1 1 60444667
P 7750 3650
F 0 "#PWR023" H 7750 3500 50  0001 C CNN
F 1 "+5V" V 7765 3778 50  0000 L CNN
F 2 "" H 7750 3650 50  0001 C CNN
F 3 "" H 7750 3650 50  0001 C CNN
	1    7750 3650
	0    -1   -1   0   
$EndComp
$Comp
L power:+5VA #PWR028
U 1 1 60447B6B
P 8450 4750
F 0 "#PWR028" H 8450 4600 50  0001 C CNN
F 1 "+5VA" H 8465 4923 50  0000 C CNN
F 2 "" H 8450 4750 50  0001 C CNN
F 3 "" H 8450 4750 50  0001 C CNN
	1    8450 4750
	1    0    0    -1  
$EndComp
$Comp
L power:+5VA #PWR025
U 1 1 604483BC
P 7950 5750
F 0 "#PWR025" H 7950 5600 50  0001 C CNN
F 1 "+5VA" H 7965 5923 50  0000 C CNN
F 2 "" H 7950 5750 50  0001 C CNN
F 3 "" H 7950 5750 50  0001 C CNN
	1    7950 5750
	-1   0    0    1   
$EndComp
$Comp
L power:+5VA #PWR035
U 1 1 60448CF9
P 10700 3550
F 0 "#PWR035" H 10700 3400 50  0001 C CNN
F 1 "+5VA" V 10715 3678 50  0000 L CNN
F 2 "" H 10700 3550 50  0001 C CNN
F 3 "" H 10700 3550 50  0001 C CNN
	1    10700 3550
	0    1    1    0   
$EndComp
$Comp
L power:+5VA #PWR030
U 1 1 6044C936
P 9100 2650
F 0 "#PWR030" H 9100 2500 50  0001 C CNN
F 1 "+5VA" V 9115 2778 50  0000 L CNN
F 2 "" H 9100 2650 50  0001 C CNN
F 3 "" H 9100 2650 50  0001 C CNN
	1    9100 2650
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR032
U 1 1 6044CF9C
P 10100 2350
F 0 "#PWR032" H 10100 2200 50  0001 C CNN
F 1 "+5V" H 10115 2523 50  0000 C CNN
F 2 "" H 10100 2350 50  0001 C CNN
F 3 "" H 10100 2350 50  0001 C CNN
	1    10100 2350
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 604527CB
P 2350 3700
F 0 "SW1" H 2350 3985 50  0000 C CNN
F 1 "SW_Push" H 2350 3894 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_TL3342" H 2350 3900 50  0001 C CNN
F 3 "~" H 2350 3900 50  0001 C CNN
	1    2350 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 604532E6
P 2150 3700
F 0 "#PWR06" H 2150 3450 50  0001 C CNN
F 1 "GND" H 2155 3527 50  0000 C CNN
F 2 "" H 2150 3700 50  0001 C CNN
F 3 "" H 2150 3700 50  0001 C CNN
	1    2150 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 604535C4
P 2550 4100
F 0 "R5" H 2600 4100 50  0000 L CNN
F 1 "10K" V 2550 4050 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2480 4100 50  0001 C CNN
F 3 "~" H 2550 4100 50  0001 C CNN
	1    2550 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	2550 3950 2800 3950
Wire Wire Line
	2550 4250 2450 4250
Wire Wire Line
	2450 4250 2450 3700
Wire Wire Line
	2450 3700 2550 3700
Connection ~ 2550 4250
Text GLabel 3750 5750 2    50   Input ~ 0
TX0
Text GLabel 4400 2750 0    50   Input ~ 0
TX0
$Comp
L power:+5V #PWR04
U 1 1 6045E416
P 1850 4300
F 0 "#PWR04" H 1850 4150 50  0001 C CNN
F 1 "+5V" H 1865 4473 50  0000 C CNN
F 2 "" H 1850 4300 50  0001 C CNN
F 3 "" H 1850 4300 50  0001 C CNN
	1    1850 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 6045EB82
P 1250 6100
F 0 "#PWR01" H 1250 5850 50  0001 C CNN
F 1 "GND" H 1255 5927 50  0000 C CNN
F 2 "" H 1250 6100 50  0001 C CNN
F 3 "" H 1250 6100 50  0001 C CNN
	1    1250 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 6045F8C6
P 3100 7600
F 0 "#PWR012" H 3100 7350 50  0001 C CNN
F 1 "GND" H 3105 7427 50  0000 C CNN
F 2 "" H 3100 7600 50  0001 C CNN
F 3 "" H 3100 7600 50  0001 C CNN
	1    3100 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 7550 3100 7550
Wire Wire Line
	3100 7600 3100 7550
Connection ~ 3100 7550
Wire Wire Line
	3100 7550 3150 7550
$Comp
L Device:R_Pack04 RN1
U 1 1 60468DAD
P 3950 1350
F 0 "RN1" V 3533 1350 50  0000 C CNN
F 1 "R_Pack04" V 3624 1350 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 4225 1350 50  0001 C CNN
F 3 "~" H 3950 1350 50  0001 C CNN
	1    3950 1350
	0    1    1    0   
$EndComp
$Comp
L Device:LED_ARGB D1
U 1 1 6047E965
P 4750 1350
F 0 "D1" H 4750 1847 50  0000 C CNN
F 1 "LED_RGBA" H 4750 1756 50  0000 C CNN
F 2 "libs:LED_RGB_EASR3212RGBA0" H 4750 1300 50  0001 C CNN
F 3 "~" H 4750 1300 50  0001 C CNN
	1    4750 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ARGB D2
U 1 1 60481577
P 4750 2200
F 0 "D2" H 4750 2697 50  0000 C CNN
F 1 "LED_RGBA" H 4750 2606 50  0000 C CNN
F 2 "libs:LED_RGB_EASR3212RGBA0" H 4750 2150 50  0001 C CNN
F 3 "~" H 4750 2150 50  0001 C CNN
	1    4750 2200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 604823C7
P 2800 3950
F 0 "#PWR011" H 2800 3800 50  0001 C CNN
F 1 "+5V" H 2815 4123 50  0000 C CNN
F 2 "" H 2800 3950 50  0001 C CNN
F 3 "" H 2800 3950 50  0001 C CNN
	1    2800 3950
	1    0    0    -1  
$EndComp
Connection ~ 2800 3950
Wire Wire Line
	2800 3950 3050 3950
$Comp
L power:+5V #PWR019
U 1 1 604827AC
P 4950 1350
F 0 "#PWR019" H 4950 1200 50  0001 C CNN
F 1 "+5V" V 4965 1478 50  0000 L CNN
F 2 "" H 4950 1350 50  0001 C CNN
F 3 "" H 4950 1350 50  0001 C CNN
	1    4950 1350
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR020
U 1 1 604841F1
P 4950 2200
F 0 "#PWR020" H 4950 2050 50  0001 C CNN
F 1 "+5V" V 4965 2328 50  0000 L CNN
F 2 "" H 4950 2200 50  0001 C CNN
F 3 "" H 4950 2200 50  0001 C CNN
	1    4950 2200
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 604848EE
P 3750 2050
F 0 "#PWR013" H 3750 1900 50  0001 C CNN
F 1 "+5V" V 3765 2178 50  0000 L CNN
F 2 "" H 3750 2050 50  0001 C CNN
F 3 "" H 3750 2050 50  0001 C CNN
	1    3750 2050
	0    -1   -1   0   
$EndComp
$Comp
L MJ-2523-SMT:MJ-2523-SMT J4
U 1 1 60495EAF
P 10200 5650
F 0 "J4" H 9870 5604 50  0000 R CNN
F 1 "SENSOR" H 9870 5695 50  0000 R CNN
F 2 "libs:PJ-226-4A" H 10200 5650 50  0001 L BNN
F 3 "2.5 mm, Mono, Right Angle, Surface Mount _SMT_, Audio Jack Connector" H 10200 5650 50  0001 L BNN
F 4 "Unavailable" H 10200 5650 50  0001 L BNN "Feld4"
F 5 "MJ-2523-SMT-TR" H 10200 5650 50  0001 L BNN "Feld5"
F 6 "None" H 10200 5650 50  0001 L BNN "Feld6"
F 7 "CUI Inc." H 10200 5650 50  0001 L BNN "Feld7"
F 8 "None" H 10200 5650 50  0001 L BNN "Feld8"
F 9 "https://www.cui.com/product/interconnect/connectors/audio-connectors/jacks/mj-2523-smt-tr?utm_source=snapeda.com&utm_medium=referral&utm_campaign=snapedaBOM" H 10200 5650 50  0001 L BNN "Feld9"
	1    10200 5650
	-1   0    0    1   
$EndComp
$Comp
L Device:L L2
U 1 1 604A2A61
P 10400 3900
F 0 "L2" V 10590 3900 50  0000 C CNN
F 1 "L" V 10499 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 10400 3900 50  0001 C CNN
F 3 "~" H 10400 3900 50  0001 C CNN
	1    10400 3900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9950 3550 10250 3550
Connection ~ 9950 3550
Wire Wire Line
	10250 3600 10250 3550
Connection ~ 10250 3550
$Comp
L power:GND #PWR08
U 1 1 604C32FF
P 2300 5000
F 0 "#PWR08" H 2300 4750 50  0001 C CNN
F 1 "GND" H 2305 4827 50  0000 C CNN
F 2 "" H 2300 5000 50  0001 C CNN
F 3 "" H 2300 5000 50  0001 C CNN
	1    2300 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 604C3895
P 2300 4100
F 0 "#PWR07" H 2300 3850 50  0001 C CNN
F 1 "GND" H 2305 3927 50  0000 C CNN
F 2 "" H 2300 4100 50  0001 C CNN
F 3 "" H 2300 4100 50  0001 C CNN
	1    2300 4100
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 604C3E4B
P 2550 5050
F 0 "#PWR09" H 2550 4900 50  0001 C CNN
F 1 "+5V" V 2600 5000 50  0000 L CNN
F 2 "" H 2550 5050 50  0001 C CNN
F 3 "" H 2550 5050 50  0001 C CNN
	1    2550 5050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 604F62CA
P 4250 4400
F 0 "R7" H 4300 4400 50  0000 L CNN
F 1 "5,1K" V 4250 4350 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4180 4400 50  0001 C CNN
F 3 "~" H 4250 4400 50  0001 C CNN
	1    4250 4400
	0    1    1    0   
$EndComp
$Comp
L Device:C C8
U 1 1 604F68D6
P 4400 4550
F 0 "C8" H 4550 4450 50  0000 R CNN
F 1 "1uF" H 4650 4550 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4438 4400 50  0001 C CNN
F 3 "~" H 4400 4550 50  0001 C CNN
	1    4400 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4400 4800 4400
Connection ~ 4400 4400
Wire Wire Line
	4400 4700 4600 4700
Wire Wire Line
	4800 4700 4800 4600
$Comp
L power:GND #PWR016
U 1 1 604FC952
P 4600 4700
F 0 "#PWR016" H 4600 4450 50  0001 C CNN
F 1 "GND" H 4605 4527 50  0000 C CNN
F 2 "" H 4600 4700 50  0001 C CNN
F 3 "" H 4600 4700 50  0001 C CNN
	1    4600 4700
	1    0    0    -1  
$EndComp
Connection ~ 4600 4700
Wire Wire Line
	4600 4700 4800 4700
$Comp
L Device:C C1
U 1 1 604FDDA3
P 1050 7000
F 0 "C1" H 1200 6900 50  0000 R CNN
F 1 "4.7uF" H 1150 7100 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1088 6850 50  0001 C CNN
F 3 "~" H 1050 7000 50  0001 C CNN
	1    1050 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 604FE8AC
P 1400 7000
F 0 "C2" H 1550 6900 50  0000 R CNN
F 1 "0.1uF" H 1550 7100 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1438 6850 50  0001 C CNN
F 3 "~" H 1400 7000 50  0001 C CNN
	1    1400 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 604FEF09
P 1700 7000
F 0 "C3" H 1850 6900 50  0000 R CNN
F 1 "0.1uF" H 1850 7100 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1738 6850 50  0001 C CNN
F 3 "~" H 1700 7000 50  0001 C CNN
	1    1700 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 604FF109
P 2000 7000
F 0 "C4" H 2150 6900 50  0000 R CNN
F 1 "0.1uF" H 2150 7100 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2038 6850 50  0001 C CNN
F 3 "~" H 2000 7000 50  0001 C CNN
	1    2000 7000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 604FF8C8
P 1550 6700
F 0 "#PWR02" H 1550 6550 50  0001 C CNN
F 1 "+5V" H 1565 6873 50  0000 C CNN
F 2 "" H 1550 6700 50  0001 C CNN
F 3 "" H 1550 6700 50  0001 C CNN
	1    1550 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 6050073E
P 1550 7350
F 0 "#PWR03" H 1550 7100 50  0001 C CNN
F 1 "GND" H 1555 7177 50  0000 C CNN
F 2 "" H 1550 7350 50  0001 C CNN
F 3 "" H 1550 7350 50  0001 C CNN
	1    1550 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 6850 1400 6850
Wire Wire Line
	1550 6850 1550 6700
Connection ~ 1400 6850
Wire Wire Line
	1400 6850 1550 6850
Wire Wire Line
	1550 6850 1700 6850
Connection ~ 1550 6850
Connection ~ 1700 6850
Wire Wire Line
	1700 6850 2000 6850
Wire Wire Line
	1050 7150 1400 7150
Connection ~ 1400 7150
Wire Wire Line
	1400 7150 1550 7150
Connection ~ 1700 7150
Wire Wire Line
	1700 7150 2000 7150
Wire Wire Line
	1550 7350 1550 7150
Connection ~ 1550 7150
Wire Wire Line
	1550 7150 1700 7150
Wire Wire Line
	3750 4950 4100 4950
Wire Wire Line
	4100 4400 4100 4950
Text GLabel 3750 5450 2    50   Input ~ 0
PD0
Text GLabel 3750 6150 2    50   Input ~ 0
PD7
Text GLabel 3750 4750 2    50   Input ~ 0
PB5
Text GLabel 3750 4850 2    50   Input ~ 0
PB6
Text GLabel 3750 5150 2    50   Input ~ 0
PC6
Text GLabel 3750 5250 2    50   Input ~ 0
PC7
Text GLabel 3750 1350 0    50   Input ~ 0
PB6
Text GLabel 3750 1250 0    50   Input ~ 0
PC6
Text GLabel 3750 1850 0    50   Input ~ 0
PD0
Text GLabel 3750 1150 0    50   Input ~ 0
PC7
Text GLabel 3750 1750 0    50   Input ~ 0
PD7
$Comp
L power:GND #PWR05
U 1 1 6053B9F1
P 2100 4550
F 0 "#PWR05" H 2100 4300 50  0001 C CNN
F 1 "GND" H 2105 4377 50  0000 C CNN
F 2 "" H 2100 4550 50  0001 C CNN
F 3 "" H 2100 4550 50  0001 C CNN
	1    2100 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 4550 2500 4550
Connection ~ 2100 4550
$Comp
L Device:Fuse F1
U 1 1 605BDA6B
P 1850 4450
F 0 "F1" H 1910 4496 50  0000 L CNN
F 1 "Fuse" H 1910 4405 50  0000 L CNN
F 2 "Fuse:Fuse_0805_2012Metric" V 1780 4450 50  0001 C CNN
F 3 "~" H 1850 4450 50  0001 C CNN
	1    1850 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6750 4400 6750
NoConn ~ 950  6100
NoConn ~ 1850 4800
NoConn ~ 1850 4900
Wire Wire Line
	3750 6350 3900 6350
$Comp
L Device:R R6
U 1 1 605EEBFD
P 4050 6350
F 0 "R6" H 4100 6350 50  0000 L CNN
F 1 "0R" V 4050 6300 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3980 6350 50  0001 C CNN
F 3 "~" H 4050 6350 50  0001 C CNN
	1    4050 6350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR014
U 1 1 605EF1F8
P 4200 6350
F 0 "#PWR014" H 4200 6100 50  0001 C CNN
F 1 "GND" H 4205 6177 50  0000 C CNN
F 2 "" H 4200 6350 50  0001 C CNN
F 3 "" H 4200 6350 50  0001 C CNN
	1    4200 6350
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_C_Receptacle_USB2.0 J1
U 1 1 6061DA2A
P 1250 5200
F 0 "J1" H 1357 6067 50  0000 C CNN
F 1 "USB_C_Receptacle_USB2.0" H 1357 5976 50  0000 C CNN
F 2 "Connector_USB:USB_C_Receptacle_Palconn_UTC16-G" H 1400 5200 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 1400 5200 50  0001 C CNN
	1    1250 5200
	1    0    0    -1  
$EndComp
NoConn ~ 1850 5700
NoConn ~ 1850 5800
Wire Wire Line
	1850 5100 1850 5200
Connection ~ 1850 5200
Wire Wire Line
	1850 5300 1850 5400
Connection ~ 1850 5400
$Comp
L midi-biodata-v4-rescue:RK14J12R0A0C-SamacSys_Parts VR1
U 1 1 60639F86
P 5150 6200
F 0 "VR1" H 5600 6465 50  0000 C CNN
F 1 "RK14J12R0A0C" H 5600 6374 50  0000 C CNN
F 2 "SamacSys_Parts:RK14J12R0A0C" H 5900 6300 50  0001 L CNN
F 3 "https://www.mouser.co.uk/datasheet/2/15/RKJ1-1370680.pdf" H 5900 6200 50  0001 L CNN
F 4 "Potentiometers Dual Unit-Single Shaft (New-TX) For Vol.Control(Reflow)" H 5900 6100 50  0001 L CNN "Description"
F 5 "2.5" H 5900 6000 50  0001 L CNN "Height"
F 6 "688-RK14J12R0A0C" H 5900 5900 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/ALPS/RK14J12R0A0C?qs=nR5Mw3RKkX6EgV9BDILd1A%3D%3D" H 5900 5800 50  0001 L CNN "Mouser Price/Stock"
F 8 "ALPS" H 5900 5700 50  0001 L CNN "Manufacturer_Name"
F 9 "RK14J12R0A0C" H 5900 5600 50  0001 L CNN "Manufacturer_Part_Number"
	1    5150 6200
	1    0    0    -1  
$EndComp
NoConn ~ 6050 6200
NoConn ~ 6050 6300
$Comp
L Mechanical:Fiducial FID1
U 1 1 606F80AD
P 7450 1200
F 0 "FID1" H 7535 1246 50  0000 L CNN
F 1 "Fiducial" H 7535 1155 50  0000 L CNN
F 2 "Fiducial:Fiducial_0.75mm_Mask1.5mm" H 7450 1200 50  0001 C CNN
F 3 "~" H 7450 1200 50  0001 C CNN
	1    7450 1200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID2
U 1 1 606F8309
P 7450 1450
F 0 "FID2" H 7535 1496 50  0000 L CNN
F 1 "Fiducial" H 7535 1405 50  0000 L CNN
F 2 "Fiducial:Fiducial_0.75mm_Mask1.5mm" H 7450 1450 50  0001 C CNN
F 3 "~" H 7450 1450 50  0001 C CNN
	1    7450 1450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID3
U 1 1 606F85C2
P 7450 1650
F 0 "FID3" H 7535 1696 50  0000 L CNN
F 1 "Fiducial" H 7535 1605 50  0000 L CNN
F 2 "Fiducial:Fiducial_0.75mm_Mask1.5mm" H 7450 1650 50  0001 C CNN
F 3 "~" H 7450 1650 50  0001 C CNN
	1    7450 1650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID4
U 1 1 606F8766
P 8050 1200
F 0 "FID4" H 8135 1246 50  0000 L CNN
F 1 "Fiducial" H 8135 1155 50  0000 L CNN
F 2 "Fiducial:Fiducial_0.75mm_Mask1.5mm" H 8050 1200 50  0001 C CNN
F 3 "~" H 8050 1200 50  0001 C CNN
	1    8050 1200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID5
U 1 1 606F8A1C
P 8050 1450
F 0 "FID5" H 8135 1496 50  0000 L CNN
F 1 "Fiducial" H 8135 1405 50  0000 L CNN
F 2 "Fiducial:Fiducial_0.75mm_Mask1.5mm" H 8050 1450 50  0001 C CNN
F 3 "~" H 8050 1450 50  0001 C CNN
	1    8050 1450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID6
U 1 1 606F8CB2
P 8050 1700
F 0 "FID6" H 8135 1746 50  0000 L CNN
F 1 "Fiducial" H 8135 1655 50  0000 L CNN
F 2 "Fiducial:Fiducial_0.75mm_Mask1.5mm" H 8050 1700 50  0001 C CNN
F 3 "~" H 8050 1700 50  0001 C CNN
	1    8050 1700
	1    0    0    -1  
$EndComp
Text GLabel 3750 1450 0    50   Input ~ 0
PB5
$Comp
L Device:C C14
U 1 1 604A3045
P 10650 3750
F 0 "C14" H 10800 3650 50  0000 R CNN
F 1 "4.7uF" H 10750 3750 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10688 3600 50  0001 C CNN
F 3 "~" H 10650 3750 50  0001 C CNN
	1    10650 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 3900 10250 3900
$Comp
L Device:C C13
U 1 1 5E563B0F
P 9950 3750
F 0 "C13" H 10100 3650 50  0000 R CNN
F 1 "0.1uF" H 10100 3750 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9988 3600 50  0001 C CNN
F 3 "~" H 9950 3750 50  0001 C CNN
	1    9950 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5E52C500
P 8300 3500
F 0 "C11" H 8450 3400 50  0000 R CNN
F 1 "0.1uF" H 8450 3600 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8338 3350 50  0001 C CNN
F 3 "~" H 8300 3500 50  0001 C CNN
	1    8300 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5E52D834
P 8000 3500
F 0 "C10" H 8150 3400 50  0000 R CNN
F 1 "4,7uF" H 8100 3600 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8038 3350 50  0001 C CNN
F 3 "~" H 8000 3500 50  0001 C CNN
	1    8000 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 604A228F
P 10400 3550
F 0 "L1" V 10219 3550 50  0000 C CNN
F 1 "L" V 10310 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 10400 3550 50  0001 C CNN
F 3 "~" H 10400 3550 50  0001 C CNN
	1    10400 3550
	0    1    1    0   
$EndComp
$Comp
L midi-biodata-v4-rescue:ADUM5028-5BRIZ-ADUM5028-5BRIZ-midi-biodata-esp32_rev4-iso-sensor-rescue U3
U 1 1 60A17DB5
P 9000 3850
F 0 "U3" H 9000 4315 50  0000 C CNN
F 1 "ADUM5028-5BRIZ-ADUM5028-5BRIZ-midi-biodata-esp32_rev4-iso-sensor-rescue" H 9000 4224 50  0000 C CNN
F 2 "ADUM5028-5BRIZ:SOIC127P1031X265-8N" H 9000 3850 50  0001 L BNN
F 3 "DC DC Converter 3KV 300MW" H 9000 3850 50  0001 L BNN
F 4 "ADUM5028-5BRIZ-ND" H 9000 3850 50  0001 L BNN "Feld4"
F 5 "Analog Devices" H 9000 3850 50  0001 L BNN "Feld5"
F 6 "https://www.digikey.com/product-detail/en/analog-devices-inc/ADUM5028-5BRIZ/ADUM5028-5BRIZ-ND/9485493?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 9000 3850 50  0001 L BNN "Feld6"
F 7 "ADUM5028-5BRIZ" H 9000 3850 50  0001 L BNN "Feld7"
F 8 "SOIC-8 Analog Devices" H 9000 3850 50  0001 L BNN "Feld8"
	1    9000 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR031
U 1 1 60A2557F
P 9700 4150
F 0 "#PWR031" H 9700 3900 50  0001 C CNN
F 1 "GND" H 9705 3977 50  0000 C CNN
F 2 "" H 9700 4150 50  0001 C CNN
F 3 "" H 9700 4150 50  0001 C CNN
	1    9700 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3350 8150 3350
Connection ~ 8150 3350
Wire Wire Line
	8150 3350 8300 3350
Wire Wire Line
	8000 3650 8300 3650
Connection ~ 8300 3650
Wire Wire Line
	7750 3650 8000 3650
Connection ~ 8000 3650
Wire Wire Line
	9700 3650 9700 3550
Wire Wire Line
	9700 3550 9950 3550
Wire Wire Line
	10550 3550 10650 3550
Wire Wire Line
	10650 3550 10650 3600
Connection ~ 10650 3550
Wire Wire Line
	10650 3550 10700 3550
Wire Wire Line
	10550 3900 10650 3900
Connection ~ 10650 3900
Wire Wire Line
	4400 6300 4950 6300
Wire Wire Line
	4400 6300 4400 6750
$Comp
L power:GND #PWR022
U 1 1 60559DA9
P 5150 6300
F 0 "#PWR022" H 5150 6050 50  0001 C CNN
F 1 "GND" V 5155 6172 50  0000 R CNN
F 2 "" H 5150 6300 50  0001 C CNN
F 3 "" H 5150 6300 50  0001 C CNN
	1    5150 6300
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR021
U 1 1 60559630
P 5150 6200
F 0 "#PWR021" H 5150 6050 50  0001 C CNN
F 1 "+5V" H 5165 6373 50  0000 C CNN
F 2 "" H 5150 6200 50  0001 C CNN
F 3 "" H 5150 6200 50  0001 C CNN
	1    5150 6200
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C7
U 1 1 60A2AC7F
P 2550 5700
F 0 "C7" H 2700 5600 50  0000 R CNN
F 1 "1uF" H 2700 5800 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2588 5550 50  0001 C CNN
F 3 "~" H 2550 5700 50  0001 C CNN
	1    2550 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 60A2B3BD
P 2550 5850
F 0 "#PWR010" H 2550 5600 50  0001 C CNN
F 1 "GND" H 2555 5677 50  0000 C CNN
F 2 "" H 2550 5850 50  0001 C CNN
F 3 "" H 2550 5850 50  0001 C CNN
	1    2550 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 60A2F9F8
P 2000 4800
F 0 "R1" V 1950 4650 50  0000 C CNN
F 1 "5,1K" V 2000 4800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1930 4800 50  0001 C CNN
F 3 "~" H 2000 4800 50  0001 C CNN
	1    2000 4800
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 60A30808
P 2000 4900
F 0 "R2" V 2050 4750 50  0000 C CNN
F 1 "5,1K" V 2000 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1930 4900 50  0001 C CNN
F 3 "~" H 2000 4900 50  0001 C CNN
	1    2000 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 4800 2150 4900
Wire Wire Line
	2150 5000 2300 5000
Connection ~ 2150 4900
Wire Wire Line
	2150 4900 2150 5000
Connection ~ 2300 5000
Wire Wire Line
	4950 6300 4950 6500
Wire Wire Line
	4950 6500 5150 6500
$Comp
L Connector:AVR-ISP-6 ISP1
U 1 1 60B69E06
P 4800 7350
F 0 "ISP1" H 4521 7446 50  0000 R CNN
F 1 "AVR-ISP-6" H 4521 7355 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" V 4550 7400 50  0001 C CNN
F 3 " ~" H 3525 6800 50  0001 C CNN
	1    4800 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 60B6B584
P 4700 6850
F 0 "#PWR017" H 4700 6700 50  0001 C CNN
F 1 "+5V" H 4715 7023 50  0000 C CNN
F 2 "" H 4700 6850 50  0001 C CNN
F 3 "" H 4700 6850 50  0001 C CNN
	1    4700 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 60B6BE71
P 4700 7750
F 0 "#PWR018" H 4700 7500 50  0001 C CNN
F 1 "GND" H 4705 7577 50  0000 C CNN
F 2 "" H 4700 7750 50  0001 C CNN
F 3 "" H 4700 7750 50  0001 C CNN
	1    4700 7750
	1    0    0    -1  
$EndComp
Text GLabel 3750 4550 2    50   Input ~ 0
MISO
Text GLabel 3750 4450 2    50   Input ~ 0
MOSI
Text GLabel 5200 7250 2    50   Input ~ 0
MOSI
Text GLabel 5200 7150 2    50   Input ~ 0
MISO
Text GLabel 3750 4350 2    50   Input ~ 0
SCK
Text GLabel 5200 7350 2    50   Input ~ 0
SCK
Text GLabel 2450 3850 2    50   Input ~ 0
RESET
Text GLabel 5200 7450 2    50   Input ~ 0
RESET
Wire Wire Line
	4550 1550 4550 1700
Wire Wire Line
	5250 1700 5250 750 
Wire Wire Line
	5250 750  4150 750 
Wire Wire Line
	4150 750  4150 1150
$Comp
L Device:R_Pack04 RN2
U 1 1 6046A8A0
P 3950 1950
F 0 "RN2" V 3533 1950 50  0000 C CNN
F 1 "R_Pack04" V 3624 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 4225 1950 50  0001 C CNN
F 3 "~" H 3950 1950 50  0001 C CNN
	1    3950 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 1750 4150 1800
Wire Wire Line
	4150 1850 4150 1900
Wire Wire Line
	4550 1900 4550 2000
Wire Wire Line
	4550 1700 5250 1700
Wire Wire Line
	4150 1450 4150 1700
Wire Wire Line
	4150 1700 4500 1700
Wire Wire Line
	4500 1700 4500 1800
Wire Wire Line
	4500 1800 5250 1800
Wire Wire Line
	5250 1800 5250 2550
Wire Wire Line
	4350 2950 4400 2950
Wire Wire Line
	4150 2950 4350 2950
Connection ~ 4350 2950
$Comp
L power:GND #PWR015
U 1 1 60C0DE50
P 4350 2950
F 0 "#PWR015" H 4350 2700 50  0001 C CNN
F 1 "GND" H 4355 2777 50  0000 C CNN
F 2 "" H 4350 2950 50  0001 C CNN
F 3 "" H 4350 2950 50  0001 C CNN
	1    4350 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2850 4150 2850
Wire Wire Line
	4150 2850 4150 2050
$Comp
L MJ-3523-SMT:MJ-3523-SMT J2
U 1 1 60C1FC83
P 5200 4500
F 0 "J2" H 4870 4461 50  0000 R CNN
F 1 "CV" H 4870 4552 50  0000 R CNN
F 2 "libs:PJ-320-4A" H 5200 4500 50  0001 L BNN
F 3 "Unavailable" H 5200 4500 50  0001 L BNN
F 4 "None" H 5200 4500 50  0001 L BNN "Feld4"
F 5 "CUI Inc." H 5200 4500 50  0001 L BNN "Feld5"
F 6 "3.5 mm, Mono, Right Angle, Surface Mount _SMT_, Audio Jack Connector" H 5200 4500 50  0001 L BNN "Feld6"
F 7 "None" H 5200 4500 50  0001 L BNN "Feld7"
F 8 "https://www.cui.com/product/interconnect/connectors/audio-connectors/jacks/mj-3523-smt?utm_source=snapeda.com&utm_medium=referral&utm_campaign=snapedaBOM" H 5200 4500 50  0001 L BNN "Feld8"
F 9 "MJ-3523-SMT-TR" H 5200 4500 50  0001 L BNN "Feld9"
	1    5200 4500
	-1   0    0    1   
$EndComp
$Comp
L MJ-3523-SMT:MJ-3523-SMT J3
U 1 1 60C223AA
P 4800 2850
F 0 "J3" H 4470 2811 50  0000 R CNN
F 1 "MIDI" H 4470 2902 50  0000 R CNN
F 2 "libs:PJ-320-4A" H 4800 2850 50  0001 L BNN
F 3 "Unavailable" H 4800 2850 50  0001 L BNN
F 4 "None" H 4800 2850 50  0001 L BNN "Feld4"
F 5 "CUI Inc." H 4800 2850 50  0001 L BNN "Feld5"
F 6 "3.5 mm, Mono, Right Angle, Surface Mount _SMT_, Audio Jack Connector" H 4800 2850 50  0001 L BNN "Feld6"
F 7 "None" H 4800 2850 50  0001 L BNN "Feld7"
F 8 "https://www.cui.com/product/interconnect/connectors/audio-connectors/jacks/mj-3523-smt?utm_source=snapeda.com&utm_medium=referral&utm_campaign=snapedaBOM" H 4800 2850 50  0001 L BNN "Feld8"
F 9 "MJ-3523-SMT-TR" H 4800 2850 50  0001 L BNN "Feld9"
	1    4800 2850
	-1   0    0    1   
$EndComp
Wire Wire Line
	4400 2950 4400 3050
Connection ~ 4400 2950
Wire Wire Line
	4450 2550 4450 2200
Wire Wire Line
	4450 2200 4550 2200
Wire Wire Line
	4450 2550 5250 2550
Wire Wire Line
	4150 1900 4300 1900
Wire Wire Line
	4300 1900 4300 2400
Wire Wire Line
	4300 2400 4550 2400
Wire Wire Line
	4550 1900 4400 1900
Wire Wire Line
	4400 1900 4400 1800
Wire Wire Line
	4400 1800 4150 1800
Wire Wire Line
	4150 1350 4350 1350
Wire Wire Line
	4350 1350 4350 1150
Wire Wire Line
	4350 1150 4550 1150
Wire Wire Line
	4150 1250 4550 1250
Wire Wire Line
	4550 1250 4550 1350
Wire Wire Line
	9700 3850 9700 3650
Connection ~ 9700 3650
Wire Wire Line
	9700 4050 9950 4050
Wire Wire Line
	9950 4050 9950 3900
Connection ~ 9950 3900
$Comp
L Device:C C15
U 1 1 60D40C7F
P 10550 3750
F 0 "C15" H 10700 3650 50  0000 R CNN
F 1 "4.7uF" H 10650 3750 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10588 3600 50  0001 C CNN
F 3 "~" H 10550 3750 50  0001 C CNN
	1    10550 3750
	1    0    0    -1  
$EndComp
Connection ~ 10550 3900
Wire Wire Line
	10550 3600 10550 3550
Connection ~ 10550 3550
$EndSCHEMATC
