Netskope Introduction

2017 © Netskope. All rights reserved.

Introductions and Agenda
· Introductions ­ roles / responsibilities · Cloud services you're using · Netskope overview · Product demo · Q&A / Next steps
Name Thomas Hedströmmer Title Sr. SE Cloud Security Email thomas.hedstrommer@netskope.com

2017 © Netskope. All rights reserved.

3

Your Cloud Usage and Concerns
Cloud Services in Use or in Plan?

Data in the Cloud?

PCI PII

Intellectual Property

Design Documents PHI

Cloud Service Access (Who, Where, and How)?

Regulations, Standards, Other Requirements?

HIPAA

GLBA

PCI-DSS

GDPR FINRA

2017 © Netskope. All rights reserved.

4

Securing the Cloud
Top Cloud Security Concerns
Shadow IT Risk of unapproved use
of cloud services
Regulatory Aligning cloud service use with regulatory requirements
Data Exposure Risk of sensitive data loss via cloud services
Cloud Threats Cloud services as targets
and as attack vector

Gartner's Four Pillars of CASB
VISIBILITY
COMPLIANCE
DATA SECURITY
THREAT PROTECTION

2017 © Netskope. All rights reserved.

5

Sanctioned

Growth in Enterprise Cloud Services

95% driven outside of IT

1,031

917
Average number of cloud services in use
Netskope Cloud Report, 2014 ­ 2017

613 397

70% Business-led

Mostly Unsanctioned

25% User-led

2014

2015

2016

2017

2017 © Netskope. All rights reserved.

6

How Users Access Cloud Services

User locations and access methods determine appropriate CASB architecture

Web Browser

Sync Client

Mobile App

App Ecosystem

HQ

Branch

Remote, Mobile, "Direct to Cloud"

2017 © Netskope. All rights reserved.

7

Common Netskope Use Cases

Sanctioned Services

Unsanctioned Services

Cloud Threats

1 Discover all cloud services in use and assess risk

3 Prevent data exfiltration to unsanctioned apps ... ... and app instances

5 Allow, don't block popular cloud apps like social media

2 Safely enable sanctioned cloud services

4 Apply policies based on location and device type

6 Detect and remediate malware across all cloud services

HQ and branch offices

Remote, mobile, "direct to cloud"

2017 © Netskope. All rights reserved.

8

Netskope Solution Overview

Sanctioned Services

Unsanctioned Services

Cloud Threats

Discovery and risk assessment Granular policy control Advanced, enterprise DLP
Log-based discovery API connector

SSL Decryption at Scale All Mode Architecture

Cloud data encryption Anomaly detection and UBA
Advanced threat protection
Reverse proxy Forward proxy

HQ and branch offices

Remote, mobile, "direct to cloud"

2017 © Netskope. All rights reserved.

9

Getting Started with Netskope

Requirements Workshop

Cloud Risk Assessment

Active Platform Proof of Concept

· Two hour whiteboard session and / or Webex session
· Identify key CASB use cases
· Align key use cases with CASB requirements ­ deployment mode(s), integrations, etc.

· Complimentary service
· Analysis of log data from existing security tools
· Secure, dedicated Netskope tenant instance
· Executive summary of cloud service usage, data movement, and risk factors

· Deploy Netskope client to gather deeper context on cloud usage
· Use Netskope DLP to show sensitive data movement
· Define granular policies to address risky behavior

Production Deployment
· Netskope Discovery and Cloud Confidence Index
· API Introspection for Sanctioned Cloud Services
· Netskope Active Platform to Govern All Cloud Services and Data

2017 © Netskope. All rights reserved.

10

Customers
FINANCIAL

RETAIL/HOSPITALITY

HIGH TECH

MANUFACTURING

GOVERNMENT

UTILITY

HEALTHCARE/LIFE SCIENCES OIL & GAS OTHER

2017 © Netskope. All rights reserved.

11

Thank You!
Thomas Hedströmmer Thomas.hedstrommer@netskope.com

2017 © Netskope. All rights reserved.

12

Team  350+ employees globally, including North America, Europe, and Asia-Pacific  Early architects/founders from Palo Alto Networks, NetScreen, Cisco, McAfee, VMware  First comprehensive CASB patents. 40+ patent claims across four categories
Partners  Strong technology integration and services partnerships

