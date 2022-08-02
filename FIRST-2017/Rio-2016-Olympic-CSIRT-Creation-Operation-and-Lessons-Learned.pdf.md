Rio 2016 CSIRT
Creation, operations and lessons learned ­ Rômulo Rocha

Bio
· Rômulo Rocha · From Rio de Janeiro , Brazil · @romrocha · Love topics related to hunting and incident response · Security Consultant at Tempest Security Intelligence

Agenda
· Olympics briefing · CSIRT (strategy, timeline, operations, channels,etc) · Wargames · Games Time! (*focus only on Olympic games) · Lessons Learned

Olympics briefing

Two Events in the same city

TECH IN THE FIELD
CIS OVR
INTERCOM T&S

P A

CELULAR

SCOREBOARD

WI-FI

VIDEOBOARD

BROADCAST SCOREBOARD

2014 scenario
· Regular security team, deploying preventive controls · Around 10 people · Hundred projects like crypto, endpoint protection, border control, ips, hardening, etc · Minor incidents happening inside our network · Moments of concern during World Cup and Sochi (also lot of activity at border) · Lot of effort to maintain confidentiality of projects (Mascots, brand, medals,website) · Incident response when possible, no process · Running against time to deploy everything · Threat intel monitoring and website takedown services were already running

CSIRT

Strategy
· Necessity of a CSIRT were clear for Rio 2016 employees and C level, some threat actors were active by end of World Cup 2014 and politic clashes were erupting all around
· Defined a strategy at beginning and followed until the end, simple is better · Well defined rules and responsibilities · Training of employees and trust of CSIRT inside company. · Communication is key, be announced globally and have clear/strong
communication channels with local ISP, content providers, Cert.br , CDCiber (army), government agencies, sponsors and local security community. · Trying not recreate the wheel, use what you have already.

Mascots release
Tickets sales started

44 test events

1st Technical rehearsal

2nd Technical rehearsal

Games website launch

1st Wargames

2nd Wargames

3rd Wargames

Games Time

2015
Strategy and Policies in Place

Services 10

2016 20

CSIRT established

Procedures 1st delivery

2nd wave of preventive controls

Wiki v1

Procedures 2nd delivery

3rd wave of preventive controls

Cert.br Training
KillChain framework in place

Procedures 3rd delivery

1k clients

2k clients

3k clients

60

80

4th wave of preventive controls

"Last Call"

50k clients

+80k clients

Escalation Reporting

Incident Response and hunting
Incident Response Lead

Incident Response Specialists (x2)
Federal Police Agent
Threat Intelligence Specialist

Cisco Security (x2) Army agent (Cdciber)

Management

Security Manager

Situational Awareness
TOC Support

Japan CERT Partners Advisors

Embratel DDOS Specialist
CDN Specialist
IPS Specialist

Alerts Incidents
Triage
Feedback IOCs
Procedures

Operations Lead

Monitoring

IDM Lead

Network Operations

PaloAlto Specialist Symantec MSS

Cisco Security
Symantec Operations (x4)

Education and Awareness

Replication Backup
EMC

Flipside

DDoS mitigation SOC NOC Webhosting Network Security

Embratel Claro

Cisco

Network Security Hardware support

Microsoft

Results Website Azure Cloud

Mobile APP Mobile Security

Samsung

Service Delivery Telecom Systems Development Ticketing Brand protection Enterprise Security Legal Workforce

RIO2016 FA
Morphus

CSIRT

Symantec

Security Software MSS Anti malware

Games Services Atos Games Network
Games IDM Games SIEM
E&Y

WarGames Support Red Team Support Pentesting

Tempest
Threat Intel WarGames Support Red Team Support Pentesting

Akamai

Process Support Red Team Support

CDN and App Security

IOC CERT.BR

CDCiber (Army)

External CSIRTS

Brazilia n ISPs

Federal Police

Brazilian Content Providers

