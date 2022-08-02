THE RANSOMWARE ODYSSEY:
Their Relevance and
Their Kryptonite

Before We Begin

IR Daily Attention Arbitrage

A New Wave of Attacks
Infected victims send out scans looking for other windows PC's on the local network, propagating the worm.
The exploit WannaCry uses were created by the NSA [SMB Vuln], a patch was released by Microsoft
The AES key is encrypted using infection specific public key generated, the Master Key is needed to decrypt the file, currently only the public part has been analysis
WannaCry tries to load an infection specific public key "00000000.pky" if it doesn't exist, WannaCry uses"CryptoGenKey" to create a keypair
Double Pulsar/Eternal Blue reportedly developed by NSA, leaked by Shadowbrokers and exploited by Wannacry 2 months later. RCE type issues need expedited patch processes.

The Game is Changing

Downloadable Ransomware
· https://github.com/mauri870/ransomware · https://github.com/goliate/hidden-tear · https://github.com/roothaxor/Ransom · https://github.com/bitdust/WamaCry

Ransomware Evolution

·Cryptowall ·CBT locker ·Cryptographic Locker
2014

2015
·TorrentLocker. ·BandarChor. ·New family Teslacrypt ·RaaS :
·TOX. ·Fakben ·Radamant ·Chimera

·Locky ·Zepto
·Keranger (1st targeting OS X) ·Cerber ·Petya (Super ransomware)* ·SAMAS ·Maktub (nicely graphic design) ·Jigsaw
2016

2017
·Philadelphia ·Cerber ·Wannacry ·Spora ·Sage

Image 1. Ransomware evolution from 2014 to 2016 Own design for training Purposes

Attack vectors
Phishing emails
Web based attacks
· Drive by downloads /Exploits Kits (malvertising)
· Jboss (Samas), wordpress, Joomla

I got an email from Nigeria?

Cerber
· Subject "21735 Ssuitemangun"

Processes in the background

· Zip file contains "js" file

· Loads
· wscript.exe,schtasks.exe
· svchost.exe
· taskeng.exe
· Temporal file "iy0sz7tth.exe"

Location
· Under C:\Users\USERID\AppData\Local\Temp
· Later on we see taskeng.exe making reference to the temp file

All files encrypted

· Payment:

Captcha???

hxxp://p27dokhpz2n7nvgr.onion

/7A25-8009-CEE7-0091-C5C7

Here comes the nightmare!

1 day later...

Behind the scenes snfE021.tmp
· Temporary file call: snfE021.tmp

Malicious domain
· DGA domain hxxp://sedwrfaawsa4.xyz/search. php

Behind the scenes yv4msi53p.exe

Dependency walker

Angler
Crypwall
Cryptesla Crilock
· Ottawa Hospital

Exploits Kits

Rig

Neutrino

Crypwall

Crypwall

Cryptesla

Cryptesla

Waltrix

Crypctb

Cerber

Crypshed

Locky

Locky

Nuclear
Crypwall Cryptesla
Cerber

Sundown EK "Eltest Campaign"
ElTest script from compromised website Sundown EK Cerber

Activa Clinics

PCAP traffic

Ransomware Variants

Normal

·Petya/misha (MFT)

File less ransomware

·Power-shell (powerware)

RaaS

·Stampado ·Philadelphia ·Commodity
ransomware ·Spora

Philadelphia or Stampado

Tall, dark and ransom

Wannacry

Philadelphia

SAMAS

AMOUNTS DEMANDED BY RANSOMWARE PERPETRATORS IN USA
30%

22% 20%

11%

12%

3%

3%

Up to $500

$501 to $1000

$1001 to $5000

$5001 to $10 000 $10 001 to $50 000

$50 000 to $150 000

Greater than $150 000

Hasta la vista, Ransomware!

Filter attachment
Back up!

Block macros

Email protection

Disable WSH

Email sandboxing

Proxy Gateway

Latch ARW.

Can we ever win the fight against ransomware?

Ransomware Voldy

INFOSEC around the world

Truth must be told....
...we are all out of jobs without them.

Threat Intelligence for Ransomware

What Are We Up Against?

Jigsaw
· Deletes files periodically until ransom is paid
· Demands $150 in BTC
· Can potentially be purchased on dark web

KillDisk
· Linux Variant
· Demands that user pays 222 bitcoin
· Does not store decryption keys (bye bye data)

What Are We Up Against?

