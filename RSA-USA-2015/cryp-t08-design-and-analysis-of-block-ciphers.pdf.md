Analyzing Permutations for AES-like Ciphers: Understanding ShiftRows
Christof Beierle1 Philipp Jovanovic2 Martin M. Lauridsen3 Gregor Leander1 Christian Rechberger3
1Horst Go¨rtz Institute for IT Security, Ruhr-Universit¨at Bochum, Germany 2Fakult¨at fu¨r Informatik und Mathematik, Universit¨at Passau, Germany
3DTU Compute, Technical University of Denmark, Denmark
CT-RSA 2015 San Francisco
1 / 29

Outline
1. Motivation 2. Notation and definitions 3. Equivalence results 4. Experiments 5. Conclusion
2 / 29

Motivation
Current status
AES-like designs are very frequent in practice: LED, mCrypton, PRINCE, ECHO, Grøstl, LANE, PHOTON, PAEQ, PRIMATEs, Prøst, STRIBOB, ...
3 / 29

Motivation
Current status
AES-like designs are very frequent in practice: LED, mCrypton, PRINCE, ECHO, Grøstl, LANE, PHOTON, PAEQ, PRIMATEs, Prøst, STRIBOB, ... Crucial: Understanding properties of diffusion and resistance to differential/linear attacks
3 / 29

Motivation
Current status
AES-like designs are very frequent in practice: LED, mCrypton, PRINCE, ECHO, Grøstl, LANE, PHOTON, PAEQ, PRIMATEs, Prøst, STRIBOB, ... Crucial: Understanding properties of diffusion and resistance to differential/linear attacks MixColumns-like step
Well understood: Pick sufficiently high branch number
3 / 29

Motivation
Current status
AES-like designs are very frequent in practice: LED, mCrypton, PRINCE, ECHO, Grøstl, LANE, PHOTON, PAEQ, PRIMATEs, Prøst, STRIBOB, ... Crucial: Understanding properties of diffusion and resistance to differential/linear attacks MixColumns-like step
Well understood: Pick sufficiently high branch number ShiftRows-like step:
Unclear; no structured approach Choice remains ad-hoc
3 / 29

Motivation
Our goal
Contribute to the understanding of picking optimal ShiftRows-like operations for generalized AES-like ciphers
4 / 29

Notation and definitions

AES-like cipher

State of size M × N of m-bit words

N

···

···

M

···

...

...

...

...

...

···

Round t equals Rt = AddRoundKeyt  Permutet  MixColumnst  SubBytest
6 / 29

AES-like cipher: SubBytest

x

SubBytest

S (x )

Substitutes each state word according to one or more S-boxes Sit,j : Fm2  Fm2 .
Allow independent S-boxes for each word xi,j in each round
7 / 29

AES-like cipher: MixColumnst
MixColumnst
Left-multiplies column j in round t by an M × M matrix Mjt over GF (2m) Allow independent Mjt for each column in each round
8 / 29

AES-like cipher: Permutet
Permutet
Shuffles state words according to a permutation t on ZM × ZN Assume independent permutations t in each round We say  = (0, . . . , T-1) is a permutation sequence for the T -round AES-like cipher
9 / 29

AES-like cipher: Permutet
Permutet
Our focus in this work: optimize the choice of  Shuffles state words according to a permutation t on ZM × ZN
Assume independent permutations t in each round We say  = (0, . . . , T-1) is a permutation sequence for the T -round AES-like cipher
9 / 29

AES-like cipher: AddRoundKeyt

x
SubBytest MixColumnst
Permutet

Kt

Rt (x)

A round key is added to the state using  in each round
Does not affect the properties we investigate, thus not considered further!

10 / 29

Difference and activity pattern
Difference
A (non-zero) difference is a value X  (Fm2 )M×N \{0}
11 / 29

Difference and activity pattern

Difference
A (non-zero) difference is a value X  (Fm2 )M×N \{0}

Activity pattern
For a difference X , let the activity pattern X~ be defined s.t.

X~i,j =

1 0

Xi,j = 0 , Xi,j = 0

11 / 29

Difference and activity pattern

