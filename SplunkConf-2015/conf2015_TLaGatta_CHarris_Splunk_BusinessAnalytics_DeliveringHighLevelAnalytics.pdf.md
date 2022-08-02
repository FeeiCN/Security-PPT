Copyright  ©  2015  Splunk  Inc.  
Delivering  High--Level   Analy@cs  Reports  
Dr.  Tom  LaGa>a  
Senior  Data  Scien@st  /  Analy@cs  Specialist  
Splunk     
Cody  Harris  
SE  Manager  /  Analy@cs  SME   Splunk  

Who  Are  We?  
Intros  

· Dr.  Tom  LaGa5a   · New  York,  NY   · Senior  Data  Scien@st   · Analy@cs  Specialist   · NYC  Cyclist  

· Cody  Harris,  MBA   · Sea>le,  WA     · SE  Manager  ­  NW  Majors   · Analy@cs  SME   · Avid  Snowboarder    
  

Disclaimer  
During  the  course  of  this  presenta@on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau@on  you  that  such  statements  reflect  our   current  expecta@ons  and  es@mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those   contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta@on  are  being  made  as  of  the  @me  and  date  of  its  live   presenta@on.  If  reviewed  a[er  its  live  presenta@on,  this  presenta@on  may  not  contain  current  or   accurate  informa@on.  We  do  not  assume  any  obliga@on  to  update  any  forward  looking  statements  we   may  make.        In  addi@on,  any  informa@on  about  our  roadmap  outlines  our  general  product  direc@on  and  is  subject  to   change  at  any  @me  without  no@ce.  It  is  for  informa@onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga@on  either  to  develop  the  features   or  func@onality  described  or  to  include  any  such  feature  or  func@onality  in  a  future  release.  
3  

Business  Analy@cs   at  Splunk  

Analy@cs  Everywhere  with  Splunk  
· You've  already  onboarded  lots  of  data   · Now  use  Splunk  to  solve  Business  Problems   · In  this  talk:  
­ Deep  dive  into  doing  Analy@cs  with  Splunk   ­ Opera@onalizing  your  Analy@cs  projects  
· Analy@cs  use  cases:  
­ Understand  Customers  &  Business  Processes   ­ Unify  mul@ple  channels  of  interac@on  
· Use  Splunk  as  your  data  fabric  
5  

IT  Users  

Analy@cs  Ecosystem  

Analysts  

Business  Users  

Analysts  

Business  Users  

Ad  Hoc   Search  

Monitor   and  Alert  

    Reports  /   Analyze  

Custom   Dashboards  

ODBC   SDK   API  

Clickstreams   Devices  

Networks  

Hadoop  

GPS  /   Cellular  

Servers  

Applica@ons  

Online  

Shopping  Carts  

DB  Connect   Look--Ups  
6  

Data  Warehouse   Structured  Data  Sources  
CRM   ERP   HR   Billing   Product   Finance  

Apps  &  Capabili@es  for  Business  Analy@cs  
Apps,  Features  &  Partners  
·DB  Connect   ·ODBC  Driver   ·Stream   ·MINT   ·Data  Models   ·Pivot  
7  

Deep  Dive  into  Analy@cs   with  Splunk  

Build  a  Customer  360  Dashboard  

· Deep  dive  into  Customer  view  
· Improve  Customer  Experience    
· "Is  this  customer  happy?"  
· Panels  for  all  user  interac@ons:  
­ All  web  ac@vity   ­ All  purchase  ac@vity   ­ All  support  ac@vity  
· Tip:  Select  Customer  with  input  
<<generating search>> | stats values(Id) as values
| mvexpand values  

Source:  Oscar  Health  Insurance  

9  

Build  Execu@ve  Dashboards  
· Give  exec  high--level  overview   · Roll  up  lower  level  dashboards   · Keep  it  simple  &  to  the  point   · Technical  checkup:  
­ Make  sure  APIs  healthy   ­ Acceptable  #  of  customer  interac@ons  
· Business  checkup:  
­ How  much  $  week--over--week?   ­ Program  revenue  vs.  cost  
· Tip:  use  tstats  for  fast  visualiza@ons  
10  

Use  Effec@ve  Visualiza@ons  
· Most  powerful  viz  are  the  simplest:  
­ Single  value   ­ Stacked  bar  chart  w/  chart  overlay   ­ Table  
· More  advanced:  
­ Bubble  chart:  correlate  mul@ple  fields   ­ Choropleth  (new!):  view  fields  on  map   ­ Swimlanes  (ES)  &  Glass  Table  (ITSI)  
· Cool  visualiza@ons  make  it  pop:  
­ Boxplot:  incorporate  error  bars   ­ Sankey  chart:  good  for  visualizing  flows   ­ Satoshi  Kawasaki's  Custom  Viz  app:  
h>ps://splunkbase.splunk.com/app/2717/  
11  

Emphasize  Ac@onable  Insights  
· Avoid  eye--candy  visualiza@ons  
­ "Laser  beam"  threat  dashboards  look  cool  but  are  useless  
· "How  does  this  help  me  solve  my  problem?"   · Guide  the  viewer  to  drilldown  &  act  quickly  

Confusing  viz:  not  ac@onable  

Good  viz:  ac@onable  
12  

Custom  Viz:  Sankey  Chart  
· Visualize  Customer  flows  with  Sankey  charts  
­ Install  Satoshi's  Custom  Viz  app   ­ Copy  the  panel  reference  to  your  dashboard   ­ Modify  your  dashboard  tag:  <dashboard  script="custom_vizs:autodiscover.js">   ­ Edit  the  search  to  match  your  data  
· Example  search:  
sourcetype=access_combined action=*  | reverse  | streamstats current=f last(action) by JSESSIONID  | streamstats count as stage by JSESSIONID  | fillnull value=START last(action) | eval from=(stage-1).":".'last(action)' | eval to=stage.":".action  | stats count by from to"
13  

Building  Analy@cs  Workflows  
· Business  Problem:  find  most  valuable  customers  &  improve  experience  
· People  &  process:    
­ IT  onboards  the  data   ­ Power  Users  write  the  queries   ­ Analysts  deep  dive  into  customers  
· Example  workflow:  
­ Gather  low--level  events  which  make  up  transac@ons   ­ Enrich  with  high--level  customer  data     ­ Assign  value  scores,  then  aggregate  by  Session  and  User      ­ Iden@fy  devia@ons  of  scores  from  baselines   ­ Flag  output  for  analy@cs  review  
14  

Building  Analy@cs  Workflows  (cont.)  
· Example  query  for  this  panel  
­ Search  web  logs   ­ Compute  value  per  session   ­ Aggregate:  avg  value  &  total  value   ­ Add  flags  based  on  baseline  criteria  
 sourcetype=access_combined action=purchase  | stats sum(price) as sessionvalue by customerId JSESSIONID | stats count as numsessions, avg(sessionvalue) as avgsessionvalue, 
sum(sessionvalue) as totalvalue by customerId | eventstats perc80(avgsessionvalue) avg(totalvalue) stdev(totalvalue) | eval flag = mvappend(
if( numsessions >= 6, "high numsessions", null()),  if( avgsessionvalue >= 'perc80(avgsessionvalue)', "high avgsessionvalue", null()), if( totalvalue - 'avg(totalvalue)' >= 3*'stdev(totalvalue)', "high totalvalue", null()) ) | fields - perc80(* avg(* stdev(* | sort 100000 -totalvalue"
15  

Opera@onalizing   Analy@cs  Projects  

How  To  Plan  Analy@cs  Projects  
· Business  Users  care  about  value:  
­ High--Level  Business  En@@es   ­ Built  from  Low--Level  Data  Sources  
· Iden@fy  Business  Problems  &  En@@es   · Iden@fy  Data  Sources  to  build  En@@es   · Do  the  analysis  (call  the  Power  Users)   · Iterate  &  integrate  deliverables    
into  workflow  
17  

Mul@ple  Paths  for  Defining  Projects  
· People  first  
­ Find  target  audience   ­ Learn  their  Business  Problems  &  document  requirements   ­ Build  deliverables   ­ Iterate  to  meet  needs   ­ Integrate  into  workflow  
· Problems  first  
­ Iden@fy  Business  Problems   ­ Build  a  prototype  app   ­ Show  target  audience   ­ Iterate  to  meet  needs   ­ Integrate  into  workflow  
18  

Every  Department  Is  Different  

· Nominate  a  Power  User  on  each  team  
­ Power  User  knows  the  team's  data   ­ Works  with  dept  Business  Users   ­ Builds  basic  dashboards  
· Data  team  or  Splunk  COE  
­ Onboards  new  data  sources  (with  IT)   ­ Responds  to  escala@ons  from  Power  Users   ­ Helps  Power  Users  with  adv.  dashboards  
· Benefits:    
­ Deliver  ac@onable  insights  to  everybody   ­ Clear  division  of  responsibility  
19  

Manufacturing   Security  

Customer   Support  

Marke@ng  

Finance  

Data   Team  

Enrich  Your  Data  Fabric  

· Business  Data  
­ All  your  customer  records  via  DB  Connect  
· Social  Media  Data  
­ Brand  sen@ment    customer  experience  
· Open  Data  
­ Weather  data    machine  opera@ons   ­ Financial  &  economic  factors    revenue   ­ Splunk4Good.com  
· Get  External  Data  via  REST  API  Modular  Input:  
­ h>ps://splunkbase.splunk.com/app/1546/  

>
Image  modified  from  okfn.org  

20  

Closing  Remarks  

Call  to  Ac@on  
· Deliver  ac@onable  insights  
­ Build  Customer  360  &  Execu@ve  dashboards   ­ Help  Business  Users  solve  problems  
­ Implement  Analy@cs  workflows   · Join  your  local  Splunk  User  Group   · Need  help?  Reach  out  to  your  tech  team!  
­ Analy@cs  SMEs  are  here  to  help   ­ Analy@cs  Specialists  available  for  advanced  use  cases  
22  

