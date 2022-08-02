SANS Threat Hunting & IR Summit 2018 2018.09.06-09.07
Launching Threat Hunting from Almost Nothing

Takahiro Kakumaru, CISSP NEC Corporation
1

SANS Threat Hunting & IR Summit 2018

Who am I

· Takahiro Kakumaru, CISSP
Assistant Manager Cyber Security Strategy Division NEC Corporation <t-kakumaru@ap.jp.nec.com>

· Focus : Cyber Threat Intelligence, Threat Hunting,
Cyber Threat Intelligence sharing & consumption

· Activities : OASIS CTI TC & OpenC2 TC member,
Talk at FIRST2016

· Play & coach ice hockey

Disclaimer: "The opinions expressed in this presentation and on the following slides are solely those of the presenters and not necessarily those of their employers."

2

SANS Threat Hunting & IR Summit 2018

My favorite quote

"A good hockey player plays where the puck is. A great hockey player plays where the puck is going to be."
Wayne Gretzky "The Great One", the greatest hockey player ever

3

SANS Threat Hunting & IR Summit 2018

Today's talk
"How can we incorporate threat hunting functions into the current security operations which don't have a sophisticated hunter?"
Threat Hunting Techniques

Threat Hunter
4

Security Operations in the enterprise
SANS Threat Hunting & IR Summit 2018

Why I am here today
1. To share case study focusing on threat hunting operations in enterprise security operations.
2. To emphasize the importance of the process, communication, and culture.
Note: This presentation is going to be about operations, not specific hunting techniques.

5

SANS Threat Hunting & IR Summit 2018

Agenda

1. Introduction to Threat Hunting Operations 2. Let's get quick win! 3. Building Threat Hunting Operations 4. Threat Hunting Case Study 5. Threat Hunting Operations At Scale 6. Threat Hunting Operations Framework

6

SANS Threat Hunting & IR Summit 2018

Introduction to Threat Hunting Operations

7

SANS Threat Hunting & IR Summit 2018

Threat Hunting is the PROCESS

"Cyber Threat Hunting is the process of proactively and
iteratively searching through networks to detect and isolate advanced threats that evade
existing security solutions."

https://sqrrl.com/media/Framework-for-Threat-Hunting-Whitepaper.pdf

8

SANS Threat Hunting & IR Summit 2018

Characteristics of a THREAT HUNTER

"Threat Hunter is a cybersecurity threat analyst who uses proactive methods to uncover security incidents that might otherwise go undetected."

"Communicative" "Collaborative"
"Creative" "Threat Awareness"
"Critical thinker"
"Business knowledge"

https://searchcio.techtarget.com/definition/threat-hunter-cybersecurity-threat-analyst

9

SANS Threat Hunting & IR Summit 2018

Threat Hunting Maturity Model (HMM)

Maturity level of : - routine data collection - data analytics and tools

LEVEL
0

LEVEL
1
MINIMAL

LEVEL

LEVEL
2

3
INNOVATIVE

PROCEDURAL

LEVEL
4
LEADING

INITIAL
10

https://sqrrl.com/the-threat-hunting-reference-model-part-1-measuring-hunting-maturity/
SANS Threat Hunting & IR Summit 2018

Our Security Operations
SOC Team

CSIRT CSIRT
Manager
Incident Response
Team

Threat Research
Team

Protection Operation
Team

Malware Analysis
Team

NEC groups
ca. 110,000 employees ca. 190,000 devices

11

SANS Threat Hunting & IR Summit 2018

Security Tools (1)

SOC Team

Alerting System (IDS)

Report from employee

Protection Operation
Team

Perimeter defense (Proxy, FW)

Network Isolation
(SDN)

Patch

Information

Management Sharing /

System (NCSP) Enlightenment

*NCSP: NEC Cyber Security Platform

12

SANS Threat Hunting & IR Summit 2018

Security Tools (2)
Incident Response
Team

Forensic Tool

Log Management

Malware Analysis
Team

Malware Analysis Tool

Malware DB

13

SANS Threat Hunting & IR Summit 2018

