
Sharding 


p (yangtingkun) p Oracle ACE Director p ITPUB p ACOUG p Oracle Oracle DBAOracle DBA3 p DBA p BLOG2500 p CTO


· Sharding ·  ·  · 12.2

10.2 

11.2 

12.1 Exadata

Sharding
· Oracle Sharding
­ ­ ­ ­HASHRANGELIST ­RebalanceResharding

Sharding

 10.2

 HP Superdome

 10000

11.2

X86  18000

12.1

Exadata X5

25000*8

12.2

Sharding

20000*100

· Sharding



· 

· 

· 12.2


· 
­
­
­ 
­

· 
­



­

­OLTP

­OLAP

Oracle


Oracle 8.0 Oracle 8.1 Oracle 9.0 Oracle 9.2 Oracle 10.1 Oracle 10.2 Oracle 11.1
Oracle 11.2
Oracle 12.1


 
 



1
  
HASH 



   SPLIT 
"AND"


ADDDROP EXCHANGE MERGE

 DROP TABLE    

 

MOVE TRUNCATE 

· Sharding



· 

· 

· 12.2


· 
­  ­ 
· 
­  ­  ­  ­ 
· 
­  ­ TRUNCATEDROPEXCHANGE ­  ­  ­ 


· 
­  ­ DELETE ­ DELETE ­  ­ 
· 
­ INSERT + EXCHANGE ­ MERGE ­ DELETE ­ 


SQL> SELECT TEMPORARY, COUNT(*) FROM T_PART PARTITION (P3) GROUP BY TEMPORARY;

T COUNT(*)

- ----------

Y

30

N

87261

SQL> LOCK TABLE T_PART PARTITION (P3) IN EXCLUSIVE MODE;

Table(s) Locked.

SQL> INSERT INTO T_INTER SELECT * FROM T_PART PARTITION (P3) WHERE TEMPORARY = 'Y';

30 rows created.

SQL> ALTER TABLE T_PART EXCHANGE PARTITION P3 WITH TABLE T_INTER;

Table altered.

SQL> SELECT TEMPORARY, COUNT(*) FROM T_PART PARTITION (P3) GROUP BY TEMPORARY;

T COUNT(*)

- ----------

Y

30


· 
­  ­  ­  ­  ­ DDL
· 
­  ­  ­ 


· 
­  ­  ­ 
SQL> CREATE TABLE T_PRIMARY (ID NUMBER PRIMARY KEY, NAME VARCHAR2(128), CREATED DATE) 2 PARTITION BY RANGE (CREATED) 3 (PARTITION P1 VALUES LESS THAN (TO_DATE('201512', 'YYYYMM')), 4 PARTITION P2 VALUES LESS THAN (MAXVALUE));
Table created.
SQL> CREATE TABLE T_FOREIGN (ID NUMBER, FID NUMBER NOT NULL, NAME VARCHAR2(128), 2 CONSTRAINT FK_FID FOREIGN KEY (FID) REFERENCES T_PRIMARY (ID)) 3 PARTITION BY REFERENCE (FK_FID);
Table created.


· 
­  ­  ­ 
· 
­  ­ 2 ­  ­ 
· 
­  ­  ­ 


·  · RAC · 
SQL> CREATE TABLE T_PART (ID NUMBER, NAME VARCHAR2(30), CREATED DATE);
Table created.
SQL> CREATE INDEX IND_PART_CREATED ON T_PART(CREATED) GLOBAL 2 PARTITION BY HASH (CREATED) 3 PARTITIONS 32;
Index created.


· 
­  ­  ­ 
· 
­  ­  ­ DEFAULT
· 
­  ­  ­ 

RANGE
SQL> CREATE TABLE T_MULTI_RANGE (ID NUMBER, FINISH_DATE DATE, REGION NUMBER) 2 PARTITION BY RANGE (REGION, FINISH_DATE) 3 (PARTITION P_R_11_201510 VALUES LESS THAN (11, TO_DATE('20151101', 'YYYYMMDD')), 4 PARTITION P_R_11_201511 VALUES LESS THAN (11, TO_DATE('20151201', 'YYYYMMDD')), 5 PARTITION P_R_99_201510 VALUES LESS THAN (99, TO_DATE('20151101', 'YYYYMMDD')), 6 PARTITION P_R_99_201511 VALUES LESS THAN (99, TO_DATE('20151201', 'YYYYMMDD')));

Table created.

