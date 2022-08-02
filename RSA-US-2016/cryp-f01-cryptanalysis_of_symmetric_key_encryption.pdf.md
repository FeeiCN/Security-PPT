SESSION ID: CRYP-F01
New Observations On Piccolo Block Cipher
Yanfeng Wang and Wenling Wu
#RSAC

Yanfeng Wang
Ph.D Candidate, TCA, Institute of Software, Chinese Academy of Sciences wangyanfeng@tca.iscas.ac.cn

#RSAC
Outline
Introduction Description of Piccolo Linear-Reflection Weak Keys of Piccolo New Observations on Piccolo-128 Conclusion

#RSAC
Outline
Introduction Description of Piccolo Linear-Reflection Weak Keys of Piccolo New Observations on Piccolo-128 Conclusion

#RSAC
Introduction
New lightweight block ciphers with very simple key-schedules or even without key-schedule, have been proposed. Avoiding MITM(Meet-in-the-Middle) attacks, related-key differential attack and key bits leakage are three main goals in the design of key schedules. However, the choice of round constants makes no influence on the security of block ciphers against the above three attacks.
4

#RSAC
Introduction
Related attacks: slide cryptanalysis, probabilistic slide cryptanalysis(FSE 2014) and invariant subspace attack(CRYPTO 2011). All attacks can be prevented by a careful choice of round constants. In this paper, we take the Piccolo block cipher as a target cipher to reveal some new design principles on round constants.
5

#RSAC
Outline
Introduction Description of Piccolo Linear-Reflection Weak Keys of Piccolo New Observations on Piccolo-128 Conclusion

#RSAC
Description of Piccolo
A lightweight block cipher proposed in CHES 2011 by SONY.
Structure : GFN Block size : 64-bit Key length : 80-/128-bit Number of rounds: 25/31
Encryption Algorithm Key Schedule Algorithm
7

Encryption Algorithm
P(64) wk0  F  rwkk01  F  rk1

F  rk2

F  rk3

#RSAC

4S

S4

F : 16

4S 4S

M

S4

S4

16

4S

S4









F  rk2r2

F  rk2r1

wk2 

wk3 

01
RP :
27

C(64)
8

23 41

45 63

67 05

#RSAC
Key Schedule Algorithm
9

#RSAC
Key Schedule Algorithm
10

#RSAC
Outline
Introduction Description of Piccolo Linear-Reflection Weak Keys of Piccolo New Observations on Piccolo-128 Conclusion

#RSAC
Linear-Reflection Weak Keys of Piccolo
12

#RSAC
Linear-Reflection Weak Keys of Piccolo

01
RP :
27

23 41

45 63

67 05

13

#RSAC
Linear-Reflection Weak Keys of Piccolo

X 0 P0
X1
X2
X3 X4
C0

P k C

P1

P2

 rk0

 rk2

 rk4

 rk6

C1

C2

P3

C2

 rk1

 rk3

 rk5

 rk7 C3

14 P0

C  32 k P

C3

C0

 rk0

C1 X 4  X 4  32
 rk1 X 3  X 3  32

 rk2

 rk3

X


2



X2

 rk4

 rk5

X


1



X1



32

 rk6

P1

P2

 rk7

P3

X


0



X0

#RSAC
Linear-Reflection Weak Keys of Piccolo

rk0  rk6

 

rk1



rk7

 

rk2

  

rk3 rk4

  

rk5 rk4 rk2

 

rk5



rk3

rk6  rk1

rk7  rk0



 P k C

 C



32

k

P

15

#RSAC
Linear-Reflection Weak Keys of Piccolo

X0

P0

F

X1
F

X2
F

P  k C

P1

P2

 rk0

F

 rk2

F

 rk4

F

P3  rk1
 rk3
 rk5

X3

F

 rk6

F

 rk7

X4

C0

C1

C2

C3

C  3 2  k P

C


2

C


3

C


0

F



r

k


0

F

F



r

k


2

F

F



r

k


4

F

C


1

X


4



r

k


1

X


3



r

k


3

X


2



r

k


5

X


1

F
P0



r

k


6

F

P1

P2



r

k


7

X


0

P3

16

#RSAC
Linear-Reflection Weak Keys of Piccolo

rk0  rk6

 

rk1



rk7

 

rk2

  

rk3 rk4

  

rk5 rk4 rk2

 

rk5



rk3

rk6  rk1

rk7  rk0

rk2  rk5



  

rk3 rk4

 

rk4 rk2

rk5  rk3

17

#RSAC
Searching Weak Keys for Piccolo
18

#RSAC
Weak Keys of Piccolo-80

 k0  k1  0x2623

 

k1



k0



0x022a

    

k2 k3 k4

  

k4 k4 k3

  

0x380e 0x1c07 0x0e29

k4  k0

 

k2 k0

 

0x2a20 0x380e

 k1  k1  0x1c07 19

