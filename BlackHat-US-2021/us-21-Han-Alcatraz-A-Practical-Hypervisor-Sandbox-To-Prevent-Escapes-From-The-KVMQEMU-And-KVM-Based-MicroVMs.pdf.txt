Alcatraz:
A Practical Hypervisor Sandbox to Prevent Escapes from the KVM/QEMU and KVM-Based MicroVMs

Seunghun Han hanseunghun@nsr.re.kr
Sungjung Kim, Gaksoo Lim, Byungjoon Kim (sungjungk || daygax || bjkim)@nsr.re.kr

#BHUSA @BlackHatEvents

Who Am I?
- Senior security researcher at the Affiliated Institute of ETRI - Review board member of Black Hat Asia and KimchiCon - Speaker at USENIX Security, Black Hat Asia/Europe,
HITBSecConf, BlueHat Shanghai, TyphoonCon, KimmchiCon, BECS, etc. - Author of "64-bit multi-core OS principles and structure, Vol.1&2" - Debian Linux maintainer and Linux kernel contributor - a.k.a kkamagui, @kkamagui1

Goal of This Talk
- I present escape paths of KVM/QEMU and KVM-based microVMs
- KVM-based hypervisors are widely used from VMs to containers - KVM has higher privilege than the kernel and can be used for escapes
- I introduce a new tool, Alcatraz, to prevent escapes
- It downgrades KVM's privilege (Ring -1) to the guest hypervisor (Ring 0) - It makes a sandbox for the KVM and monitors system calls to prevent
escapes - Process creation, kernel code modification, and privilege escalation

Once upon a time, there was ...

SMALL YOUNG

New CSO

CTO

CEO

RESEARCHER!

Managers

There was JUST a security researcher
(not a CEO or CTO, not even a new CSO or manager)

A New Era of Cloud Platforms has come

DevOps
VM-based Technology

Serverless
Container-based Technology

A New Era of Cloud Platforms has come

IMAGINE

DevOps

Serverless

VM-based CONTAINER WORLCD ontainer-based

Technology

Technology

Virtual Machine (VM) vs Container (1)

VM Applications
Guest OS

VM Applications
Guest OS

Hypervisor Host OS
Hardware and Firmware
Virtual Machine Architecture

Container
Applications
Supporting Files and Runtime

Container
Applications
Supporting Files and Runtime

Host OS Hardware and Firmware
Container Architecture

Virtual Machine (VM) vs Container (1)

Isolation

VM

VM

Container

Container

Applications

Applications

Applications Applications

Guest OS

Guest OS

Hypervisor

Supporting Files and Runtime

Supporting Files and Runtime

Host OS

Host OS

Hardware and Firmware
Virtual Machine Architecture

Hardware and Firmware
Container Architecture

Virtual Machine (VM) vs Container (1)

VM

VM

Container

Container

Applications

Applications

Applications Applications

Guest OS

Guest OS

Hypervisor

Supporting Files and Runtime

Supporting Files and Runtime

Host OS

Execution

Host OS

Environment

Hardware and Firmware

Hardware and Firmware

Virtual Machine Architecture

Container Architecture

Virtual Machine (VM) vs Container (2)
- Virtual machine architecture
- uses Virtual Machine Monitor (VMM), a.k.a. hypervisor - provides strong isolation with virtualized hardware
- A guest OS is needed, and performance overhead is high - has each execution environment, such as kernel and user space
- Container architecture
- uses namespace and cgroup features of Linux kernel - provides weak isolation with the kernel
- Supporting files are needed, and performance overhead is low - shares the kernel and has its own user space only

The container is good, but the problem is ...

Host User Space

Container

Container

Host Services
and Applications

Applications
Supporting Files and Runtime

Applications
Supporting Files and Runtime

(Shared) Host Kernel Hardware and Firmware
Container Architecture

Containers are indispensable!
But, strong isolation is needed to prevent the ESCAPES

Container

Hypervisor

Container

Hypervisor

IMAGINE

CONTAIN... WHAT?!

To be or not to be,
that is the question
- William Shakespeare
So, the security researcher realized ...

To be a container or not to be a container,
that is the question
- Anonymous Researcher
The REAL question is ...
How can we prevent escapes?

FOR THE SOLUTION!

ALCATRAZ

- Background - Analysis of Critical Paths of Escapes - Design and Implementation of Alcatraz - Evaluation and Demo - Conclusion and Black Hat Sound Bytes

- Background - Analysis of Critical Paths of Escapes - Design and Implementation of Alcatraz - Evaluation and Demo - Conclusion and Black Hat Sound Bytes

Kata Container
Kata Container

(Container)
(KVM)
Kata Architecture - Kata Containers: An Emerging Architecture for Enabling MEC Services in Fast and Secure Way

KVM/QEMU, Firecracker, and more

Amazon Firecracker
MicroVM
(Minimal Set for a Serverless Compute
Service)
Firecracker
(written in Rust)
The Security Model of Linux Containers - Firecracker: Lightweight Virtualization for Serverless Applications

Google gVisor

Kernel

File Service

gVisor
(Minimal Set of Kernel and File Services)

An OCI runtime powered by gVisor-Container Isolation at Scale (... and introducing gVisor)

Kernel-based Virtual Machine (KVM)

Host User Space
VM Software

VM Software

Application ...

Guest User Space
Guest Kernel

Guest User Space
Guest Kernel

Ring 3

Ring 0

Host Kernel

KVM

Firmware

SMM

Hardware

Ring -1
Ring -2

Kernel-based Virtual Machine (KVM)

SOMETHING

Host User Space
VM Software

VM Software

Application ...

Guest User Space
Guest Kernel

Guest User Space
Guest Kernel

SUSPICIOUS!

Ring 0

Host Kernel

KVM

Ring 3
Ring -1

Firmware

SMM

Hardware

Ring -2

A hypervisor attaches to VMs tightly It has Ring -1 privilege!
The attacker can escape from the VM with a KVM vulnerability
(and subvert the system)

Fortunately,
I was not the only one who was worried about
the excessive privilege of a hypervisor!
YA!!
I HAVE FRIENDS

Firmware Modification

Firmware Modification

Firmware Modification

Hypervisor Retrofit

Firmware Modification

Firmware Modification

YA!!

Firmware ModificatioInHHAAVDE FRIENDSHypervisor Retrofit
I need a more PRACTICAL solution!

The Solution: Sandboxing Hypervisor

Host User Space

VM Software

