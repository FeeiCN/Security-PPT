Network Traffic Analysis - SiLK
Paul Krystosek, PhD Matthew Heckathorn
Software Engineering Institute Carnegie Mellon University Pittsburgh, PA 15213

Network Traffic Analysis - SiLK
1 Jan 11­14, 2016
Distributio©n S2t0a1te6mCeanrtnAeg: iAepMpreollvoendUfonrivPeursbiltiyc Release; Distribution is Unlimited
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Notices

Copyright 2015 Carnegie Mellon University
This material is based upon work funded and supported by the Department of Defense under Contract No. FA8721-05-C-0003 with Carnegie Mellon University for the operation of the Software Engineering Institute, a federally funded research and development center.
NO WARRANTY. THIS CARNEGIE MELLON UNIVERSITY AND SOFTWARE ENGINEERING INSTITUTE MATERIAL IS FURNISHED ON AN "AS-IS" BASIS. CARNEGIE MELLON UNIVERSITY MAKES NO WARRANTIES OF ANY KIND, EITHER EXPRESSED OR IMPLIED, AS TO ANY MATTER INCLUDING, BUT NOT LIMITED TO, WARRANTY OF FITNESS FOR PURPOSE OR MERCHANTABILITY, EXCLUSIVITY, OR RESULTS OBTAINED FROM USE OF THE MATERIAL. CARNEGIE MELLON UNIVERSITY DOES NOT MAKE ANY WARRANTY OF ANY KIND WITH RESPECT TO FREEDOM FROM PATENT, TRADEMARK, OR COPYRIGHT INFRINGEMENT.
[Distribution Statement A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.
This material may be reproduced in its entirety, without modification, and freely distributed in written or electronic form without requesting formal permission. Permission is required for any other use. Requests for permission should be directed to the Software Engineering Institute at permission@sei.cmu.edu.
Carnegie Mellon®, CERT®, CERT Coordination Center® and FloCon® are registered marks of Carnegie Mellon University.
DM-0003146

Network Traffic Analysis - SiLK

Jan 11­14, 2016 © 2016 Carnegie Mellon University

2

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Housekeeping
Restrooms on past registration desk Breaks and lunch in same location Follow exit signs in case of emergency Ask questions any time, don't be shy

Network Traffic Analysis - SiLK

Jan 11­14, 2016 © 2016 Carnegie Mellon University

3

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Course Objectives
At the end of this module, you will have the knowledge and skills needed to perform the following tasks:
· Name the major components of SiLK. · Retrieve network flow records using the rwfilter
command. · Manipulate network flow records using basic SiLK
commands. · Analyze traffic and profile a network using basic SiLK
commands.

Network Traffic Analysis - SiLK

Jan 11­14, 2016 © 2016 Carnegie Mellon University

4

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Agenda

I. Network flow
I. What is network flow II. Interpreting flow records III. SiLK commands
II. Basic SiLK tools
I. SiLK Records, Files, and the Repository
II. Analysis Tools and Categorization III. IP Sets

Network Traffic Analysis - SiLK

Jan 11­14, 2016 © 2016 Carnegie Mellon University

5

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Schedule

9:00 AM SiLK Part 1 of 4 10:45 AM Break 11:00 AM SiLK Part 2 of 4 12:30 PM Lunch
1:30 PM SiLK Part 3 of 4 3:15 PM Break 3:30 PM SiLK Part 4 of 4 5:00 PM Adjourn 6:00 PM Welcome Reception

Basics of Network Flow and Unix Commands Basics of SiLK Network flow analysis with SiLK More network flow analysis with SiLK Near reception

Network Traffic Analysis - SiLK

Jan 11­14, 2016 © 2016 Carnegie Mellon University

6

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Setting up your analysis environment
· SSH to
flocon.cloudapp.net · Username: demo · Password: flocon2016

Network Traffic Analysis - SiLK

Jan 11­14, 2016 © 2016 Carnegie Mellon University

7

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Analysis environment continued

Network Traffic Analysis - SiLK

Jan 11­14, 2016 © 2016 Carnegie Mellon University

8

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Analysis environment ­ Account creation
· Create your own application account · Remember your information!

Network Traffic Analysis - SiLK

Jan 11­14, 2016 © 2016 Carnegie Mellon University

9

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Analysis environment ­ Account information
· Accounts last for 14 days · The service will be shutdown on 1/25/2016
· You are limited to 2 GB of Hard drive space · Exceeding this limit will cause your account to be wiped
· Do not store anything of value on the server! · All information will be wiped

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

10

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Analysis environment ­ SiLK Training Image

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

11

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Analysis environment ­ At the Prompt

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

12

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 0: *NIX
PS1='\W \!> ' # this is not permanent export SILK_IPV6_POLICY=asv4 cd /data/bluered ls -l silk.conf less silk.conf # type "q" to exit from less cd

http://www.eatandexercises.net/

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

13

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Part I: Network Flow

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

14

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Part I Lessons: Network Flow
1. What is Network Flow? 2. Interpreting Flow Records 3. Issuing SiLK Commands

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

15

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson I.1 What is Network Flow?

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

16

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson I.1 Learning Objective
Given a sequence of packets and some basic knowledge of packets, the learner will be able to identify the uniflows comprising the packets.

http://www.iccwbo.org/News/Articles/2012/ICC-defends-freedom-of-expression-and-the-free-flow-of-information-online/

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

17

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

What is Network Flow?

A log of all network activity; not a recording of all packets

A record of metadata from related packets · similar to a phone bill (call detail record)

Content of messages is not recorded

· much, much more compact

- longer retention

- less processing

https://malakawijeweera.wordpress.com/2011/02/06/123/

· increased privacy

· less impact from encryption

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

18

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

What SiLK Does
Investigation analysis · most useful for analysing past network events · may feed an automated report generator · good for forensics (what happened before the incident?)
Descriptive analysis ­ profiling/categorizing Directed analysis (hunt) ­ looking for specific malicious behavior Exploratory analysis ­ looking for the unusual Predictive Analysis

http://www.turkeydog.org/history.html

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

19

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Did you ever wonder...

http://www.clipartpanda.com/clipart_images/pondering-clipart-9915834

What's on my network?

What happened before the event?

Where are policy violations occurring?

What are the most popular web servers?

By how much would volume be reduced with a blacklist?

Do my users browse to known infected web servers?

Do I have a spammer on my network?

When did my web server stop responding to queries?

Who uses my public servers?

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

20

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Unidirectional Flows (Uniflows)

1

3

9

8

4

2

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

21

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Packet Encapsulation

Ethernet frame

Dest MAC address IP datagram (packet)

Source MAC addr Type of packet

Src IP address
Dst IP address
Type of segment

Transport segment

Src port Dest port Flags

Application layer message
(HTTP, SMTP, DNS)

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

22

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Two TCP/IP Sockets Make a Connection
TCP/IP SOCKET IP address: 10.0.0.1 L4 protocol: TCP Ephemeral port #

TCP/IP SOCKET IP address: 203.0.113.1 L4 protocol: TCP Well-Known Port #

Client Process

Connection

Server Process

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

23

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Network Flow versus NetFlow
Network Flow--a generic term for the summarization of packets related to the same flow or connection into a single record NetFlowTM--a Cisco trademarked set of format specifications for storing network flow information in a digital record. Most common are versions 5 and 9. IPFIX--a format specification from the IETF for flow records, an extension of Cisco NetFlow v9 SiLK--another set of format specifications for flow records and other related data, plus the tool suite to process that data

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

24

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

What's in a Record?

Fields found to be useful in analysis: · source address, destination address · source port, destination port (Internet Control Message Protocol [ICMP] type/code) · IP [transport] protocol · bytes, packets in flow · accumulated TCP flags (all packets, first packet) · start time, duration (milliseconds) · end time (derived) · sensor identity · flow termination conditions · application-layer protocol

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

25

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

DNS packets viewed in Wireshark

Wireshark is a registered trademark of the Wireshark Foundation

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

26

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Sequence Diagram
DNS Client 192.168.1.105 UDP port 50744

DNS Server 10.1.10.1 UDP port 53

T I M E

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

27

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

SiLK tool (rwcut) output

sIP|

dIP|sPort|dPort|pro|packets|bytes|sensor|type|

192.168.1.105| 10.1.10.1|50744| 53| 17|

1| 64| S1| out|

10.1.10.1|192.168.1.105| 53|50744| 17|

1| 80| S1| in|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

28

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson I.1 Summary
Flow records constitute a log of network activity.
Flow analysis can answer many questions without storing content.
Flow records are extremely compact. Benefits are
· long retention · faster processing · reduced privacy concerns · encryption is not an obstacle
SiLK uses unidirectional flows--uniflows.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

29

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Next Lesson

thinking-organizationblog.com/are-you-hooked-on-hope-pium-2/

In lesson I.2, you will learn to interpret SiLK flow records and understand the nature of the associated network activity.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

30

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson I.2 Interpreting Flow Records

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

31

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson I.2 Learning Objective
Given a series of uniflows and general knowledge of TCP/IP, the learner will be able to deduce and infer the nature of the network activity.

http://www.purple.us/interpreting

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

32

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Network Monitoring

Internet

Other internetwork

SiLK Console
terminal

sensor sensor sensor
sensor
SiLK repository

iSiLKTM

iSiLK is a trademark of Carnegie Mellon University

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

33

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Realistic Sequence Diagram

DNS Client 192.168.1.105 UDP port 50744

Local Server 10.1.10.1 Sensor

Root Server

.com Server

.mudynamics.com Server

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

34

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

What is this? -- 1

sIP|

dIP|sPort|dPort|pro|packets|flags|initF| type|

192.168.1.105| 10.1.10.1|50744| 53| 17|

1|

|

| out|

10.1.10.1|192.168.1.105| 53|50744| 17|

1|

|

| in|

192.168.1.105| 198.51.100.6|49152| 80| 6|

4| SRPA| S |outweb|

198.51.100.6|192.168.1.105| 80|49152| 6|

3| S PA| S A| inweb|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

35

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

HTTP Sequence Diagram

HTTP Client 192.168.1.105

HTTP Server 198.51.100.6

DNS Server 10.1.10.1

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

36

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

What Is This? -- 2

sIP|

dIP|sPort|dPort|pro|packets| bytes|flags|

30.22.105.250| 71.55.40.253|52415| 25| 6|

22| 14045|FSRPA|

71.55.40.253|30.22.105.250| 25|52415| 6|

19| 1283|FS PA|

30.22.105.250| 71.55.40.253|52415| 25| 6|

1| 40| R |

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

37

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

What Is This? -- 3

sIP|

dIP|pro|packets|bytes|

sTime|

99.217.139.155| 177.252.24.89| 1|

2| 122|2010/12/08T00:04:30.172|

99.217.139.155|177.252.149.249| 1|

2| 122|2010/12/08T00:04:37.302|

99.217.139.155| 177.252.24.52| 1|

2| 122|2010/12/08T00:04:37.312|

99.217.139.155| 177.252.24.127| 1|

2| 122|2010/12/08T00:04:58.363|

99.217.139.155| 177.252.24.196| 1|

2| 122|2010/12/08T00:05:04.327|

99.217.139.155| 177.252.149.30| 1|

2| 122|2010/12/08T00:05:09.242|

99.217.139.155|177.252.149.173| 1|

2| 122|2010/12/08T00:05:12.174|

99.217.139.155| 177.252.24.13| 1|

2| 122|2010/12/08T00:05:14.114|

99.217.139.155| 177.252.24.56| 1|

2| 122|2010/12/08T00:05:15.383|

99.217.139.155| 177.252.24.114| 1|

2| 122|2010/12/08T00:05:18.228|

99.217.139.155| 177.252.202.92| 1|

2| 122|2010/12/08T00:05:22.466|

99.217.139.155| 177.252.202.68| 1|

2| 122|2010/12/08T00:05:23.497|

99.217.139.155| 177.252.24.161| 1|

2| 122|2010/12/08T00:05:30.256|

99.217.139.155|177.252.202.238| 1|

2| 122|2010/12/08T00:05:33.088|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

38

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

What Is This? -- 4

sIP|

dIP|sPort|dPort|pkts| bytes|flags|

sTime|

88.187.13.78|71.55.40.204|40936| 80| 83| 3512|FS PA|2010/12/08T11:00:01|

71.55.40.204|88.187.13.78| 80|40936| 84|104630|FS PA|2010/12/08T11:00:01|

88.187.13.78|71.55.40.204|40938| 80| 120| 4973|FS PA|2010/12/08T11:00:04|

71.55.40.204|88.187.13.78| 80|40938| 123|155795|FS PA|2010/12/08T11:00:05|

88.187.13.78|71.55.40.204|56172| 80| 84| 3553|FS PA|2010/12/08T12:00:02|

71.55.40.204|88.187.13.78| 80|56172| 83|103309|FS PA|2010/12/08T12:00:02|

88.187.13.78|71.55.40.204|56177| 80| 123| 5093|FS PA|2010/12/08T12:00:05|

71.55.40.204|88.187.13.78| 80|56177| 124|157116|FS PA|2010/12/08T12:00:05|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

39

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Standard SiLK Types

outweb, outicmp, out

int2int
Internal network

Sensor
inweb, inicmp, in

outnull

innull

ext2ext
External network

Null

other*
*to/from network that is neither internal nor external

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

40

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

More complete SiLK Types

outweb, outicmp, out, ipv6out

int2int, ipv6int2int
Internal network

Sensor
inweb, inicmp, in, ipv6in

outnull

innull

ext2ext, ipv6ext2ext
External network

Null

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

41

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

SiLK Types in SiLK

Type

Description

inweb, outweb

Inbound/outbound TCP ports 80, 443, 8080

innull, outnull

Inbound/outbound filtered traffic

inicmp, outicmp Inbound/outbound IP protocol 1

in, out

Inbound/outbound not in above categories

int2int, ext2ext

Internal to internal, external to external

other

Source not internal or external, or destination not internal, external, or null

Names in bold are often default types

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

42

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson I.2 Summary
Sensor placement affects what is seen or not seen in flow records. We learned to interpret network activity from flow records. A class of SiLK sensors uses a particular set of record types.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

43

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Next Lesson
In lesson I.3 we will learn how to issue *NIX commands, how to obtain online help for SiLK commands, and how to obtain information about the SiLK repository using a SiLK command.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

44

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

http://dylanbeattie.blogspot.com/2011/06/just-do-it-command-query-segregation.html

Lesson I.3 Issuing SiLK Commands

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

45

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson I.3 Learning Objectives
· The learner will be able to issue simple SiLK commands correctly.
· The learner will be able to obtain online help text for SiLK commands and other *NIX commands.
· The learner will be able to obtain information about a SiLK sensor network and a SiLK flow-record repository.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

46

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

*NIX commands

System prompt

Info + prompt character

e.g., ~ 101>

User command command name

https://en.wikipedia.org/wiki/Linux
rwfilter (case sensitive)

options

-h --help -k2 --key=2

arguments

results.rw

redirections

> >> < <<

pipe

|

For example:

rwcut --all-fields results.rw >results.txt

rwcut --fields=1-6 results.rw | more

Linux is the registered trademark of Linus Torvalds in the U.S. and other countries UNIX is a registered trademark of The Open Group

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

47

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Some standard *NIX commands

ls ­ list name and attributes of files and directories cd ­ change the current working directory cat ­ output the contents of a file head ­ output the first lines of a file echo ­ output the argument more and less ­ display a file one page at a time cut ­ output only selected fields of a file sort ­ reorder the records (lines) of a file wc ­ word count (optionally, character and line count) of a file exit ­ logout and terminate a terminal window

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

48

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

*NIX Standard Streams
Standard In (stdin) ­ where normal (especially interactive) input comes from Standard Out (stdout) ­ where normal/expected (especially interactive) output goes to Standard Error (stderr) ­ where messages (especially unexpected) go to Defaults: stdin ­ keyboard stdout ­ screen/window stderr ­ screen/window Defaults are overridden by redirections and pipes

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

49

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Shell Scripts

http://clipgid.com/play-script-clipart.html
Put a complicated command, pipeline, or sequence of pipelines into a script file. · It saves your commands for reuse or learning. · It eases making changes. Create your script with nano or vi (vim). Vi or vim can be found on every Linux/UNIX (*NIX) system. Name your shell script something like dothis.sh Add execute permission chmod +x dothis.sh Execute (run) your script: ./dothis.sh

SSH is the registered trademark of SSH Communications Security Corp

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

50

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 1: Use a few relevant Linux commands

Create a new directory, change to it and use the echo command with

redirect ">"

and

append ">>"

to create a file.

Then examine it with ls, cat and wc
mkdir ex1 cd ex1 echo 10.1.60.25 > adr1.txt echo 10.2.190.254 >> adr1.txt ls adr1.txt ls ­l adr1.txt cat adr1.txt wc adr1.txt cd

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

51

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Collection, Packing, and Analysis
Collection of flow data · Examines packets and summarizes into standard flow records · Timeout and payload-size values are established during collection
Packing stores flow records in a scheme optimized for space and ease of analysis Analysis of flow data
· Investigation of flow records using SiLK tools

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

52

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Collection

Idle-timeout, Activetimeout

Termination-attribute, Application, Start-time, Duration, Packets, Bytes, Flags...

tcpdump PCAP

YAF

IPFIX

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

53

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Analysis
SreiSrLpeiSrKLpeoiKLposKiostiostiortyoryry
Raw (binary) flow records in a file

SiLK tool chain

Raw (binary) flow records in a file
Text

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

54

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Reporting
Text
UNIX text tools (sed, awk, ...)
Text

Visualization tools (gnuplot, Rayon, Excel)

Rayon is a trademark of Carnegie Mellon University Excel is a registered trademark of Microsoft Corporation

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

55

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 2: Which sensors are defined?
rwsiteinfo --fields=id-sensor,sensor rwsiteinfo --fields=id-sensor,sensor | less rwsiteinfo --fields=id-sensor,sensor,describe-sensor \
| less

http://www.rainbird.com/landscape/products/central/flowsensors.htm

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

56

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Which record-types are defined?
rwsiteinfo --fields=type,mark-defaults

http://winefolly.com/review/types-dessert-wine/

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

57

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Where can I get more information?
We can't discuss all parameters for every tool. Resources
· Analyst's Handbook · SiLK Reference Guide (collected man pages) · --help option · man command · http://tools.netsa.cert.org

http://retirementincomejournal.com/issue/august-24-2011/article/a-reference-book-built-for-you

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

58

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Answers to questions you haven't asked yet
At this point you probably have dozens of questions. Typical answers are: · Yes, it does, and here is how to do it · Yes, read about it in <reference> · Yes, but it will take to long to describe right now · Yes, but it is not a good idea because <some lame excuse> · Because <long silence> · No, it doesn't because <really good reason> · No, it doesn't <long silence> · No, but that's a really good idea, please email it to me. Thanks!

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

59

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson I.3 Summary
We learned the parts of *NIX commands. Data should be kept in binary form as long as possible. We learned where to get more information about commands. We learned to obtain information about the SiLK repository using the rwsiteinfo command.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

60

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Next Lesson
In lesson II.1 we will learn how to choose just the flow records that are applicable to our inquiry.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

61

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Part II: Basic SiLK Tools

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

62

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Part II Lessons: Network Flow
1. SiLK Records, Files, and the Repository 2. Analysis Tools and Categorization 3. IP Sets

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

63

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

https://clearwatercompliance.com/hipaa-hitech-news/hipaa-and-it-security/hipaa-security-reminder-transporting-medical-records/

https://datafloq.com/read/big-data-usecase-repository-predictive-analytics/721
Lesson II.1 SiLK Records, Files, and the Repository

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

64

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson II.1 Learning Objectives
· The learner will be able to display selected fields from a sequence of flow records.
· The learner will be able to determine which flow-record fields will be useful for a given analysis.
· The learner will be able to identify which rwfilter keywords are selection options.
· The learner will be able to pull flow records from a SiLK repository.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

65

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Basic SiLK Tools: rwcut

But I can't read binary...

rwcut provides a way to display binary records as human-readable ASCII:
· useful for printing flows to the screen

· useful for input to text-processing tools

http://www.ifrick.ch/2011/09/apple-senkt-preise-in-der-

schweiz-teilweise-massiv/price-cut/
· Usually you'll only need the --fields option.

sip dip sport dport protocol class

packets bytes sensor scc dcc nhip

type in out dur stime etime

flags initialflags sessionflags application attributes itype & icode

Field names in italics are derived fields

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

66

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

rwcut Default Display
By default · sIP (1), sPort (3) · dIP (2), dPort (4) · Protocol (5) · packets, bytes · flags · sTime, eTime, duration · sensor
--all-fields # way too much info --fields=1-5,sTime # just right

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

67

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Create the ex3records.rw file

# rwfilter will not overwrite a file rm ex3records.rw

rwfilter --type=all

\

--sensor=S0

\

--start=2009/04/20T11 \

--proto=0-

\

--pass=stdout

\

| rwsort --fields=stime

\

| rwfilter --input-pipe=stdin \

--max-pass=30

\

--proto=0-

\

--pass=ex3records.rw

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

68

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 3: What do the data look like?
rwcut ex3records.rw --fields=1-5,packets
Try other values for --fields. Try omitting the --fields option.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

70

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 3: What do the data look like?

rwcut --fields=1-5,packets ex3records.rw

sIP|

dIP|sPort|dPort|pro|

10.1.60.203| 10.1.60.187|50398| 80| 6|

10.1.60.187| 10.1.60.203| 80|50398| 6|

10.1.60.203|

10.1.60.73|50189| 5222| 6|

10.1.60.73| 10.1.60.203| 5222|50189| 6|

10.1.60.203| 10.1.60.187|49592| 443| 6|

10.1.60.187| 10.1.60.203| 443|49592| 6|

10.1.60.203| 10.1.60.187| 0| 2048| 1|

10.1.60.187| 10.1.60.203| 0| 0| 1|

10.1.60.203|

10.1.60.5| 0| 2048| 1|

10.1.60.5| 10.1.60.203| 0| 0| 1|

10.1.60.203|

10.1.60.5|56515| 53| 17|

10.1.60.5| 10.1.60.203| 53|56515| 17|

10.1.60.203|

10.1.60.73| 0| 2048| 1|

10.1.60.73| 10.1.60.203| 0| 0| 1|

10.1.60.203|

10.1.60.25| 0| 2048| 1|

10.1.60.25| 10.1.60.203| 0| 0| 1|

10.1.60.203|

10.1.60.25|60515| 25| 6|

10.1.10.5|

10.1.60.5| 1031| 53| 17|

10.1.60.5|

10.1.10.5| 53| 1031| 17|

10.1.10.5|

10.1.60.5| 3507| 53| 6|

10.1.60.5|

10.1.10.5| 53| 3507| 6|

10.1.10.5|

10.1.60.5| 3508| 53| 6|

10.1.60.5|

10.1.10.5| 53| 3508| 6|

10.1.10.5|

10.1.60.5| 3507| 53| 6|

10.1.10.5|

10.1.60.5| 3508| 53| 6|

10.1.60.5|

10.1.10.5| 53| 3507| 6|

10.1.60.5|

10.1.10.5| 53| 3508| 6|

10.1.10.5|

10.1.60.5| 3507| 53| 6|

10.1.10.5|

10.1.60.5| 3508| 53| 6|

10.1.60.5|

10.1.10.5| 53| 3508| 6|

packets| 5| 5| 6| 5|
10| 10| 276| 276| 279| 279|
1| 1| 276| 276| 356| 356| 4| 32| 32| 1| 1| 1| 1| 1| 1| 1| 1| 1| 1| 1|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

71

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 3: What do the data look like?

rwcut ex3records.rw

sIP|

dIP|sPort|dPort|pro|

eTime|sen|

10.1.60.203| 10.1.60.187|50398| 80| 6|

0.006|2009/04/20T11:35:19.445| S0|

10.1.60.187| 10.1.60.203| 80|50398| 6|

0.005|2009/04/20T11:35:19.445| S0|

10.1.60.203|

10.1.60.73|50189| 5222| 6|

0.009|2009/04/20T11:35:19.455| S0|

10.1.60.73| 10.1.60.203| 5222|50189| 6|

0.008|2009/04/20T11:35:19.455| S0|

10.1.60.203| 10.1.60.187|49592| 443| 6|

0.056|2009/04/20T11:35:19.519| S0| 10.1.60.187| 10.1.60.203| 443|49592| 6|
0.055|2009/04/20T11:35:19.519| S0| 10.1.60.203| 10.1.60.187| 0| 2048| 1|

1799.899|2009/04/20T12:05:19.389| S0|

10.1.60.187| 10.1.60.203| 0| 0| 1|

1799.899|2009/04/20T12:05:19.390| S0|

10.1.60.203|

10.1.60.5| 0| 2048| 1|

1799.900|2009/04/20T12:05:19.394| S0|

10.1.60.5| 10.1.60.203| 0|

1799.899|2009/04/20T12:05:19.394| S0|

10.1.60.203|

10.1.60.5|56515|

0| 1| 53| 17|

0.002|2009/04/20T11:35:19.502| S0|

10.1.60.5| 10.1.60.203| 53|56515| 17|

0.000|2009/04/20T11:35:19.502| S0|

10.1.60.203|

10.1.60.73| 0| 2048| 1|

1799.902|2009/04/20T12:05:19.416| S0|

10.1.60.73| 10.1.60.203| 0| 0| 1|

packets| 5| 5| 6| 5|
10| 10| 276| 276| 279| 279|
1| 1| 276| 276|

bytes| flags|

sTime| duration|

383|FS PA |2009/04/20T11:35:19.439|

674|FS PA |2009/04/20T11:35:19.440|

433|FS PA |2009/04/20T11:35:19.446|

446|FS PA |2009/04/20T11:35:19.447|

1085|FS PA |2009/04/20T11:35:19.463|

4162|FS PA |2009/04/20T11:35:19.464|

23184|

|2009/04/20T11:35:19.490|

23184|

|2009/04/20T11:35:19.491|

23436|

|2009/04/20T11:35:19.494|

23436|

|2009/04/20T11:35:19.495|

65|

|2009/04/20T11:35:19.500|

81|

|2009/04/20T11:35:19.502|

23184|

|2009/04/20T11:35:19.514|

23184|

| S0|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

72

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 3: What do the data look like?

rwcut --fields=1-5,packets,flags,stime ex3records.rw

sIP|

dIP|sPort|dPort|pro| packets| flags|

sTime|

10.1.60.203| 10.1.60.187|50398| 80| 6|

5|FS PA |2009/04/20T11:35:19.439|

10.1.60.187| 10.1.60.203| 80|50398| 6|

5|FS PA |2009/04/20T11:35:19.440|

10.1.60.203|

10.1.60.73|50189| 5222| 6|

6|FS PA |2009/04/20T11:35:19.446|

10.1.60.73| 10.1.60.203| 5222|50189| 6|

5|FS PA |2009/04/20T11:35:19.447|

10.1.60.203| 10.1.60.187|49592| 443| 6|

10|FS PA |2009/04/20T11:35:19.463|

10.1.60.187| 10.1.60.203| 443|49592| 6|

10|FS PA |2009/04/20T11:35:19.464|

10.1.60.203| 10.1.60.187| 0| 2048| 1|

276|

|2009/04/20T11:35:19.490|

10.1.60.187| 10.1.60.203| 0| 0| 1|

276|

|2009/04/20T11:35:19.491|

10.1.60.203|

10.1.60.5| 0| 2048| 1|

279|

|2009/04/20T11:35:19.494|

10.1.60.5| 10.1.60.203| 0| 0| 1|

279|

|2009/04/20T11:35:19.495|

10.1.60.203|

10.1.60.5|56515| 53| 17|

1|

|2009/04/20T11:35:19.500|

10.1.60.5| 10.1.60.203| 53|56515| 17|

1|

|2009/04/20T11:35:19.502|

10.1.60.203|

10.1.60.73| 0| 2048| 1|

276|

|2009/04/20T11:35:19.514|

10.1.60.73| 10.1.60.203| 0| 0| 1|

276|

|2009/04/20T11:35:19.516|

10.1.60.203|

10.1.60.25| 0| 2048| 1|

356|

|2009/04/20T11:35:19.528|

10.1.60.25| 10.1.60.203| 0| 0| 1|

356|

|2009/04/20T11:35:19.529|

10.1.60.203|

10.1.60.25|60515| 25| 6|

4| S

|2009/04/20T11:35:19.529|

10.1.10.5|

10.1.60.5| 1031| 53| 17|

32|

|2009/04/20T11:35:23.415|

10.1.60.5|

10.1.10.5| 53| 1031| 17|

32|

|2009/04/20T11:35:23.417|

10.1.10.5|

10.1.60.5| 3507| 53| 6|

1| S

|2009/04/20T11:35:23.443|

10.1.60.5|

10.1.10.5| 53| 3507| 6|

1| R A |2009/04/20T11:35:23.444|

10.1.10.5|

10.1.60.5| 3508| 53| 6|

1| S

|2009/04/20T11:35:23.445|

10.1.60.5|

10.1.10.5| 53| 3508| 6|

1| R A |2009/04/20T11:35:23.446|

10.1.10.5|

10.1.60.5| 3507| 53| 6|

1| S

|2009/04/20T11:35:24.084|

10.1.10.5|

10.1.60.5| 3508| 53| 6|

1| S

|2009/04/20T11:35:24.085|

10.1.60.5|

10.1.10.5| 53| 3507| 6|

1| R A |2009/04/20T11:35:24.085|

10.1.60.5|

10.1.10.5| 53| 3508| 6|

1| R A |2009/04/20T11:35:24.086|

10.1.10.5|

10.1.60.5| 3507| 53| 6|

1| S

|2009/04/20T11:35:24.632|

10.1.10.5|

10.1.60.5| 3508| 53| 6|

1| S

|2009/04/20T11:35:24.632|

10.1.60.5|

10.1.10.5| 53| 3508| 6|

1| R A |2009/04/20T11:35:24.633|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

73

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 3: What do the data look like?

rwcut --fields=1-5,iType,iCode,packets,flags,stime ex3records.rw

sIP|

dIP|sPort|dPort|pro|iTy|iCo| packets| flags|

sTime|

10.1.60.203| 10.1.60.187|50398| 80| 6| | |

5|FS PA |2009/04/20T11:35:19.439|

10.1.60.187| 10.1.60.203| 80|50398| 6| | |

5|FS PA |2009/04/20T11:35:19.440|

10.1.60.203|

10.1.60.73|50189| 5222| 6| | |

6|FS PA |2009/04/20T11:35:19.446|

10.1.60.73| 10.1.60.203| 5222|50189| 6| | |

5|FS PA |2009/04/20T11:35:19.447|

10.1.60.203| 10.1.60.187|49592| 443| 6| | |

10|FS PA |2009/04/20T11:35:19.463|

10.1.60.187| 10.1.60.203| 443|49592| 6| | |

10|FS PA |2009/04/20T11:35:19.464|

10.1.60.203| 10.1.60.187| 0| 2048| 1| 8| 0|

276|

|2009/04/20T11:35:19.490|

10.1.60.187| 10.1.60.203| 0| 0| 1| 0| 0|

276|

|2009/04/20T11:35:19.491|

10.1.60.203|

10.1.60.5| 0| 2048| 1| 8| 0|

279|

|2009/04/20T11:35:19.494|

10.1.60.5| 10.1.60.203| 0| 0| 1| 0| 0|

279|

|2009/04/20T11:35:19.495|

10.1.60.203|

10.1.60.5|56515| 53| 17| | |

1|

|2009/04/20T11:35:19.500|

10.1.60.5| 10.1.60.203| 53|56515| 17| | |

1|

|2009/04/20T11:35:19.502|

10.1.60.203|

10.1.60.73| 0| 2048| 1| 8| 0|

276|

|2009/04/20T11:35:19.514|

10.1.60.73| 10.1.60.203| 0| 0| 1| 0| 0|

276|

|2009/04/20T11:35:19.516|

10.1.60.203|

10.1.60.25| 0| 2048| 1| 8| 0|

356|

|2009/04/20T11:35:19.528|

10.1.60.25| 10.1.60.203| 0| 0| 1| 0| 0|

356|

|2009/04/20T11:35:19.529|

10.1.60.203|

10.1.60.25|60515| 25| 6| | |

4| S

|2009/04/20T11:35:19.529|

10.1.10.5|

10.1.60.5| 1031| 53| 17| | |

32|

|2009/04/20T11:35:23.415|

10.1.60.5|

10.1.10.5| 53| 1031| 17| | |

32|

|2009/04/20T11:35:23.417|

10.1.10.5|

10.1.60.5| 3507| 53| 6| | |

1| S

|2009/04/20T11:35:23.443|

10.1.60.5|

10.1.10.5| 53| 3507| 6| | |

1| R A |2009/04/20T11:35:23.444|

10.1.10.5|

10.1.60.5| 3508| 53| 6| | |

1| S

|2009/04/20T11:35:23.445|

10.1.60.5|

10.1.10.5| 53| 3508| 6| | |

1| R A |2009/04/20T11:35:23.446|

10.1.10.5|

10.1.60.5| 3507| 53| 6| | |

1| S

|2009/04/20T11:35:24.084|

10.1.10.5|

10.1.60.5| 3508| 53| 6| | |

1| S

|2009/04/20T11:35:24.085|

10.1.60.5|

10.1.10.5| 53| 3507| 6| | |

1| R A |2009/04/20T11:35:24.085|

10.1.60.5|

10.1.10.5| 53| 3508| 6| | |

1| R A |2009/04/20T11:35:24.086|

10.1.10.5|

10.1.60.5| 3507| 53| 6| | |

1| S

|2009/04/20T11:35:24.632|

10.1.10.5|

10.1.60.5| 3508| 53| 6| | |

1| S

|2009/04/20T11:35:24.632|

10.1.60.5|

10.1.10.5| 53| 3508| 6| | |

1| R A |2009/04/20T11:35:24.633|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

74

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 3: What do the data look like?

rwcut --fields=1-5,packets,flags,initialFlags,sessionFlags,stime ex3records.rw

sIP|

dIP|sPort|dPort|pro| packets| flags|initialF|sessionF|

sTime|

10.1.60.203| 10.1.60.187|50398| 80| 6|

5|FS PA | S

|F PA |2009/04/20T11:35:19.439|

10.1.60.187| 10.1.60.203| 80|50398| 6|

5|FS PA | S A |F PA |2009/04/20T11:35:19.440|

10.1.60.203|

10.1.60.73|50189| 5222| 6|

6|FS PA | S

|F PA |2009/04/20T11:35:19.446|

10.1.60.73| 10.1.60.203| 5222|50189| 6|

5|FS PA | S A |F PA |2009/04/20T11:35:19.447|

10.1.60.203| 10.1.60.187|49592| 443| 6|

10|FS PA | S

|F PA |2009/04/20T11:35:19.463|

10.1.60.187| 10.1.60.203| 443|49592| 6|

10|FS PA | S A |F PA |2009/04/20T11:35:19.464|

10.1.60.203| 10.1.60.187| 0| 2048| 1|

276|

|

|

|2009/04/20T11:35:19.490|

10.1.60.187| 10.1.60.203| 0| 0| 1|

276|

|

|

|2009/04/20T11:35:19.491|

10.1.60.203|

10.1.60.5| 0| 2048| 1|

279|

|

|

|2009/04/20T11:35:19.494|

10.1.60.5| 10.1.60.203| 0| 0| 1|

279|

|

|

|2009/04/20T11:35:19.495|

10.1.60.203|

10.1.60.5|56515| 53| 17|

1|

|

|

|2009/04/20T11:35:19.500|

10.1.60.5| 10.1.60.203| 53|56515| 17|

1|

|

|

|2009/04/20T11:35:19.502|

10.1.60.203|

10.1.60.73| 0| 2048| 1|

276|

|

|

|2009/04/20T11:35:19.514|

10.1.60.73| 10.1.60.203| 0| 0| 1|

276|

|

|

|2009/04/20T11:35:19.516|

10.1.60.203|

10.1.60.25| 0| 2048| 1|

356|

|

|

|2009/04/20T11:35:19.528|

10.1.60.25| 10.1.60.203| 0| 0| 1|

356|

|

|

|2009/04/20T11:35:19.529|

10.1.60.203|

10.1.60.25|60515| 25| 6|

4| S

| S

| S

|2009/04/20T11:35:19.529|

10.1.10.5|

10.1.60.5| 1031| 53| 17|

32|

|

|

|2009/04/20T11:35:23.415|

10.1.60.5|

10.1.10.5| 53| 1031| 17|

32|

|

|

|2009/04/20T11:35:23.417|

10.1.10.5|

10.1.60.5| 3507| 53| 6|

1| S

| S

|

|2009/04/20T11:35:23.443|

10.1.60.5|

10.1.10.5| 53| 3507| 6|

1| R A | R A |

|2009/04/20T11:35:23.444|

10.1.10.5|

10.1.60.5| 3508| 53| 6|

1| S

| S

|

|2009/04/20T11:35:23.445|

10.1.60.5|

10.1.10.5| 53| 3508| 6|

1| R A | R A |

|2009/04/20T11:35:23.446|

10.1.10.5|

10.1.60.5| 3507| 53| 6|

1| S

| S

|

|2009/04/20T11:35:24.084|

10.1.10.5|

10.1.60.5| 3508| 53| 6|

1| S

| S

|

|2009/04/20T11:35:24.085|

10.1.60.5|

10.1.10.5| 53| 3507| 6|

1| R A | R A |

|2009/04/20T11:35:24.085|

10.1.60.5|

10.1.10.5| 53| 3508| 6|

1| R A | R A |

|2009/04/20T11:35:24.086|

10.1.10.5|

10.1.60.5| 3507| 53| 6|

1| S

| S

|

|2009/04/20T11:35:24.632|

10.1.10.5|

10.1.60.5| 3508| 53| 6|

1| S

| S

|

|2009/04/20T11:35:24.632|

10.1.60.5|

10.1.10.5| 53| 3508| 6|

1| R A | R A |

|2009/04/20T11:35:24.633|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

75

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 3a: I wonder what a raw file looks like?

cd # make home directory the working directory

rm ­f ex3arecords.rw # remove file; ok if not there

rwfilter --type=in \

--start-date=2009/4/20:14 --protocol=0- \

--compress=none \

--max-pass=1

\

--pass=ex3arecords.rw

ls -l ex3arecords.rw

rwfileinfo ex3arecords.rw

rwcut --fields=1-5,packets ex3arecords.rw

rwcut ­-all-fields ex3arecords.rw

hexdump -C ex3arecords.rw # any readable text?

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

76

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 3a Output

ex3a.sh

-rw-r--r--. 1 pnk pnk 264 Jan 7 21:10 ex3arecords.rw

rwfileinfo ex3arecords.rw

ex3arecords.rw:

format(id)

FT_RWIPV6ROUTING(0x0c)

version

16

byte-order

littleEndian

compression(id)

none(0)

header-length

176

record-length

88

record-version

1

silk-version

3.10.0

count-records

1

file-size

264

command-lines

1 rwfilter --type=in --start-date=2009/4/20:11 --protocol=0- --compress=none --max-

pass=1 --pass=ex3arecords.rw

rwcut --fields=1-5,packets ex3arecords.rw

sIP|

dIP|sPort|dPort|pro|

10.1.10.5|

10.1.60.5| 3507| 53| 6|

packets| 1|

rwcut --all-fields ex3arecords.rw

sIP|

dIP|sPort|dPort|pro| packets|

bytes| flags|

sTime|

duration|

eTime|sen| in| out|

nhIP|initialF|sessionF|attribut|appli|cla|

type|

sTime+msec|

eTime+msec| dur+msec|iTy|iCo|

10.1.10.5|

10.1.60.5| 3507| 53| 6|

1|

48| S

|2009/04/20T11:35:23.443|

0.001|2009/04/20T11:35:23.444| S0| 0| 0|

0.0.0.0| S

|

|

| 0|all|

in|2009/04/20T11:35:23.443|2009/04/20T11:35:23.444| 0.001| | |

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

77

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 3a Output

hexdump -C ex3arecords.rw # any readable text? 00000000 de ad be ef 00 0c 10 00 00 2d ed d0 00 58 00 01 00000010 00 00 00 02 00 00 00 76 72 77 66 69 6c 74 65 72 00000020 20 2d 2d 74 79 70 65 3d 69 6e 20 2d 2d 73 74 61 00000030 72 74 2d 64 61 74 65 3d 32 30 30 39 2f 34 2f 32 00000040 30 3a 31 31 20 2d 2d 70 72 6f 74 6f 63 6f 6c 3d 00000050 30 2d 20 2d 2d 63 6f 6d 70 72 65 73 73 3d 6e 6f 00000060 6e 65 20 2d 2d 6d 61 78 2d 70 61 73 73 3d 31 20 00000070 2d 2d 70 61 73 73 3d 65 78 33 61 72 65 63 6f 72 00000080 64 73 2e 72 77 00 00 00 00 00 00 00 00 2a 00 00 00000090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 * 000000b0 33 1e 4f c3 20 01 00 00 01 00 00 00 b3 0d 35 00 000000c0 06 00 00 00 02 02 00 01 00 00 00 00 00 00 00 00 000000d0 01 00 00 00 30 00 00 00 00 00 00 00 00 00 00 00 000000e0 00 00 ff ff 0a 01 0a 05 00 00 00 00 00 00 00 00 000000f0 00 00 ff ff 0a 01 3c 05 00 00 00 00 00 00 00 00 00000100 00 00 ff ff 00 00 00 00 00000108

|.........-...X..| |.......vrwfilter| | --type=in --sta| |rt-date=2009/4/2| |0:11 --protocol=| |0- --compress=no| |ne --max-pass=1 | |--pass=ex3arecor| |ds.rw........*..| |................|
|3.O. .........5.| |................| |....0...........| |................| |......<.........| |........|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

78

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Example
sensor1

RootDir sensor2

Repository
silk.conf

in

inweb

int2int

out

outweb

ext2ext

year

month

day
hour, sensor

flowtype-SENSOR_yyyymmdd.hh e.g., in-SENS1_20091231.23

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

79

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Basic SiLK Tools: rwfilter
Pick files from the repository

Compression

Plug in additional tools

Basic statistics

Direct flow output

Advanced flow-by-flow filtering

Swiss Army knife logo is a registered trademark of Victorinox AG

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

80

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

rwfilter Syntax
General form
rwfilter {INPUT | SELECTION} PARTITION OUTPUT [OTHER]
Example call
rwfilter --sensor=S0 --type=in \ --start-date=2015/8/5T13 \ --end-date=2015/8/5T20 \ --protocol=0- --pass=workday-5.rw

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

81

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Selection and Input Criteria
Selection options control access to repository files: · --start-date=2009/4/21 · --end-date=2009/4/21T03 · --sensor=S0 · --type=in,inweb
Alternatively, use input criteria for a pipe or a file: · myfile.rw · stdin · useful for chaining filters through a pipe with stdin/stdout

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

82

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Basic Partitioning Options
· Simple numeric fields: ports, protocol, ICMP Type · Specified IP addresses, CIDR blocks · Sets of IP addresses · Combinations of key fields ­ Tuple files

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

83

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Simple Numeric Key Fields

--protocol= --sport= --dport= --aport=
--protocol=6,17 --protocol=0-5,7-16,18--protocol=0--dport=80,443 --sport=6000-6063,9100-9107 --aport=20,21 --sport=0-1023

# source, dest, any
# TCP or UDP # not TCP or UDP # all protocols # HTTP or HTTPS # X11 or JetDirect # FTP # Well-Known Ports

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

84

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Specified IP address or CIDR block
--saddress= --daddress= --any-address= --not-saddress= --not-daddress= --not-any-address=

May specify a single: IP address CIDR block

192.0.2.1 192.0.2.0/24

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

85

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Specified IP addresses or CIDR blocks

--scidr= --not-scidr=

--dcidr= --any-cidr= --not-dcidr= --not-any-cidr=

May specify multiple: IP addresses CIDR blocks mixture

192.0.2.1,198.51.100.3 192.0.2.0/24,198.51.100.0/24 192.0.2.1,192.0.2.8/29

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

86

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Sets of arbitrary addresses
--sipset= --dipset= --anyset= --not-sipset= --not-dipset= --not-anyset=
Specifies the name of a file storing the IP set: --sipset=internalservers.set --dipset=RussianBizNtwk.set --anyset=TorNodes.set --not-dipset=whitelist.set

http://www.ikea.com/us/en/catalog/products/50149560/

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

87

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

rwfilter output options

--pass-destination= --fail-destination= --all-destination=

# file to get records that pass # file to get records that fail # file to get all records

--print-statistics --print-volume-statistics

# report recs read/pass/fail # report how many # recs/pkts/bytes pass/fail

https://gotomydevices.com/

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

88

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

What Is Going on Here? -- 5

rwfilter --sensor=S0 --type=in \ --start=2009/4/21T00 --end=2009/4/21T07 \ --daddress=10.1.0.0/16 --print-volume-stat

| Total|
Pass| Fail|

Recs| 1436| 1436|
0|

Packets| 2615| 2615| 0|

Bytes| 158084| 158084|
0|

Files| 8| | |

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

89

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 4: rwfilter
1) Find all traffic going outbound to external HTTPS servers on April 20, 2009. Save these flows in file https0420.rw. Only pull records captured by sensor S0. 2) How many flow records matched the criteria?

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

