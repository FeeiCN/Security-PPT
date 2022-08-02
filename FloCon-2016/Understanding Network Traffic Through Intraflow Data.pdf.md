Understanding network traffic through Intraflow data
David McGrew and Blake Anderson
mcgrew@cisco.com, blaander@cisco.com
FloCon 2016

Exploring threat data features at scale

joy

pcap

pcap2flow

json

Offline

pcap2flow

json

Online

collecto

exporter

r

json

https://github.com/davidmcgrew/joy

Flow Monitoring
srcIP, dstIP, srcPort, dstPort, prot, startTime, stopTime, numBytes, numPackets

Observation Observation Observation

Export

Collection

Analysis

Storage

"I need to understand traffic even when it is
encrypted"
Known threats and malware Evasive applications and tunnels TLS, SSH, and other encrypted traffic (on any port)

"I need to understand all the traffic in my
network, not just traffic that passes through a
security appliance"
Monitoring internal traffic Forensics Crypto usage audit

Flow Monitoring
srcIP, dstIP, srcPort, dstPort, prot, startTime, stopTime, numBytes, numPackets

Observation Observation Observation

Export

Collection

Analysis

Storage

New Data Features

Intraflow data
Information about events or data inside of flows that
can be conveniently collected, stored, and analyzed within a flow monitoring framework

Intraflow data
· Economical observation
· Unidirectional · Minimal computation · Small snaplen
· Application/protocol independence · Compactness
· Observation · Transmission and storage
· Composability

Architecture
Flow Records

Classifier

Training architecture

Malware Detonation

Malware Records

Benign Records

Training

Classifier

New Telemetry Data Features

© 2013-2014 Cisco and/or its affiliates. All rights reserved.

Cisco Confidential

10

Enhanced Telemetry Data Types

· SPLT ­ Sequence of Packet Lengths

src

dst

and Arrival Times

· Byte Distribution
· Relative frequency for each byte in a flow
· Byte Entropy
· Initial Data Packet

Sequence of Packet Lengths and Times

Server packets Client packets

src

dst

Time

Byte Distribution

H T T P / 1 . 1

2 0 0

O K

48 54 54 50 2f 31 2e 31 20 32 30 30 20 4f 4b

Byte Distribution

H T T P / 1 . 1

2 0 0

O K

48 54 54 50 2f 31 2e 31 20 32 30 30 20 4f 4b

1

Byte Distribution

H T T P / 1 . 1

2 0 0

O K

48 54 54 50 2f 31 2e 31 20 32 30 30 20 4f 4b

1 1

Byte Distribution

H T T P / 1 . 1

2 0 0

O K

48 54 54 50 2f 31 2e 31 20 32 30 30 20 4f 4b

1 2

Byte Distribution

H T T P / 1 . 1

2 0 0

O K

48 54 54 50 2f 31 2e 31 20 32 30 30 20 4f 4b

1

1

2

Byte Distribution for different encodings

JSON flow data
Conventional flow data Intraflow data Extracted parameters Easy to use with data analytics and machine learning tools

Initial Data Packet

SYN SYN ACK
ACK Data
Data

Data Data

Initial Data Packet

SYN SYN ACK
ACK Data Data
Data

Data

IDP

Experimental results
© 2013-2014 Cisco and/or its affiliates. All rights reserved.

Cisco Confidential

22

Performance

· CPU: Intel Xeon @ 2.70GHz
· 17% utilization at 1.0e7 bytes/sec, 1.2e4 packets/sec
· Approx 870 Mbits/sec at full utilization
· RAM: 8Gbyte
· 2.7% utilization (216 Mbyte)

Everything else
Byte Distribution
Flow lookup, alloc, init

Detecting malware with SPLT and Byte Distribution

© 2013-2014 Cisco and/or its affiliates. All rights reserved.

Cisco Confidential

26

Analytics User Interface

Malware Classification

Classifying flows as malicious/benign

· L1-logistic regression · SPLT + 5-tuple

· L1-logistic regression · SPLT + 5-tuple + BD

Classifying flows as malicious/benign

· L1-logistic regression
· SPLT + 5-tuple
· 160 non-zero parameters · 0.01 FDR: 51.11% · Total Accuracy: 98.44%

· L1-logistic regression
· SPLT + 5-tuple + BD
· 128 non-zero parameters · 0.01 FDR: 98.92% · Total Accuracy: 99.81%

Intraflow data
· Economical observation
· Unidirectional · Minimal computation · Small snaplen
· Application/protocol independence
· Compactness
· Observation · Transmission and storage
· Composability

SPLT 10 packets
Yes Yes Yes Yes
10 bytes 10 bytes Yes

Byte Distribution
Yes Yes No Yes
256 bytes 256 bytes Yes

Intraflow data
· Economical observation
· Unidirectional · Minimal computation · Small snaplen
· Application/protocol independence
· Compactness
· Observation · Transmission and storage
· Composability

SPLT 10 packets
Yes Yes Yes Yes
10 bytes 10 bytes Yes

Byte Distribution
Yes Yes No Yes 16
bytes 256 bytes 256 bytes
Yes

Conclusions
· Intraflow data is feasible to implement, enables useful inferences · SPLT is valuable and relatively cheap · Byte Distribution is valuable but more costly · Training classifiers is key
· Data fusion

Thank You
© 2013-2014 Cisco and/or its affiliates. All rights reserved.

Cisco Confidential

34

Joy applications

pcap

pcap2flow

json

online

pcap2flow

json

online

pcap2flow

json

online

pcap2flow

json

Server

Threat Intelligence

Server

Endpoint

Server

SPAN or TAP

Raspberry Pi Home

