SESSION ID: CSV-W05R
CLOUD SECURITY ESSENTIALS 2.0
Full Stack Hacking & Recovery
#RSAC

Shannon LIetz
Director, DevSecOps & Security Eng Intuit @devsecops
Javier Godinez
Principal DevSecOps Architect Intuit

#RSAC
Overview
A Basic Introduction ­ Cloud Hack Lab Attack Harness, Enumeration and Testing Tools Cloud Forensics at Scale Opportunities for Tools
2

#RSAC
The Basic Cloud Model

Cloud Account(s) Cloud Provider Network

Internet

Backbone Backbone

VPCs
Load Balancers
Compute Instances
Block Storage

Content Acceleration
Containers
Messaging
Object Storage

Utilities
Key Management
Email
Relational Databases

API/Templates
Certificate Management
Partner Platform
NoSQL Databases

Cloud Platform (Orchestration)

Network

Compute

Storage

3

Data Center

Data Center

#RSAC
Reality...
Internet
4

Cloud Provider Network Cloud Provider Network

Cloud Provider Network

Cloud Provider Network

Cloud Provider Network

#RSAC
5

#RSAC
Attack Surface is Much Less Obvious
6

Cloud Provider Network

Cloud Provider Network

Data Center

#RSAC
Cloud Hack Lab
7

#RSAC
Cloud Hack Lab Demo
8

#RSAC
Blast Radius is a real thing...
9

#RSAC
Direct Connections/VPNs to Clouds are evil!

Data Center Cloud Provider Network

PUBLIC SUBNET APP

What do you mean the IP could change?

No IDS?

SOFTWARE VPN MANAGED VPN
PRIVATE

PUBLIC SUBNET APP

DATABASE

VPN

10.0.0.0/8

Connected & Routable?

DATABASE

Remote Access

Tags? Security Groups? SDE?

Cloud Web Console API Credentials

"NEW" BOUNDARY HAS ALL THE WEAKNESSES OF BOTH AND MIXES TWO DIFFERENT SECURITY MODELS!
10

Cloud Lateral Movement ...
An Application vulnerability can lead to a Cloud Account Takeover Most apps require traditional defense in depth which doesn't apply to cloud apps Baselines are really important and drift management essential
11

Remote Shell
Vulnerable App
Create Instance/Role /User

Cloud Account

#RSAC
Account Takeover

#RSAC
Beware of Orchestrators...

Cloud Account Cloud Account Cloud Account Cloud Provider Network

Orchestration creates blast radius because it centralizes the deployment/security for cloud workloads. Tools that act on behalf usually require credentials and create blindspots. Non-native tools require specialized skills and make it difficult to gain context on what the right behavior should be.

A

B

C

What's normal?

secrets

Cloud Orchestration Platform

12

MFA is a MUST!
Passwords don't work. Passwords aren't enough to protect infrastructure. API Credentials and Roles can be misappropriated Most Cloud Environments and Apps have one level of access On some cloud platforms it is possible to make roles work only when MFA is provided and for certain actions to require MFA
13

#RSAC

Implement cloud template... API Credentials accepted... Please input your MFA token: XXXXXX (123456) Cloud stack 123 has been implemented.

Phishing can be detrimental

123456

MFA can be applied to Accounts and some api calls

Selfie for Forensics
Full Account Snapshot (Roles, Instances, Managed Services)
Used to determine what happened along with Audit Trails
Ability to clone and perform sandbox analysis

#RSAC

Cloud Account Cloud Account Cloud Account Cloud Provider Network

A

B

C

Cloud Account Snapshot Selfie

14

#RSAC
Cloud Forensics Demo
15

#RSAC
Missing Tools of the Trade
Enumeration tools for API discovery and drift detection are few and far between Scanners are missing Cloudy capabilities, ie. Credential Discovery, API Integrations, Pathway Enumeration Varying levels of resources and 3rd party add-ons create visibility challenges Permissions are not granular enough and role inheritance is missing Hard to create coarse grained controls to allow for innovation Network monitoring and controls are not easily passed to cloud customers

#RSAC
Cloud Security is a Big Data Challenge...

DevOps + Security is the biggest big data challenge ahead. Use Attack Models and choose the right Data Sources to discover attacks in near realtime. Develop a scientific approach to help DevOps teams get the security feedback loop they have been looking for.
17

· Web Access Logs · Java Instrumentation · Proxy Logs · DNS Logs

#RSAC
Cloud Security Feedback Loop

Cloud accounts
EC2 CloudTrail

S3

ingestion

Glacier

threat intel
security tools & data 18

security science

insights

#RSAC
Security as Code... gotta do it.
19

#RSAC
Apply what you learned today...
Next week you should: Understand how your organization is or plans to use cloud providers Identify cloud workloads and virtual blast radius within your organization
In the first 3 months following this presentation you should: Begin to build Security as Code skills and run cloud security experiments to understand the issues Develop Crawl-Walk-Run plans to help your organization build security into cloud workloads
Within 6 months you should: Cloud workloads have been instrumented for known security issues and flagged during the Continuous Delivery of software to the cloud Your group has begun to test using Red Team methods and automation to ensure end-to-end security for your cloud workloads Remediation happens in hours to days as a result of automation
20

Get Involved &

#RSAC

Join the Community

devsecops.org @devsecops on Twitter DevSecOps on LinkedIn DevSecOps on Github RuggedSoftware.org Compliance at Velocity
Join Us !!! Spread the word!!!
21

