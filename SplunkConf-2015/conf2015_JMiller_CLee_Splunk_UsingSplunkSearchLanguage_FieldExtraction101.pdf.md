Copyright  ©  2015  Splunk  Inc.  
Understanding  and   Using  Fields  
Jesse  Miller  
Product  Manager,  Splunk  
Clara  Lee  
SoCware  Engineer,  Splunk  

Disclaimer  
During  the  course  of  this  presentaIon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauIon  you  that  such  statements  reflect  our   current  expectaIons  and  esImates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaIon  are  being  made  as  of  the  Ime  and  date  of  its  live   presentaIon.  If  reviewed  aCer  its  live  presentaIon,  this  presentaIon  may  not  contain  current  or   accurate  informaIon.  We  do  not  assume  any  obligaIon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiIon,  any  informaIon  about  our  roadmap  outlines  our  general  product  direcIon  and  is  subject  to   change  at  any  Ime  without  noIce.  It  is  for  informaIonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaIon  either  to  develop  the  features  
or  funcIonality  described  or  to  include  any  such  feature  or  funcIonality  in  a  future  release.  
2  

Agenda  
 Why  you  should  use  fields    What  are  fields?    Field  maturity    Field  extractor  DEMO    MulIvalued  fields  DEMO    More  fun  with  fields    Q&A        
3  

Why  You  Should  Use  Fields  
4  

Why  You  Should  Use  Fields  
5  

What  Are  Fields?  
 Searchable  name/value  pairings  in  event  data  
­ Index--Ime  fields  (Imestamp,  host,  source,  sourcetype,  index)   ­ Search--Ime  fields  (everything  else!)  
6  

What  Are  Fields?  
 Searchable  name/value  pairings  in  event  data  
­ Index--<me  fields  (Imestamp,  host,  source,  sourcetype,  index)   ­ Search--Ime  fields  (everything  else!)  
7  

What  Are  Fields?  
 Searchable  name/value  pairings  in  event  data  
­ Index--Ime  fields  (Imestamp,  host,  source,  sourcetype,  index)   ­ Search--<me  fields  (everything  else!)  
8  

What  Are  Fields?  
 Searchable  name/value  pairings  in  event  data  
­ Index--Ime  fields  (Imestamp,  host,  source,  sourcetype,  index)   ­ Search--Ime  fields  (everything  else!)  
9  

What  Are  Fields?  
 Searchable  name/value  pairings  in  event  data  
­ Index--Ime  fields  (Imestamp,  host,  source,  sourcetype,  index)   ­ Search--Ime  fields  (everything  else!)  
 Values  are  extracted  from  event  data  and  mapped  to  a  field  name  
­ Automa<c  extrac<on  (props/transforms,  key=value)  
10  

What  Are  Fields?  
 Searchable  name/value  pairings  in  event  data  
­ Index--Ime  fields  (Imestamp,  host,  source,  sourcetype,  index)   ­ Search--Ime  fields  (everything  else!)  
 Values  are  extracted  from  event  data  and  mapped  to  a  field  name  
­ AutomaIc  extracIon  (props/transforms,  key=value)  
11  

What  Are  Fields?  
 Searchable  name/value  pairings  in  event  data  
­ Index--Ime  fields  (Imestamp,  host,  source,  sourcetype,  index)   ­ Search--Ime  fields  (everything  else!)  
 Values  are  extracted  from  event  data  and  mapped  to  a  field  name  
­ AutomaIc  extracIon  (props/transforms,  key=value)  
12  

What  Are  Fields?  
 Searchable  name/value  pairings  in  event  data  
­ Index--Ime  fields  (Imestamp,  host,  source,  sourcetype,  index)   ­ Search--Ime  fields  (everything  else!)  
 Values  are  extracted  from  event  data  and  mapped  to  a  field  name  
­ AutomaIc  extracIon  (props/transforms,  key=value)  
2013/10/03,audit,jesse,write,/etc/rc.local  
13  

What  Are  Fields?  
 Searchable  name/value  pairings  in  event  data  
