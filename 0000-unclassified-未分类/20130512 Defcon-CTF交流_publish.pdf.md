WebKCON 
Blue-Lotus Defcon 20 CTF
NISL Blue-Lotus
@
1

Defcon CTF
o  ­ ""
n 199616 n DDTekc2009-Present
o Defcon 20 CTF
n Quals ­ 
o Challenges Solving o 10 + 10CTF
n Deathmatch ­  n Final ­  CTF (offense & defense)
o Defcon
2


3

Defcon CTF

o Grag bag c
o Urandom c
o Binary l33tness c 
o Pwnables c
o Forensics c
o 100-500 o 

4

Blue-Lotusc""
o (NISL@TU) 
 
o 201012iCTF'10
n disketcUGAProf. Kang Li n : 35/72
o iCTF'1123/87
n Metasploit
5

Defcon CTF
6


7


8

CTF ­ 6.2 8:30am

[Blue-Lotus]

[Blue-lotus] &
[Syclover] 
9

0.01h ­ 
o Grab Bag 100: Hack the planet_ o 2006: Hack the ______ o 2007: ____ the planet o 2008: Hack ___ planet o 2011: ____ ___ ______.
o 2012: Hack the planet_

G100 Writeup: http://netsec.ccert.edu.cn/blog/2012/06/04/693

10

0.01h ­  (Hack the planet-Hacker)
11

0.5h - , 200, 1
o Urandom 100:
n How many developers;) did it take to secure Windows 8?
o 
n Google Windows 8-  Win8
n 60-701-100
o -152
n Slow Down?!!
o Why 152? (developers)
U100 Writeup: http://netsec.ccert.edu.cn/blog/2012/06/05/719 12

 ­ p100

o p100: MIPS
n fuzz n Qemu + Linux-mips n cASLR
o  o binarywrite()
o 
n MIPSa 
n jmp espcASLR

P100 Writeup: http://netsec.ccert.edu.cn/blog/2012/06/04/709

13

 ­ b100
o Binary l33tness 100: binaryrecover my key n mac.hsshdssh n Google: skynet ssh backdoor n mac.hccxor 0xff
Key Key?!!!

B100 Writeup: http://wcf1987.iteye.com/blog/1550530

14

