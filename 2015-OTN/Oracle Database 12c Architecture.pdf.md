Oracle Database 12 Architecture Oracle 12 

VKRM
Virtual Schedule for Resource Manager

RCBG
Result Cache

MMAN
Memory Manager

MMON
Manageability Monitor

MMNL
Manageability Monitor Lite

PMON
Process Monitor

SMON
System Monitor

REC0
Recovery Process

SAnn
SGA Allocator

DBRM
Database Resource Manager

Server Process

GEN0
General Task Execution

VKTM
Virtual Keeper of TiMe

PSP0
Process Spawner

AQPC
AQ Process Coordinator

SMCO Wnnn
Space Management Coordinator
RSMN
Remote Slave Monitor
IPC0
IPC Service
LCK0,1
Lock Process
LMD0,Z
Global Enqueue Service
LMHB
GlobalCache Enqueue Heartbeat Monitor
RMSN
RAC Management Process



Library Cache
Shared SQL Area
Hash value SQL source Execution plan

Least Recently Used (LRU) List

Cold

Hot

User Global Area(UGA) for Shared Server

Checkpoint Queue Low RBA order

Data Dictionary Cache

ASH Buffers

Result Cache

In-memory Undo (IMU)

Reserved Pool Enqueues Latches

Flash back Buffer

Private Redolog Buffers

Global Resource Directory (RAC Only)

ges big msg buffers

gcs res hash bucket

ges resource

gcs master ship bucket

ges shared global area gcs resources

ges process array

gcs shadows

ges enqueues

gcs affinity

ges reserved msg buffers

Pnnn
Parallel Query Slaves

Shared Server

Snnn
Shared Server

Dnnn
Dispatchers

heap (1,0) heap (1,1) heap (1,2) heap (1,3)

SUB Shared Pool

SUB Shared Pool

SUB Shared Pool

SUB Shared Pool

SUB Shared Pool

SUB Shared Pool

Flash Buffer Area
DEFAULT flash LRU chain

 (SGA)


Row Format

Buffer Pools
Default

Non Default Buffer Pools

8 k

2 k

16 k

Keep flash LRU chain

4k

32 k

Keep

Recycle

In Memory Area

Column Format

IMCU

IMCU

IMCU

IMCU

IMCU

IMCU

IMCU

IMCU

Column Format Data

SMU

SMU

SMU

SMU

SMU

SMU

SMU

SMU

Metadata

Pure In-Memory Columnar

Redo Log Buffer

Large Pool
Response Queues
Request Queue
Oracle XA Interface Pool
Backup/Recovery Operations
Private SQL Area for Shared servers

Shared I/O Pool
Streams Pool
Java Pool
Used Memory
Free Memory

PX msg pool

Fixed SGA

RVWR
Recovery Writer

TMON
Transport Monitor

FBDA
Flashback Data Archiver

DBW0..Z
BW36..99
Database Writer

CKPT
Checkpoint Process

LREG
Listener Registration Process

(PDB)



 

sys

Public

Root
Oracle Supplied Common Users/Schemas/Objects

CDBA



Customer Common Users



SYSTEM

SYSAUX

UNDO (global)

TEMP temp undo



(global)

PDB$

SYS

SEED

SYSTEM SYSAUX
Public

PDB ERP

CDBA

SYS

SYSTEM SYSAUX

ERP

Public

ERP

EMP

PDB DW

CDBA

SYS

SYSTEM

SYSAUX

TEMP DW

Public

DW

PDB CRM

CDBA

SYS

SYSTEM SYSAUX TEMP CRM

Public

CRM

ACMS
Atomic Control File to Memory Service

CTWR
Change Tracking Writer

LGWR LG00-99
Redo Log
Writer

TT00-zz
Redo Transport Slave

ARCn
Archiver Process n=0..9 or n=a..t
31 possible destinations

Flashback Logs
Flashback Thread
Flash Cache

Flash Recovery Area

Database Area

Control Files

Server Parameter
File

Change Tracking
File

Group Redo Log Files
Redo Thread
Archived Redo Log
Files

QMnn
AQ Master Class
Qnnn
AQ Server Class
CJQ0 Jnnn
Job Queue Coordinator
OFSD
Oracle File Server
RM
RAT Masking Slave
RPnn
Capture Process Worker
MARK
Mark AU for Resynchronization Coordinator

PING
Interconnect Latency Measurement
LMON
Global Enqueue Service Monitor
LMS0-z
Global Cache Service

User Process
Cursor

Database Resident Connection Pooling
Lnnn
Pooled Server Process

Listener

Server Process

Dump File

DWnn
Data Pump Worker

 (PGA)

SQL Work

Nnnn
Connection Broker Process

Dedicated Server

Sort Area Hash Area Bitmap Merge Area

User Global Area (UGA)

Session Variables

OLAP Pool

Private SQL Area

Persistent Runtime

Area

Area

DMnn
Data Pump Master
MML
Or
OSB
Tape
Cloud

Recover RMAN Table Process

DIAG
Diagnostic Capture Process

Image Copies Or
Backup Sets

Automatic Diagnostic Repository (ADR)

SCMN
Thread Listener
DIA0
Diagnostic Process
PRnn
Parallel Recovery Process

SCMN
Thread Listener

async

sync

OCFn
ASM CF
Connection Pool

12.1 Stanby Database
ENMO
Your Best Choice

Far Sync Instance

RBAL
ASM Rebalance Master

EMNC
EMON Coordinator

Onnn
ASM Conection Pool

Make Your Data Dance

()
YUNHE ENMO (BEIJING) INFORMATION TECHNOLOGY CO.,LTD.

4006608755
www.enmotech.com

     













enmotech ORA

enmoedu

 Oracle 







 RAC 

 Oracle 12c 

Oracle Database 12c ArchitectureIMCShttp://www.oracle.com/webfolder/technetwork/tutorials/obe/db/12c/r1/poster/OUTPUT_poster/pdf/Database%20Architecture.pdf

