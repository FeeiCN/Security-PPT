SCIENCE

PA S S I O N

TECHNOLOGY

Revisiting Cryptographic Accumulators, Additional Properties and Relations to other Primitives
David Derler, Christian Hanser, and Daniel Slamanig, IAIK, Graz University of Technology
April 21, 2015

www.iaik.tugraz.at

Outline

www.iaik.tugraz.at

1. Introduction 2. A Unified Formal Model 3. Accumulators from Zero-Knowledge Sets 4. Black-Box Construction of Commitments

2

David Derler, IAIK, Graz University of Technology April 21, 2015

Outline

www.iaik.tugraz.at

1. Introduction 2. A Unified Formal Model 3. Accumulators from Zero-Knowledge Sets 4. Black-Box Construction of Commitments

3

David Derler, IAIK, Graz University of Technology April 21, 2015

Static Accumulators
Finite set

www.iaik.tugraz.at
Accumulator

4

David Derler, IAIK, Graz University of Technology April 21, 2015

Static Accumulators
Finite set

www.iaik.tugraz.at
Accumulator

Witnesses witx certifying membership of x in accX
Efficiently computable  x  X Intractable to compute  x / X

4

David Derler, IAIK, Graz University of Technology April 21, 2015

www.iaik.tugraz.at
A Simple Example - RSA Accumulator
RSA modulus N Accumulator for X = {x1, . . . , xn}
accX  gx1· ... ·xi-1·xi ·xi+1· ... ·xn mod N

5

David Derler, IAIK, Graz University of Technology April 21, 2015

www.iaik.tugraz.at
A Simple Example - RSA Accumulator
RSA modulus N Accumulator for X = {x1, . . . , xn}
accX  gx1· ... ·xi-1·xi ·xi+1· ... ·xn mod N Witness for xi :
witxi  gx1· ... ·xi-1·xi+1· ... ·xn mod N

5

David Derler, IAIK, Graz University of Technology April 21, 2015

www.iaik.tugraz.at
A Simple Example - RSA Accumulator
RSA modulus N Accumulator for X = {x1, . . . , xn}
accX  gx1· ... ·xi-1·xi ·xi+1· ... ·xn mod N Witness for xi :
witxi  gx1· ... ·xi-1·xi+1· ... ·xn mod N Verify witness:
Check whether (witxi )xi  accX mod N.

5

David Derler, IAIK, Graz University of Technology April 21, 2015

www.iaik.tugraz.at
A Simple Example - RSA Accumulator

RSA modulus N

Accumulator for X = {x1, . . . , xn} accX  gx1· ... ·xi-1·xi ·xi+1· ... ·xn mod N
Witness for xi : witxi  gx1· ... ·xi-1·xi+1· ... ·xn mod N
Verify witness:

Check whether (witxi )xi  accX mod N. Witness for y / X

Would imply breaking strong RSA . . . unless factorization of N is known.

5

David Derler, IAIK, Graz University of Technology April 21, 2015

Dynamic and Universal Features
Dynamically add/delete elements
...to/from accumulator accX Update witnesses accordingly All updates independent of |X |

www.iaik.tugraz.at

6

David Derler, IAIK, Graz University of Technology April 21, 2015

Dynamic and Universal Features

Dynamically add/delete elements
...to/from accumulator accX Update witnesses accordingly

All updates independent of |X |
Universal features
Demonstrate non-membership Non-membership witness witx
Efficiently computable  x / accX Intractable to compute  x  accX

6

David Derler, IAIK, Graz University of Technology April 21, 2015

www.iaik.tugraz.at

Motivation

www.iaik.tugraz.at

Accumulators widely used in various applications
e.g., credential revocation, malleable signatures, ... Previous models tailored to specific constructions
Different features Private/public updatability

7

David Derler, IAIK, Graz University of Technology April 21, 2015

Motivation

www.iaik.tugraz.at

Accumulators widely used in various applications
e.g., credential revocation, malleable signatures, ... Previous models tailored to specific constructions
Different features Private/public updatability
Thus, accumulators not usable as black-boxes
Limited exchangeability when used in other constructions Relations to other primitives hard to study

7

David Derler, IAIK, Graz University of Technology April 21, 2015

Contribution

