Ronald Eddings , Marco Figueroa, Josh Porter
Information Technology

Who We Are

Reverse Engineering

Development

Network Analysis

IPv6 Framework and Modules
Information Technology

Why We Are Here
Information Technology

IPv6 Refresher
Information Technology

What Is IPv6
Information Technology

Why We Must Switch
IPv6 can support 3.4 x 1038 or340,282,366,920,938,463,463,374,607,431,768,211,456 unique IP addresses. Autoconfiguration support Built-in IPsec Additional support for real-time delivery of data
Information Technology

Advantages
Simplified packet header Larger payloads Auto configuration Can potentially eliminate NAT Increased number of multicast addresses Support for preexisting routing protocols
Information Technology

IP Header Comparison
Information Technology

IPv6 Extension Headers

Header Type

Next Header Code

Basic IPv6 Header

-

Hop-by-Hop Options

0

Destination Options (with Routing 60 Options)

Routing Header

43

Fragment Header

44

Authentication Header

51

Encapsulation Security Payload 50 Header

Destination Options

60

Mobility Header

135

No next header

59

TCP

6

UDP

17

ICMPv6

58

Information Technology

IPv6 Extension Headers
IPv6 Header (nh = 43) Routing Header (nh = 6) TCP Header
Information Technology

IPv6 Addressing
Information Technology

IPv6 Addressing
Information Technology

IPv6 Addressing
Commonly used address scopes: Global Site-Local Link-Local
Information Technology

Multicast
Information Technology

Multicast Addresses

ff0X::1

Address

ff0X::2 ff0X::fb ff02::1:3

Description All Nodes
All Routers mDNSv6 Link-local Multicast Name Resolution

Available Scopes ·Interface-Local ·Link-Local ·Link-Local ·Site-Local ·All Scopes
·Link-Local

Information Technology

ICMPv6
Enables the following: Neighbor Discovery (NDP) and Secure Neighbor Discovery (SEND) Multicast Listener Discovery (MLD) Multicast Router Discovery (MRD)
Information Technology

ICMPv6

Bit offset

0­7

0

Type

32

Message body

8­15 Code

16­31 Checksum

Information Technology

ICMPv6 Types
Value 1 128 129 133 134 135 136 143

Meaning Destination Unreachable Echo Request Echo Reply Router Solicitation Router Advertisement Neighbor Solicitation Neighbor Advertisement Multicast Listener Query (MLDv2)

Information Technology

Neighbor Discovery
Neighbor Discovery (ND) is the protocol used to discover other nodes on the same subnet Uses ICMPv6 Enables the following:
 SLAAC  Neighbor Solicitation and Advertisements  Router Solicitation and Advertisements  Duplicate Address Detection (DAD)
Information Technology

Neighbor Discovery
Router Solicitation ­ Clients use this type to locate routers on the local-link Router Advertisement ­ Routers advertise their presence with advertisement messages Neighbor Solicitation ­ Nodes use neighbor solicitation messages to determine layer 2 address addresses of other nodes and to verify if a node is still reachable Neighbor Advertisement ­ Nodes use this message type to respond to solicitation messages
Information Technology

Information Technology

Information Technology

Refresher Complete
Information Technology

Intel and the Intel logo are trademarks of Intel Corporation or its subsidiaries in the U.S. and/or other countries.
*Other names and brands may be claimed as the property of others.
THE INFORMATION PROVIDED IN THIS PRESENTATION IS INTENDED TO BE GENERAL IN NATURE AND IS NOT SPECIFIC GUIDANCE. RECOMMENDATIONS (INCLUDING POTENTIAL COST SAVINGS) ARE BASED UPON INTEL'S EXPERIENCE AND ARE ESTIMATES ONLY. INTEL DOES NOT GUARANTEE OR WARRANT OTHERS WILL OBTAIN SIMILAR RESULTS.
NO LICENSE, EXPRESS OR IMPLIED, BY ESTOPPEL OR OTHERWISE, TO ANY INTELLECTUAL PROPERTY RIGHTS IS GRANTED BY THIS DOCUMENT. EXCEPT AS PROVIDED IN INTEL'S TERMS AND CONDITIONS OF SALE FOR SUCH PRODUCTS, INTEL ASSUMES NO LIABILITY WHATSOEVER AND INTEL DISCLAIMS ANY EXPRESS OR IMPLIED WARRANTY, RELATING TO SALE AND/OR USE OF INTEL PRODUCTS AND SERVICES INCLUDING LIABILITY OR WARRANTIES RELATING TO FITNESS FOR A PARTICULAR PURPOSE, MERCHANTABILITY, OR INFRINGEMENT OF ANY PATENT, COPYRIGHT OR OTHER INTELLECTUAL PROPERTY RIGHT.
Copyright © 2017 Intel Corporation. All rights reserved.

