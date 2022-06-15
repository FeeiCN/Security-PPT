Copyright  ©  2015  Splunk  Inc.  
Op:mizing  Splunk   Knowledge  Objects  
Mar:n  Müller  
Professional  Services  Consultant   Consist  SoAware  Solu:ons  GmbH  

Disclaimer  
During   the   course   of   this   presenta:on,   we   may   make   forward   looking   statements   regarding   future   events  or  the  expected  performance  of  the  company.  We  cau:on  you  that  such  statements  reflect  our   current   expecta:ons   and   es:mates   based   on   factors   currently   known   to   us   and   that   actual   events   or   results   could   differ   materially.   For   important   factors   that   may   cause   actual   results   to   differ   from   those   contained   in   our   forward--looking   statements,   please   review   our   filings   with   the   SEC.   The   forward-- looking   statements   made   in   the   this   presenta:on   are   being   made   as   of   the   :me   and   date   of   its   live   presenta:on.   If   reviewed   aAer   its   live   presenta:on,   this   presenta:on   may   not   contain   current   or   accurate   informa:on.   We   do   not   assume   any   obliga:on   to   update   any   forward   looking   statements   we   may  make.        In  addi:on,  any  informa:on  about  our  roadmap  outlines  our  general  product  direc:on  and  is  subject  to   change   at   any   :me   without   no:ce.   It   is   for   informa:onal   purposes   only   and   shall   not   be   incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga:on  either  to  develop  the  features   or  func:onality  described  or  to  include  any  such  feature  or  func:onality  in  a  future  release.  
2  

Why  are  we  here?  
3  

Why  are  we  here?  
"Oversized  litsearch  is  the  largest  performance   problem  we  face  in  our  environment."    
--  Jacob  Wilkins,  General  Electric  
4  

Why  are  we  here?  
! Observed  search  run  :me  progression  during  development  
!  Massive  growth  in  job  startup  :me   !  Knowledge  Object  op:miza:on  reduced  that  overhead  by  80%  
5  

Who`s  that  guy?  
!  Professional  Services  Consultant,  Cer:fied  Architect,  Splunk--It--All   ! Five  years  at  EMEA  Splunk  Partner   !  Heavy  Splunker  since  2012  
! Get  in  touch  with  me:  mar:n.mueller@consist.de   ! Give  karma  at  Splunk  Answers:   !  Hang  in  #splunk  on  Efnet:  mar:n_m  
6  

Session  Objec:ves  
! Understand  how  Splunk  turns  a  search  into  results   ! Learn  how  to  recognize  if  you  have  a  problem  (Spoiler  Alert:  You  
do!)   !  Use  this  to  your  advantage  when  specifying  search--:me  knowledge  
! Covered  knowledge  objects:  
­ Fields   ­ Reverse  Lookups   ­ Evenmypes   ­ Tags  
7  

Let's  dive  in...  

...but  first,  to  the  Job  Inspector!    
! normalizedSearch:  Ultra--verbose  stage  of  search  assembly  
!  Performance  stats,  e.g.  :me  spent  assembling  the  normalizedSearch  
!  Links  to  search.log  to  look  for  more  hidden  performance  hogs   !  More  at  
hmp://docs.splunk.com/Documenta:on/Splunk/latest/  Knowledge/ Viewsearchjobproper:eswiththeJobInspector  
9  

Fields  
10  

Calculated  Fields  (1)  
!  TA--splunk,  props.conf:    [audittrail] EVAL-action=case(condN, valN, 1=1, action)  
! Splunk`s  assump:on  about  looking  for  indexed  tokens  doesn`t  hold   ! No  way  to  translate  the  eval  expression  into  tokens   ! Plain  Search:  index=_audit action=search
normalizedSearch:  index=_audit (action=search OR (sourcetype=audittrail))
!  Load  all  events  for  that  stanza  plus  events  with  the  token,  filter  later  
11  

Calculated  Fields  (2)  
! What  if  you`re  not  searching  for  that  sourcetype?   ! index=_internal sourcetype=splunk*
action=logout index=_internal sourcetype="splunk*"
(action=logout OR (sourcetype=audittrail))   !  Splunk  expands  each  segment  of  your  search  on  its  own   !  For  each  calculated  field,  add  stanza  to  every  search  for  that  field   !  This  is  only  the  beginning  of  normalizedSearch  overhead!  
12  

