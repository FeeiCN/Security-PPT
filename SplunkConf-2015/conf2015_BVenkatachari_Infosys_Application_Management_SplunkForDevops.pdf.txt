Copyright  ©  2015  Splunk  Inc.  
Splunk  for  Devops  
Balaji  Venkatachari  
Sr  Architect,  Infosys  

Agenda  
!  About  me  and  my  employer     ! Devops  As--is   ! Splunking  Devops   !  What  it  takes  to  realize  this  in  Splunk   !  Summary   !  Q  &  A     
2  

Disclaimer  
During  the  course  of  this  presentaLon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauLon  you  that  such  statements  reflect  our   current  expectaLons  and  esLmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaLon  are  being  made  as  of  the  Lme  and  date  of  its  live   presentaLon.  If  reviewed  aUer  its  live  presentaLon,  this  presentaLon  may  not  contain  current  or   accurate  informaLon.  We  do  not  assume  any  obligaLon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiLon,  any  informaLon  about  our  roadmap  outlines  our  general  product  direcLon  and  is  subject  to   change  at  any  Lme  without  noLce.  It  is  for  informaLonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaLon  either  to  develop  the  features  
or  funcLonality  described  or  to  include  any  such  feature  or  funcLonality  in  a  future  release.  
3  

About  Me  And  My   Company  

About  Me  And  My  Company  
!  Senior  Architect   !  2+  years  in  Splunk   !  Veteran  in  java  technology   !  Technology  services  delivery  and  consulLng   !  Infosys  has  its  own  Splunk  code  with  30  Splunk  trained  resources   !  Delivered  Splunk  soluLons  across  IT  operaLons,  security  and  
business  analyLcs  for  major  clients     
5  

Copyright  ©  2015  Splunk  Inc.  
Dev  Ops  As--is  

Don't  Lose  Sight  Of  The  Forest  For  The  Trees  
Plan  

Plan  

Develop  

Test  

Deploy  

What  it  takes  

Deploy  

Splunk  

Develop  

Test  

7  

Infrastructure   OperaLons  

Build   Successful  

Current  Challenges  

Development  

Product  Owner  

Failed  to   Deploy  

Increase   the  
velocity  

Endless  MeeLngs   8  

Siloed  Tracking  

Copyright  ©  2015  Splunk  Inc.  
Splunking  Dev  Ops  

Enter  Splunk  for  Smart  Dev  Ops  

How  to   detect  /
predict   failures  

How  can  I   improve  my  
delivery   lifecycle  

Why  is  there  a   discrepancy  in  my    prod  
and  staging     performance  

I  need  end  to  end   traceability  from  build  to  
deployment  

How  can  I  increase   my  release  cycles  
Why  is  my   deployment  
failing  
How  is  my   development   team  producLvity  
Can  I  increase  the   sprint  velocity  
10  

Logical  View    

Task  Tracker  

Source  Control  

CD  Server  
Common  InformaLon  Model  

Modular  Inputs  

CI  Server  

ApplicaLon  
Forwarder  

11  

Copyright  ©  2015  Splunk  Inc.  
What  It  Takes  To   Realize  This  In  Splunk  

How  Does  It  Work   13  

Task  Tracker   Cont  Build   Src  Control   Cont  Deploy   App  Log  

Modular  Input  ConfiguraLon  
14  

CIM  IllustraLon  

Task  Tracker   Task_id  
Task_desc   Assignee   Sprint_id  

Source  Control   CI  Server  

CD  Server  

Branch_id  

Build_id  

Deploy_id  

Change_desc  

Test_cases  

Deploy_desc  

lastCommit  

Build_status   Deploy_status  

commicedBy   Build_duraLon   Deploy_host  

Sprint_id  

Sprint_id  

Sprint_id  

15  

Summary  

Summary    
!  Splunk  can  help  reduce  issue  resoluLon  Lmelines  and  improve  Dev   Ops  efficiency  and  velocity    
!  CIM  can  help  abstract  the  underlying  data  format  to  be  extended   across  mulLple  tool  sets  
17  

Further  Reference  
Related  breakout  sessions  and  acLviLes...  
!  Modular  Inputs   !  hcp://blogs.splunk.com/2013/04/16/modular--inputs--tools/   ! hcp://blogs.splunk.com/2014/09/17/new--support--for--authoring--
modular--inputs--in--node--js/   ! hcp://blogs.splunk.com/2013/06/18/gehng--data--from--your--rest--
apis--into--splunk/   !  Custom  REST  Endpoints   ! hcp://docs.splunk.com/DocumentaLon/Splunk/6.2.5/
AdvancedDev/SetupExampleCustom  
18  

THANK  YOU  

