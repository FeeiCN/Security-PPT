An Introduction to Fraud Detection with Splunk
How Sony Interactive Entertainment uses Splunk for Fraud Prevention
Grant Walthall ­ Security Engineer @ SIE Beau Morgan ­ Staff SE @ Splunk
August 2018 | Version 1.0

© 2018 SPLUNK INC.

Draft Outline: · Why Splunk for Fraud (3 min) - Beau · What is an Account (7 min) - Beau · Real World SIE Use Cases (25 min) - Grant · SIE Value / Metrics (5 min) - Grant · Call to Action (5 min) - Beau

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
Why Splunk for Fraud?

Existing Fraud Tools Too Limiting

© 2018 SPLUNK INC.

RIGID AND INFLEXIBLE

SCALE AND SPEED ISSUES

NARROW VIEW OF FRAUD
­ Visa CyberSource 2013

$

DIFFICULT TO DEPLOY; LIMITED ROI

© 2018 SPLUNK INC.
Splunk: Leading Solution for Fraud Detection

FLEXIBLE

SCALE AND SPEED

BROAD VIEW

$

FAST VALUE

COMPELLING ROI

© 2018 SPLUNK INC.
What is an Account?

Accounts Are Customers

© 2018 SPLUNK INC.

Account Activities

© 2018 SPLUNK INC.

 Transactional (Single Event Type) · Credit Card Transactions · Inventory Sales · Money Movements · Loyalty Card · Coupons · Financial Services

 Behavioral (Multiple Event Types) · Online Banking · Online Sales · Online Insurance · Clickstreams · Web Logins

© 2018 SPLUNK INC.
Account Takeover (ATO) Detection Example
Monitor Application Successful Logins from Unusual IPs/Locations to Uncover Successful Phishing

© 2018 SPLUNK INC.
Real World Use Cases with Real Results
A look at how Sony Interactive Entertainment uses Splunk for Fraud Prevention and Analysis

Introduction
Grant Walthall Senior Fraud Engineer Global Fraud Management (GFM) Sony Interactive Entertainment

© 2018 SPLUNK INC.

Responsibilities of GFM

© 2018 SPLUNK INC.

Financial Fraud
 Real time risk decision making
 Research and monitoring using Splunk and Oracle database

Password List Attack (Credential Stuffing)
Focus of Today
 Detection and password reset of compromised accounts

Account Takeover
 Protection of users accounts
 Recovery of affected accounts

© 2018 SPLUNK INC.
Understanding PLA

Steps of a password list attack

© 2018 SPLUNK INC.

Obtain stolen credentials

Use botnet to distribute attack

Get successful accounts

Monetize accounts

Types of attacks

© 2018 SPLUNK INC.

Massive short term attack

Low and slow

Continuous high volume

 Very simple attack  Easy to detect

 Attack is not obvious  Attack is likely
continuous

 High volume attacks that are unlikely to stop
 usually there are many attacks

Uses of ATO Accounts

© 2018 SPLUNK INC.

 Credit card fraud  Use of account entitlements  Use of accounts subscriptions
Depending on the activity hackers may not make any changes to the account.  Potentially using it at the same time as the owner.

© 2018 SPLUNK INC.
Actions against PLA

Actions Against Password List Attacks

© 2018 SPLUNK INC.

 Security enhancements · Prevent unauthorized access
 Rate limiting, IP blocking, and blocking bad requests (WAFs) · Limit the scale of the attack
 Password reset · Mitigation after the authentication
 Dormant account reset · Dormant accounts are at high risk of ATO. We reset the password so that only the
account holder can recover the account.

Security Enhancements

© 2018 SPLUNK INC.

Blocking bad authentications is the most desirable action.  Hackers get an immediate
response  If it is something in their control
they will change it
Well thought out enhancements are difficult to work around.  May cause some friction to users.

Enhancements at SIE:
 Captcha on all authentications  Two factor authentication  Machine Learning/biometric
detection

IP Rate Limiting

© 2018 SPLUNK INC.

