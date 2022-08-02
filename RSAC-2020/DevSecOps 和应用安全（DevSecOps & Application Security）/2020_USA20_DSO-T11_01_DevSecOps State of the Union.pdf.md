SESSION ID: DSO-T11
DevSecOps State of the Union

Clint Gibler
Research Director NCC Group @clintgibler

#RSAC

#RSAC
Distill tips / insights from talks, blog posts, conversations
2

#RSAC
About Me
 Technical Director and Research Director at NCC Group  PhD in Computer Science from UC Davis
Things I   DevSecOps, security automation, scaling security  Automated bug finding (static and dynamic analysis, fuzzing, ...)
3

#RSAC
Before We Start - My Assumptions
· You've found SAST/DAST not that useful (operational time required & cost)
· You're willing to invest time now to reap big security wins later · Your security team has at least a few people, but not dozens
4

#RSAC
Agenda
 Big Picture
 Mindsets and Principles  Choosing How to Invest Your Time
 Scaling Your Company's Security
 The Fundamentals  Scaling Your Efforts  Security Endgame
 Action Plan

#RSAC
Mindsets & Principles
Automate as much as possible
­ Security teams are always time and person-limited, you need to scale
Guardrails not Gatekeepers - minimize "no's"
­ Netflix's Paved Road. Scaling Appsec at Netflix by @astha_singhal
Prefer high-signal, low-noise tools and alerting
­ It may be better to miss some issues than drown in triaging alerts that don't matter
6

#RSAC
Mindsets & Principles
Developers are your customers - UI and UX is important
­ How can we fit into dev's existing tools and workflows? ­ Can we make the secure way easier, faster, or otherwise better than the
current way? ­ Build in useful features (telemetry, logging, etc.)
Self-service security
­ Provide tools and services devs can use without security team interaction
See also: Tech Beacon blog post on mindsets / principles
7

#RSAC
Choosing How to Invest Your Time

Now

Medium Term Long Term

#RSAC
Choosing How to Invest Your Time
Ask Yourself
 Of my near / medium term tasks, which will provide the most long-term strategic value?
 Can I do a near term task a little bit differently to make it much more useful later?
 What (sub)problems can I solve with high accuracy, at scale?

Security Tools in Your Tool Belt
Runtime detection
Fuzzing
Pen tests Choosing what to ignore

Static analysis

@clintgibler #RSAC

Dynamic analysis

Secure wrapper libraries

Bug bounty

Targeting Vulns by Complexity / Class

#RSAC

Easy

Medium

Hard

 Missing TLS

 Standard OWASP  Complex, multi-

 No security headers bugs

step bugs

 Calling dangerous  XSS, SQLi

 Business logic

fxns

 XXE, SSRF

flaws

 Missing security controls

 ...

 Abuse

Increasing Vuln Complexity

@clintgibler

Targeting Vulns by Complexity / Class

Secure defaults

Automated tools

Easy

Bug bounty
Medium

Pen tests

#RSAC
Hard

Increasing Vuln Complexity

Targeting Vulns by Complexity / Class

Secure defaults

Automated tools

Easy

Bug bounty
Medium

Pen tests

#RSAC
Hard

Increasing Vuln Complexity

Targeting Vulns by Complexity / Class

Secure defaults

Automated tools

Easy

Bug bounty
Medium

Pen tests

#RSAC
Hard

Increasing Vuln Complexity

Targeting Vulns by Complexity / Class

Secure defaults

Automated tools

Easy

Bug bounty
Medium

Pen tests

@clintgibler #RSAC
Runtime monitoring
Hard

Increasing Vuln Complexity

#RSAC
Targeting Vulns by Complexity / Class ­ Key Takeaways
 Solve as many of your problems as possible with secure defaults  Automated tools won't solve all of your problems  Bug bounty can provide decent coverage of low/medium
hanging fruit
 If you're building a new AppSec program, start with a private program with few researchers. Consider a pen test first and paying for triage.
 Use pen testing for the hard problems, where it provides best value
 Runtime monitoring for bugs that are too hard/inefficient to find in other waysnd
16

#RSAC
We Come Bearing Gifts: Enabling Prod Security w/ Culture & Cloud AppSec Cali '18 | Patrick Thomas, Astha Singhal

A Pragmatic Approach for Internal Security Partnerships #RSAC AppSec Cali '19 | Scott Behrens, Esha Kanekar

