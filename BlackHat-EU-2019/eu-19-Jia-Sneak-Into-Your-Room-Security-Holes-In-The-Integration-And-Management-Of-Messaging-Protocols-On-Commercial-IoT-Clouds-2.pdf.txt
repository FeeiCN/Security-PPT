Sneak into Your Room: Security Holes in the Integration and Management of
Messaging Protocols on Commercial IoT Clouds

Sneak into Your Room: Security Holes in the Integration and Management of
Messaging Protocols on Commercial IoT Clouds
Yan Jia, Luyi Xing, Yuhang Mao, Dongfang Zhao, XiaoFeng Wang, Shangru Zhao, and Yuqing Zhang
School of Cyber Engineering, Xidian University, China National Computer Network Intrusion Protection Center, University of Chinese Academy of Sciences ,China
Indiana University Bloomington, USA

IoT Cloud

Third-Party IoT Cloud

Architecture of Cloud-based IoT Communication

Configure

Policy

IoT cloud

Device manufacturer
Commands

Message broker

User Control Commands

IoT Device

Information

Information

Mobile application

 

MQTT

MQTT

I like

MQTT!

· MQTT is deployed by

What is MQTT
· Message Queuing Telemetry Transport (MQTT) · M2M/IoT connectivity protocol · Publish/subscribe messaging transport · OASIS/IOS Standard · TCP/IP port 1883, port 8883 (over SSL)

It was created in 1999 and used to monitor an oil pipeline through the desert.

How MQTT works
Type of Messages: Connect, Topic, Subscribe, Publish

CONNECT {ClientIdA}
Session
SUBSCRIBE Topic:{DeviceId/cmd}
PUBLISH Message:{cmd:Start}

IoT Device

PUBLISH Message:{status:72 }

Topics DeviceId/cmd DeviceId/status IoT Cloud

CONNECT {ClientIdB}
Session

PUBLISH Message:{cmd:Start}

SUBSCRIBE Topic:{DeviceId/status}

PUBLISH

Message:{status:72 }

App

Is MQTT secured? No.
#
[1] Lucas Lundgren. Blackhat USA 2017 [2] Federico Maggi, Davide Quarta. Blackhat Europe 2018.

Protection of MQTT on IoT Clouds
· Authentication
· X.509 Client Certificates · Username/Password in MQTT Connect · Other Identities (e.g., Amazon Cognito)
Establish SSL Connection
Server Certificate
Certificate / Credentials / tokens
Verified? MQTT begins : Disconnect
CONNECT, SUBSCRIBE, PUBLISH...

IoT Cloud

Protection of MQTT on IoT Clouds
· Authorization
· Flexible policy · Access control template
SUBSCRIBE Topic:{Plug/uuid/cmd}
Publish Topic:{Plug/uuid/status}
SUBSCRIBE Topic:{Lock/uuid/cmd}
Publish Topic:{Lock/uuid/status}

IoT Cloud

Is MQTT really secured ?

Usage scenarios of MQTT becomes more complex.

industrial proprietary devices

various IoT devices that can be shared and transferred

Attack #1
Unauthorized MQTT Messages

Will Message
· An optional payload in CONNECT · Carries topics and messages · Published by the server when client
disconnects accidentally
CONNECT {Will Message}
Internet cut off

PUBLISH {Will Message}

Will Message Attack

Attacker

AWS IoT Cloud

CONNECT Will Message:{Command:Start}

Accept
Revoke attacker s permission

PUBLISH Message:{Command:Start}

Deny

Victim Device
Reset and used by the
victim

Go offline

Will message triggered

PUBLISH Message:{Command:Start}

Start

Will Message Attack

Attacker

AWS IoT Cloud

Victim Device

CONNECT Will Message:{Command:Start}
PUBLISH Message:{Command:Start}

Accept
Revoke attacker s permission
Deny

Ownership Transfered

Reset and used by the
victim

Go offline

Will message triggered

PUBLISH Message:{Command:Start}

Start

Video Demo

Retained Message
· A normal MQTT message with the retained flag set to be true · Stored by the server for that topic · Client that subscribes to the topic will receive the message

PUBLISH

Stored

{Retained Message}

SUBSCRIBE
PUBLISH {Retained Message}

Retained Message Attack

PUBLISH {Retained Message}
Permission Revoked

Stored

CVE-2018-12546

SUBSCRIBE
PUBLISH {Retained Message}

Why?
· It seems a feature as designed Comments from MQTT TC
· "The Will message is accepted at the time it is set. That act of acceptance grants the permission for it to be delivered at a later time. The client is out of the picture. "
· Open discussion
· OASIS Open Issues MQTT-536 · mqtt-comment@lists.oasis-open.org

Attack #2
Faults in Managing MQTT Sessions

MQTT Session

CONNECT SUBSCRIBE PUBLISH
...PUBLISH
UNSUBSCRIBE DISCONNECT

Problem in MQTT Session Management

SUBSCRIBE PUBLISH

Permission

SUBSCRIBE

Deny

Revoked

PUBLISH

Never Disconnect

