SysFlow: Scalable System Telemetry for Improved Security Analytics
-- Fred Araujo and Teryl Taylor
IBM Research

Network Monitoring
­ Packet analysis is not feasible at scale
· suitable for in-depth analysis of specific conversations
­ Flow analysis is a great idea :-)
· collect metadata from network traffic and group sequence of packets sharing the same properties
· applications include bandwidth monitoring, network threat detection, and performance analysis
­ NetFlow
· Cisco's proprietary network protocol used for flow analysis · collects and aggregates information about network traffic
flowing through a device with an enabled NetFlow feature · variations: IPFIX, sFlow, NetStream
IBM Research / January 5, 2020 / © 2020 IBM Corporation

Destination IP 172.13.1.45 172.13.1.45

Source IP 110.3.1.15 110.3.1.15

flow cache

collector

Destination Port Source Port Source Interface Protocol Bytes

80

60444

1

TCP

245

80

60345

1

TCP

354

2

NetFlow only captures half of the telemetry picture.

IBM Research / January 5, 2020 / © 2020 IBM Corporation

3

SysFlow

­ "NetFlow" for system events
­ Captures process control flows, file interactions, and network communications
­ Container-aware, flow-centric semantics for system analytics

network raw packet monitoring capture

NetFlow

system system call monitoring tracing
full visibility (high data volume and processing cost)

SysFlow
semantic compression while preserving
relevant information

IBM Research / January 5, 2020 / © 2020 IBM Corporation

4

"Semantically compressed system events for scalable security, compliance, and performance analytics."

process (1822) process (1823)

clone
ProcessEvent
exec

NetworkFlow

FileFlow

exit
NetworkFlow

endpoint (176.13.1.134, 2345)

file (exfil.py)

endpoint (172.1.0.25, 3000)

IBM Research / January 5, 2020 / © 2020 IBM Corporation

5

Object-Relational View

File
- ID : OID - path : String - type : Char - containerID : OID - State : ObjectState

containerID

fileID newFileID FileEvent

Container
- ID : OID - name : String - imageName : String - imageID : String - type : ContainerType - privileged : Boolean

procID

NetworkEvent*
- procID : OID - ts : Timestamp - opflags : Integer - flags : Integer - threadID : Integer - sip : Integer - sport : Integer - dip : Integer - dport : Integer - proto : Integer

fileID
FileFlow
- fileID : OID - procID : OID - ts : Timestamp - endTs : Timestamp - fd : Integer - opflags : Integer - openflags : Integer - threadID : Integer - numRRecvOps : Long - numWSendOps : Long - numRRecvBytes : Long - numWSendBytes : Long

- fileID : OID - procID : OID - newFileID : OID - ts : Timestamp - fd : Integer - opflags : Integer - flags : Integer - threadID : Integer - ret : Integer
procID

procID

Process

containerID

- ID : OID - parentID : OID - ts : Timestamp - exe : String - exeArgs : String - userID : Integer - userName : String - groupID : Integer - groupName : String - containerID : OID - state : ObjectState

procID ProcessEvent

procID ProcessFlow*

procID

NetworkFlow
- procID : OID - ts : Timestamp - endTs : Timestamp - opflags : Integer - threadID : Integer - sip : Integer - sport : Integer - dip : Integer - dport : Integer - proto : Integer - numRRecvOps : Long - numWSendOps : Long - numRRecvBytes : Long - numWSendBytes : Long

- procID : OID

- procID : OID

- ts : Timestamp

- ts : Timestamp

- opflags : Integer

- opflags : Integer

- args : String[]

- args : String[]

- threadID : Integer

- threadID : Integer

- ret : Integer

- ret : Integer

IBM Research / January 5, 2020 / © 2020 IBM Corporation

6

Operations

Process Events CLONE (process/thread)
File Events MKDIR SYMLINK File Flows OPEN CLOSE
Network Flows ACCEPT SHUTDOWN

EXEC (new process)
RMDIR RENAME
SETNS (enter container) MMAP
CONNECT CLOSE

IBM Research / January 5, 2020 / © 2020 IBM Corporation

EXIT (process/thread) LINK
READ CHOWN/CHMOD SEND

