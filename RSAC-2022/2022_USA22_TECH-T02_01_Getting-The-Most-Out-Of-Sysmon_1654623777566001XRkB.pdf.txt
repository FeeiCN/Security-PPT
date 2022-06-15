#RSAC
SESSION ID: TECH-T02
Getting The Most Out Of Sysmon
Amanda Berlin
Lead Incident Detection Engineer Blumira, Inc @infosystir @blumirasec




#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA® Conference, RSA Security LLC or any other co-sponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Security LLC or its affiliates. All rights reserved. RSA Conference logo, RSA and other trademarks are trademarks of RSA Security LLC or its affiliates.
2
 



#RSAC
Hello. Your company's server hard drive was
encrypted by us.
3



#RSAC
In order for you to believe in us, we have prepared the test server.
Please contact us and we will tell the test server and decrypt the
password.
4



#RSAC

Please contact us and we will tell you the amount of ransom and how to pay.

(If the contact is fast, we will give you a discount.)

After the payment is successful, we will tell the decrypt password.




5



#RSAC
Have you been blinded to threats for no reason?
6


#RSAC
System Monitor (Sysmon)
A Windows system service and device driver that remains resident across system reboots to monitor and log system activity to the Windows event log. It provides detailed information about
process creations, network connections, and changes to file creation time.
7
  


#RSAC

Attack surfaces are expanding. Yet...

31%
Believe their risk response efforts are under-funded

38%
Plan to spend more on response planning

$0
The cost of Sysmon

Data from 2020 CSO Security Priorities Study
8


#RSAC
"Quick detection and response are critical to reporting the exact scope of a breach, figuring out what might have been compromised, and complying with
regulatory breach notification requirements.
- Limor Kessem, global executive security advisor at IBM Security
9
 "


#RSAC
Sysmon Use Cases
Threat Hunting and Detection Testing

Threat Hunting with Sysmon
What Can Windows Event Viewer Detect
Process Creatio Process Change Network Connectio Process Terminate
Driver Loade File Creat
Registry Create/Delet Registry Value Se
Registry Key & Value Renam WMI EventFilter activit
WMI EventConsumer activit WMI EventConsumerTOFilter activit
DNS Quer
 e e y 
 
 
 d d
 
 n n
 
 d d d 
 
 
 t t
 
 d d n n 
 
 s 
 
 
 e e e 
 
 y y 
 
 
 d g 
 
 d d d y y 
 
 
 
 
 e e
 
 h
 y ? 
 y
 
 ?


What Can Sysmon Detect
Process Creatio Process Change Network Connectio Process Terminate
Driver Loade
Image Loade Create Remote Threa Raw Access File Rea
Process Acces
File Creat Registry Create/Delet
Registry Value Se Registry Key & Value Renam
File Create Stream Has Pipe Event Create
Pipe Event Connecte
WMI EventFilter activit WMI EventConsumer activit WMI EventConsumerToFilter activit
DNS Query
File Delete (archived) Clipboard Chang Process Tamperin
File Delete Detected

#RSAC
11

#RSAC
Threat Hunting with Sysmon
12


#RSAC
Threat Hunting with Sysmon
13


#RSAC
Threat Hunting with Sysmon
14


#RSAC
Adversary Emulation & Detection Testing
15


#RSAC
Detection Testing & Adversary Emulation
16


#RSAC
Detection Testing & Adversary Emulation
17


#RSAC
Use Case 1
18


#RSAC
Use Case 1
VS
19


#RSAC
Use Case 1
20


#RSAC
Use Case 1 - Detection & Summary
Windows Event = 1 (sysmon) Command or parent command like
%comsvcs.dll%minidump%




21

#RSAC
Use Case 2
22


#RSAC
Use Case 2
VS
23


#RSAC
Use Case 2
VS
24


#RSAC
Use Case 2
VS
25


#RSAC
Use Case 2
VS
26


#RSAC
Use Case 2 - Detection & Summary
Windows Event = 1 (sysmon) Process Name like %ntdsutil.exe% Command or parent command like %q%q%

 



27

#RSAC
Use Case 3
28


#RSAC
Use Case 3 - sidebar
29


#RSAC
Use Case 3
VS
30


#RSAC
Use Case 3
VS
31


#RSAC
Use Case 3
VS
32


#RSAC
Use Case 3
33


YAY Cobalt Strike!
Set-StrictMode -Version 2
$DoIt = @' function func_get_proc_address {
Param ($var_module, $var_procedure) $var_unsafe_native_methods = ([AppDomain]::CurrentDomain.GetAssemblies() | WhereObject { $_.GlobalAssemblyCache -And $_.Location.Split('\\') [-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods') $var_gpa = $var_unsafe_native_methods.GetMethod('GetProcAddress', [Type[]] @('System.Runtime.InteropServices.HandleRef', 'string')) return $var_gpa.Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($var_unsafe_native_methods.GetMethod('GetModuleHandle')).Invoke($null, @($var_module)))), $var_procedure)) }
function func_get_delegate_type { Param ( [Parameter(Position = 0, Mandatory = $True)] [Type[]] $var_parameters, [Parameter(Position = 1)] [Type] $var_return_type = [Void]

 
 
 
 
 
 
 
 
 
 
 


#RSAC
34

#RSAC
Use Case 3 - Detection & Summary
Windows Event in (12,13) Command or parent command like comspec




35

#RSAC
Exchange Compromise
36


#RSAC
Exchange Compromise
37


#RSAC
Exchange Compromise
38


#RSAC
Exchange Compromise
39


#RSAC
Exchange Compromise
40


#RSAC
Exchange Compromise
41


#RSAC
Exchange Compromise
42


#RSAC
Exchange Compromise Detection
Windows Event = 1 Parent_process_name like %w3wp.exe process_name in (cmd.exe, powershell.exe)


 


43

#RSAC
Take Action: Time To Rip Off The Blindfold!
44


#RSAC
Immediate Actions
· Scrutinize Logs
· Plan for Attacks
· Outline a Process of Improvement
· Align with Company Objectives

 

 


45

#RSAC
Future Actions
Install/Configure/Confirm Sysmon
Poshim vs Manual Install
46



#RSAC
Future Actions
Choose a Configuration
47


#RSAC
Future Actions
Test Your SIEM
Easy tests: · Password spraying · PowerShell Dropper attacks · More: https://www.blumira.com/
webinar/is-this-thing-on/

 
 

 


48

#RSAC
Future Actions
Map To a Framework & Create Detections
++ =
49


#RSAC
Summary

