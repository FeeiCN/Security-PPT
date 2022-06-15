DRUID
INTERACTIVE EXPLORATORY ANALYTICS AT SCALE
FANGJIN YANG · DRUID COMMITTER

OVERVIEW
DEMO SEE SOME NEAT THINGS MOTIVATION WHY DRUID? ARCHITECTURE PICTURES WITH ARROWS COMMUNITY CONTRIBUTE TO DRUID

THE PROBLEM
 Arbitrary and interactive exploration of time series data · Ad-tech, system/app metrics, network/website traffic analysis  Multi-tenancy: lots of concurrent users  Scalability: 10+ TB/day, ad-hoc queries on trillions of events  Recency matters! Real-time analysis
2013

DEMO
IN CASE THE INTERNET DIDN'T WORK PRETEND YOU SAW SOMETHING COOL

REQUIREMENTS
 Scalable & highly available  Real-time data ingestion  Arbitrary data exploration with ad-hoc queries  Sub-second queries  Many concurrent reads
2015

FINDING A SOLUTION
 Load all your data into Hadoop. Query it. Done!  Good job guys, let's go home
2015

Event Streams Insight

FINDING A SOLUTION
Hadoop
2015

PROBLEMS WITH THE NAIVE SOLUTION
 MapReduce can handle almost every distributed computing problem
 MapReduce over your raw data is flexible but slow  Hadoop is not optimized for query latency  To optimize queries, we need a query layer
2015

FINDING A SOLUTION
Hadoop Hadoop (pre-processing and storage)

Query Layer

Event Streams Insight

2015

MAKE QUERIES FASTER
 What types of queries to optimize for?
· Business intelligence/OLAP/pivot tables queries
· Aggregations, filters, groupBys
2015

WHAT WE TRIED

FINDING A SOLUTION
Hadoop Hadoop (pre-processing and storage)

RDBMS?

Event Streams Insight

2015

I. RDBMS - THE SETUP
 Common solution in data warehousing:
· Star Schema · Aggregate Tables · Query Caching
2015

I. RDBMS - THE RESULTS
 Queries that were cached · fast
 Queries against aggregate tables · fast to acceptable
 Queries against base fact table · generally unacceptable
2015

I. RDBMS - PERFORMANCE

Naive benchmark scan rate

~5.5M rows / second / core

1 day of summarized aggregates

60M+ rows

1 query over 1 week, 16 cores

~5 seconds

Page load with 20 queries over a week of data

long time

2015

FINDING A SOLUTION
Hadoop Hadoop (pre-processing and storage)

NoSQL K/V Stores?

Event Streams Insight

2015

II. NOSQL - THE SETUP

 Pre-aggregate all dimensional combinations

 Store results in a NoSQL store

Key

1

ts gender age revenue

1,M

1 M 18 $0.15

1,F

1

F 25 $1.03

1,18

1

F 18 $0.01

1,25

1,M,18

1,F,18

1,F,25

Value
revenue=$1.19 revenue=$0.15 revenue=$1.04 revenue=$0.16 revenue=$1.03 revenue=$0.15 revenue=$0.01 revenue=$1.03
2015

II. NOSQL - THE RESULTS
 Queries were fast
· range scan on primary key
 Inflexible
· not aggregated, not available
 Does not work well with streams
2015

II. NOSQL - PERFORMANCE
 Processing scales exponentially!  Example: ~500k records
· Precompute 11 dimensions · 4.5 hours on a 15-node Hadoop cluster
· Precompute 14 dimensions · 9 hours on a 25-node Hadoop cluster
2015

FINDING A SOLUTION
Hadoop Hadoop (pre-processing and storage)

Commercial Databases

Event Streams Insight

2015

DRUID AS A QUERY LAYER

DRUID
KEY FEATURES LOW LATENCY INGESTION
FAST AGGREGATIONS ARBITRARY SLICE-N-DICE CAPABILITIES
HIGHLY AVAILABLE APPROXIMATE & EXACT CALCULATIONS
2013

DATA STORAGE

DATA!

timestamp 2011-01-01T00:01:35Z 2011-01-01T00:03:63Z 2011-01-01T00:04:51Z 2011-01-01T01:00:00Z 2011-01-01T02:00:00Z 2011-01-01T02:00:00Z ...

