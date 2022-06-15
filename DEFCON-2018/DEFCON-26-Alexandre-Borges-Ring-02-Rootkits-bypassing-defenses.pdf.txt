ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

RING 0/-2 ROOKITS : COMPROMISING DEFENSES
DEFCON 2018 USA
ALEXANDRE BORGES

DEFCON 2018 - USA

1

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

PROFILE AND TOC
TOC:
· Introduction · Rootkits: Ring 0 · Advanced Malwares and Rootkits: Ring -2
· Malware and Security Researcher. · Consultant, Instructor and Speaker on
Malware Analysis, Memory Analysis, Digital Forensics, Rootkits and Software Exploitation. · Member of Digital Law and Compliance Committee (CDDC/ SP) · Reviewer member of the The Journal of Digital Forensics, Security and Law. · Refereer on Digital Investigation:The International Journal of Digital Forensics & Incident Response · Instructor at Oracle, (ISC)2 and Ex-instructor at Symantec.
2
DEFCON 2018 - USA

ACKNOWLEDGMENT

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

9Alex Bazhaniuk 9Alex Matrosov 9Andrew Furtak 9Bruce Dang 9Corey Kallenberg 9Dmytro Oleksiuk 9Engene Rodionov

9Joanna Rutkowska 9John Loucaides 9Oleksandr Bazhaniuk 9Sergey Bratus 9Vicent Zimmer 9Yuriy Bulygin 9Xeno Kovah

These professionals deserve my sincere "thank you" and deep respect for everything I have learned from their explanations and articles. By the way, I continue learning...

3
DEFCON 2018 - USA

INTRODUCTION
4
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

RING 0/-2 ROOTKITS

RING 0:

ADVANCED MALWARES:

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

· Kernel Callback methods · MBR/VBR/UEFI rootkits

· WinDbg structures

· Tecniques used by rootkits

· Kernel Drivers Structures · Kernel Code Signing Bypasses

· Malicious Drivers

· MBR + IPL infection

· Modern C2 communication · BIOS, UEFI and boot architecture

· Kernel Pools and APCs · Boot Guard

· Secure Boot attacks

· WSMT (Windows SMM Security

·

Mitigation Table)

· BIOS Guard

· BIOS/UEFI Protections

DEFCON 2018 - USA

5

DEFCON 2018 - USA

ROOTKITS: RING 0

6

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
· Kernel Callback Functions, which are are a kind of "modern hooks" oftenly used by antivirus programs to monitor, alert the kernel modules about a specific event ocurrence. Therefore, they are used by malwares (kernel drivers) for evading defenses.
· Most known callback methods are:
· PsSetLoadImageNotifyRoutine: it provides notification when a process, library or kernel memory is mapped into memory.
· IoRegisterFsRegistrationChange: it provides notification when a filesystem becomes available.
· IoRegisterShutdownNotification: the driver handler (IRP_MJ_SHUTDOWN) acts when the system is about going to down.
· KeRegisterBugCheckCallback: it helps drivers to receive a notification (for cleaning tasks) before a system crash.
7
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
· PsSetCreateThreadNotifyRoutine: indicates a routine that is called every time when a thread starts or ends.
· PsSetCreateProcessNotifyRoutine: when a process starts or finishes, this callback is invoked (rootkits and AVs).
· DbgSetDebugPrintCallback: it is used for capturing debug messages.
· CmRegisterCallback( ) or CmRegisterCallbackEx( ) are called by drivers to register a RegistryCallback routine, which is called every time a thread performs an operation on the registry.
· Malwares have been using this type of callbacks for checking whether their persistence entry are kept and, just in case they were removed, so the malware add them back.
8
DEFCON 2018 - USA

ROOTKITS: RING 0
0: kd> dd nt!CmpCallBackCount L1 fffff801`aa733fcc 00000002

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

0: kd> dps nt!CallbackListHead L2 fffff801`aa769190 ffffc000`c8d62db0 fffff801`aa769198 ffffc000`c932c8b0

0: kd> dt nt!_LIST_ENTRY ffffc000`c8d62db0

[ 0xffffc000`c932c8b0 - 0xfffff801`aa769190 ]

+0x000 Flink