#RSAC
Weak Keys of Piccolo-80
(P0 , P1, P2 , P3 ) k(C0 , C1, C2 , C3 ) (P0, P1, P2, P3) k(C0, C1, C2 , C3)
k  (x, x  0x3a24, y  0x380e, y  0x1c07, z) k  (x  0x380e, x  0x2623, z  0x2a20, z  0x0e29, y)
P  C2 ,C3  k3  0x353a  k2  0x071c,C0,C1  k2  0x3 f 12  k3  0x293d 
 (C2 ,C3  y  z  0x0401,C0,C1  y  z  0x2008),
C   P0, P1  k2  0x071c  k2  0x3 f 12, P2 , P3  k3  0x293d  k3  0x353a 
 (P0, P1  y  z  0x2a20, P2 , P3  y  z  0x0e29).
20

#RSAC
Weak Keys of Piccolo-128

k4  k5  0xf 8c1 k5  k4  0x8cdc k6  k6  0x5816 k7  k1  0x2c0b k2  k5  0xf 0c3 k1  k4  0xe4c6 k6  k0  0x1806 k7  k3  0x0c03

k0  k7  0xe8c5 k3  k6  0xfcc0 k4  k2  0x1806 k5  k1  0x0c03 k6  k7  0x80df k1  k6  0xf 4c2 k4  k4  0x5816 k5  k5  0x2c0b

21

#RSAC
Weak Keys of Piccolo-128
k  (x  0x781e, x  0xbcd 0, x  0x0802, x  0xb4d 2, x, x  0xd 4ca, x  0x1004, x  0xf 4c2)
k  (x  0x0802, x  0xd8c9, x  0x1806, x  0xf 8c1, x  0x5816, x  0xf 8c1, x  0x4812, x  0x90db)
P  C2 ,C3  k7  0x8181 k2  0x6d 45,C0,C1  k2  0x3553 k3  0xad8a 
 (C2 ,C3,C0 ,C1  0x681a),
C   P0, P1  k2  0x6d 45  k2  0x3553, P2 , P3  k3  0xad8a  k7  0x8181
 (P0, P1  0x4812, P2 , P3  0x0802).
22

#RSAC
Outline
Introduction Description of Piccolo Linear-Reflection Weak Keys of Piccolo New Observations on Piccolo-128 Conclusion

#RSAC
New Observations on Piccolo-128
Key Schedule Algorithm
24

#RSAC
New Observations on Piccolo-128
128bit master key is noted by (even,odd)
(k0,k2,k4,k6)even (k1,k3,k5,k7)odd
Similarity between different keys
For a fixed (even,odd), there exist 31 different keys such that the round keys for 30 rounds are equal to that under (even,odd).
25

#RSAC
New Observations on Piccolo-128
26

#RSAC
New Observations on Piccolo-128
RP should not be allowed to be self-inverse.
27

#RSAC
New Observations on Piccolo-128

P0 wk0 
wk2  C0

P1

P2

wk1 

RP

 rk60 wk3 

C1

C2

P3

P0

wk0 

X 0

X


0



X 30

X


30

 rk61 wk2 

C3 28

C0

P1

P2

wk1 

RP

 rk60 wk3 

C1

C2

P3
 rk61 C3

#RSAC
New Observations on Piccolo-128
P  RP(C0  (eL || oR ), F (C0  (eL || oR ))  C1  e  0x9d 79, C2  (oL || eR ), F (C2  (oL || eR ))  C3  o  0xd 594) (eL || oR , 0,oL || eR , 0),
C  (P0*  (eL || oR ), F (P0*  (eL || oR ))  P1*  e  0x9d 79, P2*  (oL || eR ), F (P2*  (oL || eR ))  P3*  o  0xd 594),
where P*  RP((P0, P1, P2 , P3 )  (eL || oR , 0,oL || eR , 0)).
29

#RSAC
New Observations on Piccolo-128
Security of hash function based on full-round Piccolo-128 is insufficient.
30

#RSAC
New Observations on Piccolo-128

DM mode:

Let Mi-1, Hi-1 and Hi be the input message , the input chaining value, and the output; the new chaining value Hi is computed as:
Hi  EMi1 (Hi1 )  Hi1.

k



k



31

#RSAC
Outline
Introduction Description of Piccolo Linear-Reflection Weak Keys of Piccolo New Observations on Piccolo-128 Conclusion

#RSAC
Conclusion
Evaluate the security of Piccolo block cipher from the known and chosen key respective. Define linear-reflection weak keys.
For one weak key k, we can find another related weak key k such that the cipher with k can be completely determined by the cipher under k. 7-round Piccolo-80 (Observation 2) 10-round Piccolo-128 (Observation 3)
33

#RSAC
Conclusion
Summarize some interesting characteristics of key schedule algorithm for Piccolo-128.
RP should not be allowed to be self-inverse (Observation 4) Security of hash function based on full-round Piccolo-128 is insufficient (Observation 5)
We expect that the results of our paper may guide the design of round constants for some simple key schedules.
34

#RSAC
Thanks For Your Attention!

