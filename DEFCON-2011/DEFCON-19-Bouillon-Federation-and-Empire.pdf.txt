Federation & Empire
Emmanuel Bouillon manu@veryopenid.net
DEF CON #19 - 7th August 2011

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
Prefatory notes

$ whoami Having fun in INFOSEC for a while SSTIC, PacSec, BlackHat EU, Hack.lu, #Days CVE-2010-{0283,2229,2914,2941,...}, CVE-2011-{0001,...}
Disclaimer This expresses my own views and does not involve my previous, current and future employers and thus for ten generations Presentation and code provided for educational purpose only

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
Prefatory notes

$ whoami Having fun in INFOSEC for a while SSTIC, PacSec, BlackHat EU, Hack.lu, #Days CVE-2010-{0283,2229,2914,2941,...}, CVE-2011-{0001,...}
Disclaimer This expresses my own views and does not involve my previous, current and future employers and thus for ten generations Presentation and code provided for educational purpose only

E. Bouillon

Federation & Empire

Outline

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

1 Prelude to Federation Introduction
2 Forward the Federation Where we come from
3 Federation What you need to know
4 Federation and Empire Sharpen your weapons
5 Federation's Edge Design assessment
6 Federation and (down to) Earth Conclusion

E. Bouillon

Federation & Empire

Outline

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Introduction

1 Prelude to Federation Introduction
2 Forward the Federation Where we come from
3 Federation What you need to know
4 Federation and Empire Sharpen your weapons
5 Federation's Edge Design assessment
6 Federation and (down to) Earth Conclusion

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
What is it about?
What it is not

Introduction

This relates to SAML Token and Claims based IAM Low level, Pen-tester approach
Won't discuss Formal protocol/API comparison Consistent standards study

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
What is it about?
What it is not

Introduction

This relates to SAML Token and Claims based IAM Low level, Pen-tester approach
Won't discuss Formal protocol/API comparison Consistent standards study

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
Why should you care?

Introduction

Pervasive Cloud Joining a federation usually has severe contractual, legal implications. It's coming your way!

E. Bouillon

Federation & Empire

Outline

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Where we come from

1 Prelude to Federation Introduction
2 Forward the Federation Where we come from
3 Federation What you need to know
4 Federation and Empire Sharpen your weapons
5 Federation's Edge Design assessment
6 Federation and (down to) Earth Conclusion

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
The main problem to solve

Where we come from

User and Administrator friendly cross organization boundaries SSO - here for web apps
Secure Scalable Manageable Privacy / Anonymity
Ideally compliant with the Laws of Identity [5]

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
Historical approaches
The good old time

Where we come from

Account Replication Manual Automated
WHAT? Lose control of accounts, or Have multiple passwords
"Trust" relationships to be established with other realms / domains
All user information shared with federated partners Firewalls need to be opened to allow trust Bilateral  n2 problem - no easy way to establish trust with multiple partners

Privacy / anonymity Anonymity Support for Kerberos [1]

E. Bouillon

Federation & Empire

Outline

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

What you need to know

1 Prelude to Federation Introduction
2 Forward the Federation Where we come from
3 Federation What you need to know
4 Federation and Empire Sharpen your weapons
5 Federation's Edge Design assessment
6 Federation and (down to) Earth Conclusion

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

What you need to know

Federated identity with SAML 101

[8]

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

What you need to know

Federated identity with SAML 101

Security Assertion Markup Language [3] transfer of identity information between organizations that have an established trust relationship
SAML components SAML Assertions / Protocols / Bindings / Profiles Web Browser SSO Profile Identity Provider Discovery Profile

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
What are SAML Assertions?

What you need to know

Signed XML document containing claims or attributes about a user
Collected Claims = Identity
Claims do not need to unambiguously identify user. Only relevant information (e.g. Age > 21, so can buy booze)

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
What it looks like

What you need to know

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
What it looks like

What you need to know

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
What it looks like

What you need to know

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
How is SAML used?

What you need to know

Standards-based (so widely supported), including: XML Encryption, XML Digital Signatures, X.509
Relies on standard HTTP (so passes through firewalls and across Internet)
Local network (not just for Federation!) Branch offices Remote workers But also supports federation (of which more, later)
Supports SSO (no need to remember lots of passwords)
Transparent to user (from web browser or compiled application) single click, and the magic happens!

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
How is SAML used?

