Copyright  ©  2015  Splunk  Inc.  
Splunk...so  Big  and  Flashy  
Building  Massive  and  Efficient  Indexer  Storage   Environments  for  Splunk  
Cory  Minton  
Principal  SE  and  Data  Fabrics  Leader,   Emerging  Technologies  @  EMC  

Disclaimer  
During  the  course  of  this  presentaMon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauMon  you  that  such  statements  reflect  our   current  expectaMons  and  esMmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaMon  are  being  made  as  of  the  Mme  and  date  of  its  live   presentaMon.  If  reviewed  aTer  its  live  presentaMon,  this  presentaMon  may  not  contain  current  or   accurate  informaMon.  We  do  not  assume  any  obligaMon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiMon,  any  informaMon  about  our  roadmap  outlines  our  general  product  direcMon  and  is  subject  to   change  at  any  Mme  without  noMce.  It  is  for  informaMonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaMon  either  to  develop  the  features  
or  funcMonality  described  or  to  include  any  such  feature  or  funcMonality  in  a  future  release.  
2  

These  ARE  The  Droids  You  Are  Looking  For...  

Agenda     
!  Data  and  Storage  Tech  Trends   !  Splunk  Architecture   !  Why  Flash  Your  Home  Path?   !  The  Big,  Cold  Data  Lake   !  Converged  SoluMons   !  Resources  ­  Sweet  Apps  and  Ninjas    

Data  Growth  

80%  
78%  
75%  

Source:  IDC    

2015  

2016  

2017  

71  EB  

106  EB  

  133  EB  

Total  Capacity  Shipped,  Worldwide  

%  of  Unstructured  Data  

5  

Do  More  With  Less...  

Architecture  Maaers...  

Scale-up

Scale-Out

Enter  SPLUNK  ENTERPRISE      Industry--leading  Plaform  For  Machine  Data  

Any  Machine  Data  

Opera2onal  Intelligence    

Datacenter  
Private     Cloud  
Public     Cloud  

Online   Services  

Servers  

Security  

Storage  

Desktops  

Web   Services  

Networks  

GPS   LocaMon  

Packaged   ApplicaMons  

Online   Shopping  Cart  

Telecoms  

RFID  

Messaging  

Energy  Meters  

Custom   ApplicaMons  

Web   Clickstreams  

Databases  

Smartphones  and   Devices  

Call  Detail  Records  

Search  &   InvesMgaMon  
Enterprise   Scalability  

ProacMve   Monitoring  

OperaMonal   Visibility  

Real--Mme   Business   Insights  

Splunk  Architecture  
Search  Heads  
Query  informaMon  across  indexers  and  are   usually  CPU  and  memory  intensive.  
Indexers  
Write  data  to  disk  and  are  both  CPU  and  I/O   intensive.    
Forwarders  
Collect  and  forward  data;  usually  lightweight   and  not  resource  intensive.  
hap://docs.splunk.com/DocumentaMon/Splunk/latest/Overview/AboutSplunkEnterprisedeployments  

Splunk  Storage  Requirements  
Enterprise  Performance  And  Data  Services  

!  High--Performance  Storage                
­ Rare  &  Sparse  Searches  
!  High--Capacity  Storage                              
­ Long--Term  RetenMon  
!  Scale--Out  Infrastructure                    
­   Indexer  &  Search  Heads  
!  De--dupe  &  Compression      
­ Clustered  Indexer  Deployments  
!  Backup  &  Security                                        
­ Data  ProtecMon  &  Compliance  

Search  Heads   Indexers  
HOT   WARM   COLD  

Capacity  Triggered  

Splunk  Indexer  Buckets  

HOT  /  WARM  
· Recent  searches/dashboards   · Usually  block  LUN   · High  Random  reads   · SequenMal  reads  /  writes  

COLD  
· Rare  searches   · Usually  NAS  share   · Light  Random  Reads   · SequenMal  reads  /  writes  

FROZEN  
· Not  searchable   · Usually  offline  media   · Only  sequenMal  write  

