Shai Hasarfaty Principal Security Research Engineer, Intel Corp.

Yanai Moyal

Security Researcher, Intel Corp.

Behind the Scenes of Intel Security and Manageability
Engine

Legal Disclaimer
Intel provides these materials as-is, with no express or implied warranties. All products, dates, and figures specified are preliminary, based on current expectations, and are subject to change without notice. Intel, processors, chipsets, and desktop boards may contain design defects or errors known as errata, which may cause the product to deviate from published specifications. Current characterized errata are available on request. Intel technologies' features and benefits depend on system configuration and may require enabled hardware, software or service activation. Performance varies depending on system configuration. No product or component can be absolutely secure. Check with your system manufacturer or retailer or learn more at https://www.intel.com. Some results have been estimated or simulated using internal Intel analysis or architecture simulation or modeling, and provided to you for informational purposes. Any differences in your system hardware, software or configuration may affect your actual performance. Intel and the Intel logo are trademarks of Intel Corporation in the United States and other countries. *Other names and brands may be claimed as the property of others. © Intel Corporation

Scope Of This Talk
Latest CSME 12 Firmware & Hardware on Intel 8th and 9th Gen Core Processor based platforms (code name Coffee Lake and Whiskey Lake)

· Architecture & Boot flow · OS Security Principles & Internals · Hardening & Mitigations · Pre & Post Manufacturing · Update & Recoverability · Wrap-up

What Is CSME?

CPU
PCH CSME
LAN WLAN

CSME is an embedded subsystem in Platform Controller Hub (PCH) · Stands for Converged Security & Manageability Engine
· Standalone low power Intel processor with dedicated SMBUS Hardware (HW)
GPIO HECI
· CSME is Root of Trust of the platform · Provides an isolated execution environment protected from host SW running on main CPU · Executes CSME Firmware (FW)

What Is CSME?

CPU
PCH CSME
LAN WLAN

CSME serves 3 main platform roles

· Chassis

· Secure boot of the platform

· Overclocking

· Micro-code loading into PCH/CPU HW engines

SMBUS · Security

GPIO HECI

· Isolated & trusted execution of security services

(TPM, DRM, DAL)

· Manageability

· Platform management over out of band network (Intel AMT)

CSME HW Overview & Capabilities

· Manageability Devices: used for manageability and redirection (USB-R, IDE-R, KT, KVM etc.)
· Protected Real Time Clock: used for monotonic counters (anti-replay protection) and as protected time

· CPU: Intel 32 bits processor (i486) supporting rings, segmentation and MMU for page management
· SRAM: Isolated RAM (~1.5 MB) from host
· ROM: HW root of trust of CSME Firmware
· System Agent: Allows CPU to securely access SRAM and enforce access control to SRAM from internal/external devices by using IOMMU (i.e. control DMA access)
· OCS (Offload & Cryptography Subsystem): Crypto HW accelerator with DMA engine and Secure Key Storage (SKS)
· Gasket: interface to PCH fabric & CSME IO devices (TPM, HECI etc.)

PCH Hardware Used By CSME
· DRNG
· Generates non-deterministic random numbers · Compliant to NIST SP800-90A, B and C
· Fuses ­ 2 types
· Intel PCH Manufacturing Fuses ­ set by Intel before shipment to manufacturers
· CSME configurations: which Intel CSME signing keys enabled, production silicon etc. · CSME security keys unique per chip and encrypted using CSME HW key
· In Field Programmable Fuses (FPF) ­ set by manufacturers before shipment to endusers
· Manufacturers' secure settings: public key, Intel Boot Guard policy etc. · CSME FW Anti-Rollback Security Version Number (ARB SVN)
· DFX (debug)
· Control CSME & other PCH micro-controllers debug interface (JTAG) · In debug (JTAG open), keys in fuses and secrets in NVM are not available & CSME
SRAM is zeroed

CSME Role In Platform Boot

CSME ROM
· ROM is part of PCH HW with no patch mechanism after HW tape-in
· ROM bypass disabled by Intel manufacturing fuse on production stepping
· Main responsibilities
· Moves CSME CPU to protected mode & enable paging and segmentation
· Generates CSME FW keys using chipset key and RBE Security Version Number (TCB SVN)
· Loads, authenticates and executes IDLM (debug module) / RBE
· Hashes of public keys embedded in ROM · Intel manufacturing fuse indicates which public key is enabled
(debug signing key is disabled on production)

