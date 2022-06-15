Investigating PowerShell Attacks
Matt Hastings October 7, 2014

Background Case Study

Attacker Client

Victim VPN

WinRM, SMB,
NetBIOS

Victim workstations, servers

 Fortune 100 organization  Command-and-control via

 Compromised for > 3 years  Scheduled tasks

 Active Directory
 Authenticated access to corporate VPN

 Local execution of PowerShell scripts
 PowerShell Remoting

2

Why PowerShell?

It can do almost anything...

Execute commands

Download files from the internet

Reflectively load / inject code

Interface with Win32 API

Enumerate files

Interact with the registry

Interact with services

Examine processes

Retrieve event logs

Access .NET framework

3

PowerShell Attack Tools

 PowerSploit
- Reconnaissance - Code execution - DLL injection - Credential harvesting - Reverse engineering

 Posh-SecMod  Veil-PowerView  Metasploit  More to come...

 Nishang

4

PowerShell Malware in the Wild

5

Investigation Methodology

WinRM PowerShell Remoting
evil.ps1
Local PowerShell script

backdoor.ps1
Persistent PowerShell

Registry

File System

Event Logs

Memory

Sources of Evidence

Network Traffic
6

Attacker Assumptions
 Has admin (local or domain) on target system  Has network access to needed ports on target system  Can use other remote command execution methods to:
- Enable execution of unsigned PS scripts - Enable PS remoting

7

Version Reference

2.0 Default (SP1)

3.0
Requires WMF 3.0 Update

Default (R2 SP1)

Requires WMF 3.0 Update

Default

4.0 Requires WMF
4.0 Update
Requires WMF 4.0 Update
Requires WMF 4.0 Update
Default

Default

Default (R2)
8

MEMORY ANALYSIS
9
Memory Analysis
Scenario: Attacker interacts with target host through PowerShell remoting
 What's left in memory on the accessed system?  How can you find it?  How long does it persist?
10

WinRM Process Hierarchy

Invoke-Command {c:\evil.exe}

Client

Invoke-Command {Get-ChildItem C:\}

Invoke-Mimikatz.ps1 -DumpCreds
­ComputerName "victim"

svchost.exe (DcomLaunch)
wsmprovhost.exe evil.exe
wsmprovhost.exe {PS code}

Victim 11

Remnants in Memory

Terminate at end of session

svchost.exe (DcomLaunch)
wsmprovhost.exe

Cmd history

evil.exe

wsmprovhost.exe

Cmd history

{PS code}

Remnants of WinRM SOAP
persist

svchost.exe (WinRM)
Kernel

12

How Long Will Evidence Remain?

Evidence

wsmprovhost.exe

svchost.exe (WinRM)

Best source of command history, output

Fragments of remoting I/O

Kernel Memory

Pagefile

Fragments of Fragments of remoting I/O remoting I/O

Retention

Single remoting session

Varies with # of remoting sessions

Varies with memory utilization

Varies with memory utilization

Max Lifetime

End of remoting session

Reboot

Reboot

Varies ­ may persist beyond reboot

13

Example ­ Simple Command
echo teststring_pssession > c:\testoutput_possession.txt

SOAP remnants in WinRM memory after receiving command
14

Example ­ Remote Invoke-Mimikatz
WinRM service memory on target host after Invoke-Mimikatz.ps1 executed remotely
15
Example ­ Encoded Command
Invoke-Command -Computername 192.168.114.133 -Cred win-jacr88jtqv5\administrator {echo testingEncodedString > c:\out.txt}" powershell.exe ­enc SQBuAHYAbwBrAGUALQBDAG8AbQBtAGEAbgBkACAALQBDAG8AbQBwAHUAdABlAHIAbgBhAG0AZQAgADEAOQ AyAC4AMQA2ADgALgAxADEANAAuADEAMwAzACAALQBDAHIAZQBkACAAdwBpAG4ALQBqAGEAYwByADgAOABq AHQAcQB2ADUAXABhAGQAbQBpAG4AaQBzAHQAcgBhAHQAbwByACAAewBlAGMAaABvACAAdABAHMAdABpAG4 AZwBFAG4AYwBvAGQAZQBkAFMAdAByAGkAbgBnACAAPgAgAGMAOgBcAG8AdQB0AC4AdAB4AHQAfQA=
WinRM service memory on target host
16

