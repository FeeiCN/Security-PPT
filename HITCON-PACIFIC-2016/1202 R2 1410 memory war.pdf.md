Memory Wars: 
Leo Liaw  Authorized Morphor distributor

Agenda

 

 We need to do better

 How Windows execute an executable?

 Before and After

 What is PE?

  (EMET)

 EMET   EMET 

 EMET/ASLR 

|2


|3





· Buffer overflow (heap  stack)
· Type confusion · Use-after-free (UAF)
· Integer overflow · stack corruptions · Inter-chunk heap overflow or
corruption

· Intra-chunk heap overflow
or relative write
· Shader Parameter heap
corruption
· ........

|4


        Everything bad all because of you
|5

:
CVE-2016-4117
: Type confusion
1.  Office  1. Office  Flash  1.  Flash Player  2.  Flash Exploit (Type Confusion/All Memory Attack  , Devils are here)
2. Exploit  Shellcode 1. Shellcode  Shellcode
3.  Shellcode 1.  Malware 2.  Decoy 
4. Malware  Command and Control (C2)  
Source: https://tirateunping.wordpress.com/2016/05/17/cve-2016-4117-fireeye-revealed-the-exploit-chain-of-recent-attacks/
|7

 
| 11

How Windows execute an executable?

Process Creation Overview
1. .EXE is loaded from disk
 Parse PE headers  Map sections into memory  Parse Import Table
2. Load DLL dependencies
 Resolve import API functions
Figure Source: Memory Management 1 © 2000 Franz Kurfess Course
3. Transfer execution to the .EXE Entry Point Overview Principles of Operating Systems Introduction Computer System Structures Operating System.  AddressOfEntryPoint
| 14

Process Memory
 Windows implements a virtual memory model
 Virtual memory is independent of physical memory
 Every process had its own private virtual address space
 Process are isolated and cannot inadvertently modify each others memory
 Physical-to-virtual memory translations are managed in the Windows kernel
 Completely transparent to user process
| 15

EXE file launching
 Each time an executable (.EXE) is launched, Windows will
 Validate the PE image and parameters  Create a virtual address space where the program will be loaded
and executed
 The virtual address space contains:
 All of the executable's code and data (the .EXE itself)  All of the DLL dependencies code and data (required .DLLs)
| 16

Process Memory Layout
 PE files define a preferred base memory address in the Optional Header:
 EXE default: 0x400000  DLL default: 0x10000000
 DLLs can be relocated by the Windows loader
 Occurs when preferred address already in use  Relocatable Dlls have a special .reloc section
 ASLR (Address Space Layout Randomization) ensures DLLs will be moved
| 17

What is PE and Why it is so important?

PE File format - Overview
Portable Executable (PE) file is the standard binary file format for Windows executables
 .EXE
 Executable program. The Windows OS creates a virtual address space for program to run.
 .DLL
 Dynamic Link Library. Windows concept of shard library. Also referred to as a module
 .SYS
 Kernel driver. Executes in kernel-mode alongside core OS components
| 19

PE File Format ­ Header and Sections
 The PE file format is a structured organization of Headers and Sections  Header tell the OS how to interpret the PE file
 Type of the PE file (EXE/DLL/SYS)?  What memory location does execution begin? (Entry Point)  How should the sections be arranged in memory? (Section headers)  What DLL dependencies does the EXE need? (Imports)  What functionality does the PE file expose to other applications? (Exports)
 Sections store the PE file content. This includes:
 Executable code  Program data  Binary resources
| 20

PE File Format ­ PE Optional Header
 The PE Optional Header is used to store NT-specific attributes. On NT systems the "optional" header is required.
 ImageBase
 Tells the OS its preferred base memory address
 AddressOfEntryPoint
 Tells the OS where to start executing
 Other metadata:
 Subsystem: (e.g., GUI, Console, Native, WinCE, etc.)  DllCharacteristics: Security-related linker options (e.g., ASLR, NX, DEP, SAFESEH)  Minimum supported NT version
| 21

DllCharacteristics
Figure Source: http://www.cnblogs.com/shangdawei/p/4785494.html



Enhanced Mitigation Experience Toolkit, EMET
·  
·  
· 
· DEP (Data Execution Prevention) · SEHOP (Structured Exception Handling Overwrite Protection
) · ASLR (Address Space Layout Randomization)
Source: https://support.microsoft.com/zh-tw/kb/2909257

