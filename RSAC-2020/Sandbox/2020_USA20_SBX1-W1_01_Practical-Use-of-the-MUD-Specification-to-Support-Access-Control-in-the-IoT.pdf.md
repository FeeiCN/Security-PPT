SESSION ID: SBX1-W1
Mitigating Network-Based Attacks Using MUD
Improving Security of Small-Business and Home IoT Devices
Practical Use of the MUD Specification

Dr. Parisa Grayeli
Principal Information Systems Engineer MITRE/NIST National Cybersecurity Center of Excellence (NCCoE)

Blaine Mulugeta
Cyber Engineer MITRE/NIST National Cybersecurity Center of Excellence (NCCoE)
#RSAC

NIST NCCoE's Mission
Accelerate adoption of secure technologies: Collaborate with innovators to provide real-world, standards-based cybersecurity capabilities that address business needs
2

Engagement and Business Model

DEFINE

ASSEMBLE

BUILD

ADVOCATE

OUTCOME: Define a scope of work with industry to solve a pressing cybersecurity challenge

OUTCOME: Assemble teams of industry orgs, govt agencies, and academic institutions to address all aspects of the cybersecurity challenge
3

OUTCOME: Build a practical, usable, repeatable implementation to address the cybersecurity challenge

OUTCOME: Advocate adoption of the example implementation by using the practice guide

Introduction
· There will be 25 billion connected things in use by 2021 (per Gartner)
· As IoT devices become more common in homes and businesses, security concerns are also increasing
· IoT devices represent one of the largest attack surfaces ­ Some have minimal security, are unprotected or are difficult to secure
· IoT devices have been exploited to launch DDoS attacks (e.g. Mirai)
4

Mitigating Network-Based Attacks Using MUD
Improving the security of small-business and home IoT devices

Challenge
· IoT devices are given full connectivity to the internet by default
· Device security may not be a priority due to processing, timing, memory, and power constraints
· Networked devices can be detected within minutes and exploited due to known security flaws, leading to easily scalable attacks

Solution
· NCCoE developed a proof of concept implementation for the home or small business network to address some of these security concerns in collaboration with Industry collaborators
· Use network gateway components and securityaware IoT devices that leverage the Manufacturer Usage Description (MUD) Specification (RFC 8520)
· Using MUD the network will automatically permit the IoT device to send and receive the traffic it requires to perform as intended, and the network will prohibit all other communication with device
5

Typical Home/Small Business Network (Without MUD)
6

Attacker Home/Small Business

Target Internet

Manufacturer Server

7

Attacker Home/Small Business

Target Internet

Manufacturer Server

8

Attacker Home/Small Business

Target Internet

Manufacturer Server

9

Attacker Home/Small Business

Target Internet

Manufacturer Server

10

Attacker Home/Small Business

Target Internet

Manufacturer Server

11

Attacker Home/Small Business

Target Internet

Manufacturer Server

12

Attacker Home/Small Business

Target Internet

Manufacturer Server

13

Attacker Home/Small Business

Target Internet

Manufacturer Server

14

Attacker Home/Small Business

Target Internet

Manufacturer Server

15

Attacker Home/Small Business

Target Internet

Manufacturer Server

16

Typical Home/Small Business Network (With MUD)
17

Attacker Home/Small Business

Target Internet

Manufacturer Server

18

Attacker Home/Small Business

Target Internet

Manufacturer Server

19

Attacker Home/Small Business

Target Internet

Manufacturer Server

20

Attacker Home/Small Business

Target Internet

Manufacturer Server

21

Attacker Home/Small Business

Target Internet

Manufacturer Server

22

Architecture Overview
23

Reference Architecture
Home or Small Business Network
MUD Manager

(2) MUD URL

(5) Device traffic filters

(3a) HTTPS get URL (MUD file) (4a) HTTPS get URL (Signature file)
(3b) MUD file (4b) Signature file

MUD File Server

Router or Switch
(1) MUD URL emitted via, e.g., DHCP, X.509, or LLDP

Threat Signaling

Threat Signaling Server (w/ Intel Provided data)

Devices

Update Protocol
24

Update Server

Lab Architecture
25

