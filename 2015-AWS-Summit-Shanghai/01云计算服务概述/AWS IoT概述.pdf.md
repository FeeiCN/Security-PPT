AWS IoT
Subtitle Here Speaker Name

What to Expect from this Session
· Overview of AWS IoT · Message Broker · Rules Engine · Shadow · Registry and Security · Device SDK · AWS IoT Hardware Program

Things are Becoming Connected

Now

Not too long from now

Soon After

Source: Pretty much everyone

Challenges with Connected Things
· Connected does not necessarily mean useful · Noise to Signal · Event Driven Computing · Stream Processing, Big Data and Analytics · SECURITY!

AWS IoT

AUTHENTICATION AUTHORIZATION
Secure with mutual authentication and encryption

DEVICE SDK
Set of client libraries to connect, authenticate and
exchange messages

MESSAGE BROKER
Communicate with devices via MQTT and HTTP

RULES ENGINE
Transform messages based on rules and route to AWS Services

REGISTRY
Identity and Management of your things

AWS IoT API

SHADOW
Persistent thing state during intermittent connections

AWS Services -----
3P Services
APPLICATIONS

AWS IoT Message Broker
MESSAGE BROKER
Communicate with devices via MQTT and HTTP

AWS IoT Message Broker

Highly Scalable Message Broker

Standard Protocol Support (no lock-in)
Millions of devices and apps can connect over any protocol starting with MQTT and HTTP 1.1

Topic Based Architecture (lights/thing-2/color)

Long-lived bi-directional messages Clients (Devices and Apps) can receive commands and control signals from the cloud
Secure by Default Connect securely via X509 Certs and TLS 1.2 Client Mutual Auth

MQTT

· OASIS standard protocol (v3.1.1)
· Lightweight, pub-sub, transport protocol that is useful for connected devices
· MQTT is used on oil rigs, connected trucks, and many more sensitive and resource-sensitive scenarios.
· Customers have needed to build, maintain and scale a broker to use MQTT with cloud applications

MQTT vs HTTPS:
· 93x faster throughput · 11.89x less battery to send · 170.9x less battery to receive · 50% less power to keep connected · 8x less network overhead
Source: http://stephendnicholas.com/archives/1217

AWS IoT Message Broker : Managed Service

Publishers

Highly Scalable Message Broker

Subscribers

Millions of devices sending billions of messages

AWS IoT Message Broker : Managed Service

Publishers

Highly Scalable Message Broker

Subscribers

Millions of devices sending billions of messages

AWS IoT Security: Authentication and Authorization
AAUUTTHHEENNTTIICCAATTIIOONN AUSeTcHurOe wRitIhZmAuTtuIOal N
autheSneticuarteionwiathndmeuntucaryl ption authentication and encryption

One Service, Two Protocols
NEW MQTT + Mutual Auth TLS

Server Auth

TLS + Cert

Client Auth

TLS + Cert

Confidentiality TLS

Protocol

MQTT

Identification

AWS ARNs

Authorization

AWS Policy

AWS Auth + HTTPS TLS + Cert AWS API Keys TLS HTTP AWS ARNs AWS Policy

Mutual Auth TLS

Security

· Secure Communications with Things

· - Single API call to CreateKeysAndCertificate()

· - Client Generated CreateCertificateFromCSR(CSR)

· Fine-grained Authorization for: · Thing Management · Pub/Sub Data Access · AWS Service Access

