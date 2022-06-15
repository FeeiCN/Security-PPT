#RSAC
SESSION ID: ZT-R02
"Connecting the Dots" of NIST 800-207, TIC 3.0, and More Using SAFE
Chad Mitchell ­ CCIE #44090
US Public Sector Security Architect Cisco

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC

20.4M
Less miles on their trucks

350,000
More packages

20,000
Metric tons less in CO2
emissions

3

#RSAC
Unrealized Potential, Efficiency, & Security
Nothing about how UPS trucks or package load changed Change of process rather than technology or tool Increased Safety - 61% of crashes that occur while turning or crossing traffic involve left turns (3.1% right turns)
4

#RSAC
Session Agenda
The Need for the SAFE Reference Architecture
What is the SAFE Reference Architecture?
How do we use the SAFE Reference Architecture? TIC 3.0, NIST 800-207, & CISA
How can I APPLY the SAFE Reference Architecture in my environment?
5

#RSAC
The Need for the SAFE Reference Architecture
6

#RSAC
The 80's Branch Networks
Banks
7

#RSAC
Early 90's Branch Networks

Data Center

Banks

8

#RSAC
Early 2000's Networks

Data Center

Internet

Banks

Service Providers

9

#RSAC
Today's Networks

Data Center

Internet

Banks

Cloud
Service Providers

10

Data Center

Internet

Banks

Cloud
Service Providers

#RSAC

11

#RSAC
How did we get there?
SEKURITY
No organization is exactly alike.
­ Operational Differences ­ Risk Profiles ­ Risk Tolerance ­ Governance / Executive Orders
Hyper-focused on Prevention and not Reaction
12

#RSAC
Vendors sell solutions for a threat.. Not ALL of them
13

Too many tools!
Security Tools per Organization

#RSAC
Security Effectiveness Gap

10+
Small

50+
Medium

130+
Large

=

14

#RSAC
Silos of Excellence
The tools work well on their own but......
Narrow view of what's happening Input from other solutions is available but not commonly in same language or capability Duplicate efforts on same information Increase deployment and operational complexity
15

#RSAC
Mission: Integrated Architecture
ELIMINATE COMPLEXITY BY USING A MODEL AND METHOD BASED ON SECURITY BEST PRACTICE AND YOUR ENVIRONMENT
16

#RSAC
So... How do we get there?
Let's take a high-level look at the SAFE Reference Architecture to get started
17

#RSAC
Proven Security with SAFE
A Security-Centric methodology and model for an effective Security Architecture
Focuses on Risks and Threats by identifying required Capabilities
Architectural guidance using Capabilities
Solution guidance & best practice deployments tested in Validated Designs

#RSAC
The Key to SAFE
Domains
Places in the Network (PINs)

#RSAC
The 3 Phases of SAFE Reference Architecture

1

Capabilities for Threats

2

Architectures for Business

3

Designs for Security

20

#RSAC
1
The business flows define the attack surface.
& Capabilities secure the attack surface.

#RSAC
Capability
Function rather than Product
22

#RSAC
I need a firewall Capability to Segment my network
23

#RSAC
Capabilities : The Security Alphabet

Firewall

Flow Analytics

Identity

Intrusion Prevention

DNS Security

Analysis/ Correlation

Anomaly Detection

Anti-Malware

Anti-Virus

Application Visibility Control (AVC)

CASB

Client-Based Security

Cloud Security

Disk Encryption

Distributed Denial of Service Protection

Vulnerability Management

Email Security

Web Security

Web Application Web Reputation/ Wireless Intrusion

Firewall

Filtering/DCS Prevention (WIPS)

Logging/ Reporting

Malware Sandbox

Mobile Device Management

Monitoring

Network Anti-Malware

Name Resolution

Policy/ Configuration

Posture Assessment

Server-Based Security

Tagging

Threat Intelligence

Time Synchronization

TLS Offload

Virtual Private Network (VPN)

24

#RSAC
Understanding Business Flows
25

HUMAN

DEVICE

NETWORK

APPLICATION

#RSAC

26

