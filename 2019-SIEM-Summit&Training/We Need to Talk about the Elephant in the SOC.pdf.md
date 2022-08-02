We Need to Talk about the Elephant in the SOC
A High­Level Overview of the Risk Based Alerting (RBA) approach SANS SIEM Summit 2019

Todays Speaker
Data Centric Approach to a Career Electrons Packets Analytics
Deploying/Improving RBA for the past 2.5 years With Splunk for past 5.5 years
Jim Apger Staff Architect, Splunk

Agenda
The Problem A Change of Perspective
Mechanics Endgame

The Problem

Alert Fatigue!

Incidents based on narrowly defined detections lead to majority noise within the
SOC

Adding more sources and detection mechanisms continue to overburden the SOC Analysts with more alerts

Whitelisting as a reaction to the above results in a
situational numbness

A Change of Perspective

People

Tech

Process

Process

Efficient use of existing toolchain Scale and retain HAPPY analysts

Now Broken
How we (myself included) have been working

Analytics

Alerting

Risk Attributions
Analytics

Examine Attributions ­ Multiple Lenses
Risk Score

(Investigation Worthy)

ATT&CK Tactics

Score/BU

Alerting

RBA Using a SIEM/Framework of Your Choice

ES Threat intel Framework

ES Datamodels

ES Correlation Rule Framework

Risk Rules

Risk Analysis Dashboard

Risk Scoring Macros
ES Asset Framework
ES Identity Framework
ES Vulnerability Datamodel

Risk Attributions

ES Risk Framework

Risk Notables

ES Correlation Rule Framework
Risk Incident Rules

ES Notable Framework
ES Incident Management
framework

Benefits of RBA

Reduce Alerts
Leverage risk as a layer of abstraction

Improved Detections
Dramatic increase in the true positive rate

Quantified Maturity
Easier to align with a framework like MITRE ATT&CK for data sources, detections, and purple teaming

Analyst Scale
Decouple # detections and data sources from the linear scaling of
the SOC analysts

Increased Analytics Window
Ability to look across much larger windows for low and slow. Red
team's job is MUCH harder

Easy to Deploy
Easier to map against an industry framework than general use cases. Easy to integrate with SSE and ESCU

After viewing the presentation at 2018 .conf on RBA, we quickly set out to adopt the approach in our Security Operations. In January of 2019, before implementing RBA, we saw a 7.07% True Positive Rate. The next month we rose to a 19% True Positive Rate. In quarter two of 2019 we have been able to
maintain a 33% True Positive Rate using the RBA system while also onboarding 29 new correlation searches. Quantifying threats has empowered
our small security operations team to scale with evolving threats without overwhelming us."
Kelby Shelton - Cybersecurity Engineer - Children's Mercy Hospitals and Clinics

MITRE ATT&CK
· Transparency with Leadership · Sense of Community · Prioritize new data source selection · Purple team control validation

MITRE ATT&CK AMPLIFIED

· Transparency with Leadership · Collaborate within the Enterprise · Prioritize new data source selection · Purple team control validation

+ RBA =

Detections based on tactic/technique context
Improved Situational Awareness: During Investigation Across the Org Within Business Units

2 Types of Analytics with RBA

Risk Rules (attributions)

Risk Incident Rules Create Incident

2 Types of Analytics

Risk Rules (attributions)

Risk Incident Rules

Some sort of high speed container full of beautiful attributions
Your data is trying to tell you a story
Go easy on the whitelisting
Layer of abstraction between analytics and detection

2 Types of Analytics

Risk Rules (attributions)
Investigative Worthy attributions May not have scores/ATT&CK context
Scores weighted by asset/identity category
Bonus ­ weight by VM crits on system 1st Risk Rule is the hardest!

Risk Incident Rules

2 Types of Analytics

Risk Rules (attributions)

Risk Incident Rules
Only 2-3 rules typically These create alerts/incidents Analyze the attributions via multiple
lenses Incidents contain so much more context
Dedup based on # tactics/techniques/sources

Mechanics
Scoring Macros Risk Rule (attributions)
Risk Incident Rule Resultant Alert/Incident Investigative Dashboard

Example Risk Attribution Macro

