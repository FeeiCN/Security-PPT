CONTROLLED CHAOS
The Inevitable Marriage of DevOps & Security

Kelly Shortridge (@swagitda_) Dr. Nicole Forsgren (@nicolefv)

Black Hat USA 2019

Hi, I'm Kelly
2

Hi, I'm Nicole
3

"Chaos isn't a pit. Chaos is a ladder."
 Petyr Baelish, Game of Thrones
4

Software is eating the world. DevOps drives its devouring.
5

Infosec has a choice: marry DevOps or be rendered impotent & irrelevant
6

Infosec isn't invincible. Denial & "DevSecOps" won't save your future.
7

How should infosec control chaos & make a marriage to DevOps last?
8

1. DevOps Dominion 2. The Metamorphosis 3. Time to D.I.E. 4. A Phoenix Rises 5. Marriage Vows
9

DevOps Dominion

DevOps is not automation or "agile"
11

DevOps is a mindset that unifies responsibility and accountability.
12

DevOps has "crossed the chasm" ­ the business benefits are too striking
13

DevOps integrates once-disparate roles, encouraging "shifting left"
14

Infosec can join DevOps or watch as DevOps carves its own secure path
15

Chaos & resilience is infosec's future
16

Therefore, infosec & DevOps priorities actually align...
17

What are DevOps's priorities?

Optimization of software delivery performance so tech delivers value
19

Stability & speed don't conflict ­ resilience & innovation are bffs
20

CI/CD: implement changes in prod rapidly, sustainably, & safely
21

What metrics delineate "elite" DevOps performers from the rest?
22

Lead time for changes: How long does it take for committed code to successfully run in production?
23

Release frequency: How often is code deployed to production or released to end users?
24

Time to Recovery (TTR): How long does it take to restore service?
25

Change failure rate: What percentage of changes to production degrade service & require remediation?
26

Lead time for changes
Release frequency
Time to recovery
Change failure rate

Elite
< One day On demand
(>1 daily) < 1 hour
0% ­ 15%

High

Medium

Low

1 day - 1 week

1 week ­ 1 month

1 month ­ 6 months

1 per day ­ 1 per month

1 per week ­ 1 per month

1 per month ­ 1 per 6 months

< 1 day

< 1 day

1 week ­ 1 month

0% ­ 15%

0% ­ 15%

46% ­ 60%

27

The evidence: no tradeoff between better infosec & DevOps leetness
28

Elites conduct security reviews & implement changes in mere days
29

"DevOps doesn't care about security" is a lazy straw man. Stop it.
30

Security drives stronger DevOps results. Now infosec must evolve.
31

The Metamorphosis

Partitioning of responsibility & accountability engenders conflict
33

The real "DevSecOps": DevOps will be held accountable for security fixes
34

What goals should infosec pursue in this evolution?
35

And... why should infosec goals diverge from DevOps goals?
36

Infosec should support innovation in the face of change ­ not add friction
37

Infosec has arguably failed, so "this is how we've always done it" is invalid
38

Cloud & microservices created the "Infosec Copernican Revolution"
39

But the data doesn't lie: cloud & PaaS contribute to elite performance
40

The Security of Chaos

"Things will fail" naturally extends into "things will be pwned"
42

Security failure is when security controls don't operate as intended
43

What are the principles of chaotic security engineering?
44

1. Expect that security controls will fail & prepare accordingly
45

2. Don't try to avoid incidents ­ hone your ability to respond to them
46

What are the benefits of the chaos / resilience approach?
47

Benefits: lowers remediation costs & stress levels during real incidents
48

Benefits: minimizes end-user disruption & improves confidence
49

Benefits: creates feedback loops to foster understanding of systemic risk
50

The ability to automate "toil" away should also appeal to infosec
51

Toil: manual, repetitive, tactical work that doesn't provide enduring value
52

Manual patching, provisioning 2FA / ACLs, firewall rule management, etc.
53

What other ways can infosec become more strategic?
54

Time to D.I.E.

C.I.A. triad: commonly used as a model to balance infosec priorities
56

Confidentiality: withhold info from people unauthorized to view it
57

Integrity: data is a trustworthy representation of the original info
58

Availability: organization's services are available to end users
59

But these are security values, not qualities that create security
60

We need a model promoting qualities that make systems more secure
61

Instead, use the D.I.E. model: Distributed, Immutable, Ephemeral
62

Distributed: multiple systems supporting the same overarching goal
63

Distributed infrastructure reduces risk of DoS attacks by design
64

Immutable: infrastructure that doesn't change after it's deployed
65

Servers are now disposable "cattle" rather than cherished "pets"
66

Immutable infra is more secure by design ­ ban shell access entirely
67

Lack of control is scary, but unlimited lives are better than nightmare mode
68

