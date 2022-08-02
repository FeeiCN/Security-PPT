Searching for the Light: Adventures w/ OpticSpy
Joe Grand (@joegrand)

Hacker, Engineer, Daddy

OpticSpy
! Optical receiver to convert light into voltage ! Wavelength: Visible and near IR light (420-940nm) ! Signal speed: 100Hz-1.5MHz ! Data stream polarity: Select normal v. inverted ! Gain and threshold adjustment via potentiometers ! USB interface for direct connection to host PC

Covert Channels
! Hidden methods to intentionally exfiltrate/transfer data from a normally functioning system
! Could be achieved with HW and/or FW modification ! Specifications modified or misdesigned before manufacturing ! On physical device during manufacturing or inthe-field ! Hardware implant via interdiction

Exploiting the Environment
! Leakage based on optical, acoustic, thermal, or RF characteristics of a system ! Soft Tempest: Hidden Data Transmission Using Electromagnetic Emanations (Kuhn, Anderson) ! Emanate Like a Boss: Generalized Covert Data Exfiltration with Funtenna (Cui) ! Inaudible Sound as a Covert Channel in Mobile Devices (Deshotels) ! BitWhisper: Covert Signaling Channel between Air-Gapped Computers using Thermal Manipulations (Guri et al.)

Blinkenlights
! Using LEDs to exfiltrate/send data ! Modulation faster than the human eye can detect
! Optical covert channels ! Information Leakage from Optical Emanations (Loughry and Umphress, 2002) ! Silence on the Wire:A Field Guide to Passive Reconnaissance and Indirect Attacks (Zalewski) ! Extended Functionality Attacks on IoT Devices: The Case of Smart Lights (Ronen, Shamir) ! xLED: Covert Data Exfiltration from Air-Gapped Networks via Router LEDs (Guri et al.)

A Selection of Optical History
! Alexander Graham Bell's Photophone (1880) ! Fiber optic communications (~1963) ! Laser tag (~1979) ! Optical networking systems (VLC, Li-Fi, FSO) (2011)

Related Projects
! Heathkit Laser Trainer/Receiver (1985) ! Engineer's Mini Notebook: Optoelectronics Circuits
(Forest Mims III, 1985) ! IRis (Craig Heffner, 2016) ! See no evil, hear no evil: Hacking invisibly & silently
with light & sound (Matt Wixey, 2017)

Design Goals
! Open source tool for optoelectronic experimentation ! Easy to understand theory ! Off-the-shelf components ! Hand solderable
! Raise awareness of other interesting communication/ exfiltration methods

Proof of Concept

Early Versions

Development

Block Diagram

Points of Interest

Photodiode

Threshold voltage adjust

Power indicator
USB

Gain adjust

Polarity selection

Receive indicator

Schematic

Place target LED near or onto sensor Peak wavelength sensitivity @ 565nm

CCOC11 PIC102
0.1uF
PIC101

3V3

Non-Inverting Amplifier

PIR101

(1st Stage)

CROR11 100k
PIR102

3V3 CCOC22 0.1uF

CDOD11 PID102

PIC202 PIC201

BPW21R

PID10 CTOTPP11

PITP101

PIU3103

PIR20CW
PIR20W CROR22
20k
PIR20CW

PIU4104

2

5

PIU105 CUOU11 MAX4124EUK PIU1101
PIU102

PIR501
CROR55
4.7k
PIR502

PIR40CCW

PIR40CW

CROR44 500k

PIR40W

U1Av = 1 + R4/R5

Total transimpedance gain = R2 x U1Av x U2Av Frequency response inversely proportional to gain

To Host USB Mini B

CPOP11

UX60-MB-5S8

1 2 3

PIP101 PIP102 PIP103

NVLUVUSSBB NDL_D0NN NDLD_0PP

4 PIP104

5 PIP105

CLOL11 220R@100MHz

PIL101

PIL102

PIC802 CCOC88

PIC902 CCOC99

PIC801 0.01uF PIC901 47pF

PIC102 CCO1C100 PIC101 47pF

5V0

CUOU44 FT231XS PIU410515 VCC

CROR1133
PIR1301
CROR1144
PIR1401

27
PIR1302
27
PIR1402

PIU410212 USBDM PIU410111 USBDP

5V0 RCO1R155 4.7k
PID201 PID202 PIR1501 PIR1502

TNLXTLXLEEDDa#

