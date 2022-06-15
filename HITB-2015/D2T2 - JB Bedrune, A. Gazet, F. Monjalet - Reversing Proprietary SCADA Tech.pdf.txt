Supervising the Supervisor
Reversing Proprietary SCADA Tech
Jean-Baptiste B´edrune jbbedrune@quarkslab.com
Alexandre Gazet agazet@quarkslab.com
Florent Monjalet fmonjalet@quarkslab.com

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion
Plan
1 Background 2 What is an ICS? 3 Overview 4 Reversing an Industrial Protocol 5 Wanted: Entropy 6 Firmware Reverse Engineering 7 Conclusion
2 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion
Introduction
Us Jean-Baptiste Bedrune Alexandre Gazet Florent Monjalet Security researchers at Quarkslab
Quarkslab Security R&D and services Software editor
Study 3 - 4 months
3 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion
Plan
1 Background 2 What is an ICS?
Some Background Definition Components 3 Overview 4 Reversing an Industrial Protocol 5 Wanted: Entropy 6 Firmware Reverse Engineering 7 Conclusion
4 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Some Background
Critical Systems
Critical systems Transportation, energy, financial systems... Every system depend on some critical infrastructure Consequences of a malfunction Interdependencies
Industrial systems Water distribution Nuclear plant Access control Production chains
5 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Some Background
"Identifying, Understanding, and Analyzing Critical Infrastructures Interdependencies", IEEE Control Systems Magazine
Figure: Examples of electric power infrastructure dependencies
6 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Definition
So what is an Industrial System?
Industrial Control System (ICS) Computer networks that control a physical process. Supervisory Control and Data Acquisition (SCADA) Part of an ICS that directly controls and monitors the physical process (sub-part of an ICS).
7 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Definition
SCADA
Figure: A SCADA HMI Example (fastweb.it)
8 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Components
Components
High level management / enterprise network (ERP)

SCADA User Interface

Engineering workstation
Programmable Logic Controllers

Figure: ICS Components

9 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Components
A Concrete Example
Figure: A PLC and the associated HMI
10 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion
Plan
1 Background 2 What is an ICS? 3 Overview
Motivations Previous Work Goals 4 Reversing an Industrial Protocol 5 Wanted: Entropy 6 Firmware Reverse Engineering 7 Conclusion
11 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Motivations
Why Specifically an Industrial Protocol?
Most public vulnerabilities are related to Either vulnerabilities not specific to industrial networks (embedded Web servers, for example) Or protocols with a public specification
Industrial protocols are of main interest Critical: direct, low-level control of an industrial process Essential: heart of the industrial system

PLC protocol / Electric signals
Physical equipment

PLC protocol

PLC

HMI

