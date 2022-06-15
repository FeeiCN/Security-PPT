MongoDB
-- 
TJ   MongoDB 

1 MongoDB 2  3 MongoDB 3.2 


TJ  Tang   MongoDB   anoogose

Atomicity Consistency Isolation
DURABILITY
...  guarantees  that  transactions  that  have   committed  will  survive   permanently...

MongoDB  

MongoDB  
Mongos

Primary
 

Primary
Secondary
Secondary
 

Shard  1
Primary
Secondary
Secondary
 

Shard  2

Shard  N

Primary

Primary

Secondary

...

Secondary

Secondary

Secondary

MongoDB  

1 DD
{} 4

3 Data B  uffer

6

2 Journal Buffer
NT 
5

Data F  ile

Journal  File

MongoDB  

1 DD
{} 5

3

2

4

Data B  uffer

8

Journal Buffer

OPLOG

NT 
6 7

Data F  ile

Journal  File

Data   Buffer

Journal Buffer

OPLOG

 Journal
·  ·  · 
· MMAP 100ms,  30ms  if  { j:1} · WiredTiger 100MB or  Checkpoint ·  j:1

 Write  Concern
· mongod · connection  levellevel · 
· w:  0 | 1 | n | majority | tag   · j:  1 · wtimeout:  millis

w:0 Unacknowledged
·  · 2.2   ·  · 

w:1 Acknowledged
· Mongod · 2.4 · 
 · 
100ms

j:1 Journaled

· Journal · 30ms Group Commit ­ 
30ms 

w:2/n/majority  Replica  Acknowledged
· n 



A





MongoDB  2.2   {w:0}  
10  _id


2.4+  {w:1}  

Bj:1 





MongoDB  3.0
W:1  
Kill -9 mongod
 

 j:1

C w: majority





MongoDB  3.0  
w:1,  j:1  
Kill  -9  mongod 
 

 w:  majority

MongoDB    3.2  

2"
.POHP%# IUUQXXNPOHPJOHDPN .POHP%# IUUQVOJWFSTJUZNPOHPECDPN jianfa.tang@mongodb.com

