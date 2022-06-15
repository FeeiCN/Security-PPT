): :

)

)) )

))

)

))

))

) ( :

Alibaba Security



Self Introduction
· Xiaolong Bai
· Alibaba Security Engineer · Ph.D. graduated from Tsinghua University · Published papers on the top 4: S&P, Usenix Security, CCS, NDSS · Twitter, Weibo, Github: bxl1989
· Min (Spark) Zheng
· Alibaba Security Expert · Ph.D. graduated from The CUHK · Twitter@SparkZheng Weibo@spark

Alibaba Security



Agenda

· Overview
· Drivers in Kernel · Userland Perspective
· New Vulns in Drivers on macOS
· Two new vulnerabilities · New exploitation strategies · Privilege escalation on the latest macOS
· Obstacles when analyzing Apple drivers
· Ryuk: a new tool to analyze Apple drivers
· Design · Effects · Implementation · Benefits

Alibaba Security



Overview
· Every driver is a kernel extension (.kext) sharing the same space with the kernel
· System daemon kextd is responsible for loading and unloading drivers
· Location of driver binaries:
· On macOS: /System/Library/Extensions · On iOS: integrated with kernel in kernelcache

Alibaba Security



Drivers in Kernel
· Programmed in C or C++ · Info.plist: configuration file in drivers for their property and usage

Class name of the driver Class name to provide service to userspace
Kernel libs used in the driver

Alibaba Security



Drivers in Kernel
· Kernel APIs (KPI): APIs can be used by drivers to live in kernel
· /System/Library/Frameworks/Kernel.framework/Resources/SupportedKPI s-all-archs.txt (on macOS)
· Basic KPI Modules:
· com.apple.kpi.iokit: For programming drivers, Apple provides an opensource framework called iokit, which includes basic driver classes
· com.apple.kpi.libkern: a restricted c++ runtime lib in the kernel
· excluded features--exceptions, multiple inheritance, templates · an enhanced runtime typing system: every class has an OSMetaClass object which
describes the class's name, size, parent class, etc.

Alibaba Security



Drivers in Kernel · A sample driver
Header File

Code File

Alibaba Security



Drivers in Kernel

· A sample driver
Header File
Class name of the driver Parent of all drivers
Declare Con/Destructors

Code File

Auto Gen Con/Destructors

Callback methods of IOService to be overriden by the driver

Alibaba Security



Drivers in Kernel

· In order to provide service to programs in userspace, drivers need to implement userclients

· Userclient: Kernel objects to provide service to programs in userspace

· Create in two ways:
Info.plist

Callback Method of Driver

Alibaba Security



Drivers in Kernel · A sample UserClient

Unique callbacks of UserClient

Alibaba Security



Drivers in Kernel
· IOUserClient provides services through several callback methods:
· externalMethod: Provide methods that can be called in userspace · clientMemoryForType: Share memory with programs in userspace · registerNotificationPort: When userspace register to receive notification · clientClose: When userspace program close connection with the
userclient · clientDied: When program in userspace connected to the userclient is
dead · getTargetAndMethodForIndex: Similar to externalMethod, but old fashion · getAsyncTargetAndMethodForIndex: Similar to above, but async · getTargetAndTrapForIndex: Similar to externalMethod, but seldom used

Alibaba Security



Drivers in Kernel

· externalMethod: Callback to provide methods to userspace program
· IOReturn IOUserClient::externalMethod(uint32_t selector, IOExternalMethodArguments *arguments, IOExternalMethodDispatch *dispatch, OSObject *target, void *reference);
· selector: to select method in userclient · arguments: arguments passed to the selected method · dispatch: a struct representing the method to be called · target: the target userclient for the method to be called on · reference: reference to send results back to userspace program

Alibaba Security



Userland Perspective
· Apple provides IOKit.framework for programs in user space to interact with kernel drivers
· Though public, explicit invocation in iOS will be rejected by App Store
· Important APIs in IOKit.framework:
· IOServiceGetMatchingService, IOServiceGetMatchingServices · IOServiceOpen, IOServiceClose · IOConnectCall...Method, IOConnectCallAsync...Method · IORegistryEntryCreateCFProperty, IORegistryEntrySetCFProperty · IOConnectMapMemory, IOConnectUnmapMemory · IOConnectSetNotificationPort

Alibaba Security



Userland Perspective
· The calling sequence to interact with a driver
IOServiceGetMatchingService à Get the service of the the target driver IORegistryEntryCreateCFProperty à Get the driver's property IORegistryEntrySetCFProperty à Set the driver's property IOServiceOpen à Connect to the target driver IOConnectCall...Method à Call the driver's method through the connection IOConnectCallAsync...Method à Call method, asynchronously IOConnectMapMemory à Get a memory mapped by the driver IOConnectSetNotificationPort à Prepare to receive notification from driver IOServiceClose à Close the connection

Alibaba Security



Userland Perspective · Sample code of using service of IOKit driver
Get the service of IOFireWireLocalNode Set property hello's value as hello
Connect to the target service, open IOFireWireUserClient Call the driver's method, through the connection

Close connection with the target driver

Alibaba Security



Userland Perspective

· APIs in IOKit.framework are wrappers of Mach Traps (kinda syscall) , which are generated by Mach Interface Generator (MIG) and eventually call into callback methods implemented by userclients

API Mach trap

Userspace Kernel

MIG generated implementation

IOConnectCallMethod io_connect_method _Xio_connect_method

Real Implementation of Mach trap in kernel

is_io_connect_method

Callback methods of userclients

IOUserClient::externalMethod

Alibaba Security



Userland Perspective
· Despite of strict sandbox restriction, some userclients in IOKit drivers can still be accessed by sandboxed apps on iOS.
· Through experiments, we confirm these available userclients and their correponding IOKit device driver names on iOS 11
· IOHIDLibUserClient: AppleSPUHIDDevice, AppleCSHTDCodecMikey · IOMobileFramebufferUserClient: AppleCLCD · IOSurfaceAcceleratorClient: AppleM2ScalerCSCDriver · AppleJPEGDriverUserClient: AppleJPEGDrive · IOAccelDevice2, IOAccelSharedUserClient2, IOAccelCommandQueue2:
AGXAccelerator · AppleKeyStoreUserClient: AppleKeyStore · IOSurfaceSendRight, IOSurfaceRootUserClient: IOSurfaceRoot

Alibaba Security



New Vulns in Drivers on macOS ­ Current Secure Status
· Though within kernel, drivers are always blamed for poor quality, which make them frequently be used to exploit the kernel

· Vulns in drivers used in JailBreaks:
· 11 (v0rtex | electra): IOSurfaceRoot (CVE-2017-13861) · 9 (pangu): IOMobileFrameBuffer (CVE-2016-4654) · 8 (TaiG): IOHIDFamily (CVE-2015-5774) · 7 (pangu): AppleKeyStore (CVE-2014-4407)
· With the help of Ryuk, we found and confirmed some new vulns on macOS

Alibaba Security



New Vulns in Drivers on macOS ­ New Vuln 1 · Information Leakage due to uninitialized stack variable in
IOFirewireFamily driver (CVE-2017-7119) ­ To defeat kaslr

Alibaba Security



New Vulns in Drivers on macOS ­ New Vuln 1 · Information Leakage due to uninitialized stack variable in
IOFirewireFamily driver (CVE-2017-7119) ­ To defeat kaslr

Alibaba Security



New Vulns in Drivers on macOS ­ New Vuln 1 · Information Leakage due to uninitialized stack variable in
IOFirewireFamily driver (CVE-2017-7119) ­ To defeat kaslr

Alibaba Security



New Vulns in Drivers on macOS ­ New Vuln 1 · Information Leakage due to uninitialized stack variable in
IOFirewireFamily driver (CVE-2017-7119) ­ To defeat kaslr

Kernel slide = 0x4ebc0b6-0x8bc0b6 = 0x4600000 Though outChannelHandle is only 32bit, but enough since the high 32bit is always 0xffffff80 here

Alibaba Security



New Vulns in Drivers on macOS ­ New Vuln 2
· CVE-2018-4135: UAF in IOFirewireFamily driver ­ To control PC
· There is no locking or serialization when releasing and using a member variable
· fMem is a member of class IOFWUserReadCommand

Alibaba Security



New Vulns in Drivers on macOS ­ New Vuln 2
· CVE-2018-4135: UAF in IOFirewireFamily driver ­ To control PC
· Exploit: race two threads to call this function on the same userclient

Alibaba Security



New Vulns in Drivers on macOS ­ New Vuln 2
· CVE-2018-4135: UAF in IOFirewireFamily driver ­ To control PC
· Exploit: race two threads to call this function on the same userclient

Alibaba Security



New Vulns in Drivers on macOS ­ New EXP strategies: Heap Spray
· A new heap spray strategy utilizing OSUnserializeXML on macOS
· io_registry_entry_set_properties: set properties of device, eventually call is_io_registry_entry_set_properties in kernel

· Some drivers keep any properties set by userspace, e.g., IOHIDEventService · Pros: the sprayed data can be read; the head of sprayed data is controllable

Alibaba Security



New Vulns in Drivers on macOS ­ New EXP strategies: ROP

· After controlling PC, we can gain privilege through ROP chain · ROP chain (most employed from tpwn)

Stack Pivot _current_proc

_proc_ucred

_posix_cred_get

_bzero

_thread_exception_return

Get ptr to struct proc of current process

Get ucred from struct proc, i.e.,
process owner's identity

Get ptr to struct cr_posix

Exit kernel, return to userspace

Alibaba Security



New Vulns in Drivers on macOS ­ New EXP strategies: ROP

· After controlling PC, we can gain privilege through ROP chain

· Key step: Stack Pivot

In tpwn (on 10.10)

New

In rootsh (on 10.11)

Alibaba Security



New Vulns in Drivers on macOS ­ New EXP strategies: ROP

· After controlling PC, we can gain privilege through ROP chain

· Key step: Stack Pivot

Addr of Gadget P2 New Stack: RAX+0x50

RAX (Controlled or Known) RAX+0x8

New

Gadget P1

RAX Addr of Gadget "NOP; RET;" _current_proc, MOV RDI, RAX _proc_ucred, MOV RDI, RAX _posix_cred_get, MOV RDI, RAX
_bzero _thread_exception_return

RAX+0x30 RAX+0x38 RAX+0x40: New Stack Start
Gadget P2

Alibaba Security



New Vulns in Drivers on macOS ­ Whole EXP Process

Heap Spray Trigger Vuln

Addr of Gadget P2 New Stack: RAX+0x50

Control PC Jmp to Gadget P1
Run ROP chain Privilege Escalation

RAX Addr of Gadget "NOP; RET;" _current_proc, MOV RDI, RAX _proc_ucred, MOV RDI, RAX _posix_cred_get, MOV RDI, RAX
_bzero _thread_exception_return
high space of heap possessed by heap spray

Alibaba Security



New Vulns in Drivers on macOS ­ Privilege Escalation · Privilege escalation on the latest macOS
On macOS 10.13

On macOS 10.13.2

Bugs fixed on macOS 10.13.4

Alibaba Security



Analyze Apple Drivers: Obstacles
· But! Analyzing macOS and iOS kernel drivers is not easy!
· Closed-source · Programmed in C++ · Lack of Symbols (mainly for iOS)
· Let's first look at how drivers' binary code looks like in IDA pro

Alibaba Security



Analyze Apple Drivers: Obstacles
· How does a driver's binary look like in IDA pro ­ macOS
· Readable
Many symbols are kept

Alibaba Security



Analyze Apple Drivers: Obstacles
· How does a driver's binary look like in IDA pro ­ macOS
· Readable
Event better, we have symbols of vtables and know where they are

Alibaba Security



Analyze Apple Drivers: Obstacles · How does a driver's binary look like in IDA pro ­ macOS
· Readable
Even sMethods of userclients have
symbols

Alibaba Security



Analyze Apple Drivers: Obstacles
· How does a driver's binary look like in IDA pro ­ macOS
· Readable
Functions have meaningful names (for both internal
and externa).
These names can be demangled to
know the argument types

Alibaba Security



Analyze Apple Drivers: Obstacles
· How does a driver's binary look like in IDA pro ­ macOS
· Readable
Decompiled code is partially humanreadable

Alibaba Security



Analyze Apple Drivers: Obstacles
· How does a driver's binary look like in IDA pro ­ macOS
· Readable, but not suitable for manual review and static analysis
Types of object variables are
unknown
Classes' vtable function pointers are used everywhere, IDA pro cannot recognize.

Alibaba Security



Analyze Apple Drivers: Obstacles
· How does a driver's binary look like in IDA pro ­ macOS
· Readable, but not suitable for manual review and static analysis
No structures for classes
Class sizes are unknown
Member variables cannot be recognized
by IDA pro

Alibaba Security



Analyze Apple Drivers: Obstacles
· How does a driver's binary look like in IDA pro ­ iOS
· Messy! Nothing useful there! Unreadable, not to mention further analysis
Functions do not have symbols Function names are all meaningless "sub_"

Alibaba Security



Analyze Apple Drivers: Obstacles
· How does a driver's binary look like in IDA pro ­ iOS
· Messy! Nothing readable, not to mention further analysis
There is no symbol for vtables
No clue to know where vtables are
No entry can be found

Alibaba Security



Analyze Apple Drivers: Obstacles
· How does a driver's binary look like in IDA pro ­ iOS
· Messy! Nothing readable, not to mention further analysis
Functions cannot be recognized by IDA pro

Alibaba Security



Analyze Apple Drivers: Obstacles
· How does a driver's binary look like in IDA pro ­ iOS
· Messy! Nothing readable, not to mention further analysis
Function names are meaningless
Vtable function pointers are not recognized
Variables and arguments do not have any type information

Alibaba Security



Analyze Apple Drivers: Obstacles
· How does a driver's binary look like in IDA pro ­ iOS
· Messy! Nothing readable, not to mention further analysis
No structures for classes Class sizes are unknown Member variables cannot be recognized by IDA pro

Alibaba Security



Analyze Apple Drivers: A New Tool
· Ryuk: a new tool to recover symbols and solve object-oriented features in macOS and iOS drivers
· Ryuk: character in the comics series Death Note, who loves eating apples. · Implemented as IDA pro python script

Alibaba Security



Ryuk: Design
· Features of Ryuk:
· Class recognition and construction · Vtable recognition and construction · Recover function names · Resolve variable and argument types · UI support ·...

Alibaba Security



Ryuk: Effects

· Class Recognition and Construction

Size

Class Name

Alibaba Security



Ryuk: Effects · Vtable recognition and construction

Alibaba Security



Ryuk: Effects · Vtable recognition and construction

Alibaba Security



Ryuk: Effects · Recover function names

Alibaba Security



Ryuk: Effects · Recover function names, resolve variable and argument types,
function pointer and member variable recognition

Alibaba Security



Ryuk: Effects · UI support

Alibaba Security



Ryuk: Effects · UI support

Alibaba Security



Ryuk: Effects · UI support

Alibaba Security



Ryuk: Implementation · 1. Class recognition and construction
· Functions in __mod_init_func section register all classes
macOS

iOS

Alibaba Security



Ryuk: Implementation
· 1. Class recognition and construction
· Functions in __mod_init_func section register all classes

macOS iOS

Class Name Class Size Parent Class Info Registration

Alibaba Security

*Note: multiple inheritance is excluded in libkern


Ryuk: Implementation
· 1. Class recognition and construction
· Functions in __mod_init_func section register all classes

macOS iOS

Class Name Class Size Parent Class Info

Alibaba Security

*Note: multiple inheritance is excluded in libkern


Ryuk: Implementation
· 1. Class recognition and construction: Effect
· Structures representing classes are created

Alibaba Security



Ryuk: Implementation
· 2. Vtable recognition and construction
· On macOS, vtables have symbols and known addresses, no need to find

Alibaba Security



Ryuk: Implementation
· 2. Vtable recognition and construction
· On iOS, step 1: adjust the __const section
· Vtables are in __const section, but IDA pro makes it disappear

Alibaba Security



Ryuk: Implementation · 2. Vtable recognition and construction
· On iOS, step 2: find address of class's metaclass object
· Functions in __mod_init_func section are parsed again
Addrss of class's metaclass object

Alibaba Security



Ryuk: Implementation
· 2. Vtable recognition and construction
· On iOS, step 3: Get xrefs to metaclass object
· The xref in const section nears the vtable

Alibaba Security



Ryuk: Implementation
· 2. Vtable recognition and construction
· On iOS, step 3: Get xrefs to metaclass object
· Data before vtables is in some specific format

Xref to metaclass object Xref to parent's metaclass Vtable start preceeding by 2 zero

Alibaba Security



Ryuk: Implementation
· 2. Vtable recognition and construction: Effects
· Create structures representing vtables and set the first member of classes as an pointer to their vtable

Alibaba Security



Ryuk: Implementation
· 3. Recover function names (virtual functions on iOS)
· Most classes inherit from basic classes in iokit framework like IOService, OSObject, etc., which have meaningful function names
· Replace the class name in the overriden virtual functions

Overriden virtual functions
IOSurfaceRoot:: getMetaCalss

Alibaba Security



Ryuk: Implementation · 3. Recover function names (virtual functions on iOS): Effects

Alibaba Security



Ryuk: Implementation · 4. Resolve variable and argument types
· Step 1: Figure out the creation of variables
Allocation Allocation Constructor
Cast

Alibaba Security



Ryuk: Implementation
· 4. Resolve variable and argument types
· Step 2: Variable types are decided

Alibaba Security



Ryuk: Implementation

· 5. UI support
· Purposes:
· Jump to virtual function's (or children's) implementation when doubleclick on function pointers
· Keep the name and type consistency between function pointer and their implementation
· Implementation:
· Register action to double-click events · Register action to key events · Register action to name change events · Register action to type change events

Alibaba Security



Ryuk: Benefits
· For manual review:
· Function names are meaningful · Function pointers are recognized · Member variable are recognized · Variable types are known · You can jump to virtual function's implementation from their pointers
with just a double-click
· For static analysis:
· Variable types are resolved · Call targets of function pointers are known · Further CFG can be easily constructed

Alibaba Security



Conclusions
· Explanation and illustration of 2 new CVEs in macOS drivers · Illustration of whole exploit chain of privilege escalation on macOS · Innovative exploitation techniques on latest macOS · Ryuk: a new tool for assisting the analysis of macOS and iOS drivers · Most important!
· https://github.com/bxl1989/Ryuk

Alibaba Security



Thanks

Alibaba Security



