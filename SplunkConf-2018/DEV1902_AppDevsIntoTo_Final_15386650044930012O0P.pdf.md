© 2018 SPLUNK INC.
App Dev's Introduction to SDC
Tristan Fletcher | Architect, IT Markets
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.

Tristan
tfletcher@splunk.com

 About
· Formerly: Manager, UI/Systems/QA Engineer · San Francisco, sometimes Santana Row · Worked at Splunk for 7 years · Surprise Villain at the Splunk Roll20
DnD Group

Goals

© 2018 SPLUNK INC.

Understand the difference in how apps
are deployed on SDC v Classic

Understand the motivation and general
design behind SDC

Know where to go for more information

© 2018 SPLUNK INC.

Agenda

1. Big Honkin' Overview 2. Core Services 3. Data Ingestion 4. Search Technology 5. Apps 6. Q&A

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Big Honkin' Overview
AKA WTF (is) SDC

What's different about developing
in SDC?

© 2018 SPLUNK INC.

WTF is SDC

© 2018 SPLUNK INC.

API

But Splunk Enterprise is API-driven...

© 2018 SPLUNK INC.

Perception
apps
API
splunkd
We want to get here

Reality
apps splunkd

 Developing apps in Splunk Enterprise is not a delightful experience

· Lacks significant functionality that apps are
forced to "re-invent" every time

API

· Too many implementation and deployment

details are exposed

(e.g. search head clustering)

· Many interactions outside of the API (e.g.
apps write to the file system, use of deployer, etc.)

· Very limiting authorization model

A Day in the Life of Data
Search Time Knowledge

© 2018 SPLUNK INC.

Raw Data

HEC2

S2S
FWD
Ingestion Endpoints

Stream Processing

Splunk Cloud Index

Direct API Access

State-Free Search

API Endpoints

The Users!

Splunk Developer Cloud

© 2018 SPLUNK INC.
Core Services
AKA the nuts and bolts

A Day in the Life of Data
Search Time Knowledge

© 2018 SPLUNK INC.

Raw Data

HEC2

S2S
FWD
Ingestion Endpoints

Stream Processing

Splunk Cloud Index

Direct API Access

State-Free Search

API Endpoints

The Users!

Splunk Cloud Platform

Cloud Authentication Workflow

© 2018 SPLUNK INC.

Identity Provider (OIDC)

4. Verify and get identity info

1. login (username/password or other OAuth 2.0 flow)

2. Id and access token

client

3. Operation Auth Bearer: access token
6. Operation results or error

IAC Service
Splunk Platform
5.. Cache information on success

Cloudifying Deployment Scaling

© 2018 SPLUNK INC.

 SHC, Search Peers

Developer Cloud
 State-Free Search

Cloudifying KV Store

© 2018 SPLUNK INC.

 KV Store · (collections.conf)

Developer Cloud
 KV Store · (Dataset in Catalog)

© 2018 SPLUNK INC.
Data Ingestion
AKA data, it's what apps crave

A Day in the Life of Data
Search Time Knowledge

© 2018 SPLUNK INC.

Raw Data

HEC2

S2S
FWD
Ingestion Endpoints

Stream Processing

Splunk Cloud Index

Direct API Access

State-Free Search

API Endpoints

The Users!

Splunk Cloud Platform

Cloudifying Index Transforms

© 2018 SPLUNK INC.

 Indexed Fields, Null Queue · (props/transforms/fields.conf)

Developer Cloud
 BLAM Pipelines · (Data Availability APIs)

Syslog Files
REST 3rd Party Connectors

Overview

© 2018 SPLUNK INC.

Forwarder

Ingestion API
3rd Party Kafka
3rd Party Kinesis 3rd Party EventHub

Streaming Engine

Indexer Topic 3rd Party Topic

Stream Processing ­ Why?

© 2018 SPLUNK INC.

 Complement Splunk's query-time data wrangling with ingest-time wrangling · Building metrics from events · Pre-extract and enrich to make common queries simpler · Advanced routing of events · Enforce data quality standards · "Really realtime" searches and metrics · Move expensive saved searches to ingest-time triggers

© 2018 SPLUNK INC.
Search Technology
AKA accessing data

A Day in the Life of Data
Search Time Knowledge

