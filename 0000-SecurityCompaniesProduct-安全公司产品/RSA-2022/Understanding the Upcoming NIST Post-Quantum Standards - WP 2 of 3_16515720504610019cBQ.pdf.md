Think openly, build securely
White paper:
Understanding the Upcoming NIST Post-Quantum Cryptographic Standards
 PQShield  February 10, 2021
© PQShield Ltd | www.pqshield.com | PQShield Ltd, Oxford, OX2 7HT, UK

The Na onal Ins tute of Standards and Technology (or NIST) is a US Government agency responsible for standardizing several cryptographic primi ves that are now ubiquitous: DES, AES, HMAC, SHA-{1,2,3}, (EC)DSA and much more. NIST is currently in the final phase of the process of standardizing postquantum cryptography [NIS17b, NIS19a, NIS20b] and the winners are expected to be announced early 2022.
This document is a presenta on of the 15 schemes (7 signature schemes and 8 key-establishment schemes) that are s ll under considera on by NIST to be the upcoming post-quantum cryptographic standards. As a follow-up to our overview of post-quantum cryptography [PQS20], it provides a more prac cal view of post-quantum schemes, some of which will become standards for decades to come. We present each of the 15 schemes in detail, and also provide extensive comparisons between them: bandwidth cost, computa onal cost, hardness assump ons and so on.

© PQShield Ltd | www.pqshield.com

2 of 39

Contents
1 The NIST Standardiza on Process 2 Signature Schemes 3 Dilithium (finalist) 4 Falcon (finalist) 5 Rainbow (finalist) 6 GeMSS (alternate) 7 Picnic (alternate) 8 SPHINCS+ (alternate) 9 Key-Encapsula on Mechanisms 10 Classic McEliece (finalist) 11 Kyber (finalist) 12 NTRU (finalist) 13 Saber (finalist) 14 BIKE (alternate) 15 HQC (alternate) 16 FrodoKEM (alternate) 17 NTRU Prime (alternate) 18 SIKE (alternate)
© PQShield Ltd | www.pqshield.com

4 5 11 12 13 14 15 16 17 23 24 25 26 27 28 29 30 31
3 of 39

1 The NIST Standardization Process

A ques on that may come to mind regarding standardiza on of post-quantum cryptography is:

Why standardize post-quantum cryptography now if quantum computers are not yet in prac cal use?

The reason is simple: standardizing and deploying new technology takes me. For example, the hash func on SHA-2 has been standardized since 2001 to replace SHA-1; yet the la er can s ll be found in many places1, despite several prac cal a acks against its collision resistance [SBK+17, LP19, LP20]. On the other hand, quantum compu ng is a fast-moving field, a rac ng hundreds of millions of dollars2 in yearly funding. In this context, early standardiza on gives organiza ons more me and flexibility to carry out a smooth transi on to quantum-safe cryptography.

There are a number of standardiza on efforts currently underway (by ETSI in Europe, CACR in China, etc.), but we focus on the one by NIST since it is by far the most documented and has attracted a significant amount of industrial and academic a en on. NIST's post-quantum standardiza on process was announced in February 2016 [NIS16], with the goal to:

 Standardize post-quantum signature schemes;  Standardize post-quantum key-establishment schemes.

NIST

annouFnocremsaul pccaollmfoiAnrngpnrsootaupnnodcsaaerlmsdeiznaAt noonfnoRpuornuocnceedms1senctanodf iRAdoanutnenosdu(n62c9ce)amnednidtaotfesRo(2u6n)d

3

candidates (7F Dra

+ 8A) standards

available

2015

2020

2025

By the ini al deadline of November 2017, 82 submissions were made. Out of these, 69 were considered "complete and proper" as per NIST's submission requirements and minimal acceptance criteria and were selected as Round 1 candidates (49 for key-establishment, 20 for signatures). In January 2019, 26 schemes were selected as Round 2 candidates (17 for key-establishment, 9 for signatures). In July 2020, 15 schemes were selected as Round 3 candidates. These are separated as finalists and alternates. As per NIST [NIS20b], "finalists will be considered for standardiza on at the end of the third round", while alternates "are s ll being considered for standardiza on, although this is unlikely to occur at the end of the third round".

Finally, NIST intends to make dra standards available between 2022 and 2024. Whatever NIST's choice, the dra standard(s) will be among the schemes presented in this document.

1 See for example The Github Blog: Highlights from Git 2.29. 2 Nature: Quantum gold rush: the private funding pouring into quantum start-ups
© PQShield Ltd | www.pqshield.com

4 of 39

2 Signature Schemes

We first discuss signature schemes under considera on for standardiza on. In Round 1 of this process (December 2017), 20 digital signature schemes were accepted [NIS17b]. A er a preliminary analysis by the cryptographic community, NIST selected 9 of these 20 schemes for Round 2 of the standardiza on process [NIS19a]. Out of these 9 schemes, 6 were selected for Round 3 of the standardiza on process [NIS20b]: 3 finalists and 3 alternates.

 Dilithium (finalist);  Falcon (finalist);  Rainbow (finalist);

 GeMSS (alternate);  SPHINCS+ (alternate);  Picnic (alternate).

These schemes are based on three families of hardness assump ons: la ces, mul variate equaons, and one-way func ons. Although there exist code-based or isogeny-based signature schemes,
none are in this shortlist (because they were either eliminated at Round 1, or proposed a er the submission deadline) so have not been included here. An overview of the signature schemes can be found in the figure below.

La ces

Hash-then-sign

Falcon

Fiat-Shamir

Dilithium

Signatures

Mul variate equa ons

Hash-then-sign

GeMSS

Fiat-Shamir

Rainbow

One-way func ons

Hash-then-sign

SPHINCS+

Fiat-Shamir

Picnic

In addi on, we provide the following data:  A compara ve performance study of the 6 signature schemes (pages 6 to 9);  For each scheme, one page summarizing its main proper es (pages 11 to 16).

© PQShield Ltd | www.pqshield.com

5 of 39

Communication Costs
We now provide a detailed comparison of the communica on costs of the 6 signature schemes for three security levels: NIST Level 1, 3 and 5 (conjectured at least as secure as AES-128, AES-192 and AES-256, respec vely). Interes ngly, there can be huge differences between schemes: two schemes have small public keys and small signatures (la ce-based schemes Dilithium and Falcon), two provide extremely small public keys but large signatures (Picnic and SPHINCS+) and two have enormous public keys but very small signatures (mul variate schemes GeMSS and Rainbow).
NIST Level 1

1.04 · 105 3.91 · 105

Size in bytes 1,312
2,420 897 666 66 32 34
12,359 32
17,088

50, 000 40, 000

Public key Signature

30, 000

20, 000

10, 000

0 Dilithium

Falcon

Rainbow

GeMSS

Picnic

SPHINCS+

© PQShield Ltd | www.pqshield.com

6 of 39

2.62 · 105 1.38 · 106 27,173 35,664

NIST Level 3

50, 000 40, 000

Public key Signature

Size in bytes

30, 000

20, 000

10, 000

1,952 3,293

0 Dilithium
NIST Level 5

Rainbow

GeMSS

Picnic

SPHINCS+

164 5.36 · 105
49 3.4 · 106
48 46,282
48 49,856

Size in bytes 2,592
4,595 1,793 1,280 212 67 64 64

50, 000 40, 000

Public key Signature

30, 000

20, 000

10, 000

0 Dilithium

Falcon

Rainbow

GeMSS

Picnic

SPHINCS+

© PQShield Ltd | www.pqshield.com

7 of 39

Computational Costs
We now compare the running mes in cycles of the 6 signature schemes, for op mized implementa ons targe ng x64 pla orms. All numbers are extracted from the specifica on documents of the schemes (which might be inaccurate) and were obtained on different pla orms. Therefore, they may not enable a completely fair comparison. To make these numbers less abstract, each graph also contains two horizontal red lines that correspond respec vely to 1 millisecond and 1 second on a microprocessor with a clock frequency of 3GHz, which is typical for microprocessors in personal computers.
We observe a high disparity between candidates. For example, the overall fastest signature scheme at the highest security level (Dilithium) has key genera on, signing and verifica on procedures that are, respec vely, about 140, 1200 and 100 mes faster than the overall slowest one (SPHINCS+). Note that raw performances do not tell the full story, since SPHINCS+ relies on what appear to be more conserva ve assump ons than any other signature scheme presented here.

NIST Level 1

1010

Keygen

1s

Sign

109

Verify

108

1.83 · 107 1.38 · 107 2.75 · 106
6.85 · 107 4.8 · 106

1.67 · 107 1.82 · 106 1.01 · 105

9.9 · 106

1.99 · 107

Running me in cycles

3.87 · 105 82,339

67,000 34,000

70,548 1.95 · 105
72,633

107 1ms
106

105

104 Dilithium

Falcon

Rainbow

GeMSS

Picnic

SPHINCS+

© PQShield Ltd | www.pqshield.com

8 of 39

9 of 39

© PQShield Ltd | www.pqshield.com

1s 1ms SPHINCS+ 1s 1ms SPHINCS+

Picnic

GeMSS

Rainbow

Falcon

104 Dilithium

105

Running me in cycles

109

108

107

106

Keygen

Sign

Verify

1.54 · 105 3.45 · 105
1.51 · 105

7.9 · 105 1.68 · 105

6.31 · 107

7.39 · 105 3.92 · 105

1.92 · 108

1.48 · 108 7.61 · 106 5.35 · 105

6.56 · 107 4.69 · 107 2.13 · 107
4.36 · 108 1.49 · 107

1010

NIST Level 5

Picnic

GeMSS

Rainbow

104 Dilithium

105

109

Verify

108

107

106

Running me in cycles 1.54 · 105
2.96 · 105 1.02 · 105

2.85 · 105 1.32 · 105

5.2 · 107

6.03 · 107 4.53 · 106 2.74 · 105

3.76 · 107 2.92 · 107 4.06 · 106
1.13 · 108 7.55 · 106

Sign

Keygen

1010

NIST Level 3

Breakdown of Each Scheme
For each signature scheme, we now provide the following informa on:
 The paradigm can be either Hash-then-sign or Fiat-Shamir. Even in the same family, two schemes based on different paradigms o en end up with very different proper es.
 The family can be either La ces, Mul variate equa ons or One-way func ons.  The underlying hard problem(s) is specified.  The symmetric primi ves and the type of randomness used are specified. While these are
not too important theore cally, they can have a huge impact on performance. For example, schemes such as Picnic and SPHINCS+ are very dependent on the symmetric primi ve used, and Gaussian distribu ons (used in Falcon) can be hard to generate in a masked fashion.
 Links to the specifica on, the website (if any) and to related works are also provided.  A short summary highlights the key facts about the scheme.  Finally, a performance table is provided.

© PQShield Ltd | www.pqshield.com

10 of 39

3 Dilithium (finalist)

Type: Paradigm: Family: Hard Problems: Sym. primi ves: Randomness: Specifica on: Website: Related Works:

Signature Fiat-Shamir La ces Module-LWE (Learning With Errors), Module-SIS (Short Integer Solu on) SHAKE, AES Uniform, and uniform over the set B of ternary vectors with L1 norm  [LDK+20] https://pq-crystals.org/dilithium/ [Lyu09, Lyu12, GLP12, DDLL13, BG14, KLS18, DKL+18, BP18b]

Paradigm Dilithium is based on the Fiat-Shamir with Aborts paradigm, introduced in [Lyu09]. It implements two notable tricks: the first one, introduced in [GLP12], divides the size of the public key almost in half. A related trick by [BG14] reduces the size of the signature by half, by sending only one ring element instead of two. It also borrows elements of design from BLISS [DDLL13].
Hard Problems Dilithium relies on the (decisional) ModuleLWE and Module-SIS problems [LS15]. In addi on, the security proof in the QROM relies on a new problem called SelfTargetMSIS [KLS18] (this problem might not be necessary a er all, as discussed in the next paragraph).

Security Model In the ROM, Dilithium is claimed to be SEUCMA under the (decisional) Module-LWE and Module-SIS problems; SEU-CMA stands for the classical no on of Strong Existen al Unforgeability under Chosen-Message A ack. In the QROM, it is claimed to be SEU-CMA under Module-LWE, Module-SIS and SelfTargetMSIS. New results [DFMS19, LZ19] seem to imply that the security proof of Dilithium can be made stronger, and that the hypothesis SelfTargetMSIS may not be necessary a er all.
Design Rationale and Physical Attacks The design of Dilithium has been heavily influenced by the numerous side-channel a acks to which its prececessor, BLISS, has been subjected [BHLY16, PBY17, EFGT17, BDE+18]. To guard against these a acks, Dilithium discards BLISS's use of Gaussian distribu ons, and relies on uniform distribu ons instead. A masked implementa on of Dilithium has been proposed in [MGTF19].

NIST level 2 3 5

|SK| (bytes)
-

