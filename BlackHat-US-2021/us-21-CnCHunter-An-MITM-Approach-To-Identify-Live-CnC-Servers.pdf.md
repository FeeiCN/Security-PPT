CnCHunter: An MITM-Approach to Identify
Live CnC Servers
Ali Davanian, Ahmad Darki and Michalis Faloutsos
#BHUSA @BlackHatEvents

IoT malware
IoT malware is on the rise!
#BHUSA @BlackHatEvents
2

CnCs are the Achilles Heel of IoT botnets

· Understanding Command and Control (CnC) Servers help: · Detecting, monitoring, mitigating (e.g blacklisting), subverting
· IoT devices have limited computing resource and hence: · Defense at the network perimeter

Network perimeter

XCnC

Network perimeter

Botnet
3

#BHUSA @BlackHatEvents

Problem Definition
· Goal: Find all live CnC servers · Available public Information:
· Malware binaries · IP blacklists · Malware communication protocols (from threat reports) · Scope · No access to network traffic · No access to AV companies' sensors · We are independent researchers
4

#BHUSA @BlackHatEvents

A
Binary
B
Binary
C
Binary
D

Previous approaches

Static Analysis

XObfuscation

activate Infer Protocol

XIP not live X Imitate

Protocols too complex

Passive Monitoring

XMalware Tr5affic

Needle in haystack
#BHUSA @BlackHatEvents

Our Solution: CnC Hunter
· The first open source tool designed for finding IoT malware CnCs · https://github.com/adava
· Our novelty is a Man in the Middle (MitM) approach to CnC discovery: · Activate the IoT malware · Channel the real CnC communication to potential candidates CnC Hunter

Activate Binary

Sandbox

MitM

6

Internet
#BHUSA @BlackHatEvents

Overview
· IoT malware network communication · Previous Work · CnC Hunter
· Design · Implementation · Evaluation · Demo · Collaboration · Closing Remarks
7

#BHUSA @BlackHatEvents

IoT CnC protocols are diverse

· Communication protocols Complexity:
- Custom binary protocols - Encryption
· Diversity makes generic probing hard

Malware
Gafgyt
Mirai

Communication
Custom application layer protocol
Custom application layer protocol

Details
One IRC command (PONG), other text commands
Binary commands

Lightaidra IRC protocol Linux.wifatch Custom application layer protocol

Wraps C2 commands inside PRIVMSG (private) messages
Binary commands

Remaiten Lizkebab LuaBot
Torlus Tsunami BASHLIFE

IRC protocol Custom application layer protocol Encrypted payload Custom application layer protocol IRC protocol Custom application layer protocol

Wraps inside PRIVMSG (private) messages
One IRC command (PONG), other text commands
MatrixSSL library for encryption
One IRC command (PONG), other text commands
Wraps C2 commands inside NOTICEmessages
One IRC command (PONG), other text commands

#BHUSA @BlackHatEvents
8

Communication protocol barely changes within a family
· We used a generic IRC server to imitate Gafgyt malware CnC

· Gafgyt family protocol
- Text based - Similar to IRC
99.5% of our Gafgyt samples successfully
communicated!

Only 1 gafgyt sample is enough to search for CnCs of the entire family!

#BHUSA @BlackHatEvents
9

CnC servers are short lived

· We manually analyzed 100 IoT malware and found their CnC server

1340 days old 142 days old 14 days old 1 days old
Number of live CnCs 14%
3.5% 0%

55%

Year

2016 2020 March 2021 June 2021

· Roughly, only half of the CnCs of the samples are live by the day they are submitted
10

#BHUSA @BlackHatEvents

CnC discovery using active probing
Related work is mainly focused on actively probing the Internet in search of CnC servers
#BHUSA @BlackHatEvents
11

Mirai Malware
· First appeared in August 2016 · Responsible for disrupting several high-profile websites:
including Github, Twitter, Reddit, Netflix, Airbnb
· Still very active!
#BHUSA @BlackHatEvents
12

Active Probing for Mirai
· After a successful infection, the bot starts communicating with its CnC
#BHUSA @BlackHatEvents
13

CnC Hunter Design

IoT malware

Server

Port

Address

19.154.24.13 442

155.14.0.17 88

137.88.14.16 115

...

....

Static Analysis

Supervisor Sandbox

CnC Addresses
Profiler

MitM

Traffic Analyst

The architecture of CnC Hunter

14

Probing report Internet
#BHUSA @BlackHatEvents

Sandbox and Profile Modules
#BHUSA @BlackHatEvents
15

MitM & Network Proxy modules

· MitM · Redirect CnC traffic to candidate addresses · IP based
· Network Proxy · Tap malware traffic · Provide Internet for the Sandbox

Sandbox

Binary

MitM

16

Internet
#BHUSA @BlackHatEvents

MitM module - Solution design

Sandbox: Qemu

Guest Operating system

malware
X X Network Driver

User space
Dynamic Libraries e.g. libc system call handlers
OS Kernel Drivers

X Sandbox Driver Handler

· Alternative 1: Hooking system calls (libc) · Alternative 2: Network Driver Instrumentation · Alternative 3: Emulator Instrumentation · AAlternative 4: ProoxxyyRReeddiirreeccttiioonn

Sandbox
malware
X1.Y1.Z1.W1

Network Perimeter

CnC
X2.Y2.Z2.W2

