Breaking Through Another Side
Bypassing Firmware Security Boundaries from Embedded Controller

Alex Matrosov

Alexandre Gazet

Actually 5 months of passionate reverse-engineering nights
Disclaimer
All the details given about BIOS Guard technology is based on our own analysis and reverse-engineering1. Even with our best intents it may be inaccurate or contains errors.
1Actually ~5 months of passionate reverse-engineering nights in Portland and Toulouse 
2

What are the Security Boundaries in HW world?
 Limitations of current Threat Model  Security boundaries for firmware update process
Dissecting an Embedded Controller
 EC internals and previous attacks  Why is EC not a security boundary?  Breaking Lenovo EC update process
Deep dive into Bios Guard
 BIOS Guard internals (include BG script)  EC and BIOS Guard relations  Attack scenarios from BIOS and EC
3

What are Security Boundaries in HW world?

How many 3rd-party chips in your laptop?

 TPM module  USB controller  Embedded Controller (EC)  Fingerprint Reader  Touchpad  and many others

Boot Guard

BIOS Guard

TXT

Network
Graphics
Sensors Embedded Controller (EC)

ACM
UEFI Firmware Image

CPU Microcode Management
Engine AMT
BMC

PMU

SMC
5

Hardware Security Boundaries
Most of those chips are:
 Not under direct control from laptop vendors  Involved in security features implementation  Connected to UEFI firmware (BIOS)  Considered to generate trusted I/O  Mostly out of the supervision scope of the main CPU
How can we trust anything that is not under our system control?
6

HW/FW Security != sum of all Boundaries

TPM SSD/RAID

Embedded Controller
UEFI System Firmware

GPU Network

PMU

BMC

7

In current threat model HW is trusted 

@uffeu x

@qrs

https://github.com/nccgroup/TPMGenie
8

Intel Boot Guard TOCTOU from SPI flash
@qrs @peterbjornx
Authenticated once != trusted forever

https://edk2-docs.gitbooks.io/security-advisory/content/bootguard-toctou-vulnerability.html

9

BMC is inside trusted boundaries
UEFI firmware blindly trust all hardware But hardware can attack UEFI firmware 
https://airbus-seclab.github.io/ilo/ZERONIGHTS2018-Slides-EN-Turning_your_BMC_into_a_revolving_door-perigaud-gazet-czarny.pdf 10

Why EC got our attention?
We were researching BIOS Guard implementation on P50. Surprisingly to us, we found some relations between EC and BIOS Guard (will be discussed later in details).
11

Dissecting Embedded Controller
Our target platforms: Lenovo P50 and T540p

What is an Embedded Controller (EC)?
 Small 32-bit microcontroller, power every laptop  Responsible for multiple things
 Power management and battery life control  Thermal control sensors  Keyboard controller and dispatcher
 Also involved in security features implementation  Manufacturing mode locks  Keeping secrets outside of BIOS and NVRAM  Intel BIOS Guard implementation
13

Lenovo ThinkPad EC
 Microchip MEC16xx family  MEC1653 for Lenovo P50  MEC1633 for Lenovo P540p  ROM size 280k  ARC-625D processor core  Multi-device advanced I/O controller  Collection of logical devices:
 Keyboard Controller (8042)  ACPI EC Channels (4 of them)  Embedded Flash Interface  etc.

CPU

PCH

SPI

SPI Flash

LPC/SMBUS

Embedded Controller

SPI EC Flash
14

Modern EC SoC

http://ww1.microchip.com/downloads/en/DeviceDoc/00002338A.pdf

15

Mapping Embedded Controller Endpoints

"Logical devices [...] are peripherals that are located on the MEC16xx and are accessible to the Host over the LPC bus." Low Pin Count (LPC) interface from EC point of view:
 Is itself a Logical Device (LD)  Logical Device Number 0xC (LDN)  Used to expose other LDs on the LPC bus  Configuration registers (BAR) in the range FF_3360h - FF_3384h
17

