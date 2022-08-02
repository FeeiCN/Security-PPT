TRAPS ADVANCED ENDPOINT PROTECTION
Fredrik Lundgren
System Engineer RADPOINT

THE RISE OF RANSOMWARE IS PREVENTION POSSIBLE?
Patrick Reischl, CISSP
Specialist System Engineer ­ Traps ­ Nordics, Baltics and Eastern Europe
2 | © 2017, Palo Alto Networks. All rights reserved.

The Impact of Ransomware

WannaCry ~$750M (2017) Locky ~$220M Cryptowall ~$100M CryptXXX ~$73M Cerber ~$54M 38% Global Rise in Cyber Insurance Demand Nov 2016: 1 BTC = 700$ Nov 2017: 1 BTC = 7000$
3 | © 2017, Palo Alto Networks. All rights reserved.

Over $1 Billion Dollars in 2016 on ransom alone

The Impact of Ransomware
How did it impact your business? · Honda, Renault, and Nissan had to stop production · UK National Health Service forced to run on emergency-only basis during attack · Public Transit systems affected gave free ridership until the issue was resolved
How many man hours did it take to...? · Find backups and restore files? · Get systems back online? · Analyze and determine if the attack was just ransomware?
4 | © 2017, Palo Alto Networks. All rights reserved.

Detect and respond to Ransomware?...

WannaCry

Exploits Microsoft SMB vulnerability previously
patched by Microsoft

Gains kernel level privileges by direct kernel exploitation

Drops DoublePulsar tool capable of injecting and running malicious code
by calling legitimate processes

Scans internal network for other endpoints with SMB vulnerability and copies

Runs WannaCry Ransomware, encrypting users machine
6 | © 2017, Palo Alto Networks. All rights reserved.

The Need For A Multi-Method Prevention Approach

CONDUCT RECONNAISSANCE
COMPROMISE ENDPOINT
ESTABLISH CONTROL CHANNEL
PURSUE OBJECTIVES
TARGETED ATTACK
SEQUENCE
8 | © 2017, Palo Alto Networks. Confidential and Proprietary.

EXPLOIT SOFTWARE VULNERABILITIES
FILE-LESS ATTACK

EXECUTE MALWARE
RAPIDLY CHANGE & MORPH MALWARE
TARGETED MALWARE
MACROS, SCRIPTS, ETC.

Isn't Windows Defender Enough?
8000 malware samples tested Source: SecureLink Germany Endpoint Protection Solutions Report 10/2017
9 | © 2017, Palo Alto Networks. Confidential and Proprietary.

Isn't Windows Defender Enough?
8000 malware samples tested ­ Holiday Test: 14 days offline Source: SecureLink Germany Endpoint Protection Solutions Report 10/2017
10 | © 2017, Palo Alto Networks. Confidential and Proprietary.

Five Fundamental Capabilities of Any Endpoint Product

1 Prevention Focused

2Malware
Prevention

3Exploit
Prevention

4 Automated
Prevention w/ Threat Intel

5 Persistent
Protection

Detection Secondary

&toRPTerhesArpveeouannttotsiKImoennntaeotlwicinnatllo&y

PUCrnoeknCvnveooennOwrtntinoeOK-ncPnnteroleidnwm,eZnD,,e&OOrisoffcU-ffDlo-inPnnakernyenemocwtend/

11 | © 2017, Palo Alto Networks. Confidential and Proprietary.

To Prevent 1. Delivery Methods Ransomware: 2. Payload
12 | © 2017, Palo Alto Networks. All rights reserved.

Attack Sequence

The Attack Sequence

Conduct Reconnaissance
Compromise Endpoint
Establish Control Channel
Pursue Objectives
17 | © 2017, Palo Alto Networks. All rights reserved.

Delivery
Web-Based Exploitation
Malware Download
Email Attachments

Malicious Action

Exploit Good Applications

Run Malware

Run Scripts

Run MS Office Macros

Exploit Operating System

Escalate Privileges

Traps Multi-Method Exploit Prevention

Reconnaissance Protection
Automatic Prevention of Vulnerability Profiling Used by Exploit Kits

Technique-Based Exploit Prevention
Blocking of Exploit Techniques Used to Manipulate Good
Applications