Security Tools (3)
Open Source Threat Intelligence
Feeds
Security Vendors
Commercial Threat Feeds / Report
Community
14

Threat Research
Team

Threat Intelligence Platform (TIP)

SANS Threat Hunting & IR Summit 2018

Let's get quick win!

15

SANS Threat Hunting & IR Summit 2018

Let's get quick win! Primary Threat Hunting Techniques

Searching Clustering

Grouping

Stack Counting

https://sqrrl.com/media/ebook-web.pdf

IOC searches
Indicators
{IP address, URL}
16

Proxy log
{IP address, URL}
SANS Threat Hunting & IR Summit 2018

???

Our First Threat Hunting Result IOC searches finished!!!
0 (zero) matched.

17

SANS Threat Hunting & IR Summit 2018

Let's confirm definition, again
"Threat Hunting is the PROCESS"

18

SANS Threat Hunting & IR Summit 2018

What we did

IOC searches

Indicators

Proxy log

0

{IP address, URL}

{IP address, URL}

PROCESS or TECHNIQUE

19

SANS Threat Hunting & IR Summit 2018

Building Threat Hunting Operations

20

SANS Threat Hunting & IR Summit 2018

KAIZEN
"The right process will produce the right results."
TOYOTA WAY

21

SANS Threat Hunting & IR Summit 2018

Outline of Threat Hunting Operations Framework

Hunting Team's Objective Statement

Value 1
V

Value 2
V

Value 3
V

Hunting Operations

Process 1 Process 2 Process 3 Process 4 Process 5 Process 6

P P P P P P rocess

rocess

rocess

rocess

rocess

rocess

Hunting Procedures
22

Searching

Clustering

SANS Threat Hunting & IR Summit 2018

Grouping

Stack Counting

Challenges
Challenge 1: "for what?" and "so what?"
Challenge 2: "workable operations"

23

SANS Threat Hunting & IR Summit 2018

Challenge #1 "For what?" and "So what?"

"For what?"
Core values of threat hunting · Threat Hunting Loop (cycle)

"So what?"
Actions after finding threat from hunting · Remediation as quickly as
possible · Close detection gap
(signatures, detection rules /algorithms)

24

SANS Threat Hunting & IR Summit 2018

Hunting Loop is "Core"

THREAT HUNTING LOOP

CREATE
Hypotheses

- Incident Response (Forensics)
- Threat Research

INFORM & ENRICH
Analytics

INVESTIGATE
Via Tools & Techniques

- Operate via Tools

https://sqrrl.com/the-threat-huntingreference-model-part-2-the-hunting-loop/
25

UNCOVER
New Patterns & TTP's
SANS Threat Hunting & IR Summit 2018

- Threat Research

Actions lead to business goals

"Understand business requirement enough before constructing the process."

"Crafting the InfoSec Playbook"
https://www.amazon.com/Crafting-InfoSec-PlaybookSecurity-Monitoring/dp/1491949406

Define response policy in advance · Escalation · Precaution · Mitigation · Remediation

26

SANS Threat Hunting & IR Summit 2018

Challenges
Challenge 1: "for what?" and "so what?"
Challenge 2: "workable operations"

27

SANS Threat Hunting & IR Summit 2018

Challenge #2 : "workable operations"
High Process
- Ask a Question
Prepare - Research
- Hypothesis

Find

- Experiment - Working (Yes/No) - Troubleshoot

Communicate

- Analyze and Draw Conclusions - Communicate All Results - Refactor include in Future Hunts

https://www.first.org/resources/papers/conf2017/Buildinga-Threat-Hunting-Framework-for-the-Enterprise.pdf

28

SANS Threat Hunting & IR Summit 2018

Minimum Cycle Prepare
"where" and "what"
Find
"how" and "query"
Communicate
"so what"

Jump the hurdle to getting the milestone

Prepare
"where" and "what"
Find
"how" and "query"

1. Simple first and collect from outside
a. Intelligence-driven b. Situational awareness c. Domain expertise
https://www.sans.org/reading-room/whitepapers/threats/ generating-hypotheses-successful-threat-hunting-37172
2. Practicable execution procedure
a. Minimum data collection b. User-friendly tools

