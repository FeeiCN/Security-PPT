
7JUFTT,JOHTIBSE


·  
· BAT · 


· 1181.2TPCIE ·  ·  · 

90%


·  ·  Userid S  harding · XML

 


· MySQL  4.X · Oracle   · MySQL  5.X  +  Cobar · MySQL  5.X  +  TDDL · Ocean  Base  ?



 step  by  step


· () · () · () · Sharding() · ()


·  ·  Join S  ql ·  ID   · 



ID

UID

PID STATUS TIME

1

6

24

4 2015-04-09

2

4

33

4 2015-05-10

3

3

23

3 2015-06-09

4

87

12

3 2015-07-09

TOP1 select  *  from    show w  here  uid=xxxx uid

ID

UID

PID STATUS TIME

1

6

24

4 2015-04-09

2

4

33

4 2015-05-10

3

3

23

3 2015-06-09

4

87

12

3 2015-07-09

TOP2ID select  *  from  show  where  pid=xxxx pid

ID

UID

PID

STA TUS

TIME

1

6 24 4 2015-04-09

2

4 33 4 2015-05-10

BinLo g

3

3 23 3 2015-06-09

4 87 12 3 2015-07-09

ID

UID

PID

STAT US

TIME

1

6 24 4 2015-04-09

2

4 33 4 2015-05-10

3

3 23 3 2015-06-09

4 87 12 3 2015-07-09

ID

UID

PID STATUS TIME

1

6

24

4 2015-04-09

2

4

33

4 2015-05-10

3

3

23

3 2015-06-09

4

87

12

3 2015-07-09

TOP3 select  *  from  show  where  time  >  `2015--06--10' 


·  Sql,    OLAP   · 
·  
· Join   · OLAP  

 Join  Sql

OLAP Join

Join



Join

Join

OLAP Join

Join



Join

Join

 Join  Sql
·  Join K  ey   Sharding K  ey · OLAP   ·  Join   (
) ·  Join    Table G  roup(
MyCat) ·  ·  OLTP  NoSql

 ID  

ID  Server  IDC

 ID  
· 
·  Redis    
·  ID  
· SPOF  



Hash
·  ·  Shard ·  ·  /  
·  · 

List
·  · 
·  · 

Range
·  · 
·  ·  ·  ·  /  


·  HASH ·   Range ·  Hash  /  Range   ·  ID  

·  Slot   




· 
·  BinLog   
· 
· ( phpHA)




·  · :   · :  Proxy,  Library,  Rpc · :  
 · :   · :  

 













COBAR Java  Proxy   

TDDL Java  Library   NA

VITESS Go  Rpc   

KINGSHA RD

Go

 Proxy   

ATLAS C/C++  Proxy   

FABRIC Python  Library   

Proxy

Go

COBAR

 







Java  Proxy

 

 

 

TDDL

Java  Library   NA

VITESS

Go

KINGSHAR D

Go

ATLAS C/C++

  

Rpc Proxy Proxy

  

  

  

FABRIC Python  Library   

Vitess github.com/youtube/vitess

Vitess  
· Re--sharding,    · Query  de--duping,   
 · Row  Cache,  OLTP  
 · Topology Z  K,   · Query  Rewriting, B  lacking,  Timeout,  
DB


· Topology:   Zk,  Etcd,   Chubby
· Vtgate:  Rpc Proxy,  Topology
· Vttablet:   MySQLDVttablet,   Memcache
· Vtctld:  TopologyWeb 


· Rpc  
·  Shard    auto--swarding
· Gtid   
· Statement B  inLog  
·  

 

KingShard github.com/flike/kingshard

Kingshard
· Go · hint · Hash,  Range   ·  · node

2W


·  ·   ·  Proxy    · HA   ·  Go   


· () · () · () · Sharding() · ()



 

 ORA



Oracle

z3 ­ SQL

zData ­ 

BayMax

 

