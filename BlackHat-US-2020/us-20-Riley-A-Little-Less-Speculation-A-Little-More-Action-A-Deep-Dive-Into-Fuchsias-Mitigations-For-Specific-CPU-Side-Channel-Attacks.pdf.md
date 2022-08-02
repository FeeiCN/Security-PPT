mitigating speculative execution side-channel vulnerabilities in Fuchsia Matthew Riley mattdr@google.com @mdriley25519
1

opening credits
Venkatesh Srinivas Anthony Steinhauser
2

read the fine manuals
3

obligatory collage of ATTACK LOGOS
4

Pink + Purple == Fuchsia (a new Operating System)
fuchsia.dev
https://fuchsia.dev https://fuchsia.googlesource.com
5

out-of-order execution
6

branch prediction
7

branch prediction ­ success
8

branch prediction ­ oh no
9

optimism

mov

ecx, dword ptr [rax]

10

c

c

h

h

a

a

n

n

n

n

e

e

l

l

Sorry.

11

https://en.wikipedia.org/wiki/Van_Eck_phreaking 12

https://www.daemonology.net/papers/htt.pdf https://cr.yp.to/antiforgery/cachetiming-20050414.pdf
13

speculative leak via cache side-channel
14

speculative leak via cache side-channel
https://googleprojectzero.blogspot.com/2018/01/reading-privileged-memory-withside.html https://spectreattack.com/spectre.pdf
15

on the docket

· Meltdown · ret2spec · Spectre V2 · L1 terminal fault · Microarchitectural data sampling · Spectre V1

16

meltdown

VULNERABILITY DETAILS

other names

Spectre variant 3 Rogue data cache load (Intel)

processors affected Intel, some ARM (e.g. Cortex-A75)

methods of attack User to kernel

impact

Attacker can read arbitrary kernel memory

cause

Page faults during speculative execution are delayed until instruction retirement. Until then, illicitly read values are forwarded to dependent instructions.

https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5754 https://en.wikipedia.org/wiki/Meltdown_(security_vulnerability) https://arxiv.org/pdf/1801.01207.pdf https://software.intel.com/security-software-guidance/software-guidance/roguedata-cache-load https://gruss.cc/files/kaiser.pdf https://msrc-blog.microsoft.com/2018/03/23/kva-shadow-mitigating-meltdown-onwindows/

17

meltdown ­ mitigation
KAISER, aka: · kernel page table isolation (KPTI) · kernel virtual address (KVA) shadow Split process page tables into user and kernel views · User doesn't see kernel (almost) at all · Kernel sees user as NX Requires PCID or ASID to avoid performance-killing TLB flushes
18

ret2spec

VULNERABILITY DETAILS

other names

SpectreRSB

processors affected Intel, AMD, ARM

methods of attack

Cross-process User to kernel Cross-VM VM to hypervisor

impact

Attacker can hijack speculative execution from function return to address of their choice

cause

Return stack buffer becomes unbalanced due to context switch. Function returns in new task predicted to go to return addresses pushed by previous task.

https://christian-rossow.de/publications/ret2spec-ccs2018.pdf https://www.usenix.org/system/files/conference/woot18/woot18-paper-koruyeh.pdf

19

ret2spec ­ mitigation
Fill RSB any place it can become unbalanced · Context switch · VM exit Kernel entry is safe
20

interlude: indirect branch prediction

void f(Base *x) { x->Method();
}

class Derived1 : public Base { public:
virtual void Method() {} };
class Derived2 : public Base { public:
virtual void Method() {} };

21

spectre variant 2

VULNERABILITY DETAILS

other names

Branch target injection

processors affected Intel, AMD, ARM

methods of attack

Cross-process User to kernel Cross-VM VM to hypervisor

impact

Attacker can hijack speculative execution from indirect branch to address of their choice

cause

Collisions can be induced in branch target buffer across security contexts

