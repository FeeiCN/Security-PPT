© 2018 SPLUNK INC.
Simulating the Adversary to Test Your Splunk Security Analytics
Dave Herrald ­ Staff Security Strategist, Splunk Kyle Champlin ­ Product Manager, Splunk Tim Frazier ­ Sales Engineer, Splunk
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Introductions

© 2018 SPLUNK INC.

Tim Frazier
Senior Sales Engineer

Dave Herrald
Staff Security Strategist

Kyle Champlain
Product Manager

© 2018 SPLUNK INC.

whois tim.frazier
Christian, Husband, Father, Geek

 Electrical Engineering, Army Comms + Cisco Networking background

 12+ years in Network & Security Operations in DoD and Electricity Sector industries Engineered, installed, configured & managed SOC toolsets and infrastructure

 Built Python Scripts to automate repetitive security operations/administration tasks ­ integrated with the APIs for Vuln Mgmt, Intelligent Taps, and IP Mgmt Tools

 Father of 3 as of Sep 10th

 Joined Phantom in Jan 2017, now part of Splunk since Apr 2018
 CISSP and GICSP certifications

# whoami > Dave Herrald
CISSP, GIAC G*, GSE #79

© 2018 SPLUNK INC.

Staff Security Strategist
@daveherrald

- 25+ years IT and security - Information security
officer, security architect, pen tester, consultant, SE, system/network engineer - Former SANS Mentor
- Co-creator of Splunk Boss of the SOC

Adversary Simulation

© 2018 SPLUNK INC.
1. Simulating the adversary is important
2. You can automate adversary simulation
· Using Splunk, Phantom, and open
frameworks like MITRE ATT&CKTMand Atomic Red Team
3. Use adversary to simulation to check for
blind spots, test your detections, and create new ones
4. This is just the beginning. You can start
with what we've created and contribute!

© 2018 SPLUNK INC.
Simulating the Adversary
Why It's Important

Why Simulate the Adversary?
The basics...

© 2018 SPLUNK INC.

Insider Threat

Organized Crime

Nation State

Data and Assets

Why Simulate the Adversary?
We add controls to frustrate our adversary

Insider Threat

Organized Crime

Nation State

Physical Controls
Perimeter Defense
Endpoint Protection

Log Collection/ Analysis
Machine Learning

SIEM

Network Monitoring

Human Analysts

Identity and Access Mgmt.

Intrusion Prevention

© 2018 SPLUNK INC.
Data and Assets

Why Simulate the Adversary?
But they often still succeed

Insider Threat

Organized Crime

Nation State

Physical Controls
Perimeter Defense
Endpoint Protection

Log Collection/ Analysis
Machine Learning

SIEM

Network Monitoring

Human Analysts

Identity and Access Mgmt.

Intrusion Prevention

© 2018 SPLUNK INC.
Data and Assets

Why Simulate the Adversary?
Toward a Threat Centric Approach

Insider Threat

Organized Crime

Nation State

Physical Controls

SIEM

Network

Log

Monitoring

How to CSoillmectuionla/ te the Adversary Analysis

Perimeter Defense

Human Analysts

Endpoint Protection

Machine Learning

Identity and Access Mgmt.

Intrusion Prevention

© 2018 SPLUNK INC.
Data and Assets

Why Simulate the Adversary?
Toward a Threat Centric Approach

© 2018 SPLUNK INC.

Physical Controls

SIEM

Insider Threat

Organized Crime

Nation State

Network

Log

Monitoring

How to CSoillmectuionla/ te the Adversary Analysis

Perimeter Defense

Human Analysts

Data and Assets

Machine

Intrusion

Learning

Prevention

This talk is about automating the process of enumerating, emulating, and reliably

identifying

the

techniques

aEnnddpoitnat ctics
Protection

commoIdneAncltciyteysasundsed Mgmt.

by

our

adversaries.

