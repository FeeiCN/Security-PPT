Dive into Apple IO80211FamilyV2
wang yu
#BHUSA @BLACKHATEVENTS

About me
wangyu_wy@didiglobal.com
Background of this research project

#BHUSA @BLACKHATEVENTS

IO80211Family V1, V2 and Apple 80211 Wi-Fi Subsystem
#BHUSA @BLACKHATEVENTS

Introduction
Starting from iOS 13 and macOS 10.15 Catalina, Apple refactored the architecture of the 80211 Wi-Fi client drivers and renamed the new generation design to IO80211FamilyV2. This presentation will help you better understand the architecture and security challenges of the Apple 80211 Wi-Fi subsystem.
#BHUSA @BLACKHATEVENTS

Introduction (cont)
As a Wi-Fi family driver, IO80211Family (V1) / IO80211FamilyV2 plays a key role in Apple's communication model, they manage many important features, such as:
SSID, Channel, Antenna, Rate, TxPower, AP mode and ACL policy settings, Apple Wireless Direct Link (AWDL) service management, Background, P2P, Offload scanning, Troubleshooting, etc.
#BHUSA @BLACKHATEVENTS

The era of IO80211Family

IO80211Family (V1) is mainly designed to support Apple Airport and related equipment.

Daemon: Framework: ----------------------Family drivers: Plugin drivers: Low-level drivers:

airportd ... Apple80211, CoreWifi, CoreWLAN ...
IO80211Family, IONetworkingFamily AirPortBrcmNIC, AirPortBrcm4360 / 4331, AirPortAtheros40 ... IOPCIFamily

#BHUSA @BLACKHATEVENTS

The era of IO80211FamilyV2

IO80211FamilyV2 is mainly designed for communication and data sharing between new generation mobile-based Apple devices.

Daemon: Framework: ----------------------Family drivers: Plugin drivers: Low-level drivers: Firmware:

airportd ... Apple80211, CoreWifi, CoreWLAN ...
IO80211FamilyV2, IONetworkingFamily AppleBCMWLANCore replaces AirPort Brcm series drivers AppleBCMWLANBusInterfacePCIe BCMWLANFirmware4355 / 4364 / 4377 / 4378 ...

#BHUSA @BLACKHATEVENTS

The era of IO80211FamilyV2 (cont)
New subsystems are supported, such as Skywalk.

IO80211FamilyV2 reverse engineering

New features are supported as well, such as Sidecar.

#define APPLE80211_IOC_AWDL_SIDECAR_STATISTICS #define APPLE80211_IOC_AWDL_SIDECAR_DIAGNOSTICS

0x157 0x15F

#BHUSA @BLACKHATEVENTS

Summary about the new architecture
IO80211FamilyV2 is a brand new design for the mobile era. IO80211FamilyV2 and AppleBCMWLANCore integrate the original AirPort Brcm 4331 / 4360 series drivers, with more features and better logic. Please also keep in mind, new features always mean new attack surfaces.
#BHUSA @BLACKHATEVENTS

Where to start?
Can we build a compatible AppleIO80211 or other Wi-Fi framework? 11208elppA
http://newosxbook.com/articles/11208ellpA.html
11208elppA, Part II
http://newosxbook.com/articles/11208ellpA-II.html
#BHUSA @BLACKHATEVENTS

I can do this all day
Yeah, I know. But before that, these projects are worth a look:
Intel Wifi for MacOS
https://github.com/AppleIntelWifi
itlwm
https://github.com/OpenIntelWireless/itlwm
Voodoo80211
https://github.com/mercurysquad/Voodoo80211

#BHUSA @BLACKHATEVENTS

Attack Surfaces of IO80211Family V1 and V2 Kernel Extensions
#BHUSA @BLACKHATEVENTS

Attack surfaces
All inputs are potentially dangerous. 1. From remote and local firmware to operating system kernel 2. From user-mode daemon and framework to operating system kernel 3. All other handlers and parsers for input parameters
#BHUSA @BLACKHATEVENTS

