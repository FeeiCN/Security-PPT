|1|
Bro Internet Content Adaptation Protocol (ICAP) Analyzer
A Novel Method for Monitoring HTTPS Traffic in Plain-Text
M. Fernandez | MITRE

Presentation for

Austin, Texas | 13-15 Sep 2016

Approved for public release. Distribution unlimited. Case number 16-3302.

© 2016 The MITRE Corporation. All rights reserved.

|2|
Problem Statement
Ø Encrypted Web Traffic
o Transport layer encryption (HTTPS) o Status quo for search engines, web mail, etc. o Blind spot for typical network security & monitoring o Potential vector for external and internal cyber threats o Majority of web traffic
Ø Countermeasure
o Best practice... SSL/TLS-interception security device o Or perhaps... Web proxy w/content inspection?
Bro ICAP Analyzer
© 2016 The MITRE Corporation. All rights reserved.

|3|
Outline
Ø ICAP
o Background o Basic Operation o Web Proxies, Content Inspection & ICAP o References
Ø Bro ICAP Analyzer
o Analyzing ICAP o Creating the Bro Analyzer via BinPAC o Caveats & Limitation
Ø Recommendations for Future Work
© 2016 The MITRE Corporation. All rights reserved.

|4|
Internet Content Adaptation Protocol
Ø Internet Engineering Task Force (IETF)
Request for Comments (RFC) 3507
o Simple object-based content vectoring for HTTP o Content modification of either HTTP request/response
messages o Syntax similar to HTTP o TCP port 1344
Ø Common Implementations
o Web proxy devices w/content inspection service
v Anti-Virus (AV) / Malware v Data Loss Prevention (DLP)
© 2016 The MITRE Corporation. All rights reserved.

|5|
ICAP Operation
Ø Request Modification (REQMOD)
o Modifies HTTP request messages o ICAP payload:
v HTTP request header v HTTP request body [chunk-encoded]
Ø Response Modification (RESPMOD)
o Modifies HTTP response messages o ICAP payload:
v HTTP request header v HTTP response header v HTTP response body [chunk-encoded]
© 2016 The MITRE Corporation. All rights reserved.

|6|
ICAP Request Modification
Illustration adapted from RFC 3507
Web Server


Web Proxy (aka, ICAP Client)


 


DLP Proxy (aka, ICAP Server)

 Web Client
© 2016 The MITRE Corporation. All rights reserved.

Legend
HTTP/HTTPS Traffic
ICAP Traffic

|7|
ICAP Request Modification
Illustration adapted from RFC 3507
Web Server


Web Proxy (aka, ICAP Client)


 


DLP Proxy (aka, ICAP Server)

HTTP req msg

 Web Client

© 2016 The MITRE Corporation. All rights reserved.

Legend
HTTP/HTTPS Traffic
ICAP Traffic

|8|
ICAP Request Modification
Illustration adapted from RFC 3507
Web Server


Web Proxy (aka, ICAP Client)



ICAP Payload
http req hdr
http req bdy

 Web Client
© 2016 The MITRE Corporation. All rights reserved.

 DLP Proxy
(aka, ICAP Server)
ü ü
Legend
HTTP/HTTPS Traffic ICAP Traffic

|9|
ICAP Request Modification
Illustration adapted from RFC 3507
Web Server


Web Proxy (aka, ICAP Client)


 

ICAP Resp Msg
204 "No modifi-
 cations needed"
DLP Proxy (aka, ICAP Server)

 Web Client
© 2016 The MITRE Corporation. All rights reserved.

Legend
HTTP/HTTPS Traffic
ICAP Traffic

| 10 |
ICAP Request Modification
Illustration adapted from RFC 3507
Web Server


Web Proxy (aka, ICAP Client)



ICAP Payload
http req hdr
http req bdy

 Web Client
© 2016 The MITRE Corporation. All rights reserved.

 DLP Proxy
(aka, ICAP Server)
ü W
Legend
HTTP/HTTPS Traffic ICAP Traffic

