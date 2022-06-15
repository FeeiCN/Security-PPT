SESSION ID: CRYP-R09
Another Look at Some Isogeny Hardness Assumptions
Simon-Philipp Merz1, Romy Minko2, Christophe Petit3
1Royal Holloway, University of London 2University of Oxford 3University of Birmingham

#RSAC

#RSAC
Isogeny-based Cryptography
post-quantum (PQ) secure key exchange [JF11] based on hardness of finding large-degree isogenies small keys, but relatively slow compared to other PQ proposals
2

#RSAC
Isogeny-based Cryptography
post-quantum (PQ) secure key exchange [JF11] based on hardness of finding large-degree isogenies small keys, but relatively slow compared to other PQ proposals
This talk
cryptanalysis of an isogeny-based hardness assumption attack on Jao-Soukharev undeniable signatures
2

#RSAC
Contents
Preliminaries Supersingular Isogeny Diffie-Hellman Related Isogeny Hardness Assumptions Attack on Jao-Soukharev's Undeniable Signatures Conclusion
3

#RSAC
Elliptic Curves

­ solutions equation

over some field to the

for fixed

and at infinity

4

#RSAC
Elliptic Curves

­ solutions equation

over some field to the

for fixed

and at infinity

4

#RSAC
Elliptic Curves

­ solutions equation

over some field to the

for fixed

and at infinity

­ advantage in Cryptography: small keys

4

#RSAC
Elliptic Curve Discrete Logarithm Problem
Additive group structure on elliptic curves
ECDLP: Given P and [k]P, compute k.
5

#RSAC
Elliptic Curve Discrete Logarithm Problem
Additive group structure on elliptic curves
ECDLP: Given P and [k]P, compute k.
5

#RSAC
Elliptic Curve Discrete Logarithm Problem
Additive group structure on elliptic curves
ECDLP: Given P and [k]P, compute k.
5

#RSAC
Elliptic Curve Discrete Logarithm Problem
Additive group structure on elliptic curves
ECDLP: Given P and [k]P, compute k.
5

#RSAC
Elliptic Curve Discrete Logarithm Problem
Additive group structure on elliptic curves
ECDLP: Given P and [k]P, compute k.
5

#RSAC
Elliptic Curve Discrete Logarithm Problem
Additive group structure on elliptic curves
ECDLP: Given P and [k]P, compute k.
5

#RSAC
Elliptic Curve Discrete Logarithm Problem
NAdodittivqe guroaupnsttruucmture-orneeslliipstitcacunrvtes ECDLP: Given P and [k]P, compute k.
5

#RSAC
Isogenies
6

#RSAC
Isogenies
6

#RSAC
Isogenies
­ a group morphism ­ with kernel any finite subgroup ­ given by rational map of degree ,
i.e.
6

#RSAC
Isogeny Graphs of a Supersingular Curves
­ an elliptic curve defined over is called supersingular, if
­ about supersingular elliptic curves, up to isomorphism
7

#RSAC
SIDH key exchange [JF11]

­ fix prime. such that ­ supersingular elliptic curve
over
­ bases

defined

8

#RSAC
SIDH key exchange [JF11]

­ fix prime. such that ­ supersingular elliptic curve
over
­ bases

defined

­ Alice's secret ­ Bob's secret

8

#RSAC
SIDH key exchange [JF11]

­ fix prime. such that ­ supersingular elliptic curve
over
­ bases

defined

­ Alice's secret ­ Bob's secret ­ shared secret is isomorphism class of
8

#RSAC
Modified SSCDH

Problem Given , Compute

, and . , up to isomorphism.

9

#RSAC
One-Sided Modified SSCDH (OMSSCDH)

Oracle: Submit a subgroup isomorphism class of

of correct size, to obtain the
10

#RSAC
One-Sided Modified SSCDH (OMSSCDH)

Oracle: Submit a subgroup isomorphism class of

of correct size, to obtain the
10

#RSAC
One-Sided Modified SSCDH (OMSSCDH)

Oracle: Submit a subgroup isomorphism class of

of correct size, to obtain the
10

#RSAC
Application: Jao-Soukharev's Undeniable Signatures
This problem arises naturally in the security proof of Jao-Soukharev's undeniable signature scheme.
11

#RSAC
One-Sided Modified SSCDH (OMSSCDH)

Oracle: Submit a subgroup isomorphism class of

of correct size, to obtain the
12

#RSAC
Attacking One-Sided Modified SSCDH
13

#RSAC
Attacking One-Sided Modified SSCDH
13

#RSAC
Attacking One-Sided Modified SSCDH
13

#RSAC
Attacking One-Sided Modified SSCDH
13

#RSAC
Attacking One-Sided Modified SSCDH
13

#RSAC
Attacking One-Sided Modified SSCDH
Theorem: We can guess isomorphism class of with probability after a single query to the oracle.
14

#RSAC
Attacking Jao-Soukharev Undeniable Signatures

Lemma:

Let the notation be as before. If

modulo for some

, then the

to

and to

are equal up to the -th step.

are positive integers -isogeny paths from

15

#RSAC
Attacking Jao-Soukharev Undeniable Signatures
Strategy to forge a signature for message ­ find message such that
is divisible by a (large) power of
16

#RSAC
Attacking Jao-Soukharev Undeniable Signatures
Strategy to forge a signature for message ­ find message such that
is divisible by a (large) power of ­ use signing oracle to obtain in
signature of ­ brute-force isogeny ­ trade-off between the steps
16

#RSAC
Attacking Jao-Soukharev Undeniable Signatures

Classical Cost
­ instead of parameter

for security

Quantum Cost

­ need to increase parameters by 25%

17

#RSAC
Attacking Jao-Soukharev Undeniable Signatures

Classical Cost
­ instead of parameter

for security

Quantum Cost
­ instead of parameter

for security

­ need to increase parameters by 25%

­ need to increase parameters by
17%

17

#RSAC
Conclusion and Takeaway
raise parameters for Jao-Soukharev undeniable signatures the OMSSCDH hardness assumption is broken verification of security proofs is important try to reduce to standard hardness assumptions
18

#RSAC
Conclusion and Takeaway
raise parameters for Jao-Soukharev undeniable signatures the OMSSCDH hardness assumption is broken verification of security proofs is important try to reduce to standard hardness assumptions
18

