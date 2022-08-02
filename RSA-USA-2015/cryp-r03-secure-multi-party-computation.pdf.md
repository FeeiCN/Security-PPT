Efficient Leakage Resilient Circuit Compilers
Marcin Andrychowicz, Warsaw University, Poland Ivan Damgård, Aarhus University, Denmark
Stefan Dziembowski, Warsaw University, Poland Sebastian Faust, EPFL, Switzerland
Antigoni Polychroniadou, Aarhus University, Denmark

Theory
Cryptographic algorithms are often modeled as `black boxes'
E.g. Internal computation is opaque to external adversaries. Security is proven under various hardness assumptions.

EM Radiation

Reality
Computation Internals Leak

Cache

Power Consumption

Acoustic

Probing

Timing

Motivation
Many provably secure cryptosystems can be broken by side-channel attacks

Two Paradigms to Fight Leakage Attacks
1. Consider Leakage at design level Only security of specific schemes.
How to securely implement any scheme?
Wanted: 2. Leakage resilient Compiler
Transform any circuit to a leakage resilient circuit secure in a strong black-box sense.

Def.: Circuit Compilers
Circuit Compiler

Def.: Circuit Compilers

C

C

Encoder

+

...

+

...

x Circuit Compiler

-

x

...

Decoder

...

...

Encoder

-

Def.: Circuit Compilers

C

C

Encoder

+

...

+

...

x Circuit Compiler

-

x

...

Decoder

...

...

Encoder

-

Indistinguishable
Even given leakage, execution "looks like" black-box access to C(.)

Def.: Circuit Compilers

C

C

Encoder

+

...

+

...

x Circuit Compiler

-

x

...

Decoder

...

Encoder

...

-

Goal:

Reduce the overhead Indistinguishable

induced by the compiler

Even given leakage, execution "looks like" black-box access to C(.)

Def.: Circuit Compilers

C

In all previous woCrks

Encoder

+

the transformed circuit C has size at

...

+

...

xleast COir(cku2i|tCC|o)m, pwilherere

-

k is the security parameter.

x

...

Decoder

...

Encoder

...

-

Goal:

Reduce the overhead Indistinguishable

induced by the compiler

Even given leakage, execution "looks like" black-box access to C(.)

Our Goal
Build Efficient Leakage Resilient Compilers

Is it possible to construct leakage resilient compilers with at most linear overhead?
· All previous works introduce at least quadratic overhead.

Prior Work on General Compilers
Three Leakage Models:
`Local' Bounded Wire-Probing: [ISW03,...]
`Local' Only Computation (OC) Leakage/ Split State Model: [MR04,...]
`Global' Computational Continuous Weak Leakage i.e. AC0 leakage Functions [FRRTV10,...]

Our Results
Efficient Compliers:
`Local' Wire-Probing: O(polylog(k) ·|C|log |C|) Previous Best Overhead: O(k2|C|) by [ISW03]

Using Techniques from secure
MPC

`Local' OC Leakage : O(k log k log log k|C|) Previous Best Overhead: (k4|C|) by [DF12] and (k3|C|) by [GR12]
This talk `Global' Computational Continuous Weak Leakage: O(k·|C|log|C|) Previous Best Overhead: O(k2|C|) by [FRRTV10] and O(k3|C|) by [R13]

Our Result on Global Computational Weak Leakage
· Informal Theorem : A compiler that makes any
circuit resilient to computationally weak leakages. The compiler increases the circuit size by a factor of O(k).
· Global adaptive leakage · Arbitrary total leakage
However we must assume something [MR04]: · Leakage function is computationally weak. · Simple opaque gates.

Decoder

...

The Compiler
C
+
x
-

...

...

...

...

Encoder

Encoder

...

Encoder

The Compiler: From Wires to Wire Bundles
C
+
x
-

...

...

Decoder

...

...

Encoder

Packed Secret Sharing (PSS)
· PSS is a central tool in information theoretic secure MPC protocols.

Standard Secret Sharing :

f

Degree of f denoted by d

P1 P2 P3 P4 P5 P6 P7

Packed Secret Sharing (PSS)
· PSS is a central tool in information theoretic secure MPC protocols.

Packed Secret Sharing (PSS) :
l=3

f
Transform circuit to work on PSS with O(log|C|) overhead [DIK10]*

*Introduces Permutation gates. P1 P2 P3 P4 P5 P6 P7

· Every wire is encoded with PSS.

· Inputs are encoded; outputs are decoded.

C

C

Encoder

+

...

+

...

x

-

x

...

...

-

...

Decoder

Encoder

Each wire w

Wire bundle that carries the encoding of w, e.g. k shares of w. Notation: (w1,...,wk)=[w]d

PSS is Secure Against AC0 Leakages
A function is in AC0 if it can be computed by a poly-size O(1) depth Boolean circuit with unbounded fan-in AND, OR (and NOT) gates.
· PSS Encoding is AC0 indistinguishable, i.e. Inner product hard to compute in AC0.

...

Encoder

The Compiler: From Gates to Gadgets
C
+
x
-

...

...

Decoder

...

...

Encoder

· Every gate is replaced by a gadget operating on encoded PSS bundles.

C

C

Encoder

+
x
-

...

...

+
x

...

...

...

-

Decoder

Encoder

Gates

Gadgets: built from normal gates and opaque gates and operate on encodings.

Opaque Gates
[G89,GoldOstr95]...Leak-free processor: oblivious RAM [MR04], [DP08], [GKR08], [DF12]...Leak-free memory: "only computation leaks", one-time programs [FRRTV10],... Opaque Gates [GR12],[R13]... Ciphertext banks
Opaque Gates: simple gates that sample from a fixed distribution e.g.: securely draw strings with inner product 0.  Stateless: No secrets are stored  Small and simple  Computation independent: No inputs, so can be pre-computed

...

Encoder

The Compiler: Addition & Subtraction Gadgets
C
+
x
-

...

...

Decoder

...

...

Encoder

...

Encoder

The Compiler: Addition & Subtraction Gadgets
C
+
x
-

...

...

Decoder

...

...

Encoder

The Compiler: Addition & Subtraction Gadgets
Goal : c=a+b[a+b]d [a]d +[b]d
[0]d Opaque gate 1. [a+b]d = [a]d+[b]d+[0]d OR [a-b]d = [a]d-[b]d+[0]d

...

Encoder

The Compiler: Multiplication Gadgets
C
+
x
-

...

...

Decoder

...

...

Encoder

...

Encoder

The Compiler: Multiplication Gadgets
C
+
x
-

...

...

Decoder

...

...

Encoder

The Compiler: Multiplication Gadgets

Goal: c = ab  [ab]d  [a]d[b]d

[r]d,[r]2d  Opaque gate 1. [ab]2d = [a]d[b]d 2. [ab +r]2d =[ab]2d +[r]2d 3. (ab+r)  Decode([ab+r]2d) 4. [ab+r] d Encode (ab+r) 5. [ab]d = [ab+r]d - [r]d

Permutation gadget follows
in the same fashion.

Compiler: High-Level
· Circuit topology is preserved. · Every wire is encoded yielding a wire bundle;
Inputs are encoded; outputs are decoded. · PSS Encoding is AC0 indistinguishable · Every gate is converted into a gadget
operating on encodings.

Security of the Compiled Circuit
Prove security via `shallow' Reconstructors per gadget (technique introduced in [FRRTV10])
· Reconstructor: on input the inputs and the outputs of a gadget is able to simulate its internals in a way that looks indistinguishable for leakages from AC0.