: 0xffffc000`c932c8b0 _LIST_ENTRY [

0xfffff801`aa769190 - 0xffffc000`c8d62db0 ]

+0x008 Blink

: 0xfffff801`aa769190 _LIST_ENTRY [

0xffffc000`c8d62db0 - 0xffffc000`c932c8b0 ]

DEFCON 2018 - USA

9

ROOTKITS: RING 0

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

0: kd> !list -t _LIST_ENTRY.Flink -x "dps" -a "L8" 0xffffc000`c932c8b0 ffffc000`c932c8b0 fffff801`aa769190 nt!CallbackListHead ..... ffffc000`c932c8c8 01d3c3ba`27edfc12 ffffc000`c932c8d0 fffff801`6992a798 vsdatant+0x67798 ffffc000`c932c8d8 fffff801`69951a68 vsdatant+0x8ea68 ffffc000`c932c8e0 00000000`000a000a ..... fffff801`aa7691c0 00000000`bee0bee0 fffff801`aa7691c8 fffff801`aa99b600 nt!HvpGetCellFlat

DEFCON 2018 - USA

10

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
· At same way, PsSetCreateProcessNotifyRoutine( ) routine adds a driver-supplied callback routine to, or removes it from, a list of routines to be called whenever a process is created or deleted.
0: kd> dd nt!PspCreateProcessNotifyRoutineCount L1
fffff801`aab3f668 00000009
0: kd> .for (r $t0=0; $t0 < 9; r $t0=$t0+1) { r $t1=poi($t0 * 8 + nt!PspCreateProcessNotifyRoutine); .if ($t1 == 0) { .continue }; r $t1 = $t1 & 0xFFFFFFFFFFFFFFF0; dps $t1+8 L1;}
· Malwares composed by kernel drivers, which use the PsSetLegoNotifyRoutine( ) kernel callback to register a malicious routine, could be get called during the thread termination. The KTHREAD.LegoData field provides the direct address.
11
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
0: kd> .for (r $t0=0; $t0 < 9; r $t0=$t0+1) { r $t1=poi($t0 * 8 + nt!PspCreateProcessNotifyRoutine); .if ($t1 == 0) { .continue }; r $t1 = $t1 & 0xFFFFFFFFFFFFFFF0; dps $t1+8 L1;} ffffe001`134c8b08 fffff801`aa5839c4 nt!ViCreateProcessCallback ffffe001`139e1138 fffff801`678175f0 cng!CngCreateProcessNotifyRoutine ffffe001`13b43138 fffff801`67e6c610 kl1+0x414610 ffffe001`13bdb268 fffff801`685d1138 PGPfsfd+0x1c138 ffffe001`13b96858 fffff801`68a53000 ksecdd!KsecCreateProcessNotifyRoutine ffffe001`14eeacc8 fffff801`68d40ec0 tcpip!CreateProcessNotifyRoutineEx ffffe001`164ffce8 fffff801`67583c70 CI!I_PEProcessNotify ffffe001`13b6e4b8 fffff801`68224a38 klflt!PstUnregisterProcess+0xfac ffffe001`1653e4d8 fffff801`699512c0 vsdatant+0x8e2c0
12
DEFCON 2018 - USA

ROOTKITS: RING 0
kd> dt _KTHREAD
DEFCON 2018 - USA

By now, we have seen malwares using KTHREAD.LegoData field for registering a malicious routine, which would be called during the thread termination.
13

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
9 Windows offers different types of drivers such as legacy drivers, filter drivers and minifilter drivers (malwares can be written using any one these types), which could be developed using WDM or WDF frameworks (of course, UMDF and KMDF take part)
· To analyze a malicious driver, remember this sequence of events:
· The driver image is mapped into the kernel memory address space.
· An associated driver object is created and registered with Object Manager, which calls the entry point and fills the DRIVER_OBJECT structure's fields.

DRIVER
DEFCON 2018 - USA

DEVICE_OBJECT (one or more objects)

DRIVER_OBJECT I/O CreateDevice( )