Key Derivation By ROM
1. HW key generation 2. Decryption of Chipset Key 3. Derivation of CSME FW Key

HW Secure Key Storage
HW SKS: Protect CSME root keys during runtime. FW can only use keys Every SKS slot has set of attributes - Secure Mode
- Result of AES-CBC decrypt and HMAC using the key in this slot can be stored in SKS only
- Privilege Level: used for HW access control on SKS slot
- The key in this slot is accessible if SKS slot privilege level is >= SKS privilege level
SKS Privilege Level 0

SKS Privilege Level 3

HW Secure Key Storage
HW SKS: Protect CSME root keys during runtime. FW can only use keys Every SKS slot has set of attributes - Secure Mode
- Result of AES-CBC decrypt and HMAC using the key in this slot can be stored in SKS only
- Privilege Level: used for HW access control on SKS slot
- The key in this slot is accessible if SKS slot privilege level is >= SKS privilege level
- Locked: key in this slot can be invalidated or replaced after CSME HW reset only

RBE (ROM Boot Extension)
· Extends ROM functionality in FW (can be updated on field)
· Bootloader of CSME OS · Main responsibilities
· Performs HW based anti-rollback check on CSME FW
· Performs early chassis job ­ PMC patch · Loads, authenticates and executes CSME
OS

CSME Secure Boot Flow

OS & core drivers and services

ROM

Load, 1

authenticate

and execute

2

Load and authenticate

RBE

Create ICV

Kernel VFS

Syslib
Crypto Driver

Process Manager
Event Disp.

Bringup

3 Execute using ICV

Kernel

Execute 4 using ICV

5 Execute using ICV
Process Manager

Execute 6 using ICV
Load and authenticate 7 Create ICV
Execute using ICV

Store in SPI flash 8

Load Manager
Bus Driver

Storage Driver
PRTC Driver

FPF Driver

Drivers & Services

SeCSrSeCvSMrSieCvcMEriSecvMsEeicsEes

DCrDSiCvMrDSeiCvMErrSesivMEresErs

Applications

AMT

PTT

DAL

PAVP

Legend

ICV: Integrity Check Value

FW Ring0
HW Ring0 FW App Ring3

FW TCB Ring3
FW OS Ring3
FW lib. Ring3

Once all CSME modules have been loaded, Process Manager stores all CSME modules' ICVs and ICV key in ICV Blob Partition (IVBP)
in SPI flash, encrypted, integrity and replay protected

ICV Blob DRAM Init
Code pages replacement using ICV done by kernel from SPI flash Done

ICC

IP Loading

time

Code and data pages replacement using ICV done by kernel from DRAM

CSME Secure Boot Flow With ICV Blob

OS & core drivers and services

ROM

Load, 1 authenticate and execute

RBE

2

ICV Blob

Load and

authenticate

Kernel VFS

Syslib
Crypto Driver

Process Manager
Event Disp.

Bringup

3 Execute using ICV

Kernel

Execute 4 using ICV

5 Execute using ICV
Process Manager

Execute 6 using ICV
7 Execute using ICV

Load Manager
Bus Driver

Storage Driver
PRTC Driver

FPF Driver

Drivers & Services

SeCSrSeCvSMrSieCvcMEriSecvMsEeicsEes

DCrDSiCvMrDSeiCvMErrSesivMEresErs

Applications

AMT

PTT

DAL

PAVP

Legend

ICV: Integrity Check Value

FW Ring0
HW Ring0 FW App Ring3

FW TCB Ring3 FW OS Ring3 FW lib. Ring3

ICVs are used to speed-up CSME
boot

DRAM Init
Code pages replacement using ICV done by kernel from SPI flash Done

ICC

IP Loading

time

Code and data pages replacement using ICV done by kernel from DRAM

· Architecture & Boot flow · OS Security Principles & Internals · Hardening & Mitigations · Pre & Post Manufacturing · Update & Recoverability · Wrap-up

