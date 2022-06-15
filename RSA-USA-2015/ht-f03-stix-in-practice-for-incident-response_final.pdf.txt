SESSION ID: HT-F03
STIX in Practice for Incident Response

Freddy Dezeure
Head of CERT-EU http://cert.europa.eu/

#RSAC

#RSAC
About Us
 EU Institutions' own CERT  Supports 60+ entities  Operational defense against cyber threats
2

#RSAC
Other EU Cyber Bodies
ENISA  Europe-wide mandate in cyber security  Supporting best practices, capacity building and awareness raising
EUROPOL EC3  Europe-wide mandate in fight against cyber-crime  Operational cooperation between police computer crime units
3

Services

CCoConConsonstnisttistutituteiutenuentenstnststs

#RSAC

Prevention

Detection

Advisories White Papers

Alerts

Incident Handling
CERT-EU

Response

Malware Security

analysis

Tools

Threat

Threat

Intelligence assessment

Specialised support
Peers & Partners Law enforcement

Feeds
IOCs Rules Context

4

Services

CCoConConsonstnisttistutituteiutenuentenstnststs

#RSAC

Prevention

Detection

Advisories White Papers

Alerts

Incident Handling
CERT-EU

Response

Malware Security

analysis

Tools

Threat

Threat

Intelligence assessment

Specialised support
Peers & Partners Law enforcement

Feeds
IOCs Rules Context

5

#RSAC
Agenda
 Introduction  Architecture  Use case 1: Detection  Use case 2: Scoping  Use case 3: Strategic insight  Apply
6

STIX Model+

Associated Campaigns

Related Indicators RelatedTTP

Related TTP

RelatedIndicators Observables

#RSAC

Historical Campaigns
Attribution

Observed TTP

RelatedIndicator

Related TTP LeveragedTTP

Related Incidents

Associated Actors

Exploit Target

COA Taken

COA Requeste
d

Suggested COA

Related Incidents

Related Threat Actors

SubObservables

Organisation

Victims Sources Clients

CTI Architecture

Internal Intelligence

Sources

Data

CERT-EU

Constituents Unstructured

Peers Partners

Structured STIX/Cybox
MISP

Other sources

External Intelligence

Collector Import Control Export Control
Producer

CTI Repository
CTI-db
Actors TTPs Campaigns Courses of Action Targets Incidents Organisations
Indicators Observables
8

#RSAC

Products
Threat Landscape
Specific Threatsl
MISP
STIX / Cybox
Feeds

Recipients
Constituents Peers
Partners

CTI Architecture

Sources
Constituents Peers
Partners Others

Collected Threat data

Formatting Contextualisation

CERT-EU
CTI Repository

Feedback Positives False Positives

#RSAC

Shared Threat data

Consumers
Constituents Peers
Partners

Correlation
9

Standard Format Routing
Course of Action

#RSAC
Threat Data Collection
 Large diversity of information sources  Too much irrelevant information  Accuracy not guaranteed  Unclear timing  Unclear sighting or targeting  Difficult prioritisation
10

Contextualisation

#RSAC
Industry best practice?

Raw Types Values

Date Detect Date Start Date
End

Timing

Minimal Context

Extended Context

Targeting

KillChain

Continent Country Organisation

Sector / Industry

1. Scan/Reco 2. Weapon 3. Delivery 4. Exploit 5. Install 6. CnC 7. Actions

TTP Campaign Actor

11

Poor Context

Tim ing



Detect_date

Start_date

End_date

KillChain



Targe ting



Geoloc

Sector

#RSAC

Tim ing



Detect_date

Start_date

End_date

KillChain



Targe ting



Geoloc

Sector

12

Better Context

Tim ing Detect_date Start_date End_date
KillChain Targe ting
Geoloc Sector

  
N/A
 

#RSAC

13

Threat Scope

EU-I - Targeting one or more constituents
EU-Centric ­ Targeting EU Member States
EU Nearby - Targeting close partners (e.g. NATO,
USA)
World-Class - EU-I might be
'opportunity' or 'collateral' victims of major world-wide threats

Threat level

HIGH

Medium priority

Medium priority

High priority

High priority

MEDIUM

Low priority

Medium priority

High priority

LOW World-Wide EU-nearby

Low priority
EU-centric

Low priority
EU-I

