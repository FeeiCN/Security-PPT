Splunk 
Observations and Recommendations
Simeon Yep | AVP GSA Brian Wooden | GSA Partner Integrations

© 2017 SPLUNK INC.

 
  (Index) ·  · 
  (Search) ·  · 



© 2017 SPLUNK INC.


· 
Ø Splunk pipelines
· 
Ø metrics
·  · 
Ø metrics, 

© 2017 SPLUNK INC.

© 2017 SPLUNK INC.
 (indexing)
Pipelines, queue, and tests

(Pipeline)

© 2017 SPLUNK INC.

(Pipeline)

© 2017 SPLUNK INC.

(Pipeline)

© 2017 SPLUNK INC.



© 2017 SPLUNK INC.



© 2017 SPLUNK INC.

·   

 MetricsCPU  IO

© 2017 SPLUNK INC.


· CPU
· ~17.6%, 4-5 CPU Cores
· IO
· 
· 
· 30MB/s

© 2017 SPLUNK INC.



© 2017 SPLUNK INC.

· Splunk 6.3+ indexer
· indexer
·  (CPU and I/O), 2 .
· 2. · 2 · 



© 2017 SPLUNK INC.

· 
· Splunk · 
· props.confevent breaking and timestamping 
·  (SSDs)  · CPU () 
· CPU

© 2017 SPLUNK INC.
 (Search)
Types & Tests



© 2017 SPLUNK INC.

· CPU-boundIO bound



© 2017 SPLUNK INC.



© 2017 SPLUNK INC.


o  (Dense)
· bucketevents index=web | stats count by clientip
o  (Sparse)
· bucketevents index=web some_term | stats count by clientip
o  (Rare)
· events index=web url=onedomain* | stats count by clientip

© 2017 SPLUNK INC.

 Metrics

© 2017 SPLUNK INC.


o CPU o 
o CPUSPL 
o CPU

© 2017 SPLUNK INC.

 Metrics

© 2017 SPLUNK INC.


o IO o  o CPU

© 2017 SPLUNK INC.

CPUIo

© 2017 SPLUNK INC.

o command.search.rawdata ~ CPU
§ : .kv, .typer, .calcfields
o command.search.index ~ Io



© 2017 SPLUNK INC.

o 
o  indexer o props.confevent breaking and timestamping o CPU
o 
o search head o 
· CPU · CPU
o 
· IO · 

Q&A

© 2017 SPLUNK INC.

