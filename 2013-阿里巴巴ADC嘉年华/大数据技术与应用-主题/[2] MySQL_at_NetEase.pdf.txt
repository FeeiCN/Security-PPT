MySQL at NetEase
 

MySQL at NetEase
· MySQL
­ MySQL 5.0.38 5.1.47 5.5.20 ­ MySQL 5.5
· 
­ master-slave replication ­ DDBdistribute database
· 
­  ­ 95%MySQL

NetEase MySQL Fork
· Why
­ quick bug fix ­ high performance ­ high availability ­ creativity & innovation

NetEase MySQL
· NetEase MySQL
­ InnoSQL ­ Based on MySQL 5.5 ­ open source
· Patch · Binary package

NetEase MySQL
· 
­ https://github.com/NetEase/innosql
· 
­ http://mysql.netease.com/doc/
· 
­  ­  ­  ­  ­ MySQL 5.5

Main Changes in InnoSQL
· InnoDB L2 Cache · InnoDB buffer pool fast warm up · Virtual sync replication · Slave batch commit · Role table · Resource Governor

InnoDB L2 Cache
· SSD flash cache · Support write back or write through · Storage engine level · Write IO on SSD is sequential · Workload
­ Read-intensive ­ Write-intensive

InnoDB L2 Cache

Facebook flash cache alike block-layer write-alloc random write a new device read-intensive workload

InnoDB L2 Cache storage engine layer write when swap from buffer pool sequential write using doublewrite as L2 cache also write-intensive workload

InnoDB L2 Cache
· L2 cache 
·  · L2 cachedoublewrite · 
cache · cachemove


InnoDB L2 Cache
· 
­  ­ read-intensive work load ­ 600G SAS => 120G SSD + 2T SATA

InnoDB L2 Cache

InnoDB L2 Cache
· TPC-C benchmark
­ http://www.mysqlperformanceblog.com/2012/10 /25/l2-cache-for-mysql/

InnoDB BP fast warm up
­ 
· 
­  ­ 
­ 
· SELECT index
­  ­ BP
­ MySQL 5.6
· dump & load BP LRU list

InnoDB BP fast warm up
· InnoSQL
­ Normalshare memory
· fastest
­ Abnormaldump & load BP LRU
· dump also LRU old info · better warm up than MySQL 5.6
­ transfer to dump info to slave (next version)
· for slave => master

Virtual Sync Replication
· Replication problem #1
­ slave not crash safe
· too many 1062 · statement-based binary log
­ update xxx set k=k+1 where ooo=???
­ lose data
· even semi-replication

Virtual Sync Replication
· relay binlog not atomic
­ relay binlog (database) ­ update relay-log.info (file)
· write to os cache · sync_relay_log_info=1
­ poor performance without BBU

Virtual Sync Replication
· MySQL 5.6
­ store relay-info in table (InnoDB) ­ atomic
BEGIN; APPLY binlog; UPDATE slave_relay_log_info SET exec_master_log_pos=xxx, ... COMMIT;

Virtual Sync Replication
· semi-replication
 commit transaction  transfer binlog to slave  wait for slave ACK
· data inconsistency where crash at step 2 or 3

Virtual Sync Replication
· mainly for two node HA · master commit after slave receive binary log
­ change to async mode when timeout
· no data lose when master crashed
­ using transaction-safe table
· ease of use and understanding
­ compare Galera Cluster ­ based on semi-replication

Virtual sync replication
· mainly for two node HA · virtual sync replication
 InnoDB generate prepare redo log  write binlog at master  transfer binlog to slave  wait slave ACK  InnoDB commit
· master commit after slave receive binary log
­ change to async mode when timeout
· no data lose when master crashed
­ using transaction-safe table

Virtual Sync Replication
· if master alive and change as slave
­ data can ben inconsistent when crash at step 3
· now should be handled by scripts
­ truncate redundant binlog at master that slave does not receive
­ also need handle partial binlog event at slave
· will be addressed this issue at internal MySQL (next version)

Virtual sync replication

Sysbench Update

5000

4500 4000

3500 3000 2500

2000 1500

1000 500

0

sync

async

Virtual sync replication
· Original VSR performance decrease
­ 40% ~ 50% for sysbench full update benchmark ­ 15% ~ 20% for sysbench OLTP benchmark

Virtual sync replication
· VSR with group commit · Merge MariaDB's work · Recover need recover group binlog
­ new binlog event

Virtual sync replication

4500.00 4000.00

Sysbench Update
4224.75

4218.44

3500.00

3000.00

2500.00 2000.00

2225.84

1500.00
1000.00 almost equal to vanilla MySQL (async) replication's performance !!! However, with no data lost !!!
500.00

0.00 sync

sync_gc

vanilla_async

slave batch commit
· Replication problem #2
­ single slave SQL thread ­ result in lag between master and slave
· can be hours, even days

slave batch commit
· pre-fetch · convert DML to SELECT
­ warm up by multi thread
· tools
­ mk-slave-prefetch ­ replication-booster-for-mysql ­ all for statement-based binlog ­ not workable for insert SQLs

slave batch commit
· parallel replication based on schema
­ MySQL 5.6 ­ Tungsten Replicator ­ still single thread for one-schema database

slave batch commit
· parallel replication based on row_id
­ Taobao ­ MariaDB ­ Row-based binlog
· Blob too big
­ Every table must have an explicit PK

slave batch commit
· InnoSQL's batch commit
­ apply binlog with one transaction
· advantage
­ reduce redo log fsync a lot ­ work for all kinds of binlog format ­ can work for insert SQLs ­ a more general solution
· disadvantage
­ still single thread

slave batch commit
BEGIN; APPLY binlog; UPDATE slave_relay_log_info SET exec_master_log_pos=xxx, ...; APPLY binlog; UPDATE slave_relay_log_info SET exec_master_log_pos=xxx, ...; ...... COMMIT;

slave batch commit

Resource Governor
· Control resource:
­ IO ­ CPU ­ row count
· mainly for cloud service
­ multi tenancy

Resource Governor
· Proxy vs RG
­ Performance
· Overhead for Proxy
­ SQL
· RG support all kinds of SQL
­ Resource Control
· RG more dynamic
­ CPUIOrow_count

Resource Governor
· Oracle Profiler
­ Rollback ­ Only for InnoDB
· Microsoft SQL Server Resource Governor
­ InnoSQL use this design ­ Storage engine handler ­ Support all kinds of engine

Resource Governor

Q&A

