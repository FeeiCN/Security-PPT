VMM Detection approach Maniacs ­ No one can be
believed 
Kunio Miyamoto a.k.a wakatono wakatono@todo.gr.jp Twitter ID: wakatono
1
1

Today's topic
· Background · VMM detection by using Implementation specific
footprint (widely used) · Problem of Implementation specific footprint use · New VMM detection method by using a few
assembly language instructions · Sample Implementation using C and Assembler · VMM detecting apploach in bootstrap process · VMM detection Implementation in bootloader · Conclusion
2
2

Background
Copyright by Kunio Miyamoto
3

Motivation of This Research
· Some Software must not to be run on the "Virtual Machine Monitor"
­ Assuming Real Hardware as authorized hardware(not Virtual Machine)
­ Software includes Operating System ­ Assuming TPM is not available on the computer
· When avoiding to use some system including OS, VM detecting in bootstrap is needed
­ VMM Detecting code must be made more smaller.
Copyright by Kunio Miyamoto
4

Why for Some Software?

Terminal Hardware

VM for display
Informations and user oparation

VM (for terminal client function)

VMM(Para Virtualization)

Terminal VM

VM for display
Informations and user oparation

VM (for terminal client function)

VMM(ParaVirtualization)

VMM(Full Virtualization)
Correct Structure Incorrect Structure
· I want to detect running on "Incorrect Structure"
­ Architecture like "VM on VM" is not suitable for our use

Copyright by Kunio Miyamoto
5

VM on VM example(1)
· Xen is running on VMware Workstation
­ I don't want to run our software like this situration
Copyright by Kunio Miyamoto
6

VMM detection by using Implementation specific footprint (widely used)
Copyright by Kunio Miyamoto
7

Hints for VMM Detection
· Popularly Used
­ String, Specific Value, Specific Instruction, etc...
· Performance Mismatch
­ Instruction Execution Time ­ Cache Hit Rate difference
· Functionally Mismatch
­ TLB ­ VMM Bugs
· Tools
­ Imvirt, virt-what ­ Checkvm module ( in Metasploit ) ­ Various malware modules for anti-debugging ­ RedPill etc...
Copyright by Kunio Miyamoto
8

Example: QEMU based VMM

$ dmesg | grep QEMU

[ 0.853843] ata2.00: ATAPI: QEMU DVD-ROM, 0.12.1, max UDMA/100

[ 0.855265] scsi 1:0:0:0: CD-ROM

QEMU QEMU DVD-ROM

0.12 PQ: 0 ANSI: 5

[ 1.208713] usb 1-1: Product: QEMU USB Tablet

[ 1.208715] usb 1-1: Manufacturer: QEMU 0.12.1

[ 1.742372] input: QEMU 0.12.1 QEMU USB Tablet as

/devices/pci0000:00/0000:00:01.2/usb1/1-1/1-1:1.0/input/input4

[ 1.742508] generic-usb 0003:0627:0001.0001: input,hidraw0: USB HID

v0.01 Pointer [QEMU 0.12.1 QEMU USB Tablet] on usb-0000:00:01.2-

1/input0

· String "QEMU" is appeared here and there



Copyright by Kunio Miyamoto
9

VMM detection tools example(1/3)
· Imvirt
­ VMM detection tool ­ Project Webpage:
http://micky.ibh.net/~liske/imvirt.html ­ Known Footprint like resource strings, specific
belaviors(e.g. I/O port access result), etc...
Copyright by Kunio Miyamoto
10

VMM detection tools example(2/3)
· virt-what
­ VMM detection tool ­ Project Webpage:
http://people.redhat.com/~rjones/virt-what/ ­ Known Footprint like resource strings, specific
belaviors(e.g. I/O port access result), etc...
Copyright by Kunio Miyamoto
11

VMM detection tools example(3/3)
· Checkvm
­ One of modules in Metasploit.
· Script in Metapreter
­ Checks the exploited machine is running on some VMM.
­ Win32/Win64 only
Copyright by Kunio Miyamoto
12

Problem of Implementation specific footprint use
Copyright by Kunio Miyamoto
13

Some challenges in VMM detection
· Footprint detection is easy to bypass detection
­ e.g. Virtual Disk for VMware, vCPU for KVM, etc... ­ Detection by comparing the resource specific string(s)
is easy to implement, but easy to fake 
· Userland application cannot be use features like raw features of TLB, CPU Cache, etc...
­ These are usable only in the kernel mode.
· Targets are Specific Operating Systems · Known VMM can be detected · No one can be believed! (voice from user mode)
Copyright by Kunio Miyamoto
14

