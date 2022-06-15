//

GoBack

Mobile Authentication Subspace Travel
Markus Vervier
May 28th, 2015

whoami

whoami Intro / What it's all about May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features
Goodie
Conclusion

 Markus Vervier / @marver  Background in security for over 10 years  Main interests:
 Firmware  Network Security  Mobile Networks  Finding Bugs  Security Design
 Working as Security Researcher and Penetration Tester for LSE Leading Security Experts GmbH

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 2

whoami
Intro / What it's all about Topics of this Talk Authentication (Birds Eye)
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features
Goodie
Conclusion

Intro / What it's all about

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 3

Topics of this Talk

whoami
Intro / What it's all about Topics of this Talk Authentication (Birds Eye)
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features
Goodie
Conclusion

 Authentication in mobile networks  How millions of devices are exposing SIM-Cards  How to have fun with baseband firmware  Using this to foward mobile network authentication

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 4

Authentication (Birds Eye)

whoami

Intro / What it's all about Topics of this Talk Authentication (Birds Eye)

May we Borrow your Identity for a While?

SIM Access

Baseband

Adding Features

Goodie Conclusion

1
 SIM-Card authenticates a user / his contract  Provider AuC and SIM-Card share a secret key Ki  Challenge-Response Network-Authentication between
Mobile-Equipment (ME) and Network

 Users have no access to Ki

1Source: UMTS Security, Valtteri, Niemi and Kaisa Nyberg

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 5

whoami Intro / What it's all about May we Borrow your Identity for a While? A Misconception
SIM Access
Baseband
Adding Features
Goodie
Conclusion

May we Borrow your Identity for a While?

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 6

A Misconception

whoami Intro / What it's all about May we Borrow your Identity for a While? A Misconception
SIM Access
Baseband
Adding Features
Goodie
Conclusion

 Naive Idea: Authentication is secured by having a "secure" SIM device that does it

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 7

A Misconception

whoami Intro / What it's all about May we Borrow your Identity for a While? A Misconception
SIM Access
Baseband
Adding Features
Goodie
Conclusion

 Naive Idea: Authentication is secured by having a "secure" SIM device that does it

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 7

A Misconception

whoami Intro / What it's all about May we Borrow your Identity for a While? A Misconception
SIM Access
Baseband
Adding Features
Goodie
Conclusion

 Naive Idea: Authentication is secured by having a "secure" SIM device that does it

 Temporary Authentication tokens are derived from the secret key Ki on the SIM
 Then they leave the SIM!  They are valid on their own for a time!

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 7

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

SIM Access

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 8

SIM-Usage

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

 Baseband manages the SIM-Card  Sends command APDUs to the SIM-Card and processes
responses  Passes stuff like SMS, SIM-Tookit, etc. to the AP

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 9

Retrieving Authentication

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

 No direct access to SIM by AP  But there are indirect methods:
 AT-Command-Interfaces accessible via Bluetooth / USB  Vendor specific: Internal Android RIL calls

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 10

SIM-Card-Access via AT+CSIM

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

Command Syntax: AT+CSIM=<length>,<command> Response Syntax: +CSIM:<length>,<response>
 Nobody listened to security advice from 3GPP 27.007: "Care must be exercised in AT commands that allow the TE to take unintentionally control over the SIM-MT interface (e.g. +CSIM);"
Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 11

Unprivileged Apps can Talk to the SIM

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

 Should have no SIM access withtout privileges  AT-Command-Prompt found on /dev/pts/XX on
MTK-Devices  Bug: Permissions 0777 on older Alcatel Android devices!  Unprivileged apps can query the SIM-Card via AT+CSIM  Also other methods for SIM-Access at other vendors
(Samsung Galaxy S2 / S3)

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 12

SIM-Card-Access Demo

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

Mobile Authentication Subspace Travel

DEMO

HITBSecConf2015 - Amsterdam ­ 13

Command-APDU

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

CLA (Class)

P1 (Algorithm) Lc (Length of Payload)

AT+CSIM=46,"00|88|00|80|11|FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"