Project Status
Build 1, 2 and 4 Practice Guide SP 1800-15
­ Preliminary Draft Published in Nov. 2019
Currently working on Build 3
­ Includes MUD and DPP (Device Provisioning Protocol)
https://www.nccoe.nist.gov/projects/building-blocks/mitigating-iot-based-ddos
26

Collaborators
27

Build 1 Demo Presentation
28

BUILD 1 ­ CISCO
· Cisco MUD Manager and FreeRadius
· Cisco Catalyst Switch · NCCoE hosted MUD File Server · MUD File · DigiCert certificates · MUD-capable IoT devices:
· Molex PoE GW and Light Engine
· Devkits · Non-MUD-capable IoT devices · NCCoE hosted Update Server · NCCoE hosted Unapproved
Server · NCCoE hosted MQTT Broker
Server · Forescout and Forescout
Enterprise Manager
PHASE 1

BUILD 2 ­ MASTERPEACE & GCA

BUILD 4 - NIST

· Yikes! Router including MUD
Manager · Yikes! Cloud & Yikes! Mobile App · MasterPeace hosted MUD File
Server · MUD File · DigiCert certificates · MUD-capable IoT devices - Devkits · Non-MUD-capable IoT devices · NCCoE hosted Update Server · NCCoE hosted Unapproved Server · GCA Quad9 Threat Agent
integrated into Yikes! Router · GCA Quad9 Threat Signaling MUD
Manager integrated into Yikes!
Router · GCA Quad9 Threat-Signaling DNS
Services · GCA Quad9 Threat API · ThreatSTOP Threat MUD File Server · ThreatSTOP Threat MUD File

· OpenDaylight SDN Controller
including MUD Manager · NCCoE hosted MUD File Server · MUD File · Wireless SDN Switch · DigiCert certificates · MUD-capable IoT devices - Devkits · Non-MUD-capable IoT devices · NCCoE hosted Unapproved Server · Approved Server

BUILD 3 - CABLELABS
· Micronets Gateway · Micronets Manager · MUD Manager · MUD Registry · MSO Portal · MUD File Server · MUD File · DigiCert certificates · MUD-capable IoT devices - Devkits · Non-MUD-capable IoT devices · Update Server · Unapproved Server · Micronets Mobile App

PHASE 2 29

PHASE 3

Logical Architecture ­ Build 1

Home or Small Business Network

One Device

MUD Manager

(2b) MUD URL

(5a) Device traffic filters

FreeRadius

(3a) HTTPS get URL (MUD file) (4a) HTTPS get URL (Signature file)

(3b) MUD file (4b) Signature file

MUD File Server

(2a) MUD URL

(5b) Device traffic filters

Router or Switch

(1) MUD URL in DHCP transaction

(6) IP Address

Devices

Update Protocol
30

Update Server

Step 1: Connect Device
Home or Small Business Network
Router or Switch
(1) MUD URL in DHCP transaction
Devices
31

Step 1: Connect Device
1. No session on interface

Router or Switch

2. Connect MUD enabled IoT Device

DDeevviicceess

3. Interface state changed to up

32

Router or Switch

Step 2a/2b: Send MUD URL to MUD Manager
Home or Small Business Network
One Device
MUD Manager (2b) MUD URL FreeRadius
(2a) MUD URL
Router or Switch
(1) MUD URL in DHCP transaction
Devices
33

Step 2a/2b: Send MUD URL to MUD Manager
1. FreeRadius service receives and passes MUD URL

FreeRadius

34

Step 2b: Send MUD URL to MUD Manager
2. MUD Manager receives MUD enabled IoT Device information from FreeRadius Service

MUD Manager

35

Step 3/4: Get MUD and Signature File

Home or Small Business Network
One Device
MUD Manager
(2b) MUD URL
FreeRadius

(3a) HTTPS get URL (MUD file) (4a) HTTPS get URL (Signature file)

(3b) MUD file (4b) Signature file

MUD File Server

(2a) MUD URL
Router or Switch
(1) MUD URL in DHCP transaction

Devices
36

Step 3/4: Get MUD and Signature File

1. Get MUD and Signature file

MUD Manager

2. Verify MUD file
37

MUD Manager

Step 5a: Send Device Traffic Filters

Home or Small Business Network

One Device

MUD Manager

(2b) MUD URL

(5a) Device traffic filters

FreeRadius

(3a) HTTPS get URL (MUD file) (4a) HTTPS get URL (Signature file)

