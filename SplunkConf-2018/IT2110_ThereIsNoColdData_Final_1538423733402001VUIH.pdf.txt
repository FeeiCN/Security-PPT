There Is No "Cold Data" In Analytics
Splunk Performance at Enterprise Scale
Somu Rajarathinam | Solutions Architect, Pure Storage
October 2018 | Version 1.0

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Dawn of 4th Industrial Revolution
Big Data, Modern Analytics Driving Change In Every Industry

© 2018 SPLUNK INC.

1st Revolution
1760-1820's Steam Power Rural to Urban
2nd Revolution
1870-1914 Mass Prod., Electricity
Urban to Analog
3rd Revolution
1980-2010 PC, Automation Analog to Digital

4rd Revolution
2010-now AI, Big Data, Cloud, IoT & Edge Computing
Digital to Intelligence

Data Growth

© 2018 SPLUNK INC.

Source: IDC Data Age 2025 Study

Big Data

© 2018 SPLUNK INC.

"Big data is no longer enough. It's now all about Fast Data "
"Big data is only as useful as its rate of analysis"

HOT

COLD

Source: entrepreneur.com

Big Data

© 2018 SPLUNK INC.

"Big data is no longer enough. It's now all about Fast Data "
"Big data is only as useful as its rate of analysis"

HOT

COLD

Source: entrepreneur.com

Challenges With Data Growth
Storage Requirements

© 2018 SPLUNK INC.

PERFORMANCE
Data Ingestion Volume Search Performance
User Count

CAPACITY
Data Ingestion Volume Data Retention (Hot/Cold)
Deployment Model

MANAGEABILITY
Data Protection Non-Disruptive Upgrades
Scalability Data Services

Challenges With Direct Attached Storage

© 2018 SPLUNK INC.

STORAGE UPGRADE
DISRUPTIVE SEAMLESS (NDU)
MANAGEMENT
LABOR-INTENSIVE, ERROR-PRONE SIMPLE, CENTRAL MANAGEMENT
STORAGE AVAILABILITY
LIMITED WITHIN THE HOST AVAILABLE TO ALL HOSTS

DATA SERVICES
NO DATA REDUCTION, ENCRYPTION INCLUDED AND ALWAYS ON

SCALABILITY
LIMITED BY EXPANSION SLOTS HIGHLY SCALABLE
DATA PROTECTION
MANUAL RAID RAID-HA
HOST USAGE
HOST CPU OVERHEAD NO HOST CPU OVERHEAD

How Does Splunk Indexer Store Data?

© 2018 SPLUNK INC.

INGEST DATA
1000 GB

Events

Forwarder(s)

Indexer

Splunk consumes as much as 50%1 of the ingested capacity for its compressed rawdata & index meta data

RAW DATA

.gz

150

GB

15% of ingest data

INDEX DATA

350 GB

.tsidx

500 GB

35% of ingest data

1 ­ For syslog type of data. Splunk reduction rate can vary based on the type of data

Pure's Value With Splunk Data!
On Pure FlashArray

© 2018 SPLUNK INC.

Replicated rawdata (.gz) files are exact copy on peer nodes and are deduplicated on Pure FlashArray
Index files (.tsidx) are logical copy on peer nodes. While they don't benefit on deduplication they get an average of 3 to 1 compression on Pure
Data services like encryption, data reduction, replication and snapshots, for free on Pure FlashArray

Indexer Cluster Storage Usage

1

Replication Factor (RF): 3

TB

Search Factor (SF): 2

© 2018 SPLUNK INC.

150G 350G

150G

150G

350G

116G 150G 116G

1150 GB
382 GB Data reduction è 2.6 : 1

RAW DATA INDEX DATA
SAVED DATA

Splunk Space Usage1 on Pure
For 1 TB of INGEST DATA

© 2018 SPLUNK INC.

No RF/SF
150
350

RF-2, SF-2
150 150
350 350

RF-3, SF-2*
150 150 150
350 350

RF-4, SF-2
150 150 150 150
350 350

500

1000

GB

GB

1150 GB

1300 GB

150

150

116

116 116

266

382

150 116 116
382

150 116 116
382

1 - Space usage for one day of ingest and not considering Hot/Warm or Cold tiers 2 - Splunk recommends RF-3, SF-2

© 2018 SPLUNK INC.
Raw Storage Requirements Comparison
Pure FlashArray vs Direct Attached Storage (DAS) for 90 days of Hot/Warm and 270 days of Cold = 360 days total

Required Storage (TB)
477 231
954 462
549 231
1097 462
620 231
1241 462

1400 1200 1000
800 600 400 200
0

DAS

Pure

106% more

137% more

169% more

1 TB

2TB

RF-2 SF-2

1 TB

2TB

RF-3 SF-2

Data Ingestion Rates per day

1 TB

2TB

RF-4 SF-2

Direct Attached Storage space usage includes standard Splunk data reduction through compression

© 2018 SPLUNK INC.
Raw Storage Requirements Comparison
Pure FlashArray vs Direct Attached Storage (DAS) for 90 days of Hot/Warm and 270 days of Cold = 360 days total

Flashstack for Splunk ­ Ref Arch Logical Architecture using Pure FlashArray Search Head Cluster

Indexer Cluster

Deployer

© 2018 SPLUNK INC.

Storage Tier

Hot Warm

