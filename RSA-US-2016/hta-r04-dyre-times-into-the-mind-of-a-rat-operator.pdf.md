SESSION ID: HTA-R04
Dyre Times: Into the Mind of a RAT operator

#RSAC

Note: the deck contains sensitive cyber intelligence findings related to the behavior of cybercrime operators. No photos please. Censored copy is available upon request.

Uri Rivner
Head of Cyber Strategy BioCatch @UriRivner uri.rivner@biocatch.com
Sam Curry
Chief Technology & Security Officer Arbor Networks @samjcurry scurry@arbor.net

#RSAC
A Dyre Agenda
Famous RATs: a bit of historic perspective Dyre: a security researcher's darling Into the mind of a Dyre operator Dyre vs. Dridex and other RATs RAT trends: Social, Mobile Summary
2

#RSAC
Dyre update!

Latest news

From Arbor

In November, Russian authorities raided offices of Moscow film company "25th Floor" Reuters: 3 sources claimed this was part of Dyre crackdown operation Other research orgs corroborating link:
Symantec (11/18/15) no new spam campaigns pushing Dyreza were noted Upatre (primary downloader for Dyreza) compromises are significantly down in the wake of the raid: Kaspersky supposedly aided in the takedown There was a presentation about it (Tango with Dyreza) by Peter Kruse of CSIS Security Group

Mcorral data supports this as well, New Dyreza configs processed
Count
70 60 50 40 30 20 10
0

3

#RSAC
Famous RATs: a bit of historic perspective

#RSAC
What are RATs, really?
Remote Access Trojan? Remote Administration Tool?
VNC / RDP / Remote Helpdesk
Scratch all that ­ think of a helpdesk taking over your PC scenario The benign uses of RATs The not so benign uses...

#RSAC
Famous APTs. See anything in common?

Attack

Targets

Ghostnet
2009
Aurora
2010
Night Dragon
2011
Shady RAT
2011
RSA Attack
2011

Ministries, Embassies
34 companies: Google, Adobe, defense, internet, financial Critical infrastructure Dozens of US mega-corporations RSA (as a security provider)

Malware Used
RAT
RAT

Going After
Sensitive documents Intellectual property

RAT

Intellectual

property

RAT

Intellectual

property

RAT Sensitive Security

data

#RSAC
Famous Trojans. See anything in common?

#RSAC
A Trojan without RAT is useless
8

#RSAC
Banking Trojans: A New Generation
Attack MO Defense Line

Harvesting Phishing
Basic Trojans

Device Behavior Device recognition Geo Location analysis

MITB Automated transfers HTML Manipulation

Malware Behavior Client-side detection Server-side baiting

RAT OS-level Remote Access

Human Behavior Interaction Analysis

#RSAC
Dyre: the most dangerous Banking Trojan...

#RSAC
... And, just between us ­ A security researcher's little darling

General Trends
Fraudsters are countering security controls in a race to ring 0 Need to look "normal" means leveraging existing processes and protocols (blend in) Divergent evolution of common base anatomy
Fraud / Crime: high in the stack, RitB, application land APT / Agenda: whole and low stack
Adaptive Evolution of Dyre* (incremental, practical improvement)
Responding to researchers Selective pressure: profit and effect
12

#RSAC

#RSAC
A word on naming!
A rose by any other name... Infostealer.Dyre Variant.Dyreza Win32/Dyzap Win32/Battdil
13

