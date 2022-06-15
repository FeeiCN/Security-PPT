OCT 3, 2018

A JOINT EFFORT TO ENABLE CYBER SECURITY
Joe Brule and Mike Ridge

Agenda
2
 Overview
 OpenC2  JCAUS
 Prototype Implementations
 OpenC2 Efforts  JCAUS Efforts  Joint Effort
 Findings  Way forward for JCAUS/OpenC2
2

So How's It Working Out For You?
3
 Cyber Attacks
 Sophisticated
 Adaptive  Automated
 Occur in Seconds
 Cyber Response
 Slow  Manual
 Current State:
 Global Attack Surface  Attackers Operating at Machine Speed  Defenders Utilizing Statically Configured Point Defenses
3

Integration in the Absence of Standards
4
4

What Can Go Wrong?
5
5

OpenC2 is Part of a Bigger Picture
6
 STIX
 Standard Threat INTEL object  Supports Analysis
 MQTT
 Standard Transfer Protocol  Supports Pub/Sub Architecture
 OpenC2
 Standard Command Language  Supports Acting/ Response
OpenC2 is part of a Suite of OASIS Standards

JCAUS
Joint Communications Architecture Unmanned Systems
7
The JCAUS Architecture concept is based on industry and open standards. The JCAUS team seeks to select industry standards and adopt industry best practices to refine its exiting framework and to define an architecture
7

OpenC2 in Networks and Beyond
8
 Deny
 Firewalls will interpret as a Rule (multiple examples)  Routers will interpret as ACL (Cisco CTIA)  Severs will interpret as permissions
 Locate
 LYCAN use case returns GPS coordinate for an IP
 Allow
 Mathematical compliment for Deny
What will Unmanned Platforms do with these?

Distributed computing w/ Docker
9
9

OpenC2 Implementation for JCAUS
10
10

11
11

Array of Monopole Antennas
12
12

Maintain RF Situational Awareness
13
 Scenario: Concern that a burst SOI may be operating in the vicinity
 OpenC2 commands to establish an array of antennas
 Issue SYNC {list of identifiers}
 Instructs UAV's to fly in formation  UAV's `elect' designated router  Responds with Designated router
 Issue COPY {RF range, duration}
 End State:
 An Array of Monopole Antennas maintaining a copy of collected signals over the past two seconds
SYNC: Synchronize a sensor or actuator with other system components COPY: Duplicate an object, file, data f1l3ow or artifact.

Event: Signal of Interest Identified
14
 Option A: Central analytic
 Each UAS provides the TOA and Position for the SOI
 Offline Analytic determines location
 Option B: Distribute Analytic across UAVs
 Each formation calculates the LOB and reports
14

Determine Emitter Location
15
 OpenC2 Commands to acquire Line of Bearing
 Issue `SCAN {SOI}' to UAVs
 Nodes review past two seconds and respond with TOA and coordinates
 Issue `LOCATE {matrix}' to ISR analytics
 Returns coordinates of emitter
 Alternative OpenC2 Commands (low SNR environment)
 Issue `REPORT {SOI, LOB} to designated router
 Issues SCAN to each UAV  Distributed Matrix calculations for n-channel DF  Designated router returns LOB and coordinates of origin
SCAN: Systematic examination of some aspect of the entity or its environment in
order to obtain information.
LOCATE: Find an object physically, logi1c5ally, functionally, or by organization.

Other Scenarios
16
 Avoid Radar Detection: Analytics have determined that a potential adversary is using a radar signal to determine the physical location of the task force
 Issue DENY [center freq, rule_number]
 The UAV's emit a radar jamming signal
 Issue DELETE [rule_number]
 Include Other Sensors: Unmanned platforms based from an adjacent carrier group is providing ISR
 Allow [list identifiers] to the ingress of the draper tool providing key management
 The TRANSEC key is provided to the peer task force
16

Findings
17
 Maintained Separation of Concerns  Agnostic of Topology
 STAR utilizing HTTPS  Pub/sub utilizing MQTT
 Agnostic of serialization
 JSON, CBOR
 Same `Strategic' effect achieved from the commands
 Deny [RF ] (Jamming signal sent)  Allow [asset_id] (Provide TRANSEC key)  Locate [RF signal]
 Scan [SOI] returns TOA and GPS coordinate  N-channel array provides line of bearing
17

Status of OpenC2 TC
18
 Language Specification
 Final issues worked out at Oct 1,2 F2F  To be released for Public Comment October 17
 Actuator Specifications
 StateLess Packet Filter Profile (October 4)  Stateful Packet Filter  Endpoint Remediation  SDN Controller
 Transfer Specifications
 HTTP/TLS (October 4)  OpenDXL  CoAP
18

Status of JCAUS
19
 The DoD plans to apply learnings into a series of unmanned vehicle systems
 Air, Land, Maritime  Contracts moving independently with top level
oversight.  Baked into the 2017-2042 Unmanned Systems
Integrated Roadmap as part of the Open Systems Architectures.
https://www.efadrones.org/wp-content/uploads/2018/09/UAS-2018-Roadmap-1.pdf
19

Collaborative Efforts
20
 Specific Engagements with students:
 University of Illinois, Urbana  University of Massachusetts, Lowell  MIT  Northeastern  NYU  University of Pennsylvania
 Spring project specifically with Northeastern
20

Moving Forward
21
 Joint NSA/ Draper
 Actuator Profiles:
 Intelligence Surveillance and Reconnaissance  Electronic Warfare
 Integration of Unmanned Platforms  Integration of Tactical and Strategic Key Management
 Request of Stakeholders
 Identify Use Cases  Create Custom Actuator Profiles  Identify Message Fabric
21

22
Thank you! Questions?
22

Backup
23
23

OpenC2 Codebases:
24
 Lycan Series
 Translation of OpenC2 JSON to objects and back  Python, Java and BEAM
 OCAS
 Simulator to validate and verify OpenC2 interface
 Python API's
 OpenC2 API to accept & Convert OpenC2 commands to Python  Yuuki and Orchid are codebase  Reactor Master and Reactor Relay are Deployed
 OpenC2 Serializations
 JSON (mandatory to implement)  CBOR & Protobuf  XML

