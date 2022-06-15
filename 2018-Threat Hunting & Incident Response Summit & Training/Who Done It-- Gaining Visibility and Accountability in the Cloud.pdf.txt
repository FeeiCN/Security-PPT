Who done it:
Gaining visibility and accountability in the cloud
By Ryan Nolette
Squirrel Edition

$whoami
10+ year veteran of IT, Security Operations, Threat Hunting, Incident Response, Threat Research, and Forensics
GitHub
­ https://github.com/sonofagl1tch
Career highlight
­ Time's person of the year 2006
What am I giving away? A full detonation lab built automatically by cloudformation
­ https://github.com/sonofagl1tch/AWSDetonationLab

Agenda
· Overview
· Who did what and when? · Common Techniques · Common Visibility Tools and Their AWS Equivalent
· Increasing visibility until you have accountability
· Common Logging
· Authentication · Endpoint · Network · Vulnerabilities · Configuration
· End to end example
· Detonation Lab · Logging Pipelines and Services
· Finding What Matters

Who did what and when
· These are the 3 pillars of each stage of scoping the event · Will be modified for each iteration · The analysts should be able to start at any of the stages and complete the cycle

Common Techniques
What's Their Goal?
· OS hardening · Config management · Identity Management · Process monitoring

Common Visibility Tools and Their AWS Equivalent

Traditional Tool
IDS/IPS DLP EDR Netflow DNS Access and authentication auditing Active Directory Identity Management Single Sign On Vulnerability scanner Configuration Management Logging

AWS equivalent
guardDuty Macie Cloudwatch + osquery, GRR Cloudwatch + VPCFlow Cloudwatch + Route53 CloudTrail Directory Service IAM AWS SSO Inspector AWS config Cloudwatch + Firehose + Lambda

Increasing visibility until you have accountability

The process of asking who did what and when and increasing logging and controls until you can answer those

questions for every scenario you can think of.

OS hardening Logging

Authentication Endpoint

Network

Vulnerabilities/ Configuration

· CIS guidelines · Common · /var/log/secure · EDR

· IDS

· Generic vuln

audit and

logging like · IAM logs

· HIDS

· Netstat

scanner

hardening

auth logs · IAM roles

· Cloudwatch · Tcpdump

· Inspector

scripts.

and process · IAM policies · GuardDuty · Vpc flow logs · NVD/CVE usage

· Additional

creation etc

· Dns route 53 · Aws config

logging and

logs

· OS hardening

hardening

· Applications

scripts created

config

by experience

over time.

End to end example

Always Squirrel away your logs

DevOps Installs new tool that is
backdoored with a CryptoMiner

Static defense controls do not stop miner installation

SecOps remains vigilant

SecOps Defends

Detonation Lab Topology

Pipelines

CloudFormation
CloudFormation allows you to use a simple text file to model and provision, in an automated and secure manner, all the resources needed for your applications across all regions and accounts.

S3
Amazon S3 is object storage built to store and retrieve any amount of data from anywhere

VPC
Amazon Virtual Private Cloud (Amazon VPC) lets you provision a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network that you define.

VPC Flow - Kinesis Stream
Amazon Kinesis Data Streams (KDS) is a massively scalable and durable real-time data streaming service. KDS can continuously capture gigabytes of data per second from hundreds of thousands of sources such as website clickstreams, database event streams, financial transactions, social media feeds, IT logs, and location-tracking events.

Lambda
AWS Lambda lets you run code without provisioning or managing servers. You pay only for the compute time you consume - there is no charge when your code is not running.

Firehose
Amazon Kinesis Data Firehose is the easiest way to reliably load streaming data into data stores and analytics tools.

IAM
AWS Identity and Access Management (IAM) enables you to manage access to AWS services and resources securely. Using IAM, you can create and manage AWS users and groups, and use permissions to allow and deny their access to AWS resources.

CloudTrail
AWS CloudTrail is a service that enables governance, compliance, operational auditing, and risk auditing of your AWS account. With CloudTrail, you can log, continuously monitor, and retain account activity related to actions across your AWS infrastructure.

Macie
Amazon Macie is a security service that uses machine learning to automatically discover, classify, and protect sensitive data in AWS.

Inspector
Amazon Inspector is an automated security assessment service that helps improve the security and compliance of applications deployed on AWS.

CloudWatch Event Rules and Logs
Amazon CloudWatch is a monitoring and management service built for developers, system operators, site reliability engineers (SRE), and IT managers.

GuardDuty
Amazon GuardDuty is a threat detection service that continuously monitors for malicious or unauthorized behavior to help you protect your AWS accounts and workloads.

Wazuh

Wazuh is a free, open-source hostbased intrusion detection system (HIDS).

Mappings

Simple Dashboards

Finding what matters
External Traffic Destinations
China
Massive spike in traffic to china

Traffic volume by destination IP
Most common destination

Finding what matters
Most common destination
Logs with Destination

Ec2 Instance involved
Hostname of findings
All Guardduty Findings for instance

Finding what matters
Most common destination

File responsible for outbound connection

VT Results
fb7791757901a24800f67f0f950b281d 4f7c79d247490ce12b159b1cef9832e6039513b9 1e2f03917015b52c71432ffd382e0ee970d551eebf9457b2498b1434ce8ab466

How did they get in?

Recap

Traditional Tool AWS equivalent

IDS/IPS

guardDuty

DLP

Macie

EDR

Cloudwatch + osquery, GRR

Netflow

Cloudwatch + VPCFlow

DNS

Cloudwatch + Route53

Access and authentication a CloudTrail

uditing

Active Directory

Directory Service

Identity Management

IAM

Single Sign On

AWS SSO

Vulnerability scanner

Inspector

Configuration Management AWS config

Logging

Cloudwatch + Firehose + La

mbda

Personal
Attacker Life
cycle

Flag it, Tag it, and Bag it.

