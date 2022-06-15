| 1|
MITRE ATT&CKTM Update
Richard Struse Chief Strategist for Cyber Threat Intelligence
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12

| 2|
What is
?
A knowledge base of adversary behavior
Ø Based on real-world observations Ø Free, open, and globally accessible Ø A common language Ø Community-driven
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 3|
ATT&CK Today

Techniques: how the goals are achieved

Tactics: the adversary's technical goals

Initial Access

Execution

Persistence

Privilege Escalation

Defense Evasion

Credential Access

Discovery

Lateral Movement

Collection

Command and Control

Drive-by Compromise

Scheduled Task

Binary Padding

Network Sniffing

AppleScript

Audio Capture

Commonly Used Port

Exploit Public-Facing Application
External Remote Services Hardware Additions
Replication Through Removable Media
Spearphishing Attachment Spearphishing Link

Launchctl Local Job Scheduling
LSASS Driver Trap
AppleScript CMSTP
Command-Line Interface Compiled HTML File

Access Token Manipulation Bypass User Account Control Extra Window Memory Injection
Process Injection DLL Search Order Hijacking Image File Execution Options Injection
Plist Modification Valid Accounts

Account Manipulation Bash History Brute Force
Credential Dumping Credentials in Files Credentials in Registry
Exploitation for Credential Access

Account Discovery
Application Window Discovery
Browser Bookmark Discovery
Domain Trust Discovery File and Directory Discovery Network Service Scanning

Application Deployment Software
Distributed Component Object Model
Exploitation of Remote Services
Logon Scripts Pass the Hash

Automated Collection Clipboard Data
Data from Information Repositories
Data from Local System
Data from Network Shared Drive
Data from Removable Media

Communication Through Removable Media
Connection Proxy
Custom Command and Control Protocol
Custom Cryptographic Protocol
Data Encoding

Spearphishing via Service

Control Panel Items

Accessibility Features

BITS Jobs

Forced Authentication

Network Share Discovery

Pass the Ticket

Data Staged

Data Obfuscation

Supply Chain Compromise

Dynamic Data Exchange

AppCert DLLs

Clear Command History

Hooking

Password Policy Discovery

Remote Desktop Protocol

Email Collection

Domain Fronting

Trusted Relationship Valid Accounts

Execution through API
Execution through Module Load
Exploitation for Client Execution
Graphical User Interface

AppInit DLLs Application Shimming
Dylib Hijacking File System Permissions Weakness
Hooking Launch Daemon

CMSTP Code Signing Compiled HTML File Component Firmware
Component Object Model Hijacking

Input Capture Input Prompt Kerberoasting
Keychain
LLMNR/NBT-NS Poisoning and Relay

Peripheral Device Discovery Permission Groups Discovery
Process Discovery Query Registry
Remote System Discovery Security Software Discovery

Remote File Copy Remote Services
Replication Through Removable Media
Shared Webroot SSH Hijacking

Input Capture Man in the Browser
Screen Capture Video Capture

Domain Generation Algorithms
Fallback Channels Multiband Communication
Multi-hop Proxy Multilayer Encryption

InstallUtil Mshta

New Service Path Interception

Control Panel Items DCShadow

Password Filter DLL Private Keys

System Information Discovery

Taint Shared Content Third-party Software

Multi-Stage Channels Port Knocking

PowerShell Regsvcs/Regasm
Regsvr32 Rundll32

Procedures: Specific PortMonitors
Service Registry Permissions Weakness

Deobfuscate/Decode Files or Information

Securityd Memory Two-Factor Authentication

Setuid and Setgid

Disabling Security Tools

Interception

Startup Items

DLL Side-Loading

technique implementation System Network Configuration Discovery

Windows Admin Shares Windows Remote

Remote Access Tools Remote File Copy

Management

System Network

Standard Application Layer

Connections Discovery

Protocol

Scripting Service Execution
Signed Binary Proxy Execution

Web Shell

.bash_profile and .bashrc Account Manipulation

Exploitation for Privilege Escalation

Authentication Package

SID-History Injection

Execution Guardrails
Exploitation for Defense Evasion
File Deletion

System Owner/User Discovery
System Service Discovery System Time Discovery

Standard Cryptographic Protocol
Standard Non-Application Layer Protocol

Signed Script Proxy Execution

BITS Jobs Bootkit

Sudo Sudo Caching

File Permissions Modification

Virtualization/Sandbox Evasion

Uncommonly Used Port Web Service

Source

Browser Extensions

File System Logical Offsets

Space after Filename Third-party Software

Change Default File Association

Gatekeeper Bypass Group Policy Modification

Trusted Developer Utilities

Component Firmware

Hidden Files and Directories

User Execution
Windows Management Instrumentation