Difference
A (non-zero) difference is a value X  (Fm2 )M×N \{0}

Activity pattern
For a difference X , let the activity pattern X~ be defined s.t.

for example

X~i,j =

1 0

Xi,j = 0 , Xi,j = 0

X
00 00 CA F2 00 24

X~ 001 101

11 / 29

Trails
Trail
For an AES-like cipher, a T -round trail is a (T + 1)-tuple of differences
12 / 29

Trails
Trail
For an AES-like cipher, a T -round trail is a (T + 1)-tuple of differences
Trail weight
The trail weight of X = (X 0, . . . , X T ) is defined as
T -1 M-1 N-1
X~it,j
t=0 i=0 j=0
12 / 29

Branch number
Differential branch number
For a linear automorphism  : (Fm2 )M  (Fm2 )M , we define the (differential) branch number B as the minimum number of non-zero words, in the input- and output differences (X  Y ) respectively ((X )  (Y )), when taken across all pairs of inputs X , Y  Fm2 .
13 / 29

Branch number
Differential branch number
For a linear automorphism  : (Fm2 )M  (Fm2 )M , we define the (differential) branch number B as the minimum number of non-zero words, in the input- and output differences (X  Y ) respectively ((X )  (Y )), when taken across all pairs of inputs X , Y  Fm2 .
For an AES-like cipher
The branch number for an AES-like cipher is B if and only if it is the minimum of the branch numbers obtained by left multiplication by any Mjt .
13 / 29

Problem modeling
We are interested in determining max min weight(X )
 trail X
for a T -round AES-like cipher of dimensions M × N.
14 / 29

Problem modeling
We are interested in determining max min weight(X )
 trail X
for a T -round AES-like cipher of dimensions M × N.
In our modeling of the problem, we consider the following as black-box operations
SubBytest MixColumnst , under the requirement of a specific branch number
14 / 29

Bounds and trail-optimality
Tightly guaranteed active S-boxes
Consider an AES-like cipher with branch number B. We say that a permutation sequence  tightly guarantees k active S-boxes, denoted  -B k, if and only if, when using  for the Permute operation,
There exists a valid trail of weight k and There is no valid trail of positive weight k < k.
15 / 29

Bounds and trail-optimality
Tightly guaranteed active S-boxes
Consider an AES-like cipher with branch number B. We say that a permutation sequence  tightly guarantees k active S-boxes, denoted  -B k, if and only if, when using  for the Permute operation,
There exists a valid trail of weight k and There is no valid trail of positive weight k < k.
Trail-optimality
A permutation sequence  is said to be trail-optimal if and only if there exists no  =  such that  -B k where k > k
15 / 29

Equivalences for permutation sequences 

Defining equivalence
The goal
Classify permutation sequences  incurring the same bound on the trail weight
(k) =  = (0, . . . , T -1) |  -B k , and thus reducing the search space for a brute-force approach
17 / 29

Defining equivalence
The goal
Classify permutation sequences  incurring the same bound on the trail weight
(k) =  = (0, . . . , T -1) |  -B k , and thus reducing the search space for a brute-force approach
Equivalence of permutation sequences
Informally, we say that two permutation sequences ,  are equivalent, denoted    , if and only if  -B k   -B k
Note: stronger notion of equivalence in paper
17 / 29

Structure of a state permutation

Lemma
Any permutation t on the words of an M × N state can be written as

t =     ,

where ,  permute inside each column and  permutes inside each row







t =





(Thanks to John Steinberger for aiding in this proof)
18 / 29

Reduction to permuting in the rows
Lemma
Let  be a permutation sequence for an AES-like cipher and let ,  be arbitrary permutations inside the columns of the state. Then
(0, . . . , t , . . . , T-1)  (0, . . . ,  t , . . . , T-1) holds for all t = 0, . . . , T - 1.
19 / 29

Reduction to permuting in the rows
Lemma
Let  be a permutation sequence for an AES-like cipher and let ,  be arbitrary permutations inside the columns of the state. Then
(0, . . . , t , . . . , T-1)  (0, . . . ,  t , . . . , T-1) holds for all t = 0, . . . , T - 1.
Theorem
Given any permutation sequence , one can construct  s.t.    and The permutations of  permute only the words within each row
19 / 29

