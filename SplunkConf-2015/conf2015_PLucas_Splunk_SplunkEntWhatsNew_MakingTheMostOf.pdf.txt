Copyright  ©  2015  Splunk  Inc.  
Making  the  Most  of  the   New  Splunk  Scheduler  
Paul  J.  Lucas  
Sr.  So=ware  Engineer,  Splunk  

Disclaimer  
During  the  course  of  this  presentaHon,  we  may  make  forward  looking  statements  regarding  future  events   or  the  expected  performance  of  the  company.  We  cauHon  you  that  such  statements  reflect  our  current   expectaHons  and  esHmates  based  on  factors  currently  known  to  us  and  that  actual  events  or  results  could   differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  contained  in  our   forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward--looking  statements  made   in  the  this  presentaHon  are  being  made  as  of  the  Hme  and  date  of  its  live  presentaHon.  If  reviewed  a=er  
its  live  presentaHon,  this  presentaHon  may  not  contain  current  or  accurate  informaHon.  We  do  not   assume  any  obligaHon  to  update  any  forward  looking  statements  we  may  make.       
In  addiHon,  any  informaHon  about  our  roadmap  outlines  our  general  product  direcHon  and  is  subject  to   change  at  any  Hme  without  noHce.  It  is  for  informaHonal  purposes  only  and  shall  not  be  incorporated  into  
any  contract  or  other  commitment.  Splunk  undertakes  no  obligaHon  either  to  develop  the  features  or   funcHonality  described  or  to  include  any  such  feature  or  funcHonality  in  a  future  release.  
2  

Personal  IntroducHon  
 Paul  J.  Lucas,  Sr.  So=ware  Engineer,  Splunk    On  the  Core  Server  Engineering  Team    Worked  on  Search  Scheduler  improvements  to  Splunk  Enterprise    Also  worked  on  various  parts  of  the  Deployment  Server    Has  been  using  C++  since  the  "cfront"  days  at  AT&T  Bell  Labs  
3  

Agenda  

 Scheduled  Searches:   A.IntroducHon   B.How  Cron  Works   C. Cron  vs.  Splunk  Scheduler  
 Splunk  Scheduler:   A.Deferred  vs.  Skipped   B.Lag   C.limits.conf  Se_ngs  

 Splunk  Scheduler  Improvements:   A.How  the  Splunk  Scheduler  Works   B.Priority  Scoring   C. Schedule  Windows   D.Variable  max_searches_perc E. ConHnuous  Saved  Searches  "Catch--up"  
 Takeaways    Splunk  Enterprise  6.3  Test  Results  

4  

Copyright  ©  2015  Splunk  Inc.  
Scheduled  Searches  

Scheduled  Searches:  IntroducHon  

 Splunk  allows  you  to  save  your  searches  and  run  them  on  a  schedule    Scheduled  searches  can  be  used  to  trigger  an  alert  acHon  (possibly  when  a  
condiHon  is  met)  or  to  speed--up  dashboards    An  alert  acHon  is  either  sending  an  e--mail  or  running  a  script    Example:  index=_internal  source=*splunkd.log*  error  NOT  debug  

Title  

Too  many  errors  

Trigger  condi@on   Number  of  Results  

Number  of  results  is   Greater  than:  5  

in  

1  Minute  

6  

Scheduled  Searches:  IntroducHon  

 Scheduling  is  specified  via  a  five--field  cron  string:  

  

           

!!* !!* !!* !!* !!* !!!!"#!!!"###!!"#####!"#######"#######################d###am##yd#o  oanhfyto  wmh  oue i f(rn1e   m (u­k0to1 ­ (e02n2  ()t3  -0h-)  ­6  (5)1  9(­S)3u   1n)day­Saturday)

  

 All  (*),  ranges  (1­5),  lists  (1,8,15,22),  and  "every  n"  (*/6)  allowed  

 Example:  0 */6 1,15 * *  =  every  6  hours  on  the  hour  on  the  1st  and  15th  

7  

