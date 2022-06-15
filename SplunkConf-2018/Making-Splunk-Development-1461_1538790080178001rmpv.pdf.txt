SplDevOps
Making Splunk Development a Breeze with a Deep Dive on DevOps, Containerization, Version Control & Automation
Harry McLaren, Ilias Diamantakos, Tomasz Dziwok
October 2018 | Version 1.3

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

cyberharibu

Who Are We?
ilias-diamantakos

© 2018 SPLUNK INC.

v

HARRY MCLAREN
Splunk Enablement Lead, Managing Consultant

ILIAS DIAMANTAKOS
Splunk Engineer, Associate Consultant

© 2018 SPLUNK INC.
Employer: ECS (UK Splunk Elite Partner)

Largest EMEA Splunk Delivery Partner

(

(Most Staff in Sales & Technical Areas)

Best Security Company of the Year

Splunk's UK Based SME for Security

Managed SOC Provider

Advanced Monitoring/Detection & Threat Hunting Services

What's It All About?
 Customer Challenges  What Do We Want?  Our Idea to Deploy Splunk  Technical Deep Dive  Project Roadmap  Key Takeaways

© 2018 SPLUNK INC.
~40mins

Customer Challenges

© 2018 SPLUNK INC.

"The expansion of Splunk has increased operational complexity, as we manage it manually and can't keep on top of project change requests."
­ High-Street Retailer

"We require a full routeto-live to maintain system integrity and can't deploy changes fast enough in our current setup."
­ National Bank

"Multiple developers within the same DEV environment, causes repeated configuration conflicts and delays to planned changes."
­ National Building Society

What Do We Want?
Enterprises Want to Respond Quickly, Safely & With Less Risk

© 2018 SPLUNK INC.

Rapid Changes to Splunk Software

01

Orchestrated Deployment

02
Fail Safe, Fast Backout



Fragile Route-to-Live

03

Development at Scale
 Enterprise Scale Development  Synchronous Changes /
Multiple Admins & Developers  Splunk Defined via Code  Familiar Approach (AKA: DevOps/Agile)

Reduction in Custom Config
 Every 'Custom' Configuration
Introduces Disparity  Inconsistent Dev, Test, Pre-Prod, Prod  Testing is "Best Endeavors"  Increased Risk, Changes Batched

Intelligence

Splunk for Agility
Supporting Agile Methodology by Default

© 2018 SPLUNK INC.
Monitor

SPL Web UI Plain Text Config Open API

Schema at Read, Supporting Multiple Use Cases
Analytic Tools Exposed to UI, Empowering Users to Experiment

Plain Text Configuration Files, Documented & Supported

Splunk API is Enumerated, Dev Licenses, Labs Encouraged

Investigate

Our Idea
"SplDevOps" Became the Solution

© 2018 SPLUNK INC.

Agile Development
 Short Sprints  Test Driven Development  Issue Management
& Feature Backlog

Version Control
 Git[Lab] Utilized  Multiple Projects/Branches  Key Releases Tagged

Configuration Management
 Orchestrated Deployment  Centralized Config  Ansible used via SSH

Full Route-to-Live
 Multi-Stage Environments  Dev > Pre-Prod > Prod · Automated Testing

© 2018 SPLUNK INC.
Project: Internal Monitoring
Ask: Deploy Splunk Internally for SecOps & ITOps Use Cases

Brief Background
Let's talk tools!

© 2018 SPLUNK INC.

Automation Engine

Containerization

Version Control

What Tool Fits Where?
a new Splunk infrastructure the DevOps way!

© 2018 SPLUNK INC.

 Identical environments & route to live · Development, Pre-production, Production
 Eliminate fear driven development · It's ok to make mistakes!
 Minimize direct production changes · Always go through route-to-live · Transparent change control
 Modern means of disaster recovery
 Security driven

 Ansible + Git + Docker + Python  Docker + Git
 GitLab  Ansible (IaC)  Ansible Vault

How We Wanted It To Look

Spoiler Alert: This is also the end result

dev

pre-prod

prod

© 2018 SPLUNK INC.

IX: Splunk Indexer SH: Splunk Search Head

DS: Splunk Deployment Server

AS: Ansible Server

IX splunk_ix

Multiple Repositories
Of /opt/splunk/etc for each instance
SH

splunk_sh

Ansible & DS

ansible

splunk_ds

© 2018 SPLUNK INC.
Syslog Collector syslog

Git Workflow
aka "the change process"

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Everything starts from our DevEnv
So let's spin one up

What's going on in the background

© 2018 SPLUNK INC.

What's going on in the background

© 2018 SPLUNK INC.

How It Looks

© 2018 SPLUNK INC.

How It Looks

© 2018 SPLUNK INC.

Let's Share Secrets
No really, we are sharing!
 How to version sensitive information · Encryption
 How to decrypt automatically · Ansible Vault
 How to store Ansible Vault Password · More encryption

© 2018 SPLUNK INC.

Let's Decrypt
One password to rule them all

© 2018 SPLUNK INC.

Ansible Server

© 2018 SPLUNK INC.
Use Case Scenario
Demo time

How it should have been done
Integrating with our change process

© 2018 SPLUNK INC.

How it should have been done
Integrating with our change process

© 2018 SPLUNK INC.

How it gets deployed

© 2018 SPLUNK INC.

How it gets deployed

© 2018 SPLUNK INC.

How it gets deployed

© 2018 SPLUNK INC.

 Multiple repositories · What goes where? · Many lines of history

Lessons We Learned
Not everything was easy...

 Identical code for different environments · There are always exceptions (Eventgen, production API calls)

 Data for different environments · Production data is sensitive
 Automated deployment of code · When do you restart?

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Deployment Results
Did it work!?

End Result
Prototype Success, Production Rollout

© 2018 SPLUNK INC.











Full Route-to-Live Implemented in Production

Users & Admins Educated & Empowered

Everything Under Version
Control

Promoting Changes in
~ 5mins (Dev>Prod)

Foundations Built for Future Development

Roadmap
Introducing "Splunk Compiler" (v2.0+)

© 2018 SPLUNK INC.

Adaptable Framework Expressed in Software
(Python + Git + Ansible)

Environment Agnostic & Scales to Clustered
Deployments& Hybrid Cloud Architecture

User Friendly & End-to-End Integrated
with Issue/Change Management

Key Takeaways
Remember Four Things...

© 2018 SPLUNK INC.

Splunk Supports Experimentation
by Default

Agile/DevOps Methodologies are Compatible

Doesn't Require Automation Expertise

Version Control BEFORE Software
Orchestration

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

