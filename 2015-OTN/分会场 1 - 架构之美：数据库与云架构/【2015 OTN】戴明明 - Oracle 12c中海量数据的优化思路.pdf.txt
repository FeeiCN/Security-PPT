 %BWF

0SBDMF D 

About Me
· Oracle ACE Associate ·  ORACLE ACOUG  ·  · bloghttp://blog.csdn.net/tianlesoftware · 2014PCIe  · 2014PCIeOracle 


Oracle 12c 

Oracle 

DBA(): 

Oracle 12c 
 offline

Online  

OS 


Recover Datafile

DB Raname 


Oracle 12c­ Online Datafile Move
Oracle 12cMove  SQL> alter database move datafile '/u01/app/oracle/oradata/dave/huaining.dbf' to '/u01/app/oracle/oradata/dave/anqing.dbf'; Database altered.
OS
 Ø Ø ØASM

Information Lifecycle Management (ILM)

Automatic Data
Optimization (ADO)

 

Oracle 12c ILM

 

Heat Map

IT 

Oracle 12c - HEAT MAP
Heat Map Oracle 12crow segment 
 
ADOHeat Map 
 DDL  

Oracle 12c - HEAT MAP

Heat MapHeat Map

SQL> show parameter heat_map

NAME

TYPE

VALUE

------------------- ------------------ ------------------

heat_map

string

OFF

SQL> ALTER SYSTEM SET HEAT_MAP = ON; System altered.

SQL> show parameter heat_map

NAME

TYPE

--------------------- ---------------- ---------

heat_map

string

SQL>

VALUE ON

Oracle 12c - HEAT MAP
Heat Map  ØV$HEAT_MAP_SEGMENT
ID ØDBA_HEAT_MAP_SEGMENT
segmentsegment(ALLUSER) ØDBA_HEAT_MAP_SEG_HISTOGRAM
segment(ALLUSER) ØDBA_HEATMAP_TOP_OBJECTStop 1000 ØDBA_HEATMAP_TOP_TABLESPACEStop 1000


Automatic Data Optimization (ADO)
ADO segment row   Heat Map
no data accessno data modification n daysmonthsyears 
 ROW STORE COMPRESS Basic  ROW STORE COMPRESSADVANCED (Advanced Row  COLUMN STORE COMPRESS FOR QUERY LOW/HIGH (HCC Query ) COLUMN STORE COMPRESS FOR ARCHIVE LOW/HIGH (HCC Archive )

Automatic Data Optimization (ADO)

Automatic Data Optimization (ADO)
ILM ADOalter 
CREATE TABLE sales_ado (PROD_ID NUMBER NOT NULL, CUST_ID NUMBER NOT NULL, TIME_ID DATE NOT NULL, QUANTITY_SOLD NUMBER(10,2) NOT NULL, AMOUNT_SOLD NUMBER(10,2) NOT NULL ) PARTITION BY RANGE (time_id) ( PARTITION sales_q3_2012 VALUES LESS THAN (TO_DATE('01-OCT-2012','dd-MONyyyy')), PARTITION sales_q4_2012 VALUES LESS THAN (TO_DATE('01-JAN-2013','dd-MONyyyy')) ) ILM ADD POLICY COMPRESS FOR ARCHIVE HIGH SEGMENT
AFTER 12 MONTHS OF NO ACCESS;

Automatic Data Optimization (ADO)

ALTER TABLE sales MODIFY PARTITION sales_q1_2002 ILM ADD POLICY ROW STORE COMPRESS ADVANCED ROW AFTER 30 DAYS OF NO MODIFICATION;

ALTER TABLE sales MODIFY PARTITION sales_q1_2001 ILM ADD POLICY COMPRESS FOR ARCHIVE HIGH SEGMENT AFTER 6 MONTHS OF NO MODIFICATION;

ALTER TABLE sales MODIFY PARTITION sales_q1_2000 ILM ADD POLICY COMPRESS FOR ARCHIVE HIGH SEGMENT AFTER 12 MONTHS OF NO ACCESS;

SELECT SUBSTR(policy_name,1,24) POLICY_NAME, policy_type, enabled FROM USER_ILMPOLICIES;

POLICY_NAME

POLICY_TYPE ENABLE

------------------------ ------------- ------

P1

DATA MOVEMENT YES

P2

DATA MOVEMENT YES

P3

DATA MOVEMENT YES

P4

DATA MOVEMENT YES

P5

DATA MOVEMENT YES

Automatic Data Optimization (ADO)

ADO TIER  ALTER TABLE sales_ado ILM ADD POLICY TIER TO my_low_cost_tablespace;



ILM SQL> select * from dba_ilmparameters;

NAME ------------------------- ---------ENABLED RETENTION TIME JOB LIMIT EXECUTION MODE EXECUTION INTERVAL TBS PERCENT USED TBS PERCENT FREE POLICY TIME

VALUE
1 30 2 2 15 85 25 0

8 rows selected.



......

 


 


ADDM STA

 
IO

AWR

 

 
 SQL 




    (4KB) (4KB) IOPS(4KB) IOPS(4KB) 

800GB MLC

1.2TB MLC

1.6TB MLC

1.4GB/s

2.0GB/s

2.6GB/s

1.2GB/s

1.8GB/s

1.8GB/s

67us

67us

67us

9us

9us

9us

300,000

450,000

590,000

310,000

460,000

480,000

5(5DWPD) 3

3.2TB MLC 2.6GB/s 1.9GB/s 67us 9us 590,000 480,000

6.4TB MLC 2.6GB/s 1.9GB/s 67us 9us 590,000 480,000

PCIe

Active Database

Standby Database

OracleMysqlPostgreSQL......

Data Guard Primary

Data Guard Standby



PCIe-RAID

PCIe-RAID
­ 2U , 6PCI-E ,  HP DL380 Gen950TB , 40TB
­ 3U , 11PCI-E ,  Supermicro Gen X9DRX+-F90TB , 80TB
- 4U 9PCI-E HP DL580 Gen875TB 50TB



Stier
PCI--E 
  SAS


 



 





Oracle

z3 ­ SQL

zData ­  BayMax

 

