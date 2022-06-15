SESSION ID: LAB3-W13
Securing The Industrial IoT: A Deep Dive into the Future
#RSAC

Hamed Soroush, Ph.D
Senior Research Security Engineer Real-Time Innovations (RTI) @HamedSoroush
Gerardo Pardo, Ph.D
Chief Technology Officer Real-Time Innovations (RTI)
Rose Wahlin
Principal Software Engineer Real-Time Innovations (RTI) @ProjectDerby

#RSAC
Outline
Medical IoT: Need for More Safety & Security Hacking Integrated Clinical Environments: A Demo Need for granular security
Introduction to Data Distribution Service (DDS) DDS Security: Design, Rationale, Hands-On Exercises Concluding Remarks
2

#RSAC
Medical IoT: Opportunities & Challenges
Need for Improved System Integration, Device Interoperability, and Granular Security

#RSAC
What Is Wrong In This Picture?
4

#RSAC
What is Wrong With These Stats?

2013: 210,000-440,000 hospital patients suffer from preventable harm contributing to their death, making it the third leading cause of death after heart disease and cancer 1999: 98000 deaths per year due to mistakes in hospitals
5

2010: Bad hospital care contributed to 180,000 patient deaths in Medicare alone

#RSAC
PCA Safety: Current State
Current State of Patient Controlled Analgesia
6

#RSAC
And It Gets Worse...
7

#RSAC
And Worse...
8

#RSAC
Medical IoT Will Change All This
Hopefully...
9

#RSAC
Integrated Clinical Environment (ICE)
Automatic Discovery
Fully Peer-to-Peer Multicast Support
QoS Control: e.g. Timing, Reliability, Ownership, Redundancy, Filtering, Granular Security
10

#RSAC
Protecting Communications
Protecting ICE Communications at Transport Level
TLS or DTLS Not sufficient in many cases due to lack of granular security
Fine-grained Security for ICE (and other IoT Systems)
These approaches will be covered in more detail later in this talk
11

#RSAC
Why Fine Grained Security?
A Demo

#RSAC
Introduction To Data Distribution Service
Gerardo Pardo, Ph.D
Chief Technology Officer Real-Time Innovations (RTI)

#RSAC
14

#RSAC
Industrial IoT Key System Characteristics
Large scale, heterogeneous, built with multi-vendor components, often broadly distributed and evolving
Reliability Scalability Safety Security Resiliency
15

#RSAC
Industrial vs. Consumer IoT
Moore's Insight Report, 2014

Interaction Style

Event Driven, Pub-Sub
16

Request / Response

Data-Centric is Different!

Point-to-Point Client/Server

Brokered Publish/Subscribe
Queuing

Broadcast Publish/Subscribe

#RSAC
Data-Centric Publish-Subscribe

Brokered ESB
Daemon

TCP, REST, WS*, OPC MQTT, XMPP, AMQP
17

Fieldbus, CANbus

Shared Data Model
DataBus
DDS

#RSAC
Data-Centric Middleware Standards

#RSAC
OMG Compliant DDS: Data Centric Messaging

2008
UML DDS Profile

2009
DDS for Lw CCM

2010 2012

DDS

DDS-STD-C++

X-Types DDS-JAVA5

2013 Web-Enabled DDS

2014 DDS
Security

2014 RPC
over DDS

App
DDS Implementation

2004 DDS Spec

App

2006 DDS Interoperablity

DDS Implementation

Network / TCP / UDP / IP / SharedMem / ...

App
DDS Implementation

19

#RSAC
DDS Standards: Layered View
Application
DDS-C++ DDS-JAVA* DDS-IDL-C DDS-IDL-C#
DDS v 1.4

DDS-WEB DDS-RPC* DDS-XTYPES IDL 4.0
DDS-SECURITY

HTTP(s)

UDP

RTPS v2.2

TCP**
IP

DTLS**
20

TLS**

SHAREDMEMORY**

DDS Interoperability Workfest

#RSAC

OCI

ETRI

PrismTech

IBM

RTI

TwinOaks

21

#RSAC
Data Centricity

Data QoS Writer
Data QoS Writer

