SESSION ID: LAB3-W10
How to Design and Operate a DDOS Testing Program

Murray Goldschmidt
Chief Operating Officer Sense of Security Pty Ltd senseofsecurity.com.au @ITsecurityAU

Sharjil Khan
Principal Consultant Redwolf Security Inc redwolfsecurity.com @redwolfsecurity

#RSAC

AGENDA ­ LAB3-W10

SESSION
PART 1 ­ 10 MINUTES
PART 2 ­ 60 MINUTES COLLABORATIVE Q&A
TEA/COFFEE ­ 15 MINUTES

COVERAGE
Just What does DDoS mean in 2019?
3 Interesting DDoS Failure Scenarios Q&A & Live Attack Demos 20 min - 1) Mobile Phone Login DDoS 20 min - 2) TCP Connection DDoS 20 min - 3) Volumetric SYN FLOOD DDoS
15 MIN BREAK -> HANDOUTS + GAME CARDS

COLLAB ­ 45 MINUTES

Let's Play A Game: "ATAK WARZ!" ­ TABLE-TOP ATTACK/DEFENSE CARD GAME Fun for the whole family!

PART 3 ­ 30 MINUTES

DDoS TESTING PROGRAM Misconceptions, Impacts, Responses, Controls, Testing Program

COLLAB ­ 15 MINUTES REVIEW ­ 15 MINUTES

Collaborative Game Playing ­ in reverse
CLOSE SUM IT UP - ACTION PLAN IMMEDIATE, 3 MONTH, 6 MONTH

#RSAC

LAB3-W310 How to Design and Operate a DDOS Testing Program
What does DDoS mean in 2019?

#RSAC
What is a DDoS?

#RSAC
What is a DDoS in 2019 really like?
There's a whole lot of bad!

#RSAC
What is a DDoS in 2019 really like?

#RSAC
What is a DDoS in 2019 really like?

#RSAC
What is a DDoS in 2019 really like?

#RSAC
E! When you think "DDoS", HUG traffic floods come to mind

1.5 TERABIT/SEC!

3 GIGABIT/SEC ­ STILL BAD!

#RSAC
If your defenses don't work, what happens?

Q: If your network is down how do you VPN in? A: Ideally via a back-door VPN admin connection. Q: How do you know who to call? Is this info online? A: Network problems can break help-desk's and wiki's.

Q: Will you get the email alert from your vendor? A: Probably not if networks are down. Q: Can problems be identified quickly? A: They might take hours ­ our teams are dispersed...

#RSAC
How can you know if your defenses will work?
How can you avoid impacts? Testing!

#RSAC
How can you know if your defenses will work?
How can you avoid impacts? Testing!

#RSAC
How can you know if your defenses will work?
How can you avoid impacts? Testing!

#RSAC
Defenses will work to a point ­ what happens when it stops
working?

#RSAC
Defenses will work to a point ­ what happens when it stops
working?

#RSAC
How can you know if your defenses will work?
How can you avoid impacts? Testing!

#RSAC
You need to test multiple attack scenarios

#RSAC
For some reason, the IT Security industry feels it is, unlike with every other industry, it doesn't need to test and verify.
"We get attacked all the time, I see the alerts ­ too many alerts in fact. We don't need to test because I see attackers hammering on the defenses all the time."
What about the attacks you don't see? Do you know what attacks you can handle, which you can't? There are thousands of different kinds of attacks. There are many types of attackers ­ robots, script-kids and really trained adversaries. Can you be sure you can handle all of them?

#RSAC

LAB3-W310 How to Design and Operate a DDOS Testing Program
Collaborative ­ Interesting DDoS Attacks
Example 1 ­Mobile Attack to Login Page (20 minutes)

#RSAC
But DDoS DOES NOT HIGH BANDWIDTH to DDoS effectively
Q: How likely is it that a single 3G Mobile Phone could DoS the main web site of a Fortune 500 company? What about a 4G? Certainly a 5G enabled device poses a considerable threat. What about IoT devices?

#RSAC
Mobile Phone Attack Example 4 megabit/sec
A DoS was performed from a single mobile phone, in a basement, against the main login page of a Fortune 500 (unnamed) company.

Single Attacker
10k Connections
10k Concurrent
Login Requests

LOGIN PAGE OF FORTUNE 500

Q: What do you think
happened, and why?

#RSAC
Mobile Phone Attack Example 4-5 megabit/sec
A DoS was performed from a single mobile phone, in a basement, against the main login page of a Fortune 500 (unnamed) company.

Speed test:
This phone can transmit
up to 14.2 Megabit/sec
Upload (4G)
(site died at <5)

Single Attacker
10k TCP Connections 10k Simultaneous Login Requests
BUT ­ Even though phone could send 14.2 megabit/sec, All that was needed to disable site was 4 to 5 Megabit/sec

#RSAC
Mobile Phone Attack Example 4-5 megabit/sec
A DoS was performed from a single mobile phone, in a basement, against the main login page of a Fortune 500 (unnamed) company.

Single Attacker
10k Connections
10k Simultaneous
Login Requests

Q: Why??

#RSAC
Why? Ideas?
How can a single device, with 4 megabit/sec, disable the login page of a major corporation? How is this possible? What resources were exhausted?

Q:

Could it be the scalability of the back-end authentication system?

A:

That's a possibility! Could be database connection limit, AD limit.

Q:

Could it be the number of concurrent requests the authentication

system could perform?

A:

That's likely too! Most enterprise web servers are set up with

`connection pools' and `thread pools'

#RSAC
How could this abuse have been detected / blocked?
Is it reasonable for a single device, or IP to, rather rapidly, open up 10,000 TCP Connections and start making 10,000 login requests?

Q:

Could a WAF have protected the system?

A:

