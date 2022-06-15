Creating the Bro RFB (VNC) parser
Martin van Hensbergen, Fox-IT

Agenda
· Introduction · Context: How we use Bro · The dangers of VNC · VNC protocol · Dev · Deploy · Future work

Introduction
· Martin van Hensbergen - Fox-IT · Studied Mathematics at University of Delft · Worked at Fox-IT 2001-2011 + 2016-? · Mostly as developer but also in few other areas
· 2007-2011, worked on FoxReplay · Software for full-content reconstruction of network data · Lawful interception & forensics purposes · Required network protocol knowledge

Bro at Fox-IT

Bro at Fox-IT
· We use Bro in three major services: · Passive Audits -  · Compromise Assessments -  · Incident Response - 

Bro at Fox-IT
· We use Bro in three major services: · Passive Audits - network  · Compromise Assessments -  · Incident Response - 

Bro at Fox-IT
· We use Bro in three major services: · Passive Audits - network  · Compromise Assessments - network+hosts  · Incident Response - 

Bro at Fox-IT
· We use Bro in three major services: · Passive Audits - network  · Compromise Assessments - network+hosts  · Incident Response - network+hosts 

Bro at Fox-IT - Passive Audit
· We take a `photograph' of the network by passively monitoring 4 weeks of network traffic
· Combination of: · Bro · Suricata · Custom tooling

Bro at Fox-IT - Passive Audit
· Bro gives us a very detailed run-down on: · Protocols used in a network · Flow data
· Suricata gives us alerting on known-bad

Bro at Fox-IT - Passive Audit

Bro

Use strengths of multiple products

Suricata

Wireshark

Bro at Fox-IT - Passive Audit
· Mix: Automated and manual analysis · Deliver report on security of the network

Bro at Fox-IT - Passive Audit
· Some things we look for: · Weak protocols (security wise) / SSL configs / Plaintext passwords · `Weird' traffic / Context surrounding alerts · Network segmentation · Services exposed to e.g. outside world · Remote administration tools · RDP ... why not RFB/VNC?

VNC basics
· Versatile protocol to view and control GUI's over a network connection.
· Original spec (v3.3) by Olivetti Research Lab in 1998, later maintained by RealVNC: v3.7 in 2003 and v3.8 in 2007.
· Protocol published under RFC6143 by RealVNC in 2011

VNC basics
· Server runs RFB server ( e.g. RealVNC server ); listens on (default) TCP port 5900 · RFB client connects over network · Client can control server over network

The dangers of VNC

The dangers of VNC
· My colleague Yonathan Klijnsma did some research on publicly reachable VNC servers
· It's 2016 .... VNC IS EVERYWHERE!

The dangers of VNC

The dangers of VNC

Dangers of VNC
· All good and fun until...

The dangers of VNC - IoT

Dangers of VNC
· All good and fun untill:

Dangers of VNC
· VNC connections open to: · Medical devices · SCADA systems · Factories · Homes

Dangers of VNC
· VNC: · no- or weak authentications · unencrypted

Bro Wishlist
· What would we want to see from a security perspective: · are there RFB servers in the network? · from where and when are they accessed, for how long? · which software is used? · what kind of authentication is used, was it successful? · other useful information?
· Bonus exercise: can we get a screenshot? 

VNC protocol

VNC protocol
ProtocolVersion Handshake Security Handshake
SecurityResult Handshake Client/Server Init messages
Frames!

VNC protocol
ProtocolVersion Handshake Security Handshake
SecurityResult Handshake Client/Server Init messages
Frames!

VNC protocol - Identification

Client

Server Version
Client Version

Server

VNC protocol - Identification

Client

Server Version
Client Version

Server

12 byte string "RFB xxx.yyy\n" RFB 003.003 - RFB 003.007 - RFB 003.008

