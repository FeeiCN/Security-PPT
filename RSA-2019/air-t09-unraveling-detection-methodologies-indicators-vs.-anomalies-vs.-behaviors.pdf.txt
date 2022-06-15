SESSION ID: AIR-T09
Unraveling Detection Methodologies: Indicators vs. Anomalies vs. Behaviors

Joe Slowik
Principal Adversary Hunter Dragos Inc. @jfslowik / pylos.co

#RSAC

#RSAC
Introduction ­ Dedicated Defender!

#RSAC
...But on My Own Terms!

#RSAC
Motivation
We need to defend against and identify threats:
­ To many vectors for "manual" operations to keep up ­ Identify mechanisms for automation and "machine-to-machine"
communication
But how?
­ Lots of products ­ but only a few underlying methodologies ­ What are the benefits & drawbacks of each?

#RSAC
Agenda
Indicators Anomalies Behaviors Evaluation Implementation

#RSAC
Indicators of Compromise
Formally, IOCs are enriched descriptions of potential compromise Designed to add contextuality As a concept ­ much to be said in favor
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Indicators of Compromise
https://www.fireeye.com/content/dam/legacy/ammo/Figure-1-Initial-IOC-for-acmCleanup.exe-BACKDOOR.png
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Indicators in Actuality
https://www.us-cert.gov/sites/default/files/publications/JAR-16-20296A.csv
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Debasement of IOCs
IOCs as used, reported, and communicated are conflated with observables Atomic, largely context-free items:
­ Hash, filename ­ Domain, IP address
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Too Many IOCs!
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Re-Evaluating IOCs
IOCs

As Implemented

In Theory

Lack of Context

Easily Changed

Useful?

Indicators Anomalies Behaviors Examples Implementation

#RSAC
IOCs are Backward-Looking
IOCs focus on observed events to identify compromise
Can be really good for forensics!
Fine for detecting lazy adversaries!
Terrible for detecting net-new attacks
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Do Robust IOCs Fulfill a Threat Detection Need?
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Moving Beyond IOCs

Detection Must be Tuned to
Organizational Needs

Networks and Attacks are Similar ­ but No Two are Exactly the Same

Detection Methodology MUST be Capable of Detecting "New"
Attacks

IOCs are NOT Sufficient

Indicators Anomalies Behaviors Examples Implementation

#RSAC
Anomalies
https://cdn-images-1.medium.com/max/1600/1*ZlN46eNWkRtkAS4qOjrJYA.png
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Detecting Anomalous Events

Establish a "Baseline" ­
Normal

Why Not Just Look for "New"
Things:

Look for Items that Deviate

Deviations become Items
for Analysis
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Anomaly Detection Benefits
You definitely catch everything "new" that you can see!
Robustly addresses "net new" issue from IOCs"
Depending on implementation ­ relies on own-organization data for baseline
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Anomaly Detection Failings
Anomalous != Suspicious != Malicious
Anomalies Lack Context
Requires Maintenance and Adjustment of Baseline
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Anomalies and Alert Fatigue
https://blog.secdo.com/hubfs/Blog_Media/wake-up-call-on-alert-fatigue.png?t=1535133734183
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Anomalies and Machine Learning
https://imgs.xkcd.com/comics/machine_learning.png
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Anomalies and Enrichment

Anomaly = "Something Weird
Happened"

Requires Investigation & Enrichment to Make
Sense

Anomalous Datapoint Provides Weak Initial Point for Investigation
Significant Correlation Activity Required of
Human Analyst

Indicators Anomalies Behaviors Examples Implementation

#RSAC
Anomalies and Baselines
https://paracurve.com/2013/02/mechanical-trend-trading-strategy-adaptive-entries-using-acceleration-launchpads.html
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Model Flexibility?
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Threat Behavior Analytics
http://detect-respond.blogspot.com/2013/03/the-pyramid-of-pain.html
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Intrusion Events and the Kill Chain
https://www.lockheedmartin.com/content/dam/lockheed-martin/rms/photo/cyber/THE-CYBERKILL-CHAIN-body.png.pc-adaptive.full.medium.png
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Behavior Detection
· Must have information on threat environment Intelligence- · General trends, specific items of interest, and direct threats to organization
Driven
· Identify and learn how relevant adversaries operate Adversary- · Identify and understand threat TTPs
Focused
· Map observed TTPs to kill chain Behavior · Determine visibility and alerting requirements at each stage
Mapping
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Hunt for Fundamental Actions

