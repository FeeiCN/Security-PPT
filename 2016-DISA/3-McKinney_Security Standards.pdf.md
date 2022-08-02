UNCLASSIFIED

UNCLASSIFIED

Security Standards: Getting the Protections in Place

Christine McKinney DISA Cyber Standards & Analysis Division
21 April 2016

UNITED IN SERVICE TO OUR NATION

1

Presentation Disclaimer

UNCLASSIFIED

"The information provided in this briefing is for general information purposes only. It does not constitute a commitment on behalf of the United States Government to provide any of the capabilities, systems or equipment presented and in no way obligates the United States Government to enter into any future agreements with regard to the same. The information presented may not be disseminated without the express consent of the United States Government. This brief may also contain references to Unite States Government future plans and projected system capabilities. Mention of these plans or capabilities in no way guarantees that the U.S. Government will follow these plans or that any of the associated system capabilities will be available or releasable to foreign governments."

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

2

Agenda
· Authority · Security Technical Implementation Guides · Automation · Impact

UNCLASSIFIED

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

3

Authority
· DoDI 8500. 01:
 "2. DIRECTOR, DISA. Under the authority, direction, and control of the DoD CIO and in addition to the responsibilities in section 13 of this enclosure, the Director, DISA
 b. Develops and maintains Control Correlation Identifiers (CCIs), Security Requirements Guides (SRGs), Security Technical Implementation Guides (STIGs), and mobile code."

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

UNCLASSIFIED 4

Cyber Standards and Analysis Division Mission

UNCLASSIFIED

· Develop and maintain Security Requirements Guides (SRGs) and Security Technical Implementation Guides (STIGs)
· Guidance used in Command Cyber Readiness Inspection (CCRIs) and certification and accreditation (C&A) activities (compliance) as well as vendor product development
· Develop and disseminate operationally implementable secure configuration Guidance for use throughout the DoD
· Serve as the Information Systems Security Manager (ISSM) for the Risk Management Executive (RME) and Operations Center (OPC)
· Provide technical analysis and metrics support

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

5

Priorities
· The STIGs support the DISA objectives
 Joint Information Environment (JIE)  DoD Mobility Classified Capability (DMCC)  Cloud  Joint Regional Security Stacks (JRSS)  Software Defined Networking (SDN)

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

UNCLASSIFIED 6

What is a STIG?

· Security Technical Implementation Guide:
 An operationally implementable compendium of DoD IA controls, Security Regulations, and Best Practices for Securing an IA or IA-Enabled Device (Operating System, Network, Application Software, etc.)
 Providing guidance for areas including mitigating insider threats, containing applications, preventing lateral movements, and securing information system credentials
· GOALS  Intrusion Avoidance  Intrusion Detection  Response and Recovery

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

UNCLASSIFIED 7

STIG Model

UNCLASSIFIED

DoD IA Policy Documents CCI
SRG

Core Tech

SP 800-53

DoD Directives & Instructions

CJCS Policy

Control Correlation Identifiers (CCI)

CTOs

Policy SRG Mobile Policy

OS SRG

Application SRG
Database SRG

Network SRG Router SRG | IDPS SRG

DNS SRG

App Server SRG

Web Svr SRG

SCAP Standards
(Acronyms defined slide 14)
CVSS

STIG (Specific technology, products, and system guidance and procedures)
UNCLASSIFIED

Enclave

RH 6

Oracle 9i

VoIP

HBSS JRSS

ACAS DoD DMZ

Input from multiple SRG source
System requirements are used to build STIGs system or specialized STIGs
UNITED IN SERVICE TO OUR NATION

CPE CCE CVE CVSS XCCDF OCIL OVAL
8

Types of STIGs

· Policy and Architectural
 Traditional/Physical Security  Facilities Security  Network Infrastructure Policy

· Technical:
 DISA Cyber Standards team authors them with appropriated funding
 Vendor Developed with assistance from the Cyber Standards team by submitting and intent form http://iase.disa.mil/stigs/Pages/vendor-process.aspx
 Consensus partnering with military services and peer federal agencies

UNCLASSIFIED

All NIST 800-53 Sourced
UNITED IN SERVICE TO OUR NATION

