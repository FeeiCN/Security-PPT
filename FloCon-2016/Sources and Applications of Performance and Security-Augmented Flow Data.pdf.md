Sources and Applications of Performance and Security-
Augmented Flow Data
Avi Freedman, CEO FloCon 2016 January 2016

Background: NetFlow/IPFIX/sFlow
· NetFlow is:
­ A 20-year old technology now supported in some variant by most network devices, hosts, and sensors.
­ And much smaller than storing all packets, so useful for longer term metadata storage and search.
· sFlow came later, is simpler and more accurate in real-time because it's just packet sampling.
· IPFIX and Netflow v9 are extensible via templates, and allow sending more than just `basic flow' data via those templates.
· Both via IPFIX/v9 and other formats, there are many sources of app semantics + performance data that work will with flow-like analysis patterns.

`Classic' Flow

`Classic' Flow
· Classic flow records contain byte and packet counters, TCP Flags, AS, next-hop, and other data aggregated by (usually) the `5 tuple' of (protocol, srcip, dstip, srcport, dstport). VLAN, mac, MPLS, packet size histogram and other data often available.
· Most devices support a fixed sampling rate.
· Despite the relative simplicity of data, there are many use cases for basic flow data for monitoring availability, efficiency, and security of networks, hosts, and applications.

Classic Flow Use Cases
· Classic use cases include:
­ Congestion analysis for providers and/or customers ­ Peering analytics ­ Trending, planning and forecasting ­ (d)DoS detection (primarily volumetric) ­ Basic forensic/historic (who did an IP talk to) ­ Modeling of TE, what-if analysis ­ Customer cost analysis (Flow + BGP communities) ­ Many security use cases for even `classic' Flow:
· Convolve with threat feeds, DNS, BGP · Finding extrusion (or at least indicators), fast flux, botnet c+c,
service scanning, long-lived low-bw comms, service compromise, anomalies in many dimensions...

Classic View: Traffic by Source ASN

Classic View: Interface -> Interface Traffic

Classic View: Traffic by top AS_PATHs

Classic View: dDoS Detection

Classic View: Device to AS to Geo

`Augmented' Flow

`Augmented' Flow
· `Who talked to who' data is great, but if we can get:
­ Semantics (URL, DNS query, SQL query, ...) ­ Application performance info (latency, TTFB, ...) ­ Network performance info (RTT, loss, jitter, ...) from passive observation, it unlocks even more/more interesting use cases!
· With many of the same basic report structures. · Some of this is already available via IPFIX/V9 from
many devices. Or via nprobe and argus for host/sensor. Or as flow-like sources fo data.

Sources of `Augmented' Flow
· Server-side
­ OSS sensor software: yaf, nprobe, argus ­ Commercial sensors: nBox, nPulse, and others ­ Packet Brokers: Ixia and Gigamon (IPFIX, potentially more) ­ IDS (bro) ­ a superset of most flow fields, + app decode ­ Web servers (nginx, varnish) ­ web logs + tcp_info for perf ­ Load balancers ­ advantage of seeing HTTPS-decoded URLs ­ CISCO AVC, Netflow Lite ­ generally only on small devices
· Common challenge: Some of the exporters don't support sampling, and many tools can't keep up with un-sampled flow. And many tools can't easily map + store augflow fields. (Tradeoff: speed vs flexibility)

augflow Examples: yaf
· https://tools.netsa.cert.org/yaf/docs.html · http://linux.die.net/man/1/yafdpi · `Base' yaf supports entropy, packet size distribution, estimation
of TCP setup time (reverseFlowDeltaMilliseconds), app ID, and a few other fields. · yafdpi can extract and send in IPFIX many varieties of application semantics: FTP, HTTP, IMAP, RTSP, SIP, SMTP, SSH, DNS, IRC, NNTP, POP3, SLP, TFTP, MySQL · No performance data added

augflow Examples: nprobe
· http://ntop.org · template.c in nprobe (and elsewhere) · Includes both network and with pro plugins, some application performance, and many kinds
of application semantics: DHCP, MySQL, RADIUS, DHCP, HTTP, SMTP, SIP, RTSP, GTP · sysdig perhaps most interesting for APM-like use cases · Can export in JSON and other formats in addition to IPFIX

augflow Examples: argus
· http://qosient.com/argus/ · http://qosient.com/argus/man/man1/ra.1.pdf · Custom format to preserve richness that IPFIX does not allow · Data can be sent in CSV for use (with augflow) with other tools · Rich network-layer performance data (jitter, latency sliced many ways),
infer topology, ...

augflow Examples: Cisco AVC
docwiki.cisco.com/wiki/AVC-Export:PfR#PfR_NetFlow_Export_CLI

augflow Examples: Citrix AppFlow
http://docs.citrix.com/en-us/netscaler/10-5/ns-system-wrapper-10-con/ns-ag-appflowintro-wrapper-con.html https://github.com/splunk/ipfix/blob/master/app/Splunk_TA_IPFIX/bin/IPFIX/informationelements/netscaper-iana.xml_full

