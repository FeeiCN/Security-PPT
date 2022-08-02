Upgrading)your)Cyber)Threat)Intelligence) to)Track)Down)Criminal)Hosting) Infrastructures
Jan)30th,)2018,)Bethesda,)MD Dhia Mahjoub,)PhD.,)Head)of)Security)Research

Takeaways

1.+Bulletproof+hosting+providers+business+model
2.+A+taxonomy+of+bulletproof+hosting+providers
3.+BPH+behind+current+malspam+campaigns
4.+Techniques+and+signals+to+track+BPH+and+ malware+campaigns

2

Who#am#I#?
*#####Dhia @DhiaLite *#####Principal#Engineer#and#Head#of#Security#Research#at#Cisco#Umbrella *#####Background#in#network#security,#network#traffic#analysis *#####PhD#in#graph#algorithms#applied#on#sensor#networks#problems#from#SMU *#####Speaker#at#Black#Hat,#Defcon,#RSA,#Shmoocon,#Brucon,#Kaspersky#SAS,#and#a#few#more
3

Day-in-the-lifeof-a-SOC
\

InternalFeed:
Security,controls  Firewall,-IDS/IPS
other-network-security  Web-security/proxy  Endpoint-security
(AV,-EDR,-VPN,-etc.)
Network, Infrastructure  Routers/switches  Domain-controllers  Wireless,-Access-pts

SIEM

Threats

YOU
TIP
External-Feed:
 Domain-ownership  Relationships-with-IPs-and-ASNs  Passive-DNS  WHOIS-record-data  CoNoccurrences  Reputation-scores

Threat,Intelligence,
4

Types)of)Threat)Intel
Strategic)Intelligence)involves)understanding)the)broader)threat) landscape)to)identify)the)risk)to)the)organization)and)help) influence)change)in)security)investments)or)operations)
Players:)C;level)executives,)policymakers,)high;level)positions
Operational)Intelligence)involves)identifying)the)patterns)and) trends)of)adversary)campaigns)that)an)organization)can)build) into)their)security)awareness
Players:)Security)Operations)Center)(SOC)
Tactical)Intelligence)includes)IOCs)and)tactics)that)help) drive)the)security)of)an)organization)and)enable)it)to)hunt) and)respond)to)threats
5
Players:)Security)Operations)Center)(SOC)

Know&your&adversary
Uncovering&Criminal&Hosting&infrastructures
6

Umbrella)Investigate)Intel)Production)Cycle
7

Threat(Landscape
8

Cybercrime)Ecosystem

Cybercrime

Products

Services

· Malware)­ RATs,)banking) · Bulletproof)Hosting trojans,)ransomware,)etc. · DDOS)services
· Bchruetcek)eforrsce)tools)and)account)· Ransomware)as)a)service · Vulnerabilities)and)Exploits · Installs)and)traffic
· Exploit)Kit
· Cash)out)and)exchangers

Goods
· Credit)card)dumps · Fullz information)and)PII · Database)dumps

9

BulletProof Hosting
Products

Cybercrime Services
Bulletproof6hosting

Goods

10

Bulletproof+

A+criminal+hosting+provider+

hosting+provider+ who+shields+their+customers+ from+abuse+complaints+and+

(BPH)

take+down+action.+

11

Spectrum4of4Hosting4Providers

Good

Abused

Bulletproof
12

A$Taxonomy$of$BulletProof Hosting
Cybercrime

Products
Ex.$ZBOT$FF Botnet:based

Services Bulletproof6hosting BPH6classification

Goods
Ex.$ALEX Host:based

Dedicated

Hybrid

Leased
13

Bulletproof,Hosting, business,model,
14

Dedicated* hoster recipe

Low$barrier$of$entry$(Approx <$2K)
1.*Register*business*offshore 2.*Register*own*ASN*and*lease*IP*space 3.*Setup*website(s)*or*stay*underground 4.*Drive*customers*­ forums*(open,*closed),*social*media 5.*Generate*revenue*through*hosting*or*sending*traffic 7.*Handle*abuse 8.*Shut*down,*move*elsewhere,*repeat

