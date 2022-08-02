© 2018 SPLUNK INC.
HEC Yeah!! How Priceline Uses HEC to Ingest 4TB of Data Every Day?
Jagadeesh Motamarri | Senior Software Engineer Mukund N Murthy | Software Engineer priceline
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

About us

©© 22001188 SSPPLLUUNNKK IINNCC..

v

JAGADEESH MOTAMARRI
Sr. Software Engineer, priceline

MUKUND N MURTHY
Software Engineer, priceline

About Priceline
priceline is part of Booking Holdings, the world leader in online travel & related services.
priceline offers more ways to save and more deals than anyone else in travel.

© 2018 SPLUNK INC.

How we got here...
The problem we set out to solve
 We had a collection of bespoke monitoring systems, evolved over 18+ years; weren't investing enough to get the full value from them.
 Separate systems meant that we sometimes had difficulty seeing data across applications or application layers in the same context

© 2018 SPLUNK INC.

Legacy Architecture

© 2018 SPLUNK INC.

Custom Dashboards

Application Servers

Custom Alerting System Kibana Dashboards

So, What the HEC?
Narrowing the field

© 2018 SPLUNK INC.

 Splunk is a fully features, powerful platform for collecting, searching, monitoring and analyzing machine data. · Rich ecosystem of 3rd party apps
Crowdstrike, F5 BIG-IP, Cisco, *nix, Windows, Palo Alto, Catchpoint, AWS, GCP
· Flexible data ingestion architecture
HTTP/REST (HEC), log scraping, dedicated apps

Stats
Beast mode ON

© 2018 SPLUNK INC.

125+ ~4.5TB 200+ 250K+

# of Applications

Daily Ingestion

Unique Sourcetypes

Queries per day

© 2018 SPLUNK INC.
HEC Yeah!!
The driving force

HEC Yeah!!
What is HEC?
 Token based API for collection of events  Send events directly from anywhere  Easy to Configure and works out of the box  Easy to Secure  Highly Performant ,scalable and available
Source: https://www.slideshare.net/Splunk/splunk-http-event-collector/2

© 2018 SPLUNK INC.

HEC Yeah
Set-up and Usage
 Enable HTTP Event Collector
 Create/Get a token
 Send events to Splunk using the token · Use HTTP Directly · Use logging libraries

© 2018 SPLUNK INC.

HEC Yeah
Distributed Deployment

© 2018 SPLUNK INC.

 Adopted Pattern # Traffic load balancer, no Heavy Forwarder, pool of indexers, using cluster master

Cluster Master

Priceline Data Collection Platform
Core Modules

Data Collection

Data Processing / Ingestion

© 2018 SPLUNK INC.

Dynamic Configuration

Management Console

Data Collection
Application Agent

Priceline Data Collection Platform
High Level Architecture

© 2018 SPLUNK INC.

Management Console

Splunk HEC

Application Agent

Data Processor Streamgest Cluster

© 2018 SPLUNK INC.
Management Console
Config System for managing meta-data

Management Console
Priceline's home grown application

© 2018 SPLUNK INC.

Management Console
Priceline's home grown application

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Data Collection
Embedded JVM Agent and REST

Data Collection ­ Embedded JVM Agent

© 2018 SPLUNK INC.

Data Collection

Each JVM

Config Reader

Event Listener

Applications
Embedded Agent
Asynchronous Message Dispatcher
Message Router

Management Console
 Dispatches asynchronously  Non blocking data collection  Data dependent routing to
different kafka partitions  Handles back pressure

© 2018 SPLUNK INC.
Data Processor
Streaming + Ingestion = Streamgest

Data Processor
Streamgest ­ Priceline's home grown application
Management Console

Streamgest Cluster

Single Streamgest Node

Consumers

Plugins

Event Batches

HTTP Handlers

 Message Consumers
· Read messages from Kafka topics
· Assign metadata from the Config Management
System
· Parse, munge and route events through the
processing pipeline

© 2018 SPLUNK INC.

Data Processor
Streamgest ­ Priceline's home grown application
Management Console

Streamgest Cluster

Single Streamgest Node

Consumers

Plugins

Event Batches

HTTP Handlers

 Plugins
· Auxiliary modules to necessitate pre-ingestion
processing and enrichment of data
· Data Type formatters viz. PSV ,statsD
converters
· Data Anonymization for PCI/PII filtering

© 2018 SPLUNK INC.

Data Processor
Streamgest ­ Priceline's home grown application
Management Console

Streamgest Cluster

Single Streamgest Node

Consumers

Plugins

Event Batches

HTTP Handlers

 Event Batches
· Several Event Batches hold the data and send
them to HTTP Handlers
· Parallelization provide improved performance

© 2018 SPLUNK INC.

Data Processor
Streamgest ­ Priceline's home grown application
Management Console

Streamgest Cluster

Single Streamgest Node

Consumers

Plugins

Event Batches HTTP Handlers

 Async HTTP Handlers
· Handlers flush data to Splunk via HEC · Handles all HEC errors · Remediate (where appropriate) and reprocess
events
· Prevents loss of data

© 2018 SPLUNK INC.

Data Processor (Monitoring)
Streamgest ­ Priceline's home grown application

© 2018 SPLUNK INC.

Data Processor (Alerts)
Streamgest ­ Priceline's home grown application

© 2018 SPLUNK INC.

HEC Tuning

© 2018 SPLUNK INC.

Key Takeaways
Lessons Learned

Do. Defaults are good, but customization may be better. [limits.conf]
Example: `max_content_length` has been modified to suit our bandwidth requirement.

Client-side Tuning

© 2018 SPLUNK INC.

Key Takeaways
Lessons Learned

Do. Send events in batches to maximize HEC performance

Client-side Tuning

© 2018 SPLUNK INC.

Key Takeaways
Lessons Learned

Do. Keep-Alive allows HTTP clients to reuse the same connection for multiple batches.

© 2018 SPLUNK INC.

Key Takeaways
Lessons Learned

Send data over HTTPS only when required. More performance while sending data over HTTP.

Handling Errors

© 2018 SPLUNK INC.

Key Takeaways
Lessons Learned

Do. HEC errors should be handled gracefully and iteratively to prevent loss of data.

© 2018 SPLUNK INC.
Q&A
Jagadeesh Motamarri | Senior Software Engineer Mukund Narayana Murthy | Software Engineer priceline

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