Field  Aliases  
! Sourcetype  A  has  field  username,  sourcetype  B  has  field  uid,  ...   !  Field  aliases  can  normalize  this  to  user  over  all  sourcetypes   ! sourcetype=A user=martin  yields  this  normalizedSearch:  
sourcetype=A ( ((sourcetype=A) AND ((username=martin))) OR ((sourcetype=B) AND ((uid=martin))) OR ((sourcetype=audittrail) AND ((uid=martin)))
) OR (user=martin) !  All  field  aliases  for  all  sourcetypes  are  used  in  all  searches!  
13  

A  real--world  example  
!  Splunk  App  for  Enterprise  Security  3.3.1   !  The  TAs  shipped  define  19  field  aliases  for  user ! Your  environment  will  have  addi:onal  TAs   !  Watch  your  normalizedSearch  strings  and  search  startup  :me  grow  
! Let`s  not  forget  the  upside  though:  Without  standardized  field   names,  searching  over  different  sourcetypes  would  be  impossible  
!  Are  you  building  a  TA?  Extract  standardized  field  names  directly!  
14  

A  real--world  example  
! Searching  for  user=martin  yields  2kB  of  normalizedSearch:  
NOT  PRETTY!     
((((sourcetype="*") AND ((username=martin))) OR ((sourcetype=A) AND ((username=martin))) OR ((sourcetype=B) AND ((uid=martin))) OR ((sourcetype="WMI:UserAccounts") AND ((Name=martin))) OR ((sourcetype="WinEventLog:Application:sophos") AND ((User=martin))) OR ((sourcetype="WinEventLog:SophosPatch") AND ((User=martin))) OR ((sourcetype=airdefense) AND ((suser=martin))) OR ((sourcetype=audittrail) AND ((uid=martin))) OR ((sourcetype="aws:cloudtrail") AND (("sourceIdentity.userName"=martin) OR ("userIdentity.sessionContext.sessionIssuer.userName"=martin) OR ("userIdentity.userName"=martin))) OR ((sourcetype=cef) AND ((suser=martin))) OR ((sourcetype="cisco:sourcefire:appliance:syslog") AND ((User=martin))) OR ((sourcetype="cisco:wsa:w3c") AND ((cs_username=martin))) OR ((sourcetype="f5:bigip:asm:syslog") AND ((username=martin))) OR ((sourcetype="f5:bigip:management:usermanagement:icontrol") AND ((get_fullname=martin))) OR ((sourcetype=fs_notification) AND ((uid=martin))) OR ((sourcetype="oracle:session") AND ((USERNAME=martin))) OR ((sourcetype=ps) AND ((USER=martin))) OR ((sourcetype=sav) AND ((LI_USER=martin))) OR ((sourcetype="sophos:appcontrol") AND ((UserName=martin))) OR ((sourcetype="sophos:devicecontrol") AND ((UserName=martin))) OR ((sourcetype="sophos:firewall") AND ((UserName=martin))) OR ((sourcetype="sophos:sec") AND ((UserName=martin))) OR ((sourcetype="sophos:tamperprotection") AND ((UserName=martin))) OR ((sourcetype="sophos:threats") AND ((UserName=martin))) OR ((sourcetype="sophos:utm:ips") AND ((username=martin)))) OR (user=martin) OR (sourcetype="cisco:asa") OR (sourcetype="cisco:fwsm") OR (sourcetype="cisco:pix") OR (sourcetype="oracle:audit:text") OR (sourcetype="oracle:audit:xml"))
15  

DEMO  
16  

Fields  Recap  
! Each  search  segment  is  expanded  on  its  own  without  context   ! props.conf  for  one  sourcetype  will  radiate  into  normalizedSearch  of  
other  sourcetypes  when  field  names  match  
! Avoid  calculated  fields  and  field  aliases  en:rely  where  possible  
­ Extract  fields  using  standardized  names  in  the  first  place!   ­ Some  calculated  fields  can  be  replaced  with  lookups  
!  Monitor  their  effects  where  unavoidable   ! Both  are  fine  for  fields  you  only  use  as  output  
17  

Reverse  Lookups  
18  

How  reverse  lookups  work  
! Automa:c  lookup  in  props.conf:  [splunk_web_access] LOOKUP-ul = user_location user OUTPUT location
!  Reverse  lookup:  Search  for  location  rather  than  user:   index=_internal location="Las Vegas"
!  Splunk  translates  that  into  this  normalizedSearch:   index=_internal (((sourcetype=splunk_web_access) AND ((user=Martin) OR (user=Tom)) )) OR (location="Las Vegas")
19  

Actually,  I  lied...  
index=_internal (((sourcetype=splunk_web_access) AND ((((((sourcetype=A) AND ((username=Martin))) OR
((sourcetype=B) AND ((uid=Martin))) OR ((sourcetype=audittrail) AND ((uid=Martin)))) OR (user=Martin))) OR (((((sourcetype=A) AND ((username=Tom))) OR ((sourcetype=B) AND ((uid=Tom))) OR ((sourcetype=audittrail) AND ((uid=Tom)))) OR (user=Tom)))))) OR (location="Las Vegas")
! Despite  defining  the  lookup  on  splunk_web_access,  other   sourcetypes`  props.conf  sewngs  radiate  into  this  search  
20  

