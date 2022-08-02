SSL Research with Bro
Johanna Amann International Computer Science Institute
johanna@icir.org http://www.icir.org/johanna

SSL

Client

Server

Client hello Server hello Certificate
(Server Key Exchg) Client Key Exchange Change Cipher Spec
Finished Change Cipher Spec Finished

Encrypted application data

SSL

client_hello (extensions)
ssl_handshake_message ssl_change_cipher_spec
ssl_encrypted_data

Client

Server

Client hello Server hello Certificate
(Server Key Exchg) Client Key Exchange Change Cipher Spec
Finished Change Cipher Spec Finished

server_hello (extensions) x509_* events
ssl_handshake_message
ssl_change_cipher_spec ssl_encrypted_data

Encrypted application data

ssl_encrypted_data

Bro History

USENIX Paper

Backdoors Stepping Stones

Host Context Time Machine Enterprise Traffic
TRW State Mgmt. Independ. State

Bro Cluster Shunt

Academic Publications

Summary Stats

HILTI

DPI Concurrency

Tor SSL

PLC Modeling

OCSP Speed

Android Root Certs Certificate Ecosystem

Heart bleed TLS Electronic Comm.

Spicy

Anonymizer Active Mapping Context Signat.

BinPAC DPD
2nd Path

Parallel Prototype Autotuning

Input Framework
SSL Trust SSL Errors

NetControl VAST

1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016

Vern writes 1st line of code

v0.2 1st CHANGES
entry

v0.6 RegExps Login analysis

LBNL starts using Bro operationally

v0.4 HTTP analysis Scan detector IP fragments Linux support

v0.7a90 Profiling State Mgmt
v0.7a175/0.8aX Signatures SMTP IPv6 support User manual

v0.8aX/0.9aX SSL/SMB
STABLE releases BroLite

v1.1/v1.2 when Stmt Resource tuning
Broccoli DPD

v1.0 BinPAC IRC/RPC analyzers 64-bit support Sane version numbers

v1.5 BroControl

v2.4

v2.0 User Experience

v2.2 File Analysis Summary Stats

Broker, Plugins, DTLS/KRB
v2.5,

SMB, NetControl,

VNC, StartTLS

Bro SDCI

v2.1 IPv6 Input Framew.

v2.3 Performance
SNMP,

Radius, SSL++

v1.4 DHCP/BitTorrent
HTTP entities NetFlow
Bro Lite Deprecated

Bro Center

v0.7a48 Consistent CHANGES

0.8a37 Communication
Persistence Namespaces Log Rotation

v1.3 Ctor expressions
GeoIP Conn Compressor

Bro SSL - v1.5.3

ssl_certificate_seen

ssl_certificate

ssl_conn_attempt

ssl_conn_alert

ssl_conn_server_reply

ssl_conn_weak

ssl_conn_established

ssl_session_insertion

ssl_conn_reused

process_X509_extensions

ssl_X509_error

Bro SSL - v1.5.3

ssl_certificate_seen

ssl_certificate

ssl_conn_attempt

ssl_conn_alert

ssl_conn_server_reply

ssl_conn_weak

ssl_conn_established

ssl_session_insertion

ssl_conn_reused

process_X509_extensions

ssl_X509_error

?

Client

Server

Client hello Server hello Certificate
(Server Key Exchg) Client Key Exchange Change Cipher Spec
Finished Change Cipher Spec Finished

Encrypted application data

Bro SSL - v2.0
client_hello server_hello ssl_session_ticket_handshake ssl_established x509_certificate ssl_extension
ssl_alert

Bro SSL - v2.1
client_hello server_hello ssl_session_ticket_handshake ssl_established x509_certificate ssl_extension
ssl_alert

Bro SSL - v2.1

Several bug fixes

client_hello

Parsing TLS server extensionssewrvoerr_khsello
ssl_session_ticket_handshake

More information in log file ssl_established

x509_certificate

ssl_extension

ssl_alert

Bro SSL - v2.2
client_hello server_hello ssl_session_ticket_handshake ssl_established x509_certificate ssl_extension
ssl_alert

Bro SSL - v2.2

Several bug fixes

client_hello