Splunk  moves  indexes  from  between  from  hot/warm  to  cold  to  frozen  based  on  user  configura2on      Size  of  the  buckets  impacts  performance     

Indexer  Storage  Capacity  

Raw  Data  

1TB  Ingested  Data  

WriWen  Data    
=    ½  Ingested  Data   =  500GB    
  
Indexes  

*.gz  

Indexer  

*.tsidx  

Compressed  Raw  data    
30%  of  wriaen  data   à  150GB    

Uncompressed  `indexes'  
70%  of  wriaen  data   à  350GB    

How  Much  Storage  Do  You  Need?  

=  Daily  indexing  rate         x  ½    
      x  Reten8on  policy    
Raw  Data  

1TB  Ingested  Data  

   =  1TB  x  ½  x  60  days  =  30TB  
  

Indexer  

Indexes  

9TB  

21TB  

Splunk  Indexer  Availability  

MulMple  copies  of  index  and  raw  data  
ê Index  à  #  copies  of  indexes  à  Search  factor  (SF)   ê Raw  Data  -->  #  of  of  copies  of  raw  data  à  ReplicaMon  factor  (RF)    

    

Copy 1 500GB

Copy 2 Copy 2 500GB 500GB

Copy 1 500GB

1TB  *  60  days  x  ½  x  2     =  60TB  (RF/SF=2)  **  doubled  **     

1TB  *  60  days  x  ½  x  3    

=  90TB  (RF/SF=3)  **  tripled  **    

  

STORAGE  CAPACITY    

1TB Ingested Data            
SF=2  /  RF=2 500GB written à 500GB replicated

MULTIPLIES!  

Just  How  Much  Storage?  

Splunk  License  (GB/DAY)  

Storage  Requirements  in  TB  

RetenMon  (Days)   25   50  
100   250   500   1000   2000   3000   4000   5000   6000   7000   10000  

  

1  

7  

0.025   0.175  

0.05   0.35  

0.1   0.7  

0.25   1.75  

0.5   3.5  

1  

7  

2  

14  

3  

21  

4  

28  

5  

35  

6  

42  

7  

49  

10  

70  

14   0.35  
0.7   1.4   3.5  
7   14   28   42   56   70   84   98   140  

30   0.75  
1.5   3  
7.5   15   30   60   90   120   150   180   210   300  

90   180   2.25   4.5  
4.5   9   9   18  
22.5   45   45   90   90   180  
180   360   270   540   360   720   450   900   540   1080   630   1260   900   1800  

1  Year   365  
9.125   18.25  
36.5   91.25   182.5  
365   730   1095   1460   1825   2190   2555   3650  

2  Years   730  
18.25   36.5   73  
182.5   365   730  
1460   2190   2920   3650   4380   5110   7300  

3  Years   1095  
27.375   54.75   109.5  
273.75   547.5   1095   2190   3285   4380   5475   6570   7665   10950  

4  Years   1460   36.5   73   146   365   730   1460   2920   4380   5840   7300   8760  
10220   14600  

5  Years   1825  
45.625   91.25   182.5  
456.25   912.5   1825   3650   5475   7300   9125   10950   12775   18250  

*Assumes  RF/SF  =  2  

DAS  Presents  Challenges  

1 Dedicated Storage Infrastructure · Silo that only runs Splunk

2 3 4 5

Compromised Availability · SSDs & servers fail · Index rebuilds can take hours to days
Lack of Enterprise Data Protection · No Snapshots or Compliance · DR limited to Multisite Clustering
Poor Storage Efficiency · Multiple copies of data · Multisite Clustering Increases Overhead
Non-Optimized Growth · Fixed compute to storage ratio · Servers must maintain storage symmetry

6 Management complexity · Multiple management points

SPLUNK DAS ENVIRONMENT

1x

1x

2x

2x

3x

3x

Why  EMC  For  Splunk  

OpMmized  Infrastructure  For  Big  &  Fast  Data  

     
Op2mized  Shared  
Storage  &  Tiering  
   H   ot & Warm D   ata Deployed OS   cnaXletIrOemIO or    C   old & Frozen D   ata Deployed O   n Isilon
     

Cost--Effec2ve  &  Flexible   Scale--Out  
              
   Scale-Out   Capacity & Compute Inde   pendently Or
As Converged Platform

  

Powerful  Data  Services    

  

  

  

Encyption & Security

   Index File    Compression

  

  

Snapshots For Backups

  

  

Deduplication Of Clustered Indexes

  

Why  Flash?!?  

Intelligent  Scale--out  Flash   HDD  

Economic  Influences  
   ü Consumer  Demand  
ü Data  Services  Allowing  free   Copies  of  ApplicaMon  Data  
ü Flash  technology  has   improved  at  a  faster  rate   than  Moore's  Law  

Xtremio  Data  Services  
Always--on,  Inline,  Zero  Penalty,  Free     

ALWAYS-ON THIN
PROVISIONING

INLINE

INLINE

DEDUPLICATION COMPRESSION

XTREMIO DATA PROTECTION

INLINE DATA AT REST
ENCRYPTION

AGILE WRITEABLE
SNAPSHOTS

EMC  Xtremio  &  Splunk  

All--flash  Infrastructure  For  Hot  &  Warm  Data  

High-Speed Search
Accelerate SuperSparse & Rare Searches

Search  Heads   Indexers  

Scale-Out Flash For I/O-Bound Data
>1M IOPS & <1ms Latencies

  

Data  Services  For  Hot  &  

Warm  Data  

  

  

  

Self-Encrypting Flash Drives

  

  

Index File Compression

  

  

In-Memory Data    Dedupe Clustered Copy Services    Index Copies

  

EMC  Scaleio  &  Splunk  
Converged  Architecture  For  Hot  &  Warm  Data  

Converged  Splunk   Architecture  
Leveraging  ExisMng  Hardware   Investments  
Servers  

Search  Heads   Indexers  

Shared  Capacity  &   Performance  
Remove  Silos  &  Increase  ROI  On   DAS  Capacity  &  No  Single  Point  
Of  Failure  

Network   Storage  

5K  IOPS   1  TB  

5K  IOPS   1  TB  

5K  IOPS   1  TB  

5K  IOPS   1  TB  

25K  IOPS  &  5TB  

5K  IOPS   1  TB  

EMC  Isilon  ­  Deep  and  WIDE  Storage  

Single  Volume/     File  System  

Simplicity  &   Ease  of  Use  

High   Performance  

Linear   Scalability  

Unmatched  Efficiency  

OneFS  

Easy   Growth  

Policy  based   Tiering  

Mul2--protocol   support  

EMC  Isilon  &  Splunk  

Low--cost  &  Secure  Scale--out  For  Cold  Data  

High-Speed Ingest
& Long-Term Retention With Native HDFS Integration

  
Search  Heads   Indexers  

Scale-Out Capacity
Up To 50PB Of Highly Available Capacity

Consolidate,  Protect  &  

Secure  Cold  Data  

  

  

  

Self-Encrypting    SmartLock Protects

Drives

Cold & Frozen Data

  

  

Snapshots IQ For Backups

  

  

SmartDedupe For Clustered Indexes

  

Data  Silos  vs  Consolidated  Data  Lake  

TRADITIONAL WORKLOADS

NEXT-GEN WORKLOADS

24  

Data  Silos  vs  Consolidated  Data  Lake  
Isilon     Scale--Out     Data  Lake  
25  

EMC  Isilon  Next--Gen  Access  Methods  

FILE  
· One  instance  of   the  file  services   all  dependent   workloads   simultaneously  

FILE  

26  

EMC  Reference   Architectures  For  Splunk  
Enterprise  
XtremIO  and  Isilon  Reference  Architecture   ScaleIO  and  Isilon  Reference  Architecture    

EMC  Reference  Architectures  

Single--Instance  

Distributed  

Indexers  

HOT  &   WARM  

Mostly  searches     Heavy  Random  reads   SequenMal  writes  

XtremIO  
Scale--Out  160  TB  Flash  &  No  Tuning   No  RAID  ConfiguraMon  Needed   Many  Copies  &  No  Overhead   DeduplicaMon  &  Compression  

Indexers  

Search  

COLD  

Adhoc  searches   Light  Random  Reads   SequenMal  Writes  

Isilon  

Scale--Out  50  PB  Of  Cold  &  Frozen  Data   MulM--Protocol  =  Always  Searchable   Tier  "Frozen"  Data  Without  MigraMon   SmartDedupe  &  SmartLock  

Vblock®  Systems  ­    
The  Only  True  Converged  Infrastructure  

ApplicaMon   OpMmizaMon  
Lifecycle  System   Assurance  
API  Enabled,  Converged   Management  
Integrated  ProtecMon  and   Workload  Mobility  SoluMons  
Pre--engineered,     Pre--validated,  Pre--tested  
Best--of--breed   Technology  

Customer Experience
Fastest Time-to-Business Highest Performance Highest Availability Converged Management Lowest Risk Lowest TCO

WHY  VCE  FOR  SPLUNK?  
FOCUS  ON  BUSINESS  OPERATIONS,  NOT  MAINTAINING  INFRASTRUCTURE  

SPEED  TIME--TO--   DEPLOYMENT  
Factory  Physical  and  Logical  Build   Compliance--Ready  
Performance  and  Availability  

SIMPLIFY  ONGOING   OPERATIONS  
Roadmap  and  New  Feature  Planning   ConfiguraMon  and  Patch  Management  
Single  Support  Through  VCE  

VCE  Vscale  Architecture   Modular  Grow--as--needed  Architectural  Design  

Flexible  combinaMons  of  EMC   Isilon  and  XtremIO  

VCETM  TECHNOLOGY   EXTENSION  FOR  COMPUTE  
· General  Purpose  Compute   · GPU  Cluster   · DAS  Based  HDFS  Cluster(s)  
VCETM  TECHNOLOGY   EXTENSION  FOR  STORAGE  
· General  Purpose  Block  Storage   · Object  or  ElasMc  Cloud  Storage   · Data  Lakes   · Solid  State  Flash  
VCETM  TECHNOLOGY  EXTENSION   FOR  DATA  PROTECTION  
· Data  ProtecMon   · Data  ReplicaMon  

31  

VCE  to  Address  Three  OpportuniMes  Splunk  

VCETM  technology   extension  for  EMC®  
Isilon®  Storage  

Rack--Scale  Bundle  

Vblock/VxBlock   System  540  

Vblock/VxBlock   System  340  

HOT/WARM  

COLD  

Block/Scale--Out  Bundle  

Sweet  Apps  and   Ninjas  

Splunk  App  For  VCE  Vision    
· VCE  Systems  presented  as  an  
enMty  
· Compliance  history  ­  what  has  
been  changed?  
· System  inventory  and  health   · KPI  dashboards   · One  command  to  configure  system  
logs  and  events  

XtremIO  App   Isilon  App  

Splunk  Apps  
Allows  Splunk  to   monitor  Isilon   performance  

How  We  Size  Splunk  Infrastructure  
· We  Use  Splunk  Best  PracMces  "Religiously"   · We  build  "Converged  Systems"  first   · We  have  our  own  Ninjas  to  help!   · hap://splunk--sizing.appspot.com/    
Not  Officially  Splunk--Supported  

Why  EMC  For  Splunk  

OpMmized  Infrastructure  For  Big  &  Fast  Data  

     
Op2mized  Shared  
Storage  &  Tiering  
   H   ot  &  Warm  Data   D   eployed  On   XS    ctraelemIOIO     or   C  old  &  Frozen   D   ata  Deployed  On   Is   ilon  
     

Cost--Effec2ve  &  Flexible   Scale--Out  
              
   Scale--Out  Capa  city  &  Compute   Independently  O   r  As  Converged  
Plaform  

  

Powerful  Data  Services    

  

  

  

EncrypMon        Index  File   &  Security      Compression  

  

  

  

Snapshots  For      DeduplicaMon  Of  

Backups  

   Clustered  Indexes    

These  ARE  The  Droids  You  Are  Looking  For...  

THANK  YOU  

