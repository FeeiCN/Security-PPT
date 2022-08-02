SESSION ID: MASH-R02
Threat Hunting Using 16th Century Math and Sesame Street
Vernon Habersetzer, CISSP, EnCE, GCFA, GCFE,
GCIH, CISA, CFE, GREM, GCIA
Hunt Team Lead Walmart Stores, Inc. @HuntingNomad
#RSAC

#RSAC
It's 1983...
2

#RSAC
Fast Forward 16 years to 1996... Networking, 2600 and phrack
3

#RSAC
THREAT HUNTING AT SCALE
Every pixel represents an IP in this 1MP image...
200 servers could fit inside this glowing light
You have five hours to find the evil IP. Oh...and there may not be one.
4

#RSAC
THREAT HUNTER'S GOAL
Make it difficult for adversaries to hide!
5

#RSAC
HOW?
Sometimes we get "Hunter's Block"TM We need a new approach!
6

#RSAC
HOW?
We tend to focus too much on granular threat detection. We need to look at threat detection more openly.
7

#RSAC
HOW?
Our focus should be on hunting methods that: · Are scalable and sustainable · Transcend attack specifics (as much as possible)
· Try as you may, you'll never create enough granular detection logic to catch every variation of malicious behavior
· TTP-based hunting should not be overlooked, but try to keep logic open
8

#RSAC
THREAT HUNTING AT SCALE
Think about the scale
9

#RSAC
THREAT HUNTING AT SCALE
Let's double the size of the network....2 million IPs?
10

#RSAC
THREAT HUNTING AT SCALE

Let's triple the size....3 million IPs, 8B connections per day!

200 servers

The numbers seem to be against you!

Unless you use them to your advantage...
11

#RSAC
Begin caffeine intake now!
12

#RSAC
PROBABILITY THEORY
Gerolamo Cardano knew we'd be threat hunting someday!
"The mathematical theory of probability has its roots in attempts to analyze games of chance by Gerolamo Cardano in the sixteenth century"
-wikipedia
13

#RSAC
THE LAW OF LARGE NUMBERS
In probability theory... "The law of large numbers is a theorem that describes the result of performing the same experiment a large number of times" - wikipedia
14

#RSAC
THE LAW OF LARGE NUMBERS
According to the law... The average of the results obtained from a large number of trials should be close to the expected value, and will tend to become closer as more trials are performed.
15

#RSAC
TWEAKING THE LAW OF LARGE NUMBERS
Let's change it slightly for our purposes...
The average of the results obtained from a large number of trials events should be close to the expected value (benign), and will tend to become closer as more trials are performed events are analyzed.
If we apply the LoLN to the average network, most events should be benign! Otherwise...
16

#RSAC
FOCUS ON RARE EVENTS
Here's the point: If we believe most events are benign, shouldn't we be
looking for rare events?
17

#RSAC
FOCUS ON RARE EVENTS
Most attacks introduce something new (rare) to the environment:
­ Domains ­ IPs ­ Hashes ­ Registry Values ­ Services ­ Scheduled jobs
18

#RSAC
FOCUS ON RARE EVENTS
Early childhood threat hunting course
Identifying anomalies immediately without knowing what to look for
ahead of time
19

#RSAC
FOCUS ON RARE EVENTS
What if you could tell whenever a critical asset started acting differently than the rest? What if 1 out of 200 Domain Controllers started: · Using a new network protocol? · Talking to a new network segment? · Running a new process?
ATMs, POS devices, mail servers, web servers, DNS servers, etc.
20

#RSAC
FOCUS ON RARE EVENTS
Remember the glowing light
21

FOCUS ON RARE EVENTS
22

#RSAC
HTTP to 10.x.x.x:4444 ZIP File leaving via SMB Large upload to DropBox 1.exe copied to the server RDP from a dev workstation

How to Find Rare Events

