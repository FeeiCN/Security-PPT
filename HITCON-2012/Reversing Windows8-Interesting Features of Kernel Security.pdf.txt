Reversing Windows8:
Interesting Features of Kernel Security
MJ0011 th_decoder@126.com
1

Agenda
Goal: Revising Windows 8 Release Preview Find new security features to defend or mitigate kernel
vulnerability attack Target: ntoskrnl Tools: IDA Pro/Hex-rays/windbg
2

­ Disable Null Page Memory Allocation ­ Disable Win32k System Call ­ Security Failure Interrupt ­ Nonexecutable NonPaged Pool ­ Apply Intel® Secure Key Technology ­ Apply Intel® SMEP Technology

Agenda

3

Disallow Null Page Allocation
­ Null-page memoryfor 16bit VM:ntvdm
­ Allocate null-page memory by using ZwAllocateVirtualmemory to Trigger uninitialized object pointer reference vulnerability or to achieve other vulnerability attack
· Example CVE-2010-4398 N-Protect TKRgAc2k.sys kernel 0day(POC2010)
­ Now the system disallow low address (0x0~0x10000) allocation in Windows8
­ EPROCESS->Flags.VdmAllowed
4

Disallow Null Page Allocation
­ 16bit virtual machine is disabled by default in windows8, only administrators can enable it
5

Disallow Null Page Allocation
­ Windows8 checks all the locations to which null page can be allocated.
· MiCreatePebOrTebcreate peb or teb
· MiMapViewOfImageSection->MiIsVaRangeAvailable: Mapping image section
· MiMapViewOfDataSection/MiMapViewOfPhysicalSection Mapping data/physical section
· MmMapLockedPagesSpecifyCache/MmMapLockedPages-> MiMapLockedPagesInUserSpace
· Mapping in user address space
· NtAllocateVirtualMemory:Allocate process memory
6

Disallow win32k system call
Disallow win32k system call ­ EPROCESS->Flags2.DisallowWin32kSystemCalls ­ KiFastCallEntry(2)->PsConvertToGuiThread
7

Disallow win32k system call
­ Why disallow win32k system call
­ Win32k.sys: a high incidence of windows kernel vulnerability, can be called without process privilege control · MS11-087 Trojan.win32.Duqu : win32k.sys font parse vulnerability
­ Current application sandbox defense method
· Job UI restriction (ineffective)
­ Disallowing win32k system call can easily defend any win32k related 0day without using 3rd party kernel driver
­ Also can defense user/gdi sandbox attack trick which does not use 0day
8

Disallow win32k system call
­ PsConvertToGuiThread : Used by GUI thread to make its initial win32k system call
­ After applying DisallowWin32kSystemCalls flag, any system call for user/gdi will fail.
­ 3 methods to get this flag
· 1.IEFO Registry Configuration : ­ HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MitigationOptions (0x10000000) ­ NtCreateUserProcess->PspAllocateProcess-> PspApplyMitigationOptions
· 2.Documented API:SetProcessMitigationPolicy ­ NtSetInformationProcess->ProcessMitigationPolicy
· 3.Inherit from parent process
9

Security Failure Interruption
­ New security failure interruption in Windows8: INT 0x29
­ Will trigger BSOD when used during security failure of windows kernel or other drivers.
­ Most commonly used in double-linked list operation. Such interruption is added to all the double-linked list in Windows OS Loader / kernel and kernel drivers
­ So called "Safe Linking & Safe Unlinking"
· Safe Linking::IoRegisterFsRegistrationChangeMountAware · Safe Unlinking:IoUnregisterFileSystem
­ To defense attack trick such as using tampered list entry structure to manipulate a Write-What-Where condition
10

Security Failure Interrupt
Safe unlinking and int 0x29 interrupt: IoUnregisterFileSystem
11

