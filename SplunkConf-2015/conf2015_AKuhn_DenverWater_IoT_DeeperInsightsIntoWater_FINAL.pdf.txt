Copyright  ©  2015  Splunk  Inc.  
Deeper  Insights  into   Water  Treatment   (and  everything  else)   through  Splunk  
Andy  Kuhn  
Applica<on  Developer,  DevOps     (Cer<fied  Splunk  Architect)   Denver  Water  

Agenda  
 Introduc<on    What  is  Denver  Water?    Adop<on  and  Growth  of  Splunk    Customer  Self--Service    Opera<onal  Intelligence    Water  Treatment  and  Deep  Data  Analysis  ­  where  we  are  now  and  where  
we  are  going    The  Data  Rub    Future  uses     
2  

Introduc<on  
§ Andrew  Karl  Kuhn,  call  me  `Andy'.    Spent  most  of  my  life  in  Colorado   and  New  Mexico.    
§ Degree  in  Chemistry,  worked  professionally  as  a  biochemist  for  6   years.    Been  working  in  IT  since  2000  primarily  in  private  industry.  
§ Applica<on  development,  architecture,  middleware,  devops   § Music  performance  and  recording,  ancient  history,  cars,  
backpacking,  anything  educa<onal,  home  maintenance  
3  

What  is  Denver  Water?  
· Public  agency  established  in  1918,  whose  revenues  are  derived   from  water  rates  and  tap  fees  (not  taxes),  serving  about  1.3  million   in  Denver  and  the  surrounding  area  
· ~1000  employees.  Builds  and  maintains  all  collec<on,  transmission,   treatment  and  distribu<on  serving  the  Denver  Metropolitan  Area  
· 3rd  largest  land  owner  in  the  state   · 234,000  acre  feet  (289  million  cubic  meters)  of  water  harvested  
each  year   · 2%  of  all  water  in  Colorado  is  processed  by  Denver  Water     
4  

Does  a  Water  U<lity  collect  data?  
· Reservoirs,  Streams,  Weather  (aka  Raw  Water,  non--potable)   · Treatment  Plants  (aka  Treated  Water,  potable)   · DistribuJon  pipes,  compression  staJons,  household  taps   · IT  Enterprise  events  (monitoring  applica<ons  and  systems)   · Desktop  management  (monitoring  Windows  logs  for  user  support)   · IT  IntegraJon  acJviJes  (monitoring  service  execu<on  and  
performance)   · IT  Security  acJviJes  (DMZ  access,  Ac<ve  Directory  issues)  
5  

@
 From  50  to  1400  Splunk  Universal  Forwarders  deployed  from  January  to   December  2014    (28x  increase)  
 CumulaJve  daily  data  indexing  reducJon  of  30%  due  to  careful  analysis  of   indexed  informa<on  and  determina<on  of  value,  even  with  the  addi<on  of   a  great  deal  of  addi<onal  data.  
 Increase  of  splunk  enterprise  uJlizaJon  --  indexes,  sourcetypes,  data   models  and  search  head  usage  by  500%  
 Using  ~50%  of  our  50GB  license  each  day  (<ny,  but  important)    Beware  of  unneeded  Windows  Security  Events  from  Domain  Controllers  
6  

How  water  is  like  data  
RAW  WATER   RAW  DATA  

TREATED   WATER  

INDEXING  AND   NORMALIZATION  

TRANSMISSION  &  DELIVERY   QUERY  &  PRESENTATION  

7  

@
  
Customer  Self--Service   Opera<onal  Intelligence  
Water  Treatment  
8  

Customer  Self--Service  Website  Metrics  
 Stakeholders  are  wide--ranging.    IT  developers,  Project  Managers,   Customer  Support,  Marke<ng,  Public  Affairs  and  Execu<ves  
 Intended  to  provide  comprehensive  informaJon  pertaining  to  site   usage  as  well  as  individual  transac<on  informa<on  
 Large  challenge  to  gather  requirements  from  and  educate  a  diverse   group  of  stakeholders  on  the  use  of  the  CSS  Splunk  dashboards.  
 Summary  indexing  necessary  for  some  data  to  accommodate   performance  requirements  (from  last  hour  to  a  year  ago)  
9  

Customer  Self--Service  Website  Metrics  
Summarized  high--level  metrics  for  managers  and  execu<ves  uses  tstats  command.     Precise,  clear  labelling  of  data  elements  to  reduce  confusion  and  incorrect  assump<on  
10  

Customer  Self--Service  Website  Metrics  

Row_highligh<ng.js  turns  all   rows  (with  errors)  red  with   white  leqering  so  easy  to  spot  

Actual  values  changed  by  the  customer  from   the  log  file.    Can  search  all  customers(*)  or  a   specific  customer  
11  

Opera<onal  Intelligence  
 Provides  criJcal  informaJon  to  Help  Desk  and  Desktop  Support   personnel  related  to  desktop  health  and  printer  errors  
 Provides  applicaJon  service  and  availability  monitoring  through   scheduled  service  calls,  for  internal  and  externally--hosted   applica<ons  
 Provides  a  means  to  troubleshoot  transacJonal/integraJon   acJviJes  in  any  environment  through  a  log  viewer  that  displays  all   logs  based  on  a  variety  of  selectors  and  provides  the  ability  to   decode  and  view  the  payload  for  any  message.    Heavily  used  by   development  staff  
12  

Opera<onal  Intelligence  
IMAP  Mailbox  app  à  hqps:// splunkbase.splunk.com/app/1739/  
13  

Opera<onal  Intelligence  
14  

Water  Quality  
· At  least  5  different  types  of  measurement  sources  (Raw,  Treated,  Weather,   Labs)  
· Using  REST  TA  and  DBX  from  our  Splunk  heavy  forwarder  as  well  standard   file  tail  monitoring    
· ~20  different  Splunk  sourcetypes   · 3  Splunk  data  models     · 4  Splunk  indexes  with  frozen  archives,  5  summary  indexes   · Engagement  with  stakeholders  to  understand  needs,  hopes  and  fears.  
15  

Water  Quality  ­  Deep  Analysis  
16  

<input  type="dropdown"   token="weather_sta<on_token"   searchWhenChanged="true">               <label>Weather  Sta<on</label>               <choice   value="ChipsBarry">Chips--Barry</ choice>               <choice   value="Kendrick">Kendrick</choice>               <default>Kendrick</default>               <change>                   <set   token="sta<on_label_token">$label $</set>               </change>           </input>  

Water  Quality  ­  6.2.x  dynamic  labels  
17  

Water  Quality  ­  Qualita<ve  Correla<on  
18  

Water  Quality  
19  

Water  Quality  ­  The  Future  
· Onboard  remaining  relevant  data  associated  with  the  collec<on  and   treatment  processes  
· Determine  addiJonal  groups  requiring  access  to  data  (conserva<on,   planning,  others?)  
· Determine  Role  AuthorizaJons  for  different  data  sets   · Specific  conversaJons  to  further  tune  dashboards  with  managers,  staff  
water  chemists,  treatment  specialists,  et  al.   · Setup  alerJng  for  par<cular  condi<ons  as  iden<fied  in  the  specific  
conversa<ons  with  stakeholders  
20  

The  Data  Rub  (when  change  hurts)  
· Conflicts  over  data  ownership  and  who  should  be  provided  access   · Confusion  in  technology  ownership  and  process  has  hindered  our  ability  to  
onboard  data  (4  completely  different  ways  to  collect  and  store  water   measurements)   · DeterminaJon  of  the  Source  of  Record  has  not  been  straighzorward.    Many   people  have  many  different  opinions  about  where  data  should  be  wriqen   from  the  genera<ng  system  and  how  such  data  should  be  handled.   · Technological  differences  between  products  o{en  dictate  how  we  get  the   data  into  Splunk   · CompeJng  or  overlapping  technologies  at  Denver  Water  
21  

Ques<on  and  Answer     
Andy  Kuhn   Denver  Water   Andy.Kuhn@denverwater.org   Andy_Kuhn@yahoo.com   Cell:  303--641--1574  
22  

THANK  YOU  