UNCLASSIFIED 9

STIG Development Process

Develop Scope

Approval Process

Publish STIG

STIG Template/ SRG (Technology Specific
Based on NIST 800.53 Controls)
Refinement of the Configuration Statement

Community Review of DISA-Developed
STIGs
Creation of Check and Fix Procedures

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

UNCLASSIFIED 10

Vendor STIG Process

UNCLASSIFIED

Planning
· Project Kickoff · SME and
Government POC · DISA Provides materials · Detailed process explanation

Development
· Requirements Analysis
· Check and Fix Procedures
· SME Support as needed
· Vendor Submission

Validation
· STIG Review · STIG
Simulation · Review of
vendor- provided documents

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

Review and Approval
· DISA internal review
· Style Guide Review
· RME Decision Briefing
· Vendor Notification
· STIG Publication
11

Consensus Process
· Participants include:
 DoD Services and Agencies  Federal Agencies  NSA  Vendors

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

UNCLASSIFIED 12

UNCLASSIFIED
Cyber Standards and Analysis Division View of STIG Automation

D

O D

CContent Created C DISA OVAL
Creation

I

P O

/ Content Created

S

Vendor

L R Some with OVAL

IG

C

Content Created

Y

Consensus

Some with OVAL

UNCLASSIFIED

Direct Entry Into DPMS

Develop OVAL
Automated Content
Community

Guidance Guidance

Guidance

STDs

DPMS/ CMRS

Structure

Filtering Published

From

DPMS

Automated

Technology Family
Security Requirements Guide (SRG)

Technology STIG
Automated w/ OVAL

Upload to CMRS Common Format For All SCAP tools
Assessment Results
Automated
Imported Into Tools
Automated

UNITED IN SERVICE TO OUR NATION

Automated Assessment
13

Automation

UNCLASSIFIED

· Security Content Automation Protocol (SCAP)
 A standards-based approach to develop IA configuration guidance, publish IA guidance, assess assets, and report compliance
· Benefits
 Enables vendor community to develop standardized guidance once for use by all communities
 Allow more commercial assessment tools to utilize DoD configuration guidance
 Requires less time to develop and publish additional guidance

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

14

UNCLASSIFIED
Core Security Content Automation Protocol Components

· Automated standardized machine-consumable security content leveraging several xml protocols presented below

· CPE ­ Common Platform Enumeration

· CVE ­ Common Vulnerably Enumeration

· CCE ­ Common Configuration Enumeration

· XCCDF ­ eXtensible Checklist Configuration Description Format

· OVAL ­ Open Vulnerability Assessment Language
· CVSS ­ Common Vulnerability Scoring System · OCIL ­ Open Checklist Interactive Language

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

15

Why SCAP?
· Many Reasons
 Open Standards  Supports many tools  Abstracts the "How"  Reduces development time  Repeatable  Non-Proprietary  Standard Identifiers  Lowers duplication efforts  Enterprise capability

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

UNCLASSIFIED 16

DISA Produced Benchmarks
· HP-UX 11.31 / 11iv3 · IBM AIX 6.1 · Microsoft .NET Framework 4 · Microsoft Internet Explorer · Microsoft Office · Microsoft Windows · Red Hat Enterprise · Solaris

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

UNCLASSIFIED 17

Where do I get the content?

UNCLASSIFIED

· There are over 16,000 registered users
· Over 920,000 hits per month
· Support for users questions in excess of 3000 each year

http://iase.disa.mil/stigs/index.html

Go Here

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

18

What is there?
· Access to over 300 security guides · Mapped to both Federal NIST 800-53 and DoD CNSS-1253 IA control sets · Manual and Automated (SCAP) Content · STIG Viewer · STIG Applicability Tool · Windows 10 Secure Host Baseline Download

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

UNCLASSIFIED 19

STIG Impacts
· Internal analysis has shown over 96% of cyber incidents could have been prevented if STIGS were applied
· Rapid response to real-time cyber attacks · Industry and government can benefit from
security standards

UNCLASSIFIED

STIG Support Help Desk disa.stig_spt@mail.mil

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

20

Questions

UNCLASSIFIED

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

21

