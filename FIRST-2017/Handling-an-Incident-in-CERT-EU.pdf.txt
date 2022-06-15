Handling an incident in CERT-EU FIRST - 2017
Emilien LE JAMTEL emilien.le.jamtel@cert.europa.eu

Introduction

· CERT for European Institutions, Agencies, and Bodies. · Created in 2011. · Operational support to infrastructure teams. · Defence against targeted cyber threats. · Hub of information and skills.

Constituents
· Around 60 organisations · From 40 ­ 40.000 users · Seperate, heterogenous networks · Cross-sectoral
­ Government, foreign policy, embassies ­ Banking, energy, pharmaceutical, chemical, food, telecom ­ Maritime, rail and aviation safety ­ Law enforcement (EUROPOL, FRONTEX, EUPOL) and justice ­ Research, hi-tech, navigation (GALILEO), defence (EUMS, EDA)
· High-value targets
4

Content of this presentation
· Step-by-step incident case · Focus on tools and exchange of information
· With external entities · Between CERT-EU teams

· Involved parties

P

F

A

T

C

Partners

First Response Analysts Threat Intelligence

Team

Team

Constituents

5

CERT-EU

Chapter 1 Initial alert

P
F A

Chapter 2 Sharing

P F
C

CERT-EU SOC

Partners
CSV
PGP email
Threat Intel
Database

Constituents
CSV

Chapter 3 Hunting

F

Building Blocks
· Log management tool: · IDS:
· Cyber Threat Intelligence database: CERT-EU
· Monitoring:
16

CERT-EU
Intelligence Sources - Partners - OSINT - Monitoring

CERT-EU Infrastructure

Cyber Threat Intelligence
AbuseHelper Splunk Search Head

Incident Handling
Team

Constituent X Splunk Indexer

FireEye

Constituent Y Splunk Indexer

SourceFire

Constituent Z Splunk Indexer

SourceFire

DNS Proxy Email

DNS

Proxy

Email

DNS

Pr1o7xy

Web traffic:
» DNS » Proxy
Emails:
» Exchange » Mimesweeper
Hosts:
» Sysmon » Applocker » McAfee
Appliances:
» Sourcefire » Ironport » FireEye

Log Sources

Constituent

Splunk Indexer

Sysmon: powershell, applocker, events, cmd

AV (McAfee)
DNS Proxy Email Mimesweeper SourceFire
Future :
 Firewalls  Active Directory  Servers  Reverse Proxy
18

A T
C

Th0r Packages
· Preparation T
­ YARA rules ­ Evil hashes ­ Custom filenames characteristics
· Distribution C
­ GPO ­ Endpoint Management
· Reporting and analysis
­ Text/HTML report ­ Splunk app
A

Chapter 4 New evidence

C

 Constituents details  CERT-EU deliverables  Indicator search  File Analysis  Vulnerability scanning

Customer Portal

P A

Peers - Partners

Chapter 5 Another infection?

F A

Splunk:Network
F
30

Splunk & CTI
F
T
31

Drill-Down
F A
32

Chapter 6 And now what?

A
Technical Report Analysis of campaign
T
Reports CITAR CITAR-Flash Alerts

Technical Products

Incident Reports
Incident Timeline
Technical details

Advisories
Technical description
Detection Mechanism

Recovery

Prevention

Reaction

Feeds
IOCs
Detection rules
IT administrators Incident Response teams
SOC teams
Near Real time

CITAR
Tactical Context
Threat type and level
TTPs
Structured course of
action

Tactical Products

CITARFLASH

Whitepapers

Ongoing campaigns

Based on incidents

Targeted entities
Short-term course of
action

Peerreviewed
CIO Incident Response teams

Significant Campaigns

Strategic Products

Security Brief
One page

Threat Landscape
Threat evolution

Commented threat

Adversaries profiling

New TTPs

Sectorial
High-level course of
action

CIO / CEO Policy makers
Periodic Bulletin

Epilogue

What we didn't speak about
· Red Team · Vulnerability Assessment services · Bugbounty program · Research and whitepapers · Automation framework (AH) · Workshops / trainings ·...
40

Thank You
https://cert.europa.eu/ https://github.com/certeu/
41