Data QoS Writer

QoS
Data Writer

QoS
Data Writer

FILTER

QoS Topic A

QoS Topic B

DDS Domain

QoS Topic C

QoS Topic D

FILTER

22

Data QoS Reader
Data QoS Reader
Data QoS Reader
Data QoS Reader
Data QoS Reader
Data QoS Reader

#RSAC
Virtual Global Data Space

QoS

Topic A

DDS Domain

Topic B : "Turbine State"

QoS

Source (Key)

Speed

Power

Phase

WPT1

37.4

122.0

-12.20

WPT2

10.7

74.0

-12.23

WPTN

50.2

150.07

-11.98

QoS Topic C

QoS Topic D

CRUD operations

Persistence Service
23

Recording Service

#RSAC
Data Centric Communications Model

New subscriber!

Writer

Domain

"Alarm" Participant

Listener

Offered
QoS

Got new
data
Listener

Reader

Domain

"Alarm" Participant

Requested
QoS

Participants scope the global data space (domain) Topics define the data-objects (collections of subjects) DataWriters publish data on Topics DataReaders subscribe to data on Topics QoS Policies are used configure the system Listeners are used to notify the application of events
24

"Alarm" Topic Topic2 Topic2

#RSAC
RTPS: Wire Protocol Optimized for IIoT

Peer to peer: no brokers or servers Adaptable QoS, including prioritization Reliable even over multicast! Any size data automatic fragmentation Automatic Discovery and Presence Decoupled execution start in any order Redundant sources, sinks, paths, networks Efficient data encapsulation High performance: native "wire" speeds Scalable: no N2 network connections

RTPS

26

#RSAC
Deployment

Edge to Fog to Cloud

Bridged/ Mediated

Peer to Peer
Fog

Cloud

Fog

Fog

Edge

Edge

Edge

Edge

28

#RSAC
Cloud:
Datacenter Elasticity, Provisioning, Management, Analytics
Fog:
Distributed computing Processing "close to the edge" Latency, Robustness, availability
Edge:
Locality Information Scoping

Example: GCD Ultra Available Plant Control

Interested in many quantities
Redundant Gateways
VPN/Firewall

Radar Radar Displays

Logging

Control Room

Alarming Monitor

Migration Server

Control Room Bus

Existing SCADA (to be replaced)
TCP (WAN)

VPN/Firewall

VPN/Firewall

Segment Bus IPIPCICPC

Segment Bus IPIPCICPC

Segment Bus IPIPCICPC

Local quantity interest

29

#RSAC

#RSAC
Example: Duke Energy
30

#RSAC
Example: Clinical Decision Support System Architecture

DDS Admin Domain (Cloud)

DDS Gateway

Gateway, IX, Enterprise, 3rd Party

DDS Central Domain

DDS Gateway

Workstations, Storage, Historian

DDS Gateway

DDS Room Domain

DDS Room Domain

Patient Monitoring Devices
31

#RSAC
Introduction To Data Distribution Service Security
Hamed Soroush, Ph.D
Senior Research Security Engineer Real-Time Innovations (RTI) @HamedSoroush

#RSAC
Approaches to Protect DDS
Transport Layer Security Fine-Grained Security
33

#RSAC
Transport Level Security

Application 1
DDS TLS Handshake
Protocol TLS Record Protocol
TCP/UDP/IP

No Multicast Support No Support for Fine-grained Security
RTPS Traffic
PKI Certificate Exchange, Verification, Creation of Session Keys
Encrypted, & Signed Traffic

Application 1
DDS TLS Handshake
Protocol TLS Record Protocol
TCP/UDP/IP

Secure Discovery and Data Exchange
34

Threats

Unauthorized Subscription
Unauthorized Publication
Alice
Tampering & Replay
Trudy

Local machine is assumed to be trusted

Trent

35

#RSAC
Bob Eve Mallory

#RSAC
DDS Security Specification
36

DDS Security Model

Concept Subject Protected Objects
Protected Operations
Access Control Policy Control Builtin Access Control Mode

