SESSION ID: BAS-M08

A New Security Paradigm for IOT (Internet Of Threats)

Hadi Nahari
Vice President, Security CTO Brocade Communications, Inc. @hadinahari

#RSAC

#RSAC
National Academy of Engineering
Grand Challenges for 21st Century
2

#RSAC
State of the Union

Security posture compared to 2015?

How about compared to 2014? Or 2013?

...

Poll! Why?

>3,000,000,000,000 threats annually
(~$110BN @$27.3/threat)

Year Incidents Breaches

2014 63,437 1,367

2015 79,790 2,122

3

#RSAC
Static Security

#RSAC
Computing: Then & Now
Computing has evolved tremendously
5

#RSAC
Security: Then & Now
Old days
Identification, authentication, access control (ACL/MAC/DAC/...), TCB, disjointed systems, security an after-thought, etc.
Today
Identification, authentication, access control (ACL/MAC/DAC/...), TCB, disjointed systems, security an after-thought, etc.
So, security is still...
6

Here's Why

Machines

ID: 2C:1F:23:C1:0A:65

ID: 02:03:08:96:2c:ae

ID: 64.233.169.240

ID: fe80::4859:e41a:d144:f95c

Machines rely on identity to interact with each other

01
7

#RSAC

Here's Why (cont'd)

Humans

ID: Vic; IT guy

ID: Eva

ID: Malin; BFF

ID: John; bank teller

#RSAC

Humans, on the other hand, rely on trust
8

#RSAC
Identity vs. Trust

static

simple

irrevocable

low resolution
Identity
immutable

binary cloneable

non contextual coarse grained

01
9

Identity vs. Trust (cont'd)

revocable mutable

multidimensional engaging

contextual dynamic

high resolution

Trust

rewarding

fine grained

complex

full spectrum multichannel

multimodal

10

#RSAC

#RSAC
TCB, ROT, COT
In machines
Not in humancso...ver
11

#RSAC
The Static Security Era
Machines & humans are becoming more similar Issues go beyond identity vs. trust Static Security is presumptuous
Need to know adversary profile ahead of time
Best case: just detecting attacks IMPORTANT: Static Security is not bad! still necessary
Just not sufficient anymore
12

#RSAC
Static Security Building Blocks
Assets, attack tree, VATA Identity, authentication, authorization Cryptography (confidentiality, integrity, authenticity, nonrepudiation) Attestation, verification, run-/load-/crash-time integrity validation and measurement ...
13

#RSAC
IOT 101

#RSAC
IOT Era
What are the Thingses anyway?
Communicating data collector things with varying compute power
What's the big deal?
Data generation Communication
IOT Security
15

#RSAC
The "Thingses"
Controllers, processors, etc. no standard comm. Mixed comm. (WiFi, BT, NFC, ZigBee, etc.) Apps & ecosystems Transition to services Massive data generation
We're not just cyborgs: we're data-oozing cyborgs
16

#RSAC
IOT Protocols
MQTT
Message Queue Telemetry Transport
MQTT-SN
MQTT for Sensory Networks
XMPP
Extensible Messaging & Presence Transport
17

#RSAC
IOT Protocols (cont'd)
DDS Data Distribution Service
AMQP Advanced Message Queuing Protocol
CoAP Constrained Application Protocol
18

#RSAC
Observations
IOT protocols are mainly message-based
The Things are (mostly) less-capable (now at least)
Offloading processing to the backend (mainly)
Thus messaging & communications infrastructure
Ergo importance of backend & data processing
Data volume, contextual analytics, etc.
Security not the main focus of Big Data & IOT (sounds familiar?)
19

#RSAC
Result: Attackers Are Winning
More asymmetry of the field
IOTs aren't really good at making good security decisions
Easier to hack than defend (due to Static Security) Securing IOT end-to-end be like shooting pool with a rope
20

#RSAC
Dynamic Security

#RSAC
Solution: Dynamic Security
Designing systems security according to runtime behavior Protocol- and data- and context-driven Distributed by nature
Processing boundaries beyond a single device
Recency and realtime: contextual freshness matters Revocation abilities: leveraging comms. & backend
22

#RSAC
Dynamic Security (cont'd)
Statistical modeling and analytics are key characteristics Data flows & contextual characteristics shaping security Behavioral modeling
Whose behavior? Who are the actors?
"Learning" matters a lot to Dynamic Security
23

#RSAC
"Learning" Security  Dynamic Security
"Anything humans can do in 0.1 sec., the right big 10-layer ANN can do too." -Jeff Dean, Google 24

#RSAC
Dynamic Security Side Effects
Adaptive (active-defense) systems Self-defending (reactive-defense) systems Self-organizing (proactive) systems By applying predictive-modeling & AI
We should predict anomalous behavior, not just detect it
25

#RSAC
Dynamic Security Building Blocks
AI AI + Big Data + Analytics AI + Big Data + Analytics + ML/DL Data  Information  Actionable Intelligence
Action is the next big thing Professor Karl Friston, University College London "Order of Magnitude Labs", etc.
26

#RSAC
Dynamic Security and Data
Dynamic Security in theory improves with scale IOT = more data
27

#RSAC
Challenges
Baselining
Curse of dimensionality
Requires cooperating systems
Among mutually-distrusting actors
Privacy
Data sharing: digital equivalent of cognitive dissonance DataHub @MIT CSAIL: very promising project
Sandy Pentland, Thomas Hardjono, et al.
28

#RSAC
Challenges (cont'd)
simple correlations statistical significance
29

#RSAC
Conclusion

#RSAC
Summary
Static Security has already reached its limits Dynamic Security is the natural next step Prerequisite technologies exist
Big challenge is composing a cooperative flow Both on business and technical fronts
Until and unless Dynamic Security is the norm, hackers win Static Security will still be required for the foreseeable future
31

#RSAC
Apply
You have entered IOT whether or not you know it Identify which security is your reference: Static or Dynamic?
Follow the data and who processes it Do you need to know the attack vector ahead of the time?
Start creating data models to reason about your system security Do not throw away Static Security measures
Augment them by Dynamic Security
32

Thank You!
Hadi Nahari hadi.nahari@gmail.com
hadinahari
http://www.wiley.com/W ileyCDA/W ileyTitle/productCd-0470624469.html

#RSAC

