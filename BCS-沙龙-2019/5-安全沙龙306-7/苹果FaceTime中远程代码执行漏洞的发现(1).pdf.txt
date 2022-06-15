Towards Discovering Remote Code Execution Vulnerabilities in Apple
FaceTime
Tielei Wang and Tao Huang

About us
· Tao Huang · Senior researcher at Pangu Lab · Focusing on iOS/macOS vulnerability discovery
· Tielei Wang · PhD, co-founder of Team Pangu, organizer of MOSEC · Leading iOS/macOS security research at Pangu Lab · Regularly present research at BlackHat, POC, etc

Motivation
· Messaging apps are becoming a hot security research target · Google Project 0 released a series of blog posts about fuzzing messaging
apps, including WhatsApp, FaceTime
· We decided to take a look at FaceTime

Scope of the talk
· This talk will cover · Code execution flows while making a FaceTime call · Attack surfaces and vulnerabilities along with the code execution flows
· This talk will NOT cover · FaceTime protocol families (e.g., SIP, STUN, RTP/SRTP, etc) · Stream encryption, decryption, and storage · https://blog.quarkslab.com/resources/2013-10-17_imessage-privacy/slides/
iMessage_privacy.pdf

Outline
· Reverse-engineering FaceTime · Attack surface and vulnerabilities analysis · Conclusion

0 0 0
All
Input

Missed

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

FaceTime

FaceTime is not a single application

· FaceTime.app provides
the basic UI framework

0 0 0
All
Input

Missed

xxx-xxx-xxxx

FaceTime FaceTime

xxx-xxx-xxxx
FaceTime.App xxx-xxx-xxxx
xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

· Manage the call status of
FaceTime
· Respond to UI triggered
events
· Communication bridge
between avconferenced and identityservicesd

0 0 0
All
Input

Missed

xxx-xxx-xxxx

xxx-xxx-xxxx

callsexrxxv-xixcx-exxsxxd
xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

FaceTime

· Produce and handle
FaceTime video/audio
streams

0 0 0
All
Input

Missed

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

FaceTime
avconferenced(macOS) mediaserverd(iOS)

0 0 0

FaceTime

· We can consider that
FaceTime consists of the
three major components

callservicesd

avconferenced(macOS) mediaserverd(iOS)

· When a user tries to
make a FaceTime call

0 0 0
All
Input

Missed

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

FaceTime

UINotification-Call
· FaceTime.app will
generate a notification

0 0 0
All
Input

Missed

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

xxx-xxx-xxxx

FaceTime

UINotification-Call

0 0 0
callservicesd

FaceTime
avconferenced(macOS) mediaserverd(iOS)

· callservicesd will handle
the notification

respond UI notification through [CSDFaceTimeProviderDelegate
provider: performStartCallAction:]

0 0 0
callservicesd

· callservicesd then invokes
the corresponding handler to create a new invitation
· callservicesd sends an XPC
message to avconferenced to get invitation data

interact with avconferenced through
-[CSDAVConference prepareWithConfiguration:]

FaceTime
avconferenced(macOS) mediaserverd(iOS)
xpc-message "conferenceGetInviteData"

0 0 0
callservicesd

· MediaBlob contains
configurations for audio and video streams
· SKEBlob contains
encryption and decryption parameters for audio and video streams

interact with avconferenced through
-[CSDAVConference prepareWithConfiguratio
n:]

FaceTime
avconferenced(macOS) mediaserverd(iOS)
xpc-message "conferenceGetInviteData"
MediaBlob of A SKEBlob of A ...

0 0 0
callservicesd

FaceTime
avconferenced(macOS) mediaserverd(iOS)

· avconferenced sends
MediaBlob and SKEBlob
back to callservicesd

interact with avconferenced through
-[CSDAVConference prepareWithConfiguratio
n:]

data from avconferenced

xpc-message "conferenceGetInviteData"

0 0 0
callservicesd

FaceTime
avconferenced(macOS) mediaserverd(iOS)

· callservicesd continues to
encapsulate more
information

send InviteData to Identityservicesd through
-[CSDIDSChat conferenceFinishedPreparin
g:]

data from avconferenced data from callservicesd

· callservicesd passes the invitation data to identityservicesd for further
encapsulation

0 0 0
callservicesd

identityservicesd

FaceTime
avconferenced(macOS) mediaserverd(iOS)

