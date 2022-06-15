Who Controls the Controllers?
Hacking Crestron IoT Automation Systems

Who am I?

· Offensive Security Research on ASR team at Trend Micro
­ Focused mainly on IoT research ­ Break things in interesting ways and build cool exploit
demos ­ Report vulns to ZDI and work with vendors to fix issues ­ 40+ disclosed vulnerabilities
· Conference speaker
­ Defcon, Recon, Ruxcon, Toorcon, etc

2

Copyright 2017 Trend Micro Inc.

What is Crestron?

3

Copyright 2017 Trend Micro Inc.

IoT Device Controllers

· Audio/video distribution · Lighting/shades · Home automation · Building management systems (BACNET) · Access control/security · Etc...

4

Copyright 2017 Trend Micro Inc.

Fully Programmable/Customizable
· SIMPL
­ Symbol Intensive Master Programming Language ­ Write programs for UI and device actions
· Device control methods
­ IR ­ Serial ­ TCP/IP ­ Relay ­ MIDI ­ Cresnet
· Interact with and program controllers via Crestron Terminal Protocol (CTP) · Crestron devices intercommunicate via Crestron Internet Protocol (CIP) · Programming can be complex, usually handled by professionals

5

Copyright 2017 Trend Micro Inc.

Deployment
· Universities · Office environments · Sports arenas · Airports · Hotels · Rich people's houses

6

Copyright 2017 Trend Micro Inc.

Deployment

https://www.crestron.com/getmedia/06b92c9d-c262-4190-bf52-4180d8f77fca/mg_2017_Brochure_Workplace-Tech-Design-Guide

7

Copyright 2017 Trend Micro Inc.

Deployment
· "Microsoft chose Crestron as its exclusive partner to manage all AV and meeting room resources worldwide."
­ https://support.crestron.com/app/answers/answer_view/a_id /4818/~/what-kind-of-security-and-encryption-crestrondeploys
· "Crestron and Microsoft are technology leaders now working together to develop future digital media innovations."
­ http://www.crestron.com/getmedia/3321a1e7-f0d6-47b89021-a473981f8983/cs_Microsoft_World_Headquarters

8

Copyright 2017 Trend Micro Inc.

Deployment
· Massachusetts Bay Transit Authority
­ https://www.crestron.com/en-US/News/CaseStudies/Massachusetts-Bay-Transit-Authority
· Chicago Police Department
­ https://www.crestron.com/en-US/News/CaseStudies/Chicago-Police-Department
· American Water Corporate Headquarters
­ https://www.crestron.com/en-US/News/CaseStudies/American-Water-Corporate-Headquarters

9

Copyright 2017 Trend Micro Inc.

Deployment

https://www.crestron.com/en-US/News/Case-Studies/Senate-of-Virginia

10

Copyright 2017 Trend Micro Inc.

Deployment

http://hughsaudiovideo.com/hospitality_showcase.pdf

11

Copyright 2017 Trend Micro Inc.

Products
· 3-Series controllers
­ CP3, MC3, PRO3 ­ DIN rail
· Touch screens
­ TSx ­ TPCS, TPMC ­ "One in every room" type deployments

12

Copyright 2017 Trend Micro Inc.

Products
And more...

13

Copyright 2017 Trend Micro Inc.

Platforms
· Mainly Windows
­ Most products run WinCE 6 ­ Some other embedded Win versions allegedly
· Some Android/Linux
­ Touch screens (TSx) ­ Video processors and digital media streamers (DGE-100, DMC-
STR, etc) ­ More?
· If something is specific to either the Windows or Android platform, I'll do my best to call it out

14

Copyright 2017 Trend Micro Inc.

Discovery

· Magic packet to UDP 41794 (broadcast or unicast)
­ "\x14\x00\x00\x00\x01\x04\x00\x03\x00\x00" + hostname + "\x00" * (256 - hostname.length)
· Response gives:
­ Hostname ­ Product ­ Firmware version ­ Build date

15

Copyright 2017 Trend Micro Inc.

Discovery
· Shodan results between 20,000 and 23,000 · Most common product is split between CP3 and MC3

results from 2018/06/11

16

Copyright 2017 Trend Micro Inc.

So What is Crestron?
· A lot of different things · Running different programs · On different platforms · In different environments

But there are a couple universal truths...

17

Copyright 2017 Trend Micro Inc.

Anonymous Admin on CTP Console

18

Copyright 2017 Trend Micro Inc.

CTP Console
· Main programming interface for devices · Telnet-like console on TCP 41795 · Sandbox file system/commands · Auth is available
­ Different user levels (Administrator, Operator, Programmer, User, etc) ­ Active Directory tie-ins ­ Encryption
· Auth is disabled by default
­ Reliant on programmer/installer to be security conscious ­ Adds more complexity to already complex system ­ Enabling is a multi-step process ­ Never gets turned on

19

Copyright 2017 Trend Micro Inc.

CTP Console

20

Copyright 2017 Trend Micro Inc.

Standard CTP Functionality
· Change system and service settings
­ Auth settings ­ Web portal settings ­ SSH/Telnet/FTP ­ Basic SIP settings (Android?)
· Networking info/config · Arbitrary file upload
­ fgetfile/fputfile - HTTP/FTP file transfer ­ xgetfile/xputfile - XMODEM file transfer

