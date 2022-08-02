SESSION ID: STR-R03
Separating Fact From Fiction: The Real Risks Within Medical Device Security
#RSAC

Chris Sherman
Analyst, Security & Risk Forrester @ChrisShermanFR

#RSAC
Agenda
Balancing Innovation With Security In Healthcare The Medical Device Threat Landscape Attack Scenarios The Path Forward
2

#RSAC
Balancing Innovation With Security In Healthcare

#RSAC
Robotic Surgery
4

#RSAC
BrainGate
5

#RSAC
Telemedicine
6

#RSAC
mHealth
7

#RSAC
With Innovation Comes Risk
8

#RSAC
With Innovation Comes Risk
9

#RSAC
The Medical Device Risk Landscape

#RSAC
A Typical Hospital Network is Flat

Edge

Core

Email WCF WAF

Distribution

Access

WLAN GW

FW IPS

VPN DAM DLP DB ENC

IPS

IPS

FW

NAC

FW

Enterprise Network

Workstations EMR PACS LDAP

Clinical Network
11

VLAN

VLAN

VLAN

#RSAC
Complexity Is The Primary Enemy

Edge

Core

Email WCF WAF

Distribution

Access

WLAN GW

FW IPS

VPN DAM DLP DB ENC

IPS

IPS

FW

NAC

FW

Enterprise Network

Workstations EMR PACS LDAP

Clinical Network

Vendor

Vendor Vendor

Vendor Vendor

Vendor

Vendor Vendor Vendor Vendor Vendor Vendor

VLAN
12

VLAN

VLAN

#RSAC
Healthcare Security Spending Lags
Base: 315 Global security decision-makers (20+ employees) in public sector and healthcare Source: Forrester's Global Business Technographics® Security Survey, 2015
13

#RSAC
Threat Actor Motivations
14

#RSAC
Attack Scenarios

#RSAC
Collection of Evidence
Conducted 70+ medical device security stakeholder interviews Surveyed 400+ US-based hospital security decision makers in Q2 2015; 1,900 hospital information workers in Q3 Identified public and non-public sources of incident data with the help of Cyberfactors, the FDA, MDISS, HIMSS, and various industry experts
16

#RSAC
Collection of Evidence (Cont.)
17

#RSAC
Medical Device Security - Risk Categories

Denial-of-Service

Therapy Manipulation

Patient Data Theft
18

Asset Damage

#RSAC
Denial-Of-Service: Scenario

Causes
> NETWORK ATTACK > MALWARE > HARDWARE/SOFTWARE
EXPLOITATION
> RADIO FREQUENCY (RF)
EXPLOITATION

Impacts
> CLINICAL WORKFLOW
DISRUPTION
> IT/CLINICAL ENGINEERING
STAFF DISRUPTION

Outcomes
> PATIENT HARM > REPUTATIONAL DAMAGE > REGULATORY FINES/LAWSUITS > REQUEST FOR RANSOM

19

#RSAC
Denial-Of-Service: Evidence
Case #1: Catheter lab incident Case #2: 20 patient monitoring systems taken down in a California-based hospital (unreported) Case #3: MA-based hospital ward shut down due to malware infecting medical devices (unreported) Case #4: CA-based hospital shutdown due to ransomware infecting medical devices
20

#RSAC
Denial-Of-Service: Outlook

Impact
Patient Safety
High
Clinical Workflow
High

Likelihood
Existing Vulnerabilities
High
Existing Exploits
Medium

Existing Controls Medium

High Severity Risk
21

#RSAC
Therapy Manipulation: Scenario

Causes
> MALWARE > HARDWARE/SOFTWARE
EXPLOITATION
> POOR ACCESS CONTROLS > PHYSICAL TAMPERING

Impacts
> CHANGES IN DEVICE FUNCTION/PARAMETERS > CHANGES TO PATIENT DATA

Outcomes
> PATIENT HARM > REPUTATIONAL DAMAGE > REGULATORY FINES/LAWSUITS > REQUEST FOR RANSOM > CHANGES IN FUTURE
TREATMENT DECISIONS

22

