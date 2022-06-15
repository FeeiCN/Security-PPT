HANDBOOK ON
Information Security Operations Center
Institute for Development and Research in Banking Technology
(Established by Reserve Bank of India)

CONTENTS

Foreword

01

Chapter 1 - Security Essentials

02

Chapter 2 - ISOC Planning and Design

12

Chapter 3 - ISOC Integration and Implementation

23

Chapter 4 - Operating ISOC: Governance, People & Processes

32

Annex. 1

42

Annex. 2

43

Annex. 3

49

Glossary

53

© An IDRBT Publication, September 2017. All Rights Reserved. For restricted circulation in the Indian Banking & Financial Sector.

Foreword
Early Warning System

WE are in the age of anyme anywhere banking. Technology innovaon has moved banking to desktops, laptops, tablets and mobiles. The customer has grabbed banking into her palm.
Yet, she has issues with the new era digital banking because of the increasing trend in failed or fraudulent transacons. A few of the recent incidents in the banking sector have shaken her confidence. Banks have suffered financial losses on a few occasions, but their reputaon loss is a ma er of greater concern. The trust the customers need to have in banks for parking with their hard earned funds is crical for banking. Aer all, banking is based on trust.
It is the responsibility of the banks to put in place all necessary infrastructure and systems to ensure that digital banking is safe and secure. They have to ensure confidenality, integrity and availability, the three key requirements of secured banking.
Banks have been working on security soluons at various levels. In order to put all such soluons together and to build a system that not only integrates the best features of the soluons but also a super structure that idenfies abnormalies early and alerts stakeholders immediately, banks have started working on Informaon Security Operaon Centers (ISOCs).
Though there has been considerable work done by academicians, security soluon providers and banks in the realm of ISOC, there are sll several issues and concerns at the stage of implementaon of ISOC. IDRBT has been organizing training programmes on

ISOC for banks. During interacon with the concerned employees of banks, a need was felt to bring out a Handbook on ISOC to help banks.
Accordingly, IDRBT with the acve parcipaon of banks and soluon providers, prepared the current Handbook on ISOC. It presents in detail the steps to be taken during conceiving, designing, building, maintaining and managing various phases of ISOC. It is expected that all security praconers in banks would benefit from the handbook in every stage of ISOC implementaon.
As the general principles and pracces of security are common among several organisaons, the handbook may be useful not only to banks but also to financial instuons and other organizaons.
The team that worked on the handbook deserve best compliments.

Date: September 01, 2017 Place: Hyderabad
Handbook on Information Security Operations Center

(Dr. A. S. Ramasastri) Director, IDRBT
01

Chapter 1
Security Essenals

BUSINESS organisaons are highly dependent on IT infrastructure, network system and sophiscated soware applicaons. Through these components, they are able to carry transacons with uninterrupted flow of data and informaon across geographical boundaries. Along with the benefits like speed, automaon, ease, etc., these components also brought threats and risks to the businesses in the form of a acks like DDOS (Distributed Denial of Service), data the, malware, etc.
One of the major concerns is the ease and speed with which businesses are being a acked / brought down, without even the a acker paying a visit to the physical facilies of the business. Securing Informaon and Communicaon Technology (ICT) draws a enon of the top management, regulators and law-enforcement alike.
As ICT evolved, securing business through ICT as well, evolved over a period of me. When PCs invaded small and big offices alike, without Internet connecon, an-virus was the security measure that was built into securing IT. When enterprise networks were built, the security was enhanced with some more devices like Firewalls, IDS (Intrusion Detecon System) and IPS (Intrusion Prevenon System), etc. When majority of the business transacons are stored in database and data leakage became a big concern, another concept DLP (Data Leakage Prevenon) was brought in. In this manner, businesses reacvely kept adding security funconalies as and when the need was felt.
At present, they are surrounded by too many security devices to deal with, which are not well-integrated. One of the major requirements of any security management is incident response. As the devices were not well-integrated, it became a bo leneck to detect threats and quickly respond to an incident. The idea of ISOC (Informaon Security Operaon

Center) emerged in order to address these concerns and the ever-changing security threat landscape.
Informaon Security Operaon Center (ISOC) ­ "The ISOC is responsible for monitoring, detecng, and isolang incidents and the management of the organisaon's security products, network devices, end-user devices, and systems. This funcon is performed seven days a week, 24 hours per day. The ISOC is the primary locaon of the staff and the systems dedicated for this funcon," defines the Wikipedia
The recent a acks on financial systems prove that deploying defensive technologies like perimeter security and encrypon, etc., are not sufficient and one needs to constantly monitor the security. Security is not a product that can be deployed and forgo en, rather it is a process that needs to be connuous.
The picture below shows the security features that became part of the overall IT security of a matured business organisaon. This secon provides an insight into how each of the security specific points found their place in the organisaon. The Logical Security framework presents the defence-in-depth, layered approach to security. It is broken down into five main groups:
S Opera ons: Operang a security program requires the necessary tools to support change control and track assets based on asset classificaon framework. An effecve security operaons program is underpinned by IT Service Management. ITIL (Informaon Technology Infrastructure Library) is an industry respected framework to structure such a program.
S Identy and Access Control: People, process and technology are the pillars of any organisaon and are interdependent on one

02

Handbook on Information Security Operations Center

Security Essentials

another in carrying business acvies. Identy and Access Control technology can be used to iniate, capture, record and manage idenes of user, device, service, system, etc., and their related access permissions in an automated fashion. This ensures that access privileges are granted according to single interpretaon of policy and all individuals and services are properly authencated, authorized and audited.
S Data: As organisaons increasingly leverage automaon of business processes through applicaons, more and more confidenal data is held within these plaorms. Securing this data gained priority as regulators and government

agencies started mandang data security pracces.
S Hosts: Security across endpoint devices that include desktops, servers, laptops and mobile devices is an essenal and effecve process to protect the underlying crical assets from compromise.
S Network: The underlying network architecture is crical to protect the applicaons, services, users and data from compromise. Fundamental controls are required to safeguard these assets while being connected to the network.

Logical Security Architecture

Operations
Identity and Access Control
Data
Hosts

Asset Configuration and Mgmt.

Vulnerability and Patch Mgmt.

Event Monitoring and Incident Mgmt.

ISOC

Directory Services

2FA

PIM

SSO

Data Encryption

DLP

Anti Virus

Host IDS

DAM

E-Mail Security

Big Data Security Analytics

WAF

End Point Security

MDM/BYOD

Anti-APT

Network

Firewall

IDS/IPS

VPN

Anti DDOS Honeypot

NAC

NBAD

Securing IT in an enterprise evolved with a focus on domains like securing networks, securing hosts, securing data, deploying identy and access controls and with operaons across all these domains.
1.1 Network Security
Network security is a basic necessity today. Network Security Appliances help in protecng the computer systems and other IT infrastructure inside the network from unwanted intrusions or a acks.

1.1.1 Firewalls: Network security started its journey with basic firewalls and is now capable of filtering based on content of the packet instead of just packet headers. Not able to go beyond the layer 4 intelligence of TCP/IP stack, firewalls just remained as main entrance security gateways in the enre enterprise security space.

Handbook on Information Security Operations Center

03

Security Essentials

1.1.2 IDS/IPS: Intrusion detecon and prevenon systems detect/prevent network a acks by:
S Filtering the traffic by applying known signatures of the malware and malicious a acks
S Analysing the traffic flow looking for deviaons from normal behaviour and block the connecon, if any anomaly found.
Both IDS and IPS soluons detect threat acvity in the form of malware, spyware, viruses, worms and other a ack types, as well as threats posed by policy violaons. The IDS/IPS systems lack the visibility into applicaon layer of TCP/IP stack and hence may not protect from applicaon specific a acks.
1.1.3 Virtual Private Network (VPN): To protect data traversing on shared communicaon links from a acks like spoofing and tampering, encrypng the data on wire has become necessary. VPN creates private confidenal networks on top of shared public networks like Internet by encrypng the data. VPNs thus are tamper-proof and provide secure remote employee log-in and remote branch office connecon to the enterprise resources.
1.1.4 An-DDoS: Distributed Denial of Service (DDoS) is the fastest growing threat. It aims at bringing down the crical IT resources, by sending malicious traffic and thereby exhausng the crical resource capacity. DOS a acks can happen at any layer of TCP/IP, right from flooding the routers to opening huge number of connecons to target applicaons. The soluons also vary at each layer. ISPs (Internet Service Providers) offer layer 3 and layer 4 DDoS protecon services, guaranteeing clean pipes from volumetric DDoS a acks. However, to prevent layer 7 DDoS a acks, on-premise DDoS detecon and prevenon devices need to be put in place.
1.1.5 Honeypots: These are traps set up inside the network waing for someone to a ack. They work on simple concept; alert the security administrator the moment a contact is made to them.

1.1.6 Network Access Control (NAC): Noncompliant devices can be denied access to enterprise network using NAC, isolang these insecure devices from infecng the rest of nodes in the network. Examples of non-complaint devices include unauthorized devices, un-patched and not updated devices, etc.
1.1.7 Network Behaviour Anomaly Detec on (NBAD): Preventave security measures are oen defeated, by new polymorphic malware, and zero day exploits. Therefore, it is important to be on the watch for intruders. NBAD analyses the flow of data across all devices to understand the deviaons from normal traffic. For example, certain type of traffic, say Skype from normal users can be acceptable, but the same type of traffic from servers is very suspicious. NBAD is useful in detecng the suspicious behaviour and can guide the security experts in forming rules to prevent such events to occur in future.
1.2 Host Security
Hosts are the main access points to the crical assets of the enterprise and hence it is imperave to secure the hosts.
1.2.1 An-Virus: The most common basic security deployed on every host is an-virus.
1.2.2 Host IDS: As an-virus systems work based on signature verificaon and cannot protect hosts from zero-day malware, the servers are protected by another layer of security, which is host based IDS. The main goal of host IDS is to keep the integrity of the server intact. It keeps monitoring the suspicious operaons like configuraon changes, registry changes, log re-writes, file deletes, etc. and immediately alerts/blocks as per policy.
1.2.3 Web Applicaon Firewall (WAF): The fastest growing categories of a acks and data breaches are those that target applicaons. There are countless possibilies to exploit code vulnerabilies and

04

Handbook on Information Security Operations Center

Security Essentials

applicaon modules. Almost every web-based applicaon has one or more web applicaon vulnerabilies listed in OWASP top 10 list. OWASP reported that 95% websites are compromised by cross-site scripng a ack.

Application Threats: OWASP Top 10

S. No.

Threat

1 Injection (SQL, OS and LDAP) 2 Broken Authentication and Session Management 3 Cross-Site Scripting

4 Insecure Direct Object References

5 Security Misconfiguration

6 Sensitive Data Exposure

7 Missing Function Level Access Control

8 Cross-site Request Forgery (CSRF)

9 Using Components with Known Vulnerabilities

10 Unvalidated Redirects and Forwards

Firewall No No No No No Yes No No No No

WAF Yes Yes Yes Yes Yes Yes Yes Yes Yes Yes

1.2.4 Endpoint Security: For overall enterprise security, it is essenal to keep all endpoint devices clean, malware free and up-to-date with all required patches. EndPoint Security's main objecves include:
S Endpoints are authenc (2FA, AAA) S Endpoints are configured properly (Configuraon
management) S Endpointsarecleanandvirusfree(Anvirus/HIPS) S Endpoints are not vulnerable (vulnerability
scanning and management) S Endpoints are up-to-date with all necessary
patches (Patch Management).
Only authenc and secure endpoints should be allowed to access the enterprise network resources.

1.2.5 Mobile Device Management (MDM): MDM soware strengthens security through remote monitoring and control of security configuraons, policy enforcement and patch pushes to mobile devices. Further, these systems can remotely lock lost, stolen or compromised mobile devices and, if needed, wipe all stored data.
1.2.6 An-APT: Advanced Persistent Threats (APT) are custom-made targeted a acks. They are capable of compromising the targeted systems with advanced coding techniques that circumvent the tradional signature based virus detecon. The APT detecon plaorms are designed to execute the suspicious files/codes in a sandbox environment, understand their acvity (registry changes, file read/write, botnet communicaon, etc.) and accordingly allow or deny the suspicious file to enter the enterprise network.

Handbook on Information Security Operations Center

05

Security Essentials

1.3 Data Security
Data being one of the most crical assets, keeping the enterprise data safe and secure through various means is important.
1.3.1 Cryptographic Techniques
Cryptographic techniques address two major security challenges ­ confidenality and integrity. PKI (Public Key Infrastructure) in addion is able to address authencaon and non-repudiaon. While the cryptographic techniques are good at safeguarding the data at rest and data in moon, they are weak in protecng the data being in operaon. A acks like man-in-memory or man-inbrowser target the data, once it was decrypted or just before it is about to be encrypted. Moreover, majority of mes encrypon technologies are overlooked by applicaon developers and applicaons get deployed without proper usage of encrypon.
1.3.2 Data Leakage Prevenon
According to "Intel Security 2016 Data Protecon Benchmark Study", over 25% of organisaons do not monitor access to employee or customer informaon.

Employee Sends Various emails
DLP Agent

Web Mail

Block

Enterprise Network
DLP Server

Encrypt Block

Encrypt

Supplier Networks
Social Networks

Partner Networks

Data Leakage Prevenon (DLP) soluons protect sensive data and provide insight into the use of content within the enterprise. This includes three major aspects:

Monitoring Data at Rest: Content discovery by scanning of storage and other content repositories at regular intervals helps idenfy where sensive content is located. For example, one can use a DLP product to scan the servers and idenfy documents with credit card numbers. If that server is not authorized to keep that kind of data, the file can be encrypted or removed, or a warning sent to the file owner.
Monitoring Data in Moon: This involves sniffing of traffic on the network to idenfy content being sent across specific communicaons channels. For example, DLP can sniff emails, instant messages, and web traffic for snippets of sensive source code, credit cards, etc. Data in moon protecon tools can oen block data leakage based on central data security policies, depending on the type of traffic.
Monitoring Data in Use: This aspect is addressed by endpoint soluons that monitor data as the user interacts with it. For example, they can idenfy the transmission of sensive document to a USB drive and block it (instead of blocking USB drive), including things like copy and paste, etc.
The success of DLP tools are very dependent on classificaon of data, idenfying data ownership, data security policy and data governance.
1.3.3 Database Acvity Monitoring (DAM)
Monitoring database acvity is a crical component of database security, especially as informaon that is more sensive is consolidated into larger databases.
Database Acvity Monitoring involves the capturing and recording of all Structured Query Language (SQL) acvity in real-me or near real-me. They can monitor database administrator acvity, across mulple database plaorms; and can generate alerts on policy violaons. Database acvity monitoring takes place at various levels by different tools. However, five features disnguish Database Acvity Monitoring tools:

06

Handbook on Information Security Operations Center

Security Essentials

