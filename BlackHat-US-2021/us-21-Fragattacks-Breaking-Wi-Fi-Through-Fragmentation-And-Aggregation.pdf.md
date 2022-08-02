FragAttacks
Breaking Wi-Fi Through Frame Aggregation and Fragmentation
4-5 August, Black Hat USA (Virtual)
Mathy Vanhoef

Advancements in Wi-Fi security

1999

Wired Equivalent Privacy (WEP) > Horribly broken [FMS01]

Early 2000

Wi-Fi Protected Access (WPA and WPA2) > Offline dictionary attacks > KRACK and Kraken attack [VP17,VP18] > KRACK defenses now proven secure [CKM20]

2

Advancements in Wi-Fi security
2018 Wi-Fi Protected Access 3 (WPA3)
Uses a new handshake to prevent dictionary attacks > Vulnerable to Dragonblood: side-channel leaks [VR20] > WPA3 certification updated to require defenses [WFA20]
Once connected, the encryption of WPA2 & WPA3 is similar > The attacks in this presentation work against both
3

Advancements in Wi-Fi security
Late 2020 Two extra defenses standardized
> Operating channel validation [VBDOP18] > Beacon protection [VAP20] Would make presented attacks harder but still possible > Still undergoing adoption  currently no practical impact
4

Advancements in Wi-Fi security
Despite these major advacements, found new flaws in all networks
5

Design flaws

Implementation Flaws

Design flaws

Implementation Flaws

Aggregation

Mixed Fragment

key

cache

Implementation Flaws

Background

Sending small frames causes high overhead:

header packet1 ACK

header packet2 ACK

...

This can be avoided by aggregating frames:
header' packet1 packet2 ... ACK

9

Background

Sending small frames causes high overhead:

header packet1 ACK

header packet2 ACK

...

This can be avoided by aggregating frames:
header' packet1 packet2 ... ACK

Problem: how to recognize aggregated frames?
10

Aggregation design flaw

header aggregated?

encrypted

False True metadata len

packet packet1 metadata len

packet2

11

Aggregation design flaw
Not authenticated
header aggregated?

encrypted

False True metadata len

packet packet1 metadata len

packet2

12

Aggregation design flaw
Not authenticated
header aggregated?

encrypted

False

packet

True metadata len packet1 metadata len packet2

Flip flag  decrypted payload is parsed in wrong manner
13

Exploit steps
Get image from attacker's server
14

Exploit steps
Get image from attacker's server
Example: · Send e-mail with embedded image · Send WhatsApp message to cause
link/image preview
15

Exploit steps
Get image from attacker's server

Send special IPv4 packet
16

Exploit steps
Get image from attacker's server

Send special IPv4 packet Encrypt as normal frame
17

Exploit steps
Get image from attacker's server
Send special IPv4 packet
Can't modify Encrypt as encrypted contenonrmt al frame
Set aggregated flag
18

Exploit steps
Get image from attacker's server
Send special IPv4 packet
Encrypt as normal frame
Set aggregated flag
Inject any packet  Inject ICMPv6 RA with malicious DNS server
19

Exploit steps

Get image from attacker's server

 Easier than BEAST, TIME, & HEIST attack against TLS!

Send special IPv4 packet

Encrypt as normal frame

Set aggregated flag

Inject any packet  Inject ICMPv6 RA with malicious DNS server
20

Easier version

Inject special handshake frame

Bug in AP  do attack w/o user interaction
(affected 2 4 of home APs)

Encrypt as normal frame

Set aggregated flag

Inject any packet  Inject ICMPv6 RA with malicious DNS server
21

DEMO! 
22

Impact
All major operating systems affected
Only NetBSD & some IoT devices unaffected
23

How to construct the special IPv4/TCP packet?

Aggr? rfc1042 hdr len ID TCP

data

False ... 45 00 01 0C 00 22 ... ... Frame to inject

24

How to construct the special IPv4/TCP packet?

Aggr? rfc1042 hdr len ID TCP

data

False ... 45 00 01 0C 00 22 ... ... Frame to inject

25

How to construct the special IPv4/TCP packet?

Aggr? rfc1042 hdr len ID TCP

