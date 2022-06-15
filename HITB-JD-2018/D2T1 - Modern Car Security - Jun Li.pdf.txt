Modern Car Security
Jun Li @bravo_fighter Unicorn Team
360 Security Technology
JD-HITBSECCONF 2018 BEIJING

Member of

Who Am I ?
Founder of

Speaker of

...

Who Am I ?
Author&Co-author of

Who Am I ?
Contributor of

What I am going to talk 
Ø Intro of Modern Cars Ø Attack Surface of Modern Cars Ø The PastSome Vulnerabilities Ø The Present Some Remediations Ø The FutureSome Suggestions

Intro of Modern Cars
Ø Intro of Modern Cars Ø Attack Surface of Modern Cars Ø The PastSome Vulnerabilities Ø The Present Some Remediations Ø The FutureSome Suggestions

Modern Cars

Intro of Modern Cars

Electronized & Connected

http://www.autosec.org/pubs/cars-usenixsec2011.pdf

Modern Cars

Intro of Modern Cars

Electronized & Connected

L

R NW TM W

SW O

VU W

I. J F EAAE
F

Modern Cars

Intro of Modern Cars

Electronized & Connected

Sensing

Computing

Actuating

Modern Cars

Intro of Modern Cars

Electronized & Connected

X-by ­wire

Modern Cars

Intro of Modern Cars

Electronized & Connected

Music Player

Instrument Panel

INS

ESP TCU ACC ... CAN-C EMU

Gateway

Infotainment

ESPelectronic stability program
EMUengine management system
TCUtransmission control unit ACCadaptive cruise control
INSInertial navigation system

Seat Control

CAN-B

Modern Cars

Intro of Modern Cars

Electronized & Connected

Image source :http://telematicswire.net/connected-cars-and-the-role-of-telematics-in-the-future-of-intelligent-transport/

Self-driving Cars

Intro of Modern Cars

With Various Sensors

Self-driving Cars

Intro of Modern Cars

With Various Sensors

Attack Surface of Modern Cars
Ø Intro of Modern Cars Ø Attack Surface of Modern Cars Ø The PastSome Vulnerabilities Ø The Present Some Remediations Ø The FutureSome Suggestions

Attack Surface of Modern Cars
Attack Surface of Modern Cars

Supply Chain
Attack
eg. Vulnerable Parts Service Center Employee Vulnerable Manufacture
Backend etc.

Local and
Physical
Attack
eg. OBD Port USB Port SD Card Slots
etc.

Remote
Attack
eg. Bluetooth
Wifi Celluar Mobile APP Cloud Platform
etc.

The PastSome Vulnerabilities
Ø Intro of Modern Cars Ø Attack Surface of Modern Cars Ø The PastSome Vulnerabilities Ø The Present Some Remediations Ø The FutureSome Suggestions

The PastSome Vulnerabilities
Anti-theft System Security Vulnerabilities

Hitag2

DST40
Digital signature transponder
40bit key length

Mobile Phone (Bluetooth/Celluar)

The PastSome Vulnerabilities
Hitag2 is Vulnerable
https://www.usenix.org/sites/default/files/conference/protectedfiles/verdult_usenixsecurity12_slides.pdf https://www.usenix.org/system/files/conference/usenixsecurity12/sec12-final95.pdf

The PastSome Vulnerabilities
Passive Keyless Entry System Relay Attack

The PastSome Vulnerabilities
Passive Keyless Entry System Relay Attack

The PastSome Vulnerabilities
Passive Keyless Entry System Relay Attack
https://eprint.iacr.org/2010/332.pdf

The PastSome Vulnerabilities
Passive Keyless Entry System Relay Attack

The PastSome Vulnerabilities
Passive Keyless Entry System Relay Attack

The PastSome Vulnerabilities
Passive Keyless Entry System Key-fob Cloning Attack (DST40)
(with identifier) DST40
https://www.esat.kuleuven.be/cosic/fast-furious-and-insecure-passive-keyless-entry-and-start-in-modern-supercars/

The PastSome Vulnerabilities
Passive Keyless Entry System Key-fob Cloning Attack (DST40)
Paper that REed DST40 in 2005 https://www.usenix.org/legacy/event/sec05/tech/bono/bono.pdf Crypto Implementation on FPGAhttps://github.com/jok40/dst40