Security Failure Interruption
­ KiRaiseSecurityCheckFailure :
· Int 0x29 Interrupts handler routine · It simply calls KiFastFailDispatch->KiBugCheck to show BSOD
­ Bug check code: 0x139 : Currently not documented
· Parameter:ecx :The Error ID
­ Known Security Fast-Fail Error ID:
· 0x2: Kernel driver security cookie exception · 0x3: Safe unlinking / Safe linking exception · 0x6: Kernel driver security cookie initialize exception · 0x9: RtlQueryRegistryValuesEx using untrust key(CVE-2010-4398 )
12

Nonexecutable Nonpaged Pool
­ Before Windows8 , kernel and kernel drivers can only use ExAllocatePoolXXX API to allocate executable nonpaged memory
­ Executable nonpaged pool can be used to create kernel vulnerability ROP attack
­ In Windows8 , There are some new pool types:
· NonPagedPoolNx · NonPagedPoolNxCacheAligned · NonPagedPoolSessionNx
­ Kernel pool memory which is allocated from NonPagedPoolNx type is nonexecutable now, code executable in this type of pool will cause a system crash
­ Windows8 kernel and kernel drivers now use NonPagedPoolNx instead of NonPagedPool type
13

Nonexecutable Nonpaged Pool
­ Kernel uses nonexecutable nonpagedpool ­ IoAllocateDriverObjectExtension
14

Apply Intel® Secure Key Technology
­ Intel® Secure Key Technology , code name: Bull Mountain Technology
­ Introduced in April 2012, Intel 3rd generation Core processor: Ivy Bridge
· Offers hardware approach to high-quality,high-performance entropy and random number generator
­ New Intel 64 Architecture instruction: RDRAND
­ Windows8 kernel uses this instruction to generate random number to produce security cookie and ASLR address
­ Related FunctionExGenRandom
15

Apply Intel® Secure Key Technology
­ Past kernel random number attacks: security cookie prediction & ASLR brute force
­ Before Windows8 , Windows kernel use system clock to generate security cookie and ASLR address
­ Base on module loading time, security cookie can be easily predicted with a success rate of more than 46 percent(j00ru).
­ J00ru. Windows Kernel-mode GS Cookies subverted.
­ H. Shacham, M. Page, B. Pfaff, E.-J. Goh, N. Modadugu, and D. Boneh. On the effectiveness of address-space randomization.
­ Windows 8 kernel use security cookie generated by Intel secure key technology and apply it to all loaded kernel drivers
16

Apply Intel® Secure Key Technology
· When loading the kernel driver, Windows 8 calls MiProcessLoadConfigForDriver to generate security cookie, locates old security cookie in PE and replaces it.
· New Windows8 kernel drivers will check if their security cookies are already replaced.
17

Apply Intel® Secure Key Technology
­ The way of Windows7 kernel generates security cookie: HalQueryRealTimeClock(from CMOS) ^ rdtsc
­ The way of Windows8 kernel generates security cookie: ExGenRandom-> ExpSecurityCookieRandomData ^ rdtsc
­ Windows8 runtime kernel does not directly use RDRAND instruction
­ ExGenRandom uses random entropy source generated from OS Loader calling RDRAND instruction in system booting process · Winload! OslpGatherRdrandEntropy
­ In fact , OS Loader use 5 methods to get high quality random number entropy sources
­ External entropy(from registry)\TPM entropy\clock entropy\ACPI entropy\RDRAND entropy
18

Apply Intel® Secure Key Technology
­ IDA Pro 6.3 supports RDRAND instruction decoding. ­ Winload initializing SecureKey in system booting process
19

Apply Intel® Secure Key Technology
­ ExGenRandom is also used in these kernel functions · Kernel pool quota cookie · Kernel pool address allocation randomization · PEB/TEB address randomization · Kernel module address randomization · Thread stack and heap address randomization
­ And user functions: · Shared User Data->Cookie(ring3 Ldr* encode and decode) · User address space memory allocation randomization · User data section and image section allocation randomization
20

