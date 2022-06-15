Mitigating Server Breaches in Password-Based Authentication:
Secure and Efficient Solutions
Damien Vergnaud
E´cole normale sup´erieure ­ CNRS ­ INRIA ­ PSL

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 1 / 19

Outline of the Talk
1 Introduction 2 Building Blocks 3 Construction 1 4 Construction 2

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 2 / 19

Authenticated Key Exchange

Alice and Bob agree on a common secret key K means: public/secret key pair (1 or 2), common secret
implicit authentication: only Alice and Bob can compute K semantic security: K indistinguishable from random

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 3 / 19

Authenticated Key Exchange

Alice and Bob agree on a common secret key K means: public/secret key pair (1 or 2), common secret
implicit authentication: only Alice and Bob can compute K semantic security: K indistinguishable from random

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 3 / 19

Password-Authenticated Key Exchange (PAKE)

prove to each other that they know the password without disclosing any useful information about it get a shared secret out at the end.

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 4 / 19

On-Line Dictionary Attacks
people use weak passwords
Example: RockYou.com password breach of 32M accounts (2010) Total entropy of passwords: 21.1 bits Top 100 passwords cover 4.6% of accounts
Unavoidable attack: adversary interacts with a player, trying a password success it has guessed the password failure it tries again with another password

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 5 / 19

On-Line Dictionary Attacks
people use weak passwords
Example: RockYou.com password breach of 32M accounts (2010) Total entropy of passwords: 21.1 bits Top 100 passwords cover 4.6% of accounts
Unavoidable attack: adversary interacts with a player, trying a password success it has guessed the password failure it tries again with another password

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 5 / 19

Security Models
Various security models Game-based security (Bellare-Pointcheval-Rogaway, 2000) Simulation-based security (Boyko-MacKenzie-Patel, 2000) Universal Composability (Canetti-Halevi-Katz-Lindell-MacKenzie, 2005)
The adversary controls all the communications: It can create, modify, transfer, alter, delete messages
Users can participate in concurrent executions of the protocol
On-line dictionary attack should be the best attack . . . qS = # Active Sessions N = # Dictionary No adversary should win with probability greater than qS /N!

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 6 / 19

Distributed PAKE

inspired by multi-party computation (Ford and Kaliski ­ 2000)
passwords shared among two servers (or more) distributed computation between client and servers uses a gateway (with no secret) ends up in the gateway and the client sharing a secret.
time divided into distinct periods servers update their sharing of the passwords adversary can corrupt servers multiple times but only one for each period. The user does not need to update his password

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 7 / 19

Building Block: Projective Hashing
introduced by Cramer and Shoup (2002) Implicit designated-verifier proofs IND-CCA encryption scheme
Applications: Password-Authenticated Key Exchange Oblivious Transfer Relatively-Sound / Dual-System NIZK Zero-Knowledge Arguments Witness Encryption ...

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 8 / 19

Smooth Projective Hash Functions (SPHF)

ProjHash(hp, L, C1, w1)

ProjHash(hp, L, C3, ??)

C1 L C2
Set

Hash(hk, L, C1)
ProjHash(hp, L, C2, w2) Hash(hk, L, C2)

correctness

C3 L

ProjHash(hp, L, C4, ??)

Set C4

Hash(hk, L, C3) Hash(hk, L, C4)

smoothness

HashKG(L) hk for language L  Set ProjKG(hk, L, C ) hp Hash(hk, L, C ) ProjHash(hp, L, C , w )

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 9 / 19

Proof of a Diffie-Hellman tuple (Cramer-Shoup)
G = g1 = g2 . |G| = p L = {(g1r , g2r ), r  Zp}  G2 = Set
HashKG(L) hk = (x1, x2) $ Z2p; ProjKG(hk, L, ) hp = g1x1g2x2. Hash(hk, L, C = (c1, c2)) H = c1x1 · c2x2  G. ProjHash(hp, L, C = (g1r , g2r ), w = r ) H = hpr  G .
Public-Key Encryption with CCA-security: CSpk(m; r)

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 10 / 19

