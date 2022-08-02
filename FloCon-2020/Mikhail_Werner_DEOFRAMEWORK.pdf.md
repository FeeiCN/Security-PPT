A Practical Decision Framework for Implementing Evasion-Resilient HostBased Analytics
Dr. Joe Mikhail Brandon Werner The MITRE Corporation
FloCon2020: January 2020
© 2019 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited, Case Number 19-3685 .

|2|
Overview
 Research Questions
1. Can a framework be developed for non-data scientists to determine whether a given adversary technique is best detected with a heuristic analytic or a machine learning (ML) analytic?
A. Where can I find good host-based ML data?
 Definitions
­ Heuristic Analytic: Analytic that uses rules, estimates or educated guesses to find a satisfactory solution to a specific issue.
 Not guaranteed to be optimal, perfect or rational, but sufficient for reaching an immediate,
short-term goal
­ ML Analytic: ML analytics discover patterns in data, and construct mathematical models using these discoveries
 Example: Neural network to detect malicious powershell
© 2019 The MITRE Corporation. All rights reserved.

|3|
Data-Evasion-Organization (DEO) Framework

 The proposed framework is comprised of a set of weighted criteria to evaluate data,
evasion, and organizational factors in order to provide an analytic recommendation based on the DEO Score.

­ Data: How well the data supports the analytic.

­ Evasion: How versatile the analytic needs to be.

­ Organization: How well the organization supports analytic development.
 Weighting was assigned by applying framework to multiple use cases -> trial and error.

Given categorical weights for data, evasion, and organization:

Data

 = 1,  = 1.5,  = 1,

And scoring for each category: , , 

Evasion

DEO Score

For the weighted total:  =  +  + 

Organization
© 2019 The MITRE Corporation. All rights reserved.

The final DEO score,  =  +  + 
Output: 0<<2.5: Heuristic 2.5<<5: ML Model

|4|
Data-Evasion-Organization (DEO) Framework

Use-case name
Data, ATT&CK ID, Org
Category scoring (0-5)
Final score  (0-5): 0<<2.5: Heuristic 2.5<<5: ML Model
© 2019 The MITRE Corporation. All rights reserved.

Directions/Overview of tool
Category "Ratings" Final Recommendation

|5|
Data Scoring Factors

Data Source Name: Data Source Name

Criteria# Criteria

Description

Weight

S

Data Quantity

Score the quantity of raw data is produced by the data

D.1

source(s). 0=Small Quantity 5=Large Quantity

1

Score the data source(s) availability. Are there gaps in

Data Availability

the data feed? Are there missing values in the data?

D.2

Unavailable=0 Available=5

1

Score the data source(s) diversity. Does it capture a

Data Diversity

single type of event or a wide range of events? Does it contain both background noise and malicious events?

D.3

0=Not diverse 5=Diverse

2

Score the data granularity level. Does it contain high

Data Granularity Level

level data such as windows event logs or low level data such as hardware register data?

D.4

0=High Level 5=Low level

3

Score the quantity of events in the dataset that are

ATT&CK Data

generated for the targeted ATT&CK technique.

D.5

0=Small Quantity 5=Large Quantity

3

Score the percentage of data that is collected from

Legacy systems

legacy appliances/systems.

1

D.6

0=All Legacy 5=No Legacy

Score the maturity of existing data matching

D.7 Data Matching

capabilities. 0=Low Maturity 5=High Maturity

1

Score the level of effort required to transform raw

Numerical data

data sets into numerical features.

D.8

0=High Effort 5=Low Effort

2

Are there sufficient resources to store the required

Data Storage

quantity of data for ML processing?

D.9

Insufficient Resources=0 Sufficient Resources=5

1

Score the percentage of labeled data.

D.10 Labeled Data

0=No Labels 5=All Labeled

2

© 2019 The MITRE Corporation. All rights reserved.

|6|
Evasion Scoring Factors

ATT&CK Technique ID: Technique Name

Criteria # Criteria

Description

Weight

S

Score the different number of ways that the ATT&CK

E.1 Technique Versatility

technique be executed.

0=Single way 5=Multiple Ways

2

E.2 Code Signing

Does the technique rely on using a signed executable

or file? 0=Yes 5=No

1

E.3 Obfuscation

Score the susceptibility of the ATT&CK technique to obfuscation. 0=Not Susceptible 5=Highly Susceptible

2

Score the susceptibility of the ATT&CK technique to

E.4 Modification

modification for signature evasion.

0=Not Susceptible 5=Highly Susceptible

2

Score the susceptibility of the ATT&CK technique to a

E.5 Zero-Days

zero-day attack.

0=Not Susceptible 5=Highly Susceptible

1

Is the technique executed via a malware file or a living

E.6 File vs Fileless

off of the land technique?

0=CMD Line 2.5 Script

5=Compiled Malware

1

© 2019 The MITRE Corporation. All rights reserved.

|7|
Organization Scoring Factors

Organization Name: Org Name

Criteria # Criteria O.1 Skillset O.2 Previous experience O.3 Executive level support O.4 Classification / Sensitivity O.5 Zero-Day Threats O.6 Security Architecture O.7 Funding O.8 Timeframe O.9 Signature Updates
O.10 Patching Updates

Description

Score the organization's in-house and outsourced ML skillsets.

0=Novice

5=Expert

Has the organization previously implemented advanced

analytics or ML?

0=Never implemented

5=Several implementations

Score the organization's leadership support for ML.

0=No support 5=Full support

Are some of the networks within the organization classified or

sensitive, requiring additional effort for data ingest and

