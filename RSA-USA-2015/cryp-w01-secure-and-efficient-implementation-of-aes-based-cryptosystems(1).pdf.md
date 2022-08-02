Introduction ........

Implementation .......

Results ....

Implementing GCM on ARMv8
Conrado P. L. Gouvêa Julio López

Conclusion

KRYPTUS Information Security Solutions University of Campinas
CT-RSA 2015

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

1/21

Introduction ........

Implementation .......

Results ....

Cryptography Performance Matters

Conclusion

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

2/21

Introduction ........

Implementation .......

Results ....

Cryptography Performance Matters

Conclusion

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

2/21

Introduction ........

Implementation .......

Results ....

Cryptography Performance Matters

Conclusion

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

2/21

Introduction ........

Implementation .......

Results ....

Cryptography Performance Matters

Conclusion

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

2/21

Introduction ........

Implementation .......
This Work

Results ....

Conclusion

Efficient software implementation of GCM over AES for ARMv8
Resistance to timing attacks
Authenticated Encryption Combine encryption and authentication in a single scheme, preventing mistakes

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

3/21

Introduction ........

Implementation .......

Results ....

ARM Architecture

Conclusion

Used by 95% of smartphones ARMv7: 32-bit, SIMD instruction set (NEON) ARMv8: 32-bit mode (AArch32), 64-bit mode (AArch64)

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

4/21

Introduction ........

Implementation .......

Results ....

Galois/Counter Mode (GCM)

Conclusion

McGrew and Viega, 2005 Authenticated Encryption
Input: nonce, plaintext, additional data Output: ciphertext, authentication tag
Used in TLS, IPSec, SSH, NIST SP 800-38D Works with any 128-bit block cipher; used mostly with AES

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

5/21

Introduction ........

Implementation .......

Results ....

Galois/Counter Mode (GCM)

Conclusion

J inc J . . . inc J

EK

EK

M1

S0

C1

EK

Mm

Cm L

S0

Y

·H . . .

·H

·H

T

Uses CTR mode for encryption and defines the GHASH function for authentication
GHASH uses binary field multiplication over F2128

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

6/21

Introduction ........

Implementation .......

Results ....

GCM Bit Order

Conclusion

a(z) = 1
80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Can't shift words -- breaks the bit order Workarounds:
Reverse bits in each byte, carry out computations, reverse again at the end (Gueron and Kounavis 2010) Reverse the bytes in the vector, compute using "reverse modular reduction", reverse again at the end

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

7/21

Introduction ........

Implementation .......

Results ....

Conclusion

ARM Binary Polynomial Multiplication Support

ARMv7
VMULL.P8
Conrado P. L. Gouvêa, Julio López

ARMv8 AArch32: VMULL.P64
AArch64: PMULL, PMULL2

Implementing GCM on ARMv8

8/21

Introduction ........

Implementation .......

Results ....

ARM AES Support

Conclusion

1: aese.16b t0, k00 2: aesmc.16b t0, t0 3: aese.16b t0, k01 4: aesmc.16b t0, t0 5: aese.16b t0, k02 6: aesmc.16b t0, t0 7: aese.16b t0, k03 8: aesmc.16b t0, t0 9: aese.16b t0, k04 10: aesmc.16b t0, t0
11: . . .

Advanced Encryption Standard
AES instructions in ARMv8 (both AArch32 and AArch64)
AESE (AddRoundKey, SubBytes, ShiftRows)
AESMC (MixColumns)
AESD, AESIMC (Decryption)

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

9/21

Introduction ........

Implementation .......

Results ....

Software Implementation

Conclusion

High-speed -- fast AES and binary field multiplication
Secure -- timing-resistant No loop bounds, branches nor table lookups depending on secret data
Explore the use of hardware support (AES and binary polynomial multiplication)
Field multiplication in F2128 Binary polynomial multiplication (128 × 128-bit  256-bit)
Reduction modulo f(z) = z128 + z7 + z2 + z + 1 (256-bit  128-bit)

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

10/21

Introduction ........

Implementation .......

Results ....

Binary Polynomial Multiplication

Conclusion

Old approach, without hardware support: precomputed tables (López-Dahab multiplication) ARMv7 (Câmara, Gouvêa, López 2013)
VMULL.P8
64 × 64-bit multiplier using eight VMULL.P8 invocations 128 × 128-bit multiplier using three invocations (Karatsuba)

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

11/21

Introduction ........

Implementation .......

Results ....

Conclusion

Binary Polynomial Multiplication: ARMv8 AArch32

1: vmull.p64 r0q, al, bl 2: vmull.p64 r1q, ah, bh 3: veor th, bl, bh 4: veor tl, al, ah 5: vmull.p64 tq, th, tl 6: veor tq, r0q 7: veor tq, r1q 8: veor r0h, tl 9: veor r1l, th

64 × 64-bit multiplier:
VMULL.P64
128 × 128-bit multiplier using three invocations (Karatsuba)

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

12/21

Introduction ........

Implementation .......

Results ....

Conclusion

Binary Polynomial Multiplication: ARMv8 AArch64

1: pmull r0.1q, a.1d, b.1d 2: pmull2 r1.1q, a.2d, b.2d 3: ext.16b t0, b, b, #8 4: pmull t1.1q, a.1d, t0.1d 5: pmull2 t0.1q, a.2d, t0.2d 6: eor.16b t0, t0, t1 7: ext.16b t1, z, t0, #8 8: eor.16b r0, r0, t1 9: ext.16b t1, t0, z, #8 10: eor.16b r1, r1, t1

64 × 64-bit multiplier: PMULL, PMULL2
128 × 128-bit multiplier using four invocations
Karatsuba not used since addressing the upper 64 bits is not directly supported

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

13/21

Introduction ........

Implementation .......

Results ....

GCM Bit Reflection

Conclusion

