# R S A C   

SESSION  ID:   CRWD--T10  
Ar/ficial  Intelligence  for  InfoSec:   Ac/vely  Learning  to  Mimic  an   Analyst  

Kalyan  Veeramachaneni  
Research  Scien8st,  MIT     MIT  CSAIL   Co--Founder  PaCernEx   kalyan@csail.mit.edu  

#RSAC
Overview  
Intro  self  
Ar8ficial  Intelligence  --  Research  Scien8st  @  MIT  CSAIL   InfoSec  ­  Co--Founder  @  PaCernEx   What  I  have  built  before  ?   Why  Info  sec  is  different  than  anything  I  have  worked  on?  
Unsupervised  learning  solu8ons    
Why  they  are  not  enough?  
How  to  bring  supervision  into  learning?  
Challenges  and  benefits    
Metrics  for  evalua8on    
2  

#RSAC
What  have  I  built  before  ?  
Predict  if  a  pa8ent  is  not  going  to  show  up  for  the  doctors  appointment   Predict  what  music  you  might  like  to  listen  when  driving  home   If  you  liked  this  movie,  what  else  would  you  like?   In  almost  all  these  problems    
We  had  data  from  past  to  use     This  past  data  has  occurrences  of  what  we  want  to  predict     Sta8onary  ­  when  we  find  that  paCern  that  predicts,  it  may  not  change.    
3  

#RSAC
Why  info  sec  is  different  ?  

When  I  started  in  info  sec,  I  asked:    
If  we  want  to  predict  aCacks,  are  there  past  occurrences  of  those  in   the  data  to  learn  what  leads  to  them  ?  
Answer:  No   If  yes,  can  I  use  them  to  build  predic8ve  models  and  use  them?   Wouldn't  that  be  helpful?  
Answer:  The  models  would  be  irrelevant    
So  what  do  we  do?      

  

4  

#RSAC
Unsupervised  learning  system  
    
5  

#RSAC
Why  unsupervised  learning  is  not  enough?  

High  outlier  score  but  not  malicious  

Three  hosts  connec8ng  to  same  3  des8na8ons     Three  des8na8ons  are  not  partner  sites  or  known    

S1  

D1  

Connec8ons  look  programma8c    

S2  

D2  

Regular  intervals     Same  #packets  in  and  out     Same  dura8on  across  different  hosts    

S3  

D3  

Each  source  connected  to  all  3  des8na8ons  same  number  of  8mes     But  different  sources  had  different  number  for  connec8ons    

Perhaps  bot  or  malware  traffic  ?  

Once  we  examined  the  remote  host  and  looked  at  the  raw  data    

Manually  configured  NTP  systems  

  

  

6  

#RSAC
Why  unsupervised  learning  is  not  enough?    

Low  outlier  score  but  malicious    

srcip   10.137..x.x   10.137..x.x   10.137..x.x   10.137..x.x   10.137..x.x   10.137..x.x   10.137..x.x   10.137..x.x   10.137..x.x   10.137..x.x  

ds8p  

resolved  

Same  source  ----  random  remote  des8na8ons  

Thousands  of  sessions    

Very  small  data  transfer      

  

7  

#RSAC
What  did  an  analyst  provide  ?  
Subjec8ve  assessment  and  intui8on  based  on  
Looking  at  mul8ple  events  simultaneously     Colla8ng  mul8ple  pieces  of  informa8on    
Pull  together  external  sources  of  informa8on       
8  

#RSAC
An  interac/ve  system  with  analyst  giving  input      
9  

#RSAC
What  are  the  challenges  ?  
In  geQng  human  input    
Expert  sourcing     Not  crowd  sourcing,  or  even   customer  sourcing    
Limited  bandwidth   What  informa8on  to  show?   How  to  capture  most  input?  
Tags,  text,  or  even  write  code?  
10  

#RSAC
Mimicking  an  analyst    
11  

#RSAC
Mimicking  an  analyst    
12  

#RSAC
Next  day  

+  
Historical  data    

Next  day    
t  
13  

  

Use  both  models  and  show  analyst:      

· Outliers  from  day  t+1    

· Predic8ons  from  Virtual  Analyst  on  new  data  

· Predic8ons  from  Virtual  Analyst  on  old  data    

Going  back  to  our  example  

Low  outlier  score  but  malicious    

srcip   10.137..x.x   10.137..x.x   10.137..x.x   10.137..x.x   10.137..x.x   10.137..x.x   10.137..x.x   10.137..x.x   10.137..x.x   10.137..x.x  

ds8p  

resolved  

Same  source  ----  random  remote  des8na8ons  

Thousands  of  sessions    

Very  small  data  transfer      

  

14  

#RSAC

#RSAC
Using  virtual  analyst  on  historical  data    

Historical  data    
Next  day    
t  

· Once  the  analyst  tagged  10  low  outlier  events     · We  learnt  a  virtual  analyst     · Used  the  model  on  historical  data  and  found  27                   more  that  were  low  on  the  outlier  scale         
15  

#RSAC
What  are  the  challenges  ?  

