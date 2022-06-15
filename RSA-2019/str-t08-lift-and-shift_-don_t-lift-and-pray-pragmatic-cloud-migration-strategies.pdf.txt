SESSION ID: STR-T08
Lift and Shift, Don't Lift and Pray: Pragmatic Cloud Migration Strategies

Rich Mogull
Analyst/CEO Securosis VP of Product DisruptOps rmogull@securosis.com

#RSAC

#RSAC
Reality Bites
There is relentless pressure to move to cloud
Nearly all published best practices are designed for clean builds, not migrations
Some of the "best practices" for migrations are really cloud antipatterns, but are pushed to make it look easy/fast
2

#RSAC
A Gilded Age of Lift and Shift
The migration of all or some of an existing application stack(s) from an on-premise deployment to a public cloud provider. This does not include migration to a remote datacenter The application architecture itself is irrelevant (new/old/anything counts)
3

#RSAC
Why Lift and Shift?

Leverage Existing Investments

Pressure to Vacate
Datacenters
4

Limited Resources for
New Builds

Perils
Greater Costs
· Can't optimize for cloud · Little to no elasticity · OpEx/manual management
Less Reliable · Fragile architectures · Manual DR · Can't leverage inherent
cloud resiliency
5

#RSAC
Less Secure
· Little or no immutable · Tied to legacy security model · Often manual management (no
automation)
Less Agile · Can't leverage many cloud
capabilities · Tied to manual processes
for maintenance and updates

#RSAC
Lift and Shift Options

Rearchitect
Start from scratch (or close to it)

Refactor
Modify what you can and improve
over time
6

Rehost
Just move it

#RSAC
Lift and Shift Options

Rearchitect
Start from scratch (or close to it)

Refactor
Modify what you can and improve
over time
7

(Lift and Pray)
Just move it

Constraints and Complexities
COTS
Skills and Staffing
Network Constraints
(Including hybrid)
8

#RSAC
Resiliency Constraints
Dependencies
(e.g. databases, directory servers)
Service Limits

Rearchitect
Completely redesign the application stack
­ Or cleave off part of it for a redesign
Implement cloud-native from scratch (if needed) Often done in parallel with one of the other options Best in the long term, but often not an option
9

#RSAC
Big Data Analytics

#RSAC
Rearchitect
· Serverless (mostly) · Immutable · Event-driven · Small attack surface · Cost-effective · Leverages existing
analytics code

Refactor
Take the existing stack, change what you can, live with the rest
­ Use a dedicated account/subscription/project ­ Replace easy-to-swap components like load
balancers ­ Leverage autoscaling if possible, but config
management if not ­ (more to follow)
You work within the existing application's constraints but go as cloud-native as possible Frequently the most-balanced option
11

#RSAC
COTS CMS/Website

#RSAC
Refactor

·

10X Added limited auto
scaling

Cost

Savings

+

Better

· Shimmed file system

Security and Much Better to object storage
· Use PaaS database

· Segregated network · Isolated account

Resiliency

securosis.com

12

Rehost
"Lift and shift" in the purest sense
­ No architectural changes ­ Typically put into a network that replicates on-prem
datacenter ­ Security controls also lifted and shifted
Most projects run into significant constraints within 2-3 years
­ IAM and service limits the biggest culprits
Results in anti patterns being used Recommended all too often
­ Cloud providers just want the workloads as fast as possible
­ Many consultants love the big projects
13

#RSAC

#RSAC
Lift and Pray
Network materially harder to secure Security tool dependencies often expand attack surface IAM extremely difficult to constrain
­ It's like giving everyone their own keys to the datacenter
Brings all the old security problems Creates a large blast radius You will fail cloud-specific security audits Service limits will inhibit proper cloud security operations Incident Response harder and often not fully prepared before migration BCP/DR ugly and expensive
14

#RSAC
Lift and Pray
Network materially harder to secure Security tool dependencies often expand attack surface
IAM extremely difficult to constrain
­ It's like giving everyone their own keys to the datacenter
Brings all the old security problems Creates a large blast radius You will fail cloud-specific security audits
Service limits will inhibit proper cloud security operations
Incident Response harder and often not fully prepared before migration BCP/DR ugly and expensive
15

#RSAC
How to Choose

Rearchitect

Refactor

Rehost

When you have the time When you can't

When you don't have a

rearchitect right away

choice

When you have the When you have a mix of

people and skills

people and skills

When you have a backup plan

When you can use it to learn and rebuild your
program Also a great option in
parallel

When you can balance

Or

security using isolation

When you are able to When you know you have a

iterate over time

better job in <18 months when it crashes :)

16

How to securely lift and shift

#RSAC
The Roadmap

1. Analyze app dependencies and current security
2. Isolate/compartmentalize
3. Match infrastructure to the app
4. Implement true least privilege network
5. Lock down IAM
6. Turn on native security controls/tools

7. Integrate PaaS/refactor
8. Build/integrate shared security services
9. Set guardrails
10.Codify into infrastructure as code
11.Determine your expiration date

