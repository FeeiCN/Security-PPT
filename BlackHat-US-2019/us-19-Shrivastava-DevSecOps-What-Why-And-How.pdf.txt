DevSecOps What Why and How?
Anant Shrivastava @anantshri
NotSoSecure Global Services

About: Anant Shrivastava
Director NotSoSecure Global Services Sysadmin / Development / Security Project Owner: AndroidTamer, Codevigilant Contributor : OWASP, null, G4H and more https://anantshri.info (@anantshri on social platforms)
NotSoSecure Global Services (a Claranet group company) Boutique Consulting firm specialized in training and consulting
2

Agenda
 What is DevSecOps?  Why do we need DevSecOps?  How do we do DevSecOps?  Integrate Security in Pipeline  Tools of Trade  Sample Implementation  Case Studies
3

Disclaimer
 I will be listing a lot of tools, It's not an exhaustive list  I don't endorse or recommend any specific tool / vendor  Every environment is different: Test and validate before
implementing any ideas
4

What is DevSecOps?
Effort to strive for "Secure by Default"  Integrate Security via tools  Create Security as Code culture  Promote cross skilling
5

Why do we need DevSecOps?
 DevOps moves at rapid pace, traditional security just can't keep up
 With rapid pace of development and large scale of application devsecops makes it easier to manage
 DevSecOps allows for much smoother scaling of process  Security as part of process is the only way to ensure safety
6

Shifting Left saves cost & time

Source

Developer

Code

Repository

Build

CI/CD Server

Staging/QA Production Monitoring

Penetration Testing

7

Shifting Left saves cost & time

Source

Developer

Code

Repository

Build

CI/CD Server

Staging/QA Production Monitoring

Penetration Testing

Automated Source Code Review

1 SQL Injection Fewer Man Day Effort No New Deployments

8

How do we do DevSecOps?
 DevSecOps is Automation + Cultural Changes  Integrate security into your DevOps Pipeline  Enable cultural changes to embrace DevSecOps
9

Developer
Pre-Commit Hooks IDE Plugins

Code Repository
Secrets Management

Injecting Sec in DevOps

CI/CD Server

Pre-Build
Static Application Security Testing(SAST) Source Composition Analysis (SCA)

Post-Build
Dynamic Application Security Testing(DAST)

Artifact Repository
Build Artifacts versioning against code commits
QA/Staging
Manual Web Application Pentesting Business Logic Flaws

Production
Security in Iaac Compliance as Code Alerting & Monitoring

Vulnerability Management
10

Sample Implementation
· A simplistic flow of DevSecOps Pipeline incorporating the stages mentioned earlier
11

Tools of The Trade

Threat Modelling Tools Pre-Commit Hooks

ThreatSpec.

Microsoft Threat Modeling Tool

truffleHog Git Hound

Software Composition Analysis
Static Analysis Security Testing (SAST)

Retire.js

IDE Plugins

CAT.net

Secret Management

Keywhiz

Preference given to open-source tools; we don't endorse any tool

12

Tools of The Trade

Vulnerability Management Dynamic Security Analysis
Infrastructure Scan

Compliance as Code WAF

Docker Bench for Security

Preference given to open-source tools; we don't endorse any tool
13

To be or Not to Be in Pipeline
 API / command line access  Execution start to final output should be 15 minutes max  Tools should be Containerized / scriptable  Minimal licensing limitations (parallel scans or threads)  Output format parsable / machine readable (no to stdout,
yes to json / xml)  Configurable to counter false negatives / false positives
14

Does Programming Language Matter
 Different programming languages need different tools for static analysis and software composition analysis
 Some tools support multiple languages like sonarqube  Others are focused on one language
15

Language Specific Tools

Languages

Software Composition Analysis

Source Code Static Analysis

JAVA PHP

ClearlyDefined

graudit graudit

Python

graudit

.NET

DotNET Retire SafeNuGet

Ruby/Rails

Node JS

ClearlyDefined

Preference given to open-source tools; we don't endorse any tool

Brakeman
npm-check NodeJsScan

DotNet Security Guard
graudit
16

What about Cloud
· The Threat Landscape changes
- Identity and Access Management - Billing Attacks
· Infrastructure as Code allows quick audit / linting · Focus more on:
- Security groups - Permissions to resources - Rouge /shadow admins - Forgotten resources (compromises / billing)
17

Cloud Native Approach to Security
 Different Service Providers Approach Security Differently  All of them provide some of the ingredient in-house  Irrespective of Cloud provider some tools will still need to
be sourced  Static Code Analysis Tool  Dynamic Code Analysis Tool  Software Composition Analysis  Vulnerability Management Tool
18