New VMM detection method by using a few assembly language instructions
Copyright by Kunio Miyamoto
15

Assumption of This approach
· VMM provides VM(s) fully-virtualized environment
· VMM provides IA32-based environment · VM(s) on VMM has independent TSC
(important!) · RDTSC instruction can be executable on
ring level 3 (important!)
­ Popular OSs enables to run RDTSC on ring level 3
Copyright by Kunio Miyamoto
16

TSC measuring for VM detecting architecture

TSC value is fetched to edx and eax
RDTSC execution

Move edx and eax To safe area
movl×2

TSC value is fetched to edx and eax
RDTSC execution

E(before) E(after) E(movl) E(before) E(after)

E(rdtsc)

E(rdtsc)

E(all)
· On the Real Hardware, E(all) is available and always same value
­ On the Virtual Machine, E(all) differs per timing of getting E(all)

Copyright by Kunio Miyamoto
17

Judging method VM or Real Machine

Getting E(all)  E1(all)

t
Getting E(all)  E2(all)

· If E1(all)=E2(all) then Program is running on Real Machine
· If E1(all) != E2(all) then Program is running on VM
Copyright by Kunio Miyamoto
18

Process Scheduling and time slice assignment

ProcA

ProcB

ProcC

Running User Process

CPU assignment for process running

Process scheduling (kernel running)

Copyright by Kunio Miyamoto
19

Process executing in VM is suspended by whole VM preemption
VM instance process A

ProcA

ProcB

ProcC

Running User Process
CPU assignment for process running

Process scheduling (kernel running)

This is permitted for our approach

Time slice assigned to VM instance process A

ProcB execution on VM instance process A stops because of VM instance process A is scheduled and CPU time is assigned to other process.

(Other process running period)

(Other process running period)

Copyright by Kunio Miyamoto
20

VMM detecting process between process dispatch timing.

ProcA
E(all)
VMM Detecting by measuring TSC (Atomic in the time slice between procss scheduling)

ProcB

ProcC

ProcA

Running User Process

CPU assignment for process running

Process scheduling (Kernel Running)

Copyright by Kunio Miyamoto
21

Sample Implementation using C and Assembly Language
Copyright by Kunio Miyamoto
22

Simple!
CPUID RDTSC MOV EBX, EAX MOV ECX, EDX RDTSC (EDX:EAX ­ ECX:EBX)
· CPUID resets Out-of-Order execution in IA32 · These instructions makes RDTSC execution clock
value
­ And this value is not stable on the VMM
Copyright by Kunio Miyamoto
23

Real Code (C and Inline Assembler)

#include <unistd.h> #include <sys/types.h> main() {
unsigned long long before,after; char *area; register unsigned long bhi,blo,ahi,alo; unsigned long long bhi64,blo64,ahi64,alo64;

__asm__("cpuid" : );

__asm__(".byte 0x0f,0x31" : "=a" (blo),"=d" (bhi));

__asm__(".byte 0x0f,0x31" : "=a" (alo),"=d" (ahi));

blo64 = blo; bhi64 = bhi; alo64 = alo;

8048397: 0f a2 8048399: 0f 31

ahi64 = ahi;

804839b: 89 d1

before = bhi64 << 32 | blo; 804839d: 89 c7

after = ahi64 << 32 | alo;

804839f: 0f 31

printf("%lld\n",after - before);

}

cpuid rdtsc mov %edx,%ecx mov %eax,%edi rdtsc

Copyright by Kunio Miyamoto
24

TSC measuring for VM detecting architecture

8048399: 0f 31
TSC value is fetched to edx and eax
RDTSC execution

rdtsc

804839f: 0f 31

Move edx and eax To safe area
movl×2

TSC value is fetched to edx and eax
RDTSC execution

E(before) E(after) E(movl) E(before) E(after)

8800E44(r88d33t99scbd)::

89 d1 89 c7
E(all)

mov mov

%%eeEad(xxrd,,%%tseecdc) xi

· On the Real Hardware, E(all) is available and always same value
­ On the Virtual Machine, E(all) differs per timing of getting E(all)

Copyright by Kunio Miyamoto
25

rdtsc

Result on Real Hardware
Clock for Execution

Stable 
Copyright by Kunio Miyamoto
26

Execution number

Result on Virtual Machine (on VMM)
Clock for Execution
Execution number
Not Stable 
Copyright by Kunio Miyamoto
27