From remote and firmware to kernel
AppleBCMWLANCore::handleEventPacket
https://googleprojectzero.blogspot.com/2017/09/over-air-vol-2-pt-1-exploiting-wi-fi.html https://googleprojectzero.blogspot.com/2017/10/over-air-vol-2-pt-2-exploiting-wi-fi.html https://googleprojectzero.blogspot.com/2017/10/over-air-vol-2-pt-3-exploiting-wi-fi.html
AppleBCMWLANBusInterfacePCIe::handleFWTrap / CVE-2020-9833
https://support.apple.com/en-us/HT211170
#BHUSA @BLACKHATEVENTS

From daemon and framework to kernel
AirPort_Athr5424::setSCAN_REQ
http://www.uninformed.org/?v=all&a=37&t=txt
AirPort_BrcmNIC / IO80211Family Get and Set requests
https://www.zerodayinitiative.com/advisories/ZDI-20-215/ https://www.thezdi.com/blog/2018/10/24/cve-2018-4338-triggering-an-information-disclosure-onmacos-through-a-broadcom-airport-kext
#BHUSA @BLACKHATEVENTS

All other handlers and parsers
Protocols such as Apple Wireless Direct Link (AWDL)
https://bugs.chromium.org/p/project-zero/issues/detail?id=1982 https://bugs.chromium.org/p/project-zero/issues/detail?id=2012
Subsystems such as SkyWalk
http://newosxbook.com/bonus/vol1ch16.html
Handlers such as AppleBCMWLANCore::handleDataPacket, etc.
#BHUSA @BLACKHATEVENTS

From project Kemon to Wi-Fi subsystem sniffer and fuzzer
Kemon: An Open-Source Pre and Post Callback-Based Framework for macOS Kernel Monitoring
https://github.com/didi/kemon https://www.blackhat.com/us-18/arsenal/schedule/index.html#kemon-an-open-source-pre-and-postcallback-based-framework-for-macos-kernel-monitoring-12085
The practice of kernel inline hooking
https://www.blackhat.com/us-19/arsenal/schedule/#ksbox-a-fine-grained-macos-malware-sandbox15059
#BHUSA @BLACKHATEVENTS

IO80211Family Get and Set request sniffer
Kemon-based sniffer
#BHUSA @BLACKHATEVENTS

Apple 80211 Wi-Fi subsystem fuzzer
Code coverage analysis based on Kemon's kernel inline hook engine. Passive fuzzing based on Wi-Fi sniffer and active fuzzing based on compatible framework. Combining the two fuzzing methods.
#BHUSA @BLACKHATEVENTS

IO80211Family V1 and V2 Latest Zero-day Vulnerability Case Studies
#BHUSA @BLACKHATEVENTS

Binary auditing and vulnerability hunting
The total number of reported vulnerabilities: Eighteen. Four of them were patched on May 26, 2020. (before WWDC20)
The types of vulnerabilities include: 1. Heap overflow / kernel object out-of-bounds write 2. Heap data out-of-bounds access 3. Kernel information disclosure 4. Stack overflow without canary protection 5. Arbitrary kernel memory write 6. Integer overflow / unsigned vs signed comparison, etc.
#BHUSA @BLACKHATEVENTS

Vulnerability classification
Zero-days can be classified into at least three categories from the high level of the architecture: 1. Vulnerabilities affecting only IO80211FamilyV2 2. Vulnerabilities affecting both IO80211Family (V1) and IO80211FamilyV2 3. Vulnerabilities affecting only IO80211Family (V1)
#BHUSA @BLACKHATEVENTS

Vulnerability classification (cont)
Zero-days can be classified into at least three categories from the high level of the architecture:
1. Vulnerabilities affecting only IO80211FamilyV2 1.1. Introduced when porting existing V1 features 1.2. Introduced when implementing new V2 features
2. Vulnerabilities affecting both IO80211Family (V1) and IO80211FamilyV2
3. Vulnerabilities affecting only IO80211Family (V1)
#BHUSA @BLACKHATEVENTS

Category 1.1 ­ Introduced into V2 when porting existing V1 features
CVE-2020-9834: AppleBCMWLANCore`AppleBCMWLANScanManager::fillScanParams Kernel Object Out-of-bounds Write Vulnerability Patched via Security Update 2020-003
https://support.apple.com/en-us/HT211170
#BHUSA @BLACKHATEVENTS

Random panic case one ­ Hah?

(lldb) di -p kernel`_delayed_call_enqueue: -> 0xffffff8000763a2a <+538>: cmpq
0xffffff8000763a2e <+542>: jne 0xffffff8000763a34 <+548>: cmpq 0xffffff8000763a37 <+551>: jne

