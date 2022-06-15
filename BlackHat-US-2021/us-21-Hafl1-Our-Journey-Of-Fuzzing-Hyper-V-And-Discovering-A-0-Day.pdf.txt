hAFL1:
Our Journey of Fuzzing Hyper-V and Discovering a 0-Day
Peleg Hadar & Ophir Harpaz

About Us

Peleg Hadar (@peleghd)
 Senior Security Researcher at
 Windows Internals, vulnerability research, hypervisors
 Former Black Hat USA Speaker (2020)

Ophir Harpaz (@ophirharpaz)
 Senior Security Researcher at
 Excited by low level  Author of begin.re

Hyper-V

Hyper-V

Root Partition

Child Partition

VMM (Virtual Machine Monitor)

Root Partition
VSP

Child Partition

VMM (Virtual Machine Monitor)

Root Partition
VSP

Child Partition
VSC

VMM (Virtual Machine Monitor)

Root Partition
VSP VMBus

Child Partition
VSC VMBus

VMM (Virtual Machine Monitor)

Root Partition
vmswitch VMBus

Child Partition
netvsc VMBus

VMM (Virtual Machine Monitor)

Why fuzzing?

Fuzzing Infrastructure

Fuzzing Infrastructure Harness

Fuzzing Infrastructure
Coverage Guidance
Harness

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Fuzzing Para-Virtualized Devices in Hyper-V

Root Partition
VPCIVSP VMBus

Child Partition
VPCI(VSC) VMBus

VMM (Virtual Machine Monitor)

Root Partition
VPCIVSP VMBus

Child Partition
VPCI(VSC) VMBus

VMM (Virtual Machine Monitor)

Root Partition
vmswitch VMBus

Child Partition
netvsc VMBus

VMM (Virtual Machine Monitor)

Pool VNCm ... 0x488: Pool VNC

allocates

netvsc.sys

ndis.sys

RndismpInitialize NvscMicroportInit(VNCm+0x488, ...)

MiniportAdapterContext (Pool VNC)
... allocates
0x18: VMB_CHANNEL

vmbkmcl.sys
VmbChannelAllocate
Channel (VNC+0x18)

ndis.sys

ndis.sys ndisMiniportList

ndis.sys ndisMiniportList
Miniport Adapter #1

ndis.sys ndisMiniportList
Miniport Adapter #1

Miniport Adapter #2

ndis.sys ndisMiniportList
Miniport Adapter #1

Miniport Adapter #2

Miniport Adapter #3

ndis.sys ndisMiniportList
Miniport Adapter #1

Miniport Adapter #2

Miniport Adapter #3
MiniportAdapterContext

ndis.sys ndisMiniportList
Miniport Adapter #1

Miniport Adapter #2

Miniport Adapter #3
MiniportAdapterContext
VMB_CHANNEL

ndis.sys ndisMiniportList
Miniport Adapter #1

Miniport Adapter #2

Miniport Adapter #3
MiniportAdapterContext
VMB_CHANNEL

VmbPacketAllocate( VMBCHANNEL Channel
)

for (currMiniport; currMiniport; currMiniport = currMiniport + nextGlobalMiniportOffset))
{ status = NdisMQueryAdapterInstanceName(&currName, currMiniport); stringCompareRes = RtlCompareUnicodeString(&currName, &ourName, caseInsensitive);
if (stringCompareRes == 0) {
currContext = currMiniport->MiniportAdapterContext;
if (currContext) { PoolVNC = currContext + poolVNCOffset; if (PoolVNC) { channel = PoolVNC + vmbChannelOffset; }
} ... } }

for (currMiniport; currMiniport; currMiniport = currMiniport + nextGlobalMiniportOffset))
{ status = NdisMQueryAdapterInstanceName(&currName, currMiniport); stringCompareRes = RtlCompareUnicodeString(&currName, &ourName, caseInsensitive);
if (stringCompareRes == 0) {
currContext = currMiniport->MiniportAdapterContext;
if (currContext) { PoolVNC = currContext + poolVNCOffset; if (PoolVNC) { channel = PoolVNC + vmbChannelOffset; }
} ... } }

for (currMiniport; currMiniport; currMiniport = currMiniport + nextGlobalMiniportOffset))
{ status = NdisMQueryAdapterInstanceName(&currName, currMiniport); stringCompareRes = RtlCompareUnicodeString(&currName, &ourName, caseInsensitive);
if (stringCompareRes == 0) {
currContext = currMiniport->MiniportAdapterContext;
if (currContext) { PoolVNC = currContext + poolVNCOffset; if (PoolVNC) { channel = PoolVNC + vmbChannelOffset; }
} ... } }

