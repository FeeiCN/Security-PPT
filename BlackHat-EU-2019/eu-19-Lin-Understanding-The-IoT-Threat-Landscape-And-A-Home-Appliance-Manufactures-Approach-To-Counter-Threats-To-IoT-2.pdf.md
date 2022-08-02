Panasonic Corporation Hikohiro Y Lin Yuki Osawa
Understanding the IoT threat landscape and a home appliance manufacturer's approach to counter threats to IoT

Background

Increasing in attacks targeting IoT
Number of Attacks Observed by NICTER Darknet Sensors
No. Packets (ten billion)

Breakdown of Observed Attacks by NICTER Darknet Sensors (2018)

Other

Attacks targeting IoT devices (Web Camera, Routers, etc.)

Number of cyber attacks continue to increase About half of observed attacks targeting IoT devices

Cybersecurity Research Institute - Cyber Security 2019 Appending 5 - Cyber Security Related Data - NICTER Observation Results https://www.nisc.go.jp/active/kihon/pdf/cs2019.pdf

Sudden Increase in IoT Malware
The number of IoT malware has more than tripled from 2017 in just the first half of 2018
"New trends in the world of IoT threats", Kaspersky Lab, September 18, 2018 https://securelist.com/new-trends-in-the-world-of-iot-threats/87991/

IoT Malware Infections and Associated Damages

Infect

Spread

Cyber Attacks

Infect, Spread and leverage for use in attacks Victims unknowingly become attackers

Alert by Government

 201921

https://www.nict.go.jp/press/2019/02/01-1.html

New law enacted in light of these threats

Other countries looking to strengthen IoT security

NOTICE 201921 https://notice.go.jp/news/topic/

Existing Panasonic Activities on Product Security

Cyber Security in Panasonic
Cyber Security Activities in Panasonic

IT Security

Product Security

Manufacturing System Security

Information System

Product

Factory, Manufacturing

Web-site, PC, Server, Network, Data and
Application
CSIRT
Info. Systems related department

Product and Services provided by Panasonic
PSIRT Product Security Center

Manufacturing system and Production
Machine in Panasonic
FSIRT
Manufacturing related department

Supporting Panasonic Brand

1

Product Security

2

Minimize

Incident

Risk

Response

Essential knowledge (Awareness / Technical)

Panasonic Product Security Activities

Plan Product Lifecycle

Design

Implement

Test

In-Use

Shipment

Discard

Threat Analysis

Secure Design

Secure Coding Static Analysis

Vulnerability Testing
(Security Testing)

Incident Response

Minimize Risk

Incident Containment

Vulnerability Testing (Security Testing) Planning Design Implement Verity(Test) On market

SAepcpulriictaytTioenst SecDuerivtiyceTest SeHcaurrditwyaTreest

SecSuerritvyeTrest Tester

Incident Response Framework at PanasoniPclanning Design Implement Verity(Test) On market

Incident Coordinators

Security Institution

FIRST, IPA(JP), CERT(US), JPCERT/CC(JP) ISPs, Vendors, Academics, Individuals

Panasonic Panasonic PSIRT

AP-IRT

LS-IRT

AM-IRT

IS-IRT

CNS-IRT

Panasonic IoT Threat Intelligence Project

Challenges in Product Security Evolving Cyber Attack Methods Attacks Targeting Specific Products Increasing number of IoT Malware Cost of Product Security

Even with security activities that cover the product lifecycle from threat analysis to incident response, these challenges remain
To address these challenges, we have designed a platform to collect / analyze / utilize threat information which includes IoT malware

Panasonic IoT Threat Intelligence Platform Concept

Collect malware targeting home electronics

Analysis of malware characteristics

IoT Threats IoT Threats
Collection Analysis
IoT Device
Protection

Through the platform, goal is to strengthen overall IoT security

More secure products

IoT Threat Collection - Malware targeting home electronics
On-going
Real time collection using IoT home electronics
Coming Soon
Ability to collect attacks against products in development
On-going
Increase global coverage of observation points

Process this flow automatically

IoT Threat Analysis ­ Analyze Characteristics of IoT Malware

On-going
Cover Malware Targeting IoT Home Electronics

Collect Malware (Honeypot)
Behavior Analysis (IoT Sandbox)

On-going
Behavior analysis specialized for IoT malware

IoT Malware Analysis Results
Statistical Analysis

On-going
Auto-processing from collection to analysis/statistics

Accomplishments ­ November 2017 ­ November 2019

IoT Threat Collection

Attacks Collected

302,089,388

Malware Collected

22,303

IoT Malware Collected

4,797

Home electronics with malicious files placed

