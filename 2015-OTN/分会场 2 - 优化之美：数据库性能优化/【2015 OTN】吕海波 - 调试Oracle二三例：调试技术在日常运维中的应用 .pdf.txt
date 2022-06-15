 7"(&
F#BZ.54 %#"
  


Ø  "Oracle"Cache B  uffers C  hain L  atch
Ø  "Oracle"
Ø  MySQL

Latch

Cache Buffers  Chain

StatspackTOP  5  wait  events

Top 5 Timed Events

Avg %Total

~~~~~~~~~~~~~~~~~~

wait Call

Event

Waits Time (s) (ms) Time

----------------------------------------- ------------ ----------- ------ ------

latch: cache buffers chains

5,529,045 257,981 47 81.4

CPU time

26,312

8.3

db file sequential read

3,821,940

24,912

7 7.9

read by other session

287,566

1,752

6 .6

virtual circuit wait

592,639

1,519

3 .5

TOP  5  wait e  vents:

Top 5 Timed Events

Avg %Total

~~~~~~~~~~~~~~~~~~

wait Call

Event

Waits Time (s) (ms) Time

----------------------------------------- ------------ ----------- ------ ------

db file sequential read

4,019,683

25,762

6 52.2

CPU time

19,564

39.6

read by other session

248,232

1,586

6 3.2

log file sync

546,695

551

1 1.1

db file parallel write

680,522

282

0 .6

Latch

· Cache  Buffers  Chain  latchP1P1 LatchLatch
· SQLSelectUpdate · Buffer  Busy  Waits · SessionSQL80%SQL
SQL

Errors  in  file  /oracle//home/products/diag /rdbms///trace/XXX_smon_13903.trc:
ORA--00018:  maximum  number   of  sessions   exceeded
 

Latch

Latch Miss
Latch Miss Sources DB/Inst: USER21/USER21 -> only latches with sleeps are shown -> ordered by name, sleeps desc

Snaps: 173864-173865

NoWait

Waiter

Latch Name

Where

Misses Sleeps Sleeps

------------------------ -------------------------- ------- ---------- --------

cache buffers chains kcbgtcr: fast path

0 4,509,509 ########

cache buffers chains kcbchg1: mod cr pin

0 1,870,097 ########

cache buffers chains cache buffers chains

kcbgtcr_2 kcbgkcbcr

0 972,006 777,782 0 353,523 331,441

Latch M  iss

cache buffers chains kcbgtcr_2

0 30,195 28,152Latch

Name

Where

Misses Sleeps Sleeps

------------------------ -------------------------- ------- ---------- --------

cache buffers chains kcbzwb

0 13,059 7,088

