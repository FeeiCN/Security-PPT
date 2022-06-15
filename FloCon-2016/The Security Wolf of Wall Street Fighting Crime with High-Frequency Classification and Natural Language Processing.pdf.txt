The Security Wolf of Wall Street: Fighting Crime with HighFrequency Classification and Natural Language Processing
Jeremiah O'Connor and Thibault Reuille
J anuary 2016
1 CONFIDENTIAL

$ whois jeremiah
-Mad Scientist at OpenDNS/Cisco Labs -M.S. in Computer Science from University of San Francisco -Previously worked at Mandiant (IR/DNS Research), Evernote (AppSec/IR), Uber (Data Science) -Career Goals: Solve interesting problems (Networking/Security, Bioinformatics, GPS Tracking, Video Games, etc.) -Proud SFSPCAPitbull Puppy owner
2 CONFIDENTIAL

$ whois thibault
3 CONFIDENTIAL

 Security Research Team at OpenDNS.
 Creator of OpenGraphiti.
 Focus: Data Visualization, 3DGraphics, Graph Theory and Real-time systems.

Presentation Agenda
Introduction : Challenges &Hypothesis Real-Time Processing Fundamentals The Avalanche Project &The Research Pipeline Live Demo! Future Work
4 CONFIDENTIAL

Introduction to Avalanche
5 CONFIDENTIAL

Challenges
I've got 99 problems but malware ain't one!
 We see a lot of traffic.
 Needles in a haystack.
 Bad guys move fast.
 The needles are playing hide-and-seek.
 Outdated information has less impact than hot news.
 Slowpoke syndrome.
 Measuring the accuracy of our classifiers is not trivial.
 How big is the base of the iceberg?
6 CONFIDENTIAL

Hypothesis
To stream or not to stream.
 Most of our models can work in streaming.
 Well, that's a strong statement.
 We can detect "anomalies" on the fly.
 TSAis overrated anyway.
 We can have precise visibility over malicious activity.
 Statistics + Dataviz = Win!
 We can talk about what nobody knows.
 Wanna be famous?
7 CONFIDENTIAL

REAL-TIME !
8 CONFIDENTIAL

Real-Time, you said?
Different Levels of Constraints.  "Soft"
 Ex: Youtube / Netflix video streaming, Video Games, GPS ...
 "Firm" :
 Ex: Dishwasher, Audio DSP, Assembly line ...
 "Hard" :
 Ex: Airbag, UHFT Algorithmic Trading ...
 "Critical" :
 Ex: Missiles, Aircrafts, Nuclear Reactor ...
 "Near Real-Time" : Network-induced indeterminism.
9 CONFIDENTIAL

The Blackbox Abstraction
Real-Time vs High Performance.

Input
T0
10 CONFIDENTIAL

Blackbox
T1 ­ T0 ~ 1 second vs
T1 ­ T0 <= 2 seconds !!

Output
T1
Real-time != Fast

When Murphy meets the law of large numbers.
There's no such thing as "half water-proof".

Program

Runs fine 99% of the time Probability of a crash : 1%

99%

99% x 99%

99% x 99% x 99%

...

99% ^ N

...

At infinity, a program that SOMETIMES crashes is equivalent to a program that ALWAYS crashes!
11 CONFIDENTIAL

ZERO !

Key Design Points
Things to consider when writing code.  Fault Tolerancy
 Rigorous code.  Flawless error handling.  Unit tests  Degraded Mode?
 Algorithm Complexity : What's your worst case?
 Computing Time : Is it deterministic?  Parallelism &Concurrency : Context Switching, Deadlocks, Race Condition...  Memory Allocation : Static vs Dynamic
 Environment
 Background jobs, RAM, CPUs, Parasites, Hardware Failures...
12 CONFIDENTIAL

The Avalanche Project
13 CONFIDENTIAL

High Frequency Trading vs Traffic Classification
The Wolf of Wall Street
Stock Exchange

Historical Database Backtesting
14 CONFIDENTIAL

Quant Server
Strategies

Execution

Portfolio / Risk Management

High Frequency Trading vs Traffic Classification
The Wolf of Wall Street

Stock Exchange

Resolvers

Log Aggregation
Historical Database
Backtesting
ML Tra in in g
15 CONFIDENTIAL

Quant Server

Execution

Strategies
Models &Classifiers

Blocking Whitelisting Domain Tagging

Portfolio / Risk Management

Predicted Impact on Users

What is Avalanche?
Overview and Technical Details.  Open source project :
 http://github.com/ThibaultReuille/avalanche
 "Real-time" data processing framework.  Modular, parallel and distributed design.  Written with Python and ZeroMQ.  Platform for some OpenDNS models (Private) :
 https://github.office.opendns.com/Research/avalanche-opendns  NLP-Rank  DNS Tunnelling  Talos DGAclassifier and others (In progress)
16 CONFIDENTIAL

Avalanche Design
Divide and Conquer
Input Queue
ZeroMQ Socket
17 CONFIDENTIAL

NODE (Plugin)

Output Queue
ZeroMQ Socket

Avalanche Node
Plugin Template Code
18 CONFIDENTIAL

Avalanche Graph
Pipeline Definition

Plugin1

Plugin2

19 CONFIDENTIAL

Avalanche Pipeline
Divide and Conquer
Plugin
20 CONFIDENTIAL

Plugin Rack

Avalanche Rack
Plugin Rack Definition
21 CONFIDENTIAL

Run Avalanche
$ ./ a v a l a n c h e.p y p a t h / t o / m y _ p i p el i n e.j s o n 10 0 0 0
 Things you get for free :
 Modularity.  Multi-Threading.  Alibrary of plugins ready-to-use.  Reusability &collaboration.  An insanely fast messaging system.
22 CONFIDENTIAL

The Research Pipeline
23 CONFIDENTIAL

Avalanche Cluster
High Level View

Resolvers

Amazon S3

Avalanche

IntelDB

24 CONFIDENTIAL

Avalanche Cluster
· 8 Amazon instances · Master distributes work
· Round-robin · "Fire and forget" · Slaves process the chunks · 4 Avalanche pipelines · Results are centralized
25 CONFIDENTIAL

Master Slave Slave Slave Slave Slave Slave Slave Slave
Digest

Cluster Management with Boto &Fabric
h t t p s:/ / git h u b .o ffice .o p e n d n s.co m / Re se a rch / a va la n ch e -se rvice s
26 CONFIDENTIAL

Traffic Speed vs Avalanche Pipeline
Numbers don't lie.

Queries / Chunk Noon (UTC) Midnight (UTC) Queries / Second

Authlogs (AMS.m1) 564 752 412 050 Authlogs (AMS.m1)

Querylogs (AMS.m1) 6 147 997 3 315 157 Querylogs (AMS.m1)

Noon (UTC) Midnight (UTC)

941.25 686.75

10246.66 5525.26

 Avalanche Benchmark :
 ~30000 messages per second  1 message every 33 microseconds.  3 times faster than AMS.m1 query logs at peak time.

27 CONFIDENTIAL

ZeroMQ Performance Tests
Standard Linux Kernel

Real-Time Linux Kernel

Source: http://zeromq.org/results:rt-tests-v031 28 CONFIDENTIAL

Slave Processing Pipeline

Master

Streamer

Unifier

Domain Tagger

Matcher

GeoIP

NLP-Rank Capacitor

29 CONFIDENTIAL

VirusTotal, Investigate

DNS Tunnelling Capacitor
Hourly Digest Miner Script

TalosDGA Capacitor

Filtering

IntelDB

30 CONFIDENTIAL

31 CONFIDENTIAL

Live Demo
32 CONFIDENTIAL

Authlogs &Querylog Replaying

S3

Watcher

Streamer

Builtin

Builtin

33 CONFIDENTIAL

Workshop : Simple Fast-Flux Detection Pipeline

Log Replayer
Builtin

Random Sampler
Builtin

Fast-Flux Detection
Custom

34 CONFIDENTIAL

What's next?
35 CONFIDENTIAL

Future Work
 More models!  Cython or rewrite core in C/C++
 Optimize model performance
 Use GPU grids :
 OpenCL, GPU cluster
 Hackathon Idea :
 Avalanche at the DNS resolver level
 More log visibility
 Querylogs  Proxy logs
