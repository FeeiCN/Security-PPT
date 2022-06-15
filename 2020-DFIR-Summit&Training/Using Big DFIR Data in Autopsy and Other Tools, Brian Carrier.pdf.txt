Using Big DFIR Data in Autopsy and Other Tools
Brian Carrier Basis Technology
SANS 2020 DFIR Summit
Copyright © Basis Technology 2020

It's All About Efficiency
 We think about how to make examiners more efficient.  Examples:
 Automatically flag things previously tagged as notable  Prioritizing how files are displayed (not just by folder or alphabetical)  Giving context about an item (how and where it was used)
 All of these use data you might be "throwing away".  We're going to talk about "re-using" your data.
Copyright © Basis Technology 2020

It's All About History
Those who cannot remember the artifacts they saw before are condemned to analyze them again
Carrier - 2020
Copyright © Basis Technology 2020

It's All About History
Those who cannot remember the artifacts they saw before are condemned to analyze them again
Carrier - 2020 Those who cannot remember the past are condemned to repeat it
George Santayana - 1905
Copyright © Basis Technology 2020

The Past is Important
 So much of what we do is based on the past.  We are trained to do things based on what was seen in the past.  Our tools parse data that we useful before in past cases  The NIST NSRL contains hashes of files that someone in the past processed  Hash sets of child exploitation material are from past cases  IOCs are from past cases  Topic-based keywords (drug terms, etc.) are based on past experience.  ....
 A lot of digital investigations is about applying past knowledge to the current case.
Copyright © Basis Technology 2020

Problem: Scaling
 It's hard to remember all past notable things.  It's even harder to know what your colleagues saw
 We've found it's also important to remember the boring things.  There is A LOT of boring stuff
Copyright © Basis Technology 2020

Solution
 Make your tools do the remembering.  Save as much data as you can.
 Let's look at how we've done this in:
 Autopsy: Local Repository  Cyber Triage: Remote Global Repository
Copyright © Basis Technology 2020

Autopsy

What is Autopsy?
· Open source digital forensics platform. · Designed to be:
o Easy to use o Extensible with open plug-in frameworks
· Supports hard drives, media cards, and smart phone formats.
· Has all of the standard features, plus some unique features.
Copyright © Basis Technology 2020

Copyright © BJausnise T2e02c0hnology 2020

Features
Standard · Hash calculation and lookup · Indexed keyword search · Registry analysis · Web artifacts · Email · Carving · .....

Unique · Multi-user collaborative cases · Automatically analyze data 24x7 · Analysis-driven acquisition · Triage · Timeline · Communications · .....

Copyright © Basis Technology 2020

Autopsy's Short-term Memory
 Data is compartmentalized by case to keep data sets small.  Each case has its own:
 Folder  Database (SQLite or PostgreSQL)  Solr index  .....
 You can (statically) import past knowledge with:
 Hash sets  Keyword lists  Interesting item rules (file name rules)
Copyright © Basis Technology 2020

Autopsy's Long-term Memory
 The Central Repository spans cases and is dynamically updated.  Can be single-user (SQLite) or multi-user (PostgreSQL)
 It stores:
 Identifiers from past cases:
 Hashes, Emails, USB Device IDs, Wifi SSID, ICCID, Domains, etc.
 Comments  Tags
 First released in 2017 and now enabled by default
Copyright © Basis Technology 2020

Architecture
Copyright © Basis Technology 2020

How It Is Updated
The Central Repository ingest module saves hash values and identifiers during ingest (previously called "Correlation Engine")
Copyright © Basis Technology 2020

How It Is Updated (2)
When you tag an item, the entry in the Central Repository is updated.
Copyright © Basis Technology 2020

How It Is Used: Remembering Notability
 Automatically flag files that were marked as "Notable" in a past case
 A dynamic hash set
Copyright © Basis Technology 2020

