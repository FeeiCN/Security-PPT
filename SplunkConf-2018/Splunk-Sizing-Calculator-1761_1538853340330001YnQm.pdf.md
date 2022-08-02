© 2018 SPLUNK INC.
Simplified Sizing : Introducing New Splunk Sizing Calculator
Jeff Champagne ­ Principal Architect Mustafa Ahamed ­ Principal Architect
October 2018 | Version 1.0

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Is This Session For Me?
What will I learn?

© 2018 SPLUNK INC.

 Are you a Splunk Admin or Architect?  Have you wondered if you can get more out of your existing hardware?  Do you want to learn more about how Splunk does Benchmarking?

 Introductions

Agenda

 Primer on Sizing & Benchmarking

 Splunk Enterprise Sizing Calculator

 ES Sizing calculator

 Next Steps

 Q&A

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Jeff Champagne
Principal Architect, Core Platform
· Member of Global Field Architecture team · Leads Voice of the Customer program · Member of the Splunk Architecture Council · Background in enterprise architecture & financial
services/trading systems · Former customer, joined Splunk in 2014

© 2018 SPLUNK INC.
New York City

Mustafa Ahamed
Director, Platform Architecture
· Member of Global Field Architecture team
· Focused on APAC
· Led Splunk Enterprise Product Mgmt for 6 years · Launched features like SH/Index Clustering and
Pipeline Parallelization · Joined Splunk in 2011

© 2018 SPLUNK INC.
Chennai

© 2018 SPLUNK INC.
Benchmarks & Sizing
Making Sense of the Madness

Customer

Introduction to Sizing
Finding the right hardware fit for your workload
We have X GB data to ingest... We have Y searches to run...
We want to offer the best performance to our users...

?

?

Splunk Search Head

Splunk Indexer

M

N

Splunk Search Head

Splunk Indexer

© 2018 SPLUNK INC.

The Science Behind Benchmark Testing

© 2018 SPLUNK INC.

Benchmark Test Suites

© 2018 SPLUNK INC.

Search Workload ­ Search Type
 Log · Syslog
 Search · Dense ­ CPU bound · Mixed ­ between dense and rare · Rare ­ IO bound
 Search Time Range (Based on Cloud Perf Benchmarks CloudFY19) · 15m ­ short search · 4h ­ moderate search · 24h ­ long search

© 2018 SPLUNK INC.

Search Workload ­ Volume
· Dense
- Dense searches (CPU bound) show a linear relationship with volume
· Rare
- Rare searches (IO bound) show 2 kinds of linear relationship with volume - Memory can cache volume, low IOPS, memory not enough to cache volume, IOPS grows fast
· Mixed
- mixed_search_time = dense_search_time * dense_ratio + rare_search_time * rare_ratio

Dense
Search time

Rare
Search time

© 2018 SPLUNK INC.

Volume ­ GB/indexer/day
Test env: aws i3.4xlarge env

Volume ­ GB/indexer/day
Test env: aws i3.4xlarge env

Search Workload - Concurrency

© 2018 SPLUNK INC.

· Concurrency(Search concurrency) vs. CPU core
- Stable stage. Search concurrency less than CPU core number. - Pressure stage. Search concurrency between CPU core number and max search concurrency of Splunk. - Max stage. Search concurrency above max search concurrency of Splunk.

Test result of aws i3.4xlarge 1 search head, 3 indexers as a culster Dense workload

Search Workload - Parallelization
· Parallelization(the option in Splunk conf file) vs. CPU core
- Parallelization < Available CPU core. Acceleration is obvious and diminishing. - Parallelization >= Available CPU core. Acceleration is not obvious.

© 2018 SPLUNK INC.

· Test result of aws i3.4xlarge env · DMA max concurrent test

· Test result of aws i3.4xlarge env · Batch search max pipeline test

Indexing Workload

© 2018 SPLUNK INC.

· Basic (result is from benchmark test in aws m5.xlarge env)
- CPU utilization has a linear correlation with event volume, more events more CPU usage. - 500G/indexer/day will lead to around 1 additional CPU core.
· Parallelization (result is from benchmark test in aws m5.xlarge env)
- Adding 1 more parallel ingestion pipeline will increase the max indexing rate increases around 1.53 times, lead to around 3-4 additional CPU cores and about 200-300 IOPS utilization.

Cluster Workload

© 2018 SPLUNK INC.

· Indexer cluster workload(Test different search/replication factor
- Disk IO write Ops and network throughput nearly doubled when double the search/replication factor. - Search time is almost the same when double the search/replicate factor.
· Search head cluster workload(Run max capacity searches on each search head in a cluster)
- Almost the same trend with single search head. - The max concurrency of search is sum(max_search_each_sh).

· Test result of aws m5x.large env · 3 search heads as a search head cluster · 6 indexers as a indexer cluster · Mixed workload

Sizing Model Introduction

© 2018 SPLUNK INC.

Demo
Core Sizing Calculator

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
ES Sizing Calculator

ES Sizing Challenges
 How much data can we ingest per indexer?  How much data can we accelerate per indexer?
· Some Data Models perform better than others · DM complexity · Cardinality of dataset
 How many searches can we run concurrently?

GB Accelerated

Network Data Model Acceleration

1000

800

600

400

200

0 3

5

10

20

Parallel Summaries

© 2018 SPLUNK INC.

Demo
ES Sizing Calculator

© 2018 SPLUNK INC.

What's Next?
How do I get my hands on this thing?
 Live Demos @ the Customer Success Studio · Source=*Pavilion
 Your account teams have access to this tool now  Public launch coming later this year
· Individual tools at first · Combined Core + ES + ITSI calculator coming in 2019

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Don't forget to rate this session in the .conf18 mobile app