36 CONFIDENTIAL

Blog Post is Live.
37 CONFIDENTIAL

Introduction to Min e r/ Gra p h Oriented Data Mining
38 CONFIDENTIAL

Interesting Data Sources ...

 Domain  URL  IP  ASN  Hash  Email  Regex

SEED

39 CONFIDENTIAL

Investigate

Scores, Co-occurrences ...

Maxmind GeoIP

Country Info, ASNs ...

VirusTotal

Malware URLs, Vendor Info...

Shodan
HTTP ...

Banner Info ...
HTMLContent, Certificate, Links ...

Data Modeling Example

Regex

Domain

Domai n

Email

URL

Country

IP

ASN

Hash

40 CONFIDENTIAL

Knowledge
 Semantic Networks / Property Graph  Node =Concept, Edge =Relationship  Model of the Information  Ontology : Model of the Model
41 CONFIDENTIAL

Data Exploration : Breadth First Traversal
42 CONFIDENTIAL

Multi-Threaded Breadth First Traversal

A

B

C

B

C

43 CONFIDENTIAL

A

B

C

Lambda Mining
44 CONFIDENTIAL

 Functional Graph Exploration
 Rule Based / Thresholds / Topology based ...
 Profiles for specific use cases
 Automated Smart Data Mining

NLPRa n k/ Ph ish in g Detection
45 CONFIDENTIAL

Dat a Science Net work Securit y Big Security DataDNS Traffic:
~70B DNS requests per day HTTP Traffic:
~10.1Mrequests per day Daily Tasks:
-Detection Algorithms, Security Data Analysis, Distributed Systems, Big Data Engineering, Data Viz
46 CONFIDENTIAL

Purpose:
Overview of our new model NLPRank: -Fraud detection system using NLP techniques
and traffic features to identify domainsquatting/brand spoofing in DNS/HTTP (a technique commonly used by phishing and APT CnCs).
47 CONFIDENTIAL

#TeamPyt hon
NLP/Dat a Science: -NLTK -Scikit-Learn -Gensim Web Scraping: -Beautiful Soup -LXML
48 CONFIDENTIAL

Syst em Origins
-OpenDNS Labs has detection models for commodity malware (ex. Botnet, Fast-Flux, DGA) need a model to detect targeted attacks
-Assigned to analyze DarkHotel data set
Question: How to detect "evil" in DNS records using lexical features of FQDN and validat e results?
49 CONFIDENTIAL

Human-Comput er Int eract ion
Targeted Attacks: From a psychological perspective, if you were a high-profile exec for company what kind of links would you click on? What are your interests?
Commodity Phishing: Same psychology Topics of interest: -$$$, Bank Account/CCs, Financial -News -Security/Software updates -Social Network
50 CONFIDENTIAL

51 CONFIDENTIAL

Heurist ic #1- ASN Filt ering
52 CONFIDENTIAL

ASN Overview
-Autonomous System Number is basically like your neigborhood/zipcode on the internet -Associated with Internet Service Provider -Set of routers operating under specific or multiple routing protocol -Domains exhibiting fraudulent behavior are observed to be hosted on ASN's that are unassociated with the company they're spoofing
53 CONFIDENTIAL

Examples
Expect a FQDN containing "adobe" to be associated with Adobe's ASN (ex. ASNs 14365, 44786, etc.), or FQDN containing "java" and advertising an "update" be associated with Oracle ASN (ex. 41900, 1215, etc.) So why t hen? APT Example (Carbanak):
-adobe-update[.]net - ASN 44050, PIN-AS Petersberg Internet Network LLC in Russia -update-java[.]net - ASN 44050, PIN-AS Petersberg Internet Network LLC in Russia Commodit y Phishing Examples: Domain: securitycheck.paypal.com ASN 20013, CYRUSONE -CyrusOne LLC, US Domains: serviceupdate-paypal.com, updatesecurity-paypal.com,
54 CONFIDENTIAL
ASN 32400 - Hostway Services, Inc.,US

The Usual Suspect s..
1. CyrusOne LLC,US 2. Unified Layer,US 3. OVH OVH SAS,FR 4. GoDaddy.com, LLC,US 5. HostDime.com, Inc.,US 6. SoftLayer Technologies Inc. 7. HOSTINGER-AS Hostinger International
Limited,LT 8. HETZNER-AS Hetzner Online AG,DE 9. Liquid Web, Inc.,US 10.CLOUDIE-AS-AP Cloudie Limited-AS
number,HK
55 CONFIDENTIAL

More Normalized...
1. OBTELECOM-NSK OOO Ob-Telecom, RU 2. GVO - Global Virtual Opportunities, US 3. CONFLUENCE-NETWORK-INC - Confluence Networks Inc, VG 4. CYRUSONE - CyrusOne LLC, US 5. VFMNL- AS Verotel International B.V., NL 6. NEOLABS- AS Neolabs Ltd., KZ 7. DEEPMEDIA- AS Deep Media / V.A.J. Bruijnes (sole proprietorship),NL 8. NEUSTAR- AS6 - NeuStar, Inc., US 9. VERISIGN- ILG1 - VeriSign Infrastructure & Operations, US 10. CIA- AS Bucan Holdings Pty Ltd, AU
56 CONFIDENTIAL

ASN Filt er + Whit elist ing
1st step to take a big chunk out of the traffic, because text processing is computationally intensive -Do a lot of ASN Analysis with other models (Dhia Mahjoub, PhDGraph Theory) Authlogs come in -> Enricher node will look up ASN and include logs
Create mapping of Brand Names to their legitimate ASNs Lookup domains/IPs as they come in
57 CONFIDENTIAL

Heurist ic #2 - Defining Malicious Language Wit hin FQDNs
58 CONFIDENTIAL

Building Int uit ions
-Eyeball Data
-Run basic text metrics on the data, gain intuitions about the data and extract important words/substrings in APT FQDN datasets
-APT domains exhibit similar lexical features to commodity phishing domains
-Important look at word co-occurrences (bigrams, trigrams, etc.)
59 CONFIDENTIAL

Building Int uit ions
-From APT data sets extracted words from dictionary and applied stemming looking at word stats:
Top counts (stemmed): mail, news, soft, serv, updat, game, online, auto, port, host, free, login, link, secur, micro, support, yahoo
Bigram Collocations:
Words that often appear with each other adobe-update update-java[.]com Idea: brandname + ad-action word [.] tld
60 CONFIDENTIAL

Examples
Dark Hotel (Kaspersky):  adobeupdates[.]com  adobeplugs[.]net  adoberegister[.]flashserv[.]net  microsoft-xpupdate[.]com
Carbanak (Kasperksy):  update-java[.]net  adobe-update[.]net
APT 1 Domains (Mandiant):  gmailboxes[.]com  microsoft-update-info[.]com  firefoxupdata[.]com
61 CONFIDENTIAL

NLP on FQDN
-Creating a "malicious language" derived from lexical features of FQDNs from APT/Phishing data sets -Built corpus of domains similar to examples in previous slide -Create custom dictionaries
Brandname Dictionary Ex. google, gmail, paypal, yahoo, bankofamerica,
we llsfa rgo -Custom set of stemmed common malicious words Ex. secur, updat, install, etc.
-Reason for stemming example: updat -> firefoxupdata[.]com (APT1) -Apply Edit-Distance/Automata Theory on substrings to build spam la n gu a ge
62 CONFIDENTIAL

Heurist ic #3- HTML Cont ent Analysis
63 CONFIDENTIAL

Recreat ing Researcher's Mind
When reviewing malicious domains what is typical methodology for review: 1) Visit site in Tor browser 2) Researcher processes information on site, looks for clues, gains summary 3) Makes decision whether site is legit/malicious Specifically for Phishing Sites:
Human-Computer Interaction: What makes people fall for this? Site will be near copy of legitimate site it's intending to spoof How can we automate this process? Can we apply document similarity algorithms?
64 CONFIDENTIAL

