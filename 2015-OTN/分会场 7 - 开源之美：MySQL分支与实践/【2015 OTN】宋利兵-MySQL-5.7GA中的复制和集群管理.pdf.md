 .Z42-("

Safe  Harbor  Statement
The  following i  s  intended t  o  outline o  ur  general  product d  irection. I  t  is  intended f  or   information p  urposes  only,  and  may  not  be  incorporated i  nto a  ny  contract.  It  is  not  a   commitment t  o  deliver a  ny  material,  code,  or  functionality, a  nd  should n  ot b  e  relied u  pon   in  making  purchasing d  ecisions.  The d  evelopment, r  elease,  and  timing o  f  any  features  or   functionality d  escribed  for  Oracle's  products  remains  at  the  sole  discretion o  f  Oracle.

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

2



1 MySQL   2 MySQL  5.7  GA 3 Group  ReplicationMySQL 4 

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

3

1 MySQL  

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

:  

Client

Insert...

Dump thread

binary  log

Insert...

A

Network

IO thread

SQL Threads

relay  log
Insert...
B

binary  log
Insert...

Receiver Meta--data
Update

Applier Meta--data
Update

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

5

:  

Client

Insert...

Sender thread

Receiver thread

Applier Threads

binary  log

relay  log

Insert...

Insert...

A

Network

B

binary  log
Insert...

Receiver Meta--data
Update

Applier Meta--data
Update

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

6

:  
· Binary  Log
­ Master. ­ (Statement  Format)(Row  Format)(Mixed). ­ Binlog Events. ­ Control e  vents:  Rotate,  Format  Description, G  tid,  ...

GTID BEGIN E1 E2 ... COMMIT ... GTID BEGIN E1 E2 ... COMMIT

Layout  of  a   Binary  Log  File

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

7

:  ?
(Read  scale--out)

M
write  clients

S
read  clients

More

reads?

M

More

slaves!

write  clients

S S S
read  clients

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

8

 (write scale--out)?

M
write  clients

More writes? More Masters?

M? M? M?
write  clients

MySQL  Fabric MySQL...

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

9

:  ?
(Redundancy):  ,  

B

B

B

A

Uh  Oh!

CraAsh

Whew!

A

C

C

C

B  is  the new  master

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

10

:  ?
(On--line  Backup  and  Reporting)

M
write  clients

S

BI  

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

11

:  ?

AC

AB

CB

Image  from www.ginkgomaps.com

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

12

2 MySQL  5.7  GA

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

20151026MySQL 5  .7.9 GA
· 40  replication  worklogs
­ 29   ­ 11  MySQL  Group R  eplication.
· 8MySQLpatchMySQL  5.7. · 19 · 14

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

14

2 MySQL  5.7  GA
2.1 GTID   2.2 (Multi--Threaded  Slave) 2.3 (Multiple  Source R  eplication) 2.4 Slave   2.5 Master    2.6 (Semi--synchronous R  eplication) 2.7 

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

2 MySQL  5.7  GA
2.1 GTID   2.2 (Multi--Threaded  Slave) 2.3 (Multiple  Source R  eplication) 2.4 Slave   2.5 Master    2.6 (Semi--synchronous R  eplication) 2.7 

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

GTID

Client

Insert...

Sender thread

Receiver thread

Applier Threads

binary  log

relay  log

Insert...

Insert...

A

Network

B

binary  log
Insert...

Receiver Meta--data
Update

Applier Meta--data
Update

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

17

GTID
· 
­ GTID.
· MySQL. · .
­ GTID.

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

18

GTID
· :
1) SET  @@GLOBAL.GTID_MODE  =  OFF_PERMISSIVE;  () 2) SET  @@GLOBAL.GTID_MODE  =  ON_PERMISSIVE; () 3) ,  binlog events 4) SET  @@GLOBAL.GTID_MODE  =  ON;  ()
· :  http://dev.mysql.com/doc/refman/5.7/en/replication-- mode--change--online--enable--gtids.html

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

