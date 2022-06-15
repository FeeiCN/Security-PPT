Cryptanalysis of the Structure-Preserving Signature Scheme on Equivalence Classes from
Asiacrypt 2014
Yanbin Pan
Academy of Mathematics and Systems Science, Chinese Academy of Sciences
CT-RSA 2016, San Francisco 2016-3-3
1 / 39

Contents
1. Structure-Preserving Signature Scheme on Equivalence Classes a. Structure-Preserving Signature Scheme on Equivalence Classes b. Security of SPS-EQ
2. The Hanser-Slamanig SPS-EQ Scheme a. Description of the Hanser-Slamanig SPS-EQ Scheme b. Fuchsbauer's Attack to Break the EUF-CMA of the Scheme
3. Our Attacks a. Our Attacks b. Related Work to Fix the Scheme
2 / 39

Structure-Preserving Signature Scheme on Equivalence Classes
3 / 39

Digital Signature Scheme
KeyGen(1n): Generate public key pk and private key sk; Sign: Given message m, the signer computes the signature  = Signpk,sk(m) and publishes the pair
(m, ). Verify: the verifier accepts the message-signature pair if and only if Verifypk(m, ) = true.
4 / 39

Structure-Preserving Signature Scheme (SPS)
Proposed by Abe et al. in CRYPTO 2010; Employs bilinear map;
5 / 39

Structure-Preserving Signature Scheme (SPS)
Proposed by Abe et al. in CRYPTO 2010; Employs bilinear map;
Bilinear Map
Let G1, G2 and GT be cyclic groups of prime order p, where G1 and G2 are additive and GT is multiplicative. Let P and P generate G1 and G2, respectively. We call
e : G1 × G2  GT a bilinear map if it is efficiently computable and satisfies
For any a, b  Zp, e(aP, bP ) = e(P, P )ab = e(bP, aP ). e(P, P ) = 1GT .
6 / 39

Structure-Preserving Signature Scheme (SPS)
Proposed by Abe et al. in CRYPTO 2010; Employs bilinear map; The pk, m and  consist only of group elements; The signature can be verified just by deciding group membership and by evaluating some pairing-product equations;
7 / 39

Structure-Preserving Signature Scheme (SPS)
Proposed by Abe et al. in CRYPTO 2010; Employs bilinear map;
The pk, m and  consist only of group elements; The signature can be verified just by deciding group membership and by evaluating some pairing-product equations;
Many applications: blind signatures, group signatures, homomorphic signatures, tightly secure encryption...
8 / 39

SPS on Equivalence Classes (SPS-EQ)
Proposed by Hanser and Slamanig in Asiacrypt 2014; A structure-preserving signature with message space (G) ; For any message N equivalent to M, its valid signature can be efficiently obtained by the signature of M.
9 / 39

SPS on Equivalence Classes (SPS-EQ)

Proposed by Hanser and Slamanig in Asiacrypt 2014;

A structure-preserving signature with message space (G) ;

For any message N equivalent to M, its valid signature can be efficiently obtained by the signature of M.

Equivalence Relation in [HS2014]

Given a cyclic group G with order p and an integer > 1: The equivalence relation:

R = {(M, N)  (G)

× (G)

:






Zp

s.t.

N

=

M }.

The equivalence class:

[M]R = {N  (G)

:






Zp

s.t.

N

=

M }.

10 / 39

SPS on Equivalence Classes (SPS-EQ)
Proposed by Hanser and Slamanig in Asiacrypt 2014; A structure-preserving signature with message space (G) ; For any message N equivalent to M, its valid signature can be efficiently obtained by the signature of M. Used to construct an efficient multi-show attribute-based anonymous credential system [HS2014].
11 / 39