Conclusion
Three efficient circuit compilers ....
 compile any circuit
 `Local' Wire-Probing  `Local' OC Leakage  `Global' Computational weak Leakage
Question
Connection to Obfuscation

Thank you!

Optimally Efficient Multi-Party Fair Exchange and Fair Secure Multi-Party Computation
Handan Kilinç 1 Alptekin Küpçü 2
1EPFL, Koç University 2Koç University
CT-RSA, 2015

Handan Kilinç , Alptekin Küpçü

1/48

Optimally Efficient MFE and Fair SMPC

1 / 48

Outline

1 Introduction Multi-Party Fair Exchange Definitions
2 Our New Protocols MFE Protocol
Resolve Protocols
Fair and Secure MPC
3 Conclusion Security and Fairness Comparison with Previous Works Conclusion

Handan Kilinç , Alptekin Küpçü

2/48

Optimally Efficient MFE and Fair SMPC

2 / 48

Outline

Introduction Multi-Party Fair Exchange

1 Introduction Multi-Party Fair Exchange Definitions
2 Our New Protocols MFE Protocol
Resolve Protocols
Fair and Secure MPC
3 Conclusion Security and Fairness Comparison with Previous Works Conclusion

Handan Kilinç , Alptekin Küpçü

3/48

Optimally Efficient MFE and Fair SMPC

3 / 48

MFE

Introduction Multi-Party Fair Exchange

Exchange Protocol Two or more parties exchange their items with the other parties.
Fair Exchange Protocol The exchange protocol is fair if in the end of
All parties receive their desired items or, None of them receives any item.

Handan Kilinç , Alptekin Küpçü

4/48

Optimally Efficient MFE and Fair SMPC

4 / 48

MFE

Introduction Multi-Party Fair Exchange

Exchange Protocol Two or more parties exchange their items with the other parties.
Fair Exchange Protocol The exchange protocol is fair if in the end of
All parties receive their desired items or, None of them receives any item.

Handan Kilinç , Alptekin Küpçü

4/48

Optimally Efficient MFE and Fair SMPC

4 / 48

Introduction Multi-Party Fair Exchange
Where is MFE used?

Handan Kilinç , Alptekin Küpçü

5/48

Optimally Efficient MFE and Fair SMPC

5 / 48

Introduction Multi-Party Fair Exchange
Where is MFE used?

Handan Kilinç , Alptekin Küpçü

5/48

Optimally Efficient MFE and Fair SMPC

5 / 48

Introduction Multi-Party Fair Exchange
Where is MFE used?

Handan Kilinç , Alptekin Küpçü

5/48

Optimally Efficient MFE and Fair SMPC

5 / 48

Introduction Multi-Party Fair Exchange
Where is MFE used?

Handan Kilinç , Alptekin Küpçü

5/48

Optimally Efficient MFE and Fair SMPC

5 / 48

MFE Topologies

Introduction Multi-Party Fair Exchange

Handan Kilinç , Alptekin Küpçü

6/48

Optimally Efficient MFE and Fair SMPC

6 / 48

Optimistic MFE

Introduction Multi-Party Fair Exchange

Fairness is not possible without trusted third party (TTP). There is a lack of TTP. So the efficiency is important.

Handan Kilinç , Alptekin Küpçü

7/48

Optimally Efficient MFE and Fair SMPC

7 / 48

Optimistic MFE

Introduction Multi-Party Fair Exchange

Fairness is not possible without trusted third party (TTP). There is a lack of TTP. So the efficiency is important.

Handan Kilinç , Alptekin Küpçü

7/48

Optimally Efficient MFE and Fair SMPC

7 / 48

Optimistic MFE

Introduction Multi-Party Fair Exchange

