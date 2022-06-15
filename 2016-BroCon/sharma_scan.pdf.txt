UNIVERSITY OF CALIFORNIA

Scan-detection Internals: clusterization and netcontrol for active-response
Aashish Sharma
14th September 2016 #BroCon2016

· Managed and operated by UC for the U.S. Department of Energy · >200 University of California faculty on staff at LBNL · 4200 Employees, ~$820M/year Budget · 13 Nobel Prizes · 63 members of the National Academy of Sciences
(~3% of the Academy)
· 18 members of the National Academy of Engineering, 2 of the Institute of Medicine
· Birthplace of Bro

Advanced Light
Source

Molecular Foundry

Energy Sciences Network

Joint Genome Institute FLEXlab

National Energy Research Supercomputer

Over 10,000 visiting scientists (~2/3 from universities) use Berkeley Lab research facilities each year

· ·
­ · ·
·

Philosophically a scan is an attribution or an intentionality problem but operationally we want to make it a measurement problem.
- Partha Banerjee, LBL

·
· · · ·
*M. Javed and V. Paxson. Detecting stealthy, distributed SSH brute-forcing. In Proc. ACM SIGSAC conference on Computer & communications security, pages 85­96, 2013

Q. How many incidents are detected at Scan Phase?
Ans: We might not even have an incident yet (at the scan phase)
Q. Of all the incidents we detect, for how many can we go back to and find the scan-phase that might have caused it ?
Q. How many incidents happen without any scan-phase/recon ?
Sharma, A., Kalbarczyk, Z., Barlow, J., and Iyer, R. Analysis of security data from a large computing organization. In Dependable Systems & Networks (DSN) (2011), IEEE.

· ·

# S0

Connection attempt seen, no reply.

# S1

Connection established, not terminated

# SF

Normal establishment and termination.

# REJ

Connection attempt rejected.

# S2

Connection established and close

attempt by originator seen (but no reply from

responder).

# S3

Connection established and close

attempt by responder seen (but no reply from

originator).

# RSTO Connection established, originator

aborted (sent a RST).

# RSTR Established, responder aborted.

# RSTOS0 Originator sent a SYN followed by a

RST, we never saw a SYN-ACK from the responder.

# RSTRH Responder sent a SYN ACK followed

by a RST, we never saw a SYN from the (purported)

originator.

# SH

Originator sent a SYN followed by a FIN,

we never saw a SYN ACK from the responder

(hence the connection was "half" open).

# SHR

Responder sent a SYN ACK followed by

a FIN, we never saw a SYN from the originator.

# OTH

No SYN seen, just midstream traffic (a

"partial connection" that was not later closed).

·
­
·
­
·
­
·
­
·
­

skip sources

UDP check

skip

skip

services

nets

Established?

No
backscatter
distinct_peers/ shutdown Threshold
Landmine
AddressScan

skip ports
Yes
PortScan
LowPortTroll
 $Id: scan.bro 7073 2010-09-13 00:45:02Z vern $  720 lines of code  Need to clusterize  &sync not useful anymore

· · · · · · ·

· · ·

KnockKnock

LandMine

 Incoming remote IP connection and checks it against table of known-services for the LBNL IP and accesses if that's a good or bad connection.
 Policy is adaptive based on popularity of ports

 Policy - ingests the list of allocated subnets from a text-file using input-framework
 Any connection not in the above list is a Darknet Connection
 "N" such connections lead to a conclusion that this is a scanner
 Block the IP.

AddressScan & LowPortTrolling  "Bro treats connections differently depending on application protocol.  Bro only performs bookkeeping if the connection attempt failed (was either unanswered, or elicited a TCP RST response).  For others, it considers all connections, whether or not they failed. It then tallies the number of distinct destination addresses to which such connections (attempts) were made.  If the number reaches a configurable parameter N, then Bro flags the source address as a scanner. By default, Bro sets N = 100"

Backscatter  Generally Victims of DoS attacks  result of address spoofing  Not really scanners

· Communication overhead -
·
· ·
­ · ·

Return

module Clus;
export {
global m_w_add: event (ip: addr); global w_m_new: event (ip: addr); global add_to_cache: function(ip: addr);
global intermediate_cache: table [addr] of string &redef;
}
@if ( Cluster::is_enabled() ) @load base/frameworks/cluster redef Cluster::manager2worker_events += /Clus::m_w_add/; redef Cluster::worker2manager_events += /Clus::w_m_new/; @endif
function log_reporter(msg: string) {
event reporter_info(current_time(), msg, peer_description); }
event new_connection(c: connection) {
local ip = c$id$orig_h;
if (ip !in intermediate_cache) {
add_to_cache(ip) ; } }

