SESSION ID: SEM-02
Advancing Information Risk Practices

#RSAC

MODERATOR:

Evan Wheeler
Executive Director, Operational Risk Management DTCC

PANELISTS:
Marshall Kuypers
PhD Candidate Stanford University
Jay Jacobs
Sr. Data Scientist BitSight Technologies
Jack Jones
EVP Research & Development RiskLens
Wade Baker
VP, Innovation & Analytics ThreatConnect

#RSAC
Advancing Information Risk Practices

Start Time 1:30 PM
2:25 PM
3:15 PM 3:30 PM
4:15 PM

Title
Practical Quantitative Risk Analysis in Cyber Systems
Exploring Your Data: Risk Visualization Techniques
BREAK
Third Party Risk Assessment: Death by 800 Questions
The Marriage of Threat Intelligence and Risk Assessment

Presenter Marshall Kuypers Jay Jacobs
Jack Jones Wade Baker

2

SESSION ID: SEM-M02
Practical Quantitative Risk Analysis in Cyber Systems
#RSAC

Marshall KuypersA (Presenting)
Dr. Elisabeth Pate-CornellB
APhD Student Stanford University
BProfessor, Management Science and Engineering Stanford University

Significant uncertainty surrounds cyber security

#RSAC

investment

Two-factor authentication

Data loss prevention

Subscription for threat intel

4

Cyber risk is quantifiable!

The data exist!

The models exist!

#RSAC
Quantitative risk is super useful!

N u

140

250

120

200 100

80

150

60

100

N u

40 50
20 0
0 0 2 4 6 8 10 12 14 16 18 20 22

And you need them!

Sat Fri Thu Wed Tue Mon Sun

And you need them!
5

And you need it!

#RSAC
Current methods are limiting

PSAT

Hand

Waving

McLane, Gouveia, et al 6

#RSAC
Our intuition is really terrible

Ask Doctors if they recommend surgery if:

Parole decisions in Israeli Prisons

One month survival rate is 90%

84%

There is a 10% mortality in the first 50%
month
How happy are you these days? How many dates did you have last month?
How many dates did you have last month? How happy are you these days?
7

Extraneous factors in judicial decisions Shai Danzigera, Jonathan Levavb, and Liora Avnaim-Pessoa

Data help us make better decisions

1
Malicious Insider

Website Attacks

#RSAC
Insider

375
Website Compromises

Malicious Email
Lost Devices
8

Data Spillage

The data exist!

Incident Management Systems
Date Time to resolve (hours) Type of incident

High level incident categories
Incident type tag #Lost device #Website defacement #Phishing email #Intern's website

Not log data!

#RSAC
Lots of data exist
Academic research Lawsuits Expert knowledge

9

#RSAC
Case study: 60K incidents at a large org
10000
1000
100
10
1 Date
10

Tot

#RSAC
Incident data is priceless

23 21 19 17 15 13 11 9 7 5 3 1

Sunday Monday Tuesday
Wednesday Thursday Friday
Saturday

550

200

Shellshock publically announced

500

180

on September 24th, 2014

450

160

400

140

350

120

300

100

Within 5 hours, a shellshock

250

80

attack was detected

200

N u

60

N u

150

40

100

20

50

0

200

180

Attacks did not correlate

160 140 120

Thursday and Friday were the most common days for attacks

with US workday hours

100

Incidents continued to

80

occur for several months

60

N u

40

20 0

11

#RSAC
The frequency of incidents can be quantified

Lost Devices

Malware Incidents

Rate of lost devices is remarkably consistent over time
Time
12

Rate of incidents decreases over time
Time

#RSAC
Develop a useful model

Website Attacks

Malicious Email

Data Spillage

Lost Devices

Malware (browse/
USB)

Internet
Other
Organization

Direct Cost Investigation/ Remediation

Cost Model
Disclosure Costs (PII)
Business interruption/ downtime

Intellectual Property Reputation Damage

Use dollars

Use distributions, not averages
13

Direct costs are well understood

Average

0.025

Probability Device Cost

0.34 Cellphone $400

0.02

0.32 Token $100

0.20 Laptop $1000 0.015
0.07 Other $300

Density

