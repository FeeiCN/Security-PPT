SESSION IDC:RYP-F01
Fast Secure Comparison for Medium-Sized Integers and Its Application in Binarized Neural Networks

Mark Abspoel
CWI Amsterdam Philips Research Eindhoven

Niek J. Bouman
Eindhoven University of Technology

Joint work with Niels de Vreede and Berry Schoenmakers

#RSAC

#RSAC
Mo va on: A Scenario Involving a Trusted Third Party
Running Example: Second-Price Sealed-Bid Auc on Bidders convey their bids in private to the Auc oneer Auc oneer sells item to the highest bidder for the price of the second-highest bid

#RSAC
Mo va on: A Scenario Involving a Trusted Third Party
Running Example: Second-Price Sealed-Bid Auc on Bidders convey their bids in private to the Auc oneer Auc oneer sells item to the highest bidder for the price of the second-highest bid
Problems
Privacy Auc oneer could leak bids to other bidders Correctness Auc oneer could cheat, e.g. by increasing second-highest bid

#RSAC
Secure Mul party Computa on (MPC)
Bidders jointly emulate the Auc oneer, by means of a distributed computa on Bidders input their bids into their own computer Bids are distributed using secret sharing Computers execute a protocol (local computa ons + message exchange) to compute winning bidder and second price

#RSAC
Secure Mul party Computa on (MPC)
Bidders jointly emulate the Auc oneer, by means of a distributed computa on Bidders input their bids into their own computer Bids are distributed using secret sharing Computers execute a protocol (local computa ons + message exchange) to compute winning bidder and second price
...Achieve privacy and correctness through cryptography!

#RSAC
Secret Sharing
bidder 1
bid

bidder 2

bidder 3
6

#RSAC
Secret Sharing
bidder 1
bid

bidder 2

bidder 3
7

#RSAC
Secret Sharing
bidder 1

bidder 2

bidder 3
8

#RSAC
Secret Sharing
bidder 1

bidder 2

bidder 3
9

#RSAC
Secret Sharing
bidder 1

bidder 2

bidder 3
10

#RSAC
Secret Sharing
bidder 1

bidder 2

bidder 3
11

#RSAC
Secret Sharing
bidder 1

bidder 2

bidder 3
12

#RSAC
Secret Sharing
bidder 1

bidder 2

bidder 3
13

#RSAC
Secret Sharing
bidder 1

bidder 2

bidder 3
14

#RSAC
Secret Sharing
bidder 1

bidder 2

bidder 3
15

#RSAC
Secret Sharing
Let s  G be a secret input bid (e.g. G = Zp). Pick random r1, . . . , rn  G such that s = r1 + r2 + · · · + rn. Send each ri, the i-th share, to the i-th par cipant.
Here: n shares together reconstruct the secret. n - 1 shares or fewer give zero informa on about the secret.

#RSAC
Compu ng on Secret-Shared Data
We denote s for a secret-shared value. Addi on: x + y = x + y (local opera on) Mul plica on x · y requires interac on (exchange of messages)

#RSAC
Compu ng on Secret-Shared Data

We denote s for a secret-shared value.

Addi on: x + y = x + y (local opera on) Mul plica on x · y requires interac on (exchange of messages)

This work:

Comparison x  y =

1 if x  y

-1 if x > y

#RSAC
Secure Comparison in MPC

x := a - b

Compute sgn(x) or bsgn(x)

  1 sgn(z) := -01

if z > 0, if z = 0, if z < 0.

bsgn(z) := 1 if z  0, -1 if z < 0.

#RSAC
Using the Legendre Symbol to Compute the Sign
For infinitely many primes p, there exists d = (log p) such that (x | p) = sgn(x) x  [-d, d]
Idea goes back to [Feige et al., 1994], developed in [Yu, 2011].

#RSAC
Using the Legendre Symbol to Compute the Sign
For infinitely many primes p, there exists d = (log p) such that (x | p) = sgn(x) x  [-d, d]
Idea goes back to [Feige et al., 1994], developed in [Yu, 2011]. Example: p = 311, log2 p = 9, d = 10
x -11 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1 (x | p) 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
x 0 1 2 3 4 5 6 7 8 9 10 11 12 13 . . . (x | p) 0 1 1 1 1 1 1 1 1 1 1 -1 1 1

#RSAC
Securely Compu ng the Legendre Symbol
Assume arithme c black box · over Zp The Legendre symbol is completely mul plica ve: (a | p)(b | p) = (ab | p) for any a, b  Z.

#RSAC
Securely Compu ng the Legendre Symbol
Assume arithme c black box · over Zp The Legendre symbol is completely mul plica ve: (a | p)(b | p) = (ab | p) for any a, b  Z.
Protocol Legendre x Given pre-processed pair ( r , s ) where r R Zp and s = (r | p)
1: c  x · r 2: z  (c | p) · s 3: return z

#RSAC
Securely Compu ng the Legendre Symbol
Assume arithme c black box · over Zp The Legendre symbol is completely mul plica ve: (a | p)(b | p) = (ab | p) for any a, b  Z.
Protocol Legendre x Given pre-processed pair ( r , s ) where r R Zp and s = (r | p)
1: c  x · r 2: z  (c | p) · s 3: return z
Cannot securely evaluate (0 | p) ! (But we ignore this in this talk)

