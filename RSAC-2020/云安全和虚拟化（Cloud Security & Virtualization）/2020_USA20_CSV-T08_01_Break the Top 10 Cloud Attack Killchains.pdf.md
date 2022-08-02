SESSION ID: CSV-T08
Break the Top 10 Cloud Attack Killchains

Rich Mogull
Analyst/Securosis CISO/DisruptOps @rmogull

Shawn Harris
Managing Principal Security Architect Starbucks @infotechwarrior

#RSAC

#RSAC
Kill Chains and ATT&CK's
Lockheed Martin's Cyber Kill Chain represents a standard attack pattern from recon to action MITRE's ATT&CK framework is knowledge base of attack patterns in structured phases Both are to help you threat model and plan defenses This session includes 10 specific cloud kill chains most commonly used (in our experience)
2

#RSAC
Objectives

Provide you with detailed information on
AND
the most common real world cloud attacks

And the most effective ways to prevent them

3

#RSAC

Static API Credential Exposure to Account Hijack

Category Severity

Attack (Scripted or Targeted)
High

Liklihood

High

Primary CSA Top Threat
Primary Mitre ATT&CK

4. Security Issue: Insufficient
 Identity, Credential, Access
 and Key Management
 5.Security Issue: Account
 Hijacking
Valid Accounts

#RSAC
Static API Credential Exposure to Account Hijack

Access key created for IAM
user

Key saved in insecure storage or
transmitted insecurely

Attacker obtains key
Kill Chain

Attacker uses key from a host/ platform under
their control

Attacker executes API
calls for malicious action
or privilege escalation

Presenter's Company Logo ­ replace or delete
on master slide

#RSAC
Common sources of credential exposure
GitHub/BitBucket Shared images Snapshots Compromised instance -> embedded code Compromised instance or dev/admin system - >
­ Shell history ­ Config/Credentials file ­ Local code
6

#RSAC
Static API Credential Exposure to Account Hijack

Access key created for IAM
user

Key saved in insecure storage or
transmitted insecurely

Attacker obtains key

Attacker uses key from a host/ platform under
their control

Attacker executes API
calls for malicious action
or privilege escalation

· Minimize or eliminate use of IAM users (use IAM Roles)
Presenter's Company Logo ­ replace or delete
on master slide

· Scan for credentials on commit
· Scan code repositories
· Federation + MFA for devs/admins

· Use IAM conditionals that restrict based on IP/VPC
· Alert based on unusual location of API calls

· Least privilege IAM policies
· Assess for potential IAM priv escalation
· Activity alerts · Many options/ environment specific

#RSAC
Static API Credential Exposure to Account Hijack

Access key created for federated user

Key saved in insecure storage or
transmitted insecurely

Attacker obtains key

Attacker uses key from a host/ platform under
their control

Attacker executes API
calls for malicious action
or privilege escalation

· Minimize or
eliminate use of
user context
accounts by
implementing g
Managed Service
Identities
Presenter's Company Logo ­ replace or delete
on master slide

· Primary Access tokens saved in key vault with federated service principal or Managed Service Identity with access to retrieve

· Use access controls that restrict based on IP/VNET
· Correlation to anomalous GeoIP access from flow logs in correlation engine

· Least privilege access policies via Azure API Management

#RSAC

Compromised Server via Exposed SSH/RDP/Remote Access

Category Severity

Misconfiguration (Common)
High

Liklihood

High

Primary CSA Top Threat
Primary Mitre ATT&CK

2: Misconfiguration
 and Inadequate Change Control
Exploit Public-Facing Application

Compromised Server via Exposed SSH/RDP/Remote

#RSAC

Access

Find ports 22/3389 or other admin exposed to
Internet

Identify target resource behind
exposed port

Brute force password or
exploit vulnerability

Escalate privileges, pivot, and/or extract
data

Presenter's Company Logo ­ replace or delete
on master slide

Compromised Server via Exposed SSH/RDP/Remote

#RSAC

Access

Find ports 22/3389 or other admin exposed to
Internet

Identify target resource behind
exposed port

Brute force password or
exploit vulnerability

Escalate privileges, pivot, and/or extract
data

