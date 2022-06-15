IPv6 Security

Berlin, 18 June 2015

Frank Herberg frank.herberg@switch.ch

Agenda

· Part 1: Introduction to IPv6 Security

­ Why IPv6 is an extensive security topic ­ Overview of the differences to IPv4, relating to Security

· Part 2: It's Demo time! Selected IPv6 attacks

­ Local Protocol Attacks ­ Remote Protocol Attacks

· Part 3: Wrap-up

­Recommendations, Resources and Tools ­Q & A

© 2015 SWITCH

2

IPv4 address pool is empty, but...

· IANAs global pool of available IPv4 addresses was exhausted on 1 February, 2011

· The five Regional Internet Registries each received one of the IANA's five reserved /8 blocks

· Policy: A LIR may receive only 1,024 IPv4 addresses, even if they can justify a larger allocation

© 2015 SWITCH

3

...but the Internet is growing
· Mobile Devices, Internet of Things,...

· 128 bit IPv6 address space is 296 x larger than IPv4's 32 bit

© 2015 SWITCH

4

Global Unicast Address Example

|-------------------------- 128 Bit ------------------------------|

n bits

64-n bit

global routing prefix subnet ID
64 Bit Subnet Prefix

64 Bit Interface ID

2001:0620:0010:0049:3e07:54ff:fe5d:4567

ISP gets from RIR (RIPE NCC): 2001:0620::/32

Client gets from the ISP:

2001:0620:0010::/48

Client has 16 Bits for Subnetting (65536 Subnets)

Prefix for a Subnet:

2001:0620:0010:0049::/64

© 2015 SWITCH

5

Part 1: Introduction to IPv6 Security

© 2015 SWITCH

6

Multiple IPv6 addresses per interface (plus the IPv4 address)

IPv4

173.194.32.119

Link Local fe80::3e07:54ff:fe5d:abcd

Global

2001:610::41:3e07:54ff:fe5d:abcd*

Privacy Extensions = random / temporary

Global PE 2001:610::41:65d2:e7eb:d16b:a761**

Unique Local Address = `private' IPv6 address

ULA

fd00:1232:ab:41:3e07:54ff:fe5d:abcd

* Privacy Issue (64 Bit IID the same all over the world) ** Traceability Issue (every hour/day new IP address)

© 2015 SWITCH

7

Unpredictable source address choice

© 2015 SWITCH

8

Certain Mobile devices configure new IPv6 address each time they wake up

· 10:35 Wake up to poll for information
2001:610::41:65d2:e7eb:d16b:a761

· 10:37 Entering power-save mode

· 10:40 Wake up to poll for information
2001:610::41:b5db:3745:463b:57a1

· 10:42 Entering power-save mode

· 10:47 Wake up to poll for information

2001:610::41:11c2:abeb:d12a:17fa

· ...

© 2015 SWITCH

9

· ! Multiple source addresses · ! Changing source addresses · ! Two protocol stacks

Correlation can be difficult for... ...logging (changing IPs) ...monitoring (different views for IPv4/6) ...IDS/IPS (attacks distributed over 4/6)

© 2015 SWITCH

10

IPv6 address notation isn't unique

full form: fe80:0000:0000:0000:0204:61ab:fe9d:f156
drop leading zeroes: fe80:0:0:0:204:61ab:fe9d:f156
collapse multiple zeroes to `::': fe80::204:61ab:fe9d:f156

dotted quad at the end: fe80::204:61ab:254.157.241.86

© 2015 SWITCH

11

