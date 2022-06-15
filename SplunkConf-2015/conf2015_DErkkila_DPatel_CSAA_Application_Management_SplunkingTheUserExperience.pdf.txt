Copyright  ©  2015  Splunk  Inc.  
Splunking  the  User   Experience:    
Going  Beyond  ApplicaFon  Logs   with  APM  data  
Doug  Erkkila  and  Diviyesh  Patel  
CSAA  Insurance  Group  

Disclaimer  
During  the  course  of  this  presentaFon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauFon  you  that  such  statements  reflect  our   current  expectaFons  and  esFmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaFon  are  being  made  as  of  the  Fme  and  date  of  its  live   presentaFon.  If  reviewed  aUer  its  live  presentaFon,  this  presentaFon  may  not  contain  current  or   accurate  informaFon.  We  do  not  assume  any  obligaFon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiFon,  any  informaFon  about  our  roadmap  outlines  our  general  product  direcFon  and  is  subject  to   change  at  any  Fme  without  noFce.  It  is  for  informaFonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaFon  either  to  develop  the  features  
or  funcFonality  described  or  to  include  any  such  feature  or  funcFonality  in  a  future  release.  
2  

Agenda  
!  IntroducFons   !  How  We  Introduced  Splunk  ­  Logs   !  Expanding  Beyond  Log  Files  with  dynaTrace   !  Feeding  Knowledge  back  into  Development   !  Lessons  Learned   !  QuesFons?  
  
3  

Who  are  we?  

Who  are  we?  

Diviyesh  Patel   DevOps  and  OpFmizaFon  Manager    

Doug  Erkkila  
Capacity  Management  Analyst  

· Extensive  history  in  Enterprise   ITOps  (Fidelity  and  PepsiCo)  

· 10  years  as  an  applicaFon   developer  
­ Specialized  in  data  related  products  

5  

What  is  CSAA  Insurance  Group?  

· Insurance  company  offering   automobile,  homeowners  and   other  personal  lines  of  insurance  to   AAA  members  through  AAA  clubs  
· More  than  3600  employees  coast   to  coast  
· Reaching  nearly  17  million  AAA   members  in  23  states  and   Washington  DC  

Screenshot  here  

6  

What  is  PAS?  

PAS  is  the  central  Policy  AdministraFon  System  

· Consolidate  policy  administraFon   from  across  different  insurance   categories  and  across  different   states  into  one  central  system  
· A  Team  of  over  300  developers  and   analysts  
­ OpFmizaFon  Team  is  5  Analysts  

Screenshot  here  

7  

In  the  Beginning:  Logs  

What  started  it  all?  
Customer  complaints  about  ApplicaFon  Errors  (Error  500s)   !  Was  there  an  increase  in  excepFons?   !  Difficult  to  understand  error  paeerns  across  a  cluster  of  servers  
­ Was  an  excepFon  only  occurring  on  a  single  server?   ­ Was  an  excepFon  only  occurring  at  a  certain  Fme  of  day?  
!  Is  this  a  maeer  of  percepFon  or  applicaFon  quality?  
9  

What  started  it  all?  
A  lot  of  quesFons,  but  finding  answers  was  difficult   !  Logs  were  rolled  off  so  excepFon  history  was  hard  to  gather   !  Difficult  to  understand  error  paeerns  across  a  cluster  of  servers  
­ Any  paeerns  had  to  come  from  inFmate  knowledge  of  logs   ­ Wasted  support  Fme  reading  logs  every  day  
!  Customer  feedback  can  be  sporadic  and  you  tend  to  hear  from  the   same  small  group  
10  

Error  500s  
A  single  measurable  use  case  
· Basic  AggregaFon  and  Trends  
Screenshot  here  
11  

Error  500s  
A  single  measurable  use  case  
· Basic  AggregaFon  and  Trends   · Added  categorizaFon  
Screenshot  here  
12  

Error  500s  
A  single  measurable  use  case  
· Basic  aggregaFon  and  trends   · Added  categorizaFon   · Segment  by  server  
Screenshot  here  
13  

Error  500s  

A  single  measurable  use  case  
· Basic  aggregaFon  and  trends  
­ Helped  us  see  the  increase  in  excepFons  
· Added  categorizaFon  
­ Narrowed  down  Fmeframes  for  specific  
errors  
· Segment  by  server  
­ Easy  to  see  if  the  issue  was  server  specific  
· Merge  user  informaFon  
­ Answered  our  percepFon  vs  quality  quesFon  

Screenshot  here  

14  

What  started  it  all?  
Customer  complaints  about  ApplicaFon  Errors  (Error  500s)   !  Was  there  an  increase  in  excepFons?   !  Difficult  to  understand  error  paeerns  across  a  cluster  of  servers  
­ Was  an  excepFon  only  occurring  on  a  single  server?   ­ Was  an  excepFon  only  occurring  at  a  certain  Fme  of  day?  
!  Is  this  a  maeer  of  percepFon  or  applicaFon  quality?  
15  

What  started  it  all?  
Customer  complaints  about  ApplicaFon  Errors  (Error  500s)   !  Was  there  an  increase  in  excepFons?   !  Difficult  to  understand  error  paeerns  across  a  cluster  of  servers  
­ Was  an  excepFon  only  occurring  on  a  single  server?   ­ Was  an  excepFon  only  occurring  at  a  certain  Fme  of  day?  
!  Is  this  a  maeer  of  percepFon  or  applicaFon  quality?  
16  

