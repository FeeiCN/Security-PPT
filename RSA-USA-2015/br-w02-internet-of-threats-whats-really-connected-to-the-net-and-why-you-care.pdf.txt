SESSION ID: BR-W02
Internet of Threats: What's Really Connected to the Net and Why You Care

Trey Ford
Global Security Strategist Rapid7 LLC @treyford

#RSAC

#RSAC
Agenda
 Internet Scanning  Global Overview  Exposure Trends  Affecting Change

#RSAC
What this talk is NOT about
 Making fun of technology users due to product flaws  Image galleries of open industrial systems  Snapshots of baby monitor cameras  Shaming product vendors  ShellHeartPoodleBleed  Pew Pew Attack Maps

#RSAC
Internet Scanning

#RSAC
Why Scan the Internet?
 Improve security decision making with real-world data
 Fix endemic security flaws before they get exploited  Prioritize vulnerability research according to impact
 Improve open source security tools
 Hold vendors accountable  Make the Internet safer
 The kids are doing it

#RSAC
Why You Shouldn't Scan the Internet
 Network administrators can see scans as attacks  Scanning the internet is resource-intensive  Lots of complaints (legal & physical)  IP addresses constantly shuffling  Processing can be difficult
Skip all of this and use publicly available data!

#RSAC
Internet Scanning with Project Sonar
 Focused entirely on IPv4 and public DNS records
 1.0.0.0 to 223.255.255.255  Exclude reserved & private ranges  Exclude our opt-out list
 Scan about 3.7 billion IPv4 addresses
 Scans run sequentially, from a single server  Typically span Monday - Friday
* Unless you opted out, see https://sonar.labs.rapid7.com/

#RSAC
TCP & UDP Scanning
 Use Zmap to scan all of IPv4 (except for opt-out ranges)  UDP scans are throttled to 180,000 pps on average  TCP scans only send the SYN packet  AWS nodes used to grab banners  Data is de-duplicated & decoded  Uploaded to https://scans.io/

Project Sonar TCP & UDP Services

UDP

UDP

SSL

53

1900

25

111

5060

143

123

5351

443

137

5353

993

623

17185

995

1434

47808

#RSAC
TCP 22* 80* 445*

#RSAC
Reverse DNS Enumeration
 Reverse DNS lookup of 0.0.0.0/0 every two weeks
 Use dozens of cloud nodes to balance the load  Accidentally melted a few Tier-1 ISPs*
 1.2 billion PTR records on average

#RSAC
Forward DNS Enumeration
 Forward DNS is driven by a giant list of hostnames
 Pulled from TLD/gTLD zone files  Extracted form SSL certificates (SAN/CN)  Extracted from HTTP scan HTML references  Extracted from PTR records
 1.4 billion records on average

#RSAC
Data, Tools, and Documentation
 Public Datasets
 https://scans.io/
 Open Source Tools
 https://zmap.io/  https://nmap.org/  https://github.com/rapid7/dap/ && https://github.com/rapid7/recog/
 Documentation
 https://github.com/rapid7/sonar/wiki

#RSAC
Other Projects & Data Sources
 Active scanning projects with public data
 University of Michigan: https://scans.io/  Shodan: https://shodan.io/
 Older scanning projects with public data
 http://internetcensus2012.bitbucket.org/ (2012)
 Previous scanning projects
 Critical.IO (2012-2013)  PTCoreSec (2012+)  Metlstorm: "Low Hanging Kiwi Fruit" (2009+)  Nmap: Scanning the Internet (2008)  BASS (1998)

#RSAC
Global Overview

Global IPv4 Probe Responses

#RSAC

Source: 2015-04-06 Shodan ICMP scan + Project Sonar UDP & TCP scans

Hilbert Graphs UDP Only

ICMP Only

#RSAC
Combined

Source: 2015-04-06 Shodan ICMP scan + Project Sonar UDP & TCP scans