| 11 |
ICAP Request Modification
Illustration adapted from RFC 3507
Web Server


Web Proxy (aka, ICAP Client)


 

ICAP Payload
http req hdr modified bdy DLP Proxy
(aka, ICAP Server)

 Web Client
© 2016 The MITRE Corporation. All rights reserved.

Legend
HTTP/HTTPS Traffic
ICAP Traffic

| 12 |
ICAP Response Modification
Illustration adapted from RFC 3507
Web Server


Web Proxy (aka, ICAP Client)


 


AV Proxy (aka, ICAP Server)

 Web Client
© 2016 The MITRE Corporation. All rights reserved.

Legend
HTTP/HTTPS Traffic
ICAP Traffic

| 13 |

ICAP Response Modification

HTTP
rsp Wmesbg Server

Illustration adapted from RFC 3507


Web Proxy (aka, ICAP Client)


 


AV Proxy (aka, ICAP Server)

HTTP req msg

 Web Client

© 2016 The MITRE Corporation. All rights reserved.

Legend
HTTP/HTTPS Traffic
ICAP Traffic

| 14 |
ICAP Response Modification
Illustration adapted from RFC 3507
Web Server



ICAP Payload

http req hdr

http rsp hdr 
http rsp bdy
Web Proxy

ü ü ü
AV Proxy

(aka, ICAP Client)

(aka, ICAP Server)





 Web Client
© 2016 The MITRE Corporation. All rights reserved.

Legend
HTTP/HTTPS Traffic
ICAP Traffic

| 15 |
ICAP Response Modification
Illustration adapted from RFC 3507
Web Server


Web Proxy (aka, ICAP Client)


 


AV Proxy ICAP Resp M(sagka, ICAP Server)
204 "No modifications needed"

 Web Client
© 2016 The MITRE Corporation. All rights reserved.

Legend
HTTP/HTTPS Traffic
ICAP Traffic

| 16 |
ICAP Response Modification
Illustration adapted from RFC 3507
Web Server

 

Web Proxy

(aka, ICAP Client) HTTP

rsp msg






AV Proxy (aka, ICAP Server)

 Web Client
© 2016 The MITRE Corporation. All rights reserved.

Legend
HTTP/HTTPS Traffic
ICAP Traffic

| 17 |
ICAP Response Modification
Illustration adapted from RFC 3507
Web Server



ICAP Payload

http req hdr

http rsp hdr 
http rsp bdy
Web Proxy

ü ü WAV Proxy

(aka, ICAP Client)

(aka, ICAP Server)





 Web Client
© 2016 The MITRE Corporation. All rights reserved.

Legend
HTTP/HTTPS Traffic
ICAP Traffic

| 18 |
ICAP Response Modification
Illustration adapted from RFC 3507
Web Server


Web Proxy (aka, ICAP Client)


 

 Web Client
© 2016 The MITRE Corporation. All rights reserved.

 AV Proxy
ICAP Payload (aka, ICAP Server)
http req hdr http rsp hdr modified bdy
Legend
HTTP/HTTPS Traffic ICAP Traffic

| 19 |
ICAP Response Modification
Illustration adapted from RFC 3507
Web Server

 

Web Proxy

(aka, ICAP Client) HTTP

rsp msg






AV Proxy (aka, ICAP Server)

 Web Client
© 2016 The MITRE Corporation. All rights reserved.

Legend
HTTP/HTTPS Traffic
ICAP Traffic

The Bro ICAP Analyzer
Web Server

| 20 |
Illustration adapted from RFC 3507

Web Proxy (aka, ICAP Client)
Web Client
© 2016 The MITRE Corporation. All rights reserved.

AV / DLP Proxy (aka, ICAP Server)
Legend
HTTP/HTTPS Traffic ICAP Traffic

