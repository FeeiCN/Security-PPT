An Unauthenticated Journey to Root : Pwning Your Company's Enterprise Software Servers
Pablo Artuso - Yvan Genuer
#BHUSA @BLACKHATEVENTS

Disclaimer
· This presentation contains references to the products of SAP SE. SAP, R/3, xApps, xApp, SAP NetWeaver, Duet, PartnerEdge, ByDesign, SAP Business ByDesign, and other SAP products and services mentioned herein are trademarks or registered trademarks of SAP AG in Germany and in several other countries all over the world.
· Business Objects and the Business Objects logo, BusinessObjects, Crystal Reports, Crystal Decisions, Web Intelligence, Xcelsius and other Business Objects products and services mentioned herein are trademarks or registered trademarks of Business Objects in the United States and/or other countries.
· SAP SE is neither the author nor the publisher of this publication and is not responsible for its content, and SAP Group shall not be liable for errors or omissions with respect to the materials.

2

Onapsis Inc. | All Rights Reserved

Who are we?
Security Researcher Security Researcher

Onapsis Inc. | All Rights Reserved

1. Introduction 2. The Target: SolMan 3. From Unauthenticated Restricted Access... 4. ...to RCE as Agent administrator 5. ...to root them all! 6. Recommendations 7. Conclusion

Onapsis Inc. | All Rights Reserved

1. Introduction 2. The Target: SolMan 3. From Unauthenticated Restricted Access... 4. ...to RCE as Agent administrator 5. ...to root them all! 6. Recommendations 7. Conclusion

Onapsis Inc. | All Rights Reserved

Introduction - SAP ?

6

Onapsis Inc. | All Rights Reserved

Introduction
BI

ERP

CRM

7

Onapsis Inc. | All Rights Reserved

1. Introduction 2. The Target: SolMan 3. From Unauthenticated Restricted Access... 4. ...to RCE as Agent administrator 5. ...to root them all! 6. Recommendations 7. Conclusion

Onapsis Inc. | All Rights Reserved

The Target: SolMan
· SAP Solution Manager · Technical SAP System dedicated to Administrators · Highly connected into SAP landscape · Used to manage all other SAP systems, OS independent, SAP
product independant

9

Onapsis Inc. | All Rights Reserved

The Target: SolMan

10

Onapsis Inc. | All Rights Reserved

The Target: SolMan

11

Onapsis Inc. | All Rights Reserved

The Target: SolMan
Why is SolMan a target ?

12

Onapsis Inc. | All Rights Reserved

The Target: SolMan
Because, it is the technical heart of the SAP landscape !

13

Onapsis Inc. | All Rights Reserved

The Target: SolMan
· SolMan is not working alone · It uses software agents installed on every SAP server · Called SMDAgent for "SAP Solution Manager Diagnostic Agent" · This agent manages communications, instance monitoring and
diagnostic feedback to the SolMan

14

Onapsis Inc. | All Rights Reserved

The Target: SolMan

15

Onapsis Inc. | All Rights Reserved

The Target: SolMan
· SolMan is accessible using SAPGui or through its own web server

16

Onapsis Inc. | All Rights Reserved

1. Introduction 2. The Target: SolMan 3. From Unauthenticated Restricted Access... 4. ...to RCE as Agent administrator 5. ...to root them all! 6. Recommendations 7. Conclusion
Onapsis Inc. | All Rights Reserved

From Unauthenticated Restricted Access... Almost missed it
· Where to start ?
· Looking for all web applications exposed by SolMan related to SMDAgent
· What we found ?
· Around 60+ applications · Name like
· tc~smd~agent~application* · tc~smd~*
· 20+ of them accessible through HTTP GET, POST or SOAP requests

18

Onapsis Inc. | All Rights Reserved

From Unauthenticated Restricted Access... Almost missed it

... SOAP SOAP GET GET SOAP SOAP POST GET GET GET SOAP SOAP SOAP GET SOAP ...

