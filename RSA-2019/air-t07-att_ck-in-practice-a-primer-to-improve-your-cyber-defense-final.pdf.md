SESSION ID: AIR-T07
ATT&CK in Practice A Primer to Improve Your Cyber Defense

Freddy Dezeure
CEO Freddy Dezeure BVBA @Fdezeure www.freddydezeure.eu

Rich Struse
Chief Strategist Cyber Threat Intelligence MITRE @MITREattack attack.mitre.org

#RSAC

#RSAC
Who Are We?

Freddy Dezeure
· Founder and Head of CERT-EU from 2011-2017 · Independent strategic advisor · Advisor/Board Member CoreLight, SpyCloud,
Intel471, CMD, Arctic Security, KEYP · Community contributor

Rich Struse
· Chief Advanced Technology Officer DHS NCCIC 2012-2017
· MITRE, CTI Chief Strategist · Director Oasis, Co-chair CTI Technical Committee · Community contributor

2

(Not)Petya

June 2017 Destructive intent Initial infection via accounting software Spreading using a leaked NSA tool
3

10% of all computers in UA destroyed !
Massive collateral damage: > 3 billion $
4

#RSAC
Threat Landscape 2019: Agile Adversaries
Adaptive Adversary infrastructure
Blending in with legitimate user
­ Using legitimate infrastructure components (PowerShell, Macros) ­ Abusing legitimate credentials ­ Replicating legitimate user behavior
Fast uptake of new vulnerabilities and leaked tools
5

#RSAC
Risk-Based Defense
Threat

Impact

Vulnerability

#RSAC
Threat-Informed Defense

Your Adversaries

Agile Adversaries Industrialization of exploit development

Dependent ­ Connected ­ Exposed Service requires connectedness

Vulnerable ­ Fragile Inherently fragile systems Often unpatchable (or not by you)

Your Assets

Your Systems
7

#RSAC
Identify Your Threats to Improve Your Defense

Motives Targets

Your Adversaries

Infrastructure Behavior

Your Assets

Your Systems
8

#RSAC
Use Threat Intelligence in Your Defense
Identify Your Critical Assets
­ Who would be interested in them? ­ Why?
Maximize the benefit of observing Your Adversaries' Infrastructure
­ Increase the quality and timeliness of Indicators of Compromise (IOCs) ­ Make them actionable (COA)
Observe Your Adversaries' Behavior
­ Techniques, Tactics and Procedures (TTPs)
- Deploy in prevention, detection, response
9

Decomposing the ATT&CK

Recon

Weaponize

Deliver

Exploit

Control

Execute

Maintain

PRE-ATT&CK
Priority Definition · Planning, Direction Target Selection Information Gathering · Technical, People, Organizational Weakness Identification · Technical, People, Organizational Adversary OpSec Establish & Maintain Infrastructure Persona Development Build Capabilities Test Capabilities Stage Capabilities

ATT&CK for Enterprise
Initial Access Execution Persistence Privilege Escalation Defense Evasion Credential Access Discovery Lateral Movement Collection Exfiltration Command and Control
10

#RSAC

#RSAC

#RSAC
Polling Question 1
AIR-T07 Is your organisation currently using the ATT&CK Framework?
­ A. Yes ­ B. No ­ C. I don't know
Results
12

#RSAC
MITRE ATT&CK Key Added Values
Common Taxonomy
Prioritization in Prevention, Detection and Response
­ No need to implement the whole matrix ­ Not all the techniques are equal to you
Easier Sharing of Insights
13

Common Taxonomy

#RSAC
Taxonomy
Common language to describe TTPs Knowledge base of observed TTPs Continuously updated Vendor agnostic Widely adopted by the community
15

#RSAC
16

#RSAC
17

#RSAC
Example T1060: Registry Run Keys / Start Folder
­ Description: Adding an entry to the "run keys" in the Registry or startup folder will cause the program referenced to be executed when a user logs in.[1] The program will be executed under the context of the user and will have the account's associated permissions level. [etc...]
­ Platform: Windows ­ Permissions required: User, Administrator ­ Detection:
o Monitor Registry for changes to run keys that do not correlate with known software, patch cycles, etc. o Monitor the start folder for additions or changes. o Tools such as Sysinternals Autoruns may also be used to detect system changes that could be attempts at
persistence, including listing the run keys' Registry locations and startup folders.[52]
­ Mitigation:
o Identify and block potentially malicious software that may be executed through run key or startup folder persistence using whitelisting[47] tools like AppLocker[48][49] or Software Restriction Policies[50] where appropriate.[51]
­ Data Sources: Windows Registry, File monitoring ­ Examples: 68 groups and software examples
18

