Breaking State-of-the-Art Binary Code Obfuscation
A Program Synthesis-based Approach REcon Brussels February 2, 2018

Tim Blazytko, @mr_phrazer http://synthesis.to

Moritz Contag, @dwuid https://dwuid.com

Chair for Systems Security Ruhr-Universität Bochum <firstname.lastname>@rub.de

Setting the Scene
 Obfuscated code, semantics?  Traditional deobfuscation techniques  Orthogonal approach
2

Motivation
Prevent Complicate reverse engineering attempts. · Intellectual Property · Malicious Payloads · Digital Rights Management
3

Motivation
Prevent Complicate reverse engineering attempts. · Intellectual Property · Malicious Payloads · Digital Rights Management
"We achieved our goals. We were uncracked for 13 whole days." ­ Martin Slater, 2K Australia, on BioShock (2007).
3

How to protect software?

Approaches
Abuse shortcomings of file parsers and other tools of the trade. · fld tbyte ptr [__bad_values] crashing OllyDbg 1.10. · Fake SizeOfImage crashing process dumpers.
5

Approaches
Abuse shortcomings of file parsers and other tools of the trade. · fld tbyte ptr [__bad_values] crashing OllyDbg 1.10. · Fake SizeOfImage crashing process dumpers.
Detect artifacts of the debugging process. · PEB.BeingDebugged bit being set. · int 2D and exception handling in debuggers.
5

Approaches
Abuse shortcomings of file parsers and other tools of the trade. · fld tbyte ptr [__bad_values] crashing OllyDbg 1.10. · Fake SizeOfImage crashing process dumpers.
Detect artifacts of the debugging process. · PEB.BeingDebugged bit being set. · int 2D and exception handling in debuggers.
5

Requirements 1. We want the technique to be semantics-preserving.
Preserve the observable behavior of the application.
6

Requirements
1. We want the technique to be semantics-preserving. 2. We want to avoid external dependencies, focus on code only.
Assume white-box attack scenario.
6

Requirements
1. We want the technique to be semantics-preserving. 2. We want to avoid external dependencies, focus on code only. 3. We want techniques where effort(deploy)  effort(attack).
Anti-Debugging tricks are effort 1:1.
6

Code Obfuscation Techniques
Opaque Predicates

tf
A Af

B

ª

t

B

C
tf

C

C'

Opaque Predicates

true

call GetCurrentProcess cmp eax, 0xffffffff je __block_a

false

__block_a: ... ...

__block_b: ... ...

9

Opaque Predicates

always taken

call GetCurrentProcess cmp eax, 0xffffffff je __block_a

never taken

__block_a: ... ...

dead code 

Opaque True Predicate
9

Opaque Predicates

always taken

call GetCurrentProcess cmp eax, 0xffffffff je __block_a

 opaque predicate never taken

__block_a: ... ...

dead code 

Opaque True Predicate
9

Opaque Predicates

always taken

call GetCurrentProcess cmp eax, 0xffffffff je __block_a

 opaque value never taken

__block_a: ... ...

dead code 

Opaque True Predicate
9

Opaque Predicates

always taken

mov eax, 0xffffffff cmp eax, 0xffffffff je __block_a

never taken

__block_a: ... ...

dead code 

Opaque True Predicate
9

Opaque Predicates

never taken

mov eax, 0xffffffff cmp eax, 0xdeadbeef je __block_a

always taken

dead code 

__block_b: ... ...

Opaque False Predicate
9

Opaque Predicates

true

call rand cmp eax, 0xdeadbeef je __block_a

false

__block_a: ... ...

semantically equivalent


__block_a': ... ...

Random Opaque Predicate

duplicated block

9

Opaque Predicates

 Increase in complexity (branch count, McCabe)  Can be built on hard problems (e. g., aliasing)  Forces analyst to encode additional knowledge  Hard to solve statically

Examples ­ GetCurrentProcess()  -1 ­ fldpi1  st(0) =  ­ x2  0 x ­ x + 1 = x x ­ pointer A must-alias pointer B ­ checksum(code) = 0x1c43b5cf

10

Opaque Predicates

 Increase in complexity (branch count, McCabe)  Can be built on hard problems (e. g., aliasing)  Forces analyst to encode additional knowledge  Hard to solve statically
 Solved for free using concrete execution traces

Examples ­ GetCurrentProcess()  -1 ­ fldpi1  st(0) =  ­ x2  0 x ­ x + 1 = x x ­ pointer A must-alias pointer B ­ checksum(code) = 0x1c43b5cf

10

Code Obfuscation Techniques
Virtual Machines

Virtual Machines
mov ecx, [esp+4] xor eax, eax mov ebx, 1 __secret_ip:
mov edx, eax add edx, ebx mov eax, ebx mov ebx, edx loop __secret_ip mov eax, ebx ret
12

Virtual Machines
mov ecx, [esp+4] xor eax, eax mov ebx, 1 __secret_ip:
mov edx, eax add edx, ebx mov eax, ebx mov ebx, edx loop __secret_ip mov eax, ebx ret
12

Virtual Machines
mov ecx, [esp+4] xor eax, eax mov ebx, 1 __secret_ip:
mov edx, eax add edx, ebx mov eax, ebx mov ebx, edx loop __secret_ip mov eax, ebx ret
12

Virtual Machines

mov ecx, [esp+4] xor eax, eax mov ebx, 1
__secret_ip: mov edx, eax add edx, ebx mov eax, ebx mov ebx, edx loop __secret_ip
mov eax, ebx ret



made-up instruction set

__bytecode: vld r0 vpop r1 vld r2 vld r1 vadd r1 vld r2 vpop r0

vld r1 vpop r2 vldi #1 vld r3 vsub r3 vld #0 veq r3 vbr0 #-0E

12

Virtual Machines

mov ecx, [esp+4] xor eax, eax mov ebx, 1
__secret_ip: push __bytecode call vm_entry
mov eax, ebx ret

made-up instruction set



__bytecode: db 54 68 69 73 20 64 6f db 65 73 6e 27 74 20 6c db 6f 6f 6b 20 6c 69 6b db 65 20 61 6e 79 74 68 db 69 6e 67 20 74 6f 20 db 6d 65 2e de ad be ef

12

Virtual Machines

mov ecx, [esp+4] xor eax, eax mov ebx, 1
__secret_ip: push __bytecode call vm_entry
mov eax, ebx ret

made-up instruction set



__bytecode: db 54 68 69 73 20 64 6f db 65 73 6e 27 74 20 6c db 6f 6f 6b 20 6c 69 6b db 65 20 61 6e 79 74 68
?db 69 6e 67 20 74 6f 20 db 6d 65 2e de ad be ef

12

Virtual Machines

Core Components

VM Entry/Exit VM Dispatcher Handler Table

Context Switch: native context  virtual context Fetch­Decode­Execute loop Individual VM ISA instruction semantics

· Entry · Exit

Copy native context (registers, flags) to VM context. Copy VM context back to native context.

· Mapping from native to virtual registers is often 1:1.

13

Virtual Machines

Core Components

VM Entry/Exit VM Dispatcher Handler Table

Context Switch: native context  virtual context Fetch­Decode­Execute loop Individual VM ISA instruction semantics

1. Fetch and decode instruction 2. Forward virtual instruction pointer 3. Look up handler for opcode in handler table 4. Invoke handler

FDE

look up

hhaannddlee__vvppuusshh hhaannddlee__vvaadddd hhaannddlee__vvxxoorr hhaannddlee__vveexxiitt hhaannddlee__vvppoopp
...

13

Virtual Machines

Core Components

VM Entry/Exit VM Dispatcher Handler Table

Context Switch: native context  virtual context Fetch­Decode­Execute loop Individual VM ISA instruction semantics

· Table of function pointers indexed by opcode
· One handler per virtual instruction
· Each handler decodes operands and updates VM context

FDE

look up

hhaannddlee__vvppuusshh hhaannddlee__vvaadddd hhaannddlee__vvxxoorr hhaannddlee__vveexxiitt hhaannddlee__vvppoopp
...

13

Virtual Machines
14

Virtual Machines

hhaannddlee__vvppuusshh hhaannddlee__vvaadddd hhaannddlee__vvxxoorr hhaannddlee__vveexxiitt hhaannddlee__vvppoopp
...
look up

} VM Entry }FDE VM Dispatcher (FDE)

Individual Handlers

VM Exit (as handler)
14

Virtual Machines
__vm_dispatcher: mov bl, [rsi] inc rsi movzx rax, bl jmp __handler_table[rax * 8]
VM Dispatcher
rsi ­ virtual instruction pointer rbp ­ VM context
15

Virtual Machines
__vm_dispatcher: mov bl, [rsi] inc rsi movzx rax, bl jmp __handler_table[rax * 8]
VM Dispatcher
rsi ­ virtual instruction pointer rbp ­ VM context

__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher
Handler performing nor (with flag side-effects)
15

Virtual Machine Hardening

Virtual Machines
Hardening Technique #1 ­ Obfuscating individual VM components. · Handlers are conceptually simple.
17

Virtual Machines

Hardening Technique #1 ­ Obfuscating individual VM components.

· Handlers are conceptually simple. · Apply traditional code obfuscation transformations:
· Substitution (mov rax, rbx ª push rbx; pop rax) · Opaque Predicates · Junk Code ·...

mov eax, dword [rbp] mov ecx, dword [rbp+4] cmp r11w, r13w sub rbp, 4 not eax clc cmc cmp rdx, 0x28b105fa not ecx cmp r12b, r9b

17

Virtual Machines
Hardening Technique #2 ­ Duplicating VM handlers. · Handler table is typically indexed using one byte (= 256 entries).
18

Virtual Machines
Hardening Technique #2 ­ Duplicating VM handlers. · Handler table is typically indexed using one byte (= 256 entries). · Idea: Duplicate existing handlers to populate full table. · Use traditional obfuscation techniques to impede code similarity analyses.
Goal: Increase workload of reverse engineer.
18

handle_vpush handle_vadd handle_vnor handle_vpop

handle_vpush

handle_vadd

handle_vpush handle_vadd handle_vnor



handle_vnor'' handle_vpop

handle_vadd'

handle_vpop

handle_vnor

handle_vnor'

handle_vadd''

Virtual Machines
Hardening Technique #3 ­ No central VM dispatcher. · A central VM dispatcher allows attacker to easily observe VM execution. · Idea: Instead of branching to the central dispatcher, inline it into each handler.
Goal: No "single point of failure".
(Themida, VMProtect Demo) 20

FDE

handle_vnor

handle_...

handle_vnor
FDE

handle_...
FDE

Virtual Machines
Hardening Technique #4 ­ No explicit handler table. · An explicit handler table easily reveals all VM handlers.
23

Virtual Machines
Hardening Technique #4 ­ No explicit handler table. · An explicit handler table easily reveals all VM handlers. · Idea: Instead of querying an explicit handler table, encode the next handler address in the VM instruction itself.
Goal: Hide location of handlers that have not been executed yet.
(VMProtect Full, SolidShield) 23

Virtual Machines
Hardening Technique #4 ­ No explicit handler table. · An explicit handler table easily reveals all VM handlers.
· Idea: oInpstceoaddoef queryoinpg a0n explicoit phan1dler table,
encode the next handler address in the VM instruction itself.
Goal: Hide location of handlers that have not been executed yet.
(VMProtect Full, SolidShield) 23

Virtual Machines
Hardening Technique #4 ­ No explicit handler table. · An explicit handler table easily reveals all VM handlers.
· Idea: oIennpsctcoeodaeddtoehfeqnueexrtyoihnpagna0dnleerxapdlidcroitepshsan1indltehretVanMbeleixn, tsthruactniodnlietsrelaf. ddr
Goal: Hide location of handlers that have not been executed yet.
(VMProtect Full, SolidShield) 23

Virtual Machines
Hardening Technique #5 ­ Blinding VM bytecode. · Global analyses on the bytecode possible, easy to patch instructions.
25

Virtual Machines
Hardening Technique #5 ­ Blinding VM bytecode.
· Global analyses on the bytecode possible, easy to patch instructions. · Idea:
· Flow-sensitive instruction decoding ("decryption" based on key register). · Custom decryption routine per handler, diversification. · Patching requires re-encryption of subsequent bytecode.
Goal: Hinder global analyses of bytecode and patching.
25

operand

 [vIP + 0]

context next_handler

 semantics(context, operand)  [vIP + 4]

vIP  vIP + 8 jmp next_handler
26

operand

 [vIP + 0]

 operand  key

 unmangle(operand, key)  unmangle(key, operand)

context next_handler

 semantics(context, operand)  [vIP + 4]

 next_handler  key

 unmangle(next_handler, key)  unmangle(key, next_handler)

vIP  vIP + 8 jmp next_handler

26

Code Obfuscation Techniques
Mixed Boolean-Arithmetic

Mixed Boolean-Arithmetic
What does this expression compute?
(x  y) + 2 · (x  y)
28

Mixed Boolean-Arithmetic
What does this expression compute?
(x  y) + 2 · (x  y) =x+y
28

Mixed Boolean-Arithmetic
What does this expression compute?
(((x  y) + ((x  y)  1))  z) + (((x  y) + ((x  y)  1))  z)
28

Mixed Boolean-Arithmetic
What does this expression compute?
(((x  y) + ((x  y)  1))  z) + (((x  y) + ((x  y)  1))  z) =x+y+z

· Boolean identities? · Arithmetic identities? · Karnaugh-Veitch maps?

A·0=0
A+B=A·B x2 - y2 = (x + y)(x - y)

28

Mixed Boolean-Arithmetic

Boolean-arithmetic algebra BA[n]
(Bn, , , , ¬, , , >, <, s, s, >s, <s, =, =, s, , , +, -, ·) is a Boolean-arithmetic algebra BA[n], for n > 0, B = {0, 1}.

BA[n] includes, amongst others, both:

· Boolean algebra · Integer modular ring

(Bn, , , ¬), Z/(2n).

No techniques to simplify such expressions easily!

29

Deobfuscation

Symbolic Execution
__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher
Handler performing nor (with flag side-effects)

