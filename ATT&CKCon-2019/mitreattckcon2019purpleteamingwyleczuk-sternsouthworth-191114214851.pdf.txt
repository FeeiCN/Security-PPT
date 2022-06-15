Lessons in Purple Team Testing with MITRE ATT&CKTM
from Priceline and Praetorian

Who

Matt Southworth.
 CISO @ Priceline  [Previous] Security engineer in financial
services, DNs, etc
 Lots of coffee 
Daniel Wyleczuk-Stern.
 Practice Manager @ Praetorian  [Previous] Officer @ USAF (92d COS)
  Some certs, lots of cats ¯\_()_/¯

2 Lessons in Purple Team Testing with MITRE ATT&CKTM

The Problems
3 Lessons in Purple Team Testing with MITRE ATT&CKTM

Symptoms
Praetorian.
 Clients failing to detect activities on Red
Teams
 On penetration tests after getting flagged
for something...
"Well we would've caught you when you did this so make sure to note our strong detection"

Priceline.
 Repeat findings through adversarial testing  Fidelity loss between adversarial test,
reporting, attempts to recreate
"Bring me pictures of SpiderMan!"

4 Lessons in Purple Team Testing with MITRE ATT&CKTM

MITRE ATT&CKTM
MITRE.
 Federally funded non-profit focused on
research in support of various federal agencies
ATT&CKTM.
 "a globally-accessible knowledge base of
adversary tactics and techniques based on real-world observations"
 Attacker techniques are organized into 12
columns based on their tactic
5 Lessons in Purple Team Testing with MITRE ATT&CKTM

MITRE ATT&CK Enterprise Framework

Why ATT&CKTM?
Praetorian.
 Repeatable process  Aligned with industry  Defensible  Show improvements over time  Provide metrics as well as strategic (tactic) and
technical (procedure) recommendations

Priceline.
 Opportunity for comparative metrics
between security teams
 Common language when talking to security
vendors
 Allow prioritization among the whole
universe of TTPs
 Provide a burn down list to show
improvement over time and justify investments

6 Lessons in Purple Team Testing with MITRE ATT&CKTM

Purple Team Objectives
Improve detection capabilities through targeted emulation of attacker techniques
Telemetry and Analysis - is the right data being collected and is it being processed correctly?
7 Lessons in Purple Team Testing with MITRE ATT&CKTM

Collect metrics related to an organization's ability to detect the specific technique under test
Develop recommendations that are both tactical (specific alerts for specific procedures) as well as strategic (deploying new tools, enriching data, etc)

Constraints

TIME T1030
8 Lessons in Purple Team Testing with MITRE ATT&CKTM

THREATS T1205

CAPABILITY T1207

Outsider Perspective
Cooperation is key Prioritize Accordingly Flexibility
9 Lessons in Purple Team Testing with MITRE ATT&CKTM

 Fail and learn quickly  Quick triaging of findings
 Difficulty to execute  Difficulty to fix  Client input
 Breadth vs depth

Automation
 Metasploit Framework (Rapid 7)  Caldera (MITRE)  Metta (Uber)  Atomic Red Team (Red Canary)  Invoke-Adversary (Microsoft)
10 Lessons in Purple Team Testing with MITRE ATT&CKTM

Why Metasploit Framework (MSF)?
 Alert on the behavior, not the tool  Strong flexibility and automation capabilities  Can integrate with PowerShell and .NET that other teams are creating  Easy to develop for - clear standards and documentation  Large, active open source community  Support Windows, Linux, macOS, or none
11 Lessons in Purple Team Testing with MITRE ATT&CKTM

Why Not MSF?
 Whitelisting the payload can be hard  Deployment across an enterprise isn't easy  Some things are hard to customize  If you're not familiar with using MSF, there's a bit of a "retention curve"
12 Lessons in Purple Team Testing with MITRE ATT&CKTM

Modules
https://github.com/praetorian-code/purple-team-attack-automation
13 Lessons in Purple Team Testing with MITRE ATT&CKTM

Details
14 Lessons in Purple Team Testing with MITRE ATT&CKTM

Demo 1 -- Scheduled Task
15 Lessons in Purple Team Testing with MITRE ATT&CKTM

Demo 1 -- Successful Alert
16 Lessons in Purple Team Testing with MITRE ATT&CKTM

Demo 2 -- No Telemetry
17 Lessons in Purple Team Testing with MITRE ATT&CKTM

Demo 3 -- Actual Alerts
18 Lessons in Purple Team Testing with MITRE ATT&CKTM

Demo 3 -- Actual Alerts
19 Lessons in Purple Team Testing with MITRE ATT&CKTM

Two Cats -- On Stairs
"Attackers only need to get it right once"
 Attackers also only need to get it wrong once  You don't need a cat on every stair if you strategically
place your cats where a human is likely to step
20 Lessons in Purple Team Testing with MITRE ATT&CKTM

