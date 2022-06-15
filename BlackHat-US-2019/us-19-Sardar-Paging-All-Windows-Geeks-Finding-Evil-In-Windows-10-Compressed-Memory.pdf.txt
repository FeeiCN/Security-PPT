Finding in Windows 10

++

Omar Sardar Dimiter Andonov

Omar Sardar
 Staff Reverse Engineer @
­ Reverse engineer malware daily ­ Automate reverse engineering ­ Analyze Windows Internals for Product
 Interests

2

©2019 FireEye

@osardar1

Dimiter Andonov
 Sr. Staff Reverse Engineer @
­ Reverse engineer malware daily ­ Bootkit & Rootkit analysis ­ Analyze Windows Internals for Product
 Interests

3

©2019 FireEye

@dandonov

Story Time

4

©2019 FireEye

Obligatory IDA Screenshot

5

©2019 FireEye

Overview
Memory Manager Crash Course Windows 10 Updates Accessing Compressed Memory Automating Analysis Volatility & Rekall Support Malware Extraction Demo Q&A

6

©2019 FireEye

Memory Manager Overview
Provides process with 2GB to 128TB memory Translates virtual memory to physical memory Moves data to-and-from hard drive (paging)  Book-keeping

7

©2019 FireEye

Virtual Memory
Windows grants a new x64 process with 8TB
­ System doesn't have 8TB for each process ­ 8TB memory space is virtual ­Data is accessed by reading from an address ­Pages are 0x1000 bytes ­ Location of actual data is transparent

8

©2019 FireEye

Breaking Down a Virtual Address
0xD1A7460000

000000001 PML4

101000110 PDPT

100111010 PD

001100000 PT

Memory address is a series of indices & offset Each index represents an entry in a table The last table contains Page Table Entries

000000000000 Offset

9

©2019 FireEye

Page Tables (x64)

CR3
PML4E [0] PML4E [1] PML4E [2] PML4E [511]

PDPTE [0] PDPTE [1] PDPTE [2] PDPTE [326]
PDPTE [511]

©2019 FireEye

PDE [0] PDE [1] PDE [2] PDE [314]
PDE [511]

PTE [0] PTE [1] PTE [2] PTE [96]
PTE [511]

Page Table Entries (PTEs)
kd> dt nt!_MMPTE* ntkrnlmp!_MMPTE ntkrnlmp!_MMPTE_SUBSECTION ntkrnlmp!_MMPTE_HARDWARE ntkrnlmp!_MMPTE_SOFTWARE ntkrnlmp!_MMPTE_PROTOTYPE ntkrnlmp!_MMPTE_TIMESTAMP ntkrnlmp!_MMPTE_LIST ntkrnlmp!_MMPTE_TRANSITION
11 ©2019 FireEye

_MMPTE_SOFTWARE
12 ©2019 FireEye

Valid PageFileReserved PageFileAllocated
ColdPage SwizzleBit Protection Prototype Transition PageFileLow UsedPageTableEntries ShadowStack Unused PageFileHigh

_MMPTE_SOFTWARE Example
13 ©2019 FireEye

Demand-Paging Model

14 ©2019 FireEye

?

Case for Compression
Accessing data from a hard drive is Accessing data from RAM is Modern operating systems compress memory
­Allows for more data to be stored in RAM ­Highly parallelizable operation ­ Flexible kernel deployment
15 ©2019 FireEye

Mystery Pagefile
16 ©2019 FireEye

MMPAGING_FILE
Structure used to represent traditional pagefiles Now supports Virtual Stores Check VirtualStorePageFile for confirmation Array of pagefiles located at nt!MmPagingFile
17 ©2019 FireEye

Store Manager
Storage allocation & content tracking Encryption & compression Add, retrieve, or remove data Each store page is represented by a key Supports memory compression
18 ©2019 FireEye

Virtual Store
Created by the Store Manager XPRESS Compression Format Pages stored in MemCompression 1 Page : 1 Key
19 ©2019 FireEye

Store Manager Page Key (ALG0)

Valid PageFileReserved PageFileAllocated
ColdPage SwizzleBit Protection Prototype Transition PageFileLow UsedPageTableEntries ShadowStack Unused PageFileHigh
20 ©2019 FireEye

PageFileLow

PageFileHigh

(PageFileLow << 28) | PageFileHigh

SM_PAGE_KEY (ALG0)

21 ©2019 FireEye

20017A4D

Store Manager Page Key (ALG1)

