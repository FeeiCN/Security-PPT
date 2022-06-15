SESSION ID: DSP-T10
The Long Road to a Secure Web

Andy Ellis
CSO Akamai @csoandy

#RSAC

Some Nomenclature

#RSAC

(Or, TLS is not HTTPS)

HTTP

GET / HTTP/1.1 Host: www.example.com
SRC PORT: 25578 DST PORT: 443 FLAGS: SRC IP: 18.34.327.32 DST IP: 80.67.614.10 PROT: TCP
©2015 AKAMAI | FASTER FORWARDTM

#RSAC

HTTPS

GET / HTTP/1.1 Host: www.example.com TLS 1.0 Cert: www.example.com SRC PORT: 25578 DST PORT: 443 FLAGS: SRC IP: 18.34.327.32 DST IP: 80.67.614.10 PROT: TCP
©2015 AKAMAI | FASTER FORWARDTM

#RSAC

#RSAC
HTTPS: secrecy isn't privacy
©2015 AKAMAI | FASTER FORWARDTM

#RSAC
Privacy can be broken by too many objects...

651667
12313111451063032260586406567009284501 *.wikiped7ia219.261o9761r092g54
8147246154639231 17115321215947814175 117888130778804
11271824368456619 698210016701453

©2015 AKAMAI | FASTER FORWARDTM

#RSAC
More privacy breaks
 Confirmation attack: send unique object set into a stream  Timing attack: Watch external actions  Compression dictionary attack: BREACH  Popularity attack: Monitor performance to detect cached requests  Phishing: Embed hyperlinks to controlled parties
©2015 AKAMAI | FASTER FORWARDTM

HTTP over TLS
GET / HTTP/1.1 Host: www.example.com TLS 1.0 Cert: www.superfish.com SRC PORT: 25578 DST PORT: 443 FLAGS: SRC IP: 18.34.327.32 DST IP: 80.67.614.10 PROT: TCP
©2015 AKAMAI | FASTER FORWARDTM

#RSAC

#RSAC
HTTPS Everywhere ...
When?

#RSAC
TLS usage is on the rise
©2015 AKAMAI | FASTER FORWARDTM

HTTPS, SNI, and Limited IP space
GET / HTTP/1.1 Host: www.example.com TLS 1.0 Cert: www.example.com SRC PORT: 25578 DST PORT: 443 FLAGS: SRC IP: 18.34.327.32 DST IP: 80.67.614.10 PROT: TCP
©2015 AKAMAI | FASTER FORWARDTM

#RSAC

WinXP EOL 80-85%

#RSAC
85­90%

SNI support
End user requests that support the SNI extension
©2015 AKAMAI | FASTER FORWARDTM

Who do you trust?

#RSAC

(The CAs)

#RSAC
TLS roots of trust: Certificate Authorities
www.website.com
©2015 AKAMAI | FASTER FORWARDTM

#RSAC
Evolving the CAs

DANE
SSL CA

DNS

#RSAC
_443._tcp.www.foo.com IN TLSA ( 2 0 0 3243F6A8885A308D313198A2 )

CN=www.foo.com CA:akamai.edge CA Hash: 32:43:F6:A8:88:5A:3 0:8D:31:31:98:A2
©2015 AKAMAI | FASTER FORWARDTM

Certificate Transparency
Issues cert

SSL CA Records cert

Log Server (notary)
Cert A Cert B Cert C

Log monitor
Verifies Log Integrity

#RSAC
Web Server
Audit Server Finds certs in log

©2015 AKAMAI | FASTER FORWARDTM

#RSAC
The TLS proxy

Proxy (in)validation
May not have a valid cert.

#RSAC
http://www.com/ "Valid" cert

©2015 AKAMAI | FASTER FORWARDTM

Opportunistic MitM
Cert: www.com
Adversary without valid cert.

#RSAC
http://www.com/

"Valid" cert

©2015 AKAMAI | FASTER FORWARDTM

#RSAC
Looking to the future

Apply
 Tactical
 Move to TLS  Continue deprecating bad encryption  Move to SNI & IPv6
 Strategic
 Think about privacy as a goal  Engage in safety analysis
©2015 AKAMAI | FASTER FORWARDTM

#RSAC

#RSAC
Thank You!

