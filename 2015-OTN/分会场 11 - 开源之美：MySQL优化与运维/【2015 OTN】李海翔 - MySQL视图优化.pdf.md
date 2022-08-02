 ! .Z42-
1

.Z42-
 
 
MySQL vs PostgreSQL vs Oracle
2

1 
 
NO
.Z42-c3  !

1 

  

.Z42-c4  !

1 
 
.Z42-c5  !

1 
  
.Z42-c6  !

1 
sql  ...
4,2

_ ht t p://zhidao.baidu.com/link ?url=QYKOt OA dPW8IBoTy 5BnGy 9xL5OcaZle5TXRUuy euV i2alhLeS HQXiUqflXc dgrZaJ o0cpk RfS jMW_LguThRT1
.Z42-c7  !

1 
 

 

 

.Z42-c8  !

1 
An  operation  that  references z  ero  or  more b  ase   tables a  nd  returns  a  table i  s c  alled  a q  uery.  



CREATE     VIEW  v1 AS...

  ""
CREATE     TABLE...
.Z42-c9  !

1 
""
 



 

ßWe a  re h  ere

 SQL 

10
.Z42-c

2 

2 CREATE TABLE t1 (id1 INT, a1 INT UNIQUE, b1 INT, PRIMARY KEY(id1)); CREATE TABLE t2 (id2 INT, a2 INT UNIQUE, b2 INT, PRIMARY KEY(id2)); CREATE TABLE t3 (id3 INT UNIQUE, a3 INT UNIQUE, b3 INT);
UNOION CREATE VIEW v_SPJ AS SELECT * FROM t1, t2; CREATE VIEW v_NON_SPJ AS
SELECT DISTINCT t1.b1, t2.b2 FROM t1, t2 GROUP BY t1.b1, t2.b2; CREATE VIEW v_UNION AS SELECT * FROM t1 UNION SELECT * FROM t2;
 INSERT INTO t1 VALUES (1,1,1),(2,2,2),(3,3,3); INSERT INTO t2 VALUES (1,1,1),(2,2,2),(30,30,30); INSERT INTO t3 VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,1),(5,5,2),(6,6,3);
11
.Z42-c

2 
1
EXPLAIN SELECT * FROM v_NON_SPJ; EXPLAIN SELECT * FROM t3, v_SPJ;
CREATE VIEW v_SPJ AS SELECT * FROM t1, t2; CREATE VIEW v_NON_SPJ AS SELECT DISTINCT t1.b1, t2.b2 FROM t1, t2 GROUP BY t1.b1, t2.b2;
12
.Z42-c

2 

1

mysql> EXPLAIN SELECT * FROM v_NON_SPJ;

+ - - - - + - -- -- -- -- -- -- +- -- -- -- -- -- -+ -- -- -- -- -- -- +- -- -- -+ -- -- -- -- -- -- -- -+ -- -- -- +- -- -- -- -- +- -- -- -+ -- -- -- +- -- -- -- -- -+ -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -----

+ | id | select_type | table |

| partitions | type | possible_keys | key | key_len | ref | rows | filtered | Extra

+ - - - - + - -- -- -- -- -- -- +- -- -- -- -- -- -+ -- -- -- -- -- -- +- -- -- -+ -- -- -- -- -- -- -- -+ -- -- -- +- -- -- -- -- +- -- -- -+ -- -- -- +- -- -- -- -- -+ -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ----+

| 1 | PRIMARY | <derived2> | NULL

| ALL | NULL

| NULL | NULL | NULL | 9 | 100.00 | NULL

| | 2 | DERIVED

| t1

| NULL

| ALL | NULL

| NULL | NULL | NULL | 3 | 100.00 | Using temporary; Using filesort

| | 2 | DERIVED

| t2

| NULL

| ALL | NULL

| NULL | NULL | NULL | 3 | 100.00 | Using join buffer (Block Nested Loop)

| + - - - - + - -- -- -- -- -- -- +- -- -- -- -- -- -+ -- -- -- -- -- -- +- -- -- -+ -- -- -- -- -- -- -- -+ -- -- -- +- -- -- -- -- +- -- -- -+ -- -- -- +- -- -- -- -- -+ -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ----+

3 rows in set, 1 warning (0.00 sec)

mysql> EXPLAIN SELECT * FROM t3, v_SPJ;

+ - - - - + - -- -- -- -- -- -- +- -- -- -- +- -- -- -+ -- -- -- +- -- -- -- -- -+ -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -+

| id | select_type | table | type | rows | filtered | Extra

