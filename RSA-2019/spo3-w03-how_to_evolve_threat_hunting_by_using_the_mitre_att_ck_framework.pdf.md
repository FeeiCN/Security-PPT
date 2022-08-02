SESSION ID: SPO3-W03
How to Evolve Threat Hunting by Using the MITRE ATT&CK Framework

Jared Myers
Sr. Threat Researcher Carbon Black, Threat Analysis Unit @jmyers36

#RSAC

#RSAC
Agenda and whoami · Background of ATT&CK · Case Study of ATT&CK in action · MITRE ATT&CK Simulations · Advanced Threat Hunting

#RSAC
Feeding the Fire
Threat Hunting Objectives
­ Finding the unknown
­ While hunting for the characteristics and behaviors that are harder to automate you will continue to identify gaps
­ How well are we doing at detecting documented adversary behavior? -MITRE
­ And the cycle starts over again.
3

#RSAC
But they said to just do the ATT&CK...

ATT&CK Background

Quick ATT&CK Overview

Pre ATT&CK

Enterprise

#RSAC
Mobile

Tactic Tactic Tactic Tactic Tactic Tactic Tactic Tactic Tactic Tactic Tactic

Where ATT&CK Fits

Strategic Outcomes
Program Activities

Sub Activities

Sub-Sub-Activities I PDRR Information ­ Assets ­ Services ­ Individuals

7

#RSAC
Strategic Security Risk
Operational Security Risk

Where ATT&CK Fits

Devices Applications
Networks Data Users

Identify

Protect

Technology

Detect
ATT&CK

Respond

Recover

People

#RSAC

8

Where ATT&CK Fits

Strategic Outcomes
Program Activities

We are here

Sub Activities Sub-Sub-Activities

Information ­ Assets ­ Services ­ Individuals

9

#RSAC
Strategic Security Risk
Operational Security Risk

#RSAC
In perspective
MITRE ATT&CK is:
­ A common language that can be used to share intel based off of a standardized model
­ A useful tool for measurement an understanding your visibility and gaps
­ An approach to go beyond conventional IOCs
10

#RSAC
In perspective
MITRE ATT&CK is not:
­ ATT&CK by itself is not intended to be a checkbox of risk assessment
­ The evaluation put out are not a single axis but rather a way to understand the Vendor's philosophy for detection
­ Not all techniques are equal
11

#RSAC
In perspective
T1107 File Deletion
­ Malware, tools, or other non-native files dropped or created on a system by an adversary may leave traces behind as to what was done within a network and how. Adversaries may remove these files over the course of an intrusion to keep their footprint low or remove them at the end as part of the post-intrusion cleanup process.
12

Threat Hunting

#RSAC
Threat Hunting after you lay your foundation
Easy vs Hard Why is this different
­ You should be able to leverage your tools or products to detect high fidelity alerts which you identified previously.
­ Your threat hunting should focus on the things that are not so easily detectable.
14

#RSAC
Threat Hunting
Hunting for Threats or Gaps Same approach different goals Going Broader
­ Moving from specific Tactics or Techniques to emulation
­ Live Action or Pen Test
15

#RSAC
Use Cases, Building a POV
16

Case Study
ATT&CK in action

#RSAC
Use Cases, Start Small
Testing your production security controls Aid in evaluation of new controls Testing for results
­ Is this thing on? ­ Does the security operations system actually work?
18

#RSAC
LolBins, UAC Bypass, & Priv-Escs....Oh My
https://attack.mitre.org/wiki/Technique/T1191
· Adversary's are adapting tradecraft to less known execution techniques. · What is this CMSTP binary and why is it making network connections?
Is the binary signed? Does the binary ship in EVERY version of modern windows? Can the binary execute remote payloads? Does the binary allow auto-elevation of process execution?
19

UAC Bypass and LOLBins
· Let's get familiar with the MITRE Wiki for T1191
"Use process monitoring to detect and analyze the execution and arguments of CMSTP.exe. Compare recent invocations of CMSTP.exe with prior history of known good arguments and loaded files to determine anomalous and potentially adversarial activity."
· How many times has this binary executed? · Are there leading indicators of something malicious?
- Making network connections? - Spawning child processes out of temp directories, command-interps, etc? - Child processes spawned from dllhost cmstp COM object?
20

#RSAC

#RSAC
How often is cmstp executed

cmstp.exe

chrome.exe
21

#RSAC
What are the most common parents
22

#RSAC
Leveraging Unit Testing Internally
You don't have to be a red teaming expert to test your security controls
23

#RSAC
Automating Testing
24

Questions ?
@jmyers36 jmyers@carbonblack.com