%rax, 0x8(%rbx) 0xffffff8000763adb %rax, (%r11) 0xffffff8000763adb

(lldb) register read rbx rbx = 0x0000000000000000

(lldb) bt * thread #1, stop reason = signal SIGSTOP
* frame #0: 0xffffff8000763a2a kernel`_delayed_call_enqueue [inlined] at queue.h:245 [opt] frame #1: 0xffffff8000763a02 kernel`_delayed_call_enqueue [inlined] at queue.h:351 [opt] frame #2: 0xffffff8000763a02 kernel`_delayed_call_enqueue [inlined] at call_entry.h:150 [opt] frame #3: 0xffffff80007639a5 kernel`_delayed_call_enqueue at thread_call.c:523 [opt] frame #4: 0xffffff80007640d8 kernel`thread_call_enter_delayed_internal at thread_call.c:1079 [opt] frame #5: 0xffffff80007384e2 kernel`mk_timer_arm_trap_internal [inlined] at thread_call.c:994 [opt] frame #6: ......

#BHUSA @BLACKHATEVENTS

Random panic case two ­ NULL pointer dereference (again)?

(lldb) di -p AppleBCMWLANCore`AppleBCMWLANHistogram::dump: -> 0xffffff7f86aee881 <+129>: movl (%rax,%rcx,4), %ecx
0xffffff7f86aee884 <+132>: leaq 0x7bb69(%rip), %rdx 0xffffff7f86aee88b <+139>: xorl %eax, %eax

; "%u,"

(lldb) register read rax rcx rax = 0x0000000000000000 rcx = 0x0000000000000000

(lldb) bt * thread #1, stop reason = signal SIGSTOP
* frame #0: 0xffffff7f86aee881 AppleBCMWLANCore`AppleBCMWLANHistogram::dump + 129 frame #1: 0xffffff7f86a6e60f AppleBCMWLANCore`AppleBCMWLANCore::printDataPathDebug + 1939 frame #2: 0xffffff7f86aa524c AppleBCMWLANCore`AppleBCMWLANCore::captureDriverState + 1564 frame #3: 0xffffff7f86a53fd6 AppleBCMWLANCore`AppleBCMWLANCore::collectImmediateFaultDataCallback + 108 frame #4: 0xffffff7f85b36f44 corecapture`CCFaultReporter::collectImmediateData + 72 frame #5: 0xffffff7f85b37391 corecapture`CCFaultReporter::processFault + 339 frame #6: ......

#BHUSA @BLACKHATEVENTS

Random panic case three ­ Exploitable?

(lldb) di ­p kernel`build_path_with_parent: -> 0xffffff80099637e0 <+592>: movb
0xffffff80099637e2 <+594>: movq 0xffffff80099637e5 <+597>: testb

(%rdx), %al %rdx, %rsi %al, %al

(lldb) register read rdx rdx = 0x0000656b00000000

(lldb) bt * thread #1, stop reason = EXC_BAD_ACCESS (code=1, address=0x0)
* frame #0: 0xffffff80099637e0 kernel`build_path_with_parent at vfs_cache.c:542 [opt] frame #1: 0xffffff8009c198b9 kernel`audit_canon_path [inlined] at vfs_cache.c:801 [opt] frame #2: 0xffffff8009c19896 kernel`audit_canon_path [inlined] at vfs_subr.c:2851 [opt] frame #3: 0xffffff8009c19891 kernel`audit_canon_path at audit_bsm_klib.c:853 [opt] frame #4: 0xffffff8009c0ef5b kernel`audit_arg_sockaddr [inlined] at audit_arg.c:671 [opt] frame #5: 0xffffff8009c0eeea kernel`audit_arg_sockaddr at audit_arg.c:373 [opt] frame #6: ......

#BHUSA @BLACKHATEVENTS

