2 / 32

Who we are
 Dongwoo Kim : Hyeon-jeong Lee's Husband
· Ph.D. Candidate at Chungnam National University in South Korea
· Majoring in Computer Communications & Security · Interested in mobile hacking, digital forensics
 Sangwho Kim : Hye-ji Heo's Boyfriend
· Master's course at the same school · Interested in mobile hacking, vulnerability analysis
3 / 32

Our purpose
 We want to find remote code execution vulnerabilities of real-world Android apps.
 Our targets are apps that consume file data like office file browser.
 We're especially interested in their native libraries that can cause crashes. 
 It's not a big deal to make targets get crashed using simple fuzzing.
 The problem is that it's a very time-consuming task to analyze crashes to determine exploitability. 
4 / 32

How to determine exploitability

 We have to MANUALLY figure out that the operand at crash point is affected by the user input.

User Input Data

LDR R4, [R5, #20]

... ...

LDR R2, [R4, #4]
Crash
LDR R1, [R2]
LDR R3, [R1] BL R3

Shellcode

5 / 32

Our goal

1 / 2

 We need something that can let us know whether the operand is affected by the input in an automated manner. (Time is precious!)
 We tried to take advantage of any tools for it.
 However, there is nothing that we can use for our purpose on ARM architecture.
 We have decided to write our own tools using taint analysis based on dynamic binary instrumentation.

6 / 32

Our goal

2 / 2

 Our tools should be easy to use on both Android emulator and device for practical use.
 We want our tools to answer the following questions.

Q. Operand at crash point is affected by input? A. Yes or No! Q. If yes, where is exactly coming from? A. Offset 0x1004 in the input file

7 / 32

VDT (Visual Data Tracer)

1 / 3

 5SJBHJOH#VHTXJUI%ZOBNJD%BUBGMPX"OBMZTJT
presented by Julio Auto at Source 2009 conference
 For crash analysis of user level applications on Windows OS (x86)
 Using taint analysis to determine exploitability

Input data
Crash Point

 Leave trace log
 Backward taint analysis using the trace log

8 / 32

VDT (Visual Data Tracer)

2 / 3

 VDT-Tracer : Leave trace log (Extension of WinDBG)

trace.log 9 / 32

VDT (Visual Data Tracer)
 VDT-GUI : Backward taint analysis

3 / 3

 Instruction chain engaged in data flow

10 / 32

TREE (Tainted-enabled Reverse Engineering Environment) 1 / 2
 %ZOBNJD"OBMZTJTBOE%FCVHHJOHPG#JOBSZ$PEFGPS 4FDVSJUZ"QQMJDBUJPOT by Lixin Li and Chao Wang in
2013  For crash analysis of user level applications on
various architectures based on debugging feature of IDA Pro  Using taint analysis to determine exploitability.
11 / 32

TREE (Tainted-enabled Reverse Engineering Environment) 2 / 2

TREE-Tracer

IDA Pro

TREE-Analyzer

TREE-Visualizer

Trace_log.idb

12 / 32

Type of DBI (Dynamic Binary Instrumentation)

DBI Tool Target

DBI Tool

Target

vs.

Attach

Type - Same process

- Separate process  Our choice!

Pros

- OS support NOT required - Appropriate for crash analysis
(Low overhead)

Cons

- NOT appropriate for crash analysis

- OS support required (High overhead)

13 / 32

Overview of our tools

trace.log

 ARM-Tracer (Online)
- CLI Interface - Working on 32bit ARM-based Linux
(Android emulator and real device) - Extracting context of every instruction
until the target gets crashed

 ARM-Analyzer (Offline)
- GUI Interface - Working on Desktop for efficiency - Parsing trace.log and show the list
of executed instructions - Allowing a user to choose an object
for backward taint analysis

14 / 32

Challenges in ARM-Tracer
 No hardware support for single-stepping whereas Intel x86 provides it known for trap flag. · We can implement it with DBM (Debug Breakpoint Mechanism).
 It requires various considerations which are not necessary in x86.
· Such as calculating Next PC, handling signals in multithreaded environment, handling atomic instruction sequence.
15 / 32

Challenges in ARM-Analyzer
 Not a simple task to identify semantic of ARM instructions in terms of data propagation, and distinguish their syntax.
 SIMD (Single Instruction Multiple Data) instruction set is very annoying!
 SIMD is for multimedia like SSE (Streaming SIMD Extensions) in x86 which has its own register bank that size is 256 bytes in total.
16 / 32

ARM-Tracer
 Instruction tracing with DBM
· single-stepping using QUSBDF system call
· Breakpoint instruction differentiate according to the instruction state

1 / 8

[Step 1] Determine Next PC
0x1004 01 10 C0 24 0x1008 01 00 BD E8 0x100C 1E FF 2F E1

[Step 2] Set BP
0x1004 01 10 C0 24 0x1008 "Breakpoint" 0x100C 1E FF 2F E1

[Step 3] Restore Instr.
0x1004 01 10 C0 24 0x1008 01 00 BD E8
0x100C 1E FF 2F E1

1. Analyze current instr. 0x1004 01 10 C0 24
2. Determine Next PC Next PC = 0x1008

3. Backup instr. at Next PC 0x1008 01 00 BD E8
4. Set BP at Next PC 0x1008 "Breakpoint"

5. Execute 0x1004 01 10 C0 24
6. Restore Instr. 0x1008 01 00 BD E8

17 / 32

ARM-Tracer

 Instruction state

State ARM state
Thumb state

Instruction ARM instruction Thumb instruction Thumb2 instruction

Size 32 16 16/32

2 / 8

 Instruction state change (interworking) can happen by BX/BLX instructions.

18 / 32

ARM-Tracer

3 / 8

 Considerations on calculating Next PC
· We have to identify opcode of instructions according to instruction state. (based on GDB)

ARM (32bit)
BLX #Offset BLX <Reg> BX <Reg> LDR PC, [<Reg>] LDM <Reg>, {(RegList,) PC} B #Offset BL #Offset

Thumb (16bit)
POP {(RegList,) PC} B #Offset BX <Reg> BLX <Reg> MOV PC, <Reg> CBZ <Reg>, #Offset CBNZ <Reg>, #Offset

Thumb2 (16/32bit)
B #Offset BL #Offset BLX #Offset SUBS PC, LR, #Offset LDMIA <Reg>, {(RegList)} LDMDB <Reg>, {(RegList)} RFEIA <Reg> RFEDB <Reg> MOV PC, <Reg> LDR PC, [<Reg>] TBB [<RegA>, <RegB>] TBH [<RegA>, <RegB>]

19 / 32

ARM-Tracer
 Addressing interference by other threads
· Caused by code sharing

4 / 8

Thread Thread Thread

Target Thread

Thread Thread Thread

Target Thread

Breakpoint

Breakpoint

· We have to guarantee all the threads run properly.

20 / 32

ARM-Tracer

5 / 8

 Handling instruction sequence for atomic operation

· ARM does not provide atomic instruction.
· Instead, it provides sequence for it. (LDREX/STREX)
· We should not intervene the sequence otherwise, it may cause infinite loop. 

infinite loop

21 / 32

ARM-Tracer

6 / 8

 The "good" starting point
 We designate a specific thread as the target thread which opens the input file.
 We can know memory address where the input file is loaded by checking PQFO and SFBE functions.

Target starts

Target crashes!

Input file is loaded!
(We start tracing here. )

22 / 32

ARM-Tracer

7 / 8

 Before logging, filter out instructions not executed (ARM)

[ CPSR ]

[ ARM Instruction ]

23 / 32

ARM-Tracer

8 / 8

 Before logging, filter out instructions not executed (Thumb2)

[ CPSR ]

[ Thumb2 ­ IT Instruction ]

24 / 32

ARM-Analyzer
 Parsing each entry from the trace log file
· Identify instruction syntax based on disassembly · Identify object : register, memory address (byte level)

1 / 3

25 / 32

ARM-Analyzer

2 / 3

 Classification of instructions

· ARM Architecture Reference Manual ARMv7-A Edition

Group Memory access General data processing
Multiply Saturating
Parallel Packing and unpacking
Branch and control Coprocessor Total

Mnemonic 16 32 25 6 4 10 10 14 117

Target 8 27 22 6 4 10 0 0 77

Syntax 39 37 22 6 4 10 0 0 118

Impl. 54 70 28 10 5 28 0 0 195

· We have also considered some SIMD instructions (vld, vst).

26 / 32

ARM-Analyzer
 How it works ­ Backward taint analysis
 View for user

3 / 3

 Inside of ARM-Analyzer
 

Crash

Dst : r6 / Src : r0 Dst : r3 / Src : r1, *0x2224 Dst : r5 / Src : r1 Dst : r4 / Src : r0 Dst : r0 / Src : r1 Dst : r1 / Src : r6 Dst : r3 / Src : r3, *0x1018

Queue
Enqueue "r3"

27 / 32

Experiment

1 / 3

 We generated crashes against Polaris Office 6.0.1.  Among them, we chose 7 crashes that look cool!  Such as..

LDR R3, [R3, #0x18]

Crash

BLX R3 

 Let's try to put them into our tools!

28 / 32

Experiment

2 / 3

 Tested on GalasxyS4
 2.3 GHz Quad-core, 2GB RAM, Android 4.4.2, Kernel 3.4.0

ARM-Tracer Crash 1 Crash 2 Crash 3 Crash 4

Crash 5

Crash 6

Crash 7

# of instructions
executed
# of instructions filtered out

6,804,072 6,830,983 7,008,764 7,048,261 10,000,000+ 10,000,000+ 10,000,000+

585,093 584,841 601,177 607,208 900,000+

900,000+

900,000+

# of atomic handler

2,600

2,600

2,662

2,630

3,800+

3,800+

3,800+

Taken time (sec)

1,563

1,562

1,616

1,673

2,300+

2,300+

2,300+

Dump file size (MB)

1,038

1,042

1,069

1,075

1,500+

1,500+

1,500+

29 / 32

Experiment

 Tested on Desktop
 3.3 GHz Quad-core, 16GB RAM, Windows 7

ARM-Analyzer

Probably Exploitable

# of instructions executed

Taken time to full scan

Fast Mode Normal Mode

Crash 1
X
6,804,072

Crash 2

Crash 3

O

X

6,830,983 7,008,764

10 ~ 15 sec A couple of days..... 

3 / 3
Crash 4
O
7,048,261

 Fast Mode enqueues only effective address of source into the search queue.
 ex) L D R R 1 , [ R 2 , R 3 ]  * ( R 2 + R 3 ) / / 0 x 1 0 0 4
0x1000 0x4

30 / 32

31 / 32

 We have developed tools for crash analysis of userlevel applications on ARM architecture.
 It can avoid non-deterministic behavior.  We can efficiently analyze crashes in a limited time.
 We have tested it with real-world app on Android device.
 As a result, we got two exploitable crashes after short testing our tools with crash samples that we have already generated.
 Before long, we're going to release our tools with source code after some revisions for those who are interested in them.
 Please participate in improving our tools.
32 / 32

