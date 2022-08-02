Dealing the perfect hand
Shuffling memory blocks on z/OS
Shuffling zOS memory blocks

Ayoub ELAASSAL
@ayoul3__ Github.com/ayoul3

What I picture when talking about Mainframes
Shuffling zOS memory blocks

What people picture when I talk about Mainframes
Shuffling zOS memory blocks

In 2017...IBM z14
· 32 TB of RAM · 170 processors,5.2 GHz · Encryption at a rate of 312 Go/second · Dedicated processors for JAVA, XML and
UNIX · Dedicated processors for I/O
Shuffling zOS memory blocks

Shuffling zOS memory blocks

Shuffling zOS memory blocks
6

About me
Pentester at PwC France, mainly hacking Windows and Unix stuff First got my hands on a mainframe in 2014...Hooked ever since When not hacking stuff: Metal and wine

Shuffling zOS memory blocks

· github.com/ayoul3 · ayoul3__

This talk
Why we should care about mainframes Quick recap on how to execute code on z/OS Playing with z/OS internals
Shuffling zOS memory blocks

The wonders of TN3270

The main protocole to interact with a Mainframe is called TN3270 TN3270 is simply a rebranded Telnet ...Clear text by default
Shuffling zOS memory blocks

X3270 emulator if you don't have the real thing

Shuffling zOS memory blocks

Ettercap dissector by @Mainframed767

Quick recap on how to execute code on z/OS
Sniffing credentials Good ol' bruteforce Go through the middleware And many more (FTP, NJE, etc.)
Shuffling zOS memory blocks

Time Sharing Option (TSO)
TSO is the /bin/bash on z/OS

Shuffling zOS memory blocks

Tsk tsk tsk... too friendly!

Bruteforcing TSO

TSO: the command line interpreter
Shuffling zOS memory blocks

Nmap script by @Mainframed767 https://nmap.org/nsedoc/scripts/tso-enum.html

Bruteforce is still surprisingly effective
Passwords derived from the login name*

Windows : 5%

Mainframe : 27%

Shuffling zOS memory blocks

*Stats of cracking ~1000 accounts on Windows vs Mainframe in the same engagement

Quick recap on how to execute code on z/OS
Sniffing credentials Good ol' bruteforce Go through the middleware And many more (FTP, NJE, etc.)
Shuffling zOS memory blocks

Shuffling zOS memory blocks

Shuffling zOS memory blocks

Shuffling zOS memory blocks

Interactive apps
Most interactive applications on z/OS rely on a middleware called CICS CICS is a combination Drupal and Apache Tomcat... before it was cool (around 1968) Current version is CICS TS 5.4
Shuffling zOS memory blocks

CICS: a middleware full of secrets
If we manage to "exit" the application, we can instruct CICS to execute default admin programs (CECI, CEMT, etc.) => rarely secured
CECI offers to execute API functions
As usual, some API functions are particularly interesting!
Shuffling zOS memory blocks

Shuffling zOS memory blocks

Shuffling zOS memory blocks

https://github.com/ayoul3/cicspwn/

Quick recap on how to execute code on z/OS
Sniffing credentials Good ol' bruteforce Go through the middleware And many more (FTP, NJE, etc.) Check out @Mainframed767, @BigEndianSmalls & @singe's talks!
Shuffling zOS memory blocks

Shell on z/OS, now what?
The most widespread security product on z/OS is RACF. It performs authentication, access control, etc.
There are three main security attributes on RACF : · Special : can alter RACF rules and access any resource · Operations : access all files unless being forbidden from doing so · Auditor : access audit trails and manage logging classes
Shuffling zOS memory blocks

LISTUSER command on TSO
TSO: command line interpreter RACF: security product. Enforces ACL and authentication
Shuffling zOS memory blocks

Why we should care about mainframes Quick recap on how to execute code on z/OS Playing with z/OS internals
Shuffling zOS memory blocks

Z architecture
Proprietary CPU (CISC ­ Big Endian)
Each instruction has many variants: memory-memory, memoryregister, register-register, register-immediate, etc.
16 general purpose registers (0 ­ 0xF) (+ 49 other registers)
The PSW register holds control flags and the address of the next instruction
Shuffling zOS memory blocks

Security context in memory
z/OS, like any other OS, relies on control blocks: data structures describing the current state of the system
RACF stores the current user's privileges in the ACEE control block
RACF: security product. Enforces ACL and authentication
Shuffling zOS memory blocks

Security context in memory

0 PSA

548
PSAAOLD

ASCB

108 ASCBASXB

ASXB

Always starts at virtu. addr
0

200 ASXBSENV

Address Space Control Block

Address Space Extension Block

ACEE
38 USER FLAGS
1... .... SPECIAL ..1. .... OPERATIONS ...1 .... AUDITOR

Shuffling zOS memory blocks

Attack plot
Patch ACEE bit 38 (x26) in memory
Shuffling zOS memory blocks

Program State Word (PSW)

Shuffling zOS memory blocks

ABEND S0C4, code 4: Protection exception.

Memory protection
Each page frame (4k) is allocated a 4-bit Storage key + Fetch Protection bit at the CPU level
16 possible Storage key values 0 ­ 7 : system and middleware. 0 is the master key 8 : mostly for users 9 ­ 15 : used by programs that require virtual = real memory
The storage key of a memory page is compared with the protection key in the PSW register
PSW: register holding next instruction address and control flags describing system state
Shuffling zOS memory blocks

