TCP 
 (platinum) @ ChinaUnix weibo.com/bjpt@-PT
cu.platinum@gmail.com 2013.09.05

Internet Status Quo

Internet Status Quo
Frequency Statistics
4 3 2 1 0



250000 200000 150000 100000
50000 0

Frequency Statistics in 2 weeks

1 2 3 4 5 6 7 8 9 10 11 12 13





Deployment
Internet
Block Collect & Analysis (IP/PORT/DPI/DFI)
LAN

Interference Principle

Client

PT

Server

Fake RST

RST

Handshake

Client

Sequence Number Poisoning
PT
fake seq fake ackseq

Server

Only 53ms?!

Handshake

This is the REAL SYN/ACK sent from server! Real RTT = 278ms, not 53ms...

ISP Caching

Client

PT

Server

302 Found + FIN

ISP Caching

AD Insertion

Client

PT

Server

HTTP 200 + FIN

AD Insertion

AD Insertion

IP -> TTL

Windows FreeBSD Linux Solaris Cisco Router

128 64 previous 255, now 64 previous 255, now...? previous 255, now @#%^!~@&

IP -> TTL

How to resolve it?
And more complex methods...

Our AI
Anti-Interference Test

Reference
http://en.wikipedia.org/wiki/IPv4_header#Header http://seclists.org/nmap-announce/1999/326 http://www.map.meteoswiss.ch/map-doc/ftp-probleme.htm http://www.binbert.com/blog/2009/12/default-time-to-live-ttl-values/ http://en.wikipedia.org/wiki/Wireshark http://web.eecs.umich.edu/~zhiyunq/tcp_sequence_number_inference/

Thanks!
Q & A

