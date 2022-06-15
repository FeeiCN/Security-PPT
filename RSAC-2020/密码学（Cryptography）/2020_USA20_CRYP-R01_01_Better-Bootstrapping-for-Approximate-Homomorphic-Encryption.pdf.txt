SESSION ID: CRYP-R01
Better Bootstrapping for Approximate Homomorphic Encryption
Dohyeong Ki
Seoul National University
#RSAC

#RSAC
Need for a Faster Homomorphic Encryption

Modern Data Analysis Algorithms
Machine Learning Algorithms: Covolutional Neural Network (CNN), Deep Neural Network
(DNN), etc.
Extremely Complicated
2

Require faster homomorphic operations and faster boostrapping

#RSAC
What We Do
Suggest a generalized key-switching method for the Full-RNS variant of HEAAN Propose a new polynomial approximation method to evaluate a sine function, which is specialized for the bootstrapping for HEAAN Give first implementation of bootstrapping for Full-RNS variant of approximate homomorphic encryption
3

#RSAC
Generalized Key-switching Method for the Full-RNS Variant of HEAAN

#RSAC
Preliminary

Full-RNS variant of HEAAN
 = {0, 1, ... , } : Base primes    = 0, 1, ... ,  : Temporary Moduli
Reduce the size of error generated from key-switching  = =0    = =0 
  

SEAL (v3.3 -)
One temporary modulus + RNS decomposition method
5

 = 1

#RSAC
Motivation
· k (assume the same security level) Advantages
1. The number of evaluation keys for key-swtiching 2. Complexity for key-switching
Disadvantages
1. The number of levels supported
6

#RSAC
Key Ideas
[1] Temporary modulus technique
 = 0, 1, ... ,  : Temporary Moduli  = {0, 1, ... , } : Base primes  



 =

 



max
0<



=0

  
7

#RSAC
Key Ideas
[2] RNS-decomposition method
Can perform key-switching as
8

#RSAC
Complexity of Homomorphic Multiplication

Total Complexity for Homomorphic Multiplication
    + log    + (2 + log )  2  (1/) + () if we set  to  and regard other parameters as constants

The total complexity is minimized when  =

2+log +log

 





9

#RSAC
A New Polynomial Approximation Method to Evaluate a Sine Function
- Specialized to the Bootstrapping for HEAAN

#RSAC
Preliminary : Bootstrapping for HEAAN
Goal

Steps
 =    ( )
Modulus Raising
 =    ( 0)
   =   + ()

 0, ... , /2-1  /2, ... , -1

 =    ( )

Coefficients to Slots

Sine Evaluation
 0, ... , /2-1  /2, ... , -1

Slots to Coefficients

11

#RSAC
Previous Works
Polynomial 1. [CHKKS18] : Taylor Approximation Method 2. [CCS 19] : Chebyshev Approximation Method
[CHKKS18] : Cheon et al., Bootstrapping for Approximate Homomorphic Encryption, Eurocrypt, 2018. [CCS19] : Chen, H., Ilaria Chillotti and Yongsoo Song, Improved Bootstrapping for Approximate Homomorphic Encryption, Eurocrypt, 2019.
12

#RSAC
Key Ideas
Bounded Goal : Choose appropriate 's that minimize the maximum value of   = =0  -  in a specified domain of .
13

Our Method

1  - 4 - 

1  - 4

1  - 4 + 

 = - + 1 , ... ,  - 1

Choose  nodes as the Chebyshev method

#RSAC

14

#RSAC
How to Choose the Number of Nodes in each Interval?
15

#RSAC
Comparison with the Chebyshev Method
16

#RSAC
Homomorphic Evaluation of a Polynomial

Navie approach

  =  
=0
Our method

  are unstable

1. Yield a lot of numerical errors 2. Make homomorphic evaluation difficult

Compute with the Babystep Giant-step algorithm
17

1 2 2 + 2 log2  +  1 non-scalar multiplications

#RSAC
Hybrid Method

Compute cos

2

 2

and use double angle formula

18

#RSAC
Comparison with the Previous Work [CCS19]
[CCS19] : Chen, H., Ilaria Chillotti and Yongsoo Song, Improved Bootstrapping for Approximate Homomorphic Encryption, Eurocrypt, 2019.
19

#RSAC
Experimental Results

#RSAC
Performance of Basic Operations
21

#RSAC
Bootstrapping Performance

ns : the number of slots Precision :- log2 , where e is average noise generated Amortized Time : bootstrapping time per each slot

vs
[CCS 19] : 158s [HHC 19] : 127s

[CCS19] : Chen, H., Ilaria Chillotti and Yongsoo Song, Improved Bootstrapping for Approximate Homomorphic Encryption, Eurocrypt, 2019. [HHC 19] : Han, K.,Seungwan Hong and Jung Hee Cheon, Improved Homomorphic Discrete Fourier Transforms and FHE bootstrapping, IEEE Access, 2019.
22

#RSAC
Appendix

#RSAC
Key Generation in Our Scheme
24

#RSAC
Multiplication in Our Scheme
25

#RSAC
Multiplication in Our Scheme
26

#RSAC
Multiplication in Our Scheme
27

#RSAC
Baby-step Giant-step Algorithm

2

2

+

1 2

log

2



+ 

1

non-scalar multiplications

2 + 2m-l + m - l - 3 non-scalar multiplications,

where  is the smallest integer satisfying 2 >  and   /2

28

#RSAC
Parameters Sets for Bootstrapping Performance Exp.

Param 1 : log   40 , log 0  50

Param 2 : log   45 , log 0  55

29

