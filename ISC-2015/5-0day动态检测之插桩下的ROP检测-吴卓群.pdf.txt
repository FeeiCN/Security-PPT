APT

0dayROP 

ROP
Return Orientated Programming
 (gadget)ret ret

ROP

... ....

ROP

*ROP *DEP  *(WinExec)

ROP
API
DEPAPI VirtualAlloc(), HeapCreate(), SetProcessDEPPolicy(), NtSetInformationProcess(), VirtualProtect(), WriteProtectMemory() API WinExec

EMET
Enhanced Mitigation ExperienceToolkit 

EMET

ROP
1.StackPviot:check if stack is pviotted 2.Caller:check if critical functions was called and not returned into 3.SimExecFlow:Simulate the execution flow after the return address to detect subsequent ROP Gadgets 4.MemProt:specail check on memory protections API 5.LoadLib:check and prevent LoadLibrary calls againts UNC paths

EMET
EMET CALLER CHECKS 
EMET(VirtualProtect, VirtualAlloc )Caller Caller:check if critical functions was called and not retur ned into  CALLROP

EMET
EMET CALLER CHECKS 
32CALL "call xxxxxxxx" "call AAAABBBBBBBB","AAAA" 16"BBBBBBBB"32 "call [] "opcode"FF15 [xxxxxxxx]" "call far[] "opcode "FF1D [xxxxxxxx]"



ROP


call

CFG
bitmap     

ROP
/

ROP


CFI
  



"just in time" compiler
:
Pin ,DynamoRIO , Valgrind

ROP
1. CALL 2. RETN 3. RETNCALL 4.  5.  6. ROP

ROP




Ret   JOP

JOP
1. Jmp/Call 2. API 3. shellcode 4.  3 


1. JMP 2.  3.  

ROP
rop 




 OFFICE Adobe Reader CALL
 


memcpy()0x0040D496 call 0040100Amemcpy() 0x0040105Amemcpy()call 0040100A



