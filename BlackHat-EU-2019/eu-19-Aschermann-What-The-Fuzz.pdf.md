What the Fuzz

Cornelius Aschermann
Researcher at Ruhr University Bochum Verification & Automated Bug Finding Security Consultant
@is_eqv github.com/eqv cornelius.aschermann@rub.de

Sergej Schumilo
Researcher at Ruhr University Bochum Automated Bug Finding & Everything Low Level Security Consultant
@ms_s3c github.com/schumilo sergej.schumilo@rub.de

Manual Analysis
(doesn't scale that well)

Verification

Verification

Fuzzers

Fuzzing

Fuzzing

Fuzzing

Fuzzers are dumb?

Demo

8 min

How do Fuzzer Work?

How do Fuzzer Work?

How do Fuzzer Work?

How do Fuzzer Work?
0 01 1

... ... ......

How do Fuzzer Work?
0 01 1

... ... ......

How do Fuzzer Work?
0 01 1

... ... ......

How do Fuzzer Work?
0 01 1

... ... ......

How do Fuzzer Work?

How do Fuzzer Work?
0 01 1

... ... ......

How do Fuzzer Work?
0 01 1

... ... ......

How do Fuzzer Work?
0 01 1

... ... ......

How do Fuzzer Work?

How do Fuzzer Work?
0 01 1

... ... ......

How do Fuzzer Work?
0 01 1

... ... ......

How do Fuzzer Work?

Fuzzers Artificial Intelligence for Testcase Generation

Key Takeaways:

Key Takeaways:

The Rest of this Talk

The Rest of this Talk Past Research

Goal

But as a Fuzzer

C

Pascal

Objective C

Haskell

x86 C++

Go

Rust

Ada

Delphi

D

Fortran nim

C

Pascal

Objective C

Haskell

x86 C++

Go

Rust

Ada

Delphi

D

Fortran nim

Ring 3 Ring 0
Ring -1 VMM
Kernel/UEFI Userland

Ring 3 Ring 0
Ring -1 VMM
Kernel/UEFI Userland

Nyx

Architecture
Coverage Inputs Fuzzer

Target

Architecture
Coverage Inputs Fuzzer

Target

Kernel

Userland

Architecture
Coverage Inputs Fuzzer

Target

Kernel

Userland

BOOM Architecture Coverage

Target

Kernel

Inputs

Fuzzer

Userland

Architecture
Coverage Inputs Fuzzer

Target

Kernel

Userland

Architecture
Coverage Inputs Fuzzer

Target

Kernel

VM

Userland

Architecture
Coverage Inputs Fuzzer

Target

Kernel

VM

Userland

Architecture
Coverage Inputs Fuzzer

BOTargOet M

Kernel

VM

Userland

Target in a VM:
+ Fault Tolerance

Target in a VM:
+ Fault Tolerance + Parallelization

Architecture

Coverage Inputs Fuzzer

Target VM

Architecture

Coverage Inputs Fuzzer

Target
Agent VM

Architecture

Coverage Inputs Fuzzer

Agent OS
Target VM VM

Key Takeaways:

Key Takeaways:

Architecture

Coverage Inputs Fuzzer

Agent OS
Target VM VM

Architecture

Coverage Inputs Fuzzer

Intel PT

Agent OS

Target VM VM

Intel Processor Trace
Intel PT Data
Taken Not Taken Target IP (0x1009) Target IP (0x1055)

Intel Processor Trace
Memory Dump
Intel PT Data
Taken Not Taken Target IP (0x1009) Target IP (0x1055)

Intel Processor Trace

Memory Dump
Intel PT Data
Taken Not Taken Target IP (0x1009) Target IP (0x1055)

Traces
0x1000 0x1004 0x1009 0x1055

Intel Processor Trace

Memory Dump
Intel PT Data
Taken Not Taken Target IP (0x1009) Target IP (0x1055)

Traces
0x1000 0x1004 0x1009 0x1055

Transitions
0x0000 -> 0x1000 0x1000 -> 0x1004 0x1004 -> 0x1009

Intel Processor Trace

Memory Dump
Intel PT Data
Taken Not Taken Target IP (0x1009) Target IP (0x1055)

Traces
0x1000 0x1004 0x1009 0x1055

Transitions
0x0000 -> 0x1000 0x1000 -> 0x1004 0x1004 -> 0x1009

Bitmap
10010010100101

Nyx - One Input
QEMU-PT
Nyx

Nyx - One Input
QEMU-PT
Nyx

Nyx - One Input
QEMU-PT
Nyx

Nyx - One Input
QEMU-PT
Nyx

Nyx - One Input
QEMU-PT
Nyx

Nyx - One Input
QEMU-PT
Nyx

Nyx - Performance

execs/s

4000 3000 2000 1000

Nyx

AFL laf-Intel

cxxfilt nm-new readelf size strings objdump as-new

Key Takeaways:

What if I told you ...

What if I told you We can be even faster!

~6000 Super Fast VM Reloads
times per second

Reset Device State
Flatten Qemu VMState Tree

A

B

C

D

E

A

B

C

DE

memcpy

Reset Memory
Dirty Page Logging
VM-Memory

Reset Memory
Dirty Page Logging
VM-Memory

Dirty Stack

Reset Memory
Dirty Page Logging
VM-Memory

Dirty Stack

Reset Memory
Dirty Page Logging
VM-Memory

Dirty Stack

Reset Hard Disk
Custom In-Memory Copy-On-Write
Block Device Layer
O(1) Reset

Performance
Test: gdiplus_test.exe

Performance
Test: gdiplus_test.exe
Just Spawing Processes ~80 execs/sec

Performance
Test: gdiplus_test.exe
Just Spawing Processes ~80 execs/sec
Spawn & File Write ~40 execs/sec

Performance
Test: gdiplus_test.exe
Just Spawing Processes ~80 execs/sec
Spawn & File Write ~40 execs/sec
Nyx w. Intel PT & File Writes & Full System Reloads ~145 execs/sec!!!

Performance
Test: gdiplus_test.exe
Just Spawing Processes ~80 execs/sec
Spawn & File Write ~40 execs/sec
Nyx w. Intel PT & File Writes & Full System Reloads ~145 execs/sec!!!
Faster than Lihght

Snapshots:
Avoid Startup Time

Snapshots:
Avoid Startup Time + Noise free

Snapshots:
Avoid Startup Time + Noise free + Statefulness

Bugs

Key Takeaways:

The Rest of this Talk
The Future of Fuzzing

Harnesses

Harnesses

Harnesses

Harnesses

Harnesses

Harnesses

Harnesses

Harnesses

Harnesses

Harnesses

Harnesses

Harnesses

Harnesses

Harnesses

Harnesses

Harnesses

Harnesses
OS
Server Main Process (uid: root)
IPC
Server Connection (uid: nobody)

Network

Harnesses
OS
Browser Process
IPC
Render Process

Network

Harnesses
OS
Database
Subprocess

IPC
Webserver

Network

Harnesses
Database Subprocess Webserver

Key Takeaways:
Improve
Usability

Interactive Targets

Interactive Targets
recv recv

Time
recv recv

Specify Test Scenarios
img = Data(0x00, 0x23, 0x54, ... ) mnt = mount(img); dat = ""; path = "/a" mnt.create_file(path, data); mnt.cwd(path); mnt.umount();

Specify Test Scenarios

img = Data(0x00, 0x23, 0x54, ... ) mnt = mount(img); dat = ""; path = "/a" mnt.create_file(path, data); mnt.cwd(path); mnt.umount();

Grammar Fuzzing?

Specify Test Scenarios
img = Data(0x00, 0x23, 0x54, ... ) mnt = mount(img); dat = ""; path = "/a" mnt.create_file(path, data); mnt.cwd(path); mnt.umount();

Mutated AFL-Style

Specify Test Scenarios

img = NtfsImg(headers, clusters, ...) mnt = mount(img); dat = ""; path = "/a" mnt.create_file(path, data); mnt.cwd(path); mnt.umount();

Structural Mutations

Specify Test Scenarios

img = Data(0x00, 0x23, 0x54, ... )

mnt = mount(img);

dat = "";

path = "/a"

mnt.create_file(path, data);

mnt.cwd(path);

mnt.umount();

Not reused

Interactive Targets
recv recv

Time
recv recv

Focus Mutations

Interactive Targets

Snapshot

recv recv

recv

Time
recv

Interactive Targets

Snapshot

recv recv

recv

Time
recv

recv recv

Interactive Targets

Snapshot

recv recv

recv

Time
recv

recv recv

recv recv

Interactive Targets

Snapshot

recv recv

recv

Time
recv

Up to 99%
of time saved!

recv recv recv recv

Interactive Targets
Kernel Testing meets
Feedback Fuzzing
[1] https://github.com/google/syzkaller

Interactive Targets
Network Protocol meets
Feedback Fuzzing

Interactive Targets
Webcrawler meets
Feedback Fuzzing

Key Takeaways:
We need
Bigger Guns

Key Takeaways:
We need
Better Specs

Using Fuzzers

Fuzzing

Fuzzing

Fuzzing

Fuzzing

Fuzzing

Fuzzing
Demo

Fuzzing
Create Analysis Tools that
Abstract away Inputs
From http://worrydream.com/LadderOfAbstraction/

Fuzzing
From http://worrydream.com/LadderOfAbstraction/

Fuzzing
From http://worrydream.com/LadderOfAbstraction/

Fuzzing

Debugger (gdb, olly, ... )

From http://worrydream.com/LadderOfAbstraction/

Fuzzing

Debugger (gdb, olly, ... )

From http://worrydream.com/LadderOfAbstraction/

Fuzzing

Debugger (gdb, olly, ... )

From http://worrydream.com/LadderOfAbstraction/

Fuzzing

Debugger (gdb, olly, ... )

From http://worrydream.com/LadderOfAbstraction/

Fuzzing

Debugger (gdb, olly, ... )

From http://worrydream.com/LadderOfAbstraction/

Fuzzing

Debugger (gdb, olly, ... )
Abstract away Time Time traveling Debugger
(rr, REVEN, ... )

From http://worrydream.com/LadderOfAbstraction/

Fuzzing

Debugger (gdb, olly, ... )

Abstract away Time Time traveling Debugger
(rr, REVEN, ... )
Abstract away Inputs Fuzzing Debugger ????
From http://worrydream.com/LadderOfAbstraction/

Fuzzing

Debugger (gdb, olly, ... )

Abstract away Time Time traveling Debugger
(rr, REVEN, ... )
Abstract away Inputs Fuzzing Debugger ????
From http://worrydream.com/LadderOfAbstraction/

Fuzzing

Debugger (gdb, olly, ... )

Abstract away Time Time traveling Debugger
(rr, REVEN, ... )
Abstract away Inputs Fuzzing Debugger ????
From http://worrydream.com/LadderOfAbstraction/

Fuzzing

Debugger (gdb, olly, ... )

Abstract away Time Time traveling Debugger
(rr, REVEN, ... )
Abstract away Inputs Fuzzing Debugger ????
From http://worrydream.com/LadderOfAbstraction/

Fuzzing

Debugger (gdb, olly, ... )

Abstract away Time Time traveling Debugger
(rr, REVEN, ... )
Abstract away Inputs Fuzzing Debugger ????
From http://worrydream.com/LadderOfAbstraction/

A Better Tool...

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points

A Better Tool...

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points

A Better Tool...

Add Watch Point

...

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points

A Better Tool...

Add Watch Point

...

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points

A Better Tool...

Expr OK

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points

A Better Tool...

Expr
edx OK

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points

A Better Tool...

Expr
edx OK

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points

A Better Tool...

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points
0804d050: edx

A Better Tool...

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points
0804d050: edx

A Better Tool...

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points
0804d050: edxAnalyze Input

...

A Better Tool...

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points
0804d050: edxAnalyze Input

...

A Better Tool...

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points
0804d050: edx

A Better Tool...

if changed, we don't reach the breakpoint

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points
0804d050: edx

A Better Tool...

directly affects the value

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points
0804d050: edx

A Better Tool...

doesn't matter

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points
0804d050: edx

A Better Tool...

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

affects the numWabtcheProihntos w ...7.o.f.t.e7n0.t.h..e..BP0w80a4sd0h5i0t: edx
=............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

A Better Tool...

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points
0804d050: edx

A Better Tool...

FAKE

id:000008,src:000001,op:havoc,rep:8,+cov
00000000: 0000 1337 0000 0000 3730 0000 0000 0000 00000010: 3df8 0600 0000 0000 0204 000f a85d 492b 00000020: 0404 004d c0bb e574 0708 00dc a741 0c05 00000030: aa10 361b 040c 00da bf00 9138 3a50 1ba2 00000040: c381 a37b 0908 00ff 9853 25c5 15cd 5991 00000050: 0e08 005f 30b5 89fd 294f 454f

...7....70...... =............]I+ ...M...t.....A.. ..6........8:P.. ...{.....S%...Y. ..._0...)OEO