#RSAC
Therapy Manipulation: Evidence
Case #1: PCA Pump exploited by Austrian patient Case #2: PCA Pump exploited by researcher Case #3: Insulin Pump exploited by researcher Case #4: Implantable Defibrillator exploited by researcher
23

#RSAC
Therapy Manipulation: Outlook

Impact
Patient Safety
High
Clinical Workflow
High

Likelihood
Existing Vulnerabilities
Medium
Existing Exploits
Low

Existing Controls Medium

Medium Severity Risk
24

#RSAC
Patient Data Theft: Scenario

Causes
> MALWARE > HARDWARE/SOFTWARE
EXPLOITATION
> POOR ACCESS CONTROLS/DEVICE THEFT > DEVICE USED AS ENTRY
POINT INTO DATA NETWORK

Impacts
> DIRECT THEFT OF DATA
FROM DEVICE
> EMR DATABASE
COMPROMISE

25

Outcomes
> PATIENT HARM DUE TO
FRAUD
> PATIENT PRIVACY LOSS > REQUEST FOR RANSOM > REPUTATIONAL DAMAGE > REGULATORY FINES/ LAWSUITS

#RSAC
Patient Data Theft: Evidence
Case #1: HIPAA fines due to CT Scanner breach Case #2: Russian gang used medical devices as entry point into hospital network; stole patient data from EMR
26

#RSAC
Patient Data Theft: Outlook

Impact
Patient Safety
Medium
Clinical Workflow
Low

Likelihood
Existing Vulnerabilities
High
Existing Exploits
High

Existing Controls Medium

Medium Severity Risk
27

#RSAC
Asset Damage: Scenario

Causes
> NETWORK ATTACK > MALWARE > HARDWARE/SOFTWARE
EXPLOIT

Impacts
> CLINICAL WORKFLOW
DISRUPTION
> IT/CLINICAL ENGINEERING
STAFF DISRUPTION

Outcomes
> PATIENT HARM > HIGH REPLACEMENT COSTS > REPUTATIONAL DAMAGE > REGULATORY FINES/ LAWSUITS > REQUEST FOR RANSOM

28

#RSAC
Asset Destruction: Evidence
No examples found Difficult to track due to lack of consideration over security event causation in MDRs
29

#RSAC
Asset Destruction: Outlook

Impact
Patient Safety
High
Clinical Workflow
High

Likelihood
Existing Vulnerabilities
Low
Existing Exploits
Low

Existing Controls High

Low Severity Risk
30

#RSAC
The Path Forward

#RSAC
5 Steps Forward: Apply At Your Organization
1. Categorize Existing Devices Based On Risk 2. Implement A Clinical Risk Management Framework 3. Follow Basic Security Hygiene 4. Include Security Requirements In New Device RFPs 5. Move Toward A "Zero-Trust" Networking Architecture
32

#RSAC
Step 1: Categorize Existing Devices Based On Risk
Base your risk categories on:
Potential impact to patient safety Network Connectivity Data Sensitivity Attack likelihood Upgradability
33

#RSAC
Step 2: Implement A Clinical Risk Mgmt Framework

IEC 80001-1

Risk acceptance

Assessment, prioritization and planning

Risk Identification
Reduction, mitigation and control
34

Residual risk level

#RSAC
Step 3: Follow Basic Security Hygiene
Foster a culture of security awareness within clinical engineering and clinical departments
Blogs, security champions, rotationships
Eliminate default passwords
35

#RSAC
Step 4: Include Security Requirements In RFPs
Request that device manufacturers:
Follow current application security security best-practices Conduct threat modeling/pen testing Have roadmap to build security logging into software Present a completed MDS2 form
36

#RSAC
Step 5: Move Toward A "Zero-Trust" Architecture

Segment devices based on risk
Inspect network data as it flows between segments
Require secure authentication into network

User MCAP

WL MCAP

HC MCAP

37

Segmentation Gateway
MGMT SIM NAV Server DAN MCAP

#RSAC
Need to Know
IEC 80001-1 MDS2 NH-ISAC ICS-CERT FDA Pre-Market and Post-Market (Draft) Cybersecurity Guidance
38

#RSAC
Thank you
Chris Sherman csherman@forrester.com @ChrisShermanFR

