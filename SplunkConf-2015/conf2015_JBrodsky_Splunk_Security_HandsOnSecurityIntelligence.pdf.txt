Copyright  ©  2015  Splunk  Inc.  
Your  Very  Own   Splunk  ES  Sandbox!  
James  Brodsky   Staff  Sales  Eng/Security  SME      brodsky@splunk.com  

Disclaimer  
During  the  course  of  this  presentaMon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauMon  you  that  such  statements  reflect  our   current  expectaMons  and  esMmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaMon  are  being  made  as  of  the  Mme  and  date  of  its  live   presentaMon.  If  reviewed  aVer  its  live  presentaMon,  this  presentaMon  may  not  contain  current  or   accurate  informaMon.  We  do  not  assume  any  obligaMon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiMon,  any  informaMon  about  our  roadmap  outlines  our  general  product  direcMon  and  is  subject  to   change  at  any  Mme  without  noMce.  It  is  for  informaMonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaMon  either  to  develop  the  features  
or  funcMonality  described  or  to  include  any  such  feature  or  funcMonality  in  a  future  release.  
2  

FAQ:  h[ps://splunk.box.com/es--sandbox--quesMons    

About  Me  
2  Years+  
4  

What's  a  sandbox?  
5  

· A  100%  freWe, h fuallty's  fe  aa  tsuarneddb  1o5x  d?a  y  trial  of  
Splunk  products:  Cloud,  Light,  or  ES   · Hosted  in  AWS   · AuthenMcates  off  of  your  Splunk  account   · Has  sample  data  for  you  to  play  with   · Supports  onboard  of  your  own  data  
Today's  session:  A  hands--on  ac9vity  with  your  very  own   Enterprise  Security  sandbox!  
6  

  
7  

Let's  create  a  sandbox  

hDps://www.splunk.com/getsplunk/es_sandbox  
9  

10  

11  

12  

13  

14  

15  

16  

Let's  fix  a  few  things!  
17  

Let's  fix  a  few  things!  
· Choose  a  Timezone  (Pacific)   · CorrelaMon  Search  Enablement   · Saved  Search  Enablement     
18  

We  want  to  fix   this  

Click  Here  
19  

Click  Here  
20  

1 Type  "30m"  and  
click  green   magnifying  glass  
3 Click  Here  

2 Click  Here  

21  

Click  Here  
22  

Click  Here  
23  

Pick  "Pacific",  and   save  
24  

25  

Click  Here  
26  

Click  Here  
27  

Click  Here  
28  

Type  "High"  to   filter  
29  

Click  "Enable"  for   "High  or  Cri9cal   Priority  Host  with  
Malware   Detected"  
30  

Click  Here  
31  

What's  ES  anyway?  

Machine  data  contains  a  definiMve  record   of  all  interacMons  
Human         Machine  
Machine         Machine  
Splunk  is  a  very  effecMve  plakorm  to  collect,   store,  and  analyze  all  of  that  data  

Splunk  SoluMons  >  Easy  to  Adopt  
Across  Data  Sources,  Use  Cases  &  ConsumpMon  Models  

Splunk  Premium  Apps  

MINT     

Security   Mobile  Intel   VMware   Exchange  

PCI  

Rich  Ecosystem  of  Apps  

Forwarders  

Syslog  /     TCP  /  Other  

Wire     Data  

Plakorm  for  Machine  Data  

RelaMonal   Databases  

Mobile  

Sensors  &   Control  Systems  

Mainframe   Data  

Rapid  Ascent  in  the  Gartner  SIEM  Magic  Quadrant*  
2015  
2015    Leader  and  the  only  vendor  to               improve  its  visionary  posiMon    
2014    Leader     2013    Leader   2012    Challenger   2011    Niche  Player  
*Gartner,  Inc.,  SIEM  Magic  Quadrant  2011--2015.  Gartner  does  not  endorse  any  vendor,  product   or  service  depicted  in  its  research  publicaMon  and  not  advise  technology  users  to  select  only   those  vendors  with  the  highest  raMngs  or  other  designaMon.  Gartner  research  publicaMons   consist  of  the  opinions  of  Gartner's  research  organizaMon  and  should  not  be  construed  as   statements  of  fact.  Gartner  disclaims  all  warranMes,  express  or  implied,  with  respect  to  this   research,  including  any  warranMes  of  merchantability  or  fitness  for  a  parMcular  purpose.    

Splunk  as  the  Security  Nerve  Center  

Network

Firewall Web Proxy

Threat Intelligence

App

Servers

Internal Network Security
36  

Endpoints

ES  Fast  Facts  

4.0  not  in   sandbox...yet  

 Current  version:  3.3,  4.0  just  announced  yesterday!    

 Two  releases  per  year  

 Content  comes  from  industry  experts,  market  analysis,  but  most   importantly  YOU  

 The  best  of  Splunk  carries  through  to  ES  ­  flexible,  scalable,  fast,   and  customizable  

 ES  has  its  own  development  team,  dedicated  support,  services   pracMce,  and  training  courses  

WARNING:  It's  really  rich!  
You  can't  eat  all  of  ES  in  one  siYng,  so  we  won't.  
38  

Security  Posture  

Security  Posture  
How  do  you  start  and  end  your  day?  
40  

Sparklines  

Editable   Key  Security  Indicators  

How  do  we  get  data  in?  

Data  comes  from...  
You  can  actually  do  this  in  the   sandbox,  if  you  want.  

Data  Ingest  +  Common  InformaMon  Model  
 You've  got  a  bunch  of  systems...    How  to  bring  in:  
 Network  AV    Windows  +  OS  X  AV    PCI--zone  Linux  AV    Network  Sandboxing    APT  ProtecMon    CIM  =  Data  Normaliza9on  

NORMALIZATION?!?  

Relax.  This  is     
therefore,  CIM  gets  applied  at  SEARCH  TIME.     
NORMALIZATION?!?  

Data  NormalizaMon  is  Mandatory  for  your  SOC  
"The  organizaMon  consuming  the   data  must  develop  and  consistently  
use  a  standard  format  for  log   normalizaMon."  ­  Jeff  Bollinger  et.  
al.,  Cisco  CSIRT  
Your  fields  don't  match?  Good  luck   crea9ng  inves9ga9ve  queries  
  

Free.   Supported.   Fully   documented.  

Lots  of  apps   support  CIM.  

CIM  Compliant!  

Click  "Data   models"  under  
seYngs  

Click  ">"  next  to   Malware  

Data  Models  are  Accelerated  

Let's  Pivot!  

Pivot  allows  non-- technical  interacMon   with  data  models.  

Click  Malware  

Let's  Pivot!  
1 Click  Malware  
ADacks  
2 Change  to  "Last  24  
hours"   Total  #  a[acks  

Let's  Pivot!  
Click  Area  Chart  

Let's  Pivot!  
Click  Color  

Let's  Pivot!  

SCROLL  and  find   Signature,  and  click  

Let's  Pivot!  
You  can  save  as   reports  and  dash  
panels...    

Let's  Pivot!  

Let's  Pivot!  
Click  "Malware   ADacks"  and  then  
Edit  Object  

Data  Models  map  to  CIM--compliant  tagged  data  
Appropriate  tags  

Fields  relevant  to   Malware  data  source  

SCROLL  to  see   more  

So  what?  
Click  to  return  to   Enterprise  Security  

So  what?  
Security  Domains,  then   Endpoint,  then  Malware  
Center  

KSI  specific  to   malware  

Let's  drill  into  two  examples  
Click  "Hacktool.Rootkit"   bar  

Normalized  fields  to   CIM  from  Symantec  

Click  browser  back   buDon...  

We  know  about  this.  

Second  example  
Click  "Mal/Packer"  bar  

Normalized  fields  to   CIM  from  Sophos  

Click  Audit  and  then   "Content  Profile"  ­  
takes  about  30s  

Where  are  my  gaps  in   coverage?  

Which  models  could  I   be  using,  but  I'm  not?  

QuesMons  on  CIM/Data   Models?  

Risk  Analysis  

What  To  Do  First?  
 Risk  provides  context    Risk  helps  direct  analysts  

Which  models  could  I  

  

be  using,  but  I'm  not?  

"Risk  Analysis  is  my  favorite  

    

dashboard  for  my  SOC  analysts!"  

Under  Advanced  Threat   click  "Risk  Analysis"  
77  

System,  User,  or   Other  
KSIs  specific  to  risk  
SCROLL  
78  

The  score  per  object  
79  

The  source  of  risk   score  
The  details  

Risk  comes  from   correlaMon  searches   or  from  ad--hoc  
80  

QuesMons  on  Risk   Analysis?  

Threat  Intelligence  

The  Challenge:   · Industry  says  Threat  Intel  is  
key  to  APT  ProtecMon   · Management  wants  all  
threat  intel  checked  against   every  system,  constantly   · Don't  forget  to  keep  your   15+  threat  feeds  updated  

The  SoluMon:        

A[ack  Map  

83  

Verizon  2015  DBIR  
""...the  percentage  of  indicators   unique  to  only  one  (outbound   desMnaMon)  feed...is  north  of  97%   for  the  feeds  we  have  sampled..."  
Threat  list  aggrega9on  =   more  complete  intelligence     

Under  Advanced  Threat   click  "Threat  Ac9vity"  
85  

KSIs  specific  to  threat  
SCROLL  
86  

Threat  categories  

Threat  specifics  

87  

We  know  about  this.   Let  me  tell  you  the  fix.  
88  

Checkbox  any  line  in  the   "Threat  Ac9vity  Details"  
89  

Click  "Advanced  Filter"  
90  

Done  on  each  dashboard   with  a  yellow  triangle,   this  will  fix  ANY  dash   with  "ppf"  error.  

Click  "Save"  

91  

Click  Configure,  "Data   Enrichment"  and  then   "Threat  Intelligence  
Downloads"  
92  

Various  community   threat  lists  

TAXII  support  

Local  ones  too  
93  

Click  "Malware   Domains"  
94  

Various  community   threat  lists  

TAXII  support  

Weight  used  for  risk   scoring  
IntervLaolc   al  ones  too  

SCROLL  for  addi9onal   config  
95  

Various  community   threat  lists  

TAXII  support  

Hit  "back"  buDon  twice   Local  ones  too  

96  

Click  "Threat  Intelligence   Audit"  under  Audit  
97  

Status  of  downloads  
Details  including   errors  
98  

Click  "Threat  Ar9facts"   under  Advanced  Threat  
99  

STIX/TAXII  feed  
Browse  through  the   tabs...  
100  

QuesMons  on  Threat   Intelligence?  

More  Advanced  Threat  

Inves9gate  on  your  own   9me:  Advanced  Threat   capabili9es  worth  your  
while...and  allS  aTrIeXa/sTA   XII  feed   under  Security  Domains  
Browse  through  the   tabs...  
103  

AddiMonal  Reports  

Auditors  /  Management  /  Compliance  Says...  
 Can  you  show  me  <Typical  Report>?    ReporMng  is  easy  in  Splunk    But  we  have  more  than    
300  standard  reports  too  
105  

Click  "Reports"  under   Search  
106  

Almost  330  reports  to   use/customize  
107  

Incident  Response   Workflow  

Click  "High  or  Cri9cal   Priority  Host  with   Malware  Detected"  
109  

Highly  filterable  and   tag--able  
Checkbox  Select  the   Cri9cal  Event  
110  

Click  "Edit  All  Selected"  
111  

Fill  out  Status/Owner/ Comment,  Click  Save  

Would  contain  all  of   your  users  

112  

Confirm  that  event   updates  
Click  ">"  under  Ac9ons  to   see  what  you  can  do  with  
the  event  
113  

Click  ">"  to  view  more   details  on  the  event  
114  

Every  field  "pivot--able"  

Last  comment  and  link   to  review  all  acMvity  

115  

AutomaMc  a[ribuMon   for  asset  data  
116  

Drill  to  Asset  Inves9gator   Pivot  internally  within  ES,   or  externally.  Customizable.  
117  

Customizable  Swimlanes  

Asset  data    

Selectable  Time  
118  

Hold  down  CTRL  or  CMD   and  click  mul9ple  bars  
aligned  ver9cally  
119  

Drill  to  search,  make  a   notable  event,  share  a  link  
Summarized  info  from   "candlesMcks"  selected  
120  

Select  one  or  two  red   "Malware  ADacks"  bars  
121  

Drill  to  search  
122  

Raw  log  data  in  the  Search   interface  is  only  a  click   away.  
123  

"Browser  Tab"  back  to   Incident  Review  
124  

Edit  the  event  again  and   add  some  more   comments...  
125  

Feel  free  to  add  whatever   you  wish  here...click  save  
126  

View  the  review  ac9vity   for  the  event  
127  

128  

Many  aspects  of  ES  are   audited  within  the  product  

Click  on  "Incident  Review   Audit"  under  Audit  
129  

More  users  will  make   this  more  interesMng...  
130  

Click  on  Iden9ty   Inves9gator    
131  

1 Type  "htrapper"  in  search   and  click  search  
2 Set  to  "Last  24  hours"  
132  

InformaMon  about  this   idenMty  
133  

QuesMons  about  Incident   Response?  

Lookups  and  CorrelaMon   Searches  

Select  "Data  Enrichment",   "Lists  and  Lookups"  under  
Configure  
136  

Many  lookups  to  provide   addiMonal  context  to  your   data  
137  

Click  on  "Demonstra9on   Iden99es"  
138  

We  want  to  add   "naughtyuser"  to  this  list   because  it  is  showing  up  in   our  data.  
SCROLL  
139  

Select  last  row,  right  click,  

and  choose  "Insert  row  

1

below."  

2 When  done  click  save  

Add  whatever  you  want,  but   make  sure  the  first  column  says   "naughtyuser"  
140  

Extra  credit:  Check  your  work  in   IdenMty  Center  

Click  on  "General",   "Custom  Searches"  under  
Configure    
141  

Click  "New"  
142  

Click  "Correla9on  Search"  
143  

Fill  in  Search  Name,  App   Context,  and  Descrip9on  
144  

You  could  simply  type  a   Splunk  search  in  here  if  you   wanted.  
Click  "Edit  search  in   guided  mode"  
145  

Click  "Next"  
146  

Select  "Data  Model",   "Authen9ca9on",  
"Failed_Authen9ca9on"  and   click  Next  
147  

Select  "Last  60  minutes"  and   click  Next  
148  

Observe  search  and  click  Next  

OpMonal:  You  can  "Run  search"  at   this  point  and  see  the  events  that   will  return.  

149  

Click  "Add  a  new  aggregate"  
150  

Choose  "count"  and  then  alias   it  as  "failedlogincount"  and   click  Next  
151  

Click  Next  
152  

SCROLL  to  select   "Authen9ca9on.user"  and  click  
Next  
153  

Type  "user"  in  the  Alias  field   and  click  Next  
154  

Set  ADribute  to   "failedlogincount",  opera9on   "Greater  than"  and  Value=1000  
155  

Click  "run  search"  to  test  the   search.  
156  

This  should  create  two  notable   events...so  let's  make  sure  that   happens.  
157  

Fill  in  "cron"  style  schedule  ­   every  5  minutes  
158  

Put  "86400"  as  the  window   dura9on.  Put  "user"  as  the  field  
to  throDle  by.  
159  

Check  the  "notable  event"  box  and   fill  in  the  fields  as  shown.  Note  the  
"$"  signs  around  the  variables!  
160  

Let's  assign  risk  to  the  user.   Check  the  box  and  fill  in  the  
three  fields  as  shown.  
161  

Save  the  search  and  go  back  to   Incident  Review.    
162  

As  long  as  you  have  waited  5   minutes  you  should  have  new   notable  events!  
Put  "86400"  as  the  window   dura9on.  Put  "user"  as  the  field  
to  throDle  by.  
163  

Variable  subsMtuMon  working  
Expand  your  new  event  
164  

Launch  Iden9ty  Inves9gator   against  "naughtyuser"  
165  

Data  you  added  to  the  lookup  
Notable  Events  and  Risk  
166  

Bonus:  Go  find   "naughtyuser"  in   Risk  Analysis   dashboard...  

Final  QuesMons?  

Next  Steps...  
 Play  in  your  ES  Sandbox  for  15  days    Explore  some  of  the  areas  we  didn't  
get  to  cover  today    Ask  quesMons  of  your  sales  team    Once  ES  4.0  releases,  help  yourself  
to  another  sandbox  to  see  the  new   features    TELL  YOUR  FRIENDS!  
168  

FAQ  Link  
 During  .conf2015  there  were  several  quesMons  asked  by  audience   members  ­  some  of  which  were  captured,  and  the  answers  are   provided  here:  
h[ps://  
169  

THANK  YOU  

