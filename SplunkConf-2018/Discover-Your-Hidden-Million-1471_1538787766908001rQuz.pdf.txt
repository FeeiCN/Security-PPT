© 2018 SPLUNK INC.
Discover Your Hidden Million Dollar Mainframe Treasure!
Monitor and Reduce your CPU Peaks
David McPherson
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Session Contents
1. Introduction 2. The Hidden Treasure within IBM's MLC billing model 3. My Treasure Chest ­ How we saved $1 Million per year 4. The Treasure Map ­ Where to find your hidden treasure 5. Treasure Hunting Tools 6. Key Takeaways 7. Q & A

© 2018 SPLUNK INC.

 25 years mainframe · Developer · Application Support · Operations Architect

Introduction
David McPherson

 Currently Manage a Team of 5 in Technology Operations · Automating support tasks · CPU peak reduction · Splunking the mainframe

© 2018 SPLUNK INC.

Introduction
 One of the 50 biggest banks in the world (according to Wikipedia)  Two z13 Mainframes
· 24 Logical Partitions (LPARs) · CPU capacity of 26,000 MIPS (3100 MSUs)  Software · IMS & Hogan · CICS & VisionPlus · DB2 & WebSphere · Syncsort Ironstream to pass mainframe data to Splunk

© 2018 SPLUNK INC.

The Hidden Treasure
Reduce CPU Peaks - Save $$$$
How does MLC "Sub-capacity Pricing" work? 1. Sum CPU of all LPARs 2. Calculate a 4 Hour Rolling Average (4HRA) 3. The MLC is calculated based on the peak 4HRA within the month

© 2018 SPLUNK INC.

IBM's Monthly License Charge (MLC)

© 2018 SPLUNK INC.

Each software product is billed only for those LPARs where that product is installed
4HRA for product A
· Afternoon peaks driven
by the green LPAR are as high as the overnight batch peaks
4HRA for product B · Product B does not run
on the green LPAR so it is excluded.
· Overnight batch period
is clearly the peak

© 2018 SPLUNK INC.
Counting the Treasure - Live MLC Dashboard

Eye Candy...
 Educates about product peaks  Conveys controllability

Does not tell a user...
 When a peak occurred  Actions to reduce

My Treasure Chest
Savings Obtained > 5% of MLC
 Tuning · Improved design · zIIP Compression · Syncsort MFX · Redundant jobs
 Dynamic batch delays ­ 170 jobs (532 MSUs) delayed  Changed LPARs of 60 jobs  Dynamic LPAR selection ­ job runs on the quieter CPC  Dynamic LPAR capping (cut 2% from peaks)

© 2018 SPLUNK INC.

Your Treasure Hunt Begins...
Objective...
 Reduce MLC by lowering the 10 different product peaks
· zOS · DB2 & MQ · IMS · CICS · COBOL · x2 Mainframe Systems

© 2018 SPLUNK INC.

Finding Your Treasure
Where should you start digging?
 When are your recurring peak periods?  Are you currently in a peak?  Which jobs/tasks contribute to the peaks?  Where are the biggest savings?  How do you encourage others to join your quest?

© 2018 SPLUNK INC.

Finding Your Treasure

© 2018 SPLUNK INC.

Where should you start digging?
 When are your recurring peak periods?  Are you currently in a peak?  Which jobs/tasks contribute to the peaks?  Where are the biggest savings?  How do you encourage others to join your quest?
We need a Treasure map

Treasure Map

© 2018 SPLUNK INC.

 Cost of running on different LPARs and at different times

Data for Map

© 2018 SPLUNK INC.

Static Data
 Products on each LPAR  Price per Product

Hourly
 CPU consumption of each LPAR · Batch query to BMC Mainview · SMF 30

Ironstream® Architectural Overview

IRONSTREAM

TCP/IP

DATA FORWARDER

DCE

IDT

Data Collection Extension Ironstream Desktop

Ironstream

SYSOUT Db2
Live/Stored SPOOL Data

!
USS Alerts
Networks Components

Assembler COBOL C, REXX
ForwarderAPI SYSLOG Application Data SYSLOGGD

SMF

RMF File Load Log4j

IMS

Product Peaks Dashboard
 Reveals Time-of-Day Patterns
 Pie chart showing contributing LPARs at peak

© 2018 SPLUNK INC.

Does not tell a user...
 Alternate LPARs
 Cost of their consumption ­ a job or an LPAR can contribute to multiple product peaks

Application Health Monitoring

© 2018 SPLUNK INC.

Basics
 SYSLOG · ACF or RACF violations · DB2 locks
 System Status · CPU · Memory
 CICS transactions (via SMF) · Response times · Transaction rates
 SYSOUT · Error monitoring

Customized
 Batch Monitoring (SYSLOG or SMF) · Forecast completion times · Failures · Job History
 Incoming/Outgoing files  IMS queues (via batch & API)  MQ stats  Calendar matching  User logon/logoff  Disk Space

© 2018 SPLUNK INC.

Key Takeaways

1. Identify your problem first, then design
the dashboard that helps you solve it
2. Understand your billing model
3. Big savings ­ easily obtained

© 2018 SPLUNK INC.
Q&A
David McPherson

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

