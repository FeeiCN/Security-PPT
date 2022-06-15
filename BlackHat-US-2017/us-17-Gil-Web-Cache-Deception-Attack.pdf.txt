WEB CACHE DECEPTION ATTACK
Omer Gil

No SID

About me
· Omer Gil · 28 · Married + Java · PT team leader at EY · Student

@omer_gil

omergil.blogspot.com

About caching

About caching
CDN

About caching
CDN

About caching
CDN

About caching
Load Balancer

About caching
Load Balancer

About caching
Load Balancer

About caching
Load Balancer

About caching
DMZ
Reverse Proxy

About caching
DMZ
Reverse Proxy

About caching
https://www.example.com/stylesheet.css
Stylesheet.css

About caching
https://www.example.com/stylesheet.css

Stylesheet.css

Stylesheet.css

About caching
https://www.example.com/stylesheet.css
Stylesheet.css

About caching
https://www.example.com/stylesheet.css
Stylesheet.css

Servers' reactions
http://www.example.com/account.php /nonexistent.css

The Spanner: http://www.thespanner.co.uk/2014/03/21/rpo/ XSS Jigsaw: http://blog.innerht.ml/page/2/

account.php

Servers' reactions
http://www.example.com/account.php /nonexistent.css
account.php

Getting down to business
"Hey, access https://www.bank.com/account.do/stylesheet.css"
WAF!

Getting down to business
The user browses to https://www.bank.com/account.do/stylesheet.css

Getting down to business
https://www.bank.com/account.do/stylesheet.css returns with the content of account.do and the private page is cached

Getting down to business
The attacker browses to https://www.bank.com/account.do/stylesheet.css and gets the content of the user's account.do page

Getting down to business
The attacker browses to https://www.bank.com/account.do/stylesheet.css and gets the content of the user's account.do page

Demo

Conditions
· Web cache functionality is set for the web application to cache static files based on their extensions, disregarding any caching header.
· When accessing a page like http://www.example.com/home.php/nonexistent.css, the web server will return the content of home.php for that URL.
· Victim has to be authenticated while accessing the triggering URL.

Why the HELL #1 would a web application react like this?

Why the HELL #1

Django:

http://www.sampleapp.com/inbox/

Why the HELL #1

Django:

http://www.sampleapp.com/inbox/test.css

urls.py

Why the HELL #1

Django:

http://www.sampleapp.com/inbox.css

urls.py

Why the HELL #1

Django:

http://www.sampleapp.com/inbox/test.css

urls.py

Why the HELL #2 would a caching mechanism react like this?

Why the HELL #2
IIS ARR:

Why the HELL #2

IIS ARR:

http://www.sampleapp.com/welcome.php/test.css

Why the HELL #2

IIS ARR:

http://www.sampleapp.com/welcome.php/test.css

Why the HELL #2
Cloudflare:
· Eligibility phase class, css, jar, js, jpg, jpeg, gif, ico, png, bmp, pict, csv, doc, docx, xls, xlsx, ps, pdf, pls, ppt, pptx, tif, tiff, ttf, otf, webp, woff, woff2, svg, svgz, eot, eps, ejs, swf, torrent, midi, mid
https://blog.cloudflare.com/understanding-our-cache-and-the-web-cache-deception-attack/ https://blogs.akamai.com/2017/03/on-web-cache-deception-attacks.html

Why the HELL #2

Cloudflare:
· Disqualification phase

`Edge cache expire TTL' to the rescue!

Why the HELL #2
Cloudflare:
https://blog.cloudflare.com/edge-cache-expire-ttl-easiest-way-to-override/

Mitigation
· Only cache files if their HTTP caching headers allow · Store all static files in a designated directory · Cache files by their content type · Don't accept this! http://www.example.com/home.php/non-existent.css.
Return 302 or 404 instead

THANKS

@omer_gil omergil.blogspot.com

Icon vectors created by Freepik.com

