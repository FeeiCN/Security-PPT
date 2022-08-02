DDoS ­ Yesterday, Today and tomorrow
Frank Tse, William Guo Nexusguard

Agenda
1 DDoS Introduction 2 DDoS Attack Analysis 3 DDoS Detection and Mitigation 4 Fighting DDoS in Mobile Era 5 FAQ
Page § 2

About us
Nexusguard, incorporated in 2008, is a premium provider of end-to-end, in-the-cloud Internet Security Solutions. Nexusguard delivers solutions over the internet to ensure that our clients enjoy uninterrupted webservice delivery to their users, by protecting them against the everincreasing and evolving multitude of internet threats, particularly Denialof-Service (DDoS) attacks, and other attacks directed at web application software.
Page § 3

What is DDoS
§ A distributed denial-of-service (DDoS) attack is one in which a multitude of compromised systems attack a single target, thereby causing denial of service for users of the targeted system.
§ The flood of incoming messages to the target system essentially forces it to shut down, thereby denying service to the system to legitimate users.
Page § 4

What is DDoS

Zombies on innocent computers

Infrastructure-level DDoS attacks

P5
a ge § 5

Bandwidth-level DDoS attacks

Server-level DDoS attacks (Protocol / Application)

What is DDoS

Page § 6

Credit http://www.wired.com/politics/security/magazine/15-09/ff_estonia_bots

DDoS in the news
Page § 7

Motivation of Cyber Attack
Page § 8

DDoS vs. Hacking Hacking
DDoS
Page § 9

