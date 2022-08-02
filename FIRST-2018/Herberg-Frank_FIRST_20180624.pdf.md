IPv6 Security

© 2018 SWITCH | 1

Frank Herberg frank.herberg@switch.ch
Kuala Lumpur, 25 June 2018 14:00-15:30 Room "PERAK"

SWITCH-CERT

· Location:

Switzerland

· Established: 1996

· Headcount:

15

· NREN AS559 (400K users)

· Registry ccTLDs .CH/.LI

· 10 Swiss Banks

· Industry & Logistics

· The SWITCH backbone is IPv6-enabled since 2004

© 2018 SWITCH

2

Contents
· Why IPv6 Security ­ Short introduction to the topic · Complexity is the enemy of security, Part 1-3
­IP addresses ­Extension Headers & Fragmentation ­ICMPv6 · IPv6 Tunnels · Reconnaissance · New attacks & Mitigation · Recommendations, Resources and Tools

© 2018 SWITCH

3

Increase in Internet connected devices...

Source: https://www.google.com/intl/en/ipv6/index.html

© 2018 SWITCH

4

...that's why IPv6 had been developed
· 1994: RFC 1631
The IP Network Address Translator (NAT)
· 1995: RFC 1752
The Recommendation for the IP Next Generation Protocol
· 1998: RFC 2460 DRAFT STANDARD
Internet Protocol, Version 6 (IPv6) Specification
· 2017: RFC 8200 INTERNET STANDARD
Internet Protocol, Version 6 (IPv6) Specification (obsoletes RFC 2460)

© 2018 SWITCH

5

NAT??? Quotation from RFC 1631, May 1994
4. Conclusions

NAT may be a good short term solution to the address depletion and scaling problems. This is because it requires very few changes and can be installed incrementally.

NAT has several negative characteristics that make it inappropriate as a long term solution, and may make it inappropriate even as a short term solution.

© 2018 SWITCH

6

Yes, IPv6 solves the addressing problem...
· IPv6 addresses are 128 bits long · Address space: 2128 addresses · 296 times the size of the IPv4 address space
340282366920938463463374607431768211456 4294967296

© 2018 SWITCH

7

Percentage of users who access Google over IPv6 - worldwide

© 2018 SWITCH

Source:

8

https://www.google.com/intl/en/ipv6/statistics.html

A typical IPv6 address

Subnet-ID

Global Routing Prefix 16 Bit

/48

(65536)

Different methods to build IID: · SLAAC with Modified EUI-64 · SLAAC with Randomize
Identifiers (Microsoft) · DHCPv6 · Manual configuration

2001:0620:0010:0049:3e07:54ff:fe5d:4567

64 Bit Subnet-Prefix provided via Router Advertisement
© 2018 SWITCH

64 Bit Interface Identifier IID created from MAC-address (Modified EUI-64 mechanism)
9

Basic IT Security concept: è Complexity is the enemy of security
· less transparent · bigger attack surface · higher probability of (admin.) errors · higher probability of bugs

© 2018 SWITCH

10

Adding complexity, part 1: IP addresses

© 2018 SWITCH

11

Multiple IPv6 addresses per interface (plus the IPv4 address in a Dual Stack env.)

IPv4

173.194.32.119

Link Local fe80::3e07:54ff:fe5d:abcd

Global

2001:610::41:3e07:54ff:fe5d:abcd*

· Privacy Extensions = random / temporary: Global PE 2001:610::41:65d2:e7eb:d16b:a761**

· Unique Local Address = `private' IPv6 address:

ULA

fd00:1232:ab:41:3e07:54ff:fe5d:abcd

* EUI-64: Privacy Issue (64 Bit IID the same all over the world) ** Traceability Issue (every hour/day new IP address)

© 2018 SWITCH

12

"Happy eyeballs" leads to unpredictable source address choice (RFC 6555,8305)

Safari

Firefox

© 2018 SWITCH

http://ct.de/ip

13

Certain Mobile devices configure new IPv6 address each time they wake up

· 10:35 Wake up to poll for information
2001:610::41:65d2:e7eb:d16b:a761

· 10:37 Entering power-save mode

· 10:40 Wake up to poll for information
2001:610::41:b5db:3745:463b:57a1

· 10:42 Entering power-save mode

· 10:47 Wake up to poll for information

2001:610::41:11c2:abeb:d12a:17fa

·...

© 2018 SWITCH

14

IPv6 address notation isn't unique
full form: 2001:0db8:0000:08d3:0000:8a2e:0070:7344 drop leading zeroes: 2001:db8:0:8d3:0:8a2e:70:7344 collapse multiple zeroes to `::' (once): 2001:db8::8d3:0:8a2e:70:7344 represent an IPv4 address in a IPv6 data field ::ffff:c000:0280 == ::ffff:192.0.2.128 == 192.0.2.128
© 2018 SWITCH