Sure! If it was configured to. Do you think it was in this case?

Q:

Could there be protections to limit the # of TCP connections a client

can open?

A:

Yes ­ this can be done at many layers ­ DDoS, Firewalls, Load Balancers, WAF's

and even at the web server and application levels. Do you think it was done at

all in this case?

What testing uncovered
 Fortune 500 Company had never previously tested the capacity of their LOGIN page, or any InternetFacing service ­ despite high $ investment in tech.
 After testing, they knew:  How many logins/sec can system could sustain.  At what point should the WAF be engaged to protect the site.
 Implemented transactional monitoring to verify that the Login system worked ­ not just checking the page, but actually automating a login.
 Alerts are now only raised if the login system fails, not every time it is attacked (which are numerous).

#RSAC
Operations teams should only be alerted with a
HIGH SEVERITY alert if the defense controls fail or site is down.
Not every time it is attacked.

#RSAC
Login Flood Attack ­ Showing CPU and Connection Overload
Live Demo Time

#RSAC
Login Flood Attack ­ Showing CPU and Connection Overload

LAB3-W310 How to Design and Operate a DDOS Testing Program
Collaborative ­ Interesting DDoS Attacks
Example 2 ­ TCP Connection Flood DDoS (20 minutes)

#RSAC
Example 2: An attack that almost everyone is vulnerable to

Q:

How bad would it be if there was a DDoS attack:

- That 99% of Internet facing services were vulnerable to

- Used very little network traffic, about 2 to 10 megabit/sec

- Could take out web sites almost instantly

- From a tiny attacker botnet of 200 IP's

- Could take out almost any TCP service in about 1 second...

A:

Sit back and watch...

#RSAC
Do you have something like this on your network?
Q: How many of you have something that looks like this on your network?
 A Firewall with Internet-Facing IP's  NAT (Network Address Translation)
to Internal Network  A Load Balancer "VIP" to a web site

#RSAC
Can you spot the problems? Or a problem?
Q: Q: Can anyone spot what the greatest vulnerability
of this architecture?
Hint ­ it is colored RED.
There are many problems here, but there is a very significant and extremely common vulnerability here.
Can you spot it?

A hint
Let's go back to basic TCP/IP and look at the source port and destination port:

#RSAC
Q: How many TCP connections CAN one IP Address open to another IP address on port 443?

#RSAC
Beyond defense, how would your organization begin to rootcause this problem? Identify what was happening & recover?
Q: What happens if an attacker opens up more than 65535 TCP connections?
A: No more connections can be opened that's what!
Q: Does your organization detect TCP Connection abuse? A: ?
Q: How long would it take to root-cause this problem? A: ?
Q: Do you know what countermeasures are available? A: CDN, Elastic Cloud Scaling, DDoS, Firewalls, Load Balancers +

#RSAC
Example 2: How can you know the REAL limit?
A: Test it!

Q:

The theoretical limit is 65535 ports.

Source port 1 to 65535.

BUT ­ the true number is often less.

Sometimes by 1024 ports and sometimes by thousands more.

How would you find out that limit?

A:

On UNIX systems ports <1024 are typically reserved.

#RSAC
If you know how to strike and where to strike
Consider...
200 clients or attackers on the Internet ... Each opens up 400 TCP Connections
200 attackers X 400 TCP Connections Each
= 80,000 TCP Connections
Is 80,000 > 65,535? Who Wins?
Let's See!

#RSAC
Connection Flood
Live Demo Time

#RSAC
Video of Connection Flood

#RSAC
What are the 2 limits seen?
NAT EXHAUSTION! 65k TCP Connections
CONNECTION POOL EXHAUSTION! <300 connections to server pool from load balancer

LAB3-W310 How to Design and Operate a DDOS Testing Program
Collaborative ­ Interesting DDoS Attacks
Example 2 ­ Volumetric SYN FLOOD (20 minutes)

#RSAC
Let's look at a simple 2 layered DDoS defense system: "Cloud or ISP DDoS Defense" + "Local DDoS Appliance"

ATTACKERS

UPSTREAM DEFENSE VENDORS

DATA CENTERS

APPLICATIONS LOAD BALANCER / WAF's FIREWALL DDoS APPLIANCE ROUTERS

Attackers
Globally Distributed

Launch Attack Scenarios

Users
Accessing Services

Good Requests

3rd Party Vendor Upstream Defense (ISP or CLOUD)

Blocks Attacks?
Passes Good Requests?

?

?

?

?

?

?

?

?

Does having the device or paying a 3rd party to manage DDoS defense#RsSAC mean it will work?

ATTACKERS

UPSTREAM DEFENSE VENDORS

DATA CENTERS

APPLICATIONS LOAD BALANCER / WAF's FIREWALL DDoS APPLIANCE ROUTERS

Attackers
Globally Distributed
Users
Accessing Services

Launch Attack Scenarios

Blocks Attacks?

Good Requests

3rd Party Vendor Upstream Defense (ISP or CLOUD)

Passes Good Requests?

"I'm protected from DDoS because I have a Cloud or ISP DDoS, or CDN, or WAF"

?

?

?

?

?

?

?

?

"I'm protected from DDoS because I have on-premise DDoS appliances and Next-Gen Firewall and IPS and ..."

#RSAC
Let's find out how well it works! Let's TEST!
Upstream DDoS (ISP or Cloud) & On Premise DDoS Appliance

CLOUD TESTING NETWORK

UPSTREAM DEFENSE VENDORS

DATA CENTERS

APPLICATIONS LOAD BALANCER / WAF's FIREWALL DDoS APPLIANCE ROUTERS

Attackers
Globally Distributed

Volumetric SYN FLOOD

Monitors
Measure Site Performance

Simulate Real Users

3rd Party Vendor Upstream Defense (ISP or CLOUD)

