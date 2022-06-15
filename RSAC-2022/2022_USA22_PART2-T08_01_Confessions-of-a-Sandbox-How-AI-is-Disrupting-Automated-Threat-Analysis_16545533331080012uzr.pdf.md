#RSAC

SESSION ID:PART2-T08
Confessions of a Sandbox: How AI is Disrupting Automated Threat Analysis

Marian Radu
Senior Director, Data Science CrowdStrike @radu_marian

Liviu Arsene
Director of Threat Research and Reporting CrowdStrike @liviuarsene

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented.
Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.

Presenter's Company

Logo ­ replace or

delete on master slide

2

#RSAC
Agenda
· Automated threat analysis · Advanced threats and bypassing techniques · The power of machine learning · Takeaways

Presenter's Company

Logo ­ replace or

delete on master slide

3

#RSAC
Automated Threat Analysis

#RSAC
Automated Threat Analysis
The Sandbox:
A sandbox is a closed system that enables security professionals to watch the malware in action without the risk of letting it infect their system or escape into the enterprise network.
· Mimics an end-user operating environment · Prevents accidental exposure to potential threats

Presenter's Company

Logo ­ replace or

delete on master slide

5

Automated Threat Analysis
The Tools

· Static analysis tools · Network monitoring tools · Process monitoring tools · Debbuggers

· System level API hooks · Machine learning · YARA rules · Etc.

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
6

Automated Threat Analysis

The Automation

Monitor changes to guest OS

Find sample

Presenter's Company Logo ­ replace or
delete on master slide

Use debugger

Start monitoring
tools (network and
processes)

Upload to sandbox

#RSAC
7

#RSAC
Bypass Techniques Used by Advanced Threats

#RSAC
Top 10 Malware Families Based on Hybrid Analysis Submissions

Presenter's Company

Logo ­ replace or

delete on master slide

9

#RSAC
Bypass Techniques Used by Advanced Threats
Masquerading (T1036)
· Manipulating features of their artifacts to make them appear legitimate or benign to users and/or security tools · Secondary payloads that use (mis)spelling of common filenames · Using lolbins (certutil, bitsadmin, etc.)
Software Packing (T1027)
· Used for compressing or encrypting an executable · Decompressing code in memory (e.g. URLs unpacked in memory)
Lateral Tool Transfer (T1570)
· Transfering tools or other files between systems in a compromised environment · Network connections to URLs to download and drop additional payloads, such as bitsadmin to download files

Presenter's Company

Logo ­ replace or

delete on master slide

10

#RSAC
The Power of Machine Learning
Disrupting Automated Threat Analysis

#RSAC
Disrupting Traditional Automated Threat Analysis
· Fast and reliable scanning results for:
­ binaries ­ memory dumps ­ URLs
· Comprehensive detonation report for IOCs

Presenter's Company

Logo ­ replace or

delete on master slide

12

#RSAC
The Power of Machine Learning
Masquerading technique impersonating a legitimate binary

Presenter's Company

Logo ­ replace or

delete on master slide

13

#RSAC
The Power of Machine Learning
Masquerading and Lolbin techniques used to drop additional tools

Presenter's Company

Logo ­ replace or

delete on master slide

14

The Power of Machine Learning
Memory dump analysis using CrowdStrike AI
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
15

The Power of Machine Learning
Memory dump analysis using CrowdStrike AI

Data Collection

Feature Extraction

Model Training

Memory Dumps
Pre-trained Embeddings
Presenter's Company Logo ­ replace or
delete on master slide

Opportunistic instruction decoding

Signals hand picked by experts

Transfer Learning

#RSAC
Prediction
Memory Dumps from
Sandbox Detonations
16

The Power of Machine Learning
Network activity analysis using CrowdStrike AI
Applying CrowdStrike AI to URLS extracted from: · Extracted Strings section · Network analysis section · Submitted URLs (submitted by users for analysis)
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
17

The Power of Machine Learning
URLs analysis using CrowdStrike AI

Data Collection

Model Training

URLs Dataset

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Prediction
URLs accessed during Sandbox
Detonations
18

#RSAC
The Power of Machine Learning
Performance Optimizations
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
The Power of Machine Learning
Attack Surface Reduction
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Video Demo

#RSAC
Disrupting Traditional Automated Threat Analysis
· Publicly available free tool for researchers and analysts community

· Supports URLs, Windows 7 32/64 bit, Linux, and Android static analysis

· QuickScan
­ Machine learning static analysis ­ Processes over 700K files daily

Presenter's Company Logo ­ replace or
delete on master slide

· Detonation report generator and post detonation actions
­ "Heuristic" Sandbox Threat Score ­ Behavioral signatures (hooks, handles, mutant, network, registry, binary,
certificate, api, etc.) ­ Machine Learning for memory analysis, ransomware, and URLs ­ YARA processing ­ Network PCAP files ­ Screenshots ­ MITRE ATT&CK mapping ­ Process tree ­ Dropped files ­ etc.
22

How do Researchers Feel About It?

"...what Hybrid has, what others haven't, is the reporting and the ease of which I can get samples out of it. From a pure IOC point of view, that's where Hybrid really stands up." - Mike, Security Architect
"The bit that I liked about hybrid, particularly was being able to YARA research on things and that's really good," - Nick, Security Architect
"With hybrid analysis everything was simple, I went into the documentation, I took my API key, I took the client from GitHub and I cloned it. Everything just works, no problem..." - John, Engineer
"And that is awesome that I can go in there and download samples. I absolutely love that," - Steve, IT Administrator

Presenter's Company Logo ­ replace or
delete on master slide

"All of the samples we've sent through have given us the MITRE attack labels that we need" - Joe, Test Engineer

#RSAC
23

#RSAC
Takeaways

#RSAC
Takeaways
· Traditional automated threat analysis is more about IOCs than malicious assessment
· Advanced threats use sophisticated tactics to bypass traditional automated threat analysis tools
· Machine learning augments automated threat analysis, offering quick assessment and deep insights into malicious behaviour
· In the end, Machine Learning disrupts automated threat analysis by increasing its efficacy: easier, faster, more accurate ... and free.

Presenter's Company

Logo ­ replace or

delete on master slide

25

SESSION ID:PART2-T08
Thank You

Confessions of a Sandbox: How AI is Disrupting Automated Threat Analysis

Marian Radu
Senior Director, Data Science CrowdStrike @radu_marian

Liviu Arsene
Director of Threat Research and Reporting CrowdStrike @liviuarsene

#RSAC

#RSAC
Backup Slides
MITRE ATT&CK Technique Detection and Mapping

Presenter's Company

Logo ­ replace or

delete on master slide

27

Backup Slides
User tags
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
28

Backup Slides
Suricata alerts
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
29

Backup Slides
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
30