#RSAC
REQUIREMENTS
You probably have one or more of these:
­ Proxy logs ­ Full packets ­ Netflow ­ Bro logs ­ Centralized Endpoint logs (or a way to query them in mass)
o Registry values o Scheduled tasks o Security event logs o Running processes, etc. ­ Any logs that record connections or running processes!
24

#RSAC
REQUIREMENTS
Asset Tagging (Describing the host type for each IP)
­ Tag as many as possible, focusing on critical assets ­ Sources: Active Directory, DNS, asset management solutions, internal
wikis and databases, vulnerability management solutions, etc. ­ How to scrape AD for hostnames and IPs: ­ Nltest /dclist:<domain> ­ Powershell script:
o https://bit.ly/2Kjeyqc
25

#RSAC
HOW TO FIND RARE EVENTS Let's focus on using network traffic logs / packets
26

CORRELATING ASSET LISTS AND LOGS
Asset tagging is extremely valuable!

#RSAC
Basic correlation: Join asset and log tables by IP fields

List of Asset IPs Network Logs

27

#RSAC
CORRELATION QUERY EXAMPLE
Query results show protocols used by each asset type
28

#RSAC
BRO USERS
If you use Zeek (Bro): · SQLite filter option beginning in version 2.2
https://docs.zeek.org/en/stable/frameworks/logging-input-sqlite.html
29

#RSAC
HOW TO FIND RARE EVENTS
Multiple ways to find rare events. Here are three that work!
1. Define a bad behavior, find outliers exhibiting that behavior 2. Tag assets by type, find outliers by specific types of artifacts (protocol,
IP, network, files, running processes, etc.) 3. Tag assets by type, define many characteristics, find outliers
The last two require asset tagging, which is WELL worth the effort!
30

#RSAC
HOW TO FIND RARE EVENTS
Let's start with this one: Define a behavior, find outliers exhibiting that behavior
(Doable without asset tagging)
31

#RSAC
HOW TO FIND RARE EVENTS

Table named 'proxy_logs' with millions of rows:

ip.src 192.168.21.54 10.4.22.24 10.4.22.24 172.16.23.187 10.42.5.77

domain taboola.com facebook.com facebook.com ff5ee.com disorderstatus.ru

method POST POST GET POST POST

32

#RSAC
HOW TO FIND RARE EVENTS
Utilize the COUNT, DISTINCT, and GROUP BY functions of SQL
SELECT domain, COUNT (DISTINCT ip.src) FROM proxy_logs WHERE <insert bad behavior query> GROUP BY domain ORDER BY COUNT (DISTINCT ip.src) DSC;
Example "bad behavior" criteria for basic C2 hunting: · HTTP POST without a GET · No referer · Content type = application / octet-stream · No cookies
33

HOW TO FIND RARE EVENTS

domain

The unicorns start vertamedia.com

appearing! Benign domains are easier to

rubiconproject.com

ignore.

cat.sv.us.criteo.com

taboola.com

adsnxs.com

disorderstatus.ru

ff5ee.com

#RSAC
COUNT (DISTINCT ip.src)
6095 5730 5380 4507 2033 5 3

34

#RSAC
HOW TO FIND RARE EVENTS

Finding new unicorns for a given behavior

C2 Domains - POST

previous-c2-domains
domain
disorderstatus.ru ff5ee.com

Isolate new values NOT method = "post" AND referer IS NULL etc. etc. AND WHERE

in the historical list

domain NOT IN (SELECT domain FROM previous-c2-domains)

New potential C2 domains are more likely to be spotted now!
35

#RSAC
HOW TO FIND RARE EVENTS
Now this one:
Tag assets by type, find outliers by specific types of artifacts (protocol, IP, network, files, running processes, etc.)
Let's pick on protocols!
36

#RSAC
HOW TO FIND RARE EVENTS
SELECT asset.type, protocol, COUNT (DISTINCT ip.src) FROM netflow_log WHERE asset.type='us domain controller' ORDER BY COUNT (DISTINCT ip.src) DSC;
37

