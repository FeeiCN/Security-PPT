Copyright  ©  2015  Splunk  Inc.  
Breach  Management  in   Enterprise  Security!  
Brian  Luger  
So<ware  Engineer,  Splunk  

Disclaimer  
During  the  course  of  this  presentaFon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauFon  you  that  such  statements  reflect  our   current  expectaFons  and  esFmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaFon  are  being  made  as  of  the  Fme  and  date  of  its  live   presentaFon.  If  reviewed  a<er  its  live  presentaFon,  this  presentaFon  may  not  contain  current  or   accurate  informaFon.  We  do  not  assume  any  obligaFon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiFon,  any  informaFon  about  our  roadmap  outlines  our  general  product  direcFon  and  is  subject  to   change  at  any  Fme  without  noFce.  It  is  for  informaFonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaFon  either  to  develop  the  features  
or  funcFonality  described  or  to  include  any  such  feature  or  funcFonality  in  a  future  release.  
2  

What  is  Breach  Management?  
3  

Well...  What's  a  Breach?  
4  

Well...  What's  a  Breach?  
Having  one  or  more  assets  compromised  by  a  threat  actor  that  has       targeted  the  organiza5on  in  an  a6empt  carry  out  a  specific  intent.  
5  

Breach  Management  
6  

Breach  Management  
7  

Breach  Management  
8  

Breach  Management  
9  

Breach  Management  
10  

Breach  Management  
11  

Breach  Management  
12  

Breach  Management  
13  

Breach  Management  
14  

Breach  Management  
15  

What  Breach  Management  Is  NOT  
16  

What  Breach  Management  Is  NOT  
17  

What  Breach  Management  Is  NOT  
18  

What  Breach  Management  Is  NOT  
19  

What  Breach  Management  Is  NOT  
20  

Breach  Management  can  be  Difficult  
Compromised  Assets   Compromised  IdenFFes   A`acker  Infrastructure  
AcFons  on  Intent   RemediaFon   Post--RemediaFon  
21  

Breach  Management  can  be  Difficult  
Compromised  Assets   Compromised  IdenFFes   A`acker  Infrastructure/Intelligence   AcFons  on  Intent   RemediaFon  
Post--RemediaFon  
22  

Breach  Management  can  be  Difficult  
Compromised  Assets   Compromised  IdenFFes   A`acker  Infrastructure/Intelligence   AcFons  on  Intent   RemediaFon   Post--RemediaFon  
23  

Breach  Management  can  be  Difficult  
Compromised  Assets   Compromised  IdenFFes   A`acker  Infrastructure/Intelligence   AcFons  on  Intent   RemediaFon   Post--RemediaFon  
24  

Breach  Management  can  be  Difficult  
Compromised  Assets   Compromised  IdenFFes   A`acker  Infrastructure/Intelligence   AcFons  on  Intent   RemediaFon   Post--RemediaFon  
25  

Breach  Management  can  be  Difficult  
Compromised  Assets   Compromised  IdenFFes   A`acker  Infrastructure/Intelligence   AcFons  on  Intent   RemediaFon   Post--RemediaFon  
26  

