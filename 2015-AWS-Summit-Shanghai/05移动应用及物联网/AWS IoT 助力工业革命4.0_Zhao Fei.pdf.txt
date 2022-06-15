AWS IoT 4.0
Zhao Fei





  

  

 

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

AWS IoT : 
AAUUTTHHEENNTTIICCAATTIIOONN AUSeTcHurOe wRitIhZmAuTtuIOal N
autheSneticuarteionwiathndmeuntucaryl ption authentication and encryption

Mutual Auth TLS

AWS IoT Thing Shadow

THING SHADOW PeSrsiHstAenDt tOhinWg state
Pedrsuirsintegnitnttheirnmgisttteantet
durincgoninnteecrmtioitntesnt
connections

APPLICATIONS

AWS IoT Shadow

1.  5. Device Shadow  6. 
Device SDK

3. 
Shadow
4. 

AWS IoT

7. Device Shadow

2. 

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

AWS IoT Message Broker
DEVICE GATEWAY
Communicate with devices via MQTT and HTTP

AWS IoT Device Gateway

Highly Scalable Device Gateway

 (no lock-in)
Millions of devices and apps can connect over any protocol starting with MQTT and HTTP 1.1

Topic Based Architecture (lights/thing-2/color)

Pub/Sub Broker Clients (Devices and Apps) can receive commands and control signals from the cloud
 Connect securely via X509 Certs and TLS 1.2 Client Mutual Auth

AWS IoT Message Broker : Managed Service

Publishers

Highly Scalable Device Gateway

Subscribers

Millions of devices sending billions of messages

AWS IoT Rules Engine Actions

RULES ENGINE
Transform messages based on rules and route to AWS Services

AWS Services AWS Services
--------3P Services 3P Services

AWS

AWS 1. AWS 

AWS

()

2. AWS
(Amazon Kinesis, Lambda, S3, and more)

Actions

S3 DDB Amazon Kinesis

RDS Amazon Glacier



SNS Lambda SQS

Amazon Redshift EC2

3. 
(Lambda and SNS)

AWSAWS



 "RESTful" API 

AWS 



S3, Lambda, Amazon Kinesis, DynamoDB Amazon SNS

 

Mobile App
{Thing Name, Sensor Temp, , GetTemp(), Output LED}

Export to Amazon Redshift

Easy to Query and Visualize

New QuickSight



 AWS

kinesis S3

AWS 

AWS 



Amazon ML
Amazon Machine Learning

Build Amazon ML Models with a Few Clicks

Explore Model Quality

Demo

Demo Architecture

PLC

Modbus
IoT SDK

TCP/IP
Camera



Zigbee

Zigbee Sensors

Amazon API Gateway

Amazon Cognito

AWS IoT

AWS Lambda

Amazon S3

Amazon DynamoDB

Dashboard

