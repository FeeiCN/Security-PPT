© 2018 SPLUNK INC.
Battling Online Bank Attacks with Detection Methods Using Splunk
Kaz Ozawa | Japan Net Bank Rie Tokita | Macnica Networks, Splunk Architect Takashi Komatsubara | Splunk Senior Partner Sales Engineer
October 2018 | Version 1.0

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

KAZ OZAWA
Senior IT Security Officer Japan Net Bank

© 2018 SPLUNK INC.

KAZ OZAWA
 JNB-CSIRT Member  Security Business Experience 4 Years  Splunk Experience 3 Years  Financials ISAC Japan 2016,2017
· Achievement for expanding the method of
unauthorized access monitoring to Japanese financial institution by using Splunk

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

RIE TOKITA
Macnica Networks

v
TAKASHI KOMATSUBARA
Splunk Japan

© 2018 SPLUNK INC.
Japan Net Bank

Japan Net Bank
http://www.japannetbank.co.jp
 Exclusive Internet Banking Launched In Japan for the first time · Established in Oct, 2000
 # Of Account 370,000,000  Credit Balance 700Billion Yen  Service they provide
· Credit, Transfer, Credit Deposit, Direct
Deposit, Visa Debit Card, Foreign Currency Deposit, FX, Investment, Loan, Lottery

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk License & Captured Log

Internal System Log
Total 5.0G/day

© 2018 SPLUNK INC.

Firewall
 0.5G/day  Syslog
 Real-time

NG Firewall
 1.0G/day  Syslog
 Real-time

Proxy
 2.0G/day  Access Log  Real-time

Active Directory
 2.0G/day  Event Log  Real-time

Online Banking System Log
Total 18.5G/day

© 2018 SPLUNK INC.

WEB Server (akamai)
 7.0G/day  Access Log  3hours delay

Cloud Monitor (akamai)
 9.0G/day
 Request/Response, IP Geo,WAF
 30minutes delay

Banking Database
 1.5G/day
 Bank Transaction Log
 30minutes delay

Other Servers
 1.0G/day  Performance Log
 Once a day

Introduction of Detective Cases for
Unauthorized Access
Japan Net Bank Case

© 2018 SPLUNK INC.
1. Log Analysis of Internal System
Environment · How to detect malware infection with internal
Traffic Analysis of Online banking
2. Log Analysis of Online Traffic
· How to detect unauthorized access from
uncommon traffic
3. How to detect phishing site
4. How to detect account takeover activities
5. How to detect the end-user's banking trojan
infection

© 2018 SPLUNK INC.
Log Analysis within Internal System Environment
Detect Malware Infection

Detection of Malware Infection
Analyzing the proxying transmission destination
 Aggregate the date and time of proxy logs and find the suspicious internet transmission · Aggregate per FQDN of Transmission
Destination
· If no issue is found to the transmission
destination, it will be added to the whitelist, and excluded from the aggregation
Tips: Exclude white list traffic based on source ip / servers, then easily visualize C & C server communications

© 2018 SPLUNK INC.
Huge Access to VPS appeared all of the
sudden. Sender is potentially infected by malware

Detection of Malware Infection
Analyze Useragent from proxy logs

 Find the occurrence of any transmission to internet by suspicious Useragent
· Not IE, Edge, Chrome, Firefox
· No UA
· Old version of browser
· No precedent UA cases
Tips: UserAgents give us hints whether they are malware/C&C communications

Unusual UA. Register UA that regularly appeared into whitelist and exclude from
aggregation enables monitoring unusual cases

© 2018 SPLUNK INC.

Detection of Malware Infection
Analysis of AD event log
 Aggregate per event code and check if there is any usage of suspicious account · Usage of unexpected privilege ID
- 4672
· Below is the failure of event code authorization
- 46254672476847714776
· Event code that doesn't appear in regular
operation
- 46184649471947654766etc
Very effective by just aggregating event code and confirming the date and time

Visualize suspicious accounts by count, event
code and time/date

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Analysis of Online Traffic
Detect unauthorized access from unusual traffic

Detection of Unusual Traffic
Analyze access log by status code
 Except normal status codeex. 200 304, aggregate and confirm unusual status request
By grasping daily baseline, unusual patterns can be recognized

Too many requests for 404 status, it could
be DDoS and vulnerability scan

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Detecting Unusual Traffic

Other Methods of Analyzing Access Log

 Aggregate the number of access sources/IP addresses by day
· Approx. 20,000 Addresses/Day

 Aggregate the access number for each country by day
· Approx. 100 Countries/Day

 Aggregate the number of requests for each country by day

Either way, there is a regular trend

Country names

Detection of Unusual Traffic
Trend Analysis from the countries where there is not a lot of regular access
 By excluding the major countries, aggregate only the request from the countries where there are no regular access

