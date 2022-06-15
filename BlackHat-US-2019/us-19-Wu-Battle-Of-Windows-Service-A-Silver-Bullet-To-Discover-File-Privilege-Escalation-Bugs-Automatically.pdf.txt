Battle of Windows Service: A Silver Bullet to Discover File Privilege Escalation Bugs Automatically
Wenxu Wu ( @ma7h1as ) Tencent Security Xuanwu Lab

Tencent
Largest social media and entertainment company in China.
Tencent Security Xuanwu Lab
Applied and real world security research.
About me : Member of Advanced Security Team
Google security hall of fame / MSRC Top 100 focus on web application security , interested in local bugs hunting now.

This talk is based on
Windows 10 1803 / 1809 Vulnerabilities repTorted to MSRC
Visual Studio 2017 Vulnerabilities reported to MSRC

Introduction
What's new in this talk

Case study
Learn from historical bugs

Silver bullet
Where / how can I find bugs

Automatic
Build the discovery framework

Findings
bugs found by framework

Introduction : privilege escalation bugs in system service

System services (RPC , COM , ...)

system user token

Call

Restricted user

File / Registry / Handler operation

Introduction : file privilege escalation bugs

System services Create / Detele / Write (RPC , COM , ...) Grant Acess / Set Owner
Call
Restricted user

Target files

Introduction : file privilege escalation bugs in RPC service

RPC services

Create / Detele / Write Grant Acess / Set Owner

Protocol Sequences

Restricted user

Target files

Introduction : file privilege escalation bugs in RPC service

Protocol Restricted user
Sequences

RPC services

Ncalrpc (ALPC)

ncacn_np ncacn_ip_tcp ncacn_ip_udp ncacn_http

Introduction : Analyze ALPC interface
RPC viewer
IDA pro Process Monitor

Introduction : Analyze ALPC interface

Introduction : What's new
100+ interfaces , 1000+ functions ( only in ALPC ) Too many to be analyzed Fuzzer is designed to find memory corruption bugs , not logical flaw.

Introduction : What's new
Focus on the "Low-hanging-fruits" Easy to find , Easy to exploit
Automated if possible
What does those fruits look like ?

Case Study #1 : DACL rewrite (CVE-2018-8440)
Task Scheduler Service ALPC schedsvc.dll SchRpcSetSecurity
Grant Access to .job file

Case Study #1 : DACL rewrite (CVE-2018-8440)

Case Study #1 : DACL rewrite (CVE-2018-8440)

Case Study #1 : DACL rewrite (CVE-2018-8440)

Case Study #1 : DACL rewrite (CVE-2018-8440)
SetSecurity::RpcServer
ConvertStringSecurityDescriptorToSecurityDescriptor TaskPathCanonicalize
JobSecurity::Update
JobSecurity::AddRemovePrincipalAce

Case Study #1 : DACL rewrite (CVE-2018-8440)
create a hardlink named xxx.job point it to C:\windows\win.ini call the SchRpcSetSecurity Done
Easy to find , Easy to exploit "low-hanging fruits" !

Case Study #2 : TOCTOU Readfile (CVE-2019-0636)
Installer Service
MsiAdvertiseProduct
enables the installer to write to a script the registry and shortcut

Case Study #2 : TOCTOU Readfile (CVE-2019-0636)

Case Study #2 : TOCTOU Readfile (CVE-2019-0636)

Impersonate Check Access SzPackagePath

Revert to System Copy
SzPackagePath =>
c:\windows\installer

The copy is readable for current user

Case Study #2 : TOCTOU Readfile (CVE-2019-0636)
Battle with TOC-TOU
Oplocks Based on DeviceIoControl function define Callback function win TOCTOU in 1 time
ReadDirectoryChangesW No lock Brute force is needed

Case Study #2 : TOCTOU Readfile (CVE-2019-0636)

Silver bullet: how to find new bugs
· Analyze ALPC interface related to impersonation Not only ALPC interface but also documented function related to system service they make mistakes here again and then again
· Something new ...

Silver bullet: Analyze ALPC interface  impersonation
· Export ALPC interface from RPC viewer Function related to impersonate file operation
· Collet function list from MSDN Function related to system service

Bug #0
Program Compatibility Assistant Service ALPC pcasvc.dll RAiGetFileInfoFromPath
get metadata from path

Bug #0

Bug #0
Only use Impersonate
to check access

Do operation as system

Same mistake
Case #2

Bug #0

Silver bullet: Analyze ALPC interface  impersonation
But this is not the bullet we want
· Hard to Automated too many & reverse engineering is real hard · Low-hanging-fruits were sold out

Silver bullet: how to find new bugs
· Analyze ALPC interface related to impersonation Not only ALPC interface but also documented function related to system service they make mistakes here again and then again
· Something new

Silver bullet: Trigger function call with UI interaction
How to trigger function call without reverse engineering

Build automated framework
Template for DACL rewrite bugs
Do random UI interaction ( Click , Press button )

start application from system apps list

Hook process monitor to detect "SetSecurity" Call

Try to replace the path with symlink or hardlink ,
test if DACL changed
Save the log

Build automated framework : target
1. Windows 10 apps Camera / Xbox live .....
2. System application Network manager / Windows defender ...
3. Microsoft product Office / Visual Studio ...

Build automated framework : UI interaction
Mouse : get handler of target's window click button / menu list
Keyboard : press "enter" / some other keys

Bug #1
AppX Deployment Service Simple "Click" to trigger Set DACL for settings file
C:\Users\<username>\AppData\Local\Packages\<Packagename>

Bug #1
Replace settings file with hardlink

Run windows
app

Get full control of
any file

Bug #1

Bug #1

Bug #2
Diagnostics Hub Standard Collector Service "Click button from menu" to trigger Create X-X-X-X-X.scratch file
Set DACL for X-X-X-X-X file with same name

Bug #2

Bug #2

Bug #3
Windows defender service "Click button from right click menu" to trigger Quarantine "Current threats"
Set DACL for virus file

Bug #3

Bug #3

Bug #3

Acknowledgement
Yang Yu (@tombkeeper) of Tencent Security Xuanwu Lab James Forshaw (@tiraniddo) of Google Project Zero Chuanda Ding (@flowercode_) of Tencent Security Xuanwu Lab

Thanks
Tencent Security Xuanwu Lab @XuanwuLab
xlab.tencent.com

