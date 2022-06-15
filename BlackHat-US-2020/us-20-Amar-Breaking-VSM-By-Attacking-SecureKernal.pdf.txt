Breaking VSM by Attacking Secure Kernel
Hardening Secure Kernel through Offensive Research

Saar Amar
Security Researcher @ MSRC @AmarSaar

Daniel King
Security Researcher @ MSRC @long123king

Outline
 World's shortest intro to the architecture of VSM, Secure Kernel
 Including current state of mitigations
 Vulnerabilities - fuzzing && code auditing
 VTL0 -> VTL1  Found 10 vulnerabilities
 Exploits
 With super awesome primitives along the way  Demos 
 Takeaways
 Hardening Secure Kernel  Many exploitation internals!

VBS/VSM 101 ­ highlevel overview
 Use virtualization to enforce isolation and restrictions in the OS  Introduce Virtual Trust Levels (VTLs), orthogonal to rings
 VTL1 - Secure World  VTL0 - Normal World  The higher the VTL is, the more privileged it gets
 All managed by Hyper-V!
 Secure Kernel runs in ring0VTL1  NTOS runs in ring0VTL0
 Hyper-V exposes 2 hypercalls for normal calls and secure calls
 Normal call ­ services provided by NTOS to SK  Secure call ­ services provided by SK to NTOS

VBS/VSM 101 ­ highlevel overview
 Hyper-V exposes hypercalls to Secure Kernel to restrict VTL0
 restrict VTL0 access to physical address space (using SLAT)  restrict VTL0 access to system registers

 Examples of mitigations based on VBS:

 HVCI

­ enforce only signed code pages are +X in VTL0 SLAT

 Credential Guard ­ hide secrets in ring3VTL1 address space, unreadable to VTL0

 Hyperguard

­ restricts VTL0 access to system registers

 Compromise of Secure Kernel or Hyper-V bypasses those mitigations and break the model guarantees

Our story begins with a great teamwork!
 Amazing hypercalls fuzzer developed by Daniel
 "Growing Hypervisor 0day with Hyperseed" / Daniel and Shawn (OffensiveCon 2019)  Found many issues in Hyper-V
 Suggestion from Saar: use Hyperseed to fuzz SK
 Specifically, target the securecall interface: securekernel!IumInvokeSecureService  Already has a convenient userspace component that talks to a kernel driver  The crossed boundary here: ring0VTL0 (NTOS) -> ring0VTL1 (Secure Kernel)
 DOS is out of the picture ­ VTL0 can DOS VTL1 by design
 2 weeks later ­ Hyperseed found 5 different VTL0->VTL1 bugs 
 And more were found afterwards

Thinking ahead
 Before we start doing the classic circle of life
 Find awesome 0days  Gain shape primitives  Shape SK heap  Corrupt structures, gaining read/write primitives  Bypass mitigations  etc...
 Let's get ourselves familiar with the current state of mitigations in VTL1
 i.e. ­ assume we got a read/write in ring0VTL1 ­ what can we do?

Mitigations

 Which mitigations from VTL0 exist in VTL1?

NTOS (ring0VTL0)

Secure Kernel (ring0VTL1)

KASLR





CFI mechanism (CFG/XFG)





SLAT enforcement





 Let's check it out in details

KASLR ­ Predictable Addresses

 Hardcoded:
 PTE_BASE  Pfndb  SkmiSystemPTEs Base  SkmiImagePTEs Base  SkmiIoPTEs Base  Paged Pool  shared page VTL1  shared page VTL0 mapping

0xfffff6c800000000 0xffffe80000000000 0xfffff6c800000000 0xfffff6cc80000000 0xfffff6fffff80000 0xffff9a0000000000 0xfffff78000000000 0xfffff78000007000

 Deterministic:
 SkpgContext  SkmiFailureLog

0xffff9880419b6000 0xffff988000000000

