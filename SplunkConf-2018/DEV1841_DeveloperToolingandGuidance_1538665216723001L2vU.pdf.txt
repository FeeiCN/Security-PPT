© 2 0©12801S8PSLPULNUKNKI NINCC..
Developer Tooling and Guidance for Splunk Developer Cloud
Tedd Hellmann | Senior Product Manager Tim Pavlik | Senior Software Engineer
devinfo@splunk.com

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Splunk Developer Cloud

© 2018 SPLUNK INC.

 New option for app developers · Separate offering from today's Splunk Cloud · Splunk Cloud will continue to be improved and maintained
 SDC is not a product that customers can purchase  SDC is:
· A set of services developers can use to build apps (ingest, search, machine learning, ...) · APIs, SDKs, and tools developers will use to build apps · A new developer portal with tutorials, documentation, and sample apps  Closed beta opening next week!

Splunk Developer Cloud
 What do we want out of SDC? · Separate execution of apps and Splunk services · Apps can run anywhere and are self-hosted · Design for scalability · Isolate workspaces · Easy to manage and extend · Service-oriented architecture: state-free, disposable, loosely-coupled services · Enforce all interactions via unified, consistent, well-defined APIs

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

App for Splunk Developer Cloud
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

New for Splunk Developer Cloud

© 2018 SPLUNK INC.

 SDKs: Go and JavaScript
 Frameworks: Dashboards, SplunkUI, Search Components
 Tools: Splunk SimData, SDC CLI, an application scaffolding tool, Splunk Data Stream Processor, Splunk Data Discovery
 Examples: multiple small code examples, one medium end-to-end app, one full app (Splunk Sample App for Cisco® ASA)
 Guidance: Splunk Developer Cloud portal with documentation, tutorials, reference material
 Apps: · Splunk Insights for Web and Mobile Apps (BETA) · Visit the Innovation Labs for more!

Example App
Tools working together

© 2018 SPLUNK INC.

Let's make an app! · Authenticate with the platform with the /identity service · Manage data in a dataset with the /catalog service · Ingest data with the /ingest service · Search data with the /search service

Authentication
How the platform verifies who you are
 Logging into the platform in-browser · Visit https://login.splunkbeta.com/

© 2018 SPLUNK INC.

Authentication
How the platform verifies who you are

© 2018 SPLUNK INC.

 Making requests to https://api.splunkbeta.com programatically · HTTPS traffic to the platform uses Authorization header to identify the User or App

User / App Credentials login.splunkbeta.com
JWT Access Token OR

Authorization: Bearer <JWT>

api.splunkbeta.com

Authentication
How the platform verifies who you are
 Register an App with the App Registry service · Allow users to login with https://login.splunkbeta.com/ and redirect to your site

© 2018 SPLUNK INC.

example.site.com
Login

login.splunkbeta.com
Username Jane Password *********
Submit

example.site.com
Welcome, Jane!

· Allow backend clients to authenticate as the App itself using a Client ID / Client Secret
api.splunkbeta.com

Identity Service
Validate your token against the platform

© 2018 SPLUNK INC.

> curl -X GET \ https://api.splunkbeta.com/$TENANT/identity/v1/validate \ -H "Authorization: Bearer $BEARER_TOKEN"
Response: {"name":"me@example.com"}
OR
{"message":"Error validating request","code":401}

Identity Service
Validate your token against the platform
const client = SplunkCloud({ tokenSource: TOKEN, tenant: TENANT }); client.identity.validate()
.then(info => {...}) .catch(err => {...});
client, err := service.NewClient(&service.Config{ Token: token, Tenant: tenant,
}) info, err = client.IdentityService.Validate()
Go SDK

© 2018 SPLUNK INC.
Js SDK

Identity Service
Add a member to a tenant

© 2018 SPLUNK INC.

> curl -X POST \ https://api.splunkbeta.com/$TENANT/identity/v1/members \ -H "Authorization: Bearer $BEARER_TOKEN" \ -H 'Content-Type: application/json' \ -d '{"name":"you@example.com"}'

Identity Service
Add a member to a tenant
const client = SplunkCloud({ tokenSource: TOKEN, tenant: TENANT }); client.identity.addMember({"name": "you@example.com"})
.then(member => {...}) .catch(err => {...});
client, err := service.NewClient(&service.Config{ Token: token, Tenant: tenant,
}) member, err = client.IdentityService.AddMember("you@example.com")
Go SDK