HARDWARE RES.
14

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
· Most ring 0 malwares install filter drivers for: · modifying aspects and behavior of existing drivers · filtering results of operations (reading file, for example) · adding new malicious features to a driver/devices (for example, keyloggers)
· The AddDevice( ) routine is used to create an unamed Device Object and to attach it to a named Device Object (ex: aborges) from a layered driver (lower-level driver).
15
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
· An appropriate dispatch routine will be picked from the its MajorFunction Table and process the IRP.
· Alternatively, this IRP could be passed down to the layered driver by using function such as IoCallDriver( ).
· Rootkits use the same IoCallDriver( ) to send directly request to the filesystem driver, evading any kind of monitoring or hooking at middle of the path. -
16
DEFCON 2018 - USA

ROOTKITS: RING 0

Driver Stack

Tcpip.sys Upper Filter Driver
Function Driver Lower Filter Driver
Miniport driver

Upper Filter Device Object Function Device Object
Lower Filter Device Object Physical Device Object Device Stack

IoCallDriver( ) IoCallDriver( ) IoCallDriver( ) IoCallDriver( )

IO_STACK_LOCATION 4 IO_STACK_LOCATION 3 IO_STACK_LOCATION 2 IO_STACK_LOCATION 1
Device Stack

No Completation Routine Completation Routine 4 Completation Routine 3 Completation Routine 2

The IoCompleteRequest( ) manages calling these routines in the correct order (bottom-up). -
17
DEFCON 2018 - USA

ROOTKITS: RING 0

· A IRP is usually generated by the I/O Manager in

response to requests.

· An IRP can be generated by drivers through the

IoAllocateIrp( ) function.

· Analyzing malware, we are usually verify

S

functions such as IoGetCurrentIrpStackLocation(),

T

IoGetNextIrpStackLocation( ) and

A

IoSkipCurrentIrpStackLocation( ).

T

· At end, each device holds the responsability to

I

prepare the IO_STACK_LOCATION to the next

C

level, as well a driver could call the

IoSetCompletationRoutine( ) to set a completation

routine up at CompletationRoutine field.

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

D

Y

IO_STACK_LOCATION

N

IO_STACK_LOCATION

A M I

IO_STACK_LOCATION ..............

C

DEFCON 2018 - USA

18

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
Parameters field depends on the major and minor functions!
19
DEFCON 2018 - USA

ROOTKITS: RING 0

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

Parameter field depends on major and minor function number. Thus, the IRPs being used are related to the action.

DEFCON 2018 - USA

20

ROOTKITS: RING 0

DEFCON 2018 - USA

21

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
Malicious driver
rootkits: ring 0

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

DEFCON 2018 - USA

22

ROOTKITS: RING 0

DEFCON 2018 - USA

23

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
24
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
25
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
· Naturally, as closest at bottom of device stack occurs the infection (SCSI miniport drivers instead of targeting File System Drivers), so more efficient it is.
· Nowadays, most monitoring tools try to detect strange activities at upper layers.
· In this case, it is very easy to intercept requests (read / write operations) from hard disk by manipulating the MajorFunction array (IRP_MJ_DEVICE_CONTROL and IRP_INTERNAL_CONTROL) of the DRIVER_OBJECT structure. -
26
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
· Rootkits try to protect itself from being removed by modifying routines such as IRP_MJ DEVICE_CONTROL and hooking requests going to the disk (IOCTL_ATA_* and IOCTL_SCSI_*).
· Another easy approach is to hook the DriverUnload( ) routine for preventing the rootkit of being unloaded.
· However, any used tricks must avoid touching critical areas protected by KPP (Kernel Patch Guard) and one of tricky methods for find which are those areas is trying the following:
27
DEFCON 2018 - USA

ROOTKITS: RING 0
kd> !analyze ­show 109

Thanks, Alex Ionescu -

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

