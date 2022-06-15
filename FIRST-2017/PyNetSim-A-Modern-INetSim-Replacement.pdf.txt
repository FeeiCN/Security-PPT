PyNetSim
A modern INetSim Replacement
Jason Jones FIRST 2017

BackGround

Why?
 Research teams may need a simulated environment because
 They are not allowed to directly contact malware C2s  Trying to avoid tipping off threat actors  Command-and-control servers are down
 DNS redirection isn't enough
 Hard-coded DNS servers still circumvent  Hard-coded IP addresses in lieu of DNS
 Internet simulation also allows for
 Possibility of collecting client communications used to develop signatures  Keeping malware alive in memory long enough to take memory snapshots for static analysis  Test protocol re-implementation for a botnet monitoring system  QA of parsing / implementation of intelligence feeds  Possibility to direct actions of executed malware to activate certain pieces of code

© Arbor Networks 2016

3

Existing Solutions

INetSim

 The Original Internet Simulator  Written in Perl L  Built-in traffic redirection support relies on obsolete ip_queue support in Linux
kernel
 Other ways to get around this
 Significant Protocol Support
 HTTP(S)  SMTP(S)  POP3(S)  FTP(S)  DNS  TFTP  IRC  Others

© Arbor Networks 2016

5

FakeNet-NG

 Released by FireEye's FLARE team at BlackHat USA 2016
 https://github.com/fireeye/flare-fakenet-ng/  Actively maintained
 Supports multiple protocols + SSL on most protocols
 TFTP  SMTP  POP  IRC  HTTP  FTP  DNS
 Windows + Linux support (only recently learned of Linux support)
 AFAICT, no dynamic protocol / SSL support  Doesn't speak malware protocols

© Arbor Networks 2016

6

PyNetSim

PyNetSim
 Built using Python3  Goal is to dynamically detect the TCP / UDP protocol used
 Detect HTTP on non-standard ports  Detect Telnet on non-standard ports  Detect TLS/SSL enabled connections on non-standard ports
 Attempt to detect malware protocol used and speak that protocol
 Allows for "proper" responses to keep an infected system "talking"
· Keeps malware running for memory forensics, debugging purposes
· Directed execution via commands sent back
 Example: Alina requires a non-standard HTTP status code of 666 in the response  Example: Mirai CnCs have increasingly used ports 80 and 443 to evade port-based
blocking, but is very recognizable in comparison to HTTP / HTTPS

© Arbor Networks 2016

8

Configuration

© Arbor Networks 2016

9

Traffic Redirection

 Two ways to handle traffic redirection...
 The hard way
· Using NFQUEUE
· NFQUEUE allows for incoming packets to be assigned to a queue that a listening program can consume from
· Consuming the packets allows for parsing and manual response of things that would otherwise be rejected
· Allows for keeping records of original address and port
· Requires manual everything - handshakes, seq/ack calculation, ACKs, etc.
 The easy way
· Use built-in IPTABLES functionality
· -j REDIRECT to send all ports from specified protocols to a single port
· Now only need to listen on one port and let kernel take care of the rest
· Downside: lose the original address and port which may help to hint the protocol

© Arbor Networks 2016

10

PyNetSim Protocols
 Targeting protocols that may be used by malware to communicate or exfiltrate data  Dynamic SSL detection  DNS ­ UDP & TCP
 Respond with hardcoded or random non-RFC 1918 address  Responds to A, AAAA, MX, TXT, and CNAME types
 HTTP
 DirtJumper / Drive families  Andromeda
 Telnet
 Simple login / shell simulation
 SMTP  FTP  IRC  Binary malware protocols
 Mirai  LizardStresser

© Arbor Networks 2016

11

Dynamic Protocol Detection
 Inspired by scapy's "guess_payload" functionality for dissecting packets properly
 Peek at first payload, pass to known L7 protocol layers
 Each high-level protocol may then opt to pass to child protocols
 First test for a TLS Client Hello
 If detected, use ssl.wrap_socket and then continue checking the payload
 Each protocol has a set of defined child protocols in the config  Each protocol has its own set of options to use  Use dpkt where possible to help guess protocol using its parsing layers

© Arbor Networks 2016

12

Protocol Detection Example - SMTP

© Arbor Networks 2016

13

Demos

Conclusion

 Available on GitHub
 https://github.com/arbor-jjones/pynetsim
 Future Work
 Automated building / setup via Dockerfile / Vagrant / etc  Solidify TLS / SSL support
· Dynamic generation of self-signed certs based on name in SNI
· Storage of keys for passing back to analyst / processing system to decrypt traffic
 Pcap / payload export
· Include decrypted SSL payloads
 REST-ful API to query data  Better traffic redirection  Properly handle "special" DNS queries
· SORBS / DNS-based blacklist checks used by malware like Sarvdap
· Proper DNS exfiltration responses where required

© Arbor Networks 2016

15

16

