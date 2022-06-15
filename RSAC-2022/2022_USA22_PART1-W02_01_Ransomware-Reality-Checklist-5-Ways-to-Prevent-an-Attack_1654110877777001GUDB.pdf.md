#RSAC
SESSION ID: PART1-W02
Ransomware Reality Checklist: 5 Ways to Prevent an Attack
John Fokker
Head of Cyber Investigations Trellix @john_fokker

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Speaker
John Fokker Head of Cyber Investigations / Principal Engineer Trellix
3

#RSAC
5 Ways to Prevent a Ransomware Attack
Plugging the holes Know when you've lost your keys What can we learn from cyber criminals? It's hard to stop what you can't see Creating speedbumps and checkpoints
Not a prevention but still a good topic... To pay or not to pay?
4

#RSAC
Plugging the Holes
CVEs exploited by ransomware gangs

CVEs Tracked by Trellix Threat Labs 21-22

All major groups were quick to leverage CVEs over the last 2 years
Initial Access, RCE or LPE
Most observed: MS Exchange, SolarWinds Serv-U, Log4J, Accellion, SonicWall, PrintNightmare and SMBv1

CVE-2021-34523 CVE-2021-34473 CVE-2021-31207 CVE-2021-26855 CVE-2021-4044 CVE-2021-35211 CVE-2021-27104 CVE-2021-27103 CVE-2021-27102 CVE-2021-27101 CVE-2021-44228 CVE-2021-31206 CVE-2021-45105 CVE-2021-45046 CVE-2021-44832 CVE-2021-4104 CVE-2021-21972 CVE-2021-34473 CVE-2020-12812 CVE-2019-5591 CVE-2018-13379 CVE-2021-36942 CVE-2021-5135

CVE-2021-26084 CVE-2010-2861 CVE-2021-36942 CVE-2021-34523 CVE-2021-34527 CVE-2021-1675 CVE-2021-28799 CVE-2021-20016 CVE-2021-27065 CVE-2021-27065 CVE-2021-26858 CVE-2021-26857 CVE-2020-5135 CVE-2020-1472 CVE-2018-13379 CVE-2018-13374 CVE-2017-0148 CVE-2017-0147 CVE-2017-0146 CVE-2017-0145 CVE-2017-0144 CVE-2017-0143

#RSAC

#RSAC
Conti Threat Actor Playbook Mentioning Recent CVEs

#RSAC
Threat Actors are Willing to Pay
The Conti Team aquired a SonicWall Secure Mobile Access 410, to build their own scanner for CVE-2020-5135
https://www.trellix.com/en-us/about/newsroom/stories/threat-labs/conti-leaks-examining-the-panama-papers-of-ransomware.html 8

#RSAC
Know When You've Lost Your Keys
Credential theft and Initial Access Brokers (IAB)

#RSAC
Credential mis-use as a key entry path
Source: Verizon Databreach Investigation Report 2022

#RSAC
Credential Theft
Infostealers: AZORult Predator the Thief Kpot MARS Redline Racoon Mars Stealer
11

Initial Access Brokers (IAB)
IAB sell access to multiple threat actors inc. ransomware gangs
Before the actual ransomware attack, access to companies is often sold via underground forums
Early Identification can save millions of USD
Mulitple vendors provide monitoring services; well worth the investment
Victim Identification via ZoomInfo or RocketReach type tools

#RSAC
12

#RSAC
What can we Learn from Cyber Criminals?
Don't take my word for it, but learn from their playbooks...

#RSAC
Cybercriminal Snitches Getting Love Instead of Stitches....

#RSAC
Dissecting the Attack Playbook

#RSAC
Why Reinvent the Wheel?
The Conti group was actively leveraging Scripts Github repos, Cobalt Strike, CVE PoCs, etc. Very often using non-malicious tools to obtain their objective Since it is open, study the same resources That brings us to the next point...
16

#RSAC
It's Hard to Stop What you Can't See
Spot the behavior before the malware

#RSAC
The Road from Initial Access to Domain Admin
Attackers are heavily reliant on non-malicious tools Traditional Sec controls are focussing too much malicious files Behavior is key.....so what is normal?
­ Embrace EDR, XDR, Sigma rules
Try to cover your blind spots Only in "monitoring mode" is not enough
19

Non-Malicious Tools Used by Cyber Criminals

Native OS Binaries Windows Command Shell (CMD) PowerShell
WMI/WMIC

Percentage Mitre technique

53.44% 43.92%

T1059.003 T1059.001

33.86%

T1218 T1564.004

Rundll32
Regsvr32 Schtasks MSHTA Excel Net.exe
Certutil Reg.exe

24.34%
14.29% 12.70% 10.05% 8.99% 7.94%
4.23% 3.70%

T1218.011 T1564.004
T1218.010
T1053.005
T1218.005 T1105
T1087 & Subtechniques
T1105, 1564.004 T1027 1003.002 1564.004

#RSAC
20

Non-Malicious Tools Used by Cyber Criminals

Administrative Tools Percentage MITRE technique

Info

Remote Services

35.98%

Archive Utilities

6.35%

T1021.001

AnyDesk

T1021.004 T1021.005 ConnectWise Control

RDP UltraVNC PuTTY WinSCP

T1560.001

7-Zip WinRAR WinZip

BITSAdmin

3.70%

T1105 T1218 T1564.004

ADFind
PsExec fodhelper.exe

2.65%
2.12% 0.05%

T1016 T1018 T1069 & Sub-Techniques, T1087 & Sub-techniques T1482
T1569.002
T1548.002

#RSAC
21

#RSAC
RCLONE Mentioned in the Threat Actor Playbook

#RSAC
It's all About Observables

#RSAC
RCLONE Hunting for Non-Malicious Tools

#RSAC
RCLONE Sigma Rules

#RSAC
Creating Speed Bumps and Checkpoints
Defense in-depth to make lateral movement more difficult

#RSAC
Speed Bumps
Multi-factor authentication Network segmentation Limit browser cookie life Active Directory security

#RSAC
To Pay or Not to Pay?
There is no right answer
28

#RSAC

#RSAC
Key Takeaways
Stick your finger in the dam when there is a hole Always look for your keys, you might have lost them Learn from the bad guys, when it's still at a low-cost If it acts strange, don't trust it Speedbumps are there for a reason
30

Thank you

@Trellix @TrellixLabs @John_Fokker

31

Trellix | Always Learning. Always Adapting.

#RSAC