SPS-EQ
Definition ( SPS-EQ-R)
An SPS-EQ-R scheme consists of the following polynomial-time algorithms:
BGGenR(1): Given a security parameter , outputs a bilinear group description BG. KeyGenR(BG, ): Given BG and vector length > 1, outputs a key pair (sk, pk). SignR(M, sk): On input a representative M of equivalence class [M]R and secret key sk, outputs a signature  for the equivalence class [M]R. ChgRepR(M, , , pk): On input a representative M of an equivalence class [M]R, the corresponding signature , a scalar  and a public key pk, outputs (M, ^), where ^ is the signature on M. VerifyR(M, , pk): Given a representative M of equivalence class [M]R, a signature  and public key pk, outputs true if  is a valid signature for [M]R and false otherwise.
12 / 39

Security of SPS-EQ

Random Message Attack Non-Adaptive CMA Adaptive CMA

Unforgeability UF-RMA
UF-NACMA UF-ACMA

Existential Unforgeability EUF-RMA
EUF-NACMA EUF-ACMA

EUF-ACMA:
(sk, pk)  KeyGen(1n), (M, )  AO(sk,·)(pk) : Pr [M]Rhas not been queried  VerifyR(M, , pk) = true

 negl(n)

13 / 39

The Hanser-Slamanig SPS-EQ Scheme
14 / 39

The Hanser-Slamanig SPS-EQ Scheme
BGGenR(1): Given a security parameter , outputs BG = (p, G1, G2, GT , P, P , e).
KeyGenR(BG, ): Given > 1, chooses x R Zp and (xi )i=1 R (Zp) , computes
sk  (x, (xi )i=1), pk  (X , (Xi )i=1) = (xP , (xi xP )i=1).
15 / 39

The Hanser-Slamanig SPS-EQ Scheme

SignR(M, sk): On input a representative M = (Mi )i=1  (G1) of [M]R, chooses y R Zp and computes

Z  x xi Mi , V  y xi Mi ,

i =1

i =1

Then, outputs  = (Z , V , Y , Y ).

VerifyR(M, , pk): checks whether

(Y , Y )  y · (P, P ).

e(Mi , Xi ) =? e(Z , P) e(Z , Y ) =? e(V , X ) e(P, Y ) =? e(Y , P )
i =1
or not and outputs true if this holds and false otherwise.

16 / 39

Fuchsbauer's Attack when = 2
1. A receives pk and has access to a signing oracle. 2. A makes a signing query (P, P) and receives the signature
(Z1, V1, Y1, Y1). 3. A makes a signing query (Z1, P) and receives the signature
(Z2, V2, Y2, Y2). 4. A makes a signing query (P, Z1) and receives the signature
(Z3, V3, Y3, Y3). 5. A makes a signing query (Z1, Z2) and receives the signature
(Z4, V4, Y4, Y4). 6. A outputs (Z4, V4, Y4, Y4) as a forgery for the equivalence class
represented by (Z3, Z1).
17 / 39

Some Remarks on Fuchsbauer's attack
It needs 4 adaptive queries; Succeeds with high probability; Neglected to check whether (Z3, Z1) is in (G1)2 or not; Break EUF-CMA just for = 2; Amazing but hard to follow the idea. It is hard to point out which component of the scheme is weak from his attack.
18 / 39

Our Attacks
19 / 39

Main Result

Attack Model

Security

RMA

Existential Unforgeability [HS14]

2

NACMA

Existential Forgeability [this work]

2

ACMA

Existential Forgeability [Fuch14]

=2

Universal Forgeability [this work]

2

20 / 39

Our Attacks

Never Fail;

Use less queries;

=2 >2

Non-Adaptive CMA 2

3

Adaptive CMA

3

4

Easy to understand, and provide clear hint to fix the scheme.

21 / 39

The Key Observation
SignR(M, sk): On input a representative M = (Mi )i=1  (G1) of [M]R, chooses y R Zp and computes

Z  x xi Mi , V  y xi Mi ,

i =1

i =1

Then, outputs  = (Z , V , Y , Y ).

(Y , Y )  y · (P, P ).

22 / 39

The Key Observation
SignR(M, sk): On input a representative M = (Mi )i=1  (G1) of [M]R, chooses y R Zp and computes

Z  x xi Mi , V  y xi Mi ,

i =1

i =1

Then, outputs  = (Z , V , Y , Y ).

