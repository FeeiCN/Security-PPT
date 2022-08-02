© 2018 SPLUNK INC.
Deep dive into the world of federated searches
Raanan Dagan, Principal SE Architect, Splunk Sourav Pal, Senior Principal Engineer, Splunk
Oct 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
Data Fabric Search is a new, extended search platform that leverages compute assets from anywhere and accesses and executes on data regardless of origin or
type.

© 2018 SPLUNK INC.
Features

Two main features of DFS

© 2018 SPLUNK INC.

Big Data Analysis
Processing massive amounts of data

Federated Searches
Reaching data where it resides
· Other Splunk Deployments

Big Data Analysis

© 2018 SPLUNK INC.

 Current Scenario:

Processing massive amounts of data

· Ex:- 40 mil cardholders

· Stats (high cardinality); join / union (data mashup); sorting

· Scale Constraints

· When using Splunkd, the join commands is limited to 50,000 events in sub-search

 Solution:

· DFS has a powerful query orchestration engine that:

· Leverages Splunkd for first mile compute

· Workload offloaded from Splunk Search Head enabling better performance of the system

· Leverages DFS SearchPipeline for large-scale parallel and distributed data processing on compute cluster
(currently Spark)

· Ex: handled searches successfully which have resulted in output of 267 billion events.

Federated Searches across Splunk
Reaching data where it resides - other Splunk Deployments

© 2018 SPLUNK INC.

 Current scenario with multiple deployments:

Search Head

· Unified Search across Splunk Deployments

- Requires search head directly interact with Indexers of other deployments

Indexers

- Bypassing security configuration and resource usage of other deployments

Splunk Deployment 1

- Need replication of knowledge objects to to provide a unified view across all search heads

 Federated Search: · Seamlessly search across all deployments

Federated Search Head

- Ability to correlate and run join/unions to search across datasets in disparate deployments
- Enables scale and improves the performance by offloading the workload from search head to Spark worker nodes
- Better management of security configurations

Indexers
Splunk Deployment 1

Search Head
Indexers Splunk Deployment 2

DFS Cluster

Search Head
Indexers Splunk
Deployment 2

When do I use DFS?
Customer ABC has three LoBs

© 2018 SPLUNK INC.

Video  20 mil subscribers

Internet  18 mil subscribers

Wireless  11 mil subscribers

 Each LoB has a separate Splunk deployment  Outage over the weekend affecting customers in California

DFS Use-Cases

© 2018 SPLUNK INC.

 Use-Case 1: Massive Scale Computation · Number of "Video" Customers that were affected by this outage. · Index = Video | stats count (customer_id) OR ip_address where state is CA

 Use-Case 2: Federated Searches (Splunk Deployments) · Number of Video AND Internet customers that were affected by this outage · Index = Video | join index=Internet

© 2018 SPLUNK INC.
Technical Deep Dive

Splunk Search Head Splunk Indexer

Big Data Analysis
DFS Master DFS Coordinator

DFS Workers

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Step 1: Life Cycle Management of Data Fabric Search Master

Splunk Search Head

DFS Master 1
DFS Coordinator

· Splunk daemon process stop / start also
stops and starts DFS-Master
· DFS-Master is initialized with several
values: Ports, Number of Executors, etc

Splunk Indexer

DFS Workers

Splunk Search Head Splunk Indexer

Step 2: DFS Query Planning

© 2018 SPLUNK INC.

DFS Master
DFS Coordinator 2

DFS Coordinator partition the search requested into 3 phases:
· Splunk Indexer Job aka Remote Search
Job
· DFS job or the execution which will be
executed on the spark cluster
· Search Head (SH) job - which will be
executed if any on the SH

DFS Workers

© 2018 SPLUNK INC.
Step 3: Dynamic Partition Setup and Query Update

Splunk Search Head Splunk Indexer

DFS Master DFS Coordinator
3

Remote Search job is updated with the list of DFS workers listeners such that the indexers know where to send the data

DFS Workers

Step 4: Splunk Indexer layer execution

© 2018 SPLUNK INC.

Splunk Search Head Splunk Indexer

DFS Master DFS Coordinator
4

The remote search processes execute the remote pipeline
· reading data from the buckets
· applying extractions, kv, lookups, and
other streaming search processors (prestats)

DFS Workers

Step 5: Shuffle to DFS workers

© 2018 SPLUNK INC.

Splunk Search Head

DFS Master DFS Coordinator

Instead of sending the data back to the SH, the SP pipeline executed redistribute operator and shuffle the data to the DFS workers in Parallel (RD_OUT)

Splunk Indexer

5
DFS Workers

Step 6: DFS Workers Job execution

© 2018 SPLUNK INC.

Splunk Search Head Splunk Indexer

DFS Master DFS Coordinator

DFS Search Pipeline are Java lambdas and pipeline infrastructures
· manage core scaling (memory or disk)
· dynamic repartitioning (Spark RDD
repartitioning) based on data skews
· multiple levels of shuffle as needed

6
DFS Workers

Step 7: Parallel Data Retrieval

