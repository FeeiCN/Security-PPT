How Samsung Secures Your Wallet &
How To Break It
HC Ma Tencent's Xuanwu Lab http://xlab.tencent.com @XuanwuLab

Who am I ?
· Security Researcher @ · hyperchemma#tencent.com
­ Embedded Device Security ­ Firmware Reverse-Engineering ­ Fan of IoT ­ Big Fan of

Who am I ?
· Security Researcher @ · hyperchemma#tencent.com
­ Embedded Device Security ­ Firmware Reverse-Engineering ­ Fan of IoT ­ Big Fan of

Agenda
· What's SamsungPay · SamsungPay Architecture · Steal Money from SamsungPay?!

What's SamsungPay?
=

What's SamsungPay?
Magnetic Card
= Tokenization

Magnetic Card & MST
· Magnetic Card:
· Store data using magnetic particles; · Physically 3 tracks on card; · Track2 is the only one needed for payment; · 6230744888888888888=2102777777777777; · Card Skimmer;
· MST:
· Magnetic Secure Transmission; · Technology for simulating magnetic card; · Use alternating magnetic field to transmit signal; · Invented by LoopPay, bought by Samsung; · Now ported to Samsungpay;

Magnetic Card & MST
· Magnetic Card:
· Store data using magnetic particles; · Physically 3 tracks on card; · Track2 is the only one needed for payment; · 6230744888888888888=2102777777777777; · Card Skimmer;
· MST:
· Magnetic Secure Transmission; · Technology for simulating magnetic card; · Use alternating magnetic field to transmit signal; · Invented by LoopPay, bought by Samsung; · Now ported to Samsungpay;

MST mechanism

MST mechanism
However, Anyone can capture this signal

Tokenization
· Reliable solution for processing sensitive information;
· Mathematically inreversible;
· NO Sensitive data leaked;
· But Where to store?

Secure Element
· Secure Element(SE) is a secure chip for securely hosting applications and their confidential and cryptographic data;
· SE has very high security level, and is the most essential part of mobile payment;
· Three types: UICC, MicroSD and Embedded SE;

Secure Element
· Secure Element(SE) is a secure chip for securely hosting applications and their confidential and cryptographic data;
· SE has very high security level, and is the most essential part of mobile payment;
· Three types: UICC, MicroSD and Embedded SE;

Applet
· An OS resides in SE; · Applet is an application running upon the OS,
developed by Java; · Compatible with JavaCard; · Two methods required: install and process; · Communicate with APDU; · In CAP files forms; · Confidential and cryptographic data for
generating token also reside in SE;

SamsungPay Architecture

More Secure

More Interface

SE TrustZone Android Kernel Android Native

Applets running in SE Trustlets For Payment
Drivers for devices and TrustZone Libs for Comm and Crypto

Android App

SamsungPay Apps

SamsungPayStub
·Pre-installed in official firmware released after 2016.03,located in /system/priv-app/SamsungPayStub; ·SamsungPay works fine without this; ·No payment function,just a stub; ·Download and install necessary App:
­SamsungPay Main App; ­SamsungPay Framework; ­TSM Serivce App;

Main App & Framework

·Main App:
·Update package for SamsungPayStub,shared the same package name;
·Payment function,UI code and Card Management code included;
·Save configuration in shared preferences:common_preferences.x ml and prov_preferences.xml;
·Save data in 8 SQLITE databases;
·Most data encrypted by private algorithm (localefont);

·Framework:
·Provide service for communicating with TrustZone;
·Trustlet bins are included in asset directory;

Main App & Framework

·Main App:
·Update package for SamsungPayStub,shared the same package name;
·Payment function,UI code and Card Management code included;
·Save configuration in shared preferences:common_preferences.x ml and prov_preferences.xml;
·Save data in 8 SQLITE databases;
·Most data encrypted by private algorithm (localefont);

·Framework:
·Provide service for communicating with TrustZone;
·Trustlet bins are included in asset directory;

TSM Service
·A bridge between Bank and SamsungPay; ·Different for different region, in China, Provided and signed by China UnionPay; ·Provide remote card management:
·Enrollment ·Download ·Update ·Revoke ·Delete
·Main App call service exported by TSM to achieve card management; ·Communicate with Service Provider web server.

