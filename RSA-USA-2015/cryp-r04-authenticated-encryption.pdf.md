SESSION ID: CRYP-R04
How to Incorporate Associated Data in Sponge-Based Authenticated Encryption

Yu Sasaki and Kan Yasuda
NTT Secure Platform Laboratories

#RSAC

#RSAC
Authenticated Encryption

message privacy Encryption message privacy +

authenticity Authenticated

MAC authenticity

Encryption

independently computed

all-in-one

 Simple security discussion  Higher performance

2

#RSAC
Associated Data (AD)
 The data to be authenticated but not encrypted
 Ex: Traffic Signal
 AD makes sense only when two types of data co-exist in communication
 Ex: Packet Header
To:
3

#RSAC
How to Build Authenticated Encryption
 Using symmetric-key primitive as a base
 Block-cipher  Hash function  Stream cipher  Random permutation
 Sponge construction [Keccak-team 2007]
 Designing permutation is easier than other primitives.  It turned out that the sponge construction can be lightweight.  7 out of 57 designs in CAESAR are adopting the sponge construction.
4

Previous Sponge-Based

#RSAC

Constructions

5

#RSAC
Sponge Construction (Hash Function)

 First absorb message, then squeeze the output.  Security is /2 bits.
M
pad

Hash
trunc

r
   P P P P P
c
6

#RSAC
SpongeWrap (Authenticated Encryption)

 Absorb , , . Squeeze 

 Both of absorb an squeeze are done for the encryption part (duplex)

K

N||A

M

C

T

trunc

trunc

pad

pad

pad

pad

pad

pad

trunc

r

   P  P

P

PP

c

7

#RSAC
donkeySponge (MAC)

 Absorb (, ) in  +  bits. (inspired by Alpha-MAC)

 Internal state is secret  /2-bit security.

KM

T

pad

pad

trunc

r
   P P P P P
c
8

#RSAC
monkeyDuplex

 Efficient initialization for nonce-based scheme

 For different (, ) state after  is randomized.

K

N

4 calls of 

1 call of 

pad pad pad



r
   P 
c

r 
N 
cK

9

#RSAC
Drawbacks of Sponge-Based AE

  must be provided before . Otherwise, the computation gets stuck.

 Padding (frame bit) in every block occupies 1 bit.

K

N||A

M

C

T

trunc

trunc

pad

pad

pad

pad

pad

pad

trunc

r

   P  P

P

PP

c

10

#RSAC
Approach of NORX

 NORX is a CAESAR submission by Aumasson et al.

 It accepts associated data after , called " trailer."

 (header)



 (trailer)

Jean-Phillip Aumasson, Philipp Jovanovic and Samuel Neves , NORX v1, Submitted to CAESAR.
11

#RSAC
Our Constructions
12

#RSAC
Simple Construction
 Introducing Donkey for associated data
 SpongeWrap + monkeyDuplex + donkeySponge + Header/Trailer

 (header) M

C  (trailer)

T

 r 
c 

trunc

trunc

pad

pad

pad

pad

pad

pad

P P 

P

PPP

trunc
P

13

#RSAC
Avoiding Frame bits

 New padding schemes are necessary  New domain separations are necessary

 r 
c 

 (header) M

C

pad

pad

trunc

trunc

pad

pad

pad

pad

 (trailer)
pad

pad

pad

P P 

P

PPP

T
trunc
P

14

#RSAC
Padding for 
 10* padding for the last block
 Constant addition for the outer part of the last block  10*1 padding

 (header)
10* pad



pad

pad

M
pad trunc
pad

C
trunc pad

 (trailer)
pad 10*

pad

pad

r 

P P 

P

PPP

c 





15

T
trunc
P

#RSAC
Padding for 
 10* padding for the last block
 Outer part of the last block must be independent of the previous blocks

 r 
c 

 (header) M

10*1

10* pad

trunc