www.iaik.tugraz.at

Unified formal model for Static/dynamic/universal accumulators Introduces randomized and bounded accumulators Introduces indistinguishability Includes undeniability

8

David Derler, IAIK, Graz University of Technology April 21, 2015

Contribution

www.iaik.tugraz.at

Unified formal model for Static/dynamic/universal accumulators Introduces randomized and bounded accumulators Introduces indistinguishability Includes undeniability
First constructions fulfilling new notions First indistinguishable, dynamic acc First undeniable, indistinguishable, universal acc

8

David Derler, IAIK, Graz University of Technology April 21, 2015

Contribution

www.iaik.tugraz.at

Unified formal model for Static/dynamic/universal accumulators Introduces randomized and bounded accumulators Introduces indistinguishability Includes undeniability
First constructions fulfilling new notions First indistinguishable, dynamic acc First undeniable, indistinguishable, universal acc
Black-box relations to commitments and ZK-sets

8

David Derler, IAIK, Graz University of Technology April 21, 2015

Contribution

www.iaik.tugraz.at

Unified formal model for Static/dynamic/universal accumulators Introduces randomized and bounded accumulators Introduces indistinguishability Includes undeniability
First constructions fulfilling new notions First indistinguishable, dynamic acc First undeniable, indistinguishable, universal acc
Black-box relations to commitments and ZK-sets Exhaustive classification of existing schemes (see Paper)

8

David Derler, IAIK, Graz University of Technology April 21, 2015

Outline

www.iaik.tugraz.at

1. Introduction 2. A Unified Formal Model 3. Accumulators from Zero-Knowledge Sets 4. Black-Box Construction of Commitments

9

David Derler, IAIK, Graz University of Technology April 21, 2015

Algorithms

Static Accumulators - Algorithms

Gen

Eval

WitCreate

www.iaik.tugraz.at
Verify

10

David Derler, IAIK, Graz University of Technology April 21, 2015

Algorithms

www.iaik.tugraz.at

Static Accumulators - Algorithms

Gen

Eval

WitCreate

Verify

We call accumulators

t-bounded, if an upper bound for the set size exists

randomized, if Eval is probabilistic

Evalr to make used randomness explicit

10

David Derler, IAIK, Graz University of Technology April 21, 2015

Algorithms

www.iaik.tugraz.at

Static Accumulators - Algorithms

Gen

Eval

WitCreate

Verify

We call accumulators

t-bounded, if an upper bound for the set size exists

randomized, if Eval is probabilistic

Evalr to make used randomness explicit

Dynamic Accumulators additionally provide

Add

Delete

WitUpdate

10

David Derler, IAIK, Graz University of Technology April 21, 2015

www.iaik.tugraz.at
Algorithms - Universal Accumulators
Static or dynamic accumulator, but in addition
WitCreate and Verify take additional parameter type

11

David Derler, IAIK, Graz University of Technology April 21, 2015

www.iaik.tugraz.at
Algorithms - Universal Accumulators
Static or dynamic accumulator, but in addition
WitCreate and Verify take additional parameter type Membership (type = 0) vs. non-membership mode (type = 1)

11

David Derler, IAIK, Graz University of Technology April 21, 2015

www.iaik.tugraz.at
Algorithms - Universal Accumulators
Static or dynamic accumulator, but in addition
WitCreate and Verify take additional parameter type Membership (type = 0) vs. non-membership mode (type = 1)
For dynamic accumulator schemes The same additionally applies to WitUpdate

11

David Derler, IAIK, Graz University of Technology April 21, 2015

Security
Correctness Collision freeness Undeniability Indistinguishability

12

David Derler, IAIK, Graz University of Technology April 21, 2015

www.iaik.tugraz.at

Security - Collision Freeness
Experiment Expcf (·):

www.iaik.tugraz.at

13

David Derler, IAIK, Graz University of Technology April 21, 2015

Security - Collision Freeness
Experiment Expcf (·):

www.iaik.tugraz.at

A wins if
witx is membership witness for non-member, or witx is non-membership witness for member

13

David Derler, IAIK, Graz University of Technology April 21, 2015

Security - Undeniability
Defined for universal accumulators Experiment Expud (·):

www.iaik.tugraz.at

14

