SESSION ID: MBS-R01
Putting Access Management for the Internet of Things into Practice with MUD

MODERATOR: Eliot Lear
Principal Engineer Cisco Systems @eliotlear

PANELISTS:

L Jean Camp

Drew Cohen

Darshak Thakore

Professor of Informatics CEO

Principal Architect

Indiana University

Masterpiece Solutions, Inc. Cable Labs

Mudumbai Ranganathan

Engineer

National Institutes of Standards and

Technology

#RSAC

#RSAC
Let's talk about an oven

#RSAC

Today's enterprise threat: printers
© 2019 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

Bitdefender.com, 28 February 2019

What Sort of Access Do These Printers Require?

From Printer

To xmpp009.hpeprint.com

Printer

DNS Server

Printer

chat.hpeprint.com

Printer

224.0.0.251/32

Printer

220.0.0.252/32

Printer

h10141.www1.hp.com

Printer

Local Networks

Printer

Local Networks

Source: University of New South Wales, using mudgee (not shown: L2 packets)

Protocol TCP UDP TCP UDP UDP TCP UDP TCP

Source Port
5353 80

Destination Port(s) 80, 443, 5222,5223 53 80,443 5353 5355 80

#RSAC

#RSAC
The Internet is already all about IoT

#RSAC
Ask the Audience!
· What percentage of devices in your network are IoT?
· A: less than 20% · B: greater than 20% · C: don't know
· Go To The Poll

#RSAC
Scaling Problem: Number of Types of Things
$
$

#RSAC
Why is this important to NIST and what's going on?

#RSAC
Why NIST?
 NIST is concerned with protecting our critical IT infrastructure.
- Unsecured / unrestricted IOT devices can have a large impact on our critical infrastructure.
- Secured IOT identified as key component for resilience against botnet attacks (DOC/DHS report May 2017).
- NIST is involved with evaluating and promoting standards for IOT Cybersecurity.

#RSAC
Sample of NIST Activities

 Publications to provide security guidance for device manufacturers.
 Practice guides for technology deployment.
 Early prototyping of emerging standards.
 Participation in standards activities.
 Research on how emerging standards can be utilized in improving IOT Cybersecurity.
 Workshops and industry outreach.

 NISTIR 8228: Considerations for Managing Internet of Things (IoT) Cybersecurity and Privacy Risks
 NISTIR 8259: Core Cybersecurity Feature Baseline for Securable IoT Devices: A Starting Point for IoT Device Manufacturers
 NIST SPECIAL PUBLICATION 180015A,B,C : Securing Small-Business and Home Internet of Things (IoT) Devices Mitigating Network-Based Attacks Using Manufacturer Usage Description (MUD)

#RSAC
What Is Manufacturer Usage Descriptions (MUD)?
Delivering device intent

MUD: A component architecture

A URL:
https://manufacturer.example.com/mydevice.json
A MUD File:

The MUD Manager: The MUD File Server:

#RSAC

#RSAC
Expressing Manufacturer Usage Descriptions

Device emits a URL

Access Switch forwards

MUD Manager queries manufacturer

https://example.com/mud/...

Internet

Device

DHCP, LLDP, or 802.1X

Access
Switch Radius

MUD Manager

Enterprise Network

https

MUD File Server

#RSAC

Getting from the MUD file to deployment config