Proof of a Diffie-Hellman tuple (Cramer-Shoup)
G = g1 = g2 . |G| = p L = {(g1r , g2r ), r  Zp}  G2 = Set
HashKG(L) hk = (x1, x2) $ Z2p; ProjKG(hk, L, ) hp = g1x1g2x2. Hash(hk, L, C = (c1, c2)) H = c1x1 · c2x2  G. ProjHash(hp, L, C = (g1r , g2r ), w = r ) H = hpr  G .
Public-Key Encryption with CCA-security: CSpk(m; r)

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 10 / 19

Proof of a Diffie-Hellman tuple (Cramer-Shoup)
G = g1 = g2 . |G| = p L = {(g1r , g2r ), r  Zp}  G2 = Set
HashKG(L) hk = (x1, x2) $ Z2p; ProjKG(hk, L, ) hp = g1x1g2x2. Hash(hk, L, C = (c1, c2)) H = c1x1 · c2x2  G. ProjHash(hp, L, C = (g1r , g2r ), w = r ) H = hpr  G .
Public-Key Encryption with CCA-security: CSpk(m; r)

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 10 / 19

Application to PAKE
proposed by Katz-Ostrovsky-Yung (Diffie-Hellman) generalized by Gennaro-Lindell

CA

pwA

CB , hpB

pwB

hpA

CA = CSpk(pwA; rA) hkA  HashKG(L) hpA  ProjKG(hk, L, CB )

CB = CSpk(pwB ; rB ) hkB  HashKG(L) hpB  ProjKG(hk, L, CA)

Hash(hkA, L, CB ) · ProjHash(hpB , L, CA, rA) =? Hash(hkB , L, CA) · ProjHash(hpA, L, CB , rB )

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 11 / 19

Application to PAKE
proposed by Katz-Ostrovsky-Yung (Diffie-Hellman) generalized by Gennaro-Lindell

CA

pwA

CB , hpB

pwB

hpA

CA = CSpk(pwA; rA) hkA  HashKG(L) hpA  ProjKG(hk, L, CB )

CB = CSpk(pwB ; rB ) hkB  HashKG(L) hpB  ProjKG(hk, L, CA)

Hash(hkA, L, CB ) · ProjHash(hpB , L, CA, rA) =? Hash(hkB , L, CA) · ProjHash(hpA, L, CB , rB )

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 11 / 19

Application to PAKE
proposed by Katz-Ostrovsky-Yung (Diffie-Hellman) generalized by Gennaro-Lindell

CA

pwA

CB , hpB

pwB

hpA

CA = CSpk(pwA; rA) hkA  HashKG(L) hpA  ProjKG(hk, L, CB )

CB = CSpk(pwB ; rB ) hkB  HashKG(L) hpB  ProjKG(hk, L, CA)

Hash(hkA, L, CB ) · ProjHash(hpB , L, CA, rA) =? Hash(hkB , L, CA) · ProjHash(hpA, L, CB , rB )

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 11 / 19

Application to PAKE
proposed by Katz-Ostrovsky-Yung (Diffie-Hellman) generalized by Gennaro-Lindell

CA

pwA

CB , hpB

pwB

hpA

CA = CSpk(pwA; rA) hkA  HashKG(L) hpA  ProjKG(hk, L, CB )

CB = CSpk(pwB ; rB ) hkB  HashKG(L) hpB  ProjKG(hk, L, CA)

Hash(hkA, L, CB ) · ProjHash(hpB , L, CA, rA) =? Hash(hkB , L, CA) · ProjHash(hpA, L, CB , rB )

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 11 / 19

Application to PAKE
proposed by Katz-Ostrovsky-Yung (Diffie-Hellman) generalized by Gennaro-Lindell

CA

pwA

CB , hpB

pwB

hpA

