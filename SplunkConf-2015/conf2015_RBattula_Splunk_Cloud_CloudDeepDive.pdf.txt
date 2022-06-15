Copyright  ©  2015  Splunk  Inc.  
Technical  Deep  Dive   Splunk  Cloud  

Disclaimer  
During  the  course  of  this  presentaAon,  we  may  make  forward  looking  statements  regarding  future  events   or   the   expected   performance   of   the   company.   We   cauAon   you   that   such   statements   reflect   our   current   expectaAons  and  esAmates  based  on  factors  currently  known  to  us  and  that  actual  events  or  results  could   differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  contained  in  our   forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward--looking  statements  made   in  the  this  presentaAon  are  being  made  as  of  the  Ame  and  date  of  its  live  presentaAon.  If  reviewed  aMer   its   live   presentaAon,   this   presentaAon   may   not   contain   current   or   accurate   informaAon.   We   do   not   assume  any  obligaAon  to  update  any  forward  looking  statements  we  may  make.        In  addiAon,  any  informaAon  about  our  roadmap  outlines  our  general  product  direcAon  and  is  subject  to   change   at   any   Ame   without   noAce.   It   is   for   informaAonal   purposes   only   and   shall   not,   be   incorporated   into   any   contract   or   other   commitment.   Splunk   undertakes   no   obligaAon   either   to   develop   the   features   or  funcAonality  described  or  to  include  any  such  feature  or  funcAonality  in  a  future  release.  
2  

Agenda  
!  IntroducAons   !  Splunk  Cloud  Overview   !  Design  Principles   !  High  Performance  &  High  Availability   !  Security  from  the  Ground  Up   !  OperaAonal  Excellence  
3  

Cloud  and  Your  Business  

Apps and data moving to cloud

Cloud data can remain in cloud

Desire to consume Splunk
as a service

4!

Splunk's  PorZolio  for  Cloud  

SaaS  

