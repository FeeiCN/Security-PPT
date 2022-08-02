Splunking for Fraud: Let the Machines Look for Unknown Unknowns
Matthew J Joseff, CFE | Minister of Reality, Sr. Security Specialist
September 6, 2018 | v3.0

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Hello World. Pleased To Meet You.

© 2018 SPLUNK INC.

3 years @Splunk
Over three decades in technology Sysadmin, Security, Fraud

Training
Psychology/Human behavior Product Management Certified Fraud Examiner

Based in Central CT
Raised overseas in the IC Relocating to Tokyo

Matthew Joseff, CFE
mjoseff@splunk.com

Hobbies
Breaking & fixing things Film Politics

Change
Nothing is so painful to the human mind as a great and sudden change.

© 2018 SPLUNK INC.

 Put a light bulb in here

© 2018 SPLUNK INC.
Time is our only non-renewable resource.

Compliance, Security, Fraud
What's the difference?

Compliance

Security

Fraud

© 2018 SPLUNK INC.

Interrelated Components of Fraud

Confidential

Process

© 2018 SPLUNK INC.

Integrity

Available

Rationalize

People

Technology

Pressure

Opportunity

Turning Machine Data Into Answers

© 2018 SPLUNK INC.

Application Servers

IVR Security

Messaging

Known Knowns

Web Clickstreams

GPS

Unknown Unknowns

Cloud

Mobile

Online Shopping Cart

Custom Applications

Challenges
Outliers & Anomalies Account Take Over Transactional Fraud Behavioral Patterns Abuse

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Agenda
Let's measure our Time

© 2018 SPLUNK INC.

Approaches To Fraud

Machine Learning

Now What?

© 2018 SPLUNK INC.
Approaches To Fraud
Time is our only non-renewable resource

We Are Failing at Prioritization
Alert

Wait

React

© 2018 SPLUNK INC.

Follow Up

Remediate

Splunk: Anti-Fraud
Where we are best of breed

Web Fraud

Transactional

© 2018 SPLUNK INC.

Source: F5

Needs of Anti-Fraud Teams

© 2018 SPLUNK INC.

Fraud Investigations

Fraud Analytics and Reporting

Fraud Monitoring and Detection

Enhance Existing Fraud Tools

© 2018 SPLUNK INC.
Need #1: Fraud Monitoring and Detection

 Advanced correlations

 Baseline & detect anomalies

 Deviations

 Real-time searches & alerts

 Automation

Spot outliers

Need #2 ­ Fraud Investigations

January

February

March

April

 Pivot  Patterns  Past

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Need #3 ­ Fraud Analytics and Reporting
Suspicious physician transactions
17

Need #4: Enhance Existing Fraud Tools

© 2018 SPLUNK INC.

Session ID
1234567 7654321 1231789

Sample Splunk Summary Index

Web fraud risk Credit card risk Threat Intel risk

score

score

score

0

2

0

6

9

15

1

2

0

Splunk Total
2 30 3

Events by Fraud Tool

Web fraud Credit card fraud Visits to fraud IPs Internal teller fraud POS fraud Trading fraud

18

Account Takeover (ATO) Example
Monitor Logins from Unusual IPs/Locations

1

2

3

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
What is Machine Learning?
I, for one, welcome our ______ overlords.

© 2018 SPLUNK INC.
Machine Learning
Automating analytical model building using algorithms that iteratively learn from data without requiring explicit programming

Complexity

© 2018 SPLUNK INC.
Evolution of Security Correlation, Advanced Analytics & ML
N-Dimensional Advanced ­ Data Science · Shift from heavy manual tagging and rule building alone, · Machine learning and data science for UEBA · Enhances analyst capabilities to identify unknown threats
Multi-Dimensional ­ Analytics · Hybrid model developed as adversaries circumvent basic correlation · Goal to reduce false positives · Thresholds and combinations of rules developed. · Behavioral models, statistics and patterns not signatures alone
Two-Dimensional ­ Correlation · Regex/pattern-matching for strings · Used in anti-malware, IDS/IPS, DLP and basic/legacy SIEM · Use of string matching to search a binary file to identify type of threat · Enhanced capability to identify previously known threats and host enumeration
One-Dimensional ­ Correlation · Fast and efficient basic matching eg. domains IP addresses, user-agent, MD5 file hashes · Boolean operators to identify if signature is on a black/white list. · Common usage in most firewall and IDS tools
Data Volume & Velocity

ML Examples IRL
It's everywhere

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Solving Problems With Machine Learning

Anomaly Detection

Predictive Analytics

Clustering

 Past behavior  User vs Group  Unusual changes

 Trend forecasting  Planning  Early warning

 Identify peer groups  Event correlation  Behavioral analytics

The ML Process

© 2018 SPLUNK INC.

Get & explore data

Select & fit algorithm generating model

Apply & validate models

Surface model

Operationalize

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Exploratory Data Analysis
Utilizing the Splunk platform for data science

Visualization & Creating Context (EDA)

© 2018 SPLUNK INC.

 Visualization is a powerful EDA tool
· Not everything can be described as bits, bytes, plaintext or pie charts.
 Correlation to add context to your data during the EDA process or test hypothesis.

Geographical EDA - Visualization
 Visualization useful for exploring multi-dimensional relationships.  Tells a story about the data you can't describe in text or tables.  "Where are connections `originating', and how often am I seeing this activity?"

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Transform Your Data
Set your own reality

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
"Machine Generated Data is a
Definitive Record of Human-to-Machine and Machine-to-Machine Interaction"
Data defines reality

© 2018 SPLUNK INC.
Now What?
"We are the music makers, And we are the dreamers of dreams"

Collect & Normalize
Inventory, Standards, and Data

© 2018 SPLUNK INC.

Assets
Do you balance your checkbook?

© 2018 SPLUNK INC.

 Device ID (MAC)  Ecosystem  Data Driven  Risk Based
Approach

Take Inventory
More than just assets

© 2018 SPLUNK INC.

Access Points

Egress/Ingress Data

Enrich
Context and Impact

© 2018 SPLUNK INC.

Automate and Orchestrate
Repeatable and Consistent

© 2018 SPLUNK INC.

Machine Learning
10 Print "hello" 20 Go to 10

© 2018 SPLUNK INC.

What Does a "Clean" Network Look Like?

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
"Machine Generated Data is a
Definitive Record of Human-to-Machine and Machine-to-Machine Interaction"
Data defines reality

© 2018 SPLUNK INC.
Splunk Demo
Presented by Matthew J Joseff

Thank you
mjoseff@splunk.com
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

