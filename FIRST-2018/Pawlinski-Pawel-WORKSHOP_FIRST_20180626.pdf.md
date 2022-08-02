Not just indicators: automated data processing with n6
Pawel Pawlin´ ski
pawel.pawlinski@cert.pl
FIRST Annual Conference
Kuala Lumpur, 2018-06-25

Background

Technical overview

Hands-on session

Use cases

Today's workshop: open source n6 platform

Discussion

https://github.com/CERT-Polska/n6
or get the demo VM image

Pawel Pawlin´ ski

n6 workshop

1 / 42

Background

Technical overview

Hands-on session

Use cases

Discussion

keyword: automation

Pawel Pawlin´ ski

n6 workshop

2 / 42

Background
Agenda

Technical overview

Hands-on session

Use cases

Discussion

1 Background: what data we want to process 2 Technical overview of n6 3 Hands-on session 4 Use cases: how n6 is used in CERT.PL 5 Discussion

Pawel Pawlin´ ski

n6 workshop

3 / 42

Background

Technical overview

Hands-on session

CERT.PL: quick introduction

Use cases

Discussion

Established in 1996 Constituency:
national CSIRT except government, military, critical infrastructure Part of NASK: research institute .pl registry software development ISP ...
Trying to share information & tools

Pawel Pawlin´ ski

n6 workshop

4 / 42

Background

Technical overview

Hands-on session

Our place in the information flow

Use cases

Discussion

Defender

Defender

Broker

Defender

Policy Maker

Pawel Pawlin´ ski

n6 workshop

5 / 42

Background

Technical overview

Hands-on session

Our place in the information flow

Use cases

Discussion

Defender

Defender

Broker

Defender

Policy Maker

Pawel Pawlin´ ski

n6 workshop

5 / 42

Background

Technical overview

Hands-on session

What kind of data you process?

Use cases

Discussion

IoC

Pawel Pawlin´ ski

n6 workshop

6 / 42

Background

Technical overview

Hands-on session

What kind of data you process?

Use cases

Discussion

abuse reports

IoC advisories

Pawel Pawlin´ ski

n6 workshop

6 / 42

Background

Technical overview

Hands-on session

What kind of data you process?

Use cases

Discussion

scanners spaidnemffeamccetriesomnesnts mablowtanreetUCR&LsC campaigns

abuse reports

phishing

YARA rules

IoC

vulnerabilities

advisories

Pawel Pawlin´ ski

n6 workshop

6 / 42

Background

Technical overview

Hands-on session

What kind of data you process?

Use cases

Discussion

scanners spaidnemffeamccetriesomnesnts mablowtanreetUCR&LsC campaigns

abuse reports

phishing

YARA rules

IoC

vulnerabilities

advisories

raw data

network traffic losgasmples

Pawel Pawlin´ ski

n6 workshop

6 / 42

Background

Technical overview

Hands-on session

What kind of data you process?

Use cases

Discussion

abuse reports
IoC

Pawel Pawlin´ ski

n6 workshop

6 / 42

Background

Technical overview

Sources of information

Hands-on session

Use cases

Discussion

commercial entities
non-profits

own systems
public sources

Pawel Pawlin´ ski

n6 workshop

7 / 42

Background

Technical overview

Sources of information

Hands-on session

Use cases

Discussion

commercial entities
non-profits

own systems
public sources

40+ data providers 80+ active incoming data feeds
1M+ events per day

Pawel Pawlin´ ski

n6 workshop

7 / 42

Background

Technical overview

Own systems

Hands-on session

Use cases

Sinkhole infections
Malware tracking C&C infrastructure configuration, injects
Honeypots & darknet (network telescope) attacks scans denial-of-service see SISSDEN project
https://sissden.eu presentation by Shadowserver on Tuesday

Discussion

Pawel Pawlin´ ski

n6 workshop

8 / 42

Background
Tooling

Technical overview

Hands-on session

