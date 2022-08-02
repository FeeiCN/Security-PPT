SESSION ID: CRYP-R02
ECDH Key-Extraction via Low-Bandwidth Electromagnetic

Daniel Genkin
Technion, Tel-Aviv University
Lev Pachmanov
Tel-Aviv University
Itamar Pipman
Tel-Aviv University

Attacks on PCs
#RSAC

Eran Tromer
Tel-Aviv University

#RSAC
Key Extraction via Physical Side Channels

Small Devices

Big Devices

Modular Exponentiation (RSA, ElGamal)

[Fouque Kunz-Jacques Martinet Müller Valette 06] [Gandolfi Mourtel Oliver 01] [Homma Miyamoto Aoki Satoh Shamir 08] [Kocher 96] [Courrege Feix Roussellet 10] [Fouque Valette 03] [Kocher Jaffe Jum 99] [Messerges Dabbish Sloan 99] [Novak 02] [Walter Thompson 01] [Kühn 03]...

· Acoustic [Genkin Shamir Tromer 14] · EM, ground potential
[Genkin Pipman Tromer 14]
· Cheap EM
[Genkin Pachmanov Pipman Tromer 15]

[Cron 02], [Akishita Takagi 03], [Avanzi 05], [Biehl Meyer Müller 00], [Blömer Otto Seifert 06] [Ciet Joye 05] [Fouque Lercier Réal Valette 08] [Fouque Réal Valette Drissi 08] [Fouque Valette 03] [Goubin 02] [Herbst Medwed 09] [Itoh Izu Takenaka 08] [Karlof Wagner 03] [Medwed Oswald 09] [DeMolder Örs Preneel 07] [Okeya Sakurai 00] [Walter 04] ...

New Challenges
· Shorter keys, smaller numbers - even faster
· Different math
This Paper
2

Different scenario
· Not handed out to the adversary · Attacker needs to be swift and
inconspicuous
Speed
· 2GHz vs. 100MHz CPU · Clock-rate attacks requires
expansive and bulky equipment
Complexity & Noise
· Complex electronics running complicated software (in parallel)

Elliptic Curve Cryptography

#RSAC
Attacking ECDH: GnuPG as a case study

#RSAC
Elliptic Curve Diffie-Hellman (ECDH) Encryption

Standardized
OpenPGP [RFC 6637] NIST SP800-56A
Implementations
GnuPG (libgcrypt) BouncyCastle Google's end-to-end encrypted email
Key Setup:
Secret key: random  Public key: point   

Encryption:
Random number:  Ephemeral key:  =       Ciphertext:  =   ,   
Decryption:
Compute:  =  ·    Obtain ephemeral key:  =    =  

#RSAC
GnuPG's NAF representation
Non-Adjacent Form (NAF) representation [Reitwiesner 60]
Allows positive and negative digits  = 2 where   -1,0,1 Reduces the number of nonzero digits from ½ to  Example: 7=(0,1,1,1)2=(1,0,0,-1)2
5

#RSAC
GnuPG's Scalar-by-Point Multiplication

point_mul(k, P) { A=P for i=n-1..0 do
D A = 2*A if k[i]==1 then
A A=A+P if k[i]==-1 then
I P'= -P A A = A + P'
return A }

A=[kn...ki+1]·P A=[kn...ki+1 0]·P A=[kn...ki+1 1]·P A=[kn...ki+1-1]·P A=[kn...ki+1 ki]·P
6

#RSAC
GnuPG's Scalar-by-Point Multiplication

point_mul(k, P) {

A=P

for i=n-1..0 do D A = 2*A
measure
if k[i]==1 then A A=A+P

DADDI
deduce
ADIA...

k=1,0,-1,-1,...

if k[i]==-1 then

I P'= -P

point_inverse(P) {

A A = A + P' P'.x = P.x

return A

P'.y = -P.y

}

return P'

}

5MHz measurements vs. 2000MHz CPU

7

#RSAC
GnuPG's Scalar-by-Point Multiplication

point_mul(k, P) { A=P for i=n-1..0 do A = 2*A if k[i]==1 then A = A + P if k[i]==-1 then P'= -P A = A + P' return A
}

Leakage self amplification
[GST14], [GPT14], [GPPT15]
abuse algorithm's own code to amplify its own leakage!
Craft suitable cipher-text to affect the inner-most loop
Small differences in repeated inner-most loops cause a big overall difference in code
behavior
8

#RSAC
GnuPG's Scalar-by-Point Multiplication

