Network Application Firewalls: Exploits and Defense

Defcon 2011

AppSecure

Brad Woodberg, Juniper Networks
bwoodberg@juniper.net twitter: @bradmatic517

1

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

AGENDA
Discussion
 Beyond Layer 4 ­ App-FW Explained  Can Do / Can't Do, Vulnerabilities and Limitations  Exploitation in Action  Getting it Right
Key Issues
 Application Firewalling does not replace traditional security mechanisms like stateful firewall and full IPS
 Application Firewalling has limitations even when properly implemented, there are also a number of potential network pitfalls.
 How to properly deploy this technology in conjunction with traditional security mechanisms.

2

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

EVOLUTION
Client: 1.1.1.1

Server: 2.2.2.2

Access List

Src-IP: 2.2.2.2, Dest-IP: 1.1.1,1, Src-Port 80, Dest-Port 2481, Protocol TCP, (SYN/ACK)

Stateful Firewall

Application Firewall

Src-IP: 2.2.2.2, Dest-IP: 1.1.1,1, Src-Port 80, Dest-Port 2481, Protocol TCP, (ACK)

GET /index.html HTTP /1.0 Host: www.google.com User-Agent: Mozilla/5.0 Accept: text/html Accept-Language: en-us Accept-Encoding
Accept-Encoding: gzip,deflate Accept-Charset: ISO-8859-1
Keep-Alive: 115 Connections: keep-alive

HTTP/1.1 200 OK Content-Type: text/html
Server: Apache Date: Wed, 09 Feb 2011 Cache-Control, private <malicious javascript, aurora exploit,
shellcode>

Full IPS

3

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

WHAT'S NEW?
1. Application Identification (AppID) goes beyond traditional stateful firewalls by inspecting some Layer 7 payload to identify the application.
2. AppID does not inspect the entire session like full IPS, and only identifies the application, not other activity like exploits.
3. AppID has actually be around for a long time in numerous technologies, but was not typically a user controlled feature.

4

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

APPID PATTERN MATCHING
1. FW Check 2. Preprocessing: Serialize, Order, Reassemble 3. Pattern Match

String Matching Algorithms
Boyer-Moore Aho-Corasick (Hybrid)
Rabin-Karp

Finite State Machines
DFA, NFA, Hybrids

Hardware, other algorithms
Many other solutions exist...

5

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

*Source: http://en.wikipedia.org/wiki/String_searching_algorithm

NESTED APPLICATIONS
Layer 1: Cat 5, Fiber, Wifi Layer 2: Ethernet Layer 3: IPv4, IPv6 Layer 4: TCP, UDP Layer 7: HTTP
Layer 7: Nested Application
Pandora Streaming Audio Facebook Application

6

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

APPLICATION ID SIGNATURE EXAMPLES

Layer 7 Application ID Example

Layer 7 Nested Application ID Example

application FTP:

nested-application Facebook:Application

client-to-server:
dfa-pattern "\[(USER|STAT|PORT|CHMOD|ACCOUNT|BY E|ASCII|GLOB|HELP|AUTH|SYST|QUIT|STOR |PASV|CWD|PWD|MDTM).*"; etc etc etc

parent-protocol HTTP;
member m01
context http-header-host; pattern "(.*\.)?(facebook\.com|fbcdn\.net)"; etc etc etc direction client-to-server;

server-to-client: dfa-pattern "(220|230|331|530).*"; etc etc etc

member m02 context HTTP URL pattern "/ap\.php\?i=.*|.*"; etc etc etc direction client-to-server;

*Note many implementations use Closed Source AppID signatures

7

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

FEATURES THAT RELY ON APPLICATION ID
1. Layer 7 services may rely on the results of AppID to determine if they are interested in the session, so tricking Application ID can have impacts on whether these services are used or not.
Application Firewall

Src-IP: 1.1.1.1 Dst-IP: 2.2.2.2
Dst-Port: 80 Src-Port: 41932 Protocol: TCP

Session = HTTP
APP ID

IPS Anti-Virus URL Filtering Anti-Spam

DLP

QoS

8

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

APPLICATION CACHING
1. Application ID is Expensive 2. Results typically the same for IP/Protocol/Port 3. Improved Performance
Sample Application Cache Table

9

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

\(PRE\)PROCESSING

"I say we take off and nuke the site from orbit. It's the only way to be sure"
~Ripley

10

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

SAID WORDS ARE TRUE

Egon: There's something very important I forgot to tell you. Venkman: What? Egon: "Don't cross the streams."

11

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

PREPROCESSING: FRAGMENTATION / SEGMENTATION
1. Like IPS, Application Firewall must serialize, order, and reassemble packets/application data before trying to do pattern matching.
2. E.g. Matching pattern "HTTP" in a GET request "GET /index.html HTTP/1.0"

Multiple IP Fragmentso, mneuspt raecaskseetm, b(nleoberfeoareswseemcabnldyorpeaqttuerinremda)tching, or we will not detect
string "HTTP" in any individual packet

IP Packet 1

IP Packet 2

IP Packet 3 IP Packet 4

