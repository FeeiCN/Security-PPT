Zeek ATT&CK Metrics
Allan Thomson CTO LookingGlass Oct 29th 2019
© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

3 Things

Zeek Background

What is it

Why it matters

Data Preparation

STIX2.1 Intelligence to
ATT&CK Mapping

Zeek Script Programming

Data Processing

Intelligence & ATT&CK
normalization

Zeek/Behavior correlation

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Public Disclosure

2

Zeek Background
Basic Architecture
© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Zeek Background

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Network Analysis Framework

Focused on Network Security Monitoring

Open Source Community

20 Years Research (www.zeek.org)

Public Disclosure

4

Zeek Ecosystem

Connections RPC

NTLM

Spam

ICMP Bittorrent

IRC

Botnet

Geo-location APT

Syslog

Exfiltration

Web - HTTP

Statistics

Sandbox

Payload

Integration Scanning File Sharing - SMB NTP

Protocol Vulnerabilities
Bruteforce Email
Certificate

X509 Certificates

SSH

IPv4

Bitcoin DHCP Shellshock

Routing - RIP

Intelligence Integration

Domain - DNS Wordpress

MAC

Fast Flux

Validation SSL/TLS
Blacklists

VirusTotal Integration
IPv6

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Public Disclosure

5

Zeek Based Detection
· Zeek monitor receives copy of all traffic
· Zeek employs an event-based programming model
· Zeek scripts run to perform analysis on the network traffic
· Identify stateful analysis on specific network patterns or network behavior
· Can also identify user application behaviors (i.e. nefarious activity)

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Public Disclosure

6