#RSAC
HOW TO FIND RARE EVENTS
Taking it to the next level!
Instead of you defining the specific behavior or picking the right artifact, have the behaviors reveal themselves to you! <insert spooky music here>
38

#RSAC
HOW TO FIND RARE EVENTS
Let's work with full packets now...
39

#RSAC

HOW TO FIND RARE EVENTS

Define Traffic Characteristics

Examples:

· HTTP Content type

· File types (by extension and header)

· Byte count ranges (0-100K, 100K-1MB, etc.)

· Directionality (inbound, outbound, lateral) · SSL self-signed certs · Payload entropy levels

Store these in a field named `traffic_characteristics'

· HTTP lacking a specific header value

· HTTP direct to IP request

· Proxy blocked traffic

· Single sided TCP

· Traffic over non-standard ports

· Destination network descriptions

· Transmit payload byte size

· Receive payload byte size

· IP address exists

^^^ this is a dummy rule to give yo4u0 total counts per asset group

#RSAC
HOW TO FIND RARE EVENTS
SELECT asset.type, traffic_characteristics, COUNT (DISTINCT ip.src) FROM packet_log WHERE asset.type='us domain controller' ORDER BY COUNT (DISTINCT ip.src) DSC
https://X.X.X.X:8080/evil.php
41

#RSAC
HOW TO FIND RARE EVENTS
SELECT asset.type, traffic_characteristics, COUNT (DISTINCT ip.src) from packet_log WHERE asset.type=`us domain controller' ORDER BY asset.type, COUNT (DISTINCT ip.src) DSC
Rare events are now easily identified across every type of asset you can tag!
The key is to define a multitude of behaviors using the logs and artifacts available to you.
42

#RSAC
HOW TO FIND RARE EVENTS

Yes, it really does work!

protocol

asset.type

count (distinct ip.src)

<redacted>

43

HOW TO FIND RARE EVENTS
asset.type
Yes, it really does work!

#RSAC
traffic_characteristics count (distinct ip.src)

<redacted>

44

#RSAC
HOW TO FIND RARE EVENTS
Example findings from hunting for rare behaviors · Rare autoruns entry revealed new, custom malware · Rare running process analysis reveals packet capture utility
running on 1 out of 400 critical assets of one type · C2 activity from malware
45

#RSAC
APPLICATION
Applies to many types of artifacts, such as: · Internal country source / destinations pairs · Asset type source / destinations pairs · Registry autorun values · Running processes and services · Listening ports · Hash values · Scheduled Tasks / cron jobs
46

#RSAC
APPLICATION
Query Timeframes · Too short, things may look rare when they aren't · Too long, you may not see an event in a timely manner · 24 hours is a good starting point, experiment from there
47

#RSAC
CHALLENGES
Benign contributors to rare behaviors · Misconfigured machines (someone plugged a dummy IP into software) · Troubleshooting activities (left an odd executable running)
Automated follow-up queries can enrich results to help you determine: · If a rare behavior the next day belongs to the same machine · If several rare behaviors belong to the same machine · If the rare artifact is benign or needs further review
TIP: Start small! Start with Domain Controllers, expand from there.
48

#RSAC
APPLY
1. Identify assets in your environment (automate!):
· Domain Controllers · Mail servers · Critical systems (POS, ATMs, SCADA, R&D, etc.) · IoT
2. Join the asset description table with your event logs (packets, netflow, endpoint, etc.) by IP address
3. Craft queries to group events by asset type and count unique source (or dest) IPs for given sets of behaviors
49

#RSAC
YOU CAN DO THIS!
Remember the glowing light, and how it seemed challenging to identify rare behaviors within that single group?
Use the numbers to your advantage!
50

#RSAC
HOW TO FIND RARE EVENTS
Happy Hunting!
Contact: vernon.habersetzer@walmart.com
@HuntingNomad
51

