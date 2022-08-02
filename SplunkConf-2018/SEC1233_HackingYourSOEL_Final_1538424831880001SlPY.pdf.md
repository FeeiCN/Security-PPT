Hacking your SOEL
SOC Automation and Orchestration
Rob Gresham | Security Solutions Architect
October 2018

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Agenda
 SOAR History and the Future  What is SOEL  SOAR Loser?  Hacking your SOEL  Q&A

© 2018 SPLUNK INC.

Our Speakers

© 2018 SPLUNK INC.

ROB GRESHAM
Security Solutions Architect

 Paul Davis
 Hacker of your SOEL

© 2018 SPLUNK INC.

Key Takeaways

1. Understand SOEL and SOAR
2. Understand SOEL impacts and
difference to SOAR development
3. How to use SOEL to ensure your
SOAR is effective

© 2018 SPLUNK INC.
Back to the Future of Security Operations

Business Fusion Center

Nerve center for Risk Management

Cyber Operations Center

Integration of SOC and IT Operations

Security Operations

Formation of security monitoring process

Enterprise Operations

Application and Security products monitored

Network Operations

Monitoring of key services

Security Operations Problems

© 2018 SPLUNK INC.

Resource shortage of 1 million security professionals

Endless assembly line of point products

Escalating volume of security alerts

Static independent controls with no orchestration

Speed of detection, triage, & response time must improve

Costs continue to increase

© 2018 SPLUNK INC.

6 Million Dollar SOC...

© 2018 SPLUNK INC.

Observe
Point Products
FIREWALL IDS / IPS ENDPOINT WAF ADVANCED MALWARE FORENSICS MALWARE DETONATION

Orient
Analytics

Decision Making
Context

SIEM THREAT INTEL PLATFORM HADOOP GRC

TIER 1 TIER 2 TIER 3

Acting
Doing something
FIREWALL IDS / IPS ENDPOINT WAF ADVANCED MALWARE FORENSICS MALWARE DETONATION

© 2018 SPLUNK INC.
What is SOEL?
Security Operations Event Lifecycle

© 2018 SPLUNK INC.
Traditional Security Operation Actions

Security Operations
Events Lifecycle
Every SOC process has them

INGESTION OR ALERTING

EXTERNAL VALIDATION

INTERNAL HUNTING

MONITORING

CHANGE

RUN JOBS

NOTIFICATIONS

TIME & COMMUNICATION = IMPACT & $$$

© 2018 SPLUNK INC.

Manage Impact

with Response

The SOC's #1 Purpose

Ingest

External Context

Internal Context

Run Job Respond Monitor

© 2018 SPLUNK INC.

INGESTION OR ALERTING

EXTERNAL VALIDATION

INTERNAL HUNTING

Threat Intel SIEM events Phone calls

VirusTotal OpenDNS iSight

Logs Endpoint search

CHANGE / MONITORING

RUN JOBS

Firewall Rules IDS Signatures Endpoint Alerts Proxy Blocks

Malware Analysis Forensics

NOTIFICATIONS
Ticketing Reports

Poll Push

Look Up

Hunt

Set

Analyze

Block/Quarantine Get...

Send Receive

Events

Context

Artifacts

Artifacts

Artifacts

Measure

Artifacts Actions

© 2018 SPLUNK INC.
Are You a SOAR Loser?
What is SOAR and why I am I missing out? It's only for the big companies with lots of well
documented responses...

Don't be a SOAR Loser!
Example of a industry-leading SOAR platform

© 2018 SPLUNK INC.

SOAR = Security Orchestration, Automation, and Response
 Security Orchestration is making music  Security Automation is a bread maker  Security Response is the life blood of the SOC to reduce Risk Impact  Hack your SOEL to get your SOAR on!

Are You the Next Beethoven?

© 2018 SPLUNK INC.

Conduct your team, processes and tools together
 Work smarter by automating repetitive tasks and focus on more mission-critical tasks
 Respond faster and reduce dwell times with automated integration, investigation, and response
 Strengthen defenses by integrating existing security infrastructure

© 2018 SPLUNK INC.
Hacking your SOEL
Discovering your SOEL to help modernize your SOC

How to Hack your SOEL
Discover

© 2018 SPLUNK INC.

Transform Measure

Learn

0
Automate

Monitor Respond

Use Case and Playbook Processing

© 2018 SPLUNK INC.

MACHINE
Use cases engineered are usually analytically consistent and not instinctive
Generally significantly faster and effective when the analysis focused on logical decision with minimal bias

HUMAN
Visual and instinctive involving a level of experience and process learning
Generally, not efficient, however highly effective, but prone to cognitive bias

© 2018 SPLUNK INC.

Playbook Methodology
Develop compact playbooks that quickly perform common
independent functions
EXAMPLE UTILITY PLAYBOOKS
 Ingest alert  Create ticket  Collect evidence  Notify IR team  Investigate evidence  Scope event  Contain asset  Create ticket

INTERACTION
Owner, Actioner, Supporter, Consulted, Involved/Informed (OASCI) between teams, technology, or events

