© 2018 SPLUNK INC.
Migrating Your DB Inputs
From DB Connect v1 to v3
Hani Atalla
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

 Disclaimer  Why Ditch DB Connect v1?  The Long Path  The Short Path  Steps to Migrate  Takeaways

Agenda

© 2018 SPLUNK INC.

Disclaimer

© 2018 SPLUNK INC.

 I am not here on behalf of my employer as the views of my employer do not conform to my views, or to any accepted standard of logic that the Greeks thought up some 2000 years ago.

HANI ATALLA
Splunk Engineer

© 2018 SPLUNK INC.

So Why Ditch DB Connect v1?

© 2018 SPLUNK INC.

Why v3?
 New UI to manage inputs, outputs, lookups · Wizard based · Type ahead dropdowns · More .conf options: query timeout
 Input templates · Add-on for Oracle, MS SQL Servers, McAfee, Nagios
 DB Connect health checks · Pre-built panels to monitor DB Connect
 Improved Performance  Flexibility
· | dbxquery procedure="{call <procedure-name>}"

© 2018 SPLUNK INC.

Why v3?

© 2018 SPLUNK INC.

Performance - Queries
Improvement increases with dataset size, up to 4x faster from 2.x

Performance - Outputs
Large datasets are output 2x to 9x faster than v2.4x

But Why Really Ditch DB Connect v1?

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Our Options?

Already on DB Connect v2.x

© 2018 SPLUNK INC.

You Are Set
 Install latest DB Connect v3 on a Heavy Forwarder · [v 3.1.3]
 Run migration script · [app_migration.py]

© 2018 SPLUNK INC.

On DB Connect v1.x

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Option 1
The Long Path

Dual Install

© 2018 SPLUNK INC.

The Long Path to v3 from v1 [ Part I ]
 Ensure you are running latest DB Connect v1 · [v1.2.2]
 Update your Java install · [Java 8]
 Install DB Connect v2 · [2.4.0 or later]
 Copy database drivers · [.jar files from /etc/apps/dbx/bin/lib to /etc/apps/splunk_app_db_connect/bin/lib]
 Run the connections/identities migration script to v2 · [splunk cmd python dbx_migrate_connections.py]
 Run the DB inputs migration script to v2 · [splunk cmd python dbx_migrate_inputs.py]

© 2018 SPLUNK INC.

The Long Path to v3 [ Part II ]

© 2018 SPLUNK INC.

 Run the Lookups migration script to v2 · [splunk cmd python dbx_migrate_lookups.py]
 Install latest DB Connect v3 release · [v 3.1.3]
 Run migration script (drivers/identifies/connections/inputs/lookups) [v2 to v3] · [splunk cmd python SPLUNK_HOME/etc/apps/splunk_app_db_connect/bin/app_migration.py]
 Move or delete DB Connect v1 · [$SPLUNK_HOME/etc/apps/dbx]

Perhaps There is a Shorter Path

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Option 2
A Shorter Path

From: DB Input [DB Connect v1]

© 2018 SPLUNK INC.

To: DB Input [DB Connect v3]

© 2018 SPLUNK INC.

From [v1]

To [v3]

© 2018 SPLUNK INC.

DB Input [Components]

© 2018 SPLUNK INC.

SQL: Upper / Lower Case Behavior v1
Converts to lowercase regardless of SQL

© 2018 SPLUNK INC.

SELECT action, action_name, protocol, sessionid, port, userhost, os_process, terminal, timestamp
FROM Audit_Trail;

SELECT Action, Action_Name, Protocol, SessionID, Port, UserHost, OS_Process, Terminal, TimeStamp
FROM Audit_Trail;

SELECT ACTION, ACTION_NAME, PROTOCOL, SESSIONID, PORT, USERHOST, OS_PROCESS, TERMINAL, TIMESTAMP
FROM Audit_Trail;

SQL: Upper / Lower Case Behavior v3
Converts to uppercase regardless of SQL

© 2018 SPLUNK INC.

SELECT action, action_name, protocol, sessionid, port, userhost, os_process, terminal, timestamp
FROM Audit_Trail;

SELECT Action, Action_Name, Protocol, SessionID, Port, UserHost, OS_Process, Terminal, TimeStamp FROM Audit_Trail;

SELECT ACTION, ACTION_NAME, PROTOCOL, SESSIONID, PORT, USERHOST, OS_PROCESS, TERMINAL, TIMESTAMP FROM Audit_Trail;

DB Input ­ DB Connect v3
Use "AS" clause to force required case
SELECT action AS "action" , action_name AS "action_name" , protocol AS "protocol", sessionID AS "sessionid", port AS "port", userhost AS "userhost", os_process AS "os_prcess", terminal AS "terminal", timestamp AS "timestamp"
FROM Audit_Trail;

© 2018 SPLUNK INC.

Make It Simple

© 2018 SPLUNK INC.