Communicate
"so what"
29

3. Actionable course of actions
a. Understandable b. Evidence to lead actions
SANS Threat Hunting & IR Summit 2018

CSIRT with Threat Hunting Capabilities CSIRT
CSIRT Manager

SOC Team

Incident Response
Team

Protection Operation
Team

Malware Analysis
Team

30

SANS Threat Hunting & IR Summit 2018

Threat Research
Team
Threat Hunting
Team
Hunting Operation
Team

Threat Hunting Operations

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Incident Response Team

6. Enforce Response Policy

Incident Response Team

5. Evaluate Result

4. Search Threat

2. Analyze CTI & Create Scenario
3. Set Response Policy
Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

31

SANS Threat Hunting & IR Summit 2018

Threat Hunting Operations

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Incident Response Team

6. Enforce Response Policy

Incident Response Team

5. Evaluate Result

4. Search Threat

2. Analyze CTI & Create Scenario
3. Set Response Policy
Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

32

SANS Threat Hunting & IR Summit 2018

Threat Hunting Operations

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Incident Response Team

6. Enforce Response Policy

Incident Response Team

5. Evaluate Result

4. Search Threat

2. Analyze CTI & Create Scenario
3. Set Response Policy
Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

33

SANS Threat Hunting & IR Summit 2018

Threat Hunting Operations

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Incident Response Team

6. Enforce Response Policy

Incident Response Team

5. Evaluate Result

4. Search Threat

2. Analyze CTI & Create Scenario
3. Set Response Policy
Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

34

SANS Threat Hunting & IR Summit 2018

Threat Hunting Operations

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Incident Response Team

6. Enforce Response Policy

Incident Response Team

5. Evaluate Result

4. Search Threat

2. Analyze CTI & Create Scenario
3. Set Response Policy
Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

35

SANS Threat Hunting & IR Summit 2018

Threat Hunting Case Study

36

SANS Threat Hunting & IR Summit 2018

Case Study #1 ­ Malicious email notification from employee
Sandbox email scanner didn't detect spear phishing email. Employee felt malicious email, and then notified security operation team of its. Threat research and malware analysis team jointly analyzed it, and recognized possible targeted attack.

Let's start hunting!

37

SANS Threat Hunting & IR Summit 2018

Case Study #1 ­ Process Overview

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

Possible targeted attack via email ???

Contact employee not to

/external CTI

Threat Hunting Team

Incident Response Team

ope6n.itEnforce Response Policy

Confirmed undeatet5ctat.ecEdkvaluate Result
Incident Response Team

4. Search

2. Analyze CTNIo&alert, check email Create Scenario delivery log

3. Set

Threat Hunting Team

Response PolicyCheck if employee

opened & clicked it.

Notify not to open it.

Search email delivery as instructed

Threat

Hunting Operation Team

38

SANS Threat Hunting & IR Summit 2018

Case Study #1 ­ Process Overview (1)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

Possible targeted attack via email ???

/external CTI

Threat Hunting Team

Incident Response Team

6. Enforce Response Policy

5. Evaluate

2. Analyze CTNIo&alert, check email Create Scenario delivery log

3. Set

Threat Hunting Team

Incident Response Team

Result

4. Search

Response PolicyCheck if employee
opened & clicked it. Notify not to open it.

Threat

Hunting Operation Team

39

SANS Threat Hunting & IR Summit 2018

Case Study #1 ­ Process Overview (2)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Incident Response Team

6. Enforce Response Policy

Incident Response Team

5. Evaluate Result

Search email delivery as instructed

4. Search Threat

2. Analyze CTI & Create Scenario
3. Set Response Policy
Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

40

SANS Threat Hunting & IR Summit 2018

Case Study #1 ­ Process Overview (3)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Contact employee not to

ope6n.itEnforce

2. Analyze CTI &

Response Policy
Incident Response Team

Create Scenario

Confirmed undeatet5ctat.ecEdkvaluate Result
Incident Response Team