C  (trailer)
10*1
trunc

pad

pad

P P 

P

PPP

T
trunc
P

independent 16

#RSAC
Construction 1: donkeyHeaderTreailer
 The same security bound as Jovanovic et al. at Asiacrypt 2014.

 (header) M

10*1

10*

C  (trailer)
trunc 10*1



r 
P c 

P 

P

PPP

2
17

T
trunc
P

#RSAC
Construction 2: Concurrent Absorption

 Absorb  in  bits, absorb  in  bits, simultaneously

case:  <  

M





10* 10*

CT
trunc trunc



r 


P

P

P

P

P

 P

c  

18

#RSAC
Construction 2: Concurrent Absorption

 Absorb  in  bits, absorb  in  bits, simultaneously

case:  >  

M

C

T





10* 10*

trunc

trunc



r 


P

P

P

P

P

 P

c  

19

#RSAC
Remarks on Concurrent Absorption
 The number of  calls is minimized.
 minimum power consumption (Green CRYPTO!!)  suitable for light-weight circumstances
 ,  must be provided in suitable timing.
 wouldn't be a problem if  and  can be stored
 When  < ,  is processed with free of cost.
20

#RSAC
Ciphertext Translation (CT)

 Proposed by Rogaway to process  and  independently.  Tag for  is later masked by a part of ciphertext.  secure in the nonce-respecting setting








Pick  bits. Ciphertext bits take a role of mask.

21

#RSAC
Construction 3: Sponge-Based CT (two keys)

AM

CT

10* 10*

1
r  PP
c 
2



b

PP



trunc trunc
P P P1 P 
PP
22

#RSAC
Construction 3: Sponge-Based CT (one key)

condition A M

CT

  

10* 10*

trunc trunc

1
r  P P P P P1 P
c 

2





b

PP P P



23

#RSAC
Further Optimization
24

#RSAC
Nonce Stealing in Sponge
 Nonce stealing was proposed by Rogaway.   is usually big in sponge. Many bits of  can be embedded.

rA
NP cK
25

#RSAC
Key Translation

 Absorb || more bits of  during the initialization
 Trivial related-key attacks  Trivial key-length-extension attacks  Key recovery with 2/2 in the nonce-repeat setting


rA

N

P

c K ||



26

#RSAC
Concluding Remarks
27

#RSAC
Concluding Remarks
 Proposal of three Sponge variants focusing on associated data
donkeyHeaderTrailer / Concurrent Absorption / Sponge-Based Ciphertext Translation
 high efficiency / implementation flexibility  the same level of the provable security as the ordinary sponge  Avoiding frame bits
 Further efficiency optimization with techniques for block-ciphers
Nonce stealing / Key translation
Thank you for your attention!!
28

SCIENCE

PA S S I O N

TECHNOLOGY

Analysis of ASCON
Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer Graz University of Technology April 2015
www.iaik.tugraz.at

Overview

www.iaik.tugraz.at

Broad analysis of CAESAR candidate ASCON-128
Attacks on round-reduced versions Key-recovery (6/12 rounds) Forgery (4/12 rounds)

2

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

CAESAR

www.iaik.tugraz.at

CAESAR: Competition for Authenticated Encryption ­ Security, Applicability, and Robustness
http://competitions.cr.yp.to/caesar.html
Inspired by AES SHA-3 eStream

3

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

www.iaik.tugraz.at

CAESAR ­ Candidates

ACORN AES-COBRA
AES-OTR AVALANCHE
CLOC FASER iFeed[AES] Keyak McMambo
OCB PANDA PRIMATEs SCREAM STRIBOB YAES

++AE AES-COPA
AEZ Calico Deoxys HKC Joltik KIASU Minalpher OMD -Cipher Prøst SHELL Tiaoxin

AEGIS AES-CPFB
Artemia CBA ELmD
HS1-SIV Julius LAC
MORUS PAEQ POET
Raviyoyla SILC
TriviA-ck

