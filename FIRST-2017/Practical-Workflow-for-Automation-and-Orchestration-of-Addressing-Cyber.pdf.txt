Prac%cal Workflow for Automa%on and Orchestra%on of Addressing Cyber Threat: Case Study of Mirai Botnet in Malaysia
Megat Muazzam Head of Malaysia CERT CyberSecurity Malaysia
Copyright © 2017 CyberSecurity Malaysia

Agenda
· Introduction · Issues Surrounding Protecting Malaysia Cyber
Security · Important of Threat Intelligent Sharing · Traditional SOC "And" Threat Intelligent
Information Sharing · Case study Mirai

Copyright © 2017 CyberSecurity Malaysia

2

Cyber999TM Cyber Early Warning Services
Incident Handling Cyber Early Warning Technical Coordina<on Centre Malware Research Center

Email us at: cyber999@cybersecurity.my
REFERENCE CENTRE FOR CYBER SECURITY ASSISTANCE
- for all internet users, including home users and organizations

Copyright © 2017 CyberSecurity Malaysia

3

Copyright © 2017 CyberSecurity Malaysia

4

Issues Surrounding Cyber Security in Malaysia
Vastly expanding attack surface area (Mobile, Cloud, Virtualiza%on, IOT etc)
Insufficient reliable data related to cyber threats

No appropriate body or authority that provides reliable data

Insufficient technical resources and expertise to expedite threat intelligence analysis and incident response.

Copyright © 2017 CyberSecurity Malaysia

5

CSIRT's Role in Protecting Critical National Information Infrastructure
q Information sharing about latest threats and mitigation measures against the threats
q Early warning of latest outbreaks, provide Alert and Advisory on the latest outbreak which includes detection and mitigations
q Raise awareness about cybersecurity and critical infrastructure protection issues
q As a platform to promote mutual collaboration between all sectors in CNII, such as Government, Private, Financial sectors. A good example is a National-level Cyber Exercise.
q Engaging with various parties such as with Law Enforcement Agencies, ISPs , security experts on mitigations against cyber attacks against CNII.

Copyright © 2017 CyberSecurity Malaysia

6

Current Malaysia Prac<se for Mi<ga<ng Cyber Threats in Malaysia

Coordinated Cyber Incident Escalation
Annual Cyber Exercise "Code Name X-Maya"
National Level Policy: National Cyber Crisis Management Plan
"NCCMP"
National Level Security Awareness

Copyright © 2017 CyberSecurity Malaysia

7

What is Threat Intel
"Threat Intelligence (TI) is evidence based knowledge, including context, mechanism, indicator, implica%ons, and ac%onable advise about an exis%ng or emerging menace or hazard to assets That can be used to inform decisions regarding the subject response to that menace or hazard" - Gartner, 2013
· SANS Ins%tute
- The set of data collected, assessed and applied regarding security threat, threat actors, exploits, malware, vulnerabili%es and compromise indicators"

Copyright © 2017 CyberSecurity Malaysia

8

Importance of Threat Intelligence

To move threat intelligence sharing to the next level of efficiency and effec%veness, improvement is needed in three areas:
· We need to simplify event triage and provide a beVer environment for security prac%%oners to inves%gate highpriority threats.
· We need to do a beVer job establishing rela%onships between indicators of compromise so that we can understand their connec%ons to aVack campaigns.
· We need a beVer way to share threat intelligence among our stakeholders and relevant authori%es.

Copyright © 2017 CyberSecurity Malaysia

9

Example of Threat Intelligence / Information Sharing Framework

Technical PlaXorm / Framework - MISP - OpenIOC - STIX / TAXII - Collec%ve Intelligence Framework (CIF) - Avalanche/Soltra (FS-ISAC)

SIEM Communi%es - Qradar Threat Exchange - Splunk feeds

Na%onal CSIRTs/CERTs info sharing exchange

Copyright © 2017 CyberSecurity Malaysia

10

Traditional SOC Operation

Network Management
Tools

Phone calls

Intrusion Detec%on Systems
SMSes

Triage

Incident Report

·Informa%on Requests
·Vulnerability Report

Analyze

Escala%on

Technical Assistance

Faxes

Emails

Copyright © 2017 CyberSecurity Malaysia

Resolu%on
11

Threat Intelligence Informa1on Sharing Model
1

Threat Intel Sources

Honeynet

Feeds Provider

Foreign CERT

Distribute Feeds & Raw Data
2

Threat Intel Repository for: 1. Future Reference
2. Produce Advisories

Threat Intelligence

Threat Intelligence Analysis Process

Repor%ng System

Analysis by

4

YES

Agent/Machine