ARMv7, ARMv8 AArch32 No direct support for reversing bits of each byte
We use the reflected reduction trick (Gueron and Kounavis 2010)
Inversion of bytes in 16-byte vector: VREV64.8, VSWP
ARMv8 AArch64 RBIT reverses bits of each byte in byte vector

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

14/21

Introduction ........

Implementation .......

Results ....

Modular Reduction

Conclusion

Classic approach: shift and xors (Polyakov 2014)
Multiplier approach: reduction by f(z) = z128 + r(z) can be carried out with multiplication by r(z)
ARMv7 VMULL.P8 awkward to use, worse performance
ARMv8 VMULL.P64, PMULL
Lazy reduction (Gueron 2010) Yi = [(Xi · H)  (Xi­1 · H2)  (Xi­2 · H3)  (Xi­3 · H4)] mod f(z)

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

15/21

Introduction ........

Implementation .......
AES

Results ....

Conclusion

ARMv7 No instruction support
Timing-resistant bitsliced implementation from Bernstein and Schwabe
ARMv8 Instruction support
Two-block interleaving to avoid hazards
Expanded AES key entirely kept in NEON registers Key schedule requires S-box lookups
AESE can be used (reverting ShiftRows, zero AddRoundKey)

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

16/21

Introduction ........

Implementation .......

Results ....

Conclusion

Benchmark

10000-byte message inside loop with 256 iterations

SUPERCOP not yet used -- no support for iOS and Android

Three implementations: .P8 (with bitsliced AES), .P64 and
PMULL

Five devices:

Device

Architecture

Core

GHz

PandaBoard Arndale Galaxy Note 4 iPhone 5s iPad Air 2

ARMv7 ARMv7 ARMv8 AArch32 ARMv8 ARMv8

Cortex-A9 Cortex-A15 Cortex-A53/A57 Apple A7 Apple A8X

1.0 1.7 1.3/1.9 1.3 1.5

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

17/21

Introduction ........

Implementation .......

Results ....

AES-CTR Performance

Conclusion

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

18/21

Introduction ........

Implementation .......

Results ....

GHASH Performance

Conclusion

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

19/21

Introduction ........

Implementation .......

Results ....

GCM Performance

Conclusion

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

20/21

Introduction ........

Implementation .......
Conclusion

Results ....

Conclusion

Efficient and secure GCM implementation for ARM devices
New ARMv8 64-bit binary polynomial multiplier coupled with AES instructions: 8­10 times faster
Natural timing-resistance, no branches nor table lookups required over secret data
Future work on ARMv8: extend to larger binary fields, apply to elliptic curve cryptography
Code available, MIT License:

https://github.com/conradoplg/authenc

Conrado P. L. Gouvêa, Julio López

Implementing GCM on ARMv8

21/21

Higher-Order Masking in Practice: A Vector Implementation of Masked AES for ARM NEON
Junwei Wang, Praveen Kumar Vadnala,
Johann Großschädl, Qiuliang Xu
Shandong University, University of Luxemborg CT-RSA 2015, April 21 - 24, 2015

Outline
Introduction Differential Power Analysis Masking Countermeasures High-Order DPA Attacks
Background Advanced Encryption Standard High-Order Masking Rivain-Prouff Countermeasure
Implementation ARM NEON Performance Analysis Implementation of Secure Field Multiplication
Results and Comparison
Conclusion

Outline
Introduction Differential Power Analysis Masking Countermeasures High-Order DPA Attacks
Background Advanced Encryption Standard High-Order Masking Rivain-Prouff Countermeasure
Implementation ARM NEON Performance Analysis Implementation of Secure Field Multiplication
Results and Comparison
Conclusion

Introduction
Workstation

Side-Channel Attacks
1/21
Oscilloscope

Cryptographic device

Introduction
Workstation

Control

Side-Channel Attacks
1/21
Oscilloscope

Control

Cryptographic device

Introduction
Workstation

Control

Side-Channel Attacks
1/21
Oscilloscope

ConOtruotlputs

Cryptographic device

Introduction
Workstation

Control

Side-Channel Attacks
1/21
Oscilloscope

Leaked information

ConOtruotlputs

Cryptographic device

Introduction
Workstation

Side-Channel Attacks
1/21

Control Measured traces

Oscilloscope

Leaked information

ConOtruotlputs

Cryptographic device

Introduction

Differential Power Analysis (DPA) [KJJ99]
2/21

Group by some known or predicted data
000

Average trace

Differential trace

111

Introduction

Masking Countermeasures
3/21

· Suppose x is a sensitive intermediate variable in a block cipher.

Introduction

Masking Countermeasures
3/21

· Suppose x is a sensitive intermediate variable in a block cipher. · Generate a random r, and process r and masked value
x = x  r separately instead of x.

Introduction

Masking Countermeasures
3/21

· Suppose x is a sensitive intermediate variable in a block cipher.
· Generate a random r, and process r and masked value
x = x  r
separately instead of x. · r is random
 x is random  Power consumption of r or x alone does not leak any information on
x.

Introduction

High-Order DPA Attacks
4/21

· Second-order attacks
Two intermediate variables are probed.

r

x

joint leakage
More power traces and more complicated statistical techniques required but still practical.

Introduction

High-Order DPA Attacks
4/21

· Second-order attacks
Two intermediate variables are probed.

r

x

joint leakage
More power traces and more complicated statistical techniques required but still practical.
· High-order attacks order is the number of probed intermediate values. The complexity grows exponentially as the order increases.

Outline
Introduction Differential Power Analysis Masking Countermeasures High-Order DPA Attacks
Background Advanced Encryption Standard High-Order Masking Rivain-Prouff Countermeasure
Implementation ARM NEON Performance Analysis Implementation of Secure Field Multiplication
Results and Comparison
Conclusion

Background

Advanced Encryption Standard (AES)
5/21

