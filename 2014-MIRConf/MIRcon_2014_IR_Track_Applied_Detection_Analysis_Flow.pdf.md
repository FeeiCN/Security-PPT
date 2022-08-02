Applied Detection and Analysis Using Network Flow Data
Chris Sanders and Jason Smith TAP Intel-Based Detection
Mandiant, a FireEye Company
Chris Sanders
 Christian & Husband  Kentuckian and South Carolinian  MS, GSE, et al.  Non-Profit Director  BBQ Pit Master
2

Jason Smith
 Kentuckian  Car Aficionado  Raspberry Pi enthusiast  Junkyard Engineer
3
Applied Network Security Monitoring
"This book should be required reading for all intrusion analysts and those looking to develop a security monitoring program." "Written by analysts, for analysts."
- Amazon Reviewers
4

Agenda
Flow Data!  Why it's important  How you can collect it  What you can do with it  Tools that can help
"Why/How to use Flow Data in NSM/IR"
5

Network Security Monitoring
 The collection, detection, and analysis of network security data.
 The goal of NSM is escalation, or to declare that an incident has occurred so that incident response can occur.

Network Security Monitoring

Incident Response

6

The NSM Cycle Collection

Analysis

Detection

7

Evolution of NSM Emphasis
· Detection Era
Past
· Collection Era
Present
Future · Analysis Era
8

NSM/IR Challenges of the Present
We All Want Full PCAP...  Collection
- Easy to Capture / Filter Stream Data  Detection
- Major Detection Tools are PCAP Oriented  Analysis
- Gives us Who, Where, When, and What
9
NSM/IR Challenges of the Present
But, It's not Feasible for Every Goal...  Collection
- Not Scalable for Extended Retention  Detection
- Not Ideal of Hunting / Rapid Pivoting  Analysis
- Not a Great Starting Point
10

Full PCAP vs. Flow Data

PCAP Data

Flow Data
11

Flow Data

 Often Called Flow / Session / NetFlow  Summary of Network Communications  Aggregated Record of Packets  Gives Us Who, Where, When  Based on the 5-tuple + Timing/Data Stats

Source IP Source Port Dest IP

192.168.5.1 48293

8.8.8.8

Dest Port 53

Protocol UDP

Start Time

End Time

Bytes

2014/09/22T00:03:58.756 2014/09/22T00:04:58.756 76

12

Flow Data Example

sTime|

sIP|dPort|

dIP|dPort|pro|bytes|

2014/09/22T00:03:58.756| 10.10.120.1| 53| 10.1.179.5| 53| 17| 72|

2014/09/22T00:03:58.999 10.10.120.1| 53| 10.1.188.5| 53| 17| 89|

2014/09/22T00:08:59.012| 10.10.120.1| 53| 10.1.179.5| 53| 17| 72|

2014/09/22T00:08:59.466| 10.10.120.1| 53| 10.1.188.5| 53| 17| 89|

2014/09/22T00:03:58.756| 10.10.120.1| 53| 10.1.179.5| 53| 17| 72|

2014/09/22T00:03:58.999 10.10.120.1| 53| 10.1.188.5| 53| 17| 89|

2014/09/22T00:08:59.012| 10.10.120.1| 53| 10.1.179.5| 53| 17| 72|

2014/09/22T00:08:59.466| 10.10.120.1| 53| 10.1.188.5| 53| 17| 89|

13

Building Flow Records
 Records are Defined by Unique 5-tuples
 Data is added to the 5-tuple Record until a termination condition is met.

14

Flow Record Termination Conditions
 Natural Timeout - End of communication per protocol (ex. TCP RST/FIN)
 Idle Timeout - No data received for 30 seconds
 Active Timeout - Thirty minute max timeout (configurable)
15
Collection with Flow Data

Generating Flow Data
 Generation - Routers - Sensors
 Fprobe  YAF
 Multiple Types: - NetFlow (v5,v9) - IPFIX - jFlow - More...
17
Collecting Flow Data
 Popular Platforms - Argus
