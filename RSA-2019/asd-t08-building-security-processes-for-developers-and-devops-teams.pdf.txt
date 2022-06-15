SESSION ID: ASD-T08
Building security processes for developers and DevOps teams.

Ainsley K. Braun
Co-founder & CEO Tinfoil Security, Inc. @tinfoilsecurity

#RSAC

Take away: Automate the easy stuff, focus on the hard stuff
2

#RSAC
What is Security for DevOps?
Security for DevOps (DevSec, SecDevOps, and others) is simply adding security into the software creation process
3

#RSAC
Why Does it Matter?
Security teams are overwhelmed and can't keep up
Security
4

#RSAC
Why Does it Matter?
Development teams are held up, wanting to produce faster
Development
5

#RSAC
Why Does it Matter?
Ops teams are working in a silo, security is left to last-minute
Ops
6

#RSAC
Why Does it Matter?
Teams aren't communicating, and sometimes even feel blocked by one another

Development

X

X

Ops

Security

7

#RSAC
Why Does it Matter?

Losing good talent CISO

Timeline slowed CIO / CTO

Security

Unable to work on big picture

Frustrated by security team
Engineering & Ops
8

#RSAC
Why Does it Matter?

Losing good talent

Timeline slowed

CISO Security

Complete development

Reports vulnerabilities

Forced to help
Unable to work on big picture

Huh?
Frustrated by security team

9

CIO / CTO repeat
Engineering & Ops

#RSAC
Formalizing Your Software Creation Process
The SDLC
­ Software / System ­ Development ­ Life ­ Cycle
10

What is the SDLC?
Operate & Maintain
Document & Test

#RSAC
Analyze requirements
Design application
Code application
11

#RSAC
SDLC ­ Analyze Phase
Who are the stakeholders and what do they want? What should the system be doing? Prototype a UI or UX Flow Does anything like this already exist?
12

#RSAC
SDLC ­ Design Phase

Are there any risks with the system? What is the UX / UI Design? What is the flow for the application? How can it be extended in the future? How should it perform?

User initiation
Sign in

Update info

Interact with application

Explore external pages
Request demo

13

#RSAC
SDLC ­ Code Phase
Writing code for functionality and writing tests
14

#RSAC
SDLC ­ Document & Test Phase
Document how it works Training others Run your tests
15

#RSAC
Testing Your Applications
Integration tests Unit tests Regression tests
16

#RSAC
Testing Your Applications
Integration tests Unit tests Regression tests Security tests ß Starting your security for DevOps
17

#RSAC
SDLC ­ Operate & Maintain Phase
Application is now running in production Fix any new bugs Discuss retrospectives
­ How did it go? ­ What could be changed for next time?
18

#RSAC
SDLC Methodologies
Waterfall Prototype Agile Iterative V Model Incremental Rapid Application Development RAD Spiral
19

#RSAC
Comparing Methodologies

Methodologies are common in one way: the testing phase
­ This is where security ideally enters the development process

Operate & Maintain

Analyze requirements

Document & Test

Design application
Code application
20

#RSAC
Where did Security for DevOps Begin?
Microsoft Secure Development Lifecycle
­ A more formal approach to the SDLC with Security in mind ­ Microsoft learned the value of thinking about security early ­ Threat Modeling: can begin earlier than the testing phase
21

#RSAC
Where to Begin
There are minimal automation requirements for your DevOps to build security in
­ You can't just have a QA team
22

Automate the easy stuff, focus on the hard stuff
23

#RSAC
Where to Begin
CI (Continuous Integration)
­ Get features merged into your mainline or master branch frequently ­ Typically also paired with CD (Continuous Deployment) ­ Allows mainline to be built and deployed at any time
o You MUST have great, automated testing for this to work!
24

#RSAC
Making CI and CD Successful
CI / CD need infrastructure
­ If you're going to deploy multiple times a day, even to staging, you need infrastructure to automatically run tests and be assured of correctness
25

#RSAC
CI / CD Platforms
A place to run your code and verify tests pass
26

#RSAC
Build an Organization That Supports SecDevOps

Define a pipeline for your process so you can track code as it moves through the system

Operate & Maintain

Analyze requirements

Document & Test

Design application
Code application
27

#RSAC
Current Organization Pitfalls
Most organizations have kept security as the final check, but that has drawbacks
­ Security mitigations can make it hard to find the root of a vulnerability ­ Without automation, manual processes are slow and never create
optimal results
28

#RSAC
Solution 1: Embedded Security
Security engineers embedded across each team in the organization
29

#RSAC
Solution 2: Training the Breaking Mindset
Recurring training and proper tooling
30

#RSAC
Our goal: Collaboration and Automation.

Retains talent CISO

Projects completed faster
CIO / CTO

Security

Builds securely

Can focus on big picture

Unblocked by security team

31

Engineering & Ops

#RSAC
Why (Some) Security Has to Be Automated
Computer's aren't as ingenious as humans ­ humans are needed for the hard stuff. Humans have limited time and energy, so automate the easy stuff to allow them to focus on the hard stuff.
32

PAUSE: What's easy? What's hard?
33

#RSAC
Easy: not needing domain knowledge
Things that are similar across products, teams, technologies. Example: SQL injection on all of the search forms on a product
34

#RSAC
Hard: needing to understand the product
Domain knowledge and business logic is needed from the people who build and use the product. Example: Second order SQL injection on an order form that requires knowledge about the shopping cart system
35

Automate the easy stuff, focus on the hard stuff
36

#RSAC
How to Have Vulnerabilities Fixed Faster and Earlier
Good automated testing as a culture
37

Again... Automate the easy stuff, focus on the hard stuff
38

#RSAC
How to Have Vulnerabilities Fixed Faster and Earlier
Good automated testing as a culture
­ Educate your developers
39

#RSAC
How to Have Vulnerabilities Fixed Faster and Earlier
Good automated testing as a culture
­ Educate your developers ­ Build a culture of security awareness
40

#RSAC
How to Have Vulnerabilities Fixed Faster and Earlier
Good automated testing as a culture
­ Educate your developers ­ Build a culture of security awareness
Build security into the development processes
41

#RSAC
How to Have Vulnerabilities Fixed Faster and Earlier
Good automated testing as a culture
­ Educate your developers ­ Build a culture of security awareness
Build security into the development processes Simplify reporting ­ provide only required details, with suggested fixes
42

#RSAC
Where Do You Draw the Line?
Let's be honest... security is like an onion. Luckily, you decide how many layers of security you want and need
­ How vulnerable of a target are you today? ­ How attractive of a target are you? ­ What's the potential loss?
o Monetary o Reputation o Trust o PII / Compliance
43

#RSAC
Let's Start Building Security Into Development
Next week you should:
­ Assess where you are _not_ automating, but could be ­ Decide on how you plan to restructure your organization with security
embedded throughout
o Integrate security into each team o Train the breaking mindset
44

#RSAC
Let's Start Building Security Into Development
In 3 months you should:
­ Automate your deployments and implement a CI/CD process ­ Re-evaluate your security tools, focused on automation and integration ­ Have a security liaison spend time with each team to evaluate gaps
45

#RSAC
Let's Start Building Security Into Development
In 6 months you should:
­ Automate and integrate your security
o Pen tests, network tests, web tests, API tests
­ Implement your organizational changes
o Embed security in each team o Train the breaking mindset
46

Automate the easy stuff, focus on the hard stuff
More questions? Find me at booth # 3216 (South Expo) ceo@tinfoilsecurity.com

