Security Analysis of CHERI ISA

Saar Amar
Security Researcher MSRC

Nicolas Joly
Security Engineer MSRC

* This presentation is for informational purposes only. MICROSOFT MAKES NO WARRANTIES, EXPRESS OR IMPLIED, IN THIS SUMMARY.

Why are we here? Why CHERI?

· We're haunted by memory safety issues
· Enforcing memory safety is a nontrivial problem
· There are safe languages, Rust, .Net... · Too costly to rewrite everything
· So we keep pushing more mitigations · And we keep getting owned

MSRC Cases Number / Year (Memory Safety Issues)
1500

1000

500

0 2016

2017

2018

2019

2020

· What about hardware solutions?
· Let's explore CHERI!

CHERI ISA 101
· Capability Hardware Enhanced RISC Instructions
· Extends conventional hardware ISAs (AArch64, MIPS, RISC-V) with new architectural features to enable fine-grained memory protection
· Supports hybrid operation mode
· CHERI introduces capabilities
· Unforgeable, bounded references to memory · Have base, length, permissions, and object type
· Each 16 bytes within a cacheline has 1 bit for tag
· Enforces non forgeability while the capabilities are stored to memory · Reading/writing capabilities from/to memory requires special dedicated instructions

CHERI capabilities

Virtual address space

1-bit tag
128-bit capability

v permissions

otype

Bounds compressed relative to address

Virtual address (64 bits)

Allocation

· CHERI capabilities for 64-bit AS machines are 129-bit structures with...
· A 1-bit out-of-band tag, differentiating unstructured data from capability · Tags held in-line in registers and caches, "somewhere unseen" in memory · Storing data anywhere within a 128-bit granule of memory clears the associated tag · Loads, stores, jumps, etc. using a clear tag ==> CPU exception
· Compressed bounds limit reach of pointer · Floating-point compression technique (mild alignment requirements for large objects) · Address can wander "a bit" out of bounds; nearly essential for de facto C programming!
· Permissions field limits use; architecture- and software-defined permission flags
· Object Type field for sealed (immutable, non-dereferencable) caps

Compiling C to CHERI

Language-level memory safety

Pointers to heap allocations

Function pointers

Pointers to stack allocations Pointers to TLS variables

Pointers to global variables
Pointers to memory mappings
Pointers to subobjects

GOT Return pointers addresses
Stack pointers

Vararg array pointers
C++ v-table pointers

PLT entry pointers
ELF aux arg pointers

Sub-language memory safety

 CHERI capabilities used for both
· Language-level pointers visible in source program
· Implementation pointers implicit in source

 Compiler generates code to
· build vararg arrays and bound caps thereto · bound address-taken stack allocs & sub-objects

 Loader builds capabilities to globals, PLT, GOT
· Derived from kernel-provided roots · Bounds applied in startup, pre-main() code

 Small changes to C semantics!
· memmove() preserves tags · Pointers have single provenance · Integer  pointer casts require some care

See CHERI C/C++ Programming

Guide.

6

SIGPROT here

Set bounds

The allocator allocates and sets bounds
Write 0x41 to the capability. SIGPROT here

Security implications for the exploit writer
· As capabilities have a length, CHERI ISA enforces spatial safety in the architectural level!
· Two main impacts:
· OOBs vulnerabilities are deterministically mitigated and no longer a security concern
· One can't manufacture a pointer · Makes it much harder to build a "generic" arbitrary read/write primitive
· In summary, CHERI ISA is a game changer for the attacker
· Let's see some quick examples

Advantages
Technique
Corrupt absolute pointers
Corrupt least significant byte(s) (LSBs) of an existing pointer
Corrupt metadata as size/count/length/index of strings/vectors/arrays/etc.
Intra object corruption: · Static buffers in a structures · Adjust pointers via arithmetic (while still in-
bounds)

How CHERI ISA mitigates it
Tag bit violation Tag bit violation
Length violation
Length violation; requires a special LLVM flag

