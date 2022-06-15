The Domain Abuse Activity Reporting System (DAAR)
John Crain
FIRST TC Feb 2018

The Domain Abuse Activity Reporting system
What is the Domain Abuse Activity Reporting system?
¤ A system for reporting on domain name registration and abuse data across TLD registries and registrars
How does DAAR differ from other reporting systems?
¤ Studies all gTLD registries and registrars for which we can collect zone and registration data
¤ Employs a large set of reputation feeds (e.g., blocklists) ¤ Accommodates historical studies ¤ Studies multiple threats: phishing, botnet, malware, spam ¤ Takes a scientific approach: transparent, reproducible
| 2

DAAR & the Open Data Initiative
¤ Goal of Open Data Initiative is to facilitate access to data that ICANN organization or community creates or curates
¤ DAAR system uses data from public, open, and commercial sources
¡ DNS zone data ¡ WHOIS data ¡ Open source or commercial reputation blocklist (RBL) data
· Certain data feeds require a license or subscription
¤ In cases where licensing permits, DAAR data or reports will be published and included in the Open Data Initiative
| 3

Project Goals
¤ DAAR data can be used to
¡ Report on threat activity at TLD or registrar level ¡ Study histories of security threats or domain registration activity ¡ Help operators understand or consider how to manage their
reputations, their anti-abuse programs, or terms of service ¡ Study malicious registration behaviors ¡ Assist operational security communities
The purpose of DAAR is to provide data to support community, academic, or sponsored research and
analysis for informed policy consideration
| 4

DAAR Uses TLD Zone Data ¤ Collects all gTLD zones for gTLD registry analytics ¤ DAAR uses publicly available methods to collect zone data
¡ Centralized Zone Data Service, zone transfer)
¤ DAAR only uses domain names that appear(ed) in zones ¤ Currently, system collects zones from ~1240 gTLDs
¡ Approximately 195 million domains
| 5

DAAR Uses Whois
¤ DAAR uses published registration data (Whois)
¡ Uses only registration data necessary to associate resolving domain names in zone files with sponsoring registrars
¤ Reliable, accurate registrar reporting depends on Whois
¡ Collecting registration records for millions of domains is a big challenge
| 6

DAAR Uses Many Threat Data Sets
¤ DAAR counts "unique" abuse domains
¡ A domain that appears on any RBL reporting to DAAR is included in the counts once
¤ DAAR uses multiple domain or URL abuse data sets to
¡ Generate daily counts of domains associated with phishing, malware hosting, botnet C&C, and spam
¡ Calculate daily total and cumulative abuse domains ¡ Calculate newly added abuse domains (a monthly count), and
cumulative abuse domains (365 day count) ¡ Create histograms, charts, days in the life views
DAAR reflects how entities external to ICANN community see the domain ecosystem
| 7

Reputation Data: Identifying Threats
| 8

DAAR Is Not An Abuse List Service
¤ OCTO-SSR does not compose its own reputation blocklists
¡ DAAR presents a composite of the data that external entities use to block threats
¤ DAAR collects the same abuse data that is reported to industry and Internet users
¡ The abuse data that DAAR collects are used by commercial security systems that protect millions of users and billions of mailboxes daily
¡ Academic and industry use and trust these data sets ¡ Academic studies and industry use validate these data sets exhibit
accuracy, global coverage, reliability and low false positive rates
| 9

DAAR Criteria for Reputation Data (RBLs)
¤ RBLs must provide threat classification that match our set of security threats
¤ Evidence that operational and security communities trust the RBL for accuracy, clarity of process
¤ RBLs have positive reputations in academic literature ¤ RBLs are broadly adopted across operational security
community
¡ Feeds are incorporated into commercial security systems ¡ Used by network operators to protect users and devices ¡ Used by email and messaging providers to protect users
| 10

Reputation Block Lists: Protecting Users Everywhere
¤ RBL use is nearly ubiquitous
¤ RBLs block more than unsolicited commercial email
¤ RBLs in Browsers
¡ Google Chrome uses APWG, and Safe Browsing URL Data
¤ RBLs in the Cloud and Content-Serving Systems
¡ Akamai uses SURBL, Symantec, ThreatSTOP, and custom RBLs ¡ AWS WAF uses RBLs to block abuse or volumetric attacks ¡ Google Safe Browsing blocks malicious URLs and AdWords fraud
¤ RBLs in Your Social Media Tools
¡ Facebook composes and shares its ThreatExchange platform
¤ RBLs in the DNS
¡ ISPs & private networks use Resource Policy Zones (RPZs) at resolvers. ¡ Spamhaus and others provide RBLs in RPZ format
| 11

Reputation Block List Uses: Private Network Operators
¤ RBLs in commercial firewalls, UTM devices
¡ Admin guides from Palo Alto Networks, Barracuda Networks, SonicWall, Check Point, Fortigate, Cisco IronPort, and WatchGuard
¡ TitanHQ SpamTitan, Sophos UTM, andProofpoint also provide RBL-based filtering to protect users from visiting malicious URLs
¡ External RBLs mentioned: Spamhaus, SURBL, SpamCop, Invaluement, abuse.ch, Open ORDBL, Spam and Open Relay Blocking System (SORBS), Squidblacklist.org,
¤ RBLs in enterprise mail/messaging systems
¡ Spam solutions from GFI MailEssentials, SpamAssassin, and Vamsoft ORF include Spamhaus or SpamCop RBLs available for Microsoft Exchange
¤ RBLs and Third-Party Email Service Providers (ESPs)
¡ Amazon Simple Email Service RBL or DNS block lists ¡ Look at ESPMail Exchange (MX) and Sender Policy Framework (SPF)
resource records
| 12

