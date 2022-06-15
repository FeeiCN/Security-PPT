SESSION ID: STR-W05

Estimating Development Security Maturity in About an Hour

Matt Clapham
Principal, Product Security GE Healthcare @ProdSec

#RSAC

#RSAC
How We Got to Now
Needed something given volume 4 things recommended Added one more Assessment leverages experience Field-tested with suppliers and devs
2

#RSAC
Not for n00bs
Security operations Development experience Testing (penetration, vulnerabilities, security, or in general) Cryptography background Incident response Certifications Etc.
3

#RSAC
Three Example Stories
The 11th-hour Security Review The Acquisition The Internal Development Team
4

#RSAC
The 11th Hour Security Review
"This security review won't take long, will it?"
5

#RSAC
The Acquisition
"So we're going to buying company X for its ___ product."
6

#RSAC
The Internal Development Team
"Those folks making that software over there..."
7

#RSAC
Agenda
Overview Five key behaviors Scoring and report Pros, cons, and other models Extending the method Summary Application
8

#RSAC
Method Overview
Pre-meeting research - 5 to 15 minutes Meet with development team - 30 to 60 minutes Score and report back - 15 minutes Goal: 90+% confidence on assessment Total time: 50 to 90 minutes or "About an hour on average."
9

#RSAC
Pre-meeting Research
Process time required: 5 to 15 minutes Looking for...
Public details about vulnerabilities Company responses and published guidance History of supporting and fixing the software
Search on software name or company name and...
NVD vulnerabilities patches
10

#RSAC
Meet with the Development Team
Process time required: 30 to 60 minutes Resources needed: developers, testers, and program managers Goals
Establish rapport Status on each of the 5 behaviors Additional information on how software is made securely
11

#RSAC
Development Meeting Sample Agenda
Introductions and establish rapport ­ 5 minutes Identify necessary resources ­ 1 minute Technology overview ­ 3 minutes Probing questions on each focus area ­ 20+ minutes Wrap-up ­ 2 minutes
12

#RSAC
Development Meeting Warning Signs
"I'm just the IT guy." or "I'm the CISO." "We can't tell you because that would be a security risk." "Our software has no flaws." "We wrote our own encryption method..." "Bob does that for us and he's on vacation."
13

#RSAC
Five Key Behaviors
Developer training in secure development Design threat modeling for security refinement Static code analysis Dynamic analysis and testing Vulnerability and incident response process
14

#RSAC
What to Look For in Each
90% confident on a yes/no answer Anecdotes regarding technology, design pattern, etc. Artifacts (extra points if publicly available) Positives, i.e. increased quality or above and beyond Negatives, i.e. poor execution or follow-through Nearest exit, i.e. a statement that indicates yes/no quickly
15

#RSAC
Behavior 1: Secure Development Training
Do you train developers in writing secure code?
16

#RSAC
Training: Openers
How do you teach a new developer to make a secure product? How would your developer know which security tech to use? Describe the security training developers receive. How do you keep developers up to date on security risks?
17

#RSAC
Training: Positives and Negatives
Positives
Regular security conference attendance Internal or External professional training
Negatives
Focus on general secure computer usage awareness Single annual conference attendance
18

#RSAC
Training: Warning Signs and Exits
"Every developer has a chat with our Sr. architect." "Our compliance team requires..." "We don't need to worry about that because..." "Our cloud provider takes care of defending us." "We sent Bob to a conference last year and he gave us slides."
19

#RSAC
Behavior 2: Threat Modeling
How do you refine the design to remove threats?
20

#RSAC
Threat Modeling: Openers
Describe your group's threat modeling process. What tools do you use to model threats to the application? How do you refine the security of the design? How do you know when you're done threat modeling?
21

#RSAC
Threat Modeling: Positives and Negatives
Positives
Formal process Uses tool(s) Always up to date
Negatives
Ad hoc Dependent on one person
22

#RSAC
Threat Modeling: Warning Signs and Exits
"A couple of us get together and review the design." "Bob does that for us and he's on vacation." "We had a penetration test last year and..." "We use SSL."
23

#RSAC
Behavior 3: Static Code Analysis
How do you review your code for security flaws?
24

#RSAC
Static Analysis: Openers
What code analysis tools do you use? How do you check your code for security flaws? How would you know if there's a buffer overflow in your code? Describe your code review process. How do you know your code is secure?
25

#RSAC
Static: Positives & Negatives
Positives
Build integrated Developer client Clean check-in requirement
Negatives
Manual or ad hoc execution No fixing of identified problems No security tests in testing suite
26

#RSAC
Static: Warning Signs and Exits
"We review every line of code manually." "Bob reviews all our code himself." "We use lint." "We compile with all warnings on."
27

#RSAC
Behavior 4: Dynamic Analysis
How do you test your software for security flaws?
28