Blocks Attacks?
Passes Good Requests?

?

?

?

?

?

?

?

?

Q: Will the attack be detected quickly? Q: Will the attack be blocked quickly and completely? Q: Will the correct alerts, metrics, and logs be generated?

Q: What happens if the attack is not detected? Q: What happens if the attack is not blocked 100%? Q: What if the correct alerts, metrics and logs are not available?

TEST SCENARIO 1: SYN FLOOD VOLUMETRIC DDoS

A SYN FLOOD DDoS Test was performed to test ISP and On-Premise Defenses
Tested at specific traffic levels:
1 Megabit/sec 10 Megabit/sec 100 Megabit/sec 500 Megabit/sec 950 Megabit/sec

Q: Was the attack be detected quickly?

YES

Q: Was the attack be blocked quickly and completely?

NO

Q: Were the correct alerts, metrics, and logs be generated?

NO

MAX LATENCY 3 SECONDS

#RSAC
On-Premise DDoS Activated at 10 Meg/sec ISP DDoS Defense activated at 100 megabit/sec
Controlled DDoS SYN FLOOD Network Test 1 megabit to 950 megabit
Monitors show +3s Spikes

#RSAC
In this case it was the Firewall CPU that was overloaded
It logged so many deny packets it even took out the SIEM

Q:

What can happen if a Firewall is overloaded?

A:

If a Firewall is overloaded, many things may happen:

 Packet Loss (increased latency)

 Too much DENY logging (can overload SIEM)

 Drops established connections

 Drops VPN's

 Impacts VOIP (voice communications impossible)

#RSAC
How can you know if your firewall is vulnerable?
How can you know if your Defenses leak attack traffic?

Q:

What could cause periodic bursts of attack traffic to leak through?

A:

 Defense Configuration: Type of countermeasure being used ­ is it using correct

countermeasure? For SYN FLOOD's there are a few, and they work differently.

 IP Blacklist Timeouts: A blacklist may drop packets for a few minutes ­ after that you might see a short burst of attacker traffic for a short moment!

 Low and Slow attacks that "come in under the radar" ­ don't trigger defenses

Q:

 Do you know what countermeasures your DDoS protection has activated?

 Do you know if it will leak traffic?

 Do you know if this could overload your firewall or other devices?

 Do you monitor firewalls, load balancers, WAF's and services for various overloads?

#RSAC
But after 10 minutes bursts of attack traffic started leaking past the DDoS defense and the Firewall CPU shot to 100%
WHAT TESTING UNCOVERED
 DDoS defenses did activate and begin blocking attackers as expected (good!)
 DDoS defenses leaked attack traffic AFTER 10 minutes
 The firewall was vulnerable to this attack traffic leakage and it's CPU went to 100% and packet loss was seen
 SIEM was overloaded and Operation's couldn't see what was going on.
 Vendor unable to stop all leakage. Vendor defense SOC said attack leakage is "normal" and "expected".

#RSAC
!!!! Don't Forget to Read the Small Print in Your Contracts !!!!

#RSAC
Q: How was this corrected?
A: By tuning three configurations and re-testing

UPSTREAM DEFENSE VENDORS

3rd Party Vendor Upstream Defense (ISP or CLOUD)

Blocks Attacks?
Passes Good Requests?

APPLICATIONS LOAD BALANCER / WAF's FIREWALL DDoS APPLIANCE ROUTERS

DATA CENTERS

?

?

?

?

?

?

?

?

Defense configurations
determine:
 What countermeasures are
enabled  What attacks are detected  When countermeasures
activate  What is blocked or passed
forward

1. ISP was only `rate limiting', not doing SYN FLOOD countermeasure at all ­ was just rate limiting packets.
2. Set a more reasonable SYN Flood defense activation threshold.

1. Tuned Activation Threshold (was too high and did not block upstream leakage)
2. Now no more leakage to Firewall after DDoS activates and if flood gets too large the upstream filters smoothly take over.

1. Activate SYN Cookie feature on Firewall. This saves firewall in the first few seconds of an attack. 95% of Firewalls can do this.
2. Configure Log Throttling (to save SIEM).

#RSAC
Unexpected Consequences ­ It's all connected?
A system view is necessary

Q: How many have a SIEM / Logging System?

Q: How many have Firewalls?

Q: Is it common for Firewalls to log `denies'?

Q: What happens if a Firewall has to log 10k to 20k+ denies every second? A DDoS attack can easily cause that with 10 megabit/sec of traffic.

Q:

Have you benchmarked your SIEM?

Do you have licenses that limit the event rate?

Do you know how many events your I/O Disk systems can handle?

Does your SIEM perform well under heavy load?

... ... ... ... ...

A:

A DDoS Testing Program must take a system-wide view and not a device view ­ the scope must include all

