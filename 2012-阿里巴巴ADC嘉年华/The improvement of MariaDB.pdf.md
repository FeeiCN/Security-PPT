MariaDB
All the NEW FEATURES

About the talk

 What is MariaDB  MariaDB Features
 Storage engines  Scalability enhancements  Administration & Monitoring  Packaging & Connectors  Replication  Optimizer
 Plans & Goals  Support and Contact Information
Sergei Golubchik. MariaDB  New Features.

ADC 2012

2

About me

 Sergei Golubchik, MariaDB core developer
 Working on MySQL internals since 1998
 Full-time MySQL AB employee since 2000
 VP Architecture, Monty Program Ab since 2010
 Originally from Ukraine, now living in Germany
 Some of the projects: Fulltext Search, XA, HANDLER, precision math, parallel repair and bulk insert in MyISAM, indexes in MERGE, Plugin API, pluggable authentication, microseconds in TIMESTAMP...

Sergei Golubchik. MariaDB  New Features.

ADC 2012

3

What is MariaDB
 A branch of MySQL with extra features
 features, requested by our users
 Backward compatible
 file formats, replication, configuration files  aim at 100% drop-in replacement
 Community developed
 50% of maria-captains are from community  no hidden agenda

Sergei Golubchik. MariaDB  New Features.

ADC 2012

4

Where to get it
 In distributions
 openSUSE, Gentoo, Mageia, Slackware, ArchLinux, ALTLinux
 FreeBSD  MacOS X with MacPorts or Homebrew
 From MariaDB.org:
 sources, binaries in .tar.gz (Linux) or .zip (Windows)  Windows MSI installer  MariaDB apt and yum repositories

Sergei Golubchik. MariaDB  New Features.

ADC 2012

5

New Features

 Storage Engines  Scalability enhancements  Reporting and Monitoring  Administration  NoSQL style features  Packaging  Connectors  Replication  Optimizer
Sergei Golubchik. MariaDB  New Features.

ADC 2012

6

Disclaimer: Benchmarks
 All results are real  But you mileage may vary  100x speedup does not mean that your
application will be 100x faster  But some queries might be. Even 1000x faster

Sergei Golubchik. MariaDB  New Features.

ADC 2012

7

Storage Engines
 Aria. "crash-safe MyISAM"
 Also used for temporary tables
 Improved MEMORY engine.
 Also used for temporary tables
 XtraDB. Developed by Percona. InnoDB replacement
 lost of performance improvements
 FederatedX  Improved Federated, with transactions
 PBXT, OQGraph, SphinxSE...

Sergei Golubchik. MariaDB  New Features.

ADC 2012

8

Using temporary
 Aria temporary tables

25

22,62

22,64

20

15

14,16

minutes

10

5

0 Aria temporary tables
Sergei Golubchik. MariaDB  New Features.

MySQL 5.5.25 GA MySQL 5.6.6-m9 MariaDB 5.5.25 GA

ADC 2012

9

Scalability
 Segmented MyISAM key cache

by Hakan Küçükyilmaz. http://kb.askmonty.org/en/segmented-key-cache-performance/

Sergei Golubchik. MariaDB  New Features.

ADC 2012

10

Scalability

 Thread pool

OLTP (ro) Throughput, tps

8000

7000

6000

5000

4000 3000

pool-of-threads thread-per-connection

2000

1000

0

8

16

32

64 128 256 512 1024 2048 4096

Concurrent Clients

by Axel Schwenke. http://blog.montyprogram.com/mariadb-5-5-thread-pool-performance/

Sergei Golubchik. MariaDB  New Features.

ADC 2012

11

Scalability

 on Windows

OLTP (wo) Throughput, tps

35000

30000

25000

20000 15000

MariaDB 5.5 MySQL 5.5

10000

5000

0

4

8

16

32

64

128

256

512 1024 2048

Concurrent Clients

by Vladislav Vaintroub. http://blog.montyprogram.com/mariadb-5-5-performance-on-windows/

Sergei Golubchik. MariaDB  New Features.

ADC 2012

12

Monitoring
 More plugin metadata  More status variables  Microsecond precision  Extended statistics
 per client, user, table, index
 Plugins
 sql_errors  feedback

Sergei Golubchik. MariaDB  New Features.

ADC 2012

13

Administration
 Enhanced KILL statement
 KILL USER, KILL SOFT
 INSTALL SONAME  LIMIT ROWS EXAMINED

Sergei Golubchik. MariaDB  New Features.

ADC 2012

14

NoSQL
 HandlerSocket plugin  Faster HANDLER statement  Dynamic columns

Sergei Golubchik. MariaDB  New Features.

ADC 2012

15

Columns and Data Types
 Virtual Columns  Dynamic Columns  Microseconds in TIMESTAMP, DATETIME,
TIME  GIS enhancements
 precise operations (not only MBR)  exact math (not floating point)  speed optimizations

Sergei Golubchik. MariaDB  New Features.

ADC 2012

16

Packaging
 MSI Windows Installer
 bundled with HeidiSQL GUI client
­ the only GUI client with pluggable authentication support
 YUM and APT repositories
 online repository generator

