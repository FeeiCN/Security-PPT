Copyright  ©  2015  Splunk  Inc.  
Guerrilla  Marke+ng  
How  to  sell  Splunk  internally  to  your   Enterprise  
Aaron  Blythe  
Knowledge  Architect,  Cerner   Corpora@on  

Disclaimer  
During  the  course  of  this  presenta@on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau@on  you  that  such  statements  reflect  our   current  expecta@ons  and  es@mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta@on  are  being  made  as  of  the  @me  and  date  of  its  live   presenta@on.  If  reviewed  aPer  its  live  presenta@on,  this  presenta@on  may  not  contain  current  or   accurate  informa@on.  We  do  not  assume  any  obliga@on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi@on,  any  informa@on  about  our  roadmap  outlines  our  general  product  direc@on  and  is  subject  to   change  at  any  @me  without  no@ce.  It  is  for  informa@onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga@on  either  to  develop  the  features  
or  func@onality  described  or  to  include  any  such  feature  or  func@onality  in  a  future  release.  
2  

Aaron  Blythe    
hUp://aaronblythe.org/    
!  Wri@ng  Code   !  Answering  ques@ons      !  Running  Meetups  
@ablythe  

Health  care  is  too  important   to  stay  the  same.TM    

The  solu@on  that  started  it  all  

Cerner  today  

Popula@on  health  management  

Clinic

Hospital Home

Employer

Member

Fitness Center

School

Long-Term Care
Retail Pharmacy

Connect      Empower      Facilitate  
Move  from  reac@ve  care   to  proac@ve  health  

Member  engagement  across  the  spectrum  

Cerner's  success  
#4  
Top  100  Healthiest   Workplaces  in  America  
5--year  results  
· Lowered  premium  increases   · 1.6%  vs.  7--10%  na@onal  
average  
· Decreased  risk  factors   · Improved  biometric  screening  
results  

Agenda  
!    Know  who  you  are     !    Make  things  surprisingly  easy     !    Gather  endorsements     !    Be  helpful  in  many  mediums     !    Promote  your  community     !    Create  champions     !    When  all  else  fails,  hold  a  contest       
10  

"I'm  referring  to  the  soul  and  essence  of  guerrilla   marke@ng  which  remain  as  always  --  
achieving  conven@onal  goals,   such  as  profits  and  joy,  with   unconven@onal  methods,   such  as  inves@ng  energy   instead  of  money."  
11  

Know  Who  You  Are  

2015  we  believe  
· Enable  self  services   · Transparency  leads  to  beUer  service  
· Everything  in  source  control  
--  Cerner  OpsInfra  Team  
13  

2014  we  believe...  
· A  minimal  number  of  associates  need  to  directly   touch  nodes  (approaching  zero)  
· These  tools  maUer  ­  improve  the  lives  of  our  users   · Tools  should  be  hardened  --  so  that  we  can  find  the  
root  cause  and  drive  correc@ve  ac@on  
  
14  

15  

Surveys  
!  Use  Google  Docs  FTW!!!  
16  

Be  transparent  
17  

Make  Things   Surprisingly  Easy    

Chef  cookbook  
19  

What  we  need  
!  1  hour  mee@ng   !  Person  in  the  room  with:  
­ troubleshoo@ng  knowledge  of  applica@on  (which  logs  are  valuable)   ­ root  access  to  the  node  (so  we  can  bootstrap  Chef)   ­ knowledge  of  Splunk  and  Chef  (someone  from  my  team)  
20  

Steps  
!  Bootstrap  nodes  to  Chef  with  Cerner_Splunk  role  on  run  list   !  Run  chef--client  on  nodes  
21  

Hide  everything  but  the  details  

Chef  Role  

Chef  Environment  

22  

Jira  usage  
23  

Not  top  down  
· Is  this  the  right  thing  to  do?   · Will  it  take  very  much  index?  
24  

Gather   Endorsements  

Crea@ng  allies  
Splunk  has  played  a  vital  role  in  stabilizing  our  Jira  environments.  In  what   would  have  taken  weeks  of  manual  correla@on  and  analysis  can  be   summarized  in  Splunk  in  maUer  of  minutes.   For  example  we  were  able  to  iden@fy  a  server  was  excessively  calling  our   server,  then  moving  straight  from  that  to  the  URI's  that  the  server  was   accessing.  We  were  able  to  contact  the  team  that  was  abusing  our  service  and   they  were  able  to  scale  back  their  web  calls  correc@ng  our  slowness  issue.   Without  Splunk  I  feel  that  this  process  would  have  taken  weeks  to  discover,   if  at  all.  This  is  saving  my  team  @me  in  inves@ga@on,  not  to  men@on  the  @me   of  all  other  associates  by  resolving  this  slowness  issue  quicker.   Joe  Hostler   System  Engineer,  CWx  Emerging  Technology  Services  
26  

Document  the  nice  things  
27  

Be  Helpful  in  Many   Mediums  

Go  to  where  the  users  are  asking  ques@ons  

Internal  logs  in  Splunk  

Internal  logs  not  in  Splunk  

External  

29  

Provide  a  place  to  discuss  
30  

Provide  educa@on  
31  

Promote  your   community  

Encourage  
33  

Seize  the  Opportunity  
· Meetups   · Conferences  
  
34  

Internal  Conferences  
! DevCon  2012  ­  1  talk   ! DevCon  2013  ­  0  talks  on  Splunk  
!  Started  Opsinfra  team  
! DevCon  2014  --  1  talk  from  Opsinfra  team   ! DataCon  2014  ­  1  talk  from  Opsinfra  team   ! DevCon  2015  ­  3  talks  (1  from  Opsinfra  team)   ! DataCon  2015  --  3  talks  (1  from  Opsinfra  team)  
35  

Create  Champions  

Garry  Polley  
· Canadarm  ­  Open  Source  Project   · Configurable  JavaScript  collec@on   · Send  informa@on  back  to  Splunk  
hUp://engineering.cerner.com/blog/javascript-- logging--we--can--do--beUer/    
37  

Rima  Poddar  
· Defined  and  explained  evenUype  usage   · Prototyped  first  working  aler@ng  sub--
system  
hUp://engineering.cerner.com/blog/ managing--30000--logging--events--per--day--with-- splunk/    
38  

Mike  Hemesath  
· Defined  and  explained  evenUype  usage   · First  major  use  of  pivot  tables     · Many  internal  presenta@ons  to  other  
teams  and  leadership   · Push  for  standardiza@on  
hUp://engineering.cerner.com/blog/ managing--30000--logging--events--per--day--with-- splunk/    
39  

Hold  a  Contest  

41  

42  

43  

Extend  the  Deadline  
!  We  did  this  3  @mes,  got  more  submissions  each  @me.  
44  

Review  

Summary  
!    Know  who  you  are     !    Make  things  surprisingly  easy     !    Gather  endorsements     !    Be  helpful  in  many  mediums     !    Promote  your  community     !    Create  champions     !    When  all  else  fails,  hold  a  contest       
46  

THANK  YOU  