risk_score_user(impact,confidence,object,category)

Values passed into macro Impact
Confidence

Modifiers

Write results

SCORE

Example Risk Rule

Common correlation search Message specific to the attribution
Align with ATT&CK

| from datamodel:Network_Resolution.DNS | search _time < 1501848000 record_type="A" `Exclude_DNS_Server_src_ip` | eval list="iana" | `ut_parse(query,list)` | fields ut_domain,src,query | bucket _time span=5m | stats count by ut_domain,query,src _time | lookup DDNS_lookup domain as ut_domain | search provider=* |lookup dhcpLogs dest_ip as src OUTPUT dest_nt_host as host
|eval risk_message="DDNS activity detected (".ut_domain.") via query=".query." and provider=".provider
|eval rule_attack_tactic_technique= "establish_and_maintain_infrastructure - T1333 - Dynamic DNS - https://attack.mitre.org/techniques/T1333/ |command_and_control - T1071 - Standard Application Layer Protocol https://attack.mitre.org/techniques/T1071/ |adversary_opsec - T1311 - Dynamic DNS - https://attack.mitre.org/techniques/T1311/"

Risk macro

`risk_score_system(low,low,host,src_category,src_priority)`

Example Risk Incident Rule

Common Data Fetch Build Constraints/Context
Apply Constraints

|from datamodel:"Risk.All_Risk"|search source="Threat - RR*" |table risk_object risk_object_type risk_message source risk_score rule_attack_tactic_technique |eventstats sum(risk_score) as risk_scoreSum by risk_object |makemv delim="|" rule_attack_tactic_technique |mvexpand rule_attack_tactic_technique |rex field=rule_attack_tactic_technique "(^|\|)(?<tactic>.+?) - (?<tactic_num>.+?) - (?<technique>.+?) - (?<technique_ref>.*)"
|stats values(risk_scoreSum) as risk_ScoreSum values(risk_message) as risk_message dc(source) as sourceCount values(source) as source values(rule_attack_tactic_technique) as rule_attack_tactic_technique dc(tactic) as tacticCount values(tactic) as tactic dc(technique) as techniqueCount values(technique) as technique by risk_object,risk_object_type
|where tacticCount >=3 and sourceCount >=4
|eval message="ATT&CT Tactic threshold exceeded (>=3) over previous 7 days for ".risk_object_type."=".risk_object." spanning ".sourceCount." Risk Rules, ".tacticCount." ATT&CK tactics, and ".techniqueCount." ATT&CK techniques"

This specific search is a great one for looking backward several weeks to pickup low-and-slow in a performant manner!

RBA Driven Incidents
We see our first 2 RBA Incidents!

Click to Expand

RBA Driven Incidents

Great context delivering almost instant situational awareness.
These are the risk attributions that triggered the notable as there were greater than 4 sources and >= 3 ATT&CK tactics

RBA Driven Incidents
These are the fields we use for throttling (by risk_object)
Lots of throttling options. Some customers are checking for % increase in other factors like risk score.

RBA Driven Incidents

Click to Expand Click!

RBA attribution System/User dashboards

RBA attribution System/User dashboards

Recent Attack

Inbound Phish Meterpreter Session
Domain Fronting Persistence Mimikatz
Lots of encoded powershell

RBA attribution System/User dashboards
Recent Attack (continued)

.Conf 2018 ­ SEC1479
Say Goodbye to Your Big Alert Pipeline, and Say Hello to Your New Risk-Based approach
Details a 3-month customer journey to transition SOC to a Risk Based Alerting (RBA) approach
Recording/Slides here:
https://conf.splunk.com/conf-online.html?search=%22Big%20Alert%22#/
Also of note:
https://conf.splunk.com/files/2017/slides/the-art-of-detection-using-splunk-enterprise-security.pdf

As an early contributor of the RBA process and as a Threat Hunter in a mid-sized enterprise, we increased our
detections by 300%, reduced our security alerts by 50%, aligned with MITRE ATT&CK, and achieved a 60% true
positive rate in the SOC in less than a year without increasing the size of the security team by leveraging a risk
based approach
Stuart McIntosh, CTO Outpost Front Line