Fairness is not possible without trusted third party (TTP) There is a lack of TTP. So efficiency is important.
Optimistic MFE In an optimistic protocol, the TTP is involved in the protocol only when there is a malicious behavior.

Handan Kilinç , Alptekin Küpçü

8/48

Optimally Efficient MFE and Fair SMPC

8 / 48

Optimistic MFE

Introduction Multi-Party Fair Exchange

Fairness is not possible without trusted third party (TTP) There is a lack of TTP. So efficiency is important.
Optimistic MFE In an optimistic protocol, the TTP is involved in the protocol only when there is a malicious behavior.

Handan Kilinç , Alptekin Küpçü

8/48

Optimally Efficient MFE and Fair SMPC

8 / 48

Outline

Introduction Definitions

1 Introduction Multi-Party Fair Exchange Definitions
2 Our New Protocols MFE Protocol
Resolve Protocols
Fair and Secure MPC
3 Conclusion Security and Fairness Comparison with Previous Works Conclusion

Handan Kilinç , Alptekin Küpçü

9/48

Optimally Efficient MFE and Fair SMPC

9 / 48

Introduction Definitions
Multi-Party Computation
MPC A group of parties (P1, P2, ..., Pn) with their private inputs wi desires to compute a function .
This computation is secure when the parties do not learn anything beyond what is revealed by the output of the computation. This computation is fair if either all of the parties learn their corresponding output in the end of computation, or none of them learns.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

10 / 48

10/48

Introduction Definitions
Multi-Party Computation
MPC A group of parties (P1, P2, ..., Pn) with their private inputs wi desires to compute a function .
This computation is secure when the parties do not learn anything beyond what is revealed by the output of the computation. This computation is fair if either all of the parties learn their corresponding output in the end of computation, or none of them learns.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

10 / 48

10/48

Introduction Definitions
Multi-Party Computation
MPC A group of parties (P1, P2, ..., Pn) with their private inputs wi desires to compute a function .
This computation is secure when the parties do not learn anything beyond what is revealed by the output of the computation. This computation is fair if either all of the parties learn their corresponding output in the end of computation, or none of them learns.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

10 / 48

10/48

MFE is MPC

Introduction Definitions

Multi-party fair exchange is multi-party computation. Each party Pi has item fi . They need the compute the functionality  where
(f1, f2, ..., fn) = (1, 2, ..., n)

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

11 / 48

11/48

MFE id MPC

Introduction Definitions

For the complete topology:

i (f1, ..., fn) = (f1, ..., fi-1, fi+1, ..., fn)

For the ring topology: if i = 1
else

i (f1, ..., fn) = fn i (f1, ..., fn) = fi-1

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

12 / 48

12/48

Introduction Definitions
Ideal World for Fair and Secure MPC

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

13 / 48

13/48

Introduction Definitions
Ideal World for Fair and Secure MPC

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

14 / 48

14/48

Introduction Definitions
Ideal World for Fair and Secure MPC

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

15 / 48

15/48

Introduction Definitions
Ideal World for Fair and Secure MPC

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

16 / 48

16/48

Introduction Definitions
Real World for MPC

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

17 / 48

17/48

Introduction Definitions
Secure and Fair MPC


Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

18 / 48

18/48

Outline

Our New Protocols MFE Protocol

1 Introduction Multi-Party Fair Exchange Definitions
2 Our New Protocols MFE Protocol
Resolve Protocols
Fair and Secure MPC
3 Conclusion Security and Fairness Comparison with Previous Works Conclusion

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

19 / 48

19/48

Our New Protocols MFE Protocol
Overview of MFE protocol
The parties are P1, P2, ..., Pn and each party Pi has item fi . They want the items of all parties (complete topology). The TTP and his public key pk is known by all parties.
Phase 1: Setup Phase 2: Encrypted Item Exchange Phase 3: Decryption Share Exchange

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

20 / 48

20/48

Our New Protocols MFE Protocol
Phase 1: Setup Phase
They agree on two timeouts t1 and t2 and know TTP's public key

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

21 / 48

21/48

Our New Protocols MFE Protocol
Phase 1: Setup Phase

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

21 / 48

21/48

Our New Protocols MFE Protocol
Phase 1: Setup Phase

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

21 / 48

21/48

Our New Protocols MFE Protocol
Phase 1: Setup Phase

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

21 / 48

21/48

Our New Protocols MFE Protocol
Phase 1: Setup Phase

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

21 / 48

21/48

Our New Protocols MFE Protocol
Phase 1: Setup Phase

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

21 / 48

21/48

Our New Protocols MFE Protocol
Phase 1: Setup Phase

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

21 / 48

21/48

Our New Protocols MFE Protocol
Phase 1: Setup Phase

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

21 / 48

21/48

Our New Protocols MFE Protocol
Phase 1: Setup Phase

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

21 / 48

21/48

Our New Protocols MFE Protocol
Phase 1: Setup Phase

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

21 / 48

21/48

Our New Protocols MFE Protocol
Phase 1: Setup Phase

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

21 / 48

21/48

Our New Protocols MFE Protocol
Phase 2: Verifiable Encryption of Items

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

22 / 48

22/48

Our New Protocols MFE Protocol
Phase 2: Verifiable Encryption of Items

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

22 / 48

22/48

Our New Protocols MFE Protocol
Phase 2: Verifiable Encryption of Items

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

22 / 48

22/48

Our New Protocols MFE Protocol
Phase 2: Verifiable Encryption of Items

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

22 / 48

22/48

Our New Protocols MFE Protocol
Phase 2: Verifiable Encryption of Items

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

22 / 48

