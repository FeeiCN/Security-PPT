Dissecting QNX
Analyzing & Breaking Exploit Mitigations and PRNGs on QNX 6 and 7
Jos Wetzels, Ali Abbasi

Who are we?

Jos Wetzels
Independent Security Researcher @ Midnight Blue
(Previously) Security Researcher @ UTwente
This work part of MSc thesis @ TU/e
@s4mvartaka http://www.midnightbluelabs.com http://samvartaka.github.io

Ali Abbasi
Ph.D. Candidate @ TU/e Visiting Researcher @ RUB ICS / Embedded Binary Security @bl4ckic3

ROADMAP
· Introduction to QNX · OS & Security Architecture Outline · QNX PRNGs · QNX Exploit Mitigations · Final Remarks

Introduction
· UNIX-Like, POSIX embedded RTOS.
· Initial release 1982, acquired by BlackBerry · Closed-source, proprietary
· QNX 6.6 (March 2014): 32-bit · QNX 7 (March 2017): 64-bit
· Mobile
· BlackBerry 10 · BlackBerry Tablet
· Only tip of iceberg...

Automotive

Cisco IOS-XR
· Carrier-Grade Routers: CRS, 12000, ASR9000
* IOS-XR, Partnering with Elastic: an overview ­ Jose Palafox et al., 2016

Many more critical systems
· Industrial Control Systems
· Westinghouse / AECL Nuclear Power Plants · Caterpillar Surface Mining Control · GE Mark VI Turbine Controller · Novar HVAC
· Defense
· UAVs · Military Radios · Anti-Tank Guidance
· Etc.
· Medical · Rail Safety ·...

What's New?
· `Wheel of Fortune' @ 33C3
· PRNG issues in VxWorks, RedactedOS, QNX <= 6.6
· This talk
· New QNX 7 userspace & kernelspace PRNGs
· Exploit Mitigations in QNX 6 & 7

OS & Security Architecture

QNX Security History
· BlackBerry Mobile Research (2011 - 2014)
· Alexander Antukh, Ralf-Philipp Weinmann, Daniel Martin Gomez, Zach Lanier et al.
· QNX IPC, PPS, Kernel Calls (2016)
· Alex Plaskett et al.
· Various individual vulnerabilities (2000 ­ 2008)
· Anakata, Julio Cesar Fort, Tim Brown · Lot of setuid logic bugs & memory corruption vulns
· CIA Interest (Vault 7)
· No prior work on Exploit Mitigations or PRNGs · Almost no prior work on internals
* QNX: 99 Problems but a Microkernel ain't one! - Alex Plaskett et al., 2016

QNX Internals RE
· Sources of internals info
· QNX Developer Support Pages
· QNX Community Portal (Foundry27)
· BSPs, Networking Stacks, OS Wiki
· Does not cover `interesting' stuff or most features in QNX > 6.4
· Nothing on mitigations, nothing on PRNGs 
· SDP includes RTOS, system binaries & Momentics Tool Suite
· Binaries with debug symbols available for myQNX members!
· Load microkernel with symbols into IDA, take manual route

QNX Boot Process
· Initial Program Loader (IPL) copies Image Filesystem (IFS) to RAM · Startup (startup-*) program configures system (interrupt controllers, etc.) · Microkernel (procnto) sets up kernel, runs buildfile (boot script for drivers
and OS components)

QNX Firmware
· Various QNX OS packages (Car, Safety, Medical)
· Same Neutrino microkernel and core service binaries
· QNX images come in three flavors
· OS image (IFS) · Flash filesystem image (EFS) · Embedded transaction filesystem image (ETFS)
· Can be combined into single image on eg. NAND Flash

QNX Firmware
· Dump IFS & EFS using standard QNX utilities
· dumpifs, dumpefs

QNX Microkernel Architecture

QNX IPC Message Passing

