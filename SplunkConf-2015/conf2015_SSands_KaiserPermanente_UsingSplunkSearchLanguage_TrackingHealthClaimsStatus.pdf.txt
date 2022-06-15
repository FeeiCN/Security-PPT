Copyright  ©  2015  Splunk  Inc.  
Tracking  Health  Claims  Status   Across  Mul7ple  Formats,   Forms,  Systems,  and  Pla>orms     (and  not  losing  any!)     
Stuart  Sands  
Principal  Systems  Architect,   Kaiser  Permanente  

Disclaimer  
During  the  course  of  this  presentaFon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauFon  you  that  such  statements  reflect  our   current  expectaFons  and  esFmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaFon  are  being  made  as  of  the  Fme  and  date  of  its  live   presentaFon.  If  reviewed  aSer  its  live  presentaFon,  this  presentaFon  may  not  contain  current  or   accurate  informaFon.  We  do  not  assume  any  obligaFon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiFon,  any  informaFon  about  our  roadmap  outlines  our  general  product  direcFon  and  is  subject  to   change  at  any  Fme  without  noFce.  It  is  for  informaFonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaFon  either  to  develop  the  features  
or  funcFonality  described  or  to  include  any  such  feature  or  funcFonality  in  a  future  release.  
2  

Agenda  
 Landscape  &  Context    The  Challenge    The  SoluFon    Outcomes    Next  Steps    Best  PracFces    Summary  and  follow--up  

About  Kaiser  Permanente  

Members   10.1  million  
7  
Geographic  Regions  

Medical  Facili7es  &  Staff   38  
Hospitals  
619    
Medical  Offices  &  OutpaFent    FaciliFes  
17,791    
Physicians  

Employees  
177,445  
Technical,  administraFve   and  clerical  employees  
and  caregivers     
   >6,000  in  IT!

49,978  
Nurses  
...and  a  LARGE  variety  of  systems!  
As  of  July  2015.  See  more  at:  hhp://share.kaiserpermanente.org/arFcle/fast--facts--about--kaiser--permanente/#sthash.bCVxveEQ.dpuf   ©  2015  

Claims  AdjudicaFon:  High  Level  

10,000,000  claims  processed  daily  (and  growing!)  

Submit  Claim  

Validate  Claim  
Structural  ValidaFon  
Logical  ValidaFon   Acknowledgements  
Scan  Links  

Adjudicate  Claim  

Health  plan  specifics  

AuthorizaFons  to  perform  care  

  

Care  rendered  

   DeducFbles,  accumulaFons,  and  

out--of--pocket  

Other  coverage  (e.g.,  spouse)  

...AND  A  LOT  MORE  COMPLEXITY  

Pay  Claim  

Claims  AdjudicaFon:  The  Reality  

Submit  Claim  
Internal  Systems   MulFple  Claim  Formats  
Contracted  Partners  

Process  Claim  
Valida7on  
Format  ValidaFon   Logic  ValidaFon  
Scan  Links   Acknowledgements  
Ini7al  fo  cus  area     

Pay  Claim  

External  Providers  

Adjudica7on  

2015  Policy  Change  

All  claims  must  route  through  NaFonal  EDI  for  input  into  adjudicaFon  system  

Before  
· NaFonal  EDI  only  handles  external  claims   · No  visibility  tracking  claims  across  systems   · Transfers  within  KP  and  with  external  vendors   · No  easy  direct  reconciliaFon/tracking  system     · PotenFal  for  unhappy  providers  and  members   · Risk  of  federal  penalFes  for  late  processing  
  

AHer  
· NaFonal  EDI  handles  ALL  claims   · Must  implement  enterprise--wide  claims  
adjudicaFon  system   · Volume  jumps  2,250%   · YIKES!!!  

Challenges  
 Need  visibility  at  claim  and  file  level:  
­ Where  is  it?   ­ Why  is  it  there?   ­ Is  it  late?   ­ Excessive  "bad"  claims  in  the  file?  
 Need  alerts  for  "stuck"  claims/files  to  avoid  penalFes  for  delays    No  knowledge  on  log  file  content    No  Fme  for  huge  development  effort  or  impossible  changes      

SoluFon:  Feed  Text  Files  into  Splunk  

FormaLed  text  files  

X12  837  I/ D/P  

X12  270  

X12  837  I/ D/P  
X12  837  I/ D/P  

X12  276  

X12  837  I/ D/P  

X12  837  I/ D/P  

X12  270  

X12  837  I/ D/P  

X12  276  

Ques7ons  Answered  
Loca7on  of  every  claim   and  its  file  loca7on  
Where  and  when  claim   was  processed  
Claims  processing  slowly  
Addi7onal  processing   metrics  

ExisFng  Architecture  
KP  Firewall  

DMZ  

Internal  Trading   Partners  

External  Trading   Partners  

NEDI   Server  

(1)  837D/I/P  

Mainframe  

(2)  837D/I/P  

(5)  835  

(3)  CFF  

(4)  EOP  
KPEG  Server  

ApplicaFon  Server   ApplicaFon  Server   ApplicaFon  Server   ApplicaFon  Server  

KP  Firewall   DMZ  
Forwarder  
NEDI   Server  

Splunk  Placement  

Mainframe  
Forwarder  

Cloud  Server  
Indexer/Search  Head  

1.X12  Files  uploaded  to   Splunk  Indexer  and   displayed  online  
2.Queries  for  file  counts  for   each  file  type  received  
3.Alerts  created  for  missing   files  and  lengthy   processing  

KPEG  Server  

Dashboard  Snapshot  

Dashboard  Snapshot  

Tracking  Claims  in  Files  

Alerts  Create   Service  Ticket  

What's  Next?  
 Improved  dashboard    
­ Add  Biggest  Offenders  list   ­ Create  Tivoli  Fckets/  emails  
 Extend  further  along  the  claims  lifecycle  
­ Scan/OCR  intake   ­ Send/return  from  adjudicator   ­ Financial  transacFons  and  EOB  statements  
 Business  ops  and  technical  ops  dashboards  

Best  PracFces  
 Follow  known  good  development  pracFces:  
­ SMEs   ­ Use  cases   ­ Early  IT  collaboraFon  
 Security  at  the  beginning  (HIPAA  --  PHI)    Include  machine  and  app  name    Use  UTC    POC  and  iterate    More  Data!    Share  the  data  
­ Fraud  and  Abuse   ­ Security  

Summary  and  Follow--up  
 Summary    Contact  Info:  
Stuart  Sands   Stuart.H.Sands@KP.org  

THANK  YOU  