Kernel Protection
Protection Against Exploits Targeting or Originating from the
Kernel

19 | © 2017, Palo Alto Networks. Confidential and Proprietary.

Exploits Subvert Authorized Applications

Bug/Vulnerability Vendor Patches

ROP
Heap Spray
Authorized Application

Begin Malicious Activity
Utilize OS Functions
 Download malware  Steal critical data  Encrypt hard drive  Destroy data  More...

21 | © 2017, Palo Alto Networks. Confidential and Proprietary.

Traps Blocks Exploit Techniques
Heap Spray
Authorized Application
22 | © 2017, Palo Alto Networks. Confidential and Proprietary.

No Malicious Activity
Traps EPM

Blocking Exploitation Techniques Is the Most Effective Approach

Total Number

Known Software Vulnerabilities

Patching

Requires Prior Knowledge, Proactive Application

Public Exploits (Actual Attacks)

Signature / Behavior

Traps

Time

Requires Prior Knowledge of Weaponized Exploits
Requires No Patching, No Prior Knowledge of
Vulnerabilities, and No Signatures

23 | © 2017, Palo Alto Networks. Confidential and Proprietary.

Value of Technique-based Exploit Prevention

TIMELINE

Traps Version 2.3.6
Released

Vulnerability Discovered in Adobe Flash Player
(CVE-2015-0359)

Attackers Attempted to Exploit Vulnerability.

Traps Blocked the Attempt.
Traps v2.3.6

No Updates or Patches
Since Installation

Traps Prevents Zero-day and Unknown Exploits That Have Yet to be Discovered

25 | © 2017, Palo Alto Networks. Confidential and Proprietary.

Multi-Method Malware Prevention

EXPLOIT SOFTWARE VULNERABILITIES FILE-LESS ATTACK

MALWARE MORPHING TARGETED

MACROS / SCRIPTS

27 | © 2017, Palo Alto Networks. Confidential and Proprietary.

REDUCE THE ATTACK SURFACE
Policy Controls, Child Processes, Execution Restrictions
PREVENT KNOWN MALWARE
WildFire Threat Intelligence
PREVENT UNKNOWN MALWARE
Local Analysis via Machine Learning
DETECT ADVANCED THREATS
WildFire Inspection & Analysis

Traps Multi-Method Malware Prevention

Threat Intelligence
Prevents Known Threats

Local Analysis
Prevents Unknown Threats

Dynamic Analysis

Malicious Process Prevention

Detects Advanced Unknown Threats

Prevents Script-Based & File-Less Threats

Ransomware Protection
Additional Ransomware
Protection

28 | © 2017, Palo Alto Networks. Confidential and Proprietary.

Preventing Known Threats

WildFire Threat
Intelligence

· Delivers over 230,000 new protections daily in 5min intervals
· A 2-way street across 19,500 customers and millions of sensors
· Enterprises · Governments · Tech Partners · 3rd Party Intel Feeds · Human Analysis from Unit 42 · Other Palo Alto Networks components
· Continuously analyzed and utilized by the entire Next-Gen Security Platform of Palo Alto Networks

29 | © 2017, Palo Alto Networks. Confidential and Proprietary.

Platform Benefits For Stand-Alone Traps Deployments

FW Firewalls
Aperture Traps

Static Analysis
Dynamic Analysis

Industry Sharing
3rd Party Feeds
Tech Partners

WildFire

Traps

Machine Learning
Bare Metal Analysis
Analysis

Prevention

1 Automatic blocking of malware first encountered elsewhere
2 Increased effectiveness of Local Analysis as machine learning model is trained

Threat Intel
30 | © 2017, Palo Alto Networks. Confidential and Proprietary.

Preventing Unknown Threats

Local Analysis

· Windows and Mac, for online or offline users · No signatures or scanning and invisible to end users · Based on Machine-Learning trained from WildFire

WildFire Analysis

· Runs in the cloud enabling significant computing power without affecting users
· Static Analysis via Machine Learning · Dynamic Analysis · Bare-Metal Analysis
· Acts as a secondary check to reduce potential FPs

31 | © 2017, Palo Alto Networks. Confidential and Proprietary.

