© 2018 SPLUNK INC.
Business Oriented Proactive Monitoring at Capital One
Geethanjali Gopal Suman Ojha
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
Introduction

Who We Are
 Suman Ojha
Sr. Data Engineer Capital One

© 2018 SPLUNK INC.
 Geethanjali Gopal
Director of Software Engineering Capital One

© 2018 SPLUNK INC.
Ensuring High Reliability of Identity Services is
critical to our business

© 2018 SPLUNK INC.
Technology advancement brings new challenges

Log

Cloud

Complex Data Lineage

Proliferation Log Proliferation

Complex Data Federated Architecture

Log Proliferation

Log Proliferation

Federated Architecture Log Proliferation

Test Me

Technology vs Experience

Log Proliferation

Test

Test Me

Test

Test Me
Tool Proliferation

Lineage

Don't use me

Why Test Why Test

Complex Data Lineage
Federated Architecture

Test Me

Complex Data Lineage
Micro-Services

Technology vs Experience

Don't use me

Too much irrelevant information

I am so irrelevant

Log Proliferation

Technology vs Experience

I am so irrelevant Don't use me

Alert Fatigue

Technology vs Experience

I am so irrelevant
Technology vs

Federated Architecture Alert Fatigue

Don't know what to test Don't know what to test
Alert Fatigue1

Experience

Test

© 2018 SPLUNK INC.
Business-Oriented approach focuses on delivering value early and often
MVP1 MVP2
Continuous improvement
Business
Payments Processed, Accounts Opened, Sales Completed
Service
API Endpoints, End User
Application Container
Threads, Heap, Connection Pools, JMS Queues
Machine
CPU, Memory, Disk, Network Interface,
Infrastructure
VPC, ELB, S3, CloudFront
Unified drillable dashboards, actionable metrics, high-fidelity alerts

© 2018 SPLUNK INC.
Methodical approach to monitoring using Gartner use case management framework
Ref: Gartner use case management framework
· Identify use cases · Prioritize use cases (log inventory, tool inventory) · Implement use cases · Review use cases -> Optimize or Retire
Treat use cases that are not actionable as defects

Use Case Template
Ref: Gartner use case management framework

© 2018 SPLUNK INC.
· Log Inventory · Tool Inventory

© 2018 SPLUNK INC.

Understand and improve monitoring by actively managing monitoring use cases

Reason infeasible use cases and fix critical issues

Actively manage security monitoring use cases

Actively retire use cases and manage them as defects

· Develop use cases · Conduct feasibility exercise · Implement/optimize/update
Ref: Gartner use case management framework

© 2018 SPLUNK INC.
Business oriented approach with end to end drillable view
Are my business features meeting SLAs?

Business metric view

API view of a business feature

Deep Dive into one business feature

Is my API healthy ­ one page view of business health of an API

Is my stack Healthy - One Page view of environment health of the entire stack

Deep Dive into one service

© 2018 SPLUNK INC.
Bird's-eye view of end to end business performance of all business features

Detailed View of Business Performance of Specific API

Is my stack Healthy - One Page view of environment health of the entire stack

© 2018 SPLUNK INC.
Bird's-eye view of end-to-end business performance (contd.)

© 2018 SPLUNK INC.
Drill-down view of business performance of one business feature

Business Performance View

Geo View

© 2018 SPLUNK INC.
Central API view of all services that make up a business feature

© 2018 SPLUNK INC.
Detailed view of API performance ­ standardized view

© 2018 SPLUNK INC.
Systems view of an entire stack that hosts a service

Systems view contd.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Decisioning actions can be automated on High Fidelity Alerts

 Learn the threshold with data
 Review the pattern for similar datasets over a period of time · Comparison over 90 days time period and
remove outliers
 Follow multi-prong approach to automate decisioning/action · No. of prongs based on business needs

Hard Code Threshold
login trend changes through out the day so hard coding did not work
Previous Day Comparison
Trend changes through out the week so comparison with previous day did not work
Comparison over 90 days time period and remove outliers
Average(count over last 15m) > 1.2(95th percentile (data set of 15m averages for identical daily time block (prior 90 days )))

Key Takeaways

© 2018 SPLUNK INC.

 Make your system observable starting with selected metrics  Succeed by applying a business oriented approach to monitoring
· Deliver value early and often · Avoid tools/infra rabbit holes · Create standards/spec  You don't have to break the bank to build next generation monitoring · Maximize usage of existing tools/data · Build unified, drillable dashboards with actionable metrics · Create high fidelity alerts  Bake monitoring use cases into feature delivery
· Use Gartner framework

