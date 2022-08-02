#BHUSA @BLACKHATEVENTS

Security Research on Mercedes-Benz: From Hardware to Car Control

Minrui Yan, Jiahao Li 360 Group

Guy Harpak Daimler AG

#BHUSA @BLACKHATEVENTS

Security Research on Mercedes-Benz
Defending a Luxury Fleet

Guy Harpak, Mercedes-Benz R&D Tel-Aviv

Minrui Yan, 360 Group

Jiahao Li, 360 Group

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC

Who We Are
· Skyo-Go Team is a security research team established in 2014 · Focus on Connected Cars, Industry Security · 75% market share on Cybersecurity of Connected Cars in China · Notable Researches
· 2014 Tesla & BYD Connectivity Functionality · 2016 Tesla Autopilot System · 2017 CAN-Pick (CAN-Bus evaluation platform, published in Black Hat USA 2017) · 2018 VADS (Vehicle Active Defense System for CAN-bus) · 2019 Mercedes-Benz: From Hardware to Control

#BHUSA @BLACKHATEVENTS

Timeline
· July 16, 2018: Start Reverse Engineering on Mercedes-Benz Cars (360) · Aug 21, 2019: The findings reported to Daimler (360) · Aug 23, 2019: The services shutdown: preventing further effect on MB cars (Mercedes-Benz) · Aug 26, 2019: Initial fix (Mercedes-Benz) · Sep 12, 2019: All access vulnerabilities fixed (Mercedes-Benz) · Oct 23, 2019: Joint workshop (360 & Mercedes-Benz) · Aug 06, 2020: Black Hat USA Publication (360 & Mercedes-Benz)
#BHUSA @BLACKHATEVENTS

Result of Our Research
· Impact all Mercedes-Benz connected cars in China over 2 millions. · Get access to invoke remote service to control the car, like control the doors, lights,
windows, engines without physical access.
#BHUSA @BLACKHATEVENTS

Agenda
· Build Testbench · HERMES Jailbreak · Way to Car Control · Summary from Sky-Go · Incident Response · Summary from Mercedes-Benz

#BHUSA @BLACKHATEVENTS

Build Testbench
#BHUSA @BLACKHATEVENTS

Key components
· HERMES (a.k.a. TCU) · Head-Unit (a.k.a. IVI)

#BHUSA @BLACKHATEVENTS

Test devices ­ HERMES
#BHUSA @BLACKHATEVENTS

Test devices ­ Head-Unit
#BHUSA @BLACKHATEVENTS

Testbench on Table

#BHUSA @BLACKHATEVENTS

Against with the anti-theft
· Varieties of anti-theft warning. · Our goal is to start the Head-Unit.

Copy-protection Warning

Anti-theft protection, please restart

Anti-theft protection

#BHUSA @BLACKHATEVENTS

Against with the anti-theft
· Ask your dealer to remove the anti-theft lock. · You need
· Service fee each time $100 · Reservation · Time

Xentry + SD Connect
#BHUSA @BLACKHATEVENTS

Against with the anti-theft
· Backup the SD-card. · Using CAN-bus toolkit to find out the anti-theft
trigger message.
Heart beats

HU (WinCE 7 Automotive
ARM)

CAN Pick Filter
CAN-HMI 500k

CAN Pick Filter
CAN-A 250k

Instrument Cluster (QNX)

Control Pa nel (Touch Pad)

CAN-bus MITM Diagram

#BHUSA @BLACKHATEVENTS

Attack Vector Analysis
· HeadUnit
· Windows CE Automotive 7 is so hard
Windows CE Automotive System Architecture

#BHUSA @BLACKHATEVENTS

Attack Vector Analysis
· Head-Unit
· Windows CE Automotive 7 is so hard
Executable files in Head Unit

#BHUSA @BLACKHATEVENTS

Attack Vector Analysis
· Head-Unit
· Windows CE Automotive 7 is so hard · Without source code · Without debug environment
Kernel file

#BHUSA @BLACKHATEVENTS

Attack Vector Analysis
· Head-Unit
· Windows CE Automotive 7 is so hard · Without source code · Without debug environment
· OBD (EZS, CAN-D)
· Physical access · The FBS4 can't be attack yet.(Maybe with key-fob relay) · Upgrade package has signature protection.

#BHUSA @BLACKHATEVENTS

