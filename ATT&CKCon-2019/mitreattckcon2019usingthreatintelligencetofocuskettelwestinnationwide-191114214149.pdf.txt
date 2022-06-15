Using Threat Intelligence to Focus ATT&CK Activities
October 29, 2019

.
The Nationwide MITRE ATT&CK Team

· Andy Kettell ­ 20+ years IT security experience ­ 4+ years at Nationwide in Cyber Security Operations Center ­ CISSP, CCSP

· David Westin ­ 20+ years of Intelligence in U.S. Marine Corps ­ 4 years at U.S. Cyber Command ­ 1 year at Nationwide

Others:

· Risk Leaders

· Infrastructure Personnel

· Business Area Leaders

· Columbus Collaboratory

2 INFORMATION RISK MANAGEMENT

In the beginning...
This ATT&CK thing is cool! I want it! Okay...how do we do this?
3 INFORMATION RISK MANAGEMENT

Our First Attempt (February 2017)
"Project Squishee..."
· What we did ­ Tried to analyze 240+ techniques, one technique at a time ­ Techniques chosen based on group consensus
· Six months to get three mitigations · No real movement towards operationalizing the
framework within the company
INFORMATION RISK MANAGEMENT

Our First Attempt (February 2017)
· Why it didn't work: ­ Tried to do everything (no focus) ­ Unfocused choosing of technique for deep dive analysis (what is cool...) ­ Tried to work technique from analysis to completing remediation issues ­ Bogged down in minutiae (took too long...) ­ No differentiation between basic and advanced techniques ­ No idea what we will get from this ­ Participation fatigue ­ No Intel personnel
INFORMATION RISK MANAGEMENT

Bright Idea: Focus on the Threat!!
Who is targeting us? What techniques do they use?
6 INFORMATION RISK MANAGEMENT

Nationwide MITRE ATT&CK Process Was Born

Threat Intel Phase

Testing Phase

Assessment Phase

Implementation Phase

Leadership Phase

Threat Intel provided the compass and map...
7 INFORMATION RISK MANAGEMENT

Should I Care About Everything?

· Started with Excel spreadsheet created by Florian Roth (@cyb3rops) · Added capability/intent; simplified based on Nationwide needs · Used simple aging out criteria based on last known reports
INFORMATION RISK MANAGEMENT

Prioritize...

Put It In a Pretty Chart
Adversaries to the Financial Sector

Capability Maturity

INFORMATION RISK MANAGEMENT

Interest in Financial Sector

Focus on What Matters
· 100+ threat actors down to 27 · Focus is on those threat actors
with capability and intent to go after finance/insurance industry

Adversaries to the Financial Sector

Capability Maturity

Interest in Financial Sector
INFORMATION RISK MANAGEMENT

I Know `Who', But Not `What'...

Researching Threat Actor Techniques
· Intelligence collection tool of choice · MITRE ATT&CK Site (of course...) · ISAC/ISAO · Security Researchers · Twitter · Top Techniques Reported · Many others...

INFORMATION RISK MANAGEMENT

Collect All The Things...
11

Tying Research to ATT&CK Matrix

· If used by threat actor, add to chart
· More red = more threat actors using that technique
· Simple Excel spreadsheet math...

INFORMATION RISK MANAGEMENT

Still Messy...

Focusing Only On Identified Techniques...

Initial Access Drive-by Compromise

Execution
Command-Line Interface

Persistence

Privilege Escalation

Defense Evasion

Accessibility Features Access Token Manipulation

Code Signing

Credential Access

Discovery

Lateral Movement

Account Manipulation

Account Discovery

Application Deployment Software

Collection Data Staged

Exfiltration Data Compressed

Spearphishing Attachment

Mshta

Application Shimming Accessibility Features Disabling Security Tools

Brute Force

Application Window Exploitation of Remote Data from Local

Discovery

Services

System

Data Encrypted

Command and Control Commonly Used Port
Connection Proxy

Spearphishing Link

PowerShell

Create Account

Application Shimming

File Deletion

Credential Dumping

File and Directory Discovery

Pass the Hash

Data from Network Exfiltration Over Shared Drive Alternative Protocol

Data Encoding

Trusted Relationship

Regsvr32

DLL Search Order Hijacking

DLL Search Order Hijacking

Hidden Files and Directories

Credentials in Files

Network Service Scanning

Remote Desktop Protocol Email Collection

