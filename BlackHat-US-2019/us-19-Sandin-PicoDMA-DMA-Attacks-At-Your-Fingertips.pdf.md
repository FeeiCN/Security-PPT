BLACKHAT USA 2019
PICODMA: DMA ATTACKS AT YOUR FINGERTIPS

2
WHO WE ARE
 Ben Blaxill (ben [at] blaxill.org)  Former Principal Security Consultant with Matasano / NCC  Currently independent hardware researcher
 Joel Sandin (jsandin [at] gmail.com / @PartyTimeDotEXE)  Formerly Senior Security Consultant with Matasano / NCC  Currently a principal at Latacora (https://latacora.com)
helping startups bootstrap their security practice

3
TALK AGENDA
 Background on DMA attacks  Introduce PicoDMA: wireless DMA implant  FPGA / DMA engineering deep dive  Radio module hardware and software  Demos, conclusions, future work

4
DMA ATTACKS
 Direct Memory Access (DMA): typically involve attacker
that gains physical access to a device
 Attacker reads and writes physical memory through high
speed expansion port (Thunderbolt, ExpressCard, more)
 Can recover sensitive data from memory  Can backdoor target machine to read files, bypass
authentication, more

5
SELECTED PREVIOUS WORK
 SLOTSCREAMER (2014) by Joe Fitz:
USB3380 reference board -> stealthy DMA hardware implant
 Pcileech (2016+) by Ulf Frisk:
remarkable DMA attack suite
 HPE iLO vulnerability research
(2018+) Fabien Périgaud, Alexandre Gazet, Joffrey Czarny: groundbreaking research, PCILeech integration
This list only scratches the surface of interesting work in this space

6
PREVIOUS WORK: HID IMPLANTS
 Incorporate deception / wireless  TURNIPSCHOOL + USB Ninja:
 Masquerades as a cable!  CactusWHID:
 WHID Elite adding SIM800L  Maltronics internal keylogger:
 Tiny (1cm2 ), persistent

NOT JUST FOR ATTACKERS
 DMA invaluable for
forensics
 Use tools like Volatility
and rekall to extract:
 Memory contents
of running processes
 Open network
connections, files
 Much more

7
pslist example from rekall forensic blog

8
DMA ATTACK EXAMPLE (PCILEECH)
 Targeting hardened
workstation
 BIOs reset to
disable IOMMU
 Connect FPGA to
M.2 slot
 Use PCILeech to
patch memory and unlock machine
Excellent writeup at https://www.synacktiv.com/posts/pentest/practical-dma-attack-on-windows-10.html

RESEARCH GOALS

10
DMA CAPABLE HARDWARE IMPLANTS
 Develop small DMA-capable hardware device  Implant should be persistent  Incorporate wireless capabilities  Use off-the-shelf hardware
 PoC new attack and defense scenarios  Provide low-cost building blocks for new applications

11
PICODMA INITIAL PROTOTYPE
 Tiny: fits on a keychain  DMA-capable: 64-bit
streaming reads, writes, and FPGAenabled search
 PCILeech compatible!  Commodity hardware

12
HIGHLY EMBEDDABLE
 Easy to install  Fits in small places  Only needs M.2 A/E key
expansion slot (or adapter)
 Out-of-band access: no
network access on target

13
DEPLOYING PERSISTENT WIRELESS DMA IMPLANTS
 Decoupling installation from exploitation allows:  Interdiction attacks: install small physical implant when
target device is powered down and in transit
 Abuse physical access: remote hands-and-eyes
technician with temporary physical access installs implant
 Deploy prior to offboarding: Attacker may have
legitimate access to a system before reinstall
 Deploy during provisioning: Remote forensics later

14
NEW ATTACK VARIATIONS
 Don't need access when machine is live  Can capture ephemeral credentials from memory:
 GPG and ssh agents  Web session cookies  Profile and collect activity logs over time  Protections enabled when machine is locked don't apply

15
KEY INGREDIENTS
 FPGA platform for DMA  Radio module for remote
access
 Some way to connect them  Software to drive the attack  Enter the PicoEVB from RHS
Research, LLC...

PICOEVB

17
PICOEVB AS A DMA PLATFORM
 Commercially available: Launched on
Crowdsupply ($220 USD)
 Artix-7 XC7A50T on a 22 x 30 x
3.8mm board
 M.2 form factor: A/E slot  Expandable: 4 multipurpose I/O
connectors, high-speed digital I/O

PROTOTYPE ENGINEERING

19
REMOTE PCIE DMA REQUIREMENTS
 PCIe requires  High bandwidth capable chip  Low latency
 Remote communication requires  Low bandwidth  High latency leniency

PICODMA HIGH LEVEL
 Similar to previous PCIe DMA platforms  Except we do more processing on the FPGA  ... and attach a radio to it

HOST

PCIe

FPGA

SPI

PROCESSOR &RADO

PicoDMA

DISCARDED IDEAS
 Microblaze/etc softcore on FPGA  250 MB/s+ challenging without additional engineering
effort
 We only need a fixed set of functionality  Hardcore ARM/other more realistic (e.g. ZYNQ)  SPI exposed directly over LoRa / Radio

FUTURE PLATFORM IDEAS
 Specialized PCB  Lattice FPGA
 Lower cost  Better support from Open Source community  BOM cost potentially <$50

0 TO PCIE DMA IN UNDER 5 MINUTES

24
PCIE CONNECTORS
 Standard  mPCIe  M.2
 A-M keying set by physical notch  A / B / E / F / M defined, the rest reserved

25
PCIE PINS
 Differential Pairs of Wires  One pair for reference clock (100Mhz)  One pair per direction per "lane" (1 lane == 4 wires)
 Standard connector up to x16  M.2 up to x4  Physical link width is negotiated

26
... OR USE AN ADAPTER
 M.2 keying also selects availability of:  USB 2.0 & 3.0  I2C  DisplayPort  SATA  & More

27
PCIE PROTOCOL HIGH LEVEL
 Packet based  Tries to look like old PCI bus for backwards compatibly  Many features such as flow control not covered here  We care about the Transaction Layer
 Looks more like a directly connected bus  DMA usually host initiated

28
PCIE PROTOCOL SECURITY HIGH LEVEL
 Protocol Insecure by default  Valid threat model as physical access is required
 Device identification done by  16 bit physical slot address (e.g. 01:00.0)  Device ID read from Endpoint configuration space  No challenge response to secure element on device
means device ID can always be spoofed

29
TRANSACTION LAYER PACKET (TLP) TYPES
 Read / Write Memory  Completion  Configuration Read / Write  IO Read / Write  Interrupts  and more...

30
Figure 3-1: 7 Series FPGAs Integrated Block for PCI Express v3.3 - Copyright Xilinx

0 TO FPGA IN UNDER 5 MINUTES

32

FPGA INTRO

 Synchronous circuits as programmable logic gates  Wide range of capabilities and cost

Lattice ECP5
 ~$10  25K LUTs

Xilinx XC7A50T
 ~$60  50K LUTs

Xilinx VU9P
 > $10,000  1,800K LUTs

 Great for high speed IO, cycle accurate timing, and more  Bad for engineer productivity

33
FPGA OVERVIEW
 Mostly lookup tables (LUTs), routing between them and
clock networks
 "Hard cores" too - not just LUTs  Ethernet controllers  PCIe controllers  Etc.
 Low / Mid range devices still capable of high clock rates

34
FPGA DESIGN
 Tooling mostly proprietary  Circuit design is very different to software design
 Different approach to design / coding  Different bugs and debugging process  Two major classes of design  Register-transfer level (Verilog / VHDL / etc)  Behavioral synthesis (OpenCL / HLS Compilers)

35
CLASH / CHISEL / ETC
 RTL design, but at a high level, benefitting from  Advanced type safety  Higher order programming
 Can prevent user from making clock domain errors  An additional compilation step

36
SYNTHESIS AND IMPLEMENTATION

37
DEBUGGING

PCIE MEETS FPGA

39
PICODMA FPGA OVERVIEW
 FPGA core exposing PCIe DMA functions as SPI slave  Read  Write  Search  Probe
 Asynchronous commands

SPI PROTOCOL
 Ubiquitous  Simple to implement  Microcontroller friendly  Other options: I2C, UART, etc  Master initiated communication

40
Copyright SparkFun

GOTCHA #1
COMPILER INDUCED METASTABILITY
AKA

X = 1 If X == 0 then
Y = 0 else
Y = 1
>> Y == 0

GOTCHA #2
ENDIANNESS MADNESS

GOTCHA #3
NUMEROUS OTHER ISSUES - LOTS OF PAIN

PYCOM INTEGRATION

52
ADDING WIRELESS CAPABILITIES
 No radio on PicoEVB: Need a second
device to handle communication
 Chose Pycom family for prototyping:  Micropython-enabled  Drive DMA over multipurpose I/O  Expose server that supports reads
and writes of physical memory

53
PYCOM PROS
 Rapid prototyping with python  Integrated radio modules: 802.11b/g/n,
LTE, LoRa, more
 Expansion via SPI, I2C, lots of pins for GPIO  Pretty tiny: 5.5 x 2cm

54
... AND CONS
 32-bit architecture: (Xtensa dual-core LX6)  Limited memory: 4MB ram, 8MB flash  Data copies can lead to heap fragmentation  Low-bandwidth SPI connection
Our software accounts for these challenges

PYTHON SOFTWARE STACK

WIRING GUIDE

57
FUN GOTCHAS
 If you connect 3.3V on Pycom (instead of VIN) to PicoEVB,
PicoEVB breaks (don't pull a Joel)
 If code upload (via FTP) dies, Pycom becomes unbootable  Hold P12 high via 3.3V pin to boot into recovery
 WLAN configuration is brittle and dangerous  Use development board or enable UART  Sensitive to AP hardware as well

DEMOS
 TARGET: Intel BOXNUC8i7BEH1  Ubuntu 16.04.06 LTE with
4.8.0-58-generic kernel
 VT-d disabled  kaslr disabled  "Airgapped" with implant

64
KEY TAKEAWAYS
 Wireless DMA implants are more flexible, allow new attack
variations and targets
 PicoEVB is a promising platform for DMA research and
implant development
 Plenty of challenges to overcome in developing a working
prototype

65
SOFTWARE RELEASE
 Making open-source software available (see github.com/picodma):  PicoDMA-fpga: Clash and Vivado projects with design files and
documentation
 PicoDMA-radio: Pycom-ready rawtcp:// server with pcileech
support
 Pcileech-with-offsets: pcileech kmd.c hack to load offsets  Other useful tools!
 Pcileech-tcp-to-file: useful for testing and forensics

66
FUTURE WORK
 Improve robustness of platform  Add richer FPGA-native capabilities  Explore implications for embedded systems  Use PCILeech to understand challenge of new targets
 Windows, UEFI...  Develop more tightly coupled system  More

67
THANK YOU!
 This work owes a huge debt to:  Ulf Frisk for releasing PCILeech, and all project
contributors and users
 Fabien Périgaud, Alexandre Gazet, Joffrey Czarny for
groundbreaking research and showing the way for PCILeech integration
 Audience for listening and feedback!

