Malware Report

1

Cobalt Strike -- a Toolkit for Pentesters
© 2021 Intel 471 Inc. All rights reserved.

Malware Report

2

Summary
Cobalt Strike is a suite of tools used by red teams in penetration testing tasks. The official website of the suite is Cobalt Strike. Features included and described at the website are:
· Reconnaissance: Discovers which client-side applications the target uses. · Attack packages: Allows hosting a web drive-by attack or transforms an innocent file into a
trojan horse.
· Spear-phishing: Uses templates to generate convincing phishing attacks and allows
sending emails.
· Post exploitation: Utilized the beacon component as the main payload that allows
execution of PowerShell scripts, logging keystrokes, taking screenshots, downloading files and spawning other payloads.
· Covert communication: Uses hypertext transfer protocol (HTTP), hypertext transfer
protocol secure (HTTPS) and domain name system (DNS) to egress a network and supports peer-to-peer communications over server message block (SMB) protocol.
· Browser pivoting: Bypasses two-factor authentication (2FA) and accesses sites as a target. · Reporting and logging: Provides a timeline and a list of indicators from the activity. The
entire suite can be purchased and used as a malware tool set. The main component infecting the system is Beacon. Users of Cobalt Strike can also generate a loader component that injects Beacon into memory, this is also called a stager. The Cobalt Strike toolkit and decompiled source code have been leaked on separate occasions..
© 2021 Intel 471 Inc. All rights reserved.

Malware Report

3

© 2021 Intel 471 Inc. All rights reserved.

Malware Report

4

Capabilities and Behavior Overview
Capabilities · Downloads and executes additional payloads. · Installs additional plug-ins. · Starts socket secure internet protcol (SOCKS) proxy. · Allows remote access. · Logs keystrokes. · Makes screenshots. · Makes screencasts. · Takes webcam photos. · Steals browser form data. · Steals files from disk or network shared folders. · Steals stored credentials.
Behavior
Uses persistence mechanism.
· Encrypts controller communication. · Supports privilege escalation. · Supports multiple architectures.
Once the Loader component is executed on the victim's machine, it executes a PowerShell script with all the dynamic-link libraries (DLLs) required by Cobalt Strike. It first detects whether it's running in a x86 or x64 machine and then loads the appropriate DLL and executes it directly in the PowerShell memory. That prevents the file from being resident in the file system. Once the DLL is executed, the Beacon component is loaded and all features can be used.

© 2021 Intel 471 Inc. All rights reserved.

Malware Report

5

Adversary Intelligence

Developers
This toolkit is a product of a company called Strategic Cyber LLC, which is owned by HelpSystems. All the information is public and is available at the official website. The main developer of the Cobalt Strike set of tools is Raphael Mudge and the coder has a YouTube channel with several tutorials.

Operators
Cobalt Strike is a commercial tool that is used by legitimate penetration testers. However, many open source reports have shown that the suite is also used by state-sponsored actors and cyber criminals, as well. Given that Cobalt Strike has been leaked and is available for purchase in underground forums, it is used by many operators.
We are not aware of a specific operator behind the use of such a toolkit as malware in our Intelligence Platform, Titan. But we regularly observe actors searching for people with knowledge about this tool set. Additionally, some groups known to use this software, that include:

APT19 CopyKittens CobaltGroup Leviathan

DarkHydru APT32 APT29 FIN6

The Intel 471 Malware intelligence team also found Cobalt Strike being dropped by other malware families, such as:

Bokbot aka IcedID Qbot aka Qakbot Bazar

Hancitor Trickbot

© 2021 Intel 471 Inc. All rights reserved.

Malware Report

6

Adversary Intelligence
Infrastructure
Most of the controllers are dedicated servers spread around the world. Ports can be configured by different operators and it is not a closed set.
Since this tool set was leaked and also can be purchased publicly, there is no specific infrastructure.
Detection
Cobalt Strike uses a feature called Malleable-C2 to make network requests easily configurable and therefore hard to detect. However, we have developed some Yara signatures that can help with host-based detection. These rules are available upon the signing of a Mutual-NDA (M-NDA) in order to protect our methods.
Exploits
To spread the malware: We did not observe any exploits used to spread this malware.
Used by the malware: This malware can integrate public exploits to allow privilege escalation. There is a description about how to do that in the most recent Cobalt Strike version on the Cobalt Strike Blog:

