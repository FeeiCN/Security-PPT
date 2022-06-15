DDoS & APT,  , 

Tony Teo Director Sales Engineering, APAC Arbor Networks

©2015 ARBOR® CONFIDENTIAL & PROPRIETARY

1

Today's Cyber Security Challenges

CDNs
Service Providers

Mobile Carriers

Internal Apps

Remote Offices

Advanced Never see
the external
DDoS Threat threat traffic

Can't withstand a direct attack

Never see the threat already inside enterprise

Corporate Servers

SaaS

Cloud Providers

Enterprise Perimeter
2

Mobile WiFi

Employees

The Anatomy of an Attack Campaign (Attack Kill Chain)

ORGANIZATION'S NETWORK

S TA GE 3
Delivery Does not use malware payload

S TA GE 4
Lateral Movement

Desktop of CFO

S TA GE 2
Initial Entry Point Bypasses Sandbox

S TA GE 1 Reconn

Remote Subsidiary

Unsupervised Consultant

SENSITIVE ASSETS

S TA GE 5
Command and Control

Server calling out to botmaster in Latvia

S TA GE 6 Exfiltration
3

S TA GE 7
Mission Complete Use Forensics to detail incident

Facts on Attack Campaigns

Did You Know?

7+
Toolkits
40%

Advanced attacks in 2015 used 7 or more toolkits, less than half exploited a critical vulnerability.
...of advanced attacks in 2015 did not involve malware.

20%

...of all Advanced threat attacks involved DDoS 2014-2015

200+
Days

Average dwell time of breaches is greater than 200 days.

4

DDoS and APT Partnership
· While this chaos is happening, who will keep an eye on web security alerts and incidents? Quite probably nobody
· Log rotation to delete previous records · A DDoS attack can overwrite the same volume of log data in several days, deleting all previous records that quite probably contain information about a sophisticated data breach.
5

DDoS role in Advanced Threat

ORGANIZATION'S NETWORK

S TA GE 3
Delivery Does not use malware payload

S TA GE 4
Lateral Movement

S TA GE 2
InitialDDoS
Entry Point Bypasses Sandbox

S TA GE 1 Reconn

Remote Subsidiary

Unsupervised Consultant

Desktop of CFO

SENSITIVE ASSETS

S TA GE 5
Command and Control

Server calling out to botmaster in Latvia

S TA GE 6
ExfilDtraDtioonS
6

S TA GE 7
Mission Complete Use Forensics to detail incident

Advanced Threat Challenges

©2015 ARBOR® CONFIDENTIAL & PROPRIETARY

7

Traditional Solutions Challenges ­ Network Firewall, IPS, Sandbox
· Overly dependent on in-line deployments at the edge with focus blocking based on simple rules
· When deciding to block a session/packet, no context to previous sessions, exploits and risk
· Sandboxes overly focus on malware as point of infection => no insight to host behavior
· Often no preserved evidence to help user ID false positives
8

Traditional solutions challenges ­ SIEM
· Threat detection based on correlated rules that are painful (expensive) to write, prone to false positives & require you to know how you'll be attacked
· Visibility limited to logs => no insights to activity that doesn't produce a log, such as network connections
· Are your intelligence sources accurate and current?
9

Gap In Existing Approach

TIME

SOLUTION COST

$$$$$

$

$$$$

PREVENT/DETECT INVESTIGATE/PROVE

SANDBOX FIREWALL

ENDPOINT

IDS/IPS

SIEM

INTELLIGENC E

FORENSICS
END-POINT FORENSICS PACKET FORENSICS

Recon Network
STAGE 1

ORCHESTRATED CAMPAIGN STAGES

Installation/Delivery Sandbox

Command/Control Network

STAGE 3

STAGE 5

Mission Complete Forensics
STAGE 7

STAGE 2
Exploitation Network

STAGE 4
Lateral Movement Network

STAGE 6
Exfiltration Network

10

Introducing Arbor Networks SpectrumTM
See global attack campaigns in real-time across your entire network.
· Arbor's real-time global threat intelligence harvested from its service provider network is now connected to an organization's internal traffic patterns to detect the most damaging threats, those representing the highest form of risk.
Search and surface anything within the network.
· Disruptive security forensics with complete visibility into all past and present network activity at a fraction of the cost & complexity.
Prove threats on your network faster.
· Designed with the security user in mind, real-time workflows and analytics to empower & scale security teams to investigate and prove threats 10x more efficiently than existing solutions today.
11

Why Arbor Spectrum Fills The Gap

MANHOURS REQUIRED SOLUTION COST
RISK IMPACT

$$$$
Limited

With Arbor
$
Improved

PREVENT/DETECT INVESTIGATE/PROVE

SANDBOX FIREWALL

ENDPOINT

IDS/IPS

SIEM

INTELLIGENC E

$$$
Limited
FORENSICS
END-POINT FORENSICS
PACKET FORENSICS

Recon Network
STAGE 1

ATTACK CAMPAIGN STAGES

Installation/Delivery Sandbox

Command/Control Network

STAGE 3
INVESTIG