http://solman:50200/smd/ws/configuration/upgrade/agentports http://solman:50200/smd/ws/configuration/upgrade/setupAuthentication http://solman:50200/smd/upgrade/JavaSslPortCheck http://solman:50200/smd/upgrade/UMECheckServlet http://solman:50200/DiagSetupServices/DiagSetupConf http://solman:50200/SMDAgentRepository/ConfigurationOD http://solman:50200/tc~smd~agent~application~e2emai/CollectorSimulation http://solman:50200/tc~smd~agent~application~eem/EEM http://solman:50200/tc~smd~agent~application~logfilecollector/LogService http://solman:50200/E2eTraceGatewayW/E2eTraceServlet http://solman:50200/AgentConfigurationWS/AgentConfiguration http://solman:50200/ExmSetupServices/ExmSetupConf/ http://solman:50200/ManagedSetupWS/Config1 http://solman:50200/tc~smd~selfcheck~repository/SelfCheckTest http://solman:50200/SVGConvertService/SVGConvert

19

Onapsis Inc. | All Rights Reserved

From Unauthenticated Restricted Access... Almost missed it
Hey look this one ! Unfortunately authentication
required, but sounds powerful.
Euh... no... it's not authenticated !
Damn, you are right ! Almost missed it :)

20

Onapsis Inc. | All Rights Reserved

End-user Experience Monitoring (EEM)
· What: Web application running in SolMan's webserver. · Goal: Evaluating availability and performance of systems from
client side. · How: Mimic end-user activities with automated scripts. These
scripts are uploaded to the EEM and later deployed to the EEM robots. SMD agents are EEM Robots by default. · old(UxMon) = EEM.
Onapsis Inc. | All Rights Reserved

End-user Experience Monitoring (EEM)
Onapsis Inc. | All Rights Reserved

End-user Experience Monitoring (EEM)

1. Administrator uploads a script

Script Onapsis Inc. | All Rights Reserved

End-user Experience Monitoring (EEM)

Script

Script

Script

2. Script is deployed to a EEM robot
Script

Onapsis Inc. | All Rights Reserved

End-user Experience Monitoring (EEM)

Wait.. You said EEM had

no authentication at all?

Script

Script

Script

Script

Onapsis Inc. | All Rights Reserved

End-user Experience Monitoring (EEM)
Script Onapsis Inc. | All Rights Reserved

1. Introduction 2. The Target: SolMan 3. From Unauthenticated Restricted Access... 4. ...to RCE as Agent administrator 5. ...to root them all! 6. Recommendations 7. Conclusion

Onapsis Inc. | All Rights Reserved

...to RCE as Agent administrator: EEM Technical Analysis

· runScript parameters:

· Script

"foo_script"

· Agent name

SMD host

· First attempt, not-so-happy answer:
<errorMessage>com.sap.smd.eem.admin.EemException: EEM is not enabled on this agent. Operation only supported when EEM is enabled.</errorMessage>

28

Onapsis Inc. | All Rights Reserved

...to RCE as Agent administrator: EEM Technical Analysis
· getAllAgentInfo no parameters required.
· Type of information retrieved:
· Versions of OS, JVM, SDK. · User environmental variables · EEM properties:
·... · eem.enable = false · ...

29

Onapsis Inc. | All Rights Reserved

...to RCE as Agent administrator: EEM Technical Analysis

· setAgeletProperties parameters:

· Agent name

SMD host

· Key

eem.enable

· Value

True

· getAllAgentInfo · eem.enable = True

· runScript

<errorMessage>com.sap.smd.eem.admin.EemException: Script foo_script not found.</errorMessage>

30

Onapsis Inc. | All Rights Reserved

...to RCE as Agent administrator: EEM Technical Analysis

· uploadResource parameters:

· Agent name

SMD host

· Content (b64)

b64(rand_string)

<errorMessage>FatalError validating XML document: Content is not allowed in prolog</errorMessage>

· Content (b64)

b64(xml_prolog)

<errorMessage>FatalError validating XML document: Premature end of file.</errorMessage>

31

Onapsis Inc. | All Rights Reserved

...to RCE as Agent administrator: EEM Technical Analysis

· From documentation · Protocols: RFC, DIAG, HTTP, SOAP. · EEM editor. · SAP provides you an HTTP example script.
· Develop custom script based on error messages
Error validating XML document: Invalid content was found starting with element 'blahblah'. One of '{Annotation, Headers, Param, Check, Search, Part}' is expected
· GOT SSRF!

32

Onapsis Inc. | All Rights Reserved

...to RCE as Agent administrator: Going for RCE
· Scripting language to mimic user actions  Powerful and flexible
· Blackbox  Whitebox (java application)
· Found the "Grammar" of the scripting language · Message-based language. · Message types:

33

Onapsis Inc. | All Rights Reserved

...to RCE as Agent administrator: Going for RCE
· From message parser analysis

· Some available commands:

· Assign

· AssignJS

· AssignFromList

· WriteVariableToFile

· AssignFromFile

· ReadVariableFromFile

34

Onapsis Inc. | All Rights Reserved

...to RCE as Agent administrator: Going for RCE
· While analyzing those commands:

· Serious and common mistake in JAVA · expression is not sanitized and it's controlled by the attacker.
· Access to perform scriptsexecute commands in SMD Agents

EVERYONE (no auth)
35

Run commands as daaadm
Onapsis Inc. | All Rights Reserved

...to RCE as Agent administrator: EEM Technical Analysis

1. Attacker gets data from agents.
36

Onapsis Inc. | All Rights Reserved

...to RCE as Agent administrator: EEM Technical Analysis

2. Attacker chooses target and change its configuration.
37

Onapsis Inc. | All Rights Reserved

...to RCE as Agent administrator: Going for RCE

3. Attacker uploads RCE script to target
38

RCE Script
Onapsis Inc. | All Rights Reserved

...to RCE as Agent administrator: Going for RCE

4. RCE as daaadm executed
39

Onapsis Inc. | All Rights Reserved

Onapsis Inc. | All Rights Reserved

...to RCE as Agent administrator

41

Onapsis Inc. | All Rights Reserved

1. Introduction 2. The Target: SolMan 3. From Unauthenticated Restricted Access... 4. ...to RCE as Agent administrator 5. ...to root them all! 6. Recommendations 7. Conclusion

Onapsis Inc. | All Rights Reserved

...to root them all : SAP Host Agent

43

Onapsis Inc. | All Rights Reserved

...to root them all : What is that ?

· Agent that can accomplish several life-cycle tasks
· operating system monitoring · database monitoring · system instance control · upgrade preparation
· Installed automatically during the installation of new SAP system

· OS independent

Source : https://help.sap.com/doc/saphelp_nw73ehp1/7.31.19/en-US/48/c6f9627a004da5e10000000a421937/content.htm

44

Onapsis Inc. | All Rights Reserved

...to root them all : Why we take a look ?
Only 3 commands convinced us :

# ps -ef | grep hostctrl root 92067 1 0 /usr/sap/hostctrl/exe/saphostexec pf=/usr/sap/hostctrl/exe/host_profile sapadm 92072 1 0 /usr/sap/hostctrl/exe/sapstartsrv pf=/usr/sap/hostctrl/exe/host_profile root 92338 1 0 /usr/sap/hostctrl/exe/saposcol -l -w60 pf=/usr/sap/hostctrl/exe/host_profile
# ss -larntp | grep 92072 LISTEN 0 20 *:1128 *:* users:(("sapstartsrv",pid=92072,fd=18))
# grep daaadm /usr/sap/hostctrl/exe/host_profile service/admin_users = daaadm

45

Onapsis Inc. | All Rights Reserved

...to root them all : Why we take a look ?

Only 3 commands convinced us :

Services running as root

# ps -ef | grep hostctrl root 92067 1 0 /usr/sap/hostctrl/exe/saphostexec pf=/usr/sap/hostctrl/exe/host_profile sapadm 92072 1 0 /usr/sap/hostctrl/exe/sapstartsrv pf=/usr/sap/hostctrl/exe/host_profile root 92338 1 0 /usr/sap/hostctrl/exe/saposcol -l -w60 pf=/usr/sap/hostctrl/exe/host_profile
# ss -larntp | grep 92072 LISTEN 0 20 *:1128 *:* users:(("sapstartsrv",pid=92072,fd=18))
# grep daaadm /usr/sap/hostctrl/exe/host_profile service/admin_users = daaadm

46

Onapsis Inc. | All Rights Reserved

...to root them all : Why we take a look ?
Only 3 commands convinced us :

