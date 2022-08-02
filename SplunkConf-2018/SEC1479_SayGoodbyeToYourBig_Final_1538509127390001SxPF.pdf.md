© 2018 SPLUNK INC.
Say Goodbye to Your Big Alert Pipeline, and Say Hello to Your New Risk-Based Approach
Jim Apger | Splunk Stuart McIntosh | American Family Insurance
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Our Speakers

© 2018 SPLUNK INC.

JIM APGER
Staff Security Architect Splunk

v
STUART MCINTOSH
Threat Intel Analyst American Family Insurance

Framework for this session (Agenda)

 Problem Statement

 High-Level Concepts  Production Deployment

Jim Stuart

 Anatomy of a Risk Rule

 Anatomy of a Risk Incident

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Problem Statement
Shouldn't come as a surprise

Is Your SOC A Big Alert Pipeline?
Defining Characteristics
 Incidents based on narrowly defined detections lead to majority noise within the SOC
 Adding more detection mechanisms continue to overburden the SOC Analysts with more alerts
 Whitelisting as a reaction to the above results in a situational numbness (coined by Stuart)

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
"A perception of the SOC as a big alert pipeline is
outdated and does not allow the organization to make use of more active processes such as internal TI generation and threat hunting."
Source: Gartner; How to Plan, Design, Operate and Evolve a SOC; by Anton Chuvakin and Augusto Barros; October 2016

How Big is this Problem?
We Need to Fix That!

© 2018 SPLUNK INC.

Source : EY Global Information Security Survey 2017-2018

© 2018 SPLUNK INC.
High-Level Concepts
Adding a Level of Abstraction

The Risk Driven Approach
Mindset Shift: Cast a Wide Net

© 2018 SPLUNK INC.

Indicator Search

Risk Score and Attribution

Risk Rule

Risk index

Risk Driven Alerts

Risk Incident Rule

Risk Attribution
Using a Summary Index or ES Risk Index

© 2018 SPLUNK INC.

RiskRule-AnomalousLogin RiskRule-ThreatIntelIOC RiskRule-MalwareDetection RiskRule-IDSRecon RiskRule-IDSAttack RiskRule-FirstTimeSeenDomain RiskRule-LongPowershell RiskRule-EncryptedPowershell RiskRule-EndPointAV RiskRule-#10 . . . . RiskRule-#150

Risk Index

RiskIncidentRule-HighCompositeRiskScore RiskIncidentRule-Multiple RiskRulesSinglePhase RiskIncidentRule-MultipleATT&CKPhases . . . .

Risk Driven Alert Notable Event in ES Create/Update ticket in External system

RiskRule-AnomalousLogin RiskRule-ThreatIntelIOC RiskRule-MalwareDetection RiskRule-IDSRecon RiskRule-IDSAttack RiskRule-FirstTimeSeenDomain RiskRule-LongPowershell RiskRule-EncryptedPowershell RiskRule-EndPointAV RiskRule-#10 . . . . RiskRule-#150

Risk Attribution
Context Written to the Risk Index

© 2018 SPLUNK INC.

Include in the Attribution risk_score risk_object
risk_object_type rule_name (search_name)
rule_phase

Risk Index

Risk Attribution
Indicator Search Examples
 Threat Intel · Create attributions for matches · Dynamic score based on feed, asset/identity, or other context
 IDS/AV · Map the IDS vendor categories into ATT&CK/Kill chain phases · Dynamic score based on category, asset/identity, or other context
 Behavioral Anomaly attributions (SSE and ESCU)  Outlier attributions ­ leveraging ML  3rd party Integrations to include their risk attributions, like WHOIS  Hint: A very High Risk Score attribution will trigger an incident via the
RiskRule-HighRiskScore rule

© 2018 SPLUNK INC.

Risk Attribution
Indicator Search Example #1

© 2018 SPLUNK INC.

Sets the stage for "testmode" by creating info_sid

Send the attribution to the Risk index
Direct from Splunk Security Essentials Concentration of Hacker Tools by Filename (Assistant: Simple Search)

Risk Attribution
Indicator Search Example #1
index=risk search_name=Concentration_of_Hacker_Tools_by_Filename

© 2018 SPLUNK INC.

Direct from Splunk Security Essentials Concentration of Hacker Tools by Filename (Assistant: Simple Search)

Risk Attribution
Results: Indicator Search Example #2

© 2018 SPLUNK INC.

Direct from Splunk Security Essentials
Emails with Lookalike Domains (Assistant: Simple Search)

Risk Attribution
Indicator Search Example #2
index=risk search_name=Concentration_of_Hacker_Tools_by_Filename

© 2018 SPLUNK INC.

Direct from Splunk Security Essentials Concentration of Hacker Tools by Filename (Assistant: Simple Search)

Risk Attribution
Indicator Search Example #3

© 2018 SPLUNK INC.

Append to the above search:
Direct from ES Content Updates
Malicious PowerShell

|eval risk_object=host, risk_object_type="system", risk_score=count*5, kill_chain_phase=mvappend("CC","ActOnObjective"), search_name="Malicious PowerShell Process Encoded Command"
|collect index=risk

Risk Attribution
Risk/Behavior Based View Across the Org

© 2018 SPLUNK INC.

Risk Driven Alerting Examples

© 2018 SPLUNK INC.

Create a Risk Driven Alert by directly querying the risk index for:
 Static risk threshold crossed · Great for single high risk rules · Detect low and slow
 Multiple phases/techniques observed  Detect an anomalous score move within a peer group (asset/identity)  Sequence or combination of attributions or phases