PIU410818 CBUS0

PIU410717 CBUS1

PIU410010 PIU410919

CBUS2 CBUS3

PIU410414 RESET

Non-Inverting Amplifier (2nd Stage)
3V3 CCOC55 0.1uF
PIC502 PIC501

CCOC33 0.1uF
PIC302 PIC301
PIR701
CROR77 10k
PIR702

CTOPTP22

PITP201

PIU3203

4
PIU204

2

5

PIU205 CUOU22 MAX4124EUK PIU1201
PIU20

Threshold Detector (Comparator)
3V3 CCOC77 0.1uF
PIC702 PIC701

TCOPTP33

PITP301

PIU3303

PIU4304

5

2

PIU302 CUOU33 MAX985EUK 1 PIU301
PIU305

3V3
PIR601
CROR66 1k
PIR602
PIR1 01
CROR1111 1k
PIR1 02

PIR801
CROR88 10k
PIR802

PIR100CCW

PIR100CW

CRO1R100 PIR10W
1.0M

U2Av = 1 + R10/R8

CCOC44 PIC402 0.1uF PIC401

3V3

PIR120CW
CROR1122 PIR120W
20k
PIR120CW

CTOPTP44
PITP401
CCOC66 PIC602 0.1uF PIC601

CDOD22 LED
Receive Data Indicator

CCOC1111 0.1uF

PIU4303 PIU410313

VCCIO 3V3OUT

PIC1 02

PIC1 01

Normal

Inverted 3V3

PIR301

RCOR33

1k

PIR302

PIQ103

RCOR99 10k

PIR901

PIR90P2IQ102

QCOQ11

MMBT3904

PIQ10

CSOWSW11 JS202011CQN

PIS1W101 3 PISW103 PIS4W104
6
PISW106

2
PISW102
PIS5W105

TXD PIU204020

RXD PI4U404

RTS PI2U402

CTS PI9U409

DTR PI1U401

DSR DCD
RI

PI7U407 PI8U408 PI5U405

GND GND

PI6U406 PIU164016

CTOPTP55 PITP501

DNLADTAATA_0RRXX

5V0
PIC1402 CCOC1144 PIC1401 0.1uF

PIC1201 CCOC1122 PIC1202 10uF

CUOU55

MIC5205-3.3YM5

PIU5101 IN

OUT PI5U505

PIU5303 EN

PIC1502 2
PIU502

GND

BYP

4
PIU504

PIC1501

CCOC1155 470pF

3V3
PIC1301 CCOC1133 PIC1302 10uF

Power Indicator
3V3
PIR1601
CROR1166
4.7k
PIR1602
PID301 DCOD33
PID302 LED

TCOPTP66
PITP601
Based on Maxim Integrated's AN1117: Small Photodiode Receiver Handles Fiber-Optic Data Rates to 800kbps (July 2001)

NOTE: RESISTORS ARE IN OHMS +/- 5a AND CAPACITORS ARE IN MICROFARADS UNLESS OTHERWISE NOTED. SEE BOM FOR ACTUAL VOLTAGE AND SPECIFICATION.

TITLE

OpticSpy Analog: Crowd Supply Edition

DaTE

FILENaME

SIZE

Photodiode

! Vishay Semiconductor BPW21R ! Converts light into current ! Photoconductive mode (reverse bias)
! Faster response -> higher bandwidth ! Less sensitivity, increased dark current ! Bias resistor affects response/sensitivity

CCOC11 PIC102
0.1uF
PIC101

3V3
PIR101
CROR11 100k
PIR102

Non-Inverting Amplifier

CDOD11 PID102
BPW21R

PID10 CTOTPP11

PITP101

PIU103

PIR20CW
PIR20W CROR22
20k
PIR20CW

PIU104

Amplification

! Maxim MAX4124 Wide Bandwidth, Low Power, Rail-to-Rail Operational Amplifier
! Two stages w/ signal massaging in between ! Lower gain per stage -> less overall noise
! Total transimpedance gain = R2 x U1Av x U2Av

3V3

Non-Inverting Amplifier

(1st Stage)

3V3 CCOC22 0.1uF
PIC202 PIC201

CTOTPP11

PITP101

PIU3103

CROR22

PIU4104

20k

2

5

PIU105 CUOU11 MAX4124EUK PIU1101
PIU102

PIR501
CROR55
4.7k
PIR502

PIR40CCW

PIR40CW

