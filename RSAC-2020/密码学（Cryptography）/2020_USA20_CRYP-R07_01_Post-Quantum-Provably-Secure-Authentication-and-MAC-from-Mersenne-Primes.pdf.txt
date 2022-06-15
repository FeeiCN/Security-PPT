SESSION ID: CRYP-R07
Post-Quantum Provably-Secure Authentication and MAC from Mersenne Primes

Keita Xagawa
Researcher NTT Secure Platform Laboratories, Japan @xagawa This is a joint work with Houda Ferradi (Hong Kong Polytechnic, Hong Kong)

#RSAC

#RSAC
Summary
We revisit the MERS assumption [AJPS18] Authentication from the MERS assumption MAC from the MERS assumption
2

#RSAC
Lightweight Authentication and Post-Quantum Security

#RSAC
Authentications in Resource restricted devices

Context
ePassport Credit card NFC mobile payment IoT sensors and so on

RFID tags in $0.05--$0.10 [AHM14]

Area Non-Volatile Memory Power Clock

< 4000 GE < 4096 bits < 10 W < 100 kHz

[AHM14] F. Armknecth, M. Hamann, V. Mikhalev (RFIDSec 2014)

#RSAC
HB Family
Auth. from Learning Parity with Noise (LPN) [HB01]  Pros: Secure if the underlying LPN problem is hard  Pros: Efficient implementation  Cons: Not so compact implementation (> that of AES) [AHM14]
[HB01] N.J. Hopper, M. Blum (Asiacrypt 2001) [AHM14] F. Armknecth, M. Hamann, V. Mikhalev (RFIDSec 2014)

#RSAC
Our Proposal ­ Alternative to HB family
Auth. from MERS instead of LPN The MERS assumption [AJPS18]: ,  +  mod   (, )
­   ,   ,    =  ,   
In the sym-key setting, n = 521, h = 128.
[AJPS18] D. Aggarwal, A. Joux, A. Prakash, M. Santha (CRYPTO 2018)

#RSAC
Discussion
Auth from MERS > Auth from LPN But, there are Auth. From BC and MAC Auth. From Blockcipher (e.g., AES, Camellia, PRESENT, and so on)
­ Secure if the underlying BC is post-quantumly secure ­ Not so compact implementation (but, atomic-AES: 2.5k GE)
We think those are competitive

#RSAC
The MERS Assumption

#RSAC
The Mersenne Primes
The Mersenne prime:  = 2 - 1 keep the Hamming weight! -> Use the properties to construct public-key encryption. Let ,   : 1.  +    +  2.        3. -   - 

#RSAC
The MERS Assmption
MERS assumption: ,  +  mod   (, )
­   ,   ,    =  ,   
Introduced by [AJPS18] Their parameter setting:  = 756839,  = 256 Our candidate:  = 521,  = 128
[AJPS18] D. Aggarwal, A. Joux, A. Prakash, M. Santha (CRYPTO 2018)

#RSAC
Warm Up: Passively-secure Auth.

#RSAC
Passively-secure Authentication Authpa
SK:   ,: e.g.,  = 521,  = 128

   ,    + 

12

  
If  -  =  then Accept

#RSAC
Security against passive attack
Real game: the adversary gets real transcripts and tries to impersonate P Random game: the adversary gets random transcripts and tries to impersonate P Intuition 1: Real  Random, because the MERS assumption Intuition 2: In Random, the adversary's chance is negligible (See the full version or [KSS10])
[KSS10] J. Katz, J.S. Shin, A.D. Smith (J. Cryptology 23(3), 2010)

#RSAC
Authpa is not AC-secure

SK:   ,: e.g.,  = 511,  = 128
Fix A and repeat  Learn LSB(AS) and so on

   ,    + 

14

  
If  -  =  then Accept

#RSAC
S-MIM-secure Auth.

#RSAC
S-MIM-secure Authentication
Auth. secure against sequential Man-in-the-Middle attacks The adversary can intercept sessions sequentially The adversary wins if (, )  (,  ) and V accepts









16

#RSAC
ROR-> S-MIM conversion in [CKT16] ROR is sufficient!

AuthROR
V:    P:  = 1, 2  (, ) V:    , , 

Authsmim
  , : universal hash. V:    P:  = 1, 2  (, )  = (1, 2)  (1, 2   +  1 )
V:  = 1, 2  (1, 2 -  1  -1)
   , , 

[CKT16] D. Cash, E. Kiltz, S. Tessaro (TCC 2016-A1)

ROR-secure Authentication Authror

#RSAC
MERS holds  B is pseudorandom

SK:  = 1, 2   × 



  ,   

   1 + 2 + 

, 

18

  
If   0 and  -  1 + 2 = 
then Accept

#RSAC
Compiled S-MIM-secure Authentication Authsmim
SK: = 1, 2, 3, 4   ×  ×  × 

  ,       1 + 2
+ 3 + 4

 , 
19

  
If   0 and  -  1 + 2 - 4 3-1 = 
then Accept

#RSAC
MAC

#RSAC

MAC

SK: (s0 , s0, s1, ... , s, , )

Following MAC2 [KPCJV11,KPVCJ17]

MAC
1.   ,   ,,   {0,1} 2. Compute  =  ,   {0,1} 3. Compute  = 0 + =1     4. Compute  =   +  + 0 5. Output  = (, , )

Vrfy
1. Parse , ,  = -1 
2. Compute  =  ,  3. Compute  = 0 + =1     4. If   0 and  - ( + 0 ) = ,
then Accept

[KPCJV11] E. Kiltz, K. Pietrzak, D. Cash, A. Jain, D. Venturi (EUROCRYPT 2011) [KPVCJ17] E. Kiltz, K. Pietrzak, D. Venturi, D. Cash, A. Jain (J. Cryptology 30(4), 2017)

#RSAC
Summary

#RSAC
Summary
We revisit the MERS assumption [AJPS18] Authentication from the MERS assumption MAC from the MERS assumption Selling points
­ Auth is easy to implement! ­ All except Authpa don't need the Mersenne prime!
23