Expanding  to  more  sourcetypes  
! Splunk`s  _internal  index  has  seven  sourcetypes  with  a  user  field  
NOT  PRETTY!   index=_internal (((sourcetype=scheduler) AND ((((((sourcetype=A) AND ((username=Martin))) OR ((sourcetype=B) AND
((uid=Martin))) OR ((sourcetype=audittrail) AND ((uid=Martin)))) OR (user=Martin))) OR (((((sourcetype=A) AND ((username=Tom))) OR ((sourcetype=B) AND ((uid=Tom))) OR ((sourcetype=audittrail) AND ((uid=Tom)))) OR (user=Tom))))) OR ((sourcetype=splunk_btool) AND ((((((sourcetype=A) AND ((username=Martin))) OR ((sourcetype=B) AND ((uid=Martin))) OR ((sourcetype=audittrail) AND ((uid=Martin)))) OR (user=Martin))) OR (((((sourcetype=A) AND ((username=Tom))) OR ((sourcetype=B) AND ((uid=Tom))) OR ((sourcetype=audittrail) AND ((uid=Tom)))) OR (user=Tom))))) OR ((sourcetype=splunk_web_access) AND ((((((sourcetype=A) AND ((username=Martin))) OR ((sourcetype=B) AND ((uid=Martin))) OR ((sourcetype=audittrail) AND ((uid=Martin)))) OR (user=Martin))) OR (((((sourcetype=A) AND ((username=Tom))) OR ((sourcetype=B) AND ((uid=Tom))) OR ((sourcetype=audittrail) AND ((uid=Tom)))) OR (user=Tom))))) OR ((sourcetype=splunk_web_service) AND ((((((sourcetype=A) AND ((username=Martin))) OR ((sourcetype=B) AND ((uid=Martin))) OR ((sourcetype=audittrail) AND ((uid=Martin)))) OR (user=Martin))) OR (((((sourcetype=A) AND ((username=Tom))) OR ((sourcetype=B) AND ((uid=Tom))) OR ((sourcetype=audittrail) AND ((uid=Tom)))) OR (user=Tom))))) OR ((sourcetype=splunkd) AND ((((((sourcetype=A) AND ((username=Martin))) OR ((sourcetype=B) AND ((uid=Martin))) OR ((sourcetype=audittrail) AND ((uid=Martin)))) OR (user=Martin))) OR (((((sourcetype=A) AND ((username=Tom))) OR ((sourcetype=B) AND ((uid=Tom))) OR ((sourcetype=audittrail) AND ((uid=Tom)))) OR (user=Tom))))) OR ((sourcetype=splunkd_access) AND ((((((sourcetype=A) AND ((username=Martin))) OR ((sourcetype=B) AND ((uid=Martin))) OR ((sourcetype=audittrail) AND ((uid=Martin)))) OR (user=Martin))) OR (((((sourcetype=A) AND ((username=Tom))) OR ((sourcetype=B) AND ((uid=Tom))) OR ((sourcetype=audittrail) AND ((uid=Tom)))) OR (user=Tom))))) OR ((sourcetype=splunkd_ui_access) AND ((((((sourcetype=A) AND ((username=Martin))) OR ((sourcetype=B) AND ((uid=Martin))) OR ((sourcetype=audittrail) AND ((uid=Martin)))) OR (user=Martin))) OR (((((sourcetype=A) AND ((username=Tom))) OR ((sourcetype=B) AND ((uid=Tom))) OR ((sourcetype=audittrail) AND ((uid=Tom)))) OR (user=Tom)))))) OR (location="Las Vegas")
21  

DEMO  
22  

A  loca:on  with  more  than  two  users?  
!  50  users  produce  a  72kB  normalizedSearch  that  broke  PowerPoint   ! No:ceable  overhead  during  Parsing Job...  phase   ! That`s  with  three  field  aliases  and  no  calculated  fields  ­  imagine  20+!  
! Above  50  values  per  lookup  Splunk  will  revert  to  ,,classic"behavior:   Load  all  events,  filter  later  
23  