|PK| (bytes)
1312 1952 2592

|sig| (bytes)
2420 3293 4595

© PQShield Ltd | www.pqshield.com

KG (cycles)
70548 153856 153936

Sign (cycles) Verify (cycles)

194892 296201 344578

72633 102396 151066

11 of 39

4 Falcon (finalist)

Type: Paradigm: Family: Hard Problems: Sym. primi ves: Randomness: Specifica on: Website: Related Works:

Signature Hash-then-sign La ces NTRU SHAKE-256 Noncentered discrete Gaussians [PFH+20] https://falcon-sign.info/ [HHP+03, GPV08, SS13, DLP14, DP16, OSHG19]

Design Falcon is based on the GPV framework [GPV08] for obtaining hash-then-sign schemes over la ces. As first suggested by [SS13, DLP14], the design is instan ated over the very compact class of NTRU la ces [HHP+03] in order to minimize the bandwidth cost. Falcon is the Round 3 signature with the smallest communica on cost (public key + signature).
Algorithmic Optimisations Falcon exploits the algebraic structure of cyclotomic rings in order to op mize its efficiency, notably via the use of a Fast Fourier Sampling algorithm [DP16] in the signing procedure, and of a tower-of-rings algorithm [PP19] during key genera on. Both algorithms yields a O~ (n)-factor improvement compared to previous algorithms, n being the degree of the base ring Z[x]/(xn + 1).

