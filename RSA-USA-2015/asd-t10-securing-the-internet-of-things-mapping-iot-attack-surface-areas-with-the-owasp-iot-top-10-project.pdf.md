SESSION ID: ASD-T10
Securing the Internet of Things: Mapping Attack Surface Areas Using the OWASP IoT Top 10

Daniel Miessler
Security Research HP Fortify on Demand
@danielmiessler

#RSAC

#RSAC
 HP Fortify on Demand  Security Research & Development  Penetration Testing  OWASP Project Leader (IoT, Mobile)
2

#RSAC
The Plan
 Let's Talk About Naming  A Vision of the Future (Universal Daemonization)  Why IoT is Currently Broken  Examples From Research  The OWASP IoT Project  Applying What We've Learned  One more thing...
3

#RSAC
What does it mean?
4

#RSAC
What does it mean?
 [ WIKIPEDIA ] The Internet of Things (IoT) is the network of physical objects or "things" embedded with electronics, software, sensors and connectivity to enable it to achieve greater value and service by exchanging data with the manufacturer, operator and/or other connected devices.
 [ OXFORD ] A proposed development of the Internet in which everyday objects have network connectivity, allowing them to send and receive data.
5

#RSAC
Better Names
 Universal Daemonization  Universal Object Interaction  Programmable Object Interfaces (POIs)  Transfurigated Phase Inversion
6

#RSAC
The Real Internet of Things
7

#RSAC
The Real Internet of Things
8

#RSAC
Universal Daemonization
9

#RSAC
The Current IoT Security Problem
10

#RSAC
The Current IoT Security Problem

network

 services, encryption, firewall, input...

11

#RSAC
The Current IoT Security Problem

network

application

 authN, authZ, input validation, etc.

12

#RSAC
The Current IoT Security Problem

network

application

mobile

 insecure APIs, lack of encryption, etc.

13

#RSAC
The Current IoT Security Problem

network

application

mobile

cloud

 yadda yadda AuthSessionAccess

14

#RSAC
IoT Security is the Worst-of-All-Worlds

network

 services, encryption, firewall, input...

application

 authN, authZ, input validation, etc.

mobile

 insecure APIs, lack of encryption, etc.

cloud

 yadda yadda AuthSessionAccess

IoT

 net + app + mobile + cloud = IoT

15

#RSAC
The Current IoT Security Problem

network

application

mobile cloud

1 + 1 = 5

IoT

16

#RSAC
IoT Security Fail Examples
network application
mobile cloud IoT
17

#RSAC
IoT Security Fail Examples (Authentication)

network application
mobile

 10/10 security systems accept `123456'  Account enumeration  Lack of account lockout

cloud

IoT

18

#RSAC
IoT Security Fail Examples (Update Systems)

network

application

mobile

cloud IoT

 No signing of updates  Download over FTP  Server was world-writeable  Server held ALL products

19

#RSAC
IoT Security Fail Examples

network application
mobile cloud IoT

 10/10 security systems accept `123456'  10/10 security systems with no lockout  10/10 security systems with enumeration  SSH listeners with root/"" access  6/10 web interfaces with XSS/SQLi  70% of devices not using encryption  8/10 collected personal information  9/10 had no two-factor options  Unauthenticated video streaming  Completely flawed software update systems

20

#RSAC
The Need for a Methodology
network application
mobile cloud IoT
21

#RSAC
Mapping IoT Attack Surface Areas
22

#RSAC
OWASP IoT: I1 -- Insecure Web Interface
23

#RSAC
OWASP IoT: I1 -- Insecure Web Interface
24

#RSAC
OWASP IoT: I2 -- Insecure Network Services
25

#RSAC
OWASP IoT: I3 -- Lack of Transport Encryption
26

#RSAC
OWASP IoT: I5 -- Privacy Concerns
27

#RSAC
OWASP IoT: I6 -- Insecure Cloud Interface
28

#RSAC
OWASP IoT: I7 -- Insecure Mobile Interface
29

#RSAC
OWASP IoT: I8 -- Insufficient Security Configurability
30

#RSAC
OWASP IoT: I9 -- Insecure Software/Firmware
31

#RSAC
OWASP IoT: I10 -- Poor Physical Security
32

#RSAC
OWASP IoT Project Goals
1. Understand the main attack surface areas for any IoT device or ecosystem
33

#RSAC
OWASP IoT Project Goals
1. Understand the main attack surface areas for any IoT device or ecosystem
2. As a tester, be able to hit the major issues for each surface area for the product you're testing
34

#RSAC
OWASP IoT Project Goals
1. Understand the main attack surface areas for any IoT device or ecosystem
2. As a tester, be able to hit the major issues for each surface area for the product you're testing
3. As a manufacturer, be able to ensure that you've done your due diligence in security across the main surface areas
35

#RSAC
OWASP IoT Project Goals
1. Understand the main attack surface areas for any IoT device or ecosystem
2. As a tester, be able to hit the major issues for each surface area for the product you're testing
3. As a manufacturer, be able to ensure that you've done your due diligence in security across the main surface areas
4. As a developer, be able to ensure that you're avoiding the top security issues while building your particular component
36

