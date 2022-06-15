© 2018 SPLUNK INC.
Getting logs and metrics into metricstore
Murugan Kandaswamy, Senior Software engineer Allan Yan, Principal Software engineer

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Agenda
 Why metrics · Traditional way · New way
 Metrics data model  Various ways to GDI for metrics
· Configurations · Deployment topologies  Convert log to metrics · at ingestion time · at search time

© 2018 SPLUNK INC.

Why Metrics?

© 2018 SPLUNK INC.

 Logs · Unstructured data · Needle in the haystack · Can tell you all about the "why" · Answers questions you might not even
have yet
· Very versatile

 Metrics
· Structured Data · High volume · Easy way to do monitoring · You know what you want to measure · e.g. performance, CPU, Number of
users, memory used, network latency, disk usage

Terminology - What is a Metric data point?

© 2018 SPLUNK INC.

Time

ABC.XYZ

Metric Name
system.cpu.idle

Measure
numeric data point

Dimensions
Host (10.1.1.100, web01.splunk.com)
Region (e.g., us-east-1, uswest-1, us-west-2, uscentral1)
 IntanceTypes (e.g., t2.medium, t2.large,
m3.large)

Server A Server B

Metric Time Series Examples

© 2018 SPLUNK INC.

Dimensions

metric_name

host

app

_time

_value

cpu.idle

A

foo

1

4.2

mem,free

B

bar

2

7.3

cpu.idle

A

foo

3

8.4

mem.free

A

baz

4

32

Different Colors Represent Distinct Metric Time Series. Each Row is a Single Metric Data Point, made up of a timestamp, measurement and a set of required and optional dimensions
Both of these data points belong to the same Metric Time Series because they share the exact same set of required and optional dimension key/value pairs:
metric_name=cpu.idle host=A app=foo

© 2018 SPLUNK INC.
"Splunk provides one platform to
analyze and investigate across both events and metrics"

Metrics ­ Before Splunk 7.0

© 2018 SPLUNK INC.

 06/29/2017 16:45:15.170 collection="Available Memory" object=Memory counter="Pages/sec" Value=264 host=10.0.8.156
 06/29/2017 16:47:47.170 collection="MSExchangeIS_Mailbox" object="MSExchangeIS Mailbox" counter="Messages Submitted/sec" instance="_Total" Value=185.3656 host=10.0.8.156

Timestamp Metric Name Measurement Value Dimensions

Metrics ­ Current Way
Ingest metrics natively

© 2018 SPLUNK INC.

SPL

Metric Store
Ability to ingest and store metric measurements at
scale

mstats
tstats equivalent to query time series from
metrics indexes

Metrics Catalog
mcatalog and REST APIs to query lists of ingested metrics and dimensions

Field metric_name _time _value <dim0>...<dimN> _dims host index sourcetype source

Schema of a Metric Index

© 2018 SPLUNK INC.

Required Description



The metric name.



The timestamp of the metric in UNIX time notation.



The numeric value of the metric.

An arbitrary number of dimensions.



Dimension names. Dimensions indicate how metrics are split. Internal, should not be changed



The origin host.



The metrics index name.



The data structure of the metric.

The source of the metrics data.

Example os.cpu.user
42.12345 e.g. ip=10.2.1.166

Blue = Internal or not directly writable

© 2018 SPLUNK INC.
Getting Data In

Supported Approaches
4 ways to get metrics into Splunk
 HEC  Statsd  Collectd  Log to Metrics

© 2017 SPLUNK INC.

Quick Overview HEC

© 2018 SPLUNK INC.

 use the HEC /collector REST API endpoint
· Splunk host machine (IP address, host name, or load balancer name) · HTTP port number · HEC token value · Metrics data payload in JSON format
 Payload schema · Requires fields: metric_name and _value under fields field and event field set to "metric". · Optional fields: time, host, source, sourcetype, and other dimension key/value pairs under fields
field.
· If time field is set, it must be in epoch time format.
 Example
