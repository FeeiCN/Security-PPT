Everything has Changed in iOS 14, but Jailbreak is Eternal
Zuozhi Fan (@pattern_F_)
#BHUSA @BlackHatEvents

About me
· Fan, Zuozhi (@pattern_F_) · Ant Security, Tianqiong Lab · Started macOS/iOS security from the second half of 2019 · speaker of Black Hat ASIA 2021
#BHUSA @BlackHatEvents

About the talk
· ModernPwner released the first workable iOS 14 kernel exploit. Opened a new chapter of iOS 14 jailbreak.
· I published a stable kernel r/w primitive firstly · I will show how to run unauthorized code on iOS 14 · This talk is about my iOS 14 learning journey
#BHUSA @BlackHatEvents

iOS 14 vs iOS 13
#BHUSA @BlackHatEvents

Why it's so hard to pwn iOS 14
· New mitigations introduced in iOS 14
kernel heap hardening data PAC userspace PAC hardening tfp0 hardening ipc_kmsg hardening etc.
· Some works on the vulnerability stage · Some works on the exploit stage
#BHUSA @BlackHatEvents

kernel heap isolation
· kheap isolation is not new, but is hardened massively
· try to stop UAF (overlap freed object with different objects)
· kalloc heap is split into 4 types · kernel objects and kext objects can't see each other
#BHUSA @BlackHatEvents

kheap isolation hardening
· OSData & OSString contents are moved into DATA heap (no pointer or offset). Reduce the risk to build fake object.

· More and more kobjects are moved into dedicate zones (they are disappeared in common heap)

· kheap in iOS 14 is fine-grained

#BHUSA @BlackHatEvents

data PAC
· Data PAC: newly introduced in iOS14 · Signing strategy: discriminator(string hash) + memory address
· can't touch any bits of the data pointers · can't use the pointer in other places
· code PAC - control-flow integrity · data PAC - data integrity
#BHUSA @BlackHatEvents

data PAC, not only pointers
· Using DB key to sign uint32

· Using GA key to sign blob (multi bytes)
· ptrauth_utils_sign_blob_generic
· PAC is a victory for black-box

#BHUSA @BlackHatEvents

userspace PAC hardening
· In iOS 13, attackers can forge A-key protected function pointers in other process
· The A keys are used for primarily "global" purposes. These keys are sometimes called process-independent.
· Apple decides to break the definition of A keys. Now IA key also becomes process-dependent.
· Try to stop cross-process attack
· PAC document leaked?
· xnu-7195.60.75/doc/pac.md · xnu-7195.81.3/doc/pac.md [deleted]
· But jailbreak also need to control other process, i.e. amfid · With kernel r/w, it is possible to bypass it
#BHUSA @BlackHatEvents

tfp0 hardening
· tfp0, the most convenient way to achieve kernel r/w
· With Ian Beer's fake port technique, almost every kernel exploit tries to build a tfp0
· For PAC(A12+) devices, add PAC to protect kernel_task · For pre-A12 devices, add checks to prevent userspace to resolve
kernel_task / to use kernel_pmap · We must find alternatives of tfp0 to achieve kernel r/w
#BHUSA @BlackHatEvents

kmsg, an exploit-friendly kobject
· Not only heap spray · With kmsg, you can convert a two-byte heap overflow (in
kalloc_large area) to a full exploit · characteristics of ipc_kmsg
· variable-sized · link pointer (self location ability)
· key idea
· modify ikm_size to free more memory
· kmsg lives in
· zone ipc.kmsgs (size 256) · kalloc.288 ~ (size > 256)
#BHUSA @BlackHatEvents

exploit based on kmsg is dead
· ipc_kmsg was hardened in iOS 14.2
· control part went to zone · data part went to KHEAP_DATA
· Apple's smart idea, destroy the essential exploit primitives
· RIP my first iOS kernel bug.
· Without ipc_kmsg, I'm not able to exploit it. It only works on iOS 14.1.
· I can't find an alternative to kmsg yet
#BHUSA @BlackHatEvents

