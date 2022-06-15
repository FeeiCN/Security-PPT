STRONGER SECURITY NOTIONS FOR DECENTRALIZED TRACEABLE
ATTRIBUTE-BASED SIGNATURES AND MORE EFFICIENT CONSTRUCTIONS
Essam Ghadafi
University College London e.ghadafi@ucl.ac.uk
CT-RSA 2015
STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

OUTLINE
1 BACKGROUND 2 NEW SECURITY MODEL 3 OUR GENERIC CONSTRUCTION 4 INSTANTIATIONS 5 EFFICIENCY COMPARISON
STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

ATTRIBUTE-BASED SIGNATURES
Attribute-Based Signatures [Maji et al. 2008]: Users have attributes ("Manager", "Finance Department", etc.). User with attributes A can sign messages w.r.t. policy P if P(A) = 1. Verifier only learns that the signature produced by someone with sufficient attributes to satisfy P.

Sig

- Finance Dept. - Manager

Chairman OR
Manager AND Finance OR
Supervisor AND Materials

Yes/No

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

1

APPLICATIONS OF ATTRIBUTE-BASED SIGNATURES
Example Applications: Attribute-Based Messaging: Recipients are assured the sender satisfies a certain policy.
Leaking Secrets: · Ring Signatures [RST01] allow a signer to sign a message on behalf of an ad-hoc group.
ABS allow more expressive predicates for leaking a secret  The whistle-blower satisfies some policy vs. the
whistle-blower is in the ring.
Many other applications: . . .

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

2

SECURITY OF ATTRIBUTE-BASED SIGNATURES
(Perfect) Privacy (Anonymity): The signature hides:
1 The identity of the signer. 2 The attributes used in the signing (i.e. how P was satisfied).
Unforgeability: A signer cannot forge signatures w.r.t. signing policies her attributes do not satisfy even if she colludes with other signers.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

3

SECURITY OF ATTRIBUTE-BASED SIGNATURES
(Perfect) Privacy (Anonymity): The signature hides:
1 The identity of the signer. 2 The attributes used in the signing (i.e. how P was satisfied).
Unforgeability: A signer cannot forge signatures w.r.t. signing policies her attributes do not satisfy even if she colludes with other signers.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

3

RELATED WORK ON ATTRIBUTE-BASED SIGNATURES
Maji et al. 2008 & 2011. Shahandashti and Safavi-Naini 2009. Li et al. 2010. Okamoto and Takashima 2011 & 2012. Gagné et al. 2012. Herranz et al. 2012.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

4

TRACEABLE ATTRIBUTE-BASED SIGNATURES
Additionally provide anonymity revocation mechanism (i.e. an opener) to enforce accountability.
Traceable Attribute-Based Signatures (TABS) [Escala et al. 2011]:
· A single attribute authority. · No judge to verify the opener's decisions.
Decentralized Traceable Attribute-Based Signatures (DTABS) [El Kaafarani et al. 2014]:
· Multiple attribute authorities. Need not be aware of each other. · Signers and attribute authorities can join at any time. · Tracing correctness is publicly verifiable.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

5

TRACEABLE ATTRIBUTE-BASED SIGNATURES
Additionally provide anonymity revocation mechanism (i.e. an opener) to enforce accountability.
Traceable Attribute-Based Signatures (TABS) [Escala et al. 2011]:
· A single attribute authority. · No judge to verify the opener's decisions.
Decentralized Traceable Attribute-Based Signatures (DTABS) [El Kaafarani et al. 2014]:
· Multiple attribute authorities. Need not be aware of each other. · Signers and attribute authorities can join at any time. · Tracing correctness is publicly verifiable.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

5

DECENTRALIZED TRACEABLE ATTRIBUTE-BASED SIGNATURES

Tracing Authority

Sig

Professor at UCL
OR IACR Member

Yes/No

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

6