Methodology
From EC:  Identify LPC BAR configuration code  Recover logical device  IO ports mapping  EC's endpoints exposed to host
From host:  Find UEFI/BIOS  EC communications  EDK2 EFI_CPU_IO2_PROTOCOL  Lenovo's EcIoDxe and EcIoSmm modules
18

Recovered mapping

 LDN00 (MAILBOX_INTERFACE)

0x1610

 LDN01 (KEYBOARD_CONTROLLER_8042) 0x0060-0x0064

 LDN02 (ACPI_EC_0)

0x0062-0x0066

 LDN03 (ACPI_EC_1)

0x1600-0x1604

 LDN04 (ACPI_EC_2)  LDN05 (ACPI_EC_3)

0x1630-0x1634 0x1618

 LDN07 (UART)

0x03F8

 LDN0E (EMBEDDED_FLASH_INTERFACE) 0x1612-0x1616

 LDN11 (EM_INTERFACE_0)

0x1640

 LDN20 (BIOS_DEBUG_PORT_0)

0x1608

 LDN21 (BIOS_DEBUG_PORT_1)  LDN30 (unknown)

0x160A 0x15E0

19

Attacking EC Update Process

Previous very cool works
Alexandre Gazet
«Sticky finger & KBC Custom Shop», Recon 2011  http://esec-lab.sogeti.com/static/publications/11-recon-stickyfingers_slides.pdf
Matthew Chapman
Unlocking my Lenovo laptop  http://zmatt.net/unlocking-my-lenovo-laptop-part-1/
Hamish Coleman
Infrastructure for examining and patching Thinkpad embedded controller firmware  https://github.com/hamishcoleman/thinkpad-ec
21

EC firmware update process
On many platforms EC firmware not authenticated just flashed "as is"
 Typical EC programming is just read/write to HW port
 Verification is about integrity of flashed bytes  Authentication mostly implemented outside of EC

https://github.com/system76/ecflash

https://github.com/hughsie/fwupd/tree/master/plugins/superio

22

The ways to gain persistence on EC
 Physical access (most of the cases JTAG on EC chip not disabled)  EC Update Tool from OS (usually the same tool as BIOS update)  BIOS EC update DXE driver can be called from SMM or DXE shellcode  All EC image authentication is happening in BIOS, architectural
problem with TOCTOU by design hard to avoid
23

Impact of EC update auth bypass
24

Lenovo Thinkpad EC update process
 Target system: Lenovo Thinkpad T540p and P50  P50 EC chip: MEC1653  Update tools from OS initiate EC update process  BIOS responsible for flashing and authenticating the update image
EcFwUpdateDxe (0C396FCA-6BDA-4A15-B6A3-A6FA4544BDB7) 
25

Lenovo Thinkpad EC update header
26

Lenovo Thinkpad EC update process
OS

Lenovo TDK update tool

map EC update image to memory

set NVRAM var LenovoEcfwUpdate

Lenovo EcFwUpdateDxe (not SMM)

BIOS

27

Lenovo Thinkpad EC update process
OS

Lenovo TDK update tool

map EC update image to memory

set NVRAM var LenovoEcfwUpdate

Lenovo EcFwUpdateDxe (not SMM)

BIOS

28

T540p EC can be exploited from OS by simple EC command sequence replay
Host flash access not locked 
29

Boot Guard saves the day?

 4th Intel Core generation

 Measure/verified boot

 "Hardware root of trust"

 Boot Guard coverage in the hand of

OEMs

Locked in Hardware

CPU Reset

CPU Microcode

Boot Guard ACM

Reset Vector

Locked in BIOS

OS Loader

Secure Boot (DXE + BDS)

IBB (SEC + PEI)

30
https://medium.com/@matrosov/bypass-intel-boot-guard-cc05edfca3a9

So can we just patch the EcFwUpdateModule again on P50?

