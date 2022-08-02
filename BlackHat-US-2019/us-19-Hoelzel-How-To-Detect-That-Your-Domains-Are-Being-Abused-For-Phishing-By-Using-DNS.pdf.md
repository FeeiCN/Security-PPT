Karl Lovink
Dutch Tax and Customs Administration
Arnold Hölzel
SMT Simple Management Technologies
How to detect that your domains are being abused for phishing attacks by using DNS

About us

Karl Lovink

Arnold Hölzel

Technical Lead SOC

Senior Security

Dutch Tax and Customs

Consultant

Administration

Simple Management

kw.lovink@belastingdienst.nl

Technologies

arnold.holzel@smtware.com

2

What can we do to combat phishing attacks?
 Why is fighting phishing so important?  Damage for citizens and businesses;  Losing trust in the relationship between the Taxpayer and the Dutch Tax and Customs Administration.
 Important to discover phishing campaigns as soon as possible.  Break the money circle, it's all about money.
3

Some phishing examples
Van: Belastingdienst <belastingaangifte@belastingdienst.nl> Datum:23-08-2015 11:05:10 CEST Aan: xxxxxx@planet.nl Onderwerp: Belastingaangifte 2014
Bij controle van onze administratie hebben wij geconstateerd dat er een betalingsachterstand is ontstaan van uw belastingaangifte 2014. Wij hebben geprobeerd om het openstaande bedrag te incasseren, helaas is dit niet gelukt op het rekeningnummer dat bij ons bekend staat. Het huidige openstaande bedrag bedraagt 83,04 euro. U ontvangt ook een schriftelijke herinnering die vandaag per post is verstuurd. Thans verzoeken wij u vriendelijk om dringend het openstaand bedrag van ... Te betalen u kunt het bedrag overmaken naar bankrekeningnummer NL62ABNA XXXXXXXXX tnv belastingdienst" onder vermelding van betalingskenmerk BTW038372293N Als u deze betaling heeft voldaan kunt u de brief als niet verzonden beschouwen. Als u binnen acht dagen deze rekening niet heeft voldaan dan verzenden wij geen aanmaning en hierbij worden incasso kosten gerekend Ik hoop u voldoende geinformeerd te hebben. Wij zien uw betaling graag tegemoet en danken u voor uw medewerking.
Met vriendelijke groet, Robert Versteegen Directeur Belastingdienst N.B. Dit is een automatisch verzonden e-mail, het is niet mogelijk deze e-mail te beantwoorden.
4

And now!
 Starting points:  Change may not impact the business.  Using standards:  STARTTLS;  DNS-based Authentication of Named Entities;  SMTP MTA Strict Transport Security;  Sender Policy Framework;  DomainKeys Identified Mail;  Domain-based Message Authentication, Reporting and Conformance.
5

STARTTLS
 STARTTLS is used to upgrade an un-secure connection to a secure connection.  Used between mail servers to communicate over un-secure networks.  Adding encryption to the un-secure connection.  More info:
 RFC3207 - SMTP Service Extension for Secure SMTP over Transport Layer Security.
6

DNS-Based Authentication of Named Entities
 DANE = DNS-Based Authentication of Named Entities.  DANE allows to advertise TLS support through a TLSA TXT resource record.  More info:
 RFC6698 - DNS-Based Authentication of Named Entities;  RFC7672 - DANE for SMTP.
7

DNS-Based Authentication of Named Entities
 Example: belastingdienst.nl  TLSA TXT resource record:
_25._tcp.smtp1.belastingdienst.nl. IN TLSA 3 1 1 b169456b9f12cecc88bfdc9e82dc4f2546a779e6cad0be9751d12e51654e898a
_25._tcp.smtp2.belastingdienst.nl. IN TLSA 3 1 1 b3c1e98bf0c76de6af8905755fcd073400d99503de9c699b4b8f232b9b36b02b
8

SMTP Mail Transfer Agent Strict Transport Security
 MTA-STS = Mail Transfer Agent Strict Transport Security.  MTA-STS allows a receiving mail domain to publish their TLS policy.  More info:
 RFC8461 - SMTP Mail Transfer Agent Strict Transport Security;  RFC8460 - SMTP TLS Reporting.  RFC published September 2018.  Implementation:  gmail.com April 2019;  belastingdienst.nl June 2019.
9

SMTP Mail Transfer Agent Strict Transport Security

 Example: belastingdienst.nl

 MTA-STS/TLS-RPT resource records:

mta-sts.belastingdienst.nl.

IN A 85.159.98.22

_mta-sts.belastingdienst.nl.

IN TXT "v=STSv1; id=20190509101840"

_smtp._tls.belastingdienst.nl. IN TXT "v=TLSRPTv1;\

rua=mailto:mta-sts@belastingdienst.nl"

10

