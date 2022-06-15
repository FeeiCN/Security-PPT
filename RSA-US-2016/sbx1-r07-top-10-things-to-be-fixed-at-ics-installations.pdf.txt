SESSION ID: SBX1-R07
Top 10 ICS Cybersecurity Problems Observed in Critical Infrastructure
#RSAC

Bryan Hatton
Cyber Security Researcher Idaho National Laboratory In support of DHS ICS-CERT @phaktor

#RSAC
16 Critical Infrastructure Sectors

Presidential Policy Directive 21 (PPD-21) categorized U.S. critical infrastructure into the following 16 CI sectors.

· Chemical · Commercial Facilities · Communications · Critical Manufacturing · Dams · Defense Industrial Base · Emergency Services · Energy · Financial Services

· Food & Agriculture · Government Facilities · Healthcare & Public Health · Information Technology · Nuclear Reactors, Materials,
and Waste · Transportation Systems · Water and Wastewater
Systems

Many of the processes controlled by computerized control systems have advanced to the point that they can no longer be operated without the control system

#RSAC
Data Set - 20 Sources

Critical Manufacturing 1

Dams

1

Energy

6

Government Facilities 2

Water Plants

10

#RSAC
CSET®

#RSAC
Design Architecture Reviews

#RSAC
Network Architecture Verification & Validation
NAVV Benefits: · TCP Header Data Network
Capture · Point-to-Point
Communication Verifications · Data Flow Validation · Network Perimeter
Protection

#RSAC
10. AC-6 Least Privilege
Mitigations
Establish user accounts for Administrators
Appropriate use of the escalate privilege function
Review work requirements for necessary access requirements

#RSAC
9. CM-3 Configuration Change Control
Mitigations Establish a solid configuration change control process Keep records / Use an automated software Have staff that "know" your ICS Keep patches for devices and applications current
8

#RSAC
8. PE-3 Physical Access Control
Mitigations Access Alarms Video Surveillance Electronic Keys / RFID

#RSAC
7. AU-12 Audit Generation
Mitigations Establish a process to collect logs Develop of system of processing logs to find "events of interest" Collect logs in a centralized location outside of data source
10

#RSAC
6. AT-2 Security Awareness Training
Mitigations
Establish annual training program to bring workers up to speed.

#RSAC
5. IA-5 Authenticator Management
Mitigations
Good Password Policies and Processes
Use Account Management Software to enforce policy

#RSAC
4. SA-2 Allocation of Resources
Mitigations Asset owners need more dedicated staff Staff on location

#RSAC
3. CM-7 Least Functionality
Mitigations Determine needed services and deny all others Apply hardening as applicable Use whitelisting

#RSAC
2. IA-2 Identification and Authentication
Mitigations
Use good encryption for storage and transmission of credentials
Uniquely identify personnel were possible
Use multi-factor authentication for remote access and critical administrative access

#RSAC
1. SC-7 Boundary Protection
Mitigations Logically segment networks Establish strong firewall rules to route traffic Isolate security and support functions Deny traffic by default
Remote Access Use access points/jump servers for remote access Prevent split tunneling

#RSAC
Remote Access / Monitoring

External Routers

VPN

Business Web Servers Servers

E-mail Server

DNS Server

Workstations

Remote monitoring

Two-factor authentication required
Jump Host VPN

Business Network

HMI

Remote access

The Internet

Remote Connectivity Best Practices 1. Understand your data flows. Who should be talking to whom?

Control DMZ 1 (remote access)

Two-factor

Restricted Comm Flows

authentication required

Data Acquisition Database

Server

Server

Control DMZ 2 (remote monitoring)

HMI (Read Only!)

One-way traffic only

Configuration Server

Engineering Workstations

2. Never allow any machine on the control network to talk directly to a machine on the business network or Internet

Control System Network Field Controllers

3. Configure firewalls to allow only specific IP/ports to talk to one another through the firewall. Everything else is blocked by default.

HMI Primary HMI

Field Devices

Safety System

Observed Vulnerabilities ­ Top 11
1 SC-7 Boundary Protection 2 IA-2 Identification and Authentication (Organizational Users) 3 CM-7 Least Functionality 4 SA-2 Allocation of Resources 5 IA-5 Authenticator Management 6 AT-2 Security Awareness Training 7 AU-12 Audit Generation 8 PE-3 Physical Access Control 9 CM-3 Configuration Change Control 10 AC-6 Least Privilege 11 CP-9 Information System Backup