#RSAC
Agenda
 Big Picture
 Mindsets and Principles  Choosing How to Invest Your Time
 Scaling Your Company's Security
 The Fundamentals  Scaling Your Efforts  Security Endgame
 Action Plan

#RSAC
The Fundamentals
Vulnerability Management Continuous Scanning Asset Inventory

#RSAC
Vulnerability Management - Basics
Know your current state and if your future efforts actually work
Success Criteria
 Minimal friction for devs and security  All vulns tracked in the same system as normal bugs  All vulns processed through the same workflow (bug bounty,
pen testing, tools, internal tests)  Track relevant meta data

#RSAC
Vulnerability Management - Basics
Track Meta Data
 Relevant code base (and team/org)  Vuln class - access controls, XSS, SQLi, open redirect, ...
 OWASP Top 10 is too broad, use a more detailed taxonomy, like Bugcrowd's VRT
 Risk, Severity, Impact  How was the vuln found? (Pen test, bug bounty, internal
testing, tool A, tool B...)
@clintgibler

#RSAC
Vulnerability Management - Leveling Up
 Automate as much of the vuln ingestion and triage process as possible
 Tool -> Triage -> Jira  Bug Bounty -> Triage -> Assign to appropriate team
 Create a vuln/risk dashboard that's viewable by project, team, org
 Where should I invest security engineering efforts?  Puts (friendly) pressure on teams / orgs to improve

#RSAC
Vulnerability Management - Leveling Up
The Art of Vulnerability Management | Alex Nassar, AppSec Cali `19 Pro tips on creating a vuln management program that works for devs & security
Data Driven Bug Bounty | Arkadiy Tetelman, BSides SF 2018 Use Bug Bounty data to inform where you invest AppSec time

#RSAC
Data Driven Bug Bounty - Open Vulns by Priority

#RSAC
Data Driven Bug Bounty
Open Vulns By Subteam & Priority

#RSAC
Bug Bounty Cost by Vulnerability Class

Domino's Delivery of a Faster Response was No Standard

#RSAC

Order

#RSAC
A Pragmatic Approach to Internal Security Partnerships AppSec Cali '19 | Scott Behrens, Esha Kanekar

#RSAC
The Fundamentals
Vulnerability Management Continuous Scanning Asset Inventory

#RSAC
Continuous Scanning - AppSec Pipeline
Core idea: continuously scan new code with static and dynamic analysis tools

Developer Machines Static Analysis (SAST)

Code Hosting Static Analysis (SAST)

Test/QA Environment DAST (scan web apps) Container scanning Network vuln scanning Fuzzing

31

#RSAC
Continuous Scanning - AppSec Pipeline
Core idea: continuously scan new code with static and dynamic analysis tools

Developer Machines Static Analysis (SAST) (SAST)

Code Hosting Static Analysis (SAST)

Test/QA Environment DAST (scan web apps) Container scanning Network vuln scanning Fuzzing

32

#RSAC
Continuous Scanning - AppSec Pipeline
AppSec USA Put Your Robots to Work: Security Automation at Twitter | `12

Providence: rapid vuln prevention (slides, blog, code) | `15

Cleaning Your Applications' Dirty Laundry with Scumblr (code) | `16

Scaling Security Assessment at the Speed of DevOps

| `16

SCORE Bot: Shift Left, at Scale! | `18

#RSAC
Continuous Scanning - AppSec Pipeline
Salus: How Coinbase Sales Security Automation (blog, code) DSC London '18 Orchestrating Security Tools with AWS Step Functions (slides) DeepSec `18 A Case Study of our Journey in Continuous Security (code) DSC London '19 Dracon- Knative Security Pipelines (code) Global AppSec Amsterdam `19

#RSAC
Continuous Scanning - Trends & Best Practices
 Focus on iteration speed - adding/removing tools, testing new rules  Scan unit: pull requests - every commit is too noisy, e.g. work in progress  Scans should be fast (a few sec) - give dev feedback while context is fresh
 Can do longer / more in depth scans daily or weekly  Tool findings should be shown within dev systems (e.g. on PR as a comment)
 Findings must always be actionable ­ how does the dev fix it?
 Focus on high signal checks - +95% true positives  Otherwise causes ill will with devs + too much security team operational cost
 Make sure to capture metrics - common finding types, FP rate, etc.  You'll need to build some deduplication and whitelisting logic
Being able to map/reduce over all of your code & live systems is really useful

#RSAC
Continuous Scanning - AppSec Pipeline
Good principles, mindsets, and perspectives
Building a Secure DevOps Pipeline | AppSec USA '17, M Tesauro, A. Weaver Case study and useful principles behind building a pipeline (code)
*AST In CI/CD ­ how to make it WORK! | DSC Singapore `18 Ofer Maor gives a great overview of SAST, DAST, IAST, ... and their pros/cons