Great primitive
 Shared between VTL0 and VTL1:
 VTL0 -> VTL1 0xfffff78000000000 (Writable)  0xfffff78000007000 (Read-only)
 VTL1 -> VTL0 nt!PspIumLogBuffer (Read-only)  0xffff988000000000 (Writable)
 Exploitation primitive: Controlled data at a known address!

 NTOS, ring0VTL0  Secure Kernel, ring0VTL1

SLAT Enforcement
 There is EPT enforcement only on lower VTLs from higher VTLs
 Examples: HVCI, Credential Guard, etc.
 Meaning, SK (being the higher VTL right now) isn't EPT-enforced
 VTL1 PTEs have the "final say"
 Given arbitrary write --> RWX in VTL1 address space!
 Don't need a read primitive, since PTE_BASE is fixed
 Interesting... what about W^X?

W^X? W+X!
 Many folks found addresses in VTL0 address space that are W+X in the PTE
 https://twitter.com/AmarSaar/status/1017077506577436673
 That's not interesting, because HVCI does a great job mitigating this
 However... there is no SLAT enforcement in VTL1
 We found 4 different addresses that are W+X!
 We fixed all of them by now 

Little setup
 We used Hyperseed, super convenient 
DD
 Define basic interface to securecalls from our kernel driver, and developed the POCs and exploits in an userspace program
DD
 If you want to trigger specific securecalls in VTL1 easily, you can set breakpoints in VTL0 and change the parameters/memory in runtime

SK debugging
 Secure Kernel release binaries shipped with debugstub compiled out
 However, you can still achieve that
 Nested virtualization  KVM/QEMU
 Some researchers are doing that! 
 Refs:
 ExdiKdSample  Tweet: WinDBG EXDi extension (and more at @gerhart_x)  debugging-secure-kernel

The Vulnerable Function
 In the hotpatch mechanism implementation, there is a function called securekernel!SkmmObtainHotPatchUndoTable

 This function obtains an undo table to describe addresses that will be affected when reverting a hot patch

 We found 2 memory corruption issues:

 OOB Write

- by Hyperseed

 Unmap arbitrary-controlled MDL

- by statically reviewing the code

Vulnerability #1 ­ OOB Write
 Securecalls use TransferMdls in order to get data from VTL0
DD
 Those TransferMdls are fully controlled by VTL0
DD
 VTL1 code does:
 SkmmMapDataTransfer() ­ gain a mapping in VTL1 address space  SkmmMapMdl() ­ initializes a new VTL1 MDL (allocate PTEs, set metadata, etc.) ...  SkmmUnmapMdl()
 VTL1 has to sanitize EVERY field it reads from VTL0
DD
 Including TransferMdl->ByteCount

Vulnerability #1 ­ OOB Write

MDL (Memory Descriptor List) Layout

MDL +0x00 +0x10 +0x20 +0x30
...

+0x0

+0x2

+0x4

Next

Process

StartVa

Pfn0

...

+0x6

+0x8

+0xA

+0xC

+0xE

Size

Flags

Apn

Resv

MappedSystemVa

ByteCount

ByteOffset

Pfn1

...

Allocate UndoMdl

TransferMdl
+0x00 Next +0x10 Process +0x20 StartVa

Size

Flags

MappedSystemVa

ByteCount = 0x10

Apn

Resv

ByteOffset

UndoMdl = SkAllocatePool(TransferMdl->ByteCount)
+0x00
+0x10 HEAP_VS_CHUNK_HEADER (of Next Pool Allocation)
+0x20

Reference OriginalMdl prepared by VTL 0

TransferMdl
+0x00 Next +0x10 Process +0x20 StartVa

Size

Flags

MappedSystemVa

ByteCount

Apn

Resv

ByteOffset

UndoMdl
+0x00
+0x10 HEAP_VS_CHUNK_HEADER (of Next Pool Allocation)
+0x20

