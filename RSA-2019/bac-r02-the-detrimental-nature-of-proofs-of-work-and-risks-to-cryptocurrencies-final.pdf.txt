SESSION ID_: BAC-R02
The Detrimental Nature of Proofs of Work, and Risks to Cryptocurrencies
Guy Stewart
CTO and Co-founder EGNI Inc.
#RSAC

#RSAC
Introduction
This talk is about the complex reasons behind the crash ... and what to do next ...
2

Fluctuations

#RSAC
Fluctuations - Bitcoin hash rate (hash/s per day)
BITCOIN HASH RATE GROWTH CHART
Hash rate fluctuates with market trends
4

#RSAC
Fluctuations: Ethereum
ETHEREUM NETWORK HASH RATE GROWTH CHART
Hash rate triples during period of irrational exuberance, then falls off dramatically

#RSAC
Fluctuations - PoC
NETWORK SIZE IN TB
The number and size of mining instances changes dramatically in response to external stimuli
6

#RSAC
Fluctuation Stimulus Events
NETWORK RESPONSE TO EVENTS
The size of the mining network fluctuates dramatically in response to internal and external events
7

#RSAC
Monero anti-ASIC patches

#RSAC
Vertcoin anti-ASIC patch

Cost of Power

#RSAC
Cost of power --> Centralization
80%
60%
40%
20%
0% Hawaii Germany U.K. Russia Georgia Fukui Iceland Czech US China

Cost of power

Percent of mining

PoS / PoW tradeoffs

#RSAC
ASIC advantage

CPU GPU FPGA ASIC
1E+00

1E+02

10's of millions billions 10's of billions 10's of trillions
1E+04 1E+06 1E+08 1E+10 1E+12 1E+14
HASH/S - LOGARITHMIC SCALE

13

ASIC advantage

CPU GPU FPGA ASIC
0E+00

8E+12

2E+13

2E+13

MHASH/S - LINEAR SCALE

3E+13

14

#RSAC
4E+13

Fragility

#RSAC
Fragility
Energy costs
16

#RSAC
Fragility

Energy costs

Fewer miners

17

#RSAC
Fragility

Energy costs

Fewer miners

Risk of take-over

18

#RSAC
Fragility

Energy costs

Fewer miners

Reduced incentive

Risk of take-over

19

#RSAC
Fragility

Energy costs

Fewer miners

Reduced incentive

Risk of take-over

20

#RSAC
Fragility

PoS/PoW hybrid

Energy costs

Fewer miners

Reduced incentive

Risk of take-over

21

#RSAC
Fragility

PoS/PoW hybrid

Energy costs

Fewer miners

Reduced incentive

Risk of take-over

22

Fragility

PoS/PoW hybrid

Energy costs

Fewer miners

Reduced incentive

Risk of take-over

23

#RSAC
ASIC friendly

#RSAC
Fragility

PoS/PoW hybrid

Energy costs

Fewer miners

Uneven rewards

ASIC friendly

Reduced incentive

Risk of take-over

24

#RSAC
Fragility

PoS/PoW hybrid

Energy costs

Fewer miners

Uneven rewards

ASIC friendly

Reduced incentive

Risk of take-over

25

Proof of Space (PoS)

#RSAC
Proof of Space ­ a look at ASIC resistance

ASIC friendly

Traditional structure

mom

dad

node
27

#RSAC
Proof of Space ­ a look at ASIC resistance

ASIC friendly

Discouraging ASICs

predecessor

node
28

#RSAC
Proof of Space ­ a look at ASIC resistance

ASIC friendly

Discouraging ASICs 1. Use hash(G.predecessor) to select the godparent1

predecessor

node
29

#RSAC
Proof of Space ­ a look at ASIC resistance

ASIC friendly

Discouraging ASICs

1. Use hash(G.predecessor) to select the godparent1
2. Use hash(G.godparent1) to compute godparent2

godparent1

predecessor

node
30

#RSAC
Proof of Space ­ a look at ASIC resistance

ASIC friendly

godparent1

Discouraging ASICs

1. Use hash(G.predecessor) to select the godparent1
2. Use hash(G.godparent1) to compute godparent2
3. Use hash(G.godparent2) to compute G.node

godparent2

predecessor

node
31

#RSAC
Proof of Space ­ a look at ASIC resistance

ASIC friendly

godparent1

Discouraging ASICs

1. Use hash(G.predecessor) to select the godparent1
2. Use hash(G.godparent1) to compute godparent2
3. Use hash(G.godparent2) to compute G.node

godparent2

predecessor

node
32

#RSAC
Proof of Space ­ a look at ASIC resistance

ASIC friendly

Discouraging ASICs
Security Intuition

1. Use hash(G.predecessor) to select the godparent1
2. Use hash(G.godparent1) to compute godparent2
3. Use hash(G.godparent2)

IffetthcheendofdroemtoDbReAuMsge.oddipsanroetnitn1 cache, it has to be computedtoorcompute G.node

godparent2

predecessor

node
33

#RSAC
Proof of Space ­ a look at ASIC resistance