#RSAC
Clerk Processing Credit Card
Business Flow for Payment Applications
27

#RSAC
Secure the flow using Capabilities

Clerk

Device Identity

Server

Payment Application

28

#RSAC
Secure the flow using Capabilities

Clerk

Device

Identity Client Posture Based Assessment Security

Server

Payment Application

29

#RSAC
Secure the flow using Capabilities

Clerk

Device

Identity Client Posture Firewall Intrusion Flow Threat

Based Assessment

Prevention Analytics Intelligence

Security

Server

Payment Application

30

#RSAC
Secure the flow using Capabilities

Clerk

Device

Identity Client Posture Firewall Intrusion Flow Threat Application Server

Based Assessment

Prevention Analytics Intelligence Visibility Based

Security

Control Security

Server

Payment Application

31

Example Business Flows
Secure web access for employees: Employee researching product information

Employee

ClientBased Security

Identity

Posture Assessment

Firewall

Intrusion Prevention

Flow Analytics

Threat Intelligence

AntiMalware

Tagging

Application Visibility Control

Web Security

Secure applications for PCI: Customer making purchase

#RSAC
\
Website

Customer

Identity

Firewall

Intrusion Flow Threat Prevention Analytics Intelligence

AntiMalware

Tagging

Distributed Application Web ServerDenial Visibility Application Based
of Service Control Firewall Security Protection

E-commerce
32

#RSAC

2

Architectures for Business

3

Designs for Security

For more information on the next phases from what we have covered go here:
https://www.cisco.com/c/dam/en/us/solutions/collateral/enterprise/design-zone-security/safe-overview-guide.pdf
33

#RSAC
SAFE Capabilities Flow for Trusted Internet Connections 3.0 (TIC 3.0)
34

#RSAC
What is TIC 3.0?
Modern .gov IT environments and security requirements vary based on each agency's mission, needs, and resources. TIC 3.0 guidance adopts a broader and less prescriptive tone compared to earlier iterations to accommodate this wide variety of environments.
https://www.cisa.gov/tic-faq

#RSAC
"Agencies need to understand the flows that come out from the systems, where they are going and different users who will be using it, not just federal employees, but the public, system to system and hybrid or multi cloud"
Sean Connelly ­ DHS
Source: https://federalnewsnetwork-com.cdn.ampproject.org/c/s/federalnewsnetwork.com/ask-the-cio/2020/04/path-for-agencies-to-more-easily-use-cloud-services-paved-by-tic-pilots/amp/

#RSAC
CISA ­ Policy Enforcement Points w/ Segmentation and Trust Zones

Reference: CISA ­ TIC Core Guidance Volume 2: Reference Architecture https://www.cisa.gov/sites/default/files/publications/CISA_TIC%203.0%20Vol.%202%20Reference%20Architecture.pdf

37

#RSAC
TIC 3.0 Universal Capabilities
18 Universal Capabilities that are broadly applicable
­ (should exist in all deployed solutions)

Secure Administration

Auditing & Accounting

Least Privilege

Configuration Management

Effective Use of Shared Services

Reference: https://www.cisa.gov/sites/default/files/publications/CISA_TIC%203.0%20Vol.%203%20Security%20Capabilities%20Catalog.pdf

38

#RSAC
TIC 3.0 Traditional TIC Capabilities
Establishes 5 TIC Capability Groups with capabilities per group

AntiMalware
+ 2 more
Files

Data Loss Break & Domain Prevention Inspect Category
Filtering
+ 9 more
Web

DNSSEC
+ 1 more DNS

Adaptive Intrusion Access Prevention Control
+ 1 more
Intrusion Detection

SOAR
+ 1 more Enterprise

Reference: CISA ­ TIC 3.0 Traditional TIC Use Case

39

https://www.cisa.gov/sites/default/files/publications/Draft%20TIC%203.0%20Traditional%20TIC%20Use%20Case.pdf

#RSAC
TIC 3.0 Branch Capabilities
The Branch Use Case adds an additional group of Network It also removes some traditional TIC capabilities from other groups

Network

IP

Access Control Blacklisting

