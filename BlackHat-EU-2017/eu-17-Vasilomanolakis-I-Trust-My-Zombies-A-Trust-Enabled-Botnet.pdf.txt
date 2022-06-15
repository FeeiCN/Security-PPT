I Trust My Zombies: A Trust-Enabled Botnet
Emmanouil Vasilomanolakis, Jan Helge Wolf, Leon Böck, Shankar Karuppayah, Max Mühlhäuser
04.12.2017 | SPIN | TK Lab | CYSEC ­ Cybersecurity [at] TU Darmstadt | 1

Introduction #1
· Botnet monitoring is turning into a cat and mouse game... · What if we start thinking like the bad guys?

I Trust My Zombies | Blackhat Europe 2017

2

Introduction #2

· Think as the attacker · Envision the botnets of the future
Exploit the limitations of defenders Mechanism for detecting the presence of sophisticated defenders
· Research Goal:
Botnet in which monitoring is difficult/infeasible

I Trust My Zombies | Blackhat Europe 2017

3

Terminology #1

Hi! I am a zombie (Bot)

I am the evil Botmaster!

P2P Botnet:
a number of bots that communicate in a P2P fashion and in which a botmaster can issue commands

I Trust My Zombies | Blackhat Europe 2017

I am the good guy!
4

Terminology #2 B
E A

D F

J C
G

I

Bot D

No. Neighbor

H

Membership Maintenance (MM) mechanism

1

E

· Ensures overlay remains connected

2

F

3

GI

· Periodically maintains a Neighborlist (NL)  Probes responsiveness frequently  Update/Replace entries as needed

*The size of an NL ranges between 50-1000 entries

 Request additional neighbors

I Trust My Zombies | Blackhat Europe 2017

5

How can P2P botnets be taken down?

Reverse engineering
Analysis Preliminaries

Crawlers
Sensors Monitoring
I Trust My Zombies | Blackhat Europe 2017

Partition
Sinkhole/Disarm Disrupt
6

Background: crawlers & sensors

Crawler

· Aggressively crawls the botnet · Attempts to create a holistic image of the
botnet asap · Can be easily detected and contended

Sensor

· Acts like a normal bot and builds up its knowledge (slowly)
· Harder to create a holistic view of the botnet · Very passive compared to crawlers · Cannot be easily detected and contended

I Trust My Zombies | Blackhat Europe 2017

7

Background: Computational Trust

Need Brainzzz Coffee!

Two classes of evidence:

interactions
recommendations
stereotypes credentials trustee analysis

experiences

Trust Computation
indicators

trust score

sound models (math, ML)

Subjective utility based decision

I Trust My Zombies | Blackhat Europe 2017

8

Background: the Sality P2P Botnet

· Early versions: 2003-2004! · Very sophisticated all-around malware · P2P since 2008 · Extremely resilient

· Communication protocol
 Membership maintenance  Command dissemination
· Basic trust management
 goodCount

Worldwide, 1st half 2016 (Source: Statista)

I Trust My Zombies | Blackhat Europe 2017

9

Background: Sality "Hello" messages

Iid IP

cmdSeq: 5152

lastOnline

Bot A
goodCount

Hello (cmdSeq=512) HelloReply (cmdSeq=515, cmdSet=<...>)

cmdSeq: 515
Bot B
cmdSeq: 510

B 1.2.3.4. 2001070-100-050 10 1030:3080:030

C 2.3.4.5 0200107-010-005 56 0102:030:003

......

...

...

Bot C
cmdSeq (command sequence): · an identifier of the latest command
(simplified: the (internal) malware version)

I Trust My Zombies | Blackhat Europe 2017

10

Meet our Botnet

· Cautious: careful to whom you talk to · Smart: learn from your past experiences

Core idea
· Defenders are bound to legal and ethical limitations
They should not forward commands Exploitation via sending special messages (to neighbors)
· Utilization of computational trust
Calculation and modeling of local knowledge

I Trust My Zombies | Blackhat Europe 2017

11

Meet our Botnet:
Bogus Command Sequence (BCS) Messages
· Extend basic botnet protocol · Introduce a novel type of message
Based on the ethical/legal limitations of sensors/crawlers BCS message: indistinguishable from common hello messages Forces zombies to reveal their true self

I Trust My Zombies | Blackhat Europe 2017

12

Meet our Botnet:
BCS Messages #1

cmdSeq: 620 Bot A

(ridiculously low cmdSeq)
Hello (cmdSeq=310)
HelloReply (cmdSeq=618, cmdSet=<...>)

cmdSeq: 618 Bot B

I Trust My Zombies | Blackhat Europe 2017

13

Meet our Botnet:
BCS Messages #2

cmdSeq: 620 Bot A

Hello (cmdSeq=310)
HelloReply (cmdSeq=310, cmdSet=NULL)

cmdSeq: 622 Sensor

I Trust My Zombies | Blackhat Europe 2017

14

Meet our Botnet:
Trust Threshold and Blacklisting

· Autonomous trust score calculation

· Trust score check after every new experience

· Trust score below pre-defined trust threshold:

 Remove peer from neighborlist

 Add to blacklist
o Prevent re-adding to neighborlist

,,blacklisting"

o Drop all incoming messages

· Irreversible decision

I Trust My Zombies | Blackhat Europe 2017

15

Meet our Botnet:
Utilized Botnet Trust Models
· Four trust models
 EbayUserRating  BetaDistribution  SubjectiveLogic  CertainTrust

I Trust My Zombies | Blackhat Europe 2017

16

Experiments: objectives of monitoring

· Enumeration of the botnet

Oops!

 Sensor popularity (indegree)

· Decrease sensor popularity

· Blacklisting precision





=

 +

Oops!

I Trust My Zombies | Blackhat Europe 2017

17

Experiments: setup
· Simulation environment
 Botnet Simulation Framework (BSF) based on OMNeT++
· 5500 benign nodes
 Churn
· 1/10/50 sensors
 Permanently online  Cooperation among sensors
· Simulation time: 7 days · 16 simulations per experiment

I Trust My Zombies | Blackhat Europe 2017

18

Experiments: Results ­ single-sensor

Maximum Popularity

<97%

I Trust My Zombies | Blackhat Europe 2017

19

Experiments: Results ­ multi-sensor (10)
Maximum Popularity

I Trust My Zombies | Blackhat Europe 2017

20

Experiments: Results ­ colluding sensors
Population

Accumulated Popularity

comparison by number of sensors (BetaDistribution(3,3))

I Trust My Zombies | Blackhat Europe 2017

21

Demo

Conclusion

· The cat and mouse game will always benefit the mouse
Infinite ways to improve botnets Cannot predict them all
· Monitoring P2P Botnets might become infeasible (soon)
We have shown how to decrease sensor effectiveness by up to 97%
· The war is still not lost: collaboration might be the key
Colluding sensors can provide an answer

I Trust My Zombies | Blackhat Europe 2017

23

Thank you!
Questions?
04.12.2017 | SPIN | TK Lab | CYSEC ­ Cybersecurity [at] TU Darmstadt | 24

