#RSAC

SESSION ID: AIR-R05F
Cloud Attacks Illustrated: Insights from the cloud provider

Craig Nelson
Security Software Engineering Manager Microsoft, MSRC (Azure) @ath0nocarrier
Tomer Teller
Azure Security Research PM Microsoft @djteller

#RSAC
Cloud Weaponization

#RSAC
Cloud Weaponization

#RSAC
Cloud Weaponization

#RSAC
Setting the Stage
· We are going to talk about what is happening today · This information is immediately applicable
Which attacks should I expect? How to prevent them? How to detect them?
How to respond to them?

#RSAC
Cloud Basic Terminology

Customer

Subscription Resource Group

Resource

#RSAC
Cloud Attack Surface (Partial)

Buffer overflow SQL Injection Privilege escalation

Customer

Resource

Portal

Side channel DDoS Data integrity

Infrastructure

Certificate spoofing Phishing Drive-By-Download
Brute Force Password reset Impersonation

#RSAC
Types of Attacks

On-Prem

Cloud Resource Infrastructure

Direct Indirect

Fraud Exploit

DoS LPE

#RSAC
Perspectives on the cloud

Who are the targets?
User
Impersonate the user, Take the user's data
Developer
Compromise services, bypass controls, plant backdoors
Resource
Take data, logic bomb, surveil transactions, subvert auditing
Subscription
Complete control of cloud resources
Administrator
Pivot attack to on-prem resources
Cloud Provider
Complete dominion of multiple tenant

#RSAC

User Developer

Resource

Service
Resource
Service

Subscription

Administrator

#RSAC
Why does the cloud appeal to attackers?

Data

Technology

Multitenant

Free Trials

Anonymity

Horse Power

Heterogeneous Attack Surface

#RSAC
Cloud Services ­ Shared Responsibility

#RSAC
What are the risks for the provider?

Compromise infrastructure Cloud Weaponization Compromise tenant

Impact to provider Impact to target Impact to cloud adoption

#RSAC
Cloud attack case studies

#RSAC
"Public Secrets" Attacker Profile

"LOW" SOPHISTICATION

"LOW" FOCUS

#RSAC
"Public Secrets" ­ Attacks Against Tenants

2

3

1

#RSAC
"Deep Impact" Attacker Profile

"MEDIUM" SOPHISTICATION

"HIGH" FOCUS

#RSAC
"Deep Impact" ­ Attacks Against Tenants

1

N

3

4

Man In The Cloud
2

#RSAC
"Big Target" Attacker Profile

"HIGH" SOPHISTICATION

"HIGH" FOCUS

#RSAC
"Big Target" ­ Attacks Against Tenants

1

2

TOR

N

3

PROXY
4

#RSAC
Threats on the horizon

#RSAC
"Man In The Cloud" ­ In-Direct Tenant Attacks
2
N
3
1 2
Source: https://www.imperva.com/docs/HII_Man_In_The_Cloud_Attacks.pdf

#RSAC
"Side Channel" ­ Indirect Tenant Attacks
4 3
N
1
2
Source: http://cseweb.ucsd.edu/~hovav/dist/cloudsec.pdf

#RSAC
"Resource Ransom" ­ Direct Tenant Attacks
2

1 3

Backup
4

#RSAC
Kill Chain Differences

Phase

On-premises

Public Cloud*

Active Recon

HUMINT, OSINT (Users)

Foot printing (Services)

Delivery

Browser, Mail, USB (User Interaction)

Hacking (No User Interaction)

Exploitation

Client-Side vulnerabilities

Server-Side vulnerabilities

Persistence

File System Based

Memory Based

Internal Recon

Custom Tools

Built-in Admin Tools

Lateral Movement

Machine Pivot

Resource Pivot

* Cloud environments add new attack vectors on top of the regular enterprise attack vectors

#RSAC
Cloud Clean Chain ...or how to not become a case study

#RSAC
Apply - Prevention
For the developer:  Remember the SDL  Never check Shared Secrets and Private Keys into source control  Track, monitor, and review who has access to your subscription  Enable and validate logging on Cloud resources
For the subscription owner & infrastructure engineer:  Maintain accurate contact information with your cloud provider  Control and monitor management ports exposed to the internet  Scrutinize authentication choices, and how secrets are controlled  Validate patch processes (for IaaS and containers)  Extend mature IT security processes to the cloud

#RSAC
Apply - Detection
For the security IT:  Think in graphs, visualize your environment!  Enable, collect, monitor logs in all your resources  Correlate Network, VM and resource signals  Cluster events from the same resource groups  Map alerts into kill chain to track movement  Deploy external/internal Honeypot to gain insights  Leverage Threat Intelligence wherever possible

#RSAC
"Final" Apply Slide
 Understand your cloud attack surface  Review the kill chain differences  Follow & implement the cloud clean chain  Explore security services provided by your cloud providers

#RSAC
Summary
Cloud services is a shared responsibility Cloud clean chain can help reduce the attack surface Don't reinvent the wheel, extend it!

#RSAC
Q&A

?
Craig Nelson Security Software Engineering Manager
Microsoft, MSRC (Azure) @ath0nocarrier

Tomer Teller Azure Security Research PM
Microsoft, Azure Security @djteller

#RSAC
Thank You

