Breaking the x86 ISA
{ domas / @xoreaxeaxeax / Black Hat 2017

 Christopher Domas
 Cyber Security Researcher @ Battelle Memorial Institute
./bio

 8086: 1978  A long, tortured history...
The x86 ISA

 Modes:
 Real mode
 & "unreal" mode
 Protected mode  Virtual 8086  System Management Mode  Long mode
 Compatibility mode
x86: evolution

 Instruction set extensions

 X87  IA-32, X86-64  MMX, 3DNow!  SSE, SSE2, SSE3,SSSE3,
SSE4, SSE4.2, SSE5  AES-NI, CLMUL,
RdRand, SHA  MPX, SGX

 XOP, F16C  ADX  BMI  FMA  AVX, AVX2, AVX512  VT-x, AMD-V  TSX, ASF

x86: evolution

 Modern x86 chips are a complex labyrinth of new and ancient technologies.
 Things get lost...
 8086: 29,000 transistors  Pentium: 3,000,000 transistors  Broadwell: 3,200,000,000 transistors
x86: evolution

 We don't trust software.
 We audit it  We reverse it  We break it  We sandbox it
Trust.

 But the processor itself?
 We blindly trust
Trust.

 Why?
 Hardware has all the same problems as software
 Secret functionality?
 Appendix H.
 Bugs?
 F00F, FDIV, TSX, Hyperthreading, Ryzen
 Vulnerabilities?
 SYSRET, cache poisoning, sinkhole
Trust.

 We should stop blindly trusting our hardware.
Trust.

 What do we need to worry about?

 Well known from software
 ProFTPD
 if (strcmp(target, "ACIDBITCHEZ") == 0) { setuid(0); setgid(0); system("/bin/sh;/sbin/sh"); }
 Borland Interbase
 politically:correct
 Linux kernel
 if ((options == (__WCLONE|__WALL)) && (current->uid = 0)) retval = -EINVAL;
 Juniper Netscreen firewalls
 "<<< %s(un='%s') = %u"
Backdoors

 Hardware
 FPGAs
 Actel/Microsemi ProASIC3
 Hypervisors
 mov eax, 564D5868h / mov dx, 5658h / out dx, eax
 Supply chain
 "A2" - Single gate backdoor added during fabrication
 Microcode
 ???
Backdoors

 Could a hidden instruction unlock your CPU?
Hidden instructions

 Historical examples
 ICEBP (f1)  LOADALL (0f07)  apicall (0ffff0)
Hidden instructions

So... what's this??

 Traditional approaches:
 Leaked documentation  Reverse engineering software  NDA
 But what if it's something stealthy?
Hidden instructions

 Find out what's really there
Goal: Audit the Processor

 How to find hidden instructions?
The challenge

 Instructions can be one byte ...
 inc eax  40
 ... or 15 bytes ...
 lock add qword cs:[eax + 4 * eax + 07e06df23h], 0efcdab89h  2e 67 f0 48 818480 23df067e 89abcdef
 Somewhere on the order of
1,329,227,995,784,915,872,903,807,060,280,344,576
possible instructions
The challenge
https://code.google.com/archive/p/corkami/wikis/x86oddities.wiki

 The obvious approaches don't work:
 Try them all?
 Only works for RISC
 Try random instructions?
 Exceptionally poor coverage
 Guided based on documentation?
 Documentation can't be trusted (that's the point)  Poor coverage of gaps in the search space
The challenge

 Goal:
 Quickly skip over bytes that don't matter
The challenge

 mov rax, 0x01337COFFEEC0DE5  48 B8 E5 0D EC FE 0F 7C 33 01  Fuzz the whole thing?
 Spend majority of time on meaningless constant  Will never be able to search the entire space
 Fuzz just the beginning bytes?
The challenge

 lock lock lock lock lock lock lock lock inc dword [rax]  F0 F0 F0 F0 F0 F0 F0 F0 FF 00  Fuzz the whole thing?
 Spend majority of time on superfluous prefixes  Will never be able to search the entire space
 How do we proceed?
