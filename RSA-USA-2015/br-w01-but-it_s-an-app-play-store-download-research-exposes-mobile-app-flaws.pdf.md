#RSAC

SESSION ID: BR-W01
But... It's an App/Play Store Download: Research Exposes Mobile App Flaws

Andrew Hoog
CEO and Co-founder NowSecure @ahoog42

Ryan Welton
Engineer NowSecure @Fuzion24

#RSAC

Mobile is different
Global Smartphone Shipments

#RSAC
Mobile App Downloads

Source: http://www.statista.com/
2

It's vulnerable

#RSAC
48%
of Android apps have at least one high risk security or privacy flaw
3

It's not very private

50% of Android users have an app that can do all of the following:
 Read precise location  Read phone log  Read sms  Record audio  Use camera  Start on boot  Connect to internet

4

#RSAC

#RSAC
Our research

Current Tests
 Network Issues  Improper SSL  Weak Android APIs allowing file write  Dynamically loaded code  Sensitive data leakage
 Local Issues  Dangerous world r/w local files  Weak content providersread/write files in app context

Future Work
 More extensive IPC endpoint testing  Identification of weak crypto  More intelligent app navigation  Forced execution flow/state

5

#RSAC
Crowdsourced data

Endpoint Protection

App Testing, Store Metadata

Forensics Analysis

6

Research Team

UI automator
 Automated human app use  High volume dynamic app testing  Tested 62,000+ apps
7

#RSAC

#RSAC
Three compelling vulnerabilities
 Data leakage  Improperly validated SSL  Remote code execution
8

#RSAC
Data leakage

15%
of all apps leak sensitive data over the network
(plain text or encoded)

9.6%
of apps on device leak data

9

Data leakage
 Demo #1: Data leakage  Example: ZERO Launcher  Popularity: 50mil+  Vulnerability: Leaks GPS coordinate to within feet and the serial number of
your phone  Implication: A passive network attacker can uniquely identify you and keep
tabs as you move around

#RSAC

10

Apps define our lifestyle
 Mobile blurs the line between public and private  Individuals  Industries  Customers  Employees  Vendors
 Apps manage every aspect  UX more important than security
11

#RSAC

And it's big money
Revenue (in Billions)
12

#RSAC
 180B app downloads projected in 2015
 93% of apps free  $45B projected revenue in
2015 with 30% CAGR  In-app purchases and ads
driving revenue growth and app download volume
Source: Gartner (September 2013)

With big flaws

#RSAC
The Samsung vulnerability compromised more than
200,000,000
mobile devices
13

#RSAC
Of the 62K+ apps we tested...
36% have at least one world readable file -
23% have at least one world writable file -
12.3% leak IMEIs -
5% leak MAC addresses -
4% allow arbitrary network file writes
14

#RSAC
The 5 riskiest app categories
Games | 59% -
News and Magazines | 55% -
Photography | 54% -
Comics | 53% -
Shopping | 51%
15

Gaming apps

#RSAC
59%
of gaming apps have at least one high-risk issue
...and 75% of mobile users have a gaming app on their device
16

#RSAC
Even the 5 least risky categories have issues
Libraries | 25% -
Media and video | 28% -
Finance | 29% -
Medical | 33% -
Health and Fitness | 36%
17

#RSAC
Improperly validated SSL

10%
of "family" games

7%
of shopping apps

6%
of social apps

18

#RSAC
Improperly validated SSL
10%
of all apps with improperly validated SSL are finance, social, travel or shopping apps
19

#RSAC
Improperly validated SSL
 Demo #2: Improperly Validated SSL  Example: key.me  Vulnerability: Traffic intercepted includes username + password, GPS coordinates, and
images of house keys  Implication: the attacker can gain GPS coordinates and image of the key to your home
to create a physical copy of your key
20

#RSAC
The average device has...

3

vulnerable gaming apps

6

vulnerable tool/utility apps

21

#RSAC
Of all the apps which run superuser (SU)
58%
are tools/ utilities
22

#RSAC
Financial app insecurities
Of all finance apps...
28% had at least 1 issue 6% have sensitive data leak 1% leak superuser capabilities
23

More downloads, more flaws

Percentage of Apps with Security Flaws

49%

62%

74%

100K-500K
Downloads

1M-5M
Downloads
24

5M-10M
Downloads

#RSAC

Remote code execution
 Demo #3: Remote code execution  Example: SimSimi  Popularity: 10 mil+  Vulnerability: A network based attacker can modify traffic to gain control
of the device  Implication: the attacker can access the device and control it completely,
including syphoning personal data (texts, pictures, emails, etc)

#RSAC

25

#RSAC
Mobile can be more secure.
26

#RSAC
http://www.nowsecure.com/intel/ 27

What you can do about it
 Individual  Track your own device  Use fundamental security settings
 Enterprise  Develop apps with best practices  Test apps for security flaws  Invest in mobile security for employees and the entire ecosystem
 Industry  Advance disclosure standards  Remediate vulnerabilities more quickly
28

#RSAC

Applying what you have learned today
 Starting immediately...follow mobile development best practices  Within one month...review your QA process to include not just bug fixes,
but security testing  Within six months...define and revise your budgets to ensure that you invest
in the right tools, resources, processes and people

#RSAC

29

SESSION ID: BR-W01
Mobile Security.
It's different. It's possible.
Andrew Hoog
CEO and Co-founder NowSecure @ahoog42

Ryan Welton
Security Researcher NowSecure @Fuzion24

#RSAC #RSAC

