SCIENCE

PA S S I O N

TECHNOLOGY

Enhancing Side-Channel Analysis of BinaryField Multiplication with Bit Reliability
Peter Pessl, Stefan Mangard IAIK, Graz University of Technology, Austria CT-RSA 2016, San Francisco, 3rd March 2016
www.iaik.tugraz.at

Overview

www.iaik.tugraz.at

New side-channel attack on Fresh Re-Keying and binary-field multiplication Connection to Learning Parity with Noise (LPN) problem Extensive use of bit reliabilities in order to decrease runtime
Attack a protected Fresh Re-Keying implementation Using only 512 traces With reasonable runtime

2

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

Fresh Re-Keying [MSGR10, MPR+11]

www.iaik.tugraz.at

Goal: SCA protection for low-cost devices Combine an encryption function f With a re-keying function g

r

k

gk (r)

Fresh session key k  per invocation

k

f is SPA secure

m

fk (m)

c

g is DPA secure, but not cryptographically strong

3

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

Re-Keying Function

Polynomial multiplication modulo y 16 + 1 over GF(28) Good diffusion Easy to protect (masking, shuffling)

Rewrite as matrix-vector product over bytes and bits Linear equation in master-key bits Risk in SCA setting (SPA security?)

 r0
r1 r2
 ...

r15 r0 r1
...

r14 r15 r0
...

∑∑∑ ∑∑∑ ∑∑∑
...

     r1

k0

r2

k1

r3

k2

kkk012

   =   ...

...

...

r15 r14 r13 ∑ ∑ ∑ r0

k15

k15

4

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

www.iaik.tugraz.at

SCA of Binary-Field Multiplication
Attacks of Bela®id et al. [BFG14, BCF+15]
Multiplication in GF(2n) Noisy Hamming weight of each n-bit product
With, e.g., n = 128 Round to either 0 or 2n - 1 Linear equations in bits, but with errors

5

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

www.iaik.tugraz.at

LPN - Learning Parity with Noise

www.iaik.tugraz.at

Definition: Learning Parity with Noise

 equations bi = ai , k + ei Secret k, public random ai (n-bit vectors), P(ei = 1) = find k

Solving algorithms
BKW-based (high , sub-exponential runtime) (used by Bela®id et al.) Linear decoding (low , exponential runtime)

6

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

Our Attack

7

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

www.iaik.tugraz.at

Chosen Target

r

k

k

ki

m

mi

S ∑∑∑

www.iaik.tugraz.at
Protected Fresh Re-Keying implementation (8-bit software) [MPR+11] Multiplication: masked and shuffled AES: shuffled

8

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

Template Attack on the S-box

www.iaik.tugraz.at

r

k

k

ki

m

mi

S ∑∑∑

L

9

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

Product k  is used in AES AES only SPA secure
Templates on S-box Probability vector for key-bytes Turn them into bit-wise probabilities

Countering the Shuffling

www.iaik.tugraz.at

k0

00

S ∑∑∑

k1

FF

S ∑∑∑

k2

FF

S ∑∑∑

...

10

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

Application: challenge-response auth. Verifier choses plaintexts
Chosen fixed plaintext: (00)||(FF)15
Templates for both cases Reveal one position Independent of permutation generation

Outcome of the physical attack
Vector of probabilities for session-key bits b pb = P(b = 1), bias b = |pb - 0.5| Classification: b = pb , b = 0.5 - b
Each entry an LPN sample but with additional information ( b)

11

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

www.iaik.tugraz.at

A New LPN Variant

Definition: Learning Parity with Variable Noise
 equations bi = ai , k + ei Secret k, public random a (bit vectors) P(ei = 1) = i , i sampled from meta-distribution  Find k
Incorporation of i might lead to faster algorithms.

12

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

www.iaik.tugraz.at

Our LPVN algorithm
Filtering
Discard samples with high b Similar to Bela®id et al., but bit-wise
Linear Decoding
Tweaked algorithm incorporating probabilities

()

www.iaik.tugraz.at

0.04 0.03

SNRSB=1, SNRPT=0.2

0.02

0.01

0

0

0.1

0.2

0.3

0.4

0.5



Typical meta-probability ( )

13

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

LPN and Decoding
Decoding problem:
Given a generator matrix G and noisy word y = GTk + e find e or k
Syndrome decoding:
Check matrix H and syndrome s = Hy = He Search for e (w columns of H with sum s)

