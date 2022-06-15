OPTIMIZED  FUZZING  IOKIT  IN  IOS  
LEI  LONG

WHO AM I?
· LEI LONG · Security Expert in Mobile Security of Alibaba Group · Focus on Security Research of iOS · Twitter:@cererdlong

Outlines
· Introduction · Information Extraction · Fuzzing · Results

Part I
Introduction

Introduction(I)

IOKit

App-0 App-1

...

App-N

IOKit Userspace Interface

Userspace Kernel

XNU

KEXT-0 KEXT-1

...

IOKit Kernel FrameworkXNU

KEXT-n

Introduction(I)
Previous Research
· Focused on IOExternalMethodDispatch · Base on IDA static analysis · Disadvantages
· sMethod symbols required · Decrypted kernelcache required · Unresolved instructions of some KEXTs · Insufficient information

Introduction(I)

Our Work

· Not only IOExternalMethodDispatch · Base on dynamically kernel read/write · Advantages
· Independent of sMethod symbols · A decrypted kernelcache not required · More sufficient information

Introduction(I)

Prerequisite

· Jailbroken device

· tfp0 kernel patch

Part II
Information Extraction

Information Extraction
· Basic Information · IOUserClients' Access Info · IOExternalMethodDispatch · IOExternalMethod

Information Extraction(II)
Basic Information

Information Extraction(II): Basic Information
Basic Information
· All OSObject subclasses
· Information Types
· Class name · Vtable start address · Virtual method address and its vtable offset · Symbol of overwritten virtual method · Instance size · Inheritance relationships

Information Extraction(II): Basic Information
Basic Information
Class:AppleARMPMUPowerSource BundleID:com.apple.driver.AppleARMPlatform vtableaddr:0x804c71a8 instance size:0x184
SuperClassNames: IOPMPowerSource IOService IORegistryEntry OSObject
Method Virtuals: [vtable,0x0] overwrite at 0x804b4804 [vtable,0x4] overwrite __ZN15IOPMPowerSourceD0Ev at 0x804b4808 [vtable,0x1c] overwrite __ZNK15IOPMPowerSource12getMetaClassEv at 0x804b481c [vtable,0x50] overwrite __ZN9IOService4initEP12OSDictionary at 0x804b4858 [vtable,0xac] overwrite __ZN15IORegistryEntry13setPropertiesEP8OSObject at 0x804b5c08 [vtable,0x168] overwrite __ZN9IOService5startEPS_ at 0x804b4888 [vtable,0x1d0] overwrite __ZNK9IOService11getWorkLoopEv at 0x804b5458 [vtable,0x1e8] overwrite __ZN9IOService20callPlatformFunctionEPK8OSSymbolbPvS3_S3_S3_ at 0x804b5518 [vtable,0x300] overwrite __ZN9IOService13setPowerStateEmPS_ at 0x804b54e8 [vtable,0x344] at 0x804b5454 [vtable,0x348] at 0x804b6070

Information Extraction(II): Basic Information
Motivation Of Basic Information Extraction

Information Extraction(II): Basic Information
Pick Out Vtable
· Locating kernel mach-o's __DATA,__const
· Kernel · Kernel extensions
· Vtable filter
· Vtable layout · Vtable characteristic

Information Extraction(II): Basic Information

Vtable Layout

0(>=4 Byte) virtual method 0 virtual method 1 virtual method 2 virtual method 3
.... virtual method N-3 virtual method N-2 virtual method N-1

· Thumb virtual method addresses
x(TEXT_StartAddrss, TEXT_EndAddress)
or x(PERLINKTEXT_StartAddrss, PERLINKTEXT_EndAddress)
· N[14, )
· Starting after at least four all-0 bytes

Information Extraction(II): Basic Information
Vtable Characteristic

virtual method 0 .... ... ...
virtual method 7:getMetaClass ... ... ...
virtual method N-1

key to get runtime information

Information Extraction(II): Basic Information

getMetaClass Definition

· OSDefineMetaClassAndStructors

Define OSDefineMetaClassAndStructors \

....

const OSMetaClass * className ::getMetaClass() const \

{ return &gMetaClass; }

\

....

· gMetaClass is the key to get runtime information.