P2 (Key Reference INS (Command)

RAND

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 14

Response-APDU

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

SRES

APDU Result Code

+CSIM: 32, "04799AFC|13083F18786C33995BB8|9000" Kc

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 15

Enter AT+EAUTH

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

 Problem: AT+CSIM does not work on recent devices  Solution: Vendors added new commands to help  Dedicated commands for authentication: AT+EAUTH and
AT+ESIMAUTH  Used for EAP-SIM / EAP-AKA e.g. to authenticate to a
WiFi using a SIM  Also used to retrieve authentication to connect to a mobile
network

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 16

SIM-Card-Access via BT-SAP

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

 Purpose: Interoperability CarPhone  Solution: Sim Access Profile  Allows remote SIM usage via Bluetooth  Specified in Bluetooth DOC: SAP SPEC  Great! A Specified way to leak your network authentication!

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 17

Dial Up Networking

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

 USB or Bluetooth  Works via AT-Commands  Exposes a serial device  Present on millions of older mobile phones  Often exposed without user notification and interaction
 What could possibly go wrong?

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 18

Dial Up Networking

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

 USB or Bluetooth  Works via AT-Commands  Exposes a serial device  Present on millions of older mobile phones  Often exposed without user notification and interaction
 What could possibly go wrong?

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 18

Dial Up Networking

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

 USB or Bluetooth  Works via AT-Commands  Exposes a serial device  Present on millions of older mobile phones  Often exposed without user notification and interaction
 What could possibly go wrong?

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 18

USB Modem Demo

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

Mobile Authentication Subspace Travel

DEMO

HITBSecConf2015 - Amsterdam ­ 19

A Blackhat Telco Operator

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

 How many systems in the world are part of botnets?

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 20

A Blackhat Telco Operator

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

 How many systems in the world are part of botnets?  Over 9000 for sure!

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 20

A Blackhat Telco Operator

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

 How many mobile phones are connected regularly to these systems via USB?

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 21

A Blackhat Telco Operator

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

 How many mobile phones are connected regularly to these systems via USB?
 A lot!

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 21

A Blackhat Telco Operator

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
SIM-Usage
Retrieving Authentication SIM-Card-Access via AT+CSIM Unprivileged Apps can Talk to the SIM SIM-Card-Access Demo CommandAPDU
Response-APDU
Enter AT+EAUTH SIM-Card-Access via BT-SAP Dial Up Networking
USB Modem Demo A Blackhat Telco Operator
A Blackhat Telco Operator

 How many mobile phones are connected regularly to these systems via USB?
 A lot!  Attacker-Goal: Authenticate to a mobile network using stolen
credentials  As seen above: a lot of mobile phones expose their SIM cards  A big pool of vulnerable devices available for malicious
purposes!

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 21

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband What about it? Baseband Overview Baseband Hardware Baseband Firmware Interfaces between AP and BP CCCI / CCIF Baseband Firmware Structure Baseband Firmware DEMO
Adding Features
Goodie
Conclusion

Baseband

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 22

What about it?

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband What about it? Baseband Overview Baseband Hardware Baseband Firmware Interfaces between AP and BP CCCI / CCIF Baseband Firmware Structure Baseband Firmware DEMO
Adding Features
Goodie
Conclusion

 Acquire valid authentication vectors from a remote SIM  What to do with it?  We can forward authentication to a custom mobile device  Boring - everyone wants off the shelf phones!  So let's take a stock baseband firmware and modify it!

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 23

Baseband Overview

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband What about it? Baseband Overview Baseband Hardware Baseband Firmware Interfaces between AP and BP CCCI / CCIF Baseband Firmware Structure Baseband Firmware DEMO
Adding Features
Goodie
Conclusion

 Takes care of communication with the mobile network  Has direct access to the SIM-Card  Usually proprietary  Runs on (somewhat) separate CPU

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 24

Baseband Hardware

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband What about it? Baseband Overview Baseband Hardware Baseband Firmware Interfaces between AP and BP CCCI / CCIF Baseband Firmware Structure Baseband Firmware DEMO
Adding Features
Goodie
Conclusion

 Only a few significant vendors: Qualcomm, MediaTek, Spreadtrum, Marvell and Intel
 Focus here: MediaTek Plaforms
 Other BaseBand vendors are more locked down today
 A lot of previous work regarding Qualcomm
Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 25

Baseband Firmware

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband What about it? Baseband Overview Baseband Hardware Baseband Firmware Interfaces between AP and BP CCCI / CCIF Baseband Firmware Structure Baseband Firmware DEMO
Adding Features
Goodie
Conclusion

 MTK Baseband based on Nucleus RTOS  Loaded at boot-time by the Android-System running on the
AP from "/etc/firmware/modem*.img"  MTK-Linux-Kernel-Module takes care of it  Firmware on many MTK-Based-Phones not signed  Logical separation between Baseband/Modem (BP) and
Application-Processor (AP)  Communication between AP and BP: Shared RAM, UART

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 26

Interfaces between AP and BP

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband What about it? Baseband Overview Baseband Hardware Baseband Firmware Interfaces between AP and BP CCCI / CCIF Baseband Firmware Structure Baseband Firmware DEMO
Adding Features
Goodie
Conclusion

 AP and BP are logically separated but they have a lot of intersections
 On the AP side exposed as char devices or via kernel (ioctls)  Modem-RMMI: AT-Commands  Debug-Output  Firmware-Control via AP (Reset, Exception Handling, etc.)

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 27

CCCI / CCIF

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband What about it? Baseband Overview Baseband Hardware Baseband Firmware Interfaces between AP and BP CCCI / CCIF Baseband Firmware Structure Baseband Firmware DEMO
Adding Features
Goodie
Conclusion

 CCCI (Cross Core Communication Interface): Handles data exchange between AP and BP
 Exposed as different kernel drivers on the AP side  Character devices (/dev/ccci*)  Low-Level (CPU to CPU Interface called CCIF according to
MTK-Docs) for MT6582:
 16 Physical channels (8 APMD, 8 MDAP)  One 256bytes dual port SRAM

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 28

Baseband Firmware - Structure

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband What about it? Baseband Overview Baseband Hardware Baseband Firmware Interfaces between AP and BP CCCI / CCIF Baseband Firmware Structure Baseband Firmware DEMO
Adding Features
Goodie
Conclusion

 Uncompressed raw binary  Partial image of the memory space starting at address
0x00000000  No virtual memory  Contains a trailer at the end

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 29

Baseband Firmware - DEMO

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband What about it? Baseband Overview Baseband Hardware Baseband Firmware Interfaces between AP and BP CCCI / CCIF Baseband Firmware Structure Baseband Firmware DEMO
Adding Features
Goodie
Conclusion

Mobile Authentication Subspace Travel

DEMO

HITBSecConf2015 - Amsterdam ­ 30

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features Remote SIM Remote SIM Concept ShadowSIM ShadowSIM Concept ShadowSIM Baseband Communication ShadowSIM Firmware Modification ShadowSIM DEMO Wait a Minute
Goodie
Conclusion

Adding Features

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 31

Remote SIM

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features Remote SIM Remote SIM Concept ShadowSIM ShadowSIM Concept ShadowSIM Baseband Communication ShadowSIM Firmware Modification ShadowSIM DEMO Wait a Minute
Goodie
Conclusion

 Goal: Transfer SIM commands to a remote mobile phone ­ but how?

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 32

Remote SIM

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features Remote SIM Remote SIM Concept ShadowSIM ShadowSIM Concept ShadowSIM Baseband Communication ShadowSIM Firmware Modification ShadowSIM DEMO Wait a Minute
Goodie
Conclusion

 Goal: Transfer SIM commands to a remote mobile phone ­ but how?
 Modern phones have additional communication channels besides the mobile network
 Bluetooth  Dual-SIM  Data Connection of a second SIM  WiFi

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 32

Remote SIM

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features Remote SIM Remote SIM Concept ShadowSIM ShadowSIM Concept ShadowSIM Baseband Communication ShadowSIM Firmware Modification ShadowSIM DEMO Wait a Minute
Goodie
Conclusion

 Goal: Transfer SIM commands to a remote mobile phone ­ but how?
 Modern phones have additional communication channels besides the mobile network
 Bluetooth  Dual-SIM  Data Connection of a second SIM  WiFi
 BT-SAP (Sim-Application-Protocol) - works only for short distances
 SIM commands can travel through unintended channels i.e. over TCP/IP

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 32

Remote SIM Concept

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features Remote SIM Remote SIM Concept ShadowSIM ShadowSIM Concept ShadowSIM Baseband Communication ShadowSIM Firmware Modification ShadowSIM DEMO Wait a Minute
Goodie
Conclusion

Proxy

Internet

Mobile Authentication Subspace Travel

Wifi HITBSecConf2015 - Amsterdam ­ 33

ShadowSIM

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features Remote SIM Remote SIM Concept ShadowSIM ShadowSIM Concept ShadowSIM Baseband Communication ShadowSIM Firmware Modification ShadowSIM DEMO Wait a Minute
Goodie
Conclusion

 Allows usage of remote SIM-Cards  Download from:
https://github.com/shadowsim/shadowsim

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 34

ShadowSIM

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features Remote SIM Remote SIM Concept ShadowSIM ShadowSIM Concept ShadowSIM Baseband Communication ShadowSIM Firmware Modification ShadowSIM DEMO Wait a Minute
Goodie
Conclusion

 Allows usage of remote SIM-Cards  Download from:
https://github.com/shadowsim/shadowsim  Implements a virtual SIM-Card by patching the
Baseband-Firmware of a Mediatek 6573 phone:
1. Identify the code that enables SIM-Access 2. Change it to send APDUs to the AP and read
Response-APDUs

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 34

ShadowSIM

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features Remote SIM Remote SIM Concept ShadowSIM ShadowSIM Concept ShadowSIM Baseband Communication ShadowSIM Firmware Modification ShadowSIM DEMO Wait a Minute
Goodie
Conclusion

 Allows usage of remote SIM-Cards  Download from:
https://github.com/shadowsim/shadowsim  Implements a virtual SIM-Card by patching the
Baseband-Firmware of a Mediatek 6573 phone:
1. Identify the code that enables SIM-Access 2. Change it to send APDUs to the AP and read
Response-APDUs
 Implement a native Android-Application that processes APDU-Commands:
1. Read a Command-APDU sent by the Baseband 2. Send them over TCP to a remote system having
SIM-Access 3. Write the Response-APDU back to Baseband

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 34

ShadowSIM - Concept
whoami Intro / What it's all about May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features Remote SIM Remote SIM Concept ShadowSIM ShadowSIM Concept ShadowSIM Baseband Communication ShadowSIM Firmware Modification ShadowSIM DEMO Wait a Minute
Goodie
Conclusion
Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 35

ShadowSIM - Baseband Communication

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features Remote SIM Remote SIM Concept ShadowSIM ShadowSIM Concept ShadowSIM Baseband Communication ShadowSIM Firmware Modification ShadowSIM DEMO Wait a Minute
Goodie
Conclusion

 First idea: Use one of the UARTs as a communication channel to AP
 Was a bad idea: UART communication is done asynchronous in Baseband, so lots of work writing and registering your own handler
 Easier: Using shared memory  Vendor application for debugging: mdlogger already uses
shared memory for log transfer  Source code is published, so changing it for our purpose was
easy

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 36

ShadowSIM - Firmware Modification

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features Remote SIM Remote SIM Concept ShadowSIM ShadowSIM Concept ShadowSIM Baseband Communication ShadowSIM Firmware Modification ShadowSIM DEMO Wait a Minute
Goodie
Conclusion

 Things that help:
 Lots of assertions and debugging strings in the code  MediaTek firmware for various devices sometimes has
Debug-Symbols  MediaTek reuses code a lot (made it easier to compare
different firmwares)  No obfuscation
 In general the code is quite well structured and functionality is abstract - this makes patching easier

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 37

ShadowSIM - DEMO

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features Remote SIM Remote SIM Concept ShadowSIM ShadowSIM Concept ShadowSIM Baseband Communication ShadowSIM Firmware Modification ShadowSIM DEMO Wait a Minute
Goodie
Conclusion

DEMO

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 38

Wait a Minute
whoami Intro / What it's all about May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features Remote SIM Remote SIM Concept ShadowSIM ShadowSIM Concept ShadowSIM Baseband Communication ShadowSIM Firmware Modification ShadowSIM DEMO Wait a Minute
Goodie
Conclusion
Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 39

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features
Goodie Hardening SIM Application Toolkit (STK / SAP) Patching DEMO
Conclusion

Goodie

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 40

Hardening

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features
Goodie Hardening SIM Application Toolkit (STK / SAP) Patching DEMO
Conclusion

 What else can we patch?  Objective: Have a more secure baseband firmware.  Best way: Create a new one from scratch.  In the meantime: Patch existing ones.  Always an improvement for security: Reducing the attack
surface  So let's turn off stuff!

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 41

SIM Application Toolkit (STK / SAP)

whoami
Intro / What it's all about
May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features
Goodie Hardening SIM Application Toolkit (STK / SAP) Patching DEMO
Conclusion

 Can work outside of user control  "value addded services"  OTA commands sent to / via your SIM  Used for attacks and surveillance  Probably unwanted in "hostile" environments

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 42

Patching - DEMO
whoami Intro / What it's all about May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features
Goodie Hardening SIM Application Toolkit (STK / SAP) Patching DEMO
Conclusion

DEMO

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 43

whoami Intro / What it's all about May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features
Goodie
Conclusion Results-Recap THANK YOU

Conclusion

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 44

Results-Recap

whoami Intro / What it's all about May we Borrow your Identity for a While?
SIM Access
Baseband
Adding Features
Goodie
Conclusion Results-Recap THANK YOU

 Credentials can be acquired from a SIM card  On many devices even over USB  Dual-Use:
 Bad: Bad guys may steal your network identity  Good: New applications that free users from SIM cards,
allow them to share SIM cards
 Non-Repudiation is gone for good ­ a SIM-Card in a mobile phone proves nothing
 When your security model is from the 80s chances are high it doesn't work anymore
 If YOU have ideas on what features to add / remove in a baseband firmware, contact me!

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 45

THANK YOU
whoami Intro / What it's all about May we Borrow your Identity for a While? SIM Access Baseband Adding Features Goodie Conclusion Results-Recap THANK YOU

Mobile Authentication Subspace Travel

HITBSecConf2015 - Amsterdam ­ 46

