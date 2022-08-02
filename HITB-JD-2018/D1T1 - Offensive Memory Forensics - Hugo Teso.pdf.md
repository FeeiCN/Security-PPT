JD-HITBSECCONF2018
BEIJING
THE FIRST HITB SECURITY CONFERENCE IN CHINA!

JD-HITBSECCONF2018
OFFENSIVE MEMORY FORENSICS
Hugo Teso
@hteso

This is no sauna...

Know yourself...

Know your enemy...

No you didn't

I wrote that book No I didn't...

Memory Forensics 101
- Memsics: Memory + Forensics - One part of DIGITAL FORENSICS - Analysis of VOLATILE DATA

MEMORY - FORENSICS

MEMORY - FORENSICS

WHICH MEMORY?

Meh...

In the beginning was...
RAM

OS (Memsics) doesn't work with "RAM"

VIRTUAL MEMORY

OS (Memsics) doesn't work with "RAM"
...

RAM
VIRTUAL MEMORY

Wanna know
moreV? irtual Memory, in Windows ,is actually a polymorphic term.
· VM = Physical memory + Page file · VM = the collection of Pages (4KB segments)
scattered in memory of a process working set

Virtual Memory, in Windows ,is actually a polymorphic term.
· VM = Physical memory + Page file

Old fart bad jokes
Virtual Memory

Brings back memories
Physical Memory

Page File

Virtual Memory Physical Memory

Virtual Memory
Page 1 Page 2 Page 3 Page n

Physical Memory
Frame 1 Frame 2 Frame 3 Frame n

Virtual Memory
Page 1 Page 2 Page 3 Page n

Physical Memory
Frame 1 Frame 2 Frame 3 Frame n

Virtual Memory
Page 1 Page 2 Page 3 Page n

MMU

Physical Memory
Frame 1 Frame 2 Frame 3 Frame n

Virtual Memory Physical Memory

Page 1

Frame 1

Consider PamPgaeegsem2aonrdy,FirtawmilelsbleiFkereaamasneieo2rther unit of

MMU

Page 3

Frame 3

Page n

Frame n

Virtual Memory, in Windows ,is actually a polymorphic term.
· VM = the collection of Pages (4KB segments) scattered in memory of a process working set

Virtual Memory
Page 1 Page 2 Page 3 Page n

MMU

Physical Memory
Frame 1 Frame 2 Frame 3 Frame n

MMU Process X

Virtual Memory
Page 1 Page 2 Page 3 Page n

Physical Memory
Frame 1 Frame 2 Frame 3 Frame n

MMU
Process X Address space (VM)

Virtual Memory
Page 1 Page 2 Page 3 Page n

Physical Memory
Frame 1 Frame 2 Frame 3 Frame n

Process X Working set
MMU
Process X Address space (VM)

Virtual Memory
Page 1 Page 2 Page 3 Page n

Physical Memory
Frame 1 Frame 2 Frame 3 Frame n

TEXT DATA
Shared libs STACK

Process X Working set
MMU
Process X Address space (VM)

Virtual Memory
Page 1 Page 2 Page 3 Page n

Physical Memory
Frame 1 Frame 2 Frame 3 Frame n

TEXT DATA
Shared libs STACK

Process X Working set
MMU
Process X Address space (VM)

Virtual Address Space
Virtual Memory
Page 1 Page 2 Page 3 Page n

Physical Address Space
Physical Memory
Frame 1 Frame 2 Frame 3 Frame n

Virtual Address Space
TEXT DATA
Shared libs STACK

Physical Address Space
Physical Memory
Frame 1 Frame 2 Frame 3 Frame n

Virtual Address Space
TETXETTXETTXETXT DADTADATADATAATA
ShSahSraheSrdaherdaleirbdleisbdlisblisbs STSATSCATKSCATKCAKCK

Physical Address Space
Physical Memory
Frame 1 Frame 2 Frame 3 Frame 4 Frame 5 Frame 6 Frame n

User Space (2Gb)
TEXT TEXT TEXT TEXT DATA DATA DATA DATA

Shared libs

