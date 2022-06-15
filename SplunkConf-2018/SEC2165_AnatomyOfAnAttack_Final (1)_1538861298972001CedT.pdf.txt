Anatomy of an Attack
And How to Stay Ahead with Cisco and Splunk
Victor Pichs & Jan Dembowski
September 2018

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Raw data does not equal threat intelligence
3

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Relationship Of Data, Information, and Intelligence

Operational environment

Data

Information

Intelligence

Collection
Source: Joint Intelligence/Joint Publication 2.0 (Joint Chiefs of Staff)

Processing and
exploitation

Analysis and
production

Umbrella's view of the internet

125B
requests
per day

90M
daily active
users

16K
enterprise
customers

160+
countries
worldwide

© 2018 SPLUNK INC.

Know Your Enemy

6

© 2018 Cisco and/or its affiliates. All rights reserved. Cisco Confidential

© 2018 SPLUNK INC.
Cybercrime ­ Products, Services, and Goods

Products
 Malware ­ RATs, banking trojans, ransomware, etc.
 Brute force tools and account checkers
 Vulnerabilities and Exploits

Services  Bullet Proof Hosting  DDOS services  Ransomware as a service  Installs and traffic  Exploit Kit  Cash out and exchangers

Goods  Credit card dumps  Fullz information and PII  Database dumps

Malspam Campaign: Host-based
& Hybrid BPH

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Alex BPH harvests a variety of toxic content

Malware Ransomware Phishing Crimeware forums Credit card dump shops

9

Path Of Malspam Attack

© 2018 SPLUNK INC.

Phishing
1 Phishing email sent from delta@performanceair.com
!

2 Victims click on malicious URLs
myhearthstonehomes.org ourrealtyguy.info ourrealtyguy.org ourrealtyguy.us package2china.com

3 Malicious word doc drops Hancitor

6 Infection on device and positioned for data extraction

5 Trojans (Pony, Evil Pony, Zloader) make C2 call for extra malware or functionality
mebelucci.com.ua uneventrendi.com lycasofrep.com rinbetarrab.com

4 Hancitor makes C2 call to domains for trojans
uneventrendi.com ketofonerof.ru thettertrefbab.ru

© 2018 SPLUNK INC.

Malicious Malspam !

Maldoc URL

Campaign

hxxp://myhearthstonehomes[.]org/i.php?d=
Reference: hazmalware.wordpress.com

August 30: Peak of Malicious Redirect

© 2018 SPLUNK INC.

Insight into the IP Network

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
An AWS IP abused by Alex' BPH and offered to criminal customers to host malspam attack domains

© 2018 SPLUNK INC.
Known Malicious Domains on the Same IP

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Insight into `Heymamaradio.Com' Malicious IP Hosting
Domain is a compromised domain used for malspam attacks. IPs in green are the legitimate registrar's initial hosting IPs. IPs in red are all criminal hosting IPs offered by the bulletproof hosting provider. IPs in purple (subset of the red set) are AWS IPs and are part of the criminal hosting IP space operated by the BPH provider. The BPH provider abuses AWS IPs and offers them as hosting space to his criminal customers.

Phishing urls

are hosted on

AWS cloud

Alex

services

BPH 2 Dedicated small time BPH and abused hosters

© 2018 SPLUNK INC.

Overarching Patterns Across a Dozen Malspam Campaigns

Malspam
Spoofed sender domain
Phishing

Campaign 1
performanceair.com myhearthstonehomes.org

Campaign 2
uspackagers.com downetwpnj.net

Hancitor C2 thettertrefbab.ru

Hedtfortedlet.ru

Pony C2

mebelucci.com.ua

crabbiesfruits.com

EvilPony C2 uneventrendi.com

orcateheck.com

Zloader C2 lycasofrep.com

rebjusjohed.com

© 2018 SPLUNK INC.
Splunk Add-on for Cisco Umbrella Investigate

INVESTIGATE
domains, IPs, ASNs, file hashes API

Automatically enrich security alerts inside Splunk, allowing analysts to discover the connections between the domains, IPs, and file hashes in an attacker's infrastructure.

Key Benefits of Investigate Add-on

© 2018 SPLUNK INC.

Complete view of an Better prioritize

attack

incident response

Uncover missing connections

Speed up investigations

How it Works

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Q&A

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

