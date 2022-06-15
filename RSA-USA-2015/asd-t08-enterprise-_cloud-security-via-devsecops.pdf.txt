SESSION ID: ASD-T08
Enterprise Cloud Security via DevSecOps

Shannon Leitz
Sr Mgr, Cloud Security & DevSecOps Leader Intuit Information Security @devsecops

Scott C Kennedy
Security Scientist Intuit Information Security @scknogas

#RSAC

#RSAC
Agenda
 Who we are
 Applying DevSecOps for 3+ years to support Enterprise Cloud migrations  20+ yrs experience with Virtualization, Software Defined Environments and Cloud Security
 What we'll cover
 Information about the DevSecOps model and the experiments that helped us discover it  A path for developing your own Enterprise Cloud Security program using DevSecOps practices
 Why it's important
 Cloud and DevOps adoption require a different approach to Enterprise Security  Nearly 70% of All Workloads occur in Cloud Data Centers within 2015*  Public Cloud growth is 50% higher than Private Cloud* * Cisco Global Cloud Index
2

#RSAC

#RSAC
The Challenge

Securing Enterprise Workloads in the Cloud...

 Pain  Trial & Error  Blood, sweat & tears  Ouch, my head hurts!

Bang Head Here

It would have been great to hear this talk a couple years ago....

The Team
Intuit Cloud Security
 Leading Cloud Security at Intuit  DevSecOps  Lean Start Principles  Decision Support  Assisting 3000+ Developers

#RSAC
AWS Professional Services
 Integrated solutions  Delivery assistance  Partner coaching  Sample code & accelerators  Access across AWS teams

#RSAC
The Timeline

Security as Code?

Security Operations?

Compliance Operations?

Science?

DevOps + Security
Start Here?

Experiment: Automate
Policy Governance

Experiment: Detection via
Security Operations

Experiment: Compliance via
DevSecOps toolkit

Experiment: Science via
Profiling

DevOps + DevSecOps

#RSAC
Drivers for DevSecOps
Embedding into DevOps Teams was a disaster...
 There aren't enough Security Professionals to embed into DevOps Teams...
 Compliance checklists didn't take us very far before we stopped scaling because of manual work...
 We learned we couldn't keep up with automated deployments without our own automation...
 Standard Security Operations did not work and continuous change became overwhelming...
 And we needed far more data than we expected to help the business make decisions...

#RSAC
The Art of DevSecOps

DevSecOps

Security Engineering
Experiment, Automate, Test

Security Operations
Hunt, Detect, Contain

Compliance Operations

Security Science

Respond,

Learn, Measure,

Manage, Train

Forecast

#RSAC
Step Zero: Establishing Principles
1. Customer focused mindset 2. Scale, scale, scale 3. Objective criteria 4. Proactive hunting 5. Continuous detection & response

#RSAC

Security as Code?

Security Operations?

Compliance Operations?

Science?

DevOps + Security

Experiment: Automate
Policy Governance

Experiment: Detection via
Security Operations

Experiment: Compliance via
DevSecOps toolkit

Experiment: Science via
Profiling

DevOps + DevSecOps

Security as Word Doc

 Double-click installer  Click "Next"  Click "Next"  Click "Next"  Click "Next"  Click "Next"  Click "Next"  Click "Next"

 Click "Next"  Click "Next"  Click "Next"  Click "Next"  Click "Next"  Click "Next"  Click "Next"  Click "Next"

#RSAC
Security CProoncfeigduurraetsion
V 3.6.0.1.1, January 2011    
Page 3 of 267 Frozen in Time

#RSAC
Security as Code is Easy with AWS
AWS provides a programmable infrastructure  Benefits
 Easily automated  Repeatable  Auditable  Easy to iterate
 Forms of Code
 Access Policy documents  CloudFormation templates  Ruby scripts  Custom APIs

#RSAC

Security as Code?

Security Operations?

Compliance Operations?

Science?

DevOps + Security

Experiment: Automate
Policy Governance

Experiment: Detection via
Security Operations