Network

Reference: CISA ­ TIC 3.0 Branch Office Use Case

https://www.cisa.gov/sites/default/files/publications/Draft%20TIC%203.0%20Branch%20Office%20Use%20Case.pdf

40

#RSAC
Example Product to Capabilities Mapping
Next Generation Firewall

Intrusion Prevention

Shadow IT

Malicious

DoH

Detection Content Filtering Filtering

DNS Blackhole

Domain Category Filtering

Domain Reputation
Filter

VPN

Content

Active Content IP Blacklisting Break &

Certificate

Filtering

Mitigation

Inspect

Blacklisting

41

Example 1 ­ Traditional TIC (non-DIA)
Agency to TIC to Internet

Endpoint

WAN

Employee
MultiFactor Auth

AntiMalware

Endpoint Content Disarm

Detection &

&

Response Reconstruction

Endpoint Detection Response

Deception Platforms

Adaptive Access Control
Network Admission
Control

#RSAC

Domain Category Filtering

DNS Blackhole

Domain Reputation
Filter

NGFW ­ DNS Policy

DNSSEC

Detonation Chamber
Sandbox

IP Blacklisting Certificate Blacklisting

Malicious Content Filtering

Shadow IT DoH Filtering Intrusion

Detection

Prevention

NGFW ­ AVC | AMP | TLS | IDS/IPS

Traditional TIC

Authenticated Break &

Proxy

Inspect

Content Data Loss Active Content Shadow IT Filtering Prevention Mitigation Detection

Web Proxy or NGFW

Bandwidth Control
Router

Netflow Analytics
Flow Collector

SOAR
Orchestrator

Internet

Data Loss Prevention

Cloud Access Security Broker

42

#RSAC
Example 2 ­ Branch with DIA to External App
Branch Office to Sanctioned CSP Overlay Services

Employee
MultiFactor Auth
Untrusted Application

AntiMalware

Endpoint Content Disarm

Detection &

&

Response Reconstruction

EDR/AV/AM/AS

Deception Platforms

Adaptive Access Control
NAC

Bandwidth Control
Router

Branch/HQ

Traditional TIC

SD-WAN
WAN

Internet
Trusted Application

DNS Blackhole

Domain Reputation /
Category Filter

Shadow IT Detection

DoH Filtering

DNSSEC

Secure DNS

SOAR
SOAR

Netflow Analytics
Flow Collector

IP Blacklisting Break & Active Content Content Certificate Inspect Mitigation Filtering Blacklisting
NGFW

Malicious Content Filtering

Intrusion Prevention

Secure Internet Gateway

Data Loss Prevention

Detonation IP Blacklisting Active Content Break &

Chamber

Mitigation Inspect

Content Filtering

Secure Internet Gateway / SASE

Malicious Content Filtering

Intrusion Certificate Prevention Controls

Broadband
43

#RSAC
Applying SAFE Methodology to NIST 800-207 ­ Zero Trust & CISA Zero Trust Maturity Model
44

NIST 800-207 Basics ­ Logical Components

ZERO TRUST ARCHITECTURE

CONTROL PLANE
Policy Decision Point (PDP)

Policy Engine

Policy Administration

Policy Enforcement Points (PEP)
Endpoint Security

WORKFORCE

DATA PLANE

UNTRUSTED

WORKPLACE
No Implicit Trust Secure Communications Across Any Infrastructure

Authorized Subject

Authorized System

Unauthorized Subject

Unauthorized System

WAN

X

Internet

VPN Access

HQ Office Branch Office

Home Office DC / CoLo
Public Access

Identity Services (MFA)

TRUSTED

Cloud Security (SASE)

WORKLOADS

WEB

WWW

SaaS

IaaS

BLOCKED

NGFW Services

Global Infrastructure

Secure SD Access / WAN

Apps

Files

Data

RESOURCES

Data Access Policy

Public Key Infra

ID Management

SIEM System

CDM System

Industry Compliance Threat Intelligence

Activity Logs

ADDITIONAL POLICY ENGINE INPUTS

#RSAC
45

