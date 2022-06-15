SESSION ID: CSV-F02
Democratizing Cloud Security Our Journey To Secure The Public Cloud

Hardeep Singh
Sr Principal Security Engineer Symantec Corporation/Cloud Platform Engineering

Yunchao Liu
Sr Software Engineer Symantec Corporation/Cloud Platform Engineering

#RSAC

#RSAC
Why The Need To Democratize Security?

Centralized, Process Driven
On Premise ­ Private, limited resources, defined vectors
Strict separation of duties

Decentralized, agile adhocracy
Public Cloud ­ Unlimited resources, unrestricted vectors
DevOps wear many hats

Centralized SOC ­Policies evolved on private data centers

2

#RSAC
Journey To Secure The Public Cloud Environment

q Extend framework to cover forensics & SDLC
q Implement processes & services for developers & responders

q Integrate compliance & audits into the framework
q Automate enforcement & remediation

q Establish a cloud based security maturity framework q Identify security controls for environment q Implement processes & services for operators

3

#RSAC
Security Maturity Framework

Established a working group of security practitioners from all BU's

Identified ownership at all levels Built consensus Identified account onboarding process Identified time lines for compliance

Defined security maturity polices

Observable, actionable & enforceable polices only

Enforced compliance

Started with baseline CIS AWS recommendations
Extended to identify insecure resources

Established an exception process Created detailed reports on non compliance Automated enforcement

Enhanced to cover internal polices, Created services to help

SDLC, forensics & compliance

operators, developers &

responders in implementing

security policies

4

#RSAC
Security Maturity Policies

Cloud Environment
Optimize IAM users & policies All audit logs centralized Restrict public access to resources Encrypt all storage resources Define a mandatory tagging policy Facilitate Incident responders (reactive)

SDLC
Golden Image - scans in build cycle TVM- Response to new CVE's Threat Modeling of all services Secret & credentials management Pen testing, game days, bug bounties Auditable processes

5

Security Services
Put the Sec in DevSecOps

#RSAC
Key Areas Of Focus For Security Services
Access Control Inventory & Monitoring
SDLC Forensics
7

Access Control
Authentication & Authorization

#RSAC
Common Access Control To Rule Them All

Federated Broker for AWS API & Console
X509 certs for SSH, Kubernetes & Vault
OpenID Connect for services
LDAP Groups and Directory Lists for Roles
MFA on authentication

Kubernetes Access
Instance Access

Service Access
Corp ADDL/LDAP Groups &
MFA
Private Data Center Access

Vault Access
AWS Access

9

Comprehensive Access Control Services

Authentication
· Corporate authentication boundary extended to the cloud
· SSO with MFA on all environments
· Ephemeral key for operators
· Long lived credentials only for services (stored in vault)

Authorization
· Corporate authorization boundary extended to cloud
· Integrated with corporate directory lists and LDAP groups
· Centralized privilege management
· Decentralized delegation · Process to allow incident
response team access

#RSAC
Environment
· AWS Console · AWS API · EC2 Instance · On-Prem/Private Data
Center VM's · Kubernetes cluster · Secrets Vault · Data Stores · Other Services

10

#RSAC
Authentication Service For DevOps- Keymaster
Generates Ephemeral X509 Certs for authentication
­ SSH to EC2 instance & on premise VM's ­ Kerberos compatible (pkinit) ­ Kubernetes compatible
Integrated with corporate active directory Provides 2FA via VIP and/or YubiKey Provides OpenID Connect support for web services Embeds LDAP groups into certificate for Kubernetes authorization
­ Embeds IP range from where certificate is valid
11

#RSAC
Authorization via LDAP groups- Smallpoint
LDAP group management tool Integrated with corporate active directory
­ Authenticated by Keymaster
Groups can mange other groups Service accounts can be managed like user accounts Light-weight
­ ~5K LOC
12

#RSAC
Authorization Service For AWS - Cloud-Gate
Federated Broker for AWS API access for DevOPs
­ Maps Corp DL to AWS Roles & Polices ­ Assumes the mapped AWS roles on
users behalf
Generates ephemeral AWS API credentials for DevOps Integrated with Corp Active Directory
­ Authentication via Keymaster
Enables DL owners control of membership
13

Inventory
Feeds Reporting, Enforcement, Forensics & TVM Services

#RSAC
Centralized Inventory Of All Resources

Service to catalog assets in all AWS accounts in the fleet Extends catalog to on premise resources Retain state & configuration history of every resource Source of truth for security & governance reports API access for other services Common view across otherwise siloed environment Enables operators & incident responders to track resources

Operators & Auditors

Maturity Compliance Reporting & Enforcement
Inventory

Incident Response Services

Deployment &
Automation

TVM Services

15

#RSAC
Compliance Monitoring & Reporting
Security Maturity Analysis And Reporting Tool Monitors accounts for compliance to security maturity polices Aggregates non compliance by business unit, VP, payer accounts Identify on individual resource owners and send alerts Implements an exception process
16

#RSAC
Compliance Enforcement Services

Cloud Custodian & CWA
­ Security maturity compliance
Reaper
­ IAM User cleanup
RIP
­ IAM Policy Optimizer
CWP
­ Endpoint protection

