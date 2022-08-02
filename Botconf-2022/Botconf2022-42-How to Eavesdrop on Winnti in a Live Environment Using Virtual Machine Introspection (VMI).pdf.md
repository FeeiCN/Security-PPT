Botconf 2022 How to Eavesdrop on Winnti in a
Live Environment Using Virtual Machine Introspection (VMI)
Philipp Barthel & Sebastian Eydam

Motivation and Goal
r Motivation r use our VMI tool Tycho to showcase functionality r tackle a well known and successful malware
2

Motivation and Goal
r Motivation r use our VMI tool Tycho to showcase functionality r tackle a well known and successful malware r Winnti is an APT RAT that has attacked many DAX corporations
2

Motivation and Goal
r Motivation r use our VMI tool Tycho to showcase functionality r tackle a well known and successful malware r Winnti is an APT RAT that has attacked many DAX corporations
r Goal r detect an infection r eavesdrop on the malware r ... without beeing seen
2

Motivation and Goal
r Motivation r use our VMI tool Tycho to showcase functionality r tackle a well known and successful malware r Winnti is an APT RAT that has attacked many DAX corporations
r Goal r detect an infection r eavesdrop on the malware r ... without beeing seen  The Winnti Detective
2

Talking Points
About us Virtual Machine Introspection About Winnti The Winnti Detective
3

Cyberus and Us
r Cyberus r founded 2017 r about 25 employees r specialized in virtualization technology
and secure workstations
r involved in discovery of Meltdown and
Spectre
4

Cyberus and Us

r Cyberus r founded 2017 r about 25 employees r specialized in virtualization technology
and secure workstations
r involved in discovery of Meltdown and
Spectre

r Philipp Barthel

r student employee studying

Cybercrime/Cybersecurity with focus on

r

malware worked 6

months

on

Winnti

analysis

r Sebastian Eydam

r student employee at the time, now

r

full-time at Cyberus just finished his thesis

project

about

side

channel attack mitigations in hypervisors

r Sebastian Manns

r Werner Haas

4

Virtual Machine Introspection
What Is VMI?

r Intrusion Detection System (IDS)

r r r

collects sensor information from different detects malware signatures, and/or identifies abnormal behaviour

sources

5

Virtual Machine Introspection
What Is VMI?

r Intrusion Detection System (IDS)

r r r

collects sensor information from different detects malware signatures, and/or identifies abnormal behaviour

sources

r Trade-off between resistance and visibility:

r r

Host-based IDS Network-based

(HIDS) - resides on the same system it is designed IDS (NIDS) - relocates the detection mechanism to

to protect a different

entity

5

Virtual Machine Introspection
What Is VMI?

r Intrusion Detection System (IDS)

r r r

collects sensor information from different detects malware signatures, and/or identifies abnormal behaviour

sources

r Trade-off between resistance and visibility:

r r

Host-based IDS Network-based

(HIDS) - resides on the same system it is designed IDS (NIDS) - relocates the detection mechanism to

to protect a different

entity

r VMI leverages virtualization achieve HIDS visibility and NIDS resistance

5

Virtual Machine Introspection
Virtualization Basics
Operating System
Applications OS Kernel Hardware
6

Virtual Machine Introspection
Virtualization Basics

Virtual Machine
Applications OS Kernel
Virtualization Layer
Virtual Machine Monitor Hypervisor
Hardware

6

Virtual Machine Introspection
Virtualization Basics
0x1000 = 01010101 0x1001 = 01101001 0x1002 = 10101010

Virtual Machine
Applications OS Kernel
Virtualization Layer
Virtual Machine Monitor Hypervisor
Hardware

RAX = 0xDEAD.BEEF RIP = 0xC0FF.EEEE RSP = 0xF000.F000
6

Virtual Machine Introspection
Virtualization Basics
EPROCESS UniqueProcessId = 42 CreateTime = 123456

Virtual Machine
Applications OS Kernel
Virtualization Layer
Virtual Machine Monitor Hypervisor
Hardware

NtCreateProcess ProcessHandle = 12 DesiredAccess = 3
6

Virtual Machine Introspection
Tycho
Victim PC

Analyst PC
7

Virtual Machine Introspection
Tycho
r attach to processes (calc = tycho.open_process("calc.exe"))
8

Virtual Machine Introspection
Tycho
r attach to processes (calc = tycho.open_process("calc.exe")) r manipulate processes (calc.pause()) r inspect processes (calc.read_linear(0, 1024))
8

Virtual Machine Introspection
Tycho
r attach to processes (calc = tycho.open_process("calc.exe")) r manipulate processes (calc.pause()) r inspect processes (calc.read_linear(0, 1024)) r syscall breakpoints (add_syscall_whitelist(syscalls.NtCreateFile)) r interpret syscalls
8

About Winnti
General and Targets
r group of hackers r presumably a state-sponsored Chinese thread actor r deploy a RAT called Winnti
Source: https://www.welivesecurity.com/2020/05/21/no-game-over-winnti-group/
r Winnti is still going strong today...
9

About Winnti
General and Targets
Source: https://interaktiv.br.de/winnti/english/
r "Any DAX corporation that hasn't been attacked by Winnti must have done something wrong." - an IT security expert quoted by German public television.
r at least 35 infected companies until 2018 according to Kaspersky Lab
10

Winnti - How It Works, a Simplified Look
The Two Components
11

Winnti - How It Works, a Simplified Look
Encryption
r Encryption
12

Winnti - How It Works, a Simplified Look
Encryption
r Encryption r Decryption
12

Eavesdropping On Winnti In a Live Environment
Three Phases
r Detector - detects infected svchost if applicable r Detective - differentiates genuine svchost functionality / malicious Winnti usage
- extracts data read/written by the Worker Component r Decryptor - decrypts the found data
13

Eavesdropping On Winnti In a Live Environment
The Detector
14

Eavesdropping On Winnti In a Live Environment
The Detective

r inspects all ntDeviceIOControlFile system calls of the given process

r scans for Winnti's custom IOCTL codes

r r

genuine functionality malicious functionality

r r

0x156003 0x15E007

write read

r reads encrypted communication data from system call parameters

15

Eavesdropping On Winnti In a Live Environment
PoC - Does It Really Work?

r Thyssenkrupp Script to scan for infections was used
r replayattack via TCP to send Helo (sic!) and GetQueryHostInformation Packets
r doublecheck using Wireshark - Can we extract what has been sent?

Source: https://github.com/TKCERT/winnti-nmap-script

16

Eavesdropping On Winnti In a Live Environment
PoC - Does It Really Work?
17

Eavesdropping On Winnti In a Live Environment
Differences to Existing Methods
18

Demovideo Let's take a look at the demovideo
19

Summary
r Virtual Machine Introspection r non-invasive monitoring capabilities r live analysis of running Malware
r Winnti r notorious hacker group and RAT tool r well-studied Malware, ideal for experimentation
r Tycho-based analysis r YARA rule to detect infected process r thyssenkrupp's nmap script as C2 emulator r ntDeviceIOControlFile-hooking to observe communication
r philipp.barthel@cyberus-technology.de r sebastian.eydam@cyberus-technology.de
20