­ Index--Ime  fields  (Imestamp,  host,  source,  sourcetype,  index)   ­ Search--Ime  fields  (everything  else!)  
 Values  are  extracted  from  event  data  and  mapped  to  a  field  name  
­ Automa<c  extrac<on  (props/transforms,  key=value)  
2013/10/03,audit,jesse,write,/etc/rc.local  
14  

What  Are  Fields?  
 Searchable  name/value  pairings  in  event  data  
­ Index--Ime  fields  (Imestamp,  host,  source,  sourcetype,  index)   ­ Search--Ime  fields  (everything  else!)  
 Values  are  extracted  from  event  data  and  mapped  to  a  field  name  
­ AutomaIc  extracIon  (props/transforms,  key=value)  
<Symbol>SPLK</Symbol><Last>62.02</Last>   <Change>+0.05</Change><Open>61.80</Open>   <Low>61.09</Low><Volume>450618</Volume>  
15  

What  Are  Fields?  
 Searchable  name/value  pairings  in  event  data  
­ Index--Ime  fields  (Imestamp,  host,  source,  sourcetype,  index)   ­ Search--Ime  fields  (everything  else!)  
 Values  are  extracted  from  event  data  and  mapped  to  a  field  name  
­ Automa<c  extrac<on  (props/transforms,  key=value)  
<Symbol>SPLK</Symbol><Last>62.02</Last>  
16  

What  Are  Fields?  
 Searchable  name/value  pairings  in  event  data  
­ Index--Ime  fields  (Imestamp,  host,  source,  sourcetype,  index)   ­ Search--Ime  fields  (everything  else!)  
 Values  are  extracted  from  event  data  and  mapped  to  a  field  name  
­ AutomaIc  extracIon  (props/transforms,  key=value)   ­ Manual  extrac<on  (rex)  
17  

What  Are  Fields?  
 Searchable  name/value  pairings  in  event  data  
­ Index--Ime  fields  (Imestamp,  host,  source,  sourcetype,  index)   ­ Search--Ime  fields  (everything  else!)  
 Values  are  extracted  from  event  data  and  mapped  to  a  field  name  
­ AutomaIc  extracIon  (props/transforms,  key=value)   ­ Manual  extracIon  (rex)  
 Fields  can  be  defined  and  calculated  within  a  search  
­ Stats,  Eval,  TransacIon  
 You  can  use  lookups  to  create  fields  for  context  and  translaIon  
18  

What  Are  Fields?  
 Searchable  name/value  pairings  in  event  data  
­ Index--Ime  fields  (Imestamp,  host,  source,  sourcetype,  index)   ­ Search--Ime  fields  (everything  else!)  
 Values  are  extracted  from  event  data  and  mapped  to  a  field  name  
­ AutomaIc  extracIon  (props/transforms,  key=value)   ­ Manual  extracIon  (rex)  
 Fields  can  be  defined  and  calculated  within  a  search  
­ Stats,  Eval,  TransacIon  
 You  can  use  lookups  to  create  fields  for  context  and  transla<on  
19  

Field  Maturity  

Index  Data   Extract  Fields  

Use  Fields   Add  Knowledge  

Keyword  search   Time  correlaIon  

Fix  false  posiIves   Data--confidence  

Metadata  filtering   AnalyIcs  (stats,  charts)  

CorrelaIon   Accessibility  

21  

Field  Extractor  Demo  
· Field  extracIon  using  the  Advanced  Field  Extractor   · Regex/palern  based  &  delimiter  based   · ValidaIng  extracIons  and  eliminaIng  false  +/--  
22  

Recipients   jmiller@splunk   boss@splunk   support@splunk  

MulIvalued  Fields  

Open  Ports  

Files  Changed  

25  

Props.conf  

80  

Transforms.conf  

443  

514  

53  

Ingredients   Gin  
Lillet  Blanc   Cointreau   Lemon  Juice   Absinthe  

23  

MulIvalued  Fields  Demo  
· ExtracIon  (props,  transforms,  rex)   · ManipulaIon  (mvexpand,  nomv)   · Evals  (mvcount,  mvfilter,  mvfind,  mvindex)  
24  

More  Fun  With  Fields
25  

THANK  YOU  

