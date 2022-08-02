Good Practices for ICS Supply Chain Risk Management
Special Expert at Cyber Tech Lab Information-technology Promotion Agency, Japan (IPA) Industrial Cyber Security Center of Excellence (ICSCoE) Hiroshi Sasaki, CISSP
© Information-technology Promotion Agency, Japan Industrial Cyber Security Center of Excellence

Self-Introduction
Hiroshi Sasaki, CISSP
Sr. Expert, Cyber Tech. Lab, ICSCoE (Industrial Cyber Security Center of Excellence since July/2017 (part-time)
IT Security Officer of Ministry of Economy, Trade and Industry (METI) since May/2016 (part-time)
Senior Security Advisor, Cyber Strategic Initiative Office, CISSP McAfee Co., Ltd. Email: Hiroshi_Sasaki@McAfee.com
Mission: To Cultivate CULTURE of Critical Infrastructure (CI) Protection/ IoT Security
Joined McAfee in December 2012 after working for 14 years as a developer of industrial control system. Aiming to foster culture of industrial cyber security, providing enlightenment such as lectures, writing and consulting services.

Agenda
· Challenges of ICS SCRM · 7 categories of the requirements for ICS supplier · Good practices of ICS SCRM in Japan
3

Challenges of ICS SCRM

ICS supply chain heavily relies on the vendor reliability and the product reliability.

Service provider

End user Finished product vendor Parts vendor Parts vendor

Organization

IT OT Product

Info
Service leakage
Production outage
Final product

Expand Malware

Leakage of design, etc.

Manufacturing

Manufacturing Manufacturing
Production outage

Assemble

Incorporate

Malicious code & vulnerability

7 categories of the requirements for ICS supplier
5

ECMSCM
Research RFP
Design Implement

Engineering Chain ManagementECM

Marketing Procurement Manufacturing

Logistics

Sell

Maintenance

Disposal

Supply Chain ManagementSCM
6

7 Categories for ICS SCRM

Security Management of Supplier
Enterprise-wide Security management
Upstream-SC
Procurement management of parts / embedded software, etc.
2nd Tier Supplier

1st Tier Supplier Development Dept.
Research
RFP
Design Implement
FAPA

ECM
Product / service development process Security management
Development environment
Security management of product / service development environment (Including human and physical security)
Product/Service Security
Product / service security specifications and testing / verification
End User

SCM

Marketing

Procure ment

Manufac turing

Logistics

Sell

Operation & Maintenance

Disposal

OT
Manufacturing equipment, personnel, etc. Security management

App

Downstream-SC

Products / services

maintenance / operation / disposal User support

7

Reference for 7 categories of SCRM

Categories

Reference

 Security Management of Supplier

NIST CSF, ISO/IEC 27001(ISMS),SANS Top 20 Critical Control, NIST SP800171, NIST SP800-53NIS Directive

 ECM

 Development Environment

 Product/Service

For IoT

For Cloud

IEC 62443-4-1, ISO/IEC 21434
NIST SP800-171, NIST SP800-53
NISTIR 8200, NISTIR 8228, NISTIR 8259(8259A), NIST Cyber-Physical Systems Framework, Considerations for a Core IoT Cybersecurity Capabilities Baseline(NIST), Cyber Security for Consumer Internet of Things(ETSI EN 303 645), IEC 62443-4-2,IEC/ISO 15408, UL2900 Series, Cyber/Physical Security Framework(CPSF, METI)*
ISO/IEC 27017, ISO/IEC 27018, ISMAP(Information system Security Management and Assessment Program), FedRAMP, NIST SP800-190 Container

 Upstream-SC  OT  Downstream-SC

NIST SP800-161, NIST SP800-171, ISO/IEC 27036, NIST CSF(v1.1), CPSF, ISO/IEC 27001(ISMS), NERC CIP CIP-013
IEC 62443-2-1(CSMS), IEC 62443-3-3, NIST CSF, NISTIR 8183, NIST SP80082, NIS Directive, Good Practices for Security of Internet of Things in the context of Smart Manufacturing(ENISA),
IEC 62443-2-1(CSMS), ISO/IEC 21434, NIST CSF

*CPSF:Cyber/Physical Security Framework (CPSF) : https://www.meti.go.jp/english/press/2019/0418_001.html

8

Good practices of ICS SCRM in Japan
9

Security questionnaires for suppliers
 A template for security in the supply chain as baseline  "Requirement" in the supply chain between the manufacturer and the supplier  The answer for the questionnaire would be useful for the Manufacturer to determine
"the supplier's trustworthiness" and "how supplier's in the value chain have the same trustworthiness level"
Global Trusted Security Infrastructure

Supplier B
Trustworthiness :Low

Supplier A
Trustworthiness :High

Online Procurement
Digital Agreement Purchase Order

Manufacturer Y
Trustworthiness :High

5

Select requirements in RRI questionnaire from CPSF

The total number of requirements in CPSF are 104

NIST CSF

METI/CPSF

Identity

Protect

15 items

Detect
Respond/ Recovery
6

Select requirements in RRI questionnaire from CPSF
I Why we had chosen METI CPSF (Cyber Physical Security Framework) as baseline:
· CPSF provides cybersecurity requirements focused on communications between companies and/or organizations categorized as 3 levels,
- The 1st layer ,The 2nd layer, The 3rd layer and six elements (organization, people, component, data, procedure and system).
· CPSF provides informative references of other standards (e.g. NIST CSF and IEC 62443) on each requirement and this information supports our tasks.
· CPSF is enterprise-wide security framework and security requirements are described for each entity in a company.

The 1st layer (Connections between organizations in physical space)

The 2nd layer (Mutual connections between cyberspace and physical space)

The 3rd layer (Connections in cyberspace)

The Cyber/Physical Security FrameworkCPSF https://www.meti.go.jp/english/press/2019/pdf/0418_001a.pdf

7

Select requirements in RRI questionnaire from CPSF II. How we had prioritized requirements and selected 15 requirements is: · Security requirements that we have already achieved in our companies. · Security requirements that we require for product/system suppliers at least. · Security controls in operation, management processes and organization. (Technical security controls are out of scope because they depend on products) · High(Policy)-level security requirements in the security risk management process.
8

Additional requirements

Needs

Market

Order

Supply

Enhancement of Product Value

Dev. Dev. Env.

Manufact uring
Procure ment
IACS

Logistics

Operation &
maintenance

Product Organization

Manufacturer

Requirements

Order

Supply

Enhancement of Product Value

Dev. Dev. Env.

Manufact uring
Procure ment
IACS

Product

Logistics

Operation &
maintenance

Organization

Supplier

*IACS(Industrial Automation and Control System)

*Dev.(Development)

*Env.(Environment)

Selected category for questionnaire

I We added additional requirements -development, -development environment, -procurement, -Operation & maintenance(O&M) from the viewpoint of product life cycle. e.g.) IEC 62443 2-1,2-4,4-1
II. How we had selected additional requirements is -already implemented by us -appropriate to request the requirements to
suppliers -not technical but managing/operational -not too specific but moderately general
12