IP address based protection 1 - Blacklists
· IP reputation based Spam block lists for IPv6 are tricky: ­difficult for vast IPv6 address space ­Sender can utilize `nearly unlimited' source addresses ­Blacklisting of address ranges can lead to overblocking

© 2018 SWITCH

16

IP address based protection 2 - ACLs
· IPv4 based Access Control Lists (ACLs) only protect access via IPv4
· Enable IPv6? è Review all your ACLs! è Inventory??
· Maintain ACLs x2

þþþFþIirDþeRSwþDoBauaMPltatleaacoIMrbnnkwaMaavuesgnepareeannDSmgtSaoategeeartmenartyivmotbeenIanenrstnCteeItnorSIftnnaeettcrrerfoevarlfecaSrecyestem þ...
© 2018 SWITCH

Both doors locked?
17

Dual Stack è Multiple issues

That's the magic word here.

http://www.networkworld.com/article/2224154/cisco-subnet/using-dual-protocol-for-siems-evasion.html

© 2018 SWITCH

18

Summary
· Analysis and Correlation is more difficult:
­Multiple IPv6 addresses per interface ­plus the IPv4 address ­Frequently changing Source IPv6 addresses ­Different address notations
· Access Control Lists required for IPv4 and IPv6 · Black lists are required for IPv4 and IPv6 · Detecting IPv4/IPv6 distributed attacks is a
challenge

© 2018 SWITCH

19

Adding complexity, part 2: Extension Headers

© 2018 SWITCH

20

"Simplified" format of the IP header 1. fixed size è fast processing 2. options go into Extension Header

© 2018 SWITCH

21

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

processed by destination node only

43 Routing Header

Lists IPv6 nodes that must be "hopped" on the way to dest.

different types, partly deprecated (RFC 5095), Mobile IP (RFC 6275)

44 Fragmentation Fragmentation (at

Header

source)

only source can fragment, processed by destination node only

Other examples: 6:TCP, 17:UDP, 58:ICMPv6, 50/51: ESP/AH (IPSec)

© 2018 SWITCH

22

Extension Headers are chained

IPv6-Header
Next Header = 43 (Routing)

Routing-Hdr.
Next Header = 44 (Fragment)

Frgmnt-Hdr.
Next Header = 6 (TCP)

TCP-Header & DATA

© 2018 SWITCH

23

The problem is... (RFC2460, RFC 7045)
· The number of EHs is not limited L
· The number of options within an (Hop-byHop or Destination) Options Header is not limited L
· There is no defined order of EHs (only a recommendation) L
(Exception: Hop-by-Hop Options Header must be first and nonrecurring)
· EH have different formats L

© 2018 SWITCH

24

Possible Threat: High Number of EHs

· An attacker could create packets with high number of EH è to try to evade FW / IPS / RA-Guard / other security è might crash or DOS the destination system

IPv6-Header
Next Header = ...

Ext-Hdr.

NeNxEeNtxExHeNttxeExH-eNtaHtxeExH-edNtaHdtxeeExH-edNtrarHdtxee.ExH-e=dNtrarHdtxe...e.ExH-e=dNtrarHNdtxe...e.ExH-e=dtrearHNdtxe...e.ExH-x=dtrearHNdtte...e.ExH-x=dEHrearHNdtte...e.Ex-x=deExHrearHNdtte...a.xt-x=deExH-redrHNdtte...aH.t-xe=eExH-redrHNdtr...aH.dtxe=eExH-e=drNdtr...arH.dtxe...e.ExH-e=drNtrarH.dtxe...e.ExH-e=dNtrarHdtxe...e.ExH-e=dNtrarHdtxe...e.ExH-e=dtrarHdtxe...e.ExH-=dtrarHdte...e.ExH-=drarHdte...e.x-=drarHdte....-=drrHde....=rrd....=r....

TCPHeader

Next HeEaxdte-rH=d...r. Next Header =...

Next Header =...

Next Header =...

DATA ...

Mitigation option: Drop packets with more than x EHs

© 2018 SWITCH

25

Possible Threat: Manipulation of the EHs
· An attacker could perform header manipulation to create attacks
­ Fuzzing (try everything ­ it's not limited) ­ add (many) unknown options to an EH, e.g. Hop-by-hop-Options
· The Destination node / Server has to process crafted EHs è Destination System might crash

IPv6-Header
Next Header = 43 (Routing)

EH
Next Header = 0
(Hop-by-hop Options)

EH
)/&(/&"%ç&+=&+=/ %ç/%/=()/

TCPHeader

DATA ...

Mitigation option: Perform sanity checks on EH (format /

no. of options)

© 2018 SWITCH

26

Possible Threat: Covert Channel
· An attacker could use Extension Headers as a covert channel
èto exchange payload undiscovered

IPv6-Header
Next Header = 43 (Routing)

EH
Next Header = 0
(Hop-by-hop Options)

EH
Hidden Data

TCPHeader

DATA ...

Mitigation option: Drop unknown EH

© 2018 SWITCH

27

Fragmentation makes it worse

· Splitting an IP packet into smaller packets (receiver has to

reassemble it)

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

© 2018 SWITCH

28

Fragmentation Issues 1/3
· Attacker can try to bypass filtering/detection (IDS/IPS evasion technique)
­by putting the attack into many small fragments
­by combination of multiple extension headers and fragmentation so that layer 4 header is in 2nd fragment
èAnalyzing becomes more difficult / resource consuming

© 2018 SWITCH

29

Fragmentation Issues 2/3
· Attacker can exploit weaknesses in the destination
­by crafting fragments if method of reassembling isn't solid (Example: Overlapping fragments, nested fragments)

© 2018 SWITCH

30

Fragmentation Issues 3/3
· Attacker can DOS destination ­send lots of incomplete fragment sets (M-flag 1 è more fragments) ­End host has to wait for timeout, allocates kernel memory for reassembly ­typical reassembly timeout is 60s (ICMPv6 Type 3 Code 1)

© 2018 SWITCH

31

Detect/Prevent Fragmentation Attacks
· Monitor the amount of fragmented packets èhigh increase might indicate attack

· Block fragments which are below a certain size (if not the last one of a set [M(ore)-flag=0])
èdon't appear in proper communication

· Look for Inspection capabilities of fragmented packets
­ e.g. Cisco: Virtual Fragment Inspection (VFR) ipv6 virtual-reassemly

è See also RFC 6980, 7112, Blackhat-Paper: Atlasis

"Evasion of High-End IDPS Devices at the IPv6 Era"

© 2018 SWITCH

32

Summary
· Chained Extension Headers increase complexity for packet inspection (especially at line speed)
· Fragmentation adds more complexity* · Crafted packets can evade Security controls* · and harm destination devices* · Understand and consider the mitigation options · Consider testing your Security devices
*IPv4 implementations are much simpler and more robust

© 2018 SWITCH

33

Adding complexity, part 4: Tunnels

© 2018 SWITCH

34

Some IPv6 tunneling characteristics
· Tunnel endpoints can configure automatically · or deliberate (by a user/attacker) and unknowingly
(for the operator) · Tunnels can possibly traverse Security devices
(Firewall, NAT-GW) · Tunnels can be used as covert channels or
backdoors

© 2018 SWITCH

35

NATO Whitepaper on data exfiltration over IPv6 transition mechanisms

«Tunnel-based IPv6 transition mechanisms could allow the set-up of egress communication channels over an IPv4-only or dual-stack network while evading detection by a network intrusion detection system (NIDS).»

© 2018 SWITCH

Source: https://ccdcoe.org/multimedia/hedgehog-fog-creating-and-

detecting-ipv6-transition-mechanism-based-information.html

36

Detect IPv6 tunnels in network logs
Look inside logs / NetFlow records:
· IPv4 Protocol type 41 (ISATAP, 6to4 traffic) · IPv4 to UDP 3544 (Teredo traffic) · Traffic to 192.88.99.1 (6to4 anycast server) · DNS server log: resolution of "ISATAP"

è Better: deploy native IPv6 to avoid tunnels

© 2018 SWITCH

37

RDecetoencnt aIPisvs6atnucnene/lNs eintwnoertwk osrckalnongisng

for your reference

Look inside logs / NetFlow records:
· IPv4 Protocol type 41 (ISATAP, 6to4 traffic) · IPv4 to UDP 3544 (Teredo traffic) · Traffic to 192.88.99.1 (6to4 anycast server) · DNS server log: resolution of "ISATAP"

© 2018 SWITCH

38

It's not possible anymore...

· Sequentially scanning IPv6 address space is not feasible anymore
· /64 can have 1.8e^19 hosts · = 4'294'967'296 times the size of the IPv4 address
space · This will take decades

tè

© 2018 SWITCH

39

It's not still possible anymore...

You have to be smarter!

· DNS bruteforcing on common hostnames

­using a dictionary

­or sequential a,aa,aaa,aab

· Alive bruteforcing on typical addresses

­low range: ::1,::2,::3,...

­DHCP: sequential ranges 1000-2000 (find one, got all)

­Serviceport in IP addresses numbers: ::80,::53,53:1,53:2

­Autoconfiguration with MAC: 16 Bit fixed "fffe", 24 Bit are per Vendor-ID, 24 Bit must be guessed (16'777'216)

­Addresses using words 2001:db8::cafe:f00d:babe:beef

­other guessable patterns

© 2018 SWITCH

40

Some research has been done by Marc Heuse: · DNS bruteforcing: common hostnames
­ with 1900 words get 90% of systems in DNS
· Alive bruteforcing: typical addresses
­ with 2000 addresses get 66% of the systems
· Combined (and use of brain):
­ ca. 90-95% of servers are found
è Target Discovery is still possible

© 2018 SWITCH

41

Shodan: Participate in pool.ntp.org as IPv6 endpoints; if NTP clients connect for time sync => scan them

© 2018 SWITCH

42

Tools: dnsdict6, alive26

for your reference

· DNS Dictionary Scan: dnsdict6 ­x target.org
· IP Pattern Scan: alive26 -d eth1 2001:beef:123:0-ff:0:0:0:0-1f

More information
· RFC 7707 "Network Reconnaissance in IPv6 Networks" (March 2016)

© 2018 SWITCH

43

Adding complexity, part 3: Internet Control Message Protocol version 6

© 2018 SWITCH

44

ICMPv6 is much more complex than ICMP

Error-Messages (1-127)
1:Destination Unreachable 2:Packet too big (PMTUD) 3:Time Exceeded (Hop Limit) 4:Parameter Problem

Info-Messages (Ping)

128:Echo Request

129:Echo Reply

Multicast Listener Discovery (MLD, MLD2)
130:Multicast Listener Query 131/143:Multicast Listener Report/2 132:Multicast Listener Done
Neighbor Discovery (NDP), Stateless Autoconfiguration (SLAAC)
133:Router Solicitation 134:Router Advertisement 135:Neighbor Solicitation (DAD) 136:Neighbor Advertisement (DAD) 137:Redirect Message

Other (Router Renumbering, Mobile IPv6, Inverse NS/NA,...) 138-153

© 2018 SWITCH

Filtering ICMPv6 is more complex
see RFC 4890 (38 pages)
Several new attack vectors (local, remote)
45

SLAAC Step 1: configure link-local address

A MAC: 3c:07:54:5d:40:66

R1

B

C

Generate a link local address (FE80), from MAC address state: tentative

Send NS for DAD (from :: to Solicited-Node multicast addr ff02::1:ffAB:CDEF)

Either receive a NA (to multicast ff02::1) to show an address conflict: stop autoconfig

or change state of link local address to: preferred fe80::3e07:54ff:fe5d:4066

© 2018 SWITCH

46

SLAAC Step 2: configure global addresses

A fe80::3e07:54ff:fe5d:4066

R1

B

C

3c:07:54:5d:40:66

Send RS to All-Router-Multicast-Address (ff02::2)

RA: "Prefix is 2001:620:0:49::"

If RA received: generate global routable address(es) from received prefix(es) and configure default route

Send NS for DAD (:: => Solicited-Node multicast addr) Either receive a NA to show an address conflict: don't use address

or configure Global Address(es) 2001:....

© 2018 SWITCH

47

SLAAC successful:
eth0: Link Layer Address: 3c:07:54:5d:40:66 Link Local Address: fe80::3e07:54ff:fe5d:4066 Global Address: 2001:620::49:3e07:54ff:fe5d:4066
A Global Address: 2001:620::49:1c78:9b29:27c1:7564
· Default Router Address (implicitly learned from RA) · Options (RDNSS RFC 8106,...)

IPv6 addresses don't live forever · IPv6 addresses have count down timers (for link local = infinite) · Regular RAs reset them · Intended for Renumbering scenario

© 2018 SWITCH

48

Example 1: Add a rogue Router

© 2018 SWITCH

49

Rogue RA Principle

I am your Default Router!

A

R1

C

B

Attacker sends Router Advertisements
Clients configure new default router
© 2018 SWITCH

Clients configure new default router
50

Rogue RA ­ Denial of Service

BLOCK

R1 A

B

B

Default Router

Attacker attracts traffic, ending up in a black hole

© 2018 SWITCH

51

Rogue RA ­ Man in the Middle Attack

R1 A

FORWARD

B

B

Default Router

Attacker can intercept, listen, modify unprotected data

© 2018 SWITCH

52

Rogue RA Attacking Tool

for your reference

fake_router6 / fake_router26 Announce yourself as a router and try to become the default router. If a non-existing link-local or mac address is supplied, this results in a DOS.

Syntax: fake_router26 [-E type] [-A network/prefix] [-R network/prefix] [-D

dns-server] [-s sourceip] [-S sourcemac] [-ardl seconds] [-Tt ms] interface

Options:

-A network/prefix

add autoconfiguration network (up to 16 times)

-a seconds

valid lifetime of prefix -A (defaults to 99999)

-R network/prefix

add a route entry (up to 16 times)

-r seconds

route entry lifetime of -R (defaults to 4096)

-D dns-server

specify a DNS server (up to 16 times)

-d seconds

dns entry lifetime of -D (defaults to 4096

-M mtu

the MTU to send, defaults to the interface setting

-s sourceip

the source ip of the router, defaults to your link local

-S sourcemac

the source mac of the router, defaults to your interface

-l seconds

router lifetime (defaults to 2048)

-T ms

reachable timer (defaults to 0)

-t ms

retrans timer (defaults to 0)

-E type

Router Advertisement Guard Evasion option. Types:

H

simple hop-by-hop header

1

simple one-shot fragment. hdr. (can add multiple)

D

insert a large destin. hdr. so that it fragments

Examples: -E H111, -E D

Example: fake_router6 eth1 2004::/48

© 2018 SWITCH

53

Attack: Rogue IPv6 Router 

08:00:27:AA:AA:AA

08:00:27:BB:BB:BB

fe80:a00:27ff:feaa:aaaa

fe80:a00:27ff:febb:bbbb

2001:db8:1::a00:27ff:feaa:aaaa 2001:db8:1::a00:27ff:febb:bbbb

GW: fe80::a00:27ff:fe11:1111 GW: fe80::a00:27ff:fe11:1111

GW: fe80::a00:27ff:fe66:6666 GW: fe80::a00:27ff:fe66:6666

08:00:27:66:66:66 fe80:a00:27ff:fe66:6666 2001:db8:1::a00:27ff:fe66:6666 GW: fe80::a00:27ff:fe11:1111

Attacker

fe80::a00:27ff:fe11:1111

Internet

54

© 2018 SWITCH

Example 2: Delete legitimate Router

© 2018 SWITCH

55

Router Lifetime 0 Attack

R1 is down (Router lifetime = 0)

R1

A

B

B

Attacker sends RAs with Lifetime = 0

Remove legitimate router from routing table

© 2018 SWITCH

56

Router Lifetime 0 Attack

for your reference

kill_router6
Announce (to ff02:1) that a router is going down (RA with Router Lifetime 0) to delete it from the routing tables.
Using asterix '*' as router-address, this tool will sniff the network for RAs and immediately send a kill packet.
Option -H adds hop-by-hop, -F fragmentation header and -D dst header. Syntax: kill_router6 [-HFD] interface router-address [srcmac [dstmac]] Example: kill_router6 eth1 `*'