19

GTID

Client

Insert...

Sender thread

Receiver thread

Applier Threads

binary  log

relay  log

Insert...

Insert...

A

Network

B

Receiver Meta--data
Update

Applier Meta--data
Update

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

20

GTID

· Slaves  binlogGTID
­ Slavemaser,  binlog.    GTIDAUTO_POSITION

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

21

GTID


· mysqlgtid_executed
CREATE TABLE gtid_executed( source_uuid CHAR(36) NOT NULL, interval_start BIGINT NOT NULL, interval_end BIGINT NOT NULL, PRIMARY KEY(source_uuid, interval_start)
);

· GTID 

· 
­ :  gtid_executed_compression_period.
mysql> SET GLOBAL gtid_executed_compression_period= N;(N ­ )

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

22

GTID

· binlog
­ GTIDbinlog. ­ binlogbinloggtid ­ 
· binlog
­ GTID
· crash--safe.

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

23

GTID
MySQL  OK  GTID

Header

Affected  rows
...
... GTID  SET
...

Last I  nsert  ID

CLIENT_SESSION_TRACK

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

24

GTID
OKGTID
· session_track_gtids
-- OFF -- OWN_GTID
GTID -- ALL_GTIDS

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

25

GTID
· WATI_FOR_EXECUTED_GTID_SET(gtid_set[,  timeout])

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

26

2 MySQL  5.7  GA
2.1 GTID   2.2 (Multi--Threaded  Slave) 2.3 (Multiple  Source R  eplication) 2.4 Slave   2.5 Master    2.6 (Semi--synchronous R  eplication) 2.7 

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  



Client

Insert...

Sender thread

Receiver thread

Applier Threads

binary  log

relay  log

Insert...

Insert...

A

Network

B

binary  log
Insert...

Receiver Meta--data
Update

Applier Meta--data
Update

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

28



250%

Fast and Scalable Multi-threaded Replication Applier

Slave apply time (Sysbench RW on the master with 96 threads = 100%)

200% 150%

10X

100%

50%

0% Single Threaded Apply

8 Threads Applier

24 Threads Applier

48 Threads Applier

(statement-based replication, durable settings, SSD storage)

96 Threads Applier

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

29



· 



 T1

Slave.

T2
· COMMIT



T3

· prepare 

Master Time

T1 T2 T2T3, T3T1.
Slave T1T2, T3T1
.

· Master (Logical  clock) Gtid_log_event

Execution Commit

 Commit  

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

30


· (statement  format)(row  format)binlog. · :
mysql> S  ET s  lave_parallel_type=  [logical_clock|database]  
­ logical_clock --  ­ database -- (MySQL--5.6)
· Slave.

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

31

masterCommit
· MasterCOMMIT ,  Slave
· 
binlog_group_commit_sync_delay Binlog sync   Binlog_group_commit_sync_no_delay_count 

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

32

""
· Multi--threaded  applier   slave--transaction--retries
­ Applier  
· 
· Multi--threaded  applier   master
­ Slave_preserve_commit_order
· ON · OFF
­ Logical_clock

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

33

2 MySQL  5.7  GA
2.1 GTID   2.2 (Multi--Threaded  Slave) 2.3 (Multiple  Source R  eplication) 2.4 Slave   2.5 Master    2.6 (Semi--synchronous R  eplication) 2.7 

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  



M

M

M

M

Slave  

:

· ;

S

· ;

· 

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

35


· Default  Channel
A Master  1

Receiver thread

Applier Threads

Default  Channel   Insert... Network ""
B relay  log

Master  info Relay i  nfo

binary  log
Insert...
Slave

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

36


· Named  Channel
A Master  1
C Master  2

Receiver thread

Applier Threads

Named C  hannel Insert... Networ"kChannel_1"
relay  log
Master  info Relay i  nfo B

binary  log
Insert...

Named C  hannel Insert... Networ"kChannel_2"
relay  log

Slave

Master  info Relay i  nfo

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

37


