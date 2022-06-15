#RSAC
SESSION ID: ZT-M05
Bringing Zero Trust to Industrial Control Systems
William Malik
VP Infrastructure Strategies Trend Micro @WilliamMalikTM

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Agenda
Industrial Control Systems Vulnerabilities - Recent Attacks on IIoT What is Zero Trust? Integrating Zero Trust with IIoT Augmenting Cyber Process Hazard Analysis What ZT Cannot Do Future Requirements
­ Vendor requirements ­ OT/IT Alignment ­ Integrating MSPs
What We've Learned References
3

#RSAC
ICS Vulnerabilities

#RSAC
As Factories Become Smarter, the Attack Surface Will Increase
5

#RSAC
ICS/CERT Advisories 2010 - 2021

#RSAC
Industrial Control Systems Vulnerabilities - History
7

#RSAC
Industrial Control Systems Vulnerabilities 2022
CISAReleases Securit y Advisories for Rockwell Aut omat ion Product s
March 31, 2022
Siemens Addresses Over 90 Vulnerabilities Affecting Third-Party Components
March 2022
Schneider Relay Flaws Can Allow Hackers to Disable Electrical Network Protections
March 2022
Toyota's Japan Production Halted Over Suspected Cyberattack
February 2022
GE SCADA Product Vulnerabilities Show Importance of Secure Configurations
February 2022
8

#RSAC
Worms, Old and New
Conficker (Downadup) 2008
­ Martel bodycams infected at manufacture 2015
Palevo 2009
­ Mariposa botnet taken down 2010, still active
Gamarue (Andromeda, Wauchos) 2017 worm via USB
­ CC net disrupted 2017, still active
EternalBlue 2017 fueled WannaCry and NotPetya
­ NSA developed, exposed by ShadowBrokers, patched 2017, MS17-010
9

#RSAC
Weak Points in the Industrial Environment
10

#RSAC
Attacks against Automation Software
11

#RSAC
Recent Attacks on IIoT
https://hub.tisafe.com/
12

#RSAC
Zero Trust
Introduction Integration with ICS

#RSAC
What is Zero Trust?
The cloud has no perimeter There is a source of trust Assume minimal need to know MFA for critical tasks Log, verify, audit, review Establish separation of duties
14

Many Paths to Zero Trust
Verify identities: Multi-factor Authentication
Restrict network access: Micro-segmentation, DMZ's...
Default-deny app execution: Application Safe-listing
Continuously assess identity & device health: Zero Trust Risk Insights

#RSAC
SASE / ZTE
Get visibility to SaaS apps, control access: CASB + secure web gateway (SWG)
Beyond VPN ­ provide a secure appspecific connection:
Zero Trust Network Access (ZTNA)

#RSAC
Cyber Process Hazard Analysis
16

Typical Attack Process and Tools

Compromised accounts
Spear phishing
Vulnerability

Initial Access

Lateral Movement

Remote access RDP, ScreenConnect, Anydesk, etc.

Emotet Trickbot

Living-off-the-land tools PsExec, PowerShell, WMI,
etc.
Grayware Mimikatz, Netscan, etc.

Exploit

Penetration testing tools Cobalt Strike, Meterpreter

Data Exfiltration

Ransomware Deployment

MegaSync, FileZilla

AV termination PC Hunter, PowerTool, GMER, Software uninstallers, Process
Hacker, Scripts
Ransomware

#RSAC
17

How to Defend: CISA Recommendations

Preparation

Detection & Analysis

Containment & Eradication

Recovery &
Post-Incident Activity

Reduce infection risks
- Asset and account management - Resolve vulnerabilities - Configure settings properly - Determine dependencies and priorities - Deploy security controls - Risk management for 3rd parties - Backup - IR plan and exercise

Minimize impact
- Determine impacted systems - Isolation - Triage - Rebuild and restore

#RSAC
18

#RSAC
ICS 410: SANS ICS/SCADA Security Essentials
19

#RSAC
Deploying Zero Trust - and Beyond - for ICS

OT and IT perimeter: Establish boundaries between the corporate networks, factory systems, and the field. Segment the networks. OT assets: Shield and monitor industrial endpoints that cannot run security software or be patched. OT network: Use network security adapted to the industrial protocols and technology used in field networks. Offline operations: Secure removable media and external devices brought in for maintenance. SOC/CSIRT: Monitor the entire environment to streamline threat detection and incident responses.

Enterprise IT
L4-5
DMZ L3.5
Control L3

SOC/CSIRT Perimeter

IIoT Cloud
Industrial app
5G Network

RDP/Historian
OT Asset/ Network

5G RAN

Process L0-2

HMI/SCADA

MEC

EWS Controller

IoT GW
Offline/ Maintenance
USB Storage

Actuator

Laptops

20

Top Mitigation Steps ­ Claroty 1H21 Analysis

Segmentation Secure Remote Access Ransomware, Phishing, and Spam Protection
Traffic Restriction Threat Detection Techniques
Workstation Hardening User and Role Policy Least-Privilege User Defense-In-Depth Disable Feature
Secure Communication Other
Replace Product 0

