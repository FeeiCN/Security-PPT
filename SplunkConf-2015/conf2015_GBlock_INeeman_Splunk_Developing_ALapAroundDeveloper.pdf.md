Copyright  ©  2015  Splunk  Inc.  
A  Lap  Around  Developer   Awesomeness  In  Splunk  6.3  
Itay  Neeman  ­  Director  of  Engineering     Glenn  Block  (@gblock)  ­  Senior  Product  Manager     Splunk  Developer  PlaJorm  &  Core  

Disclaimer  
During  the  course  of  this  presentaRon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauRon  you  that  such  statements  reflect  our   current  expectaRons  and  esRmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaRon  are  being  made  as  of  the  Rme  and  date  of  its  live   presentaRon.  If  reviewed  a\er  its  live  presentaRon,  this  presentaRon  may  not  contain  current  or   accurate  informaRon.  We  do  not  assume  any  obligaRon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiRon,  any  informaRon  about  our  roadmap  outlines  our  general  product  direcRon  and  is  subject  to   change  at  any  Rme  without  noRce.  It  is  for  informaRonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaRon  either  to  develop  the  features  
or  funcRonality  described  or  to  include  any  such  feature  or  funcRonality  in  a  future  release.  
2  

Splunk  6.3  is   filled  with     Developer   Awesomeness!  
3  

HTTP  Event  Collector  
· A  new  token--based  JSON  API  for  events   · Send  events  directly  from  anywhere  (servers,  
mobile  devices,  IOT)   · Easy  to  configure  /  works  out  of  the  box.     · Easy  to  secure   · Highly  performant,  scalable  and  available  
      Sessions  to  Learn  more:     · Liberate  your  ApplicaRon  Logging!   · AcceleraRng  your  SoluRon  Development  with  
Splunk  Reference  Apps   · Throw  Your  Future  Self  a  Lifeline  with  a  Lifle  
DevOps  Data  
4  

Demo  
   HTTP  Event  Collector  

Custom  Alert  AcRons  
· Build  reusable  alert  hooks  into  Splunk   · Integrated  into  the  Splunk  UI   · Packaged  in  Splunk  apps   · Similar  to  authoring  Modular  Inputs   · Very  developer  friendly:  
­ Simple  code  interface   ­ Easily  hook  into  UI   ­ Easy  way  to  test  your  alert  from  a  search        
Sessions  to  Learn  more:    
· CreaRng  and  Using  Custom  Alert  AcRons  
· AcceleraRng  your  SoluRon  Development  with  
Splunk  Reference  Apps  
6  

Demo  
   Custom  Alert  AcRons  

Custom  Search  Commands  
· Create  new  commands  that  can  run  in   your  search:  
­ For  example,  "index=myindex  |   my_awesome_command  some_field  |  stats  count  
· New  in  6.3  --  significantly  improved   protocol,  drasRcally  improved   performance  
­ Single  process  per  search--invocaRon   ­ Reduced  serializaRon/deserializaRon   ­ Increased  flexibility  and  reliability  
· New  Python  SDK  release  supports  both   v1  (6.2  and  below)  and  v2  (6.3+)  of  the   protocol  
8  

Demo  
  
Custom  Search     Commands  

SimpleXml  Enhancements  
· Eval  Tokens  
­ Set  tokens  to  an  eval  expression     
· Search  events  
­ Tap  into  various  stages  of  the  search   pipeline  and  update  tokens  based  on   job  properRes  .  
  
   Sessions  to  Learn  more:     · Advanced  InteracRons  using  Simple  XML  
  
10  

Demo  
  
SimpleXml     Enhancements  

Modular  Inputs  in  Node.js  
· Used  to  create  new  new  types  of  reusable   inputs  in  Splunk  
· The  Splunk  SDK  for  Node.js  has  built--in   support  for  wriRng  Modular  inputs:  
Benefits:  
­ Easy  to  write   ­ No  boilerplate   ­ Use  NPM  packages  
­ Cross--plaJorm  
   Sessions  to  Learn  more:     · Throw  Your  Future  Self  a  Lifeline  with  a  Lifle  
DevOps  Data   · Modular  Inputs  --  If  You  Build  It,  They  Will  Come  
12  

Demo:  
   Node.js  Mod  Inputs  

REST  API/SDK  Support  for  SHC  
· Search  Head  Clustering  allows  you   to  have  a  scalable,  redundant   search  Rer  with  config   synchronizaRon  
· SHC  supports  cookie--based   authenRcaRon  for  cross--cluster   authenRcaRon  support  
· Several  SDKs  now  support  SHC:  
­ JavaScript  SDK   ­ C#  SDK   ­ Java  SDK  
­ Python  SDK  
14  

SDK  +  SHC  Demo!  

Next  steps?    
Related  breakout  sessions  and  acRviRes...  
Breakouts   · CreaRng  and  Using  Custom  Alert  AcRons   · The  HTTP  Event  Collector,  a  New  Way  for  Developers  to  Send  Events  to  Splunk   · AcceleraRng  Your  SoluRon  Development  with  Splunk  Reference  Apps   · Advanced  InteracRons  using  Simple  XML  
More  informaRon   · dev.splunk.com   · blogs.splunk.com/dev  
   Come  by  the  Developer  Booth  and  say  hi  /  ask  quesBons!  
16  

THANK  YOU  