What you need to know

Standards-based (so widely supported), including: XML Encryption, XML Digital Signatures, X.509
Relies on standard HTTP (so passes through firewalls and across Internet)
Local network (not just for Federation!) Branch offices Remote workers But also supports federation (of which more, later)
Supports SSO (no need to remember lots of passwords)
Transparent to user (from web browser or compiled application) single click, and the magic happens!

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
How is SAML used?

What you need to know

Standards-based (so widely supported), including: XML Encryption, XML Digital Signatures, X.509
Relies on standard HTTP (so passes through firewalls and across Internet)
Local network (not just for Federation!) Branch offices Remote workers But also supports federation (of which more, later)
Supports SSO (no need to remember lots of passwords)
Transparent to user (from web browser or compiled application) single click, and the magic happens!

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
How is SAML used?

What you need to know

Standards-based (so widely supported), including: XML Encryption, XML Digital Signatures, X.509
Relies on standard HTTP (so passes through firewalls and across Internet)
Local network (not just for Federation!) Branch offices Remote workers But also supports federation (of which more, later)
Supports SSO (no need to remember lots of passwords)
Transparent to user (from web browser or compiled application) single click, and the magic happens!

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
How is SAML used?

What you need to know

Standards-based (so widely supported), including: XML Encryption, XML Digital Signatures, X.509
Relies on standard HTTP (so passes through firewalls and across Internet)
Local network (not just for Federation!) Branch offices Remote workers But also supports federation (of which more, later)
Supports SSO (no need to remember lots of passwords)
Transparent to user (from web browser or compiled application) single click, and the magic happens!

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
How does it work?

What you need to know

1 User requests authentication to web application
2 Redirected (through HTTP GET) to IdP
3 Authenticates to IdP (either through Kerberos or Username/Password)
4 Redirected (through HTTP POST) back to web application, including security token
5 Happy User - no passwords to remember + Happy Administrator - much easier to manage

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
How does it work?

What you need to know

1 User requests authentication to web application

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
How does it work?

What you need to know

2 Redirected (through HTTP GET) to IdP

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
How does it work?

What you need to know

3 Authenticates to IdP (either through Kerberos or Username/Password)

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
How does it work?

What you need to know

4 Redirected (through HTTP POST) back to web application, including security token

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
How does it work?

What you need to know

5 Happy User - no passwords to remember + Happy Administrator - much easier to manage

E. Bouillon

Federation & Empire

So what?

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

What you need to know

In addition to SSO, also supports: Federation - the sharing of identity between domains Delegation - maintenance of identity to backend services Distribution of Directory information to other applications, which gives us:
ABAC (Attribute Based Access Control) = RBAC +
It is the support for Federation that makes the use of SAML suitable for the cloud, and it will become ubiquitous.

E. Bouillon

Federation & Empire

Federation

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

What you need to know

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
Brokered Federation model

What you need to know

Trust through a central Broker, establishes trust between many IdPs But:
How is the trust established? Do we trust all of them? How are standards to be maintained?

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

What you need to know

OASIS SAML V2.0 Technical Overview (draft 3 and 10)

[sic]
[2] SAML use case n.1: "Limitations of Browser cookies" [3] Driver of SAML adoption n.1: "Multi Domain SSO ... However, since browser cookies are never transmitted between DNS domains, ... SAML solves the MDSSO problem."

True issue, legitimate will but... Can also be read as: "SOP sucks, let's build a workaround!"
Great potential for security issues Is it a fail or not? E.g. Can a bad guy steal cookies?
Be patient ;-)

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

What you need to know

OASIS SAML V2.0 Technical Overview (draft 3 and 10)

[sic]
[2] SAML use case n.1: "Limitations of Browser cookies" [3] Driver of SAML adoption n.1: "Multi Domain SSO ... However, since browser cookies are never transmitted between DNS domains, ... SAML solves the MDSSO problem."

True issue, legitimate will but... Can also be read as: "SOP sucks, let's build a workaround!"
Great potential for security issues Is it a fail or not? E.g. Can a bad guy steal cookies?
Be patient ;-)

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
Implementations security