© 2018 SWITCH

57

MITM-Attack: rogue RA plus lifetime 0 clones

08:00:27:AA:AA:AA

08:00:27:BB:BB:BB

fe80:a00:27ff:feaa:aaaa

fe80:a00:27ff:febb:bbbb

2001:db8:1::a00:27ff:feaa:aaaa 2001:db8:1::a00:27ff:febb:bbbb

GW: fe80::a00:27ff:fe11:1111 GW: fe80::a00:27ff:fe11:1111

GW: fe80::a00:27ff:fe66:6666 GW: fe80::a00:27ff:fe66:6666

08:00:27:66:66:66 fe80:a00:27ff:fe66:6666 2001:db8:1::a00:27ff:fe66:6666 GW: fe80::a00:27ff:fe11:1111

Attacker forwards or blocks
© 2018 SWITCH

Internet

fe80::a00:27ff:fe11:1111
58

Demo 3: Duplicate Address Detection DOS

© 2018 SWITCH

59

What is DAD?
Duplicate Address Detection, RFC 2462, Section 5.4 A mechanism assuring that two IPv6 nodes on the same link are not using the same address
(remember SLAAC slides at the beginning)
· DAD is performed on unicast addresses prior to assigning them to an interface
· DAD must take place on all unicast addresses, regardless of whether they are obtained through stateful (DHCP), stateless or manual configuration

