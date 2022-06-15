SESSION ID: TECH-F03
Medical Device Security: Assessing and Managing Product Security Risk

Russell Jones
Partner Cyber Risk Services | Deloitte & Touche LLP

John Lu
Principal Cyber Risk Services | Deloitte & Touche LLP

#RSAC

#RSAC
Presenter Bio

Summary of experience

Russell L. Jones

· Russell leads Deloitte's Medical Device Safety and Security (MeDSS) practice

Partner

· More than 22 years of experience working with health care provider, biotechnology/Pharma,

Cyber Risk Services

diagnostics, medical device manufacturer and public sector clients

Deloitte & Touche LLP · Focus on development of cybersecurity, product security, information security, data privacy

and IT risk management programs

· Bachelor's degree in Management Information Systems from University of Notre Dame

· Certified Information Privacy Professional (CIPP), Certified Information Systems Security

Professional (CISSP), Certified Information Systems Auditor (CISA), and Certified Public

Accountant (CPA) licensed in California and Maryland

John Lu

· John specializes in delivering Security, Privacy, & Resiliency services for global Life

Principal

Sciences organizations

Cyber Risk Services · Over fifteen (15) years of experience leading information technology risk management

Deloitte & Touche LLP

(ITRM), information security, data privacy, and third-party/vendor risk management, with a focus on Identity & Access Management (IAM) projects

· Experience encompasses a broad spectrum of engagement types, ranging from project

management, policy development, current state assessment, strategy and roadmap

development, requirements analysis and definition, vendor evaluation and selection,

architecture and design, installation and configuration, testing, and knowledge transfer

· Certified Information Systems Security Professional (CISSP)

As used in this document, "Deloitte" means Deloitte & Touche LLP, a subsidiary of Deloitte LLP. Please see www.deloitte.com/us/about for a detailed description of the legal structure of Deloitte LLP and its subsidiaries. Certain services may not be available to attest clients under the rules and regulations of public accounting.

#RSAC
Agenda
What are we going to talk about today?
 Current medical device security landscape: Takeaways from FDA guidance  Security risk assessment for networked medical devices: Deloitte's POV  You've identified security risks, now what?: Possible solutions ­ Security By Design  Key takeaways
Today's Objectives:  Learn how to assess and mitigate the security risk for medical devices
3

#RSAC
Audience Poll
4

#RSAC
Audience Poll

#RSAC
Medical Device Cybersecurity Issues
Trending In the News
6

Current Medical Device

#RSAC

Security Landscape

Current state of medical device security
Takeaways from FDA guidance
Key takeaways from the FDA's guidance (the Guidance): · Manufacturers should address cybersecurity during the "design and
development" of the medical device

#RSAC

· The Guidance leverages NIST's Cybersecurity Framework

· The scope of the Guidance covers the following:

o 510k, de novo submissions, Premarket Approval Applications (PMAs), product development protocols, and humanitarian device exemption

Source: http://www.fda.gov/downloads/MedicalDevices/DeviceRegulation andGuidance/GuidanceDocuments/UCM356190.pdf

#RSAC
Current state of medical device security (Contd.)
Takeaways from FDA guidance
Key takeaways from the FDA's guidance (the Guidance) (Contd.):

· The FDA is looking for the following in their review of the above types of submissions:

Source: http://www.fda.gov/downloads/MedicalDevices/DeviceRegulation andGuidance/GuidanceDocuments/UCM356190.pdf

o A specific list of all cybersecurity risks (both intentional and unintentional) that were considered in the design of the device and a list, and justification for all cybersecurity controls that were established for the device;
o A "traceability matrix" that links the actual cybersecurity controls to the cybersecurity risks that were considered;
o A summary describing the plan for providing validated software updates and patches as needed throughout the lifecycle of the medical device to continue to assure its safety and effectiveness;
o A summary describing controls that are in place to assure that the medical device software will remain free of malware from the point of origin to the point at which that device leaves the control of the manufacturer; and
o Device instructions for use and product specifications related to recommended cybersecurity controls appropriate for the intended use environment.

Current state of medical device security

#RSAC

A first of its kind medical device security workshop was held on October 21 ­ 22, 2014

Key takeaways from the FDA's Cybersecurity Workshop#RSAC
Developing a scalable and repeatable Security Risk Assessment Framework for medical devices

FDA guidance provides recommendations for manufacturers to consider for effective cybersecurity risk management of the medical devices they design, develop, and/or manage.

Risk Management Scope

Cybersecurity risk management applies throughout product lifecycle (e.g., new products under development and existing fielded products)

Quality Management System (QMS)

Incorporate cybersecurity risk management process into existing quality systems

Regulatory

