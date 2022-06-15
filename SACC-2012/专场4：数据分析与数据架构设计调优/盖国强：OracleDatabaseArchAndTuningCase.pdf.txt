A-PDF Watermark DEMO: Purchase from www.A-PDF.com to remove the watermark

YUNHE ENMO (BEIJING) TECHNOLOGY CO.,LTD
Oracle 

SSAACCCC22001122


 ( Eygle ) :13911812803 :eygle@enmotech.com :weibo.com/eygle

Who am I
   
 Oracle ACEACE  10Oracle

 ITPUB 201110 2010Oracle DBA
 2010 OracleACOUG ­ All China Oracle User Group


SSAACCCC22001122


-




        ­O  ­IE

       TCO

-
SSAACCCC22001122


-

IBM P570/AIX*2

Cisco UCS

B440M2/Linux*6



ORACLE

GoldenGate

 expdp/impdp

4*path from storage array to server

Brocade SAN Switch

IBM DS 8100 Disk Array


 Oracle RAC
599T
4 Active UCS 2Standby
201112AS
20123Partner  201244 

-

SSAACCCC22001122



 ExpExpdp / Imp ImpDP
 DB LinkCTAS INSERT
 SQLLdr  Transport Tablespace  MV Refresh  Trigger

 - · 31
­  ­  ­ 


-
SSAACCCC22001122


-

Instance

Shared Pool Server Result
Cache
Library Cache
Data Dictionary Cache

SGA

Database Buffer Cache
Java Pool

Redo Log Buffer
Streams pool
Large Pool

PMON

SMON

DBWR

LGWR

CKPT

Others
Latch:Oracle  Latch:shared Pool  Latch:Library Cache  Latch:Row Cache Objects



LatchCPU 100%
SSAACCCC22001122


-CPU
LatchOracle


-CPU
SSAACCCC22001122


Oracle - 


Latch:row cache objects

SQL A

SQL A

SQL A

Latch:row cache objects

Latch: row cache objects

SSAACCCC22001122


cursor pin S wait on X

SQL A

SQL A

SQL A

cursor pin S wait on X
Pin S

Latch: row cache objects

SQL A

On X



What mean Latch Free?
SSAACCCC22001122


Row Cache Gets


CPU
SSAACCCC22001122


 ­ 


 ­ Log file Sync
SSAACCCC22001122


Log file sync - Core
Oracle Core Essential Internals for DBAs and Developers


 ­ Log file Sync
SSAACCCC22001122


 ­ Log file Sync


Wait: Log File Sync

Commit A

Commit B
LGWR

Commit C

Latch: redo writing

SSAACCCC22001122


Wait: Log File Sync

Commit A

Commit B

Commit C

Log File Sync

Wait:Log File Sync
(2s)

Latch: redo writing

Commit A

log file parallel write (1s)



  · Oracle · Oracle ·  · 
SSAACCCC22001122


Q&A