GET GEGT/Ei/niTndde/eixnx.dh.hetmtxm.lhltmHTl HTPT/HT1PT.0/1.0 TP/1.0

12

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

PREPROCESSING: ORDERING
1. We must properly order packets/segments before performing pattern matching 2. E.g. Matching pattern "HTTP" in a GET request "GET /index.html HTTP/1.0"
Multiple IP Fragments/Segments, must reassemble before we can do pattern matching, or we will not detect string "HTTP" in any individual packet

Multiple packets/segments, out of

Reassembloerdd,ewr e can match the pattern properly now

IP Packet 3 IP Packet 2

IP Packet 1 IP Packet 4

HT G/iEnTde/ixn.dhetmx.lhtml HGTETTP/1.0 TP/1.0

13

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

PREPROCESSING: PROPER REASSEMBLY
1. What if attacker sends two fragements/segments with a different payload? 2. E.g. Matching pattern "HTTP" in a GET request "GET /index.html HTTP/1.0"

Segment 1

Segment 2

(permitted segment 3)

HTTP

Segment 4

GET

/index.html

/1.0

SIP (denied segment 3)

14

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

NETWORK APPLICATION IDENTIFICATION

Ripley: How many drops is this for you, Lieutenant? Gorman: Thirty eight... simulated. Vasquez: How many *combat* drops? Gorman: Uh, two. Including this one.

15

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

APPLICATION IDENTIFICATION 1/3
1. Must Pass Some Traffic (Bi-directionally) before Application can be identified 2. In this example, TCP 3-way handshake completed, but no L7 payload has been sent so application
has not be identified.

16

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

APPLICATION IDENTIFICATION 2/3
1. Actual detection must occur on payload, here HTTP has been identified after Layer 7 exchange.

17

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

APPLICATION IDENTIFICATION 3/3
1. Application Firewalling itself doesn't inspect beyond the application ID, so it doesn't stop attacks.

18

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

LIMITATIONS, VULNERABILITIES, EXPLOITATION

Hudson: Movement. Signal's clean. Range, 20 meters. Ripley: They've found a way in, something we've missed. Hicks: We didn't miss anything.

Hudson: 17 meters. Ripley: Something under the floor, not in the plans, I don't know. Hudson: 15 meters. Newt: Ripley!!!

Hicks: Definitely inside the barricades. Newt: Let's go. Hudson: 12 meters.

Ripley: That's right outside the door. Hicks, Vasquez get back. Hudson: Man, this is a big f#$*kin' signal. Hicks: How are we doing Vasquez, talk to me?

Vasquez: Almost there.

Vasquez: There right on us.

Hicks: Remember, short controlled bursts.

19

Hudson: 9 meters. 7. 6. Copyright © 2011 Juniper Networks, Inc. www.juniper.net

Ripley: That can't be; that's inside the room!

CLIENT / SERVER COLLUSION
1. Start connection as a permitted application, after Application Firewall is done, switch it to another!

20

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

IMPORTANCE OF BIDIRECTIONAL INSPECTION
1. May not inspect both Client to Server and Server to Client: Poisoned Results

21

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

REVERSING PROTOCOL TRAFFIC
1. Application Firewall may not differentiate the Client and the Server directions, this can be used to trick AppFW and other Layer 7 services.
2. What happens if you switch the client to server and server to client traffic, do you an improper match?
3. For this AppFW, no, but perhaps others?

22

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

PORT BASED DETECTION?
1. Perhaps not all detection is actually based on actual application identification, some may only inspect on certain ports, or may just deem a certain port an application without an AppID match.
DNS Traffic on Port 53

Exact same traffic on any other port
23

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

APPLICATION CACHE POISONING 1/6
1. Example, simple policy, block SMTP on any port, allow anything else

24

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

APPLICATION CACHE POISONING 2/6
1. We try sending SMTP over port 80, it get's blocked as expected
(Server-to-Client) 220 smtp.example.com ESMTP Postfix

25

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

APPLICATION CACHE POISONING 3/6
1. Let's poison the cache with HTTP first (with several connections for good measure) then try the same test.
2. Application 109 stands for HTTP, we sent 20 separate HTTP connections to 192.168.2.13 on port 80

26

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

APPLICATION CACHE POISONING 4/6
1. Now send SMTP traffic in a new connection, same port / protocol / server, it's permitted!

27

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

APPLICATION CACHE POISONING 5/6
1. Cache Hit!

28

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

APPLICATION CACHE POISONING 6/6
1. All new connections are detected as HTTP, yes I was working on this at 5am.

29

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

CACHING NESTED APPLICATIONS
1. This is a bad idea. 2. While we'd like the performance gains, multiple applications can be hosted on the same
host/protocol/port both maliciously and legitimately. 3. Attackers can use this even more easily than port based application cache attacks. 4. Doesn't require client and server collusion to work, .
Instead, we should perform AppID on all nested applications or just block the access to that server / protocol / port altogether.

30

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