VM Software

Application ...

Guest User Space
Guest Kernel

Guest User Space
Guest Kernel

Ring 0

Host

Kernel

KVM

Ring -1

Firmware

SMM

Hardware

Application

Host User Space

VM Software

Guest

...

User Space

Guest Kernel

VM Software
Guest User Space
Guest Kernel

Tailored

Ring 0

Host Kernel Sandboxing

KVM

Ring -1

Hyper-Box

(Hypervisor for Monitoring)

Firmware

SMM Hardware

The Solution: Sandboxing Hypervisor

Host User Space

VM Software

VM Software

Application ...

Guest User Space
Guest Kernel

Guest User Space
Guest Kernel

Ring 0

Host

Kernel

KVM

Ring -1

Firmware

SMM

Hardware

Application

Host User Space

VM Software

Guest

...

User Space

Guest Kernel

VM Software
Guest User Space
Guest Kernel

Tailored

Ring 0

Host Kernel Sandboxing

KVM

Ring -1

Hyper-Box

(Hypervisor for Monitoring)

Firmware

SMM Hardware

- Background - Analysis of Critical Paths of Escapes - Design and Implementation of Alcatraz - Evaluation and Demo - Conclusion and Black Hat Sound Bytes

CVE-2021-22543: Improper page handling of KVM, privilege escalation CVE-2021-20181: TOCTOU in 9pfs of QEMU, privilege escalation CVE-2021- 3546: OOB in VIRTIO in QEMU, code execution CVE-2021- 3409: OOB in SDC of QEMU, code execution CVE-2020-35506: UAF in SCSI of QEMU, code execution CVE-2020-17380: OOB in SDC of QEMU, code execution CVE-2020-15863: OOB in NET of QEMU, code execution CVE-2020-14364: OOB in USB of QEMU, code execution CVE-2020- 1711: OOB in iSCSI of QEMU, code execution CVE-2019-18389: OOB in VIRTIO-GPU in QEMU, code execution CVE-2019-14835: OOB in KVM, privilege escalation CVE-2019-14821: OOB in MMIO of KVM, privilege escalation CVE-2019- 7221: UAF in HR timer of KVM, code execution CVE-2018-16882: UAF in KVM, privilege escalation CVE-2018-16847: OOB in NVME of QEMU, code execution CVE-2018-12904: Improper VMX handling of KVM, privilege escalation CVE-2018-10901: Improper GDT handling of KVM, privilege escalation CVE-2018- 1087: Improper stack switching of KVM, privilege escalation CVE-2017-12188: Improper page handling of KVM, code execution CVE-2017- 7980: OOB in display of QEMU, code execution CVE-2017- 5931: Integer overflow in VIRTIO of QEMU, code execution CVE-2017- 5667: OOB in SDC of QEMU, code execution CVE-2017- 2630: Stack overflow in NBD of QEMU, code execution CVE-2017- 2620: OOB in display of QEMU, code execution CVE-2017- 2615: OOB in display of QEMU, code execution CVE-2016-10150: UAF in KVM, local privilege escalation CVE-2016- 9777: Improper IOAPIC handing in KVM, privilege escalation CVE-2016- 9603: OOB in display of QEMU, code execution CVE-2016- 7161: OOB in NET of QEMU, code execution CVE-2016- 6351: OOB in SCSI of QEMU, code execution CVE-2016- 5338: OOB in SCSI of QEMU, code execution CVE-2016- 5126: OOB in iSCSI of QEMU, code execution CVD-2016- 4440: Improper APICv handling of KVM, code execution CVE-2016- 4439: OOB in SCSI of QEMU, code execution CVE-2016- 4002: OOB in NET of QEMU, code execution CVE-2016- 3710: OOB in VESA VGA of QEMU, code execution CVE-2016- 1714: OOB in NVRAM of QEMU, code execution CVE-2016- 1586: OOB in IDE of QEMU, code execution

CVE-2016- 0749: OOB in SPICE of QEMU, code execution CVE-2015- 7512: OOB in NET of QEMU, code execution CVE-2015- 7504: OOB in NET of QEMU, code execution CVE-2015- 5279: OOB in NET of QEMU, code execution CVE-2015- 5278: OOB in NET of QEMU, code execution CVE-2015- 5260: OOB in SPICE of QEMU, code execution CVE-2015- 5225: OOB in VNC of QEMU, code execution CVE-2015- 5154: OOB in IDE of QEMU, code execution CVE-2015- 3456: OOB in FDC of QEMU (VENOM), code execution CVE-2015- 3214: OOB in PIT of QEMU, code execution CVE-2015- 3209: OOB in NET of QEMU, code execution CVE-2014- 8106: OOB in display of QEMU, code execution CVE-2014- 7840: OOB in migration function of QEMU, code execution CVE-2014- 3461: OOB in USB of QEMU, code execution CVE-2014- 0182: OOB in VIRTIO of QEMU, code execution CVE-2014- 0150: Integer overflow in VIRTIO-NET of QEMU, code execution CVE-2014- 0144: OOB in CLOOP of QEMU, code execution CVE-2014- 0049: OOB in KVM, code execution CVE-2013- 6399: OOB in VIRTIO of QEMU, code execution CVE-2013- 4544: OOB in NET of QEMU, code execution CVE-2013- 4587: OOB in KVM, local privilege escalation CVE-2013- 4542: OOB in SCSI of QEMU, code execution CVE-2013- 4541: OOB in USB of QEMU, code execution CVE-2013- 4540: OOB in GPIO of QEMU, code execution CVE-2013- 4539: OOB in Audio of QEMU, code execution CVE-2013- 4538: OOB in Display of QEMU, code execution CVE-2013- 4537: OOB in SDC of QEMU, code execution CVE-2013- 4536: OOB in PIC of QEMU, code execution CVE-2013- 4532: OOB in NET of QEMU, code execution CVE-2013- 4529: OOB in PCI of QEMU, code execution CVE-2013- 4527: OOB in HPET of QEMU, code execution CVE-2013- 4526: OOB in AHCI of QEMU, code execution CVE-2013- 4151: OOB in VIRTIO of QEMU, code execution CVE-2013- 4150: OOB in VIRTIO-NET of QEMU, code execution CVE-2013- 4149: OOB in VIRTIO-NET of QEMU, code execution CVE-2013- 4148: OOB in VIRTIO-NET of QEMU, code execution CVE-2013- 1943: Improper page handling of KVM, local privilege escalation CVE-2013- 0311: Improper descriptor handling of KVM, privilege escalation

