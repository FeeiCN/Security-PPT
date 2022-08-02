SESSION ID: STR-W03
Access Control for Multi-Vendor Big Data and BI Environments
Anmol Singh
Lead Analyst KuppingerCole Analysts AG
#RSAC

#RSAC
Big Data & BI Environments
An Introduction
Big Data  Tons of Structured, Semi-unstructured and Unstructured Data  Comprises of large and complex data sets that can't be processed by
traditional database and software techniques
Business Intelligence  Identify, extract and interpret business data using interactive tools for
effective and accurate decision making  Knowledge derived from discovering patterns and efficient data mining
processes
2

#RSAC
Big Data and Security
The evolving landscape..

More Data

Distributed Processing

Increasing Regulations

Weak Access Control

Data Thefts, Security Breaches Failed Audits
3

#RSAC
BI and Security
The evolving landscape..

Multiple Data Sources

Privacy & Data Residency

Self-service Data Modelling

Dynamic Content and Data Sharing

Data Thefts, Security Breaches Failed Audits
4

Security in Big Data & BI Environments
Key Challenges

#RSAC
Big Data & BI Security Challenges
Security remains an afterthought
Security is not part of Design and Strategy Access is dependent on proprietary methods Existing IAM tools don't support Big Data/ BI operations Access control for unstructured data is not a `thing' No data access governance for Big Data environments Big Data Security Solutions and Skills are a few and rare
6

Security in Big Data & BI Environments
Primary Drivers

Primary Drivers for Big Data & BI Security
Demand a `holistic' security approach

Distributed Processing

Secure Interactions

Guidelines for non-relational
data stores

Data Quality

Endpoint Validation

Input Filtering

Compliance Governance

Real-time Monitoring
Granular Data Access Controls

Privacy Preserving Data Mining
Data Access Governance

8

#RSAC

KuppingerCole`s Defintion of Big Data Security
From the upcoming Leadership/Market Compass

In our research for Big Data Security, we focus on products that follow a holistic approach towards protecting Big Data and BI platforms instead of the disconnected point security solutions. Although many generic security tools like firewalls or antimalware may play an important role in securing parts of Big Data frameworks, we do not cover them as part of Big Data security to avoid the confusion of functionally distinct security products that are generally covered in other KuppingerCole's reports under separate market segments. More precisely, we are not covering security solutions for protecting relational database management systems (RDBMS), since they are being reviewed in a separate Leadership Compass for Database Security.

Vulnerability assessment, detecting misconfigurations across
all infrastructure components

Data encryption both on file systems and across applications, for data at
rest and in transit

Authentication, authorization and access
control

Centralized security & policy management

Audit and compliance

#RSAC

9

Security Threats in Big Data and BI Environments
Generic and Targeted Attack Vectors

Big Data & BI Security Risks & Threats
Multiple generic and targeted attack vectors
Reporting/ BI Interfaces Analytics Platform
Big Data Platform, Data Lakes
Databases

Generic Attack Vectors

Networklevel
Attacks

Server-level Attacks

Data Leakage

Abuse by Privileged
Users

Targeted Attack Vectors

SQL Injection

Illegitimate Illegitimate

Queries

Cubes

Policy violations (PII etc.)

11

#RSAC

Big Data Security: Existing Technologies
Are these sufficient?

#RSAC
Current State of Big Data Security in Organizations
Reflect a state that is deficient in Security

Big Data Components

Closest Security Affiliation

Distributed Access

APIs

Data Extracts

Distributed Processing

Authentication (LDAP, Kerberos)

APIs

Data Extracts

ACLs, Data Virtualization

Data Storage Hardware

Disk/ Data Encryption Firewalls, Network Seg.
13