Syscalls
· QNX supports minimal set of `native' syscalls
· Threads, message passing, signals, clocks, interrupt handlers, etc. · QNX < 90 vs Linux > 300 syscalls
· Prototypes in /usr/include/sys/neutrino.h
· Other POSIX syscalls implemented in libc as message passing stubs to responsible userspace process

Syscalls
· Native syscalls invoked with usual instructions
· SYSENTER / INT 0x28 / SWI / SC / etc. · Syscall # in EAX (x86), R12 (ARM), R0 (PPC) · Listing in /usr/include/sys/kercalls.h
· Syscall entrypoint in __ker_entry / __ker_sysenter
· Save registers · Switch to kernel stack · Get active kernel thread · Wait until we are on right CPU · Acquire kernel
· Syscall # is index into ker_call_table

QNX Memory Layout
· Kernelspace ­ Userspace Separation
· Only microkernel runs in kernelspace
· Userspace separation of sensitive (OS, driver, etc.) code from regular applications
· Virtual Private Memory via MMU · Unix-like process access controls

QNX User Management
· Typical Unix user & file permissions model
· /etc/passwd, /etc/group, /etc/shadow · Usual utils login, su, etc. · Also support for (M)ACL
· QNX 6 hashes
· SHA256, SHA512 (default) · But also: MD5, DES crypt, qnx_crypt (legacy QNX 4)
· Cracked root / maintenance password in embedded can have high shelf-life...
· QNX 7 or patched 6.6 hashes
· PBKDF2-SHA256/SHA512

QNX Process Management
· Process Manager is combined with microkernel in procnto executable
· Runs as root process with PID 1 · Invokes microkernel in same way as other processes · But has _NTO_PF_RING0 process flag to call _ring0 syscall
· Support for usual POSIX stuff
· Spawn, fork, exec, ...
· QNX uses ELF format
· If filesystem is on block-oriented device code & data are loaded into main memory
· If filesystem is memory-mapped (eg. flash) code can be executed in-place
· Multiple instances of same process share code memory

QNX Process Abilities
· procmgr_ability similar to Linux capabilities
· Obtain capabilities before dropping root · Restrict actions for even root processes
· Integral to QNX `rootless execution' security
· Principle of least privilege
· Abilities have domain (root/non-root), range (restrict values), inheritable, locked, etc.
· Eg. PROCMGR_AID_SPAWN_SETUID with range [800, 899]
· Can specify custom abilities

QNX Process Abilities Limitations
· Up to application developers & system integrators to get this right
· Watch out with inheritability (inheritable itself), fork() ignores this, spawn() honors this
· Some functionality uncovered by capabilities
· Filesystem, network, etc. · Eg. root process with all capabilities dropped can still chmod / chown
· Some capabilities don't have ranges
· Eg. if you have PROCMGR_AID_SPAWN, you can spawn what you want
· Various capabilities can be used to elevate privileges to root
· Some directly: PROCMGR_AID_SPAWN_SETUID without range · Some more indirectly: PROCMGR_AID_INTERRUPT
· It's not a true sandbox!

`Breaking' Rootless Execution
· Parent starts low-priv child with PROCMGR_AID_IO / PROCMGR_AID_INTERRUPT
· Child attaches custom ISR handler -> runs in kernelspace -> invoke arbitrary procnto code

Qnet (Native Networking / TDP)

Qnet Security
· Useful for eg.
· Inter-module communication in ICS · Sharing cellular modem or Bluetooth transceiver among ECUs in automotive · Large routers with multiple interface cards (LWM IPC in Cisco IOS-XR)
· /net directory populated by discovered or mapped Qnet nodes

Qnet Security
· Meant to be used among `trusted nodes' · No authentication, simply passes User ID as part of Qnet packet to remote machine
· Execute commands remotely over Qnet
· Compromise single QNX machine or underlying network link
· access to all Qnet nodes at UID level
· No Qnet packet integrity / authentication ...
· Forge UIDs
· mapany / maproot options to map incoming UID to low-priv UID (similar to NFS)

