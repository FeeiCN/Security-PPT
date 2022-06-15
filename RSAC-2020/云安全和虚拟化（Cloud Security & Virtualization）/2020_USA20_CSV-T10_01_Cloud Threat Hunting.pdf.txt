SESSION ID: CSV-T10
Cloud Threat Hunting

Sherri Davidoff
CEO LMG Security & BrightWise @SherriDavidoff @LMGSecurity

Matt Durrin
Security Consultant LMG Security @EvilMattXD @LMGSecurity

#RSAC

Missed Opportunities

#RSAC
March 12, 2019 ­ attempt March 22 ­ Obtained subset of data April 21 - Timestamp on stolen files in GitHub (700+ folders/buckets) 100 million people's personal info was stolen
https://www.justice.gov/usao-wdwa/press-release/file/1188626/download
2

#RSAC
Roadmap
 What is Cloud Threat Hunting?
 Cloud Threat Simulation  Tools & Setup  AWS Threat Hunting  Azure Threat Hunting  Catching the Adversary

Who Are We?
Sherri Davidoff, CEO, LMG Security ­ "Alien" from Breaking & Entering ­ Black Hat "Data Breaches" course ­ NEW! "Data Breaches" book
Matt Durrin, LMG Security ­ Cybersecurity Consultant ­ Education and training ­ Black Hat Co-Instructor ­ Evil, sometimes.
4

#RSAC
Book signing!
2:30-3PM TODAY
Bookstore @ Moscone West

#RSAC
#BreachBingo
Visit Sherri's LinkedIn Got BINGO? Tweet @LMGSecurity #BreachBingo Win Prizes:
­ Raspberry Pi 4 Starter Kit ­ Bluetooth Beanie Hat
5

Copyright LMG Security 2019. All rights reserved.

#RSAC
Scanned the Internet Accessible AWS metadata service ­ 169.254.169.254 WAF allowed connections Got keys from the instance Listed buckets Downloaded data Common vulnerability ­ Brennon Thomas ­ 800+ available AWS instances ­ Scanner tool
66

#RSAC
Finger Pointing

https://www.washingtonpost.com/technology/2019/07/30/capital-onelooked-cloud-security-its-own-firewall-couldnt-stop-hacker/

https://www.newsweek.com/amazon-capital-one-hack-data-leak-breach-paigethompson-cybercrime-1451665

7

#RSAC
Amazon Made a Change...
https://aws.amazon.com/blogs/security/defense-in-depth-open-firewalls-reverse-proxies-ssrf-vulnerabilities-ec2-instance-metadata-service/
8

#RSAC
Threat Hunting
Proactive, human-driven Hypothesis-Based Indicators of Compromise Cyclical Depends on VISIBILITY
­ Hence issues in the cloud...
9

#RSAC
Lack of Visibility

https://www.mcafee.com/enterprise/en-us/solutions/lp/cloud-security-report.html

10

www.LMGsecurity.com

#RSAC
Our Cloud Threat Simulation
Experiment ­ AWS ­ Azure Understand default visibility Goal: set up an effective cloud hunting platform Test Fine-tune Repeat
Remember: the cloud is constantly changing!
11

Our Victim: HackMe, Inc.
They make meatballs ­ (hey, it's tastier than
"widgets") ­ High-Value Data Amazon ­ S3 Buckets ­ EC2 Instances Azure ­ Office365 ­ SharePoint

#RSAC
The Famous "Impossiballz"

12

AWS Cloud Hacking Toolkit
Cloud Breach via Misconfigured Proxy (ie CapitalOne) EC2 Metadata Service /SSRF vuln IAM Privilege Escalation
­ Attachment ­ Rollback to prev version
Remote Code Execution -> Root access to EC2 instance Codebuild & SSM ­ Plaintext secrets in DB
13

#RSAC
Shout Out to Rhino Labs! Vulnerable-by-Design AWS Environment

