Copyright*©*2015*Splunk*Inc.*
Hunk*Performance* and*TroubleshooFng* best*pracFce*
Raanan*Dagan* Praveen*Burgu* *

Disclaimer*
During*the*course*of*this*presentaFon,*we*may*make*forward*looking*statements*regarding*future* events*or*the*expected*performance*of*the*company.*We*cauFon*you*that*such*statements*reflect*our* current*expectaFons*and*esFmates*based*on*factors*currently*known*to*us*and*that*actual*events*or* results*could*differ*materially.*For*important*factors*that*may*cause*actual*results*to*differ*from*those*
contained*in*our*forwardNlooking*statements,*please*review*our*filings*with*the*SEC.*The*forwardN looking*statements*made*in*the*this*presentaFon*are*being*made*as*of*the*Fme*and*date*of*its*live* presentaFon.*If*reviewed*aQer*its*live*presentaFon,*this*presentaFon*may*not*contain*current*or* accurate*informaFon.*We*do*not*assume*any*obligaFon*to*update*any*forward*looking*statements*we*
may*make.** *
In*addiFon,*any*informaFon*about*our*roadmap*outlines*our*general*product*direcFon*and*is*subject*to* change*at*any*Fme*without*noFce.*It*is*for*informaFonal*purposes*only*and*shall*not,*be*incorporated* into*any*contract*or*other*commitment.*Splunk*undertakes*no*obligaFon*either*to*develop*the*features*
or*funcFonality*described*or*to*include*any*such*feature*or*funcFonality*in*a*future*release.*
2*

Who*are*you?*
· Raanan*Dagan*N*Sr.*SE,*Big*Data*specialist* · Praveen*Burgu*­*Sr.*SoQware*Engineer*
3*

Agenda*
­ Performance* ! 10*ways*to*opFmize*Hunk*search*performance:*MR*Jobs,* Timestamp*ExtracFon,*Caching**
­ Troubleshoot** ! Inspect*search*job*issues:*MR*Jobs,*Performance,* Timestamp*
*

4*

Do*not*distribute*

Hunk*Performance*

Hunk Performance Main Points
1. Run MR Jobs 2. HDFS Storage 3. VIX with Timestamp / indexes.conf 4. File Format 5. Compression types / File size 6. Event breaking / Props.conf 7. Report Acceleration 8. Hardware 9. Search Head Clustering 10.Other Flags (Threads, Splits)

6*

Do*not*distribute*

#1:*Make*Sure*you*use*MR*Jobs*

Not*MR*Jobs*­*Just*Splunk* "  Index=xyz**** ** Not*MR*Jobs*­*Just*Splunk* "  Index=xyz*|*stats*count**and*using*Verbose*Mode* ** Yes,*this*will*run*MR*Jobs* "  Index=xyz*|*stats*count**and*using*Smart*Mode* **

Allows*you*to*use*the*Power*of* Hadoop*MR*Jobs*parallel* processing**

7*

#*2:*HDFS*Storage**

This*is*BAD* "  /data/root/dir/...* ** This*is*GOOD* "  /data/root/dir/2014/10/01/....* "  /data/root/dir/2014/10/02/....* ** This*is*BETTER* "  /data/root/dir/2014/10/01/app=apache/...*** "  /data/root/dir/2014/10/01/app=mysql/...*

Allows*you*to*bring*subset*of* data*from*HDFS*based*on*Fme*
extracFon**

8*

#*3:*VIX*with*Timestamp*/*Indexes.conf**

HDFS5=5/user/splunk/data/20141123/14/SFServer/myfile.gz5

*[hadoop]**

vix.provider*=*MyHadoopProvider** vix.input.1.path*=*/user/splunk/data/*/*/${server}/...** vix.input.1.accept*=*\.gz$** vix.input.1.et.regex*=*.*?/data/(\d+)/(\d+)/.*?.gz**

Time*extracFon*will*enable*you* to*use*the*Time*Picker*in*the* Hunk*UI*to*bring*Subset*of*the* data**

vix.input.1.et.format*=*yyyyMMddHH**

