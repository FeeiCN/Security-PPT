HONEYCON 2016 WORKSHOP - HONEYNET 101
HONEYDRIVE
 / 

Outline
 The Honeynet Project  Honeynet Project Tools  Honeynet in Taiwan  Botnet Analysis in Taiwan  Japan Cyber Clean Center

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

2

The Honeynet Project
 1999 Mailing-List 
 2000Lance Spitzner The Honeynet Project The Honeynet Project  
 (2016.6)46The Honeynet Project Chapter() 
 http://honeynet.org/og

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

3

The Honeynet Project
 The Honeynet Project :
   R&D   (Share Lesson Learned)  (Trusted Relationship)

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

4

The Honeynet Project
 A community of organizations actively researching, developing and deploying Honeynets and sharing the lessons learned.
 Awareness: 

 Information: : 

 Tools: Honeynet Project  Open Source ToolsTools


The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

5

The Honeynet Project Annual Workshop
2012-

2011-
The Honeynet Project Taiwan Chapter

201w2ww-.honeynet.org.tw

6

Honeynet Project website

·www.honeynet.org ·www.honeynet.org.tw
The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

7

The Honeynet Project introduction
 Non-profit (501c3) organization with Board of Directors.  Funded by sponsors  Global set of diverse skills and experiences.  Open Source, share all of our research and findings at no cost to the public.  Deploy networks around the world to be hacked.  Everything we capture is happening in the wild.  We have nothing to sell.

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

8

Honeynet Project Mission
 A community of organizations actively researching, developing and deploying Honeynets and sharing the lessons learned.
 Awareness: 

 Information: : 

 Tools: Honeynet Project  Open Source ToolsTools


The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

9

The Honeynet Project Website
45(Chapters)

http://www.honeynet.org/
National Center for High-performance Computing

www.nchc.org.tw

10

Honeypot/Honeynet Technology
 What is a Honeynet ?
 (High-interaction Honeypot)  It is an architecture, not a product or software  Populate with live systems  Once compromised, data is collected to learn the tools, tactics, and motives of the
Blackhat community
 Value of Honeynet
 Research : Identify new tools and new tactics, Profiling Blackhats  Early warning and prediction  Incident Response / Forensics  Self-defense

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

11

(Honeypots)
 A honeypot is an information system resource whose value lies in unauthorized or illicit use of that resource.
 Has no production value, anything going to or from a honeypot is likely a probe, attack or compromise.
 Primary value to most organizations is information.

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

12


 
 Collect small data sets of high value.  Reduce false positives  Catch new attacks, false negatives  Work in encrypted or IPv6 environments  Simple concept requiring minimal resources
 
 Limited field of view (microscope)  Risk (mainly high-interaction honeypots)

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

13

Honeynets
 High-interaction honeypot designed to capture in-depth information.  Information has different value to different organizations.  Its an architecture you populate with live systems, not a product or software.  Any traffic entering or leaving is suspect.

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

14

How it works
A highly controlled network where every packet entering or leaving is monitored, captured, and analyzed.
 Data Control  Data Capture  Data Analysis

http://www.honeynet.org/papers/honeynet/

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

15


1.   Network  Connection  Web App  Malware  Client-Side
2.
3.Dashboard
The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

16

HoneyDrive
 Live CD  OVA  
  SourceForge
http://sourceforge.net/projects/honeydrive/ files/

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

17

Honeydrive
 OS : xubuntu 12.04.4 LTS i386  HDD : 80GB  LAMP   : UTC  Username : honeydrive  Password : honeydrive  : 2014  : 3
The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

18


 Honeypot  Dashboard  Security  Forensics  Malware  Firefox add-ons  Extra software
The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

19

HoneyDrive

 Honeypot
 Dionaea   Maltrieve  Glastopf  Wordpot  Honeyd  Thug

 Amun   Conpot  Kippo  Tiny  PhoneyC

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

20

