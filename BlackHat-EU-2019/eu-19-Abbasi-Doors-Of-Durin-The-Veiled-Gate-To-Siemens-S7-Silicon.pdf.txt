Doors of Durin: The Veiled Gate to Siemens S7 Silicon
Ali Abbasi, Tobias Scharnowski, Thorsten Holz Chair for Systems Security
Ruhr-University Bochum, Germany

Who We Are?

Ali Abbasi Researcher at SYSSEC RUB
404 Visa Not Found

Tobias Scharnowski PhD Student at SYSSEC RUB

Thorsten Holz Professor at SYSSEC RUB
ENOTIME

Plan of Talk
 Background on Process Automation
  Overview of Siemens PLCs
  Siemens Startup Process
  Siemens Firmware Components
  The Special Access Feature
  Demos
  Conclusion and Future Works

Process Automation
Set point

What we do with much more complex control loops?
· We use PLCs.

Outputs Inputs

Programmable Logic Controllers

Sensors

PLC
Control Logic Executed by The Firmware

Actuators

Programmable Logic Controller

https://vecer.mk/files/article/2017/05/02/485749-saudiska-arabija-ja-kupi-najgolemata-naftena-rafinerija-vo-sad.jpg

http://www.jfwhite.com/Collateral/Images/English-US/Galleries/middleboro9115kvbreakers.jpg

https://www.roboticsbusinessreview.com/wp-content/uploads/2016/05/jaguar-factory.jpg

https://www.oilandgasproductnews.com/files/slides/locale_image/medium/0089/22183_en_16f9d_8738_honeywellprocess-solutions-rtu2020-process-controller.jpg

https://selinc.com/uploadedImages/Web/Videos/Playlists/Playlist_RTAC_1280x720.png?n=63584758126000

http://www02.abb.com/global/seitp/seitp202.nsf/0/0601d25ed243cfb0c1257d7e0043e50e/$file/7184_lvl2.jpg

Recent Attacks Against ICS

Reconnaissance and weaponization of capabilities

It's happening: Publicly known cyber-physical attacks

1999

2010

First active recon & initial intrusion attempts

Planned operation to hinder Iran's enrichment
program (Stuxnet)

Successful cyberphysical experiments

2013
First publicly known OT recon
activities (HAVEX)

2015
Ukraine power grid attack
(BlackEnergy)

2016
Ukraine power grid attack
(Industroyer)

2017
TRITON

https://www.bankinfosecurity.com/ukrainian-power-grid-hacked-a-8779

https://www.schneider-electric.com/ww/en/Images/tricon-IC-654x654.jpg

Background on Siemens PLCs Market Share
Siemens and Rockwell Automation are PLC Market Leaders. Security issues in their product can have significant impact.
Source: https://www.interactanalysis.com/who-were-the-leading-vendors-of-industrial-controls-plcs-and-dcs-in-2017/

Siemens S7-1200
Entry PLC from Siemens (excluding Logo!) Easily accessible to researchers Applications*:
Chemical Critical Manufacturing Energy Food and Agriculture Water and Wastewater Systems
*Source: https://www.us-cert.gov/ics/advisories/icsa-19-318-02

S7-1200 PLC
Source: http://s7detali.narod.ru/S7_1200/S7_1212C.html

S7-1200 V4 PLC

1GB Winbond W94AD2KB LPDDR1 SDRAM

ARM CPU

128MB Micron Technologies MT29F1G16ABBDAHC-IT:D 63-ball VFBGA NAND Flash for Firmware.

STMicroelectronics M25P40/MX25L4005 4MB SPI Flash for bootloader

UART/Port for RS232 extension (CM 1241)

Source: http://s7detali.narod.ru/S7_1200/S7_1212C.html

S7-1200 V4 PLC HARDWARE - SOC DECAP
Renesas 811005 Manufactured, Siemens A5E30235063 ARM Cortex-R4 (Big-Endian), 2010. · Instruction Set/Read Main ID Register: Running CP15 command mrc p15, 0, r0, c0, c0, 0 instruction inside PLC yields 0x411fc143 response.
Source:http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0360f/I65012.html

Decoding 0x411fc143
MRC p15, 0, r0, c0, c0, 0 instruction
1000001000111111100000101000011
0x41 - 1 - f - c14 - 3