Japan NIST

Critical Infrastructure
Partners

External CSIRTs

Wargames

How it worked?

Objectives:
· Stimulates communication
· Team readiness and rehearsal
· Test effectiveness of incident response processes and procedures
· Evaluate alert triggering on tools (bonus)
· Assess exposure of the corporate network to attack vectors (bonus)
· Based on common practices (Mitre, Nato, Enisa, Poland Cyber, etc)

Object ives

Scenar ios

Events

Based on threat intel, earlier games, world cup attacks, etc

Exercise Control Group (Green Team)
Tasks

Provide feedback Tasks

Monitors (White team)
Collects information

Red Team

Executes inject

Training Audience (Blue Team)

Our Wargames
· Three times, lasting around 1 week · Full live (on production) · To achieve the highest realism possible, blue and red team had no contact
and worked in different physical environments · None of the teams were aware of their capabilities · Scenarios based on threat intel and common knowledge collected
previously · Number of participants were increasing during time · After each session, a lot of data were generated, helping us to improve our
capabilities.

WG1 briefing

· 28th Sep ­ 2nd Oct , 2015
· Scope: Corporate Network (some interfaces with Games Network as well)
· Over 20 people
· 16 Scenarios

Intentions: Capabilities:
Goals:

Red team briefing
Abuse the brand and public image of games to spread politically motivated message.
Not cutting-edge attacks, 0days , attacks like SQLi, XSS, Spear Phishing, Password attacks, Wifi, Common-grade malwares, Windows Attacks (passhash, lateral movement, AD compromise,etc)
· Compromise and alter Rio 2016 websites
· Compromise Rio 2016 social media presence
· Access and leak confidential documents
· Access and leak volunteers information
· Access and leak financial information

WG1 in a nutshell

Red Team
Used a lot smoke screen attacks to distract Blue Team

Blue Team Detected and blocked all smoke screen attacks

Send spear phishing attacks to important accounts based on social media gatherings
Got administrative control over domain Got administrative control over switches and
Wifi Lateral movement and persistence on network
Completed all scenarios, including taking accounts of mascots in twitter
Unleashed #op_olympic_chaos in the last day

Detected and contained a spear phishing attack but did not investigated source of
attack
Triage was not effective
Tools getting alarms, but lacking correlation and automatization
Lack of procedures
Preventive controls and fine adjustment on tools still needed

WG2 briefing

· Feb 22 Nd ­ Feb 26th ­ 2016
· Repeated the first, to validate improvements
· CSIRT more structured and with processes
· Over 40 people
· 16 Scenarios

Intentions: Capabilities:
Goals:

Red team briefing
Abuse the brand and public image of games to spread politically motivated message.
Not cutting-edge attacks, 0days , attacks like SQLi, XSS, Spear Phishing, Password attacks, Wifi, Common-grade malwares, Windows Attacks (passhash, lateral movement, AD compromise,etc)
· Compromise and alter Rio 2016 websites
· Compromise Rio 2016 social media presence
· Access and leak confidential documents
· Access and leak volunteers information
· Access and leak financial information

WG2 in a nutshell

Red Team
Used a lot smoke screen attacks to distract Blue Team in critical moments
Send spear phishing attacks to important accounts
Got credentials to CSIRT back office system using spear phishing against one team member Got credentials mining emails
Got Rio 2016 Facebook credentials
Created a spear phishing hosted in one of our websites
In the end, received gold ticket to create a hard scenario for blue team

Blue Team
Majority of smoke screen attacks didn't take time to contain, but drained team resources
Successfully detected and contained the majority of the high-impact attacks
performed by the red team
Communication was way better but still lacking procedures and investigations in depth,
should take more intel from attacks
Tools getting alarms and some automatization
Triage was better
More preventive tools in place (endpoint hardening, network monitoring,etc)
Better SIEM adjustments and triggering, correlation stills weak

