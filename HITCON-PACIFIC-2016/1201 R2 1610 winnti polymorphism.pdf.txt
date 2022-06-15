Winnti Polymorphism
Takahiro Haruyama Symantec

Who am I?
· Takahiro Haruyama (@cci_forensics) · Reverse Engineer at Symantec
­ Managed Adversary and Threat Intelligence (MATI)
· https://www.symantec.com/services/cyber-security-services/ deepsight-intelligence/adversary
· Speaker
­ BlackHat Briefings USA/EU/Asia, SANS DFIR Summit, CEIC, DFRWS EU, SECURE, FIRST, RSA Conference JP, etc...
2

Motivation
· Winnti is malware used by Chinese threat actor for cybercrime and cyber espionage since 2009
· Kaspersky and Novetta published good white papers about Winnti [1] [2]
· Winnti is still active and changing
­ Variants whose behavior is different from past reports ­ Targets except game and pharmaceutical industries
· I'd like to fill the gaps
3

Agenda
· Winnti Components and Binaries · Getting Target Information from Winnti
Samples · Wrap-up
4

Winnti Components and Binaries
5

Winnti Execution Flow

2. run

3. load & run

memory-resident or omitted

Dropper 1. drop
6. connect to C2

Service with config

Engine
4. decrypt & run

5. load

C2 server

Worker with config (encrypted)

rootkit drivers

6

New Findings

2. run Dropper 1. drop SMTP supported 6. connect
to C2

3. load & run

memory-resident or omitted or file

Service with config

Engine
4. decrypt & run

5. load

decrypt & run (rare samples only)
other malware family

C2 server

Worker with config (encrypted)

rootkit drivers

connected
through covert client malware? on channel other machines

7

Dropper Component
· extract other components from inline DES-protected blob
­ the dropped components are
· service and worker · additionally engine with other malware family (but that is rare)
­ the password is passed from command line argument ­ Some samples add dropper's configuration into the overlays of the
components
· run service component
­ /rundll32.exe "%s", \w+ %s/ ­ the export function name often changes
· Install, DlgProc, gzopen_r, Init, sql_init, sqlite3_backup_deinit, etc...
8

Service Component
· load engine component from inline blob
­ the values in PE header are eliminated
· e.g., MZ/PE signatures, machine architecture, NumberOfRvaAndSizes, etc...
· call engine's export functions
­ some variants use the API hashes
· e.g., 0x0C148B03 = "Install", 0x3013465F = "DeleteF"
9

Engine Component
· memory-resident
­ some samples are saved as files with the same encryption of worker component
· export function names
­ Install, DeleteF, and Workmain
· try to bypass UAC dialog then create service · decrypt/run worker component
­ PE header values eliminated, 1 byte xor & nibble swap
10

Worker Component
· export function names
­ work_start, work_end
· plugin management
­ the plugins are cached on disk or memory-resident
· supported C2 protocols
­ TCP = header + LZMA-compressed payload ­ HTTP, HTTPS = zlib-compressed payload as POST data ­ SMTP
11

SMTP Worker Component
· Some worker components support SMTP
­ the config contains email addresses and more obfuscated (incremental xor + dword xor)
· Public code is reused
­ The old code looks copied from PRC-based Mandarin-language programming and code sharing forum [3]
· The hard-coded sender email and password are "attach_111@sina.com" and "test123456"
­ The new code looks similar to the one distributed in Code Project [4]
· STARTTLS is newly supported to encrypt the SMTP traffic
12

SMTP Worker Component (Cont.)
for decrypting each member QQMail [5] account is used for sending
recipient email addresses
13

VSEC Variant [6]
· Two main differences compared with Novetta variant [2]
­ no engine component
· service component directly calls worker component
­ worker's export function name is "DllUnregisterServer"
· takes immediate values according to the functions
­ e.g., 0x201401 = delete file, 0x201402 = dll/code injection, 0x201404 = run inline main DLL
· recently more active than Novetta variant?
14

VSEC Variant (Cont.)

worker
infected Windows dll
service

· unique persistence
­ Some samples modify IAT of legitimate windows dlls to load service component
­ the target dll name is included in the configuration
· e.g., wbemcomn.dll, loadperf.dll
15

Winnti as a Loader

· Some engine components

embeds other malware

family like Gh0st and

PlugX
­ the configuration is

encrypted by Winnti and

the malware algorithm ­ the config members are

the malware specific +

Winnti strings

Winnti-related members

16

Related Kernel Drivers
· Kernel rootkit drivers are included in worker components
­ hiding TCP connections
· The same driver is also used by Derusbi [7]
­ making covert channels with other client machines
· The behavior is similar to WFP callout driver of Derusbi server variant [8] but the implementation is different
17

Related Kernel Drivers (Cont.)

· The rootkit hooks TCPIP Network Device Interface Specification

(NDIS) protocol handlers

­ intercepts incoming TCP packets then forward to worker DLL

dword2 !=0 && dword4 == (dword1 ^ dword3) << 0x10 The packet header dword 1 dword 2 dword 3 dword 4

(1) send packet
Client Malware

(2) save TCP & special format
packets
NDIS_OPEN_BLOCK
ReceiveNetBufferLists and ProtSendNetBufferListsComplete

packet buffers

Worker DLL with config
(3) read & write to user buffer
\\Device\\Null

