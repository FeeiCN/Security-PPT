SESSION ID: IDY-T09
Delivering Automated, Modern Enterprise App Auth in Old Orgs, Quickly

Jon Lehtinen
Lead Identity Engineer Thomson Reuters @jonlehtinen

#RSAC

#RSAC

You are here.

Destination

2

#RSAC
Destination

You are here.

©2019 Fogarty's Cove Music
3

You can automate your enterprise app auth.

#RSAC
5

#RSAC
6

#RSAC
What does it mean to "automate enterprise app auth?"
Operations/Infrastructure
­ Compute/Storage/Network ­ Product maintenance, upgrades & patching ­ Outages ­ Dashboarding & Service Health ­ L1 Helpdesk/L2 Operations
7

#RSAC
What does it mean to "automate enterprise app auth?"
Service Delivery/App Integration
­ How apps engage w/ the system ­ RACI/Ownership of IAM services, app services ­ Request management ­ Feature requests/enhancements
8

Infrastructure/Operations

#RSAC
10

#RSAC
Separation
Identity Governance Directory Services
Network Single Sign-on
PKI MFA PAM Datacenters
11

#RSAC
12

#RSAC
Who are our internal customers?
~35,000 workers ~4,000 apps Large user populations on most continents Access from anywhere Datacenter exit Cloud strategy

#RSAC
One username, one logon experience
Multiple usernames
­ t212360886 ­ \domain\t212360886 ­ jon.lehtinen ­ 212360886 ­ jon.lehtinen@tr.com
Multiple logon experiences
14

#RSAC
One username, one logon experience
OpenID Connect OAuth 2 SAML
15

#RSAC
Multifactor as an extension of SSO
16

#RSAC
BYO... IDaaS?
Consumable through self-service On-prem shrinks, cloud footprint grows Global orgs should actually have global services Late-night ops incidents make me grouchy
17

Build, buy, or cloudify?

Native Cloud Services

VM1
App

VM2
App

Guest OS Guest OS
Hypervisor Host OS
Host Hardware Virtual Machines

18

#RSAC

App

App

Container Container

Container Engine

Host OS Host Hardware

Containers

#RSAC
Containerizing an on-prem SSO product
Not a lot of vendor guidance or prior art (March 2018) Docker networking/AWS security group considerations No secrets in the dockerfile/configs No root users
19

#RSAC
Ship of Theseus

#RSAC
La persistencia de la memoria
21

#RSAC
Cloud-native design
22

#RSAC
Location-aware routing & regional sub-clusters
23

#RSAC
Auto Scaling
24

#RSAC
High-availability & disaster recovery
25

#RSAC
Operational support
Dashboard shows the service is up Check the test apps Can you get a token using curl? Attach proof or L2 will reject incident
26

Impact of Infrastructure/Operations Automation

#RSAC
One script to rule them all
28

#RSAC
Product upgrades
29

#RSAC
Continuous integration, continuous deployment
30

#RSAC
Self-service through dynamic client registration
31

#RSAC
Total cost of ownership
Saves $1.2mm per year over existing TR SSO & MFA systems $2.2mm less per year compared to retail enterprise IDaaS $700,000 less per year compared to bulk rate enterprise IDaaS
32

Challenges

#RSAC
Containers, DevOps, Cloud
Trial and error, limited cloud/development knowledge Endless tinkering
­ refinements continue (now under change control) to this day
Operational handoff is more difficult Kubernetes for transportability
34

You can automate your enterprise app auth.

Service Delivery/App Integration

#RSAC
The baseline
Staff, contractors, different verticals Support per SOW Difficult for customers Difficult for IAM staff Proprietary WAM with request-based integration process Some SAML POC OIDC, OAuth
37

#RSAC
SSO Organization
Engineering - Design Integrations - Build Operations - Run
38

What do we need for automation?

Protocol:

WAM

SAML

API:

YES

YES

Lightweight:

NO

YES-ish

Strategic:

NO

YES

39

#RSAC
OIDC YES YES YES

#RSAC
Who are our customers?
Technically-savvy power users
­ Cloud architects ­ Mobile devs ­ Small group, but loud and resentful
Checklisters
­ Project managers ­ App/web admins ­ Forced to engage for project/audit reasons
40

Self-Service is the new automation

