Think openly, build securely
White paper:
An Overview of Post-Quantum Cryptography
 PQShield  February 10, 2021
© PQShield Ltd | www.pqshield.com | PQShield Ltd, Oxford, OX2 7HT, UK

Contents

1 Classical Public-Key Cryptography

4

1.1 Hard problems . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4

1.2 Encryp on, Key Exchange and Key Encapsula on . . . . . . . . . . . . . . . . . . . . . 5

1.3 Signatures . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7

1.4 The Impact of Quantum Computers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8

2 La ce-based Cryptography

9

2.1 Hard Problems . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9

2.2 Key Exchange and Encryp on . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10

2.2.1 Encryp on . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10

2.2.2 Noisy Diffie-Hellman . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10

2.3 Signatures . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10

2.3.1 The GPV Framework . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11

2.3.2 Fiat-Shamir with Aborts . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11

3 Code-based Cryptography

13

3.1 Problems . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 13

3.2 Encryp on . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 14

3.3 Signatures . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15

4 Mul variate Cryptography

16

4.1 Hard Problems . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16

4.2 Encryp on . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 17

4.3 Signatures . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 17

4.3.1 Hash-then-Sign . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 17

4.3.2 Fiat-Shamir with MQ . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 18

5 Signatures from One-Way Func ons

19

5.1 Hard Problems . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19

5.2 Hash-based Signatures . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 20

5.3 Zero-Knowledge Signatures . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 22

6 Isogeny-based Cryptography

23

6.1 Hard Problems . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 23

6.2 Key-exchange . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 23

6.2.1 The Couveignes-Rostovtsev-Stolbunov scheme (CRS) . . . . . . . . . . . . . . 23

6.2.2 SIDH . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24

6.2.3 Non-interac ve key-exchange: CSIDH and revisited CRS . . . . . . . . . . . . 24

6.3 Signatures . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25

6.3.1 Early schemes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25

6.3.2 SeaSign . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26

6.3.3 CSI-FiSh . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26

6.3.4 SQISign . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26

© PQShield Ltd | www.pqshield.com

2 of 32

This document is an introduc on to post-quantum cryptography. While there exists a large corpus of literature on the topic, the field has not yet coalesced into a mature and well-structured discipline. As a result, even people familiar with it may struggle to get a clear understanding of the technical principles and how they are put into prac ce.
The goal of this document is to provide the reader with an understanding of the key technical ideas used in post-quantum cryptography. As such, it is a rather technical document. However, we focus here on the high-level principles, and try to avoid low-level details when possible. An interes ng fact is that subfields of post-quantum cryptography (la ce-based, code-based, mul variate, etc.) o en share several techniques and design principles, even though they may work on very different mathema cal objects. We highlighted these connec-
ons when we felt they were relevant.

© PQShield Ltd | www.pqshield.com

3 of 32

1 Classical Public-Key Cryptography

Cryptography deals with the issue of ensuring secure communica ons over insecure channels, and does so via mathema cal methods.
When two par es share a secret key, symmetric-key cryptography provides efficient ways of ensuring the confiden ality (via symmetric encryp on, for example AES [AES01]) and integrity of communica ons (via message authen ca on codes, for example HMAC [HMA08]).
However, these solu ons are inapplicable when the par es do not share a secret key in advance. Public-key cryptography was invented precisely to deal with these situa ons.
In this sec on, we first describe some hard problems, the building blocks upon which public-key cryptography is based today. We then explain the key technical ideas, and show how cryptographic protocols put them into prac ce. Finally, we explain how quantum computers jeopardize the security provided by current public-key cryptography.

1.1 Hard problems
Computa onally hard problems, or hard problems for short, is a broad no on encompassing problems that require a significant (ideally, intractable) amount of resources to be solved. Cryptography makes a peculiar use of hard problems; other fields o en try to avoid these problems, but cryptography uses them as the founda on of secure schemes. This is typically done by establishing an equivalence between the security of a scheme and the intractability of a hard problem.
Un l recently, two hard problems (or variants thereof) have been ubiquitous in public-key cryptography: integer factorisa on, and the discrete logarithm problem.
Factorisation-related Problems
The prime factorisa on problem is one of the simplest, and probably best-known, hard problems in cryptography.
The Prime Factorisa on Problem Let p and q be two prime integers and N = p × q. Given N, find p and q.
© PQShield Ltd | www.pqshield.com

Whether this problem is actually hard (with the computa onal power currently available) depends on the set from which p and q are picked. For actual cryptosystems, p and q are picked from a set large enough so that prime factorisa on is infeasible in prac ce.
While a few cryptosystems [Rab79, Wil84] rely solely on prime factorisa on, many more of them [GM82, Pai99] rely on related problems, such as the RSA problem.
The RSA Problem Let p and q be prime integers, N = p×q, and e and d two integers such that
d × e = 1 mod (p - 1) × (q - 1)
Given N, e and me mod N for a random 0  m < N, find m.
The hardness of the RSA problem is the assump on underlying the security of the eponymous encryp on and signature schemes by Rivest, Shamir and Adleman [RSA78].
The prime factorisa on problem is at least as hard as the RSA problem, however whether
4 of 32

they are equivalent is s ll an open ques on. In prac ce, schemes based on the RSA problem choose their parameters to make the related factorisa on problem hard.
Problems related to the Discrete Logarithm
Another class of hard problems heavily relied upon by cryptography relates to the discrete logarithm in finite cyclic groups. A finite group is a finite set with some added algebraic structure: for example, the set Zq of integers modulo q is a finite group. We say that a finite group G = g is cyclic if it is generated by an element g. We first consider the discrete logarithm problem, or DLOG.
DLOG - Discrete Logarithm Problem
Let G = g be a finite cyclic group. Given g and ga, find a.
Similarly to prime factorisa on and RSA, while some schemes rely solely on DLOG, others rely on two related problems: DDH and CDH, first used by Diffie and Hellman [DH76].
DDH and CDH - Diffie-Hellman Problems Let G = g be a finite group. Given g, ga, gb for a, b random: Decision (DDH): Dis nguish (ga, gb, gab) from a triple (ga, gb, gc) with c random. Search (CDH): Compute gab.
DLOG is at least as hard as CDH, which is at least as hard as DDH. In other words:
DLOG  CDH  DDH.
Assessing equivalence in general is s ll complicated; there are groups in which CDH is as hard as DLOG, and there are groups for which DDH is easy but CDH seems hard.
An ac ve subfield of public-key cryptography is ellip c-curve cryptography. An ellip c
© PQShield Ltd | www.pqshield.com

curve is essen ally the set of points (x, y) verifying a certain equa on for fixed a, b, p:
y2 = x3 + ax + b mod p.
Taking G to be an ellip c curve o en allows to design very compact schemes based on the problems DLOG, CDH, DDH, etc.
1.2 Encryption, Key Exchange and Key Encapsulation
Encryp on schemes, key-exchange protocols and key encapsula on mechanisms are three related protocols which solve the same problem: establishing a secure communica on between two par es over an insecure channel.
 A key-exchange protocol is a (possibly interac ve) protocol at the end of which two par es agree on a shared symmetric key.
 A (public-key) encryp on scheme is a scheme with public and private keys, where a public key pk allows to encrypt a message msg, and the corresponding private key sk allows to recover msg.
 A key encapsula on mechanism (or KEM) also has public and private keys, a public key pk allows to encrypt a random symmetric key K (encapsula on), and the associated private key sk allows to recover K (decapsula on).
Most basic construc ons achieve either encryp on schemes [RSA78, ElG85] or keyexchange protocols [DH76] naturally, but there are simple generic conversions that transform any protocol of one type into a protocol of an other type.
Encryption
For simplicity, each me we describe a scheme, Alice will denote the owner of the private key sk (for decryp on) and Bob the owner of the corresponding public key pk (for encryp on).
5 of 32

In an encryp on scheme, Alice ( ) generates a key pair (sk, pk), keeps the private key sk to herself, and publicly distributes the public key pk. Bob ( ) computes a ciphertext ctxt = Enc(pk, msg).

Knows

Knows

sk, pk

ctxt

pk

Upon recep on of ctxt, Alice applies a decrypon algorithm to it and recovers the message:
msg = Dec(sk, ctxt). Alice and Bob now both know a secret msg.
Given Enc(pk, msg), it must be hard to recover msg, except if we know the private key sk, which allows to invert Enc(pk, ·). We have:

Dec(sk, Enc(pk, msg)) = msg.

This descrip on is arguably very generic. We illustrate how to apply this idea in prac-
ce with a simplified version of the RSA cryptosystem, described herea er. The idea is that while exponen a ng a message (ctxt = msge mod N) is easy, "inver ng" this opera on to recover msg is hard if the RSA problem is hard.
RSA Encryp on
 The private key sk is a couple (p, q) of dis nct primes and a value d;
 The public key pk is the product N = p × q, and a value e such that

e × d = 1 mod (p - 1) × (q - 1);

 To encrypt a message msg, compute: ctxt = msge mod N

 To decrypt ctxt, compute: msg = ctxtd mod N

A "magic" mathema cal property of d and e is that, for any element x in ZN:
(xe)d = xed = x mod N.
© PQShield Ltd | www.pqshield.com

This allows Alice (who knows d) to recover msg. Of course, this simplis c descrip on conceals a number of details which have to be addressed in real applica ons. This is the purpose of transforms such as RSAOAEP [BR95].

Diffie-Hellman Key Exchange

The Diffie-Hellman protocol is a key-exchange protocol. Given a random (genera ng) element g of a group G, Alice chooses a random a, computes ga, keeps a to herself and send ga to Bob. Similarly, Bob sends some gb to Alice. Upon recep on of gb, Alice raises it to the power of her secret exponent a, and obtains (gb)a. Bob does the same, and obtains (gb)a.

ga

Knows a

Knows b

gb

Thanks to the proper es of the exponen aon, both obtain the same value:
(ga)b = (gb)a = gab
For someone observing the exchange, finding gab is as hard as solving CDH, which is conjectured to be hard.
This protocol verifies some nice addi onal proper es: it is sta c (Alice can reuse her secret value a for an exchange with another party), and non-interac ve (both par es can send their gx before receiving an answer). We will later see that post-quantum protocols struggle to achieve both proper es at once.

Chosen-Ciphertext Security
Most basic encryp on schemes are only proven secure against chosen-plaintext attacks (CPA), where an a acker must encrypt honestly. In chosen-ciphertext a acks (CCA), an a acker can cra malicious ciphertexts. These can be mi gated by applying generic conversions, the most famous being the Fujisaki-Okamoto transforms [FO99a, FO99b].
6 of 32

1.3 Signatures

Digital signatures solve the same problem as their physical counterparts: proving the authen city of a document. (sk, pk) will denote a pair of signing and verifica on keys, and H a cryptographic hash func on. Alice a ests the validity of a document to Bob by appending a digital signature sig  Sign(sk, msg) to it. sig guarantees that Alice is the righ ul author of the document, and detects any modifica on.

Knows

Knows

