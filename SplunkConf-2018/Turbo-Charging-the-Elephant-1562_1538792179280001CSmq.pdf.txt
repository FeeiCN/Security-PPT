Turbo Charging the Elephant
Search Performance Optimization Techniques for Splunk Analytics for Hadoop
Holger Sesterhenn | Staff Sales Engineer Raanan Dagan | Principal Architect
2018-08-30 | Orlando, FL

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Who we are

© 2018 SPLUNK INC.

Holger Sesterhenn  Staff Sales Engineer
from Germany  With Splunk for 6 years  Focus on large accounts
and complex architecture  Loves craft beer  Enjoys Marvel movies  Pretends to do sports... sometimes

Raanan Dagan
 Principal Architect, Open Source
 Focused on open source technologies & integration
 20+ years of experience building large scale data platforms
 Joined Splunk in 2012
 Avid soccer (football) player

© 2018 SPLUNK INC.
Splunk and Hadoop
What is slow and why it`s different?

© 2018 SPLUNK INC.
"Splunk Enterprise is optimized for time
serialized data using an index ­ Hadoop/HDFS/MR are for batch processing"
Don`t mix the use cases!

© 2018 SPLUNK INC.
The Basics

Splunk Analytics and Hadoop
What we are doing

© 2018 SPLUNK INC.

 Main use case = Analyze Hadoop Data using Hadoop Processing (HDFS+MR) · It's just the search head... no Splunk Indexers anymore, but you can go hybrid
 Connect Splunk SH to Hadoop Cluster using a provider · You can connect multiple Hadoop Clusters to one Splunk SH
 Define a virtual index (VIX) for every data source you want to search · Usually you don't mix different sourcetypes in the same file/directory
 Schema on read is still used · props.conf and transforms.conf can be used to extract fields of interest

Use your SPL foo to search your data lake

UseCase: Windfarm

© 2018 SPLUNK INC.

Example Virtual Index
Connect a Hadoop HDFS cluster with a Splunk Analytics SearchHead

© 2018 SPLUNK INC.

HDFS = /user/splunk/datalake/windfarm/20180824/09/windmill01/power.gz
[windfarm] vix.provider = MyHadoopProvider vix.input.1.path = /user/splunk/datalake/windfarm/*/*/${windmill}/... vix.input.1.accept = \.gz$ vix.input.1.et.regex = .*?/datalake/windfarm/.*/(\d+)/(\d+)/.*?.gz vix.input.1.et.format = yyyyMMddHH vix.input.1.et.offset = 0 vix.input.1.lt.regex = .*?/datalake/windfarm/.*/(\d+)/(\d+)/.*?.gz vix.input.1.lt.format = yyyyMMddHH vix.input.1.lt.offset = 3600

http://docs.splunk.com/Documentation/Splunk/latest/HadoopAnalytics/Virtualindexes