Valid PageFileReserved PageFileAllocated
ColdPage SwizzleBit Protection Prototype Transition PageFileLow UsedPageTableEntries ShadowStack Unused PageFileHigh
22 ©2019 FireEye

PageFileLow PageFileHigh

SwizzleBit

(PageFileLow << 28) | ((PageFileHigh) & ~InvalidPteMask)

SM_PAGE_KEY (ALG1)

23 ©2019 FireEye

20024EDF

Dude, Where's my Page?
24 ©2019 FireEye

Navigating the Store Manager
25 ©2019 FireEye

Finding Your Store
Journey begins at nt!SmGlobals Calculate SM_PAGE_KEY Search B+TREE for key Determine store containing key
26 ©2019 FireEye

B+TREE Layout

Tree Root

Key

# Entries

Key

Key

Key

27 ©2019 FireEye

Key Store Flags Key Store Flags Key Store Flags Key Store Flags Key Store Flags Key Store Flags
Key Store Flags

Traversing a B+TREE

a4163000 62,720

000200a2 2001a210 2001c460

a415d000 a5c01000 a875f000

2001e6bc a2546000

2001B68F
28 ©2019 FireEye

2001a210 0000

3

2001ac16 0000

3

2001b687 0000

3

2001b688 0000

3

2001b689 0000

3

2001b68f 0000

3

2001b691 0000

3

Finding Your Store
29 ©2019 FireEye

SMKM_STORE & Family
Store-specific structures
­All information leads to locating a page record
 SMKM_STORE
­Pointer to an array of pointers to regions of compressed pages
 ST_DATA_MGR
­Chunk keys, compression format, region indices
 SMHP_CHUNK_METADATA
­Array of chunks that contains vectors of page records
30 ©2019 FireEye

Deriving Page Virtual Address
Obtain Chunk Key from local B+TREE Chunks lead us to ST_PAGE_RECORD ST_PAGE_RECORD leads us to a Region Regions lead us to
31 ©2019 FireEye

MemCompression
Compressed pages previously stored in System Storage container for all compressed data Minimal process
­No PEB or user threads, NTDLL is not mapped
Minimal threads (No TEB)
­Page compression ­Page read/write ­Page swapping
32 ©2019 FireEye

The Big Picture
?
33 ©2019 FireEye

34
©2019 FireEye

Structure Extraction Automation

Windows 10

0 17134 117

OS Name Major Minor Build Revision

Structures change between builds Analysis effort is ~8h/kernel Too many kernels Automated analysis desired

35 ©2019 FireEye

FLARE-EMU
IDA Pro Unicorn Written by Tom Bennett @ Scriptable emulation framework Rapid prototyping
36 ©2019 FireEye

FLARE-EMU
Analyzed ~10 kernels manually Discovered commonalities
­ Structure locations ­Function prototypes ­Order of operations ­ Data usage patterns ­ Callstacks
37 ©2019 FireEye

Automate This
©2019 FireEye

FLARE-EMU
ST_DATA_MGR
AaAbAcAdAeAfAgAhAiAjAkAlAmAnA oApAqArAsAtAuAvAwAxAyAzBaBbBc BdBeBfBgBhBiBjBkBlBmBnBoBpBqB rBsBtBuBvBwBxByBzCaCbCcCdCeCf CgChCiCjCkClCmCnCoCpCqCrCsCtC uCvCwCxCyCzDaDbDcDdDeDfDgDhDi DjDkDlDmDnDoDpDqDrDsDtDuDvDwD xDyDzEaEbEcEdEeEfEgEhEiEjEkEl EmEnEoEpEqErEsEtEuEvEwExEyEzF aFbFcFdFeFfFgFhFiFjFkFlFmFnFo FpFqFrFsFtFuFvFwFxFyFzGaGbGcG dGeGfGgGhGiGjGkGlGmGnGoGpGqGr GsGtGuGvGwGxGyGzHaHbHcHdHeHfH gHhHiHjHkHlHmHnHoHpHqHrHsHtHu HvHwHxHyHzIaIbIcIdIeIfIgIhIiI jIkIlImInIoIpIqIrIsItIuIvIwIx IyIzJaJbJcJdJeJfJgJhJiJjJkJlJ mJnJoJpJqJrJsJtJuJvJwJxJyJzKa KbKcKdKeKfKgKhKiKjKkKlKmKnKoK pKqKrKsKtKuKvKwKxKyKzLaLbLcLd LeLfLgLhLiLjLkLlLmLnLoLpLqLrL sLtLuLvLwLxLyLzMaMbMcMdMeMfMG
39 ©2019 FireEye

