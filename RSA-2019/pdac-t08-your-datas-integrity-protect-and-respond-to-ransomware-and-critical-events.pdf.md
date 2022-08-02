SESSION ID: PDAC-T08
Your Data's Integrity: Protect & Respond to Ransomware and Critical Events

Anne Townsend
The MITRE Corporation/NCCoE

NOTICE This software (or technical data) was produced for the U. S. Government under contract SB-1341-14-CQ-0010, and is subject to the Rights in Data-General Clause 52.227-14, Alt. IV (DEC 2007) ©2019 The MITRE Corporation. All Rights Reserved.

Approved for Public Release; Distribution Unlimited. Public Release Case

Number 19-0447

#RSAC

#RSAC
AGENDA
Data Integrity (DI) Programs Structure DI: Identify & Protect Architecture DI: Detect & Respond Architecture DI: Recover Architecture Additional Use Case Scenarios Follow On Work
2

Data Integrity Programs Structure
Aligned to the NIST Cybersecurity Framework & Cyberattack Life Cycle

#RSAC
Challenge
Organizations' data -- database records, system files, configurations, user files, applications, and customer data -- all potential targets of data integrity attacks
Approach
Effectively identify and protect assets against data integrity attacks Detail methods and potential tool sets that can detect, mitigate, and contain data integrity events Effectively recover from a data integrity event
4

#RSAC
Data Integrity Projects
· 1800-xx Data Integrity: Identifying and Protecting Assets Against Ransomware and Other Destructive Events (ID-PR)
· 1800-xx Data Integrity: Detecting and Responding to Ransomware and Other Destructive Events (DE-RS)
· 1800-11 Data Integrity: Recovering from Ransomware and Other Destructive Events (REC)
5

#RSAC
Cyber Attack Lifecycle

Before

During

After

ID-PR

DE-RS

REC

http://www2.mitre.org/public/industry-perspective/documents/lifecycle-ex.pdf
6

#RSAC
Data Integrity Project Partners
7

Data Integrity: The Architectures

Architecture for Identify & Protect

Logging

Secure Storage

Backups

Integrity Monitoring
Enterprise VMs

Vulnerability Management

Policy Enforcement

Inventory

Databases Clients

Enterprise Components

Legend

Internet
Policy Information/operations Integrity Information Vulnerability Information

Network Protection
Blacklisting
Inventory Information Backup Information Log/Audit Information
9

Organizational Data

#RSAC

#RSAC
Ransomware via Web Vector and Self-Propagation

User Workstation
 
Active Directory Server

 


Malicious Website
 
Enterprise Server

1. User visits watering hole website and becomes infected with ransomware.
2. Ransomware exploits a vulnerable Active Directory server to obtain credentials.
3. Ransomware propagates to an enterprise server.
4. Ransomware generates encryption key and sends it to home server.
5. Ransomware executes on both machines and encrypts files.

10

#RSAC
Ransomware via Web Vector and Self-Propagation

User Workstation
 
Active Directory Server

 


Malicious Website
 
Enterprise Server

1. User visits watering hole website and becomes infected with ransomware.
2. Ransomware exploits a vulnerable Active Directory server to obtain credentials.
3. Ransomware propagates to an enterprise server.
4. Ransomware generates encryption key and sends it to home server.
5. Ransomware executes on both machines and encrypts files.

11

#RSAC
Architecture for Detect & Respond

Mitigation and Containment

Integrity Monitoring

Event
Detection

Enterprise VMs Databases
Enterprise Components
Clients

Logging

Reporting

Security Team

Forensics/Analytics

Legend

Detected Events Integrity Information

Mitigation Actions Log/Audit Information
12

Anomaly detection Forensic Information

User Interaction

#RSAC
Ransomware via Web Vector and Self-Propagation

User Workstation
 
Active Directory Server

 


Malicious Website
 
Enterprise Server

1. User visits watering hole website and becomes infected with ransomware.
2. Ransomware exploits a vulnerable Active Directory server to obtain credentials.
3. Ransomware propagates to an enterprise server.
4. Ransomware generates encryption key and sends it to home server.
5. Ransomware executes on both machines and encrypts files.

13

Architecture for REC

Legend

Data Flow Security Monitoring Data Flow
User Interaction

Secure Storage

Backup and Recovery
Enterprise Virtual
Infrastructure

Backup and Recovery

Data and Applications

Infrastructure

Databases

Integrity Monitoring

Security Team
Logging

14

#RSAC

Additional Use Case Scenarios

#RSAC
New Employee (Unique to ID-PR)


Enterprise Network

Employee Workstation
16