12 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Motivations
Choosing Our Target
Popular vendor, particularly in Europe Recent protocol, designed to be secure
Older protocol: partially documented, insecure Recent version: state of the art security for an ICS Offers password authentication Handles all the operations (both programming and supervision) Proprietary Very few public work Many things to be discovered
13 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Previous Work
Previous Work
Previous versions Serious vulnerabilities (full RAM access) Showed that the (now older) protocol had no security feature
Same product family Work on password authentication Proofs of concept Some vulnerabilities Basic work on the protocol
14 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Goals
What Did We Intend To Do?
1 Reverse a part of the protocol spec to build dissectors 2 Assess the protocol security
How does it implement authentication/integrity? Any flaws in the design? 3 Assess the protocol implementations
15 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion
Plan
1 Background 2 What is an ICS? 3 Overview 4 Reversing an Industrial Protocol
Black-Box Analysis Finding a Stack in a Haystack Unwinding the Cryptosystem 5 Wanted: Entropy 6 Firmware Reverse Engineering 7 Conclusion
16 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Black-Box Analysis
Black-Box Analysis
Goals: Understand the general structure of the packets Get the global signification of the traffic Look for points of interest
Methodology: Controlled traffic generation Differential analysis, between packets from:
Same session, different host Same session, same host, different position Different session, same host, same position Etc.
17 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Black-Box Analysis
Differential Analysis
"Believe it or not, if you stare at the hex dumps long enough, you start to see the patterns" - Rob Savoye
Figure: Differences between similar packets hexlighter (https://github.com/fmonjalet/hexlighter)
18 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Black-Box Analysis
Differential Analysis
Figure: Differences between similar packets (brighter = greater absolute difference)
19 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Black-Box Analysis
Differential Analysis
Figure: Realigned heterogeneous packets
20 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Black-Box Analysis
Results
Results: Part of the specification has been deduced Dissection tools have been written Cryptography related fields have been identified: 32-byte high entropy field
And now? Cryptographic fields need white-box analysis Time to grab IDA
21 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Finding a Stack in a Haystack
Plan
1 Background
2 What is an ICS?
3 Overview
4 Reversing an Industrial Protocol Black-Box Analysis Finding a Stack in a Haystack Unwinding the Cryptosystem
5 Wanted: Entropy
6 Firmware Reverse Engineering
7 Conclusion 22 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Finding a Stack in a Haystack
Choosing a Haystack
What shall we look at? Windows protocol clients (SCADA HMI): easy to debug/instrument Firmware: packed in a custom way and very hard to instrument Guess where we started...
What are we looking for? Code that processes network data Possible implementation of standard cryptographic primitives
23 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Finding a Stack in a Haystack
Finding the Protocol Stack
How can we do that? The smart way: generate a trace of one process and taint data coming from network: quite complicated on big software multi process and shared memory issues alternatively trace the whole system: can be really powerful, but requires specific software The half-smart way: follow the data from the network by breaking on memory/code: a hell in big enterprise-asynchronous-multiprocess-full-of-copies software The pragmatic way: look for specific cryptographic algorithm, in our case 32-byte hashing ones (such as SHA-256)
24 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Finding a Stack in a Haystack
Letting signsrch do the job

signsrch (http://aluigi.altervista.org/mytoolz.htm): automatic detection of classic cryptographic constants/code
Executed on every DLL used by the main process
One was more interesting than the others:
1 offset num description [bits.endian.size] 2 -------------------------------------------3 xxxxxxxx 1036 SHA1 / SHA0 / RIPEMD -160 initialization [32.le.20&] 4 xxxxxxxx 2053 RIPEMD -128 InitState [32.le.16&] 5 xxxxxxxx 876 SHA256 Initial hash value H (0x6a09e667UL) [32.le.32&] 6 xxxxxxxx 1016 MD4 digest [32.le.24&] 7 xxxxxxxx 1299 classical random incrementer 0x343FD 0x269EC3 [32.le
.8&] 8 [...] 9 xxxxxxxx 1290 __popcount_tab (compression?) [..256] 10 xxxxxxxx 874 SHA256 Hash constant words K (0 x428a2f98 ) [32. le .256] 11 xxxxxxxx 894 AES Rijndael S / ARIA S1 [..256] 12 xxxxxxxx 897 Rijndael Te0 (0 xc66363a5U ) [32. be .1024] 13 xxxxxxxx 899 Rijndael Te1 (0 xa5c66363U ) [32. be .1024] 14 xxxxxxxx 901 Rijndael Te2 (0 x63a5c663U ) [32. be .1024] 15 xxxxxxxx 903 Rijndael Te3 (0 x6363a5c6U ) [32. be .1024] 16 xxxxxxxx 915 Rijndael rcon [32. be .40] 17 [...]

25 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unwinding the Cryptosystem
Plan
1 Background
2 What is an ICS?
3 Overview
4 Reversing an Industrial Protocol Black-Box Analysis Finding a Stack in a Haystack Unwinding the Cryptosystem
5 Wanted: Entropy
6 Firmware Reverse Engineering
7 Conclusion 26 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unwinding the Cryptosystem
Unwinding the Cryptosystem
Starting point: 1 Break on suspicious code (SHA-256) 2 See that it is actually used with data from the packet 3 Static analysis reveals HMAC SHA-256. 4 Uses a MAC key, where does it come from?
Unwind: 1 Find out how the MAC key is generated 2 Black-Box analysis: locate the key exchange in the packets 3 White-Box analysis: find out how it is exchanged 4 Etc.
27 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unwinding the Cryptosystem
Cryptosystem Summary
A session is established (with a given session number) The HMI generates a 128 bit AES key and a 180 bit MAC key The AES key is exchanged using an unknown algorithm
White-box cryptography, obfuscation The MAC key is sent encrypted using AES-128 GCM All the packets are now authenticated:
HMAC SHA-256(macKey, message) User authentication: password (challenge/response) The authenticated peers are the only ones able to forge valid packets
28 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unwinding the Cryptosystem
Cryptosystem Summary

Client
Session establishment

hello packet hello packet incl. 20 rand. bytes

Server

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unwinding the Cryptosystem
Cryptosystem Summary

Client

Server

Session establishment

hello packet hello packet incl. 20 rand. bytes
obf encKobf (KAES ) + aes128 gcm encKAES (KMAC +16 rand bytes) Applicative ack

After this response, all packets contain
a HMAC

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unwinding the Cryptosystem
Cryptosystem Summary

Client

Server

Session establishment

hello packet hello packet incl. 20 rand. bytes
obf encKobf (KAES ) + aes128 gcm encKAES (KMAC +16 rand bytes) Applicative ack

After this response, all packets contain
a HMAC

Password authentication

Ask for challenge chall: 20 byte challenge

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unwinding the Cryptosystem
Cryptosystem Summary

Client

Server

Session establishment

hello packet hello packet incl. 20 rand. bytes
obf encKobf (KAES ) + aes128 gcm encKAES (KMAC +16 rand bytes) Applicative ack

After this response, all packets contain
a HMAC

Password authentication

Ask for challenge chall: 20 byte challenge
HMACsha1(key = sha1(password ), text = chall ) Auth result

After this response, this
session has the priviledge
associated with password

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unwinding the Cryptosystem
Cryptosystem Summary

Client

Server

Session establishment

hello packet hello packet incl. 20 rand. bytes
obf encKobf (KAES ) + aes128 gcm encKAES (KMAC +16 rand bytes) Applicative ack

After this response, all packets contain
a HMAC

Password authentication
Rest of the communication

Ask for challenge chall: 20 byte challenge HMACsha1(key = sha1(password ), text = chall )
Auth result
payload + HMACsha1(key = KMAC , text = payload ) payload + HMACsha1(key = KMAC , text = payload )

After this response, this
session has the priviledge
associated with password

...

29 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unwinding the Cryptosystem
Notes on the Protocol
Client uses an (ECC?) public key (Kobf ) to encrypt the first shared secret (KAES )
30 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unwinding the Cryptosystem
Notes on the Protocol
Client uses an (ECC?) public key (Kobf ) to encrypt the first shared secret (KAES ) Key stored in an encrypted Zip client-side (password is hard-coded) Zip comes from the SCADA HMI installation
30 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unwinding the Cryptosystem
Notes on the Protocol
Client uses an (ECC?) public key (Kobf ) to encrypt the first shared secret (KAES ) Key stored in an encrypted Zip client-side (password is hard-coded) Zip comes from the SCADA HMI installation The key retrieved in the Zip depends only on the PLC model  Same private key for all similar PLCs Goal: reverse obfuscated crypto and recover private key from firmware (work in progress)
30 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion
Plan
1 Background 2 What is an ICS? 3 Overview 4 Reversing an Industrial Protocol 5 Wanted: Entropy
Vulnerability Description Demonstration 6 Firmware Reverse Engineering 7 Conclusion
31 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Vulnerability Description
Vulnerability Description
Authenticity  secrecy of the MAC key. Key collisions found when debugging
32 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Vulnerability Description
Vulnerability Description
Authenticity  secrecy of the MAC key. Key collisions found when debugging How is the key generated?
prng_init(0xffffffff) Deterministic sequence of calls to:
prng_reseed("only for real entropy bytes!") prng_gen_num(size)
Same MAC key sequence at every execution Easy brute force... Forge authenticated packets No need to break white-box cryptography
32 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Vulnerability Description
Building an Actual Attack
What can be done: Steal any authenticated session Act with the privileges of any active user Arbitrary writes PLC reprogrammation Spoof traffic (spoofed read values)  Full control over the actual physical process
Exploiting it: Limited knowledge of the protocol is enough Differential analysis (real traffic, generated traffic)  Isolate parts that need to be understood
Has been patched since this study
33 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion
Demonstration
Demonstration
Exploiting the entropy loss: Man in the middle between PLC and supervision

User Interface PLC

Attacker

34 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion
Plan
1 Background 2 What is an ICS? 3 Overview 4 Reversing an Industrial Protocol 5 Wanted: Entropy 6 Firmware Reverse Engineering
Sections Unpacking the code section Code signature 7 Conclusion
35 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion
Firmware Reverse Engineering
Motivation No white-box cryptography? Lighter obfuscation?
Accessing the firmware On the NAND of the PLC On the vendor's website: can be downloaded with a valid account
Update mechanism Update through Web server or SD Card Firmware code is fully compressed Unpacking done by the running firmware  Black-box unpacking...
36 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Sections
Looking for headers

Name

00000020 00000030 00000040 00000050 00000060 00000070 00000080 00000090 000000A0 000000B0

58 42 30 20 00 00 00 00 00 00 00 00 20 00 00 00 87 D0 FD FF 42 47 5F 41 42 4C BE 41 99 00 4D 68 8A E5 41 30 30 30 30 30 02 00 00 00 FF FF FF FF 42 30 30 30 30 30 48 00 00 00 02 40 EE FF 46 57 5F 53 49 47 42 47 5F 41 42 4C 01 00 EF 00 00 00 00 10 36 45 53 37 20 32 31 32 2D 31 42 45 34 30 2D 30 58 42 30 20 56 04 00 00 41 30 30 30 30 30 F2 B7 00 00 00 01 5D 1B 41 53 00 00 04 2D C0 00 00 80 40 00 00 D8 B6 C7 00 04 00 00 00 00 00 00 40 00 00 80 3F 00 10 00 00 00 56 04 00 00 40 00

XB0 ........ ... ÐýÿBG_ABL¾ATM.Mh SåA00000....ÿÿÿÿ B00000H....@îÿFW _SIGBG_ABL..ï... ..6ES7 212-1BE40 -0XB0 V...A00000 ò·....].AS...-À. .@..Ø¶Ç........ @..?.....V...@.

37 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Sections
Looking for headers

Size

00000020 00000030 00000040 00000050 00000060 00000070 00000080 00000090 000000A0 000000B0

58 42 30 20 00 00 00 00 00 00 00 00 20 00 00 00 87 D0 FD FF 42 47 5F 41 42 4C BE 41 99 00 4D 68 8A E5 41 30 30 30 30 30 02 00 00 00 FF FF FF FF 42 30 30 30 30 30 48 00 00 00 02 40 EE FF 46 57 5F 53 49 47 42 47 5F 41 42 4C 01 00 EF 00 00 00 00 10 36 45 53 37 20 32 31 32 2D 31 42 45 34 30 2D 30 58 42 30 20 56 04 00 00 41 30 30 30 30 30 F2 B7 00 00 00 01 5D 1B 41 53 00 00 04 2D C0 00 00 80 40 00 00 D8 B6 C7 00 04 00 00 00 00 00 00 40 00 00 80 3F 00 10 00 00 00 56 04 00 00 40 00

XB0 ........ ... ÐýÿBG_ABL¾ATM.Mh SåA00000....ÿÿÿÿ B00000H....@îÿFW _SIGBG_ABL..ï... ..6ES7 212-1BE40 -0XB0 V...A00000 ò·....].AS...-À. .@..Ø¶Ç........ @..?.....V...@.

