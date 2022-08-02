Wibbly Wobbly, Timey Wimey
What's Really Inside Apple's U1 Chip

Jiska Classen
Secure Mobile Networking Lab - SEEMOO Technical University of Darmstadt, Germany

Alexander Heinrich
Secure Mobile Networking Lab - SEEMOO Technical University of Darmstadt, Germany

Ultra Wideband (UWB) U1 Chip

Nobody knows what it is or does
Non-interceptable with cheap SDRs

Only available in the latest generation of devices

Must be hacker-proof!

UWB Secure Ranging & NLOS Distance Measurement
Strongest path is non line of sight... #?$%!
Line of sight distance <3 meters, open door.

UWB Secure Ranging & NLOS Distance Measurement Somewhat
For more details, see WiSec 2021 paper "Security Analysis of IEEE 802.15.4z/HRP UWB Time-of-Flight Distance Measurement" by Singh et. al.

UWB Features

Nearby Interaction

20"

20"

90º

90º

Find My

UWB to X

UWB Internals

AirDrop
UWB Beaconing +
AirDrop Protocol

AirDrop Bluetooth Discovery

Random non-resolvable

MAC address

05 12 00000000 00000000 01 ac5b d44e a87b dafe 00

AirDrop Length

Zero padding

Version Hash #1 Hash #2 Hash #3 Hash #4

Stute et al. (2019). A Billion Open Interfaces for Eve and Mallory: MitM, DoS, and Tracking Attacks on iOS and macOS Through Apple Wireless Direct Link. Celosia et al. (2020). Discontinued Privacy: Personal Data Leaks in Apple Bluetooth-Low-Energy Continuity Protocol

UWB Bluetooth Discovery

Random resolvable MAC address

0f 05 a0 35 eed4de

Nearby Action Length Action Flags Action Type: Point To Share Authentication tag

Martin et al. (2019). Handoff All Your Privacy ­ A Review of Apple's Bluetooth Low Energy Continuity Protocol Celosia et al. (2020). Discontinued Privacy: Personal Data Leaks in Apple Bluetooth-Low-Energy Continuity Protocol

UWB Bluetooth Discovery

MAC address

 Nearby device detected  UWB Point To Share

sharingd

0f 05 a0 35 eed4de

Authentication Tag Validation

MAC address

 Nearby device detected  UWB Point To Share  Validate Auth Tag

sharingd

0f 05 a0 35 eed4de

SipHash( MAC address , IRK) = Auth Tag

UWB Bluetooth Discovery

MAC address

 Nearby device detected  UWB Point To Share  Validate Auth Tag

sharingd rapportd

0f 05 a0 35 eed4de
MAC address

Initiate ranging
Whitelist UWB MAC address

nearbyd

U1

AirDrop Ranging
UWB Ranging and Angle measurements

AirDrop Ranging
UWB Ranging and Angle measurements

Nearby Interaction Framework

Initiator

Using out of band communication

Responder

Initiator

Bluetooth discovery

13 09 09 219d0c01 0400030c

13 04 01 a2b246

UWB Length Flags Authentication Tag UWB Config

Authentication Tag
Responder

NIDiscoveryToken

16 bytes
Identity Resolving Key (IRK)

3 bytes
Identifier Data

SipHash( MAC address , IRK) = Auth Tag

UWB Secure Ranging Somewhat

UWB Ranging

20" 90º

Time received

Time replied

20" 90º

Time of flight = Time received - Time replied - processing time

AirDrop
One-to-many ranging Single sided ranging
Likely no STS

Nearby Interaction
Peer-to-peer ranging Double sided ranging Shared secret and STS

AoA and Distance Measurement Ticket Processing

nearbyd
Start range and angle estimation Rose neural engine sensor fusion

RoseControllerLib

IOKit
NewServiceRequest (once)
U1

MeasurementTicket (asynchronous, n times)

Hardware Interaction

Hardware Components

 UWBCommsRoute: AP/AOP

Kernel

Always-on Processor
64-bit RTKit

U1
Application Processor
~1500 functions, 32-bit RTKit
Rx
Digital Signal Processor
~500 functions, 64-bit RTKit
Tx

