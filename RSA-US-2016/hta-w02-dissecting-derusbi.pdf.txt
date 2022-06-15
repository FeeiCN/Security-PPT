SESSION ID: HTA-W02
Dissecting Derusbi
#RSAC

Vanja Svajcer
Threat Research Manager Hewlett Packard Enterprise @vanjasvajcer

#RSAC
Dissecting Derusbi
Setting the scene Sakula/Shyape/Derusbi analysis Summary
2

#RSAC
Setting the scene

#RSAC
Timelines

2008

Capstone Turbine
2011

2013

2014

Early Derusbi

Elderwood platform

ColdFusion server compromise
Ephemeral hydra

April Anthem hack

2015
February Anthem hack discovered

4

#RSAC
Actors
Shell Crew Deep Panda Black Vine APT17 Axiom Group 72
5

#RSAC
Tools, tactics and procedures (TTPs)
Spear phishing Exploits (Elderwood)
Compromised web servers
Hacking tools for credentials and data stealing Authenticode signed files Multistage malware
Dropper Downloader Backdoors
6

#RSAC
Malware
Sakula Shyape Derusbi Hikit Plugx PoisonIvy Hdroot Hydraq Zxshell
7

#RSAC
Analysis

Static analysis
Structural characteristics Compiler Type Checksums Strings Version information Sections Digital signatures Debug paths/strings Language Resources Packers Exports/Imports/APIs
9

#RSAC

#RSAC
Static analysis
Functionality
Anti-debugging Analysis environment detection Configuration data Downloads or drops additional components
Similarity with known threats How to detect it, YARA rules?
10

#RSAC
Static analysis tools
IDAPro + Hex-Rays decompiler IDAPython Bochs emulator Pefile based tools (peframe, AnalyzePE, Remnux)
11

Dynamic analysis
Installation and persistence mechanisms
How it sets itself to survive reboot Any exploits to escalate privilages or bypass defences
Purpose
Targeted or opportunistic Self-replication Payload Additional components
C&C communication endpoints OS changes Detection and removal
12

#RSAC

#RSAC
Dynamic analysis tools
Cuckoo sandbox (or commercial sandbox) WinDbg OllyDbg Pin, DynamoRIO SysInternal tools
13

#RSAC
Malware set
336 samples, Sakula/Shyape/Derusbi Automated analysis to find representative samples Chosen www.we11point.com Sakula dropper Shyape/scar downloader Derusbi backdoor
14

Top domains
160 140 120 100
80 60 40 20
0

Top domains
15

#RSAC

Digital signatures

Career Credit Co,.Ltd. SJ SYSTEM
U-Tech IT service MICRO DIGITAL INC.
NexG DTOPTOOLZ Co.,Ltd.
0

Dig sigs

5

10

15

20

25

16

#RSAC

#RSAC
What are we looking at?
Samples related to Anthem breach Sakula dropper Dropped Shyape downloader Derusbi backdoor Dropped driver
17

#RSAC
Static analysis details Derusbi update.dll
18

#RSAC
Static analysis ­ digital signature
19

#RSAC
Sakula - execution
20

#RSAC
Sakula - execution
21

#RSAC
Sakula - execution
22

#RSAC
Sakula - execution
23

#RSAC
Sakula - execution
24

#RSAC
Sakula ­ deobfuscate Shyape
25

#RSAC
Sakula ­ deobfuscate Shyape IDAPython
26

#RSAC
Shyape - execution
27

#RSAC
Derusbi analysis
Installation Configuration Driver Communication with C2 Detection rules
28

#RSAC
Regsvr32 EP - DllRegisterServer
29

Start

#RSAC

Core

30

#RSAC
Rootkit driver
31

#RSAC
Rootkit driver TCP port check
BOOL __stdcall CheckLocalPortRange(int a1, int a2, int a3, int a4) {
return (a4 - 25700) <= 200; }
32

#RSAC
Configuration decobfuscation
33

Configuration structure

struct __declspec(align(1)) configdata

{

CHAR infectionid[64]; /* campaign-infection id */

CHAR httpconfig[256]; /* C2 endpoints (address and port) */

_DWORD dw1;

_DWORD dw2;

_DWORD timeout;

/* C2 beacon interval */

_DWORD ConnectionType; /* Type of connection to use */

CHAR proxyconfig[32]; /* Proxy address and port */

CHAR user[16];

/* proxy username */

CHAR password[16];

/* proxy password */

};

34

#RSAC

#RSAC
Our sample config

infectionid httpconfig
dw1 dw2 timeout ConnectionType proxyconfig user password

heritage vpn.foundationssl.com:443,openssh. x24hr.com:53 0x00 0x00 0x0D 0x10 172.16.1.141:3128 not set not set

35

#RSAC
Save to Internet Explorer registry key
36

#RSAC
Network packet structure
struct struct_packet /* packet header */ {
_DWORD sizetotal; _DWORD type; _DWORD checksum; _DWORD xorkey; _DWORD iscompressed; _DWORD rawdatasize; char databuf[]; };
37

#RSAC
Original WU service DLL in Security
38

#RSAC
ServiceMain runs original service
39

#RSAC
Goofs
40

#RSAC
Example Yara rule
rule Derusbidll {
strings: $keydriver = {F3 5D 88 2E} $servicename = "wuauserv" $mutexcheck = "c1212win"
condition: all of them
}
41

#RSAC
Summary

#RSAC
"Apply"
Use IDAPro to analyze a Derusbi sample Use IDAPython to script analysis, practice on configuration data and dropped file Use Bochs emulator with IDAPro to deobfuscate samples Use YARA to scan for IOCs on your network
43

References
https://www.emc.com/collateral/white-papers/h12756-wp-shell-crew.pdf https://assets.documentcloud.org/documents/2084641/crowdstrike-deep-panda-report.pdf http://blog.airbuscybersecurity.com/post/2015/10/Malware-Sakula-Evolutions-%28Part-2/2%29 http://blog.jpcert.or.jp/2015/11/a-volatility-plugin-created-for-detecting-malware-used-in-targeted-attacks.html http://blog.airbuscybersecurity.com/post/2015/11/Newcomers-in-the-Derusbi-family https://www.novetta.com/wp-content/uploads/2014/11/Derusbi.pdf https://www.threatconnect.com/the-anthem-hack-all-roads-lead-to-china/ https://www.cs.bu.edu/~goldbe/teaching/HW55815/presos/anthem.pdf https://www.virusbtn.com/pdf/conference_slides/2015/Pun-etal-VB2015.pdf http://www.sekoia.fr/blog/windows-driver-signing-bypass-by-derusbi/ https://download.pureftpd.org/misc/UAC.cpp
44

#RSAC

