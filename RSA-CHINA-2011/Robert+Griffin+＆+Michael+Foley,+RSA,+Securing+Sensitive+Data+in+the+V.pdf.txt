Securing Sensitive Data in the Virtual World: Instantiating DLP in the Cloud

SpeakerBob Griffin Job TitleVirtualization Architect Company NameRSA

SpeakerMike Foley Job TitleChief Security Architect Company NameRSA

Agenda
· Using DLP to secure sensitive information · Using DLP with VDI and virtual servers · Using DLP in private, public and hybrid clouds

Why DLP Is Important

Comply With Regulations
PCI, HIPAA, GLBA, PIPEDA, EU Data Directive, etc.

Secure Your Sensitive Data
Employee & customer data (PII), corporate secrets, intellectual property

Improve Operational Efficiencies (security)
Keep security costs low and reduce impact on end users

Fines: More than $500K in fines Burden: Quarterly audits Legal: Lawsuits, privacy notices

Damage: Corporate brand equity Churn: Customer & employee Loss: Competitive advantage

Burden: More FTEs for security Capital: Additional HW & SW Cost: Higher TCO

Knowing The "D" In DLP: Sensitive Data

Regulatory Data
· Credit card data · Privacy data (PII) · Health care information

Corporate Secrets
· Intellectual property · Financial information · Trade secrets

Securing Sensitive Information Using DLP

Policy Framework Based on Governance, Risk & Compliance

DISCOVER

MONITOR

EDUCATE

ENFORCE

Sensitive Data

User Actions

?
RISK

Understand Risk
TIME

End Users

Security Controls

Reduce Risk

Business Policy and DLP

Business pBoulsicinieesss Policy

Enterprise

Assets

"An appropriate set of procedures for

wdiitnehvfoethrlomepacetldaiosansnifldiacobairmetgGTiloapienonnlaegvimzsmeacarnehtnidneoatmnhne.aced"enaidndlioancpgctsoehrdda·f·bloalEIynnrbsctveDtheaeLebsPtliisghatbiounsionMefe.sDgaSsnLCypaPsugtoseetlmoimcmyseenrt Regulations: e.g PCI, EU Data, f·cihnUadpnidngagetssetihnpaobtluivcsiiieoneslIe.angtstf.oesoC,Drrpumeaostftaalloeitcimcoytner Protection Directive technology and threats

Audit Procedures
Verify customer data is only shared with authorized third parties, verify customer data is encrypted at rest

Requirements ·Assessment requirements ·DLP policies & rules
DLP Administrator

Status & Exceptions ·Assessment findings ·Escalated incidents

DLP Policies
Content: Credit Card Number, Drivers Licence number, Social Security number

DataCenter Move if not encrypted

Endpoint e.g Block USB
notify user

Network e.g Block, notify sender

Discover Your Sensitive Data
Reduce uncertainty and understand risk from the data you own

Comply With Regulations

Protect Corporate Competitive Advantage

Credit Card Data

Personally Identifiable Information (PII)

Personal Health Information (PHI)

Corporate Secret Data

Unstructured

Semi-Structured

Structured

Classification Framework

A classification framework must suit your unique needs

Attributes
 Transmission metadata  File size, type, etc.  Owner, sender, etc.

Described Content
 Detection Rules  Context Rules  Exceptions

Fingerprinting
 Full & partial match  Databases  Files

Highly accurate results in identifying sensitive data

Mapping Risk to Sensitive Information
DLP heat maps provide the Information risk (or concern) index for assets within the organization

Use Case: Information Discovery
Analyst gets full picture of where sensitive information is
located and how it is protected

Monitor Your Sensitive Information
Understand how your user actions impact your corporate objectives

Regulatory Data

Compliance Objectives

Corporate Secrets

Governance & Risk Objectives

Incident Workflow to Manage Violations
Reduce noise, prioritize incidents and manage workflow

Consolidate Violations

Send Alerts Based on Risk

Violation Event 1
Violation Event 2
Violation Event 3
Violation Event 4
Violation Event "n"

Policy Based Logical Grouping

Security Incident

Security Incident

HIGH MEDIUM
LOW

intelligent alerts and prioritization

Alert Security Officer
Alert Manager
No Alerts. Audit Only

Use Case: Security Investigation

Analyst investigates malware outbreak

DLP detects if confidential
Information is leaving network

Educate End Users
Educate end users on policies and violations to reduce risk

Emphasized Education Program
Augment Standard Policy Education With
"Just-In-Time Education"

Just-In-Time Education

!



1 user performs actions

2 DLP educates on violation

3 user acts responsibly

Top Violators
(Identified through Discover and Monitor)
Rest of the users

User Identity Analysis

Name Title Business group Organization hierarchy Special privileges

What policies to apply Define the risk of actions What controls to enforce Who to notify

Real-time data from your Windows Active Directory Used across all phases of DLP

Enforce Controls to Prevent Data Loss

Enforce security controls based on the risk of a violation

User Action

Data Sensitivity

User Identity

Defined in DLP Policy

LOW
ALLOW NOTIFY AUDIT

RISK

QUARANTINE JUSTIFY COPY

MOVE BLOCK DELETE

HIGH

