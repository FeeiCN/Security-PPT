© 2018 SPLUNK INC.
Gain End-to-End Visibility Into Your Azure Cloud Environment using Splunk
A data journey through Azure
Jason Conger | Splunk
October 2018 | Version 1.0

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

whoami

© 2018 SPLUNK INC.

jason.conger@splunk.com @JasonConger http://www.linkedin.com/in/JasonConger https://www.splunk.com/blog/author/jconger.html

Staff Solutions Architect Global Strategic Alliances

6+ years at Splunk Created or consulted on 25+ Splunkbase applications

2
There are 10 types of people in the world; those that understand binary and those that do not.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
How Azure Makes Data Available

Different Planes for Data
Control & Data

© 2018 SPLUNK INC.

Control Plane: System Configuration and Management Data Plane: Provisioned Service and Diagnostic Data

Storage Account
Storage Accounts are the Least Common Denominator for Azure Services

© 2018 SPLUNK INC.

Azure writes data to storage. Raw JSON, log lines, CSV, etc.

Blob or Table

Storage Account Blobs
Similar to a File system

© 2018 SPLUNK INC.

Account
My Storage Account

Container
pictures
movies

Blob
IMG01.PNG folder/IMG02
.PNG
MOV1.MPG

Example: NSG Flow Logs

Storage Account Table
Similar to CSV or Database Table

© 2018 SPLUNK INC.

Account
My Storage Account

Table
customers
photos
Example: VM Performance Logs

Entity
Name = ... Email = ...
Name = ... Email = ...
PhotoID = ... Date = ...

REST APIs
Metadata, Topology, Consumption

© 2018 SPLUNK INC.

{ REST }

Event Hubs
High Velocity and Scale

© 2018 SPLUNK INC.

Azure Monitor (moves data to Event Hubs)
The Azure Monitor Add-on for Splunk pulls data from Event Hubs

Azure Functions
Serverless Code

© 2018 SPLUNK INC.

Serverless code can take action on events in the hub.
Azure Function blueprints to push data to Splunk via HEC: https://github.com/Microsoft/AzureFunctionforSplunkVS

Recap
Storage Accounts, REST, Event Hub

© 2018 SPLUNK INC.

Storage

{ REST }
API

Event Hub

© 2018 SPLUNK INC.
Azure Add-on Landscape
Tools for your Splunk + Azure Toolbox

Azure Add-on Landscape
Is there an add-on for that?

© 2018 SPLUNK INC.

Splunk Add-on for Microsoft Cloud Azure Monitor Add-on for Splunk Azure Billing Add- Azure Inventory Add-on for Splunk DB

Services

on for Splunk

Splunk

Connect

Audit Blob Input VM Resource Audit Input Diagnostics Metric Input Consumption and VM Input Storage

Input

Metrics Input

input

Billing input

Input

Input

Audit Logs Diagnostic Logs Azure AD Sign-ins Azure AD Audit VM Metrics Metrics* VM Metadata Storage Metadata Topology NSG Flow Logs Security Center Consumption and Cost SQL sys Tables

(via API) (via Storage) (via Table)
(via Storage)

(via Event Hub) (via Event Hub) (via Event Hub) (via Event Hub)
(via API)
(via Event Hub)

(via API) (via API)

(via API)

(via API)

(via API)

Topology Input
(via API)

(via SQL)

Where do Add-ons run?
Indexing, forwarding, egress, compression

© 2018 SPLUNK INC.

Forwarder Inside Azure?

Possible Data Egress (tiered costs)

Inside Azure
VM Cost - OpEx
S2S compression = lower egress usage
Filtering via Splunk options prior to egress

Outside Azure
CapEx
Uncompressed data = more egress usage
Filtering on API level requires coding

Indexing
Forwarder Outside Azure?

© 2018 SPLUNK INC.
Azure Data Use Cases
I've got the data, now what?

Environment Overview
Multiple Subscriptions and Tenants in one place

© 2018 SPLUNK INC.

Topology
Multiple Account and Subscription Topology Visualization

© 2018 SPLUNK INC.

Billing and Consumption
Analyze Spend and Predict Costs

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Demo
Exploring Azure data with Splunk

© 2018 SPLUNK INC.
Additional Microsoft Cloud Sessions at .conf18
 SEC1297 - Down in the Weeds, Up in the Cloud: Splunking Your Azure and Office 365 · Tuesday, Oct 02, 2:15 p.m. - 3:00 p.m.
 SEC1355 - Hunting the Known Unknown: Microsoft Cloud · Tuesday, Oct 02, 4:45 p.m. - 5:30 p.m.
 IT1452 - Reaching Cloud Nirvana in a Multi-Cloud World · Wednesday, Oct 03, 11:30 a.m. - 12:15 p.m.
 SEC1097 - Office 365 in Nearly That Many Days: Splunking Microsoft Cloud Data, Then and Now · Wednesday, Oct 03, 4:30 p.m. - 5:15 p.m.