© 2018 SPLUNK INC.
Three Models / Frameworks To Know Before You Start
Use them to prioritize the use of your limited detection resources
 Lockheed Martin Kill Chain · Most cyber attacks unfold across a common set of phases · Which phases represent the best return on your detection investment · Go to the source:
https://www.lockheedmartin.com/content/dam/lockheed-martin/rms/documents/cyber/LM-White-Paper-Intel-Driven-Defense.pdf
 MITRE ATT&CKTM Framework · Adversarial Tactics, Techniques, and Common Knowledge (ATT&CKTM) · "A curated knowledge base and model for cyber adversary behavior" · Complements and extends the concepts of the Kill Chain · Go to the source: https://attack.mitre.org/wiki/Introduction_and_Overview
 Diamond Model For Intrusion Analysis · Cognitive framework for analyzing adversaries · Focus on adversary, victim, capabilities, and infrastructure · Allows for pivoting, organizing intelligence analysis, and uncovering other hidden
relationships
· Go to the source: http://www.activeresponse.org/wp-content/uploads/2013/07/diamond.pdf

© 2018 SPLUNK INC.

Why Not Just Pen Test and Red Team?
TL;DR: For the same reason we automate anything!

Automated Adversary Simulation
Pros  Consistent and repeatable  Test after changes (regression)  Easy to measure and metricize  Easy to share  Relatively low cost  Can get a wide distribution across
known techniques Cons  Difficult to simulate a sentient human
adversary

Pen Test / Red Team
Pros
 Best simulation of a real attacker · Will combine techniques in difficult to
predict ways
 High-end testers can bring new techniques, or clever variations
Cons
 Pen testers are only human, they can and do get stuck in ruts
 Only as good as your next change request
 Relatively high cost

© 2018 SPLUNK INC.

Why Not Just Pen Test and Red Team?
TL;DR: For the same reason we automate anything!

Automated Adversary Simulation
Pros  Consistent and repeatable  Test after changes (regression)  Easy to measure and metricize  Easy to share  Relatively low cost  Can get a wide distribution across
known techniques Cons  Difficult to simulate a sentient human
adversary

Pen Test / Red Team
Pros
 Best simulation of a real attacker · Will combine techniques in difficult to
predict ways
 High-end testers can bring new techniques, or clever variations
Cons
 Pen testers are only human, they can and do get stuck in ruts
 Only as good as your next change request
 Relatively high cost

Can the Robots Just Do It?

© 2018 SPLUNK INC.

Can the Robots Just Do It?
MITRE is trying to find out...

© 2018 SPLUNK INC.

https://github.com/mitre/caldera

So...Why?

© 2018 SPLUNK INC.

1. Confirm efficacy of controls and detections 2. Regression testing: what worked yesterday...still works today 3. Don't miss a detection for a technique/tactic that is widely known to
the community 4. Identify detection blind-spots 5. Confirm vendor claims. "We detect that"... "Ok show me!"

© 2018 SPLUNK INC.
How to Simulate the Adversary
Using Splunk, Phantom, MITRE ATT&CKTM, and Atomic Red Team

A Closer Look at MITRE ATT&CKTM

© 2018 SPLUNK INC.

Technique T1060

© 2018 SPLUNK INC.

A Closer Look at Atomic Red Team

© 2018 SPLUNK INC.

https://www.redcanary.com/atomic-red-team

Casey Smith @subTee

A Closer Look at Atomic Red Team

© 2018 SPLUNK INC.

https://www.redcanary.com/atomic-red-team

Casey Smith @subTee

A Closer Look at Atomic Red Team

© 2018 SPLUNK INC.

https://www.redcanary.com/atomic-red-team

Casey Smith @subTee

A Closer Look at Atomic Red Team

© 2018 SPLUNK INC.

https://www.redcanary.com/atomic-red-team

Casey Smith @subTee

Our Approach

© 2018 SPLUNK INC.

Splunk

ATT&CK Navigator

Simulation Runner