Threat Level
High
Very sophisticated APT
Medium
APT
Low
Non-targeted mass attacks / malware
High priority threat Medium priority threat Low priority threat Out of scope = 'noise'
Threat Scope

#RSAC

#RSAC
Constituent Perspective
 Limited resources  Specific IT security tools  Specific policies
 Prioritisation  Automation / Routing  Minimise false-positives  Actionable context when needed
15

Threat Data Sharing

Raw

+ Context

#RSAC

Selection Routing

Prioritise Decide
Act

IDS

Firewall

Mail server

Log

Host

Intelligence

analyser

Scanner

Awareness

SIEM

16

#RSAC
STIX Model

Related Indicators RelatedTTP

Related TTP

RelatedIndicators Observables

Attribution

Observed TTP

RelatedIndicator

Related TTP LeveragedTTP

Related Incidents

SubObservables

Use Case 1: Detection

CTI-db
Actors TTPs Campaigns Courses of Action Targets Incidents Organisations
Indicators Observables

Export Control Producer

Products
SNORT YARA CSV MISP STIX / Cybox

Recipients
Constituents Peers
Partners

Detection
SOURCEFIRE SURICATA Q-RADAR ARCSIGHT
SPLUNK
TH0R nCASE
Proxy

#RSAC
CTI-db
Actors TTPs Campaigns Courses of Action Targets Incidents Organisations
Indicators Observables

18

#RSAC
Use Case 2: Scoping
Malware reversing Internal process
 Scanning for IOCs in logs and hosts  Scanning for anomalous traffic  Hits on the proxy/IDS External process  Has anybody else seen this?
 No? -> You're on your own  Yes? -> Multiply knowledge on IOCs  What's the timeline
 Sinkholing
19

#RSAC
Pivoting via Actor / Campaign

Incident 1

Incident 2

Incident 3

Incident 1

Unique TTPs Yara Snort
20

Incident 2

Incident 3

Technical Tactical Strategic

Use Case 3: Strategic Insight

· Understanding the broader context. · Strategic context: profile, motives, new
techniques/tactics, sector and location of victims, business risk. · Planning high level actions for non-technical treatment of the threat.

· CEO · Business VP · CIO

· Understanding cyber-attacks tactical context: threat type and level, timing of events, techniques/malware used.
· Planning structured course of actions for permanent protection

· CIO · Cyber-defense teams

· Immediate reaction to threats: Detection, Prevention, Reaction (eradication, recovery), Report
· Dynamic feeding cyber-defense tools: IDS, IPS, SIEM, Security Scanners, Mailguard, Firewalls, etc

· Cyber-defense teams · IT administrators (or direct tool feeding)

#RSAC

Periodic Bulletin

Threat Landscape
Security Brief

For every new significant campaign

CITAR

IOCs Rules (Near real-time -> Towards full automation)

CIMBL Feeds

Current Content

· 200+ · Espionage/Strategic · Hacktivists · Cyber-criminals

Threat Actors

Campaigns
· 300+ · Espionage (political, industrial, etc) · Hacktivism · CyberCrime
Incidents & Indicators
· 3000+ per year · Scope: Constituency / EU-centric / EU-nearby/ World-class

#RSAC

Victims
· 500+ · Continet/country · Sector (Diplomacy, Defense, Energy, Transport, etc) · Type (Private, Public)

Victims

Observables
· 800.000 targeted IOCs · Malicious Domains = 65 % · Malicious Files = 10% · Malicious email addresses = 8% · Malicious IP = 5 % · Malicious URL = 4 % · Other (Regkey, snort, etc) = 8%

Techniques, Tactics, Procedures
· 500+ · "Idendity card" of malware, botnets, C&C infrastructures, tools, exploit-kits · Killchain analysis · Focus on sophisticated & targeted TTP

22

#RSAC
Some Open Issues
 How to manage lifetime of the data  How to remove data downstream  How to control sharing groups downstream  Implement Course of Action  How to maintain the treasure trove of TTPs
23

#RSAC
Apply Slide
 Insist with your suppliers to deliver context with their feeds  Identify "your" definitions to filter inputs/outputs
 Threat scope and level  Sharing groups  Course of Action ...
 Start implementing your own internal STIX repository  Embed it in your processes
24

Thank You!

#RSAC

http://cert.europa.eu/