#RSAC
Dynamic Analysis: Openers
How do you know if your web application has a cross-site scripting vulnerability or not? How do you find vulnerabilities that have slipped through the cracks? Tell me about how you test the security of your service. Do you use any tools to automatically test the security of your application?
29

#RSAC
Dynamic: Positives and Negatives
Positives
Regularly scans production Coordinated with Static analysis Quality gating function
Negatives
Only uses a configuration scanner Only focuses on OWASP top 10
30

#RSAC
Dynamic: Warning Signs and Exits
"Once a year we hire a security firm to penetration test." "Bob scans our systems for missing patches." "We use a patch scanner to test for vulnerabilities." "We tried using a tool but it broke our software."
31

#RSAC
Behavior 5: Vulnerability and Incident Response (V&IR)
Who gets the call at 3AM if there's a vulnerability to fix?
32

#RSAC
V&IR: Openers
How would a researcher inform you of a problem and confirm that you've fixed a vulnerability? How can the operations team tell if a vulnerability is in the code you wrote or not? Describe your incident response process.
33

#RSAC
V&IR: Positives and Negatives
Positives
Public "trust center" for customer communications and bulletins Security community engagement like bug bounties Planned (and practiced) process for handling vulnerabilities
Negatives
Informal or ad-hoc Thinking its only about middleware or OS patches
34

#RSAC
V&IR: Warning Signs and Exits
"Our operations are experienced in dealing with patches." "We don't scan in our production environment." "No one has reported any vulnerabilities to Bob." "We're too small to be attacked." "We haven't been hacked yet."
35

#RSAC
Scoring Method
Review notes and evidence Starts at 0 1 point for every confirmed behavior Average out modifiers for Positives and Negatives Aggregate score is number with + / Range of 0- to 5+
36

#RSAC
Simple Scoring Examples

Example 1

Aspect Search results Training Threat modeling Static analysis Dynamic analysis Vulnerabilities & incident response

Notes Nothing Yes No, No, + Yes, + + No, -

Example 2

Aspect Search results Training Threat modeling Static analysis Dynamic analysis Vulnerabilities & Incident Response

Notes Security portal Yes, + No, Yes, + + Yes, + - Yes, -

37

#RSAC
Scoring Example 1: 11th Hour Review

Aspect Search results Training Threat modeling Static analysis Dynamic analysis Vulnerabilities & incident response

Score
No No Yes No No

Notes Minimal public presence, no detail of security at all Alice gave security presentation and relayed news items Ad hoc design review not focused on security Built-in to IDE, compiler warnings as errors Alice did some ad hoc security testing using free tools Customer reported problems goto account manager first

38

#RSAC
Scoring Example 2: The Acquisition

Aspect Search results Training Threat modeling Static analysis Dynamic analysis Vulnerabilities & incident response

Score
Yes Yes No Yes Yes

Notes Security info center N00bs goto professional class; industry hires optionally No tool; security architecture review team Custom rules for style only, lacking a tool for Ruby Promotion requirement, bug bounty program Incident response for patches not home-grown code, escalation process to development team in place

39

#RSAC
Scoring Example 3: Internal Developers

Aspect Search results Training Threat modeling Static analysis Dynamic analysis Vulnerabilities & incident response

Score
No Yes Yes No Yes

Notes Team has design docs for security features available Optional for testers Formal process, not all problems addressed Rules don't specifically target security Tried once and it broke things Single point of contact is Bob, just Bob

40

#RSAC
Report Back
Brief recap of 5 behaviors Refer to evidence Score with Positives or Negatives Explain the score and answer questions Optional feedback to the development teams
41

#RSAC
Tips & Tricks
Be respectful and flexible in questioning Leverage experience to spot misdirection Avoid black holes in discussion Repeat back key responses Keep good notes, especially scoring justifications Seed memes of good behaviors
42

#RSAC
Is and Isn't

What it is...
Speedy Rough Smoke detector Creator of more action items Anecdote for a recommendation

...and isn't
Full maturity model Secure development process Standards based Compliance audit Complex

43

#RSAC
Building Security In Maturity Model
a.k.a. BSIMM Based on actual usage (6 doz. Companies) Biases to assessed population Many behaviors considered across four domains Maturity levels for each item Takes about 2 to 4 weeks for a full evaluation
44

#RSAC
Open Software Assurance Maturity Model
a.k.a. OpenSAMM Creative-Commons Licensed Simpler than BSIMM Handy score cards and templates Self-achievable Takes 2 days to 1 week
45

#RSAC
For Just a few Hours More
Suggest trainings and resources Provide formal list of recommendations Review vulnerability history for trends Review the vulnerability history of the software's dependencies Kickoff a maturity improvement program Referral to formal maturity assessment
46

#RSAC
Summary
How the method came about Overview Five key behaviors Scoring and reporting Pros, cons, and other models Adding a few extras
47

#RSAC
Apply What You Have Learned Today
3 days: Use it on a last-minute security review 3 weeks: Start using it to triage application security reviews 3 months: Formalize estimation as a process to gate further security analysis
48

