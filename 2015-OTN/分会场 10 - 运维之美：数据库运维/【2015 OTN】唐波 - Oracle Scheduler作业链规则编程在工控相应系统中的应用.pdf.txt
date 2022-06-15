#PUBOH 0SBDMF4DIFEVMFS

Oracle ERPOracle 11i Financial Functional Fundation9i Oracle DiscovererOracle 11i System Administrator Fundamentals 20044200612 ARP
 ETL stream Oracle AS Discoverer ARP 
www.botangdb.com
 Oracle ERP RedFlag Linux 30RedHat 8Redhat RHCIOracle WDPRHCE/OCP/OCM 

0SBDMF4DIFEVMFS 
Oracle Scheduler CHAIN   ADTschedule scheduleprogramchain exit CHAIN( )CHAIN()CHAIN( )



1.  
2. 

3. 



4. 





ADT schedule schedule program

 Schedule
schedule:
 ADT enqueues 
 Oracle Streams )
Oracle Database 10g,11g,12c





(Abstract Data Type)

Scheduler Queue

 PC 
 PLC/       



JavaEnqueuing and Dequeuing

public static void AQObjectPayloadTest(AQSession aq_sess)

throws AQException, SQLException, ClassNotFoundException

{

Connection

db_conn = null;

AQQueue

queue = null;

AQMessage

message = null;

AQObjectPayload payload = null;

AQEnqueueOption eq_option = null;

AQDequeueOption dq_option = null;

PERSON

pers = null;

PERSON

pers2= null;

ADDRESS

addr = null;

db_conn = ((AQOracleSession)aq_sess).g etDBConnection();

queue = aq_sess.getQueue("aquser", "test_queue2");

/* Enable enqueue/dequeue on this queue */ queue.start();
/* Enqueue a message in test_queue2 */ message = queue.createMessage();
pers = new PERSON(); pers.setName("John"); addr = new ADDRESS(); addr.setStreet("500 Easy Street"); addr.setCity("San Francisco"); pers.setHome(addr);
payload = message.getObjectPayload(); payload.setPayloadData(pers); eq_option = new AQEnqueueOption();
/* Enqueue a message into test_queue2 */ queue.enqueue(eq_option, message);

PL/SQLEnqueuing and Dequeuing

BEGIN

DBMS_SCHEDULER.create_job (

job_name => 'job4',

job_type => 'PLSQL_BLOCK',

job_action => 'BEGIN

INSERT INTO scheduler_test (id, created_date)

VALUES (scheduler_test_seq.NEXTVAL, SYSDATE);

COMMIT;

END;',

start_date => SYSTIMESTAMP,

event_condition => 'tab.user_data.event_name = ''give_me_a_prod''',

queue_spec => 'event_queue',

enabled

=> TRUE);

END;

DECLARE

l_enqueue_options DBMS_AQ.enqueue_options_t;

l_message_properties DBMS_AQ.message_properties_t;

l_message_handle RAW(16);

l_queue_msg

sys.t_event_queue_paylo ad;

BEGIN

l_queue_msg := sys.t_event_queue_paylo ad('give_me_a_prod');

DBMS_AQ.enqueue(queue_name

=> 'sys.event_queue',

enqueue_options => l_enqueue_options,

Enterprise Manager  Schedules

Schedule
--SYS:  select * from dba_queues q where q.QUEUE_TYPE='NORMAL_QUEUE' ; select * from dba_queues q where q.QUEUE_TYPE='EXCEPTION_QUEUE'; select * from dba_queues q where q.QUEUE_TYPE not in ('NORMAL_QUEUE','EXCEPTION_QUEUE');
 CREATE OR REPLACE TYPE t_event_queue_payload AS OBJEC
event_name VARCHAR2(30) ); grant execute on t_event_queue_payload to hr;
event_condition => 'tab.user_data.object_owner ''HR'' and tab.user_data.object_name = ''DATA and tab.user_data.event_type = ''FILE_ARRIVAL'

Oracle Scheduler CHAIN     



Dependency Scheduling

Job START Load_data_evt 1

Do_bulk_load 2

Schedule

Stop_when_ disk_full_evt

5

Rebuild_indx 3

END

Run_reports (HR.GEN_REPORTS 4

)

BULK_LOAD_CHAIN

1. 
Create_job_chain_1.jpg
1 2 3 4 5

2. 

DBMS_SCHEDULER.DEFINE_CHAIN_EVENT_STEP (

chain_name => 'bulk_load_chain',

step_name => 'load_data_evt',

1

event_condition => 'tab.user_data.object_owner

=

''HR'' and tab.user_data.object_name =

''DATA.TXT'' and tab.user_data.event_type =

''FILE_ARRIVAL'' ',

queue_spec => 'HR.LOAD_JOB_EVENT_Q');

DBMS_SCHEDULER.DEFINE_CHAIN_STEP (

chain_name => 'bulk_load_chain',

2

step_name => 'do_bulk_load',

program_name => 'hr.load_data_prog);

DBMS_SCHEDULER.DEFINE_CHAIN_STEP (

chain_name => 'bulk_load_chain',

3

step_name => 'rebuild_indx',

program_name => 'hr.rebuild_indexes');

chainexit  CHAIN ()CHAIN ()CHAIN()
 "condition" "action" conditionTRUE, the action

3. 
Create_job_chain_2.jpg

4. 

BEGIN DBMS_SCHEDULER.ENABLE
END; /

('bulk_load_chain');

BEGIN

DBMS_SCHEDULER.CREATE_JOB (

job_name

=> 'bulk_load_chain_job',

job_type

=> 'CHAIN',

job_action

=> 'bulk_load_chain',

repeat_interval => 'freq=daily;byhour=7;

byminute=5;bysecond=0',

enabled

=> TRUE);

END;

/


[DBA | ALL | USER]_SCHEDULER_CHAINS
[DBA | ALL | USER]_SCHEDULER_CHAIN_RULES
[DBA | ALL | USER]_SCHEDULER_CHAIN_STEPS
[DBA | ALL |

 


ORA



Oracle

z3 ­ SQL

zData ­ 

BayMax

 