Breach  Management  can  be  Difficult  
Compromised  Assets   Compromised  IdenFFes   A`acker  Infrastructure/Intelligence   AcFons  on  Intent   RemediaFon  
Post--RemediaFon  
27  

Compromised  Assets  &  IdenFFes  
IniFal  /  Last  Known  AcFvity  Time   Domains  /  Hostnames  /  IPs  /  LocaFon   Malware  /  PUPs  /  Tools  /  TTPs  
Usernames  /  Domains  /  Emails  /  LocaFon   Analyst  Notes  
28  

Compromised  Assets  &  IdenFFes  
IniFal  /  Last  Known  AcFvity  Time  
Domains  /  Hostnames  /  IPs  /  LocaFon   Malware  /  PUPs  /  Tools  /  TTPs   Usernames  /  Domains  /  Emails  /  LocaFon   Analyst  Notes  
29  

Compromised  Assets  &  IdenFFes  
IniFal  /  Last  Known  AcFvity  Time   Domains  /  Hostnames  /  IPs  /  LocaFon  
Malware  /  PUPs  /  Tools  /  TTPs   Usernames  /  Domains  /  Emails  /  LocaFon   Analyst  Notes  
30  

Compromised  Assets  &  IdenFFes  
IniFal  /  Last  Known  AcFvity  Time   Domains  /  Hostnames  /  IPs  /  LocaFon   Malware  /  PUPs  /  Tools  /  TTPs  
Usernames  /  Domains  /  Emails  /  LocaFon   Analyst  Notes  
31  

Compromised  Assets  &  IdenFFes  
IniFal  /  Last  Known  AcFvity  Time   Domains  /  Hostnames  /  IPs  /  LocaFon   Malware  /  PUPs  /  Tools  /  TTPs   Usernames  /  Domains  /  Emails  /  LocaFon   Analyst  Notes  
32  

Compromised  Assets  &  IdenFFes  
IniFal  /  Last  Known  AcFvity  Time   Domains  /  Hostnames  /  IPs  /  LocaFon   Malware  /  PUPs  /  Tools  /  TTPs   Usernames  /  Domains  /  Emails  /  LocaFon  
Analyst  Notes  
33  

ES  Assets  &  IdenFFes  Framework  
34  

ES  Assets  &  IdenFFes  Framework  
35  

ES  Assets  &  IdenFFes  Framework  
36  

A`acker  Infrastructure  &  Intelligence  
Command  &  Control  (C2)  Servers   Hop  Points   Domains   Watering  Holes   Exploit  Kits  /  Phishing  Sites  
Endpoint  Intelligence  &  TTPs  
37  

A`acker  Infrastructure  &  Intelligence  
Command  &  Control  (C2)  Servers   Hop  Points   Domains   Watering  Holes   Exploit  Kits  /  Phishing  Sites  
Endpoint  Intelligence  &  TTPs  
38  

A`acker  Infrastructure  &  Intelligence  
Command  &  Control  (C2)  Servers   Hop  Points   Domains   Watering  Holes   Exploit  Kits  /  Phishing  Sites   Endpoint  Intelligence  &  TTPs  
39  

A`acker  Infrastructure  &  Intelligence  
Command  &  Control  (C2)  Servers   Hop  Points   Domains   Watering  Holes   Exploit  Kits  /  Phishing  Sites   Endpoint  Intelligence  &  TTPs  
40  

A`acker  Infrastructure  &  Intelligence  
Command  &  Control  (C2)  Servers   Hop  Points   Domains   Watering  Holes   Exploit  Kits  /  Phishing  Sites   Endpoint  Intelligence  &  TTPs  
41  

A`acker  Infrastructure  &  Intelligence  
Command  &  Control  (C2)  Servers   Hop  Points   Domains   Watering  Holes   Exploit  Kits  /  Phishing  Sites   Endpoint  Intelligence  &  TTPs  
42  

A`acker  Infrastructure  &  Intelligence  
Command  &  Control  (C2)  Servers   Hop  Points   Domains   Watering  Holes   Exploit  Kits  /  Phishing  Sites  
Endpoint  Intelligence  &  TTPs  
43  

ES  Threat  Intelligence  Framework  
44  

ES  Threat  Intelligence  Framework  
45  

ES  Threat  Intelligence  Framework  
46  

AcFons  on  Intent  
PII  The<   Intellectual  Property  The<  
Financial  Data  The<   PoliFcal/Corporate  MoFves   Control  System  Tampering  
47  

AcFons  on  Intent  
PII  The<   Intellectual  Property  The<   Financial  Data  The<   PoliFcal/Corporate  MoFves  
Control  System  Tampering  
48  

AcFons  on  Intent  
PII  The<   Intellectual  Property  The<   Financial  Data  The<   PoliFcal/Corporate  MoFves   Control  System  Tampering  
49  