server_hello
Client/server random available
ssl_session_ticket_handshake

Support TLS 1.2

ssl_established x509_certificate

ssl_extension

ssl_alert

Bro SSL - v2.3
client_hello server_hello ssl_session_ticket_handshake ssl_established x509_certificate ssl_extension
ssl_alert

Bro SSL - v2.3

client_hello server_hello ssl_session_ticket_handshake ssl_established x509_certificate ssl_extension
ssl_alert

ssl_stapled_ocsp ssl_encrypted_data ssl_dh_server_params ssl_change_cipher_spec ssl_handshake_message ssl_encrypted_data ssl_extension_ex_point_formats
ssl_server_curve

ssl_change_cipher_spec x509_extension
x509_ext_basic_constraints
x509_ext_subject_alternative_name
ssl_extension_elliptic_curves
ssl_extension_application_layer_protocol_negotiation
ssl_extension_server_name

Bro SSL events - v2.4

client_hello server_hello ssl_session_ticket_handshake ssl_established x509_certificate ssl_extension
ssl_alert

ssl_stapled_ocsp ssl_encrypted_data ssl_dh_server_params ssl_change_cipher_spec ssl_handshake_message ssl_encrypted_data ssl_extension_ex_point_formats
ssl_server_curve

ssl_change_cipher_spec x509_extension
x509_ext_basic_constraints
x509_ext_subject_alternative_name
ssl_extension_elliptic_curves
ssl_extension_application_layer_protocol_negotiation
ssl_extension_server_name

Bro SSL events - v2.4

FirstcliDenTt_LheSllosupport

ssl_stapled_ocsp

TLSserrevcero_hredllolayer fragmentatsisol_nencrypted_data

ssl_session_ticket_handshake

ssl_dh_server_params

ssl_established

ssl_change_cipher_spec

x509_certificate

ssl_handshake_message

ssl_extension

ssl_encrypted_data

ssl_alert

ssl_extension_ex_point_formats

ssl_server_curve

ssl_change_cipher_spec x509_extension
x509_ext_basic_constraints
x509_ext_subject_alternative_name
ssl_extension_elliptic_curves
ssl_extension_application_layer_protocol_negotiation
ssl_extension_server_name

SSL Protocol Basics
· Record based protocol · Records do not have to map to TCP packets · Record header is never encrypted, only payload is
(after the handshake is done)

Type Version Length

Payload

Record Header

SSL Protocol Basics

· Record based protocol

Common record types:

· Records do not have to map to TCP packets · Change Cipher Spec

· Record header is never encrypted, only payload· isA lert (after the handshake is done) · Handshake

Type Version Length

Payload · Application Data

Record Header

SSL Protocol Basics
· Record based protocol · Records do not have to map to TCP packets · Record header is never encrypted, only payload is
(after the handshake is done)

Type Version Length

Payload

Record Header

Fragmentation

Type: Version: Length:

Handshake 1.2

66

server_hello

Fragmentation

Type: Version: Length:

Handshake 1.2

66

server_hello

Type: Version: Length:

Handshake 1.2

3804

certificate

Fragmentation

Type: Version: Length:

Handshake 1.2

40

server_...

Type: Version: Length:

Handshake 1.2

20

..hell..

Version: 1.2

Length: 3810

o

certificate

Bro SSL events - v2.5

client_hello server_hello ssl_session_ticket_handshake ssl_established x509_certificate ssl_extension
ssl_alert

ssl_stapled_ocsp ssl_encrypted_data ssl_dh_server_params ssl_change_cipher_spec ssl_handshake_message ssl_encrypted_data ssl_extension_ex_point_formats
ssl_server_curve

ssl_change_cipher_spec x509_extension
x509_ext_basic_constraints
x509_ext_subject_alternative_name
ssl_extension_elliptic_curves
ssl_extension_application_layer_protocol_negotiation
ssl_extension_server_name

Bro SSL events - v2.5

client_hello

ssl_stapled_ocsp

ssl_change_cipher_spec

server_hello

ssl_encrypted_data

x509_extension

ssl_session_ticket_handshake

ssl_dh_server_params

x509_ext_basic_constraints