· Assess Network security groups for public exposure of known admin ports
Presen·terA'szCuorempbaansytion
Logo ­ replace or delete on master slide

· JIT access policy in Azure Security Center

· Azure Security Center vulnerability assessment

· Host image hardening (CIS)
· NIC service segmentation via NSG

Compromised Server via Exposed SSH/RDP/Remote

#RSAC

Access

Find ports 22/3389 or other admin exposed to
Internet

Identify target resource behind
exposed port

Brute force password or
exploit vulnerability

Escalate privileges, pivot, and/or extract
data

· Assess security
groups for public
exposure of
known admin
ports
· Guardrail to
Presenterp'sreCvoemnptaenxyposure Logo ­ reploacf epoorrtdse(le.tge. lock to
on masktneorwslnidIePs/jump box)

· Disable SSH/ RDP/etc locally when not needed

· Standard host security controls (patch, etc.)

· Host security · Use internal
security groups/ application security groups

2 Million+!
Presenter's Company Logo ­ replace or delete
on master slide

#RSAC

#RSAC

Compromised Database via Inadvertent Exposure

Category Severity

Misconfiguration (Common)
Medium

Liklihood

High

Primary CSA Top Threat
Primary Mitre ATT&CK

2: Misconfiguration
 and Inadequate Change Control
Exploit Public-Facing Application

Compromised Database via Inadvertent Exposure

Identify exposed database ports (instance/VMbased)

Exploit DB, use stolen creds, or
brute force access

Query and/or export data

Identify public PaaS database

Obtain or brute force
credentials (see cred exposure
killchains)

Create snapshot/ export via
management plane, or open security groups

Presenter's Company Logo ­ replace or delete
on master slide

Exfiltrate Data

#RSAC

#RSAC
Compromised Database via Inadvertent Exposure

Identify exposed database ports (instance/VMbased)

Exploit DB, use stolen creds, or
brute force access

Query and/or export data

Identify public PaaS database

Obtain or brute force
credentials (see cred exposure
killchains)

Create snapshot/ export via
management plane, or open security groups

Exfiltrate Data

· Security group rules
· Continuous assessment/ guardrails

· Continuous assessment/ guardrails
· SCPs/Policies

Presenter's Company Logo ­ replace or delete
on master slide

· Vulnerability management
· MFA

· Least privilege IAM · IP/VPC restrictions on
API call origins · SCPs/Policy · Guardrails

· DB least privilege · Database Activity
Monitoring

· Outbound network restrictions
· Cloud detection and response

#RSAC

Object Storage Public Data Exposure (S3, Azure Blob)

Category Severity

Misconfiguration (Common)
High

Liklihood

High

Primary CSA Top Threat
Primary Mitre ATT&CK

2. Security Issue: Misconfiguration
 and Inadequate Change Control
Exploit Public-Facing Application

#RSAC
Object Storage Public Data Exposure (S3, Azure Blob)

Sensitive data placed into
object storage

Access Control set to public/ anonymous

Bucket Policy/ Network set
overly permissive

Presenter's Company Logo ­ replace or delete
on master slide

Public CDN set to access private data

Attacker scans for and
discovers open data store

Attacker extracts data

Object Storage Public Data Exposure (S3, Azure Blob)

Sensitive data placed into
object storage

Access Control set to public/ anonymous

Bucket Policy/ Network set
overly permissive

Public CDN set to access private data

Attacker scans for and
discovers open data store

Attacker extracts data

#RSAC

· Cloud-based DLP (Macie/AIP) Note: these are currently immature and of limited effectiveness
Presenter's Company Logo ­ replace or delete
on master slide

· Continuous assessment · Real time alerting on ACL and
Bucket/Network policy changes · Disable public access (CSP
setting) · Reactive Guardrail (FaaS or 3rd
party)

#RSAC
Object Storage Public Data Exposure (S3, Azure Storage)

Sensitive data placed into
object storage

Access Control set to public/ anonymous

Bucket Policy/ Network set
overly permissive

Public CDN set to access private data

Attacker scans for and
discovers open data store

Attacker extracts data