Lenovo Thinkpad EC signature check
 EC update image mapped from OS update tool (TDK)  Validate CRC16 checksum of EC image is correct  Copy SecureFlash public key to EC related HOB  Calculate RSA_verify(ECFW_signature, HOB_pulickey)  IF signature correct: global sign_correct = TRUE;  IF sign_correct == TRUE update EC firmware
32

Lenovo Thinkpad EC signature check
 EC update image mapped from OS update tool (TDK)  Validate CRC16 checksum of EC image is correct  Copy SecureFlash public key to EC related HOB  Calculate RSA_verify(ECFW_signature, HOB_pulickey)  IF signature correct: global sign_correct = TRUE;  IF sign_correct == TRUE update EC firmware
33

Lenovo P50 EC signature check flow

EcFwUpdateDxe

check signature

if correct continue

flash EC update
34

Now, can we do the same attack with newer P50?

P50 try-harder
On Thinkpad P50 and newer:
 Stronger coupling of security
boundaries
 Boot Guard IBB hash coverage is
better
 And...
36

P50 try-harder
Host flash access needs to be enabled by additional command to unlock 
 On the EC mem_conf_is_bg_auth check a
status bit
 Set when the EC receives a magic value  Shared secret between the BIOS and the EC
37

P50 try-harder
 Shared secret sent from the BIOS
Can we simply replay it? 
38

P50 try-harder
Nope, reduced window of opportunity with sanity check:
 EcFwUpdateModule sends a new
command: 0xDF
 Lock the EC update in early BIOS  Authentication no more
possible on EC without reset
39

Lenovo disclosure timeline
 05/30 - Submit issue to Lenovo PSIRT  06/03 ­ Joint call with Lenovo PSIRT, answered questions and
submit additional information
 07/11 ­ CVE assigned for T540p report -> CVE-2019-6171  08/08 - Today is happy Disclosure day!
Lenovo Security Advisory: https://support.lenovo.com/solutions/LEN-27764
Special thanks to Beverly Miller Alvarez from Lenovo PSIRT for her help in disclosure process! 40

EC take-aways
 Were looking for BIOS Guard ephemeral value auth  Found static shared secret between BIOS and EC  Can be abused in some scenario up to EC rootkit  => No EC BIOS Guard ephemeral value support for
these laptop lines (yet)
 Boot Guard does not fully protect from rogue
update at runtime
 What does BIOS Guard would have change?
41

Deep dive into BIOS Guard

Intel BIOS Guard in a nutshell
 Rationale: BIOS security boundary is insufficient to protect critical code
responsible for BIOS or EC firmware update
 Proposal: deport code to a safer environment:
Authenticated Code Module RAM (ACM-RAM)
43 https://www.intel.com/content/dam/www/public/us/en/documents/white-papers/security-technologies-4th-gen-core-retail-paper.pdf

What is Intel BIOS Guard?
 Platform Flash Armoring Technology (PFAT)
 Armoring SPI Flash access
 Access controlled by BIOS Guard ACM  Partially implemented in Microcode, PCH, BIOS and EC  PCH locked SPI flash access without PFAT
 BIOS update authentication
 Authenticated by BIOS Guard ACM
 Game over for malicious updates?
 Physical access + direct programming SPI flash still possible  POST update verification only relies on Intel Boot Guard integrity
44

45 https://wenku.baidu.com/view/f1d955c46bd97f192379e9aa

46 https://wenku.baidu.com/view/f1d955c46bd97f192379e9aa

Lenovo Thinkpad PFAT update process

 Lenovo TDK update framework maps new BIOS image into memory

 Triggers BIOS Guard tool SMI over ACPI

 Sends BGUP memory address, BGUP size, IO Trap address

 BIOS Guard SMI sets BG directory, trigger MSR to load ACM

 ACM triggers Microcode flow to verify

and apply BIOS Guard update and

reboot machine

47

Resources
 Platform Firmware Armoring Technology (PFAT) patents
US 2013/0219191 A1 & US 2012/0072734 A1

 Dell Firmware Security, 2018, Justin Johnson