Sergei Golubchik. MariaDB  New Features.

ADC 2012

17

Connectors
 Non-blocking Connector/C extension
 send the query and continue the execution  read results later piecewise, when ready  event-driven programming
 Progress reporting
 protocol extension  works for LOAD DATA INFILE, ALTER TABLE,
CHECK, REPAIR, ANALYZE, OPTIMIZE

Sergei Golubchik. MariaDB  New Features.

ADC 2012

18

Replication
 RBR Annotations  Event Checksums
 Faster RBR without a primary key  Dynamic replication filter variables
 replicate_do_db, replicate_do_table, replicate_ignore_table, replicate_wild_do_table, replicate_wild_ignore_table
 Skipping events with @@skip_replication  Group Commit

Sergei Golubchik. MariaDB  New Features.

ADC 2012

19

Group Commit

 Hardware limit: 100-200 fsync/second
 Before: three fsync() per commit
 After: many concurrent commits per one fsync()
6000

Commit Throughput, tps

4500

3000 1500

MySQL 5.5 Facebook patch MariaDB 5.5
80

60

0

1

2

4

8 16 32 64 128 256 512 1024

Concurrent Clients

by Mark Callaghan. http://www.facebook.com/note.php?note_id=10150211546215933

Sergei Golubchik. MariaDB  New Features.

ADC 2012

20

Optimizer
 Our main area of improvements  Original MySQL optimizer team  Lots of optimizations
 Disk access optimizations  Join optimizations  Subqueries (yeah!)  Derived tables  and many more...

Sergei Golubchik. MariaDB  New Features.

ADC 2012

21

Subqueries

 Finally useful
 Major improvements
 Different strategies
 Materialization  Semi-join
­ Table Pullout optimization ­ First Match execution strategy ­ Semi-join Materialization execution strategy ­ Loose Scan execution strategy ­ Duplicate Weed-out execution strategy
 Subquery cache

Sergei Golubchik. MariaDB  New Features.

ADC 2012

22

Subqueries

655,55 140

3600

3770

120

100 88
80

60

40

45

36

43

40

MySQL 5.5 MariaDB 5.5

20 9,04
0 materialization

0,43

2

2

pullout

materialization semi-join

subquery cache

duplicate weed-out

materialization with NULLs

by MariaDB Optimizer Team. http://en.oreilly.com/mysql2011/public/schedule/detail/20238

Sergei Golubchik. MariaDB  New Features.

ADC 2012

23

Derived tables

 Merge

 Materialization with indexes

450

400

397

350

300

260

254

250

200

MySQL 5.5 MariaDB 5.5

150

100

50

45

0 merge

materialization with indexes

by MariaDB Optimizer Team. http://en.oreilly.com/mysql2011/public/schedule/detail/20238

Sergei Golubchik. MariaDB  New Features.

ADC 2012

24

Disk access optimizations

 Index Condition Pushdown

 Multi-Read Range

 InnoDB Extended keys

2000

6258

1800

1600

1400

1200

1000

800

600

490 471

400

200

0 index condition pushdown

14400 1352,74
412,28 multi-read range

574 601
67 extended keys

MySQL 5.5.25 GA MySQL 5.6.6-m9 MariaDB 5.5.25 GA

Sergei Golubchik. MariaDB  New Features.

ADC 2012

25

Joins
 Block Nested Loop  Block Nested Loop Hash  Batch Key Access (Block Index join)  Batch Key Access Hash  lots of smaller optimizations

Sergei Golubchik. MariaDB  New Features.

ADC 2012

26

Joins

500

32077

450

400

350

300

250 219
200

150

100

50

33

0 hash join

250
30 7
nested loop join

Sergei Golubchik. MariaDB  New Features.

MySQL 5.5.25 GA MySQL 5.6.6-m9 MariaDB 5.5.25 GA

ADC 2012

27

Others
 index merge  instant explain  table elimination  fine-grained optimizer control

Sergei Golubchik. MariaDB  New Features.

ADC 2012

28

Plans & Goals

 MariaDB 10.0
 All of MySQL-5.6 features
 but some 5.6 features are more stable and more important than others
 we merge and release those first
 New features too
 UNION ALL optimization  SHOW EXPLAIN  even faster group commit  and many more...

Sergei Golubchik. MariaDB  New Features.

ADC 2012

29

Support

 Monty Program AB
 Engineering  L3 level support
 Partners
 L1 and L2 support, 24x7, consulting, training  SkySQL  Percona, Open Query, and many others
 Original MySQL AB employees, with more than 10 years of experience

Sergei Golubchik. MariaDB  New Features.

ADC 2012

30

Contact us

 MariaDB.org, AskMonty.org, MontyProgram.com  Knowledge Base: kb.askmonty.org  Mailing lists: Launchpad
 maria-discuss@lists.launchpad.net  maria-developers@lists.launchpad.net
 IRC: #maria channel on FreeNode  Jira: mariadb.org/jira
 New features and feature requests  Bug tracker  Release plans

Sergei Golubchik. MariaDB  New Features.

ADC 2012

31

Questions?

Thank you!