Component Object Model Hijacking
Create Account

Hidden Users Hidden Window HISTCONTROL

Windows Remote Management
XSL Script Processing

External Remote Services Hidden Files and Directories
Hypervisor

Indicator Blocking
Indicator Removal from Tools

Kernel Modules and Extensions

Indicator Removal on Host Indirect Command Execution

Launch Agent

Install Root Certificate

© 2019 The MITRE Corporation. All rights rLeCs_LeOrAvDe_DdY.LIAB Apdpditrioonved for Public Release 19-0006In6s-ta1llU2ti.l

Login Item

Launchctl

Exfiltration
Automated Exfiltration Data Compressed Data Encrypted
Data Transfer Size Limits
Exfiltration Over Other Network Medium
Exfiltration Over Command and Control Channel
Exfiltration Over Alternative Protocol
Exfiltration Over Physical Medium
Scheduled Transfer

Impact
Data Destruction Data Encrypted for Impact
Defacement Disk Content Wipe Disk Structure Wipe Endpoint Denial of Service Firmware Corruption Inhibit System Recovery Network Denial of Service Resource Hijacking Runtime Data Manipulation
Service Stop Stored Data Manipulation
Transmitted Data Manipulation

| 4|
What's Next for ATT&CK: "One ATT&CK"
§ Consistency and integration between matrices
­ Refactor PRE-ATT&CK as part of this

Mobile ATT&CK Enterprise ATT&CK PRE-ATT&CK

It's just

© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 5|
October 2019 Update Release notes available at: https://attack.mitre.org/resources/updates/
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 6|
PRE-ATT&CK

Pre-ATT&CK Today

| 7|
15 Tactics & ~144 Techniques

© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 8|
Pre-ATT&CK Changes
§ New tactics § Significant reduction in number of techniques § Aiming to cover the scope of all current techniques that are
­ a) technical ­ b) visible to some kind of defender ­ c) real
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 9|
Mobile

| 10 |
Total Refresh
§ New techniques § Updating existing techniques § New software entries to account for new threat reporting that we've identified, § External contributions (and always looking for more!) § Align more closely with Enterprise ATT&CK
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 11 |
Sub-Techniques

| 12 |
What are Sub-Techniques
§ Address differing levels of abstraction
­ Consider example Execution techniques: Scripting vs. Rundll32
§ Major change for all ATT&CK users
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 13 |
Credential Dumping Today
§ In the description there 9 ways to perform the action
§ SAM (Security Accounts Manager) § Cached Credentials § Local Security Authority (LSA) Secrets § NTDS from Domain Controller § Group Policy Preference (GPP) Files § Service Principal Names (SPNs) § Plaintext Credentials § DCSync § Proc filesystem (Linux)
§ That's a lot of different behaviors lumped into one technique even
though the end result is similar each time
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 14 |
Credential Dumping With Sub-techniques

Credential Access Account Manipulation Bash History Brute Force Credential Dumping Credentials in Files ...
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

Credential Dumping Sub-Techniques (draft) SAM (Security Accounts Manager) Local Security Authority (LSA) Secrets NTDS from Domain Controller Cached Credentials Group Policy Preference (GPP) Files Service Principal Names (SPNs) Plaintext Credentials ...