CROR44 500k

PIR40W

U1Av = 1 + R4/R5

Total transimpedance gain = R2 x U1Av x U2Av Frequency response inversely proportional to gain

Non-Inverting Amplifier (2nd Stage)
3V3 CCOC55 0.1uF
PIC502 PIC501

Threshold Detector

CCOC33 0.1uF
PIC302 PIC301
PIR701
CROR77 10k
PIR702

CTOPTP22

PITP201

PIU3203

PIU4204

2

5

PIU205 CUOU22 MAX4124EUK PIU1201
PIU20

TCOPTP33

PITP301

PIU303

PIU304

3V3
PIR601
CROR66 1k
PIR602
PIR1 01
CROR1111 1k
PIR1 02

PIR801
CROR88 10k
PIR802

PIR100CCW

PIR100CW

CRO1R100 PIR10W
1.0M

U2Av = 1 + R10/R8

CCOC44 PIC402 0.1uF PIC401

3V3

PIR120CW
CROR1122 PIR120W
20k
PIR120CW

CTOPTP44
PITP401
CCOC66 0.1uF

Comparator

! Maxim MAX985 Micropower, Low Voltage, Rail-toRail Comparator

! Determine what portion of signal treated as logic level '0' or '1'

! Adjustable threshold voltage w/ potentiometer R12

Non-Inverting Amplifier 0.1uF
MAX4124EUK

Threshold Detector (Comparator)
3V3 CCOC77 0.1uF
PIC702 PIC701

TCOPTP33

PITP301

PIU3303

PIU4304

5

2

PIU302 CUOU33 MAX985EUK PIU1301
PIU305

3V3

R10/R8

PIR120CW

CROR1122

PIR120W

20k

PIR120CW

CTOPTP44
PITP401
CCOC66 PIC602 0.1uF PIC601

CCOC1111 PIC102 0.1uF PIC101

Normal

Inverted 3V3

PIR301

RCOR33

1k

PIR302

PIQ103

RCOR99 10k

PIR901

PIR90P2IQ102

QCOQ11

MMBT3904

PIQ10

CSOWSW11 JS202011CQN

PIS1W101 3 PISW103 PIS4W104 6 PISW106

2 PISW102 PIS5W105

CTOPTP55 PITP501

DNLADTAATA_0RRXX

USB Interface

! Powers OpticSpy from bus (5V)

! FTDI FT231X USB-to-Serial UART

! Entire USB protocol handled on-chip
! Host will recognize as a virtual serial port (Windows, OS X, Linux)

! Decode asynchronous data streams and pass to

host PC

0.1uF

To Host USB Mini B

CPOP11

UX60-MB-5S8

1 2 3

PIP101
PIP102 PIP103

NVLUVUSSBB NDL_D0NN
NDLD_0PP

4 PIP104

5 PIP105

CLOL11 220R@100MHz

PIL101

PIL102

5V0

PIC802 CCOC88

PIC902 CCOC99

PIC801 0.01uF PIC901 47pF

PIC102 CCO1C100 PIC101 47pF

Threshold Detector (Comparator)
3V3

5V0 RCO1R155 4.7k
PID201 PID202 PIR1501 PIR1502
CDOD22 LED
Receive Data Indicator

CUOU44 FT231XS PIU410515 VCC

CROR1133
PIR1301
CROR1144
PIR1401

27
PIR1302
27
PIR1402

PIU410212 USBDM PIU410111 USBDP

TNLXTLXLEEDDa#

PIU410818
PIU410717 PIU410010 PIU410919

CBUS0 CBUS1 CBUS2 CBUS3

PIU410414 RESET

CCOC1111 0.1uF

PIU4303 VCCIO PIU410313 3V3OUT
PIC1 02 PIC1 01

TXD PIU204020

RXD PI4U404

RTS PI2U402

CTS DTR DSR DCD
RI

PI9U409 PI1U401 PI7U407 PI8U408
PI5U405

GND PI6U406 GND PIU164016

PCB

Bill-of-Materials
OpticSpy Analog: Crowd Supply Edition Bill-of-Materials HW A, Document 1.0, January 18, 2018

Item
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23

Quantity
9 1 2 2 1 1 2 1 1 1 1 2 3 1 3 3 1 2 1 2 1 1 1

