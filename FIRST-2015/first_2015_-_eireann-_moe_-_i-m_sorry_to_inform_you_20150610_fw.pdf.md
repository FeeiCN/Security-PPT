I'm Sorry to Inform You...
Dr. Marie Moe @MarieGMoe
Éireann Leverett @blackswanburst

How we met...

I was a "youngish" Mphil student

It was my first time disclosing
10K vulnerable
systems

Neither of us had met...

Funny story about that...

I was a "young-
ish" incident responder

I was at a security meetup on my first week as
duty officer

...until FIRST MALTA

Trust. Why do I trust him?

How did I come trust her?
Face to Face contact Willingness to use strong cryptography in emails She provided feedback (where others didn't) Independent verification of facts Yearly communication Working futher incidents Core question:
· How do I know this info doesn't flow straight to the offensive national team?

2010-2011

I inform DHS (How do I verify a "CERT"?)

DHS informs NorCERT

NorCERT Investigates

NorCERT informs ISP

ISP informs its
customers (vulnerable
system owners)

In retrospect
I should have included vulnerabilities
· I was uncomfortable sending both IPs and vulnerabilities to one country for distribution
· So I just sent IPs to ICS-CERT · That mean Marie couldn't have much traction · Since she didn't have evidence of vulnerability · She had to redo that work
In the future I'd trust more

Informing by proxy.
I used ICS-CERT/DHS in 2011 · They shared with 52 certs
I worked with 12 certs in 2012 · Codesys Vulnerabilities (detailed later)
Basic Process · Send them an email about what you have · Attach GPG key and sign email · Offer them data · When they respond, send it to them encrypted

How do you approach companies?

· Describe who you are · Allow them to verify you
Find the Point of Contact

Explain what you have
· Don't speculate it's impact on them
· Clarify *precisely* the evidence you have

· Let them ask you questions until they're satisfied
· Encourage thoughtful, deliberate action, not quick or sudden responses
· Let them ask questions until satisfied
Let them think about the impacts

Who in the organisation should you be speaking to?

Ideal: Not Ideal:

Understands Technology
Understands Security
Has some level of responsibility for technology
Previous Trust relationship established
A CSO, CISO, or DFIR pro

A support team A CRO
An engineer A PR person
A lawyer

How do you explain vulnerabilities and exposure?

Global Scale and background

How do they come in

On the target list?

Found with exfil'ed
credentials

Tell the scope from your POV
Let them determine internal scope
Revisit them when they've had time to
investigate

List of domains

List of IPs

Assist when with attack propagation knowledge
Now take notes on remediation

Assist with Technical Knowledge
Invite them to share their
success story in the future

List of CVEs
Assist with knowledge of other victims

Vulnerable systems found
by external researcher
List of Services

Temporal information (between 7am and 10am)

One time during an incident: `assisted scope discovery'

Client thought only email had been compromised

Turned out to be
wrong, but useful

I suggested it might be box that contained email

Client then thought single windows box was
infected

Forensics on a disk suggested exfiltration of
data

Knowledge of IODINE allowed me to suggest
DNS traffic examination in
openflow

Got a handle on volume of
exfiltrated data

Suggested looking at where profile
had roamed

How do you tell them they're owned/infected?

Global scope

How do they fit in

Targeted?

Compromised?

Indicators of compromise
Leaked credentials should be sanitized
Use secure channels for sharing the more sensitive stuff
Follow-up may be required/expected

Exactly what to look for in logs and systems
Include enough context info to
get their attention

Exact timestamps and
timezones

IDPS signatures could be helpful

How do you tell them they're causing someone else harm?

Watering holes

Malvertising

DDoS Reflectors

Botnets

Spam

Sample exploit

Sample malverts

Traffic captures

IPs

Domain

Log files

Indicators of Compromise

IP ranges

The CodeSys Story

How not to do it.

In an embarrassing
or challenging
way

In public

Without support or feedback

Without follow up contact

Without actionable information

Victim blaming

On film

Without legal consideration

The shock effect 1

The Null CTRL article series
Source: http://www.dagbladet.no/2014/01/06/nyheter/nullctrl/shodan/english/english_versions/30861347/

The shock effect 2
Source: http://www.dagbladet.no/2013/10/14/nyheter/innenriks/nullctrl/datasikkerhet/29071043/

Havex/Dragonfly/Energetic Bear
Source: http://www.scmagazineuk.com/hundreds-of-norwegian-energy-companies-hit-by-cyber-attacks/article/368539/

In retrospect
· Sending out physical letters was not very useful
· The crisis management personell were not always the best contact points
· The media "got it wrong", however the effect was good nonetheless
· With the KraftCERT establishment we should do better the next time

Good Reactions

I accept the risk

Here's some more info on that attacker

Thank you, we'll pass this to the
DFIR team

Thank you

It's a honeypot

That's a larger scope than we
realised

Bad Reactions
I'll sue you
We unplugged it and reinstalled
the OS
It's all hype

You're interfering in private business
We are not liable for that

We followed the standards

A third party configured that

Conclusion Slide
Introduce yourself Give background
Give specifics Have a good bedside manner
Assist scope discovery Return later
Make them a success story

Questions

Thank you

