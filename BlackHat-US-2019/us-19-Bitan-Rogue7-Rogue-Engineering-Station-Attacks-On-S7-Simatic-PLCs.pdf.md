Rogue7
Rogue Engineering Station Attacks on
Simatic S7 PLCs

Eli Biham. Sara Bitan, Aviad Carmel, Alon Dankner, Uriel Malin, Avishai Wool

Technion ­ Israel Institute of Technology

Tel-Aviv University

Who Are We?

Dr. Sara Bitan

Uriel Malin

· Senior researcher at the · MSC Student at Tel Aviv

Technion Hiroshi Fujiwara University, advised by

Cyber Security Research Center

Prof. Avishai Wool

· Founder and CEO of CyCloak - Secure System

· Security Researcher at Medigate ­ Healthcare

Design and Audit

IoT Security

Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Talk Topics
The Operator
The Engineer
The Attacker
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Industrial Control System
· A distributed computerized system · Operates and monitors physical devices · Controls critical infrastructure
· Power plants · Water facilities · Transportation systems · Chemical plants
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Programmable Logic Controller
· PLC - The core of the ICS · Connected to sensors and active
devices · Runs a control program that
periodically samples the sensors and triggers the devices accordingly · A bridge between the virtual and the kinetic worlds · The target of our attacks
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

HMI - SCADA WinCC
TIA
Engineering Workstation STEP 7

PLC interfaces
The S7 Protocol The Control Program
PLC Operating System

Web Server
SNMP Server

PLC S7-1500

The S7 Protocol
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Rest of the world

Secure ICS Topology

Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Source: NCCIC IR-18-214

Stuxnet Malware (9/2010)
· The most famous cyber-attack on ICS · Targeted Siemens S7-300 PLC · Infected both WinCC and Step 7 packages

WinCC

The S7 Protocol

TIA

S7-300

STEP 7

s7totbxdx.dll

Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

TIA as a Soft Belly
· Typically attacks are exploiting vulnerabilities the engineering station:
· CVE-2012-3015 : untrusted search path vulnerability in Siemens SIMATIC STEP7 v5.5­ July-26-2012
· CVE-2019-10915: authentication bypass in TIA v15.1 ­July-11-19 by Tenable Security
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Our Attack

· Exploits vulnerabilities in the PLC Operating System
· S7 protocol
· Any vulnerable station/ device in the network can serve as an attack machine

The Control Program

Web Server

The S7 Protocol

PLC Operating System

SNMP Server

Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

The S7-1500 PLC
· One of two new members in the SIMATIC PLCs product line
· S7-1500 is the high-end PLC · The other is S7-1200
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

S7-1500 Security Enhancements
· New version of the S7 protocol
· Integrity protection of the messages
· Know-how and copy protection · PLC access control
· Using passwords · Mitigates the program download attacks · Not used by customers in practice
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

The S7 Protocol

Session oriented. Session begin with a 4-ways handshake ISO transport over TCP
Session ID

Client can create, modify and delete objects in the PLC's internal memory

Version P3

Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Example: create a server session object

The P3 Handshake Protocol

Client

PLC

PLC_PUB_KEY

Req, Hello, RID, Seq=1

KDK=Key Derivation Key

Res, Hello, SID, n2, Model, Firmware version, Challenge, Seq=1

EncPLC_PUB_KEY(Keying Material) Req, SID, Encrypted Keying Material, Response, Seq=2

PLC_PRV_KEY
Challenge

Session_key=f(Challenge, KDK)

Res, OK, Seq=2 Response OK?

SSL Server only authentication Client generates keying material. Encrypts with server public key. Different servers use different public keys.
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

S7 P3 Handshake Server (PLC) only authentication Client generates keying material. Encrypts with server public key. All PLCs from the same model and version use a single key.

P3 Handshake Design Vulnerabilities
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Attacking the P3 program download exchange
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Control Program Create Message

Object MAC Object Code Source Code

Create Object Request

HMAC-SHA256 over packet with
session key

Create Program Cycle Object Block

Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Control Program Representation

Object MAC

Object MAC

Object Code
Source Code
Yellow Program
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Object Code
Source Code
Blue Program

Program Download
Download
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Program Upload
Upload
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

The Rogue TIA

· No engineering station in the

Rogue

production network.

TIA

· The attacker brings it with him.

· Rogue TIA: The attack system consists of a modified legitimate TIA and a malicious proxy.

Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Rogue TIA Stealth Program Injection Setup Phase

Download
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Record

Rogue TIA Stealth Program Injection Attack Phase

Download
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Re-calc integrity



But we cannot always bring our own TIA with us.... Introducing
The Rogue Engineering Station
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Rogue Engineering Station
· A Python attack script that impersonates a TIA
· Inputs: PLC's IP address; Yellow and blue programs download pcap files
Rogue Engineering Station
· Runs a live download session with the PLC
· Four-way hand-shake · All S7 message fields are taken from the yellow pcap file · Except, the object code and MAC that are taken from blue pcap file · Fixes message SID, integrity protection and additional cookies
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Rogue Engineering Workstation Stealth Program Injection

Fix SID Fix other cookies Re-calc integrity
Download
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs



Step7 Impersonation

My Lab
King's Landing
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

The Wall

P3 Handshake Details
Deep technical details not for the faint-hearted
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

P3 Session Key Establishment

Key Derivation Key

Client

KDK

EncPLC_PUB_KEY(Keying Material)