What to Look For?

 WSMan & MS PSRP Syntax
/wsman.xsd <rsp:Command> <rsp:CommandLine> <rsp:Arguments> <S N="Cmd">
 Known attacker filenames
 View context around hits
 Yes, this is painful

<rsp:CommandResponse><rsp:CommandId>""xmlns:r sp="http://schemas.microsoft.com/wbem/wsman/1 /windows/shell"""C80927B1-C741-4E99-9F97CBA80F23E595</a:MessageID><w:Locale xml:lang="en-US" s:mustUnderstand="false" /><p:DataLocale xml:lang="en-US" s:mustUnderstand="false" /><p:SessionId"/w:OperationTimeout></s:Header ><s:Body><rsp:CommandLine xmlns:rsp="http://schemas.microsoft.com/wbem/ wsman/1/windows/shell" CommandId="9A153F8AAA3C-4664-8600AC186539F107"><rsp:Command>prompt""/rsp:Comma nd><rsp:Arguments>AAAAAAAAAFkAAAAAAAAAAAMAAAa jAgAAAAYQAgC2Yc+EDBrbTLq08PrufN+rij8VmjyqZEaG AKwYZTnxB++7vzxPYmogUmVmSWQ9IjAiPjxNUz48T2JqI E49IlBvd2VyU2hlbGwiIFJlZklkPSIxIj48TVM+PE9iai BOPSJDbWRzIiBSZWZJZD0iMiI+PFROIFJlZklkPSIwIj4 8VD5TeXN0ZW0uQ29sbG . . .

17

Memory Analysis Summary
 Timing is everything  Challenging to recover evidence  Many variables
- System uptime - Memory utilization - Volume of WinRM activity

18

EVENT LOGS
19
Event Logs
Scenario: Attacker interacts with target host through local PowerShell script
execution or PowerShell remoting
 Which event logs capture activity?  Level of logging detail?  Differences between PowerShell 2.0 and 3.0?
20

PowerShell Event Logs
 Application Logs - Windows PowerShell.evtx - Microsoft-WindowsPowerShell/Operational.evtx - Microsoft-WindowsWinRM/Operational.evtx
 Analytic Logs - Microsoft-WindowsPowerShell/Analytic.etl - Microsoft-WindowsWinRM/Analytic.etl
21

Local PowerShell Execution

EID 400: Engine state is changed from None to Available. ... HostName=ConsoleHost

PowerShell

EID 403: Engine state is changed from Available to Stopped. ... HostName=ConsoleHost

Start & stop times of PowerShell session

22

Local PowerShell Execution

EID 40961: PowerShell console is starting up

PowerShell Operational**

EID 4100: Error Message = File C:\temp\test.ps1 cannot be loaded because running scripts is disabled on this system

** Events exclusive to PowerShell 3.0 or greater

Start time of PowerShell session
Error provides path to PowerShell script

23

Local PowerShell Execution

EID 7937: Command test.ps1 is Started.

PowerShell Analytic**

EID 7937: Command Write-Output is Started.
EID 7937: Command dropper.exe is Started
** Log disabled by default. Events exclusive to PowerShell 3.0 or greater

Executed cmdlets, scripts,
or commands (no arguments)

24

Remoting

PowerShell

EID 6: Creating WSMan Session. The connection string is: 192.168.1.1/wsman?PSVersion=2.0

EID 400: Engine state is changed from None to Available. ... HostName=ServerRemoteHost

PowerShell

EID 403: Engine state is changed from Available to Stopped. ... HostName=ServerRemoteHost

