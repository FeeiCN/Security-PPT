Copyright  ©  2015  Splunk  Inc.  
Security  OperaCons   Use  Cases:  'Cause   Bears,  Pandas,  and   Sandworms    
Ryan  Chapman  &  Lisa  Tawfall  
Bechtel  CorporaCon  

Disclaimer  
During  the  course  of  this  presentaCon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauCon  you  that  such  statements  reflect  our   current  expectaCons  and  esCmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaCon  are  being  made  as  of  the  Cme  and  date  of  its  live   presentaCon.  If  reviewed  aVer  its  live  presentaCon,  this  presentaCon  may  not  contain  current  or   accurate  informaCon.  We  do  not  assume  any  obligaCon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiCon,  any  informaCon  about  our  roadmap  outlines  our  general  product  direcCon  and  is  subject  to   change  at  any  Cme  without  noCce.  It  is  for  informaConal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaCon  either  to  develop  the  features  
or  funcConality  described  or  to  include  any  such  feature  or  funcConality  in  a  future  release.  
2  

Agenda  
 Who  Are  We?    Overview  of  Security  @  Bechtel    Why  Splunk    Use  Cases     
3  

Bechtel  CorporaCon  
Bechtel  CorporaCon  is  the  largest  construcCon  and  civil  engineering   company  in  the  U.S.,  making  the  company  a  target  rich  environment.   Since  2011,  Bechtel  has  set  out  to  build  a  world--class  Security   OperaCons  Center,  which  relies  heavily  on  Splunk.    
4  

Ryan  Chapman  
 Network  Security  Monitoring  Analyst    Incident  Handler    CIRT  /  SOC  Liaison    "Did  You  Check  Splunk?"  Guy    No  Really.    Did  You  Check  Splunk?  
@rj_chap  
5  

@ltawfall  

Lisa  Tawfall  
 Security  Unicorn  (Yes,  really)    Lead  for  the  team  that  manages  security  
infrastructure  at  Bechtel    Splunk  Administrator    Breaker  of  Splunk    Fixer  of  Splunk  
6  

Security  @  Bechtel  

Background  
· How  were  you  doing  it  before  Splunk?   · How  much  )me  would  it  take  you?   · Why  wasn't  it  working?     
8  

Post  RemediaCon  Structure  
9  

The  Security  Stack  

Firewall   Full  Packet  Capture   Applica)on  Firewall  
DNS  Protec)on   Email  Blocking   Network  Event  Parsing   Behavior  Analysis  

External  
Deter   Detect   Respond   Remediate  

APT  Detec)on   Forensics   AV   Log  Forwarding   Intense  Monitoring  
10  

Why  Splunk?  
Because  it's  awesome!    Beler  than  GREP?    Parsing  Individual  Logs?  
­ 2.35TB/day  License  
 Primary  uses:  
­ Alert  generaCon   ­ Response!  
ê The  "5  W's"  
11  

Why  Splunk?  
Bechtel  is  target  rich!    
12  

Obligatory  Splunk  Quote  
"We  wouldn't  be  able  to  do  our     jobs  without  Splunk"  
13  

Use  Case  One  

Use  Case  1  
"These  computers  are  infected"    Project  site  contacts  the  SOC  
­ "Symantec  is  not  catching  infecCons."   ­ "OK.  what's  going  on?"   ­ "InfecCons."  
 AddiConal  info  requested  
­ 5  Hostnames  provided   ­ MulCple  occurrences  of  ".Trashes"  
15  

IniCal  Analysis  
It's  Splunk  Cme,  baby    Symantec  Enterprise  ProtecCon  (SEP)  
­ Is  SEP  leaving  as--is?  
 IniCal  focus:  acCon  taken  
­ Looking  for  "leF  alone"  
16  

Symantec  Enterprise  ProtecCon  (SEP)  Logs  
LeV  alone?  
earliest=02/01/2015:00:00:00   latest=04/01/2015:00:00:00  index=sep   sourcetype="sep12:risk"  OR   sourcetype="sep12:proac)ve"  OR   sourcetype="sep12:ids"   (src="[REDACTED]"  OR  src="[REDACTED]"  OR       src="[REDACTED]"  OR  src="[REDACTED]"  OR       src="[REDACTED]")   ac)on="LeF  Alone"   |  table  event_Cme,  src,  hash_value,   scan_type,  acCon,  actual_acCon  
17  

SEP  Logs  cont'd  
Are  we  gexng  logs?   · Try  to  avoid  false  negaCves!  
· Yes,  we  have  logs   · acCon  =  "blocked"  
­ actual_ac'on  !=  "Le0  Alone"  
18  