Dyre: a (security researcher's) little darling...

#RSAC

1/2

Better C&C

Better Kernel Techniques

Dyreza is also more patient about phoning home After 7 minutes, successful phone home has usually occurred DIF config update and not large batch config update Use of I2P hidden servers for C&C ­ making them robust against discovery and take-down Hard coded IPs, (can make some features less adaptive) making sinkholing C&C difficult Infostealing config and CnCs hostname/ports found in cleartext

Requires sandboxing the malcode longer - up to 8 minutes Sandboxing session terminates before Dyreza phones home Lack of CreateRemoteThread() causes sandboxes to lose track Sandbox kernel-mode driver thinks all tainted processes have terminated Code to prevent running on a single CPU machine Uses different technique than NQ for injecting into processes

14

Dyre: a (security researcher's) little darling...

#RSAC

2/2

Better Local Processes and Tools Adaptive analysis needed...

Usually DLL injected into svchost.exe acts as "master" DLLs injected into browser(s) acts as "slave" Master/slave communications performed via pipes Master performs phone homes to CnC to obtain infostealing config

We hook hook many of theWinInet APIs that Dyreza's master uses to communicate with the C&C,including InternetReadFile, which allows us to intercept the HTTPS commsafter SSL decryption has occurred
We dump memory of (first) svchost.exe and explorer.exe processes
We hook NtTerminateProcess() of dropper and suspend it

15

#RSAC
Dyreza Memdumps (scvhost.exe), 1/2
16

#RSAC
Dyreza Memdumps (scvhost.exe), 2/2
17

#RSAC
Into the mind of a Dyre operator

Behavioral Biometrics:

#RSAC

Measuring hand-eye coordination

Top: Mouse movement of a user (3 separate sessions)

Bottom: fraudster operating within that user's account

A Mysterious Fraud Case coming from user device

#RSAC

Top 25 US Retail bank

Jan 10

Jan 6

Into the mind of a Dyre Operator

#RSAC

Top 5 UK retail bank

Phase 1: Preparing for the Act

Into the mind of a Dyre Operator

#RSAC

Top 5 UK retail bank

Phase 2: RAT in the Browser attack

2 weeks later ­ a payment

RAT access using VNC
Detection is possible in two ways: userfocused (user behaves very
differently), and threat-focused (RAT signs in the interaction stream)

#RSAC
RAT Race: Dyre vs. Dridex and other RATs

#RSAC
Dyre and Dyreza...related?
Dyreza (aka Dyre) is a different malware family to Dridex, although they do have some similarities:
Both are banking trojans; Both have been successful as platforms for financial fraud; Both are good at exfiltrating data from the infected hosts; Both appear to be run by well-disciplined, experienced bad guys; Both use encryption for command & control comms; Both are organized into different "campaigns"; Both are adaptive and have evolved relatively rapidly; Nevertheless, they are not the same malware, nor are they "related" in the sense that one is a descendent/variant of the other.
24

#RSAC
Or are they...?
Additionally, we are not aware of any evidence that the operators/authors of the two malware families have any overlap though we don't really spend much, if any, resources on attribution, so we can't be very authoritative about that.* This tweet suggests a connection btw Dyreza and Dridex although it is terminated with a question mark... Is the slide hinting at a C2 overlap?
25

#RSAC
Dyre: #1 Banking Trojan
Source: IBM X-Force, Jan 2016

Dridex

#RSAC

Top 5 UK corporate bank

Regular user

Dridex

#RSAC

Top 5 UK Corporate Bank

Dridex operator

Since Jan 2016: clone

site Dyre style

28

Dridex

#RSAC

Top 5 UK Corporate Bank

VNC Back Connect

#RSAC
RAT trends: Social, Mobile

The Helpdesk

#RSAC

Top 5 UK Wealth Management Bank

31

The Helpdesk

#RSAC

Top 5 UK Wealth Management Bank

First 2 minutes: legitimate login

Next 34 minutes: RAT access

New Trend: Social RAT (Team Viewer)

#RSAC

Top 5 UK Wealth Management Bank

Nov 30th Session

Average RAT fraud: $26,000 Average time in account: 31m

Dec 9th Session

33

#RSAC
When RATs hit your Mobile Device

#RSAC
Summary: Year of the RAT

#RSAC
Apply Slide

Summary This is a new-old enemy ­ don't underestimate it Much of the "kit" is 20 years old, the solution is new...treat it as a new threat Dyre, like Zeus, is a game changer because it neutralizes the contemporary anti-fraud controls and forces the banks to look into a whole new data set to detect it Dridex is the most dangerous RAT right now The team is adaptive and resilient, surviving disruption It heralds what's coming, especially in new media (mobile, IoT)

3 months from today you should...
Solve the advanced threat problem - j/k ;-)
Start evaluating different (free, open source and commercial) threat intelligence feeds. Some of the Dyre, Dridex preparatory phase ­ the social engineering part ­ is currently detectable
Look into analyzing user interactions and behaviors. It's a new data domain that can level the field
Consider long term strategies for winning an adaptive race, especially on new platforms

Next week you should...
Think about campaigns that target you
Set up some Google to track NeverQuest, Dyre(za), Dridex
Consider your mobile security policies vs. the risks. Is it still safe to trust the device?

36