Symbolic Execution
__handle_vnor: · mov rcx, [rbp]
mov rbx, [rbp + 4] not rcx not rbx and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher
Handler performing nor (with flag side-effects)

rcx  [rbp]

Symbolic Execution
__handle_vnor: mov rcx, [rbp]
· mov rbx, [rbp + 4] not rcx not rbx and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher
Handler performing nor (with flag side-effects)

rcx  [rbp] rbx  [rbp + 4]

Symbolic Execution
__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4]
· not rcx not rbx and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher
Handler performing nor (with flag side-effects)

rcx  [rbp] rbx  [rbp + 4] rcx  ¬ rcx = ¬ [rbp]

Symbolic Execution
__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx
· not rbx and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher
Handler performing nor (with flag side-effects)

rcx  [rbp] rbx  [rbp + 4] rcx  ¬ rcx = ¬ [rbp] rbx  ¬ rbx = ¬ [rbp + 4]

Symbolic Execution
__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx
· and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher
Handler performing nor (with flag side-effects)

rcx  [rbp] rbx  [rbp + 4] rcx  ¬ rcx = ¬ [rbp] rbx  ¬ rbx = ¬ [rbp + 4] rcx  rcx  rbx
= (¬ [rbp])  (¬ [rbp + 4])

Symbolic Execution
__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx
· and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher
Handler performing nor (with flag side-effects)

rcx  [rbp] rbx  [rbp + 4] rcx  ¬ rcx = ¬ [rbp] rbx  ¬ rbx = ¬ [rbp + 4] rcx  rcx  rbx
= (¬ [rbp])  (¬ [rbp + 4]) = [rbp]  [rbp + 4]

Symbolic Execution
__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx and rcx, rbx
· mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher
Handler performing nor (with flag side-effects)

rcx  [rbp] rbx  [rbp + 4] rcx  ¬ rcx = ¬ [rbp] rbx  ¬ rbx = ¬ [rbp + 4] rcx  rcx  rbx
= (¬ [rbp])  (¬ [rbp + 4]) = [rbp]  [rbp + 4] [rbp + 4]  rcx = [rbp]  [rbp + 4]
31

Symbolic Execution
__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx and rcx, rbx mov [rbp + 4], rcx
· pushf pop [rbp] jmp __vm_dispatcher
Handler performing nor (with flag side-effects)

rcx  [rbp] rbx  [rbp + 4] rcx  ¬ rcx = ¬ [rbp] rbx  ¬ rbx = ¬ [rbp + 4] rcx  rcx  rbx
= (¬ [rbp])  (¬ [rbp + 4]) = [rbp]  [rbp + 4] [rbp + 4]  rcx = [rbp]  [rbp + 4]
rsp  rsp - 4 [rsp]  flags
31

Symbolic Execution
__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx and rcx, rbx mov [rbp + 4], rcx pushf
· pop [rbp] jmp __vm_dispatcher
Handler performing nor (with flag side-effects)

rcx  [rbp] rbx  [rbp + 4] rcx  ¬ rcx = ¬ [rbp] rbx  ¬ rbx = ¬ [rbp + 4] rcx  rcx  rbx
= (¬ [rbp])  (¬ [rbp + 4]) = [rbp]  [rbp + 4] [rbp + 4]  rcx = [rbp]  [rbp + 4]
rsp  rsp - 4 [rsp]  flags [rbp]  [rsp] = flags
rsp  rsp + 4 31

Symbolic Execution

__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx

rcx  [rbp] rbx  [rbp + 4] rcx  ¬ rcx = ¬ [rbp] rbx  ¬ rbx = ¬ [rbp + 4]

[rbp + 4] not rbx
and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp]



([rbp]  [rbp + 4]) rcx  rcx  rbx = (¬ [rbp])  (¬ [rbp + 4]) = [rbp]  [rbp + 4] [rbp + 4]  rcx = [rbp]  [rbp + 4]

· jmp __vm_dispatcher

rsp  rsp - 4

[rsp]  flags

Handler performing nor (with flag side-effects)

[rbp]  [rsp] = flags rsp  rsp + 4

31

Virtual Machine Handler

mov eax, dword [rbp] mov ecx, dword [rbp + 4] cmp r11w, r13w sub rbp, 4 not eax clc cmc cmp rdx, 0x28b105fa not ecx cmp r12b, r9b cmc and eax, ecx jmp 0xc239 mov word [rbp + 8], eax pushfq movzx eax, r10w and ax, di pop qword [rbp] sub rsi, 4 shld rax, rdx, 0x1b xor ah, 0x4d mov eax, dword [rsi] cmp ecx, r11d test r10, 0x179708d5 xor eax, ebx

jmp 0xfffffffffff63380

dec eax

stc

ror eax, 1

jmp 0xffffffffffff2a70

dec eax

clc

bswap eax

test bp, 0x5124

neg eax

test dil, 0xe9

cmp bx, r14w

cmc

push rbx

sub bx, 0x49f8

xor dword [rsp], eax

and bh, 0xaf

pop rbx

movsxd rax, eax

test r13b, 0x94

add rdi, rax

jmp 0xfffffffffffc67c7

lea rax, [rsp + 0x140]

cmp rbp, rax

ja

0x6557b

jmp rdi

Virtual Machine Handler

