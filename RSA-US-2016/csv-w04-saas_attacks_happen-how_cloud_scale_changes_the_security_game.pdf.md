SESSION ID: CSV-W04

SaaS Attacks Happen: How Cloud Scale Changes the Security Game

Sara Manning Dawson
Group Program Manager Office 365 Security Engineering @SManningDawson

#RSAC

#RSAC
Goals
How can the unique properties of a cloud service help to protect your data?
How can strategies to scale and streamline operations also accrue to better protection? How can data scale be used to better protect your data? What is the provider relationship with your data? How can cloud-wide purview help protect you?
2

#RSAC
Cloud Security is Well ^Understood
3

#RSAC
Cloud Security is Well ^Understood
"We have millions of users to protect, and our reputation is on the line, so of course we do a better job."
"Our budget is so big, we just keep scaling up our Security Operations, so of course we do a better job"

"Reason from first principles rather than by analogy"

The problem with quotes from the Internet is that they aren't always accurate.
- Abraham Lincoln, 1864

4

#RSAC
Unique Properties of the Cloud

Data Scale

Properties

Data is spread across hundreds of thousands of disks, machines, locations

Challenges Breach risk is as large as
data set

Operations Scale
Speed, Reliability, and Security all improve with automation.
Machine homogeneity in code execution and communications
Accountability for security, availability, reliability squarely on service provider
Stack is extremely agile

Cloud-Wide Purview
Signals that detect and act upon bad actors are service wide
Reputation wise, customer breach = cloud service provider breach

Data Sovereignty
The same company that hosts your content and provides value-add services must also honor your data sovereignty
Must find methods to prove it
International variation

#RSAC
Cloud Security First Principles
The unique properties of the cloud introduces new security first principles. Realize them via engineered solutions.
Cloud Operations Principles
1. Humans govern the service, code operates the service. Reduce human interaction with the system via automation. 2. When humans must be involved, JIT and JEA access only, gated by at least two decision makers. And don't touch the data. 3. Security must be engineered into operations fabric to take full advantage of scale, agility, and homogeneity.
Customer Protection Principles
4. Cloud-wide operational processes useful to individual customers should be made available. 5. Security learnings from one customer help all. 6. No customer can harm another as a result of both being in a cloud service.

#RSAC
Principle 1 and Principle 2:
Humans govern the service, code operates the service. Reduce human interaction with the system via automation. When humans must be involved, JIT and JEA access only, gated by at least two decision makers. And don't touch the data.

Approach

Automation

Reducing human interaction is as good for security as it is for scaling reliable operations.

Remote Access Only, via Code

What if only explicit, hardened code, run remotely, could service machines?
Execution is in the context of the operator or workflow.

Enforce ID, Time and Scope
Don't Touch The Data

All Access is Just In Time and Just Enough
Multi-factor approval chain, with specific machine targets Scripts have a definitive execution scope and timeframe
Prove You Don't Touch The Data
Put an audited barrier between the cloud operator's interests ­ operations and value-add - and the customer's interests - data.
8

#RSAC

#RSAC
Office 365 Service Automation

Orchestration Deployment/Patching
Monitoring
Diagnostics, Perf Data (Big, Streaming) On-call Interfaces Notification/Alerting Provisioning/Directory Networking New Capacity Pipeline

Central Admin (CA), the change/task engine for the service
Build, System orchestration (CA) + specialized system and server setup eXternal Active Monitoring (XAM): outside in probes, Local Active Monitoring (LAM/MA): server probes and recovery, Data Insights (DI): System health assessment/analysis Extensible Diagnostics Service (EDS): perf counters, Watson (per server)
Cosmos, Data Pumpers/Schedulers, Data Insights streaming analysis
Office Service Portal, Remote PowerShell admin access
Smart Alerts (phone, email alerts), on-call scheduling, automated alerts Service Account Forest Model (SAFM) via AD and tenant/user addition/updates via Provisioning Pipeline Routers, Load Balancers, NATs Fully automated server/device/capacity deployment

DATACENTER AUTOMATION

Office 365 Service Automation
The "brain" operating our service is called
Central Admin
Hardened code Safe, reliable, high throughput automation C# "workflows" or PowerShell script Runs check-in, build, and deployment tasks Runs regular maintenance tasks Runs monitoring and self-healing tasks ~200 million workflows handle day-to-day operations and failures.

