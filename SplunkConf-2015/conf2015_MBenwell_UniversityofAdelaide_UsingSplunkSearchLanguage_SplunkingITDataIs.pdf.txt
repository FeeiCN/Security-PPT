Copyright  ©  2015  Splunk  Inc.  
Splunking  IT  Data     Is  Great,  Splunking   Non--IT  Data  Is   Awesome  
Mathew  Benwell  
Informa?on  Security  Specialist,   The  University  of  Adelaide  

Disclaimer  
During  the  course  of  this  presenta?on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau?on  you  that  such  statements  reflect  our   current  expecta?ons  and  es?mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta?on  are  being  made  as  of  the  ?me  and  date  of  its  live   presenta?on.  If  reviewed  aQer  its  live  presenta?on,  this  presenta?on  may  not  contain  current  or   accurate  informa?on.  We  do  not  assume  any  obliga?on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi?on,  any  informa?on  about  our  roadmap  outlines  our  general  product  direc?on  and  is  subject  to   change  at  any  ?me  without  no?ce.  It  is  for  informa?onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga?on  either  to  develop  the  features  
or  func?onality  described  or  to  include  any  such  feature  or  func?onality  in  a  future  release.  
2  

About  the  University  of  Adelaide  
The  University  of  Adelaide  is  one  of   Australia's  leading  research--intensive   universi?es  and  is  consistently  ranked   among  the  top  1%  of  universi?es  in  the   world.  Established  in  1874,  it  is  Australia's   third  oldest  university  with  a  strong   reputa?on  for  research  and  teaching   excellence,  and  producing  graduates  that  
make  an  impact  on  the  world.  
3  

About  Mathew  
 Informa?on  Security  Specialist  at  the  University  of  Adelaide  
 Informa?on  Security  for  8  years,  IT  for  14  
 Resident  Splunk  Guy  
  
4  

Agenda  
 Why  Splunk  at  the  University?  
 Cool  Stuff  For  IT  Teams  
 Awesome  Stuff  Not  For  IT  
  
5  

But  First...  Where  is  Adelaide?  
 Here  
 ~  1,100  km  (~700   Miles)  from  Sydney  
    13,505  km  (8392  
Miles)  from  here  
 3  Flights,  almost  18   hours  in  the  air  
6  

Why  Splunk?  

Execu?ve  Summary:  Before  Splunk  
8  

Execu?ve  Summary:  AQer  Splunk  
9  

Why  We  Chose  Splunk  
 In  2011,  aeemp?ng  to  deal  with  phishing  aeacks  
 Created  a  Simple  Authen?ca?on  anomaly   detec?on  system  
­ MySQL  database   ­ Poorly  wrieen  ruby  script   ­ Radius  logs  
10  

Why  We  Chose  Splunk  
 Flexibility   ­ Tradi?onal  SIEM  solu?ons  are  not  as  easy  to  drill   down  into  the  raw  event  
 Easy  to  learn   ­ Knowledge  of  Opera?ng  System  CLI  and  a  bit  of   SQL    
 Most  importantly,  Splunk  met  our  Use  Case   requirements  
11  

Ini?al  Splunk  Use  Cases  
 Anomalies  in  authen?ca?on  events  
­ Logon  within  a  given  ?me  frame  for  disparate  geographic  loca?ons  
 Phishing  email  detec?on  
­ Common  word  list  to  help  iden?fy  aeacks  
 Common  account  events  
­ Failed  logon  events   ê Single  source  different  account   ê Mul?ple  sources  same  account   ê Failed  logon  followed  by  success  
 Large  mail  volumes  
12  

Security  Data  Sources  
13  

Splunk  Common  Informa?on  Model  
 What  is  the  Common  Informa?on  Model  (CIM)?    Abstrac?on  from  raw  data    Standardized  knowledge  for  events  (i.e.  field  names)    Used  by  Splunk  for  Enterprise  Security  
14  

Security  Uses  ­  IDS/IPS  
15  

Security  Uses  ­  An?--malware  
16  

Security  Uses:  Looking  For  Bad  Things  
Phishtank  
­ "getWatchList"  command  
 Rou?ne  searches  and  alert  when  users  access  listed  URL's  
17  

Security  Uses  ­  Incident  Response  
18  

Security  Uses  ­  Incident  Response  
19  

Great  Stuff  for  IT  

The  Great  Stuff    
 Applica?ons  Monitoring    Citrix  Repor?ng    Computer  Suite  Applica?on  Usage    Internet  Traffic  Accoun?ng    Print  Usage  Repor?ng  
21  

Internet  Accoun?ng  
 In  Australia  we  are  charged  for  Internet  data  consump?on    Quota  system  used  previously  to  control  cost    Quotas  removed  in  2014    To  help  track  and  control  cost  we  use  Splunk  
22  

Internet  Accoun?ng  
23  

Internet  Accoun?ng  
24  

Internet  Accoun?ng  
25  

