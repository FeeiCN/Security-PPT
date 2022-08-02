SESSION ID: SEM-M01
Opening Remarks: Security, Privacy & Human Behavior

Lorrie Cranor
Director, CyLab Security and Privacy Institute Carnegie Mellon University @lorrietweet

#RSAC

#RSAC
The human threat
Malicious humans Clueless humans Unmotivated humans Humans constrained by human limitations

#RSAC
Privacy is complicated
5

#RSAC
Better together
Examining security/privacy and usability together is often critical for achieving either
6
Photo by Bill Brady

USENIX Security 1999

#RSAC
Almost 20 years later Johnny still can't encrypt... We still rely on users to do security and privacy tasks that they aren't good at
8

#RSAC
Creating and remembering unique and complex passwords for dozens of accounts
9

Comparing crypto key fingerprints
Dr. Alice Wonder Chief Scientist alice@rabbithole.com
47382 73349 85048 52616 05270 21587 97305 91170 91512 43880 31033 04075
Do they match?
10

#RSAC

Reading and understanding long privacy policies

#RSAC
Security and privacy are secondary tasks
12

Concerns may not be aligned
Keep the bad guys out

#RSAC
Don't lock me out!

Security Expert
13

User

#RSAC
Research on security, privacy, and human behavior User studies can help us better understand the human threat and design systems that meet user needs
14

#RSAC
Reasons to conduct user studies

Assess needs
What should we build?

Examine tradeoffs
Which features/approaches best fit particular needs?

Evaluate
Are requirements met? What should be improved?

Find root causes
What underlying problems need to be fixed?

15

#RSAC
Excuses for not doing usability studies
If people weren't so lazy or stupid or careless it would work fine I already know what people want No time, no money I find the system easy to use It's so easy my kids can use it I'm not a usability expert
16

#RSAC
How are security and privacy user studies different from other user studies? the presence of a risk/adversary
simu^lated
17

Icon created by Llisole from Noun Project

#RSAC
Need to make sure systems are usable and remain secure when...
Attackers (try to) fool users Users behave in predictable ways Users are unmotivated, careless, stressed, or busy
18

#RSAC
Usable security study challenges
Keeping it real (ecological validity) Observing infrequent events and small differences Legal, ethical, and practical issues
19

#RSAC
How can we design a (legal and ethical) study that allows us to observe users in a realistic scenario being exposed to risk?
20

Survey by Delwar Hossain from the Noun Project

#RSAC
Self report
Surveys, interviews, focus groups
­ Opinions ­ Knowledge and perceptions ­ Actions ­ what have DID or what they
WOULD DO in hypothetical situation
Relatively easy and low cost Usually relies on naturally occurring or hypothetical risk Relies on people being honest (and remembering accurately)
21

Password perceptions study

#RSAC
B. Ur, J. Bees, S. Segreti, L. Bauer, N. Christin, and L. F. Cranor. Do users' perceptions of password security match reality? CHI 2016.

iloveyou88
Iloveyou88 much more
secure

ieatkale88
ieatkale88 much more
secure

22

Password perceptions study

#RSAC
B. Ur, J. Bees, S. Segreti, L. Bauer, N. Christin, and L. F. Cranor. Do users' perceptions of password security match reality? CHI 2016.

iloveyou88

ieatkale88

Iloveyou88 much more
secure

MISCONCEPTION

ieatkale88 much more
secure

23

Password perceptions study

#RSAC
B. Ur, J. Bees, S. Segreti, L. Bauer, N. Christin, and L. F. Cranor. Do users' perceptions of password security match reality? CHI 2016.

iloveyou88

ieatkale88

Iloveyou88 much more
secure

4,000,000,000 × more secure!

ieatkale88 much more
secure

24

#RSAC
Observe real-world activity
Many data collection challenges Usually not conducive to controlled experiment Relies on naturally occurring risk Events of interest may be infrequent
25

#RSAC
Security Behavior Observatory
Network of instrumented home Windows computers ~200 active participants Natural observation + surveys and interviews Data includes hashed passwords
26

People reuse their passwords a lot
On average, participants had 26 different accounts 10 distinct passwords