# ps -ef | grep hostctrl
Service exposed remotely root 92067 1 0 /usr/sap/hostctrl/exe/saphostexec pf=/usr/sap/hostctrl/exe/host_profile
sapadm 92072 1 0 /usr/sap/hostctrl/exe/sapstartsrv pf=/usr/sap/hostctrl/exe/host_profile root 92338 1 0 /usr/sap/hostctrl/exe/saposcol -l -w60 pf=/usr/sap/hostctrl/exe/host_profile
# ss -larntp | grep 92072 LISTEN 0 20 *:1128 *:* users:(("sapstartsrv",pid=92072,fd=18))
# grep daaadm /usr/sap/hostctrl/exe/host_profile service/admin_users = daaadm

47

Onapsis Inc. | All Rights Reserved

...to root them all : Why we take a look ?
Only 3 commands convinced us :

# ps -ef | grep hostctrl

root 92067 1 0 /usr/sap/hostctrl/exe/saphostexec pf=/usr/sap/hostctrl/exe/host_profile

sapadm 92072 1 0 /usr/sap/hostctrl/exe/sapstartsrv pf=/usr/sap/hostctrl/exe/host_profile

`our' daaadm is mentioned in root 92338 1 0 /usr/sap/hostctrl/exe/saposcol -l -w60 pf=/usr/sap/hostctrl/exe/host_profile

# ss -larntp | grep 92072

configuration file

LISTEN 0 20 *:1128 *:* users:(("sapstartsrv",pid=92072,fd=18))

# grep daaadm /usr/sap/hostctrl/exe/host_profile service/admin_users = daaadm

48

Onapsis Inc. | All Rights Reserved

...to root them all!

49

Onapsis Inc. | All Rights Reserved

...to root them all!

50

Onapsis Inc. | All Rights Reserved

...to root them all : Features
· Locally, as root or local Administrators, it is possible to perform several tasks using the binary saphostctrl
# /usr/sap/hostctrl/exe/saphostctrl Usage: saphostctrl [generic option]... -function <Webmethod> [argument]...
saphostctrl -help [<Webmethod>]
· Each function can have several different parameters

51

Onapsis Inc. | All Rights Reserved

...to root them all : Functions

· 45+ functions :

Ping

GetDatabaseStatus

StartInstance

GetDatabaseSystemStatus

StopInstance

StartDatabase

ListInstances

StopDatabase

ACOSPrepare

AttachDatabase

GetOperationResults

DetachDatabase

CancelOperation

GetDatabaseProperties

IsOperationFinished

SetDatabaseProperty

ExecuteOperation

LiveDatabaseUpdate

GetCIMObject

PrepareDatabaseCopy

GetComputerSystem

FinalizeDatabaseCopy

ListDatabases

RegisterInstanceService

ListDatabaseSystems

UnregisterInstanceService

ListDatabaseMetrics

ExecuteInstallationProcedure

ListDatabaseConfiguration

ExecuteUpgradeProcedure

ExecuteDatabaseOperation

DeployConfiguration

GetCapabilities ListOSProcesses GetSAPOSColVersion GetSAPOSColHWConf AddIpAddress RemoveIpAddress GetIpAddressProperties MoveIpAddress DetectManagedObjects DeployManagedObjectsFromSAR ExecuteOutsideDiscovery ConfigureOutsideDiscovery ConfigureOutsideDiscoveryPath ReloadConfiguration EnableCORS DisableCORS

52

Onapsis Inc. | All Rights Reserved

...to root them all : Configuration
· The configuration file handles interesting content

SAPSYSTEMNAME = SAP SAPSYSTEM = 99 service/porttypes = SAPHostControl SAPOscol SAPCCMS DIR_LIBRARY = /usr/sap/hostctrl/exe DIR_EXECUTABLE = /usr/sap/hostctrl/exe DIR_PROFILE = /usr/sap/hostctrl/exe DIR_GLOBAL = /usr/sap/hostctrl/exe DIR_INSTANCE = /usr/sap/hostctrl/exe DIR_HOME = /usr/sap/hostctrl/work service/admin_users = daaadm sidadm service/trace = 1 hostexec/trace = 1

53

Onapsis Inc. | All Rights Reserved

...to root them all : Configuration

· The configuration file handles interesting content

Additional OS users

SAPSYSTEMNAME = SAP SAPSYSTEM = 99

authorized for system

service/porttypes = SAPHostControl SAPOscol SAaPdCmCMiSnistration

DIR_LIBRARY = /usr/sap/hostctrl/exe

DIR_EXECUTABLE = /usr/sap/hostctrl/exe

DIR_PROFILE = /usr/sap/hostctrl/exe

DIR_GLOBAL = /usr/sap/hostctrl/exe

DIR_INSTANCE = /usr/sap/hostctrl/exe

DIR_HOME = /usr/sap/hostctrl/work

service/admin_users = daaadm sidadm

service/trace = 1

hostexec/trace = 1

54

Onapsis Inc. | All Rights Reserved

...to root them all : Configuration

· The configuration file handles interesting content

But logged in is not

SAPSYSTEMNAME = SAP

enough... authentication is

SAPSYSTEM = 99

required directly when

sDeIrRv_iLcIeB/RpAoRrYtt=yp/eussr=/sSaApP/HhoossttCcotnrtlr/oelxeSAPOscolcSaAlPliCnCgMSsaphostctrl

DIR_EXECUTABLE = /usr/sap/hostctrl/exe

DIR_PROFILE = /usr/sap/hostctrl/exe

DIR_GLOBAL = /usr/sap/hostctrl/exe

DIR_INSTANCE = /usr/sap/hostctrl/exe

DIR_HOME = /usr/sap/hostctrl/work

service/admin_users = daaadm sidadm

service/trace = 1

hostexec/trace = 1

55

Onapsis Inc. | All Rights Reserved

...to root them all : Configuration
· The configuration file handles interesting content SAP Server

daaadm

Request Function daaadm password ?

SAP Host Agent

56

Onapsis Inc. | All Rights Reserved

...to root them all : Configuration
· The configuration file handles interesting content

SAPSYSTEMNAME = SAP

SAPSYSTEM = 99

service/porttypes = SAPHostControl SAPOscol SAPCCMS

DIR_LIBRARY = /usr/sap/hostctrl/exe

DIR_EXECUTABLE = /usr/sap/hostctrl/exe

DIR_PROFILE = /usr/sap/hostctrl/exe

DIR_GLOBAL = /usr/sap/hostctrl/exe

DIR_INSTANCE = /usr/sap/hostctrl/exe

DIR_HOME = /usr/sap/hostctrl/work

Enabled Web service ports

service/admin_users = daaadm sidadm

service/trace = 1

hostexec/trace = 1

57

Onapsis Inc. | All Rights Reserved

...to root them all : Configuration
· The configuration file handles interesting content

SAPSYSTEMNAME = SAP

SAPSYSTEM = 99

service/porttypes = SAPHostControl SAPOscol SAPCCMS

DIR_LIBRARY = /usr/sap/hostctrl/exe

DIR_EXECUTABLE = /usr/sap/hostctrl/exe

DIR_PROFILE = /usr/sap/hostctrl/exe

DIR_GLOBAL = /usr/sap/hostctrl/exe

DIR_INSTANCE = /usr/sap/hostctrl/exe

DIR_HOME = /usr/sap/hostctrl/work

Enabled Web service ports

service/admin_users = daaadm sidadm

service/trace = 1

hostexec/trace = 1

58

Onapsis Inc. | All Rights Reserved

...to root them all : Configuration
· The configuration file handles interesting content

SAPSYSTEMNAME = SAP

SAPSYSTEM = 99

service/porttypes = SAPHostControl SAPOscol SAPCCMS

DIR_LIBRARY = /usr/sap/hostctrl/exe

DIR_EXECUTABLE = /usr/sap/hostctrl/exe

DIR_PROFILE = /usr/sap/hostctrl/exe

DIR_GLOBAL = /usr/sap/hostctrl/exe

DIR_INSTANCE = /usr/sap/hostctrl/exe

DIR_HOME = /usr/sap/hostctrl/work

Enabled Web service ports

service/admin_users = daaadm sidadm

service/trace = 1

hostexec/trace = 1

59

Onapsis Inc. | All Rights Reserved

...to root them all : Local Traffic Analysis

Confirm that saphostctrl command line perform SOAP request locally

60

Onapsis Inc. | All Rights Reserved

...to root them all : Curious credential

{2D4A6FB8-37F1-43d7-88BE-AD279C89DCD7}:2702282443137234634522881264230474671502
· Password change at every request · Username still the same

61

Onapsis Inc. | All Rights Reserved

...to root them all : Binary Analysis
· Using the username as entry point

62

Onapsis Inc. | All Rights Reserved

...to root them all : Binary Analysis
· Using the username as entry point · Understand that a `Trusted Internal Connection" feature exist

