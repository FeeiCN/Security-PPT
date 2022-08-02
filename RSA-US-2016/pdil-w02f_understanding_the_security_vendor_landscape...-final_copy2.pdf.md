SESSION ID: PDIL-W02F
Understanding the Security Vendor Landscape Using the Cyber Defense Matrix
#RSAC

Sounil Yu
sounil@gmail.com @sounilyu

#RSAC
Disclaimers
The views, opinions, and positions expressed in this presentation are solely my own It does not necessarily represent the views and opinions of my employer and does not constitute or imply any endorsement from or usage by my employer
All models are wrong, but some are useful - George E. P. Box
2

Our industry is full of jargon terms that make

#RSAC

it difficult to understand what we are buying

To accelerate the maturity of our practice, we need a common language
3

Our common language can be bounded by five asset

#RSAC

classes and the NIST Cybersecurity Framework

DEVICES

Asset Classes
Workstations, servers, VoIP phones, tablets, IoT, storage, network devices, infrastructure, etc.

APPS

The software, interactions, and application flows on the devices

NETWORKS
The connections and traffic flowing among devices and applications

DATA 10011101010101010010 01001101010110101001 11010101101011010100 10110101010101101010
USERS

The information residing on, traveling through, or processed by the resources above
The people using the resources listed above
4

Operational Functions
IDENTIFY Inventorying assets and vulns,
measuring attack surface, baselining normal, risk profiling

PROTECT DETECT

Preventing or limiting impact, patching, containing, isolating, hardening, managing access, vuln remediation
Discovering events, triggering on anomalies, hunting for intrusions, security analytics

RESPOND

Acting on events, eradicating intrusion footholds, assessing damage,

coordinating, reconstructing events

forensically

RECOVER Returning to normal operations,
restoring services, documenting lessons learned

#RSAC
Introducing the "Cyber Defense Matrix"

Devices

Identify

Protect

Detect

Respond

Recover

Applications

Networks
Data
Users Degree of Technology Dependency

Process
5

People

#RSAC
Left and Right of "Boom"

Devices

Identify

Protect

Detect

Respond

Recover

Applications Networks Data

Pre-Event Structural Awareness
Post-Event Situational Awareness

Users
Degree of Technology Dependency

Process
6

People

Enterprise Security Market Segments

Devices

Identify

Configuration

Applications

and Systems Management

Protect
IAM AV, HIPS
App Sec (SAST, DAST, IAST, RASP),
WAFs

Detect

Respond

Endpoint Visibility and Control / Endpoint Threat Detection & Response

Networks

Netflow

Network Security (FW, IPS)

DDoS Mitigation

IDS

Full PCAP

Data

Data Labeling

Data Encryption,
DLP

Deep Web, Brian Krebs,
FBI

DRM

Users

Phishing Simulations

Phishing Awareness

Insider Threat / Behavioral Analytics

Degree of Technology Dependency

Process
7

Recover
Backup
People

#RSAC

We care about more than just the assets that

#RSAC

are owned and controlled by the enterprise

01001101010110101001 10110101010101101010

Threat Actors Vendors Customers Employees
Enterprise Assets
· Devices - user workstations, servers, phones, tablets, IoT, peripherals, storage, network devices, web cameras, infrastructure devices, etc.
· Applications - The software, interactions, and application flows on the devices
· Network - The connections and traffic flowing among devices and applications
· Data - The information residing on, traveling through, or processed by the resources listed above
· Users ­ The people using the resources listed above
8

Operational Functions
· Identify ­ inventorying assets and vulnerabilities, measuring attack surface, baselining normal, risk profiling
· Protect ­ preventing or limiting impact, patching, containing, isolating, hardening, managing access, vuln remediation
· Detect ­ discovering events, triggering on anomalies, hunting for intrusions, security analytics
· Respond ­ acting on events, eradicating intrusion footholds, assessing damage, coordinating response, forensics
· Recover ­ returning to normal operations, restoring services, documenting lessons learned

#RSAC
Market Segments ­ Other Environments

Threat Actor Assets
Intrusion Deception Malware Sandboxes
Threat Data

Vendor Assets

Vendor Risk Assessments
Cloud Access Security Brokers

Customer Assets

