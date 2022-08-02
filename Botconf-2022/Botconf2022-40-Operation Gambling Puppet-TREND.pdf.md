Operation Gambling Puppet
Daniel Lunghi(@thehellu), Jaromir Horejsi (@JaromirHorejsi) Botconf, Nantes, France April 27th, 2022

Outline
· Introduction · Infection vectors · Malware toolkits
· Custom malware (PuppetLoader, oRAT)
· Targets · Infrastructure · Attribution · Conclusion

2

© 2022 Trend Micro Inc.

Introduction
· Investigation started from an Xnote sample connected to Operation DRBControl's domain name
· ...found more samples, and different malware families · ...noticed other platforms being targeted · ...figured out some targets · ...found some infection vectors · ...etc etc
· This talk is the result of this investigation

3

© 2022 Trend Micro Inc.

Infection vectors

4

© 2022 Trend Micro Inc.

Infection vector ­ chat application
· Website offering backdoored chat application
In Chinese language mì mì () means "secret"

5

© 2022 Trend Micro Inc.

Infection vector ­ chat application
· Desktop chat application
· Built with ElectronJS framework (multiplatform) · electron-main.js file references the malicious payload

6

© 2022 Trend Micro Inc.

Infection vector ­ chat application

Loads (if Windows OS)

PlugX malware

Target

visits

7

© 2022 Trend Micro Inc.

Chat app's website

delivers

ElectronJS chat application
Loads (if Mac OS)

oRAT malware

Infection vector ­ chat application

· Registration page is limited to certain countries
· +86: China · +1: Canada · +1: USA · +852: Hong Kong · +853: Macao · +886: Taiwan · +63: Philippines · +65: Singapore · +66: Thailand · +81: Japan · +82: South Korea

8

© 2022 Trend Micro Inc.

Infection vector ­ XSS and fake installer

Threat actor

Injects JS code

Loads JS code & PHP script

visits

Legitimate website
redirects

XSS platform

connects to

Target falls for lure

Fake Flash website

delivers

Malware

9

© 2022 Trend Micro Inc.

C&C or download
server

Infection vector ­ XSS and fake installer
· Persistent cross-site scripting in legitimate website to load a Javascript script from a third-party server

· The script does some checks and displays a message stating that the Flash player version is too old

· Then it calls Xss.php script, and redirects to a website linking a malicious installer

10

© 2022 Trend Micro Inc.

Infection vector ­ XSS and fake installer
· Xss.php script probably collects some statistics about the victims
· Malicious installer's website is in Chinese language

11

© 2022 Trend Micro Inc.

Infection vector ­ XSS and fake installer
· Server hosting JS and PHP script also hosts a login page

· "Xss" (Xss píng tái) means "XSS platform" · Message mentions XSS results and free online XSS platforms

12

© 2022 Trend Micro Inc.

Infection vector ­ XSS and fake installer
· Two different legitimate websites exploited
· A news website aimed at the Chinese community of a big US city · An unknown website (offline when we checked)

13

© 2022 Trend Micro Inc.

Infection vector ­ DMG file
· Fake BitGet application (DMG file, MacOS)
· Preinstall script downloads and executes malicious payload (oRAT)

· BitGet is a Singapore-based cryptocurrency exchange application

14

© 2022 Trend Micro Inc.

Malware toolkits

15

© 2022 Trend Micro Inc.

Malware toolkit ­ Overview
· Threat actor uses lot of malware families, across 3 different platforms
· Windows · Linux · Mac
· Some malware families were previously known, others have not been publicly reported

16

© 2022 Trend Micro Inc.

Malware toolkit ­ Windows
· Known Windows malware families
· PlugX · Gh0st · Cobalt Strike · Trochilus · Quasar RAT · Async RAT · DarkCrystal RAT (DC RAT)

17

© 2022 Trend Micro Inc.

Malware toolkit ­ Windows
· New Windows malware families
· PuppetLoader · PuppetDownloader · oRAT · MFC downloader · HelloBot (priorly not seen on Windows)