Thinking with Chains
 Overlap Purple Team with internal
assessments
 Map the compromise and findings
to ATT&CK
 Threat model your network
21 Lessons in Purple Team Testing with MITRE ATT&CKTM

When ATT&CK is Not Enough
Examples Solutions
22 Lessons in Purple Team Testing with MITRE ATT&CKTM

 SaaS Applications  Internal APIs  Cloud (added in latest
release)
 External communication  Internal communication  Technical breadth

Priceline Examples
Duo Bypass.
 index=security_access bypass sourcetype="duo:auth" NOT
{{whitelisted users}}| dedup user| eval Report= user." %"| rex mode=sed field=Report "s/%/\n/g" | stats list(Report) as Report
GCP org changes.
 index="gcp" | search "data.resource.type"=organization
23 Lessons in Purple Team Testing with MITRE ATT&CKTM

Delivering Value
 Think outside the PDF
- Excel - Web - Tickets
 Think tactically and strategically
- TTP specific - People, process, product
 Prioritization
- ROI - Most common and easiest to fix - Land of diminishing returns
 Don't just find - solve
24 Lessons in Purple Team Testing with MITRE ATT&CKTM

Managing the Purple team ­ CISO's Perspective

 Remember, "the purple team" isn't just
redeployed adversarial testers
 Don't expect testers to do all the work!
 Preparation is important
 Consider what success looks like, including
KPIs
 Encourage flexibility

-- and more cats

25 Lessons in Purple Team Testing with MITRE ATT&CKTM

Managing the Purple Team ­ Preparation and Pre-work
 Don't ignore the people:
- Know roles and responsibilities are - Have a comms channel (Slack/Teams/Discord/Carrier Pigeon) - Have accounts created, systems provisioned, access validated - Daily rhythm (standups, status reports) - Align incentives: we prioritized collaboration over coverage
 Consider objectives: TTPS you want to concentrate on or ignore  Have some expectations about which detective tools will cover which TTPs  Promote the upcoming test internally
26 Lessons in Purple Team Testing with MITRE ATT&CKTM

It's Like a Pentest You Want to Succeed
 Expected results include:
- Alerts are validated, taxonimized per ATT&CK - New team members get an intense onboarding through this process - "Hit list" of improvements, taxonomized and ready to share with vendors - Quick, reproduceable demos using common pentester tools
 Our most important outcome is Collaboration and knowledge
transfer
 Measurements and KPIs
- TTP coverage - Alerts created/improved - Rate of ticket closure
27 Lessons in Purple Team Testing with MITRE ATT&CKTM

So You've Done This Assessment, Now What?

Tactical next steps.
 Track your findings  Make sure your existing alerts are categorized
per ATT&CK
 Document existing TTP coverage  Working with security product vendors
- ATT&CK is a badge in marketing materials, but there's more needed
- Be as explicit as you can with your vendors: We want you to cover these TTPs, here are sample attacks for tuning

Strategic improvements.
 Plan your next test objectives  Suggest KPIs  Reprioritize projects in light of findings

28 Lessons in Purple Team Testing with MITRE ATT&CKTM

Track Your Findings
29 Lessons in Purple Team Testing with MITRE ATT&CKTM

Align Alerts with ATT&CK
 Use what works for your team
- Spreadsheets, Wiki, Version control system
- https://github.com/hunters-forge/ThreatHunter-Playbook
30 Lessons in Purple Team Testing with MITRE ATT&CKTM

Tips for Success
Checklists.  Make sure you request what you need Sharing.  Google sheets, Box folders, etc ­ don't silo information during
the engagement
Planning.  Each Purple Team will be unique and each partner will be unique  No plan survives first contact, but having a plan will allow you to
be flexible from that plan to still stay on track
Define Objectives.  Review previous adversarial understanding

Understand your Environment.
 Know in general what tools you expect to give you general
coverage
Internal Promotion.
 Communicate with other tech teams  They know if weird stuff happens who to go to  Other folks have dropped in during the test just to see how
things are going
Team Diversity.
 Internal ­ variety of experience and skillsets  External ­ strong red teamers, blue teamers, application security

31 Lessons in Purple Team Testing with MITRE ATT&CKTM

Thank You!
32 Lessons in Purple Team Testing with MITRE ATT&CKTM

Questions?

References
 https://www.iteuropa.com/news/services-rise-over-half-security-software-spend  https://attack.mitre.org/docs/ATTACK_Framework_Board_4x3.pdf
Security Spend.
 https://dsimg.ubm-
us.net/envelope/390213/526993/TCM_DR_1705079_Dark%20Reading%20Security%20Spending%20Repo rt.pdf
 https://www.sans.org/reading-room/whitepapers/analyst/security-spending-trends-36697
Images.
 Excuse me, miss, I asked for the large cup of coffee. Hello ...
33 Lessons in Purple Team Testing with MITRE ATT&CKTM