For any two messages M and M, if

(Y , Y )  y · (P, P ).

xi Mi = xi Mi,

i =1

i =1

then M and M share the same signature.

23 / 39

The Key Observation
SignR(M, sk): On input a representative M = (Mi )i=1  (G1) of [M]R, chooses y R Zp and computes

Z  x xi Mi , V  y xi Mi ,

i =1

i =1

Then, outputs  = (Z , V , Y , Y ).

(Y , Y )  y · (P, P ).

Generally, for any K  ker(), that is, i=1 xi Ki = 0,

 : (G1)  G1

(Mi )i=1 

xi Mi ,

i =1

M and M + K share the same signature.

24 / 39

Find a Non-Trivial K
SignR(M, sk): On input a representative M = (Mi )i=1  (G1) of [M]R, chooses y R Zp and computes

Z  x xi Mi , V  y xi Mi ,

i =1

i =1

Then, outputs  = (Z , V , Y , Y ).

(Y , Y )  y · (P, P ).

25 / 39

Find a Non-Trivial K
SignR(M, sk): On input a representative M = (Mi )i=1  (G1) of [M]R, chooses y R Zp and computes

Z  x xi Mi , V  y xi Mi ,

i =1

i =1

Then, outputs  = (Z , V , Y , Y ).

(Y , Y )  y · (P, P ).

Note that K = (xx2P, -xx1P, 0, · · · , 0)  ker()\(0, · · · , 0).

26 / 39

Find K when = 2

1. A receives pk and has access to a signing oracle.

2. A first chooses any invertible matrix

a1 a2 a3 a4

 Zp2×2

and computes its inverse

b1 b2 b3 b4

 Z2p×2,

such that
b1 b2 b3 b4

a1 a2 a3 a4

=

10 01

mod p.

27 / 39

Find K when = 2
3 A makes a signing query with (a1P, a2P) and gets its signature (Z1, V1, Y1, Y1).
4 A makes a signing query with (a3P, a4P) and gets its signature (Z2, V2, Y2, Y2).
5 A computes ((b3Z1 + b4Z2), -(b1Z1 + b2Z2)). We claim that
((b3Z1 + b4Z2), -(b1Z1 + b2Z2)) = (xx2P, -xx1P).
28 / 39

Find K when > 2
1. A receives pk and has access to a signing oracle. 2. A makes a signing query with (P, P, P, · · · , P) and gets
(Z1, V1, Y1, Y1). 3. A makes a signing query with (2P, P, P, · · · , P) and gets
(Z2, V2, Y2, Y2). 4. A makes a signing query with (P, 2P, P, · · · , P) and gets
(Z3, V3, Y3, Y3). 5. A computes (Z3 - Z1, Z1 - Z2, 0, · · · , 0).
We claim that (Z3 - Z1, Z1 - Z2, 0, · · · , 0) = (xx2P, -xx1P, 0, · · · , 0).
29 / 39

The Procedure to Find K
Note that The procedure to find K only involves non-adaptive queries; For = 2, we need 2 queries; For > 2, we need 3 queries.
30 / 39

Framework of Our Attacks
Breaking the EUF-Non-Adaptive-CMA: Find K with the non-adaptive queries; Output the message-signature pair (M = M + K , M ), where M has been queried in the procedure above and M is its signature.
Breaking the UF-Adaptive-CMA: Find K with the non-adaptive queries; For any message M to be signed, generate M = M + K , make a signing query with M and get its signature M ; Output M as the signature of M.
31 / 39

Some Remarks
Note that we have to show [M]R has not been queried to the signing oracle; Every message queried to the signing oracle must be in (G1) , that is, every component of the message is not zero.
32 / 39

E.g.: Breaking the EUF-NA-CMA when = 2 (I)

Choose any invertible matrix

b1 b2 b3 b4

 Zp2×2.

a1 a2 a3 a4

 Zp2×2 with its inverse

Query with M(1) = (a1P, a2P) and gets 1 = (Z1, V1, Y1, Y1).