© 2018 SWITCH

60

Duplicate Address Detection - DOS

I want to use this IPv6 address

sorry, I have this address already

A

B

C

A sends NS for DAD Attacker sends NA for each NS

A can't configure any IPv6 address

© 2018 SWITCH

61

Duplicate Address Detection - DOS
· Attacker replies to each DAD-NS · Victim can't configure an IPv6 address at all · Works also if Autoconfiguration is disabled: DAD is
mandatory also for DHCPv6 or manually configured addresses! · (Linux observation on manually configured addresses => 2 min timeout => enable them anyway)

© 2018 SWITCH

62

Duplicate Address Detection - DOS

for your reference

dos-new-ip6
This tool prevents new ipv6 interfaces to come up, by sending answers to duplicate ip6 checks (DAD). This results in a DOS for new ipv6 devices.
Syntax: dos-new-ip6 <interface>

© 2018 SWITCH

63

Attack: Duplicate Address Detection DOS 

08:00:27:AA:AA:AA fe80:a00:27ff:feaa:aaaa
08:00:27:66:66:66 fe80:a00:27ff:fe66:6666 2001:db8:1::a00:27ff:fe66:6666 GW: fe80::a00:27ff:fe11:1111

08:00:27:BB:BB:BB

Attacker

Internet

© 2018 SWITCH

