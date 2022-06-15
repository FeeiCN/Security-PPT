Splunk Performance
Observations and Recommendations
Simeon Yep | AVP GSA Brian Wooden | Directory GSA Partner Integrations
October 2018 | Version 3.0

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Agenda
 Performance Overview · Race Car Analogy · Observation Sources
 Indexing · Overview · Tests · Interpretations
 Searching · Search Type Review · With and Without Indexing Load · Analysis

© 2018 SPLUNK INC.

Splunk is a racecar
 New vs Used  Courses vary
· So do search and alerting use cases · Straight line fast isn't always the goal  We can tune the car for the course (data set)  We can tune the car for the driver (searcher)

© 2018 SPLUNK INC.

Observation Sources
Pros & Cons for Test Tracks vs Road Courses

© 2018 SPLUNK INC.

 Lab Testing Caveats · Pros · Dedicated & Isolated Equipment · Arbitrary Data Sets · Known configurations · Repeatability · Cons · Arbitrary Data Sets

 Real World · Pros · Improved data mix · IRL · Cons · Prescribed configurations may stray · Reduced automation may introduce
gremlins

General Testing Methodology

© 2018 SPLUNK INC.

 Understand data flows
· Splunk operations pipelines  Instrument
· Capture metrics for relevant operations  Run tests  Draw conclusions
· Chart and table metrics, looks for emerging patterns  Make recommendations

data
Ingest (Indexing)
Splunk >
Consume (Search)

Lab Setup
Using Eventgen in Stand Alone mode

© 2018 SPLUNK INC.

Index Cluster

Smart Store

Eventgen
1. Generate a large dataset with high cardinality
2. Forward to indexers as fast as possible
3. Measure

Forwarders Search Head

© 2018 SPLUNK INC.
Indexing
Pipelines, queues, and tests

Pipelining

© 2018 SPLUNK INC.

LINE_BREAKER TRUNCATE

SHOULD_LINEMERGE BREAK_ONLY_BEFORE MUST_BREAK_AFTER TIME_*
9

TRANSFORMS-xxx SEDCMD ANNOTATE_PUNCT

Event Breaking
Timestamp Extraction
Typing

Index-time processing

© 2018 SPLUNK INC.

LINE_BREAKER <where to break the stream> SHOULD_LINEMERGE <enable/disable merging>
MAX_TIMESTAMP_LOOKAHEAD <# chars in to look for ts> TIME_PREFIX <pattern before ts> TIME_FORMAT <strptime format string to extract ts>
ANNOTATE_PUNCT <enable/disable punct:: extraction>

10

"We are our choices"
-Jean-Paul Sartre

© 2018 SPLUNK INC.

 All pre-indexing pipelines are expensive at default settings.
· Price of flexibility  If you're looking for
performance, minimize generality

Flexibility

Performance
Time (s)

· LINE_BREAKER · SHOULD_LINEMERGE · MAX_TIMESTAMP_LOOKAHEAD · TIME_PREFIX · TIME_FORMAT

Indexing: CPU and IO

© 2018 SPLUNK INC.

12

Indexing Test Findings

© 2018 SPLUNK INC.

 CPU Utilization
· ~17.6% in this case, 4-5 Real CPU Cores  IO Utilization
· Characterized by both reads and writes but not as demanding as search. Note the splunk-
optimize process.
 Ingestion Rate
· 30MB/s
· "Speed of Light" ­ no search load present on the server

13

Index Pipeline Parallelization

© 2018 SPLUNK INC.

 Splunk 6.3+ introduced multiple independent pipelines sets
· i.e. same as if each set was running on its own indexer  If machine is under-utilized (CPU and I/O), you can configure the indexer to
run 2 such sets.  Achieve roughly double the indexing throughput capacity.  Try not to set over 2  Be mindful of associated resource consumption

14

Indexing Test Conclusions

© 2018 SPLUNK INC.

 Distribute as much as you can
· Splunk scales horizontally
· Enable more pipelines but be aware of compute tradeoff  Tune event breaking and timestamping attributes in props.conf whenever
possible  Faster disk (ex. SSDs) will not generally improve indexing throughput by
meaningful amount  Faster (not more) CPUs would have improved indexing throughput
· multiple pipelines would need more CPUs  Smart Store behaves relatively the same for INDEXING
· We'll see graphs and charts to back this up later, Yay!!

15

© 2018 SPLUNK INC.
Search
Types & Tests

Search Types

 Dense

· Characterized predominantly by returning many events per bucket

·

index=web | stats count by clientip

 Sparse

· Characterized predominantly by returning some events per bucket

·

index=web some_term | stats count by clientip

 Rare