SQL> INSERT INTO T_MULTI_RANGE VALUES (1, TO_DATE('20151119', 'YYYYMMDD'), 11);

1 row created.

SQL> INSERT INTO T_MULTI_RANGE VALUES (2, TO_DATE('20151119', 'YYYYMMDD'), 8);

1 row created.

SQL> SELECT A.*, (SELECT SUBOBJECT_NAME FROM DBA_OBJECTS WHERE DATA_OBJECT_ID = DBMS_ROWID.ROWID_OBJECT(A.ROWID)) PARTITION_NAME FROM T_MULTI_RANGE A;

ID FINISH_DATE

REGION PARTITION_NAME

---------- ------------------- ---------- ------------------------------

2 2015-11-19 00:00:00

8 P_R_11_201510

1 2015-11-19 00:00:00

11 P_R_11_201511

RANGE-RANGE

SQL> CREATE TABLE T_RANGE_RANGE (ID NUMBER, FINISH_DATE DATE, REGION NUMBER) 2 PARTITION BY RANGE (REGION) SUBPARTITION BY RANGE(FINISH_DATE) 3 (PARTITION P_R_12 VALUES LESS THAN (12) 4 (SUBPARTITION SP_12_201510 VALUES LESS THAN (TO_DATE('20151101', 'YYYYMMDD')), 5 SUBPARTITION SP_12_201511 VALUES LESS THAN (TO_DATE('20151201', 'YYYYMMDD'))), 6 PARTITION P_R_99 VALUES LESS THAN (99) 7 (SUBPARTITION SP_99_201510 VALUES LESS THAN (TO_DATE('20151101', 'YYYYMMDD')), 8 SUBPARTITION SP_99_201511 VALUES LESS THAN (TO_DATE('20151201', 'YYYYMMDD'))));

Table created.

SQL> INSERT INTO T_RANGE_RANGE VALUES (1, TO_DATE('20151119', 'YYYYMMDD'), 11);

1 row created.

SQL> INSERT INTO T_RANGE_RANGE VALUES (2, TO_DATE('20151119', 'YYYYMMDD'), 8);

1 row created.

SQL> SELECT A.*, (SELECT SUBOBJECT_NAME FROM DBA_OBJECTS WHERE DATA_OBJECT_ID = DBMS_ROWID.ROWID_OBJECT(A.ROWID)) PARTITION_NAME FROM T_RANGE_RANGE A;

ID FINISH_DATE

REGION PARTITION_NAME

---------- ------------------- ---------- ------------------------------

1 2015-11-19 00:00:00

11 SP_12_201511

2 2015-11-19 00:00:00

8 SP_12_201511

RANGE
SQL> SELECT /*+ GATHER_PLAN_STATISTICS */ COUNT(*) FROM T_MULTI_RANGE WHERE REGION = 11;

SQL> SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'IOSTATS'));

PLAN_TABLE_OUTPUT ----------------------------------------------------------------------------------------------------SQL_ID ggd5ay4zp5tyc, child number 0 ------------------------------------SELECT /*+ GATHER_PLAN_STATISTICS */ COUNT(*) FROM T_MULTI_RANGE WHERE REGION = 11

Plan hash value: 3317549907

-----------------------------------------------------------------------------------------------------

| Id | Operation

| Name

| Starts | E-Rows | A-Rows | A-Time | Buffers |

-----------------------------------------------------------------------------------------------------

| 0 | SELECT STATEMENT

|

|

1 |

|

1 |00:00:00.01 |

74 |

| 1 | SORT AGGREGATE

|

|

1 |

1 |

1 |00:00:00.01 |

74 |

| 2 | PARTITION RANGE ITERATOR|

|

1 | 33 |

1 |00:00:00.01 |

74 |

|* 3 | TABLE ACCESS FULL

| T_MULTI_RANGE |

3 | 33 |

1 |00:00:00.01 |

74 |

-----------------------------------------------------------------------------------------------------

Predicate Information (identified by operation id): ---------------------------------------------------
3 - filter("REGION"=11)

RANGE-RANGE
SQL> SELECT /*+ GATHER_PLAN_STATISTICS */ COUNT(*) FROM T_RANGE_RANGE WHERE REGION = 11;

SQL> SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'IOSTATS'));

PLAN_TABLE_OUTPUT -------------------------------------------------------------------------------------------------SQL_ID 32jbunc4x0p0a, child number 0 ------------------------------------SELECT /*+ GATHER_PLAN_STATISTICS */ COUNT(*) FROM T_RANGE_RANGE WHERE REGION = 11