SKMS Agent
·Samsung Key Management Service Agent; ·Communicate with Samsung web server; ·Three versions:
1.Pre-installed odex in /system/priv-app/SKMSAgent,obfuscated; 2.dalvik-cache odex in /dalvik-cache/, clear code; 3.Full apk Package bundled in some TSM install Package,obfuscated;
·Do SE initialization at very beginning phase; ·Collect SE information for every payment and registration;

Interface2Native
·Four methods for SamsungPay:
­nativeCreateTLCommunicationContext ­nativeDestroyTLCommunicationContext ­nativeProcessTACommand ­nativeGenerateDeviceCertificates

Android App

Android Native

·Few libs are involved in SamsungPay:

·libandroid_servers.so -> wrapper for all native service;

·libtlc_spay.so

-> trustlet communication lib for samsungpay;

·libtlc_direct_comm.so-> lower communication lib;

·libMcClient.so

-> MobiCore Client Lib;

·Daemon for communication:

·mcDriverDaemon -> daemon for talking to driver, by read,write and ioctl;

·Device interfaces:

·/dev/mobicore ·/dev/mobicore-user

MobiCore Driveri

·/dev/mst_ctrl

mst_drvi

Android Kernel
·Drivers related to SamsungPay:
·MobiCore Driver -> Interface for Userland; ·MobiCore Kernel Driver -> Talk to TrustZone; ·mst_drv Driver -> Control MST Device;
·Source Code Available;

Android Kernel

·Drivers related to SamsungPay:
·MobiCore Driver -> Interface for Userland; ·MobiCore Kernel Driver -> Talk to TrustZone; ·mst_drv Driver -> Control MST Device;
·Source Code Available;

Function turnonMST turnoffMST sendTrack1 sendTrack2 sendTrack3 sendTest Escape

CmdID 1 0 2 3 6 4 5

Comments Used
Unused Used In Test APP

TrustZone
·OS is closed-source, MobiCore, developed by Giesecke & Devrient; ·Trustlets run in it, with MCLF format; ·Signed but NOT encrypted; ·Different payment use different trustlets:
;
·Trustlet entry accepts two arguments: tci and its length;
·tci points to WSM(World Shared Memory)
· After loaded, Trustlet does some initialization, then call tlApiWaitNotification api wait notification from normal world; ·Accept commands from normal world:nativeProcessTACommand

SE

·Hardware: ·SmartMX2-P61 family; ·Model: P61N1M3(maybe); ·Integrated into NFC controller chip; ·SmartMX2 CPU, 90nm CMOS; ·ISA: Super Set of 80C51; ·Fame2 crypto coprocessor for RSA/ECC; ·SBC crypto coprocessor for DES/AES;

·Hardware(cont.): ·128KB E2PROM,1.2MB Flash, 34KB RAM; ·Five modes:
· Boot Mode; · Test Mode; · Firmware Mode; · System Mode; · User Mode;
·SPI interface for connecting directly to SE; ·EAL6+;

SE

SE

·Software:

·A Card OS inside, Regulated by

·Java Card runtime;

·Global Platform API;

·Cryptographic and Hashing;
·Security Domain;

·Card Life Cycle Models;
·Secure Channel;

SE

·Software:

·A Card OS inside, Regulated by

·Java Card runtime;

·Global Platform API;

·Cryptographic and Hashing;
·Security Domain;

·Card Life Cycle Models;
·Secure Channel;

·Isolated Environment for Running Applets and Storing Data(keys ,config data), like sandbox;
·Issuer Security Domain(ISD) own the top privilege(Samsung);
·Supplementary Security Domains(SSD) for Users, lower privilege;
·Cross Domains access is prohibited;

SE

·Software:

·A Card OS inside, Regulated by

·Java Card runtime;

·Global Platform API;

·Cryptographic and Hashing;
·Security Domain;

·Card Life Cycle Models;
·Secure Channel;