CONFLICT RESOLUTION
1. What happens if a traffic stream has characteristics of two or more applications, how to best select the application.
2. Difficult problem to solve, some applications look very similar especially at first. (e.g. SMTP + FTP) 3. Evasive applications and malicious attackers may try to compromise accurate detection. 4. Can try to exploit this to determine effectiveness of application firewalls for example:
1. HTTP might look for patterns like "GET|POST|HTTP"
2. SIP might look for patterns like "Request|Register|Status"
3. What if custom protocol leveraged both, would the application firewall detect it as HTTP, SIP, or unknown?
e.g. "GET /Request Register 1.1"

31

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

APPLICATION LAYER GATEWAYS W/APPLICATION FW
1. Application Layer Gateways (ALG) inspect control channels of certain protocols like FTP/MSRPC/SUNRPC/RTSP/SIP &c to open additional pinhole sessions for auxillary data channels (amongst other tasks).
2. Impacts of ALG's on Application Firewalls will vary based on implementation and protocols. 3. Some data channels cannot be accurately inspected with Application Identification because they
are pure byte streams (e.g. FTP data), encrypted/compressed (RTP), or transient in nature.

32

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

UNKNOWN APPLICATION PROTOCOLS 1/4
1. What happens when Application ID can't identify an application? 2. Some implementations don't inspect traffic at layer 7 at all when the Application can't be identified
(not even stream or packet attacks!)
Step 1, open session

33

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

UNKNOWN APPLICATION PROTOCOLS 2/4
1. Initially before the Application ID completes see that Layer 7 processing is enabled for the session

34

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

UNKNOWN APPLICATION PROTOCOLS 3/4
1. We send some traffic 2. Once Application ID completes, no
more Layer 7 processing even with Full IPS Enabled!! 3. Further analysis showed that the traffic was being fast pathed in the ASIC NPU at this point, the packets weren't even being sent to the processor where FW / IPS is handled! 4. By Default!

35

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

UNKNOWN APPLICATION PROTOCOLS 4/4
1. Application Level Exchange

36

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

OBFUSCATION

1. Encryption: You can't really use a signature. A common technique is if a protocol is unknown, to measure the randomness of data (entropy) to determine if it is encrypted. Typically this can't tell what the application is, but rather that it is an unknown encrypted application.
2. Steganography: Hiding a message in plain sight. This is a very hard problem to solve, an Application Firewall or IPS likely won't be able to detect this. Bayesian-like filtering would need to be used to improve detection.
3. Tunneling: Applications can be tunneled in other protocols (e.g. GRE, IPinIP, SSL, and many other derivatives. Application Firewall may not be able to detect inner protocols.

Encrypted BitTorrent Application, no standard pattern.

<BitTorrent Client> Data:
474554202F616E6E6F756E63653F696E666F5F68 6173683D...

<BitTorrent Server> Data:
485454502F312E3020323030204F4B0D 0A436F6E74656E74...

37

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

APPID W/O PATTERN MATCHING
1. Some application identification isn't based upon application signatures at all. This is especially true of encrypted applications where pattern match is not reliable.
2. Some detection may be based upon IP Address, for instance classifying known P2P Supernodes or TOR exit points based upon IP address and not based on an actual pattern match or other heuristic method.
3. Some detection is a combination of IP based matching and pattern matching for other aspects of the traffic.

38

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

WHAT DOES APPLICATION FIREWALL CHANGE?
It is a step better than Stateful Firewall alone, but a subset of real IPS.

It's a lightweight way to keep honest applications honest, compared to IPS (thus likely a lower cost).

If already using a solid firewall + IPS implementation, it can save IPS time by not inspecting unwanted "honest" applications.

Can be used to block unknown encrypted communication, but some obfuscation methods like
steganography are likely to evade.

39

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

FUTURE TRENDS FOR APPLICATIONS
1. More applications running over HTTP, more applications leveraging SSL encryption (even for nonHTTP protocols.)
2. Smarter applications that are more efficient such as SPDY, but also applications that include encryption/compression for maximum efficiency.
3. Evasive applications will go to great lengths to hide themselves. Expect to see more custom encryption, along with encryption within SSL.
4. Expect malicious/evasive applications to try to blend in with regular traffic. Using methods of standard encryption and also advanced mechanisms like steganography.

40

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

SOLVING LIMITATIONS IN APPFW
1. Application / Protocol Anomaly Detection 2. Full IPS for Exploit Protection 3. Disable Caching 4. Check default settings

In addition, everything you already know still holds true

Network Access Control
1. Strict control over access to the network.
2. Quarantine guest/compromised hosts.

Stateful Firewall:
1. Deploy with full stateful FW 2. Leverage L3/L4 IPS
Protections and Session Control 3. Always use a tight FW rulebase with strict control on source/destination IP Addresses + L4 Protocol/Ports

Full IPS:
1. Full IPS solution should be used with appropriately tuned policy on top of Stateful FW + Application FW.
2. Leverage Protocol Anomaly Protection to detect evasion techniques
3. Don't just use IDS mode!

Malware Protection
1. Network Based Malware protection and URL Filtering can be helpful, but additional protection is needed.
2. Desktop Malware protection is still required to protect against advanced threats

41

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

Q&A
Questions and Answers? - bwoodberg@juniper.net ­
Twitter: @bradmatic517

42

Copyright © 2011 Juniper Networks, Inc. www.juniper.net