Human-Comput er Int eract ion
Examples from Apple Phishing page:
Tit le: Apple GSXLogin Links: https://iforgot.apple.com/cgi-bin/findYourAppleID.cgi?language=US-
EN&app_id=157&s=548-548 https://id.apple.com/IDMSAccount/myAccount.html?appIdKey=45571f444c4f547
116b fd 052461b 0b 3a b 1b c2b 445a 72138157e a 8c5c82fe d 623&a ct io n =re gist e r&la nguage=US-EN Images: <img alt="" src="https://www.chase.com/etc/designs/chasecomhomepage/images/home page_background_1px.jpg"/>
65 CONFIDENTIAL

Ot her Clues:
HTTrack - tool used to clone site
66 CONFIDENTIAL

Preparing The Dat a
-Cleaning the Data -Stripping punctuation, symbols, unnecessary content -Normalizing the data
-Stemming (update, updating, updater updat) Feature Encoding
67 CONFIDENTIAL

Harder t han it seems... -Non-Trivial to extract relevant terms from HTMLdocuments -Dealing with malformed tags -Lose data, dealing with HTMLand JS -Which tags to encode?
-Title -Links -Images Applied basic NLP Algos..but need more samples for training!!
68 CONFIDENTIAL

More Headaches
Legit USAA Sit e: <title>USAAMilitary Home, Life &Auto Insurance | Banking &Investing</title> Many USAA Phishing Sit es: <title>USAAMilitary Home, Life &amp; Auto Insurance | Banking &amp;
Investing</title> USAA Phishing Page: <title>U&#83;&#65;AMi&#108;&#105;&#116;&#97;&#114;y Home, Life &amp; Auto
I&#110;&#115;&#117;&#114;&#97;&#110;&#99;e</title>
69 CONFIDENTIAL

Success Ident ifying All Different Types of At t acks
Success in Training: Detecting: Careto APT Domains Darkhotel/Carbanak/APT1 etc. AJAXHacking Group/Flying Kitten infostealer C&C Operation Pawn Storm Operation Saffron Rose and more...
Success on Live Dat a: Exploit Kit Fast-Flux And new stuff..
70 CONFIDENTIAL

Int erest ing Result s
Carbanak (banking trojan) came out in February:
2015-01-23 14:52:58 -- a96e74b8-b052-4f42-a517d7273d4f13e7
NLPRank High-Risk Results (FQDNs)
cdneu.windows8downloadscdn.com updat e-java.net
71 CONFIDENTIAL

Int erest ing Result s
symant ecupdat es.com
Li Ning From guangdongsheng guangzhoushi Alabama??? Let's investigate all domains associated with that email address...
72 CONFIDENTIAL

21,533 Domains???
crowcasinovip.biz mybestbrand.biz mybestbrands.biz huarenceluewangzhi.com icbczay.com boyinbocai5.com haoyunc3.com bocaiwangzhenqianpingtai.com zuqiubocaiwangzhan7.com weinisirenyulecheng94.com xinquanxunwang244.com dfjdh.com yaojiyulecheng9898.com wanbaoluyulecheng94.com xinpujingyule15.com toabaao.com jinbaiyiyulecheng26.com toubakd.com tiantianleyulecheng61.com wangziyulecheng33.com yezonghuiyulecheng82.com bocwry.com huangguantouzhuwangzhanwangzhi86.com huangguanwangquaomen29.com haiwangxingylc1664.com yinghuangylc727.com bocaiasd.com changjianggjylc.com jinmaylcoiu.com yazhougjylc.com huangguanxin2wang32.com benchixsyl.com zhucecaipiaosongcaijin.com ceoylcdf.com zhucesongcaijindewangzhan62.com aomenduchangyouxiyounaxie30.com mengtekaluoylcb.com guojihuangguanyule40.com huangguantiyupingtai93.com huangguanxianjinwangxinyu37.com aomenduchangpaixing27.com 500wanylcyu.com dajihuiylc686.com ruifengguojiyy.com makeboluoylcb.com jincaigjylc.com xindongfangylc869.com aomenduchangzainali50.com wangshangyulekaihusongcaijin.com huangguanxjwkh.com jinbangylc77.com baijialeqo.com yataigjylc.com baishenggjylcwe.com bocaigongsiqe.com wufagjylc.com moerbenylckk.com bogouylc1663.com huangguandailiwangzhi23.com bojueylcpo.com bocaiwangzhanqe.com taoataao.com bbhunas.com sjzd36.com sjpt63.com bjlkh33.com baijialebishengtouzhujiqiao20.com xijialiansaijifenbang57.com baijialeyule86.com xijiapaiming46.com aomenbaijialechangying76.com baijialeyulepingtai34.com wangshangbaijialekaihusongcaijin76.com ouzhouwudaliansaipaiming53.com wudaliansaitedian39.com baijialekaihusong50caijin17.com baijialeguize52.com zhibobazuqiuzhibo2.com zuqiubifenqiutan88.com dejiasaichengbiao88.com zuqiuba85.com mahuitqzzjw83.com sjzd01.com weixingjianting29.com cwanpp.com xingboyulezaixian86.com mwqpah.com jiankongpingtairuanjian43.com zhenqianyulechengguanwang63.com njdyyytj.com fanheer.com 999coin.com shenganna74.com jackwolfskinsalejp.com zaozhuangcq.com bjl7788.com ruhejiankongshouji2.com aomenduchangyingqianliao75.com shoujidingweichaxunruanjian12.com shoujijiantingshebei46.com aomen916.com shoujikajiantingqi77.com zhenqianyouxipaixing2.com rysevw.com wanzhenqianwangzhan36.com vrcgw.com
73 CONFIDENTIAL
feilvbinshengannayulecheng20.com duchangyingqianmijue81.com zzvqo.com

74 CONFIDENTIAL

Sakula/Threat Connect Report
75 CONFIDENTIAL

More BlueCross/Premera
Found t hese: adobeupdated[.]com gmail-msg[.]com intel-update[.]com vmwaresupportcenter[.]info Didn't cat ch t hese but definit ely capable: prennera[.]com we11point[.]com.
76 CONFIDENTIAL

Int erest ing Result s
Way to filter into parked/suspended pages?? 1. Parked Pages a. Interesting patterns among terms of parked pages, examples: i. www[.]iniciar-sesion-gmail[.]com 1. Important Terms (stemmed) : fjccheck1catchexcept, click, trydocumentcooki, proceed ii. ww2.content.archiveofourown.orgamazon.com 1. Important Terms (stemmed) : fjccheck1catchexcept, click, trydocumentcooki, proceed iii. android.clients.google.com.www.smartbrosettings.net, 1. Important Terms (stemmed) : fjccheck1catchexcept, click, trydocumentcooki, proceed 2. Suspended Pages a. "Suspend" relayed as most important terms, example: i. FQDN: xbmcwindows[.]com 1. Important Terms: ' suspend' ,'arial', normal, solid'
77 CONFIDENTIAL

78 CONFIDENTIAL

79 CONFIDENTIAL

Combining Det ect ion Models
80 CONFIDENTIAL

81 CONFIDENTIAL

Traffic for 2nso3s.com
82 CONFIDENTIAL

Vinny Lariza

Kevin Bottomley

Dhia Mahjoub

83 CONFIDENTIAL

How Phisht ank Works
Submit --------------------> Vote! -------------> Categorize -----------------> Filter
84 CONFIDENTIAL

Ident ifying Problem
-PhishTank has Cult Following in Security Community - People always asking about it conferences, security parties, LinkedIn etc.
-Identifying spoofed brands of phishing URL's in real-time / as they are submitted is necessary for reducing the amount of false positives in the PhishTank feed
-Reducing the amount of time from submission to approval -IMO: Phishtank= giant training set for sec data scientists
85 CONFIDENTIAL

Examples of False Posit ives
86 CONFIDENTIAL

Hypot hesis:
-Using IR/NLP techniques to gain a summary of the web page is a problem that has already been solved algorithmically ex. search
-Simila r to wa y Netflix recommends movies ba sed on user history, ca n we recommend what brand name the phish is by content of the page?
-Lets apply these same techniques to identify commodity phishing pages Hypot hesis: We can ident ify Phishing pages by using IR/Topic
Modeling t echniques, and aut o-label Phisht ank submissions as t hey come in
87 CONFIDENTIAL

