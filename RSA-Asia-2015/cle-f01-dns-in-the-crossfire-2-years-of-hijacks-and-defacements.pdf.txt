SESSION ID: CLE-F01
DNS in the Crossfire: 2 Years of Hijacks and Defacements

Michael Smith
APJ Security CTO Akamai Technologies @rybolov

#RSAC

#RSAC
DNS Hierarchy

Root/"The Dot"

.sg. .com.sg.

Registrar

.foo.com.sg.

www.foo.com.sg.

DNS Resolver

2

#RSAC
Whois akamai.com

$ whois akamai.com | grep '^Name Server' Name Server: A1-66.AKAM.NET Name Server: A11-66.AKAM.NET Name Server: A13-66.AKAM.NET Name Server: A28-66.AKAM.NET Name Server: A16-66.AKAM.NET Name Server: A7-66.AKAM.NET ......

These are all glue records

3

#RSAC
Glue Record TTL

$dig +trace www.akamai.com

.

56955 IN NS f.root-servers.net.

com.

172800 IN NS e.gtld-servers.net.

akamai.com. 172800 IN NS a5-66.akam.net.

4

#RSAC
Case Study 1: Oops, Premature Expiration
 Catch expired domains and kite them  Registrar expires domains early  ~1500 Domains hijacked  Chaos ensues  Multiple mitigation streams
5

#RSAC
Basic CDN and DNS Operation
6

#RSAC
The Magic of DNS CNAMEs and TTLs
$ dig www.akamai.com
;; ANSWER SECTION: www.akamai.com. 20 IN CNAME
wwwsecure2.akamai.com.edgekey.net. wwwsecure2.akamai.com.edgekey.net. 1576 IN CNAME e8921.dscx.akamaiedge.net. e8921.dscx.akamaiedge.net. 6 IN A 23.74.224.166
7

#RSAC
Case 2: SEA Brings us "Hacksgiving"
8

#RSAC
Hacksgiving Details
 Hijack of "monetization service"  Served JavaScript with url rewrite  Services delivered from the SEA webservers  40+ Sites impacted  2 Incident workflows
 Restore hijacked domain  Disable content on customer's sites and republish
9

#RSAC
Basic CDN and DNS Operation
10

#RSAC
Case 3: Lizard Squad
11

#RSAC
Lizard Squad Domain Hijacks
 Compromised registrar or phishing domain logins  Change domain NS glue records  Set up MX record and capture email  Build infrastructure
 DNS zone on service provider  Defacement page on CDN  Email server
12

#RSAC
Whois => Spear Phishing
$ whois akamai.com | grep \@ Registrar Abuse Contact Email: domainabuse@tucows.com Reseller: hostmaster@akamai.com Registrant Email: hostmaster-billing@akamai.com Admin Email: hostmaster-billing@akamai.com Tech Email: hostmaster-billing@akamai.com Akamai Technologies, hostmaster@akamai.com
13

#RSAC
The Phish
Akamai Technologies
Your domain, akamai.com is due to expire. Please <a href=www.wecaptureyourlogin.net>login to renew this domain</a>
Thank you --Your Registrar
14

#RSAC
How Akamai Changed Their Operations
 Forward to Origin SSL  Alerts for minimum traffic level  Edge server DNS purge  Content purging  AkaRegistrar  Portal 2-factor/SAML/ACL access control
15

#RSAC
Prevention and Application
 Lock your domains, lock your domains, lock your domains  Whois privacy  site:github.com dns monitoring  2FA on registrars and other providers  Anti-phishing training for IT admins  Ready to disable third-party content  2FA on email, VPN
16

#RSAC
Domain Hijacking Countermeasures
ClientUpdateProhibited ClientTransferProhibited ClientDeleteProhibited
ServerUpdateProhibited ServerTransferProhibited ServerDeleteProhibited
17

#RSAC
Thank You
18