sk + pk

sig

pk

The Hash-then-Sign Paradigm
The Hash-then-sign paradigm is arguably the most "intui ve" approach for building digital signatures. The message is first hashed by a hash func on H into a challenge c. A signature is a value sig such that fpk(sig) = c for some public func on fpk parameterized by pk. fpk is a trapdoor one-way func on, which means it is easy to compute and hard to invert (one-way), except if we know sk (the trapdoor).
With the RSA problem, this idea is easily put in applica on, as described below. In prac ce, execu ng this idea securely requires adddi-
onal tweaks described in RSA-PSS [BR98].
RSA Signature
 The private key sk is a couple (p, q) of dis nct primes and a value d;
 The public key pk is the product N = p × q, and a value e such that
e × d = 1 mod (p - 1) × (q - 1);
 To sign a message msg, compute:
sig = H(msg)d mod N
 A signature is accepted if and only if:
H(msg) = sige mod N

The Fiat-Shamir Paradigm
The philosophy of the Fiat-Shamir paradigm [FS87] is very different from Hashthen-sign: it is based on iden fica on protocols. These protocols are interac ve protocols that allow a prover to prove its iden ty to a verifier. Most of them follow a commitchallenge-response communica on flow illustrated in Figure 1.

Prover

commitment challenge

Verifier

response accept/reject

Figure 1: A 3-pass iden fica on protocol
The most important phase is the response, where the prover solves a problem dependent on both the commitment and the challenge, and which would be hard to solve without their private key. The Fiat-Shamir paradigm turns an iden fica on protocol into a signature scheme by making the challenge a hash of both the commitment and the message. Of course, the resul ng scheme is now noninterac ve.
Schnorr signature
 The private key sk is a value x;  The public key pk is h = gx;
 To sign a message msg:  Commit: Select a random y, and compute u = gy;
 Challenge: Compute c = H(u, msg);
 Response: z = y - cx; The signature is sig = (u, z).
 A signature is accepted if and only if:
u = gzhH(u,msg).

© PQShield Ltd | www.pqshield.com

7 of 32

An illustra on of this principle is the Schnorr signature scheme [Sch90] described above, where each of Alice's signatures is a proof that she knows the discrete logarithm of the public key.

1.4 The Impact of Quantum Computers
Most of the cryptographic schemes based on the prime factorisa on, RSA, discrete logarithm and Diffie-Hellman problems would be assumed secure if not for quantum computers.
In 1994, Shor [Sho94] showed that these classically hard problems would be easy to solve on a large scale quantum computer. Since quantum computers were mostly theore cal objects at the me, there was no immediate impact.
However, there has been significant progress on building these computers, driven by large companies (Microso , IBM, etc.) and state actors (China, USA, EU), and the prospect of a prac cal quantum computer becomes more tangible every year.
This has led the cryptographic community, the industry and many standards bodies to plan a replacement of today's widely used public-key cryptography by a quantum-safe alterna ve: post-quantum cryptography.

Summary

Incep on: 1976

Hard Prob- RSA, Factoring, CDH, DDH lems:

Enc/KEM:

(ellip c-curve) DiffieHellman, RSA Encryp on

Signatures: Schnorr, RSA signatures

© PQShield Ltd | www.pqshield.com

8 of 32

2 Lattice-based Cryptography

A la ce is a set generated by integer linear combina ons of the columns of a matrix. Thus, la ce-based cryptosystems and hard problems typically involve matrices. La ce-based cryptography is rather recent (1996) compared to the other subfields, but it has seen a steady growth since its incep on.
With a few excep ons, la ce-based cryptography started with very theore cal construc ons targe ng provable security. As it stands, several schemes are proven secure under the hardness of various la ce problems. However, not all proofs are equal, in the sense that some proofs have a limited prac cal relevance [CKMS16].
Today, there exist several cryptographic construc ons based on la ces. Beyond encryp on and signatures, more advanced construc ons have been proposed, such as homomorphic encryp on, iden ty-based encryp on, etc.
The efficiency of cryptographic schemes based on generic la ces is moderate. Many schemes rely on more structured la ces, and achieve high efficiency in the process. This comes at the cost of more aggressive hardness assump ons.

2.1 Hard Problems
There is a myriad of conjectured hard problems in la ce-based cryptography. The most common are SIS and LWE. Both work with matrices having their entries in a finite ring R (for example Zq or Zq[x]/(xd + 1)).
SIS - Short Integer Solu on Given A  Rn×m, find a short vector v = 0 such that Av = 0.
Solving SIS without the shortness constraint is straigh orward linear algebra. However, forcing the solu on to be short adds a geometric constraint which makes this problem much harder.
Another widespread hard problem is Learning With Errors, or LWE for short. The defini on of LWE gives cryptosystems' designers the freedom to choose not only R, m, n, but also the secret distribu on, error distribu on, etc. The secret and error distribu ons (which are public) typically have a small support.
© PQShield Ltd | www.pqshield.com

LWE - Learning With Errors
Let A  Rn×m be a uniformly random and b = Ats + e, where s  Rn and e  Rm are vectors sampled from the 'secret' distribu on and 'error' distribu-
on, respec vely. Decision: Dis nguish (A, b) from values sampled uniformly. Search: Given (A, b), find s.
This versa lity is a double-edged sword. Along with the rich algebraic structure of LWE, it allows to build several construc ons on LWE beyond signatures and key agreement, the most pre-eminent being homomorphic encryp on, which enables secure computa on over encrypted data. However, this also leaves room for cryptosystems' designers to unwi ngly use insecure parameters.
The most prevalent flavors of LWE are standard LWE, module-LWE (or MLWE) and ring-LWE (or RLWE). Standard LWE takes R = Zq, the integers modulo q. MLWE takes R to be some polynomial ring, for example
9 of 32

R = Zq[x]/(xd + 1). RLWE is the special case of MLWE where n = 1. MLWE and RLWE introduce some structure which can be exploited to have more efficient schemes (faster and more compact). However, this added structure also means that the underlying hardness assump ons are more aggressive. SIS also exists in similar flavors.
As an illustra on, RLWE with one sample posits that:
(a, a  s + e)  R2
is hard to dis nguish from uniform, where a, s, and e are sampled from some uniform, secret and error distribu ons over R, respec vely. Because of its simplicity, we will take RLWE to illustrate many of our examples.

2.2 Key Exchange and Encryption

2.2.1 Encryption

RLWE Encryp on  The private key contains a, s, e;  The public key is (a, b = a  s + e);  The encryp on of msg is ctxt = (u, v),
with:

u v

= =

r r

 

a b

+ +

e1 e2

+



q 2



msg

where e1, e2 are error vectors.

 To decrypt a ciphertext ctxt, the owner of the private key computes:

v - u  s,

which

is

equal

to



q 2



msg

plus

some

noise. As the noise is small (thus con-

centrated in the low bits) and msg is

encoded in the high bits, it is easy to

recover msg.

© PQShield Ltd | www.pqshield.com

There are several approaches for building encryp on schemes using la ces. The box "RLWE Encryp on" above presents a simplified version (using RLWE) of the most common approach [LPR10, LP11].
Several schemes are based on this framework, including candidates for standardiza on FrodoKEM [NAB+17], Kyber [SAB+17] and Saber [DKRV17].

2.2.2 Noisy Diffie-Hellman

One could imagine a naive adapta on of the Diffie-Hellman key-exchange using RLWE. Here, with a being a public element:

Knows small s, e

as+e a  s + e

Knows small s, e

However, this would give only an approximately shared secret since:

a  s  s + s  e = a  s  s + s  e.

To cope with this issue, the no on of reconcilia on has been introduced [DXL12, Pei14]. The idea is that one of the par es sends a hint to the other party, so that they agree on the same shared secret. This is known as noisy Diffie-Hellman.
Unfortunately, this approach lacks a few advantages of the classical Diffie-Hellman. It is interac ve and cannot be used with sta c keys (e.g. Alice cannot use s, e twice). A more mundane issue is the presence of a patent on reconcilia on [Din12].

2.3 Signatures
Secure digital signatures using la ces have not been immediate to obtain. The first secure proposals (for both the hash-then-sign and Fiat-Shamir paradigms) were designed in 2009.
10 of 32

2.3.1 The GPV Framework
Early a empts [GGH97, HHP+03] to adapt the hash-then-sign paradigm to the la ce se ng took the public key pk and private key sk to be, respec vely, a long basis and a short basis of a same la ce. The signing procedure does the following:
1. Hash the message into a point H(msg) of the ambient space of the la ce.
2. Use sk to find a la ce point v close to H(msg).
The verifica on procedure checks that v is close to H(msg), and uses pk to check that it is also in the la ce. As performing step 2. is hard to do with a short basis but easy with a long basis, it was expected that breaking this signature scheme would not be easier in prac-
ce than solving hard la ce problems. This idea is illustrated in Figure 2; one can see that the signature lies at the intersec on of the la ce and of a parallelepiped generated by the private key and centered at H(msg), which makes it unique.
sig H(msg)
Figure 2: Hash-then-sign à la [GGH97, HPS98]. Signatures leak the private key.
However, if step 2. is not done properly, each signature will lie in a parallelepiped having the form of the private key, and as such would leak a li le bit of informa on about its geometry. This was exploited in devasta ng attacks [NR06, DN12]; in which a few thousand (msg, sig) pairs leaked enough informa on to fully recover the private key.
© PQShield Ltd | www.pqshield.com

A countermeasure was proposed by Gentry, Peikert and Vailuntanathan in 2008 [GPV08]. The idea is to use a randomized variant of the algorithm used in step 2. of the original idea [GGH97, HPS98]. This randomiza on ensures that one message has several valid signatures, and is done in a way which eliminates any correla on between the secret key and the distribu on of the signatures. In addi on to thwar ng the a acks of [GGH97, HPS98], this actually makes the framework of [GPV08] provably secure under the hardness of standard la ce problems.
H(msg)
Figure 3: Hash-then-sign à la [GPV08]. Signatures no longer leak the private key.
Falcon is an applica on of the GPV framework. This technique can also be used to build more advanced primi ves such as (hierarchical) iden ty-based encryp-
on [GPV08, CHKP10, DLP14], a ributebased encryp on [Boy13, BGG+14], etc.
2.3.2 Fiat-Shamir with Aborts
As with their hash-then-sign counterparts, ini al a empts [HPS01] to build la ce signatures with the Fiat-Shamir paradigm were quickly cryptanalysed [GJSS01, GS02]. Like for hash-then-sign schemes, each signature leaked a small part of the private key. A provably secure mi ga on was proposed by Lyubashevsky [Lyu09]. The issue with previous a empts was that the underlying protocol lacked the zero-knowledge property, and the point of failure was in the response step of the protocol. In the a acked schemes, this step
11 of 32

