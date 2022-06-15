© 2018 SPLUNK INC.
Monitoring Kaiser Permanente's Open Enrollment with Splunk ITSI
A Kaiser Permanente and Splunk ITSI Professional Services Engagement
Felix Amoruwa | Kaiser Permanente - SOA Technical Product Management Nate Kwong | Splunk - Sales Engineering
October 2018 | Version 1.0

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Our Speakers

© 2018 SPLUNK INC.

v
FELIX AMORUWA
Kaiser Permanente IT, SOA Technical Prod Mgmt

NATE KWONG
Splunk Sales Engineering

Key Learning Objectives

© 2018 SPLUNK INC.
1. How Kaiser Permanente transformed
from manual to automated monitoring of Application, OS, and Infrastructure Service Health with Splunk ITSI
2. How Kaiser Permanente delivered Real-
Time Value for the Open Enrollment period
3. How Kaiser Permanente maximized ROI
on ITSI by making it a service offering for additional monitoring use cases for internal customers

Diving Deeply into Kaiser, Splunk ITSI, and Open Enrollment
Today's Agenda  Who is Kaiser Permanente?  Business Challenge:
Open Enrollment Apps and Systems Lack Visibility and Automation  KP + Splunk ITSI Success Framework  Implementation  Our Success and Business Impact  Business Benefits  Conclusion  Q&A

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Who is Kaiser Permanente?

Who is Kaiser Permanente?

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Who is Kaiser Permanente?
 KP-IT Splunk Shared Technical Service
· Splunk is currently offered to the KP-IT Enterprise as a Shared Technical Service within the Chief Technology Office.
· IT Operations: Any Splunk project use case ingesting log file datatypes (application and system level), which can
be indexed and processed to be searchable via a Splunk Dashboard governed by time series. IT Operations · Application Level ­ Log files from an external application
· System Level ­ Logs from an external/internal system (OS, back-end, etc)
· Business Operations: Any Splunk project use case ingesting non-log file datatypes (transaction metrics,
events, check-in's/check-out's, etc.), which can be indexed and processed to be searchable via a Splunk Business Dashboard governed by time series.
Operations
· Application Level ­ Transaction metrics from an external application · Delivery using the IT Service Management (ITSM) framework

© 2018 SPLUNK INC.
Business Challenge:
Open Enrollment Apps & Systems Lack Visibility & Automation

© 2018 SPLUNK INC.
Customer Discovery (ASG Open Enrollment) ­ Pain Points
 Application Services Group: Open Enrollment Sharepoint Implementation  Seeking an automated dashboard but automation was only available
for a handful of applications
 Landing page was non-existent  No information for automated status changes in current dashboard
interface (Sharepoint)
 ASG relied on manual work from 30 team members, to spend 5 mins, 3 times per day, from
