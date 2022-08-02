© 2018 SPLUNK INC.
Orchestrating an Improved Customer Experience
Utilize Splunk ITSI Insights to Drive Automation
Scott Hamrick | PwC, IT Director ­ Operations Analytics Patrick Combs | TCS, Data Analytics Leader
October 2018 | Version 2.0

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Today's Speakers

© 2018 SPLUNK INC.

v

PATRICK COMBS
TCS, Data Analytics Leader

SCOTT HAMRICK
PwC, IT Director ­ Operations Analytics

PricewaterhouseCoopers
Our purpose is to build trust in society and solve important problems
 Globally - 223,468 people in 743 locations in 157 countries
 46k partners and staff in the US  Provide industry-focused
assurance, advisory and tax services for over 90% of the companies in the Fortune Global 500 list

© 2018 SPLUNK INC.

Problem Statement
Implementing & Measuring Analytic Value

© 2018 SPLUNK INC.

Sub-optimal IT processes
 Large, complex environment  Frequent Change Requests  Random outages  Slow resolution time for failures  Lack of confidence from end users

Overall Impact
 Increased support costs  Extensive manual effort  Extended unplanned downtime  Negative customer feedback  Rogue IT efforts

Utilize analytics to automate issue resolution

Imagine the Possible: What If?
Implementing & Measuring Analytic Value

© 2018 SPLUNK INC.

Anomaly detection
Identify failure points quickly

Repeat process

Determine scope & impact

Calculate success

Automate resolution

Measure Improvement & Impact
Reduce cost Automate manual tasks Eliminate unplanned downtime Reduce MTTR for Incidents Quantify / Track User Experience

Data leads to action...action to results...results to value

© 2018 SPLUNK INC.
IT Operations Analytics
"Sunlight is said to be the best of disinfectants"
Justice Louis D. Brandeis

PwC ITOA Mission
Enabling & Measuring Superior Client Experience

© 2018 SPLUNK INC.

Holistic approach to data analytics
 Become "The" source of information  Aggregate all relevant data  Organize complex data sources  Offer guided navigation  Provide targeted data detail

Critical Success Factors
 Quantify / Track User Experience  Eliminate unplanned downtime  Reduce MTTR for Incidents  Improve IT capacity management  Remove Manual Reporting

Measure and improve end-to-end user experience

Pyramid of TransparencyTM
Data targeted to organizational role

Executive

System Health

Domain Leads

Strategic Planning

Team Leads

Tactical Execution

Administrators

Troubleshooting

End User Experience

© 2018 SPLUNK INC.
uberAgent ITOA ITSI

© 2018 SPLUNK INC.
ITSI Driving Applied Analytics Through ITOA
Key components required by ITOA app
 ITSI Service / KPI Definitions  ITSI Entity and Base Searches  ITOA Lookups  ITOA Weighted Average Macro  ITOA Framework to present results

IT Operations Analytics Product
Executive-level health score overview

© 2018 SPLUNK INC.

Customized app providing near real-time visibility of service health
 Core Services  Applications  Infrastructure  Service Management

Top 5 Reactions to ITOA

© 2018 SPLUNK INC.

Feedback we most frequently received
1. Splunk is the key to every initiative we have planned for the next 5 years! 2. OK, what's next?? 3. What does Splunk say about... 4. That's great, but can it do _____? 5. Wait...what??

© 2018 SPLUNK INC.
Applied Analytics
"Analytics without action are less valuable"
Anonymous CTO

New ITOA Mission
Utilizing Analytics to drive automation

© 2018 SPLUNK INC.

Executive Domain Leads

Team Leads

Administrators

Orchestration

Integrate analytics with Automation
 Define metrics through ITSI  Measure anomalies  Orchestrate alerts to initiate action  Resolve issues near real-time  Eliminate re-occurrence

This is great...but its only the first half of the solution

Orchestration Workflow

Problem Mgmt

Identify reoccurring
issues

