SESSION ID: AIR-F02
The Pivot
#RSAC

Jonathan Trull
Office of the CISO Optiv @jonathantrull

#RSAC
The Pivot
Pivot (verb): to move or turn from a central point

Presenter's Company

Logo ­ replace on

master slide

2

#RSAC
Dwell Time

356

205

APT1
APT1 maintained access to victim networks for an average of 356 days
Presenter's Company Logo ­ replace on master slide

Dwell Time
Attackers had free reign of victim networks for 205 days
in 2015
3

#RSAC
Detection Deficit
Source: 2015 Verizon Data Breach Report

60%
of cases

75%
of attacks

Attackers are able to compromise
an organization within minutes
Presenter's Company Logo ­ replace on master slide
4

Spread from Victim 0 to Victim 1 within one day (24 hours)

#RSAC
Time is not on your side

50 percent of users open emails and click on phishing links within the first hour
1 minute and 22 seconds ­ Median time to first click
Half of CVEs exploited from publish to pwn in less than a month

Presenter's Company

Logo ­ replace on

master slide

5

#RSAC
Session Objectives

How attackers pivot and move laterally through an organization

How to identify the telltale signs of a pivot

Identify the steps to defend against it

Presenter's Company

Logo ­ replace on

master slide

6

#RSAC
How Attackers Pivot and Move Laterally
7

Attacker Lifecycle
Act

Observe

#RSAC
Orient

Presenter's Company Logo ­ replace on master slide

Decide
8

#RSAC
Optiv Simulated Attack Lifecycle

Stages Code Execution
Lateral Movement
Exfiltrate Data
Presenter's Company Logo ­ replace on master slide

Use Cases
UC-01.003: Host Exploit Flash CVE-2014-0497 UC-02.001: Malware Installation Zeus UC-02.002: Malware Installation Custom (Veil AES) UC-02.004: Malware Installation Custom (Excel Macro) UC-02.008: Disrupt Security Software UC-02.009: Persistence
UC-02.010: Install Tools UC-03.001: Credential Theft UC-04.001: Lateral Movement Reconnaissance UC-04.002: Lateral Movement Malware Installation
UC-05.001: Data Exfiltration Zeus UC-05.002: Data Exfiltration UC-06.001: Cove9r Tracks

#RSAC
Story of a Hack

Medium-sized Pharmaceutical Company · Significant R&D · Microsoft environment

Presenter's Company

Logo ­ replace on

master slide

10

#RSAC
Patient Zero

Windows 7 Enterprise Desktop
· User running with local administrator privileges · Spear phishing email / Link to watering hole

Presenter's Company

Logo ­ replace on

master slide

11

#RSAC
We don't need no stinking badges

After initial compromise, attackers are leveraging native tools:
· cmd.exe · Powershell scripts · at.exe · Net use · WMI
Presenter's Company Logo ­ replace on master slide

Compromised credentials are commonly used during pivot:
· Mimikatz · wce
12

#RSAC
Signs of a Pivot (Indicators of Pivot or IOPs)
13

#RSAC
Indicators on Two or More Machines

Source

Artifacts / Logs

Destination

Network

Artifacts / Logs

Presenter's Company

Logo ­ replace on

master slide

14

Artifacts / Logs

#RSAC
Recon Stage

Domains, Users and Systems
· whoami · net view /domain · net users · net group "Domain
Admins" / <domain > · net view
/domain:<Domain Name>
Presenter's Company Logo ­ replace on master slide

Sessions and Open Shares · net session · net file
15

Open Ports
· Ping · FPORT

#RSAC
Remote Code Execution

Native Tools
· Scheduled Tasks · at.exe
· WMI · PowerShell · Remote Desktop (RDP)

Third-Party Tools
· SysInternals PsExec · Netcat · Metasploit

Presenter's Company

Logo ­ replace on

master slide

16

#RSAC
Remote Code Execution Examples

Windows Management Instrumentation (WMI):
· wmic /domain:host process call create "c:\rootkit.exe"
Powershell
· Invoke-Command host {c:\rootkit.exe}
SysInternals PsExec
· Psexec \\host -e c:\rootkit.exe

Presenter's Company