the first public iOS 14 kernel exploit
· CVE-2021-1782: A race condition in user_data_get_value() leading to ivac entry UAF
· Fixed in iOS 14.4Jan 26, 2021 · Synacktiv's blog post details this vuln, Feb 10 [link] · ModernPwner published a workable exploit cicuta_virosa, with
kernel r/w, Feb 10 [link]
#BHUSA @BlackHatEvents

r/w primitives by cicuta_virosa
· Why pktopts? Why not OSData, or kmsg to lay out kheap? - kheap isolation · limitation 1: The kernel r/w relies on free-realloc operation to fill the
memory hole. That's not very stable. You can't use this frequently.
#BHUSA @BlackHatEvents

write_20 limitation of cicuta_virosa
· write_20 failed sometimes, why? · bsd/netinet6/ip6_output.c · ipi6_ifindex < if_index

· limitation 2: write_20 writes 16-byte data plus 4-byte 0

#BHUSA @BlackHatEvents

we need new r/w primitives
· We must build stable & unlimited kernel r/w primitives · Before, we had tfp0, the perfect kernel r/w
· mach_vm_read_overwrite / mach_vm_write · mach_vm_allocate / mach_vm_deallocate
· Now bye bye tfp0 - tfp0 hardening · Let's find new r/w primitives, not write limited, and stable · Key idea: transform other kernel object that can be easily
accessed from userspace
#BHUSA @BlackHatEvents

IOSurface
· "Exploiting IOSurface 0", by Chen Liang [link] · IOSurface is a good candidate · IOSurface is frequently used in kernel exploit
· heap spray, leak memory info, or forge kobjects
· lots of external methods
#BHUSA @BlackHatEvents

IOSurface in userspace
· userspace: surface ID · IOSurface.dylib: IOSurfaceSetValue(IOSurfaceRef, ...)
#BHUSA @BlackHatEvents

s_set_indexed_timestamp

· If we control ptr IOSurface.field_360, we get an 8-byte write · write address: IOSurface.field_360 · call chain: does not touch any other class field, no side effect · I think write_20 (16-byte data + 4-byte 0) is ok

#BHUSA @BlackHatEvents

s_get_ycbcrmatrix

· If we control ptr surface, we get an 4-byte read · read address: IOSurfaceClient.surface + 0xb4 · call chain: does not touch any other class field, no side effect · I think write_20 (16-byte data + 4-byte 0) is ok

#BHUSA @BlackHatEvents

shared memory with kernel
· If it's possible, I choose shared memory to modify kernel data. Convenient!
#BHUSA @BlackHatEvents

stable kernel r/w primitive
· convert read_20/write_20 to stable kernel r/w · use it as the alternative of tfp0 · share the kernel r/w with other process, libkrw by Siguza [link]
#BHUSA @BlackHatEvents

post-exploit
· Let's do the "jailbreak" thing · my goal - execute unauthorized code (binary) · Just porting FreeTheSandbox, by ZecOps [link], to cicuta_virosa · Solve the troubles I met in the porting progress
#BHUSA @BlackHatEvents

disable sandbox
· Just nullify the sandbox slot · fork()/execve(), posix_spawn()
· a "flaw" in data PAC · nullptr is not signed or checked · It is safe to null any data
pointer (in most cases) · For performance considerations -
memset(kobject, 0) & .bss

#BHUSA @BlackHatEvents