#RSAC
16.22% 7.34% 6.56% 4.63% 4.25% 4.25% 4.25% 4.25% 4.25% 4.25% 4.25%
64.48%

#RSAC
Top 11 by Sector

SC-7 Boundary Protection
IA-2 Identification and Authentication (Organizational Users) CM-7 Least Functionality SA-2 Allocation of Resources IA-5 Authenticator Management CM-3 Configuration Change Control AT-2 Security Awareness Training PE-3 Physical Access Control AC-6 Least Privilege AU-12 Audit Generation CP-9 Information System Backup
Grand Total

Energy 32.50%
12.50% 15.00% 10.00% 2.50% 10.00% 2.50% 0.00% 7.50% 5.00% 2.50%

Gov Fac 25.00%
10.00% 10.00% 5.00% 15.00% 10.00% 5.00% 15.00% 0.00% 5.00% 0.00%

Water 20.88%
10.99% 8.79% 5.49% 6.59% 4.40% 8.79% 7.69% 6.59% 8.79% 10.99%

Total 25.15%
11.38% 10.18% 7.19% 6.59% 6.59% 6.59% 6.59% 6.59% 6.59% 6.59%

100.00%

100.00% 100.00% 100.00%

Operation Controls
CM-7 Least Functionality CP-9 Information System Backup PE-3 Physical Access Control AT-2 Security Awareness Training CM-3 Configuration Change Control CM-2 Baseline Configuration AT-3 Role-Based Security Training SI-4 Information System Monitoring CM-6 Configuration Settings MA-2 Controlled Maintenance MP-7 Media Use CM-4 Security Impact Analysis Grand Total (12)

#RSAC
14.29% 9.24% 9.24% 9.24% 9.24% 7.56% 7.56% 7.56% 7.56% 6.72% 5.88% 5.88%
100.00%

Management Controls
SA-2 Allocation of Resources SA-3 System Development Life Cycle SA-4 Acquisition Process PL-2 System Security Plan RA-5 Vulnerability Scanning CA-5 Plan of Action and Milestones PL-1 Security Planning Policy and Procedures CA-2 Security Assessments CA-3 System Interconnections SA-11 Developer Security Testing and Evaluation SA-8 Security Engineering Principles SA-12 Supply Chain Protection CA-7 Continuous Monitoring RA-3 Risk Assessment Grand Total (14)

#RSAC
25.00% 18.75%
8.33% 8.33% 6.25% 6.25% 6.25% 6.25% 4.17% 2.08% 2.08% 2.08% 2.08% 2.08% 100.00%

Technical Controls
SC-7 Boundary Protection IA-2 Identification and Authentication (Organizational Users) IA-5 Authenticator Management AU-12 Audit Generation AC-6 Least Privilege AC-2 Account Management SC-8 Transmission Confidentiality and Integrity AC-17 Remote Access SC-28 Protection of Information at Rest AC-20 Use of External Information Systems AC-18 Wireless Access AC-4 Information Flow Enforcement AC-19 Access Control for Mobile Devices Grand Total (14)

#RSAC
28.97% 13.10%
7.59% 7.59% 7.59% 6.90% 5.52% 4.83% 4.14% 3.45% 3.45% 3.45% 3.45% 100%

#RSAC
Questions
?

11. CP-9 Information System Backup
Examples No backup servers No testing of backups or backup media No offsite storage
Mitigations Determine what should be backed up Implement a backup solution Test backups Keep an offsite copy for disaster recovery

#RSAC
24

Observed Vulnerabilities ­ Top 12-22
12 AC-2 Account Management 13 CM-2 Baseline Configuration 14 SA-3 System Development Life Cycle 15 SI-4 Information System Monitoring 16 AT-3 Role-Based Security Training 17 CM-6 Configuration Settings 18 SC-8 Transmission Confidentiality and Integrity 19 MA-2 Controlled Maintenance 20 CM-4 Security Impact Analysis 21 AC-17 Remote Access 22 MP-7 Media Use

#RSAC
3.86% 3.47% 3.47% 3.47% 3.47% 3.47% 3.09% 3.09% 2.70% 2.70% 2.70% 35.52%
25

