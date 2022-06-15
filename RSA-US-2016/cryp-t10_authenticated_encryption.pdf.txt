Introduction Our Contribution
Conclusions

INT-RUP Analysis of Block-cipher Based Authenticated Encryption Schemes
Avik Chakraborti, Nilanjan Datta and Mridul Nandi
Indian Statistical Institute, Kolkata
CTRSA-2016, San Francisco, USA

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions
Outline of the talk
1 Introduction. 2 Our Contribution. 3 Conclusion

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions
1 Introduction 2 Our Contribution 3 Conclusions

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions
Authenticated Encryption (AE)
Why AE? Privacy of Plaintext. Authenticity of the plaintext/ ciphertext and associated data.
More Formally.... Tagged-encryption : AE.enc : M × D × N × K  (C × T ) Verified-decryption : AE.dec : (C × T ) × D × N × K  M 

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions
Intigrity Security AE
Intigrity Security of AE Integrity Security of AE when adversary is given Encryption and Verification oracle.
Encryption Query: (Ni , Di , Mi ) (Ci , Ti ) Verificationtion Query: (Ni , Di , (Ci , Ti ))  Mi / 
Advint-ctxt (A) = |Pr [K R K : AEK ,VK =]|

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions
INT-RUP Security and rate of Block Cipher based AE

INT-RUP Security of AE Construction (Andreeva et.al.) Adversary is given both Encryption, Decryption and Verification oracle. Decryption Query: (Ni , Di , Ci )  Mi (no Ti in the query) Advint-rup(A) = |Pr [K R K : AEK ,DK ,VK =]| Used for low-end devices with limited buffer.
Rate of a Construction Messages blocks processed per block-cipher call. Rate-1 means efficient construction.

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Affine Mode AE

Introduction Our Contribution
Conclusions

MK

MK

MK

E[1, .]

U1 1

V1

E[2, .]

U2 2

MK

V2

V1

· · · ...

Ul+1
E[l + 1, .]

l+1

V1 Vl+c-1

... E[l + c + 1, .]

· · · l+c Vl+c

Vl

T

C

Figure : Structure of Affine Mode AE Schemes

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions
Affine Mode AE - Encryption

Matrix Representation







L

E . 

Y

M Y
= Ytag

 =  X  =

X Xtag C

Z= T



Encryption Matrix Representation E : encryption matrix, L : key vector, M is message vector Y : Intermediate output from  during M Processing Y tag : Intermediate output from  during tag Processing X : Intermediate input to  during M Processing X tag Intermediate input to  during tag Processing C : ciphertext vector, T : tag vector

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

1 Introduction

2 Our Contribution

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB:

A

rate

3 4

INT-RUP

secure

construction

3 Conclusions

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Our Contribution

Introduction Our Contribution
Conclusions

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

Result 1. rate-1 Affine mode Authenticated Encryption mode is INT-RUP insecure.
Significance of the Result Guideline: To achieve INT-RUP security, one has to compromise efficiency.

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Our Contribution

Introduction Our Contribution
Conclusions

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

Result 2.

CPFB

(rate

3 4

)

is

INT-RUP

insecure.

Questions

How much efficiency we have to loose to get INT-RUP

security?

Can

we

have

an

INT-RUP

secure

scheme

with

rate

3 4

?

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Our Contribution

Introduction Our Contribution
Conclusions

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

Result 3.

m-CPFB

(rate

3 4

)

is

INT-RUP

insecure.

Significance INT-RUP comes with small degrade in efficiency. "rate-1" - a borderline criteria for INT-RUP security.

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

INT-RUP Attack

Introduction Our Contribution
Conclusions

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

Queries of INT-RUP Adversary Encryption Query: (N, AD, M0 = (M10, M20, . . . , Ml0)). Let, C 0 = (C10, C20, . . . , Cl0, T 0) be the tagged ciphertext. Unverified Plaintext Query: (N, AD, C 1 = (C11, C21, . . . , Cl1)). Let M1 = (M11, M21, . . . , Ml1) be the corresponding plaintext. Forged Query: (N, AD, C f = (C1f , C2f , . . . , Clf ), T f ), which realizes a  = (1, . . . , l ) sequence.
C f realizes a  = (1, . . . , l )-sequence i  l , Uif = Uii and i > l , Uif = Ui0.

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

Structure of Decryption Matrix

During Message Process

Observed by Enc and Dec queries

C ij , V ij Uij and Mij are observed differences.

D12 D13 D32 D33

·

C ij V ij

=

U ij M ij

, i = 0, j  {1, f }

During Tag Process

C

0f

,

V

0f

,

V

0f tag

U

0f tag

,

and T 0f

