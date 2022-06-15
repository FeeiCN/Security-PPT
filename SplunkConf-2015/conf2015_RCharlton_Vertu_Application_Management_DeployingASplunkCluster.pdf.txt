Copyright  ©  2015  Splunk  Inc.  
Deploying  A  Splunk   Cluster  To  The  Cloud  &   Using  Splunk  To   Improve  Reliability  Of   A  Fleet  Of  Mobile   Devices  
Rob  Charlton  
Cloud  DevOps  Architect,  Vertu  

Disclaimer  
During  the  course  of  this  presentaKon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauKon  you  that  such  statements  reflect  our   current  expectaKons  and  esKmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaKon  are  being  made  as  of  the  Kme  and  date  of  its  live   presentaKon.  If  reviewed  aTer  its  live  presentaKon,  this  presentaKon  may  not  contain  current  or   accurate  informaKon.  We  do  not  assume  any  obligaKon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiKon,  any  informaKon  about  our  roadmap  outlines  our  general  product  direcKon  and  is  subject  to   change  at  any  Kme  without  noKce.  It  is  for  informaKonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaKon  either  to  develop  the  features  
or  funcKonality  described  or  to  include  any  such  feature  or  funcKonality  in  a  future  release.  
2  

Agenda  
!  About  Vertu   ! Vertu's  Digital  TransformaKon   ! Splunk  @  Vertu   !  Demo  Environment   !  Live  Demo:  Deploying  a  Splunk  cluster  using  Ansible   !  Live  Demo:  Crashing  my  phone!  
3  

About  Vertu  CorporaKon  
· BriKsh  manufacturer  and   retailer  of  handmade  luxury   phones  
4  

Vertu  Timeline  

Founded   Signature  ­  

First  

Private   Vertu  Ti  

by  Nokia   First  phone   Smartphone   Equity   (Android)  

Vertu   Aster  

1998   2002  

2010  

2012   2013  

2014  

5  

Vertu's  Digital  TransformaKon  

Cloud  

On--premises     &  managed  IT  

Ops  culture  

No  Ops  funcKon  

On  the  path  to  DevOps  

Data  and  IoT  
6  

Splunk  @  Vertu  
! Splunk  Enterprise  used  since  2012  
­ Gather  diagnosKcs  from  phones  being  producKsed   ­ Analyse  using  Splunk  to  give  us  insight  into  when  to  launch  
!  Today  we'll  see:  
­ Live  demo:  Deploying  a  test  Splunk  cluster   ­ Live  demo:  Capturing  analyKcs  from  my  phone  as  it  crashes  
7  

Demo  Setup  

Simplified  Demo  Setup  
Amazon  VPC  (private  network)  

search  head  

cluster  master  

elasKc   load   balancer  

web  server  

web  

indexers   app   9  

Forwarder  +     phone  log  receiver  
data  

Deployment  Using  Ansible  
! Ansible  is  a  configuraKon  management  tool,  similar  to  Puppet,  Chef   or  Saltstack  
!  You  can  automate  the  deployment  and  configuraKon  of  your   infrastructure  by  wriKng  Ansible  playbooks  
!  We're  going  to  use  Ansible  to  deploy  the  whole  demo  setup   !  But  first,  we  need  to  break  it...  
10  

Destroy!  
!  Chaos  Monkey  is  a  tool   developed  by  Nemlix  to  improve   the  resilience  of  their  systems   by  randomly  destroying   machines.  
!  I  feel  Splunk  should  have  a  more   appropriate  animal...  
11  

Live  Demos:   First  Up  --  
Deploying  Splunk   Cluster  With  Ansible  
   (aTer  the  chaos  pony  breaks  it)

DemonstraKon  Overview  
!  Chaos  Pony  destroys  the  Splunk  Cluster  (<1  min)   !  Run  Ansible  playbook  to  create  empty  machines  (~4--5  min)  
­ Blank  Debian  linux  install  from  Amazon  images  
!  Run  Ansible  playbook  to  deploy  Splunk  (~10  min)  
­ Sets  up  complete  OS,  adds  users,  base  APT  packages  etc.  as  well   ­ I'll  explain  some  of  the  playbook  workings  during  this  Kme  
!  Run  Ansible  playbook  to  deploy  the  log  receiver  applicaKon  (~4  min)  
­ Installs  a  lot  of  Python  packages  
!  DemonstraKon  of  our  Splunk  alerts  and  Dashboards  (~15  min)  
­ Live  phone  crashing!  
13  

DemonstraKons  

15  

16  

17  

18  

19  

20  

21  

22  

23  

24  

Pause  While  Main  Play  Runs  
!  Lets  examine  what's  in  the  Ansible  code  
25  

26  

27  

28  

29  

30  

31  

32  

33  

Back  To  The  Deployment...  
!  Now  it  is  finished  
34  

35  

36  

37  

38  

39  

40  

41  

42  

43  

THANK  YOU  