What you need to know

The Good, e.g: Token encryption Replay attacks usually addressed by default

The Bad, e.g: Unsigned LogOut Request accepted TargetAudience attribute not verified

The Ugly, e.g: Open redirection vulnerability Cookie stealing

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
Implementations security

What you need to know

The Good, e.g: Token encryption Replay attacks usually addressed by default

The Bad, e.g: Unsigned LogOut Request accepted TargetAudience attribute not verified

The Ugly, e.g: Open redirection vulnerability Cookie stealing

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
Implementations security

What you need to know

The Good, e.g: Token encryption Replay attacks usually addressed by default

The Bad, e.g: Unsigned LogOut Request accepted TargetAudience attribute not verified

The Ugly, e.g: Open redirection vulnerability Cookie stealing

E. Bouillon

Federation & Empire

Outline

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Sharpen your weapons

1 Prelude to Federation Introduction
2 Forward the Federation Where we come from
3 Federation What you need to know
4 Federation and Empire Sharpen your weapons
5 Federation's Edge Design assessment
6 Federation and (down to) Earth Conclusion

E. Bouillon

Federation & Empire

Tools

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Sharpen your weapons

Tool set usually made of a combination of Pro/Community edition of Commercial tools FOSS Custom scripts
Methodology Procedure (+/-) formal (generic or custom) Generally accepted best practices Habits, personal preferences Still many manual, ad-hoc, improvised steps

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Sharpen your weapons

Exiting SAML oriented helpers