ARM Limited

Implementer

Hex 0x00 0xC0 0x41 0x42 0x43 0x44 0x49 0x4D 0x4E 0x50 0x51 0x56 0x69

Implementer Reserved for software use Ampere Computing Arm Limited Broadcom Corporation Cavium Inc. Digital Equipment Corporation Infineon Technologies AG Motorola or Freescale Semiconductor Inc. NVIDIA Corporation Applied Micro Circuits Corporation Qualcomm Inc. Marvell International Ltd. Intel Corporation

Variant

Architecture

Architecture
Architecture Meaning

0b0001

Armv4.

0b0010

Armv4T.

0b0011

Armv5 (obsolete).

0b0100

Armv5T.

0b0110

Armv5TEJ.

0b0111 0b1111

Armv6.
Architectural features are individually identified in the

Primary part number

Revision Number

Primary Part Number List

Core

Primary Part Number

Cortex-A5

0xc05

Cortex-A7

0xc07

Cortex-A8

0xc08

Cortex-A9

0xc09

Cortex-A12

0xc0d

Cortex-A15

0xc0f

Cortex-A57

0xd07

Cortex-r4

0xc14

Cortex-r5

0xc15

S7-1200 v4 Closer Look
Cortex R4 Revision 3 ARMv7 R, Thumb 2: Real-Time profile Protected Memory System Architecture (PMSA), based on a Memory Protection Unit (MPU) Multiple RAM Sizes SPI Flash (multiple type) NAND
RAM

Decapped SOC

NAND Flash

SPI Flash

M25P40/ Serial Flash Embedded Memory (bootloader)
SPI Flash with 1 to 4MB Low Voltage Paged Flash Memory. Contains banks with the size of 512KB. Bootloader verifies the integrity of the firmware and loads it to memory

S7-1200 Specs, 3D X-Ray Tomography

3D X-Ray Tomography
4 layered PCB design

PCB PCB Connection
VCC GND PCB Connection

CoreSight in Siemens PLCs
An ARM hardware tracing feature to trace programs.
Equivalent to Intel Process Trace (Intel PT) in ARM world.
Can be used for getting code-coverage from programs.
Hardware part is well documented*
Siemens PLCs detect being debugged via a watchdog and brick the PLC upon using CoreSight.
*Reverse Engineering Custom ASICs by Exploiting Potential Supply-Chain Leaks, Thomas Weber, BlackHat Asia 2019.

Siemens Firmware
~13MB binary. LZP3 compressed when downloaded from Siemens website. We got a dump of the RAM for both .text and dynamic memory area. ~84000 functions identified.

Siemens Bootloader, Startup Process
Setup low level hardware configuration.
Vectored Interrupt Controller (VIC) Software Interrupts, Prefetch-Abort Handlers, Data-Abort Handlers, Reset/undefined instruction and FIQ handlers.
Checking CRC32 checksums of bootloader
The last 4 bytes of the bootloader is the CRC checksum for it.
Check the CRC32 checksums of the firmware before passing control to it. Less than 128KB. Siemens changed the bootloader SPI Flash in 2018.

Wait for a UART Command
Special Access Feature

Start
Initialize Hardware Stage 1
DAB,PAB,SWI, FIQ, VIC IRQ, Reset, Undefined Instr,
Clock, MMC, ADC, Other MAP3 (Sinec Bus) I/O

Initialize Other Hardware Stage 2
SPI, IOC (FAT filesystem), UART

Check bootloader CRC checksum

Initialize CRC Table Constants & Page
Integrity List

Check CRC of Flash

Init Bootloader in RAM
0x210
Final Mapping of Flash Memory to
RAM
0x014B74

Siemens Firmware Components

ADONIS Library OS Services

SIEMENS AG ADONIS RTOS
0x00040040 at .sdramexec
Adonis Init Kernel
0x00E7AC50

Automation-related Services

S7P File Services

Dinkumware C/C++ Lib v5.01

PNIO PROFINET

AWP Automated Web Programming

PDC FS

EFS/NTFS

NicheStack IPV4/ SNMP

Some Low-Level Configuration (e.g.,

Siemens

MiniWeb Server &

MPU Reconfiguration)

MWSL Parser, OpenSSL

Log/Diag System

ACE 6.3 for S7P Components
ADAPTIVE COMMUNICATION ENVIRONMENT