28
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
· Additionally, malwares composed by executable + drivers have been using APLC (Advanced Local Procedure Call) in the communication between user mode code and kernel drivers instead only using only IOCTL commands.
· Remember APLC interprocess-communication technique has been used since Windows Vista, as between lsass.exe and SRM( Security Reference Monitor). Most analysts are not used to seeing this approach.
· Malwares usually don't target a specific driver used during the boot for injection, but try to pick one randomly by parsing structures such as _KLDR_DATA_TABLE_ENTRY.
29
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
· Certainly, hooking the filesystem driver access is always a possible alternative: · IoCreateFile( ) Æ gets a handle to the filesystem.
· ObReferenceObjectByHandle( ) Æ gets a pointer to FILE_OBJECT represented by the handle.
· IoCreateDevice( ) Æ creates a device object (DEVICE_OBJECT) for use by a driver.
· IoGetRelatedDeviceObject( ) Æ gets a pointer to DEVICE_OBJECT.
· IoAttachDeviceToDeviceStack( ) Æ creates a new device object and attaches it to DEVICE_OBJECT pointer (previous function).
30
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
· The same AVs usually hook functions such as ZwCreate( ) for intercepting all opened requests sent to devices. Unfortunately, malwares could do the same and, when it is not possible, so they perform their own implementation. -
· After infecting a system by infection a system dropping kernel drivers, malwares usually force the system reboot calling ZwRaiseHardError( ) function and specifying OptionShutdownSystem as 5th parameter.
· Of course, it could be worse and the malware could use IoRegisterShutdownNotification( ) routine registers the driver to receive an IRP_MJ_SHUTDOWN IRP notification when the system is shutdown for restoring the malicious driver in the next boot just in case it is necessary.
31
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
· Malwares continue allocating (usually RWX, although on Windows 8+ it could specify NonPagePoolNX) and marking their pages by using ExAllocatePoolWithTag( ) function (and other at same family ExAllocatePool*). Fortunately, it can be easily found by using memory analysis:
32
DEFCON 2018 - USA

DEFCON 2018 - USA

ROOTKITS: RING 0

33

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ROOTKITS: RING 0
0: kd> dt nt!_KTHREAD

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

· APC (user and kernel mode) are executed in the thread context, where normal APC executes at PASSIVE_LEVEL (thread is on alertable state) and special ones at APC_LEVEL (software interruption below DISPATCH LEVEL, where run Dispatch Procedure Calls).

· APC Injection Æ It allows a program to execute a code in a specific thread by attaching to an APC queue (without using the CreateRemoteThread( )) and preempting this thread in alertable state to run the malicious code. (QueueUserAPC( ), KeInitializeAPC( ) and KeInsertQueueAPC( )).

DEFCON 2018 - USA

34

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES AND ROOTKITS RING -2
35
DEFCON 2018 - USA

ADVANCED MALWARES

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

· MBR rootkits: Petya and TLD4 (both in bootstrap code), Omasco (partition table) and Mebromi (MBR + BIOS, triggering SW System Management Interrupt (SMI) 0x29/0x2F for erasing the SPI flash)

· VBR rootkits: Rovnix (IPL) and Gapz (BPB ­ Bios Parameter Block, which it is specific for the filesystem)

· UEFI rootkits: replaces EFI boot loaders and, in some cases, they also install custom firmware executable (EFI DXE)

· Modern malwares alter the BPB (BIOS parameter block), which describes the filesystem volume, in the VBR.

· We should remember that a rough overview of a disk design is: MBR Æ VBR Æ IPL Æ NTFS

Locate the active partition and reads the first sector
DEFCON 2018 - USA

Initial Program Loader. It has 15 sectors containing the bootstrap code for parsing the NTFS and locating the OS boot loader.

It contains necessary boot code for loading the OS loader

36

ADVANCED MALWARES

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

DEFCON 2018 - USA

BIOS_PARAMETER __BLOCK_NTFS
Overwritten with an offset of the bootkit on the disk.
Thus, in this case, the malicious code will be executed instead of the IPL. -
37

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
expected MBR entry point and it must be included in the IDA Pro's load_file.
Eventually, analyzing and debugging the MBR/VBR (loaded as binary module) is unavoidable, but it's not so difficult as it seems. Furthermore, we never know when an advanced malware or a ransomwares (TDL4 and Petya) will attack us. -
38
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
· MBR modifications (partition table or MBR code) as VBR+IPL modifications (BPB or IPL code) have been used as an effective way to bypass the KCS.
· As injecting code into the Windows kernel has turned out to be a bit more complicated, to modern malwares are used to bypassing the KCS (Kernel-Mode Code Signing Policy) by:
· Disabling it Æ Booting the system on Testing Mode. Unfortunately, it is not so trivial because the Secure Boot must be disabled previously and, afterwards, it must be rebooted. -
· Changing the kernel memory Æ MBR and/or VBR could be altered. However, as BIOS reads the MBR and handle the execution over to the code there, so it is lethal. -
· Even trying to find a flaw in the firmware Æ it is not trivial and the Secure Boot must be disabled.
39
DEFCON 2018 - USA