Cybersecurity risk documentation is expected for premarket submissions

Disclosure Responsibility

Deploy Responsible Disclosure Policy to urge manufacturers to reach out to customers about vulnerabilities and breaches

Security Risk Assessment

#RSAC

for Networked Medical

Devices: Deloitte's POV

High Risk Networked Medical Devices: Infusion pumps #RSAC
How can you exploit a medical device?
An infusion pump is a medical device that infuses fluids, medication or nutrients into a patient's circulatory system. Infusion pumps are one of the most ubiquitous medical devices in the world.
Infusion Pump

Illustrative Cyberattack Scenario: Infusion Pump

#RSAC

#RSAC
Security Risk Assessment for Medical Devices
Adopting a broad risk assessment approach

The Security Risk Assessment Process uses a six-step approach to calculate the risk rating using the Medical Device Security Risk Framework and the risk calculator. The risk ratings can be used by management to prioritize identification and adoption of mitigating controls.

Step 1 IDENTIFY

Step 2 DEVELOP

Step 3 CONDUCT

Step 4 CONDUCT

Step 5 OBTAIN

Step 6 MAKE

Threat Sources
& Vulnerabilities

Risk Scenarios

Exploitability Assessment

Impact Assessment

(Initial) Risk Scores

Risk Management
Decision
U PA A

Source: "Security Risk Assessment Framework for Medical Devices", MDPC, September 26, 2014

Legend:
A PA U

Acceptable Potentially Acceptable
Unacceptable

#RSAC
Ability to Exploit Vulnerability ­ illustrative example

Defining the threat factors

The Ability to Exploit Vulnerability (in lieu of "likelihood") is calculated for identified risk/threat scenarios using the table below

High (Easy to Exploit)

Medium

Low (Difficult to Exploit)

Validated

Threat Agent Factors

Skill

· Minimal Technical Skills

· Default Configuration

· Advanced Technology Skills · Common Configuration

Motive

· Financial or other identifiable · Some financial or other

gain exits

identifiable gain exits

· Advanced Technology Skills
· No financial or other identifiable gain exits

Nearly impossible and/or merely theoretical for a highly skilled attacker with advanced equipment to succeed

Opportunity & Resources Vulnerability Factors Ease of Discovery & Awareness
Ease of Exploiting
Intrusion Detection
Effectiveness of Applied Security Controls

· No physical access required
· Easily discoverable
· Easy to exploit · Unauthorized access is not
logged or monitored · Security controls are not
designed or implemented effectively

· Some physical access required · Requires access rights
· Knowledge of vulnerability exists publicly with no technical details
· Difficult to exploit
· Unauthorized access is logged and monitored but no automated alerts
· Security controls are well defined but limited in strength and effectiveness

· Full physical access required
· Difficult to discover
· Nearly impossible to exploit · Unauthorized access is
logged and monitored and immediately detected · Security controls are well defined and multi-layered

Nearly impossible to exploit and/or merely theoretical even with advanced and/or commercial grade equipment
Controls developed and implemented should: provide a high degree of confidence that they are complete, consistent and correct

Source: Adapted from "Security Risk Assessment Framework for Medical Devices", MDPC, September 26, 2014

#RSAC
Risk rating
Determining the risk ranking
The risk calculator takes as its inputs the Ability to Exploit Vulnerability and Impact. The combination of impact and ability to exploit results in the risk score, which is either Acceptable, Potentially Acceptable, or Unacceptable (defined below).

Acceptable (A) Potentially
Acceptable (PA)
Unacceptable (U)

Illustrative Example of Risk Score Definitions
Product Device No further evaluation or controls are necessary regarding the Acceptable risk scenario
It is highly recommended that manufacturers consider additional security controls or strengthen existing mitigating controls Additional security controls and/or strengthened mitigating controls must be applied unless a decision is made to decommission the device/project
Illustrative Example of the MDPC Security Risk Calculator

Source: "Security Risk Assessment Framework for Medical Devices", MDPC, September 26, 2014

Scenario ­ Drug infusion pump

#RSAC

Applying the risk ranking

IDENTIFY
Threat Sources & Vulnerabilities

Vulnerability: Device is not password protected and allows easy access to the multi-file system, custom binary files, registry settings, and pump control

DEVELOP
Risk Scenarios

Risk Scenario: The attacker: 1. Target is attached to a wireless infusion pump and is using web security. 2. The device is not password protected and provides easy access to pump control. 3. Executes the native pump accessible to embedded operating system.

CONDUCT
Exploitability
OBTAIN
Risk Scores
MAKE
Risk Management Decision
OBTAIN
RESIDUAL Risk Scores

Ability to Exploit 2-Medium

Confidentiality

Impact 4-Critical