#RSAC
NIST 800-207 ­ Key Understanding
ENFORCEMENT IS NOT REQUIRED TO EXIST ALL IN ONE PLACE! ENFORCEMENT CAN BE DONE ANYWHERE BETWEEN THE SUBJECT AND THE RESOURCE

Authorized Subject

UNTRUSTED

X

PEP

Policy Enforcement Points

Policy Decision Points

PDP

TRUSTED

RESOURCES

Apps

System

Data

46

Security Solution Domain Alignment

ZERO TRUST
5 Pillars of Zero Trust
IDENTITY | DEVICES | NETWORK | APPLICATIONS | DATA

USER & ENDPOINT PROTECTION

APPLICATION SECURITY

NETWORK SECURITY

CLOUD EDGE

SECURITY OPERATIONS

#RSAC

#RSAC
Security Capability Alignment

USER & ENDPOINT PROTECTION
MULTI-FACTOR AUTHENTICATION
ENDPOINT DETECTION &
RESPONSE
VULNERABILITY MANAGEMENT
MOBILE DEVICE MANAGEMENT

ZERO TRUST

NETWORK SECURITY
NETWORK ACCESS CONTROL
NEXT-GEN FIREWALL / IPS
SD-WAN / SASE
SEGMENTATION
EXTENDED DETECTION AND RESPONSE

CLOUD EDGE
SECURE INTERNET GATEWAY / SASE
CLOUD APPLICATION SECURITY BROKER (CASB)
CLOUD DETECTION & RESPONSE
NEXT-GEN FIREWALL / IPS
GLOBAL THREAT INTELLIGENCE

APPLICATION SECURITY
APPLICATION & API SECURITY
WORKLOAD PROTECTION / MICRO-
SEGMENTATION
CLOUD MALWARE DETECTION
DATA LOST PREVENTION (DLP)
48

#RSAC
Building the flow based on 800-207 & CISA

ZERO TRUST ARCHITECTURE

Authorized Subject

Authorized System

USER & ENDPOINT PROTECTION

NETWORK SECURITY

CLOUD EDGE

IDENTITY DEVICES

NETWORK

APPLICATION SECURITY

APPS

DATA

WEB

WWW

SaaS

IaaS

Global Infrastructure

Unauthorized Subject Unauthorized System
SUBJECTS

EXTENDED DETECTION AND RESPONSE
VISIBILITY AND ANALYTICS

SECURITY OPERATIONS AUTOMATION AND ORCHESTRATION

GLOBAL THREAT INTELLIGENCE
GOVERNANCE

Apps Files Data
RESOURCES

49

#RSAC
Solution Alignment

Authorized Subject

Authorized System

Unauthorized Subject

Unauthorized System

SUBJECTS

IDENTITY

ZERO TRUST ARCHITECTURE

DEVICES

NETWORK

APPLICATIONS

DATA

USER & ENDPOINT PROTECTION

Secure MFA

Mobile Device

IDENTITY

DPEoVsItCurEeS

NETWORK SECURITY

Secure Client

Secure Web Appliance

NETWORK

CLOUD EDGE

SASE

Cloud Access

Security

Security

Broker

APPLICATION SECURITY

Secure

APAPpLApICcliccAeaTstsiIoOnNS

DATA

ZERO TRUST WORKFORCE

Network Admission Control

Endpoint Posture

Email Security

Secure Endpoint

ZERO TRUST WORKPLACE

Secure Firewall / IPS

Secure NETFLOW Analytics

SD-ACCESS Switching

SASE SECURE REMOTE ACCESS

Secure Cloud Analytics
SD-WAN Routing

SASE SECURE EDGE Secure
Firewall / IPS (virtual)

ZERO TRUST WORKLOADS Secure Workload
Secure Data Controls
Secure Malware Analytics

EXTENDED DETECTION AND RESPONSE
VISIBILITY AND ANALYTICS

SECURITY OPERATIONS
AUTOMATION AND ORCHESTRATION

GLOBAL THREAT INTELLIGENCE
GOVERNANCE

WEB

WWW

SaaS