Reference C1, C2, C3, C4, C5, C6, C7, C11, C14 C8 C9, C10 C12, C13 C15 D1 D2, D3 L1 P1 Q1 R1 R2, R12 R3, R6, R11 R4 R5, R15, R16 R7, R8, R9 R10 R13, R14 SW1 U1, U2 U3 U4 U5

Manufacturer
Kemet Kemet Samsung Vishay Sprague Yageo Vishay Semiconductor Kingbright TDK Hirose Electric ON Semiconductor Any Bourns Any Bourns Any Any Bourns Any C&K Components Maxim Integrated Maxim Integrated FTDI Microchip

Manuf. Part #
C0805C104K5RACTU C0805C103K5RACTU CL21C470JBANNNC 293D106X0016A2TE3 CC0805KRX7R9BB471 BPW21R APT2012SYCK MPZ2012S221AT000 UX60-MB-5S8 MMBT3904 Any PVG5A203C03R00 Any PVG5A504C03R00 Any Any PVG5A105C03R00 Any JS202011CQN MAX4124EUK+T MAX985EUK+T FT231XS-R MIC5205-3.3YM5

Distributor Distrib. Part #

Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key Digi-Key

399-1170-1-ND 399-1158-1-ND 1276-1156-1-ND 718-1956-1-ND 311-1124-1-ND 751-1013-ND 754-1134-1-ND 445-1568-1-ND H2960CT-ND MMBT3904FSCT-ND P100KACT-ND 490-2667-1-ND P1.0KACT-ND 490-2674-1-ND P4.7KACT-ND P10KACT-ND 490-2663-1-ND P27ACT-ND 401-2001-ND MAX4124EUK+TCT-ND MAX985EUK+TCT-ND 768-1129-1-ND 576-1259-1-ND

Description
Capacitor, 0.1uF, 50V, Ceramic, 10%, X7R, 0805 Capacitor, 0.01uF, 50V, Ceramic, 10%, X7R, 0805 Capacitor, 47pF, 50V, Ceramic, 5%, C0G, 0805 Capacitor, 10uF, 16V, Tantalum, 20%, Size A Capacitor, 470pF, 50V, Ceramic, 10%, X7R, 0805 Photodiode, Silicon PN, 420-675nm, TO-5 LED, Yellow clear, 150mcd, 2.0Vf, 590nm, 0805 Inductor, Ferrite Bead, 220R @ 100MHz, 3A, 0805 Connector, Mini-USB, 5-pin, SMT w/ PCB mount Transistor, NPN, 40V, 200mA, SOT23-3 Resistor, 100k, 5%, 1/8W, 0805 Resistor, Variable Trimmer, 20k, 1/8W, SMD Resistor, 1k, 5%, 1/8W, 0805 Resistor, Variable Trimmer, 500k, 1/8W, SMD Resistor, 4.7k, 5%, 1/8W, 0805 Resistor, 10k, 5%, 1/8W, 0805 Resistor, Variable Trimmer, 1.0M, 1/8W, SMD Resistor, 27 ohm, 5%, 1/8W, 0805 Switch, DPDT slide, 300mA @ 6VDC, PCB mount IC, Operational Amplifier, Rail-to-Rail, SOT23-5 IC, Comparator, Push-Pull, Rail-to-Rail, SOT23-5 IC, USB-to-UART Bridge, SSOP20 Linear Regulator, LDO, 3.3V, 150mA, SOT23-5

! All components available from Digi-Key, Mouser ! Total cost per unit @ 100 quantity = ~$40.77 ! High ticket items: Photodiode, op amp, comparator,
potentiometers, PCB fab/assembly/test

Target Data Transmission
! Standard LED driver circuit

Target Data Transmission
! Asynchronous serial (UART) ! No external clock needed ! NRZ (Non-Return-To-Zero) coding ! Transfer speed (baud rate) selectable ! Data bits sent LSB first (D0)
*** Start bit + Data bits + Parity (optional) + Stop bit(s)

Target Data Transmission
Mark (Idle)

Space

Bit width = ~8.7uS

Target Data Transmission
! Printable ASCII data via standard UART ! printf(message) or equivalent

TP1: Photocurrent-to-Voltage

TP2: 1st Stage Amp Output

TP3: 2nd Stage Amp Output

TP5: Comparator Output

TP5: Comparator Output

Calibration
! Adjust settings for a particular target system ! Reduce ambient noise ! Increase receive distance ! Change frequency response/bandwidth ! Dependent on brightness and wavelength of transmitting signal
! Potentiometers ! Gain adjustment (three stages) ! Default setting @ mid-range -> 27.6M ! Threshold voltage adjustment (for comparator) ! Set to 2.5V during production

