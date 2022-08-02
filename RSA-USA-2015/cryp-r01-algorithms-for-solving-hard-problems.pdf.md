SESSION ID: CRYP-R01
Finding Shortest Lattice Vectors in the Presence of Gaps

Wei Wei 1, Mingjie Liu2, Xiaoyun Wang3

1 Institute of Information Engineering, Chinese Academy of Sciences, China/ Post-doc Researcher 2 Research Institute of Telemetry, 3Tsinghua University, China April 23, 2015

#RSAC

#RSAC
Outline
 Motivation  Revisit SVP Algorithms on Lattices with Gaps  Search SVP for Some Lattice-based Cryptosystems  Summary
2

#RSAC
Motivation

#RSAC
Shortest Vector Problem
 SVP: NP-Hard
 Given a basis of a lattice, find a nonzero shortest lattice vector.
 uSVP: unique-Shortest Vector Problem
   >   , find a nonzero shortest lattice vector.
 SVP algorithms
 Deterministic: enumeration, Voronoi cell computation based...  Probabilistic: heuristic & provable sieve...
4

#RSAC
Previous Work
 Probabilistic Sieve algorithms:
 Heuristic:
5

#RSAC
Previous Work
 Probabilistic Sieve algorithms:
 Provable:
6

#RSAC
Motivation
 What about lattices with gaps?
 Successive minima 2  > 1   Sparse distribution  Complexity decreases obviously
as the increase of gap  Common in cryptographic instances
7

SVP Algorithms on Lattices

#RSAC

with Gaps

#RSAC
List-Sieve [MV09]
 Creat a set of short vectors by subtractions.  All previous vectors are used to reduce a new one.  Random perturbation technique.  Several lattice vectors might correspond to one perturbed vector.  A collision happens with a high probability when there are enough
sieved vectors.
9

#RSAC
ListSieve-Birthday[PS09]
 Apply List-Sieve, sample lattice points that fall inside of the corona which consist of the first list.
 Sample small and independent points by reducing random points with respect to the first list.
 A collision occurs with high probability.
10

#RSAC
Revisit Sieve Algorithms on Lattices with Gaps
 Two cases
 2-gap: 2  > 1   +1-gap: +1  > 1 
 Concretely
 Packing density of lattices with gaps  ListSieve-Birthday
11

#RSAC
Packing density of lattices with 2-gap
What is the maximum number of lattice points inside a sphere with radius 01?
 Our result: If 2  > 1  , then
| , 01  |  2+o  , where  = log2 0 - log2  + 0.401 and 1    0.
12

#RSAC
Count the Number of Points
Partition into coronas
13

#RSAC
Count the Number of Points
Partition into coronas
14

#RSAC
Count the Number of Points
Partition into coronas
15

#RSAC
Count the Number of Points
Partition into coronas
16

#RSAC
Count the Number of Points
Partition into coronas
17

#RSAC
Count the Number of Points
Partition into coronas
18

#RSAC
Count the Number of Points
Partition into coronas
19

#RSAC
Count the Number of Points
Partition into coronas
A:  v  u,  v-u  1 B= {w:  t  A, s.t.  w-t < 1}
20

#RSAC
Estimate |A|, |B|
 |B|  (1 + 2)|A|
21

#RSAC
Estimate |A|, |B|

 |B|  (1 + 2)|A|

 |A|  2(log2 0- log2 +0.401)+o 

22

#RSAC
Estimate |A|, |B|

 |B|  (1 + 2)|A|

 |A|  2(log2 0- log2 +0.401)+o 

 Finally, | , 01  |  poly()  (|A| + |B|)  2+o 
23

#RSAC
Complexity Analysis of ListSieve-Birthday

 Time: 2+o  , Space: 2+o 

 Minimize the time complexity,

1

2

 = 0.802 + log2(

1

-

1 42

+





20.401

(1

-

412)).

 When 2-gap >1.78,  < 2,  < 1 by selecting  = 1.0015.

24

#RSAC
s corresponding to different 2-gap
25

#RSAC
Sieve for SVP with +-gap
 +-gap
+1  > 1  , 1     - 1
 NTRU lattice +1-gap ([HPS98], heuristic)
 Packing density
| , 01  |  2 log2 0- log2 +0.401 + log2 +0.401 +o  .
26

#RSAC
Sieve for SVP with +-gap

  = 0.802 + log2(

1 1-412

+

(20.401)(21- )(1-412)).