Unix File System Security Model
User Process executing for a user
Directories Files
Directory.list, Directory.create (File, Dir) Directory.remove (File, Dir) Directory.rename (File, Dir) File.read, File.write, File.execute
Fixed in Kernel

DDS Security Model
DomainParticipant Application joining a DDS domain

Domain (by domain_id)

Topic

(by Topic name)

DataObjects (by Instance/Key)

Domain.join Topic.create Topic.read (includes QoS) Topic.write (includes QoS) Data.createInstance Data.writeInstance Data.deleteInstance

Configurable via Plugin

Per-File/Dir Read/Write/Execute

Per-DomainParticipant Permissions :

permissions for OWNER, GROUP, USERS What Domains and Topics it can

37

JOIN/READ/WRITE

#RSAC

#RSAC
Pluggable Security Architecture
38

#RSAC
Pluggable Security Architecture

Plugin Authentication
Access Control Cryptography
Logging Data Tagging

Purpose Authenticate the principal that is joining a DDS Domain. Handshake and establish shared secret between participants
Decide whether a principal is allowed to perform a protected operation.
Perform the encryption and decryption operations. Create & Exchange Keys. Compute digests, compute and verify Message Authentication Codes. Sign and verify signatures of messages. Log all security relevant events Add a data tag for each data sample

Interactions The principal may be an application/process or the user associated with that application or process.
Participants may send messages to do mutual authentication and establish shared secret Protected operations include joining a specific DDS domain, creating a Topic, reading a Topic, writing to a Topic Invoked by DDS middleware to encrypt data compute and verify MAC, compute & verify Digital Signatures
Invoked by middleware to log Can be used for access control

39

#RSAC
Standard Capabilities (Built-in Plugins)

Authentication
Access Control Cryptography Data Tagging Logging

X.509 Public Key Infrastructure (PKI) with a pre-configured shared Certificate Authority (CA) RSA or ECDSA Signature Algorithm for authentication, DH or ECDH for shared secret
Configured by domain using a (shared) Governance file Specified via permissions file signed by shared CA Control over ability to join systems, read or write data topics
Protected key distribution AES128-GCM and AES256-GCM for authenticated encryption AES128-GMAC or AES256-GMAC for message authentication and integrity
Tags specify security metadata, such as classification level Can be used to determine access privileges (via plugin)
Log security events to a file or distribute securely over DDS

40

Overview of What Happens

Create DP

Authenticate DP

DP Creation Fails

#RSAC

Create End-Points
Discover Remote DP Learn permissions, establish shared secret and KxKeys
Discover Remote EndPoints
DP = Domain Participant Endpoint = Reader / Writer

Access OK?

End-Point Creation Fails

Mutual Authentication with a challenge-response protocol

Authenticate Remote DP

Ignore Remote DP

Access OK?
Granular Message Security
41

Ignore Remote End-Point Share Granular Keys using KxKeys

#RSAC
Writer Message Security
Encryption keys & MAC keys are generated per data writer These keys are securely distributed to data readers Distribution of these keys is done using other symmetric keys derived from the shared secret
Key distribution is transport independent
Different parts of messages can optionally be protected per governance policy Data Delivery is independent of key distribution
May use any transport, including multicast
42

#RSAC
Access Control & Policy
DDS Security allows for configuring & enforcing the privileges of each participant
Which domains it can join & what Topics it can read/write
It also allows specifying & enforcing policies for the whole domain, e.g.
Which topics are discovered using Secure Discovery Which Topics have controlled access Encrypt or Sign for Secure Discovery Encrypt or Sign for each secure Topic What to do with unauthenticated access requests
43

#RSAC
DDS Security: Out-of-the-Box

#RSAC
Configuring & Deploying DDS Security

Domain Governance Document

Identity CA Certificate

Permissions CA
Certificate

Shared By All Participants

P1 Identity Certificate

P1 Permissions File
P1

P1 Private Key

45

P2 Permissions File
P2

P2 Identity Certificate

P2 Private Key

#RSAC
Permissions Document
For each participant specifies:
What domains it can join What Topics it can read/write What Tags are associated with Readers & Writers
46

#RSAC
A Sample Permissions File
47