#RSAC
OWASP IoT Project Goals
1. Understand the main attack surface areas for any IoT device or ecosystem
2. As a tester, be able to hit the major issues for each surface area for the product you're testing
3. As a manufacturer, be able to ensure that you've done your due diligence in security across the main surface areas
4. As a developer, be able to ensure that you're avoiding the top security issues while building your particular component
5. As a consumer, ensure you're using the technology safely
37

#RSAC
OWASP IoT Project Goals
1. Understand the main attack surface areas for any IoT device or ecosystem
2. As a tester, be able to hit the major issues for each surface area for the product you're testing
3. As a manufacturer, be able to ensure that you've done your due diligence in security across the main surface areas
4. As a developer, be able to ensure that you're avoiding the top security issues while building your particular component
5. As a consumer, ensure you're using the technology safely
38

#RSAC
OWASP IoT Project Organization
39

#RSAC
OWASP IoT Project (Context-based Recommendations)
40

#RSAC
OWASP IoT Project (Consumer Recommendations)
41

#RSAC
OWASP IoT Project (FAQ)
1. If IoT is just a collection of other technologies, why not just use existing OWASP projects?
42

#RSAC
OWASP IoT Project (FAQ)
1. If IoT is just a collection of other technologies, why not just use existing OWASP projects? (one place, multiple spaces)
2. Why call it a Top 10 List, which is traditionally a list of vulnerabilities?
43

#RSAC
OWASP IoT Project (FAQ)
1. If IoT is just a collection of other technologies, why not just use existing OWASP projects? (one place, multiple spaces)
2. Why call it a Top 10 List, which is traditionally a list of vulnerabilities? (tradition, approachability)
3. Why not have X category, or Y category, or you should move I7 to I2, etc.
44

#RSAC
OWASP IoT Project (FAQ)
1. If IoT is just a collection of other technologies, why not just use existing OWASP projects? (one place, multiple spaces)
2. Why call it a Top 10 List, which is traditionally a list of vulnerabilities? (tradition, approachability)
3. Why not have X category, or Y category, or you should move I7 to I2, etc. (excellent, come help)
https://lists.owasp.org/mailman/listinfo/owasp_internet_of_things_top_ten_project
45

How to Apply This
Concept

#RSAC
Application

46

How to Apply This
Concept
The Internet of Things is not just about sensors and machines. It's about people, and how they will continuously interact with their environments through their personal assistants and Universal Daemonization.

#RSAC
Application

47

#RSAC
How to Apply This

Concept

Application

The Internet of Things is not just about sensors and machines. It's about people, and how they will continuously interact with their environments through their personal assistants and Universal Daemonization.

You now know the future before others do, and can use that knowledge to inform better decisions.

48

#RSAC
How to Apply This

Concept

Application

The Internet of Things is not just about sensors and machines. It's about people, and how they will continuously interact with their environments through their personal assistants and Universal Daemonization.

You now know the future before others do, and can and use that knowledge to inform better decisions.

IoT Security is broken for three reasons: it's worst-of-all-worlds scenario, nobody is paid to secure IoT, and 1+1=5 when it comes to security and complexity.

49

#RSAC
How to Apply This

Concept

Application

The Internet of Things is not just about sensors and machines. It's about people, and how they will continuously interact with their environments through their personal assistants and Universal Daemonization.

You now know the future before others do, and can use that knowledge to inform better decisions.

IoT Security is broken for three reasons: it's worst-of-all-worlds scenario, nobody is paid to secure IoT, and 1+1=5 when it comes to security and complexity.

You can now identify the common causes for the mistakes, and look out for them in projects you consult on.

50

How to Apply This
Concept

#RSAC
Application

The Internet of Things is not just about sensors and machines. It's about people, Know the future before others do, and use that

and how they will continuously interact with their environments through their

personal assistants and Universal Daemonization.

knowledge to inform better decisions.

IoT Security is broken for three reasons: it's worst-of-all-worlds scenario, nobody is paid to secure IoT, and 1+1=5 when it comes to security and complexity.

You can now identify the common causes for the mistakes, and look out for them in projects you consult on.

The OWASP IoT Top 10 Project maps IoT attack surface areas and gives contextual and prescriptive guidance on how to avoid vulnerabilities within each.

51

How to Apply This
Concept

#RSAC
Application

The Internet of Things is not just about sensors and machines. It's about people, Know the future before others do, and use that

and how they will continuously interact with their environments through their

personal assistants and Universal Daemonization.

knowledge to inform better decisions.

IoT Security is broken for three reasons: it's worst-of-all-worlds scenario, nobody is paid to secure IoT, and 1+1=5 when it comes to security and complexity.

You can now identify the common causes for the mistakes, and look out for them in projects you consult on.

The OWASP IoT Top 10 Project maps IoT attack surface areas and gives contextual and prescriptive guidance on how to avoid vulnerabilities within each.

You can now use the OWASP IoT Project as a tangible guide to securing the IoT systems you work with.

52

#RSAC
Other IoT Resources
 Build It Securely Project (connects SMBs with researchers)
 Mark Stanislav and Zach Lanier
 I am the Cavalry (focuses on automotive IoT security)
 Josh Corman
 IoT Firmware Testing Training
 Paul Asadoorian (BlackHat)
53

#RSAC
Just One More Thing...
 OWASP IoT Top 10 Mini-poster !
 Card stock  Two-sided  Covers Top 10 Surface Areas  Available for download as well
54

