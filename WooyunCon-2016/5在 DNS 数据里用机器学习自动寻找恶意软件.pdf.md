What can you get from 100 billion DNS queries, each day, in real time? 1000DNS

DNSC&C How Data Science and Machine Learning Help to Discover Botnets with DNS: Moving Beyond Honeypots and Reverse Engineering
Hongliang Liu, Senior Staff Data Scientist, Nominum Inc. Wooyun Summit 2016, Beijing, China

"You might say that DNS is in our DNA. Nominum invented DNS, has written 90% of the world's DNS code, and was the first to scale, secure, and leverage DNS to deliver a whole new set of services. We are passionate about great Internet experience, high quality code, and straightforward approaches to solving complex provider challenges. Now we have harnessed DNS to allow providers to deliver extraordinary value to their subscribers."
https://nominum.com/company/

Data Science team at Nominum

Ali

Paul and Yuriy

Yohai

Thanh

Mikael Alexey
Hongliang

About me
· A PhD degree in physics, plus two bachelor degrees in physics and computer science. · Not a big deal.
· No degree in security research. · Not a big deal either.
· Building machine learning on security · Have detected and blocked multiple botnets using data science.
· Follow me @phunter_lau on weibo.

Photo courtesy: Danny Dong Photography

Can't wait!
Outline

· When we talk about threat intelligence, what do we talk about?

· When we see threat, what should we do? · Too much, that is too much information, meow~
· Intelligent machines are here to help

Should be an amazing
talk!

· Intelligent Anomaly Detection, Correlation map, DRS... with real life examples

· So your machines want to replace human? or, we work together?

My sister @dudulee 's two cats, Pogo and Niba

When we talk about Threat Intelligence, what does it mean?

What I think I do

What senior white hats think I do

What I really do

Source: Movie "The Matrix"

Source: http://tech.sina.com.cn/i/2013-07-13/07368536046.shtml

Source: http://kirill9876.blogspot.com/

Threat Intelligence != visualization
· "Hadouken" on a world map: pew, pew, pew~ · You know who I am talking about.
· Just don't spend much of your time on making a "hadouken" system · even if your boss really loves it · even if your boss thinks it is the future of the company. · You data are much more valuable than that!

http://fishki.net/1481859-hadoukening-ili-vsyo-ne-tak-uzh-i-slozhno-no-jeffektno.html

Threat Intelligence != Just see it
· Every company has/wants an anomaly detection.
· Yes, I believe you see these too, but so what? what can you do about them?
· You said "Big data"? please, no bullsh*t! · "Big data" stays in 2012! · "Big data" is "garbage in garbage out"

DNS traffic for 0.000001 second

DNS traffic for another 0.000001 second

What is the problem with Threat Intelligence?
· Finding new threats are too hard and human are not scalable. · Too much information, too little time · Too few security researchers · Can't copy-n-paste human · Too....much under paid (well, this talk can't solve this problem)

New threat is needle in haystacks?
· Nope! · Because you look too close.

"The closer you look...the less you will see." -- "Now you see me" the movie

What is in this talk today

Threat Intelligence is too general. Let's take DNS traffic for example

Threat Intelligence
Source https://baldscientist.wordpress.com/2013/04/03/why-the-science-newsbite-is-just-the-tip-of-the-iceberg/

In a higher dimension world
· If we have ... 100 Billion DNS queries per day in real time?
· If we know ... some domain names are new and had never been seen before?
· If we know ... the correlation between any two domain names?
· If we know ... the connection among any client IPs, name servers, server IPs at any time?

Core idea in this talk is, how to do ...
 Dimension reduction attack

Data, all about data
· At Nominum, we receive and in real time process 100 Billion DNS records per day from our global partner Internet Service Providers. · From Nominum Vantio CacheServe, anonymized · Sampled from 1.5 trillion DNS queries served per day
· Data volume advantage or disadvantage · Advantage: no need to wait for honeypot · Disadvantage: If we have 100 billions records per day (~ 1 M per second), what should we do? Just hire more security analysts? · Or an intelligent way?

Source http://www.stuckinplastic.com/2015/11/storytelling/

Intelligent anomaly detection
· Anomaly detection (AD): an intelligent machine telling if a domain name looks not normal in real time · Never existed before? · Too many weird queries? · Too many subdomains? · ......
· Engineering challenge: how to tell, in real time and deterministically, if a domain never existed in the previous months where each day had 100 B queries?

Anomaly Detection Web Interface screenshot