Memory safety issues
· While CHERI deterministically mitigates spatial safety at the architectural level, some bug-classes resist
· Temporal safety issues are still exploitable
· double frees, UAFs, dangling pointers, etc.
· Type confusions are still exploitable
· Uninitialized stack/heap are still exploitable
· There is a great work-in-progress to mitigate these bug-classes with additional software mitigations
· Note that even if these bugs are exploitable, the exploitation is significantly harder, thanks to CHERI ISA

Vulnerabilities && exploits
Let the fun begin!

Possible attacks ­ examples
· As CHERI-ISA doesn't mitigate type confusions, we can create type confusions scenarios between C++ objects
· Very powerful exploitation primitive, as we can call arbitrary methods in existing objects' vtables
· while the entire objects' metadata is "corrupted" · very similar to the PAC bypass in ObjC that relies on isa ptr being unprotected
· Of course, type confusions can be exploited in many ways:
· corrupt metadata and escalate privileges (read-only attacks, etc.) · information disclosures (some models such as Chrome's sandbox for Windows rely on
secrets)

https://saelo.github.io/presentations/36c3_messenger_hacking.pdf

https://saelo.github.io/presentations/36c3_messenger_hacking.pdf

Exploitation over CHERI ISA
· Usually, the circle of life works as follows; we
· find an awesome 0day · shape some memory layout · trigger the vulnerability, corrupt some target structure · gain relative/arbitrary RW · game over
· With CHERI, the "gain relative/arbitrary RW" phase is broken!
· in order to gain a generic arbitrary RW, we need to gain a capability with a length that spans the entire virtual address space
· there is no reason the allocator will generate such a capability · yes, we have to make sure the allocator checks metadata before using it 

Exploitation over CHERI ISA
· CHERI introduces a new restriction ­ we can't corrupt pointers
· vtables, function pointers, etc. · return addresses, LRs, etc. · structures, buffers, etc.
· Including no partial corruption (LSB, etc.)
· What we can do, is move an existing capability to another address
· Example: exploit a UAF by replacing structure A with structure B, such that we have different vtable/pointers at the same offsets
· Such "type confusions" yield very powerful primitives

Exploitation over CHERI ISA
· Note that given CHERI, bypassing ASLR gives us nothing
· We can't corrupt pointers at all, so there is 0 value for knowing the layout of virtual addresses of stack, heap, libs, etc.
· Actually, when building CHERI, one of the considerations was to assume a model without ASLR at all
· i.e. ­ in the threat model, we assume we give everyone the memory layout
· Clearly, information disclosure is still in the threat model!
· Leak secrets/data that should not be leaked · Good example: leak port names to escape the Chrome sandbox on Windows

JSC
· Java Script Core, a built-in JavaScript engine for WebKit
· We have a working build of JSC and Webkit over purecap CHERI
· Great place to exploit vulnerabilities in
· Scripting language · JIT (as of today, supported only in Morello-qemu)
· Many RCEs vulnerabilities
· Especially in the JIT compiler

Vulnerability #1 ­ JSC uninitialized stack
· Very powerful uninitialized stack vulnerability
· https://trac.webkit.org/changeset/244058/webkit
· Bug 196716
· Credit: Bruno (@bkth_)
· Luca Todesco (@qwertyoruiop) did an amazing job exploiting it
· https://iokit.racing/jsctales.pdf · Check it out!
· Let's dig into the root cause of the bug

Register allocation
· Registers are a limited resource
· There are algorithms that assign registers dynamically
· In order to free some registers up when there are none available, we need to store the existing ones to memory, and restore them later
· In many cases, these values are being spilled to the stack
https://iokit.racing/jsctales.pdf

The vulnerability
· JSC objects are garbage collected
· Upon entry, GC marks from top of the stack -> current stack frame
· The register allocator assumes allocations happen unconditionally
· Conditional branch may skip register allocation and the potential spill to the stack
· If there is a flow where a variable corresponding to the supposedlyspilled register is later used, it will be used as an uninitialized data from the stack
· JIT assumes the mentioned variable holds a JS value of a specific type
· We can use a JS value of any other type
· Which gives us a type confusion 
https://iokit.racing/jsctales.pdf

SpeculativeJIT::compileStringSlice