18

© 2022 Trend Micro Inc.

Malware toolkit ­ Linux
· Known malware families
· XNote · HelloBot · Pupy RAT · Reptile rootkit

19

© 2022 Trend Micro Inc.

Malware toolkit ­ Mac
· Only malware found targeting Mac OS is oRAT
· Also seen compiled for Windows platform

20

© 2022 Trend Micro Inc.

Malware toolkit ­ PuppetLoader
· Custom malware (backdoor) · 5 stages · Flawed RC4 implementation

21

© 2022 Trend Micro Inc.

Malware toolkit ­ PuppetLoader

BasicLoader

Loads

Drops

Stealthy loader

Dropper

.BMP with Core

Core Decrypts and loads

22

© 2022 Trend Micro Inc.

.BMP with Client.MainConsole Client.MainConsole

Malware toolkit ­ PuppetLoader

· Flawed RC4 (swap operation implementation) · Operation SWAP
· implemented in 5 steps
step operation 1 Tmp = S[i] + S[j] 2 S[i] = Tmp 3 Tmp = Tmp ­ S[j] 4 S[j] = Tmp 5 S[i] = S[i] ­ Tmp

23

© 2022 Trend Micro Inc.

Malware toolkit ­ PuppetLoader

step operation 1 Tmp = S[i] + S[j] 2 S[i] = Tmp 3 Tmp = Tmp ­ S[j] 4 S[j] = Tmp 5 S[i] = S[i] ­ Tmp

24

© 2022 Trend Micro Inc.

After step S[i]

S[j]

0

S[i]

S[j]

1

S[i]

S[j]

2

S[i]+S[j] S[j]

3

S[i]+S[j] S[j]

4

S[i]+S[j] S[i]

5

S[j]

S[i]

tmp ??? S[i]+S[j] S[i]+S[j] S[i] S[i] S[i]

Malware toolkit ­ PuppetLoader

· i == j; therefore S[i] and S[j] points to the same memory location

After step S[i]

S[j]

tmp

step operation

0

S[i] = S[j] S[j] = S[i] ???

1 Tmp = S[i] + S[j]

1

S[i] = S[j] S[j] = S[i] S[i]+S[j] = 2*S[i]

2 S[i] = Tmp

2

2*S[i] 2*S[i] 2*S[i]

3 Tmp = Tmp ­ S[j]

3

2*S[i] 2*S[i] 2*S[i]-2*S[i] = 0

4 S[j] = Tmp

4

0

0

0

5 S[i] = S[i] ­ Tmp

5

0

0

0

25

© 2022 Trend Micro Inc.

Malware toolkit ­ PuppetLoader
· After each i==j RC4 internal state contains 1 more zero byte

· RC4 internal state is not permutation of all 0x00-0xFF bytes anymore

26

© 2022 Trend Micro Inc.

Malware toolkit ­ PuppetLoader
· 2 other malware families using the same flawed RC4 implementation
· PuppetDownloader, C++ malware downloading second stage · TigerPlug, userland rootkit spreading PlugX via RDP

27

© 2022 Trend Micro Inc.

Malware toolkit ­ PuppetLoader
· Stage 1 ­ Stealthy Loader
· Starts loading a legitimate DLL from Windows\System32 directory · Replace it with malicious code on the fly · Hook NTDLL's:
· NtQueryAttributesFile, NtOpenFile, NtCreateSection, NtMapViewOfSection, NtQuerySection and ZwClose
· Use undocumented ntdll's APIs ­ RtlPushFrame, RtlPopFrame and RtlGetFrame to avoid recursive hooking problem

28

© 2022 Trend Micro Inc.