How  Cron  Works  
1.For  each  cron  entry,  calculate  the  next  run--Hme  of  the  command   2.Place  all  commands  in  a  priority  queue  by  Hme   3.Enter  main  loop:  
A.Examine  the  entry  at  the  head  of  the  queue   B.Calculate  the  delta  between  that  entry's  next  run--Hme  and  now   C. If  delta  >  0,  sleep  for  that  period  of  Hme   D.Run  the  entry's  command  (in  the  background)   E. Calculate  the  next  run--Hme  of  the  command  and  place  it  back  on  the  queue  
with  that  new  Hme  value  
8  

Cron  vs.  Splunk  Scheduler  

Cron  

 No  job  quotas  

 EnHrely  manual  scheduling  --  have  

to  skew  searches  by  hand:  

  

  

0    0  *  *  *  command--1   15  0  *  *  *  command--2  

   30  0  *  *  *  command--3  

   45  0  *  *  *  command--4  

  

 Limited  to  a  single  machine  

Splunk  Scheduler  
 Quotas:  limit  search  concurrency  --   reserves  CPU  for  other  tasks  
 Searches  over  quota  are  deferred,   but  implicitly  retried  repeatedly  for   the  duraHon  of  their  periods  unHl   either  run  or  skipped  
 Can  distribute  searches  across  a   cluster  of  machines  

9  

Copyright  ©  2015  Splunk  Inc.  
Splunk  Scheduler  

Deferred  vs.  Skipped  

 As  menHoned,  searches  over  quota  are  deferred,  but  are  implicitly  retried   repeatedly  for  the  duraHon  of  their  periods  unHl  either  run  or  skipped  

Deferred  
S1    S2    S3    S4    S5     
Time  

Skipped  
S1    S2    S3    S4    S5     
Time  

 Run  Deferred  Skipped

11  

Lag  

 "Lag"  is  the  difference  between  a  search's  dispatch  Hme  and  its  scheduled  4me  

  

  

  

S5     

  

  

scheduled  Hme  

dispatch  Hme  

Lag  

  

 Non--zero  lag  means  scheduler  is  over--subscribed  (at  least  temporarily)  

 Causes  delays  and  may  cause  skipping  

 May  be  miHgated  by  schedule  windows  (new  in  6.3  --  more  later)  

12  

limits.conf  Se_ngs  

 base_max_searches:  A  constant  added  to  max.  total  searches  (default  =  6)  

 max_searches_per_cpu:  Maximum  number  of  concurrent  searches  per  CPU   (default  =  1)  

 Given  those,  the  total  maximum  number  of  concurrent  searches  allowed  is:  

  

   max.  total  searches  =  max_searches_per_cpu  ×  number  of  CPUs  

  

  +  base_max_searches  

  

 max_searches_perc:  Maximum  number  of  concurrent  searches  the  scheduler   can  run  as  a  percentage  of  max.  total  searches  (default  =  50)  

13  

limits.conf  Se_ngs  
 Some  example  numbers:  

CPUs   1   1   8   1   64   1  

6   7   50%   3   6   14   50%   7   6   70   50%   35  

14  

.conf  se_ng   Calculated  

Copyright  ©  2015  Splunk  Inc.  
Scheduler  Improvements   In  Splunk  Enterprise  6.3  

How  the  Splunk  Scheduler  Works  
1.For  each  search,  calculate  the  next  run--Hme  of  the  search   2.Place  all  searches  in  a  map<search_id,next_runHme>   3.Enter  main  loop:  
A.For  each  search,  if  its  next  run--Hme    now,  add  it  to  the  candidate  search  list   B.Randomly  shuffle  the  candidate  list   C. For  each  candidate  search,  calculate  its  priority  score   D.Sort  all  candidate  searches  by  priority  score   E. For  each  candidate  search,  if  it  doesn't  exceed  quota,  run  it,  calculate  the  
next  run--Hme  of  the  search,  and  update  the  map  
16  

Priority  Scoring  
 Problem  in  6.2:  Simple  single--term  priority  scoring  could  result  in  saved  search   lag,  skipping,  and  starvaHon  (under  CPU  constraint)  
 Solu@on  in  6.3:  Bezer  mulH--term  priority  scoring  miHgates  problems  and   improves  performance  by  25%  
score(j)   =  next_run4me(j)     +  average_run4me(j)  ×  priority_runHme_factor     ­  skipped_count(j)  ×  period(j)  ×  priority_skipped_factor     +  schedule_window_adjustment(j)  
17  

