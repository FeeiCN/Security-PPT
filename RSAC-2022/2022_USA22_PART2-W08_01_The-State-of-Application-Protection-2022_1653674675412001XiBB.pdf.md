#RSAC
SESSION ID: PART2-W08
The State of Application Protection 2022
Sander Vinberg
Threat Research Evangelist, F5 Labs

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC

#RSAC
- Erasmus

#RSAC

#RSAC
Application Protection Report
Data-driven strategic security research
so you don't have to learn by "doing"

#RSAC
Agenda
Methods & Sources Data Breach Analysis
­ Breach Attributes ­ Application Tiers Model ­ Attack Chain Analysis
Notable Attacks & Campaigns Recommended Mitigations

#RSAC
State of the State of Security?
It depends on the angle.
Meta-analysis is not possible; multisource analysis is next best thing.
https://www.f5.com/labs/articles/threat-intelligence/the-state-ofthe-state-of-application-exploits-in-security-incidents

#RSAC
Sources
Why use breach disclosures?
­ All successful attacks ­ Nothing significant excluded for
given time and space
2021 n = 980

#RSAC
Data Breach Analysis

Breach Attributes
(flat, non-exclusive tags)
35%
2020 30%
2021
25%

#RSAC

20%

15%

10%

5%

0%
Web Exploit Business Email Compromise

Phishing

Third Party Mobile Exploit Cloud Breach Breach

Credential Stuffing

Ransomware Ransomware Interrupted

2021 U.S. Data Breach Distribution
Simple view, Application Tiers Model, n = 980
30%

25%

20%

15%

10%

5%

0% Access

Web

Accident

Physical

Malware

#RSAC

Insider

Third-party Data Loss

Unknown

2018-2021 U.S. Data Breach Distribution
Historical view, Application Tiers Model, unknowns removed
100%

#RSAC
Malware climbed to 30% of breaches in 2021

90%

80%

70%

60%

50%

40%

30%

20%

10%

0% 2018

2019

2020

2021

Access Web Accident Physical Breach Malware Insider Third-party Compromised

2021 U.S. Data Breach Causes by Sector
Unknowns removed, n = 758

Management of Companies and Enterprises Agriculture, Forestry, Fishing and Hunting Real Estate, Rental and Leasing Arts, Entertainment and Recreation Utilities Mining, Quarrying, Oil & Gas Extraction Accommodation and Food Services Wholesale Trade Public Administration Transportation and Warehousing Other Services Construction
Administrative, Support, Waste Management and Remediation Services Information
Manufacturing Retail Trade
Educational Services Professional, Scientific and Technical Services
Health Care and Social Assistance Finance and Insurance
0

Access Accident Malware Third-party Data Loss

Web Physical Insider

20

40

60

80

100

120

#RSAC

140

160

#RSAC
Data Breach Analysis Summary
Business email compromise present in at least 24% of attacks ­ Low reporting of credential stuffing and phishing, combined with high rate of BEC, indicates cred
stuffing and phishing detection are poor Access breaches remain single most common breach cause ­ Includes credential stuffing, phishing, brute force Use of malware grew to make up 30% of all known breach causes Ransomware grew but nonencrypting malware also grew Web exploits less common than past years but still a threat to retail organizations Top 3 targeted sectors: Finance and Insurance; Health Care; Professional, Scientific & Technical Services

#RSAC
Attack Chain Analysis
(or, more accurately, ATT&CK chain)

#RSAC
MITRE ATT&CK Framework
Tactics Techniques
17

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC
ATT&CK Tactics in U.S. Data Breaches, 2020-2021

Privilege Escalation (TA0004) Collection (TA0009)
Lateral Movement (TA0008) Persistence (TA0003)
Credential Access (TA0006) Impact (TA0040)
Execution (TA0002) Exfiltration (TA0010) Initial Access (TA0001)
0%

2020 2021

10%

20%

30%

40%

50%

60%

70%

80%

90%

100%

ATT&CK Techniques in U.S. Data Breaches, 2020-2021

Input Capture (T1056) Email Collection (T1114) Unsecured Credentials (T1552) Keylogging (T1056.001) Drive-by Compromise (T1189)
Defacement (T1491) Data Destruction (T1485) Cloud Instance Metadata API (T1522) Data from Cloud Storage Object (T1530) Exploitation of Remote Services (T1210) Phishing via Attachment (T1566.001)
Brute force (T1110) Email Forwarding Rule (T1114.003) Exfiltration to Cloud Storage (T1567.002)
User Execution (T1204) External Remote Services (T1133)
Internal Spearphishing (T1534) Phishing via Link (T1566.002)
Exfiltration Over Web Service (T1567) Valid Accounts (T1078)
Exploitation for Client Execution (T1203) Web Shell (T1505.003)
Credential Stuffing (T1110.004) Phishing (T1566)
Command and Scripting Interpreter (T1059) Automated Exfiltration (T1020)
Exploit Public-Facing Application (T1190) Data Encrypted for Impact (T1486)
0%

2020 2021

5%

10%

15%

20%

25%

30%

35%

#RSAC

40%

45%

#RSAC
Attack Chain Analysis Summary
Use of execution increased, reflecting the growing impact of malware Exfiltration techniques increased significantly, making up ~80% of application attacks Ransomware increased significantly, playing a role in 42% of application attacks Web exploits decreased, but became more focused on formjacking Attack chains illustrate importance of defense in depth, balancing analysis of tactics with that of techniques

#RSAC
Notable Attacks and Campaigns