ADVANCED MALWARES

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

DEFCON 2018 - USA

Setting TESTING mode is a very poor drive signature "bypassing". Actually, there are more elegant methods. -
40

ADVANCED MALWARES
Read its configuration from BPB + VBR code + strings + 0xAA55 Boot Configuration Data (BCD)

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

BIOS
Mebromi
EFI
BCD

MBR

VBR

Bootmgr

Petya/Mebromi/ Omasco/TLD4

Rovnix and Gapz

Bootmgfw.efi

Ntoskrnl.exe

UEFI support since Windows 7 SP1 x64

ELAM

Code Integrity

Winload.exe
Bootkits could attack it before loading the kernel and ELAM. -
DEFCON 2018 - USA

Kdcom.dll ci.dll HAL.dll

Classifies modules as good, bad and unknown. Additionally, it decides whether load a module or not according to the policy.
41

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
· The malicious bootmgr, which switches the processor execution from real mode to protected mode, uses the int 13h interrupt to access the disk drive, patch modules and load malicious drivers.
· Once again, if the integrity checking of the winload.exe is subverted, so a malicious code could be injected into the kernel.
· The winload.exe roles:
· enables the protect mode.
· checks the modules' integrity and loads the Windows kernel.
· loads the several DLLs (among them, the ci.dll, which is responsible for Code Integrity) and ELAM (Early Launch Anti Malware, which was introduced on Windows 8 as callback methods and tries to prevent any strange code execution in the kernel).
· loads drivers and few system registry data.
42
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
· Most advanced rootkits continue storing/reading (opcode 0x42, 0x43 and 0x48) their configuration and payloads into a encrypted hidden filesystem (usually, FAT32) using modified symmetric algorithms (AES, RC4, and so on).
· Hooking key programs such as NTLDR and BOOTMGR to help malwares keeping alive during the transition from real to protect mode.
43
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
· SMM basics:
· Interesting place to hide malwares because is protected from OS and hypervisors.
· The SMM executable code is copied into SMRAM and locked during the initialization.
· To switch to SMM, it is necessary to triger a SMI (System Management Interrupt), save the current content into SMRAM and execute the SMI handler code.
· A SMI could be generated from a driver (ring 0) by writing a value into APMC I/O / port B2h or using a I/O instruction restart CPU feature.
· The return (and execution of the prior execution) is done by using RSM instruction.
44
DEFCON 2018 - USA

ADVANCED MALWARES

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

SPI malwares SPI Flash
(Flash Write Protection)
SMM malwares SMM

UEFI/BIOS malwares

UEFI Services

DEFCON 2018 - USA

MBR

VBR

Bootkit malwares

LOADER

UEFI: Bootx64.efi and Bootmgfw.efi

OS

Ring 0 malwares like rootkits

(Kernel Code Signing Policies)

45

ADVANCED MALWARES

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

SEC Æ PEI Æ DXE Æ BDS Æ TSL Æ RT Æ AL

IBB ­ Initial Boot Block

After Life

· SEC Æ Security (Caches, TPM and MTRR initialization) · PEI Æ Pre EFI Initialization (SMM/Memory ) · DXE Æ Driver Execution Environment (platform + devices
initialization , Dispatch Drivers, FV enumumeration) · BDS Æ Boot Dev Select (EFI Shell + OS Boot Loader) · TSL Æ Transient System Load · RT Æ Run Time

46
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES

HARDWARE Boot Guard

TSL

The Windows uses the UEFI to load the Hypervisor and Secure Kernel.

malwares

and

exploits

attack here -

IBB

SEC

PEI

DXE

UEFI Secure

Boot