IRP_MJ_DEVICE_CONTROL

install hooks again everytime net config
changes

NDIS_PROTOCOL_BLOCK BindAdapterHandlerEx and NetPnPEventHandler
TCPIP protocol handlers

(0) install hooks the rootkit driver
(DKOM used, names/paths nu18llfied)

Related Attack Tools
· bootkit found by Kaspersky when tracking Winnti activity [9] · "skeleton key" to patch on a victim's AD domain controllers [10] · custom password dump tool (exe or dll)
­ Some samples are protected by VMProtect or unique xor or AES ­ the same API hash calculation algorithm used (function name = "main_exp")
· PE loader
­ decrypt and run a file specified by the command line argument
· *((_BYTE *)buf_for_cmdline_file + offset) ^= 7 * offset + 90;
19

from Kaspersky blog [11]
Getting Target Information from Winnti Samples
20

Two Sources about the Targets
· campaign ID from configuration data
­ target organization/country name
· stolen certificate from rootkit drivers
­ already-compromised target name
· I checked over 170 Winnti samples
­ Which industry is targeted by the actor, except game and pharma ones?
21

Extraction Strategy
· regularly collect samples from VT/Symc by using detection name or yara rules
· try to crack the DES password if the sample is dropper component
­ or just decrypt the config if possible
· run config/worker decoder for service/worker components
­ campaign IDs are included in worker rather than service
· extract drivers from worker components then check the certificates · exclude the following information
­ not identifiable campaign ID (e.g., "a1031066", "taka1100") ­ already-known information by public blogs/papers
22

Extraction Strategy (Cont.)
· automation
­ config/worker decoder (stand-alone)
· decrypt config data and worker component if detected · additionally decrypt for PlugX loader or SMTP worker variants
­ dropper password brute force script (IDAPython or stand-alone)
campaign ID
23

Extraction Strategy (Cont.)
· double-check campaign IDs by using VT submission metadata
­ the company has its HQ or branch office in the submitted country/ city?
· e.g., the ID means 2 possible companies in different industries
­ The submission city helps to identify the company

decrypted config

VT submission metadata 24

Result about Campaign ID
· only 27 % samples contained configs !
­ Most of them are service components
· service components usually contains just path information
­ difficult to collect dropper/worker components by detection name
· Yara retro-hunt can search samples within only 3 weeks
· 19 unique campaign IDs found
­ 12 IDs were identifiable and not open
25

Result about Campaign ID (Cont.)

1st seen year

submission country / city Industry

from VT metadata from VT metadata

2014

Russia / Moscow

Internet Information Provider? (typo)

2015

China / Shenzhen

University? (not sure)

2015

South Korea / Seongnam-si Game

2015

South Korea / Seongnam-si Game

2015

South Korea / Seongnam-si Game

2016

Japan / Chiyoda

Chemicals

2016

Vietnam / Hanoi

Internet Information Provider, Ecommerce, Game

2016

South Korea / Seoul

Investment Management Firm

2016

South Korea / Seongnam-si Anti-Virus Software

2016

USA / Bellevue

Game

2016

Australia / Adelaide

IT, Electronics

2016

USA / Milpitas

Telecommunications

26

Result about Certificate
· 12 unique certificates found but most of them are known in
[1] [12] · 4 certificates are not open
­ One of them is signed by an electronics company in Taiwan ­ The others are certificates of chinese companies
· "Guangxi Nanning Shengtai'an E-Business Development CO.LTD", "BEIJING KUNLUN ONLINE NETWORK TECH CO.,LTD", "
  "
­ I'm not sure if they were stolen or not
· One is a primary distributor of unwanted software? [13]
27

Wrap-up
28

Wrap-up
· Winnti malware is polymorphic, but
­ The variants and tools have common codes
· e.g., config/binary encryption, API hash calculation
­ Some driver implementations are identical or similar to Derusbi's ones
· Today Winnti threat actor(s?) targets at chemical, e-commerce, investment management firm, electronics and telecommunications companies
­ Game companies are still targeted
· Symantec telemetry shows they are just a little bit of targets !
29

Reference
1. http://kasperskycontenthub.com/wp-content/uploads/sites/43/vlpdfs/winnti-more-than-just-agame-130410.pdf
2. https://www.novetta.com/wp-content/uploads/2015/04/novetta_winntianalysis.pdf 3. http://blog.csdn.net/lishuhuakai/article/details/27852009 4. http://www.codeproject.com/Articles/28806/SMTP-Client 5. https://en.mail.qq.com/ 6. http://blog.vsec.com.vn/apt/initial-winnti-analysis-against-vietnam-game-company.html 7. https://assets.documentcloud.org/documents/2084641/crowdstrike-deep-panda-report.pdf 8. https://www.novetta.com/wp-content/uploads/2014/11/Derusbi.pdf 9. https://securelist.com/analysis/publications/72275/i-am-hdroot-part-1/ 10. https://www.symantec.com/connect/blogs/backdoorwinnti-attackers-have-skeleton-their-closet 11. https://securelist.com/blog/incidents/70991/games-are-over/ 12. http://blog.airbuscybersecurity.com/post/2015/11/Newcomers-in-the-Derusbi-family 13. https://www.herdprotect.com/signer-guangxi-nanning-shengtaian-e-business-development-
coltd-1eb0f4d821e239ba81b3d10e61b7615b.aspx
30

