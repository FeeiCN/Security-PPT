© 2018 SPLUNK INC.
Splunking the Transaction Waterfall
Scott Garcia | Principal Architect - Enterprise Solution Delivery, T-Mobile Andrew Koo | Manager ­ Enterprise Solution Delivery, T-Mobile Gary Burgett | Staff Sales Engineer, Splunk
October 1-4 2018 | Orlando, FL

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
Introduction

Agenda
 T-Mobile Splunk @ a Glance · Splunk Evolution · Fun Facts and Environment
 Journey to Splunk Unlimited · IT Transformation
 Waterfall Use Case Walk-Through  Data Maturity  Utilizing the Data
· Searching and Visualizing the Data

© 2018 SPLUNK INC.

T-Mobile @ a Glance
 1 million+ net customer adds ­ 19 quarters in a row
 10s of thousands of employees  100s of business and
engineering applications  Splunk customer for 7 years,
strategic partner for 5 years  100s of teams using Splunk

© 2018 SPLUNK INC.

Evolution of Splunk @ T-Mobile

© 2018 SPLUNK INC.

GEN 1: Initial
· 2 TB license
· Siloed Search
Heads

GEN 2: Growth
· 5.5 TB license · Increased adoption · Larger, more complex
use cases: CDR, Retail

GEN 3: Commoditize Data
· 11.5 TB license · Bare-metal right-sizing · Geo redundancy added · Mediation gen 1 + 2 · Scaling of syslog · More structured self-
serve at scale
· Broad and deep
adoption
· Beginning of tiered
environments (HW)