4. Search Threat

3. Set Response Policy
Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

41

SANS Threat Hunting & IR Summit 2018

Case Study #2 ­ Threat Report shows malicious indicators
Threat research team recognized APT report shows several malicious indicators such as IP, URL, HTTP request, file path of malware, etc. Threat hunting team wondered if same attack campaign has been happened to our organization because of intended country. There were log collections to be verified.

Let's start hunting!

42

SANS Threat Hunting & IR Summit 2018

Case Study #2 ­ Process Overview (part 1)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

Possible similar APT attack ???

Started a major

/external CTI

Threat Hunting Team

investigation int6o .itE. nforce Response Policy
Incident Response Team
traffCicoenvfiirdmenecdemonalipc5rioo.uxEysvaluate Result
Incident Response Team

4. Search

2. Analyze CTI &Check IP, URL, and Create ScenaHriToTP request header

3. Set

Threat Hunting Team

Response Policy
Need immediate

action because of APT

Repeatedly search every evidence

Threat

Hunting Operation Team

43

SANS Threat Hunting & IR Summit 2018

Case Study #2 ­ Process Overview (part 1) (1)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

Possible similar APT attack ???

/external CTI

Threat Hunting Team

Incident Response Team

6. Enforce Response Policy

5. Evaluate

2. Analyze CTI &Check IP, URL, and Create ScenaHriToTP request header

3. Set

Threat Hunting Team

Incident Response Team

Result

4. Search

Response Policy
Need immediate
action because of APT

Threat

Hunting Operation Team

44

SANS Threat Hunting & IR Summit 2018

Case Study #2 ­ Process Overview (part 1) (2)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Incident Response Team

6. Enforce Response Policy

Incident Response Team

5. Evaluate Result

Repeatedly search every evidence

4. Search Threat

2. Analyze CTI & Create Scenario
3. Set Response Policy
Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

45

SANS Threat Hunting & IR Summit 2018

Case Study #2 ­ Process Overview (part 1) (3)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Started a major

investigation int6o .itE. nforce

2. Analyze CTI &

Response Policy
Incident Response Team

Create Scenario

traffCicoenvfiirdmenecdemonalipc5rioo.uxEysvaluate Result
Incident Response Team

4. Search Threat

3. Set Response Policy
Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

46

SANS Threat Hunting & IR Summit 2018

Case Study #2 ­ Malware samples with characteristics
After investigation, IR team identified tens of PCs had been infected by this campaign. Threat research team and malware analysis team looked at past attacks and TTPs attacker used. Threat hunting team successfully generated extraction rule to this type of attack from samples.

Let's start hunting, again!

47

SANS Threat Hunting & IR Summit 2018

Case Study #2 ­ Process Overview (part 2)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

Possible similar TTPs used ???

Started immediate

/external CTI

Threat Hunting Team

mitigat6io. nEnforce
Response Policy
Incident Response Team
Found specific traffic on
PCs undetecte5d.bEyvaluate

2. Analyze CTIC&heck HTTP request Create Scenawritihoextracted pattern

3. Set

Threat Hunting Team

initial known indicatorRs esult Incident Response Team

4. Search

Response Policy
Need immediate
action because of APT

Search query expressed as specific HTTP request

Threat

Hunting Operation Team

48

SANS Threat Hunting & IR Summit 2018

Case Study #2 ­ Process Overview (part 2) (1)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

Possible similar TTPs used ???

/external CTI

Threat Hunting Team

Incident Response Team

6. Enforce Response Policy

5. Evaluate

2. Analyze CTIC&heck HTTP request Create Scenawritihoextracted pattern

3. Set

Threat Hunting Team

Incident Response Team

Result

4. Search

Response Policy
Need immediate
action because of APT

Threat

Hunting Operation Team

49

SANS Threat Hunting & IR Summit 2018

Case Study #2 ­ Process Overview (part 2) (2)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Incident Response Team

6. Enforce Response Policy

Incident Response Team

5. Evaluate Result

Search query expressed as specific HTTP request