Watch Points
0804d050: edx

A Better Tool...

Root Cause Analysis

Root Cause Analysis

Root Cause Analysis
val.type != MRB_TT_EXCEPTION

Root Cause Analysis
val.type != MRB_TT_EXCEPTION val.type < 123

Root Cause Analysis
val.type != MRB_TT_EXCEPTION val.type < 123

...

Root Cause Analysis
val.type != MRB_TT_EXCEPTION val.type < 123

...

Root Cause Analysis
val.type != MRB_TT_EXCEPTION val.type < 123

...

Heap Feng Shui
https://sean.heelan.io/heaplayout/

Heap Feng Shui
https://sean.heelan.io/heaplayout/

Heap Feng Shui
https://sean.heelan.io/heaplayout/

Heap Feng Shui
Overflow
https://sean.heelan.io/heaplayout/

Key Takeaways:
printf
Debugger
Time Traveling Debugger
Fuzzer + Debugger

Unfuzzable Code

Code that doesn't run?

Code that doesn't run?
Firmware

Code that doesn't run?
Firmware
IO

Code that doesn't run?
Firmware
IO

???

Code that doesn't run?
Firmware
IO

Code that doesn't run?
Firmware
IO

[1] https://arxiv.org/pdf/1909.06472.pdf [2] https://nebelwelt.net/publications/files/20SEC2.pdf