Hypervisor
Windows Boot Loader
Kernel drivers ELAM
3rd party drivers

OS Secure Boot
Acts on drivers that are executed before Windows being loaded and initialized.

BDS UEFI Secure Boot

Windows

DEFCON 2018 - USA

Apps

47

ADVANCED MALWARES

· Remember: a firmware is composed by many regions such as Flash Descriptors, BIOS, ME (Management Engine), GbE and ACPI EC.
ROM + FW (Manifest+ Modules)

Descriptors

GbE

ME

ACPI

BIOS

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ME: has full access to the DRAM, invisible at same time, is always working (even then the system is shutdown) and has access to network interface. Conclusion: a nightmare. -
48
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
· Intel Boot Guard (controlled by ME), introduced by Intel, is used to validate the boot process through flashing the public key of the BIOS signature into FPFs (Field Programmable Fuses) from Intel ME.
· Obviously, if vendors left closemnt fuse unset, so it could be lethal. -
· Of course, the SPI region must be locked and the Boot Guard configuration must be set against a SMM driver rootkit. -
49
DEFCON 2018 - USA

ADVANCED MALWARES

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

CPU boot ROM

Loaded into Authenticated Code RAM

SPI Flash Memory

BG startup Authenticated Code Module SEC + PEI (IBB)
BIOS

Verifies the IBB
IBB verifies the BIOS content

DEFCON 2018 - USA

· Public key's hash, used for verifying the signature of

the code with the ACM, is hard-coded within the CPU.

· It almost impossible to modify the BIOS without

knowing the private key.

· At end, it works as a certificate chain. -

50

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
9 Additionally, BIOS Guard running in the SMM, protects against notauthorized:
· SPI Flash Access (through BIOS Guard Authenticated Code Module) Æ prevents an attacker to escalate privileges to SMM by writting a new image to SPI.
· BIOS update Æ attacker (through a DXE driver) could update the BIOS to a flawed BIOS version.
· Boot infection/corruption.
9 BIOS Guard allows that only trusted modules (by ACM) are able to modify the SPI flash memory against rookit implants.
51
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
· Secure Boot:
· Protect the entire path shown previously against bootkit infection.
· Protects key components from kernel loading, key drivers and important system files, requesting a valid digital signature.
· Prevents loading of any code that are not associated a valid digital signature.
52
DEFCON 2018 - USA

ADVANCED MALWARES
· Two essential items on Secure Boot are:

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

· Platform Key (PK ­ must be valid), which establishes a trust relationship between the platform owner and the platform firmware, verifies Key Exchange Key (KEK).

· KEK, which establishes a trust relationship between the OS and the platform firmware, verifies:

DEFCON 2018 - USA

· Authorized Database (db) Æ contains authorized signing certificates and digital signatures
· Forbidden Database (dbx) Æ contains forbidden certificates and digital signatures.
53

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
· Obviously, if the Platform Key is corrupted, everything is not valid anymore because the SecureBoot turns out disabled when this fact happens. /
· Unfortunately, few vendors continue storing important Secure Boot settings in UEFI variables. However, if these UEFI variable are exploited through ring 0/-2 malware or bootkit, so the SecureBoot can be disabled.
54
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
· Without ensuring the UEFI image integrity, a rookit could load another UEFI image without being noticed. -
· UEFI BIOS supports TE (Terse Executable) format (signature 0x5A56 - VZ).
· As TE format doesn't support signatures, BIOS shouldn't load this kind of image because Signature checking would be skipped.
· Therefore, a rootkit could try to replace the typical PE/COFF loader by a TE EFI executable, so skipping the signature check and disabling the Secure Boot.
55
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
9 Additionally, new releases of Windows 10 (version 1607 and later) has introduced interesting SMM protections as Windows SMM Security Mitigation Table (WSMT).
9 In Windows 10, the firmware executing SMM must be "authorized and trusted" by VBS (Virtualized Based Security).
56
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
· These SMM Protections flags that can be used to enable or disable any WSMT feature.
· FIXED_COMM_BUFFERS: it guarantees that any input/output buffers be filled by value within the expected memory regions.
· SYSTEM_RESOURCE_PROTECTION: it works as an indication that the system won't allow out-of-band reconfiguration of system resources.
· COMM_BUFFER_NESTED_PTR_PROTECTION: it is a validation method that try to ensure that any pointer whith the fixed communication buffer only refer to address ranges that are within a pre-defined memory region.
57
DEFCON 2018 - USA

