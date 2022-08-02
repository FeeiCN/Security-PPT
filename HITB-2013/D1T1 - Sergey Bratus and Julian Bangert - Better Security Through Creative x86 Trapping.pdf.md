Page Fault Liberation Army
Sergey Bratus Julian Bangert
Trust Lab Dartmouth College
Wednesday, April 10, 13

"No instructions were harmed in the making
of this talk"
Wednesday, April 10, 13

Disclaimer
· Turing complete it's just a way of describing what kind of computations an environment can be programmed to do (T.-c. = any kind we know, in theory)
· Wish we had a more granular scale better suited to exploit power
Wednesday, April 10, 13

Today's Slogan
Any input is a program.
Any sufficiently complex input is indistinguishable from byte code; any code that takes complex inputs is indistinguishable from a VM.
Wednesday, April 10, 13

Intro Example: ABI Metadata Machines

Wednesday, April 10, 13

Sarah Inteman/John Kiehl

ELF relocation machine

Wednesday, April 10, 13

LD.SO CODE

ELF metadata machines
Relocations + symbols: a program in ABI for automaton to patch images loaded at a different virtual address:
Wednesday, April 10, 13

Relocation arithmetic:
R_X86_64_COPY:
memcpy(r.r_offset, s.st_value, s.st_size)
R_X86_64_64:
*(base+r.r_offset) = s.st_value + r.r_addend + base
R_X86_64_RELATIVE:
*(base+r.r_offset) = r.r_addend+base
See 29c3 talk by Rebecca ".bx" Shapiro,
https://github.com/bx/elf-bf-tools
Wednesday, April 10, 13

Example for Today:
Page Fault Liberation Army (PFLA)*

Wednesday, April 10, 13

"Input is (still) a program!"
*) In the x86 manuals it stands for "Page Faulting Linear Address",
but our version is more interesting

"Page Fault Liberation"
Let's take an old and known
thing...
Wednesday, April 10, 13

"Page Fault Liberation"
Wednesday, April 10, 13

"Page Fault Liberation"
...and see how far we can make it
can go!
Wednesday, April 10, 13

"Page Fault Liberation"
and perhaps others can
take it further!
Wednesday, April 10, 13

"Page Fault Liberation"
l The x86 MMU is not just a look-up table! l x86 MMU performs complex logic on
complex data structures l The MMU has state and transitions that
brilliant hackers put to unorthodox uses. l Can it be programmed with its input data?
Wednesday, April 10, 13

"Hacking is a practical study of computational models' limits"
· [Apologies for repeating myself] · "What Church and Turing did with
theorems, hackers do with exploits"
· Great exploits (and effective defenses!) reveal truths about the target's actual computational model.
Wednesday, April 10, 13

CPU

MMU

Read

IDT GDT
Wednesday, April 10, 13

Page tables

Write
Stack

· unmapped/bad memory reference trap, based on page tables & (current) IDT
· hardware writes fault info on the stack - where it thinks the stack is (address in TSS)
· If we point "stack" into page tables, GDT or TSS, can we get the "tape" of a Turing machine?
Wednesday, April 10, 13

The devil's in the details trapping bits
Wednesday, April 10, 13

Segment descriptor:
Default segment selector

Type
Global Descriptor Table (GDT)
Address ("offset") must lie within segment limit

Wednesday, April 10, 13

From: duartes.org/gustavo/blog/

Virtual Address Translation

cr3 + 4*37a

0x10000 + 4*2db

Linear Address:

0xDEADBEEF

1101111010 1011011011 111011101111

37a

2db

EEF

Present

0x11111

l All P bits set

Physical Address = 0x1111 1EEF

l Ring 3: All U/S bits have to be set

l Write: All R/W bits have to be set

l What if we violate these rules?

Wednesday, April 10, 13

Wednesday, April 10, 13

ITS A TRAP

OpenWall
· Solar Designer, 1999 · cf. "Stack Smashing for Fun and
Profit"
· CS limit is 3GB - 8MB (for stack)
· Code fetch from the stack is trapped
· See if the current instruction is a RET
· Very specific threat, allows JIT, etc. · (And many other hardening
patches)
Wednesday, April 10, 13

PaX
· PaX is an awesome Linux hardening patch · Many 'firsts' on real-world OS's, e.g. NX on
Intel and ASLR (PaX in 2000, OpenBSD in 2003)
· PaX has NX on all CPUs since the Pentium (Intel has hardware support since P4) · SEGMEXEC and PAGEEXEC · Leverages difference between instruction and data memory paths
Wednesday, April 10, 13

