#RSAC
SESSION ID: OST-R06
Atomic Red Team: Where Adversary Emulation and EDR Testing Meet
Adam Mashinchi
Director, Open Source Programs Red Canary Twitter: @Adam_Mashinchi

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
Presentation content created and owned by Red Canary.
2

#RSAC
Presentation Goals & Terms
The key takeaways in ~50 mins

#RSAC
Overview
· Specific takeaways:
­ gain an entry-level understanding of the project ­ use cases for red/blue/purple teams ­ differentiate techniques from tests ­ understand execution frameworks ­ execute a test ­ know how to learn more!
4

#RSAC
Overview: General Terminology
· MITRE: a not-for-profit organization (government) R&D · ATT&CK®: a grid of adversary tactics and techniques · adversary: the "who" performing malicious actions · technique: how adversaries achieve tactical goals · test: what command, script, or application is executed
5

#RSAC
Overview: The ATT&CK matrix
New Industry Standard & Common Language
Columns are "Tactics"
6

#RSAC
Overview: ATT&CK sub-techniques
The "Cells" in ATT&CK are "Techniques"
Parent/Child Relationship  Sub-Techniques
7

#RSAC
Overview: Atomic Red Team
Atomic Red TeamTM is a library of simple tests that any security team can execute to test their defenses. Tests are focused, have few dependencies, and are defined in a structured format that can be used by automation frameworks.
8

#RSAC
Who works on the (free) stuff?
Project Maintainers & Contributors  These are amazing people!!!
 "Thanks for everything you do!"  Great at small/iterative changes  Atomic tests are community developed & maintained
Shameless Plug:  These are amazing people!!!  If you contribute to Atomic Red Team, you get a t-shirt!  Learn more at atomicredteam.io!
9

#RSAC
A brief history of Atomic Red Team
When, where, and why we created the library

#RSAC
History: DerbyCon 2017
Presentation
"Blue Team Keeping Tempo with Offense" · endpoint > network telemetry · introduced "Atomic Testing"
­ small unit-tests for ATT&CK
11

#RSAC
History: A repository is born
GitHub Repository is created
· open source project · MIT licensed
­ TL;DR: "Anyone can use this for anything"
Original repository structure: · operating system 
­ list of ATT&CK tactics  · tests
12

#RSAC
History: Migration to YAML
April 2018
· scripts converted to YAML
­ ... YAML is a common data serialization language
· focus on techniques
13

#RSAC
Interlude
Businesses creating open source

#RSAC
Obligations & implications

Red Canary
· created Atomic Red Team · manages where the code lives · provides support
­ staffing ­ goods ­ financial

The Community
· writes the tests · "maintains" the code base
Other Vendors · can use freely · add to their software

15

#RSAC
Open Source Community
The maintainers team
· Community members
­ not all Red Canary staff!
· Oversee the project · Review/approve all additions · Assisted by Red Canary's Open
Source Programs Team
­ act as product/project managers ­ facilitates communications, etc.
16

#RSAC
Breaking down ...
... the (atomic) tests

#RSAC
Use cases for atomics (in InfoSec terms)
Red team (offense) · simulate a variety of diverse threat behaviors Blue team (defense) · tests for detections, signatures, and behaviors Purple team (joint exercises) · regression/unit test framework
18

#RSAC
T1124: System Time Discovery

System Time Discovery
"An adversary may gather the system time and/or time zone from a local or remote system."
The atomic test > powershell Get-Date

The How to execute this
Windows  cmd.exe  powershell Get-Date
Windows  powershell.exe  Get-Date
Linux/macOS  bash/zsh  date

19

#RSAC
Defining ATT&CK "coverage"
A (naive) approach to "breadth" coverage...  Atomic test for technique ID?  "Done!"  Breakdown by "all" and each platform But what about "depth"?  How well does a group of tests cover a technique?  How difficult is a test to execute?  What about "sub-platforms"?
 (i.e., IaaS vs. IaaS:AWS)
20

Coverage is non-trivial to map

