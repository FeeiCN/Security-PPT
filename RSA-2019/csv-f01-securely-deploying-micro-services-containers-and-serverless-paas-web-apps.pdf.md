SESSION ID: CSV-F01
Securely Deploying Micro Services, Containers & Serverless PaaS Web Apps

Murray Goldschmidt
Chief Operating Officer Sense of Security @ITsecurityAU

#RSAC

#RSAC

Serverless,

CI/CD Integration for

1 Microservices and

Automated Security

A

Container Security

End to End

G

Key Implications for Vulnerability

E

2 Penetration Testing 4 Management

N

Programs

Continuous

D

Key Security features Monitoring,

A

3 for Container

Governance &

Deployments

Compliance Reporting

2

#RSAC
Are Containers As Good as it Gets?
Cloud containers are designed to virtualize a single application
*** Modified *** https://searchcloudsecurity.techtarget.com/feature/Cloudcontainers-what-they-are-and-how-they-work
3

#RSAC
As Good as it Gets?
e.g., you have a MySQL container and that's all it does, provide a virtual instance of that application.
*** Modified *** https://searchcloudsecurity.techtarget.com/feature/Cloud-containerswhat-they-are-and-how-they-work
4

#RSAC
As Good as it Gets?
Containers ***SHOULD*** create an isolation boundary at the application level rather than at the server level.
*** Modified *** https://searchcloudsecurity.techtarget.com/feature/Cloudcontainers-what-they-are-and-how-they-work
5

#RSAC
As Good as it Gets?
This isolation ***SHOULD*** mean that if anything goes wrong in that single container (e.g., excessive consumption of resources by a process) it only affects that individual container and not the whole VM or whole server.
*** Modified *** https://searchcloudsecurity.techtarget.com/feature/Cloudcontainers-what-they-are-and-how-they-work
6

#RSAC
7

#RSAC

Container Security ­ Tech Neutral

Security Requirements Addressed By

Intrinsic Security of the Kernel Attack Surface Reduction

Supply Chain Risk Mgt/ Vuln Mgt/ CaaS
Hardening/Config Mgt/Vuln Mgt

Container Configuration

Configuration Management

Hardening of the Kernel and

Hardening

how it interacts with Containers

8

#RSAC
Monolithic vs Microservices Architecture
9

#RSAC
Monolithic vs Microservices Architecture
10

#RSAC
Monolithic vs Microservices Architecture
11

#RSAC
Monolithic vs Micro Services (API Centric)
https://developer.ibm.com/courses/monolithic-architecture-v1e2rsus-microservices-architecture-dwc024/

#RSAC
Monolithic vs Micro Services (API Centric)
https://developer.ibm.com/courses/monolithic-architecture-v1e3rsus-microservices-architecture-dwc024/

#RSAC
Example: Microsoft eShop Reference Architecture
14

#RSAC
Example: Microsoft eShop Reference Architecture
15

VM vs. Containers (where the abstraction occurs)

VM
Application Dependencies
Guest OS

VVVVV MMMMM

VVVVV MMMMM
Hypervisor 2

Hypervisor 1

Host OS

Hardware
Type1 ­ Bare Metal
Virtualisation

Hardware
Type 2
16

Contain er
Application ABC
App. Deps.

c CCCC

ooooo

c o n t

c Contont.

nt.ContCo .n t

nC t.ontCo .n t

nC t.ontCo .n t

nC n to t .n N t N

1234N

Dep 1

Dep 2

Container Engine

Host OS

Hardware

Containerisation

#RSAC

#RSAC
17

#RSAC
18

#RSAC
19

#RSAC
20

#RSAC
21

Developers

#RSAC
22

Hackers

#RSAC
23

Hooking Lowest Wins

#RSAC
24

North-South & East-West Attacks and Pivots

#RSAC
25 https://neuvector.com/network-security/securing-east-west-traffic-in-container-based-data-center/

#RSAC
Break-In
26

#RSAC
Entry Point is usually a "Pin Hole" issue
For example a known application issue 27

#RSAC
28

#RSAC
Containers ­ The "Contained" Challenge

IF you can Break-In

http://www.marvinfrancismaninacage.com/

29

You then Need to Break-Out

#RSAC
Break-Out

<goWest

goEast>

30

#RSAC
Either Find a Container Vuln & Exploit
31

#RSAC
Recent Container Vulnerabilities
https://brauner.github.io/2019/02/12/privileged-containers.html
32

#RSAC
Recent Container Vulnerabilities
https://brauner.github.io/2019/02/12/privileged-containers.html
33

#RSAC
Recent Container Vulnerabilities
34

#RSAC
Or - Living off the Land
35