Shared libs

Shared libs

Shared libs

STACK STACK STACK STACK

Kernel Space (2Gb)

Physical Address Space
Physical Memory
Frame 1 Frame 2 Frame 3 Frame 4 Frame 5
... Frame n

WAIT! Where are my files? And registry? And network? And...?

Of course, where you put them... In the Hard Drive!

Documents Registry Network
[Resources]

User Space (2Gb)
TEXT TEXT TEXT TEXT DATA DATA DATA DATA

Shared libs

Shared libs

Shared libs

Shared libs

STACK STACK STACK STACK

Kernel Space (2Gb)

Physical Address Space
Physical Memory
Frame 1 Frame 2 Frame 3 Frame 4 Frame 5
... Frame n

MEMORY - FORENSICS

The Contenders · 2 representatives:
§ Spanish team: Offensive § Finnish team: Defensive

Mad? LOL

The GOAL

SPA: Avoid implant detection by FI team FI: Detect SPA implant with mad memsics skills

The TARGET

The TARGET

The REFEREE "You're absolutely one brilliant lunatic :D"

The RULES

The Requirements · No deep "OS XYZ" memory skills · No deep memsics skills · Multiplatform ­ 1 solution to rule them all

The approach · Avoid presence detection...? · Avoid acquisition...? · Avoid analysis detection...?

Option 1

Option 2

Option 3

F**k yeah, that's the offensive way!
Option 4

The offensive approach :D

Redline

p1 p2 pn

Rekall

Volatility

...

Python

Memory Dump

Volatility

Vulnerabilities

Volatility

Volatility plugin

Python

Python modules

Vulnerability

The vulnerabilities. Fuzzing? Human Fuzzing

Memory Dump

Volatility (Python)
Memory rootkit

Weaponized memory dump

DLL

DLL

Trigger

Trigger

Exploit

DLL

Trigger

Exploit

Rootkit

DLL

Trigger

Trigger

Trigger

Exploit Exploit Exploit

Rootkit

Win DLL

Rootkit

OS X DLL

Rootkit

Linux DLL

Trigger

Win

Win

32

Exploit OS X Rootkit OS X DLL

Linux

Linux

64

Trigger

Win

Win

32

Exploit OS X Rootkit OS X DLL

Linux

Linux

64

Volatility Radare2

Rekall EnCase

Redline ...

Approach

Detect Architecture

Detect 32 OS

Detect 64 OS

Determine architecture

Detect Architecture \x40\x90

# rasm2 -d -b 32 4090 inc eax nop

# rasm2 -d -b 64 4090 nop

Determine Architecture
arch_detect: xor eax, eax inc eax nop jnz x86_code

x86_code: bits 32 ...

64_code: bits 64 ...

Determine OS
arch_detect: xorl %eax, %eax rex nop jnz determine_32_os

determine_32_os: mov eax, fs test eax, eax jz lin32_code

determine_64_os: mov eax, ds test eax, eax jnz win64_code jmp lin64_code

Disassembly
\x31\xc0\x40\x90\x75\x08\x8c\xd8\x85\xc0\x75\x0a\xeb\x07\x8c\xe0\x85\xc0\x74\ x03\x90\x90\x90\x90

But in real world... ASLR/PIE ...

But in real world... ROP gadgets!

So, for real world... I need help!

OS X
Vulnerable Buffer
Saved RIP

Assuming...
Windows
Vulnerable Buffer
Saved RIP

Linux
Vulnerable Buffer

Saved RIP

OS X
Vulnerable Buffer

Then...
Linux
Vulnerable Buffer

Windows
Vulnerable Buffer

ROP Chain

ROP Chain

ROP Chain

Finally...
OFFSET 2

Vulnerable Buffer

Linux:
add rsp, OFF1 ret

OS X:
add rsp, OFF2 ret

ROP Chain Windows

ROP Chain Linux

ROP Chain OS X

OFFSET 1

And what now? Post-exploitation time!

Post-exploitation time!

Hide Counter Date

Remove

So Long, and Thanks for All the Fish
Hugo Teso