Reduction to permuting in the rows
Lemma
Let  be a permutation sequence for an AES-like cipher and let ,  be arbitrary permutations inside the columns of the state. Then
(0, . . . , t , . . . , T-1)  (0, . . . ,  t , . . . , T-1) holds for all t = 0, . . . , T - 1.
Theorem
Given any permutation sequence , one can construct  s.t.    and The permutations of  permute only the words within each row
Search space (per round) reduced from (M · N)! to (N!)M
19 / 29

Rotation matrices
In the following, we restrict ourselves to rotation matrices Permutet becomes ShiftRowst Much nicer for implementations
20 / 29

Rotation matrices

In the following, we restrict ourselves to rotation matrices Permutet becomes ShiftRowst Much nicer for implementations

Rotation matrix
A rotation matrix for an an AES-like cipher is a  × M matrix  over ZN ,

 0,0 · · · 0,M-1 

 1,0 · · · 1,M-1 

=  

...

...

...

  

-1,0 · · · -1,M-1

Rotate row j of the state in round t by i,j where t  i mod 

20 / 29

Rotation matrices

In the following, we restrict ourselves to rotation matrices Permutet becomes ShiftRowst Much nicer for implementations

Rotation matrix
A rotation matrix for an an AES-like cipher is a  × M matrix  over ZN ,

 0,0 · · · 0,M-1 

 1,0 · · · 1,M-1 

=  

...

...

...

  

-1,0 · · · -1,M-1

Rotate row j of the state in round t by i,j where t  i mod 

Search space (per round) reduced from (N!)M to NM

20 / 29

Rotation matrices: Example

Consider an AES-like cipher of dimension 3 × 4 with  = 2 using

=

031 102

21 / 29

Rotation matrices: Example

Consider an AES-like cipher of dimension 3 × 4 with  = 2 using

=

031 102

When t is even

ShiftRows0

21 / 29

Rotation matrices: Example

Consider an AES-like cipher of dimension 3 × 4 with  = 2 using

=

031 102

When t is even

ShiftRows0

When t is odd

ShiftRows1

21 / 29

Equivalences for rotation matrices 

Equivalences for rotation matrices
Lemma: Re-arranging row entries of 
Let  be a rotation matrix and let 0, . . . , -1 denote permutations on each of the  rows of . Define t = t (t ) for all t. Then    .
23 / 29

Equivalences for rotation matrices
Lemma: Re-arranging row entries of 
Let  be a rotation matrix and let 0, . . . , -1 denote permutations on each of the  rows of . Define t = t (t ) for all t. Then    .
Lemma: Row-wise constant addition
Let  be a rotation matrix and let c0, . . . , c-1  ZN . Define t = t + ct mod N for all t. Then    .
23 / 29

Rotation matrix normalized form
Theorem: Equivalences
Let  be any rotation matrix. Then there exists an equivalent rotation matrix  , s.t.
1. Each row t is ordered lexicographically 2. Each t,0 = 0, i.e. 1st element in each row is zero 3. t,1  N/2 for all t, i.e. 2nd element in each row is  N/2
24 / 29

Rotation matrix normalized form

Theorem: Equivalences
Let  be any rotation matrix. Then there exists an equivalent rotation matrix  , s.t.
1. Each row t is ordered lexicographically 2. Each t,0 = 0, i.e. 1st element in each row is zero 3. t,1  N/2 for all t, i.e. 2nd element in each row is  N/2

Normal form
We define the rotation matrix normal form to satisfy 1-3, and heuristically also require that
When N is even,  should have at least one odd entry The elements in each row t are distinct



Search space (for full ) reduced to

N 2

·

N /2 M -2

24 / 29

Experiments

Experiments
Goal
Determine optimal rotation matrices  for a range of parameters (M, N, T , )
26 / 29

Experiments
Goal
Determine optimal rotation matrices  for a range of parameters (M, N, T , )
Approach
Given a fixed rotation matrix , we Focus on the MDS case, i.e. B = M + 1 Formulate a MIP problem of determining k s.t.  -M--+1 k Combine brute-forcing the normal forms with solving the MIP model using CPLEX
26 / 29