CSME OS Main Security Principles
· Micro-Kernel OS based on Minix OS architecture
· The micro-kernel is the only runtime component running at ring0. Application, Drivers and Services run at ring3
· The micro-kernel implements the bare minimum required to implement an OS
· Minimal Trusted Compute Base (TCB)
· Protects access to keys and HW (CSME assets) · Responsible for CSME FW code integrity at boot &
runtime · Responsible for protection CSME modules from each
other and their data in SPI flash · Enforces CSME modules' minimum privileges

Micro Kernel (uKernel)
· Main responsibilities
· Driver of the CPU
· Enforces code execution is from SRAM only · Enforces process isolation using CPU rings and x86 segments · Setups page attributes (RW and User bit). Enforcement done by MMU · Controls HW access via MMIO by ring3
· Driver of the IOMMU
· Controls DMA access to SRAM
· Support standard kernel service
· Inter-Process Communication (IPC) · Processes & threads management · Interrupts and exceptions handling
· Handle page replacement between SRAM and DRAM/SPI flash to save SRAM utilization
· Evicted pages to DRAM are encrypted and integrity protected

CSME TCB OS

Ring3 TCB Component

Main Security Role

Create CSME Process

Control access to CSME keys

Process

1. Code authentication

Yes

No

Manager 2. Process creation & termination

Control access to CSME OS services
No

Control access to Hardware
No

Crypto

1. Crypto & DMA service

No

Yes

No

No

Driver

2. FW key management

Virtual File 1. Secure storage service with

No

No

Yes

No

System

data migration support

(VFS)

2. Enforce permission check on

data files and special files

exposed by drivers & services

Bus Driver 1. Allow CSME drivers to

No

No

No

Minimal

configure their own device

configuration space

2. Enforce access control

Bringup (BUP)
· Support early platform boot and configuration
· Reduced its privileges starting CSME 12
· Can't create CSME processes · No access to root keys and attestation keys · No access to crypto accelerator and DFX HW

CSME OS ­ Drivers and Services
· Driver and Services are running at ring3 · Drivers have access only to HW they
need to manage via Memory Mapped IO (MMIO)
· Access to drivers and services are jointly controlled by VFS & uKernel

CSME Applications
· CSME applications are running at ring3 · CSME TCB ensure CSME applications are isolated from each
others including their data kept in NVM

· Architecture & Boot flow · OS Security Principles & Internals · Hardening & Mitigations · Pre & Post Manufacturing · Update & Recoverability · Wrap-up

Hardening & Exploitation Mitigations
· Kernel (Ring0)
· Kernel system call filtering · Applied stack protector for kernel · Data execution prevention · Activated Supervisor Mode Access Prevention (SMEP) · Use CR0.Write.Protect
· Prevent corruption of read only pages by kernel
· ACL on Ring3 inter-process communication

Hardening & Exploitation Mitigations

· Example of authorized IPC (Abstracted)

PAVPPA-VPDRM

VPAFVSP

CrypPtAVoP Drv

KePArVnPel

Hardening & Exploitation Mitigations

· Example of authorized IPC (Abstracted)

PAVPPA-VPDRM

VPAFVSP

CrypPtAVoP Drv

open() - IPC_SEND_RCV

VERIFY_REQ_ACL

VERIFY_ACL

FILE_DESCRIPTOR_HANDLE

FILE_DESCRIPTOR_HANDLE

KePArVnPel

IOCTL ( FD , AES_ENC , &BUF )

IOCTL_CHECK_ACL IOCTL AES_ENC WRITE BUFFER

RETURN_SUCCESS

RETURN_SUCCESS

Hardening & Exploitation Mitigations

· Example of authorized IPC (Abstracted)

PAVPPA-VPDRM

VPAFVSP

CrypPtAVoP Drv

open() - IPC_SEND_RCV

VERIFY_REQ_ACL

VERIFY_ACL

FILE_DESCRIPTOR_HANDLE

FILE_DESCRIPTOR_HANDLE

KePArVnPel

IOCTL ( FD , AES_ENC , &BUF )

IOCTL_CHECK_ACL IOCTL AES_ENC WRITE BUFFER

