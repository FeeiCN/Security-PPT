London, 20 March 2019 ­ FIRST CTI Symposium
Metrics and ATT&CKTM
Or how I failed to measure everything.

Introduction
1. IoC != intelligence 2. Small overhead for the analyst 3. Better insights 4. One standard framework

Who?
Francesco Bigarella, Intelligence analyst @ ING Bank

2

ATT&CKTM as a tool
Stakeholders Management

Sources Management

Track and Improve CTI
Maturity

3

Why ATT&CKTM

Limitations

· Metrics generation · Standardisation and alignment · Common language · Derive new requirements · Source quality and gaps

· Not always a good fit · Information loss at requirement
mapping
· Limited coverage
· All Techniques are equal

· Prioritization and focus

4

Key to successful integration
· Stakeholder management · Requirements setting + process · Understanding your environment and assets · Valuable intelligence sources · Mapping to ATT&CK
Easy Right?
5

Identify the Stakeholders

CISO

Incident Responder

SOC Analyst

Bank being compromised

What she said

T1 ­ T7 ­ T3

T1 ­ T3 ­ T9

Get a foothold within the What she meant
bank perimeter
Initial access
Mapped to ATT&CK

Spearphishing Attachment
T1
3

T3

T2

T6

T7

T9 = Technique as req.

2

1

1

1

1 = Requirements priority

6

Requirements mapping
I'm interested in ways to compromise payment systems
Daruk, Payments team

Initial Access (TA0001) -

+ "payments"

Review requirements with stakeholder

Priv. Escalation (TA0004) Valid Accounts (T1078)

Credential Access (TA0006) Bash History (T1072)

Collection (TA0009) Input Capture (T1056)

7

Mapping to the other frameworks

Recon.

Weapon.

Delivery
Spoofing Initial Access

Exploit.
Execution Elevation of priv.
Priv. Escalation

Installation
Persistence Defense Evasion

Cyber Kill Chain
MITRE ATT&CKTM STRIDE
STRIDE: https://docs.microsoft.com/en-us/previous-versions/commerce-server/ee823878(v=cs.20) Cyber Kill Chain: https://www.lockheedmartin.com/en-us/capabilities/cyber/cyber-kill-chain.html

C&C
C&C

Actions on Objective
Execution Discovery Lateral Mov. Info. disclosure Collection Exfiltration Credential
Access Repudiation Tampering Denial of service
8

ATT&CKTM Fraud extension

Initiation Target Compromise Perform Fraud Obtain Fraudulent Assets Assets Transfer Monetization

Phishing

Malware

Insider Trading

Compromised payment cards SWIFT transaction

ATM jackpotting

Spear Phishing

Account-Checking Services

Business Email Compromise

Compromised account credentials

Fund Transfer

Money Mules

Vishing

ATM Black Box Attack

Scam

Compromised Personally Identifiable Information (PII)

Cryptocurrency exchange

Fund Transfer

Social Media Scams
Smishing ATM Skimming ATM Shimming POS Skimming

CxO Fraud

Compromised Intellectual Property (IP)

Prepaid Cards Resell Stolen Data ATM Explosive Attack
9

Extending ATT&CKTM
· Only when malicious · Pragmatic approach · Get the experts
First attempt at https://github.com/burritoblue/attck4fraud
10

Requirements mapping with ATT&CKTM
ATT&CK techniques are limited

SOLUTION Get creative. Combine. Extend

LONG-TERM SOLUTION

Document and engage MITRE/community

11

The Threat Actors
Actor Alpha

T2 ­ T4 ­ T10 ­ T12
Actor Beta
T3 ­ T7 ­ T12 ­ T14

Organically linked to Stakeholders Sources Products Mitigations
12

Levelling up the Stakeholder relation

Asset 1

Asset 2

CISO

T6

T1 ­ T2

T1 - T2 - T6

Actor Alpha

Asset 3
T1

13

The Sources and the Products

Source 1

Source 2

Source 3

OSINT

Closed Group

CISO
T1 - T2 - T6

T1 ­ T4

T3 ­ T6 ­ T10

Landscape

Flash

T5 ­ T7
Thematic

T2

T9

Daily summary

T1 ­ T4

T3 ­ T8

T2 ­ T6

T10
14

The big picture

Actors

Stakeholders

Products

Sources

15

Source coverage

Source S1 S2 S3 S4 OSINT

Stakeholder c. 3 3 0 1 1

Actor c. 1 2 2 1 0

Usage 1 3 1 0 1

AVG RFI score (1-10) 9 4 8 6
N/A

Score 5 (14) 8 (12) 3 (11) 2 (8)
2

Number in brackets include avg RFI score for the source. RFI score represent the opinion of the analyst.
16

Source value
Overall

9

8

8

7

7

6

5

5

4

4

3

3

3

2

2

2

1

1

1

1

0

0

0

NOV

DEC

JAN

FEB

MAR

S1

S2

S3

S4

OSINT

RFI feedback not included; Example data

Different angle

By Stakeholder Coverage

S2

S1

S4

OS

S3

By Actor Coverage

S2

S3

S1

S4

OS

17

Product quality

Product
Flash Landscape Thematic Daily summary

Stakeholder covered 1 3 3
0

Actor covered

Source used

1

S2, S3

2

S1

0

S2, OSINT

1

S2

Product Flash

Combine to actual feedback = Product quality

Stakeholder c. Actor c. Feedback (1-10)

1

1

8

Score 10

18

Level up the team
Number of technique never covered by a product Number of covered tactics/techniques for an actor Threat = Capability + Intent + Coverage
19

Takeaways

Because metrics matter

Theme

Metric

Stakeholders Number of stakeholders on boarded (formally/informally)

Number of intel requirements

Number of unique intel requirements

Number of issued products per stakeholder

Number of products within deadline

Number of products meeting the initial scope

Number of incoming RFI per stakeholder

Average score per stakeholder (e.g. success/fail)

Implementation complexity

Added value

low

low

medium

medium

medium

medium

low

medium

low

low

low

low

low

high

medium

high

Audience Program sponsor
Management Management Management Management
Team Team Program sponsor

21

Because metrics matter

Theme

Metric

Products

Number of issued products not linked to a requirement

Implementation complexity

Added value

high

medium

Number of products issued per requirement

high

high

Number of requirements without a product
Number of issued products per intelligence level (operational, tactical and strategic)
Number of IoC per ATT&CK tactic (via Feed)

high

high

low

medium

high

medium

Number of IoC per ATT&CK technique (via Feed)

high

medium

Number of IoC per requirement (via Feed)

high

medium

Number per issued product type and average score

medium

low

Intel sources Number of requirements satisfied by a source

high

medium

Number of products making use of a source (which sources are used the most)

low

high

Average score of outgoing RFIs per source

low

high

Audience Management Management Management
Team Team Team Team Program sponsor Management Management Management

22

Because metrics matter

Theme

Metric

Team

Number of alerts handled

Average saving thanks to met requirement

Average time taken to create a report/product (report cycle - days)

Number of actors on the watch list

Number of actors on the watch list per actor sophistication

Number of actors on the watch list per actor label

Number of incidents/action taken created directly from product

Implementation complexity

Added value

low

low

medium

medium

low

low

low

low

low

low

low

low

high

high

Audience Management Management
Team Program sponsor
Management Management Program sponsor

23

Final thoughts
· Use your TIP + reporting · Clear set of stakeholders' requirements · Not always a good fit · Valuable measurable data
Not a silver bullet...but still a bullet!
24

