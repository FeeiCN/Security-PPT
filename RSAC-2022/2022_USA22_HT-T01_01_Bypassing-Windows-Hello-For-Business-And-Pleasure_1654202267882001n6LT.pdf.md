#RSAC
SESSION ID: HT-T01
Bypassing Windows Hello for Business and Pleasure
Omer Tsarfati
Security Researcher CyberArk Labs @OmerTsarfati

#RSAC
WHOAMI
 Omer Tsarfati  Security Researcher @ CyberArk Labs  Twitter - @OmerTsarfati  24 years old  7 years in vulnerability research  Call of Duty fan

#RSAC
AGENDA

1st

2nd

3rd

4th

Passwordless Windows Hello Exploiting What's Next

BY THE END OF THIS TALK
WINDOWS HELLO AND ITS FEATURS
USB & UVC
CONFUSION FUN

#RSAC
85% 50% 10% MAX_INT%

#RSAC
Part 1: Passwordless and friends

#RSAC
WHY PASSWORDLESS

WEAK PASSWORDS

DATA BREACHES

PHISHING ATTACKS

REUSE

#RSAC
HOW PASSWORDLESS

FINGERPRINT

FACE RECGONITION

SECURITY KEY

OTP

#RSAC
Part 2: Windows Hello

#RSAC
SAY _____ TO WINDOWS _____

Passwordless

Windows Hello

Windows Hello

#RSAC
EVERYONE CAN USE IT

Enterprise

Domain & Azure authentication

Home

Replaces your local password

FEATURES

#RSAC
FACE RECOGNITION
IR sensor and advanced image analysis

PIN CODE
And it is not the same as password

FINGERPRINT
Same good old fingerprint login

#RSAC
FINGERRINT
DATA
Challanging to capture and modify
PREVIOUS ART
Many public reseraches
PROTOCOL
Complicated protocol and lack of public implmentation

PIN CODE

#RSAC
ANTI-BRUTEFORCE
Anti-bruteforce mechanism

SAME CHALLANGE
Same challenge as cracking a password

#RSAC
FACE RECOGNITION
ANTI-BRUTEFORCE
Anti-bruteforce mechanism
EASY START
NXP implemented a basic USB video camera
PUBLIC DATA
Face images can be captured easily

#RSAC
FACE RECOGNITION

#RSAC
BIOMETRIC AUTH & WINDOWS HELLO

Winbio.dll

Storage

WBIOSRVC
Engine

Sensor

WinBioDatabase

App

Face Cred Provider

#RSAC
BIOMETRIC AUTH & WINDOWS HELLO

Winbio.dll

Storage

WBIOSRVC
Engine

Sensor

WinBioDatabase

App

Face Cred Provider

#RSAC
NXP ­ EVALUATION BOARD

#RSAC
Part 3: Exploiting
show me the money $$$

#RSAC
RESEARCH VECTOR

ANALYZE
USB & UVC

MIMIC
Mimics `hello` camera

CAPTURE
Capture the target person

EXPLOIT
Bypass Windows Hello

#RSAC
ANALYZE

USB Specs

ANALYZE

Capture Traffic

#RSAC
ANALYZE ­ USB SPECS

#RSAC
ANALYZE ­ USB STRUCTURE
NICE GUY

ANALYZE ­ USB STRUCTURE NICE GUY

#RSAC
HOSTin

Bully

#RSAC
ANALYZE ­ USB STRUCTURE
Device Descriptor
Configuration Descriptor
Interface Descriptor

Endpoint Descriptor

Endpoint Descriptor

#RSAC
ANALYZE ­ USB STRUCTURE
Device Descriptor

#RSAC
ANALYZE ­ USB STRUCTURE
Device Descriptor

#RSAC
ANALYZE ­ USB STRUCTURE
Device Descriptor

#RSAC
ANALYZE ­ USB STRUCTURE
Device Descriptor
Configuration Descriptor
Interface Descriptor