SECURITY OF DTABS
Besides Correctness [El Kaafarani et al. 2014]: Anonymity: Signatures hide identity of the signer and attributes used.
Full Unforgeability: Signers cannot sign w.r.t. policies not satisfied by their individual attributes even if they collude. Covers non-frameability.
Traceability: The tracing authority can always identify the signer and prove its decision.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

7

OUR CONTRIBUTION
1 A new stronger security model for DTABS.
2 A new generic construction for DTABS with much more efficient traceability.
3 More efficient instantiations in the standard model in Type-3 bilinear groups.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

8

SHORTCOMINGS IN EXISTING MODELS
Non-Frameability: Issue: Knowledge of the secret key for any attribute allows framing an honest user In existing models:
· All attribute authorities are trusted not to frame users. · Attribute keys must be delivered securely to users.
Solution: Assign users a personal key pair Even attribute authorities cannot frame a user without knowledge of her personal secret key.
To simplify the definitions, we separate Non-frameability from Unforgeability.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

9

SHORTCOMINGS IN EXISTING MODELS
Non-Frameability: Issue: Knowledge of the secret key for any attribute allows framing an honest user In existing models:
· All attribute authorities are trusted not to frame users. · Attribute keys must be delivered securely to users.
Solution: Assign users a personal key pair Even attribute authorities cannot frame a user without knowledge of her personal secret key.
To simplify the definitions, we separate Non-frameability from Unforgeability.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

9

SECURITY OF DTABS
Non-Frameability: If all users, all attribute authorities and the tracing authority collude, they cannot frame an honest user.

Add User Add Authority Add Att. to User Corrupt User

Param, tk

Corrupt Authority Reveal U. Key Reveal A. Key Reveal Att. Key

m, , , uid, 

Sign

Adversary wins if: 1 uid is honest,  is valid and  accepted by Judge. 2 (uid, ·, m, , P) was not obtained from the Sign oracle.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

10

SHORTCOMINGS IN EXISTING MODELS FOR DTABS
Lack of Tracing Soundness: Similar to Group Signatures [Sakai et al. 2012], existing models do not prevent a signature being opened differently.
Example Scenarios: Claiming authorship of a signature by another (honest) user. A signature opens to two different users.
Example applications where this is needed: Signatures used as evidence in court. Users are rewarded for producing signatures.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

11

SECURITY OF DTABS
Tracing Soundness: A signature cannot trace to two different users.

Add User Add Authority Add Att. to User Corrupt User Corrupt Authority Reveal U. Key Reveal A. Key Reveal Att. Key

Param, tk m, , , uid1,1, uid2,2

Adversary wins if:

1  is valid and i is a valid proof for user uidi for all i  {1, 2}. 2 uid1 = uid2.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

12