PaX NX: SegmExec
· Instruction: Virtual address = Linear + CS.base · Data: VA= Linear + {DS,ES,FS,GS,SS}.base · 3GB user space · Set all segment limits to 1.5 GB (so all pointers
are less than 1.5GB)
· Data access goes to lower half of VA space · Instruction fetch goes to upper half of VA space
Wednesday, April 10, 13

PaX NX: PageExec
· "split TLB" (iTLB for fetches, dTLB for loads) [Plex86 1997, to detect self-modifying code: http://pax.grsecurity.net/docs/pageexec.old.txt]
· TLBs are not synchronized with page tables in RAM (manually flushed every time tables change)
· NX ~ User/Supervisor bit
Wednesday, April 10, 13

PageExec data lookup

If U=1
TLB
"Fast path" Not found

Access

Pagetable

Always U=0 in PTE
#PF fault
Normal data
if EIP=addr, instruction

Set user bit, read one byte to
fill TLB, clear user bit

Terminate
Wednesday, April 10, 13

OllyBone: Trap on end of unpacker
· Same TLB technique as PaX · Debugger plugin to analyze (un)packers · Want to break execution on a memory
range (so you trap every time you exec after writing)
· The idea goes back to Plex86 (before PaX) who tried to do virtualization that way
Wednesday, April 10, 13

ShadowWalker
· When a rootkit detector scans the code (as
data!), why not give a different page than when the code is executed?
· Instead of having different User bits, we could
also have different page frame numbers (trap on P=0 in pagetables)
Wednesday, April 10, 13

Trap-based "Design Patterns"
· Overloading #PF for security policy, labeling memory (e.g., PaX, OpenWall)
· Combining traps to trap on more complex events (OllyBone,"fetch from a page just written")
· Using several trap bits in different locations to label memory for data flow control (PaX UDEREF, SMAP/SMEP use)
· Storing extra state in TLBs (PaX PageExec) · "Unorthodox" breakpoints, control flow, ...
Wednesday, April 10, 13

What's in a trap handler (let's roll our own)
Wednesday, April 10, 13

IDT entries:
... 8: #DF
... 14: #PF
...
Wednesday, April 10, 13

Call through a Trap Gate
32 bit? nested interrupts?
New code segment Like a FAR call of old. If the new segment is in a lower (i.e. higher privilege) Ring, we load a new SP.
Wednesday, April 10, 13

Pushes parameters to "handler's stack"
These two are only pushed if we changed the stack
ESP
"IRET" instruction can return from this
Wednesday, April 10, 13

What if this fails?
· Stack invalid? · Code segment invalid? · IDT entry not present?
Causes "Double Fault"(#8)."Triple fault" = Reboot Usually DF means OS bug, so a lot of state might be corrupted (i.e. invalid kernel stack)
Wednesday, April 10, 13

Hardware Task Switching
Can use it for #PF and #DF traps instead of Trap Gates
TR
Wednesday, April 10, 13

Task gate
· (unused) mechanism for hardware tasking · Reloads (nearly) all CPU state from memory · Task gate causes task switch on trap
Wednesday, April 10, 13

IDT GDT

(addressed indirectly through GDT)

IDT-> GDT->TSS
It still pushes the error code

Wednesday, April 10, 13

Interrupt to Task Gate

1. Save state to location pointed to by TR

2. Find Task (GDT), validate + check Busy=0

3. Load new state

4. Push error code

Doublefault

Begin executing new EIP

Wednesday, April 10, 13

Brief digression
Intel Manual:
Wednesday, April 10, 13

Brief digression
Intel Manual:
Bypass (all) paging from the kernel? VM Escape?
Wouldn't that be nice?
Wednesday, April 10, 13

Wednesday, April 10, 13

Maybe we should actually verify it.. CPU translates DWORD by DWORD
Wednesday, April 10, 13

Wednesday, April 10, 13

(CC-BY-SA)Lizzie Bitty/DevianArt

Look Ma, it's a machine!
Wednesday, April 10, 13

A one-instruction machine

Instruction Format: Label = (X <-Y,A,B)
Label:
X=Y If X<4:
Goto B Else
X-=4 Goto A

· "Decrement-Branch-IfNegative"
· Turing complete (!) · ""Computer Architecture:
A Minimalist Perspective" by Gilreath and Laplathe (~$200)
· Or Wikipedia :)