page Justin Bieber Justin Bieber Justin Bieber Ke$ha Ke$ha Ke$ha

language city

country ...

en

SF

USA

en

SF

USA

en

SF

USA

en

Calgary CA

en

Calgary CA

en

Calgary CA

added 10 15 32 17 43 12

deleted 65 62 45 87 99 53

2015

PARTITION DATA

timestamp

page

language city

country ... added deleted

2011-01-01T00:01:35Z 2011-01-01T00:03:63Z 2011-01-01T00:04:51Z

Justin Bieber en

SF

USA

Justin Bieber en

SF

USA

Justin Bieber en

SF

USA

Segment 2011-01-01T00/2011-01-01T01

10

65

15

62

32

45

2011-01-01T01:00:00Z Ke$ha

en

Calgary CA

Segment 2011-01-01T01/2011-01-01T02

17

87

2011-01-01T02:00:00Z Ke$ha 2011-01-01T02:00:00Z Ke$ha

en

Calgary CA

en

Calgary CA

Segment 2011-01-01T02/2011-01-01T03

43

99

12

53

 Shard data by time

 Immutable chunks of data called "segments"

2015

IMMUTABLE SEGMENTS
 Fundamental storage unit in Druid  No contention between reads and writes  One thread scans one segment  Multiple threads can access same underlying data
2015

COLUMNAR STORAGE

timestamp 2011-01-01T00:01:35Z 2011-01-01T00:03:63Z 2011-01-01T00:04:51Z 2011-01-01T01:00:00Z 2011-01-01T02:00:00Z 2011-01-01T02:00:00Z ...

page Justin Bieber Justin Bieber Justin Bieber Ke$ha Ke$ha Ke$ha

language city

country ...

en

SF

USA

en

SF

USA

en

SF

USA

en

Calgary CA

en

Calgary CA

en

Calgary CA

added 10 15 32 17 43 12

deleted 65 62 45 87 99 53

 Scan/load only what you need  Compression!  Indexes!

2015

COLUMN COMPRESSION · DICTIONARIES

timestamp 2011-01-01T00:01:35Z 2011-01-01T00:03:63Z 2011-01-01T00:04:51Z 2011-01-01T01:00:00Z 2011-01-01T02:00:00Z 2011-01-01T02:00:00Z ...

page Justin Bieber Justin Bieber Justin Bieber Ke$ha Ke$ha Ke$ha

language city

country ...

en

SF

USA

en

SF

USA

en

SF

USA

en

Calgary CA

en

Calgary CA

en

Calgary CA

 Create ids

· Justin Bieber -> 0, Ke$ha -> 1

 Store

· page

-> [0 0 0 1 1 1]

· language -> [0 0 0 0 0 0]

added 10 15 32 17 43 12

deleted 65 62 45 87 99 53

2015

BITMAP INDICES

timestamp 2011-01-01T00:01:35Z 2011-01-01T00:03:63Z 2011-01-01T00:04:51Z 2011-01-01T01:00:00Z 2011-01-01T02:00:00Z 2011-01-01T02:00:00Z ...

page Justin Bieber Justin Bieber Justin Bieber Ke$ha Ke$ha Ke$ha

language city

country ...

en

SF

USA

en

SF

USA

en

SF

USA

en

Calgary CA

en

Calgary CA

en

Calgary CA

added 10 15 32 17 43 12

deleted 65 62 45 87 99 53

 Justin Bieber -> [0, 1, 2] -> [111000]

 Ke$ha

-> [3, 4, 5] -> [000111]

2015

FAST AND FLEXIBLE QUERIES

