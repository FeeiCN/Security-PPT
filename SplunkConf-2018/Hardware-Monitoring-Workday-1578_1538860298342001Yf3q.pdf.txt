Splunk .conf18 Hardware Monitoring @
Designing and Deploying a 24x7 Service
Jordan Perks James Barnes Soham Roy
October 2018 | Version 1.3

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
Center of Excellence
Presenter: Jordan Perks

Splunk Center of Excellence
 Architecture · Platform as a service · Design · Maintenance and Upgrades
 App Dev · Creation of apps for security team · Creation of Workday Add-on for Splunk · Enterprise Security and ITSI Administration
 Customer Support · Office Hours · User Training and Enablement · Encouragement of power user self-sufficiency

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Service Overview
Presenter: James Barnes

Standing on Shoulders
Little additions can make big impacts
Splunk App Splunk Add-on
Workday Center of Excellence (Splunk Administration)
Splunk Enterprise (~150 Splunk servers)

© 2018 SPLUNK INC.

Objective
Here's your challenge...
 Find amber lights failures for 20,000+ servers  The existing product being sunset ­ be quick!  Develop a 24x7 service  Use limited resources (2 engineers)  Keep data in-house (new rule)  Integrate the service with existing tools
· Jira · Slack · DCIM DB

© 2018 SPLUNK INC.
Amber Lights Finder Nickname is Alf

© 2018 SPLUNK INC.

"Alf is saving dc-ops time and money. It
improves server reliability and uptime, and just plain kicks ass."

Ken Hartman Director of Infrastructure Data Centers

Happy Customer

Command Config File

Design
System Operation

Reports Dashboards

Alf Python Add-on 1/2h cron

20,000+ servers

Alf App 1h cron

Alerts

© 2018 SPLUNK INC.

Example Linux Commands
Executed every 30 minutes
 Common · /usr/sbin/dmidecode -qt chassis · /bin/echo -n 'uptime: '; /usr/bin/uptime · /bin/netstat -i
 Dell (omreport) · /opt/dell/srvadmin/bin/omreport storage pdisk controller=0 · /opt/dell/srvadmin/bin/omreport system esmlog · /opt/dell/srvadmin/bin/omreport chassis fans
 HP (hp-health) · /usr/sbin/hpssacli ctrl slot=0 pd {drive} show detail" · /sbin/hpasmcli -s 'show server' · /sbin/hpasmcli -s 'show dimm'

© 2018 SPLUNK INC.
~50GB/day

Ten-Layer Alerting Pipeline
One macro per layer
 Get Current Data  Add Category Error  Add Category Details  Add Targeting  Prune for Category Errors  Prune for Hard Errors  Prune for Installed Status  Prune for New Tickets  Add Trigger Action Information  Gatekeeper

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Alert Statistics

First 6 months of 2018

~260 tickets/month

Disks: 35%

43%

Raid Battery: 8%

0 False Positives
1556 Automated
Tickets

Fans: 29%

Power Supplies: 16% Impacting Hardware Failures by Quarter

DIMMs: 12%

Lessons
If you are building a service like this...
 Keep it simple · With this many servers, you will see more error scenarios than you can process
 Create an app right away · Migrating a live service out of the search sandbox is complicated · Need the directory structure for source code control · Role-based access becomes possible
 Build an alerting pipeline · Define the layers and stick to them · New alerts are common additions · Use macros for code containment (DRY principle)
 Pounce on data-collection requests · Leads to new customers, new ingestion sources, new dashboards, new reports

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Service Deployment
Presenter: Soham Roy

The Problem
How do we get from "here" to "there"?

DEV

DC1

DC2

DC3

DC4

DC5

© 2018 SPLUNK INC.
DEV US EU

Breaking Things Up
The separation of code and configuration
 Modularizing deployment · Code (the Alf app) · Configuration (Splunk TA, Splunk universal forwarder, additional files)
 Code · Stand-alone app · Install as python package · Future: separate from system python (platform-independent)
 Configuration · How does python package get installed? · How does data from Alf get processed/flow into Splunk? · Chef cookbooks + TA-Alf

20,000+ Baremetal Servers

© 2018 SPLUNK INC.

Code Pipeline
Getting Alf where it needs to go
BMP

+2?

MGMT

Change

+1?

Peer

Yum Repo

Release Notes

© 2018 SPLUNK INC.

Configuration Pipeline
Making Alf feel at home
BMP
+2? +1?
Integration

© 2018 SPLUNK INC.

To Splunk
(And Beyond!)

© 2018 SPLUNK INC.

Universal Forwarders

Every 30 min

Indexer(s)

0-5 min

DEV

US

EU
Search heads

Key Takeaways
Business Problem Solved

© 2018 SPLUNK INC.
1. Expanded the business value of Splunk
outside of our security organization
2. Made a simple design highly scalable
3. Delivered a complete solution in under
90 days
4. Saved money by reducing false
positives and increasing customer uptime

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Q&A
Jordan Perks | Security Manager James Barnes | DevOps Engineer
Soham Roy | DevOps Engineer

