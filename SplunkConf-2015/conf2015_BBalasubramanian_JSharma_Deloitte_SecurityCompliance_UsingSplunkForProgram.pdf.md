Copyright  ©  2015  Splunk  Inc.  
Using  Splunk  for   Program  Integrity  in   Health  and  Human   Services  
Bharane  Balasubramanian    
DeloiEe  &  Touche  LLP  
  
JaJnder  Sharma    
DeloiEe  &  Touche  LLP  

Disclaimer  
During   the   course   of   this   presentaJon,   we   may   make   forward   looking   statements   regarding   future   events  or  the  expected  performance  of  the  company.  We  cauJon  you  that  such  statements  reflect  our   current   expectaJons   and   esJmates   based   on   factors   currently   known   to   us   and   that   actual   events   or   results   could   differ   materially.   For   important   factors   that   may   cause   actual   results   to   differ   from   those   contained   in   our   forward--looking   statements,   please   review   our   filings   with   the   SEC.   The   forward-- looking   statements   made   in   the   this   presentaJon   are   being   made   as   of   the   Jme   and   date   of   its   live   presentaJon.   If   reviewed   aUer   its   live   presentaJon,   this   presentaJon   may   not   contain   current   or   accurate   informaJon.   We   do   not   assume   any   obligaJon   to   update   any   forward   looking   statements   we   may  make.        In  addiJon,  any  informaJon  about  our  roadmap  outlines  our  general  product  direcJon  and  is  subject  to   change   at   any   Jme   without   noJce.   It   is   for   informaJonal   purposes   only   and   shall   not,   be   incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaJon  either  to  develop  the  features   or  funcJonality  described  or  to  include  any  such  feature  or  funcJonality  in  a  future  release.  
2  

Agenda  
· Healthcare  program  integrity    
-- High--risk  behaviors  and  acJviJes   -- Internal  and  external  monitoring  
· Splunk  for  healthcare  program  integrity    
-- Onboarding  the  data   -- Processing  &  analyzing  the  data   -- PresenJng  the  data  
· Q&A  
3  

IntroducJon  

Bharane  Balasubramanian  

Ja/nder  Sharma  

Manager   DeloiEe  &  Touche  LLP   ·Over  10  years  of   cybersecurity  experience   ·Industry:  Public  Sector   ·CerJficaJons:  CISSP,  CIPP,   CEH  and  SSCP  

Senior  Consultant     DeloiEe  &  Touche  LLP   · Over  2  years  of  
cybersecurity   experience   · Over  3  years  of  Splunk   experience   · CerJficaJons:  Splunk   CerJfied  Architect  