22/48

Our New Protocols MFE Protocol
Phase 2: Verifiable Encryption of Items

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

22 / 48

22/48

Our New Protocols MFE Protocol
Phase 2: Verifiable Encryption of Items
If any party does not receive verifiable encryption, (s)he aborts.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

22 / 48

22/48

Our New Protocols MFE Protocol
Phase 2: Decryption Share Encryption

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

23 / 48

23/48

Our New Protocols MFE Protocol
Phase 2: Decryption Share Encryption

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

23 / 48

23/48

Our New Protocols MFE Protocol
Phase 2: Decryption Share Encryption

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

23 / 48

23/48

Our New Protocols MFE Protocol
Phase 2: Decryption Share Encryption

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

23 / 48

23/48

Our New Protocols MFE Protocol
Phase 2: Decryption Share Encryption

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

23 / 48

23/48

Our New Protocols MFE Protocol
Phase 2: Decryption Share Encryption
If any party does not receive verifiable escrow or receive wrong one(s) before t1, (s)he does Resolve 1.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

23 / 48

23/48

Our New Protocols MFE Protocol
Phase 3: Decryption Share Exchange

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

24 / 48

24/48

Our New Protocols MFE Protocol
Phase 3: Decryption Share Exchange

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

24 / 48

24/48

Our New Protocols MFE Protocol
Phase 3: Decryption Share Exchange

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

24 / 48

24/48

Our New Protocols MFE Protocol
Phase 3: Decryption Share Exchange

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

24 / 48

24/48

Our New Protocols MFE Protocol
Phase 3: Decryption Share Exchange

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

24 / 48

24/48

Our New Protocols MFE Protocol
Phase 3: Decryption Share Exchange

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

24 / 48

24/48

Our New Protocols MFE Protocol
Phase 3: Decryption Share Exchange
If any party does not receive decryption shares or receive wrong one(s) before t2, (s)he does Resolve 2.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

24 / 48

24/48

Resolve 1

Our New Protocols MFE Protocol

Parties do not learn any decryption shares here. They can just complain about other parties to the TTP. The TTP creates a fresh complaintList for the protocol with parameters id, t1, t2.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

25 / 48

25/48

Resolve 2

Our New Protocols MFE Protocol

The party Pi , who comes for Resolve 2 between t1 and t2, gives all verifiable escrows that he has already received from the other parties and his own verifiable escrow to the TTP.
The TTP uses these verifiable escrows to save the decryption shares required to solve the complaints in the complaintList.
If the complaintList is not empty in the end, Pi comes after t2 for Resolve 3. Otherwise, TTP decrypts the verifiable escrow and gives decryption shares.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

26 / 48

26/48

Resolve 3

Our New Protocols MFE Protocol

If the complaintList still has parties, even after t2, the TTP answers each resolving party saying that the protocol is aborted, which means nobody is able to learn any item.
If the complaintList is empty, the TTP decrypts any verifiable escrow that is given to him.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

27 / 48

27/48

Outline

Our New Protocols Fair and Secure MPC

1 Introduction Multi-Party Fair Exchange Definitions
2 Our New Protocols MFE Protocol
Resolve Protocols
Fair and Secure MPC
3 Conclusion Security and Fairness Comparison with Previous Works Conclusion

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

28 / 48

28/48

Our New Protocols Fair and Secure MPC
Making SMPC Fair with MFE
SMPC Parties are able to compute the following function in a secure way by using SMPC protocol.
(w1, ..., wn) = (1(w1, ..., wn), ..., n(w1, ..., wn))

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

29 / 48

29/48

Our New Protocols Fair and Secure MPC
Making SMPC Fair with MFE

Fair SMPC Change input of the each Pi as zi = (wi , xi ). Compute the following functionality with SMPC.

i (z1, z2, ..., zn) = (Ei (i (w1, ..., wn)), {gxj }1jn)

where

Ei (i (w1, ..., wn)) = (gri , i hri )

Execute Phase 3 of MFE protocol.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

30 / 48

30/48

Our New Protocols Fair and Secure MPC
Making SMPC Fair with MFE

Fair SMPC Change input of the each Pi as zi = (wi , xi ). Compute the following functionality with SMPC.

i (z1, z2, ..., zn) = (Ei (i (w1, ..., wn)), {gxj }1jn)

where

Ei (i (w1, ..., wn)) = (gri , i hri )

Execute Phase 3 of MFE protocol.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

30 / 48

30/48

Our New Protocols Fair and Secure MPC
Making SMPC Fair with MFE

Fair SMPC Change input of the each Pi as zi = (wi , xi ). Compute the following functionality with SMPC.

i (z1, z2, ..., zn) = (Ei (i (w1, ..., wn)), {gxj }1jn)

where

Ei (i (w1, ..., wn)) = (gri , i hri )

Execute Phase 3 of MFE protocol.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

30 / 48

30/48

Our New Protocols Fair and Secure MPC
Making SMPC Fair with MFE

Fair SMPC Change input of the each Pi as zi = (wi , xi ). Compute the following functionality with SMPC.

i (z1, z2, ..., zn) = (Ei (i (w1, ..., wn)), {gxj }1jn)

where

Ei (i (w1, ..., wn)) = (gri , i hri )

Execute Phase 3 of MFE protocol.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

30 / 48

30/48

Outline

Conclusion Security and Fairness

1 Introduction Multi-Party Fair Exchange Definitions
2 Our New Protocols MFE Protocol
Resolve Protocols
Fair and Secure MPC
3 Conclusion Security and Fairness Comparison with Previous Works Conclusion

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

31 / 48

31/48

Why MFE is fair?

