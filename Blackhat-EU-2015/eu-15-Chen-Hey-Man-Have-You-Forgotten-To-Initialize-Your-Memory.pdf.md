Hey Man, Have You Forgotten to Initialize
Your Memory?
@guhe120 @holynop

Agenda
· Background · From Uninitialized memory bug to RCE
­ CVE-2015-1745
· Bypass EPM Sandbox
­ CVE-2015-1743

Who are we?
 Security Researchers  86 Vulnerability
Acknowledgements from Microsoft (Dozens from Apple/Adobe...)
 Microsoft mitigation bypass reward
 Pwn2Own 2015  Syscan/BlackHat/HITCON/
Syscan360/POC  Qihoo 360 ­ The largest
Internet Security Company in China

Background

Background
· This year's IE target is a bit difficult
­ 64-bit process ­ Bypass EPM without restart/relogin ­ New Mitigations: Isolated Heap, Deferred Freed, CFG ­ EMET ­ Rule announced before Chinese new year holiday

From Uninitialized memory bug to RCE
CVE-2015-1745

Uninitialized Memory Bug
· One category of memory corruption bugs
"Uninitialized memory data is used in program, leading to unpredictable result"
Uninitialized heap memory: int *unitialized_heap_buffer = (int *)malloc(10 * sizeof(int)); Int unitialized_value = unitialized_heap_buffer [0];
Unitialized stack variable: int unitialized_stack_buffer[10]; Int unitialized_value = unitialized_stack_buffer[10];

Uninitialized Memory Bug
· Common bugs in code · Enemy of ASLR · Not that often, brings us nice exploits
­ CVE-2012-1889 (IE msxml bug, poc exploit by VUPEN) ­ CVE-2014-8440 (Flash uncompress bug, exploited in the wild) ­ CVE-2015-0090 (Windows ATMFD font driver uninitialized
kernel pool pointer, by Mateusz Jurczyk )

Uninitialized memory bug - the left bag
10

CVE-2015-1745
· Found by fuzzing · Credit @holynop · uninitialized CAttrValue in CAttrArray · A CAttrValue can be accessed before initialize

CAttrValue in IE

· DOM elements can have attributes