RETURN_SUCCESS

RETURN_SUCCESS

Hardening & Exploitation Mitigations

· Example of authorized IPC (Abstracted)

PAVPPA-VPDRM

VPAFVSP

CrypPtAVoP Drv

open() - IPC_SEND_RCV

VERIFY_REQ_ACL

VERIFY_ACL

FILE_DESCRIPTOR_HANDLE

FILE_DESCRIPTOR_HANDLE

KePArVnPel

IOCTL ( FD , AES_ENC , &BUF )

IOCTL_CHECK_ACL IOCTL AES_ENC WRITE BUFFER

RETURN_SUCCESS

RETURN_SUCCESS

Hardening & Exploitation Mitigations

· Example of authorized IPC (Abstracted)

PAVPPA-VPDRM

VPAFVSP

CrypPtAVoP Drv

open() - IPC_SEND_RCV

VERIFY_REQ_ACL

VERIFY_ACL

FILE_DESCRIPTOR_HANDLE

FILE_DESCRIPTOR_HANDLE

KePArVnPel

IOCTL ( FD , AES_ENC , &BUF )

IOCTL_CHECK_ACL IOCTL AES_ENC WRITE BUFFER

RETURN_SUCCESS

RETURN_SUCCESS

Hardening & Exploitation Mitigations

· Example of authorized IPC (Abstracted)

PAVPPA-VPDRM

VPAFVSP

CrypPtAVoP Drv

open() - IPC_SEND_RCV

VERIFY_REQ_ACL

VERIFY_ACL

FILE_DESCRIPTOR_HANDLE

FILE_DESCRIPTOR_HANDLE

KePArVnPel

IOCTL ( FD , AES_ENC , &BUF )

IOCTL_CHECK_ACL IOCTL AES_ENC WRITE BUFFER

RETURN_SUCCESS

RETURN_SUCCESS

Hardening & Exploitation Mitigations

· Example of authorized IPC (Abstracted)

PAVPPA-VPDRM

VPAFVSP

CrypPtAVoP Drv

open() - IPC_SEND_RCV

VERIFY_REQ_ACL

VERIFY_ACL

FILE_DESCRIPTOR_HANDLE

FILE_DESCRIPTOR_HANDLE

KePArVnPel

IOCTL ( FD , AES_ENC , &BUF )

IOCTL_CHECK_ACL IOCTL AES_ENC WRITE BUFFER

RETURN_SUCCESS

RETURN_SUCCESS

Hardening & Exploitation Mitigations

· Example of authorized IPC (Abstracted)

PAVPPA-VPDRM

VPAFVSP

CrypPtAVoP Drv

open() - IPC_SEND_RCV

VERIFY_REQ_ACL

VERIFY_ACL

FILE_DESCRIPTOR_HANDLE

FILE_DESCRIPTOR_HANDLE

KePArVnPel

IOCTL ( FD , AES_ENC , &BUF )

IOCTL_CHECK_ACL IOCTL AES_ENC WRITE BUFFER

RETURN_SUCCESS

RETURN_SUCCESS

Hardening & Exploitation Mitigations

· Example of authorized IPC (Abstracted)

PAVPPA-VPDRM

VPAFVSP

CrypPtAVoP Drv

open() - IPC_SEND_RCV

VERIFY_REQ_ACL

VERIFY_ACL

FILE_DESCRIPTOR_HANDLE

FILE_DESCRIPTOR_HANDLE

KePArVnPel

IOCTL ( FD , AES_ENC , &BUF )

IOCTL_CHECK_ACL IOCTL AES_ENC WRITE BUFFER

RETURN_SUCCESS

RETURN_SUCCESS

Hardening & Exploitation Mitigations

· Example of authorized IPC (Abstracted)

PAVPPA-VPDRM

VPAFVSP

CrypPtAVoP Drv

open() - IPC_SEND_RCV

VERIFY_REQ_ACL

VERIFY_ACL

FILE_DESCRIPTOR_HANDLE

FILE_DESCRIPTOR_HANDLE

KePArVnPel

IOCTL ( FD , AES_ENC , &BUF )

IOCTL_CHECK_ACL IOCTL AES_ENC WRITE BUFFER

