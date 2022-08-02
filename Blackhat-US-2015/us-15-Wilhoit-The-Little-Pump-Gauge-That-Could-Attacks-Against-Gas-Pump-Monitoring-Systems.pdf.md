The Little Pump Gauge That
Could: Attacks Against Gas Pump Monitoring Systems

Kyle Wilhoit   Sr. Threat Researcher
@lowcalspam

Stephen Hilt   Sr. Threat Researcher
@sjhilt

Where The "Industry" Is...

SCADA Became Popular.

Threats Began Adapting & Changing.

SCADA Started Trading in Dark Corners...

Vulnerabilities Continued...

Reported Incidents in US: 2014

SCADA Vulnerabilities and Incidents Per Year

Vulnerability Count

Incident Count

It's Easy

Criminal

Government

Why Attack SCADA?!

Guardian AST...dafuq is it?

Not All Tanks Are Created Equal
· Gas Station Tanks · Backup Generator Tanks · Terminal Station Tanks · Other Tanks?

Introducing Gaspot
· HD Moore published his findings on Guardian's that are Internet facing · Software based gas pump monitor honeypots · Created to better understand attacks against gas pump monitor
systems and non-critical infrastructure · Derived from Anonymous' attacks against US based gas pumps · Completely virtualized · One Python script · Accepts robust input/output
· 6 commands

Architecture

Deployment Locations

Code Considerations

Gaspot on Shodan

Shodan and Gaspot Consideration
· Not  all  Gaspot  instances  are  on  Shodan   · Able  to  see  "organic"  growth  

Attack Scenarios
· DDoS, bringing inventory control/distribution to a standstill. · Change of pump names, resulting in incorrect fill of petrol into the
tank. (eg: change unleaded to diesel) · Change in pumping volume, resulting in over or under fill. (For
instance, putting the volume as full, when it is empty) · State sponsored, meaning a pump compromise to siphon off data for
possible espionage during a business deal?

Classification of attacks

What They're Not...
· Portscans · Successful telnet, then nothing · Server fingerprinting · Banner grabbing (HTTP GET)

What They Are...
· Successful commands resulting in possible failure
· Fat fingering after telnetting · Targeted malware · DoS and DDoS

Attacks...

Attack Breakdown
· 4 Pump Modifications · 12 Pump Queries · 2 DDoS/DoS Attacks

Attack Breakdown

Deployment / Attacker

US

US

BR

GB

JO

DE

AE

RU

RO 3 1

CN

RU

2 1

1 1

IR 2 1

SY

MX

CA

1

2

2

1

Connection Attempts

Valid Commands

Critical vs. Non-Critical Infrastructure
· Had a case study from 2013 showing attacks against critical infrastructure · Wanted to find out if attacks happen to non-critical infrastructure

Attacks- Critical Vs. Non-Critical
· Critical Infrastructure Honeypots 2013 · Deployed in 8 countries · 12 total deployments · 74 Attacks in total
·Non- Critical Infrastructure Honeypots 2015
· Deployed in 7 countries · 10 total deployments · 18 Attacks in total

Intelligence...?

Syrian Electronic Army
· Came about in 2011 · Supports President Bashar al-Assad · Performs DDoS, Defacements, malware distribution,
spamming, and general mischief · Defaced CBS, AP, NPR, BBC, Al Jazeera, etc.

DDoS "Attack"

· DDoS performed for two days · Volume based attacks (UDP floods, etc.) · Protocol attack (Fragmented packets) · Roughly 2Gbps
· Performed on Gaspot in US · Utilized what appears to be LOIC

GET /app/? id=17783745&msg=SEAcannn GO HTTP/ 1.1Host:OBFUSCATED-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv: 1.9.2.12) Gecko/20101026 Firefox/3.6.12Accept: text/ html,application/xhtml +xml,application/xml;q=0.9,*/ *;q=0.8Accept-Language: enus,en;q=0.5Accept-Encoding: gzip,deflateAccept

Attribution
· Possibly Syrian Electronic Army · 213.178.225.248 · 213.178.225.232 · 213.178.225.212 · Etc.
· DDoS against Gaspot in US · No public disclosure by SEA?
· dafuq? · False flag?

Iranian Dark Coders
· Group operating out of Iran · Pro-Iranian group · Website defacements, information sharing, malware
distribution, and hacktivism

Modification "Attacks"
·Iranian Dark Coders? ·5.106.221.208 ·2.147.147.123 ·5.219.58.67 ·31.14.94.33
·Modification of pump names ·Attacked two honeypots in Jordan ·Possible false flag?

"H4CK3D by IDC-TEAM"

"AHAAD WAS HERE"

lowcalspam sjhilt

