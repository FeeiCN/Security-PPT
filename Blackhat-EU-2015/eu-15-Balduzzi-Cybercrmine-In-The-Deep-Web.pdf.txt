Cybercrime In The Deep Web
Marco Balduzzi, Vincenzo Ciancaglini Black Hat Europe 2015
1

About us

Dr. Marco BALDUZZI  MSc in Computer Engineering  Ph.D. in System Security with
~15 peer-reviewed papers
 13+ years experience in IT Security -- Consultant, engineer and researcher
 Turned my hobby into my profession
 Sr. Research Scientist for Trend Micro
 Bridge scientific research and industry needs
 Veteran speaker in major conferences with 50+ talks

Dr. Vincenzo CIANCAGLINI  M.Sc. in Telecommunication
Engineering  Ph.D. in Computer Networking,
Peer to peer networks and next generations protocols
 10+ years experience in R&D
 Sr. Research Scientist for Trend Micro
 Development of novel proof of concepts and complex systems
2

Roadmap
 Introduction  Deep Web Analyzer (DeWA)
 Data collection  Data enrichment  Storage and indexing
 Illegal Trading  Data Analysis  Malware  Conclusions
3

Deep Web: Internet not indexed by traditional search engines. Dark Net: Private overlay network. Dark Web: WWW hosted on Dark Nets.
4

"
The Deep Web is vast. Thousands of times larger than the surface
web.
Alex Winter, Deep Web Documentary, 2015
5

"
The Deep Web is vast. Thousands of times larger than the surface
web.
Alex Winter, Deep Web Documentary, 2015
6

Our research focus

 Infrastructure resilient to LE takedowns

 Marketplaces for cybercrime goods

 Safe haven for information

exchange and coordination

Dark Web

· TOR · I2P · Freenet

Rogue TLDs
· Cesidian Root · OpenNIC · NewNations ·...

Custom DNS
· Namecoin · Emercoin

7

Freenet
 Oldest one: summer of 1999 (father of I2P)  Content distribution and discovery, no service hosting  Gossip protocol to lookup a resource (i.e. web page)
8

I2P
 First beta in 2003  Full Dark Net, no anonymous browsing to the Surface Web  Garlic routing: multiple encrypted tunnels, multiple layers
of encryption (transport, tunnel, path)
9

TOR
 First alpha in 2002  Initially used to browse anonymously the Surface Web  Hidden services -> effective Dark Web  Onion routing: multihop routing with with host key
encryption.
10

Namecoins, Emercoins
Blockchain-based domain name server Think bitcoins, but instead of payment transactions, DNS register transaction
Distributed Decentralised No regulating institution
11

rogueTLDs & privateDNSes
Plain old DNS, but with custom servers Custom registrars Custom domains
12

Roadmap
 Introduction  Deep Web Analyzer (DeWA)
 Data collection  Data enrichment  Storage and indexing
 Illegal Trading  Data Analysis  Malware  Conclusions
13

System Overview
14

Data Sources

User data

Pastebin sites

Twitter (1% feed)

Reddit

URL listing

TOR

sites

gateways

I2P host files

Scouting feedback

15

Deep Web Gateway

Privoxy + TOR
anonymizer

Polipo +

TOR 64

I2P

instances

Squid transparent proxy

Freenet

Custom DNS resolver

Namecoin DNS

rogueTLD DNS

Cesidian root

Opennic NameSpace

...

16

Page Scouting

Bitcoin Wallets

HAR Log

Page DOM

Email Links

Headless browser

Screen shot
Title

Raw HTML

Metadata

Text

17

Headless Browser
 Scrapinghub's Splash
 QTWebkit browser  Dockerized  LUA scriptable  Full HTTP traces
 Crawler based on Python's Scrapy + multiprocess + Splash access
 Headers rewrite  Shared queue support  Har log -> HTTP redirection chain
 Extract links, emails, bitcoin wallets
18

Data Enrichment

Embedded links classification (WRS)
· Surface Web links · Classification and categorisation

Page translation
· Language detection · Non-English to English

Significant wordcloud
· Semantic clustering · Custom algorithm

19

Significant Wordcloud

Page text

Scrap text from HTML, clean up, strip spaces...

Tokenization Create list of (word, frequency) pairs

Filtering Keep only substantives

Semantic distance matrix

How "far" are words from one another?

Hierarchical Group similar words clustering

Cluster label and popularity

Label clusters, sum frequencies

Word cloud Draw using summed frequencies

20

Example: Russian Forum
21

Collected Data
Running since 11/2013 (~2 years) 40.5 M Events 611,000 URLs 20,500 domains
22

Roadmap
 Introduction  Deep Web Analyzer (DeWA)
 Data collection  Data enrichment  Storage and indexing
 Illegal Trading  Data Analysis  Malware  Conclusions
23

Guns
24

Drugs! Drugs! Drugs!
25

Passports and Fake IDs
26

Counterfeit Money
27

Credit Cards
 Higher balance = higher price
28

Paypal & Ebay Stolen Accounts
29

Doxing
30

Assassins
31

Crowdfunding evil
32

Roadmap
 Introduction  Deep Web Analyzer (DeWA)
 Data collection  Data enrichment  Storage and indexing
 Illegal Trading  Data Analysis  Malware  Conclusions
33

"
Demo time!
34

Protocols (no HTTP/S)
By publicly sourced URLs
7 17
172 35

Port scan results

IRC

IRCS

SSH

49

31

855