S Monitoring: Monitor and audit all database acvity, like administrator acvity and Select transac ons. Tools can capture all SQL transacons: DML, DDL, DCL, (and somemes TCL) acvity.
S Secure Storage: Storing monitoring and audit data securely outside the database.
S Correlaon and Analysis: These tools aggregate and correlate acvity from mulple heterogeneous Database Management Systems (DBMSs). Tools can work with mulple DBMSs (e.g., Oracle, SQL Server & DB2) and normalize transacons from different DBMSs overcoming the differences among many SQL flavours.
S Segregaon of Dues: Enforce separaon of dues on database administrators. Auding must include monitoring of DBA acvity, and soluons should prevent manipulaon or tampering of logs or any such recorded acvity.
S Alert Mechanism: Generate alerts on policy violaons. Not only just recording database acvity, they also provide real-me monitoring and rule-based alerng. For example, a rule can be created to generate an alert whenever a DBA performs a select query on a parcular column, say credit card.
1.3.4 E-Mail Security: E-mail is a popular a ack vector and hence individual and business accounts need to be protected. E-mail acts as a launchpad for a acks like spam, phishing and spreading malware, etc. Secure e-mail gateway that scans all e-mails and filters the malicious e-mails is now common across all enterprises.
1.4 Identy and Access Control
Various tools should be used to enforce the applicaon or resource usage policy via the mechanism of access to the applicaons. Identy and access management soluon with central directory of idenes are integrated with

applicaons and its underlying plaorm with "need to know/access" policy defined by the business layer.
1.4.1 Directory Services
Directory is like a registry where all informaon about users, groups, computers, servers, printers, network shares, and more are stored. Each of these are considered objects and have a ributes associated with them in the directory. Security policies can be built on top of this informaon. Based on these policies, directory services can carry out single sign-on to network resources; lock down desktop configuraons and prevent access to specific operaons such as soware installaon or registry eding; and set access control privileges on directory objects. Directory services are one of the first centralised (single point) controllers of all applicaons, users, databases, files, etc., in an enterprise network. However, due to pla orm dependency, today directory services control only few secons of the enterprise IT resources.
1.4.2 Two Factor Authencaon (2FA)
2FA is an extra security layer that authencates the user with one more factor over and above the usual password. Usually the second factor is a dynamic OTP (One-me Password) communicated with the customers (external users) over a different device they own and on a different channel, like OTPs sent over mobile for Internet Banking. For internal users, biometric is a norm used as second factor to operate sensive crical applicaons.
1.4.3 Privileged Identy Module (PIM)
The IT personnel who maintain servers, network components, and soware are given elevated permissions needed to manage and maintain the IT infrastructure. Called privileged idenes, they are allowed unrestricted access to view and change data, alter configuraon se ngs, and run programs. Business applicaons and computer services must also store and use privileged credenals to authencate with databases, middleware, and other

Handbook on Information Security Operations Center

07

Security Essentials

applicaons when requesng sensive informaon and compung resources.
Control on these administrave rights with Privilege Identy Management (PIM) tools is required. Through PIM, one can manage and monitor the acons of the privileged idenes and enforce authencaon policies including mulfactor authencaon and raise alerts in case of policy violaons. PIM soware auto-discovers and catalogues privileged accounts present on a wide range of systems and applicaons and then propagates password changes wherever the account is referenced in order to prevent account lockouts and service failures that can otherwise occur when manual processes deploy obsolete credenals.
1.4.4 Single Sign-on (SSO)
SSO allows user to login once with single-ID to access all applicaons and plaorms. The user is authorised to access, and eliminates further prompts when they switch applicaons during a parcular session. Single sign off allows logging out from all the systems with single log-out. However, logging off a parcular applicaon does not log them out of all applicaons they were accessing.
SSO is always treated as a convenience from user angle, however the main advantage of SSO is that when an employee leaves an organisaon, it is easy to disable his/her access to all resources in one go, by removing his ID and thereby protecng all resources s/he was given access to.
1.5 Operaons
Operang a security program requires the necessary tools to support change control, and track assets based on asset classificaon framework. An effecve security operaons program is underpinned by an IT Service Management.

1.5.1 Service Asset Configuraon and Management (SACM)
According to ITIL, SACM is the process responsible for ensuring that the assets required to deliver services are properly controlled, and that accurate and reliable informaon about those assets is available when and where it is needed. This informaon includes details of how the assets have been configured and the relaonships between assets. The ITIL standard gives complete details about Service Asset Configuraon and Management.
The ITSM (IT Service Management) tool to deploy ITIL best pracces comes in as a central ITSM tool with various modules. The heart of this tool is a CMDB (Configuraon Management Database), which holds the detailed informaon of all the assets, its interlinkage, configuraons, etc. This becomes an ideal source of any informaon about IT assets. All the other modules for ITSM will take the asset informaon from this central tool to correlate the informaon and provide meaningful intelligence. Modules like Service Desk, Change Management, Asset Management, Problem Management, Knowledge Management, CMDB, Vulnerability Management, Fault, Performance Availability and Incident Management should be integrated to take in data from one module, perform the funcon and pass on to the next module for automated escalaons and management. Annexure 1.1 provides the maturity model for Asset Configuraon and Management.
1.5.2 Vulnerability and Patch Management
It has become very common for vendors of hardware, soware, network devices, security soluons, etc., to keep releasing patches to close the vulnerabilies. Not patching the systems leave the enterprise in a greater risk. Manual patching takes too long a me and leaves no audit trail of the whole exercise. Modern enterprises are automang the process of vulnerability and patch management through centralised tools.

08

Handbook on Information Security Operations Center

Security Essentials

VULNERABILITY MANAGEMENT MATURITY MODEL

Level 0

Level 1

Level 2

Level 3

Level 4

Level 5

NON-EXISTENT

SCANNING

ASSESSMENT & COMPLIANCE

ANALYSIS & PRIORITIZATION

ATTACK MANAGEMENT

BUISINESS-RISK MANAGEMENT

No Vulnerability Scanning
Manual Vulnerability Assessments
Haphazard Patching
No Process Exist
No Metrics

Vulnerability Assessment Solution in Place
Ad-hoc Vulnerability Scanning
Rudimentary Patching
Basic Processes
Basic Metrics

Driven by Regulatory Framework
Scheduled Vulnerability Scanning
Scan to Patch Lifecycle
Emerging Processes
Little Measurability. Busy Metrics

Risk-focused

Attacker and threat focused

Threat and risk aligned with business goals

Scan data prioritized through analytics

Multiple threat-vectors

All threat-vectors

scanned and prioritized scanned and prioritized

Patching data-driven by priority

Patching basd on risk to critical assets

Continuous patching

Measurable Processes
Emerging Metrics and Trends

Efficient, metrics-based processes
Threat-driven metrics and trends

Unified business and IT Processes
Measurement integrated to enterprise risk mgmt.

Business Ignorance

Awareness & Early Maturity Business Risk & Context

PEAK DATA OVERLOAD

EFFECTIVE PRIORITIZATION

Source: https://www.rsaconference.com/blogs/growing-up-a-roadmap-to-vulnerability-management-maturity

1.5.3 Security Incident and Event Management (SIEM)
SIEM is a tool that collects logs and events from various security infrastructure, systems and applicaons and stores it centrally. It also helps in normalizing the logs/events of different types from different nodes to a standard pa ern. The collecon and storing are done in a compressed form to save the network and storage resources. Once collected, these logs/events are analysed, correlated and meaningful intelligence is provided on a central console with various customizable dashboards for faster reacon and idenficaon of root cause of the incident. More details on SIEM are available in the upcoming chapters.
1.5.4 Security Operaons Center
Security Operaons Center is a generic term describing a plaorm set up for the purpose of providing detecon and mely reacve services to security incidents.
ISOC soluon is an integrated deployment of

advanced cyber security products/services, expert human resources and industry best pracces and processes.ISOCimplementaonand operaonalizaon plays crucial role in achieving the objecve of providing in-depth centralized visibility into organizaon's IT infrastructure to monitor, detect, prevent and migate security incidents. Organisaons need to focus more on rapid detecon and response mechanisms, apart from technologies that prevent intrusions. Quick detecon and remediaon is possible only by automang the security operaons. Such automaon frees up analysts from mundane tasks and allows them to concentrate on higher priority risks affecng the most crical assets and data. ISOC automaon capability is going to be a major disnguishing factor in assessing an ISOC product/technology.
An advanced implementaon of Informaon Security Operaons Center (ISOC) may have following addional components. Upon implementaon of a basic version of ISOC, organisaons may build these funconalies in their ISOC.

Handbook on Information Security Operations Center

09

Security Essentials

S User and Enty Behaviour Analycs: A ackers tend to compromise legimate user accounts to access the target system. However, different users exhibit different pa ern of acvies. Analysis of user behaviour data helps to create a baseline of normal user and reports suspicious anomalous behaviour. This fact leads to differenate a legimate user from an intruder. Machine learning based techniques have successfully demonstrated detecon of this kind of compromise. Recently, user behaviour analycs transformed to user and enty behaviour analycs for effecve detecon of various frauds including insider threat. Signature-less behaviour-based analycs is a new approach for detecng insider and targeted cyber threats.
S Digital Forensic Capabilies: Though this capability is menoned as one of the basic funcons of ISOC, very few organisaons plan and implement this. As a future expansion, ISOC may develop forensic capabilies for idenfying, preserving, recovering, analyzing, and presenng digital evidences to establish a digital crime. This capability of ISOC team will lead to a quick response to any adverse situaon.
S Big Data Analycs: Storing and querying large amounts of data collected by ISOC also requires database technologies capable of handling such huge volumes and also which supports future scaling up. Relaonal databases to store and query data might not scale well and could pose a problem for organisaons as informaon requirements con nue to grow. Big Data plaorms can store and process large amounts of data and would be the way forward for a futurisc ISOC, which requires contextual retrieval of large amounts of data. This should also be compable with the tradional log management and SIEM tools.
The future of ISOC lies in analysing data across all

systems, instead of just glancing at logs, flows and packets. The future is the accuracy and speed of detecon for security threats that can exceed the ability of a ackers to hide in the noise.
S Cyber Threat Hunng: Cyber threat hunng, according to Wikipedia, is "the process of proacvely and iteravely searching through networks to detect and isolate advanced threats that evade exisng security soluons." This is in contrast to tradional threat management measures, such as firewalls, intrusion detecon systems (IDS), and SIEM Systems, which typically involve an invesgaon aer there has been a warning of a potenal threat or an incident has occurred.
Cyber hunng plaorm, which work in real-me and are network-based are available now. They empower the cyber hunter to idenfy zero-day threats by quickly deploying constant analycs at large scale. They use dynamic ­ on the wire ­ analysis. Being on the network allows the organisaon to be proacve. They believe that packets do not lie. The malware author's "tricks" for obfuscaon, cannot divert or mislead these pla orms.
S Decepon Networks: Unlike a honeypot ­ these are just a set of devices set up to appear like a real network to induce an adversary to a ack ­ a decepon network is all or part of the actual enterprise that is instrumented and protected such that the adversary is allowed to engage and the engagement is captured forensically but does no harm. The benefit is that the adversary does not know that s/he is being tracked and manipulated. They use "Decepons Everywhere Technology" to neutralize targeted a acks and advanced persistent threats by creang a decepve layer across the enre network. This provides an endless source of false informaon, disrupng and detecng advanced a acks with

10

Handbook on Information Security Operations Center

Security Essentials

real-me forensics and without disrupon to business. Taking a very different approach to honeypot, this approach makes every endpoint part of the decepon. The adversary must try everything because he does not know what is good and what is not.
Conclusion
This chapter glanced though the exisng important security soluons that are essenal in the present environment for any enterprise. The soluons explained here are not exhausve but are indicave only. Enterprises need to place SOP (Standard Operang Procedures) for all these security soluons.
The following challenges remain despite rolling out majority of the security soluons:
S Security data overload ­ Too many devices, too much data
S Lack of event correlaon across mul-vendor sevices ­ IDS, Firewalls, An-Virus, and Hosts
S Excessive false posives
S No mely and targeted reporng
S Minimizing risk against key assets
S Incident response mechanism.

References
S h p://www.cisco.com/c/en/us/soluons/collateral /enterprise-networks/enterprise-networksecurity/white-paper-c11-736595.pdf
S h ps://www.rsaconference.com/writable/presenta ons/file_upload/sec-w04_final.pdf
S h ps://securosis.com/assets/library/reports/DLPWhitepaper.pdf
S h ps://www2.deloi e.com/content/dam/Deloi e/ lu/Documents/technology/lu_dlp-data-lostprevenon-soluon_02102014.pdf
S h ps://securosis.com/assets/library/reports/DAMWhitepaper-final.pdf
S h p://iasaglobal.org/itabok/capabilitydescripons/access-and-identy-management/
S h p://www.oregon.gov/DAS/EISPD/ITIP/docs/Arch Ch6_AssetMgt_v1_0.doc pp. 3-5 (March 2004)
S Author cited by source: Patricia Adams of Gartner (Sep 10, 2003) in arcle: "Management Update: IT Asset Management Stages Form the Stairway to Success"
S Next-Generaon Security Operaons ­ Preview h ps://nigesecurityguy.wordpress.com/2016/09/2 6/next-generaon-security-operaons-preview/
S Is logging dead in the future of security threat detecon? by Alex Taverner, December 2016, h ps://www.cio-asia.com/print-arcle/105558/
S Next-generaon security monitoring and analycs by Peter Stephenson,December 14, 2016 h ps://www.scmagazine.com/next-generaonsecurity-monitoring-and-analycs/arcle/577705/
S Next-Generaon Security Operaons ­ Preview by Nigel Willsonh ps://nigesecurityguy.wordpress. com/2016/09/26/next-genera on-securityoperaons-preview/
S "Cyber threat hunng: How this vulnerability detecon strategy gives analysts an edge TechRepublic". TechRepublic. 2016-06-07

Handbook on Information Security Operations Center

11

Chapter 2
ISOC Planning and Design

2.1 Why ISOC?
ENSURING Confiden ality, Integrity and Availability in today's modern IT-dependent enterprise is a mammoth task. Banks would require enterprise level visibility in order to comfortably provide assurance to business and customers on the security of their informaon and trustworthy engagement. There are several operaonal challenges, which need to be overcome, including:
S Enterprise level security posture through appropriate reports and dashboards
S Adhering to mulple legal and regulatory compliance requirements like RBI Cyber Security Guidelines, PCI DSS, ISO Security Standards, etc.
S Priorizaon of incidents which need immediate a enon and remediaon
S Automang the patch management
S Idenfying and detecng more sophiscated a acks such as blended threat, APT, etc., which could bypass the exisng soluons.
S Real-me response and remediaon
S Carrying out forensics analysis to track down the sequence of events that allowed the compromise.
The mely availability of this kind of visibility is of paramount importance, as it would determine the response strategy and reducon of impact because of security incidents. In order to have this visibility, the following are required:
S Robust policy backed by management commitments to define the requirements of security around business processes
S Security architecture with capability to provide contextual informaon about devices, users, network, locaon and applicaons

