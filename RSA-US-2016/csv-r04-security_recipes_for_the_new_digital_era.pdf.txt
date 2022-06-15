SESSION ID: CSV-R04
Security recipes for the new digital era v.1.0.1
1

Tomás Herranz
Head of Engineering & SecDevOps ­ Security Architecture BBVA @tomasherranz

Introduction

Current situation

2

Introduction
+135k employees company +20 different innovation teams +50 different innovation projects Agile methodologies +100 different technologies ... and growing!
3

Introduction
Bad news : And they all require security !
Poor security guy
4

Introduction
Good news : Change of paradigm
5

Introduction Security skills revisited
: Prepare to code (again) / Flexible 5 Keep updated (Self-learner) 8 Become an transformation enabler, not a stopper
6

Introduction
½ FROM
Tailor made solutions Months to develop + deploy Hard to administrate & monitor Monolithic architecture Expensive $$$
7

TO ¼
Generic Solutions
Minutes to deploy
Central administration & monitoring
Modular architecture
Office [3]1
Almost `free'

Slide 7
Office [3]1 of licence, not in hours and some pain
Microsoft Office User, 1/4/2016

Introduction



Build

Competitive Advantage

Innovation

Y

Flexible

¿
Buy
Commodity Mature Business as usual

8

Security cook book

Based on :
What we learnt What worked for us
Recipe :
Set of ingredients Set of instructions
9

Recipe #1: One proxy to rule them all

One proxy to rule them all

Ingredients :
WAF : ModSecurity + OWASP core rule set Web Server: Apache/Nginx
Spring security MongoDB Redis
AV : ClamAV (Optional)

Instructions :
Single entry point
Technology agnostic, just http services
Standard & homogeneous solutions

10

Recipe #1 : One proxy to rule them all

One proxy to rule them all : AuthN + AuthZ
Single entry point

Local AuthZ Delegated AuthZ

AuthZ

Security reverse proxy

AuthN

Basic auth Biometrics Delegated auth (SAML, oAuth) Second factor

Backend 1

Backend 2

Backend 3

11

Recipe #1 : One proxy to rule them all

Modular Every functionality is separated into modules that can be deployment independently of all the others.
API-fied Developer ready for easy integration.
Ready 4 Cloud Tested and designed to get full advantage of Cloud Technology.

Features
Hot Protection All can be configured live on a dashboard.
OpenSource Based on Open-Source technologies.
WAF + AV Layer 7 Firewall and Antivirus protection built-in.

Easy to deploy The solution can be deployed using Ansible Playbooks or Docker containers.
Monitored Health and state are monitored live.
Standard Compatible with JWT Tokens and oAuthv2 to consume REST Services.

12

Recipe #1 : One proxy to rule them all

What we used

Spring Security Powerful and highly customizable authentication and access-control framework.

ModSecurity OpenSource Layer 7 Application Firewall with OWASP Core Rule Set.

ELK Stack ElasticSearch + Logstash + Kibana Collect, parse, and store logs for later use.

Docker Container, Ansible Playbook

ModSecurity WAF + OWASP RuleSet + ClamAV

oAuth2, JWT, SAMLv2

Spring Security, Redis, MongoDB, Logstash

13

Standard OAuthv2 + JWT, SAMLv2.
ClamAV OpenSource Antivirus.
Docker and Ansible Open platform for developers and sysadmins to build, ship, and run distributed applications.

Recipe #1 : One proxy to rule them all

Admin Frontend

Introducing

AuthN

Local AutnN

SSO

Delegated AutnN Second factors

AuthZ

Local AutnZ

Delegated AuthZ

User Lifecycle

User CRUD

Password reset

Security services

Data transit encryption

Secure credential vault

Monitoring

Health services

Logging

Standard logging

Audit logging

14

Recipe #1 : One proxy to rule them all Frontend Screenshots
15

Recipe #2: Policy enforcement

Policy enforcement
Ingredients :
WSO2 Identity Server (PDP) Security proxy (PEP) External apps info (PIP)

Instructions :
Segregate access decision from point of use
Use standards

16

Recipe #2 : Policy enforcement Policy enforcement
XACML 3.0 (JSON Support)

PEP PDP

Policy enforcement point Policy decision point

PAP PIP

Policy administration point Policy information point

PRP

Policy retrieval point

17

Recipe #2 : Policy enforcement

,*)

Single entry point

PAP

Security reverse proxy (PEP)

PDP

PRP

Backend 1

Backend 2

Backend 3

PIP

18

Recipe #2 : Policy enforcement
Sample policies
Business policy
Allow access to resource Accounts with attribute CustomerID=x if Subject match AccountOwner and action is read
with obligation on Permit: doLog_Inform(CustomerID, Subject, time) on Deny : doLog_UnauthorizedLogin(CustomerID, Subject, time)
Security policy
Allow access to resource Accounts with attribute CustomerID=x if SourceIP match KnownIPList and action is write
with obligation on Permit: doLog_Inform(CustomerID, Subject, time) on Deny : doLog_UnauthorizedLogin(CustomerID, Subject, time)
19

PRP
Code repository (e.g Git) Versionable `Human readable'
If you want to go further ... Historical data Behavior analysis Scoring System (Policy chain)

Recipe #3 : Speedy surf board : Automating security deployments

Speedy surf board :
Automating security deployments

Ingredients :
Ansible Terraform

Instructions :
Eat Sleep AUTOMATE Repeat

20

Recipe #3: Speedy surf board : Automating security deployments

Easily deploy security Technology agnostic Fast Repeatable

Automation becomes a MUST

The wave has come ... and you need a speedy surfboard to ride it.
21

Recipe #3: Speedy surf board : Automating security deployments

Chimera

Recipe catalog Security proxy IDS IPS IdP Second factor gateway

Project 1

Project 1 Project 2
22

Project 3

Recipe #3: Speedy surf board : Automating security deployments
Under the hood

Chimera

Recipe repository

API

SSH

Benefits :
Central control, monitor & audit Cloud agnostic Seconds to deploy Completely Api-fied

23

What we achieved

One proxy to rule them all

Metrics
Time to protect

20+ ¼ 3

days

days

Business impact
New technologies enabled in a secure manner Security development cost reduced

Policy enforcement

Metrics
Time to enforce
2¼
days

0
Instant !

Business impact
Human interaction reduced (Less prone to errors) Centralized policies repository (Better control)

Speedy surf board : Automating security deployments

Metrics
Time to deploy

3¼ 1

days

minute

Business impact
Security deployment costs reduced Reduced bureaucracy

24

Top ten tips
1) Anticipate to be able to run with business 2) Adopt, take advantage of new ways of doing things
Office [2]1
3) Change of attitude : Less `No' and more `Not that way' 4) Keep transparent 5) Agile and flexible
25

Slide 25
Office [2]1 transparent or invisible ??
Microsoft Office User, 1/4/2016

Top ten tips
6) Be standard 7) Read, read and read ... 8) Segregation of duties 9) Automate as much as you can
26

#RSAC

10 ) Just ride the wave ...

Thanks !!!

27

Reference
WS02 Identity server ELK stack explained How to install ELK stack IETF XAMCL 3.0 AAA authorization framework Ansible Terraform
* All the pictures used on this presentation are under the `Creative commons CC0' license 28

icons
Qwertyuiopasdfghjklñzxcvbnm,.1234567890'¡ºQWERTYUIOP^*ASDFGHJKLÑ¨ÇªZXCVBNM;:_ ¿?=)(/&%$·"!>><<|@#¢¬÷""´,|{}[]­...,,\ÅÊ½¼Ó×ê
29