63

Onapsis Inc. | All Rights Reserved

...to root them all : Trusted Connection

SAP Server daaadm

RequestLogonFile logon42

SAP Host Agent

64

Onapsis Inc. | All Rights Reserved

...to root them all : Trusted Connection

SAP Server daaadm
65

readfile()

SAP Host Agent
/usr /sap /hostctrl /work /sapcontrol_logon /logon42
Onapsis Inc. | All Rights Reserved

...to root them all : Trusted Connection

SAP Server

daaadm
66

SAP Host Agent
27022824431372346345228812642304746715/0u2s/rsa/pho/swto/crstka/rpllcoognotnr4o2l_logon
Onapsis Inc. | All Rights Reserved

...to root them all : Trusted Connection

SAP Server daaadm

Request Function Password ?
270228244313723463... OK

SAP Host Agent

67

Onapsis Inc. | All Rights Reserved

...to root them all : Trusted Connection

68

Onapsis Inc. | All Rights Reserved

...to root them all : Trusted Connection

Knowing the daaadm password is not necessary anymore...

69

Onapsis Inc. | All Rights Reserved

...to root them all!

70

Onapsis Inc. | All Rights Reserved

...to root them all!

71

Onapsis Inc. | All Rights Reserved

...to root them all : Functions

· 45+ functions :