+ Reliable + Fast Collection - Not Well Supported
- NFDump
+ Easy to Setup and Use - Not in Wide Use
- SiLK
+ Exceptional Analysis Tools - More Involved Setup
18

SiLK
 The System for Internet-Level Knowledge  CERT NetSA Team  Two Major Components:
- Packing Suite
 Collection and parsing of flow data
- Analysis Suite
 Filter, display, sort, count, group, mate, and more
 Excellent Documentation & Community - https://tools.netsa.cert.org/silk/docs.html
19
SiLK Collection Architecture
20

SiLK ­ What You Need
 Flow Sources - Hardware: Routers, Switches - Software: YAF, fprobe
 SiLK Server - Rwflowpack - Will also have SiLK analysis suite installed
 Analyst Workstation - Access SiLK server directly - Locally mirrored database
21
SiLK ­ Analysis Suite
 rwfilter - Filters through data based on conditions.  rwcut - Converts flow binary data to a human readable
format.  rwstats - Generates statistics from flow data  rwcount - Summarizes total network traffic over time
22

SiLK Analysis ­ rwfilter / rwcut (1)
 Display all records from the beginning the current day until the current time:
rwfilter --type=all --proto=0-255 --pass=stdout | rwcut
23
SiLK Analysis ­ rwfilter / rwcut (2)
 Display all records of communication to or from Chinese IP addresses over a specific week to one local CIDR range:
rwfilter --type=all --start-date=2014/08/01 --enddate=2014/08/07 --any-address=192.168.1.0/24 --any-cc=cn --pass=stdout | rwcut -fields=stime,sip,dip,sport,dport,type
24

SiLK Analysis ­ rwstats (1)
 Display statistics for the total amount of bytes transferred by protocol (top 10): rwfilter --type=all --proto=0-255 --pass=stdout | rwstats --top --count=10 --fields=proto -value=bytes
25
SiLK Analysis ­ rwstats (2)
 Show the top 10 sip,dip pairs for valid conversations (top 10)
rwfilter --type=all --proto=0-255 --packets=4, -pass=stdout | rwstats --top --count=10 -fields=sip,dip --value=bytes
26

SiLK Analysis ­ rwstats (3)
 Show the top 10 outbound destination country codes by records:
rwfilter --type=out,outweb --proto=0-255 -pass=stdout | rwstats --top --count=10 --fields=dcc
27
SiLK Analysis ­ Real World Examples
 Rwstats to discover potential ZeroAccess victims rwfilter --type=all --dport=16464,16465,16470,16471 -pass=stdout | rwstats --top --fields=sip -value=distinct:dcc --threshold=3
28

SiLK Analysis ­ Real World Examples
 Discovering outbound data to applications using nonstandard ports. rwfilter Sampledata/sample.rw \ --plugin=app-mismatch.so \ --type=out,outweb --proto=6 \ --sport=1024- \ --packets=4- \ --flags-initial=S/SURFPACE \ --pass=stdout | \ rwstats --fields=application,dport --count=100 \ --distinct:dport
29
Collecting Intelligence Data
 Friendly Intelligence Gathering  Identify Services on the Network  Identify Normal Behaviors of Hosts  Identify "Friends and Family"
- Friends: Who a host communicates with outside the network - Family: Who a host communicates with inside the network
30

Identifying Services
 Identify SSH Servers rwfilter --type=out --protocol=6 --packets=4- -ack-flag=1 --sport=22 --pass=stdout | rwcut -fields=sip
 Identify Web Servers rwfilter --type=outweb --protocol=6 -packets=4- --ack-flag=1 --sport=80,443,8080 -pass=stdout | rwcut --fields=sip
31
Identifying Friends and Family · Identify Friends
rwfilter --type=out,outweb -saddress=192.168.1.1 --pass=stdout | rwfilter --input-pipe=stdin -dcidr=192.168.0.0/24 --fail=stdout
· Identify Family
rwfilter --type=out,outweb -saddress=192.168.1.1 --pass=stdout | rwfilter --input-pipe=stdin -dipset=local --fail=stdout
32

Detection with Flow Data

