SESSION ID: MASH-R09
Preventing an Enterprise Win10 Rollout Being Remotely Controlled and Ransomed

Murray Goldschmidt
Chief Operating Officer Sense of Security (a CyberCX Company) @ITsecurityAU

#RSAC

#RSAC
Concerned about this?
2

#RSAC
Enterprise Computer Rollout - Security
3

#RSAC

#RSAC

#RSAC
But not enough forward thinking ......
Expensive Programs  Live with your decisions Long time-in-deployment (years) Address Compliance Requirements Address Corporate Policies (Push Down, Local Enforcement) Support Field Upgrades Deliver Cyber Resilience Avoid Catastrophic Situations (Losing control of your entire fleet)
6

#RSAC
Coverage? Budget?
7

#RSAC
8

#RSAC
Explore the Options and Areas for Improvement
9

#RSAC
Explore the Options and Areas for Improvement
10

#RSAC
Explore the Options and Areas for Improvement
11

#RSAC
Explore the Options and Areas for Improvement
Hardening Reviews
12

#RSAC
STATIC DYNAMIC
13

#RSAC
Static Testing - Limitations
14

#RSAC
15

#RSAC
16

#RSAC
https://www.cyber.gov.au/publications/hardening-microsoft-windows-10-version-1709-workstations
17

#RSAC
18

#RSAC
19

#RSAC
20

#RSAC
Assessing Hardening - Problems
­ Generally where most SOE/Image tests start & end ­ Static assessments cost more than they are worth ­ Results in constraints of budget. Money spent in the wrong places ­ Done ineffectively through manual means ­ Scope ineffective (generally trying to match benchmark stds only) ­ Then cut out items in the "too hard basket" ­ Seldom cover broad ranges of controls
Full Disk Encryption (no excuse its built in!) App Whitelisting (its built in ­ but more complicated to get right) File Integrity Monitoring (much more accessible in Vuln Mgt)
21

#RSAC
Assessing Hardening ­ Increasing the Scope
­ Assess for seemingly benign configs that can be trojaned
­ Examples: PDF controls
· BADPDF: Stealing Windows Credentials via PDF Files ­ The fundamental issue has been fixed CVE-2018-4993 ­ Huge number of orgs remain susceptible to this (points to s/w supply chain issue)
Understanding Appref.MS Config Files
­ Windows 10 victim host - Fully patched with Windows Defender enabled ­ See http://i.blackhat.com/USA-19/Wednesday/us-19-Burke-ClickOnce-And-
Youre-In-When-Appref-Ms-Abuse-Is-Operating-As-Intended-wp.pdf ­ Points to S/W and Services Supply Chain Issues & Config Mgt Issues & Vuln
Mgt Issues
22

#RSAC
23

#RSAC
24

#RSAC
25

#RSAC
26

#RSAC
27

#RSAC
Scenario for Total Loss of Control of Computer Fleet
28

#RSAC
Assessing Hardening - Improvements
­ Still important, must be more effective. ­ Adopt Automation! ­ Strive towards Continuous Monitoring.
Hardening profiles change over time. You need to review WHAT you are checking for and UPDATE as the landscape changes Hardening is more than core OS hardening. Need to check for configuration of crypto/app whitelisting and configs that will cause problems @ run time (appref.ms) Hardening reviews are next to useless if performed once off
29

#RSAC
Assessing Hardening - Improvements
Summary ­Hardening Validation is part of Config/Vuln Mgt
should be ongoing operational activity ­ not capital expense. ­If hardening validation is BAU will represent a small portion of security budget for SOE/Rollout Programs ­Creates room for Dynamic Testing
30

#RSAC
Introducing Dynamic Testing
Root Cause of Problems: Configuration Mgt
31

#RSAC
Explore the Options and Areas for Improvement
32

