The IT Service Provider Finanz Informatik
Who we are. What we do.

Content
.Overview of the company Finanz Informatik and Requirements .Architecture .Use case .Questions

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 2

23.09.2015

The company serves a large part of the German retail banking market

Finanz Informatik ­ Company Revenue (in mill. )
with saving banks with state banks Employees (full-time equivalents)

1,624 976 338
4,825

Customers

Savings banks

414

State banks + DekaBank

8

State home loan banks

9

Accumulated balance sheet of supported

764

savings banks (in bill. ) (2014)

Savings Banks Financial Group
December 30st, 2015

Credit Unions

Private Banks, other

1) Sources: DSGV, statista (12/31/2014)

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 3

September 2015

Significant scale can be achieved through bundling volume IT services

Supported financial institutions Branches of supported savings banks Bank-specific employees of supported savings banks
Processing volumes Supported accounts (in mill.)
End devices ATMs Statement printers Other self-service terminals Booked entries per annum (in bill.)

14,676 189,362
123
24,693 14,155 14,790
11,6

December 31st, 2014

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 4

September 2015

Finanz Informatik is competitively positioned with its comprehensive portfolio

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 5

September 2015

What was our initial situation

.Requirements

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 6

September 2015

Our Requirements for one solution
The Problem The Requirements

The Solution

Mainframe UNIX Windows Network
Different Enterprise solutions
Logfile analysis Separated by platform

 High availability, efficiency and safety
 Cross-Platform correlation  Multi-Tenancy  Realtime reporting and
alerting

Mainframe UNIX Windows Network
splunk>
Logfile analysis Cross-platform

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 7

September 2015

The todays result of our logvolume growth

PoC Implementation

run & ongoing development

Todays data
1.7 TB/d Logvolume 4,500 Searches 450 Apps

Amount

500 GB/d

2013 / 4.Q.

2014 / 1.Q.

2014 / 2.Q.

Time
2014 / 3.Q.

2014 / 4.Q.

2015/ 1.Q.

2015 / 2.Q.

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 8

September 2015

How we implemented the Requirements

.Architecture

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 9

September 2015

FI-Architecture-Pyramid for splunk>

Presentation

Data

Security and Forwarding

Sources

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 10

September 2015

 6 SearchHead Pools for · Customer-Product and · internal investigations.
 38 Indexer divided in 3 Clusters which are holding the data.
 48 Forwarders - Door-Keepers for the Security-Environment.
 Linux, AIX, Solaris ,Windows, Mainframe, Network, Databases

Transport-Layer ­ Syslogs and Heavy-Forwarders as entry points for the different sources

Datacenter 1
Intermediate ­ Forwarder (trusted Network)

Datacenter 2

Syslog-ng and Heavy-Forwarder

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 11

September 2015

Decentral event-data transportation to the datacenters

Volume: 600 GB

Dual-Datacenter A
12 x Centralized Intermediate
Forwarder

Dual-Datacenter B
12 x Centralized Intermediate
Forwarder

Volume: 500 GB

Volume: 400 GB

6 x decentralize Intermediate Forwarder

6 x decentralize Intermediate Forwarder

Volume: 200 GB

Decentral Dual-Datacenter

Decentral Dual-Datacenter

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 12

September 2015

secured trusted

The Main-Core: Data delivering, replication and searching within a dual datacenter design

Searching

Replication and distributed data storing

Infrastructure-Data
38 Indexer (physical) · each 24 Cores and 128 GB 48 Forwarder 12 Search Heads (physical) 30 TB NAS 120 TB SAN

Data delivering
© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 13

September 2015

Presentation and Administration: Operating with well known apps ...

... and self developed Apps!

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 14

September 2015

FI-Operation-Monitoring-App for adminstration and monitoring of the infrastructure

Status

Storage Operating

Performance

Assets

Buckets

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 15

September 2015

A short story about one of our main use cases

.Use case

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 16

September 2015

Control checks the contact with customer data and follows on all platforms a uniform expiry
1

Systems
2

Databases

Network

Application

Systemprotocols

Central saving

Longterm saving

3

scheduled searches (automatic inspection)

4

5

Control
With suspicion of a security incident the standard process "Critical Security Incident" will be started with participation of workers's council

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 17

September 2015

1 - creating logfiles 2 - central saving logfile 3/4 - scheduled searches on Logfiles 5/6/7 - control

noncritical
6

Check by head of department

Check by Securitiy

7

Information

Management

In the Finanz Informatik the demands of control are fulfilled with the application splunk>
Services of control are offered to saving banks and to Finanz Informatik departments · 90 savings banks (End of 2015) daily get the results of savedsearches as automatically created reports (pdf) · each report inherits the results of (at the moment) 25 saved searches · Head of departments (Finanz Informatik) also get daily reports and an alarm in one hour (in case of a security incident) · depending on the requirement the amount of savedsearches is between 15 up to 30 savedsearches · each report is equivalent to on app(UI)

logon
· unsuccessful logons · successful logons on non-buiseness times, etc.
Access to and change of configuration
· (un-)successful access to objects under control,etc.
Change of access authorization
· creating and deleting/deactivating accounts, etc. · blocking accounts · right escalation

when ­ who ­ what ­ where ­ from where

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 18

September 2015

Different sources and mechanismen are used to create ~200 dashboards/reports

services hostnames applications configurations ...
Events · security · applications · platforms ·...

cmdb logs

report/ dashboard
correlation

data organisation

~8,000 natural accounts names business units ...

technical user

~190,000 technical accounts

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 19

September 2015

1
Complex IT-architecture
High amount of searches will be scheduled daily in a short time period

~200 Apps (UI)
Platforms
· mainframe (zOS), · unix (solaris, AIX, linux), · Windows (2003, 2012)
Databases
· DB/2, Oracle, MSSQL, IMS
Network
· switches, routers, firewalls
Application
· OSPLus (core banking) · transaction management · identity access management · and many, many more ...
System Control ~300 Technical Apps
· TA, CFG, LK, SA

Administrator
Business Intelligence

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 20

September 2015

2
Complex IT-architecture
Very great amount of searches will be scheduled daily in a short time period

Actually Finanz Informatik schedules about 4,500 searches a day

Finanz Informatik internal reports

Saving Banks customer reports

In 2016 more then 10,000 searches will be expected

about 2,000 searches ...

about 2,500 searches ...

daily 01:00 am to 03:00 am

daily 03:00 am to 06:00 am

Great challenge for splunk> and infrastructure at Finanz Informatik (economic view)

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 21

September 2015

.Questions?

© Finanz Informatik 2015
Alle Rechte vorbehalten. Jegliche Weitergabe und Verwendung erfordert die Zustimmung der FI.

The IT Service Provider Finanz Informatik ­ splunk.conf2015

Page 22

September 2015

Thank you for your kind attention.

Back up