Register allocation

Conditional branch
https://iokit.racing/jsctales.pdf

SpeculativeJIT::compileStringSlice

Register allocation, potentially needs to spill values to the stack

Conditional branch
https://iokit.racing/jsctales.pdf

SpeculativeJIT::compileStringSlice

Register allocation, potentially needs to spill values to the stack Not executed

Conditional branch Taken
https://iokit.racing/jsctales.pdf

Control the uninitialized
· Again ­ we cannot corrupt pointers · But we can trigger a legit code to write a valid capability to memory · So, we can:
· call a function that allocates a temporary stack frame · write a capability that points to obj1 · return, call another function that uses the same stack address and assumes there is a
capability to obj2
https://iokit.racing/jsctales.pdf

Type confusion -> OOB read

Useless array accesses, makes a large stack frame allocation
Type Proof (makes DFG emits StructureChecks on |ary1|)
Trigger the bug, string slice
GetByOffset, but instead on ary1 of a proven type, on an arbitrarily typed read from the stack https://iokit.racing/jsctales.pdf

OOB read
· So, let's define
· Repeat the second type because different types are allocated in different areas, and we want two continuous allocations on the heap
· Fetch obj2.a · Due to the type confusion, the JITed code thinks the type is proven to be
obj1, and fetches using offsetof(obj1, a), which is OOB to obj2
https://iokit.racing/jsctales.pdf

OOB? But we have CHERI!
· Yes, we do have CHERI. And Capabilities do mitigate spatial safety
· If you set the bounds correctly in the relevant allocator
· In the current existing prototype, capabilities' lengths were set by the allocators for stack, heap and global
· But the JSCell heap does not do it yet  · Capabilities have 16kb for bounds · Was fixed in a dev branch
· Therefore, this technique works on Morello just as it works on Ubuntu x64 or on iOS

Work in progress by Brett Gutstein, University of Cambridge. commit

StructureID Randomization
· Each JSCell header references a Structure through the StructureID field
· 32 bit · index into the Runtime's StructureIDTable
· Attackers (supposedly) need to know a valid StructureID to fake objects
· To bypass many StructureChecks
· In order to make it harder to guess/predict StructureIDs, Apple added randomization for StructureIDs
· Leaking these values helps during exploitation
· Note that unlike ASLR, StructureIDs could help us
· We can fake StructureIDs, as they are simply a 32bit integer

Vulnerability #2: a stack UAF
· JSC on CheriBSD (Aug 2020)
· No JIT (MIPS not supported by QTWebkit) · Garbage collection doesn't work · No CVE really satisfying our needs
· Let's introduce a serious bug instead
· Let's introduce a stack UAF · Temporal safety issue, allows read and write to a large portion of the stack · Would that be sufficient for an attacker?

Vulnerability #2: a stack UAF in details
· We introduced a bug within the handling of arraybuffers · Provides read/write access to the stack for a malicious ArrayBuffer
· To trigger:

What can we do with this vulnerability?

· Can we find a way to manipulate capabilities in the stack?
· Ideally we'd want to be able to copy / paste capabilities anywhere in memory

JSC's stack:

ArrayBuffer

Heap pointer ...
Stack cap 1 ...
Return address ...
Stack cap 2 ...
Return address ...

Find a way to copy stack capabilities without losing the v bit:

Saar's RW primitive
Another ArrayBuffer Stack cap 1

· Let's look at TypedArray::set() and slice()...

What can we do with this vulnerability?
· For set(), if typeof(dest) = typeof(source), there's a nice memmove():
· We can then copy capabilities present in the stack to another ArrayBuffer

What can we do with this vulnerability?
· Can we traverse pointers and read from anywhere?
· Not from anywhere, this has to be from a valid capability · With reentrancy applied on the length argument, we can execute a callback and
change the source object:

What can we do with this vulnerability?
· Can we now write a capability anywhere?
· Again, not anywhere, this has to be a location pointed by a valid capability · The vulnerability already allows to write data to a large portion of the stack · We could potentially swap return addresses
· This would require building a stack such that unwinding from one place to another would lead to an exploitable path
· Difficult to build, especially with the limited environment (no JIT)
· There's the Cheri Capability Table!
· Contains a pointer to libc.system · That will be our target

