Twitter 



2003 2005University of North Carolina Chapel Hill 20057Google 20113Twitter Twitter

@wangtian

www.twitter.com/wangtian www.linkedin.com/in/wangtian

Twitter
· 2008Summize · FacetsTerm... · ... · 6700 · Twitter
· WebAndroidiOSTweetDeck... · API
·  · GNIP

2008 ~ 2009


Monorail


Firehose

Ingester

MMyySSQQLL ((MsslalyavSveQe))L

·  ·  ·  · 

Timeslice table

MySQL Index

Timeslice tabel

Timeslice table

Timeslice table




 ·  ·  · 
 ·  ·  ·  · 

Lucene
· APIposting list ·  ·  ·  ·  · 
· query · Lucene query · query
· time partitionhash partition · 5ms · 10x · Lucene

Search Query

Raw Query

apple iphone filter:images near:me 



Serialized Query

(* apple iphone [filter images] [geocode 33.4 -128.2 25km]) query

Query Annotation and Rewriting

Rewritten Query

(* (+ (* apple iphone :w:2.0) @appleiphone :user :v:0.3) [filter images] [geocode 33.4 -128.2 25km])

Lucene Query Buildingqueryquery

query

Lucene Query

(MUST:text:apple MUST:from_user:apple^0.4) (MUST:text:iphone MUST:from_user:iphone^0.4) MUST:internal:__has_images GeoQuery(...)
Lucene *

Earlybird2010
· Earlybird(Indexer) (Index Server)
· MySQL 
· Earlybird partition

 Firehose

Ingester
 

MySQL (master)

M(M(Ms(yslysalSyalSvQaSvQevQe)eL)L)L

 



Monorail


 

 partition

(Ep(Ep(aEapaarraarlrtyrlritytblityitbiioitrbioinrdoindr)n)d)
 



Earlybird

Client

Earlybird


MySQL (slave)



Segment 4

Segment 3

Segment 2

Segment 1

Segment 0





Segment: Lucene Index Posting Listdocuments

Blender2011

· Earlybird · ... · workflow* · 
·  · service · 




JSON
API Macaw-Search
(Scala)

Web (Scala)



Thrift



Blender
Thrift

 


Firehose

Ingester
 

MySQL (master)

M(M(Ms(yslysalSyalSvQaSvQevQe)eL)L)L

 

(Ep(Epaa(Eaparraralrtyrlrtiytblitytibiiotibrioinrdoinrd)nd))
 



cluster

·  ·  · 
· 



JSON
API Macaw-Search
(Scala)

Web (Scala)



Thrift



Blender

 


 

(Ep(EpaaREaarraerlrtyrlatiytblilytibtioibiriomnrdinrd)ed)

(Ep(EpPaaEaarrrarlrotyrltiyttbliyetibioibcrionrdtinrde)d)d



Root
· partition · Root · cluster




JSON
API Macaw-Search
(Scala)

Web (Scala)

Thrift



Blender

 

Root (Ep(EpaaREaarraerlrtyrlatiytblilytibtioibiriomnrdinrd)ed)

Root (Ep(EpPaaEaarrrarlrotyrltiyttbliyetibioibcrionrdtinrde)d)d


·  · Twitter20066700
 · Realtime
 · 
 · 2% Top (in-memory serve) · 16% Top (SSD) · Full Index (SSD) ·  · 



JSON
API Macaw-Search
(Scala)

Web (Scala)

Thrift



Blender

 

Root

Root

Root

Root

(Ep(EpaaREaarraerlrtyrlatiytblilytibtioibiriomnrdinrd)ed)

(Ep(EpPaaEaarrrarlrotyrltiyttbliyetibioibcrionrdtinrde)d)d

(Ep(EpaaEaarrarlrtyrltiy2tbliytib%ioibrionrdinrd)d)

(Ep(EpaaEaarrarlrtyr1ltiytbli6ytibio%ibrionrdinrd)d)


·   
· cluster



JSON
API Macaw-Search
(Scala)

Web (Scala)

Thrift



Blender

 

Root

Root

Root

(Ep(EpaaREaarraerlrtyrlatiytblilytibtioibiriomnrdinrd)ed)

(Ep(EpPaaEaarrrarlrotyrltiyttbliyetibioibcrionrdtinrde)d)d

(Ep(FEpauaEaarrlalrlrtyrlAtiytbliytibrioibrcionrdhinrd)id)ve

Full Archive Index
·  · 3 · tiertier · tier · IDpartition

Root





EEaarrlylybbirirdd (p(paarTrttiitietiorion2n)) 

EEaarrlylybbirirdd (p(paarrtTtitiitieoiornn))

EEaarrlylybbirirdd (p(paarTrttiitietiorion0n))  Full Archive Index Clusters

Full Archive Build Jobs (Scalding)

Superroot
·  · cluster
client  · 



JSON
API Macaw-Search
(Scala)