88 CONFIDENTIAL

Topic Modeling
-Methods for automatically organizing, understanding, searching, and summarizing large electronic archives. 1. Discover the hidden themes of collection.
2. Annotate the documents according to themes. 3. Use annotations to organize, summarize, search, make predictions. -Great for building recommender systems -Used as features for a classifier
89 CONFIDENTIAL

Building Corpus
-Built Corpus of HTMLContent of Phishing pages, ex. WellsFargo, Paypal, Amazon, Apple, Bank of America, from Phishtank Only Focused on Big Name Brands - Data Collection, although at times tedious, become very intimate with the data -See all kinds of variations of Phishes 90s Paypal vs. 2000s Paypal vs. 2015 Paypal Christian Mingle Phishing?
90 CONFIDENTIAL

TF-IDF Input: Word Count Vector From Terms in HTMLDocument (Query), Word Count Matrix over a collection (Corpus) TF-IDF - Show how important word is to a collection Balance between: Frequency of Term and Rarity over all documents Term-Frequency: # of times term t, appears in the document d -Term Relevance does not increase proportional with term-frequency Inverse-Document Frequency: the # of documents that contain term t TFIDF - tf-weight * idf-weight
TFIDF - Increases with number of occurrences within a document, and rarity of term over all documents
91 CONFIDENTIAL

