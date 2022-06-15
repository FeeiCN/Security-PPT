?
All you ever wanted to know about the AMD Platform Security Processor and were afraid to emulate
INSIDE A DEEPLY EMBEDDED SECURITY PROCESSOR.

Alexander Eichner
Technische Universität Berlin
Robert Buhren
Technische Universität Berlin

Outline
· What is the Platform Security Processor (PSP)?
· Why emulate it?
· How to emulate the PSP · What can we do with the emulator?
3

1 1 Formerly known as Platform Security Processor (i.e. PSP)

Server & Desktops (Epyc & Ryzen) integrated since 2013 undocumented, proprietary firmware acts as trust anchor
4

Why Emulate?
· Proprietary software at the highest privilege level · Static analysis is possible but time consuming (boring  )
· Only good for a single firmware version
· Emulation (if done right) enable easy analysis of future firmware versions
5

PSPTOOL

Python-based

Command-line interface

Parsing

Extraction Manipulation

Decompression

Signature verification

PEM export of keys Duplicate detection Signature update Python API GPLv3

https://github.com/PSPReverse/PSPTool

6

https://media.ccc.de/v/36c3-10942-uncover_understand_own_-_regaining_control_over_your_amd_cpu
7

On-Chip Bootloader

Off-Chip Bootloader
(PSP_FW_BOOT_LOADER)

releas e

ABL0

DebugUnlock

SecGasket

ABL1 ABL2 ABL3 ABL4 ABL6

SEV

BOOT PROCESS: EPYC
· PSP boots before the x86 cores

· On-Chip Bootloader loads Off-Chip bootloader from flash

x86

· Off-Chip Bootloader loads and executes apps in specific order

· System is initialized by different ABL stages

· Load UEFI image and release x86 cores from reset

· SEV app is loaded during runtime upon the request of the OS

8

On-Chip Bootloader

Off-Chip Bootloader
(PSP_FW_BOOT_LOADER)

releas e

DebugUnlock

SecGasket

ABL1

ABL0 ABL2 ABL3

ABL4

ABL6

BOOT PROCESS: RYZEN

· PSP boots before the x86 cores

· On-Chip Bootloader loads Off-Chip bootloader from flash

x86

· Off-Chip Bootloader loads and executes apps in specific order

· System is initialized by different ABL stages

· Load UEFI image and release x86 cores from reset

9

On-Chip Bootloader

Off-CSheipcuBroeoOtlSoader
(PSP_FW_BOOT_LOADER)

BOOT PROCESS: RYZEN
· PSP boots before the x86 cores · On-Chip Bootloader loads Off-Chip bootloader from flash · Off-Chip Bootloader loads and executes apps in specific order · System is initialized by different ABL stages · Load UEFI image and release x86 cores from reset · SRAM is overwritten with Secure OS (Kinibi TEE)
10

On-Chip Bootloader

Secure OS / Secure Mode

ARM TrustZone unknown OS / none-Secure Mode

fTPAMBL3
BOOT PROCESS: RYZEN
· PSP boots before the x86 cores · On-Chip Bootloader loads Off-Chip bootloader from flash · Off-Chip Bootloader loads and executes apps in specific order · System is initialized by different ABL stages · Load UEFI image and release x86 cores from reset · SRAM is overwritten with Secure OS (Kinibi TEE)
· Firmware TPM is one application of this OS
11

PSP Hardware
PSP MEMORY LAYOUT
· 256 KB (Zen1) or 384 KB (Zen2) SRAM
· Off-Chip BL and Applications
· On-Chip BL (ROM) at ARM high vectors (0xFFFF0000) · MMIO: IRQ controller (custom), timer, crypto
accelerator (CCP), X86 and SMN slot controller · System Management Network Slots · X86 address space slots

SRAM SMN Slots PSP MMIO
X86 Slots

A slot is a "view" into another address space

ROM Bootloader

32 Bit / 4 GB
12

32 Bit

PSP ADDRESS SPACES

PSP

System Management Network

SRAM

? ? ??

SMN Slots

PSP MMIO

0 1

SPI Flash

X86 Slots

Fuses

ROM Bootloader

Memory controller (with encryption slots)