As used in this document, `Deloitte' means Deloitte & Touche LLP, a subsidiary of Deloitte LLP. Please see www.deloitte.com/us/about for a detailed description of the legal structure of Deloitte LLP and its subsidiaries. Certain services may not be available to attest clients under the rules and regulations of public accounting.

4  

IntroducJon  to   Program  Integrity  
5  

An  Overview  of  the  Medicaid  Program  
· Every  year,  Medicaid  covers  medical  expenses  for  more  than     57  million  beneficiaries  enrolled  in  56  States  and  territory-- administered  programs  
· According  to  the  US  Government  Accountability  Office  (GAO),  the   cost  of  this  coverage  in  2011  was  $427  billion  
· Medicaid    payments  during    2011,    including    fraud,    waste,    and     abuse,    amounted    to    $21.9    billion  
· GAO  Has  designated  Medicaid  as  a  program  that  is  at  high  risk  for   improper  payments  
Source:  CMS  Program  Integrity   h5ps://www.cms.gov/Medicare--Medicaid--Coordina>on/Fraud--Preven>on/Medicaid--Integrity--Educa>on/fwa.html  
6  

Medicaid  Fraud,  Waste,  and  Abuse  

· Wasteful,  fraudulent  and  abusive  behaviors  occur  across  HHS   programs.  These  acJons  can  be  commiEed  by  providers,  recipients   and  department  staff  alike  

· Fraud  Waste  and  Abuse  Hinder  departments  from  administering  and   delivering  program  services  that  are  integrated,  fiscally  responsible,   person--centered,  accountable  and  sustainable  

· Key  highlights  on  the  Fraud,  Waste  and  Abuse  trend:  

§ $21.9  billion  of  improper  payments  in  the  year  2011  

§ In  FY2012,  over  $4  billion  was  recovered  through  the  government's  health  care   fraud  enforcement  efforts  

§ State  governments  recovered  over  $2.9  billion  in  FY2012  and  over  $1.7  billion    

in  FY2011  

Source:  CMS  Program  Integrity  

h5ps://www.cms.gov/Medicare--Medicaid--Coordina>on/Fraud--Preven>on/Medicaid--Integrity--Educa>on/fwa.html  

7  

To  Prevent,  Predict,  Detect  &  Monitor  is  Key  

Pre--payment  
  
Improving  pre-- payment  through   beEer  rules  and   models  is  essenJal  to   reducing  overall   program  costs  

Post--payment  
  
Exploring  post--payment  
data  sJll  has  enormous   value  

Managed  care  
  
IdenJfying  Fraud,  Waste  

Fee--for--service  
  
IdenJfying  FWA  in  Fee--

and  Abuse  (FWA)  in  

For--Service  (FFS)  

managed  care  is  essenJal   claims  through  

for  states  to  beEer  

exploratory  analyJcs  is  

negoJate  capitated  rates   essenJal  to  develop  

with  Managed  Care  

new  indicators  and  

OrganizaJons  (MCO)  and   associated  new  rules  

idenJfy  fraud  not  visible  

and  models.  

to  individual  MCOs  
Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.  

8  

Building  Blocks  to     Prevent,  Predict,  Detect  &  Monitor  
Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.   9  

Use  of  Splunk  for  Near   Real--Time  DetecJon   (Pre--Payment)  
10  

ImplementaJon  of  Pre--payment  Analysis  

Locate  and  analyze  high--risk   transacJons    
Enable  cross--checking  federal   and  state  benefits  paid  to  clients  
Reduce  Jme  for  fraud  detecJon  

Benefit  correlaJon  

Business  Analy/cs/ Intelligence  

Worker  overrides   DuplicaJon  of  cases  

Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.   11  

Use  Cases  
1   · Monitor  mulJple  instances  of  the  same  case  for  the  same  individual   2   · MulJple  overrides  performed  by  a  worker   3   · Monitor  One  Time  Issuance  (OTI)  cases  amount  exceeding  the  threshold  value   4   · IdenJfy  Special  Program  Request  by  case   5   · Detect  members  of  the  same  household  receiving  the  same  benefit   6   · Skipping  over  SSN  verificaJon  needs  for  a  case  
Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.   12  

Use  Case  --  DefiniJon  

Use  case

Business  Requirement

1.  Individual  applies   · Non--ConJnuous  Eligibility  (NCE)  should  only  

frequently  for  

be  issued  in  increments  and  non--conJnuous  

benefits  or  is  

by  design.  

requesJng  

· There  should  not  be  recurring  instances  of  

retroacJve  benefits. NCEs  on  the  same  case  for  the  same  

individuals.  

Outcome
IdenJfied  a  list  of  cases  or  users   with  recurring  NCE  segments   within  a  given  Jmeframe  across   several  benefit  programs.

2.  Perform  case   overrides,  nullifying   the  system  results.

· Overrides  should  not  be  performed  excessively   Detected  cases  where  repeJJve  

as  there  may  be  limited  oversight.  

overrides  are  performed  by  a  case  

· Overrides  bypasses  the  eligibility  rules  that   worker  within  a  given  Jmeframe  

were  designed  in  the  system.  

across  several  benefit  programs.  

· Lack  of  oversight  on  overrides  may  lead  to  

benefits  provided  to  not  valid  cases.    

3.  Skip  Social  Security   Number  (SSN)   VerificaJon   requirements.

· SSN  VerificaJon  is  required  for  open--cases   IdenJfied  a  list  of  cases  where  a  

· During  certain  scenarios,  SSN  verificaJon  is  not   worker  has  used  verificaJon  code  

required.  If  this  condiJon  is  inappropriately   of  "Not  Required"  for  an  

used,  benefits  can  be  provided  to  incorrect   individual's  SSN  verificaJon  within  

individuals.

a  given  Jmeframe.  

Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.  

Use  Case  --  DefiniJon  

Use  Case 4.  One  Time  Issuances  (OTI)  by  
Case  or  by  Supervisor
5.  Special  program  requests  by   Case

Business  Requirement

Outcome

· OTIs  can  be  issued  for  any  value   Documented  a  list  of  cases  or  case  

· Agency  specifies  threshold  for  

workers  where  the  One  Time  Issuance  

review  

(OTI)  amount  exceeds  a  program  office  

· To  avoid  potenJal  fraudulent  

selected  amount  within  a  given  

transacJons,  it  is  essenJal  to  review   Jmeframe.  This  can  be  cumulaJve  across  

all  OTI  issuances  though  it's  below   cases  or  for  a  single  case.  

agency  threshold.  

· Special  program  requests  should   Provided  a  list  of  cases  where  a  Special  

not  be  performed  excessively  due   Program  Request  was  made  by  a  worker  

to  limited  oversight  

within  a  given  Jmeframe.

· Special  program  requests  bypasses  

the  tradiJonal  eligibility  rules.    

6.  Assign  Supplemental  

· Members  of  the  same  household   This  report  will  provide  a  list  of  cases  

NutriJon  Assistance  Program   receiving  heaJng  benefits  can  exist   where  the  household  members  receiving  

(SNAP)  benefits  to  individuals   as  acJve  members  on  mulJple  

heaJng  benefits  exists  as  acJve  members  

who  may  reside  in  same  

SNAP  cases  ­  Individuals  live  in   on  mulJple  (more  than  two  addiJonal)  

household  where  they  are  

same  household,  but  they  purchase   SNAP  cases.

receiving  HeaJng  Benefits.

and  prepare  food  separately  

Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.  

Challenges  

MulJple   mainframe  
servers  

Nightly   batch   for  data   extract  

Flat  file   monito
ring  

Splunk   Universal   forwarder  

Targeted   tables  in  
DB  

Splunk   heavy   forwarder  

DB   connect   App1/2  

Database   lookups  
(no   indexing)  

18  Months  of  history  data   Application  access  logs  
Mainframe  data  collection   Direct  connection  to  database   Access  rights  to  reports  and  ad--hoc  filters   Previous  days  case  action  monitoring   Integration  with  web  application  
15  

Raw  Data  ConfiguraJon  

Mainframe  Raw  Data:  

Worker  ID  

AcJon  IdenJfier  

   Regex:    

Case  ID  

Individual  ID  

^(?P<AuthorizaJon_Date>.{14})\s(?P<Case_ID>.{9})(?P<Category_Code>.{3})(?

P<Grant_Group>.{1})(?P<Program_Status_Code>.{2})(?P<Worker_ID>.{5})(?

P<Individual_ID>.{9})(?P<Benefit_Begin_Date>.{8})(?P<Benefit_End_Date>.{8})

(?P<Override_Date>.{8})(?P<Override_Reason>.{3})(?P<NoJce_OpJon>.{1})(?

P<NCE_NoJce_Reason_Code>.{3})(?P<AcJon_IdenJfier>.{4})  

  

Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.  

16  

Database  Lookup  

· Database  lookup  on  Worker  ID   Worker  ID  

  

  

  

Lookup  Name  

  

mainframe:  LOOKUP--Worker_ID  =  lookup_workerid  mainframe_WORKER_ID  AS  Worker_ID  

OUTPUTNEW  Database_WORKER  AS  DB_WORKER  

· Results  
ü 13027=  username1   Output  

Input  

  

Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.   17  

Use  Case  1:  Searches  

· Non--Con/nuous  Eligibility  (NCE)  Segments  by  Case  

  

1

2

index="mainframe"  sourcetype="mainframe"  `NCE_AcJon_IdenJfier`  |  search    $Program_Type$    

3 |  stats  count  as  nce_duplicate_program_count  by  Case_ID  |  sort  --nce_duplicate_program_count  |   where  nce_duplicate_program_count  >=  $nce_duplicate_program_count$  |  rename  Case_ID  as  

"Case  Record  No",  nce_duplicate_program_count  as  "Number  of  NCEs"   2   

· Non--Con/nuous  Eligibility  (NCE)  Segments  by  Worker  

  

1

2

index="mainframe"  sourcetype="mainframe"  `NCE_AcJon_IdenJfier`  |  search  $Program_Type$      

3 |  eval  Worker_ID  =  upper(DB_WORKER)  |  stats  count  as  nce_duplicate_program_count  by   Worker_ID  |  sort  --nce_duplicate_program_count  |  where  nce_duplicate_program_count  >=  

2 $nce_duplicate_program_count$  |  rename  Worker_ID  as  "Worker  ID",   nce_duplicate_program_count  as  "Number  of  NCEs"  

Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.   18  

Use  Case  1:  Display  Results  
1.  Filtered  case  record   number  for  acJon   idenJfier   2.  User  input  values  
3.  Results  based  on   threshold  value  
Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.  

Use  Case  2:  Inputs  

              
XML  Input:  
<input  type="radio"  searchWhenChanged="false"   token="input_report_type">  
  <label></label>       <default>Single</default>  
2 <choice  value="|  stats  sum(AMOUNT)  as  Total_Amount  by   IDN_CASE  |  where  Total_Amount  >=">Total</choice>  
<choice  value="|  table  USER_CHANGE_LAST,  AMOUNT  |  rename  
2 AMOUNT  as  Total_Amount  |  where  Total_Amount  >=">Single</ choice>    
</input>  

<input  type="radio"  searchWhenChanged="false"   token="input_report_type">     <label></label>       <default>Single</default>   <choice  value="|  stats  sum(AMOUNT)  as  Total_Amount  by   IDN_USER_CHANGE_LAST  |  where  Total_Amount   >=">Total</choice>   <choice  value="|  table  USER_CHANGE_LAST,  AMOUNT  |   rename  AMOUNT  as  Total_Amount  |  where  Total_Amount   >=">Single</choice>     </input>  

Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.   20  

Use  Case  2:  Searches  
One  Time  Issuance  (OTI)  Amount  by  Case   index=database_1  sourcetype=database_1  source="dbmon--tail://database_1/table_OTI"                               |  eval  IDN_CASE=if(len(IDN_CASE)  =  8,"0"+IDN_CASE,IDN_CASE)     1 2 $input_report_type$    $Total_Amount$     3 |  eval  Total_Amount=round(Total_Amount,2)  |  sort  --Total_Amount  |  rename  IDN_CASE  as  "Case   Record  No",  Total_Amount  as  "OTI  Amount"  
Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.   21  

Use  Case  2:  Display  Results  
Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.   22  

Use  Case  2:  Drill--Down  Details  
One  Time  Issuance  (OTI)  Amount  by  Case  ­  Drill  Down  Details  
Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.  

Use  Case  3:  Searches  

Heat  Cases  with  Mul/ple  SNAP  Cases  

1 index=database  sourcetype=database  source="dbmon--tail://database_heat"  |  rename   IDN_INDIV  as  Individual_ID  |  join  type=inner  Individual_ID  [search  index=mainframe   1 sourcetype=mainframe  Category_Code="*FS*"]  |  stats  dc(Case_ID)  as  count  by  IDN_CASE  |  
2   where  count  >  2  |  rename  IDN_CASE  as  "Heat  Case  Record  No",  count  as  "Number  of  Asso3ciated   SNAP  Cases"  

Cases  associated  to  Heat  Case  Record  Number  

2

1 index=database  sourcetype=database  IDN_ACTION=LMS  $Heat  Case  Record  No$  |  rename   IDN_INDIV  as  Individual_ID  |  join  type=inner  Individual_ID  [search  index=mainframe  

1 sourcetype=mainframe  Category_Code="*FS*"]  |  table  case_id,  worker_id,  Individual_ID  |   rename  case_id  as  "SNAP  Case  Record  No",  worker_id  as  "Worker  ID",  Individual_ID  as  

"Individual  #"  

Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.   24  

Use  Case  3:  Display  Results  
Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.   25  

Use  Case  4:  Summary  Index  

index=sat_icis  sourcetype=sat_ecis_risk_audit  source="dbmon--tail://eCIS_Database_RISK_AUDIT_SAT/V_RISK_AUDIT_SSN_MCI"  |  rename  IDN_CLIENT  as  IDN_INDIV,  

_Jme  as  Max_SSN_VerificaJon_Date      

|  join  type=inner  IDN_INDIV,  Max_SSN_VerificaJon_Date    

  [search  index=sat_icis  sourcetype=sat_ecis_risk_audit  source="dbmon--tail://eCIS_Database_RISK_AUDIT_SAT/V_RISK_AUDIT_SSN_MCI"  |  fields  source,  IDN_CLIENT,  

CDE_VERIF_SSN,  _Jme  |  rename  IDN_CLIENT  as  IDN_INDIV,  _Jme  as  SSN_VerificaJon_Date    

  |  join  type=inner  IDN_INDIV    

      [  search  index=sat_icis  sourcetype=sat_ecis_risk_audit  source="dbmon--tail://eCIS_Database_RISK_AUDIT_SAT/V_RISK_AUDIT_SSN_CASE_INDIV"  |  fields  IDN_CASE,  

IDN_INDIV    

      |  join  type=inner  IDN_CASE    

          [  search  index=sat_icis  sourcetype=sat_ecis_risk_audit  source="dbmon--tail://eCIS_Database_RISK_AUDIT_SAT/V_RISK_AUDIT_SSN_WKFLW_AUDIT"  

CDE_TRANS_AUDIT_WKFLW  =  "CC"  |  rename  _Jme  as  Case_Commit_Date  |  fields  IDN_CASE,  IDN_USER_CRTD,  CDE_TRANS_AUDIT_WKFLW,  Case_Commit_Date]]    

  |  join  type=inner  IDN_CASE    

      [search  index=sat_icis  sourcetype=sat_ecis_risk_audit  source="dbmon--tail://eCIS_Database_RISK_AUDIT_SAT/V_RISK_AUDIT_SSN_Heat"  ]    

  |  table  _Jme,  IDN_CASE,  IDN_INDIV,  IDN_USER_CRTD,  CDE_VERIF_SSN,  SSN_VerificaJon_Date,  Case_Commit_Date  |  eval  IDN_WORKER  =  upper(IDN_USER_CRTD)  |  

table  IDN_CASE,  IDN_INDIV,  IDN_WORKER,  SSN_VerificaJon_Date,  CDE_VERIF_SSN,  Case_Commit_Date  |  stats  max(SSN_VerificaJon_Date)  as  

Max_SSN_VerificaJon_Date  by  IDN_CASE,  IDN_INDIV,  IDN_WORKER,  Case_Commit_Date]  

|  dedup  IDN_CASE  IDN_INDIV    

|  rename  Max_SSN_VerificaJon_Date  as  _Jme    

|  table  _Jme,  IDN_CASE,  IDN_INDIV,  IDN_WORKER,  CDE_VERIF_SSN  

· Over  40  million  records  joins  

· Reduce  over  8  hours  to  40  minutes  

· Detects  every  update  by  a  worker    

Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.  

26     

Permissions  and  User  Access  

.shared--splunkbar--systemmenu   {    
  display:none  !important;   }   .shared--splunkbar--messages   {    
  display:none  !important;   }   .shared--splunkbar--acJvitymenu   {    
  display:none  !important;   }  

.shared--splunkbar--helpmenu   {    
  display:none  !important;   }   .shared--splunkbar--find   {    
  display:none  !important;   }   .shared--splunkbar--appmenu   {    
  display:none  !important;   }  
Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.  

Custom  App  

  
  
· User  permissions  in  Splunk   · Ad--hoc  report  list  

Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.   28  

Hide  Panels  on  Report  Load    
Click  Submit  to   show  results  
Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.  

Java  Script  to  Hide/Unhide  Panels  

require(['jquery',  'splunkjs/mvc/simplexml/ready!'],  funcJon($)   {  
  $("#search_btn").click(  funcJon()     {                 $(".dashboard--row1").css('display',  'block');                 $(".dashboard--row2").css('display',  'none');        });     $("#panel1").click(  funcJon()     {                 $(".dashboard--row2").css('display',  'block');     });   });  

Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.  

Display  Result  Count  on  Panel  
Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.  

Java  Script  to  Add  Text  and  Result  Count  

$(funcJon(){                                   $("#icis_drilldown").on("DOMNodeInserted",  funcJon(){                                                                   var  object  =  $('#icis_drilldown  .icon--export');                                                                   if(object.length  ==  1)                                                                   {                                                                                   console.log(object);                                                                                   $('#icis_drilldown').off("DOMNodeInserted");                                                                                   object.before("Export  to  Excel:  ");                                                                   }                                                                        });            });  

$(funcJon(){   $("#element1").on("DOMNodeInserted",  funcJon(){     var  object  =  $('#element1  .panel--body  .single--result');                         if(object.length  ==  1  &&  parseInt(object.text())  !=  NaN)                                                                             {                                                                                           console.log(object);                                                                                           console.log("'"+object.text()+"'");                                                                                         $('#element1').off("DOMNodeInserted");                                                                                                                                                                                                                                                                $("#icis_drilldown  .panel--head  h3").append("  --  ").append($ ("#element1  .panel--body  .single--result").text());                                                                                                   }                                                                                                });                                                                   });  
  

Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.  

Takeaways  ­  Be  Prepared  for  Changes  
ONE  SIZE  DOES  NOT  FIT  ALL  
1   MulJple  approaches  needed  to  holisJcally  evaluate  Medicaid  claims  for  FWA  
THINK  BROADLY  
2   SoUware  soluJons  alone  are  not  sufficient  to  enable  advanced  analyJc  models  
MODEL  CONTINUOUSLY  
3   ConJnuous  modeling  is  essenJal  to  eliminate  false  posiJves  and  adapt  to  emerging  trends  and  schemes  
YOU  CAN  DELEGATE  RESPONSIBILITY,  BUT  NOT  ACCOUNTABILITY  
4   Managed  care  does  not  obviate  the  need  to  idenJfy  fraud  or  its  cost  may  be  passed  along  
INTEGRATE  DUE  DILIGENCE  
5   Strong  models  and  rules  can  be  developed  by  tesJng  and  validaJng  hypotheses  using  due  diligence  techniques  
Copyright  ©  2015  DeloiEe  Development  LLC.  All  rights  reserved.   33  

QuesJons?  
34  

This presentation contains general information only and Deloitte is not, by means of this presentation, rendering accounting, business, financial, investment, legal, tax, or other professional advice or services. This presentation is not a substitute for such professional advice or services, nor should it be used as a basis for any decision or action that may affect your business. Before making any decision or taking any action that may affect your
   business, you should consult a qualified professional advisor.   
Deloitte shall not be responsible for any loss sustained by any person who relies on this
presentation.   
35  

THANK  YOU  