1. A new employee receives a new workstation and connects it to the network.
2. The workstation is missing critical security updates and threatens the
safety of the network.

#RSAC
Destructive Malware via USB Vector

User

1. User finds malicious USB in parking lot and inserts it into their workstation.

2. The malicious USB has several files



USB

on it, including a README and an



executable named "notepad.exe."

The user double clicks either of the

files.



3. The file executes. It modifies and

Workstation

deletes files in the user's Documents folder.

17

#RSAC
Accidental VM Deletion via Maintenance Script

User

 Maintenance Script

1. A privileged user creates a maintenance script to perform maintenance on the organization's
virtual machines. 2. The maintenance script contains a
bug, and accidentally deletes a virtual machine.



Virtual Machine Server
18

#RSAC

Backdoor Creation via E-mail Vector

User Workstation 


 Phishing Email

Active Directory Server

1. A privileged user receives an email as a target of a spear phishing campaign. The phishing email contains a malicious spreadsheet attachment.
2. The user opens the spreadsheet, and is prompted to run macros.
3. The spreadsheet creates backdoors in Active Directory using the user's permissions.

19

#RSAC
Database Modification via Malicious Insider

Insider 

 Database Server

Organization's Intranet Page

1. A malicious insider operating for a competing organization seeks to disrupt the organization's operations. He discovers a vulnerability on the organization's intranet page which allows him to manipulate the database.
2. Through the web page, he is able to delete data from tables in the database.

20

#RSAC

File Modification via Malicious Insider

Insider

1. An employee sees an administrative

coworker editing a spreadsheet that



contains employee salary and stock

information. He takes note of the





Backup Storage

format of the spreadsheet.
2. The employee acquires administrative credentials which were left on a sticky

Spreadsheet

note. He uses these credentials to search the company files for his name in

an attempt to change the number of

Shared File System

shares he receives annually.

3. He also attempts to change any

backups of the file.

Coworker

21

#RSAC

Backdoor Creation via Compromised Update Server

Malicious Actor

1. A malicious actor has compromised an update server, so that the update server distributes vulnerable versions of vsftpd, an Ubuntu file sharing service.



2. An Ubuntu workstation in the enterprise requests updates from the compromised

update server.

Malicious Actor

Compromised

Workstation

Update Server

 

 

Ubuntu Workstation



3. The update server provides the vulnerable service to the workstation.
4. The malicious actor exploits a backdoor in the vulnerable service from his workstation.
5. The service opens a port on the Ubuntu machine.
6. The malicious actor is able to acquire a root shell through this open port, from his workstation.

22

Data Integrity: Project Artifacts
Available at nccoe.nist.gov

SP 1800 Series: Volumes Overview
Volume A: Executive Summary
­ High-level overview of the project, including a summary of the challenge, solution, and benefits
Volume B: Approach, Architecture, and Security Characteristics
­ Deep dive into challenge and solution, including approach, architecture, and security mapping to the NIST Cybersecurity Framework and other relevant standards
Volume C: How-To Guide
­ Detailed instructions on how to implement the solution, including components, installation, configuration, operation, and maintenance
24

#RSAC

#RSAC

SP 1800 Series: Mappings

Security Controls Mapping

Technology Mapping

25

Follow on Data Security Work

One Unified Data Integrity Architecture
Logging

Secure Storage

Backup &
Recovery

Integrity Monitoring

Event Detect

Vulnerability Mgmt

Reporting Policy Enforcement
Inventory Forensics/Analytics

#RSAC
Security Team

Internet

Enterprise VMs

Databases Clients

Enterprise Components

Network Protection Blacklisting
27

Mitigation and
Containment

#RSAC
Tying It All Together

SP 1800-XX IDENTIFY & PROTECT
IDENTIFY
Identify Assets

SP 1800-XX DETECT & RESPOND
DETECT
Integrity Monitoring

PROTECT
Integrity Baseline

SP 1800-11 RECOVER
RECOVER
Identify Last Known Good

28

#RSAC
Next Project: Data Confidentiality
Addressing how to identify, protect, detect, respond, and recover to a data confidentiality attack. Unique: User controls need to also be in place in order to ensure only authorized individuals can access to the data. Currently at the project beginning with the release of the project description documents available on NCCoE website
29

Applying What You've Learned

#RSAC
Applying This Work
Educate + Learn = Apply

Provide strategies for data security

Understand how these strategies may apply to your
own organization

Bring back to your organization new approaches
to resolve data security challenges

#RSAC
Immediate Actions
­ Investigate into your own organization if you have the capabilities presented here
­ Collaborate with us!!!
­ Participate in builds with us to help refine, focus, and strengthen data security capabilities. oCan communicate through our email address, communities of interest, meetings, or website

