SESSION  ID:   AIR--RO4  
Using  Large  Scale  Data  to   Provider  A:acker  A:ribu<on  for   Unknown  IOC's  

Dan  Hubbard  
CTO OpenDNS, a Cisco company @dhubbard858
Dhia  Mahjoub  
Technical Leader, OpenDNS @dhialite

# R S A C   

Our Data
2

Inferences of Guilt

Pre-Compromise

Compromise

Post-Compromise

3

Inferences of Attribution
4

Can we build security context around inferences?
5

Decrease dwell time in response and enable focused hunting.
6

Threat Landscape
7

Malspam Phishing

Compromised Sites
Exploit Kit Angler Rig

Malvertising
Nuclear Neutrino

Malware Crypto-ransomware Banking trojan

Infostealer

Spambot

Click-fraud bot

DDoS bot

Fake software

8

Acoustic Models
9

SPRank
· Challenge: Build scalable detection models that are:
· Generic to rapidly catch a large number of malware domains/IPs of various types · Specific to provide context and details about detected threats
· Design detection that is immune to evasion and obfuscation by adversaries · Focus on below the recursive DNS layer · Inspect DNS query features that are harder to change at global scale · Assimilate DNS traffic patterns to sound waves
è Detect domains that show spike in traffic over a short time window (e.g. 1 hour)
10

SPRank

Dhia Mahjoub, Thomas Mathew, BruCon 2015, Flocon 2016, Kaspersky SAS 2016

United States ODNS-01010US0;62/202,662

11

SPRank DNS Features

Domain

QTYPE
1 ­ A 15 ­ MX 28 ­ AAAA 16 ­ TXT 99 ­ SPF 255 ­ ANY

RCODE

Resolvers

# of unique IPs

0 Resolving

List of resolvers

12

SPRank DNS Features
springweirtransferrerisque.communicationtrainingforathletes.com. 3.0 121 40.33 94 14 {((nyc),5),((ash),6),((yvr),4),((ams),2),((cdg),2),((yyz),13),((fra),33), ((dfw),24),((lax),6),((pao),11),((mia),7),((syd),1),((sea),5),((lon),2)} {((1),114), ((28),7)}
13

SPRank DNS Features
14

SPRank Detections

Exploit kits

DGA

Phishing

Fast flux malware
CnC

Cryptoransomware
CnC

15

Enrich and Expand at Scale
16

Expand Technical Threat Intelligence Knowledge
· Graph representation of IOCs and their relationships

· Node = IOC, e.g. domain, IP, domain whois email,

IP whois email, ASN, prefix, hash, etc.

10 9

· Edge = bidirectional expansion relationship between IOCs , e.g. domain to IP, domain to NSIP, domain to whois email, hash to C2 domain, etc.

7

8

6

5

ROOT

4

1

3

2
17

Expand Technical Threat Intelligence Knowledge
· Start a search with a seed, e.g. SPRank, NLPRank, Fast flux, DGA, etc., sample analysis, proxy logs, threat reports, etc.
· Warning: Dilution of threat signal from hop to hop b/c of shared hosting IPs, sinkhole IPs, sinkholed domains, sinkhole NSs, samples that make noisy/smokescreen calls, etc.
· Human analyst or automatic scripts should apply efficient filters on edge traversal
18

Infrastructure-based Models
19

IOCs Related to Domain Registration and Hosting
· Pivot around IPs · Pivot around domain whois email · Pivot around name servers · Pivot around name server IPs · Mine domains in /24 or smaller range, e.g. /29, /30 · Mine fast flux proxy networks
20

Derive Tactical Intelligence from Technical IOCs
· Goal: From Technical IOCs, derive Tactical intelligence:
· About hosting infrastructures and registration patterns · About malware campaign patterns:
· Domain query patterns, pattern similarity, timing, correlation with other events · IP querying or hosting patterns
· Objective of Tactical Intelligence:
· predictive IOC blocking, · understanding of crimeware TTPs for preventive measures, take-down operations
21