Qnet EoP Vulnerability (CVE-2017-3891)
· Read permissions of operations over Qnet are not properly resolved by resource manager
· Allows for arbitrary remote read access · Can also be used for local arbitrary read access by making read requests originate from remote
Qnet node
· Bypasses mapany / maproot
· Patch available but Qnet security is fundamentally broken ...

QNX Debugging
· QNX Momentics IDE integrates GDB debugger capabilities
· nto<arch>-gdb.exe
· pdebug
· Process-level debugging over serial or TCP/IP
· qconn
· Remote IDE connectivity · Starts pdebug, default port 8000
· No authentication · Upload / download files, run anything as root
· There's a metasploit module for this

QNX Debugging
· dumper
· Service that produces post-crash core dump (default in /var/dumps) · Directly dump running process with dumper ­p <pid> · Nice for integration into fuzzers
· KDEBUG (gdb_kdebug)
· Kernel debugger over serial · Needs to be included with IFS (not by default, may need to be built from source) · Needs debuggable procnto

QNX Debugging
· Kernel Dump Format
· S/C/F: Signal / Code / Fault (signal.h / siginfo.h / fault.h) · C/D: Kernel code / data location · state: Kernel state · KSB: Kernel Stack Base · [x] PID-TID=y-z: Process and Thread ID on CPU x · P/T FL: Process and Thread Flags · instruction: Instruction where error occurred · context: Register values · stack: Stack contents

Pseudo-Random Number Generators (PRNGs)

PRNG Quality
· Why look at PRNGs?
· Foundation of wider cryptographic ecosystem
· `just use /dev/random' is received wisdom
· Strength of exploit mitigations (should) depend on strength of PRNGs
· If I can predict canary or ASLR address it makes exploit dev a lot easier

QNX Security-Oriented PRNGs
Userspace PRNG · Accessed through /dev/random · Handled by userspace service random running as root · Started after boot via /etc/rc.d/startup.sh
Kernelspace PRNG (QNX 7) · Implemented in procnto as function named random_value · Cannot be accessed directly in userspace

QNX 6 /dev/random
· Covered this in our talk `Wheel of Fortune' at 33C3
· Brief recap
· Underlying PRNG based on Yarrow (Schneier et al.) · But based on older Yarrow instead of reference Yarrow-160
· Has a bunch of sketchy cryptographic design decisions
· Low quality boot-time entropy · Broken reseed control · Entropy source selection up to
system integrators...

QNX 7 /dev/random
· Redesigned after our assessment of QNX 6 /dev/random
· Incorporates some of our feedback
· Uses Heimdal Fortuna implementation · New entropy sources · New reseed control mechanism · Overall quality seems much better than QNX 6 · Potential for weaknesses depending on system integration conditions

QNX 7 /dev/random

QNX 7 Kernel PRNG
· QNX 7 introduced new kernel PRNG after our assessment
· Used for ASLR, Stack Canaries, etc.
· random_seed set via SysSrandom syscall (requires PROCMGR_AID_SRANDOM)

Exploit Mitigations

Exploit Mitigation Quality
· Why look at exploit mitigations?
· Mitigations in GP didn't fall from the sky · History of weaknesses, bypasses, etc. in GP
* Patching Exploits with Duct Tape: Bypassing Mitigations & Backward Steps ­ James Lyne et al., 2015

QNX Exploit Mitigations

Mitigation Data Execution Prevention (DEP) Address Space Layout Randomization (ASLR) Stack Canaries Relocation Read-Only (RELRO)

Support Since 6.3.2 6.5 6.5 6.5

Enabled by Default?
   

No support for: · Vtable Protection (eg. VTGuard, VTV) · CPI / CFI (eg. CFG) · Kernel Data / Code Isolation (eg. SMAP/PAN, SMEP/PXN) · Etc.

QNX DEP

· Hardware-based DEP support (eg. NX/XN bit)
Architecture x86/x64 ARMv6+ MIPS PPC
· Insecure Defaults
· Stack always left executable · GNU_STACK ELF program header ignored

Support
  
~