Logo ­ replace on

master slide

17

#RSAC
Mapping Shares

Allows for limited interaction with destination host for attacker However, share may contain valuable data Usage:
· Map Network Drive wizard · CLI -> net use z: \\host\drive /user <username> <password>

Presenter's Company

Logo ­ replace on

master slide

18

#RSAC
Scheduled Tasks

at.exe or schtasks.exe creates tasks on local or remote host Typically used to remotely execute malware or other malicious tools Requires admin privileges Runs under context of SYSTEM

Presenter's Company

Logo ­ replace on

master slide

19

#RSAC
Windows Event Logs
Native logging of security, system and application events Requires further configuration to be useful for detecting IOPs Location: %systemroot%\System32\winevt\Logs\*.evtx Microsoft Event Viewer
Presenter's Company Logo ­ replace on master slide

#RSAC
Windows Account Usage

Account Lockouts
User Added to Privileged Group
Security-Enabled Group Modification Successful User Account Login Failed User Account Login Account Login with Explicit Credentials
Presenter's Company Logo ­ replace on master slide

ID
4740 4728, 4732, 4756 4735
4624
4625
4648

Level
Informational Informational

Event Log
Security Security

Event Source
Microsoft-Windows-Security-Auditing Microsoft-Windows-Security-Auditing

Informational Informational Informational Informational

Security Security Security Security

Microsoft-Windows-Security-Auditing Microsoft-Windows-Security-Auditing Microsoft-Windows-Security-Auditing Microsoft-Windows-Security-Auditing

21

#RSAC
Windows Logon Types

Type
Interactive Network Logons Batch
Service Unlock

Code

Example

2 At the console of a computer

3 Connections to shared folders or printers

4 Scheduled tasks

5 Windows service started 7 Unlock computer screen

Type

Code

Example

NetworkCleartext NewCredentials Remoteinteractive

8 Similar to network logons but in clear text
9 RunAs used to start program under different user account
10 RDP, terminal services, remote assistance

CacheInteractive

11 Remote logon with domain account

Presenter's Company

Logo ­ replace on

master slide

22

#RSAC
Process Creation

Event ID 4688: A new process has been created

Documents each program that is executed, who the program ran as and the process that started this process

Disabled by default:
· Enable by editing GPO
· Policy location: Computer Configuration > Policies > Windows Settings > Security Settings > Advanced Audit Configuration > Detailed Tracking

Missing process command line arguments by default

· Enable via GPO ­ "Include command line in process creation events"

Presenter's Company

Logo ­ replace on

master slide

23

#RSAC
Created Process with Command Line

Presenter's Company

Logo ­ replace on

master slide

24

#RSAC
Prefetch Files

Introduced in Windows XP Designed to speed up application startup processes Location: %systemroot%\prefetch\*.pf Contain name of the executable, Unicode list of DLLs used, count of times .exe run, and timestamp indicating last run time

Presenter's Company

Logo ­ replace on

master slide

25

#RSAC
Viewing Pre-fetch Files

Presenter's Company

Logo ­ replace on

master slide

26

#RSAC
Scheduled Tasks
Source Prefetch files of program execution => at.exe or schtasks.exe
Destination Service being started => Event ID 7035/7036

Presenter's Company

Logo ­ replace on

master slide

27

#RSAC
Windows Special Groups
Event ID 4964
Introduced in Windows 2008
Use to track logon of particular accounts on systems

Presenter's Company

Logo ­ replace on

master slide

28

#RSAC
IOP #1 ­ Successful PtH

Event ID 4624

Event Log Security

Level Informational

Logon Type 3

Auth Package NTLM

View filter -> Not a domain logon and not the ANONYMOUS LOGON account

Presenter's Company

Logo ­ replace on

master slide

29

#RSAC
IOP #2 ­ Failed PtH

Event ID 4625

Event Log Security

Level Informational

Logon Type 3

Auth. Package NTLM

View Filter -> Not a domain logon and not the ANONYMOUS LOGON account

Presenter's Company

Logo ­ replace on

master slide

30

