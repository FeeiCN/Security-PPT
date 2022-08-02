SESSION ID: GRC-T09R
Bridging the Gap Between Threat Intelligence and Risk Management
#RSAC

Wade Baker
VP, Strategy & Risk Analytics ThreatConnect @wadebaker

#RSAC
Underlying assumption
Good intelligence makes smarter models; Smarter models inform decisions;
Informed decisions drive better practice; Better practice improves risk posture; which, done efficiently, Makes a successful security program.
2

#RSAC
Does your security program look like this?

INTEL

RISK

3

#RSAC
Threat Intelligence
4

#RSAC
Risk Management
5

#RSAC
They have some issues dividing them...

Threat Intelligence
"There's way too much uncertainty around her. I live & die in binary world." "I beat adversaries with STIX & detonate their remains. She plays with numbers." "People say she's "stochastic." That explains a lot; she needs serious help." "She doesn't even cyber, bro! Need I say anything more?"
6

Risk Management
"He's intolerable. I assess he needs to be treated & transferred to a 3rd party." "One look at his laptop makes me panic. It's a giant audit finding with a keyboard." "He never shares with coworkers. I swear, if he TLP-Red's us one more time..." "What's his deal with China, anyway? It's an HR liability if you ask me."

#RSAC
...but they'd make such a great team.
7

#RSAC
Agenda
Bridging Risk & IR in Verizon's DBIR. Building Understanding Finding Common Ground Bridging the Gap Crossing the Divide (Apply)
8

#RSAC
Bridging Risk and IR in Verizon's DBIR

#RSAC
Bridging Risk and IR in the DBIR
Frequency of incident classification patterns per victim industry

10

Figure from Verizon 2014 DBIR

Bridging Risk and IR in the DBIR
The Intelligence Gap

#RSAC
**All figures from Verizon DBIR

"Intel Stop-gap"

"Intelligence Gap"

11

#RSAC
Building Understanding

#RSAC
What is threat intelligence?

"Evidence-based knowledge, including context, mechanisms,
indicators, implications and actionable advice about an existing or emerging menace or hazard to assets that can be used to inform decisions
regarding the subject's response to that menace or hazard."

"The details of the motivations, intent, and capabilities of internal and external threat actors. Threat intelligence includes specifics on the tactics, techniques, and procedures of
these adversaries. Threat intelligence's primary purpose is to inform business decisions regarding the risks and implications
associated with threats."

#RSAC
Classic intelligence cycle

Direction

Plan intel requirements to meet objectives

Distribute finished intel products Dissemination

Collection

Collect intel in support of requirements

Evaluate, integrate, and interpret intel

Analysis

Processing

Process intel for exploitation

Threat intelligence process
The Diamond Model of Intrusion Analysis

#RSAC

Direction

Dissemination

Collection

Analysis

Processing

#RSAC
Threat intelligence process

2) Malware contains C2 domain
1) Victim discovers malware

5) IP address ownership details reveal adversary
3) C2 domain resolves to IP address
4) Firewall logs reveal more comms to C2 IP

#RSAC
What is risk?

"The probable frequency and probable magnitude of future loss"
- Factor Analysis of Information Risk (FAIR)

Risk

Loss Event Frequency

Probable Loss Magnitude

#RSAC
Risk management process (NIST 800-39)

Frame: establishes the context for risk-based decisions and strategy for execution

Assess

Assess: encompasses everything done to analyze and determine the level of risk to the organization.

Monitor: verifies proper implementation, measures
ongoing effectiveness, tracks changes that impact
effectiveness or risk, etc.
Monitor

Frame

Respond: addresses what organizations choose to do once risk has been assessed and determined
Respond

#RSAC
Risk management process (ISO 27005)
"Frame"
"Assess"

"Respond"

"Monitor"

#RSAC
Finding Common Ground

#RSAC
Risky questions needing intelligent answers

What types of threats exist? Which threats have occurred? How often do they occur? How is this changing over time? What threats affect my peers? Which threats could affect us? Are we already a victim? Who's behind these attacks? Would/could they attack us? Why would they attack us? Are we a target of choice? How would they attack us?

Could we detect those attacks? Are we vulnerable to those attacks? Do our controls mitigate that vulnerability? Are we sure controls are properly configured? What happens if controls do fail? Would we know if controls failed? How would those failures impact the business? Are we prepared to mitigate those impacts? What's the best course of action? Were these actions effective? Will these actions remain effective?

21