SPRank

Hash

whereareyoumyfriendff.com TeslaCrypt C2

39 domains

NSIP

NSIP

50.3.16.250 148.163.173.206 192.3.186.222

IP email

Phishing
Amex Lloyds Chase Wells Fargo

Malware C2
TeslaCrypt Ransomware

18 emails

18 IPs

email

TeslaCrypt Ransomware

Amex Lloyds Chase

IP
692 domains

Wells Fargo

Standard Chartered

DesJardins Bank

Westpac

Google

TTL 130-150 sec
1112 IPs from the 130-150 fast flux
proxy network
94 IPs as a mini fast flux pool of dedicated servers
TTL 60 sec

Phishing Trojan C2 Quakbot Carding sites Trojan panels
Ransomware Phishing

Filter out phishing with NLPRank
Ransomware
22

TeslaCrypt example ­ Pool of Dedicated Fast Flux IPs
20 36352 AS-COLOCROSSING - ColoCrossing,US 14 16276 OVH OVH SAS,FR 8 50673 SERVERIUS-AS Serverius Holding B.V.,NL 5 8100 ASN-QUADRANET-GLOBAL - QuadraNet, Inc,US 5 62638 QUERY-FOUNDRY - Query Foundry, LLC,US 5 56694 DHUB Telecommunication Systems, LLC,RU 4 46664 VOLUMEDRIVE - VolumeDrive,US 4 201094 GMHOST Alexander Mulgin Serginovic,UA 3 63294 FEVVO - Fevvo, Inc,US · Pool of VPS, VDS machines in ARIN and RIPE based hosting providers
23

TeslaCrypt example ­ "130-150" Fast Flux Network
100 15895 KSNET-AS _Kyivstar_ PJSC,UA 83 8708 RCS-RDS RCS & RDS SA,RO 56 25229 VOLIA-AS Kyivski Telekomunikatsiyni Merezhi LLC,UA 37 13188 BANKINFORM-AS CONTENT DELIVERY NETWORK LTD,UA 24 34661 BREEZE-NETWORK TOV TRK _Briz_,UA 24 15377 FREGAT-AS ISP _Fregat_ Ltd.,UA 23 31272 WILDPARK-AS WildPark Co,UA 15 12714 TI-AS Net By Net Holding LLC,RU 14 6849 UKRTELNET PJSC UKRTELECOM,UA 13 6703 ALKAR-AS PRIVATE JOINT-STOCK COMPANY _FARLEP-INVEST_,RU
· A pool of IPs from the known fast flux proxy network with TTL 130-150 · 20k+ live compromised broadband, DSL, FIOS residential machines mainly in Ukraine, Russia
24

Phishing (1)
· onlimecorpwestpac.com, a Westpac Bank phish · Registered on Jan 5th 2016 · Spike on Jan 6th, 11pm, domain live for 6 days
25

Phishing (1)
onlimecorpwestpac.com
104.245.233.163 178.33.213.12 185.86.77.41 198.175.126.117 199.180.116.115 216.170.126.106 23.95.248.152

cs@now.cn

120+ phishing domains

49 domains mostly phishing
178.33.213.12 - 178.33.213.15, OVH Khurran Nawaz
khurram.nj@gmail.com

Westpac Amex Lloyds Chase
Wells Fargo ANZ (Australia & New Zealand Banking Group)
St.George Bank Standard Chartered Bank

26

Phishing (2)
· aexp-support.com, an Amex phish · Registered on January 25th 2016 · Spike on Jan 25th, 4pm
27

Phishing (2)
aexp-support.com

whois-agent@gmx.com

500 domains

Banks phishing, carding, pharma

192.3.186.222 37.187.222.169

46 domains mostly phishing

37.187.222.168 - 37.187.222.171, OVH Khurran Nawaz
khurram.nj@gmail.com
192.3.186.216 - 192.3.186.223, AS-COLOCROSSING
quexsolutions.com, Kabul Aladeen, Ali