WG3 briefing

· Jun 20th ­ 24th ­ 2016
· Scope: Corporate Network (some interfaces with Games Network as well)
· Over 70 people
· 3 Shifts working like GT
· Same team structure as GT, including Security Manager.
· 34 Scenarios

Intentions: Capabilities:
Goals:

Red team briefing
Use same techniques as attackers, which are: hacktivists, fraudsters and bankers.
Rogue Aps, BruteForce, Evil Twind, Spoofing, DDOS, Spear Phishing, Social Eng, Network Attacks, Windows Exploitation, Information Leakage, etc
· Test blue team response to some specific scenarios. (table below)

WG3 in a nutshell

Red Team
Used a lot smoke screen attacks to distract Blue Team

Blue Team
Still needs automatization for some types of attacks

Still getting network credentials in ticket systems
Spear phishing specially crafted to administrators in third party companies
Disruption of SIEM tool
Bypassed 802.1x auth and implanted Rogue AP in new networks

Ticket system was too slow for incident response
Contained majority of attacks
Triage working better Still lacking some procedures for incident
response

Marks between Wargames

CWG1
Sep 28th ­ Oct 2nd 2015 +20 people

CWG2
Feb 22nd ­ 26th 2016

+40 people

· Rules and responsibilities diffused, team without instructions
· Lot of failures in tools configurations and infrastructure not mature.
· Privileged local accounts on border · Domain admins without necessity
· Critical accounts without proper security (2fa)
· Lateral movement easily · Network segmentation immature · Triage inefficient, low severity
incidents consuming analysts time · Lack of integration with important
areas like communication and social media

· Better infrastructure and monitoring
· Critical accounts monitored · Triage and incident classification
· Cyber Kill Chain and TTP idea adopted by the team
· Improvement on documentation and processes
· Better network segmentation
· Endpoint hardening improvements
· Better CSIRT notifications (templates and automatization)
· Post-Mortem still bad
· IOCs monitoring and sharing being used, but in not all cases
· Better integration with service desk and field services

CWG3
Jun 20th ­ 24th 2016

+70 people

· Rules and responsibilities well defined and understood by team
· Incident response process documented · 802.1x auth in the network · Better network segmentation (avoiding
network lateral movement) · Endpoint hardened · Better intel extraction after incidents · Utilization of IOCs · Windows accounts sanitization and
control in place

Lessons learned from Wargames

· Training your team under high pressure is essential, you will be surprised
· Rules and responsibilities must be aligned and understood by everyone
· Communication between teams and shifts are key, incident analysis should flow no matter who is in the charge
· Yes, still have to tune that tool =D
· Briefing before critical moments is valuable
· Your backoffice tool, should be more secure than anything. (and have backup)

· Use a back office tools, that gives speed, security and an excellent flow for incident and investigation procedures
· The importance to understand TTPs of adversaries is key for training and proper incident response methods, intel have to been extracted from attacks
· People still sharing passwords through email, 2fa is a must
· When triage does not work well, nothing works well
· Review every admin account that used in our domain, specially if they are running as a service, avoid that with your heart (MS LAPS can help too)
· User education is a relief during a scenario of attacks, they helped a lot in spear phishing attacks detection

Photos

Games time!
(*focus only on Olympic games)

OLIMPIC GAMES
11.303 athletes
207 delegations 205 Countries
+Team of Refugees +Independent athletes
974 Medals

Ticket s
+6.1 millions tickets
(London 2012: 8.8 millions)
701 sport sessions

GAMES VISIBILITY
+4,5 BI SPECTATORS
+350,000 HOURS OF TRANSMISSIONS (London 2012: 200,000)
+500 CHANNELS
+250 DIGITAL PLATFORMS

PEOPLE
7,262
IT & TELECOM professionals
5,509
Partners and contractors
1,341
Volunteers

INFRAESTRUTURA
850
Servers
6
Datacenters
15.000
Computers
144
Arenas

