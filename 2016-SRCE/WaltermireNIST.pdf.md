Ongoing Security Automation
Standardization Efforts
David Waltermire National Institute of Standards and Technology

Goals

 Define standard protocols and data formats for architectural components
 Provide ongoing awareness over the constantly changing state of endpoints
 Detect endpoint changes in cyber-relevant time
 Enable information sharing within organizations:
 Support multiple operational and security processes  Inform courses of action ­ Patch, Configure, Block  Identify indicators of compromise ­ Find and prevent
malicious software from executing
 Leverage existing standards where possible

SRCE Message Fabric Focus Group

2/16/2016

2

Key Questions to Address
 What endpoints are connected to the network?  What software and patches are deployed on a given
endpoint?  How is this software configured?  Has an important change in the software load or
configuration occurred?  What implication does this have for the observed
behavior of the endpoint?

SRCE Message Fabric Focus Group

2/16/2016

3

Working in the IETF
The Security Automation and Continuous Monitoring (SACM) Working Group

SRCE Message Fabric Focus Group

2/16/2016

4

Current Focus: Enterprise Vulnerability Assessment
 Mechanisms to support online collection of endpoint software inventory
 Supports management of software patches and updates
Needed capabilities:  Endpoint Identification  Ongoing exchange of software inventory, open ports,
enabled services  Use of vulnerability alerts to determine vulnerable
endpoints based on software load Future focus on Configuration Management and automating Courses of Action (CoA).

SRCE Message Fabric Focus Group

2/16/2016

5

Building on Existing Standards: The IETF NEA Architecture

Posture Collectors

Posture

PA

Validators

Posture Broker Client

PB

Posture Broker

Server

Posture Transport Client
NEA Client

PT-TLS

Posture Transport Server
NEA Server

SRCE Message Fabric Focus Group

2/16/2016

6

NEA Standards
The Network Endpoint Assessment (NEA) stack includes:  The Posture Broker (PB) protocol
 A generalized client/server protocol to communicate endpoint posture
 Leverages TLS for the underlying transport (PT-TLS)
 The Posture Attribute (PA) protocol
 Supports information exchanges between collectors and validators
 Allows extensible message types

SRCE Message Fabric Focus Group

2/16/2016

7

Additional Trusted Computing Group (TCG) specifications

Posture Collectors

SWID Messages for PA PA

Posture Validators

IF-IMC

IF-IMV

Posture Broker Client

PB

Posture Broker

Server

Posture Transport Client
NEA Client

PT-TLS

Posture Transport Server
NEA Server

SRCE Message Fabric Focus Group

2/16/2016

8

Use of IF-IMC & IF-IMV

IF-IMC: Standardizes how collectors are registered and communicated with
 PB Client can find and load new collectors
 PB Client can provide information to collectors so they can change their behavior

IF-IMV: Standardizes how verifiers are registered and communicated with
 PB Server can find and load new verifiers
 PB Server can provide information to verifiers so they can change their behavior

SRCE Message Fabric Focus Group

2/16/2016

9

Use of SWID Tags

Release

Install

Maintain

Uninstall

SWID tags enable:
 High-fidelity software metadata provided by vendors

Publisher releases software

 Platform-neutral, standardized software inventory
 Integration of data and process verticals

Servers
Network Infrastructure
Devices

 Automation and innovation supporting risk-based management of software

Workstations
Mobile Devices

Organization installs new
software

Installation of patches and
updates

Standardized Protocols

Standardized Protocols

Collected Software Inventory

Organization retires
software
License Management
Software Assurance
Configuration Management
Change Control
Vulnerability Management

SRCE Message Fabric Focus Group

2/16/2016

10

Development of NISTIR 8060 Identification Tags

NISTIR 8060: Guidelines for the Creation of Interoperable Software Identification Tags
 Provides guidelines for creating SWID tags that support cybersecurity use cases
 Use case driven:
 Continuously monitoring software inventory
 Identifying vulnerable endpoints  Ensuring products are properly patched  Integrity measurement of installation packages and
installed software
 Preventing execution of tampered software

SRCE Message Fabric Focus Group

2/16/2016

11

TCGs SWID Messages & Attributes for IF-M
 Supports the maintenance of an enterprise repository of software inventory data
 Allows reporting full and delta software inventories using SWID tags
 Allows establishing subscriptions to monitor aspects of endpoints software inventory
 Detects updates to SWID tag repository on client machine, and update server
 Allows the server to query about SWID tag state

SRCE Message Fabric Focus Group

2/16/2016

12

The TCG Endpoint Compliance Profile

Posture Collectors

SWID Messages for PA PA

Posture Validators

IF-IMC

IF-IMV

Posture Broker Client

PB

Posture Broker

Server

Posture Transport Client
NEA Client

PT-TLS

Posture Transport Server
NEA Server

SRCE Message Fabric Focus Group

2/16/2016

CMDB
13

The need for a Message Fabric

NEA Server CMDB

?

Sensors
Policy Enforcement
& CoA
Analysis and Admin
Consoles

SRCE Message Fabric Focus Group

2/16/2016

14

Questions and Discussion

 Counting endpoints and having basic knowledge of their state is common theme of compliance and control frameworks (e.g., FISMA, SOX, HIPPA). Do your customers see this the same way?
 How do you see a message fabric fitting in with this architecture?
 Do you envision other uses of endpoint software inventory and configuration information? How could a message fabric support these uses?

David Waltermire
Security Automation Team
Computer Security Division
Information Technology Laboratory
National Institute of Standards and Technology
david.waltermire@nist.gov

SRCE Message Fabric Focus Group

2/16/2016

15

