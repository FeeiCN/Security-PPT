InnoDB //
-


· 
· 
­ TNT/
· 
­ he.dengcheng@gmail.com ­ _ ­ http://hedengcheng.com/

InnoDB
· 
­ OS ­ ­  ­  ­ / ­ 
· ///Extent/Segment/Tablespace/File
­ Buffer Pool ­ Handler ­ ...


· InnoDB
­ / ­ XA/Group Commit ­ mini-transaction
· InnoDB
­ // ­ / ­ (autoinc lock) ­ (semi-consistent read) ­ (implicit lock)
· InnoDB
­ ReadView ­ / ­  ­ Index Only Scan ­ RC vs RR ­ Purge
· InnoDB//

InnoDB//

InnoDB-

InnoDB-(cont.)

· trx_sys()

­ mutex

critical section//

­ max_trx_id



256

­ trx_list



­ view_list

ReadView

· trx_struct()

­ id/no

/

· idnotrx_sysmax_trx_id

­ xid

XA

­ (global)read_view: ReadView

­ trx_locks

lock(//Autoinc)

­ wait_lock

lock

InnoDB-
· 
­ ReadViewRC/RR(MVCC)
· 
­ / ­ 
· I/U/D
­  ­ undo/redo
· 
­ commit
· 
· 
­ rollback
· 

InnoDB-XA
· Why XA
­ InnoDB redo logMySQL binlog ­ backup
· XA Commit
­ InnoDB prepare -> Binlog commit -> InnoDB commit
­ Binlog
­ Transaction Coordinator
­ 
­ MySQL sync_binlog ­ InnoDBinnodb_flush_log_at_trx_commit
· Group Commit
­ MariaDB/Percona 5.5.19-rel24/MySQL 5.6

InnoDB-mini-transaction
· mini-transaction()
­ 
· mini-transactionInnoDB
· InnoDBpage(I/U/D/S)mini-transaction
­ 
· pagepagelatch (S latchX latch)
· pageredo (mtr)
· pagemini-transaction ()
­ redolog buffer ­ Flush List ­  S/X latch
­ 
· mini-transactionpage(/page) · mini-transactionpages(SMO/pages)

InnoDB//
· InnoDB
­ / ­ XA ­ mini-transaction
· InnoDB
­ // ­ / ­  ­  ­ 
· InnoDB
­ ReadView ­ / ­  ­ Index Only Scan ­ RC vs RR ­ Purge
· InnoDB//

InnoDB-
· (Lock/Latch/Mutex)
­ 
· 
­ 
· Lock ()
­ / ­  ­ /
· Latch ()
­ / ­  ­ Latch page/(pin)
· Mutex ()
­ (CAS, TAS);  ­  ­ critical section()

InnoDB-

InnoDB-(cont.)

· lock_sys(Rec lock hash)
­ InnoDBhash ­ hash[space, page_no]hash bucket
­ 

· lock_struct

­ trx_locks



­ type_mode 

· 

­ hash

hash

­ index



­ rec_lock/tab_lock: /

InnoDB-(cont.)
· lock_rec_struct
­ InnoDB
­ InnoDB
n_bits = page_dir_get_n_heap(page) + LOCK_PAGE_BITMAP_MARGIN; n_bytes = 1 + n_bits / 8; lock = mem_heap_alloc(trx->lock_heap, sizeof(lock_t) + n_bytes);
­ n_bytesbitmap
· bitmappageheap_no() · bitmap=1heap_no

InnoDB-
· 
­ 
·  Index Page ( & )
­ 
· pageheap_no
­ heap_no
· page · heap_no · heap_noslot_no · heap_no
­ ()
· bitmap 136 bits1 heap_no 136

InnoDB-
· Oracle
InnoDBOracle1 bit InnoDBPage1 bit Page400Page 102 bytes
: 102 bytes/ 400: 102 bytes/400 = 2 bits/
· 
­ () ­ 

InnoDB-
· 
­  ­ LOCK_IS, LOCK_S, LOCK_IX, LOCK_X
­ LOCK_IS, LOCK_IX
·  ·  
­ 

InnoDB-(cont.)
· 
­ GAP
­ LOCK_ORDINARY
· next key()Gap
­ LOCK_GAP
· GapGap
­ LOCK_NOT_GAP
· GapGap
­ LOCK_INSERT_INTENSION
· InsertInsertGap insert_intensionGap
­ LOCK_WAIT
· 

InnoDB-(cont.)
· (cont.)
­ 

InnoDB-
· Repeatable Read

InnoDB-(cont.)
· Read Committed

InnoDB-
· Repeatable Read
· Access Index ­ [r4,r6,r1,r5]Next Key(LOCK_ORDINARY) ­ [r3]
·  -> GAP ·  -> Next Key
­ GAP[g1-g5]Insert ­ [r4,r6,r1,r5,(r3)] · Cluster Index ­ [R1, R4, R5, R6, (R3)](NO_GAP)

InnoDB-(cont.)
· Read Committed
· Access Index
­ [r4,r6,r1,r5](NO_GAP) ­ [r3]
·  ->  ·  -> 
­ GAP
· Cluster Index
­ [R1, R4, R5, R6, (R3)]

· /

InnoDB-

­ Hash Bucket 2 ­ T1T2T3 ->  ­ T1T2T3 -> 

InnoDB-
· 
­ 
­ 
­ Wait-For-Graph (WFG)
­  ()
· ()
­ kernel_mutex
· MySQLlock_sys->mutex
­ 
· undo + 

InnoDB-//
· 
­  -> 
· 
­  -> 
· 
­ 
· Gap
­ 
· Gap

InnoDB-Autoinc

· (Autoinc Lock)
­ 
· insert+statement binlogmaster-slave

­ 

· mutex

Insert/replace

· Autoinc_lock insert into select * from 

­ 
· innodb_autoinc_lock_mode
­ 012

InnoDB-
· Semi-Consistent Read()
­ 
· 
­ 
·  · 
­ 
· Read Committed · innodb_locks_unsafe_for_binlog

InnoDB-
· Implict Lock()
­ 
· Insert · ()
­ 
· Insert(Implict lock) · scan()Implicit lockExplicit lock · 
­ Implicit Lock
· 
­ trx_id (trx_id)
· 
­ max_trx_id +  (max_trx_id) ­ bug

InnoDB//
· InnoDB
­ / ­ XA ­ mini-transaction
· InnoDB
­ // ­ / ­  ­  ­ 
· InnoDB
­ ReadView ­ / ­  ­ Index Only Scan ­ RC vs RR ­ Purge
· InnoDB//

InnoDB
· InnoDB
 ()(RC)/(RR) 
­ 
·  · lock free · (RC)
­ ReadView
· (RR)
­ ReadView
­ 
· Insert/Update · Delete/Update

InnoDB-ReadView
· ReadView
ReadViewReadView (/)

InnoDB-ReadView(cont.)
· read_view_struct
­ low_limit_no
· (trx->no < low_limit_no)purge · low_limit_no = trx_sys->max_trx_id
­ low_limit_id
· >= (trx->id >= low_limit_id)ReadView · low_limit_id = trx_sys->max_trx_id
­ up_limit_id
· < (trx->id < up_limit_id)ReadView · up_limit_id = ReadViewID
­ trx_ids[]
· id
· ReadView
­ kernel_mutex
· trx_systrx_listReadView
­ Read Committed
· ReadView
­ Repeatable Read
· ReadView

InnoDB-ReadView(cont.)
· ReadView
· RC VS RR

InnoDB-
· 
­ DB_TRX_ID
· ID
­ DB_ROLL_PTR
· 
­ Delete_Bit()
· 
­ Delete_Bit ­ DB_MAX_ID
· ID

InnoDB-
· 
­ /
· 
create table test (id int primary key, comment char(50)) engine=innodb; create index test_idx on test(comment);
insert into test values (1, `aaa'); insert into test values (2, `bbb');

InnoDB-(cont.)
· 
update test set id = 9 where id = 1;
­  ­  ­ 

InnoDB-(cont.)
· 
update test set comment = `ccc' where id = 9;

InnoDB-(cont.)
· InnoDB
­ /in place update 
­ in place update ­ undoundo ­ Rollback Segment Undo Page ­ MAX_TRX_ID ­ undoundo page

InnoDB-

InnoDB-Cluster Index Scan
· 
­ 
·  · DB_TRX_ID
Implicit lock
­ 
·  · ReadView
­ Index Only Scan
· Index Only Scan

InnoDB-Sec Index Scan
· 
­ 
· (/) ·  · pageMAX_TRX_ID
Implicit lock
­ 
·  · 
­ 
­ Index Only Scan
· cont.

InnoDB-Sec Index Scan(cont.)
· Index Only Scan
­ 
· Index Only Scan
­  ­ 
­ 
· 
­ Index Only Scan
· 
­ pageMAX_TRX_ID -> Index Only Scan » 
­ MAX_TRX_ID -> Index Only Scan » 

InnoDB-
· MySQL Bugs 65745
UPDATE on InnoDB table enters recursion, eats all disk space
· 
· 
­ Halloween

InnoDB-Purge
· Purge
­ 
·  
­ 
· trx_sys ReadView read_viewpurge_read_view
· InnoDBRollback Segment 
· purge_read_view.low_limit_no > old_trx.no purge
· undo 
­ /
· innodb_max_purge_lag () · innodb_purge_threads (since MySQL 5.6.2)

InnoDB//
· InnoDB
­ / ­ XA ­ mini-transaction
· InnoDB
­ // ­ / ­  ­  ­ 
· InnoDB
­ ReadView ­ / ­  ­ Index Only Scan ­ RC vs RR ­ Purge
· InnoDB//

InnoDB//-
· RR vs RC
­ Read Committed
· 
­ semi-consistent read ­ no gap lockearly unlock
· 
­ statement binlog ­ ReadView
­ Repeatable Read
· 
­ gap lockstatement binlog ­ ReadView
· 
­  ­ semi-consistent readearly unlock

InnoDB//-(cont.)
· Commit
­ prepare
· redolog bufferlog fileflush
­ innodb_flush_log_at_trx_commit
­ commit
· undo pages
­ insert undo pages ­ trx->no () ­ update undo pageshistory listpurge
· 
­ 
· read_view
· redoflush
­ innodb_flush_log_at_trx_commit

InnoDB//-(cont.)
· Rollback
­ undo
· undoredo (undo)
­ commit
· undo pages
· 
· read_view
· redoflush

InnoDB//-
· Peter Zaitsev InnoDB Architecture and Internals · MySQL Manual InnoDB Startup Options and System Variables · Transactions on InnoDB Better scaling of read-only workloads · Dimitrik MySQL Performance: Read-Only Adventure in MySQL 5.6 · Marco Tusa Some fun around history list · MySQL Musings Binlog Log Group Commit in MySQL 5.6 · Kristian Nielsen Even faster group commit! · MySQL Bugs UPDATE on InnoDB table enters recursion, eats all disk space · sleebin9 MySQLInnoDB ·  InnoDB Crash Recovery & Rollback Segment ·  MySQLXA ·  MySQL InnoDB ·  InnoDB SMO-Row-Page-Extent-Lock-Latch ·  MySQL+InnoDB semi-consitent read ·  InnoDB ·  MariaDB & Percona XtraDB Group Commit ·  MVCC (Oracle, Innodb, Postgres) ·  MySQL Bug 65745

Q & A