SMTP Mail Transfer Agent Strict Transport Security
 Example: belastingdienst.nl  URL: https://mta-sts.belastingdienst.nl/.well-known/mta-sts.txt
 MTA-STS Policy file:
version: STSv1 mode: testing mx: smtp1.belastingdienst.nl mx: <additional MX records> max_age: 86400
11

SMTP MTA-STS Reporting ­ The GOOD
{"organization-name":"Google Inc.", "date-range":{ "start-datetime":"2019-05-08T00:00:00Z", "end-datetime":"2019-05-08T23:59:59Z"}, "contact-info":smtp-tls-reporting@google.com, "report-id":"2019-05-08T00:00:00Z_belastingdienst.nl", "policies":[ {"policy": {"policy-type":"sts", "policy-string":[ "version: STSv1", "mode: testing", "mx: <MX records>", "max_age: 10368000"], "policy-domain":"belastingdienst.nl" }, "summary":{ "total-successful-session-count":1
} } ] }
12

SMTP MTA-STS Reporting ­ The BAD
{"organization-name":"Google Inc.", . . . . . . "summary": { "total-failure-session-count": 1 }, "failure-details": [ { "result-type": "starttls-not-supported", "sending-mta-ip": "192.51.100.45", "receiving-ip": "203.0.113.90", "receiving-mx-hostname": "smtp.example.com", "failed-session-count": 1 } ] . . . . . .
}
13

Sender Policy Framework
 SPF = Sender Policy Framework.  Validates if an e-mail is sent from a valid IP address or domain.  Check is done against SPF TXT resource records in the DNS.  More info: RFC7208 - Sender Policy Framework (SPF), Version 1.
14

Sender Policy Framework
 Paragraph 7.2 ­ Macro Definitions.  You need access to your DNS query and response log.  0.049% of registered domains have macros in their SPF TXT records*.
 Gives you an e-mail track-and-trace system.
* Source: https://spf-all.com/stats.html
15

Sender Policy Framework
 Because of the macros in the SPF TXT resource records we can see:  %s - Sender;  %h - HELO/EHLO of the sending mail server;  %l - Local-part of the sending e-mail address;  %o - Domain-part of the sending e-mail address;  %i - IP address of the receiving mail server.
 Be aware: %l and %s will introduce a privacy-issue! Mail addresses in resolver logs.
16

Sender Policy Framework
 Example: belastingdienst.nl  Basic SPF implementation.  SPF TXT resource record:
belastingdienst.nl IN TXT v=spf1 mx a:mailer1.belastingdienst.nl a:mailer2.belastingdienst.nl a:smtp11.belastingdienst.nl a:smtp12.belastingdienst.nl ­all
 Do not forget your subdomains! (and there subdomains, and there....)
*.belastingdienst.nl IN TXT "v=spf1 ­all" *.acc.belastingdienst.nl IN TXT "v=spf1 ­all"
17

Sender Policy Framework
 Example: belastingdienst.nl  Advanced SPF implementation with macros.  The SPF redirect resource record:
belastingdienst.nl. IN TXT "v=spf1 redirect=_spf.belastingdienst.nl"
 The SPF exists resource record and macros:
_spf.belastingdienst.nl IN TXT "v=spf1 \ exists:_i.%{i}._h.%{h}._o.%{o}._spf.belastingdienst.nl -all"
_i.85.159.101.15._h.smtp2.belastingdienst.nl._o.belastingdienst.nl.\ _spf.belastingdienst.nl. IN A 127.0.0.1
_i.85.159.101.15._h.belastingdienst.nl._o.belastingdienst.nl.\ _spf.belastingdienst.nl. IN A 127.0.0.1
18

Sender Policy Framework ­ The Good
19

Sender Policy Framework ­ The Bad
20

DomainKeys Identified Mail
 DKIM = DomainKeys Identified Mail.  Signs body and selected parts of the SMTP header.  Signature is transmitted in a DKIM-signature header.  Public DKIM key is stored in the DNS as a TXT resource record.  More info: RFC6376 - DomainKeys Identified Mail (DKIM) Signatures.
21

DomainKeys Identified Mail
 Example: belastingdienst.nl:201707  A DKIM selector is needed. Can be found in the header of the e-mail.  DKIM TXT resource record:
201707._domainkey.belastingdienst.nl IN TXT "v=DKIM1; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyzXWCOzeB5qswe y69WrHNeqdgnNUiFJkT/EMjm78h1zMXkrd6t0VtTB4rAe39/BlwNFC0jKskE 3u1nl6whfQX3fT/68xr2SdcOp6j/DTtS6rC1EWFXyawX6NfxM/Pt8DV5CLDF GHMht63LetGyiQYv+TrBBiATPjfLPgrArx7jaAoPv0Az/ec86rl+Q9jXA0QO 7zR6Ih""0TIJYwnzVf/7Dsl4GpsmZsN1oEaXhauuDuynQsHm9iptzKC8IKHa Gr9g8qPnh8PDAm0QJSWAq5j1h12j7qjMLwOMEwPKwCE9HnWzeUpzxaJDHL2K 4dHYkXF6ErRjLhtTU2Mx6/F+7Ku4wQIDAQAB;"
22

