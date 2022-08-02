NEED SHARDING? HERE IT IS!
Oracle 12.2 Sharded Database Management

ABOUT ME
 Kamus@Enmotech   Travel and Starbucks
 Travel: Japan  Starbucks: Venti Caramel Macchiato  Games: Blizzard fans, Hearthstone
 Channel[K]: http://www.dbform.com

WHAT IS SHARDING
Every shard is a part of logical database

WHAT IS SHARDING EXACTLY

Database "DB"

Table "T"

User_ID User_Name

1

Kim

2

Tim

3

Jim

4

Sim

Split Table

Database "DB"

Table "T1"

User_ID User_Name

1

Kim

3

Jim

Table "T2"

User_ID User_Name

2

Tim

4

Sim

//Query single row select User_Name from T1 where User_ID=1; //Query all create view T as select * from T1 union all select * from T2; select count(*) from T;

WHAT IS SHARDING EXACTLY

Database "DB"

Table "T"

User_ID User_Name

1

Kim

2

Tim

3

Jim

4

Sim

Partition Table

Database "DB"

Table "T"

Partition "P1"

User_ID User_Name

1

Kim

3

Jim

Partition"P2"

User_ID User_Name

2

Tim

4

Sim

//Query single row select User_Name from T where User_ID=1; //Query all select count(*) from T;

WHAT IS SHARDING EXACTLY

Database "DB"

Table "T"

User_ID User_Name

1

Kim

2

Tim

3

Jim

4

Sim

Shard Table

Database "DB1"

Database "DB2"

Table "T"

Shard "S1"

User_ID User_Name

1

Kim

3

Jim

Shard "S2"

User_ID User_Name

2

Tim

4

Sim

//Query single row select User_Name from T where User_ID=1; //Query all select count(*) from T;

WHY NEED SHARDING? BENEFITS OF SHARDING
 Extreme Scalability  Scale Out vs. Scale Up
 Fault Isolation  No shared SAN
 Global Data Distribution  Store particular data close to its consumers
 Pilot & Rolling Upgrades  First test the changes on a small subset of data.
 Cost Down  Because the size of a shard can be made arbitrarily small, deploying an SDB in a cloud consisting of low-end commodity servers with local storage becomes easy. 

DATABASE SPLITTING HISTORY IN WEB COMPANIES

 All business on Single database

 All business on Master+Slave databases, write/read separated.

 Business separated, each business on separated Master+Slave databases.

 Area based/Hash based, table horizontal split, each part of business on separated Master+Slave

databases.

Master Database "DB1-1"

Slave Database "DB1-2"

Master Database "DB1-1" Master Database "DB1-1" Master Database "DB1-1"

Slave Database "DB1-2" Slave Database "DB1-2" Slave Database "DB1-2"

Database "DB" Read

Master Database "DB1"

Slave Database "DB2"

Replication

Read

Write

Replication

Read

Write Write Write

Replication Replication Replication

Read Read Read

Write

Write

Master Database "DBN-1"

Slave Database "DBN-2"

Write

Replication

Read

Master Database "DBN-1" Master Database "DBN-1" Master Database "DBN-1"

Slave Database "DBN-2" Slave Database "DBN-2" Slave Database "DBN-2"

Write Write Write

Replication Replication Replication

Read Read Read

DISADVANTAGES OF SHARDING
 Is it transparent to application developer  Which database should access?  How to sum query all databases?  How to join query all databases?

}

 Single point of failure  Failover more complex  Backups more complex  Modification more complex

Database access layer/Data access route layer  Proxy-FreeMySQL Fabric, TDDL  ProxyMySQL Proxy, Atlas(Qihoo),Cobar

HOW MANY SHARDING SOLUTIONS?

 SQL  MySQL with MySQL Fabric  Postgres-XC and Greenplum  Teradata
 No-SQL  Apache HBase  MongoDB
 New-SQL  Google Spanner

And NOW

is coming!

WHAT IS ORACLE SHARDING
Every shard is a part of logical database

GLOBAL DATA SERVICE - GDS
 What is GDS  Instance->Service->Global Service
 GDS Capabilities  Workload routing(region-based or lag-based)  Load balancing(Connect-time or Run-time)  Global service failover/role-based failover
 Released in Oracle database 12.1  GSM(Global Service Manager)  GDS Catalog  Must reside in Oracle database 12c  Recommended to co-hosted with RMAN catalog or OEM repository

GDS DEPLOYMENT OVERVIEW
 Install GSM software on GSM servers  Minimum 1 GSM per region  Recommended 3 GSMs/region
 Setup GDS administrator accounts & privileges  Configure GDS
 Create GDS catalog  Add GSMs,Regions, Pools, Databases, Global Services  Setup client connectivity  Clients connect to GSM instead of the database listener

GDS USE CASES - ROLE BASED GLOBAL SERVICES FOR ACTIVE DATA GUARD
 Order Service runs on Primary
 Reporting Service runs on Standby
 Upon Data Guard role change, GDS fails over services based on Role
GDSCTL> add service -service order_srvc -gdspool sales preferred_all -role PRIMAY; GDSCTL> add service -service reporting_srvc -gdspool sales -preferred_all -role PHYSICAL_STANBY -failover_primay;