induced a distribu on of the signatures correlated to the private key, hence the a acks. This weakness did not appear for classical Fiat-Shamir schemes.
Lyubashevsky observed that randomly aborting (and star ng over) the protocol, in a carefully chosen way, allowed to eliminate the correla on of the signatures with the private key and nullified this class of a acks. This addi-
on enabled the zero-knowledge property, which was the only property missing in order to make the la ce-based schemes based on Fiat-Shamir provably secure. This technique, by Lyubashevsky, is called Fiat-Shamir with Aborts.

We note one important addi on; the abort step is added as to avoid any leakage of the key and make the scheme secure. Schemes based on Fiat-Shamir with aborts include Dilithium [LDK+19].

Fiat-Shamir with Aborts (using LWE)
 The private key sk is two matrices S, E of small norm.
 The public key is (A, T = A × S + E).
 To sign a message msg:  Commit: Generate small random vectors y1, y2 and compute the commitment u = A × y1 + y2;  Challenge: Compute c = H(u, msg);  Response: Compute z1 = y1 + S × c and z2 = y2 + E × c;  Abort: With a certain probability p(sig, sk), restart;
The signature is sig = (c, z1, z2).  A signature is accepted if and only if:
 (z1, z2) is short;  c = H(A × z1 + z2 - T × c, msg).
One can see that this scheme is surprisingly similar to Schnorr signatures described in Sec-
on 1.3: the public element a  G is now a matrix A, the challenge u = gy is replaced with u = A × y1 + y2, and the underlying hard problem DLOG has been replaced with LWE.
© PQShield Ltd | www.pqshield.com

Summary

Incep on:

1996

Assump ons: LWE (Learning with Errors), SIS (Short Integer Solu on), NTRU

Enc/KEM: FrodoKEM, Kyber, Saber

Signatures: Dilithium, Falcon, qTESLA

12 of 32

3 Code-based Cryptography

Error-correc ng codes usually serve to guarantee the integrity and reliability of communica on over unreliable channels, by detec ng and removing errors. Code-based cryptography uses them in a completely different way, by deliberately adding errors to the point that removing them is hard, except for someone who knows a secret descrip on of the code. Since it mostly entails simple algebraic opera ons (Gaussian elimina on, mul plica on, some mes inversion) on finite field elements, code-based cryptography is o en amenable to fast hardware implementa ons.
Code-based cryptography was first introduced by McEliece [McE78] in his eponymous encryp on scheme. His original scheme remains fundamentally secure, is reasonably fast and has short ciphertexts, but a very large public key. Many a empts have been made at making it more efficient, but doing so in a secure manner has proven to be delicate.
Achieving secure code-based signatures has been an even more difficult task. Novel proposals in this direc on are being made, but only the test of me will determine if these efforts are successful.

3.1 Problems
Code-based cryptography relies on linear error-correc ng codes (or codes for short). These are generated by matrices over finite fields (for simplicity, this exposi on will focus on the field F2, the integers modulo 2). The genera ng matrix of a code C is o en denoted G, and we o en associate to it a paritycheck matrix of C, denoted by H and which verifies G × Ht = 0.
Syndrome Decoding
The most common code-based problem is the syndrome decoding problem.
Syndrome Decoding
Given a matrix H  Fk2×n and a syndrome s  Fk2, find e  Fn2 of Hamming weight at most t such that H × e = s.
The syndrome decoding problem is very similar to the SIS problem described in Sec-
on 2.1: the matrix A  Rn×m is replaced by H  F2k×n, and the constraint on the norm
© PQShield Ltd | www.pqshield.com

of the solu on is replaced by a constraint on its Hamming weight. In a certain parameter regime (not used in cryptography), syndrome decoding is a NP-complete problem.
One can come up with varia ons of the syndrome decoding problem. One such varia on is the rank syndrome decoding problem, which replaces F2 by a different field, and imposes a condi on on the rank of the solu on instead of its Hamming weight. The rank metric family of schemes [AGH+17, AAB+19, ABD+19] are based on this varia on. Another popular modifica on is to impose a (quasi-)cyclic structure, like schemes based on QC-MDPC codes do.
Code Indistinguishability
Another hard problem, or rather a family of hard problems, informally states that for a given family C = {Ci}i of codes, it is hard to dis nguish a random matrix G genera ng a code C = Ci from a random matrix.
At a high level, it is somewhat similar to the EIP problem described in Sec on 4.1. The
13 of 32

similarity does not stop here; while this problem is presumed hard for some families of codes (e.g. Goppa, QC-MDPC and LRPC codes), many other choices (Reed-Solomon, LDPC, etc.) have led to insecure schemes.
3.2 Encryption
The idea underlying code-based encryp on schemes is that a message will be encrypted by adding some noise to it, and that removing this noise is hard except if one knows a secret descrip on of some code.
McEliece
A common way of using codes for encryp on comes from McEliece's original scheme.
The hardness of syndrome decoding and of dis nguishing G^ from a random matrix is necessary for McEliece's encryp on scheme to be secure.
McEliece Encryp on
 The private key contains a permuta on P, an inver ble matrix S, and a matrix G genera ng a linear code C capable of correc ng t errors. The algorithm for correc ng errors using G is public
 The public key is the product G^ = SGP.  The encryp on of a message msg is:
ctxt = msg × G^ + z,
with z a vector of Hamming weight t.  To decrypt a ciphertext ctxt, the owner
of the private key computes:
ctxt × P-1 = msg × SG + z × P-1.
Since the error vector z × P-1 has weight t, the matrix G can be used to decode the above value to msg × S, and then mul plying this by S-1 yields the plaintext msg.

McEliece's original proposal has large public keys, since these are large matrices. The use of structured matrices allows to diminish this size, though this automa cally implies a more aggressive hardness assump on.
Niederreiter
McEliece's cryptosystem admits a dual version which was proposed by Niederreiter in 1986 [NIE86]. It replaces the generator matrix G by an associated parity check matrix H.
Niederreiter Encryp on
 The private key contains P, S and G as for McEliece's cryptosystem.
 The public key is Hpk = SHP, for H the parity check matrix of C.
 The encryp on of a message msg is:
ctxt = Hpk × msg,
msg being encoded as an error vector containing at most t ones.
 The decryp on procedure computes:
S-1 × ctxt = HP × msg,
then a syndrome decoding algorithm followed by linear algebra is applied to recover msg.
Another difference is that in McEliece's scheme, an error is added to the encoded message, whereas here the message itself becomes the error. Niederreiter's scheme also provides some trade-offs in term of sizes and speed. Security-wise, both schemes are strictly equivalent. Schemes based on Niederreiter's scheme include standard candidates Classic McEliece and BIKE.

© PQShield Ltd | www.pqshield.com

14 of 32

3.3 Signatures
Obtaining secure and efficient signatures from error-correc ng codes has been very hard to achieve so far. Several a empts have failed. We present here two secure but currently inefficient signature schemes, and two new proposals.

A recent signature scheme, Durandal [ABG+19], uses par ally Fiat-Shamir with aborts (see Sec on 2.3) in conjunc on with the rank metric. It achieves a much be er soundness than Stern-like protocols, but does not have a full security proof.

Hash-then-sign
In 2001, Courtois, Finiasz and Sendrier [CFS01] proposed a signature scheme based on the Hash-then-sign paradigm. It converts Niederreiter's scheme into a signature scheme: decryp on becomes the signing procedure, and encryp on becomes the verifica-
on procedure. Unfortunately, the parameters of [CFS01] do not scale well, which yields imprac cal parameters.
A recent construc on [DST19] revisited the [CFS01] scheme and proposed to apply the GPV framework (see Sec on 2.3) to build code-based signatures. It is provably secure under a new code-based assump on.

Fiat-Shamir
Stern [Ste94, Ste96] and Véron [Vér96] proposed iden fica on schemes from errorcorrec ng codes. In this se ng, the secret key is a vector e, and the public key is a random matrix H as well as the syndrome s = H × e. The prover proves knowledge of e in a zero-knowledge way. Unfortunately, these protocols have soundness error between 2/3 and 1/2, so conver ng them into signature schemes via the Fiat-Shamir transform would require a few hundred repe ons. This would result in a slow signing procedure and large signatures.
© PQShield Ltd | www.pqshield.com

Summary

Incep on: 1978

Assump ons: Syndrome decoding, Dis nguishing from a random code

Enc/KEM:

BIKE, Classic McEliece, HQC, NTS-KEM, ROLLO

Signatures: CFS, Durandal, WAVE

15 of 32

4 Multivariate Cryptography

Mul variate cryptography is rather old since its incep on dates back to 1988, when the first mul variate encryp on scheme was proposed. It builds cryptosystems from problems involving mul variate polynomial equa ons over finite fields, for example the MQ problem.
However, over the years many schemes have been broken; while this may seem paradoxical, it is easily explained by the fact that these schemes relied on other, less secure and some mes implicit assump ons. This has arguably undermined the credibility of the field.
The landscape of mul variate signatures is more mature than that of their encryp on counterparts. There exist both hash-then-sign and Fiat-Shamir signatures with solid founda ons, even though their concrete security for prac cal parameters can s ll be hard to pinpoint.
Mul variate hash-then-sign schemes usually have small signatures (a few hundred bytes) at the expense of large keys. For Fiat-Shamir signatures, it is the other way around.

4.1 Hard Problems
Mul variate cryptography is based on mul variate polynomial equa ons. For example:
f(x1, x2) = 3x31x2 + x21 - x32 + x2 + 1 is a mul variate polynomial (of degree 4, since x31x2 is of degree 4). Solving problems involving mul variate polynomials of degree > 1 is conjectured hard for sufficiently large parameters. The variables are usually in a finite field (for example, Zq for some prime q).
The MQ Problem
The most famous problem is MQ; it entails working with mul variate quadra cs (i.e. mul-
variate polynomials of degree at most two), hence its name.
The MQ problem
Let F be a finite field. Let F(x) be (f1(x), . . . , fm(x)), where each fi : Fn  F is a mul variate polynomial of degree at most 2 in x = (x1, . . . , xn). Let y  Fm and F be inputs to the problems below. Decision: Is there x such that F(x) = y? Search: Find x such that F(x) = y.
© PQShield Ltd | www.pqshield.com

The decision version of MQ is NPcomplete [GJ79], and its search version is NP-hard. This makes MQ an a rac ve op-
on for building cryptographic schemes, but we will see that pu ng this idea into prac ce has been difficult to achieve.
The EIP Problem
Except for Fiat-Shamir signatures, it is not known how to build cryptographic schemes solely on MQ. Exis ng schemes rely, implicitly or explicitly, on at least a few other problems. The most prevalent is EIP, for Extended Isomorphism of Polynomials [DYC+08].
Extended Isomorphism of polynomials
Let C be a class of so-called quadra c central maps (from Fn to Fm). Let F  C be a central map, and S : Fn  Fn and T : Fm  Fm be two affine maps. Given P = S  F  T, find F.
Many mul variate schemes rely on EIP, in the sense that solving EIP implies breaking the scheme. For most of these schemes, the person who generated F knows an efficient way of compu ng preimages for it. Typically, this
16 of 32