Correlation map: a learning machine for any domain names
· Representation learning by artificial neural network from query sequence · Similar technique as in Google's AlphaGo (sorry for the marketing term)
· Introduce algebra to domain names for pair-wise similarity · e.g. "twujgjxafrpjgcan.pw" x "yypkowmsapnoco.org" = 0.99 · for any two domains, even if just two queries! · No need any a priori knowledge, nor name similarity! · No need any feature about domain name itself, like randomness.
· Pair-wise similarity is the key to the new world.

Correlation map Interface screenshot

Domain Reputation System (DRS)
· A giant dynamic graph of IP, name server, CNAME, registration email, security list, correlated names etc · Each entity is no longer individual but a graph connecting everything · Dynamic update. · Not just a graph interface or "link analysis tool" or "eyecandy" · It is a backend system serving the decision engine. · Hundreds of millions nodes, dozens of billions edges.

DRS Interface screenshot

Shut up! Talk is cheap...

Botnet

Source: http://jajodia-saket.sjbn.co/2012/02/sneak-peek-into-flipkart-office-in-bangalore/

Case study 1: rediscover known botnet C&C

· Identifying C&C clusters for dyre, suppobox, necurs, qaksbot, gozi.....in real time and high precision, without a priori knowledge (a.k.a DGA algorithms are not needed).
· Necurs and Bedep for example
· Necurs: silent on early June and reappeared later
· "old but not obsolete."
· Bedep: a complicated DGA using currency exchange
· Hard to replay with known DGA algorithm

Source: https://www.linkedin.com/pulse/old-obsolete-jamie-brown

Tech details for case 1: Necurs didn't die!

All unique anomaly domain names count, not just Necurs

· Necurs DGA renew every 4 days from June 1st.
· 2048 C&C names for each round per variant, for recovering its p2p connections.
· 5 different variants are seen in the correlation map clusters for the full day.
· Also, with Locky the ransomware reappearing on June 22nd.
· We know the exactly moment when you get back, welcome :-)

June 1st

June 4th

June 8th

June 12th

Necurs variant 1

Necurs variant 4

Bedep
Gozi variant 1
Necurs variant 3

Necurs variant 2
Suppobox new variant

Gozi variant 2

Necurs variant 5

· 5 variants of Necurs and Bedep appeared at the same time.
· Sizes of Necurs clusters depend on traffic
· Bedep has around 100-200 domains each cluster
· all .com domains
· Uses currency exchange rate as DGA seeds

Case study 2: expanding threat list
· Just a few names are listed on security lists? · No problem with DRS!
· Label propagation algorithm · Fake software update sites for example.
· Only a few names on the security list · e.g. sunbelt border patrol list
· The same IPs of these names also link to new suspicious names.

Case study 3: evolution of a botnet
· A fast evolving botnet having new domains every new hour · Like bacteria: old domains expire when new domains are added to the same cluster, within hours! · Wait for human reverse engineering: are you sure you can do it within one hour, and 24 hours per day?
· Gozi daily variant for example.

This is an animation!

Tech details for case 3: evolution of a botnet within hours

05:00

06:00

11:00

12:00

· Red: newly added names
· Aqua: old names from last snapshot

Case study 4: you think fast flux is smart?
· Fast flux: C&C domains switching in a set of C&C IPs · A so called "smart way" trying to fool security researchers.
· A fast flux botnet in DRS looks like... · A dual subgraph, detectable by graph algorithms · Freedom for security researchers! · DRS knows all the history in the graph.

Case study 5: do you trust VirusTotal about "com--vir.us"?
"I am virus", such an honest phishing domain!

DRS report for "com--vir.us." as on 2016-06-15

Virus Total report for "com--vir.us." as on 2016-06-15

Case study 5: do you trust VirusTotal about "com--vir.us"
· Go get all subdomains · em, us.google.com--vir.us. more intersting
· Go dig further?

Case study 5: do you trust VirusTotal about "com--vir.us"
· not just us.google.com--vir.us · br.samsung.com--vir.us · br.google.com--vir.us · mx.google.com--vir.us
· Surely, one can check registration email from WHOIS!
· That is how a white hat can research on phishing domains with DRS · I can play with it for hours!

Case study 5: do you trust VirusTotal about "com--vir.us"
· All about timing! · This name later on appears on virus total on June 20th 2016, 5 days later, by BitDefender. · You know what 5 days mean in security. · "5 days" can change an original new discovery to "meh, me too".

Virus Total report for "com--vir.us." as on 2016-06-20

· DRS can see it at the first moment.

Case study 6: DRS + correlation map
· Correlation map only contains the "client IP - domains" graph · With DRS, a more comprehensive structure of the full botnet
can be observed. · Too much to visualize in a single graph for human consumption · We use community detection algorithm to find it and block this group. · This system is primarily for full auto machine detection. · It is Necurs, by the way.

