Heap Spray Detection with Heap Inspector
Aaron LeMasters MANDIANT
© Copyright 2010

Please complete the Speaker Feedback Surveys!
© Copyright 2010

Introduction
 About me  Purpose of this talk  Goals
- What is an application storing? How is it storing it? - Visualization
 Current research
- EMET, STRIDE, Nozzle, HeapLocker
© Copyright 2010

What can I do with this tool?
 We will focus on two primary use cases:
- Detect/visualize heap sprays - Search for PII
 Other uses
 Reverse memory structures  Debug heap anomalies  Vulnerability research / exploit dev (future)
© Copyright 2010

Features
 View heap allocations in a spatial arrangement  View heap contents in an embedded hex viewer  Search for byte patterns, regexes and strings  Export heap chunks to use in other tools  It comes in two forms:
- Command line exe/dll - C# user interface
© Copyright 2010

Basic Windows Heap Mechanics
 A process has a default heap and one or more private heaps:
- Heaps are made up of one or more segments - Segments are made up of one or more chunks - Chunks have the data you care about
 This is all you need to know to understand Heap Inspector
- For an in-depth discussion of heap internals, see Chris Valacek's talk
© Copyright 2010

How does a heap spray work?
 A heap spray is a technique to stage shellcode  Meant to increase the reliability of exploiting memory
corruption vulnerability  Most commonly seen in applications that host JIT
engines (flash, java, etc), such as web browsers and document readers (Adobe, MS Word)
- CVE-2011-0609, CVE-2010-1297, CVE-2010-3973, CVE2010-3971, just to name a few
 Heap spraying just allocates the same block of data hundreds of times
- We use this to our advantage
© Copyright 2010

Heap Inspector User Interface
© Copyright 2010

The heap hash map
Looking for heap sprays
 Groups heap chunks across all heaps that have the same CRC32 (same color = same hash)
 Useful for spotting heap sprays
Visualization of successful heap spray in Adobe Reader (CVE-2010-2883)
© Copyright 2010

The heap data map
Looking for PII
 Overlay regular expression matches on the heap map
© Copyright 2010

Searching
 String (unicode/ascii), byte and regex searching
 This looks like some sort of data structure...
© Copyright 2010

How does it work?
 C# application injects a C++ DLL using standard DLL injection
- Also supported: LdrLoadDll and Reflective Injection [3]
 DLL acts as a server, receives messages from C# app and sends back data over named pipe
- C#/Interop - Uses standard Win32 heap walking API's - Raw parsing partially implemented
 Why Inject?
- To get access to private heaps!
© Copyright 2010

Caveats and Technical challenges
 DLL injection inherent caveats:
- Instability due to synchronization issues (single-threaded to multi-threaded ­ thread safe?)
- Instability due to deadlock conditions: accessing/locking heaps in use - Upon loading, entry point of every other DLL in process is called (side effects??)
 Sandboxed processes (ahem, Chrome):
- Hooking - Least-privilege, isolation (job object, different desktop) - Injection solution: Use Stephen Fewer's reflective DLL injection technique
 Problem: least privilege token ­can't do anything!
 Other issues
- Injecting into a service - Session separation introduced in Vista
 Use NtCreateThreadEx - Universal injection across sessions
 Terminal services (XP), Vista session separation - Wow64/Stub32 - Access violations: use SEH instead of C++ exception handling - Smss.exe ­ doesn't fully map in kernel32.dll ­ AV = BSOD!
© Copyright 2010

DEMO: Extracting shellcode from a successful heap spray
© Copyright 2010

But I can already do that ...
 Debugger
- Requires skillz ­ OS/heap internals knowledge
 Instrumentation
- Requires code analysis, disassembly, heuristics - Overhead - False +/-
 Memory analysis
- Requires OS internals knowledge - Data explosion - Smear - Stale
© Copyright 2010

Future Direction
 Real-time detection of heap-spray  Vulnerability research applications
- Real-time heap modification - Taint analysis through "heap stalking"
 Memory images as input
- Will take advantage of raw method
© Copyright 2010

References / Further reading
 Chris Valasek, Understanding the Low Fragmentation Heap, http://illmatics.com/Understanding_the_LFH.pdf
 Microsoft, CreateRemoteThread, http://msdn.microsoft.com/enus/library/ms682437%28VS.85%29.aspx
 Stephen Fewer, Reflective DLL Injection, http://www.harmonysecurity.com/files/HS-P005_ReflectiveDllInjection.pdf
 Didier Stevens, HeapLocker, http://blog.didierstevens.com/2010/12/06/heaplocker/
 Microsoft Research, Nozzle, http://research.microsoft.com/apps/pubs/default.aspx?id=76528
 Microsoft Research, Enhanced Mitigation Experience Toolkit v2.0, http://www.microsoft.com/download/en/details.aspx?id=5419
 Akritidis, et al, STRIDE: Polymorphic Sled Detection Through Instruction Sequence Analysis, http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.79.5094&rep=rep1& type=pdf
 Bania, JIT Spraying and Mitigations, http://www.kryptoslogic.com/download/JIT_Mitigations.pdf
© Copyright 2010

MANDIANT is hiring!
© Copyright 2010

Please complete the Speaker Feedback Surveys!
© Copyright 2010

Questions? Aaron.LeMasters@Mandiant.com
@lilhoser
© Copyright 2010