results in F having some special structure.
This asymmetry between F (easy to invert) and P (hard to invert) makes it temp ng to build public-key cryptography based on EIP: the public key would be P and the private key would contain S, F and T.
4.2 Encryption
The first mul variate encryp on scheme, C, was introduced in 1988 by Matsumoto and Imai [MI88]. Like most mul variate encryp-
om schemes, it relies at a high level on the ideas described in the paragraph about the EIP problem.
Mul variate Encryp on à la C
 The secret key consists of the maps S, F and T; all shall be easy to invert, and S, T are affine maps.
 The public key is the map P = S  F  T, which is expected hard to invert.
 The encryp on of a message msg is:
ctxt = P(msg).
 The decryp on of a ciphertext ctxt is:
T-1  F-1  S-1(ctxt).
At a high level, this mechanism is not too different from what is done in code-based encryp on schemes such as McEliece or Niederreiter:
 The central map F plays the same role as the generator matrix G, as it allows to solve an otherwise untractable problem;
 The affine maps S, T plays the same role as the permuta on matrix P and inver ble matrix S of McEliece, in the sense that they hide the structure of the central map.
While it may look simple to get public-key encryp on from EIP using this blueprint, it has been notoriously hard to obtain secure
© PQShield Ltd | www.pqshield.com

schemes in prac ce. The original scheme by Matsumoto and Imai, as well as many subsequent schemes [TDTD13, PBD14, YS15], have been broken [Pat95, PPS17, CSV17], and only a handful of schemes remain unbroken. It is fair to say that building secure and efficient mul variate encryp on schemes remains open.
4.3 Signatures
Mul variate signature schemes have been easier to obtain than encryp on schemes. There exist schemes based both on the hashthen-sign paradigm, and the Fiat-Shamir paradigm.
4.3.1 Hash-then-Sign
The high-level construc on for mul variate Hash-then-sign schemes may be seen as the "dual" of the construc on for encryp on schemes, and is described in the next block. We can see that the signing and verifica on procedures mirror the decryp on and encryp-
on procedures of Sec on 4.2, respec vely. This is very similar to how the code-based CFS signature mirrors Niederreiter's encryp-
on scheme and, to a lesser extent, to how the RSA signature scheme mirrors the RSA encryp on scheme.
Mul variate Hash-then-Sign
 The secret key are the maps S, F and T, which are easy to invert.
 The public key is the map P = S  F  T, expected hard to invert.
 The signature of a message msg is:
sig = T-1  F-1  S-1  H(msg).
 The verifier accepts a signature sig only if: P(sig) = H(msg).
17 of 32

The main difference among the schemes relying on this paradigm is the choice of the underlying field F and of the central map F. One of the more popular strategies is the oil and vinegar approach. This is for example the approach chosen by LUOV [BPSV19] and Rainbow [DCP+19]. Another popular approach relies on variants of hidden field equa ons, like GeMSS [CFM+17].
The public key P typically consists of m quadra c polynomials n variables over F, so it is o en large. On the other hand, each signature sig is essen ally a vector in Fm, and as a result signatures are o en very small (a few hundred bytes).
Unfortunately, no mul variate hash-then-sign signature admits a security proof based on a standard assump on.
4.3.2 Fiat-Shamir with MQ
The main idea of Fiat-Shamir signatures with MQ is that, for some publicly known map F : Fm  Fn, the secret key will be a vector x  Fm, the public key will be y = F(x)  Fn, and each signature will be a zero-knowledge proof that the signer knows x. An efficient way to do that was proposed by Sakumoto, Shirai and Hiwatari [SSH11]. Their key idea is to use the polar form of F, namely:
G(x1, x2) = F(x1 + x2) - F(x1) - F(x2).
A key property of G is that it is bilinear. [SSH11] leverage this property to split the private key in two, effec vely enabling the construc on of iden fica on protocols based on the MQ problem. The authors proposed 3-pass (1 commitment, 1 challenge, 1 response) and 5-pass (2 commitments, 2 challenges, 1 response) iden fica on protocols, but a conversion into a signature scheme was proposed only for the 3-pass protocol (via the Fiat-Shamir transform).
Another step in the direc on of provably secure signatures from MQ was done by
© PQShield Ltd | www.pqshield.com

Chen, Hülsing, Rijneveld, Samardjiska and Schwabe [CHR+16]. As the signatures obtained from the 3-pass protocol from [SSH11] were too inefficient, [CHR+16] instead adapted the 5-pass iden fica on protocol so that it could be converted into a signature scheme, once again via the Fiat-Shamir transform. The resul ng scheme, MQDSS, is proven secure under the MQ assump on. The scheme SOFIA [CHR+18] uses the same ideas but with a proof against adversaries with stronger quantum capabili es.

For such schemes, the public and secret keys

are usually very small since they are the vec-

tors x and y, respec vely. However, the un-

derlying iden fica on protocol only achieves

a

soundness

of

about

1 2

,

thus

the

signing

pro-

cedure requires to repeat this protocol several

mes. As a result the signatures are rather

large (more than 30 kB).

Summary

Incep on: 1988

Assump ons: MQ, EIP

Enc/KEM: -

Signatures:

LUOV, MQDSS, Rainbow, GeMSS

18 of 32

5 Signatures from One-Way Functions

One-way func ons are func ons which are easy to compute, but hard to invert; for example, the hash func ons SHA-2 and SHA-3 are assumed to be one-way func ons.
The idea to build signatures from one-way func ons was first proposed independently by Lamport [Lam79] and Merkle [Mer90] in 1979 (the work of Merkle was published 10 years later). Un l recently, all the signatures based on one-way func ons could be seen as loosely related to the hash-then-sign paradigm, but signatures relying on the Fiat-Shamir paradigm were recently proposed, and their philosophy is very different.
From a security viewpoint, these signatures are very appealing. Indeed, it is proven [Rom90] that signatures exist if and only if one-way func ons exist. Consequently, in terms of underlying hypotheses, signatures based on one-way func ons are the best one could possibly hope for. In addi on, all exis ng construc ons are provably secure.
Unfortunately, these perks come at the cost of efficiency; all exis ng schemes have slow signing procedures as well as large signatures. Some of these schemes achieve higher efficiency, but require in exchange to maintain an internal state; but this is not always possible, as some deployment contexts preclude this possibility. However, if one accepts these restric ons, these signatures provide strong security guarantees.
There also is one method for building an encryp on scheme from minimal assump ons, however it is extremely inefficient [Mer78], and this seems to be inherent [BM09].

5.1 Hard Problems
Informally, a one-way func on is a func on easy to compute but hard to invert. One can define several hardness assump ons for oneway func ons and related no ons. The most common assump ons are preimage, second preimage and collision resistance. Preimage resistance of a func on H essen ally states that H is hard to invert for a specified output y. Second preimage resistance makes a slightly different statement.
The Preimage Problem
Let H : X  Y be a func on, and y  Y. Find x  X such that H(x) = y.
The Second Preimage Problem
Let H : X  Y be a func on, and x1  X. Find x2 = x1 such that H(x1) = H(x2).
© PQShield Ltd | www.pqshield.com

Collision resistance states it is hard to find two inputs that H maps to the same output.
The Collision Problem Let H : X  Y be a func on. Find x1 = x2 such that H(x1) = H(x2).
Preimage vs Second Preimage vs Collision
It is possible to build func ons which are hard for any of these problems and easy for any other one (with the excep on that collision resistance always implies second preimage resistance). However, these examples are quite contrived and mostly of theore cal interest.
The best classical a acks known for finding preimages on a generic func on H : {0, 1}  {0, 1}n require about 2n opera ons, compared to 2n/2 opera ons for finding collisions. In
19 of 32

prac ce, there exist hash func ons for which collisions have been found, but no (second-) preimage a ack has been mounted: this includes MD5 [dB94] and SHA-1 [SBK+17].
The situa on of quantum a acks is less clear as it is a recent field. Grover's algorithm [Gro96] reduces the quantum cost of preimage search to O(2n/2). Quantum speed-ups have been proposed for collision as well [BHT98, CNS17], their prac cal applicability is s ll being discussed.
5.2 Hash-based Signatures
Hash-based signatures are based on the observa on that a hash func on H allows to commit to a secret key, while hiding it. In this perspec ve, the public key will be a commitment of the private key.
Signing a message typically consists in revealing par al informa on so that the verifier can recompute the commitment and check it against the public key. A peculiar (but useful) property of hash-based signatures in general is that one can recover the public key from a valid signature and the associated message.
One-Time Signatures
One-Time Signature (Toy Example)
 The private key is a bitstring sk = (sk1, sk2).
 The public key is pk = (HM(sk1), HM(sk2)), HM deno ng the M- mes itera on of H
 The signature of a message msg in {0, . . . , M} is:
(sig1, sig2) = (Hmsg(sk1), HM-msg(sk2)).
 The verifier accepts the signature if and only if:
(HM-msg(sig1), Hmsg(sig2)) = pk.
© PQShield Ltd | www.pqshield.com

The scheme described in the "One-Time Signature (Toy Example)" box puts into prac ce the high-level ideas described at the beginning ot this sec on.
Without knowing sk, the only way to forge a signature for msg is to invert H. Therefore, this scheme is secure under the preimage hardness of H. However, one can also show that given signatures for two different messages msg1 = msg2, one can compute a signature for any message msg1 < msg3 < msg2. Therefore, this scheme is secure if it signs at most one message. These kind of schemes are called one- me signatures (or OTS), and this is obviously a huge limita on.
From One-Time to Few-Times: Merkle Trees
One- me signatures can be converted to few- me signatures (which means that a few messages can be signed) by using Merkle trees [Mer90], illustrated in Figure 4.
H

H0

H1

H00

H01

H10

H11

Figure 4: A Merkle tree
In a Merkle tree, each internal node (square nodes in Figure 4) is the hash of the concatena on of its children: this is illustrated by the edges linking these nodes to their children. For signatures, the leaves of a Merkle tree (circular nodes in Figure 4) are the public keys of OTS. The root of a Merkle tree (its top node) is a commitment of all the public keys (thus of the private keys as well).
20 of 32

Merkle Signature
 The private key is the set of all OTS private keys: sk = {sk000, . . . , sk111};
 The public key is the root of the Merkle tree: pk = H;
 The signer uses a leaf OTS to sign msg, and sends the one- me signature along with nodes which allow to recover the root of the Merkle tree. For example, a valid signature may be:
sig = (sig000, pk001, H01, H1) ,
where sig000 is a signature of msg using sk000 (the private key associated to pk000).  The verifier uses the key-recovery property of hash-based signatures to compute a public key from the one-
me signature (here, he gets pk000 from sig000), and recovers the top root of the Merkle tree from sig. For the example given above:
H(H(H(pk000pk001)H01)H1) = H = pk.
If it succeeds, the signature is accepted. Otherwise, it means that a part of the signature is incorrect, and it is rejected.
The Merkle tree in Figure 4 can sign up to 8 messages, which is be er than one but is s ll far from perfect. Another caveat is that it s ll requires to keep track of the OTS keys used; indeed, once an OTS key is used, it can by defini on not be reused. The "bookkeeping" that this method imposes on the signer is called statefulness, and it is an risky property that can be difficult to enforce, especially in distributed systems.