Hardware Components - AirTag

nRF52832
AirTag Firmware, BLE+NFC
32-bit, non-RTKit

U1
Application Processor
32-bit RTKit
Rx
Digital Signal Processor
64-bit RTKit
Tx

"Hacking the Apple AirTags", DEF CON 29 talk by Thomas Roth.

RTKit Operating System
 RTKitOS runs on almost every Apple chip or embedded device.  64-bit variant comes with ASLR.  Lightweight, ~100 functions.  Even logging is implemented differently in every RTKitOS firmware.
 RTKitOS debug builds support additional logging.  U1 debug builds: iOS 13.3 on iPhone 11 & initial AirTag firmware 

More details about RTKitOS in Apple's Bluetooth chip and peripherals are documented in Dennis Heinze's thesis (https://github.com/seemoo-lab/toothpicker).

Duplicate User Clients

User Space

IOKit

Kernel Space

AppleSPURoseDriverUserClient AppleSPUUserClient

nearbyd Kernel

Hardware

rose rose-supervisor

Always-on Processor

Apps
RTBuddy

IOKit UserClients for RTKit-based chips have equivalents in the AOP. Same principle for other wireless chips by Apple, e.g., the audioOS AOP implements marconi-bluetooth and aop-marconi-bt-control to communicate with Apple's Bluetooth chip.
RTKit-based chips communicate with an RTBuddy for logging etc.

Checking RTKit-based Driver Dependencies

# ioreg -rtc IOUserClient

+-o Root <class IORegistryEntry, id 0x100000100, retain 184>

+-o N104AP <class IOPlatformExpertDevice, id 0x10000020f, ... >

+-o AppleARMPE <class AppleARMPE, id 0x100000210, ... >

+-o arm-io@10F00000 <class IOPlatformDevice, id 0x100000118, ... >

...

+-o RTBuddyV2 <class RTBuddyV2, id 0x100000374, ... >

+-o AOPEndpoint17 <class RTBuddyEndpointService, id 0x1000003a0, ... >

+-o AppleSPU@10000014 <class AppleSPU, id 0x1000003dc, ... >

+-o rose <class AppleSPUAppInterface, id 0x100000142, ... >

+-o AppleSPURoseDriver <class AppleSPURoseDriver, id 0x1000004e4... >

+-o AppleSPURoseDriverUserClient <class AppleSPURoseDriverUserClient, id 0x100000aa3, ... >

{

"IOUserClientCreator" = "pid 549, nearbyd"

}

...

+-o AppleSPU@10000020 <class AppleSPU, id 0x1000003e2, ... >

+-o rose-supervisor <class AppleSPUHIDInterface, id 0x10000049e, ... >

+-o AppleSPUUserClient <class AppleSPUUserClient, id 0x100000aa4, ... >

{

"IOUserClientCreator" = "pid 549, nearbyd"

"IOUserClientDefaultLocking" = Yes

}

Find detailed ioreg outputs from current devices on https://github.com/robre/ioreg-archive.

Sending Commands directly to Rose

User Space

IOConnectCallMethod(port, 5, ...) AppleSPURoseDriverUsCli extRoseTx

nearbyd 

0 extRoseLoadFirmware

1 extRoseGetInfo

2 3

eexxttRRooKsseeeREenrstneetreClomSmapndaMocdee

4 extRosePing

AppleSPURoseDriverUserClient::extRoseTx(`0504...')

AppleSPURoseDriver::performCommand(...) AppleSPUInterface::PerformCommand(...) AppleSPUInterface::spuPerformCommand(...)

Raw command, reverse byte order, means 0x4005.

5 extRoseTx

6 extRoseTimeSync

7 extRoHseaGertdSywncaedrTeime
8 extRoseGetProperty

Command forwarding.

9 extRoseSetProperty

10 extRosePerformInternalCommand

hsi_cmd()
case 0x4005: ...

11 extRoseCacheFirmwareLogs

12 extRoseDequeueFirmwareLogs 13 extRoseTriggerCoredump

Always-on Processor

U1 Application Processor

14 extRoseDequeueCoredump

15 extRoseCoredumpInfo 16 extRosePowerOn 17 extRoseReadPowerState

The IOKit RoseDriverUserClient exports various functions, but in the end they call AppleSPUInterface::spuPerformCommand(...) within the kernel, similar to the SPUUserClient.

18 extRoseConfigureFirmwareLogCache

Sending Commands via the AOP to Rose

User Space

IOConnectCallMethod(port, 1, ...) AppleSPUUserClient extSetPropertyMethod

nearbyd 

0 extTestMethod 1 extSetPropertyMethod
2 extGKetePrronpeertlyMSetphaodce
3 extPerformCommandMethod 4 extSetNamedPropertyMethod 5 extGetNamedPropertyMethod
208 SPHMIaSertdtiwngsare
209 UWBCommsRoute 210 BeaconWhiteList 211 R1MacAddress 212 AllowR1Sleep 213 CalDataPushed 214 CmdQueueClearAllow 215 LogVerbose 216 RoseAOPHello

AppleSPUUserClient::extSetPropertyMethod(211, `0000' + bd_addr) ...
AppleSPUInterface::spuPerformCommand(...)

R1MacAddress

Concatenate from Bluetooth Address

AOPRoseSupervisor::setProperty AOPRoseServiceHandle::SendCommandFIFO (0x4012, mac_addr, ... )
Always-on Processor

mac_cmd() case 0x4012: ...
U1 Application Processor

The IOKit SPUUserClient sets states and properties in the AOP. If needed, certain state changes also apply commands to the U1 chip.

Sending Commands via the AOP to Rose

User Space Kernel Space Hardware

IOConnectCallMethod(port, 3, ...)

AppleSPUUserClient extPerformCommandMethod

nearbyd 

RosePassthrough

! NewServiceRequest

" TriggerRangingStart

AppleSPUUserClient::extPerformCommandMethod(`!', parameters) ...
AppleSPUInterface::spuPerformCommand(...)

NewServiceRequest

Optional raw parameters

# TriggerRangingStop $ CancelServiceRequest % HelloCommand & GetPowerStats ` ResetJobs

( APCheckIn

) APGoodbye

AOPRoseServiceHandle::AOPGeneralizedRangingJob

mac_cmd()
case 0x4025: ...

* ActivateTimeSync + UpdateSessionData . EmulatedRosePacket

/ EmulatedBTData

Always-on Processor

U1 Application Processor

Demo: Frida script that decodes interaction -> NewServiceRequest etc.

GR Packet to Initiate Secure Ranging

nearbyd[1184] <Notice>: RoseScheduler::handleNewServiceRequestInternal
nearbyd[1184] <Notice>: [AP Scheduler] Servicing dequeued service request. Passing message to AOP scheduler.
nearbyd[1184] <Notice>: Request: [Role]: Initiator, [MacMode]: GR
nearbyd[1184] <Notice>: Built GR packet: { ses_role: 0
, tx_ant_mask : 2 , rx_ant_mask : 11 , rx_sync_search_ant_mask : 2 , tx_preamble: 3 , rx_preamble: 3 , tx_pkt_type: 0 , rx_pkt_type: 0 , tx_mslot_sz_250us: 12 , rx_mslot_sz_250us: 12 , interval_min_ms: 30 , naccess_slots_min: 1 , naccess_slots_max: 32 , access_slot_idx: 0 , start_channel: 1 , alternate_channel: 0 , channel_hop_pattern_mask: 8 , debug_flags: 7 , start_time: 0 , start_time_uncertainty: 0 , interval_max_ms: 5000 , local_addr: 0x0 , peer_addr: 0x0 , sts_blob: 1281711291571851042031941281011261981431306684 }
0x80=128, 0xab=171, ..., 0x54=84

- AppleSPUUserClient::extPerformCommandMethod()

> connection

0xa503

> selector

0x3

> input

v

0 1 2 3 4 5 6 7 8 9 A B C D E F

00000000 21

+ NewServiceRequest

v---- IOKit input struct ----

00000000 00000010 00000020 00000030 00000040 00000050 00000060 00000070 00000080 00000090 000000a0 000000b0 000000c0 000000d0 000000e0 000000f0 00000100 00000110 00000120

0 1 2 3 4 5 6 7 8 9 A B C D E F 30 00 16 00 00 00 04 00 01 13 01 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 25 40 00 00 00 00 01 04 02 0b 02 01 00 08 03 03 00 00 00 00 00 00 0c 0c 00 00 1e 00 88 13 01 20 ff 80 ab 81 9d b9 68 cb c2 80 65 7e c6 8f 82 42 54 00 00 00 00 00 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0123456789ABCDEF !
0123456789ABCDEF 0............... ................ ................ ................ ................ ................ ................ ................ ................ ................ ................ ................ ................ ....%@.......... ................ ... ......h...e~ ...BT........... ................ ........

Firmware Format

U1 Firmware Extraction

Contained in every iOS/audioOS IPSW, watchOS OTA image, or AirTag firmware image.

/Firmware/Rose/[type]/ftab.bin
Types as of now:  iPhone 11 (r1p0)  iPhone 12 (r1p1)  Apple Watch 6 (r1w0)  HomePod mini (r1hp0)  AirTag (b389)

00000000 00000010 00000020 00000030 00000040 00000050
...
000786b0 000786c0 000786d0 000786e0 000786f0

01 00 00 00 ff ff ff ff 00 00 00 00 00 00 00 00 72 6b 6f 73 66 74 61 62 72 6b 6f 73 60 00 00 00 73 62 64 31 40 99 04 00 62 76 65 72 a0 d2 08 00
00 00 00 00 00 00 00 00 52 54 4b 69 74 5f 69 4f 30 2e 36 2e 30 2e 31 2e 06 00 00 80 04 00 00 00 00 00 00 00 00 00 00 00

00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 03 00 00 00 00 00 00 00 e0 98 04 00 00 00 00 00 60 39 04 00 00 00 00 00 26 00 00 00 00 00 00 00
00 00 00 00 20 00 00 00 53 2d 31 32 36 34 2e 36 64 65 62 75 67 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

................ ................ rkosftab........ rkos`........... sbd1@...`9...... bver....&.......
............ ... RTKit_iOS-1264.6 0.6.0.1.debug... ................ ................

The ftab format is also used for other firmware, split it using https://gist.github.com/matteyeux/c1018765a51bcac838e26f8e49c6e9ce.

Firmware Segments

Application Processor
~1500 functions, 32-bit RTKit
Digital Signal Processor
~500 functions, 64-bit RTKit
Signature
Bound to the chip's ECID

Contained in the firmware update image
Appended during update process

Demo: Show system messages how the chip boots, maybe also an invalid boot

Obtaining Logs

Trigger Rose Error Handling (#1)

Can we interact with the firmware without modifying it?
SystemOff is executed when entering flight mode, switch this with the implementation of TriggerFatalErrorHandling.
Get full crash logs and packet logs by setting isInternalBuild and a few other properties.

case 7: _os_log_impl( ..., "PRRoseProvider::relayCommandMessage -- SystemOff", buf_full_packet, 2LL);
... case 8:
... "PRRoseProvider::relayCommandMessage -- RefreshConfiguration",
... PRRoseProvider::relayCommandMessage_RefreshConfiguration_104F70484(a1 + 19); ... case 9:
... "PRRoseProvider::relayCommandMessage -- TriggerFatalErrorHandling",
... log_rose_r1_msg_1021139CC(buf_full_packet, "AOPRoseFatalError"); PRRoseProvider::relayCommandMessage_TriggerFatalErrorHandling_104F72654(...) ...

Trigger Rose Error Handling (#2)
nearbyd libRoseBooter

 RoseControllerLib::TriggerCrashlog(*Controller, 1);

RoseControllerLib

User Space Kernel Space

IOKit

Mach Messages

Demo: Show Crash Logs & iOS 13.3 Packet Logs

Conclusion

Lessons Learned
 Bluetooth and Ultra Wideband are tightly coupled on iOS.  Apple's own RTKit-based wireless chips have an interesting architecture with many
security features like secure boot and ASLR.  Many features in the chip can be instrumented from user space.

Q&A
https://github.com/seemoo-lab Twitter: @naehrdine, @Sn0wfreeze [jclassen|aheinrich]@seemoo.de