Wednesday, April 10, 13

Implementation sketch:
· If EIP of a handler is pointed at invalid memory, we get another page fault immediately; keep EIP invalid in all tasks
· Var Decrement: use TSS' SP, pushing the stack decrements SP by 4.
· Branch: <4 or not? Implemented by double fault when SP cannot be decremented
Wednesday, April 10, 13

Dramatis Personae I
· One GDT to rule them all · One TSS Descriptor per instruction,
aligned with the end of a page
· IDT is mapped differently, per instruction · A target (branch-not-taken) in Int 14, #PF · B target (branch taken) in Int 8, #DF
Wednesday, April 10, 13

Dramatis Personae II
· Higher half of TSS (variables) · Map A.Y, B.Y (the value we want to load
for next instruction) at their TSS addresses
· map X (the value we want to write) at the addr of the current task
· So we have the move and decrement
Wednesday, April 10, 13

· We split these TSS across a page boundary
· Variables are stack pointer entries in a TSS
· Upper Page: ESP and segments
· Lower Page: EAX, ECX, EIP, CR3 (page tables)
Labels:A, B, C, ...
Wednesday, April 10, 13

Wednesday, April 10, 13

Let's step through an instruction
(Some details glossed over; think of it as a fairy tale, not a lie)
Wednesday, April 10, 13

Instruction by the numbers (or, "PFLA fetch-decode-execute" loop)

Label:
X=Y If X<4:
Goto B Else
X-=4 Goto A

#PF/DF: "rising edge" of a clock tick
Saving old TSS state Loading new TSS state Attempt to save fault info to stack
(decrement ESP, write info to stack)
Failure: #DF (decr ESP is invalid) Success: (decr ESP, write info)
First instruction of new task:
causes #PF (new EIP is invalid, too)

Wednesday, April 10, 13

CPU EIP:FFFF FFFF SP:FFFF 0000
TR: 0xF8
IDT
#DF 8: Task 0x1F8 B
#PF 14: Task 0x1F8
A
Wednesday, April 10, 13

GDT
0F8: Task, Busy
1F8: Task, Available

TSS 0 EIP,EAX, etc
X SP:0x1000

Initial State

TSS 1

EIP,EAX, etc

Y

SP:0x4

CPU EIP:FFFF FFFF SP:FFFF 0000
TR: 0xF8
IDT

GDT
0F8: Task, Busy
1F8: Task, Available

TSS 0 EIP,EAX, etc
X SP:0x1000

#DF 8: Task 0x1F8 B
#PF 14: Task 0x1F8
A

TSS 1 EIP,EAX, etc

Wednesday, April 10, 13

Y
EIP causes Pagefault

SP:0x4

CPU EIP:FFFF FFFF SP:FFFF 0000
TR: 0xF8
IDT

GDT
0F8: Task, Busy
1F8: Task, Available

TSS 0 EIP,EAX, etc
X SP:FFFF 0000

#DF 8: Task 0x1F8 B
#PF 14: Task 0x1F8
A

TSS 1 EIP,EAX, etc

Wednesday, April 10, 13

Y

SP:0x4

CPU state is saved to current task

CPU EIP:FFFF FFFF
SP:0x4 TR: 0x1F8
IDT

GDT
0F8: Task, Busy
1F8: Task, Busy

TSS 0 EIP,EAX, etc
X SP:FFFF 0000

#DF 8: Task 0x1F8 B
#PF 14: Task 0x1F8
A

TSS 1 EIP,EAX, etc

Wednesday, April 10, 13

Y

SP:0x4

CPU loads interrupt task

CPU EIP:FFFF FFFF
SP:0x4 TR: 0x1F8
IDT
#DF 8: Task 0x0F8 B
#PF 14: Task 0x1F8
A

GDT
0F8: Task, Busy
1F8: Task, Busy
(duplicate)

New page tables point to new things!

Wednesday, April 10, 13

TSS 0 EIP,EAX, etc
A.Y SP:FFFF 0000
TSS 2 EIP,EAX, etc
X
SP:1234 5678

"Implementation Problem"
Wednesday, April 10, 13

1 bit(ch) of a bit(ch)
CPU won't load task if this is set
Wednesday, April 10, 13