Mi:ga:on  strategies  (1)  
! Subsearch  using  inputlookup  
index=_internal  [inputlookup  user_loca:on  |  search  loca:on="Las  Vegas"  |  fields   user]  
! Removes  the  per--sourcetype  duplica:on   ! Lets  you  choose  between  reverse  lookups  and  classic  behavior   ! Ignores  the  configured  knowledge  per  sourcetype   !  More  effort  required  to  write  and  maintain  searches   !  Not  evenmype--compa:ble   ! Subsearch  overhead  
24  

Mi:ga:on  strategies  (2)  
! Define  the  per--sourcetype  automa:c  lookup  using  sourcetype-- specific  input  fields   LOOKUP-ul = user_location user AS username OUTPUT location
! Removes  the  per--alias  duplica:on   !  Transparent  to  the  search  and  user   !  More  effort  required  to  write  and  maintain  knowledge  objects   ! Retains  the  per--sourcetype  duplica:on  
25  

Removed  80%  of  key--value  pairs   from  the  normalizedSearch!  
26  

Mi:ga:on  strategies  (3)  
! Define  the  per--sourcetype  automa:c  lookup  using  sourcetype-- specific  output  fields   LOOKUP-ul = user_location user OUTPUT location AS sourcetype_location
! Removes  the  per--sourcetype  duplica:on   !  Not  transparent  at  all   !  More  effort  required  to  write  and  maintain  knowledge  objects   ! Only  really  viable  if  hidden  behind  evenmypes  and/or  tags   ! Retains  the  per--alias  duplica:on  
27  

Mi:ga:on  strategies  (4)  
! Replace  per--sourcetype  lookups  with  broader  props.conf  stanzas   !  Wildcards  on  source  or  host  
[source::*access.log*] ! Unofficial:  Wildcards  on  sourcetype  
[(?::){0}splunk*] ! Removes  the  per--sourcetype  duplica:on   !  Transparent  to  the  search  and  user   ! Sourcetype  wildcards  are  neither  documented  nor  supported   ! Retains  the  per--alias  duplica:on  
28  

70%  key--value  pair   reduc:on!  
29  

Indexed  tokens  footnote  
!  The  normalizedSearch  generated  by  reverse  lookups  can  be  efficient:   index=_internal location="Las Vegas"   index=_internal (((sourcetype=splunk_web_access) AND ((user=Martin) OR (user=Tom)) )) OR (location="Las Vegas")
!  But:  Splunk  is  looking  for  a  literal  location="Las Vegas"!   !  Watch  out  for  location=0  or  similar  values  that  aren`t  unique--ish   !  This  can  blow  up  your  scanCount  and  search  dura:on   !  More  on  dealing  with  indexed  tokens  aAer  the  end  of  the  deck  
30  

Evenmypes  
31  

How  evenmypes  work  
!  Store  a  search  filter  or  fragments  thereof  in  a  reusable  box   ! No  pipes,  no  subsearches   !  Run  search  and  see  searchCanBeEventType  in  Job  Inspector   !  eventtype=foo  expands  to  the  stored  search  fragment   !  eventtype=f*  expands  to  an  OR`d  list  of  matching  evenmypes   !  Events  that  match  an  evenmype  have  their  eventtype  field  set,  
regardless  of  whether  the  evenmype  was  used  in  the  search  or  not  
32  