S Consolidaon and centralizaon of all security contextual informaon to correlate and analyze for proacve alerng and intelligence
S People and resources to manage and operate a structured process oriented operaons.
These can be done from a central place termed as CSOC - Cyber Security Operaons Center. Further, the Reserve Bank of India, vide its noficaon dated 2nd June, 2016, has menoned that "Banks should proacvely iniate the process of se ng up of and operaonalising an Informaon Security Operaons Center (ISOC) to monitor and manage cyber risks in real-me."
2.2 Definion of ISOC
The ISOC is responsible for monitoring, detecng, alerng, raising and responding to security incidents and the management of the organisaon's security products. A SOC typically funcons on a 24×7 basis in a week.
2.3 Securing Execuve Support
Securing Execuve Support is imperave for the success of a Security Operaons Center. To gain execuve support, a proposal may be placed before the top management with the following details:
S Need for a ISOC
S Regulatory and compliance requirements
S Short and long-term visions of ISOC aligning with organisaon's Business and IT objecves
S People, Process, Technology and Governance required to achieve the objecves of ISOC
S Strategy for se ng up the ISOC (In-house or outsourced)
S Budgetary requirements for ISOC
S Advantages of se ng up a ISOC.

12

Handbook on Information Security Operations Center

ISOC Planning and Design

2.4 ISOC Framework
ISOC funcons under the larger umbrella of Informaon Security Framework within an organisaon, headed by a Chief Informaon Security Officer (CISO), directly reporng to the Head of Risk Management.
Based on the established Informaon Security framework, Security Operaons Center needs to help in proacvely monitoring and managing cyber risks in real-me.
Based on such minimum baseline cyber security and resilience framework, Security Operaons Center would help in proacvely monitoring and managing cyber risks in real-me.

2.5 ISOC Funcons
The major funcons of ISOC may be classified into the following areas:
2.5.1 Intelligence Funcon
This is the core of the ISOC, equipped with the intelligent tools required for the processing and analysis of millions of events per second, and raising alerts in real-me. Competent and skilled resources of ISOC would analyse the threat pa erns, refine and implement rules for alerts, coordinate with internal and external agencies and provide guidance to the operaonal staff for faster incident response.

CERT-IN

Dashboard Privacy Impact Assessment

Handbook on Information Security Operations Center

13

ISOC Planning and Design

2.5.2 Monitoring Funcon
In order to idenfy anomalies and alerts in real-me, ISOC collects, monitors and stores large number of events per second, from security soluons like PIM, DAM, URL monitoring tool, phishing and brand abuse monitoring tool, etc., logs from end devices, servers, etc., and other parameters such as telemetric data (network flows and packet capture) and SNMP trap. Relevant alerts or events are idenfied by fine-tuning rules within the Security Informaon and Event Manager (SIEM).
2.5.3 Baseline Security Funcon
There could be some baseline security funcons, such as conducng regular Vulnerability Assessment and Penetraon Tesng, hardening servers, carrying out compliance scans against security best pracces, conducng Applicaon Security and Code Reviews, Risk Analysis, etc. In certain cases, the ISOC team may also take up such acvies.
2.5.4 Forensic Funcon
As security logs are being monitored and retained for a specific period as per the legal and regulatory requirements, any forensic analysis done would involve ISOC. The skilled analysts in SOC could help in the forensics invesgaon, in findings details and anomalies, collecng electronic evidences and ensuring the required details are provided to the forensic agency. In certain cases, the enre forensic analysis may also be taken up by the ISOC team.
2.6 ISOC Capabilies
The minimal capabilies an ISOC should have is indicated below:
Real-Time Analysis: Real-me Monitoring and Triage
Threat Intelligence: Cyber Threat Intel Collecon, Distribuon and Analysis, Threat Assessment
ISOC Tool Life-Cycle Support: ISOC Infrastructure O&M, Rules Tuning and Maintenance, Custom Signature Creaon

Incident Response: Incident Response Management
Scanning and Assessment: Vulnerability Assessment, Penetraon Tesng.
" Ten Strategies of Word-class Cybersecurity Operaons Center" by Zimmerman, C., could be handy to choose addional ISOC capabilies, as per the size of the organisaon and requirement.
2.7 Planning and Designing ISOC
Planning
Creang a plan for various phases of implementaon is crical to the success of a Security Operaons Center. It is imperave to capture details required for decision-making, including the organisaon's vision and objecves, environment, threat landscape, budget, etc. Also required is the management and other stakeholders' support in se ng up ISOC for necessary budget, resource sancons, integraon of systems with ISOC, etc. This support needs to be developed during the planning phase.
2.7.1 Define Business and IT Objecves
Security management requirements may vary with organisaons and hence should align with the organisaon's Business and IT objecves to enable them to achieve their goals by reducing security risks. COBIT model shall help in defining and aligning the business and IT objecves. Strategy for ISOC deployment should be derived out of these defined objecves.
2.7.2 ISOC Mission Statement
The ISOC monitors the security posture of networks, systems and applicaons operated by IT, with the objecve of detecng and reacng to Informaon security incidents that could negavely impact the organisaon's business operaons.
2.7.3 ISOC Scope Statement
The ISOC Scope Statement helps an organisaon to focus on what tasks the SOC should perform. It may cover the following:

14

Handbook on Information Security Operations Center

ISOC Planning and Design

S Monitoring of all systems managed and operated by IT
S Detecng and responding to security threats and malicious acvies
S Leading the Computer Security Incidents Response team
S Conducng awareness sessions when required .
2.7.4 Gather Informaon
Informaon collected during the planning phase is instrumental in giving the final shape of ISOC. Based on these collected data, the strategy for implementaon, deployment and even the expenditure would be derived. Collecng accurate and complete informaon during this stage is necessary.
2.7.4.1 IT Environment
IT environment in an organisaon is a major deciding factor, in choosing the ISOC Technologies and Architecture. Collect details on overall IT Architecture, IT Infrastructure, in-house or outsourced operaons, technologies in use, virtualizaon, use of cloud based services, etc. The technologies implemented in ISOC should be compable with the exisng IT established in the organisaon, as the goal is to monitor and manage security risks with respect to these very systems. Details on number of each type of assets (hardware/soware), data size, log size, bandwidth ulizaon, transacon related parameters, number of users, etc. would be required to size hardware and soware procurement and would also influence the licensing model adopted. Future IT Plan and strategy regarding adopon of new technology should also be captured during the data collecon phase, in order to accommodate them in ISOC planning.
2.7.4.2 Threat Landscape
Threat landscape for every organisaon varies, based on the type of business, locaon of business, type of technologies employed, standards and procedures

adopted for business, etc. Common threats include DDoS, Phishing, Spamming, Malware, Backdoor, Privilege Escalaon, Advanced Persistent Threat, Man-in-the-Middle a acks, Website Defacing, etc. Threat landscape keeps evolving at a fast pace. Understanding of evolving threats in other organisaons and other parts of the world is necessary in order to plan, keeping in view the future threat vectors.
It would be a good idea to understand the past security incidents within an organisaon and ensure that the ISOC meets the requirement to migate such incidents. The type of technologies to be adopted and services to be subscribed, would depend on the current and evolving threat landscape.
2.7.4.3 Regulatory and Compliance Requirement
The RBI in its noficaon regarding Cyber Security Framework in Banks, dated June 2, 2016 has menoned the need for arrangement of connuous surveillance.
Regulatory and compliance requirements of the country on Informaon Security and Cyber Security need to be idenfied, in order to accommodate them in the scope of ISOC.
2.7.5 Measure the Maturity
A good pracce is to carry out Gap Analysis (Security Maturity) before and aer deploying ISOC, with respect to IT Security Technologies, Processes, Organisaons, Metrics and Governance. Gap analysis process will help in idenfying and evaluang potenal opportunies to strengthen and improve overall security posture and to achieve higher security maturity level. The logical security architecture as explained in first chapter can help the organisaon to judge its maturity level.

Handbook on Information Security Operations Center

15

ISOC Planning and Design

2.7.6 Budget for ISOC
Budget allocated by the organisaon for Informaon Security would decide the strategy and scope of ISOC. Depending on provision of Capex/Opex budget, organisaon would need to decide whether deployment strategy would be in-house or outsourced ISOC, the technologies to be deployed and the licensing methodologies.
The gap analysis done and detailed study conducted on the cost of various models of implementaon would assist an organisaon in deciding the budget to be allocated (Capex-intensive in-house model or perpetual licensing model vs. Opex-intensive outsourced model or consumpon license model vs. hybrid model).
Organisaon can also explore newer technologies like virtualizaon and cloud based services wherever possible, which could bring down the total expenditure requirement. Annex 2.4 provides template for ISOC Budget.
2.7.7 Formulate ISOC Strategy
Selecng the opmal ISOC strategy depends on the Business and IT requirements, threat landscape, regulatory requirements and financial constraints. The ISOC strategy should be arrived at based on roles and responsibilies, various stakeholders, the model of operaon (own, outsourced), processes and resources required, priories with respect to operaon. A roadmap may be accordingly developed.
2.7.8 Idenfy the ISOC Technologies
The ISOC is a combinaon of technologies put together with seamless integraon, in order to achieve a faster incident detecon and response.
S Security informaon and event management (SIEM) tools are the core technical components of ISOC. SIEM technology supports threat detecon and security incident response through real-me collecon and historical

analysis of security events from a wide variety of event and contextual data sources.
S It also supports compliance reporng and incident invesgaon through analysis of historical data from these sources. The main capabilies include event and log collecon and management, data aggregaon, normalizaon, correlaon, analysis, reporng, alerng and dashboard facilies.
S Network monitoring tools provide insight into the state of the network within an organisaon. Oen referred to as Network Analysis and Visibility (NAV)/NBAD, these tools monitor crical network characteriscs for a possible presence of threat in real me and alert/trigger the response mechanism.
S Situaonal awareness is an important component in ISOC, which aims to achieve a thorough understanding of a ack vectors and the knowledge of what process/systems/people have access to which valuable informaon within an organisaon. In order to counter the emerging threats, self-learning, predicve analysis and risk based decision systems are also being implemented as part of situaonal awareness.
2.7.9 Understand the ISOC Tool Architecture
ISOC Tool comprises of Log Analyser, Network Analyser, Malware Analysers and Forensic Analysers with incident response mechanism taking input from all these analysers. For carrying the process of security analysis, auding, and compliance, data from various sources like event logs, network packets, network flows, etc., and in different formats need to be collected.

16

Handbook on Information Security Operations Center

ISOC Planning and Design

Incident Response

Forensic Data

Vulnerability Assessment & Penetration testing

Typical SOC Tool Architecture

2.7.9.1 Log Collecon
The following informaon will assist in acquiring relevant data and to perform useful analysis:
S Systems/ elements need to be monitored S Data format S Level of logging S Protocols used to collect data from the various
systems S Log storage and retenon period S System and network overhead caused by data
collecon S Capacity management in accordance with the
data collecon S Opmize data collecon capability.