MC7P Parser MC7P RunTime MC7P Compiler

Siemens OMS

Central IO Subsystem ALARM Subsystem

OMS SP Parser

OMS Configuration OMS FAT

Execution Mode Stack in S7-1200 v4

Execution Modes, Defined in 0x000400B4 of S7-1200 Firmware

Supervisor

IRQ

FIQ

Abort

Undefined

System

.dtcm 0x10011000

.dtcm 0x10011400

internal_ram0 0x10030400

internal_ram0 0x10030800

internal_ram0 0x10030C00

internal_ram0 0x10032000

Some additional interesting code regions:
0x80080000 Flash related MMIO. 0x03c41040 to 0x06fac934: used as heap memory returned by malloc().

FW Memory Mapping on S7-1200 v4, From 0x000439C0

Segment Name .exec_in_lomem .bitable .sdramexec .syscall .th_initial .secinfo .fixaddr .fixtype .text .rodata .data .bss .cc_memory .uninitialized CLSI_CACHED_MEM_POOL .dram_uncache MAP_MAC_MEM .iram0 .iram1 .crctable .softboot .bootinfo .dtcm

Table 1
Range 0x00000000-0x000075b4 0x00040000-0x00040040 0x00040040-0x00040510 0x00040540-0x00040548 0x00041040-0x00043998 0x000439c0-0x00043cfc 0x00043d00-0x00043d00 0x00043d00-0x00043d00 0x00043d00-0x00defda0 0x00defdc0-0x011a116c 0x011a1180-0x011c1d14 0x01e01040-0x02620f58 0x03641040-0x03641040 0x03c41040-0x06fac934 0x06fac940-0x06fac940 0x07ff0000-0x07ff0000 0x07ff0000-0x07ff0494 0x10030000-0x10037aa0 0x10040000-0x1004c35c 0x1004f400-0x1004f800 0x1004f800-0x1004ff00 0x1004ff00-0x1004ff1c 0x10010000-0x10012c70

Size 000075b4 00000040 000004d0 00000008 00002958 0000033c 00000000 00000000 00dac0a0 003b13ac 00020b94 0081ff18 00000000 0336b8f4 00000000 00000000 00000494 00007aa0 0000c35c 00000400 00000700 0000001c 00002c70

Flags 1 1 1 1 33 34 4 4 33 34 42 12 4 12 4 4 12 12 12 12 12 12 12

I/O Memory Mapping on A5E30235063, From 0x00df4a80

Table 1

Segment Name

Range

Size

Segment Name

Range

itcm

0x00000000-0x00008000

0x00008000

MAP3_OUTPUTS

0xfffba000-0xfffba218

ddram

0x00008000-0x04000000

0x03ff8000

MAP3_ITIMER0

0xfffbb000-0xfffbb010

configured_dtcm

0x10010000-0x10014000

0x00004000

MAP3_ITIMER1

0xfffbb010-0xfffbb020

internal_ram0

0x10030000-0x10040000

0x00010000

MAP3_ITIMER2

0xfffbb020-0xfffbb030

internal_ram1

0x10040000-0x10050000

0x00010000

MAP3_ITIMER3

0xfffbb030-0xfffbb040

MAP3_PWRSTK

0xfffb0000-0xfffb003c

0x0000003c

MAP3_ITIMER4

0xfffbb040-0xfffbb050

MAP3_SPI0

0xfffb1000-0xfffb1018

0x00000018

MAP3_ITIMER5

0xfffbb050-0xfffbb060

MAP3_SPI1

0xfffb2000-0xfffb2018

0x00000018

MAP3_ITIMER6

0xfffbb060-0xfffbb070

MAP3_I2C0

0xfffb3000-0xfffb306c

0x0000006c

MAP3_ITIMER7

0xfffbb070-0xfffbb080

MAP3_I2C1

0xfffb4000-0xfffb406c

0x0000006c

MAP3_ITIMER8

0xfffbb080-0xfffbb090

MAP3_I2C2

0xfffb5000-0xfffb506c

0x0000006c

MAP3_ITIMER9

0xfffbb090-0xfffbb0a0

MAP3_ADC

0xfffb6000-0xfffb6024

0x00000024

MAP3_ITIMER10

0xfffbb0a0-0xfffbb0b0

