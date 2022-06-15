© 2018 SPLUNK INC.
Monitoring and Mitigating Insider Threat Risk With Splunk Enterprise and Splunk UBA
Ken Westin | Senior Security Strategist, Splunk Kena Baity | Security Operations Analyst, Citrix

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Agenda
 Insider Threat Overview  Developing an Insider Threat Program & Governance  Citrix Insider Threat Use Cases  Security Essentials for Insider Threat  Machine Learning for Insider Threat

© 2018 SPLUNK INC.

Kena Baity
 Currently a Security Engineer at Citrix Systems, Inc.
 Citrix for 5 years but have over 15 years of Security experience.
 Started with Splunk in 2016  Uses Splunk for Threat Hunting, Incident
Response, Malware Investigations, other security use cases  CISSP, CISA, GCIH

© 2018 SPLUNK INC.

Ken Westin
 Senior Security Strategist  Based in Portland  At Splunk 3 years  Trained in offensive and defensive
security M.Sc, OSCP, ITPM  Presented at security conferences
around the world: DEF CON, Black hat,
BSides etc
kwestin@splunk.com @kwestin

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Insider Threat Defined

© 2018 SPLUNK INC.
An insider threat is a malicious threat to an organization that comes from people within the organization, such as employees, former
employees, contractors or business associates, who have access to inside information concerning the organization' practices, data and computer systems.
Source: Intelligence-Based Security in Private Industry, Thomas A. Trier

Insider Threat: Malicious Intent

© 2018 SPLUNK INC.

Other

8% IT Sabotage

Espionage

21%

19%

IP Theft 15%

Fraud 37%

 IP Theft and IT Sabotage are usually done by short timers, or problem employees
 Fraud and Corporate Espionage are usually done over longer periods of time as users test limits of access or probing

Different Types of Insider Threat

© 2018 SPLUNK INC.

Malicious User

Compromised User

Negligent Employees

Unintentional Insider Threat (UIT)

© 2018 SPLUNK INC.

An unintentional insider threat is a current or former employee, contractor, or business partner who has or had authorized access to an organization's network, system, or data and who, through action or inaction without malicious intent, causes harm or substantially increases the probability of future serious harm to the
confidentiality, integrity, or availability of the organization's information or information systems.
Source: Unintentional Insider Threats: A Foundational Study, CERT® Insider Threat Team https://resources.sei.cmu.edu/library/asset-view.cfm?assetid=58744

Detecting Insider Threats Is Hard

© 2018 SPLUNK INC.

ANOMALOUS != MALICIOUS NEED TO MONITOR MULTIPLE EVENTS ...OVER A LONG WINDOW OF TIME

Insider Threat Kill Chain
Non-Technical Indicators

© 2018 SPLUNK INC.

Recruitment/ Tipping Point

Search/Recon

Acquisition/ Collection

Exfiltration/ Action

Copyright © 2015 Splunk Inc.

Technical Indicators

Splunk as an Insider Threat Data Hub

© 2018 SPLUNK INC.

Technical Data Sources

Account Creation Active Directory Antivirus Application Logs Authentication Chat Configuration Change Data Loss Prevention DNS Email Logs File Access Firewall Help Desk Tickets

Wireless Logs HTTP/SSL Proxy IDS/IPS MDM (Mobile Device Mgmt) Network Monitoring Logs Network Packet Tags Permission Change Monitor Printer/Scanner/Copier/Fax Logs Permission Change Monitor Removable Media Logs Telephone Records User Activity Monitoring VPN Logs

Ad hoc search

Monitor and alert

Report and analyze

Custom dashboards

Developer Platform

Real-Time Data

Non-Technical Data Sources

Anonymous Reporting Asset Management AUP Violation Records Background Investigations Conflict of Interest Reporting Corporate Credit Card Records

Foreign Contacts Reporting Performance Evaluations Personnel Records Physical Access Violations Security Clearance Reporting Travel Reporting

References ­ Coded fields, mappings, aliases Dynamic information ­ Stored in non-traditional formats Environmental context ­ Human maintained files, documents System/application ­ Available only using application request Intelligence/analytics ­ Indicators, anomaly, research, white/blacklist

© 2018 SPLUNK INC.
Splunk for Insider Threat Governance

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Citrix Insider Risk Use Cases

Insider Threat: Email Logs
 1. Anomalies in user email behavior · Help identify an employee that is planning to leave the organization
 2. Possible Data exfiltration · Due to malware or unauthorized user behavior
 3. Email policy violations · Identifying the transfer of confidential information
 4. Broken or unsafe processes

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Ransomware as Unintentional Insider Threat

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk Security Essentials