#RSAC
S. Pearman, J. Thomas, P. Emami Naeini, H. Habib, L. Bauer, N. Christin, L. Cranor, S. Egelman, and A. Forget. Let's go in for a closer look: Observing passwords in their natural habitat. CCS 2017.
21% Not reused
12% Partially reused 16% Exactly reused

51% Partially and exactly reused

27

People reuse their passwords a lot
On average, participants had 26 different accounts 10 distinct passwords

#RSAC
S. Pearman, J. Thomas, P. Emami Naeini, H. Habib, L. Bauer, N. Christin, L. Cranor, S. Egelman, and A. Forget. Let's go in for a closer look: Observing passwords in their natural habitat. CCS 2017.
21% Not reused
12% Partially reused 16% Exactly reused

51% Partially and exactly reused

28

#RSAC
Lots of reuse across almost all categories of websites
29

#RSAC
Observe hypothetical security tasks
Ask participants to perform a security task in the context of a hypothetical scenario Subject them to real risk
simulated
Not ethical to harm study participants
30

#RSAC
Observe hypothetical security tasks
Ask participants to perform a security task in the context of a hypothetical scenario Subject them to real risk
simulated May use deception + debrief May use economic incentives Users may be extra alert to security issues
31

#RSAC
Alice wants to verify Bob's fingerprint
WhatsApp provides numeric fingerprints Alice can compare this with fingerprint on Bob's business card or other source
32

What type of fingerprint is best?

8174 5886 6247 7685 4281 4047 0930 1306 7201 2113 8177 9827

+--[ECDSA 256]---+

|

o o.

|

|

= o

|

|

+.. |

|

o .

|

|

S .

|

|

oE. |

|

+ o +..|

|

. o * +o|

|

o.++*o.|

+-----------------+

tin yellow blood short attention tax danger bulb wood the normal healthy up false nut bright

33

#RSAC
buri padi luya kilo yise rada deyu sipi hofe hage xata rite

Online role-play experiment

#RSAC
Joshua Tan, Lujo Bauer, Joseph Bonneau, Lorrie Faith Cranor, Jeremy Thomas, Blase Ur. Can Unicorns Help Users Compare Crypto Key Fingerprints? CHI 2017

661 participants role-played accountant tasked with updating employee SSNs in database

For each of 30 employees, required security check involving fingerprint comparison

Each participant saw 30 fingerprints of same format, including 1 attack

Tested 5 textual formats, 3 graphical formats

34

#RSAC
35

#RSAC
People aren't good at this!
Textual formats all had similar missed attack rates Graphical formats more varied in attack rates, faster to compare No fingerprints performed very well Unicorn performed the worst!
36

#RSAC
Observe non-security tasks
Ask users to perform tasks unrelated to security Trigger simulated risk events May use deception + debrief
37

Browser phishing warning study

#RSAC
S. Egelman, L. Cranor, and J. Hong. You've Been Warned: An Empirical Study of the Effectiveness of Web Browser Phishing Warnings. CHI 2008.

38

#RSAC
Required a little deception
Lab study on online shopping Purchase paper clips from Amazon Answer questions about shopping (for another study) That's when we phished them Check email to get your receipt That's when they fell for it
39

#RSAC
Please approve this delay so that we can continue processing your order. (Note that if we haven't received your approval by the end of business tomorrow, the item will be cancelled.
http://www.amazonaccounts.net/gp/signin/1 04-3310393-0927909.htm

#RSAC
Success!
Most participants got phished Significant differences between conditions Observed interesting user behavior that helped us understand root cause of failures
41

#RSAC
Confused by domain names
"The address in the browser was of amazonaccounts.net which is a genuine address"
42

#RSAC
Confused mental models
Some users repeatedly closed their browser, returned to the phishing email, and clicked on the link again
43

#RSAC
Research led to better phishing warnings
44

#RSAC
Our agenda today
Understanding humans
­ 4 talks + discussion ­ Networking break
Emerging threats
­ 2 talks + discussion ­ Lunch break
Protecting humans
­ 4 talks + discussion
45

