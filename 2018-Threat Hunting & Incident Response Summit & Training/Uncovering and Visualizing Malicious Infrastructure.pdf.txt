UNCOVERING AND VISUALIZING MALICIOUS INFRASTRUCTURE

ABOUT US

ANDREA SCARFO
Security Research Manager & Security Researcher
Cisco Umbrella (formerly OpenDNS) in San Francisco. Joined in 2015
Previously: System Administrator for 12 years

JOSH PYORRE
Senior Security Research Analyst & Security Researcher
Cisco Umbrella (formerly OpenDNS) in San Francisco. Joined in 2015
Previously:
Consulting for Non-Profits:

SUMMARY
 Our Research  Finding Maliciousness  Why Build Visualizations  Visualizations and Findings

OUR RESEARCH

CRIMINAL ACTIVITY
$$$$$C$li$ck$h$er$e$!! $$$ Click here!!

SPAM

WEBSITE COMPROMISE
hXXp://www.fullcircleliterary.com/ hXXp://danielpsheehan.com/areas-of-expertise/educator/ucsc-2016-rulers-of-the-realm hXXp://danielpsheehan.com/ hXXp://www.cafemuseroyaloak.com/ hXXp://kdsross.com/about-us/ hXXp://usdiagnostics.com/index.php/certification-testing/uscreen-cup hXXp://psychologywiththal.com/2015/09/30/life-span-development-personality/ hXXp://thefecaltransplantfoundation.org/what-is-fecal-transplant/ hXXp://optimalwellnessaz.com/about/ hXXp://optimalwellnessaz.com/about/ hXXp://chworks.org/real-estate-development/current-projects/north-park-seniors/ hXXp://chworks.org/real-estate-development/current-projects/north-park-seniors/ hXXp://www.altex-energy.com/ hXXp://www.lifeguardingjobs.com/ hXXp://customcrateenginestx.com/ hXXp://customcrateenginestx.com/custom-crate-engine-builders-in-texas/

RATS
Remote Access Trojans

WHAT IS THERE TO VISUALIZE?
95.31.22.193 185.90.61.36 185.90.61.37 62.112.8.34 87.229.111.163 188.126.94.79 82.118.242.158 217.195.60.211 84.124.94.11

DEPENDS ON THE TYPE OF ATTACK
COMPROMISED DOMAINS

DEPENDS ON THE TYPE OF ATTACK
PHISHING DOMAINS

DEPENDS ON THE TYPE OF ATTACK
COMMAND & CONTROL DOMAINS (DGAS)

DEPENDS ON THE INFECTION METHOD
SPAM

DEPENDS ON THE INFECTION METHOD
WEBSITE COMPROMISE

DEPENDS ON THE INFECTION METHOD
EXPLOIT KITS

REACH
SIZE and SCALE

FEATURES FROM THE IOCS

FINDING MALICIOUSNESS

ANALYZING DGAS TO FIND THE C&C

EXAMPLE OF C&C CONTACT

Infected users/ computers Accept and carry out commands

More Infected Users act as HTTP proxies between bots and C&Cs

Made up of Compromised Servers. Act as proxy between Nodes & C&C Backend

C&C Backend Control Panel

C&C CONTACT - DOMAIN FLUX
 Large amount of changing DGA domains  NX Domains  Not all are registered - lots of noise to dig through  One of the DGAs will be the C&C with a hosted IP address

PASSIVE DNS
 DOMAIN NAMES:  C&C communications  DGAs - resolving and NX domains
 IP ADDRESSES:  Hosting IPs
 NAMSERVERS, EMAIL REGISTRANT:  WHOIS Information
 HASHES OF MALICIOUS BINARIES:  Dropped by RATS  Contained in Spam  Dropped by compromised websites or malvertising

Tracking Hailstorm Spam
USING PASSIVE DNS
95.31.22.193

95.31.22.193

SELECT DOMAINS SHOW PHARMA-SPAM DOMAINS

WE CAN PIVOT AND FIND EVEN MORE DATA

WE CAN PIVOT AGAIN AND FIND EVEN MORE DATA

CO-OCCURRING DOMAINS ARE QUERIED JUST BEFORE OR AFTER A DOMAIN

OSINT
WHERE DO YOU GET DATA TO LOOK AT?

DOMAINS FROM A PCAP
IT'S FASTER TO PROGRAMMATICALLY PULL DATA OUT OF A PCAP

ANOTHER EXAMPLE OF A SITE WITH INTEL YOU COULD USE

ANOTHER EXAMPLE OF A SITE WITH INTEL YOU COULD USE

ANOTHER EXAMPLE OF A SITE WITH INTEL YOU COULD USE

YOU CAN WRITE YARA RULES TO AUTOMATICALLY HUNT FOR THINGS

AND YOU CAN DOWNLOAD AND PROCESS FILES, GETTING USEFUL INFO

IN ADDITION TO STATIC/HISTORICAL MALICIOUSNESS, THERE ARE LIVE FEEDS
FEEDS

isctdtaulbpoprun.pw

WHY VISUALS?
 Turn Messy Data into Meaningful
Information
 Help Us Quickly Analyze Threat
Hunting Data

Assessments of change, dynamics, and cause and effect are at the heart of thinking and explanation. To understand is to know...
What cause provokes what effect, by what means, at what rate.
How then is such knowledge to be represented?
~Edward Tufte

