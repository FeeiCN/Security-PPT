Hajime
And the Mainline DHT
1

whoami
· Kevin O'Sullivan · Apprentice -> Network design -> Security Web Dev -> SOC analyst -> BTCERT
Investigator · National Cyber Security Centre (NCSC) Industry Analyst
© British Telecommunications plc
2

© British Telecommunications plc
3

Talking Points
· What is Hajime? · Research goals · Bit Torrent DHT ­ Some Background info · Hajime's usage of Bit Torrent DHT · Tracking Hajime Seeders/Leechers · Hajime Remediation Trial · Further Reading · Q&A
© British Telecommunications plc
4

Hajime?
· Discovered by Rapidity Networks in Oct 2016 [1] · Mirai-like IoT Worm · Scaled at ~200-300k nodes · Decentralized via Bit-Torrent Mainline DHT
[1] https://security.rapiditynetworks.com/publications/2016-10-16/hajime.pdf
© British Telecommunications plc
5

Research Goals
· Scale Hajime via Bit Torrent DHT · Build a tracker that allow us to:
­ Identify affected BT customers ­ Monitor the botnet for growth
© British Telecommunications plc
6

DHT
Distributed Hash Table
· Key/Value store across a number of connected devices

Key 59066769B9AD42DA2E508611C33D7C4480B3857B 59066769B9AD42DA2E508611C33D7C4480B3857B 59066769B9AD42DA2E508611C33D7C4480B3857B

Value 1.1.1.1:1001 2.2.2.2:2002 3.3.3.3:3003

Key 59066769B9AD42DA2E508611C33D7C4480B3857B 59066769B9AD42DA2E508611C33D7C4480B3857B 59066769B9AD42DA2E508611C33D7C4480B3857B

Value 4.4.4.4:4004 5.5.5.5:5005 6.6.6.6:6006

Key CFEBABC706B9BA9B1FB9D2F0A1ED7380D5D0D017 CFEBABC706B9BA9B1FB9D2F0A1ED7380D5D0D017 CFEBABC706B9BA9B1FB9D2F0A1ED7380D5D0D017

Value 1.2.3.4:1122 3.4.5.6:3344 4.5.6.7:4455

© British Telecommunications plc
7

Key

Value

59066769B9AD42DA2E508611C33D7C4480B3857B 1.1.1.1:1001

59066769B9AD42DA2E508611C33D7C4480B3857B 2.2.2.2:2002

59066769B9AD42DA2E508611C33D7C4480B3857B 3.3.3.3:3003

59066769B9AD42DA2E508611C33D7C4480B3857B 4.4.4.4:4004

59066769B9AD42DA2E508611C33D7C4480B3857B 5.5.5.5:5005

59066769B9AD42DA2E508611C33D7C4480B3857B 6.6.6.6:6006

CFEBABC706B9BA9B1FB9D2F0A1ED7380D5D0D017 1.2.3.4:1122

CFEBABC706B9BA9B1FB9D2F0A1ED7380D5D0D017 3.4.5.6:3344

CFEBABC706B9BA9B1FB9D2F0A1ED7380D5D0D017 4.5.6.7:4455

DHT
Distributed Hash Table
A "node" is a device listening on a UDP port implementing the DHT protocol
A "peer" is a device that is currently offering a file

Node id: 96078A034609E3BCC758445BA18B03E031ACD28D
node

59066769B9AD42DA2E508 1.1.1.1:1001,

611C33D7C4480B3857B

2.2.2.2:2002,

3.3.3.3:3003

· Each node in DHT has a 160-bit `node_id' · Resources (e.g. files) tracked in DHT also
given 160-bit `info_hash' · Node_ids and info_hashes share a key-
space
© British Telecommunications plc
8

info_hash

List of peers

Hajime's Bit Torrent Usage

· Peer discovery · Config/Module downloads via uTP (uTorrent Transport Protocol)

· New config generated daily with info_hash derived from following algorithm:
­ {Current UTC date (format D-M-Y-W-Z)}-{SHA1(filename)}

SHA1() =
Info_hash