Query with M(2) = (a3P, a4P) and gets 2 = (Z2, V2, Y2, Y2).

A computes K = ((b3Z1 + b4Z2), -(b1Z1 + b2Z2)).

33 / 39

E.g.: Breaking the EUF-NA-CMA when = 2 (II)
If K is equivalent to neither M(1) nor M(2), output the message K and the signature  = (0, 0, yP, yP ) for any y  Zp. If K is equivalent to M(1), output the message M = M(2) + K and the signature 2, where   {1, 2, 3} is chosen to ensure that that M  (G1)2. If K is equivalent to M(2), output the message M = M(1) + K and the signature 1, where   {1, 2, 3} is chosen to ensure that that M  (G1)2.
34 / 39

There is only One Signature Essentially!
For any M  ker(),
.
Zp (M + ker()) = G1.
Given any (M, ) where M  ker(), we can forge the signature on any message M , if we could find the unique  such that M  M + ker().
35 / 39

The Weak Point and How to Fix
In [HS14]: SignR(M, sk): On representative M  (G1) of [M]R, chooses y R Zp and computes  = (Z , V , Y , Y ), where

Z  x xi Mi , V  y xi Mi ,

i =1

i =1

(Y , Y )  y · (P, P ).

36 / 39

The Weak Point and How to Fix
In [HS14]: SignR(M, sk): On representative M  (G1) of [M]R, chooses y R Zp and computes  = (Z , V , Y , Y ), where

Z  x xi Mi , V  y xi Mi ,

i =1

i =1

(Y , Y )  y · (P, P ).

In [FHS14] eprint 2014/944:
SignR(M, sk): On representative M  (G1) of [M]R, chooses y R Zp and computes  = (V , Y , Y ), where

V  y xi Mi ,
i =1

1 (Y , Y )  · (P, P ).
y

37 / 39

Remarks about FHS14
The FHS14 scheme is proven to be EUF-CMA;
It certainly can resist our attack; It still employs the structure i=1 xi Mi .
If we can find K  ker(), the scheme will be insecure, but it seems we can not; If part of the private key are leaked, such as x1 and x2, we can find K.
38 / 39

Thank You!
39 / 39

SHORT STRUCTURE-PRESERVING SIGNATURES
Essam Ghadafi
e.ghadafi@ucl.ac.uk Department of Computer Science,
University College London
CT-RSA 2016
SHORT STRUCTURE-PRESERVING SIGNATURES

OUTLINE
1 BACKGROUND 2 OUR SCHEME 3 EFFICIENCY COMPARISON 4 SOME APPLICATIONS 5 SUMMARY & OPEN PROBLEMS
SHORT STRUCTURE-PRESERVING SIGNATURES

DIGITAL SIGNATURES
vk

sk Sig

Signer

Verifier

Yes/No
Unforgeabiltiy: You can only sign messages if you have the signing key

SHORT STRUCTURE-PRESERVING SIGNATURES

1 / 19

(PRIME-ORDER) BILINEAR GROUPS
G, G~ , T are finite cyclic groups of prime order p, where G = G and G~ = G~
Pairing (e : G × G~ - T) : The function e must have the following properties:
Bilinearity: P  G , Q~  G~ , x, y  Z, we have e(Px, Q~ y) = e(P, Q~ )xy
Non-Degeneracy: The value e(G, G~ ) = 1 generates T The function e is efficiently computable
Type-III [GPS08]: G = G~ and no efficiently computable homomorphism between G and G~ in either direction

SHORT STRUCTURE-PRESERVING SIGNATURES

2 / 19

STRUCTURE-PRESERVING SIGNATURES
Some History:
The term "Structure-Preserving" was coined by Abe et al. 2010 Earlier constructions: Groth 2006 and Green and Hohenberger 2008 Many constructions in the 3 different main types of bilinear groups Optimal Type-III constructions are the most efficient

SHORT STRUCTURE-PRESERVING SIGNATURES

3 / 19