EMET 

SoSuorucrec:eE: EMMEETT55..55UUsseerr''ss GGuuiiddee,,MMicicrroossooftftDDoowwnlnolaodadCeCnetnerter

Source: EMET 5.5 User's Guide, Microsoft Download Center

Source: EMET 5.5 User's Guide, Microsoft Download Center

Figure Source: Computer Science 10/06/051 Address Space Layout Permutation Chongkyung Kil Systems Research Seminar

EMET

Cat and Mouse
 Defense: Make stack/heap nonexecutable to prevent injection of code
 Attack response: Jump/return to libc
 Defense: Using ASLR to hide the address of desired libc code or return address
 Attack response: Brute force search (32-bit systems) or information leak (format string vulnerability)
 Defense: Avoid using libc code entirely and use code in the program text instead
 Attack response: Construct needed functionality using Return Oriented Programming (ROP)
Source: https://www.youtube.com/watch?v=XZa0Yu6i_ew, Return Oriented Programming ­ ROP, Maryland Cyber Security Center | 41

Figure Source: http://www.slideshare.net/saumilshah/exploit-delivery/13-netsquareGSSafeSEHDEPASLRPermanent_DEPASLR_and_DEPSEH_overwritesnonSEH

| 42

EMET 1.x, released in October 27, 2009
 Structured Exception Handling Overwrite Protection (SEHOP): Provides protection against exception handler overwriting.
 Dynamic Data Execution Prevention (DEP): Enforces DEP so data sections such as stack or heap are not executable.
 NULL page allocation: Prevents exploitation of null dereferences.  Heap spray allocation: Prevents heap spraying..
Source: https://www.fireeye.com/blog/threat-research/2016/02/using_emet_to_disabl.html
| 43

EMET 2.x, released in September 02, 2010
 Mandatory Address Space Layout Randomization (ASLR): Enforces modules base address randomization; even for legacy modules, which are not compiled with ASLR flag.
 Export Address Table Access Filtering (EAF): EMET uses hardware breakpoints stored in debugging registers (e.g. DR0) to stop any thread which tries to access the export table of kernel32.dll, ntdll.dll and kernelbase.dll, and lets the EMET thread verify whether it is a legitimate access.
Source: https://www.fireeye.com/blog/threat-research/2016/02/using_emet_to_disabl.html
| 44

EMET 3.x, released in May 25, 2012
 Imported mitigations from ROPGuard to protect against Return Oriented Programming (ROP).  Load Library Checks: Prevents loading DLL files through Universal Naming Convention (UNC) paths.  ROP Mitigation - Memory protection checks: Protects critical Windows APIs like VirtualProtect, which
might be used to mark the stack as executable.  ROP Mitigation - Caller check: Prevents critical Windows APIs from being called with jump or return
instructions.  ROP Mitigation - Stack Pivot: Detects if the stack has been pivoted.  ROP Mitigation - Simulate Execution Flow: Detects ROP gadgets after a call to a critical Windows API,
by manipulating and tracking the stack register.  Bottom-up ASLR: Adds entropy of randomized 8-bits to the base address of the bottom-up allocations
(including heaps, stacks, and other memory allocations).
Source: https://www.fireeye.com/blog/threat-research/2016/02/using_emet_to_disabl.html
| 45

EMET 4.x, released in April 18, 2013
 Deep Hooks: With this feature enabled, EMET is no longer limited to hooking what it may consider as critical Windows APIs, instead it hooks even the lowest level of Windows APIs, which are usually used by higher level Windows APIs.
 Anti-detours: Because EMET places a jump instruction at the prologue of the detoured (hooked) Windows API functions, attackers can craft a ROP that returns to the instruction that comes after the detour jump instruction. This protection tries to stop these bypasses.
 Banned functions: By default it disallows calling ntdll!LdrHotpatchRoutine to prevent DEP/ASLR bypassing. Additional functions can be configured as well.
 Certificate Trust (configurable certificate pinning): Provides more checking and verification in the certificate chain trust validation process.
Source: https://www.fireeye.com/blog/threat-research/2016/02/using_emet_to_disabl.html
| 46