| 21 |
ICAP References
[1] Internet Content Adaptation Protocol (ICAP)
o Request for Comments (RFC) 3507 o J. Elson & A. Cerpa (2003 April)
q https://tools.ietf.org/html/rfc3507
[2] ICAP Extensions
o IETF Draft o M. Stecher et al. (2003 April)
q https://tools.ietf.org/html/draft-stecher-icap-subid-00
[3] ICAP Partial Content Extension
o Draft (unofficial) o M. Stecher & A. Rousskov (2010 May)
q http://www.icap-forum.org/documents/specification/draft-icap-extpartial-content-07.txt
© 2016 The MITRE Corporation. All rights reserved.

| 22 |
ICAP References ­ cont.
[4] ICAP Errata
o Measurement Factory (© 2014)
q http://www.measurement-factory.com/std/icap
© 2016 The MITRE Corporation. All rights reserved.

| 23 |
The Bro ICAP Analyzer
Ø Objectives
o Monitor link between web proxy and AV/DLP proxy
v IPs & Ports, Connection IDs
o Extract HTTPS messages from ICAP payload
v Analyze ICAP headers v Generate icap.log
o Invoke the Bro HTTP analyzer
v Invokes MIME analyzer, File analyzer, and... v Generates http.log, files.log, conn.log, and...
© 2016 The MITRE Corporation. All rights reserved.

| 24 |
Analyzing ICAP Requests & Responses

Ø ICAP Methods

o REQMOD

o RESPMOD
o OPTIONS o LOG *
Ø ICAP Status Codes

* LOG defined in [2] ICAP Extensions

o 1xx Informational o 2xx Success o 3xx Redirection o 4xx Client errors o 5xx Server errors

204 No modifications needed

© 2016 The MITRE Corporation. All rights reserved.

Analyzing ICAP Headers

ICAP Request Headers
Allow Authorization Cache-Control
Connected Date
Encapsulated Expires From Host

ICAP Response Headers
Cache-Control Connected Date
Encapsulated Expires
ISTag

Pragma Preview Referer
Trailer Upgrade User-Agent
© 2016 The MITRE Corporation. All rights reserved.

Pragma
Server
Trailer Upgrade

| 25 |
Headers defined in [1] RFC 3507
ICAP Options Headers
Allow
Date Encapsulated
ISTag Max-Connections
Methods Opt-body-type Options-TTL
Preview Service Service-ID Transfer-Preview Transfer-Ignore Transfer-Complete

| 26 |
Analyzing Extended Headers

ICAP Request Extensions
X-Authenticated-User X-Authenticated-Groups
X-Client-IP X-Server-IP X-Subscriber-ID X-LOG-[service-ID]
New Method: LOG LOG-[service-ID]

ICAP Response Extensions
X-ICAP-Profile X-Attribute
X-Attribute-Cacheability X-Attribute-Prefix X-Infection-Found X-Violations-Found X-Virus-ID X-Response-Info X-Response-Desc

ICAP Options Extensions
X-Include Attribute-List resp body
Headers defined in [2] ICAP Extensions

ICAP Request Extensions
x-patience 'Allow: 206' 'Allow: NNN', where NNN can be any token
© 2016 The MITRE Corporation. All rights reserved.

ICAP Response Extensions
use-original-body

ICAP Options Extensions
'Allow' header allowed

Headers defined in [3] ICAP Partial Content Extension

| 27 |
Analyzing Packet Captures
Ø RESPMOD Request Packet Ø RESPMOD Reply Packet
© 2016 The MITRE Corporation. All rights reserved.

| 28 |
The Encapsulated Header

Ø Per RFC 3507 [pg 17]

REQMOD request:

[req-hdr] req-body

REQMOD response:

{[req-hdr] req-body} ||

{[rsp-hdr] rsp-body}

RESPMOD request:

[req-hdr] [rsp-hdr] rsp-body

RESPMOD response:

[rsp-hdr] [rsp-body]

OPTIONS response:

opt-body || null-body

Ø Example:

NOTE: only one (1) body can be encapsulated within ICAP payload.

RESPMOD request: Encapsulated: req-hdr=0, rsp-hdr=440, rsp-body=990\x0d\x0a

