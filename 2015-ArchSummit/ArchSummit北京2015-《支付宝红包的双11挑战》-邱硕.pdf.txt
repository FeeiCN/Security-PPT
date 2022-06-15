
----11
- 










·  ·  ·  ·  · 


 ·  ·  ·  ·  · 


·  · / ·  · 






1

1



spannerUSF5RXWHU

 

e.g.

server_1

server_2 ... server_n
cluster

server_1

server_2 ... server_n
cluster

 

server_1

server_2 ...
cluster

server_n

msgBroker

server_1

server_2 ...
cluster

server_n

 ... 

server_1 server_2 ... server_n

server_1 server_2 ... server_n



cluster

cluster



biz data

DB_0

DB_1 ... DB_19

DB_0

DB_1 ... DB_19

 
 

share data



read_db



read_db





()










 



----

start transaction lock budget record and get its value (); subtract budget record by  insert business orders... commit




50 tps --> 800 tps



start transaction; lock budget record and get its value; <>; rollback;



start transaction; insert business orders... subtract budget record by 
when value is sufficient commit



start transaction insert business orders... subtract budget record by 
when value is sufficient rollback;

 
   

----MySQL patch

start transaction; add business orders... subtract budget record by 
when value is sufficient commit

EXE:update



OK



EXE:commit

 

MySQL

· DB · 


800 tps --> 4000 tps

----

·  · DB

 

budget id:1 : 100

 


·  · 

sub_budget bid:1 sbid:1 : 10
DB 1
sub_budget bid:1 sbid:2 : 10
DB 2
...
sub_budget bid:1 sbid:10 : 10
DB 10



 

sub_budget bid:1 sbid:1 : 1



sub_budget bid:1 sbid:2 : 2
sub_budget bid:1 sbid:3 : 1

...

sub_budget bid:1 sbid:10 : 0

 
 


sub_budget bid:1 sbid:1
4 :
sub_budget bid:1 sbid:2 : 0
sub_budget bid:1 sbid:3 : 0
sub_budget bid:1 sbid:10 : 0

·  · 

·  · 



· 

·  · 
·     ·    

 
sub_budget bid:1 sbid:1 : 10
DB1
sub_budget bid:1 sbid:2 : 10
DB2
...



  

sub_budget_route bid:1; sbid:1; : 10 bid:1; sbid:2; : 10 ... bid:1; sbid:10; : 10
DB1

sub_budget bid:1 sbid:10 : 10
DB10




· 

 





sub_budget

bid:1

50000 · 


sbid:1 : 10
tps DB1

 ·

sub_budget bid:1 sbid:2 : 10

 

sub_budget_route bid:1; sbid:1; : 10 bid:1; sbid:2; : 10
... bid:1; sbid:10; : 10

4000 tps --> 10000~50000 tps DB2



DB1

...

·  · 

sub_budget bid:1 sbid:10 : 10
DB10







5





4





3

----

SubBudget_99
SubBudget_81 SubBudget_80 SubBudget_79
SubBudget_61 SubBudget_60 SubBudget_59
SubBudget_41 SubBudget_40 SubBudget_39
SubBudget_21 SubBudget_20 SubBudget_19
SubBudget_01 SubBudget_00



Budget

2




1


DB



50,000 tps

·  · 

16 14 12 10
8 6 4 2 0
0

%
500 1000 1500 2000 2500 3000 3500 4000 4500 5000 %

DB-  SOA  DB
500,000+ tps

CAP


 

· Consistency
· C1 · C2
· Availability
·  
· Partition-Tolerance
· 

   
CA
1  
PA

  

C-(
) A() P-()

2

3

4

PA

PA

PA

()










 





   

 

 17 18 19 20 13 14 15 16

1 2 3 4

5 6 7 8

N1×N2×N3

9 10 11 12 

N1'+ N2'

·  ·  ·  

  DB



· 
·  · 
· 
· C2C+
· 
· 
· LRU
· 

user_id_a

template_1 template_2 template_3

  /58

coupon_1 coupon_2 coupon_3

pc00-03

pc04-07

... pc16-19

CZone share
table sharding



SQL

17

16

coupon id=1 cur_amt=10
coupon id=2 cur_amt=5
coupon id=3 cur_amt=2

  

· 
·  · 

· SQL
· O(n) --> O(1)

 '%
'%
 '% a



/ 

 





SQL DB patch



 

 

 



 







 



SQL

()50 ->50,000 tps  14 


·  ·  · 


·  ·  ·  · 
 · RPC ·  · 

DB
·  ·  · DB

 · 

CDN

CDN

CDN

...

 



CDN

$$$

DDBDBBAAA

$$$

DDBDBBAAA

%$$
 mock


DDBDBBBAA

...

msg

msg
1



%$$
 mock

DDBDBBBAA
N







·

·

·

·  ·  · 

· 

· 

· 

·  · 

·  

·  · 

· 

 

· 

 

· DB · 

·...

0









·

·

·

·  ·  · 

· 

· 

· 

·  · 

·  

·  · 

· 

 

· 

 

· DB · 

·...

0




·  ·  ·  ·  · 

· 
·  · 
· 
·  ·  ·  · 
· 
· 

10 9 8 7 6 5 4 3 2 1
0

5

10 15 20 25 30 35 40 45 50

0

0

2

1.8

1.6

1.4

1.2

1

0.8

0.6

0.4

0.2

0

1

2

3

4

5

6

7

8

9 10



----

· 

1





















· 

 





· tps





· 

1 1

1 2

1 3

1 4

1 5

1 6

1 7

1 8

· tps



·  1



hit-count

















· 
· hit-count 

0
1 1


1 2

0
1 3

0
1 4


1 5

0
1 6

0
1 7

0
1 8

----

· 

· 


 


100

80 60





 







 
  

· 





----

 '%FDFKHDSS
· 

 '%FDFKHDSS


·  ·  · 

· 
· 

11

· 
·  · 

· 
· 

· 
· ()

· 
· 



 ·

/DB 

 ·

  

 ·

DB

 ·

 

 