#RSAC
Understand Your Adversaries' Behavior
Identify Your Adversaries of interest Which techniques do they use and which traces to they leave? "Track" them with intelligence from the community and security vendors
19

20

#RSAC

Vendors Use MITRE ATT&CK in their Reports
22

Prevention, Detection and Response

#RSAC
Understand Your Controls

Assets

Adversaries
24

Infrastructure (IOCs) Methods (TTPs)
Security Controls

#RSAC
Critical Controls for Your Critical Assets

Critical Assets

Baseline Critical Controls
25

Monitor and Discover Exposure

#RSAC
Vulnerabilities Methods (TTPs)

Critical Assets

Baseline Critical Controls

26

#RSAC
Adapt Your Controls

Critical Assets

Baseline Critical Controls
27

#RSAC
Validate Your Controls

Critical Assets

Baseline Critical Controls
28

How Does CIS 6 Help You in Prevention?
29

#RSAC
Understand Your Detection
Gain Visibility
­ Priorities in log collection
Design Analytics
­ Write them with knowledge of Your Adversaries ­ Get them from the community
Deploy
­ Detect / Hunt / Refine
30

#RSAC
Determine Overlaps between Your Adversaries
Where do you get the highest impact?
31

#RSAC
DC/DNS/Email logs
32

#RSAC
+Proxy/Endpoint AV/Sysmon
33

#RSAC
Analytics Instead of Indicators

Indicators*

Analytics

Detect known bad Artifact-driven
Fewer false positives More atomic
Higher quantity
*good, fresh, indicators are useful too

Detect suspicious events Behavior-driven
More false positives Broader
Lower quantity Longer lifetime
34

#RSAC
Build an Analytic
Read the ATT&CK documentation for the techniques you expect
­ Separate possible legitimate use from malicious use ­ Look for existing analytics in MITRE CAR or community sources
Simulate the techniques
­ Carry out the techniques via your own testing or pre-written scripts ­ What does it look like in your logs?
Write and iterate your analytics
­ Write your search, narrow down false positives, and iterate ­ Keep testing ­ check for a variety of ways it can be used, not just the easiest
35

#RSAC
Convert your Analytics in Pseudo-Code
https://github.com/Neo23x0/sigma
36

Community Tools
SIGMA Editor

#RSAC
Atomic Threat Coverage Analytics Documentation

37

#RSAC
Test Your Controls

Critical Assets

Baseline Critical Controls
38

#RSAC
Red Team Tools
Active testing of controls using MITRE ATT&CK
­ MITRE Caldera ­ Endgame RTA ­ Red Canary Atomic Red Team ­ Uber Metta
39

#RSAC
CALDERA
Automated adversary emulation
­ Safely replicate realistic adversary behavior ­ Repeatable testing and verification of prevention/detection
Features
­ Uses ATT&CK to create Adversary profiles ­ Uses AI and modeling to make decisions about actions ­ Self-cleans after operation completes ­ Low install overhead ­ Does not require extensive red team knowledge to operate
40

#RSAC
Emulate Adversaries
Connect techniques in attack sequence Test patterns of behavior focusing on defense effectiveness Triage events
41

Gap Analysis

Persistence

Privilege Escalation

Defense Evasion

Credential Access

Discovery

Lateral Movement

Execution

Collection

Exfiltration

Command and Control

DLL Search Order Hijacking

Brute Force

Account Discovery

Windows Remote Management

Automated Collection

Automated Exfiltration

Commonly Used Port

Legitimate Credentials Accessibility Features

Binary Padding

Credential Dumping

Application Window Discovery

Third-party Software

Application Deployment

Command-Line

Clipboard Data Data Staged

Data Compressed Data Encrypted

Communication Through Removable Media

AppInit DLLs Local Port Monitor
New Service Path Interception

Code Signing Component Firmware
DLL Side-Loading Disabling Security Tools

Credential Manipulation
Credentials in Files Input Capture

File and Directory Discovery

Software

Exploitation of Vulnerability Local Network Configuration