32 Bit
13

32 Bit

PSP ADDRESS SPACES

PSP

x86 address space
Documented (partially): Processor Programming Reference (PPR)

SRAM

MMIO

SMN Slots

PSP MMIO

0 1

X86 Slots

ROM Bootloader

DRAM
PCI Memory mapped IO ports
(0x3f8 ...)

48 Bit

14

PSP CRYPTO ACCELERATOR (CCP)
· PSP contains a Cryptographic Coprocessor V5 (CCP)
· Support for: SHA, RSA, AES, ECC, ZLIB, TRNG
· Used to verify signatures, decompress firmware files and as a DMA copy engine
· No "official" documentation available, but....

SRAM
SMN Slots CCP PSP MMIO

There is a Linux kernel driver: drivers/crypto/ccp

X86 Slots
ROM Bootloader 32 Bit / 4 GB
15

WHILE (!SUCCEEDED) {
Execute

+337 -2

Implement

Fail

Analyze
} 16

PSPEmu
On-Chip Bootloader

Off-Chip Bootloader
(PSP_FW_BOOT_LOADER)

DebugUnlock

SecGasket

ABL0
ABL1

CCP

Timer

Flash

???

...

SUCCESS! (KIND OF)
· On Chip BL completes · Off Chip BL starts and executes first two apps · Off Chip BL executes first ABL stage but what
next? · Emulating all devices not feasible
17

[...] INFO INFO INFO INFO INFO INFO INFO INFO INFO INFO INFO INFO INFO INFO [...]

STS 0x000057c6[0x00001165][ SVC, S, M, I,NF,0x00014000] STRING "POST CODE (PSP): PSPSTATUS_C2P_MASTER_INITIALIZED_SLAVE_WAITED_FOR_MASTER" STS 0x000057c6[0x0000122f][ SVC, S, M, I,NF,0x00014000] STRING "POST CODE (PSP): PSPSTATUS_MASTER_GOT_BOOT_MODE_AND_SENT_TO_ALL_SLAVES" STS 0x000057c6[0x000057bf][ SVC, S, M, I,NF,0x00014000] STRING "POST CODE (PSP): PSPSTATUS_BOOTLOADER_SUCCESSFULLY_ENTERED_C_MAIN" STS 0x000057c6[0x000057bf][ SVC, S, M, I,NF,0x00014000] STRING "POST CODE (PSP): PSPSTATUS_HMAC_KEY_DERIVED_SUCCESSFULLY" STS 0x000057c6[0x000057bf][ SVC, S, M, I,NF,0x00014000] STRING "POST CODE (PSP): PSPSTATUS_SPIROM_INITIALIZED_SUCCESSFULLY" STS 0x000057c6[0x000057bf][ SVC, S, M, I,NF,0x00014000] STRING "POST CODE (PSP): PSPSTATUS_BIOS_DIRECTORY_READ_FROM_SPI_TO_SRAM" STS 0x000057c6[0x000057bf][ SVC, S, M, I,NF,0x00014000] STRING "POST CODE (PSP): PSPSTATUS_EARLY_UNLOCK_CHECK" STS 0x000057c6[0x000057bf][ SVC, S, M, I,NF,0x00014000] STRING "POST CODE (PSP): PSPSTATUS_BOOTLOADER_PROGRAMMED_MBAT_TABLE_SUCCESSFULLY" STS 0x000057c6[0x000057bf][ SVC, S, M, I,NF,0x00014000] STRING "POST CODE (PSP): PSPSTATUS_SECURITY_GASKET_BINARY_VALIDATED_AND_EXECUTED" STS 0x000057c6[0x000057bf][ SVC, S, M, I,NF,0x00014000] STRING "POST CODE (PSP): PSPSTATUS_BOOTLOADER_LOADED_SMU_FW_SUCCESSFULLY" STS 0x000057c6[0x000057bf][ SVC, S, M, I,NF,0x00014000] STRING "POST CODE (PSP): PSPSTATUS_MP1_TAKEN_OUT_OF_RESET" STS 0x000057c6[0x000057bf][ SVC, S, M, I,NF,0x00014000] STRING "POST CODE (PSP): PSPSTATUS_PSP_AND_SMU_CONFIGURED_WAFFLE" STS 0x000057c6[0x000057bf][ SVC, S, M, I,NF,0x00014000] STRING "POST CODE (PSP): PSPSTATUS_FW_VALIDATION_COMPLETED" STS 0x000057c6[0x000057bf][ SVC, S, M, I,NF,0x00014000] STRING "POST CODE (PSP): PSPSTATUS_BOOTLOADER_LOADED_AGESA0_FROM_SPIROM_SUCCESSFULLY"