data from avconferenced data from callservicesd

· Identity Services Daemon is a system process that handles credentials
for various services, including iCloud and iMessage. It also connects to computers and iOS devices on your local network to coordinate phone calls across multiple devices.
identityservicesd

0 0 0
callservicesd

FaceTime
avconferenced(macOS) mediaserverd(iOS)

· identityservicesd continues to encapsulate more information, and then
passes it to apsd

0 0 0
callservicesd

identityservicesd
FaceTime
avconferenced(macOS) mediaserverd(iOS)

data from avconferenced data from callservicesd data from identityservicesd

· The Apple Push Service Daemon (apsd) is
responsible for sending and receiving Push Notifications.
· apsd maintains a reliable and secure
connection with Apple server

0 0 0
callservicesd

FaceTime
avconferenced(macOS) mediaserverd(iOS)

apsd
data from avconferenced data from callservicesd data from identityservicesd
identityservicesd

· apsd serializes the whole invitation
data into an APS Message

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

apsd identityservicesd

data from avconferenced data from callservicesd data from identityservicesd data from apsd

· When an endpoint sends a notification to
Apple, Apple does not simply forward it to the destination, instead Apple will modify payloads in the notification

· Comparing the notification sent out and the
notification received, we can find what we can
control

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

AppleServer apsd
identityservicesd

· AppleServer now forwards notifications to
the callee endpoint, according to the content
of the APS Message

AppleServer

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

apsd identityservicesd

apsd

AppleServer

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

apsd identityservicesd

apsd

data from avconferenced data from callservicesd data from identityservicesd data from apsd

· The callee apsd deserializes the APS message

AppleServer

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

apsd identityservicesd

apsd

·We can set breakpoints in APSMessage
deserialization functions in a debugger, and
check the received notification
·APSProtocolCommand = 10 ·APSProtocolPayload = <...> ·APSProtocolTopicHash = <...>

data from avconferenced data from callservicesd data from identityservicesd data from apsd

AppleServer

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

apsd identityservicesd

apsd

identityservicesd

data from avconferenced data from callservicesd data from identityservicesd

·According to APSProtocolTopicHash and APSProtocolCommand,
apsd delivers the payload of the notification to identityservicesd

·We can set breakpoints in identityservicesd and
check the received invitation

AppleServer

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

apsd identityservicesd

apsd

identityservicesd

data from avconferenced data from callservicesd data from identityservicesd

·c=232 -> processIncomingInvitationWithPayload ·c=233 -> processIncomingSessionAcceptMessage ·c=234 -> processIncomingSessionDeclineMessage ·c=235 -> processIncomingSessionCancelMessage ·c=236 -> processIncomingSessionMessage ·c=237 -> processIncomingSessionEndMessage ·...

AppleServer

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

apsd identityservicesd

apsd

identityservicesd

data from avconferenced data from callservicesd data from identityservicesd

0 0 0

FaceTime

AppleServer

apsd

apsd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

identityservicesd

identityservicesd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

data from avconferenced data from callservicesd

·identityservicesd continues to forward data to callservicesd

0 0 0

FaceTime

callservicesd parses binary payload through -[CSDAbstractIDSProviderDelegate
service:account:inviteReceivedForSession:fromID:withContext:]
AppleServer

apsd

apsd

0 0 0

FaceTime

avconferenced(macOS) callservicesd mediaserverd(iOS)

identityservicesd

identityservicesd

avconferenced(macOS) callservicesd mediaserverd(iOS)
data from avconferenced data from callservicesd

0 0 0

FaceTime

AppleServer

apsd

apsd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

identityservicesd

identityservicesd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

MediaBlob of A SKEBlob of A ...

·callservicesd continues to forward blobs to avconferenced/mediaserverd

0 0 0

FaceTime

xxx-xxx-xxx

Accept Decline

0 0 0

FaceTime

xxx-xxx-xxx

AAcccceepptt Decline

UINotification-Accept

0 0 0

FaceTime

xxx-xxx-xxx

AAcccceepptt Decline

0 0 0

FaceTime

AppleServer

UINotification-Accept

apsd

apsd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

identityservicesd

identityservicesd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

0 0 0

FaceTime

AppleServer

apsd

apsd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

identityservicesd

identityservicesd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

UINotification-Accept

0 0 0

FaceTime

AppleServer

