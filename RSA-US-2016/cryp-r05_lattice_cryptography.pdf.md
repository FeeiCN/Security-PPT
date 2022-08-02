Which Ring-Based SHE Scheme is best?
Anamaria Costache and Nigel P. Smart
University of Bristol

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 1

Fully Homomorphic Encryption
Homomorphic encryption allows to compute on encrypted data.
Allows to outsource computation to an untrusted server. Signal processing satellite applications. Analysing data (e.g. medical data) without compromising confidential information.

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 2

Fully Homomorphic Encryption

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 3

Fully Homomorphic Encryption
A (fully) homomorphic encryption scheme E comprises of four algorithms: KeyGen, Enc, Dec and Evaluate.
For (sk , pk )  KeyGen(), plaintext message m with corresponding ciphertext c and circuit C , we say that E is correct if
Dec(sk , Evaluate(pk , C, c)) = C(m).
E is Fully Homomorphic if it is correct for all circuits C. Somewhat Homomorphic if it is correct for some circuits C.

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 4

Fully Homomorphic Encryption
RSA encryption is multiplicatively homomorphic [Rivest Shamir Adleman 77]. Paillier is additively homomorphic [Paillier 99]. A scheme both additively and multiplicatively homomorphic is more powerful, but also harder to obtain.

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 5

A History of Homomorphic Encryption
First Generation: Gentry's first FHE scheme, bootstrappable [Gentry 09]
Second Generation: Ring-Based leveled Somewhat Homomorphic Schemes, smaller ciphertexts. Use double-CRT to achieve a SIMD system and enhance efficiency. [Gentry Halevi Smart 11]
Third Generation: Schemes such as [Gentry Sahai Waters 13]. Integer-based schemes, but slower computations and somewhat impractical.

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 6

The problem
Different applications call for different parameters. For example plaintext spaces vary, or depth of the circuit we want to evaluate.
Ideally we want an unbounded scheme, but not all applications require this.
Even when restricted to a certain form of HE, there are many schemes available.

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 7

We pick four of the most used Ring-Based schemes, BGV, FV, NTRU and YASHE and compare them against each other.
On the face of it, YASHE and FV should be more efficient since they are scale-invariant, which should save in computation time.
Similarly, NTRU and YASHE have fewer ring elements in the ciphertexts.
What effect do the above have on the efficiency of the scheme?

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 8

A Noise Problem
All messages are encrypted by adding a noise factor to a multiple of the original message.
Enc(pk , m) = c =  · m + e( mod q).
But then c · c has noise 2 ·  · m + e2: c · c = ( · m + e) · ( · m + e) = 2 · m2 + 2 ·  · m + e2.

This grows quickly, implying a need for a noise-management control.

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 9

A Noise Management Technique: SwitchModulus

We use a chain of primes p0 < p1 < · · · < pL-1 and let

qt =

t i =0

pi

.

This gives a chain of moduli q0 < q1 < · · · < qL-1 such that qi | qi+1.

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 10

qt qt-1 · · · q1

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 11

The four schemes; DecBpkGV(c)

Decryption of a ciphertext ((c0, c1), t) at level t is performed by setting

and outputting

m  [c0 - sk · c1]qt ,

m mod p.

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 12

The four schemes; DecYpkASHE(c)
Decryption of a ciphertext (c, t) at level t is performed by setting

and outputting

p m  qt · [c · sk ]qt ,
m mod p.

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 13

How do we compare the four schemes?
We follow the security analysis in [Gentry Halevi Smart 13], which itself follows on from Lindner-Peikert [Lindner Peikert 10].

We assume that we encrypt, perform  additions, one multiplication,  additions, one multiplication and so on. We perform a SwitchKey operation and a Scale after each multiplication.
We measure efficiency by the size of a ciphertext in kBytes.

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 14

Analysis

Decryption is done by either modular reduction or a rounding operation. Thus if the noise is too large, we could decrypt erroneously.

To ensure correct decryption, we require



p0  4 · cm · Bscale = 2 · cm · B <

 

p0

p

For BGV and NTRU (1)
For FV and YASHE.

This gives us a lower bound on our bottom modulus.

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 15

Top modulus

We want to find the sizes of the primes used in moduli. We start with the top level and calculate the primes we need with correct decryption in mind.

We start off with a fresh ciphertext. We perform a number of additions, one multiplication and one scale operation, and calculate a noise bound B2 on the resulting ciphertext.

We require

pL-1 

. B2
Bscale

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 16

Middle moduli
For the middle moduli, we use the same methodology. The only difference is that that we do not start off with a fresh ciphertext, so the initial noise will be different. We call this bound B (t), and we require
B (t) pt  Bscale .
We can then iterate downwards, using log2 qt = log2 qt+1 - log2 pt+1.

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 17

Results; L = 5 and varying plaintext modulus size

log2(p)

BGV NTRU

FV YASHE

16

14

log2(|c|) kBytes

12

10

8

6

0

50 100 150 200 250

log2(p)

We see that the BGV scheme quickly takes over all other values.

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 18

