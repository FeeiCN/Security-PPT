SCIENCE

PA S S I O N

TECHNOLOGY

Non-Interactive Plaintext (In-)Equality Proofs and Group Signatures with Verifiable Controllable Linkability
Olivier Blazy1, David Derler2, Daniel Slamanig2, Raphael Spreitzer2 1 Universite´ de Limoges, XLim, France 2 IAIK, Graz University of Technology, Austria
CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at

Group Signature Schemes [CvH91]
Group

www.iaik.tugraz.at

Signer i (xi)

Group signature 

2

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Signed by someone of group!
Verifier (pk)

Group Signature Schemes [CvH91]

Group

Group Manager (pk)

Issuer (mik)

www.iaik.tugraz.at

Signer i (xi)

Group signature 

2

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Verifier (pk)

Group Signature Schemes [CvH91]

Group

Group Manager (pk)

Issuer (mik)

www.iaik.tugraz.at

Signer i (xi)

Opener (mok) Group signature 

2

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Verifier (pk)

Controllable Linkability [HLhC+11, SSU14]
Group Manager (pk)

www.iaik.tugraz.at

Produced by same signer?

Issuer (mik)

Verifier (pk) (1, M1),(2, M2)

3

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Opener (mok) No idea who
signed them!
Linker (mlk)

Controllable Linkability [HLhC+11, SSU14]
Group Manager (pk)

www.iaik.tugraz.at

But can I trust the Linker?

Issuer (mik)

Verifier (pk) (1, M1),(2, M2)

3

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Opener (mok) No idea who
signed them!
Linker (mlk)

Verifiable Controllable Linkability
Group Manager (pk)

www.iaik.tugraz.at

Prove it!

Issuer (mik)

Verifier (pk) (1, M1),(2, M2)

4

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Opener (mok) Still no idea who
signed them!
Linker (mlk)

Verifiable Controllable Linkability
Group Manager (pk)

www.iaik.tugraz.at

Prove it!

Issuer (mik)

Verifier (pk) (1, M1),(2, M2)

Opener (mok) Still no idea who
signed them!

Linker (mlk)

Primitive to prove plaintext (in-)equality

4

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Contributions

www.iaik.tugraz.at

1. Model generic proof system for plaintext (in-)equality

5

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Contributions

www.iaik.tugraz.at

1. Model generic proof system for plaintext (in-)equality 2. Efficient instantiation of this proof system

5

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Contributions

www.iaik.tugraz.at

1. Model generic proof system for plaintext (in-)equality 2. Efficient instantiation of this proof system 3. Group signatures with verifiable controllable linkability

5

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Contributions

www.iaik.tugraz.at

1. Model generic proof system for plaintext (in-)equality 2. Efficient instantiation of this proof system 3. Group signatures with verifiable controllable linkability 4. Extend GSs with verifiable controllable linkability (VCL)

5

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Sign-Encrypt-Prove Paradigm
Basic building blocks
DS = (KGs, Sign, Verify)

www.iaik.tugraz.at

6

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Sign-Encrypt-Prove Paradigm
Basic building blocks
DS = (KGs, Sign, Verify) AE = (KGe, Enc, Dec)

www.iaik.tugraz.at

6

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Sign-Encrypt-Prove Paradigm
Basic building blocks
DS = (KGs, Sign, Verify) AE = (KGe, Enc, Dec) Signature of Knowledge

www.iaik.tugraz.at

6

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Sign-Encrypt-Prove Paradigm
Basic building blocks
DS = (KGs, Sign, Verify) AE = (KGe, Enc, Dec) Signature of Knowledge
Keys
gpk  (pke, pks),

www.iaik.tugraz.at

6

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Sign-Encrypt-Prove Paradigm
Basic building blocks
DS = (KGs, Sign, Verify) AE = (KGe, Enc, Dec) Signature of Knowledge
Keys
gpk  (pke, pks), gmsk  ske,

www.iaik.tugraz.at

6

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Sign-Encrypt-Prove Paradigm
Basic building blocks
DS = (KGs, Sign, Verify) AE = (KGe, Enc, Dec) Signature of Knowledge
Keys
gpk  (pke, pks), gmsk  ske, gmik  sks

www.iaik.tugraz.at

6

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Sign-Encrypt-Prove Paradigm
Basic building blocks
DS = (KGs, Sign, Verify) AE = (KGe, Enc, Dec) Signature of Knowledge
Keys
gpk  (pke, pks), gmsk  ske, gmik  sks
Join
User's secret: xi