#RSAC
Q4 2015 Self-Service API
API Gateway
IDP
42

Web Portal (Create)

OIDC
username
password

ClientID: Secret: 2L/3L: Policy: Environment:

jon_client qwerty 3L Employee+B2B Production

client_id owner_id env

jon_client client2 client3 client4

21233333 21234567 23434565 52763527

prod stage prod prod

43

API Gateway
IDP

#RSAC

Web Portal (Create)

SAML
username
password

EntityID: ACS URL: Assertion: Policy: Environment:

jon_entity https://jon.com/acs Standard+Groups Employee+B2B Production

entity_id
jon_entity lolcats_9 jontest1 legit_id_1

owner_id
60669467 86753092 52342069 22763527

env
prod stage prod prod

44

API Gateway
IDP

#RSAC

Web Portal (Read, Update, Delete)

OIDC
username password
IDP
API Gateway

ClientID jon_client jon_client2

Secret CHANGE CHANGE

Environment Prod Prod

2L/3L 3L 2L

Policy Employee+B2B N/A

client_id owner_id env

jon_client client2 jon_client2 client4

21233333 21234567 21233333 52763527

prod stage prod prod

45

#RSAC

#RSAC
How do apps use auth services?
App-level integration Web-tier integration Solutions don't have to come from centralized team Standards allows solution flexibility
46

#RSAC
Customer engagement

#RSAC
From the Customer's Perspective

Engagement Type

Process

Speed

Solutions

Customization

Support

Integrations Team

Familiar

10 day SLA

OIDC, SAML, WAM

Limitless

Live Collaboration

Self-Service

Unfamiliar Instant OIDC, SAML Preconfigured Documentation

48

#RSAC
Chargeback model
Charge per integration
­ OIDC was cheap ­ SAML was reasonable ­ WAM was expensive
49

#RSAC
Service Level Agreements
50

#RSAC
From the Customer's Perspective

Engagement Type

Process

Speed

Solutions

Customization

Support

Integrations Team

Familiar

10 day SLA

OIDC, SAML, WAM

Limitless

Live Collaboration

Self-Service

Unfamiliar Instant OIDC, SAML Preconfigured Documentation

51

#RSAC
From the Customer's Perspective

Engagement Type

Process

Integrations Team

Familiar

Self-Service

Semifamiliar

Speed

Solutions Customization

Support

Cost

42 day FIFO
Instant

OIDC, SAML, WAM

Limitless

Live Collaboration

$-OIDC $$-SAML $$$$-WAM

OIDC, SAML

Preconfigured Documentation

Free

52

Impact of Service Delivery Automation

#RSAC
Adoption of authentication services

June 2015
800 clients 37 OIDC

June 2017
10,048 clients 8,515 OIDC

900 Service Providers

5,005 Service Providers

7200 applications
54

¯\_()_/¯ applications

#RSAC
Business impact
$3.2 million 2016-2017 year/year labor $1.3 million WAM retirement savings $4.5 million total savings by end of 2017 Standards API economy
55

#RSAC
Timeline - 3.5 years
Q4 2013 Establish Integrations Team Q2 2014 Expanded service library Q4 2015 POC Self-Service Q4 2016 Legacy solutions dropped from support Q2 2017 Self-Service for OIDC/SAML only
56

You can automate your enterprise app auth.

#RSAC
What does it mean to "automate enterprise app auth?"
Operations/Infrastructure
­ Leverage modern cloud/DevOps practices ­ Embrace your sloth, design for "touchless" ­ Manage support expectations
58

#RSAC
What does it mean to "automate enterprise app auth?"
Service Delivery/App Integration
­ Self-service ­ Sample solutions ­ Product management ­ Iterative improvements
59

#RSAC
You can automate your enterprise app auth.
Next week you should:
­ Identify what Ops/Service Delivery practices & services are candidates for automation/self-service
Within the next three months you should:
­ Launch a regular customer touchpoint to understand what their needs are, and how you can drive them to use self-service using those needs as the incentive
Within the next six months you should:
­ Launch an MVP self-service capability for your enterprise app auth service, and/or design new services to use ephemeral infra
60

#RSAC
Questions?
@jonlehtinen jon.lehtinen@thomsonreuters.com jlehtinen@idpro.org jon.lehtinen@gmail.com