... "acl": [ { "name": "mud-76228-v4to", "type": "ipv4-acl-type", "aces": { "ace": [ { "name": "myctl0-todev", "matches": { "ietf-mud:mud": { "my-controller": [ null ] } }, "actions": { "forwarding": "accept" } ...

Whatever is appropriate in the local deployment.
10.1.2.3 10.4.5.6
https://mudmaker.org

#RSAC
What Classes of Endpoints MUD provides access to

Controllers
Print Server

Domain-based Cloud Access

Local Access
? ? ? ? ? ? ? ? ? ?

Same Manufacturer

#RSAC
Expressing Manufacturer Usage Descriptions

Devices segmented

Local config created
Approval

Manufacturer JSON file returned

Device

Internet

Access
Switch Radius

MUD Manager

Enterprise Network

https

MUD File Server

#RSAC
Results: Micro-segmentation of that Thing

Access Switch

Visibility of what's on the network
Access limited to devices based on manufacturer recommendations
Policy choices easily identified by MUD file
Hacked devices can't probe for holes
An additional layer of security ­ BUT- manufacturers should still
always secure their devices

Enterprise Network

#RSAC
What are the economic incentives?

Network's viewpoint
Network is a constrained resource
Today's vicious cycle
Devices

network setup

typically setup with a single wi-fi psk may have multiple ssid's

network operational

#RSAC

device Aconnected

device B connected

...device N connected

one of the device compromised shit happens....

devices keep connecting, no idea what device is what

ad infinitum

#RSAC
What does this mean for enterprises and consumers? An implementor's perspective

#RSAC
NIST-MUD: Scalable Software-Defined Access Control for IOT
Research Questions · Can the standard be
implemented in a memory scalable fashion using SDN? · What are the performance impacts?

#RSAC
Multi-table design for memory scalability
Ranganathan M., Montgomery D., El-Mimouni O., "SoftMUD: Implementing Manufacturer Usage Descriptions on OpenFlow SDN Switches," Int. Conf. Networks, 2019.

#RSAC
Micronets Reference Architecture

Service Provider Components
Intelligent services and business logic (including MUD Manager)
Micronets network microservices

Applications and Services used by Consumers

Micronets APIs

User's Applications

Healthcare provider

Access and Core Network

On-premise Network

Consumer's Micronets

Gateway
(creates micro ­ segmentation)

Micronets (automatically organized, with manual overrides)

Service management
Secure connection (e.g. based on MUD rules)

#RSAC
Findings
· OpenFlow provides a convenient platform for implementing the standard.
· Standard may be implemented efficiently even on limited memory devices. · O(N) flow rules for N devices at the switch.
· Normal (non-IOT) traffic can co-exist with IOT traffic. · Can be isolated using SDN flow rules without needing VLANs.
· Eventually consistent behavior results in least performance impact.

#RSAC
DIB Small Businesses
The Largest Threat Vector & Most Challenged by CMMC

300,000 DoD
Contractors

280,000 Small Contractors
$1 - $10M
19,900 Medium Contractors
$10M - $100M
100 Large Contractors
$100M +

To meet CMMC requirements, DIB contractors will require investment in a suite of cybersecurity products.
The costs and effort of achieving CMMC is disproportionally higher for Small Businesses.
­ Large businesses can amortize CMMC costs over a larger contract base
­ Large businesses typically have better IT support than small businesses
­ The top Cyber products are focused on large businesses, making them costly and difficult to implement on Small Business infrastructure (often a single, consumer grade Wi-Fi router)
­ There is a gap in cost effective small business network defense
Yikes! is a low-cost, easy to implement option for small businesses to achieve level 4/5 CMMC compliance.

#RSAC
The Yikes! Solution

· Easy to Install ­ Built on consumer grade equipment and setup requires no specialized IT or Cyber knowledge
· Employs virtualized software defined network (SDN) architecture for unparalleled flexibility and integration.
· Automatic device identification and device isolation to facilitate appropriate behavior, automatically blocking/mitigating many threat vectors by default.
· Automatically detects device and traffic anomalies, performs DNS trust checks, and monitors threat signals.

Mobile Application + Cloud Service + Router Software

#RSAC
What Tooling Is There?

#RSAC

#RSAC

#RSAC
What should you be doing...
Demand that manufacturers create MUD files
­ The tooling is there ­ Requires and demonstrates that they understand their own devices'
communications needs
Read up on MUD
­ RFC 8520 ­ NIST 1800-15, Parts A-D: a practice guide ­ www.mudmaker.org
30

