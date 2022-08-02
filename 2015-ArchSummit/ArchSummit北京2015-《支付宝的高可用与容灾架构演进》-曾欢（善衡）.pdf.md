
 @
shanheng.zh@alibaba-inc.com



2012


2013-2014
 

2015


 





01 OPTIONS

-

02 OPTIONS

-

03 OPTIONS

-

04 OPTIONS

Q&A

05

OPTIONS

-
1



LB 



LB









·  /

·  

· 
  





· LBVIP LB



LB







· DB

 · / ·  · 

-
2

=>

Pub1 Pub2
Sub2 Sub2



Session Session Session

 hash

Data

Data

UID


 1

 

 1
1

 2
2

 3
3

 4
4

A

50% 

GSLB



   

50% B



  

  

01

01

 2

 2

 
02

02

 1


 1





&

 

 







IDC 

 

DB

Oracle 10min







Common Failover Failback

Failover

Master

sync

work

Slave

Master

Slave

down

Master

sync

work

Slave

Failover
Failover work
Failover work

A

50% 

GSLB



   

50% B



  

  

01

01

FO 2

 2

 2

FO 1

 
02

02

 1


 1




 

 

-
3



DB

IDC

IDC





01
DB

02
IDC

06

05
-

03

04






1
F1

2
F2

3
F3



P1

P2

P3



C1

C2

C3



DB

DB DB

DB





·  · UserID ·  · 



·  · UID · 



A 01

APP

DB

A 02

APP

DB

B

APP

DB


·  

·  DB




A A_0 0ms


50ms5500km

B A_1



A

C
  

A_0 0ms

B A_1 0ms

C_0



C_1


· DB 
3s 
·  
 DB



 

 DB    IDC  IDC  IDC

 

100%



50%

50%

A. Blue


A. Green




100%



0%-100%

100%-0%

A. Blue


A. Green


100%



50%

50%

A. Blue


A. Green




A

A

A1_A A1_B

 

C



B

A A2_A A2_B

 

C



A

C

A

A3_A A3_B

 

C B



LDC







Zone

Zone

 IDC

 IDC

Thank you
Q&A

@

@

