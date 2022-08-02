DevSecOps with IoT - Is it a myth ?
Neel Mitra
WW Specialist Solutions Architect, IoT AWS
https://www.linkedin.com/in/neelmitra/
© 2020, Amazon Web Services, Inc. or its Affiliates.

What you will learn
Ø Insecurity Of Things Ø IoT Edge Computing Overview
Ø Developing on the Edge Ø Securing the Edge
Ø Operating the Edge Ø Demo Ø Getting Started with AWS IoT
© 2020, Amazon Web Services, Inc. or its Affiliates.

Insecurity of Things
© 2020, Amazon Web Services, Inc. or its Affiliates.

The source of data is increasing--coming from billions of edge devices

Veterinary equipment

Security equipment

Thermostat

Drones

Utility

Windfarm

Ttractor

Door lock

Factory

Irrigation

Barn

Lightbulb

Delivery Truck

Animal Management

Camera

Robot

Supply Chain

Soil Sensors Weather Sensors
And more

$1.2 Trillion
IoT spending by:
2022
Source: IDC

Sources: IoT World Solutions Congress Source: Business Insider © 2020, Amazon Web Services, Inc. or its Affiliates.

IoT abuse scenarios

Denial of Service

Lateral threat Information Surveillance

escalation

theft

Sabotage Cryptocurrency Ransomware Malicious

attacks

mining

access point

Cloud infra abuse

© 2020, Amazon Web Services, Inc. or its Affiliates.

IoT solutions are complex & multidimensional

Devices & sensors
Onboard, provision, manage

Connectivity & infrastructure
Connect, communicate,
secure

Analytics & insights
Analyze, visualize,
act

Applications & services
Engage, empower,
delight

Change management
Transform, shift culture

© 2020, Amazon Web Services, Inc. or its Affiliates.

AWS IoT Architecture

© 2020, Amazon Web Services, Inc. or its Affiliates.

IoT Greengrass

AWS IoT customers solve problems in all sectors
© 2020, Amazon Web Services, Inc. or its Affiliates.

Edge Computing Overview
© 2020, Amazon Web Services, Inc. or its Affiliates.

Edge: Is this new?
"A decentralized system is closer to people whom it serves, and responsive to needs ..." ­ P. Berman, Decentralized Again, Datamation, 1970
"Whether to centralize decisions, locations, and functions is long-standing debate driven by organizations" - J.L. King, Centralized versus Decentralized Computing, 1983

AWS Cloud

Mainframe

Corporate data center

© 2020, Amazon Web Services, Inc. or its Affiliates.

Client

Camera

Car

Bicycle

Travel

Factory Windfarm

AWS Cloud to edge

Devices

Gateway

Secure device connectivity and messaging

Gateway

Edge
© 2020, Amazon Web Services, Inc. or its Affiliates.

Cloud

Developing on the Edge
© 2020, Amazon Web Services, Inc. or its Affiliates.

AWS IoT Greengrass
Extend AWS Cloud to the edge

 A

Local messages and triggers
Local message broker

Local actions
Lambda functions

Data and state sync
Local device shadows

Security
AWS-grade security

Local resource
access
Lambdas interact with peripherals

Machine Connectors Over-the-air

learning

updates

inference

Local execution of ML models

Easy integrations Easily update AWS with AWS services, Greengrass core protocol adaptors,
and other SaaS providers

Secure credential
store
AWS Secrets Manager
functionality at edge

© 2020, Amazon Web Services, Inc. or its Affiliates.

AWS IoT Greengrass runs virtually anywhere

AWS Lambda

AWS
... Lambda

AWS Lambda

Docker Container

AWS IoT Greengrass

Docker Container

...

Linux Operating System or derivative (e.g. Ubuntu, Suse Linux, OpenWRT, Raspbian)
Broad Hardware Options (CPU based devices - X86 or ARM architecture)

Docker Container

© 20©2200, 2A0m, aAzmonazWonebWSeebrvSiecervsi,cIensc,.Ionrc.itosrAitfsfiAliafftielisa.tes. All rights reserved. Amazon Confidential and Trademark

AWS IoT Greengrass components
© 2020, Amazon Web Services, Inc. or its Affiliates.

Configuring Lambda for AWS IoT Greengrass -- publish-subscribe
Other Lambda in the group

AWS IoT

topic

topic

Connectors in the group

topic topic

topic

Devices in the group
© 2020, Amazon Web Services, Inc. or its Affiliates.

Local Device Shadow service

Use AWS IoT Greengrass Containers to lift and shift legacy apps

to the Edge

AWS IoT Greengrass

Container Image

Existing Application
© 20©2200, 2A0m, aAzmonazWonebWSeebrvSiecervsi,cIensc,.Ionrc.itosrAitfsfiAliafftielisa.tes. All rights reserved. Amazon Confidential and Trademark

Pull images from multiple sources

Image 1

Amazon Elastic Container Registry

Image 3

Private Docker repository

Image 2

Docker Hub

© 20©2200, 2A0m, aAzmonazWonebWSeebrvSiecervsi,cIensc,.Ionrc.itosrAitfsfiAliafftielisa.tes. All rights reserved. Amazon Confidential and Trademark