Splunk Security Analytics

Phantom
Atomic Red Team App
Implements ATR in Phantom
Adversary Simulation Playbook
Executes Atomic Red Team detection tests

ES CONTENT UPDATE

Windows OSX

Linux

Splunk UF

Splunk UF

Splunk UF

Splunk ATT&CK Navigator App
Easy to use interface for selecting techniques and tactics
 Integrated Directly in Splunk · https://github.com/daveherrald/SA-
attck_nav
 ATT&CK Navigator Project · https://github.com/mitre/attack-navigator
 Overlays can provide visual feedback for tests that have passed/failed
 Right-click menu is customizable via "config"

© 2018 SPLUNK INC.

Splunk Simulation Runner App

© 2018 SPLUNK INC.

 Once you select a test from the ATT&CK Navigator app, it fills in the test information in this app
 Select a target host/asset, initiate the test, and see the results
 https://github.com/daveherrald/SA-advsim

Phantom as the Automation Engine
Playbooks, Actions and Apps ­ Oh My!
 Use Visual Playbook Editor to build and document workflow · Customize Python in native IDE for extra tweaking
 Use Phantom's app framework and existing apps to speed up the process

© 2018 SPLUNK INC.

 Desiring to re-use existing pieces and automate as much as possible:
· Leveraged Microsoft's Windows Remote Management to remotely execute the tests on an
endpoint
· Built a new Phantom app to pull in Red Canary's Atomic Red Team tests · Using RC's ART avoids storing/building another repository of discrete tests

If you don't already have Phantom ­ go to https://www.phantom.us/download to get the free community edition!

© 2018 SPLUNK INC.
WinRM app for Phantom
Windows Remote Management ­ built by Microsoft
 Microsoft Windows Remote Management service · Easy Powershell execution on any Windows endpoint running the WinRM service · Microsoft built, documented and useful for sysadmin tasks · We used WinRM as our delivery mechanism to: · Generate marker events before and after tests · Execute actual tests (both PowerShell and cmd.exe execution on Windows endpoints)
· Don't forget that WinRM itself could be used as an adversary tool...
Just Google "winrm quickconfig" to get going... https://docs.microsoft.com/en-us/windows/desktop/winrm/installation-and-configuration-for-windowsremote-management

Atomic Red Team app for Phantom
Provides the execution commands to run on an endpoint
 Red Canary maintains a great list of tests in their Atomic Red Team project · This Phantom app we wrote allows us to leverage their repo (or a fork of it) · Pulls in commands from their YAML-ized formats using the corresponding ATT&CK test ID · This app handles variable substitution so the result is an OS-ready to execute command · Can also get "payloads" for tests requiring files · In order to set it up ­ all you need is the URL for the ART repo to use (master or your fork) · https://github.com/daveherrald/ART_Phantom
Summary of Actions supported by ART app for Phantom:

© 2018 SPLUNK INC.

Phantom Modular Simulation Playbook
Don't worry... we will walk through this step by step.

© 2018 SPLUNK INC.

Phantom Modular Simulation Playbook
At the Start and the End, we post "Bracketing" events into Splunk
 Format and Post a start event and an end event directly into Splunk
· Good for seeing the
beginning and end of a test from Splunk's perspective
· If we don't have matching
events at the start and end, there was likely an error or unexpected condition during playbook execution
· Could be modified to post
additional information about the test

© 2018 SPLUNK INC.

Phantom Modular Simulation Playbook
OS Decision Point in the Playbook

© 2018 SPLUNK INC.

 This Decision block looks for an "os" in the artifact sent from Splunk
· This determines the path to go
forward
· Currently, our playbook executes
Windows tests
· Mac and Linux paths on top and
bottom of the playbook still marked TODO

© 2018 SPLUNK INC.
Phantom Modular Simulation Playbook
For Windows only, we run commands on the endpoint to further bracket the test
 Now that we are in the "Windows" test path · We Format and Run a command on the windows endpoint using Windows Remote Management