© 2018 SPLUNK INC.
Js SDK

 group:
 tenant_admins
 members

Authorization
How the platform verifies what you can do

© 2018 SPLUNK INC.

 role:
 reader

permission:
"mytenant:*:identity.groups.read"
permission:
"mytenant:*:identity.roles.read"

 role:
 writer

permission:
"mytenant:*:identity.groups.write"
permission:
"mytenant:*:identity.roles.write"

Manage Data with Catalog
Create a dataset

© 2018 SPLUNK INC.

> curl -X POST \ https://api.splunkbeta.com/$TENANT/catalog/v1beta1/datasets \ -H "Authorization: Bearer $BEARER_TOKEN" \ -H 'Content-Type: application/json' \ -d '{ "name": "devops", "owner": "me@example.com", "kind": "index", "disabled": false }'

Manage Data with Catalog
Create a dataset
client.catalog.createDataset({ name: 'devops', kind: 'index', disabled: false,
}).then(dataset => {...}) .catch(err => {...});

© 2018 SPLUNK INC.
Js SDK

dataset, err := client.CatalogService.CreateDataset(&model.DatasetCreationPayload{ Name: "devops", Kind: "index",
})
Go SDK

Data Ingestion
Ingest events
> curl -X POST \ https://api.splunkbeta.com/$TENANT/ingest/v1beta1/events \ -H "Authorization: Bearer $BEARER_TOKEN" \ -d '[{ "body": "My test event", "host": "example.site.com", "source": "/var/log", "sourcetype": "access_combined", "timestamp": 1536364275000, "attributes": {"index":"devops"} }, { "body": "My other test event", "host": "example.site.com", "source": "/var/log", "sourcetype": "access_combined", "timestamp": 1536364275001, "attributes": {"index":"devops"} }]'

© 2018 SPLUNK INC.

Data Ingestion
Ingest events
const client = SplunkCloud({ tokenSource: TOKEN, tenant: TENANT }); const event1 = {"body": "My test event",
"host": "example.site.com", "source": "/var/log", "sourcetype": "access_combined", "timestamp": 1536364275000, "attributes": {"index":"devops"} }; const event2 = {"body": "My test event", "host": "example.site.com", "source": "/var/log", "sourcetype": "access_combined", "timestamp": 1536364275000, "attributes": {"index":"devops"} }; client.ingest.postEvents([event1, event2]) .then(response => {...}) .catch(err => {...});

© 2018 SPLUNK INC.
Js SDK

Data Ingestion
Ingest events

attributes := make(map[string]interface{})

attributes["index"] = "devops"

timeValue := int64(time.Now().Unix() * 1000) // Unix millis

event1 := model.Event{

Body:

"My test event",

Host:

"example.site.com",

Source:

"/var/log",

Sourcetype: "access_combined",

Timestamp: timeValue,

Attributes: attributes}

event2 := model.Event{

Body:

"My other test event",

Host:

"example.site.com",

Source:

"/var/log",

Sourcetype: "access_combined",

Timestamp: timeValue,

Attributes: attributes}

err = client.IngestService.PostEvents(&[]model.Event{event1, event2})

Go SDK

© 2018 SPLUNK INC.

Data Ingestion
Sending batches of events
// Send a batch of events every 5 bytes, 10th event, or 3000 ms const eb = new EventBatcher(splunk.ingest, 5, 10, 3000); eb.add({...}).then(response => {...}).catch(err => {...}); eb.add({...}).then(response => {...}).catch(err => {...}); ... eb.stop();
// Send a batch of events every 5th event or 1000ms sender, err := client.NewBatchEventsSender(5, 1000) sender.Run() err = sender.AddEvent(model.Event{...}) err = sender.AddEvent(model.Event{...}) ... sender.Stop()
Go SDK

© 2018 SPLUNK INC.
Js SDK

Data Ingestion

© 2018 SPLUNK INC.

 Splunk Forwarders can also send data to SDC
 Three Data Availability stations in the source=*Pavillion
 "Gain Control of Your Data Flow Using Stream Processing" (FN1919) Wednesday 4:30PM

Searching Data
Data Fabric Search and SPLv2

© 2018 SPLUNK INC.

 Similarities to Splunk Enterprise · Searches are run as asynchronous jobs with a search id · Results are available as paginated responses (offset, count)
 Differences from Splunk Enterprise · One-shot (synchronous) searches are not supported · New Search Processing Language = SPLv2
 SPLv2 · Move to formal grammar lexer/parser for consistency and ease-of-use · Intro to SPLv2, the Module System, and the Catalog (DEV2043) - Thursday 1:30PM

