RDS
@ yanzhao.liu@alibaba-inc.com

DRDS
· RDSDRDSRDS 
· 
­  ­  ­ MySQLMySQL
· 
­ Scale up>>... ­ Scale outtps ­ scale up


· AlibabaCobar
·  TDDL
· 
­ NIO 
­  ­ web ­ web

--

Application

MySQL protocol

DRDS

DRDS

MySQL protocol

DRDS Web Console DRDS

RDS

RDS

RDS

RDS

RDS

--

Sharding
·  · 
­ Hash ­ ListHash ­ Range
· 

--SQL parser
Select id, member_id from wp_image where member_id = `123'

· MySQL 5.5 full support

SQL Parser

· 10X performance javacc antlr

select

· Visitor

AST

exprList

from

=

id

member_id wp_image member_id

`123'

--Optimizer

· SQL

select avg(id) from A

· group by order bylimit  
· minmaxsum avg

avg(id)

· join 

Query sum(id),count(
id) from A

Query sum(id),count(
id) from A

Merge avgid)
subQuery Q1:select count(id),sum(id) A_0 Q2:select count(id),sum(id) A_1 Q3:select count(id),sum(id) A_2
Query sum(id),count(
id) from A

--.

Select * from t limit 10 offset 10000 order by id

· 
­ Server ­  ­ 
· 
­ offloading ­ 

RDS

RDS

Ordered as needed

Packet

Packet

DRDS



Y

N

Merge

--.
· 
­ RDS ­ SQL ­ 
· 
­ Hang ­ RDS

IN R Handler

OUT
W FC
W Q

Session

Executor
R IN

W

Q

BC

w OUT

--
·  · 


· 


·  ·  · + · "catch up"
 ·  ·  · 


·  · + · 


·  · 
 

ID
· RDS ·  · 
­ MySQL auto_increment ­ +SeverID
· sequence
­ Oracle Sequence ­  ­ RDS




· application good design99% ·  ·  · 

Thanks!

