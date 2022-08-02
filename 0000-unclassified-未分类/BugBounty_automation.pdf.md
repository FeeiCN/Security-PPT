BUG BOUNTY AUTOMATION
Sergey Bobrov @Black2Fan

Bug Bounty programs with sites in scope: HackerOne ­ 150+ Bugcrowd ­ 100+ Other ­ 100+
In each from 1 to several thousand sites My database contains 36000+ sites

Why?

Why?

Program Policy

Automation

Magic

Vulnerabilities

whitelist.example.com

Program Policy

Domains List

Tasks Queue Initial Checks
Module #1
Module #2

*.example.com Subdomains Dumper

Module #N
Check for changes

Automation

Controversial Situations

Search and Analysis

Passive Checks

Database

Vulnerabilities

Notifications

whitelist.example.com

Program Policy

Domains List

Tasks Queue Initial Checks
Module #1
Module #2

*.example.com Subdomains Dumper

Module #N
Check for changes

Automation

Controversial Situations

Search and Analysis

Passive Checks

Database

Vulnerabilities

Notifications

Subdomains Dumper
Bug Bounty Program Policy Parsing
There may be different conditions:
· Full prohibition of automatic scanning · Adding a custom header · Proxy access

Subdomains Dumper
Daily for *.example.com
· crt.sh/?q=%.example.com · DNS bruteforce · Shodan API · Virustotal API · SubjectAltName in certificates · Links in HTTP responses
https://pentester.land/cheatsheets/2018/11/14/subdomains-enumeration-cheatsheet.html

Subdomains Dumper

Subdomains Dumper
Export updates to Bitbucket, Telegram

whitelist.example.com

Program Policy

Domains List

Tasks Queue Initial Checks
Module #1
Module #2

*.example.com Subdomains Dumper

Module #N
Check for changes

Automation

Controversial Situations

Search and Analysis

Passive Checks

Database

Vulnerabilities

Notifications

Collect information for new sites
· Screenshot · Nmap · Dig · HTTP/HTTPS response · Directory Bruteforce

Initial Checks

whitelist.example.com

Program Policy

Domains List

Tasks Queue Initial Checks
Module #1
Module #2

*.example.com Subdomains Dumper

Module #N
Check for changes

Automation

Controversial Situations

Search and Analysis

Passive Checks

Database

Vulnerabilities

Notifications

Check for changes
Recheck site in case of change
· CNAME · HTTP status code · Site of the HTTP response by 20-30% · HTTP / HTTPS availability
As a result, ~200 sites out of 36k are rechecked every day.

whitelist.example.com

Program Policy

Domains List

Tasks Queue Initial Checks
Module #1
Module #2

*.example.com Subdomains Dumper

Module #N
Check for changes

Automation

Controversial Situations

Search and Analysis

Passive Checks

Database

Vulnerabilities

Notifications

Modules
Basic principles
· The most simple vulnerabilities · It's pointless to compete with other scanners in classic vulnerabilities
/* XSS via GET parameter */

Module example #1
CRLF Injection
HTTP/1.1 301 Moved Permanently Server: awselb/2.0 ... Location: https://example.com/$client_input$
https://2017.zeronights.org/wp-content/uploads/materials/ZN17_Karbutov_CRLF_PDF.pdf

Module example #1
CRLF Injection
/%0DXTest%3Acrlftest /%0AXTest%3Acrlftest /?%0DXTest%3Acrlftest=test /%3F%0AXTest%3Acrlftest=test /%0AXTest%3Acrlftest/..
Regexp
[\r\n]XTest

Module example #1

Nginx misconfiguration

$uri, $document_uri ­ normalized variables

/foo%20bar/baz/%2e%2e/ => /foo bar/

return 302 https://$host$uri; => CRLF Injection

http://blog.volema.com/nginx-insecurities.html

thx @kyprizel

