#RSAC
SESSION ID: TECH-R01
Power of DNS as an Added Defense Against Modern Attacks
Artsiom Holub
Senior Security Research Analyst Cisco Umbrella @messiagh

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
DNS data gathering, analysis and use cases

#RSAC
Gathering Intelligence at the DNS Layer

Any device

Recursive DNS

User request patterns
Used to detect:
 Compromised systems  Command and control callbacks  Algorithm-generated domains  Domain co-occurrences  Newly seen domains

Authoritative DNS

root

com.

Authoritative DNS logs

domain.com.

Used to find:

 Newly staged infrastructures

 Malicious domains, IPs, ASNs

 BulletProofHostings

#RSAC
DNS tunneling adoption for C&C and data exfiltration

DNS tunneling

User device

IT policy avoidance and

Port

guest Wi-Fi abuse

53

#RSAC

Recursive DNS resolution
or
ISP Cisco Umbrella

VPN tunnel infrastructure

Blocked site

Data exfiltration and C2 callbacks

Compromised system
3
3KJ24 2AIE9 PO28X
Send data

4
DNS request

5
Port
53

Recursive DNS resolution
or
ISP Cisco Umbrella

Attacker's infrastructure
16
3KJ24 2AIE9 PO28X

2 1.2.3.4
NS.BAYGUY[.]RU

Receive data

Content © 2022 Cisco Systems, Inc.

Sunburst ­ Supply Chain Attack
· Trojanized dll in digitally signed Solarwinds ­ thought to occur around spring 2020
· Post compromised communication used previously unknown algorithm
· Network traffic designed to mimic normal solarwinds api communications
· DNS exfiltration
· Follow up malware TEARDROP and COBALT STRIKE · Lateral movement, data theft

Technique is adopted by various APT groups

init.nbswy3dpfv3w64tmmqxhi6dupqzta.base32.tun2.test.com.

0.ccf3pqbiu6.ypfp2e3hf4.lchncynr5e.soqrz.tun2.test.com.

1.sircpzxlw4.u6nyjr3pyh.4e55g5xlnk.iznsa.tun2.test.com.

2.qgcjjbj7ll.fu2vgeunhg.kehqfb6ia6.xpjga.tun2.test.com.

Iran-linked APT group 3.i7oxqqq4a6.cbmkb4o5k5.wlejfba64n.kyife.tun2.test.com. 4.oigzu5725g.rzzjb6gkjt.azn3bf27yv.qb2ub.tun2.test.com. 5.nmqljyvm5u.hh2fdp3pny.4lzspfng3z.6mtds.tun2.test.com.

6.3s53dkyvpi.3pymlhtyv5.q5swdurwbb.zh5ay.tun2.test.com.

7.3fpb2qpsfx.h66ub4zlix.an7jpg7mlk.ajag2.tun2.test.com.

OilRig is heavily

8.apz3yl2uqf.ailsjo67zh.abnwz4gmbu.dcq2v.tun2.test.com. 9.drodl5mans.u3b47v7xsm.bqem6tph2s.dea7k.tun2.test.com. 10.2hyqspiund.h2nk3kr6ns.4gnkramjcy.52bpt.tun2.test.com.

leveraging on DNS

WINNTI (also known as APT41, BARIUM, 11.trzabtcq5k.dscf4swwnv.74pragsk2w.x7mr2.tun2.test.com.
12.i5qsrhx5fd.4okqc3hr7v.ewp7vfsrqk.lcedj.tun2.test.com. 13.z6bgflqay7.gohjhzsx3z.skwhmt7qab.j66zn.tun2.test.com. 14.d2j6hhv234.uinokao5km.rqjfqyikva.w2efx.tun2.test.com.
and Blackfly) relies on a DNS Tunneling 15.ymeoysb3sg.v2wo2ermpg.swcywtjmex.zayhr.tun2.test.com.
16.hqh3tco7tt.d6zacx25x4.rzbrchpxop.ibsc6.tun2.test.com. 17.3smhsrgfoc.sh67axljmv.gycow4hpev.5q4xp.tun2.test.com.

tunneling for its cyber communication channel with a custom 18.cfeewg5ipn.bwi45evfwr.bysizb5uhl.zorrc.tun2.test.com. 19.wp6our7oww.yungf3moq6.j4peie4l44.edww6.tun2.test.com. 20.jnbqmybuor.tz7ywd55ol.5vccppvfxn.f2fbt.tun2.test.com. 21.lenxkxzs5g.4gtdylxwf7.6prm2eswnu.gefbl.tun2.test.com.

