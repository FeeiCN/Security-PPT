SESSION ID: CSV-W02
Protecting the Cloud with the Power of Cloud
Jay Kelath Pranav Patel Product Security @ Dow Jones
#RSAC

#RSAC
What are we going to talk about...?
DevSecOps - How we "SaaS-ified" our on-prem security tools with Docker and DevSecOps - Scaling security with help of Cloud enables Security automation.
Self-healing Cloud Misconfigurations - How native Cloud based tooling helps reduce risk - How Automation and Self-healing works in our Cloud environment
Open Source Technologies : [Takeaway] -- start your DevSecOps journey from Day 1 - Dow Jones Hammer: Open source tools enables security - Project Bravos : Embedding security into Build Pipeline

#RSAC
Quick Flashback....
- Traditional Security tools - Manual Reviews - Lack of visibility and scalability

#RSAC
Challenges

Legacy

Technology Sprawl People Process

#RSAC
Traditional Security -- Old School

"Don't Let a Good Crisis Go to Waste"

#RSAC
DevSecOps
Solve a specific problem in an automated manner with well defined People, Process, Technology actions and extensive, actionable reporting

#RSAC
Setting priorities right...
Risk vs Reward End Goal: Reduce Risk

#RSAC
Think about....

Technology
API Driven Scalable, Tunable False Positives KISS

Process
Use Existing Process Feedback Loop High Quality Report Optimize

People
Support Model Build Trust Developer support

#RSAC
Security as a Service

#RSAC
DevSecOps pipeline

Plan

Code

- Threat Modelling

- Linting - Secure code
- Software
composition analysis

Build
- SAST - Secrets in
Code - Top 5
criticals

Test
- Integration Testing
- Abuse case Testing

Deploy
- Cloud Security - Runtime security
testing RASP/IAST/DAST - Container scanning

Our Solution
Project Braavos

Plan

Code

Build

#RSAC
Dow Jones Hammer

Test

Deploy

Dow Jones Hammer
Open Sourced : https://github.com/dowjones/hammer

Hammer... why?
· "Auto-fix" misconfigurations with ability to rollback · Cloud Infrastructure visibility · Easily pinpoint MY product's security issues · Tailored reporting, save analysis time · API driven approach

#RSAC

#RSAC
Our Solution
· Automate · Scalable · Self-service · Auditable

Consumer
· Multi-account customers · Decentralized development organizations · Multiple business units

#RSAC

#RSAC
Multi-account sprawl

#RSAC
Multi-account sprawl
· Lack of visibility · Scalability · "Someone is looking into it..."

#RSAC
Multi-account growth : Ideal State

Hammer: What Does it Solve?
Public Instances with Admin IAM Policies Exposed EC2 Instances Docker on EC2 ECS
Exposed RDS instances Unencrypted RDS Public RDS Snapshots

#RSAC
Public S3 buckets Unencrypted S3 buckets Public S3 bucket Policy
Unused IAM Keys Stale IAM Keys (not rotated)

#RSAC
Hammer Lifecycle

Identify

Remediate

Analyze

Report

Architecture
cross-account iam roles

#RSAC
cross-account iam roles

#RSAC
Hammer - how does it work?

#RSAC
Hammer - /auto-fix

Hammer : Service Matrix

Services
[IAM]: Inactive IAM keys, IAM key rotations)
[Data]: Public S3 (acl, bucket policy) Public SQS Public Snapshots(EBS, RDS, AMI) Unencrypted EBS, S3, RDS, SQS
[Compute]: Over-exposed instances, Over-permissive IAM
[Databases]:Over-exposed RDS, Overexposed databases (on EC2)

Identification

Reporting

#RSAC
Remediation

#RSAC
Roadmap
- Hammer API - New Security Feature
- Redshift - Containers (ECS, EKS, Fargate) - CloudFront ... - Self Service Hammer bot (on-Demand scans)

