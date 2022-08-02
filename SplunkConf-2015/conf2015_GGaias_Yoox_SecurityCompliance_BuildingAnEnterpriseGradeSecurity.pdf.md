Copyright  ©  2015  Splunk  Inc.  
Building  an     Enterprise--grade   Security  Intelligence   PlaIorm  at  Yoox.com      (Gain  the  Big  Picture)  
Gianluca  Gaias  
Head  of  Informa@on  Security,   YOOX  Group  

Disclaimer  
During  the  course  of  this  presenta@on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau@on  you  that  such  statements  reflect  our   current  expecta@ons  and  es@mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta@on  are  being  made  as  of  the  @me  and  date  of  its  live   presenta@on.  If  reviewed  aWer  its  live  presenta@on,  this  presenta@on  may  not  contain  current  or   accurate  informa@on.  We  do  not  assume  any  obliga@on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi@on,  any  informa@on  about  our  roadmap  outlines  our  general  product  direc@on  and  is  subject  to   change  at  any  @me  without  no@ce.  It  is  for  informa@onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga@on  either  to  develop  the  features  
or  func@onality  described  or  to  include  any  such  feature  or  func@onality  in  a  future  release.  
2  

Personal  Introduc@on  
Gianluca  Gaias,  YOOX  Group      YOOX  Group  is  the  global  Internet  retailing  partner  
for  leading  fashion  and  luxury  brands    Head  of  Informa@on  Security:    
­ Applica@on  Security   ­ Organiza@onal  Security   ­ Compliance   ­ Security  Monitoring  
3  

Key  Takeaways    
 From  a  technology  oriented  approach  to  an  info--centric  approach    From  log  correla2on  to  pa3ern  recogni2on    From  a  passive/display  pla7orm  to  a  proac2ve/execu2ve  pla7orm    From  standard  dashboards  to  real--2me  dynamic  dashboards    From  a  security  event  to  an  context--aware  security  informa2on  
4  

Agenda  
 YOOX  Group:  business  and  challenges.    Security  evolu@on  overview    From  Tech  Oriented  approach  to  Informa@on  Oriented  approach  
­ Deep  Inves@ga@on   ­ Proac@ve  Dashboard:  IP  Blacklist     ­ Real--@me  Dynamic  Dashboard:  Aback  Map  
 Risk  Management  and  Pabern  Recogni@on  
­ Use  Case:  Abackers  Ac@vity  
 Reconsidering  dashboard  design    Next  Steps     
5  

YOOX  Group    
 Global  reach  to  more  than  100  countries  worldwide    Five  logis@cs  centers  strategically  located,  guaranteeing  top  service  to  all  major  fashion  
markets  (United  States,  Europe,  Japan,  China,  Hong  Kong)  
6  

YOOX  Group:  OS  &  Mul@--Brand  

MULTI--BRAND  
§ The  world's  leading  online  lifestyle  store  for   fashion,  design  and  art  
§ Broad  offering  of  end--of--season  premium   apparel  and  accessories,  exclusive  collec@ons,   vintage,  home  &  design  and  artworks  
§ Launched  in  2000    

MONO--BRAND  
§ Exclusive  official  online  flagship  stores  of  leading  fashion  and  luxury  brands   § Long--term  partnerships  
Online stores "Powered by YOOX Group"

§ The luxury online boutique with in-season assortment of high fashion and directional
designers for men and women § Dedicated mini-stores § Launched in 2008

§ The online destination for women

dedicated entirely to in-season high-end

shoes

§ Exclusive shoe-related services and

7  

innovative editorial component

§ Launched in 2012

JVCo with Kering

and  many  more  ...

YOOX  Group:  Challenges  

ü Shareholders  

 Keep  the  trust    

ü Customers  

­ Data  Confiden@ality   ü Stakeholders  

­ Data  Integrity  and  Completeness  

­ Data  Processing  Transparency  

 High  Availability  in  hos@le  enviroment  
  
 Gain  the  big  picture:  
­ Challenge  and  Enabler  

8  

Security  Evolu@on  Overview  
2011   2013   2015  

Data  Leakage  Preven@on  

Informa@on  Process  

9  

Analysis  

8   7  

Informa@on  Security   Compliance  

6  

Privacy  Compliance  

5   4  

IPS  &  Anomaly  Detec@on  

3  

2  

1  

Online  Brand  Protec@on  

0  

Administra@ve  Access   Control  

