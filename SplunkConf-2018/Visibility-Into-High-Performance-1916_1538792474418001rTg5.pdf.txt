© 2018 SPLUNK INC.
Visibility Into a High Performance Compute (HPC) Grid
Ben Marcus Senior Staff IT Engineer bmarcus@qualcomm.com

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

BEN MARCUS
Software Engineer Large Scale System Administrator 8+ years using Splunk https://www.linkedin.com/in/heybigben

© 2018 SPLUNK INC.

#1
Fabless semiconductor company
#1
In 3G/4G LTE modem
30+
Years of driving the evolution of wireless
804M
MSMTM chipsets shipped FY `17

Sources: Qualcomm Incorporated data, as of Q4 FY17; IHS, May '18;

Strategy Analytics, Mar. '18. MSM is a product of Qualcomm

Technologies, Inc. and/or its subsidiaries.

4

Leading mobile innovation for over 30 years

Digitized mobile communications

Redefined computing

Transforming industries

Analog to digital

Desktop to smartphones

Connecting virtually everything

Redefining how the world connects, computes and communicates
5

© 2018 SPLUNK INC.
Engineering Design Center Infrastructure Overview
Large and complex
 Large numbers of just about everything · Storage (thousands of mount points/volumes) · Globally Deployed Interconnected Compute Clusters · Directory Services (LDAP and AD) · Job Scheduling software · Revision Control Systems · Tool License Servers · Virtual Desktop Infrastructure

Before Splunk
"Do we Even Have a Problem?"

© 2018 SPLUNK INC.

 Not much quantitative data

· Where is it happening? · Who is it affecting?

Nobody can work!

· What is business impact to project schedules

· Is this a new issue?

· Is it getting better/worse?

· Was it related to a change?

· When did it start/end?

All the hosts are down!

Automounter Broken!
My job is slow!
Are there any errors?

Splunk to the Rescue
Comprehensive visibility into machine data
 Obtained logs from Entire Grid
· Lots of sourcetypes · Linux OS/App/storage/web/database/firewall/ldap/AD ­ and many more! · Storage NFS access logs ­ improves security and operations · "Lights Out" management server logs · Linux server data (enhanced *nix Technology Add On)

 Log user tickets
· User Trouble Tickets · Change Requests · Major Outages

Error is right here!

 Add metrics · Trending events ­ server connects, load, memory, cpu, network, df, process etc.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Data Aggregation ­ NFS Not Responding

© 2018 SPLUNK INC.
Data Aggregation ­ NFS Not Responding

© 2018 SPLUNK INC.
Data Aggregation ­ NFS Not Responding

Data Aggregation - LDAP Server Errors

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Data Aggregation ­ Filer syslogs ­ LDAP Error

Workflow Insight ­ File Removal
Confirm via filer access logs - provides userid, hostname, time, path

© 2018 SPLUNK INC.

Find cause ­ ps_extended data ­ provides matching pid on compute server for "rm" operation

Use job scheduler logs to track process tree to jobid and workflow.

© 2018 SPLUNK INC.
Workflow Insight ­ Revision Control Slowness

Summary
Wins with Splunk

© 2018 SPLUNK INC.
1. Break down IT silos 2. Improved IT operations and
security posture
3. Gain engineering workflow insights 4. Democratize data

Future Work
Where Qualcomm is going next with Splunk
 Additional log and event sources  Additional metrics (using Splunk metric storage)  Splunk ITSI  Splunk dashboards combining "user" application data and
"IT" datasources  Telemetry  Splunk infrastructure upgrades

© 2018 SPLUNK INC.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

