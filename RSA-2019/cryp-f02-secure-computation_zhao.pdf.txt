SESSION ID: CRYP-F02
Revisiting the Secret Hiding Assumption Used in Verifiable (Outsourced) Computation
Liang Zhao
Assistant Professor Sichuan University, China
#RSAC

#RSAC
Agenda of My Presentation
 Background Information  Attack Strategy  Analysis for the Decisional Secret Hiding Assumption  Privacy Analysis for Atallah-Frikken Protocols  Experimental Verification
2

#RSAC
Outline
 Background Information  Attack Strategy  Analysis for the Decisional Secret Hiding Assumption  Privacy Analysis for Atallah-Frikken Protocols  Experimental Verification
3

#RSAC
Background Information
 The general scenario about the reasonable outsourcing computation:

Resourceconstrained Client

expensive and sensitive computation returned result

Powerful Server

4

Background Information
The considered Privacy-preserving Verifiable (outsourced) Computation (PVC):
expensive and sensitive computation
Resourceconstrained Client

 The result can be accepted ?

returned result

#RSAC
 Interesting in the input of the computation ?
Powerful Server

5

#RSAC
Background Information
 Atallah and Frikken proposed a new hardness assumption called the Secret Hiding assumption (SH) at ACM AsiaCCS 2010 [Atallah & Frikken'10]
 Two concrete versions:
 Weak SH assumption (WSH)  Strong SH assumption (SSH)
6

Background Information
 What is the WSH/SSH assumption ? 1

#RSAC
What is the WSH/SSH distribution ?
T

=

Row vectors 1, 2, ... , (+1)/(++1)

Uniformly random matrix A  ×

K  ×(+1)/(++1), where k = [2 ... ] , where   ,   [( +
1)/( +  + 1)]

7

#RSAC
Background Information
2
Choose some row vectors 1, 2, ... , /(++1) uniformly at random, where   

3

R=

Combine 1, 2, ... , (+1)/(++1) with 1, 2, ... , /(++1) to generate an  ×  matrix R, and permute the rows of R, where   {2 + 1,2 + 2 + 2}

8

#RSAC
Background Information

Decision: Does R look random ?

R=

Search: given R, find 1, 2, ... , (+1)/(++1) or A
NOTE:  The decisional-WSH is the same as the decisional-
SSH  The search-WSH is to find 1, 2, ... , (+1) or A.
The search-SSH is to find 1, 2, ... , (++1) or A

WSH/SSH Assumption: No polynomial-time adversary can solve the decisional and search WSH/SSH problem

9

#RSAC
Background Information

 Atallah and Frikken proposed some WSH/SSH-based PVC protocols for matrix multiplication
 The idea of the PVC protocols:

1

T

=

Row vectors 1, 2, ... , (2+1), where   22

Uniformly random matrix A  22×
10

K  ×(2+1), where k = [2 ... ], where   ,   [2 + 1]

#RSAC
Background Information

2 For two  ×  matrices M1 and M2, use each vector  to mask them, and generate 2 + 1

matrix pairs C1 1 , C2 1 , C1 2 , C2 2 , ... C1 2+1 , C2 2+1

C1  ||C2 



M1||M2

=

+

3 The Two-Server Case: Choose 2  ×  uniformly random matrices B1, B2, ... , B2 to create  pairs
(B1, B2), ... , (B2-1, B2). Send  pairs C1 1 , C2 1 , C1 2 , C2 2 , ... C1  , C2  to the first server. Combine (B1, B2), ... , (B2-1, B2) with C1 +1 , C2 +1 , ... , C1 2+1 , C2 2+1 to generate 2 + 1 matrix pairs and permute these matrix pairs. Send the 2 + 1 permuted matrix pairs to the second server
The Single-Server Case: Choose (4 + 2)  ×  uniformly random matrices B1, B2, ... , B4+2 to create 2 + 1 pairs (B1, B2), ... , (B4+1, B4+2). Combine (B1, B2), ... , (B4+1, B4+2) with C1 1 , C2 1 , ... C1 2+1 , C2 2+1 to generate 4 + 2 matrix pairs and permute these matrix pairs. Send the 4 + 2 permuted matrix pairs to a server

11

#RSAC
Background Information
4 The Two-Server Case: Send back the products of all matrix pairs computed by the two servers.
Choose some products corresponding to M1 and M2, and interpolate these products to find the real result of M1M2 The Single-Server Case: Send back the products of all matrix pairs computed by a server. Choose some products corresponding to M1 and M2, and interpolate these products to find the real result of M1M2
Theorems: The Two-Server Case: Assume that the two servers do not collude and the decisionalWSH assumption holds. Then, the PVC protocol for matrix multiplication is private The Single-Server Case: Assume that the decisional-SSH assumption holds. Then, the PVC protocol for matrix multiplication is private
12

#RSAC
Outline
 Background Information  Attack Strategy  Analysis for the Decisional Secret Hiding Assumption  Privacy Analysis for Atallah-Frikken Protocols  Experimental Verification
13

#RSAC
Attack Strategy

 For a matrix X from either the WSH/SSH distribution or uniformly random, how to evaluate it using some special factor ?

X=

or

Strategy Overview:  Compute the rank of X  Check whether the rank of X is
below some value or not below this value

From the WSH/SSTHhe rank of a maFtrroimxthe uniform

distribution

distribution

14

If the rank of X is below some value, X is sampled from the WSH/SSH distribution; otherwise, X is sampled from the uniform distribution

#RSAC
Attack Strategy
 Why the rank-based analysis works?

X= linearly dependent ?

 Fact 1: If some row vectors
in X are linearly dependent, all the row vectors of X are linearly dependent
 Fact 2: For a matrix X
sampled from the uniform distribution, with high probability, all the row vectors of X are linearly independent

X= linearly independent

15

#RSAC
Outline
 Background Information  Attack Strategy  Analysis for the Decisional Secret Hiding Assumption  Privacy Analysis for Atallah-Frikken Protocols  Experimental Verification
16

#RSAC
Analysis for the Decisional Secret Hiding Assumption

 The used game:
Adversary
Guess X using the rank-based analysis

Public parameters
X

Choose a bit   {0, 1}
If  = 1, a matrix X is sampled from the WSH/SSH distribution; If  = 0, a matrix X is sampled from the uniform distribution

Challenger

Output   {0, 1}

  

If  = , adversary wins; else, adversary loses
17

#RSAC
Analysis for the Decisional Secret Hiding Assumption
A significant motivation:

T
1

2



=

(+1)/(++1)
These row vectors 1, 2, ... , (+1)/(++1) are linearly dependent

Uniformly random matrix A  ×

K  ×(+1)/(++1), where k = [2 ... ] , where   ,   [( +
1)/( +  + 1)]

18

#RSAC
Analysis for the Decisional Secret Hiding Assumption
For the  ×  matrix X:

with high probability, linearly dependent the rank <min(, )
(Fact 1)

with high probability, linearly independent the rank =min(, )
(Fact 2)

Adversary can distinguish the samples from these two distributions with high probability!
19

#RSAC
Outline
 Background Information  Attack Strategy  Analysis for the Decisional Secret Hiding Assumption  Privacy Analysis for Atallah-Frikken Protocols  Experimental Verification
20

Privacy Analysis for Atallah-Frikken Protocols
A significant motivation:

#RSAC
T

=

+

Uniformly random matrix A  22×

K  ×(+1)/(2+1), where k = [2 ... ], where   ,  
[( + 1)/(2 + 1)]

 The rank =  + 1  The rank <  + 1

 22 × ( + 1)/(2 + 1) matrix S = [1, 1, ... 1], where 122
 22 × ( + 1)/(2 + 1) zero matrix
Z

21

Privacy Analysis for Atallah-Frikken Protocols
For a COA-adversary (COA: Ciphertext-Only Attack):
 choose a matrix pair (M1(0), M2(0))× × × and a zero matrix pair (M1(1), M2(1))  use the rank-based analysis for the guess

The rank = (2 + 1)/(3 + 2). Then, this matrix involves all rows of (AK + S) .. This
implies that the matrix
pair is (M1(0), M2(0))

distinguishable

The rank < (2 + 1)/(3 + 2). Then, this matrix involves all rows of (AK + Z) .. This
implies that the matrix
pair is (M1(1), M2(1))

with high probability, the COA-adversary can win the game by checking the rank of the combined ciphertext matrix  (2 + 1)/(3 + 2)

E0
22

#RSAC
E1

#RSAC
Outline
 Background Information  Attack Strategy  Analysis for the Decisional Secret Hiding Assumption  Privacy Analysis for Atallah-Frikken Protocols  Experimental Verification
23

#RSAC
Experimental Verification
 Hardware and Software:
 Lenovo ThinkStation (Intel(R) Xeon(R) E5-2620, 24 hyperthreaded cores at 2.00GHz, 8GB RAM at 2.00GHz)
 Windows (Windows 7, x64_64)  NTL library version 10.5.0
 Parameters Choice:
   {80, 128, 192, 256}   =  =  ,   {2 + 1, 2 + 2 + 2},   {2 + 1, 3 + 1, 4 + 2},
 > 4 + 2
 Result:
 Adversary's advantage  Cost
24

#RSAC
Experimental Verification

The experimental results confirm:
 Adversary can efficiently break the decisional WSH/SSH assumption with high
advantage (i.e., adv.=0.5)  COA-adversary can efficiently break the privacy of Atallah-Frikken PVC Protocols
with high advantage (i.e., adv.=0.5)

Breaking the decisional WSH/SSH
assumption

Our work

Breaking the privacy of Atallah-Frikken PVC Protocols

Breaking the decisional WSH/SSH
assumption

Breaking the search variant of the
WSH/SSH assumption
25

#RSAC
Summary
Break the decisional WSH/SSH assumption
Break the privacy of Atallah-Frikken PVC Protocols for matrix multiplication
Give some experimental results to support the theoretical argument
Thank you !! Any question ?
E-mail: zhaoliangjapan@scu.edu.cn
26