CVE-2021-22543: Improper page handling of KVM, privilege escalation

CVE-2016- 0749: OOB in SPICE of QEMU, code execution

CVE-2021-20181: TOCTOU in 9pfs of QEMU, privilege escalation

CVE-2015- 7512: OOB in NET of QEMU, code execution

CVE-2021- 3546: OOB in VIRTIO in QEMU, code execution

CVE-2015- 7504: OOB in NET of QEMU, code execution

CVE-2021- 3409: OOB in SDC of QEMU, code execution

CVE-2015- 5279: OOB in NET of QEMU, code execution

CVE-2020-35506: UAF in SCSI of QEMU, code execution

CVE-2015- 5278: OOB in NET of QEMU, code execution

CVE-2020-17380: OOB in SDC of QEMU, code execution

CVE-2015- 5260: OOB in SPICE of QEMU, code execution

CVE-2020-15863: OOB in NET of QEMU, code execution CVE-2020-14364: OOB in USB of QEMU, code execution CVE-2020- 1711: OOB in iSCSI of QEMU, code execution

PLEASE TELL ME CVE-2015- 5225: OOB in VNC of QEMU, code execution CVE-2015- 5154: OOB in IDE of QEMU, code execution CVE-2015- 3456: OOB in FDC of QEMU (VENOM), code execution

CVE-2019-18389: OOB in VIRTIO-GPU in QEMU, code execution

CVE-2015- 3214: OOB in PIT of QEMU, code execution

CVE-2019-14835: OOB in KVM, privilege escalation

CVE-2015- 3209: OOB in NET of QEMU, code execution

CVE-2019-14821: OOB in MMIO of KVM, privilege escalation

CVE-2014- 8106: OOB in display of QEMU, code execution

CVE-2019- 7221: UAF in HR timer of KVM, code execution

CVE-2014- 7840: OOB in migration function of QEMU, code execution

CVE-2018-16882: UAF in KVM, privilege escalation

CVE-2014- 3461: OOB in USB of QEMU, code execution

CVE-2018-16847: OOB in NVME of QEMU, code execution

CVE-2014- 0182: OOB in VIRTIO of QEMU, code execution

CVE-2018-12904: Improper VMX handling of KVM, privilege escalation

CVE-2014- 0150: Integer overflow in VIRTIO-NET of QEMU, code execution

CVE-2018-10901: Improper GDT handling of KVM, privilege escalation

CVE-2014- 0144: OOB in CLOOP of QEMU, code execution

CVE-2018- 1087: Improper stack switching of KVM, privilege escalation CVE-2014- 0049: OOB in KVM, code execution

CVE-2017-12188: Improper page handling of KVM, code execution

CVE-2013- 6399: OOB in VIRTIO of QEMU, code execution

CVE-2017- 7980: OOB in display of QEMU, code execution

CVE-2013- 4544: OOB in NET of QEMU, code execution

CVE-2017- 5931: Integer overflow in VIRTIO of QEMU, code execution

CVE-2013- 4587: OOB in KVM, local privilege escalation

CVE-2017- 5667: OOB in SDC of QEMU, code execution

CVE-2013- 4542: OOB in SCSI of QEMU, code execution

CVE-2017- 2630: Stack overflow in NBD of QEMU, code execution

CVE-2013- 4541: OOB in USB of QEMU, code execution

CVE-2017- 2620: OOB in display of QEMU, code execution

CVE-2013- 4540: OOB in GPIO of QEMU, code execution

CVE-2017- 2615: OOB in display of QEMU, code execution

CVE-2013- 4539: OOB in Audio of QEMU, code execution

WHERE AM I, HUH? CVE-2016-10150: UAF in KVM, local privilege escalation
CVE-2016- 9777: Improper IOAPIC handing in KVM, privilege escalation

CVE-2013- 4538: OOB in Display of QEMU, code execution CVE-2013- 4537: OOB in SDC of QEMU, code execution

CVE-2016- 9603: OOB in display of QEMU, code execution

CVE-2013- 4536: OOB in PIC of QEMU, code execution

CVE-2016- 7161: OOB in NET of QEMU, code execution

CVE-2013- 4532: OOB in NET of QEMU, code execution

CVE-2016- 6351: OOB in SCSI of QEMU, code execution

CVE-2013- 4529: OOB in PCI of QEMU, code execution

CVE-2016- 5338: OOB in SCSI of QEMU, code execution

CVE-2013- 4527: OOB in HPET of QEMU, code execution

CVE-2016- 5126: OOB in iSCSI of QEMU, code execution

CVE-2013- 4526: OOB in AHCI of QEMU, code execution

CVD-2016- 4440: Improper APICv handling of KVM, code execution

CVE-2013- 4151: OOB in VIRTIO of QEMU, code execution

CVE-2016- 4439: OOB in SCSI of QEMU, code execution

CVE-2013- 4150: OOB in VIRTIO-NET of QEMU, code execution

CVE-2016- 4002: OOB in NET of QEMU, code execution

CVE-2013- 4149: OOB in VIRTIO-NET of QEMU, code execution

CVE-2016- 3710: OOB in VESA VGA of QEMU, code execution

CVE-2013- 4148: OOB in VIRTIO-NET of QEMU, code execution

CVE-2016- 1714: OOB in NVRAM of QEMU, code execution

CVE-2013- 1943: Improper page handling of KVM, local privilege escalation

CVE-2016- 1586: OOB in IDE of QEMU, code execution

CVE-2013- 0311: Improper descriptor handling of KVM, privilege escalation

Extracting Escape Paths from CVEs (1)
Code Execution with a KVM Vulnerability

- Executes code outside of a VM

Host User Space

- Small shellcode is used for creating a ROOT privilege process of a host - Process creation: Guest  Host

VM Software

... Application

Guest
User Space

VM Software
Guest
User Space

- Privilege escalation: Host user  root

Guest Kernel

Guest Kernel

- It is also possible to modify kernel or

KVM code - But, disabling security features are

Ring 0
Host Kernel

KVM

Ring -1

needed!

Firmware

SMM

Hardware

Extracting Escape Paths from CVEs (2)
Code Execution with a VM Vulnerability

- Also executes code outside of a VM
- A VM software has lots of code for services and hardware emulations - Full-featured VMs (QEMU) has a large code base - Others have smaller ones, but ...

Host User Space
VM Software

VM Software

