SESSION ID: ASD-F01
Security as a Service in a Financial Institution: Reality or Chimera?
#RSAC

Javier Losa
Cybersecurity Product Engineering Innovation 4 Security ­ BBVA Group @sealth
Iñigo Merchán
Security Architect BBVA @achemerchan

#RSAC
Our use case
2

#RSAC
i4s ­ Our security product leverage

i4s is a BBVA Group Company
that creates cybersecurity products to support the
Digital Transformation

We promote innovation and teamwork
Our teams are small to avoid fragmentation
We are flexible and agile
We provide solutions to needs not covered by the market
3

#RSAC
Banks must adapt to new landscape
We are living a digital revolution that affects society as a whole (transportation, healthcare, entertainment, etc.) and Financial Services are not a exception. Banks are part of the digital revolution now because clients expect them to be.
4

#RSAC
New ecosystem, new rules
Huge changes for the industry: new customer needs, new industry players, new technologies.
Key success factors:
1. Deliver & adapt fast 2. Client & customer satisfaction 3. Better performance 4. Lower costs
Source: Versionone 5

#RSAC
The new way of working
In order to meet the new paradigm, we need a different approach for security and the Digital Transformation (cloud, agile & full automation):
20+ Scrum teams Public, Private and Hybrid Clouds Security as a core for Knowledge Banking SecDevOps is part of our culture now SDx (Software Defined Everything)
6

#RSAC
How security in waterfall is addressed

Security Requirements

Risk Assessment

Code Review

Penetration Testing

Security Vulnerabilities

Requirements

Design

Development Verification Maintenance

7

#RSAC
How to address Security in Agile?
Source: RightScale
8

Datacenter vs. Cloud
Traditional IT Datacenter
 Siloes infrastructure  Little automation  Legacy IT  Rigid  High maintenance  Separate teams  Hierarchical approvals  "Hand ­ made"  Long time to deploy
Source: MVM
9

#RSAC
Public/Hybrid/Private Cloud
 Converged infrastructure  Full automation  Resource pooling  Agile & Flexible  Low maintenance  Cloud Operation team  Self Service  Automated & Repeatable  Automated deployments
Source: Wikipedia

#RSAC
Security as a Service process (Chimera platform)

How Chimera was born...

First services in production, focusing on automatically deploying reverse proxies and Technical Verification services and hardening instances.

Jun 2015

Chimera is born as an i4s platform: from SDLC security, to
deployment of security architectures to use of security
products in production.

Sep 2014

11

#RSAC

Mar 2013

Innovation 4 Security is born to leverage the Security knowledge of their professionals in order to support the Digital Transformation.

Mar 2014

« Agile Security Model » is designed as a process to be more agile in SDLC (Software Development Life Cycle).

Jun 2014

« Cloud Security Foundation » as a group of basic security services needed to protect the IaaS.

SECaaS (Security as a Service)

New Project
Security Product Owner

AGILE BOARD

IGL

Patterns

Model Driven Security Patterns
BDD Security User Stories
Automatic Code Review

DEPLOY / PROVISIONING

Deploy Provisioning

Platform Management
Security Team
12

Security API

#RSAC
Cloud Security Set Up Service
Technical Verification Service
Hardening Service
AuthN and AuthZ Service
Encryption Service Additional Security
Services

#RSAC
Agile Board ­ Security Patterns

User Environment

Internet

Outsourced Private Cloud
Bastion

Outsourced Private Cloud

Internet

BBVA Bastion

Hello World

SPP

BBVA DC

ELARA Services
Transactions repository

PoS

Data

Customer Secured data

Unknown Management Secure channel

Plain channel

Bastion

Plain data

Transport

Data

Outsourced Management

13

Model Driven Security: Build security patterns to automatically apply security to new projects.

#RSAC
Agile Board ­ Security Patterns

User environment

Interne t

Outsourced Private Cloud
Bastion
FW REV. PROXY

Outsourced Private Cloud

FW

REV. PROXY

Hello World

Interne t

BBVA Bastion

FW R. PROXY

FW

BBVA DC
POLICY REPO
ELARA Services Transactions Repository

PoS

Data

LOG SERVER

LOG SERVER

LOG SERVER

LOG SERVER

Customer Secured data

Unknown Management Secure channel

Plain channel

Bastion

Plain data

Transport

Data

Outsourced Management

Source: Roberto Ortiz (BBVA). A methodology to build secure information systems based on patterns

14

#RSAC
Agile Board ­ Security with BDD

Source: Wakaleo
15

Behaviour Driven Development: Automate Security acceptance tests and establish a common set of user stories depending on the project and its architecture

#RSAC
Agile Board ­ Security with BDD
Example
Source: BDD Security - Continuum
16

#RSAC
Agile Board ­ IGL

Code Repository (software, infrastructure and security)

Recipe Syntax

Build and Unit Testing

Security Tests Pass, including BDD

Code Review Engine

OK

Penetration Testing

OK

Deployment & Configuration

OK

Verify
Dev / Prod Environment

17

#RSAC
Deploy & Provisioning: IaaC
Cloud Orchestration/Mana
gement Platform

Public cloud

Hybrid cloud

Private cloud

18

#RSAC
Deploy & Provisioning: CMT
Reach server
Access & Audit

New server from IaaS
19

Configuration Management Tools
(agnostic)

#RSAC
Deploy & Provisioning
RSA Conference Dummy Project 1
RSA Conference Dummy Project 2
20

Cloud Security Foundations
Technical security checking: Do the deployed services comply with the defined policies and regulations? Hardening services: security configuration and basic security components installation. Security events collection & analytics (Logs, IDS, integrity checks). Network & traffic filtering: L7 sanity, IP reputation, network AV, etc. Identity assurance: IAM (PEP, PDP, PIP, PAP...?). Crypto as a Service: Secret vaulting, tokenization API, etc. "Agile" self service: IGL, SDLC, Risk Management, BDD Security.
- INSERT ANY SECURITY SERVICE HERE -
21

#RSAC

#RSAC
Cloud Security Foundations

New Security Solutions

BUILD
AuthN

MARKET ADOPTION

BUY

OSS Big
Data

AV
Mass Market
Commodity

STRATEGIC RELEVANCE
22

=

Security Solution

Strategic

#RSAC
Takeaways - Apply
To secure the cloud, use the same technology the cloud is built upon (agile and DevOps are here to stay!), so embrace SecDevOps...the sooner, the better. Start thinking about your security patterns, you will need them to support massive deployments and achieve SECaaS (Security as a Service). Identify points of security interaction within your business processes and automate them. Don't be afraid of Open Source Software: it can be helpful in many ways...but don't forget internal security development can have its use cases. Digital Trust needs to be your long term value, use it as your compass.
23

SESSION ID: ASD-F01
Security as a Service in a Financial Institution: Reality or Chimera?
#RSAC

Javier Losa
Cybersecurity Product Engineering Innovation 4 Security ­ BBVA Group @sealth
Iñigo Merchán
Security Architect BBVA @achemerchan

