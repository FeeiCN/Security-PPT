SESSION ID: CRYP-R02
Efficient FPGA Implementations of LowMC and Picnic

Roman Walch
PhD Student IAIK / Know-Center GmbH, Graz University of Technology @rw0x0

#RSAC

#RSAC
Post-Quantum Digital Signatures
Shor`s algorithm for factoring and discrete logarithm Quantum computer breaks:
­ Most asymmetric cryptography ­ RSA, DSA, ECDSA, ...
NIST Standardization Project for PQ Signatures
­ Currently second round ­ Picnic [Cha+17; Cha+19] (using LowMC [Alb+15]) ­ Performance optimized implementations required
2

#RSAC
Contribution
First efficient VHDL implementation of LowMC First VHDL implementation of Picnic
­ Picnic1-L1-FS: 128 (64) bit security (PQ) ­ Picnic1-L5-FS: 256 (128) bit security (PQ)
Coprocessors accessible via PCIe interface
­ Communication protocol confrom with NIST recommendation
3

#RSAC
The LowMC Block Cipher

#RSAC
LowMC ­ Round
Substitution-Permutation Network (SPN) with reduced SboxLayer:
5

#RSAC
LowMC ­ Details

Designed to minimize AND gates (3 ANDs / Sbox)
­  , ,  =      ,        ,         

Linear Layer:
­ State multiplied with matrix over (2) ­  ×  matrix per round
Roundkey schedule
­ Key multiplied with matrix over (2) ­  ×  matrix per round + inital key whitening

 ... blocksize  ... keysize

6

#RSAC
LowMC ­ Constants per Instance

Naive implementaion:
­ L1: ~82 kiB ­ L5: ~617 kiB

Optimizations by [Din+19]:
­ L1: ~29 kiB ­ L5: ~117 kiB

Impact on hardware utilization

LowMC nr.     L1 128 128 10 20 L5 256 256 10 38

without opt. LUTs % LUTs 42 395 20.80% 209 348 102.72%

with opt. LUTs % LUTs 13 558 6.65% 44 431 21.8 %

Improv. %
68.02% 78.78%

7

#RSAC
The Picnic Signature Scheme

#RSAC
-protocol and Fiat-Shamir
-protocol for proof of knowledge Fiat-Shamir (FS) transformation:
­ Proof becomes non-interactive ­ Secure in the random oracle model (ROM)
9

#RSAC
Picnic ­ Building Blocks
FS transformed -protocol -protocol: ZKB++ or KKW Proof system:
­ Multi-party computation (MPC) of LowMC ­ Random oracle: SHAKE (Keccak)
Keys:
­ Relation:  = LowMC(, ) ­ Public Key:  = (, ) ­ Secret Key:  = 
10

#RSAC
Picnic ­ MPC
MPC of 3 LowMC encryptions
­  = 0  1  2 ­  = LowMCMPC(, ) ­ 0  1  2 = 
Repeat  times
­ Reduce probability to cheat ­ Picnic1-L1-FS:  = 219 ­ Picnic1-L5-FS:  = 438
11

#RSAC
Picnic ­ MPC contd.
3 players calculate:
­  = LowMCMPC(, )
MPC rules to ensure 0  1  2 = :
­ XOR with constant only for one player ­ Players calculate AND gates ( =   ) jointly: ­  = (   + 1) ( + 1  ) (  ) (   + 1)
 Special Sbox implementation
12

#RSAC
Picnic ­ MPC Implementation
3 players calculated in parallel Further improvement
­ Precomputation of one share ­ Only 2 LowMC instances on FPGA
Sign / Verify use same LUTs for matrices
­ But different Sbox implementation
13

#RSAC
Picnic ­ Other Submodulues
Seeds and Tapes
­ Provide Pseudorandomness
Commitments
­ Players commit to results ­ Part of signature
Challenge (Random Oracle)  All using SHAKE (different configurations)
14

#RSAC
Picnic ­ Implementation
Custom SHAKE implementation 3 players parallel per run  BRAM for intermediate values
­ ~400 kiB for Picnic1-L5-FS
Picnic1-L1-FS and Picnic1-L5-FS implementations for
­ Sign / Verify only ­ Sign and Verify combined
15

#RSAC
Practical Evaluation

#RSAC
FPGA and PCIe
Xilinx Kintex-7 FPGA KC705 Evaluation Kit PCIe/DMA subsystem
­ Manages FPGA/PC interface
AXI4-Stream
­ High data throughput master/slave bus interface ­ Handshake parallel to data transfer ­ Connects our design to PCIe/DMA
Developed C-Library for PC/FPGA communication
17

#RSAC
Hardware Utilization

Lookup tables (LUTs) and BRAM utilization (% available)

Design Part LowMC-MPC-L1 LowMC-MPC-L5 Picnic1-L1 Picnic1-L1-Sign Picnic1-L1-Verify Picnic1-L5 Picnic1-L5-Sign Picnic1-L5-Verify PCIe/DMA

LUTs 32 224 98 319 90 037 76 472 68 614 167 530 149 456 138 547 22 216

% 15.81 % 48.24 % 44.18 % 37.52 % 33.67 % 82.20 % 73.33 % 67.98 % 10.90 %

BRAM 0 0
52.5 52.5 33.5 98.5 98.5 62.5 42.5

% 0 % 0 % 11.80 % 11.80 % 7.53 % 22.13 % 22.13 % 14.04 % 9.55 %

18

#RSAC
Runtime Comparison

Software platform:
­ Ubuntu 18.04.1, GCC 7.3.0, 16 GB RAM ­ CPU: Intel i7-4790, 3.6 GHz

Coprocessor

clock clock FPGA C-Access frequency cycles runtime runtime

MHz k cycles ms

ms

Picnic1-L1-Sign

125 ~31.3 0.25 0.35

Picnic1-L1-Verify

125 ~29.6 0.24 0.40

Picnic1-L5-Sign

125 ~154.5 1.24 1.38

Picnic1-L5-Verify

125 ~146.6 1.17 2.13

Software

SIMD No SIMD

ms

ms

1.44 2.82

1.15

2.34

5.87 12.37

4.92 10.59

19

#RSAC
Design Choices ­ Reducing LUT Utilization
Implementation is optimized for speed LowMC matrices encoded in LUTs
­ 1 multiplication per clock cycle ­ High LUT utilization
Reduce LUT utilization
­ Store LowMC matrices in BRAM ... reduces performance ­ LowMC same matrix each round? ­ GMiMC [Alb+19] instead of LowMC?
20

#RSAC
Conclusion
First efficient VHDL implementation LowMC First VHDL implementation of Picnic
­ Picnic1-L1-FS and Picnic1-L5-FS
Extended to FPGA-based coprocessor (PCIe Interface) Good runtime
­ Trade off with high hardware utilization
21

#RSAC
Efficient FPGA Implementations of LowMC and Picnic
Questions?

#RSAC
Bibliography I

[Alb+15] [Alb+19] [Cha+17]

Martin R. Albrecht, Christian Rechberger, Thomas Schneider, Tyge Tiessen, and Michael Zohner. Ciphers for MPC and FHE. EUROCRYPT (1). Vol. 9056. LNCS. Springer, 2015, pp. 430­454.
Martin R. Albrecht, Lorenzo Grassi, Léo Perrin, Sebastian Ramacher, Christian Rechberger, Dragos Rotaru, Arnab Roy, and Markus Schofnegger. Feistel Structures for MPC, and More. ESORICS (2). Vol. 11736. LNCS. Springer, 2019, pp. 151­171.
Melissa Chase, David Derler, Steven Goldfeder, Claudio Orlandi, Sebastian Ramacher, Christian Rechberger, Daniel Slamanig, and Greg Zaverucha. Post-Quantum Zero-Knowledge and Signatures from Symmetric-Key Primitives. ACM CCS. ACM, 2017, pp. 1825-1842.

#RSAC
Bibliography II

[Cha+19] [Din+19]

Melissa Chase et al. The Picnic Signature Scheme Design Document (version 2). 2019. URL: https://github.com/microsoft/Picnic/blob/master/spec/design-v2.0.pdf.
Itai Dinur, Daniel Kales, Angela Promitzer, Sebastian Ramacher, and Christian Rechberger. Linear Equivalence of Block Ciphers with Partial Non-Linear Layers: Application to LowMC. EUROCRYPT (1). Vol. 11476. LNCS. Springer, 2019, pp. 343­372.