4. Search Threat

2. Analyze CTI & Create Scenario
3. Set Response Policy
Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

50

SANS Threat Hunting & IR Summit 2018

Case Study #2 ­ Process Overview (part 2) (3)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Started immediate

mitigat6io. nEnforce

2. Analyze CTI &

Response Policy
Incident Response Team
Found specific traffic on
PCs undetecte5d.bEyvaluate

Create Scenario 3. Set

initial known indicatorRs esult Incident Response Team

4. Search

Response Policy

Threat

Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

51

SANS Threat Hunting & IR Summit 2018

Case Study #2 ­ Found additional infected PCs by pattern

http://www.xxx.com/{path1/path2/path3/xxx.html} ?svkrfghu=VGhpcyBpcyBzYW1wbGUxLiBUaGlzIGlzIHNhbXBsZTIuIFRoa

http://www.xxx.com/{path1/path2/path3/xxx.html} ?emexg=3YXMgc2FtcGxlMS4gVGhhdCB3YXMgc2FtcGxlMyFtcGxlMS4gVG

http://www.xxx.com/{path1/path2/path3/xxx.html} ?eprinuf=a29yZWhhIHNhbXBsZSBkZXN1MS4hhIHNhbXBBkZXN1Mi4ga29yZW

Variable

Host name

Parameter

*It's sample of patterning. Each value are not original one, but replaced.

- Host name are same, and length > 100. - Variable are almost different each other. - Length of parameter > x0 byte

52

SANS Threat Hunting & IR Summit 2018

Case Study #3 ­ Adware, it's not Adware!?
Threat research team recognized that an unauthorized modification has been found on cleaner software, and notified it to hunting team. Threat hunting team started looking at it within several hours after first recognition.
Let's start hunting!

53

SANS Threat Hunting & IR Summit 2018

Case Study #3 ­ Process Overview (part 1)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

Possible adware type attack ???

Started a normal

/external CTI

Threat Hunting Team

investigation acti6on. sEnforce Response Policy
Incident Response Team

Confirmed on

esxeavectratlr5aP.fCfiEcsvaluate

Result

Incident

Response Team

4. Search

2. Analyze CTI &Make scenario to Create Scenario check IP, URL

3. Set

Threat Hunting Team

Response Policy
Blocking external

traffic would be fine.

Repeatedly search evidence on proxy log

Threat

Hunting Operation Team

54

SANS Threat Hunting & IR Summit 2018

Case Study #3 ­ Process Overview (part 1) (1)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

Possible adware type attack ???

/external CTI

Threat Hunting Team

Incident Response Team

6. Enforce Response Policy

5. Evaluate

2. Analyze CTI &Make scenario to Create Scenario check IP, URL

3. Set

Threat Hunting Team

Incident Response Team

Result

4. Search

Response Policy
Blocking external
traffic would be fine.

Threat

Hunting Operation Team

55

SANS Threat Hunting & IR Summit 2018

Case Study #3 ­ Process Overview (part 1) (2)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Incident Response Team

6. Enforce Response Policy

Incident Response Team

5. Evaluate Result

4. Search

Repeatedly search evidence on proxy log

Threat

2. Analyze CTI & Create Scenario
3. Set Response Policy
Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

56

SANS Threat Hunting & IR Summit 2018

Case Study #3 ­ Process Overview (part 1) (3)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Started a normal

investigation acti6on. sEnforce

2. Analyze CTI &

Response Policy
Incident Response Team

Create Scenario

Confirmed on

esxeavectratlr5aP.fCfiEcsvaluate

Result

Incident

Response Team

4. Search Threat

3. Set Response Policy
Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

57

SANS Threat Hunting & IR Summit 2018

Case Study #3 ­ No Adware!? Software Supply Chain Attack
A few days later, software developer notified IR team as it's watering hole attack and we are one of them!? Threat research team started analyzing threat report from the developer and looking for more information. Threat hunting team changed response policy from adware policy to targeted attack policy immediately.

Let's start hunting, again, and rapidly!

58

SANS Threat Hunting & IR Summit 2018

