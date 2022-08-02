SESSION ID: CSV-F02
Hacking Your Security Culture for the Cloud

Brian Riley
Senior Director, Global Cyber Risk Management Liberty Mutual Insurance

#RSAC

#RSAC
or: How an InfoSec Curmudgeon Learned to Stop Worrying and Love the Cloud
2

$ whoami

#RSAC
Brian Riley, Senior Director
· Global Cyber Risk Management · 25 years of experience with cybersecurity
in financial services
3

#RSAC
Liberty Mutual
At Liberty, we believe progress happens when people feel secure.
4

#RSAC
Liberty by the numbers
· Founded 1912, based in Boston · Nearly 50,000 employees in
30 countries and economies worldwide · 5th largest global P&C insurer* · Ranked 75th on Fortune 100 list of largest companies*
*Based 2018 gross written premium and revenue, respectively.
5

#RSAC
An early (mistaken) understanding of the Cloud
"I'll tell you exactly what Cloud Computing is... Cloud is nothing more than the current crop of vacuous, meaningless marketing nonsense that vendors use to try to open new markets. It really means nothing but is generally applied to large-scale virtualization (which we have been doing for years), just with fewer controls and less oversight."
­ B. Riley, 9/2013
6

#RSAC
The classic InfoSec mindset

Perfect

Broken
vs.

7

#RSAC
Early steps: Drawing some wrong conclusions
The cloud is really just our 4th Data Center. So let's protect it with the same controls we use in the other three.
But we know how to do all of this. If the cloud is just another data center, why is it so hard to do what just works everywhere else?
8

#RSAC
Thinking differently
"We cannot solve our problems with the same thinking we used when we created them."
­ Albert Einstein
9

#RSAC
Implications for security: Two paradigms shift

Cloud computing shifts the economics of security in ways that affect both attackers and enterprises.

Data Centers
Servers are fixed assets that depreciate over time, creating the incentive to keep systems around for as long as possible to maximize return on investment ­ creating many traditional security problems.

Cloud environments
We pay only for what we use, creating the incentive to destroy environments as quickly as possible and rebuild them only when they are needed. This reduces risk (a threat can only be persistent in an environment that is persistent).

Everything is software ­ which presents opportunities and creates new challenges

Opportunities
· Infrastructure and applications are built consistently through automation, simplifying disaster recovery
· Security and compliance controls can be automated, offering continuous compliance
· Automated deployments reduces the need for human interaction with systems, limiting insider threats and risk of misconfiguration
· Some security controls are much easier to implement in the cloud

Challenges
· Traditional handoffs and security checks no longer occur · While automation eliminates many common risks, mistakes can
have much bigger impact · Some security controls are harder or more expensive to
implement in the cloud

10

#RSAC
But the Cloud is more complicated!

How much should a developer need to think about the way BGP is configured in our network routing?

Is an understanding of how packets route relevant to making the right choices about firewall rules?

With developers defining AWS Security Groups in CFTs, do we give enough tools to help people code the right rules?

11

#RSAC
Tools to hack your culture

#RSAC
Infrastructure as code requires security as code
13

#RSAC
14

Radar architecture
z
Account Region X

Subs c ription Project Account Region X
(encrypted)

#RSAC

15

Radar architecture
z
Account Region X

Subs c ription Project Account Region X
(encrypted)

#RSAC

16

#RSAC
Our goal: Managing the blast radius of failure
· News flash: IT professionals are human beings and may occasionally make mistakes.
· How can we limit the impact of those mistakes?
· Small, frequent releases · Modern development practices · Rethink the way we structure our
cloud resources
17

#RSAC
Offensive Security: Red, Blue, and Purple Teams

Red Team
Attackers

Purple Team
What we learn when Red works
with Blue

Blue Team
Defenders

18

#RSAC
Conclusions

#RSAC
Governance as an enabler

Agility

Control

Credit: Michael St. Onge, AWS
20

#RSAC
The future of SecOps: Behind the 8 ball...
SecOps is behind the 8 ball, by definition. The deck is stacked against us...

We need to think differently...
Embrace automation instead of fearing it.

We are entering a new world...
Security is largely built into the technology stacks which run our infrastructure.
Mike Rothman, Securosis 11/10/17
21

We must change how we do things...
Embrace processes which will most likely make you uncomfortable.

Hacking our culture
Security as a document

#RSAC
Security as code
s3-encrypted: action: enableEncryption remediate-report: true trigger-events: - name: 'CreateBucket' - name: 'DeleteBucketEncryption'

22

