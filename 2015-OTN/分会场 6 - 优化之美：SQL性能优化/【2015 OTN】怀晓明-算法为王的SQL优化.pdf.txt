 SQL



· Who am I ·  ·  ·  ·  · SQL · "" · 

Who am I
· Lastwinner@itpub.net · ----OracleDBA2 · Troubleshooter


· 
­ ITIT ­  ­ ""
 ­ IT ­ 


· 
­  ­ 
· 
­ 
· 
­  ­ ...... ­ 


· 
­  ­ SQL


·  · ·  ·  ·  · SQL

--
OS
 

SQL

--
·  ·  ·  ·  · ......

--
·  ·  ·  ·  ·  · ......

--
·  ·  ·  · ......

--
·  ·  · 
­ stats ­ CBO ­ hint ­ ......
·  · ......

--SQL
·  ·  · SQL · SQL · SQL · SQL · SQL · SQL......

--SQL
· SQL · 

--SQL 
· select sii.P_Name processName, sii.PID processId, sii.VID versionId, (nvl(max(t.ciid), 0)+nvl(max(queueMember.ciid), 0)+nvl(max(s.ciid), 0)+nvl(max(abs.ciid), 0)) totalTask from (select SI.*, IP.P_Name as P_Name from (select Current_Process_Id as PID, Current_Version_Id as VID, Step_ID as SID from step_info where step_status in (1, 6)) SI left join Installed_Process IP on SI.PID = IP.Process_ID and SI.VID = IP.Version_ID ) sii left join (select Current_Process_Id, Current_Version_Id, count(v2.Incident_Id) ciid from step_info v2 where getTaskPerformer(Belong_to, Assign_to, Escalation_to)=7785 and Current_Process_Id>0 and Current_Version_Id>0 AND step_status in (1, 6) group by Current_Process_Id, Current_Version_Id) t on sii.pid=t.Current_Process_Id and sii.vid=t.Current_Version_Id left join (select Current_Process_Id, Current_Version_Id, count(v2.Current_Process_Id) ciid from step_info v2, Queue_Member q where (v2.TaskFlag ='Q' and v2.urlid=q.urlid and q.User_Num= 7785) and QPICKUP <> 'Y' and Current_Process_Id>0 and Current_Version_Id>0 AND step_status in (1, 6) group by Current_Process_Id, Current_Version_Id) queueMember on sii.pid=queueMember.Current_Process_Id and sii.vid=queueMember.Current_Version_Id left join (select Current_Process_Id, Current_Version_Id, count(v2.Incident_Id) ciid from step_info v2 where step_status=4 and getTaskPerformer(belong_to, assign_to, escalation_to)=7785 and Current_Process_Id>0 and Current_Version_Id>0 group by Curre nt_Process_Id, Current_Version_Id) s on sii.pid=s.Current_Process_Id and sii.vid=s.Current_Version_Id left join (select Current_Process_Id, Current_Version_Id, count(v2.Incident_Id) ciid from step_info v2 where assign_to > 0 and belong_to =7785and belong_to= assign_by and escalation_to is null and Current_Process_Id>0 and Current_Version_Id>0 AND step_status in (1, 6) group by Current_Process_Id, Current_Version_Id) abs on sii.pid=abs.Current_Process_Id and sii.vid=abs.Current_Version_Id where (t.ciid is not null or queueMember.ciid is not null or s.ciid is not null or abs.ciid is not null) group by sii.pid, sii.vid, sii.P_Name order by nlssort(sii.P_Name, 'NLS_SORT=SCHINESE_PINYIN_M')

--
·  · 

--

--

--

--

--

--

--
· SQL · 
­  ­ 

--SQL

--

· 

­ SEGMENT_NAME MB

­ DEPART

20

­ CHANNEL

8

· block

­ TABLE_NAME NUM_ROWS AVG_ROW_LEN MB

­ DEPART

28810

154

4.2

­ CHANNEL 28390

237

6.4

· SQL
­ SQLSQL 10
­ 

--

--
·  · 

--SQL

--

--
· 
­ SQL
· a. 0.25 · b. 94.5 · c. 1183 · d. 40040 · e. 3.51

--
·  · join ·  · 

SQL
· SQL · SQL · SQL
­ SQLSQL60% ­ 25% ­ 7% ­ 8%
· SQLSQL

SQL
· SQL
­ SQL ­ SQL ­ SQLSQL


SQL
· SQL
­  ­  ­ 
· RACCPU 128  

SQL
· SQL

Who am I
· 2012 SQL · 2013 SQL

SQL
· SQL
­ SQL ­  ­  ­  ­ HR@enmotech.com
· 
­  SQL ­  SQL ­  SQL

""--SQL

""--

""--

""--
· 


· =+ · SQLSQL
· SQL  