© 2018 SPLUNK INC.
Running a Splunk Analytics Search in Hadoop
Streaming, Hadoop MR and the like
1. index=windfarm | head 1000 · A streaming search: just reading files from HDFS and stream them back to the splunkd
process
2. index=windfarm | stats count by windmill (smart mode) · Read some files directly from HDFS - return results immediately / event timeline updates · Start MR jobs to search the majority of files (higher increments of events processed)
3. index=windfarm | stats count by windmill (verbose mode) · Don`t start MR jobs at all! ONLY streaming!

Verify a MapReduce job is running
Screenshot of JobInspector/Logfile

© 2018 SPLUNK INC.

08-30-2018 10:25:18.413 INFO ERP.hdp25 - SplunkBaseMapper - using class=com.splunk.mr.input.SplunkLineRecordReader to process split=/user/root/data/windfarm/opc/20180804/12/Power/windfarm_03-20180804_12-Power.opc.txt.gz:0+24275

Behind the Scenes

© 2018 SPLUNK INC.

1. Splunk SH is creating search bundles for every Hadoop DataNode/TaskTracker
2. SplunkD process on every DataNode/TaskTracker either streams data or gets results from MapReduce jobs
3. SplunkD is processing the data (schema on read) and filters · Lookups are applied on the TaskTracker!
4. Data is sent back to Splunk SH (Hadoop Analytics)

This is a full event scan because there is no index (TSIDX) involved a lot of work to do if you just search for a "needle in a haystack" (AKA IP address e.g.)

DEMO 1
Examples Simple search Show logfiles/Job inspector

© 2018 SPLUNK INC.

Backup Screenshot
Simple search with lookup data

© 2018 SPLUNK INC.

Backup Screenshot
Loglines to show partition pruning
Search: index="windfarm" sourcetype=opc f_tag="Power"
08-30-2018 10:49:55.384 DEBUG ERP.hdp25 - VirtualIndex - Updating source in search context to a dir=/user/root/data/windfarm/opc/20180804/12/Power/ 08-30-2018 10:49:55.384 DEBUG ERP.hdp25 - VirtualIndex - Dir meets the search criteria. Will consider it, path=hdfs://172.17.0.1:8020/user/root/data/windfarm/opc/20180804/12/Power 08-30-2018 10:49:55.384 DEBUG ERP.hdp25 - VirtualIndex - Dir meets time heuristic path=hdfs://172.17.0.1:8020/user/root/data/windfarm/opc/20180804/12/Power, search.et=1533384000, search.lt=1533387600, file.et=1533384000, file.lt=1533387600, file.mtime=1534341390
08-30-2018 10:49:55.384 DEBUG ERP.hdp25 - VirtualIndex - Updating source in search context to a dir=/user/root/data/windfarm/opc/20180804/12/Wind_Speed/ 08-30-2018 10:49:55.384 DEBUG ERP.hdp25 - VirtualIndex - Dir does not meet the search criteria. Will not consider it, path=hdfs://172.17.0.1:8020/user/root/data/windfarm/opc/20180804/12/Wind_Speed
08-30-2018 10:49:55.469 DEBUG ERP.hdp25 - VirtualIndex - Dir meets the search criteria. Will consider it, path=hdfs://172.17.0.1:8020/user/root/data/windfarm/opc/20180804/10 08-30-2018 10:49:55.469 DEBUG ERP.hdp25 - VirtualIndex - Dir does not satisfy time heuristic, path=hdfs://172.17.0.1:8020/user/root/data/windfarm/opc/20180804/10, search.et=1533384000, search.lt=1533387600, file.et=1533376800, file.lt=1533380400, file.mtime=1534341389

© 2018 SPLUNK INC.

Best Practices - Part 1 -
Make sure the directory structure is useful
This is BAD  /datalake/user/dir/<allfiles>...
This is GOOD (use the time picker to prune directories)  /datalake/windfarm/opc/20180801/0900/<somefiles>....  /datalake/windfarm/opc/20180802/1000/<otherfiles>....
This is BETTER (automatic field extraction!)  /datalake/windfarm/${sourcetype}/20180801/0900/metric=power/<fewer files>...  /datalake/windfarm/${sourcetype}/20180801/1000/metric=wind_speed/<fewer files>...
Reduce the amount of files scanned/read from HDFS Structure by directory not by filename!
http://docs.splunk.com/Documentation/Splunk/latest/HadoopAnalytics/Setupvirtualindexes

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Get results faster

Want your dashboards fast? Cache is king
Overview of options
1. Splunk (scheduled) saved search · https://docs.splunk.com/Documentation/Splunk/latest/SearchReference/Loadjob · http://docs.splunk.com/Documentation/Splunk/latest/Report/Schedulereports

© 2018 SPLUNK INC.

2. Splunk summary index · Store the results of a search in Splunk Enterprise · http://docs.splunk.com/Documentation/Splunk/latest/Knowledge/Usesummaryindexing

3. Hadoop Analytics Report Acceleration · http://docs.splunk.com/Documentation/Splunk/latest/HadoopAnalytics/Workwithreportacceleration

4. Datamodel Acceleration, not just nice looking.. · http://docs.splunk.com/Documentation/Splunk/latest/HadoopAnalytics/Datamodelacceleration

© 2018 SPLUNK INC.
Hadoop Analytics Report Acceleration
Some more details
 You need a transforming search  Don`t work in verbose mode  Store the results in HDFS
