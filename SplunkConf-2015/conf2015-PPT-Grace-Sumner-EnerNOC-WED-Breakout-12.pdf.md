Copyright  ©  2015  Splunk  Inc.  
Splunk:  Uni>ng  Ops   and  Dev  (before   DevOps  was  cool)  
Grace  Sumner  
Sr.  Produc>on  Opera>ons   Engineer,  EnerNOC  

Disclaimer  
During  the  course  of  this  presenta>on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau>on  you  that  such  statements  reflect  our   current  expecta>ons  and  es>mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta>on  are  being  made  as  of  the  >me  and  date  of  its  live   presenta>on.  If  reviewed  aUer  its  live  presenta>on,  this  presenta>on  may  not  contain  current  or   accurate  informa>on.  We  do  not  assume  any  obliga>on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi>on,  any  informa>on  about  our  roadmap  outlines  our  general  product  direc>on  and  is  subject  to   change  at  any  >me  without  no>ce.  It  is  for  informa>onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga>on  either  to  develop  the  features  
or  func>onality  described  or  to  include  any  such  feature  or  func>onality  in  a  future  release.  
2  

Agenda  
· EnerNOC     · Splunk  and  EnerNOC    
­ Dev  and  Ops  and  Dev  ...  
· Splunk  raises  all  ships  (my  story)   · Our  pain  is  your  gain  (lessons  learned)   · Q&A  
3  

The  Power  of  

COLLECT  DATA   FROM  ANYWHERE  

SEARCH   AND  ANALYZE   EVERYTHING  

GAIN  REAL--TIME   OPERATIONAL   INTELLIGENCE  

Small  Data.  Big  Data.  Huge  Data.  
4  

About  Grace  
 ...Actually, lets do that later.
5  

EnerNOC  at  a  Glance  
 A  leading  provider  of  SaaS--based  Energy  Intelligence   SoUware  (EIS)  and  related  solu>ons  
 Market  leader  in  demand  response  (DR)       
 Global  company  (over  1,300  employees  in  countries   across  North  America,  APAC,  Europe)  with  HQ  in   Boston,  MA  
6  

EnerNOC's  Energy  Intelligence  SoUware        For  enterprises:  pladorm  and  solu>ons  focus  on  the  3  drivers  of  energy  expense  
  

How  you  buy  it
Budgets and Procurement Utility Bill Management (UBM)

How  much  you  use
Visibility and Reporting Facility Optimization Project Tracking

When  you  use  it
Demand Response Demand Management

Increase  Use  of  Enterprise  Energy  Intelligence  SoKware  
EnerNOC  Is  Transforming  Energy  Management  Across  Industries  

Over 6,000 companies globally rely
on EnerNOC to drive energy savings

More than 70,000 sites and devices
stream data into EnerNOC's energy intelligence software platform

Demonstrated expertise trusted by the largest companies in the world:

8  

ULlity  and  Grid  Operator  Partnerships  
EnerNOC  has  Extensive  Exper>se  Working  With  U>li>es  and  Grid  Operators  Globally   Our utility partners include:
We also operate in wholesale markets:
9  

The  Case  for  Demand  Response  
Balancing supply and demand on the electricity grid is difficult and expensive. End users that provide a balancing resource are compensated for the service.

100%   90%   75%  
50%  

Annual Electricity Demand As a Percent of Available Capacity
    

25%  

Winter  

Spring  

Summer  

Fall  

Ops  vs  Ops  
11  

Ops  vs  Ops  
12  

Usually  when   we  talk  about   Dev  Ops:  
13  

EnerNOC              Data      

· As an energy company, we like to measure things: ­ Staff of HVAC experts with decades of experience to guide what to measure (air flow, temperature inside and out) ­ Add metrics based on customer needs

· As a technology company, we really like to measure things: ­ Performance engineers, architects and developers with years of experience to guide what to measure ­ Add metrics based on what Ops needs

EnerNOC  EIS  PlaQorm  

Data Streaming and Processing at Scale
15  

4000/1000 Users Daily/Hourly

100 Countries

EnerNOC Hosted Web
Servers

EnerNOC Hosted Application Servers

Cloud Hosted Web
Servers