David Derler, IAIK, Graz University of Technology April 21, 2015

Security - Undeniability
Defined for universal accumulators Experiment Expud (·):

www.iaik.tugraz.at

A wins if verification succeeds for both witx and witx

14

David Derler, IAIK, Graz University of Technology April 21, 2015

Undeniability  Collision Freeness
We show that
Efficient Acf can be turned into efficient Aud

www.iaik.tugraz.at

15

David Derler, IAIK, Graz University of Technology April 21, 2015

Undeniability  Collision Freeness
We show that
Efficient Acf can be turned into efficient Aud

www.iaik.tugraz.at

Other direction does not hold [BLL02]

15

David Derler, IAIK, Graz University of Technology April 21, 2015

Security - Indistinguishability I

www.iaik.tugraz.at

So far, no meaningful formalization
Existing formalization allows to prove indistinguishability for trivially distinguishable accumulators

16

David Derler, IAIK, Graz University of Technology April 21, 2015

Security - Indistinguishability I

www.iaik.tugraz.at

So far, no meaningful formalization
Existing formalization allows to prove indistinguishability for trivially distinguishable accumulators
We provide formalization
not suffering from shortcomings above

16

David Derler, IAIK, Graz University of Technology April 21, 2015

Security - Indistinguishability II
Experiment Expind (·):

www.iaik.tugraz.at

17

David Derler, IAIK, Graz University of Technology April 21, 2015

Security - Indistinguishability II
Experiment Expind (·):

www.iaik.tugraz.at

A wins if guess correct

17

David Derler, IAIK, Graz University of Technology April 21, 2015

Security - Indistinguishability III
Ad-hoc solution in literature
Insert a (secret) random value z into acc.

www.iaik.tugraz.at

18

David Derler, IAIK, Graz University of Technology April 21, 2015

Security - Indistinguishability III

www.iaik.tugraz.at

Ad-hoc solution in literature
Insert a (secret) random value z into acc.
However, weakens collision freeness
Witness for z efficiently computable by definition

18

David Derler, IAIK, Graz University of Technology April 21, 2015

Security - Indistinguishability III

www.iaik.tugraz.at

Ad-hoc solution in literature
Insert a (secret) random value z into acc.
However, weakens collision freeness
Witness for z efficiently computable by definition
Thus, we distinguish
Indistinguishability Collision freeness weakening (cfw)-indistinguishability

18

David Derler, IAIK, Graz University of Technology April 21, 2015

Security - Indistinguishability III

www.iaik.tugraz.at

Ad-hoc solution in literature
Insert a (secret) random value z into acc.
However, weakens collision freeness
Witness for z efficiently computable by definition
Thus, we distinguish
Indistinguishability Collision freeness weakening (cfw)-indistinguishability
We modify [Ngu05] to provide indistinguishability
First indistinguishable t-bounded dynamic accumulator

18

David Derler, IAIK, Graz University of Technology April 21, 2015

Outline

www.iaik.tugraz.at

1. Introduction 2. A Unified Formal Model 3. Accumulators from Zero-Knowledge Sets 4. Black-Box Construction of Commitments

19

David Derler, IAIK, Graz University of Technology April 21, 2015

Zero-Knowledge Sets
Commit to a set X
Prove predicates of the form x X x / X While not revealing anything else about X

www.iaik.tugraz.at

20

David Derler, IAIK, Graz University of Technology April 21, 2015

Zero-Knowledge Sets

www.iaik.tugraz.at

Commit to a set X
Prove predicates of the form x X x / X While not revealing anything else about X
Observation
Similar to undeniable indistinguishable accumulators

20

David Derler, IAIK, Graz University of Technology April 21, 2015

Zero-Knowledge Sets

www.iaik.tugraz.at

Commit to a set X
Prove predicates of the form x X x / X While not revealing anything else about X
Observation
Similar to undeniable indistinguishable accumulators Algorithms compatible Security notions similar

20

David Derler, IAIK, Graz University of Technology April 21, 2015

www.iaik.tugraz.at
Accumulators from Zero-Knowledge Sets
Security notions
Perfect completeness  correctness Soundness  undeniability

21

David Derler, IAIK, Graz University of Technology April 21, 2015

