When Lightning Strikes Thrice: Breaking Thunderbolt 3 Security

Björn Ruytenberg Eindhoven University of Technology
@0Xiphorus · bjornweb.nl

#BHUSA @BLACKHATEVENTS

Björn Ruytenberg @0Xiphorus

Who Am I

Vulnerability researcher Main interests: hardware and firmware security, sandboxing, input validation More about me: https://bjornweb.nl

MSc student in Computer Science @ TUE
· This work part of master's thesis
2

PCI Express Basics ­ Quick Review
· A standardized interconnect for attaching hardware devices in a computer system
· Designed as CPU-architecture agnostic, internal I/O interconnect for low-latency, high-bandwidth
· Intended to overcome limitations of PCI, most notably:
· Scalability: per-device configurable bandwidth, flexible link width
· Networking: moves from bus to packet switching; allows for more flexible topology, QoS / congestion control
· Network topology: root complex, switch, endpoints, PCIe to legacy bridge (e.g. ISA/PCI/PCI-X)
· Direct Memory Access (DMA) primary CPUperipheral mode of transport
3

Thunderbolt: A PCIe-based Interconnect
· High-performance, proprietary I/O protocol developed by Intel and Apple · PCIe-based, Direct Memory Access (DMA)-enabled I/O · Use cases
· External graphics, docking stations, 5K monitors, high-speed external storage, peer-to-peer networking
· Thunderbolt 1 (2011) and 2 (2013) mostly exclusive to Macs
· Mini-DisplayPort form factor ­ multiplexes TB, native DP
· Thunderbolt 3 (2015) first version to be widely adopted
· USB-C form factor ­ multiplexes TB, native DP and/or USB-C
4

DMA attacks
· Thunderbolt 1: no protection against physical attacks
· Plug in malicious device  Unrestricted R/W memory access (DMA)
· Access data from encrypted drives · Persistent access possible, by e.g.
installing rootkit
5

DMA attacks (selected)
· Owned by an iPod [Dornseif 2004]
· First research to demonstrate practical DMA attack · Malicious FW device presents Serial Bus Protocol 2 (SPB-2) endpoint, which triggers host controller to allocate DMA channel for fast bulk
data transfers · Several authors release exploitation tools [Boileau 2006] [Plegdon 2007] · Improved upon for memory forensics [Witherden 2010] · "Improved upon" in law enforcement spyware such as FinFireWire [Gamma 2011]
· Subverting Windows 7 x64 kernel with DMA attacks [Aumaitre 2009]
· First PCI-based attack through custom PCI device with DMA engine
· Inception [Maartmann-Moe 2014]
· Improves upon Witherden's libforensic1394 by presenting virtual SBP-2 interface through ExpressCard, FW device + TB-to-FW adapter · PCILeech [Frisk 2016]
· Native PCIe attack · DMA attack using FPGA with PCIe PHY (full size, ExpressCard, miniPCIe, M.2-NVMe), optionally tunneled through Thunderbolt enclosure · Improved later with various functionality: e.g. dumping FDE keys, dumping UEFI memory regions, patching Windows lock screen process
· Thunderclap [Markettos et al. 2019]
· Replaces PCIe endpoint in TB device with malicious one, then performs DMA attack · Does not break Security Levels access control, but relies on tricking user into authorizing malicious device
6

Threat Model
· Brief physical access to victim system, aka "evil maid attack" · Example real-world scenarios:
· Laptop locked or set to sleep; left unattended in hotel room, while victim is out for dinner
· Desktop systems locked or set to sleep; left unattended outside office hours · Cleaning crew has unfettered access
7

Threat Model
Industry measures against opportunistic physical access
1. BIOS access control 2. Secure Boot 3. Boot Guard 4. Full Disk Encryption ...
8

Threat Model
Industry measures against opportunistic physical access
1. BIOS access control
· Prevents unauthorized modification of system settings
· E.g. require password on entering BIOS
9

Threat Model
Industry measures against opportunistic physical access
1. BIOS access control 2. Secure Boot
· Protects against malicious, unsigned code early in boot process
· Cryptographically verify boot chain: OS bootloader, kernel, drivers
10

Threat Model
Industry measures against opportunistic physical access
1. BIOS access control 2. Secure Boot 3. Boot Guard
· Protects against malicious firmware implants · Cryptographically verifies BIOS integrity
11

Threat Model
Industry measures against opportunistic physical access
1. BIOS access control 2. Secure Boot 3. Boot Guard 4. Full Disk Encryption
· Protects against physical data extraction · Encrypts user data + OS root (depending on FDE config)
12

