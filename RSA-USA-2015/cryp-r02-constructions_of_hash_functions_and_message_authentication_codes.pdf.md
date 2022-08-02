SESSION ID: CRYP-R02
Constructions of Hash Functions and Message Authentication Codes

Yusi Zhang
PhD in Computer Science University of California, Davis
yzhangad@gmail.com

#RSAC

Use an Error-Correction

Code for Fast, Beyond-

#RSAC

birthday-bound

Authentication

#RSAC
Motivation: Beyond-birthday-bound
 Birthday Barrier: the 2n/2 - level.  Best Known Bounds for Some MAC Modes:
 CMAC: O(q/2n)  PMAC: O(q2/2n)
 Acceptable in Most Cases, but...

#RSAC
Motivation Cont'd
 Problems:
 Short 64-bit cipher is still widely deployed (financial institutions).  Hard to replace these ciphers (compatibility).
 Objective of this work:
 Go beyond the Birthday Barrier.  Relatively Simple Modifications on an Existing Scheme (e.g. PMAC).  Avoid too much cost on efficiency and key setup.

Prior Work: PMAC with Parity (PMACwP)

#RSAC

[Yasuda'12]

 Achieve a New Bound:

O(q2/2n + q/22n)

 Shortcomings:  4 independent keys needed.  1.5 slowdown.

#RSAC
Generalizing the "Parity-processing" Stage
 M[1], M[2] -> M[1], M[2], M[1] + M[2] in matrix form:
1 0 0 1 1 1
 What about a larger matrix?  Desired Property: As many different output blocks as possible.  Exactly the property of an MDS code.

#RSAC
Generalization from 2 Differences to Multiple Ones

M[1]||M[2]||...||M[l]

G

L1

P1

P2

L2

...

Lm Pm

 Improve the bound to O(q2/2n+qd-1/2dn)
 But even more keys are needed...

#RSAC
Reduce the Number of Keys
 In the analysis, only interested in the collision of the final input.
 Possible to replace the many independent ciphers with a single one.
 Of course, a new proof becomes necessary...

#RSAC
Result of the New Analysis
 The bound is degraded:
 from O(q2/2n+qd-1/2dn) to O(q2/2n+q(d-1)/2/2(d+1)n/2).
 But, we've reduced the key number from m+1 to 2 only!

#RSAC
Summary
 We've generalized Yasuda's PMACwP by replacing its "parityprocessing" with an MDS matrix multiplication.
 Based on the basic generalization, we further reduced the number of keys to 2, at the cost of a degradation of provable security.
 Theoretically, our scheme can achieve a rate arbitrarily close to 1, a security level arbitrarily close to 2n, by choosing large enough MDS matrices.
 Surprisingly, the above can be done by 2 independent keys only.

#RSAC
Candidate Topics for Future Work
 Reduce the number of keys even further: 2 to 1?  Go beyond "birthday-barrier" for query numbers, q, as well.  Analysis of Online Security.

