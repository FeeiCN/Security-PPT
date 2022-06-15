Don't Miss the Bus ­ Splunking Kafka at Scale
Donald Tregonning ­ Senior Software Engineer Ken Chen ­ Principal Software Engineer Scott Haskell ­ Principal SE Architect
October 2018

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

About Us

© 2018 SPLUNK INC.

Agenda

© 2018 SPLUNK INC.
1. Problem Statement / History Lesson 2. Kafka Connect Framework 3. Connector Deployment 4. Configuration & Tuning 5. Data Onboarding 6. Lessons Learned (Gotchas) 7. What's New!

© 2018 SPLUNK INC.
"How do I reliably get data into Splunk
from Kafka at scale?"

Splunk Add-On for Kafka
https://www.splunk.com/blog/2016/10/31/splunking-kafka-at-scale.html

© 2018 SPLUNK INC.

Lacks Scale Painful Config Poll Based

No Fault Tolerance

Pre-Bulit Panels

Splunk Connect for Kafka

© 2018 SPLUNK INC.

Scalable

Configuration REST API

Push To HTTP Event
Collector

Flexible Data
Onboarding

Splunk Supported

Legacy Splunk Add-on for Kafka

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Kafka Connect Framework

Kafka Connect

© 2018 SPLUNK INC.

Source: Confluent.io

 Ships with Kafka  Scalable & Reliable
Data Streaming  Auto offset management  Flexible Deployment  Source & Sink Connectors  Streaming & Batch  REST Interface

Kafka Connect Concepts

© 2018 SPLUNK INC.

Distributed Execution Model

© 2018 SPLUNK INC.

Distributed Execution Model

© 2018 SPLUNK INC.

Distributed Execution Model

© 2018 SPLUNK INC.

Architecture

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Deployment

Deployment Considerations

© 2018 SPLUNK INC.

Don't Co-Mingle With Splunk

Direct Access to Kafka Brokers

Deploy Centrally or Manage Yourself

Physical, Virtual or Containers

Pre-Requisites

© 2018 SPLUNK INC.

Kafka 0.11.0+

Java 1.8+

Splunk 6.5+

HEC Enabled with Valid token(s)

Quick Start
Apache Kafka with KAFKA_HOME=/opt/kafka
1. Download from Splunkbase - https://splunkbase.splunk.com/app/3862/

© 2018 SPLUNK INC.

2. On all Connect instances create plugin directory and copy plugin

Quick Start (Cont..)
3. Edit $KAFKA_HOME/config/connect-distributed.properties

© 2018 SPLUNK INC.

Quick Start (Cont..)

© 2018 SPLUNK INC.

Quick Start (Cont..)
4. Start Kafka Connect
5. Verify connector

© 2018 SPLUNK INC.

Create Connector

© 2018 SPLUNK INC.

Search for Data in Splunk

© 2018 SPLUNK INC.

Kafka Connect REST API
Base URI ­ http://connect-worker:8083

© 2018 SPLUNK INC.

- list installed connector plugins in cluster - list active connectors - create new connector
- get info about connector - get connector config - get connector status - restart connector - pause connector and tasks - resume paused connector
- delete connector, halting all tasks and delete config

Kafka Connect REST API
- list running tasks for connector - get task's status - restart individual task

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Configuration & Tuning

Key Components

© 2018 SPLUNK INC.

Kafka input

Kafka Connect

HEC output

Splunk Kafka Connect Internals

© 2018 SPLUNK INC.

Kafka Consumer Options
 Kafka consumer options (connect-distributed.properties) · consumer.max.poll.records · consumer.max.poll.interval · consumer.fetch.min.bytes · consumer.fetch.max.bytes · consumer.max.partition.fetch.bytes · consumer.receive.buffer.bytes

© 2018 SPLUNK INC.

Kafka Connect Options

© 2018 SPLUNK INC.

Scale up  Number of concurrent Tasks
· Adjust the concurrency according to number of topic partitions and your hardware resources · Possible to overload a Splunk environment with too many tasks
 HEC batch size · Events are either flushed after a certain time or batched
 HTTP keepalive
