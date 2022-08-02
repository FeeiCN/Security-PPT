SESSION ID: CRYP-R09
Quantum Chosen-Ciphertext Attacks against Feistel Ciphers

Gembu Ito
Nagoya University
Joint work with Akinori Hosoyamada, Ryutaroh Matsumoto, Yu Sasaki and Tetsu Iwata

#RSAC

#RSAC
Overview

3-round Feistel construction is a PRP, 4-round is an SPRP
[LR88]

Rounds 2

3

4

Classic CPA insecure CPA secure [LR88] CCA insecure

CCA secure [LR88]

· insecure: efficient distinguishing attacks · secure: indistinguishable from a random permutation

[LR88] Luby, M., Rackoff, C.: How to construct pseudorandom permutations from pseudorandom functions. SIAM J. Comput. 1988.
1/49

#RSAC
Overview

3-round Feistel construction is not secure against quantum CPAs
[KM10]

Rounds 2

3

4

Classic CPA insecure CPA secure [LR88] CCA insecure

CCA secure [LR88]

Quantum

QCPA insecure [KM10]

· insecure: efficient distinguishing attacks · secure: indistinguishable from a random permutation

[KM10] Kuwakado, H., Morii, M.: Quantum distinguisher between the 3-round Feistel cipher and the random permutation. ISIT 2010.
2/49

#RSAC
Overview

4-round Feistel construction is not secure against quantum CCAs

Rounds 2

3

4

Classic CPA insecure CPA secure [LR88] CCA insecure

CCA secure [LR88]

Quantum

QCPA insecure [KM10] QCCA insecure

3/49

#RSAC
Overview

4-round Feistel construction is not secure against quantum CCAs

Rounds 2

3

4

Classic CPA insecure CPA secure [LR88] CCA insecure

CCA secure [LR88]

Quantum

QCPA insecure [KM10] QCCA insecure

· Extend to practical designs of Feistel ciphers (including key recovery attacks)

4/49

#RSAC
Outline
1. Introduction 2. Previous Quantum Distinguisher 3. Quantum CCAs against Feistel Constructions
­ Quantum Distinguisher against 4-round Feistel Constructions ­ Formalization of Quantum Distinguishers ­ Quantum CCAs against Practical Designs of Feistel Constructions
4. Concluding Remarks

#RSAC
Outline
1. Introduction 2. Previous Quantum Distinguisher 3. Quantum CCAs against Feistel Constructions
­ Quantum Distinguisher against 4-round Feistel Constructions ­ Formalization of Quantum Distinguishers ­ Quantum CCAs against Practical Designs of Feistel Constructions
4. Concluding Remarks

#RSAC
Feistel Ciphers

Feistel-F Construction

 -bit state is divided into /2-bit halves  and , then

+1      ,

+1  

  is a keyed function taking a subkey  as input

7/49

#RSAC
Practical Designs of Feistel Ciphers
Feistel-KF Construction
 DES, Camellia
Feistel-FK Construction
 Piccolo, SIMON, Simeck

Feistel-KF

8/49 Feistel-FK

#RSAC
Main Tool: Simon's algorithm [Sim97]
Problem
Given : {0,1}  {0,1} such that there exists a non-zero period  with   =     =   
for any distinct ,   {0,1}, the goal is to find 
  2/2 queries in the classical setting  Simon's algorithm [Sim97] can find  with   quantum queries
[Sim97] Simon, D.R.: On the power of quantum computation. SIAM J. Comput. 26(5),1474­1483 (1997)
9/49

#RSAC
Main Tool: Simon's algorithm [Sim97]
Many polynomial-time attacks using Simon's algorithm
­ 3-round Feistel construction [KM10] ­ Even-Mansour [KM12] ­ LRW, various MACs, and CAESAR candidates [KLL+16] ­ AEZ [Bon17] ­...
[KM12] H. Kuwakado and M. Morii. Security on the Quantum-Type Even-Mansour Cipher. ISITA 2012. [KLL+16] M. Kaplan, G. Leurent, A. Leverrier, and M. Naya-Plasencia. Breaking Symmetric Cryptosystems using Quantum Period Finding. CRYPTO 2016. [Bon17] Bonnetain, X.: Quantum Key-Recovery on Full AEZ. SAC 2017.
10/49

#RSAC
Outline
1. Introduction 2. Previous Quantum Distinguisher 3. Quantum CCAs against Feistel Constructions
­ Quantum Distinguisher against 4-round Feistel Constructions ­ Formalization of Quantum Distinguishers ­ Quantum CCAs against Practical Designs of Feistel Constructions
4. Concluding Remarks