Searching Data
Post a job and get results

© 2018 SPLUNK INC.

> export SID=$(curl -X POST \ https://api.splunkbeta.com/$TENANT/search/v1beta1/jobs \ -H "Authorization: Bearer $BEARER_TOKEN" \ -d '{"query": "| from index:devops | head 5"}' \ | jq -r .sid)
...
> curl -X GET \ https://api.splunkbeta.com/$TENANT/search/v1beta1/jobs/$SID/results \ -H "Authorization: Bearer $BEARER_TOKEN"

Searching Data
Post a job and get results

© 2018 SPLUNK INC.
Js SDK

const client = SplunkCloud({ tokenSource: TOKEN, tenant: TENANT }); client.search.createJob("| from index:devops | head 5")
.then(sid => splunk.search.waitForJob(sid) .then(job => splunk.search.getResults(sid, { count: 5, offset: 0 })) .then(results => {...}); .catch(err => {...});

Searching Data
Post a job and get results

© 2018 SPLUNK INC.

search := &model.CreateJobRequest{Query: "| from index:devops | head 5"} sid, err := client.SearchService.PostJob(search) err = client.SearchService.WaitForJob(sid, 1000*time.Millisecond) results, err := client.SearchService.GetResults(sid, 5, 0)
Go SDK

Displaying Results
Splunk UI and NEW Splunk Dashboards
{ "columns": [ ["1", "2", "3", "4", "5", "6", "7", "8"], ["1", "2", "3", "4", "5", "6", "7", "8"] ], "fields": [{"name": "foo"}, {"name": "bar"}], "visualizations": { "table": { "title": "Table", "type": "viz.table", "dataSources": {"primary": "search1"} }, "table": { "title": "Bar Chart", "type": "viz.bar", "dataSources": {"primary": "search1"} }, "layout": { "type": "grid", "options": { "columns": 12 }, ...
 Dashboards and Analysis UI Components for Developers (DEV1703) Wednesday 4:30PM

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
splunk-cloud-create-app splunk-cloud-examples Demo
The barebones app for Splunk Developer Cloud and example apps to get you started

© 2018 SPLUNK INC.
scloud CLI Demo
Perform management tasks, ingest and search data, and more

scloud CLI

© 2018 SPLUNK INC.

Splunk SimData
 Fake data for real apps · Preview talk from Conf 2017 · Available now for use with Splunk Enterprise and Splunk Cloud! · Works with SDC, too
 Fake Data for real apps · Demos · Development · Testing

© 2018 SPLUNK INC.

Splunk SimData
Define actors and their interactions

© 2018 SPLUNK INC.

Splunk SimData
Define scenarios

© 2018 SPLUNK INC.

Splunk SimData
Control your running simulation

© 2018 SPLUNK INC.

Splunk SimData
Get plausible results

© 2018 SPLUNK INC.

SDC Developer Portal

© 2018 SPLUNK INC.

SDC Developer Portal

© 2018 SPLUNK INC.

SDC Developer Portal

© 2018 SPLUNK INC.

SDC Developer Portal

© 2018 SPLUNK INC.

SDC Developer Portal

© 2018 SPLUNK INC.

Join the SDC Beta Program!
 Help test out the Splunk Developer Cloud!  We're looking for developers with:
· Experience in building cloud-hosted applications · Experience with building Splunk apps · Interest in building new solutions on our beta SDC
 Be among the first to try SDC! Apply to join the beta! · splunk.com/sdc

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Six Great Sessions on Splunk Developer Cloud
 Building Apps for Splunk Developer Cloud (DEV1902) - Wednesday 11:30AM  Splunk Developer Cloud Services and Features (DEV1552) - Wednesday
12:45PM  Partners Build Apps on Splunk Developer Cloud (DEV1846) - Wednesday
3:15PM  Dashboards and Analysis UI Components for Developers (DEV1703) -
Wednesday 4:30PM  Gain Control of Your Data Flow Using Stream Processing (FN1919) -
Wednesday 4:30PM  Intro to SPLv2, the Module System, and the Catalog (DEV2043) - Thursday
1:30PM

© 2018 SPLUNK INC.
Q&A
Tedd Hellmann | Senior Product Manager Tim Pavlik | Senior Software Engineer

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

