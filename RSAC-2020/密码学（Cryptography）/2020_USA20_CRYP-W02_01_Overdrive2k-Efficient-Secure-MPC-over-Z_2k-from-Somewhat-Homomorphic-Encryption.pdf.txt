Overdrive2k: Efficient Secure MPC over Z2k from Somewhat Homomorphic Encryption
Emmanuela Orsini Nigel Smart Fredrik Vercauteren
imec-COSIC, KU Leuven

MPC setting in this work
Goal: Multiparty computation for circuits over Z2k
Adversary: Dishonest majority, malicious adversary
Impossible without computational assumption No guaranteed termination

MPC setting in this work
Goal: Multiparty computation for circuits over Z2k
Adversary: Dishonest majority, malicious adversary
Impossible without computational assumption No guaranteed termination

MPC setting in this work
Goal: Multiparty computation for circuits over Z2k
Adversary: Dishonest majority, malicious adversary
Impossible without computational assumption No guaranteed termination

· Allows direct use of CPU's arithmetic
­ No need for reduction mod p
· Bitwise operations
­ Easier to do basic arithmetic for applications

MPC in the preprocessing model
TRUSTED DEALER
CORRELATED RANDOMNESS

ONLINE PHASE

x1 x3

x5 x2
x4

Implementing the trusted dealer - Finite field

Homomorphic Encryption

OFFLINE PHASE Oblivious Transfer