15

Dedicated* BPH*technical* features*

Leaf*ASN* Offshore*business*registration* Anonymous*payment*methods Small*IP*range* Toxic*hosted*content*or*outgoing*traffic

16

Leaf'(Stub)'ASN'or'leaf'ASNs'chain
Have'only'upstream'peers,'no'downstream Frequent'pattern'for'questionable/bulletproof'hosters

50673 SERVERIUS

9002 RETN,'UA

1299 Zayo,'US

6461 Telia,'SE

60144 3WKInfra,'NL

21100 ITLDCKUA

62088 SINARO

200429 HOSTSLIM

62454 ZYZTM','NL

Introduced'at'Black'Hat'2014

201628 Fiber01KAS,'NL
204196 Abelohost,'NL
17

Register*Business*in*Offshore*Jurisdictions

Belize Panama

Anguilla British/Virgin/Islands
Dominica

United/Arab/Emirates Seychelles

18

Multiple(Layers(of(Resistance

Servers
RIPE,(ARIN(space
Business
Belize,(Panama,(Seychelles

Operators
Ukraine,(Russia

19

Major(BPH(operations
20

Botnet(based-BPH
Products Botnet:based

Cybercrime Services
Bulletproof6hosting BPH6classification

Goods Host:based

Dedicated

Hybrid

Leased
21

ZBot Fast*Flux*BPH*Operation

Introduced*at*Black*Hat*2014, Botconf 2014,*Defcon 2017

Victim Crimeware consumer
Researcher

Actor(s)*grow*and*maintain*FF*network *FF*service*offered*in*underground*forums

Zbot Fast*Flux*Proxy*Network Aka*Fluxxy,*Darkcloud
Botnet*comprised*of*30J40K* compromised*residential*IPs,*
mainly*in*UA,*RU

40J50**bot*IPs* provisioned*per*domain
Criminal*customer's site*origin*IP
Content*delivered Short*lifetime:*malware,*ransomware Medium*lifetime:*phishing Long*lifetime:*carding,*cybercrime*forums
22

Threats*delivered*by*ZBot Fast*Flux*network
23

Host'based,BPH
Products Botnet:based

Cybercrime Services
Bulletproof6hosting BPH6classification

Goods Host'based

Dedicated

Hybrid

Leased
24

Sample@Rogue@Hosters

Alex Maxided Dataflow.su Ecatel Hostsailor Webzilla Hostkey QHoster Hostzealot

King@Servers Koddos/Amarutu Abelohost/Elkupi Deltahost Dataclub.biz Blazingfast.io Altuhost &@many@more

25

"Alex")

Top)tier)BPH)provider Russian:based)with)some)presence)in)China Active)for)a)decade,)prominent)since)2016 Host:based)Fast)Flux)network Hybrid)model:)dedicated)ASNs)&)abused)3rd party)cloud)hosters
Joint)Research)with)INTEL&471
26

Alex2BPH2enables2a2variety2of2toxic2content
Malware Ransomware Phishing2 Crimeware forums Credit2card2dump2shops
27