#RSAC
Future Actions
Overlay the proposed architecture with your own organization's architecture and note differences Map differences to security control map; gauge what's missing Use technology mapping to understand if one's own organization technologies are providing the necessary capabilities

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Re-assess your own organization's data security capabilities ­ Join the NCCoE Data Integrity Community of Interest
In the first three months following this presentation you should:
­ Understand what capabilities your organization's technologies are providing
­ Understand what security controls may need to still be addressed
Within six months you should:
­ Begin to incorporate potentially new capabilities to strengthen organization's ability to provide data security

#RSAC
Contact Information
https://www.nccoe.nist.gov/projects/building-blocks/data-integrity

Jennifer Cawthra
Government Lead Jennifer.Cawthra@nist.gov

Anne Townsend
MITRE apalm@mitre.org

Data Integrity Team
di-nccoe@nist.gov

Backup Slides
DRAFT -- NOT FOR PUBLIC RELEASE

Compromised Update Server

Machine connected to network.
Machine is unpatched.

Identify
Machine is identified. (Cisco ISE + CryptoniteNXT)
Vulnerabilities due to lack of updates are detected. (Tripwire IP360)

Protect
Machine is prevented from communicating on the internet prior to authentication. (CryptoniteNXT)

Detect

#RSAC
Respond

37

User visits site
User downloads tool on A User runs tool on A
Tool downloads files
Tool exploits AD
Tool copies r-ware to B
R-ware runs on A and B
R-ware sends key to home
R-ware encrypts files

Vendors used in Ransomware Use Case

#RSAC

Identify

Protect

Detect

Respond

Site is blacklisted. (Cisco WSA)
Downloads from site are blocked. (Cisco WSA)

Site is identified as malicious. (Cisco Stealthwatch + Symantec Security Analytics)
Tool identified as malicious. (Cisco AMP)

Site is added to blacklist. (Used in Protect)
Download stopped or files deleted. (Cisco AMP?)

Vulnerability is identified. (Tripwire IP360)
Sensitive files are inventoried. (Symantec DLP)

Tool identified as malicious. (Cisco AMP)

Downloads from site are blocked. (Cisco WSA)

Downloaded files are identified as malicious. (Cisco AMP)

Vulnerability is patched or machine is quarantined. (Cisco ISE)
Attempts to propagate are prevented. (Cryptonite NXT)

Attempts to propagate are detected. (Cisco AMP/Stealthwatch + Symantec Security Analytics)
Execution identified as malicious. (Cisco AMP)

Connection to site blocked. (Cisco WSA)
Backups are taken. (FileZilla + Duplicati) Integrity information baselined. (Tripwire Enterprise)

Communication intercepted. (Symantec Security Analytics) Site identified as malicious. (Cisco Stealthwatch + Symantec Security Analytics)
Logs of file changes are collected. (Micro Focus ArcSight)
38

Execution stopped and analyzed. (Cisco AMP) Tools added to blacklist. (Cisco AMP?) Download stopped or files deleted. (Cisco AMP?) Files added to blacklist. (Cisco AMP?)
Affected machine disconnected. (Cryptonite NXT)
Execution stopped and analyzed. (Cisco AMP) R-ware added to blacklist. (Cisco AMP?) Site added to blacklist. (Used in Protect)

#RSAC

Destructive Malware

User inserts USB

Identify

Protect

User runs executable

Executable deletes and changes files

Sensitive files are inventoried. (Symantec DLP)

Backups are taken. (FileZilla+Duplicati) Integrity information baselined. (Tripwire Enterprise)

Detect
USB insertion detected and logged. (Micro Focus ArcSight? + Cisco AMP?) Executable is identified as malicious. (Cisco AMP)
Executable is identified as malicious. (Cisco AMP)

Respond
Executable deleted. (Cisco AMP)
Execution stopped. (Cisco AMP) Executable added to blacklist. (Cisco AMP?)

Logs of file changes are collected. (Micro Focus ArcSight)

39

#RSAC
VM Maintenance Error

Maintenance script with error is executed
Script deletes virtual machine

Identify

Protect
Error in script is patched. (Human)
Backups of virtual machines are taken. (FileZilla + Duplicati)

Detect
VM deletion is logged. (Tripwire Enterprise + Micro Focus ArcSight)

Respond
Event analyzed. (Micro Focus ArcSight)

40

User receives a phishing email with a malicious attachment. User downloads the attachment, which is an Excel spreadsheet. User runs the Excel spreadsheet.
The Excel spreadsheet fetches malicious files.
The Excel spreadsheet creates backdoors on the domain.