#RSAC
Fast (Low-Latency) Secure Comparisons
Legendre-based comparison requires a single round in the online phase!

#RSAC
Fast (Low-Latency) Secure Comparisons
Legendre-based comparison requires a single round in the online phase! Caveat: Comparison range limited to d

#RSAC
Fast (Low-Latency) Secure Comparisons
Legendre-based comparison requires a single round in the online phase! Caveat: Comparison range limited to d Can we increase d while keeping p fixed?

#RSAC
New Idea: Correc ng "Errors" via Majority Vote
Let's take again p = 311
x 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 . . . (x | p) 0 1 1 1 1 1 1 1 1 1 1 -1 1 1 1 1 1 -1 1 -1 1 . . .

#RSAC
New Idea: Correc ng "Errors" via Majority Vote
Let's take again p = 311
x 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 . . . (x | p) 0 1 1 1 1 1 1 1 1 1 1 -1 1 1 1 1 1 -1 1 -1 1 . . .
Inspect neighboring Legendre symbols, compute sign of y(x) = (x - 1 | p) + (x | p) + (x + 1 | p)  [-3, +3]  Z
We can compute sign of y(x) using a low-degree polynomial

In General (Window Length 2k + 1, Arbitrary k)
Defini on Let k  Z0, and let p > 2k + 1 be a Blum prime. The k-range of p, denoted dk(p), is the largest integer d such that
k
(x + i | p) > 0 holds for all x with 1  x  d,
i=-k
and we set dk(p) := 0 if no such d exists.

#RSAC
(1)

#RSAC
k > 0 Increases the Range of the Comparison

d0

1,000

d1 d2

500

0

0

20

40

60

bit length of prime ()

#RSAC
Finding Primes p with High d0(p)
Naive search: try all primes p = 2, 3, 5, 7, 11, . . . and calculate d0(p).

#RSAC
Finding Primes p with High d0(p)
Naive search: try all primes p = 2, 3, 5, 7, 11, . . . and calculate d0(p). We can do be er...

#RSAC
Finding Primes p with High d0(p)
Naive search: try all primes p = 2, 3, 5, 7, 11, . . . and calculate d0(p). We can do be er...
By mul plica vity (ab | p) = (a | p)(b | p): to calculate d0(p) only need to check (q | p) = 1 for q = 2, 3, 5, 7, 11, . . . .

#RSAC
Finding Primes p with High d0(p)
Naive search: try all primes p = 2, 3, 5, 7, 11, . . . and calculate d0(p). We can do be er...
By mul plica vity (ab | p) = (a | p)(b | p): to calculate d0(p) only need to check (q | p) = 1 for q = 2, 3, 5, 7, 11, . . . . Quadra c reciprocity: (p | q) = (-1 | q)(-1 | p)(q | p), so (q | p) only depends on residue class modulo q. We precompute (a | q) for each 0  a < q.

#RSAC
Finding Primes p with High d0(p)
Naive search: try all primes p = 2, 3, 5, 7, 11, . . . and calculate d0(p). We can do be er...
By mul plica vity (ab | p) = (a | p)(b | p): to calculate d0(p) only need to check (q | p) = 1 for q = 2, 3, 5, 7, 11, . . . . Quadra c reciprocity: (p | q) = (-1 | q)(-1 | p)(q | p), so (q | p) only depends on residue class modulo q. We precompute (a | q) for each 0  a < q. Use wheel data structure to enumerate p that have high d0(p)

#RSAC
Finding Primes p with High d0(p)
Naive search: try all primes p = 2, 3, 5, 7, 11, . . . and calculate d0(p). We can do be er...
By mul plica vity (ab | p) = (a | p)(b | p): to calculate d0(p) only need to check (q | p) = 1 for q = 2, 3, 5, 7, 11, . . . . Quadra c reciprocity: (p | q) = (-1 | q)(-1 | p)(q | p), so (q | p) only depends on residue class modulo q. We precompute (a | q) for each 0  a < q. Use wheel data structure to enumerate p that have high d0(p)
For k > 0: more involved. Details in paper, code on Github.

#RSAC
Results

Our protocol for k = 1: single-round online phase, 3 secure mul plica ons in parallel. For k = 1, 2, we have searched all1 primes up to 64 bits.

k best dk range improvement (w.r.t. d0)

0 270 1 809 2 1336

3.0× 4.9×

1With condi ons d0(p)  64, and for k = 2 also d1(p)  400.

#RSAC
Applica on: Secure Neural Network Evalua on

#RSAC
Applica on: Secure Neural Network Evalua on
Handwri en digit recogni on "MNIST" Binarized mul -layer perceptron
Neuron outputs are in {-1, +1} Uses bsgn as ac va on func on
Implementa on in the MPyC framework

#RSAC
Ques ons?

#RSAC
References
Feige, U., Kilian, J., and Naor, M. (1994). A minimal model for secure computa on (extended abstract). In Proceedings STOC '94, pages 554­563. Yu, C.-H. (2011). Sign modules in secure arithme c circuits. Cryptology ePrint Archive, Report 2011/539. ?iiT,ff2T`BMiXB+`XQ`;fkyRRf8jN.