|

+ - - - - + - -- -- -- -- -- -- +- -- -- -- +- -- -- -+ -- -- -- +- -- -- -- -- -+ -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -+

| 1 | SIMPLE

| t1 | ALL | 3 | 100.00 | NULL

|

| 1 | SIMPLE

| t2 | ALL | 3 | 100.00 | Using join buffer (Block Nested Loop) |

| 1 | SIMPLE

| t3 | ALL | 6 | 100.00 | Using join buffer (Block Nested Loop) |

+ - - - - + - -- -- -- -- -- -- +- -- -- -- +- -- -- -+ -- -- -- +- -- -- -- -- -+ -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -+




t3 JOIN v_SPJ == t3 JOIN (t1 JOIN t2) == t1 JOIN t2 JOIN t3

.Z42-c13  !

2 

v_SPJ

t1

t2

t3



SELECT * FROM t3, v_SPJ;

 t1

t2

t3

.Z42-c14  !

2 
1SPJ SELECTPROJECTJOIN SPJ SPJSPJ
.Z42-c15  !

2 

1
EXPLAIN SELECT * FROM v_NON_SPJ; EXPLAIN SELECT * FROM v_SPJ;

SPJ

SELECT * t1, CREATE VIEW v_SPJ AS

FROM

t2;

CREATE VIEW v_NON_SPJ AS SELECT DISTINCT t1.b1, t2.b2 FROM t1, t2 GROUP BY t1.b1, t2.b2;

.Z42-c16  !

2 

1SPJ

mysql> EXPLAIN SELECT * FROM t3,

(SELECT * FROM (SELECT * FROM (SELECT * FROM (SELECT * FROM

5 


(SELECT * FROM v_SPJ) v1) v2) v3) v4) v5;

+----+-------------+-------+------------+------+---------------+------+

| id | select_type | table | partitions | type | possible_keys | key |

+----+-------------+-------+------------+------+---------------+------+

| 1 | SIMPLE

| t1 | NULL

| ALL | NULL

| NULL |

| 1 | SIMPLE

| t2 | NULL

| ALL | NULL

| NULL |

| 1 | SIMPLE

| t3 | NULL

| ALL | NULL

| NULL |

+----+-------------+-------+------------+------+---------------+------+

3 rows in set, 1 warning (0.07 sec)

.Z42-c17  !

2 
2SPJ
EXPLAIN SELECT * FROM t2 WHERE id2 IN (SELECT b1 FROM v_SPJ); EXPLAIN SELECT * FROM t2 WHERE b2 IN (SELECT b1 FROM v_SPJ);
 IN
.Z42-c18  !

2 

2

mysql> EXPLAIN SELECT * FROM t2 WHERE id2 IN (SELECT b1 FROM v_SPJ);

+----+-------------+-------+-------+------+-------------------------------------------------------------------+

| id | select_type | table | type | key | Extra

|

+----+-------------+-------+-------+------+-------------------------------------------------------------------+

| 1 | SIMPLE

| t1 | ALL | NULL | Start temporary

|

| 1 | SIMPLE

| t2 | ALL | NULL | Using where; Using join buffer (Block Nested Loop)

|

| 1 | SIMPLE

| t2 | index | id2 | Using index; End temporary; Using join buffer (Block Nested Loop) |

+----+-------------+-------+-------+------+-------------------------------------------------------------------+

3 rows in set, 1 warning (0.01 sec)




mysql> SHOW WARNINGS; ... /* select#1 */ select `d`.`t2`.`id2` AS `id2`,`d`.`t2`.`a2` AS `a2`,`d`.`t2`.`b2` AS `b2`

semi join from `d`.`t2`

(`d`.`t1` join `d`.`t2`)

where (`d`.`t2`.`id2` =`d`.`t1`.`b1`)

...

.Z42-c19  !

2 

2

mysql> EXPLAIN SELECT * FROM t2 WHERE b2 IN(SELECT b1 FROM v_SPJ);

+----+--------------+-------------+--------+------------+----------------------------------------------------+

| id | select_type | table

| type | key

| Extra

|

+----+--------------+-------------+--------+------------+----------------------------------------------------+

| 1 | SIMPLE

| t2

| ALL | NULL

| Using where

|

| 1 | SIMPLE

| <subquery2> | eq_ref | <auto_key> | NULL

|

| 2 | MATERIALIZED | t1

| ALL | NULL

| NULL

|

| 2 | MATERIALIZED | t2

| index | id2

