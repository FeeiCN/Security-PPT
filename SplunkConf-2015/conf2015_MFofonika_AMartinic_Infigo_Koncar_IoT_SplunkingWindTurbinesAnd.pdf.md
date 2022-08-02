Copyright  ©  2015  Splunk  Inc.  
Splunking  Wind   Turbines  and  Keeping   the  Earth  Green  
Marijan  Fofonjka  
Senior  developer,  INFIGO  IS  
Ante  MarKni  
Business  Unit  Director,  KONCAR  

Disclaimer  
During  the  course  of  this  presentaKon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauKon  you  that  such  statements  reflect  our   current  expectaKons  and  esKmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaKon  are  being  made  as  of  the  Kme  and  date  of  its  live   presentaKon.  If  reviewed  aYer  its  live  presentaKon,  this  presentaKon  may  not  contain  current  or   accurate  informaKon.  We  do  not  assume  any  obligaKon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiKon,  any  informaKon  about  our  roadmap  outlines  our  general  product  direcKon  and  is  subject  to   change  at  any  Kme  without  noKce.  It  is  for  informaKonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaKon  either  to  develop  the  features  
or  funcKonality  described  or  to  include  any  such  feature  or  funcKonality  in  a  future  release.  

Agenda  

1  

2  

3  

4  

5  

THE   CUSTOMER  
WHO  ARE   THEY?  

THE  USE   CASE  
WHAT  DID   THEY  NEED?  

THE   JOURNEY  

A  CUSTOM   SOLUTION  

WHAT  DID  WE   DO?  

WHAT  DID  WE   CREATE?  

HOW  WE   WON  
KEY   TAKEAWAYS  

3  

KONCAR  Electrical  Industry  Inc.  

 Founded  1921  
 Companies  and   representaKve  offices   abroad  in:  Switzerland,   Bosnia  and  Herzegovina,     the  Russian  Federa8on     and  Serbia  

 3800  employees    Sales  revenue:  332  million    Export:  50%  

4  

Wind  Park  ­  Pometeno  Brdo  
 LocaKon:  Dugopolje  (near  Split)    16  wind  turbines,  built  
completely  by  Koncar    Total  power:  17,5  MW    Total  investment:  29  million    14  Koncar  companies  and  15  
partners    80%  parts  from  CroaKa  
5  

The  Challenge  
· Wind  turbines  generate  a  huge  amount  of  data  (approx.  2  million  events  per  day)   about  their  availability,  producKon  of  energy  and  energy  losses  
· Koncar  previously  stored  this  data  in  a  SQL  database  and  used  complex  external   applicaKons  to  produce  reports  as  well  as  to  proacKvely  alert  when  a  parKcular   wind  turbine  is  having  issues  
· This  became  more  and  more  cumbersome  as  the  amount  of  historical  data     kept  growing  
6  

The  Challenge  

Monitoring  requirements:  
· CalculaKon  of  availability   · Total  energy  producKon  &  losses   · Daily  and  monthly  PDF  reports   · ProacKve  detecKon  of  issues  in  
wind  turbines  

Issues:  
· Algorithm  for  calculaKon  of   availability  
­ IteraKve  algorithm  (very  slow)  
· Report  generaKon  Kme  
­ Daily  reports:  ~1h   ­ Monthly  reports:  ~12h  (!!!)  
· Central  storage  
­ SCADA   ­ MicrosoY  SQL  Server  2008               (2  million  events  daily)  
7  
  

The  Journey  

ExisKng  customer   came  to  us  with  a  
new  problem  

POC  uncovered  the   need  for  a  custom  
soluKon  

Built  custom  app  and   custom  reporKng   module  

Happy  customer,   looking  to  extend  
usage!  

8  

What  We  Built   ApplicaKon  inputs    Database  
­ MicrosoY  SQL  Server  2008     
 XML  configuraKons  
­ Custom  XML  configuraKons  for  calculaKons  
9  

What  We  Built   Database  inputs    MicrosoY  SQL  Server  2008  
 Unable  to  use  Splunk  DB  Connect  
­ Primary  key  composed  of  two  columns               Time  (to  seconds)  and  MS  (milliseconds)  
 Developed  our  own  Java  JDBC  agent  
10  

What  We  Built  
Custom  database  connector    ConnecKon  parameters  
­ host,  port,  database,  username  and  password  
 Primary  keys  
­ Name   ­ Type  (Kmestamp  or  number)  
 SQL  query  
­ ...  WHERE  (a.Time='$8me$'  AND  a.Ms>'$ms$')  OR  a.Time>'$8me$'  
 Encrypts  configuraKon  with  a  private  RSA  key  
11  

What  We  Built  
Custom  database  connector  
 Scripted  input  