·Isolated Environment for Running Applets and Storing Data(keys ,config data), like sandbox;
·Issuer Security Domain(ISD) own the top privilege(Samsung);
·Supplementary Security Domains(SSD) for Users, lower privilege;
·Cross Domains access is prohibited;

·Built upon APDU;
·Negotiation and Authentication before doing any operation;
·Session Keys are negotiated for every connection;
·Traffic packets are encrypted by Session Keys;

In a word
·Many components in multi levels; ·Roughly 3 layers:
·Android; ·MobiCore(TrustZone); ·Applets and OS in SE;
·We focus mostly on the latter two;

Steal Money from SamsungPay?!

Remote

Payment

Local

Registration

Payment-Basic
·Payment is the most frequently used feature;
·Step for using SamsungPay:
·Select Card -> select one of virtual card you registered in SamsungPay ·Authenticate -> password/fingerprint/iris ·Tap on POS -> stay phone close to POS terminal;
·SamsungPay transmits NFC and MST signal at the same time;
·We focus on both hardware and software implementation of MST transaction;

Payment-Token Capture
·MST signal can be captured by coil; ·The energy of this signal is high enough to be captured from a distance; ·Reported by 3 groups on BlackHat and USENIX;

Payment-Token Capture
·Transmit Track2 Info Only; ·30 times in 30s for each payment;

Payment-Token Analysis

·Different version was found in China; ·6 digits token instead of 3(documented in BH USA 2015); ·No internet or cellular required while generating tokens;
·Synchronized by sequence number;

6230745372011888888=21021010051295089 6230745372011888888=21021010061045672 6230745372011888888=21021010071577380 6230745372011888888=21021010081608599 6230745372011888888=21021010091744699

PAN BankID Const Sequence Token

Payment-Token Analysis

·Different version was found in China; ·6 digits token instead of 3(documented in BH USA 2015); ·No internet or cellular required while generating tokens;
·Synchronized by sequence number;

6230745372011888888=21021010051295089 6230745372011888888=21021010061045672 6230745372011888888=21021010071577380 6230745372011888888=21021010081608599 6230745372011888888=21021010091744699
PRG + Seed ?

PAN BankID Const Sequence Token

Payment-Token Generation
·Generating token securely is vital to mobile payment; ·Samsung uses layering model to minimize attacking surface; ·Most work are done in TrustZone and SE; ·Two procedures involved, and each accepts one argument from userland:
·StartPay(AID) ·transmitMSTData(ConfigData)

Payment-Token Generation

getAuth

checkData
StartPay in
APDU_getTrackDataTrustlet

convertData openESEDevice

APDU_selectAID

APDU_StartUseCard

checkPayMode

Payment-Token Ensure
authentication

Generation

complete

getAuth

checkData
StartPay in
APDU_getTrackDataTrustlet

convertData openESEDevice

APDU_selectAID

APDU_StartUseCard

checkPayMode

Payment-Token Ensure
authentication

Generation

complete

getAuth

String2hex (AID)

checkData
StartPay in
APDU_getTrackDataTrustlet

convertData openESEDevice

APDU_selectAID

APDU_StartUseCard

checkPayMode

Payment-Token Ensure
authentication

Generation

complete

getAuth

String2hex (AID)

checkData
StartPay in
APDU_getTrackDataTrustlet

convertData openESEDevice

Through SPI

APDU_selectAID

APDU_StartUseCard

checkPayMode

Payment-Token Ensure
authentication

Generation

complete

getAuth

String2hex (AID)

checkData
StartPay in
APDU_getTrackDataTrustlet

convertData openESEDevice

Through SPI

Is NFC or MST mode?

APDU_selectAID

APDU_StartUseCard

checkPayMode

Payment-Token Ensure
authentication

Generation

complete

getAuth

String2hex (AID)

checkData

Talk to SE

StartPay

in

APDU_getTrackDataTrustlet

convertData openESEDevice

Through SPI

Is NFC or MST mode?

APDU_selectAID

APDU_StartUseCard

checkPayMode

Payment-Token Generation
transmitMSTData(ConfigData)

CheckTrackData EncodeTrackData AdjustData

Send2Device

Validate track data format and
charset by TrackNum