AES-CMCC AES-JAMBU
Ascon CBEAM Enchilada ICEPOLE
Ketje Marble NORX PAES POLAWIS Sablier Silver Wheesht

4

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

ASCON ­ Design Goals

www.iaik.tugraz.at

Security Efficiency Lightweight Simplicity

5

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Online
Single pass
Scalability
Side-Channel Robustness

ASCON ­ General Overview
Focus on ASCON-128 Nonce-based AE scheme Sponge inspired

www.iaik.tugraz.at

P1 C1

P2 C2

IV KN

64

64

p12

256

256

p6

p6

256

0 K

1

Initialization

Processing Plaintext

6

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Pt Ct

64

p12

256

T 128

K 0

K

Finalization

ASCON ­ Permutation
Iterative application of round function
One round Constant addition Substitution layer Linear layer

www.iaik.tugraz.at

7

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

ASCON ­ Round
Substitution layer

Linear layer

8

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

www.iaik.tugraz.at
x0 x1 x2 x3 x4 xxx101 x2 x3 x4

ASCON ­ Round

www.iaik.tugraz.at

x4

x4

x4  (x4  7)  (x4  41)  x4

x3

x3

x3  (x3  10)  (x3  17)  x3

x2

x2

x2  (x2  1)  (x2  6)  x2

x1

x1

x1  (x1  61)  (x1  39)  x1

x0

x0

x0  (x0  19)  (x0  28)  x0

S-box

Linear transformation

9

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Analysis ­ ASCON

www.iaik.tugraz.at

Attacks on round-reduced versions of ASCON-128 Key-recovery Forgery
Analysis of the building blocks Permutation

10

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Key-recovery ­ Idea

www.iaik.tugraz.at

Target initialization Choose nonce Observe key-stream Deduce information about the secret key

ASCON-128

rounds
6 / 12 5 / 12
5 / 12 4 / 12

time
266 235
236 218

method cube-like differential-linear

11

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Cube-like Attack ­ Idea

www.iaik.tugraz.at

Key-recovery attack based on Dinur et al. [DMP+15]
Utilizes low algebraic degree of one round
Output bits of initialization function of input bits
Choose cube variables so that cube sum only depends on a fraction of all key bits
Now able to create a "fingerprint" of a part of the secret key

12

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Initialization ­ Input

13

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

www.iaik.tugraz.at
C K1 K2 N1 N2

Cube-like Attack ­ Cube Tester

www.iaik.tugraz.at

Take all cube variables from N1 After one round one cube variable per term After two rounds two cube variables per term After 6 rounds 32 cube variables per term

14

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Cube-like Attack ­ Cube Tester

www.iaik.tugraz.at

Take all cube variables from N1 After one round one cube variable per term After two rounds two cube variables per term After 6 rounds 32 cube variables per term
Take 33 cube variables from N1 Cube sum after 6 rounds definitely zero Although degree about 64

14

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

www.iaik.tugraz.at
Cube-like Attack ­ Borderline Cubes
Take 32 cube variables from N2 e.g. N2[0..31] Degree after 6 rounds about 64 Cube sum result of non-linear equation Which variables are involved?

15

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Cube-like Attack ­ After first S-Layer

www.iaik.tugraz.at

x0[i] = N2[i]K1[i] + N1[i] + K2[i]K1[i] + K2[i] + K1[i]C[i] + K1[i] + C[i] x1[i] = N2[i] + N1[i]K2[i] + N1[i]K1[i] + N1[i] + K2[i]K1[i] + K2[i] + K1[i] + C[i] x2[i] = N2[i]N1[i] + N2[i] + K2[i] + K1[i] + 1 x3[i] = N2[i]C[i] + N2[i] + N1[i]C[i] + N1[i] + K2[i] + K1[i] + C[i] x4[i] = N2[i]K1[i] + N2[i] + N1[i] + K1[i]C[i] + K1[i]

