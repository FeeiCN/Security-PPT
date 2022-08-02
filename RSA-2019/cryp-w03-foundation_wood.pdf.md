SESSION ID: CRYP-W03
Error Detection in Monotone Span Programs with Application to Communication-Efficient Multiparty Computation
Tim Wood
University of Bristol/KU Leuven COSIC-imec
Co-authored with Nigel Smart
#RSAC

#RSAC
Outline
What is MPC? Goal Tools Protocol
2

#RSAC
What is Multiparty Computation?

P1

P1

F

P3

P2

P3

P2

Guaranteeing e.g. correctness, privacy, fairness, etc.

3

#RSAC
What is MPC?

P1

P1

F

P3

P2

S

P3

P2

A

Guaranteeing e.g. correctness, privacy, fairness, etc.

4

#RSAC
For example...
Research on medical data... ...without pooling patient data
5

Categories

Garbled Circuits

Secret sharing

#RSAC

etc.
Corruption models

Methods
Types of MPC

Static/Adaptive

Active/Passive

Arithmetic circuits
Computation
Boolean circuits PSI

6

#RSAC
Access structures
1234

123

124

134

234

12

13

14

23

24

34

1

2

3

4

7

#RSAC
(4,1) threshold access structure
1234

123

124

134

234

12

13

14

23

24

34

1

2

3

4

8

#RSAC
Another access structure
1234

123

124

134

234

12

13

14

23

24

34

1

2

3

4

9

#RSAC
Another access structure
1234

123

124

134

234

12

13

14

23

24

34

Adversary can only

1

2

3

4

corrupt one

unqualified set

10

Q2?

#RSAC

Union of any two unqualified sets is missing at least one party e.g. 2 3 U 4

Can think of as "generalised honest majority"

11

#RSAC
Goal
This work's focus: Computation...
of arithmetic circuits with efficient communication and active security for Q2 access structures
General goal:
­ Above, for any access structure (see SPDZ family)
12

Arithmetic Circuits
u

w +
x
y +
z

× ×

u(w+x)(y+z)
13

#RSAC
LSSS (Q2)
Passive multiplication
Check
(for active security)

Linear Secret Sharing Scheme (LSSS)
We write x if x is secret and parties hold shares

P1

P2

P3

P4

x2

x1

x1

x1

x3

x2

x3

x4

x4
x1 + x2 + x3 + x4 = x

14

#RSAC
Private Public

#RSAC
Linear Secret Sharing Scheme (LSSS): Adding Secrets

We write x if x is secret and parties hold shares

Private

Public

P1

P2

P3

P4

x2

y2

x3

y3

x4

y4

x1

y1

x2

y2

x1

y1

x3

y3

x1

y1

x4

y4

15

#RSAC
Linear Secret Sharing Scheme (LSSS): Adding Secrets

We write x if x is secret and parties hold shares:

Private

Public

P1

P2

P3

P4

x2 + y2 x3 + y3 x4 + y4

x1 + y1 x2 + y2

x1 + y1 x3 + y3

x1 + y1 x4 + y4

16

Linear Secret Sharing Scheme (LSSS): Adding Public

#RSAC

values

We write x if x is secret and parties hold shares

Private

Public

P1

P2

P3

P4

x2

x1

y

x1

y

x1

y

x3

x2

x3

x4

x4

17

Linear Secret Sharing Scheme (LSSS): Adding Public

#RSAC

values

We write x if x is secret and parties hold shares

Private

Public

P1

P2

P3

P4

x2

x1 + y

x1 + y

x1 + y

x3

x2

x3

x4

x4

18

#RSAC
KRSW17: Active security from RSS
This type of sharing is called replicated secret sharing
Every share is held by at least one honest party because the access structure is Q2
Thus for every share, local additions are always performed by at least one honest party
19

#RSAC
New result
This is not special to RSS!
For any Q2 access structure, for any LSSS realising it, the adversary cannot add errors without "invalidating" the shares...
...because all shares (not just the secret) can be reconstructed from any set of shares held by qualified parties
20

Multiplication: Beaver's Circuit Randomisation

Suppose the parties want to multiply two secrets

x

y

#RSAC
Private Public

...and suppose they already have

( a , b , ab )

where a and b are random, secret, and unknown to any party.

21

#RSAC
Multiplication: Beaver's Circuit Randomisation

Parties (locally) compute

x + a

y + b

and "open" the secrets

x + a

y + b

then locally compute

xy = x + a × y + y + b × x - x + a × y + b
i.e. linear combination produces secret-shared product.

Private Public
+ ab

22

#RSAC
Costs
"Offline" Produce lots of Beaver triples (see paper)
"Online" Addition gates: "for free" (no communication) Multiplication gates: opening two secrets Hash comparison at the end for active security
23

#RSAC
Opening
Online efficiency depends (almost) only on efficiency of "opening". Need active security too...
24

#RSAC
FLNW16 idea
For three parties, exploit there are two honest parties and shares are replicated:
Hash the shares and compare
25

#RSAC
Previous work: FLNW16
x = x12 + x13 + x23 x12 x13
P1

P3 x13 x23

P2

x12

x23

26

#RSAC
Previous work: FLNW16
x = x12 + x13 + x23
x12 x13

P1

x23

x13

P3

P2

x13 x23

x12

x12

x23

27

#RSAC
Previous work: FLNW16
x = x12 + x13 + x23 x12 x13 x23
P1

P3 x12 x13 x23

P2 x12 x13 x23
28

#RSAC
Previous work: FLNW16
x = x12 + x13 + x23 h1  H ( x12 , x13 , x23 )
P1

Hash shares and compare

P3