IP address based protection 1 - Blacklists
· Reputation based Spam block list for IPv6 are not there yet
­difficult for vast IPv6 address space ­Sender can utilize `nearly unlimited' source addresses ­Blacklisting of address ranges can lead to overblocking

© 2015 SWITCH

12

IP address based protection 2 - ACLs
· IPv4 based Access Control Lists (ACLs) only protect the IPv4 access
· Enable IPv6? ! Review all your ACLs!

© 2015 SWITCH

Both doors locked?
13

Simplified format of the IP header fixed size (40 Byte) options go into Extension Header

© 2015 SWITCH

14

Extension Header Examples

No. Name

Functions

Remarks

0 Hop-by-Hop- carries options for

must be examined by every

Options

hops, e.g. Router Alert hop on the path

(for MLD, RSVP)

Must be first EH, only one

allowed per packet

60 Destination Options

carries options for destination (e.g. for Mobile IPv6)

processed by destination node only*

43 Routing Header

Lists IPv6 nodes that must be "hopped" on the way to dest.

44 Fragmentation Fragmentation (at

Header

source)

only source can fragment, processed by destination node only

Other examples: 6:TCP, 17:UDP, 58:ICMPv6, 50/51: ESP/AH (IPSec)

© 2015 SWITCH

15

Extension Headers increase complexity

IPv4-Header
IPv4 Protocol = 6 (TCP)

TCP-Header & DATA

IPv6

IPv6-Header
Next Header = 6 (TCP)

TCP-Header & DATA

IPv6-Header
Next Header = 43 (Routing)

Routing-Hdr.
Next Header = 44 (Fragment)

Frgmnt-Hdr.
Next Header = 6 (TCP)

TCP-Header & DATA

© 2015 SWITCH

16

Inspecting packets with EH is challenging...

·The number of EHs is not limited
·The number of options within an (Hop-byHop or Destination) Options Header is not limited
·There is no defined order of EHs (only a recommendation)
­(Exception: Hop-by-Hop Options Header must be first and nonrecurring)
·EH have different formats

© 2015 SWITCH

17

According to RFC2460, Section 4 "IPv6 Specification"
· "In-between-Boxes" (such as Firewalls) are not intended to examine EHs...

"With one exception, extension headers are not examined or processed by any node along a packet's delivery path, until the packet reaches the node."

· ...but the destination node must completely process all EHs

"any order and occurring any number of times in the same packet"

© 2015 SWITCH

18

Possible Threat: High Number of EHs

· An attacker could create packet with high number of EH ! to try to avoid FW / IPS ! might crash or DOS the destination system

IPv6-Header
Next Header = ...

Ext-Hdr.

NeNxEeNt xExHeNttxeExH-eNtaHtxeExH-edNtaHdtxeeExH-edNtrarHdtxeeEx.H-ed=NtrarHdtxe...eEx.H-ed=NtrarHNdtxe...eEx.H-ed=NtrearHNdtxe...eEx.Hx-ed=trearHNtdtxe...eEx.Hx-d=EHtrearHNtdte...eEx.Hx-d=eExHrearHNtdtea...eEx.tx-d=eExH-redarHNtdtea...Hx.tx-ed=eExH-redrHNtdtrea...H.dtx-e=eExH-red=rHNtdra...rH.dtxe=...eEx.H-ed=rNtdra...rH.dtxe...eEx.H-ed=rNtrarH.dtxe...eEx.H-ed=NtrarHdtxe...eEx.H-ed=NtrarHdtxe...eEx.H-ed=trarHdtxe...eEx.H-d=trarHdte...ex.H-d=rarHdte...e.-d=rarHde....d=rrde....=rr....=...

TCPHeader

Next Header =...

Next Header =...

DATA ...

Mitigation option: Drop packets with more than x EHs

© 2015 SWITCH

19

Possible Threat: Manipulation of the EHs
· An attacker could perform header manipulation to create attacks
­Fuzzing (try everything ­ it's not limited) ­add (many) unknown options to an EH, e.g. Hop-by-hop-Options
· The Destination node / Server has to look into crafted EHs !Destination System might crash

IPv6-Header
Next Header = 43 (Routing)

EH
Next Header = 0
(Hop-by-hop Options)

EH
)/&(/&"%ç&+=&+=/ %ç/%/=()/

TCPHeader

DATA ...

Mitigation option: Perform sanity checks on EH (format / no. of options)

© 2015 SWITCH

20

Possible Threat: Covert Channel
· An attacker could use Extension Headers as a covert channel
!to exchange payload undiscovered

IPv6-Header
Next Header = 43 (Routing)

EH
Next Header = 0
(Hop-by-hop Options)

EH
information exchange

TCPHeader

DATA ...

Mitigation option: Drop unknown EH

© 2015 SWITCH

21

Extension Headers increeeaaase complexity

© 2015 SWITCH

22

To make it worse: Add fragmentation to it!

© 2015 SWITCH

23

The sender can fragment IP datagrams into multiple packets and the IDS/IPS/Firewall/ Receiver has to deal with it

MTU

"Packet too big"

Oversized Packet

IPv6- Transport Header -Header

Data

Fragment 1

MTU
IPv6- Fragmnt. Transport Data Header Header -Header

Fragment 2

IPv6- Fragmnt. Header Header

Data

© 2015 SWITCH

24

Some fragmentation attacks
· Attacker can try to bypass filtering/detection (IDS/IPS evasion technique) ­by putting the attack into many small fragments ­by combination of multiple extension headers and fragmentation so that layer 4 header is in 2nd fragment
· Attacker can exploit weaknesses in the destination ­Overlapping fragments, nested fragments
· Attacker can DOS destination ­send lots of incomplete fragment sets (M-flag 1 ! more fragments)

© 2015 SWITCH

25

Preventing Fragmentation Attacks
You can · monitor the amount of fragmented packets !high increase might indicate attack

for your reference

· block fragments which are below a certain size (if not the last one of a set [M-flag=0])
!don't appear in proper communication

· look for Inspection capabilities of fragmented packets
­e.g. Cisco: Virtual Fragment Inspection (VFR) ipv6 virtual-reassemly

© 2015 SWITCH

26

ICMPv6 Message Types

ICMPv6 is more complex

Error-Messages (1-127)
1:Destination Unreachable 2:Packet too big (PMTUD) 3:Time Exceeded (Hop Limit) 4:Parameter Problem

Info-Messages (Ping)

128:Echo Request

129:Echo Reply

Multicast Listener Discovery (MLD, MLD2)
130:Multicast Listener Query 131/143:Multicast Listener Report/2 132:Multicast Listener Done
Neighbor Discovery (NDP), Stateless Autoconfiguration (SLAAC)
133:Router Solicitation 134:Router Advertisement 135:Neighbor Solicitation (DAD) 136:Neighbor Advertisement (DAD)
137:Redirect Message

Other (Router Renumbering, Mobile IPv6, Inverse NS/NA,...)
138-153

© 2015 SWITCH

27

ICMPv6 filtering is more complex

for your reference

·If you filter ICMPv6 completely you break IPv6 ·Recommendations for Filtering ICMPv6:
­RFC 4890, 38 pages ·Aim of the RFC:
­ Allow propagation of ICMPv6 messages needed to maintain functionality of the network
but ­ Drop messages posing potential security risks

© 2015 SWITCH

28

ICMPv6 Security Concerns (according to RFC 4890)
·Denial-of-Service Attacks ·Probing to identify topology and hosts ·Redirection Attacks using the Redirect message ·Renumbering Attacks (Renumbering messages
are required to be authenticated with IPsec) ·Covert conversation through the payload of
ICMPv6 error messages

© 2015 SWITCH

29

IPv6 Tunneling mechanisms can be misused and attacked...

TEREDO

6to4

6rd

6in4

ISATAP

...different sorts of tunnels around

© 2015 SWITCH

30

Tunneling: transport of IPv6 pakets across IPv4 infrastructure

Host-to-Site:

Dual Stack

IPv4

IPv6

Tunnel endpoint
Site-to-Site:

IPv6

IPv4

IPv6

IPv4-Header IPv6-Header Payload

© 2015 SWITCH

31

Some Tunneling Characteristics

· Tunnel endpoints can be configured manually or automatically
· Tunnels can be configured deliberate or unknowingly
· or deliberate (by a user/attacker) and unknowingly (for the operator) ;-)
· Tunnels can possibly traverse your "Security devices" (Firewall, NAT-GW)
· Tunnels can be used as covert channels or backdoors
· Tunnels use remote Tunnel-Endpoints (can you trust them?)

© 2015 SWITCH

32

Detect IPv6 tunnels in network logs
Look inside logs / NetFlow records:
·IPv4 Protocol 41 tunnel traffic (ISATAP, 6to4) ·IPv4 UDP 3544 tunnel traffic (Teredo) ·traffic to 192.88.99.1 (6to4 anycast server) ·DNS server log: resolution of "ISATAP"

© 2015 SWITCH

33

Lower maturity than IPv4...
· ...in the Design/Specs frequent new RFCs
· ...in the Implementations Vendors have to deal with complexity and a moving target
· ... regarding Know-how Often little or now Know-how And it needs time!

© 2015 SWITCH

34

Example: "Remote system freeze thanks to Kaspersky Internet Security 2013"

© 2015 SWITCH

a fragmented packet with one large extension header leads to a complete freeze of the operating system...
35

Latent Threat ­ IPv6 attacks in "IPv4-only" environment

· IPv6 is enabled on all common OSs and can be autoconfigured ("SLAAC-Attack")

· IPv6 address / Default Route to rogue Router

· Also tunnels might be enabled and can be autoconfigured

· and bypass your FW

· can be misused for DOS- and MITM-Attacks

· Misconfigured clients can tie up your network

" no IPv6 Monitoring / no IPv6 Knowledge

© 2015 SWITCH

36

Opportunities for improved IT-Security?
Yes!
· Review the existing level of security · Consolidation of the Network-Design / Re-
documentation! · IPv6 Addressing plan ­ more or less Policy friendly · Rethink NAT vs. real Security (operational cost) · Preparation for future security features vs. maintaining
of legacy technology

© 2015 SWITCH

37

Bottom line: How IPv6 affects IT-Security

© 2015 SWITCH

· Higher complexity (protocol and network)
· Lower maturity (especially security devices)
· Less Know-how / experience · New / more Attack vectors · Less visibility (Monitoring) · Already active in "IPv4-only" net · A lot of changes (also new
opportunities to improve things)
38

Part 2:
Selected IPv6 attacks

© 2015 SWITCH

39

Some preparation needed: How Address configuration works in IPv6

© 2015 SWITCH

40

ICMPv6 Message Types

ICMPv6

Error-Messages (1-127)
1:Destination Unreachable 2:Packet too big (PMTUD) 3:Time Exceeded (Hop Limit) 4:Parameter Problem

Info-Messages (Ping)

128:Echo Request

129:Echo Reply

Multicast Listener Discovery (MLD, MLD2)
130:Multicast Listener Query 131/143:Multicast Listener Report/2 132:Multicast Listener Done
Neighbor Discovery (NDP), Stateless Autoconfiguration (SLAAC)
133:Router Solicitation 134:Router Advertisement 135:Neighbor Solicitation (DAD) 136:Neighbor Advertisement (DAD)
137:Redirect Message

Other (Router Renumbering, Mobile IPv6, Inverse NS/NA,...)
138-153

© 2015 SWITCH

41

Neighbor Discovery Protocol consists of 5 ICMPv6 Message Types (133-137)
Multiple functions:

· Autoconfigure IP addresses (SLAAC) · Find gateway routers (SLAAC) · Detect duplicate addresses (DAD) · Tell the node to use DHCPv6 · Discover other nodes on the link · Determine link-layer addresses (Address Resolution) · Maintain neighbor reachability information · Redirects

© 2015 SWITCH

42

Initial status: `A' has a MAC address