­ b100 (con'd)
o ""keykey
Key Key?!!!
15

b100
Ali: crypt () Air40


insight-?/fish:   key

./john /root/ Desktop/ hash.txt
16

 ­ f100
o Linuxfind the key
o 
n 1.c.x n  n 
o Writeup
n blkls -s f100: sleuthkit n Slack space: ""

F100 Writeup: http://sysexit.wordpress.com/2012/06/03/defcon

17

-20-ctf-prequals-2012-forensics-300-writeup/#comments

 - f200
o Forensic 200: recover the key
n WinHex7JPG n Google Map n  n stegdetect n -ddtek c4F200
18
F200 Writeup: http://netsec.ccert.edu.cn/blog/2012/06/15/769

f2003D
19


Fish: b200,...

­ b200
o key o 
n File: FreeBSD 32-bit n IDA Proa ->  n  -> Nop n Callback()
 KeySorry
B200 Writeup: http://netsec.ccert.edu.cn/blog/2012/06/17/779 21

­ b200
o Callback( ) 
o 44 o 4
 o 
 o Easy
22

­ b200
 string string crypt()
 string?
23

­ b200
o crypt()Hash o Rijndeal(AES)S-Box
n AES-based MAC?! 
n side-channel collision attack n known-message scenario n time and memory complexity
24

­ b200
o Fish
n v5.key[0] = 0x14B62D86u - 
n Tangle Hash Function!!! n Google "Tangle Hash collision"
25

­ b200
o  o key
437f085141d357c5d28850d5119aacb5
26

­ p200
o FreeBSDexploit o 
 buffer 
 

?

Kelwin: 10 = 0A 

, buffer

protection,

27

protection

­ p200

o Zhugejw:  
o Kelwin: index,  protectionblycan, shellcode

...

sp+228h sp+224h sp+220h sp+21Ch sp+1Ch
sp

Ret-add Ret-add

... Ret-add

protection

index

ox02 ox00

ox0b

ox02 ox0C

buffer shellcode

...

P200 Writeup: http://netsec.ccert.edu.cn/blog/2012/06/04/699 28

 ­ 700(3x)

· :5/10 · :700/1600 · 1:9/10 · 1:1400/1600 · :1 · :6x+/5xx · :3x/5xx · : binary · : forensic · : grab bag
29

-g(g200)
o MACOSjpeg o DiffDNS
o ScapyDNSIP o dig -t ptr 13.12.11.10.in-addr.arpa
@140.197.217.85 -b ::#31337 o DNSdan.kaminsky.kung.fu.
G200 Writeup: http://netsec.ccert.edu.cn/blog/2012/06/05/719 30

-g(g300)
o   PIN
o 10
n This is semi-real.
o  o Balance:
$92387409 825702370 12935.32
G300 Writeup: http://netsec.ccert.edu.cn/blog/2012/06/09/760 31

215pm-
18. Bluelotus:1200
32

-p(p300)
o FreeBSDexploit ­ 

o 

o  ptr[]
o ptr[] o 
33

-p(p300)
o ptr[] 
n 4 INT
n  
o "" Shellcode
o a
P300 Writeup: http://netsec.ccert.edu.cn/blog/2012/06/04/715 34

-f(f300)

o Strings

n D-Link DIR-815 Firmware

n Firmware

o Binwalk

n squashfs + lzma

o firmware-mod-kit

n ./extract-ng.sh /root/Desktop/ makeFirmware/f300

n rootfs

n /home/dlink/key.txt

F300 Writeup: http://insight-labs.org/?p=371

35

-g(g400)
o Gb400: What is Jeff Moss' checking account balance?

SQL



36

-g(g400)
o 
n aunion select table_name,column_name,'c','d',1,'f' from information_schema.columns
n Customer: union select email,password,username,lastname,id,firstnam e from customer
o No Jeff Moss's account???
n Jeff Moss = Dark Tangnet
o Dark Tangnetkey = 0.00
G400 Writeup: http://netsec.ccert.edu.cn/blog/2012/06/09/762 37

220:30pm - 
Two teams prequalified: · European
Nopslead team · leetmore
11. Bluelotus:2200
38

 ­ u300
o Stanford o 10uint16_t
10 
o NOI o Amazon
U300 Writeup: http://netsec.ccert.edu.cn/blog/2012/06/04/690 39

 ­ b300

o Pcap1TCP10() o EXE
n x86 PE? OpenVMS/Alpha! n Alpha+OpenVMSLicense
o IDAPro
n keyDword (xor) n oXXX7tXXXXp
o "What time is leet?p
n [insight]LittleFather: 1337? , l337?  n L337? ! cL337tmnow!

B300 Writeup: http://insight-labs.org/?p=368

40

 ­ b400
o (FreeBSD x64)
n  n GdbIDAPro n -> 
0-63 n key
o Fish
n N, N>8 n Fish à
B400 Writeup: http://netsec.ccert.edu.cn/blog/2012/06/05/749 41

p400
Kelwin: p400 exploit Shellcode 

Bobo:   0xXXXX


Kelwin:YES 400 


42
P400 Writeup: http://netsec.ccert.edu.cn/blog/2012/06/05/723

-f400
o WindowsHBGary say waht?
n HBGray VS. Anonymous n strings, grepPGP n PGPPGP
key
o PGP
n Volatility: pgp.exe /gpg-agent.exe -> key(Time!)
n key ID: EC1B51DB, key ID
o Writeup:
n dumpRSA n n Photorec
43

6.4 8:30am 



· :14/24 · :3600/7000 · :19/5xx

· 1: 4900/7000 · : 3900 (12)

· : binary, 1000/1500 · : forensic, 300/1500 · key: f400

19. Blue-

44

lotus:3600



Rank 1 2 3 4 5 6 9
10 11
12

Team Name Hates Irony PPP  sutegoma2 shellphish TwoSixNine our name sucks ACME Pharm WOWHACKERPLUS Routards

Country  CMU,  ?  UCSB,  ? 
NW,  




CTF

Team Name

Country

DC19 European



Nopslead Team

PhDays More Smoked

(etc)

Leet Chicken



NCCDC Team Hillarious UW, 

oCTF

Team Vand

?

RuCTFE 0ldEur0pe



HitB A SiBears

TSU

Codegat KAIST GoN e



Nuit du HackerDom Hack

URFU, 

Ebay slot

CashCOW?!

?

CTF

45


o &:  o 
n key n 
f100&f200 n brainstorm
o 
n defcon CTF n c
46

CTF(ctftime.org)
Bluelotus: 75/1152 78.733
47

CTF""
o ""
n Codegate(2/4)2 n PlaidCTF(4)CMU$2K n iCTF(12)UCSB$2K n Hack.lu(10) n GiTS(1)shmoocon n ...
o : Defcon CTF(6/7)
48


o Blue-Lotus
n CTF n Defcon CTF
o Blue-Lotus Chaos Club
n  n , Web, 
o defcon ctf
n  n  n Let's trade hintsJ, just kidding
49

CTF
o http://t.cn/zW2mXMA
o Defcon 20 CTFhttp://repo.shell-storm.org/CTF/Defcon-20-quals/ o Blue-Lotuswriteup
http://hi.baidu.com/casperkid/item/3aaa7d26a08b8e4146996289 o writeup
n http://devpsc.blogspot.jp/2012/06/defcon-20-quals-writeup-collection.htmlc 
n http://d.hatena.ne.jp/Kango/20120604/1338815574c n https://sites.google.com/site/ctfcentralorg/home/defcon-20-ctf-quals o CTFhttp://ctftime.org/ o CTF n http://ctf.forgottensec.com/wiki/index.php?title=Main_Page n http://captf.com/practice-ctf/ o ctfhttp://captf.com/ o CTFhttp://www.wechall.net/sites.php o http://www.securitywizardry.com/index.php/products/forensic-solutions.html
50

 
Thanks @
Q&A
CasperKid :