(WinRM) that we call the "Start" and "End" markers
· These events should be picked up by Sysmon in the Event log · One more step for "Bracketing" the Windows/Sysmon events that are actually part of our test

Phantom Modular Simulation Playbook
Then we pull the actual executable test from Atomic Red Team Repo
 Next, we use the newly written ART app for Phantom to "format command"
· This pulls the specified
command from the ART repo defined in Phantom
· It uses the MITRE
ATT&CK test ID from the event sent over from Splunk to pull the right test
· We also filter out certain
file dependent tests that we don't want to run

© 2018 SPLUNK INC.

Phantom Modular Simulation Playbook
Here we run the test itself using Windows Remote Management
 Once we have the command formatted, we check to see which shell to run it in
· We can run the
command in PowerShell or in cmd.exe environment
· We can also run a user
supplied command if we don't want to use an ART test
· Then we run the actual
test on the endpoint with WinRM

© 2018 SPLUNK INC.

Phantom Modular Simulation Playbook
The entire playbook once again:

© 2018 SPLUNK INC.

https://github.com/daveherrald/AdvSim

Windows Target System

© 2018 SPLUNK INC.

 Windows Server 2016  Configured for WinRM  Microsoft Sysmon
https://docs.microsoft.com/en-us/sysinternals/downloads/sysmon
 SwiftOnSecurity Sysmon Config
https://github.com/SwiftOnSecurity/sysmon-config
 Splunk Universal Forwarder

Demo Time
Let's see this in action

© 2018 SPLUNK INC.

 We are going to run test T1060 ­ Registry Run Keys
· This is a persistence mechanism that adds a new registry key to the "RunOnce" item that is
called upon Windows start up

 We'll show the Splunk interfaces and the Sysmon events that result from it. We can also show the Phantom interface for the evidence of the test run

© 2018 SPLUNK INC.
Use Cases?
Finding blind spots, testing your detections, and creating new ones.

© 2018 SPLUNK INC.
Identifying Blind Spots
Making Unknown Unknowns into Known Unknowns
 Running tests give you a real way to know if you are capable of detecting that specific adversary behavior / TTP
 Use the ATT&CK Matrix to identify specific adversary TTPs
 Identify high signal-noise tests that can easily be simulated and automated · Such as the Atomic Red Team tests from Red Canary
 Start running the tests and determining your known gaps ­ what you know that you cannot detect
 Then prioritize what you want to be able to detect and how you can get there

© 2018 SPLUNK INC.
How to get started

Getting Started

© 2018 SPLUNK INC.

 MITRESpAluTnTk &CK Navigator in a Splunk DashPbhoaanrtodm

https://github.com/daveherrald/SA-attck_nav

 SimulaAtTioTn&CRKunnerSiAmpulpatifoonr Splunk

Atomic Red Team App
Implements ATR in Phantom

https://gNitahvuibga.ctoorm/davReuhnenrerar ld/SA-advsim
Adversary Simulation Playbook
 Adversary Simulation Playbook for Phantom Executes Atomic Red Team detection tests Splunk Security Analytics

https://github.com/daveherrald/AdvSim

 Atomic Red Team App for Phantom

https://github.com/daveherrald/ART_Phantom
ES CONTENT UPDATE

Windows OSX

Linux

Splunk UF

Splunk UF

Splunk UF

© 2018 SPLUNK INC.

1. Simulating the adversary is important

How'd we do?

2. You can automate adversary simulation
using, Splunk, Phantom, and open frameworks like MITRE ATT&CK
3. Adversary simulation to check for blind
spots, test your detections, and create new ones

4. This is just the beginning. You can start
with what we've created, and contribute!
Don't forget to rate this session in the .conf18 mobile app!

© 2018 SPLUNK INC.
Questions
Dave Herrald | @daveherrald Kyle Champlin | @
Tim Frazier | @timfrazier1

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