21

Copyright 2017 Trend Micro Inc.

Standard CTP Functionality
· Firmware updates · Run and control user programs · Control output to other devices
­ Display messages on OSD ­ Play audio/video files

22

Copyright 2017 Trend Micro Inc.

Hidden CTP Functionality
· Running processes: taskstat

23

Copyright 2017 Trend Micro Inc.

Hidden CTP Functionality
· View/modify stored certificates: certificate

24

Copyright 2017 Trend Micro Inc.

Hidden CTP Functionality
· Dr Watson dumps: drwatson (WinCE)

25

Copyright 2017 Trend Micro Inc.

Hidden CTP Functionality
· Direct chip communication: readi2c/writei2c (WinCE?)

26

Copyright 2017 Trend Micro Inc.

Hidden CTP Functionality
· Browser remote control: browseropen/browserclose (Android)

27

Copyright 2017 Trend Micro Inc.

Hidden CTP Functionality
· UI interaction: fakekey/faketouch (Android)

28

Copyright 2017 Trend Micro Inc.

Hidden CTP Functionality
· Record audio via microphone: recwave (Android)

29

Copyright 2017 Trend Micro Inc.

DEMO

30

Copyright 2017 Trend Micro Inc.

A Few RCE Vulns...

31

Copyright 2017 Trend Micro Inc.

Cmd Inj Vulns on Android Platform
· 22 command injection vulns so far in CTP console
­ ping (CVE-2018-5553)
· Simultaneously discovered by Cale Black and Jordan Larose of Rapid7
· https://blog.rapid7.com/2018/06/12/r7-2018-15-cve-20185553-crestron-dge-100-console-command-injection-fixed/
­ But also adduser, cd, copyfile, delete, dir, fgetfile, fputfile, isdir, makedir, movefile, removedir, routeadd, routedelete, udir, updatepassword, wifipskpassword, wifissid, wifiwephexpassword, wifiweppassword, and more...

32

Copyright 2017 Trend Micro Inc.

Cmd Inj Vulns on Android Platform
· Commands implemented programatically on WinCE platform
· Just punted to shell on Android · Most were simple to exploit
­ EX: isdir `cmd`

33

Copyright 2017 Trend Micro Inc.

Cmd Inj Vulns on Android Platform

34

Copyright 2017 Trend Micro Inc.

routeadd/routedelete Exploitation
· First problem
­ Arguments get up-cased before use ­ Linux commands are case-sensitive
· Solution
­ Create shell script containing desired commands ­ Name it "BLAH" ­ Upload it with fgetfile command

35

Copyright 2017 Trend Micro Inc.

routeadd/routedelete Exploitation

· Second problem
­ Uploaded script doesn't have exec perms ­ $SHELL/$BASH not set
· Solution
­ $0 returns name of calling program ­ When used in system() call, it returns name of shell
instead ­ Final injected string: `$0$IFS./BLAH` ­ Could have also used . (as in the command) in place of $0

36

Copyright 2017 Trend Micro Inc.

DEMO

37

Copyright 2017 Trend Micro Inc.

Round 2?
· Kept finding more vulns while root causing others
· Had to cut myself off due to time constraints · Pretty positive there is more to find

38

Copyright 2017 Trend Micro Inc.

I Want More!
· Significant amount of control by default · Can escape CTP sandbox on Android using
vulns · But what about WinCE?...What about a more
"legit" escape on Android?

39

Copyright 2017 Trend Micro Inc.

SUPER SECRET BONUS DEMO

40

Copyright 2017 Trend Micro Inc.

Conclusions
· Potential for good security practice is there but disabled by default
­ Installers/programmers not security conscious or just concerned with getting everything working
­ Normal users unaware of problem ­ If security isn't enabled by default, it is probably
not going to be enabled

41

Copyright 2017 Trend Micro Inc.

Conclusions
· Wide deployment, including sensitive environments
­ High potential for abuse by insider threats
· Boardroom spying/corporate espionage · Messing with building/access control systems · Hotel guests spying on other guests
­ Even "isolated networks" are not good enough

42

Copyright 2017 Trend Micro Inc.

Conclusions
· Android platform seems much less secure than WinCE platform
­ Surprising at first, but makes sense
· Crestron has long history with WinCE · Microsoft partnerships · Newer to the Linux/Android world · Too much product fragmentation?

43

Copyright 2017 Trend Micro Inc.

Huge Amount of Auditing Left
· More CTP attack surface
­ More RCE vulns? ­ SIMPL and PUF
· Other services
­ CIP, HTTP, FTP, SIP, SNMP, SSH, Telnet, etc...
· Other products
­ Fusion, Xpanel, AirMedia, XIO Cloud, etc...
· IOAVA

44

Copyright 2017 Trend Micro Inc.

Questions? Hit Me Up
· Twitter
­ https://twitter.com/HeadlessZeke
· Email
­ ricky[underscore]lawshae[at]trendmicro[dot]com
· Github
­ https://github.com/headlesszeke

45

Copyright 2017 Trend Micro Inc.

Thank You

46

Copyright 2017 Trend Micro Inc.