Ping

GetDatabaseStatus

StartInstance

GetDatabaseSystemStatus

StopInstance

StartDatabase

ListInstances

StopDatabase

ACOSPrepare

AttachDatabase

GetOperationResults

DetachDatabase

CancelOperation

GetDatabaseProperties

IsOperationFinished

SetDatabaseProperty

ExecuteOperation

LiveDatabaseUpdate

GetCIMObject

PrepareDatabaseCopy

GetComputerSystem

FinalizeDatabaseCopy

ListDatabases

RegisterInstanceService

ListDatabaseSystems

UnregisterInstanceService

ListDatabaseMetrics

ExecuteInstallationProcedure

ListDatabaseConfiguration

ExecuteUpgradeProcedure

ExecuteDatabaseOperation

DeployConfiguration

GetCapabilities ListOSProcesses GetSAPOSColVersion GetSAPOSColHWConf AddIpAddress RemoveIpAddress GetIpAddressProperties MoveIpAddress DetectManagedObjects DeployManagedObjectsFromSAR ExecuteOutsideDiscovery ConfigureOutsideDiscovery ConfigureOutsideDiscoveryPath ReloadConfiguration EnableCORS DisableCORS

72

Onapsis Inc. | All Rights Reserved

...to root them all : Vulnerabilities

· 45+ functions :

Ping

GetDatabaseStatus

StartInstance

GetDatabaseSystemStatus

StopInstance

StartDatabase

ListInstances

StopDatabase

ACOSPrepare

AttachDatabase

GetOperationResults

DetachDatabase

CancelOperation

GetDatabaseProperties

IsOperationFinished

SetDatabaseProperty

ExecuteOperation

LiveDatabaseUpdate

GetCIMObject

PrepareDatabaseCopy

GetComputerSystem

FinalizeDatabaseCopy

ListDatabases

RegisterInstanceService

ListDatabaseSystems

UnregisterInstanceService

ListDatabaseMetrics

ExecuteInstallationProcedure

ListDatabaseConfiguration

ExecuteUpgradeProcedure

ExecuteDatabaseOperation

DeployConfiguration

GetCapabilities ListOSProcesses GetSAPOSColVersion GetSAPOSColHWConf AddIpAddress RemoveIpAddress GetIpAddressProperties MoveIpAddress DetectManagedObjects DeployManagedObjectsFromSAR ExecuteOutsideDiscovery ConfigureOutsideDiscovery ConfigureOutsideDiscoveryPath ReloadConfiguration EnableCORS DisableCORS

73

Onapsis Inc. | All Rights Reserved

...to root them all : Vulnerabilities

· 45+ functions :

Ping

GetDatabaseStatus

StartInstance

GetDatabaseSystemStatus

StopInstance

StartDatabase

ListInstances

StopDatabase

ACOSPrepare

AttachDatabase

GetOperationResults

DetachDatabase

CancelOperation

GetDatabaseProperties

IsOperationFinished

SetDatabaseProperty