­ iteraKvely,  every  30  seconds  
[script://$SPLUNK_HOME/etc/apps/koncar/bin/database_agent.sh]   interval  =  30   index  =  koncar   sourcetype  =  koncar  
 Collect  inputs  from  standard  output  
­ Key--value  format  (field=value)  
2015--02--16  23:59:59.346  Value=1.0  Quality=192  DataKeyId=135  
 Store  maximum  primary  key  pair  values  for  the  next  run  
12  

What  We  Built  
XML  configuraKon  inputs    Custom  XML  configuraKons  for  calculaKons    Parsers  as  custom  Python  controllers    Lookup  files  as  output  
13  

What  We  Built  
XML  configuraKon  inputs  
14  

What  We  Built  
XML  configuraKon  inputs  
15  

What  We  Built  
CalculaKng  availability    Inputs  
­ Groups  (System  OK,  Service,  Error,  ...)   ­ States  (Error    Emergency  brake,  Grid  brake,  ...)  
 MulKple  states  can  be  acKve  at  the  same  Kme    Custom  python  search  command    Summary  indexes  
­ Hourly  staKsKcs  and  calculaKon  states  
16  

What  We  Built  
CalculaKng  availability  
 Read  group  acKvity  from  previous  hour  
­ index=availability  sourcetype=acKvity  earliest=--1h@h  latest=@h  |  table  ...    
 Calculate  availability  
­ index=koncar  earliest=--1h@h  latest=@h  |  sort  0  _Kme  |  table  ...  
 Store  results  
­ Group  duraKon  
2015--02--17  13:00:00  WindTurbine="VA10"  Group="System  OK"    DuraKon=2934000  
­ Group  acKvity  
2015--02--17  14:00:00  WindTurbine="VA10"  Group="Error"  States="2000,2490"  
  
17  

What  We  Built   UpdaKng  events   18  

What  We  Built   UpdaKng  events    Find  entry  
­ index=koncar  earliest="$m/d/y:h:m:s$"  "$y--m--d  h:m:s.ms$"  GroupId="$gid $"  DataKeyId  ="$dkid$"  |  head  1  |  table  _raw  
    Delete  entry  
­ index=koncar  earliest="$m/d/y:h:m:s$"  "$y--m--d  h:m:s.ms$"  GroupId="$gid $"  DataKeyId  ="$dkid$"  |  delete  
19  

What  We  Built   UpdaKng  events  
 Save  modified  entry  to  unique  filename  that  Splunk  is  indexing  in   batch  mode  
   [batch://$SPLUNK_HOME/etc/apps/koncar/update]   index  =  koncar   sourcetype  =  koncar   move_policy  =  sinkhole   crcSalt  =  <SOURCE>  
     
20  

What  We  Built  
Total  energy  producKon  and  losses    CalculaKons  based  on  stats  commands  
­ Energy  curve  lookup  
 Energy    Losses  
­ Average  wind  speed  in  1m  intervals  
 Summary  indexing  
­ Hourly  and  daily  staKsKcs  
21  

Custom  .NET  applicaKon  
 A  crucial  part  of  this  project  was  the  ability  to  produce  reports  in  their     exisKng  templates    
 Now  they  can  send  the  same  reports  to  their  exisKng  customers    We  developed  a  custom  external  .NET  applicaKon  that  relies  on  Splunk's  SDK  API      Retrieve  data  and  produce  specific  PDF  and  Excel  reports  in  the  format  requested  
by  the  customer    This  allows  the  customer  to  generate  reports  from  data  stored  in  Splunk  in  any  
format  they  want  
­ They  simply  need  to  generate  a  template  which  will  be  used  by  the  developed     .NET  applicaKon  
22  

Custom  .NET  applicaKon  
 Templates  prepared  in  Excel    Fetch  summary  data  from  Splunk  
­ Splunk  C#  SDK  
 Start  Excel  process  in  a  background  and  fill  template  
­ MicrosoY.Office.Interop.Excel  
 Generate  PDF  from  Excel  template    Send  report  to  list  of  email  addresses  
23  

24  

25  

Key  Takeaways  
 Machine  data  is  more  than  just  IT  (IoT  is  really  here)   Splunk  is  a  flexible  tool  
­ Take  advantage  of  customizaKons  through  search  commands   or  external  Python  controllers  
 Use  this  flexibility  to  implement  exactly  what  the   customer  needs  
­ If  Splunk's  built--in  reporKng  is  limited,  with  SDK  API  sky's     the  limit  
26  

Key  Takeaways  
 With  Splunk,  the  Kme  to  generate  reports  has  been   dramaKcally  reduced  
 Daily  report  
­ From  one  hour  to  less  than  ten  seconds  
 Monthly  report  
­ From  twelve  hours  to  less  than  ten  seconds             (yes,  4.000  Kmes  faster  with  Splunk)  
 The  customer  can  now  run  yearly  reports  
­ Something  they  could  not  even  dream  about  before  
27  

Copyright  ©  2015  Splunk  Inc.  

THANK  YOU  