Phishing For Backdoors

Identify

Protect

Detect

Email is sorted into spam. (N/A)

Email is identified as malicious. (Glasswall)

#RSAC
Respond
Email is added to blacklist. (N/A)

Attachment is identified as malicious. (Glasswall)

Attachment is deleted. (Glasswall)

Downloads from spreadsheets are blocked. (N/A) Downloads from site are blocked. (Cisco WSA)
Configurations are baselined. (Semperis DSP) Backups of configuration are taken. (Semperis DSP + Semperis ADFR)

The spreadsheet is identified as malicious. (Glasswall + Cisco AMP)
Downloads from Spreadsheets are detected. (Symantec ATP?) Downloaded files are identified as malicious. (Cisco AMP)
Downloaded executable is identified as malicious. (Cisco AMP) Account creation is logged. (Semperis DSP + Micro Focus ArcSight)

Execution stopped. (Glasswall) Attachment is added to blacklist. (Glasswall?) Downloads are deleted. (Cisco AMP)
Execution stopped. (Cisco AMP) Downloads are added to blacklist. (Cisco AMP?) Download site added to blacklist.

41

#RSAC
Insider Threat ­ DB Change

Malicious insider exploits vulnerability in company intranet.

Identify

Protect

Vulnerability is identified. (Human) Vulnerability is tracked. (Tripwire IP360)

Vulnerability is resolved. (Human)

Detect
Client information associated with web request is logged. (Cisco WSA + Micro Focus ArcSight + Symantec ICA)

Respond

Database records are deleted.

Database backups are taken. (Database Software) Database is baselined. (Tripwire Enterprise + Micro Focus ArcSight)

Changes to the database are logged with appropriate information. (Tripwire Enterprise + Micro Focus ArcSight)

Information from attack reported. (Micro Focus ArcSight)

42

#RSAC
Insider Threat ­ File Change

Employee searches files and backups. Employee changes files.
Employee changes backups of files.

Identify

Protect

Detect

Backups are encrypted. (FileZilla + Duplicati)

Backups are taken. (FileZilla + Duplicati) Files are baselined. (Tripwire Enterprise)

Changes to files are detected. (Tripwire Enterprise + Symantec ICA)

Backups are stored securely. Changes to backups are detected.

(GreenTec WORMdisk)

(Tripwire Enterprise + Symantec

ICA)

Respond
Changes are reported. (Micro Focus ArcSight) User account is disabled/contained. (Semperis DSP + Cryptonite NXT) Changes are reported. (Micro Focus ArcSight) User account is disabled/contained. (Semperis DSP + Cryptonite NXT)

43

#RSAC
Compromised Update Server

Vulnerable service is downloaded from server.
Vulnerable service is started.
Malicious actor exploits a backdoor in the service. Service opens port on machine. Malicious actor uses port to access the machine as root.

Identify

Protect
Downloads from site are temporarily blocked. (Cisco WSA + Cryptonite NXT)
Programs are baselined. (Tripwire Enterprise)

Detect
Service is identified as malicious. (Cisco AMP)
Service is identified as malicious. (Cisco AMP)
Network traffic logged. (Symantec Analytics + Cisco Stealthwatch)

Respond
Service is deleted/reverted. (Cisco AMP)
Service is stopped. (Cisco AMP?) Site is added to blacklist. Downloaded service is added to blacklist. (Cisco AMP?)

Port opening detected. (Symantec Port closed. (CryptoniteNXT) Analytics + Cisco Stealthwatch)

Backups are taken. (FileZilla + Duplicati) Files are baselined. (Tripwire Enterprise)

Intrusion is detected. (Cisco AMP)

Details of intrusion reported. (Micro Focus ArcSight)

44

#RSAC
Mission
Accelerate adoption of secure technologies: collaborate with innovators to provide realworld, standards-based cybersecurity capabilities that address business needs

#RSAC
Sector-Based Projects
Commerce/Retail Energy Financial Services Healthcare Hospitality Manufacturing Public Safety/First Responder Transportation

#RSAC
Cross-Sector Projects
Attribute Based Access Control (SP 1800-3) Data Integrity (SP 1800-11) Derived PIV Credentials (SP 1800-12) DNS-Based Secured Email (SP 1800-6) Mitigating IoT-Based DDoS Mobile Device Security (SP 1800-4) Privacy-Enhanced Identity Federation Secure Inter-Domain Routing (SP 1800-14) TLS Server Certificate Management (SP 1800-16) Trusted Geolocation in the Cloud (NISTIR 7904)

