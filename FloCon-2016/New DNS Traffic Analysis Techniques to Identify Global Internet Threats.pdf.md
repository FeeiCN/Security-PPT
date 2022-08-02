New DNS Traffic Analysis Techniques to Identify Global Internet Threats
Dhia Mahjoub and Thomas Mathew
January 12th, 2016
1

Dhia Mahjoub
Technical Leader at OpenDNS PhD Graph Theory Applied on Sensor Networks Focus: Security, Graphs & Data Analysis
2

Thomas Mathew
Security Researcher at OpenDNS Background: Machine Learning Focus: Time Series and Data Analysis
3

Agenda
OpenDNS Global Network & Types of DNS Traffic Threat Landscape DNS Traffic Analysis Techniques Results  and  Recorded  Suspicious  Hos2ng  Pa5erns   Graph Analytics Conclusion
4

OpenDNS' Network Map
https://www.opendns.com/data-center-locations/
5

Where is OpenDNS in the network?
6

Threat Landscape
7

8

Some Security Graph Metrics
§ 70+ Billion DNS queries per day § Sample Authlogs:
~46M nodes per day ~174M edges per day
9

DNS Traffic Analysis Techniques
10

DNS Data ­ Authoritative Data
§Authoritative Data captures changes in DNS mappings: §Can reconstruct all the domains mapping to an IP for a
given time window and vice-versa §Reconstruct data regarding name servers
11