Exfiltration Over Command and Control Channel

Data Obfuscation

Valid Accounts

Rundll32

Hidden Files and Directories

Exploitation for Privilege Indicator Removal from

Escalation

Tools

Scheduled Task

New Service

New Service

Indicator Removal on Host

Scripting

Registry Run Keys / Start Folder

Process Injection

Masquerading

User Execution

Scheduled Task

Scheduled Task

Mshta

Windows Management Instrumentation

Shortcut Modification

Valid Accounts

Obfuscated Files or Information

Input Capture

Permission Groups Discovery
Process Discovery

Remote File Copy Remote Services

Query Registry

Windows Admin Shares

Remote System Discovery

System Information Discovery

Fallback Channels
Multi-Stage Channels
Standard Application Layer Protocol
Standard Cyrptographic Protocol
Standard Non-Application Protocol

Web Shell

Process Injection

System Network Configuration Discovery

Uncommonly Used Port

· 91 techniques across 11 tactics · Initial data necessary for
prioritization
INFORMATION RISK MANAGEMENT

Regsvr32
Rundll32
Software Packing Timestomp
Valid Accounts Web Service

System Network Connections Discovery
System Owner/User Discovery
Manageable Project... 13

Winning Quotes

"Knowing Is Half The Battle" - G.I. Joe

INFORMATION RISK MANAGEMENT

"Victorious warriors win first and then go to war, while defeated warriors go to war first and then seek to win"
- Sun Tzu
14

Intel Driving Operations

Threat Intel Phase

Testing Phase

Assessment Phase

Implementation Phase

Leadership Phase

Objective: Focus project on most likely adversary techniques

Objective: Determine susceptibility to prioritized techniques

Objective: Determine recommended detection & mitigation strategies

Objective: Develop & implement detection and mitigation actions

Objective: Determine risk associated with non-implemented strategies

Teams Involved: Threat Intelligence, Attack & Penetration, Infrastructure Operations, Security Tool administrators, Incident Response, Security Architecture, 2nd Line of Defense consultants, executive leadership

INFORMATION RISK MANAGEMENT

Everyone Involved...

Where Did We End Up?
· Reduced tested techniques from 240+ to 91 · Clear understanding of our security posture related to MITRE
ATT&CK techniques associated with threat actors targeting the finance/insurance industry · Security focused recommendations vs. IT audit driven · Enabled MITRE ATT&CK to gain a foothold in the organization · Framework built to enable follow-on actions
16 INFORMATION RISK MANAGEMENT

Keep The Momentum Going
Are we done yet? What's next?
17 INFORMATION RISK MANAGEMENT

Constantly Evolving
Adversaries to the Financial Sector

Capability Maturity

INFORMATION RISK MANAGEMENT

Interest in Financial Sector

18

Intelligence Led Prioritization

· Prioritization of techniques

­ Third party research (Red Canary's analysis of top techniques)

­ Attack & Penetration test results

­ Security expert input (FS-ISAC, Columbus Collaboratory, etc...)

­ Analysis of recent breach reports (Ryuk, Emotet, Qakbot, Fin7, etc...)

­ Analysis of Nationwide existing controls and effectiveness

Priority Tactic

Technique

1 Execution

PowerShell

2 Credential Access

Credential Dumping

3 Execution

Command-Line Interface

4 Defense Evasion, Persistence, Privilege Escalation, Initial Access Valid Accounts

5 Initial Access

Spearphishing Attachment

6 Initial Access

Spearphishing Link

7 Exfiltration

Data Compressed

8 Execution, Persistence, Privilege Escalation

Scheduled Task

9 Defense Evasion

Masquerading

10 Defense Evasion

Obfuscated Files

INFORMATION RISK MANAGEMENT

*Not real results

19

Intelligence Driving Security

INFORMATION RISK MANAGEMENT

· "Anatomy of ATT&CK" documents · Use security research and recent external events · Break down scenario by technique · Used to confirm security controls are in place
20

Key Takeaways
· Intel driven operations ensure clear focus and prioritization · Focus on threat actors in your sector and techniques they use · Don't try to do it all...smaller chunks enable clearer understanding of final objectives · Constantly evolve and iterate to increase coverage
21 INFORMATION RISK MANAGEMENT

Questions?
Contact us at: sccthreatintel@nationwide.com Andy Kettell David Westin
22 INFORMATION RISK MANAGEMENT

