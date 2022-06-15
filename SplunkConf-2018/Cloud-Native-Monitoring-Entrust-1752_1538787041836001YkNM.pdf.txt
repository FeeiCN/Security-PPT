© 2018 SPLUNK INC.
Cloud Native Monitoring at Entrust Datacard with Splunk
Daryl Robbins, Sr. Enterprise Cloud Architect, Entrust Datacard
Kara Gillis, Director of Product Marketing, Splunk

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Our Speakers

© 2018 SPLUNK INC.

v

DARYL ROBBINS
Sr. Enterprise Cloud Architect Entrust Datacard

KARA GILLIS
Director, Product Marketing Splunk, IT Markets

Agenda
What We Will Cover Today

© 2017 SPLUNK INC.
1. Intro to Splunk 2. Entrust Datacard: Who We Are 3. Creating a Unified Data Platform 4. Monitoring and Intelligent Investigations 5. Incident Management 6. Demo 7. Best Practices

What Does Machine Data Look Like?

© 2018 SPLUNK INC.

Order Processing
Middleware Error
Care IVR

Twitter
Sources

Your Machine Data is Telling a Story

Customer ID

Order ID

© 2018 SPLUNK INC.
Product ID

Order Processing

Middleware Error
Care IVR

Time Waiting On Hold Customer ID

Order ID Twitter ID

Customer ID Customer's Tweet

Twitter

Company's Twitter ID

Sources

6

Any Question, Any Data, In Real Time.

© 2018 SPLUNK INC.

Single Platform, Many Lenses

Performance at Scale

Open Ecosystem

Hybrid

Artificial Intelligence

Finding Answers You Need to Take Action

© 2018 SPLUNK INC.

IT Operations

Application Performance
Analytics

Security and Compliance

Business Analytics

Internet of Things

How do I predict service-level degradation before it occurs?

Is my poor app performance due
to code-level errors or
infrastructure?

How can I speed up security
investigations and reduce the impact of insider threats?

Do my marketing campaigns drive
more orders through the website or mobile
app?

How can I monitor and analyze data
from tens of thousands of sensors in real
time?

© 2018 SPLUNK INC.
Splunk is Trusted by Brands Around the World, Supported by a Deep Ecosystem

IT Operations

App Performance Analytics

Security & Compliance

Business Analytics

Internet of Things

Infrastructure Monitoring Challenges
Infrastructure monitoring isn't new, but constantly changing demands require a new approach

© 2018 SPLUNK INC.

MONITORING AND TROUBLESHOOTING
IN SILOS

INCREASING COMPLEXITY MAKES IT HARDER TO FIND
AND FIX PROBLEMS

SPENDING TOO MUCH TIME ADMINISTERING MONITORING
SOFTWARE

" Why am I monitoring with one tool and troubleshooting with another?"

" Applications keep getting more complex and I'm required to monitor more than ever and find problems faster!"

" We don't have enough resources to buy and maintain complex monitoring tools."

© 2018 SPLUNK INC.
Introducing Splunk Insights for Infrastructure
Seamless metrics and logs analysis / easy to deploy and use / inexpensive

A NEW monitoring product from Splunk

 Collects, correlates and analyzes metrics and logs to monitor on-premises (Windows and Linux) and AWS server infrastructure
 Designed and optimized for infrastructure monitoring ­ from configuration to infrastructure problem investigation
 Start FREE for small environments and inexpensively for larger environments

What is VictorOps?

© 2018 SPLUNK INC.

Integrations across monitoring, CI/CD pipeline and collaboration/chat tools for a single view into alerts

 On-Call scheduling made simple
 Centralized visibility to alerts
 Collaborative Incident Response
 Post-Incident Reviews and Reporting
 Actionable Mobile Application

© 2018 SPLUNK INC.
VictorOps connects your software engineers with right information

© 2018 SPLUNK INC.
Cloud Native Monitoring
Entrust Datacard's journey towards a Cloud Native monitoring solution with Splunk

© 2018 SPLUNK INC.

$600M
revenue

2,000+
employees

© 2018 SPLUNK INC.

34+
locations worldwide

16

© Entrust Datacard Corporation. All rights reserved.

10M+
identity and payment
credentials issued daily

Sales and service in
150+
countries

Trusted Identities Secure TransactionsTM

If you can trust the identity

You can trust the transaction

Payments

PRIMARY MARKETS Digital Security

CORE CUSTOMER SEGMENTS

CONSUMER
Revolutionize the Consumer Experience

17

© Entrust Datacard Corporation. All rights reserved.

CITIZEN
Connect Citizens & Governments

ENTERPRISE
Secure Your Place in the Cloud

INTELLITRUST OFFERING
PURPOSE-BUILT SaaS PRODUCT
AWS public cloud Agile development Multi-tenant, multi-tier
SaaS BUSINESS MODEL
Trial capabilities, easy onboarding Frictionless user experiences Flexible & dynamic -- subscription pricing
- Per User - Per Transaction
REPUTATION FOR SECURITY & IDENTITY
Security & identity in our DNA Leverage learnings of IDG High-assurance use cases Enterprise complexity

© 2018 SPLUNK INC. Copyright Entrust Datacard 18

IntelliTrustTM Architecture

© 2018 SPLUNK INC.

Deploy
Infrastructure Build
Deploy
Application Build

Amazon CloudFront

Application Load
Balancer

Amazon ECS

Amazon Aurora
Amazon ElastiCache

Monitoring

Amazon Amazon

AWS

Inspector CloudWatch CloudTrail

AWS Config

Amazon EC2 Systems Manager

Pillars of Observability
Types of Monitoring Data

© 2018 SPLUNK INC.

Low Volume Request Scoped Metrics

Metrics
Aggregatable

Tracing
Request Scoped

High Volume
ID: 350646

Request Scoped Events

Source: Monitoring Modern Services and Infrastructure

Logging
Events

Aggregatable Events
Request Scoped, Aggregatable Events
© 2018 Gartner, Inc.

Creating a Unified Data Platform
Architecture, DevOps toolchain

© 2018 SPLUNK INC.

VictorOps
Incident from Splunk

© 2018 SPLUNK INC.

App Manager
Summary of incidents

© 2018 SPLUNK INC.

AWS Dashboard
Overview of your account

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
App for Infrastructure Demo
Presented by Daryl Robbins
https://youtu.be/QCvZ1Buc2VM

Our Splunk Architecture

© 2018 SPLUNK INC.

Architecture Deep Dive
View of a Single Region

© 2018 SPLUNK INC.

Not actual data. For illustration purposes only.
Scalability
PM Peak AM Peak

© 2018 SPLUNK INC.

Baseline Workday Capacity

Copyright Entrust Datacard 29

Splunk Scalability

© 2018 SPLUNK INC.

How does it handle increases in log volume?
 Splunk can horizontally scale by adding more indexers
· However, being a persistent workload, you can't easily scale down by removing indexers (like Casandra and other NoSQL DB's)
 Options for tackling scalability of log volumes
· Over provisioning · Buffer logs during peaks (HEC, Kinesis, etc..) · Some combination of the two
 We decided on over provisioning to avoid data latency  Alert on buffering

Key Takeaways
Using Splunk for Cloud Native Workloads

© 2018 SPLUNK INC.
1. Use DevOps approach for implementing monitoring
· Dev involvement · Automation
2. Iterative approach
· Feedback loop from operational experience to design
3. Design monitoring into the application
· Publish application metrics · Optimize log messages
4. Embrace the CIM and develop your own data
models to simplify comparing related data
5. Monitor your monitoring tools
6. Leverage experts

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