RFB 002.000 RFB 003.002 RFB 003.003 RFB 003.004 RFB 003.005 RFB 003.006 RFB 003.007 RFB 003.008 RFB 003.010 RFB 003.016 RFB 003.033 RFB 003.039 RFB 003.043 RFB 003.130 RFB 003.236 RFB 003.889 RFB 004.000 RFB 004.001 RFB 005.000 RFB 009.123 RFB 009.221 RFB 009.963 RFB 103.006

Identified RFB headers in the wild.
Apple Remote Desktop RealVNC Personal RealVNC Enterprise
Source: Y. Klijnsma

VNC protocol - Identification
· Certain version numbers can be attributed to certain software

VNC protocol
ProtocolVersion Handshake Security Handshake
SecurityResult Handshake Client/Server Init messages
Frames!

VNC protocol security
· Server sends a list of supported `security types' · These determine form of authentication
(examples): · 1 = No authentication · 2 = VNC authentication · 30 = Apple Remote Desktop authentication

VNC protocol - VNC authentication

16 byte challenge

Client
16 byte response

Server

DES(challenge) with password derived key

VNC protocol - VNC authentication
· Custom authentication types possible · Found VNC server implementation that does
send username/password in cleartext over wire
·

VNC protocol
ProtocolVersion Handshake Security Handshake
SecurityResult Handshake Client/Server Init messages
Frames!

VNC protocol - Security result
· Server always sends an explicit acknowledgment if authentication succeeded.
· If not successful: connection aborted

VNC protocol
ProtocolVersion Handshake Security Handshake
SecurityResult Handshake Client/Server Init messages
Frames!

VNC protocol - Init messages
· Client sends ClientInit message with a `shared_flag'
· Shared flag determines mode of operation:
· 1 = Allow other connections to remain if present
· 0 = Disconnect other connections for exclusive access

VNC protocol - Init messages
· Server sends ServerInitMsg, containing: · name of the server · width/height of shared screen in pixels · 16 bytes of pixel information encoding information

VNC protocol
ProtocolVersion Handshake Security Handshake
SecurityResult Handshake Client/Server Init messages
Frames!

VNC protocol - frame messages
· After the initial handshake, the server sends a complete representation of the server's screen to the client
· One should be able to reconstruct a complete screenshot from the screen using this first message!

VNC protocol - frame messages

VNC protocol - frame messages
120x120 1160x960 120x840

VNC protocol - frame messages
120x120 1160x960 120x840 Compress & Encode

VNC protocol - frame messages
Header

VNC protocol - frame messages
· Complete screen update first!
· Then: Client and Server can send messages at will:
· containing keystrokes, mouse pointer movements, screen updates.
· For our purpose too much effort at this stage

VNC protocol - Recap
ProtocolVersion Handshake Security Handshake
SecurityResult Handshake Client/Server Init messages
Frames!

Bro Wishlist
· What would we want to see from a security perspective: · are there RFB servers in the network? · from where and when are they accessed, for how long? · which software is used? · what kind of authentication is used, was it successful? · other useful information Server name, screen dimensions?
· Bonus exercise: can we get a screenshot? 

Dev/test/deploy

Dev/test/deploy
· Ingredients for creating a protocol parser: · wireshark and loads of sample PCAPs · knowledge of BinPac and Bro policy writing · knowledge of the protocol (obviously)

Dev

BinPac (protocol parsing) Scripts

· Define events to emit
· Define protocol messages
· BinPac creates C++ parser
Define DPD to identify streams to process Connect events from parser to log output

Testing

Create tests based on pcaps
Supply suspected output of your parser

Dev - where to start
· documentation on-line · learn from existing protocol parsers · https://github.com/grigorescu/binpac_quickstart
· creates some boilerplate code for you to get your parser up and running
· bro-dev mailinglist · great supportive community!

Dev - be prepared
· #1 - No matter how simple the protocol, there's always a catch
· #2 - No matter how well your protocol parser is, someone will always present you with a pcap that doesn't parse

Dev - be prepared
· #1 - No matter how simple the protocol, there's always a catch