GEN 4: Advanced Self-Serve
· `Unlimited' license · User Engagement · Advanced Self-Serve · Launch new analytics
capabilities (Viz & ML)
· Streamlined HW provisioning
& tiered options
· Improved Availability &
Performance
· Workflow Automation · Show-back Reporting

Fun Facts & Environments

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Journey to Splunk Unlimited

© 2018 SPLUNK INC.
IT Transformation
 3 years ago · Utilized an In-house logging application - Organization couldn't take full advantage of the data - Solutions were developed with a narrow focus - Was not scalable and therefore unsustainable
· Investment front loaded on the network at the expense of IT - Disparity in investment can lead to a delay in maturity
· IT Transformation - A multi-year phased introduction of a new Enterprise IT solution - Consolidation of 100's of applications through new development
and technology

© 2018 SPLUNK INC.
Transition to Splunk Unlimited
 Next Gen Centralized Logging and Monitoring
· Value proposition and timing · Evaluation of solutions
Splunk named an enterprise solution
 With success came challenges
· Support of an enterprise solution vs. a targeted solution · Splunk knowledge transfer for general use and dashboard development. · Infrastructure expansion was needed to support the trend of increasing usage · The acceleration of Splunk adoption places pressure on license capacity
Transitioned to an unlimited licensing model ­ 12/31/17

IT Transformation

© 2018 SPLUNK INC.

To Splunk

1

API Proxies

2 Enterprise Middleware
2

API Gateway
3 To Splunk

4 Enterprise Billing
2

© 2018 SPLUNK INC.
Waterfall Use Case
End to End Transactional Flows

Dashboard
Top Level Performance and Availability Dashboard

01 BUC 1 02 BUC 2 06 BUC 6 08 BUC 8 09 BUC 9 13 BUC 13 15 BUC 15 16 BUC 16 17 BUC 17 18 BUC 18

API Proxy

API Gateway

Middleware

Drilldown
Billing

API Proxy

API Gateway

Middleware

Billing

API Proxy

API Gateway

Middleware

Billing

Event 1 Event 2 Event 3 Event 2

© 2018 SPLUNK INC.

Dashboard
1st Level Drilldown ­ Billing Success Rate

App 1 App 1 App 1 App 1 App 1 App 1 App 1 App 1

Queue 1 Queue 1 Queue 1 Queue 1 Queue 1 Queue 1 Queue 1 Queue 1

Drilldown

© 2018 SPLUNK INC.

Dashboard
2nd Level Drilldown ­ Activity Timeout

© 2018 SPLUNK INC.

Activity Timeout Activity Timeout Activity Timeout Activity Timeout Activity Timeout

Drilldown

Dashboard
3rd Level Drilldown ­ Waterfall Dashboard
Interaction 5

© 2018 SPLUNK INC.

Activity Timeout

© 2018 SPLUNK INC.
Waterfall | Value Observed
 Tier 1 and service desk organizations with little knowledge of application processing can easily reference a transactional flow.
 Tier's 2 & 3 are provided with the ability to visually analyze the sequence and contents of events
 The waterfall view is reusable allowing for its integration within many dashboards across T-Mobile's monitoring solutions
 Interactions between Interfaced applications can be observed  Performance and validation teams are capturing performance related
metrics  Both production and non production teams have access to the waterfall
view

© 2018 SPLUNK INC.
Data Maturity

Data Maturity
Logging best practices necessary to obtain transactional flows

© 2018 SPLUNK INC.

Data Content Standards
 Cross-platform transaction IDs  Field naming conventions  Distribute ownership

Log/Event Structural Standards
 Transport (input) method standards  Drive data providers to preferred input
methods  Handling complex payloads w/ Complex
Event Processing (CEP)

© 2018 SPLUNK INC.
Utilizing the Data

Searching the Data
Now that we have the data, what can we do with it

© 2018 SPLUNK INC.

Different Platforms, Different formats
 Multiple middleware technologies where instrumentation takes place, each with their own format · XML · JSON · Raw text/KV pairs
 Schema-on-the-fly saves the day
 If the information is there, we can normalize it

Rich fields for filtering/grouping
 Sessions  Activities  Interactions  Applications  Channels  Customers  Operations  Latencies  Return Codes  Error Messages

Searching the Data
Now that we have the data, what can we do with it

© 2018 SPLUNK INC.

Consistent Fields = Simple Searches
index=transactions (sourcetype=mw OR sourcetype=core_gw OR sourcetype=core_proxy ) cust_id=$cust_id$

*Not so simple in practice*
Myriad Use Cases
 Support can filter on a particular Customer ID to troubleshoot individual user issues
 Latency and Error Rates can be measured and baselined by Operation, Environment, Channel, etc.
 See individual transactions end-to-end

Visualizing the Data
How do I visualize transaction durations in Splunk?
Options for nonstandard viz  Splunkbase  Custom Visualization Framework  Extend Current Visualizations with
JS Extensions
Settled on Extension of Table View  Simple, minimal code  Leverage existing functionality  Data Density

© 2018 SPLUNK INC.

Visualizing the Data
How do I visualize transaction durations in Splunk?
Searching to build the Waterfall
 eval and rex · Your best friends for data manipulation
 eventstats · Perform aggregate stats while
maintaining the original data
 appendpipe · Perform aggregate stats and append
them to the table

© 2018 SPLUNK INC.

Bring it together
index=soa (sourcetype=api_gateway OR sourcetype=messaging_gateway OR sourcetype=backend_gateway) transaction_id=e3q29ir1u29zoi | eventstats first(_time) AS first last(_time) AS last | eval duration=first-last | eval buffer=100*(_time-last)/duration | eval diff=100*latency/(1000*duration) | reverse | eval Waterfall=tostring(buffer)+","+tostring(diff) | eval spent=latency+" ms" | appendpipe
[stats max(eval("total," +tostring(duration))) AS Waterfall max(eval(tostring(duration*1000)+" ms")) AS spent
| eval buffer=tonumber(-1)] | appendpipe
[stats min(eval("markers,"+tostring(duration))) AS Waterfall | eval buffer=tonumber(101)] | sort buffer | fields - buffer, diff

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Key Takeaways
Good Logging Practices

1. Employ Good Logging Practices
2. Related Splunk .conf2018 Sessions
· IT1256 - Zipkin & Splunk: Tracing Transactions Across Your Ecosystem
Tuesday, Oct 02, 4:45 p.m. - 5:30 p.m. Tom Martin, Staff Practitioner, Splunk
· IT1847 - Splunking Application Performance: Traditional APM and Beyond
Wednesday, Oct 03, 12:45 p.m. - 1:30 p.m. Gary Burgett, Staff Sales Engineer, Splunk

© 2018 SPLUNK INC.
Q&A
Scott Garcia Andrew Koo Gary Burgett

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