GDS USE CASES - REPLICATION LAG TOLERANCE IN ACTIVE DATA GUARD
 Specify replication lag limit for a service
 GDS ensures that service runs on Active Data Guard standby(s) with lag less than this limit
 Improved data quality
GDSCTL> add service -service reporting_srvc -gdspool sales ­preferred_all ­role PHYSICAL_STANDBY ­lag 180;

ORACLE SHARDING USE CASE
Oracle Sharding is implemented based on the Oracle Database partitioning feature. Oracle Sharding is "Distribute Partitioning".

ORACLE SHARDING KNOWHOW
 Table family  Parent-child relationship tables  In Oracle Database 12c Release 2, only a single table family is supported in an SDB
Sharding Key

ORACLE SHARDING KNOWHOW
 Consistent Hash  Traditional hash: bucket number is calculated as HF(key) % N  Oracle linear hashing: buckets number is power of 2, if not, data is not even.  Consistent hashing: partitioning by the range of hash values  When add/remove shards, only move chunks, does not change contents of chunks  When chunk is split, hash values divide into 2 ranges, other chunks no infect

ORACLE SHARDING KNOWHOW

 Tablespace set

 Before creating a sharded table partitioned by consistent hash, a set of tablespaces (one tablespace per chunk) has to be created to store the table partitions.

 Chunk

 A chunk contains a single partition from each table of a table family

Chunk #1

Customers_P1(1-1000000)

Orders_P1

Lineitems_P1

 Default, 120 chunks per shard, or specified when CREATE SHARDCATALOG by using GDSCTL

 The unit of data migration between shards is the chunk.

ORACLE SHARDING KNOWHOW
 Duplicated table  Synchronizes the contents of duplicated tables using Materialized View Replication  A duplicated table on each shard is represented by a read-only materialized view.  Automatically refreshed with a configurable frequency  CREATE DUPLICATED TABLE statement automatically creates the master table, materialized views, and other objects required for materialized view replication.

SHARDING AND REPLICATION

 Managing by using GDSCTL
 Automatically deploys
 Data Guard
//System-Managed Sharding with Data Guard Replication CREATE SHARDCATALOG ­database host00:1521:shardcat ­region dc1, dc2 ADD SHARDGROUP -shardgroup shardgroup1 -region dc1 -deploy_as primary ADD SHARDGROUP -shardgroup shardgroup2 -region dc1 -deploy_as standby ADD SHARDGROUP -shardgroup shardgroup3 -region dc2 -deploy_as standby CREATE SHARD ... DEPLOY
 Goldengate
//System-Managed Sharding with Goldengate Replication CREATE SHARDCATALOG -repl OGG ­database host00:1521:shardcat ­region dc1, dc2 ADD SHARDGROUP -shardgroup shardgroup1 -region dc1 ADD SHARDGROUP -shardgroup shardgroup2 -region dc2 CREATE SHARD ... DEPLOY

Shardgroup 1

Database "DB1"

Database "DB2"

Table "T"

Shard "S1"

User_ID User_Name

1

Kim

3

Jim

Shard "S2"

User_ID User_Name

2

Tim

4

Sim

Shardgroup 2

Database "DB1"

Database "DB2"

Table "T"

Shard "S1"

User_ID User_Name

1

Kim

3

Jim

Shard "S2"

User_ID User_Name

2

Tim

4

Sim

Shardgroup 3

Database "DB1"

Database "DB2"

Table "T"

Shard "S1"

User_ID User_Name

1

Kim

3

Jim

Shard "S2"

User_ID User_Name

2

Tim

4

Sim

DC 1 DC 2

SHARDING REQUEST ROUTING
 Session-Based Request Routing  Connect string must contain: (SHARD_KEY=...)  JDBC: connection.setShardKey(<shard_key>,<shard_group_key>);  Support for OCI/OCCI (C++)/ODP.NET  Support for PHP, Python, Perl, and Node.js
 In addition to Session-Based routing, Oracle also provide support for:  Statement-Level Request Routing  Cross-Shard Queries

" Unlike NoSQL data stores, Oracle Sharding provides the benefits of sharding without sacrificing the capabilities of an enterprise RDBMS, such as relational schema, SQL and other programmatic interfaces, complex data types, online schema changes, multi- core scalability, advanced security, compression, highavailability, ACID properties, consistent reads, and many more..
-Oracle® Database Administrator's Guide 12c Release 2 (12.2)

THINK TWICE BEFORE JUMPING INTO SHARDING
 MySQL: Not exceed 20GB per table is optimised. (Concurrent processing capacity)  How about we have a 2TB table? 100 shards!  What does 100 shards mean?
 100 x86 servers  1 Primary, 1 Slave -> 200 servers  1 Primary, 2 Slaves -> 300 servers  How many routers do you need? How many cables? How many spaces?  Are you ready for maintaining so many servers?  99% server stableness means: Server down/EVERY day.

LAST CONCERN
 License cost  Oracle database license model has to be changed

32 CPU,$1,152,000/Y

32 CPU,$1,958,400/Y

 






Oracle

z3 ­ SQL

zData ­ 

BayMax 

 