ASIC friendly

Discouraging ASICs
Security Intuition

1. Use hash(G.predecessor) to select the godparent1
2. Use hash(G.godparent1) to compute godparent2
3. Use hash(G.godparent2)

IffetthcheendofdroemtoDbReAuMsge.oddipsanroetnitn1 cache, it has to be computedtoorcompute G.node

godparent2 Fetching from DRAM "costs" about the same for the ASIC and

a general purpose computer.

predecessor

node
34

#RSAC
Proof of Space ­ a look at ASIC resistance

ASIC friendly

Discouraging ASICs
Security Intuition

1. Use hash(G.predecessor) to select the godparent1
2. Use hash(G.godparent1) to compute godparent2
3. Use hash(G.godparent2)

IffetthcheendofdroemtoDbReAuMsge.oddipsanroetnitn1 cache, it has to be computedtoorcompute G.node

godparent2 Fetching from DRAM "costs" about the same for the ASIC and

a general purpose computer.

Computation cporesdtsecinecsrseoarse if the dependent nodes
(predecessor and godparents) are not in ocdaeche ­ avalanche effect. If the avalanche > 220 slowdown then no ASIC benefit.
35

#RSAC
Proof of Space ­ a look at ASIC resistance

Discoura1gEin+g08ASICs 1. Use hash(G.predecessor)

ASIC friendly

1E+07 1E+06

to sCelaeccht ethme igsosdparent1 2. Use hash(G.godparent1)

1E+05
Security Intuition1E+04

to compute godparent2 3. Use hash(G.godparent2)

IffetthcheendofdroemtoDbReAuMsge.oddipsanroetnitn1

cache,

it

has1Eto+0b3e
1E+02

computedtoorcompute

G.node

1E+01

godparent2

Fetching from DRAM "costs" a general purpose computer.

about

the

sam1eE+fo0r04t2h%e

AS48IC%

an5d3%

58%

64%

72%

Computation cporesdtsecinecsrseoarse if the dependent nodes
(predecessor and godparents) are not in ocdaeche ­ avalanche effect. If the avalanche > 220 slowdown then no ASIC benefit.
36

#RSAC
Proof of Space ­ avoiding PoW hybridization

PoS/PoW hybrid

Prescribed pebbling
Seed

Cheater's pebbling
Seed

Graph

37

#RSAC
Proof of Space ­ avoiding PoW hybridization

PoS/PoW hybrid

Cheater's pebbling
Seed

1. Store less than prescribed. 2. Recompute when needed.  (Turns any PoS into a PoS-PoW)

38

#RSAC
Proof of Space ­ avoiding PoW hybridization

PoS/PoW hybrid

make

recomputing

painful

39

#RSAC
Proof of Space ­ avoiding PoW hybridization

PoS/PoW hybrid
godparent1

1. Use hash(G.predecessor) to select the godparent1
2. Use hash(G.godparent1) to compute godparent2
3. Use hash(G.godparent2) to compute G.node

godparent2

predecessor

node
40

Cost of compression with 224 nodes

1E+08 1E+07 1E+06 1E+05 1E+04 1E+03 1E+02 1E+01 1E+00 Presenter's Company 42% Logo ­ replace or delete
on master slide

46%

50%

54%

57%

61%

65%

72%

#RSAC

CPU versus ASIC cost comparison

#RSAC

Apply

#RSAC
How can we apply these insights?
Understand: economic forces have security impact In this case, lower crypto values cause instability
44

#RSAC
How can we apply these insights?
Understand: economic forces have security impact Understand: cheating is rational
In this case, it excludes non-ASICs and causes hybridization
45

#RSAC
How can we apply these insights?
Understand: economic forces have security impact Understand: cheating is rational Design accordingly
In this case, design to avoid ASICs and hybridization
46

#RSAC
How can we apply these insights?
Understand: economic forces have security impact Understand: cheating is rational Design accordingly Avoid creating crypto value systems within your enterprise that rely on vulnerable cryptocurrency frameworks
47

www.egni.io guy@egni.io

#RSAC
Different godparent selection strategies
49

Different godparent selection strategies -

#RSAC

godparenthood

50

#RSAC
Different godparent selection strategies - cost
51

Graph topology; 32 node example
N29

N27

N30

N23

N31

N14

N22

N16

N25

N28

N9

N13

N7

N19

N20

N26

N24

N6

N5

N15

N10

N18

N21

N3

N4

N17

N2

N11

N1

N8

N12

N0

#RSAC

#RSAC
What about Filecoin, Sia, or other PoStor / PoR?
PoR: Proof of Replication
PoStore: Proof of Storage
These coins have their place. However they have certain drawbacks that make them less than ideal for use when pure proof of space is desired; they are subject to sybil attacks, out-sourcing attacks, and generation attacks. They compete with the existing providers in cost, speed, security and reliability. They solve a problem that has already been solved, and introduce wasteful complexity. Market forces of supply and demand threaten to drive instability. What happens when market forces motivate miners to switch to other currencies and customers lose data? Who is responsible?