· Published by National Institute of Standards and Technology (NIST) in
2001
· Substitution-permutation network based block cipher · 128-bit (4*4 bytes) state block with three different key lengths

Background

Advanced Encryption Standard (AES)
5/21

· Published by National Institute of Standards and Technology (NIST) in
2001
· Substitution-permutation network based block cipher
· 128-bit (4*4 bytes) state block with three different key lengths · 10 rounds are performed on the state block for 128-bit keys, each
round contains:

Background

Advanced Encryption Standard (AES)
5/21

· Published by National Institute of Standards and Technology (NIST) in
2001
· Substitution-permutation network based block cipher
· 128-bit (4*4 bytes) state block with three different key lengths · 10 rounds are performed on the state block for 128-bit keys, each
round contains:
AddRoundKey

Background

Advanced Encryption Standard (AES)

5/21

a0,0 a0,1 a0,2 a0,3

b0,0 b0,1 b0,2 b0,3

· Pubali1s,h0eda1b,1y Naa1,t2ionaa1l,3InstiAtudtdeRooufnSdtKaenydarbd1s,0anbd1T,1echbn1,o2lobg1y,3(NIST) in

200a12,0 a2,1 a2,2 a2,3

b2,0 b2,1 b2,2 b2,3

· Substitution-permutation network based block cipher · 128a-3b,0it (a43*,41 bay3te,2s) ast3a,3te block with three bd3if,0ferbe3n,t1keby3,l2enbg3th,3s

· 10 rounds are performed on the state block for 128-bit keys, each
roukn0d,0cokn0ta,1insk:0,2 k0,3
AddRoundKey
k1,0 k1,1 k1,2 k1,3

k2,0 k2,1 k2,2 k2,3

k3,0 k3,1 k3,2 k3,3

Background

Advanced Encryption Standard (AES)
5/21

· Published by National Institute of Standards and Technology (NIST) in
2001
· Substitution-permutation network based block cipher
· 128-bit (4*4 bytes) state block with three different key lengths · 10 rounds are performed on the state block for 128-bit keys, each
round contains:
AddRoundKey ShiftRows

Background

Advanced Encryption Standard (AES)
5/21

· Published by National Institute of Standards and Technology (NIST) in

··cShh2S1Naiu02nfotbg081se1-tbitaaiut01t(i,,4o00 n*4-aap01be,,11yrmteaaus)10ta,,s22ttiaotaane01n,,b33elotwckoSrwhkiitfbhtaRtshoerwdeesbdloicffkaaer01ce,,i01pnthaaek10er,,y21

a0,2 a0,3 lean1g,3thsa1,0

·Sh1roi0fut nr2oduacn2od,n0staaairn2es,1:pearf2o,2rmae2d,3on the state block fao2r,212a82-,b3it ake2,y0s, ae2a,c1h

Shift 3 Aad3d,R0ouan3d,K1eya3,2 a3,3

a3,3 a3,0 a3,1 a3,2

ShiftRows

Background

Advanced Encryption Standard (AES)
5/21

· Published by National Institute of Standards and Technology (NIST) in
2001
· Substitution-permutation network based block cipher
· 128-bit (4*4 bytes) state block with three different key lengths · 10 rounds are performed on the state block for 128-bit keys, each
round contains:
AddRoundKey ShiftRows MixColumns

Background

Advanced Encryption Standard (AES)
5/21

·

P2u0b0al1i0s,h0eda0b,1y

National Institute
a0,2 a0,3

of

Standards anbd0,T1echnology (NIST)

b0,0

b0,2 b0,3

in

· ·

S1u2b8as-1tbi,t0iut t(ia4o1n*,41-pbeayr1mte,2us)taastt1iao,3tne nbeloMtwcixkoCrwokluitbmhantssherdeebbdlo1icf,0fkercbeipn1,th1ekerby1,l2enbg1th,3s

· 1ro0uanro2d,u0cnodans2t,aa1irnesa:p2e,2rfoar2m,3ed on the state blobc2k,0forb12,218-bb2i,t2keby2s,,3 each

a3AS,0dhdiaRf3ot,uR1nodwaKs3e,y2 a3,3

b3,0 b3,1 b3,2 b3,3

MixColumns

Background

Advanced Encryption Standard (AES)
5/21

· Published by National Institute of Standards and Technology (NIST) in
2001
· Substitution-permutation network based block cipher
· 128-bit (4*4 bytes) state block with three different key lengths · 10 rounds are performed on the state block for 128-bit keys, each
round contains:
AddRoundKey ShiftRows MixColumns
SubBytes, also known as S-box, non-linear transformation

Background

Advanced Encryption Standard (AES)

a0,0 a0,1 a0,2 a0,3

5/21
b0,0 b0,1 b0,2 b0,3

a1,0 a1,1 a1,2 a1,3

SubBytes

b1,0 b1,1 b1,2 b1,3

· Published by National Institute of Standards and Technology (NIST) in

200a12,0 a2,1 a2,2 a2,3

b2,0 b2,1 b2,2 b2,3

· Subas3ti,t0utiao3n,-1pear3m,2utaat3io,3n network based bblo3c,0k cbip3,h1erb3,2 b3,3 · 128-bit (4*4 bytes) state block with three different key lengths

· 10 rounds are performed on the Sstate block for 128-bit keys, each
round contains:

AddRoundKey
SS-hbifotxRo:wsa multiplicative inversion over F28
MSiufxboCBloylltouewmsn,esadlsobknyowannasaSf-fbionxe, ntorna-lninsefaor rtrmanasfotiromnat.ion Inversion: typically implemented via table
look-up, but in our case: x-1 = x254.

Background

High-Order Masking
6/21

· Intermediate value x is split into n shares: x = x1  · · ·  xn and
these shares are manipulated separately.

Background

High-Order Masking
6/21

