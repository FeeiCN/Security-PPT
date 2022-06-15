Copyright © 2012 Splunk Inc.
Using Analytics-Driven Security Platform to Find Advanced Attacks and Malware
Cui Yue  Senior Security Specialist North Asia Region

Top Security Concerns from CISO

Advanced Cyber-Attacks

Malicious Insider Threats
Online Account Take over

Ransomware
2

Ransomware : Cybercriminals new attack of choice
http://blog.checkpoint.com/2016/04/06/ransomware-cybercrim inals-new-attack-of-choice/

Ransomware : and it's a "good" business

Compliance & Regulations

Reg Type Applicability Protects

How

Penalties

All Authorized Industry, Institutions HKMA Hong (AI) doing Kong business in Hong Kong

apply to all IT systems used by financial institutions;

· Provide Guidelines and Circulars and required the AI to impose security controls and measures to address the followings : -
· Internet Banking security
· Anti-Money Laundering and Counter-Terrorist Financing
· And more ...

The Hong Kong Monetary Authority (HKMA) has fined the local branch of State Bank of India (SBI) for contravening specified provisions in its Anti-Money Laundering and CounterTerrorist Financing (Financial Institutions) Ordinance. A penalty of HK$ 7.5 million ($970,000) has been imposed.
(http://www.hkma.gov.hk/eng/keyinformation/pressreleases/2015/20150731-5.shtml)

5

HKMA Guidelines
2015 Sept : Cyber Security Risk Management
­ Authorized access control, secure configuration, vulnerability management, privileged account control, sensitive data protection, Resilience, Security Education
­ Defense against malware and APT ­ Unusual activities detection ­ Incident Responses (IR), Digital forensic
2016 May : Cyber Security Fortification Initiative
­ 1. Structured Assessment Framework ( Analysis Threat Intelligence ) ­ 2. Focused training for cyber security professionals ­ 3. Simulation Testing

SFC Guidelines
2016 Mar: Suggested Cyber Security Control
1) Establish a strong governance framework to supervise cybersecurity management; 2) Implement a formalized cybersecurity management process for service providers; 3) Enhance security architecture to guard against advanced cyber-attacks; 4) Formulate information protection programs to ensure sensitive information flow is protected; 5) Strengthen threat, intelligence and vulnerability management to pro-actively identify and
remediate cybersecurity vulnerabilities; 6) Enhance incident and crisis management procedures with more details of latest cyber-attack
scenarios; 7) Establish adequate backup arrangements and a written contingency plan with the
incorporation of the latest cybersecurity landscape; and 8) Reinforce user access controls to ensure access to information is only granted to users on a
need-to-know basis.

APT malware is hard to prevent - signature update is always not
fast enough - On target ( phishing email ) - Cannot be found in Security Logs
8

Cyber Security Analytic Team

Security Analytics Needs >
What are some of the technical challenges in managing data?

Ability to process large volumes of transactional data for long period of time.

Ability to process transactions in
real-time for detection of fraud

Ability to analyze complex patterns of transactions and be able to profile
user objects

Splunk Portfolio
Across Data Sources, Use Cases & Consumption Models

ADVANCED
SECURITY ANALYTICS

fifth consecutive year !!
ADVANCED
SECURITY ANALYTICS

Best Fraud Prevention
Solution

Best SIEM Solution

Cyber Kill Chain : APT Detection and Response

Transaction
Threat intelligence

Gain Access to system
Web Portal
. pdf

Create additional environment

Conduct Business

Network Activity/Security
Host Activity/Security

MAIL
Events that contain link to file

Auth - User Roles

Proxy log C2 communication to blacklist

WEB

What created the program/process?

How was process started?

Process making C2 traffic

.pdf

Calc.exe

Svchost.exe

15

All Machine Data is important for hunting

Threat intelligence & Analytics
Network Activity/Security
Host Activity/Security
Auth - User Roles
Context

Are you currently collecting ALL IT Data (Authentication, DNS/DHCP, Proxy and Firewall events) for security analytics ? Do you have a list of Assets and Identities by priority?
How about your "CLOUD data "??

DATA SOURCES for your Security Analytic Team

Identity/Auth
Active Directory/ Domain Controller
Single Sign-on
HRMS
VPN DNS, DHCP

Activity (N-S, E-W)
Email Gateway
Web Gateway
Firewall
Netflow, PCAP
DLP, File Server/Host Logs

Security Products
Malware End-point IDS, IPS, AV
Traditional
17

SaaS/Mobile
AWS CloudTrail
Box, SF.com, Dropbox, other SaaS
apps
Mobile Devices

External Threat Feeds
Cisco Threat Intelligence, Norse, Threat Stream, FS-
ISAC, STIX/TAXII, Facebook
ThreatExchange or other blacklists for
IPs/domains, username, MD5 hash
New Challenge

Great apps for Cloud and mobile data source
https://splunkbase.splunk.com
Splunk TA for Facebook ThreatExchange
18