... Application

Guest
User Space

Guest Kernel

Guest
User Space
Guest Kernel

- Small shellcode is used for creating a USER privilege process of a host - Process creation: Guest  Host - Privilege escalation is needed!

Ring 0
Host Kernel

KVM

Firmware

SMM

Hardware

Ring -1

Extracting Escape Paths from CVEs (3)
Privilege Escalation with a KVM Vulnerability

- Elevates the privilege of a VM
- A VM is a process and runs in the guest privilege of a host
- But, improper handlings give HOST privilege to the VM - Page tables, interrupts, registers, etc.

Host User Space
VM Software

VM Software

... Application

GuGeustest
 User Space
GuHesotst
Kernel

Guest
User Space
Guest Kernel

Break Through

- It is possible to create a root privilege process of a host and modify kernel code

Ring 0
Host Kernel

KVM

Firmware

SMM

Hardware

Ring -1

Extracting Escape Paths from CVEs (4)
Local Privilege Escalation with a KVM and VM Vuln.

- Elevates the privilege of a process

Host User Space

- Some KVM vulnerabilities can be exploited through /dev/kvm - It can be used to elevate privilege (and create a root privilege process)

Host User
 Application ...
Host Root

VM Software
Guest
User Space
Guest Kernel

VM Software
Guest
User Space
Guest Kernel

- Some VM vulnerabilities can be used

for privilege escalation if the VM or related daemon runs in root privilege

Ring 0
Host Kernel

KVM

Ring -1

- But, a VM usually runs in user

Firmware

SMM

privilege for security reasons

Hardware

OOB in VIRTIO-GPU of QEMU

OOB in FDC of QEMU

OOB in NET of QEMU

UAF in Timer of QEMU

So, critical paths of escapes are ...

KVM Vulnerability
VM Vulnerability

Code Execution
VM  Host Privilege Escalation
Local Privilege Escalation

VM  Host Process Creation
Host Kernel Code Modification
Host User  Root Privilege Escalation

So, critical paths of escapes are ...

Code Execution

KVM Vulnerability

VM  Host Privilege Escalation

VM Vulnerability

Local Privilege Escalation

No one knows

until the vulnerability is revealed

VM  Host Process Creation
Host Kernel Code Modification
Host User  Root Privilege Escalation

So, critical paths of escapes are ...

KVM Vulnerability
VM Vulnerability

Code
ExecutIioGnOT YOU
VM  Host Privilege Escalation
Local PrivFilIeNgAe LLY!!
Escalation

VM  Host Process Creation
Host Kernel Code Modification
Host User  Root Privilege Escalation
We can detect SYMPTOMS

- Background - Analysis of Critical Paths of Escapes - Design and Implementation of Alcatraz - Evaluation and Demo - Conclusion and Black Hat Sound Bytes

What is Alcatraz?
- Alcatraz is a practical hypervisor sandbox to prevent escapes
- It does not need SMM and retrofits of the hypervisor - It downgrades KVM's privilege and makes a sandbox with Intel VT
- Alcatraz consists of Hyper-box and tailored Linux kernel
- Hyper-box is a pico hypervisor made from scratch - It has core mechanisms for preventing escapes
- Tailored Linux kernel has only one system call interface for x86_64 - It narrows the attack surface and monitoring points

Hyper-Box (1)
- Makes a sandbox with the memory and register protection techniques
- It leverages the Extended Page Table (EPT) of Intel VT - Guest Physical Address (PA) are translated to host PA with EPT - EPT can prevent code and RO data modifications!
- It protects security-related bits of control registers (CRs) - Write Protect (WP) of CR0, Supervisor Mode Execution Protection (SMEP) of CR4
- Monitors system calls and prevents unauthorized behaviors
- It sets H/W breakpoints to the system call entry point, fork, exit, and cred functions - wake_up_new_task(), cgroup_release(), entry_SYSCALL_64(), and commit_creds()
- It detects and prevents unauthorized behaviors - code modification, process creation, and privilege escalation

Hyper-Box (2)
- Emulates VMX instructions for nested virtualization
- It downgrades KVM's privilege (Ring -1) to a guest hypervisor (Ring 0) - So, It has to emulate VMX instructions of KVM because Ring 0 cannot execute them
- However, performance overhead is high
- Uses VT features to reduce the performance overhead
- Virtual Machine Control Structure (VMCS) shadowing - It allows a guest hypervisor to execute VMREAD and VMWRITE directly - So, emulations or interventions are reduced!
- Virtual Process ID (VPID) - It gives unique ID to vCPU and Translation Lookaside Buffer (TLB) - It prevents TLB flushes when VMExit occurs!

Hyper-Box (2)
- Emulates VMX instructAioGnAsINf,oWr HnEeRsEteAdMvIi?rtualization
- It downgrades KVM's privilege (Ring -1) to a guest hypervisor (Ring 0) - So, It has to emulate VMX instructions of KVM because Ring 0 cannot execute them
- However, performance overhead is high
- Uses VT features to reduce the performance overhead
- Virtual Machine Control Structure (VMCS) shadowing - It allows a guest hypervisor to execute VMREAD and VMWRITE directly
- So, emulations or interveGntIiVonEsMaErePrIeCdTuUcRedE!S!
- Virtual Process ID (VPID) - It gives unique ID to vCPU and Translation Lookaside Buffer (TLB) - It prevents TLB flushes when VMExit occurs!

Hyper-Box Design

Preventing Unauthorized Code Modification

Guest Logical Address
(GLA)
...

<Sandbox>
Guest Page Table
(GPT)
...

Guest

VT

Physical Address

(GPA)

Code 1

<Hyper-Box>

Extended Page Table
(EPT)

Host Physical Address
(HPA)

RO, EXEC

Code 1

Code 0 Code 1

RO, EXEC RO, EXEC

Code 0
...

RO, EXEC
...

Code 0
...

RO Data

RO, NOEXEC

Data 0

RO, NOEXEC

Data 0

Data 0
...

RW, NOEXEC
...

RO Data
...

RW, NOEXEC
...

RO Data
...

...
Code 0 CCooddee M1 RO Data Data 0
...

...
RO, EXEC RWO, EXEC RO, NOEXEC RW, NOEXEC
...

CCoodde M1
... Code 0
Data 0 RO Data
...

RO, EXEC RO, EXEC
...
RO, NOEXEC RW, NOEXEC
...

Code 1 Code 0
...
Data 0 RO Data
...

