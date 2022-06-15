SESSION ID: CRYP-R02
Improved Secure Integer Comparison via Homomorphic Encryption

Jacques Traoré
Research Engineer Orange Labs Caen, France Joint work with Florian Bourse and Olivier Sanders

#RSAC

#RSAC
Agenda
Secure Integer Comparison Related Works Our Contribution Efficiency Conclusion
2

#RSAC
Secure Integer Comparison

#RSAC
Yao's Millionaires' Problem

Alice

Bob

How can they find out who is richer without revealing their actual wealth?

4

#RSAC
Secure Integer Comparison

x

y

Alice

Bob

How to determine whether X  Y or not without revealing anything more about X and Y?

5

#RSAC
FHE Setting
Inputs of A: a pair of keys (, ) of a public key encryption scheme 
Inputs of B: two ciphertexts 1 =  x and 2 =  y

1 2
Party B

Homomorphic computations

 =  b

Goal of B: to blindly compute an encryption  of the boolean ( < ) under 

Applications: e.g. «Machine Learning Classification over Encrypted Data » (NDSS 2015)

6

#RSAC
Related Works

#RSAC
Related Works
FOCS 1982: based on « Garbled Circuits »  rather important communication complexity CT-RSA 2001: based on Homomorphic Encryption. Involves bitwise encryption of the integers  a complexity of at least 2() operations where  is the bound on the integers to compare CT-RSA 2018: based on an Homomorphic Threshold Encryption scheme. Allows to directly compare small integers but at the cost of more interactions between the two parties Crypto 2018: based on FHE. Only supports a bounded message space which has to be defined at setup time  works well but on very small sized inputs. CT-RSA 2019: based on the « Legendre Symbol ». Unfortunately can only handle integers of limited size. Seems difficult to extend it to support large inputs
8

#RSAC
Our Contribution

#RSAC
Our Contribution
We propose two protocols that respectively improve CEK (CT-RSA 2018) and BMMP (Crypto 2018) For both of our protocols, we avoid binary decomposition in order to improve the performances Compared to CEK we managed to divide by two the number of interactions between the two protagonists Compared to BMMP, our new protocol allows to securely compare large (a priori unbounded) integer
10

#RSAC
Encryption Scheme
Based on CEK
  =  mod 
Public Key = , , , , ,    =  where  = 2 + 1 and  = 2 + 1   is of order ,  is of order  and  is a an upper bound on  Private key  =  where  = ()-1 mod  Message space = 0, ... ,  - 1
11

#RSAC
Decryption
To decrypt a ciphertext  using a private key 
() mod  = () = () () =  = 
Find  by exhaustive search. Easy provided  is a small integer
12

#RSAC
Threshold Homomorphic Property
 = ()- = ()- = - = +(-) 
If  -    then +(-)  0 mod   = ()-=0 ()= 
13

#RSAC
Threshold Homomorphic Property (II)
 = ()- = +(-)
If  -    then   =  and we obtain no other information on  If  -  <  then   =  + ( - ) An interesting property for secure integer comparison provided we find
a way to blind the integer  in particular when  -  < 
14

#RSAC
Protocol for the Millionaires' Problem

Alice (, )
    = 1
Compute:  =  If  =   Return    Return  <  otherwise

 , 

Bob (, )
Choose random: , , 2
Compute:    -  2
= +(-)+3  = ()

15

#RSAC
Security
We proved the security for both A and B against honest-but-curious adversaries in the random oracle model
Privacy for A. We show that B learns nothing about  during the protocol
Theorem. Under the Small RSA Subgroup Decision Assumption, B's view is computationally indistinguishable from a uniformly random element in  for any message 
Privacy for B. We show that A only learns the output of the protocol    and nothing else about  Theorem. There exists an efficient simulator , such that (1,    ) is statistically indistinguishable from A's view for any messages  and  in the random oracle model
16

#RSAC
FHE based Secure Integer Comparison
A variant of Bourse et al. FHE scheme (Crypto 2018) Our scheme supports a non-binary message space:
Let  be an integer. The message space will be = - + 1, ... ,  - 1 Ciphertexts can be homomorphically added and scaled by a known integer constant.
Roughly: let 1 = (1) and 2 = (2) and     1 + 2 = 1 + 2
Ternary Sign computation:
Input:  = () where   {- + 1, ... ,  - 1}
-1,  < 0 Output:  = () where  =  0,  = 0
1,  > 0
17

A Protocol for Small Integers

#RSAC

Let  and  be two integers in = 0, ... ,  - 1

Inputs of B: 1 =   and 2 =  y Compute  =   -  using the homomorphic properties satisfied by 

1

2

 =   - 

Party B

Homomorphic computations

Output:  =   an encryption of , the ternary sign of ( - )





Ternary Sign computations
18

A Protocol for Large Integers

#RSAC

Let



=

0

+

1

+

22

and



=

0

+

1

+

22

where



=

 2

Inputs of B: 1 = ( 0 ,  1 ,  2) and 2= ( 0 ,  1 ,  2)

Compute  = ( 0 ,  1 ,  2) where =  -  using the homomorphic properties of 

 2

Ternary Sign
 2

 1

Homomorphic computations

 2 + 1

Ternary Sign

0 = Ternary Sign of  = 0 + 1 + 22
19

 0

 1


Homomorphic computations

 1 + 0
Ternary Sign
 0

#RSAC
Efficiency

#RSAC
Efficiency
There is a wide range of solutions to the Millionaires' problem from garbled circuits to homomorphic encryption
Compared to similar solutions based on homomorphic encryption such DGK (ACISP'07) and CEK (CT-RSA 2018) our protocol is:
­ 4 times faster than DGK for a 256-bit security level ­ in two-passes instead of 4 with CEK and do not require a Plaintext Equality TEST (PET)
Our FHE solution allows to compare 32 bits integers (on a Core i7-3630QM laptop) in 1023ms on a single core, 297ms on 8 cores and 165ms with maximum parallelization
­ Greater than comparison of 32 bits integers with Kolesnikov et al. protocol (CANS 09) would require 4224 ms on the same laptop
21

#RSAC
Conclusion

#RSAC
Conclusion
We have introduced two new solutions to the Millionaires' problem in two different settings
Our first solution leverages the homomorphic encryption scheme of Carlton et al. to construct a two-passes integer comparison protocol that improves over the state of the art.
Our second solution extends the FHE construction of Bourse et al. to enable efficient computation of the encrypted boolean (  ) given only the encryption of (a priori unbounded) integers  and 
Both solutions share the same guiding principles, namely reducing as much as possible the number of interactions and avoiding bitwise decomposition of the integers
23