Splunk + Azure + BYOL
Running Splunk in Azure

© 2018 SPLUNK INC.

Additional Resources

© 2018 SPLUNK INC.

 Splunk Blogs · https://www.splunk.com/blog/search.html?query=azure
 Splunk Security Essentials · https://splunkbase.splunk.com/app/3435/
 Azure Storage Explorer · https://azure.microsoft.com/en-us/features/storage-explorer/
 Azure Metrics List · https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-supported-
metrics
 Diagnostic Log List · https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-diagnostic-
logs-schema

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Concepts
Tenants and Subscriptions AAD Applications Service Principals Log Profiles

© 2018 SPLUNK INC.
Azure Organization, Tenants, Subscriptions

Organization (Enterprise Account)

AD Domain / Accounts

Billing Unit

Tenant (splunk.com)

Subscription (prod) Subscription (dev)

Resources Resources

Tenant (phantom.us)

Subscription (prod)

Resources

© 2018 SPLUNK INC.
Metrics Available from Azure Monitor
https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-supported-metrics

 Microsoft.AnalysisServices/servers  Microsoft.ApiManagement/service  Microsoft.Automation/automationAccounts  Microsoft.Batch/batchAccounts  Microsoft.Cache/redis  Microsoft.ClassicCompute/virtualMachines  Microsoft.ClassicCompute/domainNames/slots/roles  Microsoft.CognitiveServices/accounts  Microsoft.Compute/virtualMachines  Microsoft.Compute/virtualMachineScaleSets  Microsoft.Compute/virtualMachineScaleSets/virtualMa
chines  Microsoft.ContainerInstance/containerGroups

 Microsoft.ContainerService/managedClusters  Microsoft.CustomerInsights/hubs  Microsoft.DataFactory/datafactories  Microsoft.DataFactory/factories  Microsoft.DataLakeAnalytics/accounts  Microsoft.DataLakeStore/accounts  Microsoft.DBforMySQL/servers  Microsoft.DBforPostgreSQL/servers  Microsoft.Devices/IotHubs  Microsoft.Devices/provisioningServices  Microsoft.DocumentDB/databaseAccounts  Microsoft.EventHub/namespaces  Microsoft.HDInsight/clusters

© 2018 SPLUNK INC.
Metrics Available from Azure Monitor
https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-supported-metrics

 Microsoft.Insights/AutoscaleSettings  Microsoft.KeyVault/vaults  Microsoft.LocationBasedServices/accounts  Microsoft.Logic/workflows  Microsoft.Network/loadBalancers  Microsoft.Network/dnszones  Microsoft.Network/publicIPAddresses  Microsoft.Network/applicationGateways  Microsoft.Network/virtualNetworkGateways  Microsoft.Network/expressRouteCircuits  Microsoft.Network/trafficManagerProfiles  Microsoft.Network/networkWatchers/connectionMonitors

 Microsoft.Relay/namespaces  Microsoft.Search/searchServices  Microsoft.ServiceBus/namespaces  Microsoft.SignalRService/SignalR  Microsoft.Sql/servers/databases  Microsoft.Sql/servers/elasticPools  Microsoft.Sql/servers  Microsoft.Storage/storageAccounts  Microsoft.Storage/storageAccounts/blobServices  Microsoft.Storage/storageAccounts/tableServices  Microsoft.Storage/storageAccounts/queueServices  Microsoft.Storage/storageAccounts/fileServices

© 2018 SPLUNK INC.
Metrics Available from Azure Monitor
https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-supported-metrics
 Microsoft.StreamAnalytics/streamingjobs  Microsoft.TimeSeriesInsights/environments  Microsoft.TimeSeriesInsights/environments/eventsource
s  Microsoft.Web/serverfarms  Microsoft.Web/sites (excluding functions)  Microsoft.Web/sites (functions)  Microsoft.Web/sites/slots  Microsoft.Web/hostingEnvironments/multiRolePools  Microsoft.Web/hostingEnvironments/workerPools

Terms and Aliases

© 2018 SPLUNK INC.

 Tenant ID = Directory ID  Application ID = Client ID  Key = Client Secret  Service Principal
· When creating an Azure AD application, the Service Principal is the representation of that
application in the tenant(s).
 Log Profile · Defines where logs go. Note: logs can go to more than one place at the same time.

