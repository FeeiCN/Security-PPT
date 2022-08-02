Cloud Breaches: Case Studies, Best Practices, and Pitfalls

Christopher Romano Senior Consultant, Mandiant

Dylan Marcoux Consultant, Mandiant

1

©2020 FireEye

Agenda
 Introductions  Cloud Threat Landscape Overview  Frequent Attacker Methodologies  Common Weaknesses & Root Causes  Best Practices  Case Studies

2

©2020 FireEye

Christopher Romano

Senior Consultant at Mandiant Over 14+ years of security experience Based in USA Interested in "Everything Cloud", DFIR, pentesting, Architecting things securely Christopher.Romano@Mandiant.com

3

©2020 FireEye

Dylan Marcoux

4

©2020 FireEye

Consultant at Mandiant
7+ years of security experience
Based in central Canada
Interested in malware analysis, DFIR, architecture/ops, pentesting, web apps, "the cloud"
Okay at Brazilian Jiu-Jitsu
Dylan.Marcoux@Mandiant.com

Case studies and examples are drawn from our experiences and activities working for a variety of customers, and do not represent our work for any one customer or set of customers. In many cases, facts have been changed to obscure the identity of our customers and individuals associated with our customers.

5

©2020 FireEye

Current Threat Landscape

Rapid growth in cloud adoption

Lack of awareness of specific security
features

Misconfiguration of tenant settings

6

©2020 FireEye

Cloud Cybersecurity Statistics

24%
Of Organizations Have Hosts Missing Critical Patches

95% 84% 11%

Of Cloud Security Failure Is The Customer's Responsibility

Of Organizations Say Traditional Security Tech Doesn't Work In
Cloud

Of Mandiant IRs Have A Significant Cloud Component

7

©2020 FireEye

M-Trends 2020 Key Cloud Highlights[1]

Lack of cloud adoption for threat detection and response

Attackers utilizing hybrid environments

Credential management is paramount

Lack of granularity for policies and permissions

8

©2020 FireEye

[1]: https://content.fireeye.com/m-trends/rpt-m-trends-2020

Frequent Attacker Methodologies

9

©2020 FireEye

Rogue Devices and Shadow IT

UNAUTHORIZED MACHINES

APPS LACKING SECURITY

INTERNET FACING REMOTE
MANAGEMENT

UNPATCHED APPLICATIONS

IT ADMIN BACKDOOR

10 ©2020 FireEye

Credential Compromise via Public Exposure

AWS Azure GCP

2 3
1

11 ©2020 FireEye

Cloud Platform Service Attacking

· External reconnaissance to find API
· Find vulnerability in container-based API
Initial Access & Gain Foothold

Establish Persistence & Internal Recon
· Container permissions allow for the creation of a function
· Use function to post valid API keys/session tokens on schedule

· Set up public storage · Exfiltrate data to
publicly accessible storage
Complete Mission

12 ©2020 FireEye

Example: "Gone in 60 Milliseconds" https://www.youtube.com/watch?v=YZ058hmLuv0

Hybrid-Cloud Lateral Movement via Cloud App
4

1

2

3
13 ©2020 FireEye

Third-Party Library Supply Chain Attack

NPM

3

4

AppDev

14 ©2020 FireEye

2

1

Example: https://blog.npmjs.org/post/180565383195/details-about-the-event-stream-incident

And Many More...
 Datastores without access control
­ E.g., Open AWS S3 Buckets
 Credential compromise
­ E.g., Through an infected endpoint or phishing
 Third-party application
­ E.g., Phishing that asks for malicious OAuth application approval, malicious application download from Apple's AppStore or Google's Play Store
15 ©2020 FireEye

Root Causes and Common Observations
16 ©2020 FireEye

Common Root Causes

Insufficient protection of critical assets

Insufficient incident detection and response

Poor identity and access management / privilege
management

Lack of understanding about the environment

17 ©2020 FireEye

Top O365 and Azure Observations

Identity and Access Management
Legacy authentication protocols enabled Not using MFA Too many privileged accounts
19 ©2020 FireEye

Hardening of Administration
Remote PowerShell typically enabled for all users
Privileged access workstations rarely used
Misuse of administrative credentials
20 ©2020 FireEye

Service Hardening and Logging
Minimal control of access to services Poor hygiene of cloud networking configuration No integration into current security detection and response Lack of log monitoring and threat hunting
21 ©2020 FireEye

Top AWS Observations
22 ©2020 FireEye

Identity & Access Management

AWS Managed Policies are known to be overly permissive
Permission Boundaries and Service Control Policies not being used

Not using MFA for both Console or Commandline Interface
Lack of rotating IAM Access Keys

IAM policies are given wild card access on AWS resources
Long-lived credentials being used

23 ©2020 FireEye

Hardening of Administration

Hardened jump hosts or PAWs not utilized to access AWS environments
Abuse of AWS services and attached roles (e.g., CloudFormation, Lambda, SSM)

Shared SSH keys across EC2 instances
Misuse of administrative credentials

24 ©2020 FireEye

Misconfigured IAM policy that permits privilege escalation

Service Hardening and Logging

No control over services or regions

Permit users to pass any role to any given
service (e.g., EC2, Lambda)

No integration into current security detection and response

Lack of knowledge on advance logging
features

Lack of log monitoring and threat hunting

25 ©2020 FireEye

Top GCP Observations
26 ©2020 FireEye

Identity & Access Management

Service accounts being used for daily tasks

Overly-permissive IAM roles

Lack of structure or governance for projects
and folders within organization

Lack of rotating usermanaged service account keys

27 ©2020 FireEye