CA = CSpk(pwA; rA) hkA  HashKG(L) hpA  ProjKG(hk, L, CB )

CB = CSpk(pwB ; rB ) hkB  HashKG(L) hpB  ProjKG(hk, L, CA)

Hash(hkA, L, CB ) · ProjHash(hpB , L, CA, rA) =? Hash(hkB , L, CA) · ProjHash(hpA, L, CB , rB )

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 11 / 19

Application to PAKE
proposed by Katz-Ostrovsky-Yung (Diffie-Hellman) generalized by Gennaro-Lindell

CA

pwA

CB , hpB

pwB

hpA

CA = CSpk(pwA; rA) hkA  HashKG(L) hpA  ProjKG(hk, L, CB )

CB = CSpk(pwB ; rB ) hkB  HashKG(L) hpB  ProjKG(hk, L, CA)

Hash(hkA, L, CB ) · ProjHash(hpB , L, CA, rA) =? Hash(hkB , L, CA) · ProjHash(hpA, L, CB , rB )

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 11 / 19

Katz-MacKenzie-Taban-Gligor DPAKE (2005/2012)
extends and builds upon Katz-Ostrovsky-Yung PAKE password pw = pw0 shared as pw0 = pw1 · pw2 (high entropy) Protocol execution. (high level)
two executions of the KOY protocol client  server A (using server B to assist with the authentication) client  server B (using server A to assist with the authentication)
client's work increase by a factor 2 servers' work increase by a factor 6

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 12 / 19

Katz-MacKenzie-Taban-Gligor DPAKE (2005/2012)
extends and builds upon Katz-Ostrovsky-Yung PAKE password pw = pw0 shared as pw0 = pw1 · pw2 (high entropy) Protocol execution. (high level)
two executions of the KOY protocol client  server A (using server B to assist with the authentication) client  server B (using server A to assist with the authentication)
client's work increase by a factor 2 servers' work increase by a factor 6

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 12 / 19

Design Principle

U owns a password pw0 and wants to interact with G

S1 owns a share pw1 of pw0

(pw0 = pw1 · pw2)

S2 owns a share pw2 of pw0

G interacts with S1 and S2

"three-party PAKE" U checks (using an SPHF) whether pw0 = pw1 · pw2 S1 checks (using an SPHF) whether pw1 = pw0/pw2 S2 checks (using an SPHF) whether pw2 = pw0/pw1

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 13 / 19

Construction 1
C0 = CSek(pw0; r0)

hp1,0 (r0 for C0 known?) hp0,1 (r1 for C1 known?)
hp0,2 (r2 for C2 known?) hp2,0 (r0 for C0 known?)

C1 = CSek(pw1; r1)

hp1,2 (r2 for C2 known?)

hp2,1 (r1 for C1 known?)

C2 = CSek(pw2; r2)

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 14 / 19

Efficiency

Ciphertext Proj. Keys

Client

4

4

Server

4

4

Gateway 0 1

