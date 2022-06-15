SESSION ID: CRYP-W02
Doubly half-injective PRGs for incompressible white-box cryptography

Estuardo Alpirez Bock
Aalto University, Finland

Alessandro Amadori, Joppe W. Bos, Chris Brzuska, Wil Michiels

#RSAC

#RSAC
White-box attack scenario

plaintext/ciphertext

encryption/ decryption

ciphertext/plaintext

Adversary gets access to the implementation code and its execution environment
WB Cryptography aims to maintain a program secure even when subject to this attack model
2

Incompressibility for white-box cryptography

#RSAC
Adversarial capabilities
The adversary gets access to the program code of an implementation He could extract keys, but also copy the program and its functionality Threat of code-lifting attacks

WB

WB

copy

4

#RSAC
Methods for mitigating code-lifting attacks
Incompressibility
Delerablée, Lepoint, Paillier, Rivain: White-box security notions for symmetric encryption schemes Fouque, Karpman, Kirchner, Minaud: Efficient and provable white-box primitives

WB

WB

5

#RSAC
In this work
We build an incompressible wb-encryption scheme Our construction is based on standard assumptions, such as pseudorandom generators and pseudorandom functions

PRF

INC-PRF

INC-PRF WB-Enc (MAC)

6

PRGs, PRFs and the GGM tree

#RSAC
Pseudorandom generators

Deterministic, polynomial time computable function satisfying:
Length-expansion: for all x  {0,1}* | PRG(x) | = 2 | x | Pseudorandomness: the output from the PRG should be indistinguishable from random
x

G0(x)
|x|
8

G1(x)
|x|

#RSAC
Pseudorandom functions
Deterministic, polynomial time computable function satisfying:
Length-condition: for all n  , k, x  {0,1}n, | PRF(k, x) | = | y | Pseudorandomness: the output from the PRF should be indistinguishable from random
k, x
y
9

#RSAC
GGM tree: building a PRF from a PRG
Introduced by Goldreich, Goldwasser and Micali
Input x of the PRF(k,x) represents the binary address of the binary tree
k

G0  G0(k)

G0(k)
G1  G0(k)

G1(k)
G0  G1(k)

G1  G1(k)

10

#RSAC
GGM tree

E.g. x= 10
PRF(k,x)= GGM(k,m)= G0  G1(k)

G0  G0(k)

k
1

G0(k)
G1  G0(k)

G1(k)
0
G0  G1(k)

G1  G1(k)

11

An incompressible white-box pseudorandom function

#RSAC
(Incompressible) PRF implementation
Build a PRF which uses a large, incompressible key
Key expansion
k  {0,1}*
K = CompPRF(k), with | K | > > | k |
Functionality preservation: k, x  {0,1}*, f(k, x) = F(K, x)
13

#RSAC
Construction (1) - PRF
Standard PRF based on the GGM tree
14

G0  G0(k)

k
1

#RSAC
x = 1011

G0(k)
G1  G0(k)

G1(k)
0
G0  G1(k)
1

G1  G1(k)

1
y
15

#RSAC
Construction (2) - Compiler
Iterate the GGM on key k and all possible values of length 
16

k

G0(k)

k0

k1

K = k0 | | k1 | | k2 | | k3

G1(k)
k2

17

#RSAC
l=2
k3

#RSAC
Construction (3) - Incompressible PRF
F takes as input the long key K. Input x is split in two.
18

k

G0(k)

G1(k)

k0

k1

k2

GGM(k2,11)
19

#RSAC
x = 1011 l=2 j = 10
k3

#RSAC

k2
1

G0(k)

G1(k)

x = 1011
1
y

y  GGM(k2,11)
20

Functional equivalence and incompressibility

k

G0(k)

K=

k0

k1

1
G1(k)
0
k2
1

#RSAC
f(k,1011) = y CompPRF(k) = K F(K,1011) = y
k3

1
y
21

#RSAC
Possible collisions

k = ka | | kb

k = ka | | kc

y0

y1