Experiment: Compliance via
DevSecOps toolkit

Experiment: Science via
Profiling

DevOps + DevSecOps

Experiment with Centralized & Transparent

#RSAC

Governance

 Manage hundreds of AWS accounts
 Push baseline IAM Roles and IAM Groups  Push associated trust policies and access policies
 Design to support an authoritative code source
 Include git support
 Add behavior modifications
 Discover only (--dry-run)  Detect drift and show differences (--diff)  Replace with approved baseline (no --dry-run)  Tune verbosity (--debug)

#RSAC
Centralized Governance BU Accounts (Trusting)

IAM SecRole

IAM SecRole

IAM SecRole

IAM SecRole

IAM SecRole

IAM SecRole

Central Account (Trusted)
IAM Admin

How did we decide which roles would be deployed? · Human
· IAM Admin · Incident Response · Read Only · Services · IAM Grantor · Instance Roles required to support security
services · Read Only

#RSAC
Baseline IAM Role Catalog

Short Description Trust Policy

Role Name Access Policies

#RSAC
Centralized Governance Workflow

1
Develop Review Test Approve Commit

Baseline IAM Catalog
2
Pull
Source Code Repository

5
Push

Ruby

4

3

SecRole IAM Role
STS Trusting BU Accounts Creds

AKID/SAK

Admin

#RSAC
Acting on Drift Detection
Account Grade:
C
Heal Account?

#RSAC

Security as Code?

Security Operations?

Compliance Operations?

Science?

DevOps + Security

Experiment: Automate
Policy Governance

Experiment: Detection via
Security Operations

Experiment: Compliance via
DevSecOps toolkit

Experiment: Science via
Profiling

DevOps + DevSecOps

Sec Ops Reloaded for the Cloud
applying these principles...
 Dynamic Attack Trees created and maintained by SecOps
 Data collection is tied to Threat Modeling
 Rules & Alerting support Hunting
 Inline Forensics...

#RSAC
I MY

#RSAC

Security as Code?

Security Operations?

Compliance Operations?

Science?

DevOps + Security

Experiment: Automate
Policy Governance

Experiment: Detection via
Security Operations

Experiment: Compliance via
DevSecOps toolkit

Experiment: Science via
Profiling

DevOps + DevSecOps

#RSAC
Threat Analytics Platform ­ Data Sources

#RSAC
Threat Analytics Platform - Trends

#RSAC
Threat Analytics Platform ­ Shared Rules

#RSAC
Threat Analytics Platform - Visualization

#RSAC
Threat Analytics Platform - Alerts

#RSAC

Security as Code?

Security Operations?

Compliance Operations?

Science?

DevOps + Security

Experiment: Automate
Policy Governance

Experiment: Detection via
Security Operations

Experiment: Compliance via
DevSecOps toolkit

Experiment: Science via
Profiling

DevOps + DevSecOps

Compliance Operations for Actionable Inline #RSAC Feedback
experimenting with these principles...
 Dynamic automated evaluations  Compliance alerts are provided in
real-time  Self-Service Security Education  Education on-demand

#RSAC

Security as Code?

Security Operations?

Compliance Operations?

Science?

DevOps + Security

Experiment: Automate
Policy Governance

Experiment: Detection via
Security Operations

Experiment: Compliance via DevSecOps
toolkit

Experiment: Science via
Profiling

DevOps + DevSecOps

#RSAC
DevSecOps Toolkit ­ Cross-Account Roles

IAM SecRole

IAM SecRole

IAM SecRole

IAM SecRole

IAM SecRole

IAM SecRole

BU Accounts (Trusting)

Central Account (Trusted)
IAM Admin

How did we decide which roles would be deployed? · Human
· IAM Admin · Incident Response
· Read Only
· Services · IAM Grantor · Instance Roles required to support security services · Read Only

#RSAC
DevSecOps Toolkit ­ MFA via Google Authenticator
 Human Admins are dangerous and require AWS integrated MFA with Google Authenticator to protect your account.
 Important for AWS to a validate human being vs. using external MFA to support authentication that could be hijacked.
 MFA placed on the Assumed Role which is trusted by the child account role.

