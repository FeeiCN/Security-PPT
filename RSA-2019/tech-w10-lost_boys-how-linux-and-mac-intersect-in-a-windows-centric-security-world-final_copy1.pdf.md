SESSION ID: TECH-W10
Lost Boys: How Linux and mac Intersect in a Windows-Centric Security World

Josh Harriman
VP of Cyber Security Intelligence Ziften @IrishNewMexican

Alexander Benoit
Lead Security Analyst sepago GmbH @ITPirate

#RSAC

#RSAC
macOS and Linux in the workplace
Microsoft still dominates the market share (overall) macOS continues to grow BYOD ­ cool, I'll bring in my killer macbook pro Linux ­ servers really, not much desktop
2

#RSAC
macOS and Linux in the workplace
3

#RSAC
Session Objectives
Clear up misconception about macOS and Linux attacks Develop easy to follow strategy to cover your assets Give you details on how to achieve this strategy
4

Some history of attacks specific to macOS and Linux

#RSAC
macOS Management in the Enterprise Today
most management products are built for Windows computers join Macs to AD & use Apple Remote Desktop to push commands use Mac OS X Server with Apple's Profile Manager to set policies 3rd party management software
6

#RSAC
macOS attacks over the years
7

#RSAC
macOS attacks
8

#RSAC
macOS attacks
9

#RSAC
macOS attacks
10

#RSAC
macOS attacks
11

#RSAC
Linux Management in the Enterprise Today
"Security through obscurity" 100's of Linux distributions and variations 1000's of use cases (IoT, IIoT, ICS... etc.)
12

#RSAC
Linux attacks over the years
13

#RSAC
Linux attacks
14

#RSAC
Linux attacks
15

#RSAC
Linux attacks
16

#RSAC
Linux attacks
17

#RSAC
18

#RSAC
Malware not needed
Attacks today generally don't need sophisticated malware
­ Social engineering to gain access ­ Exploits in 3rd party software
19

#RSAC
Using legitimate tools for nefarious actions
Living off the land in Windows has its place in macOS and Linux
­ https://gtfobins.github.io/
20

#RSAC
21

Strategy to monitor macOS and Linux

#RSAC
You need to monitor ALL activity ALL the time
Endpoint Detection and Response (EDR) is a cybersecurity technology that addresses the need for continuous monitoring and response to advanced threats. EDR is focused on providing the right endpoint visibility with the right insights to help security analysts discover, investigate and respond to very advanced threats and broader attack campaigns stretching across multiple endpoints.
Historical data is important as well
23

#RSAC
Step by step
1. Do you know your assets in your network? 2. Are they managed by IT? 3. What can you find out about them without managing them? 4. Once managed, what do you need to monitor?
24

#RSAC
What, where and when
Find a tool that can find unmanaged assets
­ There are enterprise solutions available to do this
o Go to the Vendor hall and have some conversations
Using arp scan or arp cache (on managed systems) can give results of other systems in your network that you need to be aware of
25

#RSAC
Unmanaged Assets
26

#RSAC
What, where and when
Everywhere in your network
­ Corporate ­ VPN access ­ Every system you can touch ­ Cloud environments
Match against your systems management tool report
­ Is the system compliant and protected? ­ Filevault (macOS), SELinux (if applicable)
27

#RSAC
Filevault status monitoring
28

#RSAC
Jamf
29

#RSAC
What, where and when
All the time visibility
­ Look at system and user behavior
Historical lookback is very important
­ What was the system doing 6 months ago? ­ Use this information to update your security procedures
30

#RSAC
31

#RSAC
Historical timeline
32

Some tools and techniques

#RSAC
Turn on some logging...and then look at that data
34

#RSAC
Auditing OSX
openBSM project created by McAfee Research
The Basic Security Module (BSM) interface to audit records and audit event stream format were defined by Sun Microsystems
openBSM provides an auditing system available as part of the core OS X
­ Advantages: openBSM adds support for security event auditing. Event auditing supports reliable, fine-grained, and configurable logging of a variety of security-relevant system events, including logins, configuration changes, and file and network access. These log records can be invaluable for live system monitoring, intrusion detection, and post mortem analysis.
35

#RSAC
Auditing Linux
36

#RSAC
Auditd
Audit is actively developed by Red Hat and is available for most, if not all, major distributions. If it is not already installed on your system, you can find it by searching in your system's repositories. In Debian-based systems, the package is simply called audit, while in RPM-based systems, it shows up as auditd. In most Red Hat-related systems, such as Fedora and CentOS, auditd is usually installed by default.
­ https://www.linux.com/learn/linux-system-monitoring-and-more-auditd ­ https://www.linux.com/learn/customized-file-monitoring-auditd
37

What do you do now

#RSAC
Apply what we discussed today, tomorrow and always
After the conference next week, find your missing assets
­ Do you have unmanaged macOS and Linux systems ­ Do you know you have those systems, but are ignoring them?
By the middle of Q2 this year, you should have at least tested a solution either from a vendor (PoC) or home grown
­ Talk with at least 3 vendors this week
By the end of 2019, you should never have a blind spot with your macOS and Linux population
­ Either purchase a solution from a vendor, or apply some tactics we discussed today
39

#RSAC
References
https://github.com/darkoperator/PoshSecMod/blob/master/Discovery/Discovery.psm1 https://www.scip.ch/en/?labs.20150108 https://gtfobins.github.io/ https://www.fortinet.com/blog/threat-research/microsoft-word-file-spreads-malwaretargeting-both-apple-mac-os-x-and-microsoft-windows.html_ https://opensource.apple.com/source/OpenBSM/ https://www.linux.com/learn/linux-system-monitoring-and-more-auditd
40

