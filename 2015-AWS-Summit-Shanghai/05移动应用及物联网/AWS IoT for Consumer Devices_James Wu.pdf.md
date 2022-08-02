AWS IoT for Consumer Devices
 James Wu

Amazon  ­ Echo & Alexa

Amazon echo

Amazon echo
·  ·  ·  ·  ·  · 


Alexa Skill Kit (ASK)

  Alexa Alexa

1
 

2
Alexa  ASK

ASK ASK
3
ASK  

b
 
B
 

a
 
A
 

AWS 

AWS 

 


 


 

 SDK









 (Shadow)

AWS









 













 Amazon Kinesis

 

AWS - 




SDK
 


 AWS 

MQTTHTTP

AWS  -----




AWSAPI

(Shadow)




AWS ­ 

MQTTHTTP  
/
110 (Serverless)

X509TLS1.2 


  /


AWS



RESTful API  

 



S3, Lambda, Amazon Kinesis, DynamoDB Amazon SNS

 


{Thing Name, Sensor Temp, , GetTemp(), Output LED}


  

ID

Time GPS

Stamp

SDK



Thing/Device





IAM 

AWS



IAM 



AWS 



 AWS

Amazon KinesisS3  Amazon 

AWS 

AWS






·  ·  ·  ·  ·  ·  · 


· kBit/s · CPU ·  ·  ·  ·  · 

MQTT

· OASIS  (v3.1.1)
· /
· MQTT  

MQTT v.s HTTPS · 93 · 11.89() · 170.9() · HTTPS 50%
 · 8
Source: http://stephendnicholas.com/archives/1217

AWS/
 / 

 

AWS





· MQTT/HTTP TLS v1.2(X.509 certs)
· TLS  (/)
· HTTPS over sigv4 ()

· 
· 
·  ()

· Amazon Cognito/IAM()

AWS/

MQTT/TLS

 / 

MQTT/TLS

 

AWS

SDK

 / 
(Shadow)



AWS

1. 

5. 

SDK

6. 

Shadow
(Shadow)

3.  4. 

7.  2.  (JSON)

AWS

1. AWS 

2. AWS Amazon Kinesis, Lambda, S3



S3 DDB Amazon Kinesis

RDS Amazon Glacier



SNS Lambda SQS

Amazon Redshift EC2

AWS

AWS

3. 

SNS, Lambda



AWS

C-SDK ( embedded OS)

JS-SDK ( Embedded Linux Platforms)

Arduino Library (Arduino Yun)

Mobile SDK (Android and iOS)

AWSStarter Kits




·  · 
$5  $8

AWS 


250,000 




· AWS
­ MQTT/ ­  ­ 
· Alexa Skill Kit 
­  ­ 
· AWS
­  ­ 

: Connected Smart Home

Amazing Home

Topic (reported)

AWS IoT

Thing Shadow Rule engine

Topic (delta)

Topic (desired)

© 2015, Amazon Web Services, Inc. or its Affiliates. All rights reserved.

Topic (reported)

AWS IoT

Thing Shadow Rule engine

Topic (delta)

Topic (desired)

© 2015, Amazon Web Services, Inc. or its Affiliates. All rights reserved.

on: false

`$aws/things/abot-lamp/shadow/update' {
"state" : { "reported": { "on": false }
} }

on: true

`$aws/things/abot-lamp/shadow/update' {
"state" : {
"desired": { "on": true
}, "reported": {
"on": false } } }

`$aws/things/abot-lamp/shadow/update' {
"state" : {

"desired": {

"on": true

},

"reported" : {

un-sync

"on": false

},

{

"delta": {

"on": true

}

}

}

on: true

`$aws/things/abot-lamp/shadow/update' {
"state" : {
"desired": { "on": true
}, "reported": {
"on": false }, { "delta" : {
"on": true } } }

on: true

`$aws/things/abot-lamp/shadow/update' {
"state" : {
"desired": { "on": true
}, "reported": {
"on": true } } }

on: true

`$aws/things/abot-lamp/shadow/update' {
"state" : {
"desired": { "on": true
}, "reported": {
"on": true } } }



AWS

C-SDK ( embedded OS)

JS-SDK ( Embedded Linux Platforms)

Arduino Library (Arduino Yun)

