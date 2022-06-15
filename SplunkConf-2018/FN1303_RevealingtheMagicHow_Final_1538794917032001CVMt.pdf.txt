Revealing the Magic
How Splunk 7.2 improved search performance by 50%
Kellen Green | Senior Software Engineer
October 2018

© 2018 SPLUNK INC.

A little bit about myself
6+ years at Splunk

© 2018 SPLUNK INC.

Historical Performance
Since .conf2016

© 2018 SPLUNK INC.

 We're nearing a 50% decrease in search times since Splunk 6.5
 Based out off internal test suite of 80 searches ranging in: · Density · Commands · Duration · 1s to 30 minutes

© 2018 SPLUNK INC.

Todays Agenda
Pretty Simple

1. Splunk is way faster in 2018 than 2016 2. How did we achieve this

3. How can you take advantage of it

Quick Recap
A Splunk Search in Action

© 2018 SPLUNK INC.

Client

Search

Search Head

Lispy

JSON

Indexer

Buckets

TSIDX

Journal

Results

Forwarder

Logs

Extra Credit
Shameless Plug

© 2018 SPLUNK INC.

 A lot of detail was glossed over in the previous slide  Check out my .conf17 talk for a deep dive on each stage of the search process  https://youtu.be/vo900c8nmKs

Improvement #1
Data Serialization

© 2018 SPLUNK INC.

Client

Search

Search Head

Lispy

JSON

Indexer

Buckets

TSIDX

Journal

Results

Forwarder

Logs

Data Serialization
In Splunk 7.1

© 2018 SPLUNK INC.

 Indexers forward search results to the Search Head utilizing the CSV file format
 CSV is text based · Everything needs to be converted into strings
 CSV is verbose · Those commas can add up, not the kind of BIG DATA we're after · Yes it's compressed but this eats into encoding time

Search Results Serialization
New to Splunk 7.2
 Introducing the SRS file format
 New binary serialization format for search results
 Aims to solve the short comings of CSV files · Transmission file size · Encoding performance · Time to first read

© 2018 SPLUNK INC.

Search Results Serialization
Repeating Rows

© 2018 SPLUNK INC.

time

sourcetype

host

path

153231524 a1c0ceascsc_elsosg_log p3ropdr_o1d_1

/2ca/rctart

153232352 access_log

prod_1

/cart

153233432 access_log

prod_1

/1ab/oaubtout

153243455 access_log

s1tasgtianggi_n1g_1 /3ho/mheome

153235768 access_log

p3ropdr_o2d_2

/home

153226454 access_log

prod_2

/home

153237564 access_log

prod_2

/1ca/rctart

153238098 access_log

p2ropdr_o1d_1

/1in/fionfo

153239887 access_log

prod_1

/1it/eimt/e9m/9

153240854 access_log

p1ropdr_o3d_3

/1it/eimt/e2m/2

 Values within fields often repeat · status=200 · method=GET
 SRS dedupes repeated values
 Leads to the compressor having to do less work

Search Results Serialization
String Pools

© 2018 SPLUNK INC.

sourcetype a1c0-c>e1s-s>_log a1c-c>ess_log a1c-c>ess_log a1c-c>ess_log a1c-c>ess_log a1c-c>ess_log a1c-c>ess_log a1c-c>ess_log a1c-c>ess_log a1c-c>ess_log

host p23r-o2>d-_>1 p2r-o>d_1 p2r-o>d_1 s31t-a3>g-i>ng_1 p42r-o4>d-_>2 p4r-o>d_2 p4r-o>d_2 p1r-o1>d-_>1 p21r-o2>d-_>1 p51r-o5>d-_>3

Key 1 2 3 4 5

String access_log prod_1 staging_1 prod_2 prod_3

 To further reduce file size SRS utilizes string pools
 Pools contain unique strings by lookup id
 Events then point pool for string reference
 Leads to much less ram utilization during decode

Search Results Serialization
Event Type Support
 SRS retains type information for event values · Strings, Integers, Floats, Multivalued
 Encodes numbers with variable length encoding (LEB128) · 1532355229 encodes to 40 bits as a number · "1532355229" needs 80 bits when left as a string
 Leads to large gains in encode and decode performance · Float types will see the greatest benefits

© 2018 SPLUNK INC.

Search Results Serialization
Column Major

© 2018 SPLUNK INC.

time

host

sourcetype

1532315243 prod_1

access_log

1532323529 prod_1

access_log

1532334325 prod_1

access_log

1532343455 staging_1 access_log

1532357686 prod_2

access_log

1532264543 prod_2

access_log

1532375644 prod_2

access_log

1532380988 prod_1

access_log

1532398876 prod_1

access_log

1532408547 prod_3

access_log

path /cart /cart /about /home /home /home /cart /info /item/987 /item/125

 SRS serializes in column-major fashion
 Splunk doesn't need to wait for all rows to be sent before working on a column
 Analogous nature of column data leads to compression benefits

Search Results Serialization
See for Yourself

