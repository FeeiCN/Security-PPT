Collecting, Analyzing and Responding to Enterprise Scale DNS Events
Bill Horne Director, Security Research HP Labs
© Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Acknowledgements
Improving CSIRT Skills, Dynamics and Effectiveness
Parts of this material are based on research sponsored by the Department of Homeland Security (DHS) Science and Technology Directorate, Homeland Security Advanced Research Projects Agency, Cyber Security Division (DHS S&T/HSARPA/CSD), BAA 11-02 and the Air Force Research Laboratory, Information Directorate under agreement number FA8750-12-2-0258.

2
2

© Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

This is what we are dealing with...

HP IT supports 6 NGDC and 86 MCS
140+
Windows Domain Controllers

41K+
servers owned by HP IT
450,000
end points protected with anti-virus
1.2 million connected devices

1,500
+ enterprise HPN Routers

11.5M+

2.5B
security events logged per day with

Internet mails per

Manage

day sent/received

150K+

mobile devices
15K+
HPN switches

2,000+ HP IT
managed firewalls

597 IPS
sensors deployed

39,000,000
IP Addresses including 2 contiguous Class A's

970K+
scanned devices for vulnerabilities

450,000
mailboxes managed

3 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

440K+ 300K+ employees +

PCs

contractors

deployed

Security Information and Event Management

firewalls

IDS/IPS

Web servers

Active directory

Anti-virus

VPN

DHCP

2.5 billion events / day

Filtering & Correlation

A few hundred events / day
4 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

5 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Challenges
Tedium Work Force Incentives

Laura Fletcher, Kristin M. Repchick, and Julie Steinke
Barriers and Pathways to Improving the Effectiveness of Cybersecurity Information Sharing Among the Public and Private Sectors
16:00 ­ 17:00 in POTSDAM I

6 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Challenges

The Base Rate Fallacy

An intrusion detection system (IDS) performs deep packet inspection on network traffic

within an organization. The system uses a signature to look for a particular type of

malicious payload and fires an alert if the payload is seen. Given a payload, the IDS is

quite accurate: it correctly classifies the packet as malicious or not 99.9% of the time.

But, suppose that the malicious payload is rare: only 1 out of every 100,000 packets are

expected to have the malicious payload. If an alert fires, what is the likelihood that the

pay:l=oaIDdSisfirmesaalinciaoleurst?
 := payload is malicious

   

   

   = () =      +   ~ (~)

   = 0.999   ~ = 0.001 () = 0.00001

0.999  0.00001    = 0.999  0.00001 + 0.001  0.99999  0.0098

 1  102 

S. Axelsson, "The base-rate fallacy and the difficulty of intrusion detection," ACM Transaction on Information System Security, pp. 186-205, 2000.
7 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

What the analyst sees
8 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

What the analyst does
9 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

DNS

What is the Domain Name System (DNS)?
People think in terms of domain names Computers communicate by IP addresses

www.hp.com

16.110.135.51

DNS maintains the mapping between domain names and IP addresses
11 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

DNS is important for security

Attacks Against DNS Servers
Attacks that use DNS to attack third parties

· Malformed Packets
· Cache Poisoning
· DDoS Reflection & Amplification Attacks

Attacks that use DNS as part of their infrastructure

· Botnet Command and Control
· Data Exfiltration & Tunnelling

12 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Example
Botnet Command and Control
akaajkajkajd.cn? xisyudnwuxu.ru? dfknwerpbnp.biz? mneyqslgyb.info? cspcicicipisjjew.hu?

Attacker can't maintain C&C server at IP address for very
long.
So, registers a random domain name temporarily.

Bot

DNS server

Bot tries a bunch of random names until it finds one that resolves.

13 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Command and Control Server
(mneyqslgyb.info )

Example
Exfiltration

msg1.mydomain.com? msg2.mydomain.com? msg3.mydomain.com? msg4.mydomain.com? msg5.mydomain.com?

msg1.mydomain.com? msg2.mydomain.com? msg3.mydomain.com? msg4.mydomain.com? msg5.mydomain.com?

Bot

DNS server

14 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Authoritative Server for
mydomain.com

Example
Tunneling

msg.mydomain.com? TXT=iodjkwn29skndio1

msg.mydomain.com? TXT=iodjkwn29skndio1

Bot

DNS server

15 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Authoritative Server for
mydomain.com

Our Problem

Challenges in collecting DNS Data

Volume and Detail

250000

Why is this a hard problem?
18B DNS packets move through HP's core data centers every day Logging severely impacts performance The right information is not logged

200000 150000

100000

Events per second

50000

0

1

2

3

4

5

6

17 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Our Approach
End-to-end handling of DNS events

Data Acquisition

Data Analysis & Visualization

Remediation

· Hardware Packet Sniffers · Drop normal traffic, collect the rest · Goal: Throw out 99% of events

· Real-time and near-time analysis · Novel visualizations · Integration with ArcSight SIEM
workflow in SOCs

· Block traffic automatically · Generate threat intelligence

18 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Architecture

Logger

... ...

DNS Server / Cluster DNS Server / Cluster
DNS Packet Capture Appliance

archive

ESM

alerts

web-based detail & drill down

Level 1 Analyst