TrustCache? CoreTrust?
· CoreTrust's purpose is to thwart the common technique of "fake-signing" (known to jailbreakers as "ldid -S" or "jtool --sign"), which is often used to deploy arbitrary binaries to a jailbroken device. - iOS internals
· Sign stuff with a cert (it could be any kind of cert, free, paid, expired or revoked, as long as it comes from Apple it's good) - Jake James's paper
· For real jailbreak tools, it's better to bypass CoreTrust, or you need to sign the binaries immediately after you installed a package
· We need kernel PAC bypass to do the kcall things, or PPL bypass
#BHUSA @BlackHatEvents

amfid bypass
· task port + task_set_exception_ports · Let's write a debugger for amfid!
#BHUSA @BlackHatEvents

entitlements hack
· task_for_pid needs entitlement "task_for_pid-allow" · FreeTheSandbox borrows p_ucred from other process, then we have
the same entitlements with that process. · /usr/sbin/spindump has that entitlement
#BHUSA @BlackHatEvents

data PAC everywhere?
· But, almost everything is protected by PAC! · Let's lock at the low-level data structure · Entitlements are stored in OSDictionary. dictEntry is not PAC'd!
#BHUSA @BlackHatEvents

build entitlements library
· Entitlements of MAC label is stored in OSDictionary · Properties attached to IOSurface is stored in OSDictionary too · So, we can put all the entitlements we need into the IOSurface
values in advance

· IOSurface is really a treasure!

#BHUSA @BlackHatEvents

amfid bypass, the last trouble
· We got task port of process amfid
· task_set_exception_ports - install an exception handler (I'm a debugger) · vm_write - check and modify amfid's memory · thread_set_state - control amfid's registers
· Steps to bypass amfid
· Redirect MISValidateSignatureAndCopyInfo to invalid address · Catch the exception · Calculate the right CDHash to satisfy AMFI check · thread_state_t.__opaque_pc = pacia < return address >, resume amfid
· iOS 13 - OK, iOS 14 - fail!
#BHUSA @BlackHatEvents

userspace PAC magic
· operations behind thread_set_state

· thread_set_state will use target thread's jop_pid to decode the pc we specified

· PAC IA key: jop_pid

· amfid uses a different IA key - userspace PAC hardening

· So amfid got an invalid pc (signed by our own IA key), then it crushes again

· We must sign the pc register with amfid's IA key

#BHUSA @BlackHatEvents

userspace PAC hack (1)
· operations behind thread_get_state
· So,
· thread_set_state - auth pc register · thread_get_state - sign pc register
 · If we steal amfid's IA key...
· With kernel r/w, we know what amfid's IA key (machine.jop_pid) is. Let's use some tricks to calc a correct (amfid) signed pc.
#BHUSA @BlackHatEvents

userspace PAC hack (1)
· Sacrifice a dummy thread. No side effect if we suspend it.
#BHUSA @BlackHatEvents

userspace PAC hack (2)
· I found a mig call by accident - thread_convert_thread_state · A perfect "bypass" · No kernel r/w required, if you can get target's thread port
#BHUSA @BlackHatEvents

userspace PAC hack (2)
· This "bypass" is simple.
· This API is useless, except that you debug a process that doesn't belong to you
#BHUSA @BlackHatEvents

amfid bypass, done
· Steps to bypass amfid
· Redirect MISValidateSignatureAndCopyInfo to invalid address · Catch the exception · Calculate the right CDHash to satisfy AMFI check · thread_state_t.__opaque_pc = pacia(amfid) < return address >, resume amfid
· iOS 14 - OK!
#BHUSA @BlackHatEvents

Put them all together

source code: https://github.com/pattern-f/TQ-pre-jailbreak

#BHUSA @BlackHatEvents

Summary
· Maybe iOS 14 is the most secure iOS ever
· kheap isolation - kill vulnerabilities · data PAC - kill exploit primitives
· Jailbreak is unstoppable, but high-quality bugs are required · I learned everything from the community. cicuta_virosa gives me
the opportunity to contribute to iOS hack community. · TQ-pre-jailbreak is fully open source now. Hope this is helpful
to researchers.
#BHUSA @BlackHatEvents

Thanks~
Find the code on https://github.com/pattern-f email: pattern_f[at]163.com
#BHUSA @BlackHatEvents

