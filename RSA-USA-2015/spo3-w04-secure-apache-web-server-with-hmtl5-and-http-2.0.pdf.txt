SESSION ID: SPO3-W04
Secure Apache Web Server with HTML5 and HTTP/2

Brandy Mauff
Chief Technology Evangelist HOB Inc.

#RSAC

#RSAC
"The only truly secure system is one that is powered off, cast in a block of concrete and sealed in a lead-lined room with armed guards."
- Eugene Spafford
2

#RSAC
The Importance of Security
 Cyber attacks  Mobile devices/apps  Critical infrastructure  Information security  X internet users
3

#RSAC
Information Security Spending (in $)

80 75 70 65 60
2013

2014

2015
http://www.gartner.com/newsroom/id/2828722

4

#RSAC
Apache Web Server

#RSAC
What is Apache Web Server?
 Open source  Originally designed for Unix environments in 1995  Large public library of add-ons  Most widely used Web server
6

#RSAC
Key features of Apache Web Server
 Highly adaptable  Configurable error messages  Content negotiation  TLS support  Open source
7

#RSAC
Apache Web Server Hardening
Information leakage Hide version, disable directory listing
Unnecessary modules Disable modules, update regularly
Lack of authorization Separate user/group, restrict access
8

Apache Web Server

#RSAC

and HTML5

#RSAC
What is HTML5?
 Markup language  Living standard (2014)  Structuring and presenting content  Support for latest multimedia types
10

#RSAC
How does it work?

Client

HTTP Request: WebSocket Upgrade HTTP Response: Switching Protocols
WebSocket Frame
WebSocket Frames
WebSocket Frame WebSocket Close WebSocket Close
11

Server

#RSAC
Features of HTML5
 Audio/video support  Content editable  Placeholders  LocalStorage and sessionStorage
12

#RSAC
Web(HTML5) Storage
localStorage sessionStorage
13

#RSAC
WebStorage ­ good or bad?

Practicality
Increased performance
Non-sensitive data

Readable/ changeable
Security
Scalability

14

#RSAC
HTML5 Hardening
Cross-origin resource sharing Validate URLs, discard requests
Offline Web application Clear UA cache, only trusted sites
Web messaging State origin, assign data value properly
15

Apache Web Server

#RSAC

and HTTP/2

#RSAC
What is HTTP/2?
 Foundation of data communication for the World Wide Web  Based on SPDY  To become standard 2015  Supports TLS ­ not required!
17

#RSAC
HTTP/2 ­ Key Improvements

server push

header compression

multiplexing

TLS

18

#RSAC
How does HTTP/2 work?

HTTP Client (Web Browser)

HTTP Request Message HTTP Response Message
HTTP over TCP/IP

HTTP Server (Web Server)

19

#RSAC
HTTP/2 Hardening

POODLE

Disable SSL 2.0 and SSL 3.0

CRIME

Disable TLS 1.0

Heartbleed Upgrade OpenSSL, disable TLS Heartbeat

20

#RSAC
What is TLS?
 Cryptographic protocol designed to provide communication security and data integrity between client/server applications communicating over a computer network
 Supported by all major web browsers  Made up of two layers
21

Basic TLS Handshake

Client

ClientHello ServerHello (Certificate) / ServerKeyExchange ServerHelloDone ClientKeyExchange ChangeCipherSpec
Finished ChangeCipherSpec
Finished

22

#RSAC
Server

#RSAC
Advantages of TLS
 Strong authentication  Interoperability  Algorithm flexibility  Easy to deploy  Easy to use
23

#RSAC
Disadvantages - the Cost of TLS (& PKI)
Computational / scalability PKI Operational
24

Apache Web Server

#RSAC

+ HTML5

+ HTTP/2

= ?

#RSAC
Apache Web Server + HTML5 + HTTP/2 = ?

Secure

Flexible

Practical

Secure Apache Web Server with HTML5 and HTTP/2
26

#RSAC
What now?
 Threat assessment ­ test,test,test!  Solution feasibility  Invest
27

#RSAC
Questions?

