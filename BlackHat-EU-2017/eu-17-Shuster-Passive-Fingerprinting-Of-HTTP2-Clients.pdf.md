Elad Shuster Senior Security Researcher, Team Lead Akamai
PASSIVE FINGERPRINTING OF HTTP/2 CLIENTS

Before we begin....

Agenda
Ø Usage Statistics on Akamai's Platform Ø HTTP/2 Overview Ø Passive Client Fingerprinting Ø HTTP/2 Fingerprinting and it's Use Cases Ø HTTP/2 Threat landscape

 Uptime ~ 37 years  Threat Research Team @ Akamai Technologies  Enjoying Big-Data  Love Single Malt Whiskeys!  CPA(il), MBA

Acknowledgments
This research was led by:
Ory Segal Sr. Director Threat Research Akamai
Aharon Friedman Sr. Security Researcher Akamai

http://akamai.me/2qWIqON

DATA COLLECTION

http://wwwnui.akamai.com/gnet/globe/ http://tech.akamai.com/attack-globe/

AKAMAI
The Intelligent Platform
· 220,000+ Edge Servers · 3,315+ Locations · 1200+ Cities · 129 Countries · 1,227+ Networks · 60 Tbps at last peak
The Data
· 3 trillion hits per day · 1 Billion unique IPs seen quarterly · 13+ trillion log lines per day · 260+ TB of compressed daily logs
15 - 30% of all web traffic

© 2017 AKAMAI | FASTER FORWARDTM

HTTP/2 Usage Statistics

27.2M
Unique IP Addresses

1 Billion Daily requests

10%
Of Total Traffic

675.3K User Agents

15.7K Hosts

413.4M Login requests

HTTP/2 OVERVIEW

HTTP 1.x
GET /index.html HTTP/1.1 Host: www.fdsa.co Connection: keep-alive User-Agent: Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0 Safari/537.36 Accept: text/html,application/xhtml+xml,application/xml Accept-Encoding: gzip, deflate Accept-Language: en-US,en;q=0.9,he;q=0.8

HTTP/2 Overview

Ø Based on the SPDY Protocol (develop by

)

Ø Published during 2015: § RFC 7540 Hypertext Transfer Protocol Version 2 (HTTP/2) § RFC 7541 HPACK: Header Compression for HTTP/2

Ø Binary Protocol

Ø Addresses (performance) challenges in HTTP/1.x

Concurrency

Allows interleaving of request and response messages on the same TCP connection

Compression Uses an efficient coding for HTTP header fields, as well as header compression (HPACK)

< / >

Server push Adds a new interaction mode whereby a server

can push responses to a client, if it thinks the client

will need them

HTTP/2 Connection

Message
Stream 0

Frame

FSrtaremaem 1

StSrtereaamm932

. . . . .

Stream N

Frame

Stream
an independent, bidirectional sequence of frames exchanged between the client and server

HTTP/2 Key Elements
Frame smallest unit of communication in HTTP/2
Stream bidirectional flow of frames within an established connection - Assigned with a Unique ID and a Priority
Message sequence of frames that map to a logical request or response

Frame Types

Frame Structure

Frame Structure - Example

Length (24 bit) = XXXXX

Type = 0x1
HEADERS_FRAME
R

Flags = 0x25
END_HEADERS (0x4) , END_STREAM (0x1),
PRIORITY (0x20)
Stream Identifier (Stream ID = 73)

Pad Length = 0 E = 1
Weight = 220

Stream Dependency = 0

:method: GET :authority: http2.akamai.com :scheme: https :path: /resources/h2.css user-agent: Mozilla/5.0 (......) Chrome/62.0.3202.75

Stream 1

Stream 1

Stream 0 Stream 93

Stream 7

Stream 93

Stream 2

Stream 1

HTTP/1.x
Text Clear Text OR Encrypted Multiple TCP Connections
Pipelining of requests -

HTTP/2
Binary Clear Text OR Encrypted
Single TCP connection Request Multiplexing HPACK Header Compression Server Push Enabled