Going Stateless
Several other techniques allow to improve the efficiency and flexibility of hash-based signatures, and so we only briefly men on them here. Goldreich trees are a flexible variant of Merkle trees, which allow to relax the statefulness requirement to some extent. Stateless few- me signatures [RR02, updated version] also provide some extra flexibility. Hash-based signatures can be organized in two families:
 Stateful signatures s ll require to maintain a state. However, some of them a ain reasonable signature sizes (less than 3 kB), such as LMS [LM95] and XMSS [HBG+18], which have recently been standardized by NIST [NIS20].
 Stateless signatures manage, by increasing parameters, to avoid the need for a state management. This comes at the cost of reduced efficiency; for example, the SPHINCS+ scheme yields signatures of about 30 kB.
Both families of schemes share several common points. For example, the public key is very small (around 64 bytes), because it is a single hash. Also, the signing procedure entails a large number of hash computa ons, and is therefore rather slow. Finally, because of the tree structure, these schemes only support a limited number of hashes; however, this number can be made arbitrarily large by se ng the parameters adequately (SPHINCS+ supports up to 264 messages).

© PQShield Ltd | www.pqshield.com

21 of 32

5.3 Zero-Knowledge Signatures
In 2017, Chase et al. [CDG+17] proposed a novel way of using one-way func ons to yield post-quantum signature schemes. Their work relies on the Fiat-Shamir transform, but also on other ideas, such as secret sharing and mul-
party computa on.
First proposed by Shamir [Sha79] and Blakley [Bla79], secret sharing consists of split-
ng a secret into shares, in a way that the secret can only be retrieved by combining sufficiently many shares. For example, given a binary value b  {0, 1}, if we split b as b = b1  b2, where b1 is uniformly random, then b1 or b2 alone do not provide any informa on about b, but knowing both allows to recover b.
Mul party computa on (or MPC for short) [Yao82, Yao86, GMW87], proposes solu ons to perform computa on over shared data, while preserving the purpose of secret sharing (that is, many shares must be combined to recover the secret). Mul party computa on has found many applica ons, like distributed computa on, protec on against side-channel a acks, etc.
MPC-in-the-head [IKOS07] performs an MPC computa on and reveals intermediate data (though not enough to reveal any secret) in a pseudorandom manner. For example, given y, if one wants to prove that they know x such that H(x) = y, they can perform an MPCin-the-head computa on of H(x) with, say, 3 shares, and send a transcript. This will convince a verifier (up to probability 1/3) that the prover knows x. At a high level, this is not too different from how the Fiat-Shamir transform renders an iden fica on protocol noninterac ve.
[CDG+17] builds a signature scheme based on this idea (and others). This approach is
© PQShield Ltd | www.pqshield.com

quite different from hash-based signatures; these view a one-way func on H as a black box, whereas the internal descrip on of H is quite relevant for [CDG+17]. As each MPCin-the-head transcript convinces the verifier with probability 1/3, it needs to be repeated several mes (200 to 800 in prac ce), which results in a slow signing procedure and large signatures. The resul ng scheme, however, is as secure as the underlying func on H. Picnic [ZCD+17] is an applica on of this idea.
Summary Incep on: 1979 Assump ons: Collision or (second) preim-
age resistance of one-way func ons Enc/KEM: Signatures: XMSS, SPHINCS+, Picnic
22 of 32

6 Isogeny-based Cryptography

Isogeny-based cryptography is the youngest of the subfields of post-quantum cryptography studied in this document, since it really started in 2006.
For key-exchange and encryp on, the idea is mostly to revisit the classical ellip c curve Diffie-Hellman and El-Gamal schemes, except that instead of working with points of ellip c curves, the ellip c curves themselves become the objects which are manipulated, and this is done through the use of isogenies, which are a class of maps between ellip c curves.
Signature schemes based on the Fiat-Shamir transform have been proposed recently.
For both key-establishment and signatures, this transposi on has not been straigh orward; the schemes are o en not as "natural" as their ellip c curve counterparts, and efficiency issues are s ll being addressed at this me. While they are currently slow, these schemes offer excellent communica on costs compared to schemes of other families.
This is a very recent field, so the security es mates, parameters and efficiency of schemes are likely to evolve.

6.1 Hard Problems
We recall that an ellip c curve is the set of points (x, y) that, for fixed (a, b), verify:
y2 = x3 + ax + b, with a, b, x, y belonging to (the algebraic closure of) a finite field. Isogeny-based cryptography can work on two classes of ellip c curves, ordinary or supersingular. The second class currently seems to provide the best efficiency/security trade-off, and almost all schemes use it.
The Isogeny Problem
For the purpose of this document, it is sufficient to remember that isogenies are a specific class of maps between ellip c curves, and that isogenous curves are curves which are connected by an isogeny.
The Isogeny Problem
Given two supersingular isogenous curves E1, E2, compute an isogeny:
 : E1  E2.
© PQShield Ltd | www.pqshield.com

At a high level, we can see that this is similar to the discrete logarithm problem: instead of looking for a such that ga = h, we look for an isogeny  mapping E1 to E2.
6.2 Key-exchange
The idea of using isogenies to replicate the Diffie-Hellman protocol was first proposed by Couveignes [Cou06], and rediscovered by Rostovtsev and Stolbunov [RS06],
6.2.1 The Couveignes-RostovtsevStolbunov scheme (CRS)
We recall that classical Diffie-Hellman starts with a public element g. Alice sends ga, Bob sends gb and at the end of the key-exchange they both have a shared secret gab. The Couveignes-Rostovtsev-Stolbunov scheme (or CRS) can be seen as a generaliza on of this idea, and is described in the next diagram, with the public element E at the top le , and the shared secret E/P, Q at the bo om right.
23 of 32

E  E





E  E,

While classical (ellip c-curve) Diffie-Hellman takes g to be an element of an ellip c curve E, the CRS protocol subsitutes g with the ellip-
c curve E, and the ac on of exponen a ng a point is replaced by an isogeny mapping E to another ellip c curve. Both Alice and Bob keep their isogenies ( and ) secret, but at the end of the protocol they both share a known secret E,.
Later, [CJS14] proposed quantum algorithms for compu ng isogenies in the CRS se ng. To account for these algorithms, CRS required a growth in parameters which made it imprac cal at the me.

6.2.2 SIDH
Jao and de Feo [JD11] proposed an analog of the Diffie-Hellman key exchange over supersingular curves.

E

A

E/HA

B

B,{A(PB),A(QB)}

E/HBA,{B(PA),B(QA)}E/HA, HB

This paradigm of key-exchange is generally called Supersingular Isogeny Diffie-Hellman, or SIDH. From a security perspec ve, this variant is somewhat incomparable to the ordinary case proposal from [Cou06, RS06]. On one hand, the [CJS14] algorithm does not apply in this case. On the other hand, the adversary has access to some addi onal informa on compared to [Cou06, RS06]. Therefore, the security of this scheme depends on a different problem: the SIDH problem.
© PQShield Ltd | www.pqshield.com

The SIDH Problem Given two supersingular isogenous curves E1 and E2, compute an isogeny
 : E1  E2,
knowing (P) and (Q) for some precise P, Q (we omit the details here).
While no a ack has exploited this addi onal informa on yet (except ac ve a acks), it remains to be studied whether this introduces a weakness.
From a prac cal perspec ve, being able to work on supersingular curves allows much smaller parameters, which results in more compact and more efficient schemes. The KEM proposal SIKE essen ally relies on SIDH combined with the HHK transform [HHK17].
6.2.3 Non-interactive key-exchange: CSIDH and revisited CRS
A nice property which the original DiffieHellman protocol relies on is commuta vity:
(ga)b = (gb)a = gab.
The main issues with SIDH (somewhat ad-hoc problem and need for an interac ve protocol) stem from the non-commuta vity of the underlying opera on. Therefore, very recent works have tried enforcing a commuta ve opera on.
The first work, by [DKS18], revisited the CRS scheme, which already possessed this commuta vity property but was imprac cal. The work of [DKS18] proposed mainly algorithmic improvements, and yields key-exchange on ordinary curves. It is s ll very slow.
On the other hand, [CLM+18] showed that, by restric ng to subsets of the ellip c curves and of the isogenies, one could effec vely construct a commuta ve group ac on over supersingular curves. Combining this with the
24 of 32

algorithmic improvements of [DKS18] allowed them to adapt the CRS scheme over supersingular curves. The resul ng scheme is called CSIDH. It remains rather slow, but small public key sizes make it a rac ve.
As a direct consequence of the commuta vity of their underlying group ac ons, these two schemes are non-interac ve, support sta c keys and are directly protected against ac-
ve a acks (they do not require a CCA transform). The first two proper es are desirable for several real-life applica ons, and the third one makes the schemes faster and simpler to implement. A caveat to both schemes (besides efficiency) is that the best quantum attacks are subexponen al. In par cular, recent works [BS20, Pei20, CCJR20] seem to imply that CSIDH requires much larger parameters than ini ally expected.
6.3 Signatures
While the first iden fica on schemes (which can o en be converted in signatures) have been proposed as early as 2014 [FJP14], concrete signature schemes based on isogenies have only appeared recently. One can expect significant improvements of the schemes and cryptanalysis in the future.
6.3.1 Early schemes
In 2017, two papers [YAJ+17, GPS17] proposed signature schemes based on supersingular isogenies. The first scheme is in both papers, and follows from the iden fica on scheme from [FJP14]. The second one, proposed only in [GPS17], relied on more recent algorithmic techniques by [KLPT14].
The idea of [GPS17] is that, given three ellip c curves E, Ecom, Epk and two isogenies sk : E  Epk and 0 : E  Ecom, one can use the techniques of [KLPT14] to compute an isogeny 1 : Ecom  Epk, which is summarized below.
© PQShield Ltd | www.pqshield.com

E

0

sk

Ecom
1
Epk

We now describe a simplified version of the signature scheme from [GPS17].
GPS Protocol
 The public key consists of two curves E and Epk;
 The private key is an isogeny sk : E  Epk. This is done by first choosing E and sk randomly and then compu ng Epk;
 A round of the protocol is as follows:  Commit: Choose a random isogeny 0 and compute Ecom = 0(E);
 Challenge: The challenge c is 0 or 1.
 Response: If c = 0, then rsp = (Ecom, 0). Else, rsp = (Ecom, 1), where 1 : Ecom  Epk is computed using [KLPT14].
Return rsp.
 The verifier accepts rsp = (Ecom, c) if and only if either:  c = 0 and 0 sends E to Ecom.
 c = 1 and 1 sends Ecom to Epk. c should of course be an isogeny.

At a high level, the underlying iden fica on

protocol resembles the well-known proof sys-

tem of [GMW86] for proving knowledge of

an isomorphism between graphs. Both proto-

cols

have

a

soundness

of

1 2

,

which

informally

means that an illegi mate prover may falsely

