SESSION ID: TECH-F02
Securing Active Directory Correctly

Derek Melber, MVP
Technical Evangelist ManageEngine @derekmelber

#RSAC

#RSAC
About Your Speaker
 Derek Melber, MCSE & MVP (Group Policy and AD)
 derek@manageengine.com
 Global Active Directory Seminars
 Monitoring and Auditing AD  Securing AD Delegations  Recovering AD Modifications and Deletions
 Online Resources
 ManageEngine Active Directory Blog  www.auditingwindowsexpert.com
 Publications
 Group Policy Resource Kit ­ MSPress

#RSAC
Agenda
 Active Directory Delegation is Configured Properly  Anonymous Connections are Protected  Authentication is Secured Properly  Password Policy is Configured Securely

#RSAC
Active Directory Delegation
 Ability for AD admin to grant control over AD objects  Typically done to Jr Admins, managers, etc  Provides control over AD, but only in limited fashion  Delegation is not "obvious" using Microsoft tools  Incorrect delegations could be granted very easily

#RSAC
Active Directory Delegation
 Delegation for administration of AD objects  Users
 Create or delete  Modify properties  Enable/Disable  Reset password  Unlock
 Groups
 Creation, deletion, modification  Group membership
 Computers
 Create or delete

#RSAC
Active Directory Delegation
 Verify AD Delegations by using dsacls

#RSAC
Anonymous Connections
 Anonymous access can grant too much access...
 To shared folders  Users and their properties
 Anonymous access is no longer needed for most apps  Microsoft provides controls, but not highly noted  Windows 2000 is still vulnerable!

#RSAC
Anonymous Connections
 Clean out Pre-Windows 2000..... Group
 At install Everyone "could" be placed into this group
 Ensure all 4 anonymous security settings are correct
 Network access: Allow anonymous SID/Name translation  Network access: Do not allow anonymous enumeration of SAM accounts  Network access: Do not allow anonymous enumeration of SAM accounts
and shared folders  Network access: Let Everyone permissions apply to anonymous users

#RSAC
Anonymous Connections

#RSAC
Use of LAN Manager Authentication
 LAN Manager is a legacy authentication protocol  LAN Manager (LM) was designed for Windows 3.11
 (Do you remember what this OS version was called?)
 LM is easily cracked with the correct information exposed  Eliminating LM can be difficult, but not impossible
 Could break legacy applications... which is major issue

#RSAC
LMCompatibilityLevel
 0 and 1
 Clients use LM and NTLM authentication and never use NTLMv2 session security.
 Domain controllers accept LM, NTLM, and NTLMv2 authentication.  Client does not use NTLMv2 auth
2
 Clients use NTLM authentication only and use NTLMv2 session security if the server supports it.
 Domain controllers accept LM, NTLM, and NTLMv2 authentication.  Client refuses to send LM response
3
 Clients use NTLMv2 authentication only and use NTLMv2 session security if the server supports it
 Domain controllers accept LM, NTLM, and NTLMv2 authentication.

#RSAC
LMCompatibilityLevel
4  Clients use NTLMv2 authentication only and use NTLMv2 session security if the server supports it.  Domain controllers refuse LM and accept only NTLM and NTLMv2 authentication.
5  Clients use NTLMv2 authentication only and use NTLMv2 session security if the server supports it  Domain controllers refuse LM and NTLM (they accept only NTLMv2 authentication).

#RSAC
Use of LAN Manager Authentication

#RSAC
Restricting NTLM Authentication Traffic
 New Group Policy Controls (Server 2003+)  Detailed control over NTLM  Audit or restrict  Incoming or outgoing traffic
14

#RSAC
Storage of LM Hash
 LM is a very weak authentication protocol  LM hash is not required  LM hash can be stored in AD and local SAM  Obtaining LAN Manager hash is easy way to crack passwords

#RSAC
Storage of LM Hash

#RSAC
Password Policy
 Password policy controls structure of user password  Password policy is "rarely" if "ever" understood and configured
properly!  A weak or incorrect password policy could leave your organization
completely exposed!  Approximately 1 out of every 100 auditors correctly analyze these
configurations

#RSAC
Password Policy
 Local SAM (Servers and Desktops)  Active Directory (Domain Controllers)
 Domain User Accounts  Local SAM user accounts
 Fine-Grained Password Policies
 Provide granular control of passwords to different users  Must have the correct environment configured

#RSAC
Password Policy

#RSAC
Apply What You Learned
 How to Properly Configure Active Directory Delegation  Ensured Anonymous Connections are Protected  Properly Secured AD Authentications  Analyzed and Configured the Password Policy Correctly

#RSAC
Resources
 derek@manageenginecom  Active Directory blog on www.manageengine.com  www.auditingwindowsexpert.com  www.windowsecurity.com  www.windowsnetworking.com  The Group Policy Resource Kit (MSPress)

Thank you!

Questions?

#RSAC

Derek Melber derek@manageengine.com