www.iaik.tugraz.at
Accumulators from Zero-Knowledge Sets
Security notions
Perfect completeness  correctness Soundness  undeniability Zero-knowledge
Simulation-based notion  simulator S, negl. , s.t.  PPT distinguishers: Pr [distinguish sim/real]  ()

21

David Derler, IAIK, Graz University of Technology April 21, 2015

www.iaik.tugraz.at
Accumulators from Zero-Knowledge Sets
Security notions
Perfect completeness  correctness Soundness  undeniability Zero-knowledge
Simulation-based notion  simulator S, negl. , s.t.  PPT distinguishers: Pr [distinguish sim/real]  () We show that "zero-knowledge = indistinguishability" Other direction unclear, sim-based notion seems stronger

21

David Derler, IAIK, Graz University of Technology April 21, 2015

www.iaik.tugraz.at
Accumulators from Zero-Knowledge Sets

Security notions
Perfect completeness  correctness

Soundness  undeniability

Zero-knowledge

Simulation-based notion

 simulator S, negl. , s.t.  PPT distinguishers: Pr [distinguish sim/real]  ()

We show that "zero-knowledge = indistinguishability"

Other direction unclear, sim-based notion seems stronger
First undeniable, unbounded, indistinguishable acc

Nearly ZK sets  t-bounded

21

David Derler, IAIK, Graz University of Technology April 21, 2015

Outline

www.iaik.tugraz.at

1. Introduction 2. A Unified Formal Model 3. Accumulators from Zero-Knowledge Sets 4. Black-Box Construction of Commitments

22

David Derler, IAIK, Graz University of Technology April 21, 2015

Commitments
Compute commitment C to message m Later: provide opening O demonstrating that
C is commitment to m

www.iaik.tugraz.at

23

David Derler, IAIK, Graz University of Technology April 21, 2015

Commitments
Compute commitment C to message m Later: provide opening O demonstrating that
C is commitment to m Security (informal):
Correctness: straight forward

www.iaik.tugraz.at

23

David Derler, IAIK, Graz University of Technology April 21, 2015

Commitments

www.iaik.tugraz.at

Compute commitment C to message m Later: provide opening O demonstrating that
C is commitment to m Security (informal):
Correctness: straight forward Binding: Intractable to find C, O, O such that C opens to two different messages m = m

23

David Derler, IAIK, Graz University of Technology April 21, 2015

Commitments

www.iaik.tugraz.at

Compute commitment C to message m
Later: provide opening O demonstrating that
C is commitment to m
Security (informal):
Correctness: straight forward Binding: Intractable to find C, O, O such that C opens to two different messages m = m Hiding: For C to either m0 or m1. Intractable to decide whether C opens to m0 or m1

23

David Derler, IAIK, Graz University of Technology April 21, 2015

Commitments from Accumulators I

www.iaik.tugraz.at

Use 1-bounded indistinguishable accumulators
C  acc{m} O  (m, r , witm, aux) such that
acc{m} = Evalr ((, pkacc), {m}) Verify (pkacc, acc{m}, witm, m) = true

24

David Derler, IAIK, Graz University of Technology April 21, 2015

Commitments from Accumulators I

www.iaik.tugraz.at

Use 1-bounded indistinguishable accumulators
C  acc{m} O  (m, r , witm, aux) such that
acc{m} = Evalr ((, pkacc), {m}) Verify (pkacc, acc{m}, witm, m) = true Collision-freeness  Binding

24

David Derler, IAIK, Graz University of Technology April 21, 2015

Commitments from Accumulators I

www.iaik.tugraz.at

Use 1-bounded indistinguishable accumulators
C  acc{m} O  (m, r , witm, aux) such that
acc{m} = Evalr ((, pkacc), {m}) Verify (pkacc, acc{m}, witm, m) = true Collision-freeness  Binding Indistinguishability  Hiding

24

David Derler, IAIK, Graz University of Technology April 21, 2015

Commitments from Accumulators I

www.iaik.tugraz.at

Use 1-bounded indistinguishable accumulators
C  acc{m} O  (m, r , witm, aux) such that
acc{m} = Evalr ((, pkacc), {m}) Verify (pkacc, acc{m}, witm, m) = true Collision-freeness  Binding Indistinguishability  Hiding
Observe: cfw-indistinguishability not useful