INPUT
Source(s) Event, Process, Information expected

ACTION
The transformation, duties, actions to be performed by a person, tool,
analysis or correlation to a function

ARTIFACTS
The expected output of actions performed by the
process or function

Some source from Chris Crowley, SANS MGT 517, Managing Security Operations

Use Case Overview

Security Analyst Use Cases

Privileged user monitoring

Botnet Detection

Identify Patient-Zero

Vulnerability Management Posture

Detecting Zero Day Attacks

Threat Intelligence Correlation

Detect and Stop Data User Account Sharing Exfiltration

Phishing Attacks

Incident Investigation across team's

SQL Injections

Dynamic Risk and Pattern Management

Fraud detection in EPayment
Fraud detection Online Banking
Fraud detection in proper service usage
Defense in depth investigations
Give team's the visibility they need
Monitoring of expired user accounts

Unauthorized Service Monitoring Update Monitoring
Website defacement
Spam to external

Hunter Use Cases
On Demand APT Scanning

SSL certificate analytics

User Agent String analytics

CISO Use Cases In the news!

Information Driven Security

Compliance reporting

Centralized Situational Awareness

© 2018 SPLUNK INC.

Use Case Addiction

© 2018 SPLUNK INC.

Don't be addicted to use cases, be addicted process adoption

Attack Vectors
Attack Vectors  Network  Host  Unknown  Attrition  Web  Email  External  Spoofing  Improper Usage  Theft/Lost  Other

verses

© 2018 SPLUNK INC.
Incident Categories

CATEGORY DESCRIPTION

0

Training and Exercises

1

Root Level Intrusion

2

User Level Intrusion

3

Unsuccessful Activity Attempt

4

Denial of Service

5

Non-Compliance Activity

6

Reconnaissance

7

Malicious Logic

8

Investigating

9

Explained Anomaly

EVENT TYPE
Event/Incident Incident Incident Event Incident Event/Incident Event/Incident Incident Event Event

© 2018 SPLUNK INC.
(Re)Defining Incident Response Playbooks

CATEGORY DESCRIPTION

9

Training and Exercises

8

Root Level Intrusion

7

User Level Intrusion

6

Unsuccessful Activity Attempt

5

Denial of Service

4

Non-Compliance Activity

3

Reconnaissance

2

Malicious Logic

1

Investigating

0

Explained Anomaly

EVENT TYPE
Event/Incident Incident Incident Event Incident Event/Incident Event/Incident Incident Event Event

INCIDENT RESPONSE PLANS
Host (Breach?) Host, Unknown, Account
Network, Spoofing, Attrition Theft/Loss, Improper Usage, Account Network (Internal) Host, Email, Web, External

Hacking your SOEL

Suspicious Email
REVIEW EMAIL
REMOVE EMAIL

REVIEW BODY AND HEADER INFO
QUERY RECIPIENTS
HUNT FILE
HUNT URL
FILE / URL REPUTATION
FILE ASSESSMENT

© 2018 SPLUNK INC.

Hacking your SOEL

Email
INGEST EMAIL PARSE FILES, URLS,
EMAIL HEADERS
REMOVE EMAIL

FILE / URL REPUTATION DETONATE UNKNOWN URL / FILE
HUNT FILE
HUNT URL
TASK ANALYST
PHISH / HOST ASSESSMENT

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

INGEST

INVESTIGATE

POLL PUSH INGEST SET STATUS SET SEVERITY CREATE ARTIFACTS SAVE OBJECTS SET TAGS

FILE ANALYSIS DOMAIN ANALYSIS URL ANALYSIS HOST ANALYSIS IP ANALYSIS LOGON ANALYSIS RUN QUERY GET EVENTS

CONTAIN
DISABLE USER BLOCK HASH BLOCK URL BLOCK DOMAIN BLOCK IP QUARANTINE HOST BLOCK PROCESS DISABLE VPN

NOTIFY
EMAIL SOC EMAIL LEADERSHIP CHAT IT HELP DESK EMAIL ENGINEERING PROMPT SOC TASK SOC

"Customer Success is our commitment and your content"

DOCUMENT
CREATE TICKET UPDATE TICKET CLOSE TICKET TRANSFER TICKET QUERY TICKETS CREATE ARTIFACTS CLOSE OBJECTS

A Tale of Two Companies
Value Proposition

© 2018 SPLUNK INC.
Same Use Case Different Results

Company 1
Seven months of development and they have 9 playbooks.
20 Events a day automated

Company 2
Four weeks of development and we have 9 playbooks.
Over 200 Events a day automated

File Analysis Playbook
Process hacking ­ which one is first?
 INPUT: Receive a hash and/or file  ACTIONS:
 INTERACTIONS:
 ARTIFACTS: · P1: · P2: · P3:

© 2018 SPLUNK INC.

File Analysis Playbook
Define the Artifacts for Decide and Act!

 INPUT: Receive a hash and/or file

 ACTIONS:

 INTERACTIONS:

