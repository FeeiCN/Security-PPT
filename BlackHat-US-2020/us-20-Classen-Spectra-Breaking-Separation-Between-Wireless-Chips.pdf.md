Spectra
Breaking Separation Between Wireless Chips

Jiska Classen
Secure Mobile Networking Lab - SEEMOO Technische Universität Darmstadt, Germany

Francesco Gringoli
Dept. of Information Engineering University of Brescia, Italy

Motivation
2

When you got Bluetooth on-chip RCE...

35C3 Talk: https://media.ccc.de/v/35c3-9498-dissecting_broadcom_bluetooth, Frankenstein Fuzzer: https://github.com/seemoo-lab/frankenstein

3

...but Wi-Fi has more privileges.
"But it's connected via UART!" "Can you pop calc?"
4

Let's break inter-chip separation!
5

Spectra: SpeculativeSpectrum Transmission
 Wi-Fi, Bluetooth, and even LTE share frequencies in the 2.4 GHz spectrum.
 They cause interference in small devices like smartphones.
 Wireless combo chip performance optimization: enhanced coexistence mechanisms.
 Observable side effects of transmission delays and coordination lead to side channels.
 Attackers require code execution privileges, but they can escalate between wireless cores without further checks by the operating system.
SPECTRA
6

Wireless Architecture (iOS)
7

Spectra Impact
1. Denial of Service One wireless core denies transmission to the other core.
2. Information Disclosure One wireless core can infer data or actions of the other core.
3. Code Execution One wireless core can execute code within the other core.
8

Broadcom Coexistence
(and Cypress)
9

Broadcom: ~ 1 Billion Devices
 Apple
 All iPhones, MacBooks, iMacs, older Apple Watches
 Samsung
 Samsung Galaxy S and Note series in Europe
 Google
 Only older devices, e.g., Nexus 5/6P
 Raspberry Pi  IoT devices
 Fitbit Ionic
...and no firmware checks. A perfect prototyping platform \o/
10

Coexistence: Escalation within the chip

From the BCM4339 datasheet (Google Nexus 5).

11

By the way, throughput really sucks with ECI disabled. You cannot stream a video with Wi-Fi and listen to it with your Bluetooth headset.
AN214852 - Collaborative Coexistence Interface Between Cypress-to-Cypress Solutions and Cypress-to-third-party Chips

12

Serial Enhanced Coexistence Interface
(also SECI, ECI, GCI)
13

Serial Enhanced Coexistence Interface

 Separate Bluetooth (CYW20719) and Wi-Fi (CYW490307) boards.
 Only connection: Serial Enhanced Coexistence Interface (SECI).
 Separate antennas, exclude side effects!
 Debugging with logic analyzer.

Bluetooth

Wi-Fi

14

What does it look like?
15

Reconfigure SECI
16

Denial of Service BTWi-Fi
CVE-2019-15063 (reported August 2019)  When Bluetooth writes to the gci_chipcontrol register at 0x650200,
this crashes Wi-Fi.  We can observe a voltage drop with the logic analyzer.  Causes a kernel panic on various devices, Wi-Fi PCIe behaves really strange
afterward...
17

macOS Kernel Panic Demo
18

Denial of Service BTWi-Fi
19

Speaker switch Jiska -> Francesco
20

Wi-Fi D11 Core
21

Broadcom Wi-Fi Architecture

Quite the same real-time architecture since 2003:
 Initial version: Soft MAC Linux host talks directly with low level stuff.  Newer versions: Full MAC additional ARM core offloads almost all operations.

Userspace

Linux Kernel

Wi-Fi Module

Host

Full MAC

Host

Userspace

Linux Kernel

Wi-Fi Module

ARM CM3

RAM/ROM

DMA

Tx FIFO Rx FIFO Wi-Fi Chipset

D11 MAC Core

Tx FIFO Rx FIFO Wi-Fi Chipset

D11 MAC Core

Shared Memory ucode Memory

D11 PSM CPU

Shared Memory ucode Memory