Random panic case four ­ Hmmm, looks like exploitable
(lldb) di -p kernel`OSMetaClassBase::safeMetaCast: -> 0xffffff800c595355 <+21>: callq *0x38(%rax)
0xffffff800c595358 <+24>: nopl (%rax,%rax) 0xffffff800c595360 <+32>: cmpq %rbx, %rax
(lldb) register read rax rax = 0x6742040014004232
(lldb) bt * thread #1, stop reason = signal SIGSTOP
* frame #0: 0xffffff800c595355 kernel`OSMetaClassBase::safeMetaCast [inlined] at OSMetaClass.cpp:1362 [opt] frame #1: 0xffffff800c595352 kernel`OSMetaClassBase::safeMetaCast [inlined] at OSMetaClass.cpp:375 [opt] frame #2: 0xffffff800c595352 kernel`OSMetaClassBase::safeMetaCast at OSMetaClass.cpp:283 [opt] frame #3: 0xffffff7f8e2a4da9 AppleBCMWLANCore`AppleBCMWLANCore::captureDriverState + 377 frame #4: 0xffffff7f8e253fd6 AppleBCMWLANCore`AppleBCMWLANCore::collectImmediateFaultDataCallback + 108 frame #5: 0xffffff7f8d336f44 corecapture`CCFaultReporter::collectImmediateData + 72 frame #6: ......
#BHUSA @BLACKHATEVENTS

Routine setScanRequest

From IO80211FamilyV2`setScanRequest to AppleBCMWLANCore`AppleBCMWLANCore::setSCAN_REQ and then, to AppleBCMWLANCore`AppleBCMWLANScanManager::fillScanParams.

Reverse engineering shows that the input structure should not be greater than 0x9D4.

So, can we get the parameter details of the input structure through reverse engineering?

IO80211FamilyV2`setScanRequest reverse engineering
#BHUSA @BLACKHATEVENTS

Reverse engineering

With the help of CCLogStream debugging information we can at least identify the offsets at 0x04, 0x10, 0x14, 0x34 and 0x44.

0

4

8

C

F

0x00 version bss_type

0x10 ssid_len

ssid 1

2

3

0x20

4

5

6

7

0x30 0x40

8 scan_type

num_channels

channel data 1

2

0x50

3

0x60

0x70
. .

Captured from user input data structure

