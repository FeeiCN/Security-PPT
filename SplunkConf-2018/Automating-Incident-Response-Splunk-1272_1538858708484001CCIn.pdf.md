© 2018 SPLUNK INC.
Automating Incident Response With Splunk Phantom
by Mark Cooke, General Electric
September 2018 | Version 3.0

$WHOAMI
Mark Cooke
 Staff Incident Responder at GE  Worked in IR for 4 years  Python hacker  Phantom playbook developer

© 2018 SPLUNK INC.

General Electric
Imagination at work

+300K

24/7

+300K

50

1

3

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Agenda
Highlights of today's discussion

Agenda
Overview
 Driving factors for automation  Preparing for automation  Implementing automation  Demonstrating automation

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Driving Factors for Automation and Orch.
Goals for automating IR

© 2018 SPLUNK INC.
Driving Factors for Auto & Orch.
Analysts should primarily analyze data, NOT collect and move data around

[CATEGOAR nalyst Time Y NAME] 10%

[CATEGOR Y NAME] 40%

[CATEGOR Y NAME] 40%

Automate

[CATEGOR Y NAME] 10%

Centralize

Enrich

Analyst Tim[CeATEGORY NAME] 10%

Guide

[CATEGORY NAME] 40%
[CATEGORY NAME] 10%

[CATEGORY NAME] 40%

© 2018 SPLUNK INC.
Preparing for Automation and Orch.
Designs and visions for automating IR

Design and Vision
Gathering and moving data

Required fields

Correlation search

Design Logic:  Consistent fields for automation  Focused searches  Manageable data set  Fewer searches to move data

Summary index

Phantom app

© 2018 SPLUNK INC.

Design and Vision
Dividing and segmenting data flows
Automated
 Select scripts run automatically  All decisions for triage, response and remediation are decided automatically

© 2018 SPLUNK INC.

Semi-Automated
 Select playbooks and actions run automatically  Analysts make triage, response and remediation decisions
Manual
 Steps and scripts are all completed manually  Analysts make triage, response and remediation decisions

Response Guidance
 Guide analysts through triage, response and remediation decisions
 Builds baseline for required actions
 Records incident data and actions

 Core detection
 Summarized index
 Forwarding to Phantom

Design and Vision
Putting it all together

Phantom

Alert Pipeline
 Enrich alert  Decide path

Alert
 Ownership  Triage  Analysis  Disposition

© 2018 SPLUNK INC.
Incident  Guided response
Incident Auto  Packaged response

© 2018 SPLUNK INC.
Implementing Automation and Orch.
Components for making this work

Playbook Development
Developing playbooks

© 2018 SPLUNK INC.

Playbook

Categories

Packaged responses

Actions

Playbooks

Playbook Highlights
6

© 2018 SPLUNK INC.

host_investigation [X VALUE]

[X VALUE]

proxy block, [X VALUE] [X VALUE]

[X VALUE]

5

Consistency

4
[X VALUE] [X VALUE] [X VALUE] 3

[X VALUE]

2
[X VALUE] 1

[X VALUE],

[X VALUE] [X VALUE]

0

0

2

4

6

8

10

12

14

16

Speed

© 2018 SPLUNK INC.
Demo
Automation and orchestration in action

© 2018 SPLUNK INC.
Demo ­ Alert Enrichment
Gathering and collecting data

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Demo ­ Alerting
Triaging our enriched alerts

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Demo ­ Response
Responding to the threat

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Incident Automation
Automating the response process

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Playbook Impacts
Accomplishments from implementing automation and orchestration

22
Hours
Ticket creator

Playbook Impacts
Estimated hours saved per month

© 2018 SPLUNK INC.

30
Hours
Network containment

30
Hours
Domain/IP blocks

32
Hours
Alert history and auto
categorization

© 2018 SPLUNK INC.
Conclusion

Conclusion
Implementing automation and orchestration

© 2018 SPLUNK INC.

Analyst Tim[CeATEGORY NAME] 10%

[CATEGORY NAME] 40%
[CATEGORY NAME] 10%

[CATEGORY NAME] 40%

By implementing automation and orchestration through Phantom we're aiming to:  Focus analysts time on analysis  Focus analysts time on finding threats  Reduce risk through speed and consistency

Thank You!
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