In case of Intel VT/AMD-V
· This approach cannot be applied
­ Need to be modified little a bit 
· Trapped Instruction in Intel VT/AMD-V is:
­ CPUID 
· Modify the Code ! ( little a bit  )
Copyright by Kunio Miyamoto
28

Simple!

CPUID

RDTSC

MOV ESI, EAX

MOV EDI, EDX

XOR EAX, EAX

INC EAX

Added code (3 lines) 

CPUID

RDTSC

(EDX:EAX ­ EDI:ESI)

· 1st CPUID resets Out-of-Order execution in IA32 · These instructions makes CPUID + RDTSC(+) execution
clock value
­ And this value is not stable(and/or too large) on the VMM execution.
Copyright by Kunio Miyamoto
29

Strength and Weakness
· Strong Point
­ Detect underlying VMM (or other software like VMM)
­ Detect unknown(or newer) VMM running ­ Small and Simple Code
· Can be included in many software
· Weak Point
­ Unable to know the name of VMM(or other software like VMM)
Copyright by Kunio Miyamoto
30

Caution: many kind of TSC

· I know at least 3 kinds of TSC

­ (normal) TSC

· Normal TSC · Count up by CPU cycle
­ Constant TSC

In this case, Code in this program Returns various clock Because of CPU clock is modified Dynamically.

· Count up interval is fixed time 

­ Not related to the CPU cycle.

· Interval Specified in the boottime clock

­ Invariant TSC
· Don't stop when CPU sleeped 

Copyright by Kunio Miyamoto
31

VM detecting approach in bootstrap process
Copyright by Kunio Miyamoto
32

VM Detecting Approach

(1) Detect in The user program

User

(2) Detect in the kernel

Kernel

(3) Detect in the bootstrap

Copyright by Kunio Miyamoto
33

Timeline from bootstrap to running OS

System on the real hardware Bootstrap begins.

Both detecting by user program and detecting by kernel module is available
VM detection sequence is executed with no execution blocking in the system bootstrap.
t

Bootstrap loader

Starting OS

OS running

Detecting by the kernel is similar to detecting by bootstrap process

Copyright by Kunio Miyamoto
34

Point of VMM detection

· VMM detection by kernel module

­ One of most reliable approach

­ Some restrictions

· Runnability of kernel module depends kind of OSs and these versions

­ e.g. Linux kernel module for 2.4.x cannot be used for Linx kernel 2.6.x

· VMM detection by user process

­ Easy to use from user programs

­ Less reliable than by kernel module

­ Suppressing user process preemption is not practical in the general OS.

· VMM detection by bootstrap process
­ Running no process

Focus

­ If Underlying VMM exists, any of preemption is caused because of VM and other processes scheduling

Copyright by Kunio Miyamoto
35

Benefit of Detection in Bootstrap Process?
· Hardware Stability
­ HW processing speed is stable just after powered on.
­ VM processing speed is not stable just after (VM) invoked
· (Real) Hardware Occupation
­ Real HW is occupied by bootstrap loader. Stable in processor speed.
­ HW is not occupied by bootstrap loader. Unstable in processor speed.
Copyright by Kunio Miyamoto
36

Practical use of bootstrap VM

detector

Program Developing and Testing(includes OS)

Program Deploying or Distributing(includes OS or distributed as an appliance HW)

Program test done

Normal boot program

Boot program with VM detection.

· Usable for appliance hardware development and

deployment

­ Bootstrap VM detector completes in the boot process, and not affects OS initialization processing

Copyright by Kunio Miyamoto
37

Example(2)
Chromebook bootloader verifies hardware (2011) I made presentation like this in 2009 
· Chrome OS(Chromium OS) will initially be targeted and the netbook class or products (in Google Chrome OS press conference)
Copyright by Kunio Miyamoto
38

Implementation
· Assuming to use GNU GRUB
­ GNU GRUB is the bootloader to use Generic Operating System boot
· Now in progress
­ Runs detection mechanism on custom-made GRUB 1.x ( not yet 2.x )
Copyright by Kunio Miyamoto
39

Conclusion
· I proposed new VMM detection approach
­ Smaller Code, and Useful Results ­ And now in progress to develop VMM detection
software usable everywhere.
· Bootstrap VM detection is more useful than VM detection in each application if possible.
· I pointed that VMM detection in boottime is useful for System-Wide structure assurance.
Copyright by Kunio Miyamoto
40

Thank you!
Copyright by Kunio Miyamoto
41

