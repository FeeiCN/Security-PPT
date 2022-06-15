SESSION ID: SEM-M04D
Common Security Frameworks
Kathleen M. Moriarty
Global Lead Security Architect Dell EMC Office of the CTO @KathleeMoriarty

#RSAC

#RSAC
Frameworks in Context of Business and Risk Tolerance

Frameworks to manage policy considering risk
Governance
· Policies and Standards · Data Classification (Confidentiality, Integrity, Availability) · Service Level Requirements & Decision Model · Transparency
Information Management
· Taxonomy · Data Classification · Meta-Data Assignment · Policy Enablement · Application & Storage Location
Enabling Technology and Processes
· Encryption · Automated control management · Access Controls & Permission Mgmt, DRM, DLP · Legal Hold, eDiscovery ECA and Production · Records and Information Lifecycle Management, Archive · Business Continuity and Disaster Recovery

#RSAC

#RSAC
NIST SP800-37 Risk Management Framework

#RSAC

NIST CyberSecurity Framework version 1.1

· Recovery Planning · Improvements
· Response Planning · Communications · Analysis · Mitigation · Improvements

Recover Respond

Identify Protect

· Anomalies and Events · Security Continuous
Monitoring · Detection Processes

Detect

· Asset Management · Business Environment · Governance · Risk Assessment · Risk Management Strategy · Supply Chain Risk Management
· Identity Management, Authentication, and Access Control
· Awareness and Training · Data Security · Information Protection Processes and
Procedures · Maintenance · Protective Technology

#RSAC
Security and Privacy Controls for Federal Information Systems and Organizations: NIST SP 800-53

#RSAC
ISO 27000 and Control Automation

ISO 27002 Control Domains

4

Risk Assessment and Treatment

5

Security Policy

6

Organization of Information Security

7

Asset Management

8

Human Resources Management

9

Physical and Environmental Security

10

Communications and Operations Management

Security Automation

Information Feeds Vendor Supplied Organization

Vulnerability

Updates

Assets

Incident

Expected Behavior

Controls Events Reporting

11

Access Control

12

Information Systems Acquisition, Development and

Maintenance

13

Incident Management

14

Business Continuity

15

Compliance

Security Assessments mapped to holistic controls in framework enables:
­ Transparency of IT and security posture ­ Risk understanding and prioritization ­ Comparison of security for multiple environments ­ Regulatory and policy compliance reporting

Note: Framework interchangeable with other frameworks or regulations

GRC Automation

TT rr aa nc se pa ab ri el ni ct y y

Finance & Business Operations

GRC Dashboards

Legal & Compliance

Information Technology

Security

Goals/Objectives Measure and assess

Policy/Guidelines SLAs and Reports

Business processes Incident Management

Risk Control Frameworks, Standards & Libraries

Control Validation Evidence, Transactional Data, KPIs, Events, Operational/business/ legal Environment

#RSAC
Service Provider Enterprise

Protocol evolution driving change
5 year outlook
· Increased deployment of encryption · Stronger encryption
Trends · Data Centric Computing (Zero Trust)
· Shift control management to vendors/manufacturers · Monitoring shifts to the endpoint · Centralization of control management
Impact · Reduced ability to monitor on the network

#RSAC

Transport Encryption Evolving

TLSv1.3
IMPROVED PROTECTION AGAINST INTERCEPTION
· Public-key exchange mechanisms provide forward secrecy
· More secure key exchange based on the Elliptic Curve Diffie-Hellman algorithm
· Static RSA and Diffie-Hellman cipher suites deprecated
· Supported symmetric algorithms are Authenticated Encryption with Associated Data (AEAD)

TCPcrypt
· Opportunistic security applied to TCP
· Header in clear text
· Eases configuration automation
· Used with TCP Encryption Negotiation Option (TCP-ENO)

QUICK UDP INTERNET CONNECTIONS (QUIC)
· QUIC protocol is UDP-based · Provides stream-multiplexing · encrypted transport protocol · Uses TLSv1.3 used by default

#RSAC

#RSAC
Reducing Risk Considering Scale
Control management must scale to be effective
Automate control management according to policy
Automate security functions where possible
­ Automated Certificate Management Environment (ACME) ­ Manufacturer Usage Description (MUD) ­ Software Updates for Internet of Things (SUIT) ­ YANG ­ Security Content Automation Protocol (SCAP) ­ Common Information Model (CIM)
Hybrid computing models
­ Organization's Data Center ­ Zero Trust
o Outsources control management and o Centralizes analysts assisting with scale

#RSAC
Apply
Immediate
­ Evaluate current policies, procedures, and guidelines look for automation possibilities
­ Research automation options for your environment (YANG, SNMP, OVAL, NETCONF/RESTCONF)
Three months to two years
­ Implement automated controls where possible ­ (SCAP, MUD, etc.) ­ Move to continuous audit cycles (automated and manual)
One to two year progression
­ Migrate to more secure transport encryption options ­ Implement strong authentication for data centric security models ­ Reduce overall risk posture and management

Thank you!
Kathleen.Moriarty <at> dell.com @KathleeMoriarty

