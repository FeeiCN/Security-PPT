SESSION ID: CRYP-R03
Efficient Fully-Leakage Resilient One-More Signature Schemes
Antonio Faonio IMDEA Software Institute

1/20 #RSAC

#RSAC
2/20

#RSAC
Digital Signature - Existential Unforgeability CMA
3/20

#RSAC
Digital Signature - Existential Unforgeability CMA
3/20

#RSAC
Cryptographers seldom sleep well
Silvio Micali
4/20

#RSAC
Digital Signature - Existential Unforgeability CMA

Boyle, Segev, Wichs - EC'11 and Malkin et al - TCC'11

5/20

Let f1, f2, . . . adaptively chosen leakage functions:
Bounded Leakage Model
|fi(SK )|  < |SK |
i Where  is the leakage parameter.

#RSAC
6/20

#RSAC
Our Goal: Small Signatures AND Large Leakage Resilience
||  < |sk|
7/20

#RSAC
Our Goal: Small Signatures AND Large Leakage Resilience
||  < |sk|
A can always leak f (sk) := Signsk (m).

#RSAC
Our Goal: Small Signatures AND Large Leakage Resilience
||  < |sk|

A can always leak f (sk) := Signsk (m).

Even worse...

Let n =

 ||

, A can always leak

f (sk) := (Signsk (m1), Signsk (m1), . . . , Signsk (mn)).

#RSAC
One More Unforgeability [NielsenVZ PKC'13, FaonioNV ICALP'15]
A can forge n := /|| signature

#RSAC
One More Unforgeability [NielsenVZ PKC'13, FaonioNV ICALP'15]
A can forge n := /|| signature but not n + 1.

#RSAC
One More Unforgeability [NielsenVZ PKC'13, FaonioNV ICALP'15]
A can forge n := /|| signature but not n + 1.
Graceful degradation: If  = 0 then standard notion of EUF; If  < || then standard notion of LR-EUF; If  || then the A cannot forge more signatures than it can leak: the best it can do.

#RSAC
Weird Looking Scheme Let Sign be one-more leakage-resilient unforgeable. Define Sign (sk, M) to output ( ) where   Sign(sk, M).
9/20

Weird Looking Scheme Let Sign be one-more leakage-resilient unforgeable. Define Sign (sk, M) to output ( ) where   Sign(sk, M).
Introducing the slack parameter :

n

=

1 

·

 ||

#RSAC
9/20

Contributions

Scheme NVZ14 FNV152
SS1 SS2

Fully    


O (1) O (1/qsign )
O (1/k ) 1

Assumption DLIN DLIN SXDH KEA

#RSAC
10/20

#RSAC
Roadmap
The Marvelous Knowledge of The Exponent Assumption A Simplified Scheme Ideas behind the Proof Efficiency

#RSAC
KEA-based Pedersen Commitment
Let [h, h]1  G21×2 the commitment key 1 Let Commit(m, r ) := (m, r ) · [h, h]1
The commitment scheme is extractable

1We use the implicit notation where [x]1 := g x  G1.

12/20

#RSAC
KEA-based Pedersen Commitment
Let [h, h]1  G21×2 the commitment key 1 Let Commit(m, r ) := (m, r ) · [h, h]1
The commitment scheme is extractable and perfectly hiding!

1We use the implicit notation where [x]1 := g x  G1.

12/20

#RSAC
KEA-based Pedersen Commitment
Let [h, h]1  G21×2 the commitment key 1 Let Commit(m, r ) := (m, r ) · [h, h]1
The commitment scheme is extractable and perfectly hiding!

KE-Pedersen is linearly homomorphic!
1We use the implicit notation where [x]1 := g x  G1.

12/20

#RSAC
Perfect Hiding and Leakage from Randomness

Process 1
c = Commit(s, r ) Leak l = f (r ) Output (c, l, s)

Process 2
c = Commit(0, r ) Leak l = f (s) where:
1. Find r s.t. c = Commit(s, r ), 2. return f (r )
Output (c, l, s)

#RSAC
Perfect Hiding and Leakage from Randomness

Process 1
c = Commit(s, r ) Leak l = f (r ) Output (c, l, s)

Process 2
c = Commit(0, r ) Leak l = f (s) where:
1. Find r s.t. c = Commit(s, r ), 2. return f (r )
Output (c, l, s)

We reduce leakage on r to leakage on s

13/20

#RSAC
Perfect Indistinghuishability is the perfect tool against leakage from the
randomness!
14/20

Section 2 A Simplified Scheme

#RSAC
15/20

#RSAC
Main Ingredients
KEA-Pedersen Commitment. Perfect NIZK for knowledge of the "opening of a Pedersen".
16/20

Signature Scheme

sk=

...

Coefficients of a

polynomial

pk=

...

Commitments of the secretkey elements

Sign(m)

1

Com( )

2

Prove( , , )

Relation Com( ) Com( )
=

#RSAC
17/20

#RSAC
Section 3 Ideas behind the Proof
18/20

Queries

#RSAC
Forgeries

19/20

#RSAC
Extractability of KEA-based Pedersen kicks in!
From signature of m we extract i i mi . With n + 1 we can interpolate the polynomial.
20/20

#RSAC
Extractability of KEA-based Pedersen kicks in!
From signature of m we extract i i mi . With n + 1 we can interpolate the polynomial.
The absurd.
With P [A wins] the  is uniquely defined. Leakage = ||-k then guess with prob. 1/2k
20/20

#RSAC
Efficiency
Kiltz-Wee QA-NIZK for subspace + KEA

Efficiency
Kiltz-Wee QA-NIZK for subspace + KEA
Signature size : 8 group elements; Sign : constant number exp; Verify : constant number of pairing.

#RSAC
21/20

#RSAC
Efficient Fully-Leakage-Resilient Signatures with Graceful Degradation
Antonio Faonio
IMDEA Software Institute
Thanks!
22/20