data

False ... 45 00 01 0C 00 22 ... ... Frame to inject

Adversary turns normal frame into aggregated one

26

How to construct the special IPv4/TCP packet?

Aggr? rfc1042 hdr len ID TCP

data

False ... 45 00 01 0C 00 22 ... ... Frame to inject

Adversary turns normal frame into aggregated one

True

metadata

len ignore meta. len packet

> At Wi-Fi layer 1st sub-packet is ignored > Control IP ID & part of TCP data  inject arbitrary packets
27

Aggregation

Mixed Fragment

key

cache

Implementation Flaws

Background

Large frames have a high chance of being corrupted:

header

packet

ACK

Avoid by fragmenting & only retransmitting lost fragments:

header fragment1 ACK

header fragment2 ACK

heade

Problem: how to (securely) reassemble the fragments?
29

Reassembling plaintext fragments

header header header

fragment1 fragment2 fragment3

30

Reassembling plaintext fragments

header



header



header



fragment1 fragment2 fragment3

> Fragments have the same sequence number 

31

Reassembling plaintext fragments

header



header



header



0

fragment1

1

fragment2

2

fragment3

> Fragments have the same sequence number  > All fragments also have a fragment number ...

32

Reassembling plaintext fragments

header



header



header



0 More 1 More 2 Last

fragment1 fragment2 fragment3

> Fragments have the same sequence number  > All fragments also have a fragment number ...
... and a flag to identify the last fragment

33

Reassembling encrypted fragments

header  header  header 

 +1 +2

0 More 1 More 2 Last

fragment1 fragment2 fragment3

> Encrypted frames have a packet number to detect replays

34

Reassembling encrypted fragments

header   header   + 1 header   + 2 Authenticated

0 More fragment1 1 More fragment2 2 Last fragment3
Authenticated

> Encrypted frames have a packet number to detect replays > If packet & fragment numbers are not consecutive, drop it

35

Problem: key renewal
> Session key can be periodically renewed ... > ... or updated when roaming between APs
> During rekey packet numbers restart from zero > Problem: receiver is allowed to reassemble fragments
encrypted under different keys (i.e. mixed keys)
36

Mixed key design flaw

 0 , (1)

(0)

Refresh session key from  to 

37

Mixed key design flaw

 0 , (1)

(0)

Resets packet numbers

Refresh session key from  to 

38

Mixed key design flaw

 0 , (1)

(0)

Refresh session key from  to 

 0 , (1)

(1)
Reassemble fragment

 Can mix fragments of different frames
39

Summary of impact
Abuse to exfiltrate data assuming: 1. Someone sends fragmented frames (rare unless Wi-Fi 6) 2. Victim will connect to server of attacker 3. Network periodically refreshes the session key
40

Summary of impact
Abuse to exfiltrate data assuming: 1. Someone sends fragmented frames (rare unless Wi-Fi 6) 2. Victim will connect to server of attacker 3. Network periodically refreshes the session key
Combine with implementation flaw to avoid this condition
41

How to exfiltrate data?

0

1

Frame 1 192.168.1.2 to 3.5.1.1 GET /image.png HTTP/1.1

Frame 2

192.168.1.2 to 8.8.8.8

POST /login.php HTTP/1.1 user=admin&pass=SeCr3t

42

How to exfiltrate data?

0

1

Frame 1 192.168.1.2 to 3.5.1.1 GET /image.png HTTP/1.1

Frame 2

192.168.1.2 to 8.8.8.8

POST /login.php HTTP/1.1 user=admin&pass=SeCr3t

Adversary mixes different fragments

192.168.1.2 to 3.5.1.1

POST /login.php HTTP/1.1 user=admin&pass=SeCr3t

 Login info is sent to attacker's server 43

Aggregation

Mixed Fragment

key

cache

Implementation Flaws

Fragment cache design flaw
Fragments aren't removed after disconnecting:
45

Fragment cache design flaw
Fragments aren't removed after disconnecting:
 (0 ) Store fragment
46

Fragment cache design flaw
Fragments aren't removed after disconnecting:

 (0 )

Store fragment Disconnect

Client connects