· hdfs:///user/root/splunkmr702/cache/windfarm/d5b3fea992e7a90fabd20e71e2bf269c/_no_id/c
ompacts/78967737-5757-44e9-a8f2-e7d258e8b97f
 Files are stored in vix.splunk.search.cache.path  Works like Splunk Enterprise Report Acceleration
http://docs.splunk.com/Documentation/Splunk/latest/HadoopAnalytics/Configurereportacceleration

Hadoop Analytics Data Model Acceleration
Some more details

© 2018 SPLUNK INC.

 Configure a Splunk Enterprise Data Model · The constraint is using a VIX!
 Switch on accleleration · Mapreduce jos are running on a fixed schedule · Results are stored in ORC or Parquet file format
 Information about the DMA summary files stored in KV Store!  Actual DMA files are stored in HDFS  You can use ,,|tstats" to search
· http://docs.splunk.com/Documentation/Splunk/latest/HadoopAnalytics/Configuredatamodelacceleration

Hadoop Analytics DMA does not use TSIDX files!

The Windfarm Data Model
 Take fields from the lookup  No need to do a lookup on
TaskTracker anymore  Store summary in HDFS
structure  TSTATS will run MR jobs on
pre-computed summaries

© 2018 SPLUNK INC.

hdfs://localhost:8020/user/root/splunkmr702/datamodel/6026C1EB-B03C-405E-92F47EB40D25D0F0_DM_demo_hadoop_windfarm_windfarm/windfarm

DEMO 2
Examples Scheduled Search Accelereated Search Data Model

© 2018 SPLUNK INC.

Backup Screenshots
Scheduled Search

© 2018 SPLUNK INC.

Backup Screenshots
Accelerated vs. Non-Accelerated Dashboard Panel

© 2018 SPLUNK INC.

Backup Screenshots
Choropleth Example with Data Model

© 2018 SPLUNK INC.

Best Practices - Part 2 -
Choose the right method for your use case
 Summary Indexing and Saved Searches store data on the SH! · Fast but not flexible

© 2018 SPLUNK INC.

 Report Acceleration stores data on HDFS · Enough storage available · Not Flexible (only similar searches are accelerated) · Quite fast because just streaming no MR jobs

 Data Model Acceleration stores data on HDFS but creates summary files per original data file and spawn MR jobs
· More flexible but slower than Report Acceleration
· Remember, no TSIDX, no Random Access

© 2018 SPLUNK INC.
What if the elephant burbs?
How to troubleshot if something goes wrong

© 2018 SPLUNK INC.
Troubleshooting Splunk Analytics for Hadoop
 Open the JobInspector first! -> search.log (maybe create an input?)  Switch on debugging: vix.splunk.search.debug=1 (provider)  Doublecheck the provider settings (ports mixed?)  Check: does a simple search works? HDFS streaming
· index=hadoop|head 10  Hadoop resource manager web page checked ("All Applications")?
· Ressource Manager runs usually on <RM-IP>:8088/cluster  Monitor the YARN logs
· https://www.splunk.com/blog/2014/05/14/hunkonhunk.html
 https://conf.splunk.com/session/2015/conf2015_RDagan_Splunk_BigData_HUNKPerfo rmanceandTroubleshooting.pdf

© 2018 SPLUNK INC.
For Reference
If you want to read more...
· http://docs.splunk.com/Documentation/Splunk/latest/HadoopAnalytics/Performancebestpractic
es
· http://docs.splunk.com/Documentation/Splunk/latest/HadoopAnalytics/TroubleshootSplunkAna
lyticsforHadoop
· https://www.splunk.com/blog/2015/05/05/caching-hadoop-data-with-splunk-and-hunk.html

© 2018 SPLUNK INC.

Key Takeaways
This is where the subtitle goes

1. Understand your use case 2. Structure your data in HDFS 3. Cache is KING!

Happy splunking!!!

© 2018 SPLUNK INC.
Q&A

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