· MCAS Microsoft Cloud Application Security (CASB)
Verify with Trull
Presenter's Company Logo ­ replace or delete
on master slide

· Azure Advanced Threat Protection for storage accounts
· Azure Storage Firewall configured to disable public access

Oops, my bad...
Presenter's Company Logo ­ replace or delete
on master slide

#RSAC

#RSAC

Server Side Request Forgery -> Credential Abuse

Category Severity

Attack (Scripted or Targeted)
Medium

Liklihood

High

Primary CSA Top Threat
Primary Mitre ATT&CK

1. Data Breaches
Exploit Public Facing Application,
 Cloud Instance Metadata API

#RSAC
Server Side Request Forgery -> Credential Abuse

Identify instance /container with potential SSRF

SSRF exploited to extract
credentials via metadata service

Establish session with credentials in
attacker's environment

Attacker executes API
calls for malicious action
or privilege escalation

Presenter's Company Logo ­ replace or delete
on master slide

#RSAC
Server Side Request Forgery -> Credential Abuse

Identify instance /container with potential SSRF

SSRF exploited to extract
credentials via metadata service

Establish session with credentials in
attacker's environment

· Restrict public Internet access
· Patch for SSRF (vulnerability management)
Presenter's Company Logo ­ replace or delete
on master slide

· Use Azure instance metadata service (RFC 1918 address) only accessible by VM and protected from SSRF

· API call origin request conditionals > IAM policy with conditionals to known IPs/VPC's
· Duplicate role usage detection

Attacker executes API
calls for malicious action
or privilege escalation
· Service endpoint access policies (for restricting data access)
· S3 access points · Least privilege
IAM policies

#RSAC
Server Side Request Forgery -> Credential Abuse

Identify instance /container with potential SSRF

SSRF exploited to extract
credentials via metadata service

Establish session with credentials in
attacker's environment

· Restrict public Internet access via VNET policy
· Patch for SSRF (vulnerability management)
Presenter's Company Logo ­ replace or delete
on master slide

· Use Azure instance metadata service (RFC 1918 address) only accessible by VM and protected from SSRF

Attacker executes API
calls for malicious action
or privilege escalation
· Host VM hardening
· Least privilege VM access policies

#RSAC
Server Side Request Forgery -> Credential Abuse

Identify instance /container with potential SSRF

SSRF exploited to extract
credentials via metadata service

Establish session with credentials in
attacker's environment

· Restrict public Internet access
· Patch for SSRF (vulnerability management)
Presenter's Company Logo ­ replace or delete
on master slide

· Use metadata service v2
· Proxy metadata service URL requests

· API call origin request conditionals > IAM policy with conditionals to known IPs/VPC's
· Duplicate role usage detection

Attacker executes API
calls for malicious action
or privilege escalation
· Service endpoint access policies (for restricting data access)
· S3 access points · Least privilege
IAM policies

Demo
Presenter's Company Logo ­ replace or delete
on master slide

#RSAC

Cryptomining

#RSAC

Category Severity

Attack (Scripted or Targeted)
Low

Liklihood

High

Primary CSA Top Threat
Primary Mitre ATT&CK

11. Security Issue: Abuse
 and Nefarious Use of Cloud
 Services
Resource Hijacking,
 Unused/Unsupported Cloud Regions

#RSAC
Cryptomining

Obtain credentials with RunInstance/ VM/container*

(Optional) assess current
usage to ID target
environment

Run large instance/VM

Run/inject cryptominer and connect to
network

Exfiltrate results

Compromise exposed
instance/VM/ container
Presenter's Company Logo ­ replace or delete
on master slide

* See credential exposure kill chain for details

Cryptomining

Obtain credentials with RunInstance/VM/
container*

(Optional) assess current usage to
ID target environment

Run large instance/VM

Run/inject cryptominer and
connect to network

Exfiltrate results

Compromise exposed
instance/VM/ container

#RSAC

· See credential exposure kill chain and SSRF kill chain
· Least privilege
Presenter's Company Logo ­ replace or delete
on master slide

· Vulnerability assessment · Network security

· Lock down unused regions
· API call (CloudTrail/ Activity Log) monitoring for excess Describe call usage

