#RSAC
SESSION ID: DSO-W09
Product Security at Scale: Lessons from Comcast
Sandra Cavazos
Vice President, Product Security and Privacy Comcast

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2
Public (P)

Goal of the Secure Development Lifecycle

Reduce risk of incidents Resolve vulnerabilities early Reduce development cost

Move Security to the Left
Public (P)

#RSAC
3

#RSAC
Priority of the Secure Development Lifecycle

Business Drivers
Brand reputation and future business growth rely on having and providing secure products and services
Technology
Sophisticated hacking tools are being developed and deployed by a wide variety of entities, from individuals to organized groups to nation states

Public (P)

Threats
Attacks are growing in sophistication, with an increased focus on espionage and monetary gain (e.g., ransomware), but occasionally with the simple intent of causing disruption
Compliance Concerns
Government, industry, and customer contracts require security assurances that meet both general and domain-specific regulations
4

Comcast SDL Guiding Principles

#RSAC
Building security in over bolting it on
Implementing features securely over adding security features
Iterating and learning continuously over gating decisions
Empowering development teams over relying on security specialists
Growing a culture of secure practices over policing enforcement
5 Public (P)

#RSAC
Lesson #1
Branding a company-wide SDL program and presenting consistent taxonomy drives alignment and measured progress.
6
Public (P)

#RSAC
Secure Development Lifecycle Practices
7
Public (P)

#RSAC
Prepare and Plan (Practices 1-3)
8
Public (P)

#RSAC
Practice 1: Security Policies, Standards, and Guidelines

POLICIES

High-level statements of senior management intent

STANDARDS

Requirements needed to comply with security
policies

GUIDELINES

Recommendations that give support and
direction to security policies

9
Public (P)

#RSAC
Practice 2: Artisanship

LEVEL 01
WHITE BELT

LEVEL 02
YELLOW BELT

LEVEL 03
ORANGE BELT

LEVEL 04
GREEN BELT

LEVEL 05
BROWN BELT

LEVEL 06
BLACK BELT

Required training for all employees covering topics such as phishing, email compromise, passwords, secure Wi-Fi use and URL hygiene

Gain an understanding of Comcast's security philosophy, typical threats, and the ways to protect our customer's security and privacy.

Technical security training for specialized areas of product development.

Practitioner-level training that increases a learner's security knowledge by providing skillbased training for specialized areas of product development.

Technical mastery of security that fosters and recognizes sustained improvements in security practices that have Comcastwide impact.

Recognizes individuals that acquire expert and/or specialized security knowledge that make significant contributions to Comcast and the industry.

10
Public (P)

Practice 3: Initiative Onboarding

SDL Coaching

ThirdParty Security Assurance

Secure Design Consult

Threat Privacy Impact Modeling Assessment

Code Scanning

ProductionReady Security
Assessment

#RSAC

INITIATIVE

LAUNCH

Is the team participating in
regular SDL coaching?

Is a Design Consult needed?

Is there a change to how Personal
Information will be used?

Does it meet the criteria?

Are there 3rd party vendors?

Does it meet the criteria?

Is there a DevOps pipeline?

11
Public (P)

#RSAC
Building in Security (Practices 4-9)
12
Public (P)

#RSAC
Practice 4: Third-Party Security Assurance

TM / PRSA

TPSA Enrollment Questionnaire
Risk Classification Assessment Vendor Risk Assessment

Three question survey covering data sharing, access to Comcast systems and software development
Assessment to determine the nature of services, data elements that the vendor stores, processes, and/or transmits, and risk rating
In depth assessment to further understand the nature of the relationship with Comcast and the type of information being handled
Security assessments required for highest-risk vendor applications examining the implementation and integrations between systems
13
Public (P)

Practice 5: Threat Modeling
Skilled Security Architect

Interactive Whiteboarding Workshop

Threat Model

Training to Think Like a Hacker

Public (P)

Architectural Diagrams
Findings Documented and Classified
Remediation Plans

#RSAC
14

#RSAC
Lesson #2
Innovate for change, enabling threat models to address privacy risk and scale for large organizations
15
Public (P)

#RSAC
Practice 6: Privacy Impact Assessments

Identify opportunities to reduce privacy risk resulting from changes to design or implementation
Inform contractual language for applicable third-party agreements

Ensure compliance with regulatory requirements
Ensure compliance with Comcast's internal policies

16
Public (P)

Practice 7: Secure Coding
Secure Design Patterns
· Use wherever possible to resolve recurring problems in an accepted, repeatable manner
· Contribute to the library
Software Composition Analysis (SCA)
· Analyzes 3rd party code · Resolve high findings prior to
each code merge
Public (P)

#RSAC
Primary Code Analysis (PCA)
· Can be Static Application Security Testing (SAST) or Interactive Application Security Testing (IAST)
· Resolve high findings prior to each code merge
Security Peer Review
· Trained, second set of eyes · Required status check added
to branch protection configuration to assure reviews occur
17

Practice 8: Production-Ready Security

Assessments

A Software PRSA typically involves the following process steps...

Review configuration files, source code, and other relevant documentation (attachments, wikis, etc.)

#RSAC

Investigate the security of the

