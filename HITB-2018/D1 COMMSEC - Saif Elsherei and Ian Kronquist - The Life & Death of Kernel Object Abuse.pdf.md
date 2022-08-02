The Life And Death of Kernel Object Abuse
Saif ElSherei (0x5A1F) & Ian Kronquist

Who?
@Saif_Sherei Senior Security Software Engineer @ MSRC @IanKronquist Software Engineer on the Windows Device Group Security Team

There's Definitely a Method to Madness (Why?)

Attack Chain

Trigger some exploitable bug, UAF, OOB write,
Integer overflow

Gain higher exploit primitive
by abusing certain objects, to gain arbitrary kernel memory
read/write

Use arbitrary kernel memory read/write to steal a SYSTEM process token, and assign it to
the current process

What ??

Memory Corruption - UAF

Unused Memory
ObjectB Header ObjectB.A ObjectB... ObjectB.B ObjectB...

void SimpleUafFunction()
{
... Object ObjectA = new Object(); .... If (condition == 0) {
Free(ObjectA); } ... ObjectA.B = 0x41414141; ... return;
}

Memory Corruption ­ UAF - Allocate

ObjectA... ObjectB...

void SimpleUafFunction()
{
... Object ObjectA = new Object(); .... If (condition == 0) {
Free(ObjectA); } ... ObjectA.B = 0x41414141; ... return;
}

Memory Corruption ­ UAF - Free

Freed memory ObjectB...

void SimpleUafFunction()
{
... Object ObjectA = new Object(); .... If (condition == 0) {
Free(ObjectA); } ... ObjectA.B = 0x41414141; ... return;
}

Memory Corruption ­ UAF - Use

Operating on freed memory
ObjecFtrAee.Bd =me??m?o??ry???
ObjectB...

void SimpleUafFunction()
{
... Object ObjectA = new Object(); .... If (condition == 0) {
Free(ObjectA); } ... ObjectA.B = 0x41414141; ... return;
}

Memory Corruption ­ UAF - Exploitation

ObjectC... ObjectB...

void SimpleUafFunction()

{
Replace freed ObjectA with a new ObjectC of the same size and allocated to the same heap.

... Object ObjectA = new Object(); .... If (condition == 0) {
Free(ObjectA); } NewObj ObjectC = new NewObj(); ObjectC.X = 0x1; ObjectA.B = 0x41414141; printf("%x",ObjectC.X); ... return;

}

Memory Corruption ­ UAF - Exploitation

ObjectC... ObjectC.X = 0x1
ObjectB...

void SimpleUafFunction()
{
... Object ObjectA = new Object(); .... If (condition == 0) {
Free(ObjectA); } NewObj ObjectC = new NewObj(); ObjectC.X = 0x1; ObjectA.B = 0x41414141; printf("%x",ObjectC.X); ... return;
}

Memory Corruption ­ UAF - Exploitation

ObjectC... ObjectC.X = 0x41414141
ObjectB...

void SimpleUafFunction()

{
When ObjectA gets used after its freed it will corrupt ObjectC members.

... Object ObjectA = new Object(); .... If (condition == 0) {
Free(ObjectA); } NewObj ObjectC = new NewObj(); ObjectC.X = 0x1; ObjectA.B = 0x41414141; printf("%x",ObjectC.X); ... return;

}

Memory Corruption ­ UAF - Exploitation

ObjectC... ObjectC.X = 0x41414141
ObjectB...

void SimpleUafFunction()

{

...

Object ObjectA = new Object();

....

If (condition == 0)

{

Corrupted ObjectC.X =

Free(ObjectA);

ObjectA.B = 0x41414141 }

NewObj ObjectC = new NewObj();

ObjectC.X = 0x1;

ObjectA.B = 0x41414141;

printf("%x",ObjectC.X);

...

return;

}

Memory Corruption ­ x86 Integer Overflow

080 + 081 =
000000001

Actually

080 + 081 =
00100000001

00100000001 > 32-bit (4 bytes) wide registers
Integer will be truncated to fit register size Most significant byte ignored 0x01
080 + 081 =
000000001

