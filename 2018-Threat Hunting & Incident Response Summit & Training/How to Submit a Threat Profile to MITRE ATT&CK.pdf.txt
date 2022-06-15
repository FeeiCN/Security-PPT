How to Submit a Threat Profile to MITRE ATT&CK
Walker Johnson
September 2018

Disclaimer
 I am not here in the name of or speaking on behalf of my employer.
 All opinions expressed here are my own.
1

Agenda
1. Background 2. ATT&CK framework 3. Threat research & submissions 4. Indicators and techniques 5. Takeaways
2

Background
 In 2010 began 18 month adventure.  One client was a repeated victim.  We did DFIR work all over the world.  We got to know the attacker's methods.  Almost 4 years go by..
3

Limited References
1. Publicly Available Tools Used in Targeted Attacks = 16 known tools
Mandiant 2012 M-Trends Report
http://www.utdallas.edu/~mxk055100/courses/dbsec12f_files/trend-report.pdf
2. In-Depth Look: APT Attack Tools of the Trade = 18 known tools
Trend Micro 2013 Blog Post
http://blog.trendmicro.com/trendlabs-security-intelligence/in-depth-look-aptattack-tools-of-the-trade
4

MITRE ATT&CK
· May 2015
· ATT&CK now:
 11 Tactics  70+ Threat Groups  200+ Techniques  230+ Tools & Utilities  500 References
5

MITRE ATT&CK
August 2015
Do you have public references that: 1. Associates the malware & tools to the group? 2. Associates the techniques to the group? 3. Can the references be definitively linked? 4. Are they clear and not open to interpretation?
6

Response
 They basically just wanted proof.  Proof is simply evidence of the truth.
Empirical evidence that supports sciencebased investigation = Forensic evidence
October 2015
MITRE ­ "don't think there is enough public reporting to assert with high confidence"
7

In other words..
8

Cyber Threat Group Named
 Threat group named:
­ October 13, 2015
FireEye researchers shed more light on infamous cybercriminals
associated with RawPOS malware. and christen it 'FIN5.'
http://www.darkreading.com/analytics/prolific-cybercrime-gangfavors-legit-login-credentials/d/d-id/1322645
 Another mention one day later
­ October 14, 2015
FIN5 hacking crew steals 150,000 credit cards from casino
http://securityaffairs.co/wordpress/41044/cyber-crime/fin5hacked-a-casino.html
9

GrrCon 2016 Presentation

 One year later a great presentation:

Attacking the Hospitality and Gaming Industries Tracking an Attacker Around the World in 7 Years
https://www.youtube.com/watch?v=fevGZs0EQu8

 55 Minute talk with tons of details

 Required some name decoding

Mandiant Name Public Name

FIENDCRY

MemPDumper by DiabloHorn

DUEBREW

Perl2Exe launcher

DRIFTWOOD

Perl2Exe data encoder

Purpose
Memory Searching Execution & Persistence Data Obfuscation (XOR)

10

GrrCon 2016 Presentation Cont.
 Details on tactics and techniques:
 They use RawPOS. Since 2008. "slow maturity cycle.. still works."  FIN5 by and large uses legitimate access . Most likely via vendors..  Very high statistical chance if RawPOS then.. most likely FIN5..
11

Threat Research with a Direct Link

 Research leads to related reports:

Date

Reference Link

10/2008 http://usa.visa.com/download/merchants/debugging_software_memory.pdf

05/2009 https://www.firstdata.com/downloads/partners/fd_gpm_notice_visa_security_alert_28may09_partnersupport.doc

06/2009 https://www.firstdata.com/downloads/partners/fd_gpm_notice_discover_alert_12june09_partnersupport.pdf

02/2014 https://www.symantec.com/security_response/writeup.jsp?docid=2014-021819-4159-99

09/2014 https://krebsonsecurity.com/2014/09/breach-at-goodwill-vendor-lasted-18-months/