DETECT

ATE

STAGE 5
PROVE

Mission Complete Forensics
STAGE 7

STAGE 2
Exploitation Network

STAGE 4
Lateral Movement Network

STAGE 6
Exfiltration Network

12

Architecture: Robust Network Archive of Packets & Flow

Packet

Flow & IPFix

Arbor AT Platform

IDS Policies Industry Feeds/STIX (2.1)

Attacks/ Triggered Indicators PCAP

Layer 7 & flow Traffic archive

PCAP Decode & download

Searchable Archive: network conversations

· Incoming packets & flows analyzed for security events
· Attacks/Indicators identified and sent to the controller
· Packet archive
­ Attack/Indicator traffic ­ Triggered packet captures (v2.1)
· Searchable archive: network conversation details
­ URLs, DNS names ­ L3/L4 network header fields (flags) ­ HTTP headers ­ DNS decoded data ­ SSL handshake information (future) ­ File hashes (future) ­ Stream entropy (future)

13

Attack Indicator Summary
14

Host Dossier: Speed of analysis & context of conversations
15

Firewall / IPS / SIEM Log

Timestamp
Jun 16, 2016 5:25:02 Jun 16, 2016 5:26:13 Jun 16, 2016 5:28:07 Jun 16, 2016 5:29:02 Jun 16, 2016 5:30:50 Jun 16, 2016 5:31:18

Src IP
192.168.15.50 192.168.17.22 192.168.18.78 192.168.17.100

Src

Dst IP

Port

2123 10.88.123.8

4563 202.16.8.11

210.15.64.18

5534 10.88.123.8

192.168.22.30 192.168.15.51

6668 10.88.123.8 3112 10.88.123.8

Dst Port
99 80 21 5533
5545 2000

Protocol Bytes Action

TCP

2K Drop

TCP

1K Permit

TCP

1G Permit

TCP

200 Drop

bytes

TCP

1K Drop

TCP

3K Drop

How Spectrum can help !?

16

IR Workflow - Mapping Attack Kill Chain
210.15.64.18
17

IR Workflow - Mapping Attack Kill Chain

FTP

1Gbps

192.168.18.78

210.15.64.18

18

IR Workflow - Mapping Attack Kill Chain

Port

FTP

Scans

1Gbps

192.168.18.50

192.168.18.78

210.15.64.18

19

IR Workflow - Mapping Attack Kill Chain
20

IR Workflow - Mapping Attack Kill Chain
21

IR Workflow - Mapping Attack Kill Chain

PlugX

Port

FTP

RAT

Scans

1Gbps

180.210.206.246

192.168.18.50

192.168.18.78

210.15.64.18

22

IR Workflow - Mapping Attack Kill Chain
23

IR Workflow - Mapping Attack Kill Chain
24

IR Workflow - Mapping Attack Kill Chain
180.210.206.246 (Internet)
Delivery/Installation (PlugX RAT)
192.168.10.50 , 192.168.11.50, 192.168.12.50, 192.168.13.50, 192.168.14.50, 192.168.15.50, 192.168.16.50, 192.168.17.50, 192.168.19.50, 192.168.20.50, 192.168.21.50, 192.168.22.50, 192.168.18.50 Jump server
lateral movement
192.168.18.78
data transfer ­ Kill Chain completed
210.15.64.18 (Internet)
25

Case Study: Detection & Proof of an Attack Campaign in Minutes

Challenge:
· Small Security Operations function responsible for managing events and incidents across a large, distributed network with global data centers.
· Deployed SIEM, Security forensics and used 3 open sourceand other tools to detect and investigate incidents.
Arbor:
· Deployed Arbor within a day and received onehour of training. Within the sameday the team was using the solution to find and investigate potential threats.
· Almost immediately a threat indicator was detected using Arbor Intelligence.
· Further analysis of the traffic,and subsequent hosts implicated.
· Investigation took minutes whereas the team would normally take3-4 days to perform a similiar analysis.
· Their SIEM and existing threat infrastructure had not identified the initial threat indicator.

"The best thing about Arbor Spectrum is that you really don't even need a novice skill level of network forensics to use it. The interface is straightforward, and it's simple to extract important information relevant to an investigation."
­ Security Operations Lead F500 Multinational

26

The Numbers: # Investigations per 8-Hour Shift

Senior Incident Responder Mid-level Analyst
Junior Analyst Network Engineer

Today
3 0 0 0

With Arbor Spectrum
30+ 10-20
5-10 3-5

27

Compromise is Inevitable, Data Loss is Not

Attackers only Need to Win ONCE, We Need to Win EVERY TIME!

Value
Comfort Zone

Proactive
Advanced Detection
Prevention

Transition Transition

Proactive
Advanced Detection
Prevention

Majority of Organizations (Detect & Respond Strategy)

Leading Organizations (Seek & Contain Strategy)

Hunting Toolkit · Threat
Intelligence · Network Behavioral
Analysis · Network Forensics · Sandbox · Payload Analysis
Legacy Controls SIEM
· Vulnerability Patching · Network (FW, IDS) · Endpoint (AV)

