VMProtect
@

CONTENTS
VMProtect VMProtect VMProtect  

VMProtect?
VMProtect 

8/27/16 2:30PM

2

VMProtect?

01

03

02

 intel 

,intel   (PCode)

   

VMProtect

8/27/16 2:30PM

2

8/27/16 2:30PM

3

 Intel(Register)  VM(VMReg)
VMProtect14 16(slot) 2  16

8/27/16 2:30PM

4

 Intel(Intel Instruction)  VM(VMRecord)

IntelIntel 
add eax,ecx
xor eax,eax ...

VMProtect VMRecord

vm_push_imm32

0x1

vm_get_context_dword

slot_offset

IntelVMRecord

 mov ecx,eax;

vm_get_context_dword

vEax

vm_save_context_dword

vEcx

8/27/16 2:30PM

5

 Intel(BasicBlock)  VM(VMBlock)

BasicBlockIntel VMProtect ,VMBlock VMBlockVMRecord
 (CFG) VMBlock

8/27/16 2:30PM

6

VMProtect

8/27/16 2:30PM

7

VMProtect
 VMProtectNOR()ADD()intel NOR(a,b) = NOT(OR(a,b)) = AND(NOT(a),NOT(b))
NOR,: NOT(a) = NOR(a,a) AND(a,b) = NOR(NOT(a),NOT(b)) = NOR(NOR(a,a),NOR(b,b)) OR(a,b) = NOR(NOR(a,b),NOR(a,b)) XOR(a,b) = NOR(NOR(a,b),NOR(NOR(a,a),NOR(b,b))) SUB(a,b) = NOR(ADD(NOR(a,a),b),ADD(NOR(a,a),b)) VMRecordand eax,ecx

8/27/16 2:30PM

7

VMProtect



 inteladd,xor,or
,intel9VMProtect162 
intelVMProtectf 

8/27/16 2:30PM

8

VMProtect
VMProtect162 (3,vEex,) VMProtect  vEax 1 vEax (2)vEax,1 IntelVM VMProtect VMProtect

8/27/16 2:30PM

9

VMProtect

and eax,ecx fVMRecords vEax1and (2)vEax1 21

8/27/16 2:30PM

10

VMProtect

8/27/16 2:30PM

10

VMProtect

,, .,.

 ,.  (non-all-path),,.

8/27/16 2:30PM

11

VMProtect

1.Control Flow 2.Intel
IntelVMRecord (opcode) (operand)

8/27/16 2:30PM

12

Control Flow

8/27/16 2:30PM

13

Intel
IntelVMRecord
VMBlock VMRecordsIntel   Intel VMRecords  VMRecord VMBlock  

8/27/16 2:30PM

14

Intel (opcode)

 
and eax,ecx VMRecords and  test dword and

8/27/16 2:30PM

15

Intel
(operand)
VMProtect VMProtect2 1vEex1  
add,xor,and,or result = lhs op rhsIntel Intelresult  lhs  Intel

8/27/16 2:30PM

16

Intel

mov eax,ecx

VMRecords:

vm_get_context_dword

vEcx

vm_save_context_dwordslot_id

saveslot_id

8/27/16 2:30PM

17

Intel 
 vm_exitvm_jmp VMBlock
  3 (1/3) 


8/27/16 2:30PM

17

WeChat

8/27/16 2:30PM

17

----VMProtect

01
Options



02
Options



03
Options

 

8/27/16 2:30PM

17

----

0
01

Treadstone 

2

02

LLVM arm

8/27/16 2:30PM

17

THANKS