10/2014 https://www.nuix.com/2014/10/09/taking-a-look-at-rawpos

03/2015 https://usa.visa.com/dam/VCOM/download/merchants/alert-rawpos.pdf

04/2015 http://blog.trendmicro.com/trendlabs-security-intelligence/rawpos-checking-in-at-a-hotel-near-you

04/2015 http://www.trendmicro.com/vinfo/resources/images/tex/pdf/RawPOS%20Technical%20Brief.pdf

01/2017 http://www.kroll.com/CMSPages/GetAzureFile.aspx?path=~%5Cmedia%5Cfiles%5Cintelligence-center%5Ckroll_malware-analysis-report.pdf

04/2017 http://blog.trendmicro.com/trendlabs-security-intelligence/rawpos-new-behavior-risks-identity-theft

12

13

Pivot #1 - Researching Presenters

Presentation:

INHOSPITALITY INDUSTRY: APT in

hospitality and gaming industry

Date: Conference: Presenter 1: Presenter 2:

October 13, 2015 Cyber Defense Summit (formerly Mircon) Emmanuel Jean-Georges Barry Vengerik

Presentation:

Attacking the Hospitality and Gaming

Industries Tracking an Attacker Around the World in 7 Years

Date: Conference: Presenter 1: Presenter 2:

October 7, 2016 GrrCon 2016 Preston Lewis Matt Bromiley

14

Researching Presenters Cont.
15

Researching Presenters Cont.
 Attacking the hospitality and gaming industries: Tracking an attacker around the world in 8 years
https://www.youtube.com/watch?v=lu2cBSItSZ4
16

Pivot #2 - IOC Exports

Report Name
Carbon Black Attack on Memory 012014 First Data Visa Targeted Hospitality 052009 First Data Visa Targeted Hospitality 062009 Kroll RawPOS Malware Report 012017 NUIX RawPOS Alert 092014 Trend Micro RawPOS Technical Brief 042015 Trustwave Spider Labs Malware Freakshow 062010 Trustwave Spider Labs Malware Freakshow 082009 VISA Malicious Software 042009 VISA RAWPOS Targeting Lodging 032015 VISA Targeted Hospitality Sector Vulnerabilities 122009

Hash Values
12 21 37 44 14 9 4 16 26 32 80 295

17

Additional Threat Research Reports Found

 Initial results on the hash values:

Date

Link

11/2008 https://www.bankcardcentral.com/resources/pdfs/visa-alerts/VisaDataSecurityAlert-MaliciousSoftware.pdf

04/2009 https://www.visa.com.ua/ua/ukua/merchants/riskmanagement/includes/uploads/AP040109_malicious_ip_add.pdf

08/2009 https://www.defcon.org/images/defcon-17/dc-17-presentations/defcon-17-nicholas_percoco-jibran_ilyas-malware_freak_show.pdf

12/2009 http://www.visa.com.ua/ua/uk-ua/merchants/riskmanagement/includes/uploads/AP120109_targeted_hosp_vulnerabilities.pdf

06/2010

https://media.blackhat.com/bh-us-10/whitepapers/Percoco_Ilyas/Trustwave%20-%20SpiderLabs%20-%20BlackHat-USA-2010-Percoco-IlyasMalware%20Freakshow-2010-wp.pdf

01/2014 https://www.carbonblack.com/2014/01/17/the-attack-on-retailers-memory-and-how-to-prevent-it

18

MD5 Hash Correlations
19

Additional Threat Research Reports Found
 Results from new searches:
The not so boring land of Borland executables
http://www.hexacorn.com/blog/2014/12/18/the-not-so-boring-land-of-borland-executables-part-2
Data Security Alert - Retail Data Security Breaches
https://www.moneris.com/~/media/Files/SecurityAlerts/Discover%20Retail%20Data%20Security%20Breach es%202015FEB.ashx
TELUS Security Labs - Backdoor.Win32.Rawpos.A
http://telussecuritylabs.com/threats/show/TSL20140219-03
Understanding malware targeting Point Of Sale Systems
https://blogs.bromium.com/understanding-malware-targeting-point-of-sale-systems
Visa issues security alert
https://www.merchantequip.com/merchant-account-blog/641/visa-issues-security-alert
Malicious Software, Tools, Hash(s) Value, and Registry Key
http://www.abacuspos.com/eAlerts/Malicious-Software-Jan-2009.pdf
20

Authoritative Threat Group Techniques
October 2017  Second submission  10 Tactics  14 Techniques  30 References  13 Security organizations
21

Initially Accepted Techniques (Jan, 2018)

File Name

Description

ATT&CK Technique

wce64.exe

This 64-bit version of Windows Credential Editor is modified/slimmed down. The file Valid Accounts had been obfuscated to appear as though it (T1078) was part of Apache Open Office3.

Stage in Lifecycle
Initial Compromise

ENT.exe

ENT (Essential NetTools) is a set of network

scanning, security and admin tools useful in Remote System

diagnosing networks and monitoring

Discovery (T1018)

network connections.

Reconnaissance

get2.exe

GET2 Penetrator Version 1.9.9d - Windows Authentication information exfiltrator.

Credential Dumping (T1003)

Escalate Privileges

PsExec.exe sdelete.exe

The SysInternals tool also has myriad legitimate uses to allow system administrators to remotely invoke executable file across a network.
SDelete 1.51 by SysInternals. Securely deletes data.

Service Execution (T1035)

Conduct Mission

File Deletion (T1107) Complete Mission
22

Anti Forensic Techniques Observed
 T1070 - Indicator Removal on Host
Description: Adversaries may delete.. event files.
 T1027 - Obfuscated Files or Information
Description: Adversaries may attempt to make or file difficult to discover or analyze by encrypting,.
 T1099 ­ Timestomp
Description: Timestomping is a technique that modifies the timestamps of a file..
 T1107 - File Deletion
Description: Adversaries may remove these files over the course of an intrusion..
23

Tactics and Techniques
24

Best Practices
1. Incident Response Best Practices
­ Identify adversary's footprint.., c2., and tools and techniques. ­ the attackers' tactics, techniques, and tools
NIST Guide for Cybersecurity Event Recovery http://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-184.pdf
2. CTI Sharing Best Practices
­ Cyber threat information includes indicators of
compromise; tactics, techniques, and procedures
NIST Guide to Cyber Threat Information Sharing https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-150.pdf
25

IR Pyramid of Pain
 Joe Slowik ­ "IOCs essentially `expire'.. the very moment they are discovered"
26

IOC Shelf Life
Threat Connect
 "most IOCs have a relatively short shelf life, often lasting only hours between their first and last observation in the wild."
https://www.threatconnect.com/blog/what-the-verizon-dbir-says-about-threat-intelligence-sharing
Webroot
 2015 over 97% of malware encountered by Webroot customers was seen on only a single endpoint.
 2016, approximately 94% of the malware observed by Webroot were only seen once
 2017, 93% of the malware encountered was seen on only one machine
27

Adversary Emulation
28

Worst Case Scenario
State Dept. hack the 'worst ever`
"suspected Russian hackers have bedeviled State Department's email system for much of the past year"
https://www.cnn.com/2015/03/10/politics/state-department-hack-worst-ever/index.html
No Easy Breach: Challenges and Lessons Learned from an Epic Investigation
https://www.youtube.com/watch?v=cF9MeFhNn-w
29

Lessons Learned
1. All actors leave behind evidence. 2. You can determine how your attacker
likes to operate and get left of them. 3. A little persistence will pay off. 4. You now have a great way to share!
30

Questions?
Thank You!
Email: wjohnsonsled@gmail.com Twitter: wjohnsonsled
31