PUBLISH
...

Security Adopted
· Application-layer encryption
· Update the encryption key along with the user
· Cannot be read by others · But can be replayed
· Update the credentials of device after reset
· Preventing device forgery · But can be forged by keeping MQTT session

Impersonation Attack on Tuya Smart

ScriptApp

ScriptDevice
SUBSCRIBE
Conncet to Cloud with Device s
Credential

PUBLISH Encrypted(Keynew, Status:on)
PUBLISH Encrypted(Keynew, Status:off)

Victim Device

Victim

Update Authorization
and Keynew

Bound by Victim User

Status:On

PUBLISH Encrypted(Keynew, Status:on)

Status:On

Status:Off

PUBLISH Encrypted(Keynew, Status:off)

Status:Off

PUBLISH Encrypted(Keynew, Status:on)

Status:On

Video Demo

Why?

· "The Server MAY use a security component to authorize particular actions on the topic resource for a given Client." -- MQTT 5.0 specification

· CONNECT

· SUBSCRIBE · PUBLISH

Session is not in picture

· Clients manage the session
· SUBSCRIBE · UNSUBSCRIBE · DISCONNECT NEVER TRUST CLIENT

Why?

· "The Server MAY use a security component to authorize particular actions on the topic resource for a given Client." -- MQTT 5.0 specification

· CONNECT

· SUBSCRIBE · PUBLISH

Session is not in picture

· Clients manage the session
· SUBSCRIBE · UNSUBSCRIBE · DISCONNECT NEVER TRUST CLIENT

Good news: MQTT5 allows DISCONNECT to be sent by server.

Attack #3
Unauthenticated MQTT Identity

Identity Management in MQTT
Establish SSL Connection Server Certificate Certificate MQTT CONNECT

IoT Cloud

Identity Management in MQTT
Establish SSL Connection
Server Certificate
Certificate
MQTT CONNECT
CONNECT -----------------------------ClientId Will Flag Clean Session Flag Password Flag ...

IoT Cloud

Client Identifier (ClientId)
· "The Client Identifier (ClientId) identifies the Client to the Server. Each Client connecting to the Server has a unique ClientId." -- MQTT Specification
· If two clients claim the same ClientId, the later one will kick the connected one off.
· "The Server MUST allow ClientIds which are between 1 and 23 UTF-8 encoded bytes in length." -- MQTT Specification
· As short as 1-byte

ClientId in Vendors View
· "Do you manufacture the device with a client identifier - such as using its MAC address? " ­ IBM Knowledge Center
· Unique · Easy to guess
· Serial number of device
· Unique · Easy to guess
· Constant string
· Identify the device · Device sharing

Attack
· iRobot Roomba 690
· Looks like a 16-digit serial number (e.g, 3147C60043211234) · Queried 200,000 numbers through a Web API · Found 10,000 ClientIds in wild after hours · The ClientId of mobile app can be changed

Attack
· iRobot Roomba 690
· Looks like a 16-digit serial number (e.g, 3147C60043211234) · Queried 200,000 numbers through a Web API · Found 10,000 ClientIds in wild after hours · The ClientId of mobile app can be changed
· Kick the 10,000 robots offline!

PoC Attack
· iRobot Roomba 690
· Looks like a 16-digit serial number (e.g, 3147C60043211234) · Queried 200,000 numbers through a Web API · Found 10,000 ClientIds in wild after hours · The ClientId of mobile app can be changed
· Kick the 10,000 robots offline!
· Only kick our own robot offline · One client identity, 2,000 concurrent connections
(on our own AWS IoT endpoint)
· Session hijacking
· Clean session flag

Why?
· ClientId is not a secret · No feature provided by (some) IoT clouds to restrict the ClientId · Misleading development guide
${iot:ClientId} or * 68.4% (26/38) recommended by AWS 85.4% (76/89) on Github
AWS Blog

Attack #4
Authorization Mystery of MQTT Topics

Authorization Mystery of MQTT Topics
· sport/#
· sport/tennis/player1 · sport/tennis/player1/ranking · sport/football/
· When it comes to policy of AWS IoT...
· *-irbthbu/things/${robotid}/cmd · botnet/-irbthbu/things/${robotid}/cmd

Buy One Get One

FREE!

#

· 800 million real-world MQTT messages from a popular smart home Cloud
· IRB approval
· Observation
· E-mail / Phone number · device IDs and types (e.g., door lock, air conditioner, camera, etc.) · device status ("open", "on", "off", "heating", etc.) · device location ("home", "office", "living room", etc.) · information captured by the device (temperature, air quality, etc.) · cohabitants relation ("[Person Name set by user] opened the door") · Timestamp ·...

Air conditioning status of a device

Lessons Learnt

Lessons Learnt
· Carefully applying a common-purpose protocol to your application · Guard the ClientId
· Building the tie of platform-layer identity and ClientId
· Guard various messages
· Clients should never accept messages from previous users
· Guard sessions, not only actions
· Consider sessions in authorization model (even extend state of the protocol)
· Guard resources
· Consider specific syntax features of protocols

Thank You