IO80211FamilyV2`setScanRequest reverse engineering
#BHUSA @BLACKHATEVENTS

Routine AppleBCMWLANScanManager::fillScanParams

0

4

8

C

F

0x00 version

bss_type

ether_addr ether_null

pad

0x10 ssid_len

ssid 1

2

3

0x20

4

5

6

7

0x30 0x40

8 scan_type

num_channels

channel data 1

2

0x50

3

0x60

0x70

0x80

0x90

0xA0
. .

Captured from user input data structure

filling

at object offset 0x5CC offset 0x5D4

0

4

8

C

F

0x00 0x00000001 0x0001

ssid_len

ssid 1

0x10

2

3

4

5

0x20 0x30 0x40

6

7

8 ether_addr

ether_ addr

bss scan type type

0xFFFFFFFF

0xFFFFFFFF

0xFFFFFFFF

user input+0x3C user input+0x3C

0xFFFFFFFF user input+0x40

num_channels

channel data

0x50

0x60
. .

AppleBCMWLANScanManager's internal object

#BHUSA @BLACKHATEVENTS

Routine AppleBCMWLANScanManager::fillScanParams (cont)

0

4

8

C

F

0x00 version

bss_type

ether_addr ether_null

pad

0x10 ssid_len

ssid 1

2

3

0x20

4

5

6

7

0x30 0x40

8 scan_type

num_channels

channel data 1

2

0x50

3

0x60

0x70

0x80

0x90

0xA0
. .

Captured from user input data structure

AppleBCMWLANScanManager::fillScanParams reverse engineering
#BHUSA @BLACKHATEVENTS

AppleBCMWLANScanManager::fillScanParams heap overflow

0

4

8

C

F

0x00 version

bss_type

ether_addr ether_null

pad

0x10 ssid_len

ssid 1

2

3

0x20

4

5

6

7

0x30 0x40

8 scan_type

num_channels

channel data

1

0x50

2

0x60

3

0x70 4

5

0x80

6

0x90

7

0xA0 8
. .

9
Captured from user input data structure

filling

at object offset 0x5CC offset 0x5D4

0

4

8

C

F

0x00 0x00000001 0x0001

ssid_len

ssid 1

0x10

2

3

4

5

0x20 0x30 0x40 0x50

6

7

8 ether_addr

ether_ addr

bss scan type type

0xFFFFFFFF

0xFFFFFFFF

0xFFFFFFFF

user input+0x3C user input+0x3C

0xFFFFFFFF user input+0x40

num_channels

1

2

3

4

5

6

7

8

9

.........

.........

0x60
. .

.........
AppleBCMWLANScanManager's internal object

#BHUSA @BLACKHATEVENTS

The root cause of CVE-2020-9834
The vulnerable function lacks the necessary checks for num_channels in the input structure, which leads to out-of-bounds operations.
For source buffer this means out-of-bounds access, and for destination buffer this means heap overwrite.
The good news is that the write primitive is relatively complete. For vulnerability with incomplete write primitives, please refer to:
https://www.blackhat.com/docs/asia-16/materials/asia-16-Wang-A-New-CVE-2015-0057-ExploitTechnology-wp.pdf
#BHUSA @BLACKHATEVENTS

There are still many questions
We have identified the root cause of the vulnerability, but: 1. What is the meaning of the remaining fields in the input structure? 2. Why does the write primitive read from the inputs every 0x0c bytes?
#BHUSA @BLACKHATEVENTS

Apple SDKs
Apple80211 SDKs (for 10.4 Tiger, 10.5 Leopard and 10.6 Snow Leopard)
https://github.com/phracker/MacOSX-SDKs/releases
IO80211Interface / IO80211Controller finally (somewhat?) open
https://lists.apple.com/archives/xcode-users/2007/Nov/msg00544.html
apple80211_ioctl.h apple80211_var.h apple80211_wps.h IO80211Controller.h IO80211Interface.h IO80211WorkLoop.h
#BHUSA @BLACKHATEVENTS

Apple SDKs leaked? Really?
Apple80211 SDK of macOS 10.12 Sierra
https://github.com/rpeshkov/black80211/tree/master/Black80211/apple80211/sierra
Apple80211 SDK of macOS 10.13 High Sierra
https://github.com/rpeshkov/black80211/tree/master/Black80211/apple80211/high_sierra
Apple80211 SDK of macOS 10.15 Catalina
https://github.com/AppleIntelWifi/Black80211-Catalina/tree/master/Black80211/apple80211/catalina
#BHUSA @BLACKHATEVENTS

New features and interfaces based on reverse engineering

#define APPLE80211_IOC_AWDL_PEERS_INFO #define APPLE80211_IOC_TKO_PARAMS #define APPLE80211_IOC_TKO_DUMP #define APPLE80211_IOC_AWDL_NEARBY_LOG_TRIGGER #define APPLE80211_IOC_HW_SUPPORTED_CHANNELS #define APPLE80211_IOC_BTCOEX_PROFILE #define APPLE80211_IOC_BTCOEX_PROFILE_ACTIVE #define APPLE80211_IOC_TRAP_INFO #define APPLE80211_IOC_THERMAL_INDEX #define APPLE80211_IOC_MAX_NSS_FOR_AP #define APPLE80211_IOC_BTCOEX_2G_CHAIN_DISABLE #define APPLE80211_IOC_POWER_BUDGET #define APPLE80211_IOC_AWDL_DFSP_CONFIG #define APPLE80211_IOC_AWDL_DFSP_UCSA_CONFIG #define APPLE80211_IOC_SCAN_BACKOFF_REPORT #define APPLE80211_IOC_OFFLOAD_TCPKA_ENABLE #define APPLE80211_IOC_RANGING_CAPS #define APPLE80211_IOC_PER_CORE_RSSI_REPORT

0xFA 0xFB 0xFC 0xFD 0xFE 0xFF 0x100 0x101 0x102 0x103 0x104 0x105 0x106 0x107 0x108 0x109 0x10A 0x10B

#BHUSA @BLACKHATEVENTS

Giving back to the community

#define APPLE80211_IOC_COMPANION_SKYWALK_LINK_STATE #define APPLE80211_IOC_NAN_LLW_PARAMS #define APPLE80211_IOC_HP2P_CAPS #define APPLE80211_IOC_RLLW_STATS
APPLE80211_IOC_UNKNOWN (NULL/No corresponding handler) #define APPLE80211_IOC_HW_ADDR #define APPLE80211_IOC_SCAN_CONTROL
APPLE80211_IOC_UNKNOWN (NULL/No corresponding handler) #define APPLE80211_IOC_CHIP_DIAGS #define APPLE80211_IOC_USB_HOST_NOTIFICATION #define APPLE80211_IOC_LOWLATENCY_STATISTICS #define APPLE80211_IOC_DISPLAY_STATE #define APPLE80211_IOC_NAN_OOB_AF_TX #define APPLE80211_IOC_NAN_DATA_PATH_KEEP_ALIVE_IDENTIFIER #define APPLE80211_IOC_SET_MAC_ADDRESS #define APPLE80211_IOC_ASSOCIATE_EXTENDED_RESULT #define APPLE80211_IOC_AWDL_AIRPLAY_STATISTICS #define APPLE80211_IOC_HP2P_CTRL #define APPLE80211_IOC_REQUEST_BSS_BLACKLIST #define APPLE80211_IOC_ASSOC_READY_STATUS #define APPLE80211_IOC_TXRX_CHAIN_INFO

0x162 0x163 0x164 0x165 0x166 0x167 0x168 0x169 0x16A 0x16B 0x16C 0x16D 0x16E 0x16F 0x170 0x171 0x172 0x173 0x174 0x175 0x176

#BHUSA @BLACKHATEVENTS

This is the story behind

0

4

8

C

F

0x00 version bss_type

bssid

pad

0x10 0x20 0x30 0x40

ssid_len

ssid 1

2

3

4

5

6

7

8 scan_type phy_mode dwell_time

rest_time num_channels version channel

0x50 flags

version channel

flags

0x60 version channel

flags

version

0x70 channel

flags

version channel

0x80

flags

version channel

flags

0x90 version channel

flags

version

0xA0
. .

channel

flags

version channel

Captured from user input data structure

#define APPLE80211_VERSION 1

#define APPLE80211_MAX_SSID_LEN 32

#define APPLE80211_MAX_CHANNELS 64 // Please note that the array size

// should be limited to MAX_CHANNELS

struct apple80211_channel

{

u_int32_t version;

u_int32_t channel;

// channel number

u_int32_t flags;

// apple80211_channel_flag vector

};

struct apple80211_scan_data

{

u_int32_t version;

u_int32_t bss_type;

// apple80211_apmode

struct ether_addr bssid;

// target BSSID

u_int32_t ssid_len;

// length of the SSID

u_int8_t ssid[APPLE80211_MAX_SSID_LEN];

u_int32_t scan_type;

// apple80211_scan_type

u_int32_t phy_mode;

// apple80211_phymode vector

u_int16_t dwell_time;

// time to spend on each channel (ms)

u_int32_t rest_time;

// time between scanning each channel (ms)

u_int32_t num_channels;

// 0 if not passing in channels

struct apple80211_channel channels[APPLE80211_MAX_CHANNELS]; // channel list

};
apple80211_ioctl.h and apple80211_var.h

#BHUSA @BLACKHATEVENTS

One more question
Why can such an obvious vulnerability survive to 2020?
#BHUSA @BLACKHATEVENTS

The answer
The answer is that this vulnerability was introduced into IO80211FamilyV2 (iOS 13 and macOS 10.15 Catalina) when porting the existing features of V1, and there is no problem with V1 related function. For unknown reasons, IO80211FamilyV2 removed this boundary check.
AirPortBrcmNIC`AirPort_BrcmNIC::scanreq_common reverse engineering
#BHUSA @BLACKHATEVENTS