VISUALS THAT WE LIKE TO USE
WE PROCESS WITH PYTHON AND THEN VISUALIZE USING D3 AND MATPLOTLIB

VISUALS WE LIKE TO USE
 Force-Directed Graph  Timelines of First Seen Queries VS Domain Registration  Timelines of Domain Queries  Timelines of Queries From Network Captures  Signature Patterns Built From Queries In Network Capture Files

FORCE-DIRECTED GRAPHS

SOME OF THE BEAUTIFUL THINGS YOU CAN CREATE WITH FORCE-DIRECTED GRAPHS

GAMEOVER ZEUS

MIRAI

QUERY TIMELINES

PATTERN MATCHING
LOOKING AT THE TIMES OF POSTS AND GETS IN PCAPS

WHAT MAKES A VISUAL USEFUL?

QUESTIONS WE ASK OURSELVES
When showing quantities, what will make the visual clear?

QUESTIONS WE ASK OURSELVES
Am I placing the data in an appropriate context?
force directed graphs: intuitive for networks

QUESTIONS WE ASK OURSELVES
How can I ...
. reduce visual clutter ? . clarify primary information ? . highlight notable content ?

QUESTIONS WE ASK OURSELVES
How can I assess change and rates of change ?
 Queries on Different Days to Same Domain Reveal Patterns, Assessed
Change, and Rates of Change.
 We See This On Domains Which Show a Sudden Spike (the assessed change)
and How Many Queries There Were On The Spike (or if it ever happened)
Low Query Traffic Spike

VISUAL EXAMPLES OF ATTACK CAMPAIGNS

EMOTET

FORCE-DIRECTED GRAPH : EMOTET IPS AND DOMAINS
OFTEN, YOU JUST HAVE A LISTS OF DOMAINS AND IPS

FORCE-DIRECTED GRAPH : EMOTET IPS AND DOMAINS
PUT THAT LIST INTO A FORCE GRAPH

FORCE-DIRECTED GRAPH : EMOTET IPS AND DOMAINS
FIND THE THINGS THAT STAND OUT

FORCE-DIRECTED GRAPH : EMOTET IPS AND DOMAINS
FIND THE THINGS THAT STAND OUT

ENRICH THAT WITH ADDITIONAL PASSIVE DNS DATA AND TURN LABELS ON TO GET MORE INFO

THIS DOMAIN, ASSOCIATED WITH EMOTET WILL BE SEEN AGAIN LATER

TIMELINES

GRABBING JUST SOME PCAPS TO LOOK AT

PULL OUT THE DOMAINS WITH PYTHON

FROM ONE NETWORK CAPTURE
BUILD A TIMELINE, SHOWING THE TIMES EMAILS WERE RECEIVED
AND WHEN DOMAINS WERE FIRST-SEEN IN DNS

LOOKING AT INFORMATION ON THE DOMAINS IN THOSE PCAPS

LOOKING AT INFORMATION ON THE DOMAINS IN THOSE PCAPS

LOOKING AT INFORMATION ON THE DOMAINS IN THOSE PCAPS

ACTUALLY VISITING THE DOMAIN, A COMPROMISED INSTANCE OF WORDPRESS

VIEWING ALL THE EMOTET DOMAINS FROM A LOT OF PCAPS ON A TIMELINE TO FIND PATTERNS

PATTERNS

LOOKING AT THE TIMES IN BETWEEN POSTS AND GETS IN PCAPS

LOOKING AT THE TIMES IN BETWEEN POSTS AND GETS IN PCAPS

LOOKING AT THE TIMES IN BETWEEN POSTS AND GETS IN PCAPS
} Times In Between Events

Are there patterns?

LOOKING AT THE TIMES IN BETWEEN POSTS AND GETS IN PCAPS

TRICKBOT

GRAPHS

ENRICHING THOSE SMALL CONNECTIONS TO FIND ADDITIONAL RELATIONSHIPS

TURN LABELS ON TO ELABORATE THE RELATIONSHIPS

TIMELINES

VIEWING ALL THE TRICKBOT DOMAINS FROM A LOT OF PCAPS ON A TIMELINE TO FIND PATTERNS

PATTERNS

LOOKING AT THE TIMES IN BETWEEN POSTS AND GETS IN PCAPS

HANCITOR

TIMELINES

VIEWING ALL THE HANCITOR DOMAINS FROM A LOT OF PCAPS ON A TIMELINE TO FIND PATTERNS

FORCE DIRECTED GRAPH

TURN LABELS ON TO ELABORATE THE RELATIONSHIPS

TURN LABELS ON TO ELABORATE THE RELATIONSHIPS

WE SEE MYKEEPTAKE.XYZ, FROM EMOTET IN HANCITOR TOO

PATTERNS

LOOKING AT THE TIMES IN BETWEEN POSTS AND GETS IN PCAPS

RELATIONSHIPS BETWEEN ATTACK INFRASTRUCTURE

VIEWING TRICKBOT, EMOTET, AND HANCITOR ALL TOGETHER TO FIND SHARED INFRASTRUCTURE

COMPARING THE TIMES OF DOMAINS BEING USED Emotet

COMPARING THE TIMES OF DOMAINS BEING USED Emotet Hancitor

COMPARING THE TIMES OF DOMAINS BEING USED Emotet

Trickbot

Hancitor

COMPARING THE QUERIES OF DOMAINS BEING USED

QUESTIONS?
CODE: https://pyosec.com

@AScarf0

@joshpyorre

