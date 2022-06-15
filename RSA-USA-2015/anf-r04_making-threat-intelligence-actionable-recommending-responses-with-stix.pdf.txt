SESSION ID: ANF-R04
Making Threat Intelligence Actionable: Recommending Responses with STIX

David McGrew
Fellow Cisco Systems @mcgrewAnalog

Jyoti Verma
Technical Leader Cisco Systems

#RSAC

#RSAC
Introduction

Security process cycle Monitoring

#RSAC
Response

Detection
3

#RSAC
Poll
 What is the mean time to detect cyber threats in your organization ?
 < 3 hours  < 3 days  < 3 weeks
4

#RSAC
Response
 Investigate
 Obtain more information about a threat
 Mitigate
 Block, but not eliminate, a threat
 Remediate
 Fix or eliminate a threat
5

#RSAC
Poll
 What is the mean time to contain/remediate cyber threats in your organization ?
 < 3 hours  < 3 days  < 3 weeks  < 3 months
6

#RSAC
Connecting analytics to response
 There may be multiple detection sources  There may be multiple response systems  A human should be in the loop
 Or have that option
 Processes should be automatable
 One-click approval
7

#RSAC
Connecting detection to response

Cloud Threat Analytics

Local Threat Analytics

Network Controller

Endpoint Protection

8

#RSAC
Threat Intelligence Aggregator

Cloud Threat Analytics

TIA
Local Threat Analytics

Network Controller
SIEM

Endpoint Protection

9

#RSAC
Threat Intelligence Aggregator

Cloud Threat Analytics

TI
TIA
Local Threat Analytics

Network Controller
SIEM

Endpoint Protection

10

#RSAC
Threat Intelligence Aggregator

Threat type Risk
Host security group Reputation

Rules Engine

Recommended CoA

11

#RSAC
Threat Intelligence Aggregator
Rule Engine

Threat type Risk
Host security group Reputation

Recommended CoA
12

#RSAC
Rules

Risk
8-9 8-9 8-9 8-9 7-8 7 6-7 6 5 3

Threat Type
malware using automatically generated domain (DGA) malware using url-string as communication channel (C&C) malware using https communication channel malware downloading suspicious file malware using repetitive requests malware downloading malicious file misuse of web proxy auto discovery protocol (WPAD) anonymization software (TOR) remote desktop connection Skype

Default Suggested Course of Action
Block compromised host Block compromised host Block compromised host Block compromised host Quarantine compromised host Quarantine compromised host Tag host as suspicious and inspect through IPS Tag host as suspicious and inspect through IPS Inspect host traffic through IPS Inspect host traffic through IPS

13

#RSAC
Manual
Incident detected Determine Course of Action Determine console to use for CoA Enter CoA data into console
Monitor
ok?
14

Manual
Incident detected Determine Course of Action Determine console to use for CoA Enter CoA data into console
Monitor
ok?

#RSAC
Semiautomated
Incident detected Approve or select Course of Action
Monitor ok?
15

#RSAC
Network actions
 Investigate  Inspect with IPS: SPAN, TAP, SDN copying or redirection  Netflow/IPFIX monitoring
 Mitigate  Perimeter blocking: BGP black hole, DNS sinkhole, ACL  Interior blocking: 802.1X Change of Authorization, ACL  Containment: VLAN tagging, SGT tagging
 Remediate  Containment to remediation server or service
16

#RSAC
Endpoint actions
 Investigate
 Scan endpoint
 Mitigate
 Kill process, Delete file
 Remediate
 Reimage host, Remove software, Reinstall software
17

#RSAC
Poll
 What response mechanisms do you use?
18

#RSAC

#RSAC
Poll
What is STIX?  Structured Threat Information eXchange  Structured Threat Information eXpression  Some Think In XML
20

What is STIX?
Incident Indicator Observable Course of Action
21

#RSAC
Tactics, Techniques, Procedures Campaign Exploit Target Threat Actor

#RSAC
Why use STIX between detection & response?
 Standard for communicating threat info between elements  Human and machine readable  Standard definitions  Normalized measures of risk and likelihood
22

#RSAC
Pros and Cons of STIX

PROS
Very comprehensive list of elements to build IoCs
Support for "free text" and comments
Integration with CAPEC and MAEC for robust IoCs
Vendor neutral

CONS Limited commercial adoption
Fairly verbose and complex schema
Course of Actions needs further definition to be useful

23

#RSAC
STIX Extensions

Extending CourseOfActionType

#RSAC

1. Expanded vocabulary with specific network action types · Block · Contain · Inspect · Packet Capture
2. Added priority for the actions