The leader in cloud security
Investors  $131.4M from top Silicon Valley VCs  Early investors in Atlassian, Box, Cloudera,
Nimble Storage, Yammer

2017 © Netskope. All rights reserved.

13

Leading Companies Using Netskope

The Fortune 1

The top automaker in the world

Top 3 global hotel chain

3 of the top 5 global retailers

The most valuable bank in the world

Top 3 U.S. oil and gas company

Largest equipment manufacturer in the world

The largest insurance company in the world

Top 3 global apparel manufacturer

2017 © Netskope. All rights reserved.

14

Discover All Cloud Services in Use and Assess Risk
Functional requirements
· Find all cloud services in use · Report on cloud service enterprise-readiness
using 45+ criteria · Assess risk based on cloud service readiness
coupled with cloud usage and user behavior · Compare and consolidate redundant services
Architectural considerations
· Out-of-band options include logbased discovery and TAP mode
· Forward proxy modes provide deeper context for advanced discovery

2017 © Netskope. All rights reserved.

16

Safely Enable Sanctioned Cloud Services
Functional requirements
· Identify sensitive data in sanctioned services · Understand how cloud service and data is
being used
­ Data shared publicly or outside of company? ­ Inappropriate access by internal users?
· Protect against malware
Architectural considerations
· Can be deployed with out-of-band API connector
· Inline options for real-time visibility and control

2017 © Netskope. All rights reserved.

17

Prevent Data Exfiltration to Unsanctioned Apps and App Instances
Functional requirements
· Visibility into activities across sanctioned and unsanctioned cloud services
· Ability to differentiate cloud service instances
­ For example, corporate Box instance vs. personal Box instances
· Detect sensitive data across all cloud services · Correlation of events across multiple cloud
services
Architectural considerations
· Granular control of unsanctioned cloud services requires forward proxy

2017 © Netskope. All rights reserved.

18

Apply Policies Based on Location and Device Type
Functional requirements
· Determine source and destination locations of cloud service usage
· Ability to classify device type · Coverage of all access methods
­ Browser, sync client, and mobile app
· Apply granular policies based on location, device classification and access method

Architectural considerations
· Must be deployed inline using forward or reverse proxy

2017 © Netskope. All rights reserved.

19

Allow, Don't Block Popular Cloud Apps like Social Media
Functional requirements
· Support for category-level policies such as `social media'
· See activity-level detail across all cloud services
· DLP engine that can identify specific content tied to activities in unsanctioned cloud services
· Use context including activity and data to define policies that carve out specific risky activities
Architectural considerations
· Granular control of unsanctioned cloud services requires forward proxy

2017 © Netskope. All rights reserved.

20

Detect and Remediate Malware Across All Cloud Services

Functional requirements
· Multi-layered detection engines
­ Static AV, heuristic, dynamic analysis, and more
· Detect malware in real-time en route to and from any cloud service
· Inspect sanctioned cloud services for malware · Automated remediation capabilities to
quarantine detected malware and reverse malware fan-out effect
Architectural considerations
· API connector for sanctioned services · Forward proxy required for real-time
inspection across all cloud services

2017 © Netskope. All rights reserved.

21

Netskope Context Engine

2017 © Netskope. All rights reserved.

22

Comparing CASB Architectures

Cloud Service Discovery

Secure Sanctioned Cloud Services

Govern Sanctioned and Unsanctioned Cloud Services

Explicit Proxy/PAC
DNS

Proxy Chaining
Agent / Mobile Profile

· Out-of-band deployment
· Provides high-level visibility into cloud service usage
· No cloud service policy control
· Couple cloud service discovery with cloud service risk assessment

· API Introspection - Secure sanctioned cloud services with near real-time content inspection and policy control
· Reverse Proxy - Real-time policy control for sanctioned cloud services - Only covers browser access

· Real-time policy control for all cloud services
· Visibility into remote and mobile, "direct-to-cloud" traffic
· Covers browsers, mobile apps, and sync clients

2017 © Netskope. All rights reserved.

23

Use DLP to stop Personal Information Entering the Cloud

2017 © Netskope. All rights reserved.

In this example a file containing Swedish Person nr has been dragged & dropped into Box.
24

Use DLP to coach users when they are trying to upload confidential materials

2017 © Netskope. All rights reserved.

In this example a file containing Netskope Internal Only has been dragged & dropped into Box.
25