#RSAC
Case Study 1: Protection from bitcoin miners.....
- Stale & Exposed keys in Code - Stale & Exposed keys in public
bucket - Ex-employees with Keys
aws

#RSAC
Case Study 1 : Example

#RSAC
Case Study 2: Over Exposed Instances

PII Files Users Database

resource: ec2:*, s3:*, rds:*
X
10.0.0.0./08.0 802/24,343389 172.106.0.0.0.0.0/12 222,23, 3383989

#RSAC
Case Study 2: Over Exposed Instances

#RSAC
Case Study 2: Over Exposed Instances

Lessons Learnt
Scales over 100+ AWS Accounts Integrates to Dev ecosystem Easy to plug and play Tonnes of insecurities fixed Low to minimal Impact

#RSAC
AWS Lambda execution limits Server elements Limited security checks

#RSAC
Key Trends....

Feature Detection

Feature Protection

#RSAC
Implement Cloud Security : Day 1
Github : https://github.com/dowjones/hammer Hammer Case Study https://medium.com/dowjones/introducing-dow-jones-hammer-f0121815189a Behind the Scenes : (Architecture design) https://medium.com/dowjones/behind-the-scenes-of-dow-jones-hammer38579391f1a0

Scaling security and embedding into pipeline

Project Braavos

Plan

Code

Build

#RSAC
Dow Jones Hammer

Test

Deploy

#RSAC
Project Bravos : CICD Integration

Sensitive information in code
Continuous Security

Static code analysis

Open Source Vulnerability Checks

Risky function calls

Security test cases

Dynamic Security Tests

#RSAC
DevSecOps - reference tools

Plan
- Threat modelling

Code
- Cx - Fortify - Coverity - Veracode

Build
- Cx - Coverity - Veracode - Git Secrets - Snyk/
BlackDuck

Test
- ZAP - Burp
Enterprise - Detectify

Deploy
- Dow Jones Hammer
- Burp

Ref: https://www.owasp.org/index.php/OWASP_AppSec_Pipeline#tab=Pipeline_Tools

Our Solution : project bravos
Code Check-in

#RSAC
Policy & Governance
Source Code Scanning
Open-Source Library Vulnerability Scan

Dynamic Application Security Tests

#RSAC
/continuous_security : sast

Jenkins

pull repo

Open Source
Vuln (NSP, Retire.js)

Vulnerabilities

Post validated Issues to Jira

Grouping & Analysis

#RSAC
/continuous_security: Jenkins Pipeline

#RSAC
/continuous_security: sast

Lessons Learnt
Easy to Integrate Tune! Tune! Tune! Tech needs to match the Tool Incremental Scans FTW More accessible to Devs

#RSAC
False Positives Execution Time Limited Tech Coverage "Glue code" for Integration

Dynamic Scanning in Pipeline

Jenkins

Existing Automated Tests (Perf, Functional)
Burp
Post validated Issues to Jira

User Journey
Vulnerabilities
Grouping & Analysis

#RSAC

Lessons Learnt
Existing Test Cases FTW Focus on your Top 5 Deploy a "Security Test Stack"

#RSAC
Poor Integration Options Execution Time More hand-holding needed

#RSAC
Breaking the build : Myth?

Reporting! Reporting! Reporting!

Secrets in Code

Open Source Components

Container Security Abuse Test Cases
XSS Injection Issues

Crawl

Walk

Run

#RSAC
Case Study : Example 1

#RSAC
Resolution : Effective Reporting

#RSAC
Continuous Security vs Penetration Testing

Pick your Top 5 or 2 Tune ! Tune ! Tune !
Focus on Low hanging fruits Only confirmed critical Scan time < 10% of total build time

OWASP Top 10 Out of band Testing Business logic flaws

Thank you
Jay Kelath Pranav Patel

#RSAC

We're Hiring!
https://dowjones.jobs
https://github.com/kelath https://github.com/pranav1688

@kelath @pranav16

