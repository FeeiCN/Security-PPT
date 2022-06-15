4QFBLFS
5JUMF3FBM8PSME5SPVCMF4IPPUJOH 


· Oracle · Oracle · Oracle · Oracle · Oracle · Oracle




·  · 
·  · 
·  · 



4

 - 
· 
· 10046 · 
SQL> alter session set events '10046 trace name context forever';
Session altered.
SQL> startup mount;
SQL> alter session set events '10046 trace name context forever, level 8';
Session altered. SQL> alter database open;
SQL> alter session set events '10046 trace name context off';
Sessio: nhttpa:/l/wtwewr.eeygdle..com/archives/2004/10/use_sql_trace_to_diagnose_database.html



5

 - 

· 
· TT
WAIT #2: nam='enq: TT - contention' ela= 488294 name|mode=1414791174 tablespace ID=0 operation=0 obj#=-1 tim=7239383713 WAIT #2: nam='enq: TT - contention' ela= 488294 name|mode=1414791174 tablespace ID=0 operation=0 obj#=-1 tim=7239872064 WAIT #2: nam='enq: TT - contention' ela= 488294 name|mode=1414791174 tablespace ID=0 operation=0 obj#=-1 tim=7240360396 WAIT #2: nam='enq: TT - contention' ela= 488292 name|mode=1414791174 tablespace ID=0 operation=0 obj#=-1 tim=7240848727 WAIT #2: nam='enq: TT - contention' ela= 488294 name|mode=1414791174 tablespace ID=0 operation=0 obj#=-1 tim=7241337055 WAIT #2: nam='enq: TT - contention' ela= 488294 name|mode=1414791174 tablespace ID=0 operation=0 obj#=-1 tim=7241825386 WAIT #2: nam='enq: TT - contention' ela= 488292 name|mode=1414791174 tablespace ID=0 operation=0 obj#=-1 tim=7242313711 WAIT #2: nam='enq: TT - contention' ela= 488294 name|mode=1414791174 tablespace ID=0 operation=0 obj#=-1 tim=7242802037 WAIT #2: nam='enq: TT - contention' ela= 488292 name|mode=1414791174 tablespace ID=0 operation=0 obj#=-1 tim=7243290373 WAIT #2: nam='enq: TT - contention' ela= 488295 name|mode=1414791174 tablespace ID=0 operation=0 obj#=-1 tim=7243778701 WAIT #2: nam='enq: TT - contention' ela= 488293 name|mode=1414791174 tablespace ID=0 operation=0 obj#=-1 tim=7244267032 WAIT #2: nam='enq: TT - contention' ela= 488294 name|mode=1414791174 tablespace ID=0 operation=0 obj#=-1 tim=7244755364



6

· 

TT  



7

V$LOCK_TYPE
· V$LOCK_TYPE



8

V$LOCK_TYPE
· TT 

