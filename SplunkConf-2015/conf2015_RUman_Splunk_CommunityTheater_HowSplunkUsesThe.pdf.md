Copyright  ©  2015  Splunk  Inc.
Splunk  Add--on  for  JIRA
Russell  Uman
Senior  Web  Engineer,  Splunk

2
Disclaimer
During  the  course  of  this  presentaHon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauHon  you  that  such  statements  reflect  our   current  expectaHons  and  esHmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those   contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward--looking   statements  made  in  the  this  presentaHon  are  being  made  as  of  the  Hme  and  date  of  its  live  presentaHon.   If  reviewed  aQer  its  live  presentaHon,  this  presentaHon  may  not  contain  current  or  accurate  informaHon.  
We  do  not  assume  any  obligaHon  to  update  any  forward  looking  statements  we  may  make.  
In  addiHon,  any  informaHon  about  our  roadmap  outlines  our  general  product  direcHon  and  is  subject  to   change  at  any  Hme  without  noHce.  It  is  for  informaHonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaHon  either  to  develop  the  features  
or  funcHonality  described  or  to  include  any  such  feature  or  funcHonality  in  a  future  release.

What  Are  We  Talking  About?
! Why  Splunk  JIRA? ! The  fascinaHng  History  of  Splunking  JIRA ! What  can  the  Add--on  do? ! Live  demo  of  the  things  the  Add--on  can  do ! AddiHonal  things  we  expect  the  Add--on  to  be  able  to  do  in  the  near   future ! QuesHons,  etc.

Why  Splunk  JIRA?

The  FascinaHng   History  of  Splunking  
JIRA

6
What  Can  The  Add--on  Do?
! Filters  and  issues ! Jqlsearch ! Changelog ! Rapidboards
lall  (sprints) llist  (boards) l<id>  (sprints  on  a  specific  board) ldetail  issues  (issues  instead  of  sprints) ! Batch

Live  Demo
7

8
Epics  And  Their  Children
|  jirarest  jqlsearch  "project=WEB  AND  type=Epic  and  labels=FY16Q3"   |  join  type=leQ  Key  [             |  jirarest  jqlsearch  "project=WEB  AND  type=Epic  and  labels=FY16Q3"             |  eval  foo="foo"             |  transacHon  foo             |  eval  bar=mvjoin(Key,  "  ")           |  map  search="|  jirarest  batch  \"status  WAS  NOT  Closed  ON  2015--02--01  AND  'Epic   Link'  IN\"  $bar$"             |  eval  "Issue  Count"=if(Status="Closed"  OR  Status="ProducHon  QA",  "Closed",   "Open")             |  chart  count  by  "Epic  Link",  "Issue  Count"             |  rename  "Epic  Link"  TO  Key  ] |  table  Key,  "Epic  Name",  Assignee,  "Due  Date",  Status,  Open,  Closed

9
! Comments ! Changefield ! ChangeHme ! Fields

OpHons

10
Upcoming  features
! Secure  password  storage lCurrently  credenHals  are  in  bin/config.ini  which  at  least  won't  leak   through  the  REST  API
! MulH--environment ! Worklog  mode

11
HOW?!???!
hrps://splunkbase.splunk.com/app/1438/ hrps://github.com/firebus/splunk--jira ruman@splunk.com

12
WHAT?!???!

THANK  YOU