Threat Model
Industry measures against opportunistic physical access
1. BIOS access control 2. Secure Boot 3. Boot Guard 4. Full Disk Encryption 5. Thunderbolt Security Levels
13

Thunderbolt Security Architecture
· Security Levels ­ access control system enabling users to authorize trusted device only
· Introduced in Thunderbolt 2 · No authorization = No PCIe tunneling
14

Thunderbolt Security Architecture
Thunderbolt devices authenticate to the host using the following metadata: · Device ID: 16-bit device identifier · Device name: ASCII string · Vendor ID: 16-bit vendor identifier · Vendor name: ASCII string · Universally Unique Identifier (UUID): 64-bit number uniquely identifying device, fused in
silicon
15
Source: Thunderbolt 3 and Security on Microsoft Windows 10 Operating System ­ Intel Corporation

Thunderbolt Security Levels

SL0 None SL1 User
SL2 Secure

Definition · No security (legacy mode)
· Device authorization ACL based on UUID · UUID fused in silicon · Default setting on all PCs · Device authorization based on UUID (SL1), plus · Cryptographic device authentication (challenge-response)

SL3 No PCIe tunneling
SL4 Disable daisy-
chaining

· Disable all Thunderbolt connectivity · USB and/or DisplayPort tunneling only
Terminate PCIe tunneling at first TB device
(some Titan Ridge controllers only)

Pre-boot PCIe tunneling enabled only if Thunderbolt device previously protection authorized by user

Security Levels prevent malicious TB devices from accessing PCIe domain, thereby protecting against:
· Device-to-host DMA attacks · Device-to-device (P2P) DMA attacks · PCI ID spoofing to target vulnerable device
drivers · TLP source ID spoofing

Source: Thunderbolt 3 and Security on Microsoft Windows 10 Operating System ­ Intel Corporation

16

Introduction to Thunderspy
· Previous research:
· Before Security Levels: attacks primarily focus on PCIe-level DMA attacks to compromise Thunderbolt security
· After Security Levels: attacks require cooperation of user, i.e. inadvertently connecting malicious peripherals
· Thunderspy is a new class of vulnerabilities that breaks Thunderbolt protocol security
· First attack on Thunderbolt Security Levels · 7 vulnerabilities and 9 practical exploitation scenarios
17

Identifying attack surfaces
· Thunderbolt is a proprietary standard · Protocol specifications not publicly documented · Hardware architecture not publicly documented · Dissected various Thunderbolt devices and Thunderbolt-equipped
systems
18

Our Analysis of TB Hardware Architecture
19

Identifying attack surfaces
· Thunderbolt is a proprietary standard · Protocol specifications not publicly documented · Hardware architecture not publicly documented · Dissected various Thunderbolt devices and Thunderbolt-equipped
systems
20

Thunderbolt Devices
21

NetStor Thunderbolt NVMe Enclosure

Intel JHL6540 TB 3 host/device controller 4-channel, dual port
2* TPS65983 USB Type-C PD Controller Power Switch High-speed Multiplexer

MX25R8035F 8 Mbit SPI Flash

I2C

JTAG ?

22

NetStor Thunderbolt NVMe Enclosure

Intel JHL6540 TB 3 host/device controller 4-channel, dual port
2* TPS65983 USB Type-C PD Controller Power Switch High-speed Multiplexer

MX25R8035F 8 Mbit SPI Flash

I2C

 JTAG ?

23

Intel JHL6540 Thunderbolt Controller
· 4 channel, dual-port Thunderbolt 3 controller · Up to 20 Gbit per channel · Supports Host and Endpoint mode · "Alpine Ridge" generation:
· DisplayPort 1.2 · Integrated HDMI 2.0 LSPcon · USB 3.1 passthrough · USB-PD + 100W charging
· BGA package · No public datasheets · Not much we can do without more invasive techniques
24

TPS65983 USB-PD Controller
25

TPS65983 USB-PD Controller
TPS FW identifier FW hash and build date
Current operational state
26

Din SCK !RST Vcc

Macronix MX25R8035F
27

C S Dout !WP GND

Thunderbolt 3 Controller Firmware

· Device ROM stores Thunderbolt device identity

· Device name

· Vendor name

· Device ID

· Vendor ID

· UUID? Yes, but only 2 out of 8 bytes
28

Thunderbolt 3 Controller Firmware

· Embedded in firmware · Public key (fingerprint likely stored in silicon) · Signed digest

· Device ROM stores Thunderbolt device identity

· Device name

· Vendor name

· Device ID

· Vendor ID

· What is covered by the signature?

· UUID (partial)
29