D11 PSM CPU

Radio Front-end

Radio Front-end

PHY

RF

Baseband

DSSS OFDM

PHY PHY

Since BCM94303 (2003) and BCM94318E (2006), chipset initially called Airforce One

PHY

RF

Baseband

DSSS OFDM

PHY PHY

22

D11 Core: A Specialized Microcontroller

Runs ucode, instruction set very proprietary, never seen in other architectures

 8 bytes fixed-length instructions  three operands instructions plus very weird bit-oriented operators  tightly connected to PHY hardware  example from the main loop:
jext EOI (COND_RX_PLCP), rx_plcp // Preamble (Physical-layer convergence protocol) jext COND_RX_COMPLETE, rx_complete jext EOI (COND_RX_BADPLCP), rx_badplcp jnext COND_RX_FIFOFULL, rx_fifofull

 example from send_response code:

mov

0x0D4, SPR_TME_VAL6

// ACK indicated by 0xD4

mov

0x035, TX_TYPE_SUBTYPE

je

RX_TYPE_SUBTYPE, TS_PSPOLL, pspoll_frame

Existing disassembler/assembler (customized to support later instructions)

 Michael Büsch created it back in 2007, updated since then within Nexmon.  hints about registers from many piece of software leaked publicly.

Public ucode tool initially released by Michael Büsch in 2007 (https://bues.ch/cgit/b43-tools.git), continued within Nexmon (https://github.com/seemoo-lab/nexmon).

23

Inside the D11 Core

Specialized MAC CPU
 Controls Tx and Rx engines
 channel access scheduling, retransmission  filters incoming packets
 Direct access to hardware:
 PHY registers  Radio  Interfaces, i.e., coexistence with Bluetooth
 Up to 64kB ucode memory  Up to 8kB own RAM (called Shared Mem)  Indirect access to host memory/FIFO  Sub-µs accuracy  many interfaces, like SECI...

ARM CM3

RAM/ROM

DMA

Template RAM
Maps memory/frames from main host

Tx/Rx FIFO

Tx Engine

D11 CPU
Decides if frames are pushed to host (CRC)

Rx Engine

ucode
Loaded by ARM firmware

Shared Mem
Indirectly accessible by ARM firmware

PHY

24

D11 Coexistence Interface (SECI)

Quite a few registers directly accessible from D11
 a 64-bit buffer for rxing messages from Bluetooth (time indications and msg type!)  messages are "streamed" from Bluetooth with high rate (every 1.25ms)
 programmable timers  one register btcx_trans_ctrl with two bits for telling Bluetooth
 who has priority  who is controlling antenna

D11 ucode (reference 43909B0 from Cypress):  12% of the 47kB ucode for coexistence
Jitter to Bluetooth measured with FPGA  receive a frame, wait until the end  transmit a SECI message  approximately 200ns std

Wi-Fi #1 Wi-Fi #2

FPGA
25

Grant/Reject Scheme
26

Bluetooth Grant and Reject Counters
27

Denial of Service Wi-FiBT
CVE-2020-10370 (reported March 2020)  When Wi-Fi is active and then stops sending SECI messages,
Bluetooth stops transmitting packets.
28

Observe SECI in Wi-Fi
29

Let's take a closer look!
Bluetooth keyboard connected, Wi-Fi is idle. Bluetooth sends a message every 30ms and Wi-Fi is sleeping.
30

Accurate Key Timings
31

Information Disclosure Side Channel
CVE-2020-10369 (reported March 2020)  Each Bluetooth Human Interface Device (HID) event generates a SECI message.  HID devices exist in different event timing variants, the keyboard under test had
30ms, but other keyboards have 12.5ms, 15ms, etc.  SECI messages are polled every 1.25ms by the Wi-Fi D11 core.  The SECI message for keep alive packets is different from the SECI message
containing a HID keystroke.  Infer keystroke timings and keypress amounts.
32

Speaker switch Francesco -> Jiska
33

WLAN RAM Sharing
34

When you spent too much time looking for side channels...
35

RAM sharing??! Only one direction?

From the BCM4339 datasheet (Google Nexus 5).

36

Where is the shared RAM?
 Bluetooth-only chips with coexistence interface? Cypress WICED Studio contains partial symbols for CYW20719, CYW20735, CYW20819 including register mappings, but nothing in there.
 Bluetooth/Wi-Fi combo chips? But they also forgot the symbols of one MacBook Pro (2016 model). wlan_buf_* ... let's go for this!
37

Information Disclosure
CVE-2020-10368 (reported March 2020)  Bluetooth can read information from the Wi-Fi RAM starting at register 0x680000.
This is mapped to Wi-Fi 0x180000. This range starts with a packet buffer.
38

Code Execution

CVE-2020-10367 (reported March 2020)

 Bluetooth can write data to the Wi-Fi RAM starting at register 0x680000. This is

mapped to Wi-Fi 0x180000.

 At 0x181000, Wi-Fi contains a function pointer table.

We can gain Wi-Fi code execution on a Samsung Galaxy S10 by writing to

0x681024 in Bluetooth.

CONSOLE: 000288.686 THREADX TRAP INFO: CONSOLE: 000288.686 Thread: main_thread(ID:0x54485244) run cnt:7792 CONSOLE: 000288.686 Thread: Stack:002fff24 Start Addr:002fdff0 End Addr:002fffef Size:8192 CONSOLE: 000288.686 Thread: Entry func:001c556d CONSOLE: 000288.686 Thread: Timer:0022cfcc CONSOLE: 000288.686 CONSOLE: FWID 01-a4172c0 CONSOLE: flags 30040007 CONSOLE: 000288.686 CONSOLE: TRAP 3(2ffeb8): pc 67452300, lr 19b569, sp 2fff10, cpsr 68000193, spsr 68000033 CONSOLE: 000288.686 ifsr 0, ifar 67452300 CONSOLE: 000288.686 srpwr: 0x100b0000 clk:0xb0040 pmu:0x13e 0x5fcbc7df 0x0 CONSOLE: 000288.686 r0 2e15a8, r1 2c96a4, r2 2ca298, r3 0, r4 2c9708, r5 19c46f, r6 467ae CONSOLE: 000288.686 r7 40, r8 28bde0, r9 2f9224, r10 2fdff0, r11 0, r12 67452300 CONSOLE: 000288.686 CONSOLE: sp+0 00000000 13d75f00 002d3a84 0028bde0 CONSOLE: 000288.686 sp+10 00299b74 00000000 0022d084 0028bde0 CONSOLE: CONSOLE: 000288.686 sp+20 0019c46f CONSOLE: 000288.686 sp+3c 00195a55 CONSOLE: 000288.686 sp+54 0019c46f

39

...also on macOS, MBP 2019/2020 (BCM4377)
40

CVE-2020-10367 and -10368: A few devices...
41

PCIe
42

When you have no idea what you're doing...
43

Wi-Fi code execution leads to various kernel panics
Kernel panics captured so far:  Samsung Galaxy S10e on Android 9  iPhone 8 on iOS 13.3, iPhone 6 on iOS 12.4  ...also macOS but likely another issue in the Bluetooth driver.
44

iOS Kernel Panic Demo
45

Other Chips
46

Mobile Wireless Standards: Bluetooth/LTE Coexistence
47

Everyone has proprietary coexistence features \o/
 Asked Broadcom if we can also include other wireless manufacturers into the responsible disclosure process.
 Yes, we can :)  Forwarded to Intel, MediaTek, Qualcomm, Texas Instruments, Marvell, NXP.
They all mention similar coexistence interfaces in their datasheets.  Some wireless chips do not separate wireless cores at all.
 Not directly vulnerable to Spectra? Operating system based side channels might exist...
48

Summary
49

Q&A
Twitter: @naehrdine, @seemoolab jiska@bluetooth.lol, francesco.gringoli@unibs.it
50

