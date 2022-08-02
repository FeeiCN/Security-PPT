SESSION ID: STR-W04
Next Wave of Security Operationalization

Peter Lam
A National Bank Security Analyst

#RSAC

#RSAC
Disclaimer
 The views and opinions expressed in this presentation are those of the authors and do not necessarily represent of position of RSA or the author's employer
2

#RSAC
Speaker Bio
 Who am I?
 Peter Lam  1st Time Presenter at RSA  Information Security Staff in a national bank  20+ Year of Professional IT Experience
 Experience in:
 System / Platform Engineering, Application Development, Security, Incident Response
3

#RSAC
Purpose & Audience

#RSAC
Purpose & Audience
 Purpose
 Help Drive Better Adoption of Technologies (Vendor & Us)  Demand Drives Supply
 Definitely NOT to Repeat Presentations around STIX/TAXII by MITRE team
 Introduce A Proof-of-Concept Threat Operationalization Platform  Certain Problems These Technologies Help Solve NOW
 Audience
 Everyone who Wants to Learn about STIX & TAXII but Want Something that They Can Try Without Too Much Cost
5

#RSAC
What's the problem?

#RSAC
Intelligence Sources

price

type

Paid

Free

Control System

Private Vendor

Open Govern Private Source ment Vendor

Proprietary / Portal / Secured

System Specific

Email

CSV / CIF / RSS

PDF / RSS

PDF

format

touch needed

Yes

Maybe

Maybe

e.g.

Firewall

ISAC / Boutique Security Firm

CIF ­ Collective Intelligence Framework

ISAC ­ Information Sharing and Analysis Center

OSINT ­ Open Source Intelligence

CISCP ­ Cyber Information Sharing and Collaboration Program

7

OSINT

No CISCP

No
Any
(Teaser News)

#RSAC
Challenge One
 Ineffective and Labor Intensive, because
 Multiple delivery channels  Mostly manual effort
 Missed email; Staff on vacation, etc.
 Format varies greatly among vendor  Comma Separated Value (CSV), Extendible Markup Language (XML), Unformatted text
 Needs multiple parsers for different sources  Human error; copy & paste, field extraction
 Huge amount of Intelligence
8

Simplistic Control Network

Application
Laptop Users
Desktop Users

Web Application Firewall Vendor "Secret Sauce"

Web Application Firewall

End-Point Protection

End-Point Protection
End-Point Protection Vendor "Secret Sauce"

proxy

Firewall

Proxy Vendor "Secret Sauce"
9

Firewall Vendor "Secret Sauce"

#RSAC

Simplistic Control Network

Laptop Users (at home)

End-Point Protection

Laptop Users

End-Point Protection

proxy

Evil

Desktop Users

End-Point Protection
End-Point Protection Vendor "Secret Sauce"

Proxy Vendor "Secret Sauce"
10

#RSAC

Challenge Two

#RSAC
 Vendors Most Likely Won't Share Their "Secret Sauce", or indicators
 Unless Part of the Sharing Ring  Not Hard to Understand "Why"  Same Indicator Not Replicated Across Multiple Controls  Multi-Layer Security Control
But Single-Layer Security Intelligence?
11

What?

#RSAC
· Operationalization of Threat Intelligence Handling around Indicators
· Automatically: · Collect
· Receive Threat Intelligence · Dissect
· Extract Crucial Indicators · Detect
· Search for Realized Threat · Distribute
· Intelligence across All Layers of Controls · Prevent
· Deploy Prevention Control
12

Why?

#RSAC
· Bad Guys have Malware Supply Chain
· Commercialization of Crime Ware
· Highly Time Sensitive Response Needed
· Exponentially Expensive to Recover
· Machines Should do the Heavy Lifting, NOT HUMAN, ESPECIALLY NOT the ANALYSTS

13

#RSAC
How?

High Level Understanding of

#RSAC

the Enabling Technologies

#RSAC
Protocol Technologies

#RSAC
TAXII
 Stands for
 Trusted Automated eXchange of Indicator Information
 Threat Intelligence Exchange Agreements
 How messages are expressed and transported  Exchange Models
 Source-Subscriber / Hub & Spoke / Peer-to-Peer Models  Role Models
 Data Producers / Consumers  Service Models
17

#RSAC
Exchange Model

 Source-Subscriber Model
 Typical for Current Threat Intelligence (TI) Vendor / Customer Relationship Model
 Hub & Spoke Model