Amex Lloyds Chase Wells Fargo Standard Chartered Bank

28

Phishing (2)
· Same actor Khurran Nawaz, khurram.nj@gmail.com · Registered 2 separate IP ranges on OVH · 178.33.213.12 - 178.33.213.15 · 37.187.222.168 - 37.187.222.171 · Serving domains for phishing campaigns against at least 9 banks in US,
Canada, Australia and New Zealand
29

Predictive Models
30

IP Range Fingerprinting
· Introduced at Black Hat 2014 · Scan neighboring range for open services & versions, OS version · Certain attack IPs share identical fingerprints · If we detect first seed domains by acoustic or other model, then
block similar IPs before they start hosting domains
èMap out IP space of Bulletproof hosting providers
31

IP Range Fingerprinting
· iou2386yu.ey346uidhfjj.xyz · 46.102.152.72, AS51852, https://www.qhoster.com/
46.102.152.97 2015-10-04 2015-10-05 1 46.102.152.72 2015-10-03 2015-10-05 2 46.102.152.91 2015-10-03 2015-10-04 1 46.102.152.52 2015-10-02 2015-10-04 2 46.102.152.46 2015-10-02 2015-10-04 2
· 5 IPs in the /24 range are hosting EK domains with similar pattern
32

IP Range Fingerprinting
· The 5 IPs share the same fingerprint
PORT STATE SERVICE VERSION 22/tcp open ssh OpenSSH 6.0p1 Debian 4+deb7u2 (protocol 2.0) 80/tcp open http nginx web server 1.2.1 Service Info: OS: Linux
· 4 more IPs in /24 have same fingerprint with no hosted domains at the time of discovery. However, they are set up in bulk to host EK domains in the next days. Indeed EK domains appeared shortly
46.102.152.115 46.102.152.123 46.102.152.143 46.102.152.150
33

34

Malware Hosting Patterns
35

Domain Shadowing
Concentrated Hosting on Russian Speaking Providers

Hoster Hopping
Register Offshore
and Diversify IP
space

Abused Large Providers
Multi-purpose Fast Flux Proxy Network

36

RU Speaking Hosters under Large Providers
OVH
37

RU Speaking Hosters under Large Providers
Leaseweb
38

Hoster Hopping
· Large abused provider Singlehop : rogue ranges registered by same actor org: robert mcdono to host Angler:
· 173.236.74.200/29 · 69.175.20.72/29 · 69.175.112.224/29 · 184.154.47.96/29 · 69.175.66.72/29
39

Register Offshore and Diversify IP Space
40

King Servers
·Hosting provider's business registered in Anguilla ·Hosting EK domains, malware, porn, insurance scam, fake
software, pharma ·2816 IPs: 2048 IPs in ARIN space, 768 IPs in RIPE space
41

King Servers

others

3356,US

6939,US

50245,CZ

39906,CZ

50673,NL

44546,CZ

RIPE 768 IPs (3 prefixes)

others

31.148.219.0/24 31.148.220.0/24 93.170.13.0/24

27257,US

6939,US

14576,US
ARIN 2048 IPs (2 prefixes)
104.193.252.0/22 162.244.32.0/22 Broken into /24, /25, /26, /27, etc
42

Creating Inferences from Malware Behavior
How can I expand a single behavior indicator to identify others and infer attribution
43

Creating Inferences from Malware Behavior
How can I expand a single behavior indicator to identify others and infer attribution
44

Creating Inferences from Malware Behavior
45

Creating Inferences from Malware Behavior
Now lets take each new hash based on behavior from the inferences graph the network indicators.
46

Creating Inferences from Malware Behavior
47

Creating Inferences from Malware Behavior
48

How can you use inferences?
49

Dan Hubbard
@dhubbard858
Dhia Mahjoub
@dhialite

CONFIDENTIAL 50