Flow for Detection

Signature- Reputation- Behavior-

Based

Based

Based

StatisticsBased

34

FlowPlotter
 Generates Visualizations from the Output of Flow Tools  Useful for Detection-Oriented Statistics  Written in BASH ­ Flexible/Tweakable/Minimal  Free/Open Source - Maintained in GitHub  Browser Independent
35
FlowPlotter - GeoMap
 rwfilter ../Sampledata/sample.rw --dcc=us,cn,-- --fail=stdout | ./flowplotter.sh geomap dcc bytes > geomap.html
36

FlowPlotter - LineChart
 rwfilter --type=all --proto=0-255 --pass=stdout | ./flowplotter.sh linechart 600 bytes > linechart.html
37
FlowPlotter - TreeMap
 rwfilter ../Sampledata/sample.rw --sport=1025- --dport=1025- -proto=0- --type=out --pass=stdout | ./flowplotter.sh treemap dip records > treemap.html
38

FlowPlotter - Pie/Bar/Column Chart
 rwfilter ../Sampledata/sample.rw --sport=1025- --dport=1025- -proto=0- --type=all --pass=stdout | ./flowplotter.sh piechart dip bytes > piechart.html
39
FlowPlotter - BubbleChart
 rwfilter ../Sampledata/sample.rw --type=all --proto=0-255 -pass=stdout | ./flowplotter.sh bubblechart sip > bubblechart.html
40

FlowPlotter - Timeline
 rwfilter --proto=0- --type=out --sport=41142 --pass=stdout | ./flowplotter.sh timeline dip sip > timeline.html
41
FlowPlotter - Force Directed
 rwfilter ../Sampledata/sample.rw --scc=kr --proto=0- --type=all -pass=stdout | ./flowplotter.sh forceopacity sip dip distinct:dport 100 > forcetest.html
42

FlowPlotter - AssetDiscovery
 rwfilter ../Sampledata/sample.rw --proto=0- --type=all --pass=stdout | ./flowplotter.sh assetdiscovery > assettest.html
43
Analysis with Flow

Flow in Analysis ­ PCAP Only

Validate Signature TP

< 1%

Scoping Relevant Time Range

5%

Find Related Events in Time Range

10%

Reduce Data Set

35%

Analyze / Make Decisions

~ 50%

* Based on the First Hour of Analysis 45

Flow in Analysis - Improved

Validate Signature TP

< 1%

Scoping Relevant Time Range

5%

Find Related Events in Time Range

10%

Expand Data Set as Needed

5%

Analyze / Make Decisions

~ 80%

* Based on the First Hour of Analysis 46

Flow ­ Barriers to Entry
 Be Prepared to Look at a LOT of Line-Based Data  Very Command Line Oriented  Not Welcoming to Junior-Level Analysts  Hard to Display/Interpret Data Visually
47
SiLK Data Output
48

49
 Flow Basic Analysis Tool  Graphical Front-End to SiLK  Easy Two-Step Install on SiLK Capable Box
- Install Locally to SiLK Box - Install Remotely and Interact via SSH w/ Keys  Rapid Pivoting Between Data  Graphing Ability  By Analysts, for Analysts
50

Getting Data with FlowBAT (CLI Mode)
51
Getting Data with FlowBAT (Guided Mode)
52

Manipulating FlowBAT Data
53
Pivoting with FlowBAT Data
54

Generating Stats with FlowBAT
55
Generating Stats with FlowBAT
56

Conclusion
 Flow Data is Underused and Underrated  Easy to Collect, Enhances Detection & Analysis  Minimal Barriers to Entry
- SiLK (Easy to Install on SO) - Argus (Already Installed on SO) - Bro (Already Installed on SO)
57
Thanks Folks!
 Questions? - Chris Sanders ­ chris@chrissanders.org - Jason Smith ­ jason.smith.webmail@gmail.com
 Blog / Book - http://www.appliednsm.com
 FlowPlotter - http://www.github.com/automayt/FlowPlotter/
 FlowBAT - http://www.flowbat.com
58

