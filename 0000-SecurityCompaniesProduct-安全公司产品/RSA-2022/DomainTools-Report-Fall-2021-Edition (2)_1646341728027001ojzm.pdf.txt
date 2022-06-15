Introduction
Since the first DomainTools Report in 2015, we have sought to explore our stores of domain registration, hosting, and content-related data to surface patterns and trends that might be of interest to security practitioners, researchers, and anyone else interested in the suspicious or malicious use of online infrastructure. Most of the reports to date have had specific areas of focus, ranging from TLDs and email privacy providers (2015) to affixes in domain names (2016) to domain "blooms" and "spikes" (Spring 2021).
For this edition, we chose to go "back to basics," and focus on concentrations of malicious activity by six categories, several of which were also studied in earlier reports. We expect that some criteria (such as top level domain, IP autonomous system number, and IP geolocation) will remain relevant over the foreseeable future; that is, as datapoints related to domain names, these are unlikely to become less forensically-valuable unless the Internet's fundamental structure changes. Other datapoints may wax and wane in relevance. For example, email privacy providers as a category which we studied in the first DomainTools Report, are dramatically less relevant in the post-GDPR world of default privacy for most registrations.
But the constant across all of these reports is our interest in providing insights into where malicious activity lurks on the Internet, with the aim of ultimately helping the community get better at staying ahead of those entities wishing to do harm online.
Criteria and Methodology
Domain Characteristics Evaluated
For this edition of the report, we examined the following characteristics of a domain:  Top Level Domain (TLD); for example, .com or .net  IP Autonomous System Number (ASN); these represent an aspect of the domain's hosting  Nameserver ASN; these represent the hosting of the nameserver associated with a domain  IP Geolocation: the country code associated with the location of the domain's IP address  Registrar: the entity through which the domain was registered  SSL Certificate Authority (CA): the CA for certificate(s) associated with domains
We chose these characteristics because they are often used by defenders and security researchers as part of a process of building out a better understanding of a domain. Seasoned practitioners often develop intuitions about the implications of a given characteristic, based on their experience, expertise, and judgment in the analysis of adversary assets. In many cases, the data seen at scale tend to support those intuitions. Certain TLDs, for
© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 2

example, have reputations among security analysts as being dangerous "neighborhoods" of the Internet, and as this and previous DomainTools Reports show, there are indeed some TLDs that have high concentrations of malicious domains. Other criteria are more ambiguous; for example, we will see that when it comes to SSL certificate issuers, some readers may be surprised by what this large-scale analysis shows--and does not show--about where the danger lies.
Methodology
Candidate Domains
The DomainTools Iris database includes around 380 million currently-registered domains. However, not all of these domains are active. In the interest of understanding real and current threats, we chose to exclude domains that appear to be dormant. We did this by cross-checking the domains against our passive DNS sources; only those domains that have recently shown up in passive DNS are candidates for signal strength calculations.
How did we determine which of the candidate domains represent threats? There were two components to this. We identified domains that were known-bad by checking the domain names against several well-known industry blocklists which give indications of malware, phishing, or spam activity.
We also imposed thresholds for absolute numbers of domains associated with each domain characteristic, so as to eliminate those entities that had extremely small populations of domains associated with them. To be part of the evaluation, the characteristic had to have a count of known-malicious domains above the following thresholds:
 IP Geolocation: 100  TLD: 1000  IP ASN: 1000  Nameserver ASN: 1000  Registrar: 1000  SSL Certificate Authority: 1000
The threshold of 100 for IP Geolocation is different from the others because we chose to remain consistent with earlier editions of the DomainTools Report that used the same threshold.
The implication of this thresholding is that there are some concentrations of malicious activity that may have higher signal strengths than what is included in the findings below, but such hotspots are so small that they are unlikely to represent major threat vectors overall.
Signal Strength
The tables in this report are populated and sorted based on the strongest signals for phishing, malware, or spam activity associated with the populations of known-bad domains sharing the characteristic (such as TLD, IP ASN, etc). We developed this approach because when we created our Domain Risk Score machine learning algorithms, it was critical to produce scoring that achieved a good balance between a low false positive rate and an effective
© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 3

