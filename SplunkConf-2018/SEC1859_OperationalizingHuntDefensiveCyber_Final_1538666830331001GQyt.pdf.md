© 2018 SPLUNK INC.
Operationalizing Hunt: Defensive Cyber Operations
Hunting Adversarial Behaviors
Anthony Talamantes | Manager, Defensive Cyber Operations Todd Kight | Lead Cyber Threat Analyst October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Summary
 Overview: Creating a Threat Based Cyber Team  Use Cases & Data
· Requirements · Access  Traditional SOC  Hunt Methodologies  Hunt & Content Development

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Overview: Building a Threat-Based
Cyber Team
Review .conf17

© 2018 SPLUNK INC.
Johns Hopkins University Applied Physics Lab
University Affiliated Research Center Sponsors include DOD, NASA, DHS, IC 6,000+ staff $1.5 B revenue

Defensive Cyber Operations
 JHUAPL cyber attack 2009 · Focus on Security Posture
 Never let an Incident go to waste · Defense partners
 Change in Threat landscape  Moved focus from Security Posture to Capability Posture  Cyber maturity evolution
· Response & Mitigation · Behaviors & Hunting  Investment in Technology, People, and Process  Change in Philosophy  Change in Core competencies

© 2018 SPLUNK INC.

Change in Philosophy

© 2018 SPLUNK INC.

 Threat Focused Cyber Operations · Research and identify Threats targeting your organization · Target advanced tactics, techniques and procedures of adversary · Emulate threat in your environment · Develop hunting and analytics techniques
 Changes, Challenges & Culture · What is behavioral monitoring anyways? · Mitigation vs Detection · What is Threat Intelligence? · More than indicators of compromise

Threat Emulation, Actor Profiling, Tradecraft Analysis,
Orchestration
Malware Analysis, Hunting Behavioral Artifacts
AV, Sinkhole, IPS, Firewall

Threat Intelligence

Defensive Cyber Operations Inception

© 2018 SPLUNK INC.

Philosophy
 Use Cases  Data Analysis  Behaviors  Visibility based  Agility  Enrichment  Automation  Independence  DevOps

Capability Posture

 Technology · Splunk · EDR
 People · New skillsets · New approach
 Process · Hunting · Agility

Vehicle For
Change

Defensive Cyber Operations Construct

© 2017 SPLUNK INC.

·Blue sky threats ·Research threat actors ·Threat Intelligence ·Tradecraft research ·Profiling and Patterns

Research

Adaptive
Red Team

·Threat Emulation ·Proof of concept ·External Adaptive RT · Predictive

· Hunting ·Continuous monitoring ·Gap analysis ·Fidelity identification ·Comparative analysis

Analytics

DevOps

· Scripting ·Content Creation ·Compound Correlation · Enrichment · Orchestration

© 2018 SPLUNK INC.
Data
Requirements & Access

MITRE ATT&CKTM model
Starting Point in Defining Use Cases

© 2018 SPLUNK INC.

 "We started ATT&CK almost five years ago as a way to categorize common adversary behavior for adversary emulation and intrusion detection research."
 MITRE ATT&CK Philosophy · 4.1 Conceptual · There are three conceptual ideas that are core to the philosophy behind ATT&CK:
- It maintains the adversary's perspective; - It follows real-world use of activity through empirical use examples; - The level of abstraction is appropriate to bridge offensive action with possible defensive countermeasures.

https://www.mitre.org/capabilities/cybersecurity/overview/cybersecurity-blog/the-philosophy-of-attck https://www.mitre.org/sites/default/files/publications/pr-18-0944-11-mitre-attack-design-and-philosophy.pdf

© 2018 SPLUNK INC.
Process For Defining Data Requirements

Use Cases

Data Requirements

On-board Data

Emulate Threat

Verify Visibility

MITRE ATT&CKTM

Gap Analysis

Use Cases & Data Requirements
 ATT&CK ID T1015

© 2018 SPLUNK INC.

Use Cases & Data Requirements
 ATT&CK ID T1175

© 2018 SPLUNK INC.

Use Cases & Data Requirements
 Data needed to support Use Cases · Windows registry · File monitoring · Process monitoring · DLL monitoring · Process monitoring · Authentication logs · API monitoring · Windows Event logs · Packet Capture

© 2018 SPLUNK INC.