© 2016 The MITRE Corporation. All rights reserved.

| 29 |
Building the Bro ICAP Analyzer
Ø Platform
o Linux CentOS 6.7 Server o 8-core CPU o Two 1-Gbps NIC
Ø Bro
o Version 2.4.1 o Local Cluster
v 1 Manager, 1 Proxy v 6 Workers [pin_cpus=2,3,4,5,6,7]
o PF_RING
© 2016 The MITRE Corporation. All rights reserved.

| 30 |
Building the Bro ICAP Analyzer
Ø BinPAC
o Version 0.44
q https://www.bro.org/downloads/binpac-0.44.tar.gz
o BinPAC QuickStart Guide
q https://github.com/grigorescu/binpac_quickstart/archive/master.zip
© 2016 The MITRE Corporation. All rights reserved.

| 31 |
Building the Bro ICAP Analyzer

Source Files

Description

v C++, BIF & BinPAC Files

src/analyzer/protocol/icap/

CMakeLists.txt
ICAP.cc & .h Plugin.cc

Indicates which compiler to use against which sourcecode files (C++ or BIF or BinPAC compiler).
Defines C++ class ICAP_Analyzer.
Defines C++ class Bro_ICAP::Plugin.

events.bif

Declares events generated by the ICAP analyzer.

icap.pac

Top-level BinPAC declarations.

icap-protocol.pac

Protocol-specific BinPAC declarations, defines data elements based on RFC 3507.

icap-analyzer.pac

Additional code launched after protocol-specific data elements are parsed, throws ICAP events.

icap-analyzer-http.pac

Additional code to assist processing and invoking the HTTP analyzer.

icap-analyzer-utils.pac Additional code to perform useful functions.

v Scriptland Files

scripts/base/protocols/icap/

main.bro

Bro script that handles and logs ICAP events.

dpd.sig

Bro dynamic protocol detection (DPD) script file is used to detect the ICAP protocol over a non-standard port.

Declares which ICAP-related scripts to load at Bro

__load__.bro

startup. By default, both `main.bro' and `dpd.sig' are

loaded at startup.
© 2016 The MITRE Corporation. All rights reserved.

Build Files

Description

v BIF Files

build/src/analyzer/protocol/icap/

events.bif.cc events.bif.h events.bif.init.cc events.bif.register.cc

Auto-generated by BIF compiler and moved into the Bro build tree.

v BinPAC Files
icap_pac.cc Icap_pac.h

build/src/analyzer/protocol/icap/
Auto-generated by BinPAC compiler and moved into the Bro build tree.

| 32 |
Bro ICAP Events & Weird Log

Bro ICAP Events

Description

icap_request_line icap_response_line icap_header icap_options icap_body_weird icap_chunk_weird icap_error
icap_done