SQL> exec print_table('select * from v$Lock_type where

type=''TT''');

TYPE

: TT

NAME

: Tablespace

ID1_TAG

: tablespace ID

ID2_TAG

: operation

IS_USER

: NO

DESCRIPTION

: Serializes DDL operations on tablespaces

----------------------



9


· Tom create or replace procedure print_table( p_query in varchar2 )

AUTHID CURRENT_USER

is

l_theCursor

integer default dbms_sql.open_cursor;

l_columnValue varchar2(4000);

l_status

integer;

l_descTbl

dbms_sql.desc_tab;

l_colCnt

number;

begin

execute immediate

'alter session set

nls_date_format=''dd-mon-yyyy hh24:mi:ss'' ';

dbms_sql.parse( l_theCursor, p_query, dbms_sql.native ); dbms_sql.describe_columns ( l_theCursor, l_colCnt, l_descTbl );

for i in 1 .. l_colCnt loop dbms_sql.define_column (l_theCursor, i, l_columnValue,
end loop;

4000);

l_status := dbms_sql.execute(l_theCursor);

while ( dbms_sql.fetch_rows(l_theCursor) > 0 ) loop for i in 1 .. l_colCnt loop dbms_sql.column_value ( l_theCursor, i, l_columnValue ); dbms_output.put_line ( rpad( l_descTbl(i).col_name, 30 ) || ': ' || l_columnValue ); end loop; dbms_output.put_line( '-----------------' );
end loop; execute immediate
'alter session set nls_date_format=''dd-MON-rr'' '; exception
when others then execute immediate 'alter session set nls_date_format=''dd-MON-rr'' '; raise;
end; /

https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:1035431863958

10

bitand   name|mode
WAIT #2: nam='enq: TT - contention' ela= 488294 name|mode=1414791174 tablespace ID=0 operation=0 obj#=-1 tim=7239383713
· 
· name|mode 
SQL> variable p1 number SQL> exec :p1 := 1414791174 PL/SQL procedure successfully completed.
SQL> select chr(to_char(bitand(:p1,-16777216))/16777215) ||chr(to_char(bitand(:p1, 16711680))/65535) "Name" , to_char(bitand(:p1, 65535)) "Mode" from dual;
Name Mode ---- ---------------------------------------TT 6
SQL> select to_char('1414791174','xxxxxxxx') "name|mode" from dual; name|mode ---------
54540006



11

TT

· TT - Tablespace Transaction
· 
· 
0- is used to avoid the deadlock occurred between drop tablespace and create rollback segment 1- using in a given tablespace create data files In a serialized 2- is used to avoid TSPITR tablespace point in in time recovery during other types of operation 4- is used to create tablespace to block the tablespace ID 8- is used to avoid deadlock in ALTER during TABLESPACE 16- is the 16 hexadecimal 0 × 10, used to synchronize the allocation and recovery disc area, allocation and deallocation of extents. 32+ With the increase in 32+ data file add datafile and create a table space, where ID2 is 32 (decimal) + relative file number relative file number



12


· Trace =====================
PARSING IN CURSOR #3 len=348 dep=1 uid=0 oct=3 lid=0 tim=5645840078 hv=2512561537 ad='b5f8e850' select name,intcol#,segcol#,type#,length,nvl(precision#,0),decode(type#,2,nvl(scale,127/*MAXSB1MINAL*/),178,scale,179,scale,180,scale,181,scale,182,scale,183,scale,231,scale,0),null $,fixedstorage,nvl(deflength,0),default$,rowid,col#,property, nvl(charsetid,0),nvl(charsetform,0),spare1,spare2,nvl(spare3,0) from col$ where obj#=:1 order by intcol# END OF STMT EXEC #3:c=0,e=118,p=0,cr=0,cu=0,mis=0,r=0,dep=1,og=4,tim=5645840075 FETCH #3:c=0,e=52,p=0,cr=3,cu=0,mis=0,r=1,dep=1,og=4,tim=5645840215 FETCH #3:c=0,e=7,p=0,cr=0,cu=0,mis=0,r=1,dep=1,og=4,tim=5645840248 FETCH #3:c=0,e=6,p=0,cr=0,cu=0,mis=0,r=1,dep=1,og=4,tim=5645840280 FETCH #3:c=0,e=11,p=0,cr=0,cu=0,mis=0,r=1,dep=1,og=4,tim=5645840316 FETCH #3:c=0,e=7,p=0,cr=0,cu=0,mis=0,r=1,dep=1,og=4,tim=5645840348 FETCH #3:c=0,e=6,p=0,cr=0,cu=0,mis=0,r=1,dep=1,og=4,tim=5645840379 FETCH #3:c=0,e=6,p=0,cr=0,cu=0,mis=0,r=1,dep=1,og=4,tim=5645840411 FETCH #3:c=0,e=7,p=0,cr=0,cu=0,mis=0,r=1,dep=1,og=4,tim=5645840443 FETCH #3:c=0,e=4,p=0,cr=0,cu=0,mis=0,r=0,dep=1,og=4,tim=5645840482 STAT #3 id=1 cnt=130 pid=0 pos=1 obj=0 op='SORT ORDER BY (cr=35 pr=0 pw=0 time=732 us)' STAT #3 id=2 cnt=130 pid=1 pos=1 obj=21 op='TABLE ACCESS CLUSTER COL$ (cr=35 pr=0 pw=0 time=330 us)' STAT #3 id=3 cnt=11 pid=2 pos=1 obj=3 op='INDEX UNIQUE SCAN I_OBJ# (cr=22 pr=0 pw=0 time=102 us)' WAIT #2: nam='DFS lock handle' ela= 450 type|mode=1413545989 id1=4 id2=0 obj#=-1 tim=5645841105 WAIT #2: nam='DFS lock handle' ela= 445 type|mode=1413545989 id1=2 id2=0 obj#=-1 tim=5645841592 WAIT #2: nam='enq: US - contention' ela= 443 name|mode=1431502854 undo segment #=0 0=0 obj#=-1 tim=5645842085 WAIT #2: nam='gc current block 2-way' ela= 1420 p1=1 p2=9 p3=16777231 obj#=-1 tim=5645843634 WAIT #2: nam='gc current grant busy' ela= 516 p1=1 p2=9 p3=33619983 obj#=-1 tim=5645844244 WAIT #2: nam='rdbms ipc reply' ela= 637 from_process=17 timeout=900 p3=0 obj#=-1 tim=5645844928 WAIT #2: nam='enq: TT - contention' ela= 488657 name|mode=1414791174 tablespace ID=0



13

DFS  lock  handle
· DFS lock handle



14

DFS  lock  handle
· DFS lock handle



15

DFS  lock  handle
· DFS lock handle

http://docs.oracle.com/database/121/REFRN/waitevents003.htm#REFRN00536

16

DFS  lock  handle

· 
WAIT #2: nam='DFS lock handle' ela= 450 type|mode=1413545989 id1=4 id2=0 obj#=-1 tim=5645841105 WAIT #2: nam='DFS lock handle' ela= 445 type|mode=1413545989 id1=2 id2=0 obj#=-1 tim=5645841592 WAIT #2: nam='enq: US - contention' ela= 443 name|mode=1431502854 undo segment #=0 0=0 obj#=-1 tim=5645842085 WAIT #2: nam='gc current block 2-way' ela= 1420 p1=1 p2=9 p3=16777231 obj#=-1 tim=5645843634 WAIT #2: nam='gc current grant busy' ela= 516 p1=1 p2=9 p3=33619983 obj#=-1 tim=5645844244

WAIT #2: nam='rdbms ipc reply' ela= 637 from_process=17 timeout=900 p3=0 obj#=-1 tim=5645844928

WAIT #2: nam='enq: TT - contention' ela= 488657 name|mode=1414791174 tablespace ID=0

SQL> select chr(bitand(&&p1,-16777216)/16777215) ||

2 chr(bitand(&&p1,16711680)/65535) type,

3 mod(&&p1, 16) md

4 from dual

5 /

TY

MD

-- ----------

TA

5

:https://orainternals.wordpress.com/2011/11/08/troubleshooting-dfs-lock-handle-waits/



17

V$LOCK_TYPE
· V$LOCK_TYPE

SQL> exec print_table(`select * from v$lock_type where type='`TA'`');

TYPE

: TA

NAME

: Instance Undo

ID1_TAG

: operation

ID2_TAG

: undo segment # / other

IS_USER

: NO

DESCRIPTION

: Serializes operations on undo segments and undo tablespaces

WAIT #2: nam='DFS lock handle' ela= 450 type|mode=1413545989 id1=4 id2=0 obj#=-1 tim=5645841105 WAIT #2: nam='DFS lock handle' ela= 445 type|mode=1413545989 id1=2 id2=0 obj#=-1 tim=5645841592 WAIT #2: nam='enq: US - contention' ela= 443 name|mode=1431502854 undo segment #=0 0=0 obj#=-1 tim=5645842085 WAIT #2: nam='gc current block 2-way' ela= 1420 p1=1 p2=9 p3=16777231 obj#=-1 tim=5645843634
WAIT #2: nam='gc current grant busy' ela= 516 p1=1 p2=9 p3=33619983 obj#=-1 tim=5645844244
WAIT #2: nam='rdbms ipc reply' ela= 637 from_process=17 timeout=900 p3=0 obj#=-1 tim=5645844928 WAIT #2: nam='enq: TT - contention' ela= 488657 name|mode=1414791174 tablespace ID=0



18


· DBA
===================== PARSING IN CURSOR #3 len=348 dep=1 uid=0 oct=3 lid=0 tim=1397318539825525 hv=2512561537 ad='aeac90a8' select name,intcol#,segcol#,type#,length,nvl(precision#,0),decode(type#,2,nvl(scale,127/*MAXSB1MINAL*/),178,scale,179,scale,180,scale,181,scale,182,scale,183,scale,231,scale,0), null$,fixedstorage,nvl(deflength,0),default$,rowid,col#,property, nvl(charsetid,0),nvl(charsetform,0),spare1,spare2,nvl(spare3,0) from col$ where obj#=:1 order by intcol# END OF STMT EXEC #3:c=0,e=78,p=0,cr=0,cu=0,mis=0,r=0,dep=1,og=4,tim=1397318539825523 FETCH #3:c=0,e=35,p=0,cr=4,cu=0,mis=0,r=1,dep=1,og=4,tim=1397318539825625 FETCH #3:c=0,e=4,p=0,cr=0,cu=0,mis=0,r=1,dep=1,og=4,tim=1397318539825645 FETCH #3:c=0,e=4,p=0,cr=0,cu=0,mis=0,r=1,dep=1,og=4,tim=1397318539825665 FETCH #3:c=0,e=3,p=0,cr=0,cu=0,mis=0,r=1,dep=1,og=4,tim=1397318539825682 FETCH #3:c=0,e=4,p=0,cr=0,cu=0,mis=0,r=1,dep=1,og=4,tim=1397318539825701 FETCH #3:c=0,e=4,p=0,cr=0,cu=0,mis=0,r=1,dep=1,og=4,tim=1397318539825718 FETCH #3:c=0,e=3,p=0,cr=0,cu=0,mis=0,r=1,dep=1,og=4,tim=1397318539825735 FETCH #3:c=0,e=3,p=0,cr=0,cu=0,mis=0,r=1,dep=1,og=4,tim=1397318539825753 FETCH #3:c=0,e=3,p=0,cr=0,cu=0,mis=0,r=0,dep=1,og=4,tim=1397318539825770 STAT #3 id=1 cnt=130 pid=0 pos=1 obj=0 op='SORT ORDER BY (cr=35 pr=0 pw=0 time=395 us)' STAT #3 id=2 cnt=130 pid=1 pos=1 obj=21 op='TABLE ACCESS CLUSTER COL$ (cr=35 pr=0 pw=0 time=190 us)' STAT #3 id=3 cnt=11 pid=2 pos=1 obj=3 op='INDEX UNIQUE SCAN I_OBJ# (cr=22 pr=0 pw=0 time=53 us)' WAIT #1: nam='db file sequential read' ela= 17 file#=1 block#=9 blocks=1 obj#=0 tim=1397318539825911 =====================



19

What's  1.9  ?

· 1

SQL> exec print_table('select segment_name,segment_type from

dba_extents where file_id=1 and block_id=9');

SEGMENT_NAME

: SYSTEM

SEGMENT_TYPE

: ROLLBACK

-----------------

PL/SQL procedure successfully completed.

why  1.9  ?



20

What's  1.9  ?

· 1

SQL> exec print_table('select segment_name,segment_type

where file_id=1 and block_id=9');

SEGMENT_NAME

: SYSTEM

SEGMENT_TYPE

: ROLLBACK

-----------------

from

dba_extents

PL/SQL procedure successfully completed.
SQL> select obj#,sql_text from bootstrap$ where obj# < 3 order by 1;
OBJ# ---------SQL_TEXT --------------------------------------------------------------------------------
-1 8.0.0.0.0

0 CREATE ROLLBACK SEGMENT SYSTEM STORAGE ( INITIAL 112K NEXT 1024K MINEXTENTS 1 M AXEXTENTS 32765 OBJNO 0 EXTENTS (FILE 1 BLOCK 9))

2 CREATE CLUSTER C_OBJ#("OBJ#" NUMBER) PCTFREE 5 PCTUSED 40 INITRANS 2 MAXTRANS 25 5 STORAGE ( INITIAL 136K NEXT 1024K MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCRE ASE 0 OBJNO 2 EXTENTS (FILE 1 BLOCK 25)) SIZE 800



21

systemstate
· systemstate
hangoradebughang analyze
-g all 
sqlplus -prelim / as sysdba
SQL> oradebug setmypid SQL> oradebug unlimit SQL> oradebug -g all hanganalyze 3 SQL> oradebug -g all dump systemstate 266
<<<<< 30 >>>>>
SQL> oradebug -g all hanganalyze 3 SQL> oradebug -g all dump systemstate 266



22

Hang  Analysis  
· systemstate dump
============== HANG ANALYSIS: ============== Open chains found: Other chains found: Chain 1 : <cnode/sid/sess_srno/proc_ptr/ospid/wait_event> :
<1/2167/3431/0xd94ed0f8/72004/No Wait> Chain 2 : <cnode/sid/sess_srno/proc_ptr/ospid/wait_event> :
<1/2175/3/0xd94ec138/100170/enq: TT - contention> Chain 3 : <cnode/sid/sess_srno/proc_ptr/ospid/wait_event> :
<1/2204/1/0xdb51bee0/105310/DIAG idle wait> Extra information that will be dumped at higher levels: [level 5] : 3 node dumps -- [SINGLE_NODE] [SINGLE_NODE_NW] [IGN_DMP] [level 10] : 28 node dumps -- [IGN]



23

Hang  Analysis  
· systemstate dump

------------process 0x7000002dba04670--------------------

proc version

: 1

Local node

: 1

pid

: 100170

lkp_node

: 1

svr_mode

: 0

proc state

: KJP_NORMAL

Last drm hb acked : 0

Total accesses : 4305

Imm. accesses : 4304

Locks on ASTQ

: 0

Locks Pending AST : 1

Granted locks

: 0

AST_Q:

PENDING_Q:

lp 7000002d9d84558 gl KJUSERNL rl KJUSEREX rp 7000002b73fb140 [0x0][0x0],[TT]

master 0 gl owner 7000002d97f7878 possible pid 100170 xid 2001-0019-00000018

bast 0 rseq 1 mseq 0 history 0x49a5149a

convert opt KJUSERGETVALUE KJUSERNODEADLOCKWAIT

GRANTED_Q:

----------------------------------------

SO: 7000002d9d84558, type: 18, owner: 7000002dba04670, flag: INIT/-/-/0x00



24

Hang  Analysis  

· systemstate dump

----------enqueue 0x7000002d9d84558------------------------

lock version

: 297

Owner node

: 1

grant_level

: KJUSERNL

req_level

: KJUSEREX

bast_level

: KJUSERNL

notify_func

: 0

resp

: 7000002b73fb140

procp

: 7000002dba04670

pid

: 100170

proc version

: 1

oprocp

: 0

opid

: 0

group lock owner : 7000002d97f7878

possible pid

: 100170

xid

: 2001-0019-00000018

dd_time

: 0.0 secs

dd_count

: 0

timeout

: 0.0 secs

On_timer_q?

: N

On_dd_q?

: N

lock_state

: OPENING CONVERTING

Open Options

: KJUSERDEADLOCK KJUSERIDLK

Convert options : KJUSERGETVALUE KJUSERNODEADLOCKWAIT



25

Hang  Analysis  

· systemstate dump ----------resource 0x7000002b73fb140----------------------

resname

: [0x0][0x0],[TT]

Local node : 1

dir_node

: 0

master_node : 0

hv idx

: 95

hv last r.inc : 38

current inc : 56

hv status

: 0

hv master

: 0

open options : dd

Held mode

: KJUSERNL

Cvt mode

: KJUSEREX

Next Cvt mode : KJUSERNL

msg_seq

: 1

res_seq

: 1

grant_bits : KJUSERNL

grant mode : KJUSERNL KJUSERCR KJUSERCW KJUSERPR KJUSERPW KJUSEREX

count

: 1

0

0

0

0

0

val_state

: KJUSERVS_NOVALUE

valblk

: 0x00000000000000000000000000000000 .

access_node : 0

vbreq_state : 0

state

: x8

resp

: 7000002b73fb140

On Scan_q? : N

Totalaccesses: 12

26

Hang  Analysis  
· systemstate dump
---------------------------------------SO: 7000002d9800ff0, type: 3, owner: 7000002d94ec138, flag: INIT/-/-/0x00 (call) sess: cur 7000002d97f7878, rec 7000002d7835f68, usr 7000002d97f7878; depth: 0
---------------------------------------SO: 7000002d98065d8, type: 3, owner: 7000002d9800ff0, flag: INIT/-/-/0x00 (call) sess: cur 7000002d7835f68, rec 7000002d7835f68, usr 7000002d97f7878; depth: 1
---------------------------------------SO: 7000002d78643b0, type: 5, owner: 7000002d98065d8, flag: INIT/-/-/0x00 (enqueue) TT-00000000-00000000 DID: 0002-0019-00000018 lv: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 res_flag: 0x3 res: 0x7000002db853838, req: X, lock_flag: 0x0 own: 0x7000002d97f7878, sess: 0x7000002d97f7878, proc: 0x7000002d94ec138, prv: 0x7000002db853858 slk: 0x7000002d9d84558 ----------------------------------------



27

Hang  Analysis  
· 
Chain 14 : <cnode/sid/sess_srno/proc_ptr/ospid/wait_event> : <0/1676/38914/0xdb52b990/404100/No Wait>
Chain 15 : <cnode/sid/sess_srno/proc_ptr/ospid/wait_event> : <0/1770/22803/0xd8530f40/526016/enq: TT - contention>
Chain 16 : <cnode/sid/sess_srno/proc_ptr/ospid/wait_event> : <0/1805/52776/0xd7536fe8/451022/No Wait>
Chain 17 : <cnode/sid/sess_srno/proc_ptr/ospid/wait_event> : <0/1945/43725/0xd854e7c0/453698/No Wait>
Chain 18 : <cnode/sid/sess_srno/proc_ptr/ospid/wait_event> : <0/1989/13476/0xdb525b10/517872/No Wait>
Chain 19 : <cnode/sid/sess_srno/proc_ptr/ospid/wait_event> : <0/2042/33/0xd7528b88/364174/enq: TT - contention>
Chain 20 : <cnode/sid/sess_srno/proc_ptr/ospid/wait_event> : <0/2043/40/0xdb51a5f0/342912/enq: TT - contention>
Chain 21 : <cnode/sid/sess_srno/proc_ptr/ospid/wait_event> : <0/2044/52/0xda4f6e78/314820/enq: TT - contention>



28

Hang  Analysis  
· 
EMBP-2: eygle$ grep name= node1_hanganalyze/process132.txt |grep -v fname name=SYS.FILE$ name=SYS.USER$ name=select name,password,datats#,tempts#,type#,defrole,resource$, ptime, exptime, ltime, astatus, lcount,
decode(defschclass,NULL,'DEFAULT_CONSUMER_GROUP',defschclass),spare1 from user$ where user#=:1 name=SYS.SYSAUTH$ name=select pos#,intcol#,col#,spare1,bo#,spare2 from icol$ where obj#=:1 name=SYS.C_USER# name=select /*+ rule */ bucket, endpoint, col#, epvalue from histgrm$ where obj#=:1 and intcol#=:2 and row#=:3 order
by bucket name=select /*+ rule */ bucket_cnt, row_cnt, cache_cnt, null_cnt, timestamp#, sample_size, minimum, maximum, distcnt,
lowval, hival, density, col#, spare1, spare2, avgcln from hist_head$ where obj#=:1 and intcol#=:2 name=select /*+ rule */ bucket, endpoint, col#, epvalue from histgrm$ where obj#=:1 and intcol#=:2 and row#=:3 order
by bucket name=select /*+ rule */ bucket_cnt, row_cnt, cache_cnt, null_cnt, timestamp#, sample_size, minimum, maximum, distcnt,
lowval, hival, density, col#, spare1, spare2, avgcln from hist_head$ where obj#=:1 and intcol#=:2 name=select o.owner#,o.name,o.namespace,o.remoteowner,o.linkname,o.subname,o.dataobj#,o.flags from obj$ o where
o.obj#=:1 name=select blocks,NVL(ts#,-1),status$,NVL(relfile#,0),maxextend,inc, crscnwrp,crscnbas,NVL(spare1,0) from file$
where file#=:1 name=SYS.TS$ name=select distinct(-privilege#),nvl(option$,0) from sysauth$ where grantee#=:1 and privilege#<0 name=SYS.C_TS# name=select
type#,blocks,extents,minexts,maxexts,extsize,extpct,user#,iniexts,NVL(lists,65535),NVL(groups,65535),cachehint,hwmincr, NVL(spare1,0),NVL(scanhint,0) from seg$ where ts#=:1 and file#=:2 and block#=:3
name=select file# from file$ where ts#=:1 name=SYS.ORA_TQ_BASE$ name= select a.ts_name,bytes/data_sum,data_sum,free_sum from (select tablespace_name ts_name,sum(nvl(blocks,0)) data_sum, sum(nvl(bytes,0)) bytes from dba_data_files group by tablespace_name )a, (select tablespace_name ts_name,sum(nvl(blocks,0)) free_sum from user_free_space group by tablespace_name )b where a.ts_name=b.ts_name order by a.ts_name name=select actsyn ,othsyn ,lognam from logdef name=SYS.DATABASE



29

Hang  Analysis  
· 
name= select a.ts_name
, bytes/data_sum , data_sum , free_sum from (
select tablespace_name ts_name , sum(nvl(blocks, 0)) data_sum , sum(nvl(bytes, 0)) bytes
from dba_data_files group by tablespace_name )a , ( select tablespace_name ts_name
, sum(nvl(blocks, 0)) free_sum from user_free_space group by tablespace_name )b where a.ts_name = b.ts_name order by a.ts_name
hash=330c2bf816b3e20cc820c303fb3cb3ea timestamp=10-15-2014 02:58:08



30

Hang  Analysis  
· 
EMBP-2:node1_hanganalyze eygle$ grep -A 6 "TT-00000000-00000000" tgw21_ora_404100.trc
(enqueue) TT-00000000-00000000 DID: 0001-0016-00000003 lv: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 res_flag: 0x3 res: 0x7000002d784ffc8, req: S, lock_flag: 0x0 own: 0x7000002d7828570, sess: 0x7000002d7828570, proc: 0x7000002d8526200, prv: 0x7000002d88667e0 slk: 0x7000002d8d94020 ---------------------------------------SO: 7000002d88665e8, type: 5, owner: 7000002da806058, flag: INIT/-//0x00 -(enqueue) TT-00000000-00000000 DID: 0001-005C-00000008 lv: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 res_flag: 0x3 res: 0x7000002d784ffc8, mode: S, lock_flag: 0x0 own: 0x7000002d97e93a0, sess: 0x7000002d97e93a0, proc: 0x7000002d852d040, prv: 0x7000002d784ffd8 slk: 0x7000002d9a74678 ---------------------------------------SO: 700000236051390, type: 53, owner: 7000002d97e93a0, flag: INIT/-//0x00 --



31

Hang  Analysis  
· 
PROCESS 92: ---------------------------------------SO: 7000002d852d040, type: 2, owner: 0, flag: INIT/-/-/0x00 (process) Oracle pid=92, calls cur/top: 7000002b64e6848/7000002b64e6848,
flag: (0) int error: 0, call error: 0, sess error: 0, txn error 0
(post info) last post received: 0 0 169 last post received-location: kqrpre1: post after loading last process to post me: 7000002d7528b88 11 0 last post sent: 0 0 169 last post sent-location: kqrpre1: post after loading last process posted by me: 7000002d7528b88 11 0
(latch info) wait_event=0 bits=0 Process Group: DEFAULT, pseudo proc: 7000002d85e9198 O/S info: user: oracle, term: UNKNOWN, ospid: 360262 OSD pid info: Unix process pid: 360262, image: oracle@cifdb1 Short stack dump:



32

V$SESSION

· V$SESSION

SQL>select username,event,sql_id,sid,serial#,seconds_in_wait from v$session where status='ACTIVE';

EVENT

SQL_ID

SID SERIAL# SECONDS_IN_WAIT

------------------------------ ------------- ---------- ---------- ---------------

enq: TT - contention

ch8630gxmtcza

2042

33

12994

enq: TT - contention

ch8630gxmtcza

2043

40

12334

enq: TT - contention

ch8630gxmtcza

2044

52

11674

enq: TT - contention

ch8630gxmtcza

2049

53

12664

enq: TT - contention

ch8630gxmtcza

2058

51

12004

enq: TT - contention

ch8630gxmtcza

2062

85

12994

enq: TT - contention

ch8630gxmtcza

2063

46

11674

enq: TT - contention

ch8630gxmtcza

2065

106

12334

enq: TT - contention

ch8630gxmtcza

2066

138

12664

enq: TT - contention

ch8630gxmtcza

2080

9

12004

enq: TT - contention

ch8630gxmtcza

2089

8

10684

enq: TT - contention

ch8630gxmtcza

2093

7

11674

enq: TT - contention

ch8630gxmtcza

2112

5

12334

enq: TT - contention

ch8630gxmtcza

2115

7

12664



33

V$LOCK

· 
SQL> select * from gv$lock where type=`TT';

INST_ID ADDR

KADDR

SID TY

ID1ID2 LMODE REQUEST

CTIME BLOCK

---------- ---------------- ---------------- ---- -- ------------- ------ ------- ---------- -----

1 07000002D8867148 07000002D8867168 1770 TT

0 0

0

4

12395

0

1 07000002D88667B0 07000002D88667D0 2042 TT

0 0

0

4

13385

0

1 07000002D8866978 07000002D8866998 2043 TT

0 0

0

4

12725

0

1 07000002D8866C70 07000002D8866C90 2044 TT

0 0

0

4

12065

0

1 07000002D88668E0 07000002D8866900 2049 TT

0 0

0

4

13055

0

1 07000002D8866BD8 07000002D8866BF8 2058 TT

0 0

0

4

12395

0

1 07000002D8866680 07000002D88666A0 2062 TT

0 0

0

4

13385

0

1 07000002D8866718 07000002D8866738 2063 TT

0 0

0

4

12065

0

1 07000002D8866AA8 07000002D8866AC8 2065 TT

0 0

0

4

12725

0

1 07000002D8866848 07000002D8866868 2066 TT

0 0

0

4

13055

0

1 07000002D8866D08 07000002D8866D28 2080 TT

0 0

0

4

12395

0

1 07000002D8866F80 07000002D8866FA0 2089 TT

0 0

0

4

11075

0

1 07000002D8866DA0 07000002D8866DC0 2093 TT

0 0

0

4

12065

0

1 07000002D8867018 07000002D8867038 2112 TT

0 0

0

4

12725

0

1 07000002D88643B0 07000002D88643D0 2115 TT

0 0

0

4

13055

0

1 07000002D88707D0 07000002D88707F0 2116 TT

0 0

4

0 8066215

2

1 07000002D8864020 07000002D8864040 2116 TT

0 0

0

4

13385

0

1 07000002D88644E0 07000002D8864500 2124 TT

0 0

0

4

10415

0

1 07000002D88670B0 07000002D88670D0 2134 TT

0 0

0

4

11735

0

1 07000002D88674D8 07000002D88674F8 2145 TT

0 0

0

4

10745

0

1 07000002D8868BB0 07000002D8868BD0 2155 TT

0 0

4

0 8314633

2

1 07000002D88673A8 07000002D88673C8 2155 TT

0 0

0

4

11405

0

1 07000002D8866A10 07000002D8866A30 2183 TT

0 0

0

4

13072

0

1 07000002D88665E8 07000002D8866608 2183 TT 2147483647 1

6

0

13072

2

2 07000002D78643B0 07000002D78643D0 2175 TT

0 0

0

6

13416

0



34

V$LOCK
· V$LOCK



35

V$LOKCK
· BLOCK



36

· DBA_FREE_SPACE

TT

---------------------------------------SO: 70000028da45898, type: 53, owner: 7000002d9682ac0, flag: INIT/-/-/0x00 LIBRARY OBJECT LOCK: lock=70000028da45898 handle=7000002975035b8 mode=N call pin=0 session pin=0 hpc=0000 hlc=0000 htl=70000028da45918[70000023e05efe0,7000002338ec188] htb=7000002338ec188
ssga=70000026bd26298 user=7000002d9682ac0 session=7000002d9682ac0 count=0 flags=LRU/[4000]
savepoint=0x481f LIBRARY OBJECT HANDLE: handle=7000002975035b8 mtx=7000002975036e8(0) cdp=0 name=SYS.DBA_FREE_SPACE hash=b0fd6608ebaccdecf7b48c6f5303b8ae timestamp=03-31-2008 12:28:08 namespace=TABL flags=KGHP/TIM/XLR/[00000020] kkkk-dddd-llll=0000-0000-0000 lock=N pin=0 latch#=25 hpc=29ea hlc=29ea lwt=700000297503660[700000297503660,700000297503660]
ltm=700000297503670[700000297503670,700000297503670] pwt=700000297503628[700000297503628,700000297503628]
ptm=700000297503638[700000297503638,700000297503638] ref=700000297503690[700000297503690,700000297503690]
lnd=7000002975036a8[70000023019b408,7000002b41a8130] LOCK INSTANCE LOCK: id=LBb0fd6608ebaccdec PIN INSTANCE LOCK: id=NBb0fd6608ebaccdec mode=S release=F flags=[00] INVALIDATION INSTANCE LOCK: id=IV00000ce01f0d1d09 mode=S LIBRARY OBJECT last freed from HPD addn data CBK
----------------------------------------



37

MOS  
· 



38

· 
· 10046 ·  · Hang  analyze · OracleV$LOCK





39


1.   2. oracle 3. oracle 4. oracle 5. 



40


1.   2.  3.  4. 



41

 


ORA



Oracle

z3 ­ SQL


zData ­ 

BayMax

 