· Intermediate value x is split into n shares: x = x1  · · ·  xn and
these shares are manipulated separately.
· Any subset of at most n - 1 shares is independent of x  Any joint leakage of at most n - 1 shares leaks nothing about x  Resistant against (n - 1)-th order DPA attacks.

Background

High-Order Masking
6/21

· Intermediate value x is split into n shares: x = x1  · · ·  xn and
these shares are manipulated separately.
· Any subset of at most n - 1 shares is independent of x  Any joint leakage of at most n - 1 shares leaks nothing about x  Resistant against (n - 1)-th order DPA attacks.
· High-order masking countermeasures are practically sufficient for a
certain order.

Background

High-Order Masking
6/21

· Intermediate value x is split into n shares: x = x1  · · ·  xn and
these shares are manipulated separately.
· Any subset of at most n - 1 shares is independent of x  Any joint leakage of at most n - 1 shares leaks nothing about x  Resistant against (n - 1)-th order DPA attacks.
· High-order masking countermeasures are practically sufficient for a
certain order.
· Masking linear operation f(·) f(x) = f(x1)  · · ·  f(xn).

Background

High-Order Masking
6/21

· Intermediate value x is split into n shares: x = x1  · · ·  xn and
these shares are manipulated separately.
· Any subset of at most n - 1 shares is independent of x  Any joint leakage of at most n - 1 shares leaks nothing about x  Resistant against (n - 1)-th order DPA attacks.
· High-order masking countermeasures are practically sufficient for a
certain order.
· Masking linear operation f(·) f(x) = f(x1)  · · ·  f(xn). · Masking S-Boxes ?

Background

High-Order Masking
6/21

· Intermediate value x is split into n shares: x = x1  · · ·  xn and
these shares are manipulated separately.
· Any subset of at most n - 1 shares is independent of x  Any joint leakage of at most n - 1 shares leaks nothing about x  Resistant against (n - 1)-th order DPA attacks.
· High-order masking countermeasures are practically sufficient for a
certain order.
· Masking linear operation f(·) f(x) = f(x1)  · · ·  f(xn).
· Masking S-Boxes ? Not easy!!!

Background

Existing Solutions
7/21

· Ishai-Sahai-Wagner Scheme [ISW03]
Describe how to transform a boolean circuit into a new circuit resistant
against any t probes.
· Rivain-Prouff countermeasure [RP10]
Secure the inversion of S-box through exponentiation. Secure the inversion of S-box over composite field [KHL11].
· Carlet et al. countermeasure (FSE12)
Extend [RP10] to arbitrary S-box

2k -1

S(x) =

ixi

i=0

over F2k . · Coron countermeasure (EUROCRYPT14)
Generalize the classic randomized table countermeasure.

Background

Rivain-Prouff Countermeasure [1]
8/21

AES inversion (power function) x  x254

· Secure exponentiation (inversion) consists of several secure
multiplications and squarings.

Background

Rivain-Prouff Countermeasure [1]
8/21

AES inversion (power function) x  x254

· Secure exponentiation (inversion) consists of several secure
multiplications and squarings.

· Secure squaring is easy.

Background

Rivain-Prouff Countermeasure [1]
8/21

AES inversion (power function) x  x254

· Secure exponentiation (inversion) consists of several secure
multiplications and squarings.

· Secure squaring is easy.
· Secure multiplication z = xy is extended from [ISW03], i.e.,
recomputing

n
zi =
i=1

n
xi
i=1

n
yi
i=1

=

xiyj

1 i,j n

as

i zi = =

i xiyi  j<i (xiyj  xjyi)

i

j>i ri,j  xiyi  j<i ((rj,i  xiyj)  xjyi) .

(1)

Background

Rivain-Prouff Countermeasure [2]
9/21

SecExp254 - masked exponentiation in F28 with n shares [RP10]
Input: shares xi satisfying x1  · · ·  xn = x Output: shares yi satisfying y1  · · ·  yn = x254 1: (zi)i  (x2i )i

Background

Rivain-Prouff Countermeasure [2]
9/21

SecExp254 - masked exponentiation in F28 with n shares [RP10]

Input: shares xi satisfying x1  · · ·  xn = x Output: shares yi satisfying y1  · · ·  yn = x254
1: (zi)i  (x2i )i 2: RefreshMasks((zi)i)
3: (yi)i  SecMult((zi)i, (xi)i)

 i zi = x2  i yi = x3

Background

Rivain-Prouff Countermeasure [2]
9/21

SecExp254 - masked exponentiation in F28 with n shares [RP10]

Input: shares xi satisfying x1  · · ·  xn = x Output: shares yi satisfying y1  · · ·  yn = x254
1: (zi)i  (x2i )i 2: RefreshMasks((zi)i)
3: (yi)i  SecMult((zi)i, (xi)i) 4: (wi)i  (y4i )i 5: RefreshMasks((wi)i)
6: (yi)i  SecMult((yi)i, (wi)i)

 i zi = x2  i yi = x3  i wi = x12  i yi = x15

Background

Rivain-Prouff Countermeasure [2]
9/21

SecExp254 - masked exponentiation in F28 with n shares [RP10]

Input: shares xi satisfying x1  · · ·  xn = x Output: shares yi satisfying y1  · · ·  yn = x254
1: (zi)i  (x2i )i 2: RefreshMasks((zi)i)
3: (yi)i  SecMult((zi)i, (xi)i) 4: (wi)i  (y4i )i 5: RefreshMasks((wi)i)
6: (yi)i  SecMult((yi)i, (wi)i) 7: (yi)i  (y1i6)i

 i zi = x2  i yi = x3  i wi = x12  i yi = x15  i yi = x240

Background

Rivain-Prouff Countermeasure [2]
9/21

SecExp254 - masked exponentiation in F28 with n shares [RP10]

