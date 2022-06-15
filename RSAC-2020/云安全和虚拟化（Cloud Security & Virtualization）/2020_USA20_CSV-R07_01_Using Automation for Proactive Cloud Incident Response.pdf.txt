SESSION ID: CSV-R07
Using Automation for Proactive Cloud Incident Response

Ben Potter
Global Security Lead, Well-Architected Amazon Web Services @benji_potter

#RSAC

#RSAC
Agenda
Your Adversary Preparation Detection & Analysis Containment, Eradication & Recovery Summary & Application
2

#RSAC
www.nomoreransom.org
3

#RSAC
Your Adversary

#RSAC
Motivation
Insider | Outsider | Collaboration
­ Entertainment ­ Social group ­ Ego ­ Status ­ Cause
Kilger, Stutzman, & Arkin, 2004
5

#RSAC
Knowledge
Insider
­ Knows specifics e.g. storage buckets ­ Goes direct to resources ­ Covers tracks
Outsider
­ Reconnaissance ­ Fingerprinting ­ May be easily deceived
6

#RSAC
Preparation

#RSAC
Requirements & Frameworks
· Local, federal laws · Data breach notification · Compliance e.g. PCI, HIPAA, GDPR · Best practices https://aws.amazon.com/well-architected · Threat model
8

Cloud account structure
Root

Data Bunker

Canary

Management

App #1

Domain Registration

Dev

DNS

Test

Audit Logs
Intelligence

Email

Prod

Tools 9

#RSAC

#RSAC
Access & Credential Management
All Users
2FA Least privilege Dynamic credentials Federation
10

Everything Is Code
Dev Account

Production Account

#RSAC

Application, infrastructure, management

Repo

Analysis Tests Approval Pipeline

Networking
· Regions & ResourcCeosmlpimuteited · No human access · Compliance checksStorage · All metrics, logs to audit account
Database
Automation

AWS DevSecOps Blog: https://go.aws/2Fxw89t
11

#RSAC
Detection & Analysis

Example Application Architecture

App Account
Internet Sub DNS

VPC
Load Balancer

Load Balancer

Shared

Logs & Intel Accounts
DNS Logs App Logs

Content Delivery Network

Web App Firewall

API Gateway

Credentials

Storage

NAT Gateway

Application

Instances

Serverless Database

Database
13

Net Flow Logs SIEM
Dashboard

Canary Account
Canary Buckets

#RSAC

DNS Reconnaissance

App Account
Internet Sub DNS

Content Delivery Network

Web App Firewall

API Gateway

Credentials

VPC
Load Balancer

Logs & Intel Accounts

Canary Account

DNS Logs

Canary Buckets

Records alert on specific records > block IP/subnet/ASN Load Balancer

test. Shared

App Logs

admin.

beta. wiki.NAT Gateway

Application

Net Flow Logs

SIEM
EDNS client subnet: https://tools.ietf.org/html/rfc7871

Instances

Serverless Database

Dashboard

Storage

Database

14

#RSAC

Hidden Honeypot API

App Account
Internet Sub DNS

Content Delivery Network

Web App Firewall

API Gateway

Credentials

VPC
Load Balancer

Logs & Intel Accounts

Canary Account

Hidden API: http://bit.ly/WAFSDoNSlL1ogs
Load Balancer

·

IP:

ASN,

Soharwed ner,

country,

VPN,

App Logs
TOR, blacklist?

· Request? Useragent? · Trick: NAT Gateway 200 for every response Net Flow Logs

Application SIEM

Canary Buckets

Instances

Serverless Database

Dashboard

Storage

Database

15

#RSAC

Storage Canaries

App Account

VPC

Load Balancer
Buckets: Internect ompany-backup
Load Balancer
company-cloudtrail Shared
DNScompany-code
123456789012-cloudtrail
NAT Gateway

· Obscurity in Content Delivery Web App real buckets? Application Netwaorbk c123Fir-ewualsl -east-1-cloudtrail
· Web + authenticatiInostannce?s Serverless
Database
Block S3 API Gateway public: Credentials http://bit.ly/S3Block AWS Abuse: https://goDa.taabwase s/389sL4Z
Storage

16

Logs & Intel Accounts
DNS Logs App Logs Net Flow Logs

Canary Account
Canary Buckets

SIEM Dashboard

#RSAC

Identity Canary Tokens

App Account

VPC
Load Balancer