Splunk App for Enterprise Security
First solution with out-of-the-box content to manage known and unknown threats.

SOC Staff

Security Analysts

Security Execs/Mgrs

Security Auditors

Scalability to manage multi-terabytes of real-time and historical data Pre-built security correlation rules, reports, and dashboards Statistical analysis for defining `normal' Incident investigation and management framework

Using Threat Data to enrich context in REAL-TIME

Make it easier to ingest and de-duplicate threat intelligence Workflow actions and dashboards to view threat data in context

vendor1 vendor2 vendor3 vendor4

85.17.20.241, vendor1|vendor2|vendo r3, tor|proxy|malware,
block 213.159.117.134,
vendor3, spyware|malware, block

Dashboards and Reports

Threat Detecting Correlation Searches

Notable Event

Traffic Stream as seen by Splunk

Threat Data from Mandiant APT1
21

Facebook ThreatExchange
· Provides domain names, IPs, hash threat indicators
· Use with ad hoc searches and investigations
· Need an app ID and secret from Facebook · Config Splunk add-on for FB ThreatExchange · Customers already use !
22

Threat Intelligence ­ Pre-config Threat Lists
23

Customer Case: Client running P2P ( BT bit torrent )
Client IP : 172.26.228.230 Time : 18:10 5/3/14
Threats : Accessing following Bad IP
- Tor (anonymous proxy) - Piratebay (BT host) - Blocked IP site - Known spyware site
Verified with PC configuration and this PC has installed the BT client software.
24

Advance Threat Detection example : URL Length Analysis

Compare each URL statistically to identify outliers

Investigate long URLs where no referrer exists

See how many assets are talking to the URL

Look for long URLs that may include embedded
C&C instructions
25

A lot of web-based attack are using VERY long URL
Mean URL length for 128 Byte looks Normal
But for Max URL length for 9KB size, it looks suspicious.
We found a lot of LONG URLs which is trying to access the external site : "http://103.7.28.187/pingd?type-1&dm= www.discouss.com.hk ... "
After verified with http://urlquery.net/report.php?id=21824 84, they are Tencent QQ/wechat Message. The long http packages are encrypted SMS.
26

DNS Tunneling
27

Finding Clients with extremely Looooooooooooong queries · DNS Tunneling
Find anything that is 2 standard deviations
sourcetype=bro_dns |eval len=len(query) | eventstats stdev(len) AS stdev avg(len) AS avg p50(len) AS p50 | eval length=len(query) | where length>(stdev*2) | stats count by length stdev avg p50 qtype_name query |
sort -length
Finding queries over 200 characters long
sourcetype=bro_dns | `ut_parse(query)`| eval length=len(query) |search length>200| stats count by query
28

Finding Queries Over 200 characters
29

Advance Threat Detection example : New Domain Analysis
Hosts talking to recently registered domains

Discover outlier activity to newly registered domains
30

Identify unexpected top level domain activity

Inside Threat : How to detect and trace Unknown Data Exfiltration ??
Same events can have different security meanings, based on sequence:

Analyst / Investigator

Event 1 ... 13:01:21 Event 2 ... 13:42:17 Action 3 Note "Windows event" What happened?

If event 1, then event 2, then... Ah ­ ha, that's how they got in. Now what infected the host?

Known DNS Unknown DNS Unknown DNS

Unknown DNS = Misconfiguration

Unknown DNS = Recon, Lateral Movement

C&C Site

Lots of DNS Event = Exfiltration

31

Chasing Ransomware
Standard Remediation steps : 1) Isolate "the patient(s)" 2) Fix the "the patient(s)" 3) How did it get in?
- What's the link? - Who else has the link?(vector) - Who else has clicked the link? 4) Disconnect Shared drives 5) Start the restore ....
Who is patient ZERO ?
32

4663 (File/Reg Auditing) ­ In Splunk
sourcetype=WinEventLog:Security EventCode=4663 NOT (Process_Name="*\\Windows\\servicing\\TrustedInstaller.exe" OR "*\\Windows\\System32\\poqexec.exe") NOT (Object_Name="*\\Users\\svc_acct\\pnp" OR Object_Name="C:\\Users\\Surf\\AppData\\Local\\Google\\Chrome\\User Data*" NOT Object_Name="C:\\Users\\Surf\\AppData\\Roaming\\Microsoft\\Windows\\Recent\\CustomDestinations") NOT (Object_Name="C:\\Windows\\System32\\LogFiles\\*" OR Object_Name="*ProgramData\\Microsoft\\RAC\\*" OR Object_Name="*\\Microsoft\\Windows\\Explorer\\thumbcache*" OR Object_Name="*.MAP" OR Object_Name="*counters.dat" OR Object_Name="*\\Windows\\Gatherlogs\\SystemIndex\\*") | rename Process_Name as Created_By | table _time, host, Security_ID, Handle_ID, Object_Type, Object_Name, Process_ID, Created_By, Accesses

Detect CryptoLocker Type attack
View of a typical CryptoLocker events. EventID4663 = file deleted/write success
sourcetype="WinEventLog:Security" AND EventCode=4663 | stats count by src_ip
you can see the events and setup alerts to trigger when a threshold outside the norm of your users is reached. E.g. "> 250 events per hour"
sourcetype="WinEventLog:Security" AND EventCode=4663 | stats count by src_ip | where count > 250
http://hackerhurricane.blogspot.hk/2014/01/how-to-detect-cryptolocker-type-attack.html 34

Drill down view for the patient zero
sourcetype="WinEventLog:Security" EventCode=4663 | stats count values(Object_Name) by src, user | where count > 2000
35

Find the infection relationship by one search
We know: ­ User IDs of encrypted files on shared drives
We assume: ­ Payload/link was delivered by e-mail or web
What does Splunk know: ­ Mail header logs ­ Proxy logs
36

We can find the hacker's email in sec ...
37

RAA, a new Ransomware variant using only JavaScript
· exclusively uses JavaScript in order to encrypt personal files using AES.
· this ransomware also drops Pony malware (a wellknown info-stealer).
· malicious email attachments pretending to be .doc files. when executed, is drop a file in the %userprofile%\documents folder and open that with WordPad, pretending it is corrupt.
· to make sure that files cannot be recovered using the File History option, the Volume Shadow Service (VSS) is deleted.
http://blog.emsisoft.com/2016/06/15/raa-a-new-ransomware-variant-using-only-javascript/
38

Detect the creation of the new run service
sourcetype="WinEventLog:Security" AND EventCode=7045 | stats count by src_ip Service added to the endpoint
39

Six Windows Events to monitor

Win ID 4688/592

What New Process executed

4624/528 /540 Some account logged in

5140/560 5156
7045/601 4663/567

A share was accessed
Windows Firewall Network connection by process
Service added to the endpoint
File & Registry auditing

Impact to Security
Malware executed or malware actor trying to take action Attacker authenticated to the endpoint
What endpoints were accessed
Command and Control or origin of attack
Persistence to load malware on restart
Modifications to the system that create holes or payloads used at a later time

Activity detected New programs installed by attacker (not by user)
What accounts did and what accounts at what times are normal? C$ share or File share accessed What application was used to communicate with external or internal IP Service added or modified
Files added and Registry Keys added to audited locations

Best Practice Guidelines
Refer to the Splunk SANS 20 whitepaper for detailed use cases and examples of how customers use Splunk for security to achieve the anticipated improvement with:
ü Faster Detection of Security Events ü Faster Research and Investigation ü Reduced Risks with Data Breach and further
protect your Brand

Thank You cyue@splunk.com
42

Steps You Will Need to Take

· Enable Advanced Audit Policy in Windows
­ The "Windows Logging Cheat Sheet" ­ Audit Process Creation = Success
­ Audit Logon = Success & Failure ­ Audit File Share = Success ­ Audit File System = Success
­ Audit Registry = Success ­ Audit Filtering Platform Connection = Success ­ Services already captured by System Log

4688
4624 5140 4663
4663 & 4657 5156 (Any/Any min) 7045 & 7040

· Enable and Configure to capture Process Command Line

· Use the Splunk Universal Forwarder or Splunk Window Infrastructure App or syslog... to get data to central location
­ Modify the inputs.conf to blacklist or whitelist as needed

Enable Command Line Logging : Windows 7 Through 2012 (Win 10 too)
"Include command line in process creation events"
­ http://technet.microsoft.com/en-us/library/dn535776.aspx
1. Windows 8.1 and 2012 R2
­ Administrative Templates\System\Audit Process Creation
2. You must have the patch for MS15-015 (KB3031432) for Win 7 and Win 2008, From Feb 2015
3. Registry key tweak
­ Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit\ProcessCre ationIncludeCmdLine_Enabled to DWORD - 1

And You Will See this Added to Your Logs
· Only a fraction more data · Most valuable thing to log
Additional context important to identify abnormal behavior

PowerShell ­ Command Line
Details on setting PowerShell preference variables ­ http://technet.microsoft.com/en-us/library/hh847796.aspx
1. Create a default profile for all users: ­ C:\Windows\System32\WindowsPowerShell\v1.0Profile.ps1
2. Add these to your default profile.ps1 file ­ $LogCommandHealthEvent = $true ­ $LogCommandLifecycleEvent = $true
3. Splunk - Inputs.confindows platform specific input processor ­ [WinEventLog://Windows PowerShell] ­ disabled = 0
4. Upgrade PowerShell to ver 3 or ver 4
· Investigating PowerShell Attacks (DefCon & Blackhat 2014) ­ Ryan Kazanciyan TECHNICAL DIRECTOR, MANDIANT ­ Matt Hastings CONSULTANT, MANDIANT

