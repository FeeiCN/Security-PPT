#RSAC
SESSION ID: CSCS-R02
It's Getting Real & Hitting the Fan! Real World Cloud Attacks
OFER MAOR
CTO, Mitiga @OferMaor

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

Speaker
CTO & Co-Founder, Mitiga Over 25 Years in Cybersecurity Hacker at Heart CloudSec & AppSec (Daytime) Incident Response (Nights & Weekends) Pioneer of IAST

#RSAC
@OferMaor ofer@mitiga.io Linkedin.com/in/ofermaor
3

#RSAC
About Mitiga

Mitiga's mission is to prevent our customers from experiencing a crisis -- even during a breach -- by providing a proactive next-gen Incident Response solution

Forensics Data & Automation Incident Command Center

Fastest Time to Recovery Incident Readiness

Breach Investigation Faster than Humanly Possible

Continuous, Proactive Breach Investigation

IR² == Zero Cost Critical Incident Response
4

#RSAC
Introduction

Breaches are Inevitable

World is Moving to the Cloud

Cloud Breaches are Here!

Today's Talk:

1
Learn about cloud breaches through real world stories

2
Realize how the right breach response can reduce impact and prevent loss

3
Understand what you can today to become more resilient and be ready for breaches

5

#RSAC
Incident #1: From SaaS Marketplace to a Full Breach

#RSAC
From SaaS Marketplace to Major Breach
Dave.com used Waydev code analytics via GitHub Marketplace. Waydev was hacked, and through it Dave.com's code was accessed. Cleartext secrets in Dave.com code allowed for unauthorized access. Data was stolen and leaked on the Darknet. DevOps blamed!
7

#RSAC
Yet Another Marketplace App Compromised
8

Is it Too Long? Yes, It Is!
Partial timeline (obfuscated)
3 months (!) between detection and notification
Another 10 days to notify affected customers!
Plenty of time for attackers

#RSAC

November 20, `19 Mid April `20 May 31, `20 July 11, `20 July 21, `20 July 22, `20

Incident Timeline
Phishing incident at DeepSource
Code cloned by devuser user from location with IP X.X.X.X
DeepSource were informed of the hack
by GitHub

Client Activity
DeepSource plugin installation
Received mail from GitHub and evaluation initiated DeepSource key removed from GitHub Account
9

#RSAC
The Response Can Be Long...
· Full investigation, exploring potential abuse by attackers · Hypothesis based Hunting mode

Sensitive Data Stolen From AWS

AWS Persistency

CloudDB Access

Stolen Secrets

GitHub Access

Azure Infra Access

Leverage Code Vuln.

Additional Repositories Duplicated

10

#RSAC
Substantial Impact

Source Code Leak (Including sensitive AI IP) AWS Secrets Compromise (Some access) Two Major Customer Disruptions

One customer suspending service for days

Second customer initiating massive (and expensive) audit and review

Substantial Costs Increase in Insurance Premium

11

#RSAC
Incident #2: Redis, Set, Mine!

#RSAC
Suspicious Files on EC2 Instance

Malicious files found on servers (18 in total)

root ­ md5 hash bdd0aab39e0bd7de2e900fd662bf37f1 zzh ­ md5 hash ef44c7cb178b0652ad659ee810e07aaf

ZZH file used to download CryptoMiner

Bash Script - hxxp://oracle[.]zzhreceive[.]top IP Addresses ­ 107.189.3.150 / 199.19.226.117

TTPs Associated with TeamTNT/Watchdog

13

#RSAC
CryptoMining through Cloud Tech
14

The Redis AMI
Initial investigation could not identify any vulnerability as the root cause for the infection

#RSAC
Infected servers correlated to a single AMI

Redis misconfiguration during AMI creation, led to compromise of the source image!
15

#RSAC
Cloud CryptoMining is Big!

#RSAC
AWS Community AMI with Cryptominer
17

#RSAC
When You Need Windows 2008 Server AMI...
18

#RSAC
Can You Spot the Malicious One?
OR
19

#RSAC
And When You Can't....
Siphoning Money
20

#RSAC
Incident #3: $15M Through O365 Without Leaving Your Couch

#RSAC

Fraudsters Steal $15 Million

From American Businesses

Alicia Hope

Through a Coordinated BEC Scam

22

Background
Collector's Item Transaction
Result: Over $15M Stolen

Actors
Buyer Seller Threat Actor

Legal Firm Restoration Expert