© 2018 SPLUNK INC.

 ARTIFACTS: · P1: Analyze, Prompt, Block Known malware (Block now) · P2: Analyze, Sandbox, (De)Escalate (Prompt, Review) · P3: Cache Results, Display Report (Required Manual Analysis)

File Analysis Playbook
Build a utility playbook for file analysis

 INPUT: Receive a hash and/or file

 ACTIONS:

© 2018 SPLUNK INC.

 INTERACTIONS:
VirusTotal, ThreatConnect, CarbonBlack, Falcon Sandbox, Analyst, SMTP, CB Response, Palo Alto, Zscaler, ThreatCrowd
 ARTIFACTS: · P1: Analyze, Prompt, Block Known malware · P2: Analyze, Sandbox, (De)Escalate · P3: Cache Results, Display Report, Manual Analysis

File Analysis Playbook
Build a utility playbook for file analysis

 INPUT: Receive a hash and/or file

 ACTIONS:

 INTERACTIONS:
VirusTotal, ThreatConnect, CarbonBlack, Falcon Sandbox, Analyst, SMTP, CB Response, Palo Alto, Zscaler, ThreatCrowd
 ARTIFACTS:
· P1: Analyze, Prompt, Block Known malware · P2: Analyze, Sandbox, (De)Escalate · P3: Cache Results, Display Report, Manual
Analysis

© 2018 SPLUNK INC.
Block file File Rep w/ rate limit Block IP Block Domain Block URL URL Rep Domain Rep Get File Detonate File Prompt Analyst Change Severity Change Sensitivity Send Email Quarantine Host

File Analysis Playbook

Build a utility playbook for file analysis

 INPUT: Receive a hash and/or file

 ACTIONS:

 INTERACTIONS:
VirusTotal, ThreatConnect, CarbonBlack, Falcon Sandbox, Analyst, SMTP, CB Response, Palo Alto, Zscaler, ThreatCrowd
 ARTIFACTS:
· P1: Analyze, Prompt, Block Known
malware
· P2: Analyze, Sandbox, (De)Escalate
· P3: Cache Results, Display Report,
Manual Analysis

Block file File Rep w/ rate limit Block IP Block Domain Block URL URL Rep Domain Rep Get File Detonate File Prompt Analyst Change Severity Change Sensitivity Send Email Quarantine Host

© 2018 SPLUNK INC.
Get Approval Hunt file Hunt URL Promote Case Cache Hash Store File Analyze File Task Forensics Block Process Get customer info Get system info Check white/black lists Get BU info Run query Lookup info (Threat Intel)

File Analysis Playbook
Build a utility playbook for file analysis

 INPUT: Receive a hash and/or file

 ACTIONS:

 INTERACTIONS:
VirusTotal, ThreatConnect, CarbonBlack, Falcon Sandbox, Analyst, SMTP, CB Response, Palo Alto, Zscaler, ThreatCrowd
 ARTIFACTS:
· P1: Analyze, Prompt, Block Known
malware
· P2: Analyze, Sandbox, (De)Escalate
· P3: Cache Results, Display Report,
Manual Analysis

Block file File Rep w/ rate limit Block IP Block Domain Block URL URL Rep Domain Rep Get File Detonate File Prompt Analyst Change Severity Change Sensitivity Send Email Quarantine Host

© 2018 SPLUNK INC.
Get Approval Hunt file Hunt URL Promote Case Cache Hash Store File Analyze File Task Forensics Block Process Get customer info Get system info Check white/black lists Get BU info Run query Lookup info (Threat Intel)

© 2018 SPLUNK INC.

File Analysis Playbook

Build a utility playbook for file analysis

 INPUT: Receive a hash and/or file  INTERACTIONS:
VirusTotal, ThreatConnect, CarbonBlack, Falcon Sandbox, Analyst, SMTP, CB Response, Palo Alto, Zscaler, ThreatCrowd
 ARTIFACTS: · P1: Analyze, Prompt, Block Known malware · P2: Analyze, Sandbox, (De)Escalate · P3: Cache Results, Display Report, Manual
Analysis
Ingest 2 Investigate 3 Contain 4 Notify 5 Record 6 Utility

 ACTIONS:
3 Block file 2 File Rep w/ rate limit 3 Block IP 3 Block Domain 3 Block URL 2 URL Rep 2 Domain Rep
Get File 2 Detonate File 4 Prompt Analyst
Change Severity Change Sensitivity 4 Send Email 3 Quarantine Host 5 Create ticket

4 Get Approval 2 Hunt file 2 Hunt URL 2 Promote Case 2 Cache Hash
Store File 2 Analyze File 2 Task Forensics 3 Block Process
Get customer info Get system info 2 Check white/black lists Get BU info Run query 2 Lookup info (Threat Intel)

Whiteboard Exercise
The faster hack and don't you just love "Office Lens"?

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Key Takeaways
Can you afford not to SOAR with your SOEL?

1. Understand SOEL and SOAR
2. Understand SOEL impacts and
difference to SOAR
3. How to use SOEL to ensure your SOAR
is effective

© 2018 SPLUNK INC.
Q&A
Rob Gresham | SOEL Hacker Paul Davis | Director of Success Chaos

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