Memory Corruption ­ Linear Overflow

Unused Memory

Scenario A: objPtr = AllocateObject(sz_overflow); memcpy(objPtr,src,sz_original);

ObjectB...

Scenario B: objPtr = AllocateObject(sz_fixed); memcpy(objPtr,src,sz_usersupplied);

Memory Corruption ­ Linear Overflow

ObjectA...

Scenario A: objPtr = AllocateObject(sz_overflow); memcpy(objPtr,src,sz_original);

ObjectB...

Scenario B: objPtr = AllocateObject(sz_fixed); memcpy(objPtr,src,sz_usersupplied);

Memory Corruption ­ Linear Overflow

O

AAAAAAAAAAAA

V

AAAAAAAAAAAA

E

AAAOAbAjAecAtAAA...AAA

R

AAAAAAAAAAAA

F

AAAAAAAAAAAA

L

AAAAAAAAAAAA

O

AAAAAAAAAAAA

W

AAAAAAAAAAAA

ObjectB...

Scenario A: objPtr = AllocateObject(sz_overflow); memcpy(objPtr,src,sz_original);
Scenario B: objPtr = AllocateObject(sz_fixed); memcpy(objPtr,src,sz_usersupplied);

Memory Corruption ­ OOB Write

Unused memory ObjectB...

Scenario: objPtr = AllocateObject(sz_overflow); objPtr[idx > sz_overflow] = 0x5A1F;

Memory Corruption ­ OOB Write

ObjectA... ObjectB...

Scenario: objPtr = AllocateObject(sz_overflow); objPtr[idx > sz_overflow] = 0x5A1F;

Memory Corruption ­ OOB Write

ObjectA...
ObjectB... 0x5A1F

Scenario: objPtr = AllocateObject(sz_overflow); objPtr[idx > sz_overflow] = 0x5A1F;
idx > sz_overflow

Memory Corruption ­ OOB OF Exploitation
· Get Kernel memory in deterministic state. · Done using series of allocations / de-allocations. · Create memory holes between user controlled object. · Hopefully vulnerable object will be allocated to one of these
memory holes before one of the user controlled objects. · Use overflow or OOB write to corrupt interesting members of
the user controlled object.

The Life of Kernel Object Abuse
(How ??)

Abusing Objects For Fun & Profit

ObjectA Header ObjectA.dataSize ObjectA.dataPtr
ObjectA.data

Interesting Objects members:
· Size member (allows relative memory r/w)
· Pointer to data (allows arbitrary memory r/w)
Interesting Functions:
· GetData(...) · SetData(...)

Abusing Objects For Fun & Profit

ObjectA Header ObjectA.dataSize
= 0x100 ObjectA.dataPtr
ObjectA.data
ObjectB Header ObjectB.dataSize
= 0x100 ObjectB.dataPtr
ObjectB.data

void Exploit()
{
... Object ObjectA = new Object(); Object ObjectB = new Object(); ... ExploitChangeSize(ObjectA,
0xFFFFFFFF); ... BYTE * buff = GetData(ObjectA); ... SetData(ObjectA, 0x41414141, idx, sz); BYTE * out = GetData(ObjectB); return;
}

Abusing Objects For Fun & Profit

ObjectA Header ObjectA.dataSize
= 0xFFFFFFFF ObjectA.dataPtr
ObjectA.data
ObjectB Header ObjectB.dataSize
= 0x100 ObjectB.dataPtr
ObjectB.data

void Exploit()

{
Exploit UAF or Integer issue, to corrupt the ObjectA.dataSize member

... Object ObjectA = new Object(); Object ObjectB = new Object(); ... ExploitChangeSize(ObjectA,
0xFFFFFFFF); ... BYTE * buff = GetData(ObjectA); ... SetData(ObjectA, 0x41414141, idx, sz); BYTE * out = GetData(ObjectB); return;

}

Abusing Objects For Fun & Profit

ObjectA Header ObjectA.dataSize
= 0xFFFFFFFF ObjectA.dataPtr
ObjectA.data
ObjectB Header
ObjectB.dataSize
ObjectB.dataPtr ObjectB.data