Questionnaire in-practice- Example

Category

(5) Manufacturing site security - 1

Security requirement

Have you created a list of the hardware and software that make up the system and its management information? And is it properly managed?

evidence


1)Including, but not limited to, an electronic or written list of assets, 2)including asset names, versions, network addresses, administrative responsibility,
licensing information, and locations; operational policies, 3)including transportable media; asset bail line configuration and audit rules; automatic
asset discovery and removal mechanisms; and more.
Assets are identified, listed and prioritized according to their priority.
Implemented Planned to be implemented Not applicable

Example : Answer

Maturity level

Maintain the asset list by regularly reviewing and updating it. Control and limit the use of portable media. Prohibit the removal of highly sensitive data.

Implemented Planned to be implemented Not applicable

The asset list is updated in real time. Regular audits for compliance with the organization's defined baseline structure. A mechanism is in place and operational to automatically detect
 and remove unauthorized assets.

Implemented Planned to be implemented Not applicable

13

Supply-Chain Cybersecurity Consortium

· The industry-wide movement to practice the Basic Actions Guideline and strengthen cybersecurity of entire supply chains by both large enterprises and SMEs

1. Commitment to the Basic Actions
Guideline

Supply-Chain Cybersecurity Consortium (SC3)

Basic Actions Guideline