AWS IoT Greengrass

Growing the AWS IoT Edge Partner Community
© 20©2200, 2A0m, aAzmonazWonebWSeebrvSiecervsi,cIensc,.Ionrc.itosrAitfsfiAliafftielisa.tes. All rights reserved. Amazon Confidential and Trademark

Securing the Edge
© 2020, Amazon Web Services, Inc. or its Affiliates.

Shared Responsibility Model
© 2020, Amazon Web Services, Inc. or its Affiliates. © 2019, Amazon Web Services, Inc. or its Affiliates. All rights reserved.

Customer responsible for 100% of device security

CUSTOMER DATA APPLICATION CODE NETWORK, OS, FIREWALL SECURITY CLIENT-SIDE AND SERVER-SIDE ENCRYPTION HARDWARE ROOT OF TRUST COMPONENT AND INTERFACES SECURITY PHYSICAL SECURITY AND TAMPER-RESISTANCE
© 2020, Amazon Web Services, Inc. or its Affiliates. © 2019, Amazon Web Services, Inc. or its Affiliates. All rights reserved.

CUSTOMER RESPONSIBILITY

CUSTOMER RESPONSIBLE FOR ENABLING TECHNOLOGY AND CONFIGURE IT PROPERLY
AMAZON WEB SERVICES AND PARTNERS PROVIDE TECHNOLOGY

AWS IoT Greengrass Hardware Security Integration

Private key stored in file
system

IAM role for Greengrass Core

TLS Encryption of messages

Cloud

PKCS#11 API Interface

© 2020, Amazon Web Services, Inc. or its Affiliates.

Device

Authorize AWS IoT Greengrass service role
/greengrass/servicerole
AWS Greengrass Service
Authorize AWS IoT Greengrass to access resources from AWS services on your behalf, such as retrieving AWS Lambda functions and managing AWS IoT shadows.
© 2020, Amazon Web Services, Inc. or its Affiliates.

AWS IoT Greengrass Secrets Manager
Deploy secrets to edge devices
Store, access, rotate, and manage secrets--credentials, keys, endpoints, and configurations Securely manage secrets in the cloud and deploy locally on edge devices Manage secrets on devices through AWS Secrets Manager in the cloud
© 20©2200, 2A0m, aAzmonazWonebWSeebrvSiecervsi,cIensc,.Ionrc.itosrAitfsfiAliafftielisa.tes. All rights reserved. Amazon Confidential and Trademark

Secure with IoT Device Defender
10 01

© 2020, Amazon Web Services, Inc. or its Affiliates.

Security profile

AWS IoT Greengrass @ re:Invent

Video Cameras

On-Premise Data Aggregation

IN
certs/private.key flow
and line data
IN
flow and line data

and line data flow
Cameras

Logic Supply ML350G-10

AWS

mouatn-aogf-ebmanendt

publish data

API Gateway

© 2020, Amazon Web Services, Inc. or its Affiliates.

Operating the Edge
© 2020, Amazon Web Services, Inc. or its Affiliates.

Monitor your fleet

Events
Registry Lifecycle Custom

Cloudwatch CloudTrail

Logs Metrics

API Logs

© 2020, Amazon Web Services, Inc. or its Affiliates.

Over the Air Updates to keep secure
· Remotely update an AWS IoT Greengrass core device with the latest Greengrass software, security updates, bug fixes, and new features
· Enable bulk updates of many AWS IoT Greengrass core devices at once
© 2020, Amazon Web Services, Inc. or its Affiliates.

AWS IoT Greengrass Connectors
· What are connectors?
· Connectivity to AWS services, industrial protocols, local- and cloud-based applications
· Code-free configuration and installation · 12 connectors currently available
· Why use connectors?
· Take away the complexity of calling AWS services or your own systems at edge. Leverage the existing IAM roles and features of GG connectors.
· Store API keys and passwords (for example, Splunk API Key) in local secrets, and leverage in the connectors.
· Less coding = more security!
More connectors to come in Future!
© 2020, Amazon Web Services, Inc. or its Affiliates.

Amazon Kinesis Data Firehose

Amazon Simple Notification Service

AWS IoT Device Defender

Amazon CloudWatch

Modbus RTU Protocol Adapter

Raspberry Pi GPIO

IOT analytics

ML Inference

Serial Stream

Seeing is Believing
© 2020, Amazon Web Services, Inc. or its Affiliates.

Demo - Edge to Cloud Architecture
https://github.com/awslabs/aws-iot-greengrass-accelerators
CloudFormation
© 2020, Amazon Web Services, Inc. or its Affiliates.

DevSecOps for IoT ­ It's not a myth
© 2020, Amazon Web Services, Inc. or its Affiliates.

How to Start with IoT ? https://aws.amazon.com/iot/

Hands-on learning

Training

AWS IoT Greengrass

AWS IoT Core

AWS IoT FreeRTOS Analytics

AWS + MOOCs

The World is Changing

© 2020, Amazon Web Services, Inc. or its Affiliates.

https://www.linkedin.com/in/neelmitra/

Thank You
© 2020, Amazon Web Services, Inc. or its Affiliates.