DevSecOps Toolkit ­ Help & Interactive #RSAC Mode

lioness-9:toolkit shannon$ bundle exec bin/tk help config Usage:
tk config

Options: -i, [--interactive], [--no-interactive] -p, [--profile-name=PROFILE_NAME] -r, [--master-region=MASTER_REGION]
-a, [--master-account=MASTER_ACCOUNT] -n, [--master-role-name=MASTER_ROLE_NAME]
-t, [--target-account-list=TARGET_ACCOUNT_LIST]
-d, [--output-dir=OUTPUT_DIR]
-f, [--output-type=OUTPUT_TYPE]

# interactive mode for q&a to set up config # profile name in .aws config file # region for master account # Default: us-west-2 # 12 digit AWS account number without dashes # name of master role to assume cross-account roles # Default: master-auditor # location for csv file containing accounts list to audit # Default: config/accounts.csv # directory for storing results # Default: home # supports csv # Default: csv

Description: Using the devsecops toolkit requires a master configuration file to establish the credentials, role, MFA, etc. used to support cross-account usage. This command provides you with an interactive and advanced interface for creating a configuration file to support your usage. The configuration file can be found in your home directory under .tk/config and you can also hand edit this file using yaml.

#RSAC
DevSecOps Toolkit ­ Output to CSV

#RSAC

Security as Code?

Security Operations?

Compliance Operations?

Science?

DevOps + Security

Experiment: Automate
Policy Governance

Experiment: Detection via
Security Operations

Experiment: Compliance via
DevSecOps toolkit

Experiment: Science via
Profiling

DevOps + DevSecOps

#RSAC
The Principles of Security Science
 Death to F.U.D. (No proof, no problem)  Rely on data  Prove your assumptions  Model the solutions  Provide tools to support decisions

#RSAC
Goals of Security Science
 Empower teams to make sane security decisions  Prevent security breaches by guiding process  Uncover new threats and vulnerabilities through data analysis  Seek out new life and new civilizations, to boldly go where no
Security Team has gone before

#RSAC
Examples of Security Science
 90 day password length vs. $10k attacker offline cracker speed
 MD-5 = 19 characters  SHA-512 = 11 characters  BCRYPT = 8 characters
 With RHEL6 and goal of CVSS < 4, how often to restack?
 Amazon RHEL 6 Server = 5.3 days  Our base AMI = 10.5 days
37

#RSAC

Security as Code?

Security Operations?

Compliance Operations?

Science?

DevOps + Security

Experiment: Automate
Policy Governance

Experiment: Detection via
Security Operations

Experiment: Compliance via
DevSecOps toolkit

Experiment: Science via
Profiling

DevOps + DevSecOps

...profiling drift on accounts, services and

#RSAC

instances...

AWS accounts

threat intel

EC2

CloudTrail
S3 Glacier

ingestion

security tools & data

security science

insights

#RSAC
...egress monitoring + threat intel to detect Suspicious Exfiltration...

EC2 Subnet
VPC Account

ingestion

#RSAC

Security as Code?

Security Operations?

Compliance Operations?

Science?

DevOps + Security

Experiment: Automate
Policy Governance

Experiment: Detection via
Security Operations

Experiment: Compliance via
DevSecOps toolkit

Experiment: Science via
Profiling

AWSome!
DevOps + DevSecOps

#RSAC
Apply What You Have Learned Today
 Next week you should:
 Join the DevSecOps Community via the LinkedIn Group and Twitter  Determine which coding language makes sense for your team  Start with assessing your org's cloud adoption strategy, security requirements and work
backwards
 In the first three months following this presentation you should:
 Develop a whitelisting roadmap  Identify policies that need to be converted to code  Start with Access as a foundation and develop standard naming conventions
 Within six months you should:
 Have a platform that supports basic decisions  Have a wealth of data to gain insights  Begin to provide real-time insights for teams to remediate their issues based on scores/grades
42