Use cases

Discussion

abuse reports

IoC advisories

Pawel Pawlin´ ski

n6 workshop

9 / 42

Background
Tooling

Technical overview

Hands-on session

Use cases

Discussion

abuse reports
Megatron AbuseIO

IoC advisories

Commercial Threat Intelligence Platforms

Pawel Pawlin´ ski

n6 workshop

9 / 42

Background
Tooling

Technical overview

Hands-on session

Use cases

Discussion

network security incident exchange

Pawel Pawlin´ ski

n6 workshop

9 / 42

Background
Tooling

Technical overview

Hands-on session

Use cases

Discussion

abuse reports
IoC

Pawel Pawlin´ ski

n6 workshop

9 / 42

Background
Agenda

Technical overview

Hands-on session

Use cases

Discussion

1 Background: what data we want to process 2 Technical overview of n6 3 Hands-on session 4 Use cases: how n6 is used in CERT.PL 5 Discussion

Pawel Pawlin´ ski

n6 workshop

10 / 42

Background

Technical overview

n6: first generation

Hands-on session

Use cases

Discussion

Deployed late 2011 Minimalistic by design Filtering: client gets relevant data only Keeping original format Enrichment Flat files served directly by Apache Authentication using X.509 certificates Last commit 2015, shut down 2017

Pawel Pawlin´ ski

n6 workshop

11 / 42

Background

Technical overview

Original code

Hands-on session

Use cases

Discussion

SLOC Directory

SLOC-by-Language

2488 1346 1280 886 517

transfer sources pyn6toolkit manage engine

python=1982,sh=391,perl=115 perl=1198,python=82,sh=66 python=1280 sh=886 perl=517

Generated using David A. Wheeler's `SLOCCount'.

Pawel Pawlin´ ski

n6 workshop

12 / 42

Background

Technical overview

Hands-on session

Main objectives of n6 (2013)

Use cases

Discussion

1 Provide information to our constituency 2 Get actionable conclusions value from data available 3 Obtain data from as many sources as possible 4 High throughput: gigabytes, 10M+ events daily 5 Easy to query, simple data model 6 Secure access, fine grained permissions 7 Maintain and improve quality of incoming data 8 Minimize manual & maintenance effort 9 Reliable (including HA)

Pawel Pawlin´ ski

n6 workshop

13 / 42

Background

Technical overview

Hands-on session

n6 new generation: 2013+

Use cases

Discussion

commits

Pawel Pawlin´ ski

n6 workshop

14 / 42

Background

Technical overview

Architecture

Hands-on session

Use cases

Discussion

Pawel Pawlin´ ski

n6 workshop

15 / 42

Background

Technical overview

Hands-on session

Handling of incoming data

Use cases

Stream/message oriented architecture: RabbitMQ

AMQP: standard protocol configurable flow of messages integration with other services web management HA

Collectors: specialized code to fetch data from sources

Parsers: convert to event streams and normalize

Aggregator: on the fly to deduplication

Enricher: DNS, ASN, country code

Comparator: blacklist state tracking

Filter: organization (client) mapping

Recorder & Archiver: persistence Web interfaces
clients: sign-up, browse data, manage access admins: full management

(upcoming) Notifier: send statistics on new data

Pawel Pawlin´ ski

n6 workshop

Discussion 16 / 42

Background
Storage

Technical overview

Hands-on session

Use cases

Original data Document store: MongoDB Collection per source Files (GridFS) & arbitrary BSONs Compressed size: 1.4 TiB
Normalized events SQL: MariaDB + TokuDB engine Optimized schema Indexes, partitioning Transparent compression 3 B records in total 2 TiB disk space Up to 500 inserts/s per recorder Designed for batch reads (up to millions of events)
Critical for overall performance

Pawel Pawlin´ ski

n6 workshop

Discussion 17 / 42

Background

Technical overview

Sharing interface

Hands-on session

Use cases