| Using index; Using join buffer (Block Nested Loop) |

 +----+--------------+-------------+--------+------------+----------------------------------------------------+

4 rows in set, 1 warning (0.00 sec)



mysql> SHOW WARNINGS;



...

/* select#1 */ select `d`.`t2`.`id2` AS `id2`,`d`.`t2`.`a2` AS `a2`,`d`.`t2`.`b2` AS `b2`

semi join from `d`.`t2`

(`d`.`t1` join `d`.`t2`) where (`<subquery2>`.`b1` = `d`.`t2`.`b2`)

......

.Z42-c20  !

2 

2
EXPLAIN SELECT * FROM t2 WHERE id2 IN (SELECT b1 FROM v_SPJ);
EXPLAIN SELECT * FROM t2 WHERE b2 IN (SELECT b1 FROM v_SPJ);

SPJ 

CREATE VIEW v_SPJ AS SELECT * FROM t1, t2;

21
.Z42-c

2 

2

EXPLAIN SELECT * FROM t2 WHERE id2 IN(SELECT b1 FROM v_SPJ);

SPJ 

EXPLAIN SELECT * FROM t2 WHERE b2 IN(SELECT b1 FROM v_SPJ);
EXPLAIN SELECT * FROM t2 WHERE a2 IN (SELECT b1 FROM v_SPJ);

 

CREATE VIEW v_SPJ AS SELECT * FROM t1, t2; CREATE TABLE t2 (id2 INT UNIQUE, a2 INT UNIQUE, b2 INT);
22
.Z42-c

2 

2

EXPLAIN SELECT * FROM t2 WHERE id2 IN(SELECT b1 FROM v_SPJ);

SPJ 

EXPLAIN SELECT * FROM t2 WHERE b2 IN(SELECT b1 FROM v_SPJ);
EXPLAIN SELECT * FROM t2 WHERE a2 IN (SELECT b1 FROM v_SPJ);
CREATE VIEW v_SPJ AS SELECT * FROM t1, t2; CREATE TABLE t2 (id2 INT UNIQUE, a2 INT UNIQUE, b2 INT);

 
IN  ""

23
.Z42-c

2 
3UNION
EXPLAIN SELECT * FROM v_UNION;

CREATE VIEW v_UNION AS SELECT * FROM t1 UNION SELECT * FROM t2;

.Z42-c24  !

2 

3

mysql> EXPLAIN SELECT * FROM v_UNION;

+----+--------------+------------+------+------+-----------------+

| id | select_type | table

| type | key | Extra

|

+----+--------------+------------+------+------+-----------------+

| 1 | PRIMARY

| <derived2> | ALL | NULL | NULL

|

| 2 | DERIVED

| t1

| ALL | NULL | NULL

|

| 3 | UNION

| t2

| ALL | NULL | NULL

|

| NULL | UNION RESULT | <union2,3> | ALL | NULL | Using temporary |

+----+--------------+------------+------+------+-----------------+

4 rows in set, 1 warning(0.02 sec)



mysql> SHOW WARNINGS;

...

/* select#1 */ select `v_union`.`id1` AS `id1`,`v_union`.`a1` AS `a1`,`v_union`.`b1` AS `b1`

from `d`.`v_union`

...

.Z42-c25  !

2 
3 EXPLAIN SELECT * FROM v_UNION;

UNION 

CREATE VIEW v_UNION AS SELECT * FROM t1 UNION SELECT * FROM t2;

26
.Z42-c

2 
4SPJ
CREATE VIEW v_NON_SPJ_1 AS SELECT DISTINCT t1.b1, t2.b2 FROM t1, t2;
EXPLAIN SELECT * FROM v_NON_SPJ_1;
.Z42-c27  !

2 

4SPJ

mysql> EXPLAIN SELECT * FROM v_NON_SPJ_1;

+----+-------------+------------+------+---------------------------------------+

| id | select_type | table

| type | Extra

|

+----+-------------+------------+------+---------------------------------------+

| 1 | PRIMARY | <derived2> | ALL | NULL

|

| 2 | DERIVED | t1

| ALL | Using temporary

|

| 2 | DERIVED | t2

| ALL | Using join buffer (Block Nested Loop) |

+----+-------------+------------+------+---------------------------------------+
3 rows in set, 1 warning (0.00 sec) 

mysql> SHOW WARNINGS;



...



/* select#1 */ select `v_non_spj_1`.`b1` AS `b1`,`v_non_spj_1`.`b2` AS `b2`

from `d`.`v_non_spj_1`

...