Thunderspy: Vulnerability 1 + 2
· What is covered by the signature? · Not the DROM...
· Vulnerability 1: Inadequate firmware verification schemes · Firmware authenticated when updating from host, but not adequately upon connecting device, during boot, or resuming from sleep · Signature verification does not cover Thunderbolt device identity
· Vulnerability 2: Weak device authentication scheme · None of the identifiers linked to Thunderbolt PHY or each other, cryptographically or otherwise · E.g. can spoof arbitrary vendor ID that doesn't match vendor name
30

Thunderbolt 3 Controller Firmware

Statement inaccurate, but interesting emphasis on TB3

Source: Thunderbolt 3 and Security on Microsoft Windows 10 Operating System ­ Intel Corporation

31

Thunderbolt 2 Controller Firmware
· UUID stored in plaintext, not covered by any signatures
32

Thunderbolt 2 Controller Firmware
· UUID stored in plaintext, not covered by any signatures
· TB2 device can spoof TB3 devices · Device identified as previously
authorized = profit!
33

Thunderspy: Vulnerability 3 + 4
· Vulnerability 3: Use of unauthenticated device metadata
· DROM not cryptographically verified · When combined with vulnerability 1 + 2, enables arbitrary identities and
cloning user-authorized devices
· Vulnerability 4: Downgrade attack
· Backwards compatibility with subjects Thunderbolt 3 systems to vulnerability introduced by Thunderbolt 2 hardware
· Exploitation scenarios
· 3.1.1 ­ 3.1.3: Cloning victim devices with and without physical device access · Demonstrates spoofing victim device identity on arbitrary attacker device
34

Jump address
· Host mode: 0x00 *
· EP mode: 0x4000
Secure key dictionary
· Maps 8-byte host UUID to 32-byte key
PHY config
· PtoSPtoQWake · EE_CIO

Device Controller Firmware Outline
PHY config (continued)
· EE_PCIE · EE_DMA · EE_USB_PA / PB · EE_PCIE_PHI · EE_DP · PATCHES · DP_IN_UCODE ·...

DROM (0x4000)
· Device identity

"RSA+EXP" public key
Signed digest
TPS USB-PD FW

*Offset varies by controller model, FW revision, and presence of secure key dictionary

TPS USB-PD FW (continued)
Temporary FW update buffer for host-initiated updates
35

Identifying attack surfaces
· Thunderbolt is a proprietary standard · Protocol specifications not publicly documented · Hardware architecture not publicly documented · Dissected various Thunderbolt devices and Thunderbolt-equipped
systems
36

Thunderbolt-Equipped Systems
· Five vendors, seven generations of systems: Intel, Lenovo, HP, Dell, Apple (2013 ­ 2020)
· Five generations of Thunderbolt controllers: Falcon Ridge (TB2), Alpine Ridge-2015, Alpine Ridge-2016, Titan Ridge, Ice Lake (TB3)
37

RAM
WiFi
Winbond W25Q128V (BIOS)
Battery

Lenovo ThinkPad P1 (2019)

Intel JHL7540 TB3 host controller 4-channel, dual port
(other side)
TPS65982 USB-PD
(other side)
Winbond W25Q80.V TB3 host controller FW
NVMe storage

38

Host Controller: Key Questions
· UEFI enables user switching Thunderbolt Security Levels
· DXE programs TB controller upon setting SL, so UEFI stores SL state?
· SL1+2 require storing device UUIDs
· Device ACL?
39

Jump address
· Host mode: 0x00 *
· EP mode: 0x4000
No secure key dictionary
(stored on OS disk; pre-boot auth appears based on UUID only)
PHY config
· PtoSPtoQWake · EE_CIO

Host Controller Firmware Outline

Device ACL (UUIDs)
Host Security Level configuration
DROM (0x4000)
· Host identity

PHY config (continued)
· EE_PCIE · EE_DMA · EE_USB_PA / PB · EE_PCIE_PHI · EE_DP · PATCHES · DP_IN_UCODE ·...
"RSA+EXP" public key Signed digest TPS USB-PD FW

*Offset varies by controller model, FW revision, and currently active Security Level

TPS USB-PD FW (continued)
Temporary FW update buffer for host-initiated updates
40

Thunderspy: vulnerability 5
· Vulnerability 5: Use of unauthenticated controller configurations
· Two state machines: UEFI and host controller FW maintain SL state · Host controller FW overrides UEFI state · FW signature does not cover security configuration
· Exploitation scenario
· 3.2.1: Disabling Thunderbolt security (SL1/SL2), or restoring Thunderbolt connectivity when disabled (SL3)
· Demonstrates attacking host controller firmware: patch SL to 0 (no security) · Works against every Security Level · Enables restoring TB connectivity, even user disabled it (SL3)
41