devices in path (Firewalls, Load Balancers, WAF's, Servers) as well as monitoring and logging systems ­

they are part of a connected system.

Lessons learned

#RSAC
 Devices don't operate in isolation, they are part of a system ­ you test the system.
 Without testing you'd probably never get the devices configured optimally. You'd never get the full benefit / ROI from the defenses.
 After testing you can prove you can handle the scenarios you've tested. Without testing, how confident can you be?

Is Cloud different?

While Cloud systems are more scalable, they still are just groups of regular computers processing things.

Some problems are the same. Some are different.

We'll give an example of testing cloud scaling and cloud WAF defenses after the break.

Q:

Does anyone here think that something like the AWS stateful

security group is limitless in its capacity?

A:

Everything has limits ­ everything. The TCP NAT exhaustion we

performed was on AWS. Also, later on more detail.

#RSAC
Cloud scales Cloud also fails Nothing is perfect
-

#RSAC
There are actually MANY MANY other kinds of DDoS attacks beyond high bandwidth packet floods
FOR THE NEXT FEW SLIDES ­ EXPECT TO BE OVERWHELMED -
We are going to show how complex this situation is
Then we'll talk about how to tackle it

#RSAC
There are actually MANY MANY other kinds of DDoS attacks beyond high bandwidth packet floods

#RSAC
For every attack there are many available countermeasures

#RSAC
Q: For volumetric DDoS packet flood attacks, what
countermeasures are common?

#RSAC
Q: For stateful TCP connection attacks, what are the systems
used?

#RSAC
Q: For cryptographic attacks, which exhaust SSL/TLS handshake
capacity, which are the best defenses?

#RSAC
Q: For HTTP and HTTPS Attacks, what are the best defenses?

#RSAC
Confused yet? Overwhelmed?
There are a lot of different kinds of attacks. There are a lot of defense technologies.
No one (normal) can easily answer what kind of defense is best for a certain kind of attack.
We'll give you a few more examples & then suggest a solution ­ a way to make it make sense.

#RSAC
It's not just the kind of attack, it's the `style' of the attack.

#RSAC
It's not just the kind of attack, it's the `style' of the attack.

#RSAC
It's not just the kind of attack, it's the `style' of the attack.

#RSAC
Q: Why aren't these great for many HTTP and HTTPS?

#RSAC
Q: Why aren't these great for many HTTP and HTTPS?

Cloud (and ISP) Packet Scrubbing DDoS has problems with:
 Slow HTTP and HTTPS Requests  HTTPS (decryption) ­ can't see into the payload  HTTP KEEP-ALIVE (one TCP connection shared for many requests)  Doesn't often see replies (it's usually asymmetric)  There are certain kinds of attacks that can be stopped, for HTTP,
certain TLS abuses, but in general the attacks must be very high in rate
to be detected in the cloud ­ usually the site will go down sooner.
Cloud Layer 4:
 Not Layer 7 Aware at all (mainly used for TCP Forwarding)

Public Cloud Scaling
 It CAN scale and Scale and SCALE ­ but you PAY for it! ($$$)  Scaling is not a really defense ­ you always need avoid processing
attack requests  Cloud without DDoS protection also does not survive.
On-Premise:
 Appliances can do pretty well, but if they are not set up for HTTPS
decryption there will be limitations and attacks will go through.  Next-Gen Firewalls strangely do very little at Layer 7 re: DDoS
protection. Even if they have the capability, it is almost never enabled.  IPS can detect many types of attacks, but most IPS do not decrypt
HTTPS. If they do they can go from `red' to green'.

Feels hopeless? Don't Give Up!
DDoS is not one problem anymore than "Security" is a simple thing.
You can break the problem down and deal each attack "category"
& "style"

#RSAC
Break DDoS Down Into Categories
Volumetric (Bandwidth Oriented)
Volumetric (Packet Oriented)
Connection Oriented
Cryptographic Attacks
General Layer 7 Request Oriented
Targeted Layer 7 Application Attacks

#RSAC
Just about to break for coffee!
77

Tea/Coffee Break ­ 15 Minutes

LAB3-W310 How to Design and Operate a DDOS Testing Program
GAME TIME! 45 Minutes

#RSAC
Introducing: Atak Warz!
80

#RSAC
The Rulezzz ­ Attack Cards
81

#RSAC
The Rulezzz ­ Modifiers
82

#RSAC
The Rulezzz ­ Defense Cards
83

#RSAC
The Rules ­ Game Style 1
ATTACKER: Choose 1 attack card Choose 1 intensity card choose 1 distribution card
PLAY THIS
DEFENDER: Find the best defense -> PLAY THIS Find the `worst defense -> DISCUSS THIS
REPEAT for another attack
84

Example 1 - Attacker deploys 3 cards: Attack, Distribution,

#RSAC

Intensity

85

Example 1 - Defender deploys BEST and shows WORST

#RSAC

countermeasure

BEST

WORST

86

#RSAC
Example 2
87

Example 2

#RSAC
Is this the best?

88

Example 2

#RSAC
Or is this?

89

#RSAC

There are EASY and HARD cases here
Consider three different styles of TCP Flood DDoS Attacks:

EASY

MEDIUM

HARD

Attackers: 1 IP Address

Attackers: A Few (100) Attackers Attackers: 1000's (big botnet)

# of TCP Connections: 1000

# of TCP Connections: 1 Million # of TCP Connections: As many as

Rate: All At Once

(10k TCP connections per attacker)

possible

Rate: Over 5 Minutes

Rate: Open 1 TCP Connection

Every Second

Here are the best defenses for each ­ note there is no silver bullet:

DDoS IPS

Load Balancers & DDoS (rare)

SIEM Correlation

Attack

Resources

Technology

Example

Example #RSAC

Scenario
Volumetric (Bandwidth Oriented)
Volumetric (Packet Oriented)
Stateful TCP Connection
Oriented
Cryptographic Attacks
SIMPLE Layer 7 Request Floods
TARGETED Layer 7
Application Attacks

Consumed
 Upstream Internet Carrier Capacity
 Data Center Circuit Bandwidth  Internal Switch Port Saturation
 Packet-Per-Second Processing Capacity
 TCP SYN Queue  Logging Systems
 Stateful Connection Table Memory
 NAT Port Mapping Exhaustion  Load Balancer Connection
Pools  Application Thread Pools
 HTTPS SSL / TLS Transaction Capacity,
 CPU on Load Balancers and  Web Servers
 Web Service Threads,  Load Balancer Throughput,  Outbound Bandwidth,  Application Pools,  Server CPU, Disk I/O, Logging
 WAF's and Layer 7 Inspection  Connection & Thread Pools  CPU, RAM, Disk I/O  Application Databases  Authentication  Logging Systems

Impacted

Impacts

Countermeasures

 ISP Circuits, Routers, BGP, GRE, Firewalls, SIEM, All Services

 Upstream Black Hole - We are unreachable
on the Internet!  ISP links Full ­ All Services Down  Packet Loss ­ All Services Slow

 Cloud Based Layer 7 (Any)  Cloud Based Layer 4 (TCP Proxy)  Cloud Based Packet Scrubbing  On Premise DDoS Appliance  Correlation & Automated Response

 ISP Circuits, Routers, BGP, GRE, Firewalls, IPS, Services like DNS, VOIP and most TCP, Virtualization.

 Firewall CPU to 100%  Dropping Packets  All Services Down

 Cloud Based Layer 7 (any)  Cloud Based Layer 4 (TCP Proxy)  Cloud Based Packet Scrubbing  On Premise DDoS Appliance  Correlation & Automated Response

 Firewalls, Any NAT Device, Layer 4 Proxies, Layer 4-7 Load Balancers, TCP Services (i.e. HTTP, SIP)
 All connection impacts apply to all Layer 7 Attacks

 Firewall connection table full, new users
can't connect to anything behind the firewall  NAT ports exhausted, no new connections  Load balancer not accepting new
connections.

 TCP Correlation & Automated Response  Cloud Based Layer 7  Cloud Based Scrubbing  On-Premise DDoS Appliance  On-Premise Layer 7 Load Balancer

 First Layer 7 TLS Handoff

 TLS limit reached (throughput or license) -

 E.g. WAF's, Load Balancers, Web Most users can't connect to applications on

Servers, Mail Servers, SSL VPN that load balancer

 IPSEC VPN's

 SSL/TLS is using 100% of CPU

 Correlation & Automated Response  Cloud Based Layer 7 DDoS  Cloud Based Layer 7 Packet Scrubbing  On-Premise IPS  On-Premise DDoS Appliance

 SIEM Correlation & Automated Response

 WAF's, Load Balancers, Web Servers, Application Servers

 Web servers are overloaded, site is failing. A Load Balancer VIP might be overloaded or an application CPU is at 100%

 Cloud Based Layer 7 WAF  On-Premise Layer 7 DDoS  On-Premise WAF  On-Premise DDoS Appliance

 Cloud Based Packet Scrubbing



CDN Bypass, Cloud WAF Bypass, On-Premise WAF's, Authentication Gateways, Dynamic Pages, Databases, Application Features (e.g. Login,
Registration, Forgot-Password,91
and Search features)


  

Application overloaded, database connection and request rate maximized. Users can't login. Site is down. Application exploited, data leak possible Application crawled, content data scraped Unusual user transactions behavior

 SIEM Correlation & Automated Response  Well Tuned Load Balancer / WAF  Cloud Based Layer 7 WAF  Web Server Hardening  Defensive Application Logic

#RSAC
Summing it up - Is there a silver bullet? A single vendor that solves all problems? Is there ever one?
What we've covered so far:
1. DDoS IS Volumetric (that you knew)
2. DDoS IS more than Volumetric (Web Login Attack, TCP Attack) (Bandwidth doesn't matter)
3. Even within one kind of attack there are many variations ­ just like baseball pitches. i.e. the `Style / Sophistication'
4. You'll need multiple defense technologies & controls

LAB3-W310 How to Design and Operate a DDOS Testing Program
Misconceptions and Why Test?

#RSAC
Misconceptions
"My organization has multiple layered defenses including: CDN's, Public Cloud, Lambda Functions, Cloud WAF, Cloud DDoS, On-Premise DDoS, Advanced Firewalls, The Latest WAF's and more ­ I have so much security and my teams are great I am confident I don't need to test it."
- CISO with a really big budget
(sounds complicated ­ are complicated systems easier to configure and maintain?)

#RSAC
Misconceptions
" I'm Safe BECAUSE .....
96

#RSAC
Misconceptions
" I'm Safe BECAUSE .....
97

#RSAC
Misconceptions
" I'm Safe BECAUSE .....
98

#RSAC
Misconceptions
" I'm Safe BECAUSE .....
99

#RSAC
Misconceptions
" I'm Safe BECAUSE .....
100

#RSAC
Misconceptions
" I'm Safe BECAUSE .....
101

#RSAC
Misconceptions
" I'm Safe BECAUSE .....
102

#RSAC
Misconceptions
" I'm Safe BECAUSE .....
103

#RSAC
Misconceptions
" I'm Safe BECAUSE .....
104

#RSAC
Misconceptions
" I'm Safe BECAUSE .....
105

#RSAC
Misconceptions
" I'm Safe BECAUSE .....
106

#RSAC
Misconceptions
" I'm Safe BECAUSE .....
107

#RSAC
Misconceptions
" I'm Safe BECAUSE .....
108

LAB3-W310 How to Design and Operate a DDOS Testing Program
How to Develop Your DDoS Testing Program

An example of a DDoS testing program and improvements it #RSAC can bring a cloud environment
https://www.redwolfsecurity.com/resources/case-study-bank-new-york-mellon-crown-peak-amazon-aws/

#RSAC
Baseline architecture ­ Cloud Front + ELB + Auto-Scale Group

#RSAC
Auto-scale to 15 instances instantly

Elastic Load Balancer (ELB) backlog in request queue

#RSAC

Requests not being handled

60 Second Lag between auto-scale trigger and new instances #RSAC 60 second downtime too

Auto-Scaling is not a DDoS defense ­ 30 instances

#RSAC

Capacity should not be used to service attack requests

#RSAC
Hardened Architecture

#RSAC
Blocking 9 million requests/minute

#RSAC
175 (of 200) attackers blocked

Over 1.3 million SSL sessions

#RSAC

Almost 20 Gigabit/sec SSL

#RSAC
20 Gigabit/sec SSL attack ­ no pressure on Auto Scale Group

#RSAC
Example of DDoS DDoS & Cloud (AWS) Testing Program
Tuning achieved 100x improvement over baseline

#RSAC
Key Elements of a DDoS Testing Program

DISCOVERY

Available Defense Systems
What defense systems do you have? On-premise, In Cloud

Defense Capabilities
What are the defense configurations? What is enabled? What is not?

Services to Protect
What do you need to protect? What are mission critical services?

Application Attack Surface
What features, like forms, are likely to be attacked?

TESTING

Baseline Service
Performance
Find out how scalable the actual service Do load testing and baselining

Test Local Defenses
Router, DDoS Appliances, Firewalls, Load Balancer, WAF, IPS, etc...

Test 3rd Party Vendors
CDN, Cloud DDoS, Cloud WAF, Managed Monitoring & Detection

Service Monitoring
HTTP(s), DNS, TCP, Routes BGP, SMTP, IPSEC and more

IMPROVE

Defenses
Tighten Configurations Fill in Control-Gaps

Operational Response Skills
Cyber-Drills, Online Run-Books, Cross-Silo Communications

Processes
Incident Response Procedures, Triggers & Correlation Rules

Automation
Scheduled Continuous Automated Testing Detect Regressions Automatically

#RSAC
Key Elements of a DDoS Testing Program

DISCOVERY

Available Defense Systems
What defense systems do you have? On-premise, In Cloud

Defense Capabilities
What are the defense configurations? What is enabled? What is not?

Services to Protect
What do you need to protect? What are mission critical services?

Application Attack Surface
What features, like forms, are likely to be attacked?

Identify Defense Elements

Available Defense Systems
What defense systems do you have? On-premise, In Cloud

 What defense technologies do you have  In Cloud  On Premise  Built into the applications themselves
 Inventory should contain:  Is it on-premise or off-premise  The kind of defense it is (DDoS Scrubbing, WAF, ...)  Vendor and key contact  Operational Subject-matter-expert  Where do logs, alerts, and metrics go

#RSAC

Internet
Public/Private CDN WAF Scrubbing ISP ACL Traffic Shaping Alerting Scrubbing
Operations Teams (NOC / SOC / APP)

Identify Defense Elements

Available Defense Systems
What defense systems do you have? On-premise, In Cloud

Attack Agents (hundreds)
Monitors
`Good' Simulators

CLOUD
Direct attack

ISP(s)

Circuits Circuits Peering Backbone

Data Center Infrastructure Routers DDoS Appliances
Firewalls
IDS/IPS
Load Balancers

COMMON PROBLEMS UNDER DDOS CONDITIONS

CLOUD:

ISP:

INFRASTRUCTURE:

Alert if under attack? Accurate attack characterization? Able to list attacking IP's? Slow activation time? False positives? Over-mitigation? Leaking attack traffic? HTTPS Mitigation? White listing good traffic? Null-routing / BGP failure? SLA met? High latency? Monitoring capability?

Multiple ISP Route attractiveness? Attack notification? Accurate attack characterization? Time to activate scrubbing? Time to activate ACL's? Attack size limits? White listing good traffic? Able to list attacking IP's? Circuit BGP flapping? Circuit saturated? Good communication? SLA's met? Monitoring capability?

PPS Limits? Connection table limits? SSL/TLS limits? CPU 100%? Device access during DDoS? ACL effective? Attack size limits? White listing good traffic? Breaking applications? Accidental mitigation? False positive?

SERVICES:
LB Rate limiting? Connection limits? Latency problems? Service availability? Internal logging & alerting? Attack size limits? White listing good traffic? CPU 100%? SSL limits?
Local Agents (e.g. test lab)

Services DNS Servers Web Servers Applications Databases Authentication Mainframes

#RSAC

How are they configured?

Defense Capabilities
What are the defense configurations? What is enabled? What is not?

 The actual protection depends on the configuration  For each defense system, document the features/capabilities  Find out what is enabled and disabled  Organizations often use only 10% to 20% of what a defense device is
capable of!

Traffic Level Controls [ ] Block if Source IP sends high packet rate above threshold [ ] Block if Source IP sends high bitrate above threshold
Packet Challenge [ ] Challenge SYN packets if SYN rate to destination above threshold [ ] Challenge UDP DNS requests if UDP rate to destination above threshold [ ] Reset TCP idle TCP sessions
Protocol Validation Controls [ ] Block request if source fails TLS protocol handshake [ ] Block request fails protocol checks [ ] Block request if buffer overflow attempt detected

Reputation and Geographic Blocking [ ] Block if Source IP geolocation matches blocked locations [ ] Block if Source IP has bad IP reputation (e.g. TOR, known botnet)
Signature Blocking [ ] Block Injection Request Patterns [ ] Block Cross-Site Scripting Patterns [ ] Block Bad User-Agents
Behavior Blocking [ ] Block high client request rates [ ] Block repetitive requests for same resource [ ] Block very slow but repetitive authentication attempts ...

#RSAC

Services to protect and test

Services to Protect
What do you need to protect? What are mission critical services?

 Identify the top mission critical services ­ these are what you need to
protect ­ these are what you must test.  Inventory should show:
 Name of service  Where / how it is hosted  Why it should be tested / importance  How to reach it ­ URL's & IP's, Ports  What authorization is needed to test it  Any testing limits

#RSAC

Application Attack Surface

Application Attack Surface  If someone were to attack this application, how would they do it?

What features, like forms, are likely to be

What features would they attack?

attacked?

 Browse your web-sites and look for interesting `features':

 Authentication/login pages

 Dynamic web pages that call databases

 Search features and other forms

 API Call URL's (e.g. personalization API's)

