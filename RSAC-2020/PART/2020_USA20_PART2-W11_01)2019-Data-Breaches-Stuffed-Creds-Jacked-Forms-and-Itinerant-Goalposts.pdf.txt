SESSION ID: PART2-W11
2019 Data Breaches: Stuffed Creds, Jacked Forms, and Itinerant Goalposts

Sara Boddy
Sr. Director, F5 Labs @sarab0ddy

Sander Vinberg
Threat Research Evangelist F5 Labs

#RSAC

#RSAC
Application Protection Research Series
Using data to unite tactics and strategy in risk-based security

APPLICATIONS ARE
The reason people use the Internet
The business
Importance of applications to the business
2020 F5 SOAS Report
62%
36%

Essential for business

Provides competitive advantage

2%
Not necessary

The gateway to DATA

the target

#RSAC

#RSAC
Apps, Attacks and Breaches Rising to the Occasion

3x
Attack growth

28%
App growth
983 765

2017

2018

2019

Attacks per App

2017

2019

Average Apps per Enterprise

3 Billion +
credentials stollen per year

983 Average # of Apps in use per
enterprise

#RSAC
6 min
1/3 before its scanned
If vulnerable, you could be PWND in
<2 hrs Mission critical

#RSAC
Top Attack Types By Geo Target
(last 90 days as of 12/31/2019)

Canada
Port scanning (VNC, SMB, SMTP, SSH, HTTP/S, SWX, Weblogic, DNS, Hauwei) Cred stuffing (VNC, SSH, Telnet) HTTP attacks (port 443 & 8080)
US
Port scanning (SMB, MS SQL, VNC, HTTP/S, SSH, Telnet, SMTP, DNS, WebLogic) Cred stuffing (VNC, SSH, Telnet, HTTP) HTTP attacks (Alt-HTTP port 8080) Malware uploads (SMB port 445)
Latin America
Port scanning (RFB/VNC, MS SQL, SMB, Telnet, RDP, HTTP/S) Cred stuffing (RFB/VNC, Telnet, FTP) Malware uploads (SMB port 445) HTTP attacks (Alt-HTTP port 8080)

HTTP/HTTPS Cred Stuffing Scanning
Middle East
Port scanning: RFB/VNC, HTTP/S, SSH, SMTP, Telnet Credential stuffing: Telnet, RFB/VNC, SSH HTTP attacks: Alt-HTTP port 8080

Europe
Port scanning: RFB/VNC, SMB, HTTP/S, SSH, DNS, SMTP, MS SQL, RDP, SWX, Weblogic, FTP, Radan HTTP Credential Stuffing: RFB/VNC, SSH, Telnet, HTTP Malware uploads: SMB port 445
Russia
Port scanning: ICB/SWX port 7326, RFB/VNC, SMTP, HTTP/S, SSH, SMB, Weblogic Credential Stuffing: RFB/VNC, Telnet, SSH HTTP Attacks: Alt-HTTP port 8080
Asia
Port scanning (SMB, MS SQL, RFB/VNC, SSH, NetBIOS, HTTP/S, Weblogic, Huewei) Credential Stuffing (RFB/VNC, Telnet, SSH) Malware uploads: SMB port 445
Australia
Port scanning: RFB/VNC, MS SQL, SSH, Telnet, HTTP/S, SWX, Radan HTTP, Netbios, Credential stuffing: RFB/VNC, SSH, HTTP, FTP Malware uploads: SMB port 445

Top 10 Attacked Ports Globally

HTTPS: 443
MS SMB: 445
SSH: 22
Alt HTTPS?, ICS?: 1443
*** Port 11684 *** SIP: 5060
HTTP: 80
*** Port 51413 *** Port 23810
Telnet: 23

2018

*** RFB/VNC: 5900
MS SMB: 445 Telnet: 23 SSH: 22
*** SIP: 5060
MS SQL: 1433 HTTP: 80
HTTPS: 443 NetBIOS: 137 MySQL: 3306

2019

*** Attack campaign, not "normal" attack traffic. - SIP 5060 began in 2018 and ended Q2 2019 - VNC 5900 began June 2019.

#RSAC

2018 HTTP
Attacks
Injection  PHP

Affiliates Betablock
Cart Exchweb
ASP Comments
Admin SQL PHP

