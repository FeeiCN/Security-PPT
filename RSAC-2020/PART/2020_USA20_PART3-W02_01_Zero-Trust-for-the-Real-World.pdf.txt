SESSION ID: PART3-W02
Zero Trust for the Real World

Nupur Goyal
Zero Trust Product Strategy Microsoft @nupur_11

Carmichael Patton
Zero Trust Security Architect Microsoft / Digital Security, Risk, and Engineering @Xanlythe

#RSAC

#RSAC
Traditional Model

#RSAC
Digital Transformation
2000 2002 2007 2009 2011

#RSAC
Traditional Model

#RSAC
Modern Model

#RSAC
The world has changed

% of organizations
94 5.2 using cloud

7B internetconnected devices in use worldwide

mobile business apps accessed daily by employees
60 %

of organizations currently have a formal BYOD program in place

#RSAC
Old World vs. New World
Employees, partners, customers, bots Bring your own devices and IoT Explosion of cloud apps Composite apps & public restful APIs Perimeter-less Explosion of signal

#RSAC
A new reality needs new principles
Verify explicitly

#RSAC
Zero Trust
A modern approach to security which treats every access attempt as if it's originating from an untrusted network.

Zero Trust ­ Where it all started?

2004
Jericho Forum concept of deperimeterization

2010
Forrester coins "Zero Trust" term

2009
Operation Aurora attack

2014
Google BeyondCorp is published

#RSAC
Zero Trust hype takes off

#RSAC
Making Zero Trust a reality

 Do you know what is Zero Trust?
 Have you established a v-team with your stakeholders?
 Do you know where you are at today with your zero-trust journey?
 Do you have buy-in from C-level?

OPTIMAL

TRADITIONAL

ADVANCED

Download today at aka.ms/ztmodel

Zero Trust architecture

Identities Devices

Identity provider Multi-factor authentication
User/session risk
Device risk & compliance state Device identity

Classify, label, encrypt

Security Policy Enforcement

Adaptive Access
Access & runtime control Threat protection

Visibility and Analytics Automation

IaaS PaaS Int. Sites Containers Serverless

#RSAC
Data
Emails & documents Structured data
Apps
SaaS Apps On-premises Apps
Infrastructure
JIT and Version Control
Network
Network delivery Internal Micro-segmentation

#RSAC
Identities

#RSAC
Identity teams, here is your to-do:

01
Connect all apps for Single Sign On

02
Strong Authentication using Multi-Factor Auth and Risk Detection

03
Enforce Policy Based Access for breach containment

#RSAC
Devices

#RSAC
Device management teams, here is your to-do:

01
Register devices with your management solution

02

03

Implement security baselines & Compliance reporting

Use endpoint threat detection to monitor device risk

#RSAC
Network & Infrastructure

#RSAC
Network & Infra security teams, here is your to-do:

01

02

03

Enable a Cloud Workload Protection solution across your estate: Hybrid and multi-cloud

Use cloud-native controls to create micro-perimeters with real-time threat protection and enhanced visibility and control

Encrypt all traffic and enable Just-in-time, application, network and identity

#RSAC
Application and Data

#RSAC
App and Data security teams, here is your to-do:

01
Perform Shadow IT discovery and a cloud control program

02
Agree on a label taxonomy and classify all documents & emails with the default label

03
Apply real-time protection to high risk scenarios; sensitive data and unmanaged access in apps

#RSAC
Implementing Zero Trust at Microsoft

Zero Trust- Phase 1
· Identity ­ identities are validated and healthy · Device - devices are validated to be managed and
healthy · Service - Health of applications, services, resources,
and connections are verified · Access ­ Network access is routed based on user role
and device · Least privilege access ­ limiting access to only the
applications, services, and infrastructure required to perform job function · Pervasive telemetry ­ understanding your environments, measuring risk reduction, and enabling artificial intelligence for anomaly detection

#RSAC

#RSAC
Core Scenarios

Scenario 1

As an employee, I can enroll my device into modern management system to get access to company resource.

Scenario 2

As an employee or a business guest I have a method to access corporate resources when not using a managed device.

Scenario 3

As a security stakeholder, I have systems in place to route network access based on user type and device role.

Scenario 4

