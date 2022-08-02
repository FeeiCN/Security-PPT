By-design Backdooring of Encryption System Can We Trust Foreign Encryption Algorithms?
Arnaud Bannier & Eric Filiol (speaker) filiol@esiea.fr
ESIEA Operational Cryptology and Virology Lab (C + V )O

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

1 / 44

Agenda

1 Introduction: what is the issue?
2 History of known (and less known) backdoored algorithms
3 Description of BEA-1 Theoretical Background BEA-1 Presentation and Details
4 BEA-1 Cryptanalysis
5 Conclusion and Future Work

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

2 / 44

Summary of the talk
1 Introduction: what is the issue? 2 History of known (and less known) backdoored algorithms 3 Description of BEA-1 4 BEA-1 Cryptanalysis 5 Conclusion and Future Work

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

3 / 44

Key Question
Just imagine that if unconditionally secure systems (computer, information security) would be possible (theoretically AND practically), would it be desirable to export them?
The answer is NO due to National Security Issues (Intelligence, Defense, Police, Justice. . . ) Strategic dominance, information assurance. . . Economic warfare & dominance (since 1989)

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

4 / 44

From Export Control to Domestic Control

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

5 / 44

From Export Control to Domestic Control

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

5 / 44

From Export Control to Domestic Control

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

5 / 44

From Export Control to Domestic Control

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

5 / 44

70 Years of Control
Since the end of WWII, cryptology is under control. This control has never weakened UKUSA (5 eyes)/9 eyes/14 eyes SIGINT Seniors Europe. . . International Traffic in Arms regulations (ITAR, part 121) and subsequent regulations (Wassenaar. . . )
If cryptology is allowed/free of use, then it is under control 1997 is a key year (withdrawn from ITAR) and early 2000s in Europe: the rise of connected world. The control will be far easier (computer, OS, network. . . ) Cryptology is the most critical part in security: who is controlling cryptology, is controlling everything

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

6 / 44

The Wassenaar Agreement

Almost all G-20 countries have a national regulation regarding cryptology (use/import/export) or at least have signed an international regulation
http://rechten.uvt.nl/koops/cryptolaw/
http://www.wassenaar.org/ - 42 members
Cryptology is listed in part 5b  exporting encryption algorithms with key size greater than 56 bits (symmetric cryptology) is subject to export control!
As a consequence, the world diffusion of encryption algorithms whose key size  128 bits is a clear violation of the Wassenaar agreement . . . unless some sort of control has been organized/enforced.

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

7 / 44

What does "Operational cryptanalysis" Means?
Intelligence/operational point of view: really breaking an encryption system means
Accessing the plaintext in a time shorter than the life of the information (regarding its operational value) Practically speaking: a matter of hours (supercomputing time is horribly expensive) With a reduced amount of encrypted data (a few Kb to a few Mb) Must be played a large number of times (a clever enemy changes the key very often, encrypted traffic explodes) Academic attacks have just. . . an academic interest!

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

8 / 44

Control Techniques
The control techniques depend on the target context/environment

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

9 / 44

Trapdoor vs Backdoors
Trapdoors are an intended and necessary feature in asymmetric cryptology Backdoors are an undesirable feature Implementation backdoors
Key escrowing, key management and key distribution protocols weaknesses (refer to recent CIA leak) So called OS/software (recurrent) vulnerabilities (invoking developers incompetence is much clever) Hackers are likely to find and use them as well

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

10 / 44

Mathematical Backdoors
Key Principle Put a secret flaw at the design level while the algorithm remains public Finding the backdoor must be an intractable problem while exploiting it must be "easy"
Two kind of backdoors "Natural weakness" known by the tester/certifier (e.g NSA case with differential cryptanalysis) Intended weakness put by the encryption algorithm designer
Extremely few open and public research in this area Known existence of NSA and GCHQ research programs Sovereignty issue: can we trust foreign encryption algorithms?

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

11 / 44