Windows  Logging  Service  (WLS)  
Give  me  your  Cred,  your  weak,  YOUR  HASHES  
earliest=03/01/2015:00:00:00   latest=03/03/2015:00:00:00   index=wls  EventID="4688"   (            Computer="[REDACTED]"       OR  Computer="[REDACTED]"     OR  Computer="[REDACTED]"     OR  Computer="[REDACTED]"     OR  Computer="[REDACTED]")   |  stats  count  by  MD5  |  sort  0  --count    
19  

Hash  Analysis  
We  Haz  tools  
20  

HFS/HFS+  &  ".Trashes"  
21  

Rummaging  Through  the  .Trashes  
These  sites  don't  use  Macs...  
earliest=03/01/2015:00:00:00   latest=03/15/2015:00:00:00   index=wls  EventID=4688   CommandLine="*.Trashes*"   |  rex  field=Computer           "(?<site_code>[A--Za--z]{3})"   |  eval  site_code  =  upper(site_code)   |  stats  count  by  site_code   |  sort  0  --count  
22  

Process  ExecuCon  
Event  code  4688  
earliest=02/01/2015:00:00:00   latest=04/01/2015:00:00:00   index=wls  EventID=4688   CommandLine="*.Trashes*"   |  table  _Cme,  Computer,   SubjectDomainName,   SubjectUserName,  BaseFileName,   CommandLine,  CompanyName,   CreatorProcessName,   NewProcessName,  FileDescripCon,   FileVersion,  MD5  
23  

JS.Proslikefan.B  
Similar  to:  JS.Bondat  
· Google  to  the  rescue!  

· Symantec  write--up  
­ Sample  not  yet  detected   ­ Eventually  set  to  à  

· Windows  scripCng  host  
­ WScript.exe   ­ Runs  .vbs  and  .js  Scripts  

(Symantec,  2014)  
24  

IdenCfying  Infected  Hosts  
IniCal  host(s)?  
earliest=01/01/2014:00:00:00   latest=04/01/2015:00:00:00   index=wls  EventID=4688   CommandLine="*.Trashes*"   |  regex  CommandLine="Trashes\\ \[0--9]{3}\\\[A--Za--z]{4,8}\\.js"   |  fields  _Cme,  Computer   |  eventstats  count  by  Computer   |  dedup  Computer  |  sort  0  _Cme   |  table  _Cme,  Computer,  count  
25  

Now  What?  
RemediaCon  issues  
· Cannot  remediate  without  addressing  USB  drives      · Steps  to  remediate:  
­ 1)  Iden)fy  infected  drives   ê Provide  list  to  project  IT  
­ 2)  Project  IT  burns  USB  drives   ­ 3)  Implement  new  USB  policy   ­ 4)  Rebuild  hosts   ­ 5)  Cross  fingers  
26  

USB  Drive  IdenCficaCon  
via  WLS  Logs  
earliest=03/01/2015:00:00:00   latest=03/03/2015:00:00:00     index=wls*  EventID="20001"   (Computer="[REDACTED]"  OR       Computer="[REDACTED]"  OR       Computer="[REDACTED]"  OR       Computer="[REDACTED]"  OR       Computer="[REDACTED]")   |  table  _Cme,  Computer,  SetupClass,   DriverDescrip)on,  DeviceInstanceID,   DriverName  
27  

USB  Drive  IdenCficaCon  cont'd  
via  SEP  Logs  
earliest=03/01/2015:00:00:00   latest=03/03/2015:00:00:00   index=sep  evenoype=nix_usb   ([REDACTED  ­  Hostnames  Here])   |  dedup  dest_nt_host,  device_id   |  sort  0  dest_nt_host   |  table  dest_nt_host,  device_id  
28  

USB  Drive  IdenCficaCon  cont'd  
Parsing  USB  device  descriptor  
|  dedup  dest_nt_host,  device_id   |  rex  field=device_id  "USBSTOR\\\   (?<type>.*)&Ven_   (?<vendor>.*)&Prod_   (?<product>.*)&Rev_   (?<revision>.*$)"   |  sort  0  dest_nt_host   |  table  dest_nt_host,  type,  vendor,   product,  revision  
29  

Use  Case  1  Wrap--Up  
RemediaCon  details  
· 287  Hosts  Rebuilt  IniCally  
­ +  ~40  Hosts  over  Cme   ­ 3  Sites  affected  heavily  
    
· USB  drive  policy  changes  
­ We  found  1,000s  in  use   ê Some  hosts  >  20  a  day!  
­ Project  IT  in  charge  of  drives   ­ Greater  focus  on  USB  dangers  
· Ongoing  alert  via  saved  search  
30  