Cold

Cluster Master License Master
 Inline dedupe and compression  Non-disruptive everything  No logical tiering  Scalable Performance

Flashstack for Splunk ­ Ref Arch
Physical Architecture using Pure FlashArray
Search Heads: Cisco UCS B200-M4 blade servers (x3)
Indexers: Cisco UCS B200-M4 blade servers (x8)

© 2018 SPLUNK INC.

Forwarders: Cisco UCS C240-M4 Rack servers (x8)

Master Node: Cisco UCS B200-M4 blade server

Deployment Server: Cisco UCS B200-M4 blade server

https://support.purestorage.com/Solutions/Splunk/Reference/FlashStack_CI_for_Splunk_Reference_Architecture

Searching 7 Billion Events in 2 Seconds
Finding A Needle In A Haystack:

© 2018 SPLUNK INC.

2-3x Data Reduction
Reducing Splunk's Replication Factor & Search Factor

© 2018 SPLUNK INC.

Upcoming Flashstack for Splunk ­ Ref Arch
Logical Architecture using Pure FlashArray & FlashBlade
Search Head Cluster

© 2018 SPLUNK INC.

Indexer Cluster

Deployer

Storage Tier
Hot Warm

Cluster Master License Master

Cold

 High Throughput (File & Object)

 Native Scaleout architecture

 Inline compression & encryption

 Scalable Performance

Splunk Buckets Across Tiers
How Splunk stores data?

© 2018 SPLUNK INC.

Events
Hot Bucket is Full

Too many Warm buckets or out of volume space

$Thawed Path
Out of space or bucket is old

$Home Path

$Cold Path

$Frozen Path or Deleted

Splunk Buckets on Pure Storage #1
Eliminate logical tiering between Hot/Warm and Cold

© 2018 SPLUNK INC.

Events
Hot Bucket is Full

Too many Warm buckets or out of volume space

$Thawed Path
Out of space or bucket is old

$Home Path

$Cold Path

$Frozen Path or Deleted

Splunk Buckets on Pure Storage #2
Gain scalable capacity at better performance

© 2018 SPLUNK INC.

Events
Hot Bucket is Full

Too many Warm buckets or out of volume space

$Thawed Path
Out of space or bucket is old

$Home Path

$Cold Path

$Frozen Path or Deleted

Splunk App for Pure Flasharray

© 2018 SPLUNK INC.

Splunk App for Pure Flasharray

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Use Cases

There is No Cold Data in Analytics
A Joint Pure/Splunk Customer

© 2018 SPLUNK INC.

Hot/Warm

Cold

THEN VS
· Requirement to query historical data frequently · Searches across Cold data hung · Significant Data Growth · Inefficiencies & added complexity of scaling their Cold tier · Resulted in poor Customer Satisfaction

Hot/Warm

Cold

NOW
· Searches across Cold data performed faster
· Cold is also effectively the Hot data · Capacity can be added seamlessly · Improved Customer Satisfaction

Splunk on Pure: Healthcare
Use Case:
 Multi-site, ingest of 1TB/day  Splunk was setup on DAS storage
Business Value
 Ability to standardize for Core IT and Security
Technical Value
 Ease of scale and flexibility while providing best in class performance
 At-rest encryption for the Security team

© 2018 SPLUNK INC.

Splunk on Pure: Credit Union
Use Case:
 Splunk, VDI and VMware all supported by FA//m20
Business Value
 Simplicity and scalability
Technical Value
 Ability to consolidate workloads  Data reduction keeps footprint small (3U)

© 2018 SPLUNK INC.

Splunk on Pure Flasharray
Better Performance
 Faster searches across longer period of time (No tiering)  Scale compute and storage independently
Scalable Capacity
 Linear scalability of capacity and performance  Better data reduction means more capacity
Data Services
 Always on Encryption  Always on deduplication, compression  Snapshots for Backups

© 2018 SPLUNK INC.

Splunk Resources

© 2018 SPLUNK INC.

FlashStack for Splunk Reference Architecture
https://support.purestorage.com/Solutions/Applications/Splunk

Splunk App for Pure FA
TA - https://splunkbase.splunk.com/app/3659/ Apps - https://splunkbase.splunk.com/app/3660/

More Info

© 2018 SPLUNK INC.

https://support.purestorage.com

Somu Rajarathinam
@purelydb www.somu.us https://github.com/rsomu/ somu@purestorage.com

Splunk Solutions Page on Pure
https://support.purestorage.com/Solutions/Splunk

Splunk on Pure Storage
http://www.purestorage.com/splunk

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Q&A

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

The Market-defining All-flash Array: Now In 100% Nvme

18.3TB DirectFlash Module

512TB DirectFlash Shelf
DIRECTFLASH SHELF NOT CURRENTLY GA

100% NVMe DENSITY:
1PB
IN JUST 3U
MULTIPROTOCOL
BUILT-IN

100% NVMe PERFORMANCE:
12 GB/s
BANDWIDTH
99.9999%
AVAILABILITY & NDU EVERYTHING

© 2018 SPLUNK INC.

The All-flash Data Hub For Modern Analytics

DENSITY
10+ PBs / RACK

BIG + FAST
80 GB/S BW 5M+ NFS OPS

CONVERGED
FILE & OBJECT

SIMPLE ELASTIC SCALE
JUST ADD A BLADE!