are observed differences.

D22 D23 D24 D42 D43 D44

 C 0f  ·  V 0f  =
Vt0afg

Ut0afg T 0f

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

INT-RUP Attack (Construction of Forged Query)

Step I: Find V 01 V 01 = D3-31(M01 + D32C 01)
Step II: Find C 0f in terms of 

C 0f

= D1-21.(U0f + D32V 0f ) = D1-21(.U01 + D32.V 01) = D.

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

INT-RUP Attack (Construction of Forged Query)

Step III: Find  that makes Ut0afg = 0 Solve the following set of equations to find a :
D22C 0f + D23V 0f = 0
This equation has at least one solution as long as l > (c - 1).n
Step IV: Find C 0f and T 0f Put  =  in the following equations:
C 0f = D1-21.D. T 0f = D42C0f + D43V0f

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Revisit CPFB

Introduction Our Contribution
Conclusions

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

Encryption and Tag Genration of CPFB

0 0 
X1

M1||1 0 
X2

E[1]
96 32
Y1 Z1
M1 

E[2]

96

32

Y2

Z2 M2 

C1

C2

Ml-1||l - 1 0 
Xl

···

E[ ]

96 32
Yl Zl
Ml 

Cl

Ml||l 0  Xl+1

E[ +1]

l i=2

Yi

||Zi

XA

Yl+1||Zl+1 
ZM L
ZM  L  XA

E0

T

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions
INT-RUP Attack on CPFB

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

INT-RUP Attack on CPFB

1 Encryption query: (N, A, M0), |M0| = l = 129. Let C 0 be the ciphertext

2 Unverified Plaintext decryption query: (N, A, C 1) of length l. Let, M1 be the corresponding plaintext.

3 Compute Y values: Y10, · · · , Yl0 and Y11, · · · , Yl1 from the two queries (by M0 + C 0 and M1 + C 1).

4 Find the -sequence:  = (1, . . . , l ), with 1 = 0 such that,

l i

=2

(Yii

||Zii

)

=

l i

=2

(Yi0

||Zi0).

Expect 232-many such -sequences.

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions
INT-RUP Attack on CPFB

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

INT-RUP Attack on CPFB
Perform the following for all such -sequence: 1 Set C1f = C10. For all 1 < i < l , set Cif = Cii if i-1 = i and Cii + Yi0 + Yi1, otherwise. 2 Set Clf = Cl0 if l = 0. Else, set Clf = Cl0 + Yl0 + Yl1. 3 Return (C1f , C2f , · · · , Clf , T 0) as forged Ciphertext.

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

Building

an

INT-RUP

Secure

rate-

3 4

Construction

Potential Weakness of CPFB 1 Y i values can be observed. Only Z i -values are unknown. 2 Z i has only 32-bit entropy on the Tag.
Requirement of the New Construction Ensure 128-bit entropy of Z -values on the tag. Ensure at-least 4 different Z -values for 2 messages of same length.

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions
mCPFB: modified CPFB

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

Introduce ECC Code Expand M = (M1, . . . , Ml ) by a Distance 4 Error Correcting Code ECCode :
ECCode(M) = (M1, . . . , Ml , Ml+1, Ml+2, Ml+3) (Ml+1, Ml+2, Ml+3) = V(3,l) · M
Produce 128-bit entropy of Z -values during Tag Generation: Update Z M as follows: ZM = V(4,l+3) · (Z2, Z3, · · · , Zl+3, Zl+4)  (032||(Y2  · · ·  Yl+3))

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions
mCPFB: modified CPFB

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

Changes in the keys 0 is used as the masking key only. 1 is used as block-cipher key for AD processing. 1, . . . , -2 is used as block-cipher keys for message processing. -1 is used as block-cipher key for tag and producing L-values.

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

INT-RUP Security of mCPFB

Claim 1

Consider the function f that takes N, I and i as input and outputs

O such that O = E[i](I ||(i mod 232) + 0) where

[i] = EK (N||j||l), j =

i 232

.

f

is assumed to have (q,

)-PRF

security where is believed to achieve beyond birthday security.

INT-RUP advantage
f : (qe + qr , )-PRF. Any adversary A with qe many encryption query and qr many unverified plaintext queries, one forgery attempts, has the advantage:

AdvminCt PruFpB (A)



5 2128

+

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Proof Sketch

Introduction Our Contribution
Conclusions

INT-RUP Insecurity of Affine mode AE

INT-RUP Insecurity of CPFB

mCPFB: A

rate

3 4

INT-RUP secure construction