Hardening of Administration

Bastion hosts or networks not utilized to access GCP
environments

Misconfigured IAM policies that permits privilege escalation

Lack of MFA enforcement across accounts

Super administrator and administrative accounts
used for day-to-day activities

28 ©2020 FireEye

Service Hardening and Logging

No use of GCPnative tools such as
Cloud Security Command Center

Storage buckets with unrestricted
permissions or the ability to set IAM
policies

No integration into current security detection and response

Lack of knowledge on advance logging
features such as collecting Admin
Read events

Lack of log monitoring and threat hunting

29 ©2020 FireEye

Best Practices
30 ©2020 FireEye

Best Practices

Identity and Access Management
·Require multi-factor for console, CLI access, and roaming users
·Utilize principle of least privilege for IAM permissions assignment
·Restrict number of privileged accounts
·Utilize temporary credentials or Just-in-Time access when possible
·Use dedicated admin accounts
·Implement privileged access workstations

Governance, Risk and Compliance
·Implement account guard rails to ensure proper Governance
·Understand shared responsibility for each service in the cloud
·Understand the terms of contracts with any cloud service providers
·Determine compliance requirements for organization and understand how the cloud service provider controls apply

Configuration Management
·Restrict usage of legacy authentication protocols
·Restrict console and CLI to trusted source IP addresses/ranges
·Audit for overly permissive network security rules
·Back-ups and disaster recovery
·Building resilient services

31 ©2020 FireEye

Best Practices continued

Application Security and DevOps
·Prevent credentials from being committed to Code repositories
·Scan Infrastructure as Code templates to look for misconfigurations
·Scan code and third-party libraries for vulnerabilities
·Utilize dummy data in development
·Implement test-driven security

Secrets and Data Protection
·Rotate access keys frequently
·Monitor for secret leakage
·Have a plan to revoke and rotate secrets
·Leverage resource tags to control access to resources and alerting
·Encrypt data in motion and at rest
·Apply data classification standards across cloud resources

Threat Detection and Response
·Ensure logging and security measures are extended to the cloud
·Enable advanced logging features for sensitive resources
·Aggregate log sources to SIEM
·Enhance SIEM alerts to include cloud-focused alerts
·Apply cloud security practices to incident response plans and playbooks

32 ©2020 FireEye

Summary/Key Take Away
The Solution

NEED FOR ROBUST IAM SOLUTION
"THE GATE KEEPER"

ASSESS CLOUD INFRASTRUCTURE EXISTING
CONTROLS "PUT IN GUARD RAILS"

THREAT DETECTION AND RESPONSE "NIGHT WATCH"

 The challenge:
­ Attackers following data to the Cloud
­ Lack of Cloud security expertise
­ Insecure default settings

33 ©2020 FireEye

Case Studies

Mandiant Incident Response Case Studies: Insider Threat Timeline

Opportunity for prevention! Access not terminated
Opportunity for detection! Sensitive object storage accessed outside of working hours
Opportunity for prevention! Unknown Internet-facing systems without strong authentication
Opportunity for detection! Activity analytics: · Anomalous amount of API
activity and anomalous API calls · New IP logging in to CI system
35 ©2020 FireEye

Day 1 Day 2

Mr. Orange gets fired Mr. Orange downloads configuration information and network diagrams Mr. Orange is no longer with the organization Authorization attempts against specific publicfacing systems from a single IP address Successful login to continuous integration server
Continued...

Mandiant Incident Response Case Studies: Insider Threat Timeline

Opportunity for detection! User created on CI server
Opportunity for detection! Recon tool download and execution
Opportunity for detection! Sensitive files accessed, IAM keys taken
Opportunity for detection! Sensitive information accessed, and deleted
Opportunity for detection! Database logging and alerting of human access on production databases

Day 3

User created on CI server for persistence
Reconnaissance tools run against internal subnets from CI server by Mr. Orange
Additional credentials are collected by Mr. Orange
Mr. Orange accesses servers housing their work, and proceeds to perform destructive actions
Mr. Orange then proceeds to delete production databases

36 ©2020 FireEye

Mandiant Incident Response Case Studies: A Tale of Two DBs

ACME, Inc. ACMO, Inc.

 Some things in common...  Threat prevention opportunities:
­ Integration of security in application design
­ Integration of security in development pipelines
­ Cloud Service Provider logs (e.g., CloudTrail) centralized and monitored
­ Developers with permissions not aligned with their scope of duties
­ Weak database authentication and authorization

37 ©2020 FireEye

Mandiant Incident Response Case Studies: A Tale of Two DBs

ACME, Inc. ACMO, Inc.
38 ©2020 FireEye

 More things in common...  Threat detection opportunities:
­ Automated enforcement of rules/policies to remove weak security group rules (e.g., AWS Config)
­ CSP-native tools to detect and alert on misconfigurations (e.g., Trusted Advisor)
­ Custom or open-source tools to enable continuous validation
­ Detection on suspicious or anomalous connections
­ Database logs monitored for sensitive commands

Mandiant Incident Response Case Studies: A Tale of Two DBs
ACME, Inc.
ACMO, Inc.
39 ©2020 FireEye

Mandiant Incident Response Case Studies: A Tale of Two DBs

ACME, Inc. ACMO, Inc.

 No things in common...  Threat response:
­ Ensure all resources are configured to log based on threat model
­ Ensure all cloud logging is sent to centralized system
­ Cloud-focused alerting (based on captured logs) and standard operating procedures
­ Update and adapt workflows, processes or technical components
­ Practice, practice, practice

40 ©2020 FireEye

Questions?
41 ©2020 FireEye