Static Analysis by Complexity

Easy

Medium

grep (regexes)

· Operates on strings

#RSAC
Hard
Control / Data flow analysis (SAST)
· Can reason about how data flows through system

Increasing Vuln Complexity

Static Analysis by Complexity

Easy

Medium

grep (regexes)

· Operates on strings
Pro: Fast Con: Not expressive

#RSAC
Hard
Control / Data flow analysis (SAST)
· Can reason about how data flows through system
Pro: Expressive Con: Slow, noisy (FP)

Increasing Vuln Complexity

Static Analysis by Complexity

Easy

Medium

grep (regexes)

Linting / Abstract Syntax Tree (AST)

#RSAC
Hard
Control / Data flow analysis (SAST)

· Operates on strings · Source code aware

Pro: Fast Con: Not expressive
Watch this space!

Middle ground: · Fast · Match source code
structures, some control/data flow

· Can reason about how data flows through system
Pro: Expressive Con: Slow, noisy (FP)

Increasing Vuln Complexity

#RSAC
Static Analysis ­ Security Linting
Writing custom lightweight static analysis checks (AST matching)
Practical Static Analysis for Continuous Application Security - AppSec USA `16 Justin Collins on building custom, lightweight linting rules (Ruby, Python, JS)
How to Write Custom, Lightweight Static Analysis Tools (code) - ShellCon `19 Clint Gibler/Daniel DeFreez- AST matching Ruby (explore)/JS (RCE) w/ semantic
Tools
 Useful multi-language parsers: semantic, bblfsh  Simply match code patterns (code-aware grep): sgrep

#RSAC
Continuous Scanning
What should we look for?

#RSAC
Static Analysis - Code
· High signal vulnerability checks and security anti-patterns · E.g. Disabling TLS verification
· Block banned or dangerous functions · E.g. Calls to exec(), eval() · mozilla/eslint-plugin-amo, mozilla/eslint-plugin-no-unsanitized - disallow innerHTML(), etc.
· Detect security-relevant code additions · "Looks like you're adding some crypo-related code, let's chat."
· Alert on sensitive file changes · AuthZ/AuthN, login flow, things that should rarely change

#RSAC
Open Source Static Analysis Tools
 C/C++ - Clang Static Analyzer, Phasar, Cppcheck  C#/.NET - Puma Scan, Security Code Scan  Golang - gosec, glasgo  Java - SpotBugs, Frameworks: Soot, WALA  JavaScript/Typescript - NodeJsScan, eslint, tslint, eslint-plugin-
no-unsanitized  Python - bandit, dlint, pyre-check (data-flow analysis to find
web app bugs)  Ruby - Brakeman
Massive list: mre/awesome-static-analysis

#RSAC
Static Analysis ­ Out of Date Dependencies
Automate the Discovery & Eradication of Open-Source Software Vulns | BlackHat USA `19 Netflix's Aladdin Almubayed on how to identify and eliminate open-source vulnerabilities across applications you own at scale (slides)
Tools: OWASP DependencyCheck, language-specific tools

#RSAC
Static Analysis ­ Infrastructure as Code
Static Analysis for Code and Infrastructure | Nick Jones, DevSecCon London `16 Scan infra as code (Ansible, Puppet, Chef, ...) for insecure configs
Security Linting Tools
 Terraform: liamg/tfsec, bridgecrewio/checkov, cesar-rodriguez/terrascan  CloudFormation: Skyscanner/cfripper, stelligent/cfn_nag  AWS IAM policies: Parliament (blog | code) can detect cases like when a role could
escalate its privileges

#RSAC
Continuous Scanning - Key Takeaways
 Build the capability to scan every: PR, code base, deployed service
 High signal checks only  Ensure a security baseline - don't try to find every bug  Scan for (missing) security controls, security-relevant changes

#RSAC
The Fundamentals
Vulnerability Management Continuous Scanning Asset Inventory

