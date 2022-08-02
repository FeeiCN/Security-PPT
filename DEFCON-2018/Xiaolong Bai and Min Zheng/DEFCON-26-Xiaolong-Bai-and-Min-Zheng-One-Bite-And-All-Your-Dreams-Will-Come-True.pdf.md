One bite and all your dreams will come true: Analyzing and Attacking Apple Kernel Drivers
X(aolon& Ba( & M(n Spar)) Zhen&
1

Xiaolong Bai

Min (Spark) Zheng

Alibaba Security Engineer

Alibaba Security Expert

Ph.D. graduated from Tsinghua University
Published papers on the top 4: S&P, Usenix Security, CCS, NDSS

Ph.D. graduated from The CUHK
Twitter@SparkZheng Weibo@spark

Twitter, Weibo, Github: bxl1989

2

1Overview

2New vulns in
Apple drivers

3Obstacles in analyzing Apple drivers

4Ryuk: a new
static analysis tool to analyze drivers

5Ryuk-Fuzz:
combine fuzzing with static analysis

3

6Conclusions

Overview
4

Every driver is a kernel extension (.kext) sharing the same space with the kernel
 Location of driver binaries:

· On macOS: /System/Library/Extensions
 · On iOS: integrated with kernel in kernelcache
5

Userclient: kernel objects for drivers to provide service to programs in userspace
 Userclient is the interface between user-space applications and devices
6

In order to provide services, userclients need to implement several callback methods:

· externalMethod: Provide methods that can be called in user-
space

· clientMemoryForType: Share memory with apps in user-
space

· registerNotificationPort: Allow user-space app to register for
notifications

· clientClose: Close connection with user-space app
 ·...
7

externalMethod(uint32_t selector,  IOExternalMethodArguments *arguments,  IOExternalMethodDispatch *dispatch,  OSObject *target, void *reference);

· Callback to provide methods to userspace program
 · selector: to select method in userclient
 · arguments: arguments passed to the selected method
 · dispatch: a struct representing the method to be called
 · target: the target userclient for the method to be called on
 · reference: reference to send results back to userspace program
8

Despite of strict sandbox restriction, some userclients are still be accessible to sandboxed apps on iOS:

· IOHIDLibUserClient
 · IOMobileFramebufferUserClient
 · IOSurfaceAcceleratorClient
 · AppleJPEGDriverUserClient
 · IOAccelDevice2, IOAccelSharedUserClient2,
IOAccelCommandQueue2

· AppleKeyStoreUserClient
 · IOSurfaceSendRight, IOSurfaceRootUserClient
9

New vulns in Apple drivers
10

Drivers are good targets for exploiting the kernel

· Share the same space with the kernel
 · Have kernel privileges
 · Some programmed by third-party vendors, not kernel
developer

· Code quality is not guaranteed

Drivers are frequently exploited in attacks against the kernel, including jailbreaks
11

Previous vulns in drivers used in jailbreaks:

· 11 (v0rtex/electra): IOSurfaceRoot (CVE-2017-13861)
 · 9 (pangu): IOMobileFrameBuffer (CVE-2016-4654)
 · 8 (TaiG): IOHIDFamily (CVE-2015-5774)
 · 7 (pangu): AppleKeyStore (CVE-2014-4407) 

Next, let's have a look at some new vulns we recently discovered in Apple drivers!
12

Privilege escalation on macOS 10.13.3
13

This privilege escalation leverages a new Use-AfterFree vulnerability in the driver IOAcceleratorFamily2

· IOAccelDisplayPipeUserClient2::s_transaction_end
All IOAccelDisplayPipeUserClient2  share the same IOAccelDisplayPipe2
14

This privilege escalation leverages a new Use-AfterFree vulnerability in the driver IOAcceleratorFamily2

· IOAccelDisplayPipe2::transaction_end
IOAccelDisplayPipe2 contains a link list of IOAccelDisplayPipe2Transaction2. IOAccelDisplayPipe2::transaction_end traverse the link list to find a transaction
A link list of transactions in this IOAccelDisplayPipe2
And further call IOAccelDisplayPipeTransaction2::set_transaction_args using the found transaction
15

This privilege escalation leverages a new Use-AfterFree vulnerability in the driver IOAcceleratorFamily2

· IOAccelDisplayPipeTransaction2::set_transaction_args
mAccelDisplayPipeUserClient2 is a member of IOAccelDisplayPipeTransaction2,  whose type is IOAccelDisplayPipeUserClient2, 
representing which userclient the transaction belongs to The userclient that this transaction belongs to
16

This privilege escalation leverages a new Use-AfterFree vulnerability in the driver IOAcceleratorFamily2

· But, mAccelDisplayPipeUserClient2 can be released by
calling IOServiceClose from user space, causing useafter-free
Userclient can be released from user space
Cause use-after-freee
17

Exploitation of the bug

· Creat 2 IOAccelDisplayPipeUserClient2
 · Begin a IOAccelDisplayPipeTransaction2 by userclient1
 · Release userclient1
 · End the transaction from userclient2 --> use-after-free

The bug is not exploitable now! 

· Reason: different IOAccelDisplayPipeUserClient2 do not
share the same IOAccelDisplayPipe2 now !
18

Besides the above vuln, we also discovered some other new vulns in Apple drivers

· CVE-2017-7119 
 · CVE-2018-4135 

Next, we will show details of these vulns

19

CVE-2017-7119

· Information leakage in IOFirewireFamily
 · Caused by uninitialized stack variable
 · In IOFireWireUserClient::externalMethod

20

CVE-2017-7119

· In IOFireWireUserClient::isochChannel_Create

21

CVE-2017-7119

· In IOFWUserObjectExporter::addObject

· outHandle should be set with the index of new-added object
 · But, when newCapacity reaches 0xFFFE, new object will not
be added and outHandle will not be set
22

CVE-2017-7119

· Recall in IOFireWireUserClient::externalMethod
 · outHandle is unintialized and returned to userspace
 · Information leak!
23

CVE-2017-7119

· Can be exploited to get kernel slide, defeat kaslr, e.g.
Kernel slide = 0x4ebc0b6-0x8bc0b6 = 0x4600000 Though outChannelHandle is only 32bit, but enough since the high 32bit is always 0xffffff80 here
24

CVE-2018-4135 

· Use-After-Free in IOFirewireFamily driver
 · Lack of locking or serialization when using and
releasing a member variable

· Can be exploited to control PC in kernel

25

CVE-2018-4135 

· Use-After-Free in IOFirewireFamily driver
 · Lack of locking or serialization when using and
releasing a member variable

· In IOFireWireUserClient::externalMethod,
26

CVE-2018-4135 

· IOFireWireUserClient::userAsyncCommand_Submit
looks up for a IOFWUserReadCommand and calls its "submit" method
27

CVE-2018-4135 

· In IOFWUserReadCommand::submit
28

CVE-2018-4135 

· (a) release fMem, (b) uses fMem (fMem is a member)
29

CVE-2018-4135
 Exploit: 

· Create two threads to invoke method on the same
userclient

· One thread release fMem, the other uses it

30

How to exploit Use-After-Free bug in the kernel for privilege escalation?

Basic flow:


Construct ROP chain

Trigger release

Heap spray in kernel

Trigger use

...
Target Object
...

...
Empty Slot
...

...
Fake object with fake viable
...
31

...
PC control
Fake object with fake viable
...

A new heap spray method on macOS

· Utilize OSUnserializeXML 
 · Set properties of a device
32

A new heap spray method on macOS

· Some drivers keep any properties set by userspace,
e.g., IOHIDEventService

· Pros: the sprayed data can be read; the head of
sprayed data is controllable
33

ROP chain for privilege escalation
Stack Pivot

_current_proc

Get ptr to struct proc of current process

_proc_ucred

Get ucred from struct proc, i.e., process owner's iden+ty

_posix_cred_get

Get ptr to struct cr_posix

_bzero

Clear cr_uid, cr_ruid, cr_svuid in cr_posix struct

_thread_excep+on_return Exit kernel, return to userspace
34

Stack Pivot: Change current stack, for performing ROP in an elegant way

· Previous Methods (Unavailable Now)
In tpwn (on 10.10)
In rootsh (on 10.11)
35

Stack Pivot: Change current stack, for performing ROP in an elegant way

· New Method

Step 1: Control RAX and affect RCX (Gadget P1)

Step 2: Modify RSP by controlled RCX (Gadget P2)

36

Layout of gadgets in a ROP chain


· Assume: RAX is controlled and [RAX+0x10] is to be called


Content

· Store address X in RAX, X contains a ROP chain

Addr of Gadget P2 New RSP: X+0x50 Addr of Gadget P1

X X+0x8 X+0x10, ROP starts from here

... X Addr of Gadget "NOP; RET;" Addr of _current_proc and Gadget "MOV RDI, RAX"

X+0x30 X+0x38 X+0x40, start privilege escalation

Address of _proc_ucred and Gadget "MOV RDI, RAX"

Address of _posix_cred_get and Gadget "MOV RDI, RAX"

Addr of _bzero

Addr of G_thread_exception_return
37

Address

Privilege escalation on the macOS 10.13 and 10.13.2

38

Obstacles in analyzing Apple drivers
39

Analyzing macOS and iOS kernel drivers is not easy!

· Drivers are closed-source: binaries are lack of high-level
semantics and variable types are lost

· Drivers are programmed in C++: virtual functions are
widely used but object types are unknown --> the real function called is unknown

· Symbols are lost in iOS drivers: iOS kernelcache strips
all symbols in drivers

40

What does a driver's binary look like in IDA pro?

· macOS driver: some symbols are kept

41

What does a driver's binary look like in IDA pro?

· macOS driver: But! Wrong parameter inference, lack of
variable types, unrecognizable virtual function calls

Wrong parameter inference Variable types are lost
Virtual function calls are unrecognizable
42

What does a driver's binary look like in IDA pro?

· iOS driver: symbols are totally lost

43

What does a driver's binary look like in IDA pro?

· iOS driver: data structure is gone, e.g. this figure should
be the location of a virtual table

44

What does a driver's binary look like in IDA pro?

· iOS driver: meaningless function names, totally lost
variable types, unrecognized virtual function calls 

Wronegvdeerycwomhepriele! result
45

What exactly do we want for a binary to be?

· Function (including virtual func) calls are recognizable,
the called functions are known

· Missing symbols are recovered, decompiled code is
understandable... 

Why?

· Knowing the real call target is a prerequisite for inter-
procedure analysis and futher analysis

· Manual review needs meaningful decompiled code
46

What exactly do we want for a binary to be?

· Just like we have the source code

47

Ryuk: a new static analysis tool  to analyze Apple drivers
48

Ryuk: a new static analysis tool aiming at solving uncertainties in Apple drivers, for further analyzing drivers' security

· Implemented as an IDA pro python script 

*Ryuk: a character in the comics series Death Note, who loves eating apples.
49

Ryuk's features (functionalities):

· Class recognition: identify classes' information
 · VTable recognition: identify classes' virtual functions
 · Recover function names: only for iOS drivers
 · Resolve variable types: resolve and mark variable types
 · Add cross references: for members and virtual funcs
 · UI support: better UI support for manual review
 · Call graph generation: for inter-procedure analysis
50

Class recognition

· Purpose: for variable type inference and further analysis
 · Method: depend on RTTI information left in binaries
 · Apple drivers are programed in C++ and support a
limited RTTI feature

· __mod_init_func: a section containing initialization
functions to support RTTI

· Analyzing functions in __mod_init_func section, we can
get information of classes (name, size...)
51

Class recognition

· __mod_init_func
macOS
iOS
52

Class recognition

· Functions in __mod_init_func: register class information
macOS
Class Name Class Size iOS
53

Class recognition

· Decompiled code of functions in __mod_init_func
macOS
iOS
54

Class recognition

· With identified class names and sizes, we can create
structures to represent these classes in IDA pro
55

VTable recognition

· In C++, virtual functions of a class are organized in a
structure called VTable, which is in __const section 

· In every C++ class, the first member is always a pointer
to this VTable.

VTable

Source code

Decompiled  code

56

VTable recognition

· Purpose: resolve the real targets of virtual function calls
 · Method: on macOS, there are symbols for VTables

Symbols of VTables

VTable structure
57

VTable recognition


· Method: on iOS, several steps depending on the
vtable's specific structure


· Hint: find class's global metaclass object and further

find VTable

Class's global metaclass object

VTable start
58

VTable recognition

· iOS Step 1: adjust __const section in IDA pro

· In __const, mark each 8 bytes as a pointer
59

VTable recognition

· iOS Step 2: find address of class's global metaclass
object in initialization function of __mod_init_func 

· In Apple driver, most C++ classes have a global metaclass
object describing the class's basic information
Address of class's global metaclass object
Initialization function of __mod_init_func
60

VTable recognition

· iOS Step 3: check cross references of the global
metaclass object, find the one in const section and near the VTable
In const section  and near VTable
61

VTable recognition

· iOS Step 4: found VTable

The address of global metalcass object VTable start found!

62

VTable recognition

· After recognition, create structure in IDA pro standing
for the VTable, each member is pointer to a virtual func

· Set the first member of class structure as a pointer to
this VTable structure

VTable structure

63

Class structure

Recover function names (only for iOS)

· In drivers, most classes inherit from classes in the
kernel, e.g., IOService, OSObject

· Most classes in the kernel still keep symbols 
 · In C++, when a child class inherits from a parent class
and overrides a virtual function, the overriden function has same name and offset in VTable

class A { public: virtual void foo();
}

class B: public A { public: virtual void foo();
}

... A::foo
...
A's VTable
64

Same name Same offset
in VTable

... B::foo
...
B's VTable

Recover function names (only for iOS)

· Only recover the overridden virtual functions in classes
inherited from classes in the kernel

· Not a complete solution, but cover plenty of critical
functions
IOSurfaceRoot:: IOSurfaceRoot

overriden functions

IOSurfaceRoot:: getMetaClass

IOSurfaceRoot's VTable (IOSurfaceRoot is inherited from IOSerivce)

IOSurfaceRoot:: free
65

IOService' VTable

Recover function names (only for iOS)

· Many function names can be recovered in this way

Original
66

Now

Resolve variable types (in IDA pro's decompiled code)

· For local, global and member variables
 · Method: identify variable types and perform type
propagation 

· How to identify variable types: two ways

· 1. Depend on features of function names in C++
 · 2. Figure out the creation and iniatialization of variables
67

Resolve variable types (in IDA pro's decompiled code)

· Identify variable types method 1:

· After compilation, names of functions in C++ classes will
be encoded with the function name and argument types

· Decode (demangle) the C++ function names to get the type
of function arguments, e.g.

__ZN23IOSurfaceRootUserClient4initEP13IOSurfaceRootP4taskP12OSDictionary
Decode (Demangle)
IOSurfaceRootUserClient::init (IOSurfaceRoot *, task *, OSDictionary *)

68

Variable Types

Resolve variable types (in IDA pro's decompiled code)

· Identify variable types method 2:

· Figure out the creation and iniatialization of variables
 · Find invocation of variable allocation, initialization and type
casting functions, e.g.

Allocation Func: OSMetaClass::allocClassWithName (const char *name)


Allocatoin Func: IOSurfaceRootUserClient::MetaClass::alloc ( )


Init Func:

IOCommandGate::IOCommandGate (IOCommandGate *)


Type Cast:

OSMetaClassBase::safeMetaCast (OSMetaClassBase *, OSMetaClass *)

69

Resolve variable types (in IDA pro's decompiled code)

· After identifying variable types, we can perform type
propagation along function's control flow
Type of v2 is IOAccelShared2 *
Type of v2 is IOGraphicsAccelerator2 *
70

Resolve variable types (in IDA pro's decompiled code)

· After identifying variable types, we can perform type
propagation along function's control flow
Propagate v2's type and affect the return type of function
Propagate v2's type and modify member variable's type
71

Add cross references:

· Purpose: add cross references for member varaibles
and virtual functions

· Method: examine every sentence in the decompiled
code of all functions, check whether member variable or virtual function is used, e.g.
72

Add cross references:

· References are added from the usage to members in
the class structures and to virtual function's implementation
73

Now, driver's decompiled code in IDA pro looks like

· Looks more like source code, right?
74

But, for manual review in IDA pro's decompiled code, though virtual function calls are recognized and identified with the help of above features, researchers still need more manual operation to examine the function's implementation. e.g.
Manual operation:

Step 1: Copy name of the called function
75

Step 2: Search the function name

UI support 

· Extend UI operation that can be performed in IDA pro's
decompiled code

· Method:

· Register action to double-click events
 · Register action to key events
 · Register action to name change events
 · Register action to type change events
76

UI support 

· Extend UI operation that can be performed in IDA pro's
decompiled code, e.g. jump to virtual function's implementation by just a double click

· Method:

· Register action to double-click events
 · Register action to key events
 · Register action to name change events
 · Register action to type change events
77

UI support
78

Generate call graph

· For further inter-procedure analysis, call graph is the
prerequisite 

· After variable types are resolved, targets of virtual
function calls can be recognized

· Then we can build call graph for all functions
79

Now, everything is ready, you can do your own manual analysis and static analysis
80

Ryuk-Fuzz: combine fuzzing  with static analysis
81

One use case of Ryuk: Ryuk-Fuzz

· Idea: Guide fuzzing of drivers with Ryuk's static analysis 
 · Implementation: Integrate Ryuk with the state-of-art
Apple kernel driver fuzzer, PassiveFuzzFrameworkOSX 

· Method: 

· Step 1: Perform data flow analysis in Ryuk to infer drivers'
required user input formats

· Step 2: During fuzzing, use the inferred input formats to
guide input generation and improve fuzzing efficiency
82

Ryuk-Fuzz Step 1: Static data flow analysis to infer user input formats
Offset:0 Size: whole
Offset:24 Size: 1 Offset:0 Size: 4
Offset:68 Size: 4
83

Ryuk-Fuzz Step 1: Static data flow analysis to infer user input formats
Condition: offset 24, size: 1 should not be equal to 6 or 1
Condition: offset 0, size: 4 last 4 bits should not be equal to 0
84

Ryuk-Fuzz Step 2: Guide fuzzing

· BUT ! PassiveFuzzFrameworkOSX has implementation
errors

· Error 1: Wrong buffer size for reading the kernel header
(affect macOS 10.12 and later)

Error in PassiveFuzzFrameworkOSX
85

Ryuk-Fuzz Step 2: Guide fuzzing

· Error 1: Wrong buffer size for reading the kernel header
(affect macOS 10.12 and later)

PassiveFuzzFrameworkOSX assumes  kernel header is smaller than a page
86

Ryuk-Fuzz Step 2: Guide fuzzing

· Cause of Error 1: Wrong buffer size for reading the
kernel header (affect macOS 10.12 and later)

Before 10.12 Header size is  smaller than 1 page
After 10.12 Header size is  larger than 1 page
87

Ryuk-Fuzz Step 2: Guide fuzzing

· Solution to Error 1: enlarge the allocation size

2 * PAGE_SIZE_64
88

Ryuk-Fuzz Step 2: Guide fuzzing

· Error still exists in PassiveFuzzFrameworkOSX
 · Error 2: Wrong way to infer kernel base at runtime 
(affect 10.13.2 and after) 

PassiveFuzzFrameworkOSX calcuate the address of interrupt handler  and search backwards for mach-o header ( i.e. the kernel base address )
89

Ryuk-Fuzz Step 2: Guide fuzzing

· Cause of Error 2: In current macOS, interrupt handler is
not in kernel text section now. As a result, we can not find the kernel base by searching backwards from the interrupt handler 


Before macOS 10.13.2 Kernel text start
(kernel base)
Address of  interrupt handler

After macOS 10.13.2

Address of  interrupt handler
Kernel text start (kernel base)

Some other section

Kernel text section

90

Kernel text section

Ryuk-Fuzz Step 2: Guide fuzzing

· Why the interrupt handler is not in kernel text now?

· The side effect of Apple's patch to mitigate Meltdown
vulnerability

· Apple splits user and kernel space, in which interrupt
handler entries are not in kernel text space now

· As a result, kernel text base can not be inferred by the
interrupt handler

91

Ryuk-Fuzz Step 2: Guide fuzzing

· Solution to Error 2: Search backwards from the address
of some other address, e.g. address of _lck_mtx_lock

Get the address of _lck_mtx_lock
92

Conclusions
93

Vulnerabilities that can be exploited for privilege escalation on macOS
 Technique of exploiting use-after-free vulnerability in the kernel
 Ryuk: a new static analysis tool assisting manually reverse engineering and static analysis
 Ryuk-Fuzz: guide fuzzing of drivers with static analysis results
94

Q&A
95