Select charset by TrackNum, and encode data to signal(binary
stream)

Generate leading and tail
zeros, and connect to signal
above

Copy result to a shared memory.

Payment

Payment-Summary
·Token can be easily captured; ·Token is valid for transaction at that time; ·Invalid or expired if used; ·Synchronized by seqnum can be a problem; ·Algorithm is inside SE.

Payment

Payment-Summary
·Token can be easily captured; ·Token is valid for transaction at that time; ·Invalid or expired if used; ·Synchronized by seqnum can be a problem; ·Algorithm is inside SE.
Can we get the algorithm and generate valid token OFF the phone?

Registration-Guide

Registration-Code
 Environment check while launch;  Highly relied on KNOX;  Check server certificate while using SSL;  Encrypt Packets while transaction;  Obfuscate dalvik code;  Check Signature in native lib;  Obfuscate native algorithm work flow;

Registration-Code
 Environment check while launch;  Highly relied on KNOX;  Check server certificate while using SSL;  Encrypt Packets while transaction;  Obfuscate dalvik code;  Check Signature in native lib;  Obfuscate native algorithm work flow;
x Log all actions into logcat;

Registration-Code
 Environment check while launch;  Highly relied on KNOX;  Check server certificate while using SSL;  Encrypt Packets while transaction;  Obfuscate dalvik code;  Check Signature in native lib;  Obfuscate native algorithm work flow;
x Log all actions into logcat;
x Even the decrypted https packets;

Registration-Code
 Environment check while launch;  Highly relied on KNOX;  Check server certificate while using SSL;  Encrypt Packets while transaction;  Obfuscate dalvik code;  Check Signature in native lib;  Obfuscate native algorithm work flow;
x Log all actions into logcat;
x Even the decrypted https packets;
x Other information (Next Page);

Registration-Code

Collect Issuer info according to your card number

Wait for virtual card download info

Send the OTP back to bank to finish identification

getCard IssuerInfo

Wait Push

Verify OTP

Apply a virtual card for physical card, with your credentials

Enroll Card

Request OTP

Ask bank to send OTP to you, like cellphone, to identify

Registration-Code

Collect Issuer info according to your card number

Wait for virtual card download info

Send the OTP back to bank to finish identification

getCard IssuerInfo

Wait Push

Verify OTP

Apply a virtual card for physical card, with your credentials

Enroll Card

Request OTP

Ask bank to send OTP to you, like cellphone, to identify

Registration-Code

Collect Issuer info according to your card number

Wait for virtual card download info

Send the OTP back to bank to finish identification

getCard IssuerInfo

Wait Push

Verify OTP

Apply a virtual card for physical card, with your credentials

Enroll Card

Request OTP

Ask bank to send OTP to you, like cellphone, to identify

Registration-Code

Collect Issuer info according to your card number

Wait for virtual card download info

Send the OTP back to bank to finish identification

getCard IssuerInfo

Wait Push

Verify OTP

Apply a virtual card for physical card, with your credentials

Enroll Card

Request OTP

Ask bank to send OTP to you, like cellphone, to identify

Registration-Code
Init Connection

Registration-Code
Data from Push Msg

Registration-Download

SE Initialization
· Initial only ONCE, at the first time of use;
· Done by SKMS(Samsung) and TSM(Bank);
· New Supplementary Security Domain(SSD) Created;

Virtual Card Applet Download
· Download and Install Applet of Virtual Card;
· Store corresponding data to SE;
· Belong to New SSD;
· While Activated, the applet can represent your physical bank card;

Registration-Download

SE Initialization

Virtual Card Applet Download

· Initial only ONCE, at the first time of use;

· Download and Install Applet of Virtual Card;

· Done by SKMS(Samsung) and TSM(Bank);

· Store corresponding data to SE;

· New Supplementary

· Belong to New SSD;

Security Created;

Domain(SSD) ·Whole process

are

· protected

While Activated, the cbaynsreespsrieosnent your

applet

key and SSL

physical bank card;

Registration-Tips
 Android 5.1.1 is vulnerable to some root tools;