18

#RSAC
Analyze app dependencies and security

Map out app + infrastructure

COTS Databases, storage, data warehouse OS/config Network connectivity Network filtering/IDS/IPS/WAF EPP/host security agents Logging/monitoring DR/BCP Metastructure (e.g. directory servers, IP addresses, DNS, key management) Privileged user access/change management/deployment pipeline (or not) Sessions and load balancers

19

#RSAC
Isolate/compartmentalize

Security Group
Subnet Virtual Network

Boom
Security Group
Subnet Virtual Network
Account

Dev

Security Group
Subnet Virtual Network

Security Group
Subnet Virtual Network Account
Test

Security Group
Subnet Virtual Network

Security Group
Subnet Virtual Network Account
Prod

2-3 accounts/projects/subscriptions per project/app stack

20

#RSAC
Transit Networks
Not a panacea, use only when required
21

#RSAC
Match the infrastructure to the application
Minimum required network Minimum required services Reduce external dependencies as much as possible Hybrid when required, not as a default
22

Real World Example
Presenter's Company Logo ­ replace or delete
on master slide

#RSAC

#RSAC
Implement a least privilege network

Web

XX

a

b

c

When assessing lift and shift projects this is unfortunately usually the exception, not the rule
24

#RSAC
Lock down IAM
Root Account
Super-Admin

EC2 Service Admin

S3 Service Admin

RDS Service Admin

Dev

App Admin

After an overly-flat network this is the most common mistake I see in assessments
25

#RSAC
Turn on native security controls/tools
Admin/API logs (CloudTrail, Audit Logs, Stackdriver) Threat intel/security center (e.g. GuardDuty, Azure Security Center) Assessment (Trusted Advisor, Azure Security Center, Cloud Security Command Center) Vulnerability assessment (Inspector) Other logs (service dependent, e.g. VPC Flow Logs, Stackdriver) DDoS/WAF Encryption Access controls Event-driven alerting ...etc...
26

PaaS/Refactor
Presenter's Company Logo ­ replace or delete
on master slide

#RSAC

#RSAC
Build Shared Security Services
Logging/Monitoring/Alerting Federated IAM Incident Response Vulnerability management NOT
­ Standard netsec (can use building blocks but should be specific to app needs)
­ Standard host security controls
See: Immutable
28

#RSAC
Set Guardrails

Guardrails
Continuously assess and enforce operational and
security policies
Fix security group or S3 misconfigurations

Workflows
Streamline and accelerate IT operations
and security through automated workflows
Incident response
29

Orchestrations
Empower new capabilities through advanced orchestration
of infrastructure, operations, and security
Automatic WAF insertion and configuration

#RSAC
Guardrails

 Define and set limits


 Can be "allow" or "deny"


 Find deviations


 Assessment or event based


Find

 Evaluate the issue


 Fix/remediate

Eval
 Automatically or manually depending on rules Fix

30

#RSAC
Examples

· If you find a public S3 bucket, restrict it to our known network addresses

· Unless it is approved or tagged

· Don't allow internal security groups with all ports and protocols open in Prod

· But allow in Dev

· Require MFA for API access for any user that needs MFA for console access

· Create our baseline IAM policies and roles for all new accounts

· Based on the environment

· Validate that monitoring and alerting is properly configured
· And fix if not
· Disable access keys that haven't been used in 90 days
· Find instances with an IAM role that allows power user or greater access via API
· Restrict the privileges
· Identify all cross-network peering from accounts we don't own
· Then check the security group permissions

31

#RSAC
Codify with infrastructure as code
32

#RSAC
Determine expiration date
Most lift and shifted projects should not be considered permanent Refactoring is an ongoing process Rebuilding in parallel is often an excellent long term option
33

Antipatterns

#RSAC
Top design errors
Single account Forcing the application into a standard or crowded network Using traditional security tools instead of native due to lack of trust or understanding Not planning for service limits Requiring hybrid and defaulting to transit networks. Every time.
35

#RSAC
Top implementation errors
Flat networks Overly-open IAM Any-any rules Improper native tool configurations Treating security groups like firewalls
36

#RSAC
Top security program errors
No cloud-specific IR No cloud-specific alerting (time delays) No guardrails Trying to fix after implementation Not monitoring the management plane Ineffective or untested DR
37

#RSAC
Apply
Next week you should:
­ Identify a self-constrained lift and shift project ­ Or an existing project to update
In the first three months following this presentation you should:
­ Build your selection and strategy matrix for which pattern to use ­ Identify at-risk projects that used antipatterns (e.g. "a big cloud account with a lot
of different projects inside)
Within six months you should:
­ Begin using isolated environments for all new migrations ­ Build out shared services and operational plans to support new migrations ­ Develop a strategy for reviewing and repairing previous at-risk projects
38

SESSION ID: STR-T08
Lift and Shift, Don't Lift and Pray: Pragmatic Cloud Migration Strategies

Rich Mogull
Analyst/CEO Securosis VP of Product DisruptOps rmogull@securosis.com

#RSAC