90

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 4: rwfilter
1) Find all traffic going outbound to external HTTPS servers on April 20, 2009. Save these flows in file https0420.rw. Only pull records captured by sensor S0. 2) How many flow records matched the criteria?
Hint
HTTPS normally uses port 443

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

91

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 4: rwfilter solution

rwfilter --sensor=S0 --type=outweb \

--start=2009/4/20 --dport=443 \

--pass=https0420.rw --print-volume-statistics

| Recs| Packets|

Bytes| Files|

Total| 1308| 37588| 39354028| 13|

Pass| 174| 2413| 223465|

|

Fail| 1134| 35175| 39130563|

|

rwfileinfo https0420.rw --fields=count

https0420.rw:

count-records

174

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

92

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Output Criteria

rwfilter leaves the flows in binary (compact) form.

· --pass, --fail: direct the flows to a file or a pipe

· --all: destination for everything pulled from the repository

· One output is required but more than one can be used

(screen not allowed for non-text data). Other useful output

Repository

· --print-statistics or

--print-volume-statistics

· --print-filenames, --print-missing-files

pass

rwfilter

fail

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

93

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

What Is This? -- 8

rwfilter \ --start-date=2010/12/08 \ --type=outweb \

One day's outgoing web, but only if 100,000 or more bytes per flow