Generated after REQUEST LINE is parsed
Generated after RESPONSE LINE is parsed
Generated after HEADER field is parsed
Generated after OPTIONS BODY is parsed
Generated if unexpected BODY format encountered
Generated if sum of chunks not equal to HTTP `content-length'
Generated for errors when decoding ICAP Requests & Responses Generated after a complete ICAP transaction: v ICAP Request followed by ICAP Response; and v After invoking HTTP analyzer.

Bro ICAP Weird

Description

Unrecognized ICAP Methods

ICAP_WEIRD: unknown ICAP method <string>

Unrecognized ICAP Versions

ICAP_WEIRD: unknown ICAP version <string>

Unrecognized ICAP Status Codes ICAP_WEIRD: unknown ICAP status code <string>

Unrecognized ICAP Header Names

ICAP_WEIRD: header: <string_1> : <string_2> :: method : <string_3> : is_orig : <string_4>

Unrecognized ICAP Body Format

ICAP_WEIRD: unknown ICAP body format <string_1> :: method : <string_2> : is_orig : <string_3>

© 2016 The MITRE Corporation. All rights reserved.

| 33 |
BinPAC Files: icap.pac & icap-protocol.pac

icap.pac

enum ICAP_MSG_BODY_TYPES { BODY_TYPE_NONE, BODY_TYPE_ACD, BODY_TYPE_AC, BODY_TYPE_CD, BODY_TYPE_D, BODY_TYPE_AB, BODY_TYPE_A, BODY_TYPE_B, BODY_TYPE_OPTS, BODY_TYPE_WEIRD,
}

# Message Body not present. # RESPMOD: (a) req-hdr, (c) rsp-hdr, (d) rsp-body # RESPMOD: (a) req-hdr, (c) rsp-hdr, (f) null-body # RESPMOD: (c) rsp-hdr, (d) rsp-body # RESPMOD: (d) rsp-body # REQMOD: (a) req-hdr, (b) req-body # REQMOD: (a) req-hdr, (f) null-body # REQMOD: (b) req-body # OPTIONS: (e) opt-body # Unexpected body format

icap-protocol.pac
ICAP_Request { ICAP_Request_Line ICAP_Message
}

ICAP_Response { ICAP_Response_Line ICAP_Message
}

ICAP_Message { ICAP_Headers ICAP_Body
}

ICAP_Request_Line { ICAP_Method ICAP_URI
ICAP_Version }

ICAP_Response_Line { ICAP_Version ICAP_Status_Code
ICAP_Reason }

ICAP_Headers { Array of ICAP_Header
}

© 2016 The MITRE Corporation. All rights reserved.

| 34 |
BinPAC Files: icap-protocol.pac

icap-protocol.pac ­ cont.

type ICAP_Message(is_orig : bool) = record

{

headers : ICAP_Headers(is_orig);

body

: case $context.flow.get_icap_body_type_from_encap_hdr(headers, is_orig) of

{

BODY_TYPE_ACD BODY_TYPE_AC

-> acd -> ac

: ICAP_Body_acd(is_orig); : ICAP_Body_ac(is_orig);

BODY_TYPE_CD BODY_TYPE_D BODY_TYPE_AB

-> cd -> d -> ab

: ICAP_Body_cd(is_orig); : ICAP_Body_d(is_orig); : ICAP_Body_ab(is_orig);

BODY_TYPE_A BODY_TYPE_B

-> a -> b

: ICAP_Body_a(is_orig); : ICAP_Body_b(is_orig);

BODY_TYPE_OPTS default

-> opts -> none

: ICAP_Body_options(is_orig); : empty;

};

};

type ICAP_Body_acd(is_orig : bool) = record

{

encap_req_hdr

: ICAP_Encapsulated_Http_Headers;

encap_rsp_hdr

: ICAP_Encapsulated_Http_Headers;

encap_rsp_bdy

: ICAP_Chunks(is_orig);

};

© 2016 The MITRE Corporation. All rights reserved.

| 35 |
BinPAC Files: icap-analyzer.pac & -utils.pac

icap-analyzer.pac
proc_icap_request_line() proc_icap_response_line() proc_icap_header() proc_icap_body_xxx() proc_icap_options() proc_icap_pdu()

Event Generation: HTTP Injection:
Event Generation: HTTP Injection:
Event Generation: HTTP Injection:
Event Generation: HTTP Injection:
Event Generation: HTTP Injection:
Event Generation: HTTP Injection:

icap-analyzer-utils.pac
get_icap_body_type_from_encap_hdr()

Event Generation: HTTP Injection:

icap_request_line none icap_response_line none icap_header none none proc_http_invoke_analyzer icap_options none icap_done none
icap_body_weird none

© 2016 The MITRE Corporation. All rights reserved.

| 36 |
BinPAC Files: icap-analyzer-http.pac

icap-analyzer-http.pac
proc_http_invoke_analyzer()

v Top-level function called by `proc_icap_body_x'; v Calls `_submit_all_headers' and `_submit_body'

proc_http_invoke_analyzer_submit_all_headers() v Calls `HTTP.cc :: HTTP_Analyzer::DeliverStream'
to inject Headers into HTTP protocol analyzer v Must submit each header field one-by-one