28

Distribute Denial of Service

©2015 ARBOR® CONFIDENTIAL & PROPRIETARY

30

DDoS role in Advanced Threat

ORGANIZATION'S NETWORK

S TA GE 3
Delivery Does not use malware payload

S TA GE 4
Lateral Movement

S TA GE 2
InitialDDoS
Entry Point Bypasses Sandbox

S TA GE 1 Reconn

Remote Subsidiary

Unsupervised Consultant

Desktop of CFO

SENSITIVE ASSETS

S TA GE 5
Command and Control

Server calling out to botmaster in Latvia

S TA GE 6
ExfilDtraDtioonS
31

S TA GE 7
Mission Complete Use Forensics to detail incident

STATE EXHAUSTION DDOS ATTACK
Attack Traffic Good Traffic
DATA CENTER
Full !!
32

STATEFUL DEVICE ?
Firewall IPS Load Balancer
33

WAF Anti-DDoS

STATEFUL DEVICE ?
34

BOTNET SIZES
Marina ­ 6 million Bots Mariposa ­ 12 million Bots ZeroAccess ­ 1.9 million Bots Storm ­ up to 50 million Bots Cutwail ­ 1.5 million Bots Conficker ­ 10.5 million Bots BredoLab ­ 30 million Bots TDL4 ­ 4.5 million Bots Ramnit ­ 3 million Bots Akbot ­ 1.3 million Bots Grum ­ 560,000 Bots Mega-D ­ 509,000 Bots Kraken ­ 500,000 Bots Srizbi ­ 450,000 Bots

10 x 3 = 30

Connection

million

million

35

ARBOR WISR STATISTICS
Firewall, IPS FAILED during DDoS Attacks Y2013

Y2015

Y2012
Source: Arbor Networks Annual Worldwide Infrastructure Security Report

Y2014
36

ON-PREMISE: ARBOR AVAILABILITY PROTECTION SYSTEM (APS)

· Always On, In-Line Protection from network & application layer DDS attacks and advanced threats
· In-bound and Out-bound threat identification and mitigation
· Mitigation platforms and capacities ranging from 2U appliances (1Gbps40Gbps) to virtual (sub 1Gbps)
· One-Box SSL Inspection to protect against malicious attacks embedded into encrypted traffic with SSL Card
· Intelligent communication through Cloud SignalingSM between APS and Arbor Cloud for comprehensive DDoS protection
· ATLAS Intelligence Feed (AIF) continuously arms APS with global, actionable threat intelligence
· Managed APS (mAPS) for optimized DDoS protection

Appliances

Virtual

37

DDoS Campaigns & Advanced Threats

ISP 1 ISP 2
ISP n

ASERT
ISP

AIF Security Intelligent Feed

DATA CENTER

Attack Traffic Good Traffic

IPS Load
Balancer
Target Applications &
Services

AIF BASIC
DDoS Threats IP Geo-Location Web Crawler Identification Command and Control
Malware 38

AIF ADVANCED Location Based Threats
Email Threats Targeted Attacks / Campaigns
Mobile

ARBOR ADVANTAGE

©2015 ARBOR® CONFIDENTIAL & PROPRIETARY

39

PROVEN, TRUSTED DDoS PROTECTION
40

PROVEN, TRUSTED DDoS PROTECTION
"Arbor has now secured 25 patents focused on DDoS"
41

PROVEN, TRUSTED DDoS PROTECTION
Frost & Sullivan Report - DDoS Mitigation Global Market Analysis ­ Nov 2015
42

ATLAS & ASERT

· 15 years of deployment in a majority of world's ISPs offer unique visibility into global threats

· Over 330 ISPs participating in ATLAS; providing Global Visibility and Threat Intelligence

· ASERT is a team of industry experts

who conduct threat research, help

customer mitigate DDoS attacks and

IF

create ATLAS Intelligence Feeds

· ATLAS & ASERT continuously arm all Arbor products and services with global threat intelligence called ATLAS Intelligence Feed allowing customers to stay abreast of DDoS and advanced threats

43

ATLAS GLOBAL THREAT ANALYSIS SYSTEM
Ø ASERT has data of ~98% ASNs
Ø ~50% coverage of national CERT teams
Ø ASERT has seen 2.63B unique IPv4 addresses (~71% theoretical)
Ø ASERT monitors 1.76M "dark" IPv4 addresses
44

Today's Cyber Security Challenges

CDNs
Service Providers

Mobile Carriers

Internal Apps

Remote Offices

ARBOR ARBOR Never see

Can't

Never see the

the external

withstand a

threat already

APS SPECTRUM threat traffic

direct attack

inside enterprise

Corporate Servers

SaaS

Cloud Providers

Enterprise Perimeter
45

Mobile WiFi

Employees

Q&A / THANK YOU
For More Information, Please Contact: Tony Teo, Director Sales Engineering, APAC
Ph: +65 9680 5133 Email: tteo@arbor.net

©2015 ARBOR® CONFIDENTIAL & PROPRIETARY

46