#BHUSA @BlackHatEvents
17

MitM must happen on the guest
(implementation details)

· We use iptables for traffic proxying CnC

Sandbox

X2.Y2.Z2.W2

That POSTROUTING rule wouldn't work
iptables -t nat -A POOUSTTPRUOTU-TpINtcGp -pd tXc2p.Y-d2.XZ2.WY22.Z-2-.dWpo2r-t-dport $TARGET_PORT -j DNAT --to-destination X.Y.Z.W

malware

Network Perimeter iptables

/

Candidate address (input)

X.Y.Z.W

Replace X2.Y2.Z2.W2 with X.Y.Z.W

echo "$CnC_DNS_ADDR $CANDIDATE_IP" >> /etc/hosts
How can we support DNS based CnC addresses?
- Manipulate local DNS resolution - Resolve CnC DNS address to the candidate address

#BHUSA @BlackHatEvents
18

What traffic should be redirected?
Only the traffic to the CnC
#BHUSA @BlackHatEvents
20

Finding CnC Traffic

Finding which traffic is to the CnC is non trivial!

Other Traffic:

1. Communication with CnC is usually over TCP

1. Proliferation (Scanning) 2. Background

2. Sinkholed and backlisted CnC DNS addresses would not resolve3. Random

3. CnC IP address is frequently contacted

· Live servers => Many tcp packets with ACK

· Dead servers => Many tcp packets with SYN/RST

4. CnC port is usually unique

5. CnC servers do not have very good reputation

#BHUSA @BlackHatEvents
21

Traffic Analysis Module
· Find a sample's original CnC server · Tool: Pyshark
#BHUSA @BlackHatEvents
22

Find_CnC algorithm

· Assign a score to each IP address (in a malware traffic)

· Score  Connection_frequency

·

Score



1 _

· Score = coefficient  _
_

· CnC address has the highest Score

#BHUSA @BlackHatEvents
23

Find_CnC algorithm data structures

· How can we calculate the score for each IP address?

Address Hash Table
155.10.1.4:32134
evil.domain.com
19.1.143.12:80
...

RST flag count
2

SYN flag count
9

ACK flag count
0

DNS not found
0

0

0

0

8

0

1

11

0

port Hash Table

80

123

23

234

32134

1

443

85

24

#BHUSA @BlackHatEvents

Find_CnC algorithm
· Other functionalities of Find_CnC are: · Port filtering · Reputation filtering
#BHUSA @BlackHatEvents
25

Which candidate address is a CnC?

CnC Hunter

? Candidate address 1 ? ? Candidate address 2

Candidate address 3 .... Whoever is live, listens to our target port and is not filtered will respond!
#BHUSA @BlackHatEvents
26

Evaluating candidates' responses
· Live => there is a response · Listens => successful TCP handshake · Not filtered => no RST flag

Are these enough?
27

#BHUSA @BlackHatEvents

Which candidate address is a CnC?

156.8.10.2:443

CnC Hunter

14.11.3.24:443 X

211.210.31.15 X
The second address listens and responds to requests on port 443 but is not CnC
#BHUSA @BlackHatEvents
28

Which port listener is a CnC?
· We observed that CnCs respond with Significantly lower number of SYN flag · We use simple SYN frequency outlier detection based on standard deviation
#BHUSA @BlackHatEvents
29

CnC Hunter is accurate!
· We evaluated CnC finding functionality of CnC Hunter · Dataset: A set of 100 samples collected between 2016 to 2021
· Mirai, Gafgyt, Tsunami, Remaiten, LightAidra and VPNFilter · Could activate 90% of samples

Precision of CnC finding: Exclusively found by

92%

CnC Hunter: 18%

#BHUSA @BlackHatEvents
30

Demo
· Demo 1: Given an unknown IoT malware binary, find its CnC server
- Malware: Mirai sample - Challenge: Identify the CnC address among all traffic (scanning, infiltration etc.)
· Demo 2: Given the malware and IP addresses, find a live CnC server
- Malware: Gafgyt - The target address: CnC of Gafgyt/Mirai/BashLite (according to VT) CnC
#BHUSA @BlackHatEvents
31

Demo
#BHUSA @BlackHatEvents
32

Demo
#BHUSA @BlackHatEvents
33

We're open to collaboration
Please talk to us if
· You have an active honeypot · You have reliable IoT filesystems · You have Intelligence on IoT malware CnCs · You used our tool · You have insight on IoT malware AV evasion
#BHUSA @BlackHatEvents
34

Acknowledgement
· A Shout out to Martina Lindorfer and VirusTotal
#BHUSA @BlackHatEvents
35

I (Ali Davanian) will be in job market in 6 months!
#BHUSA @BlackHatEvents
36

Takeaway messages
· We need to proactively scan the Internet and find CnC servers because:
- CnC servers are very short lived - IoT malware communication protocols are diverse and complex; hence, real malware is needed for probing
· CnC Hunter provides a CnC discovery solution via Man-In-The-Middling malware
- CnC Hunter is fully automated - CnC Hunter is open source
#BHUSA @BlackHatEvents
37

Q&A
· CnC Hunter repository: - https://github.com/adava · Twitter Handle: - @sinaDavanian · Email: - adava003@ucr.edu

· Twitter Handle: - @adarkione
· Email: - adark001@ucr.edu

#BHUSA @BlackHatEvents
38

