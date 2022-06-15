© 2018 SPLUNK INC.
Marcus by Goldman Sachs
Launching an Online Banking Startup With Splunk
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Splunk .conf18 Speakers

© 2018 SPLUNK INC.

v

Maria Loginova
DevOps Analytics, Goldman Sachs

Josef Kuepker
Strategic Accounts, Splunk

Marcus by Goldman Sachs
Marcus Lending Video

© 2018 SPLUNK INC.

Marcus by Goldman Sachs
Marcus Savings Video

© 2018 SPLUNK INC.

Marcus by Goldman Sachs
Overview

© 2018 SPLUNK INC.

$4+ Billion

$23+ Billion

$1

In Loan Originations

In Retail Deposits

Minimum to Earn APY

1.85%
Savings APY

DevOps Requirements

© 2018 SPLUNK INC.
1. Centralized Repository where all
system events can be stored, visualized, and analyzed
2. Real-time monitoring and
alerting mechanism
3. Event correlation between many
different systems for testing and troubleshooting

Marcus by Goldman Sachs
DevOps Environment

© 2018 SPLUNK INC.

50+
Distinct Microservices

200+
Production Servers

400+
Distinct Log Files

Marcus Splunk Users

1. Production Support 2. Development Team 3. Quality Assurance 4. DevOps & Infrastructure 5. Security 6. Audit 7. Product 8. Call Center Agents 9. Agile Scrum Masters

© 2018 SPLUNK INC.

Marcus by Goldman Sachs
Growth

1.5+ million
Customers Across Marcus
Businesses

> 10x
Over 10x the Original Log Volume

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Data, more data, even more data, and more analytics!
Summary of my team's book of work

Splunk Lessons Learned

© 2018 SPLUNK INC.
1. Searches Getting Queued ­ Build Splunk
Cluster to increase capacity
2. Searches/Dashboards are slow ­ Be sure
to follow documented hardware requirements and note recommended settings (eg. ulimit)
3. Older data got aged out ­ Define your
preferred archiving policy
4. Scheduled alerts getting skipped ­
Monitoring Console will help identify Cluster issues
5. Different teams stepping on each other's
toes ­ build dedicated Search Head Clusters for each

© 2018 SPLUNK INC.
The Splunk team is always there to help ­ Just ask!
Main Lesson Learned

Challenge Yourself

© 2018 SPLUNK INC.
1. Expand existing use-cases into other
areas. For example, show Operational Dashboards to QA team
2. Automate all the things or at least the
boring things
3. Check-out Splunk Apps & AddOns. They
might have valuable pre-built knowledge objects that increase visibility of the data you are already collecting
4. Develop your own Splunk Apps and
submit them to Splunkbase!

Crawl, Walk, Run!
Splunk is powerful, learn to wield it

© 2018 SPLUNK INC.

 Use case: Web App Analytics
· What are customers
looking for?
· How many customers
apply for the loan they are viewing?
· Why do some abandon
their loan application?
· How can we help them to
complete the application?
 Data source:
· Web application logs

 Use case: Web App Ops
· What is the response time
of our applications?
· What errors are our
customers encountering?
· Is anything broken and
why?
· How can we improve the
customer experience?
 Data source:
· Web application logs

 Use case: Web App Security/Fraud
· Is anyone trying to harvest
accounts?
· Is anybody looking for
sensitive info?
· Who is attempting SQLi
attacks?
· Have legitimate user
accounts been compromised?
 Data source:
· Web application logs

Even More Value!
Squeeze out every ounce.

© 2018 SPLUNK INC.

CI/CD
Did the recent build
break anything?

Business Analytics
What does customer journey look
like?

Customer UX
Where can we improve
customer experience?

>
And many more!

Splunkbase
Splunk apps can speed time to use case delivery

© 2018 SPLUNK INC.

 1800+ Apps · Visualization · Log parsing · Data enrichment
 All use case categories · DevOps · Security, Fraud, and
Compliance
· Business Analytics

© 2018 SPLUNK INC.
Wrapping Things Up
What have we learned?

Customer Takeaways

© 2018 SPLUNK INC.
1. Splunk can monitor all phases of the
development and production lifecycles
2. Above and beyond traditional IT & Security
use-cases, Splunk can also provide immediate feedback on business insights
3. Single data store ­ multiple use-cases, help
your peers solve their challenges
4. Splunkbase apps can speed up your time
to value ­ most are free
5. Ask your Splunk team to help ­ their time is
free for you!

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

