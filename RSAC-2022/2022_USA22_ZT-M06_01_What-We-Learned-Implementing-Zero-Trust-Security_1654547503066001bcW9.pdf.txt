#RSAC

SESSION ID: ZT-M06
What We Learned Implementing Zero Trust Security at Microsoft

Carmichael Patton
Principal Security Architect Microsoft ­ Digital Security & Resiliency @Xanlythe

Yulia Evgrafova
Senior Service Engineer Microsoft ­ Digital Security & Resiliency

Zero Trust can seem...

...big
everything from devices to network security

...noisy
Every firm and analyst has their own definition

Is Zero Trust for me? How do we start? Who do we use?
...confusing
Zero Trust journey looks different for everyone
2

Zero Trust is actually simple:
"In order to trust, you must first verify"
3

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
4

Zero Trust
· Identity ­ identities are validated and healthy · Device - devices are validated to be managed and
healthy · Service - Services, resources, and connections
enforce identity and health requirements. · Access ­ Network access is routed based on user
role and device · Least privilege access ­ limiting access to only
the applications, services, and infrastructure required to perform job function · Pervasive telemetry ­ understanding your environments, measuring risk reduction, and enabling artificial intelligence for anomaly detection
5

Zero Trust benefits everyone

Increases security

Increases productivity

1. Reduce risk of compromised users & endpoints · Deny access from unmanaged/unhealthy devices · Reduce VPN usage / attack surface
2. Improves security visibility · No blind spots for remote devices · Centralized view of risk, policy exceptions, and access requests · Deep insight into device risk and user session activity
3. Provide access only where needed · Network segmentation · Minimize lateral movement

1. Can work anywhere you want · Internet is the default network · Apps & Data available anywhere
2. Single Sign On (SSO) across enterprise apps and services · Sign in once
3. Users guided into a compliant state: · Prompt to increase trust (e.g. MFA) · Limited access to apps/data · Guided steps to enroll devices · Virtualization for unmanaged devices

Increase security and productivity from "Password-Less" authentication
6

Zero Trust Access Model

Internet Edge

Microsoft Cloud 3rd Party
Cloud SaaS apps
On-prem & Legacy apps
7

What makes a healthy device?
Unmanaged devices are a powerful entry point for attackers and present a high risk to the enterprise
8

Core Scenarios
Scenario 1: All authentication to resources requires modern multi factor authentication
Scenario 2: Employees can enroll devices into a modern management system which guarantees the health of the device to control access to company resources
Scenario 3: Segmented networks built to support the required workloads
Scenario 4: Employees and business guests have a method to access corporate resources when not using a managed device
Scenario 5: Applications and services built with mechanisms that enforce device health check
9

Implementation goals of Zero Trust @Microsoft 2022+
· Strong Identity is verified · Access to applications and data limited to minimum required to perform job function
· Client device health is enforced · Unmanaged devices and non-FTE have alternative access methods to resources · Users do not have administrative permissions on client devices · Reduce dependency on CorpNet · Network Access Controls are enforced
· Applications and services enforcing conditional access
· Derive compliance & security state of Zero Trust controls, at enterprise scale to determine controls, policies and actions needed
· Tell the right story to the appropriate internal audiences · Showcase the Microsoft implementation as a Zero Trust model for the industry · Leverage telemetry to measure user experience · Provide visibility into the overall state and progress of the Zero Trust implementation
10

Zero Trust Progress

Pre-Zero Trust

Verify Identity

Verify Device

Verify Access

Verify Services

 Device management not required
 Single factor authentication to resources
 Capability to enforce strong identity exists
 Data classification and Information protection

 SAW enforcement for admin access scenarios
 Migration from onprem AD to AAD identities through O365 Migration.
 100% of user accounts enforcing MFA

 100% of Windows, iOS , Android & MAC devices are under management and enforcement
 All new devices defaulting to AADJ via Autopilot
 Device health enforcement in progress

 Internet available as default in all MSFT office locations in progress
 Corpnet dependent telemetry created
 Network segmentation infrastructure creation

 Applications & Services accessible directly from Internet in progress
 MFA enforced for O365 access

11

Programmatic Overview
ZT Microsoft Steering Committee (meets monthly)

ZT Internal Implementation Team
Quarterly Sync ups Monthly sync ups Weekly sync ups

ZT Microsoft Product Marketing team
ZT Product Marketing lead Monthly sync ups

Weekly sync ups on issues blocking adoption

ZT Microsoft Product team
ZT Product Strategy lead

12

Managing the Zero Trust implementation

Scenarios-> Goals->Workstreams owned by various sub-organizations Resulted in multiple programs reporting under ZT Zero Trust is company-wide effort

Identity
Strong Identity Everywhere
Least Privilege Access

Device
Modern Access (Access from
healthy device)
Modern Management
(Autopilot, AADJ devices)
Virtualization

Access
Network security Network
segmentation Internet as the
default network

Service
Applications & Services on Internet
Applications enforcing CA

Experience
Application discovery & launch
through Internet
Telemetry
Communications

VNext & Beyond
Focusing on future of ZT
3rd party product evaluations

No admin
Run as local user on device
13

14

Key Considerations
1. Collect telemetry and evaluate risks, and then set goals. 2. Get to modern identity and MFA - Onboard to AAD. 3. For CA enforcement, focus on top used applications to ensure maximum coverage. 4. Start with simple policies for device health enforcement such as device lock or password
complexity. 5. Run pilots and ringed roll-outs. Slow and steady wins the race. 6. Migrate your users to the Internet and monitor VPN traffic to understand internal
dependencies. 7. Focus on user experience as it is critical to employee productivity and moral. Without
adoption, your program will not be a success. 8. Communication is key....bring your employees on the journey with you! 9. Assign performance indicators and goals for all workstreams and elements... including
employee sentiment.
15

We want to hear from you!
 Read about how we are implementing a Zero Trust Model at Microsoft at aka.ms/ZTatMSFT
 Stay connected with us and send feedback to MSZT@Microsoft.com
16