function add_to_cache(ip: addr) { log_reporter(fmt ("add_to_cache %s", ip)); intermediate_cache[ip] = fmt("%s",peer_description);
@if ( Cluster::is_enabled() ) event Clus::w_m_new(ip);
@endif }
@if ( Cluster::is_enabled() && Cluster::local_node_type() == Cluster::MANAGER ) event Clus::w_m_new(ip: addr)
{ log_reporter(fmt ("w_m_new: %s", ip)); if ( ip in intermediate_cache )
return;
intermediate_cache[ip] = fmt("%s",peer_description); event Clus::m_w_add(ip); } @endif
@if ( Cluster::is_enabled() && Cluster::local_node_type() != Cluster::MANAGER ) event Clus::m_w_add(ip: addr)
{ log_reporter(fmt ("m_w_add: %s", ip)); intermediate_cache[ip] = fmt("%s",peer_description); } @endif

Heuristic

OldScan

scan-NG

LandMine

Limited: Manual define Landmine addresses const landmine_address: set[addr] &redef;

Extensive - derives allocated vs unallocated subnets

if (resp in Site::local_nets && resp !in

Site::subnet_table)

Extended feature

AddressScan

Same global distinct_peers: table[addr] of set[addr]

Shutdown Threshold Same > N failures

No Change No change

Consistent

Backscatter

Limited to a few ports const backscatter_ports = { 80/tcp, 53/tcp, 53/udp, 179/tcp, 6666/tcp, 6667/tcp, } &redef;

Port Agnostic

Extended feature

Relies on a new logic to infer reflection attacks and

static src ports

if (|distinct_backscatter_peers[orig][orig_p]| < 2)

Knockknock
clusterized false +ve

Did not exist
No Plenty due to directionality problems due to content_gaps

Maintains list of valid services in the network Tracks failed connections to non-existing services
Uses really low and dynamic thresholds New

Yes

New

Very few overall - still testing

Improvement

Memory

tables and sets

use hyperloglog (opaque of cardinality) resulting in 80% less memory usage

· · · · · ·

Counter Name
new_conn_counter
is_catch_release_active
not_scanner
darknet_counter not_darknet_counter
already_scanner_counter
filter_entry filter_success

Counters ~ 1 day
184,772,975
273578054 (148%)
170877124 (92.47%)
62747298 (33.95%) 13601622 (7.36%)
79308450 (42.92%)
58024703 (31.40%) 27135590 (14.68%)

c_knock_filter c_knock_checkscan
c_land_filter c_land_checkscan
c_backscat_filter c_backscat_checkscan

58024703 (31.40%) 21936393 (11.87%)
21392978 (11.57%) 19848677 (10.74%)
58024703 (31.40%) 2005200 ( 1.08%)

c_addressscan_filter c_addressscan_checkscan
worker_to_manager_counter

58024703 (31.40%) 4510730 (2.44%)
27133670 (14.68%)

run_scan_detection

24965156 (13.51%)

Counters ~ 7 days
1,569,935,400 (100%) 2,382,883,254 (151.78%)
797,378,521 (50.79%) 103,620,129 (6.60%)
320,578,718 (20.41%) 435,007,325 (27.70%)
384,651,055 (24.5%) 185,705,196 (11.82%)
384,651,055 (24.5%) 151,338,638 (9.63%) 384,651,055 (24.5%)
32,029,192 (2.04%) 384,651,055 (24.5%) 121,802,144 (7.75%)
384,651,055 (24.5%) 139,784,051 (8.9%)
176,982,937 (11.27%)
173,071,224 (11.02%)

100%

31%

31%

150%

11%

31%

15%

13%

12%

2.5%

10%

1%

.5 %

43%

·

·
­
·

· ·

· · ·
­
­ ·
­

1473416025.833145 Scan::KnockKnockScan 108.61.123.72 scanned a total of 12 hosts: [80/tcp] (port-flux-density: 6) (origin: FR distance: 5528.29 miles) - 108.61.123.72 -manager Notice::ACTION_DROP,Notice::ACTION_LOG 60.000000 F -
Block is removed due to catch-n-release timer expiration kicking in ...

1473419748.634896 Scan::WebCrawler

108.61.123.72 crawler is seen: yacybot

(/global; amd64 FreeBSD 10.3-RELEASE-p7; java 1.8.0_92; GMT/en) http://yacy.net/bot.html -

108.61.123.72 worker-11 Notice::ACTION_LOG

1473419748.634896 Scan::PurgeOnWhitelist 108.61.123.72 is removed from known_scanners after whitelist: [scanner=108.61.123.72, status=T, detection=KnockKnockScan, detect_ts=1473416025.886353, event_peer=worker-11, expire=F] 108.61.123.72 worker-11 Notice::ACTION_LOG 3600.000000 F

 removes from known_scanners  removes from catch-n-release hell  removes ACLD blocks on the router, if any

-
-
-

S.no Uniq scanners in /24 How many such /24

