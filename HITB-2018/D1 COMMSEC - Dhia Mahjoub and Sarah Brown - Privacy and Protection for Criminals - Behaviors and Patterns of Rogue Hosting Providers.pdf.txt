Privacy and Protection for Criminals: Behaviors and Patterns of Rogue Hosting Providers

Sarah Brown, Independent Researcher, Security Links Dhia Mahjoub, PhD., Head of Security Research, Cisco Umbrella (OpenDNS)

April 12, 2018

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

1

Who we are

Sarah
NCI Agency / Fox-IT / MITRE

Bringing together

tactical and strategic

cyber threat intel from

different locations, perspectives

Dhia
OpenDNS / Cisco

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

2

Cyber Threat Landscape
IP space

Toxic hosted content
 Malware C2  Ransomware  Phishing  Cybercrime forums

Rogue outgoing traffic

 SSH/wordpress brute-forcing

 DDoS attacks

 Spam sending © 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

3

Categories of Hosting Providers

Good

Abused

Bulletproof

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

4

Threat Intelligence Cycle

Requirements

Collection

Processing

Feedback

Dissemination

Analysis

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

5

Threat Intel Ecosystem Focus Areas

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

6

Requirements

Requirements Feedback

1. WhCicohllheoctsioting providers are serviPnrgotcoexsicsing content?
2. How do bulletproof hosting providers carry out their operations?
3. HDoiwssiesmthinisatpioonssible in NL with theAenxaisltyinsigs legal infrastructure?

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

7

Our stakeholders
 Threat intel teams  ISPs and hosters  Law enforcement  Policy makers

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

8

Requirements

Collection
Collection

Processing

Feedback

Dissemination

Analysis

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

9

Umbrella Investigate Intel Production Cycle

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

10

Processing

Requ1i.remEennrtsich, normalize, consColoidllaetcetion
2. Organize data in a threat intel platform

Feedback

Dissemination

Processing Analysis

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

11

Enrich with context across various attributes

Business registration

Helping the customer preserve bad content

Payment methods © 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

12

Autonomous System Number (ASN)
 Footprint of hosting provider in network view  Unique identifier of a business' IP space  An ASN can be an ISP, or a hosting provider  Routers exchange IP ranges (BGP prefixes) and AS paths

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

13

Requirements Feedback

Analysis
Collection

Processing

Dissemination

Analysis

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

14

Leaf (Stub) ASN or leaf ASNs chain

 Have only upstream peers, no downstream  Frequent pattern for questionable/bulletproof hosters  Flexible setup, nomad
1299 Zayo, US

6461 Telia, SE

50673 SERVERIUS

9002 RETN, UA

60144 3W-Infra, NL

21100 ITLDC-UA

62088 SINARO

200429 HOSTSLIM

62454 ZYZTM , NL

201628 Fiber01-AS, NL

204196

Abelohost, NL © 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

15

Indicator: Offshore Business Registration

Source: Grant Thornton

Minimal taxation Financial secrecy Shareholder Secrecy · UAE (10) · Panama (13) · BVI (21) · Belize (60) · Anguilla (63) · Seychelles (72) · Dominica (89)

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

16

Anonymous Payment Methods

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

17

Helping customers to maintain operations
· bob bob i need to install doorway and mass mailer. is that good?
· David Once you purchase dedicated servers you will get root access on server. Then you can install anything what you want.
· bob bob do u ignore dmca ? · David For this please read our DMCA policy as below · The actions we take with DMCA complaints depends on the criteria of the complaint, sometimes they don't apply to us in Panama Law, but if it's a copyrighted content we will ask you to remove the specific content they are complaining about, but we can handle them and keep your service alive.

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

18

Sample Rogue Hosters with a Dutch footprint (April 2018)

Global-Frag

Serverius

Genius-Security

King Servers

Webzilla

Deltahost

IQOption

Koddos/Amarutu

3WInfra

Hostkey

Ecatel/Novogara

Altushost

Abelohost

QHoster

Hostzealot

Hostslim

NForce

Leadsfleet

Hostsailor

Sinaro

KnownSRV

Dataclub.biz

Blazingfast.io

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

19

AS50673 Serverius, NL
1

AS9002 RETN, UA

AS5577 Root, LU

AS42708 Portlane, SE

Dump shops

AS51430 ALTUSHOST, NL

2 6

AS199968 IWSNET, SE Hostplay.com
3 Armenia, UAE Porn, torrents, pirated movies

5

AS60778

Felicity, NL

AS60567 DATACLUB, SE