HoneyDrive
 Dashboard kippo-Graph DionaeaFR Honeyd-Viz
 Log Dashboard ELK ­ ElasticSearch + Logstash + Kibana

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

21

Malware Collector - Maltrieve

 Maltrieve originated as a fork of mwcrawler  :   
Malc0de Malware Black List Malware Domain List VX Vault URLqery CleanMX

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

22

maltrieve 
/opt/maltrieve ! archive ­  ! maltrieve.cfg ­ maltrieve
 sudo python maltrieve.py

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

24

Malware Collector­Dionaea
 Honeypot  NepenthesHoneypot  Python      

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

25

Dionaea & nepenthes

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw


The Honeynet Project Taiwan Chapter

  Exploitation

SMB HTTP HTTPS FTP EPMAP TFTP MSSQL
SIP

Detect I/O 

Payload

Download

Ftp.py Tftp.py
Curl

Logging

Sqlite

www.honeynet.org.tw

27

Dionaea 

 /opt/dionaea/etc/dionaea/dionaea.conf

 Dionaea.conf   Logginglog domains and loglevel

 ProcessorsLibemu Shellcode
 Downloads:   Bistreams: IPDionaea

 Submit HTTPFTP FTP
 Listen: DionaeaIPAll

  Modules

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

Dionaea 

 Dionaea.conf Modules 

 Pcap moduleLibpcap 



 Curl module : Curl



 Emu module: Shellcode

 Python module: Python interpreterDionaea

 Logsql module: Dionaea Logsqlite

databse 

 Logxmpp module: Dionaea Logxmpp

server

 P0f module:  OS fingerprinting

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

Running Dionaea

 
 -c, --config=FILE ( )  -D, ()  -g, --group=GROUP (switch to GROUP after startup)  -h, --help display help  -H, --large-help  -l, --log-levels="all, debug, info, message, warning, critical"  -u, --user=USER (switch to USER after startup)  -p, --pid-file=FILE (write pid to file)  -r, --chroot=DIR (chroot to DIR after startup)  -V, (show version)  -w, --workingdir=DIR (set the process working dir to DIR)
 
sudo /opt/dionaea/bin/dionaea -D -l warning -L '* -p /var/run/dionaea.pid'

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

Dionaea Log - Sqlite

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

31

  kali

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

32

kali
Termimal #service postgresql start #service metasploit start #service metasploit stop #armitage
armitage-honeypotscan Hosts -> Nmap Scan-> Quick Scan(OS detect)

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

33

Honeypot

 Attacks -> Hail Mary
The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

34

Dionaea Banner(1)
 FTP banner sed 's/Welcome to the ftp service/Welcome to the awesome ftp service/ g' -i /opt/dionaea/lib/dionaea/python/dionaea/ftp.py
 MSSQL banner sed 's/r.VersionToken.TokenType = 0x00/r.VersionToken.TokenType = 0xAA/g' -i /opt/dionaea/lib/dionaea/python/dionaea/mss ql/mssql.py

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

35

Dionaea Banner(2)
 Smbd banner sed 's/WORKGROUP/MIDOMINIO/g' -i /opt/dionaea/lib/dionaea/python/ dionaea/smb/include/smbfields.py
sed 's/HOMEUSER-3AF6FE/EQUIPO-TEST/g' -i /opt/dionaea/lib/ dionaea/python/dionaea/smb/include/smbfields.py

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

36

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

37

ms10-061
Termimal #msfconsole

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

38

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

39

kippo 

·Kippo
·KippoSSHSSH 
·Kippo ­SSH Brute Force Attack ­History ­

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

40

kippo 
 KippoSSH Brute Force Attack ­ ­ ­

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

41

SSH Brute Force Attack

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

42

kippo 
/honeydirve/kippo ! data ­  ! dl ­ wget ! honeyfs ­  ! Log ­ log ! Utils ­  ! kippo.cfg ­ kippo

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw


 putty

The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

44






The Honeynet Project Taiwan Chapter

www.honeynet.org.tw

45