for (currMiniport; currMiniport; currMiniport = currMiniport + nextGlobalMiniportOffset))
{ status = NdisMQueryAdapterInstanceName(&currName, currMiniport); stringCompareRes = RtlCompareUnicodeString(&currName, &ourName, caseInsensitive);
if (stringCompareRes == 0) {
currContext = currMiniport->MiniportAdapterContext;
if (currContext) { PoolVNC = currContext + poolVNCOffset; if (PoolVNC) { channel = PoolVNC + vmbChannelOffset; }
} ... } }

for (currMiniport; currMiniport; currMiniport = currMiniport + nextGlobalMiniportOffset))
{ status = NdisMQueryAdapterInstanceName(&currName, currMiniport); stringCompareRes = RtlCompareUnicodeString(&currName, &ourName, caseInsensitive);
if (stringCompareRes == 0) {
currContext = currMiniport->MiniportAdapterContext;
if (currContext) { PoolVNC = currContext + poolVNCOffset; if (PoolVNC) { channel = PoolVNC + vmbChannelOffset; }
} ... } }

Now to
vmswitch's side.

Root Partition
vmswitch VMBus

Child Partition

netvsc VMBus

harness.sys

VMM (Virtual Machine Monitor)

Packet Types
 NVSP
 Initialization  Control and management  RNDIS
 Communication between host and network adapter

enum {

NVSP_MSG_TYPE_NONE = 0,

/* Init Messages */

NVSP_MSG_TYPE_INIT

= 1,

NVSP_MSG_TYPE_INIT_COMPLETE = 2,

NVSP_VERSION_MSG_START

= 100,

/* Version 1 Messages */

NVSP_MSG1_TYPE_SEND_NDIS_VER = NVSP_VERSION_MSG_START,

NVSP_MSG1_TYPE_SEND_RECV_BUF,

NVSP_MSG1_TYPE_SEND_RECV_BUF_COMPLETE,

NVSP_MSG1_TYPE_REVOKE_RECV_BUF,

NVSP_MSG1_TYPE_SEND_SEND_BUF,

NVSP_MSG1_TYPE_SEND_SEND_BUF_COMPLETE,

NVSP_MSG1_TYPE_REVOKE_SEND_BUF,

NVSP_MSG1_TYPE_SEND_RNDIS_PKT,

NVSP_MSG1_TYPE_SEND_RNDIS_PKT_COMPLETE,

/* Version 2 messages */

NVSP_MSG2_TYPE_SEND_CHIMNEY_DELEGATED_BUF,

NVSP_MSG2_TYPE_SEND_CHIMNEY_DELEGATED_BUF_COMP,

NVSP_MSG2_TYPE_REVOKE_CHIMNEY_DELEGATED_BUF,

NVSP_MSG2_TYPE_RESUME_CHIMNEY_RX_INDICATION,

// SNIP

NVSP_MSG2_MAX = NVSP_MSG2_TYPE_ALLOC_CHIMNEY_HANDLE_COMP,

/* Version 4 messages */

NVSP_MSG4_TYPE_SEND_VF_ASSOCIATION,

NVSP_MSG4_TYPE_SWITCH_DATA_PATH,

NVSP_MSG4_TYPE_UPLINK_CONNECT_STATE_DEPRECATED,

NVSP_MSG4_MAX = NVSP_MSG4_TYPE_UPLINK_CONNECT_STATE_DEPRECATED,

/* Version 5 messages */

NVSP_MSG5_TYPE_OID_QUERY_EX,

NVSP_MSG5_TYPE_OID_QUERY_EX_COMP,

NVSP_MSG5_TYPE_SUBCHANNEL,

NVSP_MSG5_TYPE_SEND_INDIRECTION_TABLE,

NVSP_MSG5_MAX = NVSP_MSG5_TYPE_SEND_INDIRECTION_TABLE,

/* Version 6 messages */

NVSP_MSG6_TYPE_PD_API,

NVSP_MSG6_TYPE_PD_POST_BATCH,

NVSP_MSG6_MAX = NVSP_MSG6_TYPE_PD_POST_BATCH

};

VmsVmNicPvtKmclProcessPacket

VmsVmNicPvtKmclProcessPacket
NVSP_MSG_TYPE_INIT
VmsVmNicPvtHandleInitMessage

VmsVmNicPvtKmclProcessPacket
NVSP_MSG_TYPE_INIT
VmsVmNicPvtHandleInitMessage

VmsVmNicPvtKmclProcessPacket

NVSP_MSG_TYPE_INIT
VmsVmNicPvtHandleInitMessage