BinPac (protocol parsing)
· Ideally, we would like to have something like this:
Each message self-descriptive (SMB!)

Dev

BinPac

Dev

BinPac

Dev

BinPac

· RFB messages do not contain e.g. a command identifier, or total size of the message
· How to interpret a set of bytes depends on the messages before it
· rfb-protocol-analyzer.pac implements state machine

State machine BinPac
`state' - defines step in our protocol.
After successfully
parsing a message, `state' gets
updated accordingly.

State machine BinPac
Awaiting Server Banner

Awaiting Client Banner

3.3

3.7

Awaiting Server Auth Types 3.3

Awaiting Server Auth Types 3.7

...

...

Finish

State machine BinPac
Awaiting Server Banner

Awaiting Client Banner

3.3

3.7

Awaiting Server Auth Types 3.3

Awaiting Server Auth Types 3.7

...

...

Finish

Dev - be prepared
· #2 - No matter how well your protocol parser is, someone will always present you with a pcap that doesn't parse

Reality...

BinPac

· Many different dialects, custom features and specific implementations hamper parsing
· E.g. custom authentication protocols

Dev - events Scripts
Logical breakdown of events

Dev - DPD

Scripts

· Supply DPD signature

Dev - test

Testing

· Test framework allows you to submit a sample pcap with expected output for (regression) testing

Dev - test

Testing

· Simple test:

· Execute:

Dev
BinPac (protocol parsing)

Scripts

· Deploy!

Testing

Dev - deploy

Dev - deploy

Dev - deploy
· What would we want to see from a security perspective: · are there RFB servers in the network? · from where and when are they accessed, for how long? · which software is used? · what kind of authentication is used, was it successful? · Server name, screen dimensions?
· Bonus exercise: can we get a screenshot? 

Dev - deploy
· Are there RFB servers in the network? · bro-cut id.resp_h < rfb.log | sort | uniq

Dev - deploy
· From where and when are RFB servers accessed, for how long?
· bro-cut -d ts id.orig_h id.resp_h service duration < conn.log | grep rfb
$ bro-cut -d ts id.orig_h id.resp_h service duration < conn.log | grep rfb 2016-03-27T17:45:51+0200 192.168.2.115 192.168.2.125 rfb 1.775081 2016-03-27T17:45:53+0200 192.168.2.115 192.168.2.125 rfb 2.778796 2016-03-27T17:45:48+0200 192.168.2.115 192.168.2.125 rfb 2.813754

Dev - deploy
· Which software is used? · bro-cut client_major_version client_minor_version <
rfb.log | sort | uniq -c | sort -nr · bro-cut server_major_version server_minor_version <
rfb.log | sort | uniq -c | sort -nr · Look for server/client versions: e.g. 3.889 = most likely
Apple Remote Desktop

Dev - deploy

· What kind of authentication is used, was it successful?

· bro-cut id.resp_h authentication_method auth < rfb.log

$ bro-cut id.resp_h authentication_method auth 192.168.2.125 VNC T 192.168.2.125 VNC F 192.168.2.125 VNC -

< rfb.log

Dev - deploy
· What kind of Server name, screen dimensions are used, was the connection exclusive?
· bro-cut id.resp_h desktop_name name width height share_flag < rfb.log
$ bro-cut id.resp_h desktop_name name width height share_flag < rfb.log 192.168.2.125 root's X desktop (martin-VirtualBox:1) 1024 768 T 192.168.2.125 - - - 192.168.2.125 - - - -

Recap
· We have seen why it is interesting to parse RFB
· We have seen how RFB works and what information we can get from parsing the protocol
· We have seen what steps to take to build and test a protocol parser
· We have seen how we can answer our research questions

Recap
· First version of RFB parser commit:
· Will be in 2.5 release

Future work
· Handle different dialects/authentication types/ implementations (pcaps welcome!)
· TLS over VNC support · Generating screenshot files from initial screen
update  · martin.vanhensbergen@fox-it.com

Thanks
· Thanks for listening!

