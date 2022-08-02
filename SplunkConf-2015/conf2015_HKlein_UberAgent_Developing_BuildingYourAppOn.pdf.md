· · · · ·

·
·
· ·
·
·

·
·
·
·

·

·
· ·

·

·
·
· ·

·
·
· · ·

·

·
·

·
·
·
· ·

·
· ·
·
·

·
·
· ·
·
· ·

·
·

·
| tstats summariesonly=t min(_time) as min, max(_time) as max count from datamodel=uberAgent
| eval "Start time"=strftime(min, "%c") | eval "End time"=strftime(max, "%c") | eval "Event count"=count | fields "Start time" "End time" "Event count"

·
| tstats summariesonly=t min(_time) as min, max(_time) as max count from datamodel=uberAgent
| eval "Start time"=strftime(min, "%c") | eval "End time"=strftime(max, "%c") | eval "Event count"=count | fields "Start time" "End time" "Event count"

·
[uberAgent] acceleration = 1 acceleration.earliest_time = -1w

· ·
· ·

·

·
· ·
·
· ·

·
· ·
·
· ·

· · ·
· · ·

·

·

·

| tstats sum("Process_ProcessDetail.ProcIOReadCount") AS "Sum of ProcIOReadCount" from datamodel=uberAgent.Process_ProcessDetail where (nodename = Process_ProcessDetail) groupby "Process_ProcessDetail.ProcName" prestats=true
| stats dedup_splitvals=t sum("Process_ProcessDetail.ProcIOReadCount") AS "Sum of ProcIOReadCount" by "Process_ProcessDetail.ProcName"
| sort limit=100 "Process_ProcessDetail.ProcName" | fields - _span | rename "Process_ProcessDetail.ProcName" AS ProcName | fields ProcName, "Sum of ProcIOReadCount"

| tstats sum("Process_ProcessDetail.ProcIOReadCount") from datamodel=uberAgent.Process_ProcessDetail where (nodename = Process_ProcessDetail) groupby "Process_ProcessDetail.ProcName" prestats=true
| stats dedup_splitvals=t sum("Process_ProcessDetail.ProcIOReadCount") as "Sum of ProcIOReadCount" by "Process_ProcessDetail.ProcName"

| tstats sum("Process_ProcessDetail.ProcIOReadCount") from datamodel=uberAgent.Process_ProcessDetail where (nodename = Process_ProcessDetail) groupby "Process_ProcessDetail.ProcName" prestats=true
| stats dedup_splitvals=t sum("Process_ProcessDetail.ProcIOReadCount") as "Sum of ProcIOReadCount" by "Process_ProcessDetail.ProcName"

| tstats sum("Process_ProcessDetail.ProcIOReadCount") from datamodel=uberAgent.Process_ProcessDetail where (nodename = Process_ProcessDetail) groupby "Process_ProcessDetail.ProcName" prestats=true
| stats dedup_splitvals=t sum("Process_ProcessDetail.ProcIOReadCount") as "Sum of ProcIOReadCount" by "Process_ProcessDetail.ProcName"

| tstats sum("Process_ProcessDetail.ProcIOReadCount") from datamodel=uberAgent.Process_ProcessDetail where (nodename = Process_ProcessDetail) groupby "Process_ProcessDetail.ProcName" prestats=true
| stats dedup_splitvals=t sum("Process_ProcessDetail.ProcIOReadCount") as "Sum of ProcIOReadCount" by "Process_ProcessDetail.ProcName"

| tstats sum("Process_ProcessDetail.ProcIOReadCount") from datamodel=uberAgent.Process_ProcessDetail where (nodename = Process_ProcessDetail) groupby "Process_ProcessDetail.ProcName" prestats=true
| stats dedup_splitvals=t sum("Process_ProcessDetail.ProcIOReadCount") as "Sum of ProcIOReadCount" by "Process_ProcessDetail.ProcName"

| tstats sum("Process_ProcessDetail.ProcIOReadCount") from datamodel=uberAgent.Process_ProcessDetail where (nodename = Process_ProcessDetail) groupby "Process_ProcessDetail.ProcName" prestats=true
| stats dedup_splitvals=t sum("Process_ProcessDetail.ProcIOReadCount") as "Sum of ProcIOReadCount" by "Process_ProcessDetail.ProcName"

· · ·

·

·

·

| pivot uberAgent Process_ProcessDetail sum(ProcIOReadCount) as "Sum of ProcIOReadCount" splitrow ProcName as ProcName sort 100 ProcName rowsummary 0 colsummary 0 numcols 0 showother 1

| pivot uberAgent Process_ProcessDetail sum(ProcIOReadCount) as "Sum of ProcIOReadCount" splitrow ProcName as ProcName

| pivot uberAgent Process_ProcessDetail sum(ProcIOReadCount) as "Sum of ProcIOReadCount" splitrow ProcName as ProcName

| pivot uberAgent Process_ProcessDetail sum(ProcIOReadCount) as "Sum of ProcIOReadCount" splitrow ProcName as ProcName

| pivot uberAgent Process_ProcessDetail sum(ProcIOReadCount) as "Sum of ProcIOReadCount" splitrow ProcName as ProcName

·
·
· · · ·

· · ·