#RSAC
Overview of the Distinguisher
Given an oracle  which is  =  or a random permutation   Perm(), distinguish the two cases
­ The adversary can make superposition queries to 
Distinguisher
1. Construct a function  that
­ has a period  when  is , and ­ does not have any period when  is 
2. Check if  has a period or not by using Simon's algorithm
12/49

#RSAC
Quantum Distinguisher against 3-round Feistel-F [KM10]

0, 1  0,1 /2 : arbitrary distinct constants

: 0,1 × 0,1 /2  0,1 /2

  

   

13/49

#RSAC
Quantum Distinguisher against 3-round Feistel-F [KM10]
3 does not contribute to  Orange line and  cancel each other
14/49

#RSAC
Quantum Distinguisher against 3-round Feistel-F [KM10]
15/49

#RSAC
Quantum Distinguisher against 3-round Feistel-F [KM10]
  has a period  =       
    = 2   1  = 2   1 0  1 1  1 1 =    1    1 0  1 1
16/49

#RSAC
Key Recovery Attacks
Distinguisher can be extended to key recovery attacks Key recovery attacks against Feistel-KF [HS18,DW17]
­ Combining Grover search [Gro96] and the distinguisher ­ Leander and May developed this technique [LM17]
[HS18] Hosoyamada, A., Sasaki, Y.: Quantum Demiric-Selçuk meet-in-the-middle attacks: Applications to 6-round generic Feistel constructions. SCN 2018. [DW17] Dong, X., Wang, X.: Quantum key-recovery attack on Feistel structures. IACR Cryptology ePrint Archive 2017. [Gro96] Grover, L.K.: A fast quantum mechanical algorithm for database search. STOC 1996. [LM17] Leander, G., May, A.: Grover meets Simon - Quantumly attacking the FX-construction. ASIACRYPT 2017.
17/49

#RSAC
Outline
1. Introduction 2. Previous Quantum Distinguisher 3. Quantum CCAs against Feistel Constructions
­ Quantum Distinguisher against 4-round Feistel Constructions ­ Formalization of Quantum Distinguishers ­ Quantum CCAs against Practical Designs of Feistel Constructions
4. Concluding Remarks

#RSAC
Quantum Distinguisher against 4-round Feistel-F

0, 1  0,1 /2 : arbitrary distinct constants

: 0,1 × 0,1 /2  0,1 /2

  

   

19/49

#RSAC
Quantum Distinguisher against 4-round Feistel-F
4 has no effect Last 1 does not contribute to 
20/49

#RSAC
Quantum Distinguisher against 4-round Feistel-F
21/49

#RSAC
Quantum Distinguisher against 4-round Feistel-F
22/49

#RSAC
Quantum Distinguisher against 4-round Feistel-F
23/49

#RSAC
Quantum Distinguisher against 4-round Feistel-F
Computation after  does not depend on ,   has a period  = 1  1 0  1 1
24/49

#RSAC
Quantum Distinguisher against 4-round Feistel-F
 cancels each other 0, 0  0  1 = 1, 1  0  1 = {0, 1}
25/49

#RSAC
Quantum Distinguisher against 4-round Feistel-F
 cancels each other 0, 0  0  1 = 1, 1  0  1 = {0, 1} Computation after  does not depend on , 
26/49

#RSAC
Quantum Distinguisher against 4-round Feistel-F
 has a period  = 1  1 0  1 1 since
 0  =   1 0  1 1  1 1 =   1 0 =  0
27/49

#RSAC
Relaxing Simon's Algorithm
We know that () = ( )   =    () = ( )   =    may or may not hold We formalize a sufficient condition to eliminate the need to prove it
28/49

#RSAC
Relaxing Simon's Algorithm
Simon's Algorithm uses the circuit  that returns a vector  that is orthogonal to all periods 1, 2, ... To recover  from 1, 2, ...,  has to satisfy
  =     =   
29/49

#RSAC
Relaxing Simon's Algorithm
In distinguisher
­ If  has a period , we obtain     0 (mod 2) (other periods can exist)  dimension of the space spanned by 1, 2, ... is at most  - 
­ If  doesn't have a period,  can take any value of 0,1   dimension can reach 
[SS17] Santoli, T., Schaffner, C.: Using Simon's algorithm to attack symmetric-key cryptographic primitives. Quantum Information & Computation 2017.
30/49