- SPDZ-like protocols ([DPSZ12] ([KPR18] Overdrive-HighGear)
- BeDOZa-like protocols ([BDOZ10] ([KPR18] Overdrive-LowGear)

- TinyOT-like protocols

Implementing the trusted dealer - Efficiency in the field case

Homomorphic Encryption

OFFLINE PHASE Oblivious Transfer

· Large computational overhead
· Small communication
­ LowGear allows better SHE parameters ­ HighGear requires less communication
· Better for arithmetic modulo p

· Small computational overhead · Requires pairwise communication · Better for boolean and binary circuits

MPC over Z2k
· Cramer et al. EUROCRYPT 2003: actively secure MPC over black-box rings · Bogdanov et al. ESORICS 2008: (3,1) and passive security; [AFLNO16], [FLN017] · Damgård et al. CRYPTO 2018: compiler from passive to active with small # corruption

Homomorphic Encryption

Oblivious Transfer

- Cramer et al. [CDESX18] (SPDZ2k ) - Damgård et al. [DEFKSV19]

MPC over Z2k
· Cramer et al. EUROCRYPT 2003: actively secure MPC over black-box rings · Bogdanov et al. ESORICS 2008: (3,1) and passive security; [AFLNO16], [FLN017] · Damgård et al. CRYPTO 2018: compiler from passive to active with small # corruption

Homomorphic Encryption

Oblivious Transfer

- Catalano et al. [CDFG19] (MONZ2k A) ­ Two party case only

- Cramer et al. [CDESX18] (SPDZ2k ) - Damgård et al. [DEFKSV19]

MPC over Z2k
· Cramer et al. EUROCRYPT 2003: actively secure MPC over black-box rings · Bogdanov et al. ESORICS 2008: (3,1) and passive security; [AFLNO16], [FLN017] · Damgård et al. CRYPTO 2018: compiler from passive to active with small # corruption

Homomorphic Encryption

Oblivious Transfer

- Catalano et al. [CDFG19] (MONZ2k A) ­ Two party case only
- Our result ­ Overdrive2k ­ Any number of parties

- Cramer et al. [CDESX18] (SPDZ2k ) - Damgård et al. [DEFKSV19]

Our results
· We use BGV (Brakerski et al. 2011) to implement the SPDZ2k preprocessing
1. We introduce a special packing technique for BGV operating over Z2k 2. Adapt the SPDZ preprocessing (distributed decryption and ZK) to work on Z2k
· Introduce a new primitive for SPDZ2k: bit-decomposition (this has also been independently developed in [DEFKSV19])

Our results
· We use BGV (Brakerski et al. 2011) to implement the SPDZ2k preprocessing
1. We introduce a special packing technique for BGV operating over Z2k 2. Adapt the SPDZ preprocessing (distributed decryption and ZK) to work on Z2k
· Introduce a new primitive for SPDZ2k: bit-decomposition (this has also been independently developed in [DEFKSV19])

Batch computation (Traditional)
Use a ring defined by power-of-two cyclotomic m(X) = 2n(X).
· R = Z[X]/(m(X)), where deg(m(X)) =  (m) = N · Rp = R/pR = Zp[X]/(m(X)), m and p coprime
r
= m(X)   Fi(X) (mod p) i=1
· Each Fi(X) has degree d =  (m)/r = N/r
Rp = Zp[X]/(F1(X)) × · · · × Zp[X]/(Fr(X)) = Frpd .

Batch computation

Rp

Zp[X]/(F1(X)) Zp[X]/(F2(X))

···

Z p[X ]/(Fr (X ))

· We can have up to N isomorphisms i : Zp[X]/Fi(X)  Fp
 we can represent N plaintext elements of Fp as a single element in Rp.

BGV setting in our work
Use a ring defined by prime cyclotomic p(X).



M = Zd2k·r

M



R Z[X ]/( p(X ))

mod 2k

Z2k[X ]/(p(X )) P

2k


r
Z2k [X ]/(Fi(X ))
i=1
P

BGV setting - Packing mod 2k

Traditional setting...

12

...

N

P Fp Fp Fp Fp ... ... ... ... ... ... Fp Fp Fp Fp

Our setting...

1

2

3

...

...

...

...

N/d

P

Z2k

Z2k

Z2k

Z2k

Z2k

Z2k

Our packing technique

I = {i1, . . . , it} and J = { j1, . . . , jt} such that j = 2 · i i  I

I :

(Z2k )t

-

Z2k [X ]

(m1, . . . , mt ) - m1 · X i1 + . . . + mt · X it ,

Our packing technique

I = {i1, . . . , it} and J = { j1, . . . , jt} such that j = 2 · i i  I

I :

(Z2k )t

-

Z2k [X ]

(m1, . . . , mt ) - m1 · X i1 + . . . + mt · X it ,

J :

(Z2k )t

-

Z2k [X ]

(m1, . . . , mt ) - m1 · X j1 + . . . + mt · X jt ,

We encode r · |I| Z2k-elements into a single ciphertext

Our packing technique

I = {i1, . . . , it} and J = { j1, . . . , jt} such that j = 2 · i i  I

I :

(Z2k )t

-

Z2k [X ]

(m1, . . . , mt ) - m1 · X i1 + . . . + mt · X it ,

J :

(Z2k )t

-

Z2k [X ]

(m1, . . . , mt ) - m1 · X j1 + . . . + mt · X jt ,

We encode r · |I| Z2k-elements into a single ciphertext
I is used to encode the intial packing J is used to encode data after one multiplication

Our packing technique
· I = {1, 3, 4, 5}, J = {2, 6, 8, 10}

1 2 3 4 5 6 7 8 9 10

m1 · X 1 + m3 · X 3 + m4 · X 4 + m5 · X 5 1 2 3 4 5 6 7 8 9 10

m1

m3 m4 m5

m1 · X 1 + m3 · X 3 + m4 · X 4 + m5 · X 5 1 2 3 4 5 6 7 8 9 10

m1

m3 m4 m5

× =

m1m1 · X 2 + m3m3 · X 6 + m4m4 · X 8 + m5m5 · X 10
1 2 3 4 5 6 7 8 9 10

Our packing technique
R = Z[X ]/p(X ), R2 = (F2d )r
i  I, 2 · i < d

i1 +i2 = j, i1 = j, i2 = j

p

=

r · |I| p-1

p

r d |I| r · |I| p

9719 226 43 8 1808 .186

11119 218 51 8 1744 .156

11447 118 97 16 1888 .164

13367 326 41 8 2608 .195

14449 172 84 16 2752 .190

20857 316 66 12 3792 .181

23311 518 45 8 4144 .177

26317 387 68 12 4644 .176

29191 278 105 16 4448 .152

30269 329 92 16 5264 .173

32377 568 57 10 5680 .175

38737 538 72 13 6994 .180

43691 1285 34 8 10280 .235

61681 1542 40 8 12336 .200

Two-level BGV encryption scheme
· q1 = p0 · p1 and q0 = p0

level 1

Rq1 (1, c)

Fresh encrypted ciphertext, Linear operations, Multiplication

Switch Mod

level 0

Rq0 (0, c )

Decryption, Linear operations

We can multiply ciphertexts at level 1, obtaining a ciphertext at level 0

Our packing technique

R
Z[X ]/( p(X ))
 mod 2k

M = Zr2k M

Z2k[X ]/(p(X )) P

2k

 

r
Z2k [X ]/(Fi(X ))
i=1

P

Our packing technique

R
Z[X ]/( p(X ))
 mod 2k

M = Zr2k M

Z2k[X ]/(p(X )) P

2k

 

r
Z2k [X ]/(Fi(X ))
i=1

P

I

M

=

r×|I|
Z2k

M
I

R
Z[X ]/( p(X ))
J
mod 2k

Z2k[X ]/(p(X )) P

2k



J

r

Z2k [X ]/(Fi(X ))
i=1

P

M

=

r×|J|
Z2k

M

MPC over Z2k from SHE
· Overdrive/HighGear preprocessing phase
1. Packing technique should not leak any private information 2. Modify the ZK proofs to check correctness of double-encrypted plaintexts

Efficiency

Protocol k s sec
This paper 32 32 26 SPDZ2k 32 32 26 This paper 64 64 57 SPDZ2k 64 64 57 This paper 128 64 57 SPDZ2k 128 64 57

Triple Cost
76.8 79.87 153.3 319.488 212.2 557.06

k is the size of integers supported, i.e. MPC works modulo 2k natively.

s is the expansion to support statistical security, i.e. internally SPDZ2k works modulo 2s+k.

sec is the actual statistical security obtained.

Any Questions?

