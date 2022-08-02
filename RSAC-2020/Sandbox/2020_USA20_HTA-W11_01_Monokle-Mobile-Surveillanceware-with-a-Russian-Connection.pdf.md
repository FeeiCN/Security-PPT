SESSION ID: HTA-W11
Monokle
Mobile Surveillanceware with a Russian Connection

Adam Bauer
Senior Staff Security Intelligence Engineer, Lookout adam.bauer@lookout.com

Apurva Kumar
Staff Security Intelligence Engineer, Lookout apurva.kumar@lookout.com Twitter: @abby_kcs

#RSAC

#RSAC
Monokle
· Overview · Malware Characteristics · Targeting · Special Technology Center (STC) · Relation to STC's mobile product suite · Conclusion
2

#RSAC
Overview

#RSAC
Monokle
· Professionally developed piece of mobile surveillanceware · Likely produced for government customers · Android and perhaps iOS as well · Developed by the STC
5

#RSAC
Special Technology Center (STC)
Special Technology Center (STC) is a Russian defense contractor sanctioned by the U.S. Government in connection to alleged interference in the 2016 US presidential elections. STC is developing both offensive and defensive Android security software. Lookout has found strong links that tie STC's Android software development operations to Monokle's IOCs
6

#RSAC
Detected Installations

#RSAC
Surveillanceware Prevalence

#RSAC
Malware Characteristics

#RSAC
"Monokle-Agent"

#RSAC
Observed samples
11

#RSAC
Dates when Monokle samples were signed
12

#RSAC
Targets
Individuals that are: · Interested in Islam · Interested in or associated with the Ahrar al-Sham
militant group in Syria · Living in or associated with the Caucasus regions of
Eastern Europe · Interested in a messaging application called
"UzbekChat"
13

#RSAC
Detected Installations

#RSAC
Malicious Functionality
15

#RSAC
Malicious Functionality
Extensive data exfil capabilities:  SMS  Email  Contacts  Recordings  Social media and office app data  Location tracking  Browser history  Keylogging
16

#RSAC
Android APIs
17

#RSAC
Direct App Database Access
18

#RSAC
Screen Unlock Recording

#RSAC
Screen Unlock Recording

#RSAC
Trusted Certificate Install

#RSAC
Hooking using Xposed
· Capable of hooking itself to appear invisible to Process Manager.
· Requires root privileges
22

#RSAC
Accessibility Service Usage

#RSAC
User-defined words for predictive text input

#RSAC
C2 Communication (Outbound TCP)

#RSAC
C2 Communication (SMS)

#RSAC
Thrift - Defining Interfaces

#RSAC
Thrift - Generating Code

#RSAC
Evidence of iOS components - GetKeychain/SetKeychain

#RSAC
Evidence of iOS components - GetHealthKit

#RSAC
Evidence of iOS components - ApnsRegistration

#RSAC
Special Technology Center (STC)

#RSAC
https://www.treasury.gov/resource-center/sanctions/Programs/Documents/cyber2_eo.pdf https://www.treasury.gov/resource-center/sanctions/OFAC-Enforcement/Pages/20161229.aspx
33

#RSAC

#RSAC

#RSAC

#RSAC
Overlap in signing certificates for Monokle and STC's APKs
37

Overlap in signing certificates with an STC employee's #RSAC personal Android project
38

#RSAC
39

#RSAC
Android Software Development Projects by STC

#RSAC

#RSAC

#RSAC
Job Postings
43

#RSAC

#RSAC
Summary
· Monokle is a targeted surveillanceware · Monokle has unique capabilities that allow it to
function well under a variety of conditions · Monokle is a surveillance built for sale to
governments · Developed by STC
45

#RSAC
Conclusion

#RSAC
Remediation and Forensic Options
No logging in most samples C2 traffic will use TLS encryption with certificate pinning Consider all data on device potentially compromised Possibility to analyze email commands if traffic was captured
47

#RSAC
Indicators of Compromise
Monokle continues to be an active threat as of today Lookout released more than 80 indicators of compromise (IOC): · 57 SHA-128 hashes and 1 YARA rule for Android malware IOCs · 22 domains and IP addresses · Four Russian mobile phone numbers used as attacker control
phones for Monokle
48

#RSAC
Mobile Surveillanceware Trends
· Functionality without rooting
· Use of good encryption techniques and certificate pinning and increased awareness of network traffic forensic techniques
· Number of surveillanceware tools available is only increasing
49

SESSION ID: HTA-W11
Thank you!
Questions?

Adam Bauer
Senior Staff Security Intelligence Engineer, Lookout adam.bauer@lookout.com

Apurva Kumar
Staff Security Intelligence Engineer, Lookout apurva.kumar@lookout.com Twitter: @abby_kcs

#RSAC