cache buffers chains kcbgtcr: fast path (cr pin

0

9,006 11,084

cache buffers chains kcbgtcr: fast path

0

2,181

775

cache buffers chains kcbgtcr: kslbegin shared

0

1,805 1,528

cache buffers chains kcbgcur_2

0

1,296

999

cache buffers chains kcbgtcr: kslbegin excl

0

1,137 1,683

cache buffers chains kcbchg1: mod cr pin

0

568

346

Latch

2015XXXX XX Oracle

Cache  Buffers  Chain  latch LatchSQLSelectUpdate80%SQL
SQLBuffer  Busy  Waits
 CBC L  atch

1.  2. CBC  LatchBuffer  CacheHash  Bucket

Latch

Latch M  issCR DMLSelect DMLSelectBuffer  Busy  WaitsCBC  Latch

CBC L  atchCBC L  atch

SelectCBC L  atch 11.2.0.4

DMLCBC L  atch



CRCBC L  atch 

CRLatch

CROracleCR LatchCPU



LatchAB 

CRCBC L  atch

Latch
DTrace17

bash--3.2#  cat w  atch_cbc.d #!/usr/sbin/dtrace --s  --n  
char  *latch_value;

pid$ 

dtrace:::BEGIN

latch

{



i=1;

}



pid$1:::entry



{

latch_value =copyin($2,8);

printf("[%2x%2x%2x%2x%2x%2x%2x%2x],  %d",

latch_value[0], latch_value[1], latch_value[2], latch_value[3],

latch_value[4], l  atch_value[5], latch_value[6], latch_value[7], v  timestamp);

printf("i=%d   %s(%x,%x,%x,%x,%x,%x)",i,   probefunc,   arg0,arg1,arg2,arg3,arg4,arg5);

i=i+1;

}

Latch
CBC  LatchSQL 1.   SQL> select rowid, dbms_rowid.ROWID_RELATIVE_FNO(rowid) file#,dbms_rowid.rowid_block_number(rowid) blk, t1.* from t1 where rownum=1;

ROWID

FILE#

BLK

ID C1

------------------ ---------- ---------- ---------- --------------------

AAADYIAAEAAAACBAAA

4

129

1 BBBBBB

T14129ROWID 0000000053A55E70

2.  Latch SQL> select HLADDR from x$bh where file#=4 and dbablk=129;

HLADDR ---------------0000000053A55E70

Latch
CRCBC L  atch

-bash-3.2$ sqlplus lhb/a
SQL*Plus: Release 11.2.0.4.0 Production on Mon Nov 9 17:34:41 2015
Copyright (c) 1982, 2013, Oracle. All rights reserved.
Connected to: Oracle Database 11g Enterprise Edition Release 11.2.0.4.0 - 64bit Production With the Partitioning, Real Application Clusters, Automatic Storage Management, OLAP, Data Mining and Real Application Testing options
SQL> SQL> update t1 2 set c1=lower(c1) 3 where rowid='AAADYIAAEAAAACBAAA';
1 row updated.
SQL>

-bash-3.2$ sqlplus lhb/a
SQL*Plus: Release 11.2.0.4.0 Production on Mon Nov 9 17:33:30 2015 Copyright (c) 1982, 2013, Oracle. All rights reserved.
Connected to: Oracle Database 11g Enterprise Edition Release 11.2.0.4.0 - 64bit Production With the Partitioning, Real Application Clusters, Automatic Storage Management, OLAP, Data Mining and Real Application Testing options

SQL>  

SQL> select c.sid,spid from

2

(select sid from v$mystat where rownum<=1) c,

3

v$session a,

4

v$process b

5

where c.sid=a.sid and a.paddr=b.addr;

SID SPID ---------- ------------------------
20 2486

SQL>  

Latch

bash-3.2# ./watch_cbc.d -x switchrate=10hz -b 8m 2486 0x53A55E70 > cr1.log dtrace: script './watch_cbc.d' matched 181176 probes
^C bash-3.2# bash-3.2# cat cr1.log

 CBC L  atch

SQL> select c.sid,spid from

2

(select sid from v$mystat where rownum<=1) c,

3

v$session a,

4

v$process b

5

where c.sid=a.sid and a.paddr=b.addr;

SID SPID ---------- ------------------------
20 2486

SQL>  select  *  from  t1  where  rowid='AAADYIAAEAAAACBAAA';

ID C  1 -------------------- ----------------------------------------
1  BBBBBB

Latch

 []Latch Value

..................

0 70185

kcbchg:entry [ 0 0 0 0 0 0 0 0] 3044602 i=579 kcbchg(8,1,fffffd7ffd950548,

0 71195

ktcgtx:entry [ 0 0 0 0 0 0 0 0] 3045448 i=580 ktcgtx(0,1,fffffd7ffd950548,

0 70187 kcbchg1_main:entry [ 0 0 0 0 0 0 0 0] 3046346 i=581 kcbchg1_main(8,1,0,fff

0 70498

kcbzcb:entry [24 0 0 0 0 0 020] 3048930 i=582 kcbzcb(fffffd7ffd950548,53b04028,

0 70464 0 113382

kcbzgb:entry [24 0 0 0 0 0 020] 3050723 i=583 kcbzgb(4,1000081,4,3608,3608,1) krta2bz:entry [24 0 0 0 0 0 020] 3054069 i=584 krta2bz(4,1000081,0,0,3608,1)

0 57293

kslgetl:entry [24 0 0 0 0 0 020] 3095559 i=585 kslgetl(53b77968,0,0,7b0,53b76ef0

0 70467

kcbzfb:entry [24 0 0 0 0 0 020] 3157285 i=586 kcbzfb(53b77610,46fdf120,53a55e70,

0 70600 kcbz_mk_fr:entry [24 0 0 0 0 0 020] 3159158 i=587 kcbz_mk_fr(53a55e70,463eacd0,12,0,

0 229887 0 57300

memset:entry [24 0 0 0 0 0 020] 3162123 i=588 memset(463ead48,0,40,f0,0,0) kslfre:entry [24 0 0 0 0 0 020] 3162973 i=589 kslfre(53b77968,0,0,2c0,40,101010

0 229886

memcpy:entry [24 0 0 0 0 0 020] 3193874 i=590 memcpy(46224000,46cf0000,2000,

0 110638

kcsgrsn:entry [24 0 0 0 0 0 020] 3267497 i=591 kcsgrsn(fffffd7fffdf8c20,46cf0000,

0 110634

kcsgbsn:entry [24 0 0 0 0 0 020] 3270624 i=592 kcsgbsn(fffffd7fffdf8c28,fffffd7f

0 229887 0 70448

memset:entry [24 0 0 0 0 0 020] 3271496 i=593 memset(463ead48,0,24,fffffd7ffdb kcbzfw:entry [24 0 0 0 0 0 020] 3272321 i=594 kcbzfw(46fdf120,fffffd7fffdf8f80,

0 70353 kcbds2pbh:entry [ 0 0 0 0 0 0 0 0] 3376549 i=595 kcbds2pbh(fffffd7ffd

..................

Latch

 []Latch Value

..................

0 70185

kcbchg:entry [ 0 0 0 0 0 0 0 0] 3044602 i=579 kcbchg(8,1,fffffd7ffd950548,

0 71195

ktcgtx:entry [ 0 0 0 0 0 0 0 0] 3045448 i=580 ktcgtx(0,1,fffffd7ffd950548,

0 70187 kcbchg1_main:entry [ 0 0 0 0 0 0 0 0] 3046346 i=581 kcbchg1_main(8,1,0,fff

0 70498

kcbzcb:entry [24 0 0 0 0 0 020] 3048930 i=582 kcbzcb(fffffd7ffd950548,53b04028,

0 70464 0 113382

kcbzgb:entry [24 0 0 0 0 0 020] 3050723 i=583 kcbzgb(4,1000081,4,3608,3608,1) krta2bz:entry [24 0 0 0 0 0 020] 3054069 i=584 krta2bz(4,1000081,0,0,3608,1)

0 57293

kslgetl:entry [24 0 0 0 0 0 020] 3095559 i=585 kslgetl(53b77968,0,0,7b0,53b76ef0

0 70467 0 70600 0 229887 0 57300

5k9cb5zfb:entry[240 0 00303706205]493157285 i=586 kcbzfb(53b77610,46fdf120,53a55e70, kcbz_mmekm5_s8fe2rt::eennttrryy[[3220444008900300000 00002200]]33115692C11B5283Cii  L==a55t88c78hkmcebmzs_emtk(_4f6r3(e5a3da4585,e07,04,04,6f30e,a0c,d00),12,0, 327k,s6l1f9re:entry [24 0 0 0 0 0 020] 3162973 i=589 kslfre(53b77968,0,0,2c0,40,101010

0 229886

memcpy:entry [24 0 0 0 0 0 020] 3193874 i=590 memcpy(46224000,46cf0000,2000,

0 110638

kcsgrsn:entry [24 0 0 0 0 0 020] 3267497 i=591 kcsgrsn(fffffd7fffdf8c20,46cf0000,

0 110634

kcsgbsn:entry [24 0 0 0 0 0 020] 3270624 i=592 kcsgbsn(fffffd7fffdf8c28,fffffd7f

0 229887 0 70448

memset:entry [24 0 0 0 0 0 020] 3271496 i=593 memset(463ead48,0,24,fffffd7ffdb kcbzfw:entry [24 0 0 0 0 0 020] 3272321 i=594 kcbzfw(46fdf120,fffffd7fffdf8f80,

0 70353 kcbds2pbh:entry [ 0 0 0 0 0 0 0 0] 3376549 i=595 kcbds2pbh(fffffd7ffd

..................

Latch
Update ..................
0 253272 kcbchg1_main:entry [ 0 0 0 0 0 0 0 0] 112852606 i=905 kcbchg1_main( 0 72162 ktiimu_chg:entry [24 0 0 0 0 0 020] 112854578 i=906 ktiimu_chg(5376b6d0,554e38d0,1, 0 70353 kcbds2pbh:entry [ 0 0 0 0 0 0 0 0] 112878138 i=907 kcbds2pbh(fffffd7fffdf8690,20000
..................
UpdateCBC L  atch23,560 CRLatch13.9 327,619  15

Latch
CRCBC L  atch 
1 2OracleCRCBC L  atch 3 SUNSPARC  T5SPARC  T4

RAC ONERAC ONE
Ø "Oracle"Cache B  uffers  Chain  Latch Ø "Oracle" Ø MySQL



RAC ONERAC ONE









Server  PoolMy_Pool1

RAC  ONEHACMPVeritas  VCSN+1 



RAC ONERAC ONE





RAC  ONE

RACRAC O  NE

RAC  ONE

OS

enableRAC  ONE



RAC  ONERAC





RAC ONE
Ø  Ø RAC
DownSQL   "Oracle" "Oracle" 

RAC ONE
MySQL
DTrace
#!/usr/sbin/dtrace --s  --n  
dtrace:::BEGIN {
i=1; } pid$1:::entry {
printf("i=%d  %s(%x,%x,%x,%x,%x,%x);",i,   probefunc,arg0,arg1,arg2,arg3,arg4,arg5); i=i+1; }
"list_func.d""chmod 755  list_func.d"

RAC ONE



LMON 

1. LMON

bash--3.2#  ps --ef|grep lmon grid     1873     1865      0       Oct  02  ?                     root   14598     3797      0   01:43:08  pts/1              
oracle     3319 3281      0       Oct  22  ?                    

79:15   0:00   18:08  

asm_lmon_+ASM1 grep  lmon ora_lmon_mytst_1

2.        

RAC ONE
bash-3.2# bash-3.2# ./ list_func.d -x switchrate=10hz -b 16m 3319 > lmon.log dtrace: script './all_rac.d' matched 360430 probes
^C bash-3.2#

--bash--3.2$   sqlplus /  as  sysdba
SQL*Plus:  Release 1  1.2.0.4.0 P  roduction   on  Wed O  ct  28  02:15:19   2015
Copyright  (c)  1982,  2013,  Oracle.    All  rights  reserved.

Connected   to  an  idle  instance.

SQL> SQL>  startup

Total  System  Global  Area    371654656    bytes

Fixed  Size                                  

2250928    bytes

Variable  Size                           239077200    bytes

Database B  uffers                     125829120    bytes

Redo  Buffers                                

4497408    bytes

Database m  ounted.

Database o  pened.



RAC ONE

bash-3.2# ./ list_func.d -x switchrate=10hz -b 16m 3319 > lmon.log dtrace: script './all_rac.d' matched 360430 probes

^C bash-3.2#
bash-3.2# more lmon.log CPU ID
0 749

FUNCTION:NAME resume:on-cpu i=1,process:3319,exec_name:oracle,Sleep times(ms):18527

0 411536 0 411082 0 409889 0 394271 0 394243 0 214200 0 59715 0 240854 0 394245 0 213955 0 394000 0 213956 0 394001 0 214066 0 394111

__pollsys:return i=1 PID::return==pid3319:libc.so.1:__pollsys:return 10 0 18 _pollsys:return i=2 PID::return==pid3319:libc.so.1:_pollsys:return 14d 0 18
poll:return i=3 PID::return==pid3319:libc.so.1:poll:return 53 0 18 ssskgxp_poll:return i=4 PID::return==pid3319:libskgxp11.so:ssskgxp_poll:return 6a 5 18 sskgxp_selectex:return i=5 PID::return==pid3319:libskgxp11.so:sskgxp_selectex:return 1ed 5 18 sskgxp_gettime:entry i=6 PID::entry:==pid3319:libskgxp11.so:sskgxp_gettime:entry kstmgethighresmstick_fn:entry i=7 PID::entry:==pid3319:oracle:kstmgethighresmstick_fn:entry kstmgethighresmstick_fn:return i=8 PID::return==pid3319:oracle:kstmgethighresmstick_fn:return 24 sskgxp_gettime:return i=9 PID::return==pid3319:libskgxp11.so:sskgxp_gettime:return 16c
skgxpradm:entry i=10 PID::entry:==pid3319:libskgxp11.so:skgxpradm:entry skgxpradm:return i=11 PID::return==pid3319:libskgxp11.so:skgxpradm:return 463 1 18 skgxprpost:entry i=12 PID::entry:==pid3319:libskgxp11.so:skgxprpost:entry skgxprpost:return i=13 PID::return==pid3319:libskgxp11.so:skgxprpost:return 5c 1 18 skgxprrgn:entry i=14 PID::entry:==pid3319:libskgxp11.so:skgxprrgn:entry skgxprrgn:return i=15 PID::return==pid3319:libskgxp11.so:skgxprrgn:return 3c1 0 18
....................................................................................

RAC ONE



LMONkjfcrfg

RAC ONE
kjfcrfg "fg""" 
bash-3.2# ./ list_func.d -x switchrate=10hz -b 16m 3319 > lmon.log dtrace: script './all_rac.d' matched 360430 probes ^C bash-3.2#

bash-3.2# more lmon.log CPU ID
0 749

FUNCTION:NAME resume:on-cpu i=1,process:3319,exec_name:oracle,Sleep times(ms):18527

0 411536 0 411082 0 409889 0 394271
0 55418 0 144698 0 57412 0 57489 0 66625 0 67402 0 57324 0 66925 0 229916 0 144561 0 144562

__pollsys:return i=1 PID::return==pid3319:libc.so.1:__pollsys:return 10 0 18 _pollsys:return i=2 PID::return==pid3319:libc.so.1:_pollsys:return 14d 0 18
poll:return i=3 PID::return==pid3319:libc.so.1:poll:return 53 0 18 ssskgxp_poll:return i=4 PID::return==pid3319:libskgxp11.so:ssskgxp_poll:return 6a 5 18
....................................................................................
write:entry i=564450 PID::entry:==syscall::write:entry e fffffd7fffdfb960 8 2cc 28 dbgtfFileClearError:entry i=564451 PID::entry:==pid3319:oracle:dbgtfFileClearError:entry
kslpsem:entry i=564452 PID::entry:==pid3319:oracle:kslpsem:entry 200 0 kslpstevent:entry i=564453 PID::entry:==pid3319:oracle:kslpstevent:entry 200 0 0 0 0 0
kjshashpt:entry i=564454 PID::entry:==pid3319:oracle:kjshashpt:entry 200 0 554f0e68 kjfcrfg:entry i=564455 PID::entry:==pid3319:oracle:kjfcrfg:entry fffffd7ffc97f730
ksl_get_shared_latch:entry i=564456 PID::entry:==pid3319:oracle:ksl_get_shared_latch:entry kjbilms:entry i=564457 PID::entry:==pid3319:oracle:kjbilms:entry 60018628 1 1c0 memset:entry i=564458 PID::entry:==pid3319:libc.so.1:memset:entry fffffd7fffdfd9d0
dbgtTrc_int:entry i=564459 PID::entry:==pid3319:oracle:dbgtTrc_int:entry dbgtTrcVaList_int:entry i=564460 PID::entry:==pid3319:oracle:dbgtTrcVaList_int:entry
....................................................................................

RAC ONE

bash-3.2#

bash-3.2# mdb -p 3319

Loading modules: [ ld.so.1 libc.so.1 libnvpair.so.1 libuutil.so.1 ]

>

> kjfcrfg:b

> :c

mdb: stop at kjfcrfg

mdb: target stopped at:

kjfcrfg:

pushq %rbp

>

--bash--3.2$   sqlplus vage/a Connected   to: (  1)
SQL> SQL>  select  *  from  t1  where  
rowid='AAADYIAAEAAAAL6AAB';
ID C  1 -------------------- ----------------------------------------
148457  AAAAAAAAAAAAAAAAAAAA

--bash--3.2$   sqlplus /  as  sysdba
SQL*Plus:  Release 1  1.2.0.4.0 P  roduction   on  Wed O  ct  28  02:15:19   2015
Copyright  (c)  1982,  2013,  Oracle.    All  rights  reserved.
Connected   to  an  idle  instance.
SQL> SQL>  startup ORACLE  instance  started.
Total  System  Global  Area    371654656  bytes Fixed  Size                                    2250928  bytes Variable  Size                          239077200  bytes Database B  uffers                    125829120  bytes Redo  Buffers                                4497408  bytes

RAC ONE
kjbdomhashcfg

0 57489 0 66625 0 67402 0 57324 0 66925 0 229916 0 144561 0 144562
0 67403 0 57324 0 66925 0 67404 0 67396 0 4395 0 4463 0 4395 0 4463 0 57329 0 66346

kslpstevent:entry i=564453 PID::entry:==pid3319:oracle:kslpstevent:entry 200 0 0 0 0 0 kjshashpt:entry i=564454 PID::entry:==pid3319:oracle:kjshashpt:entry 200 0 554f0e68 kjfcrfg:entry i=564455 PID::entry:==pid3319:oracle:kjfcrfg:entry fffffd7ffc97f730
ksl_get_shared_latch:entry i=564456 PID::entry:==pid3319:oracle:ksl_get_shared_latch:entry kjbilms:entry i=564457 PID::entry:==pid3319:oracle:kjbilms:entry 60018628 1 1c0 memset:entry i=564458 PID::entry:==pid3319:libc.so.1:memset:entry fffffd7fffdfd9d0
dbgtTrc_int:entry i=564459 PID::entry:==pid3319:oracle:dbgtTrc_int:entry dbgtTrcVaList_int:entry i=564460 PID::entry:==pid3319:oracle:dbgtTrcVaList_int:entry
.................................................................................... ....................................................................................
....................................................................................
kjbdomhashdom:entry i=565171 PID::entry:==pid4696:oracle:kjbdomhashdom:entry 0 0 2 2 2000 ksl_get_shared_latch:entry i=565172 PID::entry:==pid4696:oracle:ksl_get_shared_latch:entry
kjbilms:entry i=565173 PID::entry:==pid4696:oracle:kjbilms:entry 60018628 1 1c0 kjbdomhashcfg:entry i=565174 PID::entry:==pid4696:oracle:kjbdomhashcfg:entry 0 0 0 d730004
kjbdomfnd:entry i=565175 PID::entry:==pid4696:oracle:kjbdomfnd:entry 0 1 4f965520 ff 5 resume:off-cpu i=565176,process:4696,exec_name:oracle,On times(ms):0 resume:on-cpu i=565176,process:4696,exec_name:oracle,Sleep times(ms):0 resume:off-cpu i=565176,process:4696,exec_name:oracle,On times(ms):0 resume:on-cpu i=565176,process:4696,exec_name:oracle,Sleep times(ms):0
kslfre:entry i=565176 PID::entry:==pid4696:oracle:kslfre:entry 60018628 0 1 kjip2cln:entry i=565177 PID::entry:==pid4696:oracle:kjip2cln:entry 60018628
....................................................................................

RAC ONE

--bash--3.2$   sqlplus /  as  sysdba

bash-3.2# bash-3.2# mdb -p 3319

SQL*Plus:  Release 1  1.2.0.4.0 P  roduction   on  Wed O  ct  28  02:15:19   2015
Copyright  (c)  1982,  2013,  Oracle.    All  rights  reserved.

Ll>oiabkdnivjnpbgadimroo.mdshuol.ae1ssh:lic[bfugludt:.ibslo..s1o.l1ib]c.so.1 CSSQQonLL>>ne  scttaerdtu   tpo  an  idle  instance. 

> :c
mdb: stop atgkejsbednotmehra  sshecrvfegr  mode

ORACLE  instance  started.

mdb: target sgtcosprpeesdouartc:e  directory  to  beTo  utanlf  Sryostzeemn  Global  Area    371654656  bytes

kjbdomhashcfg:cs epnutsehrq  se%rvrebrp  mode

Fixed  Size                                    2250928  bytes Variable  Size                          239077200  bytes

Database B  uffers                    125829120  bytes

Redo  Buffers                                4497408  bytes

--bash--3.2$   sqlplus vage/a Connected   to: (  1)
SQL> SQL>  select  *  from  t1  where rowid='AAADYIAAEAAAAL6AAB';

--bash--3.2$   sqlplus vage/a Connected   to: (  1)
SQL>
SQL>  select  sid,event,state from  v$session where  wait_class<>'Idle'  order  by  event;

SID                  EVENT                                                                                                                                                         STATE                             

------------------------ -------------------------------------------------------------------------------------------------------------------------------------- --------------------------------------

130   CGS  wait f  or  IPC  msg

WAITED  SHORT  TIME    

24   gc cr request                                                    

WAITING                        

154   gcs enter  server  mode                                  

WAITING                        

152        gcs enter  server  mode                                    

WAITING                        

131   gcs resource  directory  to  be  unfrozen     WAITING                        

RAC ONE

kjbdomhashcfg

0 57489 0 66625 0 67402 0 57324 0 66925 0 229916 0 144561 0 144562
0 67403 0 57324 0 66925 0 67404 0 67396 0 4395 0 4463 0 4395 0 4463 0 57329 0 66346

kslpstevent:entry i=564453 PID::entry:==pid3319:oracle:kslpstevent:entry 200 0 0 0 0 0 kjshashpt:entry i=564454 PID::entry:==pid3319:oracle:kjshashpt:entry 200 0 554f0e68 kjfcrfg:entry i=564455 PID::entry:==pid3319:oracle:kjfcrfg:entry fffffd7ffc97f730
ksl_get_shared_latch:entry i=564456 PID::entry:==pid3319:oracle:ksl_get_shared_latch:entry kjbilms:entry i=564457 PID::entry:==pid3319:oracle:kjbilms:entry 60018628 1 1c0 memset:entry i=564458 PID::entry:==pid3319:libc.so.1:memset:entry fffffd7fffdfd9d0
dbgtTrc_int:entry i=564459 PID::entry:==pid3319:oracle:dbgtTrc_int:entry dbgtTrcVaList_int:entry i=564460 PID::entry:==pid3319:oracle:dbgtTrcVaList_int:entry
.................................................................................... .................................................................................... ........................................................................kjf...zfd...b ...... kjbdomhashdom:entryi=565171PID::entry:==pid4696:oracle:kjbdomhashdom:entry 0 0 2 2 2000
ksl_get_shared_latch:entry i=565172 PID::entry:==pid4696:oracle:ksl_get_shared_latch:entry kjbilms:entry i=565173 PID::entry:==pid4696:oracle:kjbilms:entry 60018628 1 1c0
kjbdomhashcfg:entry i=565174 PID::entry:==pid4696:oracle:kjbdomhashcfg:entry 0 0 0 d730004 kjbdomfnd:entry i=565175 PID::entry:==pid4696:oracle:kjbdomfnd:entry 0 1 4f965520 ff 5 resume:off-cpu i=565176,process:4696,exec_name:oracle,On times(ms):0 resume:on-cpu i=565176,process:4696,exec_name:oracle,Sleep times(ms):0 resume:off-cpu i=565176,process:4696,exec_name:oracle,On times(ms):0 resume:on-cpu i=565176,process:4696,exec_name:oracle,Sleep times(ms):0 kslfre:entry i=565176 PID::entry:==pid4696:oracle:kslfre:entry 60018628 0 1 kjip2cln:entry i=565177 PID::entry:==pid4696:oracle:kjip2cln:entry 60018628
....................................................................................

RAC ONE
kjfzfdb

bash-3.2# mdb -p 3319

Loading modules: [ ld.so.1 libc.so.1

libnvpair.so.1 libuutil.so.1 ]

>

> kjfzfdb:b

> :c

mdb: stop at kjfzfdb

mdb: target stopped at:

kjfzfdb:

pushq %rbp

>

--bash--3.2$   sqlplus /  as  sysdba
SQL*Plus:  Release 1  1.2.0.4.0 P  roduction   on  Wed O  ct  28  02:15:19   2015
Copyright  (c)  1982,  2013,  Oracle.    All  rights  reserved.
Connected   to  an  idle  instance.
SQL>   SQL>startup
ORACLE  instance  started.
Total  System  Global  Area    371654656  bytes Fixed  Size                                    2250928  bytes Variable  Size                          239077200  bytes Database B  uffers                    125829120  bytes Redo  Buffers                                4497408  bytes

RAC ONE

kjfzfdb

bash-3.2# mdb -p 3319

Loading modules: [ ld.so.1 libc.so.1

libnvpair.so.1 libuutil.so.1 ] > kjfzfdb:b > :c

1SQL SQL>  select  sid,event,state from  v$session where  wait_class<>'Idle';

mdb: mdb:

sttaor"pgeatmtsoktvjofpwzpfeddb$at0:x1,0x8(%rax)"SID                  EVENT                                       "           r    a      x     +      8      "                                                                           STATE                            

kjfzfdb:pushq %rbp 1------------------------ -------------------------------------------------------------------------------------------------------------------------------------- ------------------------

>

25        SQL*Net  message  to  client                                WAITED  SHORT  TIME

> ::next

24        gc cr request                                                                                                                            WAITING                        

mdb: tarrgaextstopp"ed 0atx:547e71c8"8130"        C5G4S7  wea7i1t f do0r  "IPC  msg WAITED  SHORT  TIME    

k>jf:z:fndebx+t1:movq%rsp,%orrbapdebug154        gcs enter  server  mode                                                          

WAITING                        

mdb: tarSgQetL>st  ooprpaedd eabt:ug peek  

kjfzfdb+4:

pushq %rbx

0x547e71d0  1145321    

      gcs       gcs

enter  server  mode                                                             resource  directory  to  be  unfrozen      

WAITING                         WAITING                        

> ::next[0547E71D0,  0547E71D4)  =  000000064          gcs resource  directory  to  be  unfrozen    

WAITING                        

mdb: target stopped at:

138        ges enter  server  mode                                                            

WAITING                        

k>jf:z:fndebx+t5:subq$0x418,%rsp1

mdb: targetstoppedat: k...jfz...fdb...+9:......4...movl %edi,%ebx 

> ::next mdb: target stopped at:

kjfzfdb+0x7f: movw $0x1,0x8(%rax)

RAC ONE
poke1 
SQL>  oradebug poke  0x547e71d0  4  0x1 BEFORE:  [0547E71D0,  0547E71D4)  =  00000004 AFTER:    [0547E71D0,  0547E71D4)  =  00000001
DDL DML 
 CPU

RAC ONE
 0x547e71d0
#!/usr/sbin/dtrace --s  --n   char  *fz_lock;
dtrace:::BEGIN {
i=1; }
pid$1:::entry {
fz_lock=copyin(0x547e71d0,4); printf("%2x%2x%2x%2x",fz_lock[0],   fz_lock[1],  fz_lock[2],  fz_lock[3]); printf("i=%d  PID::entry:==%s:%s:%s:%s   %x  %x  %x  %x  %x  %x",i,  probeprov,  probemod,  probefunc,   probename,arg0,arg1,arg2,arg3,arg4,arg5); i=i+1; }

RAC ONE

LMON

........................

1 231865

lmutex_unlock:entry

1 231847 mutex_unlock_queue:entry

1 231816

clear_lockbyte:entry

1 230369 1 118502 1 57277

offtime_u:entry kjfzudb:entry kslgetl:entry

1 57284 1 57277

kslfre:entry kslgetl:entry

1 57284 1 57277 1 57284

kslfre:entry kslgetl:entry kslfre:entry

........................

[a 0 0 0] i=824402 PID::entry:==pid15512:libc.so.1:lmutex_unlock:entry [a 0 0 0] i=824403 PID::entry:==pid15512:libc.so.1:mutex_unlock_queue: [a 0 0 0] i=824404 PID::entry:==pid15512:libc.so.1:clear_lockbyte:entry [a 0 0 0] i=824405 PID::entry:==pid15512:libc.so.1:offtime_u:entry [a 0 0 0] i=824406 PID::entry:==pid15512:oracle:kjfzudb:entry 0 2050047 0 [4 0 0 0] i=824407 PID::entry:==pid15512:oracle:kslgetl:entry 54bbbc38 1 0 [4 0 0 0] i=824408 PID::entry:==pid15512:oracle:kslfre:entry 54bbbc38 d7311 [4 0 0 0] i=824409 PID::entry:==pid15512:oracle:kslgetl:entry 54bbbce8 1 0 [4 0 0 0] i=824410 PID::entry:==pid15512:oracle:kslfre:entry 54bbbce8 d7317 [4 0 0 0] i=824411 PID::entry:==pid15512:oracle:kslgetl:entry 54bbbd98 1 0 [4 0 0 0] i=824412 PID::entry:==pid15512:oracle:kslfre:entry 54bbbd98 d7317

kjfzudb0xa0x4 kjfzudbKjfzudb

RAC ONE



bash--3.2#  cat  ts1.d   #!/usr/sbin/dtrace --s  --n char  *memnr;

pid$1::kjfzfdb:entry

//  

{

freeze=vtimestamp;                      //    

}

pid$1::kjfzudb:return /  (memnr=(char  *)copyin($2,4))  &&  memnr[0]  ==  0x04  /                                                                    //   {
printf(" Total  time  of  Freeze:%15.3d",(vtimestamp--freeze)/1000);                      //   }

 ./ts1.d   3319 0x547e71d0

LMON





MySQL -- 
WITH_DEBUGMySQL
cmake . -DCMAKE_INSTALL_PREFIX=/usr/local/mysql/ \ -DDEFAULT_CHARSET=utf8 \ -DDEFAULT_COLLATION=utf8_general_ci \ -DENABLED_LOCAL_INFILE=ON \
........................ -DWITH_DEBUG=1
MySQL----debug /usr/local/mysql/bin/mysqld_safe ----defaults--file=/data/mysqldata/mysql1/my.cnf ----debug
MySQL [mysql@ocp ~]$  /usr/local/mysql/bin/mysql --usystem --pOracle1
Warning:  Using  a  password  on  the  command  line  interface  can  be  insecure. Welcome  to  the  MySQL  monitor.    Commands  end  with  ;  or  \g. ........................
mysql>  select  *  from  test.t1;
+------+--------+ | id | c1 | +------+--------+ | 1 | AAAAAA | | 2 | AAAAAA | | 3 | AAAAAA | | 4 | BBBBBB | +------+--------+ 4  rows i  n  set (  0.00  sec)

MySQL -- 
/tmp/  mysqld.trace
[root@ocp tmp]#  tail  --f  mysqld.trace T@1        :  |  |  |  <my_hash_free 159 T@1        :  |  |  |  >close_temporary_tables T@1        :  |  |  |  <close_temporary_tables 1559 T@1        :  |  |  |  >MYSQL_BIN_LOG::commit T@1        :  |  |  |  |  enter:  thd:   0x986e9f0,   all:  yes,  xid:  0,  cache_mngr:  0x0 T@1        :  |  |  |  |  >ha_commit_low T@1        :  |  |  |  |  |  >THD::st_transaction::cleanup T@1        :  |  |  |  |  |  |  >free_root T@1        :  |  |  |  |  |  |  |  enter:  root:   0x98701a0    flags:  1 T@1        :  |  |  |  |  |  |  <free_root 396 ..............................
DTraceOracle

Oracle OracleOracleMySQL 

MySQL -- 
OracleSelectFetch exec JOIN::execJOINexecMySQL
T@4        :  |  |  |  |  |  |  opt:   join_execution:  starting  struct T@4        :  |  |  |  |  |  |  opt:   select#:  1 T@4        :  |  |  |  |  |  |  opt:   steps:  starting  struct T@4        :  |  |  |  |  |  |  >JOIN::exec T@4        :  |  |  |  |  |  |  |  THD::enter_stage:  /root/mysql--5.6.26/sql/sql_executor.cc:110 T@4        :  |  |  |  |  |  |  |  >PROFILING::status_change T@4        :  |  |  |  |  |  |  |  <PROFILING::status_change 354 T@4        :  |  |  |  |  |  |  |  >JOIN::prepare_result
Oracle

MySQL -- 
OracleSelectFetch

[root@ocp gdb]# ps -ef|grep mysqld ............ mysql 5695 4809 7 /usr/local/mysql/bin/mysqld ­def ............ [root@ocp gdb]# gdb /usr/local/mysql/bin/mysqld 5695 GNU gdb (GDB) 7.10 Copyright (C) 2015 Free Software Foundation, Inc. ............ (gdb) (gdb) b JOIN::exec Breakpoint 1 at 0x7a2dbd:
file /root/mysql-5.6.26/sql/sql_executor.cc, line 99. (gdb) c Continuing.

Breakpoint 1, JOIN::exec (this=0xe3a4650)

at /root/mysql-5.6.26/sql/sql_executor.cc:99

99

Opt_trace_context * const trace= &thd->opt_trace;

[mysql@ocp ~]$  mys.sh Login  MySQL  Service:  localhost_3306 ............
mysql> mysql>  select  *  from  test.t1;

MySQL -- 

Breakpoint 1, JOIN::exec (this=0xe3a4650) at /root/mysql-5.6.26/sql/sql_executor.cc:99

99

Opt_trace_context * const trace= &thd->opt_trace;

(gdb) s

100

Opt_trace_object trace_wrapper(trace);

(gdb) n

101

Opt_trace_object trace_exec(trace, "join_execution");

96  void 97  JOIN::exec() 98  { 99      Opt_trace_context *  const trace= &  thd-->opt_trace; 100      Opt_trace_object trace_wrapper(trace); 101      Opt_trace_object trace_exec(trace, "  join_execution"); 102      trace_exec.add_select_number(select_lex-->select_number); 103      Opt_trace_array trace_steps(trace, "  steps"); 104      List<Item> *  columns_list=   &fields_list;                                                                                                                                                                                                                                                          105      DBUG_ENTER("JOIN::exec"); 106   107      DBUG_ASSERT(!tables |  |   thd-->lex-->is_query_tables_locked()); 108      DBUG_ASSERT(!(select_options & S  ELECT_DESCRIBE)); 109   110      THD_STAGE_INFO(thd,  stage_executing); 111   112      //  Ignore e  rrors  of  execution  if  option  IGNORE p  resent


Ø OracleSolarisRAC Ø MySQLgdb

IT
eBaySenior  Oracle D  BA,    

1MySQL ------ gdb

[root@ocp gdb]# ./gdb --args /usr/local/mysql/bin/mysqld

GNU gdb (GDB) 7.10 Copyright (C) 2015 Free Software Foundat...

............

(gdb) set target-async 1

(gdb) set pagination off

(gdb) set non-stop on

(gdb) b JOIN::exec

(gdb) run

............

[New Thread 0x4be94940 (LWP 5079)]

[New Thread 0x4bed5940 (LWP 5085)]

(gdb) info threads

Id Target Id

Frame

24 Thread 0x4bed5940 (LWP 5085) (running)

* 23 Thread 0x4be94940 (LWP 5079) (running)

............

(gdb) delete

Delete all breakpoints? (y or n) y

(gdb) b read_view_open_now thread 23

Breakpoint 2 at 0xc429ca: file

/root/mysql-5.6.26/storage/innobase/read/read0read.cc, line 386.

(gdb) thread apply 23 c

Breakpoint 2, read_view_open_now

at /root/mysql-5.6.26/storage/innobase/read/read0read.cc:386

386

mutex_enter(&trx_sys->mutex);

(gdb) thread apply 23 step

............

(gdb) thread apply 23 step

84

return(os_atomic_test_and_set_byte(&mutex->lock_word, 1));

(gdb) thread apply 23 next

............

Thread 23 (Thread 0x4be94940 (LWP 5079)):

390

mutex_exit(&trx_sys->mutex);

[mysql@ocp ~]$  mys.sh Login  MySQL  Service:  localhost_3306 ............ mysql>   mysql>  select  *  from  test.t1;
[mysql@ocp ~]$  mys.sh Login  MySQL  Service:  localhost_3306 ............ mysql> mysql>  use  mysql mysql>  select  *  from  mysql_t3;
+------+----------+ | id | name | +------+----------+ | 1 | AAAAAA | | 2 | BBBBBBBB | | 3 | CCCCCC | +------+----------+ 3 rows in set (0.02 sec)
mysql>  select  *  from  mysql_t3;
+------+----------+ | id | name | +------+----------+ | 1 | AAAAAA | ............ +------+----------+ 3 rows in set (0.02 sec)

2Solaris   RAC
 1. Solaris 2.  3. 

2Solaris   RACCluster

2Solaris   RACCluster

2Solaris   RACCluster

2Solaris   RACCluster

2Solaris   RACCluster

2Solaris   RACCluster

2Solaris   RACCluster

2Solaris   RACCluster

2Solaris   RACCluster

2Solaris   RACCluster

2Solaris   RACCluster

2Solaris   RACCluster

2Solaris   RACCluster

2Solaris   RACCluster

2Solaris   RACCluster

2Solaris   RAC

2Solaris   RAC

2Solaris   RAC

2Solaris   RAC

2Solaris   RAC

2Solaris   RAC
 RAC

2Solaris   RAC

2Solaris   RAC

2Solaris   RAC

2Solaris   RAC

 





Oracle

z3 ­ SQL

zData ­ 

BayMax

 