Conclusion Security and Fairness

Parties do not learn anything without any missing decryption share.  All parties depend each other. So even though n - 1 malicious party exist, they can not exclude an honest party.
If an honest party does not receive verifiable escrow, (s)he does not continue.  This obliges malicious party to send his verifiable escrow to the honest party, otherwise malicious one cannot learn anything.
TTP does not decrypt verifiable escrow and send any decryption share until it is sure that he has all missing verifiable escrows.  Resolve protocols preserve fairness.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

32 / 48

32/48

Why MFE is fair?

Conclusion Security and Fairness

Parties do not learn anything without any missing decryption share.  All parties depend each other. So even though n - 1 malicious party exist, they can not exclude an honest party.
If an honest party does not receive verifiable escrow, (s)he does not continue.  This obliges malicious party to send his verifiable escrow to the honest party, otherwise malicious one cannot learn anything.
TTP does not decrypt verifiable escrow and send any decryption share until it is sure that he has all missing verifiable escrows.  Resolve protocols preserve fairness.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

32 / 48

32/48

Why MFE is fair?

Conclusion Security and Fairness

Parties do not learn anything without any missing decryption share.  All parties depend each other. So even though n - 1 malicious party exist, they can not exclude an honest party.
If an honest party does not receive verifiable escrow, (s)he does not continue.  This obliges malicious party to send his verifiable escrow to the honest party, otherwise malicious one cannot learn anything.
TTP does not decrypt verifiable escrow and send any decryption share until it is sure that he has all missing verifiable escrows.  Resolve protocols preserve fairness.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

32 / 48

32/48

Conclusion Security and Fairness
Privacy in MFE and MPC
Privacy The privacy against the TTP is preserved. He just learns some decryption shares, but he cannot decrypt the encryption of exchanged items, since he never gets the encrypted items.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

33 / 48

33/48

Outline

Conclusion Comparison with Previous Works

1 Introduction Multi-Party Fair Exchange Definitions
2 Our New Protocols MFE Protocol
Resolve Protocols
Fair and Secure MPC
3 Conclusion Security and Fairness Comparison with Previous Works Conclusion

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

34 / 48

34/48

Conclusion Comparison with Previous Works
Previous works in Complete Topology

Garay & MacKenzie
Baum & Waidner Mukhamedov & Ryan Mauw et al.
Asokan et al.
Ours

Solution
MPCS
MPCS
MPCS MPCS MFE MFE

Topology
Complete
Complete
Complete Complete Any Any

Round Complexity
O(n2)
O(tn)
O(n) O(n) O(1) O(1)

Number of Messages
O(n3)
O(tn2)
O(n3) O(n2)
O(n3) O(n2)

Broadcast Yes
Yes
Yes Yes Yes No

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

35 / 48

35/48

Conclusion Comparison with Previous Works
Previous works in Ring Topology

Bao et al. González & Markowitch
Liu & Hu Ours

Number Messages
O(n)
O(n2)
O(n) O(n2)

All or None
No
No
No Yes

TTP-Party Dependency
Yes
Yes
Yes No

TTP Privacy Not Private Not Private Not Private Private

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

36 / 48

36/48

Conclusion Comparison with Previous Works
Previous works in fair SMPC

Garay et al.
Bentov & Kumaresan Andrychowicz
et al. Ours

Technique TTP

Gradual Release

No

Number of Rounds
O()

Bitcoin Yes Constant

Bitcoin MFE

Yes Constant Yes Constant

Proof Technique
NFS
NFS
NFS FS

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

37 / 48

37/48

Outline

Conclusion Conclusion

1 Introduction Multi-Party Fair Exchange Definitions
2 Our New Protocols MFE Protocol
Resolve Protocols
Fair and Secure MPC
3 Conclusion Security and Fairness Comparison with Previous Works Conclusion

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

38 / 48

38/48

Our Contributions

Conclusion Conclusion

MFE
We design a MFE protocol requires only O(n2) messages and constant number of rounds for n parties.
Our MFE optimally (in complete topology) guarantees fairness (for honest parties) even when n - 1 out of n parties are malicious and colluding.
We show how to employ our MFE protocol for any exchange topology, with the performance improving as the topology gets sparser.
We formulate MFE as a secure multi-party computation protocol. We then prove security and fairness via ideal-real world simulation [9].

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

39 / 48

39/48

Our Contributions

Conclusion Conclusion

MFE
We design a MFE protocol requires only O(n2) messages and constant number of rounds for n parties.
Our MFE optimally (in complete topology) guarantees fairness (for honest parties) even when n - 1 out of n parties are malicious and colluding.
We show how to employ our MFE protocol for any exchange topology, with the performance improving as the topology gets sparser.
We formulate MFE as a secure multi-party computation protocol. We then prove security and fairness via ideal-real world simulation [9].

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

39 / 48

39/48

Our Contributions

Conclusion Conclusion

MFE
We design a MFE protocol requires only O(n2) messages and constant number of rounds for n parties.
Our MFE optimally (in complete topology) guarantees fairness (for honest parties) even when n - 1 out of n parties are malicious and colluding.
We show how to employ our MFE protocol for any exchange topology, with the performance improving as the topology gets sparser.
We formulate MFE as a secure multi-party computation protocol. We then prove security and fairness via ideal-real world simulation [9].

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

39 / 48

39/48

Our Contributions

Conclusion Conclusion

MFE
We design a MFE protocol requires only O(n2) messages and constant number of rounds for n parties.
Our MFE optimally (in complete topology) guarantees fairness (for honest parties) even when n - 1 out of n parties are malicious and colluding.
We show how to employ our MFE protocol for any exchange topology, with the performance improving as the topology gets sparser.
We formulate MFE as a secure multi-party computation protocol. We then prove security and fairness via ideal-real world simulation [9].

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