MAP3_UART0

0xfffb7000-0xfffb709c

0x0000009c

MAP3_ITIMER11

0xfffbb0b0-0xfffbb0c0

MAP3_UART1

0xfffb8000-0xfffb809c

0x0000009c

MAP3_ITIMER12

0xfffbb0c0-0xfffbb0d0

MAP3_HSC0

0xfffb9100-0xfffb9180

0x00000080

MAP3_ITIMER13

0xfffbb0d0-0xfffbb0e0

MAP3_HSC1

0xfffb9180-0xfffb9200

0x00000080

MAP3_TIMERS

0xfffbb000-0xfffbb15c

MAP3_HSC2

0xfffb9200-0xfffb9280

0x00000080

MAP3_IOC

0xfffbc000-0xfffbc02c

MAP3_HSC3

0xfffb9280-0xfffb9300

0x00000080

MAP3_FL_MEMCTL

0xfffbd000-0xfffbe000

MAP3_HSC4

0xfffb9300-0xfffb9380

0x00000080

MAP3_VIC

0xfffffc00-0xfffffe00

MAP3_HSC5

0xfffb9380-0xfffb9400

0x00000080

MAP3_EMB0

0xfff50000-0xfff50048

MAP3_INPUTS

0xfffb9000-0xfffb9400

0x00000400

MAP3_EMB1

0xfff51000-0xfff51048

MAP3_PLS0

0xfffba000-0xfffba080

0x00000080

MAP3_DDR_MEMCTL

0xfff52000-0xfff5208c

MAP3_PLS1

0xfffba080-0xfffba100

0x00000080

MAP3_MMC

0xfff60000-0xfff60104

MAP3_PLS2

0xfffba100-0xfffba180

0x00000080

MAP3_LCD

0xfff70000-0xfff70ff8

MAP3_PLS3

0xfffba180-0xfffba200

0x00000080

MAP3_MAC

0xfff90000-0xfff900a4

NOT USED

NOT USED

NOT USED

MAP3_BOOL_HELPER

0xfffa0000-0xfffa4000

Size 0x00000218 0x00000010 0x00000010 0x00000010 0x00000010 0x00000010 0x00000010 0x00000010 0x00000010 0x00000010 0x00000010 0x00000010 0x00000010 0x00000010 0x00000010 0x0000015c 0x0000002c 0x00001000 0x00000200 0x00000048 0x00000048 0x0000008c 0x00000104 0x00000ff8 0x000000a4 0x00004000

ADONIS MPU Configuration at 0x000400B4

RG-NR base_addr region_end region_size region_access (XN=Execute Never, Read/Write, Type Extension, Cacheable, Bufferable)

B

FFF00000 100000000 1MB

XN=1 Privilege Mode: RW, user mode: RW, TEX: 0 Share: 0 C: 0 B: 1

A

7FF0000 8000000 64KB

XN=0 Privilege mode: RW, User mode: RW, TEX: 4 Share: 0 C: 0 B: 0

9

0

8000000 128MB

XN=0, Privilege mode: RW, User mode: RW, TEX: 4 Share: 0 C: 0 B: 1

8

80000000 84000000 64MB

XN=1, Privilege mode: RW, User mode: RW, TEX: 0 Share: 0 C: 0 B: 0

7

10030000 10040000 64KB

XN=0, Privilege mode: RW, User mode: RW, TEX: 4 Share: 0 C: 0 B: 0

6

10040000 10050000 64KB

XN=0, Privilege mode: RW, User mode: RW, TEX: 4 Share: 0 C: 0 B: 1

4

10010000 10014000 16KB

XN=0, Privilege mode: RW, User mode: RW, TEX: 4 Share: 0 C: 0 B: 0

3

10020000 10022000 8KB

XN=0, Privilege mode: RO, User mode: RO, TEX: 4 Share: 0 C: 0 B: 1

TEX: Type extension field, allows you to configure memory access type, for example strongly ordered, peripheral.

Siemens Firmware Boot Process
0x00040040: Enable instruction cache and some system specific coprocessor register 0x000400B4: Set up stack pointers for different execution modes. 0x000402A4: Set up the Vectored Interrupt Controller (VIC) 0x000400B4: Configure MPU via MPU coprocessor instructions. 0x000403E4: Zero out the .bss section 0x00567698: Set some IOC config and run ADONIS boot function
0x00567698: Set some IOC config and run ADONIS boot function

