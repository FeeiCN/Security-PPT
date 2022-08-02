SESSION ID: CSV-W12
Red Team View: Gaps in the Serverless Attack Surface.
Mike Cotton
SVP Research & Development Digital Defense Inc.
#RSAC

#RSAC
Overview
Shift in Technology -> Shift in Tactics
­ Serverless Another Major Phase of the Web ­ From a Security Perspective Maybe Most Significant Shift ­ We've Already Seen The Beginnings of This
o Rampant Leaking of Data Cloud Storage Services o Didn't Make the Technology `Customer Proof'
­ This Talk Aims to Help Close the Gap
o Red Team: (Assessment / PT) -> New Tactics You Can Use o Blue Team: (Dev / DevOps) Ways to Better Lock Down Your Systems
2

#RSAC
Shift in Technology => Shift in Tactics
Not a theoretical talk
­ Going through Real World Examples ­ Technical Details & Demos ­ New Tactics We're Using
General Components
­ API Lambda / Cloud-Function Layer ­ Looking for Peer Infrastructure ­ Cloud Storage Layer
3

Problems

#RSAC
API Security / Modern MVVM Frameworks
The LAMP Era Had Some Advantages
­ Hard to Believe but this is True! ­ Server-Side Rending Masked API and App Details ­ Administrative Functions Had to be Inferred from Frameworks
Modern Javascript Client-Side UI -> API Apps
­ This is the Typical Stack Deployment for Serverless
o Similar to MEAN / MERN, But with Dynamo and Node Runs in Lambda o Android and IOS Mobile Apps: AWS Amplify SDK to API in Cloud
­ API is the remote interface so it's not a black box
5

#RSAC
Modern Cloud / App - Complexity
Much Steeper Learning Curve
Create-React-App HelloWorld
­ Plus Amplify SDK init APIS ­ 33,000+ Files in HelloWorld Dir ­ 85 Files Excluding node_modules ­ Many Things Being Done For You
6

#RSAC
API Security / Modern MVVM Frameworks
Sometimes Partial Security Controls Can Be Problematic
­ Good Enough to Pass Muster With Dev / Test / DevOps ­ Lulls you into sense of security ­ Keep out random pranksters / sweeps ­ Determined attackers find exposed systems ­ Bottom Line ­ It's important to understand the details
7

#RSAC
PenTest Experience : Undocumented API's
The Basis for Most Custom Discoveries
­ Target the Infrastructure / Framework ­ Target the API's Directly
Security Disclosures
­ Our Zero-Day Advisories (Over 20 in Last 2 Years)
o VMWare, Sonicwall, Veritas, ManageEngine, EMC,NUUO, Avaya, etc. Mostly Appliance API abuse.
o Bottom Line: Sophisticated Developers Still Have Challenges w/ This.
­ Similarities to What We See in the Cloud/Serverless: API Abuses
o Theme is: Enumerate -> Tamper -> Obtain Admin Access o Complexity of SaaS Disclosures
8

#RSAC
Types of Protection (AWS-Lambda / AWS-Mobile)
9

#RSAC
In the Details
Public ­ You Can Access it with Curl
­ You'll know format just from Javascript Debugger
Protected
­ Adds in HMAC SHA256 Signing via client token ­ Client Side Key: AccessKeyID, SecretKey obtained via Cognito
Private
­ Similar Signing Protections to Protected but ­ Couples that with Authentication, SessionKey
10

#RSAC
Working w/ Protected APIs [DEMO]
11

#RSAC
Note On: Key Patterns / AWS-Labs / Git-Secrets

#RSAC
API SDK Client-Server Signing
HMAC Code Details ...
Various Versions and Configurations of this
­ Wraps both Pre-Auth and Post-Auth on Non Public Functions.
o AWS This Comes Through Amplify
­ Key Attributes Are Typically
o Signs Headers / Timestamp / Body / Instance Referenced
o HMAC SHA256 of the Payload
­ Can Extract Identity Pool / Keys from Client Debuggers

#RSAC
Mobile App -> Protected / Private APIS
Mobile Apps: API Enum / Key Retrieval can be Challenging
­ Particularly if SSL Certificate Pinning Enabled ­ Prevents MITM even with an SSL Proxy + Root Cert Install
Some Tools to Help Here:
­ Frida-Server - Android Debugger Instrumentation Framework ­ ADB: Android Debug Bridge (Standard Component) ­ Genymotion Cloud Android Emulator
o Useful for Emulating Various OS Versions o Can Also Use a Local Device Instead of This
14

#RSAC
Dumping Keys / API Calls from Apps ...
15

#RSAC
Extracting API Endpoints / Keys (Android) [DEMO]
16

#RSAC
Recent Experiences
With Enumeration & Signing Keys
­ Start Tampering with API Calls
Most Common Patterns
­ Protected Calls which Should Be Private / Limited
o No Validation Check Other Than Signing Layer o Data Leakage / Denial of Wallet Scenarios o Use of Privileged Keys in Apps
­ Post-Auth Services With Privilege Abuses
o Takes Client ID from Request Body Rather then Session o Allowing for Queries and Posts on other Users o Allows Non-Privileged Users to Execute Admin Calls
· CreateUserAccount · ModifyPrivileges

#RSAC
API Abuse - Real-World [DEMO]