Aim of our Research
Try to answer to the key question "How easy and feasible is it to design and to insert backdoors (at the mathematical level) in encryption algorithms? "

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

12 / 44

Aim of our Research
Try to answer to the key question "How easy and feasible is it to design and to insert backdoors (at the mathematical level) in encryption algorithms? "
Explore the different possible approaches The present work is a first step We consider a particular case of backdoors here (linear partition of the data spaces)

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

12 / 44

Aim of our Research
Try to answer to the key question "How easy and feasible is it to design and to insert backdoors (at the mathematical level) in encryption algorithms? "
Explore the different possible approaches The present work is a first step We consider a particular case of backdoors here (linear partition of the data spaces)
For more details on technical aspects, please refer to our free book Available on https://www.intechopen.com/books/ partition-based-trapdoor-ciphers

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

12 / 44

Summary of the talk
1 Introduction: what is the issue? 2 History of known (and less known) backdoored algorithms 3 Description of BEA-1 4 BEA-1 Cryptanalysis 5 Conclusion and Future Work

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

13 / 44

Cryptography Industry After WWII til the 90s
In Switzerland, Crypto AG/Gretag hold more than 90 % of the world market (since 1945) Almost all countries/organizations (120 in 1995) were buying cryptomachines for gvt, mil, diplomatic, economic needs except a very few (USA, France, UK...). 1995 The Hans Buehler case changed the cryptologic face of the (cryptographic) world.

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

14 / 44

The Hans Buelher Case

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

15 / 44

The Hans Buelher Case

Crypto AG's top marketing representative arrested in Teheran in 1992.
Leaks in the Press (Berlin Club bombing, Chapur Bakhtiar assassination in Paris) by Gov. officials gave hints to Iranian govt that cryptography was probably backdoored.
9 months in Iranian jails
Reveals the scandal: NSA, BND and others have infiltrated Crypto AG, Gretag and other companies to put trapdoors in export versions of crypto machines systematically
The UKUSA/ANZUS countries were able to read openly most of the world encrypted traffic during nearly 50 years
Exploited the fact that encryption algorithms were not public!

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

16 / 44

The Crypto AG Case

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

17 / 44

The Crypto AG Case

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

17 / 44

The Crypto AG Case

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

17 / 44

The Crypto AG Case

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

17 / 44

The Crypto AG Case

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

17 / 44

Backdoor Example...Among Many Others

Example drawn from a serie of a cryptomachines sold in early 90s and rigged by the NSA

Base key K (changed every day, week. . . ) and a message key Km
A Boolean function defined over Fn2 which is not correlation-immune is used as a critical primitive

How to trap the Boolean function:

Use

a

message

key

Km

=

(km0 ,

km1 , .

.

.

, kmi ,

...

,

k 2n-1
m

-1

)

of

size

2n-1

Xor it by half to the Boolean function truth table

xi  [0, 2n-1 - 1], f (xi )  f (xi )  kmi and f (xi + 2n-1)  f (xi + 2n-1)  kmi
The Boolean function remains highly correlated to a few of its input Many other tricky variants possible

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

18 / 44

The Bullrun Program

Goal: bypass operationally any cryptology protection
Tampering with national standards (NIST is specifically mentioned) to promote weak, or otherwise vulnerable cryptography (e.g Dual EC DRBG, see further) Influencing standards committees to weaken protocols (or influencing to bar strong algorithms [Gost]) Working with hardware and software vendors to weaken encryption and random number generators Identifying and cracking vulnerable keys Establishing a Human Intelligence division to infiltrate the global telecommunications industry ...
Annual budget: 250 millions $ per year.

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

19 / 44

The Bullrun Program

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

20 / 44

Dual EC RDBG RSA B-Safe