point_mul(k, P) { A=P for i=n-1..0 do A = 2*A if k[i]==1 then A = A + P if k[i]==-1 then P'= -P A = A + P' return A
}

point_add(P1, P=(x,1) point_add(P1, P2){ if P1.z==0 then

return P2

P2) { if P2.z==0 then
P.y=1 return P1 mod p
...t1 = P1.x*(P2.z2)
t2 = P2.x*(P1.z2)

=0x00000001

t P='.y=-1 mod p t3 = t1-t2
t4 = P1.y*(P2.z3) t5 = P2.y*(P1.z3)

=0x8e216f53a2...

Pptto67o2i==i.nttn41yt-+ttt_*52_a(adPdd1(P(.1Pz,13,)P2P)2){{

.........t8 = t4+t5
if t3==0 && t6==0 then
t5 t = return =(P1,21P,.02y) .*(yP*1(.Pz13.)z3)
P3.x = t62-t7*t32
}......t9 = t7*t32-2*P3.x
}P3.y = (t9*t6-t8*t33)/2
}P3.z = z1*z2*t3 if k}[rie]t=u=rn1P3then P2.y=1 so P2.y is short if k[i]==-1 then P2.y=-1 so P2.y is long
9

1041 s vs. 1110 s

#RSAC
Live Demo
10

#RSAC
Experimental Setup
11

#RSAC
Obtained Signal
12

#RSAC
Empirical Results
13

amplitude

#RSAC
Obtained Signal
time
14

#RSAC
Distinguishing Add Operations
Distinguishing between double and add operations
Aggregated Traces
Spectrogram
Energy of the higher frequency
15

A A A A A A

A -P
D D D
A -P
D D
A +P
D D
A +P
D

amplitude

#RSAC
Obtained Signal
time
16

#RSAC
Distinguishing Between +1 and -1

Using the timing information of add operations we zoom in

+1 NAF digit

-1 NAF digit

17

#RSAC
Conclusions and Countermeasures
18

Overall ECDH attack
Non-adaptive
1 chosen ciphertext
Low bandwidth
5 MHz
GHz scale PCs
Various models

#RSAC
Fast
66 decryptions 3.3 seconds
Common cryptographic software
GnuPG libgcrypt 1.6.3 CVE-2015-7511

19

#RSAC
Applying Countermeasures
Change of scalar-by-point multiplication algorithm
Avoid key-dependent addition operations
Scalar randomization
Split secret  to  parts  = 1 +  +  Compute 1·  +  + · 
Point blinding
Generate random point  Compute ·  +  - · 
Careful constant-time, constant-cache implementation
20

#RSAC
Physical Side Channel Attacks on PCs
Attacks are practical despite clock rates and noise Cheap, low-bandwidth attacks Applicable to common public-key algorithms Common software and hardware are vulnerable Many channels: EM, acoustic, power, ground-potential
21

#RSAC
Thanks! cs.tau.ac.il/~tromer/ecdh
22

SESSION ID: CRYP-R02
Side-Channel Attacks on Elliptic Curve Cryptography
#RSAC

Co-authors
Pierre Belgarric Pierre-Alain Fouque Gilles Macario-Rat Mehdi Tibouchi
Pierre Belgarric
Research Engineer HP Inc.

#RSAC
People

Pierre Belgarric PhD candidate at Orange Labs during this work Now at HP Labs Platform security
Pierre-Alain Fouque Université Rennes 1 Cryptanalyst

Gilles Macario-Rat Orange Labs Cryptographer
Mehdi Tibouchi NTT, Japan Cryptographer

2

#RSAC
Plan
Introduction Evaluation environment Cryptanalysis of elliptic curves defined over prime fields Cryptanalysis of Koblitz curves Conclusion
3

#RSAC
Introduction

#RSAC
Context of the evaluation
Sensitive services are being implemented on smartphones. Security challenges:
Security is built to protect against software vulnerabilities. General-purpose hardware is not designed to be resistant to physical attacks.
Better evaluate the security of smartphones, and refine the threat model.
5

Target specificities compared to

#RSAC

smartcards

Hardware (physics)
High-frequency clock
Advanced semiconductor technology (in comparison to smartcards)
Huge number of gates
45nm 65nm

Hardware

Software

(microarchitecture)

Rich OS

Complex microarchitecture

High number of threads

Multi-core

Optimisation designs

Several stacks

Applicative VM

ARMv7, Cortex A5 ARMv6, ARM11

Android Dalvik VM

6

#RSAC
Related work

Early works
Gebotys et al. (2005) Driss Aboulkassimi (2011) Kenworthy and Rohatgi (2012)

