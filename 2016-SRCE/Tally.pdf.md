Application of Message Fabrics to SRCE Systems
16 February 2016
DISTRIBUTION STATEMENT A APPROVAL FOR PUBLIC RELEASE: DISTRIBUTION IS UNLIMITED
Based on work funded by the Department of Homeland Security
Gregg Tally Gregg.Tally@jhuapl.edu

Message Fabrics in SRCE Context

Presentation and Ops Services

Secure Orchestration, Control, Management
Repositories

· Focus on the messaging within an enterprise in support of security operations automation and interoperability
· Enables secure, timely, and loosely coupled communication
Context

Response Actions
COAs Bus Rules
Analytics
Data Feeds Content

Visualization Analytics/Workflow Development
Management Interface

Actuator IFs
Response Controllers
DM Engine
SM Analytic Framework
Sensing I/F Services

Boundary Protections
Network Protections
Host Protections Defense Services

Control Message Infrastructure

Information Sharing Infrastructure
Sharing Infrastructure Trust Services:
Security, Identity, Access Control
2

Challenges that Benefit from Message Fabric
 Enterprises will deploy components developed by vendors that may not have performed pairwise integration
 Vendor component capabilities will evolve independently over time
 Enterprises have diverse deployment topology and distribution requirements
 Sensor activity will occur at variable rates, with peaks, lulls

Implied SRCE Design Requirements
 Distributed, asynchronous message processing
 Permits faster message producers to proceed without waiting for slower consumers
 Allows message consumers to catch-up during the lulls
 Minimal coupling between message producers and consumers
 Rely only on common data representations and message bus interface
 Facilitate integration of components from independent vendors
 Backward compatibility of message formats
 Eliminate need for coordinated upgrades across components

Message Fabric Centralized Service Orchestration Approach

Boundary Protections
Network Protections
Host Protections

Sensor Data
S/A Control/Data Channels
Actuator Cmds

Sensor/Actuator Interface

Sense-Making
Analytic Content Framework
Analytics

Defense Services

Control Message Infrastructure Message Bus

Response Actions Cyber Events

Cyber Events, Shared Analytics
Cyber Alerts

Presentation & Ops Services

Interoperability requires standardized: · Service definitions · Message content · Message transport · Content formats

Status
Configuration Directives

Secure Orchestration, Control, Management

Response Actions, Information Sharing Actions
Course of Action

Course of Action

Shared Indicators

Shared COAs, Indicators,

Analytics

Cyber Alerts

Cyber Events,

Shared COAs, Indicators

Shared COAs

Shared Indicators

Analytics

Enterprise Perimeter

Response Controller

Repositories

Decision-Making Engine

Log Data Intel
Configuration Blackboard

Content COAs
COA Policy Mission Models

Information Sharing
Infrastructure

External Sharing I/F
Community Data Channel

Community Coordination
Channel

External Data Feeds
Trusted Cyber Services Trusted Information Sharing

Trust Services: Security, Identity, Access Control

Message Fabric Decentralized Service Orchestration Approach

Boundary Protections
Network Protections
Host Protections
Defense Services

Sensor Data

Sensor/Actuator Interface

S/A Control/Data Channels
Actuator Cmds

Secure Orchestration, Control

Response Actions

Cyber Events

Sense-Making Analytic Content
Framework
Analytics
Secure Orchestration, Control
Cyber Events, Shared Analytics
Cyber Alerts

Presentation & Ops Services

Same interoperability requirements as in centralized approach

Secure Orchestration, Control
All Messages
Configuration Directives

Control Message Infrastructure
Message Bus

Response Actions, Information Sharing Actions
Course of Action

Course of Action

Shared Indicators

Shared COAs, Indicators, Analytics

Cyber Alerts Shared COAs

Cyber Events, Shared Indicators

Shared COAs, Indicators Analytics

Enterprise Perimeter

Secure Orchestration, Control
Response Controller

Secure Orchestration, Control
Decision-Making Engine

Repositories
Log Data Intel
Configuration Blackboard

