Copyright  ©  2015  Splunk  Inc.  
Deploying  Splunk  on   Amazon  Web   Services  
Simeon  Yep,  Strategic  Alliances   Nate  Kwong,  Senior  SE   Bill  BartleD,  Senior  SE  

Disclaimer  
During  the  course  of  this  presentaKon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauKon  you  that  such  statements  reflect  our   current  expectaKons  and  esKmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaKon  are  being  made  as  of  the  Kme  and  date  of  its  live   presentaKon.  If  reviewed  aTer  its  live  presentaKon,  this  presentaKon  may  not  contain  current  or   accurate  informaKon.  We  do  not  assume  any  obligaKon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiKon,  any  informaKon  about  our  roadmap  outlines  our  general  product  direcKon  and  is  subject  to   change  at  any  Kme  without  noKce.  It  is  for  informaKonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaKon  either  to  develop  the  features  
or  funcKonality  described  or  to  include  any  such  feature  or  funcKonality  in  a  future  release.  
2  

ObjecKve:  
Integrate  your  Splunk  Enterprise  deployment   with  Amazon  Web  Services  (AWS)  
3  

Amazon  Web  Services  vs.  Everyone  Else  
4  

#1! MQ Leader!
5  

Presenters  

Bill  BartleD  
·Senior  SE,   AWS  
·SeaDle  

Nate  Kwong  
·Senior  SE,   Majors  
·SF  

Simeon  Yep  
·Director,   Alliances  
·SF  

6  

Agenda  
· Infrastructure:    AWS  ElasKc  Compute  Cloud  (EC2)   · Deployment  Examples  &  leveraging  AWS  features   · AWS  Provisioning  and  AutomaKon   · Apps  +  Other  (Time  pending)  
7  

AWS  EC2   Infrastructure  

11! Worldwide Regions!
9  

28! Availability Zones!
10  

AWS  Regions  &  Availability  Zones  

US Regions

US  East  (VA)  

Availability Zone A

Availability Zone B

Availability Zone C

Availability Zone D

US  West  (CA)  

Availability Zone A

Availability Zone B

Global Regions

Asia  Pacific  (Tokyo)  

Availability Zone A

Availability Zone B

Availability Zone C

Asia  Pacific  (Singapore)  

Availability Zone A

Availability Zone B

EU  (Frankfurt)  

Availability Zone A

Availability Zone B

US  West    (OR)  

Availability Zone A

Availability Zone B

Availability Zone C

GovCloud  (OR)  

Availability Zone A

Availability Zone B

EU  (Ireland)  

Availability Zone A

Availability Zone B

Availability Zone C

South  America  (Sao  Paulo)  

Availability Zone A

Availability Zone B

Asia  Pacific  (Sydney)  

Availability Zone A

Availability Zone B

**China  (Beijing)  Region  ­  Currently  in  Limited  Preview  with  1  AZ**  
Customer Decides Where Applications and Data Reside Note: Conceptual drawing only. The number of Availability Zones may vary.

11  

Broad  And  Deep  Services  To  Support  Any  Cloud  Workload  
Deployment & Administration Application Services

Compute

Storage

Database

Networking AWS Global Infrastructure

12  

Amazon  Web  Services  EC2  
"  Amazon  ElasKc  Compute  Cloud   (EC2)      
"  Pay--as--you--go  pricing  model   "  Splunk  is  easily  deployed  in  Amazon  
13  

Broad  Set  of  Compute  Instance  Types...  

General    
purpose  

Compute  
opKmized  

T2   M3   M4   C3   C4  

Storage  and  IO  
opKmized  
I2   D2  

GPU  
enabled  
G2  

Memory  
opKmized  
R3  
Current   Genera@on  

T1   M1  

C1   CC2  

HI1   HS1  

CG1  

M2  

CR1  

Previous   Genera@ons  

are  s@ll  

available  

14  

Typical  User  Scenario  
1. Sign--up  for  an  AWS  account  (use  AWS  IAM  ­  IdenKty  and  Access   Management)  
2. Launch  an  EC2  instance  (via  user  chosen  tool  such  as  GUI,  CLI,  or   external)  
3. Use  key  credenKals  to  access  the  EC2  instance   4. Install  SoTware/Splunk  
15  