#RSAC
Accellion FTA Attack Campaign
· Attacker exploits a SQL injection vulnerability in the Accellion File Transfer Appliance (FTA) product. · The injection attack retrieves a key that allows attacker to write an eval-style PHP web shell to the file oauth.api. · Final payload, the DEWMODE web shell, is delivered by the initial web shell. · DEWMODE scans the MySQL database within FTA and lists available files and metadata on an HTML page for the attacker. · The attacker uses DEWMODE to exfiltrate selected files from the database. · The attacker initiates a cleanup process that uses a shell script to modify a log file, overwrite the incriminating log file with the
modified one, remove DEWMODE and the eval web shell, and delete the cleanup script and related temporary files.

#RSAC

#RSAC
Ransomware TTP Details
· Drive-by compromise masquerading as browser update · Attacker obtained credentials with elevated privileges through unspecified activity · Lateral movement for reconnaissance and persistence using legitimate tools and credentials · Disabled monitoring and security tools, destroyed backups. · Copied, compressed, and staged data from three virtual hosts for exfiltration · Exfiltration using MEGAsync to cloud storage · Encrypted data using unspecified ransomware

#RSAC
Additional Notable Campaigns

Auto Insurance Data Scraping Campaign
­ Targets include large insurers like GEICO as well as small, local companies
­ Automated scraping using seed information found elsewhere
­ Third-party data feed provided drivers' license numbers in HTML source, but not displayed on screen
­ License numbers used heavily in unemployment fraud
­ 13 organizations known to have been breached this way in 2021.

Repeat Formjacking
Multiple instances each year of repeat formjacking attacks
Organizations compromised by same attack multiple times in succession after ending incident response
Greatest variation in formjacking attacks lies in initial access and masquerading techniques
Illustrates dangers of declaring victory too early

Putting Ransomware in Context
Ransomware tactics have evolved ­ Exfiltration prior to encryption for added leverage ­ Long dwell times ­ Backups often destroyed or encrypted ­ not a definitive fix ­ Ransomware-as-a-Service and affiliate models increase both
likelihood and impact of attack Better to view ransomware as an alternative monetization approach to fraud, not as DoS Resilience of fraud pipeline in 2021 a surprise, but ransomware still growing

#RSAC

Understanding Formjacking
Injection attack (usually) to place malicious skimmer script onto retail payment processing functions Targets not limited to retail ­ any application that accepts payment is a target Great variety in masquerading, exfiltration techniques Diversity of malicious formjacking scripts grew 20x in 2021 ­ Onus is on vulnerability management, not signatures CSP, SRI potential controls for the right organizations

#RSAC

#RSAC
Recommended Mitigations
For more information: https://attack.mitre.org/mitigations/enterprise/

Recommended Mitigations I
Sorting by Frequency (depth)
Mitigation Data backup Application isolation and sandboxing Exploit protection Network segmentation Privileged account management Update software Vulnerability scanning Filter network traffic Network intrusion prevention Antivirus/antimalware Code signing Disable or remove feature or program Execution prevention Restrict web-based content User training Account use policies Multifactor authentication Password policies User account management Application developer guidance Limit access to resource over network Audit Encrypt sensitive information Threat intelligence program Restrict file and directory permissions

Frequency 0.42 0.17 0.17 0.17 0.17 0.17 0.17 0.13 0.13 0.12 0.12 0.12 0.12 0.12 0.09 0.06 0.06 0.06 0.06 0.04 0.03 0.01 0.01 0.00 0.00

#RSAC

Recommended Mitigations II
Sorting by Coverage (breadth)
Mitigation Restrict web-based content Disable or remove feature or program Multifactor authentication Network segmentation User training Application isolation and sandboxing Exploit protection Network intrusion prevention Privileged account management User account management Antivirus/antimalware Data backup Filter network traffic Password policies Update software Account use policies Audits Encrypt sensitive information Execution prevention Limit access to resource over network Vulnerability scanning Application developer guidance Code signing Restrict file and directory permissions Threat intelligence program

Coverage 7 5 5 5 5 4 4 4 4 4 3 3 3 3 3 2 2 2 2 2 2 1 1 1 1

#RSAC

Recommended Mitigations III
Frequency (depth) x Coverage (breadth) = Arbitrary Effectiveness Coefficient

Mitigation Data backup Network segmentation Restrict web-based content Application isolation and sandboxing Exploit protection Privileged account management Disable or remove feature or program Update software Network intrusion prevention User training Filter network traffic Antivirus/antimalware Vulnerability scanning Multifactor authentication Execution prevention User account management Password policies Code signing Account use policies Limit access to resource over network Application developer guidance Audit Encrypt sensitive information Threat intelligence program Restrict file and directory permissions

Arbitrary Effectiveness Coefficient 1.26 0.85 0.85 0.68 0.68 0.68 0.61 0.51 0.50 0.43 0.38 0.36 0.34 0.29 0.24 0.23 0.17 0.12 0.11 0.06 0.04 0.01 0.01 0.00 0.00

#RSAC
https://attack.mitre.org/ mitigations/enterprise/

#RSAC
"Apply" Slide
Next week, you should:
­ Begin hardening processes by ensuring your inventory is up to date ­ Scope a multifactor authentication initiative (if not in place) ­ Assess backup capabilities; expand if necessary, test recovery
Within three months, you should:
­ Have begun hardening processes identified in inventory
Within six months, you should:
­ Have set up monitoring and alerts for pre-ransomware tactics
39

#RSAC

