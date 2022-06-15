Hunting Update
Joe Ten Eyck

Who am I?
· 15 Year Army Veteran
· 8 Years Information Security
· Red and Blue
· 2 Years Target

The Task
· Significantly improve hunting!
· I don't know what that is!
· Nobody else does either!

What it's not.
· Detection
· Artifact based · Known values/behaviors · Signature based

· Traditional IR
· Artifact based · Take alert for x, evaluate
· -good or bad
· Work thru time

Nothing wrong with either one
· They serve their purpose
· But they don't find unknown

Needed to fill gaps.
· Look for Unknowns · Iterative · Precipitated by need · Data Analytics

Mapped to Attacker Lifecycle
RDP External Access

Hunting is Different...
· Still Artifacts
· In Context
· Time
· network
· Space
· Host
· Attackers have patterns

Mission Statement
Hunt team activities will use intelligence driven use cases to iteratively search the enterprise forest for advanced indicators of compromise missed by conventional detection methods. Our goal is to terminate ongoing malicious activity and produce actionable intelligence to improve Target's security posture. Use cases will be generated using internal and open source intelligence, situational awareness of emerging and current threats, and available data about the current state of the enterprise network. Findings will be utilized to create cases for isolation and investigation, close detection gaps, and create actionable alerting.

So now we need how?
· Easy to say what hunting is.
· How do I make it into a process for others to easily follow?
· I thought what we are doing is similar to any evidence based questions.

High Process
Prepare

Communicate

Find

Process Applied
Ask A Question
Experiment Troubleshoot

Research

Working

No

Yes

Hypothesis

Refactor Include In Future Hunts

Analyze and Draw
Conclusions

Correct Hypothesis Incorrect Hypothesis

Communicate All
Results

Relief
· Scientific Method
· Trust process to lead to outcomes
· We just need to communicate

We break communication down as
· Cases: · Detection Gaps: · Informational:

Current State
· What Hunting did to improve right now
· Found x infections · This That etc.
· Look how cool I am

Future State
· Our IR is bigger, stronger, faster · We now know x · We can now find x

Building the Team
· Knowledge is power
· Not all about us
· Security can influence more than security...maybe

Seats at the table
· Not a function of only IR · Growth requires the
participation of all key-players · Read-ON · Read-Off · Planning

Triage Analyst L2
Event Analyst L2

Incident Handler
L3

Threat Detection Analyst
Cyber Threat Analyst

Practical Application
· Playbooks :
· Threathunting.net · Track historical
knowledge · Reference beginning
· Read-On Read-Off
· Communicate to future and leadership

Outside Participation
· Not just IR aanlyst

Einstein vs High School Teacher
VS

Scientific Process
· Relies on two legs
· The data used · The process/knowledge of analyst

Hunting Maturity Index

Data
Stage 1: Stage 2: Stage 3:

Analysis Stage 1: HMI 0 HMI 1 HMI 2

Stage 2: HMI 1 HMI 2 HMI 3

Stage 3: HMI 2 HMI 3 HMI 4

Not a Linear measurement
· Data
· What are we looking at?
· Analysis
· Who and how are we looking?

Three Stages Each Way
· Reflects growth of People
· Analysis
· From uninformed to highly knowledgeable
· Reflects growth of Technology
· Data
· From standard to use specific

Data Stage 1:
· Standard byproduct data sets
· Not specific · Functional data · Think Firewall logs

Data Stage 2:
· Data Collection
· SIEM · Data for data's sake · Correlation

Data Stage 3:
· For hunting
· Data that is only valuable for pattern based big picture searches · Not useful for alerting · Probably difficult and expensive

Analysis Stage 1:
· Others automation · Entry level · Often tied to vendor solutions

Analysis Stage 2:
· Research based
· What do we know? · How do we identify? · What is it in my environment?
· Allow investment in analyst!!!!

Analysis Stage 3:
· Heavy investment in analyst!!! · Self made automation. · Allows rapid iteration.

Maturity Phases PCR Example

Data Stages: Proxy Logs
Examine Logs, Compare Singular Events - Bytes in vs Bytes out but only on single connection

Analysis Stages: Just evaluating individual connections.

Examine Groups of Logs - Group by user - Bytes in vs Bytes out over period of time - Virus Total and Alexa to Reduce Data Set
Weigh Data against Itself - 30 day average of PCR - 24 hr as change against 30 day average

Requires Analyst to engage in data and develop plan for processing larger datasets.
Requires the analyst to develop a plan to look at large data sets and plan an evaluation technique. Reduces the hunt to what is critical. Use of visualization for rapid iteration.

Which left us with

Hunting Maturity Index

Data
Stage 1: Stage 2: Stage 3:

Analysis Stage 1: HMI 0 HMI 1 HMI 2

Stage 2: HMI 1 HMI 2 HMI 3

Stage 3: HMI 2 HMI 3 HMI 4

Overtime