RETURN_SUCCESS

RETURN_SUCCESS

Hardening & Exploitation Mitigations

· Example of authorized IPC (Abstracted)

PAVPPA-VPDRM

VPAFVSP

CrypPtAVoP Drv

open() - IPC_SEND_RCV

VERIFY_REQ_ACL

VERIFY_ACL

FILE_DESCRIPTOR_HANDLE

FILE_DESCRIPTOR_HANDLE

KePArVnPel

IOCTL ( FD , AES_ENC , &BUF )

IOCTL_CHECK_ACL IOCTL AES_ENC WRITE BUFFER

RETURN_SUCCESS

RETURN_SUCCESS

Hardening & Exploitation Mitigations

· Example of unauthorized IPC

PAVPPA-VPDRM

VPAFVSP

CrypPtAVoP Drv

open() - IPC_SEND_RCV

VERIFY_REQ_ACL

VERIFY_ACL

FILE_DESCRIPTOR_HANDLE

FILE_DESCRIPTOR_HANDLE

KePArVnPel

IOCTL ( FD , AES_ENC , &BUF )

IOCTL_CHECK_ACL IOCTL AES_ENC WRITE BUFFER

RETURN_SUCCESS

RETURN_SUCCESS

Hardening & Exploitation Mitigations
· Exploitation mitigations in Ring3

Hardening & Exploitation Mitigations
· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore)

Hardening & Exploitation Mitigations
· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions.

Hardening & Exploitation Mitigations
· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions.

Hardening & Exploitation Mitigations
· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions.

Hardening & Exploitation Mitigations

· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions.
· Regular Stack-Protector:

LOCAL VAR

Canary OLD EBP

Linear Buffer ov=erflow Random

RETURN ARG ARG
12

Hardening & Exploitation Mitigations

· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions.
· Regular Stack-Protector:

LOCAL VAR

Canary OLD EBP

Linear Buffer ov=erflow Random

RETURN ARG ARG
12

Nonlinear Write will bypass stack protector

Hardening & Exploitation Mitigations

· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions.
· Stack-Protector XORed with Return address:

LOCAL VAR

Canary
=
Random ^ Ret

OLD EBP

RETURN ARG ARG
12

Hardening & Exploitation Mitigations

· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions.

· Stack-Protector XORed with Return address:

LOCAL VAR

Canary
=
Random ^ Ret

OLD EBP

RETURN ARG ARG
12

· Attacker will now require to have stack/canary info leak or to leverage a data corruption (if possible)

Hardening & Exploitation Mitigations
· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions. · SW Forward Edge Control Flow Integrity

Hardening & Exploitation Mitigations
· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions. · SW Forward Edge Control Flow Integrity

Hardening & Exploitation Mitigations
· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions. · SW Forward Edge Control Flow Integrity
COP/ROP/JOP Gadget

Hardening & Exploitation Mitigations
· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions. · SW Forward Edge Control Flow Integrity

Hardening & Exploitation Mitigations
· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions. · SW Forward Edge Control Flow Integrity

Hardening & Exploitation Mitigations
· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions. · SW Forward Edge Control Flow Integrity

Hardening & Exploitation Mitigations
· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions. · SW Forward Edge Control Flow Integrity

Hardening & Exploitation Mitigations
· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions. · SW Forward Edge Control Flow Integrity · Heap protections

Hardening & Exploitation Mitigations
· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions. · SW Forward Edge Control Flow Integrity · Heap protections
· Double free protection · Malloc of zero size return NULL · Cookie protection enforced during free of an allocated\busy chunk
· A Marker surround every Busy Block · Value of random "Cookie" field in the Marker is compared with the original Cookie
value. Mismatch is handled as an overflow attack (or bug).

Hardening & Exploitation Mitigations
· Exploitation mitigations in Ring3
· Syslib context pointer moved to a read only page (not on stack anymore) · Return Control Flow Integrity via modified Stack Canary "XOR-RET-ALL"
on the majority of the Ring3 functions. · SW Forward Edge Control Flow Integrity · Heap protections · Data execution prevention

CSME Security Development Lifecycle

