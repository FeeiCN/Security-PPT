Copyright  ©  2015  Splunk  Inc.  
Quick  Service  Data  for     Quick  Service  Restaurants  
Brandon  Burk,  Juan  Gomez   Sonic  Drive--In  

Disclaimer  
During  the  course  of  this  presentaHon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauHon  you  that  such  statements  reflect  our   current  expectaHons  and  esHmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaHon  are  being  made  as  of  the  Hme  and  date  of  its  live   presentaHon.  If  reviewed  aSer  its  live  presentaHon,  this  presentaHon  may  not  contain  current  or   accurate  informaHon.  We  do  not  assume  any  obligaHon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiHon,  any  informaHon  about  our  roadmap  outlines  our  general  product  direcHon  and  is  subject  to   change  at  any  Hme  without  noHce.  It  is  for  informaHonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaHon  either  to  develop  the  features  
or  funcHonality  described  or  to  include  any  such  feature  or  funcHonality  in  a  future  release.  
2  

Agenda  
· Speaker  IntroducHon   · Business  Overview  (Who  is  SONIC?)   · Technology  Strategy   · Splunk  Journey/Landscape   · Use  Cases   · Lessons  Learned,  Business  Outcomes,  Looking  Forward   · QA     
3  

Speaker  IntroducHon  

Juan Gomez
· Lead Architect - Brand Systems · Splunk user since 2009 · Enjoy every aspect of Splunk, from
configuration, administration to finding insights from data
· Most recently working with Big Data,
Hadoop and Hunk
Linkedin: https://www.linkedin.com/pub/juan-gomez/ 4/a75/99b

Brandon Burk
 Sr. Director - Digital Technology  Networking, Software Development  IT and Program Management  Coffee Runner for Juan  Minecraft Amateur - Studying under my
6 and 8 year old daughters
LinkedIn: https://www.linkedin.com/in/brandonburk Twitter: @brandonburk
4  

Who  is  SONIC?  
· L a r g e s t   c h a i n   o f   d r i v e -- i n   restaurants  in  the  USA  ----  over  3,500   locaHons  in  44  states  (Q1/2014)  
· Started  in  1953  as  Top  Hat  Drive--In   · Renamed  in  1959  to  SONIC  Drive--In  
"Service  at  the  Speed  of  SoundTM"  
5  

SONIC  Fun  Facts  
In  one  year,  SONIC:   · Sells  enough  tots  that  when  placed  
end--to--end  would  circle  the  globe...       
TWICE  
6  

SONIC  Strategic  Technology  IniHaHves  
· Point  of  Sale  Replacement  (3,500+  locaHons)      · Integrated  Customer  Engagement    
­Digital  InteracHve  Menu  Boards  "POPS"  (100,000  displays)   ­Mobile  Commerce   ­Social  Media   ­Customer  RelaHonship  Management   ­Big  Data  AnalyHcs     
7  

SONIC  Splunk  Journey  

App.  Logs   1GB  
Monitoring
2009  

POPS  Data   2GB  

POS  Data   10GB  

Analysis
2013  

Support
2014  

Ops.  Intel   30GB  
IoT
2015  

8  

SONIC  Splunk  Landscape  
· 1  Search  Head  (8  CPUs,  16GB  RAM,  100GB  Disk)   · 2  Indexers  (ea  12  CPUs,  12GB  RAM,  350GB)   · 1  License/Deployment  Manager   · 11  Forwarders  (windows,  linux)     
9  

SONIC  Fun  Facts  
In  one  year,  SONIC:   · Sells  enough  Footlong  Quarter  
Pound  Coneys  to  border  the       
48    
conHguous  United  States  
10  

SONIC  Use  Case  #1  
Point of Sale Replacements - Implement Price Auditing using Splunk Challenge: · How to ensure that prices stay consistent as we migrate store(s) from one Point of Sale to
another? Solution: · By conducting price audits
· But Then...
· How do we audit price data that is in multiple data sources? i.e. Cloud based vs. on premise · How do we compare the compare multiple data formats? · How do we take data updates into account? · How we quickly respond to the business by adopting the current data and sources?
11

SONIC  Use  Case  #  1  (Before)  