Back to the future
OS X Kernel-mode Exploitation in a Weekend, September 2007.
http://www.uninformed.org/?v=all&a=37&t=txt
From AirPort_Athr5424::setSCAN_REQ to AppleBCMWLANCore::setSCAN_REQ:
Program received signal SIGTRAP, Trace/breakpoint trap. 0x001933de in memcpy_common () 2: x/i $eip 0x1933de <memcpy_common+10>: repz movs DWORD PTR es:[edi],DWORD PTR ds:[esi] #0 0x001933de in memcpy_common () #1 0x03915004 in ?? () #2 0x008c6083 in sta_iterate () #3 0x008e52b7 in AirPort_Athr5424::ieee80211_notify_scan_done () #4 0x008e55b9 in AirPort_Athr5424::setSCAN_REQ () #5 0x008b2c91 in IO80211Scanner::scan () #6 0x008aa00c in IO80211Controller::execCommand () #7 0x0038e698 in IOCommandGate::runAction ()
#BHUSA @BLACKHATEVENTS

Category 1.2 ­ Introduced into V2 when implementing new features
CVE-2020-9833: AppleBCMWLANBusInterfacePCIe::loadChipImage / AppleBCMWLANBusInterfacePCIe::copyTrapInfoBlob Kernel Information Disclosure Vulnerability Patched via Security Update 2020-003
https://support.apple.com/en-us/HT211170
#BHUSA @BLACKHATEVENTS

