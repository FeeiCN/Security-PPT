2015          China Internet Security Conference
3G/4G SIM
  
(    )

Citizenfour
2015          China Internet Security Conference "When the NSA and GCHQ compromised the security of potentially billions of phones (3G/4G encryption relies on the shared secret resident on the SIM), they not only screwed the manufacturer, they screwed all of us, because the only way to address the security compromise is to recall and replace every SIM."



· 

1) 2G/3G/4G SIM  2) , 2G/GSM 
· 

1) 3G/4G  MILENAGE

2015 2)  / 
3) 


China Internet Security Conference

· 

  2015         
China Internet Security Conference

 (1-4G)
· 1G: 

· 2G: GSM vs. CDMA 

2015          China Internet Security Conference

· 3G/4G: UMTS/LTE 

 (U)SIM ?

· (U)SIM = (Universal) Subscriber Identity Module

· (U)SIM ().

· SIM

 ICCID ()

2015  IMSI ( E.g. ) 310 150 123456789
  USA+AT&T +id number


China Internet Security Conference

· 2G SIM: K

· 3G/4G USIM:

K,  OPc, r1, ..., r5, c1, ..., c5.

/ 
2015          China Internet Security Conference
(U)SIM?

Cryptology() in a nutshell

Cryptology = "Cryptography" + "Cryptanalysis" · Cryptography ()
AES()
2015 HMACSHA-3()RSA( ) China Internet Security Conference
· Cryptanalysis ()
1. :  2. : 


input

crypto-system

output

(U)SIM
/
· AKA: Authentication & Key Agreement · Authentication(//): .
 Bob Alice Challenge-and-Response. · Key Agreement (, ): session key

Alice: k

2015          China Internet Security Conference

"I am Alice"

Bob: k

R

RES=Enck (R) Ks=Enck (R+1)

RES
(Ks)

Check if RES=Enck (R) Ks=Enck (R+1)

2G GSM AKA 

2015          China Internet Security Conference

2G GSM AKA : COMP128-1 (A3+A8)

2G GSM  : A5

:

1. COMP128-1  (narrow pipe attacks [BGW98])

2.  

(, DEFCON 2010)

3. 

( [RRST02,ZYSQ13])

 
2015          China Internet Security Conference

3G/4G2G 

 


2G

3G/4G

COMP128-1 

MILENAGE,  AES-128 ,  

 (SIM) ()

K

2015  K tweak value

OPc















ChinaIntern: et Security Conference

r1, ..., r5, c1, ..., c5

( = ?)

3G/4G USIM   ?

3G/4G AKA 

2015 MILENAGE


China Internet Security Conference

Algorithm

Mutual Authentication The different between 3G and 4G is not security-relevant
3G  4G AKA

MILENAGE 

USIM

AuC

RAND

AUTN

f5

SQN  AK

AMF

MAC

AK



SQN K

2015          China Internet Security Conference

f1

f2

f3

f4

XMAC

RES

CK

IK

Verify MAC = XMAC Verify that SQN is in the correct range

USIM
2015          China Internet Security Conference
K + OPc (+ r1,c1, r2,c2, r3,c3, r4,c4, r5,c5)

?
· : "(Divide et impera)"

 
2015          China Internet Security Conference
· :  K, OPc, r1,c1, ..., r5, c5 
 secret {K, Oc, c1, c2, ..., c5 } ( Differential Power Analysis)
 secret {r1, r2, ..., r5 } ()  (Correlation Power Analysis)

 (Side Channel Attack)



/



2015 


China Internet Security Conference







 +
 SCAnalyzer

2015        China Internet Security Conference
 Power
Recorder

 (Differential Power Analysis)





device

measurement

P = mS-o1d(KelGC) E = HmW(P)

analysis

2015 7 2 0 8 4 0 2 7 2
3 3es6ti7m1at2io8n 7 5


China Internet Security Conference

3 1 8 2 6 5 5 2 3



 AES: 128-bit  



 256 

 



 

 () ?

() 

2015          China Internet Security Conference

 

Correlation trace



: k, OPc, r1~r5,c1~c5

k,OPc

r2

c2

2015          China Internet Security Conference

c1

r1

 f5+f1

 : 
2015          China Internet Security Conference
 (simple power analysis) 
AES1

 :  K  OPc



 k



RAND

k 1st rd

OPc

 RAND

kOPc 1st rd

 k  OPc ?

k2

2015          Ek China Internet Security Conference

2nd ......

rd

k2

Ek

2nd ......

rd

AES 1: (k'=kOPc) kOPc AES 2:  k2 ( k)

 :  , ... , 
·     = 8 + 

1.   (  = 0)

2015   (8) ( hypothesis testing) 

( byte 0 )

China Internet Security Conference

2.    bytes 0 ~15 ,

  


2015          China Internet Security Conference

 1
2015          China Internet Security Conference

 2

2015          China Internet Security Conference

 3
APPOTP
2015          China Internet Security Conference

 

1. .  

2. :

   CC/EMVCo/FIPS   ×  = 

2015 3. 


China Internet Security Conference

:

().



Than2k0s15          China Internet Security Conference
 Small Tweaks do Not Help:
Differential Power Analysis of MILENAGE Implementations in 3G/4G USIM Cards

