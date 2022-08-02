SESSION ID: IDY1-RO7
Build Your Own IDaaS: Lessons From Year One

Sean Farrell
Lead Identity Engineer Thomson Reuters

Jon Lehtinen
Director Identity Engineering Thomson Reuters @jonlehtinen

#RSAC

#RSAC
The views and opinions expressed here are those of the presenters and do not necessarily represent those of Thomson Reuters, it's subsidiaries, or any of its affiliates.

#RSAC
Build Your Own IDaaS ­ Why?

#RSAC
Three Pillars of Perfect IDaaS
Strong federation support
­ OAuth2, OpenID Connect, SAML2 ­ SCIM/SCIM2
Automation, low-effort ops
­ Patching, scaling, fail-over, DR
Developer support for the last mile
­ Integration kits, shims, dev guides
4

Three Four Pillars of Perfect IDaaS
Strong federation support
­ OAuth2, OpenID Connect, SAML2 ­ SCIM/SCIM2
Automation, low-effort ops
­ Patching, scaling, fail-over, DR
Developer support for the last mile
­ Integration kits, shims, dev guides
5

#RSAC
Photo by Fabian Blank on Unsplash

#RSAC
BYOIDaaS: Improve UX for Users & Devs
Multiple usernames
­ t212360886 ­ \domain\t212360886 ­ jon.lehtinen ­ 212360886 ­ jon.lehtinen@tr.com
Multiple logon experiences Proprietary authentication protocols
6

#RSAC
BYOIDaaS: Global Availability

Photo by Aaron Burson on Unsplash

7
Photo by Ed Robertson on Unsplash

Photo by Ashish Allam on Unsplash

#RSAC
BYOIDaaS: Retain Customizability
IDaaS heavily assumes SaaS footprint Business does not bring in Security until late in the process
­ Misalignment of Security strategy to Business fire drills
Spin novel solutions to complex business challenges
8

#RSAC
BYOIDaaS: Touchless/Automated
9
Photo by Billy Pasco on Unsplash

BYOIDaaS: Compared to Other Options

On-prem

Cloud-hosted

IDaaS

Customizable

Strategic
Globally available
Operational effort
Cost
10

#RSAC
BYOIDaaS

BYOIDaaS: Compared to Other Options

On-prem

Cloud-hosted

IDaaS

Customizable

Strategic
Globally available
Operational effort
Cost
11

#RSAC
BYOIDaaS

#RSAC
Architecture

COTS in Containers + Cloud

CNAME= sso.int.tr.com
CNAME= sso.amers.tr.com

sso.tr.com
CNAME= sso.int.tr.com
CNAME= sso.emea.tr.com

AMERS

EMEA

#RSAC
CNAME= sso.int.tr.com
CNAME= sso.aspac.tr.com
ASPAC

Containerization of COTS Apps
FROM image:version RUN some commands && install ­y things WORKDIR /opt COPY java.tar.gz /opt ADD cots_idp_binary.zip /opt RUN unzip cots_idp_binary.zip RUN tar ­xf java.tar.gz USER idpuser:idpuser ENTRYPOINT ["/usr/bin/startup.sh"]

#RSAC
Base image
OS prep Work
directory Binaries
Commands User & Group Process to Launch

#RSAC
Containerization of COTS Apps

FROM image:version
RUN some commands && install ­y things
WORKDIR /opt
COPY java.tar.gz /opt ADD cots_idp_binary.zip /opt
RUN unzip cots_idp_binary.zip RUN tar ­xf java.tar.gz
USER idpuser:idpuser
ENTRYPOINT ["/usr/bin/startup.sh"]

engineidp:latest

Image Registry

docker build

docker push

adminidp:latest engineidp:latest engine:qa

Multi-region Availability
CNAME= sso.int.tr.com
CNAME= sso.amers.tr.com

sso.tr.com
CNAME= sso.int.tr.com
CNAME= sso.emea.tr.com

AMERS

EMEA

#RSAC
CNAME= sso.int.tr.com
CNAME= sso.aspac.tr.com
ASPAC

Autoscaling
CNAME= sso.int.tr.com
CNAME= sso.amers.tr.com