...

PLC

Res, Hello, SID, n2, Model, Firmware version, Challenge, Seq=1

Req, SID, Encrypted Keying Material, Response, Seq=2

· Recall that: Session_key = f(Challenge, KDK)

Challenge

· What is this EncryptedKeyingMaterial Structure?

Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

P3 Handshake Cryptographic Primitives in Use
· Public-private key based asymmetric encryption
· Elliptic curve: EC-ElGamal
· Symmetric encryption
· AES
· Electronic Code Book ­ ECB Mode · Counter mode
· Key Derivation Function: KDF
· Non-cryptographic checksum: Tabulation hash
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

P3 ­ KDK Sharing

1. Generate 20 bytes PreKey
1. Encrypt it using EC-ElGamal­like encryption with the plc public key and add it to Keying material
2. Calculate KDF on PreKey and get
1. Checksum Encryption Key (CEK) 2. Checksum Seed (CS) 3. Key Encryption Key (KEK)
3. Concatenate the KDK to the challenge, encrypt them using AESCTR with the KEK, and add to Keying material
4. Initiate the Tabulation Hash with CS and calculate checksum over (3)
5. Encrypt (4) using AES-ECB with CEK and add to Keying material

PreKey

Challenge

KDK

KDF

CEK

CS

KEK

TB-HASH

PLC public
key

EC ElGamal
Like

AES ECB

AES CTR

PreKey with asymmetric encryption

Checksum with symmetric encryption

Keying material 1 Keying material 2

Encrypted KDK And challenge
Keying material 3

Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

P3 ­ Asymmetric Keys
· The public keys are stored in compressed .key files at [TIA INSTALLATION]\Data\Hwcn\Custom
· Each key file contains · Metadata (version, key type, key family, etc.)
· Key data ­ PLC public key for the EC-ElGamal-like encryption
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

P3 ­ An Example .key File
version: 1 orderNumber: s71500-connection firmwareVersion: keyType: connection familyType: S7-1500 key data: 8456...
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

P3 Handshake Design Vulnerabilities
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Rogue Engineering Station Session Key Establishment

1. Pre-calculate PreKey encryption

and CEK, CS, KEK

PreKey

Challenge

KDK

2. Let Python do the symmetric encryptions and the checksum calculation to build keying material 2 & 3

KDF

CEK

CS

KEK

3. The Python script wraps the session key derivation function from the relevant dll
· We didn't reverse the session key derivation function f, due to lack of time

TB-HASH

PLC public
key

EC ElGamal
like

AES ECB

AES CTR

PreKey with asymmetric encryption

Checksum with symmetric encryption

Keying material 1 Keying material 2

Encrypted KDK And challenge
Keying material 3

Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

REing the TIA Handshake
· TIA is huge ­ find your target files
· OMSp_core_managed.dll ­ main S7 communication DLL · Mixed mode DLL
· Managed CIL bytecode ­ C# · Native (unmanaged) x86/x64 opcodes ­ C++
· Choose your tools
· Managed code (.NET) - Reflector/dnSpy · Native C++ code - IDA Pro
· Improve your reverse engineering starting point
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

REing the TIA Handshake
· TIA is huge ­ find your target files
· OMSp_core_managed.dll ­ main S7 communication DLL · Mixed mode DLL
· Managed CIL bytecode ­ C# · Native (unmanaged) x86/x64 opcodes ­ C++
· Choose your tools
· Managed code (.NET) - Reflector/dnSpy · Native C++ code - IDA Pro
· Improve your reverse engineering starting point
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Tip #1 ­ Identify Native Code Entry Points
· omsp_core_managed.dll managed part opened in dnSpy
· Let's click on s_set_server_public_key
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Tip #1 ­ Identify Native Code Entry Points
· Wait...Where is the function body??? · Looks like it's an unmanaged function... · How can we find its implementation?
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Tip #1 ­ Identify Native Code Entry Points
· RVA for the native part
Image Base (0x180000000) + RVA (0x109780) = 0x180109780
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Tip #2: C++ and RTTI
· Run-Time Type Information · Allow C++ programmers to examine object types dynamically · The information must be inside the binary · We could use it
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Tip #2: C++ and RTTI ­ Virtual Tables
1. Find RTTI Objects 2. Locate the relevant virtual tables
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Tip #2: C++ and RTTI ­ Virtual Tables
1. Find RTTI Objects 2. Locate the relevant virtual tables
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Tip #2: C++ and RTTI ­ Virtual Tables
1. Find RTTI Objects 2. Locate the relevant virtual tables 3. Rebuild them
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Tip #2: C++ and RTTI ­ Virtual Tables
1. Find RTTI Objects 2. Locate the relevant virtual tables 3. Rebuild them
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Combine Them All
· Scan the .NET metadata and grab the native entry points
· Scan your .idb and grab the relevant RTTI data · Use IDAPython to add this information to your .idb
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Combine Them All - Example
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Combine Them All - Example
· Much better, isn't it?
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Rogue Engineering Station Stealth Program Injection
Attack Demo

Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

49

Summary
· Vulnerabilities in the S7 protocol ­ P3
· TIA is not authenticated · "One Ring to Rule them All"
· A Python attack tool that impersonates TIA
· Download a recorded program to any S7-1500 PLC · Stealth program injection attack
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

Thank You!
Rogue7: Rogue Engineering Station Attacks on Simatic S7 PLCs