#RSAC
· Even "counting" can be tricky to master
· Defining "platform"
­ easy to confuse ­ where test is running? ­ target of the test? ­ ... vs. Executor
21

#RSAC
Visualization is critical
· Heatmaps create instantly-understandable coverage documents
22

#RSAC
Coverage: Depth Analysis
· How "well coverage" is a given TID? · We know if...
­ we have test(s), how many, by platform
· But what if...
­ T9100 has 14 tests, but only 2 for Linux? ­ T9200 has 14 tests, but all are really tricky?
· And to further complicate things...
­ "System Time Discovery"  Easy? ­ "Network Sniffing"  Less-Easy? ­ "Cloud Storage Object Discovery"  ???
· Prerequisites & Paid Providers
23

#RSAC
Can Define a "Scale" of Difficulty

Copy/Paste Work?
Default Arguments?
Requires Elevation?

Has Prerequisites?
Need 2nd Machine?
Requires Credentials?

· Define a scale of "difficulty" · MUST BE:
­ Strictly defined ­ Human actionable
· Bonus Round:
­ Machine parsable ­ Test execution (not here yet)

24

#RSAC
Heatmaps for (Difficulty) Coverage
Indicator of where tests need to be added!
25

#RSAC
Execution frameworks
Actioning tests with "ease"

#RSAC
What & why
The problem · a large amount of tests · a need to execute them in bulk/often
The solution · execution frameworks
­ A program to assist with the execution of the atomic tests in a consistent manner
· automation
27

#RSAC
The Atomic Family

Invoke-AtomicRedTeam

AtomicTestHarnesses

· a PowerShell-based framework for developing and executing atomic tests

· a PowerShell module for executing variations of an attack technique

Chain-Reactor
· a tool for test detection and response coverage on Linux

28

#RSAC
Third-party frameworks
Vendors · breach and attack simulation (BAAS) · endpoint detection and response (EDR) Open source community · General use (i.e., "atomic-operator") · Specific use (i.e., "atomic confetti bomb")
29

#RSAC
A demonstration
See an atomic test in action

#RSAC
Choosing a technique
Common question: "Where should I start?" · many options of places to start · let's look at adversaries are doing The Threat Detection Report · Technique: Powershell · Usage: Encoding/Obfuscation
31

#RSAC
DEMONSTRATION
· Pick a technique · Find or create an atomic test · Copy & paste command
­ ... or use an Execution Framework
· See results on an endpoint · (Hopefully) see an alert
32

#RSAC
Apply what you have learned today!
· Next week you should:
­ See if you are doing any defense validation now ­ Evaluate your cyber security maturity
· In the next three months you should:
­ Try out validating your defenses & defenders ­ Select some threat-aligned techniques to test ­ Attempt some (manual) tests using Atomic Red Team
· Within six months you should:
­ Evaluate the use of automation ­ Review some breach & attack simulation/emulation options
33

#RSAC
Extra Credit: There's a (known) problem...

· How can you execute Atomics in-bulk if you...

­ Have no concept if the Atomic "succeeded" or "failed"

­ Cannot confirm you're generating the correct telemetry

· Example: System Time Discovery (T1124)

­ What does "success" look like for:

> date

­ An exit code? A string? What about not-US formats?

· The Atomic Red Team Maintainers are open to suggestions!

­ Specifications can grow and be modified

­ Projects need to adapt over time

34

#RSAC
Atomic Red Team is community driven
· Want to learn more?
­ Web: atomicredteam.io
· Care to contribute?
­ Github: github.com/redcanaryco/atomic-red-team
· Have Feedback?
­ Email: opensource@redcanary.com
35

#RSAC
Use AtomicRedTeam.io to explore Atomics!
36

#RSAC
Use AtomicRedTeam.io to explore coverage!
37

#RSAC
Don't just take my word for it...
· Anyone can be a contributor
­ New tests, fixes, typos, are welcome
­ You get free stuff! ­ New & Top Contributors listed in
monthly Atomic Newsletter
· Become part of the Slack community!
https://atomicredteam.io
38

#RSAC
Thank you!
(Time for Q&A?)

