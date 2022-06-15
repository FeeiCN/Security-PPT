Data--Driven  Threat  Intelligence:  Useful  
Methods  and  Measurements  for  
Handling  Indicators  (#dd=)  

Alex  Pinto   Chief  Data  Scien2st   Niddel    /  MLSec  Project  
@alexcpsec   @MLSecProject

Alexandre  Sieira   CTO  
Niddel  
@AlexandreSieira   @NiddelCorp

MLSec  Project  /  Niddel  
· MLSec  Project  ­  research--focused  branch  of  Niddel  for  open-- source  tools  and  community  building  
· Niddel  builds  Magnet,  an  Applied  Threat  Intelligence  PlaHorm,   that  leverages  ML  models  to  facilitate  the  usage  of  TI  in  a  fully   personalized  and  hassle--free  way.  
· Looking  for  beta  testers  and  research  collabora2on   · More  info  at:  
· niddel.com   · mlsecproject.org

Agenda  
· Cyber  War...  Threat  Intel  ­  What  is  it  good  for?   · Combine  and  TIQ--test   · Using  TIQ--test  
· Novelty  Test   · Overlap  Test   · Popula2on  Test   · Aging  Test   · Uniqueness  Test   · Use  case:  Feed  Comparison  

What  is  TI  good  for  anyway?  

What  is  TI  good  for  anyway?  
· 1)  AXribu2on  

What  is  TI  good  for  anyway?  

What  is  TI  good  for  anyway?  
· 2)  Cyber  Threat  Maps       (hXps://github.com/hrbrmstr/pewpew)  

What  is  TI  good  for  anyway?  
· 3)  How  about  actual  defense?     · Use  it  as  blacklists?  As  research  data?   · Thing  is  RAW  DATA  is  hard  to  work  with  

(Semi--)Required  Reading  
· #2qtest  slides:  hXp://bit.ly/2qtest   · RPubs  Page:  hXp://bit.ly/2qtest--rpubs  