(3b) MUD file (4b) Signature file

MUD File Server

(2a) MUD URL
Router or Switch
(1) MUD URL in DHCP transaction

Devices
38

Step 5a: Send Device Traffic Filters
1. MUD File parsed and translated to ACL (rules)

MUD Manager

2. MUD Manager sends ACL
39

MUD Manager

Step 5a: Send Device Traffic Filters
3. FreeRadius receives ACL from MUD Manager

FreeRadius

40

Step 5b: Send Device Traffic Filters

Home or Small Business Network

One Device

MUD Manager

(2b) MUD URL

(5a) Device traffic filters

FreeRadius

(3a) HTTPS get URL (MUD file) (4a) HTTPS get URL (Signature file)

(3b) MUD file (4b) Signature file

MUD File Server

(2a) MUD URL

(5b) Device traffic filters

Router or Switch

(1) MUD URL in DHCP transaction

Devices
41

Step 5b: Send Device Traffic Filters
1. FreeRadius sends ACL to switch 2. ACL received, and configurations applied
42

FreeRadius
Router or Switch

Step 6: IP Address Assigned

Home or Small Business Network

One Device

MUD Manager

(2b) MUD URL

(5a) Device traffic filters

FreeRadius

(3a) HTTPS get URL (MUD file) (4a) HTTPS get URL (Signature file)

(3b) MUD file (4b) Signature file

MUD File Server

(2a) MUD URL

(5b) Device traffic filters

Router or Switch

(1) MUD URL in DHCP transaction

(6) IP Address

Devices
43

Step 6: IP address assigned

1. IoT Device receives IP address

Devices

44

Step 6: IP address assigned

1. Show access-session

Router or Switch

2. Show access-lists

Router or Switch

45

Step 7: Test communication

Home or Small Business Network

One Device

MUD Manager

(2b) MUD URL

(5a) Device traffic filters

FreeRadius

(3a) HTTPS get URL (MUD file) (4a) HTTPS get URL (Signature file)

(3b) MUD file (4b) Signature file

MUD File Server

(2a) MUD URL

(5b) Device traffic filters

Router or Switch

(1) MUD URL in DHCP transaction

(6) IP Address

Devices

Update Protocol
46

Update Server

Step 7: Test communication

1. Test browsing to "Update Server"

Devices
2. Test browsing to unapproved server

Devices

47

Build 2 Demo Presentation
48

BUILD 1 ­ CISCO
· Cisco MUD Manager and FreeRadius
· Cisco Catalyst Switch · NCCoE hosted MUD File Server · MUD File · DigiCert certificates · MUD-capable IoT devices:
· Molex PoE GW and Light Engine
· Devkits · Non-MUD-capable IoT devices · NCCoE hosted Update Server · NCCoE hosted Unapproved
Server · NCCoE hosted MQTT Broker
Server · Forescout and Forescout
Enterprise Manager
PHASE 1

BUILD 2 ­ MASTERPEACE & GCA

BUILD 4 - NIST

· Yikes! Router including MUD
Manager · Yikes! Cloud & Yikes! Mobile App · MasterPeace hosted MUD File
Server · MUD File · DigiCert certificates · MUD-capable IoT devices - Devkits · Non-MUD-capable IoT devices · NCCoE hosted Update Server · NCCoE hosted Unapproved Server · GCA Quad9 Threat Agent
integrated into Yikes! Router · GCA Quad9 Threat Signaling MUD
Manager integrated into Yikes!
Router · GCA Quad9 Threat-Signaling DNS
Services · GCA Quad9 Threat API · ThreatSTOP Threat MUD File Server · ThreatSTOP Threat MUD File

· OpenDaylight SDN Controller
including MUD Manager · NCCoE hosted MUD File Server · MUD File · Wireless SDN Switch · DigiCert certificates · MUD-capable IoT devices - Devkits · Non-MUD-capable IoT devices · NCCoE hosted Unapproved Server · Approved Server

BUILD 3 - CABLELABS
· Micronets Gateway · Micronets Manager · MUD Manager · MUD Registry · MSO Portal · MUD File Server · MUD File · DigiCert certificates · MUD-capable IoT devices - Devkits · Non-MUD-capable IoT devices · Update Server · Unapproved Server · Micronets Mobile App

PHASE 2 49

