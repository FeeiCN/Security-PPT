Visiting the snake nest
Recon Brussels 2018
Jean-Ian Boutin | Senior Malware Researcher Matthieu Faou | Malware Researcher

Jean-Ian Boutin
Senior Malware Researcher @jiboutin

Matthieu Faou
Malware Researcher @matthieu_faou

Agenda
1. Introduction 2. Infection Vectors 3. First Stages 4. Advanced First Stages 5. Second Stages 6. Infrastructure 7. Conclusion

Introduction

Is ESET doing attribution?

Turla in short
· One of the oldest espionage group · Targets includes governments, government officials, diplomats, ... · Very large toolset targeting all major platforms

Infection Vectors

· Wateringhole · Spearphishing

Overview

Watering Hole

· Planting scripts in targets' favs websites

URL (past campaigns) http://www.namibianembassyusa.org http://www.avsa.org http://www.zambiaembassy.org http://russianembassy.org http://au.int http://mfa.gov.kg http://mfa.uz

Notes Namibia Embassy - USA African Violet Societa of America Zambian Embassy - USA Russian Embassy - USA African Union Ministry of Foreign Affairs ­ Kyrgyzstan Ministry of Foreign Affairs - Uzbekistan

Script Injection

1st level C&C mentalhealthcheck.net drivers.epsoncorp.com rss.nbcpost.com static.travelclothes.org msgcollection.com

Script Injection

1st level C&C mentalhealthcheck.net drivers.epsoncorp.com rss.nbcpost.com static.travelclothes.org msgcollection.com

Script Injection

1st level C&C mentalhealthcheck.net drivers.epsoncorp.com rss.nbcpost.com static.travelclothes.org msgcollection.com

PluginDetect
· Fingerprinting potential target through JS

Browser Extension

C&C fetching
· Computes comments checksum
· Regular expression applied '(?:\\u200d)(?:#|@)?(\\w)'
· https://bitly.com/2kdhuHX

C&C fetching
· Computes comments checksum
· Regular expression applied '(?:\\u200d)(?:#|@)?(\\w)'
· https://bitly.com/2kdhuHX

· A bit disappointing that this one was not used...

Mosquito

Overview
· Campaign running since at least July 2016 · Infection vector is a fake flash installer
· Downloaded from http://admdownload.adobe.com *
· Use either a Win32 or a JScript backdoor
* We believe Adobe was not compromised

Tracing the infection chain

Something weird is happening on the network

Possible interception points

During the installation... http://get.adobe.com/stats/AbfFcBebD/q=<base64-encoded data>

Information exfiltrated to get.adobe.com over HTTP

OSX/Snake

OSX/Snake

It even tricked researchers!

1st Stages

Many have been documented
· Culex · Tavdig · Skipper · Kopiluwak ·...

Tavdig/ Wipbot

Tavdig
· (Older) backdoor used to assess target usefulness
· Can execute command, modify backdoor configuration, download additional files, etc
· Dropped through watering hole or spearphishing (old PDF CVE and macros)

Overall Architecture
· Used for
· System fingerprinting
· OS version · Computer name · Current user name · Local groups · System directory · System language, user language, timezone, uptime, etc
· Backdoor (upload/download file, execute, etc)

Different Versions

· Observations based on samples analyzed

Version Sample sightings

Differences

A

October 2013 ­ February 2014

· N/A

B

April 2014 ­ July 2014

· Introduction of macro based Word dropper · Introduction of the two steps injection · Introduction of shell_traywnd injection trick

C

September 2015 ­ November 2015 · Introduction of code obfuscation through "this" pointer

· Introduction of list of injectable processes instead of just

iexplore.exe

Version C process list

· Hash-based process name search · Crackable through John the Ripper

icq.exe

msimn.exe opera.exe

chrome.exe

pidgin.exe firefox.exe

outlook.exe

iexplore.exe jusched.exe

browser.exe

icqlite.exe adobearm.exe

adobeupdater.exe

Tavdig word attachment
· Malicious macro embedded in document
· Macro decrypts payload and launches it

Tavdig word attachment
· Malicious macro embedded in document
· Macro decrypts payload and launches it
File size

Tavdig word attachment
· Malicious macro embedded in document
· Macro decrypts payload and launches it
Checksum

Skipper

Skipper
· Minimal backdoor used against governmental and diplomatic institutions since at least 2014
· Can execute commands, ex-filtrate files and download additional malware
· Delivered in malicious macros, JS attachments

Skipper vs. Tavdig

Skipper vs. Tavdig

Skipper vs. Tavdig

Skipper Development
· C:\Users\admin\Documents\Visual Studio 2012\Projects\dws\x64\Release\ GetPidByProcessName_x64.pdb
· C:\Users\work4\Documents\Visual Studio 2012\Projects\KOTEL 24.11.16 No COOKIE No STORAGE only BODY\KOTEL_2.1\x64\Release\ GetPidByProcessName_x64.pdb

