SEC599 j DEFEATING ADVANCED ADVERSARIES
599.6
APT Defender Capstone
THE MOST TRUSTED SOURCE FOR INFORMATION SECURITY TRAINING, CERTIFICATION, AND RESEARCH I sans.org

Copyright© 2017, Erik Van Buggenhout & Stephen Sims. All rights reserved to Erik Van Buggenhout & Stephen Sims and/or SANS Institute.
PLEASE READ THE TERMS AND CONDITIONS OF THIS COURSEWARE LICENSE AGREEMENT ("CLA") CAREFULLY BEFORE USING ANY OF THE COURSEWARE ASSOCIATED WITH THE SANS COURSE. THIS IS A LEGAL AND ENFORCEABLE CONTRACT BETWEEN YOU (THE "USER") AND THE SANS INSTITUTE FOR THE COURSEWARE. YOU AGREE THAT THIS AGREEMENT IS ENFORCEABLE LIKE ANY WRITTEN NEGOTIATED AGREEMENT SIGNED BY YOU.
With the CLA, the SANS Institute hereby grants User a personal, non-exclusive license to use the Courseware subject to the terms of this agreement. Courseware includes all printed materials, including course books and lab workbooks, as well as any digital or other media, virtual machines, and/or data sets distributed by the SANS Institute to the User for use in the SANS class associated with the Courseware. User agrees that the CLA is the complete and exclusive statement of agreement between The SANS Institute and you and that this CLA supersedes any oral or written proposal, agreement or other communication relating to the subject matter of this CLA.
BY ACCEPTING THIS COURSEWARE, YOU AGREE TO BE BOUND BY THE TERMS OF THIS CLA. BY ACCEPTING THIS SOFTWARE, YOU AGREE THAT ANY BREACH OF THE TERMS OF THIS CLA MAY CAUSE IRREPARABLE HARM AND SIGNIFICANT INJURY TO THE SANS INSTITUTE, AND THAT THE SANS INSTITUTE MAY ENFORCE THESE PROVISIONS BY INJUNCTION (WITHOUT THE NECESSITY OF POSTING BOND), SPECIFIC PERFORMANCE, OR OTHER EQUITABLE RELIEF.
If you do not agree, you may return the Courseware to the SANS Institute for a full refund, if applicable.
User may not copy, reproduce, re-publish, distribute, display, modify or create derivative works based upon all or any portion of the Courseware, in any medium whether printed, electronic or otherwise, for any purpose, without the express prior written consent of the SANS Institute. Additionally, User may not sell, rent, lease, trade, or otherwise transfer the Courseware in any way, shape, or form without the express written consent of the SANS Institute.
If any provision of this CLA is declared unenforceable in any jurisdiction, then such provision shall be deemed to be severable from this CLA and shall not affect the remainder thereof. An amendment or addendum to this CLA may accompany this courseware.
SANS acknowledges that any and all software and/or tools, graphics, images, tables, charts or graphs presented in this courseware are the sole property of their respective trademark/registered/copyright owners, including:
AirDrop, AirPort, AirPort Time Capsule, Apple, Apple Remote Desktop, Apple TV, App Nap, Back to My Mac, Boot Camp, Cocoa, FaceTime, FileVault, Finder, FireWire, FireWire logo, iCal, iChat, iLife, iMac, iMessage, iPad, iPad Air, iPad Mini, iPhone, iPhoto, iPod, iPod classic, iPod shuffle, iPod nano, iPod touch, iTunes, iTunes logo, iWork, Keychain, Keynote, Mac, Mac Logo, MacBook, MacBook Air, MacBook Pro, Macintosh, Mac OS, Mac Pro, Numbers, OS X, Pages, Passbook, Retina, Safari, Siri, Spaces, Spotlight, There's an app for that, Time Capsule, Time Machine, Touch ID, Xcode, Xserve, App Store, and iCloud are registered trademarks of Apple Inc.
Governing Law: This Agreement shall be governed by the laws of the State of Maryland, USA.
SEC599_6_C01_03

SECS99.6

Defeating Advanced Adversaries

SANS APT Defender Capstone

© 2017 Erik Van Buggenhout & Stephen Sims I All Rights Reserved I Version CO I_03

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

Introduction
Welcome to the final day of this course! The goal for today is to apply all of the different skills we've learned throughout days 1 to 5.
You will work in teams to try defeating our Advanced Persistent Threat (APT) that is attempting to infiltrate SYNCTECHLABS. You will be competing with the other teams in the class room, so a competitive mindset is welcome ©
How will you score points?: · By solving the questions we have created in the main scoring server
interface; · By implementing security controls in the SYNCTECHLABS environment,
thereby stopping a series of automated attacks that will take place!
Introduction Welcome to the final day of this course! The goal for today is to apply all of the different skills we 've learned throughout days I to 5.
You will work in teams to try defeating our Advanced Persistent Threat (APT) that is attempting to infiltrate SYNCTECHLABS. You will be competing with the other teams in the classroom, so a competitive mindset is welcome©
How will you score points?: · By solving the questions we have created in the main scoring server interface; · By implementing security controls.in the SYNCTECHLABS environment, thereby stopping a series of
automated attacks that will take place!

2

© 2017 Erik Van Buggenhout & Stephen Sims

Planning & Schedule
We will start the "Defend-The-Flag" capstone once this lecture is finished (which will take+- 15 minutes). The capstone will run until +- 14:00 (or until a team solves all questions and scores maximum points).
Remember to pace yourself, as there are no "breaks" foreseen. The attacks don't stop and the timer is not stopped for a lunch break. It is up to you to decide when and how you want to take a break!
SANS
Planning & Schedule We will start the "Defend-The-Flag" capstone once this lecture is finished (which will take +- 15 minutes). The capstone will run until +- 14:00 (or until a team solves all questions and scores maximum points).
Remember to pace yourself, as there are no "breaks" foreseen . The attacks don ' t stop and the timer is not stopped for a lunch break. It is up to you to decide when and how you want to take a break!

© 2017 Erik Van Buggenhout & Stephen Sims

3

How to Start?
After this lecture, you can start by launching the student lab that is available in the LODS environment.
! DO NOT LAUNCH THE LAB NOW© !
(this will only work against you)
Once authenticated to the Windowso2 workstation, please open Chrome, browse the Scoreboard bookmark and register or join a team, so you can start working together. The maximum number of people in one team is 3.
Once registered, wait for the game to be launched by the Instructor...
SANS
How to start? After this lecture, you can start by launching the student lab that is available in the LODS environment.
DO NOT LAUNCH THE LAB NOW © - This will only put you at a disadvantage. .. Once authenticated to the Windows02 workstation, please open Chrome, browse the Scoreboard bookmark and register or join a team, so you can start working together. The maximum number of people in one team is 3. Once registered, wait for the game to be launched by the Instructor, you can however already configure the "attacker server"!

4

© 2017 Erik Van Buggenhout & Stephen Sims

Architecture of the APT Defender Capstone
Every participant is working in his / her own dedicated lab environment (as you did during the rest of the class). There is however one shared component: the scoring server!
You thus cannot technically interfere with each other's defenses! (in any case: you shouldn't anyhow)
The "attacker" will attack you from the "WAN" interface in your own dedicated lab environment. Note that he's going to be tricky to detect & stop ©
Architecture of the APT Defender Capstone A quick note on the architecture of our APT Defender Capstone: Avery participant is working in his / her own dedicated lab environment (as you did during the rest of the class). There is, however, one shared component: the scoring server! You thus cannot technically interfere with each other's defenses! (in any case: you shouldn't try anyhow). We have a list of Rules of Engagements that are listed near the end of this deck. The "attacker" will attack you from the "WAN" interface in your own dedicated lab environment. Note that he's going to be tricky to detect & stop .. .

© 2017 Erik Van Buggenhout & Stephen Sims

