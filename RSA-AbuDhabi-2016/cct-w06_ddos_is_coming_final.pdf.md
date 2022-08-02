SESSION ID: CCT-W06
DDoS Is Coming: A Story of DD4BC and the Copycat Squalls
#RSAC

Tin Zaw
Director, Security Solutions Verizon Digital Media Services
@tzaw @verizondigital

#RSAC

#RSAC
The following is based on a true story...

As an enterprise content delivery network provider, Verizon Digital Media Services helps its customers deal with security attacks on a regular basis.

The example that I'm going to present today is based on our actual experience working with a customer to mitigate a Bitcoin-DDoS extortion attempt. This is just one recent example, but I think it's worth noting that we deal with these types of attacks on a daily basis.

3

#RSAC
The Rise of Cyber Extortion
In recent years, there has been an emergence of cybercriminal groups that threaten their targets with massive DDoS attacks unless they are paid a hefty Bitcoin ransom.
If left unaddressed, these attacks can disrupt business practices, damage branding and cause financial loss.
4

#RSAC
Day 1

#RSAC
Day 1
It's the holiday season in 2015. The busiest shopping season of the year.
6

#RSAC
Day 1
A few Company X employees receive a strange email.
7

Skeptical, they forward the email up the chain

#RSAC

of command.

Not knowing if the email is just a hoax or a legitimate threat, Company X employees forward it on to senior level execs.
It eventually makes its way up to the CSO and catches his attention.

One employee writes: "Not sure if this is something I need to report or just spam but wanted to send it on just in case."
8

Elements of the letter: We've seen this more and more.
Elements
Comes from a location that doesn't work well with U.S. authorities Asks recipients to forward the email  attackers don't know the decision makers, so they spam many people
Tries to establish credibility in some way Requests payment in Bitcoins (very hard to trace) Includes bold claims of attack abilities Surges pricing Will attack all IP addresses Gives some time to get ready
9

#RSAC

#RSAC
Day 2

#RSAC
Verizon, we have a problem.
Company X had a call with Verizon team:
Verizon: Technical Account Manager and a Security Solution Architect Company X: Information Security Manager and their WebOps Team
11

#RSAC
Step 1: Analyze the vulnerabilities
The "proof of concept attack" never came. Some of the origin IPs were exposed. HTTP Redirection from CompanyX.com to www.CompanyX.com.
12

#RSAC
Step 2: All hands to the battle station

Team NOC

Alert
Our 24 x 7 Networking Operations Center (NOC) team were notified and given context. A specialized contact and escalation were designed.

Security Professionals Constant and direct lines of communication were initiated with relevant customer teams.

Engineering

We checked capacity and hardware to prepare for attack.

Management

Our CTO and General Counsel were notified so they could make quick decisions, if it became necessary to take more draconian measures.

13

#RSAC
Step 3: Putting a plan in place

Attack Source

Mitigation Strategy

Layer 3 and 4 attack
Layer 7 attack
Unprotected origin

Verizon's Edgecast Content Delivery Network (CDN) is accustomed to network layer attacks as part of running a CDN. · We created a Proactive Ticket with our 24 x 7 Network Operations Center to expect
an attack. · We provided Company X origin IP to NOC to enable a faster response to create more
accurate signatures.
This has the most potential for damage. · We activated more restrictive Web Application Firewall rules to minimize the attack
surface. · We enabled more rules for alerts to create more visibility to possible attacks. · We increased the frequency of log reviews to detect attacks.
No time to migrate to Verizon solution.

14

#RSAC
Step 4: Wait
15

#RSAC
Day 3

#RSAC
Major Attack Expected
17

#RSAC
Day 3
No Attack. Nothing.
18

#RSAC
Day 4

#RSAC
Day 4
No Attack. Nothing.
20

#RSAC
Day 5

#RSAC
Day 5
No Attack. Nothing.
22

#RSAC
Day 6

#RSAC
Day 6
No Attack. Nothing.
24

#RSAC
Day 6
25

#RSAC
Day 7

#RSAC
6:40AM ­ DDoS is Here
Verizon detects the attack (SYN Flood), which peaks at 80Gbps.
27

Attack Type: SYN Floods
SYN Floods are a common form of DDoS Attackers send a flood of fake server connection requests to their target's system in order to overload their servers and render them unresponsive and unable to process legitimate requests. SYN Floods are considered L4 (Transport Layer) attacks.
28

#RSAC SYN SYN-ACK SYN

#RSAC
What a SYN Flood Looks Like
SYN Floods
29