October 1 ­ January 31 to make updates to the Sharepoint Dashboard
 (Convert to total # of hours and billable hours) ­ 30 members*5mins/day*3times/day*120days =
~900 hours *$50/hour = $45,000
 Sharepoint site status was manually updated with date/timestamp  No Automation!!

Customer Discovery (ASG Open Enrollment) ­ Address & Solve
 Application Services Group: Open Enrollment Sharepoint Implementation
 Objective: All Status KPIs would automatically changes  ASG team had to have a resource available to update their application
KPIs multiple times a day
 Production Support team had to manually update the KPIs which was
a goal to automate

© 2018 SPLUNK INC.

Customer Discovery (ASG Open Enrollment)
+7 clicks
for every app or service update
every time

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
KP + Splunk ITSI Success Framework

© 2018 SPLUNK INC.
Story
 Kaiser / Splunk ITSI PS Engagement
· In 2017, after attending several workshops over the span of two years after bringing Splunk
core in for the purposes of Audit Logging and Error Handling, and later expanding the product internally as a Shared Technical Service for the enterprise, our organization decided to launch a pilot with:

Evaluation of ITSI (Why ITSI?)

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Preparing for ITSI and a Success Framework
 Review and Audit Existing Splunk Configurations on up to 2 Splunk Instances
 Service Identification Workshop  Service Decomposition Workshop  ITSI Services Data Review  Glass Table Blueprint Session

© 2018 SPLUNK INC.

Additional Considerations for Framework Planning

 Overview ­ WBS  Technical Pre-Reqs (Team Members)  Pre-Work  Strategy, Policy, Governance  Roles and Responsibilities  Service MetaModel and Planning  Service Import  Entity Planning

 Entity Import  Integration Req. and
Planning  Naming Standards  Service ID and Decomp  Version Control  WBS-Session Agendas  IT Ops Metrics

Our Kaiser / Splunk ITSI Success Framework
 ITSI Program Policy, Strategy, and Governance
 ITSI Program Process and Planning  Service Model Lifecycle (Repeat)
· Identify (Service Model Identification) · Model (Service Model Definition) · Operate (Operationalize the Service Model) · Improve (Continuous Improvements to
Service Model and Operations)

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Implementation

© 2018 SPLUNK INC.

IT Service Tier IT Service Tier

Service Identification and Decomposition
Splunk ITSI Framework

IT Customer Facing Services in Support of Business Functions
Application Instances

IT Non-Customer Shared and Supporting Services
(Internal and External) Data Integration Services
Web Services Middleware-App Services
Database Services Vendor Hosted Services DHCP, DNS, Directory Services,
Authorization

Kaiser Permanente

National Electronic Data Interchange OE

FOUNDATION SYSTEMS

COMMON MEMBERSHIP

MEMBERSHIP FORMWORKS 5

MEDICARE BUSINESS ENGINE

National Electronic Data Interchange OE
California

National Electronic Data Interchange OE
ROC

National Electronic Data Interchange OE
Mid-Atlantic

22 Manual Monitored Services

Service Identification and Decomposition

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Installing, Configuring, & Deploying Splunk ITSI
 Search Heads
· ITSI Application on 1 stand-alone Search Head · The ITSI solution was setup on a 2nd search head prior to the
PS Engagement
· Later removed ITSI from the original search head
 Services, KPIs, Notable Events, & Glass Tables
· Reviewed and performed integrity checks on all Glass Tables · Defined a series of base KPI searches for monitoring Splunk as a Service · Defined several services around Splunk components that pull from the new base KPI searches defined. Additional ad-hoc KPI's were also defined within these
services
· Created a dashboard to represent the non-normal state services · Thresholding was adjusted in order to keep glass tables from turning red while tuning thresholds. They don't want executives getting the idea that there are trouble
services prior threshold analysis
· Extensive discussions around Entities and how entities relate to the service

Considerations for Single-View & Glass Tables
 Glass Table Design Considerations
· Who is your main audience?
Executives, Dept Heads, Leads, Support?
· How will the information be used?
Operationally, Strategically/Executive, Analytical?
· Who else will have access?
Other teams, business units, customers?

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Our Success & Impact

An Automated, Single View of All Services End-to-End

© 2018 SPLUNK INC.

Service Configuration (CM)
 Common Membership (Colorado, Georgia, Hawaii, Northwest)
· Search Query · Entity:
Split by Fields
· Calculation:
Average per Entity Max Aggregate over the past 5 minutes every 1 minute
· Thresholding:
Implemented for Scoring
· Color Schema:
Implemented for KPIs

© 2018 SPLUNK INC.

Service Configuration (CM)
 Common Membership (Colorado, Georgia, Hawaii, Northwest)
· Search Query · Entity:
Split by Fields
· Calculation:
Average per Entity Max Aggregate over the past 5 minutes every 1 minute
· Thresholding:
Implemented for Scoring
· Color Schema:
Implemented for KPIs

© 2018 SPLUNK INC.

Service Configuration (Formworks v5)
 Formworks v5 (Exceptions, Errors, etc)
· Search Query · Entity:
Split by Fields
· Calculation:
Average per Entity Max Aggregate over the past 5 minutes every 1 minute
· Thresholding:
Implemented for Scoring
· Color Schema:
Implemented for KPIs

© 2018 SPLUNK INC.

Service Configuration (Formworks v5)
 Formworks v5 (Exceptions, Errors, etc)
· Search Query · Entity:
Split by Fields
· Calculation:
Average per Entity Max Aggregate over the past 5 minutes every 1 minute
· Thresholding:
Implemented for Scoring
· Color Schema:
Implemented for KPIs

© 2018 SPLUNK INC.

Dashboard Design ­ Data Flow and Linkage

© 2018 SPLUNK INC.

Dashboard Design ­ Data Flow and Linkage

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Benefits

© 2018 SPLUNK INC.
Customer Discovery (ASG Open Enrollment) - Benefits
 Application Services Group ­ Open Enrollment · Full user feedback was non-existent from the previous Sharepoint perspective · Availability of the statuses of the application; who was logging in to the dashboard, reviewing the dashboard, and making changes · OECC (OE Command Center) benefited with another level of visibility to check updates to application · Was able to address support issues and concerns by having an additional set of dashboards to compare status of application health

© 2018 SPLUNK INC.
Customer Discovery (ASG Open Enrollment) ­ Manual to Automated
 Application Services Group ­ Open Enrollment · Overall Health to Individual Application Health Visibility · Several Applications were automated · Automating all of the applications resulted in saving ~900 hours of operational expenditures through the Open Enrollment period · Understanding the viewers and their feedback on having the automation available from executive team/leadership on down.

© 2018 SPLUNK INC.
Conclusion

Key Takeaways

© 2018 SPLUNK INC.
1. Manual to Automation of Application,
OS, and Infrastructure Service Health
2. Delivering Real-Time Value for the ASG
­ Open Enrollment
3. Offering ITSI internally as a Service
Offering for additional monitoring use cases for internal customers.

© 2018 SPLUNK INC.
Q & A

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