--bytes=100000- \

--pass=stdout \

| rwfilter \ stdin \

Chain two rwfilter calls

--duration=60- \ --pass=long-http.rw \ --fail=short-http.rw

One minute or more -> long Less than one minute -> short

Answer: Classifies 100,000+-byte web output flows by fast or slow transfer. Bursty vs. Persistent?

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

94

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Example Typos
--port= --destport= --sip= or --dip= --saddress=danset.set --start-date=2006/06/12--end-date --start-date = 2006/06/12 start-date=2006/06/12 ---start-date=2006/06/12 --start-date=2005/11/04:06:00:00 --end-date=2005/05/21:17:59:59

No such keywords
Needs addr not filename Space needed No spaces around equals Need dashes Only two dashes Only down to hour

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

95

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

SiLK Commandments
1. Thou shalt use Sets instead of using several rwfilter commands to pull data for multiple IP addresses
2. Thou shalt store intermediate data on local disks, not network disks. 3. Thou shalt make initial pulls from the repository, store the results in a file, and
work on the file from then on. The repository is slower than processing a single file. 4. Thou shalt work in binary for as long as possible. ASCII representations are much larger and slower than the binary representations of SiLK data. 5. Thou shalt filter no more than a week of traffic at a time. The filter runs for excessive length of time otherwise. 6. Thou shalt only run a few rwfilter commands at once. 7. Thou shalt specify the type of traffic to filter. Defaults work in mysterious ways. 8. Thou shalt appropriately label all output. 9. Thou shalt check that SiLK does not provide a feature before building your own.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