Combine  and  TIQ--Test  
· Combine  (hXps://github.com/mlsecproject/combine)   · Gathers  TI  data  (ip/host)  from  Internet  and  local  files   · Normalizes  the  data  and  enriches  it  (AS  /  Geo  /  pDNS)   · Can  export  to  CSV,  "2q--test  format"  and  CRITs   · Coming  soon:  CybOX  /  STIX  (ty  @kylemaxwell)  
· TIQ--Test  (hXps://github.com/mlsecproject/2q--test)   · Runs  sta2s2cal  summaries  and  tests  on  TI  feeds   · Generates  charts  based  on  the  tests  and  summaries   · WriXen  in  R  (because  you  should  learn  a  stat  language)  

Using  TIQ--TEST  
· Available  tests  and  sta2s2cs:   · NOVELTY  ­  How  ogen  do  they  update  themselves?   · OVERLAP  ­  How  do  they  compare  to  what  you  got?   · POPULATION  ­  How  does  this  popula2on  distribu2on   compare  to  another  one  ?   · AGING  ­  How  long  does  an  indicator  sit  on  a  feed?   · UNIQUENESS  ­  How  many  indicators  are  found  in  only   one  feed?  

Using  TIQ--TEST  
· New  dataset!   · hXps://github.com/mlsecproject/2q--test--Winter2015  

Using  TIQ--TEST  ­  Feeds  Selected  
· Dataset  was  separated  into  "inbound"  and  "outbound"  

Using  TIQ--TEST  ­  Data  Prep  
· Extract  the  "raw"  informa2on  from  indicator  feeds   · Both  IP  addresses  and  hostnames  were  extracted  

Using  TIQ--TEST  ­  Data  Prep  
· Convert  the  hostname  data  to  IP  addresses:   · Ac2ve  IP  addresses  for  the  respec2ve  date  ("A"  query)   · Passive  DNS  from  Farsight  Security  (DNSDB)  
· For  each  IP  record  (including  the  ones  from  hostnames):   · Add  asnumber  and  asname  (from  MaxMind  ASN  DB)   · Add  country  (from  MaxMind  GeoLite  DB)   · Add  rhost  (again  from  DNSDB)  ­  most  popular  "PTR"  

Using  TIQ--TEST  ­  Data  Prep  Done  

Novelty  Test  ­  measuring  added   and  dropped  indicators

Novelty  Test  --  Inbound  

Overlap  Test  ­  More  data  is  beXer,   but  make  sure  it  is  not  the  same   data

Overlap  Test  --  Inbound  

Overlap  Test  --  Outbound  

Popula=on  Test  
· Let  us  use  the  ASN  and   GeoIP  databases  that  we   used  to  enrich  our  data  as  a   reference  of  the  "true"   popula2on.    
· But,  but,  human  beings  are   unpredictable!  We  will   never  be  able  to  forecast   this!  
     

Is  your  sampling  poll  as  random  as   you  think?  

Can  we  get  a  beVer  look?  
· Sta2s2cal  inference--based  comparison  models   (hypothesis  tes2ng)   · Exact  binomial  tests  (when  we  have  the  "true"  pop)   · Chi--squared  propor2on  tests  (similar  to   independence  tests)     

Aging  Test  ­  Is  someone  cleaning   this  up  eventually?

INBOUND

OUTBOUND

Uniqueness  Test  

Uniqueness  Test  
· "Domain--based  indicators  are  unique  to  one  list  between  96.16%   and  97.37%"  
· "IP--based  indicators  are  unique  to  one  list  between  82.46%  and   95.24%  of  the  2me"  

Intermission

OPTION  1:  Cool  Story,  Bro!  
· Some  of  you  are  probably  like:   · "You  Data  Scien2sts  and  your   algorithms,  how  quaint."   · "Why  aren't  you  doing  some  useful   research  like  na2on--state   aXribu2on?"  

OPTION  2:  How  can  I  use  this   awesomeness  on  my  data?

Use  Case:  Comparing  Private  Feeds  
· How  about  using  TIQ--TEST  to  evaluate  a  private  intel  feed?   · Trying  stuff  before  you  buy  is  usually  a  good  idea.  Just  sayin'   · Let's  compare  a  new  feed,  "private1",  against  our  combined  
outbound  indicators     

Popula=on  Test  

Popula=on  Test  

Popula=on  Test  

Aging  Test  
Mostly  DGA  Related  Churn  
· I  guess  most  DGAs  rotate  every  24  hours,  right?   · Rota2on  means  the  private  data  is  s2ll  "fresh",  from  research  or  
DGA  genera2on  procedures  

A++  WOULD   THREAT  INTEL  
AGAIN

Take  Away  
· Analyze  your  data.  Extract  value  from  it!   · Try  before  you  buy!  Different  test  results  mean  
different  things  to  different  orgs.  
· Try  the  sample  data,  replicate  the  experiments:  
· hXps://github.com/mlsecproject/2q--test--Winter2015   · hXp://rpubs.com/alexcpsec/2q--test--Winter2015  

Greets  and  Thanks!  
· @kafeine  and  John  Bambenek  for  access  to   their  feeds  
· @kylemaxwell,  @paul4pc  and  all  contributors   for  COMBINE  
· @bfist  for  his  work  on  hXp://sony.aXributed.to   · @hrbrmstr  for  IPEW  and  contribs  for  TIQ--TEST  
· All  the  MLSec  Project  community  peeps!  

· Q&A?   · Feedback!  

Thanks!  
Alex  Pinto  
@alexcpsec   @MLSecProject   @NiddelCorp  

Alexandre  Sieira  
@AlexandreSieira   @MLSecProject   @NiddelCorp  

"The  measure  of  intelligence  is  the  ability  to  change."    
                   --  Albert  Einstein    