Information D ­ Day of month M ­ Month (0 for Jan, 1 for Feb...) Y ­ Years since 1900 W ­ Day of the week (0 for Sun, 1 for Mon...) Z ­ Number of days since Jan 01 of that year
Filename = `config'

© British Telecommunications plc
9

How nodes find peers in DHT
`Closeness'
96078a034609e3bcc758445ba18b03e031acd28d
59d6e037489a90394e630692ec3cbc9cb7f5f8b4c425fb6a018fb50732e9073b174939d23ac1 =
cbe4c390d83fcf705ceaf70f0827c4c10454c94ad540b1 =
116402673256636650451115468603514468342761443447050420401 NoPtrectltoyseclaotsea!ll
© British Telecommunications plc
10

How nodes find peers in DHT

1
Node A 1.1.1.1
3
© British Telecommunications plc
11

Node B 2.2.2.2
2
Node C 3.3.3.3
4

1 Node A sends a get_peers request for a resource to Node B. He sends the request to Node B because Node B's Node_id is the closest Node_id to the info_hash that Node A has in his routing table.
2 Node B doesn't know of any peers for that info_hash. So he returns a list of closest nodes from his routing table that are closes to the info_hash.
3 Node A now queries the newly acquired nodes in the same way as he did in step 1. In this case, Node C is queried.
4 Node C is naturally `closer' to the info_hash and therefore more likely to know of any peers for that resource. In this case, Node C has returned a peer ­ 4.4.4.4:3456. If Node C didn't know of any peers for the info_hash, he would return a list of closer nodes, just as Node B did earlier.

Scaling the botnet
Finding Seeders
· Generate today's config info_hash · Generate a random 160-bit node_id for ourselves · Perform a get_peers lookup for today's config info_hash · Store unique peers · Push data into ELK (Elasticsearch, Logstash, Kibana)
© British Telecommunications plc
12

Sybil Attacks

· Introduce multiple fake identities into the DHT
· Assign them node_ids close to that of a target info_hash
ffd5ac5acbd5deeeecdde8a716466ee43185fcf1 ffd5ac5acbd5deeeecdde8a716466ee43185fcf2 ffd5ac5acbd5deeeecdde8a716466ee43185fcf3 ffd5ac5acbd5deeeecdde8a716466ee43185fcf4 ffd5ac5acbd5deeeecdde8a716466ee43185fcf5 ffd5ac5acbd5deeeecdde8a716466ee43185fcf6 ffd5ac5acbd5deeeecdde8a716466ee43185fcf7 ffd5ac5acbd5deeeecdde8a716466ee43185fcf8 ffd5ac5acbd5deeeecdde8a716466ee43185fcf9
© British Telecommunications plc
13

Sybil node_ids Target info_hash Sybil node_ids

Scaling the botnet
Finding Leechers
· Generate today's config info_hash · Generate our node_id(s) `close' to info_hash · Sit and wait for get_peers requests to come in for today's info_hash · Store unique querying node IP addresses · Push data into ELK (Elasticsearch, Logstash, Kibana)
© British Telecommunications plc
14

Tracker Dashboard
© British Telecommunications plc
15

Example peer
© British Telecommunications plc
16

Customer Remediation Trial
· 71% not found in scans since trial · 86% of customers appreciated the feedback

How many devices (including Sound bars, DVR & IP Cameras) do you have connected to your BB connection?

6

1

36%

43%

© British Telecommunications plc
17

3 7%

2 14%

Customer Feedback: · Very happy with BT contacting them in this way · Happy to be contacted in this manner, customer had been witnessing poor
service for the last 2 weeks (ties in with virus) & has had numerous engineer visits where engineers could find no problem · "Great" · "Positive" · "Very good" · "Good" · "Good thing"

Now what?
· Torrent poisoning attacks? · Denial of service to Hajime configs?
© British Telecommunications plc
18

Further Reading/IoCs
· Rapidity Networks Hajime write-up
­ https://security.rapiditynetworks.com/publications/2016-10-16/hajime.pdf
· Hajime follow-up binary analysis
­ https://x86.re/blog/hajime-a-follow-up/
© British Telecommunications plc
19

Questions?
© British Telecommunications plc
20

