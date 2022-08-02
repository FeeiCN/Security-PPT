Building Security into Azure

Sophistication of threats
Too many disconnected
products

IT deployment & maintenance

44%
of alerts are never investigated

Expanding digital estate Security Operations Challenges

Lack of automation

3.5M
unfilled security jobs in 2021

Endless complexity

Zero Trust is a mindset
à Assumes pervasive risk à Every access attempt as if it's originating from an untrusted network
Zero Trust model

Principles of Zero Trust

PROTECT

Security Intelligence
!
RESPOND

DETECT

Azure
$1B annual investment in cybersecurity 3500+ global security experts Trillions of diverse signals for unique intelligence

Microsoft Azure

Web App Azure VM

Azure Key Vault (AKV)

Blob storage

Azure Container Registry (ACR)

Azure Kubernetes Services (AKS)

Azure SQL

Private Datacenter / Other clouds

Exposure
Insecure configuration Vulnerabilities
Infected admin
Open entry points Exposed credentials Compromised user

Access
Virtual machines Apps Credentials Data stores IoT devices

Lateral movements

Actions

Virtual machines Apps Credentials Data stores IoT devices

Data loss Data exfiltration Ransomware Resource abuse

Common threats

Ø Brute force of open management ports
Ø Exploit through an unpatched vulnerability
Ø Run bitcoin mining on a compromised VM

Ø Exposed Kubernetes dashboards Ø RBAC not configured in the cluster Ø Insecure container/host configuration

Ø Web shell deployment Ø server-side request forgery (SSRF) Ø Reconnaissance attempts

Ø SQL injection vulnerabilities and attacks
Ø Access by a remote threat actor
Ø Brute-force against SQL credentials

Ø Use to propagate malware or load malicious images/packages
Ø Access by a remote threat actor
Ø Public access to storage accounts
Ø Harvest for reconnaissance or exfiltration of data

Ø Permissive policies grant access to unneeded resources
Ø Harvest for secrets

Azure security center

Strengthen security posture
Cloud security posture management
Secure Score and Policies & compliance

Protect against threats

servers

cloud native

Data & Storage

Get secure faster

Protect your workloads from threats
Use industry's most extensive threat intelligence to gain deep insights

Detect & block advanced malware and threats for Linux and Windows Servers on any cloud
Protect cloud-native services from threats
Protect data services against malicious attacks
Protect your Azure IoT solutions with near real time monitoring
Service layer detections: Azure network layer and Azure management layer (ARM)

VMs/

Servers

Apps

Containers

SQL

IoT

Network

management

Azure Security Center
Cloud workload protection

2018 2019

Protect Linux and Windows VMs from threats

Reduce open network ports:
Ø Use Just-in-Time to avoid exposure of management ports
Ø Limit open ports with adaptive network hardening
Protect against malware:
Ø Block malware with adaptive application controls
Ø Built-in Microsoft Defender ATP EDR
Ø Crash dump analysis and fileless attack detections

On-premise

Azure, AWS, and GCP

Antimalware Defender ATP
!

Behavior analytics
!

App control
!

Lateral Movement

Malicious code execution

Data exfiltration

Announcing built-in vulnerability assessment for VMs
Available as part of standard ASC for VM pricing, no extra charge
Ø Automated deployment of vulnerability scanner
Ø Continuously scans installed applications to find vulnerabilities
Ø Visibility to the vulnerability findings in Security Center portal and APIs

Protect hybrid datacenters and multi-cloud with Azure security center
Hybrid Server protection for Datacenters and other clouds Onboard on-prem servers to Security Center from Windows Admin Center Auto-onboard AWS EC2 instances using a new API connector (preview)

Cloud workload protection for hybrid VMs and servers

Central management

Automatic onboarding & extending to hybrid
cloud

Server security hygiene

File integrity monitoring

Reduce attack surface

Cloud native network security controls

Adaptive application control

Built-in vulnerability Assessment

Detect advanced threats

Built-in EDR with Microsoft Defender
ATP

Detect and block advanced threats for
servers

Cloud-native detections

Server & VM threat protection with Azure Security Center

Protect cloud-native workloads from threats

Ø Detect and alert on abnormal admin behavior or compromised web applications
Ø Protects VMSS and containers from malicious attacks
Ø CIS benchmark for Dockers on Linux IaaS & vulnerability scanning on ACR images

Azure Web Apps

VMSS

!

!

Containers
!

>75% of global organizations will be running containerized applications in production by 2022 (Gartner)

Built-in vulnerability assessment for container images
Public preview available in standard ASC with a new container registries add-on
Ø Seamless deployment and configuration of the vulnerability scanner
Ø Scan container images for vulnerabilities upon push to an ACR
Ø Visibility to vulnerable ACR container images including vulnerabilities details, severity classification and guidance to remediation