Identify Adversary Goals
· Data Theft? · Monetization? · Disruption/Destruction?

Determine Methods to Achieve Goals
· Identify TTPs · Map across each stage
of Kill Chain

Build Detections around Results
· Determine visibility at each phase of attack
· Build detections to capture correlated observables

Indicators Anomalies Behaviors Examples Implementation

#RSAC
Wait ­ Aren't "Behaviors" Backward-Looking?
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Behaviors and Kill Chain Coverage
Might not catch "net new" events and TTPs BUT through kill chain coverage:
­ Identify other parts of attacker lifecycle ­ Play off of attacker path-dependency
Assumption: No adversary completely innovates TTPs across the entire kill chain Requirement: overlay detections and behavioral understanding across kill chain to capture attacker dependencies
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Behavioral Limitations
Behavioral tracking requires event correlation between multiple data sources
Requires extensive visibility between various logs
Most effective implementations might be out of reach
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Easy to Say, Hard to Implement
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Testing Methodologies in Examples
Theoretical discussion is fine ­ but how do these approaches work when compared to actual events? Two items for discussion:
­ Potential CozyBear / APT29 activity from 2016 to 2018 ­ Credential theft and re-use attacks
Indicators Anomalies Behaviors Examples Implementation

#RSAC
CozyBear / APT29 Activity
Indicators Anomalies Behaviors Examples Implementation

#RSAC
CozyBear / APT29 Behaviors
Many behaviors associated with group across multiple campaigns One element matching wider threat activity: increased use of "living off the land" techniques:
­ PowerShell for initial exploitation and post-exploitation activity ­ Leveraging WMI for various purposes
Using CozyBear as an example - how do we detect this activity?
Indicators Anomalies Behaviors Examples Implementation

#RSAC
2016 Behavior
Indicators Anomalies Behaviors Examples Implementation

#RSAC
2018 Behavior
Indicators Anomalies Behaviors Examples Implementation

#RSAC
IOC-Focused Approach for APT29 TTPs
May be able to detect specific scripts...
­ Easily fuzzed to evade hash matching ­ Completely defeated in many cases if run in memory alone
Process chaining may work in some cases
­ Requires robust IOC approach and enabling level of host monitoring ­ Ubiquity of PowerShell makes this approach potentially troublesome
Ultimately this is a technique and not a specific sample of malware ­ would rely on other IOCs for detection (e.g., recycled C2)
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Anomaly Detection and CozyBear PowerShell
PowerShell execution or linked to other observables might work to detect an anomalous event
­ Requires data correlation which pushes toward behavior detection
Anomaly detection limited to a single data source (most implementations) would be significantly limited:
­ Widespread PowerShell use generates too much noise ­ In-memory presence of most-valuable observables limits capability to
observe truly anomalous items
May work with full, post-execution PowerShell logging on commands and techniques
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Behavior-Based Approach
Correlation of data points representing intrusion event enables significant detection possibilities:
­ Robust process chaining combined with network events ­ Ability to correlate PowerShell use with other observables
Identification of PowerShell use indicative of malicious intent can enable behavioral detection
However...
­ Assumes significant visibility AND ability to process and correlate events ­ May simply be too much to expect of most organizations
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Potential Solution
Identify PowerShell commands and flags of interest:
­ Invoke-Expression, IO.FileStream, EncodedCommand, etc. ­ Demands PowerShell visibility post-obfuscation
Alert and notify when observed PowerShell items appear correlated with other suspicious behavior:
­ Unsigned binary written to disk or executed (dropped file) ­ Correlate suspicious PowerShell with new network observable (C2) ­ Chain PowerShell execution with new scheduled task, start menu item
creation, or registry key modification (persistence)
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Credential Theft and Reuse
Technique Deployed by Multiple Adversaries
Executed via Multiple Techniques with Varying Amounts of Observation
Leaves a Logging Trail in Simple Authentication Records
Indicators Anomalies Behaviors Examples Implementation