39 / 48

39/48

Our Contributions

Conclusion Conclusion

TTP Usage
The TTP for fairness in our MFE is in the optimistic model The TTP has a very low workload.
The TTP does not learn any exchanged item, so privacy against the TTP is preserved.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

40 / 48

40/48

Our Contributions

Conclusion Conclusion

TTP Usage
The TTP for fairness in our MFE is in the optimistic model The TTP has a very low workload.
The TTP does not learn any exchanged item, so privacy against the TTP is preserved.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

40 / 48

40/48

Our Contribution

Conclusion Conclusion

Secure Multi-party Computation
Our MFE can be employed on top of any SMPC protocol to obtain a fair SMPC protocol,
We provide an ideal world definition for fair SMPC, and prove security and fairness of a SMPC protocol that use our MFE via simulation.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

41 / 48

41/48

Our Contribution

Conclusion Conclusion

Secure Multi-party Computation
Our MFE can be employed on top of any SMPC protocol to obtain a fair SMPC protocol,
We provide an ideal world definition for fair SMPC, and prove security and fairness of a SMPC protocol that use our MFE via simulation.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

41 / 48

41/48

Authors

Conclusion Conclusion

Handan Kilinç PHD student at EPFL handan.kilinc@epfl.ch

Asst. Prof. Alptekin Küpçü at Koç University akupcu@ku.edu.tr

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

42 / 48

42/48

Conclusion For Further Reading
For Further Reading I

M. Andrychowicz, S. Dziembowski, D. Malinowski, and L. Mazurek. Secure multiparty computations on bitcoin. In IEEE Symposium on Security and Privacy, 2014.

N. Asokan, M. Schunter, and M. Waidner. Optimistic protocols for multi-party fair exchange, 1996.

F. Bao, R. H. Deng, K. Q. Nguyen, and V. Varadharajan. Multi-party fair exchange with an off-line trusted neutral party. In DEXA Workshop, 1999.

B. Baum-Waidner and M. Waidner. Round-optimal and abuse free optimistic multi-party contract signing. In ICALP, 2000.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

43 / 48

43/48

Conclusion For Further Reading
For Further Reading II

I. Bentov and R. Kumaresan. How to use bitcoin to design fair protocols. In CRYPTO.
J. Garay, P. MacKenzie, M. Prabhakaran, and K. Yang. Resource fairness and composability of cryptographic protocols. In Theory of Cryptography. 2006.

J. A. Garay and P. D. MacKenzie. Abuse-free multi-party contract signing. In DISC, 1999.

N. González-Deleito and O. Markowitch. An optimistic multi-party fair exchange protocol with reduced trust requirements. In ICISC, 2002.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

44 / 48

44/48

Conclusion For Further Reading
For Further Reading III

H. Kilinç and A. Küpçü. Efficiently making secure two-party computation fair. Cryptology ePrint Archive, Report 2014/896.

Y. Liu and H. Hu. An improved protocol for optimistic multi-party fair exchange. In EMEIT, 2011.

S. Mauw, S. Radomirovic, and M. T. Dashti. Minimal message complexity of asynchronous multi-party contract signing. In CSF, 2009.

A. Mukhamedov and M. D. Ryan. Fair multi-party contract signing using private contract signatures. Inf. Comput., pages 272­290, 2008.

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

45 / 48

45/48

Conclusion For Further Reading
Phase 1: Setup Phase

All participants agree on the prime p-order subgroup of Zq, where q is a large prime, and a generator g of this subgroup. Then each Pi does

Pi

Phase 1

Pj

pick xi compute hi = gxi Ci = Com(hi , ri )

-------C-i ---- -----C-j------ -------hi----- ------hj------

pick xj compute hj = gxj Cj = Com(hj , rj )

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

46 / 48

46/48

Conclusion For Further Reading
Phase 1: Setup Phase

All participants agree on the prime p-order subgroup of Zq, where q is a large prime, and a generator g of this subgroup. Then each Pi does

Pi

Phase 1

Pj

pick xi compute hi = gxi Ci = Com(hi , ri )

-------C-i ---- -----C-j------ -------hi----- ------hj------

pick xj compute hj = gxj Cj = Com(hj , rj )

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

46 / 48

46/48

Conclusion For Further Reading
Phase 1: Setup Phase

All participants agree on the prime p-order subgroup of Zq, where q is a large prime, and a generator g of this subgroup. Then each Pi does

Pi

Phase 1

Pj

pick xi compute hi = gxi Ci = Com(hi , ri )

-------C-i ---- -----C-j------ -------hi----- ------hj------

pick xj compute hj = gxj Cj = Com(hj , rj )

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

46 / 48

46/48

Phase 2

Conclusion For Further Reading

Pi

Phase 2

Pj

compute h =

n k =0

hk

compute h =

n k =0

hk

pick ri

pick rj

Ei = (ai , bi ) = (gri , fi hri ) -V-E-i =-V-(-E-i ,-h;--){-(-vi-,fi-)-R-i-tem-} Ej = (aj , bj ) = (grj , fj hrj ) V-E-j =-V-(-E-j ,-h;--){-(v-j ,-fj-)-R-it-em--}
If VE is not received from at least one of the parties Abort

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

47 / 48

47/48

Phase 2

Conclusion For Further Reading

Pi

Phase 2

Pj

compute h =

n k =0

hk

compute h =

n k =0

hk

pick ri

pick rj