· channels(channel:  receiver  thread,  relay  logs,  applier  threads)  , channel
· P_S
­ channel_namechannel
· replication_applier_status_by_coordinator · replication_applier_status_by_worker · replication_connection_status

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

38

2 MySQL  5.7  GA
2.1 GTID   2.2 (Multi--Threaded  Slave) 2.3 (Multiple  Source R  eplication) 2.4 Slave   2.5 Master    2.6 (Semi--synchronous R  eplication) 2.7 

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

Receiver/Applier

Client

Insert...

Sender thread

Receiver thread

Applier Threads

binary  log

relay  log

Insert...

Insert...

A

Network

B

binary  log
Insert...

Receiver Meta--data
Update

Applier Meta--data
Update

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

40

Receiver/Applier
A   Bapplier t  hreads.

B

B

B Master
B

A

Uh  Oh!

CraAsh

Whew!

A

C

C

C

DBA  Crelay  log

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

41

Receiver/Applier
· MasterApplier:
mysql> STOP SLAVE IO_THREAD; mysql> CHANGE MASTER TO MASTER_HOST='master2', ...; mysql> START SLAVE IO_THREAD;
· applierreceiver:
mysql> STOP SLAVE SQL_THREAD; mysql> CHANGE MASTER TO MASTER_DELAY=3600, ...; mysql> START SLAVE SQL_THREAD;

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

42

Replication  Filter

Client

Insert...

Sender thread

Receiver thread

Applier Threads

binary  log

relay  log

Insert...

Insert...

A

Network

B

binary  log
Insert...

Receiver Meta--data
Update

Applier Meta--data
Update

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

43

Replication  Filter
· Replication  Filters
­ MySQL  server ­ Filter ­ 
mysql> CHANGE REPLICATION FILTER REPLICATE_DO_DB= (db1, db2)

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

44



Client

Insert...

Sender thread

Receiver thread

Applier Threads

binary  log

relay  log

Insert...

Insert...

A

Network

B

DBA
binary  log
Insert...

Receiver Meta--data
Update

Applier Meta--data
Update

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

45


ReplicationPerformance S  chema  
· SQL ·  ·  ·  · Master--slave,  Multi--source,  Group  Replication.  

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

46


(Slave)  Receiver  and  Applier  Status

Connection   Configuration

Connection   Status

Applier   Configuration

Applier Status

Applier  /  Coordinator Status

Workers Status

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

47


mysql> select * from performance_schema.replication_applier_status_by_worker\G *************************** 1. row ***************************
CHANNEL_NAME: WORKER_ID: 1 THREAD_ID: 35
SERVICE_STATE: ON LAST_SEEN_TRANSACTION: 4ba0eb86-63c3-11e4-92ba-28b2bd168d07:2368
LAST_ERROR_NUMBER: 0 LAST_ERROR_MESSAGE: LAST_ERROR_TIMESTAMP: 0000-00-00 00:00:00 *************************** 2. row ***************************
CHANNEL_NAME: WORKER_ID: 2 THREAD_ID: 36
SERVICE_STATE: ON LAST_SEEN_TRANSACTION: 4ba0eb86-63c3-11e4-92ba-28b2bd168d07:2367
LAST_ERROR_NUMBER: 0 LAST_ERROR_MESSAGE: LAST_ERROR_TIMESTAMP: 0000-00-00 00:00:00 2 rows in set (0,00 sec)

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

48

2 MySQL  5.7  GA
2.1 GTID   2.2 (Multi--Threaded  Slave) 2.3 (Multiple  Source R  eplication) 2.4 Slave   2.5 Master    2.6 (Semi--synchronous R  eplication) 2.7 

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

binlog

Client

Insert...

Sender thread

Receiver thread

Applier Threads

binary  log

relay  log

Insert...

Insert...

A

Network

B

binary  log
Insert...

Receiver Meta--data
Update

Applier Meta--data
Update

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

50

binlog
· sender  binlog,binlog.
­ Senderbinlog ­ Sender