2 types The home appliance was not infected and there were no damages

IoT Threat Analysis (Malaware Analysis)
Of the top 10 destination IP addresses, besides DNS (8.8.8.8), all are malware distribution sites (malicious sites)
Top 3 destination countries are USA, China, Japan
(Followed by Germany, England, S. Korea, S. Africa, Brazil , Egypt, France)

Analysis Examples of Collected Threat Information

Attack Trends by Country · Number of attacks from China, America have increased suddenly this year · Top 3 accounts for 53% of total, Top 5 accounts for 61% of total

Top 5 Attacking Countries Trend

20

#1 China

#2 U.S.

#3 Russia

15

#4 Netherlands #5 Vietnam

10

#1 China #2 U.S.

Attacks [M]

5

#3 Russia

0

#5 Viet#n4amNetherlands

2018 Q1 2018 Q2 2018 Q3 2018 Q4 2019 Q1 2019 Q2 2019 Q3

Attack trends against Home IoT Appliances · Number of attacks increasing overall · Devices being attacked tend to have ports such as Web, UPnP, SMB, etc. open

Attacks [K]

Attack Trend Against Physical Honeypots

300
#1 Security camera #2 BD recorder

250

#4 Home camera

#5 TV

200

#7 Washing machine #8 Dehumidifier

#3 Intercom #6 Refrigerator #9 Air conditioner

#1 Security camera

150

#3 Intercom

100

50

#2 BD recorder

#4 Home camera 0

2018 Q1 2018 Q2 2018 Q3 2018 Q4 2019 Q1 2019 Q2 2019 Q3

Top 10 Attacked Protocols in 2019
· April : peak in 2019/4/7
­ Rapid increase in attacks against UPnP service after vulnerability disclosed in March
· July : peak in 2019/7/19
­ More UPnP
· August : peak in 2019/8/28
­ Remote attacks against Microsoft SQL Server in August

Top 10 Attack Sources by Country in 2019
· April : peak in 2019/4/7
­ Attack Source by Country: China
· July : peak in 2019/7/19
­ Attack Source by Country: United States
· August : peak in 2019/8/28
­ Attack Source by Country: China

Trends in Collected IoT Malware for 2019
· 75% Known malware ; 25 % Unknown malware · Between a couple to 10-20 samples collected daily · No direct correlation between number of attacks and number of collected
malware samples
­ Likely due to most attack attempts being scans

Analysis of Collected Malware · Most Linux based malware target PC/Server · 21.5% of total attacks against IoT architecture · ARM and MIPS are the main targets for IoT malware

Attacked Home IoT Appliances -Suspicious Files-

· Malware was placed in a shared folder that did not have any authentication

5 malware samples placed

Observed on June, 2018

CVE-2017-7494(SambaCry - Attack was not successful)

4 suspicious files

Observed between October ­ December, 2018

1 malware sample W32/Tenga

Observed between January ­ March, 2019

Attacked Home IoT Appliances ­Attack Analysis ­ · Listing of shared folders
· Upload malware
­ Malware exploits CVE-2017-7494 (SambaCry)
· Attempts to load malware onto Samba server
­ Fails to specify full path for malware. Attack attempt unsuccessful.
· Delete malware
­ Not deleted entirely, some parts remain

IoT Malware Analysis - Hakai_pb · Mirai variant
· After intrusion, process name is disguised
­ sshd (if python enabled) or dropbear (ssh software for embedded)
· Scanner depends on environment
­ Only GPON (1 CPU) ­ GPON, telnet, eir-D1000 (more than
2 CPUs)
· Targets vulnerability (command injection) in IoT device
­ Dasan Network GPON router ­ ZyXEL eir-D1000

Observed between April - June 2019

IoT Malware Analysis - Hakai_pb · Encrypts password list used during Telnet scan
­ XOR Key "DEDEFFBA"
· C&C Server
­ IP addresses from US and Brazil
· DoS
­ CRASH: RTCP(Real-time Transport Control Protocol) ­ CRUSH: junk message ­ SMITE: Reflection attack ­ Etc.
· ARM

Next Steps

Resolutions to the Current Challenges

Evolving Cyber Attack Methods

Real time observation / analysis of latest attacks

Attacks Targeting Specific Products

Observations using Panasonic home electronics

Increasing number of IoT Malware

Behavior analysis specialized for IoT malware

Cost of Product Security

Efficiency and cost effectiveness through auto-processing

Future Vision - Strengthen B2C Security

Efficient and effective security testing

Feedback to product developers

products that are resilient to malware

Automatic product security updates

Vision to share IoT device defense technologies / knowledge to other companies Lead the industry for IoT home appliance security