EMET 5.x, released in July 31, 2014
 Introduced Attack Surface Reduction (ASR): Allows configuring list of modules to be blocked from being loaded in certain applications.
 EAF+: Similar to EAF, it provides additional functionality in protecting the export table of kernel32.dll, ntdll.dll and kernelbase.dll.
Source: https://www.fireeye.com/blog/threat-research/2016/02/using_emet_to_disabl.html
| 47

EMET

EMET 
·  (HIPS)  EMET  EMET  
EMET  (User Application)    EMET  EMET 
Source: https://support.microsoft.com/zh-tw/kb/2909257

 EMET 
· EMET  (Kernel)  ·  EMET 
 ·  EMET 
·  ·  ·  (DRM) 
()  · 
Source: https://support.microsoft.com/zh-tw/kb/2909257

EMET  Windows 
 EMET  Windows    EMET 

Source: https://support.microsoft.com/zh-tw/kb/2909257

EMET 
1. Rule 2.  3. EMET Kernel  4.  5.  6.  7.  Win 7, 8  10 
| 53

 Address Space Layout Randomization (ASLR)
1.  2. ASLR
(Win8) 3.  32 
(Low entropy)   4. Only get exception, crash or stuck 5.  6.  7. 
| 54

 ASLR 
 Information that will evade the ASLR. There are mainly two ways: 1. Any anti ASLR modules gets loaded into the target application.
You have the base address of any module at fixed location always even after the system restart. 2. You get a pointer leak from a memory leak/buffer overflow/any zero day. You can adjust the offsets to grab the base address of the module whose pointer gets leaked.
 When you have a pointer, so you can either make your shellcode from ROP, ROP is a little advanced return to LibC attack and is return oriented programming.
Source: Whitepaper on Bypassing ASLR/DEP, Vinay Katoch
| 56

EMET/ASLR

Current Solutions
· Patch · Traditional White
listing · Machine learning · Anti-exploitation
tools
| 59

 Patch
PROS:
 
CONS:
   
| 60

 Group Policy 
PROS:  ( )
CONS:  ( )   ( Registry )  Windows   Kernel 
| 61


PROS:
  ()
CONS:
    
| 62

Anti-exploitation 
PROS:
( Angler, RIG, Nuclear)
CONS:
 Rule based ­   Bypass  
| 63


  ?
| 64

EMET/ASLR is not enough We need to do better







 Detection
 Signatures  Behavioral  Heuristics

 Moving Target Defense
 Prevention
 Polymorphism  Hiding the target  Deterministic
| 66

 Moving Target Defense (MTD)



<> 

 
 



 
| 69

 Moving Target Defense (MTD)
<>

 
 



 
| 70

 Moving Target Defense (MTD)
<>





 !

 



 

 

 
| 71

 Before and after MTD

APT/Ransomware

()
()
| 73

| 74

| 79

| 82

:
CVE-2016-4117
: Type confusion
1.  Office  1. Office  Flash  1.  Flash Player  2.  Flash Exploit (Type Confusion/All Memory Attack  , Devils are here)
2. Exploit  Shellcode 1. Shellcode  Shellcode
3.  Shellcode 1.  Malware 2.  Decoy 
4. Malware  Command and Control (C2)  
Source: https://tirateunping.wordpress.com/2016/05/17/cve-2016-4117-fireeye-revealed-the-exploit-chain-of-recent-attacks/
| 83

A Brief History of Hancitor
Hancitor (aka Chanitor and TorDal) is a downloader-type malware and usually a part of a larger targeted campaign. New evasive technique(s) that allow it to elude most existing endpoint security solutions. Using an embedded calls to launch and grab additional payloads. Injecting a DLL or EXE downloaded from a URL and executing it without writing it to the disk.
| 84


1.  Rule 2.  3.  4.  5.  6.  7. SIEM 8. 
| 86

Key Take Away
  MTD  In-memory attacks
Browser, Office, Adobe PDF/Flash, Java, Backdoor 
 Zero-day, one-day, exploit based malware, PowerShell/Java Script
  Web    Adobe  Office    Flash, Silverlight  JavaScript    shellcode  Payload  Java  ()  File-less  Non-persistent 
| 87

:
| 88


| 89

Special Thanks to
Matt Chen Jason Lai Julian Su Myself
| 90

"  Morphisec"
LeoLiaw@iSecurity.com.tw
| 92