sso.tr.com
CNAME= sso.int.tr.com
CNAME= sso.emea.tr.com

#RSAC
CNAME= sso.int.tr.com
CNAME= sso.aspac.tr.com

Georouting
CNAME= sso.int.tr.com
CNAME= sso.amers.tr.com
AMERS

sso.tr.com CNAME= sso.int.tr.com CNAME= sso.emea.tr.com
EMEA

#RSAC
CNAME= sso.int.tr.com
CNAME= sso.aspac.tr.com
ASPAC

#RSAC
Failover, High-availability, & Disaster Recovery

CNAME= sso.int.tr.com
CNAME= sso.amers.tr.com

sso.tr.com
CNAME= sso.int.tr.com
CNAME= sso.emea.tr.com

CNAME= sso.int.tr.com
CNAME= sso.aspac.tr.com

AMERS

EMEA

ASPAC

#RSAC
Technical Challenges & Solutions

#RSAC
Durable IDP, Ephemeral Infrastructure
Photo by Ron Dauphin on Unsplash

Durable IDP, Ephemeral Infrastructure

1- Cloud platform

instantiates new container

instance, pulls from container repository

4

2- IDP instance launches, has no configuration info

3- IDP startup script pulls

latest configuration extract from encrypted bucket

1

4- IDP bootstraps

2

3

configuration, joins the

cluster

5- At intervals, IDP exports

latest configuration to encrypted bucket

5

#RSAC
Photo by Ron Dauphin on Unsplash

#RSAC
Cross-Region Discoverability & Clustering

Container Platform

7600 7700

Admin Node

9999

Admin

Engine Node

9031

Internet

Cross-Region Discoverability & Clustering

Container Platform Admin Node Engine Node Engine Node Engine Node

Containers = SG-1234 Admin NLB = SG-5678 Engine NLB = SG-9101
9999

From

To

SG-5678 SG-1234
9031
SG-9101 SG-1234

SG-1234 SG-1234

SG-1234 SG-1234

#RSAC
Port 9999 9031 7600 7700

Cross-Region Discoverability & Clustering

AMERS

EMEA

9999

Admin Node

Engine Engine Engine

9031

Engine Engine Engine

9031

#RSAC

Type Custom Custom Custom Custom

Protocol TCP TCP TCP TCP

Port 7600 7700 7600 7700

Source 3.3.4.0/27 3.3.4.0/27 3.3.3.0/27 3.3.3.0/27

Type Custom Custom Custom Custom

Protocol TCP TCP TCP TCP

Port 7600 7700 7600 7700

Source 3.3.3.0/27 3.3.3.0/27 3.3.4.0/27 3.3.4.0/27

#RSAC
Secrets Management
Templatized build scripts allow for separation of code and protected credentials
AWS Secrets Manager for native app credentials storage and management

Issues With Ephemeral DNS Names
Nodes must remain connected to persistent data stores (DBs, LDAPs) and load balancers across refreshes/rebuilds
Cloud-managed resources get new DNS names on rebuildwhich breaks many COTS products not designed for cloud environments

#RSAC
a32345-sso-nlb1-use2prod.3459204382.us-east-
2.ec2.amazonaws.com
Admin Node
Engine Engine Engine

Company-managed DNS needs to be updated after each NLB refresh to reflect the NLB DNS changes to not break service

a32345-sso-rds1-use2prod.3433553423.us-east-
2.rds.amazonaws.com

a323a34253-s4s5o-s-snol-bn2lb-u1-sues2e-2prodp.r3o7d2.3344393950532472.u3s.u-es-aesats-t-
2.ec22..eacm2.aamzoanzoanwasw.cso.cmom

The High Utility of DNS Aliases

CNAME= tr-esso-clientstore.prod.aws.tr.com

Admin Node

#RSAC
a32345-sso-nlb1-use2prod.3459204382.us-east-
2.ec2.amazonaws.com
CNAME= tr-esso-admin.prod.aws.tr.com

a32345-sso-rds1-use2prod.3433553423.us-east-
2.rds.amazonaws.com

Engine Engine Engine

CNAME= tr-esso.prod.aws.tr.com

CNAME= esso.tr.com