24

David Derler, IAIK, Graz University of Technology April 21, 2015

Commitments from Accumulators II

www.iaik.tugraz.at

Straight forward extension to set-commitments
Use t-bounded accumulators Opening w.r.t. entire set

25

David Derler, IAIK, Graz University of Technology April 21, 2015

Commitments from Accumulators II

www.iaik.tugraz.at

Straight forward extension to set-commitments
Use t-bounded accumulators Opening w.r.t. entire set
Trapdoor commitments
Use skacc as trapdoor

25

David Derler, IAIK, Graz University of Technology April 21, 2015

Conclusion
Unified model for accumulators
Covering all features existing to date

www.iaik.tugraz.at

26

David Derler, IAIK, Graz University of Technology April 21, 2015

Conclusion
Unified model for accumulators
Covering all features existing to date
Introduce indistinguishability notion
Provide first indistinguishable dynamic scheme

www.iaik.tugraz.at

26

David Derler, IAIK, Graz University of Technology April 21, 2015

Conclusion

www.iaik.tugraz.at

Unified model for accumulators
Covering all features existing to date
Introduce indistinguishability notion
Provide first indistinguishable dynamic scheme
Show relations to other primitives
Commitments Zero-knowledge sets
Yields first undeniable, unbounded, indistinguishable, universal accumulator
Inspiration for new constructions

26

David Derler, IAIK, Graz University of Technology April 21, 2015

Thank you.
david.derler@iaik.tugraz.at Extended version: http://eprint.iacr.org/2015/087

References I

www.iaik.tugraz.at

[BLL02] Ahto Buldas, Peeter Laud, and Helger Lipmaa. Eliminating counterevidence with applications to accountable certificate management. Journal of Computer Security, 10(3):273­296, 2002.
[Ngu05] Lan Nguyen. Accumulators from bilinear pairings and applications. In Topics in Cryptology - CT-RSA 2005, The Cryptographers' Track at the RSA Conference 2005, San Francisco, CA, USA, February 14-18, 2005, Proceedings, pages 275­292, 2005.

28

David Derler, IAIK, Graz University of Technology April 21, 2015

Non-Interactive Zero-Knowledge Proofs of Non-Membership
O. Blazy, C. Chevalier, D. Vergnaud
XLim / Université Paris II / ENS

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

1 / 22

1 Brief Overview 2 Building blocks 3 Proving that you can not 4 Applications

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

2 / 22

1 Brief Overview 2 Building blocks 3 Proving that you can not 4 Applications

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

3 / 22

Proof of Knowledge

Alice

Bob

Interactive method for one party to prove to another the knowledge of a secret S.
Classical Instantiations : Schnorr proofs, Sigma Protocols . . .

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

4 / 22

Proving that a statement is not satisfied

Alice

Bob

Interactive method for one party to prove to another the knowledge of a secret S that does not belong to a language L.

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

5 / 22

Applications
Credentials Enhanced Authenticated Key Exchange
Additional properties
Non-Interactive Zero-Knowledge Implicit

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

6 / 22

Applications
Credentials Enhanced Authenticated Key Exchange
Additional properties
Non-Interactive Zero-Knowledge Implicit

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

6 / 22

Applications
Credentials Enhanced Authenticated Key Exchange
Additional properties
Non-Interactive Zero-Knowledge Implicit

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

6 / 22

Applications
Credentials Enhanced Authenticated Key Exchange
Additional properties
Non-Interactive Zero-Knowledge Implicit

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

6 / 22

Applications
Credentials Enhanced Authenticated Key Exchange
Additional properties
Non-Interactive Zero-Knowledge Implicit

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

6 / 22

1 Brief Overview 2 Building blocks 3 Proving that you can not 4 Applications

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

7 / 22

Zero-Knowledge Proof Systems
Introduced in 1985 by Goldwasser, Micali and Rackoff. ; Reveal nothing other than the validity of assertion being proven Used in many cryptographic protocols
Anonymous credentials Anonymous signatures Online voting ...

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

8 / 22

Zero-Knowledge Proof Systems
Introduced in 1985 by Goldwasser, Micali and Rackoff. ; Reveal nothing other than the validity of assertion being proven Used in many cryptographic protocols
Anonymous credentials Anonymous signatures Online voting ...

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

