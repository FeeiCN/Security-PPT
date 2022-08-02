AIC2 AI for Detecting Covert C2 Communication

 C2



(TLS)



(Twitter)



2020C270% ----Cisc o

2020Q167%C2TL S  ----Watc hGuard

0 1









 









 



0 2

AI 1. 

2. 
C2

3. 

4.  0 3

Cisco TLS

Client
Client Hello

Server

SSL/TLS version, supported ciphers, etc.

TLS

Server Hello
Cipher Suite(RSA, TLS1.0, etc.) Server Certificate Server Key Exchange(public key) [Client Certificate Request] Server Hello Done

Client Key Exchange

[Client Certificate]

C2

Certificate Verify 

0 4





C2









 







0 5



 

 1.

2.

3.

I nternetC&C

0 6



 TLS{IP, }

0 7 TLS





 1 /

 2 100

 3 100







0 8

 

 1 

 2 

0 9

 

 1 

 3 

1 0

TLS

TLS









2,3,5,10,20,50,100,200,500,5000kB 100



2,3,5,10,20,50,100,200,500,5000kB 100

/

2,3,5,10,20,50,100,200,500,5000kB 100



2 ,3 ,5 ,1 0 ,20 ,5 0,1 00 ,2 00 ,50 0,50 00 

100



2 ,3 ,5 ,1 0 ,20 ,5 0,1 00 ,2 00 ,50 0,50 00 

100

1 1

TLS
TLS 

Client
Client Hello

Server

SSL/TLS version, supported ciphers, etc.

Server Hello

Web

Cipher Suite(RSA, TLS1.0, etc.) Server Certificate Server Key Exchange(public key) [Client Certificate Request]
Server Hello Done

Client Key Exchange



[Client Certificate]



Certificate Verify



1 2

TLS

TLS



()

=

001123 0() 


Hello HelloSession ID 


26.43% 41.11% 16.53%

C2 57.63% 68.85% 63.70%

Extension

27.68%

79.41%

Session ticket

41.11%

68.86%



28.86%

79.24%



 52.53%

89.73%







51.18%

86.44%



48.07%

86.39%

1 3

TLS

TLS  



 
 

  
   
   



 





1 4



AI 
>0
 


 
 



1 5



TLS





TLS

TLS



MT

37210

8303

1Malware Traffic (MT)

SIPS

40100

2242

2Stratosphere IPS (SIPS) 3Canadian Institute for
Cybersecurity (CIC)

CIC

582884

5679

l MTSIPSTLS

l CICTLS

1 6




Ø Distribution feature, DF Ø (Consistency feature, CF) Ø (Statistic feature, SF)

 Precision Recall F1 score

DF

79.78%

67.93%

73.29%

CF

89.59%

89.75%

88.63%

131

SF

87.34%

87.77%

88.51%

BF+HF+SF 92.57%

88.10%

90.23%

864

304

1 7



20 


19TLS 1 8

TLS 

Cisco







     

MT 92.42% 5.56% 81.86% 20.20% 90.24% 8.42%

SIPS 96.00% 4.10% 84.43% 11.55% 92.29% 9.71%

CIC 84.05% 17.03% 71.23% 31.33% 91.62% 1.33%



1 9

HTTPC2

HTTP

HTTP







1 Accept

2 Accept-Charset

HTTP

3 Accept-Encoding 4 Accept-Languate

u TLS

5 Authorization 6 Connection

u TLS

7 Content-Length 8 Content-Type

u HTTP 9 User-Agent

10 Expect

2 0

HTTP

HTTP





HTTP HTTP



MT

41515

14352

1Malware Traffic (MT) 2Stratosphere IPS (SIPS) 3Canadian Institute for

CIC SIPS

35528 189653

2906 2695

Cybersecurity (CIC)

2 1

HTTP  100032657HTTP 1000 28332HTTP
  2019, Niu XGBoost 2017, Ogawak-Means + SVM 2 2

 



->



->

 

-> 



>

>







70%

20%

10%

2 3


1 2





 FTP

SSH

3






2 4


KCon 
MA N O E U VR E