The type of data to be collected and logging mechanisms/protocols supported by end devices, determine the collecon mechanism for deployment. Majority of the systems and devices navely support the `Syslog protocol' for event logging. In case of few non-Unix systems, one may need to install an agent. The Annex 2.4 provides recommendaons on logging. They also help decide the logging model to be adopted: centralized, distributed, or semi-centralized.
2.7.9.2 Telemetry Data ­ Network Flows
To monitor network from a security perspecve, capturing and transferring network packets is not always feasible. The storage costs of the data captured, lack of skillsets required to analyse the data and hardware costs of these data collecon tools discourage capturing such data, especially in

Handbook on Information Security Operations Center

17

ISOC Planning and Design

case of mulple locaons connected over a widearea network (WAN). Collecon of network flows, which gives contextual informaon about network connecons, is much more feasible than capturing full packets.
The system's overall performance is dependent on capturing, maintaining, and exporng network flow informaon. Working through a capacity-planning exercise and consulng with network vendor on the impact of enabling the feature is the best pracce.
Similar to syslog, one can implement a centralized, distributed, or semi-centralized model for collecng network flows.
2.7.9.3 Telemetry Data ­ Packet Capture
There are cases in which one need to go beyond collecng logs and network flows. Security point soluons like Intrusion Detecon System (IDS), Deep Packet Inspecon (DPI) and Forensic Analysis, etc., need network traffic containing actual data (payload) to be captured and forwarded. One may consider the following two techniques to capture network packets, in the case of Ethernet:
Port Mirroring: Network switches can be configured to mirror traffic seen on ports or VLANs to other local or remote ports. The network throughput of the source and desnaon ports needs to be considered while doing a port mirroring.
Network Taps: Connecng network taps (out-ofband devices) is another approach to monitor and capture packets from point-to-point links. Connecng taps to all network lines may not be feasible. Taps can be connected to the most important locaons in the network, such as Internet Gateways and Data Centers. In larger complex organizaon, network taps may be implemented for packet capture, to reduce the overhead on the business network.
2.7.9.4 Parsing and Normalizaon
Data that has been collected must be first parsed and

normalized for further analysis. Raw input data is processed and meaningful data from raw logs is extracted through the process of parsing. With normalizaon, similar extracted events from mulple sources are uniformly stored or consumed by subsequent processing steps.
2.7.9.5 Security Analysis
Security analysis involves researching collected data in order to uncover potenal threats. This could vary from performing a basic incident mapping to advanced mathemacal modelling, to discover known or unknown threats and to understand threat pa erns.
Security event correlaon is being offered by many SIEM Soluons as one of their core components. This involves idenfying relaonships between disparate events from various sources and collang and analysing these, to detect and report threats.
The correlaon engine of SIEM has rules, which require regular updates. The default rules can be fine-tuned and custom rules created, based on the organizaonal environment, business requirements and the use cases idenfied. Out-of-box rules could include alerng excessive failed login a empts, malware detecon, unauthorised outbound connecon, DoS a acks, etc.
2.7.9.6 Data Enrichment
Adding addional context to the data collected is known as data enrichment. Data enrichment helps in making more informed decisions, thus improving the accuracy of threat-detecon processes and tools. Following are few example of data enrichment:
S Geo informaon, mapping IP addresses to geographical locaons
S WHOIS informaon, providing addional contextual informaon on IP addresses
S Reputaon informaon on IP addresses, domain names, file hash values, e-mail senders, etc.
S Domain age informaon.

18

Handbook on Information Security Operations Center

ISOC Planning and Design

2.7.9.7 Storage Technology
During the planning phase, it is necessary to choose the right Storage Technology as well as do the sizing for storage, such that retrieval of data is faster and without impacng the performance of the system.
Network behavior data with or without packet is normally kept on online storage for very short duraon, whereas event related data can be stored for longer periods like six months or more. Storage sizing and type should meet legal, compliance, organizaonal and performance related requirements with some buffer as well as scaling up opons. The kind of online and archival storage (SAN, NAS or Device A ached Storage) may be OEM/ISOC soluon specific.
2.7.9.8 Threat Intelligence
Threat intelligence or cyber threat intelligence (CTI) is organised, analysed and refined informaon about potenal or current a acks that threaten an organisaon. The primary purpose of threat intelligence is helping organisaons understand the risks of the most common and severe external threats, such as zero-day threats, advanced persistent threats (APTs) and exploits. There are various service providers providing real-me global threat intelligence using feeds, e-mails, reports, etc. Annex. 2.3 provides informaon about informaon exchange on threat intelligence.
2.7.9.9 Compliance
For any successful security operaon, it is necessary to have the compliance of systems monitored against the security best pracces, regulatory requirements (RBI and various relevant Government Agencies), a global security standard like PCI DSS or maybe even a configuraon template. Regular monitoring can help have a visibility into the changes in the system and exisng configuraon problems that could lead to a security breach. Automang the system compliance process and then linking it to risk management and incident response pracces are key steps in any successful security operaon.

2.7.9.10 Tickeng and Case Management
Any security incident or potenal incidents reported by tools or by people need to be tracked unl closure, to ensure that the incident is properly managed. For proper incident management, a ckeng system could be used, which would help in creang, assigning and tracking an incident. This acvity should be supported with the right tools, authority, and integraon with incident response and case management processes.
SIEM, vulnerability management, and other ISOC tools should either support built-in incident management modules or should have the facility to integrate with organisaon's exisng IT ckeng system, for central management and reporng of incident ckets.
2.7.10 Collaboraon
The ISOC should have a strong collaborave system with IT and Business, which allows the ISOC team to centrally store, manage, and access documents, including system manuals, documented processes, incident response procedures, and so on.
2.7.11 ISOC Sizing
The sizing for ISOC should be planned based on the various parameters menoned in the log collecon secon. The ISOC sizing would depend on the number of servers, applicaons, Events per Seconds (EPS) and Flows per Second (FPS) generated by the systems, type of system, etc. A sample sizing data sheet and a template has been provided at Annex 2.5 for reference.
2.7.12 Understand Deployment Models
Once the data collecon steps like ­ deciding the data sources, calculang EPS, etc., have been completed­ one has to decide, how the ISOC would be deployed. The major component of ISOC is SIEM. SIEM in turn consists of three major components called Event Collector, Event Processor and Event Correlaon Analyser. (Terminology could vary between various

Handbook on Information Security Operations Center

19

ISOC Planning and Design

products). Collectors collect events from Syslog UDP, Syslog TCP, JDBC, Log File protocol, etc. Event Processors filter the events based on parsers and some rule sets. Event Analysers perform analysis on the events filtered by event processors and provide a dash board to the ISOC users. ISOC deployment models basically vary on how these three elements are best placed.
2.7.12.1 Centralised
In a centralised model, all the three components are placed at a central locaon. This deployment model is very simple and suits very small organisaons, wherein the number of systems and events are very low. For larger organisaon, this model would not be suitable, as shipping the event data to central locaon without filtering may exhaust the bandwidth on WAN links.
2.7.12.2 Distributed Processor and Central Analyser
In this model, the collectors and processors could be distributed. Each processor filters the events collected by a group of collectors and then hands them to analyser. This model suits larger organisaon, wherein only the processed data is handed over to the central analyser, reducing the bandwidth requirement over the WAN, considerably.
2.7.13 Understand the ISOC Licensing Models
ISOC components are basically licensed depending on the number of EPS generated, number of data collectors and data processors deployed. During the data collecon phase, the EPS esmaon exercise needs to be done, which would help in deciding actual deployment model that in turn decides the licensing model. The specific products purchased should support scalability and also upgradaon, based on the changing environment.
2.7.14 Understand Processes
Idenfy the core responsibilies and processes in an ISOC. There would be various day-to-day security tasks like patch management, server hardening, an-

virus signature update, fixing vulnerabilies, monitoring availability, etc., which needs to be handled by the IT Operaons. Other monitoring tasks such as detecng a DoS a ack, remote code execuon a acks, SQL injecon, unauthorised login a empt, etc., should be handled by ISOC.
It is important to idenfy the core responsibilies of the SOC and the IT operaons center. Based on the idenfied responsibilies for each, come to an agreement on how responsibilies are to be divided between the two.
2.7.15 Understand the level and depth of automa on
The ISOC's job is to monitor and help respecve team to remediate the threats across enre IT infrastructure as quickly as possible. To achieve this, it is necessary to integrate and automate funcons and processes of ISOC. More the automaon, faster would be the detecon and migaon capabilies, with minimal human resources. However, automang monitoring and remediang could be a costly process. Idenfy the core tasks and processes which needs to be automated.
2.7.16 ISOC Operang Models
Most organisaons face the dilemma of whether to outsource the ISOC or have it built in-house. Organizaons have varied business models, risk profiles, technology implemented and compliance and regulatory requirements to sasfy, with which ISOC must align. Based on these factors, the ISOC deployment methodology may be arrived at. The common ISOC Operang Models are:
2.7.16.1 In-house Capve ISOC
Capve or In-house ISOC is generally deployed by organisaons who want to avoid outsourcing of ISOC, due to various reasons like risks of crical security data loss, misuse of security logs and analysis, policy and regulatory requirements, etc. The organisaon can leverage on its own dedicated resources who

20

Handbook on Information Security Operations Center

ISOC Planning and Design

understand the environment and enable efficient correlaons among different working groups. This also allows for customizaon as per organizaon's needs. The challenges include, high Capex investment, requirement of in-house skilled resources on long term, me to realize ROI and me and effort to setup infrastructure.
One method to implement in-house Capve ISOC is Build, Operate and Transfer Model (BOT). Organisaons adopt this model with a vision to fully own and operate the ISOC at a later period, however wanng to leverage the experse of a service provider in se ng up and in a aining a faster maturity level, thus migang risks in the start-up stage. BOT, as a hybrid model, combines elements of the capve centre and outsourcing.
During the Build-phase, the service provider sets up the infrastructure and provides resources required for the acvity. In the Operate-phase, the provider manages the ISOC providing security services and also personnel required for the same. During the Transfer-phase, the provider iniates acvies like trainings, knowledge transfers, etc. to the in-house team.
2.7.16.2 Outsourced or MSSP Model
Organisaons going for managed security operaons can leverage on the service provider's already exisng infrastructure and skilled resource pool. Immediate benefits of ISOC implementaon is visible to the management. In addion, service providers, due to their various engagements with other organisaons, can bring in the knowledge base, learnings, and best pracces with respect to security incident and event handling and threat intelligence. The ability to scale up would be faster when compared to capve ISOC. Risks include loss / misuse of crical security data, sharing organisaon's vulnerability details with third party, misuse of data aer end of contract, etc. It is necessary to choose trusted partners based on their reputaon, reference customers, level of security and

experience of staff. Stringent contracts, NDA and SLA need to be in place with the service providers to address the risks involved.
2.7.16.3 Hybrid ISOC
This model is a hybrid of in-house and outsourced methods, wherein the organisaon can leverage the best of both the worlds. The security logs may be maintained in-house and the analycs, specialized services and threat intelligence may be provided by the service providers. This provides organisaons flexibility to develop experse in specific areas, flexible deputaon of organisaon's resources, ulize experse and infrastructure of the service provider for advanced analycs, scale up in mes of need and also meet stringent regulatory requirements regarding security logs. Risks include loss/misuse of security data, which would need to be addressed by choosing trusted partners and having in place NDA, contracts and SLA with the service provider.
While choosing the model, organisaons have to keep in mind the regulatory recommendaons also.
2.7.17 Manpower Requirements
The ISOC requires workforce can be divided into five categories:
Leadership Roles: The responsibility of the official would be to lead the ISOC team to achieve the mission of the ISOC.
Analyst Roles: Responsibilies include security event monitoring, incident report invesgaon, incident handling, threat intelligence, vulnerability intelligence and reporng.
Engineering Roles: Engineers with specific in-depth knowledge about tools and technology on top of which ISOC is built, is required for expanding the ISOC funcons and to handle and resolve any ISOC specific issues.
Operaons Roles: While ISOC engineers focus on

Handbook on Information Security Operations Center

21

ISOC Planning and Design

expanding scope of coverage in terms of both ISOC funcons and the devices to be monitored, operators basically concentrate on the upkeep of the current ISOC setup.
Other Support Roles: Other support roles like BCP and DRP support, compliance and audit support, incident and problem managers, process/procedure developers, training specialists, communicaon specialists, vendor and contract management support may be made part of ISOC, depending on the IT and Security Structure within an organisaon.
Based on the data collected during the data collecon phase, regarding scope of ISOC, number of servers, type of incidents, number of applicaons, type of systems, etc., a resource sizing acvity for ISOC may be carried out.
Conclusion
This chapter highlighted all the measures, technologies, people, processes, etc. to be employed for planning and designing of ISOC before going in for actual implementaon.

References
S Zimmerman, C., Ten Strategies of Word-class Cybersecurity Operaons Center, Mitre corporaon, 2014.
S A Design Model for a Security Operaons Centre (SOC) h ps://www.deitauditor.nl/informa e beveiliging/a-design-model-for-a-securityoperaons-centre-soc/
S A Successful SOC Builds on the Basics, h p://www.ey.com/Publicaon/vwLUAssets/EYsecurity-opera ons-centers-helping-you-getahead-of-cybercrime/$FILE/EY-securityoperaons-centers-helping-you-get-ahead-ofcybercrime.pdf
S SOC 2.0 Protecng Your Informaon Assets From Next Generaon of Threats, h p://www.dtssoluon.com/wp-content/uploads/2014/ 04/Security-Operaons-Center-v2.pdf
S Overview of Security Operaons Center Technologies, h p://www.ciscopress.com/ arcles/ arcle.asp?p=2455014
S Rishikesh Kamat, Security Operaons Center To Build Or Outsource?,h p://www. netmagicsoluons.com/data/arcle/Security Operaons Center - Inhouse vs17-01241485253065.pdf

22

Handbook on Information Security Operations Center

Chapter 3
ISOC Integraon and Implementaon

EVENT generators, event collectors, message database, analysis engines and reacon management soware are the five disnct modules of any typical ISOC. Built as autonomous parts, usually integrang all these modules keeping the integrity, security and availability of their data, is a major task.
The data gathered from log and event sources prior to and during the incident, helps ISOC analysts to use it as an invesgave tool, look for suspicious acvies that make up the present incident, and to manage the response to an incident or breach.
The incorporaon of Threat intelligence, Asset, Identy and other context informaon aids the ISOC analyst's invesgave process. Oen, an alert is associated with network or host-based acvity and, inially, may contain only the suspicious endpoint's IP address. Incorporang asset and identy informaon provides a huge advantage in me and effort to priorize the security incident - higher-value business assets should be priorized over lowervalue assets.
3.1 Understand the Environment
The ISOC team must have the appropriate tools, processes, documents, diagrams and knowledge to plan, deploy, operaonalize and manage ISOC in close coordinaon with each IT infrastructure and applicaon team. It is important to have copies of the key network and applicaon architecture diagrams. As a part of the ISOC's service funcons, the security architecture will be defined and the ISOC team will have access to different components and tools within that architecture. These may include, but are not limited to:
S SIEM monitoring and correlaon
S Anvirus monitoring and logging

S Network and host IDS/IPS monitoring and logging
S Network and host DLP monitoring and logging S Centralized logging plaorms (syslog, etc.) S Email and spam gateway and filtering S Web gateway and filtering S Threat monitoring and intelligence S Firewall monitoring and management S Applicaon whitelisng or file integrity
monitoring S Vulnerability assessment and monitoring.
3.2 High Level Execuon Plan
Equipped with the details of IT environment, chalk out a high-level plan on how to integrate the crical assets with ISOC. The plan may include the following steps.
S Deciding core funcons and core capabilies S Phase-wise integraon based on funcons S Phase-wise integraon based on cricality of
assets S Phase-wise integraon based on geographical
coverage .
3.2.1 Deciding Core Funcons and Capabilies
ISOC is made up of five core funcons viz. Log analysis, Vulnerability Analysis, Network Behaviour Analysis, Malware Analysis and Forensic Analysis. Keeping these five funcons at the core, the other layers like cket management, incident response, risk management, governance, etc., are built around.
List down the prerequisites for implemenng each of these funcons. Asset Discovery is an important prerequisite for a majority of the ISOC funcons, without which it would be difficult to idenfy and

Handbook on Information Security Operations Center

23

ISOC Integration and Implementation

a ribute the logs from each asset. Start with basic ISOC funcons like log analysis and vulnerability analysis. One needs to choose the capabilies that can be built based on the funcons chosen.
3.2.2. Phase-wise Integra on Based on Core Func ons
It is suggested to go in for a phase-wise implementaon as indicated below along with cket management, incident response and risk management:
S Phase 1 w Log Analysis ­ SIEM w Vulnerability Analysis
S Phase 2 w DAM ­ Database Acvity Monitoring w NBAD ­ Network Behaviour Anomaly Detecon
S Phase 3 w Malware Analysis ­ Advanced Persistent Threat Protecon
S Phase 4 w Forensic Analysis.
3.2.3 Phase-wise Integraon Based on Cricality of Assets
Integrang all assets with ISOC is a huge and meconsuming process. A plan needs to be in place to include all assets over a period of me. Inially, go with crical assets (Crown Jewels) that cover 90% of the business.
S Crical Security Point Soluons like Firewall, IPS, DAM, PIM, An-DDOS, etc located in DC/DR
S Crical applicaon servers / equipments located in DC/DR
S Crical network equipments.

3.2.4 P h a s e - w i s e I n t e g r a  o n B a s e d o n Geographical Coverage
Organisaons' crical assets may be spread across a wide geographical area. Apart from DC and DR, certain business offices may also be crical. Integrate the assets of DC, DR, Central Offices, Regional offices, branches, etc., in a phase-wise approach.
3.3 ISOC Deployment
SIEM Deployment Phases

Discovery

Pilot and Controlled Deployment

Deploy and Mature

Mature

3.3.1 Discovery Phase ­ Laying the Groundwork
S Review the organisaonal security posture and the inial business case for a SIEM. Then priorize the goals of the SIEM implementaon from the most crical to the oponal -taking into account the tasks that must be performed in order to support the effort
S Review in detail the organizaonal security policy and separate those policies from a priority standpoint. Determine what is crical, what's necessary for mandatory compliance and what policies are best pracces to ensure a secure environment
S Idenfy current controls that are auding those policies to determine compliance level
S Idenfy a smaller representave subset of the current policy and devices, where SIEM can be applied and enough data can be gathered.
3.3.2 Pilot Phase ­ Beginning the Implementaon
The primary goal of this phase is to determine which specific SIEM project goals can be implemented in order to establish inial ROI while creang a baseline operaonal model:

24

Handbook on Information Security Operations Center

ISOC Integration and Implementation

S The lessons learned from the discovery phase are used to implement a larger subset of technology
S The assumpons developed during the discovery phase are tested in real-me
S The list of devices should be expanded to incorporate a wider set of technologies and numbers
S The informaon developed from this phase is used to determine the final steps of controlled deployment and maturity phase.
3.3.3 Controlled Deployment Phase ­ Capacity Building
The primary goal of this phase is to develop a deployment workflow that enables the organisaon to build capacity as full deployment approaches. This phase also serves as the inial producon test run and the compleon of operaonal processes and procedures necessary to manage a full deployment.
3.3.4 Maturity Phase ­ Connuing to Evolve
Significant work must be performed in order to mature the organisaon's security posture and implement the finer points of deployment. This phase never has an end since SIEM must connually evolve.
3.4 Asset Inventory
There should be a centralised asset inventory of the enre IT infrastructure and applicaons consisng of targeted systems/devices/applicaons/networks. The next step will be integraon of log sources with the ISOC for situaonal awareness and in-depth visibility of the organisaonal IT setup. Classificaon of the assets on the basis of cricality is must and will be linked to the severity of incidents, its response and migaon measures. Indicave asset collecon template is in Annex. 3- A.

3.5 Time-Stamp
Logs must be me-stamped to trace back the events and correlate findings. The best pracce to ensure that all systems are in the same me schedule is to use a me-stamp server (NTP).
3.6 Event Genera on, Collec on and Storage
Once the targeted systems are idenfied and inventoried, the next step is to collect the events through logs. The Event Generaon should be set-up to generate as much raw informaon as possible. This informaon can be sent in "real-me" to collectors and/or can be stored locally for future collecon.
Idenfy and place the log collectors in appropriate locaons like DMZ, internal network, crical server segments, etc. The deployment and number of sensors/collectors for perimeter and internal components will be dependent upon the network architecture and the types of cyber security soluons deployed by the organizaon. The sensors/collectors will in turn forward the logs gathered to central processor/correlaon engine for further processing and storage. The Log Analysis and Correlaon engine will then apply the use cases to the data it receives to provide the required alerng and reporng acons by the SIEM.
3.6.1 Integraon of Log Sources
The integraon of log sources with the Collector/Sensor of the SIEM data may be carried out on the basis of the filtering and logging level as per suggesons given in Annex 2.
S Inial Implementaon: It is a good pracce to start with UAT or Test systems, observe the performance and then start with less crical log sources. The process of integraon of log sources is mostly non-disrupve except for few systems where agent has to be installed for detailed log capture.

Handbook on Information Security Operations Center

25

ISOC Integration and Implementation

S Connectors/Parsers: Most of the standard SIEM soluon will provide out-of-box connectors/parsers to integrate the IT infrastructure with SIEM. As a part of RFP or inial planning, the organizaon needs to get compliance matrix from System Integrator/OEM implemenng the project. The compliance matrix will indicate compability of their SIEM soluon vis-à-vis different flavors and versions of IT infrastructure (OS, DB, Middleware, Network and Security components, NOC soluon tools, T i c ke  n g , L D A P, e t c . ) a n d d i ffe r e n t applicaons/soluons deployed in the organizaon. In few cases, there may be requirement for customizaon and/or development of connectors and same has to be factored in the scope of work in RFP. It will be an on-going acvity as more and more systems/devices/applicaons are added.
S Integra on and Scaling: The indicave integraon of systems/devices is provided in menoned in Annex 3-B. Clear cut scope of work, customizaon/development of connectors/parsers, scope of scaling up the SIEM soluon, need for new connector/parser, etc. has to be beforehand finalised.
3.6.2 Collecon and Storage
The main operaons performed by collectors are the recepon of raw logs/events through different protocols and from varied source types and idenficaon and parsing. Once a message is parsed, it is stored for a long term compliance purpose and for real-me alerng and reporng. Performances and availability requirements naturally influence the design of a scalable architecture.
3.7 Data Analysis
ISOC gives structural and behavior-led alerts. The main operaons performed that generate alerts/incidents using well-defined use cases are the following:

S Correlaon ­ A stand-alone operaon used to detect an intrusion a empt by creang the contexts from captured data and matching them with specific intrusion characteriscs.
S Structural Analysis ­ This is a kind of advanced pa ern matching process, used to determine whether events of a certain context lead to a known intrusion path.
S Intrusion Path Analysis ­ This provides informaon about the exposure of the target system to the intrusion a empt detected.
S Behaviour Analysis ­ By taking informaon from the security policy and asset database this step determines whether the intrusion a empt is allowed or not. The idea here is to generate alerts by taking care of the security policy defined, as well as cricality of the target systems.
3.8 Developing Use Cases
Use Cases, the heart of any ISOC, is used to determine if any event is an incident or not. To ensure that the ISOC as cyber security system for monitoring, detecon, prevenon and migaon is effecve, a series of use cases must be defined. A use case may include the involvement of a Rule, Alarm, Mail alert or even a Dashboard. Use cases may be developed to meet the organisaon's security policy requirements and detect policy violaons.
A good way to start developing the use cases can be as menoned below:
3.8.1 A ack based Use Case Model
Look at cyber security incidents that the organisaon has experienced over the past few years. Idenfy anatomy of a ack and model threat indicators for monitoring in SIEM to generate alert and help team to take migaon steps. Examples of a ack based use cases are SMTP from unauthorized host, failure of an-virus to clean malware, excess inbound or outbound flow, etc.

26

Handbook on Information Security Operations Center

ISOC Integration and Implementation

3.8.2 Business based Use Case Model
Understand business process and linkage to IT Security and monitor logs for compliance violaon. Use cases should be built to detect non-compliance of legal and regulatory requirements, taking cues from recent audit findings. Examples include use cases for PCI DSS compliance, etc.
3.8.3 Asset based Use Case Model
Look at the organisaonal IT infrastructure set-up. Idenfy OS, Applicaon, DNS, Web Server etc., and based on their threat exposures, the organisaon can monitor logs and correlate events to generate required security alert. Examples of asset-based use

cases include password cracking of OS, DDoS on Web servers, malicious probe on Firewall, etc.
3.8.4 Lifecycle Phases of ISOC Use Cases
Even though out-of-box use cases will be available, organizaon need to study and develop Use Cases to meet its cyber security requirements, which are highly contextual. Organisaons can apply the Lifecycle Framework for development of use cases as depicted below:
A few examples of a ack scenario is in Annex. 3-D and an example of a Use Case is in Annex.3-E.

(Source : Sameer Paradia, Security Consultant)

Handbook on Information Security Operations Center

27

ISOC Integration and Implementation

3.9 Reporng
ISOC should be capable of generang customised reports at regular intervals for the purposes of meeng compliance requirements, informing Top management, Audit requirements, and incident management. In general, the ISOC, may provide reports on the following:
S Security Event and Trend Stascs S Firewall Traffic and Ulizaon Stascs S Vulnerability Management S Audit Compliancy S Workload Priorizaon S Suspicious Host Detecon S IP Intelligence (Security Analycs) S Compliance.

3.10 Developing Dashboards
Enterprise dashboards are the first points of contact in the area of Security Informaon Management. It provides a bird's eye-view to the top management on the security posture. Reporng of incidents and threats are commonly projected via the dashboard format. Dashboards act as frontends to ISOC tools by providing collaboraon, workflow, publishing, reporng and tracking capabilies. The dashboard has to be customized to meet the requirements of set of stakeholders like Execuves, CISOs, Operaon team, etc. Below is an example dashboard:

28

Handbook on Information Security Operations Center

ISOC Integration and Implementation

The dashboard tab of the ISOC portal brings up the KPI dashboard. The Analyst can enter a range of dates, to see an overview of security metrics like IDS status, number of incidents, ISVM noces, top virus intercepts, spams messages stopped, number of vulnerabilies tracked, number of security event noficaons and ISVM compliance. The graphically presented dashboard KPI should have drill-down capability.
The incorporaon of a security blog allows the administrator to keep users advised of system news, help materials and other community-oriented material:
S A common feature list of a ISOC portal include: Security Event Noficaon Publishing & Tracking
S Comprehensive Incident Handling and Response Capabilies with Workflow
S Vulnerability Assessment Scan Scheduling and Tracking
S Vulnerability Management Publishing of Technical Alerts, Advisories, and Bullens
S Vulnerability Management Compliance Tracking
S Dashboard View of Overall Security Posture of the organisaon with drill-down capability
S Comprehensive Reporng Capabilies
S Facilitates Compliance with PCI DSS and other Regulatory Reporng
S Security Device Tracking
S Several Security Related RSS Feeds and Links to Security Vendors
S Source of informaon about the Organizaon's Security Policies and Direcves
S Discussion Forum for Security Related Discussions
S Blog for Immediate ISOC Related Informaon to be posted
S Engineering Change Control for System Change Requests

S An Administrave Interface for Managing Users and Roles
S User role based with applicaon role based access
S Ability to add data feed and generate dashboard graphs
S Ability to add third party soware for integraon to the portal such as Vulnerability Scanners and Tickeng Systems.
A sample list of dashboards is in Annex. 3-C.
3.10.1 Security Metrics Dashboard
Organisaons need to communicate the operaonal results of ISOC to the top management. Today, communicaon is lacking in updang the decisionmaking execuves of the organisaons. Therefore, the organisaon is unable to provide the necessary oversight to the security programme, which comes under the responsibility of the Security Operaons Center, and runs the risk of not providing informaon to the organisaon's regulatory bodies.
The security metrics dashboard can give a glimpse on the state of security to the top management. In terms of the metrics, this enterprise dashboard includes Privacy (reported incidents, resolved incidents), Threat Management (Forensic Invesgaons ­ acve, new, closed, Intelligence ­ cyber threat incidents, Intrusion Detecon ­ security ckets), Assessments (third party site assessments), Awareness & Educaon, and Issues Tracking (audits).

Handbook on Information Security Operations Center

29

ISOC Integration and Implementation

Security Metrics

2005 Metrics Jan Feb Mar Apr May Jun Jul Aug Sep Oct

Nov

Dec

YTD*

Privacy

Reported

10 26 15 31 19 19 16 21 12 24

21

23

237

Incidents

Resolved

12 22 9 20 22 16 21 20 21 14

7

10

194

Incidents

Threat Management

Forensic

48 63 62 56 68 58 65 48 46 37

31

32

32

Investigations

Active

Forensic

26 26 26 25 17 22 18 20 9 17

20

22

248

Investigations

New

Forensic

11 27 32 13 27 15 35 22 18 23

19

27

269

Investigations

Closed

Intelligence ­ 281 85 172 83 79 53 45 183 44 34

40

82

1181

Cyber Threat

Incidents

Intrusion

2316 361 503 243 388 429 701 158 131 116

144

54

5544

Detection

Security

Tickets

Assessments

Third Party

1 3 7 11 3 2 0 0 8

1

36

Site

Assessments

Completed

Awareness & Education

Percent

64.47% 78.25% 80.58% 80.58%

Complete of

the Tutorial

2005-2006

Issues Tracking

Audit ­ Past

11 19 11 10 7 5 5

6

4

4

Due Issues

Audit ­

9

10 17 5 10 12 3 10 14 1

2

9

102

Closed Issues

Risk Acceptances

Risk

18 18 22 23 21

22

23

23

Acceptances

­ Active

Risk

773 32

4

4

4

Acceptances

­ Expired

Risk

7 8 10 11 15

15

15

15

Acceptances

­ Closed

30

Handbook on Information Security Operations Center

ISOC Integration and Implementation
3.11 Tesng the ISOC Deployment
There are different ways to test the ISOC deployment:
S Inject simulated test data into the ISOC database and see whether the incident response and ckeng mechanism along with dashboards are working fine
S Engage third-party pen-testers and check whether all the events are generated, data is collected by collectors and shipped to the central processor for analysis and alert is raised.
Develop a ack cases and detecon rules as given below, for few cases and test whether the ISOC is responding as expected.
Brute force a ack to an administrave interface: This a ack a empts to connect either to an exposed SSH server or to an exposed web administraon page, through mulple connecons with varying credenals. Using tools like Hydra, one can simply launch mulple connecons to the server using different credenals every me unl it succeeds to idenfy a valid account with its password. The rule of detecon consists of a check of the number of connecon a empts from a specific IP address over a period of three minutes. Use of TOR as a proxy for the brute force a ack, resulng in a wide range of source addresses makes this rule praccally useless. In order to be able to detect a successful a ack, the SIEM needs a list of allowed IP address ranges that are entled to access the associated administraon interface. Successful connecon from another IP address should generate an event "Remote Admin Access from Unknown Address".
Conclusion
This chapter covered in detail the implementaon and integraon phases of ISOC, use case developments and dashboards.

Handbook on Information Security Operations Center

31

Chapter 4
Operang ISOC: Governance, People and Processes

THE ISOC must align with and be integrated into the business process of an organisaon with a strong Informaon Security principle that drives protecon of valuable assets. The SOC operaons must be integrated into the Risk Management, Business Connuity, Compliance and Governance processes. With Incident Response and Escalaon procedures well-defined, Change Management, Alert and Noficaon policies need to be clearly communicated to business units from me to me.
4.1. ISOC Governance Model
Organisaons need to develop a governance framework for escalang security issues and evaluang their impact on the business. The governance framework shall clearly define the place of ISOC in the organisaonal chart and describe the scope of ISOC authority, through policies and standards. The key aspects of governance include the

following areas:
S Top Management/Board must be updated on the latest changes in the threat landscape
S Appropriate and insigh ul dashboards must be published
S There has to be a well-defined policy and procedure governing the security operaons, which should be periodically reviewed
S There must an appropriate reporng structure/ escalaon matrix, to be followed for crical incidents
S Key metrics must be defined to measure the efficiency of the overall ISOC team.
Lastly, all the stakeholders must be involved and a proper responsibility matrix must be defined so that everyone is aware of individual roles.

CMD ED

Board

Information Security Committee Head - Integrated Risk Management (HIRM)

Chief Information Security Officer (CISO)

Business Compliance
Legal Human Resources
Internal Audit IT
Physical Security Communications

Information Security Risk Management (ISRM)

Information Security Awareness
Management (ISAM)

Business Continuity Management
Planning & Monitoring (BCPM)

Security Operations Centre & Incident Management (SOCIM)

A SAMPLE GOVERNANCE MODEL

Security Monitoring

Incident Responce and Forensics

Threat Intelligence and Vulnerability Management

Data Loss Prevention

SECURITY OPERATIONS

32

Handbook on Information Security Operations Center

Operating ISOC: Governance, People and Processes

4.2 SOC Authority
The SOC Authority describes the amount of discreon the SOC has in direcng acons that affect an organisaon's assets, with or without permission from, or in co-ordinaon with other groups. The three levels of authority, an ISOC can exert are:
S No Authority: An ISOC can suggest to the IT asset owners, the acons they should take. However, the ISOC has no formal means to exert pressure. It is enrely up to the respecve owners to heed or ignore the ISOC's recommendaons.
S Shared Authority: An ISOC can make recommendaons to execuves (e.g., CIOs, CISOs, CEOs, system owners) who have various authories to enact change. These recommendaons are weighed against input from other stakeholders before a decision is made, giving the ISOC a right to vote, but not the final say.
S Full Authority: An ISOC can direct IT asset owners to take certain acons, without seeking or waing for the approval or support from any higher-level execuve.

An organisaon can apply ISOC's formal authories up to a point, beyond which the ISOC must turn to influence rather than mandate. For aggressive countermeasures or response such as disabling a key corporate server, high-level agreement and understanding is needed.
Therefore, organisaons need to establish clear-cut policies describing, when an ISOC can exercise full authority, shared authority and no authority.
4.3 People, Processes and Technology
Security is becoming more and more established in the corporate structure and it is no longer acceptable for it to be a secondary funcon of an IT department. Most of the organisaons are invesng in the development of an ISOC to enhance their security posture and provide rapid response to events throughout the network. Building an ISOC is a monumental task. There are three major components that every organisaon must include ­ People, Process and Technology. These three exist in all elements of security and one should consider them as equally crical components. The following picture depicts the interacon of people, process and technology within ISOC.

Handbook on Information Security Operations Center

33

Operating ISOC: Governance, People and Processes

4.3.1 People

ISOC requires talented resources with deep technical knowledge, broad range of capabilies and diverse experience.

4.3.1.1 Tier 1 Alert Analyst

S Monitors the events queue S Triages the security alerts S Monitors the health of the security sensors and
endpoints S Collects data and is context necessary.

4.3.1.2 Tier 2 Incident Responder

S Performs deep dive by collang data from various sources
S Determines if a crical system or data has been impacted
S Advisory support
S Provides support for new analyc methods for detecng threats.

Security Operations Center: Organization Chart
Tier 1 Alert Analyst

SME/ Hunter (Threat Level)

Frontlines

Tier 1 Alert Analyst

Tier 2 Incident Responder

SME/ Hunter (Network)

SOC Manager

SME/ Hunter (Malware RE)

Frontlines

SME/ Hunter (Endpoint)

4.3.1.3 Tier 3 SME (Subject Ma er Expert) or Hunter
S In-depth knowledge on network, endpoints, threat intelligence, forensics
S Acts as an incident `Hunter', rather than waing for escalated incidents
S Involves in developing, tuning and implemenng threat detecon analycs.