Program State Word (PSW)

Control flags

Next instruction

8 - 11 bit : current protection key, 8 in this case

Shuffling zOS memory blocks

Memory protection

Storage keys match

Storage don't match & Fetch bit ON

Storage don't match & Fetch bit OFF

PSW key is zero

Full

PSW key is not zero

Full

Full None

Full Read

Shuffling zOS memory blocks

Attack plot
Patch ACEE bit 38 (x26) in memory Switch protection key in PSW : MODESET macro
· ACEE: data structure holding current privileges of a user/task · PSW: register holding next instruction address and control
flaSghusfflidngezOsScmreimboriynbglockss ystem state

Problem State Vs Supervisor State
Some instructions are only available in Supervisor state (kernel mode) :
· Cross memory operations · Direct Storage Access · Changing storage keys · Exit routines · Listening/editing/filtering system events · Etc.
Shuffling zOS memory blocks

How do we get into Supervisor state
APF libraries are extensions of the zOS kernel Any program present in an APF library can request supervisor mode Obviously...these libraries are very well protected ! (irony)
Shuffling zOS memory blocks

Attack plot
Patch ACEE bit 38 (x26) in memory
Switch protection key in PSW : MODESET macro
Find APF library with ALTER access
· ACEE: data structure holding current privileges of a user/task · PSW: register holding next instruction address and control
flaSghusfflidngezOsScmreimboriynbglockss ystem state

Hunting APF on z/OS... Diving into virtual memory

0 PSA

16
FLCCVT
Always starts at virtu. addr
0

CVT 140 EAECVT
References all major structures

ECVT 228 ECVTCSVT
Extended CVT

CSVT 12 APFA

APFA 8
FIRST

12 LAST

Content Supervisor
Table

Shuffling zOS memory blocks

APF APF APF
APF

Patching the ACEE
Shuffling zOS memory blocks

APF
@aySohuulf3fli_ng_zOS memory blocks

Shuffling zOS memory blocks

https://github.com/ayoul3/Privesc/blob/master/ELV.APF

The theory behind this trick is not new
Mark Wilson @ich408i discussed a similar abuse of privilege using SVC Some legitimate products/Mainframe admins use a variation of this technique too! Stu Henderson alluded to critical risks of having APF with ALTER access
Shuffling zOS memory blocks

Supervisor Call
Supervisor Call ~ Syscalls on Linux: APIs to hand over control to Supervisor mode Table of 255 SVC. 0 to 200 are IBM reserved. 201 ­ 255 are user defined Some admins/products register an authorized SVC that switches the AUTH bit and goes into Kernel mode
Shuffling zOS memory blocks

« Magic » SVC code
Shuffling zOS memory blocks

Call SVC to get into Supervisor mode

APF: Libraries or folders to go into Kernel mode
Shuffling zOS memory blocks

Forget APF, anyone can get into Supervisor mode

Hunting SVC on z/OS... Diving into virtual memory

0 PSA

16 FLCCVT

CVT

200 CVTABEND

SCVT

Always

132 SVCTABLE

starts at virtu. addr
0

References all major structures

Secondary CVT

Shuffling zOS memory blocks

SVC 1 SVC 2 SVC 3
SVC 255

Looking for « magic » SVC

Shuffling zOS memory blocks

We browse the SVC table looking for these instructions (and other possible variations)

Supervisor Call

Shuffling zOS memory blocks

https://github.com/ayoul3/Privesc/blob/master/ELV.SVC

Excerpts from the Logica attack

Shuffling zOS memory blocks

https://github.com/mainframed/logica/blob/master/Tfy.source.backdoor

A few problems though
The user's attribute are modified => RACF rules are altered You can be Special, that does not mean you can access any app!
=> Need to figure out the right class/resource to add RACF rules (not easy)
RACF: enforces ACL and authentication
Shuffling zOS memory blocks

Impersonating users
Shuffling zOS memory blocks

Interesting stuff in the ACEE
Foreign ACEE ....

UserID Group Name User Flags Privileged flag Terminal information Terminal ID @ List of groups

Duplicate fields

.... Shuffling zOS memory blocks

Our own ACEE

Not so fast...
Each user or program is allocated a virtual address space (same as in Windows/Linux) All addresses spaces share some common regions that contain system data & code: PSA, CVT, etc.
Private areas can only be addressed from within the address space
Each address space is identified by a 2-byte number : ASID (~ PID on Linux)
Shuffling zOS memory blocks

Virtual address space layout
ACEE
Private region
Shuffling zOS memory blocks

Virtual Address Space Private
Shared Area Low User Private Extended Private

16 EB 512 T 2 T 2 G

Extended Common
Common region User region
System region PSA

16 MB 24K
8K

Interesting stuff in the ACEE

1. Copy ACEE
Target program or user

Evil program

2. Paste ACEE
Our own user session

Virtual address space A

Virtual address space B

Virtual address space C

.... Shuffling zOS memory blocks

Cross memory operations
Shuffling zOS memory blocks

@Mainframed767 @BigEndianSmalls Mark Wilson & RSM Partners Henri Kuiper Stu Henderson CBT TAPE IBM Wavestone
Shuffling zOS memory blocks

Thank you

· github.com/ayoul3 · ayoul3__