SPI Flash: Write Protection

Special order, yet some

TB controller flash samples

appear to ship support

42

Thunderspy: vulnerability 6
· Vulnerability 6: SPI flash interface deficiencies
· Host controller FW maintains SL state (vulnerability 5) · SPI flash write protection allows preventing user to change SL
· On supported flash, irrevocable OTP write protection turns it into ROM
· Exploitation scenarios
· 3.3.1 ­ 3.1.3: Rendering SL0 permanent and blocking future firmware updates · Demonstrates ability to patch SL to 0 (vuln 5), then render it permanent (vuln 6) · Shown in demo 1
43

Summary: Thunderspy Attack Methods (selected)

Attack method 1
Exploitation scenarios: 3.2.1, 3.3.1, 3.3.2, 3.3.3

Attack Thunderbolt host controller firmware to disable Thunderbolt security. System will accept any arbitrary attacker devices. · Requires brief access to laptop (~ 5 min) and reprogramming host controller firmware · Does not require access to victim's Thunderbolt devices

Attack method 2
Exploitation scenarios: 3.1.1, 3.1.3

Clone user-authorized Thunderbolt device identity to an arbitrary attacker device. System will accept attacker device as being legitimate, user-authorized device. · Does not require reprogramming host controller firmware · Requires brief access to one of victim's Thunderbolt devices (~ 5 min)

Impact (both)

· Unrestricted read and write access to system memory (DMA) · Access data from encrypted drives · Persistent access possible, by e.g. (i) exploiting Thunderspy vulnerability 6, or (ii) installing
rootkit to ensure continued access without requiring Thunderspy

For additional exploitation scenarios, please refer to the vulnerability report.

44

Demo ­ Unlocking Windows PC in 5 minutes using attack method 1
Edited to fit Black Hat session. Please refer to our YouTube recording for the complete real-time footage.
45

Thunderbolt Security Levels ­ Revisited

SL0 None SL1 User
SL2 Secure

Definition · No security (legacy mode)
· Device authorization ACL based on UUID · UUID fused in silicon · Default setting on all PCs · Device authorization based on UUID (SL1), plus · Cryptographic device authentication (challenge-response)

SL3 No PCIe tunneling
SL4 Disable daisy-
chaining

· Disable all Thunderbolt connectivity · USB and/or DisplayPort tunneling only
Terminate PCIe tunneling at first TB device
(some Titan Ridge controllers only)

Pre-boot PCIe tunneling enabled only if Thunderbolt device previously protection authorized by user

46

Thunderbolt Security Levels ­ Revisited

SL0 None SL1 User
SL2 Secure

Definition · No security (legacy mode)
· Device authorization ACL based on UUID · UUID fused in silicon · Default setting on all PCs · Device authorization based on UUID (SL1), plus · Cryptographic device authentication (challenge-response)

SL3 No PCIe tunneling
SL4 Disable daisy-
chaining

· Disable all Thunderbolt connectivity · USB and/or DisplayPort tunneling only
Terminate PCIe tunneling at first TB device
(some Titan Ridge controllers only)

Pre-boot PCIe tunneling enabled only if Thunderbolt device previously protection authorized by user

What we found it to mean
· UUID not so unique ­ can be spoofed · UUID not fused in silicon
Keys stored in plaintext on device SPI flash ­ can be cloned ...until the attacker reprograms the controller firmware to SL0 (no security)
To connect malicious device, simply unplug existing device or pick another TB port
All security levels broken, so has no effect

47

Thunderspy PoC Tools
Thunderbolt Controller Firmware Patcher
https://github.com/BjornRuytenberg/tcfp
48

Thunderspy PoC Tools
SPIblock
https://github.com/BjornRuytenberg/spiblock
49

Thunderspy: Affected systems
· All Thunderbolt-equipped systems shipped between 2011-2020
· All PCs released between 2011-2018 fully vulnerable · All Macs running Windows and Linux (Boot Camp) fully vulnerable · Some systems providing Kernel DMA Protection, shipping since 2019, partially
vulnerable: https://thunderspy.io/#kernel-dma-protection · MacOS partially vulnerable: https://thunderspy.io/#affected-apple-systems
· Spycheck
· Free and open-source tool to determine if your system is vulnerable: https://thunderspy.io
· Alternatively, follow manual verification steps on website
50