Malware toolkit ­ PuppetLoader
· `LDFM' frame

· Base address of malicious payload; buffer size; SizeOfImage; file name lz32.dll; file name asycfilt.dll; handle to open lz32.dll

29

© 2022 Trend Micro Inc.

Malware toolkit ­ PuppetLoader
· LdrLoadDll asycfilt.dll · NtOpenFile: if asycfilt.dll is being open, then replace it with lz32.dll · NtCreateSection: if FileHandle matches to previously opened lz32.dll, then fix
section's MaximumSize to correspond the size of the malicious payload · NtMapViewOfSection: fix pViewSize to be the same as new SizeOfImage; copy
malicious payload · NtQuerySection: compute the difference between loaded and preferred
ImageBase; if not equal return STATUS_IMAGE_NOT_AT_BASE
· LdrLoadDll rebases malicious payload, load all dependencies

30

© 2022 Trend Micro Inc.

Malware toolkit ­ PuppetLoader
· Effects of stealthy loader on PEB_LDR_DATA and Process Monitor outputs

31

© 2022 Trend Micro Inc.

Malware toolkit ­ PuppetLoader
· Stage 2 ­ dropper
· Drops: · CPuppetProcessFileSharer · Config.ini · .DLL file, BasicLoader · .BMP file with encrypted Core · .BMP file with encrypted Client.MainConsole
· Starts: BasicLoader

32

© 2022 Trend Micro Inc.

Malware toolkit ­ PuppetLoader
· Stage 3 ­ BasicLoader
· Search directories in Users\\Public (Desktop, Documents, Downloads, Music, Pictures, Videos) for .BMP files
· Tiny BMP file (33x11 pixels) with overlay

· Overlay encrypted wit the same flawed RC4 algorithm · RC4 password is hardcoded within overlay data · Both module name and module content are encrypted and stored in the
overlay

33

© 2022 Trend Micro Inc.

Malware toolkit ­ PuppetLoader
· Stage 4 ­ Core
· Start system logger thread (RC4 encrypted, same algorithm)

· Handle command line arguments

Cmdline argument

-DisplayName

-InokeMethodParam

-InvokeMethodName

-NoModuleLoadDLL

34

© 20-2L2 oTreanddMSicrohInec.llcode

explanation
Stealthy loader (like stage 1) Load binary blob

Malware toolkit ­ PuppetLoader
· Stage 5 ­ Client.MainConsole
· Interactive shell, Upload, Download, List files, Terminate process, List processes, Install module, Login callback, Enumerate RDP sessions
· C&C communication, UDP with 16-byte RC4 encryption

35

© 2022 Trend Micro Inc.

Malware toolkit ­ oRAT
· Multiplatform (Win, Mac) RAT written in Golang · AES-GCM encrypted configuration in overlay · Features:
· Gateway (traffic forwarder) · Communication (tcp, stcp, sudp) · Runs local server, registers `routes' · Attacker directly connects
to the infected machine and executes commands via GET/POST requests

36

© 2022 Trend Micro Inc.

Malware toolkit ­ oRAT

· Registered routes

GET /agent/info GET /agent/ping

POST /agent/upload

GET /agent/download GET /agent/screenshot GET /agent/zip

GET /agent/unzip

GET /agent/kill-self GET /agent/portscan GET /agent/proxy

GET /agent/ssh

GET /agent/net

37

© 2022 Trend Micro Inc.

https://gobyexample.com/http-servers

Malware toolkit ­ Xnote/HelloBot
· Malware families reported in 2015 and 2018 · Not known to be used for espionage · Typical RAT features · Both families embed a XOR-encrypted configuration file
· Contain campaign identifiers/notes
· Some of them related to gambling
· Contain Chinese comments (HelloBot)

38

© 2022 Trend Micro Inc.

Malware toolkit ­ Xnote/HelloBot
· Command seen in multiple HelloBot configurations:
cmd0="fuser -k /tmp/.wq4sMLArXw" · Such command is run periodically by the malware's monitoring process,
and it kills every process accessing "/tmp/.wq4sMLArXw" file · "/tmp/.wq4sMLArXw" is a file created by Xnote malware to check if the
system is already infected
· Thus, HelloBot kills running Xnote instances