2014 ­ 2015: Main works
Genkin et al. (x4) Longo et al. Balasch et al.

7

#RSAC
Evaluation environment

Evaluated software
Study of Elliptic Curve Digital Signature Algorithm (ECDSA).
Applicative library: Bouncy Castle.
At the time of the study: version 1.50.
in Dalvik as in Java, the library implementation is called through the JCA/JCE APIs.

#RSAC
Bouncy Castle Java library logo

#RSAC
Evaluated software
Left-to-Right double and add wNAF algorithm Pre-computed points prevent from extracting value of added point with SPA
10

#RSAC
Experimental setup
Side-channel evaluation bench
11

#RSAC
Experimental setup
Observation of IC EM radiation. Near-field: magnetic loop probe within a few millimetres of the IC package Hundreds of measurements: automation required. Non-invasive: no tampering with the IC.
12

#RSAC
Synchronisation
PC sends signal to the smartphone on USB before encryption. Detected by oscilloscope. More accurate synchronisation using sleep instructions before cryptographic operations.
13

#RSAC
Cryptanalysis of elliptic curves defined over prime fields

#RSAC
Side-channel measurements
Digital signal filtering
Low-frequency leakages: - signal is measured with 20 MHz low-pass filter - a FIR filter is applied with 50 kHz cutting frequency - CPU runs at 1.2 GHz

#RSAC
Leakage of the arithmetic multiplication
Number of basic operations between multiplications in double BC source code
Mean and standard deviation of doubling operation time intervals
16

#RSAC
Possible explanation

Superscalar microarchitecture.
Multiple instructions run in parallel if possible. Level of parallelism achievable depends on the program and the microarchitecture.
Example of ARM Cortex-A8:
Arithmetic dual-pipeline. Only one multiplier. Might impact the number of execution pipelines in use.

A open question for further research: To what extent the microarchitecture
impacts EM/power side-channels?

17

#RSAC
Lattice-based cryptanalysis on ECDSA

ECDSA algorithm

a bits are known

creating variables t and u:

knowledge of close value

several signatures

~ Hidden Number Problem HNP

Able to extract the key using a little more of 500 signatures
18

#RSAC
Cryptanalysis of Koblitz curves

#RSAC
Koblitz curves
Efficient implementation in hardware and in software Anomalous curves defined with an equation of the form: Frobenius map:
20

#RSAC
Koblitz curves
The points of the curve satisfy the equation:
The Frobenius map can be seen as the complex number:
Representing the scalar k in a tau-adic base, then doubling is a Frobenius:
21

#RSAC
Observed leakage
Frobenius operation is very performant Pre-computed tables in Bouncy Castle Short-Term Fourier Transform (STFT)
22

#RSAC
New Cryptanalysis

Extension of the classical HNP attack on ECDSA using lattice reduction

Works by representing scalars in the form size integers

with a0, a1 half-

The magic that makes things tick is the fact that

The overall extension is not very hard, but the precise analysis of the extended attack is surprisingly subtle

Upshot: the bias/leakage needed to mount an attack for a certain field size is larger than in the classical case, but not by a large margin (only a fraction of a bit for random TNAFs)

23

#RSAC
Conclusion

Potential Use Case: Bitcoin
Bitcoin wallets A wallet is a pair of EC private key. The elliptic curve is Secp256k1.
Android wallets Android Bitcoin wallets usually rely on Bitcoinj. Bitcoinj is built upon Spongycastle for cryptography. Spongycastle is a library adaptation of Bouncy Castle for Android.
Our cryptanalysis of curves defined over prime fields could be used to extract key from a wallet spending money. Still some challenges to become a real-world threat:
Hundreds of Bitcoin payments to observe, Near-field EM radiation, Synchronisation on USB cable.
25

#RSAC

#RSAC
Conclusion / Perspectives
Hardware physical attack surface must be considered more often. Root causes of the leakage observed are not fully understood yet.
In particular, how the microarchitecture impacts EM/power side-channels.
No individual system component was faulty:
General purpose SoCs are not specified to protect against physical attacks. The crypto library was not expected to protect against physical attacks.
Suitable counter-measures should be implemented at algorithmic / software levels. Recent Bouncy Castle protects against the attack presented here: implementing scalar multiplication with the Fixed-point Comb algorithm.

#RSAC
Apply
Threats: Consider that physical side-channel is a realistic threat. Developers: Check that implementation is secure against physical attacks. Researchers: Go further into the root causes of vulnerabilities.
27