Use Cases & Data Requirements
 In addition ­ we also leverage · Process to network enumeration · Command line arguments · Module loads · Analytic data

© 2018 SPLUNK INC.

Getting to Data Fast
 Lower cost of entry  Google-like query language supporting all analysts  Language to support advanced queries  Normalization  Buckets
· Raw · Supplemental · Interesting · Actionable  Focus areas

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Traditional SOC
Discussion on Reactive Approach

Traditional SOC

 Matching Atomic IOCs · IP Addresses · Email addresses · Domains · File Hashes

Hunting?

 Reactive Based
· Mitigating indicators of someone
else's compromise

Cyber Operations

© 2018 SPLUNK INC.
Response Triage
Mitigation

© 2018 SPLUNK INC.
Hunt Methodologies
A few approaches to get things started

Hunt Methodologies

© 2018 SPLUNK INC.

Pivoting  Use reference point as a start Referential Hunting  Stacking
· Content (use cases/signatures) · Pre-determined data (metered execs)  Baseline Drift · Expected ports unexpected processes · Uniqueness / Newness / Rareness
· Lateral · C2 · Account Usage  Compound Correlation · <develop threat model> · <combine above methods to reach a conclusion> · This + that + the other thing = interesting Rabbit-holing

Pivot Points

Email

Infrastructure IP X-Header Sender Name

Malware Analysis

PDB path Certificate Behavior Other Strings

Web

User-Agent

Domain

Registrant Infrastructure

© 2018 SPLUNK INC.

Measuring Progress ­ Hunting Maturity Model

What level are you?

 Know your data
 Understand the threat
 Avoid reliance on vendor generated alerts

 Use threat intelligence differently

 Research  Emulate
 Create
 Utilize varying hunt methodologies

Ref: https://www.linkedin.com/pulse/threat-hunting-maturity-model-ely-kahn https://sqrll.com

Measuring Progress - Attack Lifecycle

Delivery Installation

Visibility Post Compromise

© 2018 SPLUNK INC.

recovery external reconnaissance

lateral

credential theft

persistence

recon

c2/exfil

code execution

Measuring Progress - Attack Lifecycle
FOCUS ON LATERAL

Potential Technologies  EDR  Sysmon  Netflow  IDS  Firewall (host) ...

Post Compromise

lateral

credential theft

persistence

recon

c2/exfil

code execution

© 2018 SPLUNK INC.

Measuring Progress - Attack Lifecycle
FOCUS ON PERSISTENCE

Potential Technologies  EDR  Sysmon  Regmon ...

Post Compromise

lateral

credential theft

persistence

recon

© 2018 SPLUNK INC.

c2/exfil

code execution

© 2018 SPLUNK INC.
Hunt & Content Development
Building more meaningful signatures

Hunt & Content Development
Building more meaningful signatures
Sources of Information  Threat Intelligence  MITRE's ATT&CKTM model  Independent research
Process  Threat Emulation  Walkthrough ­ let's build a use case  High fidelity content development frees up time to Hunt!

© 2018 SPLUNK INC.

Hunt & Content Development
Evolving towards something more useful

© 2018 SPLUNK INC.

Historically...
 SOC responded to vendor provided alerts from vendor provided signatures
 This was a black box approach  We needed something more

Vendor Provided

Signatures

Alerts

Hunt & Content Development
Using MITRE's ATT&CKTM model

© 2018 SPLUNK INC.

Pros  Excellent starting point for content development  Extensive list of well defined tactics and techniques  Maps tactics and techniques to adversary  Validates existing data and identifies gaps in visibility
Cons  Opportunities exist for inclusion of detection signatures

MITRE's Adversarial Tactics, Techniques, and Common Knowledge ATT&CKTM is a curated knowledge base and model for cyber adversary behavior, reflecting the various phases of an adversary's lifecycle and the platforms they are known to target. ATT&CK is useful for understanding security risk against known adversary behavior, for planning security improvements, and verifying defenses work as expected.

Hunt & Content Development
Using additional research and bright shiny ideas
 Credential Theft ­ Golden ticket  Lateral ­ DCOM <extended research beyond ATT&CK>  Persistence ­ WMI
 Bloggers · enigma0x3 · mattifestation · Cyb3rWard0g

© 2018 SPLUNK INC.