Findings

Rounds
5 6 7 8 10 12

Rijndael-192
- 42/45 46/48 50/57
- 87/90

Rijndael-256
- 50/55
- - 85/90 105/111

PRIMATEs-80
54/56 - - - - -

Prøst-256
- 85/90 96/111
- - -

Increased  from 1 to 2
Many more results in paper  Searched only among diffusion-optimal solutions
27 / 29

Conclusion and open problems
What we did
Took steps to analyze the problem of picking the best permutation for AES-like ciphers Focus on rotations as in ShiftRows due to implementation characteristics Reduced to normal form and combined with optimization using MIP Improve parameters for some existing designs
28 / 29

Conclusion and open problems
What we did
Took steps to analyze the problem of picking the best permutation for AES-like ciphers Focus on rotations as in ShiftRows due to implementation characteristics Reduced to normal form and combined with optimization using MIP Improve parameters for some existing designs
Open problems
Formulating optimization problem with trail-optimal  as decision variable (bi-level optimization) Analysis w.r.t. combining diffusion-optimality with trail-optimality
28 / 29

Thanks for you attention Questions?

SESSION ID: CRYP-T08
Improved Attacks on ReducedRound Camellia-128/192/256

Xiaoyang Dong1, Leibo li1, Keting Jia2 and Xiaoyun Wang1,3*
1Key Lab of Cryptologic Technology and Information Security, Ministry of Education,Shandong University, China, Ph.D Student
2Department of Computer and Technology, Tsinghua University 3Institute for Advanced Study, Tsinghua University

#RSAC

#RSAC
Outline
 Introduction
 Description of Camellia
 Key-Dependent Attacks
 Key-dependent 8-round differentials  Key-dependent multiple differential attack for 10-round Camellia-128
 Meet-in-the-Middle Attacks
 New 7-round property and 12-round attack for Camellia-192  New 8-round property and 13-round attack for Camellia-256
2

#RSAC
Description of Camellia

#RSAC
Description of Camellia
 In 2000, Proposed by NTT and Mitsubishi.  Adopted as an international standard ISO/IEC 18033-3, NESSIE block
cipher portfolio, as well as an e-Government recommended cipher by CRYPTREC project  Basic Information  Block Size: 128  Key Sizes: 128/192/256(denoted as Camellia-128/192/256)  Number of Rounds: 18/24/24 for Camellia-128/192/256  Structure: Feistel structure with key-dependent FL layers
4

#RSAC
Description of Camellia
5

#RSAC
Key-Dependent Attacks

#RSAC
Key-dependent truncated differentials
 4-Round Truncated Differentials with probability 2-56
7

#RSAC
Key-dependent truncated differentials

Pr=2-40 Pr=2-16
8

1. Choose some value for c1,c2
2. Choose a key subset correspondingly
3. Output difference determined
If we choose Some fixed value, like c1=0x40,c2=0x80
kf2L{2}=0,kf2L{9}=0 correspondingly
Output difference can be determined with
Pr=2-40×2-16×2-16 =2-72

Key subsets

#RSAC

There are 56 such (c1,c2).

56 pairs of (c1,c2); 4 cases differentials. Produce 224 key Dependent differentials.

Produce 224 key subsets as well. And denote the other keys as RKset
9

#RSAC
Key-dependent 8-round differentials

About 237 input differences compose
the 
Produce 237+6 8round differentials
with Pr=2-126
About26 output differences compose
the 

Extend two rounds
4-round keydependent truncated differential with FL/FL-1 layer
Append two rounds
10

#RSAC
Key-dependent attack on10-round Camellia-128
 We launch an example attack  Choose 8-round differentials that
 c1=0x08,c2=0x10  Cover KDset132
 Append 2 rounds on the bottom
11

#RSAC
Key-dependent attack on10-round Camellia-128
 Data collection:
 Structure:0 = (1, 1, 2, 1, 3, 1, 4, 1) and 0 = (2, 5, 6, 3, 7, 4, 8, 5)(6, 7, 9, 10, 11, 12, 13, 14), where  are constant,  take all values.  Encrypt to get 256 ciphertext C, store them indexed by -1  1,4,6,8 ,  Construct pairs by choosing C indexed by -1  1,4,6,8 and C'