General Assembly
Held annually, report from WGs, decision making on important topics etc.
Steering Committee

Organizer: IPA

SME WG

Regional security community
development WG

Human resource development WG



2. Support to SMEs by encouraging to use Cybersecurity Supporters etc.

Make appeals

of reliability of

SMEs

the company

Business partners (large enterprises)

16

Reference) 15 items of RRI questionnaires
17

Selected 15 security requirements for suppliers from CPSF

CPS.AM-1 (Asset Management)

Document and manage appropriately the list of (e.g. name of asset, version, network address, components in the system.

hardware and name of asset

software, manager,

and management information license information) of

CPS.GV-1 (Governance)

Develop security policies, define roles and responsibilities for security across the organization and other relevant parties, and clarify the information-sharing method among stakeholders.

CPS.RA-1

Identify the vulnerability of the organization's assets and document the list of identified vulnerability with

(Risk Assessment) the corresponding asset.

Identify

Confirm the implementation status of the organization's' cyber security risk management and

CPS.RM-1

communicate the results to appropriate parties within the organization (e.g. senior management). Define

(Risk Management the scope of responsibilities of the organization and the relevant parties (e.g. subcontractor), and

Strategy)

establish and implement the process to confirm the implementation status of security risk management

of relevant parties.

CPS.SC-1

Formulate the standard of security measures relevant to the supply chain in consideration of the

(Supply Chan Risk business life cycle, and agree on contents with the business partners after clarifying the scope of the

Management) responsibilities.

*CPSF description(need to revise as questionnaire description) https://www.meti.go.jp/english/press/2019/pdf/0418_001b.pdf

9

Selected 15 security requirements for suppliers from CPSF

CPS.AC-1 (Identify Management
Access Control)

&

Establish and implement procedures to issue, manage, check, cancel, and monitor and authentication information of authorized goods, people, and procedures.

identification

CPS.AT-1 (Awareness &Training)

Provide appropriate training and education to all individuals in the organization and manage the record so that they can fulfill assigned roles and responsibilities to prevent and contain the occurrence and severity of security incidents.

CPS.DS-1 (Data Security)

If the organization exchanges protected information with other organizations, agree in advance on security requirements for protection of such information.

Protect

CPS.IP-1 (Information Protection Process & Procedures)

Introduce and implement the process to manage the initial setting setting change procedure for IoT devices and servers.

procedure

(e.g., password)

and

CPS.IP-9 (Information Protection Process & Procedures)

Include items concerning security (e.g., deactivate when roles change in due to personnel transfer.

access

authorization

and

personnel

screening)

CPS.MA-1 (Maintenance)

Discuss the method of conducting important security updates and the like on IoT devices and servers. Then, apply those security updates with managed tools properly and in a timely manner while recording the history.
Introduce IoT devices having a remote update mechanism to perform a mass update of different software programs (OS, driver, and application) through remote commands, where applicable.
10

Selected 15 security requirements for suppliers from CPSF

CPS.AE-1

Establish and implement the procedure to identify and manage the baseline of network operations and

(Anomalies & Events) expected information flows between people, goods, and systems.

Detect

CPS.CM-1 (Security Continuous
Monitoring)

Conduct network and access monitoring and control at the contact points between corporate networks and wide area networks.

CPS.DP-1

Clarify the role and responsibility of the organization as well as service providers in detecting security

(Detection Process) events so that they can fulfill their accountabilities.

Respond / Recover

CPS.RP-1

Develop and implement previously the procedure of response after detecting incidents (security

(Response Planning) operation process) that includes the response of Organization, People, Components, System to

(Recovery Planning) identify the content of response, priority, and scope of response taken after an incident occurs.

11