SETUID (change uid)
UNLINK
WRITE MOUNT/UMOUNT
RECEIVE
Implemented in current release Planned for next release

Pretty-printed SysFlow trace (selected attributes):

|Process |./server |./server |./server |./client |./client |./client |./client |./client |./server |./server

|PID |TID |Op Flags |Start Time

|End Time

|Ret |Resource

|NBRead |NBWrite |Cont |

|13823|13823|EXEC

|03/25/2019T19:48:00.704111|

| 0|

|

|

| c1 |

|13823|13823|O

C |03/25/2019T19:48:00.704232|03/25/2019T19:48:00.704242| |/etc/ld.so.cache

|

0|

0| c1 |

|13823|13823|O R C |03/25/2019T19:48:00.704263|03/25/2019T19:48:00.704310| |/lib64/libc.so.6

|

832|

0| c1 |

|13824|13824|EXEC

|03/25/2019T19:48:02.831502|

| 0|

|

|

| c1 |

|13824|13824|O

C |03/25/2019T19:48:02.831617|03/25/2019T19:48:02.831626| |/etc/ld.so.cache

|

0|

0| c1 |

|13824|13824|O R C |03/25/2019T19:48:02.831647|03/25/2019T19:48:02.831692| |/lib64/libc.so.6

|

832|

0| c1 |

|13824|13824| CWR T |03/25/2019T19:48:02.832226|03/25/2019T19:48:12.823003| |127.0.0.1:40556-127.0.0.1:8080 |

80|

80| c1 |

|13824|13824|EXIT

|03/25/2019T19:48:12.823003|

| 2|

|

|

| c1 |

|13823|13823| A WR T |03/25/2019T19:48:02.832197|03/25/2019T19:48:13.422795| |127.0.0.1:40556-127.0.0.1:8080 |

80|

80| c1 |

|13823|13823|EXIT

|03/25/2019T19:48:13.422795|

| 2|

|

|

|

|

Network Flow

- Container/PID:

<OID>

- Start time:

03/25/2019T19:48:02.832226

- End time:

03/25/2019T19:48:12.823003

- Flags:

CWR T (create/write/read/truncated)

- Thread ID:

12824

- Source IP address: 127.0.0.1

- Source Port:

40556

- Dest IP address: 127.0.0.1

- Destination Port: 8080

- Protocol:

TCP

- Bytes sent:

80

- Bytes rcvd:

80

- Send Operations: 2

- Recv Operations: 2

Process - <OID> - <createts> - 12822 - 12824 - ./client - 8080 - 1000 - ccsi - 1000 - ccsi - <CID>

Container - <CID> - c1 - <imageid> - httpd - DOCKER - false

IBM Research / January 5, 2020 / © 2020 IBM Corporation

8

Architectural Overview

Host
...

SysFlow Exporter

Bucket & Object

S3

Metadata Manager conn.

SysFlow Probe

Controller Aggregator

Local cache

Sysflow stream (Avro serialization & compression)

Container n

Container 2

Container 1

sysdig core

kernel netlink bus

...

passive

tap

ring buffer
sysdig probe

open

read

write

exec

system calls

IBM Research / January 5, 2020 / © 2020 IBM Corporation

user space kernel space

Telemetry Pipeline

Storage

Transformation

Analytics

­ Very lightweight to collect and process
­ Significant data reduction compared to other system monitors
­ Semantic lifting simplifies cross-event analytics and process provenance tracking
9

SysFlow Project
­ Open source
github.com/sysflow-telemetry
­ Growing set of APIs
Python, C/C++, Go, ...
­ Non disruptive and easily deployable
helm and docker deployments

IBM Research / January 5, 2020 / © 2020 IBM Corporation

10

Collection Probe Performance

Benchmarks

HTTPD

Apache Benchmark (HTTP)

Minio

Wasabi S3 BM

Mysql

TPC-H HDB

Postgres

TPC-H HDB

Redis

TPC-H HDB

Hadoop

HiBench

IBM Research / January 5, 2020 / © 2020 IBM Corporation

11

Compression Factors

Benchmark
httpd_prefork httpd_worker httpd_event minio mysql postgres redis hadoop
IBM Research / January 5, 2020 / © 2020 IBM Corporation