Registration-Tips
 Traffic packets for both process are encrypted by random session key, and transferred through SSL;
 Android 5.1.1 is vulnerable to some root tools;

Registration-Tips
 To learn more, packets should be decrypted;
 Traffic packets for both process are encrypted by random session key, and transferred through SSL;
 Android 5.1.1 is vulnerable to some root tools;

Registration-Tips

 To learn more, packets should be decrypted;
 Traffic packets for both process are encrypted by random session key, and transferred through SSL;

 MITM for SSL does not work;

 Android 5.1.1 is vulnerable to some root tools;

Registration-Tips

 To learn more, packets should be decrypted;
 Traffic packets for both process are encrypted by random session key, and transferred through SSL;

 MITM for SSL does not work;
 Instead of cracking SSL, we have to probe the internals;

 Android 5.1.1 is vulnerable to some root tools;

Registration-Tips

 To learn more, packets should be decrypted;

 MITM for SSL does not work;

 Traffic packets for both process are encrypted by random session key, and

 Instead of cracking SSL, we have to probe the internals;

transferred through SSL;
Thus a secure root is must

 Android 5.1.1 is vulnerable to some root tools;

Registration-Tips

 To learn more, packets should be decrypted;

 MITM for SSL does not work;

 Traffic packets for both process are encrypted by random session key, and

 Instead of cracking SSL, we have to probe the internals;

transferred through SSL;
Thus a secure root is must

 SamsungPay is launched with Android 6.0.1;
 Android 5.1.1 is vulnerable to some root tools;

Registration-Tips

 To learn more, packets should be decrypted;

 MITM for SSL does not work;

 Traffic packets for both process are encrypted by random session key, and

 Instead of cracking SSL, we have to probe the internals;

transferred through SSL;
Thus a secure root is must

 SamsungPay is launched with Android 6.0.1;

 Android 5.1.1 is vulnerable to However SamsungPay works

some root tools;

fine on 5.1.1;

Registration-Tips

 To learn more, packets should be decrypted;

 MITM for SSL does not work;

 Traffic packets for both process are encrypted by random session key, and

 Instead of cracking SSL, we have to probe the internals;

transferred through SSL;
Thus a secure root is must

 SamsungPay is launched with Android 6.0.1;

 Android5.A1n.1drisoivdu5ln.1e.r1abislevutolnerable to However SamsungPay works

some rootstoomoles;root tools;

fine on 5.1.1;

Registration-Tips

 To learn more, packets should be decrypted;

 MITM for SSL does not work;

 Traffic packets for both process are encrypted by random session key, and

 Instead of cracking SSL, we have to probe the internals;

transferred through SSL;
Thus a secure root is must

 Root privilege can be gained temporarily;

 SamsungPay is launched with Android 6.0.1;

 Android5.A1n.1drisoivdu5ln.1e.r1abislevutolnerable to However SamsungPay works

some rootstoomoles;root tools;

fine on 5.1.1;

Registration-Code
TSMService
SKMS Agent

TSMService

Registration-Trick1

TSMService

Registration-Trick1

TSMService

Registration-Trick1

Jni_iDM=Jni_isDebugMode

Registration-Trick2
SKMS Agent

Registration-Trick2
SKMS Agent
unmodifiable

Registration-Trick2
SKMS Agent

Return 0

unmodifiable

Registration-Trick2
Return 0

·SKMS Agent is a pre-installed app, Only odex exsit;

Registration-Trick2

Return 0

·SKMS Agent is a pre-installed app, Only odex exsit;
·System will execute the native code in odex file instead of dalvik code;

Registration-Trick2
Return 0

·SKMS Agent is a pre-installed app, Only odex exsit;
·System will execute the native code in odex file instead of dalvik code;
·Let's modify native code directly;

Registration-Trick2
Return 0

·SKMS Agent is a pre-installed app, Only odex exsit;
·System will execute the native code in odex file instead of dalvik code;
·Let's modify native code directly;

Registration-Trick2
Return 0

Registration-Trick2

Registration-Trick2
· Dm-verity is enabled, we can't change files on System partition;

Registration-Trick2
· Dm-verity is enabled, we can't change files on System partition; · Files in dalvik-cache are also odex file;