#RSAC
IOCs and Credential Theft
By definition, IOC-focused approach will not detect the process or use of credential theft
­ By design, technique attempts to "blend in" to legitimate activity
May be able to identify tools used for credential theft:
­ Password dumpers, keystroke loggers, etc. ­ BUT: tools can be fuzzed, run in memory, etc.
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Credential Theft Anomalies
Standard use-case for anomaly detection: identifying an "anomalous logon" Theoretically a powerful technique:
­ Identify logons at unusual or rare times ­ Flag new logons to a host from a set of credentials
Two concerns:
­ False positives ­ False negatives
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Credential Theft Behaviors
Behavior-based approach to credential theft depends on compound alerting
­ Don't just alert on "new logon" ­ Contextualize behavior
Result:
­ More robust approach ­ Ties an anomalous item to other, suspicious items ­ Provides analyst with a "complete picture" of event on alert
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Credential Theft Behaviors
· Captured credentials attempted against many hosts
One-to-Many · Observe: single machine, single credential set, multiple targets · Indicative of lateral movement

· Dictionary or list testing against a single host
Many-to-One · Observe: single machine, multiple credentials, single host · Indicative of focused efforts against HVT

Many-toMany

· Extensive remote logon activity within network · Most directly related to anomaly/machine learning detection · Look for increased remote access activity irrespective of targets

Indicators Anomalies Behaviors Examples Implementation

#RSAC
Theory to Practice

Perfect World

Reality

· Combine Indicators, Anomalies, and Behaviors
· Different approaches compliment each other
· Robust defense-in-depth

· Resources are scarce
· Organizations must prioritize and choose
· Align to threat landscape
· Some approaches may not be possible in current state

Indicators Anomalies Behaviors Examples Implementation

The "Right" Decision

Identify Organization
Needs

· What are security priorities?
· What level of response is needed?

Determine Current Visibility

· What can you see?
· What do you need to see?

Understand Threat
Landscape

·How do your adversaries behave?
·What contingencies must be planned for?

Indicators Anomalies Behaviors Examples Implementation

#RSAC

#RSAC
Importance of Self-Knowledge
Environment · What does your network look like? · What are your threats and how do they operate?

Current Visibility

· What are your current detection and monitoring capabilities?
· How does current visibility map to current threat environment?

Future Visibility

· What do you need for visibility to keep up with threats?
· What does your environment, budget, and operation enable for future efforts?

Indicators Anomalies Behaviors Examples Implementation

#RSAC
Implementation

Requirements: Inputs: Technology: Pitfalls:

Indicators

Anomalies

Behaviors

Determine

Develop robust

appropriate

criteria defining

sources and actions "anomaly"

Understand adversary TTPs

Data feeds (ideally Find suitable data Log, host, and

vetted)

sources

network data

Alerting and blocking

Data storage and analysis

Correlation engine to tie together events

Static, backwardlooking

Baseline definition, Requires

false positives, false continuous

negatives

revision, expensive

Indicators Anomalies Behaviors Examples Implementation

#RSAC
Solution: Economically Combine Approaches
Identify relevant adversaries for organization and their TTPs/behaviors
Determine visibility into network via IOC and anomalybased approaches
Map IOC- and anomaly-based alerts to best match behaviors of interest
Attempt to automatically correlate or enrich findings to approximate behavior-based detection
Revise steps as threat landscape and telemetry changes
Indicators Anomalies Behaviors Examples Implementation

#RSAC
Selected References
Misunderstanding Indicators of Compromise ­ ThreatPost Investigating with Indicators of Compromise ­ FireEye The Four Types of Threat Detection ­ Dragos Early Detection of Cyber Security Threats using Structure Behavior Modeling ­ CMU Data Fusion-Based Anomaly Detection in Networked Critical Infrastructures ­ Genge Bela PowerDuke: Widespread Post-Election Spear Phishing Campaigns Targeting Think Tanks and NGOs ­ Volexity CozyBear ­ In from the Cold? ­ Joe Slowik The Pyramid of Pain ­ David Bianco

Questions?
jslowik@dragos.com @jfslowik