How to get code execution?

· The Cheri Capability Table is roughly equivalent to a GOT section

· The compiler uses this table all around, so we can easily read it, and read from it:

JSC's Stack:

Capability Table

ArrayBuffer

Heap pointer ...
CheriCapTable ...
Return address ...
Stack cap ...
Return address ...

JSC's functions __start
Function1 ...
Function n ...
LIBC ...
System()

What can we do with this vulnerability?
· That's our road map
· Read valid capabilities from the stack (stack addresses, return addresses, etc) · Find one that seems interesting and traverse it (likely a stack address)
· Read again from that capability until we find what we're looking for · A pointer to the Cheri Capability Table
· Once there, read the pointer to System()
· How to get RCE?
· We can't just overwrite a return address because of the calling convention · We can however build a fake vtable or a fake capability table with System() · We could next overwrite a saved vtable with our fake one · And wait for the flow to run our payload

How to get code execution?

· We can then overwrite the pointer to the capability table and get code

execution by forging a fake table:

Attacker controlled

JSC's Stack:

JSC's Stack:

Arraybuffer

Heap pointer ...
Saved CheriCapTable ...
Return address ...
Stack caps ...
Return address ...

Overwrite the pointer using the vulnerability

Heap pointer ...
MyArrayBuffer ...
Return address ...
Stack caps ...
Return address ...

... ... ... ... ... ... ... ... ... System()

ArrayBuffer

And wait for the stack to unwind and the code to use our malicious pointer

No calc, but a ping!
· The result isn't very impressive, but that works!

Hardening CHERI

Take it further
· As we saw, CHERI ISA gives us: · unforgeable pointers · mandatory bounds and permissions checks
· A CHERI-aware C compiler and runtime give us: · deterministic mitigations for spatial safety · with compile-time opt-in intra-object safety, even!
· And we left with... · temporal safety: UAF / double free / dangling pointers / etc. · type safety · allocator safety
· There are many work-in-progress projects to introduce software solutions for that

Capability revocation ­ Cornucopia
· Demonstrated deterministic C/C++ heap temporal memory safety · Extends the CheriBSD virtual memory subsystem · Built with existing CHERI tags, spatial safety, and page table perms:
· Scan for capabilities in memory: tags precisely distinguish caps from data · Associate heap cap with its original allocation via spatial bounds · Track pages holding caps using capability store PTE permissions
· Userspace allocators mark regions of memory as free
· Kernel-provided revocation service finds and removes caps to free memory
· Thread-safe, mostly concurrent, amenable to SMP or hardware acceleration
· Free memory held "in quarantine" to amortize costs of revocation sweep
· Available in branch of CheriBSD; MSR investigating optimizations

JIT hardening using CHERI
· JIT is always a sensitive and dangerous area
· Support for JIT over CHERI is relatively new and it's just a prototype
· There is a place for a lot of research in this area 
· Interestingly, CHERI ISA offers new ways to implement hardenings, using capabilities
· Example: instead of having one physical page with two different virtual mappings (rw-, r-x), we can have two different capabilities
· So, we need to remove any flow from the ExecutableAllocator that returns a capability that is both +W and +X
· commit

Work in progress by Brett Gutstein, University of Cambridge. commit

Takeaways

Conclusions
· CHERI ISA mitigates a wide range of bug classes
· Spatial safety
· CHERI ISA significantly raises the bar for exploitation
· Kills a lot of the common exploitation techniques used today
· CHERI offers new kind of abilities (in the ISA level) to take advantage of when building new solutions in software
· There is still much to research, innovate, and develop in this area 

Shoutout
· David Chisnall · Wes Filardo · Brett Gutstein
· All of MSRC && MSR

Refs
· CHERI
· Security analysis of CHERI ISA
· https://github.com/CTSRD-CHERI
· CHERI: A Hybrid Capability-System Architecture for Scalable Software Compartmentalization
· Cornucopia: Temporal Safety for CHERI Heaps

Q / A