16

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Cube-like Attack

www.iaik.tugraz.at

Take 32 cube variables from N2 e.g. N2[0..31]
Cube sum after 6 rounds result of non-linear equation Known constants Key-bits K1[0..31] Not key-bits K1[32..63] Not key-bits K2[0..63]

17

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Cube-like Attack ­ 6/12 Rounds

www.iaik.tugraz.at

Online Phase: Take fingerprint of 32 key-bits
Offline Phase: Match fingerprint by brute-forcing those 32 key-bits

18

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Cube-like Attack ­ 6/12 Rounds

www.iaik.tugraz.at

Online Phase: Take fingerprint of 32 key-bits
Offline Phase: Match fingerprint by brute-forcing those 32 key-bits
For 5/12 rounds, attack has practical complexity and has been implemented

18

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Forgery ­ Idea

www.iaik.tugraz.at

Based on differential cryptanalysis Create forgeries from known ciphertext and tag pairs
Target encryption Target finalization
Need for good differential characteristics

19

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Forgery ­ ASCON-128

www.iaik.tugraz.at

P1 C1 =  P2 C2

64

p6

p6

256

256

Pt Ct

64
p12
256

T 128

K 0

K

20

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Forgery ­ ASCON-128

www.iaik.tugraz.at

P1 C1

P2 C2

64

p6

p6

256

256

Pt Ct = 

64
p12
256

128 T = 

K 0

K

20

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Forgery ­ ASCON-128

www.iaik.tugraz.at

3/12 rounds finalization probability 2-33

input difference

after 1 round

after 2 rounds

after 3 rounds

x0 8000000000000000 8000100800000000 8000000002000080 ???????????????? x1 0000000000000000 8000000001000004 9002904800000000 ???????????????? x2 0000000000000000  0000000000000000  d200000001840006  ???????????????? x3 0000000000000000 0000000000000000 0102000001004084 4291316c5aa02140 x4 0000000000000000 0000000000000000 0000000000000000 090280200302c084

4/12 rounds finalization probability 2-101

input difference

after 4 rounds

x0 8000000000000000 ???????????????? x1 0000000000000000 ???????????????? x2 0000000000000000  ???????????????? x3 0000000000000000 280380ec6a0e9024 x4 0000000000000000 eb2541b2a0e438b0

21

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Analysis ­ Permutation

www.iaik.tugraz.at

Zero-sum distinguisher 12 rounds with complexity 2130 Search for differential and linear characteristics Proof on minimum number of active S-boxes

result rounds differential linear

proof

1

1

1

2

4

4

3

15

13

heuristic

4 5

44 > 64

43 > 64

22

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

Conclusion

www.iaik.tugraz.at

Many state-of-the-art techniques applied ASCON provides a large security margin For more information visit http://ascon.iaik.tugraz.at

23

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

SCIENCE

PA S S I O N

TECHNOLOGY

Analysis of ASCON
Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer Graz University of Technology April 2015
www.iaik.tugraz.at

Reference

www.iaik.tugraz.at

[CAE14] CAESAR committee. CAESAR: Competition for authenticated encryption: Security, applicability, and robustness. http://competitions.cr.yp.to/caesar.html, 2014.
[DEMS14] Christoph Dobraunig, Maria Eichlseder, Florian Mendel, and Martin Schla¨ ffer. Ascon. Submission to the CAESAR competition: http://ascon.iaik.tugraz.at, 2014.
[DMP+15] Itai Dinur, Pawel Morawiecki, Josef Pieprzyk, Marian Srebrny, and Michal Straus. Cube Attacks and Cube-attack-like Cryptanalysis on the Round-reduced Keccak Sponge Function. Proceedings of EUROCRYPT 2015 (to appear), 2015.

24

Ch. Dobraunig, M. Eichlseder, F. Mendel, M. Schla¨ ffer April 2015