OriginalMdl
+0x00 Next +0x10 Process +0x20 StartVa

Size

Flags

MappedSystemVa

ByteCount

Apn

Resv

ByteOffset

MmInitializeMdl(UndoMdl,...)

TransferMdl
+0x00 Next +0x10 Process +0x20 StartVa
OriginalMdl
+0x00 Next +0x10 Process +0x20 StartVa

Size

Flags

MappedSystemVa

ByteCount

Apn

Resv

ByteOffset

Size

Flags

MappedSystemVa

ByteCount

Apn

Resv

ByteOffset

UndoMdl

+0x00 Next = NULL

Size=... Flags=0

+0x10 HEAP_VS_CHUNK_HEADER (of Next Pool Allocation)

+0x20 StartVa

ByteCount

ByteOffset

MmInitializeMdl(UndoMdl, (PVOID)OriginalMdl->ByteOffset, OriginalMdl->ByteCount);

UndoMdl->StartVa = OriginalMdl->StartVa;

// rdi is UndoMdl

...

fffff806`79cc7c16 4c8937

mov

qword ptr[rdi], r14

fffff806`79cc7c19 4423c3 and r8d, ebx

fffff806`79cc7c1c 664489770a

mov

word ptr[rdi + 0Ah], r14w

fffff806`79cc7c21 4823c3 and rax, rbx

fffff806`79cc7c24 44894f28

mov

dword ptr[rdi + 28h], r9d

fffff806`79cc7c28 4881e200f0ffff and rdx, 0FFFFFFFFFFFFF000h

fffff806`79cc7c2f 498d89ff0f0000 lea

rcx, [r9 + 0FFFh]

fffff806`79cc7c36 4803c8

add

rcx, rax

fffff806`79cc7c39 48895720

mov

qword ptr[rdi + 20h], rdx

fffff806`79cc7c3d 48c1e90c

shr

rcx, 0Ch

fffff806`79cc7c41 664103cd

add

cx, r13w

fffff806`79cc7c45 66c1e103

shl

cx, 3

fffff806`79cc7c49 66894f08

mov

word ptr[rdi + 8], cx

fffff806`79cc7c4d 418bc8

mov

ecx, r8d

fffff806`79cc7c50 4d8d81ff0f0000 lea

r8, [r9 + 0FFFh]

fffff806`79cc7c57 4c03c1

add

r8, rcx

fffff806`79cc7c5a 894f2c

mov

dword ptr[rdi + 2Ch], ecx

fffff806`79cc7c5d 498b4320

mov

rax, qword ptr[r11 + 20h]

fffff806`79cc7c61 49c1e80c

shr

r8, 0Ch

fffff806`79cc7c65 49c1e003

shl

r8, 3