#RSAC
Dynamic Testing Variants
Pre Boot Testing Post Boot Testing (Unauthenticated Isolated) Post Boot Testing (Unauthenticated Networked (WLAN/LAN) Post Boot Testing (Authenticated)
33

#RSAC
Pre Boot Security Testing
Looking to exploit issues in:
­ BIOS Config E.g. boot from alternative OS (USB etc)
­ Full Disk Encryption (FDE) Limitations of FDE relying on TPM only and no PIN
· Windows 10 users can update their BitLocker PINs and passwords themselves, without administrator credentials.
· But PIN is not the default.
· https://www.moderndeployment.com/require-startup-tpmpin-for-bitlocker-encryptionenterprise-security/
34

#RSAC
35

#RSAC
Network Unlock
· Network Unlock enables BitLocker-protected PCs to start automatically when connected to a wired corporate network on which Windows Deployment Services runs. ???????
· https://docs.microsoft.com/en-us/windows/security/information-protection/bitlocker/bitlocker-deviceencryption-overview-windows-10

#RSAC
Read the Fine Print ­ for the Countermeasures
https://docs.microsoft.com/en-us/windows/security/information-protection/bitlocker/bitlocker-countermeasures
37

#RSAC
Securing the Boot Process
Secure Boot, a component of Trusted Boot, is a security feature supported by Microsoft Windows 10 version 1709 and motherboards with an UEFI2
­ Relevant to new fleets of computers ­ Not so much for refresh of old fleets ­ This is why testing how different computers in the fleet may respond to
different attack scenarios is relevant.
­ https://docs.microsoft.com/en-us/windows/security/information-protection/secure-the-windows-10-boot-process
38

#RSAC
Because part of your fleet may be susceptible to bootkits and rootkits
Microsoft Windows 10 version 1709 and motherboards with an UEFI2
39

#RSAC
Explore the Options and Areas for Improvement
Post Boot (Unauthenticated, Isolated) Pre Boot
Hardening Reviews
40

#RSAC
Post Boot ­ Unauthenticated, Isolated
41

#RSAC
Post Boot ­ Unauthenticated, Isolated
Problems
­ Relying on OS Authentication Controls ­ Account Guessing/Brute Forcing
Local Accounts Domain Accounts (Cached) Therefore testing of the laptop on and off network is required.
Other components of the footprint are:
­ USB ­ Bluetooth ­ Ethernet ­ Any service that is operational on the OS and can be connected to if on the
network (e.g. remote desktop, SNMP or other protocols)
42

#RSAC
Post Boot ­ Unauthenticated, Isolated
Testing ­ Local Password Attacks ­ Wireless Stimulation ­ assisted with OSINT/SE (Credential Leakage) ­ Perform attacks against online device, when connected to client
premises/LAN ­ Perform attacks against online device, under normal use, i.e. as a remote
worker Improvements ­ Smart Card, Biometric Access Controls ­ for Auth ­ Effective Password Policies (Local and Domain, LAPS) ­ Peripherals Security ­ Run Once Protections/App Whitelisting
43

#RSAC
Explore the Options and Areas for Improvement

Post Boot (Unauthenticated, Isolated)

Post Boot (Authenticated, Networked)

Pre Boot

Hardening Reviews
44

#RSAC
Post Boot - Authenticated
Are you ready for some fun?
45

#RSAC
The General Corporate User Case ....
46

Enterprise Breach Assessment Break-Out Penetration Test

#RSAC

#RSAC
Unvalidated Controls
But we hired a security guard!
Risk correlation? Cumulative risk? Linear vs Interconnected Risks
48

#RSAC
Full Stack Security
Problems
­ Gateway Controls that allow malware inbound (email) ­ Gateway Controls that allow alternative paths for malware (email  web) ­ OS Controls that don't block execution (failed whitelisting) ­ End Point Controls that don't stop sleeper malware (appref.ms) ­ End Point Controls that don't stop malware! ­ Enterprise Controls that don't detect changes to OS's (Config Mgt)
Testing
­ Various scenarios to test breadth and depth of above
Improvements
­ As needed to defeat the attacks. This is the crux of the SOE/Golden Image philosophy
49

#RSAC
Catastrophe Scale
50

#RSAC
Catastrophe Scale
One isolated user affected One user infected, but issue is propagating over the network Loss of Integrity of Workstation Fleet, but operational Total loss of control of Workstation Fleet, not operational (encrypted, ransom) [sort of like Corona Virus situation now.....]
51

#RSAC
52

#RSAC
53

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Identify where your SOE/Rollout Security Strategy is
Already rolled out? Not too late.
· Gap assessment of the coverage of the testing vs what we learned today
Planning a rollout?
· Consider the assessments from all the angles.
Budgeting?
· Look at the Catastrophe scale and determine your risk appetite?
3rd Parties
· Identify the extent to which you rely on 3rd Parties to secure your deployments
54

#RSAC
Apply What You Have Learned Today
In the first three months following this presentation you should:
­ Develop & Execute Assessment Plan (all the methods described here) ­ Understand the relationship between configuration (static) and actual
operation (dynamic) ­ Build resilience into your OS's at all the layers ­ Automate hardening validation & Implement Continuous Monitoring to
identify Configuration Drift
55

#RSAC
Apply What You Have Learned Today
Within six months you should:
­ Improve the overall security of the OS and the ecosystem ­ Manage 3rd party risk ­ Implement Continuous Monitoring to identify sleeper malware ­ Run Time Security Testing: Enter Purple Teaming, SOC, NOC, Validation
Beyond:
­ Automate Testing to demonstrate current state without the need to conduct intensive manual tests
56

#RSAC
Questions
Murray Goldschmidt Chief Operating Officer murrayg@senseofsecurity.com.au Office: +61 2 9290 4444 Mob: +61 422 978 311
57

