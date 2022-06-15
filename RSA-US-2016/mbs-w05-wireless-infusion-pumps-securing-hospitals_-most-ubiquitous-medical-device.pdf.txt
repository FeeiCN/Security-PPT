SESSION ID: MBS-W05
Wireless Infusion Pumps: Securing Hospitals' Most Ubiquitous Medical Device
#RSAC

Nate Lesser
Deputy Directory National Cybersecurity Center of Excellence NIST

In the News

#RSAC
Lax medical device security needs urgent action
Medical Devices Used as Pivot Point in Hospital Attacks: Report
2

Risks, Threats, Vulnerabilities to Infusion

#RSAC

Pumps

RISKS
· Patient safety (lives) · Operational/downtime · Patient trust & staff
morale

THREATS
· Collateral damage · Malware · Theft/loss · Lateral attack · Hacktivism

3

VULNERABILITIES
· Tightly regulated "turn-key" systems
· Long useful life · Poorly protected &
patched · No detection &
alerting · System complexity
Courtesy of Axel Wirth

#RSAC
Infusion Pumps
Infusion pumps are medical devices that deliver fluids and medications into a patient's body in controlled amounts. Infusion pumps among the most are ubiquitous connected medical devices in hospitals.
Estimated that more than 2 million infusion pumps are in use in hospitals.
4

#RSAC
Infusion Pumps in the News
Hospital Drug Pump Can Be Hacked Through Network, FDA Warns
5

#RSAC
Infusion Pump Vulnerability Notices
FDA Safety Communication on Vulnerabilities of Infusion Pump Systems, May 13, 2015: recommendation for health care facilities to secure affected infusion pumps.
ICS-CERT Advisory (ICSA1512501B): provides details of vulnerabilities including CVE numbers and CVSS scores.
Postmarket Management of Cybersecurity in Medical Devices: draft guidance on cybersecurity risk management, remediation, and reporting
6

#RSAC
Infusion Pump Physical Architecture

Infusion Pump

Drug Delivery Controller

Communication Subsystem

Local or cloud apps
Pump Server EHR
Alarm Manger
Remote Management

Alarms 7

Nurses Station

#RSAC
Demo
8

#RSAC
Exploit #1: Compromise Patient Information

TELNET access to "root" account
No authentication required CVE-2015-3459
Risk
Gain root access to pump Pump used as a pivot

Attacker's Laptop

Pump Server Electronic Health Records

9

#RSAC
Exploit #1: Compromise Patient Information

Unauthenticated telnet to pump
Use pump to pivot
Extract desired information
Move information to web server
Extract via web browser

Attacker Pump

Pump Server

EHR

Telnet
Extract PHI

Telnet Steal PHI
Transfer to pump

10

#RSAC
Exploit #2: Crash Communication Subsystem

Denial of service attack
Stops network communication Using resource consumption Can corrupt flash file system

Attacker's Laptop

Risk
Stops pump from sending alerts and messages

Pump Server Electronic Health Records

11

#RSAC
Exploit #2: Crash Communication Subsystem

Normal Operations Error condition
Empty vial Alarm sent
Error condition cleared
Nurse replaces vial
Infusion resumes

Attacker

Pump Patient
Vial Empty Alarm
New Vial Infuse

Nurse

12

#RSAC
Exploit #2: Crash Communication Subsystem

Anonymous FTP to pump

Upload gzip'd file

Attacker Pump Patient Nurse

TELNET access to "root" account

File transfer gunzip

gunzip file

Out of memory

Consumes all available RAM Corrupts part of file system
No file system repair tools

Vial Empty
No alarm communications are
stopped

13

#RSAC
All Devices Have Vulnerabilities

Although the vulnerabilities might not be known
Just because it's vulnerable doesn't mean it's exploitable
Patching may not be possible right away

Isolation

Defense in depth

Surround and protect the vulnerable

14

#RSAC
Wireless Infusion Pump Problem Statement

RESEARCH
Help health care delivery organizations understand risks & secure medical devices on an enterprise network
Focus on wireless infusion pumps as archetype of medical device

BUILD
Assess risk Identify mitigating security technologies Build example implementation Independent validation of implementation
15

SHARE
Publish practice guide: NIST Special Publication 1800 series

#RSAC
Challenges

 Firmware version control  Multiple versions in service
 Access control  Physical and networked  "Break the glass"  Malware or other unexpected software on pump
 Wireless access point and network configuration
 Alarms  Asset management and monitoring

 Identity management and Credentialing
 Maintenance and firmware updates  Pump variability
 Multiple types of pumps  Multiple models in usage

16

#RSAC
NCCoE Strategy

MISSION
ACCELERATE ADOPTION OF SECURE TECHNOLOGIES
Collaborate with innovators to provide real-world, standards-based cybersecurity capabilities that address business needs

VISION
ADVANCE CYBERSECURITY
A secure cyber infrastructure that inspires technological innovation and fosters economic growth

GOAL 1
PROVIDE PRACTICAL CYBERSECURITY
Help people secure their data and digital infrastructure by equipping them with practical ways to implement standards-based cybersecurity solutions that are modular, repeatable and scalable

GOAL 2
INCREASE RATE OF ADOPTION
Enable companies to rapidly deploy commercially available cybersecurity technologies by reducing technological, educational and economic barriers to adoption

GOAL 3
ACCELERATE INNOVATION
Empower innovators to creatively address businesses' most pressing cybersecurity challenges in a state-of-the-art, collaborative environment

17

#RSAC
NCCoE Tenets
Standards-based: Apply relevant local, national and international standards to each security implementation and account for each sector's individual needs; demonstrate reference designs for new standards Modular: Develop reference designs with individual components that can be easily substituted with alternates that offer equivalent input-output specifications Repeatable: Enable anyone to recreate the NCCoE builds and achieve the same results by providing a complete practice guide including a reference design, bill of materials, configuration files, relevant code, diagrams, tutorials and instructions Commercially available: Work with the technology community to identify commercially available products that can be brought together in reference designs to address challenges identified by industry Usable: Design usable blueprints that end users can easily and cost-effectively adopt and integrate into their businesses without disrupting day-to-day operations Open and transparent: Use open and transparent processes to complete work, and seek and incorporate public comments on NCCoE documentation, artifacts and results
18

Participate
301-975-0200 http://nccoe.nist.gov

#RSAC
hit_nccoe@nist.gov
100 Bureau Dr, M/S 2002 Gaithersburg, MD 20899

