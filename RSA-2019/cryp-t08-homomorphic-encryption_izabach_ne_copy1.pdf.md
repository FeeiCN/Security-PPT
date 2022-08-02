SESSION ID: CRYP-T08 Homomorphic Encryption
New Techniques for Multi-value Input Homomorphic Evaluation and Applications
Sergiu Carpov and Malika Izabachène and Victor Mollimard
#RSAC

#RSAC
Homomorphic Encryption
Publicly operate on ciphertexts :
­ Correspondence between operations in the encrypted and in the clear domain.
Fully Homomorphic encryption
­ Allows to evaluate an arbitrary function over encrypted inputs. ­ In particular, Boolean circuits by composing elementary gate operations :
[ b ] , [ b ]  [ b  b ] , [¬ b ] , [ b  b ]
Many applications : Cloud computation, Delegation of computation over sensitive date, Encrypted prediction processing
2

Somewhat HE to FHE

#RSAC

Noise growth management using a refreshing technique Gentry's Bootstrapping [G09]

Amortized bootstrapping cost per gate is high Focus on reducing this cost
3

#RSAC
FHEW-based Fast Bootstrapping
[AP14] : achieve bootstrapping based on LWE with polynomial noise. [DM15] : Gate Bootstrapping for binary gate in  1sec. + extension. [CGGI16]/[CGGI17] : Gate Boostraping for MUX gate in 0.1sec. + arithmetic function via weighted automata. [BR15], [BDF18] : extension to larger gates (6-bits input,6-bits output in 10sec.). [MS18] : improve the amortized bootstrapping cost. This work : analysis of the FHEW-based bootstrapping structure.
optimization of the Bootstrapping for larger gates, application to hom. circuits 6-bits input, 6-bits output in 1.57sec.
4

FHEW-based Bootstrapping [DM15]

#RSAC

([BR15],[CGGI16],[BDF18], our work)

Input : a LWE ciphertext of  , description of , public parameters= (BK, ...). Output : a LWE ciphertext of   .

5

#RSAC
TFHE
T = module of reals modulo 1. Secret key : s  {0,1}n Encryption : c = ( a, b =m+ a  s + noise)  Tn+1 with a  Tn random. Decryption : Round  = b- a  s to the nearest element in message space.
Learning with errors assumption : (a, b) indistinguishable from random in Tn+1
6

#RSAC
TFHE
T = module of reals modulo 1. Secret key : s  {0,1}n Encryption : c=( a, b =mi+ a  s + noise)  Tn+1 with a  Tn random. Decryption : Round  = b- a  s to the nearest element in message space.

Example :  =

0,

1 4

,

-

1 4

,

1 2



1

and m =

1 2

 1

1. Compute = m+ noise

2. Choose a  Tn random

3. Return the ciphertext ( a, a  s +  )

7

#RSAC
TFHE Homomorphic Operations
TLWE Sample : (n+1) torus scalars. TRLWE Sample : k+1 torus polynomials of degree N. Operations in T : addition, external multiplication with integer elements.
8

#RSAC
TFHE Bootstrapping for evaluating :   
Step 1 : 1. Round c=(a,b) in a discrete space of size 2N. 2. Encode  as a polynomial TVF modulo XN+1 where = F  round. Step 2 : 1. Homomorphically rotate the polynomial by b- a  s positions.
Step 3 : 1. Extract the constant term which encrypts (). 2. Switch the ciphertext back to the original key.
9

#RSAC
Mutli-value Bootstrapping ­ Test Polynomial Factorization
First-phase test polynomial : divides the torus circle in two parts.
Second-phase test polynomial : builds a linear combination of previous half-circles.


#RSAC
Optimized multi-value Bootstrapping
11

#RSAC
Multi-output version
Evaluate several functions F1,..., Fq on the same input.
12

#RSAC
Homomorphic Lookup Table
A boolean Lookup Table (LUT) : 2  2 Consider the case q=1
 F   where F  2  2 and  : 2  2 s.t. (1,..., ) =  2i.

Homomorphic evaluation of the function  :

1.

Encode



as

 2+1

for





2 ,

encode

outputs

as

 2+1

for





2

on the half circle.

2. Multi-value Bootstrapping with TV0 =   and 1 with small norm.

13

Homomorphic Circuits

14

#RSAC


#RSAC
Implementation for r=6

Encryption Parameters (for 128 bits of security) :

TLWE : n = 803,  = 2-20  6.3

TRLWE: N = 214 ,  = 2-50  256

TRGSW: Bg = 26 ,  = 23

 2

Key Parameters (for 128 bits of security) :

LWE key : n = 803, h = 63

BK < 2 and KS  6 generated in 66sec. both

Running time : Multi-value Bootstrapping with 6-bit inputs, 6bits-outputs runs in 1.57 sec

on a single core of an Intel E3-1240 processor running at 3.50GHz.

15

#RSAC
Summary
Optimize the multi-value input Bootstrapping
­ Split factorization method for the test polynomial. ­ Large gate homomorphic evaluation. ­ Multi-output evaluation on the same input.
Application to homomorphic circuit
­ Implementation of 6-to-6 look-up-table in 1.57 sec (vs a 10sec in [BDF18]). ­ Only 0.05 sec. more for additonal 128 outputs on the same 6 input bits.
16

#RSAC
Conclusion
Other applications (hints in the paper):
­ Optimization of the circuit bootstrapping of [CGGI17] : invoke the gate bootstrapping main subroutine once rather than p times.
­ Activation function in neural network homomorphic evaluation : where f is a threshold function.
Further Improvements ?
­ Other possible factorization instanciations than splitting  as 0 and 1 ?
Implement other applications where evaluating f using the Multi-value Bootstrapping could be efficient.
17