LSA/LSI
Latent Semantic Analysis: analyzing documents to find underlying concepts/meaning from them (clustering algorithm) Uses singular value decomposition (reduce dimensionality) to identify patterns in the relationships between the terms and concepts contained in an unstructured collection of text. Hard because of variations in English language, synonyms, ambiguities some words have different meanings when used in context -Uses Bag of Words Model (Ordering doesn't matter) -Using n-grams can help identify associations using co-occurrences Helps with normalization of data Bigrams: San Francisco -> san_francisco, Sign In -> sign_in
92 CONFIDENTIAL

LSA/LSI
Input: X, count matrix (or TFIDF), where m (rows) is number of terms, and n is number of documents
When we do decomposition, have to pick a value k, which represents the number of topics/concepts
Process: Decompose Xinto 3 matrices, U, S, V(T) U=m x k matrix, where m =terms, k =concepts S=k x k diagonal matrix. Elements are amount of variation captured from each concept. V(transpose)=k x n matrix, where k=concepts, n=documents
93 CONFIDENTIAL

LSA/LSI Example
In this example LSAhas been run, 9 - titles plotted with blue squares, 11 index words in red squares, 3 dimensions (topics)- (1DDocs correlates w/ length, Terms correlates w/ # times w across all docs)
Blue Cluster - Contain T7, T9 - Real-estate
Green Cluster- T2, T4, T5, T8 - Value Investing
Red Cluster - T1, T4 - Stock Market
Outlier - T6
1. The Neatest Little Guide to Stock Market Investing 2. Investing For Dummies, 4th Edition 3. The Little Book of Common Sense Investing: The Only Way to Guarantee
Your Fair Share of Stock Market Returns 94 CONFIDENTIAL 1. The Little Book of Value Investing

Cosine Dist ance
Word counts of the documents (HTMLContent) form vectors Cosine is normalized dot product of the vectors Compute Cosine Distance from the components of the 2 vectors
i. Cosine Similarity to Phishing Pages in the Corpus 1. Transform terms of HTMLdocument into vectors and Corpus (Phishing) documents to vectors 2. Find angle (Cosine Similarity) between input HTMLdocument term vector and Corpus documents 3. Return ranking of the sites with the most similar HTML Documents in Corpus
95 CONFIDENTIAL

Cosine Dist ance b/t Vect ors
96 CONFIDENTIAL

Aut o-Labeling Brand Result s:
Sample Output (Document Handle, Document (Cosine) Similarity Score, Brand/FQDN of URL): Input URL/Query: WellsFargo/fitac.com.tr.html (61, 0.99899197) WellsFargo/wellsfargo.com.html (62, 0.99890876) WellsFargo/usam.edu.sv.html (60, 0.9984659) WellsFargo/school76.irkutsk.ru.html (59, 0.98146677) WellsFargo/theweddingcollection.gg.html (63, 0.97453147) WellsFargo/exin.ba.html Input URL/Query: Chase/www.nutrem.mx.html (76, 0.98566723) Chase/bororooil.com.html (75, 0.92363083) Chase/chaseonline.chase.com.html (27, 0.92042124) BankOfAmerica/createcrafts.ph.html (25, 0.92009199) BankOfAmerica/actautismoman.com (74, 0.91776139) Chase/www.zac.or.tz.html
97 CONFIDENTIAL

Aut o-Labeling Brand Result s:
Sample of Brand Names from Incoming Phishtank Stream 467 Total Samples - 78 in Corpus, 389 Test 353 hitting as Top recommendation, 18 out of remaining 36 in Top 5 Still along the same Topic/Theme, ex. (Bank/Finance, Mail, Social) 371 / 389 (With additional weighting tests, work in progress) Some Brands have higher accuracy than others (Wells Fargo, BofA)
98 CONFIDENTIAL

Aut o-Labeling Brand Result s:
ACCURACY: 0.989112354453 PRECISION 0.907455012853 RECALL 0.907455012853 SENSITIVIY0.907455012853 SPECIFICTY0.994215938303 TPR 0.907455012853 FPR 0.00578406169666 X, Y(Best 0,1) (0.005784061696658127, 0.9074550128534704) BALANCED F1 MEASURE 0.907455012853
99 CONFIDENTIAL

Beyond Phisht ank
-DNS data is not the ideal match for this data...HTTP traffic much better fit Why? When doing lookups, landing on index page, most often phishing page is not on index page -Within DNS, necessary to build crawler Question: But there's so much traffic, are we going to do GET request for every URL???
100 CONFIDENTIAL

OpenDNSInt elligent Proxy
What is the Intelligent Proxy? -Awesome Team!!
-Man in the Middle -Greylisting -Next step in OpenDNS Security
101 CONFIDENTIAL

Dedicat ed vs. Compromised Examples
Dedicat ed: update-java[.]net, adobe-update[.]net, http://wellsinfo.net/login Compromised:
Domain: wwelllssssfffarrgo.webzdarma.cz.html h t t p :/ / d a n d ra gh ice scu .ro / d b o x/ d p b x/ d p b x/ http://school76.irkutsk.ru/language/Wellsfargo/online.htm http://createcrafts.ph/bankofamerica.com.update.login.in.info/de17792ab89754c6b0a58d767a6985f
c/ http://www.kingdomhome.com.au/wp-admin/wellsfargo.zip/wellsfargo-online.server/details.html http://wellsfargoonline.pfwv.com.br/wellsfargo/ http://www.cityroo.com/sarasoa/wellsfargo/wellsfargo-online.php http://wellsfargo.com.billing.account.updatemyaccount.wellsfrago.com.onlineaccounts.upgrade.onl
ine.billing.account.update.nlineaccounts.upgrade.online.billing.account.update.kowafdfsfs.net http://comosecuraladiabetes.com/wp-admin/js/well.htm
102 CONFIDENTIAL

- Acquiring Data
URL Feed (HTTP/PT )

- Filtering Whitelist

Counts

TF-IDF

of words

on

page Latent Semantic

Analysis

Forms Check
Top N Similar Documents

-NLP ASN Filter
Fetch Page Content

-Output
Popularity Check
Editdistance/Regex/Cust om Dictionary Block List Auto-Tag Brand/ Topic In Phishtank

Compare Cosine Similarity
103 CONFIDENTIAL
To Corpus

Build Training Sets. Periodically Retrain

Email Daily Results

Conclusion
§ Agile Research: Building, Testing, Tuning, Iterating § Different Algorithms, LSAas Feature § Topic Modeling on More Content (LDA, seasons) § More Features (SimHashing, HTMLcontent encoding) § Data Collection/Building Corpus § Filtering FPs § Spark Streaming! § United States ODNS=-1009US0; 62/167,178
104 CONFIDENTIAL

QUESTIONS?

@jmoconnor415 jeremiah@opendns.com jeoconno@cisco.com

@Thibault Reuille thibault@opendns.com treuille@cisco.com

105 CONFIDENTIAL

The Security Wolf of Wall Street: Fighting Crime with High-Frequency Classification and Natural Language Processing
Jeremiah O'Connor and Thibault Reuille
J anuary 2016
106 CONFIDENTIAL

$ whois jeremiah
-Mad Scientist at OpenDNS/Cisco Labs -M.S. in Computer Science from University of San Francisco -Previously worked at Mandiant (IR/DNS Research), Evernote (AppSec/IR), Uber (Data Science) -Career Goals: Solve interesting problems (Networking/Security, Bioinformatics, GPS Tracking, Video Games, etc.) -Proud SFSPCAPitbull Puppy owner
107 CONFIDENTIAL

$ whois thibault
108 CONFIDENTIAL

 Security Research Team at OpenDNS.
 Creator of OpenGraphiti.
 Focus: Data Visualization, 3DGraphics, Graph Theory and Real-time systems.

Presentation Agenda
Introduction : Challenges &Hypothesis Real-Time Processing Fundamentals The Avalanche Project &The Research Pipeline Live Demo! Future Work
109 CONFIDENTIAL

Introduction to Avalanche
110 CONFIDENTIAL

Challenges
I've got 99 problems but malware ain't one!
 We see a lot of traffic.
 Needles in a haystack.
 Bad guys move fast.
 The needles are playing hide-and-seek.
 Outdated information has less impact than hot news.
 Slowpoke syndrome.
 Measuring the accuracy of our classifiers is not trivial.
 How big is the base of the iceberg?
111 CONFIDENTIAL

Hypothesis
To stream or not to stream.
 Most of our models can work in streaming.
 Well, that's a strong statement.
 We can detect "anomalies" on the fly.
 TSAis overrated anyway.
 We can have precise visibility over malicious activity.
 Statistics + Dataviz = Win!
 We can talk about what nobody knows.
 Wanna be famous?
112 CONFIDENTIAL

REAL-TIME !
113 CONFIDENTIAL

Real-Time, you said?
Different Levels of Constraints.  "Soft"
 Ex: Youtube / Netflix video streaming, Video Games, GPS ...
 "Firm" :
 Ex: Dishwasher, Audio DSP, Assembly line ...
 "Hard" :
 Ex: Airbag, UHFT Algorithmic Trading ...
 "Critical" :
 Ex: Missiles, Aircrafts, Nuclear Reactor ...
 "Near Real-Time" : Network-induced indeterminism.
114 CONFIDENTIAL

The Blackbox Abstraction
Real-Time vs High Performance.

Input
T0
115 CONFIDENTIAL

Blackbox
T1 ­ T0 ~ 1 second vs
T1 ­ T0 <= 2 seconds !!

Output
T1
Real-time != Fast

When Murphy meets the law of large numbers.
There's no such thing as "half water-proof".

Program

Runs fine 99% of the time Probability of a crash : 1%

99%

99% x 99%

99% x 99% x 99%

...

99% ^ N

...

At infinity, a program that SOMETIMES crashes is equivalent to a program that ALWAYS crashes!
116 CONFIDENTIAL

ZERO !

Key Design Points
Things to consider when writing code.  Fault Tolerancy
 Rigorous code.  Flawless error handling.  Unit tests  Degraded Mode?
 Algorithm Complexity : What's your worst case?
 Computing Time : Is it deterministic?  Parallelism &Concurrency : Context Switching, Deadlocks, Race Condition...  Memory Allocation : Static vs Dynamic
 Environment
 Background jobs, RAM, CPUs, Parasites, Hardware Failures...
117 CONFIDENTIAL

The Avalanche Project
118 CONFIDENTIAL

High Frequency Trading vs Traffic Classification
The Wolf of Wall Street
Stock Exchange

Historical Database Backtesting
119 CONFIDENTIAL

Quant Server
Strategies

Execution

Portfolio / Risk Management

High Frequency Trading vs Traffic Classification
The Wolf of Wall Street

Stock Exchange

Resolvers

Log Aggregation
Historical Database
Backtesting
ML Tra in in g
120 CONFIDENTIAL

Quant Server

Execution

Strategies
Models &Classifiers

Blocking Whitelisting Domain Tagging

Portfolio / Risk Management

Predicted Impact on Users

What is Avalanche?
Overview and Technical Details.  Open source project :
 http://github.com/ThibaultReuille/avalanche
 "Real-time" data processing framework.  Modular, parallel and distributed design.  Written with Python and ZeroMQ.  Platform for some OpenDNS models (Private) :
 https://github.office.opendns.com/Research/avalanche-opendns  NLP-Rank  DNS Tunnelling  Talos DGAclassifier and others (In progress)
121 CONFIDENTIAL

Avalanche Design
Divide and Conquer
Input Queue
ZeroMQ Socket
122 CONFIDENTIAL

NODE (Plugin)

Output Queue
ZeroMQ Socket

Avalanche Node
Plugin Template Code
123 CONFIDENTIAL

Avalanche Graph
Pipeline Definition

Plugin1

Plugin2

124 CONFIDENTIAL

Avalanche Pipeline
Divide and Conquer
Plugin
125 CONFIDENTIAL

Plugin Rack

Avalanche Rack
Plugin Rack Definition
126 CONFIDENTIAL

Run Avalanche
$ ./ a v a l a n c h e.p y p a t h / t o / m y _ p i p el i n e.j s o n 10 0 0 0
 Things you get for free :
 Modularity.  Multi-Threading.  Alibrary of plugins ready-to-use.  Reusability &collaboration.  An insanely fast messaging system.
127 CONFIDENTIAL

The Research Pipeline
128 CONFIDENTIAL

Avalanche Cluster
High Level View

Resolvers

Amazon S3

Avalanche

IntelDB

129 CONFIDENTIAL

Avalanche Cluster
· 8 Amazon instances · Master distributes work
· Round-robin · "Fire and forget" · Slaves process the chunks · 4 Avalanche pipelines · Results are centralized
130 CONFIDENTIAL

Master Slave Slave Slave Slave Slave Slave Slave Slave
Digest

Cluster Management with Boto &Fabric
h t t p s:/ / git h u b .o ffice .o p e n d n s.co m / Re se a rch / a va la n ch e -se rvice s
131 CONFIDENTIAL

Traffic Speed vs Avalanche Pipeline
Numbers don't lie.

Queries / Chunk Noon (UTC) Midnight (UTC) Queries / Second

Authlogs (AMS.m1) 564 752 412 050 Authlogs (AMS.m1)

Querylogs (AMS.m1) 6 147 997 3 315 157 Querylogs (AMS.m1)

Noon (UTC) Midnight (UTC)

941.25 686.75

10246.66 5525.26

 Avalanche Benchmark :
 ~30000 messages per second  1 message every 33 microseconds.  3 times faster than AMS.m1 query logs at peak time.

132 CONFIDENTIAL

ZeroMQ Performance Tests
Standard Linux Kernel

Real-Time Linux Kernel

Source: http://zeromq.org/results:rt-tests-v031 133 CONFIDENTIAL

Slave Processing Pipeline

Master

Streamer

Unifier

Domain Tagger

Matcher

GeoIP

NLP-Rank Capacitor

134 CONFIDENTIAL

VirusTotal, Investigate

DNS Tunnelling Capacitor
Hourly Digest Miner Script

TalosDGA Capacitor

Filtering

IntelDB

135 CONFIDENTIAL

136 CONFIDENTIAL

Live Demo
137 CONFIDENTIAL

Authlogs &Querylog Replaying

S3

Watcher

Streamer

Builtin

Builtin

138 CONFIDENTIAL

Workshop : Simple Fast-Flux Detection Pipeline

Log Replayer
Builtin

Random Sampler
Builtin

Fast-Flux Detection
Custom

139 CONFIDENTIAL

What's next?
140 CONFIDENTIAL

Future Work
 More models!  Cython or rewrite core in C/C++
 Optimize model performance
 Use GPU grids :
 OpenCL, GPU cluster
 Hackathon Idea :
 Avalanche at the DNS resolver level
 More log visibility
 Querylogs  Proxy logs
141 CONFIDENTIAL

Blog Post is Live.
142 CONFIDENTIAL

Introduction to Min e r/ Gra p h Oriented Data Mining
143 CONFIDENTIAL

Interesting Data Sources ...

 Domain  URL  IP  ASN  Hash  Email  Regex

SEED

144 CONFIDENTIAL

Investigate

Scores, Co-occurrences ...

Maxmind GeoIP

Country Info, ASNs ...

VirusTotal

Malware URLs, Vendor Info...

Shodan
HTTP ...

Banner Info ...
HTMLContent, Certificate, Links ...

Data Modeling Example

Regex

Domain

Domai n

Email

URL

Country

IP

ASN

Hash

145 CONFIDENTIAL

Knowledge
 Semantic Networks / Property Graph  Node =Concept, Edge =Relationship  Model of the Information  Ontology : Model of the Model
146 CONFIDENTIAL

Data Exploration : Breadth First Traversal
147 CONFIDENTIAL

Multi-Threaded Breadth First Traversal

A

B

C

B

C

148 CONFIDENTIAL

A

B

C

Lambda Mining
149 CONFIDENTIAL

 Functional Graph Exploration
 Rule Based / Thresholds / Topology based ...
 Profiles for specific use cases
 Automated Smart Data Mining

NLPRa n k/ Ph ish in g Detection
150 CONFIDENTIAL

Dat a Science Net work Securit y Big Security DataDNS Traffic:
~70B DNS requests per day HTTP Traffic:
~10.1Mrequests per day Daily Tasks:
-Detection Algorithms, Security Data Analysis, Distributed Systems, Big Data Engineering, Data Viz
151 CONFIDENTIAL

Purpose:
Overview of our new model NLPRank: -Fraud detection system using NLP techniques
and traffic features to identify domainsquatting/brand spoofing in DNS/HTTP (a technique commonly used by phishing and APT CnCs).
152 CONFIDENTIAL

#TeamPyt hon

NLP/Dat a Science: -NLTK

This image cannot currently be displayed.

-Scikit-Learn

-Gensim

Web Scraping:

-Beautiful Soup

-LXML

153 CONFIDENTIAL

Syst em Origins
-OpenDNS Labs has detection models for commodity malware (ex. Botnet, Fast-Flux, DGA) need a model to detect targeted attacks
-Assigned to analyze DarkHotel data set
Question: How to detect "evil" in DNS records using lexical features of FQDN and validat e results?
154 CONFIDENTIAL

Human-Comput er Int eract ion
Targeted Attacks: From a psychological perspective, if you were a high-profile exec for company what kind of links would you click on? What are your interests?
Commodity Phishing: Same psychology Topics of interest: -$$$, Bank Account/CCs, Financial -News -Security/Software updates -Social Network
155 CONFIDENTIAL

156 CONFIDENTIAL

Heurist ic #1- ASN Filt ering
157 CONFIDENTIAL

ASN Overview
-Autonomous System Number is basically like your neigborhood/zipcode on the internet -Associated with Internet Service Provider -Set of routers operating under specific or multiple routing protocol -Domains exhibiting fraudulent behavior are observed to be hosted on ASN's that are unassociated with the company they're spoofing
158 CONFIDENTIAL

Examples
Expect a FQDN containing "adobe" to be associated with Adobe's ASN (ex. ASNs 14365, 44786, etc.), or FQDN containing "java" and advertising an "update" be associated with Oracle ASN (ex. 41900, 1215, etc.) So why t hen? APT Example (Carbanak):
-adobe-update[.]net - ASN 44050, PIN-AS Petersberg Internet Network LLC in Russia -update-java[.]net - ASN 44050, PIN-AS Petersberg Internet Network LLC in Russia Commodit y Phishing Examples: Domain: securitycheck.paypal.com ASN 20013, CYRUSONE -CyrusOne LLC, US Domains: serviceupdate-paypal.com, updatesecurity-paypal.com,
159 CONFIDENTIAL
ASN 32400 - Hostway Services, Inc.,US

The Usual Suspect s..
1. CyrusOne LLC,US 2. Unified Layer,US 3. OVH OVH SAS,FR 4. GoDaddy.com, LLC,US 5. HostDime.com, Inc.,US 6. SoftLayer Technologies Inc. 7. HOSTINGER-AS Hostinger International
Limited,LT 8. HETZNER-AS Hetzner Online AG,DE 9. Liquid Web, Inc.,US 10.CLOUDIE-AS-AP Cloudie Limited-AS
number,HK
160 CONFIDENTIAL

More Normalized...
1. OBTELECOM-NSK OOO Ob-Telecom, RU 2. GVO - Global Virtual Opportunities, US 3. CONFLUENCE-NETWORK-INC - Confluence Networks Inc, VG 4. CYRUSONE - CyrusOne LLC, US 5. VFMNL- AS Verotel International B.V., NL 6. NEOLABS- AS Neolabs Ltd., KZ 7. DEEPMEDIA- AS Deep Media / V.A.J. Bruijnes (sole proprietorship),NL 8. NEUSTAR- AS6 - NeuStar, Inc., US 9. VERISIGN- ILG1 - VeriSign Infrastructure & Operations, US 10. CIA- AS Bucan Holdings Pty Ltd, AU
161 CONFIDENTIAL

ASN Filt er + Whit elist ing
1st step to take a big chunk out of the traffic, because text processing is computationally intensive -Do a lot of ASN Analysis with other models (Dhia Mahjoub, PhDGraph Theory) Authlogs come in -> Enricher node will look up ASN and include logs
Create mapping of Brand Names to their legitimate ASNs Lookup domains/IPs as they come in
162 CONFIDENTIAL

Heurist ic #2 - Defining Malicious Language Wit hin FQDNs
163 CONFIDENTIAL

Building Int uit ions
-Eyeball Data
-Run basic text metrics on the data, gain intuitions about the data and extract important words/substrings in APT FQDN datasets
-APT domains exhibit similar lexical features to commodity phishing domains
-Important look at word co-occurrences (bigrams, trigrams, etc.)
164 CONFIDENTIAL

Building Int uit ions
-From APT data sets extracted words from dictionary and applied stemming looking at word stats:
Top counts (stemmed): mail, news, soft, serv, updat, game, online, auto, port, host, free, login, link, secur, micro, support, yahoo
Bigram Collocations:
Words that often appear with each other adobe-update update-java[.]com Idea: brandname + ad-action word [.] tld
165 CONFIDENTIAL

Examples
Dark Hotel (Kaspersky):  adobeupdates[.]com  adobeplugs[.]net  adoberegister[.]flashserv[.]net  microsoft-xpupdate[.]com
Carbanak (Kasperksy):  update-java[.]net  adobe-update[.]net
APT 1 Domains (Mandiant):  gmailboxes[.]com  microsoft-update-info[.]com  firefoxupdata[.]com
166 CONFIDENTIAL

NLP on FQDN
-Creating a "malicious language" derived from lexical features of FQDNs from APT/Phishing data sets -Built corpus of domains similar to examples in previous slide -Create custom dictionaries
Brandname Dictionary Ex. google, gmail, paypal, yahoo, bankofamerica,
we llsfa rgo -Custom set of stemmed common malicious words Ex. secur, updat, install, etc.
-Reason for stemming example: updat -> firefoxupdata[.]com (APT1) -Apply Edit-Distance/Automata Theory on substrings to build spam la n gu a ge
167 CONFIDENTIAL

Heurist ic #3- HTML Cont ent Analysis
168 CONFIDENTIAL

Recreat ing Researcher's Mind
When reviewing malicious domains what is typical methodology for review: 1) Visit site in Tor browser 2) Researcher processes information on site, looks for clues, gains summary 3) Makes decision whether site is legit/malicious Specifically for Phishing Sites:
Human-Computer Interaction: What makes people fall for this? Site will be near copy of legitimate site it's intending to spoof How can we automate this process? Can we apply document similarity algorithms?
169 CONFIDENTIAL