Verified Data Escala<on to 5 related CNII Sectors

CNII Sectors may refer to CNII

Portal advisories and alerts for

proper handling of cases and for future reference

6

Advisories & Alerts
Law Enforcement Agency (LEA): For crime related

Blocking and

cases

Inves%ga%on process by related
CNII Sectors

Escala%on To

MyCERT: If require technical assistance, data

preserva%on
Copyright © 2017 CyberSecurity Malaysia

High Risk Informa -%on?
3
7 NO
8
12

Copyright © 2017 CyberSecurity Malaysia

13

Tools Used for Information Sharing

MyLipas

·Semi-automated escala%on tool ·For mass IP no%fica%on

Honeynet ·Source of threat informa%on

Automated ·Automa%ng the analysis and

Scripts

processing of the threat informa%on

Forensic tools

·Forensic analysis

Copyright © 2017 CyberSecurity Malaysia

14

Case Study - Mirai

Copyright © 2017 CyberSecurity Malaysia

15

Mirai Botnet Infection

hVps://intel.malwaretech.com/botnet/mirai/?t=24h&bid=all

Copyright © 2017 CyberSecurity Malaysia

16

hVps://www.shodan.io/

Copyright © 2017 CyberSecurity Malaysia

17

List of vectors found in source code.

The passwords come from the botnet's source code

Copyright © 2017 CyberSecurity Malaysia

18

Security Feeds Information

Mirai infec<on CC-Port Scan Detected Jan - April 2017

160000

144957

140000

120000

100000

80000

60000

56036

83766

Count

40000

20000 5021
0

5336 15

10425

9527

5395 5207

209 1106 3

2851 7

Infec<on Type by Variant

17452, 5% 408, 0%

83781, 26%

228220, 69%

Mirai Mirai-Botnet Mirai#14 Mirai Wget Download

Copyright © 2017 CyberSecurity Malaysia

19

Mirai detection using Honeypot
MTPot ­ open source honeypot developed by Cymmetria Research.

MTPot is wriVen in Python
· the ip and port to which the honeypot shall bind · a list of commands expected to be sent by the scanners and
the responses that MTPot shall give · the name of the aVack (Mirai) · a session %meout value · some op%onal syslog sesngs to collect the fingerprinted IPs

- Escala%on to ISP focus only for .my source of IP

that have been infected.

Copyright © 2017 CyberSecurity Malaysia

20

Automated Escalation Process

Botnet Feeds

Centralized System

Cyber999

LebahNET Sensor
21
Copyright © 2017 CyberSecurity Malaysia

Automation of escalation

Copyright © 2017 CyberSecurity Malaysia

22

Mitigate the attacked
· Automated incident escalation to ISP · Recommend ISPs identify compromised IoT
devices by filtering traffic TCP23 / TCP 2323 / TCP 7547
­ ISP action : Isolate and notify legitimate owners of the problem and urge to take corrective action.
· Publish advisory to alert Malaysia Internet user

Copyright © 2017 CyberSecurity Malaysia

23

Recommendation to device owners

· Research the capabilities and security features of an IoT device before purchase
· Stop using default/generic passwords. · Disable Telnet login and use SSH · Disable or protect remote access to IoT
devices when not needed · Regularly check the manufacturer's website for
firmware updates

Copyright © 2017 CyberSecurity Malaysia

24

What is the challenges
Owner of Devices
­ Not straightforward to patch/upgrade ­ Not every user know how to resolve infected devices

IoT Manufacture
­ Profit Vs Security ­ Unnecessary services should be disabled by default ­ Best practices: password

ISP
­ Difficult to correlate information that have been share / escalate by CERT
­ Need proper guidelines to informed affected customers.

Copyright © 2017 CyberSecurity Malaysia

25

Summary
· It worked for us in obtaining valid, reliable threat intelligent information from our trusted partners. This will eventually makes identification and rectification works smoothly.
· It worked in identifying the threats, vulnerabilities to systems belonging to the CNII sector
· It strengthens the working collaboration between CSIRTs and CNII sectors and position CSIRT as an entity that plays an important role in safe guarding the cyber space
· CSIRTs partnership has become an integral part at international network to fight against cyber threats.
· To develop a baseline understanding of common threats and capabilities to enable coordinated actions among the CNII sectors in the event of large scale cyber attacks.

Copyright © 2017 CyberSecurity Malaysia

26

Questions ?

§ Find out more
§ www.cybersecurity.my § www.mycert.org.my § cyber999@cybersecurity.my
§ Personal
§ megat@cybersecurity.my

Copyright © 2017 CyberSecurity Malaysia

27

Copyright © 2017 CyberSecurity Malaysia

