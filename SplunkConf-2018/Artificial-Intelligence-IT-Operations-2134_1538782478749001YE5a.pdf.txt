Artificial intelligence for IT operations (AIOps) Artificial intelligence for IT operations (AIOps)
Artificial Intelligence for IT Operations
Accenture and Vodafone Transforming IT Operations
Thanos Malevitis ­ Technology Strategy Managing Director Retesh Shah ­ Senior Manager, Accenture Plc. UK
October 2018 | Version 1.0

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Our Speakers

© 2018 SPLUNK INC.

v

RETESH SHAH
Senior Manager, Accenture Plc.

THANOS MALEVITIS
Technology Strategy Managing Director

Our Objectives

© 2018 SPLUNK INC.

Accenture and Vodafone UK partnered together in 2017 to stabilise Vodafone's Consumer Centric Stack (CCS) with below objectives:

Improve quality, Improve stability, lessen risk, increase predictability

Improve the perception of poor quality and inconsistent ways of working

Improve the predictability effectiveness of monitoring, support availability management and capacity planning

Remediate unacceptable levels of service availability

Create consistent reporting of service performance

Ability to react effectively and independently to major service events or crisis

Successful transfer back to Vodafone insource team and to enable them to run the service successfully

© 2018 SPLUNK INC.
IT Operations is important
Customer satisfaction is key to our business and we play an important role in it!

What do we get?

What do we manage?

Competition, customer demand & satisfaction

Dealing with frequent change
Tangle of interdependenc
ies

What do we do?
Automate / DevOps
Alert / Monitoring

Complex Architecture

Provide 24X7 Support

Gather data & analyse

Human judgment is key!
Automate core processes but needs to be triggered !
Automate alerting but still requires acknowledgement and action !
Data analytics generated but requires action/plan !

IT Operations is important
There are key goals which IT Operations needs to achieve....

© 2018 SPLUNK INC.

Automating repetitive tasks , avoid human error

Machine Learning can .... Enable analysis of information

Increase employee satisfaction

Perform Logical inferences and conclusion

Improve productivity Reduce in processing cost

Perform actions Ticket Analysis

© 2018 SPLUNK INC.
Vodafone Implementation of AI
Automated Weblogic Queue Throttling

© 2018 SPLUNK INC.
Problem Statement
Operations teams need to gather and analyse data to decide the best action required to meet SLA targets and KPI

Efficiency and speed of service restoration post planned and unplanned outages to ensure:
Application uptime
Customer experience
Service fulfilment
Operation resource utilization

2-3 changes per week
­ Requires dedicated and coordinated efforts across multiple teams
Complex architecture to meet business requirements
­ 12 core applications & Complex integration to other 80
Long and complex restoration process to:
­ Avoid dominos affect on applications

Logical Architecture

© 2018 SPLUNK INC.
Service Restoration
Despite the best automation, monitoring and alerting tools , post deployment activities had to be coordinated across multiple teams safely to ensure no human error and post deployment incidents

More than 12 queues across 5 applications 50k to 70k messages in each queue

KPIs to be constantly monitored across multiple applications

3 to 4 times a week, minimizing outage to 4 to 5 hours. Mundane repetitive job

Coordination of release of queues and request across multiple applications

Change Coordinator or Incident Manager

Siebel Accelerated Systems Unified

Applications and Inventory

Products

Management

Order and Service
Management

Fusion Middleware

Ensuring health of all the downstream and target applications is not impacted

Service Restoration (Solution)

© 2018 SPLUNK INC.

Phase-1 : Dashboard
 Consolidated dashboard for real time KPI monitoring

Data Sources

Splunk Ingestion &
Indexing

Visual isation

SBL

OSM UIM

Splunk

Dashboard

FMW

BRM

Phase-2 : Automate
 Threshold based throttling

Data Input

Splunk Data Ingest

Backlog Cleared

Metrics
Application Updates

Data Ingestion

Phase-3 : AI

 Intelligent decisions based on real time performance resulting in efficient queue throttling

Data Input

Splunk Data Ingest

Monitor Decision Throttle

Backlog Cleared

Analysis & Indexing
Thresholds

Automated Actions
*Throttling
Machine Learning

· Data captured by custom scripts fed to Splunk via Universal forwarders · Based on the indexed data, KPIs (queue counts, DB sessions, Order Completion rate, In Progress work orders
etc) are monitored Real-Time by Splunk · Alerts configured with Script alert action & Splunk is notified to start throttling i.e. pause & resume using AI

© 2018 SPLUNK INC.
We applied Machine Learning to predict ticket priorities,
categories, assignees and resolutions

Client IT Service Operations has been selected as an initial area of focus for gaining efficiencies and productivity from the Intelligent Analytics
To prove the added value of innovation and make it complimentary to traditional data mining ­ Splunk and R Machine Learning was used on real Client data to predict the following service parameters:
· Ticket Priority · Categorization · Assignee · Resolution Categories

Client IT DATA
· Original data set: 50K tickets · ERP-filtered: 38K+ tickets

Model
9K+

Training
70%

Test
30%

Index
29K+

© 2018 SPLUNK INC.
Benefits realised
The implemented solution has delivered numerous benefits enlisted below

Cost Savings · Resource reduction · Man Hours Savings /
Year · Up to 50% faster queue
throttling
AI & Machine Learning · Reduced SME
dependency

Opportunities
Further Artificial Intelligence / ML within Operations space
Customer Experience · Reduced issues and
time to BAU, enhances Vodafone TNPS

© 2018 SPLUNK INC.

Key Takeaways
Machine learning enables comprehension
and actions

1. Data and opportunities for AI are
available, just need to know where to look for...
2. AI can make Operations a better place
3. Don't forget to stop by Accenture booth

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