* - We are based on anarchistic control so nobody haz power certainly not power over the servers or * - domains who ever says that this or that person haz power here, are trolls and mostly agents of factions * - that haz butthurt about the concept or praxis where the CyberGuerrilla Anonymous Nexus stands for.

#freeanons

15

[+Cnt] This channel is created to support arrested Anons

and act with solidarity in Anons. No MoneyFags, No Famefags, No PowerManiacs, No

LeaderFags! Another Anons was arrested in France: http://www.ladepeche.

fr/article/2015/10/10/2194982-enquete-de-la-dgsi-sur-du-piratage-informatique.html

36

Languages per domain
37

Languages per domain (2)
38

French forum: weapon sale
http://wyzn2fvcztadictl.onion:80/viewtopic.php?pid=16452
39

Pages Embedding Suspicious Links
40

Email Identification
41

bankofamerica@
42

Exilio forum 1/2
http://ogatl57cbva6tncg.onion:80/index.php ?t=msg&th=833&goto=4445&#msg_4445
43

Exilio forum 2/2
44

Automated Bitcoin Identification
1200+ bitcoin wallets found in our data (not counting the obfuscated ones)
45

Bitcoin Tumblers
http://tumbly5lisxnjozd.onion:80/
46

Bitcoin Multiplier 1/2
http://tfsux6hiihj7qvxh.onion:80/
47

Bitcoin Multiplier 2/2
48

Roadmap
 Introduction  Deep Web Analyzer (DeWA)
 Data collection  Data enrichment  Storage and indexing
 Illegal Trading  Data Analysis  Malware  Conclusions
49

Malware: Its adoption in the Deep Web
 Modern malware is network-dependent
 @ infection-time: Exploit kits  @ propagation-time: 2nd stage malware  @ operational-time: C&C servers
 Goals :
 Make botnets resilient against LEA operations, e.g. takedowns
 Conceal payment pages  Untraceable money transfers
 Additional readings:
 Brown in Defcon 18  Hunting Down Malware on the Deep Web (infosec institute)
50

SkyNet
 Malware with DDoS, bitcoin mining and banking capabilities (©G-Data/Rapid7)
 ZeuS bot  Bitcoin mining tool (CGMiner)  GPU libraries for hash cracking
 TOR client per Windows  Use /gate.php as landing page to store the
harvested credentials  Path monitoring ....
51

SkyNet: Dynamic TOR-based C&Cs
52

Dyre Banking Trojan
 BHO that MiTMs online-banking pages at browser-level
 Back-connects from victim to attacker (kind-of reverse-shell approach)
 DGA generation of C&C domains on Clearnet  Use I2P as backup option (:80/443)
 nhgyzrn2p2gejk57wveao5kxa7b3nhtc4saoonjpsy65mapycaua.b32.i2p (already known to SecureWorks on 17 December 2014)
 oguws7cr5xvl5jlrhyxjktcdi2d7k5cqeulu4mdl75xxfwmhgnsq.b32.i2p  4nhgyzrn2p2gejk57wveao5kxa7b3nhtc4saoonjpsy65mapycaua.b32.i2p
53

Dyre's Infection Evolution
54

Vawtrack Banking Trojan
 Spreads via phishing emails  C&C servers (IPs) are retrieved by downloading
the `favicon.ico' icon-file from websites hosted on the TOR network  IPs are steganographically hidden
55

Vawtrack Banking Trojan (cont.)
 Runs `openresty/1.7.2.1' as web-server  Return code on `favicon.ico' is 403 Forbidden
 `ws=`openresty\1.7.2.1' && (`favicon.ico') &&
retcode=403` returns a list of 23:
56

Vawtrack Banking Trojan (cont.)
57

Ransomware in the Deep Web
 Ransomware seem to love the Deep Web  It provides a hidden and robust "framework" for cashouts
and illicit money transfers
58

TorrentLocker
 A variant of cryptolocker
 Payment page hosted in the Deep Web
 Cashout via Bitcoins
59

TorrentLocker (cont.)
 Malware generates univocal IDs
 wzaxcyqroduouk5n.onion/axdf84v.php/ user_code=qz1n2i&user_pass=9019  wzaxcyqroduouk5n.onion/o2xd3x.php/user_code=8llak0&user_pass=6775
 Tracking on specific query string's parameters
 path='/[a-z0-9]{6}.php/user_code=[a-z0-9]{6}&user_pass=[0-9]{4}'
60

Breakdown by victims and country
61

NionSpy
 Steals confidential information like keystrokes, passwords and private documents
 Records video and audio, suitable for espionage programs
 Detection Feature:  Popularity in the number of values associated
to parameters (in the query string)
62

Automated Detection via ML
63

NionSpy: GET's query string analysis
 xu experienced a quick surge in popularity: 1700+ values
 si.php?xu=%e0%ee%a8%e5%f2%e9%e5%e4%f2[...]
 URL-encoded binary blob representing the leaked data
 si.php?xd={"f155":"MACHINE_IP", "f4336": "MACHINE_NAME","f7035":"5.9.1.1","f1121": "windows","f2015":"1"}
 Reports a new infection
64

NionSpy: New victims and leakages
 Blue (xd): # of new victims / day  Green (xu): amount of leaked information
(bytes)
65

Black Hat Sound Bytes
 We built a system for data collection and analysis in the Deep Web.
 We used it to quickly identify cybercriminal activities, such as trading of illegal goods, underground marketplaces, scams and malware infrastructures.
 We run it operationally and automatically to detect new threats.
66

Thanks! Q&A time...
Marco Balduzzi -- @embyte Vincenzo Ciancaglini -- @ziovic
67

