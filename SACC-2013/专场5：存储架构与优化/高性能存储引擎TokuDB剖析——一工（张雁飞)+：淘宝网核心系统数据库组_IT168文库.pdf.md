TokuDB


· @ ·  · logN.me · @BohuTANG_ · Gtalk: overred.shuttler@gmail.com


· TokuDB · TokuDB · TokuDB · 

TokuDB

·

(2007--2013open source)

· 511(MIT)

· MySQL/MariaDBGPL

TokuDB / =  + /

TokuDB
B-tree
B = 16KB 50GB / 16KB ~ 300wnode 

TokuDB
Fractal-Tree® 
B = 4MB (~1MB) 50GB / 4MB ~ 1wnodenode

· node4-16 · nodemessage buffer · message bufferFIFOcmp · message bufferOMT

INSERT

TokuDB
· Fractal-Tree® TokuTek · Buffer-Tree"" · Buffer-TreeLars · TokuDB:CPU+Memory

TokuDB
message buffer

TokuDB
· Insert/Update/Delete/Columnmessage · lazyFlushleaf · undo log · Fast insert/ Fast update

TokuDB

TokuDB
· node · IOPSSSD

TokuDB
Log
· log managerlogInnoDBrotate log · log: in bufferout buffer · group commit · redo log 

TokuDB
Transaction
· ACID · Fractal-treeundo log · LeafMVCC · (live transaction) · tokudb.rollback

TokuDB
CheckPoint · sharp checkpoint ·  · Begin checkpoint:
1) nodepending 2) checkpointLSN · End checkpoint: 3) dirty node 4) ft meta · Crash

TokuDB
Hot Schema
· Add/Delete Column messageBROADCAST · Lazy · nodeBROADCAST

TokuDB
Indexing
·  a) clustering index b) covering index
· fractal-tree · foo:

TokuDB
Indexing covering index:

keycovering keyvalue

TokuDB
Indexing clustering index:


TokuDB
Indexing
Covering index
VS
Clustering index
·  · Clustering index · Clustering index


· select count · affected rows

Thanks!

