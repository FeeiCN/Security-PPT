SESSION ID: CEM-W06
Next Generation Endpoint Security ­ Confused?
#RSAC

Greg Day
VP & Chief Security Officer, EMEA Palo Alto Networks @GreDaySecurity

#RSAC
Brief Intro

#RSAC
Questions we will answer
Do I need a new (NG) endpoint security capability? What are the different between traditional and NG?
What are the techniques available?
How do I evaluate which is best for me? What does the the future endpoint security stack look like?
What factors should I consider?
3

#RSAC
Is the endpoint actually failing?

#RSAC
What simulated this debate: Evolution!

TeslaCrypt ransomware:

#RSAC

splicing together new attacks

Taken from Crypto locker
Obfuscation from Carberp
2013 ­ source code posted on Russian Forum And mimics CryptoWAlaslol leverages dynamic library & function loading

SAMSA (aka SAMAS, MOKOPONI)

#RSAC

Ransomware & targeted (APT techniques)

· Targeted attack + ransomware · Over $70k in BTC payments to attackers · Entry point to network (targeted)
· network mapped for victims · SamSa deployed
· Smaller demands per-PC infection, larger per-company · 2 interesting payments of 40 BTC, Feb 3rd and 5th

#RSAC
Traditional endpoint security

#RSAC
Traditional Endpoint

#RSAC
Anti-Virus ­ Not just signatures
· Leveraging the Cloud
· McAfee Artemis (faster patterns) GTI · Symantec Insight (file reputation) GIN
· Heuristics/Generic Detection
· Generic detection ­ malware family based pattern · Pattern match for threat attribute
· Symantec Sonar ­ updated and customizable heuristics
· In memory process scanning (Where no files written to disk)

Other traditional approaches:

#RSAC

Application control/System lockdown/HIDS/FW

· Common techniques based around · Pattern match for known exploits (IDS/IPS)
· McAfee Buffer Overflow protection
· System lockdown (whitelist/backlisting)
· Communications, Applications, File integrity · Account based & IR response policies
· Microsoft Application protection

· The Good, Bad and Ugly · Tuning, tuning, tuning...
· Manual or snapshot · Only as strong as the levels of lockdown
· Lightweight, No Updates, just versions updates

#RSAC
Summary
Traditional techniques
Block known bads (sigs) Exploit detection (IDS/IPS) Black & White listing Behavioral bad characteristics
12 | © 2015, Palo
Alto Networks.

#RSAC
NG endpoint techniques
13

#RSAC
Static analysis

Can be more than just MD5 signatures
Balancing signatures against performance?
Everything versus what in the wild Need to link to unknown detection capabilities...

Static Analysis
File Anomaly Detection
Static Signatures
String & Code Block Detection Machine Learning & Static Analysis

14

#RSAC
NG: Machine Learning
Looking at the building blocks of an attack Typically done on machine Requires current knowledge of how attacks are functioning Typically deterministic scoring
Been used in SPAM engines for years
15

#RSAC
NG: behavioral analysis techniques

Replacement for heuristics/anomaly detection tools
Buffer Overflow = Buffer Overflow x1000 variations Exploit techniques, rather than anomaly detection Compromise techniques, rather than blocking registry & file

Individual Attacks
1,000s
Software Vulnerability Exploits
Thousands of new vulnerabilities and exploits
1,000,000s
Malware
Millions of new malware variations 16

Core Techniques
2-4
Exploitation Techniques
Only two to four new exploit techniques
~10s
Malware Techniques
Tens of new malware sub-techniques

#RSAC
NG: Statistical/mathmatical analysis
Commonly used for Detection & Forensic analysis
Often used in conjunction with behavioral detection techniques Anomaly detection (scope will influence accuracy)
Accuracy often leverages additional techniques, to prevent
Big data lookups (DNS, File ­ VirusTotal, etc..) Reverse heuristics (can be looking to validate known good)
Forensics (value depends on what data you pass to it)
The scale and scope of data it can analysis Real time, historic (how far: back 24-48hrs, longer?)
Time taken to gather the results (computing power to process data volumes)
17

#RSAC
NG: Self discovery - Sandboxing
Provides Emulation to see the real behavior Validation of what happens, see's whole attack Allows broad gathering of IOC data Requires CPU power to deal with volume
Where to put the Sandbox (Speed vs CPU power) On Device or network Browser, APPs or OS In the Cloud Hybrid
Anti-sandbox evasion techniques detection

Confidence in the process....

#RSAC

supporting the greater good

19

#RSAC
Summary ­ Evolution of techniques

Traditional techniques
Block known bads (sigs) Exploit detection White & black listing Behavioral bad characteristics

NG techniques
Static analysis
Behavioral techniques & threat specific whitelisting (playbooks)
Sandboxing
Machine learning
Big data (statistical/mathmatical analysis)

#RSAC
How much confidence to block/act?

Gather

Leverage

Intelligence Exploit

Execute Malware

Control Channel

Steal Data

28460%
23

#RSAC
How do I measure effectiveness?
What are you looking to test?
Ability to detect zero day threats
What level of breach is acceptable to you? ­ Ransomware
Ability to detect traditional threats
What testing?
Independent tests
AV-comparitives, SELabs, NSS labs, AV-Test, etc...
In- house testing
Detection Manageability How does endpoint security fit into your broader ecosystem?
22

Endpoint security is more than

#RSAC

detection/prevention

23

#RSAC
Player, play, playbook

Gather Intel

Leverage Exploit

Execute Malware

Control Channel

Steal Data

#RSAC
Campaigns

#RSAC
Protection in depth = NG techniques together
Quarantine Program

Restricted

× Block
Malicious

Malicious

User Attempts to Execute a
Program

Check Hash Against Override Policies

No Match

Check Against List of Trusted
Publishers

No Match

Check Hash with WildFire
Sandbox

Unknown

Conduct Static Analysis

Allowed

Trusted

Benign

Benign

Submit Program to WildFire for
Analysis

Check Execution Restrictions
23

Restricted Allowed

× Block
 Run

#RSAC
Building the endpoint stack for the future..

Encryption DLP
Patch management White/black listing
Firewall Anti-Spyware
Anti-Virus

DLP
Patch management Encryption
Forensics Static analysis Machine based learning
Sanboxing Behavioural analysis
Policy controls

So does all this this work?
Network analysis

#RSAC
Endpoint analysis

Whole IT ecosystem analysis

Building out the security platform

#RSAC

Defragmenting the broader capabilities

#RSAC
Other things to consider?
Think big picture and long term
Connected or silo'ed analysis? Integration with broader security platforms (learn & share)
Compliance Microsoft Security Centre approved (user pop-ups) Regulation compliant ­ PCI-DSS, etc...
30

#RSAC
Takeaways
What are you looking to achieve? Define what your endpoint stack requires for your business! Look at industry tests, but also DO YOUR OWN testing
Criteria should include Prevention/Detection of what is most impactful to your business Manageability/Usability Integration between capabilities Integration into your broader security platform
31

#RSAC

Thank you....
QUESTIONS?
GDay@PaloAltoNetworks.com
GregDaySecurity uk.linkedin.com/in/gregday +44 (0) 7799 661164

https://www.securityroundtable.org/

