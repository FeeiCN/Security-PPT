SESSION ID: SPO-F02
DDoS: Barbarians at the Gate(way)

Dave Lewis
Global Security Advocate Akamai Technologies @gattaca

#RSAC

Agenda

 Actors  Attacks  Tools  Trends  Data  Now what?

Presenter's Company

Logo ­ replace on

2

master slide

#RSAC

#RSAC
How This Applies To You
 Overall Actions:  Gain an understanding of your adversary  Learn the security landscape from the data
 Specific Actions:  Review what are you doing for DDoS prevention?  Have you assessed the risk to your environment?  Quantify the expected financial loss due to an outage to your site?
Presenter's Company Logo ­ replace on master slide

#RSAC
Actors: For Hire

Presenter's Company

Logo ­ replace on

4

master slide

#RSAC
Russian underground market:
 Hacking corporate mailbox: $500  Winlocker ransomware: $10-20  Intelligent exploit bundle: $10-$3,000  Hiring a DDoS attack: $30-$70/day, $1,200/month  Botnet: $200 for 2,000 bots  DDoS botnet: $700

Presenter's Company

Logo ­ replace on

5

master slide

#RSAC

Presenter's Company

Logo ­ replace on

6

master slide

#RSAC
Actors: Bored Kids

Presenter's Company

Logo ­ replace on

7

master slide

#RSAC
Actors: Hacktivists

Presenter's Company

Logo ­ replace on

8

master slide

#RSAC
Actors: Nation States

Presenter's Company

Logo ­ replace on

9

master slide

#RSAC
Actors: al-Qassam Cyber Fighters, QCF
 QCF is an Iranian group that has been focused on attacking US and Canadian banks.
 They use the Brobot botnet that attacks from compromised servers. Using server hardware and connection they can usually overwhelm scrubbers with traffic.

Presenter's Company

Logo ­ replace on

10

master slide

#RSAC
Attacks

Presenter's Company

Logo ­ replace on

11

master slide

#RSAC
Types of Attacks
 SYN Floods  UDP Floods  ICMP Floods  NTP Amplification  HTTP Flood

Presenter's Company

Logo ­ replace on

12

master slide

#RSAC
Attacks: Volumetric

Presenter's Company

Logo ­ replace on

13

master slide

#RSAC

Presenter's Company

Logo ­ replace on

14

master slide

#RSAC
Simple Service Discovery Protocol (SSDP)

Presenter's Company

Logo ­ replace on

15

master slide

#RSAC
Attacks: Application Layer

Presenter's Company

Logo ­ replace on

16

master slide

#RSAC
Application Attacks

Presenter's Company

Logo ­ replace on

17

master slide

#RSAC
Attacks: Extortion

Presenter's Company

Logo ­ replace on

18

master slide

#RSAC
DD4BC
 Began by targeting sites with ransom demands  Failure to pay lead to increased $$$ to stop the attack  Earlier attacks focused on businesses that would avoid reporting
the attacks to law enforcement.  Once research published they were quiet for a while, now have
returned

Presenter's Company

Logo ­ replace on

19

master slide

Presenter's Company Logo ­ replace on master slide

#RSAC

#RSAC
More recently...
 DD4BC continues to inform victims that they will launch a DDoS attack of 400-500 Gbps against them.
 To date, DD4BC attack campaigns mitigated by Akamai have not exceeded 50 Gbps in size.
 That's up from the high of 15-20 Gbps observed in early May.
Presenter's Company Logo ­ replace on master slide

#RSAC
Attacks: Amplification

Presenter's Company

Logo ­ replace on

22

master slide

#RSAC
Anatomy of an attack
 Peak bandwidth: 4.3 Gigabits per second (Gbps)  Attack vectors: DNS reflection and amplification  Source: port(s): 53  Destination port(s): 80, random

Presenter's Company

Logo ­ replace on

23

master slide

#RSAC
Sample Intercepted Packet