Logs & Intel Accounts

Internet Unused roles Canary keys: SLpoadaBcalaenccerrab http://bit.ly/2QYviI5
Shared
Sub DNS

· Access denied NAT Gateway

· Behavior analysis

· Diff to pipeline ContentDelivery Network

Web App Firewall

Application

DNS Logs App Logs Net Flow Logs
SIEM

API Gateway

Credentials

Instances

Serverless Database

Dashboard

Storage

Database

17

Canary Account
Canary Buckets

#RSAC

Storage Detection for Insiders

App Account

VPC
Load Balancer

Internet Sub DNS

Content Delivery Network

Web App Firewall

API Gateway

Credentials

Interesting buckets off limits: Load Balancer
· company-hr Shared
· company-inventions
· abc123-clientdb NAT Gateway

Files/objectsAppilnicastioinde of buckets

keys linked to canaries

Instances

Serverless

Database

Storage

Database

18

Logs & Intel Accounts
DNS Logs App Logs Net Flow Logs
SIEM Dashboard

Canary Account
Canary Buckets

#RSAC

#RSAC
Concealed Adversary Roles
19

#RSAC
Concealed Resources - Serverless Functions
20

#RSAC
Automate Detection & Analysis

Action

Event Trigger

Analysis

Beware of noise Beware of multiple concurrent events Auto escalate

21

Notification

Human

301 207

#RSAC
NoMoreRansom Findings - DNS
22

99 66

17 13 12 12 11 9 8 8 7 6 6 5 5 5 5 5

NoMoreRansom Findings - WAF Block

Netherlands: 83k

Germany: 169k

#RSAC
Korea: 465k

23

#RSAC
NoMoreRansom Findings - Top 20 IP Blocked Requests
24

#RSAC
Containment, Eradication & Recovery

#RSAC
Considerations
Response measured in seconds Record actions taken What has been touched? Drift: https://go.aws/2FA5e0v Is adversary really gone? Comms safe?
26

Containment, Eradication, & Recovery:

#RSAC

Complete Replacement

Data Bunker Account
27

#RSAC
Containment: Identity & Access
Explicit deny policy ­ individual principle
{ "Statement": [ { "Effect": "Deny", "Action": "*", "Resource": "*" } ] }
Explicit deny policy ­ account level
{ "Statement": [ { "Effect": "Deny", "Action": "*", "Resource": "*" } ] }
Block OU
Dev
28

#RSAC
Containment & Recovery: Web Application

Public DNS

X
Content Delivery Network

X
Web App Firewall

Backend DNS

Dynamic Static

Content based routing: https://amzn.to/2tEdNF0
29

#RSAC
Containment: Instance & Function Network

Internet

Application

XX
DNS Network Resolver ACL

X
Route

Instances Functions

Note: Will not block active TCP sessions
30

Hibernate & Snapshot

Recovery: Storage
Bunker Account

Buckets
Dev Account

Snapshots

Images

Database

Read ONLY

Buckets

Snapshots

Images

Database

31

#RSAC

#RSAC
Automate Detection, Analysis, & Recovery

Notification

Human

Action

Event Trigger

Analysis

Beware of noise Beware of multiple concurrent events Auto escalate

32

Auto Recovery Notification http://bit.ly/CRuleRem

#RSAC
Demo

#RSAC
TAKE ACTION!

#RSAC
Focus On...
3P's: Patching, Preparation, Practice Small improvements & iterate Ask for help Automate as much as possible
35

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Identify critical risks & remediate ­ Start an IR plan based on pragmatic threat modelling
In the first three months following this presentation you should:
­ Iterate on plans & threat model ­ Implement tools and practice using them
Within six months you should:
­ Actions at a distance - hands off data and systems ­ Implement canaries
36

#RSAC
Links
www.nomoreransom.org Best practices: https://aws.amazon.com/well-architected AWS DevSecOps Blog: https://go.aws/2Fxw89t EDNS client subnet: https://tools.ietf.org/html/rfc7871 Hidden API: http://bit.ly/WAFSol1 Block S3 public: http://bit.ly/S3Block AWS Abuse: https://go.aws/389sL4Z Spacecrab http://bit.ly/2QYviI5 Drift: https://go.aws/2FA5e0v Content based routing: https://amzn.to/2tEdNF0 Auto remediation: http://bit.ly/CRuleRem Demo: https://wellarchitectedlabs.com/
37