UNINETT beta SAML tracer [11] Firefox Plugin A tool for viewing SAML messages sent through the browser during single sign-on and single logout
Feide RnD SAML 2.0 Debugger [12] Online application to encode/decode SAML message
Federation Lab beta [13] Online automated checks on SP implementation
Manual approach Burp decoder (truncated) Python, ruby
saml = Zlib::Inflate.new(-Zlib::MAX_WBITS).inflate(B... encoded = CGI::escape(Base64::encode64(Zlib::Deflate...

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Sharpen your weapons

Fed Lab Service Provider test

Against an out of the box "Hello world" SP SimpleSAMLphp based

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Sharpen your weapons

Fed Lab Service Provider test

Against an out of the box "Hello world" SP SimpleSAMLphp based

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
Adapt your toolset

Sharpen your weapons

"Don't be a tool" [15] but... Properly using the right tools often makes the difference Time constraint
Two reasons Allow "traditional" assessment of Web applications and Services protected by SAML tokens Configurations of such architectures is crucial yet complex and error prone, so we need tools to assess these configurations criteria are effective

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
Decoding / encoding

Sharpen your weapons

[15] "Things humans arent good at" Decoding / encoding on the fly
Gain of automation Easy semantic understanding Allows relevant request mangling Changes scanner from dumb to smart fuzzer Thwarts anti-reply safeguards (e.g. unique random nonce) Updates timestamps (long scans can unfold)

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
Pre & Post processing

Sharpen your weapons

Same approach as [20] for WCF Binary SOAP Proxy chaining
Preprocessing (decoding requests / encoding responses) Scanning (Fuzz, mangle, do stuff...) Postprocessing (encoding requests / decoding responses)

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Sharpen your weapons

Illustration with Burp Pro Suite

Burp Pro Suite [14] Extender Java API to extend Burp Suite functionalities Particularly suitable for Pre & Post processing Bindings for Python and Ruby (Buby [17])
Buby Ruby based framework to extend Burp Suite Tutorial: [18] Hook either evt proxy message or evt http message
POC Buby modules and sample code at http://code.google.com/p/buby-saml buby -r SAML_preprocessing -e ReqTamperer buby -r SAML_postprocessing -e ReqTamperer

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Sharpen your weapons

Preprocessing proxy - Original request

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Sharpen your weapons

Preprocessing proxy - Edited request

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Sharpen your weapons

Central Burp instance - Intruder

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Sharpen your weapons

Postprocessing proxy - Original request

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Sharpen your weapons

Postprocessing proxy - Edited request

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
Example of vulnerabilities

Sharpen your weapons

Open redirection [21]
http://www.vulnerable.com/?redirect=http://www.attacker.com
Not critical Built in the standards?
Cookie theft
Works even if the victim has not chosen the "Remember" option Demo: Make the SP leaking idpdisco saml lastidp cookie, even if cookie idpdisco saml remember = 0
If you visit his site, a bad guy can inconspicuously discover your IdP = what is your originating organization

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Sharpen your weapons

Demo: SimpleSAMLPHP open redirect
When an open redirect leads to cookie theft

Leveraging an existing live, open to everyone test environment Feide [19]: Norwegian academic Federation on a dummy account

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
Back to the OASIS standard

Sharpen your weapons

Identity Provider Discovery Service Protocol and Profile [22]

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Sharpen your weapons

Identity Provider Discovery Service Protocol and Profile

[21]

[sic]
"This protocol has the potential for creating additional opportunities for phishing..." Proposed workaround: use of SP metadata "To mitigate this threat, metadata can be used to limit the sites authorized to use a discovery service" "A discovery service SHOULD require that the service providers making use of it supply metadata"

Developers don't have to implement it to be compliant [23]

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Sharpen your weapons

Identity Provider Discovery Service Protocol and Profile

[21]

[sic]
"This protocol has the potential for creating additional opportunities for phishing..." Proposed workaround: use of SP metadata "To mitigate this threat, metadata can be used to limit the sites authorized to use a discovery service" "A discovery service SHOULD require that the service providers making use of it supply metadata"

Developers don't have to implement it to be compliant [23]

E. Bouillon

Federation & Empire

Outline

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Design assessment

1 Prelude to Federation Introduction
2 Forward the Federation Where we come from
3 Federation What you need to know
4 Federation and Empire Sharpen your weapons
5 Federation's Edge Design assessment
6 Federation and (down to) Earth Conclusion

E. Bouillon

Federation & Empire

New risks?

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Design assessment

Previous boundaries become more and more notional Network flows Attack surface Management interface Users community Insider? Data flows
Cost/Benefit not doing it? Security policy comparison / enforcement

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Design assessment

Considerations on deployment architectures
Typical situations

Web Browser SSO Profile
SP-Initiated SSO
Redirect/POST Bindings

Figure 15 of [3]

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Design assessment

Similar flows orchestrated in federated environment
simple federation scenario [24]

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Design assessment

Similar flows orchestrated in federated environment

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Design assessment

What if OrgC signs a claim for userA@orgA.net?

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Design assessment

Considerations on deployment architectures
Trust topology

Previous example follows a direct trust topology

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Design assessment

Considerations on deployment architectures
Trust topology

More complex exist including indirect trust topology

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Design assessment

Considerations on deployment architectures
Trust topology

More complex exist including indirect trust topology

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Design assessment

What if OrgC signs a claim for userA@orgA.net?
SAML claims laundering

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
SAML claims laundering

Design assessment

Questions usually unasked and even less answered: What about a malicious/compromised IdP in the federation?
Can a malicious IdP impersonate another domain users? Are there safeguards in place? Do I own or delegate these safeguards? What about a malicious/compromised SP in the federation?
Control the loss of control Whose liability Other parties obligation (accountability)

E. Bouillon

Federation & Empire

Outline

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Conclusion

1 Prelude to Federation Introduction
2 Forward the Federation Where we come from
3 Federation What you need to know
4 Federation and Empire Sharpen your weapons
5 Federation's Edge Design assessment
6 Federation and (down to) Earth Conclusion

E. Bouillon

Federation & Empire

Conclusion

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Conclusion

Take-aways
Knowledge and tool to keep on powning SAML protected Web app Proven assumption: Standards can be read as an attempt to circumvent SOP
Process and tools to get there Important design security considerations
Without taking care, "Insecurity by design" is more than likely E.g. Cross domain SSO with AD trust relationships
A compromised domain cannot impersonate other domains users With SAML based cross domain SSO, by default, it will

E. Bouillon

Federation & Empire

Conclusion

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth

Conclusion

This apply to other form of federation with very few adaptation
Developers, marketers ahead of security guys in this area. Yet default settings are not secure. The "make it working" approach might lead to insecure deployment. We need to catch up to avoid big deployment security failure (with probably thorny legal issues)
Get acquainted with protocols to properly assess designs and deployments Adapt our tool set because bad guys will
Incidentally some of these issues would also be solved more easily with a standardized solution as opposed to custom based checks by diligent administrators

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
Thanks for your attention

Conclusion

Acknowledgment Isaac Asimov Rui Fiske for his great help and extensive knowledge on SAML
Q & possibly A Buby modules and sample code at http://code.google.com/p/buby-saml
manu@veryopenid.net

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
References I

Conclusion

[1] Anonymity Support for Kerberos - draft-ietf-krb-wg-anon-04 - Kerberos extension
[2] Security Assertion Markup Language (SAML) 2.0 Technical Overview (draft 3) OASIS - http://www.oasis-open.org/committees/download.php/11511/ sstc-saml-tech-overview-2.0-draft-03.pdf
[3] Security Assertion Markup Language (SAML) 2.0 Technical Overview (draft 10) - OASIS - http://www.oasis-open.org/committees/download.php/20645/ sstc-saml-tech-overview-2%200-draft-10.pdf
[4] D. Hardt - Identity 2.0 - OSCON 2005 Keynote http://identity20.com/media/OSCON2005/
[5] K. Cameron - The Laws of Identity - http: //www.identityblog.com/stories/2005/05/13/TheLawsOfIdentity.pdf
[6] R. Anderson - Can We Fix the Security Economics of Federated Authentication? - http://www.cl.cam.ac.uk/~rja14/Papers/sefa-pr11.pdf

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
References II

Conclusion

[7] C. Soghoian - Caught in the Cloud: Privacy, Encryption, and Government Back Doors in the Web 2.0 Era http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1421553
[8] B. Hill - Attacking XML Security - Black Hat Briefings USA 2007 - http://www. isecpartners.com/files/iSEC_HILL_AttackingXMLSecurity_bh07.pdf
[9] Myth Breaker - The Best Open Source Web Application Vulnerability Scanner http://sectooladdict.blogspot.com/2011/01/ myth-breaker-best-open-source-web.html
[10] Web Application Scanner Benchmark (v1.0) http://sectooladdict.blogspot. com/2010/12/web-application-scanner-benchmark.html
[11] UNINETT releases public beta of SAML tracer https://addons.mozilla.org/en-US/firefox/addon/saml-tracer/
[12] Feide RnD SAML 2.0 Debugger https://rnd.feide.no/software/saml_2_0_debugger/

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
References III

Conclusion

[13] Federation Lab beta - https://fed-lab.org/
[14] Burp Suite - http://portswigger.net
[15] J. Haddix, J. Parish - ToorCon 12 http://www.securityaegis.com/burp_preso.pdf
[16] J. Haddix, J. Parish - Bsides Chicago 2011 - http: //www.securityaegis.com/wp-content/uploads/2011/04/bsides_final.ppt
[17] Buby's homepage - http://emonti.github.com/buby
[18] Buby tutorial - K. Johnson - http://carnal0wnage.attackresearch.com/ 2011/05/buby-script-basics-part-1.html
[19] Feide - http://www.feide.no
[20] WCF Binary Soap Plug-In for Burp - Gotham Digital Science - http://www. gdssecurity.com/l/b/2009/11/19/wcf-binary-soap-plug-in-for-burp/
[21] OWASP Open Redirect - https://www.owasp.org/index.php/Open_redirect

E. Bouillon

Federation & Empire

Prelude to Federation Forward the Federation
Federation Federation and Empire
Federation's Edge Federation and (down to) Earth
References IV

Conclusion

[22] Identity Provider Discovery Service Protocol and Profile - OASIS - http://docs. oasis-open.org/security/saml/Post2.0/sstc-saml-idp-discovery.pdf
[23] Support metadata DiscoveryResponse for discovery service - SimpleSAMLphp issue 363 http://code.google.com/p/simplesamlphp/issues/detail?id=363
[24] Web Services Federation Language (WS-Federation) Version 1.2 - OASIS http://docs.oasis-open.org/wsfed/federation/v1.2/ws-federation.pdf

E. Bouillon

Federation & Empire