What  are  evenmypes  good  at?  
! Two  different  systems  likely  don`t  log  login  amempts  the  same  way   ! Define  evenmypes  for  each  system,  search  on  evenmypes  
­ Tag  your  evenmypes  and  search  on  tags  
! Configured  knowledge  simplifies  searches   !  Great  way  to  hide  complexity  from  the  searcher   !  Add  systems  to  exis:ng  searches  without  touching  searches   !  Even  when  not  searching  on  evenmypes,  looking  at  the  eventtype  
field  helps  quickly  understand  results  
33  

Splunk  login  example  
!  TA--splunk,  evenmypes.conf:  [splunk_access] search = index=_audit "action=login attempt" NOT "action=search" normalizedSearch:  ((index=_audit "action=login attempt" NOT "action=search"))
!  Note  how  Splunk  chose  not  to  use  action="login attempt"!   ! Avoids  the  wrath  of  calculated  fields  and  aliases  in  the  search   !  Search  relies  on  structure  of  raw  events  instead  of  field  extrac:ons !  The  results  contain  the  CIM--compa:ble  action  regardless    
34  

Tags  
35  

How  tags  work  
! Give  a  set  of  field=value  pairs  a  common  name   ! No  wildcarded  field=v*
­ can  be  worked  around  with  tagged  evenmypes
!  tag=foo  expands  to  the  list  of  field=value  pairs  individually   !  tag=f*  expands  to  an  OR`d  list  of  matching  tags   !  Events  that  match  a  tag  have  their  tag  field  set  accordingly   !  For  each  tagged  field,  addi:onally  set  tag::field  field  
36  

What  are  tags  good  at?  
! Homogenize  system--specific  values  to  allow  unified  searches   !  Great  in  combina:on  with  evenmypes:  
­ Evenmypes  define  system--specific  searches   ­ Tags  on  those  evenmypes  provide  a  common  interface   ­ Searches  on  those  tags  don`t  need  to  know  the  systems  par:cularly  well  
!  Also  great  in  combina:on  with  normalized  field  names  and  values  
­ The  unified  searches  find  events  over  many  systems   ­ The  returned  results  also  provide  homogenous  data  back  to  you  
! That`s  the  Splunk  Common  Informa:on  Model  in  a  nutshell   !  Further  reading  at  hmp://docs.splunk.com/Documenta:on/CIM  
37  

Splunk  login  example  
!  TA--splunk,  tags.conf:  [eventtype=splunk_access] application = enabled authentication = enabled
!  The  search  tag=application tag=authentication  yields   (((index=_audit "action=login attempt" NOT "action=search"))) (((index=_audit "action=login attempt" NOT "action=search")))
!  The  evenmype  is  included  twice!  
38  

How  tags  really  work  
!  Search  for  tag=application tag=authentication !  Splunk  won`t  look  for  field=value  pairs  matching  both  tags   !  Splunk  will  treat  the  search  like  this:  
(tag=application) (tag=authentication)   ! Each  tag  is  expanded  individually   ! field=value  pairs  will  be  included  once  per  matching  tag   !  This  can  lead  to  even  larger  normalizedSearch  strings!  
39  

A  real--world  example  
! Splunk_TA_Oracle  defines  a  handful  of  tagged  evenmypes   ! Four  match  tag=database tag=instance tag=stats ! Expanding  each  tag  on  its  own  yields  sixteen  evenmypes!   !  Every  TA  is  influenced  by  every  other  TA:  ,,Tag  Expansion  Explosion"  
40  

Mi:ga:on  Strategies  
! Avoid  long  lists  of  tags  mapping  to  the  same  field=value
­ Especially  with  evenmypes  and  reverse  lookups  
!  Use  distribu:ve  proper:es  to  reduce  tag--evenmype  redundancy  
­ Instead  of  tagging  every  Splunk  evenmype  with  application,  consider   tagging  sourcetype,  host,  etc.  with  application
­ Instead  of  tagging  special  evenmypes  for  admin  users  with  privileged,   consider  tagging  those  users  or  a  reverse  lookup  field  iden:fying  them  
!  Look  for  what  actually  defines  the  tag  in  the  real  world   ! Charm  Splunk  into  op:mizing  how  tags  are  expanded  J  
41  

Wrapping  up  
42  

Dos  and  Don`ts  
! Don`t  stop  using  field  aliases,  calculated  fields,  reverse  lookups,  etc.     ! Don`t  compromise  maintainability  for  small  gains      !  Do  take  a  good  look  at  your  environment   !  Do  iden:fy  and  improve  real  performance  hogs   !  Do  scope  knowledge  object  sharing  as  narrowly  as  possible   !  Do  clean  up  unused  knowledge  objects  and  TAs   !  Do  keep  monitoring  as  your  knowledge  object  world  grows  
43  

Q&A  
44  