#RSAC
IOP #3 ­ New Scheduled Task
· Alert on new Event ID 7035 created by at[#].exe

Presenter's Company

Logo ­ replace on

master slide

31

#RSAC
IOP # 4 ­ Privilege Escalation
Alarm on login from non-workstation host to another non-workstation host

Alarm on login from one workstation to another workstation

Alarm on login attempts using known service accounts

Alarm on creation of new domain admin account or elevation of account

Presenter's Company

Logo ­ replace on

master slide

32

#RSAC
Defending the Pivot

#RSAC
Levels of Defense

100,000 Foot View · Layered preventive and detective controls · IOP hunting · User behavior analytics · Configure auditing / EDR or Sysmon · Honeypot deployment

In the Weeds · Remove / restrict use of Powershell on
endpoints · Look for IOP artifacts at the host and
network levels · Mitigate Pass-the-Hash attacks

Presenter's Company

Logo ­ replace on

master slide

34

#RSAC
Optiv Research Methodology

We selected seven solutions that span across all endpoint categories

The endpoint product was the only point of defense

All endpoints were unpatched and vulnerable to the selected attacks

Goal was to compare and contrast results from different types of endpoint solutions

Presenter's Company

Logo ­ replace on

master slide

35

#RSAC
Types of Solutions Tested

Endpoint Protection Platform (EPP)

Exploitation Mitigation

EDR and App Control
Presenter's Company Logo ­ replace on master slide

Endpoint Detection and Response (EDR)
36

#RSAC
Testing Highlights

Lateral Movement
· No silver bullets
· Look for odd usage of scripts
· Use threat modeling to identify how attackers would pivot through your network and build detection rules to identify IOPs
· Leverage Windows event logs and timeline analysis

· Control user-to-user communication and powershell script execution
· Use enhanced authentication (OTP/2fa) for domain admin accounts
· Implement mitigation strategies for Pass-the-Hash attacks

Presenter's Company

Logo ­ replace on

master slide

37

#RSAC
Detailed Results

Use Case
UC-02.010: Install Tools
UC-03.001: Credential Theft

Endpoint Protection Platform

Vendor # 1 Vendor # 2 Vendor # 3

Pass

Pass

Pass

Partial Partial Partial

Anti-

EDR + App

Exploitation Control

Vendor # 4 Vendor # 5

Fail

Partial

EDR
Vendor # 6 Vendor # 7
Fail Partial

Fail

Partial

Fail Partial

UC-04.001: Lateral

Fail

Fail

Fail

Movement

Reconnaissance

Fail

Partial

Fail

Partial

UC-04.002: Lateral

Pass

Fail

Pass

Pass

Partial Partial Partial

Movement

MalwaPrreesenter's Company InstallatLioogno ­ replace on

master slide

38

#RSAC
Enable Sufficient Logging

Sysmon

EDR

Audit policy configuration

Presenter's Company

Logo ­ replace on

master slide

39

#RSAC
Central Logging and Analysis

Presenter's Company Logo ­ replace on master slide

SIEM
40

#RSAC
Honeypots

Presenter's Company

Logo ­ replace on

master slide

41

#RSAC
For More Detailed Information
www.secopslabs.com

Presenter's Company

Logo ­ replace on

master slide

42

#RSAC
Apply What You Have Learned Today!

Next week you should:
· Ensure sufficient logging is enabled to detect IOPs
· Develop a detailed threat model for how attackers would pivot through your organization to gain access to your crown jewels

In the first three months following this presentation you should:
· Perform daily IOP hunting on your endpoints using either an EDR solution or Microsoft event logs
· Deploy honeypots to the DMZ and user and server subnets

Within six months you should:
· Implement enhanced authentication for domain admin accounts and pass-the-hash mitigation strategies

Presenter's Company

Logo ­ replace on

master slide

43

#RSAC
References

www.ultimatewindowssecurity.com

https://technet.microsoft.com/security/advisory/3004375

http://sysforensics.org/2014/01/lateral-movement/

www.optiv.com

http://windowsir.blogspot.com/2013/07/howto-track-lateralmovement.html

https://www.nsa.gov/ia/_files/app/spotting_the_adversary_with_wind ows_event_log_monitoring.pdf

Presenter's Company

Logo ­ replace on

master slide

44