As a security stakeholder, I have the systems in place to proof the device health and user before granting access to the application or service.

Scenario 5

As an employee I have user interface options (portal, desktop apps) that provides the ability to discover and launch applications and resources that I need.

Implementation goals of Zero Trust @Microsoft
· Strong Identity is verified · Access to applications and data limited to minimum required to perform job function
· All devices are enrolled and (modern) managed · Device health is verified · Unmanaged devices and non-FTE have alternative access methods to resources
· Networks built using logical segmentation · Network access is routed based on user and device role
· Applications and services enforcing conditional access · All applications are accessible via Internet by default · Applications and services health is verified
· Employees are only exposed to the applications and resources they can access · Tell the right story to the right audiences · Leverage telemetry to measure user experience · Provide visibility into the overall state of Zero Trust implementation

Pervasive telemetry Least privilege access

#RSAC

Our implementation approach
· Set up all user accounts to use modern identity service · Implement least privilege user rights · Create segmented identities based on role requirement (individual, admin, etc.)
· Implement policy enforcement platform to ensure device health · Implement policy deployment platform to manage devices · Provide indirect access solution to applications or resources from unmanaged devices
· Implement logical network segments · Deploy network access control system · Integrate with policy enforcement platform to validate the health of identity and devices
· Engineer applications to leverage modern auth platforms and libraries · Implement mechanism to evaluate application or service health and execute access decision
based on health · Migrate application access routing from intranet to internet
· Provide a single source of application discoverability tied to user entitlements · Develop comprehensive communications strategy · Develop metrics to measure impact of changes deployed in support of ZT · Develop dashboard which provides visibility into the Zero Trust coverage

#RSAC

#RSAC
Major phases of Zero Trust

Pre-Zero Trust Verify Identity

 Device management not required
 Single factor authenticatio n to resources
 Capability to enforce strong identity exists

 All user accounts set up for strong identity enforcement
 Strong identity enforced for O365
 Least privilege user rights
 Eliminate passwords ­ biometric based model

Verify Device

Verify Access

 Device health required for SharePoint, Exchange, Teams on iOS, Android, Mac, and Windows
 Usage data for Application & Services

 Internet Only for users
 Establish solutions for unmanaged devices

 Device Management required to tiered network access

 Least privilege access model
 Device health required for corporate network

User and Access Telemetry

Verify Services
 Grow coverage in Device health requirement
 Service health concept and POC
(Distant Future)

#RSAC
How are we managing Zero Trust implementation

Identity
Strong Identity Everywhere
Least Privileged Access

Device
Modern Access (Access from
healthy device)
Modern Management (Autopilot, AADJ devices)
Virtualization

Access
Network Security

Service
Applications & Services on Internet
Applications enforcing CA

Experience
Application discovery & launch through Internet
Telemetry
Communications

Vnext and Beyond
Focusing on future of ZT
3rd party product evaluations

Service is Verified
Service health validation

#RSAC
Zero Trust Access Model

Typical `Flat' Network
Spans on-premises & Azure environments

#RSAC

Zero Trust ­ Client Security Transformation
Sponsored Access Event Access BYOD Managed Devices Authenticated Devices
Spans on-premises & Azure environments

#RSAC

#RSAC
Zero Trust ­ Network Segment Transformation

Sponsored Access Event Access BYOD
Managed Devices Authenticated Devices

· Dev/Research Scenarios · Game Studios
Business Critical Segment(s)
Sensitive Business Units/Apps
High Impact IoT/OT
IoT/OT With Life/Safety Impact
Low Impact IoT/OT
Printers, VoIP phones, etc.

Spans on-premises & Azure environments

#RSAC
Key Considerations in getting started
1. Collect telemetry and evaluate risks, and then set goals.
2. Get to modern identity and MFA - Onboard to AAD.
3. For CA enforcement, focus on top used applications to ensure maximum coverage.
4. Start with simple policies for device health enforcement such as device lock or password complexity.
5. Determine your network connectivity strategy

#RSAC
To Learn more
Aka.ms/ZeroTrust
1. Maturity Model White paper 2. Microsoft Implementation of Zero trust 3. Zero Trust Assessment tool

#RSAC
Good luck with your Journey!

