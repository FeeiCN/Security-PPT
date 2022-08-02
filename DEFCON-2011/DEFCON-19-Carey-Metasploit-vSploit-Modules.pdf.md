Metasploit vSploit Modules
Marcus J. Carey David "bannedit" Rude Will Vandevanter
1

Outline
· Objective of vSploit Modules · Metasploit Framework architecture · What are Metasploit modules? · vSploit modules · vSploit and Intrusion Kill Chains · Writing Metasploit Modules · Live Demo
2

Metasploit overview
· Metasploit Project founded in 2003 · Open Source penetration testing platform based with over
1 million downloads in the past year · Acquired by Rapid7 in 2009 · HD Moore joined Rapid7 as Chief Security Office and Chief
Architect of Metasploit · Rapid7 remains committed to the Community · Metasploit Framework is the foundation for the
commercial editions Metasploit Express and Metasploit Pro
3

Metasploit Framework Architecture

TOOLS PLUGINS

LIBRARIES
Rex MSF Core MSF Base

INTERFACES
Console
CLI
GUI & Armitage
RPC

Exploit

MODULES
Payload Encoder

NOP

Auxiliary

4

Metasploit Framework Architecture

TOOLS PLUGINS

LIBRARIES
Rex MSF Core MSF Base

INTERFACES
Console
CLI
GUI & Armitage
RPC

Exploit

MODULES
Payload Encoder

NOP

Auxiliary

5

What are Metasploit Modules?
· More than just exploits · Payloads ­ the "arbitrary code" you hear about in
advisories · Encoders ­ add entropy to payloads, remove bad
characters · NOP ­ create sophisticated nopsleds · Auxiliary ­ Like an exploit module but without a payload
­ Underappreciated
6

Which would you pick for a training drill?

Live Ammo?

Or Paint Balls?

= Live Exploits
7

= vSploit Modules

Introducing: vSploit Modules
· New spin on auxiliary modules
­ Focus on attack response emulation ­ Not intended for exploitation ­ Continues with Metasploit roots as security testing and validation
framework ­ Allows organizations to understand their current security
investment
· Stand-alone compatibility
­ No exploitation used ­ Possible to remove exploit modules if necessary in some
environments
8

vSploit: Purpose
· Evaluate devices on their own merit · Minimal traffic evasion · Trigger alerts on purpose · Ensure proper network device placement · Test and train security staff · Test security architecture without exploits
9

vSploit: Interesting Traffic
· Many network based security offering monitor network traffic for behavior
· Many devices are signature based · Need to be placed on network properly to see interesting
traffic · Good test cases are hard to emulate
10

vSploit: Network Traffic Device
· IDS · IPS · DLP · Firewalls · Network Intelligence Devices
11

Security Monitoring
· ESIM · Netflow collectors · Other Log correlation devices (ie. Splunk) · Network-based vulnerability analysis devices
12

IDS/IPS
· Signature-based · Looks for known suspicious traffic · SQL injections · Attack responses · Alert on suspicious behavior
13

Data Loss Prevention (Network Based)
· Similar to IDS · Concerned with data leakage · Personally Identifiable Information (PII)
­ Social security numbers ­ Payment information
· Protected Health Information (PHI)
­ Medical records
· PCI-related data
­ Credit card numbers
14

Enterprise Security Information Management (ESIM)
· Collects system logs · Significant capital investment · Provides correlation · Provides reporting · Key to most security operations efforts
15

vSploit: Interesting Traffic

Client Sends Request for Interesting Traffic and Designated Port

Client

Network Traffic Analysis Device
MSF #1 Sends Signature Matching String

MSF

vSploit: Simulating Malicious DNS Queries

MSF
foo.ru foo.cn foo.kp

Metasploit sends out DNS Query to Internal DNS, i.e.. Domain Controller

DNS Server
Logs
ESIM

Intrusion Kill Chains

Intrusion Kill Chains
19

Kill Chain ­ Course of Action Matrix

Phase

Detect

Deny

Disrupt Degrade Deceive Destroy

Reconnaissance Web Analytics Firewall ACL

Weaponization

NIDS

NIPS

Delivery

Vigilant user Proxy Filter In-line AV Queuing

Exploitation

HIDS

Patch

DEP

Installation

HIDS

*chroot* jail

AV

C2
Actions on Objectives

NIDS Audit log

Firewall ACL

NIPS

Tarpit

DNS redirect

Quality of Honeypot Service

Source: Hutchins, Cloppert, Amin ­ Lockheed Martin

20

vSploit Testing Detection Capabilities

Phase

Detect

Deny

Disrupt Degrade Deceive Destroy

Reconnaissance Web Analytics Firewall ACL

Weaponization

NIDS

NIPS

Delivery

Vigilant user Proxy Filter In-line AV Queuing

Exploitation

HIDS

Patch

DEP

Installation

HIDS

*chroot* jail

AV

C2
Actions on Objectives

NIDS Audit log

Firewall ACL

NIPS

Tarpit

DNS redirect

Quality of Honeypot Service

Source: Hutchins, Cloppert, Amin ­ Lockheed Martin

21

vSploit Testing Detection Capabilities

Phase

Detect

Deny

Disrupt Degrade Deceive Destroy

Reconnaissance Web Analytics Firewall ACL

Weaponization

NIDS

NIPS

Delivery

Vigilant user Proxy Filter In-line AV Queuing

Exploitation

HIDS

Patch

DEP

Installation

HIDS

*chroot* jail

AV

C2
Actions on Objectives

NIDS Audit log

Firewall ACL

NIPS

Tarpit

DNS redirect

Quality of Honeypot Service

Unable to perform tests in red.

Source: Hutchins, Cloppert, Amin ­ Lockheed Martin

22

vSploit Modules Screen Shots

vSploit: Web PII Module - Configuration

vSploit Web PII Module - In Action

vSploit: HTTP File Download Server

vSploit Web Beaconing - Configuration

vSploit: Web Beaconing ­ In Action

vSploit: DNS Beaconing ­ Wireshark Analysis

vSploit: Vulnerable Headers
30

vSploit: Vulnerable Headers PCAP
31

Writing Metasploit Modules

Where to Learn Ruby
· http://pine.fm/LearnToProgram/ · The Little Book of Ruby · Humble Little Book of Ruby · Metasploit Repository Documentation
http://r-7.co/iNmOBt
33

Auxiliary Module Basics
34

Auxiliary Module: Code can be simple
35

Using IRB in Metasploit
36

Exploit Written in Python
37

Same Exploit in Metasploit
38

Where to put it...
· Official modules live in msf3/modules/
­ Subdirectories organized by module type (exploit/, auxiliary/, post/, ...)
· ~/.msf3/modules/ has same structure, loaded at startup if it exists
· ~/.msf3/modules/auxiliary/vsploit is a the location for vSploit modules
39

Quick demos

vSploit Documentation
· vSploit documentation in Rapid7 Community
­ https://community.rapid7.com

Questions?

Marcus J. Carey mjc@rapid7.com @iFail

David "bannedit" Rude bannedit@metasploit.com @msfbannedit

Will Vandevanter will@rapid7.com @willis__ <- two underscores