Alex's(Network(Infrastructure
AS9002,(UA RETN

Abused(third(party(cloud( and(hosting(services

AS8492,(RU OBIT

MANY%DOWNSTREAMS

AS45017,(UA LIRUKFIRST
CREATED'MARCH'2016

AS206728,(RU MEDIALAND
CREATED'NOV'2016
ALEXANDER,)VOLOSOVYK

MANY%DOWNSTREAMS

ALEXANDER,)VOLOSOVYK

AS47920,(UA COMTEC
CREATED'MARCH'2016
AS197812,(RU FERAZKO(HOLDING
CREATED'MAY'2011
ALFRED)BREWSTER

AS197569,(RU
ENERGOMONTAZH CREATED'FEB'2011 NOT'ACTIVE'SINCE'FEB'2017

Sound)vision)House Francis)Rachel)Street Victoria,)Mahe,)Seychelles
AS58001,(RU IDEAL?SOLUTION

AS43350,(NL NFORCE
AS39164,(NL CHECKTOR
28

Malspam campaign:
leverages1Host5based1&1hybrid1BPH
29

Path@of@malspam attack

1 Phishing'email'sent'from' delta@performanceair.com
!

2 Victims'click'on' malicious'URLs
myhearthstonehomes.org ourrealtyguy.info ourrealtyguy.org ourrealtyguy.us package2china.com

3 Malicious'word'doc' drops'Hancitor

6 Infection'on'device'&' positioned'for'data'extraction

5 Trojans'(Pony,'Evil'Pony,'

4

Zloader)'make'C2'call'for'extra'

malware'or'functionality

mebelucci.com.ua uneventrendi.com lycasofrep.com rinbetarrab.com

Hancitor makes'C2'call' to'domains'for'trojans
uneventrendi.com ketofonerof.ru thettertrefbab.ru
30

Malicious=malspam campaign
!
hxxp://myhearthstonehomes[.]org/i.php?d=
31
Reference=hazmalware.wordpress.com

performanceair.com
Spoofed)email)used)in)mailspam attack
32

Path9of9malspam attack

1 Phishing'email'sent'from' delta@performanceair.com
!

2 Victims'click'on' malicious'URLs
myhearthstonehomes.org ourrealtyguy.info ourrealtyguy.org ourrealtyguy.us package2china.com

33

August(30:(Peak(of(malicious(redirect(
34

Duration:(7(hour(period(
Attack(took(place(between(14:00421:00(UTC
35

Insight*into*the*IP*network
36

37

Known'malicious'domains'on'the'same'IP'
38

39

Insight*into*`heymamaradio.com'*malicious*IP*hosting
40

WHOIS(information(of(myhearthstronehomes.org
41

42

43

Related(domains(tied(to(the(same(malspam campaign
44

Malspam internet1infrastructure1uncovered1by1Investigate

2 www.ourrealtguy.org Domains1on1same1IP
52.14.244.225 IP1/1ALEX
heymamaradio.com Mal.1domains1on1same1IP
47.74.150.46 Changing1IP1hosting1/1ALEX

1 performanceair.com Stage11
myhearthstonehomes.org Starting1domain1
john@liveingarnetvalley.net WHOIS
myhearthstonehomes.net Domains1reg.1to1same1email

performanceair.com Related1Domains
3 100c3ee0008... File hash
4 uneventrendi.com Network1connection
217.197.116.46 HostedGonGsmallGtimeG BPHGorGrogueGhosters
45

TTPs9across9a9dozen9malspam campaigns

Alex(BPH(1
BPH(2 Dedicated9 small9time9BPH9 and9abused9 hosters

Malspam
Spoofed9 sender9 domain
Phishing

Campaign(1
performanceair.com myhearthstonehomes.org

Hancitor C2 thettertrefbab.ru

Pony9C2 mebelucci.com.ua

EvilPony C2 uneventrendi.com

Zloader C2 lycasofrep.com

Campaign(2
uspackagers.com downetwpnj.net Hedtfortedlet.ru crabbiesfruits.com orcateheck.com rebjusjohed.com

46

Our'other'related'work
 Virus'Bulletin'2017  Defcon 2017'https://www.youtube.com/watch?v=AbJCOVLQbjs  Black'Hat'2017'  Usenix Enigma'2017'https://www.youtube.com/watch?v=ep2gHQgjYTs&t=818s  Black'Hat'2016'https://www.youtube.com/watch?v=m9yqnwuqdSk  RSA'2016'
https://www.rsaconference.com/events/us16/agenda/sessions/2336/usingZlargeZ scaleZdataZtoZprovideZattacker  BruCon 2015'https://www.youtube.com/watch?v=8edBgoHXnwg  Botconf 2014  Virus'Bulletin'201' https://www.virusbtn.com/conference/vb2014/abstracts/Mahjoub.xml  Black'Hat'2014'https://www.youtube.com/watch?v=UG4ZUaWDXSs

Thank&you

Dhia Mahjoub,&dmahjoub@cisco.com,&@DhiaLite
Acknowledgements
Atheana Altayyar Austin&McBride Sarah&Brown

