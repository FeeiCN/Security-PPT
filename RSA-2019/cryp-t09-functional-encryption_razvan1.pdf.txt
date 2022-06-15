SESSION ID: CRYP-T09
Efficient Function-Hiding Functional Encryption: From Inner-Products to Orthogonality

Authors:
Manuel Barbosa, Dario Catalano, Azam Soleimanian, and Bogdan Warinschi
Corresponding author :Azam.Soleimanian@ens.fr

#RSAC

#RSAC
Motivations: Functional Encryption for Orthogonality (OFE)
Privacy-preserving role-based access control Keyword search over encrypted data
ACCESS?





Access iff < , >  0

where < ,  > = 

 
 

No information about  or < ,  > whe2n< , >  0

Functional Encryption for Orthogonality

Functional Encryption (for :  ×   )
(1)  (, ) (, )  

(, )   (, )

Inner-Product (IPFE)

Orthogonality (OFE)
4

#RSAC
  < ,  >

#RSAC
From IPFE to OFE
Randomization + function-hiding

IPFE

OFE

FH-OFE
· no information about x · no information about y · no information about < ,  > when < x, y >  0
5

#RSAC
Security notion in FH-FE
Selective: Ask all the challenges at the beginning Adaptive: Ask whenever you want
One vs. Many Selective vs. Adaptive
6

#RSAC
Coming back to the construction
Security level: one-selective
7

Going to Many-Adaptive security
FH-OFE in Generic Group Model

#RSAC
FH-OFE in generic group model (GGM)
Group Operations in GGM
­ Encoding ­ Add ­ Pair ­ Zero-test
Pros and Cons with GGM?
­ Oracle access to group operations ­ non-generic attacks can be inefficient ­ Flexibility to present efficient constructions ­ Preventing many-ciphertext attacks
9

#RSAC
FH-OFE in GGM
 FH-IPFE by Kim et al. SCN 2018
Security Level: many-Adaptive
10

FH-OFE in Standard Model

#RSAC
FH-OFE in standard model (SM)

 FH-IPFE by Lin CRYPTO 2017

KeyGen( Encmpk  ) Enc( KeyGenmsk  )

General Construction by Lin
­ Requirements on the underlying scheme ­ Adding multi-linearity ­ Selective results in selective ­ Instantiation: scheme of Abdalla et al. PKC 2015
12

#RSAC
FH-OFE in standard model (SM)
Security level: Depends on the underlying sch1e3me

#RSAC
Instantiation: Wee's Scheme TCC 2017
Instantiation: Harder but possible
­ Matrix scales ­ MDDH assumption ­ Many-Selective secure
14

#RSAC
From Selective to Adaptive in SM
Complexity Leveraging (CL) ­ Converting selective security to adaptive security ­ Losing a factor of security (is it tolerable?)

CL on the general construction
­ Security loss:  where  = 2(+) Not tolerable, So?
CL on underlying schemes?
­ Security loss: 2 Tolerable if  is small enough

One-SEL

OFE

CL

One-AD

Many-AD

OFE Hybrid

OFE

Lin's

15

Many-AD FH-OFE

Implementation
Timing values in milliseconds

#RSAC
Lengths in Kilobytes

16

#RSAC
Implementation
MacBook Pro, 2.9 GHz Intel Core i5, RAM 16 GB
C++
­ SCIPR Lab's library for finite fields and elliptic curves (libff)
o Curve: BN128 (BN254)
­ Shoup's Number Theory Library (NTL) ­ GNU Multiprecision Library (GMP)
www.shoup.net/ntl/ www.gmplib.org www.github.com/scipr-lab/libff www.github.com/zcash/zcash/issues/2502
17

#RSAC
Comparison
18

#RSAC
Applications

Privacy-preserving subset relation
­ Sorting algorithm ­ Searchable encryption
Range queries
Access Control

  

   iff < mRep  , kRep() > = 0
19

#RSAC
References
Abdalla, M., Bourse, F., Caro, A.D., Pointcheval, D.: Simple functional encryption schemes for inner products. Public-Key Cryptography - PKC 2015. Kawai, Y., Takashima, K.: Predicate- and attribute-hiding inner product encryption in a public key setting. Pairing 2013, Revised Kim, S., Lewi, K., Mandal, A., Montgomery, H.W., Roy, A., Wu, D.J.: Function hiding inner product encryption is practical. SCN 2018 Lin, H.: Indistinguishability obfuscation from SXDH on 5-linear maps and locality-5 prgs. Advances in Cryptology - CRYPTO 2017. Shen, E., Shi, E., Waters, B.: Predicate privacy in encryption systems. Theory of Cryptography - TCC 2009. Proceedings, pp. 457­473 (2009) Wee, H.: Attribute-hiding predicate encryption in bilinear groups, revisited. TCC 2017.
20

Summery:
· Functional encryption for orthogonality · Function-hiding property · IPFE + Randomization + function hiding  one-selective FH-OFE · FH-OFE in GGM with many-adaptive security is possible · Wee's OFE + Lin's Transformation  many-selective-secure FH-OFE · CL on Wee's OFE+ hybrid +Lin's transformationmany-adaptive-secure FH-OFE · FH-OFE privacy-preserving subset relation
Thanks

