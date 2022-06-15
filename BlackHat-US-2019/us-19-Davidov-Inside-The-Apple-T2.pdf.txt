Penny for approximate scale

 
    

T2
ARM64 Flash Controller Storage
SEP

Intel Chipset Raw Storage Camera/Mic
Display TouchID

Intel Chipset Raw Storage





 

UEFI
tianocore.github.io/master/images/PI_Boot_Phases.JPG

UEFI
tianocore.github.io/master/images/PI_Boot_Phases.JPG

UEFI
tianocore.github.io/master/images/PI_Boot_Phases.JPG

UEFI
tianocore.github.io/master/images/PI_Boot_Phases.JPG

Intel Chipset
Flash Chip NVARS
UEFI FW

Intel Chipset
Flash NVARS UEFI FW

Intel Chipset
T2 Internal Flash
NVARS UEFI FW

T2 Boot ROM

T2 iBoot

bridgeOS Kernel

PID 0 (launchd)

PID 0 (launchd)

PID 0 (launchd)

MacEFIUtil -i




     

PID 0 (launchd)

MacEFIUtil -i

MacEFI.img4

PID 0 (launchd)

MacEFIUtil -i

MacEFI.img4

MacEFIManager.kext

PID 0 (launchd)

MacEFIUtil -i

MacEFI.img4

AFU.kext MacEFIManager.kext

PID 0 (launchd)

MacEFIUtil -i

MacEFI.img4

AFU.kext
MacEFIManager.kext
Internal Storage

PID 0 (launchd)

MacEFIUtil -i

MacEFI.img4

AFU.kext
MacEFIManager.kext
Internal Storage

PID 0 (launchd)

MacEFIUtil -i

MacEFI.img4

AFU.kext
MacEFIManager.kext
Internal Storage

eSPI DMA

PID 0 (launchd)

MacEFIUtil -i

MacEFI.img4

AFU.kext
MacEFIManager.kext
Internal Storage

eSPI DMA

MacEFIUtil -i

AppleSSM .kext

AppleSMC .kext

SMC "NESN"

AppleSSM .kext

MacEFIManager .kext

AppleSMC .kext

SMC "NESN"

tianocore.github.io/master/images/PI_Boot_Phases.JPG

On Die Boot ROM

iBoot

bridge OS
Kernel

UEFI FW

Internal Storage

eSPI DMA

Intel PCH

On Die Boot ROM

iBoot

bridge OS
Kernel

UEFI FW

Internal Storage

eSPI DMA

Intel PCH

On Die Boot ROM

iBoot

bridge OS
Kernel

UEFI FW

Internal Storage

eSPI DMA

Intel PCH

On Die Boot ROM

iBoot

bridge OS
Kernel

UEFI FW

Internal Storage

eSPI DMA

Intel PCH

On Die Boot ROM

iBoot

bridge OS
Kernel

UEFI FW

Internal Storage

eSPI DMA

Intel PCH

Biometrics
Find My Device
T2
Speech Recording
System Diagnostics

$ remotectl usage: remotectl list usage: remotectl show (name|uuid) usage: remotectl get-property ... usage: remotectl dumpstate usage: remotectl browse usage: remotectl echo ... usage: remotectl eos-echo usage: remotectl netcat ... usage: remotectl relay ... usage: remotectl loopback ... usage: remotectl convert-bridge-version usage: remotectl heartbeat ... usage: remotectl trampoline ...

$ remotectl

$ remotectl list

usage: remotectl list

2AC47A5D-E9EF localbridge

usage: remotectl show (name|uuid)

usage: remotectl get-property ...

usage: remotectl dumpstate

usage: remotectl browse

usage: remotectl echo ...

usage: remotectl eos-echo

usage: remotectl netcat ...

usage: remotectl relay ...

usage: remotectl loopback ...

usage: remotectl convert-bridge-version

usage: remotectl heartbeat ...

usage: remotectl trampoline ...

iBridge ...

$ remotectl

$ remotectl list

usage: remotectl list

2AC47A5D-E9EF localbridge iBridge ...

usage: remotectl show (name|uuid)

usage: remotectl get-property ... $ remotectl show localbridge

usage: remotectl dumpstate

Services:

usage: remotectl browse

com.apple.CSCRemoteSupportd

usage: remotectl echo ...

com.apple.sysdiagnose.remote

usage: remotectl eos-echo

com.apple.corespeech.xpc.remote.record

usage: remotectl netcat ...

com.apple.xpc.remote.multiboot

usage: remotectl relay ...

com.apple.eos.LASecureIO

usage: remotectl loopback ...

com.apple.osanalytics.logTransfer

usage: remotectl convert-bridge-version com.apple.eos.BiometricKit

usage: remotectl heartbeat ...

com.apple.aveservice

usage: remotectl trampoline ...

com.apple.powerchime.remote

com.apple.bridgeOSUpdated

com.apple.private.avvc.xpc.remote

...

$ remotectl

$ remotectl list

usage: remotectl list

2AC47A5D-E9EF localbridge iBridge ...

usage: remotectl show (name|uuid)

usage: remotectl get-property ... $ remotectl show localbridge

usage: remotectl dumpstate

Services:

usage: remotectl browse

com.apple.CSCRemoteSupportd

usage: remotectl echo ...

com.apple.sysdiagnose.remote

usage: remotectl eos-echo

com.apple.corespeech.xpc.remote.record

usage: remotectl netcat ...

com.apple.xpc.remote.multiboot

usage: remotectl relay ...

com.apple.eos.LASecureIO

usage: remotectl loopback ...

com.apple.osanalytics.logTransfer

usage: remotectl convert-bridge-version com.apple.eos.BiometricKit

usage: remotectl heartbeat ...

com.apple.aveservice

usage: remotectl trampoline ...

com.apple.powerchime.remote

com.apple.bridgeOSUpdated

com.apple.private.avvc.xpc.remote

...

T2

en6


en6

USB PCIe

T2

remotectl relay



remotectl en6

USB PCIe

T2

remotectl

remotectl relay

remotectl en6

USB PCIe

T2

VHC128

en6
VHC128 en6

tcpdump

USB PCIe

T2

HEADERS

DATA

0x29B00B92

Flag bits: 00000000 00000000 00000000 00000001 - Always set 00000000 00000000 00000001 00000000 - Data present 00000000 00000001 00000000 00000000 - Heartbeat request 00000000 00000010 00000000 00000000 - Heartbeat reply 00000000 00010000 00000000 00000000 - Opening a new file_tx stream 00000000 00100000 00000000 00000000 - Reply from file_tx stream 00000000 01000000 00000000 00000000 - Sysdiagnose init handshake

xpc_connection_t conn = xpc_connection_create(...); xpc_object_t message = xpc_dictionary_create(NULL, NULL, 0);
...
xpc_connection_send_message(conn, message);

xpc_connection_t conn = xpc_connection_create(...); xpc_object_t message = xpc_dictionary_create(NULL, NULL, 0); xpc_dictionary_set_bool(message, "bool", true); xpc_dictionary_set_int64(message, "int64", -1); xpc_dictionary_set_uint64(message, "uint64", 0xdeadbeef); xpc_connection_send_message(conn, message);

xpc_connection_t conn = xpc_connection_create(...); xpc_object_t message = xpc_dictionary_create(NULL, NULL, 0); xpc_dictionary_set_bool(message, "bool", true); xpc_dictionary_set_int64(message, "int64", -1); xpc_dictionary_set_uint64(message, "uint64", 0xdeadbeef); xpc_connection_send_message(conn, message);

xpc_connection_t conn = xpc_connection_create(...); xpc_object_t message = xpc_dictionary_create(NULL, NULL, 0); xpc_dictionary_set_bool(message, "bool", true); xpc_dictionary_set_int64(message, "int64", -1); xpc_dictionary_set_uint64(message, "uint64", 0xdeadbeef); xpc_connection_send_message(conn, message);

