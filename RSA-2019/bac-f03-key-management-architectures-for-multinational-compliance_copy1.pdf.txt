SESSION ID: BAC-F03
Key Management Architectures for Multinational Compliance

Sundaram Lakshmanan
Chief Technology Officer CipherCloud, Inc. https://www.linkedin.com/in/sundaramlakshmanan
1

#RSAC

#RSAC
Agenda
· A perfect storm (Hint: there are several problems here) · Challenges with compliance for multinationals · Challenges with key management in the cloud era · Developing a plan for cloud applications
­ Understanding data and data proliferation in the cloud ­ Understanding the shared responsibility model ­ Key management architectural choices
· What can you do?
2

#RSAC
A perfect storm in the making for multinationals...

Staying compliant
· Regulations at all levels: industry, regional, and global
· Multiple products and solutions required
· Lack of expertise · Varying requirements

Key management
· It's all about the data · Data is in isolated and
fragmented systems · Data proliferation is in
disparate applications · Shortage of talent,
processes, and tools

Global presence
· Moving to the cloud
· Working across international boundaries
· Centralized vs. regional processing
· In-house vs. off-the-shelf (SaaS) applications

#RSAC
Topic will be touching the tip of the iceberg
Not just one, but many

#RSAC
Challenges with compliance for multinationals

Understanding compliance
· Regulations are implemented by governing bodies to protect PII and related sensitive data.
· Data privacy, residency, and ownership is at the heart of all regulations.
· Define controls on data access and usage: Who, what, when, where, why, and how?
· Enterprises are required to own their data and govern its use by having right set of controls in place and having a way to audit.
· Stay notified, and notify all those involved when data breaches occur.

Challenges with data

Data silos

Proliferation

Data

Types and formats

Classification

Discovery

5

#RSAC
Multinational compliance: extensive and diverse

USA Federal
CALEA, CCRA, CIPA, CIOPPA, EFTA, FACTA, ECPA, FCRA, FISMA, FERPA, GLBA, HIPPA, HITECH, PPA, RFPA, Safe Harbor, US PATRIOT Act
Mexico
Personal Data Protection Law
Colombia
Data Privacy Law 1266
Chile
Law for the Protection of Private Life
Canada
ICO Privacy, PIPEDA, FOIPPA, PIPA
US States
Breach Notifications in 48 States
Brazil
Article 5 of Constitution
Argentina
Personal Data Protection Law Information Confidentiality Law

United Kingdom
ICO Privacy & Electronic Communications Regulations
European Union
EU General Data Protection Regulation State Data Protection Laws
Morocco
Data Protection Act
South Africa
Electronics Communications & Transactions Act
Europe
28 Privacy Laws in Countries
Thailand
28 Privacy Laws in Countries
India
Pending laws under discussion
Singapore
Personal & Financial Data Protection Acts

Australia
National Privacy Principles, State Privacy Bill, Email Spam and Privacy Bills
South Korea
Network Utilization & Data Protection Act
Japan
Personal Information protection Act
Taiwan
Computer-Processed Personal Data Protection
Hong Kong
Personal Data Privacy Ordinance
Philippines
Personal Data Privacy Law
New Zealand
Privacy Act

#RSAC

Where cloud data resides and what laws might apply

Europe

USA Federal
CALEA, CCRA, CIPA, COPPA, EFTA, FACTA, ECPA, FCRA, FISMA, FERPA, GLBA, HIPAA, HITECH, PPA, RFPA, Safe Harbor, US PATRIOT Act

Canada PIPEDA, FOIPPA, PIPA

United Kingdom
ICO Privacy and Electronic Communications Regulations

Privacy laws in 28 countries

European Union
EU General Data Protection Regulation (GDPR)

South Korea
Network Utilization and Data Protection Act

Japan
Personal Information Protection Act

Mexico Personal Data Protection Law

US States Breach notification in 48 states

Colombia Data Privacy Law 1266

Brazil Article 5 of Constitution

Chile
Law for the Protection of Private Life

Argentina
Personal Data Protection Law, Information Confidentiality Law

Morocco Data Protection Act

Thailand Official Information Act B.E. 2540
India Pending Laws under discussion

Taiwan Computer-Processed Personal Data Protection
Hong Kong Personal Data Privacy Ordinance

South Africa
Electronic Communications and Transactions Act

Singapore Personal & Financial Data Protection Acts
Australia National Privacy Principals, State Privacy Bills, Email Spam and Privacy Bills

Philippines Propose Data Privacy Law
New Zealand Privacy Act

#RSAC
Challenges with key management in the cloud era
Why does compliance need key management?
Enterprises encrypt data for compliance, and encryption needs key management.

49%
of respondents rate compliance
with regulations as a significant driver for encryption.*

57%
of respondents in FY17 chose key
management pain ratings at or above 7, suggesting a high pain threshold.*

*Source: Ponemon Institute, 2018 Global Encryption Trends Study, out of 5252 respondents
8

Challenges with key management in the cloud era

Influenced by:

Key management pain points*

People

Process
Tools and technology

Key management
Compliance mandates

Data protected
Application architecture

*Source: Ponemon Institute, 2018 Global Encryption Trends Study, out of 5252 respondents

9

#RSAC

#RSAC
Manual process continues to be the most commonly deployed key management system
What key management systems does your organization presently use?*
*Source: Ponemon Institute, 2018 Global Encryption Trends Study, out of 5252 respondents
10