Input: shares xi satisfying x1  · · ·  xn = x Output: shares yi satisfying y1  · · ·  yn = x254
1: (zi)i  (x2i )i 2: RefreshMasks((zi)i)
3: (yi)i  SecMult((zi)i, (xi)i) 4: (wi)i  (y4i )i 5: RefreshMasks((wi)i)
6: (yi)i  SecMult((yi)i, (wi)i) 7: (yi)i  (y1i6)i 8: (yi)i  SecMult((yi)i, (wi)i)

 i zi = x2  i yi = x3  i wi = x12  i yi = x15  i yi = x240  i yi = x252

Background

Rivain-Prouff Countermeasure [2]
9/21

SecExp254 - masked exponentiation in F28 with n shares [RP10]

Input: shares xi satisfying x1  · · ·  xn = x Output: shares yi satisfying y1  · · ·  yn = x254
1: (zi)i  (x2i )i 2: RefreshMasks((zi)i)
3: (yi)i  SecMult((zi)i, (xi)i) 4: (wi)i  (y4i )i 5: RefreshMasks((wi)i)
6: (yi)i  SecMult((yi)i, (wi)i) 7: (yi)i  (y1i6)i 8: (yi)i  SecMult((yi)i, (wi)i)
9: (yi)i  SecMult((yi)i, (zi)i)

 i zi = x2  i yi = x3  i wi = x12  i yi = x15  i yi = x240  i yi = x252  i yi = x254

Background

A Flaw in RP Countermeasure (FSE13)
10/21

1. (zi)i  (x2i )i 2. RefreshMasks((zi)i)
3. (yi)i  SecMult((xi)i, (zi)i) 4. (wi)i  (y4i )i 5. RefreshMasks((wi)i)
6. (yi)i  SecMult((yi)i, (wi)i) 7. (yi)i  (y1i6)i 8. (yi)i  SecMult((yi)i, (wi)i)
9. (yi)i  SecMult((yi)i, (zi)i)

Background

A Flaw in RP Countermeasure (FSE13)
10/21

1. (zi)i  (x2i )i 2. RefreshMasks((zi)i)
3. (yi)i  SecMult((xi)i, (zi)i) 4. (wi)i  (y4i )i 5. RefreshMasks((wi)i)
6. (yi)i  SecMult((yi)i, (wi)i) 7. (yi)i  (y1i6)i 8. (yi)i  SecMult((yi)i, (wi)i)
9. (yi)i  SecMult((yi)i, (zi)i)

Background

A Flaw in RP Countermeasure (FSE13)
10/21

1. (zi)i  (x2i )i 2. RefreshMasks((zi)i)
3. (yi)i  SecMult((xi)i, (zi)i) 4. (wi)i  (y4i )i 5. RefreshMasks((wi)i)
6. (yi)i  SecMult((yi)i, (wi)i) 7. (yi)i  (y1i6)i 8. (yi)i  SecMult((yi)i, (wi)i)
9. (yi)i  SecMult((yi)i, (zi)i)

Background

A Flaw in RP Countermeasure (FSE13)
10/21

1. (zi)i  (x2i )i 2. RefreshMasks((zi)i)
3. (yi)i  SecMult((xi)i, (zi)i) 4. (wi)i  (y4i )i 5. RefreshMasks((wi)i)
6. (yi)i  SecMult((yi)i, (wi)i) 7. (yi)i  (y1i6)i 8. (yi)i  SecMult((yi)i, (wi)i)
9. (yi)i  SecMult((yi)i, (zi)i)

· Vulnerable to (n/2 + 1)-th order
attacks due to the integration with RefreshMasks.

Background

A Flaw in RP Countermeasure (FSE13)
10/21

1. (zi)i  (x2i )i 2. RefreshMasks((zi)i)
3. (yi)i  SecMult((xi)i, (zi)i) 4. (wi)i  (y4i )i 5. RefreshMasks((wi)i)
6. (yi)i  SecMult((yi)i, (wi)i) 7. (yi)i  (y1i6)i 8. (yi)i  SecMult((yi)i, (wi)i)
9. (yi)i  SecMult((yi)i, (zi)i)

· Solution: secure the multiplication: h(x) = x · g(x), where g(x) = x2k.

· Vulnerable to (n/2 + 1)-th order
attacks due to the integration with RefreshMasks.

Background

A Flaw in RP Countermeasure (FSE13)
10/21

1. (zi)i  (x2i )i 2. RefreshMasks((zi)i)
3. (yi)i  SecH((xi)i, (zi)i) 4. (wi)i  (y4i )i 5. RefreshMasks((wi)i)
6. (yi)i  SecH((yi)i, (wi)i) 7. (yi)i  (y1i6)i 8. (yi)i  SecMult((yi)i, (wi)i)
9. (yi)i  SecMult((yi)i, (zi)i)

· Solution: secure the multiplication: h(x) = x · g(x), where g(x) = x2k.

· Vulnerable to (n/2 + 1)-th order
attacks due to the integration with RefreshMasks.

Background

A Flaw in RP Countermeasure (FSE13)
10/21

1. (zi)i  (x2i )i 2. RefreshMasks((zi)i)
3. (yi)i  SecH((xi)i, (zi)i) 4. (wi)i  (y4i )i 5. RefreshMasks((wi)i)
6. (yi)i  SecH((yi)i, (wi)i) 7. (yi)i  (y1i6)i 8. (yi)i  SecMult((yi)i, (wi)i)
9. (yi)i  SecMult((yi)i, (zi)i)

· Solution: secure the multiplication: h(x) = x · g(x), where g(x) = x2k.
· Suppose f(xi, xj) = xi · g(xj)  xj · g(xi)

· Vulnerable to (n/2 + 1)-th order
attacks due to the integration with RefreshMasks.

Background

A Flaw in RP Countermeasure (FSE13)
10/21