Hyper-Box Design
Preventing Unauthorized Process Creation (1)

App or VM (PID 100)

App or VM (PID 101)

: Hardware Breakpoint

Kernel with KVM

(1) fork()

(2)

System Call Entry Point

PID 100

fork() {
/* code */ }

exit() {
/* code */ }

commit_creds() {
/* code */ }

others() {
/* code */ }

UID 1000 GID 1000 EUID 1000 EGID 1000
...

switch()

VMExit Callback

System Call Number

{

entry: check_priv_and_save_syscall(); break; PID 100: fork

fork: add_task(); break;

PID 101:

exit: del_task(); break;

commit_creds: update_cred(); break;

}

(3) Checking Privilege
PID 100
UID 1000 GID 1000 EUID 1000 EGID 1000
...

Hyper-Box

Hyper-Box Design
Preventing Unauthorized Process Creation (1)

App or VM (PID 100)

App or VM (PID 101)

: Hardware Breakpoint

Kernel with KVM
fork() {
/* code */ }

(4)
exit() {
/* code */ }

(1) fork()

(2)

System Call Entry Point

commit_creds() {
/* code */ }

others() {
/* code */ }

PID 100
UID 1000 GID 1000 EUID 1000 EGID 1000
...

(5) switch()

VMExit Callback

System Call Number

{

entry: check_priv_and_save_syscall(); break; PID 100: fork

fork: add_task(); break;

exit: del_task(); break;

(6) Checking

commit_creds: update_cred(); break; }

System Call Number

(3) Checking Privilege
PID 100
UID 1000 GID 1000 EUID 1000 EGID 1000
...

Hyper-Box

Hyper-Box Design
Preventing Unauthorized Process Creation (1)

App or VM (PID 100)

App or VM (PID 101)

: Hardware Breakpoint

(1) fork()

Kernel with KVM

(2) (4)

System Call Entry Point

fork()

{

/* code */

}

(8)

exit() {
/* code */ }

commit_creds() {
/* code */ }

others() {
/* code */ }

PID 100
UID 1000 GID 1000 EUID 1000 EGID 1000
...

PID 101
UID 1000 GID 1000 EUID 1000 EGID 1000
...

(3) Checking

(5)

VMExit

Privilege

switch()

Callback

System Call Number

PID 100

PID 101

{

entry: check_priv_and_save_syscall(); break; fork: add_task(); break; exit: del_task(); break;

PID 100: fork PID 101:
(6) Checking

UID 1000
(7)_EGUII_DD__110_00_000
EGID 1000

UID 1000 GID 1000 EUID 1000 EGID 1000

commit_creds: update_cred(); break; }

System Call Number

...

...

Hyper-Box

Hyper-Box Design
Preventing Unauthorized Process Creation (2)

Kernel with KVM
fork() {
/* code */ }

App or VM (PID 100)

App or VM (PID 101)
(1) ioctl()

(2)

System Call Entry Point

(4)

exit() {
/* code */ }

commit_creds() {
/* code */ }

others() {
/* code */ }

(5) switch()

VMExit Callback

System Call Number

{

PID 100: fork

entry: check_priv_and_save_syscall(); break; PID 101: ioctl

fork: add_task(); break;

exit: del_task(); break;

(6) Checking

commit_creds: update_cred(); break; }

System Call Number

Hyper-Box

: Hardware Breakpoint

PID 100
UID 1000 GID 1000 EUID 1000 EGID 1000
...

PID 101
UID 1000 GID 1000 EUID 1000 EGID 1000
...

(3) Checking Privilege

PID 100
UID 1000 GID 1000 EUID 1000 EGID 1000
...

PID 101
UID 1000 GID 1000 EUID 1000 EGID 1000
...

Hyper-Box Design
Preventing Unauthorized Process Creation (3)

Kernel with KVM
fork() {
/* code */ }

App or VM (PID 100)

App or VM (PID 101)

(1) socket()

App or VM (PID 102)

: Hardware Breakpoint
This process was created by detouring H/W breakpoints

(2)

System Call Entry Point

PID 100

PID 101

PID 102

exit() {
/* code */ }

commit_creds() {
/* code */ }

others() {
/* code */ }

UID 1000 GID 1000 EUID 1000 EGID 1000
...

UID 1000 GID 1000 EUID 1000 EGID 1000
...

UID 1000 GID 1000 EUID 1000 EGID 1000
...

switch()

VMExit Callback

System Call Number

{

PID 100: fork

entry: check_priv_and_save_syscall(); break; PID 101: ioctl

fork: add_task(); break;

exit: del_task(); break;

commit_creds: update_cred(); break;

No Slot for

}

PID 102

Hyper-Box

PID 100
UID 1000 GID 1000 EUID 1000 EGID 1000
...

PID 101
UID 1000 GID 1000 EUID 1000 EGID 1000
...

Hyper-Box Design
Preventing Unauthorized Process Creation (4)
- Some processes are not allowed to create a child process
- QEMU process cannot create it for security reasons - Hyper-box has a disallowed list that contains process names
- It checks the list for every system call and blocks the request
- Some kernel drivers load other modules with a kernel thread
- They call call_usermodehelper(), and the function creates a kernel thread - The kernel thread executes modprobe (/usr/bin/kmod) with kernel API
- It means the system call number is unknown, but modprobe is created! - Hyper-box has a workaround feature that allows the kernel thread to execute a
process - But, the feature is only for logging and not recommended - Load all necessary modules before Alcatraz or include modules to the kernel!

Hyper-Box Design
Preventing Unauthorized Privilege Escalation (1)

Kernel with KVM

App or VM (PID 100)

App or VM (PID 101)

(1) setuid(0)

(2)

System Call Entry Point

fork() {
/* code */ }

exit() {
/* code */ }

commit_creds() {
/* code */ }

others() {
/* code */ }

switch()

VMExit Callback

System Call Number

{

PID 100: fork

entry: check_priv_and_save_syscall(); break; PID 101: setuid

fork: add_task(); break;

exit: del_task(); break;

commit_creds: update_cred(); break;

}

Hyper-Box

: Hardware Breakpoint

PID 100
UID 1000 GID 1000 EUID 1000 EGID 1000
...
PID 100 UID 1000 GID 1000 EUID 1000 EGID 1000
...

PID 101
UID 1000 GID 1000 EUID 1000 EGID 1000
...
(3) Checking Privilege
PID 101
UID 1000 GID 1000 EUID 1000 EGID 1000
...