Apply Intel® Secure Key Technology
­ Guillaume. Bypassing ASLR and DEP on Adobe Reader X
­ The sandbox inside Adobe Reader X and Google Chrome browser uses VirtualAllocEx function to allocate memory and copy System Call Stub jump shell code into it.
­ In Win7 and previous OS, memory allocated by VirtualAllocEx function is not randomized. There is more than 85 percent chance the shell code base address will hit a fixed address in every booting.
­ The attacker uses System Call Stub jump code in fixed address to allocate executable memory and bypass DEP+ASLR
­ Windoows8System uses MmInitializeProcessAddressSpace to call ExGenRandom and generate random number during process startup
­ When process uses NtAllocateVirtualMemory to allocate memory ,system uses MiSelectAddress to select a randomized address with generated random number
21

Apply Intel® Secure Key Technology
­ A comparison test between Windows7 and Windows8 in remote user memory allocation address
­ Start calc.exe process 20 times and allocate remote buffer in it
22

Apply Intel® SMEP Technology
­ SMEP : Supervisor-Mode Execution Prevention ­ Also introduced in April 2012 of Intel 3rd generation Core processor:
Ivy Bridge
­ New hardware protection mechanism provided by Intel CPU, allows pages to be protected from supervisor mode instruction fetches.
­ BackgroundMost kernel vulnerability attacks use tricks to make kernel code jumping to preset shell code which is placed in user address space
­ Classic trick ­ Replace HalDispatchTable-> HalQuerySystemInformation
­ Why place shell code in ring3 address space? Payload and address randomization.
23

Apply Intel® SMEP Technology
­ When SMEP is enabled:
· Supervisor-mode(CPL<3)instruction will check the U/S flag of paging-structure entry during instruction fetching . The CPU will raise a exception when PTE owner is user.
­ Set SMEP bit(bit 20) of cr4 register to 1 will enable SMEP ­ Windows 8 kernel enables SMEP by default: ­ Phase1Initialization-> Phase1InitializationDiscard -
>KiInitMachineDependent
24

Apply Intel® SMEP Technology
­ MI_CHECK_KERNEL_NOEXECUTE_FAULT ­ Windows8 uses this function to process two kinds of
nonexecutable exceptions in Page Fault Trap handler: KiTrap0E
25

Apply Intel® SMEP Technology
­ An way to bypass SMEP: put shell code into kernel object memory, and get kernel object address with NtQuerySystemInformation>SystemHandleInformation(Ex)
­ Available target objectFileObject ?
26

Apply Intel® SMEP Technology
­ Impossible in Windows8: SMEP + NonPagedPoolNx ­ All kernel objects memory are nonexecutable ­ The pool type of kernel object is assigned by
ObCreateObjectType call in system booting process ­ Windows8 has assigned pool type of FileObject as
NonPagedPoolNx
27

Apply Intel® SMEP Technology

­ The defense situation of known SMEP attack trick in Windows8

Attack Trick SystemHandleInformation(Ex) SystemLockInformation SystemModuleInformation
SystemExtendProcessInformation GDT/IDT 0xFFDF0000 (User Shared Data) 0xFFC00000~0xFFFFFFFF(KPCR) Win32k Shared Section

Windows 8 Defense Method Kernel object memory NX Safe Linking/Unlinking No protection in data area Write protection in code area No protection No protection MiProtectKernelRegions set Nx KPCR randomization USER/Kernel object memory Nx

28

Reference
­ Intel. Intel® Digital Random Number Generator Software Implementation Guide
­ Intel. Intel® 64 and IA-32 Architectures Developer's Manual: Vol. 3A
­ J00ru . Exploiting the otherwise non-exploitable:Windows Kernel-mode GS Cookies subverted
­ H. Shacham, M. Page, B. Pfaff, E.-J. Goh, N. Modadugu, and D. Boneh.On the Effectiveness of Address-Space Randomization
­ Guillaume. Bypassing ASLR and DEP on Adobe Reader X
29

­ Thanks for: · CHROOT Security Group
· 360Safe MDT/HIPS Team

Q&A

30

