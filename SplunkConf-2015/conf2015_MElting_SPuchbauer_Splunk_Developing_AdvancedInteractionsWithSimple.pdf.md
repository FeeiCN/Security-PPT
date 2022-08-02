Copyright  ©  2015  Splunk  Inc.  
Advanced   Interac=ons  with   Simple  XML  
Mathew  El=ng   Siegfried  Puchbauer  
        

Disclaimer  
During  the  course  of  this  presenta=on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau=on  you  that  such  statements  reflect  our   current  expecta=ons  and  es=mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta=on  are  being  made  as  of  the  =me  and  date  of  its  live   presenta=on.  If  reviewed  aRer  its  live  presenta=on,  this  presenta=on  may  not  contain  current  or   accurate  informa=on.  We  do  not  assume  any  obliga=on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi=on,  any  informa=on  about  our  roadmap  outlines  our  general  product  direc=on  and  is  subject  to   change  at  any  =me  without  no=ce.  It  is  for  informa=onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga=on  either  to  develop  the  features  
or  func=onality  described  or  to  include  any  such  feature  or  func=onality  in  a  future  release.  
2  

!  Background  
!  What's  new  
!  Live  Example  
­ Tokens   ­ Event  Handlers   ­ Show/Hide  content   ­ Search  Events  
!  Wrap--Up  

Agenda  

3  

Splunk  Web  Framework  

Visual  Editor  

Simple  XML  

Custom  HTML  w/   Splunk  JS  Stack  

Advanced  XML  

Descrip@on  

100%  GUI  Driven;  drag--and-- drop  panels.    Basic  visual   edi=ng  

XML  config  driven;  constrained,   Full  HTML  support.    Leverage  

defined  object  model    

library  of  JS  components  

Internally  supported  

XML  config  driven;   unconstrained;  internally/ externally  supported  

· PDF  Prin=ng   · Drag--and--Drop  (full)   · Form  Inputs  
When  to  Use  

· Dynamic/Contextual   Drilldown  
· Event  Handlers   · Addi=onal  Layout/Display   · Add  op=ons  /  parameters   · PDF  Prin=ng   · Drag--and--Drop  (full)   · JS/CSS  Extensions  

· Custom  Layout   · Custom  Form  Inputs   · Addi=onal  interac=vity   · New  Visualiza=ons   · Custom  Javascript  

· Custom  Layout   · Custom  Form  Inputs   · Addi=onal  Interac=vity   · New  Visualiza=ons   · Legacy  support   · Reusable  modules  

4  

Anatomy  of  a  Dashboard  

<form> <label>My Dashboard</label>
<fieldset> <input> <!­ form inputs --> </input>
</fieldset>
<row> <panel> <chart> <!­ ... --> </chart> <table> <!­ ... --> </table> </panel>
</row> </form>

Title   Form  Inputs  (fieldset  /  inputs)  

Row   Panel   Element  

Panel   Element  
Element  

5  

Simple  XML  Has  Come  a  Long  Way  

Splunk 6.1
· Form Inputs · Drilldown

Splunk 6.2
· Reusable Panels · Multi-Search Management

Splunk 6.3
· Search Events · Dashboard Eval Expressions · Link Switcher

6  

Let's  build  some   dashboards!  
7  

The  Data:  Track  Day  
!  Sonoma  Raceways  
­ 1  Day   ­ 28  Splunkers   ­ 30  Cars  
!  Data  via  
­ ODB  II  Dongle  -->  Cloud  Service  -->  Modular  Input   ­ Loca=on  data  &  metrics  (speed,  rpm,  etc)  
8  

Building  Dashboards  
Part  I  
9  

Tokens  
!  Automa=c  data  binding   !  Variables  ­  connec=ng  components  and  interac=ons   !  Use  in  UI  or  XML     
10  

Token  Filters  
!  Insert  altered/processed  value   !  Built--in  
­ $token|s$ --  search  escape   ­ $token|u$ --  URL  encode   ­ $token|h$ --  HTML  escape  
!  Build  your  own  (in  Javascript)  
­ $token|myfilter$  
11  