#RSAC
Asset Inventory - What is It?
Depends on who you ask!
A list of the things you own (code, servers, databases, employee devices, ...)
Common Approaches  Blackbox network-based - OSINT, certificate transparency, ...  Whitebox network-based - Give tool read access to your cloud env  Whitebox holistic - Integrations with cloud provider, code hosting, ...

#RSAC
Asset Inventory - Basics
Know what you own and how they connect
Success Criteria  Code: Meta info file in repos containing owning team, team lead, security PoC, ...  Cloud:
 Live servers/databases/load balancers...  Services used  Credentials, secrets, API tokens  Roles, permissions  Network ACLs, segmentation

#RSAC
Asset Inventory - Leveling Up
 Build capabilities to get visibility into other assets
 Current employees  Employee phones and laptops  Deployment pipeline - track code from repo -> QA/staging -> production
 Enable querying crossing multiple knowledge domains

#RSAC
Asset Inventory - Talks
Lyft Cartography: Automating Security Visibility and Democratization | BSidesSF `19 Sacha Faust: Represent your assets as a graph, search across them (code)
Overcoming old ways of working with DevSecOps - Culture, Data, Graph, & Query Erkang Zheng, DevSecCon Seattle '19 ­ Similar approach ^, security policy as code
Expose Yourself Without Insecurity | Art Into Science '20, Rob Ragan, Oscar Salazar Survey of asset inventory tools and approaches, inside/out vs. outside/in tradeoffs

#RSAC
Lyft Cartography
Represents assets as a graph in Neo4J

#RSAC
Asset Inventory - Examples
 Which RDS instances have encryption turned off?  Which EC2 instances are directly exposed to the internet?
New Critical RCE!!1! #StrutsBleed
 curl PoC


#RSAC
Agenda
 Big Picture
 Mindsets and Principles  Choosing How to Invest Your Time
 Scaling Your Company's Security
 The Fundamentals  Scaling Your Efforts  Security Endgame
 Action Plan

#RSAC
Scaling Your Efforts
Threat Modeling Security Engineering Detection & Response

#RSAC
Threat Modeling
Challenge: Security team can't threat model every story. What do you focus on?
Approaches:
1. Self-service security questionnaires 2. Add lightweight threat modeling to SDLC 3. Threat model as code
Then security engineers get involved in highest risk services and new features

#RSAC
Scaling Your Efforts
Threat Modeling Security Engineering Detection & Response

#RSAC
Security Engineering - "Paved Road"

Core idea: Build libraries / tools that are secure by default for dev teams

Framework/tech choices matter  Mitigate classes of vulns

Web security before robust frameworks

Areas to consider · Managing secrets · Anything related to crypto · Authentication / Authorization · SQL, file system access · Shell exec()

#RSAC
Security Engineering - Examples
· Port front end to React - XSS · Wrote data model wrapper library - SQLi
Key takeaways:
· "<X> is hard to do securely, have to be aware of threats 1, 2, and ..." · Build a secure by default implementation
· "Hitch your security wagon to developer productivity" - Astha Singhal, Netflix · The secure version should have an even better dev UX than the old way · Integrate security at the right points (e.g. new project starter templates) to get
automatic, widespread adoption with minimal effort

#RSAC
Scaling Your Efforts
Threat Modeling Security Engineering Detection & Response

#RSAC
Slack IR Bot
Core idea: When a fishy event occurs, prompt originating user with Slack bot question + 2FA. Only escalate if user did not initiate action.
Motivation: Push validation to devs to free up security engineer time.

#RSAC
Slack IR Bot
Core idea: When a fishy event occurs, prompt originating user with Slack bot question + 2FA. Only escalate if user did not initiate action.
Motivation: Push validation to devs to free up security engineer time.
 Ryan Huber, Slack - Distributed Security Alerting `16  Dropbox - Meet Securitybot: Open Sourcing Automated Security at Scale
2017 (code)  Empowering the Employee: Incident Response with a Security Bot
 Pinterest - Jeremy Krach, AppSec USA 2018

How Dropbox Builds Tools for Threat Detection & IR

Something sketchy happened
Returns & runs a Jupyter notebook corresponding to the alert

Grabs context from disparate systems  Users  Hosts  Processes  ...

#RSAC
Investigation happens in Jupyter notebook
 Repeatable  Documented

#RSAC
Automating SOC Security Runbooks
 Write security runbooks that define how to respond to a given event
 AWS Lambdas spin up to call the relevant security products, custom scripts, etc