6

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at

Sign-Encrypt-Prove Paradigm

Basic building blocks
DS = (KGs, Sign, Verify) AE = (KGe, Enc, Dec) Signature of Knowledge
Keys
gpk  (pke, pks), gmsk  ske, gmik  sks
Join
User's secret: xi Issuer computes: cert  Sign(gmik , f (xi ))

6

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at

Sign-Encrypt-Prove Paradigm I
Sign
T  Enc(pke, cert)

www.iaik.tugraz.at

7

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Sign-Encrypt-Prove Paradigm I

www.iaik.tugraz.at

Sign
T  Enc(pke, cert)
  SoK {(xi , cert) : cert = Sign(sks, f (xi ))  T = Enc(pke, cert))}(m)

7

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Sign-Encrypt-Prove Paradigm I

www.iaik.tugraz.at

Sign
T  Enc(pke, cert)
  SoK {(xi , cert) : cert = Sign(sks, f (xi ))  T = Enc(pke, cert))}(m)
  (T , )

7

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Sign-Encrypt-Prove Paradigm I

www.iaik.tugraz.at

Sign
T  Enc(pke, cert)   SoK {(xi , cert) : cert = Sign(sks, f (xi )) 
T = Enc(pke, cert))}(m)   (T , )
Verify
"verification of "

7

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Sign-Encrypt-Prove Paradigm I

www.iaik.tugraz.at

Sign
T  Enc(pke, cert)   SoK {(xi , cert) : cert = Sign(sks, f (xi )) 
T = Enc(pke, cert))}(m)   (T , )
Verify
"verification of "
Open
cert  Dec(ske, T )

7

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Controllable Linkability

www.iaik.tugraz.at

Public key encryption with equality tests [Tan12, SSU14]
Conventional public key encryption scheme

8

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Controllable Linkability

www.iaik.tugraz.at

Public key encryption with equality tests [Tan12, SSU14]
Conventional public key encryption scheme + Com algorithm for equality tests using trapdoor

8

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Controllable Linkability

www.iaik.tugraz.at

Public key encryption with equality tests [Tan12, SSU14]
Conventional public key encryption scheme + Com algorithm for equality tests using trapdoor
 Link: 1/0  Com(T , T , gmlk )

8

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Controllable Linkability

www.iaik.tugraz.at

Public key encryption with equality tests [Tan12, SSU14]
Conventional public key encryption scheme + Com algorithm for equality tests using trapdoor
 Link: 1/0  Com(T , T , gmlk )
Semantic security without trapdoor

8

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Controllable Linkability

www.iaik.tugraz.at

Public key encryption with equality tests [Tan12, SSU14]
Conventional public key encryption scheme + Com algorithm for equality tests using trapdoor
 Link: 1/0  Com(T , T , gmlk )
Semantic security without trapdoor One-way security for trapdoor holders

8

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Controllable Linkability

www.iaik.tugraz.at

Public key encryption with equality tests [Tan12, SSU14]
Conventional public key encryption scheme + Com algorithm for equality tests using trapdoor
 Link: 1/0  Com(T , T , gmlk )

Semantic security without trapdoor One-way security for trapdoor holders
 ZK proof of knowledge of trapdoor for VCL

8

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Setting

www.iaik.tugraz.at

certi

certj

9

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Setting

=?
Verifier (pk)

certi

certj

9

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at

Setting

www.iaik.tugraz.at

=?

certi

certj

Link (1, Verifier (pk)

), (2,

) Linker (mlk)

9

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Setting

www.iaik.tugraz.at

=?

certi

certj

Link (1, ), (2,

Verifier (pk)

Yes/No, 

) Linker (mlk)

9

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Setting

www.iaik.tugraz.at

=?

certi

certj

Link (1, ), (2,

Verifier (pk)

Yes/No, 

) Linker (mlk)

Non-interactive plaintext (in-)equality proofs

9

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Non-Interactive Plaintext (In-)Equality Proofs
Given any PKEQ and ciphertexts T and T under pk Proof system 

10

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Non-Interactive Plaintext (In-)Equality Proofs
Given any PKEQ and ciphertexts T and T under pk Proof system 
1. Prove knowledge of trapdoor tk