© 2018 SPLUNK INC.
Splunk Security Essentials for Insider Threat

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Demo SPL for Flight Risk Emailing

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk Enterprise Security

© 2018 SPLUNK INC.

Asset and Identity Correlation

© 2018 SPLUNK INC.

30

© 2018 SPLUNK INC.
Enterprise Security Insider Threat Glass Table

Copyright © 2015 Splunk Inc.

31

© 2018 SPLUNK INC.
Machine Learning for Insider Threat

Complexity

© 2018 SPLUNK INC.
Evolution of Security Correlation, Advanced Analytics & ML
N-Dimensional Advanced ­ Data Science · Shift from heavy manual tagging and rule building alone, · Machine learning and data science for UEBA · Enhances analyst capabilities to identify unknown threats · Monitor and measure aggregated risk of users and assets
Multi-Dimensional ­ Analytics · Hybrid model developed as adversaries circumvent basic correlation · Goal to reduce false positives · Thresholds and combinations of rules developed. · Behavioral models, statistics and patterns not signatures alone
Two-Dimensional ­ Correlation · Regex/pattern-matching for strings · Used in anti-malware, IDS/IPS, DLP and basic/legacy SIEM · Use of string matching to search a binary file to identify type of threat · Enhanced capability to identify previously known threats and host enumeration
One-Dimensional ­ Correlation · Fast and efficient basic matching e.g.. domains IP addresses, user-agent, MD5 file hashes · Boolean operators to identify if signature is on a black/white list. · Common usage in most firewall and IDS tools
Data Volume & Velocity

Insider Threat Kill Chain: Sequencing
1. User added to watchlist
2. User attempts to access new business application

© 2018 SPLUNK INC.

Non-Technical Indicators

3. User accesses high volume of job sites during work hours

1 Month

4. User accesses critical file share

5. User copies files to USB flash drive

8

Recruitment/ Tipping Point

Search/Recon

Acquisition/ Collection

Exfiltration/ Action

Copyright © 2015 Splunk Inc.

Technical Indicators

© 2018 SPLUNK INC.

Types of Fancy Machine Learnin'

© 2018 SPLUNK INC.

Supervised Machine Learning
Requires labeled data and requires care and feeding to teach the model so it identifies relationship between a known set of outputs and their related inputs. Once established it is used to predict output for a new set of inputs.

Unsupervised Machine Learning Requires no prior training of models, analyzes sets of data and identifies groups with similar attributes and establishes baselines that identify anomalous behavior.
Copyright © 2015 Splunk Inc.

Machine Learning for UEBA

© 2018 SPLUNK INC.

Supervised Machine Learning

Unsupervised Machine Learning

Model

Baseline

© 2018 SPLUNK INC.
Use Cases, Models, Kill Chains & Data Sources

Use Case
Abnormal Server Access

Kill Chain
Lateral Movement

Malicious Download

Command & Control, Infection

Model Types K Means
Naïve Bayes, Logistic Regression

Detection
Anomaly (unknown threat)
Maliciousness (Known Threat)

Training Data Unlabeled (Unsupervised)
Labeled (Supervised)

Data Sources Active Directory Windows Logs
Email Logs Windows Logs Anti-Malware

Copyright © 2015 Splunk Inc.

© 2018 SPLUNK INC.
Mapping Anomalies to Data Sources in Splunk UBA

Anomaly

UBA Model

Suspicious Network Exploration

User Info Exploration

Unusual USB Activity

USB Activity

Suspicious

Feature-Based

Account Activity Peer Grouping

Type of Model Batch Batch Batch

Data Source Windows Event Log
Client Data
Multiple

Fields

Model Readiness

EventId, Target 7 Days Entity Id, Source Entity Id, Event Time

Client IP, username, operation, target info

7 Days

Multiple

7 Days

Copyright © 2015 Splunk Inc.

© 2018 SPLUNK INC.

Connecting Insider Threat Dots With Machine Learning

RAW SECURITY EVENTS

ANOMALIES Anomalies graph

ANOMALY CHAINS
(THREATS)

Lateral Movement Beaconing Land-Speed Violation

Entity relationship graph

MACHINE LEARNING

GRAPH MINING

THREAT MODELS

Kill chain sequence Forensic artifacts Threat/Risk scoring

VISUALIZATION & ANALYTICS

FEEDBACK

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
49 Batch Models and 18 Streaming Models

Specialist Workshops
Insider Threat Assessment and Hands-On Workshop Fraud Workshop
kwestin@splunk.com

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Thank You!