#RSAC
Relaxing Simon's Algorithm
In distinguisher
­ If  has a period , we obtain     0 (mod 2) (other periods can exist)  dimension of the space spanned by 1, 2, ... is at most  - 
­ If  doesn't have a period,  can take any value of 0,1   dimension can reach 
Checking the dimension of the space spanned by 1, 2, ... Similar observation is pointed out in [SS17]
­ We formalized a sufficient condition
[SS17] Santoli, T., Schaffner, C.: Using Simon's algorithm to attack symmetric-key cryptographic primitives. Quantum Information & Computation 2017.
31/49

#RSAC
Relaxing Simon's Algorithm



=


max Pr[
0,1 {0} 



= (  )] ( is a fixed permutation)

irr =   Perm    > 1 -  ( is a small constant 0   < 1)

Checking the dimension of the space spanned by 1, 2, ... , 

Success probability is at least

1

-

2 /2

-

Pr[




irr ]

[SS17] Santoli, T., Schaffner, C.: Using Simon's algorithm to attack symmetric-key cryptographic primitives. Quantum Information & Computation 2017.
32/49

#RSAC
Outline
1. Introduction 2. Previous Quantum Distinguisher 3. Quantum CCAs against Feistel Constructions
­ Quantum Distinguisher against 4-round Feistel Constructions ­ Formalization of Quantum Distinguishers ­ Quantum CCAs against Practical Designs of Feistel Constructions
4. Concluding Remarks

#RSAC
Quantum Attacks against Practical Designs
The same distinguishing attack against Feistel-F can be used against Feistel-KF Extend to quantum distinguishing attacks against 6-round Feistel-FK Key recovery attacks against 7-round Feistel-KF and 9-round Feistel-FK
34/49

#RSAC
Quantum Distinguisher against 6-round Feistel-FK
: 0,1 × 0,1 /2  0,1 /2          
35/49

#RSAC
Quantum Distinguisher against 6-round Feistel-FK
: 0,1 × 0,1 /2  0,1 /2          
36/49

#RSAC
Quantum Distinguisher against 6-round Feistel-FK
 in gray and 6 has no effect
37/49

#RSAC
Quantum Distinguisher against 6-round Feistel-FK
Connect 2 figures
38/49

#RSAC
Quantum Distinguisher against 6-round Feistel-FK
Almost the same as the 4-round distinguisher
39/49

#RSAC
Quantum Distinguisher against 6-round Feistel-FK
40/49

#RSAC
Quantum Distinguisher against 6-round Feistel-FK
41/49

#RSAC
Quantum Distinguisher against 6-round Feistel-FK
Almost the same as the 4-round distinguisher
­ Replace  with   1 ­ Replace   with    +1
 = 1   0  1   1  1
42/49

Key Recovery Attacks

#RSAC
1. Implement a quantum circuit  that
­ takes the subkey for the first ( - 3) round and the value after the first ( - 3) round as input, and
­ returns the oracle output

43/49

#RSAC
Key Recovery Attacks
If the guess is correct
=
44/49

#RSAC
Key Recovery Attacks
2. For each guess, apply the distinguisher to  3. If the distinguisher returns that "this is a random permutation",
then judge the guess is wrong, otherwise the guess is correct. If the guess is correct
=
45/49

#RSAC
Key Recovery Attacks
Exhaustive search of the first ( - 3) round :  2 -3 /2 by Grover search 3-round distinguisher :   for each subkeys guess
If the guess is correct
=
46/49

#RSAC
Key Recovery Attacks
Combining Grover search and the distinguisher 7-round Feistel-KF Construction
 Recover 7/2-bit key with  2 -4 /4 = (23/4) (CCAs)
9-round Feistel-FK Construction
 Recover 9/2-bit key with  2 -6 /4 = (23/4) (CCAs)
8-round Feistel-FK Construction
 Recover 8/2-bit key with  2 -5 /4 = (23/4) (CPAs)
47/49

#RSAC
Outline
1. Introduction 2. Previous Quantum Distinguisher 3. Quantum CCAs against Feistel Constructions
­ Quantum Distinguisher against 4-round Feistel Constructions ­ Formalization of Quantum Distinguishers ­ Quantum CCAs against Practical Designs of Feistel Constructions
4. Concluding Remarks

#RSAC
Concluding Remarks

Rounds 3

4

Classic CPA secure [LR88] CCA secure [LR88]

Quantum QCPA insecure [KM10] QCCA insecure

Construction Distinguish Key Recovery

Feistel-KF 4-round 7-round

Feistel-FK 6-round 9-round (and 8-round QCPA)

Open Questions  Tight bound on the number of rounds that we can attack Feistel-F
 Improving the complexity or extending the number of rounds of the attacks against Feistel-KF and Feistel-FK

49/49