1. (zi)i  (x2i )i 2. RefreshMasks((zi)i)
3. (yi)i  SecH((xi)i, (zi)i) 4. (wi)i  (y4i )i 5. RefreshMasks((wi)i)
6. (yi)i  SecH((yi)i, (wi)i) 7. (yi)i  (y1i6)i 8. (yi)i  SecMult((yi)i, (wi)i)
9. (yi)i  SecMult((yi)i, (zi)i)

· Solution: secure the multiplication: h(x) = x · g(x), where g(x) = x2k.
· Suppose f(xi, xj) = xi · g(xj)  xj · g(xi)
· By the property of f(·, ·) that f(xi, xj) = f(xi, r)  f(xi, xj  r)

· Vulnerable to (n/2 + 1)-th order
attacks due to the integration with RefreshMasks.

Background

A Flaw in RP Countermeasure (FSE13)
10/21

1. (zi)i  (x2i )i 2. RefreshMasks((zi)i) 3. (yi)i  SecH((xi)i, (zi)i) 4. (wi)i  (y4i )i 5. RefreshMasks((wi)i) 6. (yi)i  SecH((yi)i, (wi)i) 7. (yi)i  (y1i6)i 8. (yi)i  SecMult((yi)i, (wi)i) 9. (yi)i  SecMult((yi)i, (zi)i)
· Vulnerable to (n/2 + 1)-th order
attacks due to the integration with RefreshMasks.

· Solution: secure the multiplication: h(x) = x · g(x), where g(x) = x2k.
· Suppose f(xi, xj) = xi · g(xj)  xj · g(xi)
· By the property of f(·, ·) that f(xi, xj) = f(xi, r)  f(xi, xj  r)
· Equation 1 equals to

i zi = =

i

j>i ri,j  xiyi 

j<i rj,i  f(xi, xj)

i

j>i ri,j  xiyi 

j<i rj,i  f(xi, rj,i)

f(xi, xj  rj,i) ,

if yi = g(xi).

Outline
Introduction Differential Power Analysis Masking Countermeasures High-Order DPA Attacks
Background Advanced Encryption Standard High-Order Masking Rivain-Prouff Countermeasure
Implementation ARM NEON Performance Analysis Implementation of Secure Field Multiplication
Results and Comparison
Conclusion

Implementation

ARM NEON
11/21

· ARM is a family of embedded processors
Low-cost, high-performance and energy-efficient Applications: smartphones, tablets, digital camera, etc.

Implementation

ARM NEON
11/21

· ARM is a family of embedded processors
Low-cost, high-performance and energy-efficient Applications: smartphones, tablets, digital camera, etc.
· NEON is an advanced SIMD extension on modern ARM processors

Implementation

ARM NEON
11/21

· ARM is a family of embedded processors
Low-cost, high-performance and energy-efficient Applications: smartphones, tablets, digital camera, etc.
· NEON is an advanced SIMD extension on modern ARM processors

Figure: SIMD Example

Implementation

ARM NEON
11/21

· ARM is a family of embedded processors
Low-cost, high-performance and energy-efficient Applications: smartphones, tablets, digital camera, etc.
· NEON is an advanced SIMD extension on modern ARM processors
Accelerate multimedia and signal processing

Implementation

ARM NEON
11/21

· ARM is a family of embedded processors
Low-cost, high-performance and energy-efficient Applications: smartphones, tablets, digital camera, etc.
· NEON is an advanced SIMD extension on modern ARM processors
Accelerate multimedia and signal processing Registers: thirty-two 64-bit registers (can also be viewed as sixteen 128-bit register)

Implementation

ARM NEON
11/21

· ARM is a family of embedded processors
Low-cost, high-performance and energy-efficient Applications: smartphones, tablets, digital camera, etc.
· NEON is an advanced SIMD extension on modern ARM processors
Accelerate multimedia and signal processing Registers: thirty-two 64-bit registers (can also be viewed as sixteen 128-bit register) Data Type: 8-, 16-, 32- and 64-bit (signed/unsigned) integers and 8and 16-bit polynomial

Implementation

ARM NEON
11/21

· ARM is a family of embedded processors
Low-cost, high-performance and energy-efficient Applications: smartphones, tablets, digital camera, etc.
· NEON is an advanced SIMD extension on modern ARM processors
Accelerate multimedia and signal processing Registers: thirty-two 64-bit registers (can also be viewed as sixteen 128-bit register) Data Type: 8-, 16-, 32- and 64-bit (signed/unsigned) integers and 8and 16-bit polynomial Arithmetic operations, boolean operations and others

Implementation

ARM NEON
11/21

· ARM is a family of embedded processors
Low-cost, high-performance and energy-efficient Applications: smartphones, tablets, digital camera, etc.
· NEON is an advanced SIMD extension on modern ARM processors
Accelerate multimedia and signal processing Registers: thirty-two 64-bit registers (can also be viewed as sixteen 128-bit register) Data Type: 8-, 16-, 32- and 64-bit (signed/unsigned) integers and 8and 16-bit polynomial Arithmetic operations, boolean operations and others Featured instruction:
VMULL.P8 VTBL.8

Implementation

Performance Analysis
12/21

Operations
SecSqur SecPow4 SecPow16 SecMult SecH SecExp254'

Field Multiplication
n 2n 4n n2 (n2 - n)(m + 2) + n 9n2 + 2n

Random Bits
0 0 0 (n2 - n)/2 n2 - n 3(n2 - n)

XOR
0 0 0 2(n2 - n) 7(n2 - n)/2 11(n2 - n)

Momeory
2n 2n 2n 2n + O(1) 3n + O(1) 4n + O(1)

Table: Complexity of masked algorithms for S-box with n shares, where m is the number of field multiplication in h(·).

Implementation

Performance Analysis
12/21

Operations
SecSqur SecPow4 SecPow16 SecMult SecH SecExp254'

Field Multiplication
n 2n 4n n2 (n2 - n)(m + 2) + n 9n2 + 2n

Random Bits
0 0 0 (n2 - n)/2 n2 - n 3(n2 - n)