Human-Comput er Int eract ion
Examples from Apple Phishing page:
Tit le: Apple GSXLogin Links: https://iforgot.apple.com/cgi-bin/findYourAppleID.cgi?language=US-
EN&app_id=157&s=548-548 https://id.apple.com/IDMSAccount/myAccount.html?appIdKey=45571f444c4f547
116b fd 052461b 0b 3a b 1b c2b 445a 72138157e a 8c5c82fe d 623&a ct io n =re gist e r&la nguage=US-EN Images: <img alt="" src="https://www.chase.com/etc/designs/chasecomhomepage/images/home page_background_1px.jpg"/>
170 CONFIDENTIAL

Ot her Clues:
HTTrack - tool used to clone site
171 CONFIDENTIAL

Preparing The Dat a
-Cleaning the Data -Stripping punctuation, symbols, unnecessary content -Normalizing the data
-Stemming (update, updating, updater updat) Feature Encoding
172 CONFIDENTIAL

Harder t han it seems... -Non-Trivial to extract relevant terms from HTMLdocuments -Dealing with malformed tags -Lose data, dealing with HTMLand JS -Which tags to encode?
-Title -Links -Images Applied basic NLP Algos..but need more samples for training!!
173 CONFIDENTIAL

More Headaches
Legit USAA Sit e: <title>USAAMilitary Home, Life &Auto Insurance | Banking &Investing</title> Many USAA Phishing Sit es: <title>USAAMilitary Home, Life &amp; Auto Insurance | Banking &amp;
Investing</title> USAA Phishing Page: <title>U&#83;&#65;AMi&#108;&#105;&#116;&#97;&#114;y Home, Life &amp; Auto
I&#110;&#115;&#117;&#114;&#97;&#110;&#99;e</title>
174 CONFIDENTIAL

