 .Z42-0OF42-

About  Me
· More  than  15  years  DBA  experience,  an  old  man!
­ Wrote  SQLULDR2 ­ Wrote  MyDUL (Later  renamed  to  AUL)
· 5 Years  at  eBay
­ Staff  DBA
· 6  Years  at  Alibaba(AliPay)
­ DBA  Manager ­ Data  Architecture
· Now  working  at  onexsoft.com
­ Providing B  etter  Architecture U  nits/Components. ­ One  good c  hoice  is  better  than  many  choices.
http://www.onexsoft.com

Three  Periods
· Before 2  004
­ Application D  eveloper
· Be  an  Oracle  Expert (  Before 2  008)
­ Client &    Server  Programing ­ Oracle  Data F  ile  Format ­ Oracle  Log  File  Format ­ Oracle  Direct  Memory  Access
· Be  an  Data A  rch  &  System  Engineer
­ Scale  out  and u  p t  he  payment s  ystem ­ User/Trade/Account/Deposit s  ystem s  plit ­ No  Single  Point o  f  Failure i  n  payment s  ystem
· Be  an  ?
­ How  to s  cale  out a  nd  scale  up e  asily? ­ Why e  very  company h  as t  heir o  wn  customization?
http://www.onexsoft.com

At  eBay
· Very  Large  Business  Volume. · Have  20000  sessions f  or  each  User  database. · How  can  we  reduce  the  sessions? · Decision
­ System  is  different  from  Oracle ­ Expert  in  Oracle  is  not  enough
http://www.onexsoft.com

At  AliPay
· Split  &  Split  &  Split ...... · We  cannot  do  anything  at  database  side  with  
Oracle,  just  ask  developers  to  change  the   business,  optimize  the  code. · It's  a  little  hard,  and  finally  application   developers  learns  everything,  but  I  got   nothing  (joke) · We  make  it,  but  we  cannot  export  it  to  others. · Why  copy  and  paste  is  not  easy!
http://www.onexsoft.com

At  OneXSoft
· Focus o  n  Business
­ Fewer  Requirements  for  Operation  Team. ­ Fewer  Requirements  for  Develop  Team.
· Not  Every  Company  can  afford  a  Team. · Huge  Resource  Wastage  if  all  is  different. · Focus o  n  Data  Arch  Components.
­ CacheKV  StoreMySQLPostgreSQL etc. ­ Data  Access  LayerDatabase  Firewalls ­ Not  only  SQL,  But  SQL  is  the  basic  components.
http://www.onexsoft.com

Key  Points
· Performance  Degrade  by  Lots  of  Sessions. · Resource  Isolation  for  different o  perations. · Make  transactions  faster  and  faster. · We  need  a  robust  logical  data  copy. · Spend  too  much  resource o  n  application  code.
http://www.onexsoft.com

Sessions
· Resource  redundancy  for  Business  Growth · Always  have  load  spikes · Application  Code  wrote  in  Java · Network c  ross  different s  witch/routers/IDC · Database  may  not  scale  well  as  declared · MTS  is  not  so  good  enough.
http://www.onexsoft.com

Isolation
· Bad  SQL  always  exists! · Bad  Logic  Implementation a  lways  exists! · Always  big  agent/customer/account · GMV  is  very  important · Application  is  easy  to  be  grouped,  while  data  
is  very  hard  to  be  grouped. · There  is  no  good  idea  on  Oracle,  resource  
manager?
http://www.onexsoft.com

Faster  Transaction
· Bidding  on  one  item. · Operation  on  one  account. · No  fixed  hot  item  or  account,  hard  to  pre--
evaluate  them. · Faster  CPU/IO  is  not  enough,  need  some  code  
level  change!
http://www.onexsoft.com

Logical  Copy
· How  faster  an  Oracle  switch?   · How  to  automate  the  Oracle  switch? · We  need  read/write  split  for  read  traffics! · We  need  read/write  split  for no  single  point  of  
failure  of  read  traffics! · We  need  save  the  cost o  f  read  traffics! · We  wait  too  long  for  Oracle  ADG!
http://www.onexsoft.com

