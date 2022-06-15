Architecting Splunk for High Availability and Disaster Recovery
Sean Delaney | Principal Architect | Splunk
October 2018 | Version 1.0

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
Sean Delaney
 Principal Field Architect  7+ years at Splunk  Large scale deployments  9th .conf

Agenda

© 2018 SPLUNK INC.

Disaster Recovery

Recover in the event of a disaster

High Availability · Data Collection · Indexing & Searching

Maintain an acceptable level of continuous service

Top Takeaways

© 2018 SPLUNK INC.
Disaster Recovery (DR)

DR

What is Disaster Recovery?

© 2018 SPLUNK INC.

Set of processes necessary to ensure recovery of service after a disaster

DR
1 2

Disaster Recovery Steps © 2018 SPLUNK INC.
Backup necessary data
Backup to a medium at least as resilient as source Local Backup vs. Remote
Restore
Ensure this works Backup is worthless without restore

DR
1

Backup

© 2018 SPLUNK INC.

a Configurations $SPLUNK_HOME/etc/*

b

Indexes
Buckets: Hot*, Warm, Cold, Frozen

DR

Backup Configurations

Splunk Instance

© 2018 SPLUNK INC.

$SPLUNK_HOME/etc/*

DR

Backup: Bucket Lifecycle

Events

[Out of volume space or

[Hot Bucket is Full]

too many warms]

© 2018 SPLUNK INC.

$ Home Path

[Out of Space or Bucket is Old]
$ Cold Path
[Cheaper Storage]

$ Thawed Path

[Explicit User Action]
$ Frozen Path or Deleted

10

DR
Bucket Type

Backup Data
State Read + Write

© 2018 SPLUNK INC.
Can Backup? No*

Read Only

Yes

Read Only

Yes

*Unless using snapshot aware FS or roll to warm first (which introduces a performance penalty).

© 2018 SPLUNK INC.
DR Restore Configurations
New Splunk Instance

$SPLUNK_HOME/etc/*

$SPLUNK_HOME/etc/*

DR

Restore Data

© 2018 SPLUNK INC.

New Splunk Instance

$Indexes_Location
($SPLUNK_HOME/var/lib/splunk)

$Indexes_Location
($SPLUNK_HOME/var/lib/splunk)

Splunk advises restoring fully from a backup rather than restoring on top of a partially corrupted datastore.

© 2018 SPLUNK INC.
DR Restore Configurations
New Splunk Instance

$SPLUNK_HOME/etc/*

$SPLUNK_HOME/etc/*

DR

Backup KV Store

© 2018 SPLUNK INC.

KV store backup scripts added in 7.1, previous versions backup KV Store files Run on the Searchead to take a stateful snapshot of the KV store

./splunk backup kvstore

$SPLUNK_HOME/var/lib/ splunk/kvstorebackup

http://docs.splunk.com/Documentation/Splunk/latest/Admin/BackupKVstore

DR

Backup Clustered Data

© 2018 SPLUNK INC.

 Option 1: Backup all data on each node
· Will also result in backups of duplicate data  Option 2: Identify one copy of each bucket on the cluster and backup only
those (requires scripting)
· Decide whether or not you need to also backup index files

Bucket naming conventions Non-clustered buckets: db_<newest_time>_<oldest_time>_<localid> Clustered original bucket: db_<newest_time>_<oldest_time>_<localid>_<guid> Clustered replicated bucket copies: rb_<newest_time>_<oldest_time>_<localid>_<guid>

© 2018 SPLUNK INC.
DR Putting Restore Together

2

a

(New) Splunk Instance

b

Configurations

c

Data/Indexes

DR

Considerations

Recovery Time and Tolerable Loss vs. Complexity and Cost

© 2018 SPLUNK INC.

Other elements in your environment

© 2018 SPLUNK INC.

 Job Artifacts, DM, Collections etc.

 Utility/Management Instances:
· Deployment Server · License Master · Cluster Master · Deployer

© 2018 SPLUNK INC.
High Availability (HA)

HA

What is High Availability?

© 2018 SPLUNK INC.

A design methodology whereby a system is continuously operational, bounded by a set of
predetermined tolerances.
Note: "high availability" !="complete availability"

HA
1 2 3

Splunk High Availability

© 2018 SPLUNK INC.

Data Collection/Reception

Searching

Indexing

HA

Data Collection

A

Indexers

B

. . .

© 2018 SPLUNK INC.

Forwarder

Forwarder

. . . Forwarder

HA

Data Collection

A

Indexers

B

. . .

© 2018 SPLUNK INC.
outputs.conf: [tcpout] defaultGroup = mygroup [tcpout:mygroup] server = A:9997, B:9997 autoLB = true

Forwarder

Forwarder

. . . Forwarder

HA

Searching

© 2018 SPLUNK INC.

2 Search Head Clustering (SHC)

HA

Searching

© 2018 SPLUNK INC.

Typical Search Hierarchy

Indexer A

Indexer B

. . .

Indexer N

HA

Searching

© 2018 SPLUNK INC.

Typical Search Hierarchy

Indexer A

Indexer B

. . .

Indexer N

© 2018 SPLUNK INC.
HA Search Head Clustering (SHC)
 Improved horizontal scaling  Improved high availability  No single point of failure

HA

SHC

A

B

C

© 2018 SPLUNK INC.
Replication protocol syncs: - Configurations - Job Artifacts

Indexer A Indexer B Indexer C . . . Indexer N

HA

SHC

© 2018 SPLUNK INC.
Replication protocol syncs: - Configurations - Job Artifacts

A

B

C

Configurations

Deployer

Indexer A Indexer B Indexer C . . . Indexer N

HA

SHC

© 2018 SPLUNK INC.
Replication protocol syncs: - Configurations - Job Artifacts

A

B

C

Configurations

Deployer

Deployer ensures identical deployed configurations

Indexer A Indexer B Indexer C . . . Indexer N

HA

SHC

© 2018 SPLUNK INC.
Replication protocol syncs: - Configurations - Job Artifacts

Indexer A

A

B

C

Captain

Configurations

Deployer

Indexer B

Indexer C . . .

Indexer N

Captain plays a special role in cluster orchestration and job scheduling.

© 2018 SPLUNK INC.
HA SHC Operation - High Level
 Deployer ensures all SHC members have identical baseline configurations · Subsequent UI changes propagated using an internal replication mechanism
 Job Scheduler gets disabled on all members but the Captain  Captain selects members to run scheduled jobs based on load
· Selection based on load statistics. · Captain orchestrates job artifact replication to selected members/candidates of the cluster.  Transparent job artifact proxying (and eventual replication) if artifact not present on user's SH.

HA SHC Operation - High Level
 Majority requirement and failure handling · Surviving majority (>=51%)
 Site-awareness gotchas · No notion of site in SHC (unlike in index replication) · Case for static captain election
 Latency and number of nodes

© 2018 SPLUNK INC.

HA

Stretched SHC

© 2018 SPLUNK INC.

Captain

Deployer

Indexer Indexer Site A

Indexer Indexer Site B

HA

Stretched SHC

© 2018 SPLUNK INC.

Captain must be statically elected as there is no SHC majority

Deployer
Indexer Indexer Site A

Captain
Indexer Indexer Site B

HA

Stretched SHC

© 2018 SPLUNK INC.

Deployer launched in second site, if SCH updates required

Deployer
Indexer Indexer Site A

Captain

Deployer

Indexer Indexer Site B

HA
3

Indexing

© 2018 SPLUNK INC.

Indexer Clustering

HA

Index Replication

© 2018 SPLUNK INC.

 Cluster = a group of search peers (indexers) that replicate each others' buckets  Data Availability

· Availability for ingestion and searching  Data Fidelity

· Forwarder Acknowledgement, assurance  Disaster Recovery
· Site awareness  Search Affinity
· Local search preference vs. remote

Trade offs
· Extra storage · Slightly increased

processing load.

HA

Cluster Components

© 2018 SPLUNK INC.

 Master Node
· Orchestrates replication/remedial process. Informs the SH where to find searchable data. Helps
manage peer configurations.
 Peer Nodes
· Receive and index data. Replicate data to/from other peers. Peer Nodes Number  RF  Search Head(s)
· Must use one to search across the cluster.  Forwarders
· Use with auto-lb and indexer acknowledgement

Credit: Splunk Docs Team

© 2018 SPLUNK INC.
HA
Single Site Cluster Architecture

Credit: Splunk Docs Team

© 2018 SPLUNK INC.
HA
Replication Factor (RF)  Number of copies of data in
the cluster. Default RF=3  Cluster can tolerate RF-1 node
failures

Credit: Splunk Docs Team

© 2018 SPLUNK INC.
HA
Search Factor (SF)  Number of copies of data in
the cluster. Default SF=2  Requires more storage  Replicated vs. Searchable
Bucket

HA

Clustered Indexing

© 2018 SPLUNK INC.

 Originating peer node streams copies of data to other clustered peers.
· Receiving peers store those copies.  Master determines replicated data destination.
· Instructs peers what peers to stream data to. Does not sit on data path.  Master manages all peer-to-peer interactions and coordinates remedial activities.  Master keeps track of which peers have searchable data.
· Ensures that there are always SF copies of searchable data available.

HA

Clustered Searching

 Search head coordinates all searches in the cluster  SH relies on master to tell it who its peers are.
· The master keeps track of which peers have searchable data  Only one replicated bucket is searchable a.k.a primary
· i.e., searches occur over primary buckets, only.  Primary buckets may change over time
· Peers know their status and therefore know where to search

© 2018 SPLUNK INC.

Multisite Clustering
 Site awareness introduced in Splunk 6.1  Improved disaster recovery
· Multisite clusters provide site failover capability  Search Affinity
· Search heads will scope searches to local site, whenever possible · Ability to turn off for better thruput vs. X-Site bandwidth

© 2018 SPLUNK INC.

Credit: Splunk Docs Team

© 2018 SPLUNK INC.
Multi Site Cluster Architecture
Differences vs. single site  Assign a site to each node  Specify RF and SF on a site
by site basis

Multisite Clustering Cont'd

© 2018 SPLUNK INC.

 Each node belongs to an assigned site, except for the Master Node, which controls all sites but it's not logically a member of any
 Replication of bucket copies occurs in a site-aware manner.
· Multisite replication determines # copies on each site. Ex. 3 site cluster:
site_replication_factor = origin:2, site1:1, site2:1, site3:1, total:4
 Bucket-fixing activities respect site boundaries when applicable  Searches are fulfilled by local peers whenever possible (a.k.a search
affinity)
· Each site must have at least a full set of searchable data

© 2018 SPLUNK INC.
Rolling Restarts and Upgrades

Rolling Restarts/Upgrades

© 2018 SPLUNK INC.

 New features in 7.1.0
 Searchable Rolling Restarts · Perform a restart of an Indexer Cluster without effecting Search
 Upgrade a Splunk Clustered Deployment (SHC and Indexer Cluster) without downtime · Rolling upgrades apply to versions 7.1 and above (7.1 -> 7.2)

Searchable Rolling Restart

© 2018 SPLUNK INC.

 The master restarts peers one at a time.  The master runs health checks to confirm that the cluster is in a searchable
state before it initiates the searchable rolling restart.  The peer waits for in-progress searches to complete, up to a maximum time
period, as determined by the decommission_search_jobs_wait_secs attribute in server.conf. The default for this attribute is 180 seconds. This covers the majority of searches in most cases.  Searchable rolling restart applies to both historical searches and real-time searches.
 splunk rolling-restart cluster-peers -searchable true

Searchable Rolling Upgrades
Rolling Upgrade Steps:
1. Perform pre-flight indexer cluster health checks
· splunk show cluster-status --verbose
2. Upgrade the cluster master 3. Initialize rolling upgrade on the indexer cluster
· splunk upgrade-init cluster-peers
4. Select a cluster peer and gracefully shutdown the cluster-peer
· splunk offline
5. Upgrade the selected cluster-peer and restart 6. Repeat steps 4 and 5 for all cluster peers 7. Finalize rolling upgrade on the indexer cluster
· splunk upgrade-finalize cluster-peers

© 2018 SPLUNK INC.

Searchable Rolling Upgrades

© 2018 SPLUNK INC.

1
Stop the cluster master

SH-A

SH-B

SH-C

Deployer

2
Upgrade and restart cluster master
3
Rolling upgrade of Search Heads

4
Upgrade SHC deployer

CM:

Idx1:

Idx2:

IdxN:

5
Upgrade each indexer ensuring search continuity. Repeat for all indexers

6
Deliver business continuity by making search highly available Repeat step 5 for multisite deployments

© 2018 SPLUNK INC.
Smart Store

High Availability
Data vs. Search
 Data Resiliency
Will my data be protected if something goes wrong?
· SmartStore relies on the remote store to provide data resiliency
- SmartStore and indexer clustering will not protect data in the remote store - When used on SmartStore enabled indexes, indexer clustering will only protect hot buckets
 Search Resiliency
Will my search results be complete if something goes wrong?
· Indexer clustering must be used to provide highly available search
- SmartStore does not natively provide search HA

© 2018 SPLUNK INC.

Classic Architecture

© 2018 SPLUNK INC.
Architecture
Components
Smart Store Architecture

Hot/Warm Cold Storage Storage

Hot/Cache Storage

Remote Storage

Hot/Cache Storage

Failure Scenarios
Failed peers < replication factor

© 2018 SPLUNK INC.

copy bucket

HOT

HOT

push metadata

CACHED

STUB

push metadata

STUB

STUB

Available copies of a bucket exist in the cluster
 Cluster master initiates a fix-up operation · Peers with an existing copy of buckets are instructed to
copy them to other peers until RF/SF is met
· Hot bucket: full copy · Cached bucket: metadata push
- Peers don't need the full contents of cached buckets, as it can be fetched from the remote store
- Metadata replication is done with a POST to a REST endpoint on the target peer(s)

Retention
Options

© 2018 SPLUNK INC.

Retention for SmartStore enabled indexes is managed globally
· Retention for "classic" indexes is managed on a per-indexer basis  Retention Options
· Total Index size in MB
- Oldest bucket is purged when [maxGlobalDataSizeMB] is reached
· Age of events
- Bucket is purged when the oldest event reaches [frozenTimePeriodInSecs]

© 2018 SPLUNK INC.
Final Words

Deployer

Putting it together

© 2018 SPLUNK INC.

...........

Master

Search Head Clustering

........... ...........

Indexer Clustering Forwarding Layer ­ autoLB

END

Top Takeaways

 DR ­ Process of backing-up and restoring service in case of disaster · Configuration files ­ copy of $SPLUNK_HOME/etc/ folder · Indexed data ­ backup and restore buckets · Hot, warm, cold, frozen · Can't backup hot (without snapshots) but can safely backup warm and cold
 HA ­ continuously operational system bounded by a set of tolerances · Data collection · Autolb from forwarders to multiple indexers · Use Indexer Acknowledgement to protect in flight data · Searching · Search Head Clustering (SHC) · Indexing · Use Index Replication

© 2018 SPLUNK INC.

SVAs ­ Splunk Validated Architectures
 Recommended and supported Splunk deployment topologies based upon the following design pillars: · Availability · Performance · Scalability · Security · Manageability

© 2018 SPLUNK INC.

https://www.splunk.com/pdfs/white-papers/splunk-validatedarchitectures.pdf

END

Resources

· Splunk Validated Architectures
­ https://www.splunk.com/pdfs/white-papers/splunk-validated-architectures.pdf

© 2018 SPLUNK INC.

· Docs
­ High Availability ­ http://docs.splunk.com/Documentation/Splunk/latest/Deploy/Useclusters ­ http://docs.splunk.com/Documentation/Splunk/latest/Deploy/Indexercluster ­ https://docs.splunk.com/Documentation/Splunk/latest/DistSearch/AboutSHC
­ Rolling restarts and upgrades: ­ http://docs.splunk.com/Documentation/Splunk/latest/DistSearch/SHCrollingupgrade ­ http://docs.splunk.com/Documentation/Splunk/latest/Indexer/Userollingrestart#Use_searchabl
e_rolling_restart ­ http://docs.splunk.com/Documentation/Splunk/latest/Indexer/Searchablerollingupgrade

63

© 2018 SPLUNK INC.
Q&A

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