.Z42-c28  !

2 
4SPJ

SPJGROUP B  Y/DISTINCT SPJ

SPJSPJ

1  GROUP B  Y

2  DISTNICT

3  

4  :  UNION  /  UNION D  ISTINCT /  UNION  ALL(3)

5  connect   byOUTER  JOINPL/SQL  function

 SPJ

.Z42-c29  !

2 
4
EXPLAIN SELECT * FROM v_NON_SPJ_1;

SPJ

CREATE VIEW v_NON_SPJ_1 AS SELECT DISTINCT t1.b1, t2.b2 FROM t1, t2;

30
.Z42-c

2 
5SPJ
EXPLAIN SELECT DISTINCT * FROM v_SPJ; EXPLAIN SELECT MAX(b1) FROM v_SPJ; EXPLAIN SELECT COUNT(b1) FROM v_SPJ;
CREATE VIEW v_SPJ AS SELECT * FROM t1, t2;
.Z42-c31  !

2 

5SPJ

mysql> EXPLAIN SELECT DISTINCT * FROM v_SPJ;

+----+-------------+-------+------+------+---------------------------------------+

| id | select_type | table | type | key | Extra

|

+----+-------------+-------+------+------+---------------------------------------+

| 1 | SIMPLE

| t1 | ALL | NULL | Using temporary

|

| 1 | SIMPLE

| t2 | ALL | NULL | Using join buffer (Block Nested Loop) |

+----+-------------+-------+------+------+---------------------------------------+

2 rows in set, 1 warning (0.00 sec)

mysql> EXPLAIN SELECT MAX(b1) FROM v_SPJ;

+----+-------------+-------+-------+------+----------------------------------------------------+

| id | select_type | table | type | key | Extra

|

+----+-------------+-------+-------+------+----------------------------------------------------+

| 1 | SIMPLE

| t1 | ALL | NULL | NULL

|

| 1 | SIMPLE

| t2 | index | id2 | Using index; Using join buffer (Block Nested Loop) |

+----+-------------+-------+-------+------+----------------------------------------------------+

2 rows in set, 1 warning (0.00 sec)

mysql> EXPLAIN SELECT COUNT(b1) FROM v_SPJ;

+----+-------------+-------+-------+------+----------------------------------------------------+

| id | select_type | table | type | key | Extra

|

+----+-------------+-------+-------+------+----------------------------------------------------+

| 1 | SIMPLE

| t1 | ALL | NULL | NULL

|

| 1 | SIMPLE

| t2 | index | id2 | Using index; Using join buffer (Block Nested Loop) |

+----+-------------+-------+-------+------+----------------------------------------------------+

2 rows in set, 1 warning (0.00 sec)

 


.Z42-c32  !

2 

5SPJ--

EXPLAIN SELECT DISTINCT * FROM v_SPJ; EXPLAIN SELECT MAX(b1) FROM v_SPJ; EXPLAIN SELECT COUNT(b1) FROM v_SPJ;

  

CREATE VIEW v_NON_SPJ_1 AS SELECT DISTINCT t1.b1, t2.b2 FROM t1, t2;


SPJ SPJ
33
.Z42-c

3 


SPJ 

FROM  

Merge 

WHERE  

SQLMerge
.Z42-c34  !

3 
MERGE
SELECT * FROM t3,v_SPJ WHERE t3.a3>1; CREATE VIEW v_SPJ AS SELECT * FROM t1, t2 WHERE t1.a1=t2.a2;
SELECT * FROM t3,(SELECT * FROM t1, t2 WHERE t1.a1=t2.a2 ) v_SPJ WHERE t3.a3>1;
SELECT * FROM t3,(t1, t2) WHERE t3.a3>1 AND t1.a1=t2.a2 ;
.Z42-c35  !

3 Merge"" SQL 





.Z42-c36  !

3 

CREATE VIEW v_SPJ_1 AS SELECT * FROM t1, t2 WHERE id1=id2;

 t1 t2


 t3(t1,t2) - -> t  3(t2,t1)        (t1,t2) t  3          (t2,t1)t3
t3(t1,t2) - -> t  3,t1,t2        t3,t2,t1        t1,t2,t3        t1,t3,t2 t2,t1,t3        t2,t3,t1

mysql> EXPLAIN SELECT * FROM t3, v_SPJ_1 WHERE t3.b3=v_SPJ_1.id2 AND t3.b3=1;

+----+-------------+-------+------------+-------+---------------+---------+---------+-------+