Cloud workload protection for containers
Now available in standard Azure security center with the new container service add-on
Protecting Container hosts (IaaS) Ø CIS Docker Benchmark assessment Ø Node Threat Protection
Protecting AKS Ø Actionable recommendations based on AKS
best practices Ø Cluster and Node Threat detection based on
AKS audit log and Node Auditd

Protecting against advanced cloud threats

Threat Actor

Recommending to use RBAC on K8s
Detects suspicious request to K8s API Detects privileged container Detects crypto mining image Detects sensitive volume mount
Exploit

Master Node API Server
Azure VM

Node 1
Container Container

Node 2
Vulnerable application

API request (deploy container)

Container

Azure VM

Azure VM

Node 3

Privileged w/ crypto miner & root access
to Node 3

Malicious container

Container

Azure VM

Protect data services from threats

Ø Prevent & detect threats targeting your Azure SQL databases, My SQL, PostgreSQL
Ø Discover and remediate security misconfigurations in Azure SQL databases
Ø Storage account protection to detect threats and misuse
Ø Discover, classify, label and protect sensitive data in your Azure SQL databases

!

SQL

MySQL

Azure Storage

New advanced protection capabilities for data services
Now in preview
Protect SQL servers on Azure VMs Vulnerability assessment and Advanced Threat Protection to prevent and detect threats across SQL estate in Azure
Malware reputation screening for Azure Storage Detect advanced threats in Azure Storage with hash reputation analysis upon upload
Advanced Threat Protection for Azure Key Vault Detect unusual and potentially harmful attempts to exploit Azure Key Vault

Detections of the common cloud threats

Ø SQL injection vulnerabilities and attacks
Ø Access anomalies by location, principal, or application
Ø Brute-force against SQL credentials
Ø And more...

Ø Malware reputation screening or suspicious files (.cspkg)
Ø Access anomalies by location, principal, or application
Ø Permission change anomalies, anonymous access detection
Ø And more...

Ø Access from a suspicious location, Tor network
Ø Unusual policy change or listing and secret get
Ø Unusual volume or pattern of Key Vault operations
Ø And more...

Example solution architecture on Azure

Web App Azure VM

Azure Key Vault (AKV)

Blob storage

Azure Container Registry (ACR)

Azure Kubernetes Services (AKS)

Azure SQL

Private Datacenter / Other clouds

Azure security center enterprise integrations

Driving threat protection through the organization
Through a central SecOps & cloud governance role

Governance SecOps

Requirements

Requirements

Findings

Requirements

Requirements

Findings Requirements

Findings

Findings

Findings

Team 1

Team 2

Team 3

Team 4

Team 5

Threat protection for cloud at scale: Export assessments and alerts for security roles

SIEM

App

Network

Microsoft 365

SQL

Azure Security Center

Access

ASC Connector

IoT

Compute

Azure Security Center Cloud Workload Protection

Azure Sentinel
Azure Sentinel Cloud Native SIEM

Automate workflows with ASC
Automate workflows with ASC  Trigger playbooks based on ASC
recommendations and alerts  Built-in playbooks, build your own with
Azure Logic apps
New community hub  Share workflows and remediation policies
with the community the things that you've built  Learn what others did and deploy directly to Azure
Automate and script through API and PowerShell

Protect your workloads against threats: a go-do list

01
Good hygiene comes first, strengthen your cloud security posture

02

03

Turn on threat protection for all Reduce attack surface for VMs

cloud resources

with JIT, Network and app controls

04
Integrate alerts into your SIEM & notify app owners

05
Identify root cause and drive new security hygiene up

Azure security center announcements

Enhanced threat protection for your cloud resources with security center

App

Containers

Network

Enhanced cloud security posture management

SQL
IoT
Extending Security Center's coverage with platform for community & partners

Partners

Access Implement security faster with Security Center
Compute

Inner and Outer Loop Development

Securing your codebase with GitHub

CONFIDENTIAL

Understand and secure your software supply chain
View and track all your dependencies with Dependency
Insights and Dependabot
Get automated security alerts and version patches

99%
of enterprise projects use open
source today

Integrate security into your code-to-cloud workflows
Scan for thousands of vulnerabilities with Semmle
Protect leakage of secrets with GitHub Token Scanning

Outer loop
Available today
(via Support)

A 1st Step
Microsoft Confidential

Outer loop
Available today
(via Support)

A 1st Step
Microsoft Confidential

Partners

And one last thought... Gravity continues to shape our universe

and our thoughts shape our world

Together, we can shape the security of our digital world... !

To learn more, visit azure.microsoft.com/en-us/services/security-center/
ASC Tech Community Page