row page 0 Justin(Bieber 1 Justin(Bieber 2 Ke$ha 3 Ke$ha

JUSTIN BIEBER [1, 1, 0, 0]
KE$HA [0, 0, 1, 1]

JUSTIN BIEBER OR
KE$HA [1, 1, 1, 1]

2015

ARCHITECTURE

ARCHITECTURE (BATCH ONLY)

Segments

Historical Node

Data

Hadoop

Historical Node

Historical Node

2015

HISTORICAL NODES
 Main workhorses of a Druid cluster  Scan segments  Shared-nothing architecture
2015

ARCHITECTURE (BATCH ONLY)

Segments

Historical Node

Data

Hadoop

Historical Node

Historical Node

Broker Node
Broker Node

Queries
2015

BROKER NODES
 Knows which nodes hold what data  Query scatter/gather (send requests to nodes and merge results)  Caching
2015

EVOLVING A SOLUTION

Hadoop Hadoop (pre-processing and storage)

Druid

Event Streams Insight

2015

MORE PROBLEMS
 We've solved the query problem
· Druid gave us arbitrary data exploration & fast queries
 But what about data freshness?
· Batch loading is slow! · We want "real-time" · Alerts, operational monitoring, etc.
2015

FAST LOADING WITH DRUID
 We have an indexing system  We have a serving system that runs queries on data  We can serve queries while building indexes!  Real-time indexing workers do this
2015

REAL-TIME NODES
 Write-optimized data structure: hash map in heap
 Read-optimized data structure: Druid segments
 Convert write optimized -> read optimized
 Query data as soon as it is ingested  Log-structured merge-tree
2015

ARCHITECTURE (STREAMING-ONLY)

Streaming Data

Segments

Historical Node

Real-time Nodes

Historical Node

Historical Node

Broker Node
Broker Node

Queries
2015

ARCHITECTURE (LAMBDA)

Batch Data
Streaming Data

Hadoop

Segments

Historical Node

Historical Node

Real-time Nodes

Segments

Historical Node

Broker Node
Broker Node

Queries

2015

APPROXIMATE ANSWERS
 Drastically reduce storage space and compute time
· Cardinality estimation · Histograms and Quantiles · Funnel analysis · Add your own proprietary modules
2015

PRODUCTION READY
 High availability through replication  Rolling restarts  4 years of no down time for software updates and restarts  Battle tested
2015

DRUID TODAY

THE COMMUNITY
 Growing Community
· 120+ contributors from many different companies · In production at many different companies, we're hoping for more! · Ad-tech, network traffic, operations, activity streams, etc. · We love contributions!
2015

DRUID IN PRODUCTION
REALTIME INGESTION >3M EVENTS / SECOND SUSTAINED (200B+ EVENTS/DAY)
10 ­ 100K EVENTS / SECOND / CORE
2014

DRUID IN PRODUCTION
CLUSTER SIZE >500TB OF SEGMENTS (>30 TRILLION RAW EVENTS)
>5000 CORES (>350 NODES, >100TB RAM)
IT'S CHEAP MOST COST EFFECTIVE AT THIS SCALE
2014

DRUID IN PRODUCTION

QUERY LATENCY (500MS AVERAGE)

90% < 1S 95% < 2S 99% < 10S

Query latency percentiles
1.5

90%ile

1.0

query time (seconds)

0.5
0.0 4 3 2 1 0
20 15 10
5 0
Feb 03

Feb 10

Feb 17
time

Feb 24

99%ile

95%ile

datasource a b c d e f g h

2014

DRUID IN PRODUCTION
QUERY VOLUME SEVERAL HUNDRED QUERIES / SECOND VARIETY OF GROUP BY & TOP-K QUERIES
2014

DRUID AND THE DATA INFRASTRUCTURE SPACE

Event Streams Insight

STREAMING SETUP
Hadoop Hadoop (pre-processing and storage)

Kafka

Samza

Druid Druid
2015

STREAMING ONLY INGESTION
 Stream processing isn't perfect  Difficult to handle corrections of existing data  Windows may be too small for fully accurate operations  Hadoop was actually good at these things
2015

OPEN SOURCE LAMBDA ARCHITECTURE

Samza

 Real-time  Only on-time data

Event Streams Insight

Kafka

Druid

Hadoop

 Some hours later  All data

2015

TAKE-AWAYS
 When Druid?
· You want to power user-facing data applications · You want to do your analysis on data as it's happening (realtime) · Arbitrary data exploration with sub-second ad-hoc queries · OLAP, BI, Pivot (anything involved aggregates) · You need availability, extensibility and flexibility
2015

DRUID IS OPEN SOURCE
WWW.DRUID.IO
twitter @druidio irc.freenode.net #druid-dev

MY INFORMATION
FJ@IMPLY.IO
twitter @fangjin LinkedIn fangjin

THANK YOU