ADONIS Kernel
ADONIS boot at 0x002E098C An array of initialization functions are called one by one.
OMS and XML serialize parser initialize here. HTTP Handlers, MiniWeb.
Setup management structures
LTRC Subsystem initialize here.
Setup file system entries in .bss Threading is supported in the OS. Memory Management:chunks, malloc, free and techniques such as reference counting available.

ADONIS File System

Adonis FS Devices

/dev

/root

/tmp

/pdcfs

We identified four different file system devices FAT file system (and NTFS) is supported. Proprietary PDCFS (Power Down Consistency Files System)

ADONIS TCP/IP Stack
ADONIS utilizes the InterNiche Technologies TCP/IP Stack v3.1 IP, TCP, UDP, ARP, SNMP, NTP are supported. TCP/IP stack is already leaked via some OEM of the stack. Not all components are used in S7 PLCs. We were able to independently compile the leaked stack.

ADONIS TCP/IP Stack, InterNiche Technologies INET Module
Several wrapper functions for socket creation, closing, binding and receiving in iniche/tcp/sockall.c. Based on functions on tcip/tcp/socket.c (soclose, sobind, soreceive) Handling Struct:
struct protosw * so_proto; /* protocol handle */
In our version, the structs are defined in tcip/tcp/protosw.h
int (*pr_usrreq) __P ((struct socket *, struct mbuf *, struct mbuf *));

Example TCP Connect() Invocation in PLC

tcp_usrreq()@tcp_usr.c
Allocate Memory
tcp_output@tcp/tcp_out.c
Copy content to buffer and perform checks/set flags
ip_output@tcp/nptcp.c
Assemble data to be sent in a TCP header & calc checksum

soisconnecting()@socket2.c
Some preparation

Symbol

Description

ip_write@ip/ip.c ip_write_internal@ip/ip.c

INICHE_tcip_proto_SOCK_STREAM

The struct of type struct protosw as defined in tcip/tcp/ protosw.h for the socket type SOCK_STREAM (tcp socket).

Handles addressing multicasting and put content to the send queue

tcp_usrreq INICHE_tcip_proto_SOCK_DGRAM

The handler function for serving user requests for TCP sockets.
The struct of type struct protosw as defined in tcip/tcp/ protosw.h for the socket type SOCK_DGRAM (udp socket).

SignalPktDemux@ip/ip.c

Notify task for newly available packets

udp_usrreq

The handler function for serving user requests for UDP sockets.

Firmware Update Process On S7 PLC
Updates available via Webserver and SDCard (24MB, costs a whopping ~250 Euros!) Siemens S7-1200 firmware (.upd) are compressed update structure, contains:
Constant size metadata (44 bytes) Headers describing contents of the file Contents of headers
Types seen so far:BG_ABL: descriptor, FW_SIG: firmware signature, A00000: Main update contents, B00000: metadata

Decompressed Firmware Update File Structure
Decompressing a .upd file results in the raw structure of the flash contents (has its own format) Actual firmware update occurs at 0x0059CAE0.
Bootloader has its own update function, skipping signature verification (at 0x000137E8).
LZP3 decompress routine available at 0x00BCEAA8 of V04.02.01 firmware. Firmware signature is based on ECDSA signature over the SHA256 hash of compressed firmware contents. Public key available at 0x010D1EE8 of V04.02.01 firmware

Firmware Structure Size 0x40

Offset

Name

00

Magic Header 0x5D1B4153

04

Entry Point 0x00040040

08

File offset of end of IRAM/Start FW contents , 0x00040040

0C

Unknown

10

Address of Firmware Section 0x00040000

14

Header Size (0x40) 0x00040000

18

(File offset end of IRAM/Start FW)-1 0x00040000

1C

Address of IRAM (0x10000000)

20

Version DWORD

??

Unknown

34 File offset or end of FW contents

...

Unknown

3C

CRC over header

MiniWeb, Siemens S7 PLCs Webserver

Miniweb Components

Miniweb Diag
Miniweb S7Web

Miniweb Core
MWSL XML Parser

Miniweb AWP
Miniweb Proactorif
(ACE)