Form  Input  Values  and  Token  Namespaces  

!  Token  Namespaces  
­ default  ­  current  values  of  form   input  fields  
­ submiFed  ­  submioed  values  of   fields  
­ url  ­  submioed  form.*  tokens   persisted  

!  $form.mytoken$! tokens  contain  raw  form  input  
!  $mytoken$!
aRer  applying  prefix,  suffix,  default  
value  

Refer  to  namespaces:  
$submitted:driver$!

12  

Building  Dashboards  
Part  II  
13  

Event  Handlers  
!  Introduce  behaviors  based  on  event  hooks  
ê User  ini=ated  events,  or  search  job  events  
!  Types  
ê drilldown  ­  user  clicks  on  a  cell,  or  bar  on  a  chart   ê input  /  change  ­  user  selects  a  value  on  a  form  input   ê selec=on  ­  for  line/column/area,  user  selects  a  window  to  zoom  into   ê search  ­  events  come  back  from  a  search  job  (progress,  finalized,  error)  
!  Configure  Behaviors  
ê Set  tokens   ê Unset  tokens   ê Link  to  another  page  or  search   ê Evaluate  new  tokens  
  
14  

Show  and  Hide  Content  
!  Control  whether  you  hide  or  show  a  given  object  based  on  existence   of  a  token  
ê Contextual  (in--page)  Drilldown     ê Cascading  Form  Inputs  
!  Applies  to  element,  row,  panel,  input  objects   !  Type  
ê <table depends="$show_table$">!
­ Hide  by  default,  show  when  token(s)  exist  
ê <table rejects="$hide_table$">!
­ Show  by  default,  hide  when  token(s)  exist  
15  

Building  Dashboards  
Part  III  
16  

Search  &  Result  Token  Seoer    
· Advanced  Dashboard  Logic   · Key  Benefits  
ê Include  result  count  in  =tle   ê Null  search  swapper  (hide  if  search  returns  no  results)   ê Custom  HTML  element  driven  by  search  object  
· Run  search  object  anywhere  on  the  page   · Set  tokens  within  search  based  on  
ê Search  metadata  (string,  earliest/latest)   ê Job  metadata  (result  count,  run  =me)   ê 1st  result  
· Eval--based  condi=on/value  support  
17  

Wrap--Up  

What's  New  in  6.3  
!  Search  Events  
­ Use  data  from  search  job  and  search  results  in  your  dashboard  
!  Dashboard  Eval  Expressions  
­ Powerful  condi=onal  statements   ­ Evaluate  new  token  values  
!  Link  Switcher  
19  

More  Informa=on  
· Splunk  6.x  Dashboard  Examples     hops://splunkbase.splunk.com/app/1603/  
· Documenta=on     hop://docs.splunk.com/.../6.3.0/Viz/OverviewofSimplifiedXML  

More  Informa=on  
!  Demo  Code     hops://github.com/splunk/advanced--dashboards--conf15  
!  Splunk  6.x  Dashboard  Examples     hops://splunkbase.splunk.com/app/1603/  
· Documenta=on     hop://docs.splunk.com/.../6.3.0/Viz/OverviewofSimplifiedXML  

Splunk  6.x  Dashboard  Examples  App  
!  Recipe  Book  for  Dashboards  
!  Updated  on  Every  Release  
!  Examples  
ê Basic   ê Chart   ê Table   ê Single  Value   ê Map   ê Search  Types   ê Form  Input   ê Drilldown   ê Layout   ê Custom  Visualiza=ons   ê Token  Customiza=on  
!  Tools  
22  

Come  Visit  ­  "Ask  the  Dashboard  Expert"  
@Dashboard  Clinic   !  For  assistance  with  troublesome  dashboards   !  For  migra=on  =ps   !  To  brag  about  something  cool  you  built   !  To  ask  ques=ons   !  Or,  just  to  say  hi!  
23  

THANK  YOU  
</dashboard>  