Hyper-Box Design
Preventing Unauthorized Privilege Escalation (1)

Kernel with KVM
fork() {
/* code */ }

App or VM (PID 100)

App or VM (PID 101)

(1) setuid(0)

(2)

System Call Entry Point

(4)

exit() {
/* code */ }

commit_creds() {
/* code */ }

others() {
/* code */ }

switch()

__V_M__E_x_i_t __ (5) Callback

System Call Number

{

PID 100: fork

entry: check_priv_and_save_syscall(); break; PID 101: setuid

fork: add_task(); break;

exit: del_task(); break;

(6) Checking

commit_creds: update_cred(); break; }

System Call Number

Hyper-Box

: Hardware Breakpoint

PID 100
UID 1000 GID 1000 EUID 1000 EGID 1000
...
PID 100 UID 1000 GID 1000 EUID 1000 EGID 1000
...

PID 101
UID 1000 GID 1000 EUID 1000 EGID 1000
...
(3) Checking Privilege
PID 101
UID 1000 GID 1000 EUID 1000 EGID 1000
...

Hyper-Box Design
Preventing Unauthorized Privilege Escalation (1)

Kernel with KVM
fork() {
/* code */ }

App or VM (PID 100)

App or VM (PID 101)

(1) setuid(0)

(2)

System Call Entry Point

(4)

exit() {
/* code */ }

commit_creds()

{

/* code */

}

(8)

others() {
/* code */ }

PID 100
UID 1000 GID 1000 EUID 1000 EGID 1000
...

__V_M__E_x_i_t __ (5)

switch()

Callback

System Call Number

PID 100

{

PID 100: fork

entry: check_priv_and_save_syscall(); break; fork: add_task(); break; exit: del_task(); break;

PID 101: setuid
(6) Checking

UID 1000
GID 1000
(7)EUID 1000
EGID 1000

commit_creds: update_cred(); break; }

System Call Number

...

Hyper-Box

: Hardware Breakpoint
PID 101 UID 1000 GID 1000 EUID 1000 EGID 1000
...
(3) Checking Privilege
PID 101 UID 1000 GID 1000 EUID 1000 EGID 1000
...

Hyper-Box Design
Preventing Unauthorized Privilege Escalation (2)

Kernel with KVM
fork() {
/* code */ }

App or VM (PID 100)

App or VM (PID 101)

(1) ioctl()

(2)

System Call Entry Point

(4)

exit() {
/* code */ }

commit_creds() {
/* code */ }

others() {
/* code */ }

switch()

__V_M__E_x_i_t __ (5) Callback

System Call Number

{

PID 100: fork

entry: check_priv_and_save_syscall(); break; PID 101: ioctl

fork: add_task(); break;

exit: del_task(); break;

(6) Checking

commit_creds: update_cred(); break; }

System Call Number

Hyper-Box

: Hardware Breakpoint

PID 100
UID 1000 GID 1000 EUID 1000 EGID 1000
...
PID 100 UID 1000 GID 1000 EUID 1000 EGID 1000
...

PID 101
UID 1000 GID 1000 EUID 1000 EGID 1000
...
(3) Checking Privilege
PID 101
UID 1000 GID 1000 EUID 1000 EGID 1000
...

Hyper-Box Design
Preventing Unauthorized Privilege Escalation (3)

Kernel with KVM

App or VM (PID 100)

App or VM (PID 101)

(1) socket()

(2)

System Call Entry Point

: Hardware Breakpoint
This process was escalated by detouring H/W breakpoints

PID 100

PID 101

fork() {
/* code */ }

exit() {
/* code */ }

commit_creds() {
/* code */ }

others() {
/* code */ }

UID 1000 GID 1000 EUID 1000 EGID 1000
...

UID 1000 GID 1000 EUID 0 EGID 1000
...

switch()

VMExit Callback

System Call Number

{

PID 100: fork

entry: check_priv_and_save_syscall(); break; PID 101: socket

fork: add_task(); break;

exit: del_task(); break;

commit_creds: update_cred(); break;

}

PID 100
UID 1000 GID 1000 EUID 1000 EGID 1000
...

(3) Checking Privilege
PID 101
UID 1000 GID 1000 EUID 1000 EGID 1000
...

Hyper-Box

Hyper-Box Design
Emulating VMX instructions ­ Only KVM

Kernel with KVM

VM 1

VM 2

Ring 0  Ring -1 (VMXON of KVM)

(1) VMXON, VMXOFF
KVM (Guest Hypervisor)
0xAAAABBBB: VMExitHandler
{/* Processing Events */}

(3) VMExit

VMCS 1
VM_HOST_RIP: 0xAAAABBBB VM_HOST_RSP: 0x11111111

VMCS 2
VM_HOST_RIP: 0xAAAABBBB VM_HOST_RSP: 0x22222222

(2) VMPTRLD, VMPTRST, VMCLEAR, VMREAD, VMWRITE, VMLAUNCH, VMRESUME, INVEPT, INVVPID, INVPCID, etc.

Hyper-Box (Host Hypervisor)
0xEEEEFFFF: VMExitHandler
{/* Processing VMX instructions*/}

VMCS 0 (Sandbox)
VM_HOST_RIP : 0xEEEEFFFF VM_HOST_RSP : 0x0000FFFF VM_GUEST_RIP: 0x00000000 VM_GUEST_RSP: 0x00000000

VMCS Data List
VMCS 1-RIP: 0xAAAABBBB VMCS 1-RSP: 0x11111111 VMCS 2-RIP: 0xAAAABBBB VMCS 2-RSP: 0x22222222

CPU 0
VMCS_PTR: VMCS 1 or 2

Hyper-Box Design
Emulating VMX instructions ­ Executing Instructions (1)

Kernel with KVM

VM 1

VM 2

Ring 0 (Kernel of Sandbox) (2) VMXON, VMXOFF
KVM (Guest Hypervisor)
0xAAAABBBB: VMExitHandler
{/* Processing Events */}

VMCS 1
VM_HOST_RIP: 0xAAAABBBB VM_HOST_RSP: 0x11111111
(4) Executing VMX instructions

VMCS 2
VM_HOST_RIP: 0xAAAABBBB VM_HOST_RSP: 0x22222222

Ring -1 (VMXON of Hyper-Box) (1) VMXON, VMXOFF

(3) (5) VMExit

Hyper-Box (Host Hypervisor)
0xEEEEFFFF: VMExitHandler
{/* Processing VMX instructions*/}