Panama Porn, pirated movies

Latvia, Belize Dump shops

4

AS201630 Qhoster, BG

+ DE ASNs

UK

US

ASNs ASNs

CH ASN

Belize

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

20

EKs, malware, CP, fake SW, dump shops, botnet C2

Kings-servers Hosting-Solutions

Upstream

50673

14576 44596

EK, malware, porn, pharma, fake sw

50673 6939

174

AS32338, AS202951 Hostiserver

Adult and child porn

MPAA (movie) piracy
Ferazko Holding.ru
197812

203339

165 credit card dump shops

202920 203557 52048

60567

Dataclub.biz

Ecatel
29073 movie piracy, child porn, etc

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

21

Dissemination

Requirements

Collection

Processing

Feedback

Dissemination

Analysis

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

22

Rogue Hoster Recipe
Low barrier of entry (Approx <$2K) 1. Register business offshore 2. Register own ASN and lease IP space 3. Setup website(s) or stay underground 4. Drive customers ­ forums (open, closed), social media 5. Generate revenue through hosting or sending traffic 7. Handle abuse 8. Shut down, move elsewhere, repeat

Law enforcement: Cross Jurisdictional Business Model

Operators

Servers

Ukraine, Russia

Netherlands

Business

Belize, Panama, Seychelles

Information Sharing Agreements vary widely between nations

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

24

Law enforcement: Taking Down Bad Content

Security community

Abuse complaint

Hosting providers

notify

NTD

Warrant

NCSC NHTCU

Request for warrant

Public prosecutor

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

25

Law Enforcement Recommendations

1. Closer cooperation between LE teams in different countries
More scrutiny, liability for
2. Facilitators of cyber crime
3. Money laundering and currency exchange services

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

26

Security Community Recommendations
1. Think beyond reactive collection and blocking of IOCs 2. Understand and expose TTPs of rogue hosting providers 3. Share intel (e.g., evidence of intent) with security community/LE,
monitor and take early action

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

27

Policy Makers: Operational Challenges with taking down a bad hoster
 Repeat offenses doesn't equal guilt  Advertising as a bulletproof hoster not enough  Criminal Exclusion Ground  Incentive is profit and not to fight abuse

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

28

Policy makers: Recommendations

 Rank hosters at a consumer agency (e.g., Consumentenbond)
­ Aids LE, businesses ­ Hosters care about their
reputation

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

29

Hosting Community Recommendations

1. Urge datacenters to scrutinize peering and/or co-location requests more closely
2. Self-regulation to establish a Code of Conduct a. Acceptable Use Policy to check customer content b. Collecting personal details of customers c. When to support investigations and remove dodgy customers
3. Ask registries to scrutinize ASN requests more closely

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

30

Summary

 Leveraged the threat intel cycle to investigate criminal hosting space in The Netherlands
 Combined machine-based and human-based intelligence collection and analysis  Exposed business models and operations of criminal hosters  Offered recommendations for four (4) stakeholder groups

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

31

References
 Borderless Cyber Europe 2017  Holland Strikes Back 2017  NCSC One Conference 2017  Australian Cyber Security Conference 2017  Enigma 2017 https://www.youtube.com/watch?v=ep2gHQgjYTs

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

32

Additional Related Work
 SANS CTI Summit 2018
 Flocon 2018 https://schd.ws/hosted_files/flocon2018/d7/2.%20FloCon%202018_.pdf https://schd.ws/hosted_files/flocon2018/16/2.%20Flocon_2018_Thomas_Dhia_Jan_10.pdf  Virus Bulletin 2017 https://www.virusbulletin.com/blog/2017/11/vb2017-paper-beyond-lexical-and-pdns-using-signals-graphs-uncover-onlinethreats-scale/ Defcon 2017 https://www.youtube.com/watch?v=AbJCOVLQbjs Black Hat 2017 https://www.youtube.com/watch?v=PGTTRN6Vs-Y&feature=youtu.be Black Hat 2016 https://www.youtube.com/watch?v=m9yqnwuqdSk RSA 2016 https://www.rsaconference.com/events/us16/agenda/sessions/2336/using-large-scale-data-to-provide-attacker BruCon 2015 https://www.youtube.com/watch?v=8edBgoHXnwg Virus Bulletin 2014 https://www.virusbtn.com/conference/vb2014/abstracts/Mahjoub.xml Black Hat 2014 https://www.youtube.com/watch?v=UG4ZUaWDXS

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

33

Thank you! dhia@opendns.com sarah@securitylinks.nl

© 2017 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

34

