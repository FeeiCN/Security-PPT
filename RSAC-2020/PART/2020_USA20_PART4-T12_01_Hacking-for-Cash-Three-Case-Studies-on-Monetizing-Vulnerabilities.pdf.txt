SESSION ID: PART4-T12
Hacking for Cash: Three Case Studies on Monetizing Vulnerabilities

Brian Vecci
Field CTO Varonis Systems @BrianTheVecci

#RSAC

#RSAC
So one day you get an email...

#RSAC
..then you check your SIEM
3

#RSAC
What did you miss?

#RSAC
Varonis Incident Response Investigations in 2019

Insider Threat 13%

Ransomware 6%

Malware 9%

Cyber Criminals & APTs. 21%

Brute Force 51%

#RSAC
How do they happen?

#RSAC
First, some basics
Any organization can be hacked Bypassing endpoint security is just another day at the office PowerShell has everything an attacker needs Active Directory is affectionately known as "(H)Ac(k)tive Directory"

#RSAC
Top Evasion Techniques
Targeted Attacks
­ Phishing with challenge response (MFA Bypass) ­ O365 Phishing ­ VBA, Microsoft Office attachments
Malware
­ Recon for EP detections ­ Code signed with valid stolen certs (Qbot) ­ Ransomwares - using common func calls (.NET, PowerShell)
C2 and Data Exfiltration
­ New Domains & Same Geo location ­ HTTPs & DNS Usage
Brute force.

#RSAC
Let's Review Malware's Attack Flow

Infection

Command & Control

· These people love cats!
· And droppers!

· Hey, I've got a new host!

Recon & Lateral Movement

Privilege Escalation

· Let's meet its neighbors...
· And turn them into zombies, too!

· Let's get more power!

Persistence

Data Exfiltration

· Let's stay a while!

· Got your nose!

#RSAC
Qbot
Global Advanced Persistent Threat

#RSAC
Qbot's Attack Flow

Infection

Command & Control

Recon & Lateral Movement

Privilege Escalation

· Phishing · Found "dropper" · Calc.exe · Interrogated
endpoints

· Found C&C server · Comms over DNS

· Explores processes
· Connecting to other devices
· Brute force neighbors

· Exploit to get system account
· Just a VBS file

Persistence
· Scheduled task · Shortcut in
startup folder · Injected into
explorer.exe

Data Exfiltration
· Financial Information over web (think proxy)

#RSAC
Getting in the door
12

#RSAC
Establishing persistence

#RSAC
Move and steal

#RSAC
Who was affected?

#RSAC
Victims by Anti-Virus
16

#RSAC
Norman
Mining for Monies

#RSAC
Norman's Attack Flow

Infection

Command & Control

Recon & Lateral Movement

Privilege Escalation

Persistence

· Unpatched servers · Phishing email

· Beaconed to the C&C via DNS
· Opened remote shell

· Manual operation with remote commands (via reverse shell)

· No special privileges needed

· Random file names
· SMB and shares
· New processes

Data Exfiltration
· Stole computing power (DDOS)

#RSAC
Getting in the door
19

#RSAC
If it's x86?
20

#RSAC
How does it look?
21

#RSAC
Miners not minors!
22

#RSAC
Unique Command and Control
23

#RSAC
When XSL is not XSL

#RSAC
Norman Analysis
Unique C2 Operation
­ Manual control by threat actors ­ Encoded C2 communication ­ Send config settings updates ­ Relied on DuckDNS
Unique Behavior
­ Reverse shell for recon ­ Activity was low and slow ­ Anti-detection and anti-forensics

#RSAC
Save the Queen
Sophisticated Ransomware

#RSAC
God Save the Queen Attack Flow
Infected user created a file named "hourly" on the SYSVOL share Many log files were created on the SYSVOL share, each with the name of a device in the domain
­ log files were used to monitor the infection process on new devices
Many different IP addresses accessed the "hourly" file
­ scheduled task that ran malware on new devices using PowerShell

#RSAC
Save the Queen Ransomware Flow

#RSAC
Save the Queen Analysis

#RSAC
Detecting Advanced Attacks

#RSAC
Advanced Detection Techniques
Visibility is everything Combine multiple telemetry sources Cluster and behavior analysis

#RSAC
What should you go do right now?
Brute force your own systems
­ External mailboxes and shares ­ Internal devices and services
Audit your incident response Where are you in the MITRE ATT&CK framework?

#RSAC
Thank you!
Brian Vecci Varonis Field CTO Booth #N-5645