VMCS 0 (Sandbox)
VM_HOST_RIP : 0xEEEEFFFF VM_HOST_RSP : 0x0000FFFF VM_GUEST_RIP: 0VxM0I0N0S0T0A0D0D0R VM_GUEST_RSP: 0KxE0R0N0E0L0_0R0S0P

VMCS Data List
VMCS 1-RIP: 0x00000000 VMCS 1-RSP: 0x00000000 VMCS 2-RIP: 0x00000000 VMCS 2-RSP: 0x00000000

CPU 0
VMCS_PTR: VMCS 0

Hyper-Box Design
Emulating VMX instructions ­ Executing Instructions (2)

Kernel with KVM

VM 1

VM 2

Ring 0 (Kernel of Sandbox) (2) VMXON, VMXOFF
KVM (Guest Hypervisor)
0xAAAABBBB: VMExitHandler
{/* Processing Events */}

VMCS 1
VM_HOST_RIP: 0xEAEAEAEAFBFBFBFB VM_HOST_RSP: 0x01010101F1F1F1F1

VMCS 2
VM_HOST_RIP: 0xAEAEAEAEBFBFBFBF VM_HOST_RSP: 0x202020202F2F2F2F

(4) Executing VMX instructions

(7) Switching the VMCS and Executing VMX instructions

Ring -1 (VMXON of Hyper-Box)

VMCS 0 (Sandbox)

(1) VMXON, VMXOFF

(3) (5) VMExit

VM_HOST_RIP : 0xEEEEFFFF VM_HOST_RSP : 0x0000FFFF VM_GUEST_RIP: 0VxM0I0N0S0T0A0D0D0R

Hyper-Box (Host Hypervisor)

VM_GUEST_RSP: 0KxE0R0N0E0L0_0R0S0P

0xEEEEFFFF: VMExitHandler

{/* Processing VMX instructions*/}
(6) Hooking Addresses of VMExit Callbacks

VMCS Data List
VMCS 1-RIP: 0xAAAABBBB VMCS 1-RSP: 0x11111111 VMCS 2-RIP: 0xAAAABBBB VMCS 2-RSP: 0x22222222

CPU 0
VMCS_PTR: VMCS 0  VMCS 1 or 2

Hyper-Box Design
Emulating VMX instructions ­ Handling VMExits (1)

Kernel with KVM

VM 1

VM 2

Ring 0 (Kernel of Sandbox)
KVM (Guest Hypervisor)
0xAAAABBBB: VMExitHandler
{/* Processing Events */}

VMCS 1
VM_HOST_RIP: 0xEAEAEAEAFBFBFBFB VM_HOST_RSP: 0x01010101F1F1F1F1

VMCS 2
VM_HOST_RIP: 0xAEAEAEAEBFBFBFBF VM_HOST_RSP: 0x202020202F2F2F2F
(1) VMExit

Ring -1 (VMXON of Hyper-Box)

VMCS 0 (Sandbox)

VM_HOST_RIP : 0xEEEEFFFF

VM_HOST_RSP : 0x0000FFFF

VMCS Data List

VM_GUEST_RIP: 0VxMAIANASATBABDBDBR

VMCS 1-RIP: 0xAAAABBBB

Hyper-Box (Host Hypervisor)

VM_GUEST_RSP: 0KxE2R2N2E2L2_2R2S2P

VMCS 1-RSP: 0x11111111 VMCS 2-RIP: 0xAAAABBBB

0xEEEEFFFF: VMExitHandler
{/* Processing VMX instructions*/}

VMCS 2-RSP: 0x22222222

(2) Retrieving Original RIP (VMExitHandler of KVM) and RSP

CPU 0
VMCS_PTR:VMCS 2  VMCS 0

Hyper-Box Design
Emulating VMX instructions ­ Handling VMExits (2)

Kernel with KVM

VM 1

VM 2

Ring 0 (Kernel of Sandbox)
KVM (Guest Hypervisor)
0xAAAABBBB: VMExitHandler
{/* Processing Events */}

VMCS 1
VM_HOST_RIP: 0xEAEAEAEAFBFBFBFB VM_HOST_RSP: 0x01010101F1F1F1F1

VMCS 2
VM_HOST_RIP: 0xAEAEAEAEBFBFBFBF VM_HOST_RSP: 0x202020202F2F2F2F

(4) Resuming the Sandbox and Handling VMExit of the VMCS 2

(1) VMExit

Ring -1 (VMXON of Hyper-Box)

VMCS 0 (Sandbox)

VM_HOST_RIP : 0xEEEEFFFF

VM_HOST_RSP : 0x0000FFFF

VMCS Data List

VM_GUEST_RIP: 0VxMAIANASATBABDBDBR

VMCS 1-RIP: 0xAAAABBBB

Hyper-Box (Host Hypervisor)

VM_GUEST_RSP: 0KxE2R2N2E2L2_2R2S2P

VMCS 1-RSP: 0x11111111 VMCS 2-RIP: 0xAAAABBBB

0xEEEEFFFF: VMExitHandler {/* Processing VMX instructions*/} (3) Changing RIP and RSP to VMExitHandler of KVM

VMCS 2-RSP: 0x22222222

(2) Retrieving Original RIP (VMExitHandler of KVM) and RSP

CPU 0
VMCS_PTR:VMCS 2  VMCS 0

Hyper-Box Design
Emulating VMX instructions ­ Reducing Overhead (1)

KVM
(Ring 0)
Hyper-Box
(Ring -1)

VMCLEAR VM
VMEXIT (Flushing TLB)
VMCLEAR VM

VMPTRLD VM
Save VMCS Pointer

VMREAD/WRITE VM
VMREAD/WRITE VM
VMCS Pointer

VMLAUNCH/RESUME VM
VMLAUNCH/RESUME VM

VMVMVs Ms s
VMExit Handler

Handling Events

Hyper-Box Design
Emulating VMX instructions ­ Reducing Overhead (2)

KVM
(Ring 0)
Hyper-Box
(Ring -1)

VMCLEAR VM
VMEXIT (Flushing TLB)
VMCLEAR VM

VMPTRLD VM
Save VMCS Pointer

VMREAD/WRITE VM

VMLAUNCH/RESUME VM

VMVMVs Ms s

Handling Events

VMREAD/WRITE VM
VMCS Pointer

VMLAUNCH/RESUME VM

VMExit Handler

