Copyright  ©  2015  Splunk  Inc.  
Predict,  Alert,  Manage,   and  OpDmize  an   Ecosystem  with  Splunk  
Tom  Twait  &  Chris  Hogan   Cerner  
EDI  Manager,  Sr.  EDI  SoluDon  Architect  
     

Disclaimer  
· During  the  course  of  this  presentaDon,  we  may  make  forward  looking  statements  regarding   future  events  or  the  expected  performance  of  the  company.  We  cauDon  you  that  such   statements  reflect  our  current  expectaDons  and  esDmates  based  on  factors  currently  known  to   us  and  that  actual  events  or  results  could  differ  materially.  For  important  factors  that  may  cause   actual  results  to  differ  from  those  contained  in  our  forward--looking  statements,  please  review   our  filings  with  the  SEC.  The  forward--looking  statements  made  in  the  this  presentaDon  are  being   made  as  of  the  Dme  and  date  of  its  live  presentaDon.  If  reviewed  aTer  its  live  presentaDon,  this   presentaDon  may  not  contain  current  or  accurate  informaDon.  We  do  not  assume  any  obligaDon   to  update  any  forward  looking  statements  we  may  make.    
· In  addiDon,  any  informaDon  about  our  roadmap  outlines  our  general  product  direcDon  and  is   subject  to  change  at  any  Dme  without  noDce.  It  is  for  informaDonal  purposes  only  and  shall  not,   be  incorporated  into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaDon  either   to  develop  the  features  or  funcDonality  described  or  to  include  any  such  feature  or  funcDonality   in  a  future  release.  

Tom  Twait  
· Manager,  EDI  Services   · 13  Years  @  Cerner   · University  of  Iowa  

Speakers  
Chris  Hogan  
· Sr  SoluDon  Architect,  EDI  Services   · 4  Years  @  Cerner   · University  of  Missouri   · Rockhurst  University  (MBA)  

Who  is  Cerner?  
One  of  the  largest  healthcare  soTware  IT  companies  in  the  world   · >  $3B+  Annual  Revenue   · Publicly  traded  (NASDAQ)  with  20+  years  of  20%  compounded  annual  growth   · 22,000+  Associates  in  more  than  30  countries   · Industry  Leader  and  Innovator  in  Clinical,  Revenue  Cycle  and  PopulaDon  Health  SoluDons    

What  Do  Tom  and  Chris  Do?  

Transac1on  Services  (EDI)  

· Address  ValidaDon   · Address  VerificaDon     · Claims  Scrubbing   · Contract  Management  

· Credit  Card  Processing   · Medical  Necessity  Checks   · Real--Dme  Eligibility  Checks   · Etc...  

Cerner  Transac*on  Services  Processes  >300M     Transac*ons  Annually  

Complex  ConnecDons  

Problem  Statement  

System  

Users  

· Reduce  DownDme   · Developer  Access  to  Logs   · More  Reliable/Predictable  System   · OTen  ReacDve,  Not  ProacDve   · Data  Blind  to  Real--Time  Issues  

· Access  to  Data   · Less  ad--hoc  requests  to  analysts   · Limited  OperaDonal  ReporDng  
· Slowing  Moving  Process  Improvement   IniDaDves  
· Minimal  Visibility  for  OperaDons   Team  when  System  Issues  Arose  
· Cumbersome  process  to  analyze  data  

AnalyDcs  Ecosystem  at  Cerner  
TransacDonal  ReporDng  
Source  System   ApplicaDon  Monitoring  

AnalyDcs  Ecosystem  

TransacDonal  ReporDng  

TransacDonal  ReporDng  

TransacDonal  ReporDng  

AnalyDcs  Ecosystem  

Websphere  ApplicaDon  Server  

Websphere  ApplicaDon  Server  

Websphere  ApplicaDon  Server  

AnalyDcs  Ecosystem  

Millennium  

Millennium  

AnalyDcs  Ecosystem  at  Cerner  
TransacDonal  ReporDng  
Source  System   ApplicaDon  Monitoring  

AnalyDcs  In  AcDon  ­  Examples  Using  the  Ecosystem   InformaDon  
· OperaDons  
­ Monitor  partner  connecDvity  and  alert  OperaDons  staff  in  the  event   monitoring  thresholds  are  breached  
· ConsulDng  
­ Pinpoint  key  issues  and  trends  to  opDmize  and  improve  system  performance  
· IP/Engineering  
­ Validate  WebSphere  health  and  idenDfy  potenDal  issues  
· ExecuDve  Team  
­ Produce  on--Dme  reports  for  analysis  without  engaging  Architects  and   Business  analysts  

