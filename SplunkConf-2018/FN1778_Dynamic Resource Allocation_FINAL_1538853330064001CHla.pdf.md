Workload Management
To Achieve Efficient Resource Utilization

Bharath Aleti Anish Shrigondekar

Product Management, Splunk Principal Software Engineer, Splunk

October 2018

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
Workload Management
How does it help ?

Challenges
Unpredictability in search execution
Monitoring Console Scheduler Activity

© 2018 SPLUNK INC.

 New users run wildcard searches, all-time searches, real time searches  Users/apps running wildcard or expensive searches  Resource utilization goes through the roof and impacts other users  High search load impacts data ingestion lag and fails to fire alerts in time

Resource Allocation
Lack of control to align resource allocation with business priorities

© 2018 SPLUNK INC.

Business Users
Security Analysts
Dept Users

Resource Allocation

App1 App2

App

User

Priority Priority

App1 Business users

App2 Security Analysts

App3 Dept Users

App3

Resource Contention
No guardrails over excessive resource usage

© 2018 SPLUNK INC.

Business Users
Security Analysts
Dept Users

Resource Allocation

App1 App2

App

User

Priority Priority

App1 Business users

App2 Security Analysts

App3 Dept Users

App3

Workload Management
Aligns resource allocation with business priorities

© 2018 SPLUNK INC.

· Prioritize critical search workloads
· Guardrails against overusage by app/user
· Predictable onboarding of new users/apps

Predictable Service
Assurance

Ingestion and search segregation

Workload Management

· Rule-based policy engine to map resources
· Resource assignment based on apps/roles

Policy Based Allocation

Dynamic Reassignment

· Dedicated data ingestion resources
· Prevents data lag due to heavy search load
· Dynamically tune resource reservation on-demand
· Admin delegation through capabilities

Workload Pools and Rules
Policy Based Assignment of Resources

© 2018 SPLUNK INC.

Workload Pools Search High Search Medium Search Low Default Ingest

CPU 35% 20% 15% 30%

Memory 35% 20% 15% 30%

Workload Rules/Policy
App=App1 Role=BusinessUser
App=App2 Role=SecAnalyst
App=App3 Role=DeptUsers

App

User

Priority Priority

App1 Business users

App2 Security Analysts

App3 Dept Users

Ingest
Dept Users
App3

Workload Management
Control over resource allocation and enforced guardrails

© 2018 SPLUNK INC.

Workload Management

App1
Business Users

App

User

Priority Priority

App1 Business users

App2 Security Analysts

App3 Dept Users

App2
Security Analysts

Workload Pools Search High
Search Medium
Search Low Default Ingest

CPU 35% 20% 15% 30%

Memory 35% 20% 15% 30%

Workload Rules/Policy
App=App1 Role=BusinessUser
App=App2 Role=SecAnalyst
App=App3 Role=DeptUsers

Workload Management (Admin)

© 2018 SPLUNK INC.

Workload Management (Admin)

© 2018 SPLUNK INC.

Configuration Files

workload_pools.conf

workload_rules.conf

© 2018 SPLUNK INC.

Workload Management: Pool Creation

© 2018 SPLUNK INC.

Workload Pools  CPU/Memory resource pools  Specify allocation of CPU and
memory resources  Indicate ingest or search pool
First Version  One ingest pool  Multiple Search Pools

Workload Management: Rule Creation

© 2018 SPLUNK INC.

Workload Rules:
 Determines assignment of pools based on custom rules
 Rules can be specified on an app, role or user basis
 Rules order determines rule precedence
 Provision to provide more complex rules going forward

Monitoring
Monitor workload management status and resource usage

© 2018 SPLUNK INC.

Monitor Search and Scheduler Activity
Using New Workload Pools Filter

© 2018 SPLUNK INC.

Dynamic Reassignment
On-demand Reassignment of workload pool

© 2018 SPLUNK INC.

 Available through capabilities  Allows power users to use higher/lower priority workload pools on-demand  Available to ad-hoc and scheduled searches

Capability
edit_workload_pools list_workload_pools select_workload_pools edit_workload_rules list_workload_rules

Actions
Create/Modify Workload Pools List Workload Pools
Select Workload Pools Create/Modify Workload Rules
List Workload Rules

© 2018 SPLUNK INC.
Dynamic Pool Selection: Ad-hoc Searches

© 2018 SPLUNK INC.
Dynamic Pool Selection: Scheduled Searches

© 2018 SPLUNK INC.
Scheduled Search Behavior across Workload Pools
 WLM Disabled
 WLM Enabled
 Scheduled searches run faster in higher resource workload pool  Fewer skipped searches in higher resource workload pool  Higher number of successfully scheduled searches in higher resource workload pool

© 2018 SPLUNK INC.
Ad-hoc Search Behavior across Workload Pools
 WLM Disabled
 WLM Enabled
 Ad-hoc searches run faster in higher resource workload pool  Higher number of successfully completed ad-hoc searches by concurrency in higher resource workload pool

Ingest Behavior across Workload Pools

