© 2018 SPLUNK INC.
Get Better, Faster Results from Splunk
With the NetApp Data Fabric
Mike McNamara, Hoseb Dermanilian
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Session Speakers

© 2018 SPLUNK INC.

v
HOSEB DERMANILIAN
EMEA, Industry Solutions Manager

MIKE MCNAMARA
Product and Solutions

Agenda
 Digital Transformation  NetApp Data Pipeline (Edge to Core to Cloud)  Splunk Infrastructure Deployments: Which Option Is the Best?
· NetApp Value Proposition · NetApp® Solutions for Splunk · TCO Analysis  Customer References  Key Takeaways

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Digital Transformation
NetApp Data Fabric (edge to core to cloud)

© 2018 SPLUNK INC.
In a world where technology is changing our everyday lives, data-driven digital transformation is accelerating business outcomes.

By 2020, it is expected that 50% of the G2000 will see the majority of their business depend on their ability to create digitally enhanced products, services, and experiences.
IDC Directions 02/17

© 2018 SPLUNK INC.
Digital transformation spending is expected to reach $1.7 trillion worldwide by 2019, a 42% increase from 2017
IDC FutureScape Report 11/17

Digital Transformation Is Changing Industries

© 2018 SPLUNK INC.

Financial Services
18%
Oil and Gas
15.1%
Utilities
29%
Government
17.5%

Traditional
ReveDnuAeTaAt Risk
of Disruption

Industrial Equipment
20%
Retail
>25%
Hospitality
10.9%
Transport
14.2%

8

When successful in their data-driven digital transformation, organizations:

© 2018 SPLUNK INC.

Enable new customer touchpoints

Create innovative business
opportunities

Optimize operations

© 2018 SPLUNK INC.
Our Purpose
Empowering customers to change the world with DATA

NetApp Integrated AI/DL Data Pipeline

© 2018 SPLUNK INC.

EDGE
INGEST

DATA FABRIC
CORE

DATA PREP

TRAINING CLUSTER DEPLOYMENT

CLOUD
ANALYZE

Unified Data Lake

12 3
Training Sets
Test

IM1 IM2 IM3
Repo

Cloud AI GPUaaS/Tiering

© 2018 SPLUNK INC.
Splunk Infrastructure Deployments
Which option is the best?

Splunk Indexing Tier
Hardware considerations for indexers
 Reference indexer specification: · Intel 64-bit chip architecture · 12 CPU cores at => 2GHz · 2GB of RAM · 800 IOPS on average
 Data storage considerations: · Important to ensure that you have enough
disk space
· Replication factor and search factor · A master is not aware of the amount of
storage on individual peer nodes

© 2018 SPLUNK INC.
How many indexers?
300GB ingest per day per indexer

The Trend
What we see every now and then

© 2018 SPLUNK INC.

Ingest Rates

Performance

Availability & Scalability

Splunk Architectures
Option 1: Indexers with internal directattached storage (DAS)
 Challenge in scaling when you have storage and compute coupled: · There's growth in data ingest · There are more users · There are premium apps · There's heavy reporting or searches
(performance)
 Other challenges follow the first: TCO, operations, and regulations

© 2018 SPLUNK INC.

+
Indexer servers with internal storage
10GbE Splunk Network

Universal Forwarders

Search Head Cluster Master

© 2018 SPLUNK INC.

Splunk Architectures
Option 2: Decouple servers from storage
 Advantages: · Lower TCO · < number of indexers; no need for three copies · Use of storage efficiency features · Flexible scalability · Suitable for sharing with other apps · Faster searches · Long retention (compliance)
 Myths? · Overlooked; assumed to be difficult to configure
(can fool)?
· Needs to be architected properly? · Suitable for small installations?

© 2018 SPLUNK INC.

TCO Impact
NetApp versus server-based DAS

© 2018 SPLUNK INC.

-15% -26% -31% -20% >20%

Software and OS licenses (not Splunk licenses)

Reduction in hardware cost

No separate backup or archive hardware

Reduced power/ cooling/ rack space

Total TCO reduction over 3 years

© 2018 SPLUNK INC.
NetApp Solutions for Splunk
Meeting your dynamic requirements

NetApp Solutions for Splunk
Meeting all your needs

© 2018 SPLUNK INC.

Splunk on NetApp® ONTAP®
 Share with other apps
 Use storage efficiencies
 Cloud integration: edge to core to cloud
 ONTAP based backup and recovery