5

Types of Questions
In the scoring server, you have the following categories of questions:
· MALWARE: Review malicious documents, executables & payloads that we extracted for you. You will have to answer different questions about their intent & behavior;
· NETWORK: Review network-related artifacts that can reveal how malware operated inside an environment;
· TRIVIA: Prove your knowledge of the subject matter by responding to a series of varying questions;
· SYNCTECHLABS: Analyze the ongoing attacks against SYNCTECHLABS and answer a series of questions about how the adversary is operating;
As a bonus, "ONE" defender per team will be scored to assess how well he is putting in place defenses to stop the attacker. You should decide up front who will be this "defender".
Types of questions In the scoring server, you have the following categories of questions:
MALWARE: Review malicious documents, executables & payloads that we extracted for you. You will have to answer different questions about their intent & behavior; NETWORK: Review network-related artifacts that can reveal how malware operated inside an environment; TRIVIA: Prove your knowledge of the subject matter by responding to a series of varying questions; SYNCTECHLABS: Analyze the ongoing attacks against SYNCTECHLABS and answer a series of questions about how the adversary is operating;
As a bonus, "ONE" defender per team will be scored to assess how well he is putting in place defenses to stop the attacker. You should decide up front who will be this "defender".

6

© 2017 Erik Van Buggenhout & Stephen Sims

Registering a User & Team

-·I- ~

C A t1r.ictw<:ut;e- ~ V/1 ~1.,.a1.101,1-