The challenge

 Observation:
 The meaningful bytes of an x86 instruction impact either its length or its exception behavior
The challenge

 A depth-first-search algorithm
Tunneling

 Guess an instruction: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Execute the instruction: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Observe its length: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Increment the last byte: 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Execute the instruction: 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Observe its length: 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Increment the last byte: 00 02 00 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Execute the instruction: 00 02 00 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Observe its length: 00 02 00 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Increment the last byte: 00 03 00 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Execute the instruction: 00 04 00 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Observe its length: 00 04 00 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Increment the last byte: 00 04 01 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Execute the instruction: 00 04 01 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Observe its length: 00 04 01 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Increment the last byte: 00 04 02 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

000000000000000000000000000000 000100000000000000000000000000 000200000000000000000000000000 000300000000000000000000000000 000400000000000000000000000000 000401000000000000000000000000 000402000000000000000000000000 000403000000000000000000000000 000404000000000000000000000000 000405000000000000000000000000 000405000000010000000000000000 000405000000020000000000000000 000405000000030000000000000000 000405000000040000000000000000

 When the last byte is FF... C7 04 05 00 00 00 00 00 00 00 FF 00 00 00 00
Tunneling

 ... roll over ... C7 04 05 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 ... and move to the previous byte C7 04 05 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 This byte becomes the marker C7 04 05 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 Increment the marker C7 04 05 00 00 00 00 00 00 01 00 00 00 00 00
Tunneling

 Execute the instruction C7 04 05 00 00 00 00 00 00 01 00 00 00 00 00
Tunneling

 Observe its length C7 04 05 00 00 00 00 00 00 01 00 00 00 00 00
Tunneling

 If the length has not changed... C7 04 05 00 00 00 00 00 00 01 00 00 00 00 00
Tunneling

 Increment the marker C7 04 05 00 00 00 00 00 00 02 00 00 00 00 00
Tunneling

 And repeat. C7 04 05 00 00 00 00 00 00 02 00 00 00 00 00
Tunneling

 Continue the process... C7 04 05 00 00 00 00 00 00 FF 00 00 00 00 00
Tunneling

 ... moving back on each rollover C7 04 05 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 ... moving back on each rollover C7 04 05 00 00 00 00 00 FF 00 00 00 00 00 00
Tunneling

 ... moving back on each rollover C7 04 05 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

... C7 04 05 00 00 00 00 FF 00 00 00 00 00 00 00
Tunneling

... C7 04 05 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

... C7 04 05 00 00 00 FF 00 00 00 00 00 00 00 00
Tunneling

... C7 04 05 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

... C7 04 05 00 00 FF 00 00 00 00 00 00 00 00 00
Tunneling

... C7 04 05 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

... C7 04 05 00 FF 00 00 00 00 00 00 00 00 00 00
Tunneling

... C7 04 05 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

... C7 04 05 FF 00 00 00 00 00 00 00 00 00 00 00
Tunneling

... C7 04 05 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 When you increment a marker... C7 04 06 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 ... execute the instruction ... C7 04 06 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 ... and the length changes ... C7 04 06 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 ... move the marker to the end of the new instruction ...
C7 04 06 00 00 00 00 00 00 00 00 00 00 00 00
Tunneling

 ... and resume the process. C7 04 06 00 00 00 01 00 00 00 00 00 00 00 00
Tunneling

 Tunneling through the instruction space lets us quickly skip over the bytes
that don't matter,
and exhaustively search the bytes that do...
Tunneling

 ... reducing the search space from 1.3x1036 instructions to ~100,000,000 (one day of
scanning)
Tunneling

 Catch: requires knowing the instruction length
Instruction lengths

 Simple approach: trap flag
 Fails to resolve the length of faulting instructions  Necessary to search privileged instructions:
 ring 0 only: mov cr0, eax  ring -1 only: vmenter  ring -2 only: rsm
 It's hard to even auto-generate a successfully executing ring 3 instruction:
 mov eax, [random_number]
Instruction lengths

 Solution: page fault analysis