#RSAC
Missing Security Links
Several links missing to a `Secured Big Data Estate'

Big Data/ BI Components

Distributed Access

APIs

Data Extracts

Contextual Authentication Granular Authorization Dynamic Authorization Service-to-service Authentication

Distributed Processing Data Storage Hardware

API Security Data Filtering/ Data validation Data Virtualization Data Masking

14

#RSAC
IAM for Big Data & BI Environments
Existing IAM tools do not support the complexity

Identity Provisioning Engine
Identity
AD/ LDAP User Groups

Entitlements Repository Database Access Entitlements
Role Data Level Authorizations
BI/ Reporting Interfaces
Policy based Masking

Enterprise Access Governance
Access Request Management Access reviews Auditing

Data Type

Data, Cell Level Authorizations

Attribute 1 Attribute 2 Attribute n

Business Intelligence Platforms

Data Analytics & Virtualization Platforms

Microsoft BI

SAP BW

Oracle Hyperion

IBM Cognos
15

DB Cube Tableau

Tibco

Access Governance in Big Data & BI Environments

#RSAC

The variety of data authorizations create complexity

Access at the Cube Level · Data per source · No further splits

Multi-dimensional access · Several access combinations · Granular role splits · Multiple access restrictions

Access at the Cube splits · One dimensional access · Fewer access combinations

Disjointed Access Patterns · Access across multiple data
sets & providers · Complex role combinations

16

Access Approvals: Granular Permissions

#RSAC

Governing access down to data-level permissions

Data Owners

A A.1

Access Approval

Request Processing
Entitlements Breakdown

B
Access Request

B.3

Access Approval

C C.1 C.2

Access Approval

Access Approval/ Denial

A.1 {C.1}

C.2 B.3

Resulting data-set permissions

17

Access Request Approval Workflow

Security in Big Data & BI Environments
The BIG Question..

Security for Big Data & BI platforms
Is there a ,holistic` security approach?

Databases

Business Systems
External Data Sources

Big Data Platform Data Lakes

Analytics Platform

#RSAC
BI Dashboards Reports
Analytic Interfaces

Database Security

Big Data Security

Analytics Security

End-to-End Security (Inexistent Today)

19

Information Protection

#RSAC
What are some of the tools in use today
Can quickly turn into a `zoo' of technologies!
 Database Security Tools  Data Discovery & Classification (for structured and unstructured data)  Database & Data Encryption  UBA (User Behaviour Analytics) for Data Access  Data Masking & Tokenization  Data Virtualization  IGA (Identity Governance & Administration)  PAM (Privileged Access Management)  Dynamic Authorization Management  DLP (Data Leakage Prevention)  API (Application Programming Interface) Security
20

#RSAC
Limitations of existing security technologies
There's no perfect solution!

Technology
Database Security Data Discovery & Classification (for structured and unstructured data) Database & Data Encryption
UBA (User Behavior Analytics) for Data Access
Data Masking & Tokenization
Data Virtualization
IGA (Identity Governance & Administration)
PAM (Privileged Access Management) Dynamic Authorization Management
DLP (Data Leakage Prevention) API Security

Limitations
Commonly limited to RDBMS, not built for today`s Big Data and BI/analytics
Only identifies the critical data, might require significant manual effort ­ helps to target protection but does not protect by itself
Encryption works at rest (and, in other form such as TLS, in motion), but not or only very limited for data in use, and it creates additional challenges for ,,use of data"
Helps in identifying critical use, but does not limit the access to data or the ability to combine certain sets of data
Potentially good protection also when it comes to exporting and recombining data, but applications might need access to full set of data
An efficient approach from a data protection perspective, but can create massive amounts of transient (insecure) information views , affects performance
Relatively few out-of-the-box connectors for managing users and, in particular, fine-grain access entitlements in these environments. Might require massive customization and suffer from complexity due to complex entitlement structures of multi-level/multi-dimensional data models
Focused on securing administrative access, not the fine-grained access control for business users
Very few out-of-the-box solutions, very limited support for environments, currently only a point solution. Potential performance impact
Focus on files, i.e. the results, not their creation
Limited to APIs access only

21

EFFECTIVENESS