Blog Posts
 Twilio's SOCless: Automated Security Runbooks
 Source code | Docs
 Auth0: Guardians of the Cloud: Automating the Response to Security Events

#RSAC
Detection & Response - Key Takeaways
 Push first line triage to originating user (as appropriate)  Any context needed for human analyst to proceed - gather automatically  Document runbooks for how you respond to different events - automate

#RSAC
Agenda
 Big Picture
 Mindsets and Principles  Choosing How to Invest Your Time
 Scaling Your Company's Security
 The Fundamentals  Scaling Your Efforts  Security Endgame
 Action Plan

#RSAC
Security EndGame
Automating Least Privilege Targeting Vuln Classes: Case Study Enforce Invariants

#RSAC
Automating Least Privilege
 Least Privilege: Security Gain without Developer Pain | Enigma `18 (code)  New apps at Netflix are granted a base set of AWS permissions  RepoKid gathers data about app behavior and automatically removes AWS
permissions, rolls back if failure is detected  Apps converge to least privilege with minimal security team interaction  Unused apps converge to zero.

#RSAC
Automating Least Privilege
 Least Privilege: Security Gain without Developer Pain | Enigma `18 (code)  New apps at Netflix are granted a base set of AWS permissions  RepoKid gathers data about app behavior and automatically removes AWS
permissions, rolls back if failure is detected  Apps converge to least privilege with minimal security team interaction  Unused apps converge to zero.
By Kinnaird McQuade of Salesforce (blog) (code)

#RSAC
Automating Least Privilege - Key Takeaways
 Ongoing time requirements from security team: none (some maintenance)  Security benefit / risk reduction: huge Any time you can find opportunities like this, you should take them. => Maximize ratio of security ROI to ongoing time requirements for sec team
@clintgibler

#RSAC
Security EndGame
Automating Least Privilege Targeting Vuln Classes: Case Study Enforce Invariants

#RSAC
Data Driven Bug Bounty
Vulns by Category

#RSAC
Help!
"We're not getting much value out of <popular SAST tool>, can you review how we're doing things and see
what makes sense for us?"
73

#RSAC
Eliminating Bug Classes: Scoping the Problem
"How do we get more value from <current SAST tool>?" "How can we make our SAST tool find more bugs of higher criticality with less manual time?" "How can we find bugs more efficiently regardless of approach?"
At the end of the day:
Given limited AppSec engineer time and budget, what's the best way for us to reduce overall risk?
Note: Not tool or approach-specific
74

#RSAC
How to Do This at Your Company
Aggregate your vulns over the past N quarters
 Group by vuln class (access controls, XSS, SQLi, open redirect, ...)  Group by how you found them (pen test, bug bounty, internal testing, ...)  Weighted by severity/risk/impact

#RSAC
How to Do This at Your Company
Aggregate your vulns over the past N quarters
 Group by vuln class (access controls, XSS, SQLi, open redirect, ...)  Group by how you found them (pen test, bug bounty, internal testing, ...)  Weighted by severity/risk/impact
Review the vulns, what can find / prevent them at scale?
 Goal:
 Minimize cost (bug bounty, pen test, tool licensing)  AppSec time (finding bugs manually, triaging tool results)
 Is one method finding most of your high severity vulns?  What's worked well for your org or team in the past?
 Any success stories for other vuln classes you can leverage?

#RSAC
Data Driven Bug Bounty
Vuln Source To Resolution

#RSAC
Your AppSec Time
78

#RSAC
Your AppSec Time - XXE

Current:

­ Developer training:

2 hours / month

­ Triaging XXE-related bug bounty submissions: 2 hours / week

­ Working with devs to fix XXE issues:

3 hours / week

­ Validating XXE fixes:

1 hour / week

­ Configuring SAST scans for XXE, triaging results: 1 hour / week

­ ... DAST ... :

1 hour / week

­ ...

79

#RSAC
Your AppSec Time - XXE

Current:

­ Developer training:

2 hours / month

­ Triaging XXE-related bug bounty submissions: 2 hours / week

­ Working with devs to fix XXE issues:

3 hours / week

­ Validating XXE fixes:

1 hour / week

­ Configuring SAST scans for XXE, triaging results: 1 hour / week

­ ... DAST ... :

1 hour / week

­ ...

Future:
­ Build a safe by default wrapper library for parsing XML that disables DTDs (External Entities) ­ Teach devs about the new library and roll it out everywhere ­ Scan every PR for XML parsing that doesn't use this library ­ Done