© 2018 SPLUNK INC.

Splunk to Orchestration Architecture
Key components enabling orchestration
 Utilize each platform's strengths  Tool agnostic  Utilize standard Splunk alert feature  Implement new Alert Action  Deliver only actionable events  Format data to meet orchestration needs

© 2018 SPLUNK INC.

Orchestration Paths
Alerts generated through IPCollector integration

© 2018 SPLUNK INC.

Notification
 Email  SMS  Key field values
· To · From · Subject · Body · Issue Details · KB article

Service ticket creation
 ServiceNow API integration
 Incident  Request  Key Field values
· Requestor name · Hostname · IP address · Issue Details

Script execution
 Custom development
 Value assessed
 Script maintained and executed through orchestration platform
 Key Field Values
· Hostname · IP Address · OS

© 2018 SPLUNK INC.
Automation Examples
"If nothing changes, nothing changes"
Courtney C. Stevens

Application Performance
Failed SQL Job Management

© 2018 SPLUNK INC.

Identify and Escalate
 Create standard alert  Monitor for failed jobs  Format results as table  Utilize custom alert action

Application Performance
Failed SQL Job Management

© 2018 SPLUNK INC.

Deliver to Orchestration
 IPCollector receives alert  Forwards details to
IPCenter  Actionable Event is created
in IPCenter

Application Performance
Failed SQL Job Management

© 2018 SPLUNK INC.

Orchestration Takes Action
 Regex matching identifies appropriate workflow
 Branching script tasks initiate
 Success or failure managed by workflow

Infrastructure - Platform
Virtual Machine Resource Allocation

© 2018 SPLUNK INC.

Identify Over-Allocated VMs
 Report utilization over time  Identify VMs for resizing  Trigger alert to IPCenter to
subtract resources based on utilization

Endpoint Analytics
Low Disk Space

© 2018 SPLUNK INC.

Disk Space Issues
 Identify low disk space on end-user laptops
 Deploy resolution proactively
 Continually monitor for reoccurrence

IT Service Management
Automate Report Generation and Distribution

© 2018 SPLUNK INC.

Queue Management
 Repurposed dedicated reporting team
 Identify Aging Incidents  Deliver Reports to large
audience

© 2018 SPLUNK INC.
Delivering Analytic Value

 Cost out (--$$$) · Hardware Capacity · Resource Allocation · Manual Administration · Labor reduction · Eliminate lost time
$1.5M in cost elimination

Measuring Results
How are we successful?

© 2018 SPLUNK INC.

 Hours saved (++Time) · Contact Reduction · Report Automation · Delivery Notification · Incident Resolution Time

 Quality (--Defects) · Automated workflow · Consistent Execution · Immediate Response · Simplification

6,000 employee & contractor hrs

99% reduction in downtime

Next Steps
Enabling & Measuring Superior Client Experience

© 2018 SPLUNK INC.

Analytics Factory
 Expand ITSI Service Creation  Extend Actionable Analytics platform-wide  Build Analytic inventory  Integrate with Orchestration Platforms

Critical Success Factors
 Reduce customer support calls  Eliminate unplanned downtime  Reduce MTTR for Incidents  Reduce manual administration

"All hail our new robot-overlords!"

© 2018 SPLUNK INC.

Key Takeaways

1. Building an analytics foundation 2. Foundation enabled actionable analytics 3. Factory approach drives value

© 2018 SPLUNK INC.
Q&A

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

A Little More About Us...

© 2018 SPLUNK INC.

Patrick Combs
TCS, Data Analytics Leader  18+ yrs combined experience at PwC
· Web Development · Database Reporting · Platform Services · Data Analytics
 Soccer coach and cyclist

Scott Hamrick
PwC, IT Director ­ Operations Analytics  20+ yrs combined experience with GE/PwC
· Networking (CCNP) · InfoSec (CISSP) · Data Analytics
 Softball professional, RiffTrax backer