https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5715 https://support.google.com/faqs/answer/7625886 https://software.intel.com/security-software-guidance/insights/deep-dive-retpolinebranch-target-injection-mitigation https://software.intel.com/security-software-guidance/insights/deep-dive-indirectbranch-restricted-speculation https://software.intel.com/security-software-guidance/insights/deep-dive-singlethread-indirect-branch-predictors https://developer.amd.com/wpcontent/resources/Architecture_Guidelines_Update_Indirect_Branch_Control.pdf https://trustedfirmware-a.readthedocs.io/en/latest/security_advisories/securityadvisory-tfv-6.htm

22

spectre variant 2 ­ mitigation (x86)
retpoline

# Implement indirect branch to r11

__llvm_retpoline_r11:

call .L2

# push .L1 on RSB

.L1:

pause

# annotate spinlock

lfence

# try to end speculation

jmp

.L1

# loop forever

.L2:

mov

qword ptr [rsp], r11 # overwrite return address

ret

# send speculation to .L1

# (real execution goes to r11)

23

spectre variant 2 ­ mitigation (x86)
using retpoline

clang kernel.cc -mretpoline

transforms call

qword ptr [rcx]

into
mov call

r11, qword ptr [rcx] __llvm_retpoline_r11

24

spectre variant 2 ­ mitigation (x86)
cross-process and cross-vm protection
Indirect Branch Predictor Barrier (IBPB) Clear predictor state for logical processor; used on process/VM switch Single Thread Indirect Branch Predictor (STIBP) Prevent interference between threads on a core
25

spectre variant 2 ­ mitigation (x86)
doing better than retpoline
Indirect Branch Restricted Speculation (IBRS) · Prevents code at lower privilege from interfering with indirect branch
targets predicted by higher privilege that runs after the command · Must be triggered on every switch to higher privilege · DOES NOT protect across processes or VMs
26

spectre variant 2 ­ mitigation (x86)
doing better than "better than retpoline"
Enhanced IBRS · "Sticky" IBRS ­ only needs to be enabled once · Only safe if used with Supervisor-Mode Execution Prevention (SMEP)
27

spectre variant 2 ­ mitigation (arm)
· One big hammer: enter EL3, clear everything. · Requires updated ARM Trusted Firmware · Used on
· Context switch · "exception entry from an exception level where it is judged that code might
be used to attack a higher level" (?) Linux+Fuchsia: whenever a process faults trying to jump into kernel code
· Only safe if user code mapped "privileged execute never" (PXN)
28

L1 terminal fault (L1tf)

VULNERABILITY DETAILS

other names

Foreshadow

processors affected Intel

methods of attack

User process can attack whole system (depending on OS) Cross-VM VM to hypervisor

impact

Attacker can read any data in L1 cache

cause

Address translation aborts early on invalid page table entry. Physical address from the invalid PTE is used as-is for speculative execution, bypassing all further translation.

https://software.intel.com/security-software-guidance/insights/deep-dive-intelanalysis-l1-terminal-fault https://docs.microsoft.com/en-us/virtualization/community/teamblog/2018/20180814-hyper-v-hyperclear-mitigation-for-l1-terminal-fault

29

nothing that more indirection can't solve
guest virtual address guest physical address host physical address
sgx and smm show up here too, but aren't important for our story
30

indirection indiscretion!
guest virtual address guest physical address host physical address
sgx and smm show up here too, but aren't important for our story
31

L1 terminal fault (L1tf) ­ mitigation
Against hostile processes Don't leave a valid physical address in invalid PTEs Against hostile VMs Don't leave anything in L1D to leak
32

L1 terminal fault (L1tf) ­ mitigation
Against hostile VM coscheduled on the same physical core Nope. Have to keep that from happening. · Disable SMT · Core scheduling
33

microarchitectural data sampling (mds)

VULNERABILITY DETAILS

other names

Fallout Zombieload Rogue In-Flight Data Load (RIDL) Microarchitectural Store Buffer Data Sampling (MSBDS) Microarchitectural Fill Buffer Data Sampling (MFBDS) Microarchitectural Load Port Data Sampling (MLPDS) Microarchitectural Data Sampling Uncacheable Memory (MDSUM)