A MAC: 3c:07:54:5d:40:66

R1

B

C

Network interface comes up...

© 2015 SWITCH

43

SLAAC Step 1: configure link-local address

A MAC: 3c:07:54:5d:40:66

R1

B

C

Generate a link local address (FE80), from MAC address state: tentative

Send NS for DAD (:: => Solicited-Node multicast addr)

Either receive a NA to show an address conflict: stop autoconfig

or change state of link local address to: preferred fe80::3e07:54ff:fe5d:4066

© 2015 SWITCH

44

SLAAC Step 2: configure global addresses

A fe80::3e07:54ff:fe5d:4066 3c:07:54:5d:40:66

R1

B

C

Send RS to All-Router-Multicast-Address (ff02::2)

RA: "Prefix is 2001:620:0:49::"*

If RA received: generate global routable address(es) from received prefix(es) and configure default route

Send NS for DAD (:: => Solicited-Node multicast addr) Either receive a NA to show an address conflict: don't use address

or configure Global Address(es) 2001:....

© 2015 SWITCH

45

SLAAC successful:
eth0: Link Layer Address: 3c:07:54:5d:40:66 Link Local Address: fe80::3e07:54ff:fe5d:4066 Global Address: 2001:620::49:3e07:54ff:fe5d:4066
A Global Address: 2001:620::49:1c78:9b29:27c1:7564
· Default Router Address · Options (RDNSS,...)