Web (Scala)

Thrift



Blender
Superroot

 

Root

Root

Root

(Ep(EpaaREaarraerlrtyrlatiytblilytibtioibiriomnrdinrd)ed)

(pE(pEPaaEaarrrarrotlrytilttylibyetiboiibcrointridnred)d)d

(Ep(FEpauaEaarrlalrlrtyrlAtiytbliytibrioibrcionrdhinrd)id)ve



Firehose

Ingester

MySQL (master)

M(M(sM(sylsyalSyalSvaQSveQveQ)eL)L)L

(Ep(Epaa(Eaparraralrtyrlrtiytblitytibiiotibrioinrdoinrd)nd))

Firehose Firehose

Ingester

MySQL (master)

Ingester

Kestrel

...

Indexer
 

M(M(sM(sylsyalSyalSvaQSveQveQ)eL)L)L

(Ep(Epaa(Eaparraralrtyrlrtiytblitytibiiotibrioinrdoinrd)nd))

HDFS



 

Kestrel
HDFS

(Ep(Epaa(Eaparraralrtyrlrtiytblitytibiiotibrioinrdoinrd)nd))

  

Firehose

Ingester

DL*

Indexer

DL

HDFS *DL: DistributedLogTwitterApache BookkeeperHDFS

(Ep(Epaa(Eaparraralrtyrlrtiytblitytibiiotibrioinrdoinrd)nd))

 



Firehose

Ingester

DL*

Indexer

Firehose Socialhose 

Updater (Java)

DL
HDFS

(Ep(Epaa(Eaparraralrtyrlrtiytblitytibiiotibrioinrdoinrd)nd))

DL 

 

Gizmoduck

User Table Updater

DL 



Firehose

Ingester

DL*

Indexer

ClientEvents Firehose Socialhose


Signal Ingester (Heron*)

DL
HDFS

(Ep(Epaa(Eaparraralrtyrlrtiytblitytibiiotibrioinrdoinrd)nd))

schema

DL 

  

Gizmoduck

User Table Updater

DL 

*Heron TwitterStorm


Blender

Workflow

Blender
Workflow 1 Workflow 2 Workflow 3

· BlenderWorkflow
· Blender 
· Workflow 
· WorkflowDAG 
· BlenderWorkflowID 

Blender
Blender

Input

Workflow

Batch 1

service 1

service 2 Batch 2

service 3

service 4

service 5

service 6

Batch 3 Batch 4

service 7

Output

· DAG · service · DAGbatch

·  · 
 ·  ·  · 


BlenderFinagle
Blender

Input

Workflow Future 1

Future 2

Future 3

Future 4

Future 5

Future 6

Future 7 Output

· FinagleTwitter 
· Future 
· Future 
· Future 
· Future · map · flatMap · collect · join ·...
·  ·  ·  ·  ·  · 

BlenderNodes
Blender

Input

Workflow Node 1

Subgraph Node 2 Node 3

Node 4

Node 5

Node 6 Node 7 Node 8

Output

· FinagleFuture
· Node  
· SubgraphNode 

·  ·  ·  ·  ·  ·  · Blender
 · Overhead

Node

A B C D Node Output

Workflow

Blender

Workflow 1 Workflow 2 Workflow 3

· Workflow · 40workflow
·  
·  · Workflow · Workflow Workflow · Blender* workflow

WorkflowAdaptive Workflow
· Twitter · Twitter? · 1000 · 230ms · 15000

Blender

Blender X
Workflow A Workflow B

Blender Y
Workflow C Workflow D Workflow E

· BlenderWorkflow 
· Workflow · Blender · Blender
· Blender 
·  ·  · Workflow 

· Blender-adaptiveTwitter · Blender-searchAPI · Blender-typeaheadTypeahead ·...

Twitter

Search-as-a-Service Macaw-search (Scala)



 



2006

2007

...





Monorail (Ruby)

Blender (Java) DAG
2a

Blender

Blender

Finagle Nodes/Finagle

Roots

Superroots

MySQL Index

1
Earlybird: Lucene Index

ExpertSearch

Timeline Index

(User Index)

Discover Index

Facets

News

Flexible Schema

Archive Index Archive Index Archive Index

1

2

3

2008

2009

2010

2011

2012

2013

2014

2015

Recency Search API Support (internal, external)

Relevance Search

2b

Universal Search

Onebox

3

Adaptive Search

Events

TypeAhead

Realtime Updater Search Assistance

4
Realtime Signal Ingester


· Earlybird ·  ·  ·  · 
· Blender ·  ·  · 


 · Unit Test · Local End-to-end Test · Smoke Test () · Quality Smoke Test · Failover Test · Stress/Redline Test
 ·  · canary · dark read · 
·  ·  · JIRA ticket · DDG

 ·  ·  · /

 · Runbook ·  · 

 ·  ·  ·  ·  · /
· 

Q &A