Modes of Operation The specifica on of Falcon highlights a few possible modes of opera on; in addi on to the classical mode, the key-recovery mode doubles the size of the signature but shrinks the key size to 64 bytes. The messagerecovery mode recovers part of the message (similarly to RSA's key-recovery mode). Finally, Falcon can be converted to an iden tybased encryp on scheme à la [DLP14].
Implementation Falcon uses floa ng-point arithme c (FPA), which can make its implementa on delicate on pla orms that don't support FPA na vely. In this case, FPA needs to be emulated. [OSHG19, Por19] have proposed implementa ons of Falcon on ARM Cortex-M4; both use memory-laziness tricks in order to reduce its memory footprint.

NIST level 1 3 5

|SK| (bytes)
-

|PK| (bytes)
897 -
1793

|sig| (bytes)
666 -
1280

© PQShield Ltd | www.pqshield.com

KG (cycles)
19872000 -
63135000

Sign (cycles) Verify (cycles)

386678 -
789564

82339 -
168498

12 of 39

5 Rainbow (finalist)

Type: Paradigm: Family: Hard Problems: Sym. primi ves: Randomness: Specifica on: Website: Related Works:

Signature Hash-then-sign Mul variate equa ons MQ (Mul variate Quadra c), UOV (Oil and Vinegar), MinRank SHA (2), AES Uniform [DCP+20] https://www.pqcrainbow.org/ [DS05, PBB10, KPG99, SSH11, Pet20, Beu20]

Paradigm Rainbow is based on the Hash-then-sign paradigm. It implements an upgraded version of UOV [KPG99] in order to propose more efficient parameters. For instance, for a specific choice of parameters one directly obtains the original UOV scheme.
Hard Problems Rainbow relies on the MQ (Mul variate Quadra c) and UOV (Oil and Vinegar) problems. Note that this is heuris c, and there is no known security reduc on of Rainbow to precisely defined instances of these problems.
Design Rationale Rainbow is based on a quadra c central map and its inversion func on. This inversion func on is based on a parameter that can be seen as the depth or layer of inversion. Depending on the layer value, one can achieve different efficiency results for the underlying signature schemes: the more layers, the larger the key but the more efficient the implementa on. It is worth no ng that for a layer equal to one, the underlying signature scheme is the original UOV signature.

Variants There are a few variants of Rainbow: standard Rainbow, CZ-Rainbow and compressed Rainbow. CZ-Rainbow uses a trick by [Pet20] to reduce the public key size, whereas the latter allows be er memory usage with a compressed private key form but a slower signature genera on process. Overall, Rainbow's main advantage is the shortness of the signatures. The performance numbers provided here are those of standard Rainbow.
Recent Attacks Two papers [NIW+20, PS20] recently revisited the complexity of the Rainbow Band Separa-
on a ack. A new work by Beullens [Beu20] has shown that Rainbow failed to take into account another a ack, and has put a significant dent in the security of currently proposed parameters.

NIST level 1 3 5

|SK| (bytes)
-

|PK| (bytes) 103628 261602 536166

|sig| (bytes)
66 164 212

© PQShield Ltd | www.pqshield.com

KG (cycles)
9900000 52000000 192000000

Sign (cycles) Verify (cycles)

67000 285000 739000

34000 132000 392000

13 of 39

6 GeMSS (alternate)

Type: Paradigm: Family: Hard Problems: Sym. primi ves: Randomness: Specifica on: Website: Related Works:

Signature Hash-then-sign Mul variate equa ons MinRank, HFEvSHA, AES Uniform, random inver ble matrices [CFM+20] https://www-polsys.lip6.fr/Links/NIST/GeMSS.html [PCG01, DY13, Pat96, KPG99]

Paradigm GeMSS is based on the Hash-then-sign paradigm. It implements a direct lineage from QUARTZ [PCG01] and takes some design ra-
onale from the Gui mul variate signature scheme [DY13]. Both schemes descend from the Hidden Field Equa ons cryptosystem.
Hard Problem GeMSS relies on a variant of the Hidden Field Equa ons problem (HFE, [Pat96]). This variant, called HFEv-, was introduced in [PCG01] and adds two new parameters to HFE (vinegar and minus to HFE, hence the "v-").

Design and Variants The design of GeMSS is heavily influenced by QUARTZ [PCG01], proposed in the early 2000's. It allows fast verifica-
on and short signature sizes at the cost of large public keys. The specifica on of GeMSS proposes 6 variants (GeMSS and Blue/Red/Cyan/White/Magenta-GeMSS), and each comes in 3 security levels, hence there are 18 parameter sets for GeMSS. The performance numbers we give are for MagentaGeMSS.
New Attack A very recent work [TPD20] has shown that the vinegar and minus modifica ons only marginally increase the security of the HFE problem. As a consequence, they show that GeMSS, RedGeMSS and BlueGeMSS fall short of their claimed security levels.

NIST level 1 3 5

|SK| (bytes)
16 24 32

|PK| (bytes) 390615 1380383 3401441

|sig| (bytes)
32 49 67

© PQShield Ltd | www.pqshield.com

KG (cycles)
16700000 60300000 148000000

Sign (cycles) Verify (cycles)

1820000 4530000 7610000

101000 274000 535000

14 of 39

7 Picnic (alternate)

Type: Paradigm: Family: Hard Problems: Sym. primi ves: Randomness: Specifica on: Website: Related Works:

Signature Fiat-Shamir One-way func ons Inver bility of a one-way func on LowMC (underlying one-way func on), SHAKE Uniform [ZCD+20] https://microsoft.github.io/Picnic/ [ARS+15, CDG+17, KKW18, DN19, DKP+19]

High-Level Design Picnic stands out among signature schemes because of its unique design, as it relies on mul party computa on (or MPC), a paradigm in which N par es collaborate to compute the output of a func on F. The public key is pk = F(sk), where F is a publicly-known oneway func on. The signing procedure simulates a MPC protocol (this technique is called MPC-in-the-head, and is similar to what FiatShamir does for sigma protocols), and the signature is a transcript of this simula on.
Picnic Present in all three rounds, this version simulates a MPC protocol with 3 par es. It relies on the proof system ZKB++ [CDG+17], and its communica on cost as well as its running
mes are comparable to those obtained by hash-based signatures.
Picnic2 Only present in Round 2 [ZCD+19], Picnic2 simulates a MPC protocol with 64 par es. It uses new techniques introduced by [KKW18], which divides the signature size by 3 but increases signing and verifica on mes by an order of magnitude compared to Picnic.

Picnic3 Compared to Picnic2, this variant reduces the number of par es from 64 to 16, and makes some tweaks to the MPC protocol and to LowMC. As a consequence, it is an order of magnitude faster than Picnic2. See [KZ20] for more details. The performance numbers we provide are for Picnic3.
LowMC Both Picnic and Picnic2 require a one-way func on at their core: this func on must of course be hard to invert, but should have as few mul plica ons as possible, since these are costly to evaluate in MPC. Thus they use LowMC [ARS+15], a block cipher tailored for MPC and designed to have a very small mul plica ve complexity. Although recent, LowMC has been studied in a fair amount of works [DKP+19, JNRV20, LIM20].
Multi-Target Attack on Round 1 Picnic A recent a ack [DN19] has shown that in the Round 1 version of Picnic, an adversary knowing Q signatures could recover the private key about 128 · Q mes faster than predicted by the theory. This a ack has been mi gated in the Round 2 submission.

NIST level 1 3 5

|SK| (bytes)
17 24 32

|PK| (bytes)
34 48 64

|sig| (bytes) 12359 27173 46282

© PQShield Ltd | www.pqshield.com

KG (cycles)
4151 6567 9504

Sign (cycles) Verify (cycles)

18252055 37595772 65555710

13811201 29243365 46887830

15 of 39

8 SPHINCS+ (alternate)

Type: Paradigm: Family: Hard Problems: Sym. primi ves: Randomness: Specifica on: Website: Related Works:

Signature Hash-then-sign One-way func ons Mul -target second-preimage resistance of a hash func on family SHAKE-256, SHA-256 or Haraka (underlying hash func on) Uniform [HBD+20] https://sphincs.org/ [BDH11, Hül13, BHH+15, HRS16, AE17, AE18]

Design Rationale and Optimizations SPHINCS+ is a stateless hash-based signature scheme. It follows the framework introduced in [BHH+15], which combines Merkle trees, Goldreich trees and hash-based few-
mes signatures (or FTS). SPHINCS+ introduces a few op miza ons such as the use of tweakable hash func ons [HRS16] to protect against mul -target a acks. HORST, an FTS used in [BHH+15], has been replaced by FORS, a more secure FTS which also provides smaller signatures. See also [BHK+19] for an up-to-date presenta on of the framework.
Variants SPHINCS+ admits several variants: in addi-
on to the 3 security levels (128, 192 or 256), there are 3 choices for the underlying building block (SHAKE-256, SHA-256 or Haraka). Addi onally, one could choose between a "small" and a "fast" variant: these provide a trade-off between the size of the signature and the running me of the signing procedure. Finally, one could choose between a

"simple" variant which is simpler and faster, and a "robust" variant which has a more conserva ve security argument. Hence there are 3 × 3 × 2 × 2 = 36 variants. The performance numbers provided here are those of SPHINCS+-SHA-256-fast-robust.
Security Proof? While some simple hash-based signatures have security reduc ons to standard assump-
ons over generic hash func ons, SPHINCS+ is one of the more complex schemes in this family, and no security proof is known for it (yet). See also [BH19].
Physical Attacks While no black-box a ack has been proposed against SPHINCS+, a side-channel attack [KGB+18] has shown how an unprotected implementa on can leak part of the private key. Similarly, [CMP18] showed theore cally that one single, mildly-controlled fault injec on can lead to the recovery of the private key, and [GKPM18] carried this a ack on an ARM Cortex M3.

NIST level 1 3 5

|SK| (bytes)
64 96 128

|PK| (bytes)
32 48 64

|sig| (bytes) 17088 35664 49856

© PQShield Ltd | www.pqshield.com

KG (cycles)
2748026 4063066 21327470

Sign (cycles) Verify (cycles)

68541826 113484456 435984168

4801338 7552358 14938510

16 of 39

9 Key-Encapsulation Mechanisms

We now study the key-establishment schemes under considera on for standardiza on. In Round 1 of NIST's standardiza on process (December 2017), 49 submissions for key-establishment were accepted [NIS17b]. A er a preliminary analysis by the cryptographic community, NIST selected 17 of these 49 submissions for Round 2 of the standardiza on process [NIS19a]. Out of these 17 submissions, 9 were selected to Round 3 of the standardiza on process [NIS20b]: 4 finalists and 5 alternates.

 Classic McEliece (finalist);  Kyber (finalist);  NTRU (finalist);  Saber (finalist);

 BIKE (alternate);  FrodoKEM (alternate);  HQC (alternate);  NTRU Prime (alternate);  SIKE (alternate).

These submissions are based on three families of hardness assump ons: codes, la ces or isogenies. Candidates based on mul variate equa ons were eliminated at Round 1. Some submissions also propose an encryp on scheme or a key-exchange protocol, but all submissions propose a key encapsula on mechanism (henceforth KEM). This KEM is typically obtained by applying a CCA transform to a base key-exchange/encryp on scheme, and therefore usually claims the best security guarantees (security against ac ve a ackers). Thus, for simplicity we will only consider KEMs. An overview of the KEMs can be found in the figure below.

Codes

Hamming metric
Rank metric

QC-MDPC Goppa codes
QC+BCH

Variants of LWE

Standard Module

BIKE Classic McEliece HQC FrodoKEM Kyber

KEMs

La ces

NTRU

NTRU

Variants of LWR

Ring Module

NTRU Prime Saber

Isogenies

SIKE

In addi on, we provide the following data:  A compara ve performance study of the 9 KEMs (pages 18 to 21);  For each scheme, one page summarizing its main facts (pages 23 to 31).
© PQShield Ltd | www.pqshield.com

17 of 39

Communication Costs
The following sec on provides a detailed comparison of the communica on costs of the 9 Round 3 KEMs for three security levels: NIST Level 1 (conjectured at least as secure as AES-128), NIST Level 3 (conjectured at least as secure as AES-192) and NIST Level 5 (conjectured at least as secure as AES-256). At the lowest security level (NIST Level 1), most schemes manage to keep their total communica on cost below 2000 bytes. In that regard, the most efficient scheme is SIKE and the least efficient is Classic McEliece, which has very large public keys, although it manages to have the smallest ciphertexts across all schemes.
NIST Level 1

2.61 · 105 9,616 9,720

Size in bytes 1,541 1,573 128
2,249 4,481
800 768 699 699 994 897 672 736 197 236

10, 000 8, 000

Public key Ciphertext

6, 000

4, 000

2, 000

0

BIKE Classic

McEliece

HQC FrodoKEM

Kyber

NTRU NTRU Prime

Saber

SIKE

© PQShield Ltd | www.pqshield.com

18 of 39

5.24 · 105 9,036
15,632 15,744

NIST Level 3

10, 000 8, 000

Public key Ciphertext

3,083 3,115 188
4,522 1,184 1,088 930 930 1,322 1,184 992 1,088 274 336

Size in bytes

6, 000

4, 000

2, 000

0

BIKE Classic

McEliece

HQC FrodoKEM

Kyber

NTRU NTRU Prime

Saber

SIKE

NIST Level 5

1.04 · 106 14,469 21,520 21,632

10, 000 8, 000

Public key Ciphertext

5,122 5,134 240
7,245 1,568 1,568 1,230 1,230 1,312 1,472 335 410
2,067 1,847

Size in bytes

6, 000

4, 000

2, 000

0

BIKE Classic

McEliece

HQC FrodoKEM

Kyber

NTRU

Saber

© PQShield Ltd | www.pqshield.com

SIKE NTRU Prime 19 of 39

Computational Costs
We now compare the running mes in cycles of the 9 KEMs, for op mized implementa ons targe ng x64 pla orms. All numbers are extracted from the specifica on documents of the schemes (which might be inaccurate) and were obtained on different pla orms. Therefore, they may not enable a completely fair comparison. To make these numbers less abstract, each graph also contains two horizontal red lines that correspond respec vely to 1 millisecond and 1 second on a microprocessor with a clock frequency of 3GHz, which is typical for microprocessors in personal computers.
As with signatures, there can be a large disparity between candidates. At the highest security level, the fastest scheme overall (Kyber) is about 200 mes faster than FrodoKEM, and about 600
mes faster than SIKE. Again, these numbers do not tell the full story, as FrodoKEM relies on hardness assump ons that are far less structured than Kyber's, and SIKE is much cheaper in terms of bandwidth.

NIST Level 1

1.02 · 107 1.51 · 107
1.11 · 107

3.66 · 107

4.02 · 106 4.44 · 106 4.33 · 106

7.53 · 105

43,232 62,236 62,624

46,620 59,324

1.91 · 105 61,331 40,026

1.36 · 105 2.2 · 105 3.84 · 105

6 · 105 2.2 · 105
2.22 · 106

Running me in cycles

1010
Keygen Enc Dec 1s
109
108
107 1ms
106

33,856 45,200 34,572

43,832 1.34 · 105

105

104

BIKE Classic

McEliece

HQC

FrodoKEM

Kyber

NTRU NTRU Prime

Saber

SIKE

© PQShield Ltd | www.pqshield.com

20 of 39

21 of 39

© PQShield Ltd | www.pqshield.com

SIKE

Saber

NTRU

Kyber

FrodoKEM

HQC

1ms

NIST Level 5
1010 109 108 107 106 105 104
Classic McEliece

Running me in cycles

1.49 · 105 3.23 · 105

2.84 · 108

5.45 · 105 9.18 · 105 1.54 · 106

1.52 · 107 1.64 · 107 1.61 · 107

73,544 97,324 79,128

4.32 · 105 98,809
75,384

1.26 · 105 1.54 · 105 1.56 · 105

4.09 · 107 6.33 · 107
4.66 · 107

Keygen Enc Dec 1s

SIKE

Saber

NTRU NTRU Prime

Kyber

FrodoKEM

HQC

McEliece

BIKE Classic

104

105

107 1ms
106

Running me in cycles

108

1.78 · 106 4.65 · 105
6.61 · 106

1.16 · 105 2.71 · 105

1.17 · 108

3.05 · 105 5.01 · 105 8.21 · 105

8.58 · 106 9.3 · 106 9.14 · 106

52,732 67,624 53,156

3.09 · 105 83,519
59,729

60,668 80,904

1.23 · 106

80,340
1.03 · 105 1.03 · 105

2.64 · 107 3.75 · 107 2.92 · 107

1010
Keygen Enc Dec 1s
109

NIST Level 3

Breakdown of Each Scheme
For each KEM, we now provide the following informa on:
 The transform is the generic conversion used to turn an IND-CPA scheme into an IND-CCA scheme. We recall that IND-CPA stands for Indis nguishability under Chosen Plaintext A ack, and IND-CCA stands for Indis nguishability under Chosen Ciphertext A ack. The former is simpler to achieve, but does not guarantee resistance against an a acker that can tamper with ciphertexts (for example in a man-in-the-middle a ack). Therefore, IND-CPA schemes are usually converted to IND-CCA schemes using a CCA transform.
 The family can be either Error-correc ng codes, La ces or Isogenies.
 The underlying hard problem is specified.
 The symmetric primi ves and the type of randomness used are specified. These can impact performance: in some schemes, the call to a symmetric primi ve actually takes most of the running me. The type of randomness impacts how easy it is to protect a scheme against side-channel a acks, for example via the masking countermeasure.
 Links to the specifica on, the website (if any) and to related works are also provided.
 A short summary highlights the key facts about the scheme.
 Finally, a performance table is provided.

© PQShield Ltd | www.pqshield.com

22 of 39

10 Classic McEliece (finalist)

Type: CCA Transform: Family: Hard Problems: Sym. primi ves: Randomness: Specifica on: Website: Related Works:

KEM Dent [Den03], SXY [SXY18], see also [BP18a] Error-correc ng codes (Goppa codes) Syndrome Decoding, Indis nguishability of Goppa codes from random codes SHAKE Uniform, fixed weight [ABC+20] https://classic.mceliece.org [McE78, Den03, NIE86, SXY18]

Design Despite its name, Classic McEliece is not exactly based on McEliece's scheme [McE78], but rather on a dual variant by Niederreiter [NIE86], which is equivalent securitywise. One of the selling points of Classic McEliece is its very conserva ve design: the original designs by [McE78, NIE86] have been extensively studied, and Classic McEliece makes no fundamental change to them.
Chosen-Ciphertext Security Design-wise, the most notable novelty of Classic McEliece is perhaps the CCA transform that is used to obtain an INDCCA KEM from a OW-CPA public-key encryp on scheme. This transform is inspired by Dent [Den03] and Saito-XagawaYamakawa [SXY18]. See also [BP18a] for discussions on the QROM security of this transform.

Size Constraints Classic McEliece has very large public keys but very small ciphertexts. Although this may make it unsuitable in some contexts, applica-
ons for which ciphertext size is more important than key size may benefit from it. This is demonstrated in [HNS+20], which uses Classic McEliece in a post-quantum version of the WireGuard protocol. See also [BL20] for a protocol built around these constraints.
Hardware Implementation and Attacks Hardware implementa ons of the core mathema cal elements of Classic McEliece have been provided in [WSN18], and the specifica-
on provides performance numbers on Ar x7 and Virted-7 FPGAs. Note that this is not a full implementa on per se (it does not include, e.g., hashing). The implementa on of [WSN18] implements the Berlekamp-Massey decoder in constant-
me to prevent ming a acks. However [LNPS20] showed that it is s ll vulnerable to an electromagne c side-channel a ack, and shows it is possible to recover a plaintext in a few hundred power traces.

NIST level 1 3 5

|SK| (bytes)
6492 13608 13932

|PK| (bytes) 261120 524160 1044992

|ctxt| (bytes)
128 188 240

© PQShield Ltd | www.pqshield.com

KG (cycles)
36627388 116914656 284468140

Enc (cycles)
43832 115540 149080

Dec (cycles)
134184 270856 322988
23 of 39

11 Kyber (finalist)

Type: CCA Transform: Family: Hard Problems: Sym. primi ves: Randomness: Specifica on: Website: Related Works:

KEM Tweaked Fujisaki-Okamoto [FO99] with implicit rejec on [HHK17] La ces Module-LWE SHA 3-256/512 and SHAKE-128/256 Binomial [SAB+20] https://pq-crystals.org/kyber/ [LPR10, LP11, LS15, ADPS16b, ADPS16a, BDK+18]

Design Kyber follows the Lindner-Peikert framework [LPR10, LP11], also used by Saber, FrodoKEM and NTRU Prime (NTRU LPRime). We give a simplified (CPA-secure) descrip on below. Key genera on goes as follows: 1. Sample a pseudo-random matrix A. 2. Sample short matrices S, E. 3. Compute B = AS + E. 4. The public key is pk = (A, B), and the pri-
vate key is sk = S. Encryp on goes as follows: 1. Sample short matrices R, E, E. 2. Compute U = RA + E and
V = RB + E + Encode(msg). 3. The ciphertext is ctxt = (U, V). Decryp on goes as follows: 1. msg = Decode(V - US).

Module Lattices Kyber uses module la ces: it manipulates matrices and vectors with entries in R = Zq[x]/(x256 + 1); the security is adjusted by changing the dimensions of these matrices and vectors. Ra onales behind this choice is to provide a trade-off between efficiency and conserva sm, to make implementa on simpler and to easily change security levels.

NIST level 1 3 5

|SK| (bytes)
1632 2400 3168

|PK| (bytes)
800 1184 1568

|ctxt| (bytes)
768 1088 1568

© PQShield Ltd | www.pqshield.com

Hashing the Public Key Kyber achieves CCA security by performing a variant of Fujisaki-Okamoto's transform. One interes ng fact is that Kyber also hashes the public key as part of that process; it has been argued [BDK+18, SAB+20] that this provides protec on against mul -target a acks and other useful proper es.
Round 2 Changes Between the Round 1 and Round 2, Kyber has reduced the modulus q by a factor of about two, due to improvements in NTT techniques. The Round 1 version of Kyber [SAB+17] also included a technique for compressing public keys by dropping least significant bits. D'Anvers pointed out in [NIS17a] that this technique could invalidate Kyber's security proof (though in prac ce, it does not seem to introduce a concrete weakness). Consequently, the compression technique was removed in the Round 2 specifica on.

KG (cycles)
33856 52732 73544

Enc (cycles)
45200 67624 97324

Dec (cycles)
34572 53156 79128
24 of 39

12 NTRU (finalist)

Type: CCA Transform: Family: Hard Problems:
Sym. primi ves: Randomness: Specifica on: Website: Related Works:

KEM (and Encryp on) Um [HHK17], Saito-Xagawa-Yamada [SXY18], SimpleKEM [BP18a] La ces One-Wayness under Chosen Plaintext A acks (OW-CPA) of the underlying DPKE SHAKE-256, SHA 3-256 Ternary polynomials (some mes with bounded weight) [CDH+20] https://ntru.org/ [HPS98, Den03, HPS+17, HRSS17, Sch18]

History NTRU has a long story as it was first proposed 20 years ago [HPS98]. Since then, the scheme has known a few evolu ons. It was the first scheme for which decryp on failure a acks (a common caveat of many la ce-based KEMs) were highlighted [HNP+03], and a fix was proposed via the NAEP transform [HSSW03]. Over the years, updated parameters were proposed [HHHW09, HPS+17] to account for cryptanaly c advances.
Design NTRU is based on a variant of the eponymous assump on. By tweaking the parameters of the original NTRU scheme [HPS98], it makes it easy to implement in constant me and eliminates decryp on failures [HNP+03], "evaluate-at-1" a acks and inver bility checks. There are several ways to interpret and prove the CCA transform used by NTRU: either as the Um transform of [HHK17], the one of [SXY18] or the SimpleKEM transform from [BP18a].

A Merge of Two Schemes NTRU is the merge of two Round 1 schemes: NTRU-HRSS-KEM [SHRS17] and NTRUEncrypt [ZCHW17]. NTRU-HRSS-KEM aimed at perfect correctness and used a CCA transform inspired by Dent [Den03]. On the other hand, NTRUEncrypt relied on the NAEP transform [HSSW03], and proposed parameters with decryp on failures, parameters inspired by a construc on by Stehlé and Steinfeld [SS13] and (op onally) the use of Gaussian distribu ons.
Experimental TLS deployments Google [Lan18] and Cloudflare [Kwi19] have experimentally deployed NTRU-HRSS-KEM (as well as SIKE) on TLS as an effort to assess the feasibility of a post-quantum TLS. Conclusions can be found at [KV19]. Similar deployment efforts were conducted by Amazon [Hop19, Wei20], this me on BIKE and SIKE.

NIST level 1 3 5

|SK| (bytes)
935 1234 1590

|PK| (bytes)
699 930 1230

|ctxt| (bytes)
699 930 1230

© PQShield Ltd | www.pqshield.com

KG (cycles)
191279 309216 431667

Enc (cycles)
61331 83519 98809

Dec (cycles)
40026 59729 75384
25 of 39

13 Saber (finalist)

Type: CCA Transform: Family: Hard Problems: Sym. primi ves: Randomness: Specifica on: Website: Related Works:

KEM FO transform [HHK17, JZC+18] La ces Module-LWR (Learning With Rounding) SHA-3, SHAKE-128 Uniform [DKR+20] https://www.esat.kuleuven.be/cosic/pqcrypto/saber/ [DKRV18, JZC+18]

High-Level Design Just like Kyber, Saber is based on the LindnerPeikert framework. The main difference is that it uses Module-LWR instead of ModuleLWE: the "random noise" is replaced with "determinis c rounding", making the implementa on simpler but changing the underlying hardness assump on. The conversion into a IND-CCA scheme is done via the FO transform [HHK17, JZC+18]. An early version [DKRV18] of Saber relied on Noisy DiffieHellman key-exchange, but its design has switched to LPR-style [LPR10] encryp on since then.

A Simple Design Saber makes several design choices oriented at simplicity. Like Kyber, it only works with elements over Zq[x]/(x256 + 1). Moreover, the use of LWR simplifies its descrip on. Finally, the integer modulus q is taken to be a power of two. As a consequence of this choice of q, polynomial mul plica ons are done via the Toom-Cook and Karatsuba algorithms.
Implementations Saber has been implemented on several pla orms. The specifica on document reports implementa ons on ARM Cortex-M4, HW/SW codesigns and/or complete hardware implementa ons on Ar x-7 and Virtex Ultrascale+, a masked implementa on on ARM Cortex-M4 and even an implementa-
on on the RSA coprocessor ESP32 (inspired from a similar result [AHH+18] for Kyber).

NIST level 1 3 5

|SK| (bytes)
1568 2304 3040

|PK| (bytes)
672 992 1312

|ctxt| (bytes)
736 1088 1472

© PQShield Ltd | www.pqshield.com

KG (cycles)
43232 80340 126220

Enc (cycles)
62236 103204 153832

Dec (cycles)
62624 103092 155700
26 of 39

14 BIKE (alternate)

Type: CCA Transform: Family: Hard Problems: Sym. primi ves: Randomness: Specifica on: Website: Related Works:

KEM FO [HHK17] Error-correc ng codes (QC-MDPC codes) Quasi-Cyclic Syndrome Decoding and Codeword Finding problems AES, SHA Uniform, fixed weight, odd weight [ABB+20] https://bikesuite.org/ [MTSB12, BGG+17, HHK17]

Design and Variants BIKE is based on QC-MDPC codes ­ this acronym stands for Quasi-Cyclic Moderate Density Parity Check. The quasi-cyclicity allows drama c gains in compactness and speed. BIKE originally came in three variants, BIKE-{1,2,3}, presented in the above table extracted from the Round 1 presenta on of BIKE. In a simplifica on effort, only BIKE-2 was kept in the last itera on. Note that BIKE2 was the most compact of the three variants; it also used to have the slowest key genera on procedure, but this was recently mi gated in [DGK20a].

The Decoding Algorithm Decoding algorithms for code-based KEMs has been the topic of intensive research. Decryp on failures have been shown [GJS16] to lead to prac cal a acks, hence the decryp-
on failure rate (DFR) must be kept negligible. However, constant- me decoding algorithms with negligible DFR have been difficult to obtain. BIKE currently uses the Black-Gray-Flip decoder [DGK20b].
Hardware Implementation BIKE is one of the few Round 3 candidates to have proposed a hardware implementa on (on Ar x-7 FPGA), see: https://github.com/ Chair-for-Security-Engineering/BIKE.

NIST level 1 3 5

|SK| (bytes)
281 419 580

|PK| (bytes)
1541 3083 5122

|ctxt| (bytes)
1573 3115 5134

© PQShield Ltd | www.pqshield.com

KG (cycles)
600000 1780000
-

Enc (cycles)
220000 465000
-

Dec (cycles)
2220000 6610000
-
27 of 39

15 HQC (alternate)

Type: CCA Transform: Family: Hard Problems: Sym. primi ves: Randomness: Specifica on: Website: Related Works:

KEM Variant [HHK17] of FO Error-correc ng codes Quasi-Cyclic Syndrome Decoding AES, SHA Uniform, fixed weight [MAB+20] http://pqc-hqc.org [Ale03, Gab05, ABD+16a, DGZ17]

Design HQC stands for Hamming Quasi-Cyclic. Just like BIKE, HQC relies on quasi-cyclic codes. Its high-level design is presented above. Lat-
ce prac oners will recognize a design similar to la ce-based schemes such as Kyber, Saber, FrodoKEM and NTRU Prime (in its LPRime variant). While this analogy can be useful at a very high level, the mathema cal objets used are different (codes vs la ces) and therefore HQC relies on completely different problems and algorithms.

Hardware Implementation The specifica on document of HQC gives performance numbers for an implementa on on the Ar x-7 FPGA.

NIST level 1 3 5

|SK| (bytes)
40 40 40

|PK| (bytes)
2249 4522 7245

|ctxt| (bytes)
4481 9036 14469

© PQShield Ltd | www.pqshield.com

Attacks against the BCH Decoder Implementa on a acks were proposed against the BCH decoder used in earlier versions of HQC. In [WTBB+19], co-authors of HQC displayed a ming a ack exploi ng the BCH decoder running me, and proposed a constant- me variant as a countermeasure. [SRSWZ20] mounted a power side-channel against the BCH decoder. The last itera on of HQC has replaced the BCH decoder with a Reed-Muller Reed-Solomon decoder.

A Decryption Failure Attack A decryp on failure a ack against a Round 2 parameter set of HQC has been proposed in [GJ20]. This parameter set is not present in the last itera on of HQC.

KG (cycles)
136000 305000 545000

Enc (cycles)
220000 501000 918000

Dec (cycles)
384000 821000 1538000
28 of 39

16 FrodoKEM (alternate)

Type: CCA Transform: Family: Hard Problems: Sym. primi ves: Randomness: Specifica on: Website: Related Works:

KEM (and Encryp on) Variant of FOm [HHK17, JZC+18] La ces LWE SHAKE-128/256 (and op onally AES-128/256) Centered rounded Gaussians (using a CDT) [NAB+20] https://frodokem.org/ [LP11, BCD+16, ATT+18, BFM+18, HOKG18, BFM+19]

Standard Lattices FrodoKEM is an instan a on of the LindnerPeikert framework [LP11] (see Kyber). It is the only remaining scheme that works over unstructured la ces. These la ces entail working with matrices having entries in Z, whereas most other la ce-based candidates take entries in Zq[x]/(f) for some polynomial f. As a result, FrodoKEM has larger communica on costs, but relies on more conserva ve (or at least less structured) hardness assump ons.
FrodoCCS FrodoKEM is an evolu on of FrodoCCS [BCD+16]. FrodoCCS was based on Noisy Diffie-Hellman, but FrodoKEM switched in favor of public key encryp on. In addi on, they use different error distribu ons and symmetric primi ves.

Implementations Despite its somewhat large memory footprint, many works studied the implementa on of FrodoKEM on embedded devices. For example, [HOKG18] proposes designs for FPGA and microprocessors, with the goal to minimize area consump on on FPGAs (resp. peak stack usage on microprocessors). This is achieved mainly by using memory-laziness tricks. [BFM+18] informally argue that the genera on of a very large public matrix (A) doesn't require a cryptographically secure PRNG, and uses a PRNG known as xoshiro** for this step.
Side-Channel Attacks [ATT+18] studied horizontal a acks against FrodoCCS, and [BFM+19] studied singletrace a acks against FrodoKEM. A ming attack [GJN20] was recently displayed against the reference implementa on of Round 2 FrodoKEM, which performed comparison (during decapsula on) in variable me. This has been fixed in Round 3. The flaw was also present in LAC, BIKE, HQC, ROLLO , RQC .

NIST level 1 3 5

|SK| (bytes) 19888 31296 43088

|PK| (bytes)
9616 15632 21520

|ctxt| (bytes)
9720 15744 21632

© PQShield Ltd | www.pqshield.com

KG (cycles)
4022000 8579000 15191000

Enc (cycles)
4440000 9302000 16357000

Dec (cycles)
4325000 9143000 16148000
29 of 39

17 NTRU Prime (alternate)

Type: CCA Transform: Family: Hard Problems: Sym. primi ves: Randomness: Specifica on: Website: Related Works:

KEM Variant of Dent [Den03] with confirma on hash La ces NTRU, Ring-LWR SHA-512, AES-256-CTR Uniform in {-1, 1} or {-1, 0, 1}, some mes with bounded weight [BBC+20] https://ntruprime.cr.yp.to/ [Den03, BCLv17]

Design The high-level design of NTRU Prime was introduced in [BCLv17]. Just like NTRU, it tweaks the original NTRU encryp on scheme [HPS98] in order to make it easily implementable in constant me, and to eliminate decryp on failures [HNP+03], "evaluate-at-1" a acks and inver bility checks.
Reducing the Attack Surface A point emphasized by the specifica on of NTRU Prime is the choice of the base field, which is Zq[x]/(xp - x - 1), where p, q are two primes such that (xp - x - 1) is prime in Zq[x]. The explicit goal behind this choice is to hedge against future cryptanaly c a acks similar to those exploi ng the presence of subfields [ABD16b, BBdV+17] or computable homomorphisms [CGS14, CDPR16], while keeping the efficiency gains provided by a ring structure.

Polynomial Multiplication The rings Zq[x]/(xp - x - 1) chosen by NTRU Prime do not na vely support the number theore c transform (NTT). Un l recently, NTRU Prime used Karatsuba and ToomCook for mul plying polynomials, but recent progress [ACC+21] has made the NTT compe ve for NTRU Prime rings.
Two Variants The NTRU Prime submission proposes two variants: Streamlined NTRU Prime, and NTRU LPRime. At a high level, the first variant is close to NTRU, but low-level details differ significantly, see [SHRS17, Sec on 6.1] and [Sch18]. The second variant instan ates the Lindner-Peikert framework (see Kyber) using a variant of Ring-LWR over the NTRU Prime ring. The performance numbers we provide are for Streamlined NTRU Prime.
Embedded Implementations The specifica on and official website of NTRU Prime report op mized implementa ons on ARM Cortex-M4 and AVR ATmega1284 microcontrollers, and Xilinx Zynq Ultrascale+ FPGA.

NIST level 1 3 5

|SK| (bytes)
1518 1999 3059

|PK| (bytes)
994 1322 2067

|ctxt| (bytes)
897 1184 1847

© PQShield Ltd | www.pqshield.com

KG (cycles)
752904 1227380
-

Enc (cycles)
46620 60668
-

Dec (cycles)
59324 80904
-
30 of 39

18 SIKE (alternate)

Type: CCA Transform: Family: Hard Problems: Sym. primi ves: Randomness: Specifica on: Website: Related Works:

Key exchange and KEM Variant of [HHK17] Isogenies SIDH problem SHAKE-256 Uniform [JAC+20] https://sike.org/ [JD11, CJL+17, CLN16, JS19, CLN+20, MLRB20]

History and design SIKE is the only isogeny-based candidate scheme. At a high level, it implements the SIDH key-exchange [JD11]. Unlike the classical Diffie-Hellman, it is not fully interac-
ve. An a ack in [GPST16] can be adapted to break the CCA security of the basic SIDH design. Hence SIKE uses a conversion inspired from [HHK17] to ensure IND-CCA security. It is to be noted that while SIKE is the KEM with the lowest communica on cost, it is one of those with the higher computa onal costs.
Compressed Variant SIKE comes in two variants, a basic one, and a second one that uses point compression [CJL+17], which reduces the public key size by about 41%, but mul plies the overall running me by about a factor of two. Our performance figures are for the variant with point compression.
Implementations SIKE has a racted several implementa-
ons for embedded devices, including over ARM processors [SLLH18, sJA19], Xilinx

Ar x-7, Virtex-7, and Kintex UltraScale+ FPGAs [KAK18, KAK+19, MLRB20] or even for the RISC architecture [KPHS18]. Although SIKE is slower than other candidates, recent works consistently report running mes of a few dozens milliseconds over these pla orms.
Cryptanalysis The current best a ack against SIKE is via claw-finding. The best classical algorithm is due to van Oorschot and Wiener [vW99], and the best quantum one to Tani. Jaques and Schanck [JS19] recently showed that in reasonable computa on models, the classical a ack is be er than the quantum one. See also [CLN+20] for a state-of-the-art analysis.
Implementation Flaws Two flaws in the reference implementa on of SIKE has been recently unearthed [NIS19b]. The comparison step in the re-encryp on part of the decapsula on procedure was improperly computed, seemingly voiding out the CCA security claim. This has been subsequently corrected.

NIST level 1 3 5

|SK| (bytes)
350 491 602

|PK| (bytes)
197 274 335

|ctxt| (bytes)
236 336 410

© PQShield Ltd | www.pqshield.com

KG (cycles)
10158000 26360000 40935000

Enc (cycles)
15120000 37470000 63254000

Dec (cycles)
11077000 29216000 46606000
31 of 39

References

[ABB+20]

Nicolas Aragon, Paulo Barreto, Slim Be aieb, Loic Bidoux, Olivier Blazy, Jean-Christophe Deneuville, Phillipe Gaborit, Shay Gueron, Tim Guneysu, Carlos Aguilar Melchor, Rafael Misoczki, Edoardo Persiche , Nicolas Sendrier, Jean-Pierre Tillich, Gilles Zemor, Valen n Vasseur, and Santosh Ghosh. BIKE. Technical report, 2020. available at [NIS20a].

[ABC+20]

Mar n R. Albrecht, Daniel J. Bernstein, Tung Chou, Carlos Cid, Jan Gilcher, Tanja Lange, Varun Maram, Ingo von Maurich, Rafael Misoczki, Ruben Niederhagen, Kenneth G. Paterson, Edoardo Persiche , Chris ane Peters, Peter Schwabe, Nicolas Sendrier, Jakub Szefer, Cen Jung Tjhai, Mar n Tomlinson, and Wen Wang. Classic McEliece. Technical report, 2020. available at [NIS20a].

[ABD+16a]

Carlos Aguilar, Olivier Blazy, Jean-Christophe Deneuville, Philippe Gaborit, and Gilles Zémor. Efficient Encryp on from
Random Quasi-Cyclic Codes. Cryptology ePrint Archive, Report 2016/1194, 2016. http://eprint.iacr.org/ 2016/1194.

[ABD16b]

Mar n R. Albrecht, Shi Bai, and Léo Ducas. A Subfield La ce A ack on Overstretched NTRU Assump ons - Cryptanalysis of Some FHE and Graded Encoding Schemes. In Ma hew Robshaw and Jonathan Katz, editors, CRYPTO 2016, Part I, volume 9814 of LNCS, pages 153­178. Springer, Heidelberg, August 2016.

[ACC+21]

Erdem Alkim, Dean Yun-Li Cheng, Chi-Ming Marvin Chung, Hülya Evkan, Leo Wei-Lun Huang, Vincent Hwang, Ching-
Lin Trista Li, Ruben Niederhagen, Cheng-Jhih Shih, Julian Wälde, and Bo-Yin Yang. Polynomial Mul plica on in NTRU Prime. IACR TCHES, 2021(1):217­238, 2021. https://tches.iacr.org/index.php/TCHES/article/view/ 8733.

[ADPS16a] Erdem Alkim, Léo Ducas, Thomas Pöppelmann, and Peter Schwabe. NewHope without reconcilia on. Cryptology ePrint Archive, Report 2016/1157, 2016. http://eprint.iacr.org/2016/1157.

[ADPS16b] Erdem Alkim, Léo Ducas, Thomas Pöppelmann, and Peter Schwabe. Post-quantum Key Exchange - A New Hope. In Thorsten Holz and Stefan Savage, editors, USENIX Security 2016, pages 327­343. USENIX Associa on, August 2016.

[AE17]

Jean-Phillippe Aumasson and Guillaume Endignoux. Gravity-SPHINCS. Technical report, Na onal Ins tute of Stan-
dards and Technology, 2017. available at https://csrc.nist.gov/projects/post-quantum-cryptography/ round-1-submissions.

[AE18]

Jean-Philippe Aumasson and Guillaume Endignoux. Improving Stateless Hash-Based Signatures. In Nigel P. Smart, editor, CT-RSA 2018, volume 10808 of LNCS, pages 219­242. Springer, Heidelberg, April 2018.

[AHH+18]

Mar n R. Albrecht, Chris an Hanser, Andrea Hoeller, Thomas Pöppelmann, Fernando Virdia, and Andreas Wallner.
Implemen ng RLWE-based Schemes Using an RSA Co-Processor. IACR TCHES, 2019(1):169­208, 2018. https: //tches.iacr.org/index.php/TCHES/article/view/7338.

[Ale03]

Michael Alekhnovich. More on Average Case vs Approxima on Complexity. In 44th FOCS, pages 298­307. IEEE Computer Society Press, October 2003.

[ARS+15]

Mar n R. Albrecht, Chris an Rechberger, Thomas Schneider, Tyge Tiessen, and Michael Zohner. Ciphers for MPC and FHE. In Elisabeth Oswald and Marc Fischlin, editors, EUROCRYPT 2015, Part I, volume 9056 of LNCS, pages 430­454. Springer, Heidelberg, April 2015.

[ATT+18]

Aydin Aysu, Youssef Tobah, Mohit Tiwari, Andreas Gerstlauer, and Michael Orshansky. Horizontal side-channel vulnerabili es of post-quantum key exchange protocols. In 2018 IEEE Interna onal Symposium on Hardware Oriented Security and Trust, HOST 2018, Washington, DC, USA, April 30 - May 4, 2018, pages 81­88. IEEE Computer Society, 2018.

[BBC+20]

Daniel J. Bernstein, Billy Bob Brumley, Ming-Shing Chen, Chitchanok Chuengsa ansup, Tanja Lange, Adrian Marotzke, Bo-Yuan Peng, Nicola Tuveri, Chris ne van Vredendaal, and Bo-Yin Yang. NTRU Prime. Technical report, 2020. available at [NIS20a].

[BBdV+17]

Jens Bauch, Daniel J. Bernstein, Henry de Valence, Tanja Lange, and Chris ne van Vredendaal. Short Generators Without Quantum Computers: The Case of Mul quadra cs. In Jean-Sébas en Coron and Jesper Buus Nielsen, editors, EUROCRYPT 2017, Part I, volume 10210 of LNCS, pages 27­59. Springer, Heidelberg, April / May 2017.

[BCD+16]

Joppe W. Bos, Craig Costello, Léo Ducas, Ilya Mironov, Michael Naehrig, Valeria Nikolaenko, Ananth Raghunathan, and Douglas Stebila. Frodo: Take off the Ring! Prac cal, Quantum-Secure Key Exchange from LWE. In Edgar R. Weippl, Stefan Katzenbeisser, Christopher Kruegel, Andrew C. Myers, and Shai Halevi, editors, ACM CCS 2016, pages 1006­ 1018. ACM Press, October 2016.

[BCLv17]

Daniel J. Bernstein, Chitchanok Chuengsa ansup, Tanja Lange, and Chris ne van Vredendaal. NTRU Prime: Reducing A ack Surface at Low Cost. In Carlisle Adams and Jan Camenisch, editors, SAC 2017, volume 10719 of LNCS, pages 235­260. Springer, Heidelberg, August 2017.

© PQShield Ltd | www.pqshield.com

32 of 39

[BDE+18]

Jonathan Bootle, Claire Delaplace, Thomas Espitau, Pierre-Alain Fouque, and Mehdi Tibouchi. LWE Without Modular Reduc on and Improved Side-Channel A acks Against BLISS. In Thomas Peyrin and Steven Galbraith, editors, ASIACRYPT 2018, Part I, volume 11272 of LNCS, pages 494­524. Springer, Heidelberg, December 2018.

[BDH11]

Johannes A. Buchmann, Erik Dahmen, and Andreas Hülsing. XMSS - A Prac cal Forward Secure Signature Scheme Based on Minimal Security Assump ons. In Bo-Yin Yang, editor, Post-Quantum Cryptography - 4th Interna onal Workshop, PQCrypto 2011, pages 117­129. Springer, Heidelberg, November / December 2011.

[BDK+18]

Joppe W. Bos, Léo Ducas, Eike Kiltz, Tancrède Lepoint, Vadim Lyubashevsky, John M. Schanck, Peter Schwabe, Gregor Seiler, and Damien Stehlé. CRYSTALS - Kyber: A CCA-Secure Module-La ce-Based KEM. In 2018 IEEE European Symposium on Security and Privacy, EuroS&P 2018, London, United Kingdom, April 24-26, 2018, pages 353­367. IEEE, 2018.

[Beu20]

Ward Beullens. Improved Cryptanalysis of UOV and Rainbow. Cryptology ePrint Archive, Report 2020/1343, 2020. https://eprint.iacr.org/2020/1343.

[BFM+18] Joppe W. Bos, Simon Friedberger, Marco Mar noli, Elisabeth Oswald, and Mar jn Stam. Fly, you fool! Faster Frodo for the ARM Cortex-M4. Cryptology ePrint Archive, Report 2018/1116, 2018. https://eprint.iacr.org/2018/1116.

[BFM+19]

Joppe W. Bos, Simon Friedberger, Marco Mar noli, Elisabeth Oswald, and Mar jn Stam. Assessing the Feasibility of Single Trace Power Analysis of Frodo. In Carlos Cid and Michael J. Jacobson Jr:, editors, SAC 2018, volume 11349 of LNCS, pages 216­234. Springer, Heidelberg, August 2019.

[BG14]

Shi Bai and Steven D. Galbraith. An Improved Compression Technique for Signatures Based on Learning with Errors. In Josh Benaloh, editor, CT-RSA 2014, volume 8366 of LNCS, pages 28­47. Springer, Heidelberg, February 2014.

[BGG+17]

Paulo S. L. M. Barreto, Shay Gueron, Tim Güneysu, Rafael Misoczki, Edoardo Persiche , Nicolas Sendrier, and JeanPierre Tillich. CAKE: Code-Based Algorithm for Key Encapsula on. In Máire O'Neill, editor, 16th IMA Interna onal Conference on Cryptography and Coding, volume 10655 of LNCS, pages 207­226. Springer, Heidelberg, December 2017.

[BH19]

Daniel J. Bernstein and Andreas Hülsing. Decisional Second-Preimage Resistance: When Does SPR Imply PRE? In Steven D. Galbraith and Shiho Moriai, editors, ASIACRYPT 2019, Part III, volume 11923 of LNCS, pages 33­62. Springer, Heidelberg, December 2019.

[BHH+15]

Daniel J. Bernstein, Daira Hopwood, Andreas Hülsing, Tanja Lange, Ruben Niederhagen, Louiza Papachristodoulou, Michael Schneider, Peter Schwabe, and Zooko Wilcox-O'Hearn. SPHINCS: Prac cal Stateless Hash-Based Signatures. In Elisabeth Oswald and Marc Fischlin, editors, EUROCRYPT 2015, Part I, volume 9056 of LNCS, pages 368­397. Springer, Heidelberg, April 2015.

[BHK+19]

Daniel J. Bernstein, Andreas Hülsing, Stefan Kölbl, Ruben Niederhagen, Joost Rijneveld, and Peter Schwabe. The SPHINCS+ Signature Framework. In Lorenzo Cavallaro, Johannes Kinder, XiaoFeng Wang, and Jonathan Katz, editors, ACM CCS 2019, pages 2129­2146. ACM Press, November 2019.

[BHLY16]

Leon Groot Bruinderink, Andreas Hülsing, Tanja Lange, and Yuval Yarom. Flush, Gauss, and Reload - A Cache A ack on the BLISS La ce-Based Signature Scheme. In Benedikt Gierlichs and Axel Y. Poschmann, editors, CHES 2016, volume 9813 of LNCS, pages 323­345. Springer, Heidelberg, August 2016.

[BL20]

Daniel J. Bernstein and Tanja Lange. McTiny: Fast High-Confidence Post-Quantum Key Erasure for Tiny Network Servers. In Srdjan Capkun and Franziska Roesner, editors, USENIX Security 2020, pages 1731­1748. USENIX Associa on, August 2020.

[BP18a]

Daniel J. Bernstein and Edoardo Persiche . Towards KEM Unifica on. Cryptology ePrint Archive, Report 2018/526, 2018. https://eprint.iacr.org/2018/526.

[BP18b]

Leon Groot Bruinderink and Peter Pessl. Differen al Fault A acks on Determinis c La ce Signatures. IACR TCHES, 2018(3):21­43, 2018. https://tches.iacr.org/index.php/TCHES/article/view/7267.

[CDG+17]

Melissa Chase, David Derler, Steven Goldfeder, Claudio Orlandi, Sebas an Ramacher, Chris an Rechberger, Daniel Slamanig, and Greg Zaverucha. Post-Quantum Zero-Knowledge and Signatures from Symmetric-Key Primi ves. In Bhavani M. Thuraisingham, David Evans, Tal Malkin, and Dongyan Xu, editors, ACM CCS 2017, pages 1825­1842. ACM Press, October / November 2017.

[CDH+20]

Cong Chen, Oussama Danba, Jeffrey Hoffstein, Andreas Hulsing, Joost Rijneveld, John M. Schanck, Peter Schwabe, William Whyte, Zhenfei Zhang, Tsunekazu Saito, Takashi Yamakawa, and Keita Xagawa. NTRUEncrypt. Technical report, 2020. available at [NIS20a].

[CDPR16]

Ronald Cramer, Léo Ducas, Chris Peikert, and Oded Regev. Recovering Short Generators of Principal Ideals in Cyclotomic Rings. In Marc Fischlin and Jean-Sébas en Coron, editors, EUROCRYPT 2016, Part II, volume 9666 of LNCS, pages 559­ 585. Springer, Heidelberg, May 2016.

[CFM+20] A. Casanova, J.-C. Faugère, G. Macario-Rat, J. Patarin, L. Perret, and J. Ryckeghem. GeMSS. Technical report, 2020. available at [NIS20a].

© PQShield Ltd | www.pqshield.com

33 of 39

[CGS14]

Peter Campbell, Michael Groves, and Dan Shepherd. Soliloquy: A Cau onary Tale, 2014. https://docbox.etsi. org/workshop/2014/201410_CRYPTO/S07_Systems_and_Attacks/S07_Groves_Annex.pdf.

[CJL+17]

Craig Costello, David Jao, Patrick Longa, Michael Naehrig, Joost Renes, and David Urbanik. Efficient Compression of SIDH Public Keys. In Jean-Sébas en Coron and Jesper Buus Nielsen, editors, EUROCRYPT 2017, Part I, volume 10210 of LNCS, pages 679­706. Springer, Heidelberg, April / May 2017.

[CLN16]

Craig Costello, Patrick Longa, and Michael Naehrig. Efficient Algorithms for Supersingular Isogeny Diffie-Hellman. In Ma hew Robshaw and Jonathan Katz, editors, CRYPTO 2016, Part I, volume 9814 of LNCS, pages 572­601. Springer, Heidelberg, August 2016.

[CLN+20]

Craig Costello, Patrick Longa, Michael Naehrig, Joost Renes, and Fernando Virdia. Improved Classical Cryptanalysis of SIKE in Prac ce. In Aggelos Kiayias, Markulf Kohlweiss, Petros Wallden, and Vassilis Zikas, editors, PKC 2020, Part II, volume 12111 of LNCS, pages 505­534. Springer, Heidelberg, May 2020.

[CMP18]

Laurent Castelnovi, Ange Mar nelli, and Thomas Prest. Gra ing Trees: A Fault A ack Against the SPHINCS Framework. In Tanja Lange and Rainer Steinwandt, editors, Post-Quantum Cryptography - 9th Interna onal Conference, PQCrypto 2018, pages 165­184. Springer, Heidelberg, 2018.

[DCP+20] Jintai Ding, Ming-Shing Chen, Albrecht Petzoldt, Dieter Schmidt, Bo-Yin Yang, Ma hias Kannwischer, and Jacques Patarin. Rainbow. Technical report, 2020. available at [NIS20a].

[DDLL13]

Léo Ducas, Alain Durmus, Tancrède Lepoint, and Vadim Lyubashevsky. La ce Signatures and Bimodal Gaussians. In Ran Cane and Juan A. Garay, editors, CRYPTO 2013, Part I, volume 8042 of LNCS, pages 40­56. Springer, Heidelberg, August 2013.

[Den03]

Alexander W. Dent. A Designer's Guide to KEMs. In Kenneth G. Paterson, editor, 9th IMA Interna onal Conference on Cryptography and Coding, volume 2898 of LNCS, pages 133­151. Springer, Heidelberg, December 2003.

[DFMS19]

Jelle Don, Serge Fehr, Chris an Majenz, and Chris an Schaffner. Security of the Fiat-Shamir Transforma on in the Quantum Random-Oracle Model. Cryptology ePrint Archive, Report 2019/190, 2019. https://eprint.iacr.org/2019/ 190.

[DGK20a] Nir Drucker, Shay Gueron, and Dusan Kos c. Fast polynomial inversion for post quantum QC-MDPC cryptography. Cryptology ePrint Archive, Report 2020/298, 2020. https://eprint.iacr.org/2020/298.

[DGK20b]

Nir Drucker, Shay Gueron, and Dusan Kos c. QC-MDPC Decoders with Several Shades of Gray. In Jintai Ding and JeanPierre Tillich, editors, Post-Quantum Cryptography - 11th Interna onal Conference, PQCrypto 2020, pages 35­50. Springer, Heidelberg, 2020.

[DGZ17]

Jean-Christophe Deneuville, Philippe Gaborit, and Gilles Zémor. Ouroboros: A Simple, Secure and Efficient Key Exchange Protocol Based on Coding Theory. In Tanja Lange and Tsuyoshi Takagi, editors, Post-Quantum Cryptography - 8th Interna onal Workshop, PQCrypto 2017, pages 18­34. Springer, Heidelberg, 2017.

[DKL+18]

Léo Ducas, Eike Kiltz, Tancrède Lepoint, Vadim Lyubashevsky, Peter Schwabe, Gregor Seiler, and Damien Stehlé.
CRYSTALS-Dilithium: A La ce-Based Digital Signature Scheme. IACR TCHES, 2018(1):238­268, 2018. https: //tches.iacr.org/index.php/TCHES/article/view/839.

[DKP+19]

Itai Dinur, Daniel Kales, Angela Promitzer, Sebas an Ramacher, and Chris an Rechberger. Linear Equivalence of Block Ciphers with Par al Non-Linear Layers: Applica on to LowMC. In Yuval Ishai and Vincent Rijmen, editors, EUROCRYPT 2019, Part I, volume 11476 of LNCS, pages 343­372. Springer, Heidelberg, May 2019.

[DKR+20] Jan-Pieter D'Anvers, Angshuman Karmakar, Sujoy Sinha Roy, Frederik Vercauteren, Jose Maria Bermudo Mera, Michiel Van Beirendonck, and Andrea Basso. SABER. Technical report, 2020. available at [NIS20a].

[DKRV18]

Jan-Pieter D'Anvers, Angshuman Karmakar, Sujoy Sinha Roy, and Frederik Vercauteren. Saber: Module-LWR Based Key Exchange, CPA-Secure Encryp on and CCA-Secure KEM. In Antoine Joux, Abderrahmane Nitaj, and Tajjeeddine Rachidi, editors, AFRICACRYPT 18, volume 10831 of LNCS, pages 282­305. Springer, Heidelberg, May 2018.

[DLP14]

Léo Ducas, Vadim Lyubashevsky, and Thomas Prest. Efficient Iden ty-Based Encryp on over NTRU La ces. In Palash Sarkar and Tetsu Iwata, editors, ASIACRYPT 2014, Part II, volume 8874 of LNCS, pages 22­41. Springer, Heidelberg, December 2014.

[DN19]

Itai Dinur and Niv Nadler. Mul -target A acks on the Picnic Signature Scheme and Related Protocols. In Yuval Ishai and Vincent Rijmen, editors, EUROCRYPT 2019, Part III, volume 11478 of LNCS, pages 699­727. Springer, Heidelberg, May 2019.

[DP16]

Léo Ducas and Thomas Prest. Fast Fourier Orthogonaliza on. In Sergei A. Abramov, Eugene V. Zima, and Xiao-Shan Gao, editors, Proceedings of the ACM on Interna onal Symposium on Symbolic and Algebraic Computa on, ISSAC 2016, Waterloo, ON, Canada, July 19-22, 2016, pages 191­198. ACM, 2016.

© PQShield Ltd | www.pqshield.com

34 of 39

[DS05]

Jintai Ding and Dieter Schmidt. Rainbow, a New Mul variable Polynomial Signature Scheme. In John Ioannidis, Angelos Keromy s, and Mo Yung, editors, ACNS 05, volume 3531 of LNCS, pages 164­175. Springer, Heidelberg, June 2005.

[DY13]

Jintai Ding and Bo-Yin Yang. Degree of Regularity for HFEv and HFEv-. In Philippe Gaborit, editor, Post-Quantum Cryptography - 5th Interna onal Workshop, PQCrypto 2013, pages 52­66. Springer, Heidelberg, June 2013.

[EFGT17]

Thomas Espitau, Pierre-Alain Fouque, Benoît Gérard, and Mehdi Tibouchi. Side-Channel A acks on BLISS La ce-Based Signatures: Exploi ng Branch Tracing against strongSwan and Electromagne c Emana ons in Microcontrollers. In Bhavani M. Thuraisingham, David Evans, Tal Malkin, and Dongyan Xu, editors, ACM CCS 2017, pages 1857­1874. ACM Press, October / November 2017.

[FO99]

Eiichiro Fujisaki and Tatsuaki Okamoto. Secure Integra on of Asymmetric and Symmetric Encryp on Schemes. In Michael J. Wiener, editor, CRYPTO'99, volume 1666 of LNCS, pages 537­554. Springer, Heidelberg, August 1999.

[Gab05]

Philippe Gaborit. Shorter keys for code-based cryptography. 01 2005.

[GJ20]

Qian Guo and Thomas Johansson. A New Decryp on Failure A ack Against HQC. In Shiho Moriai and Huaxiong Wang, editors, ASIACRYPT 2020, Part I, volume 12491 of LNCS, pages 353­382. Springer, Heidelberg, December 2020.

[GJN20]

Qian Guo, Thomas Johansson, and Alexander Nilsson. A Key-Recovery Timing A ack on Post-quantum Primi ves Using the Fujisaki-Okamoto Transforma on and Its Applica on on FrodoKEM. In Daniele Micciancio and Thomas Ristenpart, editors, CRYPTO 2020, Part II, volume 12171 of LNCS, pages 359­386. Springer, Heidelberg, August 2020.

[GJS16]

Qian Guo, Thomas Johansson, and Paul Stankovski. A Key Recovery A ack on MDPC with CCA Security Using Decoding Errors. In Jung Hee Cheon and Tsuyoshi Takagi, editors, ASIACRYPT 2016, Part I, volume 10031 of LNCS, pages 789­815. Springer, Heidelberg, December 2016.

[GKPM18] Aymeric Genêt, Ma hias J. Kannwischer, Hervé Pelle er, and Andrew McLauchlan. Prac cal Fault Injec on A acks on SPHINCS. Cryptology ePrint Archive, Report 2018/674, 2018. https://eprint.iacr.org/2018/674.

[GLP12]

Tim Güneysu, Vadim Lyubashevsky, and Thomas Pöppelmann. Prac cal La ce-Based Cryptography: A Signature Scheme for Embedded Systems. In Emmanuel Prouff and Patrick Schaumont, editors, CHES 2012, volume 7428 of LNCS, pages 530­547. Springer, Heidelberg, September 2012.

[GPST16]

Steven D. Galbraith, Christophe Pe t, Barak Shani, and Yan Bo Ti. On the Security of Supersingular Isogeny Cryptosystems. In Jung Hee Cheon and Tsuyoshi Takagi, editors, ASIACRYPT 2016, Part I, volume 10031 of LNCS, pages 63­91. Springer, Heidelberg, December 2016.

[GPV08]

Craig Gentry, Chris Peikert, and Vinod Vaikuntanathan. Trapdoors for hard la ces and new cryptographic construc ons. In Richard E. Ladner and Cynthia Dwork, editors, 40th ACM STOC, pages 197­206. ACM Press, May 2008.

[HBD+20]

Andreas Hulsing, Daniel J. Bernstein, Christoph Dobraunig, Maria Eichlseder, Sco Fluhrer, Stefan-Lukas Gazdag, Panos Kampanakis, Stefan Kolbl, Tanja Lange, Mar n M Lauridsen, Florian Mendel, Ruben Niederhagen, Chris an Rechberger, Joost Rijneveld, Peter Schwabe, Jean-Philippe Aumasson, Bas Westerbaan, and Ward Beullens. SPHINCS+. Technical report, 2020. available at [NIS20a].

[HHHW09]

Philip S. Hirschhorn, Jeffrey Hoffstein, Nick Howgrave-Graham, and William Whyte. Choosing NTRUEncrypt Parameters in Light of Combined La ce Reduc on and MITM Approaches. In Michel Abdalla, David Pointcheval, Pierre-Alain Fouque, and Damien Vergnaud, editors, ACNS 09, volume 5536 of LNCS, pages 437­455. Springer, Heidelberg, June 2009.

[HHK17]

Dennis Ho einz, Kathrin Hövelmanns, and Eike Kiltz. A Modular Analysis of the Fujisaki-Okamoto Transforma on. In Yael Kalai and Leonid Reyzin, editors, TCC 2017, Part I, volume 10677 of LNCS, pages 341­371. Springer, Heidelberg, November 2017.

[HHP+03]

Jeffrey Hoffstein, Nick Howgrave-Graham, Jill Pipher, Joseph H. Silverman, and William Whyte. NTRUSIGN: Digital Signatures Using the NTRU La ce. In Marc Joye, editor, CT-RSA 2003, volume 2612 of LNCS, pages 122­140. Springer, Heidelberg, April 2003.

[HNP+03]

Nick Howgrave-Graham, Phong Q. Nguyen, David Pointcheval, John Proos, Joseph H. Silverman, Ari Singer, and William Whyte. The Impact of Decryp on Failures on the Security of NTRU Encryp on. In Dan Boneh, editor, CRYPTO 2003, volume 2729 of LNCS, pages 226­246. Springer, Heidelberg, August 2003.

[HNS+20] Andreas Hülsing, Kai-Chun Ning, Peter Schwabe, Florian Weber, and Philip R. Zimmermann. Post-quantum WireGuard. Cryptology ePrint Archive, Report 2020/379, 2020. https://eprint.iacr.org/2020/379.

[HOKG18]

James Howe, Tobias Oder, Markus Krausz, and Tim Güneysu. Standard La ce-Based Key Encapsula on on Embedded Devices. IACR TCHES, 2018(3):372­393, 2018. https://tches.iacr.org/index.php/TCHES/article/view/ 7279.

[Hop19]

Andrew Hopkins. Post-quantum TLS now supported in AWS KMS. AWS Security Blog, 2019. https://aws.amazon. com/fr/blogs/security/post-quantum-tls-now-supported-in-aws-kms/.

© PQShield Ltd | www.pqshield.com

35 of 39

[HPS98]

Jeffrey Hoffstein, Jill Pipher, and Joseph H. Silverman. NTRU: A Ring-Based Public Key Cryptosystem. In ANTS, volume 1423 of Lecture Notes in Computer Science, pages 267­288. Springer, 1998.

[HPS+17]

Jeffrey Hoffstein, Jill Pipher, John M. Schanck, Joseph H. Silverman, William Whyte, and Zhenfei Zhang. Choosing Parameters for NTRUEncrypt. In Helena Handschuh, editor, CT-RSA 2017, volume 10159 of LNCS, pages 3­18. Springer, Heidelberg, February 2017.

[HRS16]

Andreas Hülsing, Joost Rijneveld, and Fang Song. Mi ga ng Mul -target A acks in Hash-Based Signatures. In ChenMou Cheng, Kai-Min Chung, Giuseppe Persiano, and Bo-Yin Yang, editors, PKC 2016, Part I, volume 9614 of LNCS, pages 387­416. Springer, Heidelberg, March 2016.

[HRSS17]

Andreas Hülsing, Joost Rijneveld, John M. Schanck, and Peter Schwabe. High-Speed Key Encapsula on from NTRU. In Wieland Fischer and Naofumi Homma, editors, CHES 2017, volume 10529 of LNCS, pages 232­252. Springer, Heidelberg, September 2017.

[HSSW03] Nick Howgrave-Graham, Joseph H. Silverman, Ari Singer, and William Whyte. NAEP: Provable Security in the Presence of Decryp on Failures. Cryptology ePrint Archive, Report 2003/172, 2003. http://eprint.iacr.org/2003/172.

[Hül13]

Andreas Hülsing. W-OTS+ - Shorter Signatures for Hash-Based Signature Schemes. In Amr Youssef, Abderrahmane Nitaj, and Aboul Ella Hassanien, editors, AFRICACRYPT 13, volume 7918 of LNCS, pages 173­188. Springer, Heidelberg, June 2013.

[JAC+20]

David Jao, Reza Azarderakhsh, Ma hew Campagna, Craig Costello, Luca De Feo, Basil Hess, Amir Jalali, Brian Koziel, Brian LaMacchia, Patrick Longa, Michael Naehrig, Joost Renes, Vladimir Soukharev, David Urbanik, Geovandro Pereira, Koray Karabina, and Aaron Hutchinson. SIKE. Technical report, 2020. available at [NIS20a].

[JD11]

David Jao and Luca De Feo. Towards Quantum-Resistant Cryptosystems from Supersingular Ellip c Curve Isogenies. In Bo-Yin Yang, editor, Post-Quantum Cryptography - 4th Interna onal Workshop, PQCrypto 2011, pages 19­34. Springer, Heidelberg, November / December 2011.

[JNRV20]

Samuel Jaques, Michael Naehrig, Mar n Roe eler, and Fernando Virdia. Implemen ng Grover Oracles for Quantum Key Search on AES and LowMC. In Anne Canteaut and Yuval Ishai, editors, EUROCRYPT 2020, Part II, volume 12106 of LNCS, pages 280­310. Springer, Heidelberg, May 2020.

[JS19]

Samuel Jaques and John M. Schanck. Quantum Cryptanalysis in the RAM Model: Claw-Finding A acks on SIKE. In Alexandra Boldyreva and Daniele Micciancio, editors, CRYPTO 2019, Part I, volume 11692 of LNCS, pages 32­61. Springer, Heidelberg, August 2019.

[JZC+18]

Haodong Jiang, Zhenfeng Zhang, Long Chen, Hong Wang, and Zhi Ma. IND-CCA-Secure Key Encapsula on Mechanism in the Quantum Random Oracle Model, Revisited. In Hovav Shacham and Alexandra Boldyreva, editors, CRYPTO 2018, Part III, volume 10993 of LNCS, pages 96­125. Springer, Heidelberg, August 2018.

[KAK18]

B. Koziel, R. Azarderakhsh, and M. M. Kermani. A High-Performance and Scalable Hardware Architecture for IsogenyBased Cryptography. IEEE Transac ons on Computers, 67(11):1594­1609, Nov 2018.

[KAK+19]

Brian Koziel, A-Bon Ackie, Rami El Kha b, Reza Azarderakhsh, and Mehran Mozaffari-Kermani. SIKE'd Up: Fast and Se-
cure Hardware Architectures for Supersingular Isogeny Key Encapsula on. Cryptology ePrint Archive, Report 2019/711, 2019. https://eprint.iacr.org/2019/711.

[KGB+18]

Ma hias J. Kannwischer, Aymeric Genêt, Denis Bu n, Juliane Krämer, and Johannes Buchmann. Differen al Power Analysis of XMSS and SPHINCS. In Junfeng Fan and Benedikt Gierlichs, editors, COSADE 2018, volume 10815 of LNCS, pages 168­188. Springer, Heidelberg, April 2018.

[KKW18]

Jonathan Katz, Vladimir Kolesnikov, and Xiao Wang. Improved Non-Interac ve Zero Knowledge with Applica ons to Post-Quantum Signatures. In David Lie, Mohammad Mannan, Michael Backes, and XiaoFeng Wang, editors, ACM CCS 2018, pages 525­537. ACM Press, October 2018.

[KLS18]

Eike Kiltz, Vadim Lyubashevsky, and Chris an Schaffner. A Concrete Treatment of Fiat-Shamir Signatures in the Quantum Random-Oracle Model. In Jesper Buus Nielsen and Vincent Rijmen, editors, EUROCRYPT 2018, Part III, volume 10822 of LNCS, pages 552­586. Springer, Heidelberg, April / May 2018.

[KPG99]

Aviad Kipnis, Jacques Patarin, and Louis Goubin. Unbalanced Oil and Vinegar Signature Schemes. In Jacques Stern, editor, EUROCRYPT'99, volume 1592 of LNCS, pages 206­222. Springer, Heidelberg, May 1999.

[KPHS18] [KV19]

Philipp Koppermann, Eduard Pop, Johann Heyszl, and Georg Sigl. 18 Seconds to Key Exchange: Limita ons of Supersingular Isogeny Diffie-Hellman on Embedded Devices. Cryptology ePrint Archive, Report 2018/932, 2018. https://eprint.iacr.org/2018/932.
Kris Kwiatkowski and Luke Valenta. TThe TLS Post-Quantum Experiment. Cloudflare Blog, 2019. https://blog. cloudflare.com/the-tls-post-quantum-experiment/.

© PQShield Ltd | www.pqshield.com

36 of 39

[Kwi19]

Kris Kwiatkowski. Towards Post-Quantum Cryptography in TLS. Cloudflare Blog, 2019. https://blog.cloudflare. com/towards-post-quantum-cryptography-in-tls/.

[KZ20] [Lan18]

Daniel Kales and Greg Zaverucha. Improving the Performance of the Picnic Signature Scheme. IACR TCHES, 2020(4):154­188, 2020. https://tches.iacr.org/index.php/TCHES/article/view/8680.
Adam Langley. CECPQ2. Imperial Violet, 2018. https://www.imperialviolet.org/2018/12/12/cecpq2.html.

[LDK+20] Vadim Lyubashevsky, Léo Ducas, Eike Kiltz, Tancrède Lepoint, Peter Schwabe, Gregor Seiler, Damien Stehlé, and Shi Bai. CRYSTALS-DILITHIUM. Technical report, 2020. available at [NIS20a].

[LIM20]

Fukang Liu, Takanori Isobe, and Willi Meier. Cryptanalysis of Full LowMC and LowMC-M with Algebraic Techniques. Cryptology ePrint Archive, Report 2020/1034, 2020. https://eprint.iacr.org/2020/1034.

[LNPS20]

Norman Lahr, Ruben Niederhagen, Richard Petri, and Simona Samardjiska. Side Channel Informa on Set Decoding Using Itera ve Chunking - Plaintext Recovery from the "Classic McEliece" Hardware Reference Implementa on. In Shiho Moriai and Huaxiong Wang, editors, ASIACRYPT 2020, Part I, volume 12491 of LNCS, pages 881­910. Springer, Heidelberg, December 2020.

[LP11]

Richard Lindner and Chris Peikert. Be er Key Sizes (and A acks) for LWE-Based Encryp on. In Aggelos Kiayias, editor, CT-RSA 2011, volume 6558 of LNCS, pages 319­339. Springer, Heidelberg, February 2011.

[LP19]

Gaëtan Leurent and Thomas Peyrin. From Collisions to Chosen-Prefix Collisions Applica on to Full SHA-1. In Yuval Ishai and Vincent Rijmen, editors, EUROCRYPT 2019, Part III, volume 11478 of LNCS, pages 527­555. Springer, Heidelberg, May 2019.

[LP20]

Gaëtan Leurent and Thomas Peyrin. SHA-1 is a Shambles: First Chosen-Prefix Collision on SHA-1 and Applica on to the PGP Web of Trust. In Srdjan Capkun and Franziska Roesner, editors, USENIX Security 2020, pages 1839­1856. USENIX Associa on, August 2020.

[LPR10]

Vadim Lyubashevsky, Chris Peikert, and Oded Regev. On Ideal La ces and Learning with Errors over Rings. In Henri Gilbert, editor, EUROCRYPT 2010, volume 6110 of LNCS, pages 1­23. Springer, Heidelberg, May / June 2010.

[LS15]

Adeline Langlois and Damien Stehlé. Worst-case to average-case reduc ons for module la ces. Des. Codes Cryptography, 75(3):565­599, 2015.

[Lyu09]

Vadim Lyubashevsky. Fiat-Shamir with Aborts: Applica ons to La ce and Factoring-Based Signatures. In Mitsuru Matsui, editor, ASIACRYPT 2009, volume 5912 of LNCS, pages 598­616. Springer, Heidelberg, December 2009.

[Lyu12]

Vadim Lyubashevsky. La ce Signatures without Trapdoors. In David Pointcheval and Thomas Johansson, editors, EUROCRYPT 2012, volume 7237 of LNCS, pages 738­755. Springer, Heidelberg, April 2012.

[LZ19]

Qipeng Liu and Mark Zhandry. Revisi ng Post-Quantum Fiat-Shamir. Cryptology ePrint Archive, Report 2019/262, 2019. https://eprint.iacr.org/2019/262.

[MAB+20] Carlos Aguilar Melchor, Nicolas Aragon, Slim Be aieb, Loïc Bidoux, Olivier Blazy, Jean-Christophe Deneuville, Philippe Gaborit, Edoardo Persiche , Gilles Zémor, and Jurjen Bos. HQC. Technical report, 2020. available at [NIS20a].

[McE78] Robert J. McEliece. A Public-Key Cryptosystem Based on Algebraic Coding Theory. JPL DSN Progress Report, 44, 05 1978.

[MGTF19]

Vincent Migliore, Benoît Gérard, Mehdi Tibouchi, and Pierre-Alain Fouque. Masking Dilithium - Efficient Implementa on and Side-Channel Evalua on. In Robert H. Deng, Valérie Gauthier-Umaña, Mar n Ochoa, and Mo Yung, editors, ACNS 19, volume 11464 of LNCS, pages 344­362. Springer, Heidelberg, June 2019.

[MLRB20]

Pedro Maat C. Massolino, Patrick Longa, Joost Renes, and Lejla Ba na. A Compact and Scalable Hardware/So ware Co-
design of SIKE. IACR TCHES, 2020(2):245­271, 2020. https://tches.iacr.org/index.php/TCHES/article/ view/8551.

[MTSB12]

Rafael Misoczki, Jean-Pierre Tillich, Nicolas Sendrier, and Paulo S. L. M. Barreto. MDPC-McEliece: New McEliece
Variants from Moderate Density Parity-Check Codes. Cryptology ePrint Archive, Report 2012/409, 2012. http: //eprint.iacr.org/2012/409.

[NAB+20]

Michael Naehrig, Erdem Alkim, Joppe Bos, Leo Ducas, Karen Easterbrook, Brian LaMacchia, Patrick Longa, Ilya Mironov, Valeria Nikolaenko, Christopher Peikert, Ananth Raghunathan, and Douglas Stebila. FrodoKEM. Technical report, 2020. available at [NIS20a].

[NIE86]

H. NIEDERREITER. Knapsack-type cryptosystems and algebraic coding theory. Prob. Control and Inf. Theory, 15(2):159­ 166, 1986.

[NIS16]

NIST. Submission Requirements and Evalua on Criteria for the Post-Quantum Cryptography Standardiza on Process,
2016. https://csrc.nist.gov/CSRC/media/Projects/Post-Quantum-Cryptography/documents/ call-for-proposals-final-dec-2016.pdf.

© PQShield Ltd | www.pqshield.com

37 of 39

[NIS17a] [NIS17b]

NIST. Official Comments (Round 1) - Kyber, 2017. https://csrc.nist.gov/CSRC/media/ Projects/Post-Quantum-Cryptography/documents/round-1/official-comments/ CRYSTALS-KYBER-official-comment.pdf.
NIST. Post-Quantum Cryptography - Round 1 Submissions, 2017. https://csrc.nist.gov/projects/ post-quantum-cryptography/round-1-submissions.

[NIS19a] [NIS19b] [NIS20a]

NIST. NISTIR 8240 - Status Report on the First Round of the NIST Post-Quantum Cryptography Standardiza on Process, 2019. https://nvlpubs.nist.gov/nistpubs/ir/2019/NIST.IR.8240.pdf.
NIST. Official Comments (Round 3) - qTESLA, 2019. https://csrc.nist.gov/CSRC/media/ Projects/Post-Quantum-Cryptography/documents/round-3/official-comments/ SIKE-round3-official-comment.pdf.
Post-Quantum Cryptography - Round 3 Submissions, 2020. https://csrc.nist.gov/projects/ post-quantum-cryptography/round-3-submissions.

[NIS20b]

NIST. NISTIR 8309 - Status Report on the Secind Round of the NIST Post-Quantum Cryptography Standardiza on Process, 2020. https://csrc.nist.gov/publications/detail/nistir/8309/final.

[NIW+20]

Shuhei Nakamura, Yasuhiko Ikematsu, Yacheng Wang, Jintai Ding, and Tsuyoshi Takagi. New Complexity Es ma on on
the Rainbow-Band-Separa on A ack. Cryptology ePrint Archive, Report 2020/703, 2020. https://eprint.iacr. org/2020/703.

[OSHG19]

Tobias Oder, Julian Speith, Kira Höltgen, and Tim Güneysu. Towards Prac cal Microcontroller Implementa on of the Signature Scheme Falcon. In Jintai Ding and Rainer Steinwandt, editors, Post-Quantum Cryptography - 10th Interna onal Conference, PQCrypto 2019, pages 65­80. Springer, Heidelberg, 2019.

[Pat96]

Jacques Patarin. Hidden Fields Equa ons (HFE) and Isomorphisms of Polynomials (IP): Two New Families of Asymmetric Algorithms. In Ueli M. Maurer, editor, EUROCRYPT'96, volume 1070 of LNCS, pages 33­48. Springer, Heidelberg, May 1996.

[PBB10]

Albrecht Petzoldt, Stanislav Bulygin, and Johannes Buchmann. CyclicRainbow - A Mul variate Signature Scheme with a Par ally Cyclic Public Key. In Guang Gong and Kishan Chand Gupta, editors, INDOCRYPT 2010, volume 6498 of LNCS, pages 33­48. Springer, Heidelberg, December 2010.

[PBY17]

Peter Pessl, Leon Groot Bruinderink, and Yuval Yarom. To BLISS-B or not to be: A acking strongSwan's Implementa on of Post-Quantum Signatures. In Bhavani M. Thuraisingham, David Evans, Tal Malkin, and Dongyan Xu, editors, ACM CCS 2017, pages 1843­1855. ACM Press, October / November 2017.

[PCG01]

Jacques Patarin, Nicolas Courtois, and Louis Goubin. QUARTZ, 128­Bit Long Digital Signatures. In David Naccache, editor, CT-RSA 2001, volume 2020 of LNCS, pages 282­297. Springer, Heidelberg, April 2001.

[Pet20]

Albrecht Petzoldt. Efficient Key Genera on for Rainbow. In Jintai Ding and Jean-Pierre Tillich, editors, Post-Quantum Cryptography - 11th Interna onal Conference, PQCrypto 2020, pages 92­107. Springer, Heidelberg, 2020.

[PFH+20] Thomas Prest, Pierre-Alain Fouque, Jeffrey Hoffstein, Paul Kirchner, Vadim Lyubashevsky, Thomas Pornin, Thomas Ricosset, Gregor Seiler, William Whyte, and Zhenfei Zhang. FALCON. Technical report, 2020. available at [NIS20a].

[Por19]

Thomas Pornin. New Efficient, Constant-Time Implementa ons of Falcon. Cryptology ePrint Archive, Report 2019/893, 2019. https://eprint.iacr.org/2019/893.

[PP19]

Thomas Pornin and Thomas Prest. More Efficient Algorithms for the NTRU Key Genera on Using the Field Norm. In Dongdai Lin and Kazue Sako, editors, PKC 2019, Part II, volume 11443 of LNCS, pages 504­533. Springer, Heidelberg, April 2019.

[PQS20]

PQShield. An Overview of Post-Quantum Cryptography. 2020. https://pqshield.com/whitepapers/.

[PS20]

Ray Perlner and Daniel Smith-Tone. Rainbow Band Separa on is Be er than we Thought. Cryptology ePrint Archive, Report 2020/702, 2020. https://eprint.iacr.org/2020/702.

[SAB+17]

Peter Schwabe, Roberto Avanzi, Joppe Bos, Léo Ducas, Eike Kiltz, Tancrède Lepoint, Vadim Lyubashevsky, John M.
Schanck, Gregor Seiler, and Damien Stehlé. CRYSTALS-KYBER. Technical report, Na onal Ins tute of Standards and Technology, 2017. available at https://csrc.nist.gov/projects/post-quantum-cryptography/ round-1-submissions.

[SAB+20] Peter Schwabe, Roberto Avanzi, Joppe Bos, Leo Ducas, Eike Kiltz, Tancrede Lepoint, Vadim Lyubashevsky, John M. Schanck, Gregor Seiler, and Damien Stehle. CRYSTALS-KYBER. Technical report, 2020. available at [NIS20a].

[SBK+17]

Marc Stevens, Elie Bursztein, Pierre Karpman, Ange Alber ni, and Yarik Markov. The First Collision for Full SHA-1. In Jonathan Katz and Hovav Shacham, editors, CRYPTO 2017, Part I, volume 10401 of LNCS, pages 570­596. Springer, Heidelberg, August 2017.

© PQShield Ltd | www.pqshield.com

38 of 39

[Sch18]

John M. Schanck. A Comparison of NTRU Variants. Cryptology ePrint Archive, Report 2018/1174, 2018. https: //eprint.iacr.org/2018/1174.

[SHRS17]

John M. Schanck, Andreas Hulsing, Joost Rijneveld, and Peter Schwabe. NTRU-HRSS-KEM. Technical report,
Na onal Ins tute of Standards and Technology, 2017. available at https://csrc.nist.gov/projects/ post-quantum-cryptography/round-1-submissions.

[sJA19]

Hwajeong soe, Amir Jalali, and Reza Azarderakhsh. SIKE Round 2 Speed Record on ARM Cortex-M4. Cryptology ePrint Archive, Report 2019/535, 2019. https://eprint.iacr.org/2019/535.

[SLLH18]

Hwajeong Seo, Zhe Liu, Patrick Longa, and Zhi Hu. SIDH on ARM: Faster Modular Mul plica ons for Faster Post-
Quantum Supersingular Isogeny Key Exchange. IACR TCHES, 2018(3):1­20, 2018. https://tches.iacr.org/ index.php/TCHES/article/view/7266.

[SRSWZ20] Thomas Schamberger, Julian Renner, Georg Sigl, and Antonia Wachter-Zeh. A Power Side-Channel A ack on the CCA2Secure HQC KEM. Cryptology ePrint Archive, Report 2020/910, 2020. https://eprint.iacr.org/2020/910.

[SS13]

Damien Stehlé and Ron Steinfeld. Making NTRUEncrypt and NTRUSign as Secure as Standard Worst-Case Problems over Ideal La ces. Cryptology ePrint Archive, Report 2013/004, 2013. http://eprint.iacr.org/2013/004.

[SSH11]

Koichi Sakumoto, Taizo Shirai, and Harunaga Hiwatari. On Provable Security of UOV and HFE Signature Schemes against Chosen-Message A ack. In Bo-Yin Yang, editor, Post-Quantum Cryptography - 4th Interna onal Workshop, PQCrypto 2011, pages 68­82. Springer, Heidelberg, November / December 2011.

[SXY18]

Tsunekazu Saito, Keita Xagawa, and Takashi Yamakawa. Tightly-Secure Key-Encapsula on Mechanism in the Quantum Random Oracle Model. In Jesper Buus Nielsen and Vincent Rijmen, editors, EUROCRYPT 2018, Part III, volume 10822 of LNCS, pages 520­551. Springer, Heidelberg, April / May 2018.

[TPD20]

Chengdong Tao, Albrecht Petzoldt, and Jintai Ding. Improved Key Recovery of the HFEv- Signature Scheme. Cryptology ePrint Archive, Report 2020/1424, 2020. https://eprint.iacr.org/2020/1424.

[vW99]

Paul C. van Oorschot and Michael J. Wiener. Parallel Collision Search with Cryptanaly c Applica ons. Journal of Cryptology, 12(1):1­28, January 1999.

[Wei20]

Alex Weibel. Round 2 Hybrid Post-Quantum TLS Benchmarks. AWS Security Blog, 2020. https://aws.amazon. com/fr/blogs/security/round-2-hybrid-post-quantum-tls-benchmarks/.

[WSN18]

Wen Wang, Jakub Szefer, and Ruben Niederhagen. FPGA-Based Niederreiter Cryptosystem Using Binary Goppa Codes. In Tanja Lange and Rainer Steinwandt, editors, Post-Quantum Cryptography - 9th Interna onal Conference, PQCrypto 2018, pages 77­98. Springer, Heidelberg, 2018.

[WTBB+19] Guillaume Wafo-Tapa, Slim Be aieb, Loic Bidoux, Philippe Gaborit, and E enne Marcatel. A Prac cable Timing A ack
Against HQC and its Countermeasure. Cryptology ePrint Archive, Report 2019/909, 2019. https://eprint.iacr. org/2019/909.

[ZCD+19]

Greg Zaverucha, Melissa Chase, David Derler, Steven Goldfeder, Claudio Orlandi, Sebas an Ramacher, Chris-
an Rechberger, Daniel Slamanig, Jonathan Katz, Xiao Wang, and Vladmir Kolesnikov. Picnic. Technical report, Na onal Ins tute of Standards and Technology, 2019. available at https://csrc.nist.gov/projects/ post-quantum-cryptography/round-2-submissions.

[ZCD+20]

Greg Zaverucha, Melissa Chase, David Derler, Steven Goldfeder, Claudio Orlandi, Sebas an Ramacher, Chris an Rechberger, Daniel Slamanig, Jonathan Katz, Xiao Wang, Vladmir Kolesnikov, and Daniel Kales. Picnic. Technical report, 2020. available at [NIS20a].

[ZCHW17]

Zhenfei Zhang, Cong Chen, Jeffrey Hoffstein, and William Whyte. NTRUEncrypt. Technical report, Na-
onal Ins tute of Standards and Technology, 2017. available at https://csrc.nist.gov/projects/ post-quantum-cryptography/round-1-submissions.

© PQShield Ltd | www.pqshield.com

39 of 39