Results; L = 5 and varying plaintext modulus size

log2(p)

BGV FV NTRU YASHE

7

6.5

log2(|c|) kBytes

6

5.5

5

4.5
0 2 4 6 8 10 12 14 log2(p)

For small values of p, YASHE is indeed preferable. But as seen in

the previous slide, BGV is better overall.

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 19

Results; plaintext modulus p = 2, for varying depth L

BGV FV NTRU YASHE 12

10

log2(|c|) kBytes

8

6

4

2 5

10 15 20 25 30 L

As previously, YASHE wins for small p...

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 20

Results; plaintext modulus p = 232, for varying depth L
BGV FV NTRU YASHE

16

14

log2(|c|) kBytes

12

10

8

6

4 5

10 15 20 25 30 L

... and BGV for large p. In fact, the size of L has no impact on the schemes' performance.

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 21

Open questions
We have done a crude security analysis, in order to examine how the scheme parameters are affected by scaling the plaintext modulus p and the depth required of the scheme.
A stricter security analysis would contribute to the survey. This would need to take into account attacks such as [Albrecht Bai Ducas 16].

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 22

Thank you!
Any questions?

Anamaria Costache and Nigel P. Smart Which Ring-Based SHE Scheme is best?

Slide 23

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
CT-RSA Conference 2016

NFLlib
NTT-based Fast Lattice Library

Carlos Aguilar-Melchor1 Joris Barrier2 Serge Guelton3 Adrien Guinet3 Marc-Olivier Killijian2 Tancrède Lepoint4
1Université de Toulouse, CNRS, France, carlos.aguilar@enseeiht.fr 2Université de Toulouse, CNRS, France, {joris.barrier,marco.killijian}@laas.fr
3Quarkslab, France, {sguelton,aguinet}@quarkslab.com 4CryptoExperts, France, tancrede.lepoint@cryptoexperts.com
February 23, 2016

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

1/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
Outline
1 Introduction
2 NFLlib What is in the box ? Specific Modulus NTT form CRT Representation Gaussian Random Generator
3 Applications : Ideal Lattice Cryptography High Performance Key Exchange Somewhat Fully Homomorphic Encryption
4 Application : PIR
5 Conclusion

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

2/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
A Brief Overview
A Library... NFLlib is a homemade C++ library to efficiently deal with polynomials.
...Specialized Indeed, NFLlib works exclusively with polynomials usually considered in (ideal) lattice-based cryptography.
polynomials of fixed degree (a power of two), with coefficient of fixed size (modular operations).
P (X ) = a0 + a1X + a2X 2 + · · · + an-1X n-1 + anX n

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

3/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
A Brief Overview
A Library... NFLlib is a homemade C++ library to efficiently deal with polynomials.
...Specialized Indeed, NFLlib works exclusively with polynomials usually considered in (ideal) lattice-based cryptography.
polynomials of fixed degree (a power of two), with coefficient of fixed size (modular operations).
P (X ) = a0 + a1X + a2X 2 + · · · + an-1X n-1 + anX n

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

3/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
How to use NFLlib : Practice example
1 /* Set polynomial type with T the native type used 2 * such as uint16_t, uint32_t, uint64_t */ 3 using poly_t = nfl::poly_from_modulus<T, degree, modulus>; 4 poly_t p1, p2, p3, p_res;
5
6 /*Fill polynomials with noise using different noise generators */ 7 p1 = poly_t(nfl::uniform); //or p1 = nfl::uniform; 8 p2 = poly_t(nfl::gaussian<poly_t>(prng_instance)); 9 p3 = poly_t(nfl::bounded(bound));
10
11 /*Overloaded operators for an easy use */ 12 p_res = (p1 * p2) + p3 - p1;

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

4/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
NFLlib
1 Introduction
2 NFLlib What is in the box ? Specific Modulus NTT form CRT Representation Gaussian Random Generator
3 Applications : Ideal Lattice Cryptography High Performance Key Exchange Somewhat Fully Homomorphic Encryption
4 Application : PIR
5 Conclusion

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

5/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
What is in the box ?

Enabled Optimizations
NFLlib is a C++ library with state of the art optimizations : Specific modulus ; NTT polynomial representation ; CRT representation to use big modulus ; NTT and iNTT optimized algorithm ; SSE and AVX2 processor instructions.

Remark : HElib This kind of optimizations are implemented in HElib in the DoubleCRT class.

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

6/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
Modulus Optimizations

We choose our primes such as for an integer 1  s0  s - 1, a chosen prime p verifies ( Note that all our 62-bit primes verify Eq. 1) :

(1 + 1/23s0 ) · /(2s0 + 1) < p < /2s0

(1)

Algorithm 1: Modular reduction with a modulus verifying Eq. 1 Input: u = u1,u0  [0,p2), p verifying Eq. (1), v0 = 2/p mod , 1  s0  s - 1 margin
bits Output: r = u mod p 1 q  v0 · u1 + 2s0 · u mod 2 2 r  u - q/ · p mod  3 if r  p then r  r - p 4 return r
Algo. 1 is a significantly improvement from Moller, N., Granlund, T., "Improved division by invariant integers". IEEE Trans.
Computers (2011).

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

