
 @ UBER





 - 





10

10






















 - 











 10,000 


7 


1440


13 

 300 


: 300 x 10,000 x 7 x 1440 x 13 = 3930





Heatmap Top N
Histogram count(), avg(), sum(), percent(), geo




·  · 



: 



· 
 state vehicle type timestamp lattitude longitude

 driver_arrived
uber X 13244323342
12.23 30.00


· OLAP  SELECT <agg functions>, <dimensions>  FROM <data_source> WHERE <boolean filter> GROUP BY <dimensions> HAVING <boolean filter> ORDER BY <sorting criterial> LIMIT <n> DO <post aggregation>




· OLAP ·  ·  ·  











A

a

B

b



  · : AND, OR, NOT

A

a



B

b



 

A

a

B

b

· : AND, OR, NOT
 · A and (not B) · B and (not A) · A or B · not (A or B)




A B

· {A} · {B} · {A, B} · {}


 · {A}
A · {B} --> 
· {A, B}
B
· {}


n
O(2 )






· 


· 

KV


 => 18,000  : 1ms 99.99: 2s : 0.001%


99.99: (1 - 0.999918000) x = 83% : (1 - 0.00001)18000 = 84%


·  ·  ·  ·  

Elasticsearch












e.g. (Lat, Long) -> (zipcode, hexagon)







: Clustering & Pr(D, S, E)

 --> 



Joining Multiple Streams

Sessionization





Apache Samza

Why Apache Samza?

DAG on Kafka

Kafka


























10,000


331


331 x 10,000 = 310


99%-ile : 70ms



"You can have a second computer once you've shown you know how to use the first one."
- Paul Graham


·  · 


·  · 





Elasticsearch 

SELECT  timeseries(7d)   FROM  driverAcceptanceRate   WHERE  geo_dist(10,  [37,  22])     AND  time  IN  (2015--02--04,2015--03--06)   AND  msg.driverId  =  1  

Elasticsearch 
·  ·  · 

Time in seconds

Elasticsearch 

Processing Storage

Query







55

100

Complex Event Processing
FROM  driver_canceled#window.time(10  min)     SELECT  clientUUID,   count(clientUUID)  as  cancelC GROUP  BY  clientUUID  HAVING  cancelCount  >  10     INSERT  INTO  hipchat(room);