catch rate. A high signal strength value means that the characteristic in question is over-represented in the population of known bad domains, as compared with neutral ones. The larger the proportion of malicious domains in a given population (an IP address, a nameserver, a registrar, etc) the higher our confidence that any unknown domain from that population may be involved in the threat in question. And in actual practice, many defenders treat these signals in exactly this way: many characteristics of a domain (such as certain TLDs or certificate authorities) are viewed as caution signs. Signal strengths closer to 1.00 indicate a neutral signal, and if the signal strength is below 1.00, the item in question is actually more associated with neutral/good domains than with malicious ones. There were some cases in which, for a given threat type, our Top 10 lists had fewer than ten entities with signals above 1.00 - in other words, there were some items in some of these lists that actually signal more goodness than badness (which is a DomainTools Report first).

Snapshot in Time
For our calculations, we took a snapshot of the domains in existence and active as of late September, 2021. Of course, the Internet is in a constant state of flux, but as with most big-data analyses, large-scale trends tend to have some stability and durability. Future DomainTools Reports that examine the same criteria as this report will likewise be built on snapshots in time.
Interpreting the Data
In each of the following six sections, we show "Top-ten" tables, sorted by the signal strength, for each of the three threat types (phishing, malware, spam). Each table also includes the actual counts of domains associated with the item. As an example, consider this row of data from the TLD section:

Signal Strength

Malware

Phishing

.bar

108.93

6,321

3,064

Spam 2,648

Neutral

2,414

The TLD .bar has a Malware signal strength of 108.93 (the highest malware signal of any TLD on the Internet, by our methodology). There are 6,321 domains in that TLD whose chief threat type is malware, according to the blocklists we used. For comparison, we also give the numbers of phishing, spam, and neutral domains associated with the TLD. As a reminder, all domains under consideration had shown recent activity shown in passive DNS

© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 4

records as of the time the snapshot was taken, so the numbers do not include the inactive domains associated with that TLD.
It's important to keep in mind what signal strength represents, and what it does not. Most importantly, a high signal strength for maliciousness does not typically correspond to a high absolute number of malicious domains. The purpose of the report is not to show where the highest numbers of dangerous domains are, but rather what data points should be considered the strongest indicators that something unsavory might be afoot.
Findings
Some Confirmations, Some Surprises
Defenders and researchers have come to expect certain patterns when they look into suspicious or known-bad infrastructure. Certain TLDs, for example, have poor reputations in the infosec community, and indeed, some of those are represented in the top-ten lists for phishing, malware, and spam signal strength. The newer generic TLDs, such as .live, .top, and .xyz are examples of these. And, indeed, within the top 10 lists in the TLD section, none of the most popular TLDs, such as .com, .net, or .org, nor any of the larger country code TLDs such as .co.uk, .de, .fr, etc, are anywhere to be found. All of the top-ten lists are composed of relatively new gTLDs, or country code TLDs (ccTLDs) from comparatively small countries such as .ml, the ccTLD for Mali (which, it should be noted, allows free, anonymous domain registrations). The findings in the TLD section, then, aren't likely to surprise most readers.
On the other hand, the results in some of the other categories may be counterintuitive to many readers. In particular, the top-ten lists based on SSL Certificate Authority, were not even entirely "top ten" from the malicious signal perspective--that is, in all three of the categories, some of the top-ten signal strength figures were below 1.00, which is the threshold for neutrality--meaning that those certificate issuers were actually more associated with neutral or even known-good domains than malicious ones. Indeed, two of the certificate providers most often scorned by infosec pros--Let's Encrypt and self-signed certificates--both had sub-1.00 signal strength in at least one of the top-ten lists! (NOTE: for the sake of this research, we make no distinction between SSL and TLS certificates; we simply use the term SSL because it's the common parlance among most practitioners and researchers.)
The SSL results reminded us of what many of us considered a surprising finding in the very first DomainTools Report: the majority of newly-created domains each day do not show strong signals of maliciousness. It is almost an article of faith among defenders that new domains are dangerous, but the data say otherwise. However, we hasten to add that the inverse of this does comport with expectations: the majority of malicious domains are, indeed, young.
© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 5

And now, on to the categories.
Top-Level Domains (TLDs)

The TLD of a domain often conveys some level of meaning about the domain. By far the most common TLD, .com, tends to connote legitimacy to many Internet users,
Phishing
Following are the top ten TLDs ranked by signal strength for phishing. The range of signal strengths is comparatively modest; as we will see, while the 131.03 for .quest is substantially higher than the second-place TLD, it is a low value compared to some of the other top-ten "winners."

.quest .cyou .bar .rest .monster .casa .buzz .ml .live .top

Signal Strength 131.03 81.20 65.20 62.89 43.97 43.65 39.61 28.11 25.10 21.27

Phishing
426 9,759 3,064 2,407 2,687 1,760 9,253 26,237 12,787 34,005