Keep in mind...
Ø HTTP/2 is binary (you can't use netcat to draft traffic) Ø HTTP/2 implementations use TLS Ø Most intercepting proxies (e.g. Burp) don't support H2

Server Side

Server side

Web server debug logs

Client Side

Client side

Chrome://net-internals

Let's get familiarized with the logs....

Source Server

Frame Type SETTINGS

Stream 0
Values [SETTINGS_MAX_CONCURRENT_STREAMS(0x03):100]

Source Server Client

Frame Type SETTINGS SETTINGS

Stream 0
Values
[SETTINGS_MAX_CONCURRENT_STREAMS(0x03):100]
[SETTINGS_HEADER_TABLE_SIZE(0x01):65536] [SETTINGS_INITIAL_WINDOW_SIZE(0x04):131072] [SETTINGS_MAX_FRAME_SIZE(0x05):16384]

Source Client

Frame Type HEADERS

Stream 15
Values <Flags, Headers>

Source Client Client

Frame Type HEADERS WINDOW_UPDATE

Stream 15
Values <Flags, Headers> (window_size_increment=12451840)

Source Client Client Server

Frame Type HEADERS WINDOW_UPDATE HEADERS

Stream 15
Values <Flags, Headers> (window_size_increment=12451840) <Flags, Headers>

Connection Established
Settings Exchanged

HTTP/2 Conversation

Request Response

 HTTP/2 is negotiated via the TLS ALPN extension (Application Level Protocol Negotiation)

Connection Established
Settings Exchanged

HTTP/2 Conversation

Request

Response  SETTINGS ­ Always Stream ID = 0

Connection Established
Settings Exchanged

HTTP/2 Conversation

Request Response

 Client Send a HEADERS frame  Stream ID = 1

Connection Established
Settings Exchanged

HTTP/2 Conversation

Request Response

 Server Responds with a Message  Message = HEADERS and DATA frames  Stream ID = 1

Passive Client Fingerprinting

Passive collection of attributes that might expose consistent unique behavior

Transport layer Session layer Application layer

Fingerprinting software clients NOT end users

Deduce about up-time, OS (type and version), Running Software, etc...

Passive Client Fingerprinting

q Observe client's behaviors while establishing a connection
q Attributes sent by the client that might expose consistent unique behavior: ü Initial connection settings ü Initial flow control settings ü Prioritization ü (Pseudo) Header Order
HTTP/2 Passive Client Fingerprinting

Proposed Fingerprint Elements
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order
q SETTINGS frame Conveys configuration parameters
q SETTINGS MUST be sent by BOTH endpoints at the start of a connection
q Parameter default values vary between implementations
q Stream identifier for a SETTINGS frame MUST be zero

SETTINGS PARAMETERS
(0x1) (0x2)
HTTP/2 Passive Client Fingerprinting

Firefox/55.0 - Mac OS X 10.11.6

Safari 10.1.2 - Mac OS X 10.11.6

EDGE 15.15063 ­ Windows 10 Chrome 60 ­ Android 8.0.0 Pixel XL

forging a fingerprint....

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order EDGE 15.15063 ­ Windows 10
[ 3:1024 ; ]

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order EDGE 15.15063 ­ Windows 10
[ 3:1024 ; 4:10485760 ]

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order Firefox/55.0 - Mac OS X 10.11.6
[1:65536 ; 4:131072 ; 5:16384 ]

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order
 Flow control element  Window size can be set for entire connection or per stream
 Connection ­ Initial size can be set in SETTINGS  RFC set default window sizes if not specified

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order Chrome 60 ­ Android 8.0.0 Pixel XL
[1:65536 ; 4:131072 ; 5:16384 |15663105 ]

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order Chrome 60 ­ Android 8.0.0 Pixel XL
[1:65536 ; 4:131072 ; 5:16384 |15663105 ]
* If frame is not sent ­ use 0 instead

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order

 Set stream dependencies and priorities

Parent Stream

 Priority is set by assigning weights to streams

Dependent  Weights express preference of resources

Stream

allocation

 No guarantees

"only a suggestion"

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order

Parent Stream

 Used by some at the beginning of each connection
 Each frame has three fields:

Dependent Stream

 Weight  Stream Dependency

 Exclusivity Bit

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order

Firefox/54.0
0

3

5

7

201

101

1

 Collect dependency, weight, exclusivity

11

9

1

1

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order

Firefox/54.0
0

 Http2Session.cpp

3

5

7

201

101

1

11

9

1

1

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order

User-Agent Chrome 58.0 Mac OS X

SETTINGS
1:65536 ; 3:1000 ; 4:6291456

okhttp/3.6.0

4:16777216

WINDOW UPDATE 15663105 16711681

PRIORITY 0 0

curl/7.54.0 nghttp2/1.22.0

3:100 ; 4:1073741824 3:100 ; 4:65535

1073676289 00

0
3:0:0:20,5:0:0:101, 7:0:0:1,9:0:7:1,11:0:3:1

Nice. But still...
not enough entropy

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order

Pseudo Headers

Request Pseudo Headers  :method  :scheme  :authority  :path

Response Pseudo Headers  :status

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order

 HTTP/1.1 Request GET / HTTP/1.1 Host: www.example.com User-Agent: Mozilla/5.0 Accept: text/html

 HTTP/2 Request :method: GET :path: / :authority: www.example.com :scheme: https User-Agent: Mozilla/5.0 Accept: text/html

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order
Example from Chrome's source code:

Proposed Fingerprint
SETTINGS[;] | WINDOW_UPDATE | PRIORITY[,] | PSH-Order

USE CASES

© 2017 AKAMAI | FASTER FORWARDTM

Use Cases
Ø Positive Security Ø Detect Browser Impersonators Ø Tool Detection Ø Anonymous Proxy / VPN Detection
* Fingerprinting should also combine other layers

HTTP/2 THREAT LANDSCAPE
© 2017 AKAMAI | FASTER FORWARDTM

Most security tools lack H2 support:
 Burp Suite  Zed Attack Proxy  Fiddler  SQLmap  Acunetix  AppScan  NetSparker  SentryMBA  THC-Hydra

Why ?
Ø Not enough incentive for Attackers § Web servers support both HTTP/1.X and HTTP/2 § HTTP/2 libraries are not common § Cost exceeds the Gain
Ø Server Implementation Weaknesses found in 2016 § Handling of Compression, Stream management

Key Takeaways
Ø Basic understanding of how HTTP/2 works Ø Key differences between HTTP 1.x and 2.0 Ø Passive Fingerprinting Ø Proposed fingerprint mechanism and Use Cases Ø (Lack of) Threat Landscape

Questions

THANK YOU

Elad Shuster eshuster@akamai.com

© 2017 AKAMAI | FASTER FORWARDTM

