Relay Attacks in EMV Contactless Cards with Android OTS Devices
Jose´ Vila, Ricardo J. Rodr´iguez pvtolkien@gmail.com, rj.rodriguez@unileon.es
All wrongs reversed

Computer Science and Systems Engineering Dept. University of Zaragoza, Spain

Research Institute of Applied Sciences in Cybersecurity
University of Leo´ n, Spain

May 28, 2015
Hack in the Box 2015 Amsterdam (Nederland)

About us

Pepe Vila Security Consultant at E&Y
tw: @cgvwzq
http://vwzq.net

Dr. Ricardo J. Rodr´iguez Senior Security Researcher at ULE
tw: @RicardoJRodriguez
http://www.ricardojrodriguez.es

Main research interests </JavaXSScript>and client-side attacks NFC security Android internals

Main research interests Security/safety modelling and analysis of ICS Advanced malware analysis NFC security

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 2 / 36

Agenda
1 Introduction
2 Background EMV Contactless Cards Relay Attacks and Mafia Frauds
3 Android and NFC: A Tale of L ve Evolution of NFC Support in Android Practical Implementation Alternatives in Android
4 Relay Attack Implementation Demo experiment Threat Scenarios Resistant Mechanisms
5 Related Work
6 Conclusions

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 3 / 36

Agenda
1 Introduction
2 Background EMV Contactless Cards Relay Attacks and Mafia Frauds
3 Android and NFC: A Tale of L ve Evolution of NFC Support in Android Practical Implementation Alternatives in Android
4 Relay Attack Implementation Demo experiment Threat Scenarios Resistant Mechanisms
5 Related Work
6 Conclusions

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 4 / 36

Introduction to NFC (I)
What is NFC? Bidirectional short-range contactless communication technology
Up to 10 cm
Based on RFID standards, works in the 13.56 MHz spectrum Data transfer rates vary: 106, 216, and 424 kbps

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 5 / 36

Introduction to NFC (I)
What is NFC? Bidirectional short-range contactless communication technology
Up to 10 cm
Based on RFID standards, works in the 13.56 MHz spectrum Data transfer rates vary: 106, 216, and 424 kbps

Security based on proximity concern: physical constraints

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 5 / 36

Introduction to NFC (II)
Wow! NFC sounds pretty hipster! Two main elements:
Proximity Coupling Device (PCD, also NFC-capable device) Proximity Integrated Circuit Cards (PICC, also NFC tags) Three operation modes: Peer to peer: direct communication between parties Read/write: communication with a NFC tag Card-emulation: an NFC device behaves as a tag

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 6 / 36

Introduction to NFC (III)

ISO/IEC 14443 standard
Four-part international standard for contactless smartcards
1 Size, physical characteristics, etc. 2 RF power and signalling schemes
(Type A & B) Half-duplex, 106 kbps rate
3 Initialization + anticollision protocol 4 Data transmission protocol
IsoDep cards: compliant with the four parts
Example: contactless payment cards

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 7 / 36

Introduction to NFC (IV)

ISO/IEC 7816 Fifteen-part international standard related to contacted integrated circuit cards, especially smartcards
Application Protocol Data Units (APDUs)

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 8 / 36

Introduction to NFC (V)