25

NetworkStructuredCOAType

#RSAC

27

BLOCK

Types: 1. Perimeter block 2. Internal block

Actions:

ACL

1. Network ACL

2. BGP black-hole

3. DNS sink-hole
ACL

What is needed to apply this rule?

 Matching traffic (5 tuple)

 Action (Alert, Drop, Deny, Log, Pass, Reject)

28

#RSAC
DNS

NetworkStructuredCOAType - Block Type

#RSAC

29

TCP, UDP, ICMP, ANY

BLOCK
Types: 1. Perimeter block 2. Internal block
Actions: 1. Network ACL 2. BGP black-hole 3. DNS sink-hole
What is needed to apply this rule?  Reflect router on which the static
route will be applied
30

#RSAC
DNS

BLOCK
Types: 1. Perimeter block 2. Internal block Actions: 1. Network ACL 2. BGP black-hole 3. DNS sink-hole
What is needed to apply this rule?  Custom DNS server
31

#RSAC
DNS

CONTAIN
Remediation: 1. VLAN Containment 2. Security Group
Tagging
What is needed to apply this rule?  VLAN Profile
VLAN Tag

Other requirements  Network infrastructure to handle VLANs VLAN
40
32

VLAN 10

VLAN 10

#RSAC
DNS
VLAN 10

NetworkStructuredCOAType - ContainType

#RSAC

33

ContainType - Remediation

#RSAC

34

CONTAIN

Remediation:
1. VLAN Containment
2. Security Group
Tagging
What is needed to apply This rule?  Security Group Profile
Security Group Tag Security Group ACL

Other requirements

 Security Group Policy enforcer

SGT

 Network devices that can handle tags 40

35

VLAN 10

VLAN 10

#RSAC
DNS
SGACL
VLAN 10

CONTAINMENT TO HONEYNET
What is needed to apply this rule?  Permissible IP list  Traffic description (5 tuple)
· Source port, Destination port, Source IP, Destination IP, Protocol
 Routes · Prefix, next hop, next hop type
36

#RSAC
DNS
Honeypot

ContainType - HoneyPot

#RSAC

TCP, UDP, ICMP, ANY
37

INSPECTION ON DEMAND

#RSAC

What is needed to achieve this?
 Inspection profile  Inspection Server  Encapsulations ­ GRE, VXLAN etc.

38

NetworkStructuredCOAType - InspectType

#RSAC

GRE, VXLAN
39

GRE, VXLAN

PacketCaptureType

#RSAC

TCP, UDP, ICMP, ANY
40

#RSAC
Workflow
Threat Analytics
TIA SIEM
API

Network Controller

Identity Services Engine

41

#RSAC
Workflow
Threat Analytics
TIA SIEM

API
1. Export incidents in a given time range

Network Controller

Identity Services Engine

42

#RSAC
Workflow
Threat Analytics
TIA SIEM

2. STIX report for exported

API

incidents with suggested

course of actions

Network Controller

Identity Services Engine

43

Workflow
Threat Analytics
TIA

SIEM
API

Network Controller

#RSAC
3. Trigger response using SIEM
Identity Services Engine

44

#RSAC
Workflow
Threat Analytics
TIA SIEM
API

4. SDN & ISE TD system responds

Network Controller

Identity Services Engine

45

#RSAC
Demonstration

Future work
Threat Analytics
TIA

6. TIA updates incident with COA Taken

Network Controller

SIEM
API

#RSAC
5. SIEM feeds back COA Taken to TIA
Identity Services Engine

47

#RSAC
Summary
 STIX can be used to recommend actionable responses  Machine readable: actionable  NetworkStructuredCOA used for investigation, mitigation, and
remediation
48

#RSAC
Apply what you have learned
 In the next week
 Identify detection and response systems within your organization that could use an actionable CoA
 Determine if those elements are using STIX
 Over the next three months
 Provide feedback to the STIX community  Experiment with STIX CoA definition and software
49

#RSAC
Thanks for your attention

#RSAC
STIX extensions
<xs:complexType name="NetworkStructuredCOAType" abstract="true">
<xs:extension base="coa:StructuredCOAType"> <xs:choice> <xs:element name="Inspect" type="network_coa:InspectType" minOccurs="0"/> <xs:element name="PacketCapture" type="network_coa:PacketCaptureType" minOccurs="0"/> <xs:element name="Block" type="network_coa:BlockType" minOccurs="0"/> <xs:element name="Contain" type="network_coa:ContainType" minOccurs="0"/> </xs:choice>
</xs:extension> </xs:complexType>
51