Reverse engineering and binary auditing

Step 1. Allocation but not initialized

Step 2. Initialization

AppleBCMWLANBusInterfacePCIe::handleFWTrap reverse engineering
Step 3. Firmware trap info extraction

AppleBCMWLANBusInterfacePCIe::loadChipImage reverse engineering

AppleBCMWLANBusInterfacePCIe::copyTrapInfoBlob reverse engineering

#BHUSA @BLACKHATEVENTS

Bypass the AppleBCMWLANBusInterfacePCIe::handleFWTrap
The expected execution order is Step 1, 2 and then 3. Is it possible to extract information in the trap buffer before it is initialized? Is it possible to "race" the execution order from Step 1, 2 and 3 to Step 1, 3, (2)?
#BHUSA @BLACKHATEVENTS

Yes, It is possible
The leaked heap data can exceed 0x200 bytes.
Including, kernel objects, function pointers, etc.

#BHUSA @BLACKHATEVENTS

Defeat KASLR

#BHUSA @BLACKHATEVENTS

DEMO

CVE-2020-9833: AppleBCMWLANBusInterfacePCIe::loadChipImage / AppleBCMWLANBusInterfacePCIe::copyTrapInfoBlob
Kernel Information Disclosure Vulnerability

#BHUSA @BLACKHATEVENTS

Category 2 ­ Affecting both IO80211Family (V1) and IO80211FamilyV2

Follow-up ID 729483413 / CVE-2020-9832: IO80211Family`IO80211PeerManager::setScanningState OOB Access Vulnerability
Follow-up ID 729476502: IO80211FamilyV2`IO80211PeerManager::setScanningState OOB Access Vulnerability
Patched via Security Update 2020-003
https://support.apple.com/en-us/HT211170

#BHUSA @BLACKHATEVENTS

Routine IO80211PeerManager::setScanningState

(lldb) di -p IO80211Family`IO80211PeerManager::setScanningState: -> 0xffffff7f89492902 <+60>: cmpl $0x0, (%rdi) (lldb) register read rax rbx rdi
rax = 0x00000000de22b04b rbx = 0x00000000deadbeef rdi = 0xffffff8034975000 (lldb) bt * thread #1, stop reason = EXC_BAD_ACCESS (code=1, address=0x34975000) * frame #0: 0xffffff7f89492902 IO80211Family`IO80211PeerManager::setScanningState + 60
(lldb) di -p IO80211FamilyV2`IO80211PeerManager::setScanningState: -> 0xffffff7f87212c83 <+57>: cmpl $0xb, 0x4c(%rcx,%rbx) (lldb) register read rax rbx rcx
rax = 0x00000000deadbeef rbx = 0x0000000018dbcfb4 rcx = 0xffffff803b993000 (lldb) bt * thread #1, stop reason = EXC_BAD_ACCESS (code=1, address=0x54750000) * frame #0: 0xffffff7f87212c83 IO80211FamilyV2`IO80211PeerManager::setScanningState + 57

#BHUSA @BLACKHATEVENTS