Success Ident ifying All Different Types of At t acks
Success in Training: Detecting: Careto APT Domains Darkhotel/Carbanak/APT1 etc. AJAXHacking Group/Flying Kitten infostealer C&C Operation Pawn Storm Operation Saffron Rose and more...
Success on Live Dat a: Exploit Kit Fast-Flux And new stuff..
175 CONFIDENTIAL

Int erest ing Result s
Carbanak (banking trojan) came out in February:
2015-01-23 14:52:58 -- a96e74b8-b052-4f42-a517d7273d4f13e7
NLPRank High-Risk Results (FQDNs)
cdneu.windows8downloadscdn.com updat e-java.net
176 CONFIDENTIAL

Int erest ing Result s
symant ecupdat es.com
Li Ning From guangdongsheng guangzhoushi Alabama??? Let's investigate all domains associated with that email address...
177 CONFIDENTIAL

21,533 Domains???
crowcasinovip.biz mybestbrand.biz mybestbrands.biz huarenceluewangzhi.com icbczay.com boyinbocai5.com haoyunc3.com bocaiwangzhenqianpingtai.com zuqiubocaiwangzhan7.com weinisirenyulecheng94.com xinquanxunwang244.com dfjdh.com yaojiyulecheng9898.com wanbaoluyulecheng94.com xinpujingyule15.com toabaao.com jinbaiyiyulecheng26.com toubakd.com tiantianleyulecheng61.com wangziyulecheng33.com yezonghuiyulecheng82.com bocwry.com huangguantouzhuwangzhanwangzhi86.com huangguanwangquaomen29.com haiwangxingylc1664.com yinghuangylc727.com bocaiasd.com changjianggjylc.com jinmaylcoiu.com yazhougjylc.com huangguanxin2wang32.com benchixsyl.com zhucecaipiaosongcaijin.com ceoylcdf.com zhucesongcaijindewangzhan62.com aomenduchangyouxiyounaxie30.com mengtekaluoylcb.com guojihuangguanyule40.com huangguantiyupingtai93.com huangguanxianjinwangxinyu37.com aomenduchangpaixing27.com 500wanylcyu.com dajihuiylc686.com ruifengguojiyy.com makeboluoylcb.com jincaigjylc.com xindongfangylc869.com aomenduchangzainali50.com wangshangyulekaihusongcaijin.com huangguanxjwkh.com jinbangylc77.com baijialeqo.com yataigjylc.com baishenggjylcwe.com bocaigongsiqe.com wufagjylc.com moerbenylckk.com bogouylc1663.com huangguandailiwangzhi23.com bojueylcpo.com bocaiwangzhanqe.com taoataao.com bbhunas.com sjzd36.com sjpt63.com bjlkh33.com baijialebishengtouzhujiqiao20.com xijialiansaijifenbang57.com baijialeyule86.com xijiapaiming46.com aomenbaijialechangying76.com baijialeyulepingtai34.com wangshangbaijialekaihusongcaijin76.com ouzhouwudaliansaipaiming53.com wudaliansaitedian39.com baijialekaihusong50caijin17.com baijialeguize52.com zhibobazuqiuzhibo2.com zuqiubifenqiutan88.com dejiasaichengbiao88.com zuqiuba85.com mahuitqzzjw83.com sjzd01.com weixingjianting29.com cwanpp.com xingboyulezaixian86.com mwqpah.com jiankongpingtairuanjian43.com zhenqianyulechengguanwang63.com njdyyytj.com fanheer.com 999coin.com shenganna74.com jackwolfskinsalejp.com zaozhuangcq.com bjl7788.com ruhejiankongshouji2.com aomenduchangyingqianliao75.com shoujidingweichaxunruanjian12.com shoujijiantingshebei46.com aomen916.com shoujikajiantingqi77.com zhenqianyouxipaixing2.com rysevw.com wanzhenqianwangzhan36.com vrcgw.com
178 CONFIDENTIAL
feilvbinshengannayulecheng20.com duchangyingqianmijue81.com zzvqo.com

179 CONFIDENTIAL

Sakula/Threat Connect Report
180 CONFIDENTIAL

More BlueCross/Premera
Found t hese: adobeupdated[.]com gmail-msg[.]com intel-update[.]com vmwaresupportcenter[.]info Didn't cat ch t hese but definit ely capable: prennera[.]com we11point[.]com.
181 CONFIDENTIAL

Int erest ing Result s
Way to filter into parked/suspended pages?? 1. Parked Pages a. Interesting patterns among terms of parked pages, examples: i. www[.]iniciar-sesion-gmail[.]com 1. Important Terms (stemmed) : fjccheck1catchexcept, click, trydocumentcooki, proceed ii. ww2.content.archiveofourown.orgamazon.com 1. Important Terms (stemmed) : fjccheck1catchexcept, click, trydocumentcooki, proceed iii. android.clients.google.com.www.smartbrosettings.net, 1. Important Terms (stemmed) : fjccheck1catchexcept, click, trydocumentcooki, proceed 2. Suspended Pages a. "Suspend" relayed as most important terms, example: i. FQDN: xbmcwindows[.]com 1. Important Terms: ' suspend' ,'arial', normal, solid'
182 CONFIDENTIAL

183 CONFIDENTIAL

184 CONFIDENTIAL

Combining Det ect ion Models
185 CONFIDENTIAL

186 CONFIDENTIAL

Traffic for 2nso3s.com
187 CONFIDENTIAL

Vinny Lariza

Dhia Mahjoub Kevin Bottomley

188 CONFIDENTIAL

How Phisht ank Works
Submit --------------------> Vote! -------------> Categorize -----------------> Filter
189 CONFIDENTIAL

Ident ifying Problem
-PhishTank has Cult Following in Security Community - People always asking about it conferences, security parties, LinkedIn etc.
-Identifying spoofed brands of phishing URL's in real-time / as they are submitted is necessary for reducing the amount of false positives in the PhishTank feed
-Reducing the amount of time from submission to approval -IMO: Phishtank= giant training set for sec data scientists
190 CONFIDENTIAL

Examples of False Posit ives
191 CONFIDENTIAL

Hypot hesis:
-Using IR/NLP techniques to gain a summary of the web page is a problem that has already been solved algorithmically ex. search
-Simila r to wa y Netflix recommends movies ba sed on user history, ca n we recommend what brand name the phish is by content of the page?
-Lets apply these same techniques to identify commodity phishing pages Hypot hesis: We can ident ify Phishing pages by using IR/Topic
Modeling t echniques, and aut o-label Phisht ank submissions as t hey come in
192 CONFIDENTIAL

193 CONFIDENTIAL