· Characterized predominantly by returning only a few events per index

·

index=web url=onedomain* | stats count by clientip

17

© 2018 SPLUNK INC.

Search pipeline boundedness

© 2018 SPLUNK INC.

Some preparatory steps here

Find buckets based on search
timerange

For each bucket check tsidx for
events that match LISPY and find rawdata
offset

For each bucket read journal.gz
at offsets supplied by previous step

Process events: st rename,
extract, report, kv, alias, eval,
lookup, subsecond

Repeat until search complete

Filter events to match the search
string (+ eventtyping
tagging)

Write temporary results to dispatch directory

IO

CPU + Memory

Return progress

to SH splunkd

18

S2

© 2018 SPLUNK INC.

Searching
CPU or IO?
 Real-life search workloads are complex and varied · Difficult to encapsulate every
organization's needs into one neat profile
 We can still generate arbitrary workloads covering a wide range of resource utilization and profile them · Actual profile will fall somewhere in
between.

IO CPU IO CPU IO

Splunko

© 2018 SPLUNK INC.

Okay, let's test some searches
 Use our already indexed data · It contains many unique terms with predictable term density
 Search under several term densities and concurrencies · Term density: 1/100, 1/1M, 1/100M · Search Concurrency: 4 ­ 60 · Searches: · Rare: over all 1TB dataset · Dense: over a preselected time range
 Repeat all of the above while under an indexing workload  Measure
21

© 2018 SPLUNK INC.

CPU Utilization (%)

Dense Searches

© 2018 SPLUNK INC.
Hitting 100% CPU at
core#=concurren cy

IO Wait (%)

22

CPU Utilization (%)

Indexing with Dense Searches

© 2018 SPLUNK INC.

Indexing Throughput (KB/s)

Hitting 100% earlier

Indexing Only

Search Duration (s)

23

Dense Searches Summary

© 2018 SPLUNK INC.

 Dense workloads are CPU bound  Dense workload completion times and indexing throughput both negatively
affected while running simultaneously  Faster disk wont necessarily help as much here
· Majority of time in dense searches is spent in CPU decompressing rawdata + other SPL
processing
 Faster and more CPUs would have improved overall performance

24

Mixed Load Searching & Indexing
Smart Storage top, Traditional Storage, bottom

© 2018 SPLUNK INC.

CPU Utilization (%) Reads/s (from sar) IO Wait (%)

Rare Searches
26

© 2018 SPLUNK INC.

CPU Utilization (%)

Indexing with Rare Searches

© 2018 SPLUNK INC.

Reads/s (from sar) IO Wait (%)
27

Indexing & Searching Rare
Indexing Throughput (KB/s)

© 2018 SPLUNK INC.
Indexing Only

Search Duration (s)

Search Duration (s)
28

Rare Searches
Smart Store (left) vs Traditional Storage (right)

© 2018 SPLUNK INC.

Rare Searches Summary

© 2018 SPLUNK INC.

 Rare workloads (investigative, ad-hoc) are IO bound  Rare workload completion times and indexing throughput both negatively affected
while running simultaneously  1/100M searches have a lesser impact on IO than 1/1M.  When indexing is on, in 1/1M case search duration increases substantially more
vs. 1/100M. Search and indexing are both contenting for IO.  In case of 1/100M, bloomfilters help improve search performance
· Bloomfilters are special data structures that indicate with 100% certainty that a term does not
exist in a bucket (indicating to the search process to skip that bucket).
 Faster disks would have definitely helped here  More CPUs would not have improved performance by much

30

Is my search CPU or IO bound?

© 2018 SPLUNK INC.

 Guideline in absence of full instrumentation
 command.search.rawdata ~ CPU Bound
· Also: .kv, .typer, .calcfields,  command.search.index
~ IO Bound
31

 Indexing

Top Takeaways

· Distribute ­ Splunk scales horizontally

· Tune event breaking and timestamp extraction

· Faster CPUs will help with indexing performance
 Searching

· Distribute ­ Splunk scales horizontally

· Dense Search Workloads

· CPU Bound, better with indexing than rare workloads · Faster and more CPUs will help

Use case

· Rare Search Workloads

· IO Bound, not that great with indexing · Bloomfilters help significantly

Trending, reporting over long term etc.

· Faster disks will help
 Performance
· Avoid generality, optimize for expected case and add hardware
whenever you can

Ad-hoc analysis, investigative type

32

© 2018 SPLUNK INC.
CPU
Term Density
IO What Helps?
More distribution Faster, more CPUs
More distribution Faster Disks, SSDs

© 2018 SPLUNK INC.
Q&A
Simeon Yep | AVP GSA Brian Wooden | Partner Integrations

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