38 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Sections
Looking for headers

CRC-32

00000020 00000030 00000040 00000050 00000060 00000070 00000080 00000090 000000A0 000000B0

58 42 30 20 00 00 00 00 00 00 00 00 20 00 00 00 87 D0 FD FF 42 47 5F 41 42 4C BE 41 99 00 4D 68 8A E5 41 30 30 30 30 30 02 00 00 00 FF FF FF FF 42 30 30 30 30 30 48 00 00 00 02 40 EE FF 46 57 5F 53 49 47 42 47 5F 41 42 4C 01 00 EF 00 00 00 00 10 36 45 53 37 20 32 31 32 2D 31 42 45 34 30 2D 30 58 42 30 20 56 04 00 00 41 30 30 30 30 30 F2 B7 00 00 00 01 5D 1B 41 53 00 00 04 2D C0 00 00 80 40 00 00 D8 B6 C7 00 04 00 00 00 00 00 00 40 00 00 80 3F 00 10 00 00 00 56 04 00 00 40 00

XB0 ........ ... ÐýÿBG_ABL¾ATM.Mh SåA00000....ÿÿÿÿ B00000H....@îÿFW _SIGBG_ABL..ï... ..6ES7 212-1BE40 -0XB0 V...A00000 ò·....].AS...-À. .@..Ø¶Ç........ @..?.....V...@.