PHASE 3

Logical Architecture ­ Build 2
50

Step 1-5: Processing, applying, and viewing MUD File Rules

Home or Small-Business Network
Yikes! Router

Yikes! MUD Manager

(2) MUD URL

(5) Device firewall rules

(3a) HTTPS get URL (MUD file) (4a) HTTPS get URL (signature file)
(3b) MUD file (4b) Signature file
Non-MUD and MUD-capable device identification, network rules, and router administration

MUD File Server

Cloud

UI
Mobile Application

Threat Signaling

Router

(1) DHCP packet with optional MUD URL

(2) IP address

Devices
51

Step 1-5: Processing, applying, and viewing MUD File Rules
2. Expand device's profile
1. View all MUD devices on network

Mobile Application

Mobile Application

52

Logical Architecture ­ Build 2 (Threat Signaling) Home or Small-Business Network Yikes! Router

Router

Local DNS Service

Firewall

(9a) Apply threat MUD file rules to firewall
(9b) Apply threat MUD file rules to DNS

(1) DNS (4) DNS request response

Quad9 DNS and Threat Signaling

Quad9 MUD Manager

Quad9 Threat Agent

(6) Threat found

(2) DNS request
(3) DNS response (NULL if potential threat) If NULL response
(4) Domain name threat inquiry
(5) Threat confirmation and source info.
(7) HTTPS get threat MUD file and signature file
(8) Receive threat MUD file and signature file

Threat Signaling Quad9 DNS Service
Quad9 Threat API ThreatSTOP Threat
MUD File Server

Devices
53

Step 1-2: Device attempts to communicate with compromised site

Home or Small-Business Network
Yikes! Router

Router

Quad9 Threat Signaling (Q9Thrt)

Local DNS Service

(2) DNS request

Threat Signaling Quad9 DNS Service

(1) DNS request
Devices
54

Step 3: Router receives DNS response from Quad9 DNS Service

Home or Small-Business Network
Yikes! Router

Router

Quad9 Threat Signaling (Q9Thrt)

Local DNS Service

Quad9 Threat Agent

(2) DNS request
(3) DNS response (NULL if potential threat)

Threat Signaling Quad9 DNS Service

(1) DNS request
Devices
55

Step 4-6: Threat found and local Quad9 MUD Manager notified

Home or Small-Business Network
Yikes! Router

Router

Quad9 Threat Signaling (Q9Thrt)

Local DNS Service

Quad9 MUD Manager

Quad9 Threat Agent

(6) Threat found

(2) DNS request
(3) DNS response (NULL if potential threat) If NULL response (4) Domain name threat inquiry
(5) Threat confirmation and source info

Threat Signaling Quad9 DNS Service
Quad9 Threat API

(1) DNS (4) DNS request response
Devices
56

Step 7-9: Threat MUD file and signature file requested, verified, and applied on router

Home or Small-Business Network
Yikes! Router

Router

Quad9 Threat Signaling (Q9Thrt)

Local DNS Service

Firewall

(9a) Apply threat MUD file rules to firewall
(9b) Apply threat MUD file rules to DNS

Quad9 MUD Manager

Quad9 Threat Agent

(6) Threat found

(1) DNS (4) DNS request response

(2) DNS request
(3) DNS response (NULL if potential threat) If NULL response
(4) Domain name threat inquiry
(5) Threat confirmation and source info
(7) HTTPS get threat MUD file and signature file
(8) Receive threat MUD file and signature file

Threat Signaling Quad9 DNS Service
Quad9 Threat API ThreatSTOP Threat
MUD File Server

Devices
57

Apply What You Have Learned Today
Short term:
­ Review published Practice Guide for more details ­ Join NCCoE IoT MUD Community of Interest - mitigating-iot-ddos-nccoe@nist.gov
Long term:
­ IoT device manufacturers, and network equipment manufacturers could implement MUD to improve the security of their products and of their customers' networks
­ IoT device users could purchase MUD-capable devices, when available, to protect their IoT devices from network-based attacks
https://www.nccoe.nist.gov/projects/building-blocks/mitigating-iot-based-ddos 58