AnalyDcs  In  AcDon  ­  Examples  Using  the  Ecosystem   InformaDon  
"  Alert,  Report  and  Monitor  System  Issues!!!  
­ Find  acDonable  insights  to  resolve  those  issues  in  a  proacDve  fashion!  
"  Monitor,  Evaluate  and  InvesDgate  Individual  Services  and  SoluDons  
­ Monitor  health  of  Claim  Scrubbing  Systems   ­ Monitor  Real  Time  Eligibility  Processing   ­ Monitor  Credit  Card  Processing   ­ Plus,  Measure  and  Monitor  any  Service  or  SoluDon  running  via  EDI  
TransacDon  Services  

Claims  Scrubbing  

index=tx_detail* sourcetype=clmscrub

| fillnull

| stats dc(GROUP_ID) as count by SUBMITTER_ID CLAIM_ERROR_IND

| eval errClaims = if(CLAIM_ERROR_IND==1, count, null)

| eval cleanClaims = if(CLAIM_ERROR_IND==0, count, null)

| stats sum(cleanClaims) as cleanClaims

sum(errClaims) as errClaims

sum(count)

as allClaims by SUBMITTER_ID

| fillnull

| eval "cleanRate%"=round(cleanClaims/(cleanClaims+errClaims) * 100, 2)

| table SUBMITTER_ID allClaims cleanClaims errClaims "cleanRate%"

| sort -"cleanRate%"

| where isnotnull(SUBMITTER_ID)

| table SUBMITTER_ID allClaims cleanClaims errClaims "cleanRate%"

| addcoltotals allClaims

cleanClaims

errClaims

labelfield=SUBMITTER_ID

label="--TOTALS--"

| eval cleanClaims = tostring(cleanClaims, "commas")

| eval errClaims = tostring(errClaims, "commas")

| eval allClaims = tostring(allClaims, "commas")

Real--Time  Eligibility  Processing  

Real--Time  Eligibility  Processing  
searchTemplate:   index=tx_detail*  sourcetype=elig   |  stats  dc(PARTNER_REQEST_ID)  as  PARTNER_REQUESTS  dc(PARTNER_RESPONSE)  as  PARTNER_RESPONSES  by  PARTNER   |  eval  PartnerResponsePercent  =  round(PARTNER_RESPONSES  /  PARTNER_REQUESTS  *  100,  2)      searchPostProcess   |  where  PARTNER  =  "Partner  N"  |  table  PartnerResponsePercent  

Real--Time  Eligibility  AlerDng  

Credit  Card  Processing  

Websphere  

System  

Users  

· We've  shown  CTS  dashboards,   what  does  websphere  look  like   and  how  do  we  use  it  to  obtain  a   posiDve  outcome?  

· Easy  Access  to  Data   · Fewer  ad--hoc  Requests  for  Analysts  
· Easier  ImplementaDon  of  Process   Improvement  IniDaDves  
· Visibility  for  OperaDons,  ConsulDng,   IP,  ExecuDves  

Websphere  Monitoring  

Outcomes  

System  

Users  

· DownDme  ReducDon   · Developer  Access  to  Logs   · More  Reliable/Predictable  System   · ProacDve  Monitoring/AlerDng  
and  Support   · Visibility  to  Real--Time  Events  

· Easy  Access  to  Data   · Less  ad--hoc  requests  for  analysts  
· Easier  ImplementaDon  of  Process   Improvement  IniDaDves  
· Visibility  for  OperaDons  /  ConsulDng  /   IP  /  ExecuDves  

PosiDve  Impacts  for  End--Users  
· Business  Analysts  ­  Analyze  data  faster  with  improved  business  insights  
· OperaDons  ­  ProacDvely  monitor  system  performance  and  prevent   unwanted  system  events  
· IP/Engineering  ­  Analyze/idenDfy/resolve  system  issues  faster  than  ever  
· Consultants  ­  OpDmize  system  configuraDons  for  improved  client  outcomes  
· ExecuDve  Team  ­  Able  to  create  customized,  data--driven,  on--demand   reports  

Next  Steps  
TradiDSopnlauln  SkIE   M  
· Build  external  views  for  dashboards,  reports  and  alerDng   · Add  addiDonal  transacDons   · Focus  on  external  data  sets,  not  naDve  to  our  core  Financial  Hub  
34  

"Don't  believe  everything   you  read  on  the  Internet  
just  because  there's  a   picture  with  a  quote  next  
to  it"  
          --Abraham  Lincoln  

©  Cerner  CorporaDon.    All  rights  reserved.    This  document  contains  Cerner  confidenDal  and/or  proprietary  informaDon  belonging  to  Cerner  CorporaDon  and/or  its  related  affiliates  which  may  not  be  reproduced  or  transmived  in  any  form  or  by  any  means  without  the  express  wriven  consent  of  Cerner.    

35  

QUESTIONS?     

"  

    

©  Cerner  CorporaDon.    All  rights  reserved.    This  document  contains  Cerner  confidenDal  and/or  proprietary  informaDon  belonging  to  Cerner  CorporaDon  and/or  its  related  affiliates  which  may  not  be  reproduced  or  transmived  in  any  form  or  by  any  means  without  the  express  wriven  consent  of  Cerner.    

"  
36  

