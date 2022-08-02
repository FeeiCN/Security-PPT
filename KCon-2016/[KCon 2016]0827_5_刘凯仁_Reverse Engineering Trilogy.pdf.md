Bio

About Me

Almost Every Weekend
With VN Security since year 2009
> CTF player > Weekend gamer

Most of the time
Running zxandora.com project.
> Soon > Very Soon > Brand New Online
Sandbox

Once a year
Hack in The Box Crew
> Good friends > CTF CTF and CTF

About Me
> 2008, Hack In The Box CTF Winner > 2010, Hack In The Box Speaker, Malaysia > 2012, Codegate Speaker, Korea > 2015, VXRL Speaker, Hong Kong > 2015, HITCON CTF, Prequal Top 10 > 2016, Codegate CTF, Prequal Top 5 > 2016, Qcon Speaker, Beijing

> OSX, Local Privilege Escalation > Code commit for metasploit 3 > GDB Bug hunting > Metasploit module > Linux Randomization Bypass > http://www.githiub.com/xwings/tuya > : @kaijern

vnsecurity.net

Introduction
VN Security > Active CTF Player (CLGT) > Active speaker at conferences
> Blackhat USA > Tetcon > Hack In The Box > Xcon
Nguyen Anh Quynh
> Security Researcher > Active speaker at conferences
> Blackhat USA > Syscan > Hack In The Box > Xcon

> Our Tools

> Nations

> PEDA

> Vietnamese

> Unicorn/ Capstone/ Keystone

> Malaysian

> Xandora

> Singaporean

> OllyDbg, Catcha!

> ROPEME

> Research Topics > Emulators > Virtualization > Binary Analysis > Tools for Malware Analysis

When gdb meets peda
GDB

PEDA

Why KCON

Fake Websites

What Are These Things

What Is Disassembler
 From binary to assembly code
 Core part of all binary analysis/ reverse engineering / debugger and exploit development
 Disassembly framework (engine/library) is a lower layer in stack of architecture