Content COAs
COA Policy Mission Models

Secure Orchestration, Control

External Sharing I/F

Information Sharing
Infrastructure

Community Data Channel

Community Coordination
Channel

External Data Feeds
Trusted Cyber Services Trusted Information Sharing

Trust Services: Security, Identity, Access Control

Message Content
Sensor Actuator Interface
Sensors and actuators have translators and managers that bridge the proprietary interfaces (Raw Sensor Data) to the standard Control Message Infrastructure format (Cyber Events)

Sensor/ Actuator Control
Raw Sensor Data

Op. Admin Status Info

Sensor/ Actuator Manager

Sensor/ Actuator Translator

Sensor/ Actuator Publisher

Cyber Event

Response Action

Message Content
Sense Making Analytic Framework

Cyber Event Intel Data
Performance Mgmt Repo Update

Evaluators use analytics to assess Cyber Events against Intel Data, determine if a Cyber Alert should be generated or if the Cyber Event requires further analysis
Cyber Event or Cyber Alert

Evaluator

Analytic Rule Set

Analyst I/O Shared Analytics

Analytics Manager

Message Content
Decision-Making Engine

Given a Cyber Alert or Cyber Event, DM-Engine determines a course of action (COA) to minimize risk while considering mission impact of the alternative COAs
Cyber Alert Cyber Event

Op. Auth I/O

Mission Manager

Op. Auth. Selection

Selector

Inference Engine
COA Policy Model

Mission Models Repo
COA Manager

Operations Authority I/O

Course of Action

Message Content
Response Action Controller
Selected COAs (Couse of Action), with parameters for targets and other options, converted to specific Workflows containing Sensor/Actuator Control Info for execution

Course of Action
Subscribed Event Notice

COA to Workflow Translator
Workflow
Workflow Engine
Characterizer

Op. Admin Status Info
Response Actions
Notice to Operational Authority Share Request/ Status*

* Incoming status includes Tip/Event/COA sharing notice

Messaging Attacks and SRCE

Attack Vectors

Example SRCE Outcome

Message Replay CoA enabled when not authorized, potentially

causing network disruption

Mitigation May Include
Signed messages with timestamp

Malformed Data (e.g. buffer overflow)

Response Controller could be affected by malformed data, allowing attacker undetected high privilege access

Whitelisting signed recipients, strong type/field checks

Man-in-the-Middle Message flooding

A malicious party may intercept sensor data and Mutual authentication

replace it with recorded sensor output that

appears normal, while actual abnormal sensor

data is inaccessible to SRCE

Critical third party services may be rendered Upstream high-speed dynamic

inaccessible if malicious party directs high

filtering, use of efficient signing

bandwidth resources appropriately

mechanisms (e.g., HMAC)

Spoofing

Malicious party receives sensitive analytics that Use of strong key management

can be used to develop stealth tactics

or strong CA capabilities

Passive Eavesdropping

Indicators and COAs for a particular attack are learned by an adversary leading to changes in the attack vector to bypass the described mitigations

Use of strong confidentiality mechanisms

Potentially Relevant Standards Efforts
 Message Transport
 Advanced Message Queueing Protocol (AMQP) from OASIS  Data Distribution Services (DDS) from Object Management Group
 Message Content
 Common Event Format (CEF) from HP ArcSight  Incident Object Description Exchange Format (IODEF) from MILE  Reporting Formats in Security Content Automation Protocol (SCAP)
from NIST  Open C2 from Open C2 Working Group
 Security
 DDS Security v1.0 Beta 1
 IETF Working Groups
 Security Automation and Continuous Monitoring (SACM)  Managed Incident Lightweight Exchange (MILE)  DDoS Open Threat Signaling (DOTS)

Summary
 Interoperability requires standardized:
 Service definitions  Message content  Message transport  Content formats
 Connects the core services supporting Sensing, Sense Making, Decision Making, and Acting
 Can support centralized, decentralized, or hybrid orchestration models
Specifications are to be determined