AcFons  on  Intent  
PII  The<   Intellectual  Property  The<   Financial  Data  The<   PoliFcal/Corporate  MoFves   Control  System  Tampering  
50  

AcFons  on  Intent  
PII  The<   Intellectual  Property  The<   Financial  Data  The<   PoliFcal/Corporate  MoFves   Control  System  Tampering  
51  

AcFons  on  Intent  
PII  The<   Intellectual  Property  The<   Financial  Data  The<   PoliFcal/Corporate  MoFves  
Control  System  Tampering  
52  

ES  &  AcFon  on  Intent  
53  

RemediaFon  
Scope  the  Compromise   Devise  a  RemediaFon  Strategy   Track  RemediaFon  Progress   Monitor  for  Post--RemediaFon  Compromises   Construct  a  Breach  Report  
54  

RemediaFon  
Scope  the  Compromise  
Devise  a  RemediaFon  Strategy   Track  RemediaFon  Progress   Monitor  for  Post--RemediaFon  Compromises   Construct  a  Breach  Report  
55  

RemediaFon  
Scope  the  Compromise   Devise  a  RemediaFon  Strategy  
Track  RemediaFon  Progress   Monitor  for  Post--RemediaFon  Compromises   Construct  a  Breach  Report  
56  

RemediaFon  
Scope  the  Compromise   Devise  a  RemediaFon  Strategy   Track  RemediaFon  Progress  
Monitor  for  Post--RemediaFon  Compromises   Construct  a  Breach  Report  
57  

RemediaFon  
Scope  the  Compromise   Devise  a  RemediaFon  Strategy   Track  RemediaFon  Progress   Monitor  for  Post--RemediaFon  Compromises   Construct  a  Breach  Report  
58  

RemediaFon  
Scope  the  Compromise   Devise  a  RemediaFon  Strategy   Track  RemediaFon  Progress   Monitor  for  Post--RemediaFon  Compromises  
Construct  a  Breach  Report  
59  

ES  Incident  Review  
60  

ES  Incident  Review  
61  

ES  Incident  Review  
62  

ES  InvesFgator  Timeline  
63  

Splunk  Enterprise  Security  
64  

Splunk  Enterprise  Security  
65  

Splunk  Enterprise  Security  
66  

Splunk  Enterprise  Security  
67  

Splunk  Enterprise  Security  
68  

Splunk  Enterprise  Security  
69  

Splunk  Enterprise  Security  
70  

Just  Detected  a  Breach,  Now  What?    
Asset/IdenFty  Framework   Integrated  Endpoint/Network  Security  Apps   Built  in  Threat  Intelligence  Framework   Incident  Review  Framework   Risk  Scoring  Framework   ...  
71  

Just  Detected  a  Breach,  Now  What?    
Asset/IdenFty  Framework   Integrated  Endpoint/Network  Security  Apps   Built  in  Threat  Intelligence  Framework   Incident  Review  Framework   Risk  Scoring  Framework   ...  
72  

ES  Breach  Management  App  
Asset/IdenFty  Framework   Threat  Intelligence  Framework   Incident  Review  
InvesFgaFve  Timeline  
73  

ES  Breach  Management  App  
Asset/IdenFty  Framework  
Threat  Intelligence  Framework   Incident  Review   InvesFgaFve  Timeline  
74  

ES  Breach  Management  App  
Asset/IdenFty  Framework   Threat  Intelligence  Framework   Incident  Review   InvesFgaFve  Timeline  
75  

ES  Breach  Management  App  
Asset/IdenFty  Framework   Threat  Intelligence  Framework   Incident  Review   InvesFgaFve  Timeline  
76  

ES  Breach  Management  App  
Asset/IdenFty  Framework   Threat  Intelligence  Framework   Incident  Review  
InvesFgaFve  Timeline  
77  

Track  Compromised  Assets/IdenFFes  
Enriched  Asset/IdenFFes   IniFal/Last  Known  AcFvity  Tracking   Asset/IdenFty  Timeline  Drilldown   Malicious  AcFvity  Tracking  
Post  RemediaFon  Tracking  
78  