Malware 229
1,257 6,321
909 1,334 2,072 4,321 3,331 4,420 58,486

Spam

498 414 2,648 1,119 179 2,529 1,809 1,818 1,575 4,329

Neutral 167
6,173 2,414 1,966 3,139 2,071 11,999 47,945 26,164 82,113

Malware
The top ten TLDs for Malware signal strength show some overlap with the Phishing list, with four of the Phishing TLDs also seen in Malware. The general range of signal strengths is comparable between the two lists, as well. Notable in this table is the appearance of .xyz, which is a relatively popular TLD, in part because of promotions over the years for relatively inexpensive, or even free, domain registration in .xyz. The numbers of domains in .xyz in this table are among the highest in this report--until we reach the Certificate Authority section.

.bar .quest

Signal Strength 108.93 57.04

Malware 6,321 229

Phishing 3,064 426

Spam 2,648 498

Neutral 2,414 167

© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 6

.cc .casa .xyz .top .bid .surf .club .icu

51.93 41.62 33.90 29.63 27.78 22.02 21.52 19.33

28,411 2,072 207,726 58,486 1,035
378 43,017
6,637

4,145 1,760 70,178 34,005
244 289 15,233 4,445

696 2,529 51,693 4,329
131 1,229 2,388
362

22,758 2,071
254,882 82,113 1,550 714 83,156 14,280

Spam
As with the previous two lists, several of the TLDs are represented more than once. However, note that the signal strength variation is wider in the Spam category than either of the others, with both the highest and lowest values of any of the three lists. The TLD .xyz, with its high domain counts, makes this top ten list as well.

.quest .work .surf .casa .bar .fit .rest .cam .xyz .uno

Signal Strength 217.97 148.61 125.81 89.26 80.18 50.45 41.60 23.98 14.82 12.87

Spam 498
50,152 1,229 2,529 2,648 2,166 1,119 3,288
51,693 384

Phishing 426
4,092 289
1,760 3,064
404 2,407
557 70,178
186

Malware 229
4,327 378
2,072 6,321
573 909 3,228 207,726 477

Neutral 167
24,667 714
2,071 2,414 3,138 1,966 10,020 254,882 2,181

IP ASNs
For this category, we provide both the Autonomous System number itself and the organization name to which the ASN is delegated. As you read the ASN tables, note that the signal strengths at the top are dramatically higher

© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 7