indexed by -1  1,4,6,8 -1 0,0,0,0,0,0,0,0 1,4,6,8 .  Choose 233 structures, 233+111-32=2112 pairs constructed.  Delete the pairs whose input difference do not belong to , and
about 293 pairs left
12

#RSAC
Key-dependent attack on10-round Camellia-128
 Key Guessing
 For each pair and each possible 9, do A. Deduce 64-bit key 310 B. Deduce 32-bit key 49[1,4,6,8] C. Increase the counter of 96-bit subkey "310, 49 [1,4,6,8]"
 If the right key recovered, then terminate the attack;  Else replace the attack by choosing other 8-round differentials.  Search the Rkset to find the right key.
13

#RSAC
Key-dependent attack on10-round Camellia-128
 99.99% of Key Space
 Data: 291 CP  Time: 2104.5 ENC  Memory: 296 Bytes
 Full Key Space
 Data: 291 CP  Time: 2113 ENC  Memory: 296 Bytes
14

#RSAC
Meet-in-the-Middle Attacks

#RSAC
Meet-in-the-Middle Attacks
 Idea borrowed from Dunkelman etc.and Derbez-Selçuk's attacks on AES
 -set  Multiset
16

#RSAC
New 7-round property for Camellia-192
 7-round property
 R2[1] is the active byte  Multiset of (P-1(L8))[6] only
takes about 2128 values  X4[1]|| Y4[1] || Y5[1,2,3,5,8]
|| X8[1] || Y8[1] || X7[7] ||X8[6]||kf1 where...
17

#RSAC
Proof of 7-round property

 Obviously, Multiset of (P-1(L8))[6] is determinted by 36-byte value
 X4[1]||X5[1,2,3,5,8]||X6||kf1||kf2||X7[2,3,5,7,8]||X8[6]

 If a pair comforms to the truncated differential, then

 18-byte "X4[1]||X5[1,2,3,5,8]||X6||X7[2,3,5,7,8]" determined by 9-byte "X4[1]||Y4[1]||Y5[1,2,3,5,8]||X8[1]||Y8[1]" and 128-bit "kf1||kf2"

 Pr(Y7[4,6,7]=0)=2-24 and  Y7=P-1(FL-1(P(Y5)L3))P-1(L7)

Only has 64-bit information for Camellia-192

 So there are 2128 values for multiset of (P-1(L8))[6]

18

#RSAC
12-round attack for Camellia-192
 Add two round on the top  Three round on the bottom
19

#RSAC
12-round attack for Camellia-192
 Precomputation Phase
 Get 2128 possible values for multiset of (P-1(L8))[6] stored in 
 Online Phase
 Data collection  Structure: each contains 256 plaintexts  = (,   1,   2, 3,   4, 5, 6,   7) and  = (1, 2, 3, 4, 5, 1, 2, 6), where   = 1, ... , 7 , 1, 2 are constant, ,   = 1, ... , 6 take all values.  Choose 257 structure,257+111-16=2152 pairs satisfy -1 12 6,7 = 0
20

#RSAC
12-round attack for Camellia-192
 Key Guessing to find a pair conforming to the truncated differential
A. For  = 2,3,4,5,6,7,8, guess 12  one by one, paritially decrypt, use 11  = (12[]) to filter and 2152-7×8= 296 pairs left.
B. For  = 2,3,5,8, guess 11  , paritially decrypt, use 11  = -1 12  -1(12)[4] to filter. Then guess 11 1 and keep the 11 1 = -1 12 1 hold. 296-40= 256pairs remain.
C. For  = 1,2,3,5,8, guess 1  , make 1 1 = -1 0 1 and 1  = -1 0  -1 0 4 hold. 216 pairs remain.
21

#RSAC
12-round attack for Camellia-192
 Construct -set for every remaining pair