Information Extraction(II): Basic Information
gMetaClass address
· KERNEL
addr_a1:MOV R0,#imm1 addr_a2:ADD R0,PC addr_a3:BX LR
gMetaClass2=addr_b2 + imm1 + 4
· KEXT
addr_b1:LDR R0 =#imm2 addr_b2:ADD R0,PC addr_b3:BX LR
gMetaClass2=addr_b2 + KernelRead4Byte(addr_b1+(4-(addr_b1+imm2)%4)) + 4

Information Extraction(II): Basic Information
gMetaClass Layout

gMetaClass Layout ...
offset-0x8:superClassLink offset-0xC:className offset-0x10:classSize
...

OSSymbol Layout ...
offset-0xC:length,type:unsigned int offset-0x10:string,type:char ptr
...

· classSize - unsigned int
· superClassLink - OSMetaClass ptr
· Backwards to OSObject · All inheritance relationships

Information Extraction(II): Basic Information
Functionality Provided by KEXT
IOConnectSetCFProperties

Example

IOSomeService::setProperties
Some KEXT

IOService::setProperties(EMPTY)
XNU

Information Extraction(II): Basic Information
virtual methods' "overwritten"

virtual method 0 virtual method 1 virtual method 2 virtual method 3
.... virtual method N-3 virtual method N-2 virtual method N-1 virtual method N