The PastSome Vulnerabilities
Passive Keyless Entry System Key-fob Cloning Attack (DST40)
https://www.esat.kuleuven.be/cosic/fast-furious-and-insecure-passive-keyless-entry-and-start-in-modern-supercars/

The PastSome Vulnerabilities
Passive Keyless Entry System Key-fob Cloning Attack By Exploiting Vulnerable Crypto---DST40
Credit goes to Researchers from @CosicBe

The PastSome Vulnerabilities
Steal Cars Via Celluar Network
https://www.heise.de/ct/artikel/Beemer-Open-Thyself-Security-vulnerabilities-in-BMWs-ConnectedDrive-2540957.html

The PastSome Vulnerabilities
Steal Cars Via Celluar Network

The Telematics Unit

SPI

Mobile

GSM/GPRS/EDGE Link

V850

modem

SysmoBTS
nanoBTS

Mobile Link& Internet
server

Plaintext

Ciphertext

Traffic is encrypted by the modem ----> reverse engineer the modem

The PastSome Vulnerabilities
Steal Cars Via Celluar Network
Dump and Reverse Engineer the Firmware

The PastSome Vulnerabilities
Steal Cars Via Celluar Network
Discoveries in The Firmware
Encryption Algorithms Ø DES56bit Key Ø AES128 Message Signature Authentication Algorithms Ø DES CBC-MAC Ø HMAC-SHA1 Ø HMAC-SHA256 Encryption Keys 16 Pairs of 64bit Keys

The PastSome Vulnerabilities
Steal Cars Via Celluar Network
Fake Basestation SysmoBTS
nanoBTS
Impersonated Server

The PastSome Vulnerabilities
Remote Physics Control

2010 2012

NSF 2011 DARPA 2015

The PastSome Vulnerabilities
Remote Physics Control

B

B A E F C EJ

Internet Sprint Femotocell WiFi

CAN

B A E F C EJ H D D AG C J C

C

CD D

The PastSome Vulnerabilities
Vulnerabilities of Self-driving Cars
Vulnerable Perception

The PastSome Vulnerabilities
Vulnerabilities of Self-driving Cars
Vulnerable Perception

The PastSome Vulnerabilities
Privacy Leak of V2X

The Present Some Remediation
Ø Intro of Modern Cars Ø Attack Surface of Modern Cars Ø The PastSome Vulnerabilities Ø The Present Some Remediations Ø The FutureSome Suggestions

The Present Some Remediation
Hardware Security
· Secure Elements in ECUs · Firmware Encryption&Verification · Mutual Authentication Among ECUs ·...

The Present Some Remediation
Communication Security
Radio Distance Bounding
https://www.usenix.org /legacy/event/sec10/tech/full_papers/Rasmussen.pdf

The Present Some Remediation
Communication Security
Anonymization

The Present Some Remediation
Communication Security
Secure Over-The-Air Patch
https://www.iot-now.com/2017/02/27/59018-securing-automotive-air-updates/

The Present Some Remediation
Communication Security
When You Design Vehicle Communication System
Do NOT Trust Anyone On The Communication Link , Only Rely On What You Have Absolute Control Over to Implement Your Security. Because: · 2G Had Been Broken · 3G,4G Already Have Minor Bugs and Will
Eventually be Broken · 5G Will be Broken · Wifi, Bluetooth ? · "What man makes, man breaks"

Cloud Security

The Present Some Remediation

The FutureSome Suggestions
Ø Intro of Modern Cars Ø Attack Surface of Modern Cars Ø The PastSome Vulnerabilities Ø The Present Some Remediations Ø The FutureSome Suggestions

The Future Some Suggestions
Implementation of Anti-Hacking Features

The Future Some Suggestions

Implementation of Anti-Hacking Features

A J E E A DJDE

Realtime CAN data stream

Parameter extraction

Cross Prediction

Calculate one parameter using the remaining parameters
Use all the parameters at time t-n to t-1to predict the value at time t We Choose this

MSE=Mean Square Error

The Future Some Suggestions
Research & Implementation of Anti-Hacking Features

The Future Some Suggestions
Cooperation on Drafting&Following Standards

The Future Some Suggestions
Cooperation with Security Companies

The Future Some Suggestions
Open To Security Community

Q&A
Just Shoot ;)

The Endless

Thanks

