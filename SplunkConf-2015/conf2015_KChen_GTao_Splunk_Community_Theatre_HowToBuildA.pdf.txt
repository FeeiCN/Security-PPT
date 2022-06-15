Copyright  ©  2015  Splunk  Inc.  
How  to  Build  a   Technical  Add--on   In  5  Minutes  
Gang  Tao  
Architect,  Splunk  

Disclaimer  
During  the  course  of  this  presentaHon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauHon  you  that  such  statements  reflect  our   current  expectaHons  and  esHmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaHon  are  being  made  as  of  the  Hme  and  date  of  its  live   presentaHon.  If  reviewed  aRer  its  live  presentaHon,  this  presentaHon  may  not  contain  current  or   accurate  informaHon.  We  do  not  assume  any  obligaHon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiHon,  any  informaHon  about  our  roadmap  outlines  our  general  product  direcHon  and  is  subject  to   change  at  any  Hme  without  noHce.  It  is  for  informaHonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaHon  either  to  develop  the  features  
or  funcHonality  described  or  to  include  any  such  feature  or  funcHonality  in  a  future  release.  
2  

Time  Spent  on  Data  Input  Projects  

20%   80%  

Data  PreparaHon   Data  Analysis  

3  

How  to  Get  Data  Into  Splunk?  

File monitors

TCP/UDP

Windows Event log

Scripted Input

Modular Input

HTTP Event Collector

4  

What  Does  A  Technology  Add--on  Do?  
!  It  is  a  Splunk  App  that  does  Data  PreparaHon  with  followings:  

Data  AcquisiHon  

Inputs  (Files,  Modular,  TCP/UDP,  etc)  

Data  TransformaHon  

Line  breaks,  Hmestamps,  field  extracHon  

Data  NormalizaHon   Data  Enrichment  

CIM  Mapping  (Event  types,  Tags,  aliases)   Prebuilt  panels,  saved  searches,  lookups  

5  

TA  :  From  Inputs  to  Dashboards  
6  

TA  Challenges  
Build  a  TA  from  Scratch  is  not  easy,    it  requires  some   trivial  steps  and  different  knowledge  about  modular  
input,  field  extracHon,  CIM,  etc.  
7  

TA  Builder  

App

Skeleton  Builder  

Modular  Input   Builder  

CIM  Builder  
8  

Validator  

Demo  
9  

Roadmap  

V1  
· Modular  Inputs   · Script  Inputs   · CIM  Mapping   · TA  ValidaHon  

V2  

V2  +  

· Field  ExtracHon   · Lookup  Builder   · Custom  Search  
Command  

· Flow  based   Modular  Inputs   building  IDE  

Q4,  2015  

Q1,  2016  

Future  

10  

Q&A  
11  

THANK  YOU  
12  