#RSAC

#RSAC
What is the internet?
 In terms of unique systems? Nobody really knows
 Cisco claimed 8.7 billion in 2012, predicted 15 billion in 2015  Carrier NAT hides millions of connected nodes  Firewalls and traditional NAT hide the rest  Over 7 billion active mobile phones  IPv6 gateways also do IPv4 NAT

#RSAC
What is directly exposed on the IPv4 internet?
 Approximately 1 billion IPv4 systems are directly connected
 ~500 million broadband clients and gateways  ~200 million servers (web, email, database, VPN)  ~200 million mobile devices (phones, tablets)  ~100 million devices (routers, printers, cameras)

#RSAC
What about IPv6?
 Somewhere between 10-20 million IPv6 global unicast nodes
 97.6% of top-level domains have an IPv6 DNS record*  6.7 million domain names with a top-level AAAA record*  RIPE has issued over 8000 network blocks  HE.net TunnelBroker alone serves 562,000 users
* 2015-04-19 Hurricane Electric IPv6 Progress Report http://bgp.he.net/ipv6-progress-report.cgi

#RSAC
Exposure Trends

#RSAC
Service Trends
 Project Sonar has been tracking 12 UDP services since June 2014  Scans run weekly and provide a quick snapshot of exposure  Most should never be exposed to the internet  Many can lead to a direct compromise  How have exposure levels changed?

UDP Service Exposure (Non-)Trends

18,000,000 16,000,000 14,000,000 12,000,000 10,000,000
8,000,000 6,000,000 4,000,000 2,000,000
0

UDP Service Exposure

IPMI

MDNS

MSSQL

NATPMP

Netbios

NTP-Monlist

Portmap

SIP

WDBRPC

#RSAC

#RSAC
Vulnerability Trends
 Instead of service trends, how about vulnerability trends?  Are known vulnerabilities getting patched?  How quickly are patches being applied?

#RSAC
UPnP SSDP Vulnerabilities (1900/udp)

 Lets look at two UPnP SSDP vulnerabilities with Metasploit exploits  We tracked the % of vulnerable services for libupnp & miniupnp  June 2014 to November 2014 is basically flat...

Devices Vulnerable to Exploitable SSDP Stack Overflows (% of total)
30%

25%

20%

15%

10%

5%

0%
20140609 20140616 20140630 20140707 20140714 20140729 20140804 20140811 20140818 20140825 20140901 20140908 20140915 20140922 20140929 20141103 20141110

libupnp/CVE-2012-5959

MiniUPnP/CVE-2013-0230

#RSAC
UPnP SSDP Vulnerabilities (1900/udp)

 In late 2014, both of these issues spiked dramatically  Likely the result of a new broadband ISP deployment  Vulnerability ratio is higher in 2015 than 2014!

60%

Devices Vulnerable to Exploitable SSDP Stack Overflows (% of total)

50%

40%

30%

20%

10%

0%

libupnp/CVE-2012-5959

MiniUPnP/CVE-2013-0230

#RSAC
SSDP Distributed Reflective Denial of Service
 SSDP should never be internet-facing in the first place  DrDoS capabilities in addition to exploits  15+ million SSDP services  Massive amplification  Live stats at SS
 https://ssdpscan.shadowserver.org/

#RSAC
IPMI: The Server Backdoor (623/udp)
 IPMI is used for OOB server management (iDRAC, iLO, SMC IPMI)  Almost the equivalent of physical access
 Keyboard, video, mouse, ISO boot, I2C bus access
 Typically Linux running on ARM or MIPS SoCs  Enabled by default on major server brands  Dan Farmer broke the IPMI protocol
 http://fish2.org/ipmi/

#RSAC
IPMI Exposure

 We identified ~300,000 exposed instances in 2013

 This dropped down to ~250,000 as of June 2014

 Leveled off at ~210,000 in January 2015

300,000

IPMI Exposure

250,000