Miniweb starts at 0x0063BE20 as a service in main firmware initialization routine of ADONIS

HTTP login mechanism:

Initial checks are called from FormLogin routine and some undocumented HTTP request handler.

Actual password check happens at 0x007CCBA0.

Miniweb seems like using jQuery version 1.11 which has some known XSS issues.

Part of Miniweb code base used for Windows-based webserver from Siemens.

Undocumented HTTP Handlers

HTTP GET Request Handler /appapiappa/vvvvvvvvvv /appapiappa/vvvvvvvvvvv /appapiappa/lilililili /appapiappa/lololololo /appapiappa/cmcmcmcmcm /appapiappa/flflflflfl /appapiappa/gbpigbpigb
/appapiappa/gmigmigmig /appapiappa/galegalega /appapiappa/galeldgale /appapiappa/gvigvigvig /appapiappa/svsvsvsvsv

Description version version log in log out change CPU mode flash LEDs get station info as json (name, mac, mode)
get module info (list): get name, serial, FW version, HW version, status unknown get AS log entry unknown unknown

MiniWeb Scripting Language (MWSL)

<MWSL> //MWSL code to be executed WriteVar("CPULoad.Percent", "PROCESS", "%e"); GetVar("var/systemClock", "PROCESS", "%d");

Users can create custom web pages using MWSL.

</MWSL>

MWSL is somewhat resembling PHP with JavaScript Syntax.

Errors in MWSL functions result in error messages in output HTML (possible leakage)

No output encoding apart from url encoding and decoding functions

Raises the risk of trivial XSS vulnerabilities.

GetVar("var/modeOfOperation", "PROCESS", "%s") supports arbitrary-length outputs.

Compiled MWSL programs consist of a compiled handler function and nested templating chunk structs.

Special Access Feature
A set of special functionalities within the PLC bootloader Various diagnostics functions, Exposed via UART Access UART port was previously documented*.
There were other functionalities in it, which we did not investigate.

Wait for a UART Command

Start

Initialize Hardware Stage 1
DAB,PAB,SWI, FIQ, VIC IRQ, Reset, Undefined Instr, Clock, MMC, ADC, Other MAP3 (Sinec
Bus) I/O

Initialize Other Hardware Stage 2
SPI, IOC (FAT filesystem), UART

Check bootloader CRC checksum

Initialize CRC Table Constants & Page
Integrity List

Check CRC of Flash

Init Bootloader in RAM 0x210
Final Mapping of Flash Memory to
RAM 0x014B74

Special Access Feature

*Cojocar et al. Off-the-shelf Embedded Devices as Platforms for Security Research

TX

RX

GND

Special Access Feature
Bootloader initializes the hardware This includes copying some content from bootloader to IRAM.
Only wait half a second from UART for :

Hardware Initialize
.... .... IRAM ..... ....
Countdown 0.5 Second from boot time

MFGT1 strings, possibly Mit Freundlichen Grußen (German Greeting).
If PLC received "MFGT1" string it will acknowledge with -CPU
PLC now waits for Special Access Feature commands at 0xedf8.

Check UART Input for MFGT1

Respond on UART with -CPU

Wait for Commands via
UART

Primary Handlers After Handshake

Index Input Length Functionality

02

Get Version

12

Get firmware version

22

Check bootloader CRC

32

Check CRC flash part 2 (sectors 0 to 0x203), returns details on failure

42

Check IRAM (internal RAM) read/write

5 xx

Check TCM (Tightly Coupled Memory) read/write

63

Hardware tests for I2C, IOC, MAC

72

Some low level reset involving a temporay fiq handler

82

Some functionality related to I2C2

0c 6

Perform some read and crc calculation on flash memory, uses buf also used with ADC IOC

0d 2

Performs reads of static bootloader values and writes to some hardware mapped addresses

0e 3

Outputs some internal RAM values previously retrieved from static bootloader contents

11 2

Something related to MMC looping/checking

12 2

Some activation or waiting for I2C0

14 7

[!] Print (and seemingly update) current flash contents to(/from) UART.

16 2

Queries and returns some MMC bit.

17 2

Performs some lookup table based stuff in I2C1

18 3

Prepare reading flash update via UART to IRAM

19 >6

Read flash update via UART to IRAM

1a 2

[!] Commit flash update

1c XX

We will talk about it later