What's Under The Hood?
· Encryption Functions
· Searches for file extensions · Leveraging open encryption standards · %UserProfile%\AppData\Roaming\System32Work\EncryptedFileList.txt
· Persistence Functions
· Add registry key · HKCU\Software\Microsoft\Windows\CurrentVersion\Run\firefox.exe
%UserProfile%\AppData\Roaming\Frfx\firefox.exe · Add to autorun list · Delete 1k files of encrypted files on startup

What Are We Up Against?

Jigsaw
· Demands $150 in BTC
· Deletes files periodically until ransom is paid
· Can potentially be purchased on dark web

KillDisk
· Windows and Linux Variant
· Demands that user pays 222 bitcoin
· Does not store decryption keys (bye bye data)

What Are We Up Against?

What's Under The Hood? (Linux variant)
· Encryption Functions
· Recursively traverses the root directory up to 17 subdirectories deep · Files encrypted using Triple-DES · Encrypts each file with a unique set of encryption keys
· Persistence Functions
· Overwrites bootloader entry · GRUB displays ransom message

Ransomware Kill Chain
Executable Delivery Executable Installation C2 Key Exchange File Encryption Ransom

Collect, Detect, Respond
Logs

Threat Intelligence
Feeds

Threat Intelligence
Platform

Analytical Engine

Network Devices and Appliances
Incident Response Ticketing System
Incident Response Produced Intelligence

Collect, Detect, Respond
· Ingest open source feeds and ensure all data types are being collected · Leverage existing security architecture to feed existing threat intel
platform and analytical processes · Create custom analytics to make intelligence actionable · Incident response playbooks that cover feeding intelligence back into
platform

Collect, Detect, Respond
Logs

Threat Intelligence
Feeds

Threat Intelligence
Platform

Analytical Engine

Network Devices and Appliances
Incident Response Ticketing System
Incident Response Produced Intelligence

Rating Your Threat Intel Feeds

Collect, Detect, Respond
Logs

Threat Intelligence
Feeds

Threat Intelligence
Platform

Analytical Engine

Network Devices and Appliances
Incident Response Ticketing System
Incident Response Produced Intelligence

To Build or Not To Build

Collect, Detect, Respond
Logs

Threat Intelligence
Feeds

Threat Intelligence
Platform

Analytical Engine

Network Devices and Appliances
Incident Response Ticketing System
Incident Response Produced Intelligence

Analytic Engine
Logs IOCs
Analyst Feedback
Alert

Creating Analytics
· Email:
· Blacklist To/From sender and IP Address · Total IOC score from all threat sources weighted on confidence from each source
· Network Communications:
· Blacklist Network IOCs · Total IOC score from all threat sources weighted on confidence from each source · Anomalous HTTP/DNS Detection (Payload size, Frequency Extraction, DGA)
· Endpoint
· Blacklist File Extensions · YARA · Rapid attempts to create, modify, and access files

Collect, Detect, Respond
Logs

Threat Intelligence
Feeds

Threat Intelligence
Platform

Analytical Engine

Network Devices and Appliances
Incident Response Ticketing System
Incident Response Produced Intelligence

Creating Playbooks
· Determine Ransomware Infection
· If device is infected, is it ransomware?
· Investigate Infection Delivery
· Email, exploit kit, ect.. · Search for other malicious artifacts
· Scope Incident
· Identify malicious binary · Identify encrypted or ransomed files
· Protect against it
· UPDATE SOFTWARE · Blocking IOCs · Tuning Analytics · Security training
· Recover
· Verify that infection has not spread or remains · Restore from backup if possible

Aftermath

Jan 2017

Motivation Behind These Attacks

Scanning for Misconfigurations!

MongoDB Documentation (Defcon 21 -> Ming Chow)

Recon

2015

2017

Recon

Recon

Think & Act As If You're The Attacker

My Mindset When Investigating!
def attacker (): print("Who, What, Where, Why & How")
attacker()

Know Your Hackers and Groups Expand Your Network

Profiling The Attackers Mindset
· You must understand the people that will go after your Company · What do they want: · IP? · User Data? · Money? · Bragging Rights? · Ask yourself if I was an attacker what would I go after, How would I break
into the environment. · Offensive thinking is the best Defense ­ A lot of the times products are not
rolled out properly!

Going After the MongoDB

Finding The Right Service

I didn't see that coming

Building a scanner

Fast

Just Use Shodan
product:"MongoDB" country:"ru"

The One Question?

Holding The Data Hostage

Harak1r1

Search for MongoDB ransacking Google Docs

Big Thanks

Any questions?