Hunt & Content Development
Using Threat Intelligence
 Indicators of Compromise (IOCs) · Matching (not hunt)
 Threat Intelligence Reports · Understanding TTPs · Understanding Threat

© 2018 SPLUNK INC.

Hunt & Content Development
Let's build a use case (signature)

Threat Intel
MITRE's ATT&CKTM
Research

Threat Emulation

Content Development

Signatures

© 2018 SPLUNK INC.
Alerts

© 2018 SPLUNK INC.

Hunt & Content Development - Easy
T1015 ­ Accessibility Features

Accessibility Features

Technique

ID

T1015

Tactic

Persistence, Privilege Escalation

Platform

Windows

Permissions Required

Administrator

Effective Permissions

SYSTEM

Data Sources

Windows Registry, File monitoring, Process monitoring

CAPEC ID

CAPEC-558

 Great starting point  Limited data needed for detection  Easy to emulate  Easy to detect

Data Sources Use Cases
Emulation (Staging) Emulation (Staging)
Emulation (Execution)

Hunt & Content Development - Easy
T1015 ­ Accessibility Features / Our Take
EDR, Sysmon, EventID 4688, Application Whitelisting, Splunk Regmon
Staging (binary replacement and/or registry modification) Execution (parent child mismatch)
replace any of the 'sticky keys' executables with the program you want to run (c:\windows\system32\cmd.exe)
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\#{target_executable}" /v "Debugger" /t REG_SZ /d "C:\windows\system32\cmd.exe" /f
Shift key ...

© 2018 SPLUNK INC.

Detection (Staging)

Hunt & Content Development - Easy
T1015 ­ Accessibility Features / Our Take
(regmod:"\registry\machine\software\microsoft\windows nt\currentversion\image file execution options\sethc.exe\debugger") OR (regmod:"\registry\machine\software\microsoft\windows nt\currentversion\image file execution options\utilman.exe\debugger") OR (regmod:"\registry\machine\software\microsoft\windows nt\currentversion\image file execution options\osk.exe\debugger") OR (regmod:"\registry\machine\software\microsoft\windows nt\currentversion\image file execution options\magnify.exe\debugger") OR (regmod:"\registry\machine\software\microsoft\windows nt\currentversion\image file execution options\narrator.exe\debugger") OR (regmod:"\registry\machine\software\microsoft\windows nt\currentversion\image file execution options\displayswitch.exe\debugger") OR (regmod:"\registry\machine\software\microsoft\windows nt\currentversion\image file execution options\atbroker.exe\debugger")

© 2018 SPLUNK INC.

Detection (Execution)

Hunt & Content Development - Easy
T1015 ­ Accessibility Features / Our Take
( (parent_name:winlogon.exe username:SYSTEM AND (process_name:cmd.exe OR process_name:explorer.exe)) OR (process_name:sethc.exe AND cmdline:211 AND -(file_desc:"Accessibility shortcut keys")) OR (process_name:osk.exe AND -file_desc:"Accessibility On-Screen Keyboard") OR (process_name:magnify.exe AND -file_desc:"Microsoft Screen Magnifier") OR (process_name:narrator.exe AND -(file_desc:"Narrator" OR file_desc:"Screen Reader")) OR (process_name:displayswitch.exe AND -file_desc:"Display Switch") OR (process_name:atbroker.exe AND -(file_desc:"Windows Assistive Technology Manager" OR file_desc:"Transitions Accessible technologies between desktops")) ) AND username:SYSTEM

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Hunt & Content Development - Challenging
T1175 ­ Distributed Component Object Model

Distributed Component Object Model

Technique

ID

T1175

Tactic

Lateral Movement

Platform Permissions Required
Data Sources

Windows Administrator, SYSTEM
API monitoring, Authentication logs, DLL monitoring, Packet capture, Process monitoring, Windows Registry, Windows event logs

 A little more challenging to detect
 Emulated threat
 Identified additional data sources (process-to-netconn)
 Result: successful detection of technique and identification of attacker and victim hosts

Key Takeaways
Our story

© 2018 SPLUNK INC.
1. Catalyst for change 2. Building the team 3. Value of data 4. Research and Threat Intelligence 5. Hunt methodologies 6. Hunt & Content development 7. Measure progress

© 2018 SPLUNK INC.
Q&A