Sudden access from Guatemala, It was SQL injection attack

Sudden access from unusual countries shows potential attack

© 2018 SPLUNK INC.
Country names

Detecting Suspicious Access
Monitor Useragent that regular browsers are not used

© 2018 SPLUNK INC.

 Monitor suspicious Useragent as staged below, and block wrongful access if it is not legitimate · Unexciting UA such as IE11.0 Formally rv:11.0 · Browser that is used by certain countries · Command system such as wget, curl. etc. · Suspicious tool such as Go-http and access from vulnerability scanners

© 2018 SPLUNK INC.
How to Detect Phishing Site
Finding out phishing site generated wrongfully from access logs

Detecting Phishing Site
Possible to find out before a criminal spreads out to the phishing site
 Check domain names of Referer that belong to online banking access log and confirm if there is any access from similar domain names that are similar to own domains.
 Most phishing sites are referring to original image, CSS, JS, etc. if so, URL of phishing site remains in Referer of original content's logs
Needs caution for requesting only images but not for html

© 2018 SPLUNK INC.

http://www.japannatbank.co.pw

URL of phishing site

HTML is the criminal's content, but the image is
referred to the original

Detecting phishing site
How to analyze Referer

© 2018 SPLUNK INC.

 Cannot check all Referer everyday, check by extracting Referer domain names newly appeared the day before Referer by using Title Get Tool

Extract the difference
Yesterday's Referrer

Narrow down to approx. 50
cases/day

New Referer List

All Rererrer Domain
Name that appeared in
the past

The result of Title Get Tool. If domain name is similar with the own domain or IP address, needs caution

New Referer

Page Title

http://100.100.50.50

Japan Net Bank

http://www.abc123.co.jp

-----

http://www.japannatbank.co.pw Japan Net Bank

How to Handle Phishing Site

© 2018 SPLUNK INC.

 Request National CERT to close phishing site
 Report unsafe sites from each browser
 Enter fake (Non-existing) account into phishing site, block access to use the fake account by using IP address
 Let Referer redirect the request with phishing site URL to another page prepared by bank · Even though customers have accessed to phishing site, it is still possible to display
the bank's page

© 2018 SPLUNK INC.

Reference Gophish

Creating Phishing Site, Open Source to actualize campaign

Do Not Misuse! !

https://getgophish.com/

 Detect if phishing site is created and confirm by using Gophish

 Function of Gophish

· By scraping, targeted
Web site can be copied

· By spreading phishing
mails, target with the clicked link can be managed

· Fake log in screen at
leading destination, exploit ID and password

© 2018 SPLUNK INC.
Detecting Method of Taking over Accounts
Detect log into the illegitimate account by the third party

Detecting Hacked Account Logins
Analysis of Browser Language

© 2018 SPLUNK INC.

 Confirm Browser Language per account at the time of login, and alert when the language is different from the ones in the past. · Detect potential account takeover every 15min and alert · You can obtain browser language from Request Header · Use caution if the provider is different from the ones the customers normally use

Account Num IP Address

001-1234567 202.***.***.15

001-1234567 202.***.***.18

001-1234567 001-1234567

202.***.***.54 114.***.***.192

Lang ja-JP ja-JP ja-JP xx-XX

Country Japan Japan Japan Japan

Provider S.Net S.Net S.Net O.Com

Network

Term

Comment

A Line 2016/9/3 - 2016/9/21

Same language and same provider

A Line 2016/9/3 - 2016/9/21

Same language and same provider

A line Z Line

2016/9/3 - 2016/9/21 2016/10/20 - 2016/10/20

Same language and same provider Different language and Different provider

Detecting Hacked Account Logins
Analysis of Open Port IP

© 2018 SPLUNK INC.

 Confirm if there is any designated Open Port to IP address at the time of login. Alert if the IP address has not been used in the past for each account
· Since criminals often use VPS, someone else's server and router in order to access, there are
cases that they might use IP address available remote Open Port as stated below
· 22, 1723, 3389
· Schedule alert in every 15 minutes. Check all histories of login that occurred during the time
You can obtain Open Port information from external site such as SHODAN, censys, etc.
· Confirm if the VPS is used by our customers or not

Account Num IP Address

001-1234567 202.***.***.15

001-1234567 001-1234567 001-1234567

202.***.***.18 202.***.***.54 114.***.***.192

Port 22

Country Provider

Japan

S.Net

Japan Japan Japan

S.Net S.Net VPS

Network

Term

Comment

A Line 2016/9/3 - 2016/9/21

No Open Port

A Line A line Z Line

2016/9/3 - 2016/9/21

No Open Port

2016/9/3 - 2016/9/21

