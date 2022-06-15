Sorry, It is Not Your Page
  

Sorry, It is Not Your Page
 

Windows 

Windows 


   
   
1


   
   
1



2


   
   
1



2


   
ntdll.dll
   
1

ntdll.dll


ntdll.dll
2

Copy-on-Write

   0x11111111 
ntdll.dll
   
1

0x11111111 ntdll.dll


0x11111111 ntdll.dll
2

Copy-on-Write

   0x11111122 
ntdll.dll
   
1

0x11111111 0x11111122
ntdll.dll


0x11111111 ntdll.dll
2


   
   
1 1



2 1


   
   
1 1



3 2



P=&SessionData






SessionData



   
1 1

P=&SessionData SessionData




P=&SessionData






SessionData



   
1 1

P=&SessionData SessionData


P=&SessionData
3 2



P=&SessionData






SessionData



   
1 1

P=&SessionData SessionData


P=&SessionData
3 2



P=&SessionData






SessionData



   
1 1

P=&SessionData SessionData ???


P=&SessionData ???
3 2

 Physical Page Confusion


 

_KTHREAD  Win32Thread

 Win32Thread

 GS  _KPCR 

KiStackAttachProcess  CR3  _KPCR.Prcb.CurrentThread 


KiStackAttachProcess(ProcessInOtherSession) Win32Thread = PsGetThreadWin32Thread(KeGetCurrentThread())  *Win32Thread

CVE-2019-0892

NtTerminateProcess  KiStackAttachProcess

DxgkCompositionObject  RGNMEMOBJ::vPushThreadGuardedObject

RGNMEMOBJ::vPushThreadGuardedObject  PsGetThreadWin32Thread  Win32Thread



 IsThreadCrossSessionAttached 

 W32GetThreadWin32Thread  PsGetThreadWin32Thread

RGNMEMOBJ::vPushThreadGuardedObject  W32GetThreadWin32Thread  Win32Thread

 IsThreadCrossSessionAttached 
NtGdiDeleteObjectApp bDeleteDCOBJ GreGetDeviceCaps ReleaseCacheDC _GetDCEx GreGetBounds XDCOBJ::bCleanDC HmgDecrementShareReferenceCountEx HmgLockEx

HANDLELOCK::vLockHandle ResetOrg HANDLELOCK::bLockHobj hbmSelectBitmap DCMEMOBJ::DCMEMOBJ W32GetThreadWin32Thread SURFMEM::bCreateDIB XDCOBJ::bDeleteDC GreIntersectClipRect

Call to Action

  