#RSAC
Domain Governance File
The domain governance document is an XML document that specifies which DDS domain IDs shall be protected and the details of the protection.
It is signed by the permissions CA.
48

#RSAC
A Sample Governance File
49

#RSAC
Configuration Possibilities
Are "legacy" or un-identified applications allowed in the Domain?
If yes an unauthenticated applications will: See the "unsecured" discovery Topics Be allowed to read/write the "unsecured" Topics
Is a particular Topic discovered over protected discovery?
If so it can only be seen by "authenticated applications"
Is access to a particular Topic protected?
If so only authenticated applications with the correct permissions can read/write
Is data on a particular Topic protected? How?
If so data will be sent signed or, encrypted then signed
Are all protocol messages signed? Encrypted?
If so only authenticated and authorized applications will see anything
50

#RSAC
Hands-On Session
Rose Wahlin
Principal Software Engineer Real-Time Innovations (RTI) @ProjectDerby

#RSAC
What Are we Doing?
Three scenarios:
Understanding the system with no security Securing the system with transport-level security Securing the system with fine-grained access control
52

#RSAC
What is in this System?
Sensor devices
Static data about the device: Device ID, Image Data: Numeric (Etc.)
Infusion pump
Sensor device with additional status and a stop command called "InfusionObjective"
Supervisor
Receives all the sensor data and infusion pump status Sends and receives alarm limits ­ used to detect whether a patient's vitals are bad enough to show an alarm Sends the InfusionObjective command to the infusion pump
53

#RSAC
System Overview

Sensor Device(s)

Infusion Pump

Numeric Image
Alarm Limit Numeric
Image Infusion Objective

RTI Connext DDS Data Bus

Numeric Image
Alarm Limit

Supervisor
54

#RSAC
Exercise 1: Viewing Unsecured Data

Sensor Device(s)

Infusion Pump

Numeric Image
Alarm Limit Numeric
Image Infusion Objective

RTI Connext DDS Data Bus

Numeric Image
Alarm Limit

Numeric data is easy to visualize. Temperature sensors publish temperature 37, and dimension "MDC_DIM_DIMLESS"

Supervisor
55

#RSAC
Exercise 2: Transport-Level Security

Sensor Device(s)

Infusion Pump

Numeric Image
Alarm Limit Numeric
Image Infusion Objective

Numeric Image
Alarm Limit

RTI Connext DDS Data Bus

Supervisor
56

The Alarm Limit is what we will attack. We will compromise a device and make it change the alarm limits for the entire system. Devices are allowed to read this, but should not write it.

#RSAC
Exercise 2: Transport-Level Security

Compromised Sensor Device

Infusion Pump

Numeric Image
Alarm Limit Alarm Limit Numeric
Image Infusion Objective

Numeric Image
Alarm Limit

RTI Connext DDS Data Bus

Supervisor
57

Transport-level security does not prevent an insider from attacking, writing data it should not be allowed to modify.

#RSAC
Exercise 3: Permissions

Compromised Sensor Device

Infusion Pump

Numeric Image
Alarm Limit Alarm Limit Numeric
Image Infusion Objective

Numeric Image
Alarm Limit

RTI Connext DDS Data Bus

Supervisor
58

DDS security contains fine-grained permissions that prevent an application from writing (or reading) something it is not entitled to.

#RSAC
Concluding Remarks

#RSAC
Try out DDS Security
Current Specification Draft:
http://www.omg.org/spec/DDS-SECURITY/
Any Questions?
https://community.rti.com/

#RSAC
"Apply"
Conduct an assessment of the security posture of your system, including network communication protocols Identify network protocols that you are using and associated risks
You will need granular security for Better performance (e.g. selective encryption/authentication of messages) More resilience (e.g. better protection against insiders)
Learn more about standard Industrial Internet technologies, including
IIC's Industrial Internet Reference Architecture IIC's Industrial Internet Security Framework Document IIC's Industrial Internet Connectivity Reference Architecture
61

#RSAC
References
Industrial Internet Consortium
http://www.iiconsortium.org/
Object Management Group's DDS Portal
http://portal.omg.org/dds
62

