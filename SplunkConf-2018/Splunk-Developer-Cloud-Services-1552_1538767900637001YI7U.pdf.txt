Splunk Developer Cloud Services & Features
Kris Harrison | Principal Product Manager Itay Neeman | Sr. Director of Engineering
SDCbeta@splunk.com
October 3, 2018 | v1

© 2018 SPLUNK INC.

Our Speakers

© 2018 SPLUNK INC.

v

Kris Harrison
Principal Product Manager

Itay Neeman
Sr. Director of Engineering

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Goals

© 2018 SPLUNK INC.

SDC Overview Services & Features

Demos!

© 2018 SPLUNK INC.
Splunk Developer Cloud Overview
What and Why?

Splunk Developer Cloud
 API-Driven  Scalable  Rapid iteration  Easy
 Developer Choice!!!

© 2018 SPLUNK INC.

Splunk Platform

App for Enterprise and Cloud
App / Add-on

SDKs

Splunk Web Framework

APIs

SplunkD

© 2018 SPLUNK INC.

External Hosting

App with Splunk Developer Cloud
App for SDC

SDKs

Splunk UI Frameworks

API Gateway

© 2018 SPLUNK INC.

... Search Ingest
...

Splunk Developer Cloud

Stateless Splunk Services

Storage

Splunk Developer Cloud
What's in there?
 Cloud-native development platform for machine-generated data · APIs · SDKs · Tools · UI Components & Frameworks · Developer Portal

© 2018 SPLUNK INC.

Familiar

Flexible

Fast

© 2018 SPLUNK INC.
SDC Services & Features

© 2018 SPLUNK INC.

Services & Features
With Demos!

1. Tenants, Identity, and Access 2. Data Ingest, Search, and Catalog 3. Apps!

Tenants
 Most basic container of resources  API calls specify a single tenant
 No cross-tenant access

© 2018 SPLUNK INC.

Principals

© 2018 SPLUNK INC.

 Actors making API calls
...targeting a specific tenant
 Users vs. Services
 Can be a member of many tenants; not a resource contained by a specific tenant

 Principals cannot access tenants they are not a member of

Identity Access Control
 Identity and Access Control (IAC) service manages · Tenants · Principals · Groups · Roles · Permissions
 Enables Authentication and Authorization

© 2018 SPLUNK INC.

Authenticating

© 2018 SPLUNK INC.

 Registration of accounts happens on splunk.com  SDC leverages splunk.com as an Identity Provider using the OIDC protocol  SDC never "sees" a user password; instead all services accept a token that is
validated against the splunk.com OpenID Connect Provider

user CRUD
login via OIDC/Oauth2.0 flow to obtain access token

splunk.com

client

send token along with operation as Auth Bearer

validate token
Platform

DEMO 1

© 2018 SPLUNK INC.

Data Ingest, Search, and Catalog
End-to-end flow
Search Time Knowledge

© 2018 SPLUNK INC.

HEC2

S2S

Raw Data

FWD
Ingestion

(events, metrics)

Endpoints

Stream Processing

Splunk Cloud Index

Direct API Access

State-Free Search

Search API
Endpoints

The Users!

Splunk Developer Cloud

© 2018 SPLUNK INC.

Data Ingest
Ingestion & Stream Processing

 Forwarders w/ S2S  HEC v2 API  Connectors
 First-class ingest-time stream processing engine · Fully parallelizable engine · Core: Filter, project, transform, group,
aggregate, join, sort, limit, window
· REST API-driven centralized configuration

Syslog Files

Forwarder

REST

HECv2
Other Connectors

Message stream bus

Indexing and Search

© 2018 SPLUNK INC.

 The stream processing engine feeds data into a Splunk indexer that produces buckets and uploads them to S3 · Using the S2 (Smart Store) technology
 A new Search Service enables insights with better scale and simplicity · SPLv2: a variation of SPL designed to be more consistent and extensible · Currently only a subset of SPL commands

© 2018 SPLUNK INC.
Catalog
"Source of truth"
 Central repository for metadata: indexes, search time extractions, lookups, etc.  Models metadata information around datasets
 Datasets act as an interface, defining a schema; core abstraction · Indexes, KV Store collections, alerts, etc. are implementations of the interface
 Rules are search-time operations (field extractions, knowledge objects, etc.) · Field extractions, aliases, etc. in props/transforms.conf
 Modules act as a namespace and execution context; contain datasets and rules · Config stanzas, user/app context, etc

© 2018 SPLUNK INC.
Just scratching the surface
DEV2043 Thursday at 1:30pm

DEMO 2

© 2018 SPLUNK INC.

Splunk Developer Cloud APIs
This is what we've covered so far

© 2018 SPLUNK INC.

Manage tenants & access

Receive data Process in-flight data Search data at rest

Data and Metadata Store generic KV

Definition

pairs

IAC

Ingest

Streaming

Search

API

API

API

API

Catalog API

KV Store API

Scalable Platform

Apps - Enterprise vs. SDC
A new paradigm

© 2018 SPLUNK INC.

 With Splunk Enterprise, apps are essentially hosted in the platform
· Ship tarball, provide executables
 With SDC, apps can run anywhere and be anything
 Developers can interact with any external services they like in any way it's useful for their app
 Developers are in control of how their app works and its characteristics not limited to specific extension points

App A (hosted on EC2)
App B (hosted on S3)
App C (lambda)

Dynamo
S3
Other AWS or external services

Splunk Developer Cloud

© 2018 SPLUNK INC.
App Services
Do more
 Enable developers to build richer app experiences that have greater reach · App Registry · Manage OIDC clients/apps with SDC · Machine Learning · Make predictions and generate insights via the power of ML · Action Service · Send outgoing webhooks
- Programmatically - via SPLv2
· More to come

DEMO 3

© 2018 SPLUNK INC.

 SDKs

App Enablement
Build faster and easier

 Tooling

 UI Components & Frameworks

 Developer Portal

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Key Takeaways
How's that for an overview?

1. Overview of Splunk Developer Cloud 2. SDC Services...in action 3. Application Enablement

Visit the DevZone!!!
More details about Splunk Developer Cloud in the source=*Pavillion

© 2018 SPLUNK INC.

Anatomy of an App built
with SDC

Developer Tooling

Splunk UI Framework &
Search Components

Dashboards &
Visualizations

Search Technology

© 2018 SPLUNK INC.
Six Great Sessions on Splunk Developer Cloud
If you're here in a session, just stay here!
 11:30am Building Apps for Splunk Developer Cloud DEV1902  12:45pm Splunk Developer Cloud Services and Features DEV1552  2:00pm Developer Tools for Splunk Developer Cloud DEV1841  3:15pm Partners Build Apps on Splunk Developer Cloud DEV1846  4:30pm Dashboards and Analysis UI Components for Developers DEV1703  Thu 1:30pm Intro to SPLv2, the Module System and the Catalog DEV2043
Sign up at splunk.com/sdc

Join the SDC Beta Program!
 Help test out the Splunk Developer Cloud!  We're looking for developers with:
· Experience in building cloud-hosted applications · Experience with building Splunk apps · Interest in building new solutions on our beta SDC
 Be among the first to try SDC! Apply to join the beta!
· splunk.com/sdc · splunk.com/projects

© 2018 SPLUNK INC.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Q&A
Kris Harrison | Principal Product Manager Itay Neeman | Sr. Director of Engineering