Read data up to corrupted size of 0xFFFFFFFF (4GB) gaining memory read/write relative to ObjectA.dataPtr

void Exploit()
{
... Object ObjectA = new Object(); Object ObjectB = new Object(); ... ExploitChangeSize(ObjectA,
0xFFFFFFFF); ... BYTE * buff = GetData(ObjectA); ... SetData(ObjectA, 0x41414141, idx, sz); BYTE * out = GetData(ObjectB); return;
}

Abusing Objects For Fun & Profit

ObjectA Header ObjectA.dataSize
= 0xFFFFFFFF ObjectA.dataPtr
ObjectA.data
ObjectB Header
ObjectB.dataSize ObjectB.dataPtr =
0x41414141 ObjectB.data

Use ObjectA write functions to overwrite ObjectB.dataPtr to any address in memory.

void Exploit()
{
... Object ObjectA = new Object(); Object ObjectB = new Object(); ... ExploitChangeSize(ObjectA,
0xFFFFFFFF); ... BYTE * buff = GetData(ObjectA); ... SetData(ObjectA, 0x41414141, idx, sz); BYTE * out = GetData(ObjectB); return;
}

Abusing Objects For Fun & Profit

ObjectA Header ObjectA.dataSize
= 0xFFFFFFFF ObjectA.dataPtr
ObjectA.data
ObjectB Header
ObjectB.dataSize ObjectB.dataPtr =
0x41414141 ObjectB.data

AAAAAAA...
Reading/writing from controlled pointer 0x41414141

void Exploit()
{
... Object ObjectA = new Object(); Object ObjectB = new Object(); ... ExploitChangeSize(ObjectA,
0xFFFFFFFF); ... BYTE * buff = GetData(ObjectA); ... SetData(ObjectA, 0x41414141, idx, sz); BYTE * out = GetData(ObjectB); return;
}

Use ObjectB read/write functions to read/write from controlled memory pointer gaining arbitrary memory read/write

Win32k Memory
· Desktop Heap (NTUSER)
· Window management related objects. · Window(s) objects, Menus, Classes, etc ... · Objects allocated/free-ed using RtlAllocateHeap/RtlFreeHeap.
· Paged Session Pool (NTGDI)
· GDI related objects. · GDI bitmaps, palettes, brushes, DCs, lines, regions, etc ... · Objects usually allocated/free-ed using
ExAllocatePoolWithTag/ExFreePoolWithTag.
· Non-Paged Session Pool (not in scope for this presentation)

Statistics

Object Type
Surface tagWND tagCURSOR tagMENU tagCLS tagpopupmenu Palette Pen + Brush RFFont Path

MSRC Count
11 9 8 7 4 4 2 2 1 0

% MSRC Win32k UAF Type

surface

location

12.22 10 8.89 7.78 4.44 4.44 2.22 2.22 1.11 N/A

GDI USER USER USER USER USER GDI GDI GDI GDI

Release
RS3 RS4 RS4 RS4 RS4 RS4 RS4 RS4 RS4 RS4

Abusing Window Objects tagWnd

Abusing Window Objects tagWnd

Abusing Window Objects tagWnd- Allocation
https://msdn.microsoft.com/en-us/library/windows/desktop/ms632679(v=vs.85).aspx https://msdn.microsoft.com/en-us/library/windows/desktop/ms632680(v=vs.85).aspx

Abusing Window Objects tagWnd - Free
https://msdn.microsoft.com/en-us/library/windows/desktop/ms632682(v=vs.85).aspx

Abusing Window Objects tagWnd­ Read Data
GetWindowLongPtr: - Reads Long at index < cbwndExtra from ExtraBytes. InternalGetWIndowText: - Reads Length <= MaximumLength string from strName buffer.
https://msdn.microsoft.com/en-us/library/windows/desktop/ms633584(v=vs.85).aspx https://msdn.microsoft.com/en-us/library/windows/desktop/ms633523(v=vs.85).aspx