Module example #1
Nginx misconfiguration
location ~ /v1/((?<action>[^.]*)\.json)?$ { add_header X-Action $action; => CRLF Injection
GET /v1/%0d%0aXTest:test.json HTTP/1.0
https://github.com/yandex/gixy/blob/master/docs/en/plugins/httpsplitting.md

Module example #1
CRLF Injection
/%0DXTest%3Acrlftest /%0AXTest%3Acrlftest /?%0DXTest%3Acrlftest=test /%3F%0DXTest%3Acrlftest=test (works more often than others on Apache) /%0AXTest%3Acrlftest/..
Regexp
[\r\n]XTest

Module example #1

Result:
Apache httpd mod_alias < 2.4.25 CRLF Injection (CVE-???)

RedirectMatch "/xxx/(.*)" "/yyy/$1"

/xxx/x%0Dx?x%0Dx /xxx/x%3F%0DXTest:test /xxx/x%23%0DXTest:test

=> /yyy/x%0Dx?x%0Dx => CRLF Injection => CRLF Injection

Module example #1

Bonus:
Apache httpd mod_userdir CRLF Injection (CVE-2016-4975)

UserDir "http://example2.com/*"

/~user/file /~user/%0D%0AXTest:test

=> http://example2.com/user/file => CRLF Injection

Module example #2

Open Redirect
Redirect from /folder to /folder/

HTTP/1.1 302 Found Server: nginx ... Location: /$user_input$/

//example.com/ Protocol-relative URL

http://homakov.blogspot.com/2014/01/evolution-of-open-redirect-vulnerability.html

Module example #2
Open Redirect
//redirect //redirect/%2F.. ///redirect /%5Credirect //redirect/..;/css
Regexp Location:\s*(?:|[\\\\\/\x09]{2,}|https?:\/\/)redirect

Module example #2
Open Redirect
//redirect //redirect/%2F.. (works more often than others on Node.js) ///redirect /%5Credirect //redirect/..;/css (works more often than others on Tomcat)

Module example #2
Result:
Node.js serve-static < 1.7.2 Open Redirect (CVE-2015-1164) GET //google.com/%2F.. HTTP/1.1 Location: //google.com/%2F../

Module example #2
Result:
Apache Tomcat < 9.0.12 Open Redirect (CVE-2018-11784) By Default: mapperContextRootRedirectEnabled=true mapperDirectoryRedirectEnabled=false false = Open Redirect

Module example #2

Apache Tomcat < 9.0.12 Open Redirect (CVE-2018-11784)

//example.com/..;/%existing_folder% //example.com/..;/docs/config //example.com/..;/examples/jsp //%existing_folder%;@example.com

(by @_skiddy44)

Location: //example.com/..;/docs/config/

Module example #2
Apache Tomcat < 9.0.12 Open Redirect (CVE-2018-11784)
useRelativeRedirects=false //example.com/..;/css Location: http://example.com/..;/css/

Module example #3
Nginx alias path traversal (off-by-slash)
root /var/www/public/; location /img {
alias /var/www/images/; } http://example.com/img../.env /var/www/images/../.env

Module example #3

Nginx alias path traversal (off-by-slash) checks

GET /static
GET /static. GET /static..
GET /static...

=> 30X redirect /static/ => 30X redirect /static./ => 30X redirect /static../ => 200 | 404

Module example #3
Nginx alias path traversal (off-by-slash)

whitelist.example.com

Program Policy

Domains List

Tasks Queue Initial Checks
Module #1
Module #2

*.example.com Subdomains Dumper

Module #N
Check for changes

Automation

Controversial Situations

Search and Analysis

Passive Checks

Database

Vulnerabilities

Notifications

Passive checks

Passive checks
Checks that do not require sending additional requests to the attacked server

Search in HTTP responses:

· Stacktrace, full path disclosure · Debug mode · Subdomain takeover fingerprint

https://github.com/EdOverflow/can-i-take-over-xyz

Vulnerability example

Vulnerability example
Dig returned a different result and the site was queued for rechecking

Vulnerability example

toolbox.tesla.com

CNAME toolbox.tb.tesla.services.

toolbox.tb.tesla.services. A

amazon s3 ip

toolbox.tb.tesla.services -> 403 amazon s3 bucket

toolbox.tesla.com

-> 404 NoSuchBucket

Vulnerability example
$1337

whitelist.example.com

Program Policy

Domains List

Unexpected vulnerabilities

Tasks Queue Initial Checks
Module #1
Module #2

Controversial Situations

Search and Analysis

Passive Checks

Database

Vulnerabilities

*.example.com Subdomains Dumper

Module #N
Check for changes

Notifications

Unexpected vulnerabilities #1

All responses are passed through the passive checks module

http://example.com/

=> 200 OK

http://example.com/assets/blah.js

=> 200 OK

"Nginx alias path traversal" module checks:

http://example.com/assets.

=> 404 NoSuchBucket

http://example.com/assets..

=> 404 NoSuchBucket

WTF?

Unexpected vulnerabilities #1
Invalid request proxying rule
http://example.com/assets-foo-bar/test.html <Code>NoSuchBucket</Code> <Message>The specified bucket does not exist</Message> <BucketName>some-bucket-static-foo-bar</BucketName>

Unexpected vulnerabilities #2

All responses are passed through the passive checks module

http://example.com/

=> 200 OK

http://example.com/assets/x.js

=> 200 OK

"Node.js server side js disclosure" module checks

http://example.com/assets/server.js => 422 Exception

http://example.com/assets/app.js

=> 422 Exception

WTF?

Unexpected vulnerabilities #2

Unexpected vulnerabilities #2
I already saw this Exception
https://blog.blackfan.ru/2018/01/pda-test.yandex.ru-file-reading.html
CTRL+C CTRL+V

Unexpected vulnerabilities #2
Timeline:
27.09.18 ­ Vulnerability found and sent to Yandex xx.10.18 ­ Vulnerability fixed 12.11.18 ­ «We are unable to reproduce vulnerability»

whitelist.example.com

Program Policy

Domains List

Unexpected vulnerabilities #2

Tasks Queue Initial Checks
Module #1
Module #2

Controversial Situations

Search and Analysis

Passive Checks

Database

Vulnerabilities

*.example.com Subdomains Dumper

Module #N
Check for changes

Notifications

Manual Bug Hunting
Why manual bug hunting is better?
One vulnerability == same amount of money as for 6 months of automated vulnerability scanning ¯\_()_/¯

THANKS FOR ATTENTION
@Black2Fan