{ "Version": "2012-10-17", "Statement": [ { "Effect": "Allow", "Action": ["iot:Publish"], "Resource": ["arn:aws:iot:us-east-
1:123456972007:topic/foo"] }, { "Effect": "Allow", "Action": ["iot:Subscribe"], "Resource": ["arn:aws:iot:us-east-
1:123456972007:topicfilter/foo/bar/*"] }]}

AWS IoT Rules Engine
RULES ENGINE
Transform messages based on rules and route to AWS Services

AWS IoT Rules Engine Basics

SELECT * FROM `things/thing-2/color' WHERE color = `red'

Simple & Familiar Syntax - SQL Statement to define topic filter - Optional WHERE clause - Advanced JSON support
Functions improve signal : noise - String manipulation (regex support) - Mathematical operations - Context based helper functions - Crypto support - UUID, Timestamp, rand, etc.

AWS IoT Rules Engine's Flexibility
SELECT *, clientId() as MQTTClientId FROM 'one/rule' WHERE startsWith(topic(2), 'IME33') AND (state = 'INIT' OR hydro_temp > surface_temp)", "actions": [{ "republish": {
"topic": "controllers/${substring(topic(3), 3, 5)}", }]

AWS IoT Rules Engine
Complex Evaluations Respond to the fleet, not just a single unit. Dozens of functions() available Multiple / Simultaneous Actions Sometimes a situation requires you to take many actions

AWS IoT Rules Engine Actions

RULES ENGINE
Transform messages based on rules and route to AWS Services

AWS Services AWS Services
--------3P Services 3P Services

AWS IoT Rules Engine

Rules Engine connects AWS IoT to External Endpoints and AWS Services.

1. AWS Services (Direct Integration)
S3 DDB Kinesis

Actions

2. Rest of AWS (via Kinesis, Lambda, S3, and more)
RDS Glacier

Rules Engine

SNS Lambda SQS

Redshift EC2

3. External Endpoints (via Lambda and SNS)

AWS IoT Rules Engine

Rules Engine evaluates inbound messages published into AWS IoT, transforms and delivers to the appropriate endpoint based on business rules.

External endpoints can be

Actions

reached via Lambda and Simple

Notification Service (SNS).

Invoke a Lambda function
Put object in an S3 bucket Insert, Update, Read from a DynamoDB table Publish to an SNS Topic or Endpoint Publish to a Kinesis stream
Amazon Firehose
Republish to AWS IoT

AWS IoT Rules Engine & Stream Data
Ordered Stream
N:1 Inbound Streams of Sensor Data (Signal to Noise Reduction) Rules Engine filters, transforms sensor data then sends aggregate to Amazon Kinesis Kinesis Streams to Enterprise Applications Simultaneously stream processed data to databases, applications, other AWS Services

AWS IoT Rules Engine & Amazon SNS
2
SNS
Push Notifications Apple APNS Endpoint, Google GCM Endpoint, Amazon ADM Endpoint, Windows WNS Amazon SNS -> HTTP Endpoint (Or SMS or Email) Call HTTP based 3rd party endpoints through SNS with subscription and retry support

AWS IoT Thing Shadow

THING SHADOW PeSrsiHstAenDt tOhinWg state
Pedrsuirsintegnitnttheirnmgisttteantet
durincgoninnteecrmtioitntesnt
connections

APPLICATIONS

AWS IoT Thing Shadow
Shadow

AWS IoT Shadow Flow

1. Device Publishes Current State 5. Device Shadow sync's updated state 6. Device Publishes Current State
Device SDK

3. App requests device's current state
Shadow
4. App requests change the state

AWS IoT

7. Device Shadow confirms state change

2. Persist JSON Data Store

AWS IoT Shadow - Simple Yet Powerful

Thing

Report its current state to one or multiple shadows Retrieve its desired state from shadow

Shadow

Shadow reports delta, desired and reported states along with metadata and version

Mobile App

Set the desired state of a device Get the last reported state of the device Delete the shadow

{ "state" : {
"desired" : { "lights": { "color": "RED" }, "engine" : "ON"
}, "reported" : {
"lights" : { "color": "GREEN" }, "engine" : "ON" }, "delta" : {
"lights" : { "color": "RED" } } }, "version" : 10
}

AWS IoT Shadow Topics (MQTT)

Thing SDK (C-SDK, JS-SDK)
makes it easy for you build shadow functionality into your device so it can automatically synchronize the state with the device.

Sensor LED1 ACCEL TEMP

Reported

Desired

Delta

RED X=1,Y=5,Z=4 83F

YELLOW X=1,Y=5,Z=4 60F

LED1 = Yellow TEMP = 60F

UPDATE: $aws/things/{thingName}/shadow/update DELTA: $aws/things/{thingName}/shadow/update/delta GET: $aws/things/{thingName}/shadow/get DELETE: $aws/things/{thingName}/shadow/delete

AWS IoT Thing Shadow

AWS IoT Registry
THINRGEGRIESGTRISYTRY
Identity and Management of your things

AWS IoT Registry
· key: value
­ Firmware version ­ Serial Numbers
· Support and Maintenance
­ Reference Manual URL ­ Part # reference
· Reference to external support system

AWS IoT ­ Device Management

Stored in S3
Publish to groups of devices Firmware Update
S3 Holds Versioned Firmware Distributions Organize and secure your firmware binaries in S3

· Ability to update global or within a Region
· Rules Engine keeps state of updates and tracks progress in a DynamoDB Table
· Store Version in Registry Entry

Message Broker notifies groups of the fleet using Topic Patterns Alert the fleet (or part of it) of the update, and send the URL to the S3 download

AWS IoT

AUTHENTICATION AUTHORIZATION
Secure with mutual authentication and encryption

DEVICE SDK
Set of client libraries to connect, authenticate and
exchange messages

MESSAGE BROKER
Communicate with devices via MQTT and HTTP

RULES ENGINE
Transform messages based on rules and route to AWS Services

REGISTRY
Identity and Management of your things

AWS IoT API

SHADOW
Persistent thing state during intermittent connections

AWS Services -----
3P Services
APPLICATIONS

Get Started with AWS IoT Device SDK

C-SDK (Ideal for embedded
OS)

JS-SDK (Ideal for Embedded
Linux Platforms)

Arduino Library (Arduino Yun)

Mobile SDK (Android and iOS)

Launching AWS IoT Hardware Program
The AWS IoT Hardware Program helps AWS customers build connected products using any hardware platform.
IoT Hardware Partners reduce the time to market and improve customer experiences by providing necessary tools, SDKs and sensors to connect their devices to AWS.
The program is designed for partners that provide hardware (semiconductors, connectivity modules, sensors, actuators) to customers and are interested in connecting their hardware platform to AWS.

Official IoT Starter Kits, Powered by AWS

Official IoT Starter Kits on Variety of Platforms

Broadcom WICED BCM4343W On Threadx/Netx

Marvell EZConnect MW302 On FreeRTOS

Renasas RX63N On Micrium OS

TI CC3200 On TI-RTOS

Microchip WCM PIC32 Platform

Intel Edison on Yocto Linux

Mediatek LinkOne on Linkit OS

Dragonboard 410c on Ubuntu

Seeeduino Arduino on openWRT

Beaglebone Green on Debian

AWS IoT Always Growing Ecosystem PartnerNsDA
IoT Management Platform

IoT Operating Systems

IoT Analytics Platform

IoT Communication

IoT Systems Integrators

