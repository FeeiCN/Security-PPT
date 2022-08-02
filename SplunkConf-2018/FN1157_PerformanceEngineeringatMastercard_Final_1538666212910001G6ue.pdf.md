© 2018 SPLUNK INC.
Performance Engineering at Mastercard
Ted Boehm
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Three Guiding Principles

© 2018 SPLUNK INC.

Tiers

Tools

Strategery

First Principle

© 2018 SPLUNK INC.

Tiers

 Limits scalability  Configuration

Centralized Approach
Transactions

© 2018 SPLUNK INC.

Cache
Machine Learning
Analytic Storage

Manager

Message Queue

Journaling

Rules Engine
Server A

Cache
Machine Learning
Analytic Storage

Manager

Message Queue

Journaling

Rules Engine Server C
DB

Cache
Machine Learning
Analytic Storage

Manager

Message Queue

Journaling

Rules Engine
Server B

Distribute like processing on separate, physical tiers

Tiered Approach
Transactions

CaCCacachchheee

MMananaaggeerr

Message Queue

Journaling

Analytic Storage

Machine LAeAnanranalyilnytitgcicss

EREnREunRgEunlRgiunelngiueslngieelsnieesnese

© 2018 SPLUNK INC.

Second Principle

© 2018 SPLUNK INC.

Tools

Building a Performance Environment

© 2018 SPLUNK INC.

$$$
PROD = TEST

End-To-End Testing Approach
Test Driver

Cache

Manager
Message Queue

Journaling

Analytical Storage

Machine Learning

Rules Engine

© 2018 SPLUNK INC.

Tiered Testing Approach
Test Driver
Message Queue
Rules Engine

© 2018 SPLUNK INC.

Stress Testing
 Test the tiers until they break · Fail · Stop Scaling · Bottleneck · Operating System · I/O Level · Code
 Commercial Tools  DIY  Test Drivers
· Tiers would outperform the testing tools

© 2018 SPLUNK INC.

Track Metrics
 Application · Design · Track "important" metrics (Always) · Toggle more detailed information (As needed)
 Server · Single collector, outside of your application · CPU, I/O, Memory, Disk, etc
 Infrastructure Specific  Continual Metrics  Report & Review  Avoids "The Blame Game"

© 2018 SPLUNK INC.

 Maxed out puts/gets  Soft IRQ CPU Usage

Messaging Finding
Single CPU Bottleneck
 Interrupts configured on a single CPU  Receives are much more expensive

© 2018 SPLUNK INC.

Messaging
MQ Queue Manager Test

1 Queue Manager 1 Queue

1 Queue Manager 2 Queues

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Java and Low Latency Are (always) Not Friends

 Discoveries · Java cleans up garbage (minors and majors) · Daily in production · Nearly 10K "Major" Garbage Collections · ~6 hours spent in Full GC · Limited on heap size
 Goals · Eliminate time from majors · Limit minors · Improve SLA

Young Old

TXNS

Transactional Objects

Cache

Cache

Cache

Perm

JVM

© 2018 SPLUNK INC.
Garbage Collections vs Response Times

Azul Zing vs Hotspot
Commercial, ultra low pause JVM

Zing

Hotspot

© 2018 SPLUNK INC.

Third Principle

© 2018 SPLUNK INC.

Strategery

Model Your Environment

© 2018 SPLUNK INC.

Production Model
(Current)

Production Model
(Future)

Performance Model

Migrate Changes To Production

Test Run Stats
CPU, TPS, Response Time, etc.

Production Stats
CPU, TPS, Response Time, etc.

Production

Production Stats
CPU, TPS, Response Time, etc.

Models Validated with the use of Production Statistics

Capacity Heat Map

© 2018 SPLUNK INC.

Tier Utilization

Date

Tier

Jan-18

Manager 24%

Queue Analytic
Rules NoSQL

39% 35% 62% 13%

Tracking 13%

Web 19%

Web Svc 15%

RDBMS 47%

DataMart 63%

Feb-18
24% 40% 36% 63% 13% 13% 19% 15% 48% 63%

Mar-18
30% 50% 44% 78% 16% 16% 23% 15% 58% 65%

Apr-18
30% 50% 44% 78% 16% 16% 23% 15% 59% 65%

May-18
34% 58% 50% 88% 18% 18% 27% 15% 67% 72%

Jun-18
35% 13% 52% 91% 52% 18% 27% 15% 69% 72%

Jul-18
25% 15% 60% 70% 52% 21% 31% 15% 79% 72%

Aug-18 Sep-18

25% 14% 30% 38% 52% 22% 33% 15% 81% 73%

44% 26% 10% 51% 46% 30% 45% 15% 31% 75%

Oct-18
45% 26% 10% 52% 59% 31% 46% 15% 31% 75%

Nov-18 Dec-18

46% 27% 12% 53% 59% 32% 47% 20% 32% 78%

51% 29% 18% 58% 59% 35% 52% 22% 35% 81%

ITSI ­ Glass Tables

© 2018 SPLUNK INC.

ITSI ­ Service Analyzer

© 2018 SPLUNK INC.

Dashboards
Ones even your managers can understand!

© 2018 SPLUNK INC.

Guidelines for Success

1. Show the problem 2. Identify the solution 3. Follow up with results

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Q&A
Ted Boehm | Chief Platform Architect

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