Splunk  and  Hardware  
· Splunk  consumes  high  I/O  due  to  indexing  and  searching   · Load  !=  GB/day   · Search  drives  a  large  porKon  of  the  load    
­ Rare  vs.  Sparse  vs.  ReporKng   ­ Real--Kme  vs.  Historic  
· Rule  of  thumb  ­  up  to  300  GB/day    
­ Reference  servers  can  index  500  GB/day  with  no  search  load  
· Virtualized  systems  incur  some  overhead,  but  work  well  if  tuned   correctly  
16  

Instances  
· Instance  type  
­ Pricing:      Spot  vs.  On--demand  vs.  Reserved   ­ Family:    Storage  vs.  Compute  vs.  GPU  vs.  Memory  vs.  General  Purpose   ­ GeneraKon:      Current  vs.  Previous  
· Instance  size  
­ Workload  size:      compute  units,  memory,  storage   ­ Micro,  Small,  Medium,  Large,  Extra  Large  (XL)  
ê MulKple  XL  sizes:      xlarge,  2xlarge,  4xlarge,  8xlarge   ­ 4XL  general  purpose  provides  similar  performance  to  a  reference  server  
ê 50--250  GB/day  indexing  and  searching     
17  

Instance  Storage  
· Instances  have  ephemeral  storage  (Current  Gen  has  SSDs)  
­ General  Purpose  instances  have  GBs  to  TBs   ­ Storage  OpKmized  instances  have  up  to  48  TB!   ­ Data  is  lost  when  the  instance  dies    
· EBS  ­  ElasKc  Block  Storage  
­ Persistent  block  level  storage  volumes  for  use  with  EC2  instances   ­ Cost  associated  ­  1  TB  costs  $100/month   ­ Data  is  not  lost  when  instance  dies  ­  can  be  remounted  with  new  instance   ­ For  storage  needs  larger  than  16  TB,  RAID  required   ­ Built--in  resiliency  ­  data  is  backed  up  
· S3  ­  Simple  Storage  Service  
­ Online  cloud  storage  service  (files,  data,  etc...)   ­ Need  this  for  backup  purposes  (Snapshots)   ­ Can  also  be  used  as  a  data  feed  for  Splunk,  TA  available  
18  

Storage  Best  PracKces  
· Single  instances  or  non--replicated  distributed  deployments:  
­ Use  EBS  volumes  for  indexes  and  the  OS/soTware   ­ RAID  can  be  an  extra  measure  of  reliability,  but  will  consume  CPU   ­ Use  snapshots  to  backup  the  instance  (S3)   ­ IOPS  opKmized  provides  benefits   ­ XFS  preferred  (customer  feedback)   ­ c4  (compute  opKmized)  instances  will  require  storage  
19  

Instance  SelecKon  
· How  can  I  make  my  deployment  resilient?  
­ OpKon  1:    EBS     ­ OpKon  2:    Index  ReplicaKon   ­ OpKon  3:    Data  Cloning  (Index  and  Forward)  
· Instance  selecKon  should  factor  in  resiliency,  use--case,  and  cost   · Index  ReplicaKon  (IR)  
­ ReplicaKon  requires  more  instances  as  data  is  stored  twice   ­ Does  not  require  EBS  for  indexes   ­ Major  driver  is  instance  cost  as  you  leverage  ephemeral  storage  
20  

Instance  SelecKon  Exercise  
· 1  TB/day  Distributed  Deployment  
­ EBS  backed  storage  for  availability   ­ No  replicaKon  
· AWS  Calculator  spreadsheet  available  
21  

Instance  SelecKon  Exercise  
"  RetenKon  values  for  EBS  backed  deployments  significantly  drive  cost  
22  

Instance  SelecKon  Exercise  
· 1  TB/day  Distributed  Deployment  
­ Index  ReplicaKon  enabled  (Double  the  indexers  and  add  1  AdministraKve  node)  
· Index  ReplicaKon  offers  immediate  search  capability  with  SF/RF   · Differences:  
­ $5k   ­ Increased  availability,  higher  performance  
23  

Instance  SelecKon  

Distributed  Deployments  

Using  Index  ReplicaKon  (IR)  

Using  EBS  volumes,  no  IR  

· Local  ephemeral  storage  (SSDs)   may  perform  beDer  than  EBS  
· Search/ReplicaKon  Factor   determines  availability  of  data   for  searching  
· IR  adds  load  and  requires  more   servers  and  storage  

· Typically  fewer  instances  to   manage  vs.  IR  
· Search  Availability  is  driven   by  the  capability  to  remount   a  volume  to  a  new  instance   (automaKcally  or  manually)  
· Cost  can  be  largely  driven  by   retenKon  and  daily  volume  