apsd

apsd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

identityservicesd

identityservicesd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

respond UI notification through -
[CSDFaceTimeProviderDelegate provider:performAnswerCallAc
tion:]

0 0 0

FaceTime

AppleServer

apsd

apsd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

identityservicesd

identityservicesd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

interact with avconferenced through
-[CSDAVConference prepareWithConfiguration:]

xpc-message "conferenceGetInviteData"
MediaBlob of B SKEBlob of B ...

0 0 0

FaceTime

AppleServer

apsd

apsd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

identityservicesd

identityservicesd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

interact with avconferenced through
-[CSDAVConference prepareWithConfiguration:]
data from avconferenced

xpc-message "conferenceGetInviteData"

0 0 0

FaceTime

AppleServer

apsd

apsd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

identityservicesd

identityservicesd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

Send InviteData to Identityservicesd through
-[CSDIDSChat conferenceFinishedPreparing:]

data from avconferenced data from callservicesd

0 0 0

FaceTime

AppleServer

apsd

apsd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

identityservicesd

identityservicesd data from avconferenced
data from callservicesd data from identityservicesd

avconferenced(macOS) callservicesd mediaserverd(iOS)

AppleServer

0 0 0

FaceTime

apsd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

identityservicesd

apsd

data from avconferenced data from callservicesd data from identityservicesd data from apsd

identityservicesd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

0 0 0

FaceTime

AppleServer

apsd

apsd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

identityservicesd

identityservicesd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

AppleServer

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

data from avconferenced data from callservicesd data from identityservicesd data from apsd

apsd identityservicesd

apsd

0 0 0

FaceTime

identityservicesd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

·c=233 -> processIncomingSessionAcceptMessage

AppleServer

0 0 0

FaceTime

apsd

apsd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

data from avconferenced data from callservicesd data from identityservicesd

identityservicesd

identityservicesd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

0 0 0

FaceTime

AppleServer

apsd

apsd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

data from adavtcaofrnofmearvecnoncfeedrenced data from cdaaltlasefrrvoimcecsadllservicesd

identityservicesd

identityservicesd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

0 0 0

FaceTime

AppleServer

apsd

apsd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

MediaBlob of B SKEBlob of B ...

identityservicesd

identityservicesd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

0 0 0

FaceTime

AppleServer

apsd

apsd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

socket identityservicesd

socket identityservicesd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

Meanwhile, identityservicesd creates sockets for session based connections

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

AppleServer quickrelay

0 0 0

FaceTime

socket identityservicesd

socket identityservicesd

callservicesd

avconferenced(macOS) mediaserverd(iOS)

Apple's QuickRelay server coordinates caller and callee build a direct connection

0 0 0

FaceTime

avconferenced(macOS) mediaserverd(iOS)

0 0 0

FaceTime

Now caller
and callee can avconferenced(macOS) see/hear each mediaserverd(iOS)
other via
FaceTime

identityservicesd
sockseocktet

socket socket

socket
socket
identityservicesd

identityservicesd is responsible for first layer packet handling
and packet re-dispatching

identityservicesd
-[IDSUDPLink _processIncomingPacket] recvmsg

identityservicesd
-[IDSGlobalLink link:didReceivePacket: fromDeviceUniqueID: cbuuid:]
-[IDSUDPLink _processIncomingPacket] recvmsg

identityservicesd
-[IDSGlobalLink link:didReceivePacket: fromDeviceUniqueID: cbuuid:]
-[IDSUDPLink _processIncomingPacket] recvmsg
In this function, identityservicesd identifies STUN messages according to magic number matching

identityservicesd
-[IDSGlobalLink _processStunPacket:fromDeviceUniqueID:cbuuid:arrivalTime:headerOverhead:]
-[IDSGlobalLink link:didReceivePacket: fromDeviceUniqueID: cbuuid:]
-[IDSUDPLink _processIncomingPacket] recvmsg
identityservicesd passes STUN messages to a handler

identityservicesd
-[IDSGlobalLink _processStunPacket:fromDeviceUniqueID:cbuuid:arrivalTime:headerOverhead:]
-[IDSGlobalLink link:didReceivePacket: fromDeviceUniqueID: cbuuid:]
-[IDSUDPLink _processIncomingPacket] recvmsg
-[IDSGlobalLink _processStunPacket:fromDeviceUniqueID:cbuuid:arrival Time:headerOverhead:] will further call different handlers according to different STUN message types.