© 2015 SWITCH

46

Demo setup

© 2015 SWITCH

47

The "Demo-Lab" in a box
Presentation-Laptop runs VirtualBox with 5 VMs and 2 internal network segments

Beamer

© 2015 SWITCH

48

Lab Configuration · 3 Clients · 1 IPv6 Router · 1 Webserver
08:00:27:AA:AA:AA
08:00:27:66:66:66

08:00:27:BB:BB:BB Win7

SW1

Attacker

eth0: SLAAC / RA

Router R1: forwarding=1

radvd: R1 Prefix 2001:db8:1::/64

eth0:

fe80::a00:27ff:fe11:1111 2001:db8:1::1

SW2

eth1: fe80::a00:27ff:fe11:1112 2001:db8:2::1

2001:db8:2::2 GW: 2001:db8:2::1

© 2015 SWITCH

49

Lab Configuration after Autoconfiguration

08:00:27:AA:AA:AA

08:00:27:BB:BB:BB

fe80:a00:27ff:feaa:aaaa

fe80:a00:27ff:febb:bbbb

2001:db8:1::a00:27ff:feaa:aaaa 2001:db8:1::a00:27ff:febb:bbbb

GW: fe80::a00:27ff:fe11:1111 GW: fe80::a00:27ff:fe11:1111