SONIC  Use  Case  #  1  (ASer)  

SONIC  Use  Case  #  1  
Point  of  Sale  Conversions  --  Implement  Price  AudiHng  using  Splunk  
Great....
Now we have a process to compare and alert prices coming from multiple sources
But what about....
Obtaining prices updates after prices are corrected in the target system? Can we use Splunk for that?
Definitely... § Use `script' from within search window to call out a python script
§ Then leverage RESTful APIs and bring data into Splunk's index via the python script
  
14

SONIC  Use  Case  #  1  
Point  of  Sale  Conversions  --  Implement  Price  AudiHng  using  Splunk  
Outcomes  
  
· Maintained  customer  service  and  saHsfacHon  while  point  of  sale   conversions  occurred  
· Minimize  store  disrupHon  by  ensuring  that  price  informaHon  is  accurate   · Speed  up  the  Hme  for  price  validaHon  and  price  correcHon  
  
  
15

Add Dashboard picture.

SONIC  Fun  Facts  
In  one  year,  SONIC:   · Sells  enough  Cherry  Limeades  to  fill  
more  than       
50    
Olympic  sized  swimming  pools  
18  

SONIC  I.C.E.  
19  

Use  Case  #2  Background  
Run  a  Great  Mobile  Pay  Experience  at  100,000+  Points  of  Purchase    

Digital POPS OR
Legacy Credit Card Terminal

Challenge  
Detect  and  correct  slow  or  unreliable  mobile  payment   experiences  
  
Solu+on  
Set  performance  target,  compare  100,000+  locaHons  to   target,  apply  correcHve  acHons    
  
But  Then  
§ How  will  we  evaluate  legacy  Point  of  Sale   environments  along  with  newly  installed  
environments?   § How  will  we  easily  apply  correcHve  acHon?  

2   0

Use  Case  #2  Blueprint  

Public Internet

*

Modern Store Network
Legacy Store Network

Loss Prevention & Fraud
Tech Support
Script Automatic Resolution

Use  Case  #2  Outcome  

Benchmarked  Performance  at  100,000+  Points  of  Purchase    

As  a  Result  

· AcHons  planned  for  restaurants  with  

chronic  technical  issues  

· PrevenHon  of  potenHal  issues  

· Confidence  in  markeHng  decisions  

Digital POPS

· Customer  experience  data  driving  new  

OR

product  development  

· GiS  Card  Fraud  DetecHon  and  

PrevenHon  

Legacy Credit Card Terminal
22

Insert one image for fraud (redacted) here

Fun  Facts  
In  one  year,  SONIC:   · Gives  away  enough  mints  to  reach  
the  top  of  the  Empire  State  Building   and  back  to  the  ground...       
5,000       
Hmes  
25  

Lessons  Learned  
· Lessons  Learned  
­ Iterate  on  Capacity  Planning  and  AllocaHon   ­ Educate  before  AdvocaHng  in  the  Enterprise   ­ Leverage  End--User  Training  Resources   ­ Use  Professional  Services  or  Splunk  Recommended  3rd  Party  ConsulHng   ­ Plan  on  Development  for  Some  Data  Sources   ­ IdenHfy  and  Build  Splunk  Admins  and  Subject  Maper  Experts  
  
26  

Business  Outcomes  
Our  Choice  for  OperaHonal  Intelligence   · Outcomes  at  Sonic  
­ Products  Sold  at  Accurate  Prices  =  Predictable  Sales  Performance   ­ PrevenHon  of  Poor  Digital  Customer  Experiences   ­ GiS  Card  Fraud  DetecHon  and  Loss  PrevenHon   ­ Improvement  of  SaaS  and  other  Vendor  Provided  Technology  
27  

Looking  Forward  
Our  Choice  for  OperaHonal  Intelligence   · The  Future  
­ OpHmizing  data  indexed  and  balancing  with  Hadoop/Hunk   ­ Splunk  API  IntegraHon  to  other  Control/APM  Systems   ­ Establishing  Basic  Governance  with  Speed  to  Discover   ­ Leverage  Big  Data  assets  via  Hunk  
28  

Q&A  
29  

THANK  YOU  

