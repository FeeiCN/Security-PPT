StagefrightStagescream ""
,  of C0RE Team

ABOUT US
Ø C0RE Team Founding Members (c0reteam.org)
Ø Working on Android/Linux Security
Ø Linux Kernel/3rd-party Drivers: CVE-2015-0568, CVE-2015-4419, ... Ø Android Framework/Apps: CVE-2015-3862, CVE-2015-3868, ...
Ø North Carolina State University PhDs ()
Ø Virtualization Security: HyerLock (EuroSys `12), DeHype (NDSS `13) Ø Mobile Security: Android Malware Genome Project (Oakland '12), SEFA (CCS
`13), AirBag (NDSS '14)

libstagefright
Ø Linked by privileged processes (e.g., mediaserver)
Ø Processing complicated input (e.g., MPEG4, Ogg, OMX files)
Ø Activated by processing media files à easy to trigger attacks
Picture  from  https://source.android.com/devices/media.html

JDUCK'S FINDINGS
Ø Vulnerabilities
Ø Seven 0-day stagefright vulnerabilities identified Ø Six of them are rated critical
Ø Ways to Exploit AOSP Bugs
Ø State-of-the-art results of exploiting the 0-day vulnerabilities

BUG ESSENCE #1
Ø Memory Allocation with an "Overflowed" Size

Allocating  (Size+1)

I  think  I  have   (Size+1)  :P

What  you  really  allocated   What  happens  when  you  

is  (0xffffffff+1)  =  nothing!

try  to  access  it?

Picture  from  http://imgs.xkcd.com/comics/goto.png

BUG ESSENCE #1
Ø Related AOSP Patch

BUG ESSENCE #2
Ø Out of Bound Access to Stack/Heap Buffer
Ø Due to unsafe size checking logic
Picture  from  http://truefactscomics.tumblr.com/

BUG ESSENCE #2
Ø Related AOSP Patch

STAGEFRIGHT è STAGESCREAM
Ø We found out more 0-day vul.s in Android Multimedia Framework
Ø CVE-2015-3873 (Critical Severity, $2,000 awarded) Ø CVE-2015-3869 (Critical Severity, $3,000 awarded) Ø CVE-2015-3868 (Critical Severity, $4,000 awarded) Ø CVE-2015-3862 (Low Severity, $666 awarded) Ø Patches will be released by Google soon!
Ø In many cases, the bugs can't be fixed in one shot
Picture  from  http://oaks.nvg.org

BUG ESSENCE #1
Ø Memory Allocation with an "Overflowed" Size
Ø Leading to CVE-2015-3868
Ø Critical Severity Ø $3,000 Rewarded
Ø P = malloc(A*size); for ( i=0 ; i<A ; i++ ) { P[i] = B;} Ø What if A*size < A?
Ø e.g., 0x80000000 * 2 = 0 on 32-bit machines
Picture  from  http://imgs.xkcd.com/comics/goto.png

BUG ESSENCE #2
Ø Out of Bound Access to Stack/Heap Buffer
Ø Due to unsafe size checking logic
Ø Leading to CVE-2015-3869
Ø Critical severity, $3,000 awarded
Ø Leading to CVE-2015-3873
Ø Critical severity, $2,000 awarded
Ø if (size+4 < sizeof(P)) {memcpy(P, Q, size);}
Ø What if "size" > sizeof(P)?
Ø e.g., size = 0xfffffffc => size+4 = 0 (on 32-bit machines)
Picture  from  http://truefactscomics.tumblr.com/

BUG ESSENCE #3
Ø Memory Allocation without Error Handling Ø Leading to CVE-2015-3862
Ø Low Severity, $666 rewarded
Ø P = malloc(size); P[0]=A; Ø What if P is NULL (e.g., size is too large)?
http://imgs.xkcd.com/comics/compiler_complaint.png

STAGESCREAM

Ø Part of related patches in the coming October

CVE CVE-2015-3873 CVE-2015-3872 CVE-2015-3871 CVE-2015-3868 CVE-2015-3867 CVE-2015-3869 CVE-2015-3870 CVE-2015-3823 CVE-2015-6598

Severity Critical Critical Critical Critical Critical Critical Critical Critical Critical

CVE CVE-2015-6599 CVE-2015-6600 CVE-2015-3870 CVE-2015-6601 CVE-2015-3876 CVE-2015-6604 CVE-2015-6605 CVE-2015-3862

Severity Critical Critical Critical Critical Critical Critical
Low Low

EXPLOITATION
Ø Null Pointer Deference (NPD)
Ø Just crash
Ø Stack Overflow
Ø Heap Overflow
Ø POC by jduck

bdeooWenWwxehe?phiclachoahtaintveed 
18

EXPLOITATION: CVE-2015-1538
if mNumSampleToChunkOffsets == 0xC0000003 then
mNumSampleToChunkOffsets * 12 = 0x00000024 mSampleToChunkEntries = 3

BASIC STEPS

Overwriting Array

Heap mDataSource spray_addr

...

...

E[1].chunkDesc spray_addr

E[1].samplesPerChunk spray_addr

E[1].startChunk spray_addr

E[0].chunkDesc spray_addr

E[0].samplesPerChunk spray_addr

E[0].startChunk spray_addr

Sprayed buffer
fake strong pointer object rop_gadgets

Destruction RefBase::decStrong (CVE-2014-7911)

fake strong pointer object rop_gadgets

fake strong pointer object rop_gadgets

fake strong pointer object rop_gadgets

KEY DATA STRUCTURES (1)

KEY DATA STRUCTURES (2)

BLX

R2

BUILD ROP CHAIN

Stack Pivot(/system/bin/linker) Let SP point to sprayed buffer we allocated
Shellcode ...
fork() ...
socket(...) connect(...)
...

OVERWRITING

Overwriting Array

Heap mDataSource spray_addr

...

...

E[1].chunkDesc spray_addr

E[1].samplesPerChunk spray_addr

E[1].startChunk spray_addr

E[0].chunkDesc spray_addr

E[0].samplesPerChunk spray_addr

E[0].startChunk spray_addr

Sprayed buffer
fake strong pointer object rop_gadgets

Destruction RefBase::decStrong (CVE-2014-7911)

fake strong pointer object rop_gadgets

fake strong pointer object rop_gadgets

fake strong pointer object rop_gadgets

CODE EXECUTION
MOVW R1, 0xb00c MOVT R1, 0xface BLX R1

WITH ASLR, HOWEVER...
Ø Android   Ice  Cream  Sandwich  4.0
Ø Not  fully  ASLR support
Ø Android  Jelly  Bean  4.1
Ø Fully  ASLR  supportHeap/brk &  Linker Ø Heap  spray?
Ø Android  5.0 Lollipop
Ø Introduce  jemalloc
Source: https://copperhead.co/2015/05/11/aslr-android-zygote
26

CONCLUSIONS
Ø AOSP needs more attention on leveraging 3rd-party libraries Ø How about other libraries inside AOSP? Are they safe? Ø When will the users get the OTA update? Ø ASLR is an efficient way to prevent attacks but it's still
possible to bypass it