Current Risk Score Unacceptable

Patient Safety

Impact 5-Catastrophic

Current Risk Score Unacceptable

Remediation: Mitigate risk through advice given in US-Cert ICS-Alert-13-164-01, including additional network security and segmentation controls and monitoring, working with the product vendor to apply device specific patches.

Ability to Exploit 1-Low

Confidentiality

Impact

Residual Risk Score

4-Critical

Potentially Acceptable

Patient Safety

Impact

Residual Risk Score

5-Catastrophic

Potentially Acceptable

Note: Information is an example of a vulnerability scenario and is not specific to one device or company.

You've Identified Security

Risks, Now What?:

Possible solutions­ Security

By Design

#RSAC

Security by Design- Deloitte's Point of View
Building security into the medical device on the front-end

Security by Design is becoming a key requisite within the product development lifecycle for medical devices. A risk-based approach that integrates Research & Development (R&D) innovation with the security considerations of regulatory agencies and patients and the business strategy of the firm must be undertaken.

Handling PHI
Product Innovation
Safety Vulnerability Management

 Design must incorporate and maintain confidentiality of sensitive patient information
 Design must not compromise the creativity of the development team and thus maintain competitive advantage for the firm
 Design must comply with safety requirements and consider potential safety implications
 Design must be continuously monitored for potential vulnerabilities at an early stage

Risk Assessment Business Strategy

 Design related risks must be identified, tracked and mitigated throughout the product lifecycle
 Design must align with the business strategies and market objectives of the firm

Business Strategy
Risk Assessment

Bullet Dash

Handling Protected
Health Information
(PHI)
Product Security
by Design
Vulnerability Management

Product Innovation
Safety

Implementing "Security by Design" requires a programmatic approach

#RSAC

Product Foundation Development
Lifecycle

Deloitte Product Security Program Framework (TM )
Leveraging Product Security Program Framework

TM
Safe and Secure Medical Devices

1

Product Security Steering Committee

Product Security Leadership Council

Governance an d
Leadershi p

Product Marketing Leadership

Legal Leadership

R&D Leadership

Privacy Leadership

IT Security Leadership

Regulatory Compliance Leadership

Strategy, Charter, Governance Model, & Policy

Product Security Risk Assessment

Security Baselines & Requirements

Security Event Handling and
Incident Management

Security Audit & Assessment

Metrics & Monitoring

External Communications
(Regulators, Customers)

SDL Education & Training

Component Supplier Security

Product Functional Security Elements Operating
Components

Management Oversight

Processes & PrPorcoecsesd&urSeOs Ps

Infrastructure

Talent

Technical Standards

Regulations

Leading Industry Practices

Design
Identity and Access Management

Build

Secure Development Lifecycle (SDL)

Test

Manufacture and Market

Post Market Surveillance

Quality Management System (QMS)

Network Monitoring

Change Management

Physical Security

End of Life
Threat and Vulnerability Management

#RSAC

#RSAC
Implement A Secure Development Lifecycle (SDL)
Source: adapted from : "Microsoft SDL', http://www.microsoft.com/security/sdl/process/

#RSAC
PHASE 1: Training
Training and Education is foundational for building better software and applications and include secure design, threat modeling, secure coding, security testing, and privacy leading practices.
Core Privacy & Security Training
Software development technical roles such as developers, testers, and program managers should consider attending at least one security training class each year.
Source: adapted from : "Microsoft SDL', http://www.microsoft.com/security/sdl/process/

PHASE 2: Requirements
The objective of this phase is to consider foundational security and privacy issues and to analyze how to align quality and regulatory requirements with costs and business needs.

#RSAC

Establish Security and Privacy Requirements

Create Quality Gates/Bug Bars

Perform Security and Privacy Risk Assessments

Define and integrate security and privacy requirements early to identify key milestones and deliverables and minimize disruptions to plans and schedules.

Define minimum acceptable levels of security and privacy quality at the start. This can help the team understand risks associated with security issues, identify and fix security bugs during development, and apply the standards throughout the project

Analyze software and application design based on regulatory requirements that can help to identify which portions of a product will require threat modeling and security design reviews.

Source: adapted from : "Microsoft SDL', http://www.microsoft.com/security/sdl/process/

PHASE 3: Design
This phase is critical for establishing leading practices around design and functional specifications and performing risk analysis that will help mitigate security and privacy issues throughout a project

#RSAC

Establish Design Requirements

Perform Attack Surface Analysis/Reduction

Use Threat Modeling

Analyze design specifications against a functional specification to involve accurate and complete design specifications, including minimal cryptographic design requirements and a specification review