Endpoint Descriptor

Endpoint Descriptor

#RSAC
ANALYZE ­ USB STRUCTURE
Configuration Descriptor

#RSAC
ANALYZE ­ USB STRUCTURE
Device Descriptor
Configuration Descriptor
Interface Descriptor

Endpoint Descriptor

Endpoint Descriptor

#RSAC
ANALYZE ­ USB STRUCTURE
Configuration Descriptor

#RSAC
ANALYZE ­ USB STRUCTURE
NICE GUY

#RSAC
Wireshark to the rescue!

#RSAC
Wireshark to the rescue!

#RSAC
ANALYZE

USB Specs

 USB 2.0 Specs  https://www.usb.org/document-library/usb-20-specification
 USB in a Nutshell  A summary of USB Chapter 9.5  https://www.beyondlogic.org/usbnutshell/usb5.shtml

#RSAC
MIMIC

Implementation

MIMIC

Compatibale W/ Win Hello

MIMIC
 Download NXP IDE  MCUXpresso
 Import an SDK example project  usb_examples -> dev_video_virtual_camera_bm

#RSAC

MIMIC
 Configure the example project with the extracted descriptors  Added support for two cameras  We connected the USB device to the computer AND....

#RSAC

#RSAC
MIMIC

#RSAC
MIMIC

#RSAC
MIMIC

#RSAC
MIMIC

#RSAC
MIMIC

#RSAC
MIMIC

#RSAC
CAPTURE

Capture color frames

CAPTURE

Capture IR frames

#RSAC
CAPTURE
Data Transfer

#RSAC
CAPTURE

#RSAC
CAPTURE
Data Transfer

#RSAC
CACPATPUTRUERE
Data Transfer
https://docs.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-camera-implementation-guide#ir-stream

#RSAC
EXPLOIT

EXPLOIT

BYPASS

#RSAC
EXPLOIT

PyShark

Save

Profit

#RSAC
EXPLOIT

PyShark

Save

Profit

#RSAC
EXPLOIT

MS Media Framework

Save

Profit

#RSAC
EXPLOIT
IT'S DEMO TIME!

#RSAC

EXPLOIT
1. The attacker captures or creates an Infra-Red (IR) image of the victim

#RSAC

2. The attacker creates a custom USB device that impersonates a
USB camera device

Attacker

3. The attacker saves the captured data on a custom USB
device
4. The Attacker connects the custom USB device to John's computer. The USB device transmits the captured IR image

John's Laptop

John
6. The attacker gets access to sensitive information and files of the victim
5. The biometrical system accepts the biometrical credentials
and logs the user in

#RSAC
Part 4: What's next
You say goodbye and I say...

#RSAC
What's next

Converting Color Image
to IR

Manipulating Bio Database

Fuzzing

Closing Remarks

2nd

Windows

USB

Hello

Passwordless

1st

3rd

#RSAC
4th FUN

#RSAC
Apply - Customers
 Make sure your computer OS is updated  Don't base your authentication on public factors  Make sure you combine biometric authentication with other authentication factors  Microsoft published mitigations for the vulnerability
 Some of them are optional - enable them too

#RSAC
Apply ­ Reseachers / Developers
 Biometric systems can be compromised  Dev - Create `trust' between the sensor and your system  Research ­ Attack the sensors
 Creating trust with external sensors is challenging  Dev ­ When possible -> disable external sensors  Research ­ A weak node in the chain

#RSAC
Mitigations + Blog post
 CVE-2021-34466  https://msrc.microsoft.com/update-guide/en-US/vulnerability/CVE-2021-34466  CVE-2021-34466
 KB5005478  https://support.microsoft.com/en-us/topic/kb5005478-windows-hello-cve-2021-34466-6ef266bbc68a-4083-aed6-31d7d9ec390e

#RSAC
Thank you!
@OmerTsarfati