(lldb) x -c 0x120 0x0000000103800fbc 0x103800fbc: 43 50 58 40 05 00 00 00 00 f0 00 00 08 01 00 00 0x103800fcc: 0b 00 00 00 66 64 00 00 00 b0 00 00 63 6f 6e 6e 0x103800fdc: 65 63 74 69 6f 6e 00 00 00 20 01 00 73 74 72 69 0x103800fec: 6e 67 00 00 00 90 00 00 0b 00 00 00 74 65 73 74 0x103800ffc: 73 74 72 69 6e 67 00 00 64 6f 75 62 6c 65 00 00 0x10380100c: 00 50 00 00 cd cc cc cc fc ff ef 40 64 61 74 61 0x10380101c: 00 00 00 00 00 80 00 00 0a 00 00 00 74 68 69 73 0x10380102c: 69 73 64 61 74 61 00 00 75 69 6e 74 36 34 00 00 0x10380103c: 00 40 00 00 ef be ad de 00 00 00 00 62 6f 6f 6c 0x10380104c: 00 00 00 00 00 20 00 00 01 00 00 00 76 61 6c 75 0x10380105c: 65 00 00 00 00 f0 00 00 28 00 00 00 01 00 00 00 0x10380106c: 73 74 72 69 6e 67 5f 69 6e 5f 76 61 6c 75 65 00 0x10380107c: 00 90 00 00 0c 00 00 00 76 61 6c 75 65 73 74 72 0x10380108c: 69 6e 67 00 69 6e 74 36 34 00 00 00 00 30 00 00 0x10380109c: ff ff ff ff ff ff ff ff 75 75 69 64 00 00 00 00 0x1038010ac: 00 a0 00 00 31 32 33 34 35 36 37 38 2d 61 62 63 0x1038010bc: 64 2d 31 32 64 61 74 65 00 00 00 00 00 70 00 00 0x1038010cc: 00 18 9c 46 ae 9e 5c 15 00 00 00 00 00 00 00 00