So(ware  

Apps  

· Splunk  Enterprise  as   a  service  

   · Analyze  data  in  EMR/
S3  with  Hunk  

· App  for  AWS   · App  for  ServiceNow   · More  SaaS  apps...  

5  

What  is  Splunk  Cloud:  Where's  Waldo?  

Search Head(s) Indexer(s)

Search Head(s) Indexer(s)

On Premises Private Cloud Public Cloud

On Premises Private Cloud Public Cloud 6  

Okay,  a  Hint    

Search Head(s) Indexer(s)

Search Head(s) Indexer(s)

On Premises Private Cloud Public Cloud

On Premises Private Cloud Public Cloud 7  

Did  You  Spot  It?    

Search Head(s) Indexer(s)

Search Head(s) Indexer(s)

On Premises Private Cloud Public Cloud

On Premises Private Cloud Public Cloud 8  

Search Head(s) Indexer(s)

Splunk  Cloud  is  Splunk  Enterprise   as  a  Service     
Available  Globally  in  AWS     

On Premises Private Cloud Public Cloud 9  

Global  AWS  Regions  &  GovCloud  
10  

Search Head(s) Indexer(s)

Splunk  Cloud  is  Splunk  Enterprise   as  a  Service     
Available  Globally  in  AWS     

On Premises Private Cloud Public Cloud 11     

Splunk  Cloud  Design  Principles  

Instant  

Secure  

Reliable  

Hybrid  

12  

Stacks  

Clustering  &   License  Managers  

Indexers  

13  

Search  Heads  

Stacks  

Clustering  &   License  Managers  

Indexers  

14  

Search  Heads  

EC2  Instance  

Stacks  
Single  Tenant  
Customer  Stack  
15  

Secure  By  Default  
Network  IsolaAon   EncrypAon   Non--repudiable  Logging   Secure  coding  pracAces  
16  

17  

18  

Durable  
Replicated  Data   Replicated  Configs  
Backups   Redundant  systems  
19  

Automated  
20  

21  

22  

23  

"Skynet"  
24  

Copyright  ©  2015  Splunk  Inc.  
High  Availability  

High  Availability  
26  

High  Availability  
Search  Head  
27  

High  Availability  

Search  Head  1  

Search  Head  2  
28  

Search  Head  3  

High  Availability  

Search  Head  1  

Search  Head  2  
29  

Search  Head  3  

High  Availability  

Search  Head  1  

Load  Balancer   Search  Head  2  
30  

Search  Head  3  

High  Availability  

Search  Head  1  

Load  Balancer   Search  Head  2  
31  

Search  Head  3  

High  Availability  

Search  Head  1  

Load  Balancer   Search  Head  2  
32  

Search  Head  3  

High  Availability  

Search  Head  1  

Load  Balancer   Search  Head  2  
33  

Search  Head  3  

High  Availability  
3  Indexers  
34  

Indexer  1  

High  Availability  
Indexer  2  

Indexer  3  

35  

Indexer  1  

High  Availability  
Indexer  2  

Indexer  3  

Searchable  Bucket  
36  

Indexer  1  

High  Availability  
Indexer  2  

Indexer  3  

Searchable  Bucket  

Searchable  Bucket  
37  

Indexer  1  

High  Availability  
Indexer  2  

Indexer  3  

Searchable  Bucket  

Searchable  Bucket  
38  

Replicated  Bucket  

Indexer  1  

High  Availability  
Indexer  2  

Indexer  3  

Searchable  Bucket  

Searchable  Bucket  
39  

Replicated  Bucket  

Indexer  1  

High  Availability  
Indexer  2  

Indexer  3  

Searchable  Bucket  

Replicated  Bucket  
40  

Indexer  1  

High  Availability  
Indexer  2  

Indexer  3  

Searchable  Bucket  

Searchable  Bucket  
41  

Replicated  Bucket  

High  Availability  
Indexers  
42  

High  Availability  
Indexers  
43  

High  Availability  
Indexers  
44  

High  Availability  
Indexers  
45  

High  Availability  
Indexers  
46  

High  Availability  
Indexers  
47  

High  Availability  
Search  Head   Indexers  
48  

High  Availability  
Search  Head   Indexers  
49  

Disaster  Recovery  
Splunk  Buckets  &   ConfiguraAon  Data  
50  

Disaster  Recovery  

Splunk  Buckets  &   ConfiguraAon  Data  

Amazon  S3  

51  

Disaster  Recovery  

Splunk  Buckets  &   ConfiguraAon  Data  

Amazon  S3  

52  

Security  

customer stack
54  

security group
Isolated  by  Security  Groups  
55  

security group
Further  Isolated  by  a  Splunk  VPC  
56  

security group security group

security group
57  

security group security group

Customer   Forwarders  

AuthenAcaAon  

Client   SSL  CerAficates  

Server   SSL  CerAficates  

58  

Customer   Forwarders  

AuthenAcaAon  
2  

Client   SSL  CerAficates  

1   Server   SSL  CerAficates  
59  

Rogue   Forwarders  

AuthenAcaAon  
2  

1  
60  

EncrypAon  at  Rest  

Clustering  &   License  Managers  

Indexers  

Search  Heads  

61  

Forwarder  

Indexer   splunkd   encrypt  

Search  Head  

62  

Forwarder  

Indexer   splunkd   decrypt  

Search  Head   splunkd   decrypt  

63  

Hybrid  

Search Head(s)

Hybrid  
Hybrid  Search  

Search Head(s)

Indexer(s) Single  Pane  of  Glass  Visibility   Indexer(s)

On Premises Private Cloud Public Cloud

On Premises Private Cloud Public Cloud 65  

One  More  Thing...  

Looking  Forward  
Searchable  S3  Archiving  

AWS S3

2  years  +  

Forwarder  

Indexer   0  to  365  days  
67  

Search  Head  

Splunk  Cloud  is...  
!  Highly  performant   !  Highly  available   !  Built  with  security  from  the  ground  up   !  OperaAonally  automated   !  A  single  pane  of  glass  visibility  with  hybrid  search  
68  

QuesAons  

Thank  You!  