Discussion

Simple to use REST API Multiple output formats: JSON, CSV, IODEF, (upcoming: STIX 2) Real-time stream API (STOMP) Flexible permission model, attribute-level granularity Authentication via client X.509 certificates Test endpoints with autogenerated data

Pawel Pawlin´ ski

n6 workshop

18 / 42

Background

Technical overview

n6 vs IntelMQ

Hands-on session

Use cases

Discussion

Similarities inspired by AbuseHepler Python queues, modular / microservices
IntelMQ: focus on notifications (email) more generic, build your own parts active developer community management tools build from scratch
n6: focus on feeds (API) events aggregate on the fly leveraging existing tools (RabbitMQ, supervisor, Flask admin) included: complete database, ACLs, flexible queries user web interface

Pawel Pawlin´ ski

n6 workshop

19 / 42

Background

Technical overview

IntelMQ integration

Hands-on session

Use cases

Discussion

New in n6: elastic pipeline Running IntelMQ bots in n6 pipelines Adapters for message conversions: n6  IntelMQ, IntelMQ  n6 Mapping: attributes, taxonomy

Pawel Pawlin´ ski

n6 workshop

20 / 42

Background

Technical overview

n6 vs MISP

Hands-on session

Use cases

Discussion

MISP: focus on sharing IoC broad set of use cases very sophisticated data model (taxonomies, galaxies, etc) multiple sharing arrangements (peer-to-peer & other)
n6: narrow focus: provide feeds, primary abuse data filtering data: only relevant events mostly network IoCs simple data model
Integration: MISP collector support for incremental updates
n6 can complement MISP for distribution of abuse data

Pawel Pawlin´ ski

n6 workshop

21 / 42

Background
Agenda

Technical overview

Hands-on session

Use cases

Discussion

1 Background: what data we want to process 2 Technical overview of n6 3 Hands-on session 4 Use cases: how n6 is used in CERT.PL 5 Discussion

Pawel Pawlin´ ski

n6 workshop

22 / 42

Background

Technical overview

RabbitMQ

Hands-on session

Use cases

Discussion

Pawel Pawlin´ ski

n6 workshop

23 / 42

Background

Technical overview

API & data format

Hands-on session

Use cases

Discussion

Pawel Pawlin´ ski

n6 workshop

24 / 42

Background

Technical overview

API & data format

Hands-on session

Use cases

Discussion

Pawel Pawlin´ ski

n6 workshop

24 / 42

Background

Technical overview

Web interface

Hands-on session

Use cases

Discussion

Pawel Pawlin´ ski

n6 workshop

25 / 42

Background

Technical overview

Hands-on session

Configuration management

Use cases

Discussion

Pawel Pawlin´ ski

n6 workshop

26 / 42

Background

Technical overview

Hands-on session

Monitoring: logging to Splunk

Use cases

Discussion

Pawel Pawlin´ ski

n6 workshop

27 / 42

Background

Technical overview

Hands-on session

Monitoring: performance monitoring

Use cases

Discussion

Pawel Pawlin´ ski

n6 workshop

28 / 42

Background
Agenda

Technical overview

Hands-on session

Use cases

Discussion

1 Background: what data we want to process 2 Technical overview of n6 3 Hands-on session 4 Use cases: how n6 is used in CERT.PL 5 Discussion

Pawel Pawlin´ ski

n6 workshop

29 / 42

Background

Technical overview

Hands-on session

Sharing with organizations in Poland

Use cases

Discussion

Primary use case Free service for network owners 250+ registered organizations 100+ active users

Pawel Pawlin´ ski

n6 workshop

30 / 42

Background

Technical overview

Hands-on session

Use cases

Discussion

Sharing with organizations in Poland: conclusions

Challenges: low uptake by ISPs (data on customers is unused) recipients might not know what to do with the data troubles automating processing on the client side rare feedback
Many recipients require human interface Motivation for better delivery methods