8 / 22

Zero-Knowledge Proof Systems
Introduced in 1985 by Goldwasser, Micali and Rackoff. ; Reveal nothing other than the validity of assertion being proven Used in many cryptographic protocols
Anonymous credentials Anonymous signatures Online voting ...

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

8 / 22

Zero-Knowledge Interactive Proof

Alice

Bob

interactive method for one party to prove to another that a statement S is true, without revealing anything other than the veracity of S.

1 Completeness: if S is true, the honest verifier will be convinced of this fact
2 Soundness: if S is false, no cheating prover can convince the honest verifier that it is true
3 Zero-knowledge: if S is true, no cheating verifier learns anything other than this fact.

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

9 / 22

Zero-Knowledge Interactive Proof

Alice

Bob

interactive method for one party to prove to another that a statement S is true, without revealing anything other than the veracity of S.

1 Completeness: if S is true, the honest verifier will be convinced of this fact
2 Soundness: if S is false, no cheating prover can convince the honest verifier that it is true
3 Zero-knowledge: if S is true, no cheating verifier learns anything other than this fact.

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

9 / 22

Non-Interactive Zero-Knowledge Proof

Alice

Bob

non-interactive method for one party to prove to another that a statement S is true, without revealing anything other than the veracity of S.

1 Completeness: S is true ; verifier will be convinced of this fact
2 Soundness: S is false ; no cheating prover can convince the verifier that S is true
3 Zero-knowledge: S is true ; no cheating verifier learns anything other than this fact.

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

10 / 22

Certification of Public Keys: SPHF

[ACP09]

A user can ask for the certification of pk, but if he knows the associated sk only:
With a Smooth Projective Hash Function
L: pk and C = C(sk; r ) are associated to the same sk U sends his pk, and an encryption C of sk; A generates the certificate Cert for pk, and sends it, masked by Hash = Hash(hk; (pk, C )); U computes Hash = ProjHash(hp; (pk, C ), r )), and gets Cert.

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

11 / 22

Certification of Public Keys: SPHF

[ACP09]

A user can ask for the certification of pk, but if he knows the associated sk only:
With a Smooth Projective Hash Function
L: pk and C = C(sk; r ) are associated to the same sk U sends his pk, and an encryption C of sk; A generates the certificate Cert for pk, and sends it, masked by Hash = Hash(hk; (pk, C )); U computes Hash = ProjHash(hp; (pk, C ), r )), and gets Cert.
Implicit proof of knowledge of sk

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

11 / 22

Smooth Projective Hash Functions

[CS02]

Definition
Let {H} be a family of functions: X , domain of these functions L, subset (a language) of this domain
such that, for any point x in L, H(x) can be computed by using either a secret hashing key hk: H(x) = HashL(hk; x); or a public projected key hp: H (x) = ProjHashL(hp; x, w )

[CS02,GL03]

Public mapping hk  hp = ProjKGL(hk, x)

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

12 / 22

SPHF Properties
For any x  X , H(x) = HashL(hk; x) For any x  L, H(x) = ProjHashL(hp; x, w )
w witness that x  L, hp = ProjKGL(hk, x)
Smoothness
For any x  L, H(x) and hp are independent
Pseudo-Randomness
For any x  L, H(x) is pseudo-random, without a witness w The latter property requires L to be a hard-partitioned subset of X .

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

13 / 22

SPHF Properties
For any x  X , H(x) = HashL(hk; x) For any x  L, H(x) = ProjHashL(hp; x, w )
w witness that x  L, hp = ProjKGL(hk, x)
Smoothness
For any x  L, H(x) and hp are independent
Pseudo-Randomness
For any x  L, H(x) is pseudo-random, without a witness w The latter property requires L to be a hard-partitioned subset of X .

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

13 / 22

SPHF Properties
For any x  X , H(x) = HashL(hk; x) For any x  L, H(x) = ProjHashL(hp; x, w )
w witness that x  L, hp = ProjKGL(hk, x)
Smoothness
For any x  L, H(x) and hp are independent
Pseudo-Randomness
For any x  L, H(x) is pseudo-random, without a witness w The latter property requires L to be a hard-partitioned subset of X .

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