a32345-sso-nlb2-use2prod.3723499027.us-east-
2.ec2.amazonaws.com

CNAME= essoadmin.tr.com

Password Synch & User Enrollment

New Password Manager

Governance

New

Platform

AD

SSO Dir
29

#RSAC
Old Password Manager
Legacy AD

Password Synch & User Enrollment

Governance

2

Platform

New Password Manager

11

SSO

10

Dir

6

MFA

9
SSO

8 Enrollment
Page

New AD
7
4

30

#RSAC
Old Password Manager
1
Legacy AD
3
Sync Tool
5

Password Synch & User Enrollment

New Password Manager

New

Governance

AD

Platform

SSO Dir
31

#RSAC
Old Password Manager
Legacy AD

#RSAC
Feature Development, Promotion, & Upgrades

#RSAC
Unified Code Base
https://12factor.net
­ "One codebase tracked in revision control, many deploys" ­ A "deploy" is each instance- e.g. dev, prod
Parameterizations determine what and how app and cloud infrastructure are deployed for 4 environments- dev, qa, stage, & prod Parameterizations determine which of the 3 container images get formed from that codebase- admin, engine, provisioner Conditions determine which app components and infrastructure are deployed per region- AMERS, EMEA, ASPAC 36 combinations (4 environments, 3 regions, 3 container images)- 1 dockerfile, 1 yaml template
33

#RSAC
Unified Code Base - Dockerfile
34

#RSAC
Unified Code Base ­ YAML Template
All parameters & environment values are at the top of the yaml template- there are only references to the mappings in the actual resource section of the template
Environment determines environment
Mappings are made per environment, per region
35

#RSAC
Unified Code Base ­ YAML Template
Conditions on resources determine if and how they are deployed Combined with the environment and region mappings, this makes the codebase supremely maintainable & readable
36

Product Upgrade Process

New IDP Version Released
Close CHG for the sprint

Submit prod CHG for sprint

Diff files touched during container
build
Yes
Files changed?

Deploy to prod

No

Yes

Update files in repo to latest
Build container images

Pre-prod OK?
No

Soak test in preprod for 1 week

Deploy in preprod (stage)

Deploy & test in non-prod

37

#RSAC
Figure out what went wrong
No
Non-prod OK?
Yes

ID Verification
OpenID Connect used to pass a restricted set of employee data to ID Verification service
Near-seamless handoff and return verification flow for smooth user experience
ID Verification vendors with native OpenID Connect capabilities were much more strongly considered
38

#RSAC
Photo by Nicole Geri on Unsplash

Federation Hub

Solution for M&A/Divestitures

Translate auth tokens from

3rd party IDPs into token

App

from our IDP

Simplifies TSAs for app teams, single integration point

N+1 partner IDP support

39

SSO

#RSAC

Other IDP

Container Maturity

Novice:
­ Containers are built and run much like standalone app

Intermediate:
­ Redundancy, autosizing, build scripts, repeatable processes

Advanced:

­ Templatizing, monitoring, log

streaming, native application v. OS

base

40

#RSAC
Photo by Frank McKenna on Unsplash

#RSAC
Other Lessons Learned

Real-World Failover Times

CNAME= sso.int.tr.com
CNAME= sso.amers.tr.com

sso.tr.com
CNAME= sso.int.tr.com
CNAME= sso.emea.tr.com

AMERS

EMEA

#RSAC
CNAME= sso.int.tr.com
CNAME= sso.aspac.tr.com
ASPAC

#RSAC
Real-World Failover Times

sso.r1.alb.tr.com

sso.tr.com

sso.tr.com
NA SA DE sso.r1.tr.com

sso.r2.alb.tr.com

EU AF AN sso.r2.tr.com
sso.r2.fo.tr.com

sso.r1.fo.tr.com

sso.r2.alb.fo.tr.com

sso.r2.alb.tr.com

sso.tr.com AS EU
sso.r3.tr.com
sso.r2.fo.tr.com

sso.r1.alb.fo.tr.com

sso.r2.alb.f2.tr.com

sso.r2.alb.fo.tr.com

sso.r1.alb.f2.tr.com

sso.r2.alb.f2.tr.com

AMERS

EMEA

ASPAC

