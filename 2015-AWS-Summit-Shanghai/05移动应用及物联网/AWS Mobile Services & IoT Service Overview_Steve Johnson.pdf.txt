AWS Mobile Services & IoT Service Overview
Steve Johnson

AWS Mobile Services

"Mobile" growing in all directions

Published mobile apps continue to grow...

...As "mobile" platforms expand to new domains

Published Apps in App Stores ('000s)*

1600

1400

1200

1000

800

600

400

200

0 2011

2012

2013

2014

iOS App Store Google Play

TV Watch
Car

*Source: Vision Mobile

Apps are also getting more complex

From basic client apps...

...To cloud-connected apps

Push notifications
Sign-in/Social Ads
Custom back ends

Usage analytics Cloud storage

Crash analytics

Attribution analytics

Config management

"AWS has what we need, but...it's complex"

1. Which services should I use?

2. How do I connect them?

Example:

SDK

+

Identity provider SDKs
+

Login screen & integration code =

There has to be a better way...

Introducing: The AWS Mobile Hub (Beta)
1. Single integrated console 2. Pre-built features 3. Auto-provisioned services 4. Auto-generated app
Result: Build apps on AWS in minutes

Introducing: The AWS Mobile Hub (Beta)

Create a project and add features

User sign-in
· Configure how your users sign in:
· No sign-in, optional, or mandatory
· Configure sign-in providers:
· Facebook (Google, Twitter, Amazon to follow) · Your own system
· Adds a sign-in screen to your quickstart app
Powered by Amazon Cognito Identity

Push notifications
· Send push notifications to your apps
· iOS or Android · 1:1 or topic/subscription based
· Quickstart app demonstrates features
· Enable/disable notifications · Auto-registers push tokens with SNS · Lets you select topic subscriptions
Powered by Amazon SNS

App content delivery
· Store application assets in the cloud
· Example: Resource files or media assets
· Use a CDN for faster delivery (optional) · Quickstart app includes on-device cache logic
· Set max cache size · Pin specific files to the cache
Powered by Amazon S3 and CloudFront

User data storage
· Store user files such as photos
· User-only access or all-user access
· Store user profile data
· Key-value pairs · Syncs across devices where user signed in
· Quickstart app includes usage examples
· Contains file browser and color selector
Powered by Amazon S3 and Amazon Cognito Sync

App analytics
· Monitor app usage with analytics
· Session, monetization, and custom events · Monitor active users, monetization, retention
· Quickstart app includes all three event types · Access your dashboard from the Mobile Hub
Powered by Amazon Mobile Analytics

Cloud logic

· Run back-end code in the cloud
· Share functions across apps · Update on the fly without app submissions
· Call directly from your mobile app
· You define inputs/outputs
· Write in Java, Javascript, or Python
· You write code, we manage infrastructure

Powered by AWS Lambda

Download your starter app & start coding...

Testing apps with Amazon Device Farm

Monitoring usage with Mobile Analytics

AWS Mobile Hub (Beta) available now!
· Listed in the AWS Management Console
· Also at https://console.aws.amazon.com/mobilehub
· Services provisioned in US-East-1
· Plan to add Tokyo and Dublin shortly
· AWS Mobile Hub is a free service
· You pay for the services you use (e.g. S3)
· Just getting started...
· Send ideas to aws-mobile-hub@amazon.com

AWS Internet of Things

Things Are Becoming Connected

9 billion

18 billion

50 billion

2012 Source: Cisco

2015

2020

Hello World!

State of Acceleration / Growth

Invention

Refinement

Traction

Source: Patrick Bergel @ ThingMonk 2014 based on research by Ingo Althöfer

Hello Again!

Building Blocks for Innovation in IoT

AWS IoT Makes Things Smarter
· "A 10 year old product can do things that hadn't been invented 10 years ago. Most importantly, going forward, people will expect your product to improve, and if it isn't being updated and getting better, you're literally being left behind."

How can we escape the spin cycle?

Alternate Protocols

Scalability &
Noise/Signal

Security & Management

Integration with Cloud and Mobile Apps and
Analytics

Many SDKs & Tools

AWS IoT
"Securely connect one or one billion devices to AWS, so they can interact with applications and other devices"

AWS IoT

AUTHENTICATION AUTHORIZATION
Secure with mutual authentication and encryption

DEVICE SDK
Set of client libraries to connect, authenticate and
exchange messages

DEVICE GATEWAY
Communicate with devices via MQTT and HTTP

RULES ENGINE
Transform messages based on rules and route to AWS Services

DEVICE REGISTRY
Identity and Management of your things

AWS IoT API

DEVICE SHADOW
Persistent thing state during intermittent connections

AWS Services -----
3P Services
APPLICATIONS

AWS IoT Message Broker
DEVICE GATEWAY
Communicate with devices via MQTT and HTTP

AWS IoT Device Gateway

Highly Scalable Device Gateway

Standard Protocol Support (no lock-in)
Millions of devices and apps can connect over any protocol starting with MQTT and HTTP 1.1

Topic Based Architecture (lights/thing-2/color)

Powerful Pub/Sub Broker with Longlived bi-directional messages Clients (Devices and Apps) can receive commands and control signals from the cloud
Secure by Default Connect securely via X509 Certs and TLS 1.2 Client Mutual Auth

AWS IoT Message Broker : Managed Service

Publishers

Highly Scalable Device Gateway

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

Provisioning and Security

· Secure Communications with Things

· - Single API call to CreateKeysAndCertificate()

· - Client Generated CreateCertificateFromCSR(CSR)

· Fine-grained Authorization for:

· Thing Management · Pub/Sub Data Access · AWS Service Access

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

1. AWS Services
(Direct Integration)
Amazon Amazon Amazon S3 DynamoDB Kinesis

Actions

2. Rest of AWS
(via Amazon Kinesis, AWS Lambda, Amazon S3, and more)
Amazon RDS Amazon Glacier

Rules Engine

Amazon AWS Amazon SNS Lambda SQS

Amazon Redshift

Amazon EC2

3. External Endpoints
(via Lambda and SNS)

AWS IoT Rules Engine Actions

Rules Engine evaluates inbound messages published into AWS IoT, transforms and delivers to the appropriate endpoint based on business rules.

External endpoints can be

Actions

reached via Lambda and Simple

Notification Service (SNS).

Invoke a Lambda function
Put object in an S3 bucket
Insert, Update, Read from a DynamoDB table
Publish to an SNS Topic or Endpoint
Publish to an Amazon Kinesis stream Amazon Kinesis Firehose

Republish to AWS IoT

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

AWS IoT Device Shadow - Simple Yet Powerful

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

AWS IoT Device Shadow Topics (MQTT)

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

AWS IoT Button to Device Shadow

HTTP Publish
GetThingShadow()
Reported: Blue, White, Cyan "b,w,c"

UpdateThingShadow()

Thing Shadow

Android App
Desired: Purple, Yellow, Green "p,y,g"

AWS IoT Registry
THINRGEGRIESGTRISYTRY
Identity and Management of your things

AWS IoT Registry
· Static attributes associated to Thing
­ Firmware version ­ Serial Numbers ­ Device Type ­ Device Group ­ Device Description ­ Sensor description
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

DEVICE GATEWAY
Communicate with devices via MQTT and HTTP

RULES ENGINE
Transform messages based on rules and route to AWS Services

DEVICE REGISTRY
Identity and Management of your things

AWS IoT API

DEVICE SHADOW
Persistent thing state during intermittent connections

AWS Services -----
3P Services
APPLICATIONS

Simple Pay as you go and Predictable Pricing
· Pay as you go. No minimum fees
· $5 per million messages published to, or delivered in US East (N. Virginia), US West (Oregon), EU (Ireland) $8 in Asia Pacific (Tokyo)

AWS IoT

Free Tier
250,000 Messages Per Month Free for first 12 Months

Pricing Example
100 Sensors: Publishing 1x/minute

Metering Unit: Receives all Sensor Data
1 meter * 100 readings * 30 days * 24 hours * 60 minutes = 4.38 million messages

100 sensors * 30 days * 24 hours * 60 minutes = 4.38 million messages

AWS IoT

DynamoDB Table: Receives all Sensor Data
1 table * 100 readings * 30 days * 24 hours * 60 minutes = 4.38 million messages

4.38 million publishes from sensors: 4.38 * $5 = $21.90 4.38 million deliveries to a metering unit: 4.38 * $5 = $21.90
4.38 million deliveries to DynamoDB: $0

Get Started with AWS IoT Device SDK

C-SDK (Ideal for embedded
OS)

JS-SDK (Ideal for Embedded
Linux Platforms)

Arduino Library (Arduino Yun)

Mobile SDK (Android and iOS)