0 stays in memory of AP

47

Summary of impact
Abuse to exfiltrate or inject packets assuming: 1. Hotspot-like network where users distrust each other 2. Client sends fragmented frames (rare unless Wi-Fi 6)
48

Summary of impact
Abuse to exfiltrate or inject packets assuming: 1. Hotspot-like network where users distrust each other 2. Client sends fragmented frames (rare unless Wi-Fi 6)
Even the ancient WEP protocol is affected! > WEP is also affected by the mixed key design flaw
 Design flaws have been part of Wi-Fi since 1997
49

Defenses
50

Preventing aggregation-based attacks
Aggregation design flaw > Protect the "is aggregated" flag. Not backwards-compatible. > Current fix: prevent known attacks by dropping aggregated
frames whose first 6 bytes equal an rfc1042 header
51

Preventing aggregation-based attacks

Aggregation design flaw > Protect the "is aggregated" flag. Not backwards-compatible. > Current fix: prevent known attacks by dropping aggregated
frames whose first 6 bytes equal an rfc1042 header
Aggregated?

False rfc1042

packet

52

Preventing aggregation-based attacks

Aggregation design flaw > Protect the "is aggregated" flag. Not backwards-compatible. > Current fix: prevent known attacks by dropping aggregated
frames whose first 6 bytes equal an rfc1042 header
Aggregated?

False rfc1042

packet

True metadata packet1 metadata

packet2
53

Preventing aggregation-based attacks

Aggregation design flaw > Protect the "is aggregated" flag. Not backwards-compatible. > Current fix: prevent known attacks by dropping aggregated
frames whose first 6 bytes equal an rfc1042 header
Aggregated?

False rfc1042

packet

True metadata packet1 metadata

packet2
54

Preventing fragmentation-based attacks
Mixed key attack: > Only reassemble fragments decrypted under the same key
Fragment cache attack: > Clear unused fragments when the corresponding key is
removed
55

Design flaws

Implementation Flaws

Design flaws

Plaintext

Mixed

frames fragments

Broadcast EAPOL fragments forwarding

Cloacked A-MSDUs

Out of order fragments

Out of order frag

Trivial frame injection
Plaintext frames wrongly accepted: > Depending if fragmented, broadcasted, or while connecting
58

Trivial frame injection
Plaintext frames wrongly accepted: > Depending if fragmented, broadcasted, or while connecting > Examples: Apple and some Android devices, some Windows
dongles, home and professional APs, and many others!
 Can trivially inject frames
59

DEMO! 
60

Design flaws

Plaintext

Mixed

frames fragments

Broadcast EAPOL fragments forwarding

Cloacked No fragmentation

A-MSDUs

support

Out of order frag

Cloacked aggregated (A-MSDU)frames

Set "is aggregated" flag and send as plaintext:

True AA AA 03 00 00 00 00 00 88 8E ...

2nd subpacket

Normally: first deaggregate & then check if handshake frame

62

Cloacked aggregated (A-MSDU)frames

Set "is aggregated" flag and send as plaintext:

True AA AA 03 00 00 00 00 00 88 8E ...

2nd subpacket

Some switch the order! Normally: first deaggregate & then check if handshake frame

...
1st subpacket is ignored because it has invalid metadata

2nd subpacket
Plaintext data packet is rejected
63

Cloacked aggregated (A-MSDU)frames

Set "is aggregated" flag and send as plaintext:

True AA AA 03 00 00 00 00 00 88 8E ...

2nd subpacket

Handshake header  accept full frame Vulnerable order: check if handshake & then deaggregate

64

Cloacked aggregated (A-MSDU)frames

Set "is aggregated" flag and send as plaintext:

True AA AA 03 00 00 00 00 00 88 8E ...

2nd subpacket

Handshake header  accept full frame Vulnerable order: check if handshake & then deaggregate

...
1st subpacket is ignored because it has invalid metadata

2nd subpacket
Plaintext data is also accepted!
65

Cloacked aggregated (A-MSDU)frames
Affects FreeBSD, some Windows dongles, several Androids, 3 out of 4 home routers, 1 out of 3 professional APs, etc.
DEMO! 
66

