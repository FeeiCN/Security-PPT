Mural by Edoardo Kobra in Minneapolis, Minnesota

Threat Hunting in the Microsoft Cloud
John Stoner @stonerpsu May 2020

# whoami > John Stoner

GCIA, GCIH, GCTI
Principal Security Strategist @stonerpsu

20+ years of cyber security experience
Blogger on Hunting and SecOps
Built a fun little investigator/hunting app
Loves The Smiths and all 80's sadtimey music

In the next 30 minutes...
· Implications of moving to the cloud using Microsoft's cloud services, Azure Active Directory and Office 365 and the Attack surface
· Compare was is available in the cloud compared to on-premise and how the logging changes
· Perform an abbreviated hunt in Azure AD and Office 365 to observe the fidelity of the events that a hunter would have access to
· Illustrate why cloud logging needs to be supplemented with on-premise logs
· Map to MITRE ATT&CK's cloud matrix

A Very High-Level View of Microsoft Cloud Services

Microsoft Cloud is a high value target

Phishing Password Spray

"attackers have started to spoof the new Azure AD sign-in page in multiple phishing campaigns. We have so far seen several dozens of phishing sites used in these campaigns" - Microsoft Security Intelligence 2020
"80% of those compromised enterprise accounts,... almost 1 million hacked accounts in January alone, were hit by either "password spray" or "replay" attacks." - Forbes, March 2020

Malware

"As Office 365 OAuth apps can give attackers complete access to an Office 365 account, they can be used for a variety of attacks." - bleepingcomputer.com, Dec 2019

Once in, they are in
Office 365 and Azure security is great unless adversary gets legitimate credentials
Logging can be challenging
Microsoft's cloud logging can be difficult to configure and it has some interesting event time to index time issues
Adversaries are targeting it, but we aren't looking
It's another place to hunt, with new detections to build

Password Spraying

Brute Force Password Attack

Keep hitting the same user account with a dictionary of passwords and permutations until you get a hit Thresholds in the authentication system trigger lock outs SIEMs have rules to detect this

john 123456 john 123456789 john qwerty john password john 111111 john 12345678 john abc123 john 1234567 john password1 john 12345

Password Spray Attack

Rthoellsaacmroesspuasseswrsowrdith Avoids the aisusutheentication lock out SgIrEeMatswdaoynt'ot hmaoveniator for this out of the box Good password policies are key to foiling this

john jim harry jack charles karen richard kyle robert steve

Also MFA

123456 123456 123456 123456 123456 123456 123456 123456 123456 123456

ON-PREMISES INFRASTRUCTURE MAPPED TO MS Cloud

TECHNOLOGY

ON-PREMISES SOLUTION

Archiving

Tape library, off site tape storage

Caching

Memcached, Redis

Computer

Hardware, virtualization

Containers

Docker, Kubernetes

Content delivery Data centers Data warehousing

CDN solutions Data centers Specialized hardware and software solutions

Databases

MS SQL, MySQL, Oracle, PostgreSQL

Deployment Disaster recovery Domain name services Email Identity management Load balancing Management and monitoring

Ansible, Chef, Fabric, Puppet, SaltStack Multi-site data centers DNS providers Email software LDAP Hardware and software load balancers, HA Proxy Performance and user monitoring solutions

Messaging and workflow Network Scaling Security Storage

Messaging and workflow software
MPLS, VPN Hardware and software clustering, Apache ZooKeeper Firewalls, NACLs, routing tables, disk encryption, SSL, IDS, IPS DAS, NAS, SAN, SSD

MS Cloud
Azure Backup, Azure Storage archive access tier
Azure Redis Cache
Azure Virtual Machines Azure Container Instances, Azure Container Registry, Azure Kubernetes Service (AKS), Service Fabric Mesh Azure Content Delivery Network
Availability Zones
SQL Data Warehouse SQL Database, Azure Database for MySQL, Azure Database for PostgreSQL, Azure Cosmos DB Azure Resource Manager, VM extensions, Azure Automation, App Service, Azure Automation Azure Regions
Azure DNS, Traffic Manager
Office365
Azure Active Directory Domain Services, Azure Active Directory
Load Balancer, Application Gateway
Azure Monitor, Azure Event Hubs, Azure Stream Analytics
Azure Notification Hubs, Azure Queue Storage, Service Bus, Logic Apps
ExpressRoute, Virtual Network, Azure VPN Gateway
Virtual Machine Scale Sets Key Vault, Azure Storage Service Encryption, Application Gateway - Web Application Firewall, Azure Firewall, Security Center Azure managed disks, Azure Blob storage, Azure Storage cool tier

Words of Caution
Over time, clouds change shape
· The exact fields or detail may change over time at the discretion of the cloud provider
· When you set this up, you may find more data or less available to you
· Important to understand the differences compared to on-premise Windows logging

Windows Event Log
4624 Login Event

Azure AD Sign-In Event
Accessing O365 Exchange in MS Cloud

OneDrive - File Modification Event
Key Fields of Note

Message Trace in MS Cloud

Initial intelligence around Taedonggang indicates that they may use link files to gain access to
a targeted environment

.LNK Visibility?
· What is the name of the link file that was associated with anonymous clicks?
· Which users are associated with that link file? · Who was the first named user to click the link? · What workload is the anonymous file access
associated with?

Suspicious Link File
· What was the first operation seen?

Anonymous Link Creation

Anonymous Link Creation

Tell Us More About Bruce...

Different Users, Same IP

Azure Active Directory and Fyodor

What Accounts Are Being Modified?

Properties Being Changed?

Exchange Visibility

Things We Can't See

Workstations Logs Servers not in Azure Network/Wire Data

What We Learned From Our Hunt

· Bruce Gist's account was compromised · Created an anonymous link that was used to gain additional access to Frothly
· Fyodor's account was compromised · Fyodor had elevated privileges · This account was used to enable a dormant user and assign elevated creds to maintain persistence · This account also modified Exchange permissions and rules to gain access to emails
· Files were moved around and out of Frothly

What Can We Operationalize?

Logins of different users from the same IP?
Tenant/Site Admin modifications?

Exchange Rule Creations?

File Upload/Download?

Tough by itself, perhaps with additional criteria based on behavior

ATT&CK for Microsoft Cloud Services
Azure, Azure Active Directory and Office365

What Techniques Did We Observe the
Adversary Using?
Azure, Azure Active Directory and Office365

Summary
· Understand the difference between the logging MS Cloud provides compared to Microsoft logs on premise
· Much of it is easy to understand
· BUT...it is cloaked in JSON
· Use who, what, where, when, why and how to form the basis of your hunt
· Schemas and fields may change over time

Data Set That Includes Cloud Data to Play With!!!

BOTS version 3
· https://www.splunk.com/en_us/bl og/security/botsv3-datasetreleased.html
· Dataset https://github.com/splunk/security datasets

Thank You
John Stoner | @stonerpsu