Ei = (ai , bi ) = (gri , fi hri ) -V-E-i =-V-(-E-i ,-h;--){-(-vi-,fi-)-R-i-tem-} Ej = (aj , bj ) = (grj , fj hrj ) V-E-j =-V-(-E-j ,-h;--){-(v-j ,-fj-)-R-it-em--}
If VE is not received from at least one of the parties Abort

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

47 / 48

47/48

Phase 2

Conclusion For Further Reading

Pi

Phase 2

Pj

compute h =

n k =0

hk

compute h =

n k =0

hk

pick ri

pick rj

Ei = (ai , bi ) = (gri , fi hri ) -V-E-i =-V-(-E-i ,-h;--){-(-vi-,fi-)-R-i-tem-} Ej = (aj , bj ) = (grj , fj hrj ) V-E-j =-V-(-E-j ,-h;--){-(v-j ,-fj-)-R-it-em--}
If VE is not received from at least one of the parties Abort

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

47 / 48

47/48

Phase 2

Conclusion For Further Reading

Pi

Phase 2

Pj

compute h =

n k =0

hk

compute h =

n k =0

hk

pick ri

pick rj

Ei = (ai , bi ) = (gri , fi hri ) -V-E-i =-V-(-E-i ,-h;--){-(-vi-,fi-)-R-i-tem-} Ej = (aj , bj ) = (grj , fj hrj ) V-E-j =-V-(-E-j ,-h;--){-(v-j ,-fj-)-R-it-em--}
If VE is not received from at least one of the parties Abort

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

47 / 48

47/48

Phase 2

Conclusion For Further Reading

Pi

Phase 2

Pj

compute h =

n k =0

hk

compute h =

n k =0

hk

pick ri

pick rj

Ei = (ai , bi ) = (gri , fi hri ) -V-E-i =-V-(-E-i ,-h;--){-(-vi-,fi-)-R-i-tem-} Ej = (aj , bj ) = (grj , fj hrj ) V-E-j =-V-(-E-j ,-h;--){-(v-j ,-fj-)-R-it-em--}
If VE is not received from at least one of the parties Abort

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

47 / 48

47/48

Phase 3

Conclusion For Further Reading