pre  5.7.2 5.7.2+

Sender Thread Reads Binary Log
Sender Thread Reads Binary Log User Thread Writes to Binary Log

User Thread Writes to Binary Log

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

51

SenderEvent

Client

Insert...

Sender thread

Receiver thread

Applier Threads

binary  log

relay  log

Insert...

Insert...

A

Network

B

binary  log
Insert...

Receiver Meta--data
Update

Applier Meta--data
Update

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

52

SenderEvent
·  · Binlog Event · Event ·  · :
­ sender ­ CPU ­ master

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

53

Master

QpS

16000 14000 12000 10000
8000 6000 4000 2000
0 0

Master's   Throughput

1

5

10

20

30

40

50 100

Number  of  Connected     Sender   Threads

MySQL  5.6.16

MySQL  5.7.4

· mysqlslap · 1M  ,  =200,   · N  sender(mysqlbinlog) · 48  cores  HT  /  512  GB  RAM  /  HDD

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

54

2 MySQL  5.7  GA
2.1 GTID   2.2 (Multi--Threaded  Slave) 2.3 (Multiple  Source R  eplication) 2.4 Slave   2.5 Master    2.6 (Semi--synchronous R  eplication) 2.7 

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  



Client

Insert...

Sender thread

Receiver thread

Applier Threads

binary  log

relay  log

Insert...

Insert...

A

Network

B

binary  log
Insert...

Receiver Meta--data
Update

Applier Meta--data
Update

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

56



T1:  INSERT  INTO  t1  VALUES  (1000)

T2:  SELECT  *  FROM  t1;

empty set

Master Slave

execute prepare

binlog

execute

commit

ACK
relay  log

Time

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

57


· Master  slaveCommit(5.6Mastercommit Slave).
­ Slave.
· Master,Slave. · 5.6

mysql> S  ET r  pl_semi_sync_master_wait_point= [  AFTER_SYNC|AFTER_COMMIT]

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

58

­ ACK

Client

Insert...

ACK Receiver thread

Receiver thread

Applier Threads

binary  log

relay  log

Insert...

Insert...

A

Network

B

binary  log
Insert...

Sender thread

Receiver Meta--data
Update

Applier Meta--data
Update

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

59

­ ACK

·  Events

Sender

Send   Trx

Receive Report Send  

ACK ACK

Trx

Receive Report ACK ACK

Receiver

Receive Send

Trx

ACK

MySQL--5.6

Receive Trx

Send ACK

Time

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

60

­ ACK
·  · 

ACK Receiver
Sender

Send   Trx

Receive Report ACK ACK

Send   Trx

Send   Trx

Receive Report ACK ACK

Receiver

ACK

Receive Send

Trx

ACK

Receive Send

Trx

ACK

MySQL--5.7  

ACK

Time

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

61

­ ACK
· 
mysql> S  ET G  LOBAL  rpl_semi_sync_master_enabled= O  N
· 
mysql> S  ET G  LOBAL  rpl_semi_sync_master_enabled= O  FF

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

62

:  

(sync_binlog=1). (sync_binlog=0).

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

63

­ Slave

Client

Insert...

Sender thread

Receiver thread

Applier Threads

binary  log

relay  log

Insert...

Insert...

A

Network

B

binary  log
Insert...

Receiver Meta--data
Update

Applier Meta--data
Update

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

64

­ Slave
· Master  Nslavecommit . · Slave:
mysql> SET GLOBAL rpl_semi_sync_master_wait_for_slave_count= N

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

65

­ Slave
· Master  Nslavecommit . · Slave:
mysql> SET GLOBAL rpl_semi_sync_master_wait_for_slave_count= N

Master Slave  1 Slave  2 Slave  3

T1:  Binlog

T1:  COMMIT succeeds

ACK relay  log
relay  log
relay  log

ACK ACK

Time

mysql> S  ET  GLOBAL  rpl_semi_sync_master_wait_for_slave_count= 2 

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

66

