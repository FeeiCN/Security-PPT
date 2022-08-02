Warning! Botnet is in your house...
Sarit Yerushalmi and Vitaly Simonovich
Security Researchers Imperva, 2022

Ab out us
Sa rit Ye rus ha lmi
Se c urity Re s e a rc he r @ Imp e rva We b Ap p lic a tion Se c urity De ve lop a lg orithm s
s a rit.ye rus ha lm i@im p e rva .c om

2

Proprietary and confidential. Do not distribute.

Vitaly Simonovich
Security Research Manager @ Imperva We b a p p lic a tion a nd d a ta s e c urity Te a c hing CTF
vita lys @im p e rva .c om

Research

3

Proprietary and confidential. Do not distribute.

Research goals
How the botnet operates

What is its purpose

4

Proprietary and confidential. Do not distribute.

When it started

Initial discovery

Attack trend study
High exploitation of PHPUnit RCE CVE- 2017- 9841

5

Proprietary and confidential. Do not distribute.

PHPUnit quick review
PHPUnit Remote Code Execution CVE- 2017- 9841

6

Proprietary and confidential. Do not distribute.

How the botnet operates

7

Proprietary and confidential. Do not distribute.

Analysis of the Initial Request

8

Proprietary and confidential. Do not distribute.

The payload - "traber.pl "

9

Proprietary and confidential. Do not distribute.

The payload - "traber.pl " decoded

10

Proprietary and confidential. Do not distribute.

"update.py "

11

Proprietary and confidential. Do not distribute.

"update.py " request

12

Proprietary and confidential. Do not distribute.

"update.py " response

13

Proprietary and confidential. Do not distribute.

Recap

Victim
New victims

14

Proprietary and confidential. Do not distribute.

Download "traber.pl"

Cron job

Attack instructions
C&C

Download "downloader.zip"
contains "update.py"

Attack instructions analysis

Fake bot

Parse the JSON
GET
C&C

J SON p a rs ing ...

"CSS" files:  Inme moryc ms .c s s  Inme moryd .c s s  Inme moryd a v.c s s  Inme morye lf.c s s  Inme moryjq .c s s ...
Ma ny Re p os itorie s c omp romis e d s ite s

15

Proprietary and confidential. Do not distribute.

Repository B

 Stores the bundles  Hiding under the /css directory  Start with `inmemory' prefix  Disguise zip files with .css extension

16

Proprietary and confidential. Do not distribute.

"vBulletin " Bundle
Supporting package

17

Proprietary and confidential. Do not distribute.

"vBulletin " Bundle
Entry point

18

Proprietary and confidential. Do not distribute.

"vBulletin " Bundle
The "manager"

19

Proprietary and confidential. Do not distribute.

"vBulletin " Bundle
Exploit

20

Proprietary and confidential. Do not distribute.

Bundle reporting

21

Proprietary and confidential. Do not distribute.

Bundle payloads
File upload

22

Proprietary and confidential. Do not distribute.

Bundle payloads
WordPress brute force

23

Proprietary and confidential. Do not distribute.

Bundles summary
Partial Vulnerabilities List:
 CVE- 2 0 19 - 16 75 9 - vBulle tin Wid g e t RCE  CVE- 2 0 19 - 9 19 4 - ELFind e r Comma nd Inje c tion  CVE- 2 0 18 - 9 2 0 6 - J Que ry file up loa d  CVE- 2 0 15 - 2 0 6 7 - Ma g ne to Loc a l File Inc lus ion  CVE- 2 0 15 - 75 71 - Plup loa d File Up loa d  CVE- 2 0 11- 4 10 6 - Word Pre s s TimThumb RFI

Main vulnerability categories:
 Remote Code execution (RCE)  File upload  Remote File Inclusion (RFI)

24

Proprietary and confidential. Do not distribute.

What is the botnet purpose

25

Proprietary and confidential. Do not distribute.

Honeypot creation

Victim Server (Running CMS)

26

Proprietary and confidential. Do not distribute.

Report

Fake bot

C&C

Play as a victim
Report the C&C of a successful attack

Upload second webshell with command execution

Attacker approach the honeypot

Escalate privileges

27

Proprietary and confidential. Do not distribute.

Outcome: Complete control on the infected server

Botnet purpose
Click bite and crypto mining

28

Proprietary and confidential. Do not distribute.

Botnet purpose
Spreading and pending bots

Spreading Bot:

Victim Server (Running CMS)

Pending Bot:

Victim Server (Running CMS)

29

Proprietary and confidential. Do not distribute.

Spreading bot C&C

C&C

Botnet Entities
Bot Infrastructure
C&C
Repository A
Repository B

30

Proprietary and confidential. Do not distribute.

Third Party Services

Botnet Actors
Victim
Pending Bot

Spreading Bot

When it all started

31

Proprietary and confidential. Do not distribute.

The birth of KashmirBlack botnet

32

Proprietary and confidential. Do not distribute.

KashmirBlack activity timeline

Code Analysis

First notice botnet activity

Last evidence

May 2016

November 2019

October 2020

January 2020
Requests in our data

Blogs publication

June 2021

33

Proprietary and confidential. Do not distribute.

KashmirBlack evolution

34

Proprietary and confidential. Do not distribute.

Infrastructure phase 1 - initial state

35

Proprietary and confidential. Do not distribute.

Infrastructure phase 2 - spreading the bundles

36

Proprietary and confidential. Do not distribute.

Infrastructure phase 3 - load balancing and hiding the C&C

37

Proprietary and confidential. Do not distribute.

Infrastructure phase 4 - using Dropbox

38

Proprietary and confidential. Do not distribute.

Breaking into the attackers Dropbox account
adeliap payload  400 thousands of instructions loot nosql  1 report
Proprietary and confidential. Do not distribute.

Communication - attack instructions requests

40

Proprietary and confidential. Do not distribute.

Communication - new notification

41

Proprietary and confidential. Do not distribute.

KashmirBlack estimated botnet size
 285 bots  480 attacks per day for single bot  140K attacks per day  0.5% of success  1000 new bots  By day 7 almost half million bots

42

Proprietary and confidential. Do not distribute.

Detections and mitigations

43

Proprietary and confidential. Do not distribute.

Indicators

1
Patch management

2
File extensions

4
Reduce
attack
surface

44

Proprietary and confidential. Do not distribute.

5
tmp directory

3
Cron jobs
6
3rd party services

Patch management

45

Proprietary and confidential. Do not distribute.

File extensions

46

Proprietary and confidential. Do not distribute.

Cron jobs

47

Proprietary and confidential. Do not distribute.

Reduce attack surface

48

Proprietary and confidential. Do not distribute.

"tmp " directory

49

Proprietary and confidential. Do not distribute.

3rd party services

50

Proprietary and confidential. Do not distribute.

Thank You!
Sarit Yerushalmi and Vitaly Simonovich sarit.yerushalmi@imperva.com Twitter: @sarity85 vitalys@imperva.com Twitter: @_CyberJoker_