Use  Case  Two  

Use  Case  2  
Vexng  threat  intel    Intel,  Intel,  Intel  ­  It's  every  where    Paid  feeds,  open  source,  blogs,  
twiler,  that  guy  you  worked  with   two  companies  ago...    How  do  you  process  all  those   Indicators  of  Compromise  (IOCs)?  
32  

Vexng  Threat  Intel  
33  

Automate  All  the  Things  
34  

IOC  Triage  (IOCSaw,  WAM,  Trac)  

INDICATOR bad.site.cc
palace.malware.n et
totally.legit.net
testuser123.crime.co m securelist.com

#

LAST

FIRST BLKD

COMMENT

1 Ticket#27565,   OSINT.  (India   Breach)  

1More dynamic dns blocks

22307/14/2 07/16/ 015:21: 2014:2 46:03 2:53:4 5

1INT: [DIB] Weekly Round Up IOCs 02/10
1 Ticket#27565,   OSINT.  (India   Breach)  

CATEGORY

CREATED

UPDATED

Targeted 2013-03-14T 2013-03-14T

01:37:15 01:37:15

Dynamic 2013-09-03T 2013-09-03T

DNS

20:19:09 20:19:09

Targeted 2013-08-29T 2013-08-29T 14:30:06 14:30:06

Targeted 2013-03-14T 2013-03-14T 01:37:15 01:37:15

RELEASE TRAC 3/14/13 #54728  
9/3/13 #78508 ,#5393 9
8/29/13 #41152  
3/14/13 #54728  
32   matched   Cckets  

35  

Hash  Triage  (NSRL*  lookup  and  Trac)  

HASH 7D7D7D7D7D7D7D7D7D7D7D7D7D7D22 E9A87BB87BB87BB6DC053238B0A87B
EDCD313791506EDCD318A2A88B9EDC 72EDCD31A7AAD3102C5AA7758EEDCD AAA62D5F0E348F0E8AAAAAADDDDDDE 4DFDF00000000000474B8F431B6E07 21C46A95329F3F1688888888800000 0B3D7D7D7D7D7D8887BB1D32FFFFFF 202020202028939393939D7D7D7D7D 5A22E5AEE4DA2FE363B77F1A22E5AE 5A22E5AEE4DAA22E5AEE4DAA22E5AE F8A22E5AEE4DA488BA22E5AEE4DA44

NSRL_FNAME NSRL_MFG NSRL_PROD

TRAC

#83349, #83030, #83021, #82915

#84507  

#83532   #82887  

*NaConal  SoVware  Reference  Library  
36  

Macros  are  Awesome  

Hashes  --  give  us  all  your  hashes  

 `hash_indices`  Macro:        (index=wls*  OR  index=bro_hlp  OR  index=bro_noCce  OR  

index=bro_smtp_enCCes  OR  index=fe  OR  index=fireeye  OR  

  

index=bro_files  OR  sourcetype="sep12:risk"  OR   sourcetype=sep12:proacCve  OR    sourcetype=sep12:behavior)  AND  

file_hash!="--"  

earliest=--24h  `hash_indexes`  file_hash="B9A4DAC2192FD78CDA097BFA79F6E7B2"  OR   file_hash="E7B2ED6FF40DAB2F235000B0299E7B2"  OR  file_hash="E7B2B87136E2DC22F8D2740F3E6EE7B2"  

37  

Another  Useful  Macro  

All  Your  Web  Traffic  R  Belong  to  US  

 `web_traffic`  macro:  

(sourcetype=pan_traffic  OR   sourcetype=pan_threat  OR  index=bro_hlp  OR   index=websense  OR  index=isa*  OR   index=bro_conn)  

`web_traffic`  wdmycloud.device2479816.wd2go.com  

· Palo  Alto   · ISA  Proxy   · BRO  

38  

Splice  
Splice  of  life  is  IOCs    We  have  lots  of  indicators  of  compromise...    We  had  MIR...    We  have  Splice  Now  
hlps://splunkbase.splunk.com/app/2637/    This  funcConality  is  now  available  in  Splunk  Enterprise  Security  3.3  
39  

Recap  of  5  Takeaways  

`Member  these  things  

 Saved  Searches  are  you  friend  
­ 25.33%  Percent  of  our  Cckets  

 Macros  are  your  friend  

 CIM  is  your  friend  

 Avoid  false  negaCves:  always  check  for  log  acCvity!  

 Remember  to  check  Splunk,  the  answers  could  already  be  there  

 Troll  answers.splunk.com,  splunk  blog,  and  splunk  base  

  

@rj_chap  

@ltawfall  

40  

QuesCons?  
41  

THANK  YOU  