Pawel Pawlin´ ski

n6 workshop

31 / 42

Background

Technical overview

Hands-on session

Use cases

Discussion

Data on other countries: avg events daily in 2018

Pawel Pawlin´ ski

n6 workshop

32 / 42

Background

Technical overview

Hands-on session

Data on other countries: conclusions

Use cases

Discussion

Mostly nat/gov CSIRTs Rare feedback Limited uptake Some recipients have maintenance issues Feasible to have CSIRT-to-CSIRT exchange network?

Pawel Pawlin´ ski

n6 workshop

33 / 42

Background

Technical overview

Hands-on session

Quantitative analysis: annual report

Use cases

Discussion

Pawel Pawlin´ ski

n6 workshop

34 / 42

Background

Technical overview

Hands-on session

Annual report: amplifiers

Use cases

Discussion

Pawel Pawlin´ ski

n6 workshop

35 / 42

Background

Technical overview

Hands-on session

Use cases

Annual report: infection rates by ISP size

Discussion

Pawel Pawlin´ ski

n6 workshop

36 / 42

Background

Technical overview

Hands-on session

Quantitative analysis: conclusions

Use cases

Discussion

In-depth analysis of collected data: possible to spot trends and anomalies
Often not obvious how to use this knowledge Challenge: evaluation of data sources
quality of information evaluation needs to be part of standard processes? Challenge: cross-comparable metrics country- or ISP-level

Pawel Pawlin´ ski

n6 workshop

37 / 42

Background
Agenda

Technical overview

Hands-on session

Use cases

Discussion

1 Background: what data we want to process 2 Technical overview of n6 3 Hands-on session 4 Use cases: how n6 is used in CERT.PL 5 Discussion

Pawel Pawlin´ ski

n6 workshop

38 / 42

Background

Technical overview

Future plans

Hands-on session

Use cases

Discussion

Prettier web interface (soon) Even more performant database schema Release of functionality missing from open source version
IntelMQ integration notifier stream API additional collectors and parsers
More enrichments Complete management functionality in web interface Provide metrics to clients (network health) Continuous quality evaluation

Pawel Pawlin´ ski

n6 workshop

39 / 42

Background

Technical overview

Discussion

Hands-on session

Use cases

Discussion

Do you have similar use-cases? What tools do you use? Can n6 automate some of your processes? What features should we add? Do you have/know good data sources to add? Other comments? Questions?

Pawel Pawlin´ ski

n6 workshop

40 / 42

Background

Technical overview

Hands-on session

Opportunity to share ideas: IHAP

Use cases

Discussion

Incident Handling Automation Project: informal dev/user group Mailing list & semi-annual meetings BoF session on Thursday (28.06), 18:00 ­ 19:00 @ Johor 2+5 (see Additional programming section of the program)

Pawel Pawlin´ ski

n6 workshop

41 / 42

Background

Technical overview

Hands-on session

Use cases

Reading material: data processing and quality

Discussion

Actionable Information for Security Incident Response, 2014
www.cert.pl/news/9684 Threat Intelligence: Collecting, Analysing, Evaluating, 2015
www.mwrinfosecurity.com/our-thinking/
intelligent-threat-intelligence
Everything You Wanted to Know About Blacklists But Were Afraid to Ask, Leigh Metcalf, Jonathan M. Spring, CERT / SEI, 2013
resources.sei.cmu.edu/library/
asset-view.cfm?assetid=83438
Paint it Black: Evaluating the Effectiveness of Malware Blacklists Marc Kührer, Christian Rossow, Thorsten Holz, Ruhr-Universität Bochum, 2014 NECOMA project, Deliverable 2.2: Threat Analysis Platform, Dataset rating, 2015
www.necoma-project.eu

Pawel Pawlin´ ski

n6 workshop

42 / 42

https://github.com/CERT-Polska/n6
Co-financed by the Connecting Europe Facility of the European Union

