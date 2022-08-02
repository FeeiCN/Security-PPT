An Insight into Symbiotic APT Groups
Thoufique Haq, Sr. Malware Research Scientist FireEye
Outline
 Threat landscape  DragonOK and Moafee group  NJQ8, MoDis, Houdini, BlackMafia, BlackHacker  Sunshop campaign  Shared weponization tools
2

Threat Landscape
3
Specimen A
Moafee & DragonOK
4

Moafee Group
· One of their HTRAN command control infrastructure at 58.64.201.229
· Many domains resolving to this IP between January ­ March 2014
· We also monitored their HTRAN command control server at 58.64.201.229 from January - March 2014.
· Consistent connections to HTRAN backend from Guangdong
Moafee
5

DragonOK Group
· One of their HTRAN command and control infrastructure at www.ndbssh[.]com (206.161.216.219)
· Many domains resolving to this IP between between 201309-28 and 2013-10-04
· We monitored their HTRAN command control server for one week, between July 31, 2013 and August 8, 2013
· Consistent Connections to HTRAN backend from Jiangsu

DragonOK

6

Moafee and DragonOK ­ Not one entity
 Geographical separation - Over 700 miles between them - Moafee ­ Guangdong - DragonOK Jiangsu
7
Moafee & DragonOK ­ Not one entity
 Different Industry verticals - Moafee ­ Regional conflicts and US Defense - DragonOK ­ Regional High Tech and Manufacturing
8

Moafee & DragonOK ­ Tradecraft
NewCT/CT Rat · Used by both DragonOK and Moafee group · Embedded within a dropper with a fake header · Embedded string table with language origins · Found older versions going as far back as 2012
9
Moafee & DragonOK ­ Tradecraft
NewCT/CT Rat · POST stub encrypted with a
rolling byte XOR scheme and byte negation · Campaign codes embedded within the implant
10

Moafee & DragonOK ­ Tradecraft

Code level similarity V1 & V2

V1

Nflog

· Used by both DragonOK and Moafee group
· Older and newer versions of the RAT identified
V2

11

Moafee & DragonOK ­ Tradecraft

PoisonIvy
· Off the shelf RAT · Used by a large number of actors · Distinct configurations used by Moafee and DragonOK groups

Moafee
ID: Domains: afp.mozjlla.com| Password: 741526 Mutex: )!afpA.I4

DragonOK
ID: ftp Domains: ftp.skydnastwm.com:15836| Password: Ecp982*@Me2 Mutex: fftp

12

Moafee & DragonOK ­ Evasion techniques
 CPU core evasion
13
Moafee & DragonOK ­ Evasion techniques
 Password protected documents
14

Moafee & DragonOK ­ Evasion techniques
 Large overlays
15
Moafee & DragonOK ­ Conclusion Actors are either
 Collaborating on attack methodologies  Have a common training regimen  Have a common supply chain
16

Specimen B
NJQ8 Enterprise
17
NJQ8
· `Nasser Al Mutairi' based out of Kuwait goes by the moniker njq8
· Developer of .NET based njRat/LV and VB based njW0rm · Active on twitter, blogs and forums · Code forks/collaboration with multiple individuals · Both targeted and widespread activity employing these
tools
18

NJQ8 Tools ­ C&C Infrastructure
Command and Control Infrastructure Heatmap
19
NJQ8 Tools ­ Campaign Codes
20

NJQ8 Tools ­ Network Telemetry Similarity
NJRAT lv|'|'|Base64({Campaign}_{DiskSerial})|'|'|{Hostname}|'|'|{Username}|'|'|2014-0212|'|'|USA|'|'|Win 7 Professional SP1 x64|'|'|No|'|'|0.5.0E|'|'|..|'|'||'|'|[endof]
NJW0RM Lv0njxq80{Campaign_{DiskSerial}0njxq80{Hostname}0njxq80{Username}0njxq80 0njxq80WIN_XP X86 SP30njxq800.4a0njxq80N0njxq80C:\WINDOWS\system32\cmd.exe
MODIS timenj-q8
21
NJQ8 Collaboration - Houdini
· H-worm ­ Houdini and njq8 · Houdini aka `Mohamed Binadbellah' from Algeria
22

