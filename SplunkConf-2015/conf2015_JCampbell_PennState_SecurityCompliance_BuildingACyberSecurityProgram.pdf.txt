Copyright  ©  2015  Splunk  Inc.  
Building  a  Cyber     Security  Program  
With  Splunk  App  for  Enterprise  Security  
Jeff  Campbell  
CISSP+ISSAP,  Splunk  CerBfied  Architect   Cyber  Security  |  Splunk  Architect   Penn  State  Hershey  Medical  Center     

Disclaimer  
During  the  course  of  this  presentaBon,  we  may  make  forward  looking  statements   regarding   future   events   or   the   expected   performance   of   the   company.   We   cauBon  you  that  such  statements  reflect  our  current  expectaBons  and  esBmates   based   on   factors   currently   known   to   us   and   that   actual   events   or   results   could   differ   materially.   For   important   factors   that   may   cause   actual   results   to   differ   from  those  contained  in  our  forward--looking  statements,  please  review  our  filings   with   the   SEC.   The   forward--looking   statements   made   in   the   this   presentaBon   are   being   made   as   of   the   Bme   and   date   of   its   live   presentaBon.   If   reviewed   aUer   its   live   presentaBon,   this   presentaBon   may   not   contain   current   or   accurate   informaBon.   We   do   not   assume   any   obligaBon   to   update   any   forward   looking   statements  we  may  make.    
   In   addiBon,   any   informaBon   about   our   roadmap   outlines   our   general   product   direcBon   and   is   subject   to   change   at   any   Bme   without   noBce.   It   is   for   informaBonal   purposes   only   and   shall   not,   be   incorporated   into   any   contract   or   other   commitment.   Splunk   undertakes   no   obligaBon   either   to   develop   the   features  or  funcBonality  described  or  to  include  any  such  feature  or  funcBonality   in  a  future  release.  
2  

Jeff  Campbell  
3  

 Focus  shiU  towards  Cyber    More  people  w/specializaBon    New  tech    More  data!  
4  

5  

6  

Dedicated  Search  Head  
16  CPU  cores   16  GB  RAM  

Indexers  

1  per  100  GB  indexed  

reDovciuemweISnnpst  ta@tluahBlnolaekn  Bd  E  > o onon  Stne p carlnlpusidrn.ni k ssCee o pA  ndpl  fiedpugp  foulnoorrcyak  mEBu.noectmnneo t rMp  pemraliannsneu  tna  Sailne  >Bcgu       oritny  >    

7  

8  

9  

 IdenBty  Data  
­ AcBve  Directory   ­ Exchange   ­ IdenBty  Management  
 Asset  Data  
­ Asset  &  Inventory  Management   ­ ConfiguraBon  Management   ­ Data  Center  Management  System  
10  

  _Bme   host  

vendor_product  

src_bunit  

source   sourcetype  

signature  

src_category  

Common   response_Bme  

src_dns   src_ip  

Network  Sessions  

Inform   aBon  

user_priority   user_category  
user_bunit   user  

dest_ip  

dest_bunit  

Model   dest_mac  
dest_category   dest_nt_host  
dest_dns  

tag  

dest_priority  

src_mac   src_nt_host   src_priority  
duraBon  
acBon  

11  

Alerts  
tag=alert  

JVM  
tag=jvm  
  

CerBficates  
tag=cerBficate  

Performance  
tag=performance  

Web  
tag=web  
  

  
ApplicaBon  State  
(tag=listening  tag=port)  OR  (tag=process   tag=report)  OR  (tag=service  tag=report)  

  

Common   Change  Analysis   tag=change  

Network  ResoluBon  (DNS)  

tag=network  tag=resoluBon  tag=dns  

Network  Sessions  

InformaBon   Interprocess  Messaging   tag=messaging  

tag=network  tag=session     
   Intrusion  DetecBon  
tag=ids  tag=aoack  

Malware  
tag=malware  tag=aoack  

Updates  

VulnerabiliBes  
tag=vulnerability  tag=report  
  

Model   Network  Traffic  
tag=network  tag=communicate  

Inventory  
tag=inventory  

tag=update  tag=status     
  

Email  
tag=email  

  

Ticket  Management  

Database  
tag=database  

tag=BckeBng  

AuthenBcaBon  
tag=authenBcaBon  NOT  
   (acBon=success  user=*$)

  

  

12  