augflow Examples: nginx, bro
· http://nginx.org/en/docs/http/ngx_http_core_module.html#variables · https://www.bro.org/sphinx/logs/index.html · Not `flow' but can be translated and stored similarly!
nginx: log_format combined '$remote_addr - $remote_user [$time_local] ' '"$request" $status $body_bytes_sent ' '"$http_referer" "$http_user_agent"' `$tcpinfo_rtt, $tcpinfo_rttvar, $tcpinfo_snd_cwnd, $tcpinfo_rcv_space';

Storing and Accessing
Augmented Flow
· Data back-ends need to be able to understand and ingest the extra fields.
· Often requires integration (for OSS/big data tools) or vendor support.
· And if the tools aren't `open' via API, SQL, or CLI, data can be trapped and not as useful.
· Many first use cases are ad-hoc to prove effectiveness, then drive to UI reports/dashboards.
· Holy grail: semantics + end user app perf + net perf + net flow + host perf + app internals instrumentation.
· Note: Semantics also useful for performance and performance data useful for security!

One Extensible Flow Storage: fastbit
· https://sdm.lbl.gov/fastbit/ · https://github.com/CESNET/ipfixcol/ · http://www.ntop.org
(nprobe CLI) fbquery -c 'DST_AS,L4_SRC_PORT,sum(IN_BYTES) as inb,sum(OUT_BYTES) as outb' \ -q 'SRC_AS <> 3 AND L4_SRC_PORT <> 80' \ -g 'DST_AS,L4_SRC_PORT' \ -o 'inb' \ -r -L 10 -d .

Storing Augmented Flow in Fastbit

Use Case: Network Performance
· If the flow system can aggregate by arbitrary dimensions by AS, AS_PATH, Geo, Prefix, etc...
· Then looking at raw network performance from passive sources can be very useful.
· Ex: TCP rexmit by AS_PATH (i.e. from nprobe for a server or, via span/tap, a sensor).
· Important to weight absolute relevance (not just % loss if a few 3 pkt flows).

SQL -> Fastbit Querying for rexmit
(c) 2013-2015 CloudHelix Inc., All rights reserved. Private & Confidential

Augmented Flow: rexmit by Dest ASN

Augmented Flow: rexmit by AS_PATH

Use Case: Application-Level Attacks
· With URL and performance data, many kinds of application attacks can be detected.
· To get * URL info in an HTTPS world, will need to get data from load balancers or web logs.
· Simplest is WAF ­ looking for SQL fragments, binary, or other known attack vectors.
· Can hook alerts to mitigation methods, even if running OOB (for example, send TCP FIN/RST in both directions)

Use Case: `APM Lite'
· Combining network with application data, you can answer questions like:
­ Show/aggregate cases where application performance is impaired but we know there is no network-layer issue (very useful), and agg by POP, server, app section.
­ Or where there is impairment in both. ­ And ignore network-layer issues where users are
unaffected.
· Easy first use case: API perf debugging for web page assembly, or debugging CDN origin pull.

Use Case: Bot detection
· With performance information combined with URL, basic e-commerce bot detection is possible.
· Many attacks are advanced so may require a packet approach to get complete visibility, but basic visibility can often demonstrate a problem.
· Can sometimes be done with syslog analytics, but flow tools often aggregate in interesting ways (geo, AS) that syslog analytics don't, at least out of the box.

Modern `Flow' Format: kflow
· At today's speeds, async(ly)-templated formats may not be the most efficient (space/CPU) implementation.
· See also: http://www.ntop.org/nprobe/yes-theres-lifeafter-netflow/ (but Kentik prefers binary to JSON/Kafka)
· Working on an open-spec format called kflow with open source tools to take to and from NetFlow, sFlow, IPFIX, nginx and bro logs, and Cisco, Citrix, ntop, and other vendor formats.
· Based on Cap'n Proto, which is a `serialization' lib that is basically a struct with 0-packing https://capnproto.org/
· Drawback: Can't delete fields, just 0-pack them.
· Will shortly be live at https://github.com/Kentik

Flow with Cap'n Proto kflow v1

kflow v2
· Cap'n Proto is fast and compact. · But to support many extended fields (imagine every
bro and argus field) could still become unwieldly. · And can't easily delete fields/version. · Don't love templating, but ading OOB vs inband+async
templates. Generated .H from server-side tools:
static short KFLOW_CUSTOM_COLULMNS[] = {KFLOW_CUSTOM_FOO_FID, KFLOW_CUSTOM_MYINT_FID, KFLOW_CUSTOM_MYFLOAT_FID}; static short KFLOW_CUSTOM_COLULMN_TYPES[] = {KFLOW_CUSTOM_FOO_TYPE, KFLOW_CUSTOM_MYINT_TYPE, KFLOW_CUSTOM_MYFLOAT_TYPE};
(*kfrec)->dst_as = 10; (*kfrec)->src_as = num; (*kfrec)->sample_rate = 1028; (*kfrec)->src_bgp_as_path = strdup("100 200 300"); (*kfrec)->custom[KFLOW_CUSTOM_MYINT_OFF].val.i_val = 128; (*kfrec)->custom[KFLOW_CUSTOM_MYFLOAT_OFF].val.f_val = 64.5; (*kfrec)->custom[KFLOW_CUSTOM_FOO_OFF].val.s_val = strdup("FOO");

Summary/Takeaways
· Many sources of `augmented flow' · Even web and bro/snort/suricata logs · Finding a tradeoff between flexibility and speed
in storage can be a challenge · But with unified augflow data, the same flow
forensics repositories can do triple or more duty with operational, performance, and additional security analytics

Comments / Questions?
Avi Freedman avi (at) kentik.com

