Most  Ransomware  Isn't  As  Complex  As  You   Might  Think  
Yes,  we  should  be  able  to  detect  most  of  it  
Engin  Kirda  
Co--Founder  and  Chief  Architect,  Lastline  Labs   Professor  @  Northeastern  University  

My  Background  

· Professor  at  Northeastern  University,  Boston  
­ Started  malware  research  in  about  2004   ­ Helped  build  and  release  popular  malware  analysis  and  
detecRon  systems  (Anubis,  EXPOSURE,  Wepawet,  ...)  

· Co--founder  of  Lastline  and  Lastline  Labs  
­ Lastline  offers  protecRon  against  zero--day  threats  and   advanced  malware  
­ CommercializaRon  of  many  years  of  advanced  research   ­ Lastline  Labs  is  the  research  and  development  arm  of  
Lastline  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

2  

Acknowledgements  
· This  work  is  parRally  based  on  a  study  that  my   Ph.D.  student  Amin  Kharraz  worked  on  
­ We  recently  published  it  at  DIMVA  2015   ­ "Cu>ng  the  Gordion  Knot:  A  Look  Under  the  Hood  
of  Ransomware  AHacks"  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

3  

Key  Takeaways  
· The  majority  of  ransomware   launches  relaRvely  straight-- forward  a`ack  payloads  
­ Using  bad  cryptography,  or  standard   cryptography  libraries  
­ DeleRng  files,  but  not  wiping  them  off  disk  
· Compared  to  other  malware,   ransomware  has  very  disRnct,   predictable  behavior  
­ Ransom  notes  with  background  behavior,   change  in  entropy  of  files,  iteraRng  over   large  numbers  of  files,  etc.  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

4  

What  We  Will  Discuss  
· Significance  of  the  ransomware  threat   · Complexity  and  sophisRcaRon  of  a`acks   · A`ack  mechanisms   · Main  ransomware  weaknesses   · Be`er  miRgaRon  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

5  

The  Anatomy  of  An  A`ack  
· A  vicRm  machine  is  compromised  
­ Ransomware  is  installed   ­ Once  the  a`ack  payload  is  executed  (if  there  is  
one),  ransomware  informs  vicRm  of  the  a`ack   ­ The  vicRm  needs  to  pay  ----  otherwise,  his/her  data  
is  kept  hostage  or  destroyed  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

6  

Ransomware  EvoluRon  
· The  ransomware  concept  dates  back  to  1989   · Clearly,  ransomware  a`acks  have  increased  in  
numbers  over  the  last  5  years  
­ Many  security  reports  talk  about  the   sophisKcaKon  and  complexity  of  individual  a`acks  
­ The  general  public  is  lef  with  the  impression  that   we  are  faced  with  a  new  threat  that  is  very   difficult  or  impossible  to  prevent  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

9  

"Between  April  2014  and  June  2015,  the  IC3  received   992  CryptoWall--related  complaints,  with  vicRms   reporRng  losses  totaling  over  $18  million."    
­  FBI  Security  BulleRn,  June  2015  

Complexity  and  SophisRcaRon  
· Typical  way  of  measuring  ransomware   sophisRcaRon  
­ Looking  at  evasion  (e.g.,  packing,  dynamic  checks,   encrypRon,  etc.)  

­ In  this  work,  we  are  looking  at  the  sophisRcaRon   of  the  a`ack  afer  compromise  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

13  

A  Closer  Look  at  Ransomware  
· 2006--2014   · 1359  samples   · 15  families  
(incl.  Cryptolocker  and         Cryptowall)  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

14  

Methodology  
· Automated,  dynamic  analysis  for  all  samples   · Manual  analysis  in  some  cases   · VerificaRon  of  samples  and  cross--checking  
with  VirusTotal  
­ Ransomware  if  three  or  more  scanners  agree  
· All  samples  showed  ransomware  behavior  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

15  

Ransomware  A`ack  Payloads  

EncrypRon  Mechanisms  
· About  5%  of  the  samples  use  some  encrypRon  
­ Earlier  samples  ofen  have  custom  encrypRon   (which  leads  to  mistakes)  
­ Current  popular  families  like  Cryptolocker  and   Cryptowall  use  Windows  crypto  libraries  
· Is  this  sophisRcaRon,  or  just  good  sofware   engineering?  
­ Using  strong  crypto  libraries  is  a  double--edged   sword  for  the  a`ackers  
· Dynamic  analysis  can  catch  the  use  of  these  libraries  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

17  

DeleRon  Mechanisms  
· About  36%  of  the  five  common  ransomware   families  in  data  set  delete  files  
­ Most  deleRon  is  straight--forward   ­ Master  File  Table  (MFT)  entries  are  manipulated,  
but  the  data  remains  on  disk   ­ Hence,  recovery  is  possible  in  many  cases   ­ The  MFT  is  an  effecRve  venue  for  detecRng  
ransomware  during  analysis  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

18  

Locking  Mechanisms  

· Classic  ransomware  behavior:  Lock  the  desktop   of  computer  
­ More  than  60%  of  the  samples  simply  use   CreateDesktop  to  create  a  persistent  new  desktop  
­ Another  approach  is  to  display  HTML  page  and  disable   components  
· In  all  cases:  A  message  is  displayed  to  the  vicRm  
· Locking  mechanisms  are  a  nuisance,  but  the  data   is  typically  not  harmed  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

19  

Be`er  MiRgaRon  

Achilles'  Heel  of  Ransomware  
· Ransomware  has  to  inform  vicRm  that  a`ack   has  taken  place  
­ Behavior  inherent  in  its  nature  
· Ransomware  has  certain  behaviors  that  are   predictable  
­ e.g.,  entropy  changes,  modal  dialogs  and   background  acRvity,  accessing  "honey"  files  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

22  

Example:  DissecRng  Cryptolocker  
· Analysis  Overview  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

23  

Example:  DissecRng  Cryptolocker  
· Loaded  libraries...  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

24  

Key  Takeaways  
· The  majority  of  ransomware   launches  relaRvely  straight-- forward  a`ack  payloads  
­ Using  bad  cryptography,  or  standard   cryptography  libraries  
­ DeleRng  files,  but  not  wiping  them  off  disk  
· Compared  to  other  malware,   ransomware  has  very  disRnct,   predictable  behavior  
­ Ransom  notes  with  background  behavior,   change  in  entropy  of  files,  iteraRng  over   large  numbers  of  files,  etc.  

Copyright  ©2015  Lastline,  Inc.  All  rights  reserved.  

25  

THANK YOU!