Track  Compromised  Assets/IdenFFes  
Enriched  Asset/IdenFFes  
IniFal/Last  Known  AcFvity  Tracking   Asset/IdenFty  Timeline  Drilldown   Malicious  AcFvity  Tracking   Post  RemediaFon  Tracking  
79  

Track  Compromised  Assets/IdenFFes  
Enriched  Asset/IdenFFes   IniFal/Last  Known  AcFvity  Tracking  
Asset/IdenFty  Timeline  Drilldown   Malicious  AcFvity  Tracking   Post  RemediaFon  Tracking  
80  

Track  Compromised  Assets/IdenFFes  
Enriched  Asset/IdenFFes   IniFal/Last  Known  AcFvity  Tracking   Asset/IdenFty  Timeline  Drilldown   Malicious  AcFvity  Tracking   Post  RemediaFon  Tracking  
81  

Track  Compromised  Assets/IdenFFes  
Enriched  Asset/IdenFFes   IniFal/Last  Known  AcFvity  Tracking   Asset/IdenFty  Timeline  Drilldown   Malicious  AcFvity  Tracking   Post  RemediaFon  Tracking  
82  

Track  Compromised  Assets/IdenFFes  
Enriched  Asset/IdenFFes   IniFal/Last  Known  AcFvity  Tracking   Asset/IdenFty  Timeline  Drilldown   Malicious  AcFvity  Tracking  
Post  RemediaFon  Tracking  
83  

Track  A`acker  Infrastructure/Intelligence  
Threat  owned,  associated  IPs/NDeotwmoraki  Innste/lUligReLncse     
Endpoint  Intelligence  
Endpoint  Threat  Intel  Tracking  
IniFal/Last  Know  AcFvity  Times  
IniFal  and  last  known  acFvity  tracking.  
TTPs  
Integrated  with  ES  Threat  Intelligence  Framework  
AutomaFcally  Pushed  to  ES  Threat  Intel  Framework  
84  

Track  A`acker  Infrastructure/Intelligence  
Threat  owned,  associateNde  ItPwso/rDko  Inmtealilingse/nUceR  Ls  
Endpoint  Intelligence  
Endpoint  Threat  Intel  Tracking  
IniFal/Last  Know  AcFvity  Times  
IniFal  and  last  known  acFvity  tracking.  
TTPs  
Integrated  with  ES  Threat  Intelligence  Framework  
AutomaFcally  Pushed  to  ES  Threat  Intel  Framework  
85  

Track  A`acker  Infrastructure/Intelligence  
Threat  owned,  associateNde  ItPwso/rDko  Inmtealilingse/nUceR  Ls  
Endpoint  Intelligence  
Endpoint  Threat  Intel  Tracking  
IniFal/Last  Know  AcFvity  Times  
IniFal  and  last  known  acFvity  tracking.  
TTPs  
Integrated  with  ES  Threat  Intelligence  Framework  
AutomaFcally  Pushed  to  ES  Threat  Intel  Framework  
86  

Track  A`acker  Infrastructure/Intelligence  
Threat  owned,  associateNde  ItPwso/rDko  Inmtealilingse/nUceR  Ls  
Endpoint  Intelligence  
Endpoint  Threat  Intel  Tracking  
IniFal/Last  Know  AcFvity  Times  
IniFal  and  last  known  acFvity  tracking.  
TTPs  
Integrated  with  ES  Threat  IntelligAuetnomceaF  Fcarlalym  Pueshwedo  trok  E  S  Threat  Intel  
Framework  
87  