Acknowledgements
NIST:
­ Donna Dodson, Douglas Montgomery, Tim Polk, Mudumbai Ranganathan, Murugiah Souppaya
Arm:
­ Allaukik Abhishek
CableLabs:
­ Steve Johnson, Ashwini Kadam, Craig Pratt, Darshak Thakore, Mark Walker, Tao Wan
Cisco:
­ Russ Gyurek, Eliot Lear, Peter Romness, Brian Weis
CTIA:
­ Rob Cantu
Dakota Consulting:
­ William Barker
DigiCert:
­ Dean Coclin, Avesta Hojjati, Clint Wilson
59

Forescout:
­ Katherine Gronberg, Tim Jones
Global Cyber Alliance:
­ Adnan Baykal
MasterPeace Solutions:
­ Drew Cohen, Nate Lesser, Kevin Yeich
The MITRE Corporation:
­ Yemi Fashina, Joshua Harrington, Joshua Klosterman, Mary Raguso, Susan Symington, Paul Watrobski
Molex: ­ Mo Alhroub, Jaideep Singh
Patton Electronics: ­ Bryan Dubois, Stephen Ochs
Symantec: ­ Matt Boucher, Bruce McCorkendale, Susanta Nanda, Yun Shen
Vigil Security: ­ Russ Housley

Contact Information
https://www.nccoe.nist.gov/projects/building-blocks/mitigating-iot-based-ddos mitigating-iot-ddos-nccoe@nist.gov
60

Backups
#RSAC

Logical Architecture ­ Build 2 (Threat Signaling) Home or Small-Business Network Yikes! Router

Router

Local DNS Service

Firewall

(9a) Apply threat MUD file rules to firewall
(9b) Apply threat MUD file rules to DNS

(1) DNS (4) DNS request response

Quad9 DNS and Threat Signaling

Quad9 MUD Manager

Quad9 Threat Agent

(6) Threat found

(2) DNS request
(3) DNS response (NULL if potential threat) If NULL response
(4) Domain name threat inquiry
(5) Threat confirmation and source info.
(7) HTTPS get threat MUD file and signature file
(8) Receive threat MUD file and signature file

Threat Signaling Quad9 DNS Service
Quad9 Threat API ThreatSTOP Threat
MUD File Server

Devices
62

Step 1-2: Device attempts to communicate with compromised site

Home or Small-Business Network
Yikes! Router

Router

Quad9 Threat Signaling (Q9Thrt)

Local DNS Service

(2) DNS request

Threat Signaling Quad9 DNS Service

(1) DNS request
Devices
63

Step 1-2: Device attempts to communicate with compromised site

1. Device Pings known malicious host

Devices

$ ping www.dangerousSite.org
ping: cannot resolve www.dangerousSite.org: Unknown host

64

Step 3: Router receives DNS response from Quad9 DNS Service

Home or Small-Business Network
Yikes! Router

Router

Quad9 Threat Signaling (Q9Thrt)

Local DNS Service

Quad9 Threat Agent

(2) DNS request
(3) DNS response (NULL if potential threat)

Threat Signaling Quad9 DNS Service

(1) DNS request
Devices
65

Step 3: Router receives DNS response from Quad9

DNS Service

Yikes! Router

1. Quad9 Agent receives DNS response

Quad9 Threat Signaling (Q9Thrt)

9.9.9.9.53 > 192.168.5.2.17847: [udp sum ok] 26864 NXDomain- q: A? dangerousSite.org. 0/0/0 (29) A? - dangerousSite.org - https://api.quad9.net/search

66

Step 4-6: Threat found and local Quad9 MUD Manager notified

Home or Small-Business Network
Yikes! Router

Router

Quad9 Threat Signaling (Q9Thrt)

Local DNS Service

Quad9 MUD Manager

Quad9 Threat Agent

(6) Threat found

(2) DNS request
(3) DNS response (NULL if potential threat) If NULL response (4) Domain name threat inquiry
(5) Threat confirmation and source info

Threat Signaling Quad9 DNS Service
Quad9 Threat API

(1) DNS (4) DNS request response
Devices
67

Step 4-6: Threat found and local Quad9 MUD Manager

notified

Yikes! Router

1. Quad9 Agent queries Quad9 API to confirm potential threat

Quad9 Threat Signaling

DEBUG: runQuad9(): Calling Quad9 on:curl -s -o /tmp/dangerousSite.org.q9

(Q9Thrt)

https://api.quad9.net/search/dangerousSite.org