The root cause of CVE-2020-9832
Both IO80211Family (V1) and IO80211FamilyV2 made mistakes when checking input parameters. This vulnerability can be used to detect and analyze kernel heap data or layout, but its quality cannot be compared with CVE-2020-9833.
#BHUSA @BLACKHATEVENTS

Category 3 ­ Vulnerabilities affecting only V1
IO80211FamilyV2 fixes vulnerable functions. Unfortunately, these important improvements have not been synchronized with other system platforms, so we can use them to attack targets like the latest macOS Mojave (10.14.6 18G5033) and macOS High Sierra (10.13.5 17G13035). Follow-up ID 729885295: Apple plans to address this vulnerability in a future security update.
#BHUSA @BLACKHATEVENTS

More vulnerabilities
There are still many interesting and powerful vulnerabilities waiting to be fixed. In the future, I will share their technical details via blog. Let's protect the endpoint security of Apple platforms together!
#BHUSA @BLACKHATEVENTS

DEMO

Apple 80211 Wi-Fi Subsystem Fuzzer on macOS 11.0 Big Sur

#BHUSA @BLACKHATEVENTS

Entitlement for iOS
"... as a result of the ioctl(2) failing (with errno/perror(2) reporting ENOTSUPP/"Operation not supported on socket"). This can be fixed by granting us the same entitlements that /usr/sbin/wifid itself possesses. Specifically, the following:"
Apple 80211 - 28 Days Later (a.k.a 11201ellpA, Part II)
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"> <plist version="1.0"> <dict>
<key>com.apple.wlan.authentication</key> <true/> </dict> </plist>
#BHUSA @BLACKHATEVENTS

Trigger CVE-2020-9834 on iOS platform

{"bug_type":"210","timestamp":"2020-06-07 15:13:44.99 +0800","os_version":"iPhone OS 13.3.1 (17D50)",} {
"build" : "iPhone OS 13.3.1 (17D50)", "product" : "iPhone12,3", "kernel" : "Darwin Kernel Version 19.3.0:
Thu Jan 9 21:11:10 PST 2020; root:xnu-6153.82.3~1\/RELEASE_ARM64_T8030", "date" : "2020-06-07 15:13:42.61 +0800",

"panicString" : "panic(cpu 1 caller 0xfffffff0194c76dc):

Kernel data abort. at pc 0xfffffff01942b96c, lr 0x72f800701a235570 (saved state: 0xffffffe066d4a150)

x0: 0xffffffe000c2d000 x1: 0x0000000000000001 x2: 0x0000000000000001 x3: 0x0000000000000001

x4: 0xffffffe066d4a8a0 x5: 0xffffffe066d4a758 x6: 0x0000000000001000 x7: 0xffffffe0073c3780

x8: 0xffffffe0014e8600 x9: 0x989b636263620038 x10: 0x0000000000000038 x11: 0x0000000000000100

x12: 0x0000000000004000 x13: 0x0000000000000000 x14: 0x0000000000000000 x15: 0x0000000000227277

x16: 0xfffffff018e39e80 x17: 0xfffffff018e39e80 x18: 0x0000000000000000 x19: 0xffffffe000c2d000

x20: 0x0000000000000001 x21: 0xffffffe0073c3780 x22: 0x0000000003a7d656 x23: 0xffffffe066d4a758

x24: 0x0000000000000007 x25: 0x0000000000000001 x26: 0x0000000000000002 x27: 0xffffffe066d4a8a0

x28: 0xffffffe00137b190 fp: 0xffffffe066d4a4c0 lr: 0x72f800701a235570 sp: 0xffffffe066d4a4a0

pc: 0xfffffff01942b96c cpsr: 0x20400304

esr: 0x96000004

far: 0x989b636263620060

#BHUSA @BLACKHATEVENTS

Takeaways and The End
#BHUSA @BLACKHATEVENTS

Takeaways
IO80211FamilyV2 and AppleBCMWLANCore integrate the original AirPort Brcm 4331 / 4360 series drivers, with more features and better logic. New features always mean new attack surfaces. The combination of reverse engineering and Apple SDK means a better life. Several brand new kernel vulnerability case studies.
#BHUSA @BLACKHATEVENTS

Q&A
wang yu Didi Research America

#BHUSA @BLACKHATEVENTS