Preventing Unknown Threats

Granular Child Process Protection

· Customizable protection against script-based and file-less attacks
· Delivered out-of-the-box and automatically updated based on new threat intelligence without user action

Behavior-Based Ransomware Protection

· An additional layer of prevention to pre-existing malware and exploit prevention capabilities
· Not reliant on signatures or known samples
· Able to discern between good and malicious encryption

32 | © 2017, Palo Alto Networks. Confidential and Proprietary.

Traps Malware Prevention Flow

×
Restricted

×
Restricted

×
Malicious

×
Malicious

×
Malicious

Child Process Checks

No Match

Check

Execution

No Match

Restrictions

Check Hash Overrides

No Match

Check Trusted Publishers

No Match

Check Hash with WildFire

Unknown

Local Analysis

Allowed


Trusted


Benign


Benign


Submit to WildFire for Full Analysis

Process Execution

33 | © 2017, Palo Alto Networks. Confidential and Proprietary.

Traps vs. WannaCry

Exploits Microsoft SMB vulnerability previously
patched by Microsoft

Gains kernel level privileges by direct kernel exploitation

Drops DoublePulsar tool capable of injecting and running malicious code
by calling legitimate processes

Scans internal network for other endpoints with SMB vulnerability and copies

Runs WannaCry Ransomware, encrypting users machine
34 | © 2017, Palo Alto Networks. All rights reserved.

Traps vs. WannaCry

Exploits Microsoft SMB vulnerability previously
patched by Microsoft

Kernel Exploit Prevention

Gains kernel level privileges by direct kernel exploitation

Drops DoublePulsar tool capable of injecting and running malicious code
by calling legitimate processes
Blocks processes from accessing infected shellcode

Malicious EXE Detected

Local Analysis

Threat Intelligence

Known Threat Prevented

Behavior-Based

Dynamic

Ransomware

AnalyRsuisns WannaCry RansomwPareo,tection

encrypting users machine

Ransomware behavior detected
and stopped

Child Process Protection
Scans internal network for other endpoints with SMB vulnerability and copies
Blocks executables from spawning malicious
processes necessary for propagation

35 | © 2017, Palo Alto Networks. All rights reserved.

Traps Delivers Flexible Platform Coverage

Workstations
 Windows XP* (32-bit, SP3 or later)  Windows Vista (32-bit, 64-bit, SP1 or later; FIPS mode)  Windows 7 (32-bit, 64-bit, RTM and SP1; FIPS mode; all
editions except Home)
 Windows Embedded 7 (Standard and POSReady)  Windows 8* (32-bit, 64-bit)  Windows 8.1 (32-bit, 64-bit; FIPS mode)  Windows Embedded 8.1 Pro  Windows 10 Pro (32-bit and 64-bit, CB and CBB)  Windows 10 Enterprise LTSB  OS X 10.10 (Yosemite)  OS X 10.11 (El Capitan)  macOS 10.12 (Sierra)  macOS 10.13 (High Sierra)
38 | © 2016, Palo Alto Networks. Confidential and Proprietary.

Servers
 Windows Server 2003* (32-bit, SP2 or later)  Windows Server 2003 R2 (32-bit, SP2 or later)  Windows Server 2008 (32-bit, 64-bit; FIPS mode)  Windows Server 2008 R2 (32-bit, 64-bit; FIPS mode)  Windows Server 2012 (all editions; FIPS mode)  Windows Server 2012 R2 (all editions; FIPS mode)  Windows Server 2016 (Standard edition)
Virtual Environments
 VMware ESX, Horizon View  Citrix XenServer, XenDesktop, XenApp  Oracle Virtualbox  Microsoft Hyper-V
* Microsoft no longer supports this operating system.

Flexible and Scalable, With Minimal Footprint

Endpoint Security Manager (ESM)

Admin Console

ESM Database

ESM Server

Flexible
 Supports physical & virtual systems  Supports Windows & Mac  Up to 150,000 endpoints/ESM DB
Minimal Footprint
 0.1% CPU Load  50 MB RAM  200 MB HD  No scanning  No virus-signature databases
39 | © 2016, Palo Alto Networks. Confidential and Proprietary.

WildFire

Endpoints