#RSAC
Intel in the risk management process

Frame: adjust intelligence direction and ops to meet the needs of risk management

Assess

1. Select asset(s) at risk A2ss.essI:dinetneltligfyenrcieskinfsocremnsathrrioeast aen34vad..luvauEDtlnisoeetntirmeabraimlitteyinirdeiesrnkitsiffkiaccalettiovoenrsland

Monitor: intelligence tracks threat changes that warrant system and control changes
Monitor

Frame

Respond: intelligence supports evaluation and implementation of courses of action
Respond

#RSAC
Finding some common ground
Factor Analysis of Information Risk (FAIR)
Risk

Loss Event Frequency

Loss Magnitude

Threat Event Frequency

vulnerability

Primary Loss Magnitude

Secondary Risk

Contact Frequency

Probability of Action

Threat Capability

Resistance Strength

Secondary LEF Secondary LM

Finding some common ground
Structured Threat Information eXpression (STIX)

#RSAC

Direction

Dissemination

Collection

Analysis

Processing

Source: https://stixproject.github.io/

#RSAC
Finding some common ground

A FAIR-ly intelligence approach

Threat Intel (STIX)

Risk Analysis (FAIR)

· TByepheavior · SRoepsohuisrtciceastion · PKlilal_nCnhinagin__APnhda_sSeuspport · IEnxtpelnodite_dT_aErgffeetct · Observed_TTPs
*Initial map: https://threatconnect.com/threat-intelligence-driven-risk-analysis/
25

#RSAC
Bridging the Gap

#RSAC
Example risk assessment project
"During a recent audit, it was discovered that there were active accounts in a customer service application with inappropriate access privileges. These accounts were for employees who still worked in the organization, but whose job responsibilities no longer required access to this information. Internal audit labeled this a high risk finding."
From: Measuring and Managing Information Risk by Jack Freund and Jack Jones (p 123)
27

#RSAC
Example risk assessment project

FAIR analysis process flow

Scenarios

FAIR Factors

Expert Estimation

PERT

Monte Carlo engine

Risk

From: "Measuring and Managing Information Risk" by Jack Freund and Jack Jones (p 93)

Example risk assessment project

Scenarios associated with inappropriate access privileges

Asset at Risk

Threat Community Threat Type

Customer PII

Privileged insiders Malicious

Customer PII

Privileged insiders Snooping

Customer PII

Privileged insiders Malicious

Customer PII

Cyber criminals

Malicious

#RSAC
Effect Confidentiality Confidentiality Integrity Confidentiality

FAIR estimations relevant to the cyber criminal scenario

TEF Min TEF M/L TEF Max TCap Min

0.5 / year 2 / year 12 / year

70

TCap M/L 85

TCap Max 95

29 From: "Measuring and Managing Information Risk" by Jack Freund and Jack Jones (p 127)

#RSAC
Example risk assessment project

Standard cyber criminal threat profile

Factor

Description

Motive

Financial, Intermediary

Primary intent Engage in activities legal or illegal to maximize their profit.

Sponsorship

Non-state sponsored or recognized organizations (illegal organizations or gangs).

Targets

Financial services and retail organizations

Capability

Professional hackers. Well-funded, trained, and skilled.

Risk Tolerance Relatively high; however, willing to abandon efforts that might expose them. Prefer to keep their identities hidden.

Methods

Malware, stealth attacks, and Botnet networks.

30 From: "Measuring and Managing Information Risk" by Jack Freund and Jack Jones (p 54)

#RSAC
Example risk assessment project
Example intelligence-driven adversary profile
31

#RSAC
Example risk assessment project
Example intelligence-driven threat community profile...OVER TIME
32

#RSAC
Crossing the Divide

#RSAC
Making it work in your organization
1. Initiate communication between intel & risk teams 2. Orient intel processes & products around desired risk factors 3. Identify threat communities of interest and create profiles 4. Establish guidelines & procedures for risk assessment projects 5. Encourage ongoing coordination & collaboration
· Create centralized tools/repositories

Underlying assumption

#RSAC

Motivating conviction

Good intelligence makes smarter models; Smarter models inform decisions;
Informed decisions drive better practice; Better practice improves risk posture; which, done efficiently, Makes a successful security program.

35

SESSION ID: GRC-T09R
Bridging the Gap Between Threat Intelligence and Risk Management
THANK YOU!!
#RSAC

Wade Baker
VP, Strategy & Risk Analytics ThreatConnect @wadebaker