96

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson II.1 Summary
We learned how to display the fields of interest from flow records.
Files are chosen from the repository with selection options. Records are chosen from those files with partitioning options.
There are lots of ways to partition on IP addresses.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

97

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Next Lesson
In lesson II.2 we will learn to reduce large numbers of flow records to meaningful information and statistics.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

98

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson II.2 Analysis Tools and Categorization

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

99

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson II.2 Learning Objectives
· The learner will be able to create a time series of given flow records.
· The learner will be able to determine all the different values of a given field for given flow records and determine the traffic volumes for those field values.
· The learner will be able to display the top/bottom n values of a given field as measured by some measure of volume.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

100

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Basic SiLK Counting Tools:
rwcount, rwstats, rwuniq
"Count [volume] by [key field] and print [summary]" · basic bandwidth study:
- "Count bytes by hour and print the results."
· top 10 talkers list:
- "Count bytes by source IP and print the 10 highest IPs."
· user profile:
- "Count records by dIP-dPort pair and print all the pairs."
· potential scanners:
- "Count unique dIPs by sIP and print the sources that contacted more than 100 destinations."

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

101

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Categorization--Bins

For motor vehicle trips we could bin trip records by

· vehicle style ­ sedan, coupe, SUV, pickup, van

· highway or city trip

