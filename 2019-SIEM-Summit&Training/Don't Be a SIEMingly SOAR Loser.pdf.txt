Don't be a SIEMingly SOAR Loser...
@SOCologize
Rob Gresham
October 8, 2019

Abstract
What's in it for me?
Why Security Orchestration Automation and Response? To integrate or to not? ROI, the mystery to SOAR metrics Case management, Service Catalogs or Digital workflows, Oh My? How do I start to get my SOC to SOAR? What do you use for best practices, or what is everyone else using?

A barrier of excellence was the reported absence of skilled staff
at 58%
50%

2019 SANS SOC Survey
Absence of SOAR
Absence of Effective Automation & Orchestration was 50% Tools not integrated at 43% Lack of Management Support at 37% Lack of processes or playbooks at 37%

ATAR Labs, Ayehu, Cyberbit, CyberSponse, D3 Security, Demisto, DFLabs, EclecticIQ, IBM, Splunk, Rapid7, Resolve, ServiceNow, Siemplify, Swimlane, Syncurity, ThreatConnect, and ThreatQuotient.
Courtesy of Gartner Market Guides: https://www.gartner.com/en/research/methodologies/mark et-guide

Incoming Events Playbooks Run Actions Run

Hours Saved

Dollars Saved

FTE Gained

https://digitalguardian.com/blog/cyber-security-salary-guide-what-does-todays-cyber-security-workforce-make
Cyber Security Salary Guide:
What Does Today's Cyber Security Workforce Make?

Apr May Jun Jul Aug Sep Oct Nov Dec Jan Feb Mar Apr May Jun Jul Aug Sep

Calculating SOAR ROI

Do you know when your investment breaks even?

1200000

SOAR ROI for 9 playbooks over time

1000000

800000

600000

400000

200000

0

TCO

2018 Earned Value (15m)

2019 Earned Value (30m)

Investment breaks even in 8 months with only 9 playbooks.
This customer had ~556 events a day
Average customer builds approximately 15-40 playbooks

$ 612,964.12

Meh-trics anyone?
SOAR ROI done right...

Mean Build Time

Mean Time to Production

Technology / Human Cost

ROI Value

20 Days
4 Integrations and 9 Playbooks

3 Months
9 Playbooks 585 Events a day

$851,725 to date
$7701 Support, License, Maintenance

Break even on Feb 23, 2019 at
$612,964.12

Integrations
Which integration is best for our team?
Case Management Processing

Headless Operation

Operations Fractal
People, Process and Technology

Discover

Transform

Monitor

Learn

Measure

Automate

Respond

Meh-trics
Just the basics, Start Macro move to Micro

Mean Time to Detect

Mean Time To Respond

Mean Time To Contain

Mean Time To Recovery

Mean Time To Close

Measure:
Time to Alert Analyst
(New Event/Alert)

Measure:
Time for Analyst to Pickup
(New to Open Status)

Measure:
Time for Analyst to Contain
(Time to Task Contain)

Measure:
Re-image validation

Measure:
Closing Dispositions

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

https://www.youtube.com/watch?v=_mnxZ1iSUGg

WHAT IS SOEL?
Security Operations Events Lifecycle

Traditional Security Operation Actions

INGESTION OR ALERTING

EXTERNAL VALIDATION

INTERNAL HUNTING

CHANGE / MONITORING

RUN JOBS

NOTIFICATIONS

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

Playbook Methodology
Compact playbooks that quickly perform common independent functions

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

Phishing Use Case Analysis

Build a utility playbooks to complete the process

INPUT: Receive a hash and/or file

ACTIONS:

INTERACTIONS: VirusTotal, ThreatConnect, CarbonBlack, Falcon Sandbox, Analyst, SMTP, CB Response, Palo Alto, Zscaler, ThreatCrowd ARTIFACTS:
P1: Analyze, Prompt, Block Known malware P2: Analyze, Sandbox, (De)Escalate P3: Cache Results, Display Report, Manual Analysis

Block file File Rep w/ rate limit Block IP Block Domain Block URL URL Rep Domain Rep Get File Detonate File Prompt Analyst Change Severity Change Sensitivity Send Email Quarantine Host

Get Approval Hunt file Hunt URL Promote Case Cache Hash Store File Analyze File Task Forensics Block Process Get customer info Get system info Check white/black lists Get BU info Run query Lookup info (Threat Intel)

1 Prepare 4 Eradicate

Phishing Use Case Analysis

2 Investigate 5 Recovery 3 Contain 6 Lessons Learn

Build a utility playbooks to complete the process

INPUT: Receive and email with a url or file

ACTIONS:

3 Block file

4 Get Approval

INTERACTIONS: VirusTotal, ThreatConnect, CarbonBlack, Falcon Sandbox, Analyst, SMTP, Splunk, CB Response, Palo Alto, Zscaler, ThreatCrowd

2 File Rep 3 Block IP 3 Block Domain 3 Block URL 2 URL Rep

2 Hunt file 2 Hunt URL 2 Promote Case 2 Analyze File 4 Task Forensics

2 Domain Rep

3 Block Process

ARTIFACTS:

2 Detonate File

1 Get customer info

P1: Analyze, Block Known malware,

2 Prompt Analyst

1 Get system info

Remove Email, Prompt

2 Change Severity

4 Check white/black lists

P2: Analyze, Sandbox, (De)Escalate

1 Change Sensitivity

4 Create Ticket (delete email)

P3: Cache Results, Display Report, Manual 5 Send Email

1 Get BU info

Analysis

3 Quarantine Host

2 Run query (other emails)

4 Create Ticket (re-image) 2 Lookup info (Threat Intel)

6 5 2 Add Note/Comment

Summary answers
Automation should be metrics driven
SOAR should be helping drive your successful business metrics Look to solutions integrate between solutions & integrate your processes Your ROI should calculate the business value and Case management (human augmentation) and integrated digital workflows for the whole Get started on the simple task ­ Death by a thousand cuts Use methodologies that work for your team, we use the Operations fractal, SOEL and I2A2

Next Steps
Is your organization up to it?
Train Automate Integrate Process Observe Support

© 2019 SPLUNK INC.
Thank You