Note that ak = grk (First part of the k th item's encryption). The relation Rs is logghi = logakaxki for each k .

Pi

Phase 3

Pj

cEomit =puEten{cIpdfkkiV({S=dikais}kxnink}o=nkt1=r)e1 ce-Vi-Vv-SS-e-ii=d-=-V-Vf-r(-(-oEE-im-tjt,-,-pp-ka-k;-;tt-t11-l,-e,t-t2-2a,-,is-idd-t-,,P-oP-i-jn)-){-{e-((-hh-oi-j,-f,{{-t-ddh-ki-kje}-}-)-)p--aR-R-rs-st}-i}es

compute {dkj = akxj }nk=1
Ejt = Encpk ({dkj }nk=1) before time t1

Resolve 1
-{-d-ki -}-j,P-K-(-h-i ,{-a-k-}-){-(h-i -,{-d-ki }-)--R-s} {-d-kj }-,-PK-(-h-i ,-{a-k-}-){-(-hi-,{-d-kj }-)--R-s-}

If dki are not received before t2 Resolve 2

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

48 / 48

48/48

Phase 3

Conclusion For Further Reading

Note that ak = grk (First part of the k th item's encryption). The relation Rs is logghi = logakaxki for each k .

Pi

Phase 3

Pj

cEomit =puEten{cIpdfkkiV({S=dikais}kxnink}o=nkt1=r)e1 ce-Vi-Vv-SS-e-ii=d-=-V-Vf-r(-(-oEE-im-tjt,-,-pp-ka-k;-;tt-t11-l,-e,t-t2-2a,-,is-idd-t-,,P-oP-i-jn)-){-{e-((-hh-oi-j,-f,{{-t-ddh-ki-kje}-}-)-)p--aR-R-rs-st}-i}es

compute {dkj = akxj }nk=1
Ejt = Encpk ({dkj }nk=1) before time t1

Resolve 1
-{-d-ki -}-j,P-K-(-h-i ,{-a-k-}-){-(h-i -,{-d-ki }-)--R-s} {-d-kj }-,-PK-(-h-i ,-{a-k-}-){-(-hi-,{-d-kj }-)--R-s-}

If dki are not received before t2 Resolve 2

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

48 / 48

48/48

Phase 3

Conclusion For Further Reading

Note that ak = grk (First part of the k th item's encryption). The relation Rs is logghi = logakaxki for each k .

Pi

Phase 3

Pj

cEomit =puEten{cIpdfkkiV({S=dikais}kxnink}o=nkt1=r)e1 ce-Vi-Vv-SS-e-ii=d-=-V-Vf-r(-(-oEE-im-tjt,-,-pp-ka-k;-;tt-t11-l,-e,t-t2-2a,-,is-idd-t-,,P-oP-i-jn)-){-{e-((-hh-oi-j,-f,{{-t-ddh-ki-kje}-}-)-)p--aR-R-rs-st}-i}es

compute {dkj = akxj }nk=1
Ejt = Encpk ({dkj }nk=1) before time t1

Resolve 1
-{-d-ki -}-j,P-K-(-h-i ,{-a-k-}-){-(h-i -,{-d-ki }-)--R-s} {-d-kj }-,-PK-(-h-i ,-{a-k-}-){-(-hi-,{-d-kj }-)--R-s-}

If dki are not received before t2 Resolve 2

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

48 / 48

48/48

Phase 3

Conclusion For Further Reading

Note that ak = grk (First part of the k th item's encryption). The relation Rs is logghi = logakaxki for each k .

Pi

Phase 3

Pj

cEomit =puEten{cIpdfkkiV({S=dikais}kxnink}o=nkt1=r)e1 ce-Vi-Vv-SS-e-ii=d-=-V-Vf-r(-(-oEE-im-tjt,-,-pp-ka-k;-;tt-t11-l,-e,t-t2-2a,-,is-idd-t-,,P-oP-i-jn)-){-{e-((-hh-oi-j,-f,{{-t-ddh-ki-kje}-}-)-)p--aR-R-rs-st}-i}es

compute {dkj = akxj }nk=1
Ejt = Encpk ({dkj }nk=1) before time t1

Resolve 1
-{-d-ki -}-j,P-K-(-h-i ,{-a-k-}-){-(h-i -,{-d-ki }-)--R-s} {-d-kj }-,-PK-(-h-i ,-{a-k-}-){-(-hi-,{-d-kj }-)--R-s-}

If dki are not received before t2 Resolve 2

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

48 / 48

48/48

Phase 3

Conclusion For Further Reading

Note that ak = grk (First part of the k th item's encryption). The relation Rs is logghi = logakaxki for each k .

Pi

Phase 3

Pj

cEomit =puEten{cIpdfkkiV({S=dikais}kxnink}o=nkt1=r)e1 ce-Vi-Vv-SS-e-ii=d-=-V-Vf-r(-(-oEE-im-tjt,-,-pp-ka-k;-;tt-t11-l,-e,t-t2-2a,-,is-idd-t-,,P-oP-i-jn)-){-{e-((-hh-oi-j,-f,{{-t-ddh-ki-kje}-}-)-)p--aR-R-rs-st}-i}es

compute {dkj = akxj }nk=1
Ejt = Encpk ({dkj }nk=1) before time t1

Resolve 1
-{-d-ki -}-j,P-K-(-h-i ,{-a-k-}-){-(h-i -,{-d-ki }-)--R-s} {-d-kj }-,-PK-(-h-i ,-{a-k-}-){-(-hi-,{-d-kj }-)--R-s-}

If dki are not received before t2 Resolve 2

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

48 / 48

48/48

Phase 3

Conclusion For Further Reading

Note that ak = grk (First part of the k th item's encryption). The relation Rs is logghi = logakaxki for each k .

Pi

Phase 3

Pj

cEomit =puEten{cIpdfkkiV({S=dikais}kxnink}o=nkt1=r)e1 ce-Vi-Vv-SS-e-ii=d-=-V-Vf-r(-(-oEE-im-tjt,-,-pp-ka-k;-;tt-t11-l,-e,t-t2-2a,-,is-idd-t-,,P-oP-i-jn)-){-{e-((-hh-oi-j,-f,{{-t-ddh-ki-kje}-}-)-)p--aR-R-rs-st}-i}es

compute {dkj = akxj }nk=1
Ejt = Encpk ({dkj }nk=1) before time t1

Resolve 1
-{-d-ki -}-j,P-K-(-h-i ,{-a-k-}-){-(h-i -,{-d-ki }-)--R-s} {-d-kj }-,-PK-(-h-i ,-{a-k-}-){-(-hi-,{-d-kj }-)--R-s-}

If dki are not received before t2 Resolve 2

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

48 / 48

48/48

Phase 3

Conclusion For Further Reading

Note that ak = grk (First part of the k th item's encryption). The relation Rs is logghi = logakaxki for each k .

Pi

Phase 3

Pj

cEomit =puEten{cIpdfkkiV({S=dikais}kxnink}o=nkt1=r)e1 ce-Vi-Vv-SS-e-ii=d-=-V-Vf-r(-(-oEE-im-tjt,-,-pp-ka-k;-;tt-t11-l,-e,t-t2-2a,-,is-idd-t-,,P-oP-i-jn)-){-{e-((-hh-oi-j,-f,{{-t-ddh-ki-kje}-}-)-)p--aR-R-rs-st}-i}es

compute {dkj = akxj }nk=1
Ejt = Encpk ({dkj }nk=1) before time t1

Resolve 1
-{-d-ki -}-j,P-K-(-h-i ,{-a-k-}-){-(h-i -,{-d-ki }-)--R-s} {-d-kj }-,-PK-(-h-i ,-{a-k-}-){-(-hi-,{-d-kj }-)--R-s-}

If dki are not received before t2 Resolve 2

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

48 / 48

48/48

Phase 3

Conclusion For Further Reading

Note that ak = grk (First part of the k th item's encryption). The relation Rs is logghi = logakaxki for each k .

Pi

Phase 3

Pj

cEomit =puEten{cIpdfkkiV({S=dikais}kxnink}o=nkt1=r)e1 ce-Vi-Vv-SS-e-ii=d-=-V-Vf-r(-(-oEE-im-tjt,-,-pp-ka-k;-;tt-t11-l,-e,t-t2-2a,-,is-idd-t-,,P-oP-i-jn)-){-{e-((-hh-oi-j,-f,{{-t-ddh-ki-kje}-}-)-)p--aR-R-rs-st}-i}es

compute {dkj = akxj }nk=1
Ejt = Encpk ({dkj }nk=1) before time t1

Resolve 1
-{-d-ki -}-j,P-K-(-h-i ,{-a-k-}-){-(h-i -,{-d-ki }-)--R-s} {-d-kj }-,-PK-(-h-i ,-{a-k-}-){-(-hi-,{-d-kj }-)--R-s-}

If dki are not received before t2 Resolve 2

Handan Kilinç , Alptekin Küpçü

Optimally Efficient MFE and Fair SMPC

48 / 48

48/48

