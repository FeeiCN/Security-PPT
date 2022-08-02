Multi ARCH Firmware Emulation
#JDHITB2018 BEIJING, November 2018

Yu Tong KaiJern LAU

Why This Talk Exits and Thanks RD This Talk Is Part of 2nd Nov, Fuzzing Talk

About NGUYEN Anh Quynh
> Nanyang Technological University, Singapore > PhD in Computer Science > Operating System, Virtual Machine, Binary analysis, etc > Usenix, ACM, IEEE, LNCS, etc > Blackhat USA/EU/Asia, DEFCON, Recon, HackInTheBox,
Syscan, etc > Capstone disassembler: http://capstone-engine.org > Unicorn emulator: http://unicorn-engine.org > Keystone assembler: http://keystone-engine.org

About KaiJern

The Shepherd Lab
Stay in the office 24/7 by hoping making the world a better place
> IoT Research > Blockchain Research > Fun Security Research

Badge Maker
Founder of hackersbadge.com, RE && CTF fan
> Reversing Binary > Reversing IoT Devices > Part Time CtF player

HITB Security Conference
Hack in the box, Netherland and Singapore. Soon to be Beijing and Dubai
> 2006 till end of time > Core Crew > Review Board

> 2005, HITB CTF, Malaysia, First Place /w 20+ Intl. Team > 2010, Hack In The Box, Malaysia, Speaker > 2012, Codegate, Korean, Speaker > 2015, VXRL, Hong Kong, Speaker > 2015, HITCON Pre Qual, Taiwan, Top 10 /w 4K+ Intl. Team > 2016, Codegate PreQual, Korean, Top 5 /w 3K+ Intl. Team > 2016, Qcon, Beijing, Speaker > 2016, Kcon, Beijing, Speaker > 2016, Intl. Antivirus Conference, Tianjin, Speaker

> 2017, Kcon, Beijing, Trainer > 2017, DC852, Hong Kong, Speaker > 2018, KCON, Beijing, Trainer > 2018, DC010, Beijing, Speaker > 2018, Brucon, Brussel, Speaker > 2018, H2HC, San Paolo, Brazil > 2018, HITB, Beijing/Dubai, Speaker > 2018, beVX, Hong Kong, Speaker

> MacOS SMC, Buffer Overflow, suid > GDB, PE File Parser Buffer Overflow > Metasploit Module, Snort Back Oriffice > Linux ASLR bypass, Return to EDX

Your Very First IoT Device
Some Said Wi-Fi Router

Why Hacking IoT
Remembering, smashing the stack for fun and profit

Why IoT Research Is Important

Firmware Emulation

Skorpio DBI

Guided Fuzzer for Embedded

> Without built-in shell access for user interaction
> Without developement facilities required for building new tools
> Compiler
> Debugger
> Analysis tools

> Binary only - without source code
> Existing guided fuzzers rely on source code available
> Source code is needed for branch instrumentation to feedback fuzzing progress
> Emulation such as QEMU mode support in AFL is slow & limited in capability

> Same issue for other tools based on Dynamic Binary Instrumentation

> Most fuzzers are built for X86 only
> Embedded systems based on Arm, Arm64, Mips, PPC
> Existing DBIs are poor for non-X86 CPU
> Pin: Intel only
> DynamoRio: experimental support for Arm

Back to School Edition: DEFINATION of IoT

Definition of IoT ­ From The Book
Any Online-able THINGS

The Real Definition of IoT
Human Operated + Online-able Item + AI Capability
* Data Mining(maybe) Business *

Attack Surface

Attacker Perspective
> Vendor Data Center Security > Communication Protocol
Again, Why? Is To Discover The Truth
> Data Transmission Hijack > Sniffing > Household Security > Device Password

> Server OS Security > Application Security

Back To 101

Everything is small, Including SECURITY

 System on Chip  A chip with all the PCI-e slot and card in it  Pinout to different parts  WiFi, Lan, Bluetooth and etc  Low power device

 Strip Down Power Usage  Strip Down Size  Strip Down Processing  Strip Down SECURITY

Skillz

Requirement
Understanding The Board

Requirement: Software
Skill @ GNU Command Set

Lets Get Started

Device Limited Bug
If all_model = one_firmware
In The Beginning: We Need Firmware

Getting Firmware

Firmware and Hardware
c
Extract From APK, Traffic Sniffing or Just Download
1. Download 2. Patch with Backdoor 3. Flash 4. pwned
c
If we need more ? 1. RCE 2. Study the firmware

Firmware Architecture

Romance of 3 Kingdom

MIPS

ARM
We learn from the hard way (aka story time)

AARCH64

The Easy Way

Complete Kit to Success

MIPS
Interchangeable Base Board

ARM

AARCH64
If There are only 3 platform, Download, Flash, Reverse and pwn !!!

If *ARM/AARCH64* Why Not Raspberry PI

LIBC Compatibility

MIPS
Not Supported by Raspberry PI

ARM

AARCH64
Raspberry PI Is not *reverser* Friendly So, QEMU is a MUST

Assembly Instruction Compatibility

ARM

AARCH64

Current Work Around

Qemu Static
QEMU-Static is good for binary execution without additional software or hardware interection

Current Primitive Firmware Emulation
Leaving squashfs and going into a unknown world Its not easy after 2016

Why Firmware Emulation

More Resources = More Power

Multicore

MAX RAM

MAX Space

Processor
Normally 1-2 Core

RAM
Normally 256MB/512MB

FLASH
Normally 8MB/16MB/32MB/256MB
Most Important, we got apt-get

Objectives

Only One Process with Interaction

Hunt for the one that spawn listener port

most of the devices comes with one big binary

Booting Up

Distro and Kernel Mix and Match
script to boot arm

script to boot mips

argument: running new or old distro + kernel

chroot

Easy Way Out, chroot
chroot is easy (still hardware dependent), but we will have issue with tools
Running without chroot

Classic Case: File Not Found

The File Missing Trick
We Missed You
We found you

The missing .SO and binary Issue

Out from chroot, we need feeeding
Feeding all the required so and binary with "ln ­s"

Out from chroot, we need feeding
Classical file not found error
"segfault" without clear error. strace come to rescue

The Secretive NVRAM

Dark side of NVRAM

main process

ask for nvram info

Relationship between main binary is so intimate, but in actual fact. Is just a hit and run

reply with nvram info

interactor

Dark Side of NVRAM

main process

ask for nvram info

Relationship between main binary is so intimate, but in actual fact. Is just a hit and run

reply with nvram info

Dark Side of the main process, we ignore and con't to next step

interactor

A fake NVRAM

main process
ask for nvram info IF interactor is the medium, can we fake it ?
reply with nvram info
interactor

A fake NVRAM

main process
ask for nvram info IF interactor is the medium, can we fake it ?
reply with nvram info
interactor Custom Interactor

br0

The bridge trick

The switch looking device

Wireless Device

Faking wpa_supplicant
making eth0 looks like wlan0 works too

Everything Things Else Fail

BL, BNE, BEQ and friends
Original BIN

Patched BIN

Argument: To Patch or To Fulfill Firmware Needs

DEMO *bug disclosed in geekpwn 2018, shanghai*

Web Cam Buffer Overflow
Pre Authentication Bug Buffer Overflow
Address Overwritten Debug is almost Impossible *watchdog*
Emulation comes into play

IoT with UDP Access
Web Cam with Motor

Command Execution Injection
Chinese based WiFi Router

Questions
Multi ARCH Firmware Emulation

Yu Tong KaiJern LAU

