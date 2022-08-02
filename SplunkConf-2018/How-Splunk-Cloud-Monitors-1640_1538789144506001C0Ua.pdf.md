©© 22001188 S P L U N K I N C .
How Splunk Cloud Monitors Splunk Cloud with Splunk

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC. The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Our Speakers

© 2018 SPLUNK INC.

v

ERIK CAMBRA
Product Manager, Splunk Cloud, Splunk

RUSSELL UMAN
Principal Nephelococcygist, Cloud Monitoring, Splunk

© 2018 SPLUNK INC.
The Splunks We Splunk Splunk With
Not suitable for children under 3 years due to small parts.

© 2018 SPLUNK INC.

Cloud Monitoring

Skynet

ITSI

Console

Virga

© 2018 SPLUNK INC.
Cloud Monitoring Console
My friends call me McCloud.

© 2018 SPLUNK INC.
Things you can do with the CMC
 Review Daily Data Ingest  Audit Data Storage by Index  Understand Usage Patterns  Troubleshoot Data Ingest  Investigate Search Issues

Data Ingest

© 2018 SPLUNK INC.

Do you know how much data you're sending?

© 2018 SPLUNK INC.
Data Storage
How much data are you retaining?

Understanding Search
Performance
How many searches am I running and can
they be improved?

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Usage Review
How are your users gaining value from Splunk Cloud?

© 2018 SPLUNK INC.
Troublesome Data
Do your configs match your logs?

© 2018 SPLUNK INC.
Skynet
Skynet has not yet attained sentience.

Skynet Architecture
 Multiple Cloud Stacks  Regional stacks that collect data
from Skynet forwarder on customer instances  Infrastructure stack that collects data from Skynet forwarder on infra instances, and 3rd-party systems (e.g. AWS)  Search stack that distributes over all the other stacks.  Additional stacks for SingleInstance customers and nextgeneration Cloud

© 2018 SPLUNK INC.

Skynet Architecture
 The first attempt at Skynet put everything into _internal. This did not work.
 The second attempt at Skynet had a separate index for each customer. This did not work!
 The current iteration has a separate index for each large source (splunkd, metrics, license, etc.)

© 2018 SPLUNK INC.

Skynet Inventory

© 2018 SPLUNK INC.

 Inventory lookup lets us know who we should expect to receive data from.  One row per host, for all the ec2 instances across all Splunk Cloud AWS
accounts.  Generated from AWS TA Description inputs.  Enriched with fields (alertable, bucket_location, cloud_flavor) based on ec2
tags.  Inventory lookup built from a scheduled search, with counter-measures against
failures to collect Description events.

© 2018 SPLUNK INC.
[aws_inventory_lookup]
index=aws_description source=*:ec2_instances | fillnull value="null" alertable aws_account_shortname bucket_location customer_type tags.Role
tags.Stack vpc_id tags.CloudworksEnv | stats count by alertable account_id aws_account_shortname aws_account_name bucket_location id
instance_type ip_address launch_time private_ip_address region vpc_id tags.CloudworksEnv state customer_type FQDN tags.Name tags.Role tags.Stack | fields - count | rename account_id AS aws_account_id, aws_account_shortname AS aws_account, tags.Name AS name, tags.Stack AS stack, tags.Role AS role, tags.CloudworksEnv AS cloudworksenv | eval owner="CloudOps" | eval new_event = 1 | inputlookup append=t aws_inventory | eval old_event=if(isnull(new_event), 1, null()) | eventstats count(old_event) as old_count, count(new_event) AS new_count | fillnull value="0" new_count old_count | eval change_multiplier = if(old_count > 0, new_count / old_count, 1) | where (change_multiplier >= .9 AND new_event = 1) OR (change_multiplier < .9 AND old_event = 1) | fields - change_multiplier new_count new_event old_count old_event

Monitoring/Ops Process

© 2018 SPLUNK INC.

 Cloud Monitoring team writes alerts.  SRE team writes runbooks, and develops dashboards for troubleshooting.  NOC receives alerts (via ITSI), runs runbook, uses dashboards, escalates to
SRE if necessary.

Cloud Monitoring
Alerts

© 2018 SPLUNK INC.

Cloud Monitoring
Alerts
IO issues

© 2018 SPLUNK INC.

Cloud Ops Dashboards
Stack Overview

© 2018 SPLUNK INC.

Cloud Ops Dashboards
App Versions

© 2018 SPLUNK INC.

Cloud Ops Dashboards
Specific Incidents

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
ITSI
Don't call it "ITSI".

Notable Events

© 2018 SPLUNK INC.

 ITSI creates Notable Events from the Skynet alert stream.  Notable Events are enriched with data from related JIRA tickets and SFDC
cases.  Notable Events are grouped by customer, with severity determined by the
collection of grouped alerts.  This allows NOC to work holistically on the most critical customers first instead
of having to whack every mole separately.

ITSI
NOC Criticals

© 2018 SPLUNK INC.

ITSI
NOC Management
Metrics

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Virga
If rain evaporates before it hits a tree that fell in the forest...wait, now I'm confused.

KPIs for Support

© 2018 SPLUNK INC.

 Many customer issues are better addressed by Support than by Cloud Ops.  Virga leverages Skynet to help Support quickly hone in on components that
need attention.

VIRGA
KPI Dashboard

© 2018 SPLUNK INC.

VIRGA
KPI Deep Dive

© 2018 SPLUNK INC.

Next Steps

© 2018 SPLUNK INC.

Learn more about the Cloud Monitoring Console and find guided walkthroughs for each of these topics at:

http://docs.splunk.com/Documentation/SplunkCloud/latest/User/DMCoverview

© 2018 SPLUNK INC.
Q&A

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

