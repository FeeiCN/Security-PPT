An Analysis of Speculative Type Confusion Vulnerabilities in the
Wild
Adam Morrison

About the speaker
Associate professor, CS, Tel Aviv University. Started career doing vulnerability research.

About the speaker
Associate professor, CS, Tel Aviv University. Started career doing vulnerability research. Now: Software/hardware interactions. · From microarchitecture to OS.
software hardware

About this talk
Joint work with Ofek Kirzner. Full details available in academic paper:

Spectre attacks

Executive summary
Spectre v1 has no hardware fix; software mitigations required. Popularized as a bounds-check bypass attack. We show other Spectre v1 vectors in real code.  Mitigating Spectre v1 in software requires some rethinking.

Spectre attacks

Spectre attacks
victim

Goal: Leak data from the victim address space

exploit speculative execution leak secret data

gadget

Spectre variant 1: Bounds Check Bypass
victim

Goal: Leak data from the victim address space

exploit branch prediction leak secret data

gadget

Spectre variant 1: Bounds Check Bypass
victim
Goal: Leak data from the victim address space

Spectre variant 1: Bounds Check Bypass
victim

Goal: Leak data from the victim address space

foo(x)

Spectre variant 1: Bounds Check Bypass

speculation starts

victim

Goal: Leak data from the victim address space

foo(&secret-array1)

Spectre variant 1: Bounds Check Bypass

speculation starts speculative access

victim

Goal: Leak data from the victim address space

foo(&secret-array1) array[x]=&secret

Spectre variant 1: Bounds Check Bypass

speculation starts speculative access

victim

Goal: Leak data from the victim address space

foo(&secret-array1)

Spectre variant 1: Bounds Check Bypass

speculation starts speculative access transmit secret

victim

foo(&secret-array1)

Goal: Leak data

from the victim

address space

Cache state

z

encodes y

L1 cache

Spectre variant 1: Bounds Check Bypass

speculation starts speculative access transmit secret misprediction

victim

Goal: Leak data from the victim address space

foo(&secret-array1)
z
L1 cache

Spectre variant 1: Bounds Check Bypass
victim

Goal: Leak data

from the victim

address space

y

z
L1 cache

Spectre variant 1: Bounds Check Bypass

SIDE CHANNEL: secret-dependent microarchitectural state.

victim

Goal: Leak data

from the victim

address space

y

z
L1 cache

Spectre variant 1: Bounds Check Bypass

SIDE CHANNEL: secret-dependent microarchitectural state.
Spectre enabled arbitrary data to be transmitted via a side channel.

victim

Goal: Leak data

from the victim

address space

y

z
L1 cache

Spectre v1 is a threat to OS kernels

Attacker: unprivileged user

Attacker
Victim: OS victim
kernel

Goal: Leak data from the victim address space

exploit system calls read any physical memory

Spectre v1 mitigation
No hardware fix for Spectre v1

Spectre v1 mitigation in the Linux kernel
No hardware fix for Spectre v1  Linux has a special API to ensure bounds checks are respected under
speculation

Spectre v1: not only a bounds check bypass
Quoting from the Spectre paper [Kocher et al., 2019]:

SPECULATIVE TYPE CONFUSION
Misspeculation makes the victim execute with some variables holding values of the wrong type, and thereby leak memory content

Speculative type confusion: example

Misprediction:

obj TYPE2

Type confusion

...

secret

Our results

Observation: speculative type confusion may be much more prevalent than previously hypothesized.
We analyzed the Linux kernel, looking for speculative type confusion.
Found new types of speculative type confusion.

Polymorphic type
confusion

Attackerintroduced:
eBPF

Compilerintroduced

eBPF: Speculative Type Confusion

eBPF
Linux subsystem, enabling user-defined programs in kernel.

eBPF bytecode

Static verification
Verifier

Bounds check bypass mitigations
Compiler

Native Code

eBPF verifier vulnerability

r0 == 0

Flows considered by eBPF verifier
r0 == 1

otherwise

eBPF verifier vulnerability
Speculative flows are not verified
Predicted "false" Predicted "false"

Training mutually exclusive branches

CPU

Branch Predictor

Can both be false

Mutually exclusive

Unprivileged process can read arbitrary Shadow gadget memory addresses at a rate of ~6.5 KB/sec

Compiler Introduced Speculative Type Confusion

Compilers might create speculative type confusion
(trusted) ptr argument held in x86 register %rsi

attackercontrolled

Innocent looking code is compiled in a way that inroduces vulnerability
Compiler reasoning: Branches are mutually exclusive

code during which x moves to %rsi

Can we find it in the wild?

Binary level analysis of Linux.

Focused on system calls, which have well-defined user-controlled interface.

Leakage mechanism is out of scope: aiming at finding speculative attacker-controlled memory dereference.

compiler

flags

GCC 9.3.0

-Os

GCC 9.3.0

-O3

GCC 5.8.2

-Os

GCC 5.8.2

-O3

# vulnerable syscalls 20 2 0 0

Reusing registers for a function call

C pattern Emitted x86 code

rdi != 0  rdi = stack var
rdi == 0  reuse rdi

Reusing registers for a function call

C pattern Emitted x86 code

rdi != 0  rdi = stack var
rdi == 0  reuse rdi

Stack slot reuse
Out param

Allocated with 1-byte opcode rather than by subtraction (4-bytes), by chance contains usercontrolled value

Loads value from stack

Small change  exploitable Hard to reason about
Overwrites out param in any case

Speculative Polymorphic Type Confusion

Spectre v2 mitigations

Spectre v2 exploits misprediction of indirect branch target addresses
Retpolines: block indirect branch prediction
Optimization: restrict speculation to valid targets [Linux, Amit et al., 2019]Might create speculative type confusion vulnerabilities

Indirect branch

Direct branch to retpoline thunk

Jump to correct destination

Speculative polymorphic type confusion
foo_B()

Speculative polymorphic type confusion
Buser_controlled_scalar
foo_B()

Analysis

· Linux code analysis - looking at ways in which Analysis polymorphism can lead to speculative type confusion

Results

· Thousands - flagged potentially vulnerable
· Hundreds - "array indexing" instances
· All - limited speculation window or limited control on user value

Conclusion

Analysis

· Linux code analysis - looking at ways in which Analysis polymorphism can lead to speculative type confusion

Results

· Flagged potentially vulnerable: 1000s · "Array indexing" instances: 100s · All ­ not exploitable(?) E.g., limited user value control

Conclusion

Results example

... max_freq values are limited

Mispredicted target

Actual target

Analysis

· Linux code analysis - looking at ways in which Analysis polymorphism can lead to speculative type confusion

Results

· Thousands - flagged potentially vulnerable
· Hundreds - "array indexing" instances
· All - limited speculation window or limited control on user value

· Were a conditional branch-based mitigation used instead of retpolines, the kernel's security would be
Conclusion on shaky ground

Limitations / future work
Our analyses are PoC. Not exhaustive, have false positives, and false negatives. Much room for improvement! More vulnerabilities.

Spectre v1 software mitigation

Spot (manual, Linux-style)

SLH overhead on Linux syscalls

Complete (compiler-based) E.g.: LLVM SLH

Problem: High overhead

Hardware support might be required?

Summary

Analysis

Polymorphic type
confusion

Attackerintroduced:
eBPF

Compilerintroduced

Conclusion
Speculative type confusion is prevalent, hard to detect

Takeaways
More bugs Rethink Spectre v1 mitigations