Trace sizes (# records) for different benchmarks

SysFlow # records Size

Sysdig

# records

Size

8.19E+05

11

6.29E+05

7.9

6.42E+05

7.8

7.52E+05 19.5

1.89E+02 0.09

7.08E+03 0.22

9.10E+03 0.15

6.27E+05 16.4

7.45E+06 62 6.40E+06 58 5.90E+06 53 2.62E+07 552 1.56E+08 2592 9.31E+06 169.2 1.52E+07 68 1.09E+07 234

Audit

# records

Size

1.94E+05 1.93E+05 1.85E+05 2.19E+06 7.86E+05 4.29E+06 8.31E+06 2.47E+06

78 80 75 966 327 2000 4100 1700

12

NetworkFlow (SysFlow)
­ Operates at the transport layer · monitors system calls (e.g., accept, recv, send) · no concept of packet; no remote scan detection*
­ Process-centric · links network activity to process thread

Network Flow

- Container/PID:

<OID>

- Start time:

03/25/2019T19:48:02.832226

- End time:

03/25/2019T19:48:12.823003

- Syscall Flags:

CWR T

(create/write/read/truncated)

- Thread ID:

12824

- Source IP address: 127.0.0.1

- Source Port:

40556

- Dest IP address: 127.0.0.1

- Destination Port: 8080

- Protocol:

TCP

- Bytes sent:

80

- Bytes rcvd:

80

- Send Operations: 2

- Recv Operations: 2

IBM Research / January 5, 2020 / © 2020 IBM Corporation

NetFlow
­ Operates at the network layer · can monitor passive network traffic (to host ports not listening)
­ Network-centric · no process/workload correlation · centralized collection points

NetFlow

- Start time:

03/25/2019T19:48:02.832226

- End time:

03/25/2019T19:48:12.823003

- TCP Flags

SA F

- Source IP address: 127.0.0.1

- Source Port:

40556

- Dest IP address: 127.0.0.1

- Destination Port: 8080

- Protocol:

TCP

- Bytes sent:

80

- Bytes rcvd:

80

- Packets sent:

2

- Packets rcvd:

2

13

How about Linux Audit?
­ Uses pre-configured rules to track system events
· can be coupled with LSMs for runtime monitoring
­ Lacks container-awareness
· containers are user space constructs; kernel cannot track container provenance and actions
· nsID proposal discarded; container ID RFE
­ Does not support binary output formats ­ Can suffer from log spills due to backlog queue limits
· kernel backlog queue can be increased, but takes up kernel memory; difficult to monitor large process trees
IBM Research / January 5, 2020 / © 2020 IBM Corporation

user space kernel space

Application

Linux Kernel

syscall syscall return

kauditd
entry log
exit log

auditd auditctl

audit log audit rules

netlink socket

14

Demo
Simplified attack kill chain 1. Perform reconnaissance on the cluster's
public services and look for vulnerabilities 2. Exploit identified vulnerabilities to drop and
run malicious code in one of the containers 3. The malicious payload downloads malware,
installs and bootstraps it 4. The malware connects to the C&C and get
instructions 5. The malware connects to a data store and
retrieves sensitive data 6. The data is exfiltrated through the C&C

IBM Research / January 5, 2020 / © 2020 IBM Corporation

15

Thank you
github.com/sysflow-telemetry -- sysflow-telemetry.slack.com sysflow@us.ibm.com

SysFlow is an open source research project and not an IBM proprietary product. We hope to establish an open-source community around the project.

© Copyright IBM Corporation 2019. All rights reserved. The information contained in these materials is provided for informational purposes only, and is provided AS IS without warranty of any kind, express or implied. Any statement of direction represents IBM's current intent, is subject to change or withdrawal, and represent only goals and objectives. IBM, the IBM logo, and ibm.com are trademarks of IBM Corp., registered in many jurisdictions worldwide. Other product and service names might be trademarks of IBM or other companies. A current list of IBM trademarks is available at Copyright and trademark information.

IBM Research / January 5, 2020 / © 2020 IBM Corporation

16

IBM Research / January 5, 2020 / © 2020 IBM Corporation

17

Compression Factors

IBM Research / January 5, 2020 / © 2020 IBM Corporation

18

Pretty-printed SysFlow trace (selected attributes):

|Evt #|T |Process | 0|PE|./filer | 1|FF|./filer | 2|FF|./filer | 3|FF|./filer | 4|FF|./filer | 5|FF|./filer | 6|FF|./filer | 7|FE|./filer | 8|FE|./filer | 9|FE|./filer | 10|FE|./filer | 11|FE|./filer | 12|FE|./filer | 13|FE|./filer | 14|FE|./filer | 15|FE|./filer | 16|FE|./filer | 17|FE|./filer | 18|FE|./filer | 19|FE|./filer | 20|PE|./filer

|PPID |PID |TID |Op Flags

| 1887|21847|21847|EXEC

| 1887|21847|21847|O

C

| 1887|21847|21847|O R C

| 1887|21847|21847|O W C

| 1887|21847|21847|O W C

| 1887|21847|21847|O W C

| 1887|21847|21847|O W C

| 1887|21847|21847|MKDIR

| 1887|21847|21847|MKDIR

| 1887|21847|21847|RMDIR

| 1887|21847|21847|RMDIR

| 1887|21847|21847|LINK

| 1887|21847|21847|SYMLINK

| 1887|21847|21847|RENAME

| 1887|21847|21847|UNLINK

| 1887|21847|21847|UNLINK

| 1887|21847|21847|UNLINK

| 1887|21847|21847|UNLINK

| 1887|21847|21847|UNLINK

| 1887|21847|21847|UNLINK

| 1887|21847|21847|EXIT

|Start Time

|End Time

|FD

|04/10/2019T16:47:14.717700|

|

|04/10/2019T16:47:14.717796|04/10/2019T16:47:14.717804|

|04/10/2019T16:47:14.717816|04/10/2019T16:47:14.717858|

|04/10/2019T16:47:14.718098|04/10/2019T16:47:14.718128|

|04/10/2019T16:47:14.718142|04/10/2019T16:47:14.718150|

|04/10/2019T16:47:14.718163|04/10/2019T16:47:14.718170|

|04/10/2019T16:47:14.718188|04/10/2019T16:47:14.718195|

|04/10/2019T16:47:14.718230|

|

|04/10/2019T16:47:14.718397|

|

|04/10/2019T16:47:14.718616|

|

|04/10/2019T16:47:14.718775|

|

|04/10/2019T16:47:14.719299|

|

|04/10/2019T16:47:14.719407|

|

|04/10/2019T16:47:14.719518|

|

|04/10/2019T16:47:14.719623|

|

|04/10/2019T16:47:14.719738|

|

|04/10/2019T16:47:14.719845|

|

|04/10/2019T16:47:14.719956|

|

|04/10/2019T16:47:14.720073|

|

|04/10/2019T16:47:14.720186|

|

|04/10/2019T16:47:14.720320|

|

|Ret |Resource

| 0|

3|

|/etc/ld.so.cache

3|

|/lib/x86_64-linux-gnu/libc.so.6

3|

|/tmp/tested_file.txt

3|

|/tmp/tested_file2.txt

3|

|/tmp/tested_file3.txt

3|

|tested_file_test.txt

| 0|/tmp/testing_dir

| 0|./testing_dir

| 0|/tmp/testing_dir

| 0|./testing_dir

| 0|/tmp/tested_file.txt,./tested_file.txt

| 0|/tmp/tested_file2.txt,./tested_file2.txt

| 0|/tmp/tested_file3.txt,/tmp/tested_file4.txt

| 0|/tmp/tested_file.txt

| 0|./tested_file.txt

| 0|./tested_file2.txt

| 0|/tmp/tested_file2.txt

| 0|./tested_file_test.txt

| 0|/tmp/tested_file4.txt

| 0|

|NOBRead |NOBWrite|

|

|

|

|0:0

|0:0

|

|1:832 |0:0

|

|0:0

|1:31 |

|0:0

|1:37 |

|0:0

|1:37 |

|0:0

|1:41 |

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

IBM Research / January 5, 2020 / © 2020 IBM Corporation

19