· GuardDuty/Azure Security Center
· Flow logs

· Restrict AMIs/VMs to only pre-approved
· Least privilege · Billing alerts

· Flow log monitoring and alerting
· Outbound traffic restrictions

Cryptomining

Obtain credentials with RunInstance/VM/
container*

(Optional) assess current usage to
ID target environment

Run large instance/VM

Run/inject cryptominer and
connect to network

Exfiltrate results

Compromise exposed
instance/VM/ container

#RSAC

· See credential exposure kill chain and SSRF kill chain
· Least privilege
Presenter's Company Logo ­ replace or delete
on master slide

· Vulnerability assessment · Network security

· Azure Policy · Activity logs alerted via
SIEM correlation to identify increased usage · Azure monitor configured for threshold cost controls

· Azure Security Center · Flow logs · Egress traffic monitored
via Azure Firewalll

· Azure policy to restrict VM images
· Azure monitor configured for threshold cost controls

· Flow log monitoring and alerting
· Outbound traffic restrictions

Network Attack

#RSAC

Category Severity

Attack (Scripted or Targeted)
High

Liklihood

Medium

Primary CSA Top Threat
Primary Mitre ATT&CK

10. Security Issue: Limited
 Cloud Usage Visibility
Network Service Scanning,
 Remote System Discovery

#RSAC
Network Attack

Identify Internet exposed resource (instance/ container)

Identify vulnerability on
exposed resource

Exploit vulnerability and gain foothold/
persistence

Pivot to rest of virtual network
and peered networks

Exploit additional resources,
including pivoting into the cloud management plane

Presenter's Company Logo ­ replace or delete
on master slide

#RSAC
Network Attack

Identify Internet exposed resource (instance/ container)

Identify vulnerability on
exposed resource

Exploit vulnerability and gain foothold/
persistence

Pivot to rest of virtual network
and peered networks

Exploit additional resources,
including pivoting into the cloud management plane

· Restrict public
Internet access
using security
groups
· Alert on security
group changes
Presen·terC'soCnotminpuaonuys Logo ­ replasceseosrsdmeleetnet of
on massteecr uslriditey groups

· Vulnerability management

· Immutable · Flow log
monitoring for C&C traffic · Guard Duty or Azure Threat Protection

· Internal security group restrictions (least privilege network)
· Segmentation with subnets, route tables, and VPC's/VNets

· See guidance on leaked/exposed secrets
· See guidance on privilege escalation

#RSAC

Compromised Secrets (Instance/VM)

Category Severity

Attack (Scripted or Targeted)
High

Liklihood

High

Primary CSA Top Threat
Primary Mitre ATT&CK

4. Security Issue: Insufficient
 Identity, Credential, Access
 and Key Management
 5.Security Issue: Account
 Hijacking
Valid Accounts,
 Credentials in Files

#RSAC
Compromised Secrets (Instance/VM)

Static secret stored locally or passed as user-
data

Instance/VM Compromised

Attacker accesses local
storage

Presenter's Company Logo ­ replace or delete
on master slide

Attacker makes "Describe" call
via API or console

Attacker accesses User-
Data field via API or metadata
service

Attacker locates secret

Attacker compromises additional target using secret (e.g. database via static password)

Compromised Secrets (Instance/VM)

Static secret stored locally or passed as user-
data

Instance/VM Compromised

Attacker accesses local
storage

Attacker makes "Describe" call via
API or console

Attacker accesses UserData field via API
or metadata service

Attacker locates secret

Attacker compromises additional target using secret (e.g. database via static
password)

· Never pass in a secret as userdata
· Use a secrets manager tool

· Vulnerability management

Presenter's Company Logo ­ replace or delete
on master slide

· Use resource restrictions on IAM/RBAC for read/describe access
· Limit read access to sensitive resources

· Limit secrets to specific process/ user access
· Use metadata defenses as listed in other killchains

· Network/source restrictions may limit attack if attacker tries to use secret from external location

#RSAC

#RSAC

Novel Cloud Data Exposure and Exfiltration

Category

Misconfiguration

Severity

High

Liklihood

Medium

Primary CSA Top Threat
Primary Mitre ATT&CK