· personal or business trip
We could measure the trips and aggregate in bins

Trip Trip miles miles

· total miles

· fuel consumption · oil consumption

sedan coupe

· pollutant emission

Total miles

Total miles

Trip miles
pickup
Total miles

http://www.prlog.org/10991533-great-value-good-looking-colour-coded-recycling-bins-exclusive-to-imrubbishcouk.html

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

102

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Bins
For flows we could bin by · address or address block · port · protocol · time period
We could measure the flows and aggregate in bins · count of flow records, packets, bytes · count of distinct values of other fields, e.g., addr · earliest sTime, latest eTime

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

103

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Bins

Packet count

Packet count

Packet count

Packet count

TCP

UDP ICMP

Value from flow
record e.g., packets
Bin key field e.g., protocol

Total packets

Total packets

Total packets

Aggregate Value

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

104

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Basic SiLK Counting Tools:
rwcount, rwstats, rwuniq
rwcount: count volume across time periods rwstats: count volume across IP, port, or protocol and create descriptive statistics rwuniq: count volume across any combination of SiLK fields "Key field" = SiLK fields defining bins "Volume" = {Records, Bytes, Packets} and a few others
measure aggregate value Each tool reads raw binary flow records as input.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

105

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

rwcount
· count records, bytes, and packets by time and display results rwcount --bin-size=300
· fast, easy way of summarizing volumes as a time series · great for simple bandwidth studies · easy to take output and make a graph with graphing S/W