Case Study #3 ­ Process Overview (part 2)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

No, it's targeted attack !

Started deep

/external CTI

Threat Hunting Team

investigation acti6on. sEnforce Response Policy
Incident Response Team
Ceovnidfiernmceeduandddeittei5octn.eaEdlvaluate Result
Incident Response Team

4. Search

2. Analyze CTI & Make scenario Create Scenario updated with
additional indicators

3. Set

Threat Hunting Team

Response Policy
Need investigation,
forensic, and response

Search evidence with updated indicators

Threat

Hunting Operation Team

59

SANS Threat Hunting & IR Summit 2018

Case Study #3 ­ Process Overview (part 2) (1)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

No, it's targeted attack !

/external CTI

Threat Hunting Team

Incident Response Team

6. Enforce Response Policy

5. Evaluate

2. Analyze CTI & Make scenario Create Scenario updated with
additional indicators

3. Set

Threat Hunting Team

Incident Response Team

Result

4. Search

Response Policy
Need investigation,
forensic, and response

Threat

Hunting Operation Team

60

SANS Threat Hunting & IR Summit 2018

Case Study #3 ­ Process Overview (part 2) (2)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Incident Response Team

6. Enforce Response Policy

Incident Response Team

5. Evaluate Result

4. Search

Search evidence with updated indicators

Threat

2. Analyze CTI & Create Scenario
3. Set Response Policy
Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

61

SANS Threat Hunting & IR Summit 2018

Case Study #3 ­ Process Overview (part 2) (3)

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Started deep

investigation acti6on. sEnforce

2. Analyze CTI &

Response Policy
Incident Response Team

Create Scenario

Ceovnidfiernmceeduandddeittei5octn.eaEdlvaluate Result
Incident Response Team

4. Search Threat

3. Set Response Policy
Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

62

SANS Threat Hunting & IR Summit 2018

Lessons learned from case study 1. It's not always have to rely on difficult hunting techniques
to identity undetected threat, but build the process.
2. It's much worth if we can find security breach by ourselves before being notified from outside.
3. Let's start from what we can do, and we should do what we can do.
4. Hypothesis generation would be still difficult part for us.

63

SANS Threat Hunting & IR Summit 2018

Threat Hunting

Operations

At Scale

64

SANS Threat Hunting & IR Summit 2018

Threat Hunting Operations

0. Set Objectives

CSIRT Manager

Threat Research Team

1. Collect internal

/external CTI

Incident Response Team

6. Enforce Response Policy

Incident Response Team

5. Evaluate Result

4. Search Threat

2. Analyze CTI & Create Scenario
3. Set Response Policy
Hunting Operation Team

Threat Hunting Team
Threat Hunting Team

65

SANS Threat Hunting & IR Summit 2018

Tools for Support Threat Hunting Operations

Threat Hunting
Team

Asset, Internal System, Directory DB

Internal CTI (Observed & Analysis) DB

Hunting Scenario System (STIX)

Hunting Operation
Team

Log Analysis & Dashboard

EDR / NCSP

User Inquiry System

Incident Response
Team

Forensic Tool

Threat Intelligence Log Management Platform (TIP)

Threat Analysis System

66

SANS Threat Hunting & IR Summit 2018

Threat Hunting System Architecture Overview

Enrichment Source

CTI Source
(External/Internal)

Logs
(Network/Mail)

Threat Analysis System
Training Data
Incident Response Team 67

Threat Intelligence Platform (TIP)

Hunting Scenario System (STIX)

Threat Research Team

Threat Hunting Team

Hunting Operation Team
SANS Threat Hunting & IR Summit 2018

Log Analysis & Dashboard
User Inquiry System

Threat Hunting Operations Framework
68

SANS Threat Hunting & IR Summit 2018

Values of Hunting Operations

1
Look for uncovered threat or ongoing threat
that evade existing security solutions, and
mitigate and remediate it as soon as possible.

2
Look for logic such as signature, detection rule to detect uncovered threat, and apply
to existing security solutions to close detection
gaps.

69