DEBUG: runQuad9(): Search returned

{"domain":"dangerousSitre.org","blocked":true,"blocked_by":["threatstop"],"meta":[{"name":"ThreatSTOP

"}]} stored in /tmp/dangerousSite.org.q9

2. Quad9 Agent parses threat query response from Quad9 API and validates that site is blocked
DEBUG: runQuad9(): Download success via Quad9 threat API.

Yikes! Router
Quad9 Threat Signaling (Q9Thrt)

DEBUG: isQuad9Blocked(): Calling: jq .blocked /tmp/dangerousSite.org.q9

https://api.quad9.net/search/dangerousSite.org

DEBUG: isQuad9Blocked(): Command result: true

DEBUG: isBlockedByProvider(): Calling: jq -c .blocked_by /tmp/dangerousSite.org.q9

https://api.quad9.net/search/dangerousSite.org DEUBG: isBlockedByProvider(): ["threatstop"] ---===--- threatstop

Yikes! Router

WARN: isBlockedByProvider(): Threat WAS FOUND TO BE BAD by threatstop
3. Quad9 Agent notifies Quad9 MUD Manager that threat has been found

Quad9 Threat Signaling (Q9Thrt)

DEBUG: runQuad9(): Threat provider threatstop: They found to be bad. Call them now for more

detailed threat response information.

68

Step 7-9: Threat MUD file and signature file requested, verified, and applied on router

Home or Small-Business Network
Yikes! Router

Router

Quad9 Threat Signaling (Q9Thrt)

Local DNS Service

Firewall

(9a) Apply threat MUD file rules to firewall
(9b) Apply threat MUD file rules to DNS

Quad9 MUD Manager

Quad9 Threat Agent

(6) Threat found

(1) DNS (4) DNS request response

(2) DNS request
(3) DNS response (NULL if potential threat) If NULL response
(4) Domain name threat inquiry
(5) Threat confirmation and source info
(7) HTTPS get threat MUD file and signature file
(8) Receive threat MUD file and signature file

Threat Signaling Quad9 DNS Service
Quad9 Threat API ThreatSTOP Threat
MUD File Server

Devices
69

Step 7-9: Threat MUD file and signature file requested, verified, and applied on router

1. Quad9 MUD Manager requests Threat MUD and Signature file and validates respectively

DEBUG: retrieveThreatProviderFile(): Calling: curl -s -o /etc/q9thrt/state/mudfiles/dangerousSite.org.json

https://mud.threatstop.com/dangerousSite.org.json

INFO: retrieveThreatProviderFile(): MUD FILE RETRIEVED

DEBUG: retrieveThreatProviderFile(): Calling: curl -s -o /etc/q9thrt/state/mudfiles/dangerousSite.org.p7s

https://mud.threatstop.com/dangerousSite.org.p7s

INFO: retrieveThreatProviderFile(): SIGNATURE FILE RETRIEVED

DEBUG: testMudFile(): Calling: jq -r '.["ietf-mud:mud"]["mud-version"]'

/etc/q9thrt/state/mudfiles/dangerousSite.org.json

DEBUG: testMudFile(): Valid Mud file: MudVersion = 1

DEBUG: testMudFileSignature(): Calling: openssl asn1parse -in /etc/q9thrt/state/mudfiles/dangerousSite.org.p7s

-inform der | grep -i error | wc -l

DEBUG: testMudFileSignature(): Valid Mud file signature.

DEBUG: validateThreatMudFile(): Both the MUD file and MUD p7s signature files are valid. Now test signature.

DEBUG: validateThreatMudFile(): Calling: openssl cms -verify -in

/etc/q9thrt/state/mudfiles/dangerousSite.org.p7s -inform DER -content /etc/q9thrt/state/mudfiles/dangerousSite.org.json > /dev/null

Yikes! Router

INFO: validateThreatMudFile(): MUD FILE SIGNATURE PASSED

Quad9 Threat

Signaling

(Q9Thrt)

70

Step 7-9: Threat MUD file and signature file requested,

verified, and applied on router
Yikes! Router

2. Quad9 MUD Manager builds and

Quad9 Threat

applies policies to local DNS and Firewall

Signaling (Q9Thrt)

DEBUG: runQuad9(): Installing valid mud file:

/etc/q9thrt/state/mudfiles/dangerousSite.org.json

DEBUG: installMudFile(): Calling:

/etc/q9thrt/build_policies.sh -e dangerousSite.org -m

/etc/q9thrt/state/mudfiles/dangerousSite.org.json -s lan -d

wan -k /etc/q9thrt/state/rules

INFO: installMudFile(): MUD FILE INSTALLED

DEBUG: installMudFile(): Calling:

/etc/q9thrt/build_policies.sh -e dangerousSite.org -m

/etc/q9thrt/state/mudfiles/dangerousSite.org.json -s wan -d

lan -k /etc/q9thrt/state/rules

INFO: installMudFile(): MUD FILE INSTALLED

DEBUG: commitThreatConfiguration(): Calling:

/etc/q9thrt/commit_threat_rules.sh -d

/etc/q9thrt/state/rules -t /tmp/q9thrt_tmp_dir

71

3. Quad9 Firewall Rules

# Q9THREATRULES start

Yikes! Router

config ipset

option enabled 1 option name Q9TS-dangerousSite_orgFD

Router

option match dest_ip

option storage hash

option family ipv4

option external Q9TS-dangerousSite_orgFD

config ipset

option enabled 1

option name Q9TS-dangerousSite_orgTD

option match src_ip

option storage hash

option family ipv4

option external Q9TS-dangerousSite_orgTD

config rule

option enabled '1'

option name

'Q9TS-dangerousSite_orgFD'

option target REJECT

option src

lan

option dest

wan

option proto

all

option family ipv4

option ipset

Q9TS-dangerousSite_orgFD

option src_ip any

config rule

option enabled '1'

option name

'Q9TS-dangerousSite_orgTD'

option target REJECT

option src

wan

option dest

lan

option proto

all

option family ipv4

option ipset

Q9TS-dangerousSite_orgTD

option dest_ip any

# Q9THREATRULES end

Step 7-9: Threat MUD file and signature file requested, verified, and applied on router
4. Device attempts to communicate with malicious host after rules are applied ­ DNS now resolves dangerousSite.org to IoT device loopback address
$ ping www.dangerousSite.org PING www.dangerousSite.org(127.0.0.1): 56 data bytes 64 bytes from 127.0.0.1: icmp_seq=0 ttl=64 time=0.049 ms 64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.073 ms 64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.082 ms 64 bytes from 127.0.0.1: icmp_seq=3 ttl=64 time=0.139 ms 64 bytes from 127.0.0.1: icmp_seq=4 ttl=64 time=0.079 ms 64 bytes from 127.0.0.1: icmp_seq=5 ttl=64 time=0.072 ms 64 bytes from 127.0.0.1: icmp_seq=6 ttl=64 time=0.123 ms 64 bytes from 127.0.0.1: icmp_seq=7 ttl=64 time=0.073 ms ç64 bytes from 127.0.0.1: icmp_seq=8 ttl=64 time=0.066 ms ^C --- www.dangerousSite.org ping statistics --9 packets transmitted, 9 packets received, 0.0% packet loss round-trip min/avg/max/stddev = 0.049/0.084/0.139/0.027 ms

Devices

72

MUD File maker - MUDMaker.org
73

Sample MUD File { "ietf-mud:mud": { "mud-version": 1, "mud-url": "https://www.test.com/RSACSandbox", "last-update": "2020-01-14T19:45:00+00:00", "cache-validity": 48, "is-supported": true, "systeminfo": "Test MUD File for RSAC 2020", "mfg-name": "Test", "documentation": "https://www.test.com/readme.txt", "model-name": "RSACSandbox", "from-device-policy": { "access-lists": { "access-list": [ { "name": "mud-33577-v4fr" } ] } }, "to-device-policy": { "access-lists": { "access-list": [ { "name": "mud-33577-v4to" [......]

[.....] "ietf-access-control-list:acls": {
"acl": [ { "name": "mud-33577-v4to", "type": "ipv4-acl-type", "aces": {
"ace": [ { "name": "cl0-todev", "matches": {
"ipv4": { "ietf-acldns:src-dnsname": "www.google.com", "protocol": 6 }, "tcp": { "ietf-mud:direction-initiated": "from-device", "source-port": { "operator": "eq", "port": 443 } } }, "actions": { "forwarding": "accept" } },

74

[....]

