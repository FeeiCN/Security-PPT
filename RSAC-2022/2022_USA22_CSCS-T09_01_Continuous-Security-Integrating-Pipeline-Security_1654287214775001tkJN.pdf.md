#RSAC
SESSION ID: CSCS-T09
Continuous Security - Integrating Pipeline Security
Vandana Verma Sehgal
Security Relations Leader Snyk @InfosecVandana

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
WHO AM I
 Security Relations Leader - Snyk  OWASP Global Board of Directors  Speaker/Trainer at Defcon(AppSec Village), Asst. Trainer
at Black Hat, OWASP AppSec Conferences and others  Member of Review Board at Grace Hopper, BSides Delhi, Global AppSec, etc.

#RSAC
The Traditional Way - SDLC

Blame Game
Dev

#RSAC
Security Ops

#RSAC
Slide Credit: Pete Cheslock

DevOps

#RSAC
7

#RSAC
Slide Credit: DevSecCon

What is DevSecOps?

#RSAC
Integrating security practices within the DevOps process.
DevSecOps fosters a blameless culture and focused on secure delivery of software.

#RSAC
Integrating Security with DevOps to create DevSecOps
10

Understanding and objectives

#RSAC

DevSecOps core principles

" DevSecOps is an approach, a mindset, a combination of culture, process and technology "
" You don't BUY DevSecOps, you DO DevSecOps ! "

Culture
Agile, Lean and Continuous Feedback mindset applied throughout the Software Delivery Factory

Automation
Automate everything, everywhere for speed and reliability, using modern automation tools

Measureme
nt
Monitor everything, everywhere for Continuous Feedbacks, Improvement and Quality Management

Sharing
Share, coach, promote closer collaboration and process alignment between lines of business, development, and IT operations

What does DevSecOps look like?
People & Culture
STRATEGY, GOVERNANCE, RISK & COMPLIANCE ALIGNMENT

#RSAC

Code & Build
Secure App Code
Secure Infra Configuration OSS / COTS Validation

Test
Internal / External Testing Continuous Assurance Compliance Checking

Release, Deploy & Decommission
Continuous Component Control
App & Infra Orchestration Data Cleansing & Retention

Operate & Monitor
Detect and Visualize
Respond
Recover

LEARNING

#RSAC
Why does this matter?
Security practices must keep up with the agile pace of the cloud era.

Traditional Workload Provisioning

Cloud Workload Provisioning

Longer planning cycles
More infrequent deployment schedules
Large, custom deployments
Mostly manual deployment
Siloed goals and objectives
Separate development & operations teams

More agile approach
Deployments more iteratively as needed
Smaller, more standardized deployments
Highly automated and self-service for speed
Development + Operations to "DevOps"
Align objectives & remove tension between the groups

#RSAC
People & Culture
A successful program starts with the people & culture.
Training & Awareness
Explain & embrace new ways of working
Equip teams & individuals with the right level of ownership & tools

Develop Securely: Plan
A security-first approach

Model the threats with experimentation &
validation. Analyze risks to your system. Plan

Plan

Threat Modeling & Risk AnTahlyrseiast Modeling & Risk Analysis

Produce security epics informed by abuse cases. Add to project backlog.
Security Backlog

Security Backlog

Architecture & Design Informed architecture & design with security at its core.

Architecture & Design

#RSAC

Develop Securely: Code & Build
Security & Development combined

Secure coding best practice guidance. Real-
time code feedback. Catch before commCiot.de & Build

Code & Build

Secure Application Code Secure Application Code Secure infrastructure configuration best practice guidance. Image hardening.
Secure Infrastructure ConSfeigcure Infrastructure Config
OSS / COTS Validation OSS / COTS Validation Vulnerability & license scanning. Remedial guidance before commit.

#RSAC

Develop Securely: Test
Security & Development combined

Integrate & automate security testing seamlessly with DevOps activities.

Test

Test

Internal / External TestinIgnternal / External Testing Automated checks to ensure systems are always protected and conform with requirements.
Continuous Assurance Continuous Assurance
Compliance Checking Compliance Checking
Address industry-specific accreditation.

#RSAC

Secure Operations: Release, Deploy &
Decom
Controlled creation & destruction

Monitor and act on changes to component security.
Block vulnerable component deployRmeelnet.ase, Deploy &Release, Deploy & Decommission Decommission
Continuous Component CCoonntrtoinluous Component Control Orchestrate and automate the deployment of your secure application and underlying infrastructure.
App and Infra OrchestratiAopnp and Infra Orchestration

Build data cleansing into your decommissioning activities.

Data Cleansing & RetentioDnata Cleansing & Retention

#RSAC

#RSAC
Learning
Continuous improvement and feedback.
Lessons learned Coding & tooling best practices level-set Ongoing collaboration Blameless post-mortems

#RSAC
So, why DevSecOps?

Reduce Risk & Cost Fix early & bake in DR to reduce cost & risk

Increase Quality Continuous monitoring & scanning

Improve Team Synergy Increased collaboration & productivity

Enhance Visibility Threat Management integration

Meet Compliance Address critical compliance requirements

Accelerate Development Security automation integrated into CI/CD pipeline

Secure, Rapid Innovation Satisfy DevOps and CISO requirements

2 0

#RSAC
Things to manage

#RSAC
Asset Management
· Asset Tagging is as important as any other task in the organisation - tagging to right resources to the right owners.
· Maintain the CMDB (Configuration Management Database)
· Define asset onboarding or offboarding process · Periodic review and update CMDB
22

Risk Management
Understand the threat landscape for the organisation and applications Perform threat modelling Automate the threat modelling as a code (TaaC) Document the threat Model Process Risk Acceptance from the relevant stake holders.