0% 0% 0% 0% 1% 2% 3%
8%

#RSAC
81%

2019 HTTP
Attacks
Injection  PHP

Jboss IIS Admin Comments PeopleAggregator Axis Webcam
Joomla ASP SQL
Admin (non PHP) PHP (no admin) PHPadmin

0% 0% 1% 1% 1% 1% 2%
3% 3%

#RSAC
39% 49%

#RSAC
Application Protection Research Series 2019 Conclusions
· PHP, the weak point of the Internet · Attack methods follow business models · Injection, rejuvenated · Access attacks predominant · APIs changing the landscape

Methodology & Sources

#RSAC
Baffin Bay Data 2018 Breach Data 2019 Breach Data F5 SIRT data

11

Breach Analysis
State Attorney General

761
Cases 2018

#RSAC
87%
Had explanations

The unauthorized access involved the insertion of rogue code into our checkout page.

Breach Analysis
State Attorney General

1025
Cases 2019

#RSAC
85%
Had explanations

The unauthorized access involved the insertion of rogue code into our checkout page.

#RSAC
Global Breach Notification Scope

21.4%
US Population

1% Global population

10
US States share breach records

2018 US Breaches by Cause (%)

#RSAC

49.1%

17.3%

Access-related

Web

14.0%

9.0%

5.0%

Accidental

Physical security

Malware

4.0% Insider

1.6%
Third-party compromised

2019 US Breaches by Cause (%)

#RSAC

51.8%

18.9%

Access-related

Web

13.0%

6.1%

6.6%

Accidental

Physical security

Malware

3.1% Insider

0.5%
Third-party compromised

2018 Breach Root Causes

#RSAC

Industry Government Manufacturing Tech

Non-profit

Health

Education

Services

CPA*

Finance

Retail

Web
(mostly injection)

36.40%

39.40%

41.94%

4.76%

7.08%

3.23%

14.29%

1.50%

71.88%

Access
(mostly phishing and
email)

22.70%

33.30%

33.28%

42.86%

42.48%

51.61%

52.75%

78.30%

66.91%

15.63%

2019 Breach Root Causes

#RSAC

Industry Government Manufacturing Tech

Non-profit

Health

Education

Services

CPA*

Finance

Retail

Web
(mostly injection)

26.7%

36.5%

18.8%

10.8%

2.4%

3.8%

11.8%

2.7%

82.4%

Access
(mostly phishing and
email)

46.7%

32.7%

59.4%

56.8%

57.6%

67.3%

62.5%

84.0%

62.3%

9.3%

2019 Breach Methods by Sector
90.00% 80.00% 70.00% 60.00% 50.00% 40.00% 30.00% 20.00% 10.00%
0.00%

Access breaches Insider breaches

Web breaches Malware breaches

Accidental breaches Third-party compromised

Physical breaches

#RSAC

#RSAC
Web Attacks:
Don't fix it if it ain't broke

Card Stealing Web Injects
InjSetcotlseunsduatllayedxufeilttroatwedeak input fivltiearHs TcoTPmSmtona in PHP,
dJSro, CpMseSrvsyesr
PaMymaleicniot uCsard InPfoHBPreCaocdheed

#RSAC
Can add fake fields to page
Targeted Site

#RSAC
A typical shopping

site
Third party widgets/content

Bob's Bikes

Yellow Bike
$52.00

All linked off main app site but hosted elsewhere...

Third party widget injects not seen by WAF
WAF
4
Customer enters payment card info
on site

5
Payment card info is sent offsite to attacker

1
Attacker discovers PHP vulnerabilities on widget

#RSAC

2
Attacker injects code into widget

Malicious Code

3
Code runs on widget

#RSAC
Access Attacks:
Primary cause of breach
· Brute force · Credential Stuffing · Phishing

2018 Access Attacks Broken Down

#RSAC

20.0%
Email cited as cause

19.6%
Phishing gain access to email

4.0%
Access creds stolen

2.2%
Access cred stuffing and brute

2019 Access Attacks Broken Down

#RSAC

32.8%
Email cited as cause

14.2%
Phishing gain access to email

1.9%
Access creds stolen

2.2%
Access cred stuffing and brute

Brute Force attacks by industry from reported 2018 F5 SIRT incidents

#RSAC

41.7%

47.8%

50.0%

22.2%

23.1%

23.5%