DNS Data ­ Authoritative Data
§Authoritative Data helpful in catching `noisy' domains
­Fast flux, domains with bad IP, prefix reputation
§Noisy domains change mappings frequently e.g. Fast Flux
12

Domain Reputation
§We have noticed relying on domain reputation breaks on identifying certain groups of threat
- Nxdomains, client behavior related domains
§Devised for an internet of 10 years ago §Malicious domains move quickly from IP to IP §Compromised domains §Price of domain and subdomain have gotten cheaper
13

Signals
§Hypothesis: DNS query patterns are a signal that is harder to control
§Refined Hypothesis: DNS query patterns can be used to help identify Exploit kit domains
14

Signals (cont'd)
§Inherent vs. acquired/assigned features §Lexical, DGA setup, hosting, registration can be changed §Traffic patterns that emerge globally from clients querying
malware domains are harder to obfuscate, change §Defeat malware domains by tracking their features for
which evasion at global scale is not easy
15

Traffic Patterns
§Create system to detect abrupt changes in query patterns §Query pattern data is below the recursive layer §Data includes: Timestamp, Client IP, Domain queried,
Resolver queried, Qtype, etc.
16

Detection System Components
Qtype Filter

Spike Detection

Domain History Filter

Domain Records
Filter

More Exploit kits

Fake software

Browlock

Phishing

17

etc

Expand the Intelligence Graph by pivoting around
IP, prefix, ASN, hoster, registrant email to catch more malware domains

Exploit kits Fake software
Browlock Phishing
DGA Spam Mailservers Forums Other

Spike Detection
§ Signal we look for is a spike § Spike defined as a jump in traffic over a two hour window
­ Use predetermined threshold. Helps filter out google, facebook, etc
§ Use a MapReduce job to calculate domains that spike
­Output 50-100k domains each hour
§ 50-100k domains is too much for manual inspection § Domains that spike can have past history § Mail servers, blogs, victimized domains, etc
18

Signals (cont'd)
19

Qtype Filter
§The amount of noise indicates we need more features §Look at past history, DNS Qtypes, all existing DNS records
of a domain, unique IPs, unique resolvers, etc. §Partition based on Qtypes:
­ 1 ­ A Record ­ 15 ­ MX Record ­ 16 ­ TXT Record ­ 99 ­ SPF Record ­ 255 ­ ANY Record
20

Qtype Partition Results
§Partition spikes based on their qtype distribution
­i.e. A record only, A record and MX record, etc
5
 nC5
n=1
§Interesting patterns begin to emerge
­ Only see 18 out of the 40 possible combinations ­ 75% or greater are A records only ­ Many combinations never appear ie only qtype 99 ­ Behavior of domains can be associated with partition
21

Qtype Partition Results
§Qtype of (1,15) associated with legitimate mail servers
­ Two types of distributions ­ 50/50 or 99/1 split between qtypes ­~4%
§Periodicity emergent in benign domains
22

Qtype Partition Results
§Qtype of (1,15,16,99,255) associated with legitimate mail and spam
­ Spam usually correlated with extremely high jumps ­ ~ 2.0% of all domains ­ demdeetz.xyz
23

Domain History Filter
§Past query history can be used to help remove benign domains and zero in on EMD ones
§Eliminate all domains with more than X consecutive nonzero hours of traffic
§Based on current EK domains' traffic patterns, only keep domains that feature Y consecutive most recent non-zero hours of traffic
24

Domain History Filter ­ benign with history
25

Domain History Filter ­ Nuclear EK
26

Domain Records Filter
§Check for all DNS records available for a domain §The existence/non-existence of certain records helps
narrow down the purpose of a domain. §Partition based on DNS records:
­ A ­MX ­TXT ­CNAME ­NS, specific name servers, indicative of compromise or malware
27

Random Forest
§ Use random forest for classification
­ Example of ensemble learning using boosting. Boosting refers to process reducing bias from a set of weak estimators
­ Scalable via parallelization
§ Use random forest on simple 2 class problem:
­ Exploit Kit/Non-Exploit Kit ­ In reality problem is multiclass: Spam, Exploit Kit, etc ­ For simplicity focus on binary problem
28

Random Forest (cont'd)
§ Input:
­ Spike data ­ Time series data
§ Output:
­ Classified domains
§ Use Sklearn random forest library § Challenges related to selecting features and tuning random forest parameters
29

Random Forest (cont'd)
§ Features contain a mixture of continuous, discrete, and categorical variables.
­ Challenge for most estimators. Random forest handles this problem better than most estimators
§ Continuous: Ratio of query counts to unique IPs § Discrete: Query counts § Categorical: QType Distribution § Features include:
­ Number of unique IPs ­ Distribution of QTypes ­ Distribution of RCodes
30

Random Forest (cont'd)
§ Have to tune various hyperparameters:
­ Number of features to decide split ­ Number of trees to create ­ Gini vs Entropy
§ Gini measure used for deciding when to create splits
­ We chose Gini because it generalizes better to continuous data. Majority of our data is continuous
§ Building deeper trees = longer training time § We decided to use sqrt(number of features) to determine the max number of
features used to generate split
31

Random Forest (cont'd)
§ Created a training set of 1k exploit kits and 2k non-exploit kits. § Ran through with a 10 fold cross validation § Successful in minimizing false positives:
­ One challenge was handling Chinese gambling sites which have close to identical behavior to exploit kit domains.
­ Difference is only apparent after examining lexical structure of domain name
§ AOC = .93
­ Significantly better than random
32

Results
33

Detected Threats
§Exploit kits: Angler Nuclear, Neutrino § DGA §Fake software, Chrome extensions § Browlock § Phishing
34

Detected Threats ­ Recorded Hosting Patterns
§ Compromised domains ­ Domain shadowing § Domain shadowing with multiple IP resolutions § Register offshore and diversify IP space § Large abused hosting providers (Hetzner, Leaseweb, Digital Ocean) § Shady hosters within larger hosting providers (Vultr)
35

Compromised domains ­ Domain shadowing
§Compromised domains ­ Domain shadowing serving Angler, RIG, malvertising
§Spike domain can have GoDaddy name servers and still be a non EK, e.g. Chinese lottery, casino sites, spam
§Difference is: EK domains have traffic from multiple IPs spread across several resolvers
§Traffic to spam, casino sites comes from a single IP
36

Angler versus Spam
§ Exploit kit: you.b4ubucketit.com. 0.0 45 45.0 40 11 {((ams),13),((cdg),1),((fra),3),((otp),1),((mia),6),((lon),6),((nyc),1),((sin), 3),((pao),1),((wrw),3),((hkg),7)} {((1),45)}
§ Spam: www.tzd.tcai006.net. 0.0 26 26.0 1 1 {((lon), 26)} {((1),26)}
§ 46.30.43.20, AS35415, Webzilla, https://eurobyte.ru/
37

38

39

Domain shadowing on multiple hosting IPs
§ odksooj.mit.academy. 3600 IN A 217.172.190.160 odksooj.mit.academy. 3600 IN A 85.25.102.30
§ 217.172.190.160, AS8972, PLUSSERVER-AS, https://vps-server.ru/ § 85.25.102.30, AS8972, PLUSSERVER-AS, https://vps-server.ru/ § The range 217.172.190.158-160 is hosting similar EK domains § 217.172.190.159 hosts vbnxkjd.governmentcontracting411.com which also resolves
to 178.162.194.172 § 178.162.194.172, AS16265/AS28753, http://www.hostlife.net/ § The range 178.162.194.169-172 is also hosting similar EK domains
40

41

42

Another EK
§ iou2386yu.ey346uidhfjj.xyz § 46.102.152.72, AS51852, https://www.qhoster.com/
46.102.152.97 2015-10-04 2015-10-05 1 46.102.152.72 2015-10-03 2015-10-05 2 46.102.152.91 2015-10-03 2015-10-04 1 46.102.152.52 2015-10-02 2015-10-04 2 46.102.152.46 2015-10-02 2015-10-04 2
§ 5 IPs in the /24 range are hosting similar pattern EK domains
43

Another EK
§ The 5 IPs share the same fingerprint
PORT STATE SERVICE VERSION 22/tcp open ssh OpenSSH 6.0p1 Debian 4+deb7u2 (protocol 2.0) 80/tcp open http nginx web server 1.2.1 Service Info: OS: Linux
§ 4 more IPs in the /24 range have same fingerprint and are very likely set up to host EK domains in the next couple days, and they did !
46.102.152.115 46.102.152.123 46.102.152.143 46.102.152.150
44

Register Business Offshore and Diversify IP Space
§ Qhoster, https://www.qhoster.com/ § Hosting provider's business registered in Belize § Hosting EK domains, phishing in addition to ordinary content § IP space in both ARIN and RIPE
45

46

Register Business Offshore and Diversify IP Space
47

KING-SERVERS
§Hosting provider's business registered in Anguilla §Hosting EK domains, malware, porn, insurance scam, fake
software, pharma §2816 IPs: 2048 IPs in ARIN space, 768 IPs in RIPE space
48

KING-SERVERS

others  

3356,US  

6939,US  

50245,CZ   39906,CZ  

50673,NL  

44546,CZ  

RIPE  768  IPs  (3  prefixes)  

others  

31.148.219.0/24   31.148.220.0/24   93.170.13.0/24  

49

27257,US  

6939,US  

14576,US  
ARIN  2048  IPs  (2  prefixes)  
104.193.252.0/22   162.244.32.0/22   Broken  into  /24,  /25,  /26,  /27,  etc  

Nuclear
§ fegshsjdjkasdhasdbaad.ga § 188.226.215.37, AS200130, https://www.digitalocean.com/ § 400+ Nuclear domains on that IP between Sep 24 and Oct 8 § A domain's lifetime is less than 1 day
50

Nuclear ­ Abused Large Hosting Providers
§ Previous pattern, name server domains registered with compromised email cavalliere.job@gmail.com and landing domains are registered as free domains under freenom
§ Name servers hosted on Digital Ocean and AS-Choopa/Vultr § Landing domains hosted on various ASNs, most notably AS-Choopa/Vultr § New pattern: Namesevers are freenom's own name servers, and landing
domains are hosted mainly on Vultr or Digital Ocean § Digital ocean has 9 ASNs. The smaller ones are the most abused: AS202018,
AS202109, AS200130
51

Previous pattern

Recent pattern

EK landing domains registered for free Idem through freenom

EK landing domains hosted on various ASNs, most notably AS-Choopa/Vultr

EK landing domains hosted on various ASNs, mainly AS-Choopa/Vultr, DigitalOcean Digital ocean has 9 ASNs. The smaller ones are the most abused: AS202018, AS202109, AS200130

Use dedicated name servers registered with compromised email 16 name servers registered with same email -> Can pivot around email or name servers to blacklist EK domains

Use of freenom's name servers: ns01-04.freenom.com -> Not possible to automatically pivot around name servers w/o weeding out FPs

Name servers hosted on various ASNs, mainly AS-Choopa/Vultr,

freenom's name servers hosted on Amazon and Google ASNs

DigitalOcean

-> Not reliable to block Amazon and

-> Can block name server IPs

Google IPs w/o FPs

52

Vultr ­ Shady Hoster within larger hosting providers
§ Vultr is a child company of AS-Choopa (AS20473) created to compete with Digital Ocean in the affordable VPS market
§ IP space is 65,000 large in North America, Europe, Asia/Pacific § Its cost-effectiveness made it an attractive platform for criminals
to host Exploit kits, phishing and other gray content § https://labs.opendns.com/2015/09/14/phishing-spiking-and-
bad-hosting/
53

DGA - 1
nxsabpxvqdhac86.com. 0.0 49 49.0 5 5 {((chi),12),((yvr),19),((lax),5),((ash),6),((dfw),7)} {((1),49)} lofefstnltktbpk.com. 0.0 49 49.0 5 5 {((chi),12),((yvr),20),((lax),5),((ash),5),((dfw),7)} {((1),49)} ycydhmuwhamfssagka.com. 0.0 48 48.0 5 5 {((chi),12),((yvr),19),((lax),5),((ash),6),((dfw),6)} {((1),48)} xrgxhcueshoedxt.com. 0.0 48 48.0 5 5 {((chi),12),((yvr),19),((lax),5),((ash),5),((dfw),7)} {((1),48)} uotsljmfuxd58.com. 0.0 48 48.0 5 5 {((chi),12),((yvr),19),((lax),5),((ash),5),((dfw),7)} {((1),48)} sycfdptbswdf3.com. 0.0 48 48.0 5 5 {((ash),6),((chi),12),((yvr),19),((dfw),6),((lax),5)} {((1),48)} pojrcpqajhcuqq4b.com. 0.0 48 48.0 5 5 {((chi),12),((yvr),19),((lax),5),((ash),5),((dfw),7)} {((1),48)} odmwooyyfoysnc.com. 0.0 48 48.0 5 5 {((chi),12),((yvr),19),((lax),5),((ash),6),((dfw),6)} {((1),48)} jcdbrovrumwouoo.com. 0.0 48 48.0 5 5 {((chi),12),((yvr),20),((lax),5),((ash),5),((dfw),6)} {((1),48)} dsiahpklftbfbwqc3.com. 0.0 48 48.0 5 5 {((chi),12),((yvr),19),((lax),5),((ash),5),((dfw),7)} {((1),48)}
54

DGA - 1
§ 22 DGA domains sharing identical spike features (volume, number of IPs, number of resolvers, resolver distribution)
§ Subsequent hours' traffic patterns are also identical
55

Fake software
§ flnhzjwdjqrwjqm.gangsta12.ru. 0.0 55 55.0 41 6 {((ams),7),((cdg),3),((fra),23),((wrw),5),((mia),13),((lon),4)} {((1),55)}
§ 82.118.16.114, AS15626, ITLAS ITL Company § 9 IPs in the vicinity are hosting same fake SW § 82.118.16.107 - 82.118.16.115
§ SoftwareBundler:Win32/LoadArcher.A
56

Fake software
57

Phishing
american-express-1v3a.com american-express-4dw3.com american-express-d34s.com american-express-d3s1.com american-express-f34s.com american-express-s2a3.com american-express-s3d2.com american-express-s43d.com american-express-s4a2.com american-express-sn35.com
58

Phishing
59

Phishing
§ american-express-1v3a.com. 4.0 1351 337.75 487 16 {((nyc),78),((ash),87),((chi),173),((yvr),60),((ams),69), ((cdg),60),((yyz),17),((sin),262),((fra),18),((lax),37),((dfw),137), ((wrw),1),((pao),4),((mia),75),((syd),14),((lon),259)} {((1),1350), ((255),1)}
60

Phishing
§ Hosting IPs:
149.210.234.215, AS20857 162.218.89.142, AS36352 91.108.83.213, AS31400 93.189.42.13, AS41853
§ Pivot around IPs and registrant emails, we find a lot more phishing sites for banks, e.g. Nova Scotia Bank, Royal Bank of Canada, and carding sites:
§ www.scotiasupport.com, rbcroyalbanksolution.com § prvtzone.cc, mcduck.cc, mrbin.tw
61

Some FPs
§Some possible false positives (xard38.oowaividaddict.net, uclfgji.kieyopowertochange.net)
§Chinese SEO §Pinyin + IP distribution
62

Graph Analytics
63

Client IPs IP
Time window IP
IP
IP
64

Domains D
D

Edge in the co-occurrence graph

D

Use Cases:
§ Domains sharing same theme, e.g. security sites, hacking, carding sites
­ Visited by users with related interest
§ Example: www.cert.org
§ Botnet CnC domains, e.g. DGAs § Infection chains: compromised sites -> Exploit kit landing domains
65

Co-occurring (Related) Domains
§ Hourly job § output is a 1.5 GB json file § Number of Edges: 61,280,656 § Number of Vertices: 2,207,680 § 100luimg.361lu.com. {"ucsec1.ucweb.com":3.0,"d2.avgc.us":
3.0,"home.1100lu.info":4.0}
66

Graph Analytics
§ Find connected components § Calculate density of every component § Density=Nb. of edges / Nb. of vertices § Number of Connected Components: 85421 § Distribution of nodes per component follows power-law
67

Component Distribution
68

Results
§ Detection of DGAs, spam domains, etc.
69

Conclusion
§Developed a more holistic view into DNS to detect threats §Use traffic patterns below the recursive and combine it with
pivoting around hosting infrastructures for more efficient threat detection §Use traffic-based models to extract seeds from the large DNS data set §Use graph analytics to explore communities of related threat domains
70

We are hiring!
71

Thomas Mathew and Dhia Mahjoub

tmathew@opendns.com

dhia@opendns.com @DhiaLite

72