#RSAC
SSL Certificate Transparency Infrastructure
Built Due to Rogue Certificate Creation
­ Industry Consortium ­ Registrars Public Certificate Log
­ i.e. https://transparencyreport.google.com/https/certificates?hl=en
For Serverless Discovery replacing Older Mechanisms
­ i.e. Nmap Sweeps / Public CIDR Ownership Lookups ­ We already know the ports, and the hosts are fluid ­ SSL Use Has Exploded w/ Automated Certificates (i.e. LetsEncrypt) ­ Browser and Integrations Problems w/o Trusted Connections
19

#RSAC
Cloaked Development Infrastructure
New Trend Seen in Assessment Work
­ Second Layer of Accessible Peer Infrastructure
o Development / Testing / Staging Purposes o Often Times the Weak Point in Primary System Compromise
· Substantially Weaker / Still w/ Privileged Access Tie-ins. · Similar to Kill Chain Mechanics Against Internal Targets
 Compromise Weaker Nodes -> Gain Creds / Access -> Take Primary
­ Not something traditional architectures have suffered from
o Traditional Workflow
· Development / Testing Happened Locally · Security Tested / Shipped to Production
20

#RSAC
Cloaked Infrastructure Discovery
Common Patterns:
Look for Common Naming Patterns
­ Dev,Prod,Test,Stable,DevStable,etc.
Dev Instances Often Are:
­ More Open Access / More Open to Trivial User Account Combos
­ Contain Primary Lineup Access Mechanisms
o Embedded Privileged Accounts o Valid API Tokens
21

#RSAC
Why This Happens ...
­ Key Drivers Appear to Be
o Difficulty of Running the Serverless Service Infrastructure Locally
· Services AWS Lambda / DynamoDB / Difficult to Simulate Locally for Development Purposes
· Work Being Done in this Area (i.e. `Serverless Framework')
 But Production Needs are Running Ahead
o Desire for a Uniform Working Deployment Model o Distributed Workforce Can Complicate Remote Access Controls o Not Enough Concern About the Security of Development Test Instances and
the Data they Contain.
22

#RSAC
Proper Scoping ...
Constant Shifting Targets
Distributed Nature of Applications Means OSInt Phase need to be beefed up.
­ Need to Scope Application Subcomponents Differently.
­ Consider Changing PT Methodology to Allow for Discovery / Enumeration and Dynamic Scope w/ Client.
­ Have to Avoid Redeployments which can Upend Instances and Permissions
23

#RSAC
Cloud Storage Layer
A lot already written on this
­ Layering on personal experiences from assessment work
o Buckets with permissions issues continue to be a huge problem. o Real world: seeing issues > 25% of the time they are in play. o Mostly likely subcomponent to be compromised o Can totally unwind an otherwise secure stack
­ Since 2016 Changes w/ Certificate Manager
o Often encounter Bucket -> Cloudfront -> Webroot o PKI allows for targeting buckets that were previously obscure o Improvements made to permissions in this area, but people still struggling
24

#RSAC
Cloud Storage Layer
Typically we're looking for:
­ Application API Keys
o Generated by developers or users for automated access o By design are long-lived and do not require two-factor o Typically from privileged accounts o Rarely restricted to a handful of calls, typically have full user rights.
­ Passwords in configuration files ­ Infrastructure Keys Which can
o Don't target the app but the cloud infrastructure itself o The sorts of configs your local utility scripts use
25

Solutions

#RSAC
Apply, Locking Things Down ...
Next two-weeks you should:
­ Identify the serverless infrastructure used by your organization.
o (Both production systems and development / test systems) o Use Billing Reports to Help Hunt Down any Rogue Lineups
­ Implement a repository-credentials protection system
o This is important even if you have a private/restricted repo. o Major Cloud Vendors Have Projects to Help You with This
· Azure: CredScan Built Task Utility (https://secdevtools.azurewebsites.net/helpcredscan.html) · Amazon: Git-Secrets Github Project (https://github.com/awslabs/git-secrets)

#RSAC
Repository Key Protections
When Implementing Protections:
­ Important to:
o Scan Existing Repositories when First Implementing Protections
o Ensure that Contrib History Does not Still Retain `Deleted' Credentials
o Invalidate any keys discovered, even in private repositories.
o Check all new checkins / reject bad commits in real-time.

#RSAC
AWS-Labs / Git Secrets (Discussion)

#RSAC
Apply, Continued ...
Within one Month:
­ Verify there is no publically accessible non-production infrastructure
o Run Certificate Transparency Queries on Your Systems / Domains
· https://transparencyreport.google.com/https/certificates?hl=en · Look For Common Development Patterns (prod,dev,test,stable)
­ Sit with your development team
o Gain an understand of your current API security controls
· Map out all the endpoints for each app, and their access levels
 Discuss use of public / private / protected APIs  Make a plan to restrict endpoints as necessary in new releases.
· Talk through potential rogue-client & app scenarios

#RSAC
Apply, Continued ...
Within 3 months
­ Move any development or test instances and lineups:
o To alternate domains not easily associated with your primary o Regenerate associated SSL certificates and configurations.
­ Ensure all privileged API keys are accounted for and have appropriate access limits.
o Use IAM users and roles and to grant access and set least privilege.
· Many times this is loose during development push, not cleaned up later on
o Ensure there is a hard line between development key / instance rights and production keys / instances.
o Invalidate and re-issue all keys / roles if original controls were not sufficient.

Questions? / Thank You!
Contact: Mike.Cotton@digitaldefense.com