communication complexity similar to Katz et al.'s scheme time complexity similar to Katz et al.'s scheme linear-time update protocol (as Katz et al.'s scheme)

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 15 / 19

Design Principle
U owns a password  and wants to interact with G G owns a public database DB of encrypted passwords G interacts with S1 and S2, each owning a share of sk
idea similar only the client needs to compute a ciphertext C (the other ciphertext C in DB) participants implicitly check (using several SPHF) that:
Dec(C ) = Dec(C )

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 16 / 19

Construction 2
1
hpC1 S (r0 for C0 known?)

hpE0 G ( for CUDB known?)

C0 = CSek(pw0; r0)

CUDB = EGpk(pwU; sU) sk = 1 + 2 (unknown)

hpE1 G (2 for CUDB
known?)

hpE2 G (1 for CUDB known?)

hpC2 S (r0 for C0 known?)
2

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 17 / 19

Efficiency

Ciphertext Proj. Keys

Client

4

2

Server

0

2

Gateway 0 1

constant-time update protocol
communication complexity decreased by more than 50% (9 group elements vs 20 group elements for Katz et al.'s scheme).
the client performs 8 full exponentiations; each server performs 7 exponentiations (instead of 15 and 13 respectively for Katz et al.'s scheme).

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 18 / 19

Conclusion
Two constructions of distributed PAKE secure in the standard security model (without random oracles) efficient using standard cryptographic libraries (do not require pairings)
Extensions can be generalized to the setting with n servers can be adapted with SPHFs for Paillier and LWE encryption
Open Problems efficient construction in the Universal Composability framework

RSA, Mar. 01 2016

Distributed Password-Based Authentication

Damien Vergnaud 19 / 19

Strongly Leakage-Resilient Authenticated Key Exchange
Rongmao Chen

Joint work with Yi Mu, Guomin Yang, Willy Susilo and Fuchun Guo

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 1 / 19

Authenticated Key Exchange (AKE)

Truly Fundamental Cryptographic Protocol
Establish a secure channel by agreeing on a common session key Core in network standards, e.g., IPSec, SSL/TLS, SSH, etc Practical protocols: ISO (a.k.a SIG-DH), IKE (a.k.a SIGMA), etc

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 2 / 19

A Closer Look at AKE

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 3 / 19

A Closer Look at AKE

K = A(lskA, eskA, Msgs) = B(lskB, eskB, Msgs)

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 3 / 19

Conventional AKE Security Model

Security Notion
Mutual Authentication Secure Key Establishment
Adversarial Model
BR [BR93] BCK [BCK98] CK [CK01] eCK [LLM07]

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 4 / 19

Conventional AKE Security Model

Security Notion
Mutual Authentication Secure Key Establishment
Adversarial Model
BR [BR93] BCK [BCK98] CK [CK01] eCK [LLM07]

Black-Box Model

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 4 / 19

Black-Box Model vs. Reality

Physical implementations leak secret state through side-channels: e.g., power consumption,time, radiation, sound, heat...

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 5 / 19

Modeling Side-Channel Attacks

Modeled by an abstract function f  F (leakage function family)
obtains f (sk) in addition to the normal black-box interaction Arbitrary F ? No...(e.g.: f (sk) = sk means no security!) Some restrictions are necessary

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 6 / 19

Modeling Side-Channel Attacks

Modeled by an abstract function f  F (leakage function family)

obtains f (sk) in addition to the normal black-box interaction Arbitrary F ? No...(e.g.: f (sk) = sk means no security!)
Some restrictions are necessary Solution in one go under minimal restrictions

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 6 / 19

Prior Work
Modeling Leakage Resilience Relative Leakage Model [...,AGV09, NS09, KV09, DKL09]
f : {0, 1}|sk|  {0, 1},  < |sk| (small keys, e.g.,1024 bits) Bounded Retrieval Model [Dzi06, CLW06,...]
f : {0, 1}|sk|  {0, 1},  < |sk| (increase |sk| for flexibly large ) Auxiliary Input Model [...,DKL09, KV09]
f : {0, 1}|sk|  {0, 1}, f is computationally hard-to-invert Continuous Leakage Model [...,DP08, FKPR10, JV10, BKKV10]
leakage happens per execution of protocol
Leakage-Resilient AKE CK-Based [ADW09, DHLW10] eCK-Based [MO11, ASB14, ABS14]

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 7 / 19

Our Motivation
Limitations of Prior Work

Challenge-Dependent Leakage Most disallowed to bypass the trivial attack [ADW09, DHLW10, MO11] After-the-Fact Leakage: requires split-state [ASB14, ABS14]

No Partial Leakage on

[ADW09, DHLW10, MO11, ASB14, ABS14]

Independent from ephemeral secret reveal in eCK

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 8 / 19

Our Results
A Strongly Leakage-Resilient AKE Security Model

AKE Models
[ADW09] [DHLW10]
[MO11] [ASB14] CLR-eCK

Partial Leakage Setting

Challenge-Dependent lsk esk Leakage Model

×

 × Bounded-Retrieval

×

 × Relative Leakage



×

 × Relative Leakage

 (w/ split-state)

 × Relative Leakage

(w/o split-state)

Relative Leakage

Basic Models
CK CK eCK eCK eCK

(CLR-eCK: Challenge-Dependent Leakage-Resilient eCK Model)

A Generic Construction with an Efficient Instantiation

Protocols eSIG-DH Enc-DH
MO  Our Protocol

Round 3 3 2 2 1

Communication 3·|Cer|+2·|G|+2·|Sig| 4·|Cer|+|G|+2·|CT| 4·|Cer|+9·|G|+3·|Exk| 4·|Cer|+2·|G|+2·|Sig| 4·|Cer|+6·|G|+2·|Exk|

Computation 4·Exp+2·Sgn+2·Ver 4·Exp+2·Enc+2·Dec
20·Exp 24·Exp 16 ·Exp

AKE Models [ADW09] [DHLW10] [MO11] [ASB14] CLR-eCK

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 9 / 19

Rest of the Talk
Challenge-Dependent Leakage-Resilient eCK Model Query Definition Restrictions on Leakage Query
Our Generic Construction Building Blocks Core Overview & Security Analysis An DDH-Based Instantiation
Conclusions

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 10 / 19

Our New Model: CLR-eCK

Queries by Send: activate an instance via a network message Establish: register a long-term public key on behalf of a party Reveal: session key, long-term key, ephemeral key Leakage: long-term key (f1  Fbbd-I), ephemeral key (f2  Fbbd-II)

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 11 / 19

Test Query for Challenge Session

Test Query (only once) by (guess b)

Pick b $ {0, 1}, if b = 1,

is given K, otherwise a random key

Challenge Session (sid) should be fresh

no reveal query on K

no reveal query on < lskA, eskA > or < lskB, eskB > (sid exists) no reveal query on < lskA , eskA > or lskB (sid does not exist) leakage queries satisfy the defined restrictions

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 12 / 19

Restrictions on Leakage Queries

Restrictions on Leakage Queries by

Bounded Leakage Setting Fbbd-I = {f : {0, 1}|lsk|  {0, 1}1}, where 1 < |lsk| Fbbd-II = {f : {0, 1}|esk|  {0, 1}2 }, where 2 < |esk|
Leakage Function Commitment

1.

commits F1  Fbbd-I (resp., F2  Fbbd-II) before revealing

the corresponding esk (resp., lsk)

2.

queries any f1  Fbbd-I (resp., f2  Fbbd-II) before revealing

the corresponding esk (resp., lsk) and thereafter can only ask

f1  F1 (resp. f2  F2)

K = A(lskA, eskA , Msgs) = B(lskB, eskB , Msgs)

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 13 / 19

Restrictions on Leakage Queries

Restrictions on Leakage Queries by

Bounded Leakage Setting Fbbd-I = {f : {0, 1}|lsk|  {0, 1}1}, where 1 < |lsk| Fbbd-II = {f : {0, 1}|esk|  {0, 1}2 }, where 2 < |esk|
Leakage Function Commitment

1.

commits F1  Fbbd-I (resp., F2  Fbbd-II) before revealing

the corresponding esk (resp., lsk)

2.

queries any f1  Fbbd-I (resp., f2  Fbbd-II) before revealing

the corresponding esk (resp., lsk) and thereafter can only ask

f1  F1 (resp. f2  F2)

K = A(lskA, eskA , Msgs) = B(lskB, eskB , Msgs)

still adaptive leakage?

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 13 / 19

Restrictions on Leakage Queries

Restrictions on Leakage Queries by

Bounded Leakage Setting Fbbd-I = {f : {0, 1}|lsk|  {0, 1}1}, where 1 < |lsk| Fbbd-II = {f : {0, 1}|esk|  {0, 1}2 }, where 2 < |esk|
Leakage Function Commitment

1.

commits F1  Fbbd-I (resp., F2  Fbbd-II) before revealing

the corresponding esk (resp., lsk)

2.

queries any f1  Fbbd-I (resp., f2  Fbbd-II) before revealing

the corresponding esk (resp., lsk) and thereafter can only ask

f1  F1 (resp. f2  F2)

K = A(lskA, eskA , Msgs) = B(lskB, eskB , Msgs)

still adaptive leakage?

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 13 / 19

The Generic Construction
Building Blocks Randomness Extractor Ext Pseudo-Random Function PRF, PRF Smooth Projective Hash Function (Extension) SPHF=(SPHFSetup, HashKG, ProjKG, WordG, Hash, ProjHash)

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 14 / 19

Core Component Overview

A

lskA = hk, lpkA = (hp, rA1 , rA2 ) eskA $ {0, 1}u(k), tA $ {0, 1}t3(k),

lskA = Ext1(lskA, rA1 )

eskA = Ext2(eskA, rA2 )

(wA,

x)

= FlskA WA =

(WesokrAd)G+(wFAe)sk,AX(=rAg1 )x

-(B-,-A,-W-A-,-X,-tA) (A-,B-,-W-B-,Y-,t-B-)

B

lskB = hk , lpkB = (hp , rB1 , rB2 ) eskB $ {0, 1}u(k), tB $ {0, 1}t3(k)

lskB = Ext1(lskB, rB1 )

eskB = Ext2(eskB, rB2 )

(wB WB

, y) = FlskB (eskB) = WordG(wB), Y

+ =

gFyeskB

(rB1

)

Main Idea

lsk, esk-E-xt seeds for PRFs

An additional Diffie-Hellman protocol for shared key gxy

Hash value of WA, WB + gxy E-x-t,--PRF K

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016

15 / 19

Security Analysis

Theorem The generic AKE construction is CLR-eCK-secure.

Proof Sketch

sid: challenge session chosen by , sid: matching session of sid

Case1: sid exists: either lsk or esk unknown to =Ext

(x,

y)

c


(r1,

r2)

$

Zp

×

Zp=gxy

c


r

$

ZpEx=t,PRF

K

is

random

Case2: sid does not exists: lsk unknown to

c
L=X\L replace

WA/WB with W



X

\L

S=PHF

Hash(W

, lsk)

$


r

$

Y Ex=t,PRF

K

is

random

Simulation for non-challenge session for : Ext, PRF

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 16 / 19

DDH-Based Instantiation
Let G be a group of primer order p and g1, g2  G, H1 : {0, 1}  Zp.
LDH = {(u1, u2)|r  Zp, s.t., u1 = gr1, u2 = gr2}
Witness space Zp, LDH  X = G2, Y = G .
SPHF on LDH SPHFSetup: param = (G, p, g1, g2) HashKG: hk = (1, 2, 1, 2) $ Z4p ProjKG: hp = (hp1, hp2) = (g1 1 g2 2 , g11 g22 )  G2p WordG(w = r): W = (gr1, gr2) Hash: hv = u1 1+d1 u2 2+d2 (d = H1(W, aux )) ProjHash: hv = hpr1hpd2r

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 17 / 19

Conclusions
A New Strongly Leakage-Resilient AKE Security Model Capture challenge-dependent leakage (w/o split state assumption) Capture partial leakage on the ephemeral secret (randomness)
A Generic Construction with an Instantiation Secure under the new strong model w/o RO Efficient in communication, computation and round complexity
Future Work Stronger leakage setting: Auxiliary Input, Continuous Leakage? Dealing with full leakage: capturing intermediate value leakage?

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 18 / 19

THANK YOU!

rc517@uowmail.edu.au

Rongmao Chen (UOW)

Strongly Leakage-Resilient AKE

CT-RSA 2016 19 / 19