'll' - · - '< '"""'- D

e - ox
*
Throughout day 6, you will interact with our central scoring server, where you will first have to register a user and join a team, so you can authenticate to the scoring interface.
There is a limit of 3 users per team.

SANS

Registering a user & team
Throughout day 6, you will interact with our central scoring server, where you will first have to register a user and join a team, so you can authenticate to the scoring interface. As already indicated, there is a limit of
3 users per team.

© 2017 Erik Van Buggenhout & Stephen Sims

7

Creating a Team
I

l a

·1

X

* 'i

Create a team name, password and icon.
Note that you should share the teamname and password with all participants that want to play in your team!

Creating a team Create a team name, password, and icon. Feel free to get creative, but remember that you should share the team name and password with all participants that want to play in your team!

·~ ,..--._.

8

© 2017 Erik Van Buggenhout & Stephen Sims

Joining a Team

l t,CTF5«><· -

" .~..

=

E---

C A NM. :1.e¢111e ~ .,/192.1 U;1.rOl,;1eq,w:n:·~t"a~q:·K·

""·-k·'"" '6'

'('-s....o. Cl s...pi., . ,w,,,1,,. 0 ~ ::, N·;..,

e

0 X

*

If you would like to join an existing team, just select it from the web interface!
Remember: you will need the password for the team in order to be able to join it!

Joining a team If you would like to join an existing team, just select it from the web interface! Remember: you will need the
password for the team in order to be able to join it!

© 2017 Erik Van Buggenhout & Stephen Sims

9

I
Creating Your Username

Dm1c,.-,, x

8

Q X

"°

C A No?s:(><_;.\_me ~ ' 1~,?.168.1.1!}1_1,zg;,·,;,1,,,!C

~ ~ tfer,t;li <(_' C4w-~

CJ ~ ·~ [l (¢~ .j N:~l. D ~.o-:-cr~ tJ ~ 0- l'.;,i;ltA¢mitlC9"~ CH

* 1

Once the team password is accepted, you can now create your very own username!

SANS
Creating your username
Once the team password is accepted, you can now create your very own usemame!

10

© 2017 Erik Van Buggenhout & Stephen Sims

For the "One Defender" Only - Configure the Attacker Server

C) 10.10.10200/-pl,p X \_
'fl-'.:"'--·«10.10.10.2001,ooexpl,J>
ux:too- -Cl ;..,;..£~ a -
SEC599 - Attacker config

e

N.;.;.,,D ~ · JJ

\iii MIS!' (,) GAAildmmCoMclo CTf

· X
*

!>lease oru.ure the dam you enta h,re u EXACTtY the smie .. in the scoring savor sy$1fflll (case ,emilivel) Failure to cocfi-p~ thn conectly w1U -rttub: in mis~ points!

Current configuration
Vsanamc: uscrl Te-amrwnc! ttam l
Update con.figuration

As already indicated, your environment will be attacked by a rather persistent advisory. Attacks will take place periodically and the results of which will be automatically registered on the scoring server...
In order for scores to be registered, you need to select one "defender" in your team that will have his defenses scored. It's important that he registers his "username" and "team name" on the attacker server. This field is CASE SENSITIVE! You can do this by opening the "Config attacker server" from the CTF bookmarks folder.

For the "One defender" only - Configure the attacker server As already indicated, your environment will be attacked by a rather persistent advisory. Attacks will take place periodically and the results of which will be automatically registered on the scoring server. ..
In order for scores to be registered, you need to select one "defender" in your team that will have his defenses scored. It's important that he registers his "usemame" and "team name" on the attacker server. This field is CASE SENSITIVE! You can do this by opening the "Config attacker server" from the CTF bookmarks folder.
This step is important: an incorrect configuration here will score you Opoints on all attempted attacks!

© 2017 Erik Van Buggenhout & Stephen Sims

11

Main Interface

6

-0 X

* '

Once the game is started and you are authenticated, you should receive a screen very similar to the one to the right.
All tiles represent questions you can click and subsequently attempt to answer!

Main interface Once the game is started and you are authenticated, you should receive a screen very similar to the one to the right.
All tiles represent questions you can click and subsequently attempt to answer!

12

© 2017 Erik Van Buggenhout & Stephen Sims

Submitting Answers

MALWARE100 Easy: 100 pts
[.rrtert:tw StlA1 ha~, ofyi>,it 911.,.~ iou ,A1,n,){ttain t~ h.¥.ti b)' n,r,fM,-v; 't'f~'ho -ft l)'Ql.!T gi.1w~\ i :.tw1w:m· ~!Qrrl .vr1 l.it\ut VM P;i!!('!.,._Hl<I" Ot.i~.tt Imo tt\t" K~ sut;mi,,.s>oo to,
I! ht ...:\ t,, ··;rt,c~· Hf-o<Jnd.. lhfil~i-y l'1l'!:W'O'] ,1 um l';')f~l'o',> a rlJt,<,o! ("~ 'f0'-1 )(?'! ,.;.<, s·;fvi:t 1h!:i r·:J,<n~ ty! tlW Id,., !ht,~ ,t v:.W lo ~:,!¢0;.,;h per:,,-;t~;-~? 'r'/.; O'.M1t nevd ITT£ h.,J! fl:lli!' path< fiJ'.H ttw Me<tame (lnct.¥kng fi~ J,\Kle!1S>')fl/

04:57:35

When clicking one of the questions. you will receive a detailed question description, along with some guidance on how to submit your guess. The flags are all SHA I checksums, so you will often need to create a SHA I checksum of your guess!
The interface wi ll also provide an insight in what teams have already solved the question!

Submitting answers When clicking one of the questions, you will receive a detailed question description, along with some guidance on how to submit your guess. The flags are all SHAl checksums, so you will often need to create a SHA I checksum of your guess!
The interface will also provide an insight in what teams have already solved the question!

© 2017 Erik Van Buggenhout & Stephen Sims

13

Rules of Engagement
I
Some rules of engagement to adhere to:
· Don't just blacklist / block our attacker server at firewall level, as this will result in "no points";
· Don't break your own environment to stop the attacks, you are in a production environment that has to keep running;
· All network services that are running now should continue running; · · For the "non-defender" players: it's probably a good idea if you help out your
defender by suggesting hardening he can do. You should however also focus on DETECTING attacks, as your environment will also be attacked (but not scored), so you can be instrumental in answering questions about how the attacks are taking place... · Throughout the day, keep written notes of all attacks you observe. The team that can provide the best "summary of attacks" will receive additional bonus points.
Rules of engagement Some rules of engagement to adhere to:
· Don't just blacklist / block our attacker server at firewall level, as this will result in "no points"; · Don't break your own environment to stop the attacks, you are in a production environment that has to
keep running; · All network services that are running now should continue running; · For the "non-defender" players: it's probably a good idea if you help out your defender by suggesting
hardening he can do. You should however also focus on DETECTING attacks, as your environment will also be attacked (but not scored), so you can be instrumental in answering questions about how the attacks are taking place ... · Throughout the day, keep written notes of all attacks you observe. The team that can provide the best "summary of attacks" wi II receive additional bonus points.

14

© 2017 Erik Van Buggenhout & Stephen Sims

Questions?

?·

?
·

? ·

If you have any questions, now is the time to ask them...

Questions? lf you have any questions, now is the time to ask them .. .

© 2017 Erik Van Buggenhout & Stephen Sims

15

Summary
That's it - Here are the next steps (in order) to get you started:
1. Decide on team name & composition 2. Decide on a teammate that will be scored for his defenses against our APT 3. Launch the "Student" lab that is available in the lab platform! 4. Register your user & team (or join an existing team) 5. ONLY the selected "defender" (see step 2) should register himself in the
Attacker Server 6. Start solving questions!
Once everyone is ready to go, the Instructor will start the game!
SW
Summary That's it - Here are the next steps (in order) to get you started:
· Decide on team name & composition · Decide on a teammate that will be scored for his defenses against our APT · Launch the "Student" lab that is available in the lab platform! · Register your user & team (or join an existing team) · ONLY the selected "defender" (see step 2) should register himself in the Attacker Server · Start solving questions!
Once everyone is ready to go, the Instructor will start the game!

16

© 2017 Erik Van Buggenhout & Stephen Sims

Course Resources and Contact Information

0

AUTHOR CONTACT
ErikVan Buggenhout evanbuggenhout@nviso.be Stephen Sims ssims@sans.org

CYBER DEFENSE CONTACT

0

Stephen Sims ssims@sans.org

SANS INSTITUTE
8120 Woodmont Ave., Suite 310 Bethesda, MD 20814 301.654.SANS (7267)
SANS EMAIL
GENERAL INQUIRIES: info@sans.org REG ISTRATION: registration@sans.org TUITION: tuition@sans.org PRESS/PR: press@sans.org

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

17

This page intentionally left blank.

Index
%System% %TMP% (Not)Petya

1:88 1:102 1:37

A
access tokens Actions On Objectives Active Directory (AD)
ActiveX Address Space Layout Randomization (ASLR) Admin Approval Mode (AAM) Advanced
Advanced Persistent Threat (APT)
ADI Protect

4:43, 4:45, 4:102-104, 4:117-118, 4:164 1:65, 1:78, 5:7, 5:11 2:110, 3:7, 3:13, 3:15, 3:176-178, 3:188, 4:3-4, 4:14, 4:24, 4:32, 4:34, 4:52, 4:88, 4:90-100, 4:103-112, 4:114-133, 4:135-141, 4:148, 4:150, 4:157-158, 4:162, 4:184, 4:187, 5:53, 5:59, 5:62, 5:67, 5:72 2:138, 2:140, 2:143, 2:146, 2:156, 2:160161, 2:165, 2:168, 2:173, 2:182-183 3:29, 3:97-98, 3:105, 3:127, 3:129-131, 3:141 4:45-47, 4:50 1:1-2, 1:13, 1:20, 1:22, 1:34, 1:36, 1:60-61, 1:63, 1:70-71, 1:81, 1:83, 1:129, 1:142, 1:160, 1:162-163, 1:183, 1:185, 1:188, 2:1, 2=4-5, 2:9, 2:11, 2:13, 2:48, 2:54, 2:73, 2:91, 2:98-99, 2:105, 2:107, 2:111, 2:126, 2:184, 3:1, 3:17, 3:60, 3:73, 3:104, 3:141, 3:145, 3:160, 3:165, 3:169, 4:1, 4:8, 4:12, 4:59, 4:69, 4:75, 4:90, 4:104-105, 4:112, 4:115-116, 4:122, 4:129, 4:132, 4:164, 5:1, 5:7, 5:9, 5:11, 5:15, 5:18-19, 5:25-26, 5:29, 5:44-45, 5:53, 5:78, 5:83-84, 5:100, 5:110, 5:114-115, 5:130, 5:135, 5:137, 5:147, 5:151, 5:153-155, 5:157, 6:1-2 1:2, 1:11-12, 1:14, 1:20, 1:34, 1:51, 1:58-59, 1:63-64, 1:80-81, 1:87, 1:92, 1:96, 1:98, 1:106, 1:109, 1:122, 1:129, 1:145, 1:159, 1:188, 2:4, 2:23-24, 2:35, 3:4, 4:5, 4:15, 4:17-19, 4:22, 4:57, 4:59, 4:72, 4:84, 4:164, 5:5, 5:107, 5:122, 5:168, 6:1-2, 6:5, 6:16 5:62, 5:67

Index - 1

Affected Users Agent.BTZ Agilis Alternate Data Stream Amazon.com American Fuzzy Lop (AFL) Anonymous Anunak Apache Application whitelisting
AppLocker
AppSense APT Attack Cycl~
APT-1337 APT28 apt_regin_vfs ASCII
ATMMalware Attack Surface Reduction (ASR) Authentication Server (AS) Auto-start AutoOpen autorun
AutoRun
awareness

3:45
1:121
1:29 1:130, 2:155 1:45 3:64 1:42-43, 4:118, 5:26-27 1:34 2:95, 2:116, 2:122, 2:125, 4:13 1:72-74, 1:80, 1:148, 2:110-112, 2:140, 2:142, 2:162-163, 2:176, 3:3, 3:5, 3:71, 3:173-177, 3:184, 3:186, 3:188-190, 4:82, 4:140 1:73, 3:3, 3:5, 3:175-186, 3:188-189, 4:21, 4:24 3:175 1:2, 1:12, 1:14, 1:59, 1:80-81, 1:87, 1:92,
1:98, 1:109, 1:122, 1:129, 1:145, 1:159,
1:188, 2:4, 2:23-24, 3:4, 4:5, 4:57, 4:59, 4:84, 4:164, 5:5 1:145 1:58, 2:28, 4:17, 4:19, 4:22 1:139 1:100, 1:136, 2:67-69, 2:71, 2:91, 2:160, 3:58-59, 3:102, 3:107, 5:16, 5:158 1:29, 1:31-33 3:136 3:15-16, 4:96, 5:128 4:11, 4:26 1:106, 2:156, 2:158, 2:160-161 1:74-75, 1:101, 1:113, 2:46, 2:107, 2:109111, 2:158, 2:182, 3:168, 4:5-6, 4:25-27, 4:29-30, 4:55, 4:131, 5:162 1:74-75, 1:101, 1:113, 2:46, 2:107, 2:109111, 2:158, 2:182, 3:168, 4:5-6, 4:25-27, 4:29-30, 4:55, 4:131, 5:162 1:11, 1:59, 1:67, 1:70, 1:80, 1:156, 1:169, 2:2, 2:4, 2:7, 2:9, 2:12-15, 2:18, 2:21, 2:110, 2:141-142, 2:153, 2:158-159, 2:166, 2:169, 2:190, 3:51, 3:161, 4:122, 4:147,
5:122

Index - 2

B

Backup Operators Bangladesh Bank
Banking Trojan base64
Beginner's All-purpose Symbolic Instruction Code (BASIC) Belgacom International Carrier Services (BICS) BeRoot BinDiff Bing
BlackEnergy BloodHoundAD Bootkits botnet Box
Bring Your Own Device (BYOD) Bro Bromium vSentry buffer overflow
Bug bounty

4:99 1:22, 1:83, 1:85, 1:90-95, 1:107, 1:120, 1:126 1:22-23, 1:25-28, 2:84, 4:77 1:75, 2:24, 2:41, 2:161, 2:172, 2:181, 4:6, 4:39, 5:27, 5:36 2:137
1:83, 1:129
4:42, 4:54 3:73, 3:92-93 1:16, 1:23, 1:47, 1:64, 1:160, 1:174, 1:180, 3:114, 5:47, 5:54, 5:69 1:83, 1:96-106, 2:184 4:119 4:11, 4:22-24 1:45-48, 2:84, 4:13 1:11, 1:38, 1:69-70, 1:104-106, 1:141-142, 1:146, 1:148, 1:185, 2:2, 2:5, 2:36-39, 2:4143, 2:45-50, 2:52-55, 2:74, 2:79, 2:83, 2:88, 2:141-142, 2:147, 2:149-154, 2:166, 2:188, 3:28, 3:40, 3:51, 3:80, 3:95, 3:123, 3:127, 3:143, 3:182, 3:186, 4:70, 4:73, 4:123, 4:138, 4:158, 4:169, 5:9, 5:26, 5:30, 5:93, 5:155, 5:160 1:154, 2:11, 3:18, 3:20 4:66, 4:78 3:144 3:26, 3:56, 3:59, 3:61, 3:99-100, 3:104, 3:109, 3:132 3:48, 3:52-53

C
canaries canary Canarytokens

4:13 3:29, 3:97-98, 3:113, 3:117, 5:49, 5:57-63, 5:66-68 3:113, 4:88, 5:49, 5:58-59, 5:61-69 5:62-63, 5:65-66, 5:69

Index - 3

Carbanak Carbon Black CEN/XFS standard Central Intelligence Agency (CIA) Cerber Certification Authorities (CA) China Chopper Cigital CIRCL Cisco
Citadel ClamAV
cmdlet CodeSearchDiggity Command and Control (C&C)
Common Vulnerability Scoring System (CVSS) Compile-Time Controls Compound File Binary Format Computer Emergency Response Team (CERT) Computer Incident Response Team (CIRT) Containment Control Flow Enforcement (CET) Control Flow Guard (CFG) Control Flow Integrity (CFI) CopyKittens Core Impact Cortana CreateThread Credential Guard Cross-Site Request Forgery (CSRF) Cross-Site Scripting (XSS) CryptoLocker Crysis Cuckoo
Current Branch (CB)

1:22, 1:34-35, 4:18, 5:11 3:158 1:30-31 1:50 1:37 3:53, 4:65, 5:20, 5:22 4:12 3:36 1:176, 3:97, 5:90-91 2:27, 3:11, 3:13, 3:20, 3:24, 3:56, 4:60-61, 4:63, 4:66 1:22-23 1:135-136, 2:2, 2:57-58, 2:95, 2:97-99, 2:102-103, 2:190, 3:160, 3:162, 5:15, 5:92 2:168, 2:170-171, 2:174-175, 2:177 3:55 1:27, 1:47, 1:125, 2:82-83, 4:13, 4:68-71, 4:75, 5:80 3:37, 3:46
3:2, 3:97, 3:117-118 1:99, 2:147 5:135, 5:143, 5:152, 5:160-161
5:90, 5:135-136, 5:139-142, 5:145-147, 5:149, 5:151 5:138, 5:146, 5:150 3:114 3:69, 3:97-98, 3:111-112 3:114 4:16 3:77 5:11 2:163 4:112-114, 4:135, 4:138, 4:144-146 3:26 3:26, 3:44 1:23 1:37 1:104, 1:141-142, 2:2, 2:38-39, 2:42-47, 2:49-50, 2:52-55, 2:79, 2:190, 5:50, 5:159160 3:75

Index - 4

Current Branch for Business (CBB) CVE Cyber Kill Chain Cyber Threat Intelligence (CTI) Cybercop Sting

3:75 1:53, 3:73, 3:127, 3:139 1:65-66, 1:81 1:16, 5:75, 5:78, 5:104, 5:153 5:50

D

Damage
Dark Web DarkWeb DarkWebID DarunGrim Data Breach Investigations Report (DBIR) Data classification Data Execution Prevention (DEP)
Data Loss Prevention systems (DLP) Datagram daterange: DCSync deception
Deceptive Toolkit Decode64 decoy
Deep Panda default accounts Defense in Depth Delivery
Dell SecureWorks Denial of Service
Department of Homeland Security (DHS) Development

1:37, 1:43, 1:83, 1:161, 3:45, 3:113, 4:14, 5:137, 5:146 1:177-178 1:178 1:178 3:92 2:8
1:153, 1:169, 5:18, 5:42 3:29, 3:97-98, 3:106, 3:112, 3:122-123, 3:126, 3:132, 3:138, 3:141 1:78-79, 1:169, 4:85, 5:5, 5:32-34 3:58 1:174 4:123, 4:128-129, 4:136 1:11-12, 4:86, 4:187, 5:1, 5:3, 5:5, 5:23, 5:47, 5:50, 5:62, 5:67, 5:69, 5:71-72, 5:168 5:50 2:161 5:23, 5:46, 5:48-49, 5:51, 5:53, 5:58, 5:6768 4:12 4:100 3:97 1:11, 1:53, 1:65-66, 1:69-70, 1:72, 1:87, 1:92, 1:98, 1:109, 1:122, 1:127, 1:129, 2:2, 2:4, 2:7-9, 2:13-14, 2:82, 2:91, 2:105-111, 2:170, 2:190, 3:4, 3:111, 4:5, 4:57, 4:84,
5:5, 5:92, 5:113
1:65 1:20, 1:42, 1:44-45, 1:66, 1:97, 3:37, 3:4344, 4:13 3:37, 3:46 1:2, 1:16, 1:29, 1:31-33, 1:50, 1:53, 1:65,

Index - 5

DHCP negotiation DIAMETER Diaphora Diebold DigiNotar Directory Replication Service Remote (DRSR) Discoverability Distributed Denial of Service (DDoS) DLL search order hijacking Domain Admins Domain Keys Identified Mail (DKIM) Domain Users Domain-based Message Authentication, Reporting and Conformance (DMARC) DOUBLEFANTASY Downdelph downloader
DREAD Dridex Drive-by download Dropbox dropper Dropper DropSmack Duckhunt Ducky Duqu Dynamic Base Dynamic Link Library (DLL)

1:69, 1:72, 1:108, 1:152, 1:161, 1:167, 1:170, 1:175, 2:30, 2:73, 2:116, 2:149, 3:2, 3:4, 3:22-24, 3:28-31, 3:33-36, 3:43, 3:51, 3:54, 3:120-121, 3:126, 3:190, 4:77, 4:167, 5:12, 5:57, 5:154 3:8 3:15 3:92 1:29 5:22 4:129
3:45 1:37, 1:42-47, 1:97-98, 5:143 4:11, 4:19-21, 4:24, 4:36, 4:51 4:99, 4:119, 4:132 2:36 4:40, 4:99, 4:108, 5:168 2:36
1:52-53 4:19 2:143-144, 2:146, 2:160-162, 2:165, 2:173, 4:19 3:37, 3:45 1:22, 1:91 1:25, 1:37, 1:128-129, 2:83 4:70, 4:73, 5:26 1:88, 2:161-162, 2:165 1:88, 2:161-162, 2:165 4:73, 4:79 2:112 2:112-113 1:109 3:97 1:93-94, 1:113, 1:118, 1:130, 1:166, 2:54, 2:138, 2:160, 3:94, 3:105, 3:109, 3:111, 3:128-129, 3:136, 3:141, 3:168, 3:183, 4:11, 4:19-21, 4:24, 4:27, 4:36, 4:51

Index - 6

E

EAP Over LAN (EAPOL) EAP-IKEv2 EAP-PSK EAP-PWD ECMAScript Elasticsearch
Elasticsearch - Logstash - Kibana (ELK)
Elevation of Privilege Emerging Threats Empire Powershell ENDBR32 ENDBR64 Endpoint Detection & Response (EDR) Enhanced Mitigation Experience Tool (EMET)
Enhanced Mitigation Experience Toolkit (EMET)
Enterprise Admins Epic Turla Equation Group EQUATIONDRUG Eradication Event Forwarding Event Log Monitoring event logs
EVTX execute Disable (XD) Exfiltration
exploit kit Exploitability

3:14-15 3:14 3:14 3:14 2:137, 2:164, 2:167 2:30-31, 2:116-120, 2:128, 2:130, 2:133134, 4:161 2:30-32, 2:115-118, 2:126, 2:131, 2:133134, 2:190, 3:169, 4:25, 4:29, 4:153, 4:158, 4:184-185, 5:3, 5:116, 5:120, 5:129, 5:132133 3:38, 3:43-44, 3:46, 4:45, 4:47-49 2:27-28, 2:31-32, 2:91-92 2:172, 4:42 3:114 3:114 3:158, 3:170-171, 4:25, 5:154 1:73, 1:109, 2:163, 3:2, 3:5, 3:98, 3:110, 3:118, 3:120-126, 3:128-129, 3:131-133, 3:135, 3:137-142, 3:147, 3:168 1:73, 1:109, 2:163, 3:2, 3:5, 3:98, 3:110, 3:118, 3:120-126, 3:128-129, 3:131-133, 3:135, 3:137-142, 3:147, 3:168 4:99 1:51, 1:84, 1:95, 1:121, 1:123-125 1:51-53, 1:55-58, 1:96, 5:100 1:52-54, 1:56 5:138, 5:147, 5:150 4:158-159, 4:161, 4:182 4:162, 4:165, 4:182 1:66, 1:164, 2:176, 2:178-181, 3:176, 3:183, 4:4, 4:153-162, 4:165, 4:176, 4:178-182, 4:184-185, 4:187, 5:120 4:153, 4:157 3:106 1:11-12, 1:34, 1:59, 1:79, 1:122, 1:163, 4:32, 4:73, 4:75, 4:82, 4:85, 4:187, 5:1, 5:3, 5:5, 5:7-11, 5:14, 5:16, 5:24-27, 5:29-34, 5:3639, 5:41-42, 5:80, 5:84, 5:157, 5:168 1:37, 2:11, 2:23, 2:83-87, 2:92 3:45, 3:99

Index - 7

Exploitation
Export Address Table (EAT) Extensible Authentication Protocol (EAP) Extensible Storage Engine (ESE) eXtensions for Financial Services (XFS)

1:11, 1:51, 1:57, 1:65-66, 1:72-74, 1:87, 1:92, 1:98, 1:109, 1:122, 1:129, 2:4, 2:111, 2:169, 2:183, 2:190, 3:1, 3:4-5, 3:77, 3:97, 3:99, 3:105, 3:110, 3:117-118, 3:120-122, 3:126-127, 3:132, 3:140, 3:145, 3:147-148, 3:189-190, 4:5, 4:8, 4:42, 4:57, 4:84, 4:86, 4:112, 5:5, 5:100, 5:113 3:128 3:14-16 4:98 1:29-31, 1:33

F
FakeToken Federal Reserve Bank Feisty Chicken File Transfer Protocol (FTP) filetype: finalize the kill FireEye HX FireEyeMX FLASHFLOOD Fortify Fortinet Fox
Full Packet Capture (FPC) fuzzing

1:27-28 1:83, 1:91-92 1:145 3:58, 3:150, 4:68, 4:136, 5:29 1:174 1:78, 4:84, 5:5 3:158, 3:170 2:38, 2:55 4:17 3:29, 3:54-55 2:89, 4:66 1:43, 1:51, 1:128, 3:55, 3:70, 3:123, 4:71, 4:79, 4:117 1:164, 4:59, 4:62-64, 4:66 3:24, 3:30, 3:48, 3:56, 3:58-64, 3:190

G
Get-Child! tern Get-ExecutionPolicy Get-Help GetSystemDirectory GetWindowsDirectory Golden Ticket
Goldeneye Google

5:12-13 2:170 2:174 4:20 4:20 4:109, 4:116, 4:123, 4:125-130, 4:132, 4:162 1:37 1:51, 1:156, 1:167, 1:174, 1:180, 2:35, 2:98,

Index - 8

Google Drive Google Rapid Response (GRR)
GoPhish GRAYFISH Graylog Grok Group Policy Object (GPO) Group Policy Option (GPO) Group Policy Preferences (GPP) GRR

3:53, 3:55, 3:64, 3:92, 3:140, 4:64, 4:70, 5:22, 5:26, 5:61, 5:93, 5:151, 5:156, 5:163 2:35, 5:26 1:136, 3:158, 3:170, 5:4, 5:151, 5:154, 5:156-158, 5:163, 5:165-166, 5:168 2:15-21 1:52-56 2:115 2:116, 2:125 2:187, 3:75, 3:155, 3:182, 4:29 2:187, 3:75, 3:155, 4:29 4:36, 4:40-41 1:136, 3:158, 3:170, 5:4, 5:151, 5:154, 5:156-158, 5:163, 5:165-166, 5:168

H

Hacktivism HAMMERTOSS Hardentools HDDCryptor headers heap overflow Hijack
honeypot
Host Intrusion Detection System (HIDS) Human Interface Device (HID) Hunting Maturity Model (HMM)

1:42 4:72, 4:79 2:182-183, 2:185 1:37 1:139, 2:36, 2:91, 4:13, 4:59, 4:75 3:99 1:118, 3:109, 3:113, 4:11, 4:19-21, 4:24, 4:27, 4:36, 4:51, 5:15-16 4:88, 5:3, 5:49-57, 5:62, 5:66, 5:68, 5:7172 3:158, 3:168-169, 3:171 2:112 5:117

IDA Pro Identification
IEEE 802.1X Immunity Canvas Incidence response Incognito Indicator of Compromise (IoC)

3:73 1:17, 1:98, 3:7-8, 3:27, 4:90-91, 4:93, 5:110, 5:138, 5:145, 5:150 3:14, 3:20 3:77 5:135, 5:139-141, 5:143-149, 5:163 4:104, 4:117-118 5:77, 5:86, 5:96, 5:166
Index - 9

Indirect Branch Tracking Industrial Control Systems (ICS) Information Disclosure InsightVM Institute of Electrical and Electronics Engineers (IEEE) integer overflow Interactive Disassembler (IDA) Internet Control Message Protocol (ICMP) Internet Exploiter Internet Message Access Protocol (IMAP) Internet of Things (IoT) Internet Relay Chat (IRC) Intrusion Detection System (IDS)
Intrusion Prevention System (IPS)
inurl: Invoke-Expression Ivanti

3:114 1:19, 1:108, 1:118, 1:180 3:43-44 1:184 3:14, 3:20
3:99 3:54, 3:73, 3:92, 3:126 1:129, 5:29
3:127 2:37, 5:29 1:19, 1:45-47, 3:20 5:29 1:74, 1:79, 1:136, 1:151-152, 2:2, 2:23-24, 2:26-28, 2:30-32, 2:38-39, 2:44, 2:52-53, 2:55, 2:91-92, 2:95, 3:73, 3:158, 3:168, 4:25, 4:60, 4:62, 4:66, 4:75, 4:81-82, 4:85, 4:88, 5:32-33, 5:41-42, 5:61, 5:93, 5:95, 5:110, 5:118 1:70, 1:74, 1:80, 1:136, 1:151-152, 1:172, 2:2, 2:5, 2:23-24, 2:26-27, 2:30, 2:32, 2:39, 2:52-53, 2:55, 2:91-92, 4:5, 4:66, 4:74-75, 4:88, 4:136, 5:95, 5:118 1:174 2:174-175 3:72

J
JAVA
JavaScript
JavaScript Object Notation (JSON) Javelin JHUHUGIT Jigsaw JScript

1:36, 1:38-40, 1:53, 1:122, 2:23, 2:84, 2:116, 2:118-120, 2:137, 2:164, 2:167, 2:174, 2:182-183, 3:54-55, 3:121, 3:136, 3:141, 4:13 1:36, 1:38-40, 2:23, 2:137, 2:164, 2:167, 2:174, 2:182-183, 4:13 2:23, 2:29-30, 2:116, 2:125, 2:130-131 5:62, 5:67 4:17 1:37 2:137, 2:140, 2:164-167, 2:170-171, 2:174175, 3:159

Index - 10

Juniper

K

KAL software stack Kali Linux Kaspersky
Kerberos
Key Distribution Center (KDC) Kibana
Kill Chain
KillDisk Kippo Knowledge Base (KB) Komitet Gosudarstvennoy Bezopasnosti (KGB)

1:33 5:46 1:28, 1:34, 1:52-53, 1:55-56, 1:127, 1:129, 1:134, 1:139, 1:167, 2:63, 4:15, 5:30 4:95-97, 4:109, 4:112, 4:115-116, 4:123, 4:125-127, 4:129, 4:133, 4:136, 4:148 4:95-96, 4:127 2:2, 2:30-31, 2:115-118, 2:121-123, 2:127131, 2:133-134, 4:184, 5:129, 5:132 1:17, 1:59, 1:64-67, 1:70-71, 1:78-81, 1:109, 2:4-5, 4:84-85, 5:5, 5:30 1:97 5:56, 5:69 3:78-80, 3:82-83, 3:85, 3:106, 4:157 1:50

L
Lateral Movement
lcamtuf LDRPCheckNXCompatibility Least privilege
LeChiffre Lessons Learned link: Lizard Squad LMhashing LoadLibraryExW() location: Lockheed Martin Locky

1:11, 1:34, 1:37, 1:59, 1:78-79, 1:122, 1:128129, 1:148, 3:160, 3:190, 4:1, 4:3-5, 4:15, 4:25, 4:63, 4:84-88, 4:119, 4:135, 4:150151, 4:162, 4:178-180, 4:182, 4:184-185, 4:187, 5:5, 5:101 3:64 3:97 1:72, 2:9, 3:4, 4:3, 4:32, 4:34, 4:36, 4:52, 4:99, 4:147 1:37 5:138, 5:141, 5:145, 5:149-150 1:174, 2:159, 4:178 1:42 4:98 3:94 1:174 1:65 1:37

Index - 11

Logstash
Loki Long-Term Servicing Branch (LTSB) Loose Lips Sink Ships Loose Tweets Sink Fleets Lucene Lulzsec Lumension Lynis

2:30, 2:115-116, 2:118, 2:124-126, 2:131, 2:133-134 5:3, 5:96-103, 5:105, 5:107-108, 5:156 3:75 1:68 1:68 2:31, 2:116 1:42-43, 1:58 3:76 3:154

M
MAC address macro
MacroExpl Malware Information Sharing Platform (MISP) Malwarebytes Anti-Exploit (MBAE) Mark-of-web Masscan Master Boot Record (MBR) MD4 MD5
MemGC Metasploit
Meterpreter Microsoft Management Console (MMC) MIME Mimikatz
Mirai MITRE Mobile Device Management (MDM) mobile messages MongoDB

3:8, 3:17 1:36, 1:69, 1:72, 1:98-102, 1:148, 2:11, 2:35, 2:58, 2:146-148, 2:153, 2:156-159, 2:182, 2:184, 2:188, 3:4, 3:141, 3:167, 3:185, 5:61, 5:113 1:101-102 5:3, 5:88-94, 5:105, 5:107-108, 5:160, 5:168 3:140-143 2:154-155, 2:158, 2:166 1:179 1:37, 1:55, 1:86, 1:88, 4:11, 4:22-23 4:98 1:99, 1:103-104, 2:40, 4:98, 5:79, 5:88, 5:92, 5:103 3:70, 3:97 2:172, 3:77, 3:147, 3:160, 4:16, 4:41, 4:51, 4:108-109, 4:112, 4:117, 5:14 3:141, 4:16, 4:109, 4:117-118, 5:14 4:153-154 2:24, 2:40-41 1:37, 1:51, 4:108-112, 4:114-116, 4:119, 4:125-133, 4:135-136, 4:141, 4:143, 4:148, 4:151, 4:178-180, 5:60, 5:101 1:45-47 1:16, 4:11, 4:27 3:18-20 1:27-28 1:36

Index - 12

mTAN Mutation Mutexes MySQL

1:23-24, 1:27-28 3:30, 3:56-57, 3:61-62, 3:64 2:63 1:36, 2:116, 2:125

N
National Institute of Standards and Technology (NIST) National Software Reference Library (NSRL) Nessus NetFlow Network Access Control (NAC) Network Access Protection (NAP) Nexpose NGINX NMAP No execute (NX) Notpetya NTLM One Way Function (NTOWF) null pointer

1:184, 3:2, 3:49-50, 3:66-67, 4:112 1:157, 2:24, 4:59-62 3:2, 3:7, 3:9-15, 3:17-18, 3:20, 3:190 3:12 1:184, 3:49 2:122-123 1:179, 3:160 3:106 1:141-142, 4:16, 4:132, 5:67, 5:101 4:98 3:99

0
OASIS obfuscation Object Linking and Embedding (OLE) Objective Met ObOpenObjectByName() OCTAVE oledump.py OneDrive OnionScan Open Information Security Foundation
Open Source INTelligence (OSINT)
OpenSSH OpenVPN Operation Groundbait OS Controls OSQuery

1:16 1:39-40, 2:144, 2:165, 2:167, 2:174-175 1:99, 2:182 1:65 1:124 3:37, 3:46 1:99-100, 1:103, 2:57 5:26 1:177-178 2:23 1:177, 5:91 1:180 4:37-38 4:19 3:97 4:75, 5:3, 5:126-129, 5:132-133, 5:154,

Index - 13

OSSEC OWASP
p
PacketFilter (PF) PaloAlto Paranoid Fish (Pa-fish) Pastebin Pastemon Pastepwnd Patch diffing PatchClean Patchdiff2 PatchExtract Patchlink PayPal PCAP Peach Pecheck.py Persistence
Persistent
Petya PfSense
phishing
Ploutus Point of Sale (POS) polymorphic Polyverse POP Popcorn Time Port-based NAC (PNAC)
Index - 14

5:168 3:158, 3:169 3:24, 3:36-37
2:95, 3:158 4:66 2:54 1:175-178, 3:85, 3:87-88, 4:71, 5:27, 5:61 1:176 1:176 3:73, 3:91 3:88, 3:90 3:92 3:87-88 3:76 1:45, 4:13 2:23-24, 2:44, 2:86-87, 4:63 3:63 1:103 1:11, 1:56, 1:66, 1:74-75, 1:88, 1:111, 1:115116, 1:123-124, 1:163, 2:46, 3:168, 4:3, 4:5-6, 4:8-12, 4:14-19, 4:22, 4:24-27, 4:29-30, 4:36, 4:104-105, 4:123-130, 4:187 1:22, 1:59, 1:63, 1:66, 1:87, 1:92, 1:98, 2:63, 4:61, 4:63, 4:123, 5:44-45, 6:2, 6:11 1:37, 1:141-142, 4:16, 4:132, 5:67, 5:101 2:2, 2:95-100, 2:102-103, 2:133-134, 2:190, 4:81, 5:41 1:23, 1:34, 1:36-38, 1:47, 1:63, 1:70, 1:8687, 1:97-99, 1:122, 1:148, 1:186, 2:7-9, 2:11-20, 2:35-36, 2:83, 3:51, 4:87, 5:84, 5:89, 5:113, 5:121, 5:143 1:33 1:22 2:157, 2:175, 3:145 3:145 2:37, 3:135, 5:29 1:37 3:20

Post Office Protocol (POP3) PowerShell
PowerUp Preparation Prikormka Print Spooler Service Printouts Programmable Logic Controller (PLC) ProjectSauron Proofpoint Protected View PsExec Public Broadcasting Public Key Infrastructure (PKI) PUSH
Pyramid of Pain Pystemon

5:29 2:137, 2:168-182, 2:184, 2:187-188, 3:76, 3:85, 3:87-88, 3:186, 4:25, 4:41-42, 4:51, 4:109, 4:153, 4:181, 5:12-13, 5:17, 5:60, 5:96, 5:125, 5:151-152, 5:162 4:21, 4:42, 4:54 1:14, 1:80, 5:138, 5:140-141, 5:150 4:19 1:113 5:37 1:83, 1:109, 1:111, 1:118-119 4:15 2:27 2:147, 2:149, 2:152-154, 2:158 1:37, 4:112, 5:125 1:43 2:157, 3:15, 4:49, 4:65, 5:20-22 1:78, 3:74-76, 3:113-114, 3:120, 3:127, 3:133, 3:135, 3:188, 4:84, 4:158, 5:5 5:78-84 1:176

Q
Qualys Quisquater Quoted Printable (QP)

1:184, 3:49 1:127 2:41

R
race condition RADIUS Random-Access Memory (RAM) Ransomware
Rapid7 Read-only domain controller Realtek

3:77, 3:99 3:15-16 3:106, 3:108, 4:22 1:20, 1:22-23, 1:28, 1:36-40, 1:58, 1:74, 1:76, 27, 2:13, 2:35, 2:45-46, 2:61-63, 2:84, 2:86, 2:182, 2:184, 3:140, 4:57, 4:132, 5:19, 5:67, 5:88, 5:101, 5:110, 5:137, 5:143-144 3:49 4:137, 4:139 1:116

Index - 15

Recon
Reconnaissance
RecordedFuture Recovery
Reference Data Set (RDS) Regin
Registry Manipulation related: Remote Access Tool (RAT) Remote Code Execution (RCE) Remote Desktop Protocol (RDP) Remote Desktop Users Remote Procedure Call (RPC) Remsec Reporter Reproducibility Repudiation Request For Comment (RFC) RET Return Oriented Programming (ROP) RFC3261 RFC4406 RFC5321 RFC5322 RFC6367 RFC7489 Role based access controls (RBAC) RomeoAlfa RtlMoveMemory Rubber Ducky RunAsPPL

1:3, 1:11, 1:65-70, 1:78-79, 1:87, 1:91-92, 1:97-98, 1:109, 1:119, 1:122, 1:128-129, 1:146, 1:168, 1:186, 2:4, 2:7, 3:4, 3:7, 3:180, 4:5, 4:9, 4:12, 4:57, 4:84-85, 4:168, 4:171, 5:5, 5:84, 5:113 1:11, 1:65-70, 1:78-79, 1:87, 1:91-92, 1:9798, 1:109, 1:119, 1:122, 1:128-129, 1:146, 1:168, 1:186, 2:4, 2:7, 3:4, 3:7, 4:5, 4:12, 4:57, 4:84-85, 5:5, 5:84, 5:113 1:178, 3:73 2:46, 4:99-100, 4:106, 4:122, 5:138, 5:148, 5:150, 5:155 1:164-166 1:51-52, 1:83, 1:85, 1:90, 1:95, 1:107, 1:120-121, 1:126-139, 1:141-142, 5:100 4:11, 4:17 1:174, 4:90 4:16, 4:25 1:53, 1:113, 1:170, 2:147, 3:52, 4:14 1:37, 4:140 4:99 1:117, 3:63, 4:15 4:15 1:87-88
3:45 3:43-44 2:36, 3:14, 3:56, 3:58-59 3:135 3:111-112, 3:114, 3:131-135 3:56 2:36 2:36 2:36 2:36 2:36 2:88, 4:34 4:17 2:163 2:112-113 4:142

Index - 16

s

s7otbxdx.dll Sabotage Safe Structured Exception Handling (SafeSEH) SafeDllSearchMode SafeSEH SAINT Exploit SCADA Schema Admins Scirius Search order SearchDiggity Secure Socket Layer (SSL) Secure-SD LC SecureWorks Securing The Human Security Content Automation Protocol (SCAP) Security Development Lifecycle (SDL) segmentation
Sender ID Sender Policy Framework (SPF) SentinelOne Service Programming Interfaces (SPI) Session Initiation Protocol (SIP) SHA1 Shadow Copies Shadow IT Shadow Stacks ShadowBrokers Shamoon
SharePoint Shavlik Shodan Short Message Service (SMS) Simple Mail Transfer Protocol (SMTP)
Simulate Execution Flow (SimExecFlow)

1:118 1:20-21, 1:41-42, 1:49, 1:83 3:29, 3:97-98, 3:107-109
4:20-21 3:29, 3:97-98, 3:107-109
3:77
1:19, 1:83, 1:97-98, 2:28 4:99 2:30 4:11, 4:19-21, 4:24, 4:36, 4:51 3:55 2:88, 2:91, 2:93, 4:59, 4:62, 4:64-66, 4:76 3:22, 3:24 1:65 2:21 3:152-153, 3:155
3:2, 3:22-27, 3:29, 3:31-36, 3:46, 3:190 1:78, 1:147-148, 1:150, 1:153, 1:156-157, 2:117, 3:102-103, 4:4, 4:59, 4:87-88, 4:135-136, 4:148, 5:17 2:36 2:36-37 3:158, 3:170 1:30 3:56 4:171, 5:92, 5:103, 6:13 1:39-40, 4:105 1:170-171, 2:136 . 3:114 1:37 1:51, 1:83, 1:85-88, 1:90, 1:95, 1:107, 1:120, 1:126, 1:141-142, 4:15 4:32 3:72 1:180-182 1:27-28, 1:32-33, 1:53 1:11, 2:19, 2:23-24, 2:28, 2:36-37, 2:39-41, 2:49, 2:52-53, 2:55, 2:91, 3:163, 5:29, 5:82 3:134

Index -17

Single Sign On (SSO) site: SMTP relay Snort social engineering
Software Defined Networks (SDN) Software Development Life Cycle (SDLC) Software Restriction Policies (SRP)
Sony Sony Pictures Sophos Splunk Spoofing Identity SQL injection (SQLi) Squid
SquidGuard Stack overflow Stack Pivot Stack Shield Start-Transcript Static Analysis STDERR STDIN STDOUT steganography strcpy() STRIDE Strider Strums Structured Exception Handling Overwrite Protection (SEHOP) Structured Threat Information eXpression (STIX) Stuxnet
Sun Tzu Supervisory Control And Data Acquisition (SCADA) Suricata

4:103, 4:117, 4:164 1:166, 1:174, 3:174, 3:189, 4:64, 5:159
2:19
2:24, 2:26-27, 2:30, 2:39, 2:95, 4:62, 4:66 1:32, 1:112, 1:186, 2:12-14, 2:21, 2:106107, 2:109-111, 2:143, 2:153, 2:165, 2:176, 3:37, 3:51, 4:132 1:153 3:22-25, 3:36, 3:43, 3:48, 3:54, 4:14 1:73, 2:187, 3:5, 3:175-176, 3:184-185, 4:24 1:43, 1:167, 4:18 4:18 4:66 2:115-116, 4:153, 4:158, 4:165, 5:34, 5:39 3:44 1:43, 3:26, 3:44-45 2:2, 2:95, 2:97-100, 2:102-103, 2:134,
2:190
2:97, 2:99-100, 2:102-103, 2:134 3:102-103 3:135, 3:143 3:114 2:177-178 1:99, 1:103, 1:141, 2:42, 3:22, 3:54-55 2:138
2:138, 3:100-101
2:138 1:76, 4:57, 4:59, 4:70-72 3:100-102, 3:113 3:23, 3:37, 3:44, 3:46, 4:15 4:15 1:178 3:97-98, 3:110, 3:123, 3:126
1:16-17, 5:155
1:51-52, 1:55, 1:66, 1:83, 1:85, 1:90, 1:95, 1:107-120, 1:125-126, 2:111 1:159 1:19, 1:83, 1:97-98, 2:28
2:2, 2:23-32, 2:38-41, 2:44, 2:49, 2:52-55,

Index - 18

SWIFT Sysinternals Sysmon
T
Talos Tampering with Data Target Defined Task schedule TearStopper TechNet Thinkst Canary Thread Information Block (TIB) Threat
threat intelligence
Threat modeling Ticket Granting Service (TGS) Ticket-Granting-Ticket (TGT) Top Level Domain (TLD) top-secret-project Transport Layer Security (TLS) TRIKE Trivial File Transfer Protocol (TFTP) Trust Center

2:91-92, 2:95, 2:131, 2:190, 4:3, 4:60, 4:62, 4:66, 4:81-82, 5:3, 5:41-42, 5:159 1:34, 1:83, 1:91-93, 4:176, 5:152 2:63, 4:25, 4:27, 4:153, 4:157, 4:167-169 1:73-74, 1:91-92, 3:5, 4:5, 4:157, 4:167-177, 4:180, 4:185, 4:187
1:167, 2:27 3:44 1:65 1:74, 1:113-115, 4:11, 4:15-16, 4:25 2:72 2:180, 2:185, 3:53, 3:74-75, 3:78, 3:110, 4:182 5:62, 5:66 3:132, 3:135 1:2, 1:11-12, 1:14, 1:16-17, 1:28, 1:33, 1:44, 1:58, 1:61, 1:63, 1:81, 1:91, 1:162, 1:188, 2:8, 2:11, 2:13, 2:23, 2:27-28, 2:31-32, 2:80, 2:82, 2:91-92, 3:2, 3:23, 3:26, 3:28, 3:30-31, 3:35-46, 3:137-138, 4:12, 4:15, 4:18, 4:78, 4:138, 5:3, 5:55, 5:74-78, 5:8588, 5:90, 5:94-96, 5:104-105, 5:107-108, 5:115-130, 5:133, 5:137, 5:141, 5:143, 5:145-146, 5:149-150, 5:153, 5:161-162, 5:168, 6:2 1:12, 1:16, 1:162, 2:27, 5:3, 5:55, 5:74-77, 5:85-88, 5:95-96, 5:104-105, 5:107-108, 5:116-117, 5:137, 5:146, 5:149, 5:153, 5:161, 5:168 3:2, 3:23, 3:26, 3:28, 3:31, 3:35-44, 3:46 4:96 4:95-96, 4:115-116, 4:125, 4:127 5:81
5:23
2:24, 2:88, 3:159, 4:59, 4:62, 4:64-66, 4:76 3:37, 3:46, 4:12, 5:47 3:58-59 2:147, 2:152, 2:155, 2:157

Index - 19

Trusted Platform Module (TPM) Trustworthy Computing (TwC) Turbodiff Turla
Two-Factor Authentication

4:23 3:23 3:92 1:51, 1:83-85, 1:90, 1:95, 1:107, 1:120-127, 4:71, 4:79 1:27, 1:148

u

UNICODE
use after free Use After Free (UAF) User Account Control (UAC)
User Datagram Protocol (UDP) User Interface Privilege Isolation (UIPI)

2:67-69, 2:71, 2:160, 2:172, 4:71, 4:98, 5:16 3:26, 3:70, 3:99, 3:127-128, 3:135 3:26, 3:70, 3:99, 3:127-128, 3:135 1:72, 2:109, 2:182, 3:4, 4:3, 4:43-47, 4:4952 1:129, 2:28, 3:7-8, 3:58, 4:68 4:46

V
VBScript
Veracode Static Analysis Virtual Local Area Network (VLAN) VirtuaWloc VirtuaWloc() Virtualization Technology (VT) VirtualProtect() VirusTotal
Visa Visio Visual Basic for Applications (VBA)
VisualCodeGrepper VMEM.sys Voice Over Internet Protocol (VOIP) Volume Boot Record (VBR)

2:136-141, 2:143-146, 2:164-166, 2:174, 2:182, 3:136, 3:159 3:55 3:10, 3:17, 4:136 2:163, 3:112, 3:122, 3:130, 3:132-133 3:112, 3:122, 3:130, 3:132-133 3:144 3:112, 3:132-134 1:99, 1:103-104, 1:135, 2:57, 2:76, 3:161, 4:26, 5:27-28 1:45, 2:18, 3:50, 5:136 3:24, 3:33, 3:38, 3:58, 3:74 1:97-103, 1:106, 2:58, 2:137, 2:146-148, 2:153, 2:156-158, 2:160-163, 2:165, 2:168, 2:170, 2:173, 2:184, 2:188, 3:141, 5:61 3:55 1:130-134, 1:137 3:17, 3:56, 3:151 1:55, 4:22-23

Index - 20

w

Wannacry
Wery Weaponization
Web shell Webshell Wevutil.exe WikiLeaks WinDbg Windows as a Service (WaaS) Windows Management Instrumentation (WMI) Windows Management Instrumentation Command-line (WMIC) Windows Script Host (WSH)
Windows Server Update Service (WSUS) Windows Server Update Services (WSUS) Windows Update for Business (WUB) Winternals Wiper Write-Host
wso

1:141-142, 2:45, 2:61-63, 2:65, 2:68-69, 2:72, 2:75, 5:88 1:37, 2:7, 2:61-62, 2:65 1:65-66, 1:69-70, 1:76, 1:80, 1:87, 1:92, 1:98, 1:109, 1:122, 1:129, 2:4, 3:4, 4:5, 4:57, 4:84, 5:5, 5:113 4:8-9, 4:11-14 1:74, 4:5 4:153, 4:155 1:43 3:126 3:74-75 3:141, 4:25, 4:156, 5:125
2:138-141, 2:143, 2:145-146, 2:164, 2:169, 2:176, 2:182, 2:185, 2:187-188 3:73, 3:75-76 3:73, 3:75-76 3:75-76 4:167 1:86-88 2:171, 2:175, 2:178-179, 2:181 4:13

X
X Factor XFS Manager

y
YAML Ain't Markup Language (YAML) YARA

2:23, 2:25
1:134-139, 2:2, 2:57-77, 2:79-80, 2:102103, 2:144, 2:190, 3:162, 5:15-16, 5:92, 5:96-100, 5:102, 5:107, 5:159

Index - 21

z
Zbot Zero Flag Zero Trust zero-day
Zeus Zeus-in-the-mobile (ZitMo) Zone.Identifier Zoneld ZwCreateKey() ZwEnumerateKey() ZwQueryKey() ZwReadFile() ZwSaveKey() ZwTerminateProcess()

1:23
1:94
1:150, 1:154-157 1:52, 1:55, 1:63, 1:72, 1:106, 1:108-109, 1:112-113, 1:115, 1:183, 2:111, 3:4, 5:57 1:22-26, 4:77 1:23-24 2:155 2:155
1:124 1:124 1:124 1:124 1:124 1:124

Index - 22

