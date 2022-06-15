Building an OT Security Community
A Case Example from NZ November 2020
Building an OT Security Community

Introducing Peter Jackson
 Engineering Manager (Cyber)  Senior Systems Engineer  BE Hons; GICSP; GRID  Industry Experience
 Control Systems (DCS/PLC)  Safety Systems (TÜV FSE 7040/13)  Industrial Networks (Ethernet/fibre)  Server Management (Windows)  Alarm Management  Conference presenter and member of ISA-99 (responsible for 62443 suite)
 SANS Instructor (in dev) for ICS515 (GRID)  Founder & facilitator of NZ ICS Cyber Technical Network (icscyber.org.nz)
Building an OT Security Community

NZ approach
 Based on control systems expertise  Working with ICS and IT stakeholders  Develop best-practice, defence-in-depth, appropriate solutions  Our OT-security tools, tactics, procedures need to be OT-specific
Informed by the IT-security controls that work for our environments
1. Case Studies ­ some examples 2. NZ ICS Cyber TN ­ building a community 3. VCSS-CSO ­ tool to support the community
Building an OT Security Community

Case Study 1: Fast-tracking Defence-in-Depth in a NZ industrial facility
 IT compromise for global parent lead to IT/OT security audit  Audit completed by IT-security and ICS-vendor auditors  5 months to full site shutdown. Short timeline for design, purchase,
implement, commission, handover.  Next full site shutdown >5 years
Building an OT Security Community

Case Study 1: Fast-tracking Defence-in-Depth in a NZ industrial facility
 OT assessments from IT and ICS vendors ­ different focus, priorities, background, standards
 ECL team collated results and fast-tracked design  Top priority: quality  Management of change, approvals  The results:
Building an OT Security Community

Case Study 1: The Design
 IDMZ (Industrial DMZ)
 Replaced existing OT firewall with upgrade redundant firewall  Added IDMZ components into network architecture ­ VM Host pair  VM Guests ­ DC (primary/backup); WSUS; AV; Future (services)
 Network hardening
 Physical segregation to firewall; VLANs; Firewall routing
 Network segmentation
 Tight controls on Safety Networks (19)  Implementing segregation on Miscellaneous Networks (5)
Building an OT Security Community

Case Study 1: The Design
 Logging and Monitoring (including display)  Access and Asset Controls  Training
 VM operation and maintenance  Use of Windows, Firewall, Logging and Monitoring tools  Industrial Cyber Awareness/Advanced training
 Governance
 Policies, procedures ­ specific to site requirements for OT environment
Building an OT Security Community

Case Study 1: The good, the bad and the ugly
 The good
 Collaboration and cooperation with client, service providers (2) and other stakeholders ()
 The bad
 Fast-tracking does not allow comprehensive design process
 The ugly
 Understanding what the client asked for vs wanted vs needed
Building an OT Security Community

Case Study 2: Remote Access
 Project required collaboration from many engineers:
 Germany ­ specialist vendor expert  USA ­ specialist vendor software developer  Australia ­ experienced project team  NZ ­ client & local support (ECL)
 Too expensive to complete the project in NZ ­ would not happen  But the project was important  Solution: secure remote access
Building an OT Security Community

Case Study 2: Remote Access

 Working with client IT, developed secure remote access:

 Requirements Controls

Security

Design Architecture

 ECL project management and local engineering support

 Project was completed successfully with remote specialists contributing well

 Small change in code or configuration could be done online, remotely, securely
Building an OT Security Community

Case Study 2: The good, the bad and the ugly
 The good
 Collaboration and cooperation with client, service providers (2) and developers (2). Cost effective implementation of highly-specialist work
 The bad
 Challenges with time-zones (especially meetings or related requirements)
 The ugly
 None ­ successful project!
Building an OT Security Community

Case Study 3: Intruder
 Maintenance personnel attend substation for routine maintenance activities
 Find unauthorised, unidentified person
 Laptops, proprietary cables  Cushion, blanket
 Person calmly packs up and leaves substations
Building an OT Security Community

Case Study 3: Intruder
 The good
 Kick-started their security program ­ finally some support from management
 The bad
 Kick-started security program was ineffective ­ focus on governance/compliance not fit-for-purpose/risk-based security controls
 The ugly
 To this day, unknown person, unknown activities, unknown duration
Building an OT Security Community

NZ ICS Cyber Technical Network
 2017 `Seminar'
 3 talks
 2018 `Summit'
 5 talks + Q&A
 2019 `NZ ICS Cyber TN'
 8 events... and counting
 2019 `Summit'
 5 talks + Q&A  ... + drinks
Building an OT Security Community

Overview
 NZ ICS Cyber Technical Network
 Representatives from owners, operator and service provider organisations with an interest in ICS Cyber Security in NZ.
 An industry-led organisation established to promote the sharing and understanding of Industrial Control Systems (ICS) Cyber Security ideas in order to foster learning, development and improve cyber security maturity for NZ industrial companies.
 https://icscyber.org.nz
Building an OT Security Community

NZ ICS Cyber TN ­ Ground Rules
1. NCSC Traffic Light Protocol to be used for all information transfer
 Assume TLP: GREEN ­ Share within sector; Not public
2. Specific company standards and practices will not be shared unless approved in writing by the company.
3. No commercially or contractually sensitive information will be exchanged or discussed (although vendors may be invited to attend and describe their solutions and approaches to ICS Cyber Security).
4. The information shared is intended to educate and promote learning. The steering committee will accept no liability resulting as a use of the information or offer any guarantee of the accuracy of the information.
Building an OT Security Community

NZ ICS Cyber TN
 The good
 Building a community of `OT practitioners'
 The bad
 Driving forces can be a challenge
 The ugly
 Letting the `right' people in
Building an OT Security Community

NZ ICS Cyber TN
 By the numbers  Self-identify:
 32% as `IT'  30% as `OT'  38% as `IT, OT'
 Growth
 Up to 208 since last year
 (CS)2AI-KPMG 2020 Survey
 Trying to address #1 & #2
Building an OT Security Community

NZ Cyber Security Standard for ICS

 NCSC VCSS-CSO
1. Asset Identification 2. Security Management 3. Security Controls 4. Security Perimeter 5. Physical Security 6. Incident Reporting 7. Incident Response 8. Recovery Plans 9. Personnel & Training 10. Managing Confidentiality new 2019 11. Connected Devices & IoT new 2019

 Developed by NCSC (GCSB) and industry
 Alignment with best-practice advice from ICS vendors
 Alignment with international standards for ICS Security
 IEC-62443 Suite
 ISA-TR84.00.09 ­ SIS
 Updated 2019

Building an OT Security Community

VCSS High Level Overview
Building an OT Security Community

VCSS Overview
 Governance and Roles
 Roles and responsibilities; key stakeholders, senior leadership and third-party
 Risk Assessment and Management
 Business integration; continuous assessment and reporting; management framework
 Threat Modelling
 Threats abuse vulnerabilities of assets to generate harm for the organisation (27005)  Threat (Adversary, Likelihood); Asset (Vulnerabilities, Controls); Impact (Consequence).
 Framework and Foundational Controls
 Identify; Protect; Detect; Respond; Recover
 CIP Requirements  Assurance
 Assessments; Audits; Testing
Building an OT Security Community

Thank You!
#hallway-peter-jackson
Building an OT Security Community