XOR
0 0 0 2(n2 - n) 7(n2 - n)/2 11(n2 - n)

Momeory
2n 2n 2n 2n + O(1) 3n + O(1) 4n + O(1)

Table: Complexity of masked algorithms for S-box with n shares, where m is the number of field multiplication in h(·).

· Performance-critical parts:
Field Multiplication Random bits generation

Implementation

Barrett Reduction
13/21

· Designed to optimize the modular reduction r = a mod n, where a, n are integers and a < n2.

Implementation

Barrett Reduction
13/21

· Designed to optimize the modular reduction r = a mod n, where a, n are integers and a < n2.

· Adapted to polynomials [Dhe03]

Suppose U(x), Q(x), N(x) and Z(x) are polynomial over Fq, and U(x) = Q(x)N(x) + Z(x) A(x)/B(x) stands for the quotient of A(x)/B(x), ignoring the
reminder Quotient evaluation

Q(x) =

U(x) N(x)

= 

U(x) xp

xp+ N(x)

x

 =

T (x)R(x) x

,

where p = deg(N(x)),  deg(U(x)/xp) The reminder Z(x) = U(x) - Q(x)N(x).

Implementation

Field Multiplication in F28
14/21

Input: polynomials A(x), B(x) and N(x) in F28 , where N(x) = x8 + x4 + x3 + x + 1 Output: polynomial Z(x) = A(x) · B(x) mod N(x)
Pre-computation:

1: p  deg(N(x)) 2:   2  (p - 1)

p=8   = 14

3:   - p

4:

R(x)



 xp+
N(x)



 6  R(x) = x6 + x2 + x if  = 6

Implementation

Field Multiplication in F28
14/21

Input: polynomials A(x), B(x) and N(x) in F28 , where N(x) = x8 + x4 + x3 + x + 1 Output: polynomial Z(x) = A(x) · B(x) mod N(x)
Pre-computation:

1: p  deg(N(x)) 2:   2  (p - 1)

p=8   = 14

3:   - p

4:

R(x)



 xp+
N(x)



Multiplication with Barrett modular reduction:

 6  R(x) = x6 + x2 + x if  = 6

1: U(x)  A(x) · B(x)

2:

T (x)





U(x) xp



3: S(x)  T (x) · R(x)

4:

Q(x)





S(x) x



5: V(x)  Q(x) · N(x)

6: Z(x)  U(x) + V(x)

 deg(U(x)) 14  deg(T (x)) 6
 deg(S(x))  + 6  deg(Q(x)) 6  deg(V(x)) 14

Implementation Vector Implementation of Field Multiplication

15/21

fmult:

/*uint8x16_t fmult(uint8x16_t a, uint8x16_t b)*/

Implementation Vector Implementation of Field Multiplication

15/21

fmult:

/*uint8x16_t fmult(uint8x16_t a, uint8x16_t b)*/

VMULL.P8 Q2,D1,D3

1. U(x) = A(x) * B(x)

VMULL.P8 Q1,D0,D2

VMOVN.I16 D0,Q1

VMOVN.I16 D1,Q2

Implementation
fmult: VMULL.P8 Q2,D1,D3 VMULL.P8 Q1,D0,D2 VMOVN.I16 D0,Q1 VMOVN.I16 D1,Q2 VSHRN.U16 D2,Q1,#+8 VSHRN.U16 D3,Q2,#+8

Vector Implementation of Field Multiplication
15/21
1. U(x) = A(x) * B(x)
2. T(x) = U(x) / x8

Implementation
fmult: VMULL.P8 Q2,D1,D3 VMULL.P8 Q1,D0,D2 VMOVN.I16 D0,Q1 VMOVN.I16 D1,Q2 VSHRN.U16 D2,Q1,#+8 VSHRN.U16 D3,Q2,#+8 VMOV.U8 D7,#+70 VMULL.P8 Q2,D2,D7 VSHRN.U16 D2,Q2,#+6 VMULL.P8 Q2,D3,D7 VSHRN.U16 D3,Q2,#+6

Vector Implementation of Field Multiplication
15/21
1. U(x) = A(x) * B(x)
2. T(x) = U(x) / x8
3. S(x) = T(x) * R(x)
4. Q(x) = S(x) / x6

Implementation
fmult: VMULL.P8 Q2,D1,D3 VMULL.P8 Q1,D0,D2 VMOVN.I16 D0,Q1 VMOVN.I16 D1,Q2 VSHRN.U16 D2,Q1,#+8 VSHRN.U16 D3,Q2,#+8 VMOV.U8 D7,#+70 VMULL.P8 Q2,D2,D7 VSHRN.U16 D2,Q2,#+6 VMULL.P8 Q2,D3,D7 VSHRN.U16 D3,Q2,#+6 VMOV.U8 D2,#0x1B VMULL.P8 Q1,Q2,Q1

Vector Implementation of Field Multiplication
15/21
1. U(x) = A(x) * B(x)
2. T(x) = U(x) / x8
3. S(x) = T(x) * R(x)
4. Q(x) = S(x) / x6
5. V(x) = Q(x) * N(x)

Implementation

fmult:

VMULL.P8 Q2,D1,D3

VMULL.P8 Q1,D0,D2

VMOVN.I16 D0,Q1

VMOVN.I16 D1,Q2

VSHRN.U16 D2,Q1,#+8

VSHRN.U16 D3,Q2,#+8

VMOV.U8 D7,#+70

VMULL.P8 Q2,D2,D7

VSHRN.U16 D2,Q2,#+6

VMULL.P8 Q2,D3,D7

VSHRN.U16 D3,Q2,#+6

VMOV.U8 D2,#0x1B

VMULL.P8 Q1,Q2,Q1

VEOR

Q0,Q1,Q0

BX

LR

