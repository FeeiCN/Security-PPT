SESSION ID: CSV-F01
Cloud Incident Response
# R S A1C

Monzy Merza
Director of Cyber Research Chief Security Evangelist Splunk, Inc @monzymerza #splunk

#RSAC
Agenda
Cloud dependency and use Challenges and opportunities in the cloud A model for cloud IR Capabilities required for cloud IR IR scenarios Takeaways and call to action

#RSAC
What if...
 Visibility was reduced  Sensors disappeared  Authorization was transferrable  Trust exploitation became vector #1

#RSAC
What if...
 Visibility was reduced  Sensors disappeared
That world is now!  Authorization was transferrable
 Trust exploitation became vector #1

#RSAC
Cloud Service are Mission Critical
 Business Applications:  Sharing and Collaboration:  Storage Applications:  Infrastructure Platforms:

#RSAC
Framework for Cloud IR

#RSAC
NIST 800-61r2

#RSAC
Cloud: A Behavioral Model

Identity

Interactions

Resources

Challenges to IP Stewardship

User Autonomy

Users create/modify/move/s
hare data in<-> out and across services

#RSAC
Ubiquitous access geo and device diversity

Technical flexibility

Encrypted Communication

#RSAC
Identities
Human Machine
10

Examples of Interactions

Create an account

Start a machine instance

Synchronize files

Manage a process

#RSAC
Share a resource
Approve a transaction

#RSAC
Examples of Resources

File sharing services

Transaction services

Customer relations management (CRM)

Compute services

Applications services

#RSAC
Why Do These Challenges Exist?

Local Users and Cloud Services

Local Users and Local Services

Remote Users and Cloud Services

Remote Users and Local Services

#RSAC
Cloud IR: A Simple Model
Identity Used

Interactions with resource

Resources Accessed by
Identity

#RSAC
Applying the Simple Model

#RSAC
Cloud Opportunities
APIs for operation and management Centralized authentication and management Near real-time impact of changes Logging capabilities

#RSAC
Preparing: Resources Accessed

Identify the cloud resources
Web logs
Next generation firewall
application logs

Determine the methods of collection
Log files
API calls

Requirements for automation
Configuration changes
Special API keys, licenses

Preparing: Identity Used

Log User Access
On-prem resources
Cloud resources

Enrich User Information
Current CMDB for Users
HR Business Applications

#RSAC
Integrate Management
Configuration and rollback
Notification

#RSAC
Preparing: Interactions w/ Resources

Log User Activity
Applications
Infrastructure

Log API Activity
Cloud services
On-prem services

Integrate host acquisition
Memory
Disk

#RSAC
Preparing: Additional Considerations

Storage

Special Access Analytics tools

Logs

Elasticity

Data Analysis

Disk/Memory

API licenses

Sharing and Collaboration

#RSAC
Preparing for Cloud IR

Collect streaming events log data, API results

Collect batch data - log data, disk, memory images

Execute ad hoc collection via APIs - automated or
human mediated

Search and investigate the collections

Enrich data with third party information -
asset/identity, HR, threat intel

Automate collection/analysis/sharing
tasks

#RSAC
Operationalizing the model

#RSAC
Capabilities needed for Cloud Incident Response

Memory Forensics
Logs: Infrastructure, Instance, Service

Disk Forensics

Versioning, Snapshots

APIs for Configuration Changes

APIs for Status Gathering

#RSAC
Operational Considerations for Collection

Logs
Streaming or batched
Structured or unstructured

Binary data
Memory dumps are unstructured
Disk forensics require storage

Analytics
Out of the box vs Custom
Collaboration requires
integration

Automation
Test and Rollback
Human mediation

#RSAC
Cloud IR: Tools Selection Criteria

Hybrid
Cloud + Onprem

Automation/API friendly

Collaboration and sharing
ready

#RSAC
Attack and IR Scenarios

#RSAC
Linkin' Joe: Insider File Sharing
Joe creates a shared link on a cloud storage folder and emails it to an accomplice. Over the course of a month, Joe posts company proprietary data to the folder. And over the course of the month, Joe's accomplice makes copies of the data.

#RSAC
IR: Linkin' Joe
Identity
· Log data: cloud storage, on-prem auth · Enrich with: DLP or watch listed files, HR watch list, local file access
Resources
· Search for unauthenticated access to a folder
Interactions
· Search for large number of files moving to a specific folder · Make a list of file names uploaded/downloaded to folder

#RSAC
Pickpocket: Compromised Cloud Keys
Stolen cloud infrastructure keys are used to instantiate new instances and access existing instances

IR: Pickpocket
Identity
· Identify the keys that were stolen · Enrich log data: threat intel, IP, domains, file names, service names
Resources
· Log data: cloud infrastructure, cloud instance, threat intel · Host data: memory dump, cloud instance snapshot · Search other cloud instances for discovered indicators
Interactions
· Search log data for: use of keys, number of instances, durations of sessions · Search memory: installed services, open ports, files names
Contain
· API: Disable keys · API: Modify security zones for instances spawned by infected key use

#RSAC

#RSAC
N'synch - synch folder propagator
Malware propagates by copying itself to auto synch folders for cloud storage service

#RSAC
N'synch IR
Identity
· Identify owner of infected file
Resources
· Cloud storage, email · Search storage logs for file operations
Interactions
· Search host logs for reg keys, services, files, sockets
Contain
· API: remove propagating file · API: change permissions on infected folders

#RSAC
Takeaways and Call to Action

#RSAC
Call to Action for Cloud IR

Collect Data from Anywhere

Search Based on New Criteria

Enrich from internal, external sources on demand

Automation, Workflows, Sharing
Demand APIs from Security Vendors

#RSAC
Cloud IR: A Simple Model
Identity Used

Interactions with resource

Resources Accessed by
Identity

Thank You

#RSAC
@monzymerza mmerza@splunk.com monzymerza@gmail.com #splunk