0.05 Desktop $1000 0.01
0.02 Tablet $700

Cost Distribution

0.005

#RSAC
Cellphone Token Laptop Desktop Tablet Other

Equipment Losses

Extortion

0

0

200

400

600

800 1000 1200 1400 1600

Cost (Dollars)

14

#RSAC
Investigation costs are well understood

Probability
Complementary CumulCatCivDeFDistribution function

Lost Devices 100

Large Events are NOT outliers

10% of incidents >2 hours

No `average' or `typical' cyber

10-1

1% of incidents >11 hours

breach

Standard deviations and

10-2

some risk metrics (value at

risk) are not valid

10-3

10-1400

101 Investigation Time (Hours)
15

Largest incident can be more

102

impactful than all other

incidents combined!

#RSAC
Reputation damage can be assessed

Pounds!

Newtons!

Density

Reputation Damage
0.014

0.012

0.01

0.008

0.006

0.004

0.002

0

0

20

40

60

80

100 120 140 160 180

Losses (Millions)

16

We can quantify data spillage risk

Rate of spillage incidents

Yearly Rate: 50

Impact Distributions (Data Spillage)
Investigation PII Fines

Reputation

IP Loss

Lost Devices 100

10-1

10-2

10-3

101-400

101

102

Investigation Time (Hours)

CCDF
CCDF

0
10
Investigation costs
-1
10 20% chance per year that data spillage costs are more than $7K
-2
10

Audits

-3
10

0.1% chance per year that data

spillage costs more than $6M

-4

10

103

104

105

106

107

Cost

17

#RSAC Base

Extreme tail risk: Reputation damage

108

109

Security investments are analyzed and

#RSAC

prioritized

Case study on a large organization

Full disk encryption is a good investment with a 4 to 1 benefit-cost ratio.

Data loss prevention is found to be a poor investment, given the technology maturity.

Supply chain risk and the threat of malicious insiders is found to be low.

Poor website and network security is a major risk, and requires significant security investment.

18

You can get started by...

Collect data

Analyze data

#RSAC
Embrace uncertainty

Date Time to resolve (hours) Incident type tag
#Malware #Email #Intern's website

Large events are NOT outliers Largest incident can be more impactful than all other incidents combined!
19

SESSION ID: SEM-M02
Exploring Your Data: Risk Visualiza6on Techniques

Jay Jacobs
Sr. Data Scien,st BitSight Technologies @jayjacobs

Concepts you will walk away with
Probability What makes a good data visualiza,on? Evolu,on of data maturity Advanced techniques
"Risk communication is the term of art used for situations when people need
good information to make sound choices."
Fischhoff, B. (2012). Communicating Risks and Benefits: An Evidence Based User's Guide. Government Printing Office.
2

Why do so many people find probability theory so unintuitive and difficult?
After years of careful research, I finally concluded...it's because probability is unintuitive and difficult.

A CAhchaalllleenngge ein idnata visualiza6on Risk VBuillsetupoainltihzearet(isoeenslides 5 - 8 for instruc,ons)
Bullet point here Bullet point here
4

5

Lost [47 * $Bet]
6

Odds: 38:18 Payout: 1:1

Odds: 38:6 Payout: 5:1

Odds: 38:3 Payout: 11:1

Odds: 38:2 Payout: 17:1

Odds: 38:1 Payout: 35:1

"Average" loss aFer 250 rounds of RouleKe
9

Distribu6ons of loss aFer 250 rounds
10

Walking out of a Casino...
You would...
leave with less money 3 out of 4 visits lose more than 13 * $bet around half the visits lose more than 34 * $bet once every ten visits* win more than 8 * $bet once every ten visits*
* 1:1 payout
11

What makes a good data visualization?
12

Junk Charts Trifecta Checkup
Question

Answer

Message

http://junkcharts.typepad.com/
13

Asking a Ques6on
14

Asking a Ques6on

"My job was to find ques,ons about baseball
that have objec,ve answers, that's all that I do,
that's all that I've done."
-- Bill James, Sabremetrician

15

Asking a Ques6on
A good ques,on... · ...has an objec,ve and measurable answer. · ...isn't too expensive to answer. · ...has someone who wants to know the answer.
16

