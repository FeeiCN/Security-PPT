SESSION ID: STR-F03
Mercedes-Benz and 360 Group: Defending a Luxury Fleet with the Community

Guy Harpak
Head Of Product Security Mercedes-Benz R&D Tel-Aviv Ltd.
1

Yuankai Chen (filling for Minrui Yan)
Security Research, Sky-Go Team 360 Technology Group Co. Ltd.

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC
360 Group
Research Process & Results

#RSAC
Who We Are
26

Who We Are
· No. 1 market share in Web browser, Mobile security, PC security in China · The biggest cyber security company in China · 360 discovers 40+ APT groups targeting China · 15 Security Teams with focuses in different technical areas
· Anti-APT, Antivirus, iOS, Android, Windows, IoT, Car and so forth
27

#RSAC

Who We Are
· Skyo-Go Team is a connected car security team established in 2014 · Focus on research, evaluation and defense for Connected Cars · 75% market share on Cybersecurity of Connected Cars in China · Notable Researches
· 2014 Tesla & BYD Connectivity Functionality · 2016 Tesla Autopilot System · 2017 CAN-Pick (CAN-Bus evaluation platform, published in Black Hat USA 2017) · 2018 VADS (Vehicle Active Defense System for CAN-bus)
28

#RSAC

Security Solutions for Connected Car
Security operations center Connectivity communication security protection Vehicle smart terminal security protection ECUCAN bus security protection
29

#RSAC
· Security operations center
· Car firewall (Security LTE module) · Security communication protocol stack
· In-Vehicle IDPS · ECU firmware security scanner · CAN-Bus visual analysis platform (CAN-Pick) · CAN-Bus misbehavior detection (VADS)

#RSAC
What We Have Done

60+
Patents

7
Security standards

10+
International security
conference

6
National project

6
Joint lab

6
Years of annual report

30

#RSAC
How We Start A Research
31

Research Procedure
1. Information collection a. Architecture of Target (Figure out how it works) b. Analyze the attack surfaces of the target
2. Design attack chains to achieve the goal a. Identify the key components
3. Build the minimum testbench for low cost test a. Source the key components b. Make it work!
4. Find a successful attack chain 5. Test with real cars
32

#RSAC

Attack surfaces of Connected Cars
· Cloud Side
· Car Backend Services · Communication Channel
· Vehicle Side
· GNSS · Charging System · Smart ECUs
· Infotainment System · Telematics Control Unit · Autonomous driving
· Sensors
· V2X
· OBU
· Road Side
· RSU (Traffic light)
33

#RSAC

#RSAC
Example of potential Attack chains on cars
1. In-vehicle infotainment system 2. Telematics Control Unit 3. Charging System 4. Backend
34

Attack chains ­ Far field
1. Connect to intranet 2. Classic penetration 3. Re-flash firmware 4. Send arbitrary command
35

#RSAC

Attack chains ­ Near field
1. Wireless access 2. Gain in-vehicle network access 3. Control the Door 4. Kill Car Engine
36

#RSAC

#RSAC
Mercedes-Benz Research
37

#RSAC
Build a Testbench ­ Key components
· Central Screen · Telematics Control Unit · In-vehicle Infotainment System
38

#RSAC
Build a Testbench - Source the key components
39

#RSAC
Build a Testbench - Telematics Control Unit
40

#RSAC
Build a Testbench - In-vehicle infotainment System
41

#RSAC
Build a Testbench - Connection
· Architecture of The Target System · Maintenance Manual · Dismantle a real car
42

#RSAC
Build a Testbench - Against the anti-theft system
· Anti-theft system activated · At least, four different anti-theft warnings found
43

Build a Testbench - Obtain signals from a real car
· Two types of signal: wakeup, anti-theft
· Wakeup signal ­ To keep the device awake · Anti-theft signal ­ To identify the running
environment

#RSAC

44

#RSAC
Build a Testbench - Successful testbench
45

Planned CVEs List
· CVE-2019-19556 · CVE-2019-19557 · CVE-2019-19560 · CVE-2019-19561 · CVE-2019-19562 · CVE-2019-19563

Miss CVE numbers - Daimler

46

#RSAC

#RSAC
Timeline
· Jul 16, 2018 ­ May 21, 2019: Reverse Engineering on 360 Group owned Mercedes-Benz cars · Aug 21, 2019: The findings reported to Mercedes-Benz (360) · Aug 23, 2019: The services shutdown: preventing further effect on MB cars (Mercedes-Benz) · Aug 26, 2019: Initial fix roll out (Mercedes-Benz) · Sep 12, 2019: All access vulnerabilities fixed (Mercedes-Benz) · Oct 23, 2019: Joint workshop (360 & Mercedes-Benz) · Feb 28, 2020: RSA Conference Publication (360 & Mercedes-Benz)
47

Impact of our findings
· Attack chain exploited hardware and software vulnerabilities · Key impact: ability to send standard "remote services" commands
· Unlock the door (was also possible while driving), start engine, open the sunroof · Attack potentially affects China's Mercedes-Benz cars with remote services
· Estimated number of connected cars in China: over 2 million
· No customer impact on connected fleet · All access vulnerabilities were promptly fixed together

#RSAC

48

Scan to Subscribe Technical Report
49

#RSAC

#RSAC
Summary
Global Security

#RSAC

#RSAC
Summary
52