http://www.cs.uoregon.edu/research/ tau/docs/paraprof/ch05s02.html

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

106

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Time Bins
When binning by time, you must specify the period of time for each bin. This is called the bin-size. It's the size of the bin's opening, not the volume of the container.
bin-size
Period1 Period2 Period3

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

107

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

rwcount

The bin key is always time. You choose the period. The aggregate measures are chosen for you. They are flows (records), bytes, packets. rwfilter --sensor=S0 --start=2009/4/21 \
--type=in --proto=1 --pass=stdout \ | rwcount --bin-size=3600
Date|Records| Bytes|Packets| ... 2009/04/21T13:00:00| 10.00| 2460.00| 41.00| 2009/04/21T14:00:00| 29.00| 8036.00| 107.00| 2009/04/21T15:00:00| 22.00| 2214.00| 47.00| 2009/04/21T16:00:00| 10.00| 1586.00| 23.00| ...

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

108

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

What Is This? -- 9

rwcount MSSP.rw --bin-size=3600

Date| Records|

Bytes| Packets|

2010/12/08T00:00:00| 1351571.66| 73807086.40| 1606313.61|

2010/12/08T01:00:00| 1002012.43| 54451440.59| 1185143.62|

2010/12/08T02:00:00| 1402404.61| 77691865.26| 1675282.27|

2010/12/08T03:00:00| 1259973.65| 68575249.90| 1491393.08|

2010/12/08T04:00:00| 939313.56| 51410968.24| 1118584.81|

2010/12/08T05:00:00| 459564.75| 80862273.32| 1742058.62|

2010/12/08T06:00:00| 1280651.23| 69881126.41| 1519435.24|

···

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

109

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Demo: rwcount
The shell can help with the arithmetic: $((24*60*60)) You also can find common periods in the Quick Reference Guide. Time series for all outgoing traffic on sensor S0: rwfilter --sensor=S0 --type=out,outweb \
--start=2009/04/21 --end=2009/04/23 \ --proto=0- --pass=stdout \ | rwcount --bin-size=$((24*60*60))

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

110

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 5: rwcount
Produce a time-series with 30-minute intervals, analyzing incoming ICMP traffic collected at sensor S0 on April 20, 2009.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

111

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 5: rwcount
Produce a time-series with 30-minute intervals, analyzing incoming ICMP traffic collected at sensor S0 on April 20, 2009.
HINT
ICMP is Protocol 1

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

112

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 5: rwcount solution
rwfilter --sensor=S0 --type=in \ --start=2009/4/20 --protocol=1 --pass=stdout \
| rwcount --bin-size=1800 Date| Records| Bytes| Packets|
... 2009/04/20T13:30:00| 5.05| 1588.92| 26.48| 2009/04/20T14:00:00| 21.92| 5480.87| 91.35| 2009/04/20T14:30:00| 8.03| 3610.21| 60.17| 2009/04/20T15:00:00| 14.58| 5432.54| 90.54| 2009/04/20T15:30:00| 17.33| 6519.74| 108.66| 2009/04/20T16:00:00| 13.69| 5702.65| 95.04| 2009/04/20T16:30:00| 12.89| 5105.11| 85.09| 2009/04/20T17:00:00| 11.50| 5135.57| 85.59| 2009/04/20T17:30:00| 7.00| 2704.40| 45.07|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

113

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

rwuniq
rwuniq will display all bins for a particular field or fields.
Output is normally unsorted. --sort-output causes sorting by the key (bin).

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

114

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Calling rwuniq
rwuniq --fields=KEY --value=VOLUME
· Choose one or several key fields. · Aggregate volume count: records, bytes, or packets. · standard output formatting options (see "man rwuniq")
Apply thresholds to bins before outputting:
· --bytes, --packets, --flows, --sip-distinct, --dip-distinct
· Specify minimum aggregate value or a range
--sort-output by key (rwstats sorts by value)

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

115

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

What Is This? ­ 10

rwfilter outtraffic.rw \ --stime=2010/12/08:18:00:00-2010/12/08:18:59:59.999 \ --saddress=71.55.40.62 --pass=stdout \
| rwuniq --fields=dip,sport --all-counts --sort-output

dIP|sPort |

Bytes|Packets| Records|

sTime-Earliest|

eTime-Latest|

12.113.41.190| 80 |

12782|

20|

4|2010/12/08T18:42:51|2010/12/08T18:58:49|

30.182.228.143| 80 | 203907933| 143611|

2|2010/12/08T18:53:59|2010/12/08T19:01:47|

37.153.24.229| 80 | 205628625| 144829|

2|2010/12/08T18:29:11|2010/12/08T18:42:51|

82.180.203.87| 80 | 213013145| 150896|

92|2010/12/08T18:06:36|2010/12/08T18:32:33|

82.180.203.197| 80 |

800|

8|

2|2010/12/08T18:43:30|2010/12/08T18:43:30|

88.124.166.233| 80 | 223930369| 158276|

97|2010/12/08T18:08:55|2010/12/08T18:32:25|

88.124.166.233| 443 | 509285| 732|

43|2010/12/08T18:06:57|2010/12/08T18:51:11|

94.239.226.247| 80 | 124833037| 96047|

3|2010/12/08T18:25:22|2010/12/08T19:21:34|

109.95.61.80| 80 | 8467397| 6325|

90|2010/12/08T18:08:59|2010/12/08T18:10:09|

139.65.186.4| 80 | 204123360| 143794|

3|2010/12/08T18:19:48|2010/12/08T18:26:36|

139.177.10.136| 80 | 407978375| 287354|

6|2010/12/08T18:20:03|2010/12/08T19:01:30|

198.237.16.172| 80 | 159066748| 112025|

1|2010/12/08T18:18:43|2010/12/08T18:46:55|

219.149.72.154| 1024 |

44|

1|

1|2010/12/08T18:50:40|2010/12/08T18:50:40|

249.216.88.172| 80 |

88|

2|

2|2010/12/08T18:44:42|2010/12/08T18:44:47|

250.211.100.88| 80 | 3295160| 2492|

42|2010/12/08T18:47:50|2010/12/08T18:58:53|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

116

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

What Is This? ­ 11

rwuniq outtraffic.rw --fields=dip \

--values=sip-distinct,records,bytes --sip-distinct=400- \

--sort-output

dIP|sIP-Distin|

Bytes| Records|

13.220.28.183|

512|

20480|

512|

171.128.2.27|

448| 19069280| 476732|

171.128.2.179|

448| 139501200| 3487530|

171.128.212.14|

448| 139467440| 3486686|

171.128.212.124|

448| 127664480| 3191612|

171.128.212.127|

448| 66611560| 1665289|

171.128.212.188|

448| 139467680| 3486692|

171.128.212.228|

448| 139393160| 3484829|

245.225.153.120|

763|

30520|

763|

245.238.193.102|

1339| 179480| 4487|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

117

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 6: rwuniq
For outgoing flows from S0 on 2009/04/20, write and execute the rwfilter piped to rwuniq commands to list how many TCP flows (records) there were with each different number of packets. Display sorted by the number of packets. Are there any odd results you can explain?

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

118

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 6: rwuniq
For outgoing flows from S0 on 2009/04/20, write and execute the rwfilter piped to rwuniq commands to list how many TCP flows (records) there were with each different number of packets. Display sorted by the number of packets. Are there any odd results you can explain?
HINT
TCP is protocol 6

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

119

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 6: rwuniq
For outgoing flows from S0 on 2009/04/20, write and execute the rwfilter piped to rwuniq commands to list how many TCP flows (records) there were with each different number of packets. Display sorted by the number of packets. Are there any odd results you can explain?
HINT
TCP is protocol 6 (proto=6) The TCP 3-way handshake requires 3 packets

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

120

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 6: rwuniq Solution