ssl_established

ssl_change_cipher_spec

x509_ext_subject_alternative_name

x509_certificate

ssl_handshake_message

ssl_extension_elliptic_curves

ssl_extension

ssl_encrypted_data

ssl_extension_application_layer_protocol_negotiation

ssl_alert

ssl_extension_ex_point_formats

ssl_extension_server_name

ssl_server_curve

ssl_extension_signature_algorithm

Bro SSL events - v2.5

Comclpielnett_ehelylloworking DTLS susspl_psotarptled_ocsp

ssl_change_cipher_spec

server_hello
More StartTLS
ssl_session_ticket_handshake

ssl_encrypted_data ssl_dh_server_params

x509_extension x509_ext_basic_constraints

ssl_established

ssl_change_cipher_spec

x509_ext_subject_alternative_name

x509_certificate

ssl_handshake_message

ssl_extension_elliptic_curves

ssl_extension

ssl_encrypted_data

ssl_extension_application_layer_protocol_negotiation

ssl_alert

ssl_extension_ex_point_formats

ssl_extension_server_name

ssl_server_curve

ssl_extension_signature_algorithm

ICSI Notary

Internet

Outgoing SSL Sessions

Data Provider Collector

Bro Network Monitor
Storage & Evaluation

Internal Network

Notary - Collected features

Available ciphers Analyzer Error Client & Server TLS extensions Content length Connection history
Duration Client EC point formats Send & received bytes

Timestamp Packet loss Selected cipher Server certificates Server IP Server Name Indication DH parameter size Client & Server ALPN

Version Hash(client session ID) Hash(client IP, server IP) Hash(server session ID)
Ticket lifetime hint Client EC curve
Number Client Certs TLS Alerts

Notary - Certificates

http://notary.icsi.berkeley.edu

SSL Research 2016
Exploring Tor's Activity Through Long-term Passive TLS Traffic Measurement J. Amann, R. Sommer, PAM 2016
Measuring the Latency and Pervasiveness of TLS Certificate Revocation L. Zhu, J. Amann, J. Heidemann, PAM 2016
TLS in the wild: An Internet-wide Analysis of TLS-based Protocols for Electronic Communication R. Holz, J. Amann, O. Mehani, M. Wachs, M. A. Kaafar, NDSS 2016
Towards a Complete View of the Certificate Ecosystem B, VanderSloot, J. Amann, M. Bernhard, Z. Durumeric, M. Bailey, J. A. Halderman, IMC 2016

· Popular network for anonymous Internet access · First release in 2002 · Today more than 2,000,000 simultaneous clients · Uses TLS as its underlying communication protocol

google.com facebook.com

google.com facebook.com

google.com facebook.com

google.com facebook.com

google.com facebook.com

google.com facebook.com

Directory Server

google.com facebook.com

Tor Certificates

Version Issuer Subject Not-Before Not-After

3 C=BE, O=GlobalSign nv-sa, CN=GlobalSign Domain
Validation CA - SHA256 - G2 OU=Domain Control Validated, CN=*.bro.org
Aug 25 16:55:00 2015 GMT
Nov 28 21:21:16 2016 GMT

Tor Certificates

Version Issuer Subject Not-Before Not-After
Version Issuer Subject Not-Before Not-After

3 C=BE, O=GlobalSign nv-sa, CN=GlobalSign Domain
Validation CA - SHA256 - G2 OU=Domain Control Validated, CN=*.bro.org
Aug 25 16:55:00 2015 GMT Nov 28 21:21:16 2016 GMT
3 CN=www.hjo5uvxa5cdg3gjgf.com
CN=www.pongobhog2f6p.net Dec 17 10:34:58 2013 GMT Dec 17 10:34:58 2014 GMT

Tor Certificates

Version Issuer Subject Not-Before Not-After
Version Issuer Subject Not-Before Not-After

3 C=BE, O=GlobalSign nv-sa, CN=GlobalSign Domain
Validation CA - SHA256 - G2 OU=Domain Control Validated, CN=*.bro.org
Aug 25 16:55:00 2015 GMT Nov 28 21:21:16 2016 GMT
3 CN=www.hjo5uvxa5cdg3gjgf.com
CN=www.pongobhog2f6p.net Dec 17 10:34:58 2013 GMT Dec 17 10:34:58 2014 GMT