A Common PiQall

Answer

Message

http://junkcharts.typepad.com/
17

A Common PiQall
United States: Top Categories of SMS Spam
https://www.cloudmark.com/en/s/resources/whitepapers/sms-spam-overview
18

Using Data
19

Evolu6on of Data Maturity
1. Count 2. Compare (careful for language barrier) 3. Infer and es,mate 4. Model
a. forecas,ng b. insight and inference
20

Comparisons can be tricky
21

Comparisons can be tricky
Are these different?
22

Comparisons can be tricky
Are these different?
23

Comparisons can be tricky
Are these different?
If the two distributions came from the same system, what is the probability we
would observe this result?
Answer: 85%
(<5% considered significantly different)
24

Comparisons can be tricky
25

Encoding the Message
26

Encoding the Message
Wahuadtiemnecsesaugnededrosetasntdh?e
27

Communica6on
Sender Encodes

Channel/Medium
words

semaphores

data visualization

Receiver Decodes

28

What are we encoding?
Encoding one or more data variables
· Quantitative or Categorical
with relationships
· Proportional, spatial, temporal
using visual cues
· shape, size, color and position · length, angle, slope and area
29

Communica6on (Quan66es)

Easier Decoding

1. Position along a common scale 2. Position on unaligned scales

3. Length

4. Angle / Slope

5. Area

Tougher Decoding

6. Volume / Density / Saturation 7. Hue

30

Position on a common scale

Area

B A
32

Pie Charts (Area and Angle)
33

Trifecta Checkup
https://www.sans.org/reading-room/whitepapers/analyst/cleaning-breach-post-breach-impact-cost-compendium-36517
35

Remaking the chart...
36

37

38

Communica,ng Risk
39

40

http://understandinguncertainty.org/node/233

42

Records and Expected Loss
43

Probability p(L) of lossess exceeding L

Loss Exceedance Curves
Exceedance Probability
p(L) L
Loss L (in dollars)
44

Exceedence Probability
45

Key Takeawars
Probability is unintui,ve, difficult and cri6cal Trifecta Checkup:
What is the prac,cal ques6on? What does the data say? What does the chart say? Count, compare, predict and infer Goal: probability of exceeding loss
46

#RSAC
Jay Jacobs
Sr. Data Scien,st BitSight Technologies @jayjacobs

SESSION ID: SEM-M02

Third Party Risk Assessment: Death by 800 Questions

Jack Jones
EVP R&D RiskLens, Inc. @jonesFAIRiq

What's the purpose?

Ensure 3rd parties have good security?

Exercise "due diligence?"

Mitigate 3rd party risk?

Help the organization make wellinformed decisions about 3rd party
risk?
2

What we'll cover...
Challenges with the current state Alternatives Q&A
3

Challenges with the current state?
4

So...Darn...Many...Of...Them (3rd parties)
5

Not...Enough...Resources
6

Questionnaire length
One, two, three... ...five hundred and ninety one, five hundred and ninety two...
7

Common types of questions
Policies & standards Processes Architecture
But are they the right questions at the right level of
detail?
8

Questionnaires (often) lie
Okay, perhaps "misinform" is more appropriate Why?
Ambiguous questions Weasel words
"Adequate" "Periodic" "Implement" "Risk assessment"
Yes/No answers Sheer volume vs. resources
9

No such thing as a stupid question...?
Are there controls in place to limit access from/to the roof? How often is the contact information reviewed for accuracy? Does your company provide or manufacture products reliant on the forestry/wood or pulp/paper industry? Are you using PERL's "system ()" call to run any external programs and NOT using backticks (` `)?
10

Interpretation challenges
For the 3rd party respondent
What does this question mean? What qualifies in order to answer "yes"? Time constraints
For the 1st party reviewer
Requires interpretation by individual SME's
All elements treated equally? Introduces bias, inaccuracy, inconsistency, etc. Time constraints
11

Things change
One, two, three... Crap. One, two, three, four... Dang it! One, two...
Answers reflect a point-in-time state
(at best)
12

Are we achieving any of them?

Ensure 3rd parties have good security?

Exercise "due diligence?"

Mitigate 3rd party risk?

