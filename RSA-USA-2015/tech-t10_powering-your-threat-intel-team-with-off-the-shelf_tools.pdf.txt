SESSION ID: TECH-T10
Powering Your Threat Intel Team with Off-the-Shelf Tools

Ryan Olson
Intelligence Director Palo Alto Networks
@ireo

#RSAC

/usr/bin/whoami
Mission: Analyze the data available to Palo Alto Networks to identify adversaries, their motivations and resources to better understand the threats our customers face.

#RSAC
CEO
CSO

#RSAC
What is Threat Intelligence?

"Evidence-based knowledge, including context, mechanisms, indicators, implications and actionable advice, about an existing or emerging menace or hazard to assets that can be used to inform decisions regarding the subject's response to that menace or hazard."
- Rob McMillan - Gartner

X 212.83.131.214 is Bad
 On May 6, 2014, 212.83.131.214
hosted a command and control server for the NetWire RAT on TCP port 3360 in association with an attack from Nigerian cyber criminals...

#RSAC

DATA

DATA

INTEL!

DATA

#RSAC
Which Tools?
 No Data Sinkholes
 Data that goes in, must come out.
 Extensible ­ Add our own functionality
 Without $$$ consulting bills...
 Active Community
 Easier to trouble-shoot  Faster feature development  Easier to find staff familiar with the tool chain.

Tools Visualization

#RSAC
Intel Repository & Work Bench

#RSAC
Why Visualize Data

#RSAC
Typical Data Points

#RSAC
20 Pages of Notes

#RSAC
Notes Visualized In Maltego

#RSAC
Notes Visualized in Maltego

#RSAC
Why Maltego?

#RSAC
Maltego Concepts: Entities and Links

Domain

IP Address Email Address

#RSAC
Maltego Concepts: Entities and Links

#RSAC
Maltego Concepts: Transforms

Domain

IP Address

Domain 2

Registered

Email Address

Reverse WhoIs

#RSAC
Maltego Demo

#RSAC
Maltego Concepts: Machines

#RSAC
Outside Data Sources

#RSAC
Connecting Your Own Data

#RSAC
Local VS Remote

Local Transforms

Remote Transforms

 Run from the local system

 Run from a Transform Distribution Server (TDS)

 Pros:  Quick to setup, prototype  Data is private

 Pros:  Very easy to share with others.  Single point of updates/configuration.

 Cons

 Ability to rate limit users.

 Difficult to distribute, all users need to have all require software
 Difficult to Update
 Fewer Settings

 Best for teams and services.
 Cons:  Data sent to public servers  Can be private (but expensive)

#RSAC
Libraries
 You could write pure XML...  Python
 PyMaltego  Basic Python Library (Paterva)  Canari
 Canari is by far the best option for local development.
 Abstracts all XML  Handles Entities  Creates distributable bundles  But...local system still needs software installed.

#RSAC
· Malware Related Entities + Transforms · Local execution · Built with Canari

#RSAC
Where's Your Intelligence Stored?

#RSAC
Collaborative Research Into Threats (CRITs)
24 | ©2015, Palo Alto Networks. Confidential and Proprietary.

#RSAC
Why CRITs?

Top Level Objects
 Actors  Campaigns  Certificates  Domains  Emails  Events  Indicators  IPs  PCAP  Raw Data  Samples  Targets
26 | ©2015, Palo Alto Networks. Confidential and Proprietary.

#RSAC
Concepts
 Bucket Lists  Campaign Attribution  Comments  Downloading  Email Targets  Favorites  Notifications  Objects  Relationships  Releasability  Screenshots  Sectors  Sources  Subscriptions

#RSAC
CRITs Dashboard

#RSAC
CRITs Menu

#RSAC
CRITs Object Details

#RSAC
CRITs Relationships

#RSAC
CRITs Data Parsing

CRITS Services
Automatically process, connect and expand inputs.

 Chopshop  TAXII

 Cuckoo

 UPX

 OpenDNS  Virustotal

 PassiveTotal  Yara

 Peinfo

 Whois

 SSDeep

32 | ©2015, Palo Alto Networks. Confidential and Proprietary.

#RSAC

Input

Services

Output

#RSAC
CRITs Services

#RSAC
Best for those who "Tinker"
 Too Much Clicking...  API allows you to automate
input.  Services allow common tasks
to be built into the platform.
34 | ©2015, Palo Alto Networks. Confidential and Proprietary.

#RSAC
API Use-Case: YARA Automation

Push Data to CRITS

Yara Signature
Hit

Query Wildfire Samples

35 | ©2015, Palo Alto Networks. Confidential and Proprietary.

#RSAC
Supported Structured Data Exchange Formats
TAXII Trusted Automated Exchange of
Indicator Information STIX
Structured Threat Information Expression CybOX
Cyber Observable Expression
36 | ©2015, Palo Alto Networks. Confidential and Proprietary.

#RSAC
MCRITs

#RSAC
Now What?
 Choose an incident and visualize it!
 Maltego Community Edition (Try)  Commercial Version (Buy)  https://www.paterva.com/web6/products/download.php
 Get out of spreadsheets and text documents!
 CRITs (Open Source)  https://github.com/crits/crits

#RSAC
Questions

