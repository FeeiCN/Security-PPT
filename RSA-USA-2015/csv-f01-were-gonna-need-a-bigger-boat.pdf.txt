SESSION ID: CSV-F01
We're Gonna Need a Bigger Boat

Alan Ross
Senior Principal Engineer Intel Corporation

Grant Babb
Research Scientist Intel Corporation

#RSAC

#RSAC
IT Analytics: All about the changing Enterprise
Cloud + Evolving Threat Landscape = Complex Security Needs

Open Source Vulnerabilities
Crimeware Market
More Malware
Better Hacking Tools and Skills
Critical Infrastructure Targets

Design Partner
Sales Force

AWS

Azure

Cloud Proxy

Google Verizon

Eloqua

Enterprise

Alibaba

More financial Incentives
Increased Compliance Pressure DOS for Ransom
More Entry Points
Large Scale Attempts

We Need Visibility, Transparency, and Control

What "Scale"?

#RSAC

Intel IT Today
(if fully instrumented):

100,000,000,000

Events

 30-40 billion network related events/day

10,000,000,000

 Adding cloud environments could drive that to 50+ billion

1,000,000,000 100,000,000

 Not including platform, app, etc.

10,000,000

2002

2006

2010

2014

2018

We need a platform that can scale to Hundreds of Billions of events/day!
3

"How do we process the data?"

Intel Analytics Toolkit

Contextual Data

HIVE

Time-Series Matrix

Data Streams

#RSAC
Graph DB

Batch Processes

HBASE Hadoop File System (HDFS)
Cloudera Hadoop

Analytic Approach

#RSAC

Network Analysis

Pattern Analysis

Signal Analysis

Visual Analysis

Graph Analysis: Latent Dirichlet Allocation

#RSAC

 Strives to put a population into subgroups based on their similarity
 IP addresses are nodes, flow details are edges
 Use to cluster on known (profiling) or unknown (automated behavior)

SRCIP 1
SRCIP 2
SRCIP 3
SPORT 1
SPORT 2
SPORT 3

DSTIP 1
DSTIP 2
DSTIP 3
DSTIP 4
DPORT 1
DPORT 2

Connections Bytes/packets Bytes/packets

LDA results
Question:
What are the strongest matches for groups based on automated communication to wellknown ports ?
Answer: Seven ports in four different
groups are the strongest matches

#RSAC

123

22

587

80

445

135

137

Patterns : Principal Component Analysis

#RSAC

I

N

I

Time Series Data

=

Patterns

* (N* I) *

Dynamic Coefficients

T

N N N

The Use of PCs to summarize ... climatological fields have been found to be so valuable that it is almost routine.
- Joliffe, Principal Component Analysis

PCA Results

#RSAC

Question:
Are there any anomalous patterns in this data?

Answer: One source IP is talking to
several destination IP's that do not exist (horizontal scan)

Signal Analysis: Fast Fourier Transform

#RSAC

 Represent flow data as a function of sines and cosines (waves)  Jump from time domain to frequency domain (and back)  Easily filter noise from signal, or remove other frequencies

Signal Analysis - FFT

#RSAC

Visual Analytics: IPython and D3

#RSAC

Possible Datasets

#RSAC

 Network Security
 Firewall, Proxy, DNS, DHCP, SMTP, Active Directory, Netflows
 Platform Security
 Antivirus, Antispyware, Host Intrusion, Firewall, Integrity
 Application Security
 Whitelisting, Integrity
 Software Defined Infrastructure
 Schedulers, Orchestration, Attestation, Integrity

13

#RSAC
What is Netflow?
Network Accounting Protocol (routers, switches) "Phone bill for network traffic"
Anything that crosses a network boundary creates a Netflow record - Including security threats and attacks

Netflows Bridge the Gap

Security Events ­ Large amount of time information lost, only know occurrence,

X

further analysis difficult if not impossible

Data

1X

Size

Network Flows ­ sampling makes analysis feasible, some information lost but not much, still a high noise-low signal problem

2X

Real-time alerting on what you know already
Telemetry data to find new insight, or deeper analysis from events

#RSAC
Ease of Analysis

Packet Stream ­ no sampling of data, would require a complete copy of network data for analysis

Forensic data for an identified threat you want
to observe
100X

Additional Context

#RSAC

 Internal IP address ranges  Roles of known IP addresses (e.g. proxy server, web server)  Geolocation information  Security device policies (e.g. firewall rules)

16

Actionable Insight

#RSAC

 Summary views and drill downs make investigations and incident response easier.

 Filtering "noise" will make the machine learning smarter and learn over time

17

#RSAC
Demo

Future ­ Distributed Analytics

#RSAC

 Most "heavy lifting" will occur on premise
 Don't want to ship billions of events over wide area networks  May want multiple instances for a global environment  Cloud provider analytics are a likely trend to help with transparency
 Analytics will be combined and synthesized
 On-premise and cloud analytics will be correlated  Analytic results will be shared across organizations to "raise all boats"  This will be a very collaborative activity across industries

19

How To Apply

#RSAC

 Download test data sets: VAST, CERT (http://vacommunity.org/VAST+Challenge+2013%3A+Mini-Challenge+3) (https://www.cert.org/insider-threat/tools/)
 Investigate what data you collect today that can be used to look for security threats!
 Also are there other easy data sources to pull together and analyze?
 There is an abundant and extraordinary amount of free tools to start digging, learning and visualizing
 "The democratization of data analytics and visualizations"  Gephi, Scilab, iPython, R, D3, NFDUMP,
 Tons of free courses online (e.g. Coursera Data Science)

20

Key Messages/Summary

#RSAC

1. The scale of compute has changed dramatically 2. We need a platform to store and process data at scale 3. We need algorithms and approaches to provide insight 4. We need actionable insights that solve hard problems

21