convince a verifier that he knows the secret

key,

with

a

probability

1 2

.

To reach cryptographic levels of confidence, between 128 and 256 repe ons are needed. This yields rather large signatures.

25 of 32

6.3.2 SeaSign
Recently, de Feo and Galbraith [FG19] have taken advantage of the commuta ve group ac on introduced in [CLM+18] to propose a shorter signature scheme.
An interes ng idea of [FG19] is to minimize soundness error by having a large number n of curves E(pik) composing the public key, then using Merkle trees to prevent an explosion of the public key size. Interes ngly, the scheme also relies on techniques first developed for la ce-based cryptography: the iden fica-
on protocol uses the abor ng techniques from [Lyu09], and this protocol is converted into a secure signature scheme using recent work from [KLS18] originally targe ng la cebased schemes. The resul ng scheme is called SeaSign. As for [GPS17], the signature consists of proving the knowledge of an isogeny between two curves.
6.3.3 CSI-FiSh
Even more recently, Beullens, Kleinjung and Vercauteren [BKV19] proposed several efficiency improvements to SeaSign. In par cular, they compute an efficient representa on of a class group (an algebraic structure) underlying much of the computa ons in SeaSign. This efficient representa on, along with other tricks, enables us to substan ally improve the efficiency of the scheme.
The resul ng scheme is called CSI-FiSh and is extremely compact. When op mizing for signature size, the size can be as small as 263 bytes for 128 bits of classical security; when op mizing for combined public key and signature sizes, the total size can be as small as 1468 bytes. However, it is also currently very slow. Note that these numbers only apply for the parameter set CSIFiSh-512, the security of which is under scru ny [BS20, Pei20, CCJR20] and might call for updated parameters.
© PQShield Ltd | www.pqshield.com

6.3.4 SQISign
Very recently, De Feo, Kohel, Leroux, Pe t and Wesolowski [DKL+20] proposed a new declina on of the [GPS17] scheme. A notable improvement compared to previous schemes is that the base protocol has a very small soundness error (compared to the 1/2 in [GPS17] or 1/(n + 1) in SeaSign). Consequently, one single round of the protocol is sufficient and the resul ng signature scheme is therefore extremely compact.

E
sk
Epk

com rsp

Ecom
chal
Echal

The principle of SQISign is illustrated above, and explained below.
 The public key is comprised of two ellip c curves E and Epk.
 The private key is an isogeny sk sending E to Epk.
 A signature simulates a commit-challengeresponse iden fica on protocol, where:
 The commitment is Ecom.
 The challenge Echal is computed by applying an isogeny chal to Ecom.
 The response is an isogeny rsp sending Epk to Echal.
Summary

Incep on: 2006

Hard Prob- Isogeny Problem, SIDH

lems:

Problem, CSIDH Problem

Enc/KEM: SIKE, CSIDH

Signatures: CSI-FiSh [BKV19], SQISign [DKL+20]

26 of 32

References

[AAB+19] Carlos Aguilar Melchor, Nicolas Aragon, Slim Be aieb, Loic Bidoux, Olivier Blazy, Jean-Christophe Deneuville, Phillippe
Gaborit, Gilles Zémor, Alain Couvreur, and Adrien Hauteville. RQC. Technical report, Na onal Ins tute of Standards and Technology, 2019. available at https://csrc.nist.gov/projects/post-quantum-cryptography/ round-2-submissions.

[ABD+19] Nicolas Aragon, Olivier Blazy, Jean-Christophe Deneuville, Philippe Gaborit, Adrien Hauteville, Olivier Rua a, Jean-Pierre
Tillich, Gilles Zémor, Carlos Aguilar Melchor, Slim Be aieb, Loic Bidoux, Magali Bardet, and Ayoub Otmani. ROLLO. Technical report, Na onal Ins tute of Standards and Technology, 2019. available at https://csrc.nist.gov/projects/ post-quantum-cryptography/round-2-submissions.

[ABG+19] Nicolas Aragon, Olivier Blazy, Philippe Gaborit, Adrien Hauteville, and Gilles Zémor. Durandal: A rank metric based signature scheme. In Yuval Ishai and Vincent Rijmen, editors, EUROCRYPT 2019, Part III, volume 11478 of LNCS, pages 728­758. Springer, Heidelberg, May 2019.

[AES01] Advanced Encryp on Standard (AES). Na onal Ins tute of Standards and Technology (NIST), FIPS PUB 197, U.S. Department of Commerce, November 2001.

[AGH+17] Nicolas Aragon, Phillipe Gaborit, Adrien Hautevillle, Olivier Rua a, and Gilles Zémor. RankSign. Technical re-
port, Na onal Ins tute of Standards and Technology, 2017. available at https://csrc.nist.gov/projects/ post-quantum-cryptography/round-1-submissions.

[BGG+14] Dan Boneh, Craig Gentry, Sergey Gorbunov, Shai Halevi, Valeria Nikolaenko, Gil Segev, Vinod Vaikuntanathan, and Dhinakaran Vinayagamurthy. Fully key-homomorphic encryp on, arithme c circuit ABE and compact garbled circuits. In Phong Q. Nguyen and Elisabeth Oswald, editors, EUROCRYPT 2014, volume 8441 of LNCS, pages 533­556. Springer, Heidelberg, May 2014.

[BHT98] Gilles Brassard, Peter Høyer, and Alain Tapp. Quantum cryptanalysis of hash and claw-free func ons. In Claudio L. Lucchesi and Arnaldo V. Moura, editors, LATIN 1998, volume 1380 of LNCS, pages 163­169. Springer, Heidelberg, April 1998.

[BKV19] Ward Beullens, Thorsten Kleinjung, and Frederik Vercauteren. CSI-FiSh: Efficient isogeny based signatures through class group computa ons. In Steven D. Galbraith and Shiho Moriai, editors, ASIACRYPT 2019, Part I, volume 11921 of LNCS, pages 227­247. Springer, Heidelberg, December 2019.

[Bla79] G. R. Blakley. Safeguarding cryptographic keys. Proceedings of AFIPS 1979 Na onal Computer Conference, 48:313­317, 1979.

[BM09]

Boaz Barak and Mohammad Mahmoody-Ghidary. Merkle puzzles are op mal - an O(n2)-query a ack on any key exchange from a random oracle. In Shai Halevi, editor, CRYPTO 2009, volume 5677 of LNCS, pages 374­390. Springer, Heidelberg, August 2009.

[Boy13] Xavier Boyen. A ribute-based func onal encryp on on la ces. In Amit Sahai, editor, TCC 2013, volume 7785 of LNCS, pages 122­142. Springer, Heidelberg, March 2013.

[BPSV19] Ward Beullens, Bart Preneel, Alan Szepieniec, and Frederik Vercauteren. LUOV. Technical report, Na onal Ins tute of Stan-
dards and Technology, 2019. available at https://csrc.nist.gov/projects/post-quantum-cryptography/ round-2-submissions.

[BR95] Mihir Bellare and Phillip Rogaway. Op mal asymmetric encryp on. In Alfredo De San s, editor, EUROCRYPT'94, volume 950 of LNCS, pages 92­111. Springer, Heidelberg, May 1995.

[BR98] Mihir Bellare and Phillip Rogaway. Pss: Provably secure encoding method for digital signatures, 1998.

[BS20]

Xavier Bonnetain and André Schro enloher. Quantum security analysis of CSIDH. In Anne Canteaut and Yuval Ishai, editors, EUROCRYPT 2020, Part II, volume 12106 of LNCS, pages 493­522. Springer, Heidelberg, May 2020.

[CCJR20] Jorge Chávez-Saab, Jesús-Javier Chi-Domínguez, Samuel Jaques, and Francisco Rodríguez-Henríquez. The sqale of csidh:
Square-root vélu quantum-resistant isogeny ac on with low exponents. Cryptology ePrint Archive, Report 2020/1520, 2020. https://eprint.iacr.org/2020/1520.

[CDG+17] Melissa Chase, David Derler, Steven Goldfeder, Claudio Orlandi, Sebas an Ramacher, Chris an Rechberger, Daniel Slamanig, and Greg Zaverucha. Post-quantum zero-knowledge and signatures from symmetric-key primi ves. In Bhavani M. Thuraisingham, David Evans, Tal Malkin, and Dongyan Xu, editors, ACM CCS 2017, pages 1825­1842. ACM Press, October / November 2017.

[CFM+17] A. Casanova, J.-C. Faugère, G. Macario-Rat, J. Patarin, L. Perret, and J. Ryckeghem. GeMSS. Technical report,
Na onal Ins tute of Standards and Technology, 2017. available at https://csrc.nist.gov/projects/ post-quantum-cryptography/round-1-submissions.

© PQShield Ltd | www.pqshield.com

27 of 32

[CFS01] Nicolas Courtois, Ma hieu Finiasz, and Nicolas Sendrier. How to achieve a McEliece-based digital signature scheme. In Colin Boyd, editor, ASIACRYPT 2001, volume 2248 of LNCS, pages 157­174. Springer, Heidelberg, December 2001.

[CHKP10] David Cash, Dennis Ho einz, Eike Kiltz, and Chris Peikert. Bonsai trees, or how to delegate a la ce basis. In Henri Gilbert, editor, EUROCRYPT 2010, volume 6110 of LNCS, pages 523­552. Springer, Heidelberg, May / June 2010.

[CHR+16] Ming-Shing Chen, Andreas Hülsing, Joost Rijneveld, Simona Samardjiska, and Peter Schwabe. From 5-pass MQ-based iden fica on to MQ-based signatures. In Jung Hee Cheon and Tsuyoshi Takagi, editors, ASIACRYPT 2016, Part II, volume 10032 of LNCS, pages 135­165. Springer, Heidelberg, December 2016.

[CHR+18] Ming-Shing Chen, Andreas Hülsing, Joost Rijneveld, Simona Samardjiska, and Peter Schwabe. SOFIA: MQ-based signatures in the QROM. In Michel Abdalla and Ricardo Dahab, editors, PKC 2018, Part II, volume 10770 of LNCS, pages 3­33. Springer, Heidelberg, March 2018.

[CJS14] Andrew M. Childs, David Jao, and Vladimir Soukharev. Construc ng ellip c curve isogenies in quantum subexponen al me. J. Mathema cal Cryptology, 8(1):1­29, 2014.

[CKMS16] Sanjit Cha erjee, Neal Koblitz, Alfred Menezes, and Palash Sarkar. Another look at ghtness II: Prac cal issues in cryptography. Cryptology ePrint Archive, Report 2016/360, 2016. http://eprint.iacr.org/2016/360.

[CLM+18] Wouter Castryck, Tanja Lange, Chloe Mar ndale, Lorenz Panny, and Joost Renes. CSIDH: An efficient post-quantum commuta ve group ac on. In Thomas Peyrin and Steven Galbraith, editors, ASIACRYPT 2018, Part III, volume 11274 of LNCS, pages 395­427. Springer, Heidelberg, December 2018.