·Besides STUN messages, many other types of packets are
also handled by identityservicesd itself
·The rest of packets will be distributed to different
processes such as avconferenced

identityservicesd

identityservicesd

-[IDSGlobalLink _processStunPacket:fromDeviceUniqueID:cbuuid:arrivalTime:headerOverhead:]

-[IDSGlobalLink link:didReceivePacket: fromDeviceUniqueID: cbuuid:]

-[IDSUDPLink _processIncomingPacket]

recvmsg

network

-[IDSGlobalLink _processStunPacket:fromDeviceUniqueID:cbuuid:arrivalTime:headerOverhead:]

-[IDSGlobalLink link:didReceivePacket: fromDeviceUniqueID: cbuuid:]

recvmsg

-[IDSUDPLink _processIncomingPacket]

RTP packets handler

identityservicesd
-[IDSUDPLink _processIncomingPacket] recvmsg

identityservicesd
-[IDSGlobalLink link:didReceivePacket: fromDeviceUniqueID: cbuuid:]
-[IDSUDPLink _processIncomingPacket] recvmsg

identityservicesd
-[IDSLinkManager link:didReceivePacket: fromDeviceUniqueID: cbuuid:] -[IDSGlobalLink link:didReceivePacket: fromDeviceUniqueID: cbuuid:]
-[IDSUDPLink _processIncomingPacket] recvmsg

identityservicesd
-[IDSDSession link:didReceivePacket: fromDeviceUniqueID: cbuuid:] -[IDSLinkManager link:didReceivePacket: fromDeviceUniqueID: cbuuid:] -[IDSGlobalLink link:didReceivePacket: fromDeviceUniqueID: cbuuid:]
-[IDSUDPLink _processIncomingPacket] recvmsg

avconferenced(macOS) mediaserverd(iOS)

identityservicesd

-[IDSDSession link:didReceivePacket: fromDeviceUniqueID: cbuuid:]

-[IDSLinkManager link:didReceivePacket: fromDeviceUniqueID: cbuuid:]

-[IDSGlobalLink link:didReceivePacket: fromDeviceUniqueID: cbuuid:]

-[IDSUDPLink _processIncomingPacket]

recvmsg

Transfer data to avconferenced through a series of undocumented syscalls (os_channel_* os_nexus_*)

avconferenced(macOS) mediaserverd(iOS)

avconferenced(macOS) mediaserverd(iOS)

identityservicesd

identityservicesd

-[IDSDSession link:didReceivePacket: fromDeviceUniqueID: cbuuid:]

-[IDSLinkManager link:didReceivePacket: fromDeviceUniqueID: cbuuid:]

-[IDSGlobalLink link:didReceivePacket: fromDeviceUniqueID: cbuuid:]

-[IDSUDPLink _processIncomingPacket]

recvmsg

network

-[IDSDSession link:didReceivePacket: fromDeviceUniqueID: cbuuid:]

-[IDSLinkManager link:didReceivePacket: fromDeviceUniqueID: cbuuid:]

-[IDSGlobalLink link:didReceivePacket: fromDeviceUniqueID: cbuuid:]

recvmsg

-[IDSUDPLink _processIncomingPacket]

Attack Surfaces

Attacker

AppleServer apsd
identityservicesd

The code for notification processing and delivering forms 0-click attack surfaces

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

Attacker

AppleServer apsd
identityservicesd

The code for socket packet processing and delivering forms 1-click attack surfaces, after a FaceTime call is connected

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

Attacker

AppleServer apsd

identityservicesd
identityservicesd can further dispatch messages to other services according to topics and commands, and open new attack surfaces

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

Attacker
other attack surfaces
iMessage remoteDesktop phonecontinuity
...

AppleServer apsd
identityservicesd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

Vulnerability Examples

Attacker
iMessage remoteDesktop phonecontinuity
...

AppleServer apsd

Potential Info Leak
0 0 0

FaceTime

identityservicesd

avconferenced(macOS) callservicesd mediaserverd(iOS)

Attacker

AppleServer

apsd

malicious invitation message c=232
U=<AAAABBBBAAAABBBB> ... ...

identityservicesd
·"U" indicates UUID ·c=232 indicates an invitation

Invitation message contains a field indicating a UUID

Attacker

AppleServer

