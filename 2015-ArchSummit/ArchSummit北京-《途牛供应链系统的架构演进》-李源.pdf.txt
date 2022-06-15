ArchSummit2015



·  · 





  


WEB 
BOSS 

 

WEB-

FILE

cache

DB

BOSS-

FILE

cache

DB


·  ·  · 100+900+100+text · 









Web site











Common server 



Seller Layer





Order sys

 



Purchaser Layer

/

Vendor sys

Res confirmation

Supplier Layer NB



OA/UC
 
 







 

 

 

Mysql m/s















 

Mysql m/s

cache

Mysql m/s

 

NBooking
 

  

Mysql m/s

 



 

 

Mysql m/s

cache



 

 



Mysql m/s
















 









 WEB/APP











 











Nbooking API









10000 8000 6000 4000 2000 0

2012.8 2013.8 2014.8 ()

2015.8

40 30 20 10
0 2013.8 2014.2 2014.8 2015.2 2015.8 ()

4000 3000 2000 1000
0 2013.8 2014.8 2015.3 2015.4 2015.5 (

10 8 6 4 2 0 2013.8 2014.8 2015.3 2015.4 2015.5 (/

3KW300W+,3.5+



Vertical support

Web site

WEB

APP

Common server

MQ
  TSP
HDFS
Codis
















Seller Layer 

 

 
















Purchaser Layer 

 













/ 

 

 

Supplier Layer

 

NBooking





 1

 2

 n



BI
OA/UC 
etc.




 WEB/APP
 
 
 















 Restful/MQ /

/ 
TSP 
MapReduce

API SLA 

 

 

DB/ 


HDFS NoSQL

 



----
1. 2.



, 

----

 SQL     CUID  

RDBMS(Oracle DB2)

Mongo DB



































JSON

Sequoia DB
        JSON

HBase
        KV

----

·  · 



 

 

Mysql m/s
  



 



 

  

  

Mysql m/s

Sequoia DB

 ID


 


----

Resource platform

Request

R/W Splitting

Result Reduce

Query engine

Acto

r n

Codis

Acto r1
Cobar T0 T1 Tf

Acto

Acto

r3

r2

Sequoia DB

External server POI
stock Vendor data Extraction
other

----
1.2/

  
-- 

 liyuan3@tuniu.com