P2IM [1]
HALucinator [2]

Key Takeaways:
You underestimate the fuzzer

AntiFuzz

AntiFuzz

AntiFuzz

AntiFuzz

Pick Path by hash(input)

AntiFuzz

Pick Path by hash(input)

AntiFuzz

Pick Path by hash(input)

AntiFuzz
SLOW DOWN!

AntiFuzz

SLOW DOWN!

if(parse_error){ printf("couldn't parse\n"); exit(1);
}

AntiFuzz

SLOW DOWN!

if(parse_error){ printf("couldn't parse\n"); delay(1); //expensive calc exit(1);
}

AntiFuzz

SLOW DOWN!

if(parse_error){ printf("couldn't parse\n"); delay(1); //expensive calc exit(1);
}

Signal Handler!

AntiFuzz Symbolic Execution? Taint Tracking?

AntiFuzz Symbolic Execution? Taint Tracking?
input = enc(dec(input));

AntiFuzz

objdump

Plain

objdum p

Protected

6000

# Branches covered

5000

4000

3000

2000

1000

Vuzzer AFL Hongg QSYM

Vuzzer AFL Hongg QSYM

Key Takeaways:

Key Takeaways:

Fuzzers
As Building Blocks for a
New Generation of Tools

Let's Build Better Tools

github.com/RUB-SysSec/kAFL github.com/RUB-SysSec/nautilus github.com/RUB-SysSec/grimoire github.com/RUB-SysSec/antifuzz github.com/eqv/fuzz_ui

@is_eqv github.com/eqv cornelius.aschermann@rub.de
@ms_s3c github.com/schumilo sergej.schumilo@rub.de
Special Thanks to:
Ali Abbasi, Tim Blazytko, Robert Gawlik, Emre Güler, Thorsten Holz, Moritz Schlögel, Daniel Teuchert, Simone Wörner, and all the others that made this research possible.