OUR GENERIC CONSTRUCTION
How our construction differs from [El Kaafarani et al. 2014]: 1 Users have a personal key pair.
2 Dispense with the pseudo-attribute technique (Prove you satisfy P or have signature w.r.t. some public verification key on the message and P).
3 Replace the IND-wCCA Tag-based Encryption (used to encrypt the signer's identity) with a Robust Non-Interactive Distributed/Threshold IND-wCCA Tag-Based Encryption.  We do without the expensive zero-knowledge proofs in the opening.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

13

GENERIC CONSTRUCTION ­ BUILDING BLOCKS
Tools used:
A NIZK proof system N IZK. A tagged signature scheme T S: a signature scheme that signs a tag and a message. An existentially unforgeable (against weak chosen-message attack) signature scheme WDS. An ST-IND-wCCA robust distributed/threshold tag-based encryption scheme DT BE. A strongly unforgeable one-time signature scheme OT S.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

14

GENERIC CONSTRUCTION ­ DETAILS

Setup:
Generate (epk, esk) for DT BE and crs for N IZK. Choose CR hash functions H^ : {0, 1}  TDT BE & H : {0, 1}  MOT S . Set tk := esk and param := (crs, epk, H^, H).

User Key Generation: Generate a key pair (uvk[uid], usk[uid]) for WDS.

Attribute Authority Join: Generate a key pair(aavkaid, asskaid) for T S.

Attribute Key Generation: To generate a key skuid, for attribute  for signer uid, compute skuid,  T S.Sign(asskaid(), uvk[uid], ).

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

15

GENERIC CONSTRUCTION ­ DETAILS

Setup:
Generate (epk, esk) for DT BE and crs for N IZK. Choose CR hash functions H^ : {0, 1}  TDT BE & H : {0, 1}  MOT S . Set tk := esk and param := (crs, epk, H^, H).

User Key Generation: Generate a key pair (uvk[uid], usk[uid]) for WDS.

Attribute Authority Join: Generate a key pair(aavkaid, asskaid) for T S.

Attribute Key Generation: To generate a key skuid, for attribute  for signer uid, compute skuid,  T S.Sign(asskaid(), uvk[uid], ).

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

15

GENERIC CONSTRUCTION ­ DETAILS

Setup:
Generate (epk, esk) for DT BE and crs for N IZK. Choose CR hash functions H^ : {0, 1}  TDT BE & H : {0, 1}  MOT S . Set tk := esk and param := (crs, epk, H^, H).

User Key Generation: Generate a key pair (uvk[uid], usk[uid]) for WDS.

Attribute Authority Join: Generate a key pair(aavkaid, asskaid) for T S.

Attribute Key Generation: To generate a key skuid, for attribute  for signer uid, compute skuid,  T S.Sign(asskaid(), uvk[uid], ).

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

15

GENERIC CONSTRUCTION ­ DETAILS

Setup:
Generate (epk, esk) for DT BE and crs for N IZK. Choose CR hash functions H^ : {0, 1}  TDT BE & H : {0, 1}  MOT S . Set tk := esk and param := (crs, epk, H^, H).

User Key Generation: Generate a key pair (uvk[uid], usk[uid]) for WDS.

Attribute Authority Join: Generate a key pair(aavkaid, asskaid) for T S.

Attribute Key Generation: To generate a key skuid, for attribute  for signer uid, compute skuid,  T S.Sign(asskaid(), uvk[uid], ).

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

15

GENERIC CONSTRUCTION ­ DETAILS

Signing: To sign m w.r.t. P: 1 Choose a fresh key pair (otsvk, otssk) for OT S. 2 Cdtbe  DT BE.Enc(epk, H^(otsvk), uvk[uid]). 3   WDS.Sign(usk[uid], H^(otsvk)). 4 Produce a proof  of (A, , uvk[uid]) that:
1 Cdtbe is formed correctly. 2  is valid. 3 Has attributes A s.t. P(A) = 1
 Has a valid tagged signature on (uvk[uid], ) for each   A.
5 Compute ots  OT S.Sign(otssk, (H(m, P), , Cdtbe, otsvk)). The signature is  := (ots, , Cdtbe, otsvk).

Tracing:
Use esk to produce a decryption share  of Cdtbe and recover vkuid. Return (uid, ) if it matches any uvk[uid] or (0, ) otherwise.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

16

GENERIC CONSTRUCTION ­ DETAILS

Signing: To sign m w.r.t. P: 1 Choose a fresh key pair (otsvk, otssk) for OT S. 2 Cdtbe  DT BE.Enc(epk, H^(otsvk), uvk[uid]). 3   WDS.Sign(usk[uid], H^(otsvk)). 4 Produce a proof  of (A, , uvk[uid]) that:
1 Cdtbe is formed correctly. 2  is valid. 3 Has attributes A s.t. P(A) = 1
 Has a valid tagged signature on (uvk[uid], ) for each   A.
5 Compute ots  OT S.Sign(otssk, (H(m, P), , Cdtbe, otsvk)). The signature is  := (ots, , Cdtbe, otsvk).

Tracing:
Use esk to produce a decryption share  of Cdtbe and recover vkuid. Return (uid, ) if it matches any uvk[uid] or (0, ) otherwise.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

16

GENERIC CONSTRUCTION ­ SECURITY
Anonymity: · Zero-Knowledge of N IZK. · ST-IND-wCCA of DT BE. · Unforgeability of OT S. · Collision-Resistance of H and H^.
Unforgeability: · Soundness of N IZK. · Unforgeability of T S and OT S. · Collision-Resistance of H and H^.
Non-Frameability: · Soundness of N IZK. · Unforgeability of WDS and OT S. · Collision-Resistance of H and H^.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

17

GENERIC CONSTRUCTION ­ SECURITY
Anonymity: · Zero-Knowledge of N IZK. · ST-IND-wCCA of DT BE. · Unforgeability of OT S. · Collision-Resistance of H and H^.
Unforgeability: · Soundness of N IZK. · Unforgeability of T S and OT S. · Collision-Resistance of H and H^.
Non-Frameability: · Soundness of N IZK. · Unforgeability of WDS and OT S. · Collision-Resistance of H and H^.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

17

GENERIC CONSTRUCTION ­ SECURITY
Anonymity: · Zero-Knowledge of N IZK. · ST-IND-wCCA of DT BE. · Unforgeability of OT S. · Collision-Resistance of H and H^.
Unforgeability: · Soundness of N IZK. · Unforgeability of T S and OT S. · Collision-Resistance of H and H^.
Non-Frameability: · Soundness of N IZK. · Unforgeability of WDS and OT S. · Collision-Resistance of H and H^.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

17

GENERIC CONSTRUCTION ­ SECURITY Traceability: · Soundness of N IZK. · Unforgeability of T S.
Tracing Soundness: · Decryption Consistency of DT BE.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

18

GENERIC CONSTRUCTION ­ SECURITY Traceability: · Soundness of N IZK. · Unforgeability of T S.
Tracing Soundness: · Decryption Consistency of DT BE.

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

18

INSTANTIATIONS
N IZK Groth-Sahai proofs [GS08] secure under SXDH.
T S The re-randomizable structure-preserving scheme [Abe et al. 2011] (interactive assumption) or the strongly unforgeable [Abe et al. 2011] scheme (secure under q-AGHO).
DT BE [Ghadafi 2014] (secure under XDLIN in G1 or G2).
WDS The Weak Boneh-Boyen scheme (secure under q-SDH).
OT S The full Boneh-Boyen scheme (secure under q-SDH).

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

19

EFFICIENCY COMPARISON

Scheme [EHM11] [EGK14]
Inst. I Inst. II

Signature Size

G|P|++7

34·|P|+28
G1

+

32·|P|+32
G2

+

+1
Zp

G217·|P|+19

+

G222·|P|+15

+

+3
Zp

30·|P|+18
G1

+

30·|P|+16
G2

+

+3
Zp

Model ROM STD STD STD

Setting Composite
Prime Prime Prime

TABLE: Signature Size

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

20

EFFICIENCY COMPARISON

Scheme
[EHM11] [EGK14]
Inst. I Inst. II

Model
ROM STD STD STD

Setting
Composite Prime Prime Prime

Size
N/A G31 × G42
G22 G21

Tracing Compute
N/A 4EG1 + 6EG2
2EG2 2EG1

Verify N/A 34P 4P 4P

TABLE: Tracing

STRONGER SECURITY NOTIONS FOR DECENTRALIZED . . .

21

THE END
Thank you for your attention! Questions?
DECENTRALIZED TRACEABLE ATTRIBUTE-BASED SIGNATURES

SESSION ID: CRYP-F01
Re-encryption Verifiability: How to Detect Malicious Activities of a Proxy in Proxy Re-encryption

Satsuya Ohata1,3, Yutaka Kawai2, Takahiro Matsuda3,
Goichiro Hanaoka3, Kanta Matsuura1
1. The University of Tokyo, Japan 2. Mitsubishi Electric, Japan
3. National Institute of Advanced Industrial Science and Technology, Japan
(Cryptology ePrint Archive: Report 2015/112)

#RSAC

#RSAC
Our Result
 We introduce a new functionality called "re-encryption verifiability" in proxy re-encryption (PRE).
- To check whether a proxy works correctly or not
 We show a new CCA security definition of PRE.
- Stronger definition than previous works
 We prove that previous generic construction[HKK+12] of a PRE satisfies our new stronger security definition.
2

#RSAC
Background and Motivation
3

Proxy Re-encryption (PRE)
Proxy can change the destination of a ciphertext without decrypting it.

#RSAC
5.

3.

1.

REnc

4.

Receiver B

2.
Sender

0.
Proxy

Re-Enc Key
0.
Receiver A

Types of PRE
Single-Hop

#RSAC
Multi-Hop

Uni-Directional

Bi-Directional

In this work, we consider a Single-hop Uni-directional PRE.

#RSAC
Second-Level and First-Level Ciphertext

Second-Level

Ciphertext

REnc

(small c)

First-Level Ciphertext (capital C)
Receiver B

Sender

Proxy

Receiver A

Problem of Previous Works
[LV08] Libert et al. "Unidirectional Chosen-Ciphertext Secure Proxy Re-encryption", (PKC'08). [HKK+12] Hanaoka et al. "Generic Construction of Chosen Ciphertext Secure Proxy Re-Encryption", (CT-RSA'12).

#RSAC

Adversary

(pkj, C) m//test

Dec1
Challenger If Dec1(skj, C) = {m0,m1}, then return test.

Can we avoid this Replayable CCA-like security definition?

#RSAC
Why RCCA?

 There exists an inevitable attack in PRE.

3.

1. pk*

2.

Cj REnc(rk* j, c*)

Challenge

b {0,1} c* Enc(pk*,mb)

4. 5.
b'(=b)

Dec1

However, the adversary might succeed in generating Cj which satisfies

Dec1(skj,Cj){m0,m1} without following the above procedure.

8

#RSAC
Verifiability of Re-encryption

 To solve this problem, we introduce a new functionality that we call "re-encryption verifiability".

(pki,pkj,skj,c,C)
REncVer

If C is a re-encrypted ciphertext of c, this REncVer algorithm outputs 1. Otherwise, it outputs 0.

1/0
 By using this algorithm, the challenger can distinguish whether the first-level ciphertext which is queried to Dec1 oracle is a reencryption of the challenge ciphertext or not.

9

#RSAC
Practical Merit of Re-encryption Verifiability
 A user who receives a first-level ciphertext can detect malicious activities of a proxy. (We assume the situation in which receiver B can also get a second-level ciphertext.)
is not a re-encryption of !
Receiver B

Sender

Proxy

Receiver A
10

#RSAC
Note
 In CT-RSA2013, Isshiki et al. showed new CCA security definitions of PRE and argued that their definitions are stronger than those of Hanaoka et al.'s definitions in CT-RSA2012. However, this is not correct.
- They used the "knowledge of secret key assumption". - They showed a counterexample scheme. They argued that their counterexample scheme is secure under the Hanaoka et al.'s definitions, but not secure under their definitions. However, this counterexample scheme is also not secure under the Hanaoka et al.'s definitions.
 These two definitions are incomparable.
11

#RSAC
Verifiable Proxy Re-encryption

#RSAC
Syntax of Verifiable PRE (VPRE)

1k

(pk,m)

(ski,pkj)

(rki j,ci)

KG

Enc

RKG

REnc

(pk,sk)

c

Rki j

Cj

(pki,pkj,skj,ci,cj)

(skj,C)

(ski,c)

REncVer

Dec1

Dec2

1/0 New!!

m/

m/

#RSAC
Security

 We consider three security definitions. 1. CCA security of second-level ciphertexts 2. CCA security of first-level ciphertexts 3. Soundness of Re-encryption Verification
- If REncVer(,,,c,C) outputs 1, C is guaranteed to be a re-encryption of c.

1REncVer(pkA, pkA, skB, , )

is a re-encryption of !

Receiver B

14

#RSAC
Our Contribution 1

 We prove that a PRE scheme secure under our security definitions of VPRE is secure under the Hanaoka et al.'s security definitions of standard PRE.
- That is, our new definitions are stronger than Hanaoka et al.'s definitions.

Secure under our definitions

Automatically

Secure under the Hanaoka et al.'s definitions

15

#RSAC
Construction

#RSAC
Our Contribution 2
 We extend Hanaoka et al.'s PRE scheme and prove that it satisfies our new definitions of VPRE.
- The algorithms other than REncVer is exactly the same as Hanaoka et al.'s generic construction of a standard PRE scheme.

CCA-Secure PKE
sEUF-CMA Secure Signature
CCA-secure Re-splittable Threshold PKE

CCA-Secure Verifiable PRE

#RSAC
Preliminaries: Threshold PKE (TPKE)

Example: (2,3)-TPKE TEnc

Message

Ciphertext

TShDec tsk1
tsk2

TCom
Message

tsk3
Secret key shares
18

Dec. shares

#RSAC
Preliminaries: Re-splittable TPKE (RS-TPKE)

Standard TPKE

Re-splittable TPKE

(defined by Hanaoka et al.)

(1k,n,t)

(1k,t,n)

tsk

TKG (tpk, tsk1,...,tskn, tvk)

TKG (tpk, tsk)

TSplit (tsk1,...,tskn, tvk)

 In a re-splittable TPKE, a secret key can be split many times under the same public key. This time, we need (2,2)-RS-TPKE.

19

Construction(1/3)

. Enc
Generate ciphertext for receiver A.

+

=

Sender

#RSAC
.KG
Generate pk and sk of PKE.

. Dec2
Generate decryption
shares by using a tsk.

+

=

+=

+=

Receiver B
. KG Generate tpk and tsk's of RS-TPKE.

Receiver A
20

Construction(2/3) Decrypt

6. Dec1
and check the validity of

#RSAC

. REnc
Check the validity of

and check the validity of using a .
+ =, + =,

by using a signature

.

Generate a decryption share.

+

=

+ =.

Receiver B
. RKG
Encrypt for the receiver B.

=

,,

,

Guarantee the validity of by using signature .

Sender

Proxy

Re-Enc Key
21

Receiver A

#RSAC
Construction(3/3)

Decrypt

7. REncVer
and obtain etc.

If all decryption shares

, and

are valid, and if

is the same

ciphertext as the input of REncVer algorithm, then output 1. Otherwise, output 0.

Receiver B

 In our construction, receiver B can recover the second-level ciphertext. Therefore, the functionality of re-encryption verifiability can be achieved by checking the equality.

22

#RSAC
Conclusion and Future Work

#RSAC
Conclusion and Future Work
 We introduced a new functionality called "re-encryption verifiability" in proxy re-encryption (PRE).
- enable to avoid the RCCA-like security definitions - enable to detect malicious activities of a proxy
 We showed security definitions and a construction.
- stronger definitions than previous works - generic construction based on re-splittable threshold PKE
 Constructing an efficient concrete construction is a future work.

SESSION ID: CRYP-F01
Thank you for your attention!
Re-encryption Verifiability: How to Detect Malicious Activities of a Proxy in Proxy Re-encryption
(Cryptology ePrint Archive: Report 2015/112)
Satsuya Ohata, Yutaka Kawai, Takahiro Matsuda, Goichiro Hanaoka, Kanta Matsuura
#RSAC