vix.input.1.et.offset*=*0**

vix.input.1.lt.regex*=*.*?/data/(\d+)/(\d+)/.*?.gz**

vix.input.1.lt.format*=*yyyyMMddHH**

vix.input.1.lt.offset*=*3600**

9*

#4:*File*Format**

"  Don't*add*mulFple*sources*into*one*file**
*
"  Use*a*selfNdescribing*format*for*the*data*whenever* possible;*e.g.*json,*avro,*csv,*Parquet,*ORC,*RC,*etc.*
*
"  If*using*a*log*file,*look*at*this*list*for*Splunk*Known* Source*Types*(sourcetype=access_combined)** hzp://docs.splunk.com/DocumentaFon/Splunk/ latest/Data/Listofpretrainedsourcetypes*
"  Look*at*the*Splunk*App*Store*for*600*other*opFons* to*break*the*events*/*fields*hzp://apps.splunk.com*

Hunk*will*benefit*if*the*file*has* some*structure.**Otherwise*we* will*need*to*use*REGEX*to*extract*
fields**

10*

#5:*Compression*type*/*File*size**

This*is*BAD*(Large*NonNsplizable)** "  500MB*GZ*file* ** This*is*BAD*(too*many*MR*Jobs)* "  10,000*X*1kb*files* ** This5is5GOOD5(Large*spilizable)* "  500MB*LZO*or*Snappy*file* ** This5is5GOOD5(NonNsplizable,*but*1*MR*per*file)* "  127MB*or*63MB*GZ*file*
11*

To*avoid*too*many*MR*Jobs,*or* running*out*of*memory*make*
sure*to*use*the*correct* compression*or*file*size**

#6:*IndexNFme*pipeline*processing*
hzp://docs.splunk.com/DocumentaFon/Hunk/latest/Hunk/PerformancebestpracFces*

Default55 MLA55
MLA5+5LM5 MLA5+5LM5+5TP5 MLA5+5LM5+5TF5 MLA5+5LM5+5TF5+5TP55 MLA5+5LM5+5TF5+5AP55
0*

515 515 445
20*

1905 1795 1055 1055

~4X*

MLA:%MAX_TIMESTAMP_LOOKAHEAD%=%30%% TP:%%TIME_PREFIX%=%^%% TF:%%TIME_FORMAT%=%%a,%%d%%b%%Y%%H:%M:%S%%Z%% LM:%%SHOULD_LINEMERGE%=%false%% AP:%%ANNOTATE_PUNCT%=%false%%%

40*

60*

80*

100*

120*

140*

160*

180*

200*

Time*(s)*

12*

#7:*Report*AcceleraFon**
Report*acceleraFon*will*improve* performance*­*Bring*data*from*
Cache*
NOTE:* vix.env.HADOOP_HEAPSIZE*=* 1024*or*above**
13*

Splunk*and*Hadoop*N*Caching*opFons*

14*

Do*not*distribute*

#8:*Hardware*