24  

Amazon  Machine  Image  (AMI)  
· Amazon  Machine  Image  (AMI)  preferences  for  Splunk  
­ Amazon  Linux  based   ­ Best  Performance   ­ Cost  EffecKve  (extra  $$  for  Windows)  
· AMIs  available  for  download  
­ Splunk  Enterprise   ­ Hunk  
ê Hunk  +  EMR  baked  into  Marketplace  

Best  PracKces  
· Custom  AMI  creaKon  
­ Create  your  own  AMI  using  Linux  based  or  Splunk  provided   ­ Leverage  current  configuraKon  tooling  with  AMI  (don't  have  to  use  deployment  
server,  but  can  be  very  helpful)  
· AuthenKcaKon  and  AuthorizaKon  
­ Policies  will  dictate  what  you  can  or  cannot  use   ­ LDAP/AD  will  require  an  SSL  tunnel   ­ Other  opKons:    scripted  input  or  proxying  (SSO)   ­ SAML  (Okta)     ­ NOTE  ­  SSO  methods  sKll  require  role  informaKon  
· Security  
­ SSL  everywhere  +  private  network   ­ Install  your  own  cerKficates  
26  

Best  PracKces  
· Search  Head  Clustering   · Deploy  to  the  same  AWS  Region  
­ ReplicaKon  and  searches  across  Regions  can  be  a  challenge  
· Monitor  from  outside  of  the  Region/AZ  
­ Offers  addiKonal  resiliency  
· Use  a  Virtual  Private  Cloud  (VPC)  
  
27  

General  Guidelines  

Follow  Best  PracKces  for  ArchitecKng  and  Sizing:      Load=Searching+Indexing  

Indexers  (50--250  GB/day)  

Search  Heads  (8+  users)  

· c4.4xlarge        16  vCPU,  30  GB  RAM   · d2.4xlarge        16  vCPU,  122  GB  RAM   · c4.8xlarge        36  vCPU,  60  GB  RAM  
*These  are  all  starKng  points!    Splunk   can  index  and  search  more  OR  less   depending  on  overall  load.     

· c4.4xlarge                16  vCPU,  30  GB  RAM   · c4.8xlarge                36  vCPU,  60  GB  RAM  
Clu   ster  Master  or  Deployment  Server  
· c4.xlarge   4  vCPU,  7.5  GB  RAM   · c4.2xlarge                   8  vCPU,  15  GB  RAM  
License  Master  

· c4.large · c4.xlarge

  2  vCPU,  3.75  GB  RAM     4  vCPU,  7.5  GB  RAM  

28  

Architecture  &   Deployment  
Examples  

Architecture  Examples  
· Centralized   · Decentralized   · Hybrid   · Centralized  with  Index  ReplicaKon  
30  

Centralized  Topology  
Search Heads Indexers

Forwarders

Intermediate Forwarder

Syslog Devices 31  

Forwarders

Decentralized  Topology  
Search Heads
32  

Hybrid  Topology  
33  

Index Replication with Search Clustering

Cluster Master

Search Cluster

Forwarders

Peer Nodes

34  

Deployment  Examples  
· Single  Server   · MulK--Server  
35  

Single  Server  
· Use  case:      Searching,  ReporKng  and  AnalyKcs   · Up  to  250+  GB/day  indexing  with  common  search  loads  
­ For  heavy  reporKng  and  analyKcs,  decrease  indexing  volume  
· c4.4xlarge  instance  
­ EBS  volumes  configured  to  support  retenKon  needs  
· Up  to  16  concurrent  users  
36  

MulK--Server  
· Use  Case:    ApplicaKon  Management,  Security  Forensics   · Up  to  1  TB/day  indexing  with  common  search  loads   · Distributed  deployment  with  Index  ReplicaKon  (2  SF,  3  RF)   · 8  --  d2.4xl  instances  with  24  TB  ephemeral  storage  (indexers)   · 3  --  c4.4xlarge  instance  (search  cluster)  
37  

Deployment  B  

Search  Head(s)  
Indexer  

CM  +   DMC  +   Deployer  

38  

38  

Example  Architectures  

Use  case  and  requirements  influence  final  setup,  but  there  is  no  right  or  wrong  way  

Using  EBS  backed  storage  

Using  Index  ReplicaKon  