| 15 |
How This Affects ATT&CK
§ New techniques -- We added a few new techniques to help us better organize
sub-techniques. (Example: "Pre-OS Boot")
§ Technique-to-sub-technique demotion -- We moved many techniques into
sub-techniques. (Example: "Bootkit")
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 16 |
How This Affects ATT&CK
§ New ID numbering
­ T[technique].[sub-technique]. ­ For example, Access Token Manipulation will still be T1134, but "Token
Manipulation/Theft" will be T1134.001, "Create Process with Token" T1134.002, etc.
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 17 |
How This Affects ATT&CK
§ Technique decomposition -- Some techniques like Account
Manipulation and Process Injection had several sub-techniques created from content in their previous definition.
§ In other cases the techniques will get decomposed and sub-techniques will be
assigned under other applicable techniques. ­ For example, Local Job Scheduling was decomposed into sub-techniques
that fall under "Scheduled Task/Job" and "Scheduled Task/Job (Escalation Possible)".
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 18 |
How This Affects ATT&CK
§ Technique realignment and deprecation -- The analysis of techniques
necessary to do sub-techniques led to some technique realignment between tactics and deprecation of techniques. ­ We pruned back several techniques that didn't fit the core definition of the
tactic, like Hidden Files and Directories not fitting under Persistence, ­ and a small number that needed to be deprecated, like Hypervisor where
we've found no documented use cases beyond proof of concepts.
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 19 |
Benefits
§ Top-level techniques will change less frequently § Coverage assessment
­ understand that there's several ways a technique can be performed.
§ Lead to more refined data sources that apply to techniques and sub-techniques
on specific platforms.
§ Provide a structure for others to add their own local sub-techniques under
existing techniques to meet their specific requirements.
§ Make it easier to fit the ATT&CK Matrix with techniques on a single slide. (Look,
we make a lot of PowerPoints, and we know you do too!)
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 20 |
When is this happening?
§ End of 2019 § Update will be in the form of a separate website to give people time to adjust
and give us feedback before it becomes the "official" version of ATT&CK (3ish months post release).
§ We want feedback from ATT&CK users to make sure we aren't doing this in
vain. ­ Please reach out to us at attack@mitre.org (Use a subject line that starts
with "Sub-technique feedback" so it's easy to spot.)
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 21 |
How Will This Affect Me?
§ Detections and Tooling
­ review and refine
§ Many sub-techniques will map directly to "old" techniques, so in those
cases you should only have to update IDs.
§ You will have some level of effort with mapping new techniques and sub-
techniques as well as determining how to assign things like detection analytics to those sub-techniques that have been decomposed.
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 22 |
How Will This Affect Me?
§ Mapping Intel
­ Significant change and level of effort ­ We plan to keep the historical site and STIX objects available as a reference
for older intel that is mapped to the prior, pre-sub-technique version of ATT&CK. ­ Historic repositories
§ consider how you may want to approach that (e.g. only map new intel to
the new ATT&CK version). ­ We are working on a tool to help with this but still expect this to be time
consuming
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 23 |
Controls

| 24 |
ATT&CK to NIST 800-53
§ The task is extremely labor intensive due to the scope (314 ATT&CK
techniques by 256 controls)
§ Releasing a template mapping at ATT&CKcon 2019 § MITRE will crowd source the mapping so that it can be maintained
collaboratively by the people who use it
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

Template Example
Mapping shows NIST 800-53 controls that protect and/or detect ATT&CK techniques

| 25 |
ß NIST CONTROLS à

ß ATT&CK à

© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 26 |
Cloud

| 27 |
Cloud
§ First version of techniques going out in October with another big release
happening next year.
§ Cloud will be part of enterprise and will be represented by new platforms in
addition to Windows/MacOS/Linux
§ We've added three infrastructure as a service (IaaS) platforms:
­ Amazon Web Services (AWS), ­ Microsoft Azure (Azure), and ­ Google Cloud Platform (GCP).
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 28 |
Cloud (continued)
§ The Software as a service (SaaS) platform will cover techniques against
general cloud-based software platforms.
§ Separately from IaaS and SaaS, we've also added two cloud software
platforms to cover techniques against those specific platforms: ­ Azure Active Directory (Azure AD) and ­ Office 365
§ 36 techniques have been added or updated to cover adversary behavior
against cloud-based platforms.
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 29 |
ATT&CK Sightings

| 30 |
ATT&CK Sightings Ecosystem
· Sighting: A detection of a
specific adversary behavior as defined within ATT&CK · Example: On 6/12/19, T1193
(Spearphishing Attachment) was detected in the US Financial Sector
§ Empower the community with real, anonymized data
about adversary behavior from many sources ­ To enable analysis of what adversaries are doing:
§ What techniques are being detected in the wild? § Are there differences in detections across different sectors? § How do behaviors change over time?
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

Vision of Desired End-State
Security product & service vendors
ISACs & ISAOs

| 31 |
Continuously updated telemetry on what adversaries are actually doing

MSSPs & ISPs

Detections
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

Sightings

-Anonymized -Potentially aggregated

| 32 |
Cyber Analytics Repository

| 33 |
Cyber Analytics Repository (CAR) Relaunch
§ Knowledge base of analytics developed by MITRE based on ATT&CK § Relaunch goal was to address barriers
­ Make it easy to contribute and use
§ Other updates
­ Additions to process data model ­ New analytics ­ Native Splunk queries
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 34 |
ATT&CKcon 2.0

| 35 |
ATT&CKcon 2.0 October 29-30
Entire conference will be live-streamed! Register at: https://www.mitre.org/attackcon-streamed-live
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 36 |
"Getting Started with ATT&CKTM" New eBook available at: https://www.mitre.org/sites/default/files/publications/mitr e-getting-started-with-attack-october-2019.pdf
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 37 |
https://attack.mitre.org
attack@mitre.org @MITREattack rjs@mitre.org
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

| 38 |
MITRE's mission-driven teams are dedicated to solving problems for a safer world. Through our federally funded R&D centers and public-private
partnerships, we work across government to tackle challenges to the safety, stability, and well-being of our nation.
Learn more www.mitre.org
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release 19-00066-12.