CSME Security Development Lifecycle
Applying Security Development Lifecycle (SDL) through the CSME development phases · Security Architecture and Design Review
· Threat analysis · Challenging FW design results into product changes
· Security Code Review
· Manual and Static Code Analysis (SCA) tools
· Penetration testing
· Manual · Automation

CSME Security Validation Technologies
· Using latest industry techniques on silicon

CSME Security Validation Technologies
· Using latest industry techniques on silicon
· Address Sanitization

CSME Security Validation Technologies
· Using latest industry techniques on silicon
· Address Sanitization
· Doesn't work out of the box since requires glibc · Sanitizer requires 8 bytes aligned memory and CSME a 4 bytes aligned memory · Sanitizer write to a "shadow" memory at a fixed address of "0x20000000" · Making the code too big won't fit into flash or won't fit into SRAM

CSME Security Validation Technologies
· Using latest industry techniques on silicon
· Address Sanitization
· Doesn't work out of the box since requires glibc. · Fixed it by creating stub functions that are missing and implement them
· Sanitizer requires 8 bytes aligned memory and CSME a 4 bytes aligned memory · Each time we enter a "error function" make sure is it in a 4 byte aligned memory and validate that address with the "shadow" if it's an issue or not · Using: "-fsanitize-recover=address" so calling code path won't change
· Sanitizer write to a "shadow" memory at a fixed address of "0x20000000" · Patch GCC to make it accept "-fsanitize=kernel-address" by removing "SANITIZE_KERNEL_ADDRESS" in "opts-global.c" · Was asked many times but none done it as a feature in GCC: · https://groups.google.com/forum/#!topic/address-sanitizer/ZLI4un1NyoE
· Making the code too big won't fit into flash or won't fit into SRAM · Apply only on a single process and not on the entire system at once.

CSME Security Validation Technologies
· Using latest industry techniques on silicon
· Address Sanitization

CSME Security Validation Technologies
· Using latest industry techniques on silicon
· Address Sanitization · Fuzzing with Coverage guided

CSME Security Validation Technologies
· Using latest industry techniques on silicon
· Address Sanitization · Fuzzing with Coverage guided
· Based on AFL Fuzzer logic

CSME Security Validation Technologies
· Using latest industry techniques on silicon
· Address Sanitization · Fuzzing with Coverage guided
· Based on AFL Fuzzer logic Issue #1: BitMap size

CSME Security Validation Technologies
· Using latest industry techniques on silicon
· Address Sanitization · Fuzzing with Coverage guided
· Based on AFL Fuzzer logic Issue #1: BitMap size

CSME Security Validation Technologies
· Using latest industry techniques on silicon
· Address Sanitization · Fuzzing with Coverage guided
· Based on AFL Fuzzer logic Issue #2: Memory pipe for getting test feedback

CSME Security Validation Technologies
· Using latest industry techniques on silicon
· Address Sanitization · Fuzzing with Coverage guided
· Based on AFL Fuzzer logic
Issue #2: Memory pipe for getting test feedback
· Easy to solve by calling a test firmware API (not exist in production) to get the internal array that hold all feedback
· Modify AFL instrumentation to set the global BITMAP array inside of the FW

CSME Security Validation Technologies

· Using latest industry techniques on silicon
· Address Sanitization · Fuzzing with Coverage guided
· Based on AFL Fuzzer logic

Fuzzer

Test Collection

Test Case Fuzzer
Path Manager

Platform Under Test Host OS HECI Driver
CSME Firmware

CSME Security Validation Technologies

· Using latest industry techniques on silicon
· Address Sanitization · Fuzzing with Coverage guided
· Based on AFL Fuzzer logic

Fuzzer

Test Collection

Test Case Fuzzer
Path Manager

Fuzzed test case

Platform Under Test Host OS HECI Driver
CSME Firmware

CSME Security Validation Technologies

· Using latest industry techniques on silicon
· Address Sanitization · Fuzzing with Coverage guided
· Based on AFL Fuzzer logic

Fuzzer

Test Collection

Test Case Fuzzer
Path Manager

Fuzzed test case

Platform Under Test Host OS HECI Driver
CSME Firmware