08:00:27:66:66:66

fe80:a00:27ff:fe66:6666

2001:db8:1::a00:27ff:fe66:6666 GW: fe80::a00:27ff:fe11:1111

Win7

Attacker
Router R1: forwarding=1 eth0: fe80::a00:27ff:fe11:1111 2001:db8:1::1 eth1: fe80::a00:27ff:fe11:1112 2001:db8:2::1
© 2015 SWITCH

SW1 SW2

eth0: SLAAC / RA radvd: R1 Prefix 2001:db8:1::/64
For simplification: · Privacy Extensions disabled 2·00R1a:dnbd8o:m2:iz:2e identifiers disabled GW(W: 2in0)01:db8:2::1
50

Access Webserver: http://[2001:db8:2::2]/

08:00:27:AA:AA:AA

08:00:27:BB:BB:BB

fe80:a00:27ff:feaa:aaaa

fe80:a00:27ff:febb:bbbb

2001:db8:1::a00:27ff:feaa:aaaa 2001:db8:1::a00:27ff:febb:bbbb

GW: fe80::a00:27ff:fe11:1111 GW: fe80::a00:27ff:fe11:1111

08:00:27:66:66:66

fe80:a00:27ff:fe66:6666

2001:db8:1::a00:27ff:fe66:6666 GW: fe80::a00:27ff:fe11:1111

Win7

SW1

Attacker

eth0: SLAAC / RA

Router R1: forwarding=1

radvd: R1 Prefix 2001:db8:1::/64

eth0:

fe80::a00:27ff:fe11:1111 2001:db8:1::1

SW2

eth1: fe80::a00:27ff:fe11:1112 2001:db8:2::1
© 2015 SWITCH

Webserver

2001:db8:2::2

GW: 2001:db8:2::1

51

Its Demo time! Selected IPv6 attacks

© 2015 SWITCH

52

Recommendations, Resources and Tools

© 2015 SWITCH

53

"It's hard enough to deploy IPv6,
let's deal with the Security stuff afterwards!"

© 2015 SWITCH

54

1. Secure existing Operations
· Do you have a IPv6 Latent Threat risk in your network? · If yes take steps against it:
!Deactivate IPv6 or SLAAC where reasonable !Filter tunnel traffic at the perimeter !Update your monitoring (Rogue Router Advrts.)

© 2015 SWITCH

55

