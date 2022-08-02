Down in the Weeds, Up in the Cloud
Splunking Office 365 & Azure
Ryan Lait | Senior Sales Engineer Ry@splunk.com
October 2018

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

#whoami
RYAN LAIT
Senior Sales Engineer ­ Brisbane, Australia Splunk Chief Converse Officer*
§ Former Splunk customer § Cyber Security Analyst
* Self-appointed title

© 2018 SPLUNK INC.

Content Overview
Security, and some not-so-security focused content

 Office 365

 Azure

 Appendix

· Using O365 with Splunk · Using Azure with Splunk · Additional use cases

· O365 Workloads · Exchange Message
Tracking
· Security Essentials

· Inventory & Asset
Management
· Resource Mapping
· Runbook Automation

· Blog Posts · GitHub Repo's · App List

· Enterprise Security

· IT Service Intelligence

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk & Office 365
Microsoft SaaS

How Splunk Customers are Using

© 2018 SPLUNK INC.
Data

Content Analytics
 Adoption metrics, usage statistics, service status, subscription metrics, cost & spend analysis

Security Analytics
 Compromised account monitoring, improbable access, usage anomalies, Message tracking, DLP, threat correlation

Compliance
Reporting
 System and user access auditing for compliance reporting

Data Correlation & Enrichment
 Correlating O365 data with existing Splunk data and relational lookup data

Workloads

© 2018 SPLUNK INC.

Depending on your subscription! E1/E3/E5 etc.

Single Glass of Pain OR Single Pane of Glass © 2018 SPLUNK INC.
The Why Login anomalies | Data exfiltration | Instant service health | Usage adoption | Correlate on-prem data with O365

Service Status
Is it us, or is it them?

© 2018 SPLUNK INC.

The Why Correlate unplanned outages | War Room Reduction!

Azure Active Directory

© 2018 SPLUNK INC.

The Why Login activity | Geographical activity | License usage | Device auditing | User auditing | ADFS auditing | etc

Exchange Online

© 2018 SPLUNK INC.

The Why Mailbox investigations | Spam & phishing | Account compromise | Misconfigurations | Device Management | Capacity planning | etc

Exchange Admin Center ­ Message Trace
Searching over last 10 days works fine, BUT

© 2018 SPLUNK INC.

Exchange Admin Center ­ Message Trace
Any search prior to last 10 days presents this:

© 2018 SPLUNK INC.

Portal message traces can take hours to be returned!

Exchange Online

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
The Why File auditing | External access | Geographical tracking | Policy enforcement | Adoption | Capacity planning | etc

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

SharePoint

© 2018 SPLUNK INC.

The Why File/Folder/List/Page/Site auditing | External access | Adoption metrics | Content management | Capacity planning | etc

© 2018 SPLUNK INC.
The Why File auditing | User auditing | Message tracking | Adoption | etc

© 2018 SPLUNK INC.
The Why File auditing | User auditing | Message tracking | Adoption | Licensing | etc

© 2018 SPLUNK INC.
The Why File auditing | User auditing | Message tracking | Adoption | etc

© 2018 SPLUNK INC.
The Why User Auditing | Usage metrics | Dataset auditing | Adoption | Workspace planning | Dashboard views | etc

© 2018 SPLUNK INC.
The Why User auditing | Workflow auditing | Campaign tracking | Adoption | etc

© 2018 SPLUNK INC.
The Why stream auditing | User auditing | Capacity planning | Adoption | External access | etc

The Why File auditing | User auditing | Adoption | etc

© 2018 SPLUNK INC.

Security & Compliance Center

© 2018 SPLUNK INC.

The Why User auditing | Email auditing | Auditor auditing | Compliance reporting

Threat Intelligence
Detection methods:

© 2018 SPLUNK INC.

The Why Correlate feeds with internal data | Security reporting | Automate investigation data collection | etc

© 2018 SPLUNK INC.

`ing with Splunk Security Essentials

© 2018 SPLUNK INC.

29

`ing with Splunk Security Essentials
Data onboarding guide ­ Exchange message tracking logs

© 2018 SPLUNK INC.

30

& Splunk Enterprise Security
Data onboarding guide ­ Exchange message tracking logs

CIM
Change Analysis Authentication

Correlation Searches

Dashboards

Abnormally High Number of Endpoint Changes By User Account Deleted Anomalous Audit Trail Activity Detected Brute Force Access Behavior Detected and Detected Over One Day Concurrent Login Attempts Detected Default Account Activity Detected Excessive Failed Logins Geographically Improbable Access Detected High or Critical Priority Individual Logging into Infected Machine Insecure Or Cleartext Authentication Detected Network Change Detected and Network Device Rebooted Same Error On Many Servers Detected Short-lived Account Detected

access_anomalies access_center access_search access_tracker account_management default_accounts endpoint_changes network_changes user_activity

© 2018 SPLUNK INC.

31

& Splunk IT Service Intelligence

© 2018 SPLUNK INC.

Data Sources

Example KPI's

O365 Management API Exchange Message Tracking Logs

Failed vs Successful logins Unique users Subscription metrics Adoption of O365 workloads Mail counts ­ delivered Vs failed CRM campaign metrics Capacity planning Predictive billing

32

© 2018 SPLUNK INC.
Splunk & Azure
Microsoft IaaS + PaaS

How Can You Use

Data

© 2018 SPLUNK INC.

 Platform Analytics
 Diagnostic troubleshooting, alerting, capacity planning

Security Analytics
 Resource activity, DLP, threat correlation, compromised account monitoring, usage / billing anomalies

Compliance
Reporting
 System and user access auditing for compliance reporting

Billing Insights
 Spend analysis  Capacity planning  On-prem vs cloud ROI

Azure Inventory & Asset Management
This is where the subtitle goes

© 2018 SPLUNK INC.

Chase Mickey re: custom viz and asset mapping?

Resource Topology Mapping

© 2018 SPLUNK INC.

The How Install Force Directed App for Splunk sourcetype=mscs:resource* | stats count by location_name, resource_group_name, resource_name
Resource Topology Mapping

What If I Want More?

© 2018 SPLUNK INC.

Mailbox Migration & Capacity Planning

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Subscription Cost Modelling

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
What next?
I want it all! Give it to me!

Splunk Resources

© 2018 SPLUNK INC.

Blog Posts
 Step-by-step configuration guides
 Search & dashboard examples

Whitepapers & Docs
 Industry documentation provides context and resources to push ahead?

Splunkbase Boss of the SOC 3.0!

 Pre-built dashboards, reports, alerts and actions to hit the ground running!

 Blue-team CTF specifically for Azure & O365!

Key Takeaways

© 2018 SPLUNK INC.
1. First level bullets should be
sentence case, 28pt
2. First level bullets should be
sentence case, 28pt
3. First level bullets should be
sentence case, 28pt
4. Check out the other Azure & O365
sessions too!

More .conf18 Sessions!

© 2018 SPLUNK INC.

v

GAIN END-TO-END VISIBILITY INTO YOUR AZURE CLOUD ENVIRONMENT
USING SPLUNK
Jason Conger ­ Staff Solutions Architect

HUNTING THE KNOWN UNKNOWN: MICROSOFT CLOUD
Ryan Kovar ­ Principal Security Strategist

ry@splunk.com
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

How Do I Splunk My

Data?

© 2018 SPLUNK INC.

bit.ly/splunko365
46

© 2018 SPLUNK INC.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

