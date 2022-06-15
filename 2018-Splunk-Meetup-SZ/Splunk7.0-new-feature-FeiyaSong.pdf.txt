Splunk 7.0 

3/30/2018

© 2017 SPLUNK INC.

1.

2.
3.

© 2017 SPLUNK INC.

© 2017 SPLUNK INC.

Splunk 7.0 

 vs 

© 2017 SPLUNK INC.

 
·  ·  · "" ·  · 

  ·  ·  ·  ·  ·  CPU 




© 2017 SPLUNK INC.




system.cpu.idle





host=www.h1.com region=us-east-1 instancetype=d2.8xl

© 2017 SPLUNK INC.
Splunk  

 Splunk 
 
  · RBAC ·  · 
  ·  · 



© 2017 SPLUNK INC.

 (Field) metric_name
_time _value <  A>... <  Z>



© 2017 SPLUNK INC.

    







os.cpu.idle

  UNIX 

1505322000

 

41.1234



Field: ip;



Value: 10.2.1.166

 - mstats
  | mstats <stats-function> ... WHERE index=<metric_index> AND metric_name=<metricname> ... [span=<timespan>] [BY|GROUPBY <metricname|dimension>]
  <stats-function>  _value  avg(), count(), max(), median(), min(), sum()...
 

© 2017 SPLUNK INC.

 - mstats
| mstats avg(_value) WHERE metric_name="network.*" span=10s BY metric_name | timechart avg(_value) span=10s BY metric_name | rename network.rx AS In, network.tx AS Out | eval Out = -Out

© 2017 SPLUNK INC.



 SPL ­ mcatalog   metric_name  dimension
  
(e.g.  ,  )  
| mcatalog values(<field>) ... [ WHERE index=<metric_index>
AND metric_name=<metricname> ...] [ BY <metricname|dimension>]

 REST endpoint
· 
/services/catalog/metricstore/metrics
·  :
/services/catalog/metricstore/dimensions
·  :
/services/catalog/metricstore/dimensions /{name}/values

© 2017 SPLUNK INC.



 StatsD
·  TCP/UDP 
· StatsD line metric protocol
<metric_name>:<_value>|<metric_type>| #dim1:valueX,dim2:valueY

 csv 

 CollectD ·  write_http  ·  HTTP Event Collector 

  source type · props.conf · transforms.conf

© 2017 SPLUNK INC.


  50%    20    100 

© 2017 SPLUNK INC.

© 2017 SPLUNK INC.

Splunk 7.0 


     

© 2017 SPLUNK INC.

© 2017 SPLUNK INC.

Splunk 7.0 

50%


 TA  Splunk 
index scan raw data & decompression field extraction auto lookup
typer
tagger

time

© 2017 SPLUNK INC.

 - DIRECTIVES

© 2017 SPLUNK INC.

  Tags  Eventtypes  ·  Tags  Eventtypes  ·  Splunk  TA  50% 
 Splunk7.0  Tags/Eventtypes · search 500 DIRECTIVES(REQUIRED_TAGS(tags="foo, bar")) · search 500 DIRECTIVES(REQUIRED_EVENTTYPES(eventtypes="alpha,omega"))
 
· search 500
DIRECTIVES(REQUIRED_EVENTTYPES(eventtypes="alpha,omega"),REQUIRED_TAGS(tag s="foo,bar"))
 
·  · 

© 2017 SPLUNK INC.

Splunk 7.0 


    SPL   

© 2017 SPLUNK INC.


      (.tsidx)  

© 2017 SPLUNK INC.

25
TIME 20
15 10
5 0


Indexers

© 2017 SPLUNK INC.



© 2017 SPLUNK INC.

25
TIME 20
15 10
5 0

Indexers

25min
DELAY
7min

 (Data Model Acceleration)

 Splunk 7.0  ·  ·  indexer 
  ·  /  acceleration.max_time  ·  · 
(  acceleration.poll_buckets_until_maxtime=true)
  · Splunk 7.0  · Splunk 7.0  50  · 

© 2017 SPLUNK INC.

© 2017 SPLUNK INC.

Splunk 7.0 

 (Cardinality) 
 Parallel Reduce
  · search tag=authentication | stats sum(bytes) by host
  host 

© 2017 SPLUNK INC.

Parallel Reduce 

© 2017 SPLUNK INC.

Parallel Reduce 

© 2017 SPLUNK INC.

 (Cardinality) 
 Parallel Reduce
  · search tag=authentication | stats sum(bytes) by host
  host   Splunk 7.0 
·  ·  limits.conf  phased_execution=true ·  | noop phase_mode=3
·  stats, transaction  tstats  

© 2017 SPLUNK INC.

© 2017 SPLUNK INC.

Splunk 7.0 



© 2017 SPLUNK INC.

  (Projection Elimination) · search ERROR | eval x=a*b | lookup users uid OUTPUT username | stats count by host · search ERROR | stats count by host

  (Predicate Splitting) · | eval x=a+b | where x>10 and y<10 · | where y<10 | eval x=a+b | where x>10

  eval  · | eval x=a+b | eval y=c+d · | eval x=a+b, y=c+d


  ·  ·  · TA 
  · 4   meetup 

© 2017 SPLUNK INC.

© 2017 SPLUNK INC.
Q&A