Track  A`acker  Infrastructure/Intelligence  
Threat  owned,  associateNde  ItPwso/rDko  Inmtealilingse/nUceR  Ls  
Endpoint  Intelligence  
Endpoint  Threat  Intel  Tracking  
IniFal/Last  Know  AcFvity  Times  
IniFal  and  last  known  acFvity  tracking.  
TTPs  
Integrated  with  ES  Threat  Intelligence  Framework  
AutomaFcally  Pushed  to  ES  Threat  Intel  Framework  
88  

Track  A`acker  Infrastructure/Intelligence  
Threat  owned,  associateNde  ItPwso/rDko  Inmtealilingse/nUceR  Ls  
Endpoint  Intelligence  
Endpoint  Threat  Intel  Tracking  
IniFal/Last  Know  AcFvity  Times  
IniFal  and  last  known  acFvity  tracking.  
TTPs  
Integrated  with  ES  ThreaAtu  ItnotmeallFigcealnlyc e Pu  Fsrhaemd e tow  EoSr  Tkh   reat  Intel  Framework  
89  

Analyst  Assignment  
Add  Analysts  to  a  Breach   Track  Amount  of  Work  Performed   Annotate  Breaches  
Fully  Integrated  with  InvesFgaFve   Timeline  
90  

Analyst  Assignment  
Add  Analysts  to  a  Breach  
Track  Amount  of  Work  Performed   Annotate  Breaches   Fully  Integrated  with  InvesFgaFve  Timeline  
91  

Analyst  Assignment  
Add  Analysts  to  a  Breach   Track  Amount  of  Work  Performed  
Annotate  Breaches   Fully  Integrated  with  InvesFgaFve   Timeline  
92  

Analyst  Assignment  
Add  Analysts  to  a  Breach   Track  Amount  of  Work  Performed   Annotate  Breaches  
Fully  Integrated  with  InvesFgaFve  Timeline  
93  

Analyst  Assignment  
Add  Analysts  to  a  Breach   Track  Amount  of  Work  Performed   Annotate  Breaches  
Fully  Integrated  with  InvesFgaFve  Timeline  
94  

Track  RemediaFon  Progress  
Overall  RemediaFonA  Psrsoetgsr  ess  
IdenFFes  
Remediated  Assets/IdenFFes  
RemediaFon  Metrics  
Post--RemediaFon  CoPmospt-r-Roemmiesdeisa F  on  Compromises  
95  

Track  RemediaFon  Progress  
Overall  RemediaFoAnss  Pertosg   ress  
IdenFFes  
Remediated  Assets/IdenFFes  
RemediaFon  Metrics  
Post--RemediaFon  CoPmospt-r-RoemmiesdeisaF   on  Compromises  
96  

Track  RemediaFon  Progress  
Overall  RemediaFoAnss  Pertosg   ress   IdenFFes  
Remediated  Assets/IdenFFes  
RemediaFon  Metrics  
Post--RemediaFon  ComPposrto--RmemiseedisaF   on  Compromises  
97  

Track  RemediaFon  Progress  
Overall  RemediaFoAnss  Pertosg   ress   IdenFFes  
Remediated  Assets/IdenFFes   RemediaFon  Metrics  
Post--RemediaFon  ComPopstr-o-Rmemiseedisa F  on  Compromises  
98  

Track  RemediaFon  Progress  
Overall  RemediaFoAnss  Pertosg   ress   IdenFFes  
Remediated  Assets/IdenFFes   RemediaFon  Metrics  
Post--RemediaFonP  Coosmt--pRreommeidseiasF   on  Compromises  
99  

Takeaways  

One--Stop  Breach  Management  SoluFon   Compromised  Asset/IdenFty  Tracking  

Compromised  Asset/IdenFty  Tracking  

Asset/IdenFty  Specific  Timeline  Drilldowns  

Asset/IdenFty  Specific  Timeline  Drilldowns   Threat  Infrastructure  Tracking  

Threat  Infrastructure  Tracking  

RemediaFon  Tracking  

RemediaFon  Tracking  

One--Stop  Breach  Management  SoluFon  

Complete  IntegraFon  with  Enterprise  SecurCitoy  m4.0p   lete  IntegraFon  with  Enterprise  Security  4.0  

100  

Takeaways  

One--Stop  Breach  Management  SoluCFoonm   promised  Asset/IdenFty  Tracking  

Compromised  Asset/IdenFty  Tracking  

Asset/IdenFty  Specific  Timeline  Drilldowns  