Schedule  Windows  
 Problem  in  6.2:  Scheduler  can  not  disHnguish  between  searches  that  (A)  really   should  run  at  a  specific  Hme  (just  like  cron)  from  those  that  (B)  don't  have  to.   This  can  cause  lag  or  skipping  
 Solu@on  in  6.3:  Give  a  schedule  window  to  searches  that  don't  have  to  run  at   specific  Hmes   Example:  For  a  given  search,  it's  OK  if  it  starts  running  someHme  between   midnight  and  6am,  but  you  don't  really  care  when  specifically  
 A  search  with  a  window  helps  other  searches    Search  windows  should  not  be  used  for  searches  that  run  every  minute    Search  windows  must  be  less  than  a  search's  period  
18  

Variable  max_searches_perc  
 max_searches_perc:  Maximum  number  of  concurrent  searches  the  scheduler   can  run  as  a  percentage  of  max.  total  searches  (default  =  50)  
 Problem  in  6.2:  Constant  value  limits  scheduler  during  off--peak  Hmes    Solu@on  in  6.3:  Allow  max_searches_perc  to  vary  by  Hme  or  day:  
max_searches_perc = 50
# Allow value to be 75 anytime on weekends. max_searches_perc.1 = 75 max_searches_perc.1.when = * * * * 0,6
# Allow value to be 90 between midnight and 5am. max_searches_perc.2 = 90 max_searches_perc.2.when = * 0-5 * * *
19  

ConHnuous  Scheduled  Searches  "Catch--up"  

 Problem  in  6.2:  ConHnuous  Scheduled  Searches  (CSSs)  are  missed  due  to  Splunk   downHme  creaHng  data  gaps  
 Solu@on  in  6.3:  By  remembering  last  execuHon  Hme,  missed  CSSs  are  run  as   soon  as  Splunk  comes  back  up  to  fill  in  data  gaps  

Splunk  down  

Splunk  up  

CSS  





   

Time  
20  

Copyright  ©  2015  Splunk  Inc.  
Splunk  Enterprise  6.3   Test  Results  

TesHng  CondiHons  
 Stand--alone  instance  of  Splunk  (non--cluster)    Given  lots  of  searches  and  intenHonally  hamstrung  by  a  low  (15%)  
max_searches_perc  to  test  performance  under  duress    In  producHon,  for  the  same  number  of  searches,  you  should  have  a  higher  
max_searches_perc,  a  bigger  CPU,  or  a  search  cluster  
22  

Splunk  6.2  Test  Results  
Things  to  no@ce:   · Started/skipped  forms  
pazern:  same  searches   are  run  in  same  order   · From  12­2am,  many   searches  are  skipped   · Average  running  searches   is  erraHc  
23  

Splunk  6.3  Test  Results  
Things  to  no@ce:   · Started/skipped  forms  less  
of  a  pazern:  the  search   order  is  being  perturbed   · From  12­2am,  fewer   searches  are  skipped   · Average  running  searches   is  mostly  constant  
24  

Splunk  6.2  Test  Results  

Things  to  no@ce:   · Number  skipped  gets  worse  in  the  
order  as  the  searches  are  in   savedsearches.conf  

· The  "sample"  searches,  despite   being  very  short,  are  almost  always   skipped  

25  

Splunk  6.3  Test  Results  

Things  to  no@ce:   · Number  skipped  is  much  more  
evenly  distributed  regardless  of   savedsearches.conf  

· The  "sample"  searches  are  now   almost  never  skipped  (which  is  the   sensible  thing  to  do)  
26  

Takeaways  
 Splunk  Enterprise  6.3  adds  bezer  priority  scoring  and  search  windows  for  much   improved  saved  search  scheduling  by  at  least  25%  
 For  infrequent  searches  (hourly,  daily,  etc.)  use  schedule  windows    Use  the  built--in  scheduler  performance  reports  (under  Ac4vity  >  System  Ac4vity  
>  Scheduler)  to  monitor  performance:  lots  of  skipped  searches  or  high  lag  is  bad    If,  despite  tuning,  you  sHll  have  frequently  skipped  searches  or  high  lag,  then  
you  probably  need  a  bigger  CPU  or  more  nodes  in  your  cluster  
27  

Copyright  ©  2015  Splunk  Inc.  
QuesHons  

THANK  YOU  

