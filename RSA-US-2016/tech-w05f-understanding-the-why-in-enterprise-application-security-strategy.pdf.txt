SESSION ID: TECH-W05F
Understanding The "Why" In Enterprise Application Security Strategy
#RSAC

Troy Grubb
Information Security Manager, GRC & SAP Security The Hershey Company @TroyRGrubb

#RSAC
SAP Security ­ The New Reality
2

#RSAC
SAP Security ­ The New Reality

The Escalation of SAP Security Breaches

May 2015

2012

2013

2014

Anonymous claimed breach to Greek Ministry of Finance using
SAP zero-day exploit.

A malware targeting SAP systems discovered in the wild ­
A "Tsunami of SAP Attacks Coming?"

A Chinese hacker exploited a vulnerability in a corporate SAP
NetWeaver Portal.

Report: A Chinese Breach of USIS targeted SAP. Went
unnoticed for over six months and compromised over 48,000 employee records of DHS and
OPM.

3

SAP Security ­ The New Reality

2012

The Escalation of SAP Security Breaches

May 2015

2012

2013

2014

Anonymous claimed breach to A malware targeting SAP

Greek

Ministry

of

Finance

usingsystems discovered in the wild A "Tsunami of SAP Attacks

­

Anonymous claimed breach to
SAGrPeekzMeinrisotry-odf Fainyancee uxsipngloit.

Coming?"

SAP zero-day exploit.

A Chinese hacker exploited a vulnerability in a corporate SAP
NetWeaver Portal.

Report: A Chinese Breach of USIS targeted SAP. Went
unnoticed for over six months and compromised over 48,000 employee records of DHS and
OPM.

4

#RSAC

#RSAC
SAP Security ­ The New Reality

2012

2013

2014

The Escalation of SAP Security Breaches

May 2015
May 2015

2013

2014

Report: A Chinese Breach of

USIS targeted SAP. Went

Repourntn:oAticeCd hforinoveersseix mBornethasch of

A Chinese hacker exploited a

USIaeSnmdtpcaloomyregpereroetmceoisrdeddsSoovfAeDrPH4.S8,aW0n0d0ent

GArneoenkSyAMmPionzuiessrtorcy-ladoiamfyFeeidnxapbsnlryocesieatAt.Aecu"mhsmTitssnsaoyugdsAltAnewi"mmsTassaacudmlnwoirsaCacemvrooiemvieoetotiafrnarerSgfgdAe?eriP"tSngidnAtAgehtteSaiPtAncwPkiisnlAdvtg­hutAtelSanCAcwehkPriisalNndvbeuelni­stleierWNatbeyihtleiWtyiaeaniancvvaekaercoePrrocprrotoPareal.rotexprSpAotPalrola.ittaueeennmddnSpoAcalotoPimyceepderorfoemOrcOoiPoPsrMMevd.eds.roosvfixeDrmH4oS8n,a0tnh0ds0

Coming?"

5

#RSAC
Risk of SAP Insecurity

Risk = Loss ( Threat + Vulnerability)
Sensitive Information Tangible Assets ­ Tech IP, Customer/Vendor Data, Financial Records, Personnel Records ( PII )

Loss is significant 74% of world's financial transactions touch and SAP System 86% of global fortune 500 run SAP software SAP serves > 263,000 customers in 190 countries "The impact of an SAP breach is serious to catastrophic in 92% of organizations" ­ Ponemon Institute Average cost of breach involving SAP systems if $4.5 Million Dollars We identify SAP in the scope of our "crown jewels"

6

6

#RSAC
Changes in SAP Environment
7

#RSAC
Security Gap
SAP Security Team
Operations and Infrastructure ERP teams Reactive/Tactical service oriented Success defined by audit and compliance Other risks were out of scope
Information Security Team
Vulnerability Management/Malware Defense Cyber Defense/Incident Response Weak in SAP Knowledge
Both groups identified the other as responsible making it difficult to pursue an SAP Security Strategy
8

#RSAC
Are our SAP Systems Secure?
Common Responses
Patch Management/ System Recommendations Configuration Management/Configuration Validation Early Watch/ SOSS Service Market Place/SAP Security Guides RAL/UCON
End State SAP Security Team Solely Responsible The unknown?
9

#RSAC
Transition to Information Security

#RSAC