Enabling VMCS Shadowing and VPID features

KVM

VMCLEAR

(Ring 0,

VM

VPID 0xFFFF)

VMEXIT

(No Flushing TLB)

Hyper-Box
(Ring -1)

VMCLEAR VM

VMPTRLD VM
Write to LINK_PTR

VMREAD/WRITE VM

VMLAUNCH/RESUME VM

VMREAD/WRITE VM
VMCS of Sandbox VMCS_LINK_PTR: VM

VMLAUNCH/RESUME VM

VMVMVs Ms s
VMExit Handler

Handling Events

Hyper-Box Design
Emulating VMX instructions ­ Reducing Overhead (3)

KVM
(Ring 0)
Hyper-Box
(Ring -1)

VMCLEAR VM
VMEXIT (Flushing TLB)
VMCLEAR VM

VMPTRLD VM
Save VMCS Pointer

VMREAD/WRITE VM

VMLAUNCH/RESUME VM

VMVMVs Ms s

Handling Events

VMREAD/WRITE VM
VMCS Pointer

VMLAUNCH/RESUME VM

VMExit Handler

Enabling VMCS Shadowing and VPID features

KVM

VMCLEAR

(Ring 0,

VM

VPID 0xFFFF)

VMEXIT

(No Flushing TLB)

Hyper-Box
(Ring -1)

VMCLEAR VM

VMPTRLD VM
Write to LINK_PTR

VMREAD/WRITE VM

VMLAUNCH/RESUME VM

VMREAD/WRITE VM
VMCS of Sandbox VMCS_LINK_PTR: VM

VMLAUNCH/RESUME VM

VMVMVs Ms s
VMExit Handler

Handling Events

Implementation of Alcatraz
- Hyper-box is a loadable kernel module
- So, It can be loaded any time BEFORE you start VMs - If not, it shows some errors related to the VMXON fail
- It was made with C and assembly code
- Tailored Linux kernel is just recompiled version
- Some options of a kernel config file were REMOVED - CONFIG_IA32_EMULATION, CONFIG_COMPAT, CONFIG_COMPAT_ 32, CONFIG_X86_X32  System call interfaces - CONFIG_JUMP_LABEL  Runtime code modifications
- No more system call interface for legacy!

- Background - Analysis of Critical Paths of Escapes - Design and Implementation of Alcatraz - Evaluation and Demo - Conclusion and Black Hat Sound Bytes

Benchmark Machine
- Host Machine (Server)
- CPU: Intel Xeon Gold 6242R 2 CPU (40 cores, 80 thread) - RAM: 512GB - HDD: NVME 1TB - OS: Ubuntu 20.04.01 - Kernel: 5.8.0-44-generic Linux kernel
- Guest Machine (QEMU)
- CPU: 4 cores - RAM: 16GB - HDD: 60GB - OS: Ubuntu 20.04.01 - Kernel: 5.8.0-44-generic Linux kernel

16.00 14.00

15.15

Evaluation ­ lmbench

Lower is better

12.00

10.00

10.20

8.21

8.07

8.00

6.00 4.00 2.00
1.00

4.91

4.68

5.18

4.55

2.85

2.17

2.17

1.00

1.00

1.00

1.001.561.27 1.00

1.63

1.59 1.48

1.76 1.52

1.66 1.45

1.00

1.00

1.00

1.00

0.00
null call null I/O

state open/close select TCP sig install sig handle fork proc exec proc sh proc

No Alcatraz Alcatraz W/O VMCS Shadowing and VPID Alcatraz

Evaluation ­ Kernel Compilation

1.15

1.13

1.10
1.10

1.05
1.00
1.00

0.95

10% Overhead in the Host

0.90

No Alcatraz Alcatraz (W/O VMCS

Alcatraz

Shadowing and VPID)

Host

Lower is better

1.00

1.02

1.01

1% Overhead in the Guest

No Alcatraz

Alcatraz (W/O VMCS Shadowing and VPID)
Guest

Alcatraz

DEMO
Please check the project link: https://github.com/kkamagui/alcatraz

Conclusion and Black Hat Sound Bytes
- Containers, VMs, and microVMs suffer from escapes
- The hypervisor can provide strong isolation - But, it has excessive privilege and connects with VMs tightly
- Taking a higher ground is not always the answer
- Researchers usually try to solve the problems with the higher privilege - The higher privilege we get, the more constraints we have!
- Alcatraz is a practical hypervisor sandbox to prevent escapes
- It downgrades KVM's privilege and makes a sandbox with Intel VT - It has approximately 10% overhead in the host and 1% overhead in
the guest (kernel compilation benchmark)

Questions?
SENIOR RESEARCHER!
BLACK HAT USA SPEAKER!
Project : https://github.com/kkamagui/alcatraz Contact: hanseunghun@nsr.re.kr, @kkamagui1

Reference
- Seunghun, H., Junghwan, K., Wook, S., HyoungChun K., and Eungki, P. Myth and truth about hypervisor-based kernel protector: The reason why you need shadow-box. Black Hat Asia. 2017.
- Seunghun, H., Jun-Hyeok, P., Wook, S., Junghwan, K., and HyoungChun K. Shadow-box v2: The practical and omnipotent sandbox for ARM. Black Hat Asia. 2018.
- Randazzo, A., and Ilenia T. Kata containers: An emerging architecture for enabling mec services in fast and secure way. IEEE IOTSMS. 2019.
- Agache, A., et al. Firecracker: Lightweight virtualization for serverless applications. NSDI. 2020. - Young, E., et al. The true cost of containing: A gVisor case study. HotCloud. 2019. - Azab, A., et al. Hypersentry: enabling stealthy in-context measurement of hypervisor integrity. ACM CCS. 2010. - Rutkowska, J., and Rafal W. Preventing and detecting Xen hypervisor subversions. Black Hat USA. 2008 - Bulygin, Y., and David S. Chipset based approach to detect virtualization malware. Black Hat USA. 2008 - Li, S., John S., and Jason N. Protecting cloud virtual machines from hypervisor and host operating system exploits.
USENIX Security. 2019. - Zhijian S., Jian W., and Yue Z. 3d red pill: A guest-to-host escape on QEMU/KVM virtio Devices. Black Hat Asia.
2020. - Elhage, N. Virtunoid: A kvm guest->host privilege escalation exploit. Black Hat USA. 2011. - Understanding the VENOM Vulnerability, https://blog.trendmicro.com/understanding-the-venom-vulnerability/

