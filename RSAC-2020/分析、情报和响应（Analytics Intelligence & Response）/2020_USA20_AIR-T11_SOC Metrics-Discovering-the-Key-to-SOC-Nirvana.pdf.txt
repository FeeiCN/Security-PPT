SESSION ID: 20651
SOC Metrics: Discovering the Key to SOC Nirvana

Ankush Baveja
PreSales Engineer RSA @socdefender

#RSAC

#RSAC
"If you don't collect any metrics, you're flying blind. If you collect and focus on too many, they may be obstructing your field of view."  Scott M. Graffius

#RSAC
Agenda/Motivations for this session
Problem Statement
­ Unable to measure because lack of a framework
Solution - Framework
­ "What to measure" or rather "How to identify what to measure"
Topics we will cover today
­ SOC Capabilities ­ Linking capabilities to metrics ­ Linking metrics to outcome
Disclaimer
­ Not "how to measure" ­ My own views

#RSAC
Some of the Metrics we will discuss today
Mean Time to Detect (MTTD) Mean Time to Respond (MTTR) False Positive List (FPL) and False Positive Rate (FPR) What are we detecting? ­ MITRE ATT&CK Coverage Device Coverage % and Content Requests Processed New Content Requests Created Attack Quotient (AQ)

#RSAC
Introducing GQIM ­ deriving metrics from capabilities
GQIM Method [Stewart 2015]

#RSAC
SOC Capability Triad
· New Tech Onboarding · Trainings

· 24/7 Incident Triage · Incident Escalation &
Containment

Operations

· IT

Engineering and IT

· ·

Tech Evaluation Stack Administration

· Engineering

· Content Management

· Content Requests ­ Technical Validation Blue and Red Team · Content Requests ­ Tooling
(investigations) · Content Requests ­ False Positive's

· Testing New and existing content

· ·

GMEoxItvTeeRrnEranAlTaPTne&ncCTeeKsaCt onRvedeproPargMtes pOrioritization

· Coordination with TI team

#RSAC
Using GQIM for SOC capability triad

#RSAC
Triad #1 - SOC Operations

Metric

Decision

· # of analyst per shift and day · # of incidents per shift and day of
week

· Day/shift where we need to increase or reduce staffing (MTTA > 12 hours and MTTD > 48 hours) ?
· How many average incidents can a analyst handle (vary org/org)

· Mean Time to Acknowledge (MTTA) · How many analysts for a consistent backlog (MTTA < 12 hours)

· Mean Time to Decision (MTTD)

· How many analysts for a consistent "in progress" backlog (MTTD < 48

hours)

· Alert True Positive Rate · # of incident escalated · Content True Positive Rate · Type of Action Taken and time
taken for implementation

· How effective is my SOC (ROI) in detecting attacks · How many CIRT Analysts/investigators/L3 resources on shift · Any specific type of behavior which requires user education or
reporting to senior management (for eg: phishing, ELT targeted)? · Any specific type of control (preventative, detective, corrective,
deterrent etc.) that can help reduce the risk · What is the ability of supporting functions to respond to SOC request
(block/reimage/quarantine)

· Alert False Positive Rate · Content False Positive Rate

· Higher FP ( > 15%) means detection content needs a review (logic/tuning/whitelisting)
· Needs to involve the BR team for review of the content

#RSAC
Kanban v/s Scrum
https://www.atlassian.com/agile/kanban/kanban-vs-scrum

#RSAC
Triad #2 - SOC Engineering & IT

Metric

Decision

Build - Content Implementation (Scrum) · # of new content processed & blocked · Backlog # and future sprints roadmap

· New detections -> SOC run books and feedback · Blocked -> Engage with OEM · Higher backlog -> More resources required · Backlog prioritization with BR team

Build ­ Platform (Scrum)

·

· # of new log sources onboarded

· Total # of log sources being monitored

·

· # of Platform/administrative requests processed & ·

blocked (upgrades, tool onboarding, POC,

·

hardware etc)

·

Which log sources are pending integration and why (backlog prioritization) What is my visibility % w.r.t to my roadmap - Risk Budgeting exercise - Infrastructure and Tools Platform related requirements ­ training, hardware, OEM support Capabilities to be outsourced

Run ­ Content Tuning (Kanban) · # of tuning requests processed & backlog

· How many engineers required for run support and their training needs?

Run ­ Platform (Kanban) · # of adhoc/urgent requests ­ user, access etc · Issue support and troubleshooting

· Platform team rostering · OEM engagement and support model

#RSAC
Triad #3 - Blue and Red Team

Metric

Decision

· False Positive Rate (alert and content) · True positive rate

· Ineffective detections (false sense of security) · Success criteria for BR team

· MITRE ATT&CK Content Coverage

· What coverage is missing?

· Attack Navigator dashboard

· Content Pipeline ­ Detection Improvement plan

· Content requests added to Run/Build backlog

· Content requests WIP (Hypothesis, requirement

gathering, lab tests, release to sprint backlog)

· Attack Quotient (high likelihood/high impact) · Threat Actor tracking and specific TTP's · Pentests · New Vuln (Exploitable, Critical, Relevant) · Threat Intel team inputs

· What are our top threats? · Prioritized Content backlog · What critical threats are not being detected
today?

https://mitre-attack.github.io/attack-navigator/enterprise/

Governance and PMO
Metric
· Training Program - NIST NICE Matrix* (Knowledge Skills Abilities)
· Quality Assurance and Audit · Audit Checklist and compliance · Eg: Triage Quality rating
· SOC Dashboard and visualization · Jira Program backlog reporting for each SOC
capability

#RSAC
Decision
· What training my team needs? · Training budget requirement? · Backup planning - Dependencies on any key
resources?
· Internal Audit assessment and review the quality of functions
· Incorporate process improvements
· Complete view of SOC capabilities and functions for senior leadership
· Performance incentive / Talent Management ­ Linking MBO's
· Internal SOC maturity plan

https://niccs.us-cert.gov/workforce-development/cyber-security-workforceframework

Apply What You Have Learned Today
Next week you should:
­ Choose a framework Download and use the framework sheet
­ Define capabilities for your SOC (current and roadmap)
In the first three months following this presentation you should:
­ Identify metrics for each capability, use the GQIM methodology ­ Define how these measurements affect your decisions
For eg ­ 10% variation vs 40% variation ­ Define stakeholders and assign ownership to monitor/alert
Within six months you should:
­ Create your SOC Dashboard ­ Set periodic checkpoints to review the goals ­ If "A" Metric doesn't add value or lead to any decision, dump it

#RSAC

Q/A

#RSAC

#RSAC
Thank you