proc_http_invoke_analyzer_submit_body()

v Calls `HTTP.cc :: HTTP_Analyzer::DeliverStream'
to inject Body into HTTP protocol analyzer v Must check original Transfer Encoding

proc_http_reassemble_body()

v Used only for the purpose of creating an HTTP
Body that is NOT chunk-encoded v Event Generation: icap_chunk_weird

ICAP.h
#include "analyzer/protocol/http/HTTP.h"
class ICAP_Analyzer ... { public:
static analyzer::Analyzer* HttpAnalyzer(Connection* conn) { return new analyzer::http::HTTP_Analyzer(conn); } }
© 2016 The MITRE Corporation. All rights reserved.

| 37 |
BinPAC Files: Bugs & Challenges

Ø Compiler Error in icap_pac.cc

icap.pac
let body_ : int=BODY_TYPE_NONE

Workaround
v Added global variable `body_' within icap.pac
v Needed to fix a C-compiler error in 'icap_pac.cc :: ICAP_Message::ParseBuffer'.
v BinPAC compiler created the variable 'body_' in icap_pac.cc file but never defined it in icap_pac.cc or icap_pac.h.

© 2016 The MITRE Corporation. All rights reserved.

| 38 |
BinPAC Files: Bugs & Challenges

Ø ParseBuffer() Fails to Parse `chunk_data'

BIT-1500: "BinPAC Call to FlowBuffer::NewFrame with frame_length -1"

type TEST_Chunk = record {

len_line : bytestring &oneline;

chunk_data : bytestring &length = chunk_length;

opt_crlf

: case chunk_length of {

0

-> none: empty;

default

-> crlf: bytestring &oneline;

};

} &let {

chunk_length : int = bytestring_to_int(len_line, 16); # in hexadecimal

};

type TEST_Chunks = record { chunks : TEST_Chunk[] &until($element.chunk_length == 0);
};

Resolution (V. Grigorescu):

TEST_Chunk { TEST_Chunk_Size TEST_Chunk_Data
}

TEST_Chunk_Size { bytestring
}

TEST_Chunk_Data { bytestring &length = TEST_Chunk_Size;
}

© 2016 The MITRE Corporation. All rights reserved.

| 39 |
Caveats & Limitations
Ø Operational Testing
o Biased toward RESPMOD transactions o REQMOD not yet observed/tested o OPTIONS & Preview headers ignored
Ø Bro Connection 4-tuples & Identifiers
o IP addresses derived from ICAP extended headers o TCP port is always 1344 o Connection IDs overlap multiple unrelated user-
sessions per ICAP session
© 2016 The MITRE Corporation. All rights reserved.

| 40 |
Caveats & Limitations
Ø REQMOD vs RESPMOD
o REQMOD yields HTTP request body o RESPMOD yields HTTP response body o Need both for full visibility
Ø Transport Layer vs Application Layer
Encryption
© 2016 The MITRE Corporation. All rights reserved.

| 41 |
Summary
Ø Encrypted Web Traffic
o Blind spot for typical network security & monitoring o Majority of web traffic
Ø Web proxy w/content inspection & SSL/TLS
interception capabilities?
o If so... Bro ICAP Analyzer! o ICAP headers yield user ID and original IPs o ICAP payload yields decrypted copy of HTTPS
messages
© 2016 The MITRE Corporation. All rights reserved.

| 42 |
Future Work
Ø REQMOD Testing Ø Revisit/optimize BinPAC code:
o ICAP_Message & Encapsulated Headers o body_ global variable
Ø Submit ICAP Analyzer to Bro Project Team
© 2016 The MITRE Corporation. All rights reserved.

| 43 |
Questions?

Approved for public release. Distribution unlimited. Case number 16-3302.

© 2016 The MITRE Corporation. All rights reserved.

| 44 |
Back-Up Slides

Approved for public release. Distribution unlimited. Case number 16-3302.

© 2016 The MITRE Corporation. All rights reserved.