https://www.platformsecuritysummit.com/2018/speaker/johnson/PSEC2018-Dell-Firmware-Security-Justin-Johnson.pdf

 Betraying the BIOS: Going Deeper into BIOS Guard Implementations,
2018, Alex Matrosov
https://github.com/REhints/Publications/blob/master/Conferences/Betraying%20the%20BIOS/Offensivecon_18%5Bv2.0%5D.pdf

 Cross-analysis of BIOS implementations:

 Phoenix-based: Lenovo Thinkpad P50, T540

 AMI-base: Gigabyte C246, Lenovo IdeaPad, Dell Inspiron

48

BIOS Guard at hardware (Intel) level
From now on, we focus on Lenovo P50 BIOS implementation:
 Phoenix-based  Intel Skylake 6th generation processor

BIOS Guard hardware support
Interactions through a set of MSRs  PLATFORM_INFO MSR (0CEh)
 PLATFORM_FIRMWARE_PROTECTION_CONTROL (110h)
50

BIOS Guard hardware support
 PLATFORM_FIRMWARE_PROTECTION_EPHEMERAL (117h)
 Early provisioning (PEI phase)
 Module SiInit (Silicon Init)  Generate ephemeral value (RDRAND)  Send it to the EC but never used  Buried in hardware (MSR 117h)  Most probably Write-Only register  Discard value
 Run-time: only BIOS Guard can
unlock controllers (PCH/EC) using the ephemeral value
51

BIOS Guard hardware support
 BIOS Guard Platform Data Table (BGPDT)
 Platform specific, static, BIOS Guard configuration
 PLATFORM_FIRMWARE_PROTECTION_HASHx MSRs (111h-114h)
 Early provisioning (PEI phase)  Set up BGPDT, compute its digest  Possibly write-once MSRs or
locked depending on BG status
 Immutable BGPDT then
52

At this point (PEI phase, early
boot) BIOS Guard configuration is set up and locked-down

BIOS Guard ACM execution flow
 PLATFORM_FIRMWARE_PROTECTION_TRIGGER_PARAM (115h)
 Set up with a pointer on BIOS Guard Directory  Parameters for operations  Placeholder for the return value as well
 PLATFORM_FIRMWARE_PROTECTION_TRIGGER (116h)
 BG "syscall" or trigger
54

BIOS Guard ACM
 File format close to Intel Boot Guard ACM  Size 29-32k  Signed and encrypted (most likely AES-CBC)  Black box, expected to implement:
 BGPTD hash verification  Update package signature check (optional)  Script interpreter  Flash SPI access and communications with the EC
 Provided by Intel to OEM as binary blob
55

BIOS Guard at software (OEM) level

BIOS Guard Directory
 Top-level structure  Array of pointers (6)  Address passed in MSR 115h  ACM module and BGPDT, first
exposed by PlaformInit HOB
 Ored entries:
 With 0xFE << 56 if not set  With index << 56 otherwise
57

BIOS Guard Platform Data Table
 Static configuration of the protection
 EC IO ports, commands  Public keys digests  SFAM array: protected flash memory ranges
 Sealed at PEI phase
58

BIOS Guard Platform Data Table
 SFAM ranges  Protected range of flash regions
=> only accept signed operations
 Regions can be found in the
_FLASH_MAP structure
59

BIOS Guard Update Package
 Operation parameters for the BIOS Guard ACM
 Header (platform, versions, signature requirement, etc.)  Script: dynamic or templated  Buffer to be written in flash  Cryptographic material (signature)
 Templated scripts for signed/protected operations
 $IPACK structure in Lenovo's image
 Dynamically generated scripts
 BiosGuardService API (wrapped into BIOS_GUARD_PROTOCOL)
60

$IPACK structure
61

$IPACK files
 _IMG_.ORG: main UEFI image (0x88E350 bytes)  PUPHEAD.BIN: update header (0x30 bytes)  PUPDUMMYHEAD.BIN  PUPSCRP.BIN: update script (0xD0 bytes)  PUPDUMMYSCRP.BIN  PUPCERT.BIN: certificate (0x20C bytes)  PUPDUMMYSIGN.BIN  PUPSIGN.BIN: signatures collection (0x6C000 bytes)
