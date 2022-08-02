Copyright  ©  2015  Splunk  Inc.  
Adding  Depth  to   Dashboards  
Pierre  Brunel   Splunk  

Disclaimer  
During  the  course  of  this  presentaCon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauCon  you  that  such  statements  reflect  our   current  expectaCons  and  esCmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaCon  are  being  made  as  of  the  Cme  and  date  of  its  live   presentaCon.  If  reviewed  aPer  its  live  presentaCon,  this  presentaCon  may  not  contain  current  or   accurate  informaCon.  We  do  not  assume  any  obligaCon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiCon,  any  informaCon  about  our  roadmap  outlines  our  general  product  direcCon  and  is  subject  to   change  at  any  Cme  without  noCce.  It  is  for  informaConal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaCon  either  to  develop  the  features  
or  funcConality  described  or  to  include  any  such  feature  or  funcConality  in  a  future  release.  
2  

Agenda  
· IntroducCon     · StaCc  vs  Dynamic  Dashboards   · Demo     · Step--by--Step  ImplementaCon     · Q&A  
3  

IntroducCon  
· Splunker  since  2014      · Previously  worked  in  operaCons  for  
large  SaaS  company    
­ 5  years  in  escalaCon  support  before  Splunk   ­ 2  years  using  Splunk  
  
I  liked  the  product  so  much  I  joined  the  company!  
4  

A  Quick  Poll  
· New  to  Splunk?      · Experience  w/  Simple  XML?      · Experience  w/  Advanced  XML?  
5  

PerspecCve  is  Key  
6  

PerspecCve  is  Key  
7  

StaCc  vs  Dynamic  Dashboards  
· StaCc  Dashboards  
­ Provides  execuCve  summaries   ­ Answers  specific  quesCons  
ê "What  are  my  top  ...  ?"   ê "What's  the  Cmeline  of  acCvity  for  ...  ?"  
· Dynamic  Dashboards  
­ Same  as  above...and  more   ­ Pivot  and  answer  subsequent  quesCons  
ê "Given  my  selecCon  here,  tell  me  more  about  ..."   ­ View  the  same  dataset  from  mulCple  angles  
8  

Use  Case  ­     Mobile  ApplicaCons  

One  Page  Load  =  Many  Network  Calls  

Back  office  servers  

Content  Deliver  Networks   Images   videos  

Slow  page  loads  =  unhappy  customer  

10  

Use  Case  --  IntroducCon  
· Page  load  Cmes  are  criCcal   · One  page  load  may  involve  retrieving  informaCon  from    
mulCple  sources   · Problem  could  exist  in  mobile  app,  network,  or  back--office   · OperaConal  SLAs  
11  

Disclaimers  
· Not  all  visual  capabiliCes  will  be  discussed   · SimpleXML  only   · Searches  are  out  of  scope   · Limited  implementaCon     
12  

Demo  

How  it  Works  

Select  a  Row  
Other  panels  are  hidden  
15  

Show  Details  for  Selected  View  
16  

Select  a  Subset  of  Timerange  
17  

Tokens  ­  A  Primer  
· Variables  that  dynamically  pass  informaCon  within  &   between  dashboards  
­ AcCon  on  one  panel  can  drive  behavior  in  another  panel   ­ Tokens  can  be  used  to  pass  informaCon  into  another  URL  
ê Another  Splunk  dashboard   ê Page  outside  Splunk  altogether  
  <drilldown>   Set  the  token:                       <set  token="my_new_token">$row.this_field$</set>  
  </drilldown>  
  <search>   Use  the  token:                       <query>sourcetype=mysourcetype  this_field=$my_new_token$  
</search>  
18  

Tokens  Set  
currentView  
selecCon.earliest   selecCon.latest  

Tokens  

Tokens  U?lized  

currentView  
currentView   selecCon.earliest   selecCon.latest  
19  

Walkthrough  
20  

Select  Row,  Set  Token  
21  

Select  Row,  Set  Token  
22  

Select  Row,  Set  Token  
23  

Select  Subset  of  Timerange  
24  

Select  Subset  of  Timerange  
25  

Use  Selected  Timerange  
26  

Use  Selected  Timerange  
27  

Conclusion  
· Greater  depth  in  dashboards  -->  greater  insight   · SimpleXML:  powerful  capabiliCes  for  the  non--UI  expert   · Work  with  your  users  
­ Which  quesCons  would  they  ask  next?  
28  

AddiConal  Reading  
· Get  the  code  
­ hups://github.com/sirmonkey/conf2015  
· Splunk  Docs  
­ hup://docs.splunk.com/DocumentaCon/Splunk/6.2.5/Viz/ VisualizaConreference  
· Dashboard  examples  app  
­ hups://splunkbase.splunk.com/app/1603/  
· Level  up:    Satoshi's  conf  talk  "Enhancing  Dashboards  with  Javascript!"  
­ Wed  12:15  -->  1pm  (Breakout  9)  
29  

QuesCons?  

THANK  YOU  