Plan hash value: 356403560

---------------------------------------------------------------------------------------------------

| Id | Operation

| Name

| Starts | E-Rows | A-Rows | A-Time | Buffers |

---------------------------------------------------------------------------------------------------

| 0 | SELECT STATEMENT

|

|

1 |

|

1 |00:00:00.01 |

37 |

| 1 | SORT AGGREGATE

|

|

1 |

1 |

1 |00:00:00.01 |

37 |

| 2 | PARTITION RANGE SINGLE|

|

1 |

1 |

1 |00:00:00.01 |

37 |

| 3 | PARTITION RANGE ALL |

|

1 |

1 |

1 |00:00:00.01 |

37 |

|* 4 | TABLE ACCESS FULL | T_RANGE_RANGE |

2|

1 |

1 |00:00:00.01 |

37 |

---------------------------------------------------------------------------------------------------

Predicate Information (identified by operation id): ---------------------------------------------------
4 - filter("REGION"=11)


· 
­ RANGE-RANGE 
­ RANGE-RANGE11g ­ 
RANGE-RANGE 
· 
­  ­  ­  ­  ­  ­ 


· INTERVAL-LIST
­ () ­ () ­ INTERVAL ­  ­ SPLIT ­ 


· 
­  ­  ­ 


· 
­  ­  ­  ­ 


· 
­  ­ 

· Sharding



· 

· 

· 12.2

Oracle 12.2









  

Oracle 12.2

 

 
DDL 

 



Oracle 12.2

· 

SQL> CREATE TABLE T_LIST_AUTO (ID NUMBER, NAME VARCHAR2(30), TYPE VARCHAR2(30)) 2 PARTITION BY LIST (TYPE) AUTOMATIC 3 (PARTITION P1 VALUES ('TABLE'));

Table created.

SQL> INSERT INTO T_LIST_AUTO VALUES (1, 'V_VIEW', 'VIEW');

1 row created.

SQL> SELECT TABLE_NAME, PARTITION_NAME, HIGH_VALUE FROM USER_TAB_PARTITIONS WHERE TABLE_NAME = 'T_LIST_AUTO';

TABLE_NAME

PARTITION_NAME HIGH_VALUE

--------------- --------------- ------------------------------

T_LIST_AUTO P1

'TABLE'

T_LIST_AUTO SYS_P1366

'VIEW'

Oracle 12.2

· 

SQL> CREATE TABLE T_INTER_SUBPART (ID NUMBER, CREATED DATE, TYPE VARCHAR2(30)) 2 PARTITION BY LIST (TYPE) SUBPARTITION BY RANGE (CREATED) INTERVAL (NUMTOYMINTERVAL(1, 'MONTH')) 3 SUBPARTITION TEMPLATE (SUBPARTITION SP1 VALUES LESS THAN (TO_DATE('20151101', 'YYYYMMDD'))) 4 (PARTITION P1 VALUES ('TABLE'));

Table created.

SQL> INSERT INTO T_INTER_SUBPART VALUES (1, SYSDATE, 'TABLE');

1 row created.

SQL> SELECT SUBPARTITION_NAME, HIGH_VALUE FROM USER_TAB_SUBPARTITIONS WHERE TABLE_NAME = 'T_INTER_SUBPART';

SUBPARTITION_NAME HIGH_VALUE

-------------------- --------------------------------------------------------------------------------

P1_SP1

TO_DATE(' 2015-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA

SYS_SUBP1367

TO_DATE(' 2015-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA

Oracle 12.2
· 
SQL> CREATE TABLE T_ONLINE_PART (ID NUMBER, NAME VARCHAR2(128), CREATED DATE); Table created. SQL> INSERT INTO T_ONLINE_PART SELECT ROWNUM, OBJECT_NAME, CREATED FROM DBA_OBJECTS; 94154 rows created. SQL> COMMIT; Commit complete. SQL> ALTER TABLE T_ONLINE_PART MODIFY PARTITION BY RANGE (CREATED)
2 (PARTITION P1 VALUES LESS THAN (TO_DATE('201512', 'YYYYMM')), 3 PARTITION P2 VALUES LESS THAN (TO_DATE('201601', 'YYYYMM')), 4 PARTITION PMAX VALUES LESS THAN (MAXVALUE)) ONLINE; Table created.

 





Oracle

z3 ­ SQL

zData ­ 

BayMax

 