1 bit(ch) of a bit(ch)
CPU won't load task if this is set
We need to overwrite it. Luckily, the CPU always saves all the state (even if not dirty).
So: map the lower half of TSS over GDT, so that saved EAX,ECX from TSS overwrite descriptor;
same content, only busy bit cleared.
Wednesday, April 10, 13

Dealing with that bit needs a nuclear option...
Wednesday, April 10, 13

CPU EIP:FFFF FFFF
SP:0x4 TR: 0x1F8
IDT

GDT
0F8: Task, Available
1F8: Task, Available

TSS 0 EIP,EAX, etc FFFF 0000

#DF 8: Task 0x0F8 B

TSS 2

#PF 14: Task 0x1F8

A Lower half of TSS is

EIP,EAX, etc

mapped over GDT descriptor

=>

SP:1234 5678

saving the old state overwrites

the GDT entry busy bit!

Wednesday, April 10, 13

CPU EIP:FFFF FFFF
SP:0x0 TR: 0x1F8
IDT

GDT
0F8: Task, Available
1F8: Task, Available

TSS 0 EIP,EAX, etc FFFF 0000

#DF 8: Task 0x0F8 B
#PF 14: Task 0x1F8
A
#PF error code is pushed: Decrements ESP

TSS 2 EIP,EAX, etc SP: 1234 5678

Wednesday, April 10, 13

CPU EIP:FFFF FFFF
SP:0x0 TR: 0x1F8
IDT

GDT
0F8: Task, Available
1F8: Task, Busy

#DF 8: Task 0x0F8 B

#PF 14: Task

0x1F8

A

Another Page Fault, Saves state

Wednesday, April 10, 13

TSS 0 EIP,EAX, etc FFFF 0000
TSS 2 EIP,EAX, etc SP: 1234 5678

CPU EIP:FFFF FFFF
SP:0x0 TR: 0x0F8
IDT

GDT
0F8: Task, Busy
1F8: Task, Available

#DF 8: Task 0x0F8 B
#PF 14: Task 0x1F8
A

But we can't push, So #DF

Wednesday, April 10, 13

TSS 0 EIP,EAX, etc FFFF 0000
TSS 2 EIP,EAX, etc
SP: 0

CPU EIP:FFFF FFFF SP:FFFF 0000
TR: 0x0F8
IDT

GDT
0F8: Task, Available
1F8: Task, Available

TSS 0 EIP,EAX, etc FFFF 0000

#DF 8: Task 0x0F8 B
#PF 14: Task 0x1F8
A
Loaded new state from #DF

TSS 2 EIP,EAX, etc
SP: 0

Wednesday, April 10, 13

And now to face the uglier truth...
Wednesday, April 10, 13

CPU EIP:FFFF FFFF
SP:0x4 TR: 0x1F8
IDT

GDT
0F8: Task, Busy
1F8: Task, Busy
2F8: Task, available

TSS 0 EIP,EAX, etc SP:FFFF 0000

8: Task 0x0F8

14: Task 0x2F8
IDT trick must take care of task switch logic checking TR contents => must duplicate GDT descriptors

TSS 2 EIP,EAX, etc SP:1234 5678

Wednesday, April 10, 13

Meanwhile, on the FSB

(Slightly redacted)

Write 0x8 Read 0x1008 Write 0x2008
Read 0x8

0xFFFF 0000 0x4 0x0
0xFFFF 0000

And they all compute happily ever after (for all we know)
Wednesday, April 10, 13

What restrictions do we have?
· Needs kernel access to set up :) · No two double faults in a row · Can only use our one awkward instruction · Can only work with SP of TSS aligned
across page (very limited coverage of phys. mem)
Wednesday, April 10, 13

Wednesday, April 10, 13

White Hat Takeaway
· Check how your tools handle old/unused CPU features
· Don't trust the spec
Wednesday, April 10, 13

Black Hat Takeaway
· A really nice, big Redpill · With more work, you can probably make it
work differently in Analysis tools
· Or just shoot down the host
Wednesday, April 10, 13

Strawhat Takeaway
· It's a weird machine! (And we like them) · We are working on 64 bit, better tools · Compiler, debugger · See how it works on different hardware?
Wednesday, April 10, 13

"There is never enough time. Thank you for yours!"
--Dan Geer
Wednesday, April 10, 13

"I have a dream"
· of a world where a hacker isn't judged by the color of his hat, but the weirdness of his machine
· of a world where a single step in can change your world completely
· of a world where we strive to understand what dragons sleep in seemingly innocent systems
Wednesday, April 10, 13