STRUCTURE-PRESERVING SIGNATURES
What are they?
DEFINITION (A STRUCTURE-PRESERVING SIGNATURE) A signature scheme (defined over bilinear groups) where:
m, vk and  are elements of G and/or G~ Verifying signatures only involves deciding group membership and evaluating pairing-product equations (PPE):
e(Ai, B~j)ci,j = Z,
ij
where Ai  G, B~j  G~ and Z  T are group elements appearing in P, m, vk, , whereas ci,j  Zp are constants

SHORT STRUCTURE-PRESERVING SIGNATURES

4 / 19

STRUCTURE-PRESERVING SIGNATURES
Why Structure-Preserving Signatures?
Compose well with other pairing-based schemes · Easy to encrypt
Compose well with ElGamal/BBS linear encryption · Easy to combine with NIZK proofs
Compose well with Groth-Sahai proofs

SHORT STRUCTURE-PRESERVING SIGNATURES

5 / 19

APPLICATIONS OF STRUCTURE-PRESERVING SIGNATURES
Applications of Structure-Preserving Signatures: Blind signatures Group signatures Malleable signatures Tightly secure encryption schemes Anonymous credentials Oblivious transfer Network coding ...

SHORT STRUCTURE-PRESERVING SIGNATURES

6 / 19

EXISTING LOWER BOUNDS
Lower Bounds (for unilateral messages) in Type-III Bilinear Groups (Abe et al. 2011):
Signatures contain at least 3 group elements Signatures cannot be unilateral (must contain elements from both G and G~ )
· Note: Size of elements of G~ are at least twice as big as those of G At least 2 PPE verification equations

SHORT STRUCTURE-PRESERVING SIGNATURES

7 / 19

OUR CONTRIBUTION
A new signature scheme in Type-III bilinear groups with shorter signatures than existing ones:
· Signatures consist of 3 elements from G (i.e. unilateral) · 2 PPE verification equations (5 pairings in total) · Message space is the set of Diffie-Hellman pairs (Abe et
al. 2010): The set G^ = {(M, N~ )|(M, N~ )  G × G~ , e(M, G~ ) = e(G, N~ )}
More efficient instantiations of some existing cryptographic protocols (e.g. DAA)

SHORT STRUCTURE-PRESERVING SIGNATURES

8 / 19

OUR SCHEME
The Underlying Idea:
Can be viewed as an extension of the non-structure-preserving scheme of Pointcheval and Sanders (CT-RSA 2016)
Can be viewed as a more efficient variant of Ghadafi (ACISP 2013) Camenisch-Lysyanskaya based structure-preserving scheme

SHORT STRUCTURE-PRESERVING SIGNATURES

9 / 19

OUR SCHEME
The Scheme: KeyGen: Choose x, y  Zp, set sk := (x, y) and pk := (X~ := G~ x, Y~ := G~ y)  G~ 2
Sign: To sign (M, N~ )  G^ , · Choose a  Z×p ,  := (A := Ga, B := Ma, C := Ax · By)  G3
Verify: Check that A = 1G and (M, N~ )  G^ and e(A, N~ ) = e(B, G~ ) e(C, G~ ) = e(A, X~)e(B, Y~)
Randomize: Choose r  Z×p , return  := (A := Ar, B := Br, C := Cr)

SHORT STRUCTURE-PRESERVING SIGNATURES

10 / 19

PROPERTIES OF THE SCHEME
Some Properties of the Scheme:
The scheme is secure in the generic group model ·  alternatively can be based on an interactive assumption
Unilateral signatures (Perfectly) Fully re-randomizable Only M part of the message is needed for signing

SHORT STRUCTURE-PRESERVING SIGNATURES

11 / 19

EFFICIENCY COMPARISON

Scheme 

Size

vk

P

m

R?

Assumptions

Verification PPE Pairing

[GH08] a

G4 × G~

G~ 2

-

G

Y

q-HLRSW

4

8

[Fuc09]

G3 × G~ 2

G × G~

G3

G^

N q-ADHSDH+AWFCDH 3

9

[AFG+10] I G5 × G~ 2 G10 × G~ 4 -

G

P

q-SFP

