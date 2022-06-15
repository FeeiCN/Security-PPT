Tips and trick from the ICS assessment and pen-testers

Intro ­ Søren Egede Knudsen
· Work experience · 25+ Years in Network & Cybersikkerhed · 11 Years with focus on SCADA cybersikkerhed · 15+ Leadership and business managemnt
· Selected education and certification · Master in Business Administration (MBA) · GIAC-GRID · CCIE · Offensive Security & SANS trainings..
· Adminitrator of the OT security group on LinkedIN
· E-mail sek@egede.co ­ www.egede.co

Intro ­ Mikael Vingaard
· 15 years as "traditional" IT- Security consultant within pen-test, Blue-team, audit and BCP/preparedness.
· Last 6 years within Industrial infrastructure (primary energy + manufacturing) · Build Deception technology (ICS Honeypots)
· GICSP, GRID, IACRB CSSA (Certified SCADA Security Architect) , CISSP ISO 27001 Lead Auditor, BeerISAC and much more..
· Member of "I Am The Cavalry"
· Assisted with "responsible disclosure" to vendors like; Huawei (router), Palo Alto (Firewall), MOXA, Honeywell, Ruggedcom and many others... (more in pipeline).

Agenda
· Why Pen-testing the OT/ICS enviroment? · IT vs OT pen-testers · Experiances from the field · What to ask and expect from the OT assessment & pen-test

Why Pen-testing the OT/ICS enviroment?
· Highly critical environments · Increase of known vulnerabilities in the ICS environment · Increasing attack surface · Need for understanding the attack risk and possibilities

IT vs OT/ICS Pen-testers
· Specialists and understanding of environment · Most time spent in a pen-test is research and
understanding · "If I only had an hour to chop down a tree, I would spend the first 45 minutes sharpening my axe." ­ Abraham Lincoln.
· If generalist are used higher risk of problems ­ need to understand the effect of what that is done - before

Traffic analysis
Every OT Pentest should always start with a passive network evaluation of the environment.
This phase will often provide a valuable insight to enable the testers to be more efficient. -"Every device tells a story" - leverage the information provided & cross check with known Vulnerabilities. (Remember most firmware fixes "Reliability" rather than "Security") - Have focus on the "reliability" angle. - Your test scope would ­often- no be to find "zero days", while that often happens :-)
While looking for the "scope" part, one can get a lot extra "bonus" during this phase; - Can catch various misconfigurations and unexpected traffic flow; · like Drop box connectivity from a sensible network segment. · unexpected cross-interconnected networks/routing ... why has XX airgap'ed device access to the internet. · Equipment calling out to ghost equipment.
· Finally ­ the documentation will be validated against the "real" life network

Initial shell access
· Understand the target attack surface · WIFI in the ICS or... · Applications services (http or other) · Office / Administration network access · Use or modify exploit to your need
· Always do the active part in the LAB! · Do not use tools that you do not know what is doing!

The toolbox
· Big shout-out to the SANS ICS 612 Beta2 team (Tim, Jeff and Jason) · "One need to earn the access into such master class" :-) · Ask the pen tester(s) on the 3 initials tests she/he would perform in test/production environment. · ("aka. what is in the toolbox?")

Ospf attack
· Dynamic routing in the ICS · Creating MiTM with OSPF · Protect your network!
· Sample from the real life · Large organization · Gained wifi access · OSPF used in routers and firewall without md5 keys · Injecting OSPF routes to control traffic flow (MiTM) · Capturing password hashes / full control off traffic - J

OSPF
· Not only OSPF many dynamic routing · I bit of details J
· Inject routes with · Redistriute statics · Make you default gateway or other internal routes
· You have your MiTM

What to ask and expect from the OT assessment & pentest
Suggested points to be assessed/asked, before sign-off: · Show me your ability to do passive assessment (!) in our environment? ­ if
they say Nmap ... close the conversation fast... · Tell me the first 3 points/areas, you will test in our OT test/production and
why? · Please document your contribution back to the community ­ have you done
e.g. "responsible disclosure" to industrial vendors ? (ask for references /CVE-number).
As client, one should expect the tester(s), can demonstrate knowledge on OT, and will present two ­very- different approaches in production/testing environments.

Questions