30 XX

Query some CRC info about flash mode/part 2

31 7

[!] Performs an update of 8 bytes of flash number 2. This may be sending a length/crc pair

32 2

Check flash 2

.. xx

Prepares writes to EMB0 (plus some more ops on state structs).

Wait for UART Commands from Primary Handler List

Protocol and
Checksum Check

send error via UART

Passed. Call the corresponding handler

Primary Handler List 0x00014D98
Contains128 handlers .... 0x1C .... .... ....

0x80 Update Mode Function
0xA0 UART Config

0xA2 for bye

0x80 Handler, Update Mode Function

0x80 allows us to write to IRAM in Update Target 1 (IRAM)
Check number of required args and
function ptr

0x80 after Handshake

Receive From UART in Special Access Mode

0x80 Update Mode Function 0xD1F0

Wait for Update Target ID

Update Target ID and Function Modes
Update Target: Functions
1. IRAM: Config/Read/Write/ Check
2. SPI/IOC: Config/Read/Write/ Check
(possibly bootloader update)
3. Flash: Config/Read/Write/ Check
4. No Operation

0x1C Primary Handler

Bootloader: *Copied Function Table for 0x1c from
bootloader (00015280) to IRAM
0x00000638

This handler allows to call functions from a secondary list.

0x1C after Handshake

Receive From UART in Special Access Mode

0x1C Flexible Function Call
Handler 0x00011180

Wait for Secondary Handler ID

Handler List Copied during IRAM init* 00015280

"Tobi, RCE Please!?"
­Ali Abbasi, A Guy Without UK Visa.

Siemens S7-1200 PLC Bootloader Arbitrary Code Execution

Handler Number
0x1C

IRAM

.bootloader Segment

... 0x1C Function Pointers Tables
1003ABA0: 0xFDD8

0xFDD8: .....

...

0xFE4C: ....

....

....

Siemens S7-1200 PLC Bootloader Arbitrary Code Execution

Handler Number
0x1C

IRAM

...

2

0x1C Function Pointers

Tables

.bootloader Segment

1003ABA0: 0xFDD8

0xFDD8: ..... 0xFE4C: ....
.... ....

1003ABA0:10060000
3 10060000:Payload

Handler Number

0x80

1

Siemens S7-1200 PLC Bootloader Arbitrary Code Execution

Handler Number

Handler Number
0x1C

IRAM

...

2

0x1C Function Pointers

Tables

0x80

1

.bootloader

1003ABA0: 0xFDD8

Segment

5

4

1003ABA0:10060000

0x1C

0xFDD8: .....

0xFE4C: ....

....

6

....

3 10060000:Payload

Siemens S7-1200 PLC Bootloader Arbitrary Code Execution
Chaining everything together. Use 0x80 to write stager payload to the IRAM (update target 1, mode 3) Use 0x80 to add an additional item to handler list of 0x1C , pointing to our Stager payload. Now call 0x1C and....

Stager Payload
Using Special Access only allows write to IRAM The write primitive is slow and error prone. During Special Access mode we are in privilege mode. Stager payload upgrades this to an arbitrary read/write primitive of the entire PLC memory We use this to inject arbitrary payloads.

DEMO Time

Conclusions and Future Works
Programmable Logic Controllers are becoming more and more complex.
Built-in complexities such as the MWSL implementation can lead to security issues.
Vendors upped their game by introducing certain hardening to their devices.
We observed other PLCs which had with similar legacy access features, but they did not have security features.
We should push vendors to remove legacy access features which undermine their security ecosystem. At the same time, vendors should rethink the security via obscurity mindset when considering IP protection approaches. There are a lot of things to be done to make PLCs safer.

Special Thanks To
Thomas Weber, Sec-Consult Alexandre Gazet, Airbus Cyber Security Marina Krotofil, BASF Lucian Cojocar from VU Amsterdam Nikita Golovliov, TU Eindhoven

"Everything That Has A Beginning Has An End"
The Matrix Revolutions .
Looking for more technical details? Attend our talk in:
Chaos Communication Congress (36C3), Leipzig, Germany SCADA Security Scientific Symposium (S4) in Miami USA
bl4ckic3 ali@ali.re ScepticCtf tobias.scharnowski@rub.de ThorstenHolz thorsten.holz@rub.de