| id | select_type | table | partitions | type | possible_keys | key | key_len | ref |

+----+-------------+-------+------------+-------+---------------+---------+---------+-------+

| 1 | SIMPLE

| t1 | NULL

| const | PRIMARY

| PRIMARY | 4

| const |

| 1 | SIMPLE

| t2 | NULL

| const | id2

| id2 | 5

| const |

| 1 | SIMPLE

| t3 | NULL

| ALL | NULL

| NULL | NULL | NULL |

+----+-------------+-------+------------+-------+---------------+---------+---------+-------+

mysql> SHOW WARNINGS; ... from `d1`.`t3` join `d1`.`t1`
join `d1`.`t2`
where (`d1`.`t3`.`b3` = 1)

 


 


.Z42-c37  !

3  
1 IO 2 
SELECT * FROM t2 AS t22, v_SPJ WHERE t22.b2=v_SPJ.id2; t1500blockt21000blockpage101

t221000block



 
 

t1500block t21000block


 t1t2 
t22t1t2 t2 JOIN (  t1 JOIN  t2)

.Z42-c38  !

3 

Step 1t1t2t22, 101

t1500block t21000block 

100

1 
1t2

1 100t1500/100=5 5*1000=5000IO

1000IO

2 5 100IO5500IO
3 IO=500+5000=5500IO t1 JOIN t2
.Z42-c39  !

3 

Step 2t22  t1t2

100

1 


t22block10 1 100t221000/100=10

10000*5500=55000000IO 2 10
100IO101000IO

10*5500=55000IO 2 10
100IO101000IO

3 2IO=1000+55000000=55001000IO

3 2IO=1000+55000=56000IO

4 IO=55001000IO 4 IO=56000IO

.Z42-c40  !

3  
Step 1t1t22t2,101

100

1 
1t22

1 100t1500/100=5 5*1000=5000IO

1000IO

2 5 100IO5500IO
3 IO=500+5000=5500IO t1 JOIN t22
.Z42-c41  !

3  MySQL
Step 2t1t22L1200blockt2

100

1 
1t2

1 100L1200/100=12

1000IO

12*1000=12000IO 2 12
100IO121200IO
3 2IO=1200+12000=13200IO

4 3IO=5500+13200=18700IO

.Z42-c42  !

3 

 · 56000IO  · 
 · 18700IO  · 

60000 50000 40000 30000 20000 10000
0

IO
  
.Z42-c43  !

3 

mysql> FLUSH STATUS; Query OK, 0 rows affected (0.00 sec)

mysql> FLUSH STATUS; Query OK, 0 rows affected (0.00 sec)

mysql> SELECT COUNT(*) FROM t2 AS t22, v_SPJ WHERE t22.b2=v_SPJ.id2; +----------+ | COUNT(*) | +----------+ | 1000000 | +----------+ 1 row in set (1.10 sec)

mysql> SELECT STRAIGHT_JOIN COUNT(*) FROM t2 AS t22, (t1, t2) WHERE t22.b2=t2.id2; +----------+ | COUNT(*) | +----------+ | 1000000 | +----------+ 1 row in set (33.37 sec)

mysql> SHOW STATUS LIKE 'Handler_read%';

+-----------------------+-------+

| Variable_name

| Value |

+-----------------------+-------+

| Handler_read_first | 2 |

| Handler_read_key

| 1002 |

| Handler_read_last | 0 |

| Handler_read_next | 2000 |

| Handler_read_prev | 0 |

| Handler_read_rnd

|0 |

| Handler_read_rnd_next | 1001 |

+-----------------------+-------+

7 rows in set (0.00 sec)

mysql> SHOW STATUS LIKE 'Handler_read%';

+-----------------------+---------+

| Variable_name

| Value |

+-----------------------+---------+

| Handler_read_first | 2

|

| Handler_read_key

| 1000002 |

| Handler_read_last | 0

|

| Handler_read_next | 1001000 |

| Handler_read_prev | 0

|

| Handler_read_rnd

| 0

|

| Handler_read_rnd_next | 1001 |

+-----------------------+---------+

7 rows in set (0.00 sec)

  
IO





·  · 

 


·  · 


·  · View  
Merging
 

.Z42-c44  !

4 

·  · 

 


·  · 


·  · View  
Merging
 

.Z42-c45  !

4 ----

 --
 "Merge"==""==""
SELECT * FROM t3,v_SPJ WHERE t3.a3>1; CREATE VIEW v_SPJ AS SELECT * FROM t1, t2 WHERE t1.a1=t2.a2;
SELECT * FROM t3,(SELECT * FROM t1, t2 WHERE t1.a1=t2.a2 ) v_SPJ WHERE t3.a3>1;