How  Did  We  Build  It?  
1. Start  with  the  ques?on  
­ What  did  we  need  to  know?  
2. Simple  use  case  development   3. Iden?fy  suppor?ng  data  sources  
­ Firewall  data   ­ Unmetered  address  data  
4. Get  Splunking  
­ Summary  indexing  used   ­ Custom  script  for  metering  calcula?on   ­ Extended  use  of  Palo  Alto  Networks  API  
26  

Internet  Accoun?ng  --  Outcome  
 We  know  precisely  where  we  are  incurring  charges          We  are  helping  to  control  cost          No  cost,  we  already  have  the  data  for  Security     
27  

Compu?ng  Suite  U?liza?on  
 Client  Compu?ng  team  had  no  visibility  into  system  usage       They  wanted  to  know  what  applica?ons  were  being  used       Aim  to  reduce  license  costs  and  maintenance  burden  
28  

Compu?ng  Suite  U?liza?on  
29  

Compu?ng  Suite  U?liza?on  
30  

How  Did  We  Build  It?  
1. Start  with  the  ques?on  
­ What  did  we  need  to  know?  
2. Simple  Use  case  development  
  
3. Iden?fy  suppor?ng  data  sources  
­ Windows  process  audi?ng  
4. Get  Splunking  
­ Only  tracking  processes  started  by     explorer  process  
­ Windows  event  log  forwarding  
31  

Compu?ng  Suite  U?liza?on  --  Outcome  
 Team  now  has  visibility  to  make  decisions  using     real  informa?on  
       Security  team  has  another  useful  data  source.  Think  IOC's  
 Small  cost  (5--10gb/day)     
32  

Awesome  Stuff  Not   For  IT  

The  Awesome  Stuff    
 Physical  space  repor?ng    Project  financial  repor?ng    Learning  management  system  repor?ng    Human  Resources  contract  processing  (PageUp  People)    Casual  staff  ?mesheet  payment  system  (In  house  system)  
34  

HR  Contract  Processing­  Before  Splunk  
 Manual  report  extracted  from   PageUp       Data  massaged  using  MicrosoQ   Excel       Char?ng  performed  in  Excel  
35  

HR  Contract  Processing  ­  Page  Up  People  
36  

HR  Contract  Processing  ­  Page  Up  People  
37  

HR  Contract  Processing  --  Outcome  
 Report  genera?on  is  automated  
 Human  Resources  manual  processes  can  be   reduced,  saving  ?me  and  effort  
 Virtually  no  cost  
38  

Learning  System  Repor?ng  ­  Before  Splunk  
 Basic  content  repor?ng  
 Team  extract  data  from     Oracle  database  
 Data  is  massaged  into  a  usable  form   using  MicrosoQ  Excel  
 Excel  charts  are  copied  into  a     Word  report  
     
39  

Learning  System  Repor?ng  
40  

Extending  into  Learning  Analy?cs  
41  

Learning  System  Repor?ng  --  Outcome  
 Learning  management  team  are  developing  their   own  analy?cs  capability  
 Reduce  ?me  and  effort  
 Virtually  no  cost  
42  

Space  Repor?ng  ­  Before  Splunk  
 School/Faculty  managers  request   space  alloca?on  report         Space  Planning  team  extract  data   into  CSV/Excel       School/Faculty  managers  generate   their  own  repor?ng  
43  

Space  Repor?ng  ­  Where  Does  Splunk  Fit  
Archibus  SoQware  --  Facili?es  Management       
Splunk  DB  Connect  
 Nightly  data  feed  from  Oracle  
    In--house  Developed  Splunk  App  
 Dashboards  --  In--page  Drilldowns    Side  By  Side  direct  comparison  of  change  over  ?me  
44  

UniSpace  Dashboards  
45  

UniSpace  Dashboards  
46  

A  Quick  Demo  

How  Did  We  Build  It?  
1. Start  with  the  ques?on  
­ What  did  we  need  to  know?  
2. Use  case  development  
­ User  flow  diagrams  (Storyboards)  
3. Iden?fy  suppor?ng  data  sources  
4. Get  Splunking  
­ Macros  heavily  used   ­ In--page  drilldown  script  
48  

Space  Planning  Repor?ng  --  Outcome  
 School/Faculty  managers   have  on  demand  access  to   the  latest  data       No  ?me  requirement  for   Space  Planning  team  
 Virtually  no  cost  (25mb/day)     
49  

What  Does  the  Future  Hold?    
 Con?nue  to  extend  Splunk  use  
 More  advanced  Learning  Analy?cs  
 Increased  space  planning  capabili?es  
­ Include  fine  grained  occupancy  data   ­ Including  charging  data   ­ Including  facility  capability  
 Teaching  area  u?liza?on  (Lecture  theatres)  
50  

Take--Aways  
 Most  Importantly:  Don't  think  of  Splunk  just  as  an  IT  tool  
Splunk  can  be  used  for  a  lot  of  things  
 Use  a  structured  approach,  star?ng  with  the  ques?on  you     want  to  answer  
 S?ck  to  the  Splunk  Common  Informa?on  Model  (CIM)  
 Build  a  community  within  your  organiza?on  
51  

THANK  YOU  