ExecuteOperation

LiveDatabaseUpdate

GetCIMObject

PrepareDatabaseCopy

GetComputerSystem

FinalizeDatabaseCopy

ListDatabases

RegisterInstanceService

ListDatabaseSystems

UnregisterInstanceService

ListDatabaseMetrics

ExecuteInstallationProcedure

ListDatabaseConfiguration

ExecuteUpgradeProcedure

ExecuteDatabaseOperation

DeployConfiguration

GetCapabilities ListOSProcesses GetSAPOSColVersion GetSAPOSColHWConf AddIpAddress RemoveIpAddress GetIpAddressProperties MoveIpAddress DetectManagedObjects DeployManagedObjectsFromSAR ExecuteOutsideDiscovery ConfigureOutsideDiscovery ConfigureOutsideDiscoveryPath ReloadConfiguration EnableCORS DisableCORS

74

Onapsis Inc. | All Rights Reserved

...to root them all : Vulnerabilities

· 45+ functions :

Ping

GetDatabaseStatus

StartInstance

GetDatabaseSystemStatus

StopInstance

StartDatabase

ListInstances

StopDatabase

ACOSPrepare

AttachDatabase

GetOperationResults

DetachDatabase

CancelOperation

GetDatabaseProperties

IsOperationFinished

SetDatabaseProperty

ExecuteOperation

LiveDatabaseUpdate

GetCIMObject

PrepareDatabaseCopy

GetComputerSystem

FinalizeDatabaseCopy

ListDatabases

RegisterInstanceService

ListDatabaseSystems

UnregisterInstanceService

ListDatabaseMetrics

ExecuteInstallationProcedure

ListDatabaseConfiguration

ExecuteUpgradeProcedure

ExecuteDatabaseOperation

DeployConfiguration

GetCapabilities ListOSProcesses GetSAPOSColVersion GetSAPOSColHWConf AddIpAddress RemoveIpAddress GetIpAddressProperties MoveIpAddress DetectManagedObjects DeployManagedObjectsFromSAR ExecuteOutsideDiscovery ConfigureOutsideDiscovery ConfigureOutsideDiscoveryPath ReloadConfiguration EnableCORS DisableCORS

75

Onapsis Inc. | All Rights Reserved

...to root them all!

76

Onapsis Inc. | All Rights Reserved

...to root them all!

77

Onapsis Inc. | All Rights Reserved

Onapsis Inc. | All Rights Reserved

1. Introduction 2. The Target: SolMan 3. From Unauthenticated Restricted Access... 4. ...to RCE as Agent administrator 5. ...to root them all! 6. Recommendations 7. Conclusion

Onapsis Inc. | All Rights Reserved

Recommendations - Prevention

· Missing Authentication Check in SAP Solution Manager

· Logon in SolMan NWA

· Navigate to
· Configuration

SAP Patch : 2890213

· Connectivity

CVE-2020-6207

· Single Service Administration.

· Search for EemAdmin service

· Modify the security part

80

Onapsis Inc. | All Rights Reserved

Recommendations - Prevention
· Privilege Escalation in SAP Host Agent
<SOAP-ENV:Fault> <faultcode> SOAP-ENV:Server </faultcode> <faultstring> Forbidden: The user daaadm is not authorized to process the operation ExecuteInstallationProcedure </faultstring>
</SOAP-ENV:Fault>
SAP Patch : 2902645 & 2902456 CVE-2020-6234 & CVE-2020-6236

81

Onapsis Inc. | All Rights Reserved

Recommendations - Prevention
KReeepduScAePaSttoalcuktisounrfMaacneabgyer as upftilotedrainteg asccpeossss!ible !
Onapsis Inc. | All Rights Reserved

Recommendations - Patches

· Am I vulnerable?

· SOLMANDIAG 720 · SOLMANDIAG 720 · SOLMANDIAG 720 · SOLMANDIAG 720 · SOLMANDIAG 720 · SOLMANDIAG 720 · SOLMANDIAG 720

SP004 000011 SP005 000012 SP006 000013 SP007 000020 SP008 000016 SP009 000008 SP010 000002

· SAP HOST AGENT 720 Patch 46

83

Onapsis Inc. | All Rights Reserved

Recommendations - Patches

· Other important recent security patches related to SolMan

SSN

CVE

Title

CVSS