Cloud Hosted Application Servers

EnerNOC Database Servers

Cloud Hosted Database Servers

32TB Persisted

Before  Splunk  in  Eng  
· Cron jobs · Perl scripts to process log files, insert
data · "Huge" mysql databases · Manually send emails with slick Excel
charts and PowerPoint · New metrics could take weeks · Files being copied all over
· Ran out of disk one day...

Before  Splunk  in  Ops  

Tight  regula>ons  
· 2  second  data  
· 2ms  response   requirements  
· 24x7x365   par>cipa>on  

Ops  tools  provide   · High  level  
aggregates   · Hourly  updates  

Ops  aUer  Splunk  

Aler>ng  101  
What  makes  a  good  alert?  
     Ac>onable     Instruc>ve     Timely     Manageable  

Exact  manner  of  problems  is  not   always  known  in  advance...  
Create  beker  Outlook  rules?  

Dashboards  &  Alerts  
22  

Splunk  moves  back  from  Ops  to  Dev  
· Development  takes  off  in  many  direc>ons      
­ Many  microservices     ­ Cloud  pladorms  being  developed  in  AWS  
ê Servers  are  cakle,  not  pets     
· Need  to  start  selng  standardsà  Splunk  is  the  standard  
23  

Splunk  in  Dev  
· What  does  it  mean  Splunk  is  the  standard?   · Logging  format  ­  >mestamps,  key  value  pairs,  unique  IDs   · Learn  to  log  ­  not  alert  
­ Give  info  about  what  an  error  means,  let  the  stakeholder  decide  if  its  cri>cal  
24  

Mul>ple  Environment  Aler>ng  
· Saw  an  error  in  dev,  couldn't  reproduce  but  could  be  cri>cal  ­  use   aler>ng  to  catch  it  in  produc>on  
25  

Mul>ple  Environment  Monitoring  
26  

27  

28  

Performance  Metrics  from  Day  1  
29  

http://www.bostonglobe.com/business/technology/2015/03/08/enernoc-faces-important-transition/TtJ7ejXmauZUKaHvtsZoxL/story.html 30  

Eng  sees:  

Ops  sees:  

A  likle  more  about  me...  

My  story  
· Started  in  opera>ons,  using  Splunk  as  a  way  to  see  what  was  really   happening    
· Building  alerts,  giving  access  we  never  had  before     · Became  interested  in  the  administra>on,  helped  design  and  build  out  
new  highly  available  cluster   · Got  Splunk  6  admin  cer>fica>on  last  year  
33  

Splunk  raises  all  ships  
Why  is  Splunk  par>cularly  well  suited  to  raising  all  ships  in  technical   literacy?   1)  Accessible  ­  easy  query  language   2)  Real  ­  this  is  the  data,  it's  not  translated   3)  Powerful  ­  once  you  dig  in,  it  has  almost  endless  possibili>es  
34  

Tips  and  Tricks  
· Importance  of  a  Splunk  knowledge  manager  ­  someone  who  can   translate  business  needs  
· Find  the  pieces  of  data  your  team  wants  to  see   · Logging  is  cheap.  Outages  are  not.     · Pay  aken>on  to  alert  management   · Real>me  searches  ­  be  careful  of  usage        
35  

Tips  and  Tricks  
· How  many  indexes?   · RTFM  --    Read  the  documenta>on  
­ Ask  ques>ons,  come  to  .conf  
· Search  head  cluster  stories  
­ Moving  from  a  standalone  search  head  has  some  quirks  
· Think  about  administra>on  as  you  go  
36  

Summary  
· Know  the  data,  love  the  data,  share  the  data   · Involve  Ops  by  finding  out  what  they  need  
--  Dashboards  give  insights  to  opaque  technologies     --  Good  alerts  will  make  data  accessible  and  ac>onable   · Set  some  standards   --  Learn  to  log,  let  Ops  alert   --  Splunk  across  environments   · Use  Splunk  to  raise  all  ships  
  
  
37  

Next  Steps  
· Get in touch ­ gsumner@enernoc.com, splunk-admins@enernoc.com, or LinkedIn
· Boston Splunk Users Group
38  

THANK  YOU  