© 2021 Intel 471 Inc. All rights reserved.

Malware Report

7

Open Source Intelligence (OSINT)
For a better understanding of the Cobalt Strike Beacon, please review the following public resources:
· Cobalt Strike - beacon.dll: Your No Ordinary MZ Header
https://tccontre.blogspot.com/2019/11/cobaltstrike-beacondll-your-not.html
· Volatility plug-in for Detecting Cobalt Strike Beacon
https://blogs.jpcert.or.jp/en/2018/08/volatility-plugin-for-detecting-cobalt-strike-beacon. html
· Cobaltstrikescan.py
https://github.com/JPCERTCC/aa-tools/blob/master/cobaltstrikescan.py
· Detect shell codes in Metasploit and Cobalt Strike Beacon binaries
https://ciberseguridad.blog/detectar-shellcodes-en-binarios-de-metasploit-y-cobaltstrikebeacon/
· Stealthy peer-to-peer C&C over SMB pipes
https://blog.cobaltstrike.com/2013/12/06/stealthy-peer-to-peer-cc-over-smb-pipes/
· Cobalt Strike Advanced threat tactics for penetration testers
https://www.cobaltstrike.com/
· Analyzing Cobalt Strike Beacon and Metasploit shell codes - Part II
https://ciberseguridad.blog/analizando-shellcodes-de-cobalt-strike-beacon-ymetasploitparte-ii/

© 2021 Intel 471 Inc. All rights reserved.

Malware Report

8

Static Analysis

This section describes important facts from the file that can be useful to detect and identify the sample. The following files were analyzed for this report:

LOADER COMPONENT

Component Cobalt Strike Loader
Cobalt Strike Loader Cobalt Strike Loader

SHA256
5337a22937a48f05cc88349d7cbeddaac9a686a6d81adbcae7150dd49ffae8f9
4bda7e00f2aa3be9283c850b734aca0b7426bdd352603a9c88d6e0d1212d5180
03fb503501ab735edf3fe4cee25a4864ab81a74d95a59a438728758452aabd74

Configuration Config 1
Config 2 Config 3

Beacon component Component Cobalt Strike Beacon
Cobalt Strike Beacon
Cobalt Strike Beacon

SHA256
dc841b1c9939b549f1056b825083e28a1579ccb51bc9132315547f5814bb2e01
c527b312d65c31ec9140229c8ad651beb5aad7995fc9868fd06f168d87b6ad5a
583b4fe5d824a1b2a8dc4428cdf2e07ee0013482c8cbfd604998c259113cd9db

Configuration Beacon Type

Config 4

HTTP

Config 5 Config 6

Hybrid HTTP and DNS
HTTPS

© 2021 Intel 471 Inc. All rights reserved.

Malware Report

9

Static Unpacking
The Cobalt Strike Loader has several obfuscation methods and deception techniques. Most of functions adopt a chained jump obfuscation technique. Instructions are mixed within the functions with jump instructions connecting consecutive instructions. A vast majority of functions are encrypted. The loader tries to keep as little code unencrypted at a time as possible. It accepts an address and number of bytes in EDI and ESI registers, respectively, and uses exclusive or (XOR) for all bytes in that range with a hard-coded byte.
We decrypted the chunks using an interactive disassembler (IDA) application programming interface (API):
def dexor_region(ea, amount): ea = 0x00400000 + ea for i in range(amount): b = idaapi.get_byte(ea + i) b ^= 0x45 diaapi.patch_byte(ea + i, b)
dexor_region(0x5c7e,0xc80)
To make static analysis more difficult, Cobalt Strike Loader copies some fragments of code from one place to another:

© 2021 Intel 471 Inc. All rights reserved.

Malware Report

10

Unpacking section 1
The Loader leverages a few position-independent-code assembly techniques:

Unpacking section 2 · Call $+5 jumps to the next instruction (as call $+5 instruction length is 5) but because it's a
call it also pushes the address onto the stack.
· Pop eax puts the next instruction address into the eax register. · Add eax, 3 calculates the string's address and can be now used as a normal rdata string. · Finally, after several decryption routines, the Loader overwrites its memory with the
decrypted shell code and then it resumes by calling the CreateThread API:
© 2021 Intel 471 Inc. All rights reserved.

Malware Report

11

Unpacking section 3
The shell code uses a name hashing function, a common anti-analysis technique, in which the code first will locate the process environment block (PEB) from the thread information block (TIB). The shell code then will take each entry and normalize the string name by making all the characters in the module name uppercase. The characters of the module name then are rotated right by 13, added together and compared to a hard-coded value for "Kernel32. dll." It utilizes the "ror13AddHash32AddDll" hashing algorithm. The hash will be passed into a function that will hash each export of the DLL in question until a matching pair is found.

As another assembly technique, instead of executing the jmp eax, the eax controller first is pushed onto the stack.
© 2021 Intel 471 Inc. All rights reserved.

Malware Report

12

Unpacking section 4
The main goal of the final shell code is to download and launch the Cobalt Strike Beacon shell code or Cobalt Strike Beacon DLL.
COBALT STRIKE BEACON SHELL CODE The Cobalt Strike Beacon shell code is not complicated. The only task it will perform is to decrypt the actual payload, which is the Cobalt Strike Beacon DLL using the initial decryption key in the offset 0x40. The shell code used about 40 bytes of code including the actual "MZ" header to jump or to execute its export function "_ReflectiveLoader@4."

© 2021 Intel 471 Inc. All rights reserved.

Malware Report

13

Unpacking section 5
The initial structure for the Cobalt Strike Beacon shell code is described below.

INITIAL STRUCTURE

Data

Offset

Shell code

Depends on cobaltstrike shellcode Yara signature -> decr_routine_and_jump

Size of Beacon DLL

decr_routine_and_jump + 0x4: decr_routine_and_jump + 0x8

Encrypted Beacon DLL decr_routine_and_jump + 0x8:

We were able to obtain the decrypted Cobalt Strike Beacon DLL using code implemented in Python, which can be provided following the execution of a M-NDA.
The Cobalt Strike Beacon DLL is a backdoor waiting for commands to execute on the infected machine. Some possible commands are read file, write file, open process, set current directory, impersonate process, local security authority (LSA) server untrusted connection, create and open services, code injection and much more.

COBALT STRIKE BEACON DLL The Cobalt Strike Beacon configuration is encoded with a simple XOR routine.

© 2021 Intel 471 Inc. All rights reserved.

Malware Report

14

Cobalt Strike Beacon DLL
The tables below describe the configuration details for the Cobalt Strike Beacon:

CONFIGURATION FORMAT

Offset 0x00

Length 2

Description index (Refer to Configuration)

0x02
0x04 0x02

2
2 As specified in 0x04

Data length (1 = 2 byte, 2 = 4 byte, 3 = as specified in 0x04)
Data length
Data

CO N FI G U R AT I O N

Offset 0x01

Description Beacon Type

0x02 0x03 0x04 0x05 0x06

Port number Sleep time (ms) Maximum get size
Maximum DNS length

0x07 0x08 0x09 0x0a 0x0b 0x0c 0x0d
0x0e 0x0f 0x10

Public key C2Servers User agent HTTP POST URI Malleable C2 instructions HTTP GET metadata HTTP POST metadata
Spawn to Pipe name Year

Remarks 0=HTTP, 1=Hybrid HTTP and DNS, 8=HTTPS Specifies how often Beacon should call home Data Ratio of jitter in polling time (0-99%) Maximum length of host name when using DNS (0-255)
Name of named pipe used for communication Stop operating after the specified date by Year, Month, Day

© 2021 Intel 471 Inc. All rights reserved.

Malware Report

15

Offset 0x11 0x12 0x13 0x14 0x15 0x16 0x17 0x18 0x19 0x1a 0x1b 0x1c 0x1d 0x1e 0x1f 0x20 0x21 0x22 0x23
0x24 0x25
0x26 0x27 0x28 0x32 0x36