In  geQng  human  input    
Expert  sourcing     Not  crowd  sourcing,  or  even   customer  sourcing    
Limited  bandwidth  
What  informa8on  to  show?  
How  to  capture  most  input?   Tags,  text,  or  even  write  code?  

Dynamic  learning  and  upda/ng    
Thin  label  space     Only  10  or  20  posi8ve  labels  per  day  
Deploying  and  upda8ng  on  a   con8nuous  basis    

16  

#RSAC
Peer  Reviewed  Research  Paper  

Experimental  Setup  
Real  world  data  set  with  reported   aCacks  
3.6B  log  lines   70.2M  en88es   318  known  aCacks  

Results  
Our  system  is  bootstrapped  without   labeled  data  
The  detec8on  rate  improves  over  8me  
Unsupervised--alone  approaches   captured  a  8ny  frac8on  of  the  aCacks  

17  

#RSAC
Results  --  PuQng  virtual  analysts  to  use    
At  K=200  Alerts,  AI  approach   achieves  0.85  recall      At  K=200,  Outlier  Detec8on   achieves  only  0.15  recall    
18  

#RSAC
Measure  --  Pa[ern  detec/on  ra/o    
PaCern  Detec8on  Ra8o  ­  Ra8o  of  AUC  to  Maximum  AUC    
PDR=  0.833   PDR=0.292  
19  

#RSAC
What  did  an  analyst  provide  ?  
Subjec8ve  assessment  and  intui8on  based      
Look  at  mul8ple  events  simultaneously     Collate  mul8ple  pieces  of  informa8on    
Pull  together  external  sources  of  informa8on     Analysts  are  also  sugges8ng  ideas  for  "features"  implicitly    
  Distance  between  the  feature  vector  from  the  source  to  all   random  des8na8ons?  
20  

Where  do  the  features  come  from?  

Month ...
Week Day

...
{ "username": "Jane"
"ip": "128.21.221.13", "agent": "Mozilla/5.0 ...", "page": "https://mitx.mit.edu/...", "time": "11252015:5.40PM" ... }
{ "username": "John"
"ip": "164.28.233.15", "agent": "Mozilla/5.0 ...", "page": "https://mitx.mit.edu/...", "time": "091252015:9.32AM" ... }
{ "username": "Smith"
"ip": "168.61.221.13", "agent": "Mozilla/5.0 ...", "page": "https://mitx.mit.edu/...", "time": "121152015:10.03AM" ... }

Day
{ "username": "Jane"
"ip": "128.21.221.13", "agent": "Mozilla/5.0 ...", "page": "https://mitx.mit.edu/...", "time": "11252015:5.40PM" ... }
{ "username": "Jane"
"ip": "128.21.221.13", "agent": "Mozilla/5.0 ...", "page": "https://mitx.mit.edu/...", "time": "08252015:11.12AM" ... } ... ...

Features
Jane

21  

Money spent Number of items bought
New user? Changed password?
Changed email? ... ...
Changed address?

#RSAC

#RSAC
Data  Scien/st  vs.  Security  Analyst  

Data  Scien/st       

Features    
Follow  one  to  many  rela8onships     Sessions  à  Dura8on    
Averages,  Standard  devia8ons,  trends       and  other  mathema8cal/  sta8s8cal   func8ons.       
22  

#RSAC
Data  Scien/st  vs.  Security  Analyst    

Security  analyst  

Features    
Number  of  unique  applica8ons  (HTTP,   SSL,  Skype,  Streaming  media,  DNS..)  
Number  of  protocols  being  used   (UDP,  TCP,  etc).    
Number  of  8mes  the  traffic  originates   from  a  reserved  port.    

23  

#RSAC
Key  takeaways  
It  is  essen8al  to  build  an  analyst  in--the--loop  system  to  develop  a  truly   adap8ve  ar8ficial  intelligence  system     Replica8ng  analysts  intui8on  through  models  in  real  8me  is  cri8cal  
So  as  to  stay  relevant    
Analyst  bandwidth  is  the  real  metric    
Because  you  can  achieve  arbitrarily  high  true  posi8ve  rate,  if  you  make   them  inves8gate  everything   Or  achieve  zero  false  posi8ve  rate,  if  you  don't  show  anything    
24  

#RSAC
What  you  can  do?  
For  the  malicious  behaviors  that  you  do  know,  compute  
False  Posi8ves   True  Posi8ves   Number  of  Alerts  shown  to  the  analyst   Measure  PaCern  Detec8on  Ra8o  (PDR)  ­  a  metric  to  measure  efficacy  of   your  detec8on  systems  
Maintain  PDR  for  every  system  that  you  use  for  detec8on  and  observe   how  it  changes  over  8me  
25  

#RSAC
What  you  can  do?  
Next  week  you  should:  
Look  over  your  past  90  days  of  data   Iden8fy  False  Posi8ves,  True  Posi8ves   Calculate  your  PaCern  Detec8on  Ra8o  (PDR)  
In  the  first  three  months  following  this  presenta8on  you  should:  
Calculate  your  PDR  for  various  detec8on  systems  in  your   environment   Assess  which  tools  are  most  effec8ve  
26  