Vector Implementation of Field Multiplication
15/21
1. U(x) = A(x) * B(x)
2. T(x) = U(x) / x8
3. S(x) = T(x) * R(x)
4. Q(x) = S(x) / x6
5. V(x) = Q(x) * N(x) 6. Z(x) = U(x) + V(x)

Implementation Vector Implementation of Secure Field Multiplication
16/21

void sec_fmult(uint8x16_t c[], uint8x16_t a[], uint8x16_t b[], int n) {
int i, j; uint8x16_t s, t;
for (i = 0; i < n; i++) c[i] = fmult(a[i], b[i]);
for (i = 0; i < n; i++) for (j = i+1; j < n; j++) { s = rand_uint8x16(); c[i] = veorq_u8(c[i], s); t = fmult(a[i], b[j]); s = veorq_u8(s, t); t = fmult(a[j], b[i]); s = veorq_u8(s, t); c[j] = veorq_u8(c[j], s); }
}

void sec_h(uint8x16_t y[], uint8x16_t x[], uint8x16_t gx[], uint8x16_t (g_call)(uint8x16_t),int n) {
... for (...)
for (...) { ...
t = g_call(r01); t = fmult(x[i], t); r1 = veorq_u8(r00, t); t = fmult(r01, gx[i]); r1 = veorq_u8(r1, t); s = veorq_u8(x[j], r01); t = g_call(s); t = fmult(x[i], t); r1 = veorq_u8(t, r1); t = fmult(gx[i], s); r1 = veorq_u8(t, r1); y[j] = veorq_u8(y[j], r1); } }

Implementation

Improved Implementation Based on [KHL11] 17/21

· [KHL11] is vulnerable to the same attack on [RP10] · We propose a new secure inversion algorithm

SecInv4 - masked exponentiation in F24 with n shares

Input: shares xi satisfying x1  · · ·  xn = x Output: shares yi satisfying y1  · · ·  yn = x14
1: (wi)i  (x2i )i 2: (zi)i  SecH((xi)i, (wi)i) 3: (zi)i  (z4i )i 4: (yi)i  SecMult((zi)i, (wi)i)

 i wi = x2  i zi = x3  i zi = x12  i yi = x14

Outline
Introduction Differential Power Analysis Masking Countermeasures High-Order DPA Attacks
Background Advanced Encryption Standard High-Order Masking Rivain-Prouff Countermeasure
Implementation ARM NEON Performance Analysis Implementation of Secure Field Multiplication
Results and Comparison
Conclusion

Results

Performance Metrics
18/21

Peformance Metrics

#instructions

Field Multiplication

15

Random Bits Generation - xorshift96

15

XOR

1

Secure AddRoundKey Secure ShiftRows Secure MixColumns Secure Affine Transformation Secure Exp254

n 4n 13n 18n 191n2 - 26n

Table: The number of instructions required by vector implementation of each
function, where n is the number of shares

Penalty Factor Speedup Factor

Comparison

160
140
120
100 2
80
60
40
20 12
0 unmasked

2.3 2.1

18.4

9

8

4.3

1

2

PF (Section 3)

2.5 2
61.2

32.5

30.6

13

3

4

PF (Section 4)

Penalty Factor
19/21

150

4

114

3

2.2 83.6

2

2.1

68.2

2

54.3

41.8 1

5

6

Speedup Factor

0 7

Figure: Penalty factor (PF) of our implementation ([RP10]) in Section 3 and improved implementation (based on [KHL11]) in Section 4; Speedup factor of improved implementation in Section 4 compared to implementation in Section 3.

Comparison

Related Work
20/21

Method
CHES'10 [RP10] CHES'11 [KHL11] Coron [Cor14] Ours (Section 3) Ours (Section 4)

Platform
8-bit 8051 8-bit AVR
1.86 GHz Intel 32-bit ARM 32-bit ARM

First-order
65 439 9 4

Second-order
132 22 1205 19 8

Third-order
235 39 2411 32 13

Fourth-order
4003 60 31

Table: Penalty factor in different implementations

Outline
Introduction Differential Power Analysis Masking Countermeasures High-Order DPA Attacks
Background Advanced Encryption Standard High-Order Masking Rivain-Prouff Countermeasure
Implementation ARM NEON Performance Analysis Implementation of Secure Field Multiplication
Results and Comparison
Conclusion

Conclusion
21/21
· The performance-critical parts are field multiplication and random
bits generation.

Conclusion
21/21
· The performance-critical parts are field multiplication and random
bits generation.
· We utilize vmull.p8 instruction and Barrett Reduction to optimize
field multiplication, which only takes 15 instructions.

Conclusion
21/21
· The performance-critical parts are field multiplication and random
bits generation.
· We utilize vmull.p8 instruction and Barrett Reduction to optimize
field multiplication, which only takes 15 instructions.
· We further improve our performance by using composite field GF(28) GF((24)2).

Conclusion
21/21
· The performance-critical parts are field multiplication and random
bits generation.
· We utilize vmull.p8 instruction and Barrett Reduction to optimize
field multiplication, which only takes 15 instructions.
· We further improve our performance by using composite field GF(28) GF((24)2).
· Our implementations achieve a not bad penalty factor, hence, they
are deployable in practice.

Conclusion
21/21
· The performance-critical parts are field multiplication and random
bits generation.
Thank You! · We utilize vmull.p8 instruction and Barrett Reduction to optimize field multiplication, which only takes 15 instructions.
· We further improve our performance by using composite field GF(28) GF((24)2).
· Our implementations achieve a not bad penalty factor, hence, they
are deployable in practice.

Conclusion
21/21
· The performance-critical parts are field multiplication and random
bits generation.
Question? · We utilize vmull.p8 instruction and Barrett Reduction to optimize field multiplication, which only takes 15 instructions.
· We further improve our performance by using composite field GF(28) GF((24)2).
· Our implementations achieve a not bad penalty factor, hence, they
are deployable in practice.