Help the organization make wellinformed decisions about 3rd party
risk?

13

Alternatives
14

Refined objective
Cost-effectively understand which 3rd parties we need to worry about most.
15

How much do we need to know, really?
?
How much more do you learn, really, from 1600 questions versus 160, or 16?
16

There are diminishing returns

600%
500%
400%
Increase in Intelligence 300%
200%
100%
0% 0

Diminishing Returns

200

400

600

800

Number of Questions

1000

1200

17

Start with impact triage
Three dimensions:
Access to sensitive information
What kind? How much?
Critical operations dependency Network connectivity (what can they get to?)
18

Step 2: Look for symptoms of weakness...
Limping Erratic behavior
19

Step 2: Look for symptoms of weakness...
Vulnerable conditions Immature risk management
20

Look for symptoms of weakness...
Discrete vulnerable conditions
Poor security test results (e.g., from scanning)
21

Discrete Vulnerability Evaluation
Advantages
Can be a good indicator of risk level and risk management efficacy
...but need some additional information to be sure
Can be more data driven Some degree of automation may be leveraged
Disadvantages
Lagging indicator Scope dependent May be difficult to get approvals to perform testing or see test results
22

Look for symptoms of weakness...
General control conditions
Patching efficacy Access privilege management Detection capabilities Etc.
23

General Vulnerability Evaluation
Advantages
Can be a good indicator of risk management efficacy Can be a good indicator of overall control conditions Easy information to get (if you ask the right questions in the right way)
Disadvantages
Lagging indicator General in nature
24

Look for symptoms of weakness...
Immature risk management
Poor decision-making capability Poor execution
25

The role of risk management...

Risk
Threats

Controls Assets

Impact

Intended
Risk Management
Policies Processes Technologies
Decisions Risk
Appetite

Actual

Execution Awareness

Capability

Motivation

Communication Support Enforcement

Risk

Options

Resources/ Capabilities

Metrics

26

Evaluating risk management
Decision-making
Visibility into:
Assets Threat landscape Controls Deficiency root causes
Analytics
Ability to prioritize effectively
27

Evaluating risk management
Execution
Awareness Capabilities Motivation
28

Risk Management Maturity Evaluation
Advantages
Can be a good indicator of undetected vulnerability Leading indicator (root causes) Easy information to get (if you ask the right questions in the right way)
Disadvantage
Less data driven Many (most?) organizations are immature
29

Ask questions differently
Dare to be different
30

General Controls Example
31

Risk Management Example
32

Keys to effective questions...
Be descriptive Add guidance to reduce ambiguity Use quantitative parameters where feasible Use simple language
33

Applying What You Have Learned
Next week you should:
Evaluate your 3rd party assessments for:
The number of questions. (Diminishing returns?) Yes/No answers?
In the first three months following this presentation you should:
Introduce impact-related triage to identify 3rd parties that represent the greatest potential impact Reduce the number of questions. Focus on higher-level elements that suggest vulnerability and/or risk management weakness. Weed out or refine ambiguous questions.
34

Applying What You Have Learned
Within six months you should:
If you're using yes/no answers, change them to multiple choice (e.g., Strong, Partial, Weak). ...or, better yet, change to questions/answers that are descriptive in nature.
35

Summary
The current approach to 3rd party risk assessments usually don't help us meet our objectives -- at least cost-effectively
Information inaccuracy Diminishing returns
An improved approach is possible using better triage and looking for higher level information that helps us to identify symptoms of weakness
Vulnerability (specific and/or general) Risk management immaturity
Descriptive questions and answers can be more informative than those that seek a yes/no or strong/partial/weak answer
36

#RSAC
Questions
Please fill out your session evaluation form!

SESSION ID: SEM-M02

The Marriage of Threat Intelligence and Risk Assessment

Wade Baker
VP, Strategy & Risk Analytics ThreatConnect @wadebaker

#RSAC

#RSAC
Underlying assumption
Good intelligence makes smarter models; Smarter models inform decisions;
Informed decisions drive better practice; Better practice improves risk posture; which, done efficiently, Makes a successful security program.
2

#RSAC
Intel & Risk: Those two should hook up...
3

#RSAC
...but they haven't quite hit it off...