Description Month Day DNS Idle DNS Sleep (ms) SSH host SSH port SSH user name SSH password plaintext SSH password Public key HTTP GET verb HTTP POST verb HTTP POST chunk Spawn to x86 Spawn to x64 Crypto scheme Proxy config Proxy user name Proxy password Proxy behavior
Watermark
Stage cleanup Cfg caution Kill date User cookies Host header

Remarks
Process to inject arbitrary shellcode (32bit) Process to inject arbitrary shellcode (64bit) Use a proxy server for requests Proxy server username Proxy server password 0x1: Direct connection, 0x2: IE settings, 0x4: Proxy server Deprecated A value used to identify the client (Cobalt Strike customer)

© 2021 Intel 471 Inc. All rights reserved.

Malware Report

16

Static unpacking
Cobalt Strike SMB Beacon
The SMB Beacon uses named pipes to communicate through a parent beacon. Named pipes are an interprocess communication mechanism on Windows operating systems. Named pipe communication between hosts is encapsulated in SMB. The "CreateNamedPipe" function will set up a named pipe and the "CreateFile" function connects to a named pipe. The "ReadFile" and "WriteFile" functions are used to read data from and send data through a named pipe. If we change the period in the pipe name to an IP address, the client will be able to communicate with a pipe on a remote system.

© 2021 Intel 471 Inc. All rights reserved.

Malware Report

17

Static unpacking
Unpacking section 7
HARD-CODED STRINGS No relevant hard-coded strings were found in the samples because all samples were packed at build time. One of the Cobalt Strike Loaders we analyzed had the following interesting strings:
/awO5 5O!P%@AP[4\\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H* 5O!P% User-Agent: Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0; BO1IE8_v1;ENUS)\r\n 5O!P%@AP[4\\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H* 5O!P%@AP[4\\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H* 5O!P%@AP[4\\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H* 5O!P% 185.153.196.207
Malware behavior
The Cobalt Strike toolkit code continues to evolve and gain broader distribution.
BEHAVIOR OVERVIEW The loader component only has one job -- to download the Beacon DLL and execute it. Once the loader is executed on the victim's machine, it executes a PowerShell script with all the DLLs required by Cobalt Strike. It first detects whether it's running in a 32-bit or 64bit machine and then loads the appropriate DLL and executes it directly in the PowerShell memory. That prevents the file from being resident in the file system. Once the DLL is executed, the Beacon component is loaded and all features can be used.
PROCESS EXECUTION Cobalt Strike uses the Beacon component to gain a foothold on a target network. The main aim is to download and execute malicious payloads. It can be transmitted over HTTP, HTTPS, DNS or SMB protocol. The Beacon component also can modify its network signature using different command and control (C2) profiles.
© 2021 Intel 471 Inc. All rights reserved.

Malware Report

18

Malware behavior
PERSISTENCE MECHANISM The attackers use trivial but effective persistence techniques to ensure the malicious tools are executed consistently on the infected machines. Those techniques consist of:
· Windows Registry Autorun:
HKCU\\Software\Microsoft\Windows\CurrentVersion\Run\Java Update Schedule Check
HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run\syscheck
HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run\DHCP
Agent HKCU\Software\Microsoft\Windows\CurrentVersion\Run\Microsoft Activation
Checker HKU\Software\Microsoft\Windows\CurrentVersion\Run\Microsoft Update
· Windows Services. · Windows Scheduled Tasks.
The Cobalt Strike Beacon component is executed in-memory and is not stored to disk.

Antivirus (AV) classifications

AV AegisLab Avira DrWeb ESET-NOD32 Ikarus Kaspersky Kaspersky

Alias Trojan.Win32.Cometer TR/AD.Swrort Exploit.ShellCode Python/Rozena Trojan.Win32.Rozena Trojan.Win32.CobaltStrike Trojan.Win32.Cometer

© 2021 Intel 471 Inc. All rights reserved.

Malware Report

19

Contact Us
Phone: (800) 833-1471 Email: sales@intel471.com
www.intel471.com
© 2021 Intel 471 Inc. All rights reserved.