[CNS17] André Chailloux, María Naya-Plasencia, and André Schro enloher. An efficient quantum collision search algorithm and implica ons on symmetric cryptography. In Tsuyoshi Takagi and Thomas Peyrin, editors, ASIACRYPT 2017, Part II, volume 10625 of LNCS, pages 211­240. Springer, Heidelberg, December 2017.
[Cou06] Jean-Marc Couveignes. Hard homogeneous spaces. Cryptology ePrint Archive, Report 2006/291, 2006. http://eprint. iacr.org/2006/291.

[CSV17]

Daniel Cabarcas, Daniel Smith-Tone, and Javier A. Verbel. Key recovery a ack for ZHFE. In Tanja Lange and Tsuyoshi Takagi, editors, Post-Quantum Cryptography - 8th Interna onal Workshop, PQCrypto 2017, pages 289­308. Springer, Heidelberg, 2017.

[dB94]

Bert den Boer and Antoon Bosselaers. Collisions for the compressin func on of MD5. In Tor Helleseth, editor, EUROCRYPT'93, volume 765 of LNCS, pages 293­304. Springer, Heidelberg, May 1994.

[DCP+19] Jintai Ding, Ming-Shing Chen, Albrecht Petzoldt, Dieter Schmidt, and Bo-Yin Yang. Rainbow. Technical report,
Na onal Ins tute of Standards and Technology, 2019. available at https://csrc.nist.gov/projects/ post-quantum-cryptography/round-2-submissions.

[DH76] Whitfield Diffie and Mar n E. Hellman. New direc ons in cryptography. IEEE Transac ons on Informa on Theory, 22(6):644­ 654, 1976.

[Din12] Jintai Ding. Cryptographic systems using pairing with errors, 2012.

[DKL+20] Luca De Feo, David Kohel, Antonin Leroux, Christophe Pe t, and Benjamin Wesolowski. SQISign: Compact post-quantum signatures from quaternions and isogenies. In Shiho Moriai and Huaxiong Wang, editors, ASIACRYPT 2020, Part I, volume 12491 of LNCS, pages 64­93. Springer, Heidelberg, December 2020.

[DKRV17] Jan-Pieter D'Anvers, Angshuman Karmakar, Sujoy Sinha Roy, and Frederik Vercauteren. SABER. Technical re-
port, Na onal Ins tute of Standards and Technology, 2017. available at https://csrc.nist.gov/projects/ post-quantum-cryptography/round-1-submissions.

[DKS18] Luca De Feo, Jean Kieffer, and Benjamin Smith. Towards prac cal key exchange from ordinary isogeny graphs. In Thomas Peyrin and Steven Galbraith, editors, ASIACRYPT 2018, Part III, volume 11274 of LNCS, pages 365­394. Springer, Heidelberg, December 2018.

[DLP14]

Léo Ducas, Vadim Lyubashevsky, and Thomas Prest. Efficient iden ty-based encryp on over NTRU la ces. In Palash Sarkar and Tetsu Iwata, editors, ASIACRYPT 2014, Part II, volume 8874 of LNCS, pages 22­41. Springer, Heidelberg, December 2014.

[DN12]

Léo Ducas and Phong Q. Nguyen. Learning a zonotope and more: Cryptanalysis of NTRUSign countermeasures. In Xiaoyun Wang and Kazue Sako, editors, ASIACRYPT 2012, volume 7658 of LNCS, pages 433­450. Springer, Heidelberg, December 2012.

[DST19]

Thomas Debris-Alazard, Nicolas Sendrier, and Jean-Pierre Tillich. Wave: A new family of trapdoor one-way preimage sampleable func ons based on codes. In Steven D. Galbraith and Shiho Moriai, editors, ASIACRYPT 2019, Part I, volume 11921 of LNCS, pages 21­51. Springer, Heidelberg, December 2019.

© PQShield Ltd | www.pqshield.com

28 of 32

[DXL12] Jintai Ding, Xiang Xie, and Xiaodong Lin. A simple provably secure key exchange scheme based on the learning with errors problem. Cryptology ePrint Archive, Report 2012/688, 2012. http://eprint.iacr.org/2012/688.

[DYC+08] Jintai Ding, Bo-Yin Yang, Chia-Hsin Owen Chen, Ming-Shing Chen, and Chen-Mou Cheng. New differen al-algebraic a acks and reparametriza on of Rainbow. In Steven M. Bellovin, Rosario Gennaro, Angelos D. Keromy s, and Mo Yung, editors, ACNS 08, volume 5037 of LNCS, pages 242­257. Springer, Heidelberg, June 2008.

[ElG85] Taher ElGamal. A public key cryptosystem and a signature scheme based on discrete logarithms. IEEE Transac ons on Informa on Theory, 31:469­472, 1985.

[FG19] Luca De Feo and Steven D. Galbraith. Seasign: Compact isogeny signatures from class group ac ons. EUROCRYPT, 2019. https://eprint.iacr.org/2018/824.

[FJP14] Luca De Feo, David Jao, and Jérôme Plût. Towards quantum-resistant cryptosystems from supersingular ellip c curve isogenies. Journal of Mathema cal Cryptology, 8(3):209 ­ 247, 01 Sep. 2014.

[FO99a] Eiichiro Fujisaki and Tatsuaki Okamoto. How to enhance the security of public-key encryp on at minimum cost. In Hideki Imai and Yuliang Zheng, editors, PKC'99, volume 1560 of LNCS, pages 53­68. Springer, Heidelberg, March 1999.

[FO99b] Eiichiro Fujisaki and Tatsuaki Okamoto. Secure integra on of asymmetric and symmetric encryp on schemes. In Michael J. Wiener, editor, CRYPTO'99, volume 1666 of LNCS, pages 537­554. Springer, Heidelberg, August 1999.

[FS87]

Amos Fiat and Adi Shamir. How to prove yourself: Prac cal solu ons to iden fica on and signature problems. In Andrew M. Odlyzko, editor, CRYPTO'86, volume 263 of LNCS, pages 186­194. Springer, Heidelberg, August 1987.

[GGH97] Oded Goldreich, Shafi Goldwasser, and Shai Halevi. Public-key cryptosystems from la ce reduc on problems. In Burton S. Kaliski Jr., editor, CRYPTO'97, volume 1294 of LNCS, pages 112­131. Springer, Heidelberg, August 1997.

[GJ79]

M. Garey and D. Johnson. Computers and Intractability: A Guide to the Theory of NP-Completeness. Freeman, San Francisco, 1979.

[GJSS01] Craig Gentry, Jakob Jonsson, Jacques Stern, and Michael Szydlo. Cryptanalysis of the NTRU signature scheme (NSS) from Eurocrypt 2001. In Colin Boyd, editor, ASIACRYPT 2001, volume 2248 of LNCS, pages 1­20. Springer, Heidelberg, December 2001.

[GM82] Shafi Goldwasser and Silvio Micali. Probabilis c encryp on and how to play mental poker keeping secret all par al informaon. In 14th ACM STOC, pages 365­377. ACM Press, May 1982.

[GMW86] Oded Goldreich, Silvio Micali, and Avi Wigderson. Proofs that yield nothing but their validity and a methodology of cryptographic protocol design (extended abstract). In 27th FOCS, pages 174­187. IEEE Computer Society Press, October 1986.

[GMW87] Oded Goldreich, Silvio Micali, and Avi Wigderson. How to play any mental game or A completeness theorem for protocols with honest majority. In Alfred Aho, editor, 19th ACM STOC, pages 218­229. ACM Press, May 1987.

[GPS17]

Steven D. Galbraith, Christophe Pe t, and Javier Silva. Iden fica on protocols and signature schemes based on supersingular isogeny problems. In Tsuyoshi Takagi and Thomas Peyrin, editors, ASIACRYPT 2017, Part I, volume 10624 of LNCS, pages 3­33. Springer, Heidelberg, December 2017.

[GPV08] Craig Gentry, Chris Peikert, and Vinod Vaikuntanathan. Trapdoors for hard la ces and new cryptographic construc ons. In Richard E. Ladner and Cynthia Dwork, editors, 40th ACM STOC, pages 197­206. ACM Press, May 2008.

[Gro96] Lov K. Grover. A fast quantum mechanical algorithm for database search. In 28th ACM STOC, pages 212­219. ACM Press, May 1996.

[GS02] Craig Gentry and Michael Szydlo. Cryptanalysis of the revised NTRU signature scheme. In Lars R. Knudsen, editor, EUROCRYPT 2002, volume 2332 of LNCS, pages 299­320. Springer, Heidelberg, April / May 2002.

[HBG+18] Andreas Huelsing, Denis Bu n, Stefan-Lukas Gazdag, Joost Rijneveld, and Aziz Mohaisen. XMSS: eXtended Merkle Signature Scheme. RFC 8391, May 2018.

[HHK17] Dennis Ho einz, Kathrin Hövelmanns, and Eike Kiltz. A modular analysis of the Fujisaki-Okamoto transforma on. In Yael Kalai and Leonid Reyzin, editors, TCC 2017, Part I, volume 10677 of LNCS, pages 341­371. Springer, Heidelberg, November 2017.

[HHP+03] Jeffrey Hoffstein, Nick Howgrave-Graham, Jill Pipher, Joseph H. Silverman, and William Whyte. NTRUSIGN: Digital signatures using the NTRU la ce. In Marc Joye, editor, CT-RSA 2003, volume 2612 of LNCS, pages 122­140. Springer, Heidelberg, April 2003.

[HMA08] The keyed-hash message authen ca on code (hmac). Na onal Ins tute of Standards and Technology (NIST), FIPS PUB 198-1, U.S. Department of Commerce, 2008.

[HPS98] Jeffrey Hoffstein, Jill Pipher, and Joseph H. Silverman. NTRU: A ring-based public key cryptosystem. In ANTS, volume 1423 of Lecture Notes in Computer Science, pages 267­288. Springer, 1998.

© PQShield Ltd | www.pqshield.com

29 of 32

[HPS01] Jeffrey Hoffstein, Jill Pipher, and Joseph H. Silverman. NSS: An NTRU la ce-based signature scheme. In Birgit Pfitzmann, editor, EUROCRYPT 2001, volume 2045 of LNCS, pages 211­228. Springer, Heidelberg, May 2001.

[IKOS07] Yuval Ishai, Eyal Kushilevitz, Rafail Ostrovsky, and Amit Sahai. Zero-knowledge from secure mul party computa on. In David S. Johnson and Uriel Feige, editors, 39th ACM STOC, pages 21­30. ACM Press, June 2007.

[JD11]

David Jao and Luca De Feo. Towards quantum-resistant cryptosystems from supersingular ellip c curve isogenies. In Bo-Yin Yang, editor, Post-Quantum Cryptography - 4th Interna onal Workshop, PQCrypto 2011, pages 19­34. Springer, Heidelberg, November / December 2011.

[KLPT14] David Kohel, Kris n Lauter, Christophe Pe t, and Jean-Pierre Tignol. On the quaternion -isogeny path problem. Cryptology ePrint Archive, Report 2014/505, 2014. http://eprint.iacr.org/2014/505.