How It Is Used: Past Occurrences (table)
· Show how often a file was seen in the past
o The `O' column is for Occurance
Copyright © Basis Technology 2020

How It Is Used: Past Occurrences (viewer)
Show how often a file was seen in the past and where.
Copyright © Basis Technology 2020

New Use: Ranking
 We've been focusing on showing the most relevant files first.  General theory:
 If you saw a file 10 times before and didn't think it was relevant, it's probably not relevant the 11th time either.
 A file you've seen 50 times before is less relevant than a file you've seen 5 times before.
 ....
 The Central Repository data allowed us to implement this and deprioritize the boring stuff.
Copyright © Basis Technology 2020

New UI: File Discovery
 A new search UI in Autopsy.  Goal is to allow user to define what they are looking for
 NOTE: This is an incrementally evolving feature that changes each quarter
 User picks:
 Features they care about  How they want to see the results
 The Central Repository allows the user to search or display by past occurrence.
Copyright © Basis Technology 2020

File Discovery: Example Queries for Pictures
 Show all unique or rare pictures that are big. Organized by parent folder.
 i.e. Focus on possibly user created images. Organized by how the owner organized them.
 Show all big pictures. Organize by frequency to focus on unique files first.
 I.e. Focus on all high res pictures (including ones from past cases), but focus first on unique ones.
 ....
Copyright © Basis Technology 2020

File Discovery: Pick Type and Criteria
Copyright © Basis Technology 2020

File Discovery: Pick Display Options
 Results are grouped to make it easier to organize:  You can pick the order the groups are displayed:
Copyright © Basis Technology 2020

Example Picture Results, Grouped By Size
Copyright © Basis Technology 2020

Cyber Triage
(Global Repository)

Central Repository is YOUR History
 The Autopsy Central Repository knows only what you've put into it.  That's good and bad.  Bad:
 You haven't seen everything before  May take a while to build up enough data
 Good:
 Something is better than nothing  Many labs are offline and can't access a global repository
Copyright © Basis Technology 2020

What is Cyber Triage?
 Automated intrusion forensics tool.  Hyper-focused on intrusion-related artifacts.
 Not general purpose like Autopsy
 Collects select artifacts from a live system.
 Start up, program run, web artifacts, WMI actions, logins, network, etc.
 Automatically scores the artifacts as bad or suspicious.
 User reviews high threat items and dives in.
Copyright © Basis Technology 2020

What is Cyber Triage
Copyright © Basis Technology 2020

Cyber Triage's Memory
 Similar concepts as Autopsy
 Databases for storing artifacts.  Remembers your past scores / tags, comments, etc.
 When you look at an artifact, it will tell you:
 Other past cases it was seen in  If it was flagged as "Bad" in the past.
 Helps you to determine:
 Is this artifact unique to this system and possibly part of the attack?  Other systems that could be compromised  .....
Copyright © Basis Technology 2020

Past Frequency
 Each row shows if it was seen before and if it was marked as bad.
Copyright © Basis Technology 2020

But, I Want More Data
 Finding outliers (unique instances) is critical in incident response.
 Unique processes or startup items should be reviewed.
 Sometimes your past cases aren't enough
 You may not do many investigations  No one has seen everything
 Wouldn't it be useful to know how common or rare something is amongst others in the industry?
Copyright © Basis Technology 2020

Global Repository For File Hashes
 Cyber Triage is building up a global repository for frequency analysis.
 Cyber Triage has an online file reputation service:
 Identifies a file as good or bad  Backed by 40+ malware scanning engines at ReversingLabs
 It stores anonymous data about hash frequency  It will soon provide global frequency results:
 Unique, rare, common, etc.
Copyright © Basis Technology 2020

Architecture
Copyright © Basis Technology 2020

Global Repository for Other Artifacts
 It will expand beyond file hashes (start up items, processes, etc. )  We'll be defining anonymized "hash" functions for other data types.
 Possible Example
 Type: Startup Item  Normalize the path and hash the string  Path: C:\Users\jdoe\AppData\Local\Temp\BLAH.EXE  Hash: SHA256(\users\REMOVED\appdata\local\temp\blah.exe)
Copyright © Basis Technology 2020

Coming Soon: Autopsy Can Use Global Repository
Copyright © Basis Technology 2020

Summary
 Saving your data is key to solving your future big data problems.  Relevance and ranking are a big part of the data overload problem.
 Don't throw away your data - reuse it.
Those who cannot remember the artifacts they saw before are condemned to analyze them again
Carrier - 2020
Copyright © Basis Technology 2020

OSDFCon
· 1-day event dedicated to open source software.
o October 21, 2020
· It will be virtual this year · Agenda is still being figured out · Topics typically include incident response, memory forensics,
Correlation, and more · Free for US Government employees.
http://www.osdfcon.org/
Copyright © Basis Technology 2020

Online Training
 Autopsy: There is an 8-hour training available online.
 http://training.autopsy.com  100K people enrolled during our free COVID offering!  Free for US Law Enforcement
 Cyber Triage:
 A free 3-hour "Intro to DFIR" training is coming next month.  An 8-hour hands-on training is coming in the Fall.
Copyright © Basis Technology 2020

Downloads and Contact
Free Download

Free Evaluation

www.autopsy.com

www.cybertriage.com

Brian Carrier brianc <at> basistech <dot> com Connect on LinkedIn or Twitter

Copyright © Basis Technology 2020

