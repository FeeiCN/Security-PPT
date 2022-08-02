© 2018 SPLUNK INC.
Reaching Cloud Nirvana in a Multicloud World
Kam Amir | Cloud Architect Subu Baskaran | Product Manager kam@splunk.com | sbaskaran@splunk.com
October 2018 | Version 1.0

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Agenda
 Speakers  Challenges of the Multicloud world  Path to Cloud Nirvana  Splunk's Evolution to Cloud  Hybrid Cloud with Splunk  Splunk Insights for Multicloud at the innovation lab

© 2018 SPLUNK INC.

Speakers

© 2018 SPLUNK INC.

v
KAMILO "KAM" AMIR
Splunk Cloud Architect

SUBU BASKARAN
Cloud Product Manager

© 2018 SPLUNK INC.
""Your firm is a Multicloud organization
today, but it probably got there by accident. Move from accidental Multicloud to strategic Multicloud"
A Clear Multicloud Strategy Delivers Business Value" - Forrester

© 2018 SPLUNK INC.

Multicloud Pairing
Popular pairing of public clouds

© 2018 SPLUNK INC.

AWS + Azure

Cloud AWS + GCP

AWS + Azure + GCP

AWS + VMWare
Splunk Cloud August 2018

Challenges of the Multicloud World

© 2018 SPLUNK INC.

Challenges of the Multicloud World

© 2018 SPLUNK INC.

Tools

Tools

Tools Tools

Dev Team

Dev Team

Dev Team Security Team

 It starts with one team and quickly spreads
 Too many tools  No overall visibility  No consistent security / governance
policy  Shadow IT

© 2018 SPLUNK INC.
Visibility
"All Apologies," developers asking the IT for help
First step is getting visibility into your various clouds both public and private, centralize logging and start building an inventory of what you have.

Start by normalizing your cloud deployments into one data platform

Splunk > Cloud CIM

Leverage existing Technology Add-ons from Splunk to collect data from cloud platforms

Splunk+ Dev Team

Splunk+ Dev Team

Splunk+ Dev Team

Splunk + Security Team

Create single dashboard to gain visibility into your various cloud deployments

© 2018 SPLUNK INC.

Visibility
"All Apologies," developers asking the IT for help

First step is getting visibility into your various clouds both public and private, centralize logging and start building

an inventory of what you have.

AWS:

· Splunk App for AWS

· Splunk Add-on for AWS

· Splunk App for Guard Duty

· Splunk Add-on for Kinesis Firehose

Splunk > Cloud CIM

Splunk+ Dev Team

Splunk+ Dev Team

Splunk+ Dev Team

Splunk + Security Team

Azure: · Splunk Add-on for Microsoft Cloud Services · Azure Monitor Add-on for Splunk · Microsoft Azure Template for Splunk · Microsoft Azure Billing Add-on for Splunk · Microsoft Azure Inventory Add-on for Splunk · Microsoft Azure Active Directory Reporting Add-on
for Splunk
Google Compute: · Splunk Add-on for Google Cloud Platform

Value
Work together and gain insight from your Multicloud, build a strategy

© 2018 SPLUNK INC.

Splunk > Cloud CIM

Make data driven decisions when selecting which cloud to use
Intelligently deploy Application Workloads
It's not just a cost decision, but a "best of breed discussion."

Splunk+ Dev Team

Splunk+ Dev Team

Splunk+ Dev Team

Splunk + Security Team

Velocity
Developers, "Come as You Are"
Splunk > Cloud CIM

© 2018 SPLUNK INC.
 Rapid Deployment  Infrastructure as
Code testing  CI/CD validation  Securing Cloud
resources

Splunk+ Dev Team

Splunk+ Dev Team

Splunk+ Dev Team

Splunk + Security Team

Splunk + QA Team

Splunk + Mobile Team

Evolve
Transforming your application to the cloud
 Quickly evolve application to "Cloudy" version
 Unleash your app to take advantage of all the Cloud resources
 Leverage Splunk to help with your migration from monolithic to microservices · Security · Operations · Cost Analysis · Performance Analysis · Build into DevOps Process

© 2018 SPLUNK INC.

Splunk's Evolution to Cloud
"Something in the Way" Splunk in the Cloud to Stateless Cloud
 Splunk on AWS !=Service, Splunk Cloud = Service  Scale, automation and configuration management  DevOoops  Understand customer's uses of product, gear it towards strength, cut out waste  Learn from us J

© 2018 SPLUNK INC.

Server Applications Storage
Server Databases
Datacenter

Server Applications
Storage Server Databases

Hybrid Cloud with Splunk
Hybrid between on premises and cloud

© 2018 SPLUNK INC.

 Splunk as an example · While migrating off on premises hardware, setup hybrid to search older data. Once it ages off,
shutdown legacy indexers.
· Cutover forwarders to Cloud and collect only in Cloud · Migrate primary workload to Cloud, keep dev / test on premises or in a less expensive cloud

Search Head Indexer Indexer Indexer Forwarder Forwarder Forwarder

Search Head Indexer Indexer Indexer

Forwarder Forwarder Forwarder

Hybrid Cloud with Splunk
Hybrid spread across clouds not recommended

© 2018 SPLUNK INC.

 Splunk as an example
· Separating indexers from search heads to `save cost' will end up hurting performance and
cost more in the long term
· Transit costs can add up when dealing with Bundle Replication etc.
· Latency over different networks and varying machine types can spell trouble search
performance

Search Head

Forwarder

Indexer

Indexer

Forwarder

Hybrid Cloud with Splunk
A case for Hybrid: HA/DR / Dev stack
 Splunk as an example · Centralize Splunk into one cloud and forward data into that single cloud. · This saves on transit costs and increases search performance. · Create DR/HA with multiple regions / clouds to safeguard against
disasters using replication or sync of configurations
· Create a Dev Stack to test changes to your Splunk Apps before going to
production. Use less expensive `spot' instances stack.

© 2018 SPLUNK INC.
Forwarder

US West 1

US East 1

DR Search Head
Indexer Indexer Indexer

Replicate configs

Search Head Indexer Indexer Indexer

Forwarder Forwarder

© 2018 SPLUNK INC.
Splunk Demo
Presented by Kam Amir

© 2018 SPLUNK INC.
All Clouds, One View

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Key Takeaways
Cloud Nirvana, Achieved

1. Multicloud is a part of your strategy now
2. Get visibility into your clouds
3. Get value from your cloud investment
4. Work with the business to make your
applications suited for cloud

Cloud Nirvana
Security, Operations, and the Business together
 Security can see across the cloud platforms  Operations can intelligently deploy workloads across clouds  Business can operate at scale securely without taking down operations

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk Insights for Multi-Cloud at the Innovation Lab
Go see what's next for Splunk Cloud

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