Threat Intelligence

Risk Management

"There's way too much uncertainty in her life. I need something predictable."
"I'm a simple guy from the STIX and drive a TAXII; she's a one-percenter by nature."
"Everything's an assessment with her; I don't want to be managed!"
"Sure, she's a great model now, but I worry about overfitting as she gets older."
4

"I feel like I'm under constant surveillance; he tries to control my private domain."
"I don't like the way he treats me; he needs to just accept me as I am."
"He won't open up and never shares. I swear, if he TLP-Red's me one more time..."
"What's his deal with China, anyway? It's uncomfortable around my Asian friends."

#RSAC
...& they run in such different circles

Threat Intelligence

Risk Management

Direction

Assess

Dissemination

Collection

Analysis

Processing

Monitor
5

Frame

Respond

#RSAC
Let's help this young couple find love

Intel

Risk

6

#RSAC
Agenda
Marriage of Risk & IR in Verizon's DBIR. Dating: Let's get to know each other. Love: There's something special here. Marriage: How does this actually work?
7

#RSAC
The Marriage of Risk and IR in Verizon's DBIR

#RSAC
Risk + IR = Love
Frequency of incident classification patterns per victim industry

9

Figure from Verizon 2014 DBIR

#RSAC
Dating: Let's get to know each other

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

Loss Event Probable Loss

Frequency

Magnitude

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
Love: There's something special here

#RSAC
Risky questions needing intelligent answers

What types of threats exist? Which threats have occurred? How often do they occur? How is this changing over time? What threats affect my peers? Which threats could affect us? Are we already a victim? Who's behind these attacks? Would/could they attack us? Why would they attack us? Are we a target of choice? How would they attack us?

Could we detect those attacks? Are we vulnerable to those attacks? Do our controls mitigate that vulnerability? Are we sure controls are properly configured? What happens if controls do fail? Would we know if controls failed? How would those failures impact the business? Are we prepared to mitigate those impacts? What's the best course of action? Were these actions effective? Will these actions remain effective?

19

#RSAC
Intel in the risk management process

Frame: adjust intelligence direction and ops to meet the needs of risk management

Assess

1. Select asset(s) at risk A2ss.essI:dinetneltliigfyenrcieskinfsocremnsathrrioeast an3d. vuElnsetirmabailittey irdiesnktiffiaccattioonrsand e4va.luaDtioentermine risk level

Monitor: intelligence tracks threat changes that warrant system and control changes
Monitor

Frame

Respond: intelligence supports evaluation and implementation of courses of action
Respond

Building a model relationship
Structured Threat Information eXpression (STIX)

#RSAC

Direction

Dissemination

Collection

Analysis

Processing

Source: https://stixproject.github.io/

#RSAC
Building a model relationship
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

#RSAC
Building a model relationship
Finding mutual interests and activities

Threat Intel (STIX)

Risk Analysis (FAIR)

· TByepheavior · SRoepsohuisrtciceastion · PKliall_nCnhinagin__APnhda_sSeuspport · IEnxtpelnodite_dT_aErgffeetct · Observed_TTPs
*Initial map: https://threatconnect.com/threat-intelligence-driven-risk-analysis/
23

#RSAC
And they lived happily ever after!

Risk Intel
25

#RSAC
Marriage: How does this actually work?

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

29 From: "Measuring and Managing Information Risk" by Jack Freund and Jack Jones (p 127)

TCap Max 95

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
Making it work in your organization
1. Initiate communication between intel & risk teams 2. Orient intel processes & products around desired risk factors 3. Identify threat communities of interest and create profiles 4. Establish guidelines & procedures for risk assessment projects 5. Encourage ongoing coordination & collaboration
· Create centralized tools/repositories

Underlying assumption

#RSAC

Motivating conviction

Good intelligence makes smarter models; Smarter models inform decisions;
Informed decisions drive better practice; Better practice improves risk posture; which, done efficiently, Makes a successful security program.

34

SESSION ID: SEM-M02

The Marriage of Threat Intelligence and Risk Assessment
THANK YOU!!

Wade Baker
VP, Strategy & Risk Analytics ThreatConnect @wadebaker

#RSAC

