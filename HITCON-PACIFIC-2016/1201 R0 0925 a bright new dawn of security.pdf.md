A Bright New Dawn of Security:
Comprehensive Threat Intelligence
Earl Carter Senior Threat Researcher

Today's Plan
· Threat Landscape · Angler Exploit Kit
· Sophistication · Money · Constant Evolution · Malvertising · World Wide Impact · Talos Threat Intelligence

THREAT LANDSCAPE

Low Hanging Fruit on Decline

80%

70%

· Network Accessible

· Low Complexity

60%

· No Authentication

50%

40%

30%

20%

10%

2003 2005 2007 2009 2011 2013 2015

Another Attack Vector - Users

Data is the New Target

Angler Exploit Kit

What is an exploit kit?
· A software package designed to exploit vulnerable browsers and plugins
· Blackhole was the first major exploit kit

Angler Effectiveness

IP Address / ASN Relationship
Angler HTTP Requests by Provider July 2015

Shutting Down the Source
· Partnered with Limestone Networks · Angler Infrastructure
· Level-3 · Magnitude and Scale
· Collaborated with OpenDNS · Visibility into DNS Infrastructure

Angler Architecture Exposed
Redirect to Proxy Server

Angler Victims

Potential Revenue
To play with the numbers, please visit: http://talosintel.com/angler-exposed/

Malvertising?

ONLINE ADVERTISING
A big, fat, opportunity
· Ad Injection
Rewrite web pages with extra ads
· PUAs
Adware downloads
· Clickfraud
Hidden frames, with random clicking that generate hits.
· Malvertising
A favorite of kits such as Angler; use the ad platform to direct browsers to a compromised server.

A major news site
26 Domains 39 Hosts 171 Objects 557 Connections

Malvertising

ShadowGate

What is a Gate?
· Initial Redirection Point for EK · Usually found in:
· Compromised Website · Malicious Ads · Allows for quick Exploit Kit pivoting

What is ShadowGate?
· Discovered by Talos and announced at Hack In The Box in early 2016.
· Large scale malvertising based EK gate.
· Traces back to early 2015, but they continue to have long periods of inactivity ­ vacation, right? 
· ShadowGate was responsible for a major global campaign affecting sites around the world

Details
· Large Scale Malvertising Campaign · US/Canada/Middle East/China/New Zealand · Pointed to Neutrino Exploit Kit · Delivered various payloads including Ransomware
· Action Taken · Shadowed Domains Registered through GoDaddy · Worked with GoDaddy to get domains shutdown · After first shutdown Gate pivoted · Found second server/campaign · Also shutdown by GoDaddy

Key Takeaways
· Cooperation GoDaddy was VITAL!
· Exploit Kit gate disrupted for the moment
· Helped limit global Neutrino infections
· Shows global reach of exploit kits · Most continents impacted · English, Chinese, Arabic pages found hosting malicious ads
· Online Advertising is going to be a challenge
· Balance between revenue and risk for web sites

TALOS INTEL BREAKDOWN

THREAT INTEL

1.5 MILLION Daily Malware Samples

600 BILLION Daily Email Messages

Internet-Wide Scanning
Product Telemetry

20 BILLION Threats Blocked

16 BILLION Daily Web Requests
Honeypots

Vulnerability Discovery (Internal)

Open Source Communities

INTEL SHARING

Customer Data Sharing Programs

Service Provider Coordination Program

Industry Sharing Partnerships (ISACs)

500+ Participants

Open Source Intel Sharing

3rd Party Programs (MAPP)

250+ Full Time Threat Intel Researchers
MILLIONS Of Telemetry Agents
4 Global Data Centers
100+ Threat Intelligence Partners
1100+ Threat Traps

MULTI-TIERED DEFENSE
Cloud to Core Coverage
· WEB: Reputation, URL Filtering, AVC · END POINT: Software ­ ClamAV, Razorback, Moflow · CLOUD: FireAMP & ClamAV detection content · EMAIL: Reputation, AntiSpam, Outbreak Filters · NETWORK: Snort Subscription Rule Set, VDB ­
FireSIGHT Updates & Content, SEU/SRU Product Detection & Prevention Content · Global Threat Intelligence Updates

talosintelligence.com @talossecurity @kungchiu

