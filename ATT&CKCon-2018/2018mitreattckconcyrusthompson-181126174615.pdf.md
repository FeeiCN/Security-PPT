Oct 23, 2018

ATT&CK: All the Things

USAA's journey into integrating ATT&CK into Tools, Techniques, and <tacos>

Neelsen Cyrus @neelsen

David Thompson @dirty_tizzle

Public Information

>id @neelsen
 Various operational roles at USAA since 1997
 WebSphere farm support for external and internal web applications  Configuration Management Database  Cyber Threat Operations Center (CTOC)
 Dual hats in the (CTOC)
 Usually behind the scenes and not on stage with real people watching me

Public Information

2

> id @dirty_tizzle
 6.5 years Air Force Captain doing Vuln Assessments for AF BT and ~2 years at NSA
 Pen Tester for JHU APL working Space Systems and other DoD Projects
 Pen Tester for AF BT (Contractor) working Space Systems, Aircraft and other weapon systems
 Was a Red Team Member, New Detections Lead (Blue Team), and as of 15 Oct, I am now the Manager Leading our Incident Response Team

Public Information

3

Outline
 "Pre-" ATT&CK Work  Integrating ATT&CK into our Ecosystem  Way Ahead  Questions

Public Information

4

"Pre-"ATT&CK Work

Public Information

5

Why We Chose ATT&CK
 Old Method ­ Kill Chain
 50,000 FT view of threat behavior
 New Method ­ ATT&CK
 Threat behavior that is operationally relevant & actionable
 Threat Actor Group Data
 Tactics & Techniques of past Intrusion Sets  Cataloging Threat Actor Capabilities w/ ATT&CK
 Meaningful
 Proactive vs Reactive in Identifying and Prioritizing Gaps

Public Information

6

Why We Chose ATT&CK (cont'd)
USE CASES:  Gap Analysis with Current Defenses  Prioritize detection/mitigation  Information Sharing  Track a specific adversaries set of techniques  Adversary Emulation  New technologies, research

Public Information

7

Self-Assessment

Public Information

8

Detection Tagging Train
 We started pushing new detections ideas into GIT about a year ago
 Labels For The win (FTW)!
 GIT API Calls based off of ATT&CK Labels to feed our Flask app FTW!

Public Information

9

Integrating ATT&CK into our Ecosystem

Public Information

10

USAA's ATT&CK Visualization tool
 Custom Tool ­ Based off of Navigator
 Python Flask App  Updates MITRE data
via API  Correlating tags with respective techniques
 Detection test/prod  Hunt  Intel  Adversary Capabilities

Public Information

11

Case Enrichment with ATT&CK
Enriching cases with ATT&CK

Ongoing: Incorporating ATT&CK tags into intel indicators

Public Information

12

Way Ahead

Public Information

13

Ecosystem
AST
(Simulation)

Reports

PAX
(Suppress)

MIST
(All)
SHP
(Mgmt Rpts)
GWH
(Hunt)

ATT&CK

Event Mgmt & Alerting

Case Mgmt

Intel Provider
Public Information

DMR
(Blue)

DSP
(Intel)

Dashboards

CI/CD

VCS/ Issues

SLACK 14

DMR ­ Detection Management Reporting
 Prioritization
Inputs from Intel/Hunt
 Self contained
Various components are stored/versioned together
 Development Pipeline
Idea to Implementation (and beyond)
 Primary data source
Source of record for other tools

Public Information

15

DSP ­ Defense Security Posture

 Detection ideas
Feed DMR
 Prioritization
Risk determines detection's priority in DMR
 Categorization
ATT&CK tactics/techniques applied

Public Information

16

GWH ­ Good ... Hunting tool

 Detection ideas and feedback
Feed DMR Provide more insight for better
detection creation
 Recurring hunts
Constraints limit some detections

Public Information

17

PAX ­ Suppression Engine
 Provide quick queue relief
Silence noisy/false positive cases until detection can be updated
 Multi-purpose
Works at both the Event Alerting and Case Management level

Public Information

18

AST ­ A Simulation Tool
 Canaries
Test plumbing end to end Early warning that detections
are not working as designed
 POC Execution
Assists with detection development

Public Information

19

MIST ­ Malicious Intel Search Tool

 Tagged indicators of compromise
 Regressive search
 Multiple queues
 Triage ­ determining if IOC worth tracking
 Intel ­ IOCs being tracked  IR ­ IOCs identified during an incident
 Matching events tagged and copied to a dedicated index
 Longer retention

Public Information

20

SHP ­ Secure Hub Portal

 Management view
 Metrics
 Reports
 Gaps  Detections on hold because of
infrastructure/manpower/etc  Successes  ATT&CK tactics/techniques that
gained more coverage
 View into rest of tools
 How many new detections deployed

Public Information

21

TBD ­ Gory Details and the Future

 Python FTW

 Built on the great work in the community

Ideas

Open source projects

Reports
 Hope to give back

Because we have used and

ATT& CK

learned so much

Slow to change, but trying...

AST (Simulat
ion)
PAX (Suppre
ss)

Event Mgmt & Alerting

Case Mgmt

MIST (Search
)
SHP (Mgmt Rpts)
GWH (Hunt)
Intel Provid
er

DMR (Blue)

DSP (Intel)

ANSIB LE
CI/CD

VCS/ Issues

Dashboards
SLA CK

Public Information

22

Gracias!
Thank you for your time!
Questions?
Any Questions?

Public Information

23

Public Information