64

DAD DOS Mitigation
· NS/NA can't be blocked because it's used also for Address Resolution ("ARP")
· But: Many Switches can forward multicast packets only to the necessary ports è "MLD snooping"

© 2018 SWITCH

65

Example 4: Add your addresses to the network

© 2018 SWITCH

66

Rogue Router configures new IP addresses in the network

for your reference

Attack command:

fake_router6 eth0 1234::/64 fake_router26 ­A 5678::/64 eth0

© 2018 SWITCH

67

Attack: Add new addresses 

08:00:27:AA:AA:AA

08:00:27:BB:BB:BB

fe80:a00:27ff:feaa:aaaa

fe80:a00:27ff:febb:bbbb

2001:db8:1::a00:27ff:feaa:aaaa 2001:db8:1::a00:27ff:febb:bbbb

dead:beef::a00:27ff:feaa:aaaa dead:beef::a00:27ff:feaa:aaaa

GW: fe80::a00:27ff:fe11:1111 GW: fe80::a00:27ff:fe11:1111

08:00:27:66:66:66 fe80:a00:27ff:fe66:6666 2001:db8:1::a00:27ff:fe66:6666 GW: fe80::a00:27ff:fe11:1111

Attacker

Internet

© 2018 SWITCH

68

This also works in an "IPv4 only" network!