Splunk on NetApp E-Series
 Cost and simplicity
 No cloud requirements
 Direct attach (eliminate networking)
 Combine with Cisco servers in a converge infrastructure

Splunk on NetApp HCI
 Start very small (below 100Gb ingest)
 Share with other apps
 Eliminate third-party server vendor
 Use for hot buckets and move data through S3 for cold

ONTAP® Cloud

NetApp® HCI

ONTAP Select

NetApp® E-Series Arrays

Splunk on ONTAP
Performance, efficiency, availability, and operations considerations

© 2018 SPLUNK INC.

Up to 300% search
performance improvement

No performance
impact failures (drives and controllers)

2:1 inline deduplication
and compression
efficiency

Connect to cloud and archive into
S3

Splunk app for NetApp®
ONTAP®
and NetApp Active IQ®

Splunk on E-Series
Facts and figures
 Directly attach storage to servers (eliminate networking)
 >100% search performance increase
 Single pane of glass in managing over 70PB of storage
 Lower TCO  Six nines of availability

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

An Example of TCO Comparison
7TB ingest a day, 7 days hot/warm, 100 days retention for cold

DAS Based Architecture (option 1)
 96 indexers are needed: · $10K per indexer capex · $22K per indexer opex · TCO for 3 years: $3,072,000

NetApp® Based Architecture (option 2)
 56 indexers are needed: · $6K per indexer capex (no drives) · $18K per indexer opex · $455K storage cost (including support) · $177,367 networking, power, cooling · TCO for 3 years: $1,976,367

35.66% reduced TCO over 3 years

Splunk SmartStore

© 2018 SPLUNK INC.

Search Tier

hot warm cold

Indexing Tier

Hot and recently accessed data on indexers

A1

A2

An

B1

C2

A1

A2

An

B3

C5 .......

A1

A2

An

B4

Cn

Cache Manager

Cache Manager

Cache Manager

Cache Manager loads active dataset on indexers

Remote storage (warm/cold data)

B1

B2

B3

B4

B5

Bn

C1

C2

C3

C4

C5

Cn

S3 or S3 API compliant object stores

· Decoupled storage and compute
· Independently scale storage for longer data retention
· Scale out indexers based on performance demands
· Fewer indexers with hot + active data (only one full copy of warm/cold)
· Lower TCO with S3 & S3 API compliant object stores

NetApp Apps for Splunk
Better manage your infrastructure
 Available from Splunkbase: · NetApp® SANtricity® Performance App
for Splunk Enterprise
· NetApp ONTAP® App for Splunk · NetApp StorageGRID® App for Splunk

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Customer Examples
Running Splunk on NetApp systems

ING DIRECT Success Story

© 2018 SPLUNK INC.

"With the significant amount of machinegenerated data captured every day, we rely on NetApp E-Series to deploy Splunk for monitoring and troubleshooting the multiple platforms in our environment."
Roy Shiladitya Head of Information Technology ING DIRECT Australia

Business challenge
 Deploy a high-performance solution that easily scales  Improve customer retention and analysis
Solution stack
 Splunk, end-to-end monitoring, full display in operations
center, over 1TB-a-day ingest, NetApp® E-Series hybrid flash storage systems
Why NetApp
 Provided scalable performance to start small (ingest
150GB a day) and grow very large (ingest over 1TB a day)
 Exceeded stringent SLAs  Simplified deployment and management

© 2018 NetApp, Inc. All Rights Reserved. NETAPP CONFIDENTIAL

Ticketmaster Success Story

© 2018 SPLUNK INC.

Business challenge
 Quickly detect and block ticket scalpers who use bots to
purchase volumes of tickets and drive up prices
 Improve availability and security
Solution stack
 Splunk network operations center (NOC) dashboards for
capacity problems, availability issues, forensics, transaction tracing, failed transactions, and NetApp® ESeries hybrid flash storage systems
Why NetApp
 Exceeded performance and availability requirements  Simplified and cost-effective deployment  Enabled a new revenue opportunity

© 2018 NetApp, Inc. All Rights Reserved. NETAPP CONFIDENTIAL

© 2018 SPLUNK INC.

Key Takeaways

1. Edge to core to cloud for your data
movements
2. Splunk architectural options
3. Decouple storage from compute for
better results

Join us at Splunk .conf18
NetApp booth T4
Visit www.NetApp.com/BigData

© 2018 SPLUNK INC.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