Thunderspy: Intel's response
Kernel DMA Protection
· Intel-suggested mitigation to Thunderspy · Opt-in DMA remapping for Thunderbolt devices · Requires Windows 10 >= 1803, Linux kernel >= 5.0
51

Device-to-Host DMA
52

Device-to-Host DMA with IOMMU
53

Thunderspy: Intel's response
Kernel DMA Protection
· Intel-suggested mitigation to Thunderspy · Opt-in DMA remapping for Thunderbolt devices · Requires Windows 10 >= 1803, Linux kernel >= 5.0
However,
· Partial mitigation only
· Mitigates only vulnerabilities 4-6 · Prevents impact via DMA, but remaining vulnerabilities 1-3 expose system to BadUSB-style
attacks
· Requires IOMMU and UEFI (BIOS) support · UEFI support exclusively available on some >= 2019 systems · Not available on systems < 2019
54

Thunderspy 2
· All Thunderbolt-equipped systems released 2011-2018, and several >= 2019, remain unpatched against Thunderspy
· Starting with Haswell (2013), a lot of Intel consumer systems feature an IOMMU, thus technically capable of supporting DMA remapping
· Thunderspy 2: OS-agnostic ACPI table upgrade patch
· Brings Kernel DMA Protection to roughly 6 years worth of systems
· Includes Thunderbolt 2!
· Experimental OS-agnostic UEFI extension
· Works with Windows 10 1803+ and Linux kernel 5.0+ · Note: ACPI patching could also be turned into attack, i.e. disabling Kernel DMA Protection on
supported systems. Recommended to self-sign TS2 extension and use measured boot (next slide)
· Protection level similar to officially supported systems at OS runtime
· Does not protect against boot time attacks, but screenlocking + sleep mode are covered 
55

Thunderspy 2: Mitigations on Linux
· We are working with the Linux kernel hardware security team to develop kernel-level mitigations
· Work around ACPI to enable Kernel DMA Protection on unsupported Thunderbolt systems
· Meanwhile, Linux users can use TS2 UEFI extension
· Secure Boot: sign using your own keys · Combine with measured boot (e.g. TPM-enabled GRUB) for additional
security
56

Demo 2 ­ Kernel DMA Protection patched onto unsupported machine
57

What's Next?
The future of Thunderbolt-based interconnects · What issues currently remain unaddressed?
1. Thunderspy vulnerabilities 1­3: No means to distinguish between forged and legitimate DROMs. Devices that look legitimate physically could still be malicious.
2. Narrow scope of Kernel DMA Protection vs. Security Levels: Enables PCIe tunneling without user interaction. Does not protect against malicious devices that
· spoof arbitrary PCI IDs to target vulnerable device drivers · spoof TLP source IDs to hijack transactions
· How may these issues affect USB 4 and Thunderbolt 4?
· To mitigate Thunderspy, Thunderbolt 4 now requires Kernel DMA Protection as part of vendor product certification
· Backwards compatibility likely means susceptibility to (1), while (2) remains unaddressed
58

What's Next?
The future of Thunderbolt-based interconnects · What are potential avenues on mitigating these remaining issues?
· Thunderspy vulnerabilities 1­3:
Firmware embeds public key + digest; may allow to verify authenticity on host (driver, DXE) if Intel publishes digest scope
· Narrow scope of Kernel DMA Protection vs. Security Levels:
(1) Allow all DMA devices on boot. OS runtime: initially, "null-route" all new DMA devices using IOMMU. Require screen unlocking and explicit user authorization, then have IOMMU assign I/O memory range. (2) Virtualization-based security (VBS) may help prevent kernel memory safety issues (3) TB controller-assisted TLP source ID verification (similar to PCIe ACS)
· USB 4:
Implement UEFI toggle that controls Thunderbolt signaling (... and maintain state in UEFI only, please!)
59

Takeaway
· Thunderspy: a new class of vulnerabilities breaking Thunderbolt security
· No fix from Intel for vulnerable systems released in 2011-2020; Kernel DMA Protection available only on some >= 2019 systems
· Check if your system is vulnerable ­ use Spycheck or verify manually · Full vulnerability report: https://thunderspy.io
· Thunderspy 2: experimental, OS-agnostic mitigation to Thunderspy
· Brings Kernel DMA Protection to all vulnerable systems with IOMMU
· The future is PCI Express
· Thunderbolt is a powerful external interconnect enabling high-bandwidth, lowlatency use cases previously not possible
· USB 4 and Thunderbolt 4 upcoming, but adequate protection schemes remain absent (for now?)
60

Questions?
Björn Ruytenberg
@0Xiphorus https://bjornweb.nl

Thank You

61