· 2931391 CVE-2020-6271 Missing XML Validation in SAP Solution Manager

8.2

· 2906994 CVE-2020-6235 Missing Authentication check in SAP Solution Manager

8.6

· 2845377 CVE-2020-6198 Missing Authentication check in SAP Solution Manager

9.8

· 2748699 CVE-2019-0291 Information Disclosure in Solution Manager 7.2

7.1

· 2738791 CVE-2019-0318 Information Disclosure in SAP NetWeaver AS Java

5.3

· 2772266 CVE-2019-0307 Information Disclosure in Solution Manager 7.2

3.4

· 2808158 CVE-2019-0330 OS Command Injection vulnerability in SAP Diagnostics Agent 9.1

· More: 2904933, 2839864, 2823733, 2849096, 2219592, 2130510

84

Onapsis Inc. | All Rights Reserved

Recommendations - Detection (EEM activity)
· Maintain tracing level: nwa/log-config · Tracing location: com.sap.smd.eem.admin.EemAdminService
· Log name · defaultTrace_00.<x>.trc
· Actions that can be logged · Script actions (stop/start) · Files uploaded · Information asked · more..

85

Onapsis Inc. | All Rights Reserved

Recommendations - Detection (Host Agent activity)
· Maintain tracing level: Profile configuration · More information: SAP Note 2451419
· Log name · dev_saphostexec · sapstartsrv.log
· Full of activity

86

Onapsis Inc. | All Rights Reserved

1. Introduction 2. The Target: SolMan 3. From Unauthenticated Restricted Access... 4. ...to RCE as Agent administrator 5. ...to root them all! 6. Recommendations 7. Conclusion

Onapsis Inc. | All Rights Reserved

Conclusion : Chain of vulnerabilities

88

Onapsis Inc. | All Rights Reserved

Conclusion : Chain of vulnerabilities

Gain restricted access to one SAP Solution Manager service
89

Onapsis Inc. | All Rights Reserved

Conclusion : Chain of vulnerabilities

Execute arbitrary OS command as daaadm on every SAP servers
90

Onapsis Inc. | All Rights Reserved

Conclusion : Chain of vulnerabilities

Execute arbitrary OS command as root or system on every SAP servers
91

Onapsis Inc. | All Rights Reserved

Conclusion : Post exploitation

Obtain customers/vendors/human resources data, Espionnage financial planning information, balances, profits, sales
information, manufacturing recipes, etc.

Modify financial information, tamper sales and
Fraud purchase orders, create new vendors, modify vendor bank account numbers, etc.

Sabotage

Paralyze the operation of the organization by shutting down the SAP system or the server, disrupting interfaces with other systems and deleting critical information, etc.

92

Onapsis Inc. | All Rights Reserved

Onapsis Inc. | All Rights Reserved

Conclusion : Final word
SAP Solution Manager is a great product. Secure it !
94

Onapsis Inc. | All Rights Reserved

Conclusion : References

· Patch 2902645 · Patch 2902456 · Patch 2890213 · Patch 2808158 · Patch 2823733 · Patch 2839864 · Patch 2849096 · Patch 2772266 · Patch 2738791 · Patch 2748699 · Patch 2845377 · Patch 2904933

https://launchpad.support.sap.com/#/notes/2902645 https://launchpad.support.sap.com/#/notes/2902456 https://launchpad.support.sap.com/#/notes/2890213 https://launchpad.support.sap.com/#/notes/2808158 https://launchpad.support.sap.com/#/notes/2823733 https://launchpad.support.sap.com/#/notes/2839864 https://launchpad.support.sap.com/#/notes/2849096 https://launchpad.support.sap.com/#/notes/2772266 https://launchpad.support.sap.com/#/notes/2738791 https://launchpad.support.sap.com/#/notes/2748699 https://launchpad.support.sap.com/#/notes/2845377 https://launchpad.support.sap.com/#/notes/2904933

95

Onapsis Inc. | All Rights Reserved

Conclusion : Greetings
· SAP Product Respond Teamsecure@sap.com · Onapsis Security Research Lab info@onapsis.com · Julien Tomasi  · Cuervo Studio 
96

Onapsis Inc. | All Rights Reserved

@onapsis info@onapsis.com www.onapsis.com

Thank you! Questions ?

Onapsis Inc. | All Rights Reserved