IaaS

Global Infrastructure

Apps

Files

Data

RESOURCES

50

#RSAC
Solution Alignment

Authorized Subject

Authorized System

Unauthorized Subject

Unauthorized System

SUBJECTS

PEP
IDENTITY

ZERO TRUST ARCHITECTURE

PEP
DEVICES

PEP
NETWORK

PEP
APPLICATIONS

PEP
DATA

USER & ENDPOINT PROTECTION

Secure MFA

Mobile Device

IDENTITY

DPEoVsItCurEeS

SecuNreETCWlieOntRK SECUSRAecpIuTprYleiaWnceeb

NETWORK

SASE Security

CLOUD EDGE Cloud Access Security Broker

APPLICATION SECURITY

Secure

APAPpLApICcliccAeaTstsiIoOnNS

DATA

ZERO TRUST WORKFORCE

Network Admission Control

Endpoint Posture

Email Security

Secure Endpoint

ZERO TRUST WORKPLACE

Secure

Secure NETFLOW

Firewall / IPS

Analytics

SD-ACCESS Switching

SASE SECURE REMOTE ACCESS

Secure Cloud Analytics

SASSEeScEurCeURE EDGE Firewall / IPS

(virtual)

SD-WAN Routing

ZERO TRUST WORKLOADS Secure Workload
Secure Data Controls
Secure Malware Analytics

EXTENDED DETECTION AND RESPONSE
VISIBILITY AND ANALYTICS PDP

SECURITY OPERATIONS
AUTOMATION AND ORCHESTRATION

GLOBAL THREAT INTELLIGENCE

PDP

GOVERNANCE

AUTHORIZED SUBJECT ACCESSING A SANCTIONED APPLICATION RESOURCE

WEB

WWW

SaaS

IaaS

Global Infrastructure

Apps

Files

Data

RESOURCES

51

#RSAC
CISA Zero Trust Maturity Model

https://www.cisa.gov/sites/default/files/publications/CISA%20Zero%20Trust%20Maturity%20Model_Draft.pdf

52

OPTIMAL

TRADITIONAL ADVANCED

CISA Maturity Model Overlay

IDENTITY Password / 802.1X / MFA Authentication
Limited Risk Assessment
Multifactor Authentication
Identity Federation
Real Time Analysis / ML
Continuous Validation

DEVICES Limited Compliance
Visibility Simple Device Inventory
Enforced Compliance
Access Based on Initial Compliance
Continuous Monitoring &
Validation Real Time Risk
Analytics

ZERO TRUST ARCHITECTURE

NETWORK Large Macro-Segmentation
Minimal Internal & External traffic Encryption

Micro-Segmentation Defined by ingress/egress perimeters
Basic Network Analytics

Full Distributed Micro-Segmentation Defined by ingress/egress perimeters

AI/ML Threat Protection

Full Encryption (all traffic)

#RSAC

APPLICATIONS Access based on Local Authorization
Minimal App Workflow Integration
Access based on Centralized
Authentication
Some App Workflow Integration

DATA Little to No Inventory
Static Control No Encryption
Least Privilege Controls
Encryption at rest In Hybrid Environments

Continuous Authorization
Strong App Workflow Integration

Dynamic Support and Classification
Full Encryption

53

#RSAC
Assessing CISA Maturity based on Flows
IDENTITY

DATA APPLICATION

DEVICE

TRADITIONAL ADVANCED OPTIMAL AGENCY

NETWORK
54

#RSAC
How do I APPLY the SAFE Reference Architecture in my environment?

#RSAC
"APPLY"
IDENTIFY the traffic flows that are critical to your environment and security posture goals Collect inventory of solutions and document your current CURRENTLY AVAILABLE CAPABILITIES Collect and document ALL needed or REQUIRED CAPABILITIES based on the mandate, framework, or regulation you are trying to satisfy ALIGN capabilities where needed in the flows gathered IDENTIFY GAPS between current and required capabilities IMPLEMENT where additional capabilities are needed Leverage Steps 2 & 3 of the SAFE Reference Architecture to document architecture for security
56

