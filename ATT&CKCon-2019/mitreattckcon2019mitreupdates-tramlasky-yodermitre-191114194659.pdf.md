| 1|

TRAM:
An Easier Way to Map to ATT&CK
Jackie Lasky
Sarah Yoder @sarah__yoder

@MITREattack
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-17.

#ATTACKcon
MITRE

| 2|
How Does Information Get into ATT&CK?

1. Find reliable open source reporting

2. Find behaviors in the report
- Think ATT&CK structure
 Tactic (Why)  Technique (How)  Procedure (What)

©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-17.

| 3|
Finding Behaviors in Finished Reporting

Defense Evasion | Obfuscated Files or Information(T1027)

Defense Evasion | Obfuscated Files or Information(T1027)
Discovery | File and Directory Discovery (T1083) Defense Evasion | Virtualization/Sandbox Evasion (T1497)

Defense Evasion | Execution Guardrails (T1480)

Impact | Data Encrypted for Impact (T1486)

Discovery | Process Discovery (T1057) | System Service Discovery (T1007)

https://usa.kaspersky.com/about/press-releases/2018_synack-doppelganging

©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-17.

| 4|
The Problem
 Too many reports, not enough
people! ­ ATT&CK is updated manually ­ Backlog of unanalyzed reports
 Human error
­ Potential for inaccurate information ­ Availability bias
 Training new team members
­ Analysis process is complex ­ Takes time to learn ATT&CK
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-17.

| 5|
Our Solution: Threat Report ATT&CK Mapper (TRAM)
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-17.

| 6|
TRAM Under the Hood
5
Test Data
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-17.

| 7|
Challenges
 Extracting meaning from text is hard  Handling prediction error
­ Noise in data ­ Anomalies ­ Differentiating between similar techniques
 Needing more data
­ Imbalanced datasets ­ Lots of false positives
 Creating a backup plan for techniques with no data
­ Regular expressions ­ String matching
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-17.

| 8|
TRAM "Demo"
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-17.

| 9|
TRAM "Demo"
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-17.

| 10 |
TRAM "Demo"
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-17.

| 11 |
TRAM "Demo"
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-17.

| 12 |
Why Does This Matter?
· Make it easier to get started with ATT&CK - We know mapping reports to ATT&CK can be overwhelming
· Find techniques we forget about or have never heard of - Remembering 266+ techniques is hard!
· Use reporting that is important to you - We try to stay up to date, but new information comes out faster than we can say ATT&CK
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-17.

| 13 |
Takeaways
· Understand adversary TTPs - ATT&CK helps frame these behaviors - You can then write detections, assess where your gaps are, track adversaries you care about, and emulate those adversaries
· Mapping data to ATT&CK is hard · TRAM hopes to make that easier
- NLP + SQL + regex + ATT&CK =  - Available to the community soon!
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-17.

Jackie Lasky

| 14 |
Sarah Yoder @sarah__yoder

attack@mitre.org @MITREattack #ATTACKcon
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-17.