· curl -k https://localhost:8088/services/collector \ -H "Authorization: Splunk b0221cd8-c4b4-465a-
9a3c-273e3a75aa29" -d '{"time": 1486683865.000,"event":"metric",,"fields":{"region":"us-west1","datacenter":"us-west-1a","rack":"63", "_value":1099511627776,"metric_name":"total"}}'

HEC Deployment Scenario 1
One HEC server, pool of indexers
Cloud

© 2018 SPLUNK INC.

Servers and Other Device

Heavy Forwarder with HEC

Splunk Indexing Tier

HEC Deployment Scenario 2

© 2018 SPLUNK INC.

load balancer, no forwarder, pool of indexers, using deployment server

Cloud

Server Farm and Other Devices

Load Balancer

Deployment Server

Splunk Indexing Tier With HEC

HEC Deployment Scenario 3

© 2018 SPLUNK INC.

load balancer, multiple HEC instances with forwarders distributing the data to indexers

Cloud

Load Balancer

Heavy Forwarder with HEC Heavy Forwarder with HEC

Server Farm and Other Devices

Deployment Server

Heavy Forwarder with HEC
Splunk Indexing Tier

Quick Overview StatsD / Collectd

© 2018 SPLUNK INC.

StatsD  StatsD is a open source daemon
that runs on the Node.js platform
 Primarily used to measure performance of application code
 Introduces statsD line metric protocol, often sent to UDP/TCP

Collectd  collectd is an open source daemon
that collects performance metrics from a variety of sources.
 Primarily used to measure system performance (e.g. CPU, memory, disk, network etc)
 Can send data to various endpoint, e.g. HTTP(S)

StatsD
 E.g. Instrumenting application code to track performance  StatsD client libraries available in many programming languages  "Fire and forget" via UDP

© 2018 SPLUNK INC.

Traditional setup with StatsD

Application
StatsD Server

Metrics backend (Non-
Splunk)

StatsD with Splunk

Application

Splunk (e.g. UF)

StatsD Protocol: All Variants are supported
StatsD sourcetype supports 3 different formats

1. StatsD line metric protocol:

· metricname:value|type

· Example
performance.os.disk:1099511627776|g

2. StatsD support with Dimensions (Adjusted metric protocol)

· metricname:value|type|#dim1:value1,dim2:value2

· Example
performance.os.disk:1099511627776|g|#region:us-west-1,datacenter:us-west1a,rack:63,os:Ubuntu16.10,arch:x64,team:LON,service:6, service_version:0,service_environment:test,path:/dev/sda1,fstype:ext3

3. StatsD support with dimensions encoded in metric name (next slide)

· Example

mem.percent.used.10.2.3.4.windows:33|g

ip

os

© 2018 SPLUNK INC.

StatsD Dimension extraction (cont'd)

© 2018 SPLUNK INC.

 E.g. mem.percent.used.10.2.3.4.windows:33|g
# props.conf
[my_custom_metrics_sourcetype] METRIC_PROTOCOL = statsd STATSD-DIM-TRANSFORMS = statsd-dims:my_custom_metrics_transform
# transforms.conf
[statsd-dims:my_custom_metrics_transform] REGEX = (?<ip>\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3})\.(?<os>\w+): REMOVE_DIMS_FROM_METRIC_NAME = true

Statsd Deployment
Cloud

© 2018 SPLUNK INC.

UDP/TCP
Input

S2S ­ TLS/SSL

Server Farm

Universal Forwarder (UF) or Heavy Forwarder (HF) with StatsD source type

Splunk Indexing Tier

Collectd

© 2018 SPLUNK INC.

 E.g. Tracking infrastructure performance (CPU, Memory, Network, Disk etc)
 ~100 frontend plugins
 Send to HEC via write_http plugin
 https://collectd.org

 Example Frontend Plugins

· CPU · df · Disk · Interface · Load · Memory

· Network · Protocols · Swap · Tcpconns · Thermal · Uptime

 Relevant Backend Plugins · write_http

GDI: collectd write_http plugin

© 2018 SPLUNK INC.

 Sample write_http event
{ "values":[98.93638411944], "dstypes":["gauge"], "dsnames":["value"], "time":1474401106.556, "interval":10.000, "host":"C5819124-66AE-4B28-8E13-
914C3961E46C", "plugin":"cpu", "plugin_instance":"0", "type":"cpu", "type_instance":"idle"
}

 Sample Result
