SESSION ID: HT-W04
Don't Touch That Dial: How Smart Thermostats Have Made Us Vulnerable

Ray Potter
CEO SafeLogic @SafeLogic_Ray

Yier Jin
Assistant Professor University of Central Florida @jinyier

#RSAC

#RSAC
Flow
 The threat is real  Connected convenience comes with risk  Challenges  What's at Stake

#RSAC
What's at Stake
 Pattern recognition  Identity theft  Corporate espionage  Life

#RSAC
Use Cases

#RSAC
Nest Thermostat
 Nest Labs founded by Tony Fadell  Debuted in October 2011  Acquired by Google in January 2014 ($3.2B)  Over 40,000 sold each month
Data from GigaOM as of January 2013
 Available in UK in April 2014  Smart home API is released in June 2014

#RSAC
"Yes, hacking is in our thoughts. When you're talking about the home, these are very private things. We thought about what people could do if they got access to your data. We have bank-level security, we encrypt updates, and we have an internal hacker team testing the security. It's very, very private and it has to be, because it'll never take off if people don't trust it." - Tony Fadell

#RSAC
Nest Hardware

Front Plate
 "Display" board  Graphics/UI, Networking  Chips:
 ARM Cortex A8 app processor  USB OTG  RAM/Flash (2Gb)  ZigBee/WiFi Radios  Proximity Sensors  UART test points (silenced at bootloader)

#RSAC
Courtesy of iFixit

#RSAC
"Backplate" and Comms
 Hooks up to AC/Heating system. Charges battery via engineering wizardry
 Chips:  Independent ARM Cortex M3  Temp and Humidity Sensor
 Communications  Front to Back ­ UART  NEST Weave (802.15.4)  USB MSD (FW update)
Courtesy of iFixit

#RSAC
Nest Software

Nest Client
 Runs on a Linux based platform  Handles interfacing between device
and Nest Cloud services  Automatically handles firmware
updates  Manual update available
 Plug Nest into PC  Handled as a storage device  Copy firmware to drive  Reboot

#RSAC
Nest

#RSAC
Nest Firmware
 Signed firmware   Manifest.plist
 Hashes contents  Manifest.p7s
 Compressed but not encrypted or obfuscated  Includes
­ U-boot image ­ Linux Kernel image ­ File system ­ nlbpfirmware.plist

#RSAC
Things Done the Right WayTM
 Firmware signing using PKCS7  Pinned Nest certificates for firmware verification  All critical communications (any with secrets) over HTTPS
 Other less secure ones over HTTP (firmware, weather)

#RSAC
Things Done the Wrong WayTM
 Firmware links downloaded using HTTP and download links do not expire
 Hardware backdoor left for anyone with a USB port to use  Automatic updates

#RSAC
User Privacy
 Log Files
 Internally stored and uploaded to Nest  Contents
 User Interface
 Users are unaware of the contents of the log files  Users cannot turn off this option
 User network credentials are stored ... in plain text!  Users should be allowed to opt-out of the data collection?

#RSAC
Log Files

#RSAC
Processor and boot

#RSAC
Hardware Analysis
 TI Sitara AM3703
 ARM Cortex-A8 core  Version 7 ISA  JazelleX Java accelerator and media extensions  ARM NEON core SIMD coprocessor
 DMA controller  HS USB controller  General Purpose Memory Controller to handle flash  SDRAM memory scheduler and controller  112KB on-chip ROM (boot code)  64KB on-chip SRAM  Configurable boot options

#RSAC

#RSAC
Boot Process

Root ROM starts execution

ROM initializes basic
subsystems

ROM copies X-Loader to
SRAM

Userland loaded

U-boot executes Linux kernel

U-boot configures environment

X-Loader executes
U-boot executes

X-Loader initializes SDRAM
X-Loader copies U-boot to SDRAM

#RSAC
Boot Process

Root ROM starts execution

ROM initializes basic
subsystems

ROM reads X-Loader from
USB

Userland loaded

U-boot executes Linux kernel

U-boot configures environment

X-Loader executes
U-boot executes

X-Loader initializes SDRAM
X-Loader copies U-boot to SDRAM

#RSAC
Boot Process

Root ROM starts execution

ROM initializes basic
subsystems

ROM reads X-Loader from
USB

Userland loaded

U-boot executes Linux kernel

U-boot configures environment

X-Loader executes
U-boot executes

X-Loader initializes SDRAM
X-Loader copies U-boot to SDRAM

#RSAC
Boot Process

Root ROM starts execution

ROM initializes basic
subsystems

ROM reads X-Loader from
USB

Userland loaded

U-boot executes Linux kernel

U-boot configures environment

X-Loader executes
U-boot executes

X-Loader initializes SDRAM
X-Loader copies U-boot to SDRAM

#RSAC
Boot Process