Argument for Different Cases
(Case A) i, N = Ni : Through randomness of -1. (Case B)  unique i N = Ni , T  = Ti : Through randomness of -1. (Case C)  unique i N = Ni , T  = Ti , |Ci | = |C |: Through randomness of Zi 's. (Case D)  unique i N = Ni , T  = Ti , |Ci | = |C |: Through randomness of -1.

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions
1 Introduction 2 Our Contribution 3 Conclusions

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Conclusions

Introduction Our Contribution
Conclusions

INT-RUP attack on any "Rate-1" affine AE mode

INT-RUP

attack

on

a

"Rate-

3 4

"

AE

scheme

CPFB

Proposal of mCPFB : an INT-RUP secure scheme

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

Introduction Our Contribution
Conclusions
Thank you

Avik Chakraborti, Nilanjan Datta and Mridul Nandi

INT-RUP Analysis of Block-cipher Based Authenticated Encryptio

From Stateless to Stateful: Generic Authentication and Authenticated Encryption
Constructions with Application to TLS
Colin Boyd1 Britta Hale1 Stig Frode Mjølsnes1 Douglas Stebila2
1Norwegian University of Science and Technology 2Queensland University of Technology
1 March 2016

authentication protocols What is data authentication?

Sender A

m
Receiver B
Is m from A?

Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

authentication protocols What is data authentication?

Sender A

m

m

Receiver B
Is m from A? Has m been modified?

Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

achieving authentication
· Message Authentication Code (MAC) · HMAC, etc... message MAC tag
· Signatures · DSA, Elliptic Curve DSA, etc...
message signature
· Authenticated Encryption with Associated Data (AEAD) · Galois Counter Mode (GCM), etc... ciphertext
Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

authentication hierarchy

Example

Sender

TLS

Level 4 m0, m1, m2, m3, m4, m5

802.11 Level 3 m0, m1, m2, m3, m4, m5

DTLS* Level 2 m0, m1, m2, m3, m4, m5

DTLS Level 1 m0, m1, m2, m3, m4, m5

Receiver
Auth., No Replays, Strictly Incr., No Drops
m0, m1, m2, m3, m4, m5
Auth., No Replays, Strictly Incr.
m0, m2, m3, m5
Auth., No Replays
m3, m0, m5, m2
Authentication only
m3, m5, m3, m2

Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

secure channel variations

Level 1 Canetti­Krawczyk 2001 Generic network channel

Level 4 Jager­Kohlar­Schäge­
Schwenk 2012

protocol description

Level 4

Bellare­Kohno­Namprempre 2002

Level 4

INT-SFCTXT from INT-CTXT

Krawczyk­Paterson­Wee 2013

Level 4

Level 1

Canetti­Krawczyk 2001

Paterson­ Network authentication protocol

Ristenpart­

Shrimpton 2011

Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

hierarchy of authentication

Expau,tA hi ():

Oracle Send(m):

Oracle Recv(c):

$ 1: k  Kgn() 2: stE  , stD   3: u  0, v  0 4: r  0 5: ASend(·),Recv(·)() 6: return r

1: u  u + 1
2: (sentu, stE)  Snd(k, m, stE) 3: return sentu to A

1: v  v + 1
2: rcvdv  c 3: (m, , stD)  Rcv(k, c, stD) 4: if ( = 1)  condi then 5: r  1
6: return r to A
7: end if
8: return 

1 Basic authentication:
cond1 = ( w : c = sentw )
2 Basic authentication, no replays:
cond2 = ( w : c = sentw )  (w < v : c = rcvdw )
3 Basic authentication, no replays, strictly increasing:
cond3 = ( w : c = sentw )  (w, x, y : (w < v)  (sentx = rcvdw )  (senty = rcvdv )  (x  y))
4 Basic authentication, no replays, strictly increasing, no drops:
cond4 = (u < v)  (c = sentv )

Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

hierarchy of aead

Expae,aA di -b ():

$ 1: k  Kgn()

2: stE  , stD   3: u  0, v  0

4: phase  0

5: b

$ 

AEncrypt(·),Decrypt(·) ()

6: return b

Oracle Encrypt(l, ad, m0, m1):

1: u  u + 1

2: (sent.c(0), st(E0))



E(k, l, ad, m0, stE)

3: (sent.c(1), st(E1))



E(k, l, ad, m1, stE)

4: if sent.c(0) =  or sent.c(1) = 

then

5: return 

6: end if

7: (sent.adu, sent.cu, stE)

:=

(ad, sent.c(b), st(Eb)) 8: return sent.cu

Oracle Decrypt(ad, c):
1: if b = 0 then 2: return  3: end if 4: v  v + 1 5: rcvd.cv  c 6: (ad, m, , stD)
 D(k, ad, c, stD) 7: if ( = 1)  condi then 8: phase  1 9: end if 10: if phase = 1 then 11: return m 12: end if 13: return 