· Need to specify "-m~x" in procnto startup flags to make stack non-exec
· Problem: this is system-wide setting, no opt-out

· Issue still present on QNX 6 & 7

QNX ASLR

· Enabled by starting procnto with "-mr" flag · Child processes inherit parent ASLR settings · Can be enabled/disabled on per-process basis · Randomizes objects at base-address level · Randomizes all memory objects except KASLR · PIE disabled by default in toolchain, no system
binaries have PIE

Memory Object Randomized

Userspace

Stack



Heap



Executable Image



Shared Objects



mmap()



Kernelspace

Stack



Heap



Kernel Image



mmap()



QNX ASLR

QNX ASLR ­ map_find_va
· (Among other things) randomizes virtual addresses returned by mmap
· Subtracts or adds a random value from/to found VA
· Takes lower 32 bits of RNG result · Bitwise left-shifted by 12 · Lower 24 bits extracted
· Contributes at most 12 bits of entropy (worse in practice)

QNX ASLR ­ stack_randomize
· Randomizes stack start address
· Subtracts random value from original SP
· Takes lower 32 bits of RNG result · Bitwise left-shifted by 4 · At most lower 11 bits extracted
· Contributes at most 7 bits of entropy (also worse in practice)
· But: is combined with result of map_find_va

QNX 6 ASLR ­ Weak RNG

· Upper bounds are actually optimistic

· QNX 6 ASLR uses weak RNG (CVE-2017-3893)

· ClockCycles() · 64-bit free-running cycle counter · Implementation is architecture-specific

Architecture
x86 ARM MIPS PPC SuperH

ClockCycles Implementation
RDTSC Emulation Counter Register Time Base Facility
TMU

QNX 6 ASLR ­ Weak RNG
· Evaluated actual entropy
· Measured processes across boot sessions, harvested memory object addresses · Used NIST SP800-90B Entropy Source Testing (EST) tool to obtain min-entropy estimates · 256 bits of uniformly random data = 256 bits of min entropy
· Average min-entropy: 4.47 bits
· Very weak, compare to
· Mainline Linux ASLR · PaX ASLR
* 32-bit system, ASLR-NG ­ Ismael Ripoll-Ripoll et al., 2016

QNX 6 ASLR ­ Bruteforcing

QNX 6 ASLR ­ Bruteforcing

QNX 6 ASLR ­ procfs Infoleak (CVE-2017-3892)

QNX 6 ASLR ­ procfs Infoleak (CVE-2017-3892)

QNX 6 ASLR ­ LD_DEBUG Infoleak (CVE-2017-9369)

QNX 7 ASLR ­ Changes
· ASLR still disabled by default, no KASLR
· But uses kernel PRNG now (random_value) discussed earlier
· Despite new RNG and 64-bit address space, low theoretical upper bounds remain
· 7 bits for stack_randomize · 12 bits for vm_region_create
· Always loaded in lower 32-bits of address space

QNX 7 ASLR ­ Changes
· LD_DEBUG (CVE-2017-9369) Fixed!
· procfs (CVE-2017-3892) Not completely Fixed...

QNX Stack Canaries
· QNX uses GCC's Stack Smashing Protector (SSP) · Compiler-side is what we're used to and is ok · OS-side implementations are custom · Userspace master canary generated at program startup when libc is loaded · Doesn't use libssp's __guard_setup but custom __init_cookies

QNX 6 SSP ­ Weak RNG
· Draws entropy from 3 sources
· Two of which only relevant if ASLR enabled
· All based on ClockCycles

QNX 6 SSP ­ Weak RNG
· Evaluated canary min-entropy over 3 configs
· No ASLR · ASLR but no PIE · ASLR + PIE
· Average min-entropy: 7.79 bits
· ASLR had no noticeable influence
· Less than ideal...
· Using CSPRNG should have 24 bits of min-entropy...
· We have 32-bit canary with 1 terminator-style NULL-byte

