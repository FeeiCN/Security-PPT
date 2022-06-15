Copyright  ©  2015  Splunk  Inc.  
PaDent  Privacy   Monitoring  with  Splunk  
Davin  Studer  
Systems  Analyst,  The  Vancouver  Clinic  

Disclaimer  
During  the  course  of  this  presentaDon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauDon  you  that  such  statements  reflect  our   current  expectaDons  and  esDmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaDon  are  being  made  as  of  the  Dme  and  date  of  its  live   presentaDon.  If  reviewed  aQer  its  live  presentaDon,  this  presentaDon  may  not  contain  current  or   accurate  informaDon.  We  do  not  assume  any  obligaDon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiDon,  any  informaDon  about  our  roadmap  outlines  our  general  product  direcDon  and  is  subject  to   change  at  any  Dme  without  noDce.  It  is  for  informaDonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaDon  either  to  develop  the  features  
or  funcDonality  described  or  to  include  any  such  feature  or  funcDonality  in  a  future  release.  
2  

IntroducDon  
The  Vancouver  Clinic  
· Serving  Southwest  Washington     since  1939  
· Locally  owned  and  governed   · Comprehensive  and  high  quality  
paDent  care  
   My  role  as  a  Systems  Analyst  
· IntegraDon  of  medical  systems   · Improvement  of  business  processes  
3  

Agenda  
· Who  should  be  interested  in  paDent  privacy  monitoring?   · Why  is  paDent  privacy  monitoring  Important?   · What  are  some  of  the  opDons?   · How  has  The  Vancouver  Clinic  approached  privacy  monitoring?   · Takeaways  
4  

Who  should  be  interested  in     paDent  privacy  monitoring?  
5  

Everyone!  

· HIPAA  
(Health  Insurance  Portability  and  Accountability  Act)  
· HITECH  Act  
(Health  InformaDon  Technology  for  Economic  and   Clinical  Health)  
· Other  state/federal  regulaDons  

· Risk  of  idenDty  theQ   · Exposure  of  sensiDve  personal  data  

6  

Why  is  paDent  privacy     monitoring  important?  
7  

Because  the  Consequences  Are  Very  Costly  
8  

What  are  some  of  the  opDons?  
9  

The  Bad,  The  Worse  and  the  Ugly...  
Third--party  vendors   TradiDonal  reporDng  tools   Canned  applicaDon  reports  

%  of  charts  resembling  Pac--Man   %  of  charts  not  resembling  Pac--Man  

· Expensive  
· You  sDll  do  80--90%  of   the  work  
· At  the  mercy  of  the   vendor's  Dme  table  

· Requires  a  dedicated  report   wriDng  team  
· Steep  learning  curve   · Expensive  plaforms  

· Siloed  reports  per  applicaDon   · Reports  you  want  may  not  
exist  or  can't  be  run   · Limited  reporDng  capabiliDes  

10  

...or  the  Good!  
· One  interface  to  search  them  all...   · Easy  to  get  the  data  in   · Searches  can  be  created  quickly   · VersaDle  
11  

The  Vancouver  Clinic's     approach  to  privacy  monitoring  
12  

2010  
Splunk  for  IT  
monitoring  

Timeline  of  Events  

Jan  ­  Apr  2013  
Evaluated  privacy   monitoring  vendors  

May  2013  
Switched  to  Splunk  

· Server  &  workstaDon  logs   · Steep  upfront  and  on--going  costs  

· Network  infrastructure   · ApplicaDon  logs  

· Many  billed  as  turn--key  soluDons,   but  were  not  
· Timelines  to  compleDon  were     too  high  

· We  would  sDll  be  doing  80--90%   of  the  work!  

13  

· Data  in  Splunk  within     two  weeks  
· MulDple  reports  with     real  data  
· Ability  to  produce  reports   that  many  vendors  could   not  provide  

Process  Overview  

EMR   Daily  ETL  Process  

ReporDng  

Rolling  30   days  Access  

Geocoded   HR  System  

AcDve  

DB  

Logs  

Addresses  

Directory  

Report   Reviewer(s)  
Dashboards   and  Reports  

SQL  scripts  
14  

ImplementaDon  

HR  System   Employee   AcDve   ID  Join   Directory  
HRIS_AD  
EMPLOYEE_ID   USER_NAME   FIRST_NAME   LAST_NAME   BIRTH_DATE   GENDER   ADDRESS   CITY   STATE   ZIP_CODE     

EMR_USER  
EMR_USER_ID   NAME   ------   USER_NAME        
15  

EMR_ACCESS_LOG  
------   EMR_USER_ID   ------   PATIENT_ID        
ADDRESS_GEOCODE  
ADDRESS   CITY   STATE   ZIP_CODE   LATITUDE   LONGITUDE              

EMR_PATIENT  
PATIENT_ID   FIRST_NAME   LAST_NAME   BIRTH_DATE   GENDER   ADDRESS   CITY   STATE   ZIP_CODE              
Daily   Geocoding  
Process  

Reports  
Employee  viewing:  
· VIP   · Self   · Neighbor  
-Offline  geocoded  all  employee  and  paDent  addresses   -htp://www.datasciencetoolkit.org/   · PaDent  at  same  address   · Employee   -Employee  viewing  manager   -Manager  viewing  direct  report   -Employee  viewing  co--worker  
16  

Snapshot  View  of  All  Reports  
  
17  

Deep  Dive  InvesDgaDon  
  
18  

Lessons  Learned  
· Key/Value  data  is  much  easier  to  index   (ex.  key1="value"  key2="value")  
· If  your  data  is  in  a  database  by  all  means  use  DB  Connect   · Work  closely  with  the  compliance  team  to  determine    
the  requirements   · You  must  start  with  security  in  mind  as  there  is  PHI  involved  
19  

Takeaways  
· Splunk  helps  us  fulfill  HIPAA  and  HITECH  requirements  for     privacy  monitoring  
· Saved  over  $50K  +  $12K  yearly   · Easy  to  implement   · Flexibility  to  add  reports  and  data  sources  
20  

Contact  Info:   Davin  Studer   dstuder@tvc.org  
21  

QuesDons?  
22  

THANK  YOU  