1 Basic authenticated encryption:
cond1 = ( w : (c = sent.cw )  (ad = sent.adw ))
2 Basic authenticated encryption, no replays:
cond2 = ( w : (c = sent.cw )  (ad = sent.adw ))  (w < v : c = rcvd.cw )
3 Basic authenticated encryption, no replays, strictly increasing:
cond3 = ( w : (c = sent.cw )  (ad = sent.adw ))  (w, x, y : (w < v)  (sent.cx = rcvd.cw )  (sent.cy = rcvd.cv )  (x  y))
4 Basic authenticated encryption, no replays, strictly increasing, no drops:
cond4 = (u < v)  (c = sent.cv )  (ad = sent.adv )

Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

secure channels with TLS

· Paterson­Ristenpart­Shrimpton 2011



MEE­TLS encoding ­ CBC (message len.) + (tag len.) > (block len.) -8


TLS satisfies Level 1 AEAD



Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

secure channels with TLS
Authenticated and Confidential Channel Establishment (ACCE)

· Jager­Kohlar­Schäge­Schwenk 2012
Stateful length-hiding AEAD at Level 4

ACCE security for TLS ( Suites: TLS-DHE )

· Krawczyk­Paterson­Wee 2013
 Stateful length-hiding AEAD at Level 4 
Constrained chosen ciphertext security


ACCE security for TLS Suites: TLS-RSA,
TLS-CCA, TLS-DH, TLS-DHE

Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

implications between authentication levels
stE and stD:
· stE : stE.substate := stE, where stE is the state in , stE.counter · stD : stD.substate := stD, where stD is the state in , stD.status, stD.sqnlist

Kgn ():

Rcv (k, c, stD):

1: return .Kgn() Snd (k, m, stE):

1: if stD.status = failed then

2:

return (, 0, stD)

3: end if

1: (c, stE.substate)  .Snd(k, Ecd(stE.counter, m), stE.substate)
2: stE.counter  stE.counter + 1 3: return (c, stE)

4: (m, , stD.substate)

 .Rcv(k, c, stD.substate) 5: if  = 1 then

6:

(sqn, m, )  Dcd(stD.sqnlist, m)

7: end if

8: if ( = 0)  TESTi then

9:

stD.status = failed

10:

return (, 0, stD)

11: end if

12: stD.sqnlist = stD.sqnlist||sqn 13: return (m, , stD)

· Basic authentication, no replays:

TEST2 = (j : sqn = stD.sqnlistj )
· Basic authentication, no replays, strictly increasing:

TEST3 = (j : sqn  stD.sqnlistj )
· Basic authentication, no replays, strictly increasing, no drops:

TEST4 = (j : sqn  stD.sqnlistj )  (sqn = max{stD.sqnlistj } + 1)

Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

analysis method
Computational Analysis: Complexity-theoretic reduction proofs · Protocol specification · Adversary capabilities · Adversary winning conditions
Security is reducible to that of an underlying hard problem
Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

implications between authentication levels

Theorem

Let  be a secure level-1 authentication scheme and Coding be an authentication

encoding scheme with collision-resistant encoding. Let i  {2, 3, 4}. Then

i = P (, Coding, TESTi) is a secure level-i authentication scheme. Specifically, let A be an adversary algorithm that runs in time t and asks qs Send queries and qr Recv

queries, and let q = qs + qr. Then there exists an adversary B that runs in time

tB



t

and

asks

no

more

than

qB

=

1 2

qs

(qs

- 1)

queries,

and

an

adversary

F

that

runs in time tF  t and asks qF = q queries, such that

AdvaPu(thi,Coding,TESTi)(A)  Advauth1 (F ) + AdvcEocldlision(B) .

Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

Implications between Authentication Levels

Level 4: Level 3 + No Drops

Received sqn is exactly the next expected one

Level 3: Level 2 + Increasing Received sqn is strictly greater than the last received

Level 2: Level 1 + No Replay

Sequence number sqn does not repeat

Level 1: Basic Auth.

Sequence number can be included implicitly or explicitly

Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

authentication levels applied ­ TLS

Level 4: Level 3 + No Drops KPW'13 ACCE security for TLS JKSS'12
Level 3: Level 2 + Increasing

Level 2: Level 1 + No Replay

PRS'11

MEE­TLS­CBC

Level 1: Basic Auth.

Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

authentication levels applied
· Protocol Analysis · Selection of appropriate authentication experiment
· Building Authentication Protocols · Encoding and checking sequence numbers to achieve desired level
Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

Questions

?, ?, ?, ?, ?

_____

Britta Hale | CT-RSA 2016 Authentication and Authenticated Encryption Constructions