39

© 2022 Trend Micro Inc.

Targets

40

© 2022 Trend Micro Inc.

Targets
· We used 3 sources to find targets
· Our telemetry · Decrypted malware configurations · Keylogs found in the wild

41

© 2022 Trend Micro Inc.

Targets ­ Telemetry

· 15 downloads of fake Flash downloader, all from China

· 5 redirects from a legitimate news website, all from US

· 3 redirects from an unknown website, 2 from HK, one from

MY

11

· 1 PlugX DLL detected in TW

2

5 15

42

© 2022 Trend Micro Inc.

12345

Targets ­ Keylogs
· We found multiple keylog files of victims compromised by this threat actor
· 2 Chinese gambling websites · 1 Malaysian hosting provider

43

© 2022 Trend Micro Inc.

Targets ­ Configuration files
· Configuration files of Xnote/HelloBot contained some words that might refer to the targets
· yabo -> gambling/betting website · W88 -> gambling/betting website · gamebox -> Shanghai-based gaming company · caipiao -> "lottery ticket" · CG -> a kind of lottery · jinbo ->  -> "Bring in wealth and treasure" · yeji -> "business success"

44

© 2022 Trend Micro Inc.

Targets
· Targets are mainly in China, but also in Southeast Asian countries, and US

· Main targeted industry is gambling · But also
· 1 company in education · 2 companies in IT services · 1 company in electronics manufacturing

45

© 2022 Trend Micro Inc.

Infrastructure

46

© 2022 Trend Micro Inc.

Infrastructure
· Big infrastructure
· ~50 C&C · More than 150 related subdomains · 12 different RAT families -> 12 different backend
· Many of the domain names use CloudFlare · Sometimes multiple subdomains of a root domain are linked
to different malware families

47

© 2022 Trend Micro Inc.

Infrastructure

C&C bos.github.wiki

HelloBot

Copy of docs.github.com

Malware panel

48

© 2022 Trend Micro Inc.

displays

github.wiki

darwin.github.wiki

C&C

hosts

oRAT

***.github.wiki displays

d.github.wiki

hosts

C&C dust.github.wiki

Pupy

Infrastructure
· Some domain names have a meaning in Chinese language
· daj8.me
· "daj8" ("") means "big dick"
· wocaonima.daj8.me
· "wocaonima" ("") means "I f*ck your mother"
· shabi.daj8.me
· "shabi" ("") means "asshole"
· Is the threat actor trying to pass a message ?

49

© 2022 Trend Micro Inc.

Attribution

50

© 2022 Trend Micro Inc.

Attribution
· Threat actor speaks Chinese language
· XSS platform offered in a Chinese forum, panel written in Chinese · Malware panel in Chinese · HelloBot decrypted configuration files contain comments in Chinese · Fake websites and chat application written in Chinese · PlugX and gh0st malwares known to originate from China
: "home delivery master controller"

51

© 2022 Trend Micro Inc.

Attribution ­ links to known groups

C&C domain shopingchina.net

Operation DRBControl

Domain name (passive DNS)

Connecting the dots

HyperBro

Iron Tiger

Winnti (CASPER/LEAD)

WINNTI GROUP: Insights From the Past

XNote

ChinaZ

52

© 2022 Trend Micro Inc.

Operation PZChao

Signing certificate from Gravity

Conclusion

53

© 2022 Trend Micro Inc.

Conclusion

· Advanced threat actor with big infrastructure and development capabilities
· Large toolkit of malware families working on multiple platforms
· Targets mostly, but not limited to, gambling industry in
Southeast Asia
· Links to some known Chinese threat actors
· Gambling is regulated in China

54

© 2022 Trend Micro Inc.

References
· Blogpost on this threat actor

55

© 2022 Trend Micro Inc.

Threats detected and blocked globally by Trend Micro in 2018. Created with real data by artist Daniel Beauchamp.