Reduce the opportunities for attackers to exploit a potential weak spot or vulnerability requires thoroughly analyzing overall attack surface and includes disabling or restricting access to system services, applying the principle of least privilege, and employing layered defenses wherever possible.

Apply a structured approach to threat scenarios during design to help a team more effectively and less expensively identify security vulnerabilities, determine risks from those threats, and establish appropriate mitigations.

Source: adapted from : "Microsoft SDL', http://www.microsoft.com/security/sdl/process/

PHASE 4: Implementation
The focus of this phase is to help the end user to make informed decisions about the secure ways to deploy the software. It's also the time to establish leading practices for detecting and removing security issues from the code.

#RSAC

Use Approved Tools

Deprecate Unsafe Functions

Perform Static Analysis

Publish a list of approved tools and associated security checks to help automate and enforce security practices easily at a low cost.

Analyze project functions and APIs and ban those determined to be unsafe, to help reduce potential security bugs with very little engineering cost.

Analyze the source code prior to compilation to provide a scalable method of security code review and to help determine that secure coding policies are being followed.

Source: adapted from : "Microsoft SDL', http://www.microsoft.com/security/sdl/process/

PHASE 5: Verification
This phase involves a comprehensive effort to determine that the code addresses the security and privacy tenets established in the previous phases.

#RSAC

Perform Dynamic Analysis

Perform Fuzz Testing

Conduct Attack Surface Review

Perform run-time verification of the software to check functionality using tools that monitor application behavior for memory corruption, user privilege issues, and other critical security problems

Induce program failure by deliberately introducing malformed or random data to an application to help reveal potential security issues prior to release while requiring modest resource investment.

Review attack surface upon code completion to help determine that design or implementation changes to an application or system have been taken into account, and that new attack vectors created as a result of the changes have been reviewed and mitigated including threat models.

Source: adapted from : "Microsoft SDL', http://www.microsoft.com/security/sdl/process/

PHASE 6: Release
The focus of this phase is readying a project for public release, including planning ways to effectively perform postrelease servicing tasks and address security or privacy vulnerabilities that may occur later.

#RSAC

Create an Incident Response Plan

Conduct Final Security Review

Certify Release and Archive

Prepare an Incident Response Plan to address new threats that can emerge over time. It includes identifying appropriate security emergency contacts and establishing security servicing plans for code inherited from other groups within the organization and for licensed thirdparty code.

Review security activities that were performed to help determine software release readiness.
The Final Security Review (FSR) usually includes examining threat models, tools outputs, and performance against the quality gates and bug bars defined during the Requirements Phase.

Certify software prior to a release helps determine security and privacy requirements were met.
Archive pertinent data for performing post-release servicing tasks and to help lower the long-term costs associated with sustained software engineering. .

Source: adapted from : "Microsoft SDL', http://www.microsoft.com/security/sdl/process/

PHASE 7: Response
This post-release phase centers on the development team being able and available to respond appropriately to reports of emerging software threats and vulnerabilities
Execute Incident Response Plan

#RSAC

Implement the Incident Response Plan instituted in the Release phase to help protect customers from software security or privacy vulnerabilities that emerge.

Source: adapted from : "Microsoft SDL', http://www.microsoft.com/security/sdl/process/

Key Takeaways

#RSAC

#RSAC
Key Takeaways
Some key actions you need to own
1. Get involved with key medical device/mHealth driven consortiums/standard setting bodies Proactively shape the security standards that will result in medical devices that are ready for the 21st century cyber risk environment and help you meet your regulatory compliance requirements.
2. Get involved with the NH-ISAC Sharing of key cyber threat intelligence about fielded networked medical devices will be critical in understanding the current threat environment and modeling the future cyber threat landscape. The FDA and NH-ISAC have established an agreement that will allow sharing of cyber threat intelligence. Consider getting involved with NH-ISAC to both benefit from this knowledge and shape the protocols and standards that come out of it.
3. Monitor the FDA's direction on medical device security Currently, the FDA is leading the way regarding medical device security; other international regulatory agencies will most likely follow suit. Continue to monitor the FDA's direction and additional guidance on cybersecurity that may be forthcoming.
4. Adopt A Secure Development Lifecycle (SDL) "Build-in" security in the early Requirements/Design phases of new medical devices (or new indications of existing medical devices); embed SDL into the "DNA" of your product development teams.

This presentation contains general information only and Deloitte is not, by means of this presentation, rendering accounting, business, financial, investment, legal, tax, or other professional advice or services. This presentation is not a substitute for such professional advice or services, nor should it be used as a basis for any decision or action that may affect your business. Before making any decision or taking any action that may affect your business, you should consult a qualified professional advisor.
Deloitte shall not be responsible for any loss sustained by any person who relies on this presentation.

#RSAC