SELECT * FROM t3,(t1, t2) WHERE t3.a3>1 AND t1.a1=t2.a2 ;

·  · 

 


·  · 


·  · View  
Merging
 

.Z42-c46  !

5 MySQL vs PostgreSQL vs Oracle------
MySQL

Postgr eSQL

 


Oracle



.Z42-c47  !

5 MySQL vs PostgreSQL vs Oracle------------MySQL
MySQL ------ The  result o  f  a  query  is  called a    derived t  able.
CREATE VIEW v_SPJ AS SELECT * FROM t1, t2; EXPLAIN SELECT * FROM v_SPJ; EXPLAIN SELECT * FROM (SELECT * FROM t1, t2) AS v_SPJ; //

CREATE VIEW v_NON_SPJ AS SELECT DISTINCT t1.b1, t2.b2 FROM t1, t2 GROUP BY t1.b1, t2.b2;

EXPLAIN SELECT * FROM v_NON_SPJ;

MySQL

EXPLAIN SELECT * FROM (SELECT DISTINCT t1.b1, t2.b2



FROM t1, t2 GROUP BY t1.b1, t2.b2) AS v_NON_SPJ; //

P o st gr eSQL



Oracle





.Z42-c48  !

5 MySQL vs PostgreSQL vs Oracle------------MySQL
MySQL ------ The  result o  f  a  query  is  called a    derived t  able.

MySQL V5.7

mysql> EXPLAIN SELECT * FROM (SELECT * FROM t1, t2) AS v_SPJ;

+----+-------------+-------+------+------+---------------------------------------+

| id | select_type | table | type | key|Extra

|

+----+-------------+-------+------+------+---------------------------------------+

| 1 | SIMPLE

| t2 | ALL | NULL |NU5L.L7

|

| 1 | SIMPLE

| t1 | ALL | NULL |Using join buffer (Block Nested Loop) |

+----+-------------+-------+------+------+---------------------------------------+

2 rows in set, 1 warning (0.05 sec) 

mysql> EXPLAIN SELECT * FROM (SELECT DISTINCT t1.b1, t2.b2 FROM t1, t2 GROUP BY t1.b1, t2.b2)

AS v_NON_SPJ;

+----+-------------+------------+------+------+---------------------------------------+

| id | select_type | table

| type | key | Extra

|

+----+-------------+------------+------+------+---------------------------------------+

| 1 | PRIMARY | <derived2> | ALL | NULL | NULL

|

MySQL

| 2 | DERIVED | t2

| ALL | NULL | Using temporary; Using filesort

|

| 2 | DERIVED | t1

| ALL | NULL | Using join buffer (Block Nested Loop) |

+----+-------------+------------+------+------+---------------------------------------+



3 rows in set, 1 warning (0.00 sec)

P o st gr eSQL

 

Oracle

http://dev.mysql.com/worklog/task/?id=5275


.Z42-c49  !

5 MySQL vs PostgreSQL vs Oracle------------MySQL
MySQL ------ The  result o  f  a  query  is  called a    derived t  able.

MySQL V5.5

mysql> EXPLAIN SELECT * FROM t1, (SELECT * FROM t2) as tt;

+----+-------------+------------+------+---------------+------+---------+------+------+-------------------+

| id | select_type | table

| type | possible_keys | key | key_len | ref | rows | Extra

|

+----+-------------+------------+------+---------------+------+---------+------+------+-------------------+

| 1 | PRIMARY | t1

| ALL | NULL

| NULL | NULL | NULL | 3 |

|

| 1 | PRIMARY | <derived2> | ALL | NULL

| NULL | NULL | NULL | 3 | Using join buffer |

| 2 | DERIVED | t2

| ALL | NULL

| NULL | NULL | NULL | 3 |

|

+----+-------------+------------+------+---------------+------+---------+------+------+-------------------+

3 rows in set (1 min 25.10 sec)

V5.5  

MySQL

P o st gr eSQL

 


Oracle



.Z42-c50  !

5 MySQL vs PostgreSQL vs Oracle------------MySQL
.Z42-c51  !

5 MySQL vs PostgreSQL vs Oracle------------Oracle







  

 

SPJMerge 
FROM 

 Oracle
Oracle Oracle

SQL

.Z42-c52  !

 


ORA



Oracle

z3 ­ SQL

zData ­ 

BayMax

 

55