#RSAC
Microsoft Cloud Environment
Office365 Email / SharePoint VM w/ web server Key Users:
­ Anna Demin (she's AN ADMINistrator)
­ Ben Patchen (IT)
14

#RSAC
Meet The Cloud Hacker
Braelynn
­ Aka...
NIMBOCUMULUS
15

#RSAC
Instrumentation
16

#RSAC
An Anonymous Threat
Hungarian Meatballs
Does an adversary have unauthorized access? Did someone steal HackMe's intellectual property?
17

#RSAC
Threat Hunting ­ Create Hypothesis
An adversary gained unauthorized access to AWS and Amazon
­ May still have access!
18

#RSAC
AWS Tools
CloudWatch GuardDuty Lambda Athena
19

#RSAC
What Do We See By Default?
20

#RSAC
Visibility Will Cost You...
21

#RSAC
Piles O' Data
22
22

#RSAC
Guard Duty ­ Credential Exfiltration Alert
Did This Exist When #CapitalOne went down?
2323

#RSAC
Guard Duty ­ "Hacker" Operating System Alert
Falling Meatballs
24

#RSAC
What if NIMBOCUMULUS wasn't using Kali?
25

#RSAC
Alert Fatigue
26

#RSAC
Threat Hunting for AWS ­ Investigate
Interviews Built-In AWS Tools Splunk Extrahop
27

#RSAC
Interview with Anna Demin
28

#RSAC
Hunting With Splunk

29

Image Source: Splunk

#RSAC
Getting Data Into Splunk
Amazon Firehose
https://aws.amazon.com/kinesis/data-firehose/
30

#RSAC
Alert! The Adversary Lists Buckets
3131

#RSAC
Alert! The Adversary Checks Available Functions
32

Indicators of Compromise
Strong Indicators
ie. A signature-based malware alert

#RSAC
Weak Indicators
ie. An unusual login time

Plus: Chaining Indicators...
33

#RSAC
Weak IoC: Strange User-Agent String
Adversary Uses AWS-CLI on Kali Linux
34

#RSAC
The User Agent String: A Wealth of Information

· Browsers · Crawlers · Consoles · Operating Systems · Offline Utilities · Link Checkers · Mail Clients

Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36 Chrome version 51 on a Linux host
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.74 Safari/537.36 Edg/79.0.309.43
Edge version 79 on a Windows 10 host

35

#RSAC
Chained with...
Sensitive file access
36

#RSAC
Threats are Identified!
Mice-Shaped Meatballs
37

#RSAC
Too Late This Time
38

#RSAC
The Meatballs Are Gone!
WHAT ELSE CAN THE ADVERSARY ACCESS? LET'S HUNT IN AZURE...
39

#RSAC
Iterative Process...
Swedish Meatballs
40

#RSAC
Common Azure/O365 Compromise Vectors
Phishing Credential Stuffing Misconfiguration
"Hackers don't break in, they log in"
- Bret Arsenault, Microsoft
41

#RSAC
New Host Configuration
42

We're Not Alone... Tricky!
https://www.shodan.io/search?query=Remote+Desktop+org%3A%22Microsoft+Azure%22
43

#RSAC

https://threatpost.com/microsoft-250m-customer-service-recordsopen/152086/

Copyright LMG Security 2019. All rights reserved.

44

www.LMGsecurity.com

#RSAC
Microsoft Audit Log Search
45

#RSAC
Can You Trust Your Tools?
Inconsistent results for the same query
Difficulty downloading large log sets
Ours kept freezing above 1500 results
46

#RSAC
Use Powershell Instead of the GUI for Better Results
47

#RSAC
UAL ­ Another Pile O' Data
48

#RSAC
We Can Do Better ­ ElkStack

4949

Meatball Sandwich

#RSAC
Anna Demin ­ Lots of Failed Logins

#RSAC
Splunk Joins The Hunt!
51

#RSAC
Top Failed Logins Per User
52

#RSAC
Adversary - Successful Login
53

Adversary Geolocation
HackMe Inc is in California...

#RSAC
Not Part Of The Plan!

54

#RSAC
Create Hypothesis ­ Credential Stuffing

https://www.scmagazineuk.com/44-million-azure-ad-microsoft-accounts-compromisedpassword-problems-highlighted/article/1668138

https://www.helpnetsecurity.com/2019/12/09/compromised-passwords-microsoft-accounts/
55

#RSAC
Mirroring Network Traffic­ VTAP

... or not.

From Microsoft Support:

Alternative: forward traffic from VMs
­ Worked
­ Down sides

56

#RSAC
Hosted Network Monitoring - ExtraHop
57

#RSAC
Successful VM Login From Suspicious IP Address
58

#RSAC
And Now the Adversary Has Access to One Drive, Too
The user is automagically logged into the O365 home page & apps
59

#RSAC
Search of Anna's Email Reveals...

#RSAC
A New Recipe?
61

Let's Take a Look...
6262

#RSAC
Malicious code in the comments

#RSAC
Exfiltration Confirmed
63

#RSAC
Current Hypothesis
Our attacker:
Launched a credential stuffing attack Broke into Office 365 (Anna Demin) Stole AWS keys from her email Accessed SharePoint & stole data Conducted reconnaissance on AWS Found credentials via metadata instance Listed buckets & downloaded sensitive files
64

#RSAC
Takeaways
Cloud Threat Simulations are Key! Know Your High-Value Data Know Your Tools Routine Threat Hunting Catch Adversaries Early

Meatball Friends

65

Questions?

Sherri Davidoff @sherridavidoff

Matt Durrin

@EvilMattXD

info@LMGsecurity.com

Phone: 406-830-3165

Find us on

66

#RSAC
Book signing!
2:30-3PM TODAY
Bookstore @ Moscone West