IPv6-enabled hosts will configure IPv6 addresses and can then be attacked over IPv6 è open second door (ACLs, etc.)

More Information: http://securityblog.switch.ch/2014/08/26/ipv6insecurities-on-ipv4-only-networks/

© 2018 SWITCH

69

Example 5: RA Flooding

© 2018 SWITCH

70

Router Advertisement Flooding

2004:: is a prefix 2005:: is a prefix 2006:: is a prefix 2007:: is a prefix...

A

R1

B

C

Attacker floods LAN with Router Advertisements

© 2018 SWITCH

71

Router Advertisement Flooding

for your reference

flood_router6, flood_router26
Flood the local network with router advertisements. Each packet contains 17 prefix and route entries (only Version _26)
-F/-D/-H add fragment/destination/hop-by-hop header to bypass RA guard security. Syntax: flood_router6 [-HFD] interface Example: flood_router6 eth0

© 2018 SWITCH

72

Attack: Flood new addresses / default routes



08:00:27:AA:AA:AA

08:00:27:BB:BB:BB

fe80:a00:27ff:feaa:aaaa

fe80:a00:27ff:febb:bbbb

2001:db8:1::a00:27ff:feaa:aaaa 2001:db8:1::a00:27ff:febb:bbbb

0f2Ge80W8:0001:0::af:de20b87080::6:2:1:67a:::f0f6a:0f60e::0266:7662f:7f6:fff6e:f61e166G:16W1:62G1:6012GWf600e2GW61:0802GW:f1:00de02GW:f:1:b80de:02GWa:f801:b80de02G0W:::f801:b810:de002GaW:::f80:1:b810::de0:02Ga2W::a:f80:1:b810:d0e0:072Ga0W::a:f80:1:b810:d0ef0:002G2a0Wf::a:f80:1:b:810:d0e:07:002Gf2a0W2::a:f8e0:1:b810f:d0e:07:002G27fa0W2:1:a:f80:1::b810f:d0e:07f:f002G127fa0W2::fa:ef80:1::b810f::d0e:07f:f002G27faf0W12:1:fa:ef80:1:e:b810f::d0e:071f:f0102G27faf0W12::fa:eaf80:1:e:b8101f::d0e:071f:f002G27faf10W1a2::fa:eaf810:1:e:b810f::d0e:0171f:f002G2:7faf10W1a2::fa:eaf8a0:1:e:b1810f::d0e:0171f:f002G2:7faf10W1a2:a:f1a:eaf8a0:1:e:b1810f::d0e:0171f:f002G2:7faaf10W1a2:a:f1a:eaf8a0:1:e:b1810f::d0e:0G171f:f0a02:7faaf10W1a2:a:f1a:eaf8a0:1:e:b1810f::d0e:171f:f0a0W2:7faaf101a2:a:f1a:eaf8a0:1:e:b181f::d0e:171f:f0a02:7faaf101a2:a:f1a:eaf:8a0::eb181f::d0e:171f:f0a02:7faaf101af2:a:f1aea8a0::eb18e1f::0:171f:f0a02:7faaf101a2:a:f1aea8a08::e11f::0:171f:f0a02:7faaf101a2:a:f01aeaa::e11f::0:171f:f0a02:7faaf:101a2af1aeaa::e:1f:0:171f:f0aa02:7faf101a2af1aeaa:e1:f:00:171ffa02:7faf101a2af1eaa:e1:0f::171ffa02:7faf11a2af1eaa::e1f::1721ffa:7faf11a2af1eaa:e1f:711ffa:7faf11aaf1eaa:ef1:11fffa:af11aaf1e:aae1:f11a:af11eaa1aae1:11a1:a1aa1aa1:11a:a1aa1a:11a1:aa1a11aaa11aa1a Attacker