Mind the Network Gap
44

sso.tr.com

#RSAC
AMERS EMEA ASPAC

#RSAC
The Need for Pre-Prod ­ QA IS NOT Enough!
Started with dev, qa, prod A prod replica is REQUIRED
­ All items created by code in prod must be proofed in a lesser environment prior to running against production!
Photo by Sven Mieke on Unsplash

#RSAC
Amazon Aurora CloudFormation Issues
Aurora is not easily changeable by CloudFormation as compared to all the other AWS components used in the stack

read_write.endpoint.tr.com

read_replica1.endpoint.tr.com

read_replica2.endpoint.tr.com

46

Multi-Master Impact (or Lack Thereof)
Client store in AMERS only
Client Credential flow test showed 40ms difference between token receipt from servers in EMEA and AMERS, 60ms difference for ASPAC.
Appreciable difference, but not worth effort/cost/complexity of managing multimaster DB
Improved inter-regional data links may make multi-master unnecessary for certain workloads
47

#RSAC
Photo by Pat Kay on Unsplash

#RSAC
Changing the Culture Around Change Control

48

Photo by Pascal van de Vendel on Unsplash

#RSAC
Impact

#RSAC
User Enrollment
Enrollment was the same ceremony as SSO logon Inline MFA registration
50

MFA Adoption
New 22,496 Users - 82 Days

#RSAC
Old 22,776 Users ­ 472 Days

51

#RSAC
Old v. New

Old SSO New SSO

Protocols
Proprietary, SAML2
OAuth2, OIDC, SAML2

Engagement Duration
Manual, ~4 Weeks
Self-Service, Instantaneous

Cost Per Engagement
Varies, ~4 Figures

Apps Integrated Launch +7 Days
Unknown

0

90

52

#RSAC
Staffing & Operational Metrics

Engineering: 3 FTEs
­ Responsible for continuous service improvement, including new version releases every 2-4 weeks
­ Daily open "office hours" call to hear the voice of the customer in real time

Operations: 3-5 Contractors
­ Responsible for any nonautomated service support tasks, including support of over 600 integrations

53

App Integrations
Quick and steadily increasing service adoption rate
Very scalable
~75% of integrations created via a basic selfservice process

250 200 150 100
50 0 2019/Jun

2019/Jul

New Integrations
2019/Aug 2019/Sep 2019/Oct 2019/Nov 2019/Dec

700 600 500 400 300 200 100
0 2019/Jun

2019/Jul

Total Integrations
2019/Aug 2019/Sep 2019/Oct 2019/Nov 2019/Dec

54

#RSAC

#RSAC
Financial Impact
$2.2mm less per year compared to retail commercial enterprise IDaaS
$700,000 less per year compared to "best & final" rate for commercial enterprise IDaaS

#RSAC
We Opensourced It
https://github.com/thomsonreuters/tr-aws-pingfederate
56

#RSAC
What You Can Do
The LOE & benefits of building a sustainable IAM service using devops and infra-ascode as substantial.
­ Turnkey IDaaS is attractive, but often carries technological and cost drawbacks. You can marry the low cost of COTS with the flexibility of IDaaS.
Drive adoption rates for your services & reduce friction through superior UX.
­ Modern services offer more for both end users and developers, so lean into their benefits. ­ Self-Service, inline registration, ceremonies that mimic the typical interaction with the service
Grow confident the skills to build one's own IDaaS are not as specialized as one might think.
­ We started from zero experience in Docker and minimal AWS experience- learn by doing ­ Invest in training for engineers around containers, cloud infrastructure, and automation
technologies.
57

#RSAC
What You Can Do
Within the next month:
­ Inventory your IAM application stack and architecture ­ Evaluate what could be a candidate for refactoring into infra-as-
code/containers/cloud-native
By next quarter:
­ Complete a POC for retrofitting at least one of these COTS identity platforms into a cloud-native deployment
­ Project ROI versus continuing to run as-is
Within 6 months:
­ Expand the program for other in-scope platforms
58

#RSAC

Questions?

Sean Farrell S.Farrell@thomsonreuters.com

Jon Lehtinen Jon.Lehtinen@thomsonreuters.com @jonlehtinen