QNX 6 SSP ­ Kernelspace
· Problems even worse · Microkernel neither loaded nor linked against libc · Master canary generation cannot be done by __init_cookies · BUT: QNX forgot to implement replacement master canary generation routine · So kernelspace canaries are used, but never actually generated...
· Always 0x00000000

QNX 7 SSP ­ Changes
· Enabled by default! Generates 64-bit canaries
· For userspace QNX mixes in AUXV(AT_RANDOM) value with _init_cookies stuff
· Based on our best-practice suggestions to BlackBerry · ELF auxiliary vector transfers kernel info to user process upon startup · AT_RANDOM (0x2B) is 64-bit value from kernel PRNG
· For kernelspace QNX concats two 32-bit kernel PRNG values during early boot

Relocation Read-Only (RELRO)
· Dynamically linked binaries use relocation to do runtime lookup of symbols in shared libraries.
· .got: holds offsets · .plt: holds code stubs that look up addresses in .got.plt · .got.plt: holds target addresses after relocation
· Relocation data is popular target for overwriting to hijack control-flow
· Partial RELRO
· Reorder ELF sections so internal data (.got, .dtors, ...) precedes program data (.data, .bss)
· Relocation data is made read-only (covered by GNU_RELRO segment) after relocation, PLT GOT still writable
· Full RELRO
· Lazy binding disabled with BIND_NOW flag · PLT GOT is then also read-only

QNX 6 Broken RELRO (CVE-2017-3893)

· GNU_RELRO: [0x08049ED8, 0x8049FFF]
· Includes .got

·
·
·

Debian Linux

QNX 6.6

QNX 6 Broken RELRO (CVE-2017-3893)

Debian Linux

QNX 6.6

QNX 6 RELRO
· Also found a local bypass
· LD_DEBUG=imposter allows us to disable RELRO without privilege checks · Nice for exploiting setuid binaries
· Both issues are fixed with patches for QNX 6.6 and in QNX 7 

Final Remarks

Patches

· Disclosed all issues to BlackBerry
· Most issues fixed in 7.0, patches for 6.6 available for some issues * · Will take (lots of) time before patches filter down to OEMs & end-users...

Component

Issue

DEP

Insecure Defaults

ASLR

Weak RNG (CVE-2017-3893)

ASLR

procfs infoleak (CVE-2017-3892)

ASLR

LD_DEBUG infoleak (CVE-2017-9369)

SSP

Weak RNG

SSP

No kernel canaries

RELRO

Broken implementation (CVE-2017-3893)

RELRO

LD_DEBUG bypass

RNGs

Weak /dev/random

RNGs

No kernel PRNG

** Effectiveness still limited by low entropy upper bounds

Affected <= 7.0
<= 6.6 ** <= 7.0 <= 7.0 <= 6.6 <= 6.6 <= 6.6 <= 6.6 <= 6.6 <= 6.6

* http:// support.blackberry.com/kb/articleDetail?articleNumber=000046674, http://www.qnx.com/download/group.html?programid=26071

Conclusions
· Mostly ok on toolchain side
· Some weak defaults, some linker mistakes
· Problems reside on OS-side
· QNX cannot benefit directly from work in GP OS security because not easy to port 1-to-1 · Result: homebrew DIY mitigations
· Lack of prior attention by security researchers is evident
· Vulns that feel like they're from the early `00s
· Embedded RNG design remains difficult
· Entropy issues means design burden rests with system integrators

Conclusions
· QNX attempts to keep up with GP OS security
· One of the few non-Linux/BSD/Windows based embedded OSes with any exploit mitigations
· See `The RTOS Exploit Mitigation Blues' @ Hardwear.io 2017
· Quick & extensive vendor response, integration of feedback
· Need more attention to embedded OS security in general
· More QNX stuff in the future
· OffensiveCon, Black Hat Asia, Infiltrate

Questions?

See `Dissecting QNX' whitepaper

@s4mvartaka j.wetzels@midnightbluelabs.com
www.midnightbluelabs.com

@bl4ckic3 ali@ali.re