Asset/IdenFty  Specific  Timeline  Drilldowns   Threat  Infrastructure  Tracking  

Threat  Infrastructure  Tracking  

RemediaFon  Tracking  

RemediaFon  Tracking  

One--Stop  Breach  Management  SoluFon  

Complete  IntegraFon  with  Enterprise  SecurCitoy m 4.0p  lete  IntegraFon  with  Enterprise  Security  4.0  

101  

Takeaways  

One--Stop  Breach  Management  SoluCFoonm   promised  Asset/IdenFty  Tracking  

Compromised  Asset/IdenFty  Tracking   Asset/IdenFty  Specific  Timeline  Drilldowns  

Asset/IdenFty  Specific  Timeline  Drilldowns   Threat  Infrastructure  Tracking  

Threat  Infrastructure  Tracking  

RemediaFon  Tracking  

RemediaFon  Tracking  

One--Stop  Breach  Management  SoluFon  

Complete  IntegraFon  with  Enterprise  SecurCitoym  4.p0l  ete  IntegraFon  with  Enterprise  Security  4.0  

102  

Takeaways  

One--Stop  Breach  Management  SoluCFoonm   promised  Asset/IdenFty  Tracking  

Compromised  Asset/IdenFty  Tracking   Asset/IdenFty  Specific  Timeline  Drilldowns  

Asset/IdenFty  Specific  Timeline  DrilldownsT   hreat  Infrastructure  Tracking  

Threat  Infrastructure  Tracking  

RemediaFon  Tracking  

RemediaFon  Tracking  

One--Stop  Breach  Management  SoluFon  

Complete  IntegraFon  with  Enterprise  SeCcourmityp  4l.e0t   e  IntegraFon  with  Enterprise  Security  4.0  

103  

Takeaways  

One--Stop  Breach  Management  SoluCFoonm   promised  Asset/IdenFty  Tracking  

Compromised  Asset/IdenFty  Tracking   Asset/IdenFty  Specific  Timeline  Drilldowns  

Asset/IdenFty  Specific  Timeline  DrilldownsT   hreat  Infrastructure  Tracking  

Threat  Infrastructure  Tracking  

RemediaFon  Tracking  

RemediaFon  Tracking  

One--Stop  Breach  Management  SoluFon  

Complete  IntegraFon  with  Enterprise  SecCuroitmy  4p.0le   te  IntegraFon  with  Enterprise  Security  4.0  

104  

Takeaways  

One--Stop  Breach  Management  SoluCFoonm   promised  Asset/IdenFty  Tracking  

Compromised  Asset/IdenFty  Tracking   Asset/IdenFty  Specific  Timeline  Drilldowns  

Asset/IdenFty  Specific  Timeline  DrilldownsT   hreat  Infrastructure  Tracking  

Threat  Infrastructure  Tracking  

RemediaFon  Tracking  

RemediaFon  Tracking  

One--Stop  Breach  Management  SoluFon  

Complete  IntegraFon  with  Enterprise  SecuriCtyo  4m.0p   lete  IntegraFon  with  Enterprise  Security  4.0  

105  

Takeaways  

One--Stop  Breach  Management  SoluCFoonm   promised  Asset/IdenFty  Tracking  

Compromised  Asset/IdenFty  Tracking   Asset/IdenFty  Specific  Timeline  Drilldowns  

Asset/IdenFty  Specific  Timeline  DrilldownsT   hreat  Infrastructure  Tracking  

Threat  Infrastructure  Tracking  

RemediaFon  Tracking  

RemediaFon  Tracking  

One--Stop  Breach  Management  SoluFon  

Complete  IntegraFon  with  EnterprisCeo  Semcupritlye  4t.e0    IntegraFon  with  Enterprise  Security  4.0  

106  

AddiFonal  InformaFon  
@InTheorium  
Splunk  Blog:   h6p://blogs.splunk.com/author/bluger/  
107  

QuesFons?  
108  

Preview  J  
109  

THANK  YOU  