39 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Sections
Looking for headers

00000020 00000030 00000040 00000050 00000060 00000070 00000080 00000090 000000A0 000000B0

58 42 30 20 00 00 00 00 00 00 00 00 20 00 00 00 87 D0 FD FF 42 47 5F 41 42 4C BE 41 99 00 4D 68 8A E5 41 30 30 30 30 30 02 00 00 00 FF FF FF FF 42 30 30 30 30 30 48 00 00 00 02 40 EE FF 46 57 5F 53 49 47 42 47 5F 41 42 4C 01 00 EF 00 00 00 00 10 36 45 53 37 B2G0_A3B2L 31 32 2D 31 42 45 34 30 2D 30 58 42 30 20 56 04 00 00 41 30 30 30 30 30 F2 B7 00 00 00 01 5D 1B 41 53 00 00 04 2D C0 00 00 80 40 00 00 D8 B6 C7 00 04A000000000 00 00 00 00 40 00 00 80 3F 00 10 00 00 00 56 04 00 00 40 00

XB0 ........ ... ÐýÿBG_ABL¾ATM.Mh SåA00000....ÿÿÿÿ B00000H....@îÿFW _SIGBG_ABL..ï... ..6ES7 212-1BE40 -0XB0 V...A00000 ò·....].AS...-À. .@..Ø¶Ç........ @..?.....V...@.