· 20  GB/day    
­ c4.2xlarge  (single  instance)  
· 100  GB/day    
­ c4.4xlarge  (single  instance)  
· 300  GB/day  
­ c4.4xlarge     ­ c4.8xlarge  
· 500  GB/day  
­ c4.4xlarge  as  indexer  (3)   ­ c4.4xlarge  as  search  head  (1)  

· 100  GB/day  
­ d2.2xlarge  as  indexer  (2)   ­ c4.2xlarge  as  search  head  (1)   ­ c4.xlarge  as  CM/LM  
· 500  GB/day  
­ d2.4xlarge  as  indexer  (3)   ­ c4.4xlarge  as  search  head  (1)   ­ c4.xlarge  as  CM/LM  

39  

Self  Healing  Splunk   Architecture  
40  

AWS  Auto  Scaling  
· AutomaKcally  replace  unhealthy  EC2  instances   · MulKple  Auto  Scaling  Policies  
­ Maintain  a  fixed  number  of  EC2  Instances  (recommended  for  Splunk  Indexers)   ­ Performance  metrics   ­ Time  based   ­ Manual  Scaling  
41  

Architecture  Diagram  (Splunk  +  AWS)  

Search Head instance

Search Head instance
Auto Scaling group ­ Across 3 Zones

Search Head instance

Indexer

Indexer

instance instance

Auto Scaling Group AZ-A

Availability Zone A

Indexer instance

Indexer instance

Auto Scaling Group AZ-B

Availability Zone B

42  

Indexer Indexer instance instance
Auto Scaling Group AZ-C Availability Zone C

Cluster Master Instance
Auto Scaling Group of 1

Architecture  Diagram  (Splunk  +  AWS)  

Search Head instance

Search Head instance
Auto Scaling group ­ Across 3 Zones

Search Head instance

Indexer

Indexer

instance instance

Auto Scaling Group AZ-A

Availability Zone A

Indexer instance

Indexer instance

Auto Scaling Group AZ-B

Availability Zone B

43  

Indexer Indexer instance instance
Auto Scaling Group AZ-C Availability Zone C

Cluster Master Instance
Auto Scaling Group of 1

Architecture  Diagram  (Splunk  +  AWS)  

Search Head instance

Search Head instance
Auto Scaling group ­ Across 3 Zones

Search Head instance

Indexer instance

Indexer

Indexer

instance instance

Auto Scaling Group AZ-A

Availability Zone A

Indexer instance

Indexer instance

Auto Scaling Group AZ-B

Availability Zone B

44  

Indexer Indexer instance instance
Auto Scaling Group AZ-C Availability Zone C

Cluster Master Instance
Auto Scaling Group of 1

Splunk  Indexer  Clustering  with  Auto  Scaling  
· MulKsite  clustering  
­ Replicate  a  copy  of  your  data  to  mulKple  sites   ­ Hint:  AWS  Availability  Zone  =  Splunk  Site  
· Separate  Auto  Scaling  Groups  for  each  Availability  Zone  
45  

Splunk  Search  Head  Clustering  with  Auto  Scaling  
· Auto--elecKon  of  captain  within  the  Search  Head  Cluster   · Auto  Scaling  Policy  spans  across  mulKple  Availability  Zones  
46  

Architecture  Diagram  (Splunk  +  AWS)  

Search Head instance

Search Head instance
Auto Scaling group ­ Across 3 Zones

Search Head instance

Indexer instance

Indexer

Indexer

instance instance

Auto Scaling Group AZ-A

Availability Zone A

Indexer instance

Indexer instance

Auto Scaling Group AZ-B

Availability Zone B

47  

Indexer Indexer instance instance
Auto Scaling Group AZ-C Availability Zone C

Cluster Master Instance
Auto Scaling Group of 1

Architecture  Diagram  (Splunk  +  AWS)  

Search Head instance

Search Head instance
Auto Scaling group ­ Across 3 Zones

Search Head instance

Indexer instance

Indexer

Indexer

instance instance

Auto Scaling Group AZ-A

Availability Zone A

Indexer instance

Indexer instance

Auto Scaling Group AZ-B

Availability Zone B

48  

Indexer Indexer instance instance
Auto Scaling Group AZ-C Availability Zone C

Cluster Master Instance
Auto Scaling Group of 1

Architecture  Diagram  (Splunk  +  AWS)  

Search Head Search Head

instance

instance

Search Head instance
Auto Scaling group ­ Across 3 Zones

Search Head instance

Indexer instance

Indexer

Indexer

instance instance

Auto Scaling Group AZ-A

Availability Zone A

Indexer instance