#RSAC
Page 31

#RSAC
Page 32

#RSAC
38

#RSAC
39

#RSAC
40

Container TTL

#RSAC
41

#RSAC
Content Slide Layout
Page 42

#RSAC
Content Slide Layout
Page 43

#RSAC

How to Upgrade your Vuln Mgt Program

What to expect from a Pen Test
Supply Chain Risk

Implications for CaaS
DevSecOps

44

#RSAC
Pen Test ­ Mechanical Attack vs Knowledge & Finesse
45

#RSAC
Monolithic vs Microservices Architecture
46

#RSAC
47

#RSAC
48

#RSAC
49

https://neuvector.com/run-timecontainer-security/
50

#RSAC

#RSAC
51

#RSAC
52

#RSAC
53

#RSAC

Load Balancing

Perimeter Public Functions

54

#RSAC
55

Hack Transformation

#RSAC
56

https://neuvector.com/networksecurity/next-generationfirewall-vs-container-firewall/
57

#RSAC

#RSAC
Security Testing Needs to Go Down The Stack
User Interface (WebApps, forms, logons, API's) Framework (Struts, Spring, .NET) Language (Java, PHP, .NET) AppServer (IIS, Apache, Nginx)
Process UI (Container, presentation layer) Process App (Container, application processing)
Process BackEnd (Container, database) Operating System (Linux, Windows)
Clustering/Orchestration (CaaS, Swarm, Kubernetes) Networking (SDN, SecGroups) Cloud Platform Core Infrastructure
58

#RSAC
Finesse
59

#RSAC
60

#RSAC
61

#RSAC
62

There are Pen Tests & There are Pen Tests!

#RSAC

Lower Cost

More considered

Predictable

Requires expert capability, R&D

Even if a Web App/Service Pen Test Requires understanding of the full not suitable for current technologies stack incl implications of -aaS

Doesn't really assess the threats

Requires persistence in an ephemeral setting

More North-South than East-West Yes ­ it will cost more

Check Box

Assurance, Validation & Compliance
63

#RSAC
Blue Team: Key Steps to App Container Security
1 End-to-End Vulnerability Management 2 Container Attack Surface Reduction 3 User Access Control 4 Hardening the Host OS & the Container 5 SDLC Automation (DevOps)
64

#RSAC
Solutioning 1 End-to-End Vulnerability Management
65

Automated Vuln Mgt

#RSAC

SHIFT LEFT

Build
· API's & Plug-ins · Third Party
Components · Vuln Mgt
Automation

Registry
· Automated Scan of
Pub/Priv Registry

Image adapted from Qualys materials
66

Host
· Compliance Scanning · OS · CaaS

Runtime
· Audit logging · Event logging

#RSAC
67

#RSAC
Solutioning 2 Container Attack Surface Reduction
68

#RSAC
Solutioning 3 User Access Control
69

#RSAC
Solutioning 4 Hardening the Host OS & the Container
See NIST SP 800-190 and various others incl https://www.cisecurity.org/benchmark/docker/
70

#RSAC
Solutioning 5 SDLC Automation (DevOps)
71

#RSAC

Recap

Serverless, 1 Microservices and
Container Security

Key Implications for 2 Penetration Testing
Programs

Key Security features

3

for Container Deployments

CI/CD Integration for Automated Security
End to End Vulnerability 4 Management
Continuous Monitoring, Governance & Compliance Reporting

72

Apply What You Have Learned Today ­

#RSAC

Exec/Procurement

Next week you should:
­ Reset your review criteria for Penetration Testing ­ Explicitly incorporate testing of Cloud Technologies into your Vuln Mgt Program

In the first three months following this presentation you should:
­ Review suppliers' capability to test Cloud Technologies ­ Develop the Blue Team side of the equation ­ Have A functional Shift Left feature in your Vuln Mgt Program for Cloud

Within six months you should
­ Have performed an effective Penetration Test on your Cloud investment ­ Fine tune your blue team response to cloud technology attacks

73

#RSAC
Apply What You Have Learned Today ­ Pen Testers
Next week you should:
­ Shortlist all the relevant cloud technologies in use by your clients ­ Re-calibrate your approach to test PaaS and Container
In the first three months following this presentation you should:
­ Demonstrate the ability to breakout of containers ­ Demonstrate the ability to live off the land
Within six months you should
­ Perfect methods for persistence in highly dynamic environments ­ Determine how to integrate Pen Test with client Blue Team (Purple Team)
74

Murray Goldschmidt Chief Operating Officer Sense of Security
murrayg@senseofsecurity.com.au
Office: +61 2 9290 4444
Mobile: +61 422 978 311

