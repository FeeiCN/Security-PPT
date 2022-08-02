HACKING THE BRAIN
Customize Evil Protocol to Pwn an SDN Controller
Feng Xiao, Ph.D. student at PennState, Cyber Security Lab Jianwei Huang, Researcher at Wuhan University Peng Liu, Professor at PennState, Cyber Security Lab

What's SDN?

func

func

func

Control Plane
Data Plane

Virtual Switch

Software-Defined Networking (SDN) is an emerging architecture that decouples the network control and forwarding functions.

What's SDN Like Today?
Who are contributing?
· More than 15 popular controllers. · More than 3000 open source SDN projects.
Who are using?
· Data Center · IDC · Telecom ·...

Overview of SDN Attacks
Attack on Control Plane
· Topology tampering · Control channel flooding
Attack on Data Plane
· Switch OS Hacking · TCAM Flooding

APP

APP

APP

Control Plane
Data Plane

Controller

O

N

O

P

E

V

E

T

S

N

C

D

F L

B

O

W

O N F

Pwn It Like A Hacker?
Software-Defined Networks Decoupled Control Plane and Data Plane

Controller

Firewall

LoadBalancing

...

Control Channel

OpenFlow

OVSDB

...

Infrastructure

Switch

Host

...

Pwn It Like A Hacker?
Software-Defined Networks
Our Choice: Custom Attack
Decoupled Control Plane and Data Plane

Controller

Firewall

LoadBalancing

...

Control Channel

OpenFlow

OVSDB

...

Infrastructure

Switch

Host

...

Custom Attack

Custom Protocol Field (CPF) in legitimate protocol interactions
· CPF is controlled by data plane

APP

L

I

B

R

A

R

I

E

Service

S

· CPF will be processed by components

Controller

in the controller

Infrastructure

Custom Attack

Custom Protocol Field (CPF) in

APP

L

legitimate protocol interactions

I B

R

A





CPF results in a semantic gap between

R I

· CPF is controlled by data plane
control plane and data plane

Service

E S

· CPF will be processed by components

Controller

in the controller

Infrastructure

What Can It Cause?
Execute Arbitray SDN Commands Steal Confidential Data Crash/Disrupt Service Disable Network Function ...

Threat Model
We do NOT assume that hackers can have network access to SDN controllers or SDN applications Control channel is well protected by SSL/TLS

Threat Model
We do NOT assume that hackers can have network access to SDN controllers or SDN applications Control channel is well protected by SSL/TLS A compromised host[1] or switch[2]
[1] exploitable if the target network is configured with in-band control. [2] Switches are vulnerable to multiple remote attacks (e.g., Buffer Overflow[CVE-2016-2074]).

Attack Workflow

CPF Injection

APP

... Routing

Link Discovery

Service

O

N

P

E

O

E N F L O W

T C O N F

V S D B

Controller Infrastructure

Attack Workflow

CPF delivery via legitimate protocol interactions
Crafted Protocol Message
CPF Injection

APP

... Routing

Link Discovery

Service

O

N

P

E

O

E N F L O W

T C O N F

V S D B


Controller Infrastructure

Attack Workflow

Payload transformation for final exploitation
Payload in Form 1
CPF delivery via legitimate protocol interactions
Crafted Protocol Message
CPF Injection

APP



... Routing

Link Discovery

Service

O

N

P

E

O

E N F L O W

T C O N F

V S D B


Controller Infrastructure

Attack Workflow

Subvert SDN Controller
Payload in Form N
Payload transformation for final exploitation
Payload in Form 1 CPF delivery via legitimate protocol interactions
Crafted Protocol Message
CPF Injection

APP

Service

... 

Routing

Link Discovery



O

N

P

E

O

E N F L O W

T C O N F

V S D B


Controller Infrastructure

Hack Something Real!

Hack Something Real!

Hack Something Real!

Hack Something Real!

Hack Something Real!

Hack Something Real!

Hack Something Real!
Path Traversal
XXE XSS

Command Execution
Plaintext Key

Evaluation
5 popular SDN Controller · Three open source projects (White-box) · Two commercial products (Black-box)
54 apps
· Analyze 12 protocols · Identify 476 dangerous function calls
19 zero-day vulnerabilities
· Construct 24 sophisticated exploit chains

Impact Analysis
Get System Shell (1 of them) Execute Arbitray SDN Commands (5 of them) Steal Confidential Data (7 of them) Crash/Disrupt Service (11 of them)

0day Profile

Demo
ONOS Remote Command Execution

Conclusions
The first attack that can remotely compromise SDN software stack to simultaneously cause multiple kinds of attack effects in SDN controllers.
The data-plane-based attack surface is actually significantly larger than what has been discovered.
Service-logic-free vulnerabilities in the controller could be exploited in unexpected ways to conquer the difficulty brought in by predefined protocol interactions.

Thanks!
Email : f3ixiao@gmail.com Homepage: http://fxiao.me Twitter: @f3ixiao

