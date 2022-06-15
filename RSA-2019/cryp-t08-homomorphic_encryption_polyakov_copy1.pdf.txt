SESSION ID: CRYP-T08
An Improved RNS Variant of the BFV Homomorphic Encryption Scheme

Yuriy Polyakov
Associate Research Professor New Jersey Institute of Technology
Joint work with Shai Halevi (IBM) and Victor Shoup (NYU)

#RSAC

Introduction to Homomorphic Encryption

#RSAC
Homomorphic Encryption

Homomorphic Encryption (HE): A non-interactive secure computing approach to perform computations over encrypted sensitive data without ever decrypting them.
Enables outsourcing of data storage/processing to a public cloud without compromising data privacy.
HE schemes provide efficient instantiations of post-quantum public-key and symmetric-key encryption schemes.
Homomorphic encryption can be viewed as a generalization of public key encryption.

Presenter's Company

Logo ­ replace or

delete on master slide

3

#RSAC
HE vs Other Secure Computing Approaches

HE

MPC

SGX

Performance

Compute-bound Network-bound

Privacy Non-interactive

Encryption 

Encryption / Noncollusion


Trusted Hardware 

Cryptographic



security





(known attacks)

Presenter's Company Logo ­ replace or
delete on master slide

Hybrid approaches are possible
4

#RSAC
Applications of Homomorphic Encryption

Presenter's Company

Logo ­ replace or

delete on master slide

5

#RSAC
Key Players in the HE Market
HE is already practical for many applications, and is being commercialized Key players
­ Microsoft (SEAL library) ­ IBM (HELib library) ­ Duality Technologies (PALISADE library)

Presenter's Company

Logo ­ replace or

delete on master slide

6

#RSAC
Key Concepts on Popular HE Schemes

All popular schemes are based on large-degree (>1000) polynomials with integer coefficients.
Integer coefficients are typically large and require multiprecision arithmetic (larger than 32 or 64 bits on typical systems).
Popular schemes working with large-integer coefficients:
­ Brakerski-Gentry-Vaikuntanathan (BGV): fastest for exact number arithmetic ­ Brakerski/Fan-Vercauteren (BFV): most usable for exact number arithmetic ­ Cheon-Kim-Kim-Song (CKKS): ideal for approximate number arithmetic

Presenter's Company

Logo ­ replace or

delete on master slide

7

#RSAC
PALISADE Lattice Cryptography Library

Project-based Development since 2014
­ Funded by DARPA, IARPA, Sloan Foundation, NSA, and Simons Foundation
Key Implementation Partners and Collaborators
­ Academia: MIT, UCSD, WPI, NUS, Sabanci U ­ Industry: Raytheon (BBN), Duality Technologies, IBM Research, Lucent,
Vencore Labs, Galois, Two Six Labs
BSD 2-clause license & Cross-Platform Support
Implements HE schemes (BGV, BFV, etc.), proxy re-encryption, digital signatures, identity-based encryption, attribute-based encryption, etc.

Presenter's Company

Logo ­ replace or

delete on master slide

8

Our Optimized Variant of the BFV Scheme

#RSAC
Why RNS is important?
Benefits of Residue Number System (RNS) or Chinese Remainder Theorem (CRT) representation of polynomial coefficients
­ RNS works with native (machine-word size) integers: faster (up to 10x) and simpler than multi-precision integer arithmetic
­ Runtime scales (quasi)linearly with integer size ­ RNS dramatically improves memory locality ­ Computations are easily parallelizable ­ RNS supports efficient GPU/FPGA hardware implementations

Presenter's Company

Logo ­ replace or

delete on master slide

10

#RSAC
Prior Work

Double-CRT variant of BGV [GHS12]

RNS variants of LTV (NTRU) scheme [CR14, DHS16], later implemented using FPGA and GPU

Full RNS variant of BFV [BEHZ16]
­ Performs all operations in RNS ­ Uses sophisticated scaling and CRT extension techniques ­ Introduces auxiliary parameters (not present in BFV) and extra noise
(which can be significant) ­ Normalized performance is about 2x slower than our variant

Presenter's Company

Logo ­ replace or

delete on master slide

11

#RSAC
Challenges of Scale-Invariant Schemes (BFV)
Decryption invariant

Scaling in decryption

Scaling in homomorphic multiplication (tensor product without modular reduction)

Ciphertext digit decomposition in key switching (relinearization)

Presenter's Company

Logo ­ replace or

delete on master slide

12

Our Approach to CRT Basis Extension and Scaling

#RSAC

Operations

Big modulus is a smooth integer

, where qi are same-

size, pair-wise coprime, single-precision integers (typically of size

30-60 bits)

Use CRT reconstructions:

Presenter's Company

Logo ­ replace or

delete on master slide

13

#RSAC
Our Approach to CRT Basis Extension
Extend to modulus p
Estimate (using floating-point arithmetic)

Compute

Presenter's Company

Logo ­ replace or

delete on master slide

14

#RSAC
Our Approach to Scaling

Separate into integer and fractional parts

Fractional parts are precomputed and stored as floating-point numbers
The cost of handling approximation errors to support CRT moduli up to 60 bits is small

Presenter's Company

Logo ­ replace or

delete on master slide

15

Our Results and Their Impact

#RSAC
Experimental Results in PALISADE

Presenter's Company Logo ­ replace or
delete on master slide

10X FASTER THAN PRIOR BFV IMPLEMENTATION IN PALISADE!
17

#RSAC
Experimental Results in PALISADE

Presenter's Company

Logo ­ replace or

delete on master slide

18

#RSAC
Other Applications of Our Work

The RNS operations proposed in our work can also be used for CKKS and BGV, as well as many other number theory cryptographic primitives.
For instance, they were used to develop an efficient RNS variant of CKKS for a winning secure genome-wide association studies (GWAS) solution at iDASH'18.
­ For 245 individuals, 15K SNPs (genetic variations), and 3 covariates Duality Technologies developed a logistic-regression-based HE solution in PALISADE that runs under 4 minutes on a 4-core machine and uses less than 10 GB of RAM.

Presenter's Company

Logo ­ replace or

delete on master slide

19

#RSAC
Apply Our BFV Variant to Your Problem!

Download PALISADE library
­ palisade-crypto.org

Download the manual
­ https://git.njit.edu/palisade/PALISADE/blob/master/doc/palisade_man ual.pdf

Write an HE-enabled version of your application

Contact us by email if you have any questions
­ palisade@njit.edu

Presenter's Company

Logo ­ replace or

delete on master slide

20

#RSAC
References

[GHS12] Gentry C., Halevi S., Smart N.P. (2012) Homomorphic Evaluation of the AES Circuit. CRYPTO 2012.
[CR14] D. B. Cousins and K. Rohloff, A Scalable Implementation of Fully Homomorphic Encryption Built on NTRU, WAHC'14.
[DHS16] Yarkin Doröz, Yin Hu, and Berk Sunar, Homomorphic AES evaluation using the modified LTV scheme, Designs, Codes and Cryptography, Vol. 80, 2016.
[BEHZ16] Jean-Claude Bajard, Julien Eynard, M. Anwar Hasan, and Vincent Zucca, A Full RNS Variant of FV Like Somewhat Homomorphic Encryption Schemes, SAC'16.

Presenter's Company

Logo ­ replace or

delete on master slide

21