2

12

[AFG+10] II G2 × G~ 5 G10 × G~ 4 -

G~

P

q-SFP

2

12

[AGH+11] I G2 × G~ G × G~ 3

- G × G~ N

GGM

2

7

[AGH+11] II G2 × G~

G × G~

-

G~

Y

GGM

2

5

[Gha13]

G4

G~ 2

-

G^

Y

DH-LRSW

3

7

[CM14] I

G × G~ 2

G2

-

G~

N

GGM

2

5

[CM14] II

G × G~ 2

G2

-

G~

Y

GGM

2

6

[CM14] III G2 × G~

G~ 2

-

G

Y

GGM

2

6

[AGO+14] I G3 × G~

G~

G

G

Y

GGM

2

6

[AGO+14] II G2 × G~

G~

G

G

N

GGM

2

6

[BFF15]

G × G~ 2

G2

-

G~

Y

GGM

2

5

[Gro15] I

G × G~ 2

G

G~

G~

Y

GGM

2

6

[Gro15] II

G × G~ 2

G

G~

G~

N

GGM

2

7

Ours

G3

G~ 2

-

G^

Y

GGM

2

5

aThis scheme is only secure against a random message attack.

SHORT STRUCTURE-PRESERVING SIGNATURES

12 / 19

EFFICIENCY COMPARISON

Comparison with schemes with the same message space

Scheme

Size



vk

R? P

Assumptions

Verification

PPE

Pairing

[Fuc09] G3 × G~ 2 G × G~ G3 N q-ADHSDH+AWFCDH 3 9 or (7 & 2 ECAdd)

[Gha13]

G4

G~ 2

-Y

DH-LRSW

3 7 or (6 & 1 ECAdd)

Ours

G3

G~ 2

-Y

GGM

2

5

* Cost does not include checking well-formedness of the message

SHORT STRUCTURE-PRESERVING SIGNATURES

13 / 19

GENERIC CONSTRUCTION OF DAA
Bernhard et al. 2013 gave a generic construction of DAA which requires the following tools:
Randomizable Weakly Blind Signatures (RwBS) · Used by the Issuer to issue certificates as credentials when users join the group
Linkable Indistinguishable Tags (LIT) · Needed to provide the linkability of signatures when the same basename is signed by the same user
Signatures of Knowledge (SoK) · Used by users to prove they have a credential and that the signature on the basename verifies w.r.t. thier certified secret key

SHORT STRUCTURE-PRESERVING SIGNATURES

14 / 19

BLIND SIGNATURES
pk
USER

sk
SIGNER

SHORT STRUCTURE-PRESERVING SIGNATURES

15 / 19

BLIND SIGNATURES pk
USER

sk
...
Sig SIGNER

SHORT STRUCTURE-PRESERVING SIGNATURES

15 / 19

BLIND SIGNATURES

pk

sk

Sig USER

...
Sig SIGNER

Security Requirements:

Blindness: An adversary (i.e. a signer) who chooses the messages, does not learn which message being signed and cannot link a signature to its signing session Unforgeability: An adversary (i.e. a user) cannot forge new signatures

SHORT STRUCTURE-PRESERVING SIGNATURES

15 / 19

BLIND SIGNATURES

pk

sk

Sig USER

...
Sig SIGNER

Security Requirements:

Blindness: An adversary (i.e. a signer) who chooses the messages, does not learn which message being signed and cannot link a signature to its signing session Unforgeability: An adversary (i.e. a user) cannot forge new signatures

SHORT STRUCTURE-PRESERVING SIGNATURES

15 / 19

RANDOMIZABLE WEAKLY BLIND SIGNATURES (RWBS)
Similar to blind signatures but:
Randomizability: Given a signature , anyone can produce a new signature  on the same message
Weak Blindness: Same as blindness but the adversary never sees the messages  The adversary cannot tell if he was given a signature on a different message or a re-randomization of a signature on the same message

SHORT STRUCTURE-PRESERVING SIGNATURES

16 / 19

EFFICIENT RWBS WITHOUT RANDOM ORACLES