21:38:55.972524 IP X.X.X.X.53 > X.X.X.X.52967: 5856 13/0/3 A 50.63.202.58, NS ns71.somedomain.com., NS ns72.somedomain.com., SOA, MX mailstore1.example.net. 10, MX smtp.example.net. 0, TXT "President Obama is taking action to help ensure opportunity for all Americans. President Obama Signing <snip>
13:43:36.094522 IP X.X.X.X.53 > X.X.X.X.52506: 11532 10/13/16 TXT "Presidenftxt Obama is taking action <snip> ", TXT[|domain]
13:43:36.094854 IP X.X.X.X.53 > X.X.X.X.5926: 35408 10/13/16 TXT "<snip> President also outlines" " the details about the transmission and treatment of Ebola", TXT[|domain]

Presenter's Company

Logo ­ replace on

24

master slide

#RSAC
Tools

Presenter's Company

Logo ­ replace on

25

master slide

Weapons Locker
 Volumetric  SQLi  Scanners

Presenter's Company

Logo ­ replace on

26

master slide

#RSAC

#RSAC
Tools: Havij

Presenter's Company

Logo ­ replace on

27

master slide

#RSAC
Tools: HULK

Presenter's Company

Logo ­ replace on

28

master slide

#RSAC
Tools: HULK (con't)
GET /?NJB=VURZQ HTTP/1.1 Accept-Encoding: identity Host: www.foo.bar Keep-Alive: 112 User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.3) Gecko/20090913 Firefox/3.5.3 Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7 Connection: close Referer: http://www.foo.bar Cache-Control: no-cache

Presenter's Company

Logo ­ replace on

29

master slide

#RSAC
Tools: Torshammer
/* * Tor's Hammer * Slow POST DoS Testing Tool * entropy [at] phiral.net * Anon-ymized via Tor * We are Legion. */

Presenter's Company

Logo ­ replace on

30

master slide