processing?

0=Many networks 5=No networks

Score the quantity of zero-day threats that the organization

faces.

0=No zero-days

5=Many zero-days

Is the organization's security architecture simplified and

organized in a cohesive manner?

0=Unorganized

5=Organized

Is there sufficient funding to invest in analytic development?

0=No Funding 5=Sufficient Funding

What is the timeframe to work with to deploy a given analytic?

0=Short-term(Hours/Days)

5=Long-Term(Months/Years)

How often are the SOC's signature-based detection capabilities

updated with new signatures?

0=At least once a week 5=Annually How often are the organization's network devices and endpoints updated with software patches? 0=At least once a week 5=Annually

Weight 2
2 1
1 1
2 2 1
1
1

© 2019 The MITRE Corporation. All rights reserved.

|8|
procmonML: The search for ML-friendly host-based data
 procmonML is a [prototype] tool that generates & utilizes labeled host-based process data in a
condensed ML-ready format to detect malicious host-based behavior. ­ Objective 1: Limit data volume while retaining important information ­ Objective 2: Avoid need for computationally expensive ML models ­ Objective 3: Generate labeled data based on individual ATT&CK techniques
 Components
­ Host-based sensor (c# or powershell) ­ Machine Learning training/testing tool (scikit-learn).
 Skope-Rules to generate Splunk analytics
https://github.com/scikit-learn-contrib/skope-rules
Why ML for host-based detection? 1. Many heuristic analytics rely on string matching ­ Easily evaded. 2. ML analytics increase the adversary workload needed to evade analytics.
© 2019 The MITRE Corporation. All rights reserved.

|9|
Pyramid of Pain: Heuristic vs. Behavioral Analytics

Behaviors

Behavioral analytics/ procmonML

An analytic is only as good as its weakest input field:
index=__your_sysmon_index__ EventCode=11 TargetFilename="*lsass*.dmp" Image="C:\\Windows\\*\\taskmgr.exe"

Heuristics: Current State for many analytics
Heuristic: not guaranteed to be optimal, perfect or rational, but sufficient for reaching an immediate, short-term goal.
© 2019 The MITRE Corporation. All rights reserved.

procmonML Data Organization

| 10 |
No PII!

The Big Tradeoff: Feature Processing vs. Event Consumption
© 2019 The MITRE Corporation. All rights reserved.

| 11 |
procmonML Data Sources Investigated

 Windows ETW:

 Sysmon:

­ Threads, Processes, Registry, Module Loads, Network ­ Timeseries data: Sequential events ­ Timeseries data: Module Load Sizes, Registry Depth

­ Event 1 (Process), Event 3 (Network), Event 5 (Process), Event 7 (Module Loads), Event 8 (Remote Thread), Event 9 (Raw Disk Access), Event10 (Lsass Access), Event 11 (File Created) - SwiftOnSec, Event 12-14 Registry ­ SwiftOnSec, Event 15 (FileCreateStream), Event 17/18 ­ Pipe Connect, Event 22 (DNS) ­ SwiftOnSec

­ Timeseries data: Module Load Sizes, Registry Depth

© 2019 The MITRE Corporation. All rights reserved. Release Statement: Approved for Public Release.

| 12 |
procmonML Experimental Setup
© 2019 The MITRE Corporation. All rights reserved.

| 13 |
procmonML: T1117 Regsvr32 Training
Background process monitoring data Model Supervised Training
Regsvr32 attack process monitoring data
© 2019 The MITRE Corporation. All rights reserved.

| 14 |
Behavioral vs Heuristic Analytics

· T1117/Regsvr32

T1117 Random Forest: Top 10 Important Features

· Heuristic: index=__your_sysmon_data__ EventCode=1 regsvr32.exe | search ParentImage="*regsvr32.exe" AND Image!="*regsvr32.exe*"

· Behavior: ImageLoadCAbove_ts > 15.5 AND ImageLoadCBelow_ts > 55.5 AND pChildCount > 0.5 AND pEventCount <= 90.5 AND pTotalTime <= 19.0

· Generated from Skope-Rules

· T1003/Lsass Memory Dumping via Task Manager
· Heuristic: index=__your_sysmon_index__ EventCode=11 TargetFilename="*lsass*.dmp" Image="C:\\Windows\\*\\taskmgr.exe"
· Behavior: Event10_ProcessAccess > 26.0 AND ImageLoadCount_ts > 72.5 AND ImageLoadMax_ts > 27887596.0
· Generated from Skope-Rules

T1003/Task Manager Random Forest: Top 10 Important Features

© 2019 The MITRE Corporation. All rights reserved.

| 15 |
Behavior Analytics in Splunk
© 2019 The MITRE Corporation. All rights reserved.

| 16 |
Closing Thoughts
 The susceptibility of a given technique to evasion (as characterized by slide 6) should be
one of the primary factors of whether to implement a machine learning analytic or a heuristic analytic ­ Data and organization factors are key underlying components
 Analytics relying on primarily string/signature-based data sources are too easy to evade  Process monitoring offers data about the behavior of a process ­ much more difficult to
evade ­ Inherently higher dimensional data requiring more complex analytics ­ Process monitoring data can be condensed on the endpoint to reduce data quantity
 Adversaries will try to evade ML models ­ but this increases their work factor!
 Contact Info
­ Joe Mikhail jmikhail@mitre.org ­ Brandon Werner bwerner@mitre.org
© 2019 The MITRE Corporation. All rights reserved.

© 2019 The MITRE Corporation. All rights reserved.

| 17 |