13 / 22

SPHF Properties
For any x  X , H(x) = HashL(hk; x) For any x  L, H(x) = ProjHashL(hp; x, w )
w witness that x  L, hp = ProjKGL(hk, x)
Smoothness
For any x  L, H(x) and hp are independent
Pseudo-Randomness
For any x  L, H(x) is pseudo-random, without a witness w The latter property requires L to be a hard-partitioned subset of X .

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

13 / 22

1 Brief Overview 2 Building blocks 3 Proving that you can not 4 Applications

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

14 / 22

Global Idea
: Proof that W  L : Randomizable, Indistinguishability of Proof  : Proof that  was computed honestly

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

15 / 22

Global Idea
: Proof that W  L : Randomizable, Indistinguishability of Proof  : Proof that  was computed honestly

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

15 / 22

Global Idea
: Proof that W  L : Randomizable, Indistinguishability of Proof  : Proof that  was computed honestly

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

15 / 22

Global Idea
: Proof that W  L : Randomizable, Indistinguishability of Proof  : Proof that  was computed honestly
To prove that W  L
Try to prove that W  L which will output a   will not be valid Compute  stating that  was computed honestly

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

15 / 22

Global Idea
: Proof that W  L : Randomizable, Indistinguishability of Proof  : Proof that  was computed honestly
To prove that W  L
Try to prove that W  L which will output a   will not be valid Compute  stating that  was computed honestly

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

15 / 22

Global Idea
: Proof that W  L : Randomizable, Indistinguishability of Proof  : Proof that  was computed honestly
To prove that W  L
Try to prove that W  L which will output a   will not be valid Compute  stating that  was computed honestly

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

15 / 22

From a very high level
If an adversary forges a proof, this means that both  and  are valid Either  was not computed honestly, and under the Soundness of  this should not happen Or  was computed honestly but lead to an invalid proof, and under the Completeness of  this should not happen

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

16 / 22

From a very high level
If an adversary forges a proof, this means that both  and  are valid Either  was not computed honestly, and under the Soundness of  this should not happen Or  was computed honestly but lead to an invalid proof, and under the Completeness of  this should not happen

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

16 / 22

From a very high level
If an adversary forges a proof, this means that both  and  are valid Either  was not computed honestly, and under the Soundness of  this should not happen Or  was computed honestly but lead to an invalid proof, and under the Completeness of  this should not happen

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

16 / 22

Possible Instantiations

Proof  Groth Sahai
SPHF Groth Sahai

Proof  Groth Sahai
SPHF SPHF

Interactive No Yes
Depends

Properties Zero-Knowledge
Implicit ZK, Implicit

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

17 / 22

1 Brief Overview 2 Building blocks 3 Proving that you can not 4 Applications

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

18 / 22

Anonymous Credentials
Allows user to authenticate while protecting their privacy. Recent work, build non-interactive credentials for NAND By combining with ours, it leads to efficient Non-Interactive Credentials No accumulators are needed

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

19 / 22

Anonymous Credentials
Allows user to authenticate while protecting their privacy. Recent work, build non-interactive credentials for NAND By combining with ours, it leads to efficient Non-Interactive Credentials No accumulators are needed

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

19 / 22

Anonymous Credentials
Allows user to authenticate while protecting their privacy. Recent work, build non-interactive credentials for NAND By combining with ours, it leads to efficient Non-Interactive Credentials No accumulators are needed

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

19 / 22

Language Authenticated Key Exchange

Alice

Bob

 C(MB ) C(MA), hpB 
 hpA

HB · HA

HB · HA

Same value iff languages are as expected, and users know witnesses.

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

20 / 22

Summing up
Proposed a generic framework to prove negative statement * Gives several instantiation of this framework, allowing some modularity Works outside pairing environment
Open Problems
Be compatible with post-quantum cryptography Weaken the requirements, on the building blocks

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

21 / 22

Summing up
Proposed a generic framework to prove negative statement * Gives several instantiation of this framework, allowing some modularity Works outside pairing environment
Open Problems
Be compatible with post-quantum cryptography Weaken the requirements, on the building blocks

O. Blazy (XLim)

Negative-NIZK

CT-RSA 2015

21 / 22

