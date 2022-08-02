© 2017 SPLUNK INC.
ITOpsSplunk
Apply Splunk Machine Learning in ITOps


Nate Smalley Andrew Stein

© 2017 SPLUNK INC.
Predictive, proactive and collaborative ML with Splunk ITSI
· IT · Security & Monitoring Tools Team · Splunk
· Splunk · 17

vs

© 2017 SPLUNK INC.



© 2017 SPLUNK INC.











  

 

 

 

 



© 2017 SPLUNK INC.











  

 

 

 

 

 



© 2017 SPLUNK INC.
 
We need more Machine Learning



© 2017 SPLUNK INC.


"" "" ""
­ 


"" "" ""
­ 


"" "" ""
­ AlphaGo

Splunk
çç

© 2017 SPLUNK INC.

  · predict · trendline, x11
  · anomalydetection
 

1. Splunk Core SPL

© 2017 SPLUNK INC.

anomalydetection
 | inputlookup products.csv

© 2017 SPLUNK INC.

anomalydetection
 | inputlookup products.csv | anomalydetection

© 2017 SPLUNK INC.

Splunk

© 2017 SPLUNK INC.

2. Splunk IT Service Intelligence


© 2017 SPLUNK INC.

Notable Event Aggregation
Event Clutter

© 2017 SPLUNK INC.

Notable Event Aggregation
Event Analytics

© 2017 SPLUNK INC.

Notable Event Aggregation Policy
Event Analytics

© 2017 SPLUNK INC.

Anomaly Detection

© 2017 SPLUNK INC.

Splunk

© 2017 SPLUNK INC.

3. Machine Learning Toolkit

© 2017 SPLUNK INC.

3. Machine Learning Toolkit

© 2017 SPLUNK INC.

© 2017 SPLUNK INC.

ITSI


 IT Service Intelligence · IT
 Splunk Machine Learning Toolkit · 
 Python for Scientific Computing · 

© 2017 SPLUNK INC.

ITSI - ServiceHealthScore
 Service => HealthScore  Service => KPIs  index=itsi_summary  =5

© 2017 SPLUNK INC.

index=itsi_summary

© 2017 SPLUNK INC.

| inputlookup service_kpi_lookup

© 2017 SPLUNK INC.



© 2017 SPLUNK INC.

index=itsi_summary | join kpiid [| inputlookup service_kpi_lookup | rename _key as serviceid title as service_name | eval kpi_info = mvzip('kpis._key', 'kpis.title', "==@@==") | fields kpi_info service_name serviceid | mvexpand kpi_info | rex field=kpi_info "(?<kpiid>.+)==@@==(?<kpi_name>.+)" | fields - kpi_info] | search service_name="Web Store Service" | timechart span=5m avg(alert_value) AS avg_value BY kpi_name | reverse | streamstats window=6 current=f first(`max_value: ServiceHealthscore') as ServiceHealthScoreFromFuture |reverse

ITSI ServiceHealth DataSet

© 2017 SPLUNK INC.


Splunk Machine Learning Toolkit

© 2017 SPLUNK INC.



© 2017 SPLUNK INC.



© 2017 SPLUNK INC.



© 2017 SPLUNK INC.



© 2017 SPLUNK INC.



© 2017 SPLUNK INC.

   0    R21


         

© 2017 SPLUNK INC.

Splunk & Machine Learning

© 2017 SPLUNK INC.

ML-API: Build Your own algorithms and import them into Splunk

© 2017 SPLUNK INC.
Q&A
Thank You!