Attack Vector Analysis
· Head-Unit
· Windows CE Automotive 7 is so hard · Without source code · Without debug environment
· OBD (EZS, CAN-D)
· Physical access · The FBS4 can't be attack yet.(Maybe with key-fob relay) · Upgrade package has signature protection.
· HERMES
· Embedded Linux · Telematics

#BHUSA @BLACKHATEVENTS

Attack Vector Analysis
· Head-Unit
· Windows CE Automotive 7 is so hard · Without source code · Without debug environment
· OBD (EZS, CAN-D)
· Physical access · The FBS4 can't be attack yet.(Maybe with key-fob relay) · Upgrade package has signature protection.
· HERMES
· Embedded Linux · Telematics · 4G attacking is useless for it

#BHUSA @BLACKHATEVENTS

HERMES Jailbreak
#BHUSA @BLACKHATEVENTS

HERMES Version Design Comparison
· HERMES 1
· USB Cable · ME909Tu LTE · MU809Tu UTMS
· HERMES 1.5
· ME919bs
· HERMES 2.1
· ME919bs
#BHUSA @BLACKHATEVENTS

Finding Peripheral Interfaces

· UART

E-SIM

· USB NAD · JTAG (reversed)

WLAN & BT SDIO Module

Cellular Module

UART

MCU

LIN-Transc
CANTransc
Power

Debug Port

HERMES Components Block Diagram

#BHUSA @BLACKHATEVENTS

Way to Car Control
#BHUSA @BLACKHATEVENTS

Finding Peripheral Interfaces
· The packaging is LGA, it's hard to teardown.
· To check out the debug interfaces pinout.
· Multimeter · Flashlight · X-Ray

#BHUSA @BLACKHATEVENTS

UART Debug Port
· APN Configurations (Only activated TCU) · TSP Back-end configurations.

APN initialization log

Back-end requests log

#BHUSA @BLACKHATEVENTS

USB Mode Switching
· AT^SETMODE is default ECM
· AT^SETMODE=3 for RNDIS ADB · ttyUSB0 Application · ttyUSB1 PCUI · ttyUSB2 serialB · ttyUSB3 serial

USB log

6 Interfaces in Windows Device MGMT

#BHUSA @BLACKHATEVENTS

USB Debug Mode
· To obtain APN configurations.
· AT^GODLOAD for upgrading flash the filesystem
· Disable the watchdog first · Repackage the firmware

PDP Context Configuration

#BHUSA @BLACKHATEVENTS

On-Chip Debugging
· We can't enter the Qualcomm EDL mode to read firmware. So we try the OCD.
· Use the OpenOCD with FT2232 to operate the debug interface
· Disable the watchdog · Reverse analyze the NAND Controller Driver (Or use QDLoader)

Connect JTAG pin to FT2232

OpenOCD break point

#BHUSA @BLACKHATEVENTS

Dumping NAND flash
· The Cellular Module has an eMCP NAND

Old Cellular Module

New Cellular Module

#BHUSA @BLACKHATEVENTS

Dumping NAND flash
· Tear down the flash chip with BGA rework station

400  Hotair with Infrared Heating

Qualcomm eMCP

Hisilicon eMCP
#BHUSA @BLACKHATEVENTS

Raw NAND Pinout
· The eMCP flash on old cellular module is the BGA 137 footprint. · 6-ways Control pins & 8-bit Data I/O pins

BGA 137 Pin-Assignment

Wiring up with magnet wire

#BHUSA @BLACKHATEVENTS

Dumping Firmware with BGA Socket
· We made some sockets and adaptors for these NAND Flash. · The socket and adapter are separate designs.

Full pinout adaptor

BGA Socket

#BHUSA @BLACKHATEVENTS

Reading NAND Flash Data
· 2048-Bytes Data + 64-bytes Spare Area · The NAND chip size is 512MB

NAND Array Organization

PROMAN NAND reader

#BHUSA @BLACKHATEVENTS

Finding Spare Area
· The NAND user manual has suggestions for spare area mapping. · In general, the spare area mapping always defined by NAND drivers.

Spare area mapping (x8)

#BHUSA @BLACKHATEVENTS

Finding Spare Area
· Two ways to find spare area
· Checking the source code: /drivers/mtd/nand/qcom_nandc.c
#BHUSA @BLACKHATEVENTS

Finding Spare Area
· Two ways to find spare area
· Checking the source code: /drivers/mtd/nand/qcom_nandc.c · Comparing NAND pages

Offset += 0x840h (2048 + 64 bytes)