Risk Driven Alert
Multiple Phases Example

© 2018 SPLUNK INC.

WeTahreis liosomkiuncghfobreattneyr tohbajencptrwesitehnrtiisnkga2ttrsiebpuatiorantse alerts spanningthmatomreatyhagnet2rokuilltecdhatoin2pdhiaffseeresnatnadnmalyosrets!
than 1 risk rule.

© 2018 SPLUNK INC.
Production Deployment
American Family Insurance

Environment Overview
What we are working with

 Organization · 25,000 Endpoints · 20,000 Users · 4 SOC Analysts · 4 Threat Intel Focused Employees

 Data Sources · Network IDS · Host IDS · Antivirus · Email · Web Proxy · Firewall · Vulnerability Scanning · Active Directory · VPN

© 2018 SPLUNK INC.

Why Now?
The conditions that lead to risk based
 Traditional detection to alert plateau · New detections meant more alerts on an already taxed staff · Whitelist everything leading to a numbness
 Pentest with 1 alert · Large motivator · Thought we rocked at security, found out we don't

© 2018 SPLUNK INC.

Initial Success
Big wins for reducing alert fatigue
Expiration Based Whitelisting
Developed whitelists for each notable with automatic expirations Allows False Positive signatures to catch up Prevents re-investigating in known good 60% reduction in the volume of notables/alerts
Phishing Prevention
Custom email behavior monitoring for proactive identification of potential phishes Paired with improved controls and script to remove emails from mailboxes Reduced click-rate of phishing from 40% to <5% with no user training

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Anatomy of a Risk Rule
American Family Insurance

© 2018 SPLUNK INC.
Risk Attribution
Components of Risk Attribution
Once an attack behavior is identified it is important to identify the objects involved and assign the risk. This is macro driven to allow ease of support and allow quicker adjustments.
The components of assigning risk are:  Identify Risk Modifiers  Establish Risk Score
· Leverages risk modifiers, confidence in the
behavior and impact of the behavior
 Identify Attack Phase of the Behavior

© 2018 SPLUNK INC.
Risk Attribution
Risk Modifiers
Risk Modifiers are aspects to a user or system that makes them more critical in the environment. These only apply to internal objects and the sum total from a user and system is then used in the scoring.
Users ­ Service Account, Privileged Account, Executive, Watchlist*
* populated by integration with other outside processes like terminations
Systems ­ Privileged System, Critical System, Critical Vulnerabilities

Risk Attribution
Risk Scoring

© 2018 SPLUNK INC.

Risk Scores use the risk modifier count as well as a confidence and impact ratings

Confidence ­ the fidelity of a true positive with an attack behavior

Low ­ less confident, multiple false positives mixed in

Medium ­ Some false positives may occur but not regularly High ­ All results are true positive for a specific attack behavior Impact ­ how much will this behavior impact the environment Info, Low, Medium, High, Critical

Here comes math...

Risk Attribution
Pulling it all together

© 2018 SPLUNK INC.

Low 30% Medium 60% High 100%
(Impact * Confidence) * ((Modifiers * .25) + 1) = Net Risk Score

Info 20 Low 40 Medium 60 High 80 Critical 100

0­N
(Privileged user and system would be 2)

© 2018 SPLUNK INC.
Anatomy of a Risk Incident
American Family Insurance

Anatomy of an Incident
Risk Notables

© 2018 SPLUNK INC.

Anatomy of an Incident
Risk Object Detail

© 2018 SPLUNK INC.

Anatomy of an Incident
Risk Object Detail

© 2018 SPLUNK INC.

Lessons Learned
What happened along the journey

© 2018 SPLUNK INC.

 Mindshift

 Leadership Support

· Hard to not want to search every 5 minutes · Need the time to focus and develop

· Easier for those not in a SOC to make the
jump mentally

· Identify the key business drivers to help
them buy in

Lessons Learned
What happened along the journey

© 2018 SPLUNK INC.

 What to do with a Risk Notable
· Need details but everything is summarized
· How to jump to detail efficiently and
accurately

 Fits all SOCs, even small
· Allows you to prioritize and alert more
effectively
· Reduced noise means more time for other
efforts

Towards the end of the effort we realized we made an automated SOC analyst
and built that first level decision making into it

What's Next
How to continue maturing this approach
 Pre-Alert and Post-Alert Automation · Enabling system isolation if concerned · Automatic Packet captures · Downgrading user access
 Previous Notables as Enrichment · Adjust urgency by sources, modifiers, and score · Determine to alert based on other notables · Tagging based on behavior patterns and changes to risk
 Ability vs. Capacity · Continued Iteration on Ability to detect threats with SOC Capacity to respond

© 2018 SPLUNK INC.

High-Level Takeaways

© 2018 SPLUNK INC.
1. An approach does exist that may provide
relief from alert fatigue but it requires commitment from the Security group and support from Leadership
2. It's possible, even for a small SOC, to
make a soft transition to this approach
3. Risk scoring becomes extremely important
and will require ongoing maintenance but scales the overall effort more effectively
4. Aligning the MITRE ATT&CK matrix and
techniques with this approach provides a means for quantifying your security posture and for justifying new data sources.

© 2018 SPLUNK INC.
Q&A
Jim Apger | Splunk Stuart McIntosh | American Family Insurance

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

Other Related Approaches

© 2018 SPLUNK INC.