Rate limiting is important to limit the scale of attacks.  This may deter some casual hackers.  Professional hackers will not be deterred.
· They have a very large number of IP addresses at their disposal.  Likely has more benefits with DDOS prevention.  Aggressive rate limiting may make detection harder.
We have seen more than 10 million IP addresses attacking us in a given month

© 2018 SPLUNK INC.
Detecting Compromised Accounts

What can be done?
 You will likely never stop being attacked.  Blocking attacks can be challenging and expensive.
· Some will be missed.  Detection of compromised accounts will always be needed.
· Splunk has filled this need for us very well.

© 2018 SPLUNK INC.

Useful Data Sources in PLA
Web logs  Show the behavior of a user or IP address Authentication logs  Allows us to know what accounts were actually compromised  Useful for looking at high failure rates Other account logs  Need to know if they have made any other changes  Email changes are very important to us

© 2018 SPLUNK INC.

Looking for Potential Attacks

Monitor the following:
 Authentication endpoints  Authentication results
<<your data>> | timechart bins=1000 count by ...
user agent, IP country, auth result

Endpoint with attack by result

Endpoint without an attack by user agent

Endpoint with attack by user agent

© 2018 SPLUNK INC.

Monitoring Authentications

© 2018 SPLUNK INC.

SIE must support a wide range of devices for both current and legacy services.
 Requires greater effort to protect all endpoints from attacks  Hackers will exploit your weakest endpoints
· You need to have a good understanding of your network and how they are attacking you · Without this we can not make well informed decisions

Monitoring Account Events
 Time charts are helpful in visualizing anomalies · Gives us a general idea if there are
abnormal activities occuring
 Monitored Events: · change password · change email · add payment instrument · sub account creation · purchasing events

© 2018 SPLUNK INC.

not actual data

Researching

© 2018 SPLUNK INC.

Splunk is heavily used for researching the scale of new malicious trends and prototyping mitigation.  We have many different data sources in Splunk
· This allows us to better understand what is going on and what we can do, which can be
very difficult to do in something such as a database.
 Splunk allows for rapid iteration and prototyping
Research steps: 1. Notice anomaly (either through reporting or alerting) 2. Create additional queries looking at suspicious activity

Researching

© 2018 SPLUNK INC.

Try to understand the activity on some data point like IP address, account ID, or session ID.  Useful to understand how both good users act and hackers act. Find ways to explore your data that is useful to you.  This is likely to constantly change.

Researching
Visuals are often very helpful in understanding your data

© 2018 SPLUNK INC.

Some SIE Detections
SIE detection rules (typically on IP):  High failure to success ratio  Skipping endpoints
· For example skipping login page and hitting authentication endpoint directly  High counts of endpoints that are rarely used
· Hackers evaluate what values an account has, such as what games it owns · Other account information may also be evaluated  Accounts on many IP addresses · As well as other accounts on those IP addresses  Many authentications occurring very quickly

© 2018 SPLUNK INC.

Detection Process

© 2018 SPLUNK INC.

Iteration is very important  Which Splunk is great at
Output any data that may be relevant for either detection or validation  For example user agent is not great for detection, but can be very useful for validation when
developing rules

Detection Process

© 2018 SPLUNK INC.

