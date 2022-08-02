SESSION ID: PRV-W02
Threat Modeling Privacy

Jonathan Fox
Director of Privacy Engineering Cisco Corporation

Denise Schoeneich
Privacy Engineer Intel Corporation

Jason Cronk
Privacy and Trust Consultant Enterprise Consulting Group @privacymaverick

#RSAC

#RSAC
Agenda
Privacy in Context Privacy Engineering Secure Development Lifecycle (SDL) Privacy Threat Modeling Privacy Context Diagram Privacy Requirements & Validation Hands-on Exercise

#RSAC
Privacy in Context
3

#RSAC
Confidential Information vs. Personal information

Confidential

Personal

Information Confidential Information · Inorganic Information · Organic · Agreement may be PI · PI is PI

between

whether

parties

public or not

#RSAC
Privacy can't be fixed
But that doesn't mean It's broken

It's a balancing act
· Rights of the individual
· Rights of the Organization

#RSAC
· Obligations of the individual
· Obligations of the Organization

The overlap between privacy and security risks

Cybersecurity

Risks
associated with cybersecurity incidents arising from loss of confidentiality, integrity, or

Cybersecurity related privacy events

availability

Privacy Risks
associated with privacy
events arising from
data processing

https://www.nist.gov/system/files/documents/2020/01/16/NIST%20Privacy%20Framework_V1.0.pdf. February 10, 2020

#RSAC

#RSAC
Privacy Engineering
8

#RSAC
Requirements Cross Multiple Layers...

Business Requirement

Data Requirement

System Requirement

#RSAC
Privacy Engineering Development Process

Procedures & Processes

Enterprise Goal User Goals Privacy Policy Requirements
Privacy Awareness Training Quality Assurance

Quality Assurance Feedback
Privacy Mechanisms

#RSAC
Secure Development Lifecycle (SDL)
11

#RSAC
Privacy Engineering Requires Both Quality and Security

Security Quality

SDLC/SDL

Privacy Security
Privacy

Privacy Impact Assessment

Secure Development Lifecycle (SDL) Mapped to the SDLC
SDLC Phases

Requirements Design & Develop

Validation

Deployment

Maintenance

#RSAC
Retirement

Requirements Design & Develop

Validation

Release

Sustain

End of Life

Security Requirements
Privacy Impact Assessment

Security Design Analysis & Review

Manual Code Review

Architecture Security Analysis

Dynamic Analysis

Threat Modeling

Fuzz Testing

Vulnerability scan Penetration test

Incident/Vulnerability Response
Support
Review for new functions/features

Privacy Design Analysis & Review

Privacy Verification Final Privacy Review

Monitor

Data Disposition/ Archive

SDL Phases

#RSAC
Privacy Threat Modeling

Privacy Threat Modeling

#RSAC

What is privacy?

Surveillance

Watching, listening to, or recording of an individual's activities.

Privacy Threat Modeling

#RSAC

What is a threat?

Is a bald tire a threat?
Threat
car loses traction swing breaks
Bald tire is a
Credit for example: Jack Jones of FAIR Institute

#RSAC
Risk

RISK = Likelihood of threat exploiting a vulnerability and severity of resulting consequences

(

Threats

Vulnerabilities

) Consequences

RISK

InstCatalrlaraclotcisaoemnsera

UnlBoaclkdedtirdeoor

LoSsusrvoefilcloanctreol &
Embacrrraasshsment

Primary Secondary

Privacy Controls
NIST SP 800-53 Families
· Authority and Purpose · Accountability, Audit and Risk
Management · Data Quality and Integrity · Data Minimization and Retention · Individual Participation and Redress · Security · Transparency · Use Limitation

#RSAC
Hoepman Privacy Design Strategies
· MINIMIZE · SEPARATE · ABSTRACT · HIDE · ENFORCE · DEMONSTRATE · INFORM · CONTROL

#RSAC
Privacy Context Diagram

#RSAC
Build of a Context Diagram

APAC US
EU US
APAC

E-Marketing Tools (EU)
Fitness App Backend (US)

CRM (US)

APAC

Website/eStore (APAC)

EU US

Layer in Threats
Can see users' activities on App
APAC
US
EU US
APAC

#RSAC
Data Leakage

E-Marketing Tools (EU)

CRM (US)

Fitness App Backend (US)

APAC

Website/eStore (APAC)

EU US

#RSAC
Hands-on Exercise
22

#RSAC
Threat Model CHARETTE

Scenario

Shop til' you drop
Design a supermarket app that creates shopping lists based on shopping history, maps user's path in the store, and directs user to bargains (i.e., ties into supermarket's affinity program).
· Identify three possible threats · Identify possible consequences to the individual
· Consider both primary and secondary · Identify controls to mitigate the risk
Note: Business model is advertising and data monetization

#RSAC
Apply What You Have Learned Today
Next Week you should:
­ Review your Secure Development Lifecycle (SDL) for gaps in how privacy is incorporated
In the first three months following this presentation you should:
­ Begin to fill identified gaps
Within six months you should:
­ Select a development project and create a context diagram with privacy data flows, uses, interactions, threats and controls
24

#RSAC

Resources
Annex Guide to Privacy by Design Privacy by Design Documentation for Software Engineers Version 1.0 (OASIS) Architecture of Privacy (O'Reilly Media) Core Software Security: Security at the Source (CRC Press) Linddun Privacy Threat Modeling (LINDDUN) NIST Privacy Framework 1.0 (NIST) P7002 - Data Privacy Process (IEEE Standards Association) - Under development ISO/PC 317- Consumer protection: privacy by design for consumer goods and services ­ Under development Privacy and Data Protection by Design (ENISA) Privacy Design Strategies (Institute for Computing and Information Sciences) Privacy Engineering, A Data Flow and Ontological Approach (CreateSpace) Privacy Engineering & Assurance (IAPP) Privacy Engineer's Manifesto (Apress) Strategic Privacy by Design (IAPP) Taxonomy of Privacy (University of Pennsylvania Law Review)

#RSAC