NJQ8 Collaboration ­ BlackMafia, BlackHacker
Blackworm­ njq8, BlackMafia and BlackHacker

23

NJQ8 Collaboration ­ Spygate, Fallaga

Spygate

Spygate and Fallaga Rat reuse njq8 code

Fallaga

24

NJQ8 and Posse ­ Conclusion Authors/actors are either
 Collaborating by creating development forks on code
 Stealing code techniques
25
Specimen C
Sunshop Campaign
26

Sunshop Campaign ­ Overview

· Campaign first observed May 20, 2013 · Additional waves observed August 19 and 28, 2013 · We found 110 samples linked to 11 different
campaigns that utilized common infrastructure.

Detection
Trojan.APT.9002 Trojan.APT.PoisonIvy Trojan.APT.Gh0st Trojan.APT.Kaba Trokan.APT.Briba

Number of Samples
70 26 12 1 1

27

Sunshop Campaign - Overview
· Deeper analysis revealed that 11 different campaigns utilized parts of the same infrastructure. · 13 unique c2 domains · C2s hosted in 58.64.205.0/24 · Reuse of unique PE resource · Reuse of unique import table · Common compile times · Common builder tool
28

Sunshop Campaign ­ 9002 Builder
· Builds 9002 RAT · Allows user to configure C2
details, campaign ID, proxy details · Private builder, not publicly
available
29
Sunshop Campaign ­ Supply chain
Its all connected!
30

The Sunshop Supply Chain
31
Sunshop Campaign­ Conclusion
Either  A `digital quartermaster' exists and supports separate
APT campaigns  A singular `digital quartermaster' does not exist, and
APT actors informally share among each other  The `digital quartermaster' exists and supports a
single APT actor responsible for all of the campaigns discussed
32

Shared Weaponization Tools
· Metadata artifacts seen within exploit documents employed in targeted attacks
· These artifacts are seen across multiple campaigns and APT groups
· These artifacts are seen in exploit documents with different document file formats
33
Specimen D
Shared Weaponization Tools
34

Shared Weaponization Tools - DOC
35
Shared Weaponization Tools - RTF
36

Shared Weaponization Tools ­ Web Archive DOC
37
Shared Weaponization Tools ­ Decoy mismatches
38

Shared Weaponization Tools - Builders
· How are these weaponized documents created ? · Private builders not widely available · Used in many campaigns and by many actors · Likely supply chain supporting attackers
39
Overall Conclusion
Analysis points to evidence of  Attackers evolving and adapting  Likely digital quartermasters driving the supply chain  Cross collaboration in development phases  Cross collaboration in attack phases  Formal or informal sharing channels Continued research is required to unravel attackers ecosystems and operations in order to develop better defensive measures
40

Additional Resources
· Operation Quantum Entanlgment http://www.fireeye.com/resources/pdfs/white-papers/fireeye-operationquantum-entanglement.pdf
· Sunshop campaign http://www.fireeye.com/resources/pdfs/fireeye-malwaresupply-chain.pdf
· njW0rm, njq8http://www.fireeye.com/blog/technical/malwareresearch/2013/08/njw0rm-brother-from-the-same-mother.html
· njRathttp://www.fireeye.com/blog/technical/botnet-activitiesresearch/2012/09/the-story-behind-backdoorlv.html
· H-worm, Houdini, njq8http://www.fireeye.com/blog/technical/threatintelligence/2013/09/now-you-see-me-h-worm-by-houdini.html
· Blackworm, Fallaga, Spygate, njq8http://www.fireeye.com/blog/technical/2014/08/connecting-the-dotssyrian-malware-team-uses-blackworm-for-attacks.html
41
Questions ?
42