P2

h3  H ( x12 , x13 , x23 )

h2  H ( x12 , x13 , x23 )

29

#RSAC
Previous work: FLNW16
x = x12 + x13 + x23
If h1 = h2 = h3 then output x
P1

P3 If h1 = h2 = h3 then output x

P2 If h1 = h2 = h3 then output x
30

#RSAC
KRSW18 idea
For n parties, exploit that the structure is Q2 and shares are replicated: again,
Hash the shares and compare
31

#RSAC
Previous work: KRSW18
x= + + + + +++++
P1

P5

P2

P4

P3

32

#RSAC
Previous work: KRSW18
x= + + + + +++++
P1

P5

P2

P4

P3

33

#RSAC
Previous work: KRSW18
x= + + + + +++++
P1

P5

P2

P4

P3

34

#RSAC
Previous work: KRSW18
x= + + + + +++++
P1

P5

P2

P4

P3

35

#RSAC
Previous work: KRSW18
x= + + + + +++++
P1

P5

P2

P4

P3

36

#RSAC
Previous work: KRSW18
x= + + + + +++++
P1

P5

P2

P4

P3

37

#RSAC
Previous work: KRSW18
x= + + + + +++++
P1

P5

P2

P4

P3

38

#RSAC
Previous work: KRSW18
x= + + + + +++++
P1

P5

P2

P4

P3

39

#RSAC
Previous work: KRSW18
x= + + + + +++++
P1

P5

P2

P4

P3

40

#RSAC
Previous work: KRSW18
x= + + + + +++++
P1

P5

P2

P4

P3

41

#RSAC
Previous work: KRSW18
x= + + + + +++++
P1

P5

P2

P4

P3

42

Previous work: KRSW18

x= + + + + +++++

H (

)

P1

H (

) P5

P2 H (

Hash shares and compare

#RSAC
)

H (

)

P4

P3 H (

)

43

#RSAC

KRSW (15,7) threshold

++++

P15

P1

P2

+ + +... (6435 shares)

P14 P13

3003 field elements per

P3 P4

secret per

P12

party

P5

P11 P10

P9

P8

44

P6 P7

#RSAC
New idea
For n parties, exploit that the structure is Q2: again, Hash the shares and compare
(i.e. no need for replicated secret sharing!)
45

#RSAC
This work: any secret sharing
E.g. for (5,2) threshold, use Shamir: · Sample degree-2 poly f such that f(0) = x · Fix xi = (i, f(i)) and give xi to ith party · Use Lagrange interpolation to recover all shares (and secret)
We show you can do this because the access structure is Q2
46

#RSAC
This work: any secret sharing
x1

x5 P5

P1 x1
x1

x2 P2

P4 x4

P3
x3
47

#RSAC
This work: any secret sharing
x1
P1

x5 P5

x2 x1 P2

P4 x4

P3
48

x3 x1

#RSAC
This work: any secret sharing
x1
P1

x5 P5

x2 x1 P2
x2 x2

P4 x4

P3
49

x3 x1

#RSAC
This work: any secret sharing
x1
P1

x5 P5

x2 x1 P2

P4 x2 x4

P3
50

x3 x1 x2

#RSAC
This work: any secret sharing
x1
P1

x5 P5
x3

x2 x1 P2

P4 x2 x4

x3

P3

51

x3 x1 x2

#RSAC
This work: any secret sharing
x1
P1

x3 x5 P5

x2 x1 P2

P4 x3 x2 x4

P3
52

x3 x1 x2

#RSAC
This work: any secret sharing
x1
P1

x3 x5 P5 x4 x4

x2 x1 P2

P4 x3 x2 x4

P3
53

x3 x1 x2

#RSAC
This work: any secret sharing
x1 x4
P1

x4 x3 x5 P5

x2 x1 P2

P4 x3 x2 x4

P3
54

x3 x1 x2

#RSAC
This work: any secret sharing
x1 x4

P1

x4 x3 x5

x5

P5 x5

x2 x1 P2

P4 x3 x2 x4

P3
55

x3 x1 x2

#RSAC
This work: any secret sharing
x1 x4 x5
P1

x4 x3 x5 P5

x2 x1 x5 P2

P4 x3 x2 x4

P3
56

x3 x1 x2

#RSAC
This work: any secret sharing
x1 x2 x3 x4 x5

P1

x1 x2 x3 x4 x5 P5

Share reconstruction

x1 x2 x3 x4 x5 P2

P4 x1 x2 x3 x4 x5

P3
57

x1 x2 x3 x4 x5

#RSAC
This work: any secret sharing
h1  H ( x1 x2 x3 x4 x5 )

P1 h5  H ( x1 x2 x3 x4 x5 )

h2  H ( x1 x2 x3 x4 x5 )

P5

P2

Hash shares

and compare

h4  H ( x1 x2 x3 x4 x5 ) P4

P3
58

h3  H ( x1 x2 x3 x4 x5 )

#RSAC

This work (15,7) threshold

15 shares, 1

P15

P1

P2

per party

P14

P3

P13

7 elements

per secret

P4

per party

P12

P5

P11 P10

P9

P8

59

P6 P7

#RSAC
More generally we showed...
...this works for any Q2 access structure ...and any secret sharing scheme realising the access structure
60

#RSAC
Application/Open questions
Try it out!
https://github.com/KULeuven-COSIC/SCALE-MAMBA
Improve offline phase?
­ Producing Beaver triples can be expensive...
Merge "Online/offline" into one (cf [CGHIKLN18]) Find optimal secret sharing schemes for specific access structures?
­ Directly leads to more efficient MPC protocols
61

Thanks!
Questions?