FLARE-EMU
0x20101000 0x1163
0x31001200 0x1423
0x20001400 "Km"
40 ©2019 FireEye

AaAbAcAdAeAfAgAhAiAjAkAlAmAnA oApAqArAsAtAuAvAwAxAyAzBaBbBc BdBeBfBgBhBiBjBkBlBmBnBoBpBqB rBsBtBuBvBwBxByBzCaCbCcCdCeCf CgChCiCjCkClCmCnCoCpCqCrCsCtC uCvCwCxCyCzDaDbDcDdDeDfDgDhDi DjDkDlDmDnDoDpDqDrDsDtDuDvDwD xDyDzEaEbEcEdEeEfEgEhEiEjEkEl EmEnEoEpEqErEsEtEuEvEwExEyEzF aFbFcFdFeFfFgFhFiFjFkFlFmFnFo FpFqFrFsFtFuFvFwFxFyFzGaGbGcG dGeGfGgGhGiGjGkGlGmGnGoGpGqGr GsGtGuGvGwGxGyGzHaHbHcHdHeHfH gHhHiHjHkHlHmHnHoHpHqHrHsHtHu HvHwHxHyHzIaIbIcIdIeIfIgIhIiI jIkIlImInIoIpIqIrIsItIuIvIwIx IyIzJaJbJcJdJeJfJgJhJiJjJkJlJ mJnJoJpJqJrJsJtJuJvJwJxJyJzKa KbKcKdKeKfKgKhKiKjKkKlKmKnKoK pKqKrKsKtKuKvKwKxKyKzLaLbLcLd LeLfLgLhLiLjLkLlLmLnLoLpLqLrL sLtLuLvLwLxLyLzMaMbMcMdMeMfMG

Field Offset Located
>>>pattern.find("Km")
0x220
41 ©2019 FireEye

Rinse & Repeat
42 ©2019 FireEye

43 ©2019 FireEye

"With Windows 10 you're not getting data you'd expect because it's compressed in memory..."
- Andrew Case
44 ©2019 FireEye

Volatility & Rekall



research integrated into plugins

­ Blaine Stancill (Volatility Lead) ­ Sebastian Vogl (Rekall Lead)

45 ©2019 FireEye

Plugin's Baby Steps
Compressed Address

Decompressed Data

46 ©2019 FireEye

volshell
47 ©2019 FireEye

Transparent Translation
48 ©2019 FireEye

modules
49 ©2019 FireEye

dlllist -p 2444
50 ©2019 FireEye

driverscan
51 ©2019 FireEye

ldrmodules
52 ©2019 FireEye

hashdump
53 ©2019 FireEye

Unlocked Data
54 ©2019 FireEye

Malware Overview

EXE

DLL

Shellcode

Shellcode

Comms

55 ©2019 FireEye

Payload EXE

Server DLL

Get the Basics (imageinfo)
56 ©2019 FireEye

pstree
57 ©2019 FireEye

dlllist -p 5684
58 ©2019 FireEye

handles -p 5684 -t mutant
59 ©2019 FireEye

Fails
malfind handles (file) procdump dlldump vaddump
60 ©2019 FireEye

Malware Overview

EXE

DLL

Shellcode

Shellcode

Comms

61 ©2019 FireEye

Payload EXE

Server DLL

handles -p 5684 -t mutant / file
62 ©2019 FireEye

malfind -p 5684

63 ©2019 FireEye

Shellcode

malfind -p 5684
64 ©2019 FireEye

Server DLL Strings
65 ©2019 FireEye

Payload Strings
66 ©2019 FireEye

Malware Overview

EXE

DLL

Shellcode

Shellcode

Comms

67 ©2019 FireEye

Payload EXE

Server DLL

Enhanced Analysis
68 ©2019 FireEye

Call It a Day
69 ©2019 FireEye

github.com/fireeye flare-on.com
win10_volatility win10_rekall win10_auto flare-emu

Omar Sardar ­ Technical Lead (2016+) Claudiu Teodescoru ­ Technical Lead (2016) Dimiter Andonov ­ Windows Research (2017+) Blaine Stancill ­ Volatility Integration (2019+) Sebastian Vogl ­ Rekall Integration (2016+)
win10_volatility win10_rekall win10_auto flare-emu