What  Now?    
Related  breakout  sessions  and  ac:vi:es...  
! You  have  access  to  your  Splunk  at  .conf?  Talk  to  me  for  a  quick  look!   !  Grab  the  app:  hmps://splunkbase.splunk.com/app/2871  
   !  Duane  &  George:  Beyond  the  Lookup  Glass  (Tuesday)   ! Amrit  &  Jag:  How  splunkd  Works  (Tuesday)   !  Duncan  &  Julian:  Search  Efficiency  Op:miza:on  (Tuesday)   !  Niklas:  How  to  use  CIM  to  Gain  Security  Awareness  (Wednesday)   ! Dritan:  Notes  on  Op:mizing  Splunk  Performance  (later  today!)  
45  

THANK  YOU  

Fields:  Op:miza:ons   Beyond  Litsearch  
47  

Fields  
"Let  all  values  be  indexed  tokens,  for   indexed  tokens  power  fast  searches."    
--  Splunk,  late  2000s  
48  

Job  Inspector  con:nued  
! base  lispy:  How  did  Splunk  crawl  its  index  for  events?   ! eventCount  /  scanCount:  How  efficient  was  the  lispy--induced  crawl?  
! limits.conf:  [search_info] infocsv_log_level=DEBUG

How  Splunk  searches  for  field  values  (1)  
index=_internal group=tpool ! Assume  a  field  value  is  present  as  indexed  tokens   !  Load  events  containing  those  indexed  tokens  anywhere  
[ AND index::_internal tpool ] ! Apply  field  extrac:ons  and  filter  again  
07-21-2015 22:42:52.662 +0200 INFO Metrics group=tpool, name=indexertpool, qsize=0, ... !  Job  Inspector:  scanCount    eventCount  
50  

How  Splunk  searches  for  field  values  (2)  
index=_internal qsize=0 [ AND index::_internal 0 ] !  Splunk  returns  the  same  event,  but  takes  ages!   07-21-2015 22:42:52.662 +0200 INFO Metrics group=tpool, name=indexertpool, qsize=0, ...  
!  Default  assump:on  works  great  iff  field  values  are  unique--ish  
51  

Key--Value  Tricks  (1)  
index=_internal qsize qsize=0 [ AND index::_internal qsize 0 ] !  Take  advantage  of  default  key--value  field  extrac:ons   07-21-2015 22:42:52.662 +0200 INFO Metrics group=tpool, name=indexertpool, qsize=0, ...  
!  Flexible,  zero--config  speed--up  that  requires  smart  searchers!  
52  

Key--Value  Tricks  (2)  
!  Move  inline  op:miza:on  to  fields.conf   [qsize] INDEXED_VALUE=[AND qsize <VALUE>]
! Adds  the  extra  token  qsize,  whether  the  searcher  likes  it  or  not   index=_internal qsize=0 [ AND index::_internal qsize 0 ]
! fields.conf  applies  to  all  fields  of  that  name,  regardless  of  sourcetype   !  This  can  break  for  mul:--token  values!  
53  

Key--Value  Tricks  (3)  
!  Take  it  further  and  assemble  longer  tokens   [qsize] INDEXED_VALUE=qsize=<VALUE>
! Rule  out  events  with  qsize!=0  that  contain  a  0  elsewhere   index=_internal qsize=0 [ AND index::_internal qsize=0 ]
!  This  will  even  break  for  events  with  qsize="0"  (major  breaker)   ! Be  sure  you  know  your  data  before  fiddling  with  fields.conf!  
54  

Wildcards  (1)  
!  Splunk  will  only  use  indexed  tokens  for  prefixes  of  wildcarded  values   ! index=_internal component=BucketMove*
[ AND index::_internal bucketmove* ] ! index=_internal component=*ucketMover
[ AND index::_internal ] ! Oops!  
07-21-2015 22:41:22.999 +0200 INFO BucketMover idx=main Moving bucket=...
55  

Wildcards  (2)  
!  Force  Splunk  to  use  indexed  tokens   ! index=_internal component=TERM(*ucketMover)
[ AND index::_internal *ucketmover ] !  Much  faster  than  loading  all  events,  but  there`s  a  penalty  for  
crawling  the  index  without  a  prefix!  
! fields.conf  to  remove  the  TERM()  from  all  searches   [component] INDEXED_VALUE=<VALUE>
56  

Fields  Recap  (Part  2)  
! Indexed  tokens  are  king   ! scanCount  performance  hit  when  indexed  tokens  can`t  be  used   ! fields.conf  op:miza:ons  can  fix  performance,  but  can  break  results  
57  

