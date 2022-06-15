Making Memories: Using Memory Analysis for Faster Response to User Investigations
Aaron Sparling, Portland Police Bureau Jessica Hyde, Magnet Forensics / George Mason

Making Memories

MANY KNOW TO USE MEMORY FOR IR INVESTIGATIONS

VALUE TO USE IN END USER INVESTIGATIONS

What do you think of for
user investigations

Drugs CSAM Money Laundering Fraud ID Theft Weapons Trafficking Homicide / Assault

So you're an Incident
Responder.... I know about
memory

But are you using memory on -
· HR violations / Usage Policy Violations · IP theft · Insider Trading · Wrongful Termination · Workplace Harassment · Insider Threat

Why memory forensics

Numerous Artifacts reside in memory:

Network artifacts

URL's

Passwords

Decrypted Data

Caches

Clipboard Data

Encryption Keys

Event Logs

IP Addresses

Chat

Internet artifacts/activity,

Prefetch

.lnk files

MFT

Registry

USB

Carved Audio

Carved Video

Carved Pictures

Google Searches

Why Memory

Numerous Artifacts reside in memory
Memory Analysis can drive the investigation (pointers) actionable intel As memory increase in size, memory is becoming much more like a second file system (less to page out)
Fast - Image time - work while processing
Recent and Relevant data
Can be performed on laptop (minimal hardware requirements)
Validate against the image AFTER critical actions taken

Fast
· Actionable Intel · Drive your investigation
questions

Memory vs Drive Acquisition

Laptop Computer 100GB HDD 4GB RAM

Physical Memory Acquisition + pagefile.sys (0:08:09)
Hard Drive Acquisition
0:49:46 (1.9 GB/min)

Memory Analysis
Pagefile.sys/hiberfil.sys Analysis
Hard drive Analysis (E01)

RAM
Collection

Money Maker Case
Evidence

You have been tasked with investigating an individual who is suspected of identity theft and credit card fraud.

Money Maker Case Evidence

FORENSIC IMAGE (E01) DELL LAPTOP COMPUTER

MEMORY DUMP
DELL LAPTOP (TAKEN ON LOCATION)

FORENSIC IMAGE (E01) USB FLASH DRIVE

Money Maker Case Task

Analyze raw memory dump and memory-resident files from disk
(pagefile.sys and hiberfil.sys)

Profile users' activities, uncover data, locate passwords, decrypt encrypted volumes and locate indicators for further
filesystem analysis.

TRADITIONAL FORENSIC APPROACH / METHODOLOGY
·Digital evidence items collected on location and delivered to the lab for analysis. ·Disk imaging and processing done in a controlled lab environment ·Process image ·Analyze contents

Think DFIRently!

Process Capture

RAM Capture

Analysis during disk imaging

What if 8 min is too
long?

Consent can be revoked

Process Capture

https://www.magnetforensics. com/magnet-process-capture/

Acquisition in about 20 seconds

Parsing under 10 min

Still great data source

Inform the
interview questions

User Attribution Timelining Passwords Not my Pants Use of encryption External devices

REGISTRY ANALYSIS

Locating Registry Hives in Memory

MemProcFS.exe

Mounted memory

Registry > by-hive

User Account Names

Locating the "CurrentControlSet"

Enumerating USB devices from Memory

Navigating to USBSTOR

Registry Hives Dumped From Memory

USB Detective

USB Detective

RegRipper

User Assist

Recent Docs

MFT ­ Master File Table Analysis

Parsing MFT

Locating resident data in MFT

MFT ­ Resident DATA

$STD_INFO & $FILE_NAME

User Artifacts
· User Processes · Browser history · Prefetch

pslist

Processes by Name

MemProcFS verbose tree

Process analysis

Executable process analysis

Executable process analysis

Analyzing user processes

Chrome search terms

Netstat verbose - connections

prefetch

Password Cracking
Access USER credentials

User LM & NTLM password hashes

hashdump plugin

Using NTLM hash to get password

bulk_extractor

hashdump + bulk_extractor + wordlist

Bulk extractor + wordlist

hashdump

wordlist

hashcat

hashcat + NTLM.TXT + wordlist_split

hashcat

IMAGE MOUNTING
Analysis of Mounted Encrypted E01(USB)

Mounted USB ­ FS not recognized

Custom VeraCrypt plugin

Mounting + VeraCrypt + password

Mounted USB ­ FS recognized!

We found it!

Keeping up with
memory?

Take a class!
· Malware and Memory Forensics Training (Volatility) https://www.memoryanalysis.net
· /memory-forensics-training SANS FOR526: Advanced Memory Forensics & Threat Detection https://www.sans.org/course/me
· mory-forensics-in-depth Magnet Forensics AX250: Advanced Forensics https://www.magnetforensics.co m/digital-forensicstraining/magnet-axiom-advancedcomputer-forensics/

Aaron Sparling Alissa Torres Andrew Case Jamie Levy Michael Ligh (MHL) Richard Davis Volatility

@OSINTlabworks @sibertor @attrc @gleeda @iMHLv2 @davisrichardg @volatility
Twitter

Questions ?
AARON SPARLING JESSICA HYDE

@OSINTLabworks @B1N2H3X

