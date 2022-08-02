SESSION ID: ASD-F01
Threat Modeling in 2019
Adam Shostack
Shostack & Associates
#RSAC

#RSAC
About Me

Disclaimer: all products and companies mentioned for illustration. No endorsement or criticism implied.

2

#RSAC
What's Changing in Threat Modeling?
What's changing in the world?
3

#RSAC
2019 in a Nutshell
Thanks to John of Vordio.net
5

Still work well!
6

#RSAC
Agenda
What are we working on? How are we working on it?
­ The fast moving world of cyber ­ The agile world
What can go wrong? Threats evolve!
7

#RSAC
Agenda
What are we working on? How are we working on it?
­ The fast moving world of cyber ­ The agile world
What can go wrong? Threats evolve!
8

#RSAC
Everything's Changing So Fast!...?
Models help us see similarities & understand change Example: Morris worm (1988)
­ Stack smashing (~1970-now*) ­ Common passwords (epoch ­ end of days) ­ Mis-configured daemons (1988-200?)
9

#RSAC
Fast Changing World: IoT
More sensors and actuators
­ Look like cars and door-opening dogs
Run Linux like it's 1999 Cost: lightbulbs to jet engines Impact: water sensors to medical devices New attackers
10

The Ways To Threat Model Are ...

#RSAC

Evolving and Responding

Many building blocks
­ Tooling: Was MS TM Tool/OWASP Threat Dragon (IDEs) ­ New: Tutamantic (discrete), PyTM (code), IriusRisk (enterprise)* ­ Approaches: STRIDE, Kill Chain ­ Deliverables: documents, bugs, backlogs...
Building block frame helps understand change

* Disclosure: I'm on the advisory board of Continuum Security, makers of IriusRisk
11

#RSAC
Agenda
What are we working on? How are we working on it?
­ The fast moving world of cyber ­ The agile world
What can go wrong? Threats evolve!
12

#RSAC
Fast Moving World of Development
Threat modeling in agile, CI/CD Waterfall vs agile
­ Skills, tasks, frameworks are similar ­ Deliverables and scoping are very different
Benefits of fast cycles
­ Controls, quality to address threats in the backlog
13

Waterfall: "Threat Model Documents"
· Big complex scope Working On · System diagrams & essays
· Gates, dependencies
· Brainstorm Go Wrong · STRIDE
· Kill Chain
· Controls Do About It · Mitigations
· Test cases
Quality · Test plans

Agile: "Bugs and conversations"
· Scope tiny: this sprint's change · Big picture as security debt
· Same, aim at in-sprint code
· Spikes to understand · Sec-focused stories in sprint,
backlog or epic · Sec. acceptance criteria
· Test automation

#RSAC
Different Deliverables Serve Different Goals
Activity: Dialog Discussion Review Use
Words: Slack & email Spec Plan of record

Pictures

Whiteboard"Visio"
Agile

PPhhoottoosshhoopp
Waterfall

#RSAC
Dialogue Before Discussion

Dialogue
Explore ideas & consequences
­"What if?"
­"How about?"

Discussion
Commit to one idea
Production code
Fixed not fluid

Prototypes & experiments

Fluid not fixed

Borrowing from John Allspaw (Etsy, kitchensoap.com)

#RSAC
Different Goals of Threat Modeling Work
Different goals, different deliverables
­ Dialogue: whiteboard ­ Inform: fancy documents
Implicit goals generate conflict
­ If you want dialogue, don't ask team to bring a diagram ­ "Oh, you want a review and sign off, not new choices!"
Implicit goals generate work
­ Who needs a fancy document and why?
17

#RSAC
Which Model Is Better?
18

#RSAC
Starting Threat Modeling When Agile
Start agily: work the features being built
­ Develop skills ­ Demonstrate value ­ Get buy-in: security properties and assurance
Then worry about the security debt
­ "What can go wrong" analysis exposes debt ­ All up dataflows (borrow from GDPR)
19

#RSAC
Cloud and Serverless
Cloud provider takes over platform issues
­ Platform-level threats are theirs
Business level threats remain
­ Spoofing an employee of your company to your cloud admin
Threat model your build, deploy
20

#RSAC
WHAT CAN GO WRONG?
23

#RSAC
Agenda
What are we working on? How are we working on it? What can go wrong? Threats evolve!
­ STRIDE ­ Machine Learning ­ Conflict Modeling
24

#RSAC
Why Would Anyone Do That?
Dockless bikes: cable cuts and vandalism
25

#RSAC
STRIDE
Turns 20 this year! Still helpful mnemonic
­ Spoofing, Tampering, Repudiation, Info Disclosure, DoS, Elevation of Privilege
­ Wide range of system types ­ New details for various threats
STRIDE-LM 
26

#RSAC
Spoofing
Phone authentication Markets for selfies Audio/video spoofing
27

#RSAC
Spoofing: Phone Authentication
SMS or calls
­ SMS specifically deprecated by US Gov regulators
"Phone porting attacks" Scamicry: Callers demand authentication from callee
28

#RSAC
Spoofing Facial Recognition
Markets for Selfies
­ April 2016: MasterCard announces Identity Check ("Pay with a selfie!")
­ March 2018: Sixgill reports selfies in darkweb fullz
Impersonation tools
­ LED Baseball cap allows impersonation
29

#RSAC
Deepfake Example (SFW)
31