1

3

55634

2

10

4141

3

25

913

4

100

53

5

200

8

May 8 08:08:35 Scan::KnockKnockScan 112.74.135.36 scanned a total of 3 hosts: [21/tcp] (port-flux-density: 6) (origin: CN distance: 0.00 miles) on 128.3.28.64 128.3.20.30 128.3.28.110 112.74.135.36 manager Notice::ACTION_LOG,Notice::ACTION_DROP 3600.000000 F

May 8 08:08:35 History::SF_to_Scanner outgoing SF to scanner 112.74.135.36 112.74.135.36 Notice::ACTION_LOG

Conn.log :

May 8 03:49:46 May 8 03:49:55 May 8 03:49:46 May 8 03:51:23 May 8 03:51:26 May 8 03:51:29 May 8 03:51:31 May 8 03:51:34 May 8 03:51:37 May 8 03:51:40 May 8 03:51:46 May 8 03:51:48

112.74.135.36 61291 112.74.135.36 61291 128.3.28.110 3 131.243.2.64 20 131.243.2.64 20 131.243.2.64 20 131.243.2.64 20 131.243.2.64 20 131.243.2.64 20 131.243.2.64 20 131.243.2.64 20 131.243.2.64 20

128.3.28.110 21

tcp

128.3.28.110 21

tcp

112.74.135.36 10 icmp

112.74.135.36 56755 tcp

112.74.135.36 57266 tcp

112.74.135.36 57735 tcp

112.74.135.36 58196 tcp

112.74.135.36 58595 tcp

112.74.135.36 59047 tcp

112.74.135.36 59431 tcp

112.74.135.36 60295 tcp

112.74.135.36 60692 tcp

3.059543 S0
9.073815 0.789239 0.656309 0.672116 0.381356 0.722489 0.378877 0.543354 0.569139 0.783772

0 0 S0

152 0 520 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

OTH SF SF SF SF SF SF SF SF SF

·
· ·

· ·
Sep 5 23:13:10 Scan::KnockKnockScan 131.117.245.15 scanned a total of 12 hosts: [4028/tcp] (port-flux-density: 2) (origin: IQ distance: 7482.10 miles) Sep 5 23:13:15 Scan::KnockKnockScan 124.106.53.200 scanned a total of 5 hosts: [4028/tcp] (port-flux-density: 3) (origin: PH distance: 6999.04 miles) Sep 5 23:48:19 Scan::KnockKnockScan 125.26.23.65 scanned a total of 3 hosts: [4028/tcp] (port-flux-density: 6) (origin: TH distance: 7855.57 miles)

 Provides summary of  when scan started,  when it ended,  when was it detected  how many connections were made by the scanner  how many uniq hosts did it touch  latency of detection  total duration of the scan
 Clusterized  Memory efficient - relies on opaque of cardinality  Incremental scan-summary for the lifetime of the scanner

Conn_table

20 Mins

10 mins - keep building state for ALL connections
expire

60 Mins

check if known_scanner Yes
Populate Scan_summary on worker

keep updating counts on workers

manager_update_scan_summary

bro network_time()

Bro

Broker

ACLD

Quagga

Routers

Detection Time

system_time()

Broker: Netcontrol acld_add_rule Broker:

Broker:

ACLD: Completion timestamp

system_time()

800 s
ACLD: Arrival timestamp

timestamp 1473663871.195220 1473663871.195220 1473663871.226191 1473663871.226378
1473663871.226359 1473663871.226420
1473663871.227030

Action Scan::KnockKnockScan

Delta (tn - tn-1) t=0s

NetControl::REQUESTED t=0s

Brokerlisten: Got event

30.9 ms

brokerlisten:INFO:Sending 187 s to ACLD

ACLD Arrival timestamp

-0.19 s

ACLD Complete Timestamp

61 s

brokerlisten:INFO:Received 610 s from ACLD

Source notice.log netcontrol.log broker.log broker.log
acld.log acld.log
broker.log

· · · ·
· ·
·

·
­
·
­
·
­
·

· ­
· · · · · ·
·

Users

Developers

notice.log and scan-summary.log

access to known_scanners table

memory efficient

use of hyperloglog and bloom-filters

whitelist capability/ Dynamic darknets and configs on fly

input-framework + tap into reporter_error event

stable code plug & play

extendable and modular clusterization insights

speed & accuracy

you can fix scan.bro

Bro People
how to make table persistent
hard to find data-structure sizes/usage
dealing failures in input-files due to lame typos
Manager CPU is mystery
ability to account of w2m and m2w events
Should scan-detection be in C++ land instead of policy land ?

· ·
­ ­ ·
· · · ·
·
­ ­ · ·

· ·
­ ·
­
· ·
­ ­ ­ · ­
· · ·

· ·
· · · · · ·

