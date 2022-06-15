A Detailed Comparison
october 2021
Confidential & Proprietary

Table of Contents

The State of DNS Security

3

Cisco Umbrella® vs. DNSFilter®: Head to Head Comparison

4

Threat Protection

4

Content Filtering

6

Speed

7

Implementation

8

Support

9

Pricing

9

Feature Checklist

10

Conclusion

11

Sources & Resources

12

The State of DNS Security
DNS forms the single largest threat vector for every company. As the "phone book of the internet", accessing DNS occurs thousands of times each day on every internet-connected device. Because DNS is distributed and minimally regulated it has become a playground for bad actors looking to breach your company's systems, execute malware and ransomware, exfiltrate data, and scam innocent users. 

A recent study - The Economic Impact of DNS Security1 - estimated that nearly 35% of data breaches could be stopped by implementing DNS security. In early 2021 the NSA and CISA released guidance2 recommending that companies of all sizes implement a protective DNS (PDNS) strategy, and PDNS has become increasingly important to achieving CMMC compliance - required for contracting federally.

Overall, cybercrime has continued to grow year over year.2 The proliferation of digital crime can be traced to several trends. Most notably: the rise of cryptocurrency, making large ransomware payments untraceable, and the shift to remote work due to COVID-19, creating new vulnerabilities in previously closed corporate systems.

61.9%

70.5%

75.6%

79.2%

77.2%

78.0%

80.7%

86.2%

2014

2015

2016

2017

2018

2019

2020

2021

The number of DNS-based threats detected by DNSFilter®'s domain intelligence tool has grown significantly in the past 12 months. In September 2020 we blocked <10M threats per month. In September 2021 we have blocked more than 20M. 


Average Monthy Threats Blocked ( in Millions)

20 15 10
5 0
JAN 2021

FEB 2021

MAR 2021

APR 2021

MAY 2021

JUN 2021

JUL 2021

AUG 2021

Businesses of all sizes must quickly become more security conscious than ever, and should put in place a layered approach that includes DNS protection. This outer-most layer of the security stack can be implemented in minutes and can immediately eliminate one-third of threats, while providing additional benefits such as content filtering, and increased internet speeds.

3

Cisco Umbrella® vs. DNSFilter®:

Head to Head Comparison
Market research indicates that Cisco Umbrella® (formerly OpenDNS) and DNSFilter® are two of the most widely adopted and popular solutions for DNS protection. In the below sections we outline the differences between the two products including efficacy of threat protection, accuracy of content categorization in some of the most-blocked categories, differences in resolution speed, and overall feature maturity. 

Th n reat Detectio
More than 200,000 new website domains are registered daily and our AI identifies roughly 22% as malicious or suspicious. Malicious sites are sites that are likely to host malware, ransomware, botnets, etc. Suspicious sites include phishing domains that impersonate legitimate sites in an effort to gather user information.
In September 2021 we exported a list of the top 1,000 threat domains detected on our network. Domain-based threats often exist for a short period of time - once they have been detected as a threat and noted on static threat feeds they are no longer effective and are taken down by the hackers that run them. So any threat blocking test must be performed using a list that includes zero-day threats which have not yet been identified.
Additionally, to ensure impartial results, we ran this list of threats through VirusTotal, a third-party, free tool that is widely used to determine whether a site is malicious or not.
To measure the efficacy of DNS protection software, the domains blocked by that software should match closely with the domains marked as a threat by VirusTotal. We ran our list of top 1,000 threats through VirusTotal and found 90% agreeance - a strong correlation.
We then used these threats to perform a head-to-head test against Cisco Umbrella while using a policy configuration that should be reasonably expected to block threats in the categories ofÜ
ð Malware/ransomwarÕ ð BotneÏ ð Phishing & Deception

Cisco Umbrella Threat Blocking Performance

Malware

Botnet

Phishing & Deception

21.2%

100%
ALLOWED

95.7%

4

Phishing Sites Detected by DNSFilter
Cisco Umbrella® performs poorly in protection against botnets, as well as phishing and deception. Phishing sites are among the most difficult to detect because they do not host any malicious code - they rely on social engineering, such as posing as a trusted brand or pretending to offer an in-demand product. 