Instruction lengths

 Choose a candidate instruction
 (we don't know how long this instruction is)
0F 6A 60 6A 79 6D C6 02 6E AA D2 39 0B B7 52
Page fault analysis

 Configure two consecutive pages in memory
 The first with read, write, and execute permissions  The second with read, write permissions only
Page fault analysis

 Place the candidate instruction in memory
 Place the first byte at the end of the first page  Place the remaining bytes at the start of the second
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 Execute (jump to) the instruction.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 The processor's instruction decoder checks the first byte of the instruction.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 If the decoder determines that another byte is necessary, it attempts to fetch it.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 This byte is on a non-executable page, so the processor generates a page fault.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 The #PF exception provides a fault address in the CR2 register.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 If we receive a #PF, with CR2 set to the address of the second page, we know the instruction continues.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 Move the instruction back one byte.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 Execute the instruction.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 The processor's instruction decoder checks the first byte of the instruction.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 If the decoder determines that another byte is necessary, it attempts to fetch it.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 Since this byte is in an executable page, decoding continues.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 If the decoder determines that another byte is necessary, it attempts to fetch it.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 This byte is on a non-executable page, so the processor generates a page fault.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 Move the instruction back one byte.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 Execute the instruction.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 Continue the process while we receive #PF exceptions with CR2 = second page address
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 Move the instruction back one byte.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 Execute.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 Eventually, the entire instruction will reside in the executable page.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 The instruction could run.  The instruction could throw a different fault.  The instruction could throw a #PF,
but with a different CR2.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 In all cases, we know the instruction has been successfully decoded, so must reside entirely in the executable page.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 With this, we know the instruction's length.
0F 6A 60 6A 79 6D C6 02 ...
Page fault analysis

 We now know how many bytes the instruction decoder consumed
 But just because the bytes were decoded does not mean the instruction exists
 If the instruction does not exist, the processor generates the #UD exception after the instruction decode (invalid opcode exception)
Page fault analysis

 If we don't receive a #UD, the instruction exists.
Page fault analysis

 Resolves lengths for:
 Successfully executing instructions  Faulting instructions  Privileged instructions:
 ring 0 only: mov cr0, eax  ring -1 only: vmenter  ring -2 only: rsm
Page fault analysis

 We can even resolve
the lengths of instructions that don't exist.
Page fault analysis

 Example:
 0f 7a ac cb 8b 97 e4 4d  Group 0f 7a does not exist
(receive #UD for this entire group)  But the decoder fetched 8 bytes to decode it
 Provides insight into the pipelining architecture  Allows exploration of future instructions
Page fault analysis

 The "injector" process performs the page fault analysis and tunneling instruction generation
The Injector

 We're fuzzing the same device that we're running on
 How do we make sure we don't crash?
Surviving

 Step 1:
 Limit ourselves to ring 3  We can still resolve instructions
living in deeper rings  This prevents accidental total system failure
(except in the case of serious processor bugs)
Surviving

 Step 2:
 Hook all exceptions the instruction might generate  In Linux:
 SIGSEGV  SIGILL  SIGFPE  SIGBUS  SIGTRAP
 Process will clean up after itself when possible
Surviving

 Step 3:
 Initialize general purpose registers to 0  Arbitrary memory write instructions like
add [eax + 4 * ecx], 0x9102 will not hit the injecting process's address space  Map address 0 into the injector's address space
 Requires su in Linux  Not strictly necessary,
but allows finer grain fault resolution
Surviving

 Step 3 (continued):
 Memory calculations using an offset: add [eax + 4 * ecx + 0xf98102cd6], 0x9102
would still result in non-zero accesses  Could lead to process corruption
if the offset falls into the injector's address space
Surviving

 Step 3 (continued):
 The tunneling approach ensures offsets are constrained
 0x0000002F  0x0000A900  0x00420000  0x1E000000
 The tunneled offsets will not fall into the injector's address space
 They will seg fault, but seg faults are caught  The process still won't corrupt itself
Surviving

 We've handled faulting instructions  What about non-faulting instructions?
 The analysis needs to continue after an instruction executes
 E.g. jmp $-0x39
Surviving

 Set the trap flag prior to executing the candidate instruction
 Allows us to catch branches, etc.  Allows determining execution results
 If we receive a #DB (trap) exception, we know the instruction successfully executed
 Reload the registers to a known state
Surviving

 With these...
 Ring 3  Exception handling  Register initialization  Register maintenance  Execution trapping
 ... the injector survives.
Surviving

 So we now have a way to search the
instructions space.
 How do we make sense
of the instructions we execute?
Analysis

 The "sifter" process parses the executions from the injector, and pulls out the anomalies
The Sifter

 We need a "ground truth"  Use a disassembler
 It was written based on the documentation  Capstone
Sifting

 Compare:
 Observed length of instruction vs. disassembled length of instruction
 Signal generated by instruction vs. expected signal
Sifting

 Undocumented instruction:
 Disassembler doesn't recognize byte sequence and ...  Instruction generates anything but a #UD
 Software bug:
 Disassembler recognizes instruction but ...  Processor says the length is different
 Hardware bug:
 ???  No consistent heuristic, investigate when something fails
Sifting

sandsifter - demo

(sandsifter)

(summarizer)

 We now have a way to systematically scan our processor for secrets and bugs
Scanning

 I scanned eight systems in my test library.
Scanning

 Hidden instructions  Ubiquitous software bugs  Hypervisor flaws  Hardware bugs
Results

Hidden instructions

 Scanned: Intel Core i7-4650U CPU
Intel hidden instructions

 0f0dxx
 Undocumented for non-/1 reg fields
 0f18xx, 0f{1a-1f}xx
 Undocumented until December 2016
 0fae{e9-ef, f1-f7, f9-ff}
 Undocumented for non-0 r/m fields until June 2014
Intel hidden instructions

 dbe0, dbe1  df{c0-c7}  f1  {c0-c1}{30-37, 70-77, b0-b7, f0-f7}  {d0-d1}{30-37, 70-77, b0-b7, f0-f7}  {d2-d3}{30-37, 70-77, b0-b7, f0-f7}  f6 /1, f7 /1
Intel hidden instructions

 Scanned: AMD Athlon (Geode NX1500)
AMD hidden instructions

 0f0f{40-7f}{80-ff}{xx}
 Undocumented for range of xx
 dbe0, dbe1  df{c0-c7}
AMD hidden instructions

 Scanned: VIA Nano U3500, VIA C7-M
VIA hidden instructions

 0f0dxx
 Undocumented by Intel for non-/1 reg fields
 0f18xx, 0f{1a-1f}xx
 Undocumented by Intel until December 2016
 0fa7{c1-c7}  0fae{e9-ef, f1-f7, f9-ff}
 Undocumented by Intel for non-0 r/m fields until June 2014
 dbe0, dbe1  df{c0-c7}
VIA hidden instructions

 There are actually more than this
 But our disassembler recognizes many undocumented instructions
 If recognized by the disassembler, sandsifter cannot identify them as anomalies
Hidden instructions

 What do these do?
 Some have been reverse engineered  Some have no record at all.
Hidden instructions

Software bugs

 Issue:
 The sifter is forced to use a disassembler as its "ground truth"
 Every disassembler we tried as the "ground truth" was littered with bugs.
Software bugs

 Most bugs only appear in a few tools, and are not especially interesting
 Some bugs appeared in all tools
 These can be used to an attacker's advantage.
Software bugs

 66e9xxxxxxxx (jmp)  66e8xxxxxxxx (call)
Software bugs

 66e9xxxxxxxx (jmp)  66e8xxxxxxxx (call)
 In x86_64  Theoretically, a jmp (e9) or call (e8),
with a data size override prefix (66)
 Changes operand size from default of 32
 Does that mean 16 bit or 64 bit?  Neither. 66 is ignored by the processor here.
Software bugs

 Everyone parses this wrong.
Software bugs

 Demo:
 IDA  Visual Studio
Software bugs

Software bugs (IDA)

Software bugs (VS)

 Everyone misinterprets either:
 The target of the jump
 Truncates the instruction pointer to 16 bits
 The size of the operand
 Reading the instruction as 4 bytes instead of 6
 Or (often) both of these
Software bugs

 An attacker can use this to mask malicious behavior
 Throw off disassembly and jump targets to cause analysis tools to miss the real behavior
Software bugs

 Demo:
 objdump/gdb  QEMU
Software bugs

Software bugs (objdump)

Software bugs (QEMU)

 66 jmp  Why does everyone get this wrong?
 AMD designed the 64 bit architecture,  Intel adopted... most of it.
 AMD: override changes operand to 16 bits, instruction pointer truncated
 Intel: override ignored.
Software bugs

 Issues when we can't agree on a standard
 sysret bugs
 Either Intel or AMD is going to be vulnerable when there is a difference
 Impractically complex architecture
 Tools cannot parse a jump instruction
Software bugs

 Opcode 82
 Disassemblers don't recognize this instruction
 (objdump, Capstone, GDB, ndisasm, etc.)
 ... even though it's documented by both Intel and AMD  Synonym for opcode 80
 add, or, and, xor, cmp, sub, ...
 Opcode 82 lets us do computation invisible to a disassembler.
Software bugs

Hypervisor bugs

 In an Azure instance, the trap flag is missed on the cpuid instruction
 (cpuid causes a vmexit, and the hypervisor forgets to emulate the trap)
Azure hypervisor bugs

Azure hypervisor bugs

Hardware bugs

 Hardware bugs are troubling
 A bug in hardware means you now have the same bug in all of your software.
 Difficult to find  Difficult to fix
Hardware bugs

 Scanned:
 Quark, Pentium, Core i7
Intel hardware bugs

 f00f bug on Pentium (anti-climactic)
Intel hardware bugs

 Scanned:
 Geode NX1500, C-50
AMD hardware bugs

 f00f20c0 / f00f22c0
 lock mov cr0, eax / lock mov eax, cr0  Looks like a bug
(lock shouldn't execute on non-mem instruction)  Found buried in cpuid enumerations in AMD docs:
"LOCK MOV CR0 means MOV CR8"
AMD hardware bugs

 On several systems, receive a #UD exception prior to complete instruction fetch
 Per AMD specifications, this is incorrect.
 #PF during instruction fetch takes priority
 ... until ...
AMD hardware bugs

 Scanned:
 TM5700
Transmeta hardware bugs

 Instructions: 0f{71,72,73}xxxx  Can receive #MF exception during fetch  Example:
 Pending x87 FPU exception  psrad mm4, -0x50 (0f72e4b0)  #MF received after 0f72e4 fetched  Correct behavior: #PF on fetch,
last byte is still on invalid page
Transmeta hardware bugs

 Found on one processor...  An apparent "halt and catch fire" instruction
 Single malformed instruction in ring 3 locks the processor
 Tested on 2 Windows kernels, 3 Linux kernels  Kernel debugging, serial I/O,
interrupt analysis seem to confirm
 Unfortunately, not finished with responsible disclosure
 No detials available on chip, vendor, or instructions
(redacted) hardware bugs

ring 3 processor DoS: demo

 First such attack found in 20 years (since Pentium f00f)
(redacted) hardware bugs

 Significant security concern: processor DoS from unprivileged user
(redacted) hardware bugs

 Details (hopefully) released within the next month (stay tuned)
(redacted) hardware bugs

 Open sourced:
 The sandsifter scanning tool  github.com/xoreaxeaxeax/sandsifter
 Audit your processor, break disassemblers/emulators/hypervisors, halt and catch fire, etc.
Conclusions

 I've only scanned a few systems  This is a fraction of what I found on mine  Who knows what exists on yours
Conclusions

 Check your system
 Send us results if you can
Conclusions

 Don't blindly trust the specifications.
Conclusions

 Sandsifter lets us introspect the black box at the heart of our systems.
Conclusions

github.com/xoreaxeaxeax
 sandsifter
 M/o/Vfuscator  REpsych
 x86 0-day PoC
 Etc.
Feedback? Ideas?
domas
 @xoreaxeaxeax  xoreaxeaxeax@gmail.com