The Nst page The Nst+1 page

#BHUSA @BLACKHATEVENTS

Removing Spare Area
· The spare area are 64-bytes in one page. · One page has 4 sub-pages. Each sub-page has one ECC area. · In general, spare area doesn't include the data zone.
#BHUSA @BLACKHATEVENTS

Finding Partition Tables
· For the Qualcomm modems, the partition tables start with special magic: 0xaa73ee55 or 0x9a1b7daa.
Magic Partition name
#BHUSA @BLACKHATEVENTS

Partition Table Analysis
· The partition table called `MIBIB' · The bootloader file type is `Android bootimg' · The system partition is YAFFS
· Redundancy partition for upgrading · Multilevel bootloader for secure boot

#BHUSA @BLACKHATEVENTS

Removing Spare Area
· The same as Hisilicon cellular module NAND flash. · The bootloader prints the partition layout when power on. · The HISI development kit (DVK) partitions are the same as the HERMES.

DVK boot log

#BHUSA @BLACKHATEVENTS

Removing Spare Area
· The partition table start with `pTableHead' in the NAND dump. · The structure is defined in /drivers/mtd/nand/ptable/ptable_def.h

pTableHead Structure

#BHUSA @BLACKHATEVENTS

Partition Table Analysis
· We can parse the partition table with python. J
· Balong V7R22 Telematic · It's similar with V7R22 4G Router (4PDA.ru) · Redundant Partitions · The key partition is YAFFS, too.

#BHUSA @BLACKHATEVENTS

Remapping YAFFS Logical Block
· The file system of user zone and system zone is YAFFS. · Because of the Wear-Leveling, the block is not sequential. The block mapping
info is in the OOB area. So we can't mount the file-system directly. We made a tool to operate the file system.
Extract files from YAFFS partition
#BHUSA @BLACKHATEVENTS

Filesystem Extraction
· We extracted files from NAND flash. · The OEM apps located at /cust/app/bin

#BHUSA @BLACKHATEVENTS

Bit-Flipping Error
· The bit-flipping is a NAND Flash features. If the key jump instructions are affected by bit-flipping, our research may have headed in a wrong direction.
After  Aftar 0b1100101  0b1100001
#BHUSA @BLACKHATEVENTS

Error Bit Correction
· To fixed the bit flipping, we need to correct the bits by ECC. · Different NAND has different ECC algorithm

ECC definition in driver code

#BHUSA @BLACKHATEVENTS

Generating ECC
· The NAND controller using the hardware ECC, so the Linux driver source code dosen't include ECC implementation.
· The SoC SDK including the ECC algorithm. · 2k + 64-bytes: ecc_4bit

ECC Polynomial codewords

#BHUSA @BLACKHATEVENTS

Final Works
· The NAND file we generated is the same as we dumped. · No secure boot. We can
· put a backdoor in it. · modify the system service to open a debug shell.

0x400-bytes

14-bytes 0x3E2-bytes

2-bytes 14-bytes 0x32-bytes 14-bytes

Data Part 1

ECC

Data Part 2

Bad Block Flag

Data Part 2

Reversed

ECC

For YAFFS OOB

Reballing
#BHUSA @BLACKHATEVENTS

Future Works
· Access the HERMES remotely.
· For debugging purpose
· EngineerMode application.
· Send CAN message with internal service · The data handled by SH-2A MCU
· Patch the MCU Firmware. (Difficulty: Nightmare)
· Firmware analyzation. · Functional Verification. · It's hard to buy a Renesas DVK · The chipset is the SH-2A

MCU log
#BHUSA @BLACKHATEVENTS

Access Back-end via eSIM
· We configured the APN, wiring up the eSIM to SIM Extender. · DON'T insert it to your 4G device right away.

APN name

Wiring up to eSIM
#BHUSA @BLACKHATEVENTS

Access Back-end via eSIM
· The trigger when detecting an IMEI change event, it will freeze the account.
· So we must change the IMEI as the same as the TCU, you need
· 4G module DVK, it's unlocked. · Modified 4G routers (E5885L). · An MTK mobile device.

Hisilicon DVK

#BHUSA @BLACKHATEVENTS

Access Back-end via eSIM
· We change the IMEI and used new eSIM from another HERMES

Teardown eSIM

#BHUSA @BLACKHATEVENTS

Access Back-end via eSIM
· We got an intranet IPv4 address. · The intranet is isolated.
#BHUSA @BLACKHATEVENTS

Access Back-end via eSIM
· The eSIM account is run out of credit, but it still can access to provider's mobile shop.
· It doesn't forbid us to access the TSP.
#BHUSA @BLACKHATEVENTS

Finding domains
· The domain is corpinter, so we scan the domains from these files · It's helpful for the penetration test.

Associations between keyword and files

#BHUSA @BLACKHATEVENTS

PFX Password Decryption
· The PFX file loaded by certificate management service · InfrastructureProcess connects to the backend
Analyzing file references in graph
#BHUSA @BLACKHATEVENTS

Certificates
· The scanner reported that some public/private keys and certificates.
· But the scanner cannot decrypt the PFX file, we found these files manually including pkcs12 client certificates, encrypted passwords and CA certificates for the car backend server.

Certificates, passwords and keypairs

#BHUSA @BLACKHATEVENTS

PFX Password Decryption
· HERMES client inits with PFX file and passwd file.
· There are three regions certificates.
· INIT-006xxx1 · INIT-00xxxx1 · INIT-00xxxx8

Persistency files

#BHUSA @BLACKHATEVENTS

PFX Password Decryption
· /****/***/lib/libimp_broadband_common.so provides crypto implement. · AES256 Key is hardcoded.

IV and AES key

#BHUSA @BLACKHATEVENTS

PFX Password Decryption
· We can load these certificates into browser, they didn't expire. · The certificate name 0060001 is used for the China market.

Available client certificates

#BHUSA @BLACKHATEVENTS

Social Plugin SSRF
· You can bind your social media account with VIN in Head-Unit. · The avatar URL is return to user from social media backend. · We can modify the URL and submit it to TSP backend.

HeadUnit plugin page

The car is bind with my account
#BHUSA @BLACKHATEVENTS

Social Plugin SSRF
The plugin service will load any URL we want to access.

HU Browser URL

Web Proxy

Fetch Access

Social Media
Local Files in
TSP

System file leaks

#BHUSA @BLACKHATEVENTS

Telematics Data Stream

ATP: Advanced Telematics Protocol

· Support SMS channel, TCP channel

Mercedes-Me

Back-end

HERMES

· Mutual TLS (TCP)

· Support Encryption · Unique key-pairs

Unlock door

Wake-Up

· Dynamic key/IV

Result

Request new shared-key Update the shared-key ATP Command with special HMAC
Response

Car control data stream

#BHUSA @BLACKHATEVENTS

SMS Communication

· Disconnect the TCU network, change the platform number to my phone number

· We can communicate with the TCU by using mobile phone.

· BUT it's secure. The algorithms are hmacSHA256 + AES256, we can't modify it or replay it.

char

msg_len[3]

char

security_flag

char

digest_algorithm

char

digest_len

char

digest_position[digest_len]

char

message_type[2] // 02 AES256CFB HMAC SHA256

1-byte unknown

char

application_id[2] // 06 door 2b sigpos

19-bytes unknown

char

vin_length

#BHUSA @BLACKHATEVENTS

Control Data Stream

· Car owners login Mercedes-Me from APP. Mercedes-Me

Back-end

HERMES

· The Back-end server didn't authenticate the requests from Mercedes-Me.
· Once we get the access to back-end, we can control any car in China.

Unlock door Result

Wake-Up
Request new shared-key Update the shared-key ATP Command with special HMAC
Response

Car control data stream

#BHUSA @BLACKHATEVENTS

Car Control Command
Supported Commands · Door lock/unlock · Roof open/close · Lighting on/off · Car beeping · Engine start/stop (Limited)
· Based on FBS4 · Limited models · Value-added Service

Engine start success
#BHUSA @BLACKHATEVENTS

Summary
· Follow Responsible Disclosure Policy · Attack chain exploited hardware and software vulnerabilities · Key impact: ability to send "remote services" commands (Didn't go too far) · We did see many security considerations in Mercedes-Benz Cars · All access vulnerabilities were promptly fixed together
#BHUSA @BLACKHATEVENTS

FleetSecOps in Action

Immediate Response Actions
· Step 1: Initiate & Analyze · Initiate incident response procedures · Mobilize investigation and response teams · Prioritize response activities
· Step 2: Contain & Fix · Selective blocking of services + immediate fixes · Forensic investigation · Long-term fixes development
· Step 3: Lessons Learned · Deploy long-term fix · Roll-out plan for hardening · Lessons learned exercise

#RSAC

Thank You!