apsd identityservicesd

malicious invitation message c=232
U=<AAAABBBBAAAABBBB> ... ...

The victim's identityservicesd will reply a message, using the same UUID

Attacker

AppleServer

apsd

malicious invitation message c=233
U=<AAAABBBBAAAABBBB> ... ...

identityservicesd
Attacker receives the reply message

· After fetching "U" in the
invitation dictionary, identityservicesd presumes it is 16 bytes long
· Convert an NSData
(presumed 16 bytes long) to UUID
· Stack variable uu is
uninitialized
· Uninitialized memory leak

Attacker

AppleServer

malicious invitation message c=233
U=<AAAABBBB 
> ... ...

Attacker

apsd identityservicesd

malicious invitation message c=232
U=<AAAABBBB> ... ...

AppleServer

apsd identityservicesd

We hope to get an info leak by sending a short UUID in an invitation message

But what real happens

Attacker

AppleServer

apsd

malicious invitation message c=232
U=<AAAABBBB> ... ...

identityservicesd

When we send U less then 16 bytes...

Attacker

AppleServer

apsd identityservicesd

Apple Server seems to have validations on UUIDS

Attacker

AppleServer

apsd identityservicesd

malicious invitation message c=232 ... ...

·The received message does not contain the "U" field ·From the code point of view, it's definitely an info leak. ·We don't know when Apple Server started to filter out the "short" UUIDs

Attacker
Stun Mesage Heap Overflow

AppleServer apsd
identityservicesd

iMessage remoteDesktop phonecontinuity
...

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

Attacker

AppleServer

Malicious Raw Packet 0 1 2 3 4 5 6 7 8 9 ABCDE F
Stun Message Type Stun Message Length
MagicCookie MagicCookie(32bit)

Payload...

apsd identityservicesd

Malicious Raw Packet 0 1 2 3 4 5 6 7 8 9 ABCDE F
Stun Message Type Stun Message Length
MagicCookie MagicCookie(32bit)
Payload...
· Session Traversal Utilities for NAT (STUN) is a standardized set of
methods, including a network protocol, for traversal of network address translator (NAT) gateways in applications of real-time voice, video, messaging, and other interactive communications.

Malicious Raw Packet 0 1 2 3 4 5 6 7 8 9 AB CDE F
Stun Message Type Stun Message Length
MagicCookie 0x42A41221
Payload...
IDSStunMessage ... type len ...
IDSStunAttribute[20]
...

IDSStunMessage ...
type=0x17 len ...
IDSStunAttribute[0] IDSStunAttribute[1]
... IDSStunAttribute[n]
...
Certain type(0x17) of Stun message will go to [IDSGlobalLink _processDataIndication:fromDevice:localIfIndex:localAddress:remoteAddress:cand idatePairToken:arrivalTime:]

IDSStunMessage ...
type=0x17 len ...
IDSStunAttribute[0] IDSStunAttribute[1]
... IDSStunAttribute[n]
...
[IDSStunMessage getAttribute:attribute:] copies raw packet payload to a local buffer

IDSStunMessage ...
type=0x17 len ...
IDSStunAttribute[0] IDSStunAttribute[1]
... IDSStunAttribute[n]
...
AAAAAAAAAAAAA... (0x5d0)

AAAAAAAAAAAAA... (0x5d0)

IDSGlobalLinkMessage Attribute 1 (0x410LL)

Attribute 2 (0x410LL)

...

Attribute 20 (0x410LL)

This local buffer is used to deserialize an IDSGlobalLink message

CurNode

+0

Type

+2

Length

+4

Payload

CurNode

+0

Type

+2

Length

+4

Payload

CurNode

+0

0xF

+2

0X4141

+4 0x41414141414141414141...

CurNode

+0

0xF

+2

0X4141

+4 0x41414141414141414141...

CurNode

+0

0xF

+2

0X4141

+4 0x41414141414141414141...

T=0xF L=0x4141

V=0x41414141414141....

During the deserialization, memcpy's size argument is under attacker's control

memcpy will easily trigger such a kind of memory corruptions

· The heap overflow can overwrite the ISA pointer of adjacent objects
· Please refer to Neil Archibald, "Modern Objective-C Exploitation", for
exploitation techniques

Attacker
iMessage remoteDesktop phonecontinuity
...

AppleServer apsd
identityservicesd