200,000

150,000

100,000

50,000

0

IPMI Exposure

 Vulnerability exposure matches overall service trends  Not a lot of IPMI hardening happening

200,000 180,000 160,000 140,000 120,000 100,000
80,000 60,000 40,000 20,000
0

IPMI Vulnerabilities

IPMI-MD2

IPMI-NOAUTH

IPMI-PERMSG

IPMI-STRAIGHT-PASS

IPMI-USRLVL

#RSAC

Global IPMI Exposure

#RSAC

NTP Exposure
2,500,000 2,000,000 1,500,000 1,000,000
500,000 0

NTP Monitor List Exposure

#RSAC

1,400,000 1,350,000 1,300,000 1,250,000 1,200,000 1,150,000 1,100,000 1,050,000 1,000,000

#RSAC
NAT-PMP Exposure

 This service should never be on the internet by definition  Increasing exposure, even after CERT advisory

NAT-PMP Exposure

20140609 20140616 20140624 20140630 20140707 20140714 20140721 20140728 20140804 20140811 20140818 20140825 20140901 20140908 20140915 20140922 20140929 20141006 20141013 20141020 20141027 20141103 20141110 20141117 20141124 20141201 20141208 20141215 20141222 20141229 20150105 20150112 20150119 20150126 20150223 20150302 20150309 20150316 20150323 20150330

3,500,000 3,000,000 2,500,000 2,000,000 1,500,000 1,000,000
500,000 0

#RSAC
Portmap Exposure

 Portmap (SunRPC) is a discovery mechanism for other services  Not commonly used in new application development  Commonly open on Linux servers

Portmap Exposure

20140609 20140616 20140624 20140630 20140707 20140714 20140721 20140728 20140804 20140811 20140818 20140825 20140901 20140908 20140915 20140922 20140929 20141006 20141013 20141020 20141027 20141103 20141110 20141117 20141124 20141201 20141208 20141215 20141222 20141229 20150105 20150112 20150119 20150126 20150223 20150302 20150309 20150316 20150323 20150330

#RSAC
SunRPC Program Trends
 Analyzing SunRPC program IDs from portmap "dump" scans  These provide a list of all registered programs  Vendors often create proprietary program IDs  These can be used for precise fingerprints

Thousands

#RSAC
Log of SunRPC Program IDs Over Time
300
30
3

#RSAC
SunRPC Program ID: 302520656
 Zero to substantial in just a few months  Seems to be a "Samsung SMT-H3270 DVR"  Originally reported as Time Warner Cable...  80% show up on Comcast ranges...  This is their 4K TV rollout!  With no firewall?

SunRPC Program ID: 302520656

90,000 80,000

Exposure peaks at 82k DVRs...

70,000

60,000

50,000

40,000 30,000

We start to notice the trend...

20,000

10,000

0

#RSAC

VoIP Session Initiation Protocol (5060/udp)

Internet-exposed SIP telephones

Other 22%

 15 million exposed SIP endpoints

 44% of these are in Germany

USA

 24% of these are in Japan

4%

 Lets dig deeper...

Spain 6%

#RSAC
Germany 44%

Japan 24%

SIP Exposure: Germany & Japan

#RSAC

Vodaphone GmbH

#RSAC

#RSAC
SIP: Hallo from Germany
5.5 million devices over three primary ISPs  All based on the FRITZ!BOX sold by AVM.de  All running variants of the same firmware  Not the best security record  At the least, DDoS potential  At the worst, shells!

#RSAC
Conclusion

#RSAC
Help us destroy the 0-day!
 We have way too much zero-day, help make it not zero-day  Linux + 1Tb disk space + quad-core + basic scripting = lots of 0day
 https://scans.io/  https://github.com/rapid7/dap/  https://github.com/rapid7/recog/  Go sell it to the highest bidder (so long as it gets fixed)

Questions?
#RSAC
@treyford @Rapid7

