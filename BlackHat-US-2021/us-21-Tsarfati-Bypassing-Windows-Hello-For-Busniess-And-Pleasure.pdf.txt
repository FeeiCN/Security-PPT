Bypassing Windows Hello for Business and Pleasure

WHOAMI
 Omer Tsarfati  Security Researcher @ CyberArk Labs  Twitter - @OmerTsarfati  24 years old  6 years in vulnerability research  Call of Duty fan

AGENDA

1st

2nd

3 rd

4th

P a sswo rd le ss Win d o ws He llo Exp lo it in g Wh a t 's Ne xt

BY THE END OF THIS TALK
WINDOWS HELLO AND ITS FEATURS
USB & UVC
CO N F US IO N FUN

85% 50% 10% MAX_ INT%

Part 1: Passwordless and friends

WHY PASSWORDLESS

WEAK P ASSWO RDS

DATA BREACHES

P HISHING ATTACKS

REUSE

HOW PASSWORDLESS

FINGERP RINT

FACE R ECGO N ITIO N

SECURITY KEY

O TP

Part 2: Windows Hello

SAY _ _ _ _ _ TO WINDOWS _ _ _ _ _

P a sswo rd le ss

Win d o ws He llo

EVERYONE CAN USE IT

Win d o ws He llo

En t e rp rise

Do m a in & Azu re a u t h e n t ica t io n

Hom e

Re p la ce s yo u r lo ca l p a sswo rd

FEATURES

FACE RECOGNITION
IR sensor and advanced image analysis

P IN CODE
And it is not the same as password

FINGERP RINT
Same good old fingerprint login

FINGERRINT
DATA
Challanging to capture and modify
P REVIOUS ART
Many public reseraches
P ROTOCOL
Complicated protocol and lack of public implmentation

PIN CODE
AN TI- BR UTEF O R CE
Anti-bruteforce mechanism
SAME CHALLANGE
Same challenge as cracking a password

FACE RECOGNITION
AN TI- BR UTEF O R CE
Anti-bruteforce mechanism
EASY START
NXP implemented a basic USB video camera
P UBLIC DATA
Face images can be captured easily

FACE RECOGNITION

BIOMETRIC AUTH & WINDOWS HELLO

Win b io .d ll

Storage

W BIO S R VC
Engine

Sensor

Win Bio Da t a b a se

Ap p

Face Cred P ro vid e r

BIOMETRIC AUTH & WINDOWS HELLO

Win b io .d ll

Storage

W BIO S R VC
Engine

Sensor

Win Bio Da t a b a se

Ap p

Face Cred P ro vid e r

NXP ­ EVALUATION BOARD

Part 3: Exploiting
show me the money $$$

RESEARCH VECTOR

AN ALYZE
USB & UVC

M IM IC
Mimics `hello` camera

CAP TURE
Capture the target person

EXP LOIT
Bypass Windows Hello

AN ALYZE

USB Specs

ANALYZE

Ca p t u re Tra ffic

ANALYZE ­ USB SP ECS

ANALYZE ­ USB STRUCTURE NICE GUY

ANALYZE ­ USB STRUCTURE

NICE GUY

HO S Tin

Bu lly

ANALYZE ­ USB STRUCTURE
De vice De scrip t o r
Co n fig u ra t io n De scrip t o r
In t e rfa ce De scrip t o r

En d p o in t De scrip t o r

En d p o in t De scrip t o r

ANALYZE ­ USB STRUCTURE
Device De scrip t o r

ANALYZE ­ USB STRUCTURE
Device De scrip t o r

ANALYZE ­ USB STRUCTURE
Device De scrip t o r

ANALYZE ­ USB STRUCTURE
De vice De scrip t o r
Co n fig u ra t io n De scrip t o r
In t e rfa ce De scrip t o r

Endpoint De scrip t o r

En d p o in t De scrip t o r

ANALYZE ­ USB STRUCTURE
Configuration De scrip t o r

ANALYZE ­ USB STRUCTURE
De vice De scrip t o r
Co n fig u ra t io n De scrip t o r
In t e rfa ce De scrip t o r

Endpoint De scrip t o r

En d p o in t De scrip t o r

ANALYZE ­ USB STRUCTURE
Configuration De scrip t o r

ANALYZE ­ USB STRUCTURE NICE GUY

Wireshark to the rescue!

Wireshark to the rescue!

ANALYZE

USB Specs

 USB 2.0 Specs  https://www.usb.org/document-library/usb-20-specification
 USB in a Nutshell  A summary of USB Chapter 9.5  https://www.beyondlogic.org/usbnutshell/usb5.shtml

M IM IC

Implementation

M IM IC

Co m p a t ib a le W/ Win He llo

MIMIC
 Download NXP IDE  MCUXpresso
 Import an SDK example project  usb_examples -> dev_video_virtual_camera_bm

MIMIC
 Configure the example project with the extracted descriptors  Added support for two cameras  We connected the USB device to the computer AND....

MIMIC

MIMIC

MIMIC

MIMIC

MIMIC

MIMIC

CAP TURE

Ca p t u re co lo r fra m e s

CAPTURE

Ca p t u re IR fra m e s

CAP TURE
Data Transfer

CAPTURE

CAP TURE
Data Transfer

CAP TURE
Data Transfer
https://docs.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-camera-implementation-guide#ir-stream

EXPLOIT

EXP LOIT

BYP ASS

EXP LOIT

PyShark

Sa ve

P ro fit

EXP LOIT

PyShark

Sa ve

P ro fit

EXPLOIT

MS Media Fra m e wo rk

Sa ve

P ro fit

EXP LOIT
IT'S DEMO TIME!

EXPLOIT
1. The attacker captures or creates an Infra-Red (IR) image of the victim

2. The attacker creates a custom USB device that impersonates a USB camera
device

Attacker

3. The attacker saves the captured data on a custom
USB device

4. The Attacker connects the custom USB device to
John's computer. The USB device transmits
the captured IR image

John's Laptop

John
6. The attacker gets access to sensitive information and files of
the victim
5. The biometrical system accepts the biometrical
credentials and logs the user in

Part 4 : Wh a t 's n e xt
You say goodbye and I say...

What 's n e xt

Co n ve rt in g Co lo r Im a g e
t o IR

Ma n ip u la t in g Bio Da t a b a se

Fu zzin g

Closing Remarks

USB

2 nd Password less

Windows Hello

4th FUN

1st

3rd

Closing Remarks
Do n 't b a se yo u r a u t h e n t ica t io n o n a p u b lic fa ct o r

Closing Remarks
 Blo g p o st  h t t p s:/ / www.cyb e ra rk.co m / re so u rce s/ t h re a t -re se a rch -b lo g / b yp a ssin g -win d o wsh e llo -wit h o u t -m a sks-o r-p la st ic-su rg e ry
 CVE-2 0 2 1 -3 4 4 6 6  h t t p s:/ / m src.m icro so ft .co m / u p d a t e -g u id e / e n -US/ vu ln e ra b ilit y/ CVE-2 0 2 1 -3 4 4 6 6

Thank you!
@Om e rTsa rfa t i

