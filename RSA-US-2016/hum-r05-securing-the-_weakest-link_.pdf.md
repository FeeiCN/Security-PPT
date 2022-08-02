SESSION ID: HUM-R05
Securing the "Weakest Link"
Usable Security Lessons From Star Wars
#RSAC

Adam Shostack
@adamshostack

#RSAC
My real slide is too big to distribute
In the room, there was video from "Star Wars" (fairly used!) It's the boardroom briefing scene The general says "This baRle staSon is now the ulSmate power in the universe," Vader responds "Don't be so proud of this technological terror you've created"

Lord Vader Was Right

USING THE FORCE
· Computer security is about people · People are a moSvated and struggling link · We ignore the human element at our own risk

AGENDA
· Some threat models · How we make it worse · How people are exploited
· How to make it better

#RSAC
A Threat Model

#RSAC
A Bad Threat Model
Given a choice between dancing pigs and security the user will pick
" " dancing pigs every time

#RSAC
An Even Worse Threat Model OMG NOT
OUR FAULT!
Declare the problem unsolvable!

Learned Helplessness!

Remote Desktops?
8

Web proxies?

#RSAC
People Get Tricked: A Threat Model
Human acSon(s) to change the computer's configuraSon
Normal behaviors No aRacker says "now add a key to the registry" because FAIL
The computer has a chance to intervene/miSgate
Warnings Sandboxes Architecture
9

#RSAC
How People Are Tricked
CredenSal exposure (including phishing) IntenSonally running or installing so]ware
Codecs, doppelgangers and "Microso] Support" calls Pirated so]ware with extras
Accidental so]ware execuSon
File extension hiding, icon tricks (Salaries.xlsx.exe) Documents with exploit payload
Web fakery -- clickjacking, XSRF, etc

#RSAC
How People Are Tricked: Scamicry
Scamicry: When real messages imitate scams People have a security goal like "examine links carefully"
Store sends email with <a href="http://cts.vrecc.com/ls? 39389ee28a/64f53b0c9c/http%3A%2F...>Safe Online Banking</a> Bank calls and asks for your password
"But it's the bank ... I'm not smart enough to understand this"
11

#RSAC
How People Are Overwhelmed
Advice that can't be followed in reasonable Sme
"Read TOS, privacy policies to understand how we'll use your data"
Advice that requires too much skill
Solve this captcha!
Complexity and depth
Why do you need a long password? Let me explain password cracking...
hRp://www.seosmarty.com/impossible-captcha-it-doesnt-really-maRer-if-you-are-human-or-not/
12

#RSAC
You Can Make It BeLer

#RSAC
Firefox Malware Warning
14

#RSAC
Chrome Malware Warning
15

#RSAC
Real World Click-through Rates

7.2% (Firefox Malware)

23.2% (Chrome Malware)

9.1% (Firefox Phishing) 18.0% (Chrome)

Alice in Warningland: A Large-Scale Field Study of Browser Security Warning Effec<veness

#RSAC
Threat Modeling & People
A model of the system being developed (whiteboard, DFD) A model of the threats (STRIDE, aRack tree) [New!] A model of the person using the so]ware
17

#RSAC
Threat Modeling and People
18

#RSAC
Threat Modeling and People (2/2)
A model of the person using the so]ware
Behaviorist and cogniSve science Kahneman's System 1/System 2 Reason's "Strong Habit Intrusion"
Models for usable security
Ellison: Ceremonies Cranor: Human in the loop Sasse: Compliance Budget
19

#RSAC
Threat Mi]ga]ons/PaLerns That Work (So^ware developers)
20

#RSAC
Win by Building beLer defenses
2 Key paRerns in Internet Explorer 8+ Not warning on every download
People become habituated, click through Not making the dangerous choice the default

#RSAC
PaLerns: Gold Bar
· Appears in Office, IE, Firefox, elsewhere

#RSAC
Engineer NEAT Warnings
NEAT is an easy way to remember key security UX guidance NEAT
Necessary, Explained, AcSonable, Tested
Philosophy:
Don't involve the person if you don't have to If you involve the person, enable them to make the right decision Does the person have unique knowledge the system doesn't?

#RSAC
NEAT Warnings: Necessary
Avoid interrupSng the user with security decisions, if possible When possible, automaScally take the safest opSon and, opSonally, noSfy the user that other opSons are available If people have no course of acSon & no unique knowledge, you should re-architect product

#RSAC
NEAT Warnings: Explained
Provide the user with all the informaSon necessary to make the right decision
6 key elements: SPRUCE Source: Where is this decision coming from? Process: What steps should they take to make the decision? Risk: What is the security risk of geong the decision wrong? Unique Knowledge User Has: What does the user know that we don't that helps make the right decision? Choices: What are their opSons? What do we recommend they do? What will happen when they choose each opSon? Evidence: What informaSon should they factor in?

#RSAC
Good (long) example of explana]on
Source Risk Choices
Process

#RSAC
Explana]on: Opinionated Design
Clear instrucSon ARracSve preferred choice UnaRracSve alternate choice From the Google Chrome team -- "Improving SSL Warnings Comprehension and Adherence" by Adrienne Porter Felt & many colleagues
27

#RSAC
NEAT Warnings: Ac]onable
Enumerate scenarios at design Sme Steps the person must take
Figure them out Write them down
Wording can be a tricky balance
Too wordy, people won't read or understand Not enough informaSon == not acSonable

#RSAC
NEAT Warnings: Tested
Validate your Security UI with real people Benign and malicious scenarios
Whole arsenal of UI tesSng techniques Range from empaneling 1000s of people, to tesSng dozens in usability lab, to asking coworkers down the hall
Apply what you can User tests are always surprising

#RSAC
NEAT Warnings: Wallet Cards
hRps://blogs.microso].com/cybertrust/2012/10/09/necessary-explained-acSonable-and-tested-neat-cards/

#RSAC
Defensive PaLerns That Work (Opera]ons)

#RSAC
Spend Your "Budget" Wisely
People want to get their job done
They expend effort to do it safely -- to a point
What do you want the most?
Are password changes worth the Sme? Do you patch during the business day?
Make it easy and fast to do what you want the most
Great opportunity to learn from markeSng & UI experts
32

#RSAC
Example: Advice You Give
Email is a threat vector How well do you help employees manage it?
Prevent: Is it easy to see who an email is legiSmately from? How o]en do your vendors email employees with demands?
Detect: How easy is it to report suspicious emails? Respond: How quickly do you respond to those reports?
To the originator? To the recipient? Are you breaking your own advice with scamicry?
33

#RSAC
Usability maLers talking to execu]ves
ExecuSves are skilled at managing risks We show up with the wrong messages
Compliance requirements "Phone books" of risks
"Cyber Defense Matrix" is a good step
Sounil Yu's talk "Understanding the Security Vendor Landscape Using the Cyber Defense Matrix" (PDIL-W02F)
34

#RSAC
Apply Slide
Don't give in to the dark side Avoid confusing people with scamicry or impracScal advice Use defensive so]ware paRerns
Gold Bar Default Safe NEAT
Build operaSons for real people Share your work
35

#RSAC
Ques]ons? Thank you!