Dedicated5search5head5 · Intel*64Nbit*chip*architecture* · 4*CPUs,*4*cores*per*CPU,*at*least*2*Ghz*per*core* · 12*GB*RAM* · 2*x*300*GB,*10,000*RPM*SAS*hard*disks,*configured*in*RAID*1* · Standard*1Gb*Ethernet*NIC,*opFonal*2nd*NIC*for*a*
management*network* · Standard*64Nbit*Linux** 5 Data5Nodes*=*The*SplunkD*indexer*is*installed,*by*default,*on*each* data*node*`/tmp/splunk'*directory.**You*just*need*to*make*sure* you*have*about*40MB,*or*more,*space*in*that*directory*5

A*good*Hardware*with*mulFple* cores*can*be*very*beneficial*to* interact*with*hundreds*of*end*
users**

15*

#9:*Search*Head*Clustering*

Hunk*/*Hadoop*Client*

Add*Many*Concurrent*Users*

1. No*Single*Point*of*Failures*=*Dynamic*Captain* 2. "One*ConfiguraFon"*across*SH*=*AutomaFc*Config*replicaFon** 3. Horizontal*Scaling*=*Ability*to*add*/*remove*SH*nodes*on*running*
cluster5

16*

#10:*Other*OpFmizaFon*Flags*
Number5of5Jobs:5 · vix.splunk.search.mr.threads*****N*#*of*threads*to*use*when*reading*map*results*from*HDFS* · vix.splunk.search.mr.maxsplits***N*maximum*number*of*splits*in*an*MR*job*(Default*to*10000)* * Number5of5copies5to5each5data5node:5 · vix.splunk.setup.bundle.setup.Vmelimit****N*Fme*limit*in*ms*for*seÅng*up*bundle*on*TT* · vix.splunk.setup.bundle.replicaVon********N*set*custom*replicaFon*factor*for*bundle*on*hdfs* · vix.splunk.setup.package.replicaVon*******N*set*custom*replicaFon*factor*for*splunk*package*on*hdfs* * VIX5overrides:55 · vix.input.[N].recordreader5N*list*of*recordreaders*to*use*when*processing*this*input,*these*RR*are*
tried*before*those*at*the*provider*level.*For*example,*ImageRecordReader*­*PCapRecordReader*­* ZipRecordReader*­*EncrypFonRecordReader** · vix.input.[N].spli\er5­*For*example,*ParquetSplitGenerator** · vix.input.[N].required.fields5­*For*example,*In*smart*mode*always*extract*Timestamp*field**
17*

Hunk*TroubleshooFng*

Troubleshooting Main Points
1. Hunk UI shows errors 2. Search.log to debug Hunk / Hadoop
client issues 3. Hadoop logs to debug Hadoop Server
issues 4. Job -> Inspect Job to debug many
performance issues

19*

Do*not*distribute*

Troubleshooting ­ Enable Debugging
Each log line in the file that involves Hunk ERP operations is annotated with ERP.<provider>... and contains links for spawned MR job(s). You may need to follow these links to troubleshoot MR issues. To enable more detailed logging and monitoring flow modes, edit the following parameters in the provider setting:
By*default,*Hunk*makes*the*best*effort*to*prune*unnecessary*columns/fields*to*improve*search*performance.* For*debugging,*you*can*turn*this*off*and*have*ERP*return*all*columns*to*Hunk*to*do*the*filtering*and*final*processing*at* the*search*head.*
By*seÅng*to*1,*search.log*will*have*DEBUG*level* logging*events.*
By*default,*Hunk*searches*run*in*mixed*mode.* To*disable,*set*the*value*to*0.*

20*

Do*not*distribute*

Example*#*1,*No*MapReduce*Job*in*Hadoop*
21*

TroubleshooFng*­*No*Map*Reduce*Job*
To*check*if*a*MapReduce*job*is*working,*you*can* append*a*reporFng*search*job.*
22*

Find*search.log*

1*
In*this*example,*a*search*returns*some*results*but*it* seems*like*it*is*stuck*aQer*the*iniFal*streaming* results.*Just*the*fact*that*it*has*returned*some* result*indicates*that*Hunk*can*access*data*in*HDFS.**

2*
If*you*encounter*an*error*while*running*a*basic* search,*you*can*find*a*complete*search*job*detail*in* the*job*inspector.*

If*you*encounter*issues*while*building*your*reports,* search.log*is*the*place*to*look.*You*can*access* the*file*via*the*job*inspector.*
3*
23*

In*Search.log*­*Pinpoint*the*error*
Hunk*log*lines*are*denoted*with*ERP.*followed*by*a* provider*name.*In*this*example,*a*job*was* submized*and*Hunk*is*contacFng* ResourceManager*(YARN).*

In*Search.log*­*Pinpoint*the*error*
However,*it*looks*like*Hunk*cannot* connect*to*the*ResourceManager.*
25*

Error*will*be*display*in*UI*and*search.log*
Eventually*repeated*azempts*failed* and*the*ERP*throws*an*excepFon.*
And*the*error*message*is*shown*on*the* parFal*results*page*indicaFng*that*the* MapReduce*job*was*unable*to*start.* You*suspect*that*maybe*the* ResourceManger*node*is*down*and*so* you*contact*the*Hadoop*administrator.*
26*

Troubleshoot*Hadoop*Server*issues**

A*Hadoop*administrator*checks*the* ResourceManager*and*finds*that*the* node*is*running*and*no*job*from*Hunk* has*been*queued.* With*that*informaFon,*you*can*narrow* down*the*issue*to*a*network* connecFon*or*a*Hunk*configuraFon* error.*

In*this*example,*the*culprit*was*misconfigured*address*to*the*ResourceManager.* AQer*fixing*the*address,*the*job*was*able*to*complete*successfully.* For*more*examples*of*error*message,*check:* hzp://docs.splunk.com/DocumentaFon/Hunk/latest/Hunk/TroubleshootHunk* *

27*

Example*#*2,*Real*World*N*Bad*Performance*
28*

No*MapReduce*Job*=*Not*a*Good*start*
Steam.bytes*=*Splunk*generate*results*

Yes,*MapReduce*Job*=*Bezer*
report.bytes*=*Hadoop*generate*results* MR.SPLK*=*Leverage*Hadoop*

Examine*HDFS*Storage*
Hadoop.dirs*/*files*.listed*=*How*many*directories*Splunk* need*to*scan*

VIX*with*Timestamp*on*the*files*=*Not*great*
Scan*8,760*files*­*filter*out*8,688*=*Only*72*files*used*for*search* RecommendaFon*is*to*build*Timestamp*on*Directories*

NoNSplizable*Very*Large*File*=*Bad*
1*MR*Job*for*very*large*file*is*not*ideal*

YesNSplizable*Very*Large*File*=*Good*
MulFple*Jobs*means*we*leverage*Hadoop*parallel*system*

Report*AcceleraFon*=*Great*
cache.bytes*=*HDFS*results*(No*need*for*MR)*

Summary*

Summary*N*Performance*
1. Run MR Jobs 2. HDFS Storage 3. VIX with Timestamp / indexes.conf 4. File Format 5. Compression types / File size 6. Event breaking / Props.conf 7. Report Acceleration 8. Hardware 9. Search Head Clustering 10.Many Other Flags (Threads, Splits)

37*

Do*not*distribute*

Summary*N*TroubleshooFng*
1. Hunk UI shows errors 2. Search.log to debug Hunk / Hadoop client
issues 3. Hadoop logs to debug Hadoop Server
issues 4. Job -> Inspect Job to debug many
performance issues

38*

Do*not*distribute*

THANK*YOU*

Common*Issues*We*See*

Issue5 Performance* Memory*
Heartbeat*

Clue5for5Issue5 Job*takes*a*long*Fme*
No*Error!*Job*is*just*hanging*..*
In*the*search.log*you*will*see*"operaFon* took*longer*than*the*heartbeat*interval"*

PotenVal5SoluVon5
Most*likely*customer*is*not*running*MR*Jobs* Change*to*index*=*xyz*|*stats*count*by*xyz*+*smart*mode*
Lower*vix.mapred.job.map.memory.mb*=*1024* OR* Increase*the*memory*on*the*Hadoop*side*
vix.splunk.heartbeat*=*0* *

Timestamp*/*Fields* ExtracFon*in*Smart* Mode*

Events*are*not*showing*correctly*

vix.input.[N].required.fields*=*Timestamp* Or* Props.conf*

Hive*Jars*missing*or*Hive* In*search.log*you*will*see*ExcepFon*in* Add*Jars*to*vix.env.HUNK_THIRDPARTY_JARS*

issues*

thread*"main"*java.lang.NoSuchFieldError*** Or*

Look*in*answers*for*Hive**

Data*nodes*/tmp*

In*Hadoop*logs*(not*in*Splunk*logs)*you*

directory*will*not*install* will*see*permission*or*issues*wriFng*to*/

SplunkD*

tmp/splunk**

Change*vix.splunk.home.hdfs* Or* Fix*permission*/*size*

40*

