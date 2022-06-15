Messaging Lessons-Learned
16 February 2016
Kim Watson Kimberly.Watson@jhuapl.edu

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

Experimentation Result
 Integration of sensors to the message bus only required "shimming"
 Typical standard process for integration, nothing abnormal  Transforms data between application native format and Common
Event Format (CEF) if necessary  Transports data in/out of the message bus
The Sensor Actuator Interface is the right level of abstraction
4

Lessons Learned
 Message Fabric
 Products and applications did not need to know about each other or be pairwise integrated to be added into the environment
 Sensor/Actuator Integration
 Cybersecurity tools did not have a common interface, data model, or trust model
­ The site or the vendors must perform the integration and associated management functions
­ Significantly limits the products and applications that can be included in any enterprise
Message Buses support Scalability, Interoperability, and Simplicity

Implications of Lessons Learned
 There is potential value in using a message bus when your environment includes:
 Multiple consumers  Large scale integration  Dynamic environments  Extensive network connectivity
 Sustainable and extensible SRCE components need to have common or standardized connectors and data formats
 Standards are not required internal to a single enterprise if the site is willing to be limited by vendor integration

Implications for SRCE
 Long Term Need: A common message fabric with standard message sets, services, and interfaces
 Short Term: Common Connector
­ Products and applications come with at least one of a small set of ways to "plug" into message bus instances
­ May not need to be standardized as much as a small list where vendors must support at least one
 Short Term: Initial common data model
­ Cyber Alerts and Response Actions
Standardization offers more flexibility and avoids significant custom integration

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