40 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unpacking the code section
Layout of the code section

Section A00000

Size of chunks

00000090 000000A0 000000B0
0000B880 0000B890 0000B8A0 0000B8B0
00017980 00017990 000179A0 000179B0
000243F0 00024400 00024410

F2 B7 00 00 00 01 5D 1B 41 53 00 00 04 2D C0 00 00 80 40 00 00 D8 B6 C7 00 04 00 00 00 00 00 00 40 00 00 80 3F 00 10 00 00 00 56 04 00 00 40 00
... 2C 20 FF E2 03 00 02 C1 00 00 00 01 E3 A0 90 00 00 E1 A0 B0 09 E8 A3 0A 04 00 E3 A0 B0 4C E8 83 0A 00 00 E2 87 70 01 E2 5E E0 01 00 1A FF FF E3 E3 A0 70 29 00 E3 A0 B0 20 E0 87 21 07 00 E0 85
... 74 50 01 01 03 15 01 A0 70 00 00 00 60 CA 00 00 00 02 E3 A0 00 01 00 E1 C5 00 BC E2 8D 00 40 00 EB FF FA A0 E1 57 00 00 00 2A 00 00 EA E1 A0 10 07 00 E2 87 70 01 E2 8D 00 40 80 05 D0 10 B2 E3
... 44 D3 00 00 00 00 E1 A0 00 05 00 EB 00 0B 3A E1 A0 00 05 80 03 38 E1 B0 70 00 1A 00 00 00 00 EB FF 7C E3 E2 8A 00 0F 5F E1 D0 10 B6 E1 A0 00 00