Dual Elliptic Curve Deterministic Random Bit Generator (Dual EC DRBG). Used to generate random keys. ISO and ANSI standards
Used in many environments (Blackberry, SSL/TLS)
Fixed choice of constants P and Q makes most of the backdoor (see http://blog.cryptographyengineering.com/2013/09/ the-many-flaws-of-dualecdrbg.html) Shumow-Ferguson Crypto 2007
Nobody knows where Dual EC RDBG parameters came from
In SSL/TLS, NSA can recover the pre-master secret (RSA handshake) easily

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

21 / 44

Dual EC RDBG RSA B-Safe

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

22 / 44

Dual EC RDBG RSA B-Safe

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

22 / 44

Dual EC RDBG RSA B-Safe: Timeline

2004 - RSA makes Dual EC DRBG the default CSPRNG in BSAFE
2005 - ISO/IEC 18031:2005 and NIST SP 800-90A include Dual EC DRBG.
2006 2007 Works suggesting the existence of a NSA backdoor (K. Gjosteen, Berry Schoenmakers and Andrey Sidorenko, Shumow/Fergusson)
June 2006 - NIST SP 800-90A (final) is published, includes Dual EC DRBG (defects pointed out by Kristian Gjsteen and al. not fixed).
June/Sep. 2013 Snowden leak about Bullrun and Dual EC DRBG
19 Sep. 2013 - RSA Security advises its customers to stop using Dual EC DRBG
Dec. 2013 - Reuters reports this is a result of a secret $10 million deal with NSA
April 2014 - NIST removes Dual EC DRBG as a cryptographic algorithm, recommending "that current users of Dual EC DRBG transition to one of the three remaining approved algorithms as quickly as possible"

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

23 / 44

Hot Issue

NIST standard meant that you could only get the FIPS 140-2 validation (Cryptographic Module Validation Program) only if you used the original compromised P and Q values
FIPS 140-2 statistical test suite (now NIST STS) are THE de facto world standard for cryptography statistical evaluation/validation
Passing successfully the tests does not mean your generator is secure
Can we still trust FIPS 140-2 tests?
Issue of statistical test simulability (Filiol, 2006): "if your statistical tests are known, they can be simulated to bypass them"
Cryptography statistical validation should use a secret national process/set of tests

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

24 / 44

NSA's Simon & Speck
June 2013: public release by the NSA of Speck and Simon, two NSA's families of encryption algorithms (block ciphers) Since 2014, efforts by the NSA to standardise the Simon and Speck ciphers at ISO Sept. 2017, ISO rejects Simon and Speck standardisation under the pressure of experts from the academic community and from ISO

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

25 / 44

NSA's Simon & Speck

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

26 / 44

NSA's Simon & Speck

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

26 / 44

Summary of the talk

1 Introduction: what is the issue?
2 History of known (and less known) backdoored algorithms
3 Description of BEA-1 Theoretical Background BEA-1 Presentation and Details
4 BEA-1 Cryptanalysis
5 Conclusion and Future Work

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

27 / 44

Design Transformation
Start from an algorithm with backdoor Ebackdoor In BEA-1, the backdoor is essentially made of "secret" S-boxes

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

28 / 44

Design Transformation
Start from an algorithm with backdoor Ebackdoor In BEA-1, the backdoor is essentially made of "secret" S-boxes
Use a one-way transformation S Computing E = S(Ebackdoor ) is computationally easy (here E is BEA-1) Computing Ebackdoor from E is computationally intractable unless you know some secret information S such that S  S = Identity. E exhibits all desirable cryptographic properties

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

28 / 44

Design Transformation
Start from an algorithm with backdoor Ebackdoor In BEA-1, the backdoor is essentially made of "secret" S-boxes
Use a one-way transformation S Computing E = S(Ebackdoor ) is computationally easy (here E is BEA-1) Computing Ebackdoor from E is computationally intractable unless you know some secret information S such that S  S = Identity. E exhibits all desirable cryptographic properties
BEA-1 secret S-Boxes  BEA-1 public S-Boxes.

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

28 / 44

Partition-based Trapdoors
Based on our theoretical work (Bannier, Bodin & Filiol, 2016; Bannier & Filiol, 2017)
Generalization of Paterson's work (1999)

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

29 / 44

Partition-based Trapdoors
Based on our theoretical work (Bannier, Bodin & Filiol, 2016; Bannier & Filiol, 2017)
Generalization of Paterson's work (1999) BEA-1 is inspired from the Advanced Encryption Standard (AES)
BEA-1 is a Substitution-Permutation Network (SPN) BEA-1 stands for Backdoored Encryption Algorithm version 1

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

29 / 44

Linear Partitions
Definition (Linear Partition)
A partition of Fn2 made up of all the cosets of a linear subspace is said to be linear.

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

30 / 44

Linear Partitions

Definition (Linear Partition)
A partition of Fn2 made up of all the cosets of a linear subspace is said to be linear.

Example of a linear partition over F32:

F32

21

3

0

4 5

7 6

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

30 / 44

Linear Partitions

Definition (Linear Partition)
A partition of Fn2 made up of all the cosets of a linear subspace is said to be linear.

Example of a linear partition over F32: V = {000, 101} = {0, 5},

F32

21

3

0

4 5

7 6

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

30 / 44

Linear Partitions

Definition (Linear Partition)
A partition of Fn2 made up of all the cosets of a linear subspace is said to be linear.

Example of a linear partition over F32: V = {000, 101} = {0, 5},
001 + V = {001, 100} = {1, 4},

F32

21

3

0

4 5

7 6

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

30 / 44

Linear Partitions

Definition (Linear Partition)
A partition of Fn2 made up of all the cosets of a linear subspace is said to be linear.

Example of a linear partition over F32: V = {000, 101} = {0, 5},
001 + V = {001, 100} = {1, 4}, 010 + V = {010, 111} = {2, 7},

F32

21

3

0

4 5

7 6

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

30 / 44

Linear Partitions

Definition (Linear Partition)
A partition of Fn2 made up of all the cosets of a linear subspace is said to be linear.

Example of a linear partition over F32: V = {000, 101} = {0, 5},
001 + V = {001, 100} = {1, 4}, 010 + V = {010, 111} = {2, 7}, 011 + V = {011, 110} = {3, 6},

F32

21

3

0

4 5

7 6

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

30 / 44

Linear Partitions

Definition (Linear Partition)
A partition of Fn2 made up of all the cosets of a linear subspace is said to be linear.

Example of a linear partition over F32: V = {000, 101} = {0, 5},
001 + V = {001, 100} = {1, 4}, 010 + V = {010, 111} = {2, 7}, 011 + V = {011, 110} = {3, 6},
L(V ) = {{0, 5}, {1, 4}, {2, 7}, {3, 6}}.

F32

21

3

0

4 5

7 6

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

30 / 44

Linear Partitions

The 16 linear partitions over F32:

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

31 / 44

Linear Partitions

The 16 linear partitions over F32:

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

21

3

0

4

7

56

There are 229 755 605 linear partitions over F120.

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

31 / 44

Partition-Based Backdoor SPN
Assumption
The SPN maps A to B, no matter what the round keys are.

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

A
EK
B
32 / 44

Partition-Based Backdoor SPN
A
Assumption
The SPN maps A to B, no matter what the round keys are.

Theoretical results :

A and B are linear,

EK

L(V [0])

(ESIEA - (C + V )O lab)

B
Black Hat Europe 2017

L(V [r])
32 / 44

Partition-Based Backdoor SPN
A
Assumption
The SPN maps A to B, no matter what the round keys are.

Theoretical results :

A and B are linear,

EK

A is transformed through

each step of the SPN in a

deterministic way,

(ESIEA - (C + V )O lab)

B
Black Hat Europe 2017

L(V [0])
Add k [0]
L(V [0])
Substitution
L(W [0])
Diffusion
L(V [1])
...
L(V [r -1])
Add k [r-1]
L(V [r -1])
Substitution
L(W [r -1])
Diffusion
L(V [r])
Add k [r]
L(V [r])
32 / 44

Partition-Based Backdoor SPN
A
Assumption
The SPN maps A to B, no matter what the round keys are.

Theoretical results :

A and B are linear,

EK

A is transformed through

each step of the SPN in a

deterministic way,

At least one S-box maps a linear partition to another one.
B

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

L(V [0])
Add k [0]
L(V [0])
Substitution
L(W [0])
Diffusion
L(V [1])
...
L(V [r -1])
Add k [r-1]
L(V [r -1])
Substitution
L(W [r -1])
Diffusion
L(V [r])
Add k [r]
L(V [r])
32 / 44

BEA-1 Key Features
Parameters BEA-1 operates on 80-bit data blocks 120-bit master key and twelve 80-bit round keys 11 rounds (the last round involves two round keys)

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

33 / 44

BEA-1 Key Features
Parameters BEA-1 operates on 80-bit data blocks 120-bit master key and twelve 80-bit round keys 11 rounds (the last round involves two round keys)
Primitives & base functions Key schedule & key addition (bitwise XOR) Substitution layer (involves four S-Boxes over F120) Diffusion layer (ShiftRows and MixColumns operations) Linear map M : (F120)4  (F120)4

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

33 / 44

BEA-1 Key Features
Parameters BEA-1 operates on 80-bit data blocks 120-bit master key and twelve 80-bit round keys 11 rounds (the last round involves two round keys)
Primitives & base functions Key schedule & key addition (bitwise XOR) Substitution layer (involves four S-Boxes over F120) Diffusion layer (ShiftRows and MixColumns operations) Linear map M : (F120)4  (F120)4
S-Boxes, linear map M and pseudo-codes for the different functions are given in our free book

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

33 / 44

BEA-1 Key Features

Parameters BEA-1 operates on 80-bit data blocks 120-bit master key and twelve 80-bit round keys 11 rounds (the last round involves two round keys)
Primitives & base functions Key schedule & key addition (bitwise XOR) Substitution layer (involves four S-Boxes over F120) Diffusion layer (ShiftRows and MixColumns operations) Linear map M : (F120)4  (F120)4
S-Boxes, linear map M and pseudo-codes for the different functions are given in our free book
BEA-1 is statistically compliant with FIPS 140 (US NIST standard) and resists to linear/differential attacks.

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

33 / 44

BEA-1 Round Function

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

34 / 44

BEA-1 Key Schedule

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

35 / 44

Summary of the talk
1 Introduction: what is the issue? 2 History of known (and less known) backdoored algorithms 3 Description of BEA-1 4 BEA-1 Cryptanalysis 5 Conclusion and Future Work

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

36 / 44

Linear Partitions and the Round Function

Bundle 0

1

2

3

4

5

6

7

Bit 00­09 10­19 20­29 30­39 40­49 50­59 60­69 70­79

 S0 S1 S2 S3 S0 S1 S2 S3

M

M

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

37 / 44

Linear Partitions and the Round Function

Bundle 0

1

2

3

4

5

6

7

Bit 00­09 10­19 20­29 30­39 40­49 50­59 60­69 70­79

A1

B1

C1

D1

A1

B1

C1

D1



S0 S1 S2 S3 S0 S1 S2 S3

M

M

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

37 / 44

Linear Partitions and the Round Function

Bundle 0

1

2

3

4

5

6

7

Bit 00­09 10­19 20­29 30­39 40­49 50­59 60­69 70­79

A1

B1

C1

D1

A1

B1

C1

D1



A1

B1

C1

D1

A1

B1

C1

D1

S0 S1 S2 S3 S0 S1 S2 S3

M

M

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

37 / 44

Linear Partitions and the Round Function

Bundle 0

1

2

3

4

5

6

7

Bit 00­09 10­19 20­29 30­39 40­49 50­59 60­69 70­79

A1

B1

C1

D1

A1

B1

C1

D1



A1

B1

C1

D1

A1

B1

C1

D1

S0 S1 S2 S3 S0 S1 S2 S3

A2

B2

C2

D2

A2

B2

C2

D2

M

M

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

37 / 44

Linear Partitions and the Round Function

Bundle 0

1

2

3

4

5

6

7

Bit 00­09 10­19 20­29 30­39 40­49 50­59 60­69 70­79

A1

B1

C1

D1

A1

B1

C1

D1



A1

B1

C1

D1

A1

B1

C1

D1

S0 S1 S2 S3 S0 S1 S2 S3

A2

B2

C2

D2

A2

B2

C2

D2

A2

B2

C2

D2

A2

B2

C2

D2

M

M

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

37 / 44

Linear Partitions and the Round Function

Bundle 0

1

2

3

4

5

6

7

Bit 00­09 10­19 20­29 30­39 40­49 50­59 60­69 70­79

A1

B1

C1

D1

A1

B1

C1

D1



A1

B1

C1

D1

A1

B1

C1

D1

S0 S1 S2 S3 S0 S1 S2 S3

A2

B2

C2

D2

A2

B2

C2

D2

A2

B2

C2

D2

A2

B2

C2

D2

M

M

A1

B1

C1

D1

A1

B1

C1

D1

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

37 / 44

Principle of the Cryptanalysis

15

2

1

2

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

38 / 44

Principle of the Cryptanalysis

15

2

1

2

F

1

4

12

3

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

38 / 44

Principle of the Cryptanalysis

15

2

1

2

F

1

4

12

3

k

1

3

4

12

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

38 / 44

Principle of the Cryptanalysis

Right Key

15

2

1

2

F

1

4

12

3

k

1

3

1

3

4

12

4

12

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

Wrong Key

1

3

4

12

38 / 44

Principle of the Cryptanalysis

Right Key

15

2

1

2

F

1

4

1

4

12

3

12

3

k

k

1

3

1

3

4

12

4

12

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

Wrong Key

1

3

4

12

38 / 44

Principle of the Cryptanalysis

Right Key

15

2

15

2

1

2

1

2

F

F -1

1

4

1

4

12

3

12

3

k

k

1

3

1

3

4

12

4

12

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

Wrong Key

1

3

4

12

38 / 44

Principle of the Cryptanalysis

Right Key

15

2

15

2

1

2

1

2

F

F -1

1

4

1

4

12

3

12

3

k

k

1

3

1

3

4

12

4

12

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

Wrong Key

4 3
k
1 4

12 1
3 12
38 / 44

Principle of the Cryptanalysis

Right Key

15

2

15

2

1

2

1

2

F

F -1

1

4

1

4

12

3

12

3

k

k

1

3

1

3

4

12

4

12

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

Wrong Key

4

4

10

2

F -1

4

12

3

1

k

1

3

4

12

38 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

Find the output coset of (A2 × B2 × C2 × D2)2.

M

M

k010 k110 k210 k310 k410 k510 k610 k710

S0 S1 S2 S3 S0 S1 S2 S3

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

M

M

k010 k110 k210 k310 k410 k510 k610 k710

S0 S1 S2 S3 S0 S1 S2 S3

Brute force: (k011, k111, k211, k311, k411, k511, k611, k711) Test the 215 saved keys: (k011, k111, k211, k311, k411, k511, k611, k711)
Save the 215 best keys: (k011, k111, k211, k311, k411, k511, k611, k711)

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

M

M

k010 k110 k210 k310 k410 k510 k610 k710

S0 S1 S2 S3 S0 S1 S2 S3

Brute force: (k011, k111, k211, k311, k411, k511, k611, k711) Test the 215 saved keys: (k011, k111, k211, k311, k411, k511, k611, k711)
Save the 215 best keys: (k011, k111, k211, k311, k411, k511, k611, k711)

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

M

M

k010 k110 k210 k310 k410 k510 k610 k710

S0 S1 S2 S3 S0 S1 S2 S3

Brute force: (k011, k111, k211, k311, k411, k511, k611, k711) Test the 215 saved keys: (k011, k111, k211, k311, k411, k511, k611, k711)
Save the 215 best keys: (k011, k111, k211, k311, k411, k511, k611, k711)

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

M

M

k010 k110 k210 k310 k410 k510 k610 k710

S0 S1 S2 S3 S0 S1 S2 S3

Brute force: (k011, k111, k211, k311, k411, k511, k611, k711) Test the 215 saved keys: (k011, k111, k211, k311, k411, k511, k611, k711)
Save the 215 best keys: (k011, k111, k211, k311, k411, k511, k611, k711)

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

M

M

k010 k110 k210 k310 k410 k510 k610 k710

S0 S1 S2 S3 S0 S1 S2 S3

Brute force: (k011, k111, k211, k311, k411, k511, k611, k711) Test the 215 saved keys: (k011, k111, k211, k311, k411, k511, k611, k711)
Save the 215 best keys: (k011, k111, k211, k311, k411, k511, k611, k711)

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

M

M

k010 k110 k210 k310 k410 k510 k610 k710

S0 S1 S2 S3 S0 S1 S2 S3

Brute force: (k011, k111, k211, k311, k411, k511, k611, k711) Test the 215 saved keys: (k011, k111, k211, k311, k411, k511, k611, k711)
Save the 215 best keys: (k011, k111, k211, k311, k411, k511, k611, k711)

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

M

M

k010 k110 k210 k310 k410 k510 k610 k710

S0 S1 S2 S3 S0 S1 S2 S3

Brute force: (k011, k111, k211, k311, k411, k511, k611, k711) Test the 215 saved keys: (k011, k111, k211, k311, k411, k511, k611, k711)
Save the 215 best keys: (k011, k111, k211, k311, k411, k511, k611, k711)

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

According to the key schedule:
k010 = k011  k411 k110 = k111  k511 k210 = k211  k611 k310 = k311  k711

M

M

k010 k110 k210 k310 k410 k510 k610 k710

S0 S1 S2 S3 S0 S1 S2 S3

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

Test the 215 saved keys: (k011, k111, k211, k311, k411, k511, k611, k711)

M

M

k010 k110 k210 k310 k410 k510 k610 k710

S0 S1 S2 S3 S0 S1 S2 S3

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

Save the best key: (k011, k111, k211, k311, k411, k511, k611, k711)

M

M

k010 k110 k210 k310 k410 k510 k610 k710

S0 S1 S2 S3 S0 S1 S2 S3

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

Observe that:
(k410, k510, k610, k710) = M(k410, k510, k610, k710)

M

k410 k510 k610 k710

k010 k110 k210 k310

M

S0 S1 S2 S3 S0 S1 S2 S3

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

M

k410 k510 k610 k710

k010 k110 k210 k310

M

S0 S1 S2 S3 S0 S1 S2 S3

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

Brute force: (k410, k510, k610, k710) Test the 215 saved keys: (k410, k510, k610, k710)

M

k410 k510 k610 k710

k010 k110 k210 k310

M

S0 S1 S2 S3 S0 S1 S2 S3

Save the 215 best keys: (k410, k510, k610, k710)

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

Brute force: (k410, k510, k610, k710) Test the 215 saved keys: (k410, k510, k610, k710)

M

k410 k510 k610 k710

k010 k110 k210 k310

M

S0 S1 S2 S3 S0 S1 S2 S3

Save the 215 best keys: (k410, k510, k610, k710)

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

Brute force: (k410, k510, k610, k710) Test the 215 saved keys: (k410, k510, k610, k710)

M

k410 k510 k610 k710

k010 k110 k210 k310

M

S0 S1 S2 S3 S0 S1 S2 S3

Save the 215 best keys: (k410, k510, k610, k710)

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Overview of the Cryptanalysis

k09

k19

k29

k39

k49

k59

k69

k79

S0 S1 S2 S3 S0 S1 S2 S3

For each saved key, deduce the cipher key and test it

M

k410 k510 k610 k710

k010 k110 k210 k310

M

S0 S1 S2 S3 S0 S1 S2 S3

k011 k111 k211 k311 k411 k511 k611 k711

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

39 / 44

Crytanalysis Summary
Probabilities for the modified cipher S0, S1, S2: 944/1024, S3: 925/1024

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

40 / 44

Crytanalysis Summary
Probabilities for the modified cipher S0, S1, S2: 944/1024, S3: 925/1024 Round function: (944/1024)6 × (925/1024)2  2-1

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

40 / 44

Crytanalysis Summary
Probabilities for the modified cipher S0, S1, S2: 944/1024, S3: 925/1024 Round function: (944/1024)6 × (925/1024)2  2-1 Full cipher: (2-1)11 = 2-11

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

40 / 44

Crytanalysis Summary
Probabilities for the modified cipher S0, S1, S2: 944/1024, S3: 925/1024 Round function: (944/1024)6 × (925/1024)2  2-1 Full cipher: (2-1)11 = 2-11 If 30 000 plaintexts lie in the same coset, 30 000 × 2-11  15 ciphertexts lie in the same coset on average

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

40 / 44

Crytanalysis Summary
Probabilities for the modified cipher S0, S1, S2: 944/1024, S3: 925/1024 Round function: (944/1024)6 × (925/1024)2  2-1 Full cipher: (2-1)11 = 2-11 If 30 000 plaintexts lie in the same coset, 30 000 × 2-11  15 ciphertexts lie in the same coset on average
Complexity of the cryptanalysis Data: 30 000 plaintext/ciphertext pairs (2 × 300 Kb)

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

40 / 44

Crytanalysis Summary
Probabilities for the modified cipher S0, S1, S2: 944/1024, S3: 925/1024 Round function: (944/1024)6 × (925/1024)2  2-1 Full cipher: (2-1)11 = 2-11 If 30 000 plaintexts lie in the same coset, 30 000 × 2-11  15 ciphertexts lie in the same coset on average
Complexity of the cryptanalysis Data: 30 000 plaintext/ciphertext pairs (2 × 300 Kb) Time:  10s on a laptop (Core i7, 4 cores, 2.50GHz)

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

40 / 44

Crytanalysis Summary
Probabilities for the modified cipher S0, S1, S2: 944/1024, S3: 925/1024 Round function: (944/1024)6 × (925/1024)2  2-1 Full cipher: (2-1)11 = 2-11 If 30 000 plaintexts lie in the same coset, 30 000 × 2-11  15 ciphertexts lie in the same coset on average
Complexity of the cryptanalysis Data: 30 000 plaintext/ciphertext pairs (2 × 300 Kb) Time:  10s on a laptop (Core i7, 4 cores, 2.50GHz) Probability of success > 95%

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

40 / 44

Demo
Cryptanalysis demo

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

41 / 44

Summary of the talk
1 Introduction: what is the issue? 2 History of known (and less known) backdoored algorithms 3 Description of BEA-1 4 BEA-1 Cryptanalysis 5 Conclusion and Future Work

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

42 / 44

Conclusion
Proposition of an AES-like backdoored algorithm (80-bit block, 120-bit key, 11 rounds)
The backdoor is at the design level Resistant to most known cryptanalyses But absolutely unsuitable for actual security Illustrates the issue of using foreign encryption algorithms which might be backdoored

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

43 / 44

Conclusion
Proposition of an AES-like backdoored algorithm (80-bit block, 120-bit key, 11 rounds)
The backdoor is at the design level Resistant to most known cryptanalyses But absolutely unsuitable for actual security Illustrates the issue of using foreign encryption algorithms which might be backdoored
Future work First step in a larger research work Use of more sophisticated combinatorial structures Considering key space partionning Other backdoored algorithms to be published.

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

43 / 44

Conclusion
Thank you for your attention Questions & Answers

(ESIEA - (C + V )O lab)

Black Hat Europe 2017

44 / 44