rwfilter --type=out,outweb

\

--sensor=S0

\

--start=2009/4/20

\

--proto=6

\

--pass=stdout

\

| rwuniq --fields=packets --sort-output

packets| 1| 2| 3| 4| 5| 6| 7| 8| 9|
10| 11| 12| 13| 14| 15| 16| 17| 18| 19|

Records| 2573| 129| 133| 25| 271| 289| 182| 74| 61| 20| 20| 8| 16| 7| 1| 6| 1| 3| 2|

What can you say about flows with 1, 2 and 3 packets?
It seems as though 4 packets is an oddity.
Do you have an explanation? What can be accomplished with 4 TCP packets?
There are, of course, exceptions

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

121

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

rwstats
Like rwuniq, rwstats displays bins for a field or fields, but only displays the top N or bottom N bins.
The top/bottom N is determined by some traffic volume measurement, such as flows, packets, or bytes.
The bins are displayed sorted by the measurement. It also provides percentages.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

122

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Calling rwstats

rwstats --overall-stats
· Descriptive statistics on byte and packet counts by record · See "man rwstats" for details.
rwstats --fields=KEY --value=VOLUME --count=N or --threshold=N or --percentage=N [--top or --bottom]
· Choose one or two key fields. · Count one of records, bytes, or packets. · Great for Top-N lists and count thresholds · standard output formatting options (see "man rwstats")

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

123

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

What Is This? ­ 12

rwfilter outtraffic.rw \

--stime=2010/12/08T18:00:00-2010/12/08T18:59:59 \

--pass=stdout \

| rwstats --fields=sip --values=bytes --count=10

INPUT: 1085277 Records for 1104 Bins and 4224086177 Total Bytes

OUTPUT: Top 10 Bins by Bytes

sIP|

Bytes| %Bytes| cumul_%|

71.55.40.62| 1754767148| 41.541935| 41.541935|

71.55.40.169| 1192063164| 28.220617| 69.762552|

71.55.40.179| 331310772| 7.843372| 77.605923|

71.55.40.204| 170966278| 4.047415| 81.653338|

177.249.19.217| 122975880| 2.911301| 84.564639|

71.55.40.72| 110726717| 2.621318| 87.185957|

71.55.40.200| 101593627| 2.405103| 89.591060|

177.71.129.255| 40166574| 0.950894| 90.541954|

71.55.40.91| 35316554| 0.836076| 91.378030|

149.249.114.204| 26634602| 0.630541| 92.008571|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

124

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 7: rwstats
What are the top 10 incoming protocols on April 20, 2009, collected on sensor S0?

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

125

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 7: rwstats
What are the top 10 incoming protocols on April 20, 2009, collected on sensor S0?
HINT
Incoming flows have type in or inweb

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

126

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 7: rwstats solution
rwfilter --sensor=S0 --type=in,inweb \ --start=2009/4/20 --prot=0- --pass=stdout \
| rwstats --fields=protocol --value=records --count=10

INPUT: 5512 Records for 3 Bins and 5512 Total Records

OUTPUT: Top 10 Bins by Records

pro| Records| %Records| cumul_%|

6|

4476| 81.204644| 81.204644|

17|

896| 16.255443| 97.460087|

1|

140| 2.539913|100.000000|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

127

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 8: rwstats
Top 9 inside hosts according to how many outside hosts they communicate with on April 20, 2009, collected on sensor S0? .

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

128

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 8: rwstats
Top 9 inside hosts according to how many outside hosts they communicate with on April 20, 2009, collected on sensor S0?
HINT
Use
--value=distinct:dip

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

129

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 8: rwstats solution

rwfilter --sensor=S0 --type=out,outweb \

--proto=0- --start-date=2009/4/20 --pass=stdout \

| rwstats --fields=sip --value=distinct:dip --count=9

INPUT: 5001 Records for 14 Bins

OUTPUT: Top 9 Bins by dIP-Distinct

sIP|dIP-Distin|%dIP-Disti| cumul_%|

10.1.60.187|

17|

?|

?|

10.1.60.5|

11|

?|

?|

10.1.60.25|

11|

?|

?|

10.1.60.191|

9|

?|

?|

10.1.60.73|

5|

?|

?|

10.1.60.253|

3|

?|

?|

10.1.60.251|

3|

?|

?|

212.117.116.35|

3|

?|

?|

10.1.60.4|

2|

?|

?|

--no-percents will clean up the question marks.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

130

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

rwuniq vs. rwstats - 1

rwuniq
all bins except per thresholds
--sort-output by key otherwise unsorted Thresholds or ranges: --bytes, --packets, --flows, --sip-distinct, --dip-distinct

both Bin by key

rwstats in top/bottom mode
--top or --bottom bins

Default aggregate value is

flows (records).

Sorted by primary

aggregate value

Choose which bins have --count, --threshold,

aggregate values

--percentage

significant enough to

output.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

131

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

rwuniq vs. rwstats - 2

rwuniq

both

--all-counts (bytes, pkts, Show volume aggregate

flows, earliest sTime, value[s].

and latest eTime)

--bin-time to adjust

sTime and eTime

--presorted-input (omit

when value includes

Distinct fields, even if

input is sorted)

--values=

--values=Records,

sTime-Earliest,

Packets, Bytes, sIP-

eTime-Latest

Distinct, dIP-Distinct,

Distinct:KEY-FIELD (KEY-

FIELD can't also be key

field in --fields)

rwstats in top/bottom mode
--no-percents (good when primary aggregate isn't Bytes, Packets, or Records)

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

132

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson II.2 Summary
We learned how to categorize flow records by time or some other field.
Display a time series of flows with rwcount.
Display all categories (bins) with rwuniq.
Display the top or bottom bins, according to some measurement, with rwstats.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

133

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson II.3 IP Sets

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

134

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson II.3 Learning Objectives
· Given a collection of IP addresses and CIDR blocks, the learner will be able to create an IP Set SiLK-file.
· Given an IP Set, the learner will be able to display the contents and characteristics of the set.
· Given an IP Set, the learner will be able to partition flow records based on the presence/absence of IP addresses in the set.
· Given a sequence of flow records, the learner will be able to extract IP addresses from the records and create an IP Set.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

135

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Sets

Black bears Trout
Fleas Tulips

http://www.mywordtemplates.org/diagram/template1501.html

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

136

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Blacklists, Whitelists, Books of Lists...

Too many addresses for the command line? · spam block list · malicious websites · arbitrary list of any type of addresses
Create an IP set! · From individual IP address in dotted decimal or integer format · From CIDR blocks, e.g., 192.168.0.0/16 · From flow records
Use it directly within your rwfilter commands. · --sipset, --dipset, --anyset · --not-sipset, --not-dipset, --not-anyset

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

137

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Set Tools
rwsetbuild: Create a set from text. rwsetcat: Display an IP set as text. rwset: Create sets from binary flow records.
rwsetmember: Test if an address is in given IP sets. rwsettool: Perform set algebra (intersection, union, set difference) on multiple IP sets.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

138

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Creating a Set from a text file

Start with a text file containing IP addresses
IPv4 in dotted quad notation
IPV6 in canonical format (e.g. 2001:db8::f00)
Run rwsetbuild to make the conversion from text to set
$ cat sample.set.txt 192.168.1.1 172.16.0.1 10.1.2.3 $ $ rwsetbuild sample.set.txt sample.set $ ls -l sample* -rw-r--r--. 1 pnk pnk 124 Jan 7 17:22 sample.set -rw-r--r--. 1 pnk pnk 32 Jan 7 17:21 sample.set.txt $ rwsetcat sample.set 10.1.2.3 172.16.0.1 192.168.1.1 $

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

139

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 9: Create a set file
In Exercise 1 you created the text file adr1.txt It should contain two IPv4 addresses in dotted quad notation Create a set file from it

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

140

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 9: Create a set file
In Exercise 1 you created the text file adr1.txt It should contain two IPv4 addresses in dotted quad notation Create a set file from it
HINT
Use
Rwsetbuild <text file> <set file>

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

141

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 9: Create a set file
In Exercise 1 you created the text file adr1.txt It should contain two IPv4 addresses in dotted quad notation Create a set file from it
HINT
If you run it twice, rwsetbuild will not overwrite the set file
You'll have to delete it first.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

142

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Create a Set of IP CIDR Blocks

$ cp ~rbandes/public/private_example.set.txt . # copy file

$ cat private_example.set.txt

# display file

10.0.0.0/8

# RFC 1918 private

172.16.0.0/12 # RFC 1918 private

192.0.2.0/24

# documentation (example.com or example.net)

192.168.0.0/16 # RFC 1918 private

198.51.100.0/24 # documentation (example.com or example.net)

203.0.113.0/24 # documentation (example.com or example.net)

$ rwsetbuild private_example.set.txt private_example.set

$ rwsetcat private_example.set | head -n 5 10.0.0.0 10.0.0.1 10.0.0.2 10.0.0.3 10.0.0.4

$ rwsetcat --count-ips private_example.set 17892096

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

143

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Use IP Set as Partitioning Criterion

$ rwfilter --type=in,inweb --start=2009/4/20 --end=2009/4/24 \ --sipset=private_example.set --print-volume-statistics

| Recs| Packets|

Bytes| Files|

Total| 2563253| 9609775| 5501740288| 369|

Pass| 2557016| 9603538| 5501284187|

|

Fail| 6237| 6237|

456101|

|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

144

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Find Addresses from Traffic NOT in the IP Set
$ rwfilter --type=in,inweb --start=2009/4/20 --end=2009/4/24 \ --not-sipset=private_example.set --pass=stdout \
| rwset --sip-file=outside_not_private.set $ rwsetcat --count-ips outside_not_private.set 6237

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

145

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Examine the IP Set

$ rwsetcat outside_not_private.set | less
$ rwsetcat --cidr-blocks outside_not_private.set | less
$ rwsetcat --network-structure=8 outside_not_private.set 100.0.0.0/8| 6237
$ rwsetcat --network-structure=16 outside_not_private.set \ | wc ­l
2
$ rwsetcat --network-structure=16 outside_not_private.set 100.1.0.0/16| 5932 100.2.0.0/16| 305
$ rwsetcat --network-structure=24 outside_not_private.set \ | wc ­l
264

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

146

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 10 Sets
1) For April 21, 2009 on sensor S0, make a set-file of addresses of all actual inside hosts. Should we examine incoming or outgoing traffic? 2) Make a set-file of all outside addresses. Can you make both sets with one command?

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

