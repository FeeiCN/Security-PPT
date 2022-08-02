SESSION ID: PART2-T10
2020 ATT&CKTM Vision Correlating TTPs to Disrupt Advanced Cyberattacks

Rick McElroy
Principal Cybersecurity Strategist VMware Carbon Black @InfoSecRick

Greg Foss
Senior Threat Researcher VMware Carbon Black @heinzarelli

#RSAC

#RSAC
Profiling Malware using MITRE ATT&CKTM
Understanding Common Techniques Tactics and Procedures

#RSAC
Profiling Malware using MITRE ATT&CKTM
Research Goals:  Provide guidance on optimal security efficacy and prevention  Reduce overall false positives that detract from detection efficacy  Understand common TIDs associated with malware classifications  Determine most prevalent techniques in use by modern malware  Highlight edge-cases and outliers of unique Techniques
3

#RSAC
Why?
· Help the security community defend more effectively against all types of malware
· Separate fiction from fact through systematically analyzing a pool of malware families and presenting the findings
· Create a repeatable process to extend our analytics pipeline · Understand trends and techniques that overlap among
malware families, and utilize this information to adapt detections
4

#RSAC
MITRE ATT&CKTM ­ Malware Profiling
5

#RSAC
Key Highlights
· Defense evasion behavior was seen in more than 90 percent of samples · Ransomware has seen a significant resurgence over the past year · Top Targeted Industries Include: Energy and Utilities, Government and Manufacturing · Ransomware's evolution has led to more sophisticated Command and Control (C2) · Wipers continue to trend upward · Classic malware families have spawned the next generation
6

#RSAC
Destructive Malware
Ransomware, Wipers, and more...

History of Destructive Cyber Attacks
Subset of High Profile, Public, and Documented Destructive Attacks

#RSAC
Physically Destructive Destructive

1980

1990

2000

2010

1982: Siberian Pipeline

2008: Beijing Olympics Deceptive Russian Campaign to disrupt the Olympic Games.

2013: Dark Seoul North Korean attacks on South Korean Television Stations and Banks.

2014: German Steel Mill Attack on ICS controlling blast furnace, resulting in significant physical damage.

2016: Crash Override Russian attack on electric

The CIA tricked the Soviet Union

transmission station ICS

into acquiring ICS software with built-in flaws. Software was programmed to malfunction resulting in one of the worlds largest non-nuclear explosions.

2008: Georgia Russian Joint campaign against Georgian targets. Website defacement, DDoS, and diverting citizens web traffic through Russia.

2014: Sony Entertainment North Korean attack in response to movie ­ data theft and wiping resulting in $35 million in damages.

systems in Kiev, Ukraine.
2015: Black Energy Russian attack on three Ukrainian Energy Distribution Companies.

Cutting power to 750,000 civilians.

1998: Kosovo 35,000 Computers wiped and replaced with burning American flag by Iranians.

1998: CIH Chernobyl virus which overwrote critical system data ­ affecting 60-million computers. Developed by a Taiwanese Student.

2010: Stuxnet US and Israeli developed-malware leveraged to delay the Iranian Nuclear Program's ability to enrich Uranium. The malware targeted Siemens ICS and physically destroyed Uranium centrifuges, leveraging 4 zero-days.

2015: TV5Monde Russian actors destroyed French TV station hardware, taking the network offline for 12-hours.

2017: NotPetya One of the most damaging Cyber Attacks in history. Russia targeted large Ukraine companies. Estimated to have cost over $10 Billion in damages, globally.

8

NotPetya - Financial Impact

#RSAC
$7.5 Billion in damages to smaller companies

https://www.wired.com/story/notpetya-cyberattackukraine-russia-code-crashed-the-world/
10

#RSAC
Distribution of Ransomware Across Industry Verticals
11

#RSAC
Ransomware ATT&CK'd
12

#RSAC
Ransomware Behaviors
13

#RSAC
Ransomware - Defense Evasion
· T1497 ­ Virtualization / Sandbox Evasion
­ AV, backup, monitoring detection
· T1045 ­ Software Packing
­ UPX, ASPack, .NET obfuscaters etc.
· T1143 ­ Hidden Window
­ PowerShell
· T1036 ­ Masquerading
­ svchostt.exe, expllorer.exe
14

#RSAC
Ransomware - Impact
· T1486 ­ Data Encrypted for Impact · T1490 ­ Inhibit System Recovery
­ vssadmin delete shadows, bcdedit
· T1485 ­ Data Destruction
­ Ransomware that also acts as a wiper
· T1491 ­ Defacement · T1489 ­ Service Stop
­ Stopping of critical services e.g. AV, backup etc.
15

#RSAC
Ransomware Takeaways
· Defense Evasion is imperative to successful Ransomware infection
­ Software Packing, Sandbox Evasion, Masquerading, and Hidden Windows
· Various persistence methods are leveraged consistently
­ Hidden files/folders, scheduled tasks, registry mods, Bootkits, etc. ­ Persistence mechanisms often remain following decryption
· Credentials are accessed and leveraged for privilege escalation
­ Often exfiltrated over plain-text-protocols and used to maintain access
16

#RSAC
Ransomware turned Wiper...
· Reverse Engineering and repurposing of existing ransomware
­ NotPetya
· A continuing trend of creating ransomware with no actual decryption mechanism is being observed across the industry
­ Shamoon, GermanWiper, Dustman, etc...
· Nation States are increasingly leveraging wormable wipers · When the goal is simply destruction ­ all bets are off...
17

#RSAC
18

#RSAC
19

#RSAC
Dustman
https://www.carbonblack.com/2020/01/21/threat-analysis-unit-tau-technical-report-the-prospect-of-iranian-cyber-retaliation/
20

#RSAC
Wipers ATT&CK'd
21

#RSAC
Wiper Behaviors
22

#RSAC
Defender Advice
 Thin out attack surface  Get back to basics, backups and testing  Continuous Recording via EDR  Deploy Application Whitelisting  PowerShell Logging  Centralize Endpoint and Network Logs  Focus on clustered behaviors  Operate under the premise that attackers don't leave
23

#RSAC
VMware Security Vision ­ Intrinsic Security
24

#RSAC

Thank you!
rmcelroy[at]vmware.com @InfoSecRick

gfoss[at]vmware.com @heinzarelli

