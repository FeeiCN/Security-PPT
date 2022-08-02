HI  THIS  IS  URGENT  PLZ  FIX  ASAP:   Cri5cal  Vulnerabili5es    
and  Bug  Bounty  Programs  
Kymberlee  Price   Senior  Director  of  Researcher  Opera5ons   Bugcrowd   @Kym_Possible  

whoami?  
· Senior  Director  of  a  Red  Team   · PSIRT  Case  Manager   · Data  Analyst   · Internet  Crime  Inves5gator   · Behavioral  Psychologist  
@kym_possible  

Agenda  
· Intro     · Red   · Blue   · tl;dr   · Ques5ons  

What  this  talk  isn't  
· Determining  if  a  bug  bounty  program  is   appropriate  for  your  company  
· Selling  you  a  bug  bounty  program   · Recrui5ng  you  to  be  a  bounty  hunter  

C:\intro  

                VRP  2014     
h[ps://sites.google.com/site/bughunteruniversity/behind--the--scenes/charts    

                VRP  2014     
h[ps://sites.google.com/site/bughunteruniversity/behind--the--scenes/charts    

                VRP  2014     
h[ps://sites.google.com/site/bughunteruniversity/behind--the--scenes/charts    

                VRP  2014     

Payouts  

Bugs  found  per  ac5ve  researcher  

h[ps://sites.google.com/site/bughunteruniversity/behind--the--scenes/charts    

2014  

Submissions:  

  

· 17,011  submissions  ­  16%  increase  YoY    

· 61  high  severity  bugs  ­  49%  increase  YoY.  

· Minimum  reward:  $500  

  

Geography:  

· 65  countries  received  rewards    ­  12%  increase  YoY  

· 123  countries  repor5ng  bugs  

h[ps://www.facebook.com/notes/facebook--bug--bounty/2014--highlights--boun5es--get--be[er-- than--ever/1026610350686524    

2014  

Payouts:     · $1.3  million  to  321  researchers.     · Average  reward  in  $1,788.  
  
Top  5  Countries:     · India  ­  196  valid  bugs   · Egypt  ­  81  valid  bugs   · USA  ­  61  valid  bugs   · UK  ­  28  valid  bugs   · Philippines  ­  27  valid  bugs  

  

Top  5  

earned  

$256,750  

$1,343     $1,220   $2,470   $2,768   $1,093  

$263,228   $98,820   $150,670   $77,504   $29,511  

$619,733  

2014      · 73  vulnerabili5es  iden5fied  and  fixed  
· 1,920  submissions   · 33  researchers  earned  $50,100  for  57  bugs   · Minimum  reward:  $200   · Doubled  maximum  bounty  payout  to  celebrate  
h[ps://github.com/blog/1951--github--security--bug--bounty--program--turns--one    

2014     
h[ps://github.com/blog/1951--github--security--bug--bounty--program--turns--one    

2014      Online  Services:  O365  and  Azure  
· 46  rewarded  submissions  since  launch  in  late  Sept  2014   · Reward  amounts  to  each  researcher  not  published   · Program  offers  minimum  $500  up  to  $15,000    
h[ps://technet.microsom.com/en--us/security/dn469163.aspx    

2014     
h[ps://technet.microsom.com/en--us/security/dn469163.aspx    

2013--present  
· 37,227  Submissions,  of  which  7,958  contained   valid  vulnerabili5es  
· Paid  3,611  submissions,  resul5ng  in  a  total  of   $722,539.02  paid  to  564  unique  researchers  
Top  10  reward  earning  researchers     received  25%  of  all  rewards    
$168,569  

2013--present  
· Iden5fied  729  high  priority  vulnerabili5es   across  146  programs  
· Vulnerabili5es  ranged  in  both  type  and   priority,  with  an  average  of  almost  5  high  or   cri5cal  priority  vulnerabili5es  per  program.    

P1  and  P2  Defined  
· P1  ­  CRITICAL   Vulnerabili5es  that  cause  a  privilege  escala5on  on  the  plaoorm   from  unprivileged  to  admin,  allows  remote  code  execu5on,   financial  them,  etc.  Examples:  Ver5cal  Authen5ca5on  bypass,   SSRF,  XXE,  SQL  Injec5on,  User  authen5ca5on  bypass     
· P2  ­  SEVERE   Vulnerabili5es  that  affect  the  security  of  the  plaoorm  including   the  processes  it  supports.  Examples:  Lateral  authen5ca5on   bypass,  Stored  XSS,  some  CSRF  depending  on  impact  

Who  finds  these  bugs?  
· Professional  Pen  Testers  and  consultants   · Former  developers,  QA  engineers,  and  IT  Admins  that  have  
shimed  focus  into  applica5on  security   · University  students  that  have  self  taught  security  skills  
· Bugcrowd  has  over  18,000  researchers  signed  up  in  147   countries  worldwide  

C:\red  

· XXE  in  produc5on  exploited  using  Google   Toolbar  bu[on  gallery  
· Reported  in  April  2014   · Fredrik  Almroth  and  Mathias  Karlsson     · Google  responded  to  the  report  within  20  
minutes  
  

· Reginaldo  Silva  reported  an  XML  external  en5ty  vulnerability   within  a  PHP  page  that  would  have  allowed  a  hacker  to   change  Facebook's  use  of  Gmail  as  an  OpenID  provider  to  a   hacker--controlled  URL,  before  servicing  requests  with   malicious  XML  code.    

· Laxman  Muthiyah  iden5fied  a  way  for  a  malicious  user  to   delete  any  photo  album  owned  by  a  user,  page,  or  group  on   Facebook.  He  found  this  vulnerability  when  he  tried  to  delete   one  of  his  own  photo  albums  using  the  graph  explorer  access   token.  

· Cross--domain  Informa5on  Disclosure    

· Eleva5on  of  privilege  

· Eleva5on  of  privilege  

C:\blue  

Rapid  triage  &  priori5za5on   (get  to  the  P1's  faster)  
· Submission  framework  &  expecta5ons  
· Eloquence  of  wri[en  communica5on  
· Clear  in  and  out  of  scope  documenta5on  

Rapid  triage  &  priori5za5on  
· Defined  vulnerability  taxonomy  

Rapid  triage  &  priori5za5on  
· Clear  the  queue  daily   · Dealing  with  Duplicates  

Is  it  worth  the  hassle?  
"In  Mortal  Combat  terms,  it  is  a  `Fatality'"
"If  we  get  nothing  else  from  the  bounty,  this  vuln  was  worth   the  whole  program  alone.  Due  to  the  cri5cal  nature  of  the   issue,  we  immediately  patched  the  Prod  servers  this  evening   to  close  this  exploit.  We  are  also  reviewing  all  logs  since  we   don't  delete  them  yet  to  iden5fy  any  instance  where  this  ever   happened  in  the  past."

How  to  reduce  noise  
· Guidance  and  training  
­ Google:  Bughunter  University   ­ Facebook:  Bounty  Hunter's  Guide   ­ Bugcrowd:  Bugcrowd  Forum  
· Clear  in  and  out  of  scope  documenta5on   · Direct  Performance  Feedback  

How  to  reduce  noise  
· Stop  rewarding  bad  behavior   · Don't  create  bad  behavior  
­ Reward  consistently   ­ Reward  fairly   ­ Fix  quickly   ­ Again  with  the  documenta5on  

C:\tl;dr  

conclusions  
· Bug  boun5es  successfully  generate  high   severity  and  high  quality  vulnerability   disclosures,  delivering  real  value  that   improves  security  for  companies  of  all  sizes.  
· Crowdsourcing  engages  skilled  researchers   around  the  world  that  you  may  not  have   heard  of.  

HI  THIS  IS  URGENT  PLZ  FIX  ASAP:   Cri5cal  Vulnerabili5es    
and  Bug  Bounty  Programs  
Kymberlee  Price   Senior  Director  of  Researcher  Opera5ons   Bugcrowd   @Kym_Possible  