Root ROM starts execution

ROM initializes basic
subsystems

ROM reads X-Loader from
USB

Userland loaded

U-boot executes Linux kernel

U-boot configures environment

X-Loader executes
U-boot executes

X-Loader initializes SDRAM
X-Loader copies U-boot to SDRAM

#RSAC
Boot Process

Root ROM starts execution

ROM initializes basic
subsystems

ROM reads X-Loader from
USB

Userland loaded

U-boot executes Linux kernel

U-boot configures environment

X-Loader executes
U-boot executes

X-Loader initializes SDRAM
X-Loader copies U-boot to SDRAM

#RSAC
Boot Process

Root ROM starts execution

ROM initializes basic
subsystems

ROM reads X-Loader from
USB

Userland loaded

U-boot executes Linux kernel

U-boot configures environment

X-Loader executes
U-boot executes

X-Loader initializes SDRAM
X-Loader copies U-boot to SDRAM

#RSAC
Boot Process

Root ROM starts execution

ROM initializes basic
subsystems

ROM reads X-Loader from
USB

Userland loaded

U-boot executes Linux kernel

U-boot configures environment

X-Loader executes
U-boot executes

X-Loader initializes SDRAM
X-Loader copies U-boot to SDRAM

#RSAC
Boot Process

Root ROM starts execution

ROM initializes basic
subsystems

ROM reads X-Loader from
USB

Userland loaded

U-boot executes Linux kernel

U-boot configures environment

X-Loader executes
U-boot executes

X-Loader initializes SDRAM
X-Loader copies U-boot to SDRAM

Device Initialization

 Boot Configuration read from sys_boot[5:0]

sys_boot [5:0]
001101 001110 001111
101101 101110 101111

Selected boot configurations

First

Second

Third

XIP

USB

XIPwait

DOC

NAND

USB

UART3 USB
UART3

USB

UART3

MMC1

USB

UART3

MMC1

USB

UART3

MMC1

Fourth
MMC1 UART3 MMC1
XIP XIPwait NAND

#RSAC
Fifth MMC1 DOC

#RSAC
Device Programming
 Boot configuration pins 4..0 are fixed in Nest's hardware  sys_boot[5] is changes based on reset type  Conveniently, circuit board exposes sys_boot[5] on an unpopulated
header...

#RSAC
Nest USB Device Descriptor

#RSAC
TI USB Device Descriptor

#RSAC
Implications
 Full control over the house
 Away detection  Network credentials  Zip Code  Remote exfiltration  Pivoting to other devices

#RSAC
Control over all Nest devices
 Unauthorized ability to access Nest account
 We now have the OAUTH secrets
 Ability to brick the device
 We can modify the NAND
 Persistent malware in NAND
 X-loader bootkit in NAND

#RSAC
The Attack

#RSAC
Attack
 Device Reset
 Press the button for 10 seconds causing sys_boot[5] = 1'b1
 Inject code through the USB into memory and execute
 Be quick!

#RSAC
Initial Attack
 Custom X-Loader to chainload U-Boot + initrd  Custom U-Boot
 Utilize existing kernel  Load our ramdisk (initrd)
 Ramdisk
 Mount Nest's filesystem and write at will  Arbitrary, scriptable, code execution
 Netcat already comes with the Nest

#RSAC
Refining a Backdoor
 Rebuild toolchain  Cross-compile dropbear (SSH server)  Add user accounts and groups  Reset root password

#RSAC
Linux Kernel Modification
 A custom Linux kernel  Custom logo  Debugging capabilities (kgdb)  Polling on OMAP serial ports

#RSAC
Demo

#RSAC
43

#RSAC
Double-Edged Sword
 Positive View
 The backdoor provide legitimate users to opt-out of uploading logs files
 Negative View
 The backdoor may be maliciously exploited
 A Relief to Nest Labs
 The backdoor needs physical access to the device (although remote attack is under investigation)

#RSAC
User Privacy Protection
 Privacy Patch Development
 A patch is developed to protect user privacy  Users can select the data to be sent to Nest Cloud  Firmware upgrade will not cover the patch
 Patch Installation
 Patch is installed through the hardware backdoor  One-button installation  Linux version is read for downloading
45

#RSAC
A Solution ­ Chain of Trust
 Code Authentication
 Processor must authenticate the first stage bootloader before it is run
 Use public key cryptography
 Userland protection  Only execute signed binaries  Filesystem encryption
 Processor-DRAM channel protection

#RSAC
How to Apply This Knowledge
 Identify whether your product shares vulnerabilities with these examples.
 Build security strategy and implement NOW, don't wait.  Explore 3rd party validation and other ways to leverage proven
security measures.  Regardless of form factor, focus on the data.  And of course, as a user, quarantine WiFi access for each of your
IoT devices.
47