What  started  it  all?  
Customer  complaints  about  ApplicaFon  Errors  (Error  500s)   !  Was  there  an  increase  in  excepFons?   !  Difficult  to  understand  error  paeerns  across  a  cluster  of  servers  
­ Was  an  excepFon  only  occurring  on  a  single  server?   ­ Was  an  excepFon  only  occurring  at  a  certain  Fme  of  day?  
!  Is  this  a  maeer  of  percepFon  or  applicaFon  quality?  
17  

What  started  it  all?  
Customer  complaints  about  ApplicaFon  Errors  (Error  500s)   !  Was  there  an  increase  in  excepFons?   !  Difficult  to  understand  error  paeerns  across  a  cluster  of  servers  
­ Was  an  excepFon  only  occurring  on  a  single  server?   ­ Was  an  excepFon  only  occurring  at  a  certain  Fme  of  day?  
!  Is  this  a  maeer  of  percepFon  or  applicaFon  quality?  
18  

Changing  the  reality  
75%  reduc*on  in  
errors  

5076  
March  2014  

1524  
March  2015  
19  

1074   July  2015  

With  Splunk   Without  

Moving  Beyond  Logs   with  dynaTrace  APM  

The  power  of  APM  

We  were  already  using  Dynatrace  for  APM  

!  Method  level  execuFon  Fmes  
!  User  Experience  Management  
­ Server/Network/Client  side  load  Fmes   ­ Browser  data  
!  Database  response  Fmes  
!  JVM  Heap  Stats  

Agent  Info  

User--centered   Performance  
Reports  
21  

Dynatrace   Performance  
Data  

ExporFng  data  out  of  Dynatrace  

Before  Splunk  

!  Using  the  Dynatrace  REST  API   !  Nightly  scheduled  ETL   !  Database  storage   !  Excel  based  reporFng  

Nightly   ETL  
VM  

Nightly   ETL  

Weekly   ReporFng  

Dynatrace  

Performance   Warehouse  

Excel   Reports  

22  

ExporFng  data  out  of  Dynatrace  
But  there  were  flaws...  
!  Not  real  Fme   !  Limited  user  populaFon   !  Fragile  
­ Scheduled  tasks  failed  to  trigger   ­ User  account  credenFals  changed  frequently   ­ VM  configuraFon  issues   ­ REST  API  calls  Fmed  out  
!  Hours  spent  cleaning  up  Excel  reports  every  week  
23  

ExporFng  data  out  of  Dynatrace  
We  addressed  those  flaws  
!  Real  Fme  push  from  Dynatrace   !  Anyone  with  Splunk  access  could  get  
performance  data   !  Limited  areas  for  interrupFon   !  No  manual  report  modificaFon   !  Added  addiFonal  report  types  
24  

EliminaFng  those  flaws  

Dynatrace  teams  up  with  Splunk  

! Dynatrace's  Big  Data  Business   TransacFon  Bridge  
!  Flume   ! Splunk  Forwarder   !  Pull  vs.  Push!  

Nightly   ETL  
VM  

Nightly   ETL  

Weekly   ReporFng  

Performance   Warehouse  

Excel   Reports  

Dynatrace  

25  

EliminaFng  those  flaws  

Dynatrace  teams  up  with  Splunk  

! Dynatrace's  Big  Data  Business  

Flume  

TransacFon  Bridge  

Dynatrace  

!  Flume  

! Splunk  Forwarder  

!  Pull  vs.  Push!  

26  

Configuring  the  big  data  bridge  
27  

Real  Fme  performance  view  
28  

Club  Performance  Reports  
29  

Club  Performance  Reports  
30  

Individual  User  Performance  Trends  
31  

Feeding  Back  Into   Development  

Going  Beyond  Just  Monitoring  
!  Easily  searchable  data  repository   !  Quick  long  term  trending   !  Extensible...  
33  

Going  Beyond  Just  Monitoring  
!  Easily  searchable  data  repository   !  Quick  long  term  trending   !  Extensible...  
34  

UpdaFng  TesFng  Plans  
!  Using  producFon  transacFon   frequency  
!  More  realisFc  performance  tesFng  
35  

Performance  comparisons  
!  Typically  baseline  to  baseline   comparison  in  the  save   environment  
!  Differences  between  producFon   and  performance  environments  
!  More  accurate  understanding   forecasts  
36  

Lessons  Learned  

Our  Splunk  Architecture  
Splunk  started  out  as  a  PAS  only  tool.  
PAS   38  

Our  Splunk  Architecture  
But  quickly  other  teams  in  the  enterprise  began  using  it  too.  
SOA  Shared  Services  
PAS   39  

Our  Splunk  Architecture  
But  quickly  other  teams  in  the  enterprise  began  using  it  too.  

SOA  Shared  Services  

Enterprise  AnalyFcs  

PAS   40  

Our  Splunk  Architecture  
Now,  Splunk  is  an  enterprise  tool  uFlized  by  several  groups  

SOA  Shared  Services  

Enterprise  AnalyFcs  

PAS  

UBI  

41  

Capacity  seqngs  
!  The  default  Flume  capaciFes  may  not  be  enough   !  Inadequate  capaciFes  can  lead  to  missing  or  even  duplicated  data  
Where  did  all  the   data  go?  
   !  Watch  for  typos:  It's  "capacity"  not  "capacFy"     
42  

QuesFons?  

THANK  YOU  