Design flaws

Plaintext

Mixed

frames fragments

Broadcast EAPOL fragments forwarding

Cloacked No fragmentation

A-MSDUs

support

Out of order frag

Flaw: mixed plaintext/encrypted fragments
Only require that the first fragment is encrypted > Affects nearly all network cards on Windows & Linux > Simplifies aggregation & cache attack
Only require the last fragment to be encrypted > Affects nearly all network cards on Free/NetBSD > Trivial to inject & exfiltrate data
68

Design flaws

Plaintext

Mixed

frames fragments

Broadcast EAPOL fragments forwarding

Cloacked No fragmentation

A-MSDUs

support

Out of order frag

Flaw: non-consective packet numbers

header   0 More header   +  1 More header   +  2 Last

fragment1 fragment2 fragment3

> Nobody but Linux checks if packet numbers are consecutive > Can do mixed key attack without periodic rekeys

70

Design flaws

Plaintext

Mixed

frames fragments

Broadcast EAPOL fragments forwarding

Cloacked No fragmentation

A-MSDUs

support

Out of order frag

No fragmentation support
Some devices don't support fragmentation > But they treat fragmented frames as full frames > Examples: OpenBSD and Espressif chips
 Abuse to inject frames under right conditions  All devices are vulnerable to one or more flaws!
72

Created tool to test devices
Has 45+ test cases for both clients and APs
> Can detect all vulnerabilities > Needs network password (not an attack tool) > Can also be used as basis for other Wi-Fi
research [SVR21]
https://github.com/vanhoefm/fragattacks
73

Discussion
Design flaws took two decades to discover > Without modified drivers some attacks will fail
74

Discussion
Design flaws took two decades to discover > Without modified drivers some attacks will fail > Fragmentation & aggregation wasn't considered important
75

Discussion
Design flaws took two decades to discover > Without modified drivers some attacks will fail > Fragmentation & aggregation wasn't considered important
Long-term lessons: > Adopt defences early even if concerns are theoretic > Isolate security contexts (data decrypted with different keys) > Keep fuzzing devices. Wi-Fi Alliance can help here!
76

Coordinated disclosure
Wi-Fi Alliance & ICASI contacted vendors > Embargo of roughly 9 months > Test tool (= PoC) received several updates during embargo!
Currently doing following-up work > Updating the IEEE 802.11 standard to fix design flaws > Maintaining test tool and checking some vendor patches
77

Looking back
Was it the long disclosure worth it? > Some companies had patches for most devices but still
weren't happy... ¯\_()_/¯ > Others appreciated this even if not all devices had patches! > Props to: Cisco, LANCOM, Aruba, Huawei, Ubiquity,
MediaTek, Samsung, NETGEAR, as well as others
78

Conclusion
> Discovered three design flaws > Multiple implementation flaws > Implementation flaws easy to abuse,
but design flaws hard to abuse > More info: www.fragattacks.com
79

References

> Presentation is based on: Fragment and Forge: Breaking Wi-Fi Through Frame Aggregation and Fragmentation. https://papers.mathyvanhoef.com/usenix2021.pdf

> [VP17] Key Reinstallation Attacks: Forcing Nonce Reuse in WPA2

> [VP18] Release the Kraken: New KRACKs in the 802.11 Standard

> [CKM20] A Formal Analysis of IEEE 802.11's WPA2: Countering the Kracks Caused by Cracking the Counters

> [VR20] Dragonblood: Analyzing the Dragonfly Handshake of WPA3 and EAP-pwd

> [WFA20] Wi-Fi Alliance Wi-Fi Security Roadmap and WPA3 Updates. https://wi-fi.org/file/wifi-security-roadmap-and-wpa3-updates-december-2020

> [VBDOP18] Operating Channel Validation: Preventing Multi-Channel Man-in-the-Middle Attacks Against Protected Wi-Fi Networks

> [VAP20] Protecting Wi-Fi Beacons from Outsider Forgeries

> [SVR21] DEMO: A Framework to Test and Fuzz Wi-Fi Devices.

https://papers.mathyvanhoef.com/wisec2021-demo.pdf

80