NVSP_MSG1_TYPE_SEND_RNDIS_PKT
VmsVmNicPvtVersion1HandleRndisSendMessage

VmsVmNicPvtKmclProcessPacket

NVSP_MSG_TYPE_INIT
VmsVmNicPvtHandleInitMessage

NVSP_MSG1_TYPE_SEND_RNDIS_PKT
VmsVmNicPvtVersion1HandleRndisSendMessage

NVSP_MSG_TYPE_*
MessageHandlerTable[msg_type]

VmsVmNicPvtKmclProcessPacket
NVSP_MSG1_TYPE_SEND_RNDIS_PKT
VmsVmNicPvtVersion1HandleRndisSendMessage
VmsVmNicPvtVersion1HandleRndisSendMessage(VMBCHANNEL pChannel, void* Buffer, PMDL pMdl, void* PacketCompletionContext)

Buffer

0x0

0x4

0x8

0xC

msg_type

channel_type

send_buf_section_index send_buf_section_size

 RNDIS data can be transmitted via either:
 The VMBus's send buffer

Buffer

0x0

0x4

0x8

0xC

msg_type

channel_type

send_buf_section_index send_buf_section_size

The MDL Case:

0xFFFFFFFF

-

 RNDIS data can be transmitted via either:
 The VMBus's send buffer  An MDL - 

Using MDLs
VmsVmNicPvtVersion1HandleRndisSendMessage(VMBCHANNEL pChannel, void* Buffer, PMDL pMdl, void* PacketCompletionContext)

Buffer:

NVSP_MSG1_TYPE_SEND_RNDIS_PKT

0x1

0xFFFFFFFF

0x0

MDL (RNDIS Message):
MessageType

rndis_message_container

Testing Our Harness
CVE-2019-0717

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

What We Expected

What We Expected

KVM (L0)

kAFL

What We Expected

KVM (L0)

kAFL

Hyper-V (L1) - Host

What We Expected

KVM (L0)

kAFL

Hyper-V (L1) - Host

vmswitch.sys
Root Partition Host OS (L2)

harness.sys
Child Partition Guest VM (L2)

Problem: Nested Virtualization
 L2  L0
 MSR_IA32_RTIT_CTL (Intel PT)  SHM / Nested GPA R/W  Hypercall handling
 To be continued :)

Fuzzing from L2

Fuzzing from L1

Solution: Fuzzing From L1
 VT-x is disabled and yet vmswitch.sys is loaded

Solution: Fuzzing From L1
 VT-x is disabled and yet vmswitch.sys is loaded
 Our harness driver will call *HandleRndisSendMessage function with our fuzzing inputs
VmsVmNicPvtVersion1HandleRndisSendMessage(VMBCHANNEL pChannel, void* Buffer, PMDL pMdl, void* PacketCompletionContext)

No VMBus channel exists
No working partitions
VMBus is not initialized No valid VMB_CHANNEL pointer on vmswitch's
end

No VMBus channel exists
No working partitions
VMBus is not initialized
No valid VMB_CHANNEL pointer on vmswitch's end
VmsVmNicPvtVersion1HandleRndisSendMessage(VMBCHANNEL pChannel, void* Buffer, PMDL pMdl, void* PacketCompletionContext)

Initializing a Channel
 Luckily, VmsVmNicMorph initializes most of the structures for us, including a VMBus Channel

Huston, we have a problem!
 Calling VmsVmNicMorph crashed the system!

Huston, we have a problem!
 Calling VmsVmNicMorph crashed the system!  Patching out VMBus-related logic
 Fortunately, VMBus doesn't interfere with the data  We had to disable PatchGuard

Disabling PatchGuard
Setting KdDebuggerEnabled
might cause performance overhead Option #1

Disabling PatchGuard

Setting KdDebuggerEnabled
might cause performance overhead
Option #1

Using EfiGuard
An open-source UEFI bootkit which disables PatchGuard & Driver Signature Enforcement
Option #2

KVM (L0)

What we did

KVM (L0)

What we did
kAFL

KVM (L0)

What we did
kAFL

Windows 10 (L1) - Host

Dummy (non-working) VM (L2)

KVM (L0)

What we did
kAFL

Windows 10 (L1) - Host harness.exe

Dummy (non-working) VM (L2)

KVM (L0)

What we did
kAFL

Windows 10 (L1) - Host harness.exe harness.sys

Dummy (non-working) VM (L2)

KVM (L0)

What we did
kAFL

Windows 10 (L1) - Host

harness.exe

vmswitch.sys

harness.sys

Dummy (non-working) VM (L2)

KVM (L0)

What we did
kAFL

Windows 10 (L1) - Host

harness.exe

vmswitch.sys

harness.sys