Threat Detected June 1, 2021 Threat Detected December 17, 2020

Threat Detected January 21, 2021

Threat Detected February 25, 2021

Threat Detected July 8, 2021

According to Google Safe Browsing there are now 75x more phishing sites than malware sites4. They represent a significant threat as they are difficult to detect, so it is essential that any DNS protection product adequately identify and block phishing and scam sites, protecting employees from entering their data into deceptive form fields or purchasing fraudulent products.

5

Content Filtering
In addition to blocking threats, both Cisco Umbrella® and DNSFilter® offer robust content filtering. This allows companies to block inappropriate and/or time waster content. We tested the efficacy of categorization in our most blocked categories:


Adult content
63.6%
ALLOWED

Drugs
78.1%
ALLOWED

90%
Umbrella's content categorization performs well for Peer-to-Peer sites and gambling, where it catches close to 90% of known sites, but performs poorly in the categories of Adult (the most commonly blocked content category), Drugs, and Terrorism & Hate.

Gambling
13.1%
ALLOWED

P2P & Illegal
11.6%
ALLOWED

46%
While Cisco Umbrella offers more content categories for blocking (109 to DNSFilter's 36), their content categorization fails to correctly identify more than 46% of sites across all categories.

Terrorism & Hate

Weapons

71.2%
ALLOWED

37.9%
ALLOWED

37%
37% of weapons sites and 73% of terrorism & hate sites that DNSFilter identifies, Cisco Umbrella does not. This is despite Cisco's breakdown of these classifications into more categories including: hate/discrimination, terrorism, weapons, and illegal activities.

6

Most-Blocked Categories on the DNSFilter Network
The following graph shows which categories are most important for DNSFilter users to block. We expect the same categories matter for Cisco users.

100%
66%
33%
0%

CrypSthoomipnpiinngg

SPeraorxcyHhASa&lEocFcnickiogiliWathnnleeogebrlNs&emA&&TtCaviTrProlwioaaoo&dbcrcraatkCkiknceiahnlrccnagsesgto

TeurnrcoAaridtsveWemgero&atirpiHsiozanentdgse

Drugs
Personal

&

Malware PhishiAndgPu&2lPtDe&C IcBolenlopetttiegnoneatlnt
Gambling

Dating

Speed & Network
Speed is crucial for DNS resolution. If you are not currently running a protective DNS product, your DNS resolution takes place via your ISP - they process the request, find the correct domain, and return the content. Adding a layer of DNS protection re-routes the DNS requests to your chosen protective resolver (Umbrella or DNSFilter®). If you choose a slow resolver this can drag down the speeds with which pages and content load. 

Cisco Umbrella® has a consistent resolution speed of roughly 22 milliseconds, ranking between 5th and 7th globally. DNSFilter® has a resolution speed of roughly 14 milliseconds, and 6 milliseconds in North America, making it the 1st or 2nd fastest resolver in every region according to third party tool DNSPerf5. 


Speed in Milleseconds

CISCO Umbrella

DNSFILTER

25

20

we are

8.81ms faster

15

10
SEP 2021

NOV 2021

JAN 2021

MAR 2021

MAY 2021

JUL 2021

DNSFilter® now has 76 Anycast locations and more than 150 datacenters globally, and is expanding every month. DNSFilter® has continuously invested in speed and reliability while Cisco has remained stagnant for more than 5 years.


7

Implementation
Some cybersecurity products take months and a team of technical professionals to implement. DNSFilter® can be set up at the network level in under 5 minutes in less than 4 clicks. An administrator simply needs to point their DNS traffic to our resolver and instantly you're blocking threats and filtering content on your network. 

According to G2 surveys, 69% of DNSFilter® customers are live in less than 1 day, and 100% are live in less than 1 month. Versus Cisco Umbrella®, where 45% of implementations take roughly a month to complete.


AVERAGE TIME TO GO LIVE
<1 day <1 month 1-3 months 3-5 months 6-12 months >12 months Never

69%

12%

31%

44%

0%

18%

0%

12%

0%

3%

0%

0%

0%

0%

DNSFilter® has earned G2 badges for ease-of-implementation
 in the following categories:
 Easiest Setu|  Fastest Implementatioy  Most Implementable
One major implementation hiccup a lot of Cisco Umbrella customers experience is with the Cisco Roaming Clients. Implementation is not easy, and the Roaming Clients will often fail after making small changes to policies after initial installation. This leads to time-consuming troubleshooting. 

Not only are DNSFilter's Roaming Clients easy to install, but they're more reliable than Cisco's. DNSFilter also supports Roaming Clients for every operating system while Cisco does not.

8

Support
According to G2, DNSFilter® outperforms competition in all areas of support, including:
 Ä Best RelationshiË Ä Best to do Business Wit¿ Ä Easiest
The quality of our support was rated a 94% versus 84% for Cisco Umbrella®. Our support reps undergo three months of technical training and are available 24/7 to help debug issues and handle critical issues. 

Unlike Cisco Umbrella®, we offer a publicly available product feedback portal which allows users to request new features and view our roadmap. We also offer a suite of reselling resources for our MSP partners to help them sell their clients on DNS protection.

Pricing Structure
DNSFilter® prides itself on transparent pricing - per unit costs with low monthly minimums are accessible on the website, unlike Cisco who requires engagement with a sales rep to see pricing.

Monthly Billing No Contract Purchase as needed Two week free trial

Yearly Billing Yearly (or multi-year) Contract

Purchase in blocks of users Two week free trial

9

Feature Comparison

Feature

Protection against zero-day threats

AI-based domain intelligence tool

36

Content Categories (non-threat)

109

Block Trackers

Active Directory Sync

Lan Proxy / Virtual Appliance
Windows Roaming Client/Agent

MacOS Roaming Client/Agent

Chrome Roaming Client/Agent

iOS Roaming Client/Agent

Via MDM

Android Roaming Client/Agent

Config file only

Roaming client hostname sync

Multi-tenant dashboard

Zapier Integration

All public endpoints accessible.

API endpoint availability IP/URL Filtering SSL Decryption

Limited access to endpoints. IPV4 only. Allow only.

1

Layered Policy Maximum

2

Ability to Enforce 2-Factor Authentication

SIEM Export

76

Number of global datacenters

31

100% Uptime SLA

No contracts

Contracts

1 year minimum

Publicly Available Roadmap
10

Conclusion
Both Cisco Umbrella® and DNSFilter® provide robust threat protection and content filtering for businesses of all sizes. Cisco offers a mature product suite with more integrations. However, DNSFilter is far more accurate at detecting threats in all categories, and is more stringent in key content categorization categories that are popularly blocked by businesses.
 Our customers repeatedly choose DNSFilter over Cisco Umbrella because our threat data is more accurate, our support is accessible, and we are truly committed to our product. Many of our customers who trial both DNSFilter and Cisco are disappointing with the Cisco Roaming Client option and find DNSFilter's easier to use. According to one customer who switched from Cisco to DNSFilter: "[DNSFilter] gives me more peace of mind knowing someone can't inadvertently click on a link and have it go to a known
 malicious website. Even if our other systems fail, I know DNSFilter's got my back." Readers of this whitepaper are eligible for an additional 7 days extension of their trial. Simply click the link below and reference this whitepaper to have your trial automatically extended for 21 days.
BOOK A DEMO
11

Sources & Resources
sg The Economic Impact of DNS Security https://www.globalcyberalliance.org/wp-content/uploads/GCA-DNS-Security-Report.pd
g Selecting a PDNS Provider (NSA & CISA)
https://media.defense.gov/2021/Mar/03/2002593055/-1/-1/1/ CSI_Selecting%20a%20Protective%20DNS%20Service_U00117652-21.PD|
g CyberEdge Group 2021 Cyberthreat Defense Report https://purplesec.us/resources/cyber-security-statistics¡
g Google Safe Browsing Phishing Trends https://www.tessian.com/blog/phishing-statistics-2020¡
g DNSPerf Resolver Speed https://www.dnsperf.com/#!dns-resolver§
qg Methods Used for Domain Testing http://dnsfilter.com/domain-analysis-procedure



F500 Case Study G2 DNS Security Product Comparison Report DNSFilter Data Sheet The Role of DNS in your IT Infrastructure
12