Registration-Trick2
· Dm-verity is enabled, we can't change files on System partition; · Files in dalvik-cache are also odex file; · System will load dalvik-cache if odex not exist in app dir;

Registration-Trick2
· Dm-verity is enabled, we can't change files on System partition; · Files in dalvik-cache are also odex file; · System will load dalvik-cache if odex not exist in app dir; · Remove odex will NOT trigger dm-verity;

Registration-Trick2
· Dm-verity is enabled, we can't change files on System partition; · Files in dalvik-cache are also odex file; · System will load dalvik-cache if odex not exist in app dir; · Remove odex will NOT trigger dm-verity; · NO integrity check for native code;

Registration-strategy
·Enable packets log strategy:
·Modify odex native code; ·Rename to system@privapp@SKMSAgent@SKMSAgent.apk@classes.dex ·Write to dalvik-cache directory; ·Remove original odex file under root privilege; ·Patch Applied!

SE Initialization
Applet Download

Registration-SE Operations

7 Steps of Registration
­Create Supplementary Security Domain; ­Update Supplementary Security Domain keys; ­Install ARC-C Application; ­Personalize AMSD and Write SEID; ­Add Access Rules for CRS; ­Install CARDS Applet; ­Install Applet;

SKMS Agent TSMService

·All packets are transmitted through Secure Channel; ·3 keys involved: Keyisd, Keydefault and Keybank;

Registration-SE Operations
·Create Supplementary Security Domain:
·Done by SKMS Agent and Samsung Server; ·Use Keyisd to set up Secure Channel, encrypted by Triple DES; ·Only Samsung and SE know Keyisd; ·Working in privilege Security Domain--Issuer Security Domain; ·At the end of this stage, Keydefault is set for new domain;

Registration-SE Operations

Registration-SE Operations
·Update Supplementary Security Domain keys:
·Update Keydefault with Keybank; ·Working in supplementary Security Domain;
·Install ARC-C Application:
·ARA-C( Access Rule Application Client); ·Hardware-based Access Control Mechanism, allow specific android app to access SE; ·Hash of certificate is written into;
·Personalize AMSD and Write SEID:
·AMSD(Authorized Mode Secured Domain, AMSD); ·Bank assigns an SEID for SE, and write it into SE;

Registration-SE Operations
·Add Access Rules for CRS:
·CRS(Contactless Registry Service) ·Application selection rules on the contactless interface(for NFC);
·Install CARDS Applet:
·Seems Core of Bank implementation,around 11K; ·After Installation, few initializaiton opertions are done by ISO7816 standard cmds instead of secure channel:
· CREATE FILE · UPDATE BINARY · GET CHALLENGE · SET PIN

Registration-SE Operations
·Install Applet:
·Applet for generating tokens, around 53K; ·Different cards may share the same blob, but different data; ·The entity that trustlets comminucate with in TrustZone; ·The whole blob is encrypted, no more detail known until one of the keys gained: Keyisd, Keydefault and Keybank

Registration-Summary

Registration

·All traffic packets are encrypted; ·Information leaks also exist; ·Tokens are generated inside SE by certain applet; ·Applets and their config data are stored through Secure Channel, no plain text data exposed; ·Secure Channel is secured by cryptographic key;

Registration-Summary

Registration

·All traffic packets are encrypted; ·Information leaks also exist; ·Tokens are generated inside SE by certain applet; ·Applets and their config data are stored through Secure Channel, no plain text data exposed; ·Secure Channel is secured by cryptographic key;

Your WALLET is secured properly!

Black Hat Sound Bytes
·We detailed all process of SamsungPay from userland to TrustZone; ·Keyisd is critical for the whole payment system, once leak, attacker can do whatever they want; ·Other two keys are also important to understand the mechanism inside SE; ·SamsungPay will stay secure until these keys leaked/gained; ·Mistake and design faults are made by Samsung and 3rd party developer;

Acknowledgement
· My leader: tombkeeper · reeseliu for drawing sketch and document
translation · rudywang, jacksonma,huimingliu · All team members in Xuanwu Lab

Q&A