© 2018 SPLUNK INC.

 Increased ingest throughput under CPU load for higher resource workload pool  Throughput will be affected if resources are under-provisioned for Ingest pool  Parallel ingestion pipeline sets can help achieve better performance with sufficient
resource allocation for Ingest workload pool

© 2018 SPLUNK INC.
Deep Dive
Setup, Configuration and Diagnostics

Setup
 Systemd
· Create a systemd unit file in /etc/systemd/system/systemd.service · Sample unit file available in the docs
· Run "systemctl daemon-reload" to reload the unit file · Run splunk start. This starts splunkd as a systemd service. · Verify that splunkd is running as a systemd service
systemctl status SPLUNK_SERVER_NAME.service
 Assign CPU for "splunk" cgroup
· Total system CPU shares in /sys/fs/cgroup/cpu/cpu.shares · Set CPU in
· /sys/fs/cgroup/cpu/system.slice to 9126 · /sys/fs/cgroup/cpu/system.slice/splunkd.service /cpu.shares to 9126
 Assign physical memory for "splunk" cgroup
· Total system physical memory from /proc/meminfo · Set Memory in
· /sys/fs/cgroup/memory/memory.limit_in_bytes to100% of total physical memory · /sys/fs/cgroup/memory/system.slice/memory.limit_in_bytes tp 90% of total physical memory · /sys/fs/cgroup/memory/system.slice/splunkd.service/memory.limit_in_bytes to 80% of physical memory

© 2018 SPLUNK INC.

Sample Unit File
[Service] Restart=always Type=simple ExecStart=/root/rdimri/splunk/bin/splunk _internal_launch_under_systemd --accept-license --no-prompt --answer-yes --seed-passwd changeme Delegate=true
#Splunk defines successful exit codes other than 0 to indicate special exit scenarios which are #used by splunk operations like rolling-restart, offline etc. SuccessExitStatus=51 52 RestartPreventExitStatus=51 RestartForceExitStatus=52
#On some systemd installations, systemd does not create cgroups for memory and cpu controller under system.slice #rather it runs process under root cgroups, we can force systemd to create cgroups under system.slice by specifying #MemoryLimit and CPUShares, please look at description below. MemoryLimit=100G CPUShares=1024
#If you want to run splunk as non-root user uncomment the following four lines. PermissionsStartOnly=true User=splunk Group=splunk ExecStartPost=/bin/bash -c "chown -R <USER Specified above>:<GROUP of User> /sys/fs/cgroup/cpu/system.slice/%n" ExecStartPost=/bin/bash -c "chown -R <USER Specified above>:<GROUP of User> /sys/fs/cgroup/memory/system.slice/%n"

© 2018 SPLUNK INC.

Setup
 Non-Systemd (Initd)
· Set splunk root cgroup in workload_pools.conf
[general] workload_pool_base_dir_name = splunk
· Create cpu and memory cgroups
· sudo mkdir /sys/fs/cgroup/cpu/<workload_pool_base_dir_name> · sudo mkdir /sys/fs/cgroup/memory/<workload_pool_base_dir_name> · sudo chown -R ${USER}
/sys/fs/cgroup/cpu/<workload_pool_base_dir_name>
· sudo chown -R ${USER}
/sys/fs/cgroup/memory/<workload_pool_base_dir_name>
 Assign CPU for "splunk" cgroup
· Total system CPU shares in /sys/fs/cgroup/cpu/cpu.shares · Set CPU in /sys/fs/cgroup/cpu/splunk/cpu.shares (80% of total cpu)
 Assign physical memory for "splunk" cgroup
· Total system physical memory from /proc/meminfo · Set Memory in /sys/fs/cgroup/memory/splunk/memory.limit_in_bytes (80%
of physical memory)

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Configuration
 On a search head, perform the below steps through UI/CLI/REST · Create workload groups · Create workload rules · Enable workload Management · Check workload management status · splunk show workload-management-status · If search head is part of a search head cluster, changes are propagated to the other cluster
members
 Indexer Cluster Configuration · Copy workload_pools.conf from search head to the CM · CM location: $SPLUNK_HOME/etc/master-apps/_cluster/local directory · Execute CM bundle push from the CM

© 2018 SPLUNK INC.
Interaction with Existing Search Quota Settings
 Existing search quota and scheduler priority changes continue to be applied along with Splunk Workload Management.
 Workload management does not attempt to override the settings described below.

Setting Name

Configuration File

Description

Default Value

srchJobsQuota cumulativeSrchJobsQuota base_max_searches max_searches_per_cpu schedule_priority

authorize.conf authorize.conf limits.conf limits.conf savedsearches.conf

Max number of concurrent historical searches by role
Max number of concurrent historical searches for all members of role
Constant to add to max no of searches as a factor of CPUs
Max number of concurrent historical searches per CPU
Raises scheduling priority of a search. Can have value: default, higher, highest.

3 N/A 6 1 default

© 2018 SPLUNK INC.

Key Takeaways

1. First level bullets should be
sentence case, 28pt
2. First level bullets should be
sentence case, 28pt
3. First level bullets should be
sentence case, 28pt

© 2018 SPLUNK INC.
Q&A

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