fe80::a00:27ff:fe11:1111

Webserver 2001:db8:2::2

© 2018 SWITCH

73

ipconfig

taskmgr: CPU load

© 2018 SWITCH

74

Rogue RA Attack Conclusions
· Everybody on the local network can · add IPs, delete / change default router · DOS network · try a MITM attack · decrease Network-Performance · decrease System-Performance · crash Systems · open 2nd door (IPv6 autoconf)

© 2018 SWITCH

75

Different Mitigation Approaches, see RFC 6104
· Disable RA processing (it's needed for DHCPv6)
· Filter on Switch: RA-Guard, Port-ACLs (can be bypassed using EH)
· Host based filters configured to accept RAs only from valid Router addresses (works only in managed environment)
· Deprecation Daemon: Detect incorrect RAs and then in turn send a deprecating RA with a router lifetime of zero (not for flooding)
· Partitioning, Microsegmentation or Host Isolation
· DHCPv6-only? No: RA informs about use of DHCPv6

© 2018 SWITCH

76

One size doesn't fit all! (Example)

Zone

Rogue RA Mitigation Measure

Internal Network

Router-Preference=high / Monitor NDP Managed Switch (RAGuard, PACLs)

Internal

Router-Preference=high / Monitor NDP

Disable RA processing
Server-Zone

DMZ

Router-Preference=high / Monitor NDP Disable RA processing

cost feasibi effect (+ o -) lity (+ o -)

+/- +

0/+

+

+

+

+

+

+

Guestnet Wired

Router-Preference=high

-

Managed Switch with RA Guard or Port

ACLs

+

+

Guestnet Wireless

Router-Preference=high Partitioning

+/o +

+

© 2018 SWITCH

77

Some other Attacks:
· Remote Neighbor Cache Exhaustion Attack · Ping flood big subnet, small neighcache table
· Multicast Listener Discovery DOS · Attacker messes with MLD messages
· Fragmentation Reassembly Time exceeded DOS · Attacker sends lot of fragmented packets with Moreflag set
· Also well known attacks from IPv4 like · ICMP Redirect è ICMPv6 Redirect · ARP spoofing è Neighbor Cache spoofing

© 2018 SWITCH

78

Remote Neighbor Cache Exhaustion Attack

for your reference

Mitigation:

· Ingress ACL allowing only valid destination and dropping the rest
· Maybe you have a built-in Rate limiter · Cisco Feature: "IPv6 Destination Guard"
­ (is coming...)
· Workaround: Allocate /64, configure /120 (brakes SLAAC, maybe more)

· https://insinuator.net/2013/03/ipv6-neighbor-

cache-exhaustion-attacks-risk-assessment-

©m201i8tiSgWaITCtiHon-strategies-part-1/

79

Wrap-up

© 2018 SWITCH

80

Bottom line: How IPv6 affects IT-Security
· Higher complexity (protocol and network) · Lower maturity (especially security devices) · Less Know-how / experience · New / more Attack vectors · Less visibility (Monitoring) · Multiprotocol Correlation issues · IPv6 risks also in "IPv4-only" network
(Autoconfiguration, Tunnels)

© 2018 SWITCH

81

Questions to ask yourself

· Do you monitor IPv6 traffic on your network?

· Do your firewalls filter (tunneled) IPv6 traffic?

· Are all your tools Dual-Protocol-ready?

· Do you have enough know-how about IPv6 and its specific attacks to detect them?

· If you rely on IP-based Access Control, do you maintain it for both protocols?

· Can you correlate multi protocol attacks?

· Do you have IPv6 requirements for new / ongoing projects and procurement

· © 2018 SWITCH

82

Recommended IPv6 Security Tools

Tool suite

Description

Platform / License

THC The Hacker Choice IPv6 Attack Toolkit Marc Heuse & others

· lots of small tools (70) · poorly documented · pioneer work · C library available

·C · Linux · GNU/AGPL

SI6 Networks Security assessment and troubleshooting toolkit for IPv6 Fernando Gont
chiron All-in-one IPv6 Penetration Testing Framework Antonios Atlasis

· a few comprehensive tools (12)
· lots of parameters · well documented · mature
· Craft arbitrary IPv6 packets to test IDS/IPS evasion
· And other interesting tools

·C · Linux/xBSD/OS
X · GNU/GPL
· Python/Scapy (modified)
· Linux · GNU/GPL

© 2018 SWITCH

83

Example Setup with 5 VMs

08:00:27:AA:AA:AA

08:00:27:BB:BB:BB

fe80:a00:27ff:feaa:aaaa

fe80:a00:27ff:febb:bbbb

2001:db8:1::a00:27ff:feaa:aaaa 2001:db8:1::a00:27ff:febb:bbbb

08:00:27:66:66:66

GW: fe80::a00:27ff:fe11:1111 GW: fe80::a00:27ff:fe11:1111

fe80:a00:27ff:fe66:6666

Randomize Identifiers disabled

2001:db8:1::a00:27ff:fe66:6666

GW: fe80::a00:27ff:fe11:1111 Privacy Extensions disabled

Win7

Attacker

SW1

SW2
Webserver: http://[2001:db8:2::2]/
© 2018 SWITCH

eth0: forwarding enabled

R1

2001:db8:1::1 fe80::a00:27ff:fe11:1111

radvd:

Prefix 2001:db8:1::/64

eth1:

2001:db8:2::1

2001:db8:2::2
GW: 2001:db8:2::1
84

Recommended Resources
· S. Hogg/E.Vyncke: "IPv6-Security"
Cisco Press
· NIST - Guidelines for the Secure Deployment of IPv6
http://csrc.nist.gov/publications/nistpubs/800-119/sp800-119.pdf
· Mailing List ipv6hackers
http://lists.si6networks.com/listinfo/ipv6hackers
· IPv6 Security Whitepaper, Slides and Videos from Eric Vynce, Fernando Gont, Marc Heuse, Scott Hogg, Enno Rey, Antonios Atlasis
scan Internet with your preferred search engine

© 2018 SWITCH

85

Thyaonukr ayottuenfotior n!

frank.herberg@switch.ch

© 2018 SWITCH

86

