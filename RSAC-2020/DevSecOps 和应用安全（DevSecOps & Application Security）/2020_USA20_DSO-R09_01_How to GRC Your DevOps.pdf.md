SESSION ID: DSO-R09
How to GRC Your DevOps
Susan Allspaw Pomeroy
Technology Compliance Manager Fastly, Inc. @sueallspaw

#RSAC

#RSAC
A Story
2

#RSAC
A Brief History of DevOps Part 1
3

#RSAC
Where's GRC?
4

What we think we do

#RSAC
What engineers think we do

5

#RSAC
What I'm here to tell you today
DevOps and GRC collaboration makes audits smoother and engineers happier Traditional views of controls can (and should) change Calibration of how things work is the foundation of DevOps and GRC collaboration
6

#RSAC
A note on terminology
Auditor, IA, GRC, compliance Software Engineer, Ops Eng, SRE Security team
7

#RSAC
Compliance Frameworks
(they're good for you)

#RSAC
Security Frameworks Are Your Friends*
FLEXIBLE to your business Enable engineering teams Utilize basic security tenets you want to do anyway
*Not always
9

#RSAC
Security Frameworks Are Awful*
Have the capability to create business slowdowns Can be interpreted as RIGID Make paperwork
*Not always, either
10

#RSAC
What we want (auditor version)
Effective security controls Evidence of security controls Repeatable processes
11

#RSAC
What we want (engineer version)
Stable systems Ability to improve/respond to unstable systems quickly Common systems understanding Visibility into our systems
12

#RSAC
What we want (security version)
Well-tested code Visibility to unusual activity Rule-following
13

The Difference?
Things we all want: Resiliency Visibility/Response Quality

#RSAC
How we want it: Auditable/not auditable Fast/Methodical Perfect/Good enough

To Make Our Jobs Easier

14

#RSAC
15

#RSAC
Mental models of how things work
https://safetydifferently.com/the-varieties-of-human-work/
16

#RSAC
Work-as-Imagined
17

#RSAC
Mental models of how things work
Work-as-Done
18

#RSAC
19

#RSAC
"Procedures are an investment in safety--but not always. Procedures are thought to be required to achieve safe practice-- yet they are not always necessary, nor likely ever sufficient for creating safety."
--Sidney Dekker
20

#RSAC
A Brief History of DevOps Part 2
21

#RSAC
GRC evolution
SAS70>>SSAE-16>>SSAE-18 HIPAA/HITECH/HITRUST SOX FISMA/FEDRAMP
22

#RSAC
What is the risk you're trying to mitigate?
23

#RSAC
What are your goals for this process/control?
24

#RSAC

Reasonable Assurance

Timely Detection

25

#RSAC
The best security tool
26

#RSAC
27

#RSAC
Study: Separation of Duties

#RSAC
Separation of Duties
What it is: According to NIST, "Separation of duties addresses the potential for abuse of authorized privileges and helps to reduce the risk of malevolent activity without collusion."
29

#RSAC
(the problem with) Separation of Duties
30

#RSAC
(the problem with) Separation of Duties
Has always been assumed to require multiple humans as primary operators of functions To security/compliance, separation of duties is a good thing. To engineering, it's a slow-down, and a risk to system resiliency.
31

(the problem with) Separation of Duties

In an outage, I have to be able to fix the system without a whole lot of people. I have to be fast.

We have to have separate people develop and deploy. Regs say so.

If we can't move quickly, we can't beat our competition to solve that customer problem.

If we get a finding, we'll lose the trust of our customers. But if the systems are down, we lose it, too.

#RSAC

32

#RSAC
(the problem with) Separation of Duties
Malicious compliance Check box compliance
higher business risk
33

#RSAC
Separation of Duties
What's the risk you're trying to mitigate?
34

#RSAC
Separation of Duties (trust)
How can we be ok with engineers deploying their own code?
Trust that engineers use their expertise to adapt (there are controls for this!) Create a safe, transparent environment (psychological safety is imperative)
35

#RSAC
Separation of Duties
36

#RSAC
Separation of Duties (verify)
Transparency (logs, evidence, artifacts) and visibility (smart notification/review) Tools and People
­ Utilize CI/CD pipeline for deployments (and have logs!) ­ People (and tools) for code review ­ Security review on anomalies
37

#RSAC
Other Controls
Change Management Automated testing/deployment Automated configuration management Enforced peer review Break-glass solutions
38

#RSAC
Other Controls
Access Management Pre-approvals on standard access based on role Access changes following change management Single sign-on and 2FA Automated access termination
39

#RSAC
Communication

#RSAC
Communication

Compliance/IA

Eng/Ops/Internal Tools

Security
41

Eng/Development

#RSAC
(the challenges with) Communication
Information is shared... among managers Work for audits is requested without context "I don't have time to meet with (Compliance/Engineering)!"
42

#RSAC
Communication
Make friends with your compliance/IA teams
­ Invite compliance to product meetings, engineering planning meetings, Engineering all hands, etc. (Auditors: GO TO MEETINGS!)
Establish common ground
­ What do engineers know about your security controls/frameworks? ­ What do auditors know about the systems/eng processes? ­ What will make their jobs easier?
Establish workable internal checks
­ Recurring monthly/quarterly ticket generation
43

#RSAC
Communication
Have an Infrastructure product manager? Invite them to audit planning meetings.
­ (don't have an Infrastructure PM? Watch this talk and get one!)
Share your controls matrix with Engineering. Publicize it. Ask to go to product meetings. Eng: Make communication with Compliance part of your performance review/goals.
44

#RSAC
What Now?

#RSAC
Apply What You Have Learned
Next Week: Set up a tea/virtual tea meeting with your counterparts (IA/Compliance, meet up with at least one Engineering manager) Share your controls matrix with Engineering. Invite questions.
46

#RSAC
Apply What You Have Learned
Next Month: Whiteboard the deployment process with engineers who manage deployment tools. Revisit your change management, access management, SoD controls to see if they need to change.
47

#RSAC
People's ability to adapt to adverse situations are your greatest security control.
48

#RSAC
References
"Failure to adapt or adaptations that fail: contrasting models on procedures and safety" Sidney Dekker "DevOps and Product Management Together at last and kicking butt," James Heimbuck "10+ Deploys per Day" (John Allspaw and Paul Hammond) "Malicious Compliance," Sidney Dekker, Hindsight 25 "Can We Ever Imagine How Work is Done?" Erik Hollnagel, Hindsight 25
49

#RSAC
References
"The Varieties of Human Work" Steve Shorrock "Articulating the differences between safety and resilience: the decision-making process of professional sea-fishing skippers." Morel, et. al.
50