A. Deduce 2 1 ||2[1] by difference distribution table of s1 B. For pair (0||0, 0||0), corresponding to (2 1 , [1]), change
[1] to a different 2[1], compute 2[1], get the difference 0 1,2,3,5,8 . Get 0 = 00. C. Compute 1 1,2,3,5,8 by the guessed key 1[1,2,3,5,8], obtain then get 0 = 00 D. Get -set.
22

#RSAC
12-round attack for Camellia-192
 For each -set under 144-bit key guesses
 Compute 11[2,3,5,8], -1(10)[6] for every (P, C) pair.  Guess 11 7 to compute 10 6 .  Guess 10 6 to compute the multiset of -1(8)[6]  Check the multiset belongs to  or not, the wrong value could pass
the check with  = 2128 × 2-467.6 = 2-339.6.
23

#RSAC
12-round attack for Camellia-192
 Full Key Space
 Data: 2113 CP  Time: 2180 ENC  Memory: 2158 Bytes
24

#RSAC
New 8-round property for Camellia-256
 8-round property
 L12[5] is active  Multiset of bytes(P-1(L4))[1]
Only take 2225 values
 Determined by the 225-bit X11[5]||Y11[5]||Y10[2,3,4,6,7,8]|| Y9||X6[1]||Y6[1]||kf1||kf2L[1]|| kf2R[1]||kf2L{9}
25

#RSAC
Proof of 8-round property
 Multiset of (P-1(L8))[6] is determinted by 321-bit value
 X11[5]||X10[2,3,4,6,7,8]||X9||X8||X7 ||kf1{9-33,42-64}||kf2L[1]||kf2R[1]||kf2L[9] ||X6[1]
 If a pair comforms to the 8-round truncated differential, then
 312-bit "X11[5]||X10[2,3,4,6,7,8]||X9||X8||X7||X6[1]||kf1{9-33,4264}||kf2L[1]" determined by 216-bit "X11[5]||Y11[5]||Y10[2,3,4,6,7,8]|| Y9||X6[1]||Y6[1]||kf1||kf2L[1]"
 kf2R[1]||kf2L{9} are also needed to compute Multiset of (P-1(L8))[6]
 Totally, 225-bit determines the Multiset of (P-1(L8))[6]
26

#RSAC
13-round attack for Camellia-256
 Add 4 rounds on the top 1 rounds on the bottom
27

#RSAC
13-round attack for Camellia-256
 Precomputation Phase
 Compute 2225 values of multiset store them in hash table .
 Online Phase
 Data collection  Structure: each contains 232 ciphertexts 13 = (1, 1, 2, 3, 2, 4, 5, 6) and 13 = (1, 1, 2, 3, 2, 4, 5, 6), where ,   = 1, ... , 6 are constant, ,   = 1,2 take all values. Decrypt to get the plaintexts.  Choose 281 structure to get 2144 pairs
28

#RSAC
13-round attack for Camellia-256
 Key Guessing to find a pair conforming to the truncated differential
A. Guess 1 , compute -1 1 ,eliminate pairs that do not satisy -1 1 6,7 = 0, 2144-16 = 2128 pairs left.
B. For  = 2,3,4,6,7,8, guess 2  , paritially encrypt, make 2  = -1 0  hold. Then guess 2 1 to compute 2 . 2128-78= 272pairs remain.
C. For  = 2,3,5,8, guess 3  , make 3 1 = -1 1  -1 1 4 Then guess 3 1 and keep the pairs satisfy 3 1 = -1 1 [1]. 232pairs left for every 168-bit key guess.
29

#RSAC
13-round attack for Camellia-256

 Key Guessing to find a pair conforming to the truncated differential

D.

For -1 the

 = 1,5, guess 13 

13 pairs

 hold. Then when 12[1]

g,upeasrstially3d e1crtyopct,ommapkuete1312[1=]and  0. 28pairs remain.

delete

E. Compute the value 3 by guessing 3 [4,6,7] and deduce 4 1 for each pair.

 Construct -set for each pair, and compute the corresponding multiset to check it whether belongs to , and recover the right key.

30

#RSAC
13-round attack for Camellia-256
 Full Key Space
 Data: 2113 CC  Time: 2232.7 ENC  Memory: 2231 Bytes
31

That is all

Thank you!

#RSAC