62

PUPCERT.bin
 Cryptographic material  Template file  RSASSA-PKCS1-v1_5, SHA2  For each signed operation, chunk signature
is written over the placeholder
63

PUPHEAD.bin
Operation header:
 Flags: a bit is set to require a signed operation
 Platform: should match the one from BGPDT
64

BIOS Guard update package

SystemFlashUpdateDriverDxe debug string: "../../Lib/Common/PfatPupRomWrite.c"

65

BIOS Guard operation
66

BIOS Guard scripting
 Fixed size instruction set (8 bytes)
 Few instructions guessed:
 OP_START = 01 00 00 00 00 00 00 00  OP_END = FF 00 00 00 00 00 00 00  OP_SET_FLASH_ADDR = 55 00 00 00 XX XX XX XX  OP_FLASH_ERASE = 14 00 00 00 00 00 00 00  OP_FLASH_WRITE = 11 00 00 00 00 00 00 00
 Interpreter expected to be in the ACM module or Microcode
67

BIOS Guard scripting
 Generated dynamically (unsigned operations)
 Very basic scripts (4 instructions)  Ex: OP_START | OP_SET_FLASH_ADDR | OP_FLASH_WRITE | OP_END
 PUPSCRP.bin used as a template (signed operations)
 26 instructions program  Patch flash address in 2nd instruction operands  Patch chunk size in 3rd instruction operands
 Only signed operations can write/erase SFAM ranges
(ERR_SFAM_VIOLATION otherwise)
68

Open questions
 SHA2 of public key is expected in BGPDT
 Same digest values for P50 and T540  Could not recompute the value
 Chunks signature:
 RSASSA-PKCS1-v1_5 signature, SHA2 digest  Unsure about the scope of the signature  Whole update package?
 Unsigned operations
 Interpreter in ACM exposes a rather large attack surface  Fuzzing?
69

Notes for future research
 Interesting error codes:
"ERR_UNSUPPORTED_CPU", "ERR_BAD_DIRECTORY", "ERR_BAD_BGPDT", "ERR_BAD_BGUP", "ERR_SCRIPT_SYNTAX", "ERR_UNDEFINED_FLASH_OBJECT", "ERR_UNEXPECTED_OPCODE", "ERR_BAD_BGUPC", "ERR_UNSIGNED_B0_STORE", "ERR_RANGE_VIOLATION", "ERR_SFAM_VIOLATION", "ERR_EXEC_LIMIT", etc.
70

Experiments

ACM FUN
 Tried debug over Intel DCI to access ACM memory and dump
decrypted BIOS Guard ACM => no success 
 Replace BIOS Guard ACM module with older one from another
platform => temporarily bricked a laptop (need reflash)
 Remove ACM from update image before flash over OS updater =>
start loop of weird reboots on S3, after few recover to previous version
72

Conclusions

Conclusions
 Complex feature:
 Hardware support, but...  Many software components (PEI, SMM, DXE)  Specific format for BIOS image
 Strong dependency of OEM vendors to Intel (BIOS Guard ACM)  Lenovo's EC support still limited?  Could possibly support other firmware's as well?  Many implementation details in the hands of OEM
=> room for misconfiguration
74

BIOS Guard implementation checklist
 SFAM regions coverage don't have obvious mistakes  Signed vs unsigned operations with BIOS Guard script  Communications between BIOS and EC implemented correctly (not
static session password)
 Recovery process implemented without supply chain backdoors
75

Shout-out
 All friends who shared enlightening thoughts with us, you know
who you are 
 Igor and Ilfak for outstanding IDA's support  @AirbusSecLab for the review and feedback  Darrell Hut from NVIDIA for disclosure process support and help  Rodrigo Branco (bsdaemon) from Intel for feedback
76

Thank you Q&A