50

100

150

200

250

300

350

400

#RSAC
21

#RSAC
ICS Future Requirements

#RSAC
Why is ICS Security So Hard?

Not patched Not patchable

No Anti-virus

Easy to access facilities once threats get in

Harsh, unique environment

Conflicting Architectural
Mandates

Worldwide deployment
23

#RSAC
ICS Vendor Requirements
Exploit new processor capabilities Provide telemetry and alerts Enable basic authentication Securely update firmware, s/w
Source: ARM Developer, https://developer.arm.com/documentation/102412/0102/Execution-and-Security-states
24

#RSAC
Organizational Silos Create Attack Surfaces

Factory Corporate

Office network Field network

Corporate IT

Factory IT Engineering Production

Corporate IT monitors traffic between enterprise and factory Factory IT administers local networks and applications Production engineering teams design and integrate field networks Production team operates devices on shop floor
25

#RSAC
Integrate MSPs
Automate correlation - Monitor telemetry - Build playbooks
26

#RSAC
A Step-by-Step Guide to Securing the Industrial Environment

Mapping the data

Securing the network and communication
channels

Securing the equipment and endpoints (IIoT
devices)

Implementing

Having a mitigation connected threat

strategy

defense

27

Apply What You Have Learned Today
Next week you should:
­ Review Network Segmentation ­ Identify Flawed Air-Gap Assumptions ­ Isolate Critical Level 0/1 Systems ­ Include IT Security in ICT Design Discussions
In the first three months following this presentation you should:
­ Segment IT and OT Networks ­ Review Supply Chain (hardware and software) for IIoT Environments ­ Institute rotational assignments between IT Security and ICS
Within six months you should:
­ Deploy Secure Coding Practices for Industrial Systems ­ Incorporate Safety Systems and ICS Network Monitoring into SOC ­ Develop OT Upgrade Plan ­ Deploy 5G NPN Program for Wireless Environments

#RSAC
28

#RSAC
References
An In-depth Look at ICS Vulnerabilities, Trend Micro, https://www.trendmicro.com/pl_pl/research/22/c/an-in-depth-look-at-ics-vulnerabilities-part-1.html Incident Hub, Industrial Cybersecurity Incidents Database. https://hub.tisafe.com/ accessed March 13, 2022 PLC Vuln https://claroty.com/2021/05/28/blog-research-race-to-native-code-execution-in-plcs/ Army advisory https://gcn.com/articles/2021/05/27/army-iot-free-telework.aspx Rogue Automation: Vulnerable and Malicious Code in Industrial Programming, Trend Micro, 2000. https://www.trendmicro.com/vinfo/us/security/news/internet-of-things/unveiling-thehidden-risks-of-industrial-automation-programming "A Blind Spot in ICS Security," Trend Micro, 2020. https://www.trendmicro.com/us/iot-security/news/6149 et seq.) "TSMC Restarts Operations After Virus Takes Down Factories," 2019 https://www.sourcetoday.com/supply-chain/article/21867120/tsmc-restarts-operations-after-virus-takes-downfactories "A security expert reportedly warned SolarWinds ..." Business Insider, 2020 https://www.businessinsider.com/solarwinds-warned-weak-123-password-could-expose-firm-report-202012#:~:text=A%20security%20researcher%20said%20he,to%20a%20Tuesday%20Reuters%20report "Security of Smart Manufacturing Systems," N. Tuptuk and S/ Hailes, Journal of Manufacturing Systems, v47 April 2018. https://www.sciencedirect.com/science/article/pii/S0278612518300463 "Reference Architecture for Smart Manufacturing: A Critical Review," Moghaddan, M et al. Journal of Manufacturing Systems, v49, Oct 2018. https://www.sciencedirect.com/science/article/abs/pii/S0278612518301043 NIST, "Smart Manufacturing Operations Planning and Control Program," National Institute of Standards and Technology, Gaithersburg, 2017. Interoperability in Smart Manufacturing: Research Challenges, Machines, Zeid, A. et al. 2019. https://www.researchgate.net/publication/332175465_Interoperability_in_Smart_Manufacturing_Research_Challenges "The Hallmark of Zero Trust is Simplicity," Wall Street Journal, CIO Journal, https://deloitte.wsj.com/cio/2021/04/07/john-kindervag-the-hallmark-of-zero-trust-is-simplicity/ Software-Defined Perimeter Specifications v2.0 Cloud Security Alliance, March 11, 2022, https://cloudsecurityalliance.org/research/working-groups/software-defined-perimeter-and-zerotrust/ Claroty Biannual ICS Risk Vulnerability Report 1H 2021, https://security.claroty.com/1H-vulnerability-report-2021 Learn the architecture: AArch64 Exception Model, ARM Developer, https://developer.arm.com/documentation/102412/0102/Execution-and-Security-states
29

#RSAC
Questions
@WilliamMalikTM

#RSAC
SESSION ID: ZT-M05
Bringing Zero Trust to Industrial Control Systems
William Malik
VP Infrastructure Strategies Trend Micro @WilliamMalikTM