Developing a plan for the cloud

#RSAC
Understanding data and data proliferation in the cloud

Biggest hurdle in protecting sensitive data
61%
of respondents are using more than one public cloud provider.*
67%
of respondents say discovering where sensitive data resides is the number one challenge.*
*Source: Ponemon Institute, 2018 Global Encryption Trends Study, out of 5252 respondents

Data has a long life and a long tail
· There are two types of data: structured (e.g. email), and unstructured (e.g. files).
· Data is copied and transformed in many ways: big data pipelines, repositories, logs, queues, search indexes, emails, reports (CSV, XLS, PDF, DOC), images, and backups, in addition to databases and file systems.
· Data is shared between applications and with external users in the cloud.
· Data is exported to personal devices, printed, and copied effortlessly. Data left on public computers and on lost devices can result in major breaches.
· Data must be protected at the source, or before it leaves enterprise control.
12

#RSAC
Understanding the shared responsibility model
Data is the customer's responsibility.

Customer responsibility

 Users and devices

 Malware

 Identity / access control

 Regulatory compliance  Malicious insiders  API / integration

 Customer data

 Abuse and errors  Data leak liability

13

#RSAC
Key management architectural choices - BYOK

May I have a key? Here is a (wrapped) key, good until Friday Your premises / your control

KMS Cloud service provider

#RSAC
Key management architectural choices ­ cloud gateways

Multi-App Cloud Security Gateway

Connected

3

Apps

Eco system apps

Cloud
Apps
3

Protected cloud apps

1

Cloud Security Gateway

2

Customer firewall

3 Mobile users

Key manager Internal users

3
On-prem apps
Cloud integration

Enterprise network

1. Customers deploy cloud security gateway at their perimeter.
 CSG proxies traffic between enterprise and cloud applications.  CSG protects sensitive data (PII) before it leaves enterprise control.
 Information remains protected at all times in the cloud, even in cloud provider log files and big data repositories and generated reports.
 With CASB technologies, exported data can be protected on devices.  CSG encryption/tokenization is policy driven and can preserve:
 Cloud application functionality: search, sort, report, filter
 Formats: email, URL, phone number
2. Customers have sole control of the encryption key.
 CSGs can manage the keys in leading HSMs.
3. Connected cloud applications, on-prem applications, and mobile devices connect or integrate via CSG.
 Applications get policy-based access to protected or unprotected data.
 CSG supports many forms of integration: HTTP(S), ODATA, REST, SOAP, SFTP, email, etc.
 CSG supports many document formats: HTML, JSON, XML, CSV, XLS, PDF, DOC.

Key management architectural choices ­

#RSAC

advanced distributed cloud gateways

5 Mobile users
Cloud Security Gateway
5 Mobile users
1

Protected cloud

3

apps

4

Central Management

Central Data Center

2

1. Users and systems from protected regions access cloud applications via a CSG.
 Regional data remains protected at all times, in use and at rest, outside the region.
 Data cannot be searched or sorted outside the region.  Users from unprotected regions can access directly.
2. Encryption key/token DB is under regional control.
 Real data stays protected within the regional data center.
3. Data can be processed by central application.
 For example, reports, invoices, POs, and HR letters can be generated.
 Generated documents contain tokenized data.

Key Manager

Token DB

4. CSG and protection policy can be centrally managed.
 Gateway and tools can be deployed regionally.  Data can be encrypted or tokenized based on policy.

Internal users and apps

Cloud On-prem integration apps

Access from protected regions

Internal Users and Apps

Cloud On-prem integration apps

Access from other regions

5. Depending on access needs, mobile users will need to access the right regional CSG.

Key management architectural choices - comparison

End-to-end data flow

Cloud Security Gateway

BYOK for SaaS Audit scope with BYOK

Enterprise

Enterprise Data

X

Enterprise Gateway

X

Internet / HTTPS

X

Crossing border

SaaS Network FW

X

Web UI & API Layer

Web UI and API layers

X

SaaS provider

Business

Biz Application layer

X

Layer

Middleware/Runtime

X

Middleware Runtime

Operating System

X

Data in

Servers, Hypervisor

X

Memory

Data in Memory

X

Data Store

Data at Rest Storage

*

**

Physical Security

*Key is retained by customer

**Key is shared with CSP

Audit
Audit Scope

#RSAC

#RSAC
What can you do?

Today
· Up your cloud savvy...the cloud is a game changer.
This week
· Discover cloud applications in your environment.
· Classify applications -- by business use, architecture, and data use -- before you classify data.
This month
· Research cloud security vendors and technologies.
· Analyze risk. Develop a plan. Start small.
· Start blocking unwanted applications.

Next 3 months
· Leverage controls provided by the cloud service: authorization, access controls, data security, and monitoring.
· Discover and classify data in the cloud.
· Research and select the right data security strategy based on application types and usage ­ BYOK, CSG, CASB etc.
· Choose hybrid strategies to get the right balance between security and compliance: for example, BYOK for all fields, and CSG for limited fields.
Next 6 months
· Roll out enterprise-wide cloud controls, including data protection as needed.

SESSION ID: BAC-F03
Questions?
Sundaram Lakshmanan
Chief Technology Officer CipherCloud, Inc. https://www.linkedin.com/in/sundaramlakshmanan
19

#RSAC

