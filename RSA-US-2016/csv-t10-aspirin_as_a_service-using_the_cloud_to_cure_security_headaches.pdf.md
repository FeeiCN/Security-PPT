SESSION ID: CSV-T10
Aspirin as a Service: Using the Cloud to Cure Security Headaches
#RSAC

Bill Shinn
Principle Security Solutions Architect Amazon Web Services
Rich Mogull
CEO Securosis @rmogull

#RSAC
Little. Cloudy. Different.
Cloud can be more secure than traditional datacenters.
The economics are in your favor. Cloud architectures can wipe out some traditional security headaches.
This isn't theory, it's being done today.
But only if you understand how to leverage the cloud.
We will show you how.
2

#RSAC
Not the SaaS you're looking for
This session is all IaaS and PaaS
3

#RSAC
Cloud Security Economics

For clients to use a cloud provider, they must trust the provider. This is especially true for anything with a sensitive data or process. Thus security has to be a top priority for a provider or you won't use them. A major breach for a provider that affects multiple customers is an existential event.

You get one chance

4

#RSAC
Cloud Provider Critical Security Capabilities

API/admin activity logging Elasticity and autoscaling APIs for all security features Granular entitlements Good SAML support Multiple accounts per customer

Software defined networking Region/location control
Nice to have: infrastructure templating/automation

5

#RSAC
Evolving the Practice of Security Architecture

Security architecture as a silo'd function can no longer exist.

Current Security Architecture Practice

Static position papers, architecture diagrams & documents
UI-dependent consoles and "pane of glass" technologies

Auditing, assurance, and compliance are decoupled, separate processes
6

#RSAC
Evolving the Practice of Security Architecture

Security architecture as a silo'd function can no longer exist.

Evolved Security Architecture Practice

Architecture artifacts (design choices, narrative, etc.) committed to common repositories
Complete solutions account for automation
Solution architectures are living audit/compliance artifacts and evidence in a closed loop
7

#RSAC
Network Segmentation

#RSAC
Segregation is critical but hard
Segregating networks in a data center is hard, expensive, and often unwieldy.
It's hard to isolate application services on physical machines.
Even using virtual machines has a lot of management overhead.
Attackers drop in and move North/South in application stacks, and East/West on networks (or both).
9

#RSAC
Network segregation by default

Web

XX

a

b

c

Granularity of host firewall with ease of management of network firewall
10

#RSAC
Limiting blast radius

Security Group
Subnet Virtual Network

Security Group

Account
11

Subnet Virtual Network

To a host or network...

Boom

Security Group
Subnet Virtual Network

Security Group

Account
12

Subnet Virtual Network

#RSAC

To a host or network...

Boom

Security Group
Subnet Virtual Network

Security Group

Account
13

Subnet Virtual Network

#RSAC

#RSAC
Or an entire "data center"

Secu rity Grou p
Subnet
Virtual Network

Secu rity Grou p

Account

Subnet Virtual Network

Secu rity Grou p
Subnet
Virtual Network

Secu rity Grou p

Account

Subnet Virtual Network

14

Secu rity Grou p
Subnet
Virtual Network

Secu rity Grou p

Account

Subnet Virtual Network

#RSAC
Or an entire "data center"

Secu rity Grou p
Subnet
Virtual Network

Secu rity Grou p

Account

Subnet Virtual Network

Boom

Secu rity Grou p

Secu rity Grou p

Subnet Virtual Network

Account

Subnet Virtual Network

15

Secu rity Grou p
Subnet
Virtual Network

Secu rity Grou p

Account

Subnet Virtual Network

#RSAC
Traditional blast radius
16

#RSAC
Application segregation
Easier to deploy smaller services Easier to isolate Can integrate PaaS for "network air gaps"
17

#RSAC
Cloud "DMZ"
18

#RSAC
Template
19

#RSAC
Immutable Services Architectures

#RSAC
Managing patches and change
Nothing we deploy is consistent. Even when we become consistent, it's hard to patch live stuff without breaking things. Privileged users log into servers and make changes. Attackers love persistent servers they can compromise and camp inside. Plus, we need to keep the auditors happy.
21

#RSAC
Design to deploy is a mess

Develop Commit

Test

Deploy

Team

Dev

QA Test

Ops

Env

Dev Test

Test

Stag e

Prod

The power of immutable
Instead of updating, you completely replace infrastructure through automation. Can apply to a single server, up to an entire application stack. Incredibly resilient and secure. Think "servers without logins".
23

#RSAC
Image from: http://tourismplacesworld.blogspot.com/2012/07/uluru.html

#RSAC
Automate Creation of Master OS Images

Ops/Server Engineering Requirements
Packer configuration

Git

Security Tests

Jenkins

Test

Master Image

InfoSec Requirements

#RSAC
Demo ­ Server Image Bakery/Factory
Update the desired configuration of a new master OS image Build the master image Test the master image for security controls Make image available for use
25

#RSAC
How immutable works- auto scaling
Load Balancer

a

b

c

Auto Scale Group

26

#RSAC
How immutable works- auto scaling
Load Balancer