RTP FEC StackoverFlow

0 0 0

FaceTime

avconferenced(macOS) callservicesd mediaserverd(iOS)

Video Frame

Attacker

AppleServer apsd
identityservicesd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

Video Frame

Attacker

AppleServer apsd
identityservicesd

RTP Packet 1 RTP Packet 2 RTP Packet 3 RTP Packet 4 RTP Packet 5 RTP Packet 6 RTP Packet 7 RTP Packet 8

0 0 0

FaceTime

· A video frame may split into multiple RTP packets · The receiver reassembles RTP packets into a video frame

callservicesd

avconferenced(macOS) mediaserverd(iOS)

VideoHandler ... ...
FrameList ...

Frame ... ...
NextFrame ...
RTP List ...

Frame ... ...
NextFrame ...
RTP List ...

RTP 1 Next
... FEC Header RTP length RTP payload

RTP n Next
... FEC Header RTP length RTP payload

RTP 8 Next
... FEC Header RTP length RTP payload

Length of each RTP packet is strictly checked at receiving point

RTP Without FEC RTP Header RTP Payload
RTP With FEC RTP Header FEC Header Repair Payload

· FaceTime uses the Forward Error
Correction (FEC) mechanism to minimize the influence of packet losses
· In case of packet loss, FaceTime
will try to recover the lost packet, and build a repaired RTP packet
· However, the length of the repaired
RTP packet is copied from FEC header, fully under attacker's control

· When the repaired frame is scheduled to process, avconferenced will
execute the following functions:
· AssembleFrame_H264 · -> RTPProcessH264Packet(...) · -> memcpy(stack_buffer, heap_buffer, size)
· Note that size is recovered from FEC header, under attacker's control

Question: is stack overflow exploitable on iOS in 2019?

Stack Canary should effectively prevent stack overflows

High

func args return address
saved regs stack canary

0x80808080... 0x80808080... 0x80808080... 0x80808080...

Low

local variables

0x80808080... local variables

stack cookie is placed below local variables

High

func args return address
saved regs

Low

High

func args return address
saved regs

local variables

Low

High

func args return address
saved regs

local variables

Low

stack canary

Stack overflow happened in _AssembleFrameH264

High

func args return address
saved regs

0x80808080... 0x80808080...
0x80808080...

local variables

0x80808080... local variables

Low

stack canary

stack canary

mediaserverd crash log on iOS

A compiler bug
· Many functions in different modules have incorrect stack cookies · Apparently Apple's compiler got a problem

Attacker
HeapOverflow iMessage
remoteDesktop phonecontinuity
...

AppleServer apsd
identityservicesd

0 0 0

FaceTime

callservicesd

avconferenced(macOS) mediaserverd(iOS)

Phone continuity
· Allows to make and receive calls from Mac, iPad, or iPod touch when
those devices are on the same network as iPhone.
· Apparently this needs bidirectional network connections between Mac and
iPhone
· Based on our manual inspection, we found the network packets are also
first processed by identityservicesd

Following this execution path
[IDSLinkManager link:didReceivePacket:fromDeviceUniqueID:cbuuid:] [IDSLinkManager _processLMCommandPacket:fromLink:deviceUniqueID:cbuuid:] [IDSInterfaceAddress interfaceAddressWithTransmittedBytes:length:withLocalInterfaceName:] [IDSInterfaceAddress initWithInterfaceAddress:bflags:bssid:bssidLength:] [IDSSockAddrWrapper initWithSockAddr:]

· Very similar to Ian Beer's mp_socket kernel vulnerability(CVE-2018-4241)(https://
bugs.chromium.org/p/project-zero/issues/detail?id=1558)
· sockaddr is under attacker's control, but the function has no checks on the length field of sockaddr
(first byte)
· memcpy will lead to a heap overflow and overwrite ISA pointers of adjacent objects

Attacker
iMessage remoteDesktop phonecontinuity
...

AppleServer apsd
identityservicesd

0 0 0

FaceTime

callservicesd avconferenced(macOS) mediaserverd(iOS)

We only share some typical bugs in such attack surfaces. A lot of trivial bugs such as type confusion are not mentioned.

Black Hat Sound Bytes
· FaceTime's implementation needs significant improvements · Attack surfaces exposed by messaging interfaces need more attentions · Typical stack overflows may still affect iOS in 2019

Thank you!