than what we recorded in the TLD lists. Note, too, the extraordinary ratios between the numbers of malicious domains vs neutral domains in some of these ASNs, or between one category and another (for example, in the Malware category, ASN 49447, NICEIT, DM, has 1572 phishing domains versus just 15 neutral). With each AS in this and the following section, we provide its country code of registration in parentheses.
Phishing
Following are the top ten IP ASNs ranked by signal strength for phishing. As noted above, see the wide range in Signal Strength, from over 8,000 at the top to about 181 at the bottom--the latter number not far from the highest signal strengths we recorded for TLDs across that whole category! To save you the math, that spread is more than a 44:1 ratio from highest to lowest signal strength. (Spoiler alert, however: that spread is not the overall winner for this study; in fact, it's not even close!)

49447 Nice IT Services Group Inc (DM) 24295 Internap Japan Co., Ltd. (JP) 211390 Cloud Solutions Ltd (RU) 132827 GATEWAY INC (JP) 58065 Packet Exchange, LTD (SE) 41564 Orion Network Limited (SE) 262254 DDOS-GUARD CORP (BZ) 59447 Istanbuldc Veri Merkezi Ltd Sti (TR) 209813 Fast Content Delivery LTD (SC) 200313 INTERNET IT COMPANY (SC)

Signal Strength 8,047.06 2,167.04 805.74 649.86 621.96 409.52 404.55 303.38 290.33 180.91

Phishing 1572 254 808 347 1134 608 2550 1857 2314 589

Malware 131 394 91 141
1354 877 90
2964 726 185

Spam 46
923 453 1608 421
99 147 126 294 447

Neutral 15 9 77 41
140 114 484 470 612 250

Malware
Signal strength for Malware in the IP ASN was not quite as broad as in the Phishing category, but still a more than order-of-magnitude spread. And note, too, some of the extreme spreads in absolute numbers of domains. Some of these ASNs seem to `specialize' in certain kinds of malicious activity. Note, too, that PEG TECH makes it into this list twice, for two different AS under their control.

Shanghai Zheye Network Technology 136574 Co.Ltd (CN) 24295 Internap Japan Co., Ltd. (JP) 58065 Packet Exchange, LTD (SE) 49447 Nice IT Services Group Inc (DM)

Signal Strength Malware Phishing

Spam

Neutral

3,379.93

573

13

1230

9

2,324.07

394

254

923

9

513.44

1354

1134

421

140

463.63

131

1572

46

15

© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 8

41564 Orion Network Limited (SE) 59447 Istanbuldc Veri Merkezi Ltd Sti (TR) 398478 PEG TECH Inc (US) 135097 LUOGELANG (FRANCE) LIMITED (HK) 398823 PEG TECH Inc (US) 132827 GATEWAY INC (JP)

408.40 334.79 333.31 318.87 186.21 182.57

877 2964
992 919 6559 141

608 1857
9 6 55 347

99 126 172
93 1853 1608

114 470 158 153 1870
41

Spam
This category plays out similarly to the other two, with a very wide range of signal strengths, and similarly wide spreads in absolute numbers of domains. Of course, as in all of the top-ten lists in this category, the rule of small numbers is very much in play, with many of these IP ASNs hosting comparatively low overall numbers of domains.

Signal Strength

Shanghai Zheye Network Technology 136574 Co.Ltd (CN)

9,585.49

18046 DongFong Technology Co. Ltd. (TW)

7,947.24

24295 Internap Japan Co., Ltd. (JP)

7,193.01

132827 GATEWAY INC (JP)

2,750.77

9311

HITRON TECHNOLOGY INC (TW)

1,955.94

16578 Lanset America Corporation (US)

1,238.82

208006 Softqloud GmbH (DE)

805.31

209371 Cenk Aksit (TR)

567.22

23881 UDomain Web Hosting Company Ltd (HK)

552.70

211390 Cloud Solutions Ltd (RU)

412.63

Spam
1230 6232
923 1608 3458 1466 1263 1019 15193
453

Phishing Malware Neutral

13

573

9

0

15

55

254

394

9

347

141

41

78

42

124

16

64

83

82

278

110

45

162

126

8

844

1928

808

91

77

Nameserver ASNs

At a glance, these will look similar to the previous category, but in this case, we're looking at the AS associated with the nameserver IPs for the domains, rather than the hosting IPs. Sometimes, registrants use nameservers from the same providers they use for hosting, but as the data show, there's not a direct correspondence. Any domain registrant, legitimate or evil, may have their own preferences for nameservers. In the Phishing and Malware threat types, the signal strengths are not dramatically different than what we have seen in some of the other top ten lists. But when we look at the Spam list, that changes!

© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 9

Phishing
Underscoring that the Venn diagram between IP ASNs and nameserver ASNs is not a circle, only two of the ASNs in this table (AS-PNAPOSK Internap Japan Co.,Ltd., JP and INTERNET-IT from Seychelles) are also in the Phishing table for IP ASN. In most respects, the signal strengths and the counts are relatively modest in this table.

24295 Internap Japan Co.,Ltd. (JP) 200313 INTERNET IT COMPANY (SC) 44592 SkyLink Data Center BV (NL) 30860 Virtual Systems LLC (UA) 395839 HOSTKEY (US) 17623 China Unicom Shenzen network (CN) 57724 DDoS-Guard Ltd (RU) 43317 FISHNET COMMUNICATIONS LLC (RU)
Hong Kong Communications International Co., 140227 Limited (HK) 133199 SonderCloud Limited (HK)

Signal Strength Phishing Malware Spam Neutral

897.09

283

346

827

23

449.97

611

124 1187

99

393.88 134.23

1799 637

322

737

333

90

684

346

109.36

6

105 7155

4

66.02 49.53

5373 2188

4114 309

1021 1124

5934 3221

37.33

831

58

308

1623

36.08

145

34.66

145

140

770

293

136

772

305

Malware
There is not a great deal of overlap in this category with the Phishing nameserver ASNs nor with the Malware IP ASNs. There are a couple of outliers on this list in terms of the domain counts,, with the last four ASNs on the list having six-digit counts of both Malware and Neutral domains.

395839 HOSTKEY (US) 24295 Internap Japan Co.,Ltd. (JP) 200313 INTERNET IT COMPANY (SC) 44592 SkyLink Data Center BV (NL) 40065 CNSERVERS LLC (US) 17623 China Unicom Shenzen network (CN) 134543 China Unicom Guangdong IP network (CN) 21859 Zenlayer Inc (US) 4837 CHINA UNICOM China169 Backbone (CN)

Signal Strength Malware Phishing Spam Neutral

855.24

105

6 7155

4

490.12

346

283

827

23

40.81

124

611 1187

99

31.50

322

1799

737

333

30.42

4158

85

244

4453

22.59

4114

5373 1021

5934

21.27 155133 13159 68638 237662

20.81 172624 14648 80632 270254

16.16 168034 16602 74860 338780

© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 10

9808 China Mobile Communication Co.Ltd. (CN)

15.60 177030 16117 88604 369803

Spam
The Spam signal strength for HOSTKEY-USA is not a typo. That signal of over 90,000, is almost ten times as strong as the next-highest, the #1 IP ASN for Spam. A look at the domain counts explains it: we found over 7,000 spam domains using this ASN for their nameservers, and only 4 neutral domains.

Signal Strength

395839 HOSTKEY (US)

90,200.93

327790 Wirels Connect (PTY) (ZA)

5,166.45

24295 Internap Japan Co.,Ltd. (JP)

1,813.17

18068 Dream Wave Shizuoka Co. Ltd. (JP)

1,103.34

57043 HOSTKEY B.V. (NL)

1,063.89

200313 INTERNET IT COMPANY (SC)

604.61

44901 BELCLOUD (BG)

316.19

4686

BEKKOAME BEKKOAME INTERNET INC. (JP)

292.90

61272 IST-AS (LT)

220.85

134771 CHINATELECOM-ZHEJIANG-WENZHOU-IDC (CN)

189.63

Spam Phishing Malware Neutral

7155

283

346

4

1127

611

124

11

827 4923

1799 637

322

23

90

225

3671 1187

6 5373

105

174

4114

99

3806 3909

2188 831

309

607

58

673

3749

145

1775

145

140

856

136

472

IP Geolocation
This category examines hotspots of malicious activity by the country code of the IP address hosting the domains in question. Unlike the ASN categories for both IP and nameserver, this category showed much milder spreads in signal strength. This may qualify to some readers as another myth busted: that IP hosting region is a strong indicator of maliciousness. There are much higher numbers of malicious domains hosted in Russia and the United States, for example, than in any of the countries in any of the following three tables. However, relative to the numbers of neutral domains also hosted in Russia and the US, the malicious ones are not particularly strongly represented.
Phishing
These are the top ten countries of hosting, as sorted by Phishing signal strength. Hong Kong stands out with a relatively high number of domains in each of the categories compared to the others. However, its signal strength of 7.52 is not particularly strong. Takeaway: you may be more likely, statistically, to see a phishing domain that is hosted in Hong Kong, but if you're doing forensic work on a Hong Kong-hosted domain whose nature is

© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 11

unknown, there's not an especially strong indication that it is a phishing domain. As the Malware and Spam tables show, in fact, that Hong Kong domain is more likely to be involved in one of those other threat types.

SC (Seychelles) BZ (Belize) PA (Panama) KH (Cambodia) HK (Hong Kong) LU (Luxembourg) BE (Belgium) MU (Mauritius) MD (Moldova) NG (Nigeria)

Signal Strength

Phishing

76.86 617

54.15 2780

23.20 399

14.77 105

7.52 21627

5.41 990

4.38 8156

4.24 59

4.15 325

3.93 77

Malware 285 167 95 17
133780 1093 1616 1496 364 33

Spam 80
263 132
50 77807
796 543 356 1661
9

Neutral 612
3914 1311 542 219340 13962 141805 1061 5965 1495

Malware
Using Hong Kong as an example again, here we see a datapoint that has both a relatively high signal strength and a relatively high count of domains compared to its peers in the category. In fact, while the law of small numbers is fairly pervasive in this study, Hong Kong's representation in all three threat types is an outlier.

MU (Mauritius) HK (Hong Kong) SC (Seychelles) MN (Mongolia) LU (Luxembourg) PA (Panama) CN (China) MD (Moldova) PH (Philippines) BZ (Belize)

Signal Strength 73.60 31.84 24.31 14.72 4.09 3.78 3.37 3.19 2.52 2.23

Malware 1496
133780 285 470
1093 95
13119 364 193 167

Phishing 59
21627 617 16 990 399
3329 325 17
2780

Spam 356
77807 80
927 796 132 3016 1661 2571 263

Neutral 1061
219340 612
1667 13962
1311 203108
5965 3998 3914

Spam
If you're looking for quick ways to identify domains as being "spammy," IP hosting geolocation is not the way to go about it. Neither the signal strengths nor the absolute numbers in this category will do much to (statistically

© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 12

speaking) forecast whether a domain is involved with spam. Compare this, for example, to that Spam signal we saw in the previous category (Nameserver ASN), which was over 90,000, and you see what we mean.

PH (Philippines) MN (Mongolia) HK (Hong Kong) MU (Mauritius) MD (Moldova) TW (Taiwan) SC (Seychelles) PA (Panama) KH (Cambodia) KR (South Korea)

Signal Strength 46.94 40.59 25.89 24.49 20.33 9.97 9.54 7.35 6.73 6.71

Spam 2571 927
77807 356
1661 6592
80 132
50 6673

Phishing 17 16
21627 59
325 300 617 399 105 2122

Malware 193 470
133780 1496 364 667 285 95 17 2729

Neutral 612
3914 1311 542 219340 13962 141805 1061 5965 1495

Domain Registrars
While the GDPR has veiled a considerable amount of the registrant information that can help researchers or defenders cluster domains, those domains still have to be registered somewhere, and the domain registrar is always shown in a Whois record. Therefore, we judged that registrar would be a useful category for searching for signals of malicious activity across the Internet's active domains.
We found a modest level of overlap among the top-ten registrars in each of the threat types. In fact, only one registrar, DOMAINNAME BLVD, INC, was represented in all three categories--perhaps surprising, since it is a very small registrar with fewer than 1,500 domains in total. (The largest registrar in our lists by domain count, GMO Internet, Inc. d/b/a Onamae.com, registered over 600,000 domains.) Signal strengths in this category are not extreme, though in terms of counts, there are some registrars with many thousands of malicious domains associated.
Phishing
Three registrars in our top-ten list have over 10,000 domains associated with them; the largest, NameSilo, LLC, has nearly 77,000. NameSilo, in fact, has five-digit counts of malicious domains in all three threat types, and the total number of malicious domains registered through them is not dramatically lower than the number of neutral domains. So in terms of overall impact, it outweighs the others in the list; but from a signal strength perspective, it is not particularly notable.

© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 13

Eranet International Limited NICENIC INTERNATIONAL GROUP CO., LIMITED ALIBABA.COM SINGAPORE E-COMMERCE PRIVATE LIMITED Squarespace Domains LLC Shinjiru Technology Sdn Bhd NameSilo, LLC CNOBIN INFORMATION TECHNOLOGY LIMITED Beget LLC Registrar of Domain Names REG.RU LLC DOMAINNAME BLVD, INC.

Signal Strength 70.49 51.92

Phishing

Malware

3534

6976

1041

2253

Spam Neutral

3027 212

2038 815

40.33 21.63 15.59 12.04 11.40 11.29 10.25
9.44

30366 1899 1050
76846 382
1049 15649
49

41637 416 137
96161 363
1010 10317
1099

5343 3
140 21443
585 90
2263 73

30608 3569 2737
259336 1362 3776
62085 211

Malware
While there were no dramatic outliers among the registrars, we did see a substantially higher maximum signal strength in Malware than with the other two threat types. That said, this was the most extreme case of small numbers in the entire report: there were exactly zero Phishing or Spam domains associated with Tname Group Inc, a fairly small registrar with fewer than 1,600 domains all-in. But of those, only 45 were neutral, with the remainder all in the Malware category.

Tname Group Inc. Global Domain Name Trading Center Ltd DOMAINNAME BLVD, INC. DomainName Highway LLC FLAPPY DOMAIN, INC. DOMAINNAME FWY, INC. DotMedia Limited DomainName Path, Inc. Xiamen Domains, Inc. Domain International Services Limited

Signal Strength 929.93 331.07 143.21 119.36 114.91 111.57 102.30 99.61 99.30 97.81

Malware 1522 4672 1099 1832 1747 909 1053 1826 1600 9480

Spam Phishing Neutral

0

0

45

1167

56

388

73

49

211

19

75

422

86

61

418

48

44

224

57

57

283

86

71

504

68

78

443

387

181

2665

© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 14

Spam
While there are a lot of spam domains on the Internet, as any email user can attest, there are not many registrars that stand out as strongly associated with spam, especially in terms of a combination of signal strength and numbers. Global Domain Name Trading Center Ltd shows a strong (for the category) signal of 158.18, but has only 1167 Spam domains associated with it. The aforementioned GMO Internet, Inc. d/b/a Onamae.com has almost 150,000 Spam domains associated with it; but it also has a lot of neutral domains. It has some impact, therefore, but is not a strong forensic signal to the investigator or analyst faced with a domain of unknown intent.

Signal Strength

Global Domain Name Trading Center Ltd

158.18

Hongkong Domain Name Information Management Co., Ltd.

106.29

Eranet International Limited

78.11

Hong Kong Juming Network Technology Co., Ltd

43.27

Gname.com Pte. Ltd.

22.77

CNOBIN INFORMATION TECHNOLOGY LIMITED

22.59

Zhengzhou Century Connect Electronic Technology Development Co., Ltd

22.39

Cloud Yuqu LLC

20.32

GMO Internet, Inc. d/b/a Onamae.com

19.86

DOMAINNAME BLVD, INC.

18.19

Spam

Phishing Malware Neutral

1167

56

4672

388

8153

239

5663 4034

3027

3534

6976 2038

4759

303

5652 5784

3136

251

1865 7242

585

382

363 1362

487 1906 149964
73

16 561 8182
49

552 2973 71635 1099

1144 4934 397130
211

SSL Certificate Authorities
For the first time in DomainTools Report history, we have explored a category in which the data did not turn up ten entities that all had signals of maliciousness in each of the threat types. As a consequence, the tables below have an unfamiliar color in them: green. As a reminder, a signal strength of 1.00 is entirely neutral. Every data point in the other categories of this report has a signal strength greater than 1.00, indicating that domains sharing that data point have a higher concentration of malicious domains than their lower-signal peers. For the certificate authorities (CAs) associated with domains, however, fewer than ten had a positive correlation with maliciousness for any of the threat types. In Phishing and Spam, fully half of the CAs were more associated with good domains than bad, and in Malware, four of the ten also had sub-1.00 signals.
That a big and popular CA such as GoDaddy had a "green" signal may not have been especially surprising, but one of the CAs most often pilloried for associations with malicious domains--Let's Encrypt--actually had positive signals in every threat type. Almost as surprising were the results for the "non-CA": self-signed certificates, which showed a weak signal of 5.36 for Spam, but had a perfectly neutral 1.00 for Phishing and a barely-registering malicious signal of 1.09 for Malware. So, as we saw earlier, a given data point for a domain--in this case, a

© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 15

self-signed certificate or one from Let's Encrypt--does not have the forensic significance, in and of itself, that many practitioners might assume it does.
(Having said this, it is very important to note that such certificates can, in certain contexts, absolutely be a signal of maliciousness: consider a domain that spoofs a well-known brand or resource with a look-alike domain name. If this domain has a self-signed or a Let's Encrypt certificate, then within this specific context, the certificate absolutely does take on an incriminating aspect.)
Phishing
If it were not for the five "green" CAs in the list, the Phishing table would be unremarkable. Neither the absolute numbers of domains nor the malicious signal strengths particularly stand out.

CN=ZeroSSL RSA Domain Secure Site CA,O=ZeroSSL,C=AT
CN=Cloudflare Inc ECC CA-3,O=Cloudflare\, Inc.,C=US CN=TrustAsia TLS RSA CA,OU=Domain Validated SSL,O=TrustAsia Technologies\, Inc.,C=CN CN=Encryption Everywhere DV TLS CA G1,OU=www.digicert.com,O=DigiCert Inc,C=US CN=cPanel\, Inc. Certification Authority,O=cPanel\, Inc.,L=Houston,ST=TX,C=US
Self-signed
CN=GTS CA 1D4,O=Google Trust Services LLC,C=US
CN=R3,O=Let's Encrypt,C=US
CN=Amazon,OU=Server CA 1B,O=Amazon,C=US CN=Go Daddy Secure Certificate Authority G2,OU=http://certs.godaddy.com/repository/,O=GoDaddy.co m\, Inc.,L=Scottsdale,ST=Arizona,C=US

Signal Strength Phishing Malware Spam Neutral

5.72

600

918 332 20,014

5.47 25,611 28,745 16,380 893,104

3.36

196

892 3,036 11,127

1.41

2,215

1,938

779 298,816

1.02

8,308

6,063 2,785 1,557,273

1.00

597

708 1,801 114,094

0.91

278

659 329 58,261

0.87 38,478 43,783 20,363 8,462,729

0.56

319

675 158 108,360

0.31

493

777

27 301,303

Malware
For this threat type, the overall picture is very similar to Phishing. Let's Encrypt shows a slightly non-malicious signal in Malware, but we'll acknowledge that for anyone who fell victim to one of the roughly 44,000 Malware, 38,000 Phishing, or 20,000 Spam domains using that certificate, its relative innocence might be a hard sell.

© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 16

Signal Strength Malware Spam Phishing Neutral

CN=TrustAsia TLS RSA CA,OU=Domain Validated SSL,O=TrustAsia Technologies\, Inc.,C=CN

14.05

892 3,036

196 11,127

CN=ZeroSSL RSA Domain Secure Site CA,O=ZeroSSL,C=AT

8.04

918

332

600 20,014

CN=Cloudflare Inc ECC CA-3,O=Cloudflare\, Inc.,C=US

5.64 28,745 16,380 25,611 893,104

CN=GTS CA 1D4,O=Google Trust Services LLC,C=US

1.98

659

329

278 58,261

CN=Encryption Everywhere DV TLS CA G1,OU=www.digicert.com,O=DigiCert Inc,C=US

1.14

1,938

779 2,215 298,816

CN=Amazon,OU=Server CA 1B,O=Amazon,C=US

1.09

675

158

319 108,360

Self-signed

1.09

708 1,801

597 114,094

CN=R3,O=Let's Encrypt,C=US

0.91 43,783 20,363 38,478 8,462,729

CN=cPanel\, Inc. Certification Authority,O=cPanel\, Inc.,L=Houston,ST=TX,C=US

0.68

6,063 2,785

8,308 1,557,273

CN=Go Daddy Secure Certificate Authority G2,OU=http://certs.godaddy.com/repository/,O=GoDaddy.com\, Inc.,L=Scottsdale,ST=Arizona,C=US

0.45

777

27

493 301,303

Spam
While this observation is true across all three threat types, we'll mention it here: the CAs are the same set of ten across all three threat types. The Venn diagram is a circle. Most of the categories earlier in the report had some degree of overlap, in some cases quite a bit. This is the first time in DomainTools Report history, though, where the exact same entities were in the top ten in every threat type (albeit in different orders).

© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 17

CN=TrustAsia TLS RSA CA,OU=Domain Validated SSL,O=TrustAsia Technologies\, Inc.,C=CN
CN=Cloudflare Inc ECC CA-3,O=Cloudflare\, Inc.,C=US
CN=ZeroSSL RSA Domain Secure Site CA,O=ZeroSSL,C=AT
Self-signed
CN=GTS CA 1D4,O=Google Trust Services LLC,C=US CN=Encryption Everywhere DV TLS CA G1,OU=www.digicert.com,O=DigiCert Inc,C=US
CN=R3,O=Let's Encrypt,C=US CN=cPanel\, Inc. Certification Authority,O=cPanel\, Inc.,L=Houston,ST=TX,C=US
CN=Amazon,OU=Server CA 1B,O=Amazon,C=US CN=Go Daddy Secure Certificate Authority G2,OU=http://certs.godaddy.com/repository/,O=GoDaddy.com\, Inc.,L=Scottsdale,ST=Arizona,C=US

Signal Strength
92.71 6.23 5.64 5.36 1.92
0.89 0.82
0.61 0.50
0.03

Spam Phishing Malware Neutral

3,036 16,380
332 1,801
329

196 25,611
600 597 278

892 28,745
918 708 659

11,127 893,104
20,014 114,094 58,261

779 20,363

2,215 38,478

1,938 298,816 43,783 8,462,729

2,785 158

8,308 319

6,063 1,557,273 675 108,360

27

493

777 301,303

Conclusion
We consider the DomainTools Report an effort to identify "hotspots" of malicious activity across the Internet. We do this in part to help point investigators and researchers toward forensic data points that will be useful in helping make sense of Internet infrastructure of unknown quality or nature. We also use the information to help inform our research and development efforts, as we seek to develop ever-more-accurate algorithms for predicting the nature of a given domain.
But some of these hotspots are like neutron stars: very high "heat" and density (Signal Strength), very low size (number of domains). As forensic indicators, these data points are not likely to make a big impact for most organizations, as the odds of coming across any of the domains tied to them are low. On the other hand, we do consistently observe some data points with meaningful numbers of malicious domains, and in some cases these come with meaningful signal strengths. Such data points represent clusters of activity where a real impact is being felt by victims.
This edition of the report represents a milestone: we have developed an automated means of recording the data that underpins this study. In figure reports, we expect to provide trend information, showing where there is growth or recession in the numbers and signals of malicious domains across the Internet. We hope that this and future editions will be useful to others who, like the DomainTools team, are passionate about making the Internet a safer place for everyone.

© COPYRIGHT DOMAINTOOLS 2021 | SALES@DOMAINTOOLS.COM | (206) 838-9020 | WWW.DOMAINTOOLS.COM | 18