fffff806`79cc7c69 48894720

mov

qword ptr[rdi + 20h], rax

...

Vulnerability #1 PoC

How to Fix?
The Fix

Build 18290 (Vulnerable) Build 18841 (Patched) The Fix

Exploit #1 ­ Arbitrary Write

Victim MDL

TransferMdl
+0x00 Next +0x10 Process +0x20 StartVa

Size

Flags

MappedSystemVa

ByteCount

Apn

Resv

ByteOffset

OriginalMdl
+0x00 Next +0x10 Process +0x20 StartVa

Size

Flags

MappedSystemVa

ByteCount

Apn

Resv

ByteOffset

UndoMdl

+0x00 Next = NULL

Size=... Flags=0

+0x10 HEAP_VS_CHUNK_HEADER (of Next Pool Allocation)

+0x20 StartVa

ByteCount

ByteOffset

1. VictimMdl's VsChunkHeader remains intact

2. VictimMdl.Next

=

UndoMdl.StartVa

3. VictimMdl.Size&Flags =

UndoMdl.ByteCount

4. VictimMdl.Apn&Resv

=

UndoMdl.ByteOffset

VictimMdl
+0x20 Next +0x30 Process +0x40 StartVa

Size

Flags

MappedSystemVa

ByteCount

Apn

Resv

ByteOffset

Introducing SkpgContext
 Secure Kernel HyperGuard  Deterministic Address  Callback Routine Pointer  Self-Protection

SkpgContext Protects Its Own Integrity

SkpgContext +0x000 ...... +0x220
...... +0x250 +0x258 +0x260 +0x268 ......

Timer

RuntimeCheckRoutine will set this timer with randomized relative DueTime.

TimerRoutine DueTime[0] DueTime[1] RuntimeCheckRoutine

Invoked when DueTime comes, triggers RuntimeCheckRoutine. Absolute DueTime.
Verify the data integrity of this whole context

SkpgContext Protects Its Own Integrity How To Bypass?

SkpgContext +0x000 ...... +0x220
...... +0x250 +0x258 +0x260 +0x268 ......

Timer

RuntimeCheckRoutine will set this timer with randomized relative DueTime.

TimerRoutine DueTime[0] DueTime[1] RuntimeCheckRoutine

Invoked when DueTime comes, triggers RuntimeCheckRoutine. Absolute DueTime.
Verify the data integrity of this whole context

Secure Kernel Pool Intro
 Use the normal kernel allocators
 Segment Heap
DD
 VS (Variable Size) Heap
 Allocations of different sizes are mixed together
DD
 LFH (Low Fragmentation) Heap
 Allocations of the same size are allocated together
DD
 Tag/PoolType Are Ignored
 Allocate in paged pool
D
 Challenge:
 Too few allocations

LFH Heap : 15/129 buckets activated VS Heap : only 22 segments

Secure Kernel Pool Shaping
 Focus on VS Heap pool shaping
DD
 Searching for persistent and controllable pool allocations
 SECURESERVICE_CREATE_SECURE_IMAGE, 0x30 bytes minimum.
DD
 Making holes for 0x10 size allocation
DD
 Overwriting next allocation
DD
 Choose a victim neighbor
 SECURESERVICE_LIVEDUMP_START
DD
 Challenges:
 Not overwriting guard page after each segment  Not activating LFH for a specific pool size range

VS Heap Pool Shaping

A

B

A

B ...

B

A

B

A ...

A

C

A

C ...

C

A

C

A ...

C

C ...

C

C

...

D

CD

C ...

CD

C D ...

DE C D

CD

C

C ...

D ...

C

LiveDump MDL

E Undo MDL

VS Heap Pool Shaping

A

B

A

B ...

B

A

B

A ...

A

C

A

C ...

C

A

C

A ...

C

C ...

C

C

...

D

CD

C ...

CD

C D ...

DE C D

CD

C

C ...

D ...

C

LiveDump MDL

E Undo MDL

VS Heap Pool Shaping

A

B

A

B ...

B

A

B

A ...

A

C

A

C ...

C

A

C

A ...

C

C ...

C

C

...

D

CD

C ...

CD

C D ...

DE C D

CD

C

C ...

D ...

C

LiveDump MDL

E Undo MDL

VS Heap Pool Shaping

A

B

A

B ...

B

A

B

A ...

A

C

A

C ...

C

A

C

A ...

C

C ...

C

C

...

D

CD

C ...

CD

C D ...

DE C D

CD

C

C ...

D ...

C

LiveDump MDL

E Undo MDL

LiveDump and related securecalls
 SkLiveDumpStart
 Allocate a list of MDL allocations  Those MDLs are organized into a singly-linked list by MDL->Next pointer
 SkLiveDumpAddBuffer
 Locate a target MDL from the singly-linked list  Write to PfnArray(+0x30 ~ ...) of target MDL
 Challenges:
 Skip writing to the pivot MDL which resides in read-only page  Control overwriting target

MDL Singly-Linked List

LiveDump Context
MDLListHead
PagesAdded

MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

Where Does LiveDumpAddBuffer Write To?

LiveDump Context
MdlListHead
PagesAdded

MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

while (PagesAdded > 0) {
this_MDL_Capacity = this_MDL->ByteCount / PAGE_SIZE; if (PagesAdded > this_MDL_Capacity) {
PagesAdded -= this_MDL_Capacity; this_MDL = this_MDL->Next; continue; } AddBufferTo(this_MDL, PagesAdded); break; }

If We Can Control "Next" of One Chained MDL

LiveDump Context
MdlListHead
PagesAdded

Undo MDL
Victim MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

Pivot MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

Worker MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

We Can Chain a Fake Pivot MDL at Shared Page

LiveDump Context
MdlListHead
PagesAdded

Undo MDL
Victim MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

Pivot MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

Worker MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

VTL 0 -> VTL 1 Shared Memory:
· VTL 0: Writable · VTL 1: Read-only

We Control Where LiveDumpAddBuffer Write To

LiveDump Context
MdlListHead
PagesAdded

Undo MDL
Victim MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

Pivot MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount=0xC00

Worker MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

VTL 0 -> VTL 1 Shared Memory:
· VTL 0: Writable · VTL 1: Read-only

Detect Worker MDL Has Been Written

LiveDump Context
MdlListHead
PagesAdded

Undo MDL
Victim MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

Pivot MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

Worker MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

VTL 0 -> VTL 1 Shared Memory:
· VTL 0: Writable · VTL 1: Read-only

VTL 1 -> VTL 0 Shared Memory:
· VTL 0: Read-only · VTL 1: Writable

Retarget Worker MDL

LiveDump Context
MdlListHead
PagesAdded

Undo MDL
Victim MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

Pivot MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

Worker MDL
+0x00 Next
+0x10 +0x20
+0x30 PfnArray

ByteCount

VTL 0 -> VTL 1 Shared Memory:
· VTL 0: Writable · VTL 1: Read-only

Shared pages: Communication Channels
 VTL 0(write) -> VTL 1(read)
 Craft pivot MDL, modify Worker MDL repeatedly
 VTL 1(write) -> VTL 0(read)
 Tentative overwriting target of SkLiveDumpAddBuffer  Indicator of Worker MDL activated.
 Write-what-where accurately and repeatedly
 Pivot MDL->Next: Worker MDL  Pivot MDL->ByteCount: Accurately control overwriting offset to Worker MDL  SkLiveDumpAddBuffer: Overwriting Content

Multiple Write-What-Where

VTL 0 VTL 1

Shared Page
 Repeatable Write-What-Where
 Where: ( Writing Cursor )
 Next = Writing Cursor ­ 0x30  ByteCount += PAGE_SIZE

Pivot MDL
+0x00 Next
+0x10 +0x20

ByteCount

Worker MDL
+0x00 Next
+0x10 +0x20
+0x30 Value

ByteCount

 What:

 Pages = 1

 PfnArray = [ Value

]

 Write:
 LiveDumpAddBuffer(Pages, PfnArray, ...)

 SkLiveDumpAddBuffer(Pages, PfnArray, ...)  *(QWORD*)( Writing Cursor ) = Value

Exploit #1 ­ Final to Arbitrary Code Execution
 Corrupt MDL->Next, gain 1 arbitrary write
D
 Fake a pivot MDL structure in the shared page (simply writes in VTL0)
 Keep in mind that we can changed that repeatedly, by design
D
 Use the arbitrary write to corrupt a node in SkpLiveDumpContext.Mdl chain, make it points to our pivot MDL
D
 Call SkLiveDumpAddBuffer to trigger arbitrary write
D
 Change shared page content, and call SkLiveDumpAddBuffer again!
D
 Arbitrary Write: Corrupt PTE --> make shared page RWX
D
 Arbitrary Write: Corrupt SkpgContext callback --> jump to shellcode
D
 PROFIT

Demo Shellcode

BYTE shellcode[] = { 0x48, 0x83, 0xec, 0x30,
0x48, 0xb9, QWORD_2_LE_BYTES(SKPG_CONTEXT_ADDR + 0x250), 0x4c, 0x8b, 0x09, 0x48, 0xba, QWORD_2_LE_BYTES(SHARED_MEM_SK_VIEW_ADDR + 0x150), 0x48, 0x89, 0x11, 0x48, 0x83, 0xc1, 0x18, 0x48, 0xc7, 0x01, 0x00, 0x00, 0x00, 0x00, 0x48, 0xc7, 0x41, 0x08, 0x00, 0x00, 0x00, 0x00, 0x48, 0xc7, 0x41, 0x10, 0x00, 0x00, 0x00, 0x00, 0x49, 0x81, 0xe9, DWORD_2_LE_BYTES(SKPG_TIMER_ROUTINE_OFFSET),

0x48, 0xb9, QWORD_2_LE_BYTES(FAILURE_LOG_SK_ADDR + 0x1090), 0x48, 0x8b, 0x11, 0x49, 0xb8, QWORD_2_LE_BYTES(KERNEL_ADDR_MASK), 0x49, 0x21, 0xd0, 0x49, 0x83, 0xf8, 0x00, 0x4c, 0x0f, 0x45, 0xca, 0x4c, 0x89, 0x09, 0x49, 0x81, 0xc1, DWORD_2_LE_BYTES(SKPG_SETTIMER_OFFSET), 0x48, 0xb9, QWORD_2_LE_BYTES(SKPG_CONTEXT_ADDR + 0x220), 0x48, 0xc7, 0xc2, DWORD_2_LE_BYTES(NEG_5_SECONDS_IN_NANOSECONDS), 0x49, 0xc7, 0xc0, DWORD_2_LE_BYTES(NEG_5_SECONDS_IN_NANOSECONDS), 0x4c, 0x89, 0xc8, 0xff, 0xd0,

0x48, 0x83, 0xc4, 0x30,

0xc3 };

 Modify SkpgContext callback routine pointer

//sub

rsp, 30h

//movabs //mov //movabs //mov //add //mov //mov //mov //sub

rcx, SKPG_CONTEXT_TIMER_CALLBACK_ADDR r9, qword ptr[rcx] rdx, SHELLCODE_SK_VIEW_ADDR qword ptr[rcx], rdx rcx, 0x18 qword ptr[rcx], 0 qword ptr[rcx + 8], 0 qword ptr[rcx + 0x10], 0 r9, SKPG_TIMER_ROUTINE_OFFSET

//movabs //mov //movabs //and //cmp //cmovne //mov //add //movabs //mov //mov //mov //call

rcx, FAILURE_LOG_SK_ADDR + 0x1090 rdx, qword ptr[rcx] r8, KERNEL_ADDR_MASK r8, rdx r8, 0 r9, rdx qword ptr[rcx], r9 r9, SKPG_SETTIMER_OFFSET rcx, SKPG_CONTEXT_ADDR + 0x220 rdx, NEG_5_SECONDS_IN_NANOSECONDS r8, NEG_5_SECONDS_IN_NANOSECONDS rax, r9 rax

//add

rsp, 30h

//ret

 Leak Secure Kernel pointer back to VTL 0 (through shared page)

 Reset timer, configure 5 seconds relative due time, shellcode will be invoked every 5 seconds

 Shellcode is fully controlled from VTL 0 and can be refactored for other purpose

Demo
 Vulnerability #1 was fixed in Jan 2019
 Secure Kernel pool switched to segment heap in Mid-2019, the exploit depends on segment heap
 This demo is against 20129 build (May 2020), where vuln#1 has already been fixed
 A trick to undo the fix by windbg command:
 eb nt!SkmmObtainHotPatchUndoTable+0x5D 90 90 90 90 90 90 90 90 90 90; g;
 The exploit approach works well on latest build
 Demo only!

DEMO

Vulnerability #2
 Great work! We fixed this issue (CVE-2020-0917)  Now we make sure TransferMdl->ByteCount >= sizeof(MDL)  But... there is something interesting in the general flow here  Something related to mapping and unmapping of VTL1 MDLs  Well, let's take a closer look:

Vulnerability #2 ­ Unmap arbitrary controlled MDL
 As we saw, this is the flow of SkmmObtainHotPatchUndoTable

Vulnerability #2 - POC
 We can call SkmmUnmapMdl() on a fully controlled MDL!  Building a small POC: MDL->MappedSystemVA=0x4141414141414141

Vulnerability #2 - POC
 We can call SkmmUnmapMdl() on a fully controlled MDL!  Building a small POC ­ write ZeroPTE on some in used page's PTE  VTL1 has its own shared page (same, 0xfffff78000000000)  Pass MDL->MappedSystemVA==0xfffff78000000000  And...

Exploit #2
 We can call SkmmUnmapMdl on a fully controlled MDL
 So we don't have here (yet) a corruption with a controlled content  But we can clearly build one 
 The basic logic of SkmmUnmapMdl is as follows:
 Scan the PTEs range described by the MDL  Set each PTE to ZERO_PTE (after this, PTE.P==0 --> each deref will
panic)  If Mdl.MdlFlags & MDL_PARENT_MAPPED_SYSTEM_VA
 Call SkmiReleaseUnknownPtes()

Exploit #2 - Primitives && Limitations
 The base primitive: SkmmUnmapMdl on a fully controlled MDL
 Looks like the page->refcount decrement and PTEs writes are "safe"  we can't write ZeroPTE outside the PTEs range (due to the calculation)  we can't dec arbitrary addresses outside the pfndb range (due to a check)
 But who needs that, when we can zero-out arbitrary PTEs!
 Also, it's important to zero-out the bit in the PTEs BitMap
 Otherwise, it would be hard to reclaim the page while it's in-used  SkmmUnmapMdl calls SkmiReleaseUnknownPTEs, which does that

PTERange
 Secure Kernel maintains structures for managing virtual address space  Among those: PTERange  Describes a range of PTEs of a certain use
 Examples: SystemPtes, IOPtes, PagedPtes, RebootPtes, etc.
 Has PTEbase address, size, bitMap pointer, bitMap Hint, etc.

PTEBase

Bimap

The PTE Ranges Problem/Primitive
 So SkmmUnmapMdl calls SkmiReleaseUnknownPTEs  Remember ­ it's optional. We control MDL->MdlFlags
 This function chooses the right PTE range among the following ranges: SkmiSystemPtes, SkmiIoPtes, SkmiRebootPtes

The PTE Ranges Problem/Primitive
 BUT ­ it only compares the PTE address to each PTERange->PTEBase  Doesn't check that it's actually in the chosen range
 So, trigger the vulnerability with a virtual address from another range
 We gain a relative write primitive AFTER some PTERange->BitMap
 Hmm, interesting  POC for the win:

The PTE Ranges Problem/Primitive
 But there are many pages outside those bitmaps which are paged-out and not in-used
 We can still make it work, but it's better to do the UAF idea 
 Keep in mind that we can attack only pages from those specific 3 PTERanges!
 We need to find an interesting structure in a page inside the
SkmiSystemPtes

Shape!
 Ok great, we know what we need to do, right?  Allocate some structure/data  Unmap the underlaying page  Reclaim PTE, replace the pfn  "UAF"
 It's in the PTE allocator (Skmi{Allocate,Release}SystemPtes())
 Each bitmap has a BitmapHint, which we start to scan from  Which is updated on wrapped around in the allocation
 Debug traces:

Getting a good crash
 But we want a good crash  PAGE_FAULT_IN_NONPAGED_AREA clearly isn't good enough   We can trigger it in any flow we would like basically, which is nice
 Two options:  Allocate a target structure ourselves, and then spray to wrap-around the BitmapHint (in order to reclaim it)
 Requires an information disclosure primitive, leak the address of the structure
 Find an already existing target structure, which its PTE's Bitmap index comes AFTER the BitmapHint after boot
 Keep in mind that the BitmapHint after boot is very predictable

Getting a good crash
 By analyzing the pages represented by the existed PTEs after the SkmiSystemPtes->BitmapHint, we see interesting structures
 Predictability in the VTL1 address space promises stability  It never failed 
 We have a great target structure at a predictable virtual address  Prcb->Tss, Prcb->StackBase
 Clearly gives us ROP with controlled registers
 But we have to be careful, as we replace the entire page

Getting a good crash
 This great structure spans over a few pages
 We don't HAVE to replace all of them, we can choose only one
 Which happens to be the one that:  Has as few critical values as we can find  Has raw pointers  Being used in a way that leads to arbitrary read/write
 2 pages ahead looks good!

Exploit 2 ­ highlevel plan
 Spray with SkmiAllocateSystemPtes() on SkmiSystemPtes to reach Prcb pages
 Trigger vulnerability, unmap one of the Prcb pages
 Keep spray, reclaim the PTE entry used for the previous used page
 And...

SkmiSystemPtes.Bitmap SkmiSystemPtes.BitmapHint
Prcb pages

111100101011000 011111111101001 011010110011100 011111111000000 000110000000000 000000000000000 000000000000000 000000000000000 000000000000000 000000000000000 000000000000000 000000000000000 000000000001111 111111111110000 000000000000000

SkmiSystemPtes.Bitmap SkmiSystemPtes.BitmapHint
Prcb pages

111100101011000 011111111101001 011010110011100 011111111000000 000111111111111 111111111111111 111111111111111 111111111111111 111111111111111 111111111111111 111111111111111 111111111111111 110000000001111 111111111110000 000000000000000

SkmiSystemPtes.Bitmap SkmiSystemPtes.BitmapHint
Prcb pages

111100101011000 011111111101001 011010110011100 011111111000000 000111111111111 111111111111111 111111111111111 111111111111111 111111111111111 111111111111111 111111111111111 111111111111111 110000000001111 111111011110000 000000000000000

Trigger vulnerability

SkmiSystemPtes.Bitmap SkmiSystemPtes.BitmapHint
Prcb pages

111100101011000 011111111101001 011010110011100 011111111000000 000111111111111 111111111111111 111111111111111 111111111111111 111111111111111 111111111111111 111111111111111 111111111111111 111111111111111 111111111111111 111111111000000

Good panic! 

Post Exploitation - Bypassing HVCI / CG
 Given arbitrary code execution in VTL1 --> bypass HVCI / CG  Also ROP is enough 
 Secure Kernel completely control VTL0 EPT permissions by hypercalls
 Thus, Secure Kernel can trivially disable all SLAT-based VTL0 restrictions

Hardening SK
 Shipped fixes for the two vulnerabilities we discussed:  CVE-2020-0917 ­ The OOB  CVE-2020-0918 ­ The design flaw with SkmmUnmapMdl
 Developing end-to-end exploits has many values, one of them is spotting important behaviors to change
 We are making the 4 W+X addresses to be only +X  Investigating randomizing Secure Kernel regions  More to come 

Let's work together!
 VBS is a very good security improvement for many of our products
 We would love to get submissions from you in our VBS model!
 Note about SK (again) ­ VTL0 can DOS VTL1 by design.  So the bugs need to be more than that (POC to leak sensitive data, corrupt memory, etc.) 

Shoutouts
 Matt Miller  Ken Johnson (SKYWING)  Andrea Allievi  Tomer Schwartz  All MSRC V&M members

Q && A

Saar Amar
@AmarSaar

Daniel King
@long123king