ADVANCED MALWARES
· chipsec_util.py spi dump spi.bin · chipsec_uti.py decode spi.bin

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

DEFCON 2018 - USA

Is the customer Safe? -
58

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER
ADVANCED MALWARES

DEFCON 2018 - USA

chipsec_main --module common.bios_wp 59

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER
ADVANCED MALWARES

DEFCON 2018 - USA

chipsec_main.py -m common.bios_smi
60

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
· The BIOS_CNTL register contains:
· BIOS Write Enable(BWE) Æ if it is set to 1, an attacker could write to SPI flash.
· BIOS Lock Enable (BLE) Æ if it is set to 1, it generates an SMI routine to run just in case the BWE goes from 0 to 1.
· Of course, there should be a SMM handler in order to prevent setting the BWE to 1.
· What could happen if SMI events were blocked? · The SMM BIOS write protection (SMM_BWP) , which protects
the entire BIOS area, is not enabled. /
61
DEFCON 2018 - USA

ADVANCED MALWARES

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

DEFCON 2018 - USA

chipsec_main.py -m common.spi_lock 62

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
· SPI Protect Range registers protect the flash chip against writes.
· They control Protected Range Base and Protected Range Limit fields, which set regions for Write Protect Enable bit and Read Protect Enable bit.
· If the Write Protect Enable bit is set, so regions from flash chip that are defined by Protected Range Base and Protected Range Limit fields are protected.
· However, SPI Protect Range registers DO NOT protect the entire BIOS and NVRAM.
· In a similar way to BLE, the HSFSS.FLOCKDN bit (from HSFSTS SPI MMIO Register) prevents any change to Write Protect Enable bit. Therefore, malware can't disable the SPI protected ranges for enabling access to the SPI flash memory.
63
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
python chipsec_main.py --module common.bios_ts
64
DEFCON 2018 - USA

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

ADVANCED MALWARES
· Top Swap Mode, which is enabled by BUC.TS in Root Complex range, is a feature that allows fault-tolerant update of the BIOS boot-block.
· Therefore, when Top Swap Configuration and swap boot-block range in SPI are not protected or even locked, any malware could force an execution redirect of the reset vector to backup bootblock because CPU will fetch the reset vector at 0xFFFEFFF0 instead of 0xFFFFFFF0 address.
· SMRR (System Management Range Registers) blocks the access to SMRAM (range of DRAM that is reserved by BIOS SMI handlers) while CPU is not in SMM mode, preventing it to execute any SMI exploit on cache.
65
DEFCON 2018 - USA

ADVANCED MALWARES

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

DEFCON 2018 - USA

chipsec_main.py -m common.smrr
66

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

CONCLUSION
· Most security professionals haven being facing problems to understand how to analyze malicious drivers because the theory is huge and not easy.
· Real customers are not awareness about ring -2 threats and they don't know how to update systems' firmwares.
· All protections against implants are based on integrity (digital certificate and signature). However, what would happen whether algoritms were broken (QC - quantum computation)?
67
DEFCON 2018 - USA

THANK YOU FOR ATTENDING MY TALK!

ALEXANDRE BORGES - MALWARE AND SECURITY RESEARCHER

LinkedIn: http://www.linkedin.com/in/aleborges

Twitter: @ale_sp_brazil

· Malware and Security Researcher. · Consultant, Instructor and Speaker on
Malware Analysis, Memory Analysis, Digital Forensics, Rootkits and Software Exploitation. · Member of Digital Law and Compliance Committee (CDDC/ SP) · Reviewer member of the The Journal of Digital Forensics, Security and Law. · Refereer on Digital Investigation:The International Journal of Digital Forensics & Incident Response · Instructor at Oracle, (ISC)2 and Ex-instructor at Symantec.

Website: http://blackstormsecurity.com

E-mail: alexandreborges@blackstormsecurity. com

DEFCON 2018 - USA

68