9. Metastreucture and Applistructure Failures
Account Manipulation, Transfer Data to Cloud Account

Novel Cloud Data Exposure and Exfiltration

Data stored in resource with potential to be
public or externally
shared

Attacker makes resource public

Presenter's Company Logo ­ replace or delete
on master slide

Attacker snapshots or
packages resource into new shareable
resource

Attacker makes resource public
or shares externally

Attacker accesses data from resource
share

Examples: Instance/VM snapshots VHDs AMIs RDS snapshots Public Lambda Lambda behind public API Gateway Elasticsearch

#RSAC

I see public EVERYWHERE!
Presenter's Company Logo ­ replace or delete
on master slide

#RSAC

Novel Cloud Data Exposure and Exfiltration

Data stored in resource with potential to be
public or externally shared

Attacker makes resource public

Attacker makes resource public
or shares externally

Attacker accesses data from resource
share

Attacker snapshots or
packages resource into new shareable
resource

· Data governance
Presenter's Company Logo ­ replace or delete
on master slide

· SCP's/Policies · IAM restrictions · Continuous
assessment · Reactive
Guardrails

· SCP's/Policies · IAM restrictions · Continuous
assessment · Reactive
Guardrails · Encryption (KMS/
Key Vault)

· SCP's/Policies · IAM restrictions · Continuous
assessment · Reactive
Guardrails · Encryption (KMS/
Key Vault)

· Resource policies/Access controls
· Network origin restrictions

#RSAC

Subdomain Takeover

#RSAC

Category Severity

Attack (Scripted or Targeted)
Medium

Liklihood

High

Primary CSA Top Threat
Primary Mitre ATT&CK

10. Limited Cloud Usage Visibility
Resource Hijacking

#RSAC
Subdomain Takeover

Identify orphaned subdomain DNS resource

Create resources in same cloud
provider

Claim orphaned resource name

Set up phish landing site

Execute phishing campaign

Presenter's Company Logo ­ replace or delete
on master slide

#RSAC
Subdomain Takeover

Identify orphaned subdomain DNS resource

Create resources in same cloud
provider

Claim orphaned resource name

Set up phish landing site

Execute phishing campaign

· Keep placeholder resources
 In place to avoid subdomain orphans
 · Add a task to existing automation management 
 jobs to ensure any service with custom 
 domains have a delete resource lock. 
 · Create a serverless function that monitors provider 
 LoPgreoes­evnreetneprtl'asscCtehooamrtdpwealnoeytueld alert/take action on the 
 odnemleatisotenr oslfidae service with a custom domain name

· Reduce TTL in granted 
 subdomain records
 · Build automation to 
 detect and takeover 
 your own teams subdomains!


· Implement anomalous traffic 


detection to identify 


· Implement resource 


unauthorized resource usage

monitoring for cloud 


subscriptions to understand 


if/when new resources are being deployed

#RSAC
Non-Killchain Related Issues
Privilege escalation
­ e.g. RunInstance + PassRole without resource restriction
Pre-signed URLs
­ Any API call in AWS can be a pre-signed URL, not just S3
3rd Party Cross Account Access
­ Can be abused; especially if External ID's are not randomized
Azure "public by default" VNets and services
­ All VM resources have outbound Internet access by default (NAT) ­ Some services require public inbound and do not respect defined Network Security
Group rules
45

#RSAC
Contributing Factors
Excessive permissions Scale Use of "traditional" architectures (e.g. network sprawl) Segregation Ineffective monitoring and inadequate logging
46

#RSAC
Apply
Prioritize the killchains based on your:
­ Cloud providers ­ Deployment architectures ­ Sensitivity/risk profile of environments
Identify overlapping controls that break each killchain
­ Hints- least privilege IAM, continuous monitoring and enforcement
Implement defenses in prioritized layers
­ Place at least one control in place for each killchain ­ Then layer in additional controls
47

SESSION ID: CSV-T08
Break the Top 10 Cloud Attack Killchains

Rich Mogull
Analyst/Securosis CISO/DisruptOps @rmogull

Shawn Harris
Managing Principal Security Architect Starbucks @infotechwarrior

#RSAC