#RSAC
Torshammer (con't)

./torshammer.py -t <target> [-r <threads> -p <port> -T -h] -t|--target <Hostname|IP> -r|--threads <Number of threads> Defaults to 256 -p|--port <Web Server Port> Defaults to 80 -T|--tor Enable anonymising through tor on 127.0.0.1:9050 -h|--help Shows this help Eg. ./torshammer.py -t 192.168.1.100 -r 256

Presenter's Company

Logo ­ replace on

31

master slide

#RSAC
Tools: Torshammer (con't)
Tor's Hammer is a slow post dos testing tool written in Python. It can also be run through the Tor network to be anonymized. If you are going to run it with Tor it assumes you are running Tor on 127.0.0.1:9050. Kills most unprotected web servers running Apache and IIS via a single instance.

Presenter's Company

Logo ­ replace on

32

master slide

#RSAC
Tools: Donut

Presenter's Company

Logo ­ replace on

33

master slide

#RSAC
Tools: Donut (con't)
GET / HTTP/1.1 Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/xshockwave-flash, application/msword, application/vnd.ms-powerpoint, application/vnd.ms-excel, */* Accept-Language: en-us Accept-Encoding: gzip, deflate User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.0.3705) Host: www.foo.bar Connection: Close

Presenter's Company

Logo ­ replace on

34

master slide

#RSAC
Tools: LOIC

Presenter's Company

Logo ­ replace on

35

master slide

#RSAC
Tools: HOIC

Presenter's Company

Logo ­ replace on

36

master slide

#RSAC
Tools: Brobot
Brobot is a PHP trojan that allows an attacker to take control of a victim's compromised hosted Web server and use it to launch DDOS attacks.

Presenter's Company

Logo ­ replace on

37

master slide

#RSAC
Tools: WGET

Presenter's Company

Logo ­ replace on

38

master slide

#RSAC
Trends

Presenter's Company

Logo ­ replace on

39

master slide

#RSAC
Media Grandstanders

Presenter's Company

Logo ­ replace on

40

master slide

#RSAC
Commoditization of DDoS

Presenter's Company

Logo ­ replace on

41

master slide

#RSAC

Presenter's Company

Logo ­ replace on

42

master slide

#RSAC
What's Your Fancy?

Presenter's Company

Logo ­ replace on

43

master slide

#RSAC
What's a Booter?

Presenter's Company

Logo ­ replace on

44

master slide

Presenter's Company Logo ­ replace on master slide

#RSAC

#RSAC
OK, What's a Stresser?

Presenter's Company

Logo ­ replace on

46

master slide

#RSAC
Stressers & Booters
 xBOOT  Flash Stresser  Hyper Stresser  Grim Booter  Anonymous Stresser  Titanium Stresser / Lizards  Big Bang Booter...and so on.

Presenter's Company

Logo ­ replace on

47

master slide

#RSAC

Presenter's Company

Logo ­ replace on

48

master slide

#RSAC
Some Other Highlights
 DDoS agents targeting Joomla and other SaaS apps  A heap-based buffer overflow vulnerability in Linux systems  Attackers using new MS SQL reflection techniques  Data breaches fueling login attacks
Presenter's Company Logo ­ replace on master slide

Attributions
Presenter's Company Logo ­ replace on master slide

#RSAC

Presenter's Company Logo ­ replace on master slide

#RSAC

Presenter's Company Logo ­ replace on master slide

#RSAC

Application Security
Presenter's Company Logo ­ replace on master slide

#RSAC

Presenter's Company Logo ­ replace on master slide

#RSAC

Presenter's Company Logo ­ replace on master slide

#RSAC

#RSAC
Syn Floods
These large attacks all contained SYN floods 12:34:04.270528 IP X.X.X.X.54202 > Y.Y.Y.Y.80: Flags [S], seq 1801649395:1801650365, win 64755, length 970 ....E.....@...}.6.....6....Pkb......P...c........................................................... ........<snip>..................................................
Presenter's Company Logo ­ replace on master slide

By The Numbers
Presenter's Company Logo ­ replace on master slide

#RSAC

#RSAC
Other Observations
 SQLi  Local/Remote File Inclusion  Command shells  PHP Injection  Malicious File upload  JAVA ...best remote access platform ever!
Presenter's Company Logo ­ replace on master slide

SQL Injection...still
Presenter's Company Logo ­ replace on master slide

#RSAC

Presenter's Company Logo ­ replace on master slide

#RSAC

Presenter's Company Logo ­ replace on master slide

#RSAC

Presenter's Company Logo ­ replace on master slide

#RSAC

File Inclusions
Presenter's Company Logo ­ replace on master slide

#RSAC

#RSAC
Malicious Uploads
 KCFinder file upload vulnerability  Open Flash Chart file upload vulnerability (CVE-2009-4140)  appRain CMF (uploadify.php) unrestricted file upload exploit (CVE-
2012-1153)  FCKeditor file upload vulnerability (CVE-2008-6178)
Presenter's Company Logo ­ replace on master slide

Presenter's Company Logo ­ replace on master slide

#RSAC

Presenter's Company Logo ­ replace on master slide

#RSAC

Zombie Bot Army
Presenter's Company Logo ­ replace on master slide

#RSAC

#RSAC
What Can You Do?
 Deploy cloud based web application firewalls  Use a DDoS mitigation service. Appliances don't scale.  SQL INJECTION IS A SOLVABLE PROBLEM  Harden your systems  Work with your ISP on mitigation strategies  Use ACL lists to deal with known bad IPs  IP Rate limiting / IP Reputation  PATCH PATCH PATCH
Presenter's Company Logo ­ replace on master slide

Questions?
Presenter's Company Logo ­ replace on master slide

#RSAC

#RSAC
Thank You
Dave Lewis Global Security Advocate Akamai Technologies Twitter: @gattaca Email: dave@akamai.com
Presenter's Company Logo ­ replace on master slide

