 SQL


·  · Oracle ACE · OracleSQL

OracleSQL
· OracleSQLCBO  · OracleSQL · OracleSQL

OracleSQL
· Oracle5%SQL CBO    · 5%SQL Oracleinternal 

1
· Q Qupdate   

1

1

1

1

1
8gw014haf2521 update CTR set CTR_DATA = :1 , INDEX_DATA = :2 where
PNRC_KEY = :3 and PNRC_D_FLAG = 0
84mcxjysr42h0 update CTR set CTR_DATA = :1 , INDEX_DATA = :2 WHERE
PNRB_KEY = :3 and PNRB_D_FLAG = 0
3bhthkj44gruf update CTR set CTR_DATA = :1 , INDEX_DATA = :2 where
PNRB_KEY = :3 and PNRB_D_FLAG = 0

1

1

1

1--3964 byte

1--LOBUNDO

1-Lob enq HW
· Frequent allocation of chunks · Reclaiming chunks · Poor I/O performance

1-enq HW 
Lobchunk chunkenq HW enq HWenq HW Lob 

1MOS-
1. In ASSM, we always attempt to reclaim space if there is space available according to our retention parameters (PCTVERSION or RETENTION).
We do this before we check the bitmaps for free space. However, on this initial reclaim check, the HWM enqueue is gotten with NOWAIT. This means that if another process is attempting to reclaim, we will simply go straight to the bitmaps for space.

1MOS-
2. If we check the bitmaps, and there are no blocks that are free in them, then we attempt to reclaim using first our freelist, and then other instances freelists. In both cases, we get the HWM enqueue with WAIT specified.
3. In ASSM, we always attempt to reclaim only what the process that is reclaiming needs. If the process is asking for 1 chunk, then we only reclaim 1 chunk. So, if there are 100 processes attempting to allocate 1 chunk, and there is no space in the bitmaps marked as free, all 100 processes will wait in line on the HWM enqueue to allocate 1 chunk.

1MOS-
4. In MSSM, we always attempt to reclaim up to 128 chunks per attempt at reclaim. This is regardless of the number of chunks needed. This has the effect of not forcing all of the processes attempting to allocate space to wait for the HWM enqueue since after the first process finishes reclaiming, any other processes coming in will simply get the space from the bitmaps, and the processes that did wait, will reclaim up to 128 chunks too. Thus alleviating the situation even further.

1MOS
MOSLOB HWM CONTENTION :Using AWR Reports to Identify the Problem; Confirm and Verify the Fix (Doc ID 837883.1)  EVENT="44951 TRACE NAME CONTEXT FOREVER, LEVEL 1024"


1
onlineCTRHash 128
Reference:
1Examples For Creating Partitioned table With Different Partitioning Strategies (Doc ID 733311.1)
2How To Partition Existing Table Using DBMS_Redefinition (Doc ID 472449.1)


2
· hang update 1000 1000 

2

2

2

2

2

2
·  gc buffer busy  27 

2-Oracle

2-ASSM

2-ASSM

2-Oracle 
· deleteoracle full() 75%-100% free

2-Oracle commit
· commit   I/Ocommit commit commit

2-Oracleupdate 
· oracleupdate oracle lock bytedelete oracledelete 0x10 oracleupdatedelete insert row directory

2-Oracle

2
· deleteoracle full75%100% freeupdate ITL   deleted 20deleted Oracle 

2
· pctfree update   gc buffer busyupdate 

2
· pctfree update   ->->  update  gc buffer busy

2
·  ----pctfree    gc buffer busy update hang

2
TABLE1delete     

 


ORA



Oracle

z3 ­ SQL

zData ­ 

BayMax

 