© 2018 SPLUNK INC.

Splunk Search Head

DFS Master DFS Coordinator
7

DFS Coordinator retrieves the search results in parallel from the DFS workers

Splunk Indexer

DFS Workers

© 2018 SPLUNK INC.
Step 8: SH Job execution and Job finalization

8
Splunk Search Head
Splunk Indexer

DFS Master DFS Coordinator

There can be two scenarios before results are finalized:
· SH pipeline has processors which were
not supported in DFS pipeline
· SH has only the collection processor

DFS Workers

DFS ­ Performance

© 2018 SPLUNK INC.

JOIN and Stats 1.5 trillion record
· 1,500,000,000,000 in-flight, not at-rest · Ran in ~50 minutes on a ~100 node
Spark cluster

© 2018 SPLUNK INC.
Federated Searches ­ Splunk Deployments

Splunk Search Head

DFS Master DFS Coordinator

Splunk Indexer

DFS Workers

Splunk Search Head Splunk Indexer

Federated Search ­ Execution Flow

© 2018 SPLUNK INC.

SP: Start Query Execution Flow
DFC: Information Map Generation Access Control Job Partitioning
DFS-Workers: Create Data Layer and Execute Triggers Version fetch Triggering the query Sid Management

Search Head DFS-Master

SP

DFC

DFS-Workers

Indexer

Indexer

Local

Spark Cluster

Search Head

Search Head

Search Head

DFS SH (RD_OUT) Non-DFS SH (REST API)

Indexer

Indexer

Deployment 1

Indexer

Indexer

Deployment 2

Indexer

Indexer

Deployment 3

Federated Search ­ Query Example
Join across multiple deployments

© 2018 SPLUNK INC.

|dfsjob[
| union [|search Local| ][
|from federated:dep_1]
| join [| union [|from
federated:dep_2][|from federated:dep_3]] |stats count

Search Head DFS-Master DFC
SP

Indexer

Indexer

Local

DFS-Workers
JOIN

Union

Union
Spark

Search Head

Search Head

Search Head

Indexer

Indexer

Deployment 1

Indexer

Indexer

Deployment 2

Indexer

Indexer

Deployment 3

© 2018 SPLUNK INC.
Federated Search ­ Combine 30 deployments
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Federated Search ­ Access Control Security

Service Account Setup · Remote User and Password = Local
User and Password · Remote Role != Local Role

Search Head DFS-Master DFC
SP

Indexer

Indexer

Local

DFS-Workers
Spark Cluster

Search Head

Indexer

Indexer

Deployment 1

Search Head

Indexer

Indexer

Deployment 2

Search Head

Indexer

Indexer

Deployment 3

Federated Search (FS) ­ Security

© 2018 SPLUNK INC.

Components Management via Service Account
FS feature introduces new roles
FS feature new Password Management Runtime Authorization and Authentication

Responsibilities

· On Remote Search Heads, create a new service accounts (user/password) and roles to limit

·

the set of This new

rinedmeoxteerssearnvdiceotahcecroruensFtoiwurricllenseed

to

match

the

DFS

Master

Search

Head

service

account

· Example = Users "remotefsh" and Role "role_myfsh1"

· Management via Single Identity Provider (LDAP) is not part of the first release and will be

added at a later date

· fsh_manage (Admin), fsh_search (User), fsh_remote_deployment (User)  [role_myfsh1]  importRoles = user;power  fsh_search = enabled  fsh_remote_deployment = remote_deployment_1

· encrypted in the fshpassword file · Allows Search, we check if user has either the fsh_search or fsh_manage capabilities · Allows Manage, we check if admins has fsh_manage

· FS retrieves the password for remote deployment and proceeds for execution · The authentication and authorization for the remote deployment is based on the default
policies executed on the remote Search Head deployment

Federated Search ­ Network Security

Local DFS (RD_OUT)

Spark Cluster

· Default: All Network is Secured

Search Head DFS-Master

DFS-Workers

just like normal Splunk. No configuration required. · Data flows are authenticated and encrypted via default symmetric key over a TLS communication

DFC SP

Indexer

Indexer

© 2018 SPLUNK INC.

· Additional Security: · Spark Sasl Encryption, · Spark key stores certificates, · DFS key stores in
limits.conf/server.conf

Remote DFS (RD_OUT)
Search Head

Search Head

Remote Non-DFS (REST API)
Search Head

Indexer

Indexer

Deployment 1

Indexer

Indexer

Deployment 2

Indexer

Indexer

Deployment 3

Components Catalog.conf

Federated Search ­ Configuration
Example
[remote_deployment_1] IP = 10.0.0.3 ServiceAccount = remotefsh Type = Splunk

Authorize.conf Search

[federated:my_dep_1_search_1] search = "search index=myindex | stats count by ip" deploymentName = remote_deployment_1
[role_myfsh1] importRoles = user;power fsh_search = enabled fsh_remote_deployment = remote_deployment_1
|union [|from federated:my_dep_1_search_1] [|from federated:my_dep_2_search_2] | stats count

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk Demo

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