#RSAC
Mitigated in Minutes
Verizon immediately reacts with countermeasures and the attack
is blocked at the edge.
30

#RSAC
Really!

#RSAC
Secure by Design
IP Anycast Verizon's IP Anycast has native DDoS attack mitigation (automated mitigation technology).
Super PoPs We place high-capacity PoPs in strategic global locations to handle massive surges in demand or attacks. 20 Tbps of global capacity and 95+ Super PoPs.
Network Attack Mitigation We have proprietary network attack detection and a response system codenamed Stonefish.
Web Application Firewall It has powerful protection, threat detection and virtual patching with over 2,000 rules.
32

Our Network

Upcoming
Denver Mexico City

North America
Atlanta Boston Chicago Dallas Los Angeles Miami New York Philadelphia San Jose Seattle Washington D.C.
South America
Buenos Aires 1 Medellin Quito São Paulo
Upcoming
Baranquilla Buenos Aires 2 Lima Rio de Janeiro Santiago

Europe
Amsterdam Copenhagen Frankfurt Helsinki London Madrid Milan Paris Stockholm Vienna Warsaw
33

Australia
Melbourne Sydney

#RSAC

Asia
Bangalore Batam Beijing Chennai New Delhi Hong Kong Jakarta Mumbai Osaka Seoul Singapore Taiwan Tokyo
Upcoming
Shanghai

20Tbps
Network Capacity
95+
PoPs
5
Continents
3,000+
Interconnects

#RSAC
Anycast CDN 101
$ host www.verizondigitalmedia.com www.verizondigitalmedia.com is an alias for cs229.adn.alphacdn.net. cs229.adn.alphacdn.net has address 72.21.92.7
34

#RSAC
Layered Defense

Router

Director

Sailfish Webserver

Stonefish System
35

Customer Firewall

Origin Server

#RSAC
Countermeasures
Verizon immediately identifies the attack signature and creates rules to block malicious traffic. This effectively thwarts the attack.
36

#RSAC
Staying Vigilant
Despite thwarting the attack, Verizon stayed prepared for Round 2, in case the attackers tried a different approach. Other possible attack scenarios include a Layer 7 (Application) attack. We enabled restrictive rules and activated many alerts, in anticipation. No Layer 7 observed.
37

#RSAC
Day 8

#RSAC
Day 8
No Attack. Nothing.
39

#RSAC
Many many days later

#RSAC

#RSAC
Lessons Learned Apply Them

#RSAC
Lessons Learned
#1
Protect your origin IP: Origin cloaking is best practice.
43

#RSAC
Lessons Learned
#2
Don't forget to protect apex domain: http://yourdomainnamehere.com
44

#RSAC
Lessons Learned
#3
You need a plan. Do your employees know who to escalate to?
Do you know what your attack surface is?
45

#RSAC
Lessons Learned
#4
You need on-demand scalability and capacity. Attacks won't happen on schedule.
You need massive capacity on standby, globally.
46

#RSAC
Lessons Learned
#5
What is your DDoS breaking point? 80 Gbps? 200 Gbps? 1 Tbps?
47

#RSAC
Lessons Learned
#6
Can your appliance handle it? Average DDoS: 5.5 Gbps Hardware Cost: $200,000
Plus Support and Operation costs
48

#RSAC
Lessons Learned
#7
You need agile WAF. How fast can your WAF change rules to create
customized defense?
49

#RSAC
Lessons Learned
#8
You need agile security service. How fast can your vendor come to your aid?
50

#RSAC
The Sequel...

#RSAC
Armada Collective?
FORWARD THIS MAIL TO WHOEVER IS IMPORTANT IN YOUR COMPANY AND CAN MAKE DECISION! We are Armada Collective. http://lmgtfy.com/?q=Armada+Collective You will be DDoS-ed starting Thursday (April 21) if you don't pay protection fee 20 Bitcoins @ 1KdDx You will be DDoS-ed starting Thursday (April 21) if you don't pay protection fee 20 Bitcoins @ 1HYak You will be DDoS-ed starting Thursday (April 21) if you don't pay protection fee 20 Bitcoins @ 15Zrn
Attacks never came.

#RSAC
To be continued ...

#RSAC
October 21, 2016

#RSAC
Closer to home ...

#RSAC
Nexusguard Q1 2016 DDoS Threat Report

#RSAC

Thank You

Tin Zaw Director, Security Solutions Verizon Digital Media Services
@tzaw | @verizondigital
www.verizondigitalmedia.com