a

b

c

Auto Scale Group

27

#RSAC
How immutable works- auto scaling
Load Balancer

a

b

c

Auto Scale Group

28

#RSAC
How immutable works- auto scaling
Load Balancer

a

b

c

Auto Scale Group

29

How immutable works- auto scaling

unpatched

Load Balancer

#RSAC
patched

a

b

c

Auto Scale Group

30

How immutable works- auto scaling

unpatched

Load Balancer

#RSAC
patched

a

b

c

Auto Scale Group

31

How immutable works- auto scaling

unpatched

Load Balancer

#RSAC
patched

a

b

c

Auto Scale Group

32

How immutable works- auto scaling

unpatched

Load Balancer

#RSAC
patched

a

b

c

Auto Scale Group

33

#RSAC
Demo
Rolling update of 40 instances in 4 minutes with 0 downtime.
34

#RSAC
Immutable Infrastructure

Automate with DevOps and Continuous Deployment

Source Code
Cloudformation Templates
Chef Recipes

Functional Tests

NonFunctional Tests

Security Tests

Jenkins
Git
Chef Server

Test

#RSAC
Prod

#RSAC
Immutable Infrastructure
Internet
Single, templated stack
Template A:
37

#RSAC
Immutable Infrastructure
Internet
Launch updated version

Template A:

Template B:

38

#RSAC
Immutable Infrastructure
Internet
Begin diverting traffic via DNS

Template A:

Template B:

39

#RSAC
Immutable Infrastructure
Internet
Rollback or finish, depending on results

Template A:

Template B:

40

Immutable Infrastructure
Internet
41

#RSAC
Template B:

#RSAC
Immutable Infrastructure
Internet
Can still roll back if needed
Template B:
42

#RSAC
Let your PaaS do the work
We deploy many MANY core components to deliver applications.
Load balancers, databases, message queues, and more.
It takes a lot of effort to keep these secure and up to date at scale. Each piece is yet more attack surface.
43

#RSAC
PaaS and "New" Cloud Architectures
PaaS providers can't afford a preventable security failure.
Including letting things get out of date.
Many types of PaaS can't rely on normal networking.
Instead you access them via API.
This creates an opportunity to "air gap" parts of your application.
Kill off network attack paths (doesn't help with logic flaws)
44

#RSAC
Network attack path?
45

#RSAC
PaaS Air Gap
No direct network connection
46

#RSAC
Software Defined Security
Attackers are automated, we are mostly manual. Our tools have been poor. We lack trustable security automation and thus need to rely on a "Meat Cloud" In cloud, APIs are mandatory. We can write code to automate and orchestrate, even across products and services.
47

#RSAC
Code without Coding
Work with your devs to build a library of building blocks Learn just enough to glue it together Build some core scripts Mix and match the blocks Pull in the dev when you have new requirements
48

#RSAC
Demo
Meet SecuritySquirrel, the first warrior in the Rodent Army (apologies to Netflix). The following tools are written by an analyst with a Ruby-for-Dummies book. Automated security workflows spanning products and services.

Incident Response
Detect 1 Compromise
Pull server 2 information (If you
have it)
3 Quarantine

#RSAC

4

Image

5 Analyze

= Hours!

6 Recover

Each step is manual, and uses a different set of disconnected tools

#RSAC
1. Pull metadata 2. Quarantine 3. Swap control to
security team 4. Identify and image
all storage 5. Launch and configure
analysis server 6. Can re-launch clean
server instantly

#RSAC
Stateless Security
Security normally relies on scanning and checking databases. With cloud we are completely integrated into the infrastructure and platforms.
The cloud controllers have to see everything to manage everything, there is no Neo running around.
Instead of scanning, we can directly pull state.
And then use it for security
52

#RSAC
Identify Unmanaged Servers (for the audit)
1 Scan the network 2 Scan again and again for all the parts you missed 3 Identify all the servers as best you can 4 Pull a config mgmt report 5 Manually compare results

#RSAC
1. Get list of all servers from cloud controller (can filter on tags/OS/etc). · Single API call
2. Get list of all servers from Chef · Single API call
3. Compare in code

#RSAC
Event Driven Security
Cloud providers are creating hooks to trigger actions based on events inside the cloud. We can use these for near-instant security reactions.
55

#RSAC
Self-Healing Infrastructure (yes, for real)

Change a security group

Lambda Function analyzes and reverses

Event Recorded to CloudTrail

Passed to CloudWatch Log Stream
56

Triggers an CloudWatch Event

#RSAC
Demo
Watch a security group self heal in less than 10 seconds...
57

#RSAC
Aspirin Applied
Next week you should:
Follow up this session by learning to use Git (or another source repo) and a build pipeline toolchain like Jenkins.
In the first three months following this presentation you should:
Be collaborating with dev/engineering/operations/security on something anything! Even if you just keep basic "account governance" scripts in a repo that people can run, contribute to, track, build into pipelines, etc- have at least one key security capability wired up through a pipeline.
Within six months you should:
Be running audits out of the toolchain for at least a few key controls as they are applied to the cloud.
58