Remove noncompliant resources
Open ticket for owner to fix service

17

Enforcement Service
Check if any exception filed

Read resources configuration &
state Check against
security maturity polices

#RSAC
RIP - Remove Irrelevant Polices

Access advisor limited
­ Lists services used ­ Does not identify API's
Cloudtrail logs API calls
­ Query logs associated with IAM Role/User/Group
­ Cloudtrail does not log all API actions
Enforce explicit API listing in policy

List the API privileges granted for each service in
a policy

automatically remove unused API
privileges

Query the logs to identify API calls made by the role in
last n days

Open ticket for owner to fix policy

Identify unused API' for removal

18

SDLC
TVM & Service Security Assessment

#RSAC
Service Security Assessment
Catalog each services security posture Scanning ­ Static, Dynamic & Image Audit readiness Track Inventory Security score across all services
20

#RSAC
Service Secrets Storage - Vault

Inventory of all secrets
­ All secrets stored in vault ­ All services read from vault
All secrets rotated randomly
­ All secrets considered ephemeral
­ Monitor vault to ensure rotation

Curl
­ curl --header "X-Vault-Token:$VAULT_TOKEN" $VAULT_ADDR/v1/secret/data/path_to_secret
NodeJS
­ request.get({ url: https://volturl/v1/path_to_secret, headers: ,{"X-VaultToken": vault_process.env.VAULT_TOKEN,"Content-Type": "application/json" }, method:'GET'}, function( ...
Python

21

#RSAC
Demo for Vault
22

#RSAC
Integrate TVM With The Build Process

Audit log collectors

SEP agents

Code, Web & Image Scans

Secure Image

Update security reports

Identify active instances

Monitor image for new CVE's

23

Scanning Services
Scanning micro services that can integrate with CI/CD One or more containers per scan type Asynchronous (SQS) Results stored in S3 & RDS
24

#RSAC
User/API

Main Portal Pod 1

Scan arguments
Scanner(s)
Pod 2..n

S3/RDS

#RSAC
Static Code Scanning Service

SonarQube a self service ­ Install SonarQube server and
scanner in containers.
­ Install plugins for more programming languages o SonarQube has some major languages plugins as default.
­ Configure scan
o Scan parameters

Main Portal

1. URL

RDS

SonarQube 2. Scan Scanner starts

3. Send scan elements

4. Send scan analysis result

SonarQube Server

Pod 2
25

#RSAC
Image Scanning Service
Qualys scan
­ Asynchronous flow
­ Launch & wait for scan result
­ Parse result to get scores
­ Store result & scores in repo
­ Track remediation
26

#RSAC
Container Scanning Service
Black Duck
­ Install Black Duck scanner on the machine where your code is placed
­ Configure scan settings ­ Parse result to get scores ­ Store result & scores in repo ­ Track remediation
27

#RSAC
Dynamic Web Scanning Service - Zed Attack Proxy (ZAP)
MITM proxy
­ Passive/Active scans
Integrate with CI/CD
­ ZAP plugin for Jenkins ­ Configure plugin ­ Configure project ­ Configure session ­ Configure attack
mode
28

Forensics
Logging, Monitoring & Alerting

Logging Services

Consolidate all logs into a central service
­ System/Auth, Cloudtrail, VPC Flow, Kubernetes Audit, DNS, Application
Monitor heartbeat to ensure that logs are being collected Provide API access to logs Predefined views Long-term storage for compliance GDPR sensitive

Operators & Auditors

30

Alerting Service
Logging Service
Others Services

#RSAC
Policy Optimization
Service

#RSAC
Behavior Anomaly Detection And Alerting Service
Allow operators to create security alerts on their logs
­ Reduces false positives ­ Democratizes security
alerting
Bcoumildmboansevleincetoarlserts for
­ Well defined vectors ­ Low false positives
Alerts on behavior cuhsaagneges in credential
­ Change in source or target
­ Change in API called and/or API parameters
31

#RSAC
Incident Response Services (Reactive)
Incident response process documented and distributed Help responders identify ownership and involve the owners during forensics Build services to enable responders to quickly take over effected resources Create a consolidated view of all relevant logs for the effected assets/service Review process and feedback into security maturity framework
32

Summary

#RSAC
Summary
Evolve security by democratizing it Create a Security Maturity Framework Build services to help DevOps achieve security maturity Decentralize security monitoring & alerting Integrate TVM in the SDLC Revisit every quarter to identify what works & what doesn't
34

Links
CIS https://d0.awsstatic.com/whitepapers/compliance/AWS_CIS_Foundations_Benchmark.pdf Keymaster https://github.com/Symantec/keymaster Cloudgate https://github.com/Symantec/cloud-gate Cloud Custodian https://github.com/cloud-custodian/cloud-custodian SonarQube https://github.com/SonarSource/sonarqube ZAP https://github.com/zaproxy/zaproxy Clair https://github.com/coreos/clair Smallpoint https://github.com/Symantec/ldap-group-management Blackduck https://www.blackducksoftware.com/black-duck-home Security Scans Wrappers: https://github.com/Symantec/security-scan-wrappers CWP https://www.symantec.com/products/cloud-workload-protection Vault Self Service https://github.com/hardeep-s/vault-exchange
35

#RSAC

