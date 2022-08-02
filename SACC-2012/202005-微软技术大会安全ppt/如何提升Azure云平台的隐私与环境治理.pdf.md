Microsoft Online Tech Forum 

Azure  

Agenda

·  &  · Azure · & ·  ·  · 

 & 


Governance is all of the processes of governing, whether undertaken by a government, market or network, whether over a family, tribe, formal or informal organization or territory and whether through the laws, norms, power or language of an organized society.
It relates to "the processes of interaction and decision-making among the actors involved in a collective problem that lead to the creation, reinforcement, or reproduction of social norms and institutions."
In lay terms, it could be described as the political processes that exist in between formal institutions.
https://en.wikipedia.org/wiki/Governance










1. 
2.  3. 

  

Azure

Azure 
Core/Core Network Azure Scaffold

Azure 

1.  &

Management Groups Subscriptions

Policy Definitions Role-based
Access ARM Templates

CRUD

2.  & 
3. : 

Azure Resource Manager (ARM)

Query

 ­ Azure Policy

Security
Azure Security Center Guest Config baselines
Key Vault certificate NSG rules
AKS & AKS Engine RBAC role assignment

Regulatory Compliance
NIST SP 800-53 R4 ISO 27001:2013 CIS PCI v3.2.1:2018
FedRAMP Moderate Canada Federal PBMM SWIFT CSP-CSCF v2020 UK Official and UK NHS
IRS 1075

Tags

Resource standardization

Require specified tag Add or replace a tag Inherit a tag from the RG
Append a tag

Allowed/ not allowed RP Allowed locations Naming convention Back up VMs
Allowed images for AKS

Cost
Allowed VM SKUs Allowed Storage SKUs

 & 

&



Identity & access management

Data protection

Network security

Threat protection

Security management

Azure Active Directory
Multi-Factor Authentication
Role Based Access Control
Azure Active Directory (Identity Protection)

Encryption (Disks, Storage, SQL)
Azure Key Vault
Confidential Computing

VNET, VPN, NSG
Application Gateway (WAF), Azure Firewall
DDoS Protection Standard
ExpressRoute

Azure Security Center

Microsoft Antimalware for Azure

Azure Log Analytics

+ Partner Solutions


Public IP Public IP
On Premises Network(s)
https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/shared-services


VIRTUAL MACHINES ­ WINDOWS & LINUX AZURE DISK ENCRYPTION - <BitLocker [Windows], DM-Crypt [Linux]> PARTNER VOLUME ENCRYPTION - <CloudLink SecureVM, SafeNet ProtectV, etc.>
SQL SERVER (VM), AZURE SQL DATABASE & AZURE SQL DATA WAREHOUSE TDE (TRANSPARENT DATA ENCRYPTION) - <SQL Server, Azure SQL Database or Azure SQL Dara Warehouse> CLE (CELL LEVEL ENCRYPTION) - <SQL Server or Azure SQL Database> SQL SERVER ENCRYPTED BACKUPS ALWAYS ENCRYPTED SQL Server Azure SQL Database
AZURE COSMOS DB
AZURE DATA LAKE AZURE DATA LAKE
STOCKAGE AZURE APPLICATION LEVEL ENCRYPTION AZURE STORAGE SERVICE ENCRYPTION (Blobs,
AZURE HDINSIGHT
AZURE BACKUP SERVICE AZURE BACKUP SERVICE - <Leverage Azure Disk Encryption>

KEY MANAGEMENT INTERFACES

AZURE KEY VAULT <Keys and Secrets controlled by customers in their key vault>
AUTHENTICATION TO KEY VAULT <Authentication to Key Vault is using Azure AD>



Resource Role Permissions

Segment Model Variations





Azure Blueprints
Cloud Engineer
Cloud Architect

Blueprint
Resource Groups
ARM Templates
Policy Definitions
Role-based access controls
Custom Scripts*
Coming in June 2019
+
ISO 27001 FedRAMP
NIST

Azure DevOps
https://docs.microsoft.com/en-us/azure/devops/index?view=azure-devops




https://docs.microsoft.com/en-us/azure/architecture/cloud-adoption/governance/resource-consistency/

 ­ 

Azure Backup

Availability Sets, Zones and Region Pairs

Azure Site Recovery

Azure

Industry-only
VM SLA 99.9%

VM SLA 99.95%

High availability SLA
VM SLA 99.99%

Disaster recovery
Regions 54

Single VM
Protection with Premium Storage

Availability sets
Protection against failures within datacenters

Availability zones
Protection from entire datacenter failures

Site Recovery & Region pairs
Protection from disaster with Data Residency compliance

AZs available across US, Europe and Asia... more regions coming soon

Azure 

 ­ Azure Service Health

 ­ Azure Resource Graph

 ­ Azure Advisor
 CPU RI




 
Management teams
  & 
Finance teams
Team 
App teams







 ­ Azure Cost Management

The End & 

 & 

© Copyright Microsoft Corporation. All rights reserved.

PPT 