#RSAC
Deekfake
Thank you to Nick and Rae of Linkedin Learning Part of "Spoofing in Depth" course (free for now) https://www.linkedin.com/learning/threat-modeling-spoofingin-depth
32

#RSAC
Spoofing Video
"Deepfake" video democratizes, improves video fakery
­ Machine learning to imitate a victim ­ Create new video ­ Overlay new faces onto existing
Google Duplex voice interaction as a service lets you scale
­ BEC 2.0: "This is the CEO, need you to pay ..." ­ Phishing 3.0: "Hi honey, just real quick, what's the Netflix pw?"
Warning: lots of disturbing examples
33

#RSAC
Tampering

"AirBNB attacker" can tamper with each device
­ (Thanks to Roy D'Souza for the evocative term)

Tapplock vs screwdriver

Javascript Libraries
­ Statscounter and /account/withdraw/btc

34

#RSAC
Repudiation
VM Stores: where did that AMI come from?
35

#RSAC
Information Disclosure
Location
­ DOD Ban
Other sensors
https://www.bellingcat.com/resources/articles/2018/07/08/strava-polar-revealing-homes-soldiers-spies/
36

#RSAC
Info Disclose & Fast Moving World of Sensors
Phones drive sensor tech: quality and cost Sensors in everything Exceed our intuition
­ Accelerometers measure typing ­ Microphones + ultrasound disclose location
37

#RSAC
Denial Of Service
Classically absorb compute, storage or bandwidth
­ Compute transforms into crypto currency
Money Battery
38

#RSAC
Elevation of Privilege
Many isolation breaks
­ Spectre/Meltdown EoP from cloud, browser ­ It's worse than we thought: "Spectre Is Here To Stay" paper ­ Docker/Kubernetes escapes ­ Lightning cables
Disentangling device control can be impossible
­ "Depression of Privilege"
39

#RSAC
Threats Evolve: STRIDE - LM
STRIDE + Lateral Movement
­ Variant that has some momentum for operations threat models ­ Isn't lateral movement a subset of spoofing? ­ Extra ways to find threats can be helpful or annoying
Only Microsoft can fix LM via asymmetric authN
­ Windows auth vs SSH & keys
But if -LM helps you, use it
40

#RSAC
Agenda
What are we working on? How are we working on it? What can go wrong? Threats evolve!
­ STRIDE ­ Machine Learning ­ Conflict Modeling
41

#RSAC
Kill Chain as Alternative to STRIDE
Kill Chain & variants for operational threat models
­ Unifiedkillchain.com for analysis & comparison ­ MITRE ATT&CK
42

#RSAC
Adversarial Machine Learning
To violate goals of your ML To bend your ML to attacker's goals
­ Attacking code or training data
Machine learning is code
­ Code has bugs ­ More complex code has more bugs
43

#RSAC
Agenda
What are we working on? How are we working on it? What can go wrong? Threats evolve!
­ STRIDE ­ Machine Learning ­ Conflict Modeling
44

#RSAC
Red Hen on Yelp
45

#RSAC
Four Question Frame Works for Conflict

What are we working on? What can go wrong? What are we going to do?
Did we do a good job?

A system with social aspects or UGC (User Generated Content)
Conflict as well as exploit
Intuitive measures often fail, we should catalog & study defenses

47

#RSAC
What Goes Wrong: Inter-personal Conflict
Explicitly adapting threat modeling to conflict Shireen Mitchell & Jon Pincus diversity approach Amanda Levendowski's SCULPT (in progress)
­ Safety, comfort, usability, legal, privacy, and transparency ­ Focus on mitigation techniques
Used by nation states!
49

From "Transforming Tech with Diversity-friendly

#RSAC

software" by Jon Pincus & Shireen Mitchell

Harass person

Trigger them

Images

Threats

Flood them with messages

Get people to help

Botnet

Make them look bad

Spoof account

Hack account

#RSAC
What to do? Obvious Fixes Fail or Exacerbate
51

#RSAC
What to Do? Learn from Success
Nextdoor "private social network for your neighborhood" Had a problem with racial profiling in posts A/B tested 6 ways to add detail when post mentions race
Says new forms have "reduced posts containing racial profiling by 75%..."
52

#RSAC
What to do about conflict?
Fixes for conflict are less obvious Need expertise in human behavior to design Need a catalog of effective design patterns Github.com/adamshostack/conflictmodeling
53

#RSAC
Summary: What Can Go Wrong?
STRIDE instances evolve Adversarial Machine Learning is fun Conflict looms
55

#RSAC
Key Takeaways
Fundamental skills of threat modeling remain important Details of what we're working on, how we work and threats are all changing Importance of conflict modeling
56

#RSAC
Apply What You Have Learned Today
Next week:
­ Go ask the four threat modeling questions about a project in flight
Three months:
­ Be asking the four questions in each new sprint/project ­ Learning and adjusting
Over a year:
­ Start tackling legacy
57

#RSAC
Thank you!
Also thanks to the team at Continuum, John DiLeo, Jim Gumbley, Shamiq Islam, Jonathan Marcil, Michael Maass, Irene Michlin, Fraser Scott, Izar Tarandach, Steven Wierckx, and many others on the OWASP #threatmodeling slack (Join us! Owasp.slack.com)

#RSAC
Questions?
adam@shostack.org associates.shostack.org

#RSAC
60