Discovery

Logon Scripts

Scheduled Task

File Deletion

Network Sniffing

Local Network Connections

Pass the Hash

File System Permissions Weakness Service Registry Permissions Weakness

Discovery

File System Logical Offsets

Two-Factor Authentication Interception

Network Service Scanning

Pass the Ticket Remote Desktop Protocol

Web Shell

Indicator Blocking

Peripheral Device Discovery

Remote File Copy

Exploitation of Vulnerability

Remote Services

Basic Input/Output System

Bypass User Account Control

Permission Groups

Replication Through

Execution through API Graphical User Interface
InstallUtil PowerShell Process Hollowing Regsvcs/Regasm Regsvr32 Rundll32 Scheduled Task
Scripting

Data from Local System Data Transfer Size Limits Custom Command and

Data from Network Shared Exfiltration Over Alternative

Control Protocol

Drive

Protocol

Custom Cryptographic

Data from Removable Media
Email Collection

Exfiltration Over Command and Control Channel

Protocol Data Obfuscation Fallback Channels

Input Capture

Exfiltration Over Other

Multi-Stage Channels

Screen Capture Audio Capture

Network Medium Multiband Communication
Exfiltration Over Physical

Video Capture

Medium

Multilayer Encryption

Bootkit

DLL Injection

Discovery

Removable Media

Service Execution

Scheduled Transfer

Peer Connections

Change Default File

Component Object Model Hijacking

Process Discovery

Shared Webroot

Windows Management

Remote File Copy

Association Component Firmware

Indicator Removal from Tools

Query Registry

Taint Shared Content

Remote System Discovery Windows Admin Shares

Instrumentation MSBuild

Standard Application Layer Protocol

Hypervisor Logon Scripts

Indicator Removal on Host

Security Software Discovery

Execution through Module Load

Standard Cryptographic Protocol

Modify Existing Service

InstallUtil

System Information

Standard Non-Application

Redundant Access

Masquerading

Discovery

Layer Protocol

Registry Run Keys / Start

Modify Registry

System Owner/User

Uncommonly Used Port

Folder

NTFS Extended Attributes

Discovery

Web Service

Security Support Provider Shortcut Modification

Obfuscated Files or Information

System Service Discovery System Time Discovery

Data Encoding

Windows Management Instrumentation Event

Process Hollowing Redundant Access

Subscription

Regsvcs/Regasm

Winlogon Helper DLL

Regsvr32

Netsh Helper DLL

Rootkit

Authentication Package External Remote Services

Rundll32
Define your Scripting Software Packing
threat model Timestomp MSBuild Network Share Removal

Assess your coverage

Identify gaps

Fill gaps

Install Root Certificate

42

43

#RSAC
Polling Question 2
AIR-T07 In which area do you think ATT&CK would be most useful?
­ A. Taxonomy ­ B. Prevention ­ C. Detection
Results
44

Share More

#RSAC
Share Insights and Contribute
Sharing TTPs/analytics/SIGMA rules is easier than sharing IOCs
­ Higher level of abstraction ­ Better protection of the victim's identity
It's also more useful
­ More context ­ More stable in time

#RSAC
EU ATT&CK User Community
Mailing list -> opt in ? -> email to info@circl.lu Next workshop in Brussels 9-10 May 2019
47

#RSAC
Polling Question 3
AIR-T07 What would be the most useful to operationalize ATT&CK??
­ A. Better Web Content ­ B. Webinars ­ C. Community Activities - Workshops
Results
48

#RSAC
"Apply" Slide
Next week you should:
­ Familiarize yourself with the ATT&CK documentation and resources
In the first three months following this presentation you should:
­ Identify Your Adversaries ­ Identify and deploy at least three use cases in your organization
Within six months you should:
­ Permeate the whole of your cyber defense using ATT&CK
49

Resources
ATT&CK repository and ATT&CK Navigator STIX: https://github.com/mitre/cti TAXII: https://cti-taxii.mitre.org/taxii MITRE Common Analytics Repository and CARET SIGMA and SIGMA rule collection (Thomas Patzke, Florian Roth) SIGMA Marketplace and Sigma Editor (SOCPRIME) Threathunter Playbook (Roberto Rodriguez) ThreatHunting Splunk APP (Olaf Hartong) Atomic Treat Coverage Analytics documentation system (Tieto)
50