27

#RSAC
Sieve for SVP with +-gap

  = 0.802 + log2(

1 1-412

+

(20.401)(21- )(1-412)).

Complexity depends on the value and location
of gap!
28

Search SVP for Some

#RSAC

Lattice-based Systems

#RSAC
Search SVP for Some Lattice-based Systems
 LWE (Learning with Errors)-based cryptosystem
 A BDD instance in the -ary lattice   = {  :  =  mod  for   }.
 [LW11] gave its 2-gap of the embedding lattice.  Our result: For the parameter  = 128 in the scheme[Gentry et. al.'08],
 -gap .  Time: 20.8172+o  .  Space: 20.4086+o  .  Approximately to 20.802+o  (20.401+o  ).
30

#RSAC
Search SVP for Some Lattice-based Systems
 GGH encryption cryptosystem [Goldreich, Goldwasser, Halevi'97]
 A BDD-based cryptosystem  five challenges: =200, 250, 300, 350, 400.  [Nguyen'99] Four of them are solved and it is indicated the excepted
-gap> . .  Our result: The time complexity of ListSieve-Birthday is 21.212+o  .
31

#RSAC
Search SVP for Some Lattice-based Systems
 Worst-case/average-case equivalent cryptosystems
 uSVP based: [Ajtai, Dwork'97, Regev'04].  GapSVP based: [Regev'09, Peikert'09].
Then can be equivalently based on uSVP() since the reduction from uSVP to GapSVP.  Our result: Time complexity is approximately to 20.802+o  .
32

#RSAC
Search SVP for some lattice-based systems

 NTRU encryption cryptosystem [Hoffstein, Pipher, Silverman'98]

 Adopted to standard of IEEE Std 1363.1 in 2008.

 [HPS98] Heuristically, the NTRU lattice (dimension=2) has a +1-

gap approximately

 4()1/2

1

.

 For  = 503,  = 256,  = 216,  = 72, the time to solve this SVP of NTRU lattice is 21.8054+o  .

33

#RSAC
Summary

#RSAC
Summary
 Study SVP on a lattices possessing gaps
 New upper bounds for the packing density of lattices with -gap.  Renew the complexity of the ListSieve-Birthday
 Discussions on SVP search for some lattice-based cryptosystems
 LWE-based, GGH, NTRU...  Cryptographic lattices should avoid large gaps.
35

#RSAC
Thank you for your attention!
36

SESSION ID: CRYP-R01
A Simple and Improved Algorithm for Integer Factorization with Implicit Hints

*Koji Nuida1, Naoto Itakura2, Kaoru Kurosawa2
1 AIST, Japan / JST PRESTO Researcher 2 Ibaraki University, Japan April 23, 2015

#RSAC

#RSAC
Contents
 Introduction: Integer factoring with implicit hints for LSBs of factors  Our results
 Algorithm: Better bound, simpler proof  (Potential) application to "(batch) FHE over integers" etc.
 Details and computer experiments
2

#RSAC
Introduction

#RSAC
Background: Cryptography and Factoring
 Computational hardness of integer factoring is:
 Necessary (and sometimes sufficient) for security of many cryptosystems  Including the RSA cryptosystem
 Therefore, important to analyze
4

#RSAC
Background: Factoring with Hints
 Factoring with explicit hints
 E.g., [Coppersmith 1996], where some bits of the factors are known  Related to: Side-channel attacks
 Factoring with implicit hints (this work)
 E.g., [May-Ritzenhofen 2009], where only some relations of bits of the factors are known
 Related to: Attacks on implementation with weak randomness
5

#RSAC
Factoring with Implicit Hints
 Simplest case ([MR09], [Kurosawa-Ueda 2013]): For two integers 1 = 11, 2 = 22, assume ( LSBs of ) = ( LSBs of )
 Or equivalently,    ( )
 Generalizations (not considered in this work):
 More integers ([MR09], [Sarkar-Maitra 2011], ...)  MSBs, or combination of LSBs and MSBs ([SM11], ...)
6

#RSAC
Previous Results
 Assume 1 = 11, 2 = 22 and    ( )  Also assume ,  <  (i.e., 1, 2 are -bit primes)  Polynomial-time factoring of 1, 2, if
 [MR09]   2 + 3  [KU13]   2 + 1
7

#RSAC
Our Result: Summary

#RSAC
Our Result

 Assume 1 = 11, 2 = 22 and    ( )

 Also assume ,  <  (i.e., 1, 2 are -bit primes)

 Polynomial-time factoring of 1, 2, if

 [MR09]   2 + 3

Non-constant

 [KU13]   2 + 1

improvement!

 Our result:  =  - ( ), where  is a parameter (e.g., security parameter of a factoring-based cryptosystem)

9

#RSAC
Advantage: Simplicity and Generality
 Our result (as well as [KU13]) extends to 1  2 ( ) and 1, 2   for integers , 
 Originally  = 2,  = 2
 We do NOT assume that 1, 2, 1, 2 are primes
 Only assume that 1, 2,  are mutually coprime (almost automatic)
 Very simple, easy-to-follow proof
 No lattice inequalities (Minkowski bound, Hadamard's inequality, ...)
10

#RSAC
Related Work

 Factors 1, 2, 1, 2 in [SM11] (and some others)
 Prime

 Balanced (i.e., ||2  ||2)  In fact, their result requires ||2 to be bounded above

 Factors 1, 2, 1, 2 in our result

 Not necessarily prime

Good

 Unbalanced (i.e., ||2  ||2)

Sometimes good (next slide)

 ||2 is bounded below only by the condition  = 2 - (log )

11

#RSAC
(Potential) Applications
 Variants of (batch) "fully homomorphic encryption over integers" with error-free approximate GCD assumptions [Cheon et al. 2013], [N.-Kurosawa, EUROCRYPT 2015]
 Ciphertexts are integers modulo  = 12  , where ||2  ||2  Apply our result to factors  and / (unbalanced, non-prime)
 Okamoto-Uchiyama cryptosystem, Takagi's variant of RSA
  = ,   2 (unbalanced, non-prime)
12

#RSAC
Our Result: Details

#RSAC
(Integer) Lattice and Basis Reduction

 Lattice in 2-dim. plane

Lattice reduction

Bad (long) basis

Good (shortest) basis
14

#RSAC
Lattice for Our Problem
  = 1, 2  2  21 - 12  0   (recall 1 = 11, 2 = 22, 1  2 ( ) )
 Same as previous work   and initial basis (1, 2/1  ), (0, ) are publicly known  Involves secret vector  = (, )
Find this!
15

#RSAC
Previous Results
 Outline of [KU13]:
 Find the shortest vector  in 2-dim. lattice  by Gaussian reduction  If (*) the second shortest basis vector of  is longer than , then
  , in particular  = ,  = ± (since 1, 2 are coprime)  (*) is guaranteed when   2 + 1 (by Hadamard's inequality)
 And not guaranteed if  < 2 + 1
16

#RSAC
Our Idea

 Use not only the shortest vector , but also the second shortest basis vector  (both obtained by Gaussian reduction at once)

  = 1, 2 can be written as  =  + , ,     If (**)  ,   (), then ,  (hence ) are found in time ()



 =  +  implies ||, || =

(quadratic in ,,) det ,

 (const)  2/

 Where we used |det(, )| = |det( 1, 2/1   , 0,  )| =  (property of Gaussian reduction) and |  |  |  |  |  |  

 The other case  < |  | is as in the previous work

 Hence (**) is guaranteed when 2/ = () (or 2 -  = (log ))

17

#RSAC
Our Proposed Algorithm
1. Compute ,  from 1, 2/1   , 0,  by Gaussian reduction 2. Output common factors of  and  (or ), if exists 3. For  = 2,3, ..., do the following
1. For integers ,  satisfying  +  = , do the following 1. If |1 + 1| is a non-trivial factor of 1, output it
18

#RSAC
Computer Experiments: Average Time

  = 250  Range of :
501 = 2 + 1 to 475  Ordinary PC  100 trials each

For  = :  221 sec. ( 4 min.)

100% Success
(cf., in [KU13]: 40% for  =  0% for  = )

19

#RSAC
Computer Experiments: # of Iterations

  = 250  Range of :
501 = 2 + 1 to 475  Ordinary PC  100 trials each

For  = :  40,000

Bound by our argument:  +- =   .  × 
(Probably too loose)

20

#RSAC
Summary

#RSAC
Summary and Future Work
 Improvement of a known factoring algorithm with implicit hints
 Better bound, even by a simpler proof
 (Potential) applications; e.g., (batch) FHE over integers  Future work:
 Sharper analysis of bounds?  More applications?
Thank you for your attentions!
22