Dummy (non-working) VM (L2)

KVM (L0)

What we did
hkAAFFLL1

Windows 10 (L1) - Host

harness.exe

vmswitch.sys

harness.sys

Dummy (non-working) VM (L2)

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Coverage Guidance
 kAFL supports coverage-guidance out-of-the-box
 Using Intel PT  Per-process coverage using CR3 filtering

Coverage Guidance
 Problem: Low basic-block count

Coverage Guidance
 Problem: Low basic-block count
 vmswitch processes incoming packets in a multithreaded
manner

VMSwitch Multithreaded Processing

KVM (L0)

hkAAFFLL1

CR3: 0x0000000000000000 Intel PT: ON Context: harness.exe

Windows 10 (L1) - Host

harness.exe

vmswitch.sys

harness.sys

Dummy (non-working) VM (L2)

VMSwitch Multithreaded Processing

KVM (L0)

hkAAFFLL1

CR3: 0x0000000000000000 Intel PT: ON Context: harness.exe

Windows 10 (L1) - Host

harness.exe

vmswitch.sys

harness.sys

Dummy (non-working) VM (L2)

VMSwitch Multithreaded Processing

KVM (L0)

hkAAFFLL1

CR3: 0x0000000000000000 Intel PT: ON Context: harness.exe

Windows 10 (L1) - Host

harness.exe

vmswitch.sys

harness.sys

Dummy (non-working) VM (L2)

VMSwitch Multithreaded Processing

KVM (L0)

hkAAFFLL1

CR3: 0x0000000000000000 Intel PT: ON Context: harness.exe

Windows 10 (L1) - Host

harness.exe

vmswitch.sys

harness.sys

Dummy (non-working) VM (L2)

CR3: 0x0000000000000000
Intel PT: ON Context: harness.exe

VMSwitch Multithreaded Processing

KVM (L0)

hkAAFFLL1

Windows 10 (L1) - Host

harness.exe

vmswitch.sys

harness.sys

Dummy (non-working) VM (L2)

VMSwitch Multithreaded Processing

KVM (L0)

hkAAFFLL1

CR3: 0x111111111111111111111111
Intel PT: OFF Context: System

Windows 10 (L1) - Host

harness.exe

vmswitch.sys

harness.sys

Dummy (non-working) VM (L2)

Coverage Guidance
 Solution: disable Intel-PT CR3 filtering
 This enabled us to monitor all executions in vmswitch address region

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Crash Monitoring
 Registered a BugCheck callback to send crash's stack trace
 Based on Xen's implementation
 Module name is retrieved by maintaining a linked list of loaded modules

~/kAFL-1 # python3 uniq_crashes.py /root/crashes addresses.pickle

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Structure Awareness

 Protocol Buffers  We integrated Libprotobuf-Mutator
(LPM) into hAFL1 by adding a state

message RNDISMessage { fixed32 ndis_msg_type = 10; fixed32 msg_len = 11; oneof rndis_msg_container { REMOTE_NDIS_PACKET_MSG packet_msg = 1; REMOTE_NDIS_INITIALIZE_MSG init_msg = 2; REMOTE_NDIS_HALT_MSG halt_msg = 3; REMOTE_NDIS_QUERY_MSG query_msg = 4; REMOTE_NDIS_SET_MSG set_msg = 5; REMOTE_NDIS_RESET_MSG reset_msg = 6; REMOTE_NDIS_KEEPALIVE_MSG keepalive_msg = 8; }
}

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

Fuzzing Infrastructure

Harness

Coverage Guidance
Crash Monitoring
Structure Awareness

CVE-2021-28476

RndisDevHostControlMessageWorkerRoutine

RndisDevHostControlMessageWorkerRoutine RndisDevHostHandleSetMessage

RndisDevHostControlMessageWorkerRoutine RndisDevHostHandleSetMessage
VmsIfrInfoParamsNdisOidRequestBuffer

RndisDevHostControlMessageWorkerRoutine RndisDevHostHandleSetMessage
VmsIfrInfoParamsNdisOidRequestBuffer VmsIfrInfoParams_OID_SWITCH_NIC_REQUEST

OID_SWITCH_NIC_REQUEST
 Encapsulates & forwards OID requests to an external adapter  Supposed to be sent only by the extensible switch (root
partition)

Consequences
 Trivially, denial of service by crashing the Hyper-V host  DoS of Azure
 The bug is an arbitrary pointer dereference which can potentially lead to a guest-to-host RCE (CVSS 9.9)

Demo

Demo

https://github.com/SB-GC-Labs/hAFL1

Thank you. @peleghd @ophirharpaz

Q&A @peleghd @ophirharpaz