#RSAC
Investigation Outcome
Found evidence of compromise (Buyer) Found TTPs, connected to other cases by same cybercriminal group US Secret service involved
23

#RSAC
Attack Flow

PRE-SCAM
April - May

Access to Buyer's O365
mailbox

Forwarding rule & intel gathering

Filtering and folder manipulation

Fake domains registration with
O365 account

SCAM
May - July

Man-in-the-Middle communication

Money transfer

Stalling while maintaining access

24

#RSAC
Over 150 Organizations Impacted!
Months-long ­ Combining BEC with Account Compromise All email accounts setup on O365 (avoiding discrepancies) Forwarding Rules set to track all activity Filtering Rules moving mails to concealed folders Rogue domains registered on Wild West Domains (Similar patterns revealing over 150 additional fake domains)
25

#RSAC
Interactive TTPs ­ Registration Pattern

Registrar Nameserver TXT records

Wild West Domains (owned by GoDaddy)
Microsoft
O365 account with a unique Microsoft Identifier (strong) or with similar TTPs (medium)

PRE-SCAM
April - May

Access to Buyer's O365
mailbox

Forwarding rule & intel gathering

Filtering and folder manipulation

Fake domains registration with
O365 account

SCAM
May - July

Man-in-theMiddle
communication

Money transfer

Stalling while maintaining
access

26

#RSAC
Incident #4: MongoDB Ransomware Extortion

#RSAC
Good Morning ­ Your Data is Gone!

Entire MongoDB Erased

MongoDB Data Stolen, Replaced with Ransom Note:

28

#RSAC
Investigation Trail

November 25

20:44:53.890 (UTC) ­ MongoDB Service Binded to 0.0.0.0

November 27 ­ Connections from TOR Exit Node

17:54:51  17:54:54 (UTC)

// Recon

17:54:56  17:54:57 (UTC)

// Create collection (READ_ME_TO_RECOVER)

17:54:59  17:55:03 (UTC)

// Created ransomware document

17:55:04  17:55:06 (UTC)

// Deleted Database

Poor MongoDB Log Configuration - Limiting Investigation Confidence

29

Lucky Break!
Customer had full Backups!

#RSAC
Forensics investigation proved no actual data leak (!)

Ransom payment prevented. This time...
30

#RSAC
Incident #5: From On-Prem AD to Full Blown Cloud Attack

#RSAC
Yet Another Ransomware?

7x
EC2 Servers Encrypted

Double Ransomware Note (readme.txt)
· Decryption (not needed, backups available) · Data Leakage

32

#RSAC
Root Cause Analysis

April 30 April 15 April 5-14
April 1

TA encrypts, leaving readme.txt ransom note

TA runs rclone.exe to exfiltrate data to MEGA.nz

Lateral movement, gaining access to all 7 servers

· Leveraging OktaService account · Connecting via decomissioned VPN from on-prem DC to AWS Environment · Deployment of various tools for exploit and persistency

TA takes over on-prem DC

· Compromised administrative employee account · Attempts MFA challenges till employee approves · Takes over the OktaService account

33

#RSAC
Containment & Recovery

Servers Recovery
· Snapshot restoration (14 days back) restored to compromised environment
· Rebuilt servers from clean images
· Recovered database from dedicated Database backup

Data Leakage Containment
· Analysis of data leakage identified operating credentials of TA's server
· All data leaked downloaded and analyzed for identification of PII and Sensitive Data
· Finally, data erased from TA's server!

No Ransomware Paid!
34

#RSAC
Some Thoughts on Okta (And Critical SaaS)

#RSAC
36

SaaS Breaches Are Here!

The

Breach was just a reminder.

SaaS Breaches are Challenging!
You only have partial control You may lack the relevant forensics data You may lack the skill needed to investigate Each platform has different capabilities

#RSAC
It goes straight to high value targets
... etc.
37

#RSAC
Key Takeaways!

#RSAC
So, What Can We Do?

Breaches are Inevitable

World is moving to the Cloud

Cloud Breaches are Here!

1
Learn
Continue learning about actual cloud breaches to allow for better prevention, detection and response

2
Prepare
Create the right plans, tools capabilities and team, to be
ready to deal with cloud breaches when they occur

3
Respond
Deploy fast and efficient Incident Response tech and
teams to reduce impact and prevent loss
39

#RSAC
THANK YOU!
Ofer Maor CTO Mitiga @OferMaor