ENCRYPT SHRED RMS (DRM)

Manual or
Automated

Secure Sensitive Information on Endpoints

Mitigate risk from end user actions on endpoints

Connected or Disconnected from Corporate Network

Monitor Educate Enforce
        

Connected to Corporate Network

Not Connected to Corporate Network

Connecting DLP With Your Business
POLICY
Your DLP Deployment

INFRASTRUCTURE

INCIDENTS

CONTROLS

Agenda
· Using DLP to secure sensitive information · Using DLP with VDI and virtual servers · Using DLP in private, public and hybrid clouds

It starts with infrastructure
· How do I get to "Cloud"?
­ Start with a secure infrastructure (e.g.: Private Cloud)
­ Before pushing out to the public cloud
· Work out your user experience locally · Work out security best practices
­ Leverage automation and orchestration to provide consistent, measurable tasks
· This helps to focus on "out of policy" actions, bringing them to the forefront

Today's Endpoint Security Challenges

· Expensive but still vulnerable

· Gateway to infection and theft

­ 60% of the security budget is consumed by endpoint security software1
­ Lost or stolen laptops is the largest single source of breaches2
­ Only 30% of business encrypt laptops6

­ 35% of infected PCs had up-to-date antivirus software installed3
­ Malware contributed to 82% of records compromised in 20094
­ 88% of Fortune 500 companies have employees infected with Trojans.... and don't know about them!5

­ 95% of lost laptops are never returned6

Source: (1) Gartner, Inc. (2) OSF Data loss DB (3) Panda Labs (4) Verizon Business (5) RSA Fraud Action Lab (6) Ponemon Institute 2010

Virtual Data Center

Physical endpoint

Fraudsters
Online Banking, Social Networking e-Commerce, etc.

Using DLP in the Virtual Environment
Protected virtual network
Authenticated access

Ensure no sensitive Information is on the device
The endpoint is changing
Mac iPhone/iPad Android phones and tablets BYOC

Allow Virtual Desktop with access to sensitive data
No USB or only secure USB allowed via DLP
All aspects of desktop interaction, including DLP information, monitored by the infrastructure

Application with sensitive data
Identify applications containing sensitive information Restrict applications available through VDI Sensitive information doesn't leave the datacenter

More Effective Security by Pushing Enforcement Down the Stack

Today most security is enforced by the OS and application stack. This is:
· Ineffective
· Inconsistent ·BenufiClodoricnmegmpilneexnintfionrmthaetiionnfrassetcruurcittuyre layer ensures:
· Consistency
· Simplified security management
· Much higher level of visibility into security operations

vApp and VM layer

APP

APP

APP

APP

OS

OS

OS

OS

Virtual and Cloud Infrastructure

Physical Infrastructure

Complementing Virtual Zones with DLP
Discovery of sensitive data at the virtualization layer

Discover sensitive data Endpoint enforcement of policies at application
Network enforcement of policies Scanning of SharePoint or Lotus Notes Fingerprint files and databases Custom content discovery

DLP

Virtual Zone

























DLP within a VDI Solution

Compliance Dashboard
remote authentication
Clients

virtual Infrastructure
information
VDI manager
Secure access

DLP for protection of data in use
Directory
Virtual infrastructure administration
log management

Agenda
· Using DLP to secure sensitive information · Using DLP with VDI and virtual servers · Using DLP in private, public and hybrid clouds

Cloud Security Alliance - Guidance
The Cloud Security Alliance's 13 Critical Areas Of Focus for Cloud:

1. Architecture & Framework

Governing the Cloud

Operating the Cloud

2. Governance & Risk Mgmt 8. Traditional BCM, DR

3. Legal & Electronic Discovery
5. Compliance & Audit

9. Datacenter Operations 10. Incident Response

6. Information Lifecycle Mgmt 11. Application Security

7. Portability & Interoperability 12. Encryption & Key Mgmt

13. Identity & Access Mgmt

www.cloudsecurityalliance.org

DLP has a role in each cloud model

SaaS

DLP

PaaS IaaS

Mapping the Model to the Metal
Cloud Model Find the Gaps!

Security Control Model

Applications

Compliance Model SDLC, Binary Analysis, Scanners, WebApp
Firewalls, Transactional Sec.

Information Management

DLP, CMF, Database Activity Monitoring, Encryption
GRC, IAM, VA/VM, Patch Management, Configuration Management, Monitoring

Network
Trusted Computing Compute & Storage
Physical

NIDS/NIPS, Firewalls, DPI, Anti-DDoS, QoS, DNSSEC, OAuth
Hardware & Software RoT & API's
Host-based Firewalls, HIDS/HIPS, Integrity & File/log Management, Encryption, Masking
Physical Plant Security, CCTV, Guards

PCI
Firewalls Code Review WAF Encryption Unique User IDs Anti-Virus Monitoring/IDS/IPS Patch/Vulnerability Management Physical Access Control Two-Factor Authentication...
HIPAA
GLBA
SOX

Cloud Security and Compliance
VI Component Discovery and Population VI Configuration Measurement Dashboard

alerts

DLP information

30

Thank you for joining us! mike.foley@emc.com robert.griffin@rsa.com
31

