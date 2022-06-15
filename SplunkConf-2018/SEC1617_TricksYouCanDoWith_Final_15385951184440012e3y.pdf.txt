© 2018 SPLUNK INC.
Tricks You Can Do with NetFlow Analytics
How to extract value from this ubiquitous data source
David J. Cavuto, CISSP | Staff Sales Engineer, NY Metro
October 2018 | Version 2.0

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. Faor important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Bio

 Bell Labs

David J. Cavuto

· Principal Engineer - Lucent VPN Firewall

 AT&T

· Network security and analytics

 Narus

· Product Manager ­ Narus Cyber Analytics

 Splunk

· Sales Engineer, Security SME

· Principal Product Manager ­ Splunk App for Stream

· Principal Product Manager ­ Data Ecosystem Area

 David J. Cavuto dcavuto@splunk.com

© 2018 SPLUNK INC.

 NetFlow Introduction · Format and structure · Different Names and Versions · Netflow and Splunk Stream
 Basic Analytics  IToA Analytics  Security Analytics  Wrap Up

Agenda

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
NetFlow Introduction
Background and Technology Overview

NetFlow Inspiration
Cisco originated it to gain visibility into router traffic
 Designed to be used on Routers  Stateful, but minimizing memory usage  Unidirectional
· All TCP and some UDP generate TWO independent flow records · Often difficult to correlate deterministically  New Versions added more features later

© 2018 SPLUNK INC.

NetFlow Architecture
Two Main Components
 Traffic is observed via Flow Exporter · Can be inband (eg router or switch) or out of band (eg packet capture)
 Flow Exporter sends to Flow Collector

Router (Flow Exporter)

Flows

Flow Collector

© 2018 SPLUNK INC.

Bytes 0-3 4-7 8-11 12-13 14-15 16-19 20-23 24-27 28-31 32-33 34-35 36 37 38 39 40-41 42-43 44 45 46-47

Contents srcaddr dstaddr nexthop input output dPkts dOctets first last srcport dstport pad1 tcp_flags prot tos src_as dst_as src_mask dst_mask pad2

NetFlow Format and Structure
Version 5

© 2018 SPLUNK INC.

Description Source IP address Destination IP address IP address of next hop router SNMP index of input interface SNMP index of output interface Packets in the flow Total number of Layer 3 bytes in the packets of the flow SysUptime at start of flow SysUptime at the time the last packet of the flow was received TCP/UDP source port number or equivalent TCP/UDP destination port number or equivalent Unused (zero) bytes Cumulative OR of TCP flags IP protocol type (for example, TCP = 6; UDP = 17) IP type of service (ToS) Autonomous system number of the source, either origin or peer Autonomous system number of the destination, either origin or peer Source address prefix mask bits Destination address prefix mask bits Unused (zero) bytes

 Most Common version  Available on just about every device
that generates Flow messages  Has flow metadata and statistics
information  Note that flow is UNIDIRECTIONAL
· Each metric (packets, bytes, etc) only has a single value
Source: plixer.com

Flow Versions:  NetFlow v5  NetFlow v9
· Templates · Vendor Extensions  IPFIX (v10)  sFlow - switches

Versions and Names
At least 3 primary versions in popular use
Other Names:  jFlow  cFlowd

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk Stream and NetFlow
Splunk Stream is a NetFlow Collector!
 Stream can act as an active NetFlow collector (not promiscuous capture)  Flow v5, v9, IPFIX  Templates and Vendor Extensions  450,000 flows/second
· (32 core / 64 GB in Independent Stream Forwarder mode)

© 2018 SPLUNK INC.
Basic Analytics
Basic NetFlow Analytics

Internal Host Inventory
Shows which hosts are inside your network
 Determine internal networks
· Can use macro with lookup table if complex · Here we use cidrmatch for simple RFC1918 internal networks
 Summarize with stats  Optionally output with outputcsv to store and diff

Search Syntax
sourcetype=stream:netflow | where (cidrmatch("192.168.1.0/24", src_ip) OR cidrmatch("10.0.0.0/8", src_ip) OR cidrmatch("172.16.0.0/16", src_ip)) | stats count by src_ip | sort +src_ip

Visualization

© 2018 SPLUNK INC.

Session Stitching
Connects the two sides of the unidirectional flow records

 Use "Client" and "Server" to differentiate different roles of "src" and "dest"
 Transaction is used to stitch two related flow records using client/server addresses and ports
 Here we use HTTP/S to nail down a server port