Subscriber Subscriber

 Suitable for used in Large Organizations

Spoke (Consumer &

 Various Contract Owners with TI Producer)

vendors and become a Spoke

(Consumer & Producer)

Hub

 Play Attention to Sharing Agreement

Spoke (Consumer only)

Source

Subscriber Subscriber

Spoke (Producer
only)
Spoke (Consumer
& Producer)

18

#RSAC
Role & Service Models

 Role Models

 Service Models

 Producer Only

 Discovery Service

 Consumer Only

 Collection Management Service

 Producer & Consumer  Inbox Service

 Poll Service

19

#RSAC
STIX
 Stands for
 Structured Threat Information eXpression
 Structured Way of Describing Cyber Threat
 Eight Main Constructs
20

#RSAC
STIX Eight Constructs

 Observable  What activity was observed
 Indicator  What should be looked for
 Incident  Where was it seen
 Tactics, Techniques & Procedures (TTP)  What does it do

 ExploitTarget  What weakness does it exploit
 Campaign  Why
 ThreatActor  Who
 Course of Action  Suggested Action

21

#RSAC
Profiles
 Contracts between Sharing Parties (Producers to Consumers)  Define In-Scope / Out-of-Scope
 Which Constructs / Elements Required
 More on This
22

#RSAC
Related Standards
 STIX's Observable Indicators leverage CybOX to precisely describe the details
 CybOX
 Cyber Observable eXpression  About 80 Objects
23

#RSAC
Which Fundamental Problems Were Solved
 TAXII  Solves Transport / Channel Problem
 No more secured emails, RSS, portal access to obtain intelligence
 STIX / CyBox  Solves Intelligence Format Problem
 No more free form text, or CSV
 No more copy and paste  No more extracting searchable terms from emails, or portal
 Precisely Describe
 Allow Machine Extraction without Human Interaction
24

#RSAC
Now What?
 Read the XML encoded intelligence manually?  Have a way to precisely describe and share intelligence between
parties
 Of course NOT  At the minimum
 Search for indicators like IPs / URLs  Add IPs / URLs to "Block" list
 Propagate intelligence across control layers
25

#RSAC
Platform Technologies

#RSAC
Feeds
 Compliant with Standards  Confirm Which Constructs are
Supported with Vendors  Standards Very Board By
Design
 Data Fields Mostly Not Required
 At least, Observable / Indicators
27

#RSAC
STIX Profile
 Without Profile  Feed Still Compliant, but Not As Rich
 Time Reference  Confidence Level
28

#RSAC
POC Platform

Threat Intelligence Feeds (FS-ISAC / Hailataxii)
Intel.

Threat Gateway (Soltra Edge)
Threat Gateway

Indicator Extractor (SPLICE)

Security Information & Event Management
(Splunk)
SIEM

FireWall

Host

Proxy

FireWall

Control Defenses

29

#RSAC
Platform

 Threat Intelligence Gateway
 Receive Threat Intelligence  Talk TAXII  Decompose STIX
 Indicator Extractor
 Extract Indicator of Compromise from STIX
 Search for Realized Threat against SIEM

 Security Information and Event Management (SIEM)
 Initiate Incident Response Upon Match
 Initiate First Response  Block IP/URL at perimeter
 Scripts
 Add Indicators to "Block" list

30

POC Platform

Feed 1
Atomic Intelligence

Threat Intelligence Feeds

Feed 2

Feed X Intel.

Intelligence Pool

Compound

Threat Gateway (Soltra Edge)

Intelligence

Threat Gateway

Indicator Extractor (SPLICE)

Security Information & Event Management
(Splunk)
SIEM

FireWall

Host

Proxy

FireWall

Control Defenses

31

#RSAC

#RSAC
Demo Screen
32

#RSAC
Apply

#RSAC
Summary
 Threat Intelligence Sharing Technologies are Maturing  Feed Readily Available (Hailataxii & FS-ISAC if member)  POC Platform can be Created with Minimum Cost  Automatic
 Detect Indicator for Realized Threat  Deploy Indicator to "Block" list
34

#RSAC
Apply
 Obtain Quality Vendor Feed  Deploy POC Platform  Create Automatic Mechanism
35

#RSAC
Reference & Tool
 Feed
 Hailataxii.com (Open Source)  FS-ISAC
 Soltra EDGE (www.soltra.com)  Splunk SA-Splice (splunkbase.splunk.com/app/2637)  Script to Extract All Atomic Indicators
36

