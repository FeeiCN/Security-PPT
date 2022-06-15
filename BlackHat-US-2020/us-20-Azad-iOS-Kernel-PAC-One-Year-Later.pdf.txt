iOS Kernel PAC, One Year Later
Brandon Azad, Google Project Zero

ARMv8.3-A Pointer Authentication

Pointer Authentication
0xfffffff01e335a5c

Pointer Authentication

25

39

0xfffffff01e335a5c

Pointer Authentication

25

39

0x2ab4ae701e335a5c

Pointer Authentication

25

39

0x2ab4ae701e335a5c

PAC instructions

PACIA X1, X8 Sign pointer in X1 with IA key and context X8

PACIZA X1

Sign pointer in X1 with IA key and context 0

PACIBSP

Sign LR with IB key and context SP

AUTIA X2, X8 Authenticate signed pointer in X2 with IA key and context X8

XPACI X3

Strip the PAC from the pointer in X3 without validation

BLRAA X4, X8 Authenticate X4 with context X8, then branch-with-link

LDRAA X9, [X5] Authenticate X5 with context 0, then load 64-bit value into X9

RETAB

Authenticate LR with IB key and context SP, then return

PAC in the iOS 12 kernel

PAC key use in XNU

IA Global code pointer IB Thread-local code pointer DA Global data pointer DB Thread-local data pointer GA Generic data

Function pointers, vtable methods Return addresses Vtable pointers (unused) Thread saved state: PC, LR, CPSR

Virtual method calls

Signing saved thread state (kernel & user)

Verifying thread state signatures

Exception return

Best ROP gadget ever!

Exception return

iOS 12 PAC bypasses

iOS 12 kernel PAC bypasses

PAC signing gadget

1

PAC bruteforce gadget

1

Thread state signing gadget

2

Unprotected indirect branch

1

Implementation bug

1

A Study in PAC, bypass #1: signing gadget

sysctl_unregister_oid

...

LDR