Start of remoting session (client host)
Start & stop of remoting session (accessed host)
25

Remoting (Accessed Host)

EID 169: User CORP\MattH authenticated successfully using NTLM

WinRM Operational

EID 81: Processing client request for operation CreateShell
EID 134: Sending response for operation DeleteShell

Who connected via remoting
Timeframe of remoting activity

26

Remoting (Accessed Host)
EID 32850: Request 7873936. Creating a server remote session. UserName: CORP\JohnD

PowerShell Analytic

EID 32867: Received remoting fragment [...] Payload Length: 752 Payload Data: 0x020000000200010064D64FA51E7C784 18483DC[...]

EID 32868: Sent remoting fragment [...] Payload Length: 202 Payload Data: 0xEFBBBF3C4F626A2052656649643D22 30223E3[...]

Who connected via remoting
Encoded contents of remoting I/O

27

PS Analytic Log: Encoded I/O
Invoke-Command {Get-ChildItem C:\}

28

PS Analytic Log: Decoded Input
Invoke-Command {Get-ChildItem C:\}
29
PS Analytic Log: Decoded Output
Invoke-Command {Get-ChildItem C:\}
30

Logging via PowerShell Profiles
%windir%\system32\WindowsPowerShell\v1.0\profile.ps1
 Add code to global profile - Loads with each local PS session - Start-Transcript cmdlet - Overwrite default prompt function
 Limitations - Will not log remoting activity - Can launch PowerShell without loading profiles
31
Logging via AppLocker
 Set Audit or Enforce script rules  Captures user, script path
32

PowerShell 3.0: Module Logging
Solves (almost) all our logging problems!
Computer Configuration  Administrative Templates  Windows Components  Windows PowerShell  Turn on Module Logging
33
Module Logging Example: File Listing
Get-ChildItem c:\temp -Filter *.txt -Recurse | Select-String password Microsoft-Windows-PowerShell/Operational (EID 4103)
ParameterBinding(Get-ChildItem): name="Filter"; value="*.txt" ParameterBinding(Get-ChildItem): name="Recurse"; value="True" ParameterBinding(Get-ChildItem): name="Path"; value="c:\temp" ParameterBinding(Select-String): name="Pattern"; value="password" ParameterBinding(Select-String): name="InputObject"; value="creds.txt"
...
Command Name = Get-ChildItem User = CORP\MHastings
Logged upon command execution
ParameterBinding(Out-Default): name="InputObject"; value="C:\temp\creds.txt:2:password: secret" ParameterBinding(Out-Default): name="InputObject"; value="C:\temp\creds.txt:5:password: test"
Logged upon command output 34

Module Logging Example: InvokeMimikatz
Invoke-Mimikatz.ps1 via remoting
Detailed "percommand" logging
35
Module Logging Example: InvokeMimikatz
Mimikatz output in event log
36

PERSISTENCE
37
PowerShell Persistence
Scenario: Attacker configures system to load malicious PowerShell code
upon startup or user logon
 What are common PowerShell persistence mechanisms?
 How to find them?
38

Common Techniques
 Registry "autorun" keys  Scheduled tasks  User "startup" folders  Easy to detect
- Autorun review - Registry timeline analysis - File system timeline
analysis - Event log review

At1.job At1.job At1.job
39

Persistence via WMI
Use WMI to automatically launch PowerShell upon a common event Namespace: "root\subscription"

Set-WmiInstance Set-WmiInstance Set-WmiInstance

EventFilter Filter name, event query
CommandLineEventConsumer Consumer name, path to powershell.exe
FilterToConsumerBinding Filter name, consumer name

40

Event Filters
 Query that causes the consumer to trigger
