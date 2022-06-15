RDS  MySQL
 

 RDS  MySQL    

 RDS  MySQL

 RDS  MySQL

· LOGO

· 


RDS   MySQL

AliSQL

· 
(5.5,   5.6)  (PerconaMariaDB)

·  
WebScaleSQL patch  15+ bug  120+





· 

Select  update     Upsert  DDL  fast  fail

select  from    update  ... update    ...  non_affected_rows insert  into    values(...) select  max_statement_time=0   *  from  t alter  table  t  wait   5  add  col  int

· 

 




· Metrics
 SQL SQLIO SQL
· SQL





· InnoDB redo  group  commit

· grant  lockAHI  lock

· 

· Muti Redo  buffer

Sysbench For R  DS  MySQL

·...

 16

TPS 18600

RT(ms) 1.05

32

28500

1.40

64

38900

2.16

128

48300

3.68

256

53200

6.60

512

54500

13.00




· 

· 
Double  Binlog
· 

· 
IO


· 
· Proxy

Double  Binlog
· Binlog 


· 

· RDS  MySQL
MySQL  ser ver hint:   /*  commit_on_success rollback_on_fail queue_on_pk */
InnoDB  innodb_thread_concurrency:  

--
· TokuDB
 2TB+  400GB  >  5 
· column
column text/blob

IO--
· buffer  pool
select  /*  engine_no_cache */  count(*)   from  t1 buffer  pool  flooding
· IOPS
set  rds_sql_max_iops=100 SQLIOPS