7/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
NTT form
Polynomials representation In NFLlib polynomials are represented and handled in an evaluated form using the Number Theoretic Transform (Discrete Fourrier Transform).
Advantages By the book, polynomials multiplication is in O(n2). In the NTT form, the multiplication is an element-to-element multiplication in (obviously) O(n).  Great performance improvement

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

8/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
NTT form
Polynomials representation In NFLlib polynomials are represented and handled in an evaluated form using the Number Theoretic Transform (Discrete Fourrier Transform).
Advantages By the book, polynomials multiplication is in O(n2). In the NTT form, the multiplication is an element-to-element multiplication in (obviously) O(n).  Great performance improvement

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

8/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
CRT Representation

Motivation
For performance reason we do not use specialized libraries to handle moduli that do not fit in native types when working directly with polynomials. However, we don't want to limit too strictly moduli sizes. So we use Chinese Theorem Representation (CRT) to deal with big moduli by splitting them in smaller integers.

Recover To recover big moduli we call an external library because we cannot do a better implementation.
HElib Note that in HElib they use FFT representation for big modulus instead of CRT.

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

9/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
Gaussian Random Generator
Description unsigned int sigma = 20; unsigned int security = 128; unsigned int sample = 1 << 14;
FastGaussianNoise<uint8_t, T, 2> fg_prng(sigma, security, sample);

Distribution

Uniform

cycles / bit generated1 0.4

D3·19 1.39

D300 3.43

1We implement a constant time algorithm with a ×4 overhead
Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

10/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
Applications : Key Exchange & SFHE
1 Introduction
2 NFLlib What is in the box ? Specific Modulus NTT form CRT Representation Gaussian Random Generator
3 Applications : Ideal Lattice Cryptography High Performance Key Exchange Somewhat Fully Homomorphic Encryption
4 Application : PIR
5 Conclusion

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

11/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
High Performance Key Exchange

Key Exchange Protocol
To illustrate the performances of our library in a concrete setting we implement an equivalent of the key transport protocol RSASVE of NIST SP 800 56B. The client chooses a random message and encrypts it with the server public key then, the server decrypts this random value that is used to derivate (with a hashing function) a common secret.

Protocol

80 bits

RSA

7.95 Kops/s

ECDH

7.01 Kops/s

RLWE/NFLlib 2 N/A

128 bits 0.31 Kops/s 5.93 Kops/s 1020 Kops/s

256 bits N/A 1.61 Kops/s 508 Kops/s

2Enabled forward secrecy divides performances by 2
Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

12/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
Somewhat Fully Homomorphic Encryption

SFHE
We modified the open-source implementation of the somewhat homomorphic encryption scheme of Fan and Vercauteren from [1] and directly replaced flint by NFLlib .

[1] with flint [1] with NFLlib Gain

Encrypt 26.7ms 0.9ms ×30

Decrypt 13.3ms 0.9 ms ×15

Hom. Add. 1.1ms 0.01ms ×110

Hom. Mult. 91.2ms 17.2ms ×5.5

1. Tancrede Lepoint and Michael Naehrig. "A Comparison of the Homomorphic Encryption Schemes FV and YASHE "

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

13/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
Application : PIR
1 Introduction
2 NFLlib What is in the box ? Specific Modulus NTT form CRT Representation Gaussian Random Generator
3 Applications : Ideal Lattice Cryptography High Performance Key Exchange Somewhat Fully Homomorphic Encryption
4 Application : PIR
5 Conclusion

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

14/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
Private Information Retrieval

Computational Private Information Retrieval (PIR)
A PIR scheme is a protocol in which a user retrieves a record from a database while hiding which from the database administrators. A computational PIR protocol requires that the database server executes an homomorphic cryptography based algorithm over all the database content.

Protocol Throughput

[2] 0.5 Gb/s

[3] 1 Gb/s

[4] 20 Gb/s

2. J. T. Trostle and A. Parrish, "Efficient computationally private information retrieval from anonymity or trapdoor groups," in ISC 2010 3. C. Aguilar Melchor and P. Gaborit, "A Fast Private Information Retrieval Protocol," in ISIT'08 4. cPIR based on Lipmaa scheme using lattice based cryptography implemented with NFLlib

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

15/16

Introduction NFLlib Applications : Ideal Lattice Cryptography Application : PIR Conclusion
Conclusion
NFLlib is an optimized and efficient library designed to handle polynomials over polynomials rings Zp[x]/(xn + 1) in NTT form.
It can be used as a building block for ideal lattice based cryptography that can be more efficient than existing implementations based on NTL or flint .
Code available at : https://github.com/quarkslab/NFLlib

Carlos Aguilar-Melchor, Joris Barrier, Serge Guelton, Adrien Guinet, Marc-Olivier Killijian, Tancrède Lepoint | NFLlib : NTT-based Fast Lattice Library

16/16