80

#RSAC
Ban Footguns: How to standardize how devs use dangerous aspects of your framework | ShellCon `19
Morgan Roman on how DocuSign eliminated Regex DoS, XXE, open redirects, SSRF via secure-by default libraries + ensuring their use.

#RSAC
Your AppSec Time
82

#RSAC
Your AppSec Time
83

#RSAC
Security Engineering is the compound interest of security.
@clintgibler
84

#RSAC
Targeting Vuln Classes - Key Takeaways
 Use vulnerability history to determine where to invest effort  Consider: vuln classes, what's finding them, impact  What's the most effective way (AppSec time / $) to reduce
risk?  Solving bug classes amplifies your effectiveness

#RSAC
Security EndGame
Automating Least Privilege Targeting Vuln Classes: Case Study Enforce Invariants

#RSAC
Enforce Invariants
Core idea: Enforce/Alert on things that should always or never be true
AWS instances should never be accessible on all ports to the whole Internet Improving Cloud Security Visibility with ChatOps - Lambda auto shuts it down
Manual changes should never be made through the AWS Console Detecting Manual AWS Console Actions (CloudTrail) Arkadiy Tetelman
We should never use these <regions> or <cloud services>  Instances in other regions or use of other services are red flags  Can go further and do this per-app / service  Netflix's Layered Approach to Reducing Risk of Cred Compromise

#RSAC
Enforce Invariants - Key Takeaways
What are things in your environment that should always or never be true?  Cloud, security controls, code, AuthN/AuthZ, users, ... Which of these can you programmatically enforce or alert on? No context to make the decision -> No operational time for security team
@clintgibler

#RSAC
Enforce Invariants - Key Takeaways
What are things in your environment that should always or never be true?  Cloud, security controls, code, AuthN/AuthZ, users, ... Which of these can you programmatically enforce or alert on? No context to make the decision -> No operational time for security team
@clintgibler

@clintgibler #RSAC
How is what we're doing now making us more effective in the future?
If it's not, consider deprioritizing

#RSAC
Agenda
 Big Picture
 Mindsets and Principles  Choosing How to Invest Your Time
 Scaling Your Company's Security
 The Fundamentals  Scaling Your Efforts  Security Endgame
 Action Plan

#RSAC
Action Plan: Apply

Next Week

3 ­ 9 Months

Future

92

#RSAC
Apply ­ Next Week ­ Assess
· Evaluate your fundamentals
· Vulnerability Management, Continuous Scanning, Asset Inventory
· Brainstorm with security leadership and SMEs
· What vulnerability and asset inventory info would we like? · Promising projects?
93

#RSAC
Apply ­ 3 to 9 Months ­ Build
· Nail the fundamentals
· Build a solid foundation
· Do a bite-sized project
· Based on historical vuln data and your company's business factors / risk
94

#RSAC
Apply ­ Future ­ Scale
· Be more highly leveraged with your time (Target vuln classes) · Invest in projects with high security ROI & minimal ongoing
time requirements (Automating Least Priv, Invariants) · Focus on areas that meaningfully raise your security bar
95

#RSAC
Wrapping Up

#RSAC
https://tldrsec.com/blog/appsec-cali-2019

#RSAC
Tl;dr sec Newsletter - https://tldrsec.com
 Talk summaries | Tools & Resources links | Original research

DevSecOps State of the Union

#RSAC
Next Week
Assess

· Backup Slides: https://bit.ly/2020RSA_Gibler · @clintgibler
· https://www.linkedin.com/in/clintgibler/
· Uplevel your security knowledge: https://tldrsec.com

3-9 Months
Build
Future
Scale

· Big Picture: Mindsets & principles, using the right tool for the job · Fundamentals: Vuln management, continuous scanning, asset inventory · Scaling Security: Threat modeling, security engineering, detection & response · Security Endgame: Automating least priv, targeting vuln classes, invariants

#RSAC
Thanks
 Big thanks to all of the people and companies behind the talks, blog posts, and tools referenced - you're pushing the industry forward!
 Special thanks to Barbara Schachner, Emil Vaagland, John Melton, Aladdin Almubayed, Julian Berton, Scott Behrens, Travis McPeak, Doug DePerry, Leif Dreizler, David Scrobonia, Marco Lancini, Chris Horn, and many others for feedback