Abusing Window Objects tagWnd ­ Write Data
SetWindowLongPtr: - Write Long at index < cbwndExtra into ExtraBytes. NtUserDefSetText: - Writes up to Length <= MaximumLength string from strName buffer.
BOOL NtUserDefSetText( HWND hWnd, PLARGE_STRING pstrText );
https://msdn.microsoft.com/en-us/library/windows/desktop/ms633591(v=vs.85).aspx https://msdn.microsoft.com/en-us/library/windows/desktop/ms644898(v=vs.85).aspx

Abusing Window Objects tagWnd ­ Exploitation

Window A ...
WinA.cbwndExtra
... WinA.ExtraBytes
Window B ...
strName.Length strName.Maximu
mLength strName.buffer

· Window A & Window B are two adjacent Window objects.

Abusing Window Objects tagWnd ­ Exploitation

Window A ...
WinA.cbwndExtra
... WinA.ExtraBytes
Window B ...
strName.Length strName.Maximu
mLength strName.buffer

· Use a kernel bug to corrupt Window A cbwndExtra member.
· This will extend the Window A extra data, gaining memory read/write relative to WindowA.ExtraBytes into the adjacent Window B.
· Window A will be the manager object that will be used to set the pointer on Window B to be read/write from.

Abusing Window Objects tagWnd ­ Exploitation

Window A ...
WinA.cbwndExtra
... WinA.ExtraBytes
Window B ...
strName.Length strName.Maximu
mLength strName.buffer

· Window B will be the worker object. · Use Window A relative r/w to overwrite (set)
Window B strName.buffer to any location in kernel memory. · Using Window B read/write functions, allows arbitrary kernel memory read/write.
Read/write to/from any arbitrary kernel memory location pointed to by Window B strName.buffer

Abusing Bitmaps _SURFOBJ
First disclosed by KeenTeam @k33nTeam (2015) Heavily detailed & analysed by Nico Economou @NicoEconomou
and Diego Juarez (2015/2016)

Abusing Bitmaps _SURFOBJ

Object type _SURFOBJ

PoolTag Gh?5, Gla5

Abusing Bitmaps _SURFOBJ - Allocation

HBITMAP bmp =

CreateBitmap(

0x3A3, //nWidth

1,

//nHeight

1,

//cPlanes

32,

//cBitsPerPel

NULL); // lpvBits

https://msdn.microsoft.com/en-us/library/windows/desktop/dd183485(v=vs.85).aspx

Abusing Bitmaps _SURFOBJ - Free
https://msdn.microsoft.com/en-us/library/windows/desktop/dd183539(v=vs.85).aspx

Abusing Bitmaps _SURFOBJ ­ Read Data
Reads up to sizlBitmap data, from address pointed to by pvScan0.
https://msdn.microsoft.com/en-us/library/windows/desktop/dd144850(v=vs.85).aspx

Abusing Bitmaps _SURFOBJ ­ Write Data
writes up to sizlBitmap data, into address pointed to by pvScan0.
https://msdn.microsoft.com/en-us/library/windows/desktop/dd162962(v=vs.85).aspx

Abusing Bitmaps _SURFOBJ ­ Exploitation

Bitmap A ... Bitmap A sizlBitmap
... BitmapA Bits
Bitmap B ...
Bitmap B pvScan0
... Bitmap B Bits

· Bitmap A & Bitmap B are two adjacent bitmaps that can read/write only their bits.

Abusing Bitmaps _SURFOBJ ­ Exploitation

Bitmap A ... Corrupted Bitmap
A sizlBitmap ...
Bitmap A Bits
Bitmap B ...
Bitmap B pvScan0
... Bitmap B Bits

· Use a kernel bug to corrupt Bitmap A sizlBitmap member.
· This will extend the Bitmap A size, gaining memory read/write relative to BitmapA.pvScan0 into the adjacent Bitmap B.
· Bitmap A will be the manager object that will be used to set the pointer to be read/write from.

Abusing Bitmaps _SURFOBJ ­ Exploitation

Bitmap A ... Corrupted Bitmap
A sizlBitmap ...
Bitmap A Bits
Bitmap B ...
Bitmap B pvScan0
... Bitmap B Bits