Example
§ 01D8 = ADD EAX,EBX (x86) § 1169 = STR R1,[R2] (ARM's Thumb)

Binary Analysis

Debugger

Exploit Development

Disassembler Engine

CPU Emulator Engine

Assembler Engine

What Is Emulator
 Software only CPU Emulator  Core focus on CPU
operations.  Design with no machine
devices  Safe emulation environment  Where else can we see CPU
emulator. Yes, Antivirus

Example
§ 01D1 = add eax,ebx (x86)
§ Load eax & ebx register § Add value of eax & ebx then copy the result to eax § Update flag OF, SF, ZF, AF, CF, PF accordingly

BinBainryary AnAanlyasliyssis

Debugger

ExEplxopitloDiteDvelvoeplmopemntent

Disassembler Engine

CPU Emulator Engine

Assembler Engine

What Is Assembler
 From assembly to machine code
 Support high level concepts such as macro, functions and etc.
 Dynamic machine code generation

Example
§ ADD EAX,EBX = 01D8 (x86) § STR R1,[R2] = 1169 (ARM's Thumb)

BinBairnyary AnAalnyasliyssis

Debugger

ExEpxlopitloDiteDvevloeplompemnet nt

Disassembler Engine

CPU Emulator Engine

Assembler Engine

Where are we currently

Showcase

> CEnigma > Unicorn > CEbot > Camal > Radare2 > Pyew > WinAppDbg > PowerSploit > MachOview > RopShell > ROPgadget > Frida > The-Backdoor-Factory > Cuckoo

> Cerbero Profiler > CryptoShark > Ropper > Snowman > X86dbg > Concolica > Memtools Vita > BARF > rp++ > Binwalk > MPRESS dumper > Xipiter Toolkit > Sonare > PyDA

> Qira

> Shwass

> Rekall

> Nrop

> Inficere

> Illdb-capstone-arm

> Pwntools

> Capstone-js

> Bokken

> ELF Unstrip Tool

> Webkitties

> Binjitsu

> Malware_config_parsers > Rop-tool

> Nightmare

> JitAsm

> Catfish

> OllyCapstone

> JSoS-Module-Dump

> PackerId

> Vitasploit

> Volatility Plugins

> PowerShellArsenal

> Pwndbg

> PyReil

> Lisa.py

> ARMSCGen

> Many Other More

Showcase

> UniDOS: Microsoft DOS emulator. > Radare2: Unix-like reverse engineering framework and commandline tools. > Usercorn: User-space system emulator. > Unicorn-decoder: A shellcode decoder that can dump self-modifying-code. > Univm: A plugin for x64dbg for x86 emulation. > PyAna: Analyzing Windows shellcode. > GEF: GDB Enhanced Features. > Pwndbg: A Python plugin of GDB to assist exploit development. > Eli.Decode: Decode obfuscated shellcodes. > IdaEmu: an IDA Pro Plugin for code emulation.

> Roper: build ROP-chain attacks on a target binary using genetic algorithms. > Sk3wlDbg: A plugin for IDA Pro for machine code emulation. > Angr: A framework for static & dynamic concolic (symbolic) analysis. > Cemu: Cheap EMUlator based on Keystone and Unicorn engines. > ROPMEMU: Analyze ROP-based exploitation. > BroIDS_Unicorn: Plugin to detect shellcode on Bro IDS with Unicorn. > UniAna: Analysis PE file or Shellcode (Only Windows x86). > ARMSCGen: ARM Shellcode Generator. > TinyAntivirus: Open source Antivirus engine designed for detecting & disinfecting
polymorphic virus. > Patchkit: A powerful binary patching toolkit.

Showcase

> Keypatch: IDA Pro plugin for code assembling & binary patching. > Radare2: Unix-like reverse engineering framework and commandline tools. > GEF: GDB Enhanced Features. > Ropper: Rop gadget and binary information tool. > Cemu: Cheap EMUlator based on Keystone and Unicorn engines. > Pwnypack: Certified Edible Dinosaurs official CTF toolkit. > Keystone.JS: Emscripten-port of Keystone for JavaScript. > Usercorn: Versatile kernel+system+userspace emulator. > x64dbg: An open-source x64/x32 debugger for windows. > Liberation: a next generation code injection library for iOS cheaters
everywhere.

> Strongdb: GDB plugin for Android debugging. > AssemblyBot: Telegram bot for assembling and disassembling on-the-go. > demovfuscator: Deobfuscator for movfuscated binaries. > Dash: A simple web based tool for working with assembly language. > ARMSCGen: ARM Shellcode Generator. > Asm_Ops: Assembler for IDA Pro (IDA Plugin). > Binch: A lightweight ELF binary patch tool. > Metame: Metamorphic code engine for arbitrary executables. > Patchkit: A powerful binary patching toolkit. > Pymetamorph: Metamorphic engine in Python for Windows executables.

Born of The Trinity

Fundamental Frameworks for Reversing

 Components for a complete RE framework
 Interchange between assembler and disassembler
 A full CPU emulator always help when comes with obfuscated code

Binary

Capstone Keystone Unicorn

Assembly

Capstone Engine
NGUYEN Anh Quynh <aquynh -at- gmail.com> http://www.capstone-engine.org

What's Wrong with Current Disassembler
 Nothing works even up until 2013 (First release of Capstone Engine)  Looks like no one take charge  Industry stays in the dark side

What do we need ?
 Multiple archs: x86, ARM+ ARM64 + Mips + PPC and more
 Multiple platform: Windows, Linux, OSX and more
 Multiple binding: Python, Ruby, Java, C# and more

 Clean, simple, intuitive & architecture-neutral API
 Provide break-down details on instructions
 Friendly license: Not GPL

Lots of Work !
 Multiple archs: x86, ARM
 Actively maintained & update within latest arch's change
 Multiple platform: Windows, Linux
 Understanding opcode, Intel x86 it self with 1500++ documented instructions

 Support python and ruby as binding languages
 Single man show
 Target finish within 12 months

A Good Disassembler
 Multiple archs: x86, ARM  Actively maintained & update
within latest arch's change  Multiple platform: Windows,
Linux

 Support python and ruby as binding languages
 Friendly license: BSD
 Easy to setup

Not Reinventing the Wheel
 Open source project compiler  Sets of modules for machine code representing, compiling, optimizing  Backed by many major players: AMD, Apple, Google, Intel, IBM, ARM, Imgtec, Nvidia,
Qualcomm, Samsung, etc  Incredibly huge (compiler) community around.

Fork from LLVM
 Multiple architectures ready  In-disassembler (MC module)
 Only, Only and Only build for LLVM  actively maintained by the original vendor from the arch building company (eg, x86 from intel)  Very actively maintained & updated by a huge community

Are We Done

Issues
> Cannot just reuse MC as-is without huge efforts. > LLVM code is in C++, but we want C code. > Code mixed like spaghetti with lots of LLVM layers, not easy to take out > Need to build instruction breakdown-details ourselves. > Expose semantics to the API. > Not designed to be thread-safe. > Poor Windows support.
> Need to build all bindings ourselves. > Keep up with upstream code once forking LLVM to
maintain ourselves.

Solutions
> Fork LLVM but must remove everything we do not need
> Replicated LLVM's MC > Build around MC and not changing MC > Replace C++ with C
> Extend LLVM's MC > Isolate some global variable to make sure thread-safe
> Semantics information from TD file from LLVM > cs_inn structure
> Keep all information and group nicely > Make sure API are arch-independent

Capstone is not LLVM
More Superiors
> Zero dependency > Compact in size > More than assembly code > Thread-safe design > Able to embed into restricted firmware OS/
Environments > Malware resistance (x86) > Optimized for reverse engineers > More hardware mode supported:- Big-Endian for
ARM and ARM64 > More Instructions supported: 3DNow (x86)

More Robust
> Cannot always rely on LLVM to fix bugs > Disassembler is still conferred secondsclass LLVM, especially if does not affect code generation > May refuse to fix bugs if LLVM backed does not generate them (tricky x86 code)
> But handle all comer case properly is Capstone first priority
> Handle all x86 malware ticks we aware of > LLVM could not care less

Demo

Showcase: x64dbg

Unicorn Engine
NGUYEN Anh Quynh <aquynh -at- gmail.com> DANG Hoang Vu <danghvu -at- gmail.com> http://www.unicorn-engine.org

What's Wrong with Current Emulator
 Nothing works even up until 2015 (First release of Unicorn Engine)  Limited bindings  Limited functions, limited architecture

What Do We Need ?
 Multiple archs: x86, x86_64, ARM+ ARM64 + Mips + PPC
 Multiple platform: Windows, Linux, OSX, Android and more
 Multiple binding: Python, Ruby, Java, C# and more

 Pure C implementation
 Latest and updated architecture
 With JIT compiler technique
 Instrumentation eg. F7, F8

Lots of Work !
 Multiple archs: x86, ARM
 Actively maintained & update within latest arch's change
 Multiple platform: Windows, Linux
 Understanding opcode, Intel x86 it self with 1500++ documented instructions

 Support python and ruby as binding languages
 Single man show
 Target finish within 12 months

A Good Emulator
 Multiple archs: x86, x86_64, ARM, ARM64, Mips and more
 Actively maintained & update within latest arch's change
 Multiple platform: Windows, Linux, OSX, Android and more

 Code in pure C
 Support python and ruby as binding languages
 JIT compiler technique
 Instrumentation at various level
 Single step  Instruction  Memory Access

Not Reinventing the Wheel
 Open source project on system emulator  Very huge community and highly active  Multiple architecture: x86, ARM, ARM64, Mips, PowerPC, Sparc, etc (18 architectures)  Multiple platform: *nix and Windows

Fork from QEMU
 Support all kind of architectures and very updated  Already implemented in pure C, so easy to implement Unicorn core on top  Already supported JIT in CPU emulation, optimization on of of JIT  Are we done ?

Are We Done
Issues 1 > Not just emulate CPU, but also device models &
ROM/BIOS to fully emulate physical machines > Qemu codebase is huge and mixed like spaghetti > Difficult to read, as contributed by many different
people

Solutions
> Keep only CPU emulation code & remove everything else (devices, ROM/BIOS, migration, etc)
> Keep supported subsystems like Qobject, Qom
> Rewrites some components but keep CPU emulation code intact (so easy to sync with Qemu in future)

Issues 2
> Set of emulators for individual architecture > Independently built at compile time > All archs code share a lot of internal data structures and global variables
> Unicorn wants a single emulator that supports all archs

Solutions
> Isolated common variables & structures > Ensured thread-safe by design
> Refactored to allow multiple instances of Unicorn at the same time Modified the build system to support multiple archs on demand

Are We Done
Issues 3 > Instrumentation for static compilation only > JIT optimizes for performance with lots of fast-path
tricks, making code instrumenting extremely hard
Issues 4 > Objects is open (malloc) without closing (freeing)
properly everywhere > Fine for a tool, but unacceptable for a framework

Solutions
> Build dynamic fine-grained instrumentation layer from scratch Support various levels of instrumentation > Single-step or on particular instruction (TCG level) > Instrumentation of memory accesses (TLB level) > Dynamically read and write register > Handle exception, interrupt, syscall (archlevel) through user provided callback.
Solutions
> Find and fix all the memory leak issues > Refactor various subsystems to keep track and
cleanup dangling pointers

Unicorn Engine is not QEMU
 Independent framework  Much more compact in size, lightweight in memory  Thread-safe with multiple architectures supported in a single binary Provide interface for
dynamic instrumentation  More resistant to exploitation (more secure)
 CPU emulation component is never exploited!  Easy to test and fuzz as an API.

Demo

Showcase: box.py

Keystone Engine
NGUYEN Anh Quynh <aquynh -at- gmail.com> http://www.keystone-engine.org

What's Wrong with Assembler
 Nothing is up to our standard, even in 2016! Yasm: X86 only, no longer updated
 Intel XED: X86 only, miss many instructions & closed-source  Use assembler to generate object files  Other important archs: Arm, Arm64, Mips, PPC, Sparc, etc?

What do we need?
 Multiple archs: x86, ARM+ ARM64 + Mips + PPC and more
 Multiple platform: Windows, Linux, OSX and more
 Multiple binding: Python, Ruby, Java, C# and more

 Clean, simple, intuitive & architecture-neutral API
 Provide break-down details on instructions
 Friendly license: BSD

Lots of Work !
 Multiple archs: x86, ARM
 Actively maintained & update within latest arch's change
 Multiple platform: Windows, Linux
 Understanding opcode, Intel x86 it self with 1500++ documented instructions

 Support python and ruby as binding languages
 Single man show
 Target finish within 12 months

A Good Assembler
 Multiple archs: x86, ARM  Actively maintained & update
within latest arch's change  Multiple platform: Windows,
Linux

 Support python and ruby as binding languages
 Friendly license (BSD)
 Easy to setup

Not Reinventing the Wheel
 Open source project compiler  Sets of modules for machine code representing, compiling, optimizing  Backed by many major players: AMD, Apple, Google, Intel, IBM, ARM, Imgtec, Nvidia,
Qualcomm, Samsung, etc  Incredibly huge (compiler) community around.

Fork from LLVM
 Multiple architectures ready  In-build assembler (MC module)
 Only, Only and Only build for LLVM  actively maintained  Very actively maintained & updated by a huge community

Are We Done
Issue 1 > LLVM not just assembler, but also disassembler,
bitcode, InstPrinter, Linker Optimization, etc > LLVM codebase is huge and mixed like spaghetti
Issue 2 > LLVM compiled into multiple libraries
> Supported libs > Parser > TableGen and etc > Keystone needs to be a single library

Solutions
> Keep only assembler code & remove everything else unrelated
> Rewrites some components but keep AsmParser, CodeEmitter & AsmBackend code intact (so easy to sync with LLVM in future, e.g. update)
> Keep all the code in C++ to ease the job (unlike Capstone) > No need to rewrite complicated parsers > No need to fork llvm-tblgen
Solutions
> Modify linking setup to generate a single library > libkeystone.[so, dylib] + libkeystone.a > keystone.dll + keystone.lib

Are We Done
Issue 3 > Relocation object code generated for linking in the
final code generation phase of compiler > Ex on X86:
> inc [_var1]  0xff, 0x04, 0x25, A, A, A, A

Solutions
> Make fixup phase to detect & report missing symbols
> Propagate this error back to the top level API ks_asm()

Issue 4
> Ex on ARM: blx 0x86535200  0x35, 0xf1, 0x00, 0xe1

Solutions
> ks_asm() allows to specify address of first instruction
> Change the core to retain address for each statement
> Find all relative branch instruction to fix the encoding according to current & target address

Are We Done
Issue 5
> Ex on X86: vaddpd zmm1, zmm1, zmm1, x  "this is not an immediate"
> Returned llvm_unreachable() on input it cannot handle

Solutions
> Fix all exits & propagate errors back to ks_asm() > Parse phase > Code emit phase

Issue 6
> LLVM does not support non-LLVM syntax > We want other syntaxes like Nasm, Masm, etc
> Bindings must be built from scratch > Keep up with upstream code once forking LLVM to
maintain ourselves

Solutions
> Extend X86 parser for new syntaxes: Nasm, Masm, etc
> Built Python binding
> Extra bindings came later, by community: NodeJS, Ruby, Go, Rust, Haskell & OCaml
> Keep syncing with LLVM upstream for important changes & bug-fixes

Keystone is not LLVM
Fork and Beyond
> Independent & truly a framework > Do not give up on bad-formed assembly
> Aware of current code position (for relative branches)
> Much more compact in size, lightweight in memory > Thread-safe with multiple architectures supported
in a single binary More flexible: support X86 Nasm syntax > Support undocumented instructions: X86 > Provide bindings (Python, NodeJS, Ruby, Go, Rust, Haskell, OCaml as of August 2016)

Demo

Show Case: metame

Before

After

One More Thing

The IDA Pro

IDA Pro § RE Standard § Patching on the fly is always a must § Broken "Edit\Patch Program\ Assembler" is always giving us problem

PUSH RAX

ARM

PUSH ESI

Keypatch
A binary editor plugin for IDA Pro § Fully open source @ https://keystone-engine.org/keypatch § On the fly patching in IDA Pro with Multi Arch § Base on Keystone Engine § By Nguyen Anh Quynh & Thanh Nguyen (rd) from vnsecurity.net

Latest Keypatch and DEMO
Fill Range § Select Start, End range and patch with bytes § Goto: Edit | Keypatch | Fill Range § QQ: 2880139049

THANKS
[ Hacker@KCon ]