Scale out  Adding more "worker" nodes to Kafka Connect Cluster
· When seeing consumer group "lag"

© 2018 SPLUNK INC.
Http Event Collector(HEC) Tuning Options
Scale up  dedicatedIoThreads = <number> (inputs.conf)
· ~ number of cores  parallelIngestionPipelines = <number> (servers.conf)
· ~ 2 (can increase even larger if there are lots of CPU resources)
Scale out  Add more HEC nodes
· When seeing HTTP 503 server busy error · When seeing the processing pipeline full

JVM Tuning Options
 KAFKA_HEAP_OPTS="-Xmx16G ­Xms8G"

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Data Onboarding

Indexer Acknowledgement

© 2018 SPLUNK INC.

 Splunk guarantees "at least once" delivery semantics
 Kafka ACK Options
· splunk.hec.ack.enabled · splunk.hec.ack.poll.interval · splunk.hec.ack.poll.threads · splunk.hec.event.timeout
 Using Acknowledgement may increase Splunk Connector memory usage

Load Balancing
 Connector supports hardware and software Load Balancing  Sticky Sessions must be enabled for Indexer ACK  Set Sticky Session timeout value to highest value available  Duplicates may be a side-effect on session expiry  Load Balancing Options
· splunk.hec.total.channels · Set HEC channels (splunk.hec.total.channels) to multiple HEC endpoints (=
indexers or 2 * indexers behind the load balancer)

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Onboarding Data with HEC Raw and Event Endpoint
 Version 1.0 behavior (global)  Version 1.1 behavior (event based)  Raw endpoint (services/collector/raw)
· props.conf and transforms.conf · Use splunk.hec.raw.line.breaker to inject
string to be used by Splunk to break events
 Event endpoint (services/collector/event)
· splunk.hec.json.event.enrichment is used to add extra fields to All Kafka Records(Global) · Enabling splunk.hec.track.data will send through some Kafka specific data (topics, partitions, offsets) · Good for investigating "data loss" and "data duplication" · Records already in the Splunk HEC JSON format... use splunk.hec.json.event.formatted

What are Kafka Headers?
· Disabled by default
- splunk.header.support = true
· Facilitates per-event routing · Ability to map Kafka metadata to be used as Splunk metadata
- (host, source, sourcetype, index, custom fields)
· Support added for both HEC /event and /raw

© 2018 SPLUNK INC.

Headers (Cont..)

© 2018 SPLUNK INC.

 Kafka Headers contain extra metadata associated with Kafka Records.
 Version 1.1 of connector includes new parameters
· "splunk.header.support" ­ Used to enable Header support · "splunk.header.custom" ­ Used to add custom made headers to a Splunk event · "splunk.header.index" ­ Used to set a Kafka Headers value as the destination index in Spunk · "splunk.header.source" ­Used to set a Kafka Headers value as the source in Spunk · "splunk.header.sourcetype" ­ Used to set a Kafka Headers value as the sourcetype in Spunk · "splunk.header.host" ­ Used to set a Kafka Headers value as the host in Spunk

Headers Example (Cont..)
REST Example to deploy connector with Header support

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
What's new for Splunk Connect for Kafka

Splunk Connect for Kafka Version 1.1

© 2018 SPLUNK INC.

Structed Data (Avro, JSON)

Per-Event Routing / Metadata Override with Kafka Headers

HEC Event Format

Sticky Session Improvements

Custom Java
Keystore Location

© 2018 SPLUNK INC.
Lessons Learned (Gotchas)

© 2018 SPLUNK INC.
Some gotchas we've seen on our adventures
 Match Kafka Connect version to Broker Version. Use Compatibility Matrix!  Auto-topic creation is default behavior, you may have to create them manually  Too many partitions and tasks can overwhelm HEC
· Start small and scale out  Heap Size for high throughput systems  Double check connector jar md5sum against GitHub

© 2018 SPLUNK INC.
Don't forget to rate this session in the .conf18 mobile app