2 MySQL  5.7  GA
2.1 GTID   2.2 (Multi--Threaded  Slave) 2.3 (Multiple  Source R  eplication) 2.4 Slave   2.5 Master    2.6 (Semi--synchronous R  eplication) 2.7 

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

Binlog XA

· XA  transaction  2

­ Prepare  
XA  PREPARE  XA  START+DML+XA  PREPARE
­ Commit  
`XA  COMMIT'  

· GTID · 
XA  START  `xa trx1'; INSERT  INTO  t1  VALUES(1); XA  END  `xa trx1';

master--bin.000001   master--bin.000001   master--bin.000001   master--bin.000001   master--bin.000001  

316   Gtid 1   381   SET  @@SESSION.GTID_NEXT= `  a_uuid:2' 381   Query   1   481   XA  START    X'736c6231',X'',1 481   Query   1   579   use `  test`;    INSERT I  NTO  t1  VALUES(1) 579   Query   1   670   XA  END  X'736c6231',X'',1 670   XA_prepare 1   710   XA    PREPARE   X'736c6231',X'',1

XA  PREPARE  `xa trx1'; · XA  COMMIT  `xa trx1';

master--bin.000001   710   Gtid 1   775   SET @  @SESSION.GTID_NEXT= `  a_uuid:3' master--bin.000001   775   Query   1   869   XA  COMMIT  X'736c6231',X'',1  

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

68

""
· binlog_format=ROWsync_binlog=1. · mysqlbinlogSSL. · mysqlbinlog Rewrite D  B .

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

69

3 Group  ReplicationMySQL

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

MySQL  Group  Replication

APP  

Write Write

Write

M

M

M

·  · Shared--nothing state  machine  replication. · master · fail--over · 
­   ­ 

Replication  Group

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

71

MySQL  Group  Replication  

APP  

Write Write

Write

M

M

M

Group   Replication

· MySQL plugin
· row f  ormat   InnoDB
­ PK
· GTID · performance  schema  .
· MySQL--5.7.9XComcorosync
­  ­ Linux,  Solaris,  FreeBSD,  OSX  and  
Windows

Replication  Group

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

72

MySQL  Router NEW

GA

· Connection · (read--only)(read--write)

App connectors

· (fail--over)
· APP
­ connectors. ­ connector

MySQL   Router
Virtual  MySQL S  erver

· 

M

M

M

· 

Group   Replication

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

73

MySQL

MySQL  Fabric  (Orchestration)

App connectors

MySQL   Router

Route   Rules, Server State.

Virtual  MySQL S  erver

M S1 S2

Shard  Mapping,   Route  Rules, Server  State a  nd   Extra m  etadata.

App
Connectors     +
Fabric

Virtual  MySQL S  erver Shard1

M

M

M

Shard2

M

M

M

Group   Replication

Group   Replication

Control,   Coordinate,  Provision

Control,   Coordinate,  Provision

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

74

4 

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  


· MySQL  Group  Replication
­ . ­ .
· MySQL  Replication  
­ Replication P_S   ­ (on--line).
· Replication  
­ . ­ .
· (Fabric)MySQL  Router

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

76

Focus

Performance
Multi-threaded Applier

Address Contention Points

MySQL

High  Availability

Group Replication

Leverage Consensus

Recoverability

HPC optimizations

MySQL

Automation of Fail-over and crash recovery

Further P_S Instrumentation
Configurability
Ease  of  Use

Replication
MySQL Fabric

MySQL Router Integration

More Modularization Pluggability

Simplify UI

Integration

GTIDs

Integration Modernization
Of Replication

Interfaces

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

77


· 
­ http://dev.mysql.com ­ http://labs.mysql.com
· 
­ http://dev.mysql.com/doc/#manual
· (,  ,)
­ http://mysqlhighavailability.com

20151121

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    | MySQL  @  2015  Oracle  

78

 

 z3 ­ SQL



Oracle

zData ­ 

BayMax

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    |

 
Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rights  reserved.    |