© 2018 SPLUNK INC.

Raw Data

HEC2

S2S
FWD
Ingestion Endpoints

Stream Processing

Splunk Cloud Index

Direct API Access

State-Free Search

API Endpoints

The Users!

Splunk Cloud Platform

Cloudifying Data Storage

© 2018 SPLUNK INC.

 Indexes, Collections, Saved Searches · (indexes/savedsearches/
collections.conf)

Developer Cloud
 Datasets in Catalog

Cloudifying Search Time Knowledge

© 2018 SPLUNK INC.

 Field Extractions, Aliases etc.
· (props/transforms.conf)

Developer Cloud
 Rules and Actions in Catalog

Cloudifying Search Time Knowledge

© 2018 SPLUNK INC.

Developer Cloud

[sourcetype::testlog] FIELDALIAS-user = uid as user EXTRACT-errors = dvc=\[w+\](?<err_id>[^:]+) EVAL-company = coalesce(company, "NA") LOOKUP-product_info = products ID AS pid OUTPUT Name AS product_name KV_MODE = auto

{

"id": #id#,

"name": #name#,

"module": #module#,

"match": "sourcetype::testlog",

"actions": [ ... ]

}

{...,

{ "id": #id#,

""kiiddn""d::":##i"idAd#L#,I,AS",

""fkkiiennldd""::""RELuAEVOiUGAOdTELK"OXU,K"PV,"",,

""apfemlaixoitepdatlresd"rs:ns"i":oucAn"soUdemT:vrpO"ca=p,n\ry[o"wd,+u\c]t(s?<IeDrrA_Sipd>i[d^O:U]T+P)U"T,

Name AS p}r]o"dofeuwixcneptelr_rden"sa:smie"",ou_nsrC"ea:rwt"ec,goarlyesacsep(rcodmupcatn_yc,\a"tNeAg\o"r)y",

}

}, ".o.w.ne]r": "user"

}

}, ... ]

}

Cloudifying Lookups

© 2018 SPLUNK INC.

 Lookup
· (transforms.conf,
collections.conf, csv)

Developer Cloud
 Datasets in Catalog · (Only KV Store based)

 SPL

Cloudifying SPL

© 2018 SPLUNK INC.

Developer Cloud
 SPLv2

index=main err* | head 100
| mstats latest(_value) AS cost WHERE index=metrics metric_name="cpu" BY host span=1s
index=main | stats count BY host

| from index:main | search err* | head limit=100
| from metric:metrics WHERE metric_name="cpu" GROUP BY host, span(_time, 1m) SELECT latest(_value) as cost, host
| from index:main GROUP BY host SELECT count(), host

Cloudifying App Namespaces

© 2018 SPLUNK INC.

 App Namespaces

Developer Cloud
 Modules

To learn more go to: Intro to SPLv2, the Module System and the Catalog Thu 1:30pm

No Clear Analog
 Search Scheduling  Eventtypes/Tags  EAI REST Interfaces  Modular Inputs

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Apps
AKA what you build!

Future of App Deployments

© 2018 SPLUNK INC.

SDC
Data Sources

App Client
App Client
App Client

AWS/Azure/ GCP/Private
Cloud
Hosted by SDC App Component Hosted by Amazon AWS/Other Where ever the data is...

© 2018 SPLUNK INC.
Splunk Insights for Web and Mobile Apps Architecture

SDC

Keystone Client

User

Keystone Ingress API

Config Database

Keystone Ingestion Service

MINT SDK
Hosted by SDC App Component Hosted by Amazon AWS/Other Where ever the data is...

Where To Go For More
 Dev Portal on SDC (SIGN UP!)  Other talks
· 12:45pm Splunk Developer Cloud Services and Features · 2:00pm Developer Tools for Splunk Developer Cloud · 3:15pm Partners Build Apps on Splunk Developer Cloud · 4:30pm Dashboards and Analysis UI Components for Developers · Thu 1:30pm Intro to SPLv2, the Module System and the Catalaog

© 2018 SPLUNK INC.

Thank You

© 2018 SPLUNK INC.

Q&A

© 2018 SPLUNK INC.

Cloudifying Custom Search Commands

© 2018 SPLUNK INC.

SDC
 Custom Commands · (code and commands.conf)

for now...