#RSAC

Homepages are often cached and optimized and doesn't cause a lot of server load or impact

Processing login forms can't be cached, and are resource intensive API calls and database lookups.
Often the forms post to a completely different URL.

#RSAC
Put it all together on a single diagram
Note ­ this is not a network diagram

Jason A. [phone ] APP Expert
SOC Operations [phone #]

SOC Operations [phone #]

Vendor SOC [phone]
SOC Manager [phone #]

We need to identify the following and understand their relationships. [  ] Cloud Monitoring [  ] Cloud Defenses [  ] Data centers & Connectivity [  ] Infrastructure devices [  ] On-Premise Defenses [  ] Controls we will test [  ] IP's and URL's we will test [  ] IP's and URL's we will monitor [  ] Internal monitoring:
Logs, Alerts, Metrics [  ] EXERCISE PARTICIPANTS
& THEIR ROLE IN EXERCISE
E.g. Who will watch the Firewall? E.g. Who will watch the Services?

Start with a network diagram

#RSAC

... Realize it won't show key information you need Network Diagrams often lack key information required: [  ] Cloud Monitoring [  ] Cloud Defenses [  ] Data centers & Connectivity [  ] Infrastructure devices [  ] On-Premise Defenses [  ] Controls we will test [  ] IP's and URL's we will test [  ] IP's and URL's we will monitor [  ] Internal monitoring: Logs, Alerts, Metrics [  ] EXERCISE PARTICIPANTS & THEIR ROLE IN EXERCISE
E.g. Who will watch the Firewall? E.g. Who will watch the Services?

#RSAC
DDoS Testing Program ­ Key Testing Areas

TESTING

Baseline Service
Performance
Find out how scalable the actual service Do load testing and baselining

Test Local Defenses
Router, DDoS Appliances, Firewalls, Load Balancer, WAF, IPS, etc...

Test 3rd Party Vendors
CDN, Cloud DDoS, Cloud WAF, Managed Monitoring & Detection

Service Monitoring
HTTP(s), DNS, TCP, Routes BGP, SMTP, IPSEC and more

The importance of baselining

Baseline Service
Performance
Find out how scalable the actual service Do load testing and baselining

 Load test your services and find the 50% and 70% CPU utilization points  TEST WITH LEGITIMATE REQUESTS (this is not an attack test)
 START LOW Start with low request rates per connection ­ i.e. 1 request/sec from a small number of clients ­ 100 to 500.

 RAMP UP SLOWLY ­ RECORD IMPACT Measure Client and Server

 CLIENTS Measure request latency, user-experience

 SERVER  Measure CPU Cores, Overall CPU, TCP Connections, Request Rate, Memory
Utilization, Application Performance Stats

#RSAC

#RSAC
The importance of baselining

Baseline Service
Performance
Find out how scalable the actual service Do load testing and baselining

Remember the example of a single mobile phone to a login page? Baselining was done to precisely identify service capacity and tune defenses.

If you have a service that is not very scalable ­ you should know this and defend it accordingly!

Single Attacker
10k Connections
10k Simultaneous
Login Requests

Test your local DDoS, Firewall, Load Balancers, WAF, and even your #RSAC servers ­ they have to handle leakage and initial surge of requests
Test Local Defenses
Router, DDoS Appliances, Firewalls, Load Balancer, WAF, IPS, etc...

ID Attack Vector & Performance

1

Connection Flood No impact to levels tested

2

Slow Read WAF did not block attack and server was impacted

3

Slow Loris No impact to levels tested

Slow Write 4 WAF did not block attack and likely that WAF itself began
to be overloaded.

SSL Flood 5 No impact to levels tested but may have reached a
throughput limit.

6

WAF Overload Attempt to overload the CPU of the WAF.

Comprehensively testing kind of attack scenario can take between 5 minutes and 45 minutes.

#RSAC
Test your 3rd party vendors separately
Test 3rd Party Vendors
CDN, Cloud DDoS, Cloud WAF, Managed Monitoring & Detection
 Work WITH your vendors. They are not the enemy.  Share your test plan and expectations with them ­ confirm they agree your
expectations match the service they are offering.

#RSAC
Tips for testing 3rd party vendors

Test 3rd Party Vendors
CDN, Cloud DDoS, Cloud WAF, Managed Monitoring & Detection

 Make sure to get authorizations/approval from the 3rd party vendors.
 Check the vendors acceptable use policy / testing policy.  You legally can't launch most types of cyberattacks against most vendors
without approvals!

 Vendors are not the enemy! They are part of your defense system  Work WITH your vendors ­ don't expect things to work perfectly the first time.  The truth is, 70% to 80% of 3rd party vendor tests fail the first time!  But most unsatisfactory outcomes are easily remedied.

 That's one of the great values of testing!

#RSAC
Test your network monitoring systems

Service Monitoring
HTTP(s), DNS, TCP, Routes BGP, SMTP, IPSEC and more

 When you do a DDoS test, your operations teams should be monitoring the
systems in path  Network monitoring, device health, service health  Connection counts, request rates, latency, availability, ...
 The teams ability to diagnose problems depends on their ability to see the
situation clearly.

#RSAC

#RSAC
You're not just testing a device, vendor, or process. You're actually testing a scenario against some defense controls.

Defenses
Tighten Configurations Fill in Control-Gaps

Q: What if ____ happened? What would happen?

A: It depends entirely on your controls:

Technical controls: detection, defense

Process controls: run-books, incident response plans

People: Teams and vendors, their knowledge, experience, communications

#RSAC
Don't focus on the `device' ­ focus on the configuration and controls of the device

Q:

If you turned OFF your Email SPAM filter ­ would you get more SPAM?

A:

Of course! No SPAM filter means no SPAM CONTROL, and SPAM gets through!

Q:

If you turned OFF your Anti Virus filter ­ would you get more viruses?

A:

Obviously no AV

Q:

If you turned of a specific WAF capability ­ say SQL Injection blocking, then...?

A:

Obviously SQL injection attacks would make it through to the web servers.

#RSAC
It's the defense and controls that matter

Q:

If your Cloud or ISP DDoS vendor hasn't enabled TCP FLOOD protection...?

A:

Then they won't be able to stop TCP FLOOD's well.

Q:

If your DDoS system does not have any SSL/TLS protocol protections then ...

A:

I will be more vulnerable to SSL/TLS attacks.

Q:

Do you know what actual defense controls protect your services?

A:

... If not ­ that's something to do! Don't stay at the `device' level ­ dive in and

map different kinds of attacks to the available countermeasures.

#RSAC
Remember your operational response team is what you rely on
when something goes wrong ­ they need to know:

Operational Response Skills
Cyber-Drills, Online Run-Books, Cross-Silo Communications
END TO END TOPOLOGY Internet / Cloud Network Diagram
(including cloud monitoring)
+ Data Center Connectivity
(ISP's / Carriers) +
Infrastructure (devices under test or in path)
+ Services Tested (down to IP and URL's tested)

PEOPLE & ROLES & EXPERTISE
For each item on the left: Who monitors it?? Who is the expert?

Vendor

SOC

Responsible
Participating on bridge. Announce changes they make.

Responsible
Monitor defense Systems

NOC

APP

...

Responsible
Monitor routers and firewalls

Responsible
Monitor load balancers and application servers

Responsible ...

#RSAC
DDoS Testing Program ­ What you are improving

IMPROVE

Defenses
Tighten Configurations Fill in Control-Gaps

Operational Response Skills
Cyber-Drills, Online Run-Books, Cross-Silo Communications

Processes
Incident Response Procedures, Triggers & Correlation Rules

Automation
Scheduled Continuous Automated Testing Detect Regressions Automatically

 After every test go through the above areas and see how each can be improved.  For each improvement you make ­ document how it can be measured.  You want to be able to show capability improvements over time

#RSAC
Before you run a DDoS test exercise ­ Remember!

PREPARE!

Document Test System

Network diagram Defense infrastructure (devices) Monitoring information Vendors Operational people / teams

Services Tested
Document the services being tested ­ the business services and how they are protected. List URL's, domain names, data center names, IP's ­ to make sure everyone knows exactly what is being tested. Specify any testing limits / restrictions.

Who and What is being tested? When?

Create Test Plan Authorizations

There are many attack scenarios ­ start with simple ones, not complex ones.
Select test scenarios which. Map 1:1 to the controls being tested.
That is, the device features.

You must obtain authorization for testing as per 3rd party vendor policies.
This generally includes: - Defense vendors - Hosting Providers - Asset Owners - ISP's if loading >70% circuit size

Schedule
DDoS testing exercises can be 4-6 hours long and are usually quite realistic and are run as cyber-drills.
Usually late night.
Some exercises are run during business hours ­ for SOC training.
Device optimization tests can be done at any time in labs, or with small numbers of attackers and control over traffic levels to not impact production systems.

Deliver Exercise!
This is not a pen test!
Run as a cyber-drill with operations whenever possible.
Active participation is strongly recommended!
Eventual goal of automation and automatic verification.

LAB3-W310 How to Design and Operate a DDOS Testing Program
WHAT YOU SHOULD DO NEXT: IMMEDIATELY 3 MONTHS 6 MONTHS

Practical Application

#RSAC
Apply What You Have Learned Today
Next week you should: ­ Characterize your environment
o ID all the elements that affect your THREAT PROFILE o Devices & services that COULD be a target o All the infra in-front & behind the targeted systems
(Routers, Firewalls, WAF's, Databases, etc) o Ops monitoring systems (log collection, alerting, metrics
collection, both local & cloud). o 3rd Party Vendors & 3rd Party Techs (e.g. ISP DDoS Service,
ISP DDoS Service,)
153

#RSAC
Apply What You Have Learned Today
In the first three months following this presentation you should: ­ TECH, PEOPLE & SUPPLY CHAIN
o Identify capabilities for each element. o 'technically capable' activated &
configured! o Identify alerts, evidence, & metrics that will
be generated. o Identify how/where they are accessed.
­ TARGETS
o Build a test plan, including targets & vectors
154

#RSAC
Apply What You Have Learned Today
In the first three months following this presentation you should:
­ TARGETS
oStart building a test plan, with relevant targets & vectors
155

#RSAC
Apply What You Have Learned Today
Within six months you should: ­ Test & Retest:
o Executed First Test, Identified Gaps, Resolved and Retest
­ Vuln Mgt Program
oShould formally incl DDoS Testing
­ Expand on Frequency & Coverage.
oContinuous Monitoring, oHigher Frequency in-depth tests oFocus on Apps!
156

#RSAC
Take a strategic, Programmatic view

Project

Month

M1

M2

M3

M4

M5

M6

M7

M8

M9

M10 M11

Discovery & Monitoring Application Baselining

Continual Edge Discovery & Monitoring

2w-8w

2w-8w

External Attack Simulation

3w-9w

3w-9w

Internal Monitoring Integration

6w-12w

Strategic Review

1w-4w

1w-4w

Training (as needed)

1-2d

1-2d 1-2d

1-2d

1-2d

1-2d

Internal Attack Scenario

4w-10w

Re-Testing & Automation

1w-4w

2w-8w

Modeling & Response

1w-4w

1w-4w 1w-4w

1w-4w

#RSAC
Question Time
murrayg@senseofsecurity.com.au sharjil.khan@redwolfsecurity.com
159

