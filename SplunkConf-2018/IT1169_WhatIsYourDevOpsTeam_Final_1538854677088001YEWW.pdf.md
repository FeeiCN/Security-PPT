© 2018 SPLUNK INC.
What is Your DevOps Team Actually Doing?
Brandon Cipes | VP of DevOps | cPrime Justin Evans | Director, Solutions Engineering | cPrime
October 4, 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
"Software is Eating the World."
Marc Andreessen

"Software ate the world.
Now it has indigestion. The antacid is DevOps."
Some Guy

© 2018 SPLUNK INC.

Questions Worth Answering...

© 2018 SPLUNK INC.

What is a DevOps Team Anyway?

How Can You Monitor Your DevOps Teams?

Why Track What Your DevOps Teams Are Doing?

© 2018 SPLUNK INC.
What is a DevOps Team Anyway?
Hint: It's not 20 SysAdmins in a room...

The What

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

The iterative, incremental method of managing the design and build activities of engineering, IT and other business areas that aim to provide new product or service development in a highly flexible and interactive manner.

A culture, movement, or practice that emphasizes the collaboration and communication of both software developers and other IT professionals while automating the process of software delivery and infrastructure changes.

The Who

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Thanks to Spotify!

The Where

Continuous Integration (CI)

© 2018 SPLUNK INC.
ConCtoinnutoinuusoDusepDleopylmoeymnte(nCtD) (CD)

Dynamic Cloud Infrastructure (laaS)

Test Automation

DevSecOps

Monitoring

© 2018 SPLUNK INC.
How Can You Monitor Your DevOps Teams?
Where there's a will, there's a data set

The How

Continuous Integration (CI)

© 2018 SPLUNK INC.
ConCtoinnutoinuusoDusepDleopylmoeymnte(nCtD) (CD)

Dynamic Cloud Infrastructure (laaS)

Test Automation

DevSecOps

Monitoring

Continuous Integration
Developer Commits Code to a DVCS

© 2018 SPLUNK INC.

CI

CD

Test

DevSecOps

IaaS

2018-09-25T21:31:01+00:00 | Code Committed

Continuous Integration
Developer Commits Code to a DVCS

© 2018 SPLUNK INC.

Continuous Deployment

© 2018 SPLUNK INC.

Automated Build Plans React to Changes in DVCS

CI

CD

Test

DevSecOps

IaaS

2018-09-25T21:32:29+00:00 | Build Successful

Continuous Deployment
Automated Build Plans React to Changes in DVCS

© 2018 SPLUNK INC.

Automated Testing
Testing May Take Place Before, During, or After Deployment

© 2018 SPLUNK INC.

CI

CD

Test

DevSecOps

IaaS

2018-09-25T21:33:34+00:00 | All Tests Passed

Automated Testing
Testing May Take Place Before, During, or After Deployment

© 2018 SPLUNK INC.

Security
Vulnerability Detection is a Crucial Component of Test Automation

© 2018 SPLUNK INC.

CI

CD

Test

DevSecOps

IaaS

2018-09-25T21:34:15+00:00 | No Vulnerabilities

Security
Vulnerability Detection is a Crucial Component of Test Automation

© 2018 SPLUNK INC.

Dynamic Cloud Infrastructure
Assets Spin Up / Assets Spin Down

© 2018 SPLUNK INC.

CI

CD

Test

DevSecOps

IaaS

2018-09-25T21:35:06+00:00 | Microservice Deployed

Dynamic Cloud Infrastructure
Assets Spin Up / Assets Spin Down

© 2018 SPLUNK INC.

So Many Applications!!!

© 2018 SPLUNK INC.

DevOps Activity != KPIs
Monitoring is the First Step
2018-09-25T21:31:01+00:00 | Code Committed 2018-09-25T21:32:29+00:00 | Build Successful 2018-09-25T21:33:34+00:00 | All Tests Passed 2018-09-25T21:34:15+00:00 | No Vulnerabilities 2018-09-25T21:35:06+00:00 | Microservice Deployed

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Why Track What Your DevOps Teams Are Doing?
Who needs data anyway?

Why Did You Go DevOps?
Remind yourself of the fundamentals...

© 2018 SPLUNK INC.

 Increase Velocity & Decrease Lead-Times

 Improve Quality & Release Predictability

 Improve App Reliability & Performance

"Process & Culture" KPIs

"Team Technical Proficiency" KPIs "End-User Experience" KPIs

"Process & Culture" KPIs
Can you build more product capability faster?

© 2018 SPLUNK INC.

Size of Deployments
One change, one build

Frequency of Deployments
Think in hours, not weeks

Lead Time
What gets in the way

"Team Technical Proficiency" KPIs
Is your team improving how they work?

© 2018 SPLUNK INC.

Automated Test Failure Rate
How well is the code working

Time to Build
You're going to be doing this a lot

Deployment Failures
How stable is the deployment process

"End-User Experience" KPIs
Are you meeting users' expectations in usability and performance?

© 2018 SPLUNK INC.

Product Error Rates
How well is the application working

Product Performance
Functionality doesn't matter if it's too slow

Uptime & SLAs
It should probably be up and running

Bonus! -> "Feedback Loop" KPIs
How do you get better at anything?

© 2018 SPLUNK INC.

Time to Detection
These can't wait

Time to Recovery
Remember those SLAs?

Learning
RCAs should connect to fixes

Benefits
Promotion Worthy Metrics

© 2018 SPLUNK INC.
46x more frequent deployments 22% less time on unplanned work 96x faster recoveries from failures 5x lower change failure rate 430x shorter lead times

© 2018 SPLUNK INC.
Things to Remember
You need some kind of action item from all this

Aggregate All The Things
If You Want to Make Fabric, You're Going to Need Threads

© 2018 SPLUNK INC.

Your KPI is Here Speed to Delivery / % Delivery Success IaaS
DevSecOps
Automated Testing
CI/CD

It's Not Just Logs
Log Files Do Not Necessarily Contain All Important Events

© 2018 SPLUNK INC.

RDBMS
Import DB Record Changes as Events with
Splunk DB Connect

REST API
Query API and Ingest Response as Events with REST API Modular Input

Log Files
Classic Machine Data

Splunkbase!
· Splunk App for AWS · Splunk App for Jenkins ·...

splunkbase
If it Can Integrate, There Will Be an App

© 2018 SPLUNK INC.

In One Place
Size and Complexity

© 2018 SPLUNK INC.

In One Place
Builds and Time

© 2018 SPLUNK INC.

In One Place
Tests and Defects

© 2018 SPLUNK INC.

In One Place
Releases and Readiness

© 2018 SPLUNK INC.

In One Place
Individuals and Applications

© 2018 SPLUNK INC.

In One Place
Exceptions and Anomalies

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Key Takeaways

1. You do DevOps so you have a LOT of
tools to stay on top of
2. Tools have their respective data and
reports, but the info is siloed
3. Aggregating machine data in one place
can give the insights you need to improve

© 2018 SPLUNK INC.
Q&A

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