Device Fingerprinting Device Fingerprinting

Endpoint Fraud Detection
Web Fraud Detection

Employee Assets

BYOD MDM BYOD MAM

9

#RSAC
Security Technologies Mapped by Asset Class

DEVICES
Workstations, servers, VoIP
phones, tablets, IoT, storage,
network devices, infrastructure, etc.

APPS
The software, interactions, and
application flows on the devices

NETWORKS
The connections and traffic flowing
among devices and applications

DATA

10011101010101010010 01001101010110101001 11010101101011010100 10110101010101101010

The information residing on,

traveling through, or processed

by the resources above

USERS
The people using the
resources listed above

10

Disclaimer: Vendors shown are representative only. No usage or endorsement should be construed because they are shown here.

Security Technologies Mapped by Operational

#RSAC

Functions

IDENTIFY

Inventorying assets, measuring attack

surface, baselining

normal, risk profiling

PROTECT

Preventing or limiting impact, containing,

hardening, managing

access

DETECT

Discovering events, triggering on anomalies, hunting for intrusions

Acting on events, eradicating intrusion
RESPOND footholds, assessing
damage, coordinating, reconstructing events forensically

Returning to normal
RECOVER operations, restoring
services, documenting lessons learned

MSSPs / IR
Disclaimer: Vendors shown are representative only. No usage or endorsement should be construed because they are shown here.
11

Security Technologies by Asset Classes &

#RSAC

Operational Functions

Identify

Protect

Detect

Respond

Recover

Devices

Applications

Networks
Data
Users Degree of Technology Dependency

Process
12

Disclaimer: Vendors shown are representative only. No usage or endorsement should be construed because they are shown here.
People

Use Case 1: Understand how products in one

#RSAC

area support the capabilities of another area

Threat Actor Assets

... and threat integration platforms consume, integrate, and drive action on threat data through other products that are in these categories Enterprise Assets

Threat data providers fall into this category...
13

Use Case 2: Define Security Design Patterns

#RSAC

(a.k.a. Security Bingo Card)

Identify

Protect

Detect

Respond

Recover

 Devices









 Applications









 Networks









 Data    

 Users   

Degree of Technology Dependency

Process
14


People

Use Case 3: Maximizing Your Available

#RSAC

Deployment Footprint (What vs Where)

What: Application Security
Protect
Devices
RASP

Where

Applications Networks

WAF
Secure Coding

Data Users

What: Endpoint Protection
Protect
Anti Malware
Devices Malware
Sandbox

Where

Phishing
Applications Awareness
Networks Data Users

15

Use Case 4: The (network) perimeter is dead.

Long live (other) perimeters

FROM
Devices Applications
Networks Data Users

TO
Devices Applications Networks Data Users

TO FROM

Devices

Devices

· SSH Certificates

Apps Networks
Data Users

· Server-Side SSL Cert
· 802.1X Certificate
· Hashes / Checksums
· User Creds · Biometrics · 2FA

PROTECT

Apps

Networks

Data

· Client-side SSL · NAC
Cert · Geofencing · Fingerprinting

· Encryption keys

· API Key

·?

· Encryption keys

·?

· Firewall Rules · ?

· Hashes / Checksums
· User Creds · Biometrics · 2FA

·?
· User Creds · 2FA

·?
· User Creds · 2FA

#RSAC
Users ·?
· Enhanced SSL Certificates
·? · Hashes /
Checksums · Photo ID · Handshake

Reduce/Eliminate these perimeters

to make security more usable

16

#RSAC
Use Case 5: Calculate Defense-in-Depth

Devices

Identify

Protect
0.25

Detect
0.40

Respond

Recover D-in-D Score
0.20 0.64

Applications 0.20 0.10

0.10 0.15 0.45

Networks 0.15

0.10 0.20

0.39

Data

0.05 0.10

0.20 0.32

Users
Defense in Depth Score

0.30 0.52

0.36

0.51
17

0.10 0.35

0.37

0.46

44
(sum of columns and row *100)

Use Case 6: Understand how to balance

your portfolio without breaking the bank

Identify

Protect

Detect

Respond

Recover

Devices

$50 $100

$50

Applications $50

$100

$50 $100

Networks $100