4.3.1.4 ISOC Manager
S Provides an overall direcon for the ISOC
S Manages resources to include personnel, budget, shischeduling
S Manages technology strategy to meet SLAs
S Communicates with management
S Organizaonal point of contact for business crical incidents
S Works with the ulmate goal of detecng, invesgang and migang incidents that impacts business.
ISOC personnel must have the necessary training to deal with the constantly evolving and oen quite challenging job of a security analyst, incident inves gator, subject ma er expert and ISOC Manager.
In addion to the ISOC analysts, the ISOC Manager plays a pivotal role. The ISOC Manager is responsible for priorising work and organising resources with the ulmate goal of detecng, invesgang and migang incidents effecvely that could impact the business. The ISOC Manager should develop an incident workflow model and implement Standard Operang Procedures for the incident handling that helps the analysts guide through triage (order of treang security events) and response procedures.
4.3.2 Processes
ISOC processes and procedures can act as a buffer between the people and technology. Mature processes, procedures, and improving them constantly guarantee the success of ISOC. Capability Maturity Model® Integraon (CMMI) is a process improvement approach that provides organisaons with the essenal elements of effecve processes. Because ISOCs typically have a large number of processes and procedures, CMMI offers an architecture to help organise, maintain, and improve the processes and procedures. The ISOC processes are divided into four main categories:

34

Handbook on Information Security Operations Center

Business Processes: Document all the administrave and management components that are required operate an ISOC efficiently.
Operaonal Processes: Document the mechanics of the daily operaons, like shi schedules and turnover procedures.
Analycal Processes: Encompass all acvies designed to detect and be er understand malicious events.

Technology Processes: Maintain all the informaon relang to system administraon, configuraon management and conceptual design.
The various processes that are necessary for an effecve ISOC are depicted in following diagram:
4.3.3 Technology: ISOC Monitoring and Reporng
An enterprise wide data collecon, aggregaon,

SOURCE: HP

detecon, analyc and management soluon is the core technology of a successful ISOC. An effecve monitoring system incorporates data gathered from the connuous monitoring of the log sources (network devices, servers, PCs, laptops, mobile devices).
With the benefit of all the logs aggregated on the security monitoring system, ISOC analysts can leverage the monitoring system as an invesgave tool from being just a detecve tool; thereby reviewing the suspicious acvies and to manage the response to an incident or a breach.
The ISOC is responsible for monitoring, detecng, analysing, invesgang, isolang and responding to

incidents. The ISOC technology is leveraged to carry the following ISOC operaons on 24 × 7 basis.
4.3.3.1 Service Funcons
Derive and document a list of service funcons from the objecve of the ISOC deployment. These may include:
S Status monitoring and Incident detecon (Note: List is indicave, not exhausve) w SIEM w AV w IPS/IDS w DLP
S Inial diagnoscs and incident isolaon

Operating ISOC: Governance, People and Processes

S Problem correcon S Work with OEMs S Escalaon to next er level S Closure of incidents in coordinaon with er
levels
S Persistent Threat Invesgaon.
The service funcons will guide the ISOC personnel on the daily processes and procedures. Segregaon of dues must exist between one er to the other. For example, Status monitoring and Incident detecon may be the service funcon of Tier 1 and working with OEMs may be the service funcon of Tier 2 or Tier 3 staff.
4.3.3.2 SIEM Health Check
The SIEM health status monitoring is designed to assist in increasing availability and upme of SIEM. SIEM upme monitoring consists of the following acvies:
S Install monitoring soware on eligible devices to monitor system health, system performance and report metrics to the authorized/concerned pares. For large organisaons, this can be taken care by the Technology Team or NOC (Network Operaons Centre) team
S Analyse and respond to key metrics such as:
w Hard disk capacity w CPU and memory ulizaon w Process availability w Respond to alerts generated by the
monitoring soware.
S Where monitoring soware installaon is not possible on certain devices, the following acvies can be performed:
w Monitor the administrave interfaces of the devices
w Monitor the event stream generated by the devices

w Perform me based checks to verify any loss of connecvity to managed agents.
S If a security monitoring system (typically a SIEM) component is not funconing as expected or has a potenal issue:
w Tier 1 analysts shall create a cket on the ckeng system
w Perform preliminary invesgaon of the documented issue
w Escalate to Tier 2/Tier 3 SIEM System administrators as appropriate
w SIEM administrators shall further carry out the root cause analysis and track the incident to closure
w Display the device health and outage cket in the SIEM console and ckeng system.
S In the event where a SIEM system component becomes unreachable and that hampers log accounng on the SIEM console:
w Nofy the authorised contacts w Invesgate the root cause related to the
configuraon and funconality of the system component w Display device health and outage ckets in the SIEM console and ckeng system w Provide troubleshoong and root cause analysis.
4.3.3.3 Event Monitoring and Invesgaon
SIEM Analysts shall perform event monitoring and analysis of security events and correlate events generated by the SIEM soluon. They are responsible for analysing security events, determine if the events are considered an incident, then classify, priorize and escalate as appropriate. Listed below are few of the acvies of SIEM Analysts:
S Monitor SIEM events that result from real-me analysis and correlaon of log data from sources idenfied

36

Handbook on Information Security Operations Center

Operating ISOC: Governance, People and Processes

S Perform invesgaon and analysis of the events
S Assist in removing false posives and classify them as known events
S Create a cket for effecve tracking and closure
S Idenfy correlated events and classify them as security incidents upon invesgaon that include service levels, priorisaon based on SLAs, remediaon and recommendaons
S Analyse and respond to key health and availability monitoring metrics:
w Correlaon engine processing rate w Log manager processing rate w Backup of databases w Database ulizaon percentage.
S Examine SIEM configuraon and its funconality for any potenal issues that may result in malfuncon of a parcular component of SIEM or in enrety and escalate the ma er.
Analysts must perform 24x7 security monitoring. Any qualified security event shall be reported to the concerned authories based on the SLAs defined and agreed. Subsequent to the invesgaon of the alert and anomaly detecon, the ISOC must provide a noficaon, typically containing the following informaon:

S Date of the alert triggered S Time of the alert triggered S Time zone of the customer locaon S Log source S Severity S Classificaon S Alarm ID S Policy S Source Host Name/Source IP address/Source
Port S Desnaon Host Name/Desnaon IP
address/Desnaon Port S User Account S Event Count (Number of logs) S Threat Descripon S Impacted Host/Applicaon S Remediaon/Recommended Acon.
4.3.3.4 Alert Classificaon
The ISOC must follow a standard for severity level based on the classificaon of the alerts. The list of the idenfied classificaons and associated severity with some example events can be found below. The ISOC Analysts must use this standard for tagging the severity while reporng legimate alerts.

Classification Description

Severity

Compromise

Logs reporting on a successful system or a network compromise.

High

Attack

Logs reporting on an activity indicating system or network attack. Attack is known to have originated from a "Bad Guy" source.

High

Denial of Service

Logs reporting on activity indicating denial of service where it is assumed to have succeeded to have failed.

High

Handbook on Information Security Operations Center

37

Operating ISOC: Governance, People and Processes

Classification Malware

Description
Logs reporting on activity indicative of malware installation, propagation or use which is specifically targeting the organisation and can be aligned with any Indicators of Compromise.

Severity High

Suspicious

Logs reporting on an activity that is only suspicious but not known to be a legitimate attack.

Medium

Reconnaissance

Logs reporting on an activity indicative of or directly indicating system or network reconnaissance.

Medium

Misuse

Logs reporting on an activity indicating network or system

(Policy/Complian misuse.

ce violation)

Activity

Logs reporting on general system or network activity.

Medium Medium

Risk

Logs reporting on potential vulnerability weaknesses.

Medium

Authentication Access

Logs reporting on unusual authentication attempts and account modifications.
Logs reporting on general system access activity.

Medium Medium

Application

Logs reporting on application specific activity.

Medium

Failed Attack Logs reporting on attack activity that was not successful,

Low

possibly due to preventive measures.

Failed Denial of Logs reporting on denial of service activity that was not

Low

Service

successful, possibly due to preventative measures.

Failed Malware Logs reporting on malware activity that was not successful, Low possibly due to preventative measures.

Failed Suspicious Logs reporting on suspicious activity that was not successful, Low possibly due to preventative measures.

Failed Activity

Logs reporting on general system or network activity that was Low not successful, possibly due to preventative measures.

Other Security Logs reporting on security activity not otherwise classifiable. Low

4.3.3.5 Reporng Process
As a primary funcon, ISOC needs to generate regular reports to cater to different people or groups within the organisaon. A report on incidents and

another detailing the acvity within the ISOC is usually generated every week. These reports can be delivered to the management and other members from the escalaon matrix.

38

Handbook on Information Security Operations Center

Operating ISOC: Governance, People and Processes

The ISOC manager must carry out regular review of all incident records for their resoluon within the parameters of the defined severity levels. Proper review of incident records that exceeded standard resoluon mes needs to be validated to check whether they were handled appropriately. Based on the reviews and audits, the ISOC processes and procedures should be updated.
The service levels must be reviewed once in a month at least. An example of the response me and resoluon me SLA can be defined as below. All the numbers are indicave and should be aligned with individual organisaon security policy/incident response plan.

Severity Response Time Resolution Time SLA

High

20 mins

24 hours

98%

Medium 60 mins

48 hours

98%

High

180 mins

96 hours

98%

Response me is the me within which a security event upon detected, is invesgated and reported to the concerned domains along with recommendaon to the incident occurred. Resoluon me is the me within which the recommendaon is applied and helped towards incident closure.
When the SLA of High Severity incidents are set at 98%, the ISOC is bound to respond to those events within 20 mins and resolve the incidents within three hours 98% of the mes.
4.3.3.6 Incident Management Process
As per Symantec, "an incident is a set of one or more security events or condions that requires acon and closure in order to maintain an acceptable risk profile. In the haystack of events, organisaons must find the "needles" that are the security incidents. Events are isolated and disconnected, but incidents add the context that enables security administrators to gain understanding and take acon".

The Incident Management allows technicians need to understand:
S Scope: The number of systems affected
S Impact: The degree to which each system is affected in terms of confidenality, integrity and availability
S Business Cricality: The importance of the incident based on the business value of the impacted systems relave to other systems
S Priority: The urgency of the required response relave to other incidents.
The SANS Instute has arculated a thorough framework for incident handling that lends consistency to an oen muddled process. Between idenficaon and closure, according to SANS, the following types of acvies should occur:
S Containment: Liming the scope and magnitude of the incident
S Eradica on: Eliminang the source of the problem or avenue of entry
S Recovery: Returning affected systems to their fully operaonal state
S Follow-up: Documenng the root cause and impact of the incident; and implemenng measures to avoid recurrences.
4.3.3.6.1 Case Management
An analyst performs mulple searches to understand the nature, intent and scope of a suspicious acvity as part of the invesgaon process. Unless these searches and the resultant data are organised properly, it becomes difficult to interpret and may lead to an incorrect conclusion resulng an incident to slip.
Cases need to be created within ISOC plaorm, which can act as a central repository of evidence ed to ongoing invesgaons. They can include any exisng forensic data within ISOC, as well as external evidence such as screen captures from third-party

Handbook on Information Security Operations Center

39

Operating ISOC: Governance, People and Processes

products. Case Management ensures that threats are proacvely idenfied, priorised and rapidly invesgated within the Security Intelligence Plaorm for streamlined incidence response.
4.3.3.6.2 Incident Response Flow
Responding and managing an insider incident can be the most difficult phase. The ISOC should alert analysts via pager, e-mail, SMS, etc. and escalate those alerts. It can stop the progression of the threat/damage in real-me with or without human intervenon.
Remediaon too can take place with or without human intervenon in the form of quaranning or blocking an IP address, disabling a MAC address port on a layer-2 switch and terminang a user's account. This limits their ability to login to the network or even physically access the building if the organisaon has combined their physical and logical security soluons. The remediaon capabilies need to follow industry best pracces, organisaonal

procedures, leverage change management parameters and provide full documentaon of each change, change rollback and auding capabilies.
One needs to decide what needs to be responded to automacally and what requires an analyst's intervenon. When addressing insider threat scenarios that may have limited response windows, a growing number of organizaons are now taking advantage of automac remediaon. This is a fundamental shiin how organisaons have typically addressed remediaon in the past, but a required change because the risks are now so great that there is oen li le to no me for a human response.
The following picture clearly illustrates the incident response process. In case of a security incident, the SIEM automacally opens a cket in ckeng system or cket opened by the Tier 1 monitoring people; Tier 2 personnel carry out invesgaon and assign resoluon tasks to the remediaon people.

Con gure

40

Handbook on Information Security Operations Center

Operating ISOC: Governance, People and Processes