Domain-based Authentication, Reporting & Conformance
 DMARC = Domain-based Authentication, Reporting & Conformance.  How to deal with the results of the SPF and / or DKIM checks of received e-mails.  More info: RFC7489 - Domain-based Message Authentication, Reporting, and
Conformance.
23

Domain-based Authentication, Reporting & Conformance
 Example: belastingdienst.nl  DMARC TXT resource record:
_dmarc.belastingdienst.nl IN TXT "v=DMARC1; p=reject; rua=mailto:dmarc.rua@belastingdienst.nl; sp=reject;"
Beware: The ruf-tag defines the e-mail address where forensics reports must be sent to. Be aware of privacy issues! RUF reports contain parts of the original mail body.
24

Summarization of the standards
 Implementation of these standards give you more detection and prevention capabilities.
 Implementation of these standards can be. We did it on ~550 domains.
 Both sender as recipient must implement these standards.
 Dutch governmental organization must comply to Dutch Standardization Platform comply or explain list.
 SIDN, financial incentive DMARC and STARTTLS.
25

Now what, with all that info?
 Great info > do something with it:  DMARC > more insight in to what is happening on the receiving side;  SPF record > where are the mails coming from.
 Don't use another tool, use what you already have => SPLUNK or Elastic.
26

DMARC RUA Reports
 Delivered via email as *.XML or *.XML.GZ  The RUA e-mails are processed by Python scripts to use for dashboarding.
 Output in key=value pair OR in JSON.  You need to have:
 a DMARC record in your DNS zone file;  network access to the RUA mail box by using POP3(s) or IMAP(s);  userid and password for the RUA mailbox;  Splunk or Elastic or ....
27

DMARC Dashboards
28

DMARC Dashboards
29

SPF Dashboarding
 Get even more insight in where mail is coming from and going to.  You need:
 to have a SPF record with macros: _i.%{i}._h.%{h}._o.%{o}._spf.belastingdienst.nl
 to have DNS query logging enabled;  to ingest your DNS log in Splunk or Elastic or ....;  to know the good DNS queries.
30

SPF Dashboarding (The Good)
31

SPF Dashboarding (The Badly Configured)
32

SPF Dashboarding (The Evil!)
33

There is more?
 Python script to resolve your SPF record and fill the lookup table.  More dashboards:
 RFC7208, SPF info;  RFC7489, DMARC info;  Number of query's per record type;  DNS record help for:
 DMARC records;  (Advanced) SPF record.
34

Adoption overview (W.I.P.)
35

DMARC and SPF DNS help wizard
36

DMARC and SPF DNS help wizard
37

DMARC and SPF DNS help wizard
38

DMARC and SPF DNS help wizard
39

DMARC and SPF DNS help wizard
40

Lessons learned
 Investigate where all your mail servers are located. The marketing department often use different mail servers for campaigns.
 Monitor your mail server logs.  Test, test, test your SPF policy and DMARC policy. Must be in production!  Don't forget to create a SPF record for your (non) existing subdomains with a
wildcard DNS resource record!  Splunk Dashboards and code can be found on: https://github.com/aholzel
41

Final Thoughts
 Get more insight into who is sending e-mails pretending to be you and/or your organization.
 The information can be used to gain more visibility in the MTAs your organization is using. You will be surprised, we were!
 Implementation must be done in the production environment. And yes, it can be done, we have implemented it successfully without major issues.
 A rollout can only be successful if your MTA administrators, SOC analysts and NOC engineers work closely together. Don't forget the business!
 Please only use standards defined in RFCs to avoid compatibility issues.
42

Resource overview
Splunk App RFC3207 (SMTP) RFC6376 (DKIM) RFC6698 (DANE-TLSA) RFC7208 (SPF) RFC7489 (DMARC) RFC7672 (DANE-TLS) RFC8460 (TLS reporting) RFC8461 (MTA-STS) SPF statistics DMARC adoption report
43

https://github.com/aholzel https://tools.ietf.org/html/rfc3207 https://tools.ietf.org/html/rfc6376 https://tools.ietf.org/html/rfc6689 https://tools.ietf.org/html/rfc7208 https://tools.ietf.org/html/rfc7489 https://tools.ietf.org/html/rfc7672 https://tools.ietf.org/html/rfc8460 https://tools.ietf.org/html/rfc8461 https://spf-all.com/stats.html https://250ok.com/email-deliverability/how-has-dmarc-adoption-evolved-since2018-its-complicated/

Thank you!
44