$100 $50

Data

$50 $50

$50

Users $50

$50

Total $200 $200 $250 $150 $200
18

#RSAC
Total
$200 $300 $250 $150 $100 $1000

Use Case 7: Anticipate the "Effective Half Life"

#RSAC

of People Skills, Processes, and Technologies

Identify

Protect

Detect

Respond

Recover

Devices 5 4 3 4 2 2 1 3 2 3 3 3 2 3 4

Applications Networks

3 3 2Staff n5eed3train2ing 2 3 2
EVERY YEAR to maintain efficacy at
3 4 4 50%2or h2ighe2r 2 3 3

5New4det3ection3 tec3hno5logies
may need to be rolled out EVERY TWO YEARS to maintain
3 ef4ficac3y at 530% o3r hi5gher

Data 5 5 5 5 3 3 5 4 4 5 1 5 4 2 5

Users 5 5 5 5 5 2 5 5 4

Degree of Technology Dependency

Process
19

545 535
People

Use Case 8: Disintermediate Components for Easier Orchestration

010010101001011010
010010100100110111010010010100010110110111
010010100111010101101010100
0100101001011010101010010100101010100100011101
0100101101100100100110010110010
010010101011010
0100101001011011010100101110
Disclaimer: Vendors shown are representative only. No usage or endorsement should be construed because they are shown here.

Vendor Application Protection

010101001011010

Enterprise Network Detection

100010110110111

Enterprise Device
Response

010101101010100

Customer Device
Identification

010100100011101

Customer Device
Protection

100110010110010

Threat Actor Application Identification

010010101011010

Enterprise Network 1011010100101110 Identification

20

#RSAC
Common Message
Fabric

Use Case 9: Differentiate between a

#RSAC

platform and a product

Identify

Protect

Detect

Respond

Recover

Devices

Product

Applications
What makes a technology a "platform"?
Ne1t.wEonrakbsles enterprises to operate as
mechanics and not just chauffeurs
2. Exposes all its functions through APIs
Dfoar etaasier integration with other
technologies and capabilities
3. ULtsheaevterresangaebsledaintateerxcchhaannggeeabslteandards
components
Degree of Technology Dependency

Platform
Process
21

People

Use Case 10: Identifying Opportunities to Accelerate

#RSAC

the People>Process>Technology Lifecycle

Identify

Protect

Detect

Respond

Recover

Devices

Applications Embedded Into
Networks Technology
Data

Codified Into Playbooks & Checklists

New Discoveries
and War Stories!

Users

Usually Fighting Against Technology

Degree of Technology Dependency

Usually Fighting Against People
Process
22

People

Use Case 11: Identify technology gaps or

#RSAC

overreliance in your technology portfolio

Devices

Identify


Applications

Protect
 

Detect


Respond


Recover



Networks



 



Data





Users 
Degree of Technology Dependency




Process

People

23

Model Shortfalls: Where is analytics? GRC?

#RSAC

Orchestration?

This framework supports the higher level functions of orchestration, analytics, and governance/risk/compliance, but they are represented on a different dimension
Orchestration Analytics GRC

24

Comparison of Models: Gartner's Five Styles of Advanced Threat Defense

Time

Network Payload Endpoint

Real Time/ Near Real Time

Post Compromise (Days/Weeks)

Network Traffic
Analysis
Style 1

Network
Forensics
Style 2

Payload
Analysis
Style 3

Endpoint Behavior Analysis
Style 4

Endpoint Forensics
Style 5
Source: Gartner

Enterprise Assets
Style 4 Style 5 Style 1 Style 2
Style 3

#RSAC
Threat Actor Assets

Where to Look

25

#RSAC
Applying the Cyber Defense Matrix
This week
Use the matrix to categorize vendors that you encounter in the Expo Hall Ask them where they fit and don't allow them to be in multiple shopping aisles
In the first three months following this presentation you should:
Send me feedback on how you have mapped vendors to it Organize your portfolio of technologies to see where you might have gaps Identify vendors that may round out your portfolio based on your security design pattern (a.k.a. security bingo card)
Within six months you should:
Send me feedback on how you used the Cyber Defense Matrix and improved it
26

#RSAC
Sounil Yu sounil@gmail.com