Search Syntax
sourcetype=netflow | where src_port in (80,443) OR dest_port in (80,443) | eval direction=if(dest_port in (80,443), "forward", "reverse") | eval client_ip=if(direction=="forward", src_ip, dest_ip) | eval server_ip=if(direction=="reverse", src_ip, dest_ip) | eval client_port=if(direction=="forward", src_port, dest_port) | eval server_port=if(direction=="reverse", src_port, dest_port) | eval cs_bytes=if(direction=="forward",bytes, cs_bytes) | eval sc_bytes=if(direction=="reverse",bytes, sc_bytes) | transaction maxpause=10s maxevents=2 startswith=direction="forward" endswith=direction="reverse" client_ip server_ip client_port server_port | where eventcount=2

Visualization

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
IToA Analytics
Bandwidth and Host Monitoring

Bandwidth per Host
Shows how much bandwidth each host is using
 Determine host-host connectivity in total bytes or bits/second  Use the "bytes" field and "stats" command to perform
arithmetic sum  Group by source and destination for summary  Add an optional threshold to filter out noise  Visualize with Sankey diagram (downloadable)

Search Syntax
sourcetype=netflow | rename sum(bytes) AS sumbytes | eval mb=round(sumbytes/(1024*1024),1) | stats sum(mb) AS total_mb by src_ip, dest_ip | where total_mb>xxx

Visualization

© 2018 SPLUNK INC.

Internal Server Ports
Shows which hosts are acting as servers
 Select internal destination hosts
· `is_internal_net` macro, matching previous expression
 Use heuristic: src_port > dest_port  Display ports and counts for each IP  Especially useful with sFlow (from internal
switches)

Search Syntax
sourcetype=netflow | `is_internal_net(dest_ip)` | where src_port>=dest_port AND dest_port!=0 | stats count by dest_port,dest_ip | eval dpc=dest_port." (".count.")" | stats values(dpc) as "port (count)" by dest_ip | sort +dest_ip

Visualization

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Security Analytics
Lateral Movement and Ransomware

© 2018 SPLUNK INC.
Lateral Movement over Common Ports
Explores connections made between internal hosts using commonly-exploited services
 Use Internal networks on both sides of the flow  Chooses dest ports from common list of
exploited services

Search Syntax
sourcetype=netflow | `is_internal_net(src_ip)` | `is_internal_net(dest_ip)` | where dest_port in (22,23,25,53,80,123,135,443,445,3389,5900,5901) | stats sum(count) as count by src_ip, dest_ip, dest_port | sort +dest_ip,+dest_port,+src_ip

Visualization

Potential Data Exfiltration
Looks for outbound data flow over HTTP/S

 Uses the base "session stitching" technique introduced above for HTTP/S
 Looks for server-heavy sessions (more bytes sent than received)
 Summarizes by ASN of recipient and internal client

Search Syntax
sourcetype=netflow |`session_stitch_http` | `is_internal_net(client_ip)` | where sc_bytes > 2*cs_bytes | lookup asn ip AS server_ip | stats sum(sc_bytes) as totalbytes by client_ip, autonomous_system | eval sent_mb=round(totalbytes/1024/1024,1) | where sent_mb>1

Visualization

© 2018 SPLUNK INC.

Ransomware Detection
Finds multiple SMB connections between two hosts in short time periods

© 2018 SPLUNK INC.

 Looks over known SMB ports (139, 445) for ransomware attacking file servers
 For multiple connections in a short period of time
 Doesn't work on newer versions of SMB, where persistence is enabled, but v1 and v2 should work

Search Syntax
sourcetype=netflow | where dest_port in (139,445) | bucket span=1m _time as timebucket | stats count by src_ip, dest_ip, timebucket | eval timebucketstring = strftime(timebucket,"%Y-%m-%dT%H:%M:%S") | where count >=6

Visualization

© 2018 SPLUNK INC.
Wrap Up

Information Density
How do make practical use all this data?
 NetFlow is voluminous · Individual records contain very little information · However, large volumes are quite valuable · But still difficult to make use of
 So how do we deal with it?! · Summary Indices · Data Model Acceleration
 Licensing? · Discounts discounts discounts ­ ask your RSM!

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Key Takeaways
Just skip to this Slide

1. Hi Volume/Lo Value =
Information Density
2. Gives you critical visibility for
day-to-day operations
3. Volume Pricing incentives
(Talk with your RSM!)

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

