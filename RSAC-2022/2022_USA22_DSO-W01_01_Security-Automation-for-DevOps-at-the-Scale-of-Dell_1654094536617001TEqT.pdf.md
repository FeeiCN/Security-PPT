#RSAC
SESSION ID: DSO-W01
Security automation for DevOps at the scale of Dell: A real life case study
Sam Sehgal
Program Leader, DevSecOps & SDL Automation Dell Technologies
v2

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

Why this talk, why now?
The problem
· Organizations understand DevSecOps today and plan to (or already are) implement it. · But... face challenges on how to implement it on a large scale, measure its impact and
communicate the outcomes

#RSAC

Dell case study
· Started as small-scale effort. Expanded incrementally on the SDL foundation · Built with collaboration, experimentation, open mind, and technology · Now pervasive across nearly all BUs across Dell

Takeaways for you
· Take insights from what worked (and didn't) for us. No need to reinvent the wheel · Cherry-pick and practice architecture patterns and approach as relevant to your org · Help you broaden the horizons beyond point solutions and think holistically
3

Outline of today's talk

1
Dell's scale and context

2
Problems driving
requirements

3
Strategy, execution & outcomes

#RSAC
4
Your action plan

4

#RSAC
Let's start with the context
The scale of the problem

#RSAC
By product heterogeneity

Hardware
(personal computers, server, networking, storage...)

Ecommerce
Public facing ecommerce site (dell.com)

Internal apps
Non-Internet facing internal apps

APEX
As-a-service offers

6

By maturity journey
Long release lifecycles
Legacy monolithic applications
Risk tolerance: High

#RSAC
Agile. Frequent or continuous deployment using CI/CD
Modern containerized microservices
Risk tolerance: Low
7

#RSAC
By numbers

# of products and applications to be
secured

# of code repos

# of engineers
8

#RSAC
By tech stack and tools

Disclaimer: All product names, logos, brands, trademarks and registered trademarks are property of their respective owners

9

#RSAC
Challenges driving requirements
How scale amplifies challenges

#RSAC
Frustrating dev and ops experience

Feedback to DevOps on security take too long

Security scan results in PDF, email and not consumable in a pipeline

Handling of false positives further impedes agility
11

#RSAC
Resource intensive
Manual security assessments are...

thorough

and necessary

but take time

and are expensive

... so need a multi-option approach
12

#RSAC
Did you do what the security control says?
Is the security control implemented in the code, app, pipeline?
Is the security control being bypassed?
Are teams deploying to production despite a critical control failure?
13

Limited observability

1

No instrumentation

in the dev

environment to

collect security data.

3

Reporting via

spreadsheets and

slides

#RSAC

2

Fully dependent on

security scanning

tools

4

Manual and time-

consuming

determination of

security posture

14

#RSAC
And... the challenge of solving all the above at scale
15

#RSAC
Strategy, implementation & outcomes
How we are solving it and delivering outcomes

#RSAC
7-point implementation strategy

1 Solid SDL* foundation 2 Multiple consumption options 3 Customer agnostic architecture 4 Act one team everyday

5 Integrate at LCD** 6 Optimize for DevOps experience 7 Instrument for measurement

*Secure Development Lifecycle

**Lowest common denominator

17

1 Build on existing SDL foundation

#RSAC

OBJECTIVES

SERVICES

SDL for Scale
Embrace & Adopt.

Measure and progress Apps. against four Maturity Practice Levels

Effectively reduce risk prior to release (GA)

L1 L3 L2 L4
L5
Invest and train security champions

DevOps & SRE

Fostering Continuous & Frictionless Security

Champion

Security Engineer

Threat Modeling

Static Code Analysis Open Source Component Mgmt.
Container Scanning

Web Security Testing Network Vulnerability Scanning

Design

Development

Testing

Champion

Security Engineer

Independent Security Testing

SDL Security Assessment

Release

62+ Controls One Standard

Compliant

Cutting Edge

Standard

Leading

Four Maturity Practice Levels

L1 Awareness L2 Knowledge

L3 Knowledge/Skill change

L4 Demonstrate Skill

L5 Demonstrate Skill

Five Levels of Security Training

FOUNDATIONS

2
Offer multiple consumption options

1 SDL Engineer Led
Led by Security (SDL) Engineer
Manual

2 SDL as Self Service
Led by Security Champion Manual

For high value applications

For all applications

Most comprehensive

Comprehensive
19

#RSAC
3 SDL as API
Performed pragmatically via Git workflows and CI/CD events Automated
For apps with frequent & automated deployments
Balanced

3 Customer agnostic automation architecture

A Maintained by Dell DevOps & SRE teams B Provided by Product and Application Security

A Security Design and Architecture Secure Code

Continuous Build and Integration

Continuous Test

Continuous Delivery and Deployment

Continuous verification, monitoring & redeployment

On-premise, Cloud deployment env.

Stages

DevOps and SRE teams' development and deployment environment

Apps, VMs, Containers, Storage, Networking

B1
Security of DevOps processes

B2 On roadmap
Security of SRE provisioned infra

Multiple Integration Options for DevOps teams

SEAL ­ SDL Enforcement and Automation Library

Fuzzing Tools

K8S

SDL Foundation

3 Customer agnostic automation architecture

A Maintained by Dell DevOps & SRE teams B Provided by Product and Application Security

A Security Design and Architecture Secure Code
(IDE & Git repo)

Continuous Build and Integration

Continuous Test

Continuous Delivery and Deployment

Continuous verification, monitoring & redeployment

On-premise, Cloud deployment env.

Triggers Stages

Static application code scan
IDE/Git PR-MR triggered
Static infrastructure code scan

Static application

Software

code scan

composition Scan

Pipeline triggered

Container image Scan

Static infrastructure code scan

Dynamic app scan

Fuzz testing

Runtime container Runtime app vuln.

vuln. defense

defense

IaC policy validation Infrastructure vuln. Continuous Infra. Runtime infra. cfg

(pre-deploy)

scan (on demand)

vuln. scan

drift monitoring

Apps, VMs, Containers, Storage, Networking

B1
Integration Options for Dell Products and
Dell Digital

Security of DevOps processes

API

Container Image

CI/CD Plugins

B2 On roadmap
Security of SRE provisioned infra

Raw Code

Raw Code

Python Pkg

SEAL ­ SDL Enforcement and Automation Library

Unified SDL Scanning and Controls Verification Interface

API based SDL enrollment

Scan state management Taxonomy alignment

Scan Results Interpretation

Security Policy as Code Implementation Invoke Scans

Push data to Metrics

Unified SRE Security Policy Verification Interface

Dell Security Advisory as code Policy validation

Patch management

Validation and enforcement of golden images

Configuration drift mgmt

SDL Verification Tools, Dell Systems & Infrastructure

SDL Verification Tool Integration Layer
API / CLI
Fuzzing Tools

Dell Products / Infrastructure API
K8S

SDL controls as code (OSCAL compliant YAML)

System (infrastructure) security policy as code (OSCAL compliant YAML)

4

#RSAC

Act as one team everyday

Do not "confront" ­ Build partnerships instead Establish joint scrum teams Get into a common backlog Resource challenged?
­ Bring security champions to the challenge ­ Reinforce through security awareness and training

22

5

#RSAC

Integrate at the Lowest Common Denominator

Security

Platforms

Identify opportunities for platform integration...

DevOps Teams
...without losing sight of the "downstream" DevOps teams
23

5
Our lowest common denominators
A win-win-win scenario
Delivers  Git + CI/CD platform  Standardized blueprint for commonly
used patterns  Automatically invoked security scans  Apply security policy programmatically

Delivers
 Security scanning services  Reusable SDL automation artifacts  Security policy as code  Threat modeling service  Secure architecture guidelines

ISG Developer Ready
Platform
Dell Digital DevOps Platform

#RSAC

Telecom (TSB)
ISG Products, APEX
Dell.com, Internal apps

Accomplishes
 platform with security scan built-in and run automatically
 Mitigates security findings in code, open-source components, container images & applications

Dell Technology Services

Product & Application
Security

Feedback Channels: - Verbal and subjective - Programmatic (metrics)
24

6

#RSAC

Optimize for developer experience

Embedding a security activity in not enough

Integration must be optimized to reduce friction

25

6
N factor model for optimization

Scope

Be precise about "what" needs to security verified

Branch

Not all branches need same treatment for security verification

Stage

Allocate security activities appropriately among CI/CD/CD

Trigger

Security activity triggered with: Time / Git event / Pipeline event

Frequency

The sweet spot: how often to perform a security activity

Enforcement Audit mode vs. Strict mode (block the merge/build/pipeline)

Packaging

As package / As container image / As code

#RSAC

7

#RSAC

Instrument for measurement

Security KPIs Reporting

Comprehensive Product Specific Maturity Dashboards

Reporting and Visualization Layer

Data Storage & Processing Zone

SDL Issue Mgmt
System Taxonomy & Registry

Security Champions Enrollment
Training Records

Product Incidence and Response Data

SDL Services Data Sources

Code Repositories and CI/CD Pipelines

Code Repositories and CI/CD Pipelines

DevOps Platforms

SDL (Manual) Control
Assessment

Application Architecture Threat Security Requirements Modelling

Static Code Analysis

Open-source Component Management

Container Image Scan

Dynamic Application
Scan

Code Signing

Vulnerability Scan

Security Tools

27

#RSAC
Outcomes and path forward
We are not done yet

Outcomes
Frictionless Experience
# of places to get security feedback
1
Speed of getting security feedback
5 days W
5 min

Adoption at Scale
# of BUs onboarded
> 90%
# of products enabled
> 1000
# of projects/repos enabled
> 10,000

#RSAC
Security Effectiveness
# of products/apps with security issues mitigated before deployment
> 600
# of critical/high security issues discovered and mitigated
> 400
29

#RSAC
Outcomes
30

#RSAC
Outcomes
31

#RSAC
Outcomes
32

#RSAC
Outcomes
33

Reimagining the future

Rapid Response Support Model

4

Conversational support via a chatbot. Instantaneous response to questions/issues

1

Frictionless enrollment to SDL tools

Slash enrollment time from days to seconds  Superior customer experience Near-zero human intervention  Focus instead on high impact tasks

Security Control Verification

3

Expand beyond security testing automation Enable DevOps to verify all (qualified) SDL controls with minimal manual effort

Secure

Development

Lifecycle

2a

2b

Legend

Available

Ideation

Active new initiatives

34

Dell ­ Internal Use ­ Confidential

2c
SBOM & EO enablement
Automated generation of software bill of material and recorded in source of truth

Seamless app security testing
Security feedback time reduced from days to minutes In context feedback to developers
Seamless IaC and NW security testing
Enable SRE and Ops team to secure IaC code Automated network and systems scanning

#RSAC
Your action plan
For implementing or scaling DevSecOps

Assess and measure
30 days
Time taken by DevOps/SRE teams to get security feedback: minutes/days/weeks Time and approach taken by Security org to get security posture
­ Security issues discovered, reported, fixed ­ Days of open before remediation
% of security bugs slipped through SDL and ended up in production
­ Worst case: caught by customers or external entities
SDLC stages where are security and DevOps interactions happen: (early / mid /later)

#RSAC

36

#RSAC
Pilot
3 to 6 months
If offering only manual SDL assessment: pilot with self-service option If already offering self-service SDL assessment
­ Start proof of concept with a DevOps team. Ideally with a platform team
Embed a security engineer or a security champion in the development team's scrum process
37

#RSAC
Retrospective and scale
1 year
Remeasure and compare with metrics from "Assess" stage Conduct joint retrospective sessions with development and security teams
­ What worked or didn't work
Plan for scaling across larger number of teams across organization
38

#RSAC
Questions
39