AWS Cloud Native DevSecOps
19

Cloud Native Dev[Sec]Ops

Source Code Management Infrastructure As a Code

Conventional Infra Bitbucket, Github, Gitlab etc.. Chef, Puppet, Ansible more..

AWS AWS CloudCommit Amazon CloudFormation

Azure Azure Repos Azure DevTest Labs

GCP Cloud Source Repositories
Cloud Code

CI/CD Server

Jenkins, Bamboo, Gitlab, Travis CI, Circleci more

AWS CodeBuild AWS CodeDeploy AWS CodePipeline

Azure Pipelines, Azure Test Plans

Cloud Build, Tekton

Artifactory Repository

jFrog Artifactory, Sonatype Nexus, more..

Amazon S3

Azure Artifacts

Cloud Firestore

Stg/Prod Servers
Monitoring & Alert Firewall DLP
Threat Detection Vulnerability Scanning Secrets Management

VMWare, On-premises servers
Nagios, Graphite, Grafana Modsecurity
MyDLP, OpenDLP Snort, Kismet
OpenVAS, Nessus Hashicorp Vault, Docker Secrets

EC2 ECS (Elastic Containers) EKS (Elastic Kubernetes)

Virtual Machines, Azure Lab Services, Azure Kubernetes Service (AKS)

Compute Engine, App Engine, Shielded VMs

AWS CloudWatch
AWS Firewall Manager, AWS WAF

Azure Monitor, Network Watcher Azure Firewall

Access Transparency Application Gateway

Amazon Macie Amazon GuardDuty Amazon Inspector AWS Secrets Manager

Azure Information Protection
Azure Advanced Threat Protection
Azure Security Center Azure Key Vault

Cloud Data Loss Prevention Event Threat Detection (beta)
Cloud Security Scanner Secrets management

20

Cultural Aspect
 Automation alone will not solve the problems  Focus on collaboration and inclusive culture  Encourage security mindset specially if it's outside sec
team  Build allies (security champions) in company  Avoid Blame Game
21

Security Champion
 Bridge between Dev, Sec and Ops teams  Build Security Champions
 Single Person per team  Everyone provided with similar cross skilling opportunities  Incentivize other teams to collaborate with Sec team
 Internal Bug bounties  Sponsor Interactions (Parties / get-togethers)  Sponsor cross skilling trainings for other teams
22

Security Enablers

People
· Build relationships between teams, don't isolate
· Identify, nurture security conscious individuals
· Empower Dev/ops to deliver better and faster and secure, instead of blocking.
· Focus on solutions instead of blaming

Process
· Involve security from get-go (design or ideation phase)
· Fix by priority, don't attempt to fix it all
· Security Controls must be programmable and automated wherever possible
· DevSecOps Feedback process must be smooth and governed

Technology
· Templatize scripts/tools per language/platform
· Adopt security to devops flow don't expect others to adopt security
· Keep an eye out for simpler and better options and be pragmatic to test and use new tools
23

Generic Case Study
24

Case Studies ­ Fannie Mae

https://www.slideshare.net/DevSecOpsDays/fannie-mae-devsecops-journey-with-chitra-elango-and-john-willis

25

Case Studies ­ Fannie Mae

https://www.slideshare.net/DevSecOpsDays/fannie-mae-devsecops-journey-with-chitra-elango-and-john-willis

26

Case Studies ­ ABN Amro

https://www.slideshare.net/derweeksglobal/abn-amro-devsecops-journey

27

Case Studies ­ ABN Amro

https://www.slideshare.net/derweeksglobal/abn-amro-devsecops-journey

28

Negative Case Studies
Cloud Assets Misconfiguration
Prevention: Continuous monitoring and review of cloud assets and config
29

Is it Enough?
 Rite of passage by periodic pen test and continuous bug bounty  It's not just important to get feedback but to also action on them  Risk Acceptance Documentation should be the worst case scenario
not your first bet
30

References
· https://www.blackhat.com/docs/us-17/thursday/us-17-Lackey-Practical%20Tips-for-Defendin
g-Web-Applications-in-the-Age-of-DevOps.pdf
· https://www.sonatype.com/hubfs/2018%20State%20of%20the%20Software%20Supply%20
Chain%20Report.pdf
· https://snyk.io/opensourcesecurity-2019/ · https://www.veracode.com/state-of-software-security-report
31

Key Takeaways
 Security is everyone responsibility  Embrace security as an integral part of the process, use feedback to
refine the process
 DevSecOps is not a one size fit all: your mileage will vary
32

Questions and Discussion
Questions &
feedback devsecops@notsosecure.com
33