10

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Non-Interactive Plaintext (In-)Equality Proofs
Given any PKEQ and ciphertexts T and T under pk Proof system 
1. Prove knowledge of trapdoor tk 2. Com = 1 (membership) or Com = 0 (non-membership)

10

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Non-Interactive Plaintext (In-)Equality Proofs
Given any PKEQ and ciphertexts T and T under pk Proof system 
1. Prove knowledge of trapdoor tk 2. Com = 1 (membership) or Com = 0 (non-membership) 3. Without revealing trapdoor tk

10

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

(Non-)Membership Proofs

www.iaik.tugraz.at

Com = 1 defines L for membership ((x, w)  LR)
Witnessed by trapdoor tk Standard techniques [GS08]

11

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

(Non-)Membership Proofs

www.iaik.tugraz.at

Com = 1 defines L for membership ((x, w)  LR)
Witnessed by trapdoor tk Standard techniques [GS08]
Com = 0 defines L for non-membership ((x, w) / LR)

11

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

(Non-)Membership Proofs

www.iaik.tugraz.at

Com = 1 defines L for membership ((x, w)  LR)
Witnessed by trapdoor tk Standard techniques [GS08]
Com = 0 defines L for non-membership ((x, w) / LR)
Idea [BCV15] 1: Failing membership proof for LR

11

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

(Non-)Membership Proofs

www.iaik.tugraz.at

Com = 1 defines L for membership ((x, w)  LR)
Witnessed by trapdoor tk Standard techniques [GS08]
Com = 0 defines L for non-membership ((x, w) / LR)
Idea [BCV15] 1: Failing membership proof for LR 2: Proof that 1 has been computed honestly

11

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

(Non-)Membership Proofs

www.iaik.tugraz.at

Com = 1 defines L for membership ((x, w)  LR)
Witnessed by trapdoor tk Standard techniques [GS08]
Com = 0 defines L for non-membership ((x, w) / LR)
Idea [BCV15] 1: Failing membership proof for LR 2: Proof that 1 has been computed honestly
Efficient instantiations (GS and SPHFs)

11

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

(Non-)Membership Proofs

www.iaik.tugraz.at

Com = 1 defines L for membership ((x, w)  LR)
Witnessed by trapdoor tk Standard techniques [GS08]
Com = 0 defines L for non-membership ((x, w) / LR)
Idea [BCV15] 1: Failing membership proof for LR 2: Proof that 1 has been computed honestly
Efficient instantiations (GS and SPHFs) Technicalities: m, r must be known [BCV15]

11

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Smooth Projective Hash Functions (SPHFs)

12

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Construction - Non-Membership Proof

13

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Construction - Non-Membership Proof

13

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Construction - Non-Membership Proof

13

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Construction - Non-Membership Proof

13

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Construction - Non-Membership Proof

13

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Construction - Non-Membership Proof

13

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Construction - Non-Membership Proof

13

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Construction - Non-Membership Proof

13

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Construction - Non-Membership Proof

13

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Construction - Non-Membership Proof

13

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Construction - Non-Membership Proof

13

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Construction - Non-Membership Proof

13

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Construction - Non-Membership Proof

13

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
Construction - Non-Membership Proof

13

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Example of Efficient Instantiation

www.iaik.tugraz.at

ElGamal with equality tests (as in [SSU14])

Keypair: Trapdoor: Encryption of m:

(sk , pk )  (x, gx )  Zp × G1 (^r , ^r x )  G2 × G2
(gr , m · gx·r )  G1 × G1

14

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Example of Efficient Instantiation

www.iaik.tugraz.at

ElGamal with equality tests (as in [SSU14])

Keypair: Trapdoor: Encryption of m:

(sk , pk )  (x, gx )  Zp × G1 (^r , ^r x )  G2 × G2
(gr , m · gx·r )  G1 × G1

Pairing based equality test:

Ciphertexts:

(gr , m · gx·r ), (gr , m · gx·r )

e(m · gx·r , ^r ) e(m · gx·r , ^r ) m = m  e(gr , ^r x ) = e(gr , ^r x )

14

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Instantiation of 

www.iaik.tugraz.at

Com = 1: plaintext equality proof ((gr , m · gx·r ), (gr , m · gx·r ), gx )  L  e(m · gx·r , ^r ) e(m · gx·r , ^r ) e(gr , ^r x ) = e(gr , ^r x )  e(g, ^r x ) = e(gx , ^r )

15

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Instantiation of 

www.iaik.tugraz.at