SELECT e.employee_id AS "Employee", e.first_name || ' ' || e.last_name AS "Name", e.email AS "Email", e.phone_number AS "Phone", TO_CHAR(e.hire_date, 'MM/DD/YYYY'),
TO_CHAR(e.salary, 'L99G999D99', 'NLS_NUMERIC_CHARACTERS = ''.,'' NLS_CURRENCY = ''$'''), e.commission_pct AS "Comission %", || j.job_title || ' in ' || d.department_name || ' department (manager: ` || dm.first_name || ' ' || dm.last_name || ') and immediate supervisor: ' || m.first_name || ' ' || m.last_name , TO_CHAR(j.min_salary, 'L99G999D99', 'NLS_NUMERIC_CHARACTERS = ''.,'' NLS_CURRENCY = ''$''') || ' - ' || TO_CHAR(j.max_salary, 'L99G999D99', 'NLS_NUMERIC_CHARACTERS = ''.,'' NLS_CURRENCY = ''$''')
, l.street_address || ', ' || l.postal_code || ', ' || l.city || ', ' || l.state_province || ', ' || c.country_name || ' (' || r.region_name || ')'
, jh.job_id AS "History Job ID" , 'worked from ' || TO_CHAR(jh.start_date, 'MM/DD/YYYY') || ' to ' || TO_CHAR(jh.end_date, 'MM/DD/YYYY') ||
' as ' || jj.job_title || ' in ' || dd.department_name || ' department` FROM employees e JOIN jobs j
ON e.job_id = j.job_id LEFT JOIN employees m
ON e.manager_id = m.employee_id lEFT JOIN departments d
ON d.department_id = e.department_id LEFT JOIN employees dm
ON d.manager_id = dm.employee_id LEFT JOIN locations l
ON d.location_id = l.location_id LEFT JOIN countries c
ON l.country_id = c.country_id LEFT JOIN regions r
ON c.region_id = r.region_id LEFT JOIN job_history jh
ON e.employee_id = jh.employee_id LEFT JOIN jobs jj
ON jj.job_id = jh.job_id LEFT JOIN departments dd
ON dd.department_id = jh.department_id ORDER BY e.employee_id;

Make It Simple

© 2018 SPLUNK INC.

Obfuscate SQL complexity in database views

CREATE VIEW View_Employees_Info AS SELECT e.employee_id AS "Employee #" , e.first_name || ' ' || e.last_name AS "Name" , e.email AS "Email" , e.phone_number AS "Phone" , TO_CHAR(e.hire_date, 'MM/DD/YYYY') AS "Hire Date" , TO_CHAR(e.salary, 'L99G999D99', 'NLS_NUMERIC_CHARACTERS
= ''.,'' NLS_CURRENCY = ''$''') AS "Salary" , e.commission_pct AS "Comission %", , e.timestamp AS "TimeStamp"
FROM employees e JOIN jobs j ON e.job_id = j.job_id LEFT JOIN employees m ON e.manager_id = m.employee_id LEFT JOIN departments d ON d.department_id = e.department_id LEFT JOIN employees dm ON d.manager_id = dm.employee_id LEFT JOIN locations l ON d.location_id = l.location_id LEFT JOIN countries c ON l.country_id = c.country_id LEFT JOIN regions r ON c.region_id = r.region_id LEFT JOIN job_history jh ON e.employee_id = jh.employee_id LEFT JOIN jobs jj ON jj.job_id = jh.job_id LEFT JOIN departments dd ON dd.department_id = jh.department_id
ORDER BY e.employee_id;

SELECT Employee AS "employee" , First_Name AS "first_name", Phone_Number AS "phone_number", Salary AS "salary", Commission_PCT AS "commission_pct", TimeStamp AS "timestamp"
FROM View_Employees_Info Order by TimeStamp asc;

Rising Column Checkpoint Value

© 2018 SPLUNK INC.

DB Input [DB Connect v1]
Grep is Your Best Fried
$SPLUNK_HOME/var/lib/splunk/persistentstorage/dbx/<hash>

© 2018 SPLUNK INC.

DB Input [DB Connect v1]
"grep" is your best friend
hostname:/opt/splunk/var/lib/splunk/persistentstorage/dbx/grep ­irl <db-input-name>

© 2018 SPLUNK INC.

manifest.properties

© 2018 SPLUNK INC.

$SPLUNK_HOME/var/lib/splunk/persistentstorage/dbx/4a753be34ertrsaf42fsdfds/manifest.properties

state.xml
$SPLUNK_HOME/var/lib/splunk/persistentstorage/dbx/4a753be34ertrsaf42fsdfds/state.xml

© 2018 SPLUNK INC.

Set Checkpoint Value

© 2018 SPLUNK INC.

Time Zone

© 2018 SPLUNK INC.

Time Zone
 DB Connect v3 ignores TZ settings in props.conf on sourcetype
 Set "Timezone" in the DB input connection.  IF 2 DB inputs are using same connection
info but timestamps are in different TZ, you'll need to have 2 connections.

© 2018 SPLUNK INC.

Key Takeaways

1. Case matters so use "AS" clause

© 2018 SPLUNK INC.

2. Use database views

3. Checkpoint value is in DB input state.xml

4. Set TZ in the DB connection settings NOT
props.conf

5. Source syntax is different between DBX3

6. Ensure kv_mode=auto

7. Verify: ingest in a temp index with same
sourcetype as events from DBX1

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