CPX@............ ....fd......conn ection... ..stri ng..........test string..double.. .P.........@data ............this isdata..uint64.. .@..........bool ..... ......valu e.......(....... string_in_value. ........valuestr ing.int64....0.. ........uuid.... ....12345678-abc d-12date.....p.. ...F..\.........

Types: XPC_NULL XPC_BOOL XPC_INT64 XPC_UINT64 XPC_DOUBLE XPC_POINTER XPC_DATE XPC_DATA XPC_STRING XPC_UUID XPC_FD XPC_SHMEM XPC_MACH_SEND

= 0x00001000 = 0x00002000 = 0x00003000 = 0x00004000 = 0x00005000 = 0x00006000 = 0x00007000 = 0x00008000 = 0x00009000 = 0x0000a000 = 0x0000b000 = 0x0000c000 = 0x0000d000

type

XPC_ARRAY XPC_DICTIONARY XPC_ERROR XPC_CONNECTION XPC_ENDPOINT XPC_SERIALIZER XPC_PIPE XPC_MACH_RECV XPC_BUNDLE XPC_SERVICE XPC_SERVICE_INSTANCE XPC_ACTIVITY XPC_FILE_TRANSFER

= 0x0000e000 = 0x0000f000 = 0x00010000 = 0x00011000 = 0x00012000 = 0x00013000 = 0x00014000 = 0x00015000 = 0x00016000 = 0x00017000 = 0x00018000 = 0x00019000 = 0x0001a000

Types: XPC_NULL XPC_BOOL XPC_INT64 XPC_UINT64 XPC_DOUBLE XPC_POINTER XPC_DATE XPC_DATA XPC_STRING XPC_UUID XPC_FD XPC_SHMEM XPC_MACH_SEND

= 0x00001000 = 0x00002000 = 0x00003000 = 0x00004000 = 0x00005000 = 0x00006000 = 0x00007000 = 0x00008000 = 0x00009000 = 0x0000a000 = 0x0000b000 = 0x0000c000 = 0x0000d000

type

XPC_ARRAY XPC_DICTIONARY XPC_ERROR XPC_CONNECTION XPC_ENDPOINT XPC_SERIALIZER XPC_PIPE XPC_MACH_RECV XPC_BUNDLE XPC_SERVICE XPC_SERVICE_INSTANCE XPC_ACTIVITY XPC_FILE_TRANSFER

= 0x0000e000 = 0x0000f000 = 0x00010000 = 0x00011000 = 0x00012000 = 0x00013000 = 0x00014000 = 0x00015000 = 0x00016000 = 0x00017000 = 0x00018000 = 0x00019000 = 0x0001a000

uint64

00 40 00 00 05 00 00 00 00 00 00 00 |___type__| |________value________|

uint64

5

_

string

00 90 00 00 09 00 00 00 64 75 6f 6c 61 62 73 21 00 00 00 00 |___type__| |__length_| |d__u__o__l__a__b__s__!_\0_padding|

string

9

duolabs!\0

_

dictionary

00 f0 00 00 28 00 00 00 02 00 00 00

|___type__| |__length_| |num_entry|

dictionary

40

2

66 69 76 65 00 00 00 00 00 40 00 00 05 00 00 00 00 00 00 00

|f__i__v__e_\0_padding| |___type__| |________value________|

"five"

uint64

5

73 69 78 00 00 40 00 00 06 00 00 00 00 00 00 00

|s__i_x_\0| |___type__| |________value________|

"six"

uint64

6

{"five": 5, "six": 6}

file_transfer
file_transfer

-c VHC128

$ sysdiagnose -c & $ tcpdump -nni VHC128 -w dump.pcap $ wireshark dump.pcap

$ sysdiagnose -c & $ tcpdump -nni VHC128 -w dump.pcap $ wireshark dump.pcap
$ sniffer.py

$ sniffer.py

...

imac opening stream 1 for communication on port 49155.

...

New HTTP/2 frame

New XPC Packet imac->t2 on HTTP/2 stream 1 TCP port 49155

XPC Wrapper: {

Magic: 0x29b00b92

Flags: 0b 00000000 00000000 00000001 00000001 (0x101)

BodyLength: 0x30

MessageId: 0x1

}

{

"REQUEST_TYPE": uint64 0x0000000000000001: 1

{"REQUEST_TYPE":

}

1}

$ remotectl relay localbridge com.apple.sysdiagnose.remote 49923

$ remotectl relay localbridge com.apple.sysdiagnose.remote 49923

$ netstat -ant | grep 49923

tcp4

0

0 127.0.0.1.49923

*.*

LISTEN

$ remotectl relay localbridge com.apple.sysdiagnose.remote 49923

$ netstat -ant | grep 49923

tcp4

0

0 127.0.0.1.49923

*.*

LISTEN

$ remotectl relay localbridge com.apple.sysdiagnose.remote 49923

$ netstat -ant | grep 49923

tcp4

0

0 127.0.0.1.49923

*.*

LISTEN

$ remotectl relay localbridge com.apple.sysdiagnose.remote 49923

$ netstat -ant | grep 49923

tcp4

0

0 127.0.0.1.49923

*.*

LISTEN

sudo $ remotectl relay localbridge com.apple.sysdiagnose.remote
49923 $ netstat -ant | grep 49923

tcp4

0

0 127.0.0.1.49923

*.*

LISTEN

# remotectl relay localbridge com.apple.sysdiagnose.remote remotectl: Unable to connect to localbridge/com.apple.sysdiagnose.remote: No such process
SIP

remotectl

`remotectl relay`

remotectl relay
com.apple.private.network.intcoproc.restricted

entitlements entitlements

remotectl

amfid

remotectl

remotectl

# csrutil disable # in recovery mode

signature

# nvram boot-args="amfi_get_out_of_my_way=0x01" # reboot

# cp /usr/libexec/remotectl /tmp/ # cat << EOF > /tmp/entitlements.ent ... com.apple.private.network.intcoproc.restricted ... EOF # jtool --sign --ent /tmp/entitlements.ent --inplace /tmp/remotectl

$ sysdiagnose -c
... {
"REQUEST_TYPE": uint64 0x0000000000000001: 1
}

{ "RESPONSE_TYPE": uint64 0x0000000000000001: 1 "FILE_TX": MessageId: 0x5 File transfer size: 0x00000000005b49d7 5982679 "FILE_NAME": "bridge_sysdiagnose_2019.01 .18_16-57-46+0000_Bridge_OS _Bridge_16P375.tar.gz"
}

$ sysdiagnose -cup
... {
"disableUIFeedback": True "shouldRunOSLogArchive": False "shouldRunLoggingTasks": False "shouldDisplayTarBall": False "shouldRunTimeSensitiveTasks": True "REQUEST_TYPE":
uint64 0x0000000000000001: 1 }

$ sysdiagnose -cup
... {
"disableUIFeedback": True "shouldRunOSLogArchive": False "shouldRunLoggingTasks": False "shouldDisplayTarBall": False "shouldRunTimeSensitiveTasks": True "REQUEST_TYPE":
uint64 0x0000000000000001: 1 }

getMetrics bool diagnosticID string baseDirectory string
rootPath string archiveName string embeddedDeviceType string coSysdiagnose string generatePlist bool
quickMode bool shouldDisplayTarBall bool
shouldCreateTarBall bool shouldRunLoggingTasks bool shouldRunTimeSensitiveTasks bool shouldRunOSLogArchive bool shouldRemoveTemporaryDirectory bool shouldGetFeedbackData bool
disableStreamTar bool disableUIfeedback bool
setNoTimeOut bool pidOrProcess string
capOverride NSData warnProcWhitelist string

$ sysdiagnose_client.py
... {
"REQUEST_TYPE": uint64 0x0000000000000001: 1
"archiveName": "duolabs"
}

getMetrics bool diagnosticID string baseDirectory string
rootPath string archiveName string embeddedDeviceType string coSysdiagnose string generatePlist bool
quickMode bool shouldDisplayTarBall bool
shouldCreateTarBall bool shouldRunLoggingTasks bool shouldRunTimeSensitiveTasks bool shouldRunOSLogArchive bool shouldRemoveTemporaryDirectory bool shouldGetFeedbackData bool
disableStreamTar bool disableUIfeedback bool
setNoTimeOut bool pidOrProcess string
capOverride NSData warnProcWhitelist string

$ sysdiagnose_client.py
... {
"REQUEST_TYPE": uint64 0x0000000000000001: 1
"archiveName": "duolabs"
}

{ "RESPONSE_TYPE": uint64 0x0000000000000001: 1 "MSG_TYPE": uint64 0x0000000000000002: 2 "FILE_TX": MessageId: 0x58 File transfer size: 0x00000000004a22b6 4858550 "FILE_NAME": "duolabs.tar.gz"
}

com.apple.CSCRemoteSupportd com.apple.sysdiagnose.remote com.apple.corespeech.xpc.remote.record com.apple.xpc.remote.multiboot com.apple.eos.LASecureIO com.apple.osanalytics.logTransfer com.apple.eos.BiometricKit com.apple.aveservice com.apple.powerchime.remote com.apple.bridgeOSUpdated com.apple.private.avvc.xpc.remote com.apple.corecaptured.remoteservice com.apple.icloud.findmydeviced.bridge com.apple.mobileactivationd.bridge com.apple.sysdiagnose.stackshot.remote com.apple.multiverse.remote.bridgetime com.apple.logd.remote-daemon com.apple.corespeech.xpc.remote.control

https://github.com/duo-labs/apple-t2-xpc/

The T2 is a significant step forward towards bringing the same security properties of iOS to macOS.
The UEFI firmware images are still mutable by design and only validated on "first-boot" scenarios.
Hardware attacks appear to still be feasible, albeit through a new (eSPI) interface.

{ "REQUEST_TYPE": uint64 0x0000000000000001: 1
}

switch ( REQUEST_TYPE ) { case 1u: sd_ops_sysdiagnose(...); case 2u: sd_ops_stackshot(...); case 4u: sd_ops_cancel(...); case 5u: sd_ops_cancelAll(...); case 6u: sd_ops_userinterrupt(...); case 7u: sd_ops_statusPoll(...); case 8u: sd_ops_airdrop(...); case 9u: sd_ops_watchList(...); case 10u: sd_ops_deleteArchive(...);

{ "REQUEST_TYPE": uint64 0x0000000000000001: 1
}

switch ( REQUEST_TYPE ) { case 1u: sd_ops_sysdiagnose(...); case 2u: sd_ops_stackshot(...); case 4u: sd_ops_cancel(...); case 5u: sd_ops_cancelAll(...); case 6u: sd_ops_userinterrupt(...); case 7u: sd_ops_statusPoll(...); case 8u: sd_ops_airdrop(...); case 9u: sd_ops_watchList(...); case 10u: sd_ops_deleteArchive(...);