Com = 1: plaintext equality proof ((gr , m · gx·r ), (gr , m · gx·r ), gx )  L  e(m · gx·r , ^r ) e(m · gx·r , ^r ) e(gr , ^r x ) = e(gr , ^r x )  e(g, ^r x ) = e(gx , ^r )

2
e(Ai , Y^i )

=

e(m · gx·r · (m · gx·r )-1, ^r ) e(gr · g-r , ^r x )

=

1GT

i =1

15

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Instantiation of /

www.iaik.tugraz.at

Com = 0: plaintext inequality proof
((gr , m · gx·r ), (gr , m · gx·r ), gx )  L/  e(m · gx·r , ^r ) e(m · gx·r , ^r ) e(gr , ^r x ) = e(gr , ^r x )  e(g, ^r x ) = e(gx , ^r )

16

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Instantiation of /

www.iaik.tugraz.at

Com = 0: plaintext inequality proof
((gr , m · gx·r ), (gr , m · gx·r ), gx )  L/  e(m · gx·r , ^r ) e(m · gx·r , ^r ) e(gr , ^r x ) = e(gr , ^r x )  e(g, ^r x ) = e(gx , ^r )

 Our construction for non-membership proofs

16

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

NIPEI Proof System
Proof system  = (, /)

www.iaik.tugraz.at

17

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

NIPEI Proof System
Proof system  = (, /)

www.iaik.tugraz.at

=?

certi

certj

Link (1, ), (2,

Verifier (pk)

Yes/No, 

) Linker (mlk)

17

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
GSSs with Verifiable Controllable Linkability
Extended security model for VCL-GS
Algorithms: Link and LinkJudge Property: linking soundness

18

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at
GSSs with Verifiable Controllable Linkability
Extended security model for VCL-GS
Algorithms: Link and LinkJudge Property: linking soundness
Instantiation based on NIPEI
Link: .Proof LinkJudge: .Verify

18

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Take-Home Message

www.iaik.tugraz.at

Proposed generic approach for (in-)equality proof

19

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Take-Home Message

www.iaik.tugraz.at

Proposed generic approach for (in-)equality proof Efficient instantiation in the pairing setting

19

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Take-Home Message

www.iaik.tugraz.at

Proposed generic approach for (in-)equality proof Efficient instantiation in the pairing setting Also works for DLIN and CCA-secure ElGamal variants
Compatible with Naor-Yung paradigm (for free)

19

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

Take-Home Message

www.iaik.tugraz.at

Proposed generic approach for (in-)equality proof Efficient instantiation in the pairing setting Also works for DLIN and CCA-secure ElGamal variants
Compatible with Naor-Yung paradigm (for free) Novel application
GSSs with verifiable controllable linkability

19

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

SCIENCE

PA S S I O N

TECHNOLOGY

Non-Interactive Plaintext (In-)Equality Proofs and Group Signatures with Verifiable Controllable Linkability
Olivier Blazy1, David Derler2, Daniel Slamanig2, Raphael Spreitzer2 1 Universite´ de Limoges, XLim, France 2 IAIK, Graz University of Technology, Austria
CT-RSA 2016, San Francisco, 2nd March 2016

www.iaik.tugraz.at

Bibliography I

www.iaik.tugraz.at

[BCV15]

Olivier Blazy, Ce´ line Chevalier, and Damien Vergnaud. Non-Interactive Zero-Knowledge Proofs of Non-Membership. In CT-RSA, 2015.

[CvH91] David Chaum and Euge` ne van Heyst. Group Signatures. In EUROCRYPT, 1991.

[GS08]

Jens Groth and Amit Sahai. Efficient Non-interactive Proof Systems for Bilinear Groups. In EUROCRYPT, 2008.

[HLhC+11] Jung Yeon Hwang, Sokjoon Lee, Byung ho Chung, Hyun Sook Cho, and DaeHun Nyang. Short Group Signatures with Controllable Linkability. In LightSec. IEEE, 2011.

[SSU14]

Daniel Slamanig, Raphael Spreitzer, and Thomas Unterluggauer. Adding Controllable Linkability to Pairing-Based Group Signatures for Free. In ISC, 2014.

[Tan12]

Qiang Tang. Public Key Encryption Supporting Plaintext Equality Test and User-Specified Authorization. Security and Communication Networks, 5(12), 2012.

21

Blazy, Derler, Slamanig, Spreitzer CT-RSA 2016, San Francisco, 2nd March 2016