Skipper Development
· C:\Users\admin\Documents\Visual Studio 2012\Projects\dws\x64\Release\ GetPidByProcessName_x64.pdb
· C:\Users\work4\Documents\Visual Studio 2012\Projects\KOTEL 24.11.16 No COOKIE No STORAGE only BODY\KOTEL_2.1\x64\Release\ GetPidByProcessName_x64.pdb

Skipper email attachment
· SECTION_INTERNETNOTICE_TO_ALL_USERS_13-05-2016.pdf.js

WinRAR archive content
C&C Comm Loader Process Injection

Skipper Misc
· Implements a bunch of anti-emulation tricks

Skipper Misc
· Implements a bunch of anti-emulation tricks

Skipper Misc
· Implements a bunch of anti-emulation tricks

Skipper Misc
· Implements a bunch of anti-emulation tricks

Skipper Misc
· Implements a bunch of anti-emulation tricks

Misc ­ OPSEC failure
· Operators use Vim!!
· https://[C&C server]/rss.php~

Advanced 1st stages

Image credit: SpaceX

Mosquito

Win32 Mosquito
· 1st or 2nd stage (Skipper) · Deployed in Eastern Europe on diplomats' machines · Uses a custom packer

Packer ­ Opaque predicates

Packer ­ Anti-sandbox/emulation
· Call to SetupDiGetClassDevs(0,0,0,0xFFFFFFFF) · Last parameter value is undocumented · Expect 0xE000021A as return value

Components

Components
Backdoor

Components

Backdoor

Loader

Components

Backdoor

Loader

Encrypted log file

Persistence 1/2
· CLSID hijacking
· Ex: Ntshrui.dll

Persistence 2/2
· Create a new admin account: HelpAssistant
· Enable remote administrative actions for this user · Maybe used to spy or regain control if the backdoor is
deleted.

Where are you export table?

Export table patching

I'm here!

Encryption
· Data is xored with a generated key
· No, I won't show you the xor loop :D
· Generation algorithm looks like BlumBlumShub
· Takes a key and a modulo to generate a bytes stream

Network communications
· C&C
· HTTPs · URI: /scripts/m/query.php?id=<base64 data> · SATCOM IP addresses and Cloudflare

Network communications
· C&C
· HTTPs · URI: /scripts/m/query.php?id=<base64 data> · SATCOM IP addresses and Cloudflare
· Encrypted data in:
· GET parameter (id) · Cookie · POST

Backdoor functions
· Download & execute additional files · Launch a process · Delete a file · Exfiltrate a file · Add/Delete a C&C server

Mosquito vs ComRAT
· Encryption algorithms are different · Log structures are different
· Both use CLSID hijacking · Overlap in the network infrastructure · Some similarities in the code

Second Stages

Image credit: SpaceX

Advanced Functionalities
· Second stages implement similar concepts to stay persistent and hidden on the system
· They are meant to stay undected as long as possible

Carbon/ Cobra

Overview
· Evolution of the previous rootkit · Sophisticated backdoor · Receive and dispatch tasks from other nodes

Architecture
· Dropper · Loader · Orchestrator · Communication DLL

Development Timeline

Compilation date 2014-02-26 2016-02-02 2016-03-17 2016-03-24 2016-04-01 2016-08-30 2016-10-05 2016-10-21

Orchestrator version 3.71 3.77 3.79 3.79 3.79 3.81 3.81 3.81

Communication library version 3.62 4.00 4.01 4.01 4.03 ???? ???? ????

C&C Communication
· Several steps are taken before beaconing out
· Check for network sniffers
· First GET request to root page of C&C
· Real request is made

C&C Communication
· Data that should be sent to the C&C server is written to a file
· Each blob is encrypted with CAST-128
· extra 3DES encryption is configurable

Tasks
· Tasks are retrieved from a webpage
· Once decrypted, the tasks are added to a queue

Tasks
· Tasks are retrieved from a webpage
· Once decrypted, the tasks are added to a queue

Named pipe Communications
· Example of communication between modules

Named pipe Communications
· Tasks can be forwarded to another node

Named pipe Communications
· Tasks can be forwarded to another node

Named pipe Communications
· Tasks can be forwarded to another node

Named pipe Communications
· Tasks can be forwarded to another node

Named pipe Communications
· Tasks can be forwarded to another node

Task configuration file
· [CONFIG]
· NAME ("cmd.exe" by default) · ARG · RESULT ("stdout" by default) · COMPRESSION ("yes" by default) · DELETE ("no" by default)

Kazuar

Overview
· .NET backdoor · Crossplatform · Similar in architecture to Carbon
· Plugin support · Working directory · Configuration file · Log file · [...]