espionage campaigns implementation 22.4nm6wmf6be.bio6wwwtzg.qssrdmnz5y.r47en.tun2.test.com. 23.mbksniznvs.7wjku7pbqb.55kjnv7avh.7dxbk.tun2.test.com. 24.4oyrsyy4pg.oj5mvb3sbu.i6mzfw3mjw.ldgud.tun2.test.com. 25.lrz7bby7tk.l27iqp33qj.ye7v2slpcd.6r7qt.tun2.test.com.

26.h3kzc43qky.6dx7u3sy3i.rm747hbeyj.qibj6.tun2.test.com.

27.nmsxtgdazg.vgtkp7cz23.twpei7grf5.ayiwd.tun2.test.com.

28.5jqe3c7dkk.wyvkcigeqb.lpcvtlbc3i.eaq72.tun2.test.com.

29.oma.tun2.test.com.

WINNTI

WINNTI malware C2 DNS Tunneling analysis
C2 configuration
Root domain : dick[.]mooo[.]com
dst_domain_offset = (char *)dst + strlen((const char *)dst)-1 if ( *dst_domain_offset != `.' )
*++dst_domain_offset = `.'; //add dot if previous part does not end with it strncpy(dst_domain_offset + 1, domain, strlen(domain) + 1
Use of Iodine for C2 DNS Tunneling:

WINNTI malware C2 DNS Tunneling analysis
C2 channel over DNS
NS . (root servers)

NULL? abcde.dick.mooo.com

NS .com

NULL? abcde.dick.mooo.com

Infected machine

<C2 response>

DNS Server

NS moo.com
NS dick.moo.com controlled by Threat Actor

WINNTI malware C2 DNS Tunneling analysis
The NULL DNS record type
The implementation of NULL type tunneling:
LOWORD(query[128]) = 0xA; result = dns_encode((int *)a1, (unsigned int)v8, (__int64)query, 0, (const char *)v13, strlen((const char*)v13));
Iodine's dns.c:

Multistage attacks often results in ransomware
Macros/Powershell

Malspam

Weblink

Doc

Loader

Ransomware

WINDOWS CLIENT

#RSAC
Follow-up malware
Post Exploitation Framework

Ransomware
NETWORK

Trojan

Lateral Movement

ACTIVE DIRECTORY DOMAIN CONTROLLER

ChaChi RAT deliver PYSA (aka Mespinoza) ransomware
DNS traffic generated by ChaChi

ChaChi RAT C2 DNS Tunneling analysis
Modified Chashell
Query Response
Chashell DNS tunnelling Query and Response

ChaChi RAT C2 DNS Tunneling analysis
Chashell Protocol Buffer Message.
message Message { bytes clientguid = 1; oneof packet { ChunckStart chunkstart = 2; ChunkData chunkdata = 3; PollQuery pollquery = 4; InfoPacket infopacket = 5; }
}

Quantum ransomware in 4 hours

18:56 IcedID malware

18:58 Persistence (scheduled
task)

20:44 Domain
and network discovery

21:08 Lateral Movement via RDP

21:38 ­ 22:06 Lateral
Movement to joined systems
via RDP

#RSAC
22:40 Quantum transferred
and executed

18:57 Discovery Activity

20:43 C&C injected CobaltStrike

20:53 Credential
Access

21:21 CobaltStrike
executed on Server

22:28 Quantum ransomware
staged on Domain Controller

CobaltStrike DNS Beacon
Ransomware Attacks
Other means 22%
CobaltStrike 78%

CobaltStrike Other means

· DNS Beacon is one of the most used Cobalt Strike features
· DNS Beacon is a DNS-only payload (no HTTP communication)
· A beacon can be configured with Malleable C2 configuration

Analyzing DNS Traffic
Beacon configuration

Config found: xorkey ...

0x0001 payload type

0x0001 0x0002

...

...

...

0x0008 server, get-uri 0x0003 0x0100

...

...

...

0x0006 maxdns

0x0001 0x0002

0x0013 DNS_Idle

0x0002 0x0004

0x0014 DNS_Sleep

0x0002 0x0004

0x003c DNS_beacon

0x0003 0x0021

0x003d DNS_A

0x0003 0x0021

0x003e DNS_AAAA

0x0003 0x0021

0x003f DNS_TXT

0x0003 0x0021

0x0040 DNS_metadata

0x0003 0x0021

0x0041 DNS_output

0x0003 0x0021

0x0042 DNS_resolver

0x0003 0x000f

...

1 windows-beacon_dns-reverse_http
`malicious.domain.evil/search/'
245 123443044 8.8.4.4 10000 (NULL ...) `cdn.' `www6.' `api.' `www.' `post.' (NULL ...)

Analyzing DNS Traffic
Malleable C2 configuration
From https://trial.cobaltstrike.com/help-malleable-c2#dns-beacon-bm

Analyzing DNS Traffic
Wireshark view of Cobalt Strike DNS traffic
From https://blog.nviso.eu/2021/11/29/cobalt-strike-decrypting-dns-traffic-part-5/

Analyzing DNS Traffic
DNS_beacon queries and replies
From https://blog.nviso.eu/2021/11/29/cobalt-strike-decrypting-dns-traffic-part-5/

Analyzing DNS Traffic
Possible DNS_Beacon replies
From https://blog.nviso.eu/2021/11/29/cobalt-strike-decrypting-dns-traffic-part-5/

Analyzing DNS Traffic
DNS_TXT queries
From https://blog.nviso.eu/2021/11/29/cobalt-strike-decrypting-dns-traffic-part-5/

Analyzing DNS Traffic
DNS_A queries
From https://blog.nviso.eu/2021/11/29/cobalt-strike-decrypting-dns-traffic-part-5/

Analyzing DNS Traffic
Beacon sending results to the team server with DNS_output queries
From https://blog.nviso.eu/2021/11/29/cobalt-strike-decrypting-dns-traffic-part-5/
This name breaks down into the following labels: · post: DNS_output query · 140: transmitted data · 09842910: counter + random number · 19997cf2: beacon ID · wallet[.]thedarkestside.org: domain chosen by the operator

#RSAC
Detecting and stopping DNS tunneling

DNS Tunneling Detections
 Reactive  Identifies tunneling domains based on querylog data
 Realtime Heuristics  Rule based method to detect known tunneling tools  Run in the resolver
 Realtime Behavioral Detection  Behavioral based detection that mimics the detection capability of the reactive system  System based on client query activity and sits in the resolver

#RSAC

#RSAC
Statistics, Communication, and Detection
· Interested in lexical features of subdomains
· Subdomains contain the `payload' of the message
· Features
· Number of subdomains · Existence of particular trigrams · Compressibility of feature sets
· Lloyd's algorithm to identify groups
· Measure distortion

DNS Resolver (Real-time Detection)
Protection against malicious tunneling tools and query techniques

Server Trying to complete DNS
Tunnel
Upstream Queries
Blocked (no data exfiltrated)

Umbrella DNS Resolver
Client Trying to establish DNS
Tunnel

Tools
DNS2TCP DNSCAT2 DNSExfiltrator...
Encoding techniques and query characteristics
Base64 ... Qtype TXT, SRV, MX, CNAME

DNS Resolver (Real-time Caching Detection)

Name Server Cache
· Caches frequently requested DNS records.
· Name server info frequently cached.

Tunneling Cache Signatures
· Developing proprietary caching strategy.
· Maintain signatures related to tunneling.

Global Resolver Fleet
· DNS resolvers independently detect DNS tunneling

#RSAC
Protection for the unknown

Newly Seen Domains Category Reduces Risk of the Unknown
1. Any user requests the domain 2. Check if domain was seen before & if whitelisted1. 3. If not, add to category, and apply inspection

#RSAC

Attackers register domains.

Domains used in an attack.

Before expiration2, if any user requests this domain, log it and block as newly seen.

Statistical models, automated analysis or manual analysis identify as malicious.

EVENTS

not yet a threat

potentially unprotected

DAYS TO WEEKS

MINUTES

1. E.g. domain generated for CDN service. 2. Usually 24 hours, but can be modified for best results, as
needed based on the behaviour.

protected
24 HOURS

blocked

#RSAC
Wrapping It UP
Malicious actors and the TTPs are constantly evolving, but DNS is still involved in 90% of the Attacks. To have a DNS monitoring system and DNS security is a MUST DNS isn't just initial vector of attack or C&C point. It is often utilized by malicious actors as covert channel for data exfiltration, command and control activities and beaconing. Not being able to detect such activities poses significant risk. To successfully counter malicious use of DNS apply combination of three approaches: detect known bad patterns, identify anomalies and apply scrutiny to unknown.
34

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Identify weak links in your DNS protection by testing existing solution against open-source DNS tunneling tools
In the first three months following this presentation you should:
­ Test against known implementations used by the active Threat Actors and APTs
­ Define strategy to improve existing security controls or add new
Within six months you should:
­ Proactively monitor anomalies and perform inhouse tests according to your organization's needs
35