SANS Threat Hunting & IR Summit 2018

3
Close attack surface as part of
hardening activities to enhance current security posture together with Red
team.

Threat Hunting Operations Framework

Hunting Team's Objective Statement

Value 1 Look for
1 uncovered threat

Value 2
2

Look for detection logic

Value 3
3 Close attack surface as hardening

Hunting Operations
Hunting Procedures

Process 1
Collect CTI

Process 2 Process 3
Create Set Scenario Policy

Process 4
Search Threat

Process 5 Process 6
Evaluate Enforce Result Policy

Trailhead

Trailblazing

Searching

Clustering

Grouping

Stack Counting

70

SANS Threat Hunting & IR Summit 2018

KAIZEN, again
"The right process will produce the right results."
TOYOTA WAY

71

SANS Threat Hunting & IR Summit 2018

Hunting Process KAIZEN Model

Optimized and improved

Level - 3 Evolving your standard process at all times

123

1

2 3

Quantitatively managed

Level - 2 Follow your standard process at all times

123
A

123
B

123
C

Managed and defined

Level - 1 Define your standard hunting process

132
A

231
B

123
C

Level - 0 Ad-hoc

Standard process

72

SANS Threat Hunting & IR Summit 2018

To improve productivity of hunting program
1. Define your hunting process according to objectives where hunting team would produce the right results. · Give priority to accomplish the process than making use of difficult hunting techniques you cannot handle. · Choose hunting techniques and tools which support the hunting process.
2. Improve the process first based on KAIZEN · Communication and KAIZEN culture are key to success.

73

SANS Threat Hunting & IR Summit 2018

HMM and KAIZEN

KAIZEN
EVOLVE Level - 3

Road to productive hunting program

FOLLOW Level - 2

Hunting program

DEFINE Level - 1

ADHOC Level - 0
0
INITIAL
74

1

2

3

MINIMAL PROCEDURAL INNOVATIVE
SANS Threat Hunting & IR Summit 2018

4 HMM
LEADING

Conclusion
"A good hunter plays where the threat is. A great hunter plays where the threat is going to be."

75

SANS Threat Hunting & IR Summit 2018

Thanks to
· Naoki Sasamura (NEC-CSIRT) · Takeo Tagami (NEC-CSIRT) · Yoshihiro Oshibuchi (NEC)

76

SANS Threat Hunting & IR Summit 2018

References

"A Framework for Cyber Threat Hunting"

Security-Monitoring/dp/1491949406

https://sqrrl.com/media/Framework-for-Threat-Hunting-Whitepaper.pdf "Hunting Update, Joe Ten Eyck"

"threat hunter (cybersecurity threat analyst)" https://www.first.org/resources/papers/conf2017/Building-a-

https://searchcio.techtarget.com/definition/threat-hunter-cybersecurity- Threat-Hunting-Framework-for-the-Enterprise.pdf

threat-analyst

"Generating Hypotheses for Successful Threat

"THE THREAT HUNTING REFERENCE MODEL Hunting"

PART 1: MEASURING HUNTING MATURITY" https://www.sans.org/reading-room/whitepapers/threats/

https://sqrrl.com/the-threat-hunting-reference-model-part-1-measuring- generating-hypotheses-successful-threat-hunting-37172

hunting-maturity/
"Hunt Evil - Your Practical Guide to Threat Hunting"
https://sqrrl.com/media/ebook-web.pdf
"THE THREAT HUNTING REFERENCE MODEL PART 2: THE HUNTING LOOP"

"Threat Hunting in Security Operation SANS Threat Hunting Summit 2017"
https://www.youtube.com/watch?v=pDY639JsT7I
"TOYOTA KAIZEN practice in management"

https://sqrrl.com/the-threat-hunting-reference-model-part-2-the-

https://www.amazon.co.jp/o/ASIN/4046019603

hunting-loop/

"Crafting the InfoSec Playbook: Security

Monitoring and Incident Response Master

Plan"

https://www.amazon.com/Crafting-InfoSec-Playbook-

78

SANS Threat Hunting & IR Summit 2018