· metric_name = cpu.idle.value · _value = 98.93638411944 · plugin_instance = 0 (=CPU core # 0) · metric_type = gauge
plugin_instance is currently the only dimension extracted in addition to the default available dimensions host, source, sourcetype, index

Collectd Deployment Scenario 1
One HEC server, pool of indexers
Cloud

© 2018 SPLUNK INC.

Server Farm

write_http plugin write_http plugin
write_http plugin
write_http plugin

Heavy Forwarder with HEC

Splunk Indexing Tier

Collectd Deployment Scenario 2

© 2018 SPLUNK INC.

load balancer, no forwarder, pool of indexers, using deployment server

Cloud

Server Farm

write_http plugin write_http plugin
write_http plugin
write_http plugin

Load Balancer

Deployment Server

Splunk Indexing Tier With HEC

Collectd Deployment Scenario 3

© 2018 SPLUNK INC.

load balancer, multiple HEC instances with forwarders distributing the data to indexers

Cloud

Server Farm

write_http plugin write_http plugin
write_http plugin
write_http plugin

Load Balancer

Heavy Forwarder with HEC Heavy Forwarder with HEC

Deployment Server

Heavy Forwarder with HEC
Splunk Indexing Tier

© 2018 SPLUNK INC.
Why Log to Metrics?
Ingest log natively as metrics
 Logs which contain metric data like windows performance monitor typically has multiple metrics per log line.
 Before Log to Metrics feature, there was no way of extracting multiple metrics from an event even by defining custom source types(i.e props/transforms configuration).
 Log to metrics feature enables user to extract multiple metrics from an event.

Log to Metrics

© 2018 SPLUNK INC.

 Log to Metrics is available in Splunk Enterprise 7.2 and Splunk Cloud.
 This enables user to natively ingest log sources which has multiple metrics per event directly into metric store.
 User has to list all the measurements to be indexed in metric store.
 Also, Splunk lets user discard some unnecessary high cardinality dimensions present in the log data.

How to ingest Log as Metrics?
 Sample CSV performance monitoring data:
 New Create Sourcetype UI workflow(with Log to Metrics):

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
How to ingest sophisticated log data as metrics?
 A sample key-value log data below has the two sets of measurements.
Log with 2 sets of measurements
 How to generate unique metric_name prefix for logs without it? · Use Ingest time eval feature(Also, available in Splunk Enterprise 7.2). · Ingest eval can be used to remap the field name `group::<value>' as `metric_name::<value>'.

Verify Ingested Log to Metrics data

© 2018 SPLUNK INC.

 Run mcatalog command to verify all measurements and dimensions got indexed into metricstore.

Log to Metrics REST API

© 2018 SPLUNK INC.

 New REST endpoint: /services/data/transforms/metric-schema
 This endpoint lets you configure multiple measures and dimensions to be blacklisted for transforming log to metrics data
 Supported POST request params

Parameter

Details

name

name of the metric schema stanza

field_names

comma separated list of measures to be extracted from an event

blacklist_dimensions comma separated list of dimensions to be blacklisted from an event (optional)

metric_name_prefix (optional)

used when each event has different set of field_names and blacklist_dimensions. If events such as CSV data have the same set of field_names and blacklist dimensions, then metric_name_prefix can be ignored.

Log to Metrics ­ search time

© 2018 SPLUNK INC.

 search command mcollect and meventcollect to re-ingest already indexed log events into metrics index · Similar to summary indexing using collect · No additional license cost · use meventcollect for simple events search · use mcollect turning report output to metrics (e.g. stats, timechart)
 Example

Key Takeaways

© 2018 SPLUNK INC.

Approach (sourcetype/category/search command) HEC (http_event_collector_metrics) Statsd (statsd) Collectd (collectd_http) Log to Metrics (category)
Use search command (mcollect)

Use case preformatted JSON data monitoring application performance monitoring system performance extract one or more measurements from an event at index time extract one or more measurements from an event at search time

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Q&A

