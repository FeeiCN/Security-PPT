Project "The Interceptor":
Owning anti-drone systems with nanodrones
David Meléndez Cano R&D Embedded Systems Engineer
@taiksontexas
Taiksonprojects.blogspot.com

David Meléndez Cano
@TaiksonTexas  R&D Embedded Software Engineer in
Albalá Ingenieros, S.A. Spain  Author of the robots: "Atropos" & "Texas Ranger"  Author of the Book "Hacking con Drones"  "Reincident" speaker  Trainiac

David Meléndez Cano
@TaiksonTexas  R&D Embedded Software Engineer in
Albalá Ingenieros, S.A. Spain  Author of the robots: "Atropos" & "Texas Ranger"  Author of the Book "Hacking con Drones"  "Reincident" speaker  Trainiac

David Meléndez Cano
@TaiksonTexas  R&D Embedded Software Engineer in
Albalá Ingenieros, S.A. Spain  Author of the robots: "Atropos" & "Texas Ranger"  Author of the Book "Hacking con Drones"  "Reincident" speaker  Trainiac

David Meléndez Cano
@TaiksonTexas  R&D Embedded Software Engineer in
Albalá Ingenieros, S.A. Spain  Author of the robots: "Atropos" & "Texas Ranger"  Author of the Book "Hacking con Drones"  "Reincident" speaker  Trainiac

@taiksontexas

Previously in DEFCON...
@taiksontexas

Previously in DEFCON...
@taiksontexas

Drones as a threat
 Flying computers. (IoT over your head.)  Custom payloads:
­ Sniffers ­ Jammers ­ Network Analyzers ­ 3d mapping, cameras. ­ Physical attacks, explosives. ­ ...
@taiksontexas

Detection
 Thermal and standard cameras
­ A.I. to detect drone shape ­ Electronics and motor heat detection
 Characterization of drone noise  Detected Radio Frequency and waveform
­ Radio signature
@taiksontexas

"Voluntary" measures
 No-fly zone controlled by onboard GPS and Autopilots
 Real time telemetry transmission to COPS
 Give to COPS the ability to take down your drone and "everything will be alright"
@taiksontexas

Counter-Countermeasures
 Spread-spectrum  Frequency hopping  Use unespected frequencies by the jammer  Robust protocols
@taiksontexas

First Round: "ATROPOS"
Dron ATROPOS
 WiFi Router  PIC16F876 for PWM  Wii Nunckuck and
Motion + as onboard IMU  HTML5 telemetry by router
webserver  WiFi comm.  WPS Attacks with bully
@taiksontexas

First Round: "ATROPOS"
Dron ATROPOS
 WiFi Router  PIC16F876 for PWM  Wii Nunckuck and
Motion + as onboard IMU  HTML5 telemetry by router
webserver  WiFi comm.  WPS Attacks with bully
@taiksontexas

First Round: "ATROPOS"
Dron ATROPOS
 WiFi Router  PIC16F876 for PWM  Wii Nunckuck and
Motion + as onboard IMU  HTML5 telemetry by router
webserver  WiFi comm.  WPS Attacks with bully
@taiksontexas

First Round: "ATROPOS"
Dron ATROPOS
 WiFi Router  PIC16F876 for PWM  Wii Nunckuck and
Motion + as onboard IMU  HTML5 telemetry by router
webserver  WiFi comm.  WPS Attacks with bully
@taiksontexas

Now, what else?
"We count thirty Rebel ships, Lord Vader...

...but they're so small they're evading our

turbolasers"

@taiksontexas

Project "The Interceptor"
@taiksontexas

Project "The Interceptor"
 Minimum size and weight (harder to detect)
 Low budget (no, seriously, really low)
~$40 + $20 with SDR
 Hacking capabilities  "Resilient" control
@taiksontexas

Project "The Interceptor"
@taiksontexas

Vocore2
@taiksontexas

Vocore2
@taiksontexas

Vocore2: PWM
 We need to generate x4 PWM signals to control the motors
­ Hard real time constrained. Need specific HW.
 x4 channels available, but only 2 enabled  Last two overlap with UART2 function
­ Disable UART2 in devicetree ­ Enable PWMx4 in devicetree
@taiksontexas

Vocore2: PWM in the forum
Random guy Q: ¿How can I enable all PWM?
@taiksontexas

Vocore2: PWM in the forum
Random guy Q: ¿How can I enable all PWM?
@taiksontexas

Vocore2: PWM in the forum
Random guy Q: ¿How can I enable all PWM?
@taiksontexas

Vocore2: PWM in the forum
Random guy Q: ¿How can I enable all PWM?
@taiksontexas

Vocore2: PWM (pinmux)
./target/linux/ramips/dts/mt7628an.dtsi
@taiksontexas

Vocore2: PWM (pinmux)
Pinmux redefinition

ADC chip declaration Present in I2C for battery
Disabled UART2 Enabled all 4 PWM

@taiksontexas

Vocore2: pinmux mt7628 (datasheet)
@taiksontexas

Power stage
 Brushed motors (cheap as hell)  X1 MOSFET  X1 Capacitor  X1 Schottky
diode
@taiksontexas

Electrical motor behaviour
@taiksontexas

PID tunning
@taiksontexas

Interceptor WiFi architecture

PILOT SIDE

AIRCRAFT SIDE

JOYSTICK

AES encryption 802.11 beacon injection

control

Websocket

Change channel management

WEB interface

Websocket

AES decryption

802.11 beacon sniffing

telemetry

802.11 beacDonRsOnNifEfing
AES decryption
Flight control And change channel
management
AES encryption
802.11 beacon injection

@taiksontexas

Interceptor WiFi architecture
Forged Beacon Frame injecon (PILOT SIDE)

HEADER

BEACON FRAME PAYLOAD AES-128

Header

AP "INTERCEPTOR"

INITIALIZATION VECTOR

COMMAND
Preamble Gas Pitch Roll Yaw

SEQUENCE NUMBER

SHA256

Interceptor WiFi architecture

PILOT CH:13 CH:12
CH:11

My channel: 13; Target channel:12 My channel: 12
My channel: 12; Target channel:11
My channel: 11 My channel: 11; Target channel:10

DRONE CH:13 CH:12
CH:11
Etc...

@taiksontexas

YAW Indicator

Audit console/camera

Pitch/roll Indicator

Current/target Channel
"Ultimate target" channel WiFi mode: monitor or mon+sta/ap

ADC in voltage Sequence number

MOTOR PWM LEVELS

@taiksontexas

Fallback FM based TX
 For a WiFi complete jamming scenario  Transmit with an arbitrary frequency  Demo in FM band  Transmitting in illegal frequencies are the least
problem for bad guys  Rpi radio transmission causes harmonics.
Really a problem?
@taiksontexas

Fallback FM based TX
http://asliceofraspberrypi.blogspot.com/2014/10/generatingradio-frequencies-using.html
@taiksontexas

Fallback FM based TX

JOYSTICK

4 bytes paPcikloett (RPI)

FSK modulation
RF format conversion

Connected to antenna When timeout

FM modulated transmission

GPIO

control

4 byte For flight control
DRONE
FSK demodulation
Wav audio conversion
SDR FM capture

@taiksontexas

@taiksontexas

Thank you!
Acknowledges:
José Manuel Hernández Jesús Fernández Javier Hernández Vicente Polo Daniel Iglesias Adrian Aznar
David Meléndez Cano R&D Embedded Systems Developer
@taiksontexas
Taiksonprojects.blogspot.com

