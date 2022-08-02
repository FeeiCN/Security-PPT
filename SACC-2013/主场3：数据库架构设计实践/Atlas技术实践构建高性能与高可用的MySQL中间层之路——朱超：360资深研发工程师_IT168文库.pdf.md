Atlas  MySQL

·  ·  ·  ·  · 



DB
· IP ·  · 

DBA
· DB · 


· DB ·  · DBA · DB

·  ·  ·  ·  · 









·  ·  ·  ·  · 



·  ·  ·  · Lua VS C ·  ·  ·  ·  ·  · 



1
·  · 1

2
·  
· 1 · 2(QPS2) · 3

3
·  · 1 · 2

4Lua VS C
· Lua 
· 1CQPS3latency 80%
· 2QPS50%

5
· set 
· 1 

6
· get_lockrelease_lock 
· 1

7
· DB 
· 1DB

8
· DB · 1

9
· 5.5.7MySQL Unknown Command
· 15.5.7 

10
· fd 
· 1fd
· 2SQL

·  ·  ·  ·  · 



·  ·  ·  · DB ·  · SQL · IP · 



1

· 

2

· /*master*/ SELECT * FROM mytable

· SQL

3

· 

4DB · select * from backends() · add master ip:port · add slave ip:port@weight · remove backend i · set offline i · set online i

5
· 1online · 2

6SQL
· WHEREDELETE · SLEEP

· IP · IP

7IP

8SQL
· SQLIP DB 
· [02/14/2013 16:21:41] C:192.168.1.2 S:192.168.1.3 OK 21.807 "SELECT * FROM person.mt WHERE id = 1025189561"

·  ·  ·  ·  · 



·  · 




· DB
·  
· 

Zookeeper
· AtlasZookeeper
· ZookeeperAtlasIP
· LVSfailoverLVS 


·  https://github.com/qihoo360/atlas

Thanks!