Indexer instance

Auto Scaling Group AZ-B

Availability Zone B

49  

Indexer Indexer instance instance
Auto Scaling Group AZ-C Availability Zone C

Cluster Master Instance
Auto Scaling Group of 1

Splunk  +  AWS  Features  =  FTW  
· Self  Healing  Splunk  Infrastructure   · Splunk  Clustering  provides  data  availability  and  replicaKon   · AWS  Auto  Scaling  can  automaKcally  replace  failed  Splunk  instances  
50  

Splunk  +  AWS  Auto  Scaling  ConsideraKons  
· Auto  Scaling  Group  of  1  for  Splunk  Cluster  Master  
­ Splunk  Cluster  Master  is  a  stateless  server  
· Use  DNS  name  instead  of  IP  address  for  Splunk  Cluster  Master  URI   · Bootstrap  EC2  instances  to  automaKcally  join  Splunk  Indexer  and  
Search  Head  Clusters  
51  

How  To   Provision  
Deployments  

Cloud  Provisioning  Tools  

Server  Provisioning  

Deployment  Provisioning  

AWS CloudFormation

AWS OpsWorks

Scalr

· Flexible  recipe--based  configuraKon  
­ Configure  machine  based  on  role  

Terraform
· Fast  template--based  provisioning  
­ Provision  &  connect  resources  

53  

Splunk  +  AWS  +  CloudFormaKon     Ready  in  10  minutes.    
54  

Why  CloudFormaKon?  
· Open--source  self--service  tool  (no  cost  associated)   · Fast,  automated,  consistent  Splunk  deployments  on  AWS  

"Live  Demo"  What  could  go  wrong?  
56  

Example  Architecture  

Search  Head(s)  

Indexer   Indexer  Indexer   Indexer   Indexer  

57  

57  

Splunk  AWS  CloudFormaKon  
What  can  Splunk  AWS  CloudFormaKon  do  for  you?      "  Consistent,  repeatable  deployment  Kme  cut  to  minutes   "  Incorporates  Splunk  best  pracLces  for  operaKons  and  
administraKon   "  Abstracts  away  details  of  configuring  distributed  Splunk   "  Extensible  and  customizable  templates  to  fit  custom  needs  
58  

Splunk  AWS  CloudFormaKon  
"What  used  to  take  days  to  get  all  configured   properly,  now  I  can  do  in  few  minutes  with  
Splunk  [AWS]  CloudFormaKon"    
Abdallah  Mohammed,  Data  Architect,  Intuit  
59  

"Live  Demo"  The  Results  Show.  
60  

Apps  and  more  
61  

Content  
"  Splunk  Apps:  
­ AWS:    Data  CollecKon  and  Dashboards  for  Cloudtrail,  Cloudwatch,  Billing/ Usage  
"  Technology  Add--on  
­ S3  Modular  Input   ê Simplified  access  to  your  content  on  S3  
"  Hunk  App:  
­ ElasKc  Load  Balancer:      AnalyKcs  for  your  ELB    
"  Hunk+EMR  
­ Turn  Key  Hunk  SoluKon  

  
QuesKons?  
63  

Contact  

Simeon  Yep  

Nate  Kwong  

syep@splunk.com  

nkwong@splunk.com  

  

Bill  BartleD  

bbartleD@splunk.com  

64  

References  
· Splunk  App  for  AWS:    hDp://apps.splunk.com/app/1274/     · Hunk  App  for  AWS  ELB:    hDp://apps.splunk.com/app/1731/   · Technical  Brief:    
hDp://www.splunk.com/content/dam/splunk2/pdfs/technical--briefs/ deploying--splunk--enterprise--on--amazon--web--services--technical-- brief.pdf  
65  

References  
· Blogs:    
­ hDp://blogs.splunk.com/2012/03/07/splunk--and--aws--sizing--revisited/   ­ hDp://blogs.splunk.com/2013/06/06/splunkit--v2--0--2--results--ec2--storage--
comparisons/     ­ hDp://blogs.splunk.com/2013/07/31/whats--going--on--with--aws--and--splunk/   ­ hDp://blogs.splunk.com/2014/05/20/deploy--your--own--splunk--cluster--on--aws--
in--minutes/  
· AMIs  
­ Splunk:    hDps://aws.amazon.com/marketplace/pp/B00GIZITUO?sr=0--4   ­ Hunk:    hDps://aws.amazon.com/marketplace/pp/B00GIZK2QI?sr=0--2  
66  