REDES

WEBSITE E APP

100.000 4 continents

Ports

Distribution

7.000
Access Points

1,2 Bi Pageviews

370km
Olympic Backbone

8 Mi Downloads
APP Oficial

PESSOAS
92.875
Workforce
57.256
Press Wifi
18.027
Athletes (Wi-Fi users)

Wrap up for CSIRT
· Operations initiated 24x7 in 4th July 2016 · Clients: Press, Olympic family, Sponsors and Partners. · Escope: Rio 2016 infrastructure (on premise and cloud) · Around 80 people in CSIRT team · 15 companies · Red team inside CSIRT team · Threat intelligence covering more than 9 languages (with help of Japan) · Cooperation with government agencies · Remote and on-site IR.

Threat intel timeline

July

August

September

23 25 & 26 28 29

01 02 03

05
Opening Ceremony

06

08

09

12

13

16

23

05

07

12, 14 & 16

#OpOlympicHacking restarted

Sponsors removed from target list

1st leak of a sports confederation's DB

- 1st video released - Brazilian hacktivist made

Ghost Squad attacks government websites

contact with CyberguerrillA

- IRC channel created

- 1st target list released

- Anon BR starts to spread

#OpOlympicHacking

on social media

New targets added: - Sponsors - IOC

- Pastebin post describing operation in 3 languages: Portuguese, English and Spanish

- COB

(Brazilian OC)

Target list updated to include

Asor Hack Team defaced the

CBF, construction contractors

website of Cyrela and leaked

and companies

personal data stored in it

Russian group "Fancy Bears"

hacked WADA and leaked

Anon BR released texts and videos calling for engagement on #OpOlympicHacking

-Brazilian hacktivist said he

Anon BR releases "summary" of #OpOlympicHacking

sensitive information of Olympic Athletes from several countries:

-Released tool to perform DDoS attacks against targets - #OpOlympicHacking gained visibility on international media

was being tracked -He deleted his Twitter profile -Anon Poland disclosed DB of Court of Arbitration for Sport

Anon Poland criticizes Olympic

- Doping tests; - Certificates for therapeutic usage of prohibited drugs.

Games and promises new

WADA confirmed the hack

Leaks of personal data of:

attacks against WADA

Mayor and Governor of RJ; Sports Minister; Presidents of COB and CBF; managers of construction companies that were on the target list

WADA announced it received Phishing attacks on early Aug
and confirmed Yuliya Stepanova's (Russian whistleblower) account was
compromised

- Anon Poland says the group attacked "teamusa.org" and "paralympic.org" - Our assessment classified that as false claims

Caption

DB leaks of several

AnonOpsBR hacked OBS

Main activities

sports confederations

(Olympic Broadcasting

Services) main website and

- DDoS attacks against

leaked an associated DB

Other Hacktivism

website "www.rj.gov.br"

activities

- Leaked personal data of

heads of RJ Gov. offices

Security Numbers
· +20m of alerts · 181 incidents · 50.000 authentications using 2FA (around
5800 users) · Around +800 malware blocked on
AntiSpam. · +50 takedowns during the games time
period · +30m WAF blocks (website e mobile app) · +100k connected equipments · Major incidents: Anon ransomware,
Wada attacks detected on our network

Lessons learned from whole experience
· Understand you public, scope and start small · Know your communication channels, exercise them regularly · Brief and contact external partners before critical periods · Fine tuning forever · Triage is key, cannot be underlooked as someone without experience · Centralize your documentation, make it easy for newcomers · Attention to shift hand-off, contextual information can be lost. (overlaying is a good option) · Avoid at all cost, the "ticket closing" behavior, incidents should be investigated until the end.
TTPs and IOCs must be determined and returned to monitoring · Situational awareness meetings/reports is nice to have, set team in the mood and prepare for
difficult situations · Automatize everything as possible

Thank you