147

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 10 Sets
1) For April 21, 2009 on sensor S0, make a set-file of addresses of all actual inside hosts. Should we examine incoming or outgoing traffic? 2) Make a set-file of all outside addresses. Can you make both sets with one command?
HINT
Pipe rwfilter to rwset

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

148

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Set Exercise 10 solution
rwfilter --sensor=S0 --type=out,outweb \ --start-date=2009/4/21 \ --proto=0- --pass=stdout \
| rwset --sip-file=insidehosts.set \ --dip-file=outsidehosts.set

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

149

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 11 Sets
Examine the two set-files from Exercise 9.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

150

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 11 Sets
Examine the two set-files from Exercise 9.

HINT
How big are the set files? What can you say about the files? How many addresses in each set?
What are they?

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

151

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Set Exercise 11 solution
ls ­l insidehosts.set rwfileinfo insidehosts.set rwsetcat insidehosts.set --count rwsetcat insidehosts.set | less
ls ­l outsidehosts.set rwfileinfo outsidehosts.set rwsetcat outsidehosts.set --count rwsetcat outsidehosts.set | less

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

152

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 12 Sets
Which /16 networks are on the inside? Which /8 networks are on the outside?
Bonus question How many /24 networks are on the outside?

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

153

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 12 Sets
Which /16 networks are on the inside? Which /8 networks are on the outside?
Bonus question How many /24 networks are on the outside?
HINT
Use --network-struc=N

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

154

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 12 Sets
Which /16 networks are on the inside? Which /8 networks are on the outside?

Bonus question How many /24 networks are on the outside?
HINT
Use --network-struc=N Where N comes from CIDR notation /N

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

155

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Exercise 12 solution
rwsetcat --network-struc=16 insidehosts.set rwsetcat --network-struc=8 outsidehosts.set
Bonus question rwsetcat --network-struc=24 outsidehosts.set \
| wc -l

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

156

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Set-like Files: Bags
Wouldn't it be nice to count something per address and associate the two? Yes, it would, it exists and it is called a Bag · rwbag · rwbagbuild · rwbagcat · rwbagtool

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

157

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Bag Example

rm -f sf.bag rwfilter --type=out,outweb
--sensor=S0 --start=2009/4/20 --proto=0--pass=stdout | rwbag --sip-flows=sf.bag

$ rwbagcat sf.bag 10.1.60.4| 10.1.60.5|
10.1.60.25| 10.1.60.53| 10.1.60.73| 10.1.60.74| 10.1.60.153| 10.1.60.187| 10.1.60.191| 10.1.60.251| 10.1.60.253| 212.117.116.35| 212.117.116.36| 212.117.116.38|

20| 3155|
182| 1|
171| 1|
11| 1045|
250| 115|
12| 8|
28| 2|

\ \ \ \ \

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

158

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Set-like Files: Prefix Map (PMap)
How do I work with, say, service names like HTTP and HTTPS rather than 80 and 443?
Use a PMap, short for Prefix Map
· rwpmapbuild · rwpmapcat · rwpmaplookup

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

159

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Pmap Example

rwfilter --sensor=S0

\

--start=2009/4/21 \

--proto=0-

\

--pass=stdout

\

| rwuniq --pmap-file=pname:/data/bluered/protocols.pmap \

--fields=src-pname,proto

\

--values=bytes --sort-out

src-pname|pro|

Bytes|

ICMP| 1|

17228|

TCP| 6|

53954032|

UDP| 17|

1175172|

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

160

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Set-like Files: Tuple
Is there a way to search for multiple, independent field values without resorting to multiple rwfilter commands?
Yes, it is called a Tuple and it can be used in addition to or instead of other partitioning parameters (use it instead of, say, proto=6 dport=25,58,143,158,209,366,465,587)
rwfilter ... -tuple-file=email-ports.txt ...

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

161

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Comparison of IP Set, Bag, Tuple, PMap

Semantics Columns
1st Column
2nd Column
Used for Partitioning Used for Field Output Binary/Text Combine
Usual Role

IP Set presence
1 IP Addr
--
yes

Bag volume
2 various
measure

Tuple
conditionals
1­5
Flow-Label Field
Flow-Label Field or none

PMap categories
2 IP Addr or Proto/Port
Label

no

yes

yes

no

no

no

yes

binary
set algebra
input, interim, output

binary

text

arithmetic

no

binary no

interim, output

input, interim

input

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

162

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lesson II.3 Summary
An IP Set is a collection of IP addresses. There are no duplicates in a set. An IP address is either in a given set or it is not.
rwsetbuild creates an IP Set from a text file. rwset creates an IP Set from flow records.
IP sets can be used for partitioning flow records with rwfilter.
rwsetcat displays the contents or summaries of an IP Set.

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

163

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Part II Summary--Basic SiLK
· rwsiteinfo · rwcut · rwfilter · rwcount · rwstats · rwuniq · rwsetbuild · rwsetcat · rwset · rwsetmember

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

164

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

A look ahead
There is more to the SiLK Analysis Tool Suite than the above · TCP Flags · Application Label · PySiLK · Plug-ins · Rayon

The Analyst's Handbook is a great resource for learning more http://tools.netsa.cert.org/silk/analysis-handbook.pdf As is the report: Network Profiling Using Flow http://www.sei.cmu.edu/reports/12tr006.pdf

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

165

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Resources http://tools.netsa.cert.org/silk/docs.html

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

166

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Resources http://tools.netsa.cert.org/

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

167

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Questions?

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

168

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Contact Information
Paul Krystosek -- pnk@cert.org Matt Heckathorn -- maheckathorn@cert.org
Software Engineering Institute Carnegie Mellon University Pittsburgh, PA

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

169

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Extra slides

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

170

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

How well does compression work?

FILE=compress-none.rw

for RECS in 1 2 3 4 5 6 7 8 9 10 11

do

rm -r $FILE

rwfilter --type=all

\

--start-date=2009/4/20:11 \

--protocol=0- \

--compress=none \

--max-pass=$RECS \

--pass=$FILE

ls -l $FILE

done

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

171

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

No compression vs compression

-rw-r--r--. 1 pnk pnk 264 Jan 5 22:02 compress-none.rw -rw-r--r--. 1 pnk pnk 352 Jan 5 22:02 compress-none.rw -rw-r--r--. 1 pnk pnk 440 Jan 5 22:02 compress-none.rw -rw-r--r--. 1 pnk pnk 528 Jan 5 22:02 compress-none.rw -rw-r--r--. 1 pnk pnk 616 Jan 5 22:02 compress-none.rw -rw-r--r--. 1 pnk pnk 704 Jan 5 22:02 compress-none.rw -rw-r--r--. 1 pnk pnk 792 Jan 5 22:02 compress-none.rw -rw-r--r--. 1 pnk pnk 880 Jan 5 22:02 compress-none.rw -rw-r--r--. 1 pnk pnk 968 Jan 5 22:02 compress-none.rw -rw-r--r--. 1 pnk pnk 1056 Jan 5 22:02 compress-none.rw -rw-r--r--. 1 pnk pnk 1144 Jan 5 22:02 compress-none.rw

-rw-r--r--. 1 pnk pnk 256 Jan 5 22:02 compress-best.rw -rw-r--r--. 1 pnk pnk 272 Jan 5 22:02 compress-best.rw -rw-r--r--. 1 pnk pnk 282 Jan 5 22:02 compress-best.rw -rw-r--r--. 1 pnk pnk 290 Jan 5 22:02 compress-best.rw -rw-r--r--. 1 pnk pnk 298 Jan 5 22:02 compress-best.rw -rw-r--r--. 1 pnk pnk 303 Jan 5 22:02 compress-best.rw -rw-r--r--. 1 pnk pnk 324 Jan 5 22:02 compress-best.rw -rw-r--r--. 1 pnk pnk 333 Jan 5 22:02 compress-best.rw -rw-r--r--. 1 pnk pnk 344 Jan 5 22:02 compress-best.rw -rw-r--r--. 1 pnk pnk 355 Jan 5 22:02 compress-best.rw -rw-r--r--. 1 pnk pnk 364 Jan 5 22:02 compress-best.rw

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

172

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Visualization

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

173

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Flow Visualization
Visualization has many uses · Analysis · Explanation · Discovery
One of the best results of visualization is to speed up whatever you are doing

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

174

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Popular types of visualization:
· Bar Chart · Time Series · Scatter Plot · Histogram · Link diagram (directed graph) · Heat Map · Other
- Timelines - Geographic maps
- Pie charts

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

175

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Software to do visualization: Rayon
· Rayon was written to work and play well with SiLK and Python · It fits in with the Unix pipe mode of scripting · It doesn't (yet?) handle everything we want to do

Viz Type Bar Chart Time Series Scatter Plot Histogram Link diagram Heat Map

Application rycategories rytimeseries ryscatterplot rycategories GraphViz ryhilbert

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

176

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

What does our data look like?

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

177

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lets take a closer look 2009/04/20

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

178

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lets take a closer look 2009/04/21

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

179

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lets take a closer look 2009/04/22

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

180

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lets take a closer look 2009/04/23

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

181

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Lets take a closer look 2009/04/24

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

182

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

2009/04/20

2009/04/22

2009/04/23

2009/04/24

Network Traffic Analysis - SiLK Jan 11­14, 2016
© 2016 Carnegie Mellon University

183

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