if( address(KERNEL_TEXT_StartAddress, KERNEL_TEXT_EndAddress) {
//implementation in XNU without overwriting ...... } else { //overwritten implementation ...... }

Information Extraction(II): Basic Information
Overwritten virtual methods symbolization
· Assumption · The same names and sequences in the same iOS version in different devices
· Obtaining names and sequences from kernelcaches with leaked decrypting-keys
http://theiphonewiki.com/wiki/Firmware_Keys: kernelcache.release.n94 IV: ae291ecd536ab102e6975a730f065f2f Key: c45aac2036dea7bf564bd99399e6ff35b241b580afd323a7aee1b6e9162b1d4f
TextBlock 10
· deducing the symbolization in those encrypted kernelcaches without keys

Information Extraction(II): Basic Information
Obtaining names and sequences from decrypted kernelcache
· Command "nm kernelcache" · Vtable information export · Name-Address pair matching

Information Extraction(II): IOUserClients' Access Info
IOUserClients' Access Info

Information Extraction(II): IOUserClients' Access Info
Example
Client:IOPKEAcceleratorUserClient Service:AppleSamsungPKE:0 vtableaddr:0x807341f8 canOpen:1 instance size:0x80

Information Extraction(II): IOUserClients' Access Info
Access Info Export
service name-s1

IOServiceGetMatchingService

IOObjectCopyClass

service name-s2

openType

Client Mach Port Name

Client Address

Client Name-c1
(c1, s2, openType)

Information Extraction(II): IOUserClients' Access Info
Detail Steps
· s1: obtain all subclasses of IOService
· OSKextCopyLoadedKextInfo · Basic Information Extraction
· openType: try all openTypes
· 0x00~0xff · magicCodes: locating newUserClient
· c1: retrieve Client Name
· mach_port_kobject · mach_port_space_info

Information Extraction(II): IOUserClients' Access Info
ipc_port ptr via mach_port_space_info

vm_address_t cr_mach_port_kobject(vm_address_t portname) { ipc_info_space_t info; ipc_info_name_array_t table = 0; mach_msg_type_number_t tableCount = 0; ipc_info_tree_name_array_t tree = 0; mach_msg_type_number_t treeCount = 0; vm_address_t obaddress = 0; mach_port_space_info(mach_task_self(), &info, &table,
&tableCount, &tree, &treeCount); for( int index = 0 ; index < tableCount ; index++ ) { ipc_info_name_t info = table[index]; if(portname == info.iin_name) { obaddress = info.iin_object; } } obaddress -= vm_kernel_addrperm;
//obaddress is the address of structure ipc_port. By adding offset //0x44,we can get ipc_kobject_t kobject in 32-bit devices.
return CRReadAtAddress(obaddress+0x44); }
TextBlock 13

· ipc_info_name_t->iin_name == client port name
· ipc_info_name_t->iin_object = obfuscated ipc_port ptr
· ipc_port ptr = obfuscated vm_kernel_addrperm

Information Extraction(II): IOUserClients' Access Info
vm_kernel_addrperm
· By locating a kernel function with
· VM_KERNEL_ADDRPERM · A unique characteristics string
· Luckily, IOGeneralMemoryDescriptor::wireVirtual
· ipc_port ptr = obfuscated - KernelRead(vm_kernel_addrperm's address)

Information Extraction(II): IOUserClients' Access Info

Retrieve Client Name
· Client address in struct ipc_port

ipc_port layout ...
kdata.kobject(offset 0x44) ...

client address

· Retrieve Client Name Via Client Address
· Get vtable address · Locate getMetaClass() · Get gMetaClass ptr · Get client name

Information Extraction(II): IOExternalMethodDispatch
IOExternalMethodDispatch

Information Extraction(II): IOExternalMethodDispatch
IOExternalMethodDispatch
IOUserClient::externalMethod
· Be overwritten to provide IO services
· Use IOExternalMethodDispatch for input/output check · type · length
· 0xe00002c2 error if check failed

Information Extraction(II): IOExternalMethodDispatch
Extracting IOExternalMethodDispatch
1. Narrow and determine the searching scope. 2. Match IOExternalMethodDispatch Table characteristics. 3. Locate IOExternalMethodDispatch Table address. 4. Dump all.

Information Extraction(II): IOExternalMethodDispatch
IOExternalMethodDispatch Table characteristics

· IOExternalMethodDispatch fields

Function checkScalarInputCount checkScalarInputCount checkScalarOutputCount checkStructureOutputSize

Function(TEXT_START, TEXT_END) Function(PRELINK_TEXT_START,
PRELINK_TEXT_END) checkScalarInputCount=0xffffffff or checkScalarInputCount[0,0xffff)
checkScalarInputCount=0xffffffff or checkScalarInputCount[0,0xffff)
checkScalarOutputCount=0xffffffff or checkScalarOutputCount[0,0xffff)
checkStructureOutputSize=0xffffffff or checkStructureOutputSize[0,0xffff)

· Table length >= 2

Information Extraction(II): IOExternalMethodDispatch

IOExternalMethodDispatch Table Dump

0 Client virtual method 0
1~N Client virtual method N
.... Client metaClass virtual method 0
1~N Client metaClass virtual method N
.... .... function-0 checkScalarInputCount-0 checkStructureInputSize-0 checkScalarOutputCount-0 checkStructureOutputSize-0 1~N function-N checkScalarInputCount-N checkScalarInputCount-N checkScalarOutputCount-N checkStructureOutputSize-N

client vtable start address
continous all-0 bytes client meta class vtable start address Position-x continous all-0 bytes Variables block start addressRang-x IOExternalMethodDispatch Table blockStart
Locating Position-x address
Searching from Position-x by bytes (in Rang-x)
at least 2 continuous blocks matching the characteristics (Start)
IOExternalMethodDispatch Table starting address

Information Extraction(II): IOExternalMethodDispatch
Complemental Mechanism

virtual method 0 .... ... ...
overwrite externalMethod ... ... ...
virtual method N-1

externalMethod START

...

LDR Rn0,#imm0

check address-0 with the characteristic

...

ADD Rn0,PC

...

LDR Rn1,#imm1

check address-1 with the characteristic

...

ADD Rn1,PC

...

LDR Rnn,#immn

check address-n with the characteristic

...

ADD Rnn,PC

...

externalMethod END

Information Extraction(II): IOExternalMethod
IOExternalMethod

Information Extraction(II): IOExternalMethod
IOExternalMethod
IOUserClient::getTargetAndMethodForIndex
· be overwritten to provide IO services
· use IOExternalMethod for input/output check · type · length
· 0xe00002c2 error if check failed

Information Extraction(II): IOExternalMethod
Extract IOExternalMethod
· IOExternalMethod Export
by directly invoking getTargetAndMethodForIndex
· Arbitrary kernel code execution
Stefan Esser, "Tales from iOS 6 Exploitation and iOS 7", HITB 2013

Information Extraction(II): IOExternalMethod
Carrier
· Mach Msg OOL Data
· locating OOL Data address
mach_port_space_info-> struct ipc_mqueue-> struct ipc_kmsg_queue messages-> struct ipc_kmsg *ikmq_base-> mach_msg_header_t *ikm_header-> msgh_remote_portool address)-> msgh_remote_port + 52

Information Extraction(II): IOExternalMethod

vtable

MetaData 52Byte

Gadget Client Instance
....
MOV R0,R1 BX LR
....
Kernel TEXT

.... fake getExternalTrapForIndex+1
.... fake vtable data
4 Byte(Write Server Ptr)
ClientA
ClientA:getTargetAndMethodF orIndex+1
payload(8 Bytes)
Constructed Mach Msg OOL Data

IOConnectTrap2 parameters
connect (Gadget Client Handle)
index arg->p1 arg->p2 IOExternalMethod Table Index

Part III
Fuzzing

Fuzzing(III)
Fuzzing Application's Architecture

Panic Log Collector SpringBoard Auto Unlock

Fuzz Thread

Deadlock Slow Monitor Monitor
Stop and Skip

Panic and Reboot

Fuzzing(III):Fuzzing Preparation
Fuzzing Elements
· Fuzzing IOConnectMapMemory
· If overwriting clientMemoryForType?
· Fuzzing IOConnectCallMethod
· If overwriting externalMethod? · If overwriting getTargetAndMethodForIndex? · If overwriting getExternalMethodForIndex?

Fuzzing(III):Fuzzing Preparation
Fuzzing Elements
· Fuzzing IOConnectSetCFProperties
· Client/Service · If overwriting setProperties?
· Fuzzing IOConnectTrap
· If overwriting getTargetAndTrapForIndex? · If overwriting getExternalTrapForIndex?

Fuzzing(III):Fuzzing Preparation

Unavailable Interfaces Identification

Client-0 Client-1 Client-2
.... .... .... Client-X .... .... .... .... .... Client-N

Selector-0 Selector-1 Selector-2
.... .... .... .... .... .... .... .... .... Selector-N

· inevitable panic interfaces · deadlock interfaces · slowly processing interfaces

Fuzzing(III): Fuzz Thread
Fuzz Thread

Fuzzing(III): Fuzz Thread

Client-0 Client-1 Client-2
.... .... .... Client-X .... .... .... .... .... Client-N

Rand(Other) Properties
Memory Map Trap ...

Rand(Selector-N)

skip unavailable interfaces

Fuzzing(III): Fuzz Thread
Fuzzing Application
System Process · MobileSubstrate: inject fuzzing into system process
· Implement clients' initialization in system process
· Use mach_port_space_info to get the client mach port

Part IV
Experimental Results

Experimental Results(IV)
Setup
· Hardware
· iPhone 4S · MacBook
· Software
· iOS 8.1.2 · Open-source XNU 2782.1.97

Experimental Results(IV)
Vulnerability Case 1
IODataQueue
void IODataQueue::free() {
if (dataQueue) { IOFreeAligned(dataQueue, round_page(dataQueue->queueSize +
DATA_QUEUE_MEMORY_HEADER_SIZE)); dataQueue = NULL;
if (notifyMsg) { IOFree(notifyMsg, sizeof(mach_msg_header_t)); notifyMsg = NULL;
} }
super::free();
return; }

Experimental Results(IV): Vulnerability-1
Vulnerability Case 1
· Details
· HighlandParkAudioDeviceUserClient-clientMemoryForType-44 · Use IODataQueue to share memories · Buffers in kalloc.4096 can be released into bigger kalloc zone
· Panic Logs
· Unavailable address to read and write · A freed zone element has been modified...

Experimental Results(IV)
Vulnerability Case 2
· IOResources's setProperties
IOReturn IOResources::setProperties( OSObject * properties ) { ...
while( (key = OSDynamicCast(OSSymbol, iter->getNextObject()))) { ...
publishResource( key, dict->getObject(key) ); }
... return( kIOReturnSuccess );
}
· IOResources is inherited from IOService

Experimental Results(IV)
Vulnerability Case 2
· IOService::newUserClient
IOReturn IOService::newUserClient( task_t owningTask, void * securityID, UInt32 type, OSDictionary * properties, IOUserClient ** handler )
{ ...
temp = getProperty(gIOUserClientClassKey); if (temp) {
if (OSDynamicCast(OSSymbol, temp)) userClientClass = (const OSSymbol *) temp;
.... }
.... temp = OSMetaClass::allocClassWithName(userClientClass); if (!temp) return kIOReturnNoMemory;
if (OSDynamicCast(IOUserClient, temp)) client = (IOUserClient *) temp;
.... }
.... }

Experimental Results(IV): Vulnerability-2
Vulnerability Case 2
Exploiting
· IOResources can be bounded to any client as a service
· A new attack surface · Fuzzing it

END

Last
Black Hat Sound Bytes

Black Hat Sound Bytes
· An information export approach to dump all OSObject subclasses' information.
· An effective fuzzing framework to fuzz IOKit in iOS
· Several vulnerabilities sharing