DNS Packet Capture Appliance
· Filter out 99% of traffic · Tag events (blacklist
matching, DGA detection) · Statistics and diagnostics
19 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Vertica Cluster
· Periodically analyze data for security threats
· Alerting · Data visualization &
exploration

Hunt Team

How do we filter out 99% of the traffic?

Exceptions
Unresolvable queries
· not FQDN, illegal characters, non-existent TLDs
Certain protocols
· Web Proxy Autodiscovery Protocol · Bind version queries
Whitelisted Sources
"Aggregators" Security devices
Blacklisted Queries Whitelisted Queries
85% of queries are for HP authoritative domains The rest we get from Alexa Top 1m

Exception?

n

Source whitelisted?

n

y

Domain

blacklisted?

n

Domain whitelisted?
n Log

20 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

y y
y Drop

Number of Resolutions (log)

Heavy Hitters based Whitelisting
· Each dot represent one of the top 1000 most queried domains
· By choosing domains with >= 50 hosts we cover all the points in the right half-plane
· Further choosing domains resolved more than 10,000 times we cover most of these points
· Choosing the OR of these two conditions covers a large fraction of the traffic (Typically 90%)
· Observation: Very few of these heavy hitting domains are in black lists.
Number of hosts (log)
21 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

DGA Detection and Classification

Logistic Regression Classifiers
Labeled data from: Alexa, reversed malware, takedown/block lists, clustering real data
17 malicious DGA families, 3 suspicious, 2 unknown, and 3 benign
~1.4 million samples in dataset
K-way cross validation
Features
97110 features
Character groups: hex, upper, lower, digit, punctuation, etc.
Characters: 1,2,3-grams, character by position
Length of TLD, top private domain, rest
TLD

foo1.bar2.private-name.co.uk
features

classifier

Bankpatch Expiro

GoZ

...

Virut

Class DGA Valid

Precision 0.99 0.88

Recall 0.90 0.97

22 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Cheating the Base Rate Fallacy
· Look for machines making lots of queries to DGAs or blacklist entries in a short time period
· Assuming false positives are independent (questionable), then the machine is likely actually doing something bad (or is a security researcher!). Confirmed in practice.
· Can this be proved??
This machine made 62 such queries in 4 hours.
23 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Data Exfiltration and Tunneling
Queries
BLGCOFDAGOOOESDULBOOBOOOOOOOOOOOOOOOOOOLDOSESKGKHHF.detacsufbo.ru EUJSFLDAGOOOESDUDBOOBOOOOOOOOOOOOOOOOOOOSSJHGHFCLFOHCHLGHSAHAHU.CHLAAFHLSGHAFGFUOOEUGDKLCSHEKLJBOCOSECHFFUGBSKGDJGGGHOJHJCGJG.KCDOELDUOEGUCUOUHJUA KEGGGFGEKHLGFDFESJOEL.detacsufbo.ru SHUDHFDAGOOOESDUGBOOBOOOOOOOOOOOOOOOOOOEDKDFBBHLEGGJLGUFABHCCU.DHDFFCHHKSHGHAOUBGEGEJLGFHUBDFGUGJDFFEAKFSBFFGSDACGHCSKBHLSCGHH.EHSHHJFHUAAOOGKKSDD AHAUBBJDCCKGSHKLGJGAS.detacsufbo.ru OHDOBHDAGOOESDUGBOOHOOOAOOOOOOOOOOOOOOO.detacsufbo.ru HBSGGCDAGOOESDUUSOOBOOOOOOOOOOOOOOOOOOO.detacsufbo.ru FSBLDDAGOOOESDUUSOOBOOOOOOOOOOOOOOOOOOO.detacsufbo.ru KHFJCDAGOOOESDUGBOOHOOOAOOOOOOOOOOOOOOO.detacsufbo.ru BSGKCDAGOOOESDULBOOBOOOOOOOOOOOOOOOOOOOLDOSESKGKHHF.detacsufbo.ru
Responses (TXT records)
LLCDGHDABOOOSSUHOOOFOOOOOOOOOOOOOOOOOOO KJGDUDABOOOSBSUHOOOFOOOOOOOOOOOOOOOOOOO JJDHUDABOOOSBSUHOOOFOOOOOOOOOOOOOOOOOOO HBEAGDABOOOSBSUHOOOUOOOOOOOOOOOOOOOOOOO KALFCSDAOOOSBSUHOOOFOOOOOOOOOOOOOOOOOOO GHHFDDABOOOSBSUHOOOFOOOOOOOOOOOOOOOOOOO COGOODABOOOSBSUHOOOUOOOAOOOOOOOOOOOOOOO GHHKDGDABOOSBSUHOOOFOOOOOOOOOOOOOOOOOOO
24 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Results
Since June 2014...
Processed 3.75 trillion DNS packets Thrown 11,132 alerts for 3,840 distinct clients to our SOC No reported false positives
Weird things we found that we weren't expecting
If there is a way to construct a malformed packet, it will appear on your network. All sorts of machines do apparently bad things for good reasons
25 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Demo

Lessons Learned
Solve Real Problems
Lots of interesting hard problems come up when you have to solve a real problem.
Get Good Data
If you have (lots of) good data, you can do interesting things.
Technology Isn't Everything
You have to make your technology compatible with the tools, workflow, and mandate of your users.
27 © Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Thank you
© Copyright 2014 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

