Copyright  ©  2015  Splunk  Inc.  
Splunk  and  Spark  
Liu--yuan  Lai  
So;ware  Engineer,  Splunk  

Disclaimer  
During  the  course  of  this  presentaEon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauEon  you  that  such  statements  reflect  our   current  expectaEons  and  esEmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaEon  are  being  made  as  of  the  Eme  and  date  of  its  live   presentaEon.  If  reviewed  a;er  its  live  presentaEon,  this  presentaEon  may  not  contain  current  or   accurate  informaEon.  We  do  not  assume  any  obligaEon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiEon,  any  informaEon  about  our  roadmap  outlines  our  general  product  direcEon  and  is  subject  to   change  at  any  Eme  without  noEce.  It  is  for  informaEonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaEon  either  to  develop  the  features  
or  funcEonality  described  or  to  include  any  such  feature  or  funcEonality  in  a  future  release.  
2  

Agenda  
!  Background:  Spark   !  MoEvaEon   !  Spark  on  Splunk  ­  Splunk  data  as  Spark  external  dataset   !  Splunk  with  Spark  ­  Extend  Splunk  search  with  Spark's  compuEng  
power  

Review:  Spark  basics  

What  is  Spark?  
!  "Apache  Spark  is  a  fast  and  general--purpose  cluster  compuEng   system."  
!  Abstract  data  as  a  distributed  collecEon  of  RDD  that  can  be  operated   in  parallel.  
!  RDD  have  operaEons  
­ TransformaEons:  create  a  new  dataset  from  an  exisEng  one   ­ AcEons:  return  a  value  a;er  running  a  computaEon  on  the  dataset.  

Spark  RDD  
source:  kmoses  

Spark  Stack  
source:  apache  spark  

Spark  Streaming  
source:  apache  spark  

Spark  on  Splunk  

What  Splunk  Brings  To  Spark  

Splunk  
· Great  support  on  data  ingesEon   · Unstructured/semi--structure  data  
indexing   · Powerful  runEme  data  `wrangling'  
through  splunk  search  language  
­ evenbypes   ­ fields  extracEons   ­ tags   ­ lookups  

Spark  supported  datasets  
· Local  filesystem   · Hadoop  HDFS   · Cassandra   · Hbase   · Amazon  S3  

Spark  on  Splunk  
! SplunkRDD  
­ RDD  from  splunk  search  results     
! SplunkDStream  
­ DStream  from  splunk  realEme  search  
! SplunkUEls  
­ createRDD   ­ createStream  

Demo  
Bubercup  Games  (limited  in  preview,  will  enrich  the  content)  

Splunk  with  Spark  

Beyond  Data  Processing  
!  Ability  to  perform  analysis  and  machine  learning  on  data  
!  Challenges:  
­ Algorithms  could  be  complex  and  not  expressible  by  splunk  search  language   ê Custom  search  commands  
­ Wide  variety  of  models  and  algorithms   ê Search  commands  overload  
­ Dataset--dependent   ê Search  command  parameters  overload  
­ Repeated  trial,  training,  tesEng  and  fine--tuning  

Extend  Splunk  with  Spark  
!  Distributed  compuEng  for  complex  operaEons   !  Impressive  arsenal  by  Spark  stack  is  readily  available   !  Users  write  their  own  spark  programs  tailored  to  their  dataset   !  Connect  other  data  sources,  through  RDD/DStream  

Problem  Statement  
!  Study  data   !  Experiments  
­ Select  algorithms/models   ­ train   ­ Test   ­ Validate  
!  Apply  to  producEon   !  Monitor  and  fine--tune  

Design  Goal  
Make  it  natural  to  perform  analysis  and  learning  in  splunk  
!  þStudy  data   !  Experiments   !  ProducEon   !  *Monitor   !  *Fine--tune  

Design  Choices  
!  Integrate  spark  into  splunk  search  language  
­ Spark  becomes  an  extended  context  of  Splunk  for  complex  computaEons  
!  Simple  command  interface   !  Do  not  impose  limitaEons  on  operaEons  that  can  be  run  on  Splunk  
events   !  Do  not  run  user  codes  within  splunk  process   !  InteracEve  inspecEon  and  tuning   !  Splunk  for  ML  `Experiment'  management  

Approach  
!  Search  command  "sparkit"  
­ starEng  point  to  distribute  search  pipeline  results  to  spark  
! SplunkPipeRDD  
­ RDD  that  pulls  data  from  search  pipeline  (sparkit)  
!  Custom  RDD  operaEon  "beamUp"  
­ Push  computaEon  results  to  search  pipeline  (sparkit)  

Architecture  

Search pipeline

splunk index sparkit

Search pipeline

Spark driver
RDD Operations

Events

beamUp

SplunkPipeRDD
RDD Operations spark worker

SplunkPipeRDD
RDD Operations spark worker

SplunkPipeRDD
RDD Operations spark worker

ImplementaEon  
ØMQ  for  communicaEng  data  and  results      sparkit
PUSH events

PULL SUB Worker PUSH

PULL SUB Worker PUSH
results
PULL sparkit (sink)
PUB

PULL SUB Worker PUSH
STOP signal

Demo  
!  (limited  in  preview,  will  enrich  before  .conf)  

Future  Works  --  Features  
!  Splunk  for  ML  `Experiment'  management  
­ Index  `sparkit'  results  into  a  separate  index,  each  run  given  some  sort  of  id  
!  Use  IPython  kernel  approach  (spark  kernel)  for  beber  flow  control   ! DataFrame   !  ML  model  or  "computaEon"  registraEon  

ML  Management  
!  Write  results  to  `experiment'  index  
­ Enables  tapping  in  realEme  or  post--mortem  
!  Search  by  job--id  to  retrieve  tesEng/training/producEon  results  for   further  invesEgaEon  
!  Add  metadata  for  experiments  management  

Spark  Kernel  
source:  spark  kernel  project  

DataFrame  and  SparkSQL  

!  "Spark  SQL  is  a  Spark  module  for  structured  data  processing.  It   provides  a  programming  abstracEon  called  DataFrames  and  can  also   act  as  distributed  SQL  query  engine."  

! DataFrame:  SQL/table--like  query  and  operaEons;  enables  many  new   opEmizaEons  starEng  Spark  1.5  

df.select(df("name"),  df("age")  +  1).show()  

//  name        (age  +  1)  

  

//  Michael  null  

//  Andy        31  

//  JusEn    20  

! SplunkRDD  automaEcally  create  schema  from  extracted  fields  

Future  Works  --  Technical  
! SplunkContext(?)  
­ auto--discover  mundane  seongs  
!  Splunk  indexer  and  search--head  clustering  environment   !  Performance,  scalability   !  Fault  tolerance,  stability  

THANK  YOU  

