Abusing Silent Mitigations
Understanding weaknesses within Internet Explorer's Isolated Heap and MemoryProtection
Abdul-Aziz Hariri Brian Gorenc Simon Zuckerbraun
1

Agenda
2

1 Overview 2 Isolated Heap 3 MemoryProtection 4 Bypassing ALSR using MemoryProtection 5 Recommended defenses 6 Conclusion

Overview
3

Introductions
HP Zero Day Initiative · World's Largest Vendor Agnostic Bug Bounty Program · Focused on Vulnerability Discovery and Remediation · Research Advanced Exploitation Techniques
Microsoft Mitigation Bypass and Blue Hat Bonus for Defense Program Research Group · Abdul-Aziz Hariri · Simon Zuckerbraun · Brian Gorenc
4

Use-After-Free Vulnerabilities

2013

2014

Feb

May

CVE-2013-0025 CVE-2013-1311

CVE-2013-1347 Mar

CVE-2013-2551

Sep CVE-2013-3205

Oct

CVE-2013-3893

Aug

CVE-2013-3897

CVE-2013-3184

Feb CVE-2014-0322
Mar CVE-2014-0307
May CVE-2014-1776 CVE-2014-1815

5

What is next?
It is finally getting harder!

ZDI Internet Explorer Submission Trends
Impact of Microsoft's Mitigations
50 45 40 35 30 25 20 15 10
5 0
7

Research Timeline
From Mitigation Release to Public Release

2014

2015

Jun

Oct

Feb

MS14-035 Isolated Heap Released
Isolated Heap PoC Created

White Paper Submitted
Follow-up meeting
Sept

Public Announcement
Jan
Charities Paid

Jun
Public Release at REcon

ASLR Bypass

Jul

PoC Created Nov

Apr
"No fix coming"

MS14-037 MemoryProtection Released

Winner Notification!

MemoryProtection PoC Created

8

Isolated Heap
9

Isolated Heap
"Not a security boundary"
· New heap region created using HeapCreate API · Most objects moved to Isolated Heap · Makes use-after-free vulnerability exploitation harder

· Classical overwrites of objects does not work anymore

10

Isolated Heap
Weaknesses and attack scenarios · Isolated Heap does not keep track / record the object types
­ Type confusion possible
· Attacker can overwrite an isolated freed object with smaller/bigger objects
­ Make use of the type confusion/size weaknesses
· Highly dependent on the offset being dereferenced from the freed object
11

Aligned Allocations Attack Technique

· Replace freed object with another object which is also allocated inside the isolated region · Object chosen as a replacement should contain controllable value at a known offset
­ Value that we can indirectly control (spray etc..)
· Perfect for use-after-free that dereferences high offsets · Avoid LFH · Simplest way to achieve this:

Trigger freeing condition

Massage heap forcing multiple frees

Coalesce heap to create larger freed chunk

Replace object with different object using heap spray

Trigger re-use using type-confused object

12

Aligned Allocation Attack Technique
HEAP

CTableRow

Offset with controllable value

HEAP

CDOMTextNode

13

Align Allocations Example
· Use-after-free dereference offset 0x30 · Fill freed object with CDOMTextNode object · Controllable value (0x40000000) at offset 0x30
14

Align Allocations Example
Controlling dereferences · Successful overwrite and dereference:
· Next an attacker can spray that address with controlled values
15

Misaligned Allocations Attack Technique
Hitting low offsets

· Aligned allocations attack techniques works well with high offsets. · Low offsets might be a problem
- Finding an object with values that we control
· Use-after-free dereferencing a low offset (0x0->0x20) can be problematic · To solve this problem, if the target object starts at X we'll have to allocate at X-n · Simple steps:

Influence the heap to coalesce more free chunks in one big chunk

Spray random objects inside the big free chunk

Dereference a pointer from an element that resides within a misaligned object

16

Misaligned Allocation Attack Technique
HEAP

CTableRow

Offset with controllable value

HEAP

CButton

17

Misaligned Allocations Attack Example

· Stabilize the heap in a way that would always provide a freed chunk of the same size.
· EDI will be pointing to an offset within a misaligned object.
· Code was used in ZDI-CAN-2495 to produce a freed chunk of size 0x110:

var objs = new Array();
for (var i; i < 0x1000; i++) objs[i] = document.createElement(`p');
for (var i; i < 0x1000; i++) objs[i] = null;
objs[i] = null; CollectGarbage();
var objs = new Array();
for (var i; i < 0x1000; i++) objs[i] = document.createElement(`video');

18

Misaligned Allocations Attack Example
· EDI points somewhere inside the freed chunk
19

Misaligned Allocations Attack Example

· Assuming stabilized heap, spray some objects · We used button/track objects.
­ CButton object contains a value that we can spray

var objs = new Array();
for (var i; i < 0x1000; i+=2) {
objs[i] = document.createElement(`button'); objs[i+1] = document.createElement(`track'); }

20

Misaligned Allocations Attack Example
Controlled offset · EDI+0x1C now lands at 0x12C00400 in the
CButton object · 0x12C00400 value is easily sprayed
21

Isolated Heap
Recap · Does a good job separating DOM objects from other types of allocations. · Not perfect, contains weaknesses (type confusion, misalignment issues etc.) · Attacking Isolated heap is dependent on several factors (bug nature, offsets, LFH etc.)
22

MemoryProtection
23

What is MemoryProtection?

· Prevent memory blocks from being deallocated while being referenced
· MS14-037
­ Checks for references on the stack
· MS14-051
­ Added checks for references in processor registers
· ProtectedFree called in place of HeapFree
­ Adds block to per-thread list of blocks waiting to be freed

Attacker Script

HEAP

WAIT LIST

Block Base Addr Block Size
Isolated Heap?

Entry

24

Delayed Freeing Mechanism

ProtectedFree(x)

Check if the memory allocated for the wait list is
completely full

Y N
Full?

Examine total size of blocks place on wait list since last
reclamation sweep

Y >=100,000??
N

Reclamation Sweep

Add block X to wait list

Fill block X with zeros

END

25

Reclamation Process
WAIT LIST

HEAP

Entry

Block Base Addr Block Size
Isolated Heap?

26

STACK

int32
?
Block is waitlisted

?

Processor
...

ECX

EAX

...

HEAP HEAP

After reclamation, block is still waitlisted
After reclamation, block is free

MemoryProtection Challenges
1. Deallocation delay
­ Memory blocks deallocation delayed until reclamation sweep is performed
2. Non-determinism due to "stack junk"
­ Memory block unexpectedly survive a sweep due to a value that equates to a pointer to the block ­ Could be non-pointer or a stale pointer left over in stack buffer not cleared of former contents ­ Low-probability
3. Greater complexity in determining the deallocation time
­ Reclamation sweep performed by 100,000 bytes waiting to be freed ­ Might require a large number of blocks on the wait list
4. More complex heap manager behavior at deallocation time
­ Many memory blocks are freed during reclamation sweep ­ Due to reordering of the wait list, impossible to predict order of HeapFree calls
27

Elementary Attack Techniques
Forcing Reclamation Sweep · Generic Memory Pressuring Loop
1. Allocate 100,000 bytes worth of objects 2. Allocate one additional to hit limit 3. Free objects 4. Reclamation sweep performed
· Limitations
­ Solves "Deallocation delay" challenge ­ Non-deterministic deallocation pattern
28

// Code to free some object goes here ... // End of code to free the object
// Pressuring loop to force reclamation var n = 100000 / 0x34 + 1; for (var i = 0; i < n; i++) {
document.createElement("div"); } CollectGarbage();
// Code to reuse the object follows ...

Elementary Attack Techniques
Forcing Reclamation Sweep
· Trigger WndProc
­ Interrupt exploit code with a delay to ensure WndProc call ­ Unconditional reclamation sweep performed
· Limitations
­ Not compatible with all vulnerability types ­ Stopping and resuming execution could interfere with
vulnerability ­ setTimeout creates opportunity for additional code
paths to execute
· Issue
­ Post-September patch rendered the unconditional reclamation due to WndProc non-functional
29

function step1() { // Setup code goes here ... // End of setup code
// Delay the next step so WndProc will re-enter, // clearing the wait list
window.setTimeout(step2, 3000); }
function step2() { // Code to free some object goes here ... // End of code to free the object
// Delay the next step so WndProc will re-enter, // clearing the wait list and deallocating our // object
window.setTimeout(step3, 3000); }
function step3() { // Code to reuse the object follows ... }

Advanced Attack Techniques
Key facts to exploitation

WAIT LIST

Isolated Heap

Examine total size of blocks place on wait list since last
reclamation sweep

>=100,000?? N

Reclamation Sweep

Add block X to wait list

Entry

Block Base Addr Block Size
Isolated Heap?

Process Heap

30

Advanced Attack Techniques
Prepping the wait list

Attacker Script

Browser Code

CMemoryProtector

Heap Manager

method to trigger buffer allocation

Resulting wait list state: Entry for block X1 Entry for block X2 ... Entry for block A (size 100,000)
Total size: >= 100,000
31

method to trigger buffer free

HeapAlloc(size 100,000) Block at address A

ProtectedFree(A)

Add block at address A to the
wait list

Allocate block at address A

Advanced Attack Techniques
Bringing the wait list to a known state and approximate size

Attacker Script

Browser Code

CMemoryProtector

Heap Manager

method to trigger buffer allocation
method to trigger buffer free
Resulting wait list state: Entry for block W1 Entry for block W2 ...
Entry for block B (size s)
32

HeapAlloc(size s) Block at address B

ProtectedFree(B) Reclamation Sweep
Add block at address B to the
wait list

Loop over Xi blocks
HeapFree(Xi)
HeapFree(A)

Allocate block at address B
These are not guaranteed to occur in any particular order

Advanced Attack Techniques
Reliably deallocate a memory block

Attacker Script

Browser Code

CMemoryProtector

Heap Manager

Resulting wait list state: Entry for block W1 Entry for block W2 ...
Entry for block E (size s)

method to trigger free of block C
method to trigger buffer allocation (size 100,000)
method to trigger buffer free
method to trigger buffer allocation
(size s)
method to trigger buffer free

ProtectedFree(C)

Add block at address C to the
wait list

HeapAlloc(size 100,000) Block at address D

ProtectedFree(D)

Add block at address D to the
wait list

HeapAlloc(size s) Block at address E

ProtectedFree(E) Reclamation Sweep

HeapFree(C) HeapFree(D)

Allocate block at address D
Allocate block at address E

33

Attribute Size Allocation and Freeing
Method of triggering
· SysAllocString / SysFreeString-based string buffers don't use ProtectedFree · CStr defined in MSHTML comes to our aid · CElement::Var_getElementsByClassName
­ Reached by invoking the DOM method getElementsByClassName ­ Creates a CStr containing the string data that was passed in and later deletes using ProtectedFree · getElementsByClassName ­ Accomplish goal of allocating and freeing a buffer of arbitrary size ­ Priming procedure required
· Limitation
­ getElementsByClassName will not use a CStr unless the parameter a string length of at least 0x28 characters ­ CStr allocates size to hold characters (two bytes per char) pluc 6 additional bytes ­ Smallest heap buffer is 0x28*2+6 bytes or 0x56 bytes ­ No upper limit
34

Buffer allocation/ProtectedFree code
Remove complexity of deallocation behaviour due to MemoryProtection
var oDiv1 = document.createElement('div');
// Advance call for string1 window.ref1 = oDiv1.getElementsByClassName(string1);
// Advance call for string2 window.ref2 = oDiv1.getElementsByClassName(string2);
// ...
// Allocate/ProtectedFree a buffer with size of string1 oDiv1.getElementsByClassName(string1);
// ...
// Allocate/ProtectedFree a buffer with size of string1 oDiv1.getElementsByClassName(string1);
// ...
// Allocate/ProtectedFree a buffer with size of string2 oDiv1.getElementsByClassName(string2);
35

Demo
36

Bypassing ASLR with MemoryProtection
37

ASLR Bypass
Question posed by Fortinet
http://blog.fortinet.com/post/is-use-after-free-exploitation-dead-the-new-ie-memory-protector-will-tell-you
38

MemoryProtection as an Oracle

HEAP

STACK

int32
?

Block is waitlisted

HEAP

HEAP

After reclamation, block is still waitlisted
After reclamation, block is free

MemoryProtection's Public Interface
int DllNotification(DWORD fdwReason, LPVOID lpvReserved)   void CMemoryProtector::ProtectCurrentThread()   void CMemoryProtector::ProtectedFree(HANDLE hHeap, void* pMem)  
  
No information is ever returned to the caller.
40

No Feedback Loop
Attacker script

STACK
int32
Memory Protection

We need a side channel.

Operating the browser in a regime of high memory pressure.
42

JavaScript Out-of-Memory Exceptions
43

Script can detect whether an allocation succeeds or fails. Whether an allocation succeeds or fails is a function of the
existing state of the heap.
44

JavaScript out-of-memory exceptions are a side channel that reveals information about the state of the heap.
45

Feedback Loop
Attacker script
JavaScript out-of-memory exception conveys information about heap state

STACK
int32
Memory Protection
HEAP
MemoryProtection modifies heap state

Chain of Deductions
Presence/absence of out-of-memory exception
Current state of heap
How MemoryProtection has behaved Whether guessed address X falls within the targeted block
47

Operating the browser in a regime of high memory pressure.
48

Operating the browser in a regime of limited availability of large contiguous regions of free address space.
49

Playing with Memory Pressure
1MB New 1MB allocation
50

Consulting the Oracle
1MB
51

Consulting the Oracle
1MB New 1MB allocation
52

Consulting the Oracle
1MB Waitlisted 1MB allocation
53

Consulting the Oracle
54

STACK
int32 = X
?
1MB Waitlisted 1MB allocation

Consulting the Oracle: After Reclamation
STACK

STACK

1MB
1MB allocation remains waitlisted

int32 = X

1MB

1MB allocation Is freed

int32 = X

New attempt to allocate 1MB results in an out-of-memory exception
55

New attempt to allocate 1MB succeeds

Operating the browser in a regime of limited availability of large contiguous regions of free address space.
56

Load a module.
57

Loading a Module Into the Hole
wmp.dll
58

ASLR

Demo
59

Recap
· We can abuse MemoryProtection to defeat ASLR · JavaScript out-of-memory exceptions are a side channel that reveals critical information about the state of the
heap · Operating the browser under memory pressure
60

Recommended Defenses
61

Improvements to MemoryProtection
· Remove MemoryProtection from array and buffer allocations.
­ UAFs of arrays and buffers in IE are rare to non-existent ­ Applying MemoryProtection gives a known significant benefit to the attacker
62

Improvements to ASLR
63

Improvements to ASLR
· ASLR chooses a random address to load a requested module · Broken Assumption
­ Random choice exhibits significant entropy, since there will be many address at which the module could load
· Strengthen ASLR by performing an entropy check at module load time
­ Check for minimum entropy level (number of possible load addresses) before loading the module ­ If minimum entropy can not be provided, STOP and do not load the module
· Implement this new check as part of kernel
­ On an opt-in basis for executables such as browsers
· Implement in user-land code
­ Hook relevant system calls
64 [Patent Pending]

Improvements to ASLR

Application

Operating System

Load Library

Determine amount of entropy in the set of virtual addresses at which the requested library
could be loaded

Success

Minimum entropy met. Proceed to load requested library
into address space at virtual address chosen randomly from
among all possible load addresses.

Load Library

Determine amount of entropy in the set of virtual addresses at which the requested library
could be loaded

65 [Patent Pending]

Failure

Minimum entropy not met. Do not load library. Return failure indication to calling application.

Locking employed to ensure that no changes to address availability occur between time of check and time of use
Locking employed to ensure that no changes to address availability occur between time of check and time of use

Eliminate JavaScript Out-of-Memory Exceptions
STACK
int32

Attacker script

HEAP

Memory Protection

JavaScript out-of-memory exception conveys information about heap state
66

MemoryProtection modifies heap state

Additional heap partitioning
· Separate heap for each scalar type
­ UAF can never lead to type confusion ­ Difficult or impossible to produce misalignments ­ May be too wasteful of address space for a 32-bit browser process
67

Digression: Address reuse attack
· Attacker doesn't care about heaps. Attacker cares only about addresses. · Can an address that is part of the IsoHeap at one point in time be part of the process heap at later point in time? · No, not the way IsoHeap is used today. · Small (<0.5MB) allocations are stored in heap segments, and those virtual addresses are never relinquished by the
heap they're part of. · The same is not true for large allocations (>=0.5MB). · It's pointless to try to protect buffers and arrays through heap isolation using the Windows heap manager.
68

32-bit Processes: Security vs Address Space Usage
· We can only create a limited number of heaps. · Defender must make a trade-off. How can we maximize the defender's advantage? · Heap containing the UAF hazard will contain objects of other types as well, and an attacker can always search for
ways to use those types for type confusion and misalignment.
Unless we randomize the heap  type assignments at runtime.
· This denies to the attacker the ability to write a reliable exploit that relies on knowledge of which types are colocated on a heap.
69 [Patent Pending]

Randomized Heap Partitioning

Array has one element for each scalar type defined by the application. Each element holds a handle to the heap that will be used for allocating objects of that type.
Array elements are populated randomly.
70 [Patent Pending]

ARRAY
Heap handle for type A Heap handle for type B Heap handle for type C Heap handle for type D Heap handle for type E Heap handle for type F Heap handle for type G Heap handle for type H Heap handle for type I Heap handle for type J Heap handle for type K Heap handle for type L Heap handle for type M Heap handle for type N Heap handle for type O Heap handle for type P

HEAP HEAP HEAP HEAP HEAP

Effects of Randomized Heap Partitioning
· Exploits become a lot messier, because the types needed for type confusion and/or misalignment are never guaranteed to be on the heap that the attacker needs them to be on
· Failed exploit attempts typically crash the process
­ Noise from crashed processes makes it easier to detect attacks ­ 0-days in the wild can be discovered and patched more quickly ­ When the process is restarted, a new randomization takes place; attacker gains no knowledge from the crash
· Attacker's cost/benefit is degraded
71 [Patent Pending]

Recommended Defenses: Recap
· Remove MemoryProtection from arrays and buffers · Strengthen ASLR by making a positive check for entropy in load address selection · Consider eliminating JavaScript out-of-memory exceptions · One heap per type in 64-bit processes · Randomized Heap Partitioning in 32-bit processes
72

Conclusion
73

Exploit Demo
74

Proof of Concept Release
Test it out yourself
github.com/thezdi
75

Questions
76