RBLs in Academia: One means of asserting RBL confidence
Partial list of academic studies and citations of RBLs that report to DAAR
Empirically Characterizing Domain Abuse and the Revenue Impact of Blacklisting Blacklist Ecosystem Analysis: Spanning Jan 2012 to Jun 2014 Taster's Choice: A Comparative Analysis of Spam Feeds Learning to Detect Malicious URLs Understanding the Domain Registration Behavior of Spammers The Statistical Analysis of DNS Abuse in gTLDs (SADAG) Report Shades of grey: On the effectiveness of reputation-based blacklists Click Trajectories: End-to-End Analysis of the Spam Value Chain
| 13

Current Reputation Data Sets
¤ SURBL lists (domains only) ¤ Spamhaus Domain Block List ¤ Anti-Phishing Working Group ¤ Malware Patrol (Composite list) ¤ Phishtank ¤ Ransomware Tracker ¤ Feodotracker

SpamAssassin: malware URLs list Carbon Black Malicious Domains Postfix MTA Squid Web proxy blocklist Symantec Email Security for SMTP Symantec Web Security Firekeeper DansGuardian ClamAV Virus blocklist Mozilla Firefox Adblock Smoothwall MailWasher

| 14

Does DAAR Identify All Abuse?
¤No reputation provider can see all the abuse
¡ Each is catching only some (what they see)
¤Providers look for different types of abuse, use different methods or infrastructures
¤Some lists are big and some are small.
¡ The smaller the list, the less percent of overlap it might have with a larger list
| 15

Why Is DAAR Reporting Spam Domains?
¤ The ICANN Governmental Advisory Committee (GAC) expressed interest in spam domains as a security threat in its Hyderabad correspondence to the ICANN Board of Directors... Why? Because
¤ Most spam are sent via illegal or duplicitous means (e.g., via botnets). ¤ Spam is no longer singularly associated with email
¡ Link spam, spamdexing, tweet spam, messaging spam (text/SMS)
¤ Spam is a major means of delivery for other security threats
¡ Spam has evolved to a (cloud) service: Avalanche, for example, provided domain registrations to customers
¤ DAAR mainly measures domain names found in the bodies of spam messages MOST IMPORTANTLY, spam domain reputation influences how extensively or aggressively security or email administrators apply filtering
| 16

Visualizing DAAR Data
| 17

Data Set: All gTLDs having at least 1 reported abuse domain

Security Threats
1,200,000

1,000,000

800,000

600,000

400,000

200,000

0

Phishing

Phishing

Malware

Malware

Spam

Spam Botnet C&C Botnet C&C

Domains: Domains: Domains: Domains: Domains: Domains: Domains: Domains:

New TLDs Legacy TLDs New TLDs Legacy TLDs New TLDs Legacy TLDs New TLDs Legacy TLDs

May 2017 Jun 2017 Jul 2017 Aug 2017 Sep 2017

| 18

End of Month Snapshots: Phishing Domains Percent of Abuse
| 19

End of Month Snapshots: Botnet (C2) Domains Percent of Abuse
| 20

End of Month Snapshots: Spam Domains Percent of Abuse
| 21

Data Set: All gTLDs having at least 1 reported abuse domain

Percent of Domains Resolving in the DNS: Legacy vs New TLDs

100%

12%

12%

11%

11%

11%

88%

88%

89%

89%

89%

50%

MAY 2017

JUN 2017

JUL 2017

AUG 2017

% New TLD Domains that Resolve in DNS

% Legacy TLD Domains that Resolve in DNS

SEP 2017

| 22

Data Set: All gTLDs having at least 1 reported abuse domain
Percent of Total Abuse Domains Reported To DAAR System:
New versus Legacy TLDs

47%

45%

44%

49%

43%

53%

55%

56%

51%

57%

MAY 2017

JUN 2017

JUL 2017

AUG 2017

Percentage of Total Abuse Domains (New TLDs)

Percentage of Total Abuse Domains (Legacy TLDs)

SEP 2017

Total Abuse Tells Only PART of the Story: Let's drill down to Consider Concentration Or Distribution

| 23

Where is Abuse Concentrated in New TLDs?

Exploited New TLDs
MAY 2017

Abuse Domains Reported to DAAR

New TLD Program Resolving Domains for Which DAAR Obtains Data

5 most exploited new TLDs 10 most exploited new TLDs 25 most exploited new TLDs

56% 73% 97%

22% 34% 70%

Exploited New TLDs
SEP 2017

Abuse Domains Reported to DAAR

New TLD Program Resolving Domains for Which DAAR Obtains Data

5 most exploited new TLDs 10 most exploited new TLDs 25 most exploited new TLDs

53% 71% 95%

26% 48% 67%

TLDs for which no abuse domains were reported are not included in the counts

| 24

Project Status
| 25

Project Status
¤ Doing it right is more important than doing it fast
¡ Reviewing our data feeds and licensing ¡ Tuning collection systems to ensure timely and resilient updates ¡ Third party independent review of our methodology
¤ Version 2.0 features under development
¡ Additional automation for reporting ¡ Granular attribution ¡ Experimentation with additional measurements

2/27/18

https://www.flickr.com/photos/artisticbokeh/
26
| 26

Questions? Thank You

@icann facebook.com/icannorg youtube.com/icannnews flickr.com/icann linkedin/company/icann slideshare/icannpresentations soundcloud/icann

John's Contact Info: John.crain@icann.org Twiiter: @johnlcrain Skype: JohnLcrain
| 27