18

PSPEmu

Off-Chip Bootloader
(PSP_FW_BOOT_LOADER)

ABL0
ABL1

Proxy

AMD CPU Stub
???

? Device

PROXY MODE
· Passthrough hardware accesses to real hardware
· Stub running on real PSP · Reads/Writes to devices get captured by
generic proxy component and forwarded to the real hardware · Which communication channel to use?
19

SMN

PspSerialStub Read/Write

Flash

SPI Ctrl

SPI Cmd EM100Pro-G2
USB

PSP STUB TRILOGY: EP 1: A SPI FLASH HOPE
· Use SPI Flash interface and emulator · Exchange data using SPI Flash Read and
Page Program requests · Works reliable but slow (2-3 accesses
per second) · Requires an expensive flash emulator

Parse SPI Trace em100 TCP
PSPEmu

https://github.com/PSPReverse/em100/tree/network-mode-v1

SMN

PspSerialStub SPI Cmd

Flash SPI Ctrl Interface

SPI Ctrl SPI Cmd

EP 2: THE PPR STRIKES BACK
· Found AMD PPR · Explains Low Level SPI register interface · We can execute arbitrary commands now! · Enables use of DediProg EM100 Hyper Terminal · Blazingly fast (don`t forget to disable Nagle for TCP!) · Still requires an expensive flash emulator 

EM100Pro-G2 USB
em100 HyperTerminal Interface TCP
PSPEmu

Logic Capture

lpc-dec

LPC Trace

Ryzen

LPC SuperIO

EP 3: RETURN OF THE UART
· Explore use of the legacy UART for a low cost solution
· SuperIO chip attached to the SoC via LPC · Need correct sequence to enable UART · Analyze SuperIO accesses over the LPC bus from
logic capture (lpc-dec) · Much slower than SPI but very cheap

https://github.com/AlexanderEichner/lpc-dec

PspStub
On-Chip Bootloader

Off-SCRhAipMBL ROM BL Stack

INSERTING THE PROXY
1. Setup stack 2. Map SPI flash 3. Load and verify AMD public key 4. Load and verify Off-Chip bootloader
The On-Chip BL needs to validate the size of the off-chip BL!

SPI Flash Off-Chip BL
On-Chip Bootloader 32 Bit / 4 GB

BL max. size
SMN Map SPI Flash
23

FIRMWARE FILE SYSTEM

Directory Entry

Secondary Directory

File Header

optional

Body

Signature

optional

24

File Header Body Signature
· Offset 0x14: Bodysize (0xc640) · Offset 0x64: Load address (0x100)
25

PspStub
On-Chip Bootloader
INSERTING THE PROXY
Off-Chip BL is copied into SRAM and then verified (to avoid TOCTOU). The header is processed before the signature is checked. -> Input validation is required.

Off-SCRhAipMBL ROM BL Stack
SPI Flash Off-Chip BL

BL max. size
SMN Map SPI Flash

On-Chip Bootloader 32 Bit / 4 GB
26

PspStub

Zen1 SRAM: 256KB
(0x40000)

Off-Chip BL

abs(0x100) + abs(0xc640)
= 0xc740

On-Chip Bootloader

ROM BL Stack

abs(0x100) + abs(0x8000c640)

INSERTING THE PROXY

SPI Flash

= 0xc740

void load_off_chip_bl (void) {

Validated size: 0xc640

...

if (abs(load_address) + abs(body_size) > ROM_BL_STACK)

return -1; ...

Used size: 0x8000c640 On-Chip Bootloader

copy_bl(load_address, spi_src, body_size)

return 0;

32 Bit / 4 GB

} 27

PspStub

PspStub
SRAM

copy_bl(..., ..., 0x8000c640)
On-Chip Bootloader
INSERTING THE PROXY

ret ret

rreeRtt OrreettM

BL

Starrceektt rreett

ret ret

PspStub
ret ret ret ret ret ret ret ret ret ret ret ret

SPI Flash

1. Place PspStub in SPI flash
· Appended with return addresses

2. Flip sign-bit of body size 3. Success!

On-Chip Bootloader

32 Bit / 4 GB

28

CCP Request 0x0003f900:

u32Dw0:

0x00500011 (Engine: PASSTHROUGH, ByteSwap: NOOP, Bitwise: NOOP, Reflect: 0)

cbSrc: u32AddrSrcLow:

2147534400 0x02149500

Copy size: 0x8000c640

u16AddrSrcHigh:

0x00000000

u16SrcMemType:

0x00000006 (MemType: 2, LsbCtxId: 1, Fixed: 0)

u32AddrDstLow: u16AddrDstHigh:

0x00000100 0x00000000

Load address: 0x100

u16DstMemType:

0x00000002 (MemType: 2, Fixed: 0)

u32AddrKeyLow:

0x00000000

u16AddrKeyHigh:

0x00000000

u16KeyMemType:

0x00000000

29

Issue Feature summary

AFFECTED SUPPORTED SYSTEMS

DISCLOSURE TIMELINE

· Zen and Zen+ CPUs (probably)
· Confirmed:
· Zen: Ryzen 1700X, Epyc 7281 · Zen+: Ryzen PRO 3500U, Ryzen 5
2600
· Zen2 is NOT affected

· Reported to AMD 26th February 2020
·...
· Response: 11th May 2020!
· Known bug
· "AMD has developed mitigations in various products where appropriate."

30

PSPEMU BASICS

./PSPEmu --emulation-mode on-chip-bl --flash-rom uefi.ROM --on-chip-bl on-chip-bl.bin --trace-log /tmp/log --trace-svcs --dbg <port>

· Sets starting point in boot process · Flash image to use for emulated SPI flash · Sets on chip BL binary · Trace log destination · Configures syscall tracing · GDB stub

31

Homegrown
3rd party
3rd party with modifcations

SPI PspSerialStub

em100

UART PSPEmu

TCP libpspproxy

psp-proxy

I/O Log

Trace

Coverage

psp-iolog psp-trace psp-iolog-replay

psp-cov

psp-dev-ccp-v5

PSPEMU FEATURES
· Trace all I/O accesses (MMIO, SMN, x86)

psp-dev-flash psp-dev-timer
psp-dev-...

· Intercept and trace all syscalls

· GDB stub for debugging (source level debugging for own code)

· Proxy mode for accessing real hardware

· Create coverage traces for later analysis

· I/O record and replay

psp-iom

psp-ccd

psp-dbg
libgdbstub TCP
gdb

psp-core unicorn

CURRENT STATE

Working: · Bootstrap platform when in proxy mode · DRAM works! · Ryzen 1700X (Zen) · Stable communication channel with PSP · Fast but expensive · Slow but very cheap · Toolchain for writing and debugging your own code · I/O log record and replay (no access to real hardware required for first steps) · Basic micropython port for the PSP 

Todo: · · · · · ·

Full platform boot (with UEFI) Emulate multiple CCDs/PSPs Support multiple CCDs/PSPs in the stub Investigate SecureOS on Ryzen Test Zen+/Zen2 support Zen3?

33

MAY THE CODE BE WITH YOU

· https://github.com/PSPReverse/PSPEmu

- Main emulator

· https://github.com/PSPReverse/libpspproxy

- PSP proxy base library

· https://github.com/PSPReverse/unicorn

- Patched unicorn

· https://github.com/PSPReverse/psp-apps

- Contains the PSP stub

· https://github.com/PSPReverse/em100

- For the flash emulator transport channel

· https://github.com/PSPReverse/PSPTool

- Analyze UEFI images

· https://github.com/AlexanderEichner/libgdbstub - Generic portable GDB stub library

· https://github.com/AlexanderEichner/micropython - Port of micropython to the PSP

34