4.3.3.7 Vulnerability Assessment and Penetraon Tes ng
Another important component of the ISOC funcons is Vulnerability Assessment and Penetraon Tesng. For large organisaons, the same can be a part of a different team as per individual organisaon security policy. The organisaon's security policies must define the frequency at which the VAPT is performed at the minimum.
A standard approach is as follows:
S Define scope (devices that need to be scanned and their IP addresses)
S Set-up a virtual lab S Install tools such as Nessus, NMAP S Scan the IP addresses of the devices in scope S Ensure to limit the number of concurrent
connecons so as to avoid a network crash S Review the vulnerabilies detected S Generate the report to publish the network
assessment findings S Each vulnerability will have a risk rang
depending on the its severity S Ensure to have all vulnerabilies closed per the
melines.
Conclusion
This chapter detailed how to operate ISOC with the help of a governance model, skilled proficient people and processes laid down by organisaonal policies.

References
S Addressing Insider Threats with ArcSight ESM, h p://viewer.media.bitpipe.com/1120682139_ 877/1297107228_284/Addressing_Insider_Thr eats_With_ESM.pdf
S The SANS Instute, "Computer Security Incident Handling Step by Step," Version 1.5, May 1998
S Managing Security Incidents in the Enterprise h p://www.symantec.com/avcenter/reference /incident.manager.pdf
S Intelligent Security Operaons: A How-to Guide HP Enterprise Business White Paper, h ps:// www.hpe.com/h20195/V2/getpdf.aspx/4AA66440ENW.pdf
S Case Management, h ps://logrhythm.com/ products/features/case-management/
S Building a Successful Security Operaons Centre, HP Enterprise Security Business Whitepaper.

Handbook on Information Security Operations Center

41

Annexes

Annex 1
ITIL Maturity Model

The Process Maturity Model for IT Asset Management proposed by Patricia Adams of Gartner (2003) is perhaps the most popularly cited model across ITAM literature. It has five levels of maturity: chaoc, reacve, proacve, service-oriented, and value creaon.

Step

Attributes

Goals

1. Chaoc Uncontrolled environment 30% of enterprises

 No processes, dedicated people or tools

 "Just want to know what we own, where it

 No assigned accountability or accounng for changes is, and who is using it"

 Unpredictable services, support and costs

 One-me acvity rather than systemac

 Purchasing is ad hoc

process.

 Unused hardware and soware are not controlled

 Success depends on quality of people, not processes

 Sub-opmizaon of efforts occurs.

2. Reacve Limited accountability 45% of enterprises

 Focus is on asset counng  Employs physical inventory and some auto discovery
recorded on spreadsheets or in a database  Accountability lies with IS organizaon but there is
ineffecve change accounng  Hardware and soware viewed separately, not as
single complex asset.

 Perform annual physical inventory and periodic spot audits
 Report on asset counts, but cannot produce solid detail data to idenfy and resolve problems.

3. Proacve Life cycle focus 20% of enterprises

 There is an IT Asset Program and manager with dedicated staff that reports to IS and finance
organizaons.  ITAM with auto discovery tools is integrated with
service desk  Use of cross-funconal teams for major asset
management projects  Life cycle management process goes from requision,
to deployment, to rerement  Inventory system linked to financial and contractual
data.

 "Clearly defined processes with accountability that detail the praccal applicaon of people, processes and tools that support the ITAM Program"
 Effecve change and configuraon management processes
 ITAM projects use repeatable processes that are well defined, adhered to, reviewed, and re-engineered when necessary.
 ITAM operaons manual with asset taxonomy produced and maintained.

4. Service Oriented Service level management 5% of enterprises

 Metrics are available to measure program value  Services are delivered according to SLA-based plans  TCO processes in place  Automated requision is integrated with purchasing
and ERP systems  Just in me inventory pracces used.

 Create SLAs for asset management and use them as a basis for planning
 Conduct periodic reviews of service delivery quality
 Instute an enterprise technology refresh plan for replacement and rerement of equipment.

5. Value Creaon Cost recovery < 1% of enterprises

 There is a cost recovery process  Repository, auto discovery and asset-usage tools all in
place  Seamless integraon with strategic systems like HR,
accounng, ERP, purchasing, network and systems management, IT service desk, problem and change management tools, and business connuity process  Decision support and analyc tools available for mining asset informaon.

 Connuous process improvement with improving metrics
 ITAM data used for problem prevenon  ITAM is a core business process and
business enabler  Measurement of efficiency (employee
producvity) and effecveness (customer sasfacon) of business processes across all IT assets in the enterprise.

42

Handbook on Information Security Operations Center

Annexes

Annex 2
2.1 Logging Levels
Log Collecon
In general, Syslog is the mechanism used for logging events. Microso Windows plaorms need an agent to forward events in syslog format. The minimum parameters that need to be configured are:
S Logging Desnaons: The collector, relay IP addresses, or hostnames. To how many desnaons the syslog messages from originator need to be forwarded, is dependent on the implementaon.
S Protocol and Port: By default UDP and port 514 are used. The opon of changing to some other port and protocol is implementaon specific.
S Logging Severity Level: It can be a value ranging from 0 to 7, as shown in the adjacent table:
Logging Severity Levels
Level Severity Levels
0 Emergency: System is unusable
1 Alert: Acon must be taken immediately
2 Crical: Crical condions
3 Error: Error condions
4 Warning: Warning condions
5 Noce: Normal but significant condion
6 Informaonal: Informaonal messages
7 Debug: Debug-level messages
Logging Recommendaons
Enabling logging is associated with cost on performance and funconality. Implement Time synchronizaon for meline events. Enable local logging to act as a backup repository when the centralised logging soluon fails. Before enabling logging, consider the following:

S Log events that are of business, technical, or compliance value
S Configure clients and servers for NTP
S Time stamp log messages and include the me zone in each message
S Configure the client with the minimum log collectors. Use Syslog relays to replicate and forward the same message to mulple desnaons. The desnaons could be like monitoring plaorms such as security, problem management, and system and network health monitoring
S Baseline and monitor the CPU, memory, and network usage overhead introduced by the Syslog service
S Have a limited local logging facility, in file or memory, so that logs are not completely lost if the Syslog collector is unavailable, such as in the case of network failure
S On a regular basis, test that logging is funconing properly
S Protect Syslog implementaon by providing confidenality, integrity and authencity
S The log rotaon and retenon policies be set properly
S Protect files where logs are stored:
w Restrict access to the system by assigning proper files access permissions and enabling file encrypon.
w Grant read access to log files only to authorised users and processes
w Grant write access to log files only to the Syslog service or any such collecon service
w Apply standard system hardening procedures to operang systems that host the logging server.

Handbook on Information Security Operations Center

43

Annexes

Logging Infrastructure
While designing a logging infrastructure, pay special a enon to the type of data being received, expected storage, security requirements, and so on. Here are some factors that may influence the design of logging infrastructure:
S Higher severity levels generate more logging messages. For example, configuring a firewall for severity level 6 (informaon) results in logging mulple events per permi ed connecon: connecon establishment, terminaon, and possibly network address translaon.
S Allocate sufficient system resources to the syslog client and server based on the number of logging messages being generated and collected. One may need mulple logging servers to handle a large amount of logging data.
S The per-device and aggregate events per second (EPS) rates. This depends on the device type, available resources, logging level, security condions, and its place in the network.
S The average size (in bytes) of logging messages.
S Network bandwidth available between the logging client and the logging server.
S Consider the load introduced by protecng syslog messages using secure network protocols such as TLS and DTLS.
S Consider the scalability requirements of the logging infrastructure as part of capacity planning.
S Collect logging messages using an out-of-band physical or logical network.
Having a separate management plane by way of virtual LAN (VLAN) or a Mulprotocol Label Switching (MPLS) Virtual Private Network (VPN) is a good network and system management pracce. One has no other opon but to forward logging messages inband if a system does not support having a separate physical or logical management interface.

2.2 Best Prac ces for Calcula ng EPS Rates
Speed of hardware, NICs (network interface cards), operang systems, logging configuraons, network bandwidth, load balancing and many other factors must also go into benchmark requirements. One may have two idencal server environments with two very different EPS requirements due to any or all of these and other variables. With consideraon of these variables, EPS can be established for normal and peak usage mes. The equaons included here, therefore, determine Peak Events (PE) per second and to establish normal usage swap the PEx by NEx (Normal Events per second) in the equaons.
List all of the devices in the environment are expected to report to the SIEM. Be sure to consider any planned changes, such as adding new equipment, consolidang devices, or removing end of life equipment.
First, determine the PE (or NE) for each device with these steps:
S Carefully select only the security events intended to be collected by the SIEM. Make sure those are the only events included in the sample being used for the formula
S Select reasonable meframes of known acvity: Normal and Peak (under a ack, if possible). This may be any period from minutes to days. A longer period of me, such as a minimum of 90 days, will give a more accurate average, especially for "normal" acvity. Total the number of Normal or Peak events during the chosen period. (It will also be helpful to consider compung a "low" acvity set of numbers, because fewer events may be interesng as well.)
S Determine the number of seconds within the meframe selected
S Divide the number of events by the number of seconds to determine PE or NE for the selected device.

44

Handbook on Information Security Operations Center

Annexes