IRDst = ((- {((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0 8, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init

+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[8:16] 16 24, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32})[31:32]?((RDI_init+{(- {((((@32[(RSI_init

+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0 8, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init

[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[8:16] 16 24, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32}) 0 32, 0xFFFFFFFF 32 64}),(RDI_init+{(- {((((@32[(RSI_init

+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0 8, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init

[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[8:16] 16 24, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32}) 0 32, 0x0 32 64}))) pf = parity(((RBP_init+(- RSP_init)+0xFFFFFFFFFFFFFEBC)&0xFF))

cf = ((((RBP_init+(- RSP_init)+0xFFFFFFFFFFFFFEBC)^(RBP_init+0xFFFFFFFFFFFFFFFC))&((RBP_init+0xFFFFFFFFFFFFFFFC)^(RSP_init+0x140)))^(RBP_init+(- RSP_init)+0xFFFFFFFFFFFFFEBC)^(RBP_init+0xFFFFFFFFFFFFFFFC)^(RSP_init+0x140))[63:64] af =

((RBP_init+(- RSP_init)+0xFFFFFFFFFFFFFEBC)^(RBP_init+0xFFFFFFFFFFFFFFFC)^(RSP_init+0x140))[4:5]

@64[(RBP_init+0xFFFFFFFFFFFFFFFC)] = (((@32[RBP_init]^0xFFFFFFFF)&(@32[(RBP_init+0x4)]^0xFFFFFFFF))?({0x2 0 2, parity(((@32

[RBP_init]^0xFFFFFFFF)&(@32[(RBP_init+0x4)]^0xFFFFFFFF)&0xFF)) 2 3, 0x0 3 4, (((- R9_init[0:8])+R12_init[0:8])^R12_init[0:8]^R9_init[0:8])[4:5] 4 5, 0x0 5 7, ((@32[RBP_init]^0xFFFFFFFF)&(@32[(RBP_init+0x4)]^0xFFFFFFFF))[31:32] 7 8, tf_init 8 9, i_f_init

9 10, df_init 10 11, 0x0 11 12, iopl_f_init 12 14, nt_init 14 15, 0x0 15 16, rf_init 16 17, vm_init 17 18, ac_init 18 19, vif_init 19 20, vip_init 20 21, i_d_init 21 22, 0x0 22 64},{0x2 0 2, parity(((@32[RBP_init]^0xFFFFFFFF)&(@32[(RBP_init

+0x4)]^0xFFFFFFFF)&0xFF)) 2 3, 0x0 3 4, (((- R9_init[0:8])+R12_init[0:8])^R12_init[0:8]^R9_init[0:8])[4:5] 4 5, 0x2 5 7, ((@32[RBP_init]^0xFFFFFFFF)&(@32[(RBP_init+0x4)]^0xFFFFFFFF))[31:32] 7 8, tf_init 8 9, i_f_init 9 10, df_init 10 11, 0x0 11 12,

iopl_f_init 12 14, nt_init 14 15, 0x0 15 16, rf_init 16 17, vm_init 17 18, ac_init 18 19, vif_init 19 20, vip_init 20 21, i_d_init 21 22, 0x0 22 64}))

RAX = (RSP_init+0x140)

of = (((RBP_init+(- RSP_init)+0xFFFFFFFFFFFFFEBC)^(RBP_init

+0xFFFFFFFFFFFFFFFC))&((RBP_init+0xFFFFFFFFFFFFFFFC)^(RSP_init+0x140)))[63:64] RCX = {(@32[(RBP_init+0x4)]^0xFFFFFFFF) 0 32, 0x0 32 64} @32[(RBP_init+0x4)] = ((@32[RBP_init]^0xFFFFFFFF)&(@32[(RBP_init+0x4)]^0xFFFFFFFF)) RBX =

{((- {((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0 8, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init

+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[8:16] 16 24, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32})^RBX_init[0:32]) 0 32, RBX_init[32:64] 32 64} RBP =

(RBP_init+0xFFFFFFFFFFFFFFFC) zf = ((RBP_init+(- RSP_init)+0xFFFFFFFFFFFFFEBC)?(0x0,0x1)) RSI = (RSI_init+0xFFFFFFFFFFFFFFFC) RDI = ((- {((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0

8, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[8:16] 16 24, ((((@32[(RSI_init

+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32})[31:32]?((RDI_init+{(- {((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0 8, ((((@32[(RSI_init

+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[8:16] 16 24, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init

[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32}) 0 32, 0xFFFFFFFF 32 64}),(RDI_init+{(- {((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0 8, ((((@32[(RSI_init

+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[8:16] 16 24, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init

[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32}) 0 32, 0x0 32 64})))

nf = (RBP_init+(- RSP_init)+0xFFFFFFFFFFFFFEBC)[63:64]

@32[(RSP_init+0xFFFFFFFFFFFFFFF8)] = ((- {((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])

+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0 8, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)

[8:16] 16 24, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32})^RBX_init[0:32]) @32[(RSP_init+0xFFFFFFFFFFFFFFFC)] = RBX_init[32:64]

Virtual Machine Handler

IRDst = ((- {((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0 8, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init

+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[8:16] 16 24, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32})[31:32]?((RDI_init+{(- {((((@32[(RSI_init

+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0 8, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init

[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[8:16] 16 24, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32}) 0 32, 0xFFFFFFFF 32 64}),(RDI_init+{(- {((((@32[(RSI_init

+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0 8, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init

[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[8:16] 16 24, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32}) 0 32, 0x0 32 64}))) pf = parity(((RBP_init+(- RSP_init)+0xFFFFFFFFFFFFFEBC)&0xFF))

cf = ((((RBP_init+(- RSP_init)+0xFFFFFFFFFFFFFEBC)^(RBP_init+0xFFFFFFFFFFFFFFFC))&((RBP_init+0xFFFFFFFFFFFFFFFC)^(RSP_init+0x140)))^(RBP_init+(- RSP_init)+0xFFFFFFFFFFFFFEBC)^(RBP_init+0xFFFFFFFFFFFFFFFC)^(RSP_init+0x140))[63:64] af =

M1 = (¬M1)  (¬M2) ((RBP_init+(- RSP_init)+0xFFFFFFFFFFFFFEBC)^(RBP_init+0xFFFFFFFFFFFFFFFC)^(RSP_init+0x140))[4:5]

@64[(RBP_init+0xFFFFFFFFFFFFFFFC)] = (((@32[RBP_init]^0xFFFFFFFF)&(@32[(RBP_init+0x4)]^0xFFFFFFFF))?({0x2 0 2, parity(((@32

[RBP_init]^0xFFFFFFFF)&(@32[(RBP_init+0x4)]^0xFFFFFFFF)&0xFF)) 2 3, 0x0 3 4, (((- R9_init[0:8])+R12_init[0:8])^R12_init[0:8]^R9_init[0:8])[4:5] 4 5, 0x0 5 7, ((@32[RBP_init]^0xFFFFFFFF)&(@32[(RBP_init+0x4)]^0xFFFFFFFF))[31:32] 7 8, tf_init 8 9, i_f_init

9 10, df_init 10 11, 0x0 11 12, iopl_f_init 12 14, nt_init 14 15, 0x0 15 16, rf_init 16 17, vm_init 17 18, ac_init 18 19, vif_init 19 20, vip_init 20 21, i_d_init 21 22, 0x0 22 64},{0x2 0 2, parity(((@32[RBP_init]^0xFFFFFFFF)&(@32[(RBP_init

+0x4)]^0xFFFFFFFF)&0xFF)) 2 3, 0x0 3 4, (((- R9_init[0:8])+R12_init[0:8])^R12_init[0:8]^R9_init[0:8])[4:5] 4 5, 0x2 5 7, ((@32[RBP_init]^0xFFFFFFFF)&(@32[(RBP_init+0x4)]^0xFFFFFFFF))[31:32] 7 8, tf_init 8 9, i_f_init 9 10, df_init 10 11, 0x0 11 12,

iopl_f_init 12 14, nt_init 14 15, 0x0 15 16, rf_init 16 17, vm_init 17 18, ac_init 18 19, vif_init 19 20, vip_init 20 21, i_d_init 21 22, 0x0 22 64}))

RAX = (RSP_init+0x140)

of = (((RBP_init+(- RSP_init)+0xFFFFFFFFFFFFFEBC)^(RBP_init

+0xFFFFFFFFFFFFFFFC))&((RBP_init+0xFFFFFFFFFFFFFFFC)^(RSP_init+0x140)))[63:64] RCX = {(@32[(RBP_init+0x4)]^0xFFFFFFFF) 0 32, 0x0 32 64} @32[(RBP_init+0x4)] = ((@32[RBP_init]^0xFFFFFFFF)&(@32[(RBP_init+0x4)]^0xFFFFFFFF)) RBX =

{((- {((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0 8, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init

+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[8:16] 16 24, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32})^RBX_init[0:32]) 0 32, RBX_init[32:64] 32 64} RBP =

(RBP_init+0xFFFFFFFFFFFFFFFC) zf = ((RBP_init+(- RSP_init)+0xFFFFFFFFFFFFFEBC)?(0x0,0x1)) RSI = (RSI_init+0xFFFFFFFFFFFFFFFC) RDI = ((- {((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0

8, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[8:16] 16 24, ((((@32[(RSI_init

+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32})[31:32]?((RDI_init+{(- {((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0 8, ((((@32[(RSI_init

+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[8:16] 16 24, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init

[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32}) 0 32, 0xFFFFFFFF 32 64}),(RDI_init+{(- {((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0 8, ((((@32[(RSI_init

+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[8:16] 16 24, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init

[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32}) 0 32, 0x0 32 64})))

nf = (RBP_init+(- RSP_init)+0xFFFFFFFFFFFFFEBC)[63:64]

@32[(RSP_init+0xFFFFFFFFFFFFFFF8)] = ((- {((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])

+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[24:32] 0 8, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[16:24] 8 16, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)

[8:16] 16 24, ((((@32[(RSI_init+0xFFFFFFFFFFFFFFFC)]^RBX_init[0:32])+0xFFFFFFFF) >>> 0x1)+0xFFFFFFFF)[0:8] 24 32})^RBX_init[0:32]) @32[(RSP_init+0xFFFFFFFFFFFFFFFC)] = RBX_init[32:64]

Mixed Boolean-Arithmetic Expression
int mixed_boolean(int A, int B, int C) { int result;
result = (((1438524315 + ((((1438524315 + C) + 1438524315 * ((2956783114 - -1478456685 * C) | (-1478456685 * (1668620215 - A) - 2956783115))) + A) - 1553572265)) + 1438524315 * ((2956783114 -1478456685 * ((((1438524315 + C) + 1438524315 * ((2956783114 - -1478456685 * C) | (-1478456685 * (1668620215 - A) - 2956783115))) + A) - 1553572265)) | (-1478456685 * (1668620215 - B) 2956783115))) - ((1438524315 + (1668620215 - ((((1438524315 + C) + 1438524315 * ((2956783114 -1478456685 * C) | (-1478456685 * (1668620215 - A) - 2956783115))) + A) - 1553572265))) + 1438524315 * ((2956783114 - -1478456685 * (1668620215 - ((((1438524315 + C) + 1438524315 * ((2956783114 - -1478456685 * C) | (-1478456685 * (1668620215 - A) - 2956783115))) + A) 1553572265))) | (-1478456685 * B - 2956783115)))) + 1553572265;
return -1478456685 * result - 2956783115; }

Mixed Boolean-Arithmetic Expression
RAX = {((((- ((((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+(@32[(RBP_init +0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+((((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32 [(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init +0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] [31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)| ((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init +0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32 [(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D))) [0:32]+0xB03CEE0A))[31:32]?(({(((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32] +0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32] +0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)|((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D)))[0:32]+0xB03CEE0A)) 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({(((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64} *0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)|((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32 [(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init +0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32 [(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D)))[0:32]+0xB03CEE0A)) 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0xB9334352)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B))) [0:32]+(@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+((((- (((@32[(RBP_init +0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init +0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64} *0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)|((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B))) [0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D)))[0:32]+0xB03CEE0A))[31:32]?(({(((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init +0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init +0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64} *0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)|((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init +0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init +0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32 [(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D)))[0:32]+0xB03CEE0A)) 0 32, 0xFFFFFFFF 32 64} *0x55BE239B),({(((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]? (({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64} *0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)|((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B))) [0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D)))[0:32]+0xB03CEE0A)) 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0xB9334352) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init +0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+(@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+((((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init +0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init +0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64} *0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)|((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init +0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init +0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32 [(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D)))[0:32]+0xB03CEE0A))[31:32]?(({(((- (((@32[(RBP_init +0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init +0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64} *0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)|((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B))) [0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D)))[0:32]+0xB03CEE0A)) 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({(((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64} *0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),

Mixed Boolean-Arithmetic Expression
RAX = {((((- ((((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+(@32[(RBP_init +0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+((((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32 [(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init +0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] [31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)| ((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init +0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32 [(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D))) [0:32]+0xB03CEE0A))[31:32]?(({(((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32] +0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32] +0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)|((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D)))[0:32]+0xB03CEE0A)) 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({(((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64} *0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)|((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32 [(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init +0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32 [(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D)))[0:32]+0xB03CEE0A)) 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0xB9334352)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B))) [0:32]+(@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+((((- (((@32[(RBP_init +0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init
RAX = (M4 | M0) ­ M2 +0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}
*0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)|((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B))) [0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D)))[0:32]+0xB03CEE0A))[31:32]?(({(((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init +0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init +0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64} *0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)|((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init +0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init +0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32 [(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D)))[0:32]+0xB03CEE0A)) 0 32, 0xFFFFFFFF 32 64} *0x55BE239B),({(((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]? (({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64} *0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)|((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B))) [0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D)))[0:32]+0xB03CEE0A)) 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0xB9334352) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init +0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+(@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+((((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init +0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init +0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64} *0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)|((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init +0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init +0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32 [(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D)))[0:32]+0xB03CEE0A))[31:32]?(({(((- (((@32[(RBP_init +0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init +0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64} *0xFFFFFFFFA7E08A93),({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0xFFFFFFFFA7E08A93)))[0:32])+0xB03CEE0A)|((((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64}*0x55BE239B))) [0:32]+0x5C99A1A9) 0 32, 0xFFFFFFFF 32 64}*0x581F756D),({((@32[(RBP_init+0xFFFFFFFFFFFFFFFC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFFC)] 0 32, 0x0 32 64} *0x55BE239B)))[0:32]+0x5C99A1A9) 0 32, 0x0 32 64}*0x581F756D)))[0:32]+0xB03CEE0A)) 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),({(((- (((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64} *0x55BE239B),({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0x0 32 64}*0x55BE239B)))[0:32]+0x5C99A1A9)[31:32]?(({((@32[(RBP_init+0xFFFFFFFFFFFFFFEC)][31:32]?(({@32[(RBP_init+0xFFFFFFFFFFFFFFEC)] 0 32, 0xFFFFFFFF 32 64}*0x55BE239B),

Symbolic Execution
 Captures full semantics of executed code  Computer algebra system, some degree of simplification  Usability decreases with increasing syntactic complexity
· Artificial complexity (substitution, ...) · Algebraic complexity (MBA)
34

Symbolic Execution
 Captures full semantics of executed code  Computer algebra system, some degree of simplification  Usability decreases with increasing syntactic complexity
· Artificial complexity (substitution, ...) · Algebraic complexity (MBA)
What if we could reason about semantics only instead of syntax?
34

Program Synthesis

Program Synthesis: A Semantic Approach
We use f as a black-box: f(x, y, z) := (((x  y) + ((x  y) · 2))  z) + (((x  y) + ((x  y) · 2))  z)
36

Program Synthesis: A Semantic Approach
We use f as a black-box: f(x, y, z) := (((x  y) + ((x  y) · 2))  z) + (((x  y) + ((x  y) · 2))  z)

(1,1,1)

?

3

36

Program Synthesis: A Semantic Approach

We use f as a black-box: f(x, y, z) := (((x  y) + ((x  y) · 2))  z) + (((x  y) + ((x  y) · 2))  z)

(1,1,1)

?

3

(1, 1, 1)  3

36

Program Synthesis: A Semantic Approach

We use f as a black-box: f(x, y, z) := (((x  y) + ((x  y) · 2))  z) + (((x  y) + ((x  y) · 2))  z)

(2,3,1)

?

6

(1, 1, 1)  3

36

Program Synthesis: A Semantic Approach

We use f as a black-box: f(x, y, z) := (((x  y) + ((x  y) · 2))  z) + (((x  y) + ((x  y) · 2))  z)

(2,3,1)

?

6

(1, 1, 1)  3 (2, 3, 1)  6

36

Program Synthesis: A Semantic Approach

We use f as a black-box: f(x, y, z) := (((x  y) + ((x  y) · 2))  z) + (((x  y) + ((x  y) · 2))  z)

(0,7,2)

?

9

(1, 1, 1)  3 (2, 3, 1)  6

36

Program Synthesis: A Semantic Approach

We use f as a black-box: f(x, y, z) := (((x  y) + ((x  y) · 2))  z) + (((x  y) + ((x  y) · 2))  z)

(0,7,2)

?

9

(1, 1, 1)  3 (2, 3, 1)  6 (0, 7, 2)  9

36

Program Synthesis: A Semantic Approach

We use f as a black-box: f(x, y, z) := (((x  y) + ((x  y) · 2))  z) + (((x  y) + ((x  y) · 2))  z)

We learn a function that has the same I/O behavior:

(1, 1, 1)  3 (2, 3, 1)  6 (0, 7, 2)  9

36

Program Synthesis: A Semantic Approach

We use f as a black-box: f(x, y, z) := (((x  y) + ((x  y) · 2))  z) + (((x  y) + ((x  y) · 2))  z)

We learn a function that has the same I/O behavior:

(1, 1, 1)  3 (2, 3, 1)  6 (0, 7, 2)  9

h(x, y, z) := x + y + z
36

How to synthesize programs?

Stochastic Program Synthesis
· probabilistic optimization problem
global maxima
38

Stochastic Program Synthesis
· probabilistic optimization problem

global maxima

0.96

0.11

0.34

0.71

0.62

38

Stochastic Program Synthesis

· probabilistic optimization problem · based on Monte Carlo Tree Search (MCTS)
global maxima

0.96

0.11

0.34

0.71

0.62

38

Let's synthesize: a + b mod 8

Program Generation UU+U|UU|a|b
40

Program Generation

UU+U|UU|a|b

· non-terminal symbol:

U

40

Program Generation

UU+U|UU|a|b

· non-terminal symbol: · input variables:

U {a, b}

40

Program Generation

UU+U|UU|a|b

· non-terminal symbol: · input variables: · candidate programs:

U {a, b} a, b, a  b, a + b, . . .

40

Program Generation

UU+U|UU|a|b

· non-terminal symbol: · input variables: · candidate programs: · intermediate programs:

U {a, b} a, b, a  b, a + b, . . . U + U, U  U, U + b, . . .

40

Monte Carlo Tree Search
U
41

Monte Carlo Tree Search

U a

41

Monte Carlo Tree Search

U
a
0.64

41

Monte Carlo Tree Search

U
a
0.64

41

Monte Carlo Tree Search

U ab
0.64

41

Monte Carlo Tree Search

U ab
0.64 0.44

41

Monte Carlo Tree Search

U ab
0.64 0.44

41

Monte Carlo Tree Search
U*U

U ab
0.64 0.44

41

Monte Carlo Tree Search
U*U

U ab
0.64 0.44

(a+a)*(b*a)

41

Monte Carlo Tree Search
U*U
0.39

U ab
0.64 0.44

41

Monte Carlo Tree Search
U*U
0.39

U ab
0.64 0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U

ab
0.64 0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U

ab
0.64 0.44

a+(b+b)

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

U+(U+U)

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

U+(U+U)

(a+a)+((a*b)+b)
41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

U+(U+U) 0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

U+(U+U) 0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.57

ab
0.64 0.44

U+(U+U) 0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.57

ab
0.64 0.44

U+(U+U) 0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.57

ab
0.64 0.44

U+(U+U) 0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.57

ab
0.64 0.44

U+b U+(U+U) 0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.57

ab
0.64 0.44

U+b U+(U+U) 0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.57

ab
0.64 0.44

U+b U+(U+U)

0.73

0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.57

ab
0.64 0.44

U+b U+(U+U)

0.73

0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.62

ab
0.64 0.44

U+b U+(U+U)

0.73

0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.62

ab
0.64 0.44

U+b U+(U+U)

0.73

0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.62

ab
0.64 0.44

U+b U+(U+U)

0.73

0.44

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.62

ab
0.64 0.44

U+b U+(U+U)

0.73

0.44

U+(U*U)

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.62

ab
0.64 0.44

U+b U+(U+U)

0.73

0.44

U+(U*U)

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.62

ab
0.64 0.44

U+b U+(U+U)

0.73

0.44

U+(U*U) 0.69

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.62

ab
0.64 0.44

U+b U+(U+U)

0.73

0.44

U+(U*U) 0.69

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.64

ab
0.64 0.44

U+b U+(U+U)

0.73

0.44

U+(U*U) 0.69

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.64

ab
0.64 0.44

U+b U+(U+U)

0.73

0.44

U+(U*U) 0.69

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.64

ab
0.64 0.44

U+b U+(U+U)

0.73

0.44

U+(U*U) 0.69

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.64

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.69

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.64

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.69

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.64

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.87

0.69

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.64

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.87

0.69

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.87

0.69

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.87

0.69

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.87

0.69

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.87

0.69

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.87

0.69

(U*U)+a

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.87

0.69

(U*U)+a

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.87

0.69

(U*U)+a
0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.87

0.69

(U*U)+a
0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.81

0.69

(U*U)+a
0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.81

0.69

(U*U)+a
0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.81

0.69

(U*U)+a
0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.81

0.69

(U*U)+a
0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.81

0.69

(U*U)+a
0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.81

0.69

(U*U)+a
0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.81

0.69

a+(U+U) (U*U)+a
0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.81

0.69

a+(U+U) (U*U)+a
0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.81

0.69

a+(U+U) (U*U)+a

0.68

0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.44

0.81

0.69

a+(U+U) (U*U)+a

0.68

0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.56

0.81

0.69

a+(U+U) (U*U)+a

0.68

0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.70

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.56

0.81

0.69

a+(U+U) (U*U)+a

0.68

0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.56

0.81

0.69

a+(U+U) (U*U)+a

0.68

0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.56

0.81

0.69

a+(U+U) (U*U)+a

0.68

0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.56

0.81

0.69

a+(U+U) (U*U)+a

0.68

0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.56

0.81

0.69

a+(U+U) (U*U)+a

0.68

0.75

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.56

0.81

0.69

a+(U+U) (U*U)+a

0.68

0.75

b+a

41

Monte Carlo Tree Search
U

U*U
0.39

U+U 0.69

ab
0.64 0.44

U+b U+(U+U) U+a U+(U*U)

0.73

0.56

0.81

0.69

a+(U+U) (U*U)+a

0.68

0.75

b+a
1.00

41

Score Calculation
(2,2)
?
42

Score Calculation
(2,2)
?
4
42

Score Calculation
(2,2)

?

4

6

42

Score Calculation
(2,2)

?

4

6

similarity(4, 6) = 0.78
42

Score Calculation
(5,3)
?

similarity(4, 6) = 0.78
42

Score Calculation
(5,3)
?
0

similarity(4, 6) = 0.78
42

Score Calculation
(5,3)

?

0

3

similarity(4, 6) = 0.78
42

Score Calculation
(5,3)

?

0

3

similarity(4, 6) = 0.78 similarity(0, 3) = 0.33
42

Score Calculation
(3,0)
?

similarity(4, 6) = 0.78 similarity(0, 3) = 0.33
42

Score Calculation
(3,0)
?
3

similarity(4, 6) = 0.78 similarity(0, 3) = 0.33
42

Score Calculation
(3,0)

?

3

3

similarity(4, 6) = 0.78 similarity(0, 3) = 0.33
42

Score Calculation
(3,0)

?

3

3

similarity(4, 6) = 0.78

similarity(0, 3) = 0.33

similarity(3, 3) =

1.0

42

Score Calculation
(3,0)

?

3

3

similarity(4, 6) = 0.78

similarity(0, 3) = 0.33

similarity(3, 3) =

1.0

average score: 0.70

42

Output Similarity: similarity(O, O)
11110111100100001000110010000000 11100010000110011110101100000000
Let's compare:
43

Output Similarity: similarity(O, O)
11110111100100001000110010000000 11100010000110011110101100000000
Are they in the same range?
43

Output Similarity: similarity(O, O)
11110111100100001000110010000000 11100010000110011110101100000000
How many bits are different?
43

Output Similarity: similarity(O, O)
11110111100100001000110010000000 00010101011101101010000110000000 11100010000110011110101100000000
How close are they numerically?
43

DEMO

How to synthesize obfuscated code?

Obtaining Code
static disassembly
46

Obtaining Code

54 68 69 73 20 64 6f 65 73 6e 27 74 20 6c 6f 6f 6b 20 6c 69 6b 65 20 61 6e 79 74 68 69 6e 67 20 74 6f 20 6d 65 2e de ad be ef

static disassembly

memory dump

46

Obtaining Code

static disassembly

54 68 69 73 20 64 6f 65 73 6e 27 74 20 6c 6f 6f 6b 20 6c 69 6b 65 20 61 6e 79 74 68 69 6e 67 20 74 6f 20 6d 65 2e de ad be ef
memory dump

mov r15, 0x200

mov

xor r15, 0x800

xor

mov rbx, rbp

sub

add rbx, 0xc0

or

mov rbx, qword ptr [rbx] mov

mov r13, 1

mov

mov rcx, 0

sub

mov r15, rbp

mov

add r15, 0xc0

mov

or rcx, 0x88

sub

add rbx, 0xb

sub

mov r15, qword ptr [r15] add

or r12, 0xffffffff80000000 add

sub rcx, 0x78

and

movzx r10, word ptr [rbx]

xor

xor r12, r13

mov

add r12, 0xffff

add

add r15, 0

sub

mov r8, rbp

add

sub rcx, 0x10

add

or r12, r12

mov

or rcx, 0x800

mov

movzx r11, word ptr [r15]

add

xor rcx, 0x800

xor

mov r12, r15

add

add r8, 0

add

xor r12, 0xf0

mov

mov rbx, 0x58

mov

add r11, rbp

mov

r15, rdx r10d, dword ptr [r12] r15, 0x800 rdx, 0x400 rsi, 0x200 r14, rbp rsi, rsi rdi, rbp r8, 0x400 rsi, r9 r8, rsi r14, 0 rsi, rax r8, 0x88 rsi, r14 rsi, rbp rdi, 0xc0 r8, rdi r8, 0x78 rsi, 4 rcx, 0x200 rdi, qword ptr [rdi] dword ptr [rsi], 0x254 rcx, 0xf0 rcx, r10 rdi, 6 r8, 0x400 ax, word ptr [rdi] r8, 1

instruction trace

46

Learning Code Semantics
__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher
Handler performing nor (with flag side-effects)
47

Learning Code Semantics
__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx · not rbx and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher
Handler performing nor (with flag side-effects)

?

rbx

47

Learning Code Semantics

__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx · not rbx and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher

?

rbx

(0,5)

?

-1

Handler performing nor (with flag side-effects)
47

Learning Code Semantics

__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx · not rbx and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher

?

rbx

(0,5)

?

-1

(2,7)

?

-3

Handler performing nor (with flag side-effects)
47

Learning Code Semantics

__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx · not rbx and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher

?

rbx

(0,5)

?

-1

(2,7)

?

-3

Handler performing nor (with flag side-effects)


47

Learning Code Semantics

__handle_vnor:

mov rcx, [rbp]

mov rbx, [rbp + 4]

not rcx

rbx · not and mov

rbx rcx, rbx [rbp + 4], rcx

pushf

pop [rbp]

jmp __vm_dispatcher

?

?  ¬ (0,5) m0

(2,7)

?

rbx -1 -3

Handler performing nor (with flag side-effects)


47

Learning Code Semantics
__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx · and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher
Handler performing nor (with flag side-effects)

?

rcx

47

Learning Code Semantics

__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx · and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher

?

rcx

(3,6)

?

-8

Handler performing nor (with flag side-effects)
47

Learning Code Semantics

__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx · and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher

?

rcx

(3,6)

?

-8

(1,1)

?

-2

Handler performing nor (with flag side-effects)
47

Learning Code Semantics

__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx · and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher

?

rcx

(3,6)

?

-8

(1,1)

?

-2

Handler performing nor (with flag side-effects)


47

Learning Code Semantics

__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx
rcx not rbx
· and rcx, rbx mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher

?

rcx

?  ¬(3(,m6) 0  m1) -8

(1,1)

?

-2

Handler performing nor (with flag side-effects)


47

Learning Code Semantics
__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx and rcx, rbx · mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher
Handler performing nor (with flag side-effects)

?
47

Learning Code Semantics

__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx and rcx, rbx · mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher

?

(0,0)

?

-1

Handler performing nor (with flag side-effects)
47

Learning Code Semantics

__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx and rcx, rbx · mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher

?

(0,0)

?

-1

(4,3)

?

-8

Handler performing nor (with flag side-effects)
47

Learning Code Semantics

__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx not rbx and rcx, rbx · mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher

?

(0,0)

?

-1

(4,3)

?

-8

Handler performing nor (with flag side-effects)


47

Learning Code Semantics

__handle_vnor:

mov rcx, [rbp]

mov rbx, [rbp + 4]

not rcx

not and · mov

M0 rbx
rcx, rbx [rbp + 4], rcx

pushf

pop [rbp]

jmp __vm_dispatcher

?

?  ¬(0(,m0) 0  m1) -1

(4,3)

?

-8

Handler performing nor (with flag side-effects)


47

Learning Code Semantics

__handle_vnor: mov rcx, [rbp] mov rbx, [rbp + 4] not rcx · not rbx · and rcx, rbx · mov [rbp + 4], rcx pushf pop [rbp] jmp __vm_dispatcher

rbx  ¬ m0 rcx  ¬ (m0  m1) M0  ¬ (m0  m1)

Handler performing nor (with flag side-effects)
47

I/O Sampling
WinDbg

x64dbg

Unicorn

Miasm

angr

<your tool here>

Metasm

48

Instruction Trace: Forced Execution

true

call check cmp eax, 0deadbeef je block_a

false

block_a: ... ...

block_b: ... ...
49

Instruction Trace: Forced Execution

force

call check cmp eax, 0deadbeef je block_a

block_a: ... ...

ignore

49

Instruction Trace: Forced Execution

call check cmp eax, 0deadbeef je block_a

force

ignore

block_b: ... ...

49

Syntia
· program synthesis framework for code deobfuscation · written in Python · random I/O sampling for assembly code · MCTS-based program synthesis
https://github.com/RUB-SysSec/syntia

DEMO

Breaking Virtual Machine Obfuscation

Reminder: Virtual Machine Hardening
Hardening Technique #1 ­ Obfuscating individual VM components. Hardening Technique #2 ­ Duplicating VM handlers. Hardening Technique #3 ­ No central VM dispatcher. Hardening Technique #4 ­ No explicit handler table. Hardening Technique #5 ­ Blinding VM bytecode.
53

#1: Obfuscating Individual VM Components

mov r15, 0x200

mov r15, rdx

add r8, 1

or r14, r14

mov r14, 0x200

add r15, 0x3f

xor r15, 0x800

xor r10d, dword ptr [r12]

or r8, 0x78

mov rax, rbp

add rdx, 0xc0

or r15, 0xffffffff80000000

mov rbx, rbp

sub r15, 0x800

add word ptr [rbx], r10w and rcx, r13

add r11, r14

and rsi, r9

add rbx, 0xc0

or rdx, 0x400

mov r15, rax

add rax, 4

or r15, 0x88

add rax, 0xc0

mov rbx, qword ptr [rbx] mov rsi, 0x200

sub r15, rax

sub r8, -0x80000000

mov rdx, qword ptr [rdx]

add rdi, r14

mov r13, 1

mov r14, rbp

pop r9

add r13, 0xffff

add rdx, 0xa

or rsi, 1

mov rcx, 0

sub rsi, rsi

mov rcx, rbp

and rcx, 0x20

add r11, 0x78

mov rax, qword ptr [rax]

mov r15, rbp

mov rdi, rbp

add rcx, 0xc0

mov r10, rbp

mov r8b, byte ptr [rdx]

and rdi, 0x7fffffff

add r15, 0xc0

mov r8, 0x400

mov rcx, qword ptr [rcx] add r13, r15

cmp r8b, 0

add rax, 2

or rcx, 0x88

sub rsi, r9

add rcx, 8

add r14, r8

je 0x49e

sub rsi, 4

add rbx, 0xb

sub r8, rsi

movzx r10, word ptr [rcx] add r10, 0x89

mov rdx, rbp

or rbx, rsi

mov r15, qword ptr [r15] add r14, 0

mov r9, rbp

xor word ptr [r10], si

or r11, 0x40

movzx rax, word ptr [rax]

or r12, 0xffffffff80000000 add rsi, rax

add r9, 0

xor rdx, r11

and r15, 1

mov r9, rbp

sub rcx, 0x78

and r8, 0x88

xor r10d, dword ptr [r9] mov rsi, rbp

xor r11, 0x10

mov r13, 0x200

movzx r10, word ptr [rbx]

xor rsi, r14

and rdi, 0xffffffff80000000 sub rdx, rbx

add rdx, 0xc0

mov r10, 0x58

xor r12, r13

mov rsi, rbp

sub r13, 0xf0

and rax, 0x40

or r14, 4

add r9, 0

add r12, 0xffff

add rdi, 0xc0

mov rsi, 0

or rbx, 0xf0

mov r15, 0x12

or r10, 0x20

add r15, 0

sub r8, rdi

sub r13, 0x20

add rsi, 0x5a

mov rdx, qword ptr [rdx]

add eax, dword ptr [r9]

mov r8, rbp

add r8, 0x78

mov rbx, rbp

mov r8, rcx

sub r11, r8

xor r10, 0x40

sub rcx, 0x10

add rsi, 4

or r13, 0x88

movzx rsi, word ptr [rsi]

add rdx, 4

add eax, 0x3f505c07

or r12, r12

mov rcx, 0x200

and rcx, 8

mov rax, 0x200

or r11, 0x80

add r15, 0x88

or rcx, 0x800

mov rdi, qword ptr [rdi]

mov r8, 0x58

mov r14, rbp

mov r8w, word ptr [rdx]

mov r12, rbp

movzx r11, word ptr [r15]

add dword ptr [rsi], 0x2549b044 add rbx, 0xc0

and rax, rdx

mov r14, r8

or rdi, 0x90

xor rcx, 0x800

xor rcx, 0xf0

mov rbx, qword ptr [rbx] and rcx, 0x20

add r8, rbp

add r12, 0

mov r12, r15

add rcx, r10

sub rcx, 0x20

add r14, 0x89

xor r13, 4

or rbx, 0x80

add r8, 0

add rdi, 6

add rdi, 0x80

or rax, 0x40

pop r10

add rdi, 0xf0

xor r12, 0xf0

mov r8, 0x400

sub r13, 0x10

xor si, 0x7a28

mov qword ptr [r8], r10

mov r13, 0x400

mov rbx, 0x58

mov ax, word ptr [rdi]

add rbx, 8

add rdx, 0x78

jmp 0x4ae

add dword ptr [r12], eax

add r11, rbp

mov r8, 1

mov si, word ptr [rbx]

add rdx, 0x20

xor rsi, 0x88

and rsi, r8

xor rbx, 0x800

mov rsi, rbp

or r9, 0xffff

movzx r14, word ptr [r14]

xor rbx, 0xffffffff80000000 or

r10, 8

and r12, 0x20

and rcx, 8

sub r9, 1

mov rcx, 0x58

add rsi, 0x78

and rbx, 0x20

add rbx, 0x800

sub rcx, 1

mov r9, rbp

add rsi, rbp

mov r10b, 0x68

and rax, 0xffff

mov r11, qword ptr [r11] mov rcx, rdi

mov r12, 0x58

xor rax, rdx

mov r9, 0x12

mov r11, 0

add rbx, 1

add rsi, 0x29

add r9, 0

add r8, 0x80

or rbx, r10

add r13, r8

and r12, r9

or rcx, 8

sub r13, 0x80

mov r15, rsi

and r15, 0x78

or rbx, 1

mov rdx, 1

mov r8, rsi

mov r15, r13

add r14, rbp

mov r14, rbp

shl rax, 3

xor r10d, dword ptr [r8] add rcx, 4

or rcx, r12

add r8, r15

or r9, 8

add r8, rax

sub r9, r11

mov r13b, byte ptr [rsi]

xor esi, dword ptr [r9] mov rbx, 0

add r14, 0x29

or rbx, r15

pushfq

cmp r13b, 0xd2

mov r10, rbp

and rdx, 0x10

xor rbx, rdi

sub r15, 0x10

xor rbx, 0xf0

jbe 0x204

add r10, 0xcc

mov r14, qword ptr [r14] and r15, 0x3f

or r11, r13

xor rbx, 0x800

and r8, r13

sub r15, 0x20

add qword ptr [rsi], r14 or byte ptr [r14], r10b

mov rbx, qword ptr [r8]

and rdx, r8

or rcx, r13

xor esi, dword ptr [r10] pushfq

mov rax, 0x58

mov rdx, rbp

mov r12, rbp

or rcx, 4

xor r13, 0x90

xor r11, r14

mov r8, rbp

sub r13, 0x80

xor rdx, 0x20

mov rbx, rbp

add rdi, 0x10

add r15, r14

sub rsi, 0x78

add rdx, 0xc0

sub rbx, 4

or rcx, 4

mov r14, rsi

mov r13, 0x12

add r8, 0x127

add qword ptr [rdx], 0xd

add r11, 0x2549b044

sub rcx, 0x400

mov rdx, rbp

mov r8, 0

mov rdi, rbx

jmp rbx

or rbx, 0x78

add rax, rbp

add rdx, 0

and r14, 0x88

xor rbx, 0x3f

and rdx, r10

or rcx, 0x80

add dword ptr [rdx], esi and r13, 0x40

mov r8, qword ptr [r8]

mov rax, 0

add rcx, 0x80

xor r12, 1

add r13, 1

xor rsi, 1

add r12, 0x42

add rbx, 0x5a

mov r13, r15

mov rdx, rbp

mov rax, rbp

54

#1: Obfuscating Individual VM Components

mov r15, 0x200

mov

xor r15, 0x800

xor

mov rbx, rbp

sub

add rbx, 0xc0

or

mov rbx, qword ptr [rbx] mov

mov r13, 1

mov

mov rcx, 0

sub

mov r15, rbp

mov

add r15, 0xc0

mov

or rcx, 0x88

sub

add rbx, 0xb

sub

mov r15, qword ptr [r15] add

or r12, 0xffffffff80000000 add

sub rcx, 0x78

and

movzx r10, word ptr [rbx]

xor

xor r12, r13

mov

add r12, 0xffff

add

add r15, 0

sub

mov r8, rbp

add

sub rcx, 0x10

add

or r12, r12

mov

or rcx, 0x800

mov

movzx r11, word ptr [r15]

add

xor rcx, 0x800

xor

mov r12, r15

add

add r8, 0

add

xor r12, 0xf0

mov

mov rbx, 0x58

mov

add r11, rbp

mov

xor rbx, 0x800

mov

and r12, 0x20

and

add rbx, 0x800

sub

mov r11, qword ptr [r11] mov

add rbx, 1

add

and r12, r9

or

mov rdx, 1

mov

xor r10d, dword ptr [r8] add

sub r9, r11

mov

pushfq

cmp

xor rbx, 0xf0

jbe

xor rbx, 0x800

and

and rdx, r8

or

mov r12, rbp

or

xor rdx, 0x20

mov

sub rbx, 4

or

add r11, 0x2549b044

sub

or rbx, 0x78

add

and rdx, r10

or

mov rax, 0

add

add r12, 0x42

add

r15, rdx

add r8, 1

or r14, r14

mov r14, 0x200

r10d, dword ptr [r12]

or r8, 0x78

mov rax, rbp

add rdx, 0xc0

r15, 0x800

add word ptr [rbx], r10w and rcx, r13

add r11, r14

rdx, 0x400

mov r15, rax

add rax, 4

or r15, 0x88

rsi, 0x200

sub r15, rax

sub r8, -0x80000000

mov rdx, qword ptr [rdx]

r14, rbp

pop r9

add r13, 0xffff

add rdx, 0xa

rsi, rsi

mov rcx, rbp

and rcx, 0x20

add r11, 0x78

rdi, rbp

add rcx, 0xc0

mov r10, rbp

mov r8b, byte ptr [rdx]

r8, 0x400

mov rcx, qword ptr [rcx] add r13, r15

cmp r8b, 0

rsi, r9

add rcx, 8

add r14, r8

je 0x49e

r8, rsi

movzx r10, word ptr [rcx] add r10, 0x89

mov rdx, rbp

r14, 0

mov r9, rbp

xor word ptr [r10], si

or r11, 0x40

rsi, rax

add r9, 0

xor rdx, r11

and r15, 1

r8, 0x88

xor r10d, dword ptr [r9] mov rsi, rbp

xor r11, 0x10

rsi, r14

and rdi, 0xffffffff80000000 sub rdx, rbx

add rdx, 0xc0

rsi, rbp

sub r13, 0xf0

and rax, 0x40

or r14, 4

rdi, 0xc0

mov rsi, 0

or rbx, 0xf0

mov r15, 0x12

r8, rdi

sub r13, 0x20

add rsi, 0x5a

mov rdx, qword ptr [rdx]

r8, 0x78

mov rbx, rbp

mov r8, rcx

sub r11, r8

rsi, 4

or r13, 0x88

movzx rsi, word ptr [rsi]

add rdx, 4

u64 res = rcx, 0x200

and

rdi, qword ptr [rdi]

mov

dword ptr [rsi], 0x2549b044 add

rcx, 0xf0

mov

rcx, r10

sub

rdi, 6

add

rcx, 8 r8, 0x58 rbx, 0xc0 rbx, qword ptr [rbx] rcx, 0x20 rdi, 0x80

r8, 0x400

sub r13, 0x10

ax, word ptr [rdi]

add rbx, 8

M13 mov rax, 0x200
mov r14, rbp and rax, rdx and rcx, 0x20 add r14, 0x89 or rax, 0x40 xor si, 0x7a28 add rdx, 0x78

+ M14 or r11, 0x80 mov r8w, word ptr [rdx] mov r14, r8 add r8, rbp xor r13, 4 pop r10 mov qword ptr [r8], r10 jmp 0x4ae

r8, 1

mov si, word ptr [rbx]

add rdx, 0x20

xor rsi, 0x88

rsi, rbp

or r9, 0xffff

movzx r14, word ptr [r14]

xor rbx, 0xffffffff80000000

rcx, 8

sub r9, 1

mov rcx, 0x58

add rsi, 0x78

rcx, 1

mov r9, rbp

add rsi, rbp

mov r10b, 0x68

rcx, rdi

mov r12, 0x58

xor rax, rdx

mov r9, 0x12

rsi, 0x29

add r9, 0

add r8, 0x80

or rbx, r10

rcx, 8

sub r13, 0x80

mov r15, rsi

and r15, 0x78

r8, rsi

mov r15, r13

add r14, rbp

mov r14, rbp

rcx, 4

or rcx, r12

add r8, r15

or r9, 8

r13b, byte ptr [rsi]

xor esi, dword ptr [r9] mov rbx, 0

add r14, 0x29

r13b, 0xd2

mov r10, rbp

and rdx, 0x10

xor rbx, rdi

0x204

add r10, 0xcc

mov r14, qword ptr [r14] and r15, 0x3f

r8, r13

sub r15, 0x20

add qword ptr [rsi], r14 or byte ptr [r14], r10b

rcx, r13

xor esi, dword ptr [r10] pushfq

mov rax, 0x58

rcx, 4

xor r13, 0x90

xor r11, r14

mov r8, rbp

rbx, rbp

add rdi, 0x10

add r15, r14

sub rsi, 0x78

rcx, 4

mov r14, rsi

mov r13, 0x12

add r8, 0x127

rcx, 0x400

mov rdx, rbp

mov r8, 0

mov rdi, rbx

rax, rbp

add rdx, 0

and r14, 0x88

xor rbx, 0x3f

rcx, 0x80

add dword ptr [rdx], esi and r13, 0x40

mov r8, qword ptr [r8]

rcx, 0x80

xor r12, 1

add r13, 1

xor rsi, 1

rbx, 0x5a

mov r13, r15

mov rdx, rbp

mov rax, rbp

add or and add add or mov and add sub or movzx mov mov mov add or add xor add add mov or add or add mov add and or and and mov add or shl add or sub or mov mov sub add add jmp

r15, 0x3f r15, 0xffffffff80000000 rsi, r9 rax, 0xc0 rdi, r14 rsi, 1 rax, qword ptr [rax] rdi, 0x7fffffff rax, 2 rsi, 4 rbx, rsi rax, word ptr [rax] r9, rbp r13, 0x200 r10, 0x58 r9, 0 r10, 0x20 eax, dword ptr [r9] r10, 0x40 eax, 0x3f505c07 r15, 0x88 r12, rbp rdi, 0x90 r12, 0 rbx, 0x80 rdi, 0xf0 r13, 0x400 dword ptr [r12], eax rsi, r8 r10, 8 rbx, 0x20 rax, 0xffff r11, 0 r13, r8 rbx, 1 rax, 3 r8, rax rbx, r15 r15, 0x10 r11, r13 rbx, qword ptr [r8] rdx, rbp r13, 0x80 rdx, 0xc0 qword ptr [rdx], 0xd rbx

54

#2: Duplicating VM Handlers
handle?_vpush handle?_vadd handle?_vxor handle?_vexit handle?_vpop
? ? ? ?
...
55

#2: Duplicating VM Handlers
handle?_vpush hanvdml_ea_ddv6a4dd hanvdml_ex_orv3x2or handle?_vexit hanvdml_es_ubv1p6op
vm_shl16 vm_add8
? vm_add64
...
55

#2: Duplicating VM Handlers
handle?_vpush hanvdml_ea_ddv6a4dd hanvdml_ex_orv3x2or handle?_vexit hanvdml_es_ubv1p6op
vm_shl16 vm_add8
? vm_add64
...
55

#5: Blinding VM Bytecode

mov r15, 0x200

mov r15, rdx

add r8, 1

or r14, r14

mov r14, 0x200

add r15, 0x3f

xor r15, 0x800

xor r10d, dword ptr [r12]

or r8, 0x78

mov rax, rbp

add rdx, 0xc0

or r15, 0xffffffff80000000

mov rbx, rbp

sub r15, 0x800

add word ptr [rbx], r10w and rcx, r13

add r11, r14

and rsi, r9

add rbx, 0xc0

or rdx, 0x400

mov r15, rax

add rax, 4

or r15, 0x88

add rax, 0xc0

mov rbx, qword ptr [rbx] mov rsi, 0x200

sub r15, rax

sub r8, -0x80000000

mov rdx, qword ptr [rdx]

add rdi, r14

mov r13, 1

mov r14, rbp

pop r9

add r13, 0xffff

add rdx, 0xa

or rsi, 1

mov rcx, 0

sub rsi, rsi

mov rcx, rbp

and rcx, 0x20

add r11, 0x78

mov rax, qword ptr [rax]

mov r15, rbp

mov rdi, rbp

add rcx, 0xc0

mov r10, rbp

mov r8b, byte ptr [rdx]

and rdi, 0x7fffffff

add r15, 0xc0

mov r8, 0x400

mov rcx, qword ptr [rcx] add r13, r15

cmp r8b, 0

add rax, 2

or rcx, 0x88

sub rsi, r9

add rcx, 8

add r14, r8

je 0x49e

sub rsi, 4

add rbx, 0xb

sub r8, rsi

movzx r10, word ptr [rcx] add r10, 0x89

mov rdx, rbp

or rbx, rsi

mov r15, qword ptr [r15] add r14, 0

mov r9, rbp

xor word ptr [r10], si

or r11, 0x40

movzx rax, word ptr [rax]

or r12, 0xffffffff80000000 add rsi, rax

add r9, 0

xor rdx, r11

and r15, 1

mov r9, rbp

sub rcx, 0x78

and r8, 0x88

xor r10d, dword ptr [r9] mov rsi, rbp

xor r11, 0x10

mov r13, 0x200

movzx r10, word ptr [rbx]

xor rsi, r14

and rdi, 0xffffffff80000000 sub rdx, rbx

add rdx, 0xc0

mov r10, 0x58

xor r12, r13

mov rsi, rbp

sub r13, 0xf0

and rax, 0x40

or r14, 4

add r9, 0

add r12, 0xffff

add rdi, 0xc0

mov rsi, 0

or rbx, 0xf0

mov r15, 0x12

or r10, 0x20

add r15, 0

sub r8, rdi

sub r13, 0x20

add rsi, 0x5a

mov rdx, qword ptr [rdx]

add eax, dword ptr [r9]

mov r8, rbp

add r8, 0x78

mov rbx, rbp

mov r8, rcx

sub r11, r8

xor r10, 0x40

sub rcx, 0x10

add rsi, 4

or r13, 0x88

movzx rsi, word ptr [rsi]

add rdx, 4

add eax, 0x3f505c07

or r12, r12

mov rcx, 0x200

and rcx, 8

mov rax, 0x200

or r11, 0x80

add r15, 0x88

or rcx, 0x800

mov rdi, qword ptr [rdi]

mov r8, 0x58

mov r14, rbp

mov r8w, word ptr [rdx]

mov r12, rbp

movzx r11, word ptr [r15]

add dword ptr [rsi], 0x2549b044 add rbx, 0xc0

and rax, rdx

mov r14, r8

or rdi, 0x90

xor rcx, 0x800

xor rcx, 0xf0

mov rbx, qword ptr [rbx] and rcx, 0x20

add r8, rbp

add r12, 0

mov r12, r15

add rcx, r10

sub rcx, 0x20

add r14, 0x89

xor r13, 4

or rbx, 0x80

add r8, 0

add rdi, 6

add rdi, 0x80

or rax, 0x40

pop r10

add rdi, 0xf0

xor r12, 0xf0

mov r8, 0x400

sub r13, 0x10

xor si, 0x7a28

mov qword ptr [r8], r10

mov r13, 0x400

mov rbx, 0x58

mov ax, word ptr [rdi]

add rbx, 8

add rdx, 0x78

jmp 0x4ae

add dword ptr [r12], eax

add r11, rbp

mov r8, 1

mov si, word ptr [rbx]

add rdx, 0x20

xor rsi, 0x88

and rsi, r8

xor rbx, 0x800

mov rsi, rbp

or r9, 0xffff

movzx r14, word ptr [r14]

xor rbx, 0xffffffff80000000 or

r10, 8

and r12, 0x20

and rcx, 8

sub r9, 1

mov rcx, 0x58

add rsi, 0x78

and rbx, 0x20

add rbx, 0x800

sub rcx, 1

mov r9, rbp

add rsi, rbp

mov r10b, 0x68

and rax, 0xffff

mov r11, qword ptr [r11] mov rcx, rdi

mov r12, 0x58

xor rax, rdx

mov r9, 0x12

mov r11, 0

add rbx, 1

add rsi, 0x29

add r9, 0

add r8, 0x80

or rbx, r10

add r13, r8

and r12, r9

or rcx, 8

sub r13, 0x80

mov r15, rsi

and r15, 0x78

or rbx, 1

mov rdx, 1

mov r8, rsi

mov r15, r13

add r14, rbp

mov r14, rbp

shl rax, 3

xor r10d, dword ptr [r8] add rcx, 4

or rcx, r12

add r8, r15

or r9, 8

add r8, rax

sub r9, r11

mov r13b, byte ptr [rsi]

xor esi, dword ptr [r9] mov rbx, 0

add r14, 0x29

or rbx, r15

pushfq

cmp r13b, 0xd2

mov r10, rbp

and rdx, 0x10

xor rbx, rdi

sub r15, 0x10

xor rbx, 0xf0

jbe 0x204

add r10, 0xcc

mov r14, qword ptr [r14] and r15, 0x3f

or r11, r13

xor rbx, 0x800

and r8, r13

sub r15, 0x20

add qword ptr [rsi], r14 or byte ptr [r14], r10b

mov rbx, qword ptr [r8]

and rdx, r8

or rcx, r13

xor esi, dword ptr [r10] pushfq

mov rax, 0x58

mov rdx, rbp

mov r12, rbp

or rcx, 4

xor r13, 0x90

xor r11, r14

mov r8, rbp

sub r13, 0x80

xor rdx, 0x20

mov rbx, rbp

add rdi, 0x10

add r15, r14

sub rsi, 0x78

add rdx, 0xc0

sub rbx, 4

or rcx, 4

mov r14, rsi

mov r13, 0x12

add r8, 0x127

add qword ptr [rdx], 0xd

add r11, 0x2549b044

sub rcx, 0x400

mov rdx, rbp

mov r8, 0

mov rdi, rbx

jmp rbx

or rbx, 0x78

add rax, rbp

add rdx, 0

and r14, 0x88

xor rbx, 0x3f

and rdx, r10

or rcx, 0x80

add dword ptr [rdx], esi and r13, 0x40

mov r8, qword ptr [r8]

mov rax, 0

add rcx, 0x80

xor r12, 1

add r13, 1

xor rsi, 1

add r12, 0x42

add rbx, 0x5a

mov r13, r15

mov rdx, rbp

mov rax, rbp

56

#5: Blinding VM Bytecode

mov r15, 0x200

mov r15, rdx

add r8, 1

or r14, r14

mov r14, 0x200

add r15, 0x3f

xor r15, 0x800

xor r10d, dword ptr [r12]

or r8, 0x78

mov rax, rbp

add rdx, 0xc0

or r15, 0xffffffff80000000

mov rbx, rbp

sub r15, 0x800

add word ptr [rbx], r10w and rcx, r13

add r11, r14

and rsi, r9

add rbx, 0xc0

or rdx, 0x400

mov r15, rax

add rax, 4

or r15, 0x88

add rax, 0xc0

mov rbx, qword ptr [rbx] mov rsi, 0x200

sub r15, rax

sub r8, -0x80000000

mov rdx, qword ptr [rdx]

add rdi, r14

mov r13, 1

mov r14, rbp

pop r9

add r13, 0xffff

add rdx, 0xa

or rsi, 1

mov rcx, 0

sub rsi, rsi

mov rcx, rbp

and rcx, 0x20

add r11, 0x78

mov rax, qword ptr [rax]

mov r15, rbp add r15, 0xc0 or rcx, 0x88

mov rdi, rbp mov r8, 0x400 sub rsi, r9

mov r9, rbp add rcx, 0xc0 mov rcx, qword ptr [rcx] add rcx, 8

mov add add

r10, rbp r13, r15 r14, r8

mov r8b, byte ptr [rdx] cmp r8b, 0 je 0x49e

and rdi, 0x7fffffff add rax, 2 sub rsi, 4

add rbx, 0xb mov r15, qword ptr [r15]

sub r8, rsi add r14, 0

...movzx r10, word ptr [rcx] mov r9, rbp

add r10, 0x89 xor word ptr [r10], si

mov rdx, rbp or r11, 0x40

or rbx, rsi movzx rax, word ptr [rax]

or r12, 0xffffffff80000000 add rsi, rax

sub rcx, 0x78

and r8, 0x88

add r9, 0 add r9, 0

xor rdx, r11

xor r10d, dword ptr [r9] mov rsi, rbp

and r15, 1 xor r11, 0x10

mov r9, rbp mov r13, 0x200

movzx r10, word ptr [rbx] xor r12, r13

xor rsi, r14 mov rsi, rbp

...and rdi, 0xffffffff80000000 sub rdx, rbx

sub r13, 0xf0

and rax, 0x40

add rdx, 0xc0 or r14, 4

mov r10, 0x58 add r9, 0

add r12, 0xffff add r15, 0

add rdi, 0xc0 sub r8, rdi

amsdouvbd

eax, rsi, 0
r13, 0x20

dword

ptr [r9] or rbx, 0xf0
add rsi, 0x5a

mov r15, 0x12 mov rdx, qword ptr [rdx]

or r10, 0x20 add eax, dword ptr [r9]

mov r8, rbp sub rcx, 0x10

add r8, 0x78 add rsi, 4

...mov rbx, rbp or r13, 0x88

mov r8, rcx movzx rsi, word ptr [rsi]

sub r11, r8 add rdx, 4

xor r10, 0x40 add eax, 0x3f505c07

or r12, r12 or rcx, 0x800

mov rcx, 0x200 mov rdi, qword ptr [rdi]

aamdnodvd

eax, rcx, 8
r8, 0x58

0x3f50mm5oovvc07rra1x4,,

0x200 rbp

or r11, 0x80 mov r8w, word ptr [rdx]

add r15, 0x88 mov r12, rbp

movzx r11, word ptr [r15] xor rcx, 0x800

... add dword ptr [rsi], 0x2549b044 add rbx, 0xc0

and rax, rdx

xor rcx, 0xf0

mov rbx, qword ptr [rbx] and rcx, 0x20

mov r14, r8 add r8, rbp

or rdi, 0x90 add r12, 0

mov r12, r15 add r8, 0

add rcx, r10 add rdi, 6

mov r12, rbp sub rcx, 0x20 add rdi, 0x80

add r14, 0x89 or rax, 0x40

xor r13, 4 pop r10

or rbx, 0x80 add rdi, 0xf0

xor r12, 0xf0 mov rbx, 0x58

mov r8, 0x400 mov ax, word ptr [rdi]

...sub r13, 0x10 add rbx, 8

xor si, 0x7a28 add rdx, 0x78

mov qword ptr [r8], r10 jmp 0x4ae

mov r13, 0x400 add dword ptr [r12], eax

add r11, rbp xor rbx, 0x800

mov r8, 1 mov rsi, rbp

add r12, 0 mov si, word ptr [rbx] or r9, 0xffff

add rdx, 0x20 movzx r14, word ptr [r14]

xor rsi, 0x88

and rsi, r8

xor rbx, 0xffffffff80000000 or r10, 8

and r12, 0x20 add rbx, 0x800

and rcx, 8 sub rcx, 1

asmduobvd

r9, r9,

1rdbpword

ptr

[marodvd12]rr,csxi,, e0rxba5px8

add rsi, 0x78 mov r10b, 0x68

and rbx, 0x20 and rax, 0xffff

mov r11, qword ptr [r11] mov rcx, rdi

mov r12, 0x58

xor rax, rdx

mov r9, 0x12

mov r11, 0

add rbx, 1

add rsi, 0x29

add r9, 0

add r8, 0x80

or rbx, r10

add r13, r8

and r12, r9

or rcx, 8

sub r13, 0x80

mov r15, rsi

and r15, 0x78

or rbx, 1

mov rdx, 1

mov r8, rsi

mov r15, r13

add r14, rbp

mov r14, rbp

shl rax, 3

xor r10d, dword ptr [r8] add rcx, 4

or rcx, r12

add r8, r15

or r9, 8

add r8, rax

sub r9, r11

mov r13b, byte ptr [rsi]

xor esi, dword ptr [r9] mov rbx, 0

add r14, 0x29

or rbx, r15

pushfq

cmp r13b, 0xd2

mov r10, rbp

and rdx, 0x10

xor rbx, rdi

sub r15, 0x10

xor rbx, 0xf0

jbe 0x204

add r10, 0xcc

mov r14, qword ptr [r14] and r15, 0x3f

or r11, r13

xor rbx, 0x800

and r8, r13

sub r15, 0x20

add qword ptr [rsi], r14 or byte ptr [r14], r10b

mov rbx, qword ptr [r8]

and rdx, r8

or rcx, r13

xor esi, dword ptr [r10] pushfq

mov rax, 0x58

mov rdx, rbp

mov r12, rbp

or rcx, 4

xor r13, 0x90

xor r11, r14

mov r8, rbp

sub r13, 0x80

xor rdx, 0x20

mov rbx, rbp

add rdi, 0x10

add r15, r14

sub rsi, 0x78

add rdx, 0xc0

sub rbx, 4

or rcx, 4

mov r14, rsi

mov r13, 0x12

add r8, 0x127

add qword ptr [rdx], 0xd

add r11, 0x2549b044

sub rcx, 0x400

mov rdx, rbp

mov r8, 0

mov rdi, rbx

jmp rbx

or rbx, 0x78

add rax, rbp

add rdx, 0

and r14, 0x88

xor rbx, 0x3f

and rdx, r10

or rcx, 0x80

add dword ptr [rdx], esi and r13, 0x40

mov r8, qword ptr [r8]

mov rax, 0

add rcx, 0x80

xor r12, 1

add r13, 1

xor rsi, 1

add r12, 0x42

add rbx, 0x5a

mov r13, r15

mov rdx, rbp

mov rax, rbp

56

#5: Blinding VM Bytecode

mov r15, 0x200

mov r15, rdx

add r8, 1

or r14, r14

mov r14, 0x200

add r15, 0x3f

xor r15, 0x800

xor r10d, dword ptr [r12]

or r8, 0x78

mov rax, rbp

add rdx, 0xc0

or r15, 0xffffffff80000000

mov rbx, rbp

sub r15, 0x800

add word ptr [rbx], r10w and rcx, r13

add r11, r14

and rsi, r9

add rbx, 0xc0

or rdx, 0x400

mov r15, rax

add rax, 4

or r15, 0x88

add rax, 0xc0

mov rbx, qword ptr [rbx] mov rsi, 0x200

sub r15, rax

sub r8, -0x80000000

mov rdx, qword ptr [rdx]

add rdi, r14

mov r13, 1

mov r14, rbp

pop r9

add r13, 0xffff

add rdx, 0xa

or rsi, 1

mov rcx, 0

sub rsi, rsi

mov rcx, rbp

and rcx, 0x20

add r11, 0x78

mov rax, qword ptr [rax]

mov r15, rbp add r15, 0xc0 or rcx, 0x88

mov rdi, rbp mov r8, 0x400 sub rsi, r9

mov r9, rbp add rcx, 0xc0 mov rcx, qword ptr [rcx] add rcx, 8

mov add add

r10, rbp r13, r15 r14, r8

mov r8b, byte ptr [rdx] cmp r8b, 0 je 0x49e

and rdi, 0x7fffffff add rax, 2 sub rsi, 4

add rbx, 0xb mov r15, qword ptr [r15]

sub r8, rsi add r14, 0

...movzx r10, word ptr [rcx] mov r9, rbp

add r10, 0x89 xor word ptr [r10], si

mov rdx, rbp or r11, 0x40

or rbx, rsi movzx rax, word ptr [rax]

or r12, 0xffffffff80000000 add rsi, rax

sub rcx, 0x78

and r8, 0x88

add r9, 0 add r9, 0

xor rdx, r11

xor r10d, dword ptr [r9] mov rsi, rbp

and r15, 1 xor r11, 0x10

mov r9, rbp mov r13, 0x200

movzx r10, word ptr [rbx] xor r12, r13

xor rsi, r14 mov rsi, rbp

...and rdi, 0xffffffff80000000 sub rdx, rbx

sub r13, 0xf0

and rax, 0x40

add rdx, 0xc0 or r14, 4

mov r10, 0x58 add r9, 0

add r12, 0xffff add r15, 0

add rdi, 0xc0 sub r8, rdi

amsdouvbd

eax, rsi, 0
r13, 0x20

dword

ptr [r9] or rbx, 0xf0
add rsi, 0x5a

mov r15, 0x12 mov rdx, qword ptr [rdx]

or r10, 0x20 add eax, dword ptr [r9]

mov r8, rbp sub rcx, 0x10

add r8, 0x78 add rsi, 4

...mov rbx, rbp or r13, 0x88

mov r8, rcx movzx rsi, word ptr [rsi]

sub r11, r8 add rdx, 4

xor r10, 0x40 add eax, 0x3f505c07

or r12, r12 or rcx, 0x800

mov rcx, 0x200 mov rdi, qword ptr [rdi]

aamdnodvd

eax, rcx, 8
r8, 0x58

0x3f50mm5oovvc07rra1x4,,

0x200 rbp

or r11, 0x80 mov r8w, word ptr [rdx]

add r15, 0x88 mov r12, rbp

No influence on underlying code's semantics movzx
xor mov add xor mov

r11, word ptr [r15] rcx, 0x800 r12, r15 r8, 0 r12, 0xf0 rbx, 0x58

... add dword ptr [rsi], 0x2549b044 add rbx, 0xc0

and rax, rdx

xor rcx, 0xf0

mov rbx, qword ptr [rbx] and rcx, 0x20

add rcx, r10 add rdi, 6

mov r12, rbp sub rcx, 0x20 add rdi, 0x80

add r14, 0x89 or rax, 0x40

mov r8, 0x400 mov ax, word ptr [rdi]

...sub r13, 0x10 add rbx, 8

xor si, 0x7a28 add rdx, 0x78

mov r14, r8 add r8, rbp xor r13, 4 pop r10 mov qword ptr [r8], r10 jmp 0x4ae

or rdi, 0x90 add r12, 0 or rbx, 0x80 add rdi, 0xf0 mov r13, 0x400 add dword ptr [r12], eax

add r11, rbp xor rbx, 0x800

mov r8, 1 mov rsi, rbp

add r12, 0 mov si, word ptr [rbx] or r9, 0xffff

add rdx, 0x20 movzx r14, word ptr [r14]

xor rsi, 0x88

and rsi, r8

xor rbx, 0xffffffff80000000 or r10, 8

and r12, 0x20 add rbx, 0x800

and rcx, 8 sub rcx, 1

asmduobvd

r9, r9,

1rdbpword

ptr

[marodvd12]rr,csxi,, e0rxba5px8

add rsi, 0x78 mov r10b, 0x68

and rbx, 0x20 and rax, 0xffff

mov r11, qword ptr [r11] mov rcx, rdi

mov r12, 0x58

xor rax, rdx

mov r9, 0x12

mov r11, 0

add rbx, 1

add rsi, 0x29

add r9, 0

add r8, 0x80

or rbx, r10

add r13, r8

and r12, r9

or rcx, 8

sub r13, 0x80

mov r15, rsi

and r15, 0x78

or rbx, 1

mov rdx, 1

mov r8, rsi

mov r15, r13

add r14, rbp

mov r14, rbp

shl rax, 3

xor r10d, dword ptr [r8] add rcx, 4

or rcx, r12

add r8, r15

or r9, 8

add r8, rax

sub r9, r11

mov r13b, byte ptr [rsi]

xor esi, dword ptr [r9] mov rbx, 0

add r14, 0x29

or rbx, r15

pushfq

cmp r13b, 0xd2

mov r10, rbp

and rdx, 0x10

xor rbx, rdi

sub r15, 0x10

xor rbx, 0xf0

jbe 0x204

add r10, 0xcc

mov r14, qword ptr [r14] and r15, 0x3f

or r11, r13

xor rbx, 0x800

and r8, r13

sub r15, 0x20

add qword ptr [rsi], r14 or byte ptr [r14], r10b

mov rbx, qword ptr [r8]

and rdx, r8

or rcx, r13

xor esi, dword ptr [r10] pushfq

mov rax, 0x58

mov rdx, rbp

mov r12, rbp

or rcx, 4

xor r13, 0x90

xor r11, r14

mov r8, rbp

sub r13, 0x80

xor rdx, 0x20

mov rbx, rbp

add rdi, 0x10

add r15, r14

sub rsi, 0x78

add rdx, 0xc0

sub rbx, 4

or rcx, 4

mov r14, rsi

mov r13, 0x12

add r8, 0x127

add qword ptr [rdx], 0xd

add r11, 0x2549b044

sub rcx, 0x400

mov rdx, rbp

mov r8, 0

mov rdi, rbx

jmp rbx

or rbx, 0x78

add rax, rbp

add rdx, 0

and r14, 0x88

xor rbx, 0x3f

and rdx, r10

or rcx, 0x80

add dword ptr [rdx], esi and r13, 0x40

mov r8, qword ptr [r8]

mov rax, 0

add rcx, 0x80

xor r12, 1

add r13, 1

xor rsi, 1

add r12, 0x42

add rbx, 0x5a

mov r13, r15

mov rdx, rbp

mov rax, rbp

56

#3: No Central VM Dispatcher

mov r15, 0x200

mov r15, rdx

add r8, 1

or r14, r14

mov r14, 0x200

add r15, 0x3f

xor r15, 0x800

xor r10d, dword ptr [r12]

or r8, 0x78

mov rax, rbp

add rdx, 0xc0

or r15, 0xffffffff80000000

mov rbx, rbp

sub r15, 0x800

add word ptr [rbx], r10w and rcx, r13

add r11, r14

and rsi, r9

add rbx, 0xc0

or rdx, 0x400

mov r15, rax

add rax, 4

or r15, 0x88

add rax, 0xc0

mov rbx, qword ptr [rbx] mov rsi, 0x200

sub r15, rax

sub r8, -0x80000000

mov rdx, qword ptr [rdx]

add rdi, r14

mov r13, 1

mov r14, rbp

pop r9

add r13, 0xffff

add rdx, 0xa

or rsi, 1

mov rcx, 0

sub rsi, rsi

mov rcx, rbp

and rcx, 0x20

add r11, 0x78

mov rax, qword ptr [rax]

mov r15, rbp

mov rdi, rbp

add rcx, 0xc0

mov r10, rbp

mov r8b, byte ptr [rdx]

and rdi, 0x7fffffff

add r15, 0xc0

mov r8, 0x400

mov rcx, qword ptr [rcx] add r13, r15

cmp r8b, 0

add rax, 2

or rcx, 0x88

sub rsi, r9

add rcx, 8

add r14, r8

je 0x49e

sub rsi, 4

add rbx, 0xb

sub r8, rsi

movzx r10, word ptr [rcx] add r10, 0x89

mov rdx, rbp

or rbx, rsi

mov r15, qword ptr [r15] add r14, 0

mov r9, rbp

xor word ptr [r10], si

or r11, 0x40

movzx rax, word ptr [rax]

or r12, 0xffffffff80000000 add rsi, rax

add r9, 0

xor rdx, r11

and r15, 1

mov r9, rbp

sub rcx, 0x78

and r8, 0x88

xor r10d, dword ptr [r9] mov rsi, rbp

xor r11, 0x10

mov r13, 0x200

movzx r10, word ptr [rbx]

xor rsi, r14

and rdi, 0xffffffff80000000 sub rdx, rbx

add rdx, 0xc0

mov r10, 0x58

xor r12, r13

mov rsi, rbp

sub r13, 0xf0

and rax, 0x40

or r14, 4

add r9, 0

add r12, 0xffff

add rdi, 0xc0

mov rsi, 0

or rbx, 0xf0

mov r15, 0x12

or r10, 0x20

add r15, 0

sub r8, rdi

sub r13, 0x20

add rsi, 0x5a

mov rdx, qword ptr [rdx]

add eax, dword ptr [r9]

mov r8, rbp

add r8, 0x78

mov rbx, rbp

mov r8, rcx

sub r11, r8

xor r10, 0x40

sub rcx, 0x10

add rsi, 4

or r13, 0x88

movzx rsi, word ptr [rsi]

add rdx, 4

add eax, 0x3f505c07

or r12, r12

mov rcx, 0x200

and rcx, 8

mov rax, 0x200

or r11, 0x80

add r15, 0x88

or rcx, 0x800

mov rdi, qword ptr [rdi]

mov r8, 0x58

mov r14, rbp

mov r8w, word ptr [rdx]

mov r12, rbp

movzx r11, word ptr [r15]

add dword ptr [rsi], 0x2549b044 add rbx, 0xc0

and rax, rdx

mov r14, r8

or rdi, 0x90

xor rcx, 0x800

xor rcx, 0xf0

mov rbx, qword ptr [rbx] and rcx, 0x20

add r8, rbp

add r12, 0

mov r12, r15

add rcx, r10

sub rcx, 0x20

add r14, 0x89

xor r13, 4

or rbx, 0x80

add r8, 0

add rdi, 6

add rdi, 0x80

or rax, 0x40

pop r10

add rdi, 0xf0

xor r12, 0xf0

mov r8, 0x400

sub r13, 0x10

xor si, 0x7a28

mov qword ptr [r8], r10

mov r13, 0x400

mov rbx, 0x58

mov ax, word ptr [rdi]

add rbx, 8

add rdx, 0x78

jmp 0x4ae

add dword ptr [r12], eax

add r11, rbp

mov r8, 1

mov si, word ptr [rbx]

add rdx, 0x20

xor rsi, 0x88

and rsi, r8

xor rbx, 0x800

mov rsi, rbp

or r9, 0xffff

movzx r14, word ptr [r14]

xor rbx, 0xffffffff80000000 or

r10, 8

and r12, 0x20

and rcx, 8

sub r9, 1

mov rcx, 0x58

add rsi, 0x78

and rbx, 0x20

add rbx, 0x800

sub rcx, 1

mov r9, rbp

add rsi, rbp

mov r10b, 0x68

and rax, 0xffff

mov r11, qword ptr [r11] mov rcx, rdi

mov r12, 0x58

xor rax, rdx

mov r9, 0x12

mov r11, 0

add rbx, 1

add rsi, 0x29

add r9, 0

add r8, 0x80

or rbx, r10

add r13, r8

and r12, r9

or rcx, 8

sub r13, 0x80

mov r15, rsi

and r15, 0x78

or rbx, 1

mov rdx, 1

mov r8, rsi

mov r15, r13

add r14, rbp

mov r14, rbp

shl rax, 3

xor r10d, dword ptr [r8] add rcx, 4

or rcx, r12

add r8, r15

or r9, 8

add r8, rax

sub r9, r11

mov r13b, byte ptr [rsi]

xor esi, dword ptr [r9] mov rbx, 0

add r14, 0x29

or rbx, r15

pushfq

cmp r13b, 0xd2

mov r10, rbp

and rdx, 0x10

xor rbx, rdi

sub r15, 0x10

xor rbx, 0xf0

jbe 0x204

add r10, 0xcc

mov r14, qword ptr [r14] and r15, 0x3f

or r11, r13

xor rbx, 0x800

and r8, r13

sub r15, 0x20

add qword ptr [rsi], r14 or byte ptr [r14], r10b

mov rbx, qword ptr [r8]

and rdx, r8

or rcx, r13

xor esi, dword ptr [r10] pushfq

mov rax, 0x58

mov rdx, rbp

mov r12, rbp

or rcx, 4

xor r13, 0x90

xor r11, r14

mov r8, rbp

sub r13, 0x80

xor rdx, 0x20

mov rbx, rbp

add rdi, 0x10

add r15, r14

sub rsi, 0x78

add rdx, 0xc0

sub rbx, 4

or rcx, 4

mov r14, rsi

mov r13, 0x12

add r8, 0x127

add qword ptr [rdx], 0xd

add r11, 0x2549b044

sub rcx, 0x400

mov rdx, rbp

mov r8, 0

mov rdi, rbx

jmp rbx

or rbx, 0x78

add rax, rbp

add rdx, 0

and r14, 0x88

xor rbx, 0x3f

and rdx, r10

or rcx, 0x80

add dword ptr [rdx], esi and r13, 0x40

mov r8, qword ptr [r8]

mov rax, 0

add rcx, 0x80

xor r12, 1

add r13, 1

xor rsi, 1

add r12, 0x42

add rbx, 0x5a

mov r13, r15

mov rdx, rbp

mov rax, rbp

57

#3: No Central VM Dispatcher

mov r15, 0x200

mov r15, rdx

add r8, 1

or r14, r14

mov r14, 0x200

add r15, 0x3f

xor r15, 0x800

xor r10d, dword ptr [r12]

or r8, 0x78

mov rax, rbp

add rdx, 0xc0

or r15, 0xffffffff80000000

mov rbx, rbp

sub r15, 0x800

add word ptr [rbx], r10w and rcx, r13

add r11, r14

and rsi, r9

add rbx, 0xc0

or rdx, 0x400

mov r15, rax

add rax, 4

or r15, 0x88

add rax, 0xc0

mov rbx, qword ptr [rbx] mov rsi, 0x200

sub r15, rax

sub r8, -0x80000000

mov rdx, qword ptr [rdx]

add rdi, r14

mov r13, 1

mov r14, rbp

pop r9

add r13, 0xffff

add rdx, 0xa

or rsi, 1

mov rcx, 0

sub rsi, rsi

mov rcx, rbp

and rcx, 0x20

add r11, 0x78

mov rax, qword ptr [rax]

mov r15, rbp add r15, 0xc0 or rcx, 0x88

mov rdi, rbp mov r8, 0x400 sub rsi, r9

oradd mov add

rbx, 1 rcx, 0xc0
rcx, qword ptr [rcx] rcx, 8

mov add add

r10, rbp r13, r15 r14, r8

mov r8b, byte ptr [rdx] cmp r8b, 0 je 0x49e

and rdi, 0x7fffffff add rax, 2 sub rsi, 4

add rbx, 0xb mov r15, qword ptr [r15]

sub r8, rsi add r14, 0

shl rax, 3 movzx r10, word ptr [rcx] mov r9, rbp

add r10, 0x89 xor word ptr [r10], si

mov rdx, rbp or r11, 0x40

or rbx, rsi movzx rax, word ptr [rax]

or r12, 0xffffffff80000000 add rsi, rax

sub rcx, 0x78

and r8, 0x88

add r8, rax add r9, 0

xor rdx, r11

xor r10d, dword ptr [r9] mov rsi, rbp

and r15, 1 xor r11, 0x10

mov r9, rbp mov r13, 0x200

movzx r10, word ptr [rbx] xor r12, r13

xor rsi, r14 mov rsi, rbp

or rbx, r15 and rdi, 0xffffffff80000000 sub rdx, rbx

sub r13, 0xf0

and rax, 0x40

add rdx, 0xc0 or r14, 4

mov r10, 0x58 add r9, 0

add r12, 0xffff add r15, 0

add rdi, 0xc0 sub r8, rdi

sub r15, 0x10 mov rsi, 0 sub r13, 0x20

or rbx, 0xf0 add rsi, 0x5a

mov r15, 0x12 mov rdx, qword ptr [rdx]

or r10, 0x20 add eax, dword ptr [r9]

mov r8, rbp sub rcx, 0x10

add r8, 0x78 add rsi, 4

omororv

r11, rbx, rbp
r13, 0x88

r13

mov r8, rcx movzx rsi, word ptr [rsi]

sub r11, r8 add rdx, 4

xor r10, 0x40 add eax, 0x3f505c07

or r12, r12 or rcx, 0x800

mov rcx, 0x200 mov rdi, qword ptr [rdi]

mamonodvv

rbx, rcx, 8
r8, 0x58

qword

ptr [r8] mov rax, 0x200
mov r14, rbp

or r11, 0x80 mov r8w, word ptr [rdx]

add r15, 0x88 mov r12, rbp

movzx r11, word ptr [r15] xor rcx, 0x800

mov rdx, rbp add dword ptr [rsi], 0x2549b044 add rbx, 0xc0

and rax, rdx

xor rcx, 0xf0

mov rbx, qword ptr [rbx] and rcx, 0x20

mov r14, r8 add r8, rbp

or rdi, 0x90 add r12, 0

mov r12, r15 add r8, 0

add rcx, r10 add rdi, 6

sub r13, 0x80 sub rcx, 0x20 add rdi, 0x80

add r14, 0x89 or rax, 0x40

xor r13, 4 pop r10

or rbx, 0x80 add rdi, 0xf0

xor r12, 0xf0 mov rbx, 0x58

mov r8, 0x400 mov ax, word ptr [rdi]

add rdx, 0xc0 sub r13, 0x10 add rbx, 8

xor si, 0x7a28 add rdx, 0x78

mov qword ptr [r8], r10 jmp 0x4ae

mov r13, 0x400 add dword ptr [r12], eax

add r11, rbp xor rbx, 0x800

mov r8, 1 mov rsi, rbp

add qword ptr [rdx], 0xd mov si, word ptr [rbx] or r9, 0xffff

add rdx, 0x20 movzx r14, word ptr [r14]

xor rsi, 0x88

and rsi, r8

xor rbx, 0xffffffff80000000 or r10, 8

and r12, 0x20 add rbx, 0x800

and rcx, 8 sub rcx, 1

jsmmuobvp

rbx r9, 1
r9, rbp

mov rcx, 0x58 add rsi, rbp

add rsi, 0x78 mov r10b, 0x68

and rbx, 0x20 and rax, 0xffff

mov r11, qword ptr [r11] mov rcx, rdi

mov r12, 0x58

xor rax, rdx

mov r9, 0x12

mov r11, 0

add rbx, 1

add rsi, 0x29

add r9, 0

add r8, 0x80

or rbx, r10

add r13, r8

and r12, r9

or rcx, 8

sub r13, 0x80

mov r15, rsi

and r15, 0x78

or rbx, 1

mov rdx, 1

mov r8, rsi

mov r15, r13

add r14, rbp

mov r14, rbp

shl rax, 3

xor r10d, dword ptr [r8] add rcx, 4

or rcx, r12

add r8, r15

or r9, 8

add r8, rax

sub r9, r11

mov r13b, byte ptr [rsi]

xor esi, dword ptr [r9] mov rbx, 0

add r14, 0x29

or rbx, r15

pushfq

cmp r13b, 0xd2

mov r10, rbp

and rdx, 0x10

xor rbx, rdi

sub r15, 0x10

xor rbx, 0xf0

jbe 0x204

add r10, 0xcc

mov r14, qword ptr [r14] and r15, 0x3f

or r11, r13

xor rbx, 0x800

and r8, r13

sub r15, 0x20

add qword ptr [rsi], r14 or byte ptr [r14], r10b

mov rbx, qword ptr [r8]

and rdx, r8

or rcx, r13

xor esi, dword ptr [r10] pushfq

mov rax, 0x58

mov rdx, rbp

mov r12, rbp

or rcx, 4

xor r13, 0x90

xor r11, r14

mov r8, rbp

sub r13, 0x80

xor rdx, 0x20

mov rbx, rbp

add rdi, 0x10

add r15, r14

sub rsi, 0x78

add rdx, 0xc0

sub rbx, 4

or rcx, 4

mov r14, rsi

mov r13, 0x12

add r8, 0x127

add qword ptr [rdx], 0xd

add r11, 0x2549b044

sub rcx, 0x400

mov rdx, rbp

mov r8, 0

mov rdi, rbx

jmp rbx

or rbx, 0x78

add rax, rbp

add rdx, 0

and r14, 0x88

xor rbx, 0x3f

and rdx, r10

or rcx, 0x80

add dword ptr [rdx], esi and r13, 0x40

mov r8, qword ptr [r8]

mov rax, 0

add rcx, 0x80

xor r12, 1

add r13, 1

xor rsi, 1

add r12, 0x42

add rbx, 0x5a

mov r13, r15

mov rdx, rbp

mov rax, rbp

57

#3: No Central VM Dispatcher

mov r15, 0x200 xor r15, 0x800 mov rbx, rbp add rbx, 0xc0 mov rbx, qword ptr [rbx] mov r13, 1 mov rcx, 0 mov r15, rbp add r15, 0xc0 or rcx, 0x88 add rbx, 0xb mov r15, qword ptr [r15] or r12, 0xffffffff80000000 sub rcx, 0x78 movzx r10, word ptr [rbx] xor r12, r13 add r12, 0xffff add r15, 0 mov r8, rbp sub rcx, 0x10 or r12, r12 or rcx, 0x800 movzx r11, word ptr [r15] xor rcx, 0x800 mov r12, r15 add r8, 0 xor r12, 0xf0 mov rbx, 0x58 add r11, rbp xor rbx, 0x800 and r12, 0x20 add rbx, 0x800 mov r11, qword ptr [r11] add rbx, 1 and r12, r9 mov rdx, 1 xor r10d, dword ptr [r8] sub r9, r11 pushfq xor rbx, 0xf0 xor rbx, 0x800 and rdx, r8 mov r12, rbp xor rdx, 0x20 sub rbx, 4 add r11, 0x2549b044 or rbx, 0x78 and rdx, r10 mov rax, 0 add r12, 0x42

mov r15, rdx

add r8, 1

or r14, r14

xor r10d, dword ptr [r12]

or r8, 0x78

mov rax, rbp

sub r15, 0x800

add word ptr [rbx], r10w and rcx, r13

or rdx, 0x400

mov r15, rax

add rax, 4

mov rsi, 0x200

sub r15, rax

sub r8, -0x80000000

mov r14, rbp

pop r9

add r13, 0xffff

sub rsi, rsi

mov rcx, rbp

and rcx, 0x20

mov rdi, rbp mov r8, 0x400 sub rsi, r9

oradd mov add

rbx, 1 rcx, 0xc0
rcx, qword ptr [rcx] rcx, 8

mov add add

r10, rbp r13, r15 r14, r8

sub r8, rsi add r14, 0

shl rax, 3 movzx r10, word ptr [rcx] mov r9, rbp

add r10, 0x89 xor word ptr [r10], si

add rsi, rax and r8, 0x88

add r8, rax add r9, 0

xor rdx, r11

xor r10d, dword ptr [r9] mov rsi, rbp

xor rsi, r14 mov rsi, rbp

or rbx, r15 and rdi, 0xffffffff80000000 sub rdx, rbx

sub r13, 0xf0

and rax, 0x40

add rdi, 0xc0 sub r8, rdi

sub r15, 0x10 mov rsi, 0 sub r13, 0x20

or rbx, 0xf0 add rsi, 0x5a

add r8, 0x78 add rsi, 4

omororv

r11, rbx, rbp
r13, 0x88

r13

mov r8, rcx movzx rsi, word ptr [rsi]

mov rcx, 0x200 mov rdi, qword ptr [rdi]

mamonodvv

rbx, rcx, 8
r8, 0x58

qword

ptr [r8] mov rax, 0x200
mov r14, rbp

Split at indirect control-flow mov rdx, rbp add dword ptr [rsi], 0x2549b044 add rbx, 0xc0

and rax, rdx

xor rcx, 0xf0

mov rbx, qword ptr [rbx] and rcx, 0x20

add rcx, r10 add rdi, 6

sub r13, 0x80 sub rcx, 0x20 add rdi, 0x80

add r14, 0x89 or rax, 0x40

mov r8, 0x400 mov ax, word ptr [rdi]

add rdx, 0xc0 sub r13, 0x10 add rbx, 8

xor si, 0x7a28 add rdx, 0x78

mov r8, 1 mov rsi, rbp

add qword ptr [rdx], 0xd mov si, word ptr [rbx] or r9, 0xffff

add rdx, 0x20 movzx r14, word ptr [r14]

and rcx, 8 sub rcx, 1

jsmmuobvp

rbx r9, 1
r9, rbp

mov rcx, 0x58 add rsi, rbp

mov rcx, rdi

mov r12, 0x58

xor rax, rdx

add rsi, 0x29

add r9, 0

add r8, 0x80

or rcx, 8

sub r13, 0x80

mov r15, rsi

mov r8, rsi

mov r15, r13

add r14, rbp

add rcx, 4

or rcx, r12

add r8, r15

mov r13b, byte ptr [rsi]

xor esi, dword ptr [r9] mov rbx, 0

cmp r13b, 0xd2

mov r10, rbp

and rdx, 0x10

jbe 0x204

add r10, 0xcc

mov r14, qword ptr [r14]

and r8, r13

sub r15, 0x20

add qword ptr [rsi], r14

or rcx, r13

xor esi, dword ptr [r10] pushfq

or rcx, 4

xor r13, 0x90

xor r11, r14

mov rbx, rbp

add rdi, 0x10

add r15, r14

or rcx, 4

mov r14, rsi

mov r13, 0x12

sub rcx, 0x400

mov rdx, rbp

mov r8, 0

add rax, rbp

add rdx, 0

and r14, 0x88

or rcx, 0x80

add dword ptr [rdx], esi and r13, 0x40

add rcx, 0x80

xor r12, 1

add r13, 1

add rbx, 0x5a

mov r13, r15

mov rdx, rbp

mov r14, 0x200 add rdx, 0xc0 add r11, r14 or r15, 0x88 mov rdx, qword ptr [rdx] add rdx, 0xa add r11, 0x78 mov r8b, byte ptr [rdx] cmp r8b, 0 je 0x49e mov rdx, rbp or r11, 0x40 and r15, 1 xor r11, 0x10 add rdx, 0xc0 or r14, 4 mov r15, 0x12 mov rdx, qword ptr [rdx] sub r11, r8 add rdx, 4 or r11, 0x80 mov r8w, word ptr [rdx]
transfers mov r14, r8
add r8, rbp xor r13, 4 pop r10 mov qword ptr [r8], r10 jmp 0x4ae xor rsi, 0x88 xor rbx, 0xffffffff80000000 add rsi, 0x78 mov r10b, 0x68 mov r9, 0x12 or rbx, r10 and r15, 0x78 mov r14, rbp or r9, 8 add r14, 0x29 xor rbx, rdi and r15, 0x3f or byte ptr [r14], r10b mov rax, 0x58 mov r8, rbp sub rsi, 0x78 add r8, 0x127 mov rdi, rbx xor rbx, 0x3f mov r8, qword ptr [r8] xor rsi, 1 mov rax, rbp

add or and add add or mov and add sub or movzx mov mov mov add or add xor add add mov or add or add mov add and or and and mov add or shl add or sub or mov mov sub add add jmp

r15, 0x3f r15, 0xffffffff80000000 rsi, r9 rax, 0xc0 rdi, r14 rsi, 1 rax, qword ptr [rax] rdi, 0x7fffffff rax, 2 rsi, 4 rbx, rsi rax, word ptr [rax] r9, rbp r13, 0x200 r10, 0x58 r9, 0 r10, 0x20 eax, dword ptr [r9] r10, 0x40 eax, 0x3f505c07 r15, 0x88 r12, rbp rdi, 0x90 r12, 0 rbx, 0x80 rdi, 0xf0 r13, 0x400 dword ptr [r12], eax rsi, r8 r10, 8 rbx, 0x20 rax, 0xffff r11, 0 r13, r8 rbx, 1 rax, 3 r8, rax rbx, r15 r15, 0x10 r11, r13 rbx, qword ptr [r8] rdx, rbp r13, 0x80 rdx, 0xc0 qword ptr [rdx], 0xd rbx

57

#4: No Explicit Handler Table
58

#4: No Explicit Handler Table
58

#4: No Explicit Handler Table

vm_mul32

vm_nor32

vm_add64

vm_add64

vm_add64

vm_nor32

vm_nor32

vm_nor32

vm_mul32

58

Conclusion

Take Aways 1. syntactic complexity insignificant
60

Take Aways 1. syntactic complexity insignificant 2. semantic complexity low within specified boundaries
60

Take Aways
1. syntactic complexity insignificant 2. semantic complexity low within specified boundaries 3. learn underlying code's semantics despite obfuscation
60

Take Aways
1. syntactic complexity insignificant 2. semantic complexity low within specified boundaries 3. learn underlying code's semantics despite obfuscation
Program Synthesis as an orthogonal approach to traditional techniques
60

Limitations

Implementation Shortcomings
choosing meaningful code window boundaries (x  y) + 2 · (x  y) vs. (x  y) + 2

constants

x + 15324326921

control-flow operations

x?y:z

62

Limitations

(1,1)

?

2

x
(1,1)

?

4

non-determinism

63

Limitations

(1,1)

?

2

x
(1,1)

?

4

non-determinism

AES
semantic complexity

63

Limitations

(1,1)

?

x

{ 1, 0,

x  constant otherwise

0

2
point functions

x
(1,1)

?

4

non-determinism

AES
semantic complexity

63

Do try it at home!

Summary
· obfuscation techniques (opaque predicates, VM, MBA) · symbolic execution for syntactic deobfuscation · program synthesis for semantic deobfuscation
https://github.com/RUB-SysSec/syntia
65

