Duality in ABE:
Converting Attribute Based Encryption for Dual Predicate and Dual Policy via Computational Encodings
Nuttapong Attrapadung, Shota Yamada AIST, Japan
@CT-RSA 2015

Our Main Results in One Slide

Generic dual conversion for ABE

Instantiations: The first fully secure
· CP-ABE with short key · CP-ABE all-unbounded
(for boolean formulae, span programs)

1 Introduction

Attribute Based Encryption (ABE)
ABE for predicate R: X × Y  {0,1}

Key for xX

Decrypt
m if R(x,y)=1 ? if R(x,y)=0

Ciphertext for yY
(encrypt m)



A Predicate

Its Dual Predicate

R: X × Y  {0,1}

R: Y × X  {0,1} R(y,x) := R(x,y)



Key-Policy ABE
R: P × A  {0,1}

Ciphertext-Policy ABE
R: A × P  {0,1}

Key for Ciphertext for policy pP attribute aA

Key for Ciphertext for attribute aA policy pP

R(p,a) iff p satisfies a

R(a,p) iff p satisfies a



Motivation
· KP-ABE, CP-ABE · Definitions: directly related. · Constructions: NO known relation.
· Can we generically convert an ABE to its dual? · So that we would only construct KP, and get also CP. · Might be difficult? Historically, CP [BSW07, Waters11] was harder to achieve than KP [GPSW06].


Related Work for Dual Conversion
· Converting KP-ABE for boolean formulae predicate · Small classes of predicates · Its dual CP: only for bounded-size formulae [GJPS08].
· Converting KP-ABE for all boolean circuits · Implies general predicates, but must start with ABE for circuits. · Its dual CP: only for bounded-size circuits [GGHSW13]. · Due to the use of universal circuits.
 · Summary: less expressivity, and much less efficient.


Our Focus
· Goal: Generic dual conversion for any predicate. · Preserving full security, expressivity, and efficiency.
· Tool: Use a generic ABE framework of [A14]. · An abstraction of dual-system encryption [Waters09] for achieving fully-secure ABE.
[A14] N. Attrapadung, "Dual System Encryption via Doubly Selective Security: Framework, Fully-secure Functional Encryption for Regular Languages, and More", Eurocrypt 2014.


2 Our Result Overview

Our Main Result: Dual Conversion

Generic

Fully secure ABE Conversion Fully secure ABE

for arbitrary R

for its dual, R

Restricted to ABE In the "pair encoding"
framework [A14].

Recall The "Pair Encoding" Framework
Main Theorem in [A14]

Pair Encoding for predicate R

Generic Conversion Fully secure ABE
for R

If pair encoding is · "Perfectly secure" or · "Doubly selectively secure".

Our Main Result: More Precisely

Doubly selective pair encoding for
arbitrary R

Generic Conversion

Doubly selective pair encoding for
its dual, R

The Only Previous Dual Conversion
A Side Result in [A14]

Perfectly secure pair encoding for
arbitrary R

Generic Conversion

Perfectly secure pair encoding for
its dual, R

Implications: Solving Open Problems

No fully-secure ABE known before

Doubly selective encodings known

[NEW! all implied by this work]

·KP unbounded

·CP unbounded

boolean formula

boolean formula

Perfectly secure encodings known

·KP short-ciphertext for ·CP short-key for

boolean formula

boolean formula

·KP, CP boolean formula with some bounds
[LOSTW10, W14, A14]

·KP ·KP

over doubly-spatial regular languages

·CP over spatial

doubly-

·spatial, inner-product, ·CP regular languages ...
[all in A14]



3 Recall Pair Encoding

Recall Pair Encoding and ABE [A14]

Pair Encoding for R

ABE for R

Param

h

PK=(g1h, e(g1,g1)), MSK=

Enc1(x) Enc2(y) Pair(kx,cy)

kx(,r,h) cy(s,h) s0 if R(x,y)=1

SK=g1kx(,r,h)

