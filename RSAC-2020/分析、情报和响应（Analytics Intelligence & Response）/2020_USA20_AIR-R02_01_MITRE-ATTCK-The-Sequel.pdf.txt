SESSION ID: AIR-R02
MITRE ATT&CK - THE SEQUEL

Freddy Dezeure
CEO Freddy Dezeure BV @Fdezeure www.freddydezeure.eu

Rich Struse
Director, Center for Threat-Informed Defense MITRE Engenuity @MITREattack attack.mitre.org

#RSAC

#RSAC
The Sequel
Presentation builds on our RSA2019 MITRE ATT&CK presentation Our goal is to provide real hands-on guidance Everything was built in cooperation with Munich Airport
2

#RSAC
Agenda
Identify Protect Detect Update Share
3

#RSAC
Our Enterprise Is A Financial Service
We process money for our clients Our main risks:
­ Financial loss ­ Business continuity ­ Brand damage ­ GDPR
Our infrastructure is well protected (we think) We want to perform threat-informed defense
4

#RSAC
Our Infrastructure
"Win10" "Win11"
5

#RSAC
Our Infrastructure
Created in Detection Lab
­ Installed from GitHub ­ + One additional host ­ + Squid proxy ­ + Caldera
We populated the logfiles by normal user behavior We executed our scenario and made screenshots
6

#RSAC
Identify
Our Assets, Our Infrastructure, Our Main Adversaries And Their TTPs

#RSAC
Identify Our Adversaries' Objectives And Behavior
Identify our Adversaries of interest
­ Open source and commercial threat intelligence ­ ISACs/ISAOs ­ NCICC/CERTs
Identify which tactics/techniques they use
­ ATT&CK Navigator
8

#RSAC

Motives Targets
Our Assets

Our Adversaries
Our Systems
9

#RSAC
Our Main Adversaries
Cross-sector : targeted ransomware
Emotet followed by Trickbot Followed by Ryuk/LockerGoga...
Sectoral : Fin7, Cobalt Group
10

#RSAC

Our Adversaries
TTPs

Our Assets

Our Systems
11

#RSAC
12

#RSAC
13

#RSAC
14

#RSAC
15

#RSAC
16

#RSAC
We Built And Used A Realistic Exploit
Word lure document with PowerShell macro connecting to api.ipify.org to grab external ip of our infrastructure and vizualize it
17

#RSAC
Protect
Design And Validate Our Critical Controls

#RSAC
Design Our Controls

Assets

Adversaries
19

Spear Phishing PowerShell
Security Controls

#RSAC
Mitigations For T1086 PowerShell
20

#RSAC
Mitigation Guidance From The Community
21

#RSAC
Implemented In Our Enterprise Environment

Without FW "Win10" "Win11" With FW

policy

policy

22

#RSAC
Validate Our Controls In Our Lab

Assets

Adversaries
23

Spear Phishing PowerShell
Security Controls

#RSAC
Screenshot of the lure document
24

#RSAC
Result Of The Execution Of The Macro
25

#RSAC
Visibility In Our Environment
Screenshot in Splunk logs (Sysmon and proxy)
"Win10" (without FW rule)
26

#RSAC
Test Our Controls

Assets

Adversaries
27

Spear Phishing PowerShell
Security Controls

#RSAC
CALDERA ­ MITRE Open Source Research Project
Automated adversary emulation
­ Safely replicate realistic adversary behavior ­ Repeatable testing and verification of prevention/detection
Features
­ Uses ATT&CK to create Adversary profiles ­ Uses AI and modeling to make decisions about actions ­ Self-cleans after operation completes ­ Low install overhead ­ Does not require extensive red team knowledge to operate
28

#RSAC
Outcome Of Caldera With T1086 In Our Infrastructure
29

#RSAC
Outcome On "Win11" (Protected With FW Policy)
30

#RSAC
Detect
Design And Validate Our Analytics

#RSAC
Design Our Detection
Gain Visibility
­ Priorities in log collection
Design Analytics
­ Write them with knowledge of Our Adversaries ­ Get them from the community
Deploy
­ Detect / Hunt / Refine
32

#RSAC
SIGMA: A Language for Analytics
https://github.com/Neo23x0/sigma
33

#RSAC
SIGMA Community Rules Repository
34

#RSAC
Detecting Windows command line executable spawned from Microsoft Office
35

#RSAC
Detection With SIGMA Rules
Splunk alerts detecting PowerShell spawned from Word
36

#RSAC
Detection With SIGMA Rules (2)
Splunk alert detecting PowerShell communicating outside
Alert on "Win10" (without FW rule)
37

#RSAC
Detection With SIGMA Rules ­ Building Alerts (3)
Splunk alerts built with identified SIGMA rules
Critical alert on "Win10" (without FW rule)
38

#RSAC
Alerts Triggered By Running Caldera With T1086
All alerts are on "Win10" (without FW rule)
39

#RSAC
Update

#RSAC
Update on ATT&CK Developments
ATT&CK for ICS, Cloud and more
Subtechniques
Threat Report ATT&CK Mapper (TRAM)
MITRE ENGENUITY
41

#RSAC
Share
Contribute To The Community

#RSAC
Share Insights And Contribute
The MITRE ATT&CK community is very active Sharing TTPs/SIGMA rules is easier and more useful than IOCs
­ Contribute to MITRE ATT&CK attack@mitre.org ­ Contribute to SIGMA
https://github.com/Neo23x0/sigma/tree/master/rules
Participate in the Community
­ MITRE ATT&CKcon ­ EU ATT&CK User Community
43

#RSAC
EU ATT&CK User Community
Mailing list: opt in ? -> email to info@circl.lu Next workshop in Brussels 18-19 May 2020 The biggest ATT&CK event ever...
44

#RSAC
"Apply" Slide
Next week you should:
­ Consider Windows Firewall policy to mitigate PowerShell techniques
In the first three months following this presentation you should:
­ Identify Your Adversaries ­ Identify and deploy at least three use cases in your organization
Within six months you should:
­ Permeate your cyber defense using ATT&CK ­ Share your insights in the SIGMA community
45

#RSAC
Resources And Acknowledgements
ATT&CK repository and ATT&CK Navigator How to use the MITRE ATT&CK Navigator PREVENT Legitimate Windows Executables To Be Used To Gain Initial Foothold In Your Infrastructure (@dmargaritis) SIGMA and SIGMA rule collection (Thomas Patzke, Florian Roth) CALDERA EU ATT&CK Community Workshop 18-19 May 2020 Munich Airport Information Security Hub Center for Threat-Informed Defense Detection Lab
46