Formula 1:
Number of Security Events / Time Period in Seconds = EPS
The resulng EPS is the PE or NE depending upon whether it began with peak acvity or normal acvity. Once completed this computaon for every device, insert the resulng numbers in the formula below to determine Normal EPS and Peak EPS totals for a benchmark requirement.
Formula 2:
S From the producon environment determine the peak number of security events (PEx) created by each device that requires logging using Formula 1. (for idencal devices with idencal hardware, configuraons, load, traffic, etc., use this formula to avoid having to determine PE for every device): [PEx (# of idencal devices)]
S Arrive at a grand total by summing up all PE numbers for the environment

S Add at least 10% to the grand total for headroom and another 10% for growth. The resulng formula becomes:
Step 1: (PE1 +PE2 +PE3 ...+ (PE4 x D4 ) + (PE5 x D5 )... ) = SUM1 [baseline PE]
Step 2: SUM1 + (SUM1 x 10%) = SUM2 [adds 10% headroom]
Step 3: SUM2 + (SUM2 x 10%) = Total PE benchmark requirement [adds 10% growth potenal].
The Peak EPS is arrived at once these computaons are complete. Consult SMEs and the system engineers provided by the vendor in order to establish a realisc Peak EPS that the SIEM system must be able to handle.
Use this list along with peers' experience and other references as resources to set benchmarks for the infrastructure. Sample templates are provided below.

Qty

Type

Description

Avg EPS

Total Average Peak EPS Peak EPS

750

Employees/Endpoints (Windows XP)

Included Included Included

Desktops & Laptops at 5 locations at domain at domain at domain

severs

servers

servers

7 Cisco Catalyst Switches One at each loaction, one in DMZ

5.09

and one in the Trusted network

51.88

26.35

7 Cisco Gateway/Routers One at each location

0.6

380.5

154.2

5 Windows 2003 Domain One at each location Servers

40

404.38

121.75

3 Windows 2003 Application Severs

In high availability duster at Data Center

1.38

460.14

230.07

3 MS SQL Database Servers Running on Windows 2003 Server

High availability cluster at Data Center

1.83

654.9

327.45

6 Microsoft Exchange Servers

One at each location with two (duster) at the Data Center

3.24

1121.5

448.6

3 MS IIS Web Servers on Windows 2003

High availability cluster at Data Center

1.17

2235.1 1117.55

Handbook on Information Security Operations Center

45

Annexes

Qty

Type

Description

Avg EPS

Total Peak EPS

Average Peak EPS

2 Windows DNS Servers At Data Center - failover

0.72

110.8

110.8

2 Linux Legacy Application At Data Center Servers

0.12

43.6

21.8

1 Linux MySQL Database One in trusted network for legacy

0.12

21.8

21.8

Server

application

7 NitroGuard IPS

One at each location, one in DMZ and one in the trusted network

40.53

5627.82 1607.95

1 Netscreen Firewall

Netscreen facing th Internet

0.58

2414

2414

3 Cisco Pix Firewalls

Between the Data Center and the

39

other four sites, in front of trusted

network between trusted and the

DMZ

1734

1178

1 Cisco VPN Concentrator Located at Data Center facing the 0.83 Internet

69.45

69.45

1 Squid Proxy

Located at Data Center

14.58

269.03

269.03

Totals 149.79 15598.9 8118.8

Feature
System Logs Collected
Network Devices § Fire Walls § VPNs/SSL § IAM.Switches § Routers § Web Process
EndPoints § Servers § O/S's § Security § Mac § MCs
Commercial Apps § HR/Workflow § Business Critical § Contain P1 Data

Benchmark

Settings

Explanation

Avg.

Peak

Avg. Peak

Relevant and Critical logs are Collected. Should be able to handle peak threshold.

Source destination, calls connections, access, traffic and other security-related log data can be collected and normalized at specified rate..

Collection from endpoint security-related data at specified EPS.

Security- related data from commercial applications is collected as needed.

46

Handbook on Information Security Operations Center

Annexes

Feature

Benchmark

Settings

Explanation

Avg.

Peak

Avg. Peak

Custom Apps § Legacy apps § Mainframe § Midrange

Security-related data from custom/legacy applications and systems are collected as needed.

Databases

Access logs and other

§ Third Party DB

security-related data from

§ Monitoring tools

databases collected.

§ Database Session logs

Backup Systems

Backup Systems log data is collected.

Virtual System Logs (applies to any of the Above systems that are virtualized)

Virtual Machines(VMs) and VM managers are held to the same performance and monitoring standards as physical devices.

2.3 Threat Informaon Sharing
A number of standards of schemas are being developed for disseminang threat intelligence informaon, including the following:
S Structured Threat Informaon eXpression (STIX): An express language designed for sharing of cybera ack informaon. STIX details can contain data such as the IP address of commandand-control servers (CnC), malware hashes, and so on. Learn more at h p://sx.mitre.org/
S Open Indicators Of Compromise (OpenIOC): Open framework for sharing threat intelligence in a machine-digesble format. Learn more at h p://www.openioc.org/
S Cyber Observable eXpression (CybOX): A free standardized schema for specificaon, capture, characterizaon, and communicaon of events of stateful properes that are observable in the operaonal domain. Learn more at h ps:// cybox.mitre.org/
Transport mechanisms, such as Trusted Automated eXchange of Indicator Informaon (TAXII), are used

to exchange cyberthreat informaon represented by the previously discussed schemas.

2.4 ISOC Budget

People Cost

The following table shows a sample cost for ISOC personnel. The annual salary and benefits may vary from state to state (or countries). The number of people are esmated for running a 24×7 ISOC with three analysts in first shi and two analysts in second and third shis.

Annual Personnel Cost Esmates Template

Job
Tier 1 Analysts Tier 2 Analysts

Quan ty

Unit Annual
Cost

Total Annual
Cost

Tier 3 Analysts/ Threat Hunters
Forensic Specialist
Malware Engineer
(Esmate for a 24x7 ISOC will depend upon number of shis and actual number of analysts required for an organisaon)

Handbook on Information Security Operations Center

47

Annexes

Unit Total

Job

Quanty Annual Annual

Cost Cost

ISOC Manager
Total Annual Cost
(Esmate for a 24x7 ISOC will depend upon number of shis and actual number of analysts required for an organisaon)
Capital Cost for Technology

The following table shows esmated cost of technology. This may vary depending upon size of organisaon but this template tried to cover major expenses. As an example, the cost of SIEM may be much smaller or quite large depending upon geographical locaons, amount of data collected, applicaons, and so on. This is to give a starng point.

Capital Cost Template

Descrip on

Quanty Unit Cost Total Cost

SIEM Soluon NBAD PIM DAM Server Hardware Laptops Forensic Soware Secure Cabinets/Locks Log Storage and backup Office, Furniture, etc. Miscellaneous Professional Consulng/design/ setup Total Annual Cost
(The list is indicave. Other S/W and H/W costs to be added as per requirement)

Other Annual Recurring Costs
Example of other recurring costs are given in the table below. First two rows are le empty. A simple rule is to take 20% of capital expenses as annual depreciaon and maintenance cost. Accounts personnel may have to be consulted for a be er esmate.
Annual Recurring Cost Esmates

Descrip on

Quanty Unit Cost Total Cost

Depreciaon of office equipments
Soware/Hardware Maintenance
Staff Training , Skills update
Incident Response Exercises
Threat Intelligence Feeds
Vulnerability Scanning (Network)
Vulnerability Scanning (Applicaons)
Total Annual Cost
(The list is only indicave. Other similar costs to be added as per the setup)
References
S Benchmarking Security Informaon Event Management (SIEM) by J. Michael Butler h ps://www.sans.org/reading-room/ whitepapers/analyst/benchmarking-securityinformaon-event-management-siem-34755
S Building a Successful Security Operaons Center Part 3: SOC Budget Calculator by Rafeeq Rehman h p://rafeeqrehman.com/2017/02/05/soc_bu dget_calculator/

48

Handbook on Information Security Operations Center

Annexes

Annex 3

3 - A : Log Collecon Format

S. No.

Opera ng System/
IOS

Version

Applicaon (AV, ADS/LDAP, DHCP,
Mail, Custom applicaons, etc.)

IP

No. of

Log

Hostname

Collecon Owner Locaon Remarks

Address devices

Method

3 - B: Indicave List of Assets
S. No. Asset 1 Unix Servers (Linux, AIX, HP-UX, etc.) 2 Windows General Purpose Servers 3 Windows Acve Directory Servers 4 Windows IIS and Exchange Servers 5 Proxy Servers 6 DNS and DHCP Servers 7 AS 400/iSeries 8 Mainframe/LPARs 9 Routers and Switches 10 Firewalls ­ Internal 11 Firewalls ­ External 12 VPN devices 13 Network IDS/IPS 14 Host IDS/IPS 15 Database Acvity Monitoring Systems 16 Anvirus Servers 17 Endpoint DLP 18 Network DLP 19 Database Servers 20 Applicaons 21 Tickeng Systems (for example BMC Remedy)

Quanty Vendor/Brand and Version

Handbook on Information Security Operations Center

49

Annexes

S. No. Asset 22 Custom Applicaons/Addional Log Sources (insert rows below and describe) 23 <insert rows here> 24 <insert rows here> 25 Total Event/Log Sources 26 Do you want to capture ne lows? If so, please answer a and b below. 27 a. How many total end user workstaons/laptops are on the network? 28 b. How many total servers are on the network? 29 Total Flow Sources

Quanty Vendor/Brand and Version

3 - C: Indicave list of Dashboards

Dashboard Type

Dashboard Name

Value to Graph

Chart Type

Display Top

Capture Time Series Data

Time Range

Default - IDS/IPS-All:Top Alarm Signatures (Event Count)

Pie

Event Count (Sum) Chart

10

Yes 24 hours

Top Systems A acked (IDS/IDP/IPS) Event Count (Sum) Table 10 (Event Count)

yes 24 hours

Threat & Most Recent Offenses Security
Monitoring Most Severe Offenses

Default Default

Default Default No 1 minute Default Default No 1 minute

Top Category Types

Default

Default Default No 1 minute

Top Sources

Default

Default Default No 1 minute

Top Local Desnaon

Default

Default Default No 1 minute

Firewall Deny by DST IP (Event Count) Event Count (Sum) Bar

5

Chart

Yes 24 hours

Firewall Deny by DST Port (Event Count) Event Count (Sum) Table

5

Yes 24 hours

Network Top Talkers (Total Bytes) Overview

Total Bytes (Sum) Bar

5

Chart

Yes 24 hours

Top Log Sources (Event Count)

Event Count (Sum) Table

5

Yes 24 hours

Firewall Deny by Source IP (Event Event Count (Sum) Bar

5

Count)

Chart

Yes 24 hours

50

Handbook on Information Security Operations Center

Annexes

Dashboard Type

Dashboard Name

Value to Graph

Chart Type

Display Top

Capture Time Series Data

Time Range

Outbound Traffic by Country/Region Total Bytes (Sum) Bar

10

(Total Bytes)

Chart

Yes 24 hours

Applicaon Top Applicaons Outbound to the Total Bytes (Sum) Bar

10

Overview Internet (Total Bytes)

Chart

Yes 24 hours

Total Applicaons (Total Bytes)

Total Bytes (Sum) Bar

10

Chart

Yes 24 hours

Security News

Default

Default 5

No 1 minute

Security Advisories Vulnerability Managemen Internet Threat Informaon Center

Default Default

Default 5

No 1 minute

Default Default No 1 minute

t and Intelligence Scans In Progress

Default

Default 5

No 1 minute

New Vulnerabilies in the last 7

Vulnerability Count Bar

10

No 1 minute

days

/ Network

Chart

3 - D: Sample A ack Scenarios
Brute force a ack to an administrave interface (SSH, applicaon interface)
This scenario is straight forward. Mulple connecon a empts either to an exposed SSH server or to an exposed web administraon page. The a ack scenario includes two variants, one ­ resulng in a successful connecon aer some requests and another with no success.
Vulnerability Exploitaon of Crical Server
S Authencaon bypass of an SQL server: A empt to bypass the authencaon procedure of an SQL server by exploing known vulnerabilies
S Abuse of misconfigured DNS server (open relay): Exploitaon of a DNS server which permits openly (from any host, not restricted to its own network) recursive queries in order to conduct a reflected a ack
S Abuse of misconfigured SMTP server: Exploitaon of an SMTP server which permits

everyone (from any host, not restricted to its own network) to send e-mails to any desnaon in order to contribute to spam campaign
S Applicaon level a ack to web server (SQL injecon): Exploitaon of an applicaon level vulnerability on a web page allowing the a acker to dump the database.
Virus/Trojan Infecon in the Internal Network
Malware infecon through e-mail a achment, spreading itself throughout the internal network.
Covert Channels of Communicaon
This kind of a ack involves the use of a side channel in order to circumvent monitoring and bypass control. As an example, an a ack including a DNS server abuse from an internal user in order to establish a DNS tunnel and circumvent data traffic policies regarding data ex-filtraon was used.
Detecon of Advanced Persistent Threat
Advanced persistent threat (APT) includes a variety of a acks and techniques sharing a common factor, the

Handbook on Information Security Operations Center

51

Annexes

advanced level of sophiscaon and complexity of the a ack in order to avoid detecon and treatment. As an example of such a ack, we used the infecon and compromise of the crical infrastructure (Web Server) without idenficaon of the entry point/procedure (in our case, phising e-mail leading to trapped web page distribung malware).
3 - E: Use Case Development
Use Case Development
Look at cybersecurity incidents that the organisaon has experienced over the past few years. Look for common occurring scenarios in those incidents.
Look at the recent audit findings. See if the findings can be addressed by being able to detect and respond to parcular threats to parcular assets more effecvely.
Look at the SIEM selected by the organisaon. See whether there are any use-cases that can be relavely deployed using easy to integrate event and data sources with the off-the-shelf correlaon rules within SIEM.
Here is an example of a simple use case. (Source: CISCO SOC Book)
Background
As a result of recent audit, all administrave access to crical systems has been given through PIM (Privileged Identy Module) servers. Admins need to log in to PIM, before proceeding for accessing any crical server. The advantage of this kind of system is that all admin acvies can get recorded. However, organisaon suspected that some direct admin access connued to happen avoiding the PIM. Management requested a use case that could be used to flag potenal policy violaons for further invesgaon.
Document the Use Case
Use Case ID: Crical Systems ­ Admin Access 1
Scope: Crical Systems
Use Case Category and subcategory: Policy Violaons ­ Inappropriate administrave Access.

Use Case Objecve: Aimed at generang an alert the moment it is noced that a crical server is accessed without going through PIM.
Use Case Logical Flow: When an administrave access to a crical system happened, check whether that access was granted from PIM. If not, generate an alert.
Correlaon Rules and Data Analysis: Capture the current set of crical systems through the asset management feed. Correlate administrave access success events on all crical systems with administrave access success on PIM. Where an administrave access on crical systems is successful without a matching event on PIM; (or) where IP address of host logging into crical system is not PIM, generate a high priority alert to the main channel.
Data Collecon Points:
S CMDB ­ Configuraon Management Database for asset cricality
S Event log and Syslog associated with all crical systems
S Event logs and Syslog associated with PIM.
Damage Potenal: High, due to risk associated with inappropriate administrave access.
Implementaon and Ongoing Operaonal Effort: Simple, no addional advanced parser or customizaon required.
Views and Visualisaons: Alerted as high priority with in main channel and compliance channel. Relevant alerts to be reported via ad hoc and regular compliance reporng.
Compliance Mapping: Administrave Access Policy
Standard Responses and Escalaons: Alerts need to be invesgated by analysts, see whether the alert is false posive, if false posive, report it as false and close. Otherwise, if this appears to be inappropriate behaviour by an authorised admin, alert admin's direct supervisor or manager.

52

Handbook on Information Security Operations Center

Glossary

Glossary
1 AIX 2 APT 3 BCP 4 BOT 5 CISO 6 CMDB 7 CMMI 8 CnC 9 CSOC 10 CTI 11 CybOX 12 DAM 13 DB 14 DBA 15 DBMS 16 DC 17 DCL 18 DDL 19 DDOS 20 DHCP 21 DLP 22 DML 23 DMZ 24 DNS 25 DOS 26 DPI 27 DR

An Unix Flavour Operang System sold by IBM Advanced Persistent Threats Business Connuity Planning Build Operate and Transfer Model Chief Informaon Security Officer Configuraon Management Database Capability Maturity Model® Integraon Command-and-Control Cyber Security Operaons Center Cyber Threat Intelligence Cyber Observable Expression Database Acvity Monitoring Database Database Administrator Database Management Systems Data Center Data Control Language Data Definion Language Distributed Denial of Service Dynamic Host Configuraon Protocol Data Leakage Prevenon Data Manipulaon Language Demilitarized Zone Domain Name System Denial of Service Deep Packet Inspecon Disaster Recovery

Handbook on Information Security Operations Center

53

28 DRP 29 DSS 30 DST 31 DTLS 32 EPS 33 ERP 34 FPS 35 HP-UX 36 ICT 37 IDAM 38 IDS 39 IP 40 IPS 41 ISOC 42 ISO 43 ISP 44 ISVM 45 ITAM 46 ITIL 47 ITSM 48 JDBC 49 KPI 50 LDAP 51 MDM 52 MPLS 53 NAC 54 NAS 55 NAV

Disaster Recovery Plan Data Security Standard Desnaon Datagram Transport Layer Security Events per Seconds Enterprise Resource Planning Flows per Second An Unix Flavour Operang System sold by HP Informaon and Communicaon Technology Identy Access Management Intrusion Detecon System Internet Protocol Intrusion Prevenon System Informaon Security Operaons Center Internaonal Organisaon for Standardisaon Internet Service Providers Informaon Security Vulnerability Management Informaon Technology Asset Management Informaon Technology Infrastructure Library IT Service Management Java Database Connector Key Performance Indicator Lightweight Directory Access Protocol Mobile Device Management Mulprotocol Label Switching Network Access Control Network A ached Storage Network Analysis and Visibility

Glossary

54

Handbook on Information Security Operations Center

Glossary

56 NBAD Network Behaviour Anomaly Detecon

57 NDA

Non-Disclosure Agreements

58 NEx 59 NICs

Normal Events per Second Network Interface Cards

60 NMAP Network Map

61 NOC

Network Operaons Center

62 NTP

Network Time Protocol

63 OEM Original Equipment Manufacturer

64 OpenIOC Open Indicators of Compromise

65 OS

Operang System

66 OTP

One-Time Password

67 OWASP Open Web Applicaon Security Project

68 PCI

Payment Card Industry

69 PE

Peak Events

70 PIA

Privacy Impact Assessment

71 PIM

Privilege Identy Management

72 PKI

Public Key Infrastructure

73 RFP

Request For Proposal

74 ROI

Return On Investment

75 SACM Service Asset Configuraon and Management

76 SAN

Storage Area Network

77 SDN

Soware Defined Network

78 SEN

Security Event Noficaons

79 SIEM Security Incident and Event Management

80 SLA

Service Level Agreement

81 SMTP Simple Mail Transfer Protocol

82 SNMP Simple Network Management Protocol

Handbook on Information Security Operations Center

55

83 SOP 84 SQL 85 SSO 86 STIX 87 TAXII 88 TCL 89 TCO 90 TCP 91 TLS 92 TOR 93 UAT 94 UDP 95 VAPT 96 VPM 97 VPN 98 WAF 99 WAN

Standard Operang Procedures Structured Query Language Single Sign-on Structured Threat Informaon Expression Trusted Automated Exchange of Indicator Informaon Transacon Control Language Total Cost of Ownership Transmission Control Protocol Transport Layer Security The Onion Router (used for Accessing Internet anonymously) User Acceptance Test User Datagram Protocol Vulnerability Assessment Penetraon Tesng Vulnerability and Patch Management Virtual Private Network Web Applicaon Firewall Wide-Area Network

Glossary

56

Handbook on Information Security Operations Center

CONTRIBUTORS
Mentor
DR. A.S. RAMASASTRI, Director, IDRBT
Members
Shri Y. V. Ramana Murthy, CISO, State Bank of India Shri Sachin Y Shende, General Manager ,RBI Mrs. B. Aparna, Manager (Systems), State Bank of India Shri. Nabojyoti Sarkar, Manager, ICICI Bank Shri Murtaza Bhatia, Practice Head (Data Centre & Security), Dimension Data Shri B. Kuldeep, Manager, Deloitte Shri P. Parthasarathi, Chief Technology Officer, IDRBT Shri. G. Raghuraj, General Manager, IDRBT Dr. V. Radha, Assistant Professor, IDRBT Dr. Rajarshi Pal, Assistant Professor, IDRBT Shri. V. S. Mahesh, Assistant General Manager, IDRBT

Institute for Development and Research in Banking Technology
Established by Reserve Bank of India
Castle Hills, Road No., Masab Tank, Hyderabad - . EPABX: +   , Fax: +   
Web: www.idrbt.ac.in, e-mail: publisher idrbt.ac.in

