SESSION ID: CRYP-F03
Delegatable Anonymous Credentials from Mercurial Signatures

Elizabeth C. Crites*
Ph.D. Candidate in Mathematics Brown University

Anna Lysyanskaya
Professor of Computer Science Brown University

#RSAC

Certification Authority (CA) 1
Alice
2 Bob

#RSAC

1 Alice

2 Bob

3

Carol

Certificate: signatures & public keys

2

#RSAC
Prior Work on Delegatable Anonymous Credentials
[CL06]: proof of concept [BCC+09]: efficiency improvement but not practical [CKLM13]: stronger security but as inefficient as [BCC+09] [CDD17]: no anonymity in delegation
3

#RSAC
Why is our solution interesting?
4

Mercurial Signatures

#RSAC
Usual Signatures [GMR88]
Sign(pk,sk,M)  Verify(pk,M, )  Accept/Reject
Correctness: M = M
Verify(pk,M, )  Accept
Security: Usual (EUF-CMA).
6

Usual Signatures: Security

EUF-CMA:

Oracle knows sk

Mi
Adversary knows pk

#RSAC

Adversary wins if:

M*  Mi i,

i

Verify(pk, M*, *) = Accept

( M*,*)

7

#RSAC
Signatures on Equivalence Classes [FHS14]
Sign(pk,sk,M)  Verify(pk,M, )  Accept/Reject
Correctness: M M
Verify(pk,M, )  Accept
Security: [FHS14] Construction: (A,B,C)  (rA,rB,rC)
8

#RSAC
Signatures on Equivalence Classes: Security

Oracle knows sk
Mi

Adversary wins if:

M*  Mi i,

i

Verify(pk, M*, *) = Accept

Adversary knows pk

( M*,*)

9

#RSAC
Mercurial Signatures (Our Work)
Sign(pk,sk,M)  Verify(pk,M, )  Accept/Reject
Correctness: M  M, pk  pk
Verify(pk,M, )  Accept
Security:
10

#RSAC
Mercurial Signatures: Security

Oracle knows sk
Mi
Adversary knows pk

Adversary wins if:

M*  Mi i,

i

Verify(pk*, M*,*) = Accept

pk*  pk

( M*,*)

11

#RSAC
Mercurial Signatures: Construction
Bilinear groups M = (m1, m2, ..., m), pk = (X1, X2, ..., X) M = rM = (rm1, rm2, ..., rm), pk = spk = (sX1, sX2, ..., sX) Transformation (M,pk,) (M,pk,) s.t. M, M unlinkable and pk, pk unlinkable (important for anonymity)
12

#RSAC
Our Results
1. Mercurial signatures for the equivalence relation (A,B,C)  (rA,rB,rC)
that are secure in the generic group model.
13

Delegatable Anonymous Credentials

Certification Authority (CA)

Alice

1

pk_0

1

pk_A

pk_A

2

2

Bob

pk_B

pk_B

3
Carol pk_C
15

#RSAC
Carol's Certificate: {pk_A, pk_B, pk_C,
1, 2, 3 }

#RSAC
Our Results
2. (Certain) Mercurial Signatures

Delegatable Anonymous Credentials
First direct construction. Multi-authority credentials.
contact info: elizabeth_crites@brown.edu
16

