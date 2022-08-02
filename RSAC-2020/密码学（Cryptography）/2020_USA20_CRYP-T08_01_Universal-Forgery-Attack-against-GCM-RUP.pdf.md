SESSION ID: CRYP-T08
Universal Forgery Attack against GCM-RUP

Yanbin Li1, Gaëtan Leurent2, Meiqin Wang1, Wei Wang1, Guoyan Zhang1, Yu Liu1
1 Shandong University, China 2 Inria, France

Presented by Ferdinand Sibleyras
Ph.D. Student Inria, France

#RSAC

#RSAC
Universal Forgery Attack against GCM-RUP
Yanbin Li, Gaëtan Leurent, Meiqin Wang, Wei Wang, Guoyan Zhang, Yu Liu

#RSAC
Outline
About GCM-RUP Motivation and Contributions Brief Description of GCM-RUP Partial Authentication Key Recovery for GCM-RUP Universal Forgery Attack of GCM-RUP Variant of GCM-RUP
3

#RSAC
About GCM-RUP

#RSAC
About GCM-RUP
GCM (Galois/Counter Mode)
­ Authenticated Encryption scheme following the Encrypt-then-MAC paradigm, proposed by Dworkin
­ Not robust against implementation errors or misuse ­ Lose its security if a device releases the plaintext corresponding to invalid
ciphertext before verifying the tag
GCM-RUP
­ Instantiation of the variant construction of GCM, proposed by Ashur et al. ­ Secure even in the releasing unverified plaintext (RUP) setting ­ Designers prove that GCM-RUP is secure up to the birthday bound in the nonce-
respecting model
5

#RSAC
Motivation and Contributions

#RSAC
Motivation and Contributions
Motivation
­ No attacks are known so far against the authentication part of GCM-RUP ­ Is the security proof of GCM-RUP tight? ­ What kind of security degradation to expect after the birthday bound
Contributions
­ Partial key recovery by utilizing collision on inner states, leading to universal forgeries
­ Birthday-bound universal forgery attack against GCM-RUP, matching the security proof
­ Minor modification to GCM-RUP to avoid our attack
7

#RSAC
Brief Description of GCM-RUP

#RSAC
Generic Construction with RUP Security
,  : encryption scheme (without authentication)
­ : key space; : nonce space; : message space; : ciphertext space.
(, ): TBC
­ key space , tweak space  = , domain  = .
9

GCM-RUP
XTX construction with GHASH

#RSAC
CTR for encryption
10

#RSAC
GCM-RUP
CTR for encryption XTX construction with GHASH for TBC
11

#RSAC
Universal Hash Function GHASH

2(,

) is defined by 2(







||



||)

Key 2 and inputs  and .

Polynomial evaluation: 2  == 0-1    2  -1
where  is a full-block string and the symbol "" represents multiplication in  2 .

12

#RSAC
Partial Authentication Key Recovery for GCM-RUP

#RSAC
Properties of GHASH
Focus on the component 2 with inputs the associated data  and the ciphertext .
 = 2 ,  = 2(    ||  ||)
 is linearly independent on the  and  for a fixed 2. Hence, we consider the difference  in the output of 2 for a pair of inputs.
14

#RSAC
Properties of GHASH
Property 1. If GCM-RUP is used to process a fixed associated data  and message  under two distinct nonces 1 and 2, the output difference of function 2 is only dependent on the nonces 1 and 2, but independent on  and . This also holds for the input difference of 3.  So let 1 = M  1(1) and 2 = M  1 2 :  = 2 , 1  2 , 2
= 2 0, 1  2 = 2 0, 1(1)  1(2)
15

#RSAC
Recovering  from Inner Collisions

Based on Property 1, we the following two steps.

can

retrieve

the

authentication

key

2

with

For a fixed associated data  and , search for a pair of nonces

(col1li,sio2n))wuhsiincgh

produce a a birthday

collision attack.

for

the

input

of

3

(i.e.

inner

Wtfrhoiistmheqathukeantoiownn.=2 de1finition2.,

a polynomial equation in Then 2 can be retrieved

by2

is derived solving

16

#RSAC
Find Inner Collisions
 = 

 = 0  = 0  = 

Pr  = 0 1  2 = 1  2] = 1/2
17

#RSAC
Find Inner Collisions

Number of nonces needed  is related to the probability of success .

 

2 × 2128 × ln( 1 ) 1 - 

18

#RSAC
Universal Forgery Attack of GCM-RUP

#RSAC
Almost Universal Forgery Attack

Let  = 2(, ) and the key-stream used to XOR message is 1  =   .
Query (, , ) and receive the ciphertext (, )

Compute  =   1()

Construct  , ,  and

such that 2 2 are known

, 

= 2(, ), where

20

#RSAC
Universal Forgery Attack

Make 2/2 queries , ,  for fixed  and  with  = ||, and receive the ciphertexts (, )

Compute  = (, ) and receive inputs and outputs to 3: 3    =   

For each , build the corresponding  from  and  as above

Check whether   (,  ) is in the set of known inputs to 3

If so, then

find  =  we deduce a

satisfying    forgery using  =  

, = (,,a )nd

21

#RSAC
Variant of GCM-RUP

#RSAC
A Variant of GCM-RUP to Avoid Our Attack
Avoid key leakage from known difference.
23

#RSAC
Conclusion
Birthday-bound attack against authentication part of GCM-RUP. Bound is tight but drastic break at security bound, unlike GCM. Minor modification can avoid this attack.
If you have any question please contact Professor Meiqin Wang at mqwang@sdu.edu.cn
24