#RSAC
Efficacy of existing technologies to Big Data Security
Few technologies are more effective than others
22

#RSAC
Where do they fit in Big Data & BI?
How to map security technologies to Big Data/ BI Components

Database Security Data Discovery & Classification Database & Data Encryption DLP (Data Leakage Prevention)

User Behaviour Analytics Data Masking & Tokenization Data Virtualization API Security
23

IGA PAM Dynamic Authorization Management

Security in Big Data & BI Environments
Priority Framework

#RSAC
Key Questions on Big Data Security & Governance
How to identify your priorities?
Question

API Security
Data Leakage Prevention Dynamic Authorization Management
Privileged Access Management
Identity Governance & Administration
Data Virtualization
Data Masking & Tokenization
User Behaviour Analytics Database & Data Encryption
Data Discovery & Classification Database Security Tools

Is your data adequately protected during storage and distributed processing?
Is governance and security consistently enforced across the entire Big Data ecosystem, from source to the target?
Is there adequate insight and governance over data combinations?

213 00001 011 213 01222 121 102 03231 220

25

#RSAC
Key Questions on Big Data Security & Governance

How to identify your priorities?

Contd...1

Question

API Security
Data Leakage Prevention Dynamic Authorization Management
Privileged Access Management
Identity Governance & Administration
Data Virtualization
Data Masking & Tokenization
User Behaviour Analytics Database & Data Encryption
Data Discovery & Classification Database Security Tools

Do you know where sensitive data such as

PII and credit card data resides?

132 02100 010

Is there a centralized solution for managing

and protecting that data?

322 01112 121

Is your current approach for data protection

performing well for the BI use cases?

212 13222 121

26

#RSAC
Key Questions on Big Data Security & Governance

How to identify your priorities?

Contd...2

Score 0-3 3-5 >5

Priority Low Medium High

Time for action No urgency 1 to 2 years Next 3-6 months

27

Recommendations
Plan to succeed with Big Data & BI Security

#RSAC
Recommendations
Plan to succeed with Big Data & BI Security
 Implement Data Discovery and Classification
· Establish an enterprise data catalogue and keep it updated · Identify and classify data: Harvest and maintain metadata
 Make Data Sanitization & Encryption a Continuous Process
· Enterprise Information Protection: Classify and encrypt the documents you create
· Network Security: Protect data transfer, Define micro segments of the sensitive areas in your network
· Infrastructure & Server Security: Server Hardening · Encryption: Encrypt data in transit and at rest, Use a KMS (preferably HSM) · Database Design: Design databases with confidentiality in mind (Separate fields
for easy filtering and encryption)
29

Recommendations
Plan to succeed with Big Data & BI Security

#RSAC
Contd..

Implement Access Control and Dynamic Authorization
· Understand data flows and authorization requirements of your Big Data & BI environments
· Implement fine grained access controls: Define authorizations at file, service and data levels to implement an ABAC Model
· Implement policy based dynamic masking and row filtering · Use PAM controls to prevent rouge administrative access to sensitive
data · Use Application to Application Password Management (AAPM) for
A2DB (Application to DB) authentication

30

#RSAC
Recommendations
Plan to succeed with Big Data & BI Security
 Enforce Monitoring Controls: Track user access details for activity reviewing, logging and auditing purposes
 Implement Access Governance: Conduct regular and periodic data access certifications
 Implement API security and input validation: Use API Gateways and device authentication
 Consider a `holistic approach' - traditional security controls only address parts of Big Data Security
 Use the matrix discussed to assess your Big Data security state and prioritize your technology investments
31

Related KuppingerCole Research

#RSAC

Where to find more relevant research on the topic?

 Leadership Compass: Database Security - 70970  Advisory Note: Big Data Security, Governance, Stewardship -
72565  KuppingerCole and BARC Joint Study: Big Data and Information
Security - 74001  Advisory Note: Enterprise Big Data IAM ­ Challenges and
Opportunities - 71207

32

Thank you