· Bitmap B will be the worker object. · Use Bitmap A relative r/w to overwrite (set)
Bitmap B pvScan0 to any location in kernel memory. · Using Bitmap B read/write functions, allows arbitrary kernel memory read/write.
Read/write to/from any arbitrary kernel memory location pointed to by Bitmap B pvScan0

Abusing Palettes _PALETTE
Disclosed by Saif ElSherei @Saif_Sherei at Defcon 25 (2017)

Abusing Palettes _PALETTE

Object type _PALETTE

PoolTag Gh?8, Gla8

Abusing Palettes _PALETTE - Allocation
Allocate 2000 Palettes HPALETTE hps; LOGPALETTE *lPalette; lPalette = (LOGPALETTE*)malloc(sizeof(LOGPALETTE) + (0x1E3 - 1) * sizeof(PALETTEENTRY)); lPalette->palNumEntries = 0x1E3; lPalette->palVersion = 0x0300; hps = CreatePalette(lPalette);
https://msdn.microsoft.com/en-us/library/windows/desktop/dd183507(v=vs.85).aspx

Abusing Palettes _PALETTE - Free
https://msdn.microsoft.com/en-us/library/windows/desktop/dd183539(v=vs.85).aspx

Abusing Palettes _PALETTE ­ Read Data

Read Palette Entries

HRESULT res = GetPaletteEntries(

hpal,

//Palette Handle

index,

// index to read from

sizeof(read_data)/sizeof(PALETTEENTRY),

&data);

//data buffer to read to

//nEntries

Reads up to nEntries from Index from data at address pointed to by pFirstColor

https://msdn.microsoft.com/en-us/library/windows/desktop/dd144907(v=vs.85).aspx

Abusing Palettes _PALETTE ­ Write Data

Write up to

nEntries from

Write Palette Entries

index of data

into address

HRESULT res = SetPaletteEntries(// || AnimatePalette(

pointed to by

hpal, //Palette Handle

pFirstColor

index, // index to write to

sizeof(write_data)/sizeof(PALETTEENTRY), //nEntries to Write

&data); // pointer to data to write

https://msdn.microsoft.com/en-us/library/windows/desktop/dd145077(v=vs.85).aspx https://msdn.microsoft.com/en-us/library/windows/desktop/dd183355(v=vs.85).aspx

Abusing Palettes _PALETTE ­ Exploitation

Palette A ...
Palette A cEntries
... Palette A apalColors[] Palette B ... Palette B *pFirstColor
... Palette B apalColors[]

· Palette A & B are two adjacent Palette objects that can read/write only their original entries.

Abusing Palettes _PALETTE ­ Exploitation

Palette A ...
Corrupted Palette A cEntries
... Palette A apalColors[]
Palette B ...
Palette B *pFirstColor
... Palette B apalColors[]

· Use Kernel exploit to corrupt Palette A cEntries, with a large value, expand its apalColors entries into the adjacent Palette B.
· Gaining kernel memory read/write relative to the location pointed to by Palette A pFirstColor member.
· Palette A will be the manager object, used to set the pointer to be read/write from.

Abusing Palettes _PALETTE ­ Exploitation

Palette A ...
Corrupted Palette A cEntries
... Palette A apalColors[]
Palette B ...
Palette B *pFirstColor
... Palette B apalColors[]

· Palette B will be the worker object. · Use Palette A relative r/w to overwrite (set)
Palette B pFirstColor to any location in kernel memory. · Using Palette B read/write functions, allows arbitrary kernel memory read/write.
Read/write to/from any arbitrary kernel memory location pointed to by Palette B pFirstColor

Abusing Palettes _PALETTE ­ Restrictions

X86

typedef struct _PALETTE64

{

..

HDC

hdcHead; // 0x1c

...

PTRANSLATE ptransCurrent; // 0x30

PTRANSLATE ptransOld; // 0x34

... } PALETTE, *PPALETTE;

X64

typedef struct _PALETTE64

{

..

HDC

hdcHead; // 0x28

...

PTRANSLATE ptransCurrent; // 0x48

PTRANSLATE ptransOld; // 0x50

... } PALETTE64, *PPALETTE64;