ò·....].AS...-À. .@..Ø¶Ç........ @..?.....V...@.
, ÿâ...Á....ã .. .á °.è£...ã °Lè ...âp.â^à...ÿÿã ã p).ã ° à!..à...
tP..... p...`Ê.. ..ã ...áÅ.¼â..@. ëÿú áW...*..êá . ..âp.â..@.Ð.²ã
DÓ....á ...ë..:á ...8á°p......ë
ÿ|ãâS.._áÐ.¶á ..

41 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unpacking the code section
Interesting chunks: low compression

00814000 00814010 00814020 00814030 00814040 00814050 00814060 00814070

00 3C 53 45 52 56 45 52 50 00 41 47 45 53 3E 0D 0A 3C 00 21 2D 2D 20 54 68 65 20 00 44 65 66 61 75 6C 74 20 00 6C 69 6E 6B 20 61 74 20 28 74 68 02 42 01 73 65 20 00 54 61 67 20 77 69 6C 6C 01 20 62 65 20 75 73 65 02 00 77 68 65 6E 20 61 20 52 05 65 71 75 65 73 02 63 01 02 75 6C 64 20 6E 6F 02 62 00 65 20 72 65 73 6F 6C 76 00 65 64 20 2D 2D 3E 0D 0A 00 3C 42 41 53 45 20 4C 4F 00 43

.<SERVERP.AGES>. .<.!-- The .Defa ult .link at (th .B.se .Tag will.
be use..when a. R.eques.c..uld n o.b.e resolv.ed. -->...<BASE LO.C

42 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unpacking the code section
Interesting chunks: low compression

00000000 00000009 00000012 0000001B 00000024 0000002D 00000036 0000003F 00000048 00000051 0000005A 00000063 0000006C 00000075 0000007E 00000087

00 3C 53 45 52 56 45 52 50 00 41 47 45 53 3E 0D 0A 3C 00 21 2D 2D 20 54 68 65 20 00 44 65 66 61 75 6C 74 20 00 6C 69 6E 6B 20 61 74 20 28 74 68 02 42 01 73 65 20 00 54 61 67 20 77 69 6C 6C 01 20 62 65 20 75 73 65 02 00 77 68 65 6E 20 61 20 52 05 65 71 75 65 73 02 63 01 02 75 6C 64 20 6E 6F 02 62 00 65 20 72 65 73 6F 6C 76 00 65 64 20 2D 2D 3E 0D 0A 00 3C 42 41 53 45 20 4C 4F 00 43 41 4C 4C 49 4E 4B 3D 00 22 2F 22 20 50 52 45 46

.<SERVERP .AGES>..< .!-- The. .Default. .link at. (th.B.se. .Tag will . be use. .when a R .eques.c. .uld no.b .e resolv .ed -->.. .<BASE LO .CALLINK= ."/" PREF

43 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unpacking the code section
Interesting chunks: low compression

00000000 00000009 00000012 0000001B 00000024 0000002D
First byte: mask 00000036
0000003F 00000048 00000051 0000005A 00000063 0000006C 00000075 0000007E 00000087

00 3C 53 45 52 56 45 52 50 00 41 47 45 53 3E 0D 0A 3C 00 21 2D 2D 20 54 68 65 20 00 44 65 66 61 75 6C 74 20 00 6C 69 6E 6B 20 61 74 20 28 74 68 02 42 01 73 65 20 00 54 61 67 20 77 69 6C 6C 01 20 62 65 20 75 73 65 02 00 77 68 65 6E 20 61 20 52 05 65 71 75 65 73 02 63 01 02 75 6C 64 20 6E 6F 02 62 00 65 20 72 65 73 6F 6C 76 00 65 64 20 2D 2D 3E 0D 0A 00 3C 42 41 53 45 20 4C 4F 00 43 41 4C 4C 49 4E 4B 3D 00 22 2F 22 20 50 52 45 46

.<SERVERP .AGES>..< .!-- The. .Default. .link at. (th.B.se. .Tag will . be use. .when a R .eques.c. .uld no.b .e resolv .ed -->.. .<BASE LO .CALLINK= ."/" PREF

44 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unpacking the code section
Interesting chunks: low compression

00000000

00000009

00000012

0000001B

00000024

0000002D

First byte: mask 00000036
0000003F

00000048

Red bytes:

00000051 0000005A

length

00000063

0000006C

00000075

0000007E

00000087

00 3C 53 45 52 56 45 52 50 00 41 47 45 53 3E 0D 0A 3C 00 21 2D 2D 20 54 68 65 20 00 44 65 66 61 75 6C 74 20 00 6C 69 6E 6B 20 61 74 20 28 74 68 02 42 01 73 65 20 00 54 61 67 20 77 69 6C 6C 01 20 62 65 20 75 73 65 02 00 77 68 65 6E 20 61 20 52 05 65 71 75 65 73 02 63 01 02 75 6C 64 20 6E 6F 02 62 00 65 20 72 65 73 6F 6C 76 00 65 64 20 2D 2D 3E 0D 0A 00 3C 42 41 53 45 20 4C 4F 00 43 41 4C 4C 49 4E 4B 3D 00 22 2F 22 20 50 52 45 46

.<SERVERP .AGES>..< .!-- The. .Default. .link at. (th.B.se. .Tag will . be use. .when a R .eques.c. .uld no.b .e resolv .ed -->.. .<BASE LO .CALLINK= ."/" PREF

45 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unpacking the code section
Compression
Summary: Blocks of 9 bytes: 1 byte of mask, 8 bytes of data Pieces of data encoded by their length No length/distance... Compression increases inside a chunk
 LZ-based compression
46 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unpacking the code section
Compression: LZP
LZP One and only algorithm coding only the length on WikiBooks. Improvement to dictionary coding/context coding. 4 variants. Here LZP3 is used. No public implementation has been found.
Usage Unpack each block of the A00000 section. Each block is 64KB. Got plain text firmware. CRC-32 at the end to confirm.
47 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Unpacking the code section
Memory layout
Unpacked firmware: no known format, raw blob. Memory layout is described in the binary. Used by the boot loader. IDA loader written to load the firmware with a correct mapping. One bad news: obfuscation is still here...
48 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Code signature
Firmware signature
Goal Bypass the signature mechanism Inject our own code
Signature check ECDSA-256 with SHA-256, standard curve and generator (ANSI X9.62 P-256) All the firmware is signed, except the last 78 bytes (FW SIG section, fixed size) Custom code, will implemented. Fixed size numbers.
 No vulnerability has been found.
49 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion Code signature
Future work
White-box cryptography. Authentication: private key of the PLC. One key to rule them all. Encryption of the user programs (AES, seems to be easy).
Better understanding of the protocol. Lot of information in the firmware.
Get code execution. Inject our own code. Modify the behavior of the existing code.
50 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion
Plan
1 Background 2 What is an ICS? 3 Overview 4 Reversing an Industrial Protocol 5 Wanted: Entropy 6 Firmware Reverse Engineering 7 Conclusion
51 / 53

Background What is an ICS? Overview Reversing an Industrial Protocol Wanted: Entropy Firmware Reverse Engineering Conclusion
Conclusion
Industrial technology still not mature Cryptography misuses Easy session stealing Non standard authentication scheme
Some real progress Efforts to build a secure protocol Way better than other what used to be done Very reactive vendor Things are going in the right direction
52 / 53

Questions?
contact@quarkslab.com I @quarkslab.com