2. Raise awareness at Management level
· Has IPv6 arrived on the IT Management Agenda? Priority­ Ressources ­ Budget
· Do you have an IPv6 Integration Strategy? leverage existing life-cycles and projects realistic, phased roadmap Define a IPv6 Transition Manager
· Make sure IT-Security is involved! e.g. Security-Devices, Design decisions, NAT, Adressing plan, Security-Policy update

© 2015 SWITCH

56

3. Build up Know-how

· Define a Training Plan

different people (roles) need different knowledge

· Build up a Testing Lab

to gain experiences & to test equipment

· Perform a Pilot project

not critical but also not only in the lab

· Inform and learn from others

Swiss IPv6 Council,...

© 2015 SWITCH

57

4. Take into account the IPv6 readiness of your Security equipment
· Have an Inventory of your security equipment · Define your IPv6 Requirements · Do Vendor Management (IPv6-Roadmap?) · Update Purchasing Guidelines · Define a Testplan · Synchronise deployment with security readiness!

© 2015 SWITCH

58

5. Recognize and use opportunities

· Start early ­ avoid time pressure · Leverage existing Life cycles of equipment · Add IPv6 to the requirements of existing projects · Prefer step-by-step approach (know dependencies) · If indicated: use opportunity for a network re-design · Improve not degrade IT-Security by means of
collaboration

© 2015 SWITCH

59

Suggested Resources
· S. Hogg/E.Vyncke: "IPv6-Security"
Cisco Press
· NIST - Guidelines for the Secure Deployment of IPv6
http://csrc.nist.gov/publications/nistpubs/800-119/sp800-119.pdf
· Mailing List ipv6hackers
http://lists.si6networks.com/listinfo/ipv6hackers
· IPv6 Security Whitepaper, Slides and Videos from Eric Vynce, Fernando Gont, Marc Heuse, Scott Hogg, Enno Rey, Antonios Atlasis
look up in Internet with your preferred search engine

© 2015 SWITCH

60

Tool suite

Description

THC The Hacker Choice IPv6 · lots of small tools

Attack Toolkit

· thriftily documented

Marc Heuse & others

· pioneer work

· not stable or well tested

Platform / License
· C · Linux · GNU/AGPL

SI6 Networks Security assessment and troubleshooting toolkit for IPv6 Fernando Gont

· a few comprehensive tools · lots of parameters · well documented · mature

· C · Linux/xBSD/
OS X · GNU/GPL

FT6 Firewall Tester for IPv6 Oliver Eggert
chiron All-in-one IPv6 Penetration Testing Framework Antonios Atlasis
© 2015 SWITCH

· Client-Server-Application · GUI · carries a set of test cases · well documented · no further development
· new kid on the block ­ · Comprehensive useful tool set

· Python/ Scapy/PyQt4
· Lin/Win/OS X · CC (BY-NC-
SA)
· Python/ Scapy (modified)
· Linux · GNU/GPL
61

Q&A

Find more here:

Blog: securityblog.switch.ch

Twitter: @switchcert

© 2015 SWITCH

62

Differences between IPv4 and IPv6 for your reference

© 2015 SWITCH

Source: NIST 800-119 63

Generating Interface ID from MAC using

modified EUI-64 format

for your reference

08:00:27:AA:AA:AA

Step 1: Insert FFFE to get 64 Bit

0800:27FF:FEAA:AAAA

Step 2: Toggle Bit 7
0000 1000 = 08 0000 1010 = 0A
0A00:27FF:FEAA:AAAA

© 2015 SWITCH

64

Requirements for (Security) Network Equipment - Some Resources
· RIPE: RIPE-554 "Requirements for IPv6 in ICT Equipment"
­RIPE document that lists mandatory / optional RFCs for different types of equipment
­Contains a proposed text for tenders / RFPs ­http://www.ripe.net/ripe/docs/current-ripe-documents/ripe-554
· IPv6-Forum: IPv6 Ready Logo Program
­Certification Program that covers basic IPv6 requirements and some advanced features, but it is not exhaustive.
­http://www.ipv6ready.org/
· NIST/USGv6: IPv6 Profile and Testing Program
­http://www.antd.nist.gov/usgv6/

© 2015 SWITCH

65