Ephemeral: infrastructure with a very short lifespan (dies after a task)
69

Ephemerality creates uncertainty for attackers (persistence = nightmare)
70

Installing a rootkit on a resource that dies in minutes is a waste of effort
71

Optimizing for D.I.E. reduces risk by design & supports resilience
72

A Phoenix Rises

What metrics support resilient security engineering?
74

TTR is equally as important for infosec as it is for DevOps
75

Time Between Failure (TBF) will lead your infosec program astray
76

Extended downtime makes users sad, not more frequent but trivial blips
77

Prioritizing failure inhibits innovation
78

Instead, harness failure as a tool to help you prepare for the inevitable
79

TTR > TTD ­ who cares if you detect quickly if you don't fix it?
80

Game days: like planned firedrills
81

Prioritize game days based on potential business impacts
82

Decision trees: start at target asset, work back to easiest attacker paths
85

Determine the attacker's least-cost path (hint: it doesn't involve 0day)
86

Architecting chaos

Begin with "dumb" testing before moving to "fancy" testing
88

Controlling Chaos: Availability
89

Turning security events into availability events appeals to DevOps
90

The existing repertoire of chaos eng tools primarily covers availability
91

Chaos Monkey, Azure Fault Analysis Service, Chaos-Lambda...
92

Kube-monkey, PowerfulSeal, Podreaper, Pumba, Blockade...
93

Infosec teams can use these tools but make attackers the source of failure
94

Controlling Chaos: Confidentiality
95

Microservices use multiple layers of auth that preserve confidentiality
96

A service mesh is like an on-demand VPN at the application level
97

Attackers are forced to escalate privileges to access the iptables layer
98

Test: inject failure into your service mesh to test authentication controls
99

Controlling Chaos: Integrity
100

Test: swap out certs in your ZTNs ­ all transactions should fail
101

Test: modify encrypted data & see if your FIM alerts on it
102

Test: retrograde libraries, containers, other resources in CI/CD pipelines
103

D.I.E.ing is an art, like everything else

Controlling Chaos: Distributed
105

Distributed mostly overlaps with availability in modern infra contexts
106

Multi-region services present a fun opportunity to mess with attackers
107

Shuffle IP blocks regularly to change attackers' lateral movement game
108

Controlling Chaos: Immutable
109

Immutable infra is like a phoenix ­ it disappears & comes back a lot
110

Volatile environments with continually moving parts raise the cost of attack
111

Create rules like, "If there's ever a write to disk, crash the node"
112

Attackers must stay in-memory, which hopefully makes them cry
113

Metasploit Meterpreter + webshell: Touch passwords.txt & kaboom
114

Infosec teams can build Docker images with a "bamboozle layer"
115

Mark garbage files as "unreadable" to craft enticing bait for attackers
116

A potential goal: architect immutability turtles all the way down
117

Test: inject attempts at writing to disk to ensure detection & reversion
118

Treat changes to disk by adversaries similarly to failing disks: mercy kill
119

Controlling Chaos: Ephemeral
120

Most infosec bugs are stated-related ­ get rid of state, get rid of bugs
121

Reverse uptime: longer host uptime adds greater security risk
122

Test: change API tokens & test if services still accept old tokens
123

Test: inject hashes of old pieces of data to ensure no data persistence
124

Use "arcade tokens" instead of using direct references to data
125

Leverage lessons from toll fraud ­ cloud billing becomes security signal
126

Test: exfil TBs or run a cryptominer to inform billing spike detection
127

So, how should infosec work with DevOps to implement all of this?
128

Marriage Vows

Infosec + DevOps = scalable love

How does this scalable love look?

Sit in on early design decisions & demos ­ but say "No, and..." vs. "No."

Provide input on tests so every testing suite has infosec's stamp on it

By the last "no" gate in the delivery process, nearly all issues will be fixed

Infosec should focus on outcomes that are aligned with business goals
135

TTR should become the preliminary anchor of your security metrics
136

Security- & performance-related gamedays can't be separate species
137

Cultivate buy-in together for resilience & chaos engineering
138

Visibility / observability: collecting system information is essential
139

Your DevOps colleagues are likely already collecting the data you need
140

Changing culture: change what people do, not what they think
141

Conclusion

Security cannot force itself into DevOps. It must marry it.
143

Chaos/resilience are natural homes for infosec & represent its future.
144

Infosec must now evolve to unify responsibility & accountability.
145

If not, infosec will sit at the kids' table until it is uninvited from the business.
146

Giving up control isn't a harbinger of doom. Resilience is a beacon of hope.
147

"You must have chaos within you to give birth to a dancing star."  Friedrich Nietzsche
148

@swagitda_

@nicolefv

/in/kellyshortridge

/in/nicolefv

kelly@greywire.net

nicolefv@google.com

149

