SESSION ID: CDS-R09
Debunking Myths About Attribution and New Strategies to Protect Your Data

Mike Kendzierski
Technologist/Hacker/Reseacher/Inventor Shoshn
@ShoshnLLC

#RSAC

#RSAC
Remember, what insight will we be
giving the audience

#RSAC
Fruit is harder to steal when it is not sold directly on the street
3

#RSAC
Why We Are Here
 Train like the hackers do  Learn their techniques  Get the same education  Application Whitelisting, file-based encryption  Be rigorous with your patching
4

#RSAC
Time for Honesty
 There is no quick fix  Hackers are better prepared, trained and more organized  We need to monitor everything  Attribution is a Team Sport!
5

Attribution is a Team Sport! Big Data

Vendor Management

Binary Metadata

Maltego

Open So#RuSrAceC Research

Static Analysis

Dynamic Analysis

Passive DNS

Development Signatures

Malware Categorization

6

#RSAC
We Need to Be Comfortable with Ambiguity
 Attribution is too large & complex for a single person  "Quality" attribution requires a team of experts and outside thinking  Attribution is a case study of "Hurry up and Wait"
7

#RSAC
Malware Kill Chain
 Hackers don't have super powers  The bad guys still have to acquire the ability to execute code on a
compromised system  And there are only so many ways to do this
 Email is your #1 danger (by a long shot)
8

#RSAC
We Need to Be Comfortable with Ambiguity
 We're never going to be at "100%" confidence  Are you comfortable with 75%?  How about 80% but it will take another six months?
9

#RSAC
~Typical Attribution Progress
3rd Party report published from Kaspersky | Mandiant | ESET
Working with other researchers

malware reuse? Whois / Maltego

Obfuscation ­ dead end!

Found strings in the analysis

Memory forensics

Malware metadata

Malware transforms

Identify the attack

10

How did they get in?

#RSAC
If we could have attribution right now, what would we do with it?
11

#RSAC
Attribution is Both an Art & Science
 We're never going to be at "100%" confidence  Attribution is about asking the "right" questions  Understanding that the evidence may be placed there to trick you  Obfuscation tools are there for a reason  Story ­ VB script to add junk instructions to further obfuscate
assembly code
12

#RSAC
What We Want
 We want the breadcrumbs (technical artifacts) that they leave behind in the form of software (malware binaries)
 The malware binaries contain metadata that we can use to data mine (either now or in the future when our tools work)
 Get the same education  Application Whitelisting, file-based encryption  Be rigorous with your patching
13

#RSAC
Attribution Unwinds Incrementally
14

#RSAC
Everything leaves a trail
15

#RSAC
Your data
16

#RSAC
Our Goals
 How do we get to a high enough confidence interval?  How long will it take?  What do we do with the data?
17

#RSAC
How do you prepare for an APT-like attack?
18

#RSAC
Insight
 Attribution is both an Art and Science  There is a lot you can do today to protect your data  Tools to make you "less vulnerable"  Need the "hacker mindset"  Become bigger than your problem & take action  No more fear, let's review the truth  How do you know what you are up against?
19

#RSAC
Attribution Myths

#RSAC
Myth #1 ­ Attribution is Hard
 Easy to Learn, Lifetime to Master  All of the tools are available  If you can read ASCII, you can do attribution  Remove the fear  The learning curve is not as bad as you think
21

#RSAC
Attribution is Easy?
 Yes and No.  There are several steps  It all starts with logging and understand the vulnerabilities  Everyone makes mistakes (over the long haul)  Big Data your friend  Focus on the process, not the end result
22

#RSAC
Myth #2 ­ You know who is stealing your data
 Malware tools use some sort of obfuscation techniques  90% of the attribution claims are circumstantial  How do they know?  What tools are they using?  Obfuscation, obfuscation, obfuscation  You know it when you see it
23

#RSAC
Myth #3 ­ You Can Rely on Your Vendors
 Start pushing back on your vendors  How can you test in an intergrated environment?  At a macro level, it's not a bad place to start  Throwing money at the problem only creates more problems  You are better off working with your partners or competitors  Share, Share, Share!