X10, [X9,#0x30]!

CBNZ X19, loc_FFFFFFF007EBD330

CBZ

X10, loc_FFFFFFF007EBD330

MOV

X19, #0

MOV

X11, X9

MOVK X11, #0x14EF,LSL#48

AUTIA X10, X11

PACIZA X10

STR

X10, [X9]

A Study in PAC, bypass #1: signing gadget

sysctl_unregister_oid

...

LDR

X10, [X9,#0x30]!

CBNZ X19, loc_FFFFFFF007EBD330

CBZ

X10, loc_FFFFFFF007EBD330

MOV

X19, #0

MOV

X11, X9

MOVK X11, #0x14EF,LSL#48

AUTIA X10, X11

PACIZA X10

STR

X10, [X9]

AUTIA doesn't fault; AUTIA+PACIZA is a
signing gadget

A Study in PAC, bypass #2: bruteforce gadget

sysctl_unregister_oid

...

LDR

X10, [X9,#0x30]!

...

MOV

X11, X9

MOVK X11, #0x14EF,LSL#48

MOV

X12, X10

AUTIA X12, X11

XPACI X10

CMP

X12, X10

PACIZA X10

CSEL X10, X10, X12, EQ

STR

X10, [X9]

A Study in PAC, bypass #2: bruteforce gadget

sysctl_unregister_oid

...

LDR

X10, [X9,#0x30]!

...

MOV

X11, X9

MOVK X11, #0x14EF,LSL#48

MOV

X12, X10

AUTIA X12, X11

XPACI X10

CMP

X12, X10

PACIZA X10

CSEL X10, X10, X12, EQ

STR

X10, [X9]

Can be called repeatedly until we guess the right PAC

A Study in PAC, bypass #3: state signing gadget

copyio_error ... RETAB

__bcopyin

PACIBSP

STP

X29, X30, [SP,#-0x10]!

MOV

X29, SP

MRS

X10, TPIDR_EL1 ;; thread

LDR

X11, [X10,#thread.recover]

ADRL X3, copyio_error

STR

X3, [X10,#thread.recover]

...

A Study in PAC, bypass #3: state signing gadget

copyio_error ... RETAB

__bcopyin

PACIBSP

STP

X29, X30, [SP,#-0x10]!

MOV

X29, SP

MRS

X10, TPIDR_EL1 ;; thread

LDR

X11, [X10,#thread.recover]

ADRL X3, copyio_error

STR

X3, [X10,#thread.recover]

...

Unprotected code pointer used for
control flow

A Study in PAC, bypass #4: unprotected branch

ipc_kmsg_clean_body

...

ADR

X25, jpt_FFFFFFF0079CFAF0

...

BL

ipc_port_release_receive

...

CMP

W9, #3 ; switch 4 cases

B.HI def_FFFFFFF0079CFAF0

LDRSW X9, [X25,X9,LSL#2]

ADD

X9, X9, X25

BR

X9

; switch jump

A Study in PAC, bypass #4: unprotected branch

ipc_kmsg_clean_body

...

ADR

X25, jpt_FFFFFFF0079CFAF0

...

BL

ipc_port_release_receive

...

CMP

W9, #3 ; switch 4 cases

B.HI def_FFFFFFF0079CFAF0

LDRSW X9, [X25,X9,LSL#2]

ADD

X9, X9, X25

BR

X9

; switch jump

Unprotected indirect branch

A Study in PAC, bypass #4: unprotected branch

ipc_kmsg_clean_body

...

ADR

X25, jpt_FFFFFFF0079CFAF0

...

BL

ipc_port_release_receive

...

CMP

W9, #3 ; switch 4 cases

B.HI def_FFFFFFF0079CFAF0

LDRSW X9, [X25,X9,LSL#2]

ADD

X9, X9, X25

BR

X9

; switch jump

Function call spills X25 (jump table) to
the stack
Unprotected indirect branch

A Study in PAC, bypass #5: state signing gadget
machine_thread_create(thread *thread, ...) {
user_state = zalloc(user_ss_zone);
thread->machine.upcb = user_state;
user_state = thread->machine.upcb;
sign_thread_state(user_state, user_state->pc, user_state->cpsr, user_state->lr);
}

A Study in PAC, bypass #5: state signing gadget

machine_thread_create(thread *thread, ...) {
user_state = zalloc(user_ss_zone);
thread->machine.upcb = user_state;
user_state = thread->machine.upcb;
sign_thread_state(user_state, user_state->pc, user_state->cpsr, user_state->lr);
}

Interrupts are enabled

Signing saved thread state (kernel & user)

A Study in PAC, bypass #5: state signing gadget

machine_thread_create(thread *thread, ...) {
user_state = zalloc(user_ss_zone);
thread->machine.upcb = user_state;
user_state = thread->machine.upcb;
sign_thread_state(user_state, user_state->pc, user_state->cpsr, user_state->lr);
}

Interrupts are enabled

A Study in PAC, bypass #5: state signing gadget

machine_thread_create(thread *thread, ...) {
user_state = zalloc(user_ss_zone);
thread->machine.upcb = user_state;
user_state = thread->machine.upcb;
sign_thread_state(user_state, user_state->pc, user_state->cpsr, user_state->lr);
}

Parameters to sign are read from memory

Attacking iPhone XS Max bypass: validation bug

Attacking iPhone XS Max bypass: validation bug

Attacking iPhone XS Max bypass: validation bug

iOS 13 changes

PAC key use in XNU

IA Global code pointer IB Thread-local code pointer DA Global data pointer DB Thread-local data pointer GA Generic data

Function pointers, vtable methods Return addresses Vtable pointers (unused) Thread saved state: PC, LR, CPSR, X16, X17

New protected registers

Signing saved thread state in iOS 13
X16 and X17 should now be safe from modification during an interrupt

Hardened switch statements

ipc_kmsg_clean_body

...

ADR

X25, jpt_FFFFFFF0079CFAF0

...

...

CMP

W9, #3 ; switch 4 cases

B.HI def_FFFFFFF0079CFAF0

LDRSW X9, [X25,X9,LSL#2]

ADD

X9, X9, X25

BR

X9

; switch jump

ipc_kmsg_clean_body

...

CMP

W16, #4 ; switch 5 cases

B.HI def_FFFFFFF007B8F8B0

CMP

X16, #4

CSEL X16, X16, XZR, LS

ADR

X17, jpt_FFFFFFF007B8F8B0

NOP

LDRSW X16, [X17,X16,LSL#2]

ADD

X16, X17, X16

BR

X16

; switch jump

Unprotected indirect branches only use X16 and X17

Analyzing PAC on iOS 13

A Study in PAC, bypass 5: state signing gadget
machine_thread_create(thread *thread, ...) {
user_state = zalloc(user_ss_zone);
thread->machine.upcb = user_state;
user_state = thread->machine.upcb;
sign_thread_state(user_state, user_state->pc, user_state->cpsr, user_state->lr);
}

Bypass 5 fix
machine_thread_create(thread *thread, ...) {
user_state = zalloc(user_ss_zone); thread->machine.upcb = user_state; user_state = thread->machine.upcb; sign_thread_state(user_state, 0, 0, 0, 0, 0);
}

Bypass 5 fix

machine_thread_create(thread *thread, ...) {
user_state = zalloc(user_ss_zone);
thread->machine.upcb = user_state;

Issue: Interrupts are still enabled!

user_state = thread->machine.upcb;

sign_thread_state(user_state, 0, 0, 0, 0, 0);

}

Bypass 5 fix (assembly)

machine_thread_state_initialize

...

LDR

X0, [X19,#thread.upcb] ; arm_context

CBZ

X0, loc_FFFFFFF007CD2A34

MOV

W2, #0 ; cpsr

MOV

X1, #0 ; pc

Imagine getting an

MOV

X3, #0 ; lr

MOV

X4, #0 ; x16

interrupt here

MOV

X5, #0 ; x17

BL

sign_thread_state

...

Interrupt exceptions

el1_sp0_fiq_vector_long

...

STP

X0, X1, [SP,#arm_context.x0]

...

ADRL X1, fleh_fiq

B

fleh_dispatch64

fleh_dispatch64

STP

X2, X3, [X0,#arm_context.x2]

STP

X4, X5, [X0,#arm_context.x4]

STP

X6, X7, [X0,#arm_context.x6]

STP

X8, X9, [X0,#arm_context.x8]

...

thread kstackptr

X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

Interrupt exceptions

el1_sp0_fiq_vector_long

...

STP

X0, X1, [SP,#arm_context.x0]

...

ADRL X1, fleh_fiq

B

fleh_dispatch64

fleh_dispatch64

STP

X2, X3, [X0,#arm_context.x2]

STP

X4, X5, [X0,#arm_context.x4]

STP

X6, X7, [X0,#arm_context.x6]

STP

X8, X9, [X0,#arm_context.x8]

...

thread kstackptr

X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

Bypass #6: Interrupts during thread state signing

machine_thread_state_initialize

...

LDR

X0, [X19,#thread.upcb] ; arm_context

CBZ

X0, loc_FFFFFFF007CD2A34

MOV

W2, #0 ; cpsr

MOV

X1, #0 ; pc

An interrupt here

MOV

X3, #0 ; lr

MOV

X4, #0 ; x16

MOV

X5, #0 ; x17

BL

sign_thread_state

...

would spill X0-X5, allowing an attacker
to change the parameters being

signed

Finding a better interrupt point
void thread_state64_to_saved_state(new_state, thread_state) {
... new_pc = new_state->pc; x16 = thread_state->x16; x17 = thread_state->x17; cpsr = thread_state->cpsr; lr = thread_state->lr; verify_thread_state(thread_state, thread_state->pc, cpsr,
lr, x16, x17); thread_state->pc = new_pc; sign_thread_state(thread_state, new_pc, cpsr,
lr, x16, x17); }

thread_state64_to_saved_state

...

MOV

X8, X30

MOV

X0, X9 ; arm_context *

LDP

X4, X5, [X0,#arm_context.x16] ; x17

LDR

X6, [X0,#arm_context.pc]

LDR

W7, [X0,#arm_context.cpsr]

LDR

X3, [X0,#arm_context.lr] ; lr

MOV

X1, X6 ; pc

MOV

W2, W7 ; cpsr

BL

verify_thread_state

MOV

X1, X6

MOV

W2, W7 ; cpsr

MOV

X1, X11 ; pc

STR

X1, [X0,#arm_context.pc]

BL

sign_thread_state

MOV

X30, X8

...

RET

thread_state64_to_saved_state

...

MOV

X8, X30

MOV

X0, X9 ; arm_context *

LDP

X4, X5, [X0,#arm_context.x16] ; x17

LDR

X6, [X0,#arm_context.pc]

LDR

W7, [X0,#arm_context.cpsr]

LDR

X3, [X0,#arm_context.lr] ; lr

MOV

X1, X6 ; pc

MOV

W2, W7 ; cpsr

BL

verify_thread_state

MOV

X1, X6

MOV

W2, W7 ; cpsr

MOV

X1, X11 ; pc

STR

X1, [X0,#arm_context.pc]

BL

sign_thread_state

MOV

X30, X8

...

RET

LR (X30) saved to X8 during function
calls

thread_state64_to_saved_state

...

MOV

X8, X30

MOV

X0, X9 ; arm_context *

LDP

X4, X5, [X0,#arm_context.x16] ; x17

LDR

X6, [X0,#arm_context.pc]

LDR

W7, [X0,#arm_context.cpsr]

LDR

X3, [X0,#arm_context.lr] ; lr

MOV

X1, X6 ; pc

MOV

W2, W7 ; cpsr

BL

verify_thread_state

MOV

X1, X6

MOV

W2, W7 ; cpsr

MOV

X1, X11 ; pc

STR

X1, [X0,#arm_context.pc]

BL

sign_thread_state

MOV

X30, X8

...

RET

LR (X30) saved to X8 during function
calls
X8 can be changed during an interrupt!

Bypass #6 idea
 Thread A: Pin to CPU #4 (receives many interrupts)  Thread B: Pin to CPU #5 (receives few interrupts)  Thread A: Loop on thread_set_state()  Thread B: Monitor CPU #4's cpu_data for an interrupt  Thread A: Gets interrupted just before "MOV X30, X8"  Thread B: Overwrite CPU #4's saved X8 register value  Thread A: Returns from interrupt handler, resumes at "MOV X30, X8"  Thread A: Executes "RET", jumps to arbitrary PC

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

Kernel User

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

Kernel User

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

Kernel User

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

Kernel User

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

Kernel User

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

Kernel User

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

Kernel User

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

Kernel User

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

Kernel User

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

Kernel User

X0 X1 X2
X8
X29 LR SP PC CPSR pac_sig

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

Kernel User

X0 X1 X2
X8
X29 LR SP PC CPSR pac_sig

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

CPU 4: Execute interrupt
handler
el1_sp0_fiq_vector_long ... ERET

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

Kernel User

X0 X1 X2
X8
X29 LR SP PC CPSR pac_sig

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

CPU 4: Execute interrupt
handler
el1_sp0_fiq_vector_long ... ERET

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

Kernel User

X0 X1 X2
X8
X29 LR SP PC CPSR pac_sig

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

CPU 4: Execute interrupt
handler
el1_sp0_fiq_vector_long ... ERET

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

Kernel User

X0 X1 X2
X8
X29 LR SP PC CPSR pac_sig

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

CPU 4: Execute interrupt
handler
el1_sp0_fiq_vector_long ... ERET

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

Kernel User

X0 X1 X2
X8
X29 LR SP PC CPSR pac_sig

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

CPU 4: Execute interrupt
handler
el1_sp0_fiq_vector_long ... ERET

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

Kernel User

X0 X1 X2
X8
X29 LR SP PC CPSR pac_sig

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

CPU 4: Execute interrupt
handler
el1_sp0_fiq_vector_long ... ERET

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

Kernel User

X0 X1 X2
X8
X29 LR SP PC CPSR pac_sig

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

CPU 4: Execute interrupt
handler
el1_sp0_fiq_vector_long ... ERET

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

Kernel User

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

Kernel User

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

Kernel User

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

Kernel User

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

Kernel User

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

thread_state64_to_saved_state

...

MOV

X8, X30

...

MOV

X30, X8

...

RET

PC control!

Kernel User

machine_thread_set_state

...

BL

thread_state64_to_saved_state

...

thread_set_state()
Thread A (CPU 4)

if (cpu_4_interrupted) overwrite_saved_x8()
Thread B (CPU 5)

DEMO

Bypass #6: Interrupts during thread state signing

machine_thread_state_initialize

...

LDR

X0, [X19,#thread.upcb] ; arm_context

CBZ

X0, loc_FFFFFFF007CD2A34

MOV

W2, #0 ; cpsr

MOV

X1, #0 ; pc

Interrupts during

MOV

X3, #0 ; lr

MOV

X4, #0 ; x16

MOV

X5, #0 ; x17

thread state signing are unsafe

BL

sign_thread_state

...

Bypass #7: Interrupts during PACIA

 Another variant of the same bypass  Interrupts are not just problematic for sign_thread_state()

__bcopyin ... MRS ADRL ADD MOVK PACIA LDR STR ...

X10, TPIDR_EL1 ;; thread X3, copyio_error X11, X10, #thread.recover X11, #0x1E02,LSL#48 X3, X11 X11, [X10,#thread.recover] X3, [X10,#thread.recover]

Bypass #7: Interrupts during PACIA

 Another variant of the same bypass  Interrupts are not just problematic for sign_thread_state()

__bcopyin ... MRS ADRL ADD MOVK PACIA LDR STR ...

X10, TPIDR_EL1 ;; thread X3, copyio_error X11, X10, #thread.recover X11, #0x1E02,LSL#48 X3, X11 X11, [X10,#thread.recover] X3, [X10,#thread.recover]

An interrupt here would spill X3 and X11, which
are unprotected

Bypass #8: LR spilled during exceptions

 EL1 exception vectors spill LR to memory
 LR read back before sign_thread_state()
 Overwrite spilled LR before signature is generated

el1_sp0_fiq_vector_long

MSR

SPSel, #0 ; SP_EL0

SUB

SP, SP, #0x350

STP

X0, X1, [SP,#arm_context.x0]

...

STP

X29, X30, [SP,#arm_context.x29]

...

B

fleh_dispatch64

fleh_dispatch64

STP

X2, X3, [X0,#arm_context.x2]

...

MOV

X1, X30 ; pc

MOV

W2, W23 ; cpsr

LDR

X3, [X0,#arm_context.lr] ; lr

MOV

X4, X16 ; x16

MOV

X5, X17 ; x17

BL

sign_thread_state

Bypass #8: LR spilled during exceptions

 EL1 exception vectors spill LR to memory
 LR read back before sign_thread_state()
 Overwrite spilled LR before signature is generated

el1_sp0_fiq_vector_long

MSR

SPSel, #0 ; SP_EL0

SUB

SP, SP, #0x350

STP

X0, X1, [SP,#arm_context.x0]

...

STP

X29, X30, [SP,#arm_context.x29]

...

B

fleh_dispatch64

fleh_dispatch64

STP

X2, X3, [X0,#arm_context.x2]

...

MOV

X1, X30 ; pc

MOV

W2, W23 ; cpsr

LDR

X3, [X0,#arm_context.lr] ; lr

MOV

X4, X16 ; x16

MOV

X5, X17 ; x17

BL

sign_thread_state

Bypass #8: LR spilled during exceptions

spin_while_zero

LDR

X1, [X0]

CBZ

X1, spin_while_zero

RET

Bypass #8: LR spilled during exceptions

spin_while_zero

LDR

X1, [X0]

CBZ

X1, spin_while_zero

RET

X0 X1 X2 X3 X4 X5

X29 LR SP PC CPSR pac_sig

el1_sp0_fiq_vector_long

...

STP

X29, X30, [SP,#arm_context.x29]

...

B

fleh_dispatch64

fleh_dispatch64

...

LDR

X3, [X0,#arm_context.lr] ; lr

...

BL

sign_thread_state

...

Bypass #8: LR spilled during exceptions

spin_while_zero

LDR

X1, [X0]

CBZ

X1, spin_while_zero

RET

X0 X1 X2 X3 X4 X5

X29 LR SP PC CPSR pac_sig

el1_sp0_fiq_vector_long

...

STP

X29, X30, [SP,#arm_context.x29]

...

B

fleh_dispatch64

fleh_dispatch64

...

LDR

X3, [X0,#arm_context.lr] ; lr

...

BL

sign_thread_state

...

Bypass #8: LR spilled during exceptions

spin_while_zero

LDR

X1, [X0]

CBZ

X1, spin_while_zero

RET

X0 X1 X2 X3 X4 X5

X29 LR SP PC CPSR pac_sig

el1_sp0_fiq_vector_long

...

STP

X29, X30, [SP,#arm_context.x29]

...

B

fleh_dispatch64

fleh_dispatch64

...

LDR

X3, [X0,#arm_context.lr] ; lr

...

BL

sign_thread_state

...

Bypass #8: LR spilled during exceptions

spin_while_zero

LDR

X1, [X0]

CBZ

X1, spin_while_zero

RET

X0 X1 X2 X3 X4 X5

X29 LR SP PC CPSR pac_sig

el1_sp0_fiq_vector_long

...

STP

X29, X30, [SP,#arm_context.x29]

...

B

fleh_dispatch64

fleh_dispatch64

...

LDR

X3, [X0,#arm_context.lr] ; lr

...

BL

sign_thread_state

...

Bypass #8: LR spilled during exceptions

spin_while_zero

LDR

X1, [X0]

CBZ

X1, spin_while_zero

RET

X0 X1 X2 X3 X4 X5

X29 LR SP PC CPSR pac_sig

el1_sp0_fiq_vector_long

...

STP

X29, X30, [SP,#arm_context.x29]

...

B

fleh_dispatch64

fleh_dispatch64

...

LDR

X3, [X0,#arm_context.lr] ; lr

...

BL

sign_thread_state

...

Bypass #8: LR spilled during exceptions

spin_while_zero

LDR

X1, [X0]

CBZ

X1, spin_while_zero

RET

X0 X1 X2 X3 X4 X5

X29 LR SP PC CPSR pac_sig

el1_sp0_fiq_vector_long

...

STP

X29, X30, [SP,#arm_context.x29]

...

B

fleh_dispatch64

fleh_dispatch64

...

LDR

X3, [X0,#arm_context.lr] ; lr

...

BL

sign_thread_state

...

Bypass #8: LR spilled during exceptions

spin_while_zero

LDR

X1, [X0]

CBZ

X1, spin_while_zero

RET

X0 X1 X2 X3 X4 X5

X29 LR SP PC CPSR pac_sig

el1_sp0_fiq_vector_long

...

STP

X29, X30, [SP,#arm_context.x29]

...

B

fleh_dispatch64

fleh_dispatch64

...

LDR

X3, [X0,#arm_context.lr] ; lr

...

BL

sign_thread_state

...

Bypass #8: LR spilled during exceptions

spin_while_zero

LDR

X1, [X0]

CBZ

X1, spin_while_zero

RET

X0 X1 X2 X3 X4 X5

X29 LR SP PC CPSR pac_sig

el1_sp0_fiq_vector_long

...

STP

X29, X30, [SP,#arm_context.x29]

...

B

fleh_dispatch64

fleh_dispatch64

...

LDR

X3, [X0,#arm_context.lr] ; lr

...

BL

sign_thread_state

...

Signed state with controlled LR

Bypass #8: LR spilled during exceptions

Reading parameters from memory before
sign_thread_state() is always insecure

el1_sp0_fiq_vector_long

MSR

SPSel, #0 ; SP_EL0

SUB

SP, SP, #0x350

STP

X0, X1, [SP,#arm_context.x0]

...

STP

X29, X30, [SP,#arm_context.x29]

...

B

fleh_dispatch64

fleh_dispatch64

STP

X2, X3, [X0,#arm_context.x2]

...

MOV

X1, X30 ; pc

MOV

W2, W23 ; cpsr

LDR

X3, [X0,#arm_context.lr] ; lr

MOV

X4, X16 ; x16

MOV

X5, X17 ; x17

BL

sign_thread_state

Bypass #9: Switch_context() / Idle_context()

Switch_context

CBNZ X1, have_continuation__no_need_to_save

LDR

X3, [X0,#thread.kstackptr]

STP

X16, X17, [X3,#arm_context.x16]

STP

X19, X20, [X3,#arm_context.x19]

...

STP

X29, X30, [X3,#arm_context.x29]

...

MOV

X0, X3 ; arm_context

LDR

X1, [X0,#arm_context.pc] ; pc

LDR

W2, [X0,#arm_context.cpsr] ; cpsr

MOV

X3, X30 ; lr

MOV

X4, X16 ; x16

MOV

X5, X17 ; x17

BL

sign_thread_state

...

RET

Bypass #9: Switch_context() / Idle_context()

Switch_context

CBNZ X1, have_continuation__no_need_to_save

LDR

X3, [X0,#thread.kstackptr]

STP

X16, X17, [X3,#arm_context.x16]

STP

X19, X20, [X3,#arm_context.x19]

...

STP

X29, X30, [X3,#arm_context.x29]

...

MOV

X0, X3 ; arm_context

LDR

X1, [X0,#arm_context.pc] ; pc

LDR

W2, [X0,#arm_context.cpsr] ; cpsr

MOV

X3, X30 ; lr

MOV

X4, X16 ; x16

MOV

X5, X17 ; x17

BL

sign_thread_state

...

RET

PC and CPSR are read from memory before
signing

Bypass #9: Switch_context() / Idle_context()
 Switch_context() manages thread states for voluntary kernel context switches
 PC and CPSR are not needed/used
 While thread is active, write arbitrary PC+CPSR into its saved state blob  Switch_context() is called, reads PC+CPSR, signs them into the saved state  Use the saved state for an exception return with arbitrary PC+CPSR
There's a bigger issue here...

Design issue
 Fundamentally, there are 2 ways that signed thread states are used
1. During exception return, via exception_return 2. During kernel thread context switch, via Switch_context()
 These uses have different security requirements
 exception_return to EL1 needs PC, CPSR, LR protected  exception_return to EL0 only needs CPSR protected  Switch_context() only needs LR protected
 Since thread states can be used in 2 different ways, thread states signed for Switch_context() should not be usable by exception_return and vice versa
 But there's only one sign_thread_state()...
 Thread states signed for one purpose can be swapped and used for the other

Bypass #9: Switch_context() / Idle_context()
 Fundamental issue: Thread state signed by Switch_context() for context switching (which does not care about PC+CPSR) can instead be used for exception returns (which do)
 What about the inverse?

Bypass #10: Swapping user & kernel thread states

 thread_set_state() syscall can be used to set registers for user threads
 CPSR is restricted to EL0, but LR is unrestricted
 Could place a kernel pointer in user LR; it would just fault
 Interacts poorly with Switch_context(), which uses LR but ignores CPSR

thread_state64_to_saved_state() {
verify_thread_state(state, pc, cpsr, lr, x16, x17);
state->lr = new_lr; sign_thread_state(state, pc,
cpsr, new_lr, x16, x17);
new_cpsr = new_state->cpsr & ~0x1F; verify_thread_state(state, pc,
cpsr, new_lr, x16, x17); state->cpsr = new_cpsr; sign_thread_state(state, pc,
new_cpsr, new_lr, x16, x17); }

Bypass #10: Swapping user & kernel thread states
 Thread A: Block thread A by sending a Mach message to a filled Mach port  Thread A: Register state is saved by Switch_context()  Thread B: Set thread_A->user_state = thread_A->kernel_state  Thread B: Call thread_set_state(thread_A) to set kernel_state's LR to
an arbitrary address and sign  Thread B: Unblock thread A by receiving a Mach message on the filled port  Thread A: Switch_context() to A causes a RET to the arbitrary address
100% reliable and deterministic

Kernel User

mach_msg()
Thread A

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

swap_user_to_kernel_state() thread_set_state()
Thread B

thread_block_reason

...

BL

Switch_context

...

Kernel User

mach_msg()

Thread A

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

swap_user_to_kernel_state() thread_set_state()
Thread B

Switch_context

...

STP

X29, X30, [X3,#arm_context.x29]

...

LDR

X3, [X0,#arm_context.lr]

...

MOV

X30, X3

...

RET

thread_block_reason

...

BL

Switch_context

...

Kernel User

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

mach_msg()

swap_user_to_kernel_state() thread_set_state()

Thread A

Thread B

Switch_context

...

STP

X29, X30, [X3,#arm_context.x29]

...

LDR

X3, [X0,#arm_context.lr]

...

MOV

X30, X3

...

RET

thread_block_reason

...

BL

Switch_context

...

Kernel User

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

mach_msg()

swap_user_to_kernel_state() thread_set_state()

Thread A

Thread B

Switch_context

...

STP

X29, X30, [X3,#arm_context.x29]

...

LDR

X3, [X0,#arm_context.lr]

...

MOV

X30, X3

...

RET

thread_block_reason

...

BL

Switch_context

...

Kernel User

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A blocked
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

mach_msg()

swap_user_to_kernel_state() thread_set_state()

Thread A

Thread B

Switch_context

...

STP

X29, X30, [X3,#arm_context.x29]

...

LDR

X3, [X0,#arm_context.lr]

...

MOV

X30, X3

...

RET

thread_block_reason

...

BL

Switch_context

...

Kernel User

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A blocked
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

mach_msg()

swap_user_to_kernel_state() thread_set_state()

Thread A

Thread B

Switch_context

...

STP

X29, X30, [X3,#arm_context.x29]

...

LDR

X3, [X0,#arm_context.lr]

...

MOV

X30, X3

...

RET

thread_block_reason

...

BL

Switch_context

...

Kernel User

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A blocked
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

mach_msg()

swap_user_to_kernel_state() thread_set_state()

Thread A

Thread B

Switch_context

...

STP

X29, X30, [X3,#arm_context.x29]

...

LDR

X3, [X0,#arm_context.lr]

...

MOV

X30, X3

...

RET

thread_block_reason

...

BL

Switch_context

...

Kernel User

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A blocked
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

mach_msg()

swap_user_to_kernel_state() thread_set_state()

Thread A

Thread B

Switch_context

...

STP

X29, X30, [X3,#arm_context.x29]

...

LDR

X3, [X0,#arm_context.lr]

...

MOV

X30, X3

...

RET

thread_block_reason

...

BL

Switch_context

...

Kernel User

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A blocked
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

mach_msg()

swap_user_to_kernel_state() thread_set_state()

Thread A

Thread B

Switch_context

...

STP

X29, X30, [X3,#arm_context.x29]

...

LDR

X3, [X0,#arm_context.lr]

...

MOV

X30, X3

...

RET

thread_block_reason

...

BL

Switch_context

...

Kernel User

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

mach_msg()

swap_user_to_kernel_state() thread_set_state()

Thread A

Thread B

Switch_context

...

STP

X29, X30, [X3,#arm_context.x29]

...

LDR

X3, [X0,#arm_context.lr]

...

MOV

X30, X3

...

RET

thread_block_reason

...

BL

Switch_context

...

Kernel User

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

mach_msg()

swap_user_to_kernel_state() thread_set_state()

Thread A

Thread B

Switch_context

...

STP

X29, X30, [X3,#arm_context.x29]

...

LDR

X3, [X0,#arm_context.lr]

...

MOV

X30, X3

...

RET

thread_block_reason

...

BL

Switch_context

...

Kernel User

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

mach_msg()

swap_user_to_kernel_state() thread_set_state()

Thread A

Thread B

Switch_context

...

STP

X29, X30, [X3,#arm_context.x29]

...

LDR

X3, [X0,#arm_context.lr]

...

MOV

X30, X3

...

RET

thread_block_reason

...

BL

Switch_context

...

Kernel User

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

mach_msg()

swap_user_to_kernel_state() thread_set_state()

Thread A

Thread B

Switch_context

...

STP

X29, X30, [X3,#arm_context.x29]

...

LDR

X3, [X0,#arm_context.lr]

...

MOV

X30, X3

...

RET

thread_block_reason

...

BL

Switch_context

...

Kernel User

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

mach_msg()

swap_user_to_kernel_state() thread_set_state()

Thread A

Thread B

Switch_context

...

STP

X29, X30, [X3,#arm_context.x29]

...

LDR

X3, [X0,#arm_context.lr]

...

MOV

X30, X3

...

RET

thread_block_reason

...

BL

Switch_context

...

Kernel User

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

mach_msg()

swap_user_to_kernel_state() thread_set_state()

Thread A

Thread B

Switch_context

...

STP

X29, X30, [X3,#arm_context.x29]

...

LDR

X3, [X0,#arm_context.lr]

...

MOV

X30, X3

...

RET
PC control!

thread_block_reason

...

BL

Switch_context

...

Kernel User

Kernel state
X23 X24 X25 X26 X27 X28 X29 LR SP PC CPSR pac_sig

thread A
upcb kstackptr

User state
X0 X1 X2 X3 X4 X5
X29 LR SP PC CPSR pac_sig

mach_msg()

swap_user_to_kernel_state() thread_set_state()

Thread A

Thread B

DEMO

Takeaways

iOS kernel PAC bypasses
PAC signing gadget PAC bruteforce gadget Thread state signing gadget Unprotected indirect branch Implementation bug Reusing signed states (design issue)

iOS 12 1 1 2 1 1

iOS 13 1 2
2

More thorough analysis could have helped
 PAC still feels quite ad hoc in iOS 13
 What is the formal security model?  There might be a few fundamental issues remaining
 iOS 12: Apple fixed the POCs, but not the underlying issue
 Interrupts were explicitly called out as attack vectors
 Important to look at the compiler output
 Some issues don't appear in the C code  Pop the kernel into your favorite disassembler

PAC is still a good mitigation
 PAC as an exploit mitigation is independent of PAC as kernel CFI  It has been quite successful at limiting exploitability of certain bug classes
 Force attackers to use better bugs
 Lots of untapped potential in data PAC
 Promising improvements in iOS 14

Kernel PAC bypasses are not that important
 In the world of LPE, a kernel PAC bypass seems like the cherry-on-top  Perhaps an expensive upcharge when selling an exploit?
 Used to maintain legacy implants that rely on kernel function calls?
 But kernel CFI is not the last line of defense keeping your device safe
 Hardening the kernel is still more important for end user security