data in transit and at rest and

identify areas where malicious

actors can exfiltrate data or interrupt the streams

5

4
Conduct platform-specific testing such as fuzzing, sideloading, etc. Validate the use of weak or known passwords or exposed keys

1

Conduct reconnaissance of

systems using various scanning

tools such as nmap.

2 3

This is an iterative process and each step in the process can trigger additional areas of concern and identified vulnerabilities

Develop high-value target list of

vulnerable services, etc. and

conduct further investigation.

This includes OS and packages

system(s) are installed on

18

Public (P)

#RSAC
Lesson #3
Change Your Lens: Pen testing teams should evolve to address emerging threats and scale their service to protect large enterprises · Continuous Penetration Testing / Hackfests · Tooling
19
Public (P)

Practice 9: Security Reviews

SDL Coaching

ThirdParty Security Assurance

Secure Design Consult

Threat Privacy Impact Code Modeling Assessment Scanning

ProductionReady Security
Assessment

#RSAC

INITIATIVE LAUNCH

SDL Practice Adoption

Design Consult recommendations

Privacy Impact Assessment
recommendations

Vulnerabilities

Risk Classification Assessment and Vendor Risk Assessment results
and closure report

Threat Model Findings

Code scanning tool findings

20
Public (P)

#RSAC
Operating Securely (Practices 10-12)
21
Public (P)

#RSAC
Practice 10: Continuous Vulnerability Management

Technical Controls

· Utilizing certified secure images and configurations · Deploying anti-virus/malware protection, configuration compliance
monitoring, data loss prevention tools, forensic tools, and local encryption · Removing unnecessary software, services, and users · Closing unnecessary ports

Process Controls

· Utilizing a robust patching and update strategy · Managing software and hardware lifecycles so that patches and updates
can be applied · Managing privileged account access

22
Public (P)

Practice 11: Incident Response

PSIRT

Playbooks

#RSAC
Tabletops

Some customer-facing applications are selected as part
of Comcast's bug bounty program (PSIRT), which offers incentives to qualified external
researchers for responsibly disclosing vulnerabilities

Cybersecurity Incident Response Playbooks include up-
to-date roles with 24x7x365 contacts, workflows,
prioritization / scoring / ranking, tracking repositories and working agreements

Public (P)

Tabletop exercises test the efficacy of Incident Response playbooks and ensure all players know their role and how to
respond to an incident
23

#RSAC
Practice 12: Reporting with Comcast xCyberScore
Secure Design
24
Public (P)

#RSAC
Lesson #4
Gamify: Provide a single pane of glass for security work and a weighted score with fairness to drive friendly competition
25
Public (P)

Comcast xCyberScore at a Glance

AGGREGATE
Standards Artisanship

WEIGHT x% x%

Initiative Onboarding

x%

Third-Party Security

x%

Secure Design

x%

Privacy Assessments

x%

Secure Coding

x%

Production-Ready Security Assessments

x%

Security Reviews

x%

Continuous Vulnerability x%
Management

Incident Response

x%

Reporting

x%

CALCULATE

REPORT

Public (P)

#RSAC
PRIORITIZE
26

#RSAC
Comcast xCyberScore Core Attributes
xCyberScore product decisions align to a few key attributes based on SDL mission and intended audience

Transparent Action-Oriented

Clear line of sight from scores to the underlying findings in order to build trust and inform teams as to the impact of security work
Calculations and UI elements are based on open findings rather than showing a full history of what was closed

Motivational

Scores improve with any reduction in time to resolve vulnerabilities, rather than cutting off at SLA date

Growth-Minded

Findings are classified according to mapped SDL practice to draw a correlation to practice adoption and growth

27
Public (P)

#RSAC
Lesson #5
SDL coaching is key to helping teams continually mature in making security part of their culture.
28
Public (P)

SDL Coaching Model

Team/Group* Information Gathering via
survey.

(one team or group*) SDL Seminar & Facilitated Workshop
90 Minutes

(multiple teams or Groups*)
SDL Seminar (30 Minutes)

OR
(one team/group* at a time) Facilitated Workshop
(60 Minutes each)

#RSAC

Team/Group* Sets
Improvement Plan for Next
Quarter

Team/Group* Executes
Improvement Plan

Team/Group* Updates SDL Self-
Assessment

Onboarding

Quarterly Cycle

* A "group" is 1-N teams that: 1. Work on related code (usually a product or product line) 2. Share essentially the same development process (Scrum, Kanban, etc.) 3. Share essentially the same toolchain (languages, build, etc.)
When it's a single team, we're looking for every team member to attend, but when it's more than one team, we're looking for representatives from each team to attend.
Public (P)

#RSAC
Apply Comcast's Lessons Learned

Brand a company-wide SDL program and present consistent taxonomy to drive alignment and measured progress.

Innovate for change, enabling threat models to address privacy risk and scale for large organizations

Change Your Lens: Evolve pen testing teams to address emerging threats and scale their service to protect large enterprises
Public (P)

Gamify: Provide a single pane of glass for security work and a weighted score with fairness to drive friendly competition

Invest in SDL coaching, which is key to helping teams continually mature in making security part of their culture.

30