Application  Rewrite
· Transparent  to  Application  Developers! · Very  hard  to  copy/paste/change t  he  developers  
frameworks. · Bound  to  one  programing  language  may  not  be  a  
good  thing,  and  it  need  long  time  and  huge   resource. · Protocol  level d  esign,  like  network   switches/routers, t  oo  heavy f  or  all  client s  ide   implementation. · Cannot  get  anything  about  Net  8  Protocol   internals.
http://www.onexsoft.com

Two  Levels
· Enhance  the  MySQL
­ OneSQL branch
· Create  the  OneProxy
­ OneProxy for  MySQL ­ OneProxy for  PostgreSQL ­ OneProxy for  Oracle  [need  Net  8  Protocol]
http://www.onexsoft.com

OneSQL
· Stable  TPS  for  100/500/1000/2000/4000/8000   concurrent s  essions.
· Dedicate  Thread  (resource)  Pool  for  queries  and   DMLs,  and  even  more.
· Auto  commit/rollback o  n  success/failure patches. · Optimized  Master  and  Slave f  or  better  logical  
replication p  erformance. · Different  Data  Protection  Mode  as  Oracle's  Data  
Guard.  How  is  Oracle's  ODG  or  logical  standby? · Optimized  Steps f  or  Master/Slave s  witch  over!
http://www.onexsoft.com

80%  of  Oracle
http://www.onexsoft.com

Test  Case
option user  test/test@172.30.12.4:3306:test log  /dev/null time  1m declare vid  bigint 1    500 vid2  bigint 500  1000 begin start; update t  _binlog set  col2=col2--1  where i  d  =  :vid; update t  _binlog set  col2=col2--1  where i  d  =  :vid2; commit; end
http://www.onexsoft.com

MySQL  8K
http://www.onexsoft.com

8K  Connection
http://www.onexsoft.com

16K  Connections
http://www.onexsoft.com

OneProxy
· Protocol  level  switches/routers  for  databases! · Cross  system c  onnection  pool,  never  20000 c  onnection  
per  database  any  more. · Read  failover  or  read/write  split/balance  with  
application  redesign  or  code  change. · Split  huge  table  into  MySQL  groups  without  application  
redesign  or  code  change. · Support  parallel  query  like  MPP  system. · Acting  as  a  Performance   schema. · Working  as  a  database  firewall  at  the  same  time. · High  availability  (HA)  and  high  performance   (40W  QPS)
http://www.onexsoft.com

Transparent
http://www.onexsoft.com

Traffic  Policy

Policy Master--only Read--failover Read--slave Read--balance
Big--slave Big--balance Write--failover Write--balance

Query master master,  slave  if  no  master slave,  master  if no  slave
any slave,  master  if  no slave
any any any
http://www.onexsoft.com

DMLs master master master master master master master  (auto failover)
any

Database  Split
{ "table"      :  "my_range", "pkey"        :  "id", "type"        :  "int", "method"    :  "range", "partitions": [ {  "suffix" :    "_0",  "group": "  server1",  "value" :    100000  }, {  "suffix" :    "_1",  "group": "  server2",  "value" :    200000  }, {  "suffix" :    "_2",  "group": "  server3",  "value" :    300000  }, {  "suffix" :    "_3",  "group": "  server4",  "value" :    null          } ]
}
http://www.onexsoft.com

MPP



3500
3000
2500
2000
1500
1000
500
0  1 2

MySQL +    SSD, 1  B  rows/100GB  Total

 651 1129 2861

16 58 89 174
http://www.onexsoft.com

24 42 59 106

More!
· We  can  do  more! · We  need  do  more! · We  must  do  more!
http://www.onexsoft.com

 


ORA



Oracle

z3 ­ SQL

zData ­ 

BayMax

 

http://www.onexsoft.com