=

y0

y1

For our incompressibility property to hold, we need injectivity

22

Doubly-half injective PRGs

#RSAC
PRG with double injectivity

k

y0

y1

We want injectivity from
L to the set Y, with k  L and y0, y1  Y .

24

#RSAC
Left-half-injective PRG

Construction by Garg, Pandey, Srinivasan and Zhandry:  use a one-way permutation to construct a left-half injective PRG
Breaking the sub-exponential barrier in obfustopia

G(x) OWP

y0

y1

G(x) := OWP|x|(x) | | B(x) | | B(OWP(x)) | | . . . | | B(OWP|x|-1(x)),
with B = hardcore bit

25

#RSAC
Doubly-half injective PRG

Assuming a left-half injective, length doubling PRG

 

G = G0 | | G1





OWP-Injective

g(x0 | | x1) := G0(x0) | | G1(x0)  G0(x1) | | G0(x1) | | G1(x1)  G0(x0)

Injective

Injective

26

#RSAC
Doubly-half injective PRG
g(x0 | | x1) := G0(x0) | | G1(x0)  G0(xx) | | G0(x1) | | G1(x1)  G0(x0) Left half is injective, 
Let w0 | | w1, s.t. g0(w0 | | w1) = g0(x0 | | x1) G0 is a permutation  x0 = w0 G1(w0)  G0(w1) = G1(x0)  G0(x1) G0 is a permutation  x1 = w1
The injectivity of the right half follows analogously
27

Conclusions

#RSAC
Overview of our construction

DPRG

GGM

INC-PRF

INC-WB

Provide an incompressible (big key) white-box encryption scheme Results based on standard crypto-assumptions Construct a new type of PRG

29

Backup slides

#RSAC
Conclusions
Provide an incompressible (big key) white-box encryption scheme Results based on standard crypto-assumptions Construct a new type of PRG

DPRG

GGM

INC-PRF

INC-WB

31

#RSAC
Alternative desirable properties
Making a program traceable (traceability) Binding the WB to a precise hardware device (hardware binding) Making the functionality of the WB dependent of a set of inputs (input binding/application binding)
32

Why is F incompressible?
k

K=

k0

G0(k)
k1

G1(k)
k2

#RSAC
x = 0111 GGM(,0111) = 
F(K,0111) = 
k3

33

#RSAC
Why is F incompressible?
We need the complete key K to achieve f(k, x) = F(K, x) for all x  {0,1}* However, this might only hold depending on the definition of the PRG
used in the GGM tree.
34

#RSAC
Theorem 1
IF PRF admits a computationally (, ) - incompressible implementation
F, the wb-encryption scheme in Constructino 1 is a (,  - n - o(1))- incompressible wb-encryption scheme.
Proof sketch via reduction: we reduce the incompressibility of F to the incompressibility of the encryption scheme.
Cannot produce a valid MAC without the complete key K
35

#RSAC
Doubly-half injective PRG
We define a PRG which is left-half and right-half injective. Three properties required:
Length-doubling:  For all x  {0,1}* | g(x) | = 2 | x | . g0(x) is the left haf of g and
g1(x)is the right half.
Doubly-half injective: g0 and g1 are injective. Pseudorandomness: g(Un) is computationally indistinguishable fromU2n .
36

#RSAC
Construction 1 via AE-scheme and F
37

#RSAC
Use cases of white-box cryptography
Original concern: Digital Rights Management
White-box crypto introduced as a method to mitigate piracy
Chow, Eisen Johnson and van Oorschot - A white-box cryptography and an AES implementation
Recently proposed as a method for protecting cryptographic keys within mobile payment applications implemented in software
38

#RSAC
Global construction of the scheme
Key expansion property Pseudorandomness property follows from the property of the GGM
39

#RSAC
Methods for mitigating code-lifting attacks
Two popular methods have been studied in the literature: Traceability
Delerablée, Lepoint, Paillier, Rivain: White-box security notions for symmetric encryption schemes

WB

WB

40