CT=(g1cy(s,h), e(g1,g1)s0M)

Dec

e(g1,g1)s0 if R(x,y)=1

· s0 = first entry in s. · Require some linearity properties.

· Use composite-order bilinear groups. · (Neglect details here).


Security Definitions of Pair Encoding

Perfect security

{ Identical
(info-theoretic)

kx(0, r, h) kx(, r, h)

Doubly selective security

Cannot distinguish

{ g2kx(0, r ,h) g2kx(, r ,h)

cy( s,h) for R(x,y)=0 g2cy(s,h) for R(x,y)=0

· Selective notion: · Co-selective notion:

queries c before k. ( queries k before c. (

then then

) )


Intuition Behind Pair Encoding Security
Switch Keys from Normal to Semi-functional [A14]

normal

K g1k(,r,h)g2k(0,0,0)

1

Subgroup Decision

semi-1

g g K1

1k(,r,h)

k(0, ^r ,h^)
2

1

2

Security of encoding

semi-2

1

2

K2

g g 1k(,r,h)

k(^,^r ,h^ )
2

semi-3

Subgroup Decision

1

2

g g K3

1k(,r,h)

k(^ ,0,0)
2

· Only for self-containment, will not use here.


4 Our Conversion

Basic Idea for Dual Conversion

Encoding for R

Encoding for R

Enc1 maps xX

Enc1 maps yY defined using Enc2

Enc2 maps yY

Enc2 maps xX defined using Enc1



Our Dual Conversion

Encoding for R

Encoding for R

Param h

Param h = (h,b)

Enc1 kx(,r,h) Enc2 cy(s,h)

Enc1 Enc2

ky(,s,h) = (cy(s,h), +bs0) cx(r,h) = (kx(bs0,r,h), s0 )

where s = s r = (s0, r)



Our Dual Conversion

Encoding for R

Encoding for R

Param h

Param h = (h,b)

Enc1 kx(,r,h)

Enc1 ky(,s,h) = (cy(s,h), +bs0)

Enc2 cy(s,h)

Enc2 cx(r,h) = (kx(bs0,r,h), s0 )

Pair(kx,cy) = s0

Pair: Pair(kx,cy) = bs0s0 (+bs0) (s0) - bs0s0 = s0
where s = s r = (s0, r) 

Our Dual Conversion
· The same conversion as in [A14]. · [A14] only proved for the perfectly secure encodings. · We make it work also for doubly secure encodings.


Our New Theorems

Encoding for R is selective

then

Encoding for R is co-selective

Encoding for R is co-selective

then

Encoding for R is selective

Intuition: · Swap key/cipher encodings Query order is reversed. · Hence selective becomes co-selective (and vice versa).


Difficulty in Proving Theorems

Encoding for R

Encoding for R

Enc1: kx(,r,h)

Enc1: ky(,s,h) = (cy(s,h), +bs0)

Enc2: cy(s,h)

Enc2: cx(r,h) = (kx(bs0,r,h), s0 )
(all terms over the exponent)

Difficulty in Proving Theorems

Encoding for R

Encoding for R

{ kx(0,r,h)
Enc1: kx(,r,h) Given IND here

Enc1: ky(,s,h) = (cy(s,h), +bs0)

Enc2: cy(s,h)

Enc2: cx(r,h) = (kx(bs0,r,h), s0 )

(all terms over the exponent)

Difficulty in Proving Theorems

Encoding for R

Encoding for R

{ kx(0,r,h)
Enc1: kx(,r,h) Given IND here

{ ky(0,s,h)
Enc1: ky(,s,h) = (cy(s,h), +bs0)
Goal: to prove IND here. But it totally differs from kx.

Enc2: cy(s,h)

Enc2: cx(r,h) = (kx(bs0,r,h), s0 )

(all terms over the exponent)

Proof Idea
Encoding for R

Encoding for R

Enc1: kx(,r,h)

Enc1: ky(,s,h) = (cy(s,h), +bs0)

Enc2: cy(s,h)

Enc2: cx(r,h) = (kx(bs0,r,h), s0 )
(all terms over the exponent)

Proof Idea
Encoding for R

Encoding for R

Enc1: kx(,r,h)

Enc1: ky(,s,h) = (cy(s,h), +bs0)

Enc2:

cy(s,h)
Sim

Enc2: cx(r,h) = (kx(bs0,r,h), s0 )
Adv

SIM
attacks Enc attacks Enc

(all terms over the exponent)

Proof Idea
Encoding for R

Encoding for R
SIM define  on unknown 

Enc1: kx(,r,h)

Enc1: ky(,s,h) = (cy(s,h), +bs0)

Enc2:

cy(s,h)
Sim

Enc2: cx(r,h) = (kx(bs0,r,h), s0 )
Adv

SIM
attacks Enc attacks Enc

(all terms over the exponent)

Proof Idea
Encoding for R

Encoding for R
SIM define  on unknown 

Enc1: kx(,r,h)

Enc1: ky(,s,h) = (cy(s,h), +bs0)

But this becomes unknown, too.

Enc2:

cy(s,h)
Sim

Enc2: cx(r,h) = (kx(bs0,r,h), s0 )
Adv

SIM
attacks Enc attacks Enc

(all terms over the exponent)

Proof Idea: Cancellation Trick

Encoding for R

Encoding for R
SIM define  on unknown 

Enc1: kx(,r,h)

Enc1: ky(,s,h) = (cy(s,h), +bs0)

Enc2:

cy(s,h)
Sim

Enc2: cx(r,h) = (kx(bs0,r,h), s0 )
Adv

SIM
attacks Enc attacks Enc

(all terms over the exponent)

Proof Idea: Cancellation Trick

Encoding for R

Encoding for R
SIM define  on unknown 

Enc1: kx(,r,h)

Enc1: ky(,s,h) = (cy(s,h), +bs0)

SIM define b on unknown 

Enc2:

cy(s,h)
Sim

Enc2: cx(r,h) = (kx(bs0,r,h), s0 )
Adv

SIM
attacks Enc attacks Enc

(all terms over the exponent)

Proof Idea: Cancellation Trick

Encoding for R Enc1: kx(,r,h)

Encoding for R

SIM define  on unknown 

cancellation of two unknowns!

Enc1: ky(,s,h) = (cy(s,h), +bs0)

SIM define b on unknown 

Enc2:

cy(s,h)
Sim

Enc2: cx(r,h) = (kx(bs0,r,h), s0 )
Adv

SIM
attacks Enc attacks Enc

(all terms over the exponent)

New Instantiations

KP-ABE [A14] all-unbounded for span programs

Apply Conversion

CP-ABE all-unbounded for span programs

KP-ABE [A14] short-ciphertext for span programs

Apply Conversion

CP-ABE short-key for span programs

Doubly selective secure under some Extended DH Exponent assumptions [A14].


5 Concluding Remarks

More Results
· Dual-Policy ABE · Conjunctively combine ABE and its dual [AI09]. · We also provide a conversion from ABE to DP-ABE.
· More refinement: · New specific CP-ABE with tighter reduction.
· Full version at http://eprint.iacr.org/2015/157.


Thank you

Intuition Behind Pair Encoding Security
Switch Keys from Normal to Semi-functional [A14]

normal

K g1k(,r,h)g2k(0,0,0)

1

Subgroup Decision

semi-1

g g K1

1k(,r,h)

k(0, ^r ,h^)
2

1

2

Security of encoding

semi-2

1

2

K2

g g 1k(,r,h)

k(^,^r ,h^ )
2

semi-3

Subgroup Decision

1

2

g g K3

1k(,r,h)

k(^ ,0,0)
2

· Only for self-containment, will not use here.

Revocable Hierarchical Identity-Based Encryption: History-Free Update, Security Against Insiders, and Short Ciphertexts
#RSAC
Jae Hong Seo1 and Keita Emura2
1. Myongji University, Korea 2. NICT, Japan

#RSAC
Contents
 Identity-based encryption with revocation (RIBE)
 Trivial Way (by Boneh and Franklin 2001)  Scalable construction (by Boldyreva, Goyal, and Kumar, 2008)
 Revocable Hierarchical IBE (RHIBE): CT-RSA 2013, Seo and Emura  History-preserving updates approach  Security against outsider  Long-size ciphertext (ciphertext size depends on the level of hierarchy)
 Our RHIBE Constructions
 History-free updates approach  Security against insider  Constant-size ciphertext (in terms of the hierarchy level)
2

#RSAC
Identity-Based Encryption and Revocation
3

Identity-Based Encryption (IBE)

#RSAC

Publish mpk
1 time download

KGC

Bob@rsa.com

Issue sk

Sender

Enc(mpk, , M)
4

Receiver

Identity-Based Encryption (IBE)

#RSAC

Publish mpk

Bob@rsa.com

1 time download

KGC
How to revokIsesuBe sokb's

Enc(smepckr, et k, eMy) ?

Sender

Receiver

5

Revocation Capability in IBE: Boneh-Franklin #RSAC

Publish mpk
KGC T1itsimaelso regarded as a
download
part of user's identity

Bob@rsa.com

Sender

Receiver

6

Revocation Capability in IBE: Boneh-Franklin #RSAC

Publish mpk
KGC T1itsimaelso regarded as a
download
part of user's identity

Bob@rsa.com

Sender

Enc(mpk, ||T, M)
7

Receiver

Revocation Capability in IBE: Boneh-Franklin #RSAC

Publish mpk
T1itsimaelso regarded as a download
part of user's identity

Bob@rsa.com
KGC
Issue sk ||T
if is not revoked on time T.

Enc(mpk, ||T, M)

Sender

Receiver

8

Revocation Capability in IBE: Boneh-Franklin #RSAC

Publish mpk

Bob@rsa.com

KGC

T1itsimaelso regarded as a download
part of user's identity

Issue sk ||T
if is not revoked on time T.

PlirnoebalerlmEyni:cnT(cmhrepekao,sveedrhi|ne|Tat,hdMeo)nnuKmGbCeirs

Sender

of users (O(N-R))

Receiver

9

Revocation Capability in IBE: Boldyreva et al. #RSAC

Publish mpk
1 time download

KGC

Bob@rsa.com

Issue sk

Sender

Enc(mpk, , T, M)
10

Receiver

Revocation Capability in IBE: Boldyreva et al. #RSAC

Publish mpk

1 time download

Broadcast key update kuT

KGC

Bob@rsa.com

kuT Issue sk

Enc(mpk, , T, M)

Sender

Receiver

11

Revocation Capability in IBE: Boldyreva et al. #RSAC

Publish mpk

1 time download

Broadcast key update kuT

KGC

Bob@rsa.com

kuT Issue sk

Enc(mpk, , T, M)

SenOdenlry non-revoked users can generate

Receiver

a decryption key dk ,T12 from kuT and sk

Revocation Capability in IBE: Boldyreva et al. #RSAC

Only log-size Overhead!!
(NNL: Naor-Naor-Lotspiech, O(Rlog(N/R)))
Publish mpk

Bob@rsa.com

1 time download

Broadcast key update kuT

KGC
kuT Issue sk

Enc(mpk, , T, M)

SenOdenlry non-revoked users can generate

Receiver

a decryption key dk ,T13 from kuT and sk

Broadcast Encryption (BE) Technique

#RSAC

Complete Subtree (CS)

 Each user is assigned to a node

u1

u2 u3

u4 u5

u6 u7

u8

We consider a binary tree kept by KGC

14

Broadcast Encryption (BE) Technique

#RSAC

Complete Subtree (CS)

 Each user is issued secret keys on the path to the root node by KGC (sk )

u1

u2 u3

u4 u5

u6 u7

u8

U3 has secret keys on the path to the root node

15

Broadcast Encryption (BE) Technique

#RSAC

Complete Subtree (CS)

 kuT is computed for nodes which do not have intersection against paths (to the root node) of revoked users

u1

u2 u3

u4 u5

u6 u7

u8

Revoked

16

Broadcast Encryption (BE) Technique

#RSAC

Complete Subtree (CS)

 kuT is computed for nodes which do not have intersection against paths (to the root node) of revoked users

u1

u2 u3

u4 u5

u6 u7

u8

Revoked

17

Broadcast Encryption (BE) Technique

#RSAC

Complete Subtree (CS)

 kuT is computed for nodes which do not have intersection against paths (to the root node) of revoked users

u1

u2 u3

u4 u5

u6 u7

u8

Revoked

18

Broadcast Encryption (BE) Technique

#RSAC

Complete Subtree (CS)

 kuT is computed for nodes which do not have intersection against

paths (to the root node) of revoked users

Contain node information

which is determined by who

will be revoked

u1

u2 u3

u4 u5

u6 u7

u8

Revoked

19

Broadcast Encryption (BE) Technique

#RSAC

Complete Subtree (CS)

 From log N size public information kuT, only non-revoked users can extract useful information.
dk T  sk and kuT

u1

u2 u3

u4 u5

u6 u7

u8

U3 has secret keys on the path to the root node
20

Scalable Revocable IBE

#RSAC

 First construction

 A. Boldyreva, V. Goyal, and V. Kumar. Identity-based encryption with efficient revocation. In ACM CCS 2008

 First adaptive secure scheme
 B. Libert and D. Vergnaud. Adaptive-ID secure revocable identity-based encryption. In CT-RSA 2009.

 Considering decryption key exposure resistance
 J. H. Seo and K. Emura. Revocable identity-based encryption revisited: Security model and construction. In PKC 2013.
 An adversary is allowed to obtain

 SD-based construction  K. Lee, D. H. Lee, and J. H. Park. Efficient revocable identity-based encryption via subset difference methods, eprint.iacr.org/2014/132, 2014.
21

#RSAC
Revocable Hierarchical IBE (RHIBE)
22

#RSAC
Revocable Hierarchical IBE (RHIBE)

 A low-level user can stay in the system only if her parent also stays in the current time period.

...
... KGC
......
......

First-level users have O(log N)-size secret key (as in RIBE)
Second-level users have log N subkeys for "each" parent's subkey
(in total (log N)2-size subkeys)

skID1= skID2=

subkey1

One of subkeys will

...

be used for

computing

kuT.

subkeylogN

subkey1*subkey'1 subkey1*subkey'logN

......

...

subkeylogN*subley'logN

 Trivial combination of RIBE and HIBE will result in an impractical scheme with an exponential number of secret keys
23

Revocable Hierarchical IBE (RHIBE)

#RSAC

 The first RHIBE scheme with polynomial size secret keys (Seo-Emura, CT-RSA 2013)

 Asymmetric trade between secret key size and generating time for secret key

 A parent gives "half-computed" subkeys, and children generate suitable

subkeys

subkey1*subkey'1

subkey1

Product of partial keys

...... ......

skID2= subkey1*subkey'logN subkeylogN*subley'logN (log N)2-size subkeys

skID2=

subkeylogN subkey'1

(log N)2-size subkeys

subkey'logN 2(log N)-size "half-computed" subkeys

24

Revocable Hierarchical IBE (RHIBE)

#RSAC

 The first RHIBE scheme with polynomial size secret keys (Seo-Emura, CT-RSA 2013)

 Asymmetric trade between secret key size and generating time for

Hsiestcorertyk-peyreserving key updates

· For tAhepacarelcnutlagtiivoens, a"hcahlifl-dconmeepdustteodk"nsouwbkeys, and children generate suitable

whicshupbakretyiasl key of the ancestor was used

in each time period. subkey1*subkey'1

subkey1

Product of partial keys

...... ......

sk·IDSk2=euychupinsdufaobtrkemesya1t*iosnubiskeayls'ologaNnnounced in the skID2=

subkeylogN subkey'1

(log N)2-size subkeys

subkeylogN*subley'logN

subkey'logN

(log N)2-size subkeys

2(log N)-size "half-computed" subkeys

25

Our Contribution

#RSAC

 History-Free Update

 Low-level users do not need to know what ancestors did during key

updates. ...

 Security Against Insiders

... KGC

 An adversary is allowed to obtain state information

......

 Short Ciphertexts

 Constant-size ciphertext in terms of the level of hierarchy

......

...

 Two constructions: Shorter secret keys and ciphertexts

 Complete Subtree (CS)

 Subset Difference (SD)

26

#RSAC
Main Idea for History-Free Update
 R(H)IBE:
 KGC (or a parent user) issues a long-term secret key skID using msk (or skparent-ID ).
 KGC (or a parent user) broadcasts key update information kuT which is computed by msk (or skparent-ID ).
 A (child) user can generate the decryption key dkID,T from skID and kuT if he/she is not revoked at time T.
 Two situations are equivalent:
 A user ID is not revoked at time T  The user can generate the decryption key dkID,T
 Re-define the key update algorithm
27

#RSAC
Main Idea for History-Free Update
 Previous syntax

 Our modification

No parent secret key is required (for history-free approach)
State information takes a role of the delegation key
dk is used instead of sk and ku
28

#RSAC
Main Idea for History-Free Update
 Previous syntax
The secret key is used only for generating the decryption key dk.
No parent secret key is required (for history-free approach)
 Our modificaLtioonw-level users do noSttatneeinefodrmtaotiokn ntaokews a role of the what ancestors did during keydeulepgadtioantkeesy.
dk is used instead of sk and ku
29

#RSAC
Proposed RHIBE Scheme (CS)

 Based on the BBG HIBE scheme

 BBG HIBE (ID) + Boneh-Boyen IBE (Time)

 Give a reduction to the BBG HIBE scheme.

 [BBG05] Boneh, D., Boyen, X., Goh, E.-J.: Hierarchical identity based encryption with constant size ciphertext. EUROCRYPT 2005.

(Boneh-Boyen hash)

If ID|k is not revoked, then there
exists the same 

CS method

BBG HIBE (ID)

BB IBE (Time)
30

With re-randomization for decryption key exposure resistance

#RSAC
Proposed RHIBE Scheme (SD)
Linear functions are assigned to each level
revoked
31

#RSAC
Proposed RHIBE Scheme (SD)
Linear functions are assigned to each level Key Update info contains information about a point fv||3(w')
revoked
32

Proposed RHIBE Scheme (SD)
Linear functions are assigned to each level
The secret key sku3 contains information about a point fv||3(w)

#RSAC
Key Update info contains information about a point
fv||3(w')

revoked
33

Proposed RHIBE Scheme (SD)
Linear functions are assigned to each level
The secret key sku3 contains information about a point fv||3(w)

#RSAC
Key Update info contains information about a point
fv||3(w')

Using Lagrange interpolation, u3 can recover fv||3(x) but u5 and u6 do not.

revoked
34

#RSAC
Proposed RHIBE Scheme (SD)
 The main part is the same as that of the LLP RIBE scheme.
 K. Lee, D. H. Lee, and J. H. Park. Efficient revocable identity-based encryption via subset difference methods, eprint.iacr.org/2014/132, 2014.
 One difference is: we introduce the false master key for historyfree construction so that sk does not contain the master key 
See the paper for details
35

#RSAC
Comparison
36

#RSAC
Comparison
DBDH q-weak Bilinear Diffie-Hellman Inversion
37

#RSAC
Conclusion and Future work
 RHIBE:  History-free update, insider security, short ciphertext, and DKER
 The reduction to the underlying HIBE requires the challenge identity for the security proof.  Adaptive-ID secure RHIBE under a static assumption with these desirable properties
38