Tor Certificates
Source: Tor src/common/tortls.c

Tor Certificates
Source: Tor src/common/crypto.c

Exploring Tor's Activity Through Long-term Passive TLS Traffic Measurement J. Amann, R. Sommer, PAM 2016

22222222222222222000000000000000000000011111111111178899001122334455-----------------1010101010101010126262626262626262-----------------0000000000000000011111111111111111

d e
0

c b

5000

a

IPs per day

Flags a: Total b: Fast c: Stable
10000 d: Guard Relay e: Exit Relay

Relays by Day

IPs per day

Relays by Day
6000 Server Types (top to bottom) a: All Servers b: Guard Relays c: Exit Relays
4000

2000

a

b

0

c

222222222222222000000000000000111111111111111555544443333222---------------100010001000100074107410741074---------------000000000000000111111111111111

Exploring Tor's Activity Through Long-term Passive TLS Traffic Measurement J. Amann, R. Sommer, PAM 2016

IPs per day

Relays by Day

6000 Server Types (top to bottom) a: All Servers b: Guard Relays c: Exit Relays
4000

Mevade

2000

a

b

0

c

222222222222222000000000000000111111111111111555544443333222---------------100010001000100074107410741074---------------000000000000000111111111111111

Exploring Tor's Activity Through Long-term Passive TLS Traffic Measurement J. Amann, R. Sommer, PAM 2016

[Mean/Median] conn durations/day 2012-12-01 2013-03-01 2013-06-01 2013-09-01 2013-12-01 2014-03-01 2014-06-01 2014-09-01 2014-12-01 2015-03-01 2015-06-01 2015-09-01

Median & Mean Conn. Durations

100

Connection durations

a: Mean

b: Median

50

20

10

a

3

b

Exploring Tor's Activity Through Long-term Passive TLS Traffic Measurement J. Amann, R. Sommer, PAM 2016

Tor connection Durations

Site 1st Qu. Median Mean 3rd Qu. Max

N1 3.0

3.0

9.6 10.1 9,839

N2 3.0

6.3

19.5 16.8 22,280

N3 1.5

3.0

7.3 3.2

16,370

X1 3.0

3.0

8.3 3.3

10,120

Exploring Tor's Activity Through Long-term Passive TLS Traffic Measurement J. Amann, R. Sommer, PAM 2016

2012-09-01 2012-11-01 2013-01-01 2013-03-01 2013-05-01 2013-07-01
2013-09-01 2013-11-01 2014-01-01 2014-03-01 2014-05-01 2014-07-01
2014-09-01 2014-11-01 2015-01-01 2015-03-01 2015-05-01

Client Fingerprints
1.00 0.75 0.50 0.25 0.00

[%] clients with version per month

[%] servers with version per month 2222222222222222000000000000000011111111111100005544332211009988----------------00000000000000008282828282828282----------------00000000000000001111111111111111

Tor Server Versions

0.8

0.2.2.35

0.6 0.4 0.2

0.1.2.19

0.2.0.34

0.2.1.26 0.2.1.29 0.2.1.30

0.1.2.18 0.1.2.17

0.2.0.31

0.2.0.32 0.2.0.30

0.2.1.19 0.2.1.20 0.2.1.25
0.2.1.22

0.2.2.34

0.2.2.39

0.2.0.33

0.2.0.35

0.2.1.21 0.2.1.23 0.2.1.24

0.2.1.27 0.2.1.28

0.2.2.33 0.2.2.37

0.2.2.32

0.2.03.0.212..2903.-.22r.c23-6rc0.2.3.24-rc 0.2.2.38

0.2.3.25

0.2.4.23

0.2.40..221.4.22 0.2.4.20

0.2.5.10 0.2.6.10

0.2.4.17-rc 0.2.4.19

0.2.5.12

0.2.4.24

0.2.6.9

0.2.5.8-0r.c2.5.11 0.2.4.27

0.0

Exploring Tor's Activity Through Long-term Passive TLS Traffic Measurement J. Amann, R. Sommer, PAM 2016

