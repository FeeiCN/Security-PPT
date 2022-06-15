#RSAC
SESSION ID: PART3-T09
IOT: Fix the Bugs That Leave Customers Inconvenienced, Stranded, or Dead
Scott W Register
VP Security Solutions Keysight @swregister

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

3

#RSAC

#RSAC
IOT Devices Are Plagued With Vulnerabilities
5

#RSAC
Aspects of IOT for Cybersecurity Validation

Vulnerability Assessment
· Weak/Default Passwords · Deprecated encryption · Invalid certs · APK packages · ADB interface · Exposed services · Old/unpatched OS

Protocol Fuzzing
· Weaknesses in protocol stack · Supply chain vulnerabilities from SOC · Trigger crash / reboot / security bypass · Can be difficult to find · Harder to fix post-deployment

Cloud Services
· MFA protection · Certificate and validation · Access logging · IAM

6

#RSAC
Protocol Fuzzing
Systematic injection of errors into protocol stream Especially effective during handshake Malformed, repeated, out-of-order packets Finds flaws embedded in communication chipsets
7

#RSAC
Vulnerability Assessment

Scanning a device for weaknesses to specific attacks
Library of known attacks is constantly evolving
Typically directed at operating system and applications

Link Layer related CVEs (BLE) · CVE-2019-16336 · CVE-2019-17519 · CVE-2019-17517 · CVE-2019-17518 · CVE-2019-17061 · CVE-2019-17060 · CVE-2019-19193

Also includes guessable passwords, weak encryption, and certificate errors

Source: NIST
8

#RSAC
Vulns Discovered in Post-Market Devices
SweynTooth Cybersecurity Vulnerabilities May Affect Certain Medical Devices: FDA Safety Communication Cybersecurity Vulnerabilities in Certain GE Healthcare Clinical Information Central Stations and Telemetry Servers: Safety Communication URGENT/11 Cybersecurity Vulnerabilities in a Widely-Used Third-Party Software Component May Introduce Risks During Use of Certain Medical Devices: FDA Safety Communication Certain Medtronic MiniMed Insulin Pumps Have Potential Cybersecurity Risks: FDA Safety Communication Cybersecurity Vulnerabilities Affecting Medtronic Implantable Cardiac Devices, Programmers, and Home Monitors: FDA Safety Communication
9

#RSAC

Source: FDA

10

#RSAC
11

#RSAC
Digital Twins

#RSAC

Digital

Twin

· Safety · Acceleration · Anomaly Detection

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC
If You Build Stuff:
Apply What You Have Learned Today
Next week you should:
­ Find out if you even do cybersecurity testing ­ VA? Fuzzing?
In the first three months following this presentation you should:
­ Understand the attack surface exposed by your devices ­ Map out the probability of compromise and impact of compromise ­ Understand the risks imposed by your supply chain
Within six months you should:
­ Define a cybersecurity evaluation regimen as part of quality control
18

#RSAC
If You Deploy/Manage Stuff:
Apply What You Have Learned Today
Next week you should:
­ Build an inventory of the connected devices, IP or otherwise, on your network
In the first three months following this presentation you should:
­ Understand how accessible (RF? Ethernet? Routed IP?) your devices are ­ Tabletop exercise of exposure of your connected/IOT devices
Within six months you should:
­ Have a testing mechanism in place for connected devices with higher risk profiles
­ Implement a plan for resolving your IOT supply chain issues
19

#RSAC
Q&A
20