24

#RSAC
Myth #4 ­Attribution Doesn't Matter
 To better defend the perimeter, we need to know what their tools are
 Improves our ability to disrupt the attack and know what they are after
 It does matter, regardless if you can't do anything about it
25

#RSAC
So how do you know that?
 Longitudinal studies  Everyone makes mistakes  Big Data  Malware repositories  Share Threat Information among the security community  Volume, volume, volume!
26

#RSAC
Myth #5 ­ Attribution is Science
 Attribution is both Art & Science  And experience and intuition  Correlation does not imply causation  Today's Stuxnet is tomorrow's Shamoon...  While there are methodologies, each one is unique  Stay flexible, work with the smartest people you can find
27

#RSAC
We need a framework
 For attribution, there are many frameworks to analyze the malware killchain
 You will need a large team and it won't happen overnight  Big Data can help make the process easier (in the future)
28

#RSAC
Myth #6 ­ IP Theft Primarily Exists in Asia
 Completely wrong!  IP theft has been around as long as people could steal  The United States stole most of the technology from the British to
launch the industrial revolution  When an innovation economy has IP worth protecting, expect
more IP right enforcement  The opportunity cost to stop the theft is just not there
29

#RSAC
Software, not infrastructure
 Focus on what is in the pipe, not the pipe itself  Because attacks are normally tied to the perimeter, most
companies focus on the "infrastructure"  The more "sophisticated attacks" are done at the software layer  Hackers have a step up due to their "learning agility" and
experience
30

#RSAC
Protecting Your Data

#RSAC
Blended Analysis
 Information from all sources
 Passive DNS, malware families, vendor reviews, VirusTotal  Every data point has value  Tying the attacks to one another
 Changing the Mindset
 This is not a quick fix  Longitudinal study on your enterprise
32

#RSAC
Identifying the Attack
 At the perimeter
 Firewalls  H/IDS, N/IDS
 Internally
 Data Loss Prevention agents
33

#RSAC
Big Data
 Collect everything ­ log analysis, wire analysis  Malware binary repositories to query
34

#RSAC
Apply Slide
 Bullet point here (see slides 5 - 8 for instructions)  Bullet point here  Bullet point here
35

#RSAC
Analyzing the Malware
 Automated Analysis  Sandboxes, VirusTotal, What files it creates in the file system  Cuckoo
 Static Analysis  Strings, Project Executable Objects
 Manual Behavor  Sniffers  ProcMon, ProcExp,
 Manual Dissembly / Debugging  Deobfuscation
36

#RSAC
Let's Talk Attribution
 Compiling information
37

#RSAC
Environmentally Aware Malware
 Anti-analysis techniques?
 88% of malware includes Anti-reverse Engineering mechanisms  Qual  Passing along to the RE teams
 81% include anti-virtualization techniques  43% include anti-debugger techniques  Anti-Sandboxing
 Throwing money at the problem only creates more problems  You are better off working with your partners or competitors
38

#RSAC
Anti-Debugging
 Tracking the program as it runs  Is ICE running? (SoftIce)  API-based ­ IsDebuggerPresent  Flags based  Timing based ­ Is the program slowing down?  Exeception Based  Breakpoint Detection
39

#RSAC
Reversing the issue
 Let's pretend we actually know who is behind the attacks
40

#RSAC
You still need to...
 Have a data classification policy  Physically segment your most sensitive data
 "Air gapped"
 Have an auditing/logging/alert policy  Know your partners upstream and downstream dependencies
(weaknesses)  Hire hackers
41

#RSAC
Applying Your New Knowledge
 Hire Hackers!  Get the "Hacker Education"  Learn Assembly!  Share Threat Intelligence  Collect Everything
42

#RSAC
Taking Action ­ Protecting Your Data
 Maltego  Start your own data repository (Intro to Big Data)  File-based Encryption  Application Whitelisting  Data Classification Policy  Air Gap / Physically segment your most sensitive data  Don't rely on just your software / dashboards
43

#RSAC
Thank you!