[%] connections with cipher/month 2012-11-01 2013-02-01 2013-05-01 2013-08-01 2013-11-01 2014-02-01 2014-05-01 2014-08-01 2014-11-01 2015-02-01 2015-05-01 2015-08-01

Chosen Ciphersuites
1.00

0.75 Cipher suites

a: DHE_AES_256_CBC_SHA

b: ECDHE_AES_256_CBC_SHA

0.50

c: ECDHE_AES_128_GCM_SHA256 d: ECDHE_AES_128_CBC_SHA

a

e: DHE_AES_128_CBC_SHA

b
0.25

c

d

0.00

e

Exploring Tor's Activity Through Long-term Passive TLS Traffic Measurement J. Amann, R. Sommer, PAM 2016

OCSP
Is revocation checking really not feasible?
Measuring the Latency and Pervasiveness of TLS Certificate Revocation L. Zhu, J. Amann, J. Heidemann, PAM 2016

HTTPS Server
More handshake messages

OCSP

client hello server hello
Application data

OCSP request OCSP reply

OCSP Server

Measuring the Latency and Pervasiveness of TLS Certificate Revocation L. Zhu, J. Amann, J. Heidemann, PAM 2016

OCSP Clients

category
Web browsers
Library or daemon used by applications
Email client
Other applications
Unknown

32.10%
66.87% .32% .33% .38%

application Firefox Chrome Pale moon Opera Rekonq, Bolt, Midori, Iceweasel, Seamonkey, Safari Sonkeror, IE, Camino, Epiphany, Konqueror ocspd Microsoft-CryptoAPI securityd java cfnetwork Thunderbird Postbox, Gomeza, Zdesktop, Eudora, Icedove Lightning Zotero Celtx, ppkhandler, Komodo, Dalvik, slimerjs, Unity Phoenix, Sunbird, Slurp, miniupnpc, googlebot Entrust entelligence security provider Unknown

percent 31.63% .21% .06% .06% <.15%
37.15% 23.74%
4.74% 1.24% <.0001%
.30% .02% .31% .01% <.0074%
.38%

Measuring the Latency and Pervasiveness of TLS Certificate Revocation L. Zhu, J. Amann, J. Heidemann, PAM 2016

OCSP - Speed

1

0.8

CDF

0.6 0.4 0.2
0 0.0001 0.001

median: 19.25 ms all
no connection reuse connection reuse get post

0.01 0.1

1

10

100 1000

OCSP lookup time (seconds)

Measuring the Latency and Pervasiveness of TLS Certificate Revocation L. Zhu, J. Amann, J. Heidemann, PAM 2016

OCSP Servers

Query Tra c OCSP Servers

CDN 39313464 94% 120
other 2526338 6% 184 total
41839802 100% 304

39% 61% 100%

Measuring the Latency and Pervasiveness of TLS Certificate Revocation L. Zhu, J. Amann, J. Heidemann, PAM 2016

OCSP Servers

server ocsp.digicert.com clients1.google.com sr.symcd.com ocsp.entrust.net ocsp.godaddy.com ocsp.usertrust.com vassg141.ocsp.omniroot.com ss.symcd.com ocsp.comodoca.com ocsp.verisign.com all 294 others total

observed CDN phicdn.net self-hosted akamaiedge akamaiedge self-hosted (using akadns) self-hosted akamai akamaiedge self-hosted akamaiedge

lookup

6,205,125 14.83%

4,859,409 11.61%

3,778,672 9.03%

2,421,420 5.79%

2,399,931 5.74%

2,248,577 5.37%

1,915,287 4.58%

1,663,053 3.97%

1,478,911 3.53%

1,345,724 3.22%

13,523,693 32.32%

41,839,802

100%

Measuring the Latency and Pervasiveness of TLS Certificate Revocation L. Zhu, J. Amann, J. Heidemann, PAM 2016

OCSP - Speed

0.0001 0.001 1

OCSP/TLS Latency ratio

0.01 0.1

1

10 100

1000 10000

CDF

0.8

0.6

median: 0.0965

0.4 median: 15.8 ms 0.2

