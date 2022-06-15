© 2018 SPLUNK INC.
User Experience Performance Testing With Splunk at Paychex
Monitoring application performance across multiple architecture components
Brian Dudiak | Manager, Performance Engineering, Paychex Inc. Dr. Kenneth Tupper | Lead Performance Engineer, Paychex Inc. May 2018 | Version 1.0

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Our Speakers

© 2018 SPLUNK INC.

v

BRIAN DUDIAK
Manager, Performance Engineering

DR. KENNETH TUPPER
Lead Performance Engineer

MODERATED BY GREEN TRACKSUIT

Agenda
 Paychex Inc.  Splunk infrastructure at Paychex  Data collection process across technologies  Who uses the data and how?  Full-stack Splunk dashboard demo  Behind the scenes of the dashboard  Looking to the future with Splunk at Paychex

© 2018 SPLUNK INC.

Paychex Inc.
Payroll ­ HR ­ Retirement ­ Insurance

© 2018 SPLUNK INC.

Then
 Founded in 1971 by B. Thomas Golisano  $3,000 and a credit card  Payroll for small businesses  One employee

Now
 46+ years industry experience  14,300+ employees*  Serves 650,000 payroll clients*  1M worksite employees served*  #20 largest insurance agency in the U.S.  #1 401(k) plan recordkeeper
*figures as of May 31, 2018

Splunk Stats at Paychex
Some quick stats on the scale of Splunk at Paychex

© 2018 SPLUNK INC.

260TB 250GB

30

6,387 250

Total storage across two data centers

Data growth per quarter

Number of indexers @ 12CPU & 24GB RAM

Number of unique
dashboards across
3,000 apps

Unique users per day

© 2018 SPLUNK INC.
Data Collection Across Technology and
Infrastructure Stacks
Splunk solution across multiple technology stacks

Technologies Supporting Paychex
How to centralize data across technologies

© 2018 SPLUNK INC.

 Difficult to find a centralized data source across many different technologies · Higher MTTR · Higher costs to implement, support and use multiple tools · Unable to stitch data together across toolsets and technologies · Eight days locked in a room to triage an issue turned into an hour
 How do we get multiple groups to consume this data?  Require a tool to feed cross-functional groups across our IT organization

Data Collection Standardization
Solution to collect and correlate data

© 2018 SPLUNK INC.

Traceability
 A standard for transaction logging in critical applications · Enables us to stitch events together · Improve problem resolution and MTTR
 Implemented across application and technology stacks
 Stopped at database tier

Marks and Measures
 Four primary targets for marks and measures · Web application tier · Business service tier · Storage/database tier · Network appliances · Routers, proxies, etc...

Without Splunk, correlating this data would take days

Consumable Throughout SDLC
Different levels of users need access to information

© 2018 SPLUNK INC.

 People from all areas of our IT organization need to be able to access and consume the information

Product

Support

Development

Production Monitoring

Performance

Who Uses This Data?

© 2018 SPLUNK INC.

Product
 Client workflows by demographic  Usage patterns  New feature adoption  A complement to Google Analytics

Development
 Faster triage of bugs and root cause analysis  Same base queries used throughout SDLC  Enables performance testing to push left

Who Uses This Data?

© 2018 SPLUNK INC.

SHO / Capacity
 Provides performance views weekly to senior and executive management

Development
 Understand client impact of issues and be proactive in reaching out to clients
· Reduced error rate by 41% in FY18
 Faster MTTR
· ~40% reduction in MTTR between FY16
and FY19

WebLogic code release timeline

© 2018 SPLUNK INC.
User Experience Reporting/
Dashboard Demo
Splunk dashboards for monitoring user experience across the architecture stack

User Experience Reporting
How the dashboards work

© 2018 SPLUNK INC.

 Common traceability log format used for all data collected, regardless of originating application tier (web servers, application servers, database)
2018-06-13T07:21:00.223-0400, severity=INFO, logger=traceability, bizpn=Transaction1, sid=16a8299d, txid=828fccfe, subtxnbr=unk, user=username, sts=PASS, mark=txend, duration=341, clientId=testClient
 Multisearch used to compare two periods of time in the dashboard
| multisearch [ search index=perfIndex sourcetype=traceability sts="PASS" mark="txend" "clientId=test*"
earliest=1528108800 latest=1528112400 | eval timeBase=duration/1000 |eval testCase="Baseline"] [ search index=perfIndex sourcetype=traceability sts="PASS" mark="txend" "clientId=test*"
earliest=1528886400 latest=1528890000 | eval timeTest=duration/1000 | eval testCase="Current"] | stats avg(timeBase) as avgBase avg(timeTest) as avgTest by bizpn | eval avgDiff = avgTest - avgBase | table bizpn avgBase avgTest avgDiff
 This allows a single dashboard to be used to compare the user experience for two periods of time across the entire application architecture

User Experience Reporting
How the dashboards work

© 2018 SPLUNK INC.

 The transaction ID (txid) can be used to look further into the application stack to see where time is spent at each layer of the application.

User Experience Reporting
How the dashboards work

© 2018 SPLUNK INC.

 Other information about the infrastructure (for example, time spent in garbage collection on the servers) can be correlated to performance test results.

© 2018 SPLUNK INC.
Looking Forward
The future of using Splunk at Paychex

What's Next?
How will we push to the next level?
 Automated result analysis with alerting · Push vs Pull for test results
· Machine learning · Using new Splunk functionality to predict issues proactively

© 2018 SPLUNK INC.

Summary
 Saved time and money in the SDLC  Allowed testing to push left  Better end user experience with faster resolution to issues  The ability to be proactive in reaching out to customers  A better understanding of our client workflows and usage patterns

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Q&A
Brian Dudiak | Manager, Performance Engineering Dr. Kenneth Tupper | Performance Engineering Lead

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