Instrumented Firmware
IF ID

ELSE

ID

CSME Security Validation Technologies

· Using latest industry techniques on silicon
· Address Sanitization · Fuzzing with Coverage guided
· Based on AFL Fuzzer logic

Fuzzer

Test Collection

Test Case Fuzzer
Path Manager

Fuzzed test case Get Feedback

Platform Under Test Host OS HECI Driver
CSME Firmware

Instrumented Firmware
IF ID

ELSE

ID

CSME Security Validation Technologies

· Using latest industry techniques on silicon
· Address Sanitization · Fuzzing with Coverage guided
· Based on AFL Fuzzer logic

Fuzzer

Test Collection

Test Case Fuzzer
Path Manager

Fuzzed test case Get Feedback
BitMapArray

New path found

Platform Under Test Host OS HECI Driver
CSME Firmware

Instrumented Firmware
IF ID

ELSE

ID

CSME Security Validation Technologies
· Using latest industry techniques on silicon
· Address Sanitization · Fuzzing with Coverage guided

· Architecture & Boot flow · OS Security Principles & Internals · Hardening & Mitigations · Pre & Post Manufacturing · Update & Recoverability · Wrap-up

Customization During Manufacturing
· Features are configurable by manufacturers
· Manageability support ­ corporate / consumer · HW Anti-rollback support · Manufacturer public key for secure micro-code loading and Intel Boot Guard · Intel Boot Guard enable/disable & policy · PTT enable/disable
· End Of Manufacturing (EOM)
· Required by manufacturers before shipping platforms to end-users · Write and lock manufacturers' settings into FPF and CSME data partition in
SPI flash · Close SPI flash descriptor ­ SPI controller enforces access control on BIOS,
CSME and other SPI regions

Post Manufacturing Configuration
Some CSME features can still be configured after EOM by endusers
· Manageability can be configured in BIOS menus
· AMT out of band network interface enable/disable · AMT USB provisioning enable/disable · AMT Host Based Provisioning enable/disable · AMT redirection enable/disable

· Architecture & Boot flow · OS Security Principles & Internals · Hardening & Mitigations · Pre & Post Manufacturing · Update & Recoverability · Wrap-up

CSME FW Update & Recovery
CSME FW verifies digital signature and version of new CSME FW image before updating it in SPI flash on end-user system
· Two levels of CSME FW anti-rollback supported in CSME 12
1. SW rollback to old CSME FW is prevented using Version Control Number (VCN)
2. Physical rollback is prevented using Anti-Rollback (ARB) SVN
· ARB SVN is kept in field programmable fuse (FPF) · Require manufacturer support
· Once FW update is done to a higher TCB SVN, CSME will perform data migration and initiate the re-creation of attestation
keys (EPID and PTT Endorsement Key)

TCB Recovery & CSME Data Migration
1. If not latest iCLS (Intel Capability Licensing Service) SW service is already used, update SW.
2. Manufacturers update to new CSME FW with higher SVN. At next boot, CSME FW performs CSME data migration from previous CSME storage key to new one derived by ROM.
3. Intel iCLS SW service connects securely using Intel SIGMA protocol over internet to Intel backend servers to complete TCB recovery and retrieve new EPID key and Intel certificate for new PTT Endorsement Key (TPM EK)
4. At some point, Intel revokes EPID keys and PTT EK (i.e. publish CRL on Intel server). Once revocation is done, Content Providers can halt streaming content to nonupdated systems

· Architecture & Boot flow · OS Security Principles & Internals · Hardening & Mitigations · Pre & Post Manufacturing · Update & Recoverability · Wrap-up

Wrap-up
· Secure design with defense In-depth
· Secure boot and execution enforced by minimal TCB · Least privileges and process isolation · Exploitation mitigations
· Secure Update & Recovery
· Secure FW update · FW and HW Anti-rollback · Data migration with online renewal of attestation keys (TCB Recovery)
· Evaluating Future Enhancements
· Further reduce privileges · Adding ASLR support given CSME OS memory limitations · HW Control-Flow Enforcement Technology (CET) support in CSME CPU

Thank You!
Special thanks to CSME architecture, development, validation and security research teams for their contribution to this presentation