0 0.0001 0.001 0.01 0.1

median: 241.3 ms

OCSP (all) TLS (all) ratio
TLS (1 OCSP) TLS (>1 OCSP)

1

10

100

1000

Latency (seconds)

Measuring the Latency and Pervasiveness of TLS Certificate Revocation L. Zhu, J. Amann, J. Heidemann, PAM 2016

OCSP - Caching time

CDF

1

0.8

0.6

0.4

7 days

0.2

0

0.24 h

2.4 h

1 d

10 d

100 d

validity time of OCSP response (log-scale)

Measuring the Latency and Pervasiveness of TLS Certificate Revocation L. Zhu, J. Amann, J. Heidemann, PAM 2016

OCSP - Revoked Certificates

percent of OCSP responses

0.3 unknown
0.25 revoked

0.2

0.15

0.1

0.05

0 07-28

08-07

08-17

08-27

09-06

09-16

09-26

Measuring the Latency and Pervasiveness of TLS Certificate Revocation L. Zhu, J. Amann, J. Heidemann, PAM 2016

Electronic Communication
How secure is SSL for SMTP, IMAP, XMPP, ...
TLS in the wild: An Internet-wide Analysis of TLS-based Protocols for Electronic Communication R. Holz, J. Amann, O. Mehani, M. Wachs, M. A. Kaafar, NDSS 2016

Dataset

Protocol
SMTP SMTPS SUBMISSION IMAP IMAPS POP3 POP3S
IRC IRCS XMPP, C2S XMPPS, C2S XMPP, S2S XMPPS, S2S

Port
25 465 587 143 993 110 995
6667 6697 5222 5223 5269 5270

Connections
3,870,542 37,306
7,849,434 25,900
4,620,043 18,774 159,702
53 18,238 13,517 911,411
175 0

Servers
8626 266 373 239 1196 110 341
2 15 229 2163
2 0

TLS in the wild: An Internet-wide Analysis of TLS-based Protocols for Electronic Communication R. Holz, J. Amann, O. Mehani, M. Wachs, M. A. Kaafar, NDSS 2016

StartTLS - upgraded

Protocol
SMTP SUBMISSION IMAP POP3
IRC XMPP, C2S XMPP, S2S

Active probing
Supported & upgraded
30.82% 43.03% 50.91% 45.62%
0.14% 2.44% 0.39%

Passive monitoring

Supporting Oering

Upgraded

servers connections connections

59%

97%

94%

98%

99.9%

97%

77%

70%

44%

55%

73%

62%

­

­

­

­

­

­

­

­

­

TLS in the wild: An Internet-wide Analysis of TLS-based Protocols for Electronic Communication R. Holz, J. Amann, O. Mehani, M. Wachs, M. A. Kaafar, NDSS 2016

Percent of Connections/Servers

Valid certificates

SMTP SMTPS SUBMISSION IMAP IMAPS POP3 POP3S IRC IRCS XMPP C2S XMPP S2S SMTP SMTPS SUBMISSION IMAP IMAPS POP3 POP3S IRC IRCS XMPP C2S XMPP S2S

Servers
100 90 80 70 60 50 40 30 20 10 0

Connections
broken expired self-signed verifiable

25 465 587 143 993 110 995 6667 6697 5222 5269
25 465 587 143 993 110 995 6667 6697 5222 5269

TLS in the wild: An Internet-wide Analysis of TLS-based Protocols for Electronic Communication R. Holz, J. Amann, O. Mehani, M. Wachs, M. A. Kaafar, NDSS 2016

100

90

80

70

60

50

40

30

20

10

0

Used ciphers

Percent of connections
25 SMTP 465 SMTPS 587 SUBMISSION 143 IMAP 993 IMAPS 110 POP3 995 POP3S 5222 XMPP C2S

TLS in the wild: An Internet-wide Analysis of TLS-based Protocols for Electronic Communication R. Holz, J. Amann, O. Mehani, M. Wachs, M. A. Kaafar, NDSS 2016

rc4

aes

dhe

ecdhe

Notary contributions
Please consider contributing data to the ICSI Notary, which provided data used in several of the studies in this presentation.