processors affected Intel

methods of attack

User process can attack whole system (depending on OS) Cross-VM VM to hypervisor

impact

Attacker can read data recently read or written by any code on the same physical core

cause

Stale data is made available for speculative execution from buffers allocated for "halfdone" memory and IO operations

https://software.intel.com/security-software-guidance/insights/deep-dive-intelanalysis-microarchitectural-data-sampling https://googleprojectzero.blogspot.com/2020/02/escaping-chrome-sandbox-withridl.html https://twitter.com/cpuGoogle/status/1254178356322398208?s=20

34

mds ­ mitigation
Against hostile processes or VMs Newly magic VERW instruction clears buffers before returning control Against hostile processes or VMs on adjacent hyperthread Nope. Disable SMT or use core scheduling1.
1nobody does this for processes. yet.
35

spectre variant 1

VULNERABILITY DETAILS

other names

Bounds check bypass Speculative type confusion

processors affected Intel, AMD, ARM

methods of attack

Any IPC service can be attacked User to kernel VM to hypervisor Across Network (NetSpectre)

impact

Attacker can induce misspeculation across legitimate control-flow edges to violate type and/or memory safety and leak otherwise-inaccessible memory

cause

Branch prediction can be wrong sometimes

https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5753 https://llvm.org/docs/SpeculativeLoadHardening.html https://arxiv.org/abs/1905.10311

36

spectre variant 1 ­ example
int GetBufferHeader(int user_provided_buffer_index) { if (user_provided_buffer_index >= num_buffers) { return -ENOWAY; } // Buffers are allocated as pages int page_index = page_index_from_buffer[user_provided_buffer_index]; return *(page_base + page_index * PAGE_SIZE);
}
37

spectre variant 1 ­ mitigation

// (x < y) ? a : b

static inline size_t conditional_select_nospec_lt(

size_t x, size_t y, size_t a, size_t b) {

size_t select = a;

// Choose `a` to start

__asm__(

"cmp %2, %1\n"

// Compare `x` and `y`

"cmovae %3, %0\n" // if `x` >= `y`, choose `b` instead

: "+r"(select)

: "r"(x), "r"(y), "r"(b)

: "cc");

return select; }

38

spectre variant 1 ­ mitigation example

int GetBufferHeaderSafe(int user_provided_buffer_index) { if (user_provided_buffer_index >= num_buffers) { return -ENOWAY; }

// safe_index = (x < y) ? a : b int safe_index = conditional_select_nospec_lt(user_provided_buffer_index,
num_buffers, user_provided_buffer_index, 0);
// Buffers are allocated as pages int page_index = page_index_from_buffer[safe_index]; return *(page_base + page_index * PAGE_SIZE); }

// x // y // a // b

39

good LFENCEs make good neighbors
Speculation barrier Wait for all prior instructions to complete before any subsequent instruction can begin executing.
x86 LFENCE
(requires an MSR tweak on AMD)
ARM DSB; ISB (anywhere) SB (ARMv8.5+)
https://github.com/google/safeside/blob/main/docs/fencing.md
40

looking back,
thinking forward

· Meltdown split page tables
· ret2spec RSB fill
· Spectre V2 compiler changes, crazy MSRs
· L1 terminal fault flush L1 cache, core scheduling
· Microarchitectural data sampling flush buffers, more core scheduling
· Spectre V1 conditional moves, magic amulets?

41

putting our mitigations to the test(s)
github.com/google/safeside
42

wrapping up
43

keeping up

Read everything, from everyone
Look at Linux
Test!

44

Matthew Riley
mattdr@google.com @mdriley25519 github.com/google/safeside

twitter.com/ellism

Resources that didn't fit on just one slide:
https://developer.arm.com/support/arm-security-updates/speculative-processorvulnerability/download-the-whitepaper https://developer.amd.com/wp-content/resources/90343B_SoftwareTechniquesforManagingSpeculation_WP_7-18Update_FNL.pdf https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/index.html

45