© 2018 SPLUNK INC.

$ cd var/run/splunk/dispatch/$sid $ ls -l
events generate_preview info.csv metadata.csv peers.csv remote_logs results.csv.gs > results.srs.gs search.log

 SRS can be seen in the dispatch folder on the Search Head
 csv extension from results is replaced with srs

Search Results Serialization
New Commands

© 2018 SPLUNK INC.

$ splunkd toCsv results.srs.gz $ splunkd toSrs results.csv.gz

 SRS is not readily parsable
 New commands to convert between the two result types
 Useful for scripts which did post search processing on CSV results

Search Results Serialization
Enabled by Default

© 2018 SPLUNK INC.

$ vim etc/system/local/limits.conf
~ [search] ~ results_serial_format=srs

 SRS is enabled by default in Splunk 7.2
 Togglable through limits.conf file
 Both Indexer and Search Head need to be enabled · Graceful fallback to
csv otherwise

Search Results Serialization
Benchmarks

© 2018 SPLUNK INC.

 Basic |stats sum search over 1 million events
 8 seconds to complete on Splunk 7.2 with SRS disabled

Search Results Serialization
Benchmarks

© 2018 SPLUNK INC.

 SRS cuts this same search down to 4 seconds
 Over a 50% reduction in search time

Search Results Serialization
Benchmarks

© 2018 SPLUNK INC.

 Same search as before but this time with 10 million events
 Nearing a minute to complete with SRS disabled

Search Results Serialization
Benchmarks

© 2018 SPLUNK INC.

 17 seconds...
 :)  :0  :p

Search Results Serialization
Performance Summary
 Average 10% reduction in search times across the board · I think marketing is being modest, 50% seems readily achievable
 Huge performance benefits on searches with high cardinality · | stats · | tstats
 Performance will grow along with the size of your dataset

© 2018 SPLUNK INC.

Improvement #2
Compression

© 2018 SPLUNK INC.

Client

Search

Search Head

Lispy

JSON

Indexer

Buckets

TSIDX

Journal

Results

Forwarder

Logs

Compression in Splunk
Gzip From the Beginning
 Splunk compresses raw event data on disk within the Journal
 Gzip has always been the default · First introduced in 1992
 L4Z compression option was added in Splunk 6.3 · Increases compression rates by 6x · Increases decompression rates by 9x · Comes at the cost of 30% larger files · This tended to nullify any performance benefit

© 2018 SPLUNK INC.

Zstandard Compression
New Compression Option
 Announcing Zstandard compression support for Splunk 7.2 · Developed by Facebook in 2015
 Average 5% space savings over Gzip
 Compression rate 4x improvement over Gzip
 Decompression rate 3x improvement over Gzip

© 2018 SPLUNK INC.

Zstandard Compression
Let's Enable

© 2018 SPLUNK INC.

$ cd etc/apps/$app/local $ vim index.conf
~ [$index] ~ journalCompression=zst

 Disabled by default for initial release
 Can be enabled in index.conf
 Only changes the compression algorithm for newly created buckets

Zstandard Compression
See for Yourself

© 2018 SPLUNK INC.

$ cd $index/db/$bucket/rawdata
$ ls -l journal.gz > journal.zst slicemin.dat slicesv2.dat

 New journals can be seen in the buckets rawdata folder on the Indexer
 gz extension from journal is replaced with zst

Zstandard Compression
Journal Size

© 2018 SPLUNK INC.

$ cd $old_bucket/rawdata

$ ls -lh

journal.gz

217.6M

$ cd $new_bucket/rawdata

$ ls -lh

journal.zst

210.9M

 Using our data set of 10 million events from earlier
 Spanning 3 buckets the total journal size dropped by 3%

Zstandard Compression
By the Numbers

© 2018 SPLUNK INC.

PLACEHOLDER FOR PERFORMANCE NUMBERS ONCE ORANGESWIRL FINAL IS READY

 Search times reduced by XX%
 Search times reduced by XX%

Improvement #3
Eval

© 2018 SPLUNK INC.

Client

Search

Search Head

Lispy

JSON

Indexer

Buckets

TSIDX

Journal

Results

Forwarder

Logs

Enhanced Eval
New Engine
 New eval engine for Splunk 7.2
 New features for ingress evaluations
 Performance benefits for both search and ingress operations

© 2018 SPLUNK INC.

Enhanced Eval
New Ingress Capabilities

© 2018 SPLUNK INC.

$ vim transforms.conf
~ INGEST_EVAL =
<comma separated list of eval expressions>

 Save extracted fields as types other than strings · float, int, multival
 Can delete or replace existing fields
 Change the type of an existing field · "200 OK" > 200

Enhanced Eval
Landing in Splunk 7.2
 Typically memory allocation is incredibly quick · However over millions events this can actually become a bottleneck
 Memory management improvements to eval engine · Reduced the need to copy results from one process to another
 Performance boosts will grow as the size of the data set increases · | search len(_raw) > 1000