[KLS18]

Eike Kiltz, Vadim Lyubashevsky, and Chris an Schaffner. A concrete treatment of Fiat-Shamir signatures in the quantum random-oracle model. In Jesper Buus Nielsen and Vincent Rijmen, editors, EUROCRYPT 2018, Part III, volume 10822 of LNCS, pages 552­586. Springer, Heidelberg, April / May 2018.

[Lam79] Leslie Lamport. Construc ng digital signatures from a one-way func on. Technical Report SRI-CSL-98, SRI Interna onal Computer Science Laboratory, October 1979.

[LDK+19] Vadim Lyubashevsky, Léo Ducas, Eike Kiltz, Tancrède Lepoint, Peter Schwabe, Gregor Seiler, and Damien Stehlé.
CRYSTALS-DILITHIUM. Technical report, Na onal Ins tute of Standards and Technology, 2019. available at https: //csrc.nist.gov/projects/post-quantum-cryptography/round-2-submissions.

[LM95] Frank T. Leighton and Silvio Micali. Large provably fast and secure digital signature schemes based on secure hash func ons, 1995. Patent expired.

[LP11]

Richard Lindner and Chris Peikert. Be er key sizes (and a acks) for LWE-based encryp on. In Aggelos Kiayias, editor, CT-RSA 2011, volume 6558 of LNCS, pages 319­339. Springer, Heidelberg, February 2011.

[LPR10] Vadim Lyubashevsky, Chris Peikert, and Oded Regev. On ideal la ces and learning with errors over rings. In Henri Gilbert, editor, EUROCRYPT 2010, volume 6110 of LNCS, pages 1­23. Springer, Heidelberg, May / June 2010.

[Lyu09] Vadim Lyubashevsky. Fiat-Shamir with aborts: Applica ons to la ce and factoring-based signatures. In Mitsuru Matsui, editor, ASIACRYPT 2009, volume 5912 of LNCS, pages 598­616. Springer, Heidelberg, December 2009.

[McE78] Robert J. McEliece. A public-key cryptosystem based on algebraic coding theory. JPL DSN Progress Report, 44, 05 1978.

[Mer78] Ralph C. Merkle. Secure communica ons over insecure channels. Commun. ACM, 21(4):294­299, 1978.

[Mer90] Ralph C. Merkle. A cer fied digital signature. In Gilles Brassard, editor, CRYPTO'89, volume 435 of LNCS, pages 218­238. Springer, Heidelberg, August 1990.

[MI88] Tsutomu Matsumoto and Hideki Imai. Public quadra c polynominal-tuples for efficient signature-verifica on and messageencryp on. In C. G. Günther, editor, EUROCRYPT'88, volume 330 of LNCS, pages 419­453. Springer, Heidelberg, May 1988.

[NAB+17] Michael Naehrig, Erdem Alkim, Joppe Bos, Léo Ducas, Karen Easterbrook, Brian LaMacchia, Patrick Longa, Ilya Mironov,
Valeria Nikolaenko, Christopher Peikert, Ananth Raghunathan, and Douglas Stebila. FrodoKEM. Technical report, Na onal Ins tute of Standards and Technology, 2017. available at https://csrc.nist.gov/projects/ post-quantum-cryptography/round-1-submissions.

[NIE86] H. NIEDERREITER. Knapsack-type cryptosystems and algebraic coding theory. Prob. Control and Inf. Theory, 15(2):159­166, 1986.
[NIS20] NIST. Recommenda on for stateful hash-based signature schemes, 2020. https://doi.org/10.6028/NIST.SP. 800-208.

[NR06] Phong Q. Nguyen and Oded Regev. Learning a parallelepiped: Cryptanalysis of GGH and NTRU signatures. In Serge Vaudenay, editor, EUROCRYPT 2006, volume 4004 of LNCS, pages 271­288. Springer, Heidelberg, May / June 2006.

[Pai99] Pascal Paillier. Public-key cryptosystems based on composite degree residuosity classes. In Jacques Stern, editor, EUROCRYPT'99, volume 1592 of LNCS, pages 223­238. Springer, Heidelberg, May 1999.

[Pat95] Jacques Patarin. Cryptanalysis of the Matsumoto and Imai public key scheme of eurocrypt'88. In Don Coppersmith, editor, CRYPTO'95, volume 963 of LNCS, pages 248­261. Springer, Heidelberg, August 1995.

[PBD14] Jaiberth Porras, John Baena, and Jintai Ding. ZHFE, a new mul variate public key encryp on scheme. In Michele Mosca, editor, Post-Quantum Cryptography - 6th Interna onal Workshop, PQCrypto 2014, pages 229­245. Springer, Heidelberg, October 2014.

[Pei14] Chris Peikert. La ce cryptography for the internet. In Michele Mosca, editor, Post-Quantum Cryptography - 6th Interna onal Workshop, PQCrypto 2014, pages 197­219. Springer, Heidelberg, October 2014.

© PQShield Ltd | www.pqshield.com

30 of 32

[Pei20] Chris Peikert. He gives C-sieves on the CSIDH. In Anne Canteaut and Yuval Ishai, editors, EUROCRYPT 2020, Part II, volume 12106 of LNCS, pages 463­492. Springer, Heidelberg, May 2020.

[PPS17] Ray A. Perlner, Albrecht Petzoldt, and Daniel Smith-Tone. Total break of the SRP encryp on scheme. In Carlisle Adams and Jan Camenisch, editors, SAC 2017, volume 10719 of LNCS, pages 355­373. Springer, Heidelberg, August 2017.

[Rab79] Michael O. Rabin. Digital signatures and public key func ons as intractable as factoriza on. Technical Report MIT/LCS/TR212, Massachuse s Ins tute of Technology, January 1979.

[Rom90] John Rompel. One-way func ons are necessary and sufficient for secure signatures. In 22nd ACM STOC, pages 387­394. ACM Press, May 1990.

[RR02]

Leonid Reyzin and Natan Reyzin. Be er than BiBa: Short one- me signatures with fast signing and verifying. In Lynn Margaret Ba en and Jennifer Seberry, editors, ACISP 02, volume 2384 of LNCS, pages 144­153. Springer, Heidelberg, July 2002.

[RS06]

Alexander Rostovtsev and Anton Stolbunov. Public-Key Cryptosystem Based On Isogenies. Cryptology ePrint Archive, Report 2006/145, 2006. http://eprint.iacr.org/2006/145.

[RSA78] Ronald L. Rivest, Adi Shamir, and Leonard M. Adleman. A method for obtaining digital signatures and public-key cryptosystems. Communica ons of the Associa on for Compu ng Machinery, 21(2):120­126, 1978.

[SAB+17] Peter Schwabe, Roberto Avanzi, Joppe Bos, Léo Ducas, Eike Kiltz, Tancrède Lepoint, Vadim Lyubashevsky, John M. Schanck,
Gregor Seiler, and Damien Stehlé. CRYSTALS-KYBER. Technical report, Na onal Ins tute of Standards and Technology, 2017. available at https://csrc.nist.gov/projects/post-quantum-cryptography/round-1-submissions.

[SBK+17] Marc Stevens, Elie Bursztein, Pierre Karpman, Ange Alber ni, and Yarik Markov. The first collision for full SHA-1. In Jonathan Katz and Hovav Shacham, editors, CRYPTO 2017, Part I, volume 10401 of LNCS, pages 570­596. Springer, Heidelberg, August 2017.

[Sch90]

Claus-Peter Schnorr. Efficient iden fica on and signatures for smart cards (abstract) (rump session). In Jean-Jacques Quisquater and Joos Vandewalle, editors, EUROCRYPT'89, volume 434 of LNCS, pages 688­689. Springer, Heidelberg, April 1990.

[Sha79] Adi Shamir. How to share a secret. Communica ons of the Associa on for Compu ng Machinery, 22(11):612­613, November 1979.

[Sho94] Peter W. Shor. Algorithms for quantum computa on: Discrete logarithms and factoring. In 35th FOCS, pages 124­134. IEEE Computer Society Press, November 1994.

[SSH11]

Koichi Sakumoto, Taizo Shirai, and Harunaga Hiwatari. Public-key iden fica on schemes based on mul variate quadra c polynomials. In Phillip Rogaway, editor, CRYPTO 2011, volume 6841 of LNCS, pages 706­723. Springer, Heidelberg, August 2011.

[Ste94] Jacques Stern. A new iden fica on scheme based on syndrome decoding. In Douglas R. S nson, editor, CRYPTO'93, volume 773 of LNCS, pages 13­21. Springer, Heidelberg, August 1994.

[Ste96] Jacques Stern. A new paradigm for public key iden fica on. IEEE Trans. Inf. Theory, 42(6):1757­1768, 1996.

[TDTD13] Chengdong Tao, Adama Diene, Shaohua Tang, and Jintai Ding. Simple matrix scheme for encryp on. In Philippe Gaborit, editor, Post-Quantum Cryptography - 5th Interna onal Workshop, PQCrypto 2013, pages 231­242. Springer, Heidelberg, June 2013.

[Vér96] Pascal Véron. Improved iden fica on schemes based on error-correc ng codes. Appl. Algebra Eng. Commun. Comput., 8(1):57­69, 1996.

[Wil84] Hugh C. Williams. Some public key crypto-func ons as intractable as factoriza on. In G. R. Blakley and David Chaum, editors, CRYPTO'84, volume 196 of LNCS, pages 66­70. Springer, Heidelberg, August 1984.

[YAJ+17] Youngho Yoo, Reza Azarderakhsh, Amir Jalali, David Jao, and Vladimir Soukharev. A post-quantum digital signature scheme based on supersingular isogenies. In Aggelos Kiayias, editor, FC 2017, volume 10322 of LNCS, pages 163­181. Springer, Heidelberg, April 2017.

[Yao82] Andrew Chi-Chih Yao. Protocols for secure computa ons (extended abstract). In 23rd FOCS, pages 160­164. IEEE Computer Society Press, November 1982.

[Yao86] Andrew Chi-Chih Yao. How to generate and exchange secrets (extended abstract). In 27th FOCS, pages 162­167. IEEE Computer Society Press, October 1986.

[YS15]

Takanori Yasuda and Kouichi Sakurai. A mul variate encryp on scheme with Rainbow. In Sihan Qing, Eiji Okamoto, Kwangjo Kim, and Dongmei Liu, editors, ICICS 15, volume 9543 of LNCS, pages 236­251. Springer, Heidelberg, December 2015.

© PQShield Ltd | www.pqshield.com

31 of 32

[ZCD+17] Greg Zaverucha, Melissa Chase, David Derler, Steven Goldfeder, Claudio Orlandi, Sebas an Ramacher, Chris an Rech-
berger, and Daniel Slamanig. Picnic. Technical report, Na onal Ins tute of Standards and Technology, 2017. available at https://csrc.nist.gov/projects/post-quantum-cryptography/round-1-submissions.

© PQShield Ltd | www.pqshield.com

32 of 32