Speaking a common language

SAP Critical Controls
Reduce Attack Surface
Gateway Security Protect Default Users Secure RFC Management
Secure Communications Password Management / SSO
Maintain Security Logs Patch Management / SDLC
System Configurations Access Management Secure Code
Data Classification
Critical Access

SANS Top 20
3 - Secure Configurations for Hardware and Software on Servers 10 - Secure Configurations for Network Devices such as Firewall, Routers, and Switches 12- Controlled Use of Administrative Privileges 11 - Limitation and Control of Network Services
3 - Secure Configurations for Hardware and Software on Servers 16 - Account Monitoring and Control
18 - Incident Response and Mgmnt 14 - Maintenance, Monitoring and Analysis of Audit Logs 6 - Application Software Security
3 - Secure Configurations for Hardware and Software on Servers 15 - Controlled Access Based on the Need to Know 6 - Application Software Security 1 - Device Inventory 2 - Application / Software Inventory 12- Controlled Use of Administrative Privileges

SAP Security Framework

Vulnerability Management · Secure communications · Attack surface · Gateway · Default users · Secure RFCs · Password Management · Security Logs · Configuration · Patch Management · System Configuration Crown Jewels · Identification · Inventory · Data/Asset Classification Application Security · Code reviews · Architecture GRC Access Control · Administrative Privilege · System administration · Transport management · SODs/Fraud Protection
Control Enhancements Solution Development Architecture · Network segmentation Investigate Issues Resolve Problems Incident Response

Assess

Prevent

SAP Security

Respond

Detect

Role Design · Production · Non-production GRC Access Control / IDM · Automated workflows w/
integrated risk checks Governance · Access attestation · Role recertification · Critical access reviews Control implementation · Password management · Default accounts · Secure comms (SNC, https) · Gateway security · RFC security (UCON) · Configuration standards · Logging activities
Configuration validation · Password management · Default accounts · Attack surface · Gateway · Configuration Log monitoring · Network · System · Table · Document · Security Onapsis D&R

#RSAC

#RSAC
SAP VM Program Overview

#RSAC
SAP VM Program
POC in 2014 established context Leadership support based on business driver of differential protection of critical assets Founded program in February of 2015 Core team members from SAP Security, Basis, and Information Security Meet on regular schedule to identify, prioritize, and remediate risk Communicate to management on monthly basis Founded on external intelligence by partnering with 3rd Party SAP Security Research and Vulnerability Management Company
Holistic, Complete, Scalable Intelligence

#RSAC
SAP VM Program Impacts
Operational Impacts Identification of previously unrecognized risk > 60% Reduction in 12 months
Strategic Impacts Holistically, completely, and accurately define risk posture Risk visualization and analysis can be used to communicate up, down, and across the organization Leadership interest and support put risk into business context
15

#RSAC
Strategy of "Why"
"Why" people buy -
The Four Horsemen: Amazon/Apple/Facebook & Google-Who Wins/Loses
Scott Galloway ­ Clinical Professor of Marketing, NYU Stern
Start with "Why" ­ Simon Sinek
Provide a platform for success and drive purpose

Prevention
Mitigation and reductions via SAP Vulnerability Management Program
Configuration Management Configuration Validation
2 Target Systems
ZSEC - Alerting ZSECGOLD ­ Gold client
Patch Management System Recommendations
Used in combination with ConfVal for new system implementations New Standards for new system implementations UCON, RAL, Network Segmentation
17

#RSAC

#RSAC
Detection and Response
Configuration Validation Log Monitoring/Alerting Splunk
SAP Audit Logs SAP ICM logs SAP Gateway Logs Enterprise Firewall Logs IDS Signatures SAP RAL Read Access Logging Expanded partnership with 3rd party to provide scale
18

#RSAC
"Apply" Slide
Identify your business critical applications and who is responsible for system security Bridge the gap between SAP Security and Information Security teams Review the maturity and efficiency of your SAP Control Framework and build/redesign your SAP control framework based on risk Don't attempt to scale to fix all issues but instead work to influence others around you but showing progress towards realistic goals Transfer the risk by deploying a holistic and complete assessment and communication capability
19

#RSAC
Q&A
Troy Grubb, Information Security Manager, GRC and SAP Security tgrubb@hersheys.com @TroyRGrubb
20