14

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

www.iaik.tugraz.at

Stern's Algorithm for Random Linear Codes

www.iaik.tugraz.at

Randomly partition columns of H into sets Q, I Transform I to identity, search for errors of particular form Optimization: swap columns between Q and I [BLP08]

p err.

p err.

0 err.

1 0 0 ∑ ∑ ∑ ∑ ∑ ∑ 0 1 0 1



1 1 0∑∑∑ ∑∑∑0 0 0 1





Hp

=

(Q|I )

=

0 



1 1∑∑∑ ...

∑∑∑1 1 ...

1

1



...

 

0 1 1∑∑∑ ∑∑∑1 0 1

1

15

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

Tweaked Stern
Each entry of e / column of H corresponds to LPVN sample with attached probability
Reliability-guided swapping of columns Rejection sampling based on bias Keep number of errors in Q low While still behaving randomly

www.iaik.tugraz.at

16

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

Attack Results
Simulation
8-bit with shuffling countermeasure Noisy Hamming weights
Real device
Power measurements Profiling

17

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

www.iaik.tugraz.at

Results - Simulation

www.iaik.tugraz.at

() Attack complexity

0.04 0.03

SNRSB=1, SNRPT=0.2

0.02

0.01

0

0

0.1

0.2

0.3

0.4

0.5



Meta-probability ( )

18

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

280 Tweaked Original
260

240

220

210

211

212

213

214

215

Nr. of traces

Runtime complexity

Results - Real Device

www.iaik.tugraz.at

() Attack complexity

0.08 280
0.06 260
0.04
240 0.02

0

220

0

0.1

0.2

0.3

0.4

0.5



Meta-probability ( )

19

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

Tweaked Original

29

210

211

Nr. of traces

Runtime complexity

Conclusions

www.iaik.tugraz.at

Attack with small trace count and reasonable runtime

r

Without violating the constraints of Fresh Re-Keying

k

gk (r)

AES still SPA secure

Implications for Fresh Re-Keying

k

Separations of responsibilities not trivial Protect re-keying output in all stages

m

fk (m)

c

20

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

SCIENCE

PA S S I O N

TECHNOLOGY

Enhancing Side-Channel Analysis of BinaryField Multiplication with Bit Reliability
Peter Pessl, Stefan Mangard IAIK, Graz University of Technology, Austria CT-RSA 2016, San Francisco, 3rd March 2016
www.iaik.tugraz.at

Bibliography I

www.iaik.tugraz.at

[BCF+15] Sonia Bela®id, Jean-Se¥ bastien Coron, Pierre-Alain Fouque, Beno^it Ge¥ rard, Jean-Gabriel Kammerer, and Emmanuel Prouff. Improved Side-Channel Analysis of Finite-Field Multiplication. IACR Cryptology ePrint Archive, 2015:542, 2015. note: to appear at CHES 2015.

[BFG14]

Sonia Bela®id, Pierre-Alain Fouque, and Beno^it Ge¥ rard. Side-Channel Analysis of Multiplications in GF(2128) - Application to AES-GCM. In Palash Sarkar and Tetsu Iwata, editors, Advances in Cryptology - ASIACRYPT 2014, volume 8874 of Lecture Notes in Computer Science, pages 306≠325. Springer, 2014.

[BLP08]

Daniel J. Bernstein, Tanja Lange, and Christiane Peters. Attacking and Defending the McEliece Cryptosystem. In Johannes A. Buchmann and Jintai Ding, editors, Post-Quantum Cryptography, Second International Workshop, PQCrypto 2008, volume 5299 of Lecture Notes in Computer Science, pages 31≠46. Springer, 2008.

[MPR+ 11]

Marcel Medwed, Christophe Petit, Francesco Regazzoni, Mathieu Renauld, and Franc∏ois-Xavier Standaert. Fresh Re-keying II: Securing Multiple Parties against Side-Channel and Fault Attacks. In Emmanuel Prouff, editor, Smart Card Research and Advanced Applications 10th IFIP WG 8.8/11.2 International Conference, CARDIS 2011, volume 7079 of Lecture Notes in Computer Science, pages 115≠132. Springer, 2011.