Demonstrations

Parallax Electronic Badge

Tomu
! Silicon Labs Happy Gecko EFM32HG309 ! Total 12 components (incl. plastic case) ! 100% Open Source (w/ KiCad) ! http://tomu.im ! https://github.com/im-tomu/tomu-quickstart/tree/
master/opticspy

Arduino + Laz0r!@

! Long-range data transmission w/ laser diode module ! Data sent to LDO Enable (EN) pin ! Distance limited by laser diffusion + output power ! oshpark.com/shared_projects/WV8fBzyW

VCC

Input voltage 2.5V to 16V

CCOC11 10uF

CJOPJP11 Header 3

VCC

3 PIJP103 2 PIJP102 1 PIJP101

NLLELENN

PIC101 PIC202 PIC102 PIC201
PIR102
RCOR11 DNP
PIR101

CCOC22 0.1uF

CUOU11

MIC5213a3.0YC5

PIU1505 VIN

VO PI4U104

1
PIU101

EN

PIU1303 GND NC PI2U102

Arima APCD-635-02-C3-A or equivilent 80mA maximum operating current

3V0
PIC302 CCOC33 PIC301 1uF

CDOD11 APC Laser Diode Module PID1101 VCC

3
PID103

NC

PID1202 GND

Arduino + Laz0r!@

Hayes Smartmodem Optima
! Data leakage through SD (Send Data) LED ! Discovered by Loughry and Umphress 2002 ! Indicator LEDs tied to serial port data lines

Hayes Smartmodem Optima
! uSD to Serial Interface ! Read text file from card, send contents via serial
! DB25 connection for direct connection to modem ! Good for demonstrations, trolling, etc. ! oshpark.com/shared_projects/laP2t8DO

TP-Link TL-WR841N
! Physically unmodified router w/ DD-WRT ! Cross compiled w/ toolchain-mips_24kc_
gcc-7.2.0_musl ! Loaded onto the device with known administrator
credentials (as proof of concept)

TP-Link TL-WR841N

MacBook Pro Keyboard
! Based on https://github.com/pirate/mac-keyboardbrightness
! Backlight LEDs @ 100Hz, 75% PWM :( ! Can decode manually or w/ MCU via TP5

Samsung TV Remote
! 38kHz carrier ! Start: 4.5ms pulse burst, 4.5ms space ! Logic '1': ~544s pulse, 1.706ms space ! Logic '0': ~544s pulse, 580s space ! Measure via TP5

iPhone 6 Proximity Sensor
! ~313uS width @ 100kHz carrier ! 30Hz refresh rate ! Measure via TP5

Application Ideas
! Search for optical covert channels in existing devices ! Discover optical networking/communications systems ! Add data transfer functionality to a project ! Receive/demodulate IR signals ! Measure the world around you

Limitations
! Data must be NRZ encoded in order to pass through USB-to-Serial interface
! Short receive range (up to ~4 inches) w/o additional optics
! Difficult to determine potentiometer settings

Future Work?
! More intelligence to handle non-NRZ data streams (on-board v. off-board)
! Automatic gain control (AGC) to replace potentiometers
! Compromise/communicate with a target device using an LED as an input

Other Things
! Photodiode Amplifiers: Op Amp Solutions, Jerald Graeme, McGraw-Hill, 1995
! Sound Camera: NYC Night Drive, Eric Archer, 2010 ! The Photophone, Hack-a-Week, 2011 ! PWM Laser Audio Transmitter,Tymkrs, 2011

Other Things
! IBM/Lenovo ThinkPad LED Control ! www.reddit.com/r/thinkpad/comments/7n8eyu/ thinkpad_led_control_under_gnulinux/
! Asus ROG Strix Z370 Gaming Mini-ITX Motherboard ! Addressable AURA sync RGB LED lighting ! www.asus.com/us/ROG-Republic-Of-Gamers/ROGSTRIX-Z370-I-GAMING/

Come Into the Light
! grandideastudio.com/portfolio/opticspy *** Schematic, BOM, Gerber plots, test procedure, user manual, demonstration code
! oshpark.com/profiles/joegrand *** Bare boards
! crowdsupply.com/grand-idea-studio/opticspy *** Assembled units

The End.