#RSAC
23

Identity and Access management (IAM)

#RSAC

Store and manage secrets, tokens, control access with Vault

Regularly Audit Policies attached directly to IAM

Automate security checks on secrets
management

Identification of high-risk users.

Track app-to-app credentials

Audit privileged accounts

Enable Multifactor
authentication (MFA)

#RSAC
Embrace the automation
Pic souce:-https://blogs.iadb.org/caribbean-dev-trends/wp-content/uploads/sites/34/2019/06/CCB-Automation-blog.jpg

Vulnerability Management

Perform regular vulnerability assessments
Follow the change management process
Perform rescan to ensure the vulnerability fix

Defining the custom priorities of identified vulnerabilities based on the environment
Test the patches in the test or dev environment

#RSAC
Create a patching plan Apply relevant patches to avoid the breaches
26

#RSAC
Web Applications

Continuous Security for Apps

Threat Model the applications

Keep a check on the source code vulnerabilities

Don't miss on addressing the thirdparty dependencies

Good documentation can address half of the
concerns.

Automate the code commit security check and application testing.

Fail the build only when it's a critical bug till the organization attain the higher maturity model

#RSAC
Empower Dev /Ops to deliver better and faster and secure, instead of blocking.

#RSAC
Governance, Risk and Compliance
· Implementation of configuration changes and policy rules · Automate Compliance to run as a code (CaaC) · Versioning is important to maintain code · Setting up the process on when to fail the build in the pipeline. · Create feedback loops to understand the Risks
29

#RSAC
Monitoring and Logging

1
On-boarding critical log sources (applications, servers, network devices, etc.)

2
Enable required logs (e.g application logs, platform logs, security logs etc.)

3
Building use cases to capture critical activities

4

5

Continuous monitoring of the production environment for exploitation of known/unknown vulnerabilities.

Prepare the response plan to handle the incidents.

Emergency Response
· Documented plan for handling the critical incidents · Agreed RACI (Responsible, Accountable, Consulted and Informed) Matrix · Identify the right stakeholders · Documented escalation matrix · High severity incident creation with the bridge (call) details · Knowing the Disaster Recovery (DR) plan · High Availability (HA) setup for critical assets

#RSAC
31

#RSAC
Cultural Shift
Top Down Approach
· Let developers lead the way · Organizational transparency · Breaking Down Barriers and Silos
· Teams collaboration and inclusive culture · Build Champions and collaborate them · Speak in executives speak!
Bottom Up Approach

Tools of Trade
Threat Modelling Tools
Pre-Commit Hooks
Software Composition Analysis Static Analysis Security Testing
(SAST) IDE Plugins Secret Management
Ref: Anant Shrivastava

#RSAC

ThreatSpec

Microsoft Threat Modeling Tool

truffleHog Git Hound

Retire.js

CAT.net
Keywhiz

Vulnerability Management
Dynamic Analysis Security Testing (DAST)
Security in Infrastructure as Code
Compliance as Code
WAF

#RSAC
Docker Bench for Security
34

#RSAC
DevSecOps Reference Architecture - Overview
35

Security DevSecOps Reference Architecture

Shift Left all testing Application Security Testing Services

CSAonStTainer Security

Config Inspection

Container Security

Container Compliance

Create: App

AOpSpSliSccaatinonninSgecurity ProgrIaAmSTServices

SAebcuusreeCDaesveeTloepsmtinegnt SuppSAoecrcctueSpriettayrvnicceesTesting

App Development

Build

X-Force Red VulnerabilityPSecnaTnensintigng

CCXoa-smFemosrocne

RAebdusPeenetration

Standards & RTeegstuinlagtions

Test

Compliance

App Orchestration

#RSAC

Container Registry

Prod Ready Container Registry

Plan

Create: Infra

</> Source Code Repo

Artifact Repository
VM Image Repository

Prod Ready Artifact Repo
VM Prod Ready Image Repository

Operate &
Monitor

Platform Code

COTS Catalog

Infra Development

Build

Test

Compliance

CAobnutsaeinCearsSeeTceusrtitiny g

Security Acceptance Testing

ACpopdleicQautiaolnitySecurity ProgrCamonSfiegrIvnicsepsection Scanning

SIdeecnutrietyD&evAeclocpesmsent Support Services Review

ApCpolmicmatoionnASbeucsueriCtyasTeesstingSRSteaegnruvdliaactreidossn&s

CoIdnetanitniteyr&SeAccucreitsys

Pen Testing

X-Force Red Vulnerability SMcaancnhiinnge Image Compliance
X-Force Red Penetration Testing

Infra Orchestration
Cloud Security Posture Management Security + Compliance as Code Security & Compliance Controls Automation

Learn

Learn

Learn

Learn

#RSAC
DevSecOps for a Large Bank in ASEAN

Project Profile: Bank is undergoing digital transformation journey and aims to use e-solutions platform to digitize branch process and customer journey.

Security Testing - Stages
audit

Clair

SAST

Open Source Review

Container SCAN

DAST

PenTest

Build

Development

CI/CD

Orchestrator

Package Repo

Deploy

SIT

UAT

CAB

Production

#RSAC
A medium size Insurance company specializing in Retirement Plans and Employee Benefits
Highlights  Vulnerability closing time is reduced to 2
sprints (from 4 sprints).  Deployments to production did not require
"Gone Fishing" page for 80% of the applications  Successfully operationalized and transitioned ownership of SAST, DAST and remediation to LOB.

#RSAC
Reach Me!
 Twitter: @InfosecVandana  LinkedIn: vandana-verma