[MSGR10] Marcel Medwed, Franc∏ois-Xavier Standaert, Johann Groﬂscha® dl, and Francesco Regazzoni. Fresh Re-keying: Security against Side-Channel and Fault Attacks for Low-Cost Devices. In Daniel J. Bernstein and Tanja Lange, editors, Progress in Cryptology AFRICACRYPT 2010, volume 6055 of Lecture Notes in Computer Science, pages 279≠296. Springer, 2010.

22

Pessl, Mangard CT-RSA 2016, San Francisco, 3rd March 2016

SESSION ID: CRYP-R03
Towards a Unified Security Model for Physically Unclonable Functions
#RSAC

Daisuke Moriyama
Researcher NICT

#RSAC
Authors of this paper

Frederik Armknecht Daisuke Moriyama Ahmad-Reza Sadeghi

Moti Yung

(University of Mannheim)

(NICT)

(TU Darmstadt) (Google/Columbia Univ)

2

#RSAC
Introduction

Which is iPhone ?

Which is Louis Vuitton's product?
3

#RSAC
Introduction
We need unique identification of device/goods for IoT world
- Device ID or RFID tag is useless if the internal information is copied
Physical uniqueness during fabrication is useful ! Yield variance is not bad effect but uniqueness!
Physically Unclonable Functions (PUFs)
4

#RSAC
Cryptographic Brief Definition of PUFs

Input

PUF

Output

1. Given an input, it is easy to evaluate the output
2. It is difficult to produce another device which the two devices respond the same output from the same input.

5

#RSAC
Example PUF constructions

Arbiter PUFs

SRAM PUFs

Ring Oscillator PUFs

Butterfly PUFs

Latch PUFs

New constructions are discovered almost every year !!!

6

#RSAC
Application of PUFs in Cryptography

PUF is expected to be used in cryptographic protocols...

Protocol 1

Protocol 2

Protocol 3 ...

Which PUF is suitable for existing/new protocol?

PUF A

PUF B

PUF C
7

PUF D ...

What we think

Bridge them by security model !!

Protocol 1

Protocol 2

Protocol 3 ...

Unforgeability

Indistinguishability ...

One-wayness

Unclonability Pseudorandomness

PUF A

PUF B

PUF C
8

PUF D ...

#RSAC
Requirement
Evaluation

#RSAC
What we think

Bridge them by security model !!

Protocol 1

Protocol 2

Protocol 3 ...

Unforgeability

Indistinguishability ...

One-wayness

Unclonability Pseudorandomness

Requirement
Evaluation

DPeUfFinAing manyPUcFrByptographPUicF CpropertiePsUFaDre de...sirable

9

#RSAC
What we think

Bridge them by security model !!

We cannot ignore real effects caused in physical device (noPirsoytoocuolt1puts, cPorrorteoclaotl i2on amoPrnogtodcoelv3ices..., etc...)

Requirement

Unforgeability

Indistinguishability ...

One-wayness

Unclonability Pseudorandomness

Evaluation

PUF A

PUF B

PUF C

PUF D ...

10

#RSAC
Security model
Our Unified Security Model for PUFs
11

#RSAC
Security model: Manufacturing

PUF is denoted as function

But we should not simply say like "XXX PUF is good"...

130nm process 90nm process 65nm process

FPGA (Xillinx,Altera,...) Custom ASIC SRAM (ISSI,Micron,...)

Made in USA Made in China ... Made in Japan

... ... ...

We treat
12

#RSAC
Security model: Output distribution

has
Same input
Challenge1

Same device

-variance and Response1

-min-entropy if

Challenge1

Response2

Distance among any pairs are smaller than

...

Challenge

Response
13

Intra-distance

#RSAC
Security model: Output distribution

has
Different input
Challenge1

Same device

-variance and

Response1

-min-entropy if

Challenge2

Response2

Distance among any pairs are larger than

...

Challenge

Response
14

Inter-distance I

#RSAC
Security model: Output distribution

has
Same input

Different device

-variance and

Challenge1

Response1

-min-entropy if

Challenge1

Response2

Distance among any pairs are larger than

Challenge1

Response
15

Inter-distance II

#RSAC
Security model: Output distribution

has Challenge1

-variance and

-min-entropy if

Response1

Given other outputs, the target still has enough min-entropy

Challenge2 Challenge1

Response2 ... Challenge Response1' ... Challenge

Response Response

...

Challenge1

Response1'' Challenge
16

Response

#RSAC
Security model: Output distribution

has Intra-distance:

These are formal d-evfainriiatinocnesapnrdovided in proceed-mingin-entropy if

Inter-distance I:

Inter-distance II:

Min-entropy:

17

#RSAC
Security model: One-wayness

has Adv

-one-wayness if Challenger
, ,...

PUF PUF

18

#RSAC
Security model: One-wayness

has Adv

-one-wayness if Challenger
, ,...

Evaluate distPaUnFce from valid output SubtraPcUt Frandom guessing prob w.r.t. queries

19

#RSAC
Security model: Unforgeability

has Adv

-EUF-CMA security if Challenger
, ,...

PUF

20

#RSAC
Security model: Unforgeability

has Adv

-EUF-CMA security if Challenger
, ,...

PUF Subtract random guess probability:

21

#RSAC
Security model: Unforgeability

has

-EUF-CMA security if

Pappu (PhD Thesis 2001) Gassend et al. (ACMCCS 2002) Guajardo et al. (CHES 2007)
Armknecht et al. (IEEE S&P 2011)
Brzuska et al. (CRYPTO 2011)

-UUF-KOA
-UUF-KMA
-UUF-OT-KMA, -EUF-KOA
-UUF-KMA, -EUF-CMA -EUF-CMA

Our model is the generalized version

22

#RSAC
Security model: Unclonability

has Adv

-unlonability if Challenger
, ,...

PUF behaves as

23

#RSAC
Security model: Indistinguishability

has Adv

-indistinguishablility if Challenger
, ,...

PUF PUF

24

#RSAC
Security model: Pseudorandomness

has Adv

-pseudorandomness if Challenger

, ,...
PUF RF

Add random noise at most

25

#RSAC
Security model: Tamper resilience

has

-tamper resilience if

Adv

Challenger

Create, Response

Challenger Sim
Create, Response

Physical analysis OK
26

Physical analysis NG

Comparison with Existing Works: Evaluation

Intra-distance Inter-distance I Inter-distance II Min-entropy Number of PUFs

Pappu

Yes

-

-

-

1

Gassend et al. (ACMCCS02)

Yes

Yes

-

-

1

Guajardo et al. (CHES07)

Yes

-

-

-

1

Armknecht et al. (ASIACRYPT09)

Yes

-

-

Yes

1

Armknecht et al. (IEEE S&P11)

Yes

-

-

Yes

poly

Brzuska et al. (CRYPTO11)

Yes

-

-

Yes

1

Maes

Yes

-

Yes

-

1

Ours

Yes

Yes

Yes

Yes

poly

27

Number of Queries
1 poly
1 poly poly poly poly Yes

#RSAC

#RSAC
Comparison with Existing Works: Property

Min-entropy

Pappu

-

Gassend et al. (ACMCCS02)

-

Guajardo et al. (CHES07)

-

Armknecht et al. (ASIACRYPT09)

Yes

Armknecht et al. (IEEE S&P11)

Yes

Brzuska et al. (CRYPTO11)

Yes

Maes

Ours

Yes

One-wayness Unforgeability Unclonability Indistinguishability

Yes

UUF-KOA

-

-

-

UUF-KMA

-

-

-

UUF-OT-KMA EUF-KOA

-

-

-

-

Yes

-

-

UUF-KMA, EUF-CMA

Yes

-

Yes

EUF-CMA

Yes

-

Yes

EUF-CMA

Yes

-

Yes

EUF-CMA

Yes

Yes

28

Pseudorandomness
Yes

Tamper Evidence
Yes

#RSAC
Relationship among Security Notions
One-wayness

Unforgeability (EUF-CMA) Unclonability

Indistinguishability

Pseudorandomness

-min-entropy See full version for formal proofs
29

-min-entropy

#RSAC
Conclusion
We provided a new security model for PUFs
Various security definitions (from crypto primitives) motivated by crypto primitives Cover noise effect for formal definitions (caused from real PUFs!)
If ignored, adversarial advantage cannot be properly evaluated Provide implication and separations
30

#RSAC
What Researchers Should DO NEXT
Consider security proof for PUF-based protocols based on security model for PUFs (theory)
Whenever you propose a new protocol, think about requirements for PUFs toward provable security
Consider evaluation s.t. which PUF satisfies which security property (implementation)
Whenever you propose a new PUF, think about the security properties your PUF can provide
31

#RSAC
Thank you for your attention !
32