Detection Research
(<<web data>>) OR (<<authentication data>>) | iplocation ip_address | stats
values(Country) as Country values(user_agent) as user_agent count(eval(result like "%SUCCESS")) as success_count count(eval(result like "%ACCOUNT_NOT_FOUND ")) as anf_count count(eval(result like "%INVALID_PASSWORD")) as invPass_count count(eval(match(uri_path,"<<auth endpoint>>"))) as cnt_auth count(eval(match(uri_path,"<<login page>>))) as cnt_login_page by ip_address | where cnt_auth > 0 AND (success_count+anf_count+invPass_count) > 0 | eval pct_login_page=(cnt_login_page/(cnt_auth+cnt_login_page))*100 | sort - cnt_auth
More data is returned in order to determine what is even relevant.

Finalized detection
(<<web data>>) OR (<<authentication data>>) | iplocation ip_address | stats
count(result) as authentications count(eval(match(uri_path,"^<<auth endpoint>>"))) as cnt_auth count(eval(match(uri_path,"<<login page>>"))) as cnt_login_page by ip_address | where cnt_auth > 0 AND authentications> 0 | eval pct_login_page=(cnt_login_page/(cnt_auth+cnt_login_page))*100 | where pct_jsp<20 AND cnt_auth>=5
Only data relevant to detection is returned.
Data sent to summary index.

Detection Process

© 2018 SPLUNK INC.

Using detected bad IPs
(index=<<summary index>> source=<<search name of IP detection>>) OR (<<auth data>> result=*SUCCESS) | eval account=_time.":".account_id.":".sign_in_id | stats
values(account) as account count(eval(index="<<summary index>>")) as cnt_bad by ip_address | where cnt_bad>0 | mvexpand account | rex field=account "^(?<_time>\d+(\.\d+)?):(?<account_id>\d+):(?<sign_in_id>.*)$" | stats first(sign_in_id) as sign_in_id min(_time) as _time values(ip_address) as ip_address count as cnt_auth dc(ip_address) as dc_ip by account_id | eval ip_address=mvindex(ip_address,0,9)

Identifying accounts in same search
(<<web data>>) OR (<<auth data>> result=*SUCCESS) | eval user=account_id."|".sign_in_id | stats
count(eval(result like "%SUCCESS")) as success_count values(user) as user count(eval(match(uri_path,"^<<auth endpoint>>"))) as cnt_auth count(eval(match(uri_path,"<<login page>>"))) as cnt_login_page by ip_address | eval pct_login_page=(cnt_login_page/(cnt_auth+cnt_login_page))*100 | where pct_jsp<20 AND cnt_auth>=5 | fields ip_address user | mvexpand user | rex field=user "^(?<account_id>\d+)\|(?<sign_in_id>.*)$" | table account_id sign_in_id ip_address

Validation of Detection

© 2018 SPLUNK INC.

Identify data useful for determining false positives and false negatives  Not recommended to be data used in the rule  User agent and IP location have been helpful Graph the data using a timechart to see if the results look as you might expect

Monitor Detection

© 2018 SPLUNK INC.

Useful in understanding if significant amounts of missed accounts Helpful in determining false positive events  Looking at the IP country is often helpful for this

Detected accounts by IP Country

An increase in countries with a large user base, but uncommon for attacks, such as the United States, shows potential false positives.

PLA mitigation

© 2018 SPLUNK INC.

Detecting Accounts
Direct detection
 Identifying compromised account solely from logs for those accounts
Correlating detection
 Identifying IP addresses, devices, or other criteria  Every account using that IP, device, etc. is identified as compromised  If the time period is too long you will have a greater degree of false positives
· Due to botnets being comprised of compromised devices, our users will sometimes have a
compromised device on their IP address

Challenges in Splunk

© 2018 SPLUNK INC.

A challenge we faced was the ability to perform some lookups in Splunk.
 For example our account table is massive and is constantly updated.  We solved this problem by sending data from Splunk to a database to do
these lookups.

Splunk

Database

Password Reset

Where to Start?
 Monitoring data  Identifying bad/suspicious activities  Identify what can and needs to be done to affected accounts

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Call to Action
What's Next?

Splunk Security Essentials
https://splunkbase.splunk.com/app/3435/
Learn to improve your security using Splunk's analytics-driven security:
Common use cases and examples to get started Data onboarding guide for top data sources Understand how to improve your security Scales from small to massive companies Save searches, send results to ES/UBA
You can learn to solve use cases today for free, then use with Splunk solutions

© 2018 SPLUNK INC.

Splunk Essentials for Fraud Detection
https://splunkbase.splunk.com/app/3693/

© 2018 SPLUNK INC.

Learn how Splunk Enterprise may be used to detect various forms of fraud using the example scenarios.

Free Workshops
Deep-dive and grow your fraud detection skills
Beginning Fraud Detection Advanced Fraud Detection Threat Hunting Workshop
Boss of the SOC v2

© 2018 SPLUNK INC.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