25.0%

27.3%

Telecom Retail Tech Service Education Health Finance Public

#RSAC
Brute Force incidents reported to F5 SIRT

Breach Data Conclusions

#RSAC

Access attacks predominant
Retail breaches increasingly dominated by formjacking
Breach modes driven more by business model and application architecture than by traditional sector
Third-party enfilade attacks make niche providers risky (more on this in 2020)

API & Cloud Attacks

#RSAC
API Breaches API Incident Trends Cloud Breaches

#RSAC
Apps Expose their APIs

Server 1

Server 2

Ship

Server 3

Ship

Ship
Parse filter and transform
Logstash

Elastic
Visualize data
Kibana

API Breaches

Attack
1. Mobile Apps 2. Direct APIs

Basic Security Fails
1. Authentication 2. Injection 3. Permissions

2011 2012 2013 2014 2015 2016 2017

#RSAC

Oct 2018

Github

Dec 2018

Oct 2018
Quoine

Facebook

Jun 2019

Nov 2018
City of New York
Sep 2018
Facebook Nov 2018 Urban Massage

Apr 2019
Tchap

Venmo

Messaging App

Apr 2019
Nagios XI

Sep 2018

British Airways
Mar 2018
Binance
Aug 2018

Feb 2019
Uber Apr 2019 Portainer Docker Tool

SalesForce

Feb 2019

Drupal's RESTful

2018

2019

Sep 2011
Westfield

Mar 2015
Tinder

ASIVneuPcfvcloIunevrlrsmnulisetelayncrtkoearisoenrbasnitnlbreiolftlaeoeylrarvctimknhouaelatFgnhrtaesielcoeowenRafbevEUoreSeobsTkeaArbcPArleIPadtIloelondwtoiaewldn1lo.5ad sm2Dp0Mio0llosimofoininpllwgeionaentbtcsauictsektsothtmoaetbrwepahasayucmksedn.tftorraansparcatniokns ovinaTpiunbdleicr AusPeI.rs.

Feb 2017
Wordpress

Jan 2018
Tinder

Oct 2018

Jul 2018 Girl Scouts

Venmo

Nov 2018

Aug 2018

SKY Brasil

T-Mobile

Feb 2019
Pandora & Viper
Feb 2019
Kubernetes

Aug 2017
Instagram
Nov 2017
US Postal Service

Mar 2018
Google

Sep 2018
Apple MDM

Apr 2018
RSA Conference
App

Nov 2018

Mar 2019
63red Safe

Brazil Fed Feb 2019 of Indus LandMark

Apr 2019
Shopify

Nov 2018 White Limited

Apr 2019

US Postal

JustDial Link

Service
Dec 2018
Kubernetes

Apr 2019

Facebook Marketplace

Jun 2019
GateHub

Dec 2018
Twitter

Jun 2019
OnePlus Mobile App

USERNAME
Customer
Attacker

API Platform Attacks

Web UI

Large Platform with Extensive Integration

Inventory

Shipping

#RSAC

Accounts

Order Management

Data
Payment Processing

API Mobile Attacks

Attacker
User

Desktop

Brute Force, Injects, ETC

OR

Mobile

USERNAME USERNAME

Attacker

Brute Force, Injects, ETC

#RSAC
Data

Cloud Breaches
2010 2011 2012 2013 2014 2015 2016 2017

Malcom & Baker

Advanced Technology
Group

Teal Becker Chiaramonte

Kaplan, Plavin, & Steinhardt

Integrated Capitol Integration Practice Solutions Systems

Matrix Design Group

Capital Digestive Care

HC Financial advisors

#RSAC

IPv6
ISP DB
JC Penny

Guardzilla
records DB w/hard coded, shared keys
Telsa
AWS acct used to mine crypto

Honda
134 million records

Title Nine Sports
Integrated Practice Solutions

Alteryx DB
data analytics for Experian & US Census Bureau

RequestBin Capitol One API service used for C2s
misconfiguration

Robotics
manufacture for cars DB

Hadoop
RCE exploited to host bot

China
surveillance program DB

2018

2019

Microsoft
Business Productivity Online Suite

Mexican
Voter DB

Uber
Github account

RNC
voter DB

DOD
Surveillance DB

Capital Digestive Care

Tea Party
PII DB

Verizon
customer DB contractor configured