[Taken from 13.56 MHz RFID Proximity Antennas (http://www.nxp.com/documents/application_note/AN78010.pdf)]

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 9 / 36

Introduction to NFC (V)

[Taken from 13.56 MHz RFID Proximity Antennas (http://www.nxp.com/documents/application_note/AN78010.pdf)]

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 9 / 36

Introduction to NFC (VI)

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 10 / 36

Introduction to NFC (VII) Ok. . . So, is it secure, right? Right??

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 11 / 36

Introduction to NFC (VII)
Ok. . . So, is it secure, right? Right??
If it were *so* secure, you would not be staring at us ¨

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 11 / 36

Introduction to NFC (VII)
Ok. . . So, is it secure, right? Right??
If it were *so* secure, you would not be staring at us ¨
NFC security threats Eavesdropping
Secure communication as solution Data modification (i.e., alteration, insertion, or destruction)
Feasible in theory (but requires quite advanced RF knowledge) Relays
Forwarding of wireless communication Two types: passive (just forwards), or active (forwards and alters the data)

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 11 / 36

Introduction to NFC (VII)
Ok. . . So, is it secure, right? Right??
If it were *so* secure, you would not be staring at us ¨

NFC security threats
Eavesdropping Secure communication as solution
Data modification (i.e., alteration, insertion, or destruction) Feasible in theory (but requires quite advanced RF knowledge)
Relays Forwarding of wireless communication Two types: passive (just forwards), or active (forwards and alters the data)

We focus on passive relay attacks

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 11 / 36

Introduction to NFC (VIII)
NFC brings "cards" to mobile devices Payment sector is quite interested in this new way for making payments
500M NFC payment users expected by 2019 Almost 300 smart phones available at the moment with NFC capabilities
Check http: //www.nfcworld.com/nfc-phones-list/
Most of them runs Android OS

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 12 / 36

Introduction to NFC (VIII)
NFC brings "cards" to mobile devices Payment sector is quite interested in this new way for making payments
500M NFC payment users expected by 2019 Almost 300 smart phones available at the moment with NFC capabilities
Check http: //www.nfcworld.com/nfc-phones-list/
Most of them runs Android OS
Research Hypothesis Can a passive relay attack be performed in contactless payment cards, using an Android NFC-capable device? If so, what are the constraints? (whether any exists)

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 12 / 36

Agenda
1 Introduction
2 Background EMV Contactless Cards Relay Attacks and Mafia Frauds
3 Android and NFC: A Tale of L ve Evolution of NFC Support in Android Practical Implementation Alternatives in Android
4 Relay Attack Implementation Demo experiment Threat Scenarios Resistant Mechanisms
5 Related Work
6 Conclusions

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 13 / 36

Background (I)
EMV contactless cards

Europay, Mastercard, and VISA standard for inter-operation of IC cards, Point-of-Sale terminals and automated teller machines
Authenticating credit and debit card transactions Commands defined in ISO/IEC 7816-3 and ISO/IEC 7816-4 (http://en.wikipedia.org/wiki/EMV)
Application ID (AID) command

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 14 / 36

Background (II)
MasterCard PayPass, VISA payWave, and AmericanExpress ExpressPay
Are they secure?

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 15 / 36

Background (II)
MasterCard PayPass, VISA payWave, and AmericanExpress ExpressPay
Are they secure?
Amount limit on a single transaction Up to £20 GBP, 20, US$50, 50CHF, CAD$100, or AUD$100

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 15 / 36

Background (II)
MasterCard PayPass, VISA payWave, and AmericanExpress ExpressPay

Are they secure?
Amount limit on a single transaction Up to £20 GBP, 20, US$50, 50CHF, CAD$100, or AUD$100 *cof, cof*
(http://www.bankinfosecurity.com/android- attack- exploits- visa- emv- flaw- a- 7516/op- 1)

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 15 / 36

Background (II)
MasterCard PayPass, VISA payWave, and AmericanExpress ExpressPay

Are they secure?

Amount limit on a single transaction Up to £20 GBP, 20, US$50, 50CHF, CAD$100, or AUD$100
*cof, cof*
(http://www.bankinfosecurity.com/android- attack- exploits- visa- emv- flaw- a- 7516/op- 1)
Sequential contactless payments limited ­ it asks for the PIN Protected by the same fraud guarantee as standard transactions (hopefully)

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 15 / 36

Background (III)
Relay attacks "On Numbers and Games", J. H. Conway (1976)

Mafia frauds ­ Y. Desmedt (SecuriCom'88) P - V communication link P - V
Real-time fraud where a fraudulent prover P and verifier V cooperate

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 16 / 36

Background (III)
Relay attacks "On Numbers and Games", J. H. Conway (1976)

Mafia frauds ­ Y. Desmedt (SecuriCom'88) P - V communication link P - V

Real-time fraud where a fraudulent prover P and verifier V cooperate
Honest prover and verifier: contactless card and Point-of-Sale terminal Dishonest prover and verifier: two NFC-enabled Android devices

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 16 / 36

Agenda
1 Introduction
2 Background EMV Contactless Cards Relay Attacks and Mafia Frauds
3 Android and NFC: A Tale of L ve Evolution of NFC Support in Android Practical Implementation Alternatives in Android
4 Relay Attack Implementation Demo experiment Threat Scenarios Resistant Mechanisms
5 Related Work
6 Conclusions

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 17 / 36

NFC operation modes supported

Android and NFC: A Tale of L ve (I)

Recap on evolution of Android NFC support

Software

Hardware

Software

Reader/Writer Peer-to-peer

Card-emulation

Reader/Writer Peer-to-peer

Card-emulation

Hardware Card-emulation

{ {

Android 2.3.3 Gingerbread (API level 10)

NfcA (ISO/IEC 14443-3A)

NfcB (ISO/IEC 14443-3B)

Android 4.2 Jelly Bean (API level 17)
NfcBarcode

Android CyanogenMod OS 9.1
IsoPcdA (ISO/IEC 14443-4A)

Android 4.4 KitKat (API level 19)
NfcAdapter.ReaderCallback added

Ndef
NfcV (ISO/IEC 15693)

IsoDep (ISO/IEC 14443-4)
NfcF (JIS 6319-4)

IsoPcdB (ISO/IEC 14443-4B)
thanks to Doug Year

NdefFormatable MifareClassic

MifareUltralight

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 18 / 36

Android and NFC: A Tale of L ve (II)
Digging into Android NFC stack
Event-driven framework, nice API support Two native implementations (depending on built-in NFC chip)
libnfc-nxp libnfc-nci

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 19 / 36

Android and NFC: A Tale of L ve (II)
Digging into Android NFC stack
Event-driven framework, nice API support Two native implementations (depending on built-in NFC chip)
libnfc-nxp libnfc-nci NXP dropped in favour of NCI: Open architecture, not focused on a single family chip Open interface between the NFC Controller and the DH Standard proposed by NFC Forum

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 19 / 36

Android and NFC: A Tale of L ve (III)
Digging into Android NFC stack ­ Reader/Writer mode
Not allowed to be set directly  Android activity
Android NFC service selects apps according to tag definition of Manifest file In low-level, libnfc-nci uses reliable mechanism of queues and message passing ­ General Kernel Interface (GKI)
Makes communication between layers and modules easier

User App Tag

NFC developer framework

IPC

NfcService

TagService

mTagService.transceive

DeviceHost.TagEndPoint

J. Vila, R. J. Rodr´iguez

<<realize>> NativeNfcTag
libnfc-nci

JNI
doTransceive

System NFC Library NativeNfcTag.cpp

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 20 / 36

Android and NFC: A Tale of L ve (IV)
Digging into Android NFC stack ­ HCE mode
A service must be implemented to process commands and replies HostApduService abstract class, and processCommandApdu method AID-based routing service table
This means you need to declare in advance what AID you handle!

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 21 / 36

Android and NFC: A Tale of L ve (V)
Digging into Android NFC stack ­ Summary

Description NFC developer framework
(com.android.nfc package) System NFC library (libnfc-nxp or libnc-nci) NFC Android kernel driver
NFC firmware (/system/vendor/firmware directory)

Language(s) Java, C++ C/C++ C ARM Thumb

Dependency API level

Manufacturer

Hardware and turer Hardware and manufacturer

manufac-

OSS Yes Yes Yes No

Some useful links
https://android.googlesource.com/platform/frameworks/base/+/master/core/java/android/nfc/ https://android.googlesource.com/platform/packages/apps/Nfc/+/master/src/com/android/nfc https://android.googlesource.com/platform/packages/apps/Nfc/+/master/nci/ https://android.googlesource.com/platform/external/libnfc- nci/+/master/src/ http://nfc- forum.org/our- work/specifications- and- application- documents/specifications/ nfc- controller- interface- nci- specifications/ http://www.cardsys.dk/download/NFC_Docs/NFC%20Controller%20Interface%20(NCI)%20Technical% 20Specification.pdf http://www.datasheet4u.com/PDF/845670/BCM20793S.html http://www.datasheet4u.com/PDF/845671/BCM20793SKMLG.html

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 22 / 36

Android and NFC: A Tale of L ve (VI)
Some remarkable limitations
Limitation 1 Dishonest verifier communicates with a MIFARE Classic libnfc-nci do not allow sending raw ISO/IEC 14443-3 commands
Caused by the CRC computation, performed by the NFCC Overcome whether NFCC is modified EMV contactless cards are IsoDep: fully ISO/IEC 14443-compliant

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 23 / 36

Android and NFC: A Tale of L ve (VI)
Some remarkable limitations
Limitation 1 Dishonest verifier communicates with a MIFARE Classic libnfc-nci do not allow sending raw ISO/IEC 14443-3 commands
Caused by the CRC computation, performed by the NFCC Overcome whether NFCC is modified EMV contactless cards are IsoDep: fully ISO/IEC 14443-compliant

Limitation 2 Dishonest prover communicates with a honest verifier Device in HCE mode
AID must be known in advance
Overcome whether device is rooted Xposed framework may help to overcome this issue, but needs root permissions

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 23 / 36

Android and NFC: A Tale of L ve (V)
Some remarkable limitations and remarks
Limitation 3
Dishonest prover and a dishonest verifier communicate through a non-reliable peer-to-peer relay channel ISO/IEC 14443-4 defines the Frame Waiting Time as FWT = 256 · (16/fc) · 2FWI, 0  FWI  14, where fc = 13.56 MHz

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 24 / 36

Android and NFC: A Tale of L ve (V)
Some remarkable limitations and remarks
Limitation 3 Dishonest prover and a dishonest verifier communicate through a non-reliable peer-to-peer relay channel ISO/IEC 14443-4 defines the Frame Waiting Time as FWT = 256 · (16/fc) · 2FWI, 0  FWI  14, where fc = 13.56 MHz
FWT  [500µs, 5s]  relay is theoretically possible when delay is  5s
Concluding Remarks Any NFC-enabled device running OTS Android  4.4 can perform an NFC passive relay attack at APDU level when the specific AID of the honest prover is known and an explicit SELECT is performed

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 24 / 36

Android and NFC: A Tale of L ve (V)
Some remarkable limitations and remarks
Limitation 3 Dishonest prover and a dishonest verifier communicate through a non-reliable peer-to-peer relay channel ISO/IEC 14443-4 defines the Frame Waiting Time as FWT = 256 · (16/fc) · 2FWI, 0  FWI  14, where fc = 13.56 MHz
FWT  [500µs, 5s]  relay is theoretically possible when delay is  5s
Concluding Remarks Any NFC-enabled device running OTS Android  4.4 can perform an NFC passive relay attack at APDU level when the specific AID of the honest prover is known and an explicit SELECT is performed
Any communication involving a APDU-compliant NFC tag (i.e., MIFARE DESFire EV1, Inside MicroPass, or Infineon SLE66CL) can also be relayed

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 24 / 36

Android and NFC: A Tale of L ve (V)
Some remarkable limitations and remarks
Limitation 3
Dishonest prover and a dishonest verifier communicate through a non-reliable peer-to-peer relay channel ISO/IEC 14443-4 defines the Frame Waiting Time as FWT = 256 · (16/fc) · 2FWI, 0  FWI  14, where fc = 13.56 MHz
FWT  [500µs, 5s]  relay is theoretically possible when delay is  5s

Concluding Remarks Any NFC-enabled device running OTS Android  4.4 can perform an NFC passive relay attack at APDU level when the specific AID of the honest prover is known and an explicit SELECT is performed
Any communication involving a APDU-compliant NFC tag (i.e., MIFARE DESFire EV1, Inside MicroPass, or Infineon SLE66CL) can also be relayed

J. Vila, R. J. Rodr´iguez

And now, let's move to the practice ¨
Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 24 / 36

Agenda
1 Introduction
2 Background EMV Contactless Cards Relay Attacks and Mafia Frauds
3 Android and NFC: A Tale of L ve Evolution of NFC Support in Android Practical Implementation Alternatives in Android
4 Relay Attack Implementation Demo experiment Threat Scenarios Resistant Mechanisms
5 Related Work
6 Conclusions

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 25 / 36

Relay Attack Implementation (I)
Experiment configuration
PoS device: Ingenico IWL280 with GRPS + NFC support Android app developed (±2000 LOC) Two OTS Android NFC-capable devices
One constraint only: dishonest prover must run an Android  4.4

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 26 / 36

Relay Attack Implementation (I)
Experiment configuration
PoS device: Ingenico IWL280 with GRPS + NFC support Android app developed (±2000 LOC) Two OTS Android NFC-capable devices
One constraint only: dishonest prover must run an Android  4.4

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 26 / 36

Relay Attack Implementation (II)
Threat Scenarios ­ Scenario 1
Distributed Mafia Fraud

BOT

BOT

BOT

BOT BOT
BOTMASTER
BOT

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 27 / 36

Relay Attack Implementation (III)
Threat Scenarios ­ Scenario 2
Hiding Fraud Locations

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 28 / 36

Relay Attack Implementation (IV)
Resistant Mechanisms
Brief summary of resistant mechanisms Distance-bounding protocols
Upper bounding the physical distance using Round-Trip-Time of cryptographic challenge-response messages Timing constraints Not enforced in current NFC-capable systems The own protocol allows timing extension commands Physical countermeasures Whitelisting/Blacklisting random UID in HCE mode  unfeasible RFID blocking covers Physical button/switch activation Secondary authentication methods (e.g., on-card fingerprint scanners)

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 29 / 36

Agenda
1 Introduction
2 Background EMV Contactless Cards Relay Attacks and Mafia Frauds
3 Android and NFC: A Tale of L ve Evolution of NFC Support in Android Practical Implementation Alternatives in Android
4 Relay Attack Implementation Demo experiment Threat Scenarios Resistant Mechanisms
5 Related Work
6 Conclusions

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 30 / 36

Related Work
On relay attacks
2005-2009 First works built on specific hardware 2010 Nokia mobile phones with NFC capability plus a Java MIDlet app
2012-2013 Relay attacks on Android accessing to Secure Elements A SE securely stores data associated with credit/debit cards Needs a non-OTS Android device
2014 Active relay attacks with custom hardware and custom Android firmware

Several works studied delay upon relay channel:
Relay over long distances are feasible  latency isn't a hard constraint

Ask us for *specific* references, too many names for a single slide!

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 31 / 36

Agenda
1 Introduction
2 Background EMV Contactless Cards Relay Attacks and Mafia Frauds
3 Android and NFC: A Tale of L ve Evolution of NFC Support in Android Practical Implementation Alternatives in Android
4 Relay Attack Implementation Demo experiment Threat Scenarios Resistant Mechanisms
5 Related Work
6 Conclusions

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 32 / 36

Conclusions (I)
Security of NFC is based on the physical proximity concern
NFC threats: eavesdropping, data modification, relay attacks Android NFC-capable devices are rising
Abuse to interact with cards in its proximity

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 33 / 36

Conclusions (I)
Security of NFC is based on the physical proximity concern
NFC threats: eavesdropping, data modification, relay attacks Android NFC-capable devices are rising
Abuse to interact with cards in its proximity
Conclusions Review of Android NFC stack Proof-of-Concept of relay attacks using Android OTS devices
Threat scenarios introduced

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 33 / 36

Conclusions (I)
Security of NFC is based on the physical proximity concern
NFC threats: eavesdropping, data modification, relay attacks Android NFC-capable devices are rising
Abuse to interact with cards in its proximity
Conclusions Review of Android NFC stack Proof-of-Concept of relay attacks using Android OTS devices
Threat scenarios introduced
Virtual pickpocketing attack may appear before long!

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 33 / 36

Conclusions (II)
But then, what the hell can I do?? Should I run away?

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 34 / 36

Conclusions (II)
But then, what the hell can I do?? Should I run away?

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 34 / 36

Conclusions (II)
But then, what the hell can I do?? Should I run away?

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 34 / 36

Conclusions (III)
Future Work D/ / e/ /v/e/ /l/o/p/ / /a/ /b/ o/ /t/n/ e/ /t/ /in/ /f/r/a/s/ /tr/u/ /c/ t/u/ /r/e/ /a/ /n/d/ / /e/a/ /r/n/ /m/ / /o/n/ /e/y/ Timing constraints of Android HCE mode Try active relay attacks within EMV contactless cards
Acknowledgments Spanish National Cybersecurity Institute (INCIBE) University of Leo´ n under contract X43 HITB staff

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 35 / 36

Conclusions (III)
Future Work D/ / e/ /v/e/ /l/o/p/ / /a/ /b/ o/ /t/n/ e/ /t/ /in/ /f/r/a/s/ /tr/u/ /c/ t/u/ /r/e/ /a/ /n/d/ / /e/a/ /r/n/ /m/ / /o/n/ /e/y/ Timing constraints of Android HCE mode Try active relay attacks within EMV contactless cards
Acknowledgments Spanish National Cybersecurity Institute (INCIBE) University of Leo´ n under contract X43 HITB staff And thanks to all for hearing us!
Visit http://vwzq.net/relaynfc for more info about the project

J. Vila, R. J. Rodr´iguez

Relay Attacks in EMV Contactless Cardswith Android OTS Devices

HITB'15 AMS 35 / 36

Relay Attacks in EMV Contactless Cards with Android OTS Devices
Jose´ Vila, Ricardo J. Rodr´iguez pvtolkien@gmail.com, rj.rodriguez@unileon.es
All wrongs reversed

Computer Science and Systems Engineering Dept. University of Zaragoza, Spain

Research Institute of Applied Sciences in Cybersecurity
University of Leo´ n, Spain

May 28, 2015
Hack in the Box 2015 Amsterdam (Nederland)