The Idea: Combine the new scheme with SXDH-based Groth-Sahai proofs
Only M is needed for signing  To request a signature on (M, N~ ), send M and a NIZKPoK  of N~
LUser : M, N~ : e(G, N~ ) = e(M, G~ )  G~ · G~ = 1G~

The signer produces a signature  and a NIZK proof  (without knowing N~ ) for the validity of 
LSigner : (A, B, M), A~ : e(G, A~) = e(A, G~ )
 e(M, A~) = e(B, G~ )  G~ · G~ = 1G~

Fully re-randomizable  User verifies  and the final signature is a re-randomization of 
SHORT STRUCTURE-PRESERVING SIGNATURES

17 / 19

EFFICIENT RWBS WITHOUT RANDOM ORACLES

The Idea: Combine the new scheme with SXDH-based Groth-Sahai proofs
Only M is needed for signing  To request a signature on (M, N~ ), send M and a NIZKPoK  of N~
LUser : M, N~ : e(G, N~ ) = e(M, G~ )  G~ · G~ = 1G~

The signer produces a signature  and a NIZK proof  (without knowing N~ ) for the validity of 
LSigner : (A, B, M), A~ : e(G, A~) = e(A, G~ )
 e(M, A~) = e(B, G~ )  G~ · G~ = 1G~

Fully re-randomizable  User verifies  and the final signature is a re-randomization of 
SHORT STRUCTURE-PRESERVING SIGNATURES

17 / 19

EFFICIENT RWBS WITHOUT RANDOM ORACLES

The Idea: Combine the new scheme with SXDH-based Groth-Sahai proofs
Only M is needed for signing  To request a signature on (M, N~ ), send M and a NIZKPoK  of N~
LUser : M, N~ : e(G, N~ ) = e(M, G~ )  G~ · G~ = 1G~

The signer produces a signature  and a NIZK proof  (without knowing N~ ) for the validity of 
LSigner : (A, B, M), A~ : e(G, A~) = e(A, G~ )
 e(M, A~) = e(B, G~ )  G~ · G~ = 1G~

Fully re-randomizable  User verifies  and the final signature is a re-randomization of 
SHORT STRUCTURE-PRESERVING SIGNATURES

17 / 19

EFFICIENT RWBS WITHOUT RANDOM ORACLES

The Idea: Combine the new scheme with SXDH-based Groth-Sahai proofs
Only M is needed for signing  To request a signature on (M, N~ ), send M and a NIZKPoK  of N~
LUser : M, N~ : e(G, N~ ) = e(M, G~ )  G~ · G~ = 1G~

The signer produces a signature  and a NIZK proof  (without knowing N~ ) for the validity of 
LSigner : (A, B, M), A~ : e(G, A~) = e(A, G~ )
 e(M, A~) = e(B, G~ )  G~ · G~ = 1G~

Fully re-randomizable  User verifies  and the final signature is a re-randomization of 
SHORT STRUCTURE-PRESERVING SIGNATURES

17 / 19

EFFICIENT RWBS WITHOUT RANDOM ORACLES
Security of the RwBS Scheme: Unforgeability of the SPS Scheme + SXDH

Efficiency of the RwBS Scheme:

Scheme

Signature PPE

Verification Pairing

Bernhard et al. 2013 I G4

3 7 or (6 & 1 ECAdd)

Ours

G3

2

5

SHORT STRUCTURE-PRESERVING SIGNATURES

18 / 19

SUMMARY & OPEN PROBLEMS
Summary: · A new unilateral SPS scheme with short signatures · More efficient instantiations of building blocks for DAA without random oracles

Open Problems:
· More efficient constructions of unilateral structure-preserving signatures
· Constructions based on standard assumptions (e.g. DDH, DLIN, etc.)
· (Constant-size?) constructions for a vector of Diffie-Hellman pairs

SHORT STRUCTURE-PRESERVING SIGNATURES

19 / 19

THE END
Thank you for your attention! Questions?
SHORT STRUCTURE-PRESERVING SIGNATURES