© 2018 SPLUNK INC.

Eval Enhancements
By the Numbers

© 2018 SPLUNK INC.

PLACEHOLDER FOR PERFORMANCE NUMBERS ONCE ORANGESWIRL FINAL IS READY

 X% reduction in memory consumption
 X% drop in CPU utilization

Improvement #4
Metric Store

© 2018 SPLUNK INC.

Client

Search

Search Head

Lispy

JSON

Indexer

Buckets

TSIDX

Journal

Results

Forwarder

Logs

Metric Store
Historical Overview
 First shipped in Splunk 7.0 as a new storage type

© 2018 SPLUNK INC.

 Leverages structured data to improve search performance · Nearly a 200x improvement over Splunk 6.6 in certain instances

 Comes at the cost of a more restrictive query interface via |mstats command

Extra Credit
Less Shameless Plug
 Great .conf talk on Metric Store from earlier in the week
 FN1096 - Metric Indexes: Architecture and Usage · Video and PowerPoints will be online shortly at conf.splunk.com

© 2018 SPLUNK INC.

Why Metrics
Splunk Seemed Pretty Good Already
 TSIDX comes in two forms · "Classic" edition for basic |search queries · MSIDX for |mstats commands
 TSIDX only supported strings
 MSIDX addressed this with support for 64-bit floats

© 2018 SPLUNK INC.

MSIDX V2
Shipped in Splunk 7.1
 Splunk 7.0 shipped with MSIDX V1 · Implemented with minor modifications to existing TSIDX logic
 MSIDX V2 introduced in Splunk 7.1 · Major reworking of the data structure

© 2018 SPLUNK INC.

MSIDX V2
Metrics Example

metric_name temperature temperature temperature temperature temperature temperature temperature temperature temperature

_value _time 60.2 100 68.8 200 67.3 300 70.1 100 69.3 200 97.0 300 59.7 100 58.8 200 62.4 300

city orlando orlando orlando miami miami miami jacksonville jacksonville Jacksonville

© 2018 SPLUNK INC.
 Required Dimension · metric_name=<str>
 Measurement · _value=<float>
 Timestamp · _time=<int>
 Optional Dimensions · <key>=<str>

Binary Search

Lexicon city:jacksonville city:miami city:orlando

ID Time Series V1

8

100 / 59.7

1

100 / 60.2

5

100 / 70.1

9

200 / 58.8

2

200 / 68.8

3

300 / 67.3

...

© 2018 SPLUNK INC.

MSIDX V2

Previous Challenges

Postings V1

 |mstats WHERE city=orlando

789 ...

456 ...

 Data points from all time series are

1 2 3 X ...X X X X sXtorXedXin Xa sXingXle XsorXtedXarXrayX X X X

· Related data point is not collocated on
disk increasing I/O

 Requires single posting entry for each data point in the system
· Leads to exploding TSIDX file size · 1 billion events = 1 billions postings

Lexicon

Postings V2

city:jacksonville 3

city:miami

2

city:orlando

1

MSIDX V2
Improvements

© 2018 SPLUNK INC.

 For V2 a single posting now points to entire time series store

 Cuts the number of postings by a few order of magnitudes

Binary Search

ID

Time Series V2

1 100 / 60.2 200 / 68.8 300 / 67.3 ...

2 100 / 70.1 200 / 69.3 300 / 97.0 ...

3 100 / 59.7 200 / 58.8 300 / 62.4 ...

 Reduces IO by moving time series data points closer together on disk
 Allows for better compression techniques

MSIDX V2
Let's Enable
$ vim etc/system/local/indexes.conf ~ [my_metric_index] ~ datatype = metric

© 2018 SPLUNK INC.
 Enabled by default for Splunk 7.1 onwards
 Newly ingested metrics will automatically be stored as V2 · Existing metrics will be
need to be re-ingested to move to V2
 Splunk supports searching both V1 and V2 data in the same query

MSIDX V2
By the Numbers
PLACEHOLDER FOR PERFORMANCE NUMBERS ONCE ORANGESWIRL FINAL IS READY

© 2018 SPLUNK INC.
 Aims to improve Metric performance by 10x over MSIDX V1
 X% improvement over Splunk 6.6
 X% improvement over Splunk 7.0

We've Been Busy
Since .conf2016

© 2018 SPLUNK INC.

PLACEHOLDER FOR PERFORMANCE NUMBERS ONCE ORANGESWIRL FINAL IS READY (DAVID MARQUARDT WILL HAVE THIS)

 Going back to our internal test suite
 +XX% search improvement cross the board in the last 2 years

I'm Just the Messenger
The Real Heroes
Ian Link Vishal Patel
Justin Lin Manu Jose Nick Romito Karthik Sabhanatarajan Mitch Blank David Marquardt

© 2018 SPLUNK INC.

Enough PowerPoint! Let's see these in action.

© 2018 SPLUNK INC.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Q&A
Kellen Green | Senior Software Engineer