Zeek Processing and Distribution
· Supports Actor-Framework (https://actor-framework.org/)
· Distributed Messaging & Processing - Event Processing - Cross-Event Correlation - Behavioral Identification - Intelligence Correlation - ATT&CK Analysis  Multi-node  Multi-processing

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Public Disclosure

7

Applying Zeek For ATT&CK/Intelligence Correlation

Perimeter

Internal Network LAN

Active Zeek Detection & Mitigation SDN Zeek Controller SOC/NOC

Cloud Network

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Passive Zeek Monitor
Public Disclosure

Agents (Endpoints/Servers) Zeek Agent
8

Data Preparation
Intelligence & Zeek Updates for ATT&CK
© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Threat Intelligence & ATT&CK
· How we modelled Threat Intelligence · How we related Intelligence to ATT&CK · How we correlated intel with activities (net, sys, user) · How we applied action based on Intelligence/ATT&CK

· STIX2 · STIX2 · Zeek · Zeek

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Public Disclosure

10

Data Preparation: Intel to ATT&CK Mapping
· 90 different intelligence feeds · ~1800 Unique intelligence attack-patterns, intrusion sets, actors
- Data-driven Mapping to ATT&CK - Include ATT&CK Mapping when producing STIX2.1 Intelligence

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Public Disclosure

11

Data Preparation: Intel to ATT&CK Mapping
· Tactics mapped using kill-chain property on Intel Feed - Attack-Pattern SDO - Intrusion Set SDO - Actor SDO

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Public Disclosure

12

Data Preparation: Intel to ATT&CK Mapping
· Intel Feed Attack-Patterns related to ATT&CK Attack-Patterns using SROs

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Points to ATT&CK UUID

Public Disclosure

13

Data Processing
Correlation, Alerting
© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

An Intelligence Question

· Find IP ranges and CIDRs that are associated with the

NAICS Industry of `Carpet and Rug Mills';

?

- discover all active IPs contained within these ranges, - and
 find FQDNs associated with them where those FQDNs have active threats

 that include

o Attack-Pattern Exploitation of Remotes Services

and

o Attack-Pattern Pass the Hash

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Public Disclosure

15

The problem answering that question?

· Many different sources assert essentially the same data
- i.e. FeedA asserts that IP 10.0.0.1 has Malware A, and FeedB asserts the same

· Much of the metadata is the same across temporal series
- Repeated fact assertions and threat associations - i.e. FeedB asserts that Actor BB, associated with Intrusion Set AA, using Attack-Pattern ZZZ Drive-by
Compromise malware YY on Infrastructure CC at time X, and again, at time Y

· Different attributes with different data representation that communicate the same semantic information
- i.e. country_s of "United States" and "United States of America" and country_code_s of "US", and "USA"

· Multiple different object/entity types, billions of instances that requires large-scale join across data-sets where those data-sets are being updated in real-time

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Public Disclosure

16

Solution: Unified Data Modelling
· Entity
- Contains information about an Entity that will never change - Metadata such as name, and IP ranges in Entities allows Facts to only contain reference
· Fact
· Asserts attributes on Entity and relationships to other Entities
· If Facts contained temporal and source/provider attributes, it would be multiple Fact Record for each

· Assertion
· Asserts one or more Facts by Source Entity and Provider Entity · Contains all temporal attributes ­ Observed At, and Asserted At

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Public Disclosure

17

Impact on Data
Records: ~150mm/day  ~19mm/day.
Bytes: ~150GB/day  ~25-30GB/day.

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Public Disclosure

18

Zeek Intelligence Basic Lookup Pipeline
Zeek Intelligence Framework Lookup

Raw Events

Intelligence Found Event

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Public Disclosure

Intelligence &

ATT&CK Correlation

19

Zeek ATT&CK Report Event Dissection

What LGC Attack Pattern ID Where in the network was it seen? What aspect of traffic was it detected What intel feed produced the intel?
1568762713.447733 1568762713.344683 - node1 HTTP::IN_HOST_HEADER comixalex.freeiz.com Intel::DOMAIN STIX::INDICATOR DTD All: comixalex.freeiz.com 1456283538.000000 1568776825.000000 LookingGlass Cyber Solutions :adware,:apt,:bot,:clickfraud,:exploit-kit,:financial,:malvertising,:malware,:mobile-device,:phishing,:port-scanner,:pos-atm,:ransomware,:remote-accesstrojan,:rogue-antivirus,:rootkit,:trojan,:worm [domain-name:value = 'comixalex.freeiz.com'] C70GjJ2nFHfFRmARhg 52:54:00:06:76:f2 192.168.123.100 51072 153.92.0.100 80

What src net entity?

What dst net entity?

What STIXv2 Pattern was matched?

What labels are associated?

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Public Disclosure

20

Zeek ATT&CK Report Event Analysis

Allows lookup back to ATT&CK Tactics & Kill-Chain Phase

Allows gap analysis on coverage of networks

Allows analysis of feeds coverage/value Allows analysis of application coverage

What LGC Attack Pattern ID Where in the network was it seen? What aspect of traffic was it detected What intel feed produced the intel?

1568762713.447733 1568762713.344683 - node1 HTTP::IN_HOST_HEADER comixalex.freeiz.com Intel::DOMAIN STIX::INDICATOR DTD All: comixalex.freeiz.com 1456283538.000000 1568776825.000000 LookingGlass Cyber Solutions :adware,:apt,:bot,:clickfraud,:exploit-kit,:financial,:malvertising,:malware,:mobile-device,:phishing,:port-scanner,:pos-atm,:ransomware,:remote-accesstrojan,:rogue-antivirus,:rootkit,:trojan,:worm [domain-name:value = 'comixalex.freeiz.com'] C70GjJ2nFHfFRmARhg 52:54:00:06:76:f2 192.168.123.100 51072 153.92.0.100 80

What src net entity?

What dst net entity?

What STIXv2 Pattern was matched?

What labels are associated?

Allows cross correlation with other data

Allows cross correlation with other data

Allows pattern effectiveness analysis

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Public Disclosure

Allows classification analysis
21

Summary
· Zeek provides effective and flexible framework for collection and correlation · Data preparation & modelling can have big impact on analysis effectiveness · Data correlation at scale requires end-to-end approach
Questions?

© 2019 LookingGlass Cyber Solutions, Inc. All Rights Reserved.

Public Disclosure

22

Thank You
L o o k in g G l a ss Cy b e r.co m

@LookingGlassCyber

@LG_Cyber

/company/LookingGlass

/LookingGlassCyber