CAPACITY

#RSAC

#RSAC
Remote Access Only, via Code
High order work is done in CA
e.g. rebalance a DAG, restart a service
but
EVERYTHING FAILS AT SCALE
When troubleshooting, repair, recovery, or patching can't self-heal, engineering are paged
Engineering intervention is limited to decision-making, code does the work

#RSAC
Enforce Time and Scope, Don't Touch the Data
Office 365 "Lockbox" 3 Factor Approval. (4 Factor with Customer Lockbox)
Claims-based, JIT and JEA sandboxed processes. No standing accounts, no standing access

#RSAC
Principle 3:
Security must be engineered into operations fabric to take full advantage of scale, agility, and homogeneity.

Innovation Areas

Detections via Build-Time Intel

Use source code to auto-map execution and comms
Homogenous run-time environment knows what the machine should ever need to do or connect with, so detections can climb the stack. SIEMs that depend on history hit limits in an agile and high-scale service.

Red Team Automation

Red Team creativity is critical to understanding risk
But even their function can benefit from automation. Response and Detections benefit as well.

Tighten Machine Communication & Execution

Evolve from "assume breach" to a protect posture
Eliminate interactive logon, local machine accounts, S2S elevation.

Hide Data In Scale

Distribute each organization's data, with anonymity
Protect logical access via obfuscation of Tenant-to-Mailbox mapping
14

#RSAC

#RSAC
Engineering Security Into Service Fabric
Office 365 Build and Deployment Process
Here, map what's possible to
inform detection signals engine
Code is tested against realities of
current environment
15

#RSAC
Engineering Security Into Service Fabric

Regular Build Deployment Train

Repair Box agent self-heals issues and vulnerabilities

REPAIR BOX
Specialized CA WF that scans and fixes variety of service issues - Consistency checks (e.g. member of the right server group - HW repair (automated detection, ticket opening, closing) - NW repair (e.g. firewall ACL) - "Base config" repair such as hyper-threading on/off - Patching and vulnerability up-to-date checks

Emergency patching is rare, ...and as critical to security as it is to
stability

16

Emergency replacement of
binaries - CA controlled and
staged with constant feedback - Management approved and assisted

#RSAC
Engineering Security Into Service Fabric
The Health Signals Pipeline needs a source of truth, a deviation
confidence measure, and a
notification pipeline. Sound
familiar?

#RSAC
Customer Protection Principles (4-6):
Cloud-wide operational processes useful to individual customers are made available. Security learnings from one customer help all. No customer can harm another as a result of both being in the cloud service.

#RSAC
Cloud operations accrue customer value
19

#RSAC
One Security Learning Helps All
Credentials Entered vs Phish Messages Reported
min : sec
Phishing is an edge on the path of least resistance. It's difficult to take action before it's too late.

#RSAC
One Security Learning Helps All

What if these are seen in multiple tenants
· From same IP? · In a short timeframe? · Clustered in same geo? · Clustered within a particular industry?
What if multiple tenants
· Were forwarding to a single IP or email address? · Were getting accessed from a single IP · Got a message from an IP address that sent mail with a link,
then OWA was accessed from that IP?

Suspicious Behaviors
Forwarding/Redirection/Journaling Rules leaving tenant Broad or org-wide search for "password" or like Export of data or exhaustive client-side downloading Recognition of fake login pages in Phishing attack Spike/anomaly in admin activity New Admin is added or promoted Security reduction activity (i.e. removal of MFA, MDM policies) Data exposure admin activity (journaling rules, exposing SP libraries to external) Anomalous activity or activity spike in external facing properties Exhaustive web crawling or index building Multiple OWA clients from same IP (anomalous, non-kiosk) Delegates added to an elevated user

21

#RSAC
DEMO: Secure Score
http:/aka.ms/O365securescore

#RSAC
Takeaways
How can the unique properties of a cloud service help to protect your data?
How can strategies to scale and streamline operations also accrue to better protection? How can data scale be used to better protect your data? What is the provider relationship with your data? How can cloud-wide purview help protect you?
23

#RSAC
Q&A