No Open Port

2016/10/20 - 2016/10/20 Open Port, Suspicious VPS

Reference SHODAN
Able to obtain various information related to IP address

© 2018 SPLUNK INC.

https://www.shodan.io/
Country:JP port:22

 Download IP address list in Open Port and import to Splunk in order to leverage
 Or it can be done by requesting API of SHODAN from Splunk

© 2018 SPLUNK INC.

Detecting Hacked Account Logins
Analysis of Cookie
 Issue Unique Key Value per Cookie, Check log into multiple accounts by the same key valueSame Key ValueSame TerminalSame Browser Alert if the same terminal is used to log into multiple accounts
· It is extremely unusual to log into multiple accounts from the same terminal/same browser
since each one has the same single account
- If it is used within the same company or same family and share PC, there is no issue. Thus it is excluded from alert
· Schedule alert for every 15 minutes. Check all histories of log in that are occurred every 60
minutes
· Various hacking cases are detected. For example, commonly purchasing accounts, etc.

Account Num IP Address

Key Value

Country Provider

Network

Term

Comment

001-1234567 202.***.***.15

ZF09UYXS09122

Japan

S.Net

A Line

2016/10/20 15:30:00

Same Key in Cookie

002-2234568 202.***.***.15

ZF09UYXS09122

Japan

S.Net

A Line

2016/10/20 15:32:00

Same Key in Cookie

003-3234569 004-4234560

202.***.***.15 202.***.***.15

ZF09UYXS09122 ZF09UYXS09122

Japan Japan

S.Net S.Net

A Line A Line

2016/10/20 15:34:00 2016/10/20 15:36:00

Same Key in Cookie Same Key in Cookie

Detecting Hacked Account Logins
Analysis of Tor IP Address

© 2018 SPLUNK INC.

 Confirm if the IP address used when the time of log is Node Address of Tor Set alert if there is no history of using Tor per account in the past. · Regular customers barely use Tor · Schedule alert in every 15 minutes. Check all histories of log in that occurred during the time · Exit Node of Tor Address information is able to obtain from external site below · In general, Various cases are found to use someone else's accounts such as financial crime,
fraud. Etc.
https://torstatus.blutmagie.de/

Reference MINEMELD
Opensource that can be automatically gathered IOC from various sites
 As a default, MINEMELD is corresponding to various IOC delivered WEB site (Feed)
 Install REST Apps into Splunk, Obtain IOC from Output node of MINEMELD
 By collaborating with MINEMELD, possible for autorenewal of Tor Node list imported to Splunk

© 2018 SPLUNK INC.
https://github.com/PaloAltoNetworks/minemeld

© 2018 SPLUNK INC.
How to Detect the Infection of Banking Trojan
Detect if the customer's PC is infected by banking trojan

Detection of Infection to Banking Trojan

© 2018 SPLUNK INC.

Detect if a customer is infected by banking trojan
 If the terminal is infected by banking trojan, it requests for non-existing path of bank WEB site
/jqueryats/, /uejei3j/, /iimgc/, etc.
 By analyzing the request for 404 status, we recognized there were many requests for same path
 Suspicious parameters such as bank= and account= Query Parameter are attached to query parameters

Suspicious Path
Suspicious Query Parameter

© 2018 SPLUNK INC.
Detection of Banking Trojan Infection Detect if a customer is infected by banking trojan
 Recognized that fraudulent beneficial information was included once query parameter was URL decoded
 All Destination IP Addresses requesting for this pass have terminals infected by banking trojan
 Within status 404 request, needs caution for any requests with suspicious query parameters such as account=, password=, etc.

These IPs are infected by bank trojan

Fraudulent beneficial account name and amount of remittance, etc.

© 2018 SPLUNK INC.
Reference Request for Banking Trojan
The reason why Banking tojan sends a request to Banking Site
 Banking trojan is pretending to be transmitting to bank server for the transmission of C&C server (Request to jqueryats, etc.)
 Disguised transmission is hooked by banking trojan and yielded to C&C server, yet it ends up as failure by depending upon the end-user's environment
 If it is failure, it just requests to bank server

https://login.japannetbank.co.jp/jqueryats/...

Online Banking

Hook failure

Fake request

Malware

Attacker C&C Server

Hook success

Key Takeaways
 Analysis Points for log collection · Most of normal traffic logs should be excluded from aggregate result with white list
 How fast to detect appearances of your phishing site · Leverage Refere-domain field and identify if it is phisling site or not
 How fast to detect hacked accounts · Browser langueage gives us hints for each accounts · Leverage cookie information if the customers' PC is used by multiple users
 How fast to detect banking malware on PCs · Check if there are many requests to non-exsisting path of your bank web site

© 2018 SPLUNK INC.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