element. setAttribute(`foo', `bar'); // set attribute

element. getAttribute(`foo');

// get attribute

· CAttrValue - inner data structure for an attribute
· CAttrArray - array to store CAttrValues

CAttrValue internal

· CAttrValue can contain value of variant · vtType filed indicates data type

Class CAttrValue { Byte b1; Byte vtType; WORD w1; DWORD dispid; Union { ULONG *pulong; BSTR bstr; VARIANT *variant; ... } value;
}

enum VARENUM { VT_EMPTY VT_NULL VT_I2 VT_I4 VT_R4 VT_R8 VT_CY VT_DATE ...
}

= 0, = 1, = 2, = 3, = 4, = 5, = 6, = 7,

https://msdn.microsoft.com/zh-cn/library/windows/desktop/ms221170(v=vs.85).aspx

CAttrValue in Memory
var div = document.createElement('div'); div.setAttribute('aaa', '111');

The Bug
// 1. Set some Attributes in document.all[8] document.all[8].clearAttributes() document.all[8].setAttribute("aaa", 0xa); document.all[8].setAttribute("bbb", 0xb);
document.all[8].setAttribute("bbb1", 0xc); document.all[8].setAttribute("bbb2", 0xd); document.all[8].setAttribute("bbb3", 0xe);
// 2. Set some Attributes in document.body document.body.clearAttributes() document.body.setAttribute("aaa", document.body.childNodes); document.body.setAttribute("ccc","666666666666666666666666666");
// 3. Call mergeAttributes, a new CAttrArray will be allocated to store the merged attributes, // one entry in the new allocated CAttrArray is not initialized document.body.mergeAttributes(document.all[8], false);

MergeAttributes

document.body.mergeAttributes(document.all[8], false);

CAttrArray

Allocate a new CAttrArray which have 9 CAttrValues

CAttrArray[4] is skiped during the merge (because of the bug), and will be uninitialized

Exploit Plan
Leak memory address Create fake attribute to gain arbitrary read Create fake array to gain arbitrary RW Bypass CFG/EMET Win

Control Memory
· The very first thing we have to do is to control the data in the uninitialized memory
· How?
­ Alloc -> Free -> Alloc -> Control

Control Memory

Alloc b1

Some Content

Free b1

Content left by b1 (not cleared)

Alloc b2

Content left by b1

Access Uninitialized Memory

Controlled !

Key Points to Control
· b1 and b2 should be in the same heap · Content of b1 should not be cleared after b1 is freed
­ MemoryProtect::Free  ­ SysFreeString 
· Content of b2 should not be set to zero when allocate b2
­ cmalloc  ­ HEAP_ZERO_MEMORY in HeapAlloc  ­ CAttrValue array allocated via HeapAlloc with out
HEAP_ZERO_MEMORY - Lucky! 

Control with What?
· Now we can control the content of a CAttrValue ­ With what?

value

CAttrValue

type

Point to string data, object, ...

Set To some pointer related type (string, object, int_ptr,...)

0x????????
In 32-bit IE, we can do a heap-spray, then point it to somewhere like 0x0c0c0c0c

But in 64-bit process, simple heap-spraying does not work

Heap-spray?
Assume a successful heap-spraying on 32-bit needs 200M bytes, Then on 64-bit you need to spray more than 50G bytes

We need an information Leak First

Information Leak on 64-bit
· Directly leak address of interested data
­ If you are lucky enough to have such a bug 
· Leak address of some data in the same heap + Some kind of Heap Fengshui = we can guess the address of interested data

Leak Step 1
· Allocate some (300 +) Attribute Arrays · Each Attribute Array contains 9 attributes
(same with the uninitialized CAttrArray after mergeAttributes)
· The 4th attribute in the array points to a string which is 0x30 bytes in memory

...
xxx[i].ccc = str

AAAAAAAAA...
0x30 bytes string

Leak Step 2
· Free half of these Attribute Arrays · The content of the freed Attribute Arrays
will not be cleared

Freed

...
AAAAAAAAA...
0x30 bytes string

Leak Step 3

· Trig the bug, allocate vulnerable CAttrArray with uninitialized CAttrValue
· The 4th CAttrValue will be a string attribute that points to the 0x30 bytes string

document.body.getAttribute("ccc") gets a String attribute

uninit

...

AAAAAAAAA...
0x30 bytes string

Leak Step 4

· Free the 0x30 bytes string · Spray runtimestyle objects to reuse the memory · Read the uninitialized CAttrValue out to leak a
pointer to the runtimestyle style attribute array

uninit

...

document.body.getAttribute("ccc") Gets a String attribute

AAAAAAAAA...
0x30 bytes string
leak Runtime Style Array

runtimestyle

Leak Step 5

Runtime Style Array About 0x20000 bytes

IntArray

IntArray

IntArray

IntArray

Allocate After Runtime Style Array

The relative spray:
runtimestyle_array_addr + 0x2000000 = address of one of the IntArrays

Result of the Leak Stage
· We leaked the address of an IntArray in memory · What we can do with this?
 We can make uninitialized CAttrValue points into the array  Means we can make fake CAttrValue of any types!
· Let's party!

Fake Attribute Value
· We trig the bug for the second time
­ Using string to control the uninitialized CAttrValue
Tips: We use JS 5.8 string whose content will not be cleared after it is freed

Fake Attribute Value

Allocate String
Freed String (data remained)
Attribute Array

free Trig the bug

Uninitialized CAttrValue (controlled by string data)

type 0x0c == VT_VARIANT

value
Point to leaked IntArray Fake Variant data in IntArray 32

Fake Attribute Value

Variant TYPE

Value

Leaked Javascript Array

VT_VARIANT
· Variant is a data structure that can represent various types of data
­ Int, Boolean, Long, ... ­ IntPtr, UintPtr,... ­ Array ­ Object

Achieve Arbitrary Read

· Make a fake UINT_PTR variant

TYPE

Pointer to uint32

0x4013 = VT_BYREF | VT_UI4 Means pointer to uint32

Point it to any address that we want to read

function readUI4(addr_high, addr_low) { ...... arr_arr[arr_arr_index][0] = 0x00004013 arr_arr[arr_arr_index][2] = addr_low arr_arr[arr_arr_index][3] = addr_high return parseInt(document.all[9].getAttribute("ccc"))
}

Achieve Arbitrary Write
· The go-to way in IE exploitation
­ Corrupt the length filed of a javascript array
· A crazy idea - Make a fake JavaScript IntArray
­ Copy necessary fields (vftable, members,...) from a real IntArray with the arbitrary read primitive to our fake array
­ Except that our fake array have a large length (0x7fffffff) 

Achieve Arbitrary Write

TYPE

Pointer to fake IntArray object

0x09 = VT_DISPATCH Means object with Idispatch Interface

Fake IntArray Length = 0x7fffffff

The javascript array we leaked previously

Real Array

Copy data from normal array to fake array with the arbitrary read primitive

Bypass CFG & EMET
· If you have arbitrary memory R/W, CFG/EMET is not a big problem

Several Ways to Bypass CFG
· Call valid APIs · Find stack address · Overwrite the stack · Use direct calls · No execution flow control · Legacy modules which are not compiled with
CFG

Done? Not yet...

Bypass EPM Sandbox
CVE-2015-1743

Enhanced Protect Mode
· Enhanced sandbox mode which is not enabled by default in IE11
· Great sharing and study materials by James Forshaw
­ <<Legacy Sandboxing: Escaping IE11 Enhanced Protected Mode>> ­ https://github.com/tyranid/IE11SandboxEscapes

Enhanced Protect Mode
· Uses Windows 8 AppContainer to further restrict what sandboxed process can do

CVE-2015-1743
· TOCTOU bug in IE Install Service Broker · Credit @pgboy · What is the Broker Service?
­ Broker interface provided by Medium Integrity processes ­ So that protected mode process (like IE sandboxed process)
can access to some restricted resource

IEAxInstallBroker
· Broker service for IE to install Add-ons (ActiveX Controls)

IIeAxiInstaller2
3 Steps to install a exe file: VerifyFile -> InstallFile -> RegisterExeFile

Install File
IIeAxiInstaller2Ptr installer; ... installer->VerifyFile(...); installer->InstallFile(...); installer->RegisterExeFile(...);

Install A.exe to MyFolder

1. VerifyFile
Signature Valid? a.exe Medium Integrity Level?

NO
Fail

2. InstallFile

Copy a.exe to MyFolder

3. RegisterExeFile

CreateProcess("MyFolder\a.exe")

TOCTOU Problem
· File validated in step1 · In step3, before actually executing the file,
it does not validate it again!

Exploit Plan

1. VerifyFile

iexplore.exe

Verify OK

(any valid signed file)

2. InstallFile

Copy iexplore.exe to MyFolder

3. RegisterExeFile

MyFolder CreateProcess("MyFolder\iexplore.exe")

Another Problem
· We need to overwrite the file in the destination folder
· IE sandboxed process can only write to AppContainer folder
· If the file is dropped and executed in low-integrity level folder, it will also be low-integrity process
· We need to be able to write an executable file to a medium-integrity folder

Flash Broker

Flash Broker
· Have broker interfaces to write file · Can only write to pre-defined folders
­ C:\Users\xxx\AppData\Roaming\Adobe (Not low integrity!)

No Exe

Bypass
CreateProcess Will Check EXE File Automatically
· CreateProcess ("1.tmp") · CreateProcess ("1.jpg")

The Last Defense Line
· In BrokerWriteFile, it checks whether you are trying to write a PE file by checking the Dos sianature ((`MZ') ) and PE signature (`PE' )

Bypass
· Don't write Dos signature (`MZ') at the first time · Later, use BrokerSetFilePointer to get back,
and write Dos signature (`MZ')

Done?
Yes

Demo

Special Thanks To
· Blackhat · Zero Day Initiative · Guys in 360 vulcan Team
- MJ0011 - pgboy1988 ...

Join Us
· Bug Hunting · Vulnerability Exploitation · APT Analysis and Discovery · 360vulcan@360safe.com

Black Hat Sound Bytes
· Exploit skills in 64-bit browser · Using Uninitialized bug to achieve RCE · Using TOCTOU bug to bypass sandbox

Thank you!