Now you see me

Raw RT Data (Kafka)

· It is the time to review.
· Workflow from 100 Billion DNS queries to emerging threats
· How a full automated process discovers threats in real time.

Raw Data Storage

RT Scanner

AD List

AD
Aggregated Historical Info

NOM Rank
LSD

Clustering
Correlation Extraction

Model Data Prep.
Corr
RT RSD Detection

Correl. Models Corr
Black & White List

Corr Models

API

Actionable items for customer Confidence column

Customer policies

Feature Pool

DRS

Product

Data Mining

High level review of key tech: intelligent anomaly detection

· A great and intelligent anomaly detection needs:
· Many features
· smart scoring/ranking functions
· A priori knowledge injection
· To be very sensitive, even if just a single DNS query.
· U.S Patent App. No. 14/937,678

DSN query type as an important feature for detecting multiple threats

MX query spike gives spam bots, yeah!

A new tricky amplification attack
using TXT query

ANY query spike is amplification attack

High level review of key tech: correlation map

· A machine learning technique for learning the distributed representation of each domain name.

· Learning to represent in the "machine - domain" bipartite graph

· Inspired by language embedding, e.g. word2vec (see reference)

· Train and serve on a 2x14 core Intel Xeon CPU + 2x nVidia Titan X GPU machine.

· We are a small team, you know.

· Written in C and Python.

· U.S Patent App. No. 14/937,616

Spoiler alert: some equations in the next two pages, apology in advance.

Source https://www.tensorflow.org/versions/r0.9/tutorials/word2vec/index.html

How to represent the correlation from a sentence?



 









Huffman encoding



X

X

Optimization target p(c|w) = p(wi|w) = p(""|w)

Xk Loss function with negative sampling log (vwTc · vw) + Ewi  Pn(f )[log (
i=1

vwTc · vw)]

       

[0.010.020.11......,0.10] [0.170.120.14......,0.09] [0.200.030.13......,0.06] [0.190.110.03......,0.17] [0.110.050.21......,0.05] [0.050.170.07......,0.02] [0.020.010.03......,0.08] [0.070.120.23......,0.06]

How to represent the correlation from DNS sequence?

vsmeyjndlnvgr.ru google.com botnet123.info

jdlvcjhp.xyz amrdojxap.work twitter.com

twitter.com

Huffman encoding

fngbnwgf.click

X

X