If (Availble){ try

{

SQLi, XSS, CSRF

MITM, Brute Force, Reverse Engineering, Buffer Overflow, RFI, Session Hijacking, Information Leakage, Defacement, something cool

} catch (data)
finally { DDoS }

while (Available){ try
{ DDoS()}
finally { Give_up()}

Trend of DDoS attack

100+Gbps / 70Mpps

POC

Organized

Collaborated

Volume Focus

2008

0-day focus 2009

Page § 10

DJB33X

DDoS Attack ­ Brief History

Packet Generator

Packet Crafter

Page § 11

Creative Attacks

DDoS - Yesterday
2002 root DNS attack All thirteen (13) DNS root name servers were targeted simultaneously. Attack volume was approximately 50 to 100 Mbits/sec (100 to 200 Kpkts/ sec) per root name server, yielding a total attack volume was approximately 900 Mbits/sec (1.8 Mpkts/sec). Attack traffic contained ICMP, TCP SYN, fragmented TCP, and UDP.
Some attack types you might heard of ICMP flood, Ping flood, UDP flood, IP Fragment, SYN flood, Teardrop, ACK flood, RST flood, Land attack, smurf attack, Ping to death, Nuke, ARP Poison, Reflex attack, TCP NULL, XMAS, Malformed TCP flags, PUSH ACK flood, DNS query flood, GET flood, POST flood, authentication flood, de-authentication flood, SIP flood
Page § 12

DDoS - Yesterday
Tools (comes with your OS) Ping, telnet, wget
Tools ( can easily get from internet) hping, scapy, cURL,
Library: Libpcap-dev, libthread, libnet-dev, netinet/*.h, string.h
Simple GET flood in 1 line
for ((i=0;i<100;i++)) do `wget target.com &`; done
Page § 13

DDoS - Today
· Open source, · Cross platform, · More in flow control, · More in application layer
Tools ( can be easily get from internet) apache-killer.pl, slowloris.pl, slowhttptest, LOIC, HOIC, via IRC channel
Library: Libpcap-dev, libthread, libnet-dev, urllib, libpcap-dev, libdnet-dev, socket
Page § 14

DDoS - Today
apache-killer.pl $p = ""; for ($k=0;$k<1300;$k++) {
$p .= ",5-$k"; } $p = "HEAD / HTTP/1.1\r\nHost: $ARGV[0]\r \nRange:bytes=0-$p\r\nAccept-Encoding: gzip\r\nConnection: close\r\n\r\n";
Page § 15

DDoS - Today
Slowhttp `test' -w bytes
start of the range advertised window size would be picked from. Effective in slow read (-X) mode only, min: 1, default: 1
-y bytes,
end of the range advertised window size would be picked from. Effective in slow read (-X) mode only, min: 1, default: 512
-x bytes,
max length of each randomized name/value pair of follow up data per tick, e.g. -x 2 generates X-xx: xx for header or &xx=xx for body, where x is random character, default: 32
-z bytes
bytes to slow read from receive buffer with single read() call. Effective in slow read (-X) mode only, default: 5
Page § 16

DDoS ­ Tomorrow
· 0-day focused · Standardized ­ part of worms and bots · DDoS as a project, in a team · Focus on target application
Tools: HashDDoS ­ DJB33X, protocol fuzzer, iFrame bot, js bot, Unicornscan (2007), plug-in for worms, mobile bots
DDoS as a Service: DDoS attack repository, open DDoS `testing' server, RFC for DDoS, "Like" this attack, DDoS `app' market, auto CAPTCHA breaking
Page § 17

DDoS ­ Tomorrow
Internet is designed for inter-connect, goodwill in self-discipline
Internet is NOT designed for security.
TCP is : designed for state-ful, connection-oriented connection,
TCP is NOT: temper proof synchronized source authenticate sensitive to intercept (MITM)
Page § 18

DDoS ­ Tomorrow
Unicronscan (http://www.unicornscan.org/ ) Unicrons are fast!
Asynchronous stateless TCP scanning with all variations of TCP Flags. Asynchronous stateless TCP banner grabbing Asynchronous protocol specific UDP Scanning
Page § 19

DDoS ­ Tomorrow
Web Shell

Page § 20

Credit http://ddos.arbornetworks.com/2012/02/ddos-tools/

DDoS Detection and mitigation­ Brief History
Learn &
Fight back
Detect &
Challenge
Collect &
Filter
Page § 21

DDoS Detection and mitigation ­ Yesterday
· Blackhole · Rate-limiting · ACL · iptables · CoPP · SYN-cookie · IDS · IPS · Load balancing · Port-security
· Detection: SNMP, netflow
Page § 22

DDoS Detection and mitigation ­ Today
· DNS poisoning · CDN · WAF · Hot-link protection · CAPTCHA · Source authentication · Detection: SNMP, Netflow, PCAP
Page § 23

DDoS Detection and mitigation ­ Tomorrow

· Browser authentication · User behavior validation · Application learning · User-id correlation · Differentiate mitigation · Bot / tools identification · (Friendly) Attack back

"Apparently the war is over and you are ordered to cease firing; so, if you see any Jap planes in the air, you will just have to shoot them down in a friendly manner."
- Admiral Halsey, 1945

· Detection: SNMP, Netflow, PCAP, logs + big data

Page § 24

Next Generation Detection---Profiling and Data Mining
Page § 25

A HTTP Get Flood Attack Analysis
Page § 26

A HTTP Get Flood Attack Analysis
Page § 27

Next Generation Detection---With Google API ?
Page § 28

Mobile Internet & Web API
Page § 29

API  Request  Load  
· Make  money  
 60%  of  all  lis2ngs  on  eBay.com  added  via  their  APIs  
· Save  money  
 SmugMug  saves  >  $500K/year  with  Amazon  S3  Storage  
· Build  brand  
 Google  Maps  300%  growth  vs  20%  MapQuest  
· Move  to  the  cloud  
 Over  50%  of  all  transac2ons  via  their  API,  Force.com  
· Go  anywhere  
 NeQlix  now  available  on  over  200  devices  
Credit    ProgrammableWeb  
30  

Flipboard / Instgram Down?
Page § 31

Know it before you hack it
Page § 32

API Abused DDoS
§ API Security Threats
- API Key spoofing - API Throttling bypass - Quota System bypass - API ACL (Private API accessed by Public)
§ API Request DDoS
- HTTP/HTTPS GET flood - HTTP/HTTPS POST flood - PUT/DELETE/HEAD ?
Page § 33

What if it's not abuse?
100,000 Users Have Downloaded Malware From Google Play
Page § 34

Google/ Alternative Android Markets and the Audit Policy
Page § 35

Mobile Device Botnet---Existing Apps
Android DDoS Tool Available in Google Play 1. Requires Internet access
to send the http post data 2. Requires phone state to
access the IMEI Pretty common requirement for Apps.
Page § 36

Mobile Device Botnet--- Free App Generator
Page § 37

Next Generation Detection---Profiling and Data Mining

§ Traffic Baseline
- HTTP Field Pattern - HTTP Traffic Volume - TCP Connections

§ IP Ranking

- Geo IP

- 80 / 20

- Open API Data Comparison---e.g. Google Safe Browsing API

-

Seculert API(expensive!).

Page § 38

Do You Have Any Questions?
Contact us at: research@nexusguard.com
Page § 39