ConfuserEx
· LZMA code compression · Anti debug · Control flow obfuscation · Strings obfuscation

ConfuserEx
· LZMA code compression · Anti debug · Control flow obfuscation · Strings obfuscation

Gazer/ White Bear

https://chocolate80y.deviantart.com/art/bear-snake-149185270

Overview
· The most recent 2nd stage backdoor
· Similar architecture to the previously discussed backdoors

Gazer Architecture

Gazer Architecture

Gazer Architecture

Process injection list

· Standard ones:
· iexplore.exe · firefox.exe · outlook.exe · chrome.exe · browser.exe · opera.exe · safari.exe

· Custom ones:
· osoupd.exe · acrotray.exe · UpdaterUI.exe · dropbox.exe · onedrive.exe

Process injection list

· Standard ones:
· iexplore.exe · firefox.exe · outlook.exe · chrome.exe · browser.exe · opera.exe · safari.exe

· Custom ones:
· osoupd.exe · acrotray.exe · UpdaterUI.exe · dropbox.exe · onedrive.exe

Skipper relationship
· Seen in tandem
· Usage of code signing certificates
· We have seen Gazer being installed 24 hours after initial Skipper infection

RunTime Type Information - RTTI
· C++ class introspection (dynamic_cast, typeid, exception dispatcher) requires additional information to be stored in binary · Gazer has this information. We can recover
· Virtual Function Table (VFT) · Class names · Base classes
· Bonus: some binaries included function names

RunTime Type Information - RTTI
· Looking for ".?AV" strings

Similarities exposed

Working directory similarities - Carbon

Working directory similarities - Kazuar

Working directory similarities - Kazuar
md5('log') XOR key

Working directory similarities - Gazer
· Moved to registry
· %RootStoragePath%\{119D263D-68FC-1942-3CA3-46B23FA652A0}
· Object ID: a unique ID to identify the victim
· %RootStoragePath%\{1DC12691-2B24-2265-435D-735D3B118A70}
· Task Queue: linked list of tasks to be executed
· %RootStoragePath%\{28E74BDA-4327-31B0-17B9-56A66A818C1D}
· Plugins
· %RootStoragePath%\{31AC34A1-2DE2-36AC-1F6E-86F43772841F}
· Communication Module: the DLL that communicates with the C&C server
· %RootStoragePath%\{3CDC155D-398A-646E-1021-23047D9B4366}
· Autorun: the persistency method

Logs - Carbon
· Encrypted with CAST-128 · Format: Date|Time|Object-Id|Source|Mesage

Logs - Kazuar
· Encrypted with AES-256-CBC · Format: process_name [PID]: message

Logs - Gazer
· Encrypted with 3DES · Format: Hour:Min:Sec:Ms|[log ID] [log]

Configuration items ­ Carbon/Kazuar/Gazer
· Processes where to inject 3rd stage · Last C&C contact time · C&C list · Victim ID · Frequency and time of tasks execution

Configuration file ­ Carbon/Kazuar/Gazer
· Processes where to inject 3rd stage · Last C&C contact time · C&C list · Victim ID · Frequency and time of tasks execution

Interlude Metasm

Leverage Metasm to dump encrypted data
· Custom RSA implementation · Unable to decrypt data with standard libraries · Why not use directly Gazer code?

Metasm
· Assembler / Disassembler / Compiler / Debugger

Metasm
· Assembler / Disassembler / Compiler / Debugger
· Scriptable in Ruby

Metasm
· Assembler / Disassembler / Compiler / Debugger
· Scriptable in Ruby

Metasm
· Assembler / Disassembler / Compiler / Debugger · Scriptable in Ruby · https://github.com/jjyg/metasm

Script
1. Put breakpoints on specific addresses 2. Debug the Gazer sample 3. Dump unencrypted data

Script
https://github.com/eset/malware-research/tree/master/turla/gazer_util.rb

Infrastructure

First layer C&C server

SATCOM Infrastructure
· Hide real C&C addresses · Attribution is more difficult · Take-down almost impossible

Infected machine

Satellite broadcasts traffic
Infected machine

SIGINT interception

Satellite broadcasts traffic
Infected machine

SIGINT interception
Real C&C server. Uses the IP address of a real SAT customer.

Satellite broadcasts traffic
Infected machine

Playing cat and mouse
· Gazer change in IOCs · Carbon changes in IOCs · Nautilus changes after NCSC UK report · Mosquito DLLs no longer dropped on disk after our publication

Conclusion
· Turla is still very active
· Really effective at tricking the users
· Large toolset
· Most advanced backdoors used on the most protected networks

Jean-Ian Boutin
Senior Malware Researcher @jiboutin

Matthieu Faou
Malware Researcher @matthieu_faou

www.eset.com | www.welivesecurity.com