Demo

The Death of Kernel Object Abuse
(Mitigation)

The Type Isolation Mitigation

Win32k MSRC cases

· We live in a world where there is

Other 13%

a lot of buggy software, and a lot Type Confusion

of crafty attackers.

3%

Info Disclosure
· Unfortunately, we can't fix every 5%

bug.

Unclassified

5%

· What we need are mitigations:

ways to make bugs more difficult,

Heap Read 6%

or even impossible, to exploit.

· We are raising the bar for hackers. NULL Dereference
11%

Use After Free 23%
Heap Corruption 20%

Race Condition 14%

Our Threat Model
· We assume the attacker has found a UAF in one of the NTGDI or NTUSER types which we protect.
· They may cause this UAF to occur at arbitrary times. · We assume the attacker does not have an arbitrary write ­ a UAF is a
primitive you use to build an arbitrary write vulnerability. · The attacker may have an arbitrary read vulnerability, though we've
done a few things to make their lives harder if they don't.

Not in Our Threat Model
· If you already have a write-what-where vulnerability, you've already won.
· We only protect a limited number of types, so exploiting a type we don't protect is out of scope.

Type Isolation Doesn't Prevent UAFs
· Type Isolation doesn't actually stop UAFs, it just makes them very difficult to exploit.
· Since frees may happen at any time, it's hard to detect them. · To catch all UAFs, you need to check every pointer dereference,
which is very slow.

Deny the Attacker Control of Memory
· If an attacker can control the layout and contents of memory, they control the kernel.
· We change the layout of memory to be harder to exploit in the face of bugs, and deny the attacker control.

Overlapping Different Types of Objects

Newly Allocated ObjectA...

Pointer

Color Data etc.

Previously Freed ObjectB...

Overlapping the Same Types of Objects

Previously Freed ObjectA...

Previously Freed ObjectA... Pointer

Pointer Color Data etc.

Color Data etc.

How Type Isolation Works

Before Type Isolation Palette ...
Palette cEntries ...
Palette apalColors[]
array

Fixed sized green parts are in the isolated heap
Variable sized blue parts are in the normal heap

After Type Isolation Palette ...
Palette cEntries ...

Palette apalColors[]
array

How Type Isolation Works

The isolated heap has a series of slots so two palettes can't overlap. This way different types of fields like flags or sizes won't overlap in the event of a UAF. Only palettes can be allocated from this heap.

Bitmap metadata for tracking free slots

11001

Isolated Heap arena

Palette

Palette Empty Slot Empty Slot Palette

UAF Scenario 1

Say you have some other object with a

Some other

pointer to an isolated palette

object

Palette

Palette Empty Slot Empty Slot Palette

UAF Scenario 1

Then you free the palette but forget to

update the other object.

Some

other

object

This situation is hard to exploit since the

empty slot is always zeroed.

Palette EmPpalteyttSelot Empty Slot Empty Slot Palette

UAF Scenario 2

Again, you have some other object with a

Some other

pointer to an isolated palette

object

Palette

Palette Empty Slot Empty Slot Palette

UAF Scenario 2

Then you free a palette

Some other object

Palette Empty Slot Empty Slot Empty Slot Palette

UAF Scenario 2

This time, you allocate a different palette in

its same place. This palette is properly

initialized with new data.

Some other

object

This is hard to corrupt since now you're just

pointing to a different, valid palette.

Palette

A Different Palette

Empty Slot

Empty Slot

Palette

Similar Work
· Adobe Flash introduced "Heap Partitioning" in 2015 · IE had IsoHeap, prior to adding a native code garbage collector · Webkit added a similar feature which landed shortly after we did

Our Impact
"This definitely eliminates the commodity exploitation technique of using Bitmaps as targets for limited memory corruption vulnerabilities[.]"
~ Francisco Falcon of Quarkslabs talking about its impact on the SURFACE type alone
https://blog.quarkslab.com/reverse-engineering-the-win32k-type-isolation-mitigation.html

Q & A Thanks