Oklahoma
FBI files DB

WWE
Fan DB

Credit Repair
Service DB

North American Power and Gas

GoDaddy architecture
Amazon employee configured

Ascension DB
data analytics for loan services

Dow Jones
WSJ / Barrons customer DB
Viacom's
master controls

Army
Intelligence and Security Command DB
Accenture's
Cloud Platform

Stein Mart
Booze Allen and Pentagon DB
secret data

Aggregate IQ DB
data analytics firm ­ politics

Kremlin Mongo DBs

DealerLeads.com
exposed S3 bucket

North American Power and Gas

American Family
Assurance AFLAC

Member Business Services

Best Western
AutoDesk reservation system ­ exposed Elastic search

SOS Intl. YRC
Worldwide
JC Penney

Colorado Bankers Life Insurance
Stein Mart, Inc

Title Nine Sports
Francesca's Services

Protecting Applications

#RSAC
2020 SOAS Report Recommendations

#RSAC
Multi-Cloud is the Norm, Security is the Challenge

87% OF ORGANIZATIONS ARE MULTI-CLOUD, MOST STRUGGLE WITH SECURITY

Percentage reported consistency is important

Area of multi-cloud challenges

67%

Maintaining security, policy and compliance Migrating apps among clouds/data centers
Optimizing application performance Gaining visibility into applications

58% 30% 29% 26%

Q. On a scale of 1 to 5 please rate the importance of being able to deploy and enforce the same security policies on-premises and in the cloud
CONFIDENTIAL STATE OF APPLICATION SERVICES, 2020

Q. As you think about managing applications in a multi-cloud environment, what part of managing the application do you find the most challenging, frustrating, or difficult? "Multi-cloud" in this case refers to multiple forms of cloud (private, public, or SaaS).

n=2583

#RSAC
Can Someone find anyone with Security Skills?!
OVER HALF OF ORGANIZATIONS REPORT APPLICATION SECURITY SKILLS DEFICIT
Category of skills deficit

Application security

Network security

42%

71%

Public Cloud Multi-Cloud

33% 31%

End point security

28%

Compliance

27%

Security skills deficit

DevOps

27%

Q. Do you have a security gap/deficit in skills in your organization?
CONFIDENTIAL STATE OF APPLICATION SERVICES, 2020

Q. Which areas do you have a security gap/deficit in skills in your organization?

54%

#RSAC
API Security Remains a Challenge
ORGANIZATIONS ARE MOST CONFIDENT IN PROTECTING APIS ON-PREMISES

Level of confidence to withstand an application-level attack against APIs

Level of confidence to withstand an application-level attack

12
Not at all confident

On-premises

8% 6%

29%

Off-premises colocation

7% 12%

36%

345 Very confident Top 2

32%

25%

56%

29%

16%

45%

Public Cloud 8% 14%

36%

27%

15%

43%

12

Not at all confident

On-premises

7% 6%

25%

345
Very confident

34%

28%

Off-premises colocation

6%

11%

32%

32%

19%

Public Cloud 8% 13%

34%

29%

16%

Top 2 62% 51% 45%

All APIs 6% 12%

39%

28%

15%

100%

43% All APIs 8%

39%

4%

Q. On a scale of 1-5 how confident are you in your company's ability to withstand an attack against your APIs? n=1948

CONFIDENTIAL STATE OF APPLICATION SERVICES, 2020

32%

17%

49%

100%

Apply it: Mitigating Application Risk
Invest in program maturity, not fancy gizmos
­ Inventory ­ Vulnerability management ­ Change control ­ Access control ­ Training ­ Monitoring and Logging
Multifactor Authentication WAF/WAAP

BEGIN THIS QUARTER BEGIN THIS WEEK

#RSAC
At $9.6
million per breach,
breaches are cheaper to
avoid.

#RSAC
Apply It: Protect your API / Mobile Server login

Mobile apps do not support the same security capabilities as web browsers

MOBILE

Mobile APIs are often left under protected

Automated attacks targeting mobile applications
· Content scraping · Denial of serving · API attacks

#RSAC
Apply It: Training Reduces Phishing
Success!

33%

Phishing success without training.

13%

Phishing success with training.

#RSAC
F5Labs.com
Tell us what you want to read about @F5Labs

Twitter

LinkedIn

Email

RSS

Updates

