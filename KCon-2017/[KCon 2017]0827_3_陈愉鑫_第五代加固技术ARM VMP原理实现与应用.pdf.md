KC n
 ARM



CONTENTS

PART 01 Android  PART 02  PART 03 VYD  PART 04 VYD  PART 05 VYD  PART 06 ARM VM

    IA Android  i


1., 2. 3. 4.........


 ClassLoader  So  ELFOllvm    DEX  ARM 

Thumb 
ARM 
x86 
MIPS 
Mov R1,#2 Mov R2,#3 Add R0,R1,R2

VM







vMov R1,2 vMov R2,3 vMov R20,R1 vAdd R20,R2 vAdd R0,R20

® 

-  -  - ELF - 

 

VM 

 ARM


ARM  


  Vm 


VM  VM  VM  VM stub

ARM 
1. ThumbThumb-2 ARM 2.  3. Pc 4.  5. 



VYD vR0-vR12
vFp vSP vLR vPC1 vPC v16-v32 Flags

ARM  R0-R12 R11 R13 R14 R15 / / /

     ARMPC VYD   

VYD 

VYD 


1.   str fp, [sp, #-4]!



vMov r16,sp

vAdd r16,-4

vStr

fp,[r16]

vMov sp,r16

 B vJmp condOffset/Rx
B ->  -> VYD moveq r0r1 -> vJne s
vMov r0,r1 s: xxxxx

VYD 



Function: vm_get_ins

VPC
Function:vm_run







VYD 

VYD 

VYD OPCODE
Opcode enum


1.Handler 2.Switch



 1.ARM 2. 3. 4.opcode

arm
Capstone 
Capstone  Arm, Arm64 (Armv8), M68K, Mips, PowerPC, Sparc, SystemZ, TMS320C64X, XCore& X86 (incl ude X86_64)
 Clojure, F#, Common Lisp, Visual Basic, PHP, PowerShell, Haskell, Perl, Python, Ruby, C#, NodeJS, Java, GO, C++, OCaml, Lua, Rust, Delphi, Free Pascal
https://github.com/aquynh/capstone
brew install capstone sudo apt-get install libcapstone3
Python

Capstone( + 

0x80001000:

bl

#0x80000fbc

op_count: 1

operands[0].type: IMM = 0x80000fbc

//////////////////////////////////////////////////////////////////////////////

0x80001004:

str

lr, [sp, #-4]!

op_count: 2

operands[0].type: REG = lr

operands[1].type: MEM

operands[1].mem.base: REG = sp

operands[1].mem.disp: 0xfffffffc

Write-back: True

//////////////////////////////////////////////////////////////////////////////

0x80001008:

andeq r0, r0, r0

op_count: 3

operands[0].type: REG = r0

operands[1].type: REG = r0

operands[2].type: REG = r0

Code condition: 1


str fp, [sp, #-4]!
{"old asm": "0x0: str fp, [sp, #-4]!", "opcode": "!", "address": 0} {"opcode": "vMov", "operands": [{"isReg": 1, "data": 16}, {"isReg": 1, "data": 13}]} {"opcode": "vAdd", "operands": [{"isReg": 1, "data": 16}, {"isReg": 0, "value": -4}]} {"opcode": "vMov", "operands": [{"isReg": 1, "data": 13}, {"isReg": 1, "data": 16}]} {"opcode": "vStr", "operands": [{"isReg": 1, "data": 11}, {"isReg": 1, "data": 16}]}

opcode json


1.vm 2. 3.vm_run 

 Pcvm
1.  2. 
 1. 2. 2.ARM or thumb 
 1. 2. 3.Lrvm stub 4.vm stub vm 

VM "" 0.VM 1. 2.VmStub 3.vm elf 4.elf 5.elfopcode 6..........

Vm ­ 

r0

vr0

r1

vr1

r2



vr2

r3

vr3

r4

vr4

VM  ­ 
map
map<string,uint> opcodes; vMov:xxxxx Xxxx

THANK
YOU