Optimization target p(c|w) = p(wi|w) = p("fngbnwgf.click00|w)

Xk Loss function with negative sampling log (vwTc · vw) + Ewi  Pn(f )[log ( vwTc · vw)]

i=1

vsmeyjndlnvgr.ru google.com botnet123.info jdlvcjhp.xyz amrdojxap.work

[0.010.020.11......,0.10] [0.170.120.14......,0.09] [0.200.030.13......,0.06] [0.190.110.03......,0.17] [0.110.050.21......,0.05] [0.070.120.13......,0.09]

How to calculate correlation? The algebra is as simple as dot product
"vsmeyjndlnvgr.ru" x "jdlvcjhp.xyz" =  [0.010.020.11......,0.10]·[0.190.110.03......,0.17] = 0.99

Why learning representation for correlation?
· Representation learning converts the graph walkthrough to simple algebra: the dot product, a.k.a cosine(theta)
· "twujgjxafrpjgcan.pw" x "yypkowmsapnoco.org" = 0.99
· Yeah, all domain names become calculable! · even if only 2 queries! · No string feature needed!
· All your botnet C&C names belong to me!

A predicted Locky C&C domain names on May 16th
The most correlated names on the same day

· When have pair-wise correlation for all names, cluster all names from anomaly detection, we will have botnets!
· Necurs is here!
· Bedep, yeah!
· more welcomed!
· Density peak clustering + manifold learning (SNE) for visualizing in 2D.

High level review of key tech: DRS
· A dynamic graph model · Hundreds of millions of nodes, dozens of billions of edges · A giant graph database with caching layer
· Machine + human consumption · Backend connecting correlation map, AD and other decision engines, supporting automated decision making. · Automatic detection and blocking. · Front-end visualization as a convenient tool for human analyst
· U.S Patent App. No. 14/937,699

A list of many other things from DNS data
· NomRank: ranking every domain names beyond Alexa Rank · IoT, machine to machine, botnet traffic etc
· Discovering DNS tunneling · Can be associated with possible APT attacks
· Recategorizing pornography websites: parental control · Many many others

The sky is not your limit. Your imagination is.
Source https://pixabay.com/en/cat-sky-animal-506126/

Bonus: Locky the ransomware
· Locky ransomware's unique C&C signatures
· 12 names each two days · a list of known TLDs · We can guess the Locky DGA seed from the clusters. · Locky has a flaw of DGA algorithm · Predict future C&C and block all of them · Good lesson to Locky creator: don't skip math courses in college, otherwise you will learn it in a hard way.

Locky was detected by DRS too
Domain reputation system backend output screenshot

10/10 star malicious

What we do after detecting botnet? just sinkhole? no...
· We block them all. Yes, we can! · Deploy to Nominum's N2 ThreatAvert GIX block list in near real time
· ISPs/companies using ThreatAvert can have full protection · Queries to C&C names return NXDOMAIN · Can inform subscribers/endusers about their infection using N2 Reach · To know more, please go to https://nominum.com/product/vantio-threatavert/

So you want to replace security researchers?
· Your "intelligent machines" are so cool, so no more jobs for we human security researchers, right?
· Automation: Friend, not Foe. · Intelligent machines are yet another tools for fighting against botnet and malware.
http://readingfromtheattic365.blogspot.ru/ 2012/07/automation-friend-not-foe.html

How it works with honeypot and reverse engineering

· Information exchange with honeypot
· honeypots as seeds/ground truth for correlation map/DRS input
· correlation map/DRS request specific honeypots
· A security researcher has 100 binaries to reverse engineer, which one to start first?
· From DNS data, we see large clusters with many client IPs and huge impact to the global, let's start with this one.

Honeypot Reverse engineering

Machine intelligence

Source http://www.askamanager.org/2015/03/weekend-free-for-all-march-28-29-2015.html

How do we collaborate?
· You don't want to build another anomaly detection, or DRS or correlation map for yourself · It is very much work, too many pitfalls there.
· We might later on have API/webUI for our white hat friends. · AD, DRS, correlation map etc
· We might build models for you if we share data with us. · Please find our contact information in a later slide.
· Or ask me for a business card.

Source https://www.pinterest.com/pin/363102788678432850/

Recap: what does "Threat Intelligence" mean to us?

Recap: what does "Threat Intelligence" mean to us?

· Threat Intelligence is not just fancy visualization.
· Threat Intelligence doesn't stop at anomaly detection.
· Gear up Threat Intelligence with machine automation
· Intelligent machines can discover the underlying rules for we human.
· As an instance of Information Retrieving (IR): more automation, more condensed information for human consumption.

DRS

AD

NomRank

CorrMap

Model-K

Model-N

Source http://www.epiccomicast.com/2014/07/27/ecc-017-iron-man-3/

Takeaways: 3 things
· Threat Intelligence needs intelligent machines! · Data science with DNS data for example
· Cool new tools with DNS data and machine learning · Beyond honeypot and reverse engineering · Gear up and add another dimension for fighting against malware, with machine intelligence
· Cross fire with honeypot and reverse engineering · Possible sharing of the data, model and API · Information exchange with honeypot and reverse engineering.

Twitter: @AndrewYNg

Patents mentioned in this talk
· Analyzing DNS Requests for Anomaly Detection. U.S Patent App. No. 14/937,678 · DNS-Based Ranking of Domain Names. U.S Patent App. No. 14/937,656 · System for Domain Reputation Scoring. U.S Patent App. No. 14/937,699 · System for Correlation of Domain Names. U.S Patent App. No. 14/937,616

Reference
· M. Antonakakis, R. Perdisci, D. Dagon, W. Lee, and N. Feamster. "Building a Dynamic Reputation System for DNS". In 19th Usenix Security Symposium, 2010
· Manos Antonakakis, Roberto Perdisci, Yacin Nadji, Nikolaos Vasiloglou, Saeed Abu-Nimeh, Wenke Lee and David Dagon, "From Throw-Away Traffic to Bots: Detecting the Rise of DGA-Based Malware". In 21st Usenix Security Symposium, 2012
· Leyla Bilge, Engin Kirda, Christopher Krue gel, and Marco Balduzzi. "EXPOSURE: Finding Malicious Domains Using Passive DNS Analysis", In TISSEC 2014
· Tomas Mikolov, Ilya Sutskever, Kai Chen, Greg Corrado, Jeffrey Dean. "Distributed Representations of Words and Phrases and their Compositionality", In NIPS 2013
· Grégoire Mesnil, Xiaodong He, Li Deng and Yoshua Bengio. "Investigation of Recurrent-Neural-Network Architectures and Learning Methods for Spoken Language Understanding", Interspeech, 2013.

Contact us
· Email: hongliang.liu@nominum.com · Company website: http://nominum.com/

DNS is our DNA!