Topic Modeling
-Methods for automatically organizing, understanding, searching, and summarizing large electronic archives. 1. Discover the hidden themes of collection.
2. Annotate the documents according to themes. 3. Use annotations to organize, summarize, search, make predictions. -Great for building recommender systems -Used as features for a classifier
194 CONFIDENTIAL

Building Corpus
-Built Corpus of HTMLContent of Phishing pages, ex. WellsFargo, Paypal, Amazon, Apple, Bank of America, from Phishtank Only Focused on Big Name Brands - Data Collection, although at times tedious, become very intimate with the data -See all kinds of variations of Phishes 90s Paypal vs. 2000s Paypal vs. 2015 Paypal Christian Mingle Phishing?
195 CONFIDENTIAL

TF-IDF Input: Word Count Vector From Terms in HTMLDocument (Query), Word Count Matrix over a collection (Corpus) TF-IDF - Show how important word is to a collection Balance between: Frequency of Term and Rarity over all documents Term-Frequency: # of times term t, appears in the document d -Term Relevance does not increase proportional with term-frequency Inverse-Document Frequency: the # of documents that contain term t TFIDF - tf-weight * idf-weight
TFIDF - Increases with number of occurrences within a document, and rarity of term over all documents
196 CONFIDENTIAL

LSA/LSI
Latent Semantic Analysis: analyzing documents to find underlying concepts/meaning from them (clustering algorithm) Uses singular value decomposition (reduce dimensionality) to identify patterns in the relationships between the terms and concepts contained in an unstructured collection of text. Hard because of variations in English language, synonyms, ambiguities some words have different meanings when used in context -Uses Bag of Words Model (Ordering doesn't matter) -Using n-grams can help identify associations using co-occurrences Helps with normalization of data Bigrams: San Francisco -> san_francisco, Sign In -> sign_in
197 CONFIDENTIAL

LSA/LSI
Input: X, count matrix (or TFIDF), where m (rows) is number of terms, and n is number of documents
When we do decomposition, have to pick a value k, which represents the number of topics/concepts
Process: Decompose Xinto 3 matrices, U, S, V(T) U=m x k matrix, where m =terms, k =concepts S=k x k diagonal matrix. Elements are amount of variation captured from each concept. V(transpose)=k x n matrix, where k=concepts, n=documents
198 CONFIDENTIAL

LSA/LSI Example
In this example LSAhas been run, 9 - titles plotted with blue squares, 11 index words in red squares, 3 dimensions (topics)- (1DDocs correlates w/ length, Terms correlates w/ # times w across all docs)
Blue Cluster - Contain T7, T9 - Real-estate
Green Cluster- T2, T4, T5, T8 - Value Investing
Red Cluster - T1, T4 - Stock Market
Outlier - T6
1. The Neatest Little Guide to Stock Market Investing 2. Investing For Dummies, 4th Edition 3. The Little Book of Common Sense Investing: The Only Way to Guarantee
Your Fair Share of Stock Market Returns 199 CONFIDENTIAL 1. The Little Book of Value Investing

Cosine Dist ance
Word counts of the documents (HTMLContent) form vectors Cosine is normalized dot product of the vectors Compute Cosine Distance from the components of the 2 vectors
i. Cosine Similarity to Phishing Pages in the Corpus 1. Transform terms of HTMLdocument into vectors and Corpus (Phishing) documents to vectors 2. Find angle (Cosine Similarity) between input HTMLdocument term vector and Corpus documents 3. Return ranking of the sites with the most similar HTML Documents in Corpus
200 CONFIDENTIAL

Cosine Dist ance b/t Vect ors
201 CONFIDENTIAL

Aut o-Labeling Brand Result s:
Sample Output (Document Handle, Document (Cosine) Similarity Score, Brand/FQDN of URL): Input URL/Query: WellsFargo/fitac.com.tr.html (61, 0.99899197) WellsFargo/wellsfargo.com.html (62, 0.99890876) WellsFargo/usam.edu.sv.html (60, 0.9984659) WellsFargo/school76.irkutsk.ru.html (59, 0.98146677) WellsFargo/theweddingcollection.gg.html (63, 0.97453147) WellsFargo/exin.ba.html Input URL/Query: Chase/www.nutrem.mx.html (76, 0.98566723) Chase/bororooil.com.html (75, 0.92363083) Chase/chaseonline.chase.com.html (27, 0.92042124) BankOfAmerica/createcrafts.ph.html (25, 0.92009199) BankOfAmerica/actautismoman.com (74, 0.91776139) Chase/www.zac.or.tz.html
202 CONFIDENTIAL

Aut o-Labeling Brand Result s:
Sample of Brand Names from Incoming Phishtank Stream 467 Total Samples - 78 in Corpus, 389 Test 353 hitting as Top recommendation, 18 out of remaining 36 in Top 5 Still along the same Topic/Theme, ex. (Bank/Finance, Mail, Social) 371 / 389 (With additional weighting tests, work in progress) Some Brands have higher accuracy than others (Wells Fargo, BofA)
203 CONFIDENTIAL

Aut o-Labeling Brand Result s:
ACCURACY: 0.989112354453 PRECISION 0.907455012853 RECALL 0.907455012853 SENSITIVIY0.907455012853 SPECIFICTY0.994215938303 TPR 0.907455012853 FPR 0.00578406169666 X, Y(Best 0,1) (0.005784061696658127, 0.9074550128534704) BALANCED F1 MEASURE 0.907455012853
204 CONFIDENTIAL

Beyond Phisht ank
-DNS data is not the ideal match for this data...HTTP traffic much better fit Why? When doing lookups, landing on index page, most often phishing page is not on index page -Within DNS, necessary to build crawler Question: But there's so much traffic, are we going to do GET request for every URL???
205 CONFIDENTIAL

OpenDNSInt elligent Proxy
What is the Intelligent Proxy? -Awesome Team!!
-Man in the Middle -Greylisting -Next step in OpenDNS Security
206 CONFIDENTIAL

Dedicat ed vs. Compromised Examples
Dedicat ed: update-java[.]net, adobe-update[.]net, http://wellsinfo.net/login Compromised:
Domain: wwelllssssfffarrgo.webzdarma.cz.html h t t p :/ / d a n d ra gh ice scu .ro / d b o x/ d p b x/ d p b x/ http://school76.irkutsk.ru/language/Wellsfargo/online.htm http://createcrafts.ph/bankofamerica.com.update.login.in.info/de17792ab89754c6b0a58d767a6985f
c/ http://www.kingdomhome.com.au/wp-admin/wellsfargo.zip/wellsfargo-online.server/details.html http://wellsfargoonline.pfwv.com.br/wellsfargo/ http://www.cityroo.com/sarasoa/wellsfargo/wellsfargo-online.php http://wellsfargo.com.billing.account.updatemyaccount.wellsfrago.com.onlineaccounts.upgrade.onl
ine.billing.account.update.nlineaccounts.upgrade.online.billing.account.update.kowafdfsfs.net http://comosecuraladiabetes.com/wp-admin/js/well.htm
207 CONFIDENTIAL

- Acquiring Data
URL Feed (HTTP/PT )

- Filtering Whitelist

Counts

TF-IDF

of words

on

page Latent Semantic

Analysis

Forms Check
Top N Similar Documents

-NLP ASN Filter
Fetch Page Content

-Output
Popularity Check
Editdistance/Regex/Cust om Dictionary Block List Auto-Tag Brand/ Topic In Phishtank

Compare Cosine Similarity
208 CONFIDENTIAL
To Corpus

Build Training Sets. Periodically Retrain

Email Daily Results

Conclusion
§ Agile Research: Building, Testing, Tuning, Iterating § Different Algorithms, LSAas Feature § Topic Modeling on More Content (LDA, seasons) § More Features (SimHashing, HTMLcontent encoding) § Data Collection/Building Corpus § Filtering FPs § Spark Streaming! § United States ODNS=-1009US0; 62/167,178
209 CONFIDENTIAL

QUESTIONS?

@jmoconnor415 jeremiah@opendns.com jeoconno@cisco.com

@Thibault Reuille thibault@opendns.com treuille@cisco.com

210 CONFIDENTIAL