tag=network  tag=communicate  
--  --  --  3000  lines  later  --  --  --     13  

14  

vcieouwmse  om  tfah  anecdc  de  faloetrar m aaBto-o-adn-e-g  slliatnanftocue  s    
15  

16  

17  

$SPLUNK_HOME/etc/log.cfg  
##log.cfg      category.SavedSplunker  =  DEBUG,scheduler  
18  

splunk>  (index=*  OR  index=_*)  (tag=network  tag=communicate)  
19  

20  

abdedo  mero  pree r infodremxearnsc  feo   r  
splunk>  (index=*  OR  index=_*)  (tag=network  tag=communicate)  
21  

Splunk  packages  CIM--compliant  technology  add--ons  with  Enterprise  Security  

Splunk_TA_bro   Splunk_TA_cisco--asa   Splunk_TA_cisco--esa   Splunk_TA_cisco--wsa   Splunk_TA_flowfix   Splunk_TA_mcafee   Splunk_TA_nessus   Splunk_TA_nix   Splunk_TA_norse   Splunk_TA_sophos   Splunk_TA_windows  

 TA--airdefense    TA--alcatel    TA--bluecoat    TA--cef    TA--fireeye    TA--forBnet    TA--Up    TA--juniper    TA--ncircle    TA--nmap    TA--oracle  

 TA--ossec    TA--paloalto    TA--rsa    TA--sav    TA--sep    TA--snort    TA--sos    TA--Bppingpoint    TA--trendmicro    TA--websense  
2e:  nesnuarbele  C  rIMele--cvoamntp  TliAasn t o  enxet-r-bayc-B-oonnes  t  o  

22  

23  

$SPLUNK_HOME/etc/apps/Splunk_SA_CIM/local/datamodels.conf  

#[aa  #Accuccdteeahllteeeanrrmtaaoittdciieaooltnnsi..  omc=nao  ]nntufr  au  le_  rebuilds  =  ntfCoorItruM   a Eeun  dtt ao etmrapmarBisoceda  eSllleysc    riunerb  iStupyill  uddno   k     

  

#configure  to  limit  backfill  during  initial  build  

#    --  only  effective  when  rebuild  initiated  

acceleration.backfill_time  =  --7d  

limitp  broadckuficBllo  rann  rgeea d foinre  fsasst   er  

24  

25  

scapleer  ofourtm  foarn  cbee o  er  
26  

*nix   Splunk  Add--on  for  Unix  and  Linux  

$SPLUNK_HOME/etc/apps/Splunk_TA_nix/local/evenoypess.conf  

##eventtypes.conf     

daatcaro  msso  adlell  isn  sdeeaxrecsh    

aedvdecionBnoosnyipdalee  csro    m(ntaosgtdrsia)fiy  wnintistgh      

[iptables_firewall_accept]  

s#esaeracrhch  =  =  (  (NNOOTT  s  osuorucrecteytpyepe=s=tsatsahs)h)  s  isgingantautruer=ef=ifrierweawlall      

                  action=PASS  OR  action=permit    

#steagrsch  =  =  o  isn  duenxi=xo  hso  s(tNO  fTi  rseowuarlclet  ycpoemm=usntiacsaht)e  s  isguncacteusrse  =  firewall    

                  action=PASS  OR  action=permit    

#tags  =  os  unix  host  firewall  communicate  success    

line  wrapping  for  readability  only  

>300%  increase  in  data  model  acceleraBon  performance  aUer  adding  index  constraints  in  select  TAs  

27  

28  

29  

30  

31  

32  

33  

34  

35  

run  -me:  12:31   run  -me:  0:21  
run  -me:  0:16  
run  -me:  0:07   36  

"datampDloeedaaLdseroerl  Sv"i  lspel    ttd,loou o yp  nswo   ek  uuna,sr s r i   ...cunhsg  e   i  nrs  y   our  

37  

 Prepare  infrastructure  ­  may  need  more  hardware  than  you  think    Think  through  your  authoritaBve  user  and  asset  inventories    Be  selecBve  in  your  TAs  and  apps  on  the  ES  search  head...    Consider  adding  constraints  to  the  TA  evenoypes    Take  advantage  of  the  acceleraBon  you  worked  so  hard  for  
­ Where  possible,  use  tstats  with  "summariesonly=t"    
38  

QuesBons?  
39  

THANK  YOU  

