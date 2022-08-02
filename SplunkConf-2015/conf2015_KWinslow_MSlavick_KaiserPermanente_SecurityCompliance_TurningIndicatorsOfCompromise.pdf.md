Copyright  ©  2015  Splunk  Inc.  
Turning  Indicators  of   Compromise  into     Tangible  Protec:on  
Ka:e  Winslow  
Sr.  Manager,  Kaiser  Permanente  
Mike  Slavick  
Lead  Cyber  Threat  Intel,  Kaiser  Permanente  

Disclaimer  
During  the  course  of  this  presenta:on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau:on  you  that  such  statements  reflect  our   current  expecta:ons  and  es:mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta:on  are  being  made  as  of  the  :me  and  date  of  its  live   presenta:on.  If  reviewed  aQer  its  live  presenta:on,  this  presenta:on  may  not  contain  current  or   accurate  informa:on.  We  do  not  assume  any  obliga:on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi:on,  any  informa:on  about  our  roadmap  outlines  our  general  product  direc:on  and  is  subject  to   change  at  any  :me  without  no:ce.  It  is  for  informa:onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga:on  either  to  develop  the  features  
or  func:onality  described  or  to  include  any  such  feature  or  func:onality  in  a  future  release.  
2  

"It  is  by  comparing  a  variety  of  informa:on,  we   are  frequently  enabled  to  inves:gate  facts,  
which  were  so  intricate  or  hidden,  that  no  single   clue  could  have  lead  to  the  knowledge  of  them."    
--  George  Washington    
3  

Personal  Introduc:on  

 Ka:e  Winslow,  Kaiser  Permanente  
 Sr.  Manager,  Threat  Management   and  Governance  

 Mike  Slavick,  Kaiser  Permanente    Lead  Cyber  Threat  Intelligence    

4  

About  Kaiser  Permanente  
10  Million  Members  and  Growing!  
5  

Healthcare  is  a  Primary  Target  

Company  Name  

Breach  Date  

Records  Lost  

August  2014  

4.5M  

February  2015   80M  

March  2015  

11M  

=  1M  records  

July  2015  

4.5M  

Healthcare  Data  is  Valuable  and  Marketable  
6  

Cyber  Risk  Defense  Center  
7  

Advanced  Warning:  Cyber  Threat  Intelligence  

Input:  Threat  Data  Sources   · 3  Leber  Agencies   · Rela:onships     · Vendor  Subscrip:ons     · ISACs  

CTI: Advanced
Warning

Output:  Ac:onable  Intelligence  
· Malicious  IP  /  URLs  Blocked   · Compromised  Creden:als   Remediated   · Impostor  and  New  Domains   Iden:fied  

Sharing  Threat  Data  Makes  CTI  Successful!  
8  

Ac:onable  Intelligence  
Highlights:   · Text   · Text  
9  

Results  ­  Drama:c  Reduc:on  of  Malware  
· Users  s:ll  click  on  malicious  links  but  90%  of  infec:ons  are  blocked   · Most  malware  alerts  "eliminated"  with  no  impact  to  user  
10  

Intel  Driven  Results  ­  What  Might  Have  Been...  
· Users  s:ll  led  to  malicious  site   · Approach  blocks  "downstream"  
ac:vity  
· Allows  us  to  
· Find  compromised  accounts/ac:vity   · Block  before  infec:on  occurs   · Iden:fy  poten:al  malicious  ac:vity  
Compromised  accounts  are  inevitable  but  infecCons  and  downstream   impact  are  preventable  
11  

Results  ­  Network  Security  &  Endpoint  Security  

Reduc:on  in  IPS,  DNS   Sinkhole  ac:vity  

· Less  malicious  traffic   · Less  noise  to  follow  up    
12  

Results  ­  Network  Security  &  Endpoint  Security  
· Significantly  less  malicious  files/ac:vity  @  the  endpoint   · Less  virus  and  file  modifica:on  à  fewer  abackers  gepng  to  the  endpoint  
13  

Shared  Visibility  
14  

Technology   Examples  

Now  Time  for  Techy  Stuff!  
What  we're  going  to  talk  about:    Creden:al  dump  parsing    Fun  with  PCRE!    Newly  created  domains     
16  

Making  Sense  of  Creden:al  Dumps  
 We'll  use  a  Pony  C2  server  in  this  example....       "hbps://*REDACTED*@us.ibm.com:*REDACTED*@smc3apps.smc3.com/Login2/Login.asp"  
17  

Did  the  Field  Extrac:on  Work?  
18  

Take  Ac:on  on  All  Compromised  Creden:als  
 Search  and  filter  on  a  list  of  company  domains...    Share  exposed  creden:als  with  industry  partners....    Laugh  at  horrible  passwords  J  
19  

Fun  with  PCRE!  
 Using  PCRE  expressions  you  can  then  match  these  against  your  proxy  logs  to  find  evil!    ^hbp:\/\/[^\x3f]+\/search\.php\?keywords=[0--9a--z&]+&fid\[?0\]?=[0--9a--z]+$      REDACTED/REDACTED/REDACTED,  2015--07--27,  Angler  EK  evolved  redirect    
  
Special  thanks  to  Packetmail!  
20  

Newly  Created  Domain  Shenanigans  
New  Domains   Research   WIN!  
21  

Takeaways  
 Integrate  CTI  with  your  SOC    Not  all  CTI  feeds  are  created  equal    Smart  people  to  transform  informa:on  into  intelligence    Collaborate,  consolidate  data  and  share  value    Sharing,  Sharing,  Sharing!  
  
22  

Resources  
 FS--ISAC  hbps://www.fs--isac.com/    NH--ISAC  hbp://www.nhisac.org/     
Packetmail  PCREs  hbp://www.packetmail.com   InfraGard  hbps://www.infragard.net  
  
23  

Ques:ons?  
24  

THANK  YOU!  

