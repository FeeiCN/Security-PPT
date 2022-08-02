SESSION ID: CRYP-F03
Communication Optimal Tardosbased Asymmetric Fingerprinting

Qiang Tang
University of Connecticut & University of Athens joint work with Aggelos Kiayias, Nikos Leonardos, Helger Lipmaa, and Kateryna Pavlyk

#RSAC

#RSAC
A Motivational Example
A Movie Producer

Cinema 1

Cinema 2

......
!2

Cinema 3

#RSAC
A Motivational Example
A Movie Producer

Cinema 1

Cinema 2

......
!3

Cinema 3

#RSAC
A Motivational Example
A Movie Producer

Cinema 1

Cinema 2

......
!4

Cinema 3

#RSAC
A Motivational Example
Godfather-HD
$5.99
!5

#RSAC
A Motivational Example
How to identify the source of the pirate?
!6

Fingerprinting

A Movie Producer

A%$#RT8^

VF%&t4*(1

Cinema 1

Cinema 2

......
!7

#RSAC
c$%f%65I* Cinema 3

#RSAC
A Motivational Example
Godfather-HD
$5.99
!8

#RSAC
Fingerprinting
!9

#RSAC
Fingerprinting
VF%&#RT8^
!10

#RSAC
Fingerprinting
pirate codeword
VF%&#RT8^
!11

#RSAC
Fingerprinting

pirate codeword
VF%&#RT8^

VF%&t4*(1 A%$#RT8^

!12

#RSAC
Fingerprinting

pirate codeword
VF%&#RT8^

VF%&t4*(1 A%$#RT8^

tracing algorithm

!13

#RSAC
Fingerprinting

pirate codeword
VF%&#RT8^

VF%&t4*(1 A%$#RT8^

tracing algorithm

Cinema 1 Cinema 5

!14

#RSAC
Fingerprinting

pirate codeword
VF%&#RT8^

compare to the DB

VF%&t4*(1 A%$#RT8^

Cinema 1 Cinema 5

tracing algorithm

!15

#RSAC
The Goals of Fingerprinting
! Individualize contents
!16

#RSAC
The Goals of Fingerprinting
! Individualize contents ! Trace back to the sources
!17

#RSAC
A Catch
Does fingerprinting really de-incentivize illegal content re-distribution?
!18

#RSAC
A Catch
! Both the content provider and the content receiver can leak a copy
!19

#RSAC
A Catch
! Both the content provider and the content receiver can leak a copy ! The copy found in the public can not serve as a undeniable proof
!20

#RSAC
Asymmetric Fingerprinting
!21

#RSAC
Asymmetric Fingerprinting
A Movie Producer

A%$#RT8^

1b6G&8I$

c$%f%65I*

Cinema 1

Cinema 2

......
!22

Cinema 3

#RSAC
Asymmetric Fingerprinting
A Movie Producer

A%$#RT8^

1b6G&8I$

c$%f%65I*

t456&*!E Cinema 1

VF%&t4*( Cinema 2

......

!23

G^7#TC4 Cinema 3

Asymmetric Fingerprinting
A Movie Producer

t456&*!EA%$#RT8^

VF%&t4*(1b6G&8I$

Cinema 1

Cinema 2

......
!24

#RSAC
G^7#TC4c$%f%65I* Cinema 3

#RSAC
Asymmetric Fingerprinting
Godfather-HD
$5.99
!25

#RSAC
Asymmetric Fingerprinting
!26

#RSAC
Asymmetric Fingerprinting
half code
VF%&t4*(11b6G&8I$ G^7#TC4A%$#RT8^
!27

#RSAC
Asymmetric Fingerprinting

half code

half DB

VF%&t4*(11b6G&8I$ G^7#TC4A%$#RT8^

!28

#RSAC
Asymmetric Fingerprinting

half code

half DB

VF%&t4*(11b6G&8I$ G^7#TC4A%$#RT8^

Cinema 2 Cinema 1

!29

#RSAC
Asymmetric Fingerprinting

VF%&t4*(11b6G&8I$ G^7#TC4A%$#RT8^

Cinema 2 Cinema 1

!30

Asymmetric Fingerprinting

VF%&t4*(11b6G&8I$ G^7#TC4A%$#RT8^
t456&*!EA%$#RT8^

Cinema 2 Cinema 1

Cinema 1

VF%&t4*(1b6G&8I$
Cinema 2 !31

#RSAC

Asymmetric Fingerprinting

VF%&t4*(11b6G&8I$ G^7#TC4A%$#RT8^
t456&*!EA%$#RT8^
Cinema 1

Cinema 2 Cinema 1
t456&*!E VF%&t4*(

VF%&t4*(1b6G&8I$
Cinema 2 !32

#RSAC

Asymmetric Fingerprinting

VF%&t4*(11b6G&8I$ G^7#TC4A%$#RT8^ t456&*!EA%$#RT8^
Cinema 1
VF%&t4*(1b6G&8I$ Cinema 2

Cinema 2 Cinema 1 t456&*!E VF%&t4*(
Cinema 1
!33

#RSAC
Cinema 2

#RSAC
A Subtle Security Consideration

t456&*!EA%$#RT8^ VF%&t4*(1b6G&8I$

VF%&t4*(A%$#RT8^

!34

#RSAC
A Subtle Security Consideration

t456&*!EA%$#RT8^ VF%&t4*(1b6G&8I$

VF%&t4*(A%$#RT8^

Accusation Withdraw
!35

#RSAC
A Subtle Security Consideration
1. User should not know how the two halves are mixed
!36

#RSAC
A Subtle Security Consideration
1. User should not know how the two halves are mixed 2. Lower down the tracing parameter at the judge side
!37

#RSAC
Important Efficiency Consideration
Even transmitting 2* movie size kills the bandwidth
!38

#RSAC
Important Efficiency Consideration
Even transmitting 2* movie size kills the bandwidth
And will hinder the adoption of this technique
!39

#RSAC
Important Efficiency Consideration
Size of Rate=
Size of actual transmission
!40

#RSAC
Important Efficiency Consideration

Size of

Rate=

1

Size of actual transmission

!41

#RSAC
Important Efficiency Consideration
Fight Piracy without Extra Bandwidth Cost !
!42

#RSAC
High-level Construction Idea
!43

#RSAC
Fingerprint Phase
! The content provider and a movie theater jointly samples a codeword (during the transmission of the movies), which is oblivious to the CP (using a conditional OT)
!44

#RSAC
Fingerprint Phase
! The content provider and a movie theater jointly samples a codeword (during the transmission of the movies), which is oblivious to the CP (using a conditional OT)
! The CP and the movie theater runs OT protocols to see half of the codeword
!45

#RSAC
Fingerprint Phase
! The content provider and a movie theater jointly samples a codeword (during the transmission of the movies), which is oblivious to the CP (using a conditional OT)
! The CP and the movie theater runs OT protocols to see half of the codeword CP only knows half of the codeword
!46

#RSAC
Fingerprint Phase
! The content provider and a movie theater jointly samples a codeword (during the transmission of the movies), which is oblivious to the CP (using a conditional OT)
! The CP and the movie theater runs OT protocols to see half of the codeword CP only knows half of the codeword
Theaters don't know which part is known to the CP
!47

#RSAC
Fingerprint Phase
! The content provider and a movie theater jointly samples a codeword (during the transmission of the movies), which is oblivious to the CP (using a conditional OT)
! The CP and the movie theater runs OT protocols to see half of the codeword CP only knows half of the codeword
Theaters don't know which part is known to the CP
Rate optimal OT and COT are needed
!48

#RSAC
Identify Phase
! Run the tracing algorithm of the underlying fingerprinting code on the half known to the CP
!49

#RSAC
Dispute Phase
! The accused movie theaters submit the other halves of the codewords (with the proof)
!50

#RSAC
Dispute Phase
! The accused movie theaters submit the other halves of the codewords (with the proof)
! The judge also runs the tracing algorithm with a less restrict parameter on these halves
!51

#RSAC
Dispute Phase
! The accused movie theaters submit the other halves of the codewords (with the proof)
! The judge also runs the tracing algorithm with a less restrict parameter on these halves
Weaker judge side parameter is to avoid accusation withdraw
!52

Communication Optimal Tardos-Based

#RSAC

Asymmetric Fingerprinting

!53

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

New proposal

Linearly Homomorphic Encryption from 
Guilhem Castagnos Fabien Laguillaumie
 Université de Bordeaux INRIA Bordeaux - Sud-Ouest - LFANT Institut de Mathématiques de Bordeaux UMR 5251,
 Université Claude Bernard Lyon 1 CNRS/ENSL/INRIA/UCBL LIP Laboratoire de l'Informatique du Parallélisme
CT-RSA 2015

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields
Outline

New proposal

Linearly Homomorphic Encryption Class Groups of Imaginary Quadratic Fields New proposal

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields
Outline

New proposal

Linearly Homomorphic Encryption Class Groups of Imaginary Quadratic Fields New proposal

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

Linearly Homomorphic Encryption ?

New proposal

· Public key encryption scheme with the following properties: · Suppose that the set of plaintexts  is a ring ·   Encrypt(, ),   Encrypt(, ) ·   (, , ) s.t.
(, ) =  + 

· For    ,   (, , ) s.t. (, ) = 

· Applications: Electronic Voting, Private Information Retrieval, Mix-Net, Oblivious Transfer, Fingerprinting...

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

Examples from Factoring

New proposal

· Goldwasser Micali (84) · Plaintext space  = Z/2Z · Ciphertext space : Z/NZ where N =  is an RSA integer
· Paillier (99) · Plaintext space  = Z/NZ · Ciphertext space : Z/N Z where N =  is an RSA integer · Plaintext encoding :   Z/NZ  (1 + N)  1 + N (mod N )

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

From DDH: ElGamal "in the exponent"

New proposal

· Folklore message encoding:     

· (, ) = (, )  Encrypt(, ) · Decrypt(, )  / =   

·  must be small. Can only do a bounded number of homomorphic operations:

· ·

(, (,

) )

= =

(, )  Encrypt(, ), ( ,   )  Encrypt(, ),

(, ) = (+ , + + )

( ,  ) = (, )

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

 group with an easy  subgroup

New proposal

· (G, ×) =  a cyclic group of order  ·  = , gcd(, ) = 1 ·  = F  G subgroup of G of order  · The  problem is easy in F: There exists, , a
deterministic polynomial time algorithm s.t. (, , )  
· The  problem is hard in G even with access to the  algorithm

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

New proposal

A Generic Linearly Homomorphic Encryption Scheme

·  = / ·    = ,   , where  has order  =  for an unknown  ·    = (, ) = (, ), where    has order  ·   A  /, (, , A)   ·  

·  

(, ) = (+ , + + )

( ,  ) = (, )

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

An Unsecure Instantiation
·  a prime and G =  = (/)× of order  = ( - 1)
·  = 1 +   G, F =  = {1 + ,   Z/Z} ·  = 1 + . · There exist a unique (, )  (/, (/)×) such that
 = 

New proposal

- = (-) = - · Public key :  = ,

- = -   mod  · (, ) = (, )
- = -   mod 
- = --   mod 

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

Partial Discrete Logarithm Problem

New proposal

· (G, ×) =  a cyclic group of order  ·  = , gcd(, ) = 1 ·  = F  G subgroup of G of order  · Partial Discrete Logarithm () Problem:
Given X =  compute  mod . · The knowledge of  makes the  problem easy.
 must be hidden or unknown !

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

A Secure Instantiation

New proposal

· Bresson, Catalano, Pointcheval (03) · Let N be an RSA integer, G =   (/N )× ·  = Card(G) = N with   (N), ·  = 1 + N  G, F =  = {1 + N,   Z/NZ}, of order N · Public key :  = ,  secret key · (, ) = (, ) · Based on  in (/N )× and the Factorisation problem. · The factorisation of N acts as a second trapdoor.

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields
Outline

New proposal

Linearly Homomorphic Encryption Class Groups of Imaginary Quadratic Fields New proposal

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

Definitions
Imaginary Quadratic Fields

· K = (),  < 0
· Fundamental Discriminant:
·   1 (mod 4) square-free ·   0 (mod 4) and /4  2, 3 (mod 4) square-free · Non Fundamental Discriminant: ·  =  ·  is the conductor

Class Group of Discriminant 
· Finite Group denoted C() · Elements: Equivalence classes of Ideals · Class Number: ()  ||

New proposal

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

ElGamal in Class Group

New proposal

· Buchmann and Williams (88): Diffie-Hellman key exchange and ElGamal
· Düllmann, Hamdy, Möller, Pohst, Schielzeth, Vollmer (90-07): Implementation
· Size of ? Index calculus algorithm to compute () and Discrete Logarithm in C()
· Security Estimates from Biasse, Jacobson and Silvester (10):
· Complexity conjectured L||(1/2, (1)) ·  : 1348 bits as hard as factoring a 2048 bits RSA integer ·  : 1828 bits as hard as factoring a 3072 bits RSA integer

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

Map between two Class Groups

New proposal

· Let  be a fondamental negative discriminant,   -3, -4,  a conductor, and  = 

· There exists a surjective morphism, denoted  , between C() and C()

·   is effective, can be computed if  is known

· Used by the  cryptosystem by Paulus and Takagi (00),  = -,  = -, ,  primes,  is the trapdoor

· C., Laguillaumie (09) :

In each non trivial class of ker  , there exists an ideal of the

form



+

+ 



Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields
Outline

New proposal

Linearly Homomorphic Encryption Class Groups of Imaginary Quadratic Fields New proposal

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

A Subgroup with an Easy  Problem

New proposal

·  = -,  = -, ,  primes and   3 (mod 4)

() =  × ()

·

Let  =  +

+ 





C()

· F = ker   =  is of order , and



=

 

+

[-



mod 2

]

+







Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

New proposal

A New Linearly Homomorphic Encryption Scheme

·  = -,  = -, ,  primes and   3 (mod 4) and (/) = -1,  > 4
· Let  be an element of C(),  =  where  secret key
·  has order  for an unknown |() · (, ) = (, ) where  has order 
· Based on  in C() (and the Class number problem).
· Linearly homomorphic over / where  can be chosen (almost) independently from the security parameter

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields
Some Variants

New proposal

· Faster Variant: most of the work in C() (based on a non standard problem)

· More general message spaces:

·

/N

with

N

=


=

,

with

a

discriminant

of

the

form

 = -N

· / for  > 1, with discriminants of the form  = , and  = -

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

Performance comparison

New proposal

Cryptosystem Paillier BCP03
New Proposal Fast Variant Fast Variant
Paillier BCP03 New Proposal Fast Variant Fast Variant Fast Variant

Parameter
2048 bits modulus
2048 bits modulus 1348 bits  1348 bits  1348 bits 
3072 bits modulus
3072 bits modulus 1828 bits  1828 bits  1828 bits  1828 bits 

Message Space 2048 bits 2048 bits 80 bits 80 bits 256 bits
3072 bits 3072 bits 80 bits 80 bits 512 bits 912 bits

Encryption (ms) 28 107 93 82 105
109 427 179 145 226 340

Decryption (ms) 28 54 49 45 68
109 214 91 78 159 271

Timings performed with Sage and PARI/GP.

Linearly Homomorphic Encryption

Class Groups of Imaginary Quadratic Fields

New proposal

Linearly Homomorphic Encryption from 
Guilhem Castagnos Fabien Laguillaumie
 Université de Bordeaux INRIA Bordeaux - Sud-Ouest - LFANT Institut de Mathématiques de Bordeaux UMR 5251,
 Université Claude Bernard Lyon 1 CNRS/ENSL/INRIA/UCBL LIP Laboratoire de l'Informatique du Parallélisme
CT-RSA 2015