SELECT * FROM __InstanceModificationEvent WITHIN 60 WHERE TargetInstance ISA 'Win32_PerfFormattedData_PerfOS_System' AND TargetInstance.SystemUpTime >= 240 AND TargetInstance.SystemUpTime < 325
Run within minutes of startup
SELECT * FROM __InstanceModificationEvent WITHIN 60 WHERE TargetInstance ISA 'Win32_LocalTime' AND TargetInstance.Hour = 12 AND TargetInstance.Minute = 00 GROUP WITHIN 60
Run at 12:00
41
Event Consumers
 Launch "PowerShell.exe" when triggered by filter  Where does the evil PS code load from?
sal a New-Object;iex(a IO.StreamReader((a IO.Compression.DeflateStream([IO.MemoryStream][Convert]::FromBase64 String('7L0HYBxJliUmL23Ke39K9UrX4HShCIBgEyTYkEAQ7MGIzeaS7B1pRyMpqyq BymVWZV1mFkDM7Z28995777333nvvvfe6O51OJ/ff/z9cZmQBbPbOStrJniGAqsgfP3 58Hz8ivlsXbb795bpdrdv0o2/nZVml363qcvbR/xMAAP//'),[IO.Compression.Co mpressionMode]::Decompress)),[Text.Encoding]::ASCII)).ReadToEnd()
Stored in user or system-wide "profile.ps1"
Set-WmiInstance -Namespace "root\subscription" -Class 'CommandLineEventConsumer' -Arguments @{ name='TotallyLegitWMI';CommandLineTemplate="$($Env:SystemRoot)\Syst em32\WindowsPowerShell\v1.0\powershell.exe NonInteractive";RunInteractively='false'}
Added to Consumer Command-Line Arguments (length limit, code must be base64'd)
42

Enumerating WMI Objects with PowerShell
 Get-WMIObject ­Namespace root\Subscription -Class __EventFilter
 Get-WMIObject -Namespace root\Subscription -Class __EventConsumer
 Get-WMIObject -Namespace root\Subscription -Class __FilterToConsumerBinding

43

PS WMI Evidence: File System
WBEM repository files changed (common)

Global or per-user "profile.ps1" changed (if used to store code)

Strings in "objects.data"
sal a New-Object;iex(a IO.StreamReader((a IO.Compression.DeflateStream([IO.MemoryStr eam][Convert]::FromBase64String('7L0HYBxJl
iUmL23Ke39K9UrX4HShCIBgEyTYkEA...
44

PS WMI Evidence: Registry

Key

Value

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WBEM\ [N/A] ESS\//./root/CIMV2\Win32ClockProvider

Key Last Modified

06/04/14 01:30:03 UTC

Data [N/A]

Created only when setting a time-based WMI filter (many other types of triggers may be used)

45

PS WMI Evidence: Other Sources
 SysInternals AutoRuns v12  Memory: WMI filter & consumer names
- svchost.exe (WinMgmt service) - WmiPrvse.exe  Event logs: WMI Trace

46

CONCLUSIONS

47

Other Sources of Evidence

 Refer to whitepaper  Prefetch for "PowerShell.exe"
- Local execution only - Scripts in Accessed File list
 Registry
- "ExecutionPolicy" setting
 Network traffic analysis (WinRM)
- 5985 (HTTP) / 5986 (HTTPS) - Payload always encrypted - Identify anomalous netflows
 SysInternals Sysmon
- Command argument auditing - Local execution only

POWERSHELL.EXE-59FC8F3D.pf

48

Lessons Learned
 Upgrade and enable Module Logging if possible  Baseline legitimate PowerShell usage
- ExecutionPolicy setting - Script naming conventions, paths - Remoting enabled? - Which users? - Common source / destination systems  Recognize artifacts of anomalous usage
49

Acknowledgements

 Matt Graeber  Joseph Bialek  Chris Campbell  Lee Holmes  David Wyatt

 David Kennedy
 Josh Kelley
 All the other PowerShell authors, hackers, and researchers!

50

Questions?
ryan.kazanciyan@mandiant.com @ryankaz42
matt.hastings@mandiant.com @HastingsVT
51