Security  Intelligence   PlaIorm  
Logical  Access   Governance  

Code  Review  

PCI--DSS  Compliance   Sites  Vulnerability  Checks  

9  

Security  Evolu@on  ­  Tech  vs  Info  
 Technology  Oriented:  
­ Info  confined  to  technology   ­ Par@al  iden@ty  defini@on   ­ No  covered  gaps  
 Informa@on  Oriented  --  Splunk:  
­ Enrichement  of  tech  logs   ­ Event  correla@on   ­ Clear  iden@ty  defini@on  
10  

From  Tech  to  Info  
 "From  a  technology  oriented  approach  to  an  info--centric  approach."  
11  

Inves@ga@on  
12  

Inves@ga@on:  Show  Details  
13  

Advanced  Dashboard:  IP  Blacklist  

· Proac@ve  Dashboard   · One--click  blacklist  on  
Akamai  WAF  through   Akamai  API  calls   · Splunk  is  able  to  run  a   command  on  input  source      

«From  a  passive/display  pla7orm  to  a     proac2ve/execu2ve  pla7orm»  
Drilldown  

14  

WAF  Ac@vity  Representa@on:  Standard  Dashboard  

Pros   · Sta@s@cal  evidences  by:  
­ Source  IP   ­ Aback  type   ­ WAF  Ac@on  
· Event  distribu@on  over  the  @me  

Cons   · Spike  visibility  depends  from  the  scale   · Is  not  evident:  
­ Aback  frequency   ­ Rela@on  between  Source  IP,  Aback  type  
and  WAF  ac@on  
15  

Real--@me  Dynamic  Dashboard:  Aback  Map  
"From  standard  dashboards  to  real--2me  dynamic  dashboards"  
16  

Security  Evolu@on  ­  Risk  Mgmt  &  Pabern  Rec.  
 Risk  Management:  
­ Correla@on  of  Tech  Elements  and  Business  Elements   ­ Support  to  quan@ta@ve  risk  analysis   ­ Assigning  Risk  value  to  alerts  
  
 Pabern  Recogni@on:  
­ Different  levels  of  correla@on   ­ Pabern  as  result  of  several  high--level  events  from  different  systems  by  iden@ty   ­ Knowledge  from  historical  incidents  and  analysts  experience   ­ Goal:  detect  user  behavior  and  recurrent  aback  paberns  
17  

Pabern  Recogni@on  

 Single  security  events  may  be  part  of  a  more  complex  ac@on.  
Brute  Force  

Correla@on  

Exce.  Out  Data  

Sequence  

High  Conn.  

Introduced  by  high  level  analyst  

«From  log  correla2on  to  pa3ern  recogni2on»  

Correla@on  
Level  1  

Correla@on  
Level  2  

Correla@on  
Level  n   Analyst  
Pabern  Consolida@on   18  

Data  Exfiltra@on  

Risk  Management  

 Usually  single  security  event  has  a  sta@c  risk    We  need  risk  value  based  on  content  and  other  events  correlated  

"From  a  security  event  to   an  context--aware  security  
informa2on"  

Sta@c   Assign.   (Lookup)  

N  level   correla@on  

Content   Eval  

Risk  

19  

Use  Case:  Abackers  Ac@vity  

 Detect  sequence  of  relevant  event  by  iden:ty    

Pa=ern  Recogni:on  

 Ac@vity  Score:  ver@cal  axes,  max  of  the  same  alert  type  

Risk  Value  

 Ac@vity  Frequency:  ball  diameter  

  

20  

Reconsidering  Dashboard  Design  

Knowledge  

The  Big  Picture  

Head  of  Security  

Pabern   Recogni@on  

SOC  

Advanced   Dashboards  

Standard  Dashboards  

Security  Analyst   NOC  

Splunk  Log  Collec@on   Na@ve  Log  Collec@on  

Splunk   Engeneers  
Data  Meaning  

21  

Key  Takeaways    
 From  a  technology  oriented  approach  to  an  info--centric  approach.    From  log  correla2on  to  pa3ern  recogni2on.    From  a  passive/display  pla7orm  to  a  proac2ve/execu2ve  pla7orm.    From  standard  dashboards  to  real--2me  dynamic  dashboards.    From  a  security  event  to  an  context--aware  security  informa2on.  
22  

Next  Steps  
Extend  the  scope  (channels,  data,  devices)  
Deep  into  the  noise  
23  

Ques@ons?  
24  

THANK  YOU  

