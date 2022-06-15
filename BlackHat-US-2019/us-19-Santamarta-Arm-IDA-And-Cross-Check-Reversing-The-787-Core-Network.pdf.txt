Arm IDA and Cross Check: Reversing the 787's Core Network
Ruben Santamarta Principal Security Consultant

2

2008
"The proposed architecture of the 787 is different from that of existing production (and retrofitted) airplanes.

. Because of this new passenger connectivity, the proposed data network design and integration

https://www.wired.com/2008/01/dreamliner-security/
©2019 IOActive, Inc. All Rights Reserved.

"
https://www.federalregister.gov/documents/2008/01/02/E725467/special-conditions-boeing-model-787-8-airplane-systems-anddata-networks-security-isolation-or
3

2015

https://www.wired.com/2015/05/possible-passengers-hack-commercial-aircraft/

©2019 IOActive, Inc. All Rights Reserved.

4

787's Core Network Cabinet

https://www.redimec.com.ar/producto-isc2200-information-services-cabinet-601

©2019 IOActive, Inc. All Rights Reserved.

5

Old tricks never die...

· September 2018 · Publicly available Boeing server · Google query
Files
· 787's Core Network Cabinet Fw · 737's Onboard Network System Fw · VM to VPN into a Boeing network

©2019 IOActive, Inc. All Rights Reserved.

6

Methodology

· Information Gathering
­ Documents, multimedia material, presentations, papers, press releases, patents, books, etc.
· Reverse Engineering
­ Identify the elements, components, and functionalities described in the patents
­ Identify attack vectors
­ Prioritize attack areas
­ Find a minimum set of vulnerabilities required to demonstrate each of the attack scenarios described in 2.2
­ Assess the exploitability and post-exploitation scenarios, which included reviewing the machine code for the presence of compiler-level mitigations.
­ Evaluate the overall security posture of the in-scope elements taking information and knowledge gained in the previous phases into account

©2019 IOActive, Inc. All Rights Reserved.

7

Boeing 787 Overview
Common Core System
· General Processing Modules · Remote Data Concentrators · A664-P7 Network

©2019 IOActive, Inc. All Rights Reserved.

http://www.artis t-embedded.org/docs/Events/2007/IMA/Slides/ARTIST2_IMA_W indRiver_W ilson.pdf
8

Common Computing Resource Cabinets
· Two (2) Power Conditioning Modules (PCMs) · Eight (8) General Processing Modules (GPMs) · Two (2) ARINC 664-P7 network Cabinet Switches (ACSs) · Two (2) Fiber Optic Translator Modules (FOXs) · Two (2) Graphic Generators (part of the Display and Alert Crew System)

©2019 IOActive, Inc. All Rights Reserved.

9

GPM Hosted Functions

· Cabin Air Temperature Control System · Remote Power Distribution System (RPDS) · Power Distribution Panels (PDPs) · Generator/Bus Power Control Units (GCU/BPCU) · Low Pressure System · Fuel Quantity System · Hydraulic System Control · Power Electronics Cooling System · Communication Management Function · Landing Gear Indication and Control · Flight Management Function · Circuit Breaker Indication and Control · Electrical Power Distribution and Control ·...

©2019 IOActive, Inc. All Rights Reserved.

10

Remote Data Concentrators

©2019 IOActive, Inc. All Rights Reserved.

11

Common Data Network

©2019 IOActive, Inc. All Rights Reserved.

12

Crew Information System
Interface between the `outside world'/non-critical domains and the CCS

©2019 IOActive, Inc. All Rights Reserved.

13

CIS Networks
· ODN (Open Data Network)
­ Non-critical aircraft domains ­ External Networks ­ Potentially hostile devices: IFE, SATCOM, TWLU/CWLU...
· IDN
­ Secure, but non-safety, devices.
· Voice and Data Flight Recorders (Black Box) · Electronic Flight Bag
· CDN
­ High Integrity Network (Avionics) ­ Airplane systems

©2019 IOActive, Inc. All Rights Reserved.

14

CIS Modules
· CIS/MS FSM
­ VxWorks 6.2 (x86) COTS Board (CPB4612) ­ RTPs
· EGM
­ Linux ZNYX ZX4500
· NIM
­ End System is a GE's ASIC

©2019 IOActive, Inc. All Rights Reserved.

15

Attack Surface of the Core Network Cabinet
· "The architecture provides segregation between network
devices in the IDN and CDN related to operation and navigation of the vehicle, and network devices in the ODN"
US Patent 7756145 B2
https://patents.google.com/patent/WO2007117285A2/en

©2019 IOActive, Inc. All Rights Reserved.

16

Security Boundaries

©2019 IOActive, Inc. All Rights Reserved.

17

From ODN to CDN
1. ODN attack vectors 2. Iptables Rules (EGM) 3. EGM to CIS/MS rule 4. RCE on CIS/MS 5. Unblock Access to CDN 6. Jump to CDN through NIM

©2019 IOActive, Inc. All Rights Reserved.

18

Attack Scenario
19

CIS/MS FSM
©2019 IOActive, Inc. All Rights Reserved.

VxWorks Kernel

User-Mode

Real-Time Processes
1. FBM.vxe 2. FTS_Manager.vxe 3. MSPE.vxe 4. OBEDS.vxe 5. ODLF.vxe 6. bmt.vxe 7. fsmTgtLdr.vxe 8. ftpd.vxe 9. mtf_main.vxe 10. mtf_rtp.vxe 11. omls.vxe 12. osm.vxe 13. rexec_server.vxe 14. wlanmf_rtp.vxe

Shared Libraries
1. ACP.so 2. AMI.so 3. DiskUtilities.so 4. DisplayUtilities.so 5. FCCS.so 6. FSMAAircraftVerification.so 7. JSON.so 8. LDI.so 9. Messaging.so 10. OBEDSInterface.so 11. OrderedList.so 12. SNMP.so 13. cisUtil.so 14. mtfIOUtilities.so 15. ossAccessors.so
20

CIS/MS Vulnerabilities

· Hundreds of references to insecure functions
(`sprint','strcpy','strcat'..)
· Integer overflows · Buffer Overflows · Denial of Service · Memory Corruption · Out-Bound-Read/Write ·...

©2019 IOActive, Inc. All Rights Reserved.

21

Breaking into the CIS/MS
· Minimum set of vulnerabilities that allow the CIS/MS to
be compromised from the ODN
­ Remote Code Execution ­ Privilege Escalation to Kernel

©2019 IOActive, Inc. All Rights Reserved.

22

FTS_Manager.vxe - TFTP Opcode Stack Overflow

©2019 IOActive, Inc. All Rights Reserved.

23

Exploitability
· Controlled parameters
­ Destination File ­ Opcode ­ Adjacent memory ­ 0x4FFFB (.data+.bss) ­ ~0x700 bytes

©2019 IOActive, Inc. All Rights Reserved.

24

Exploitability
· From ODN to CIS/MS' `FTS_Manager.vxe' Service · EGM Iptable Rules
File: `S24egmcfg'

· 172.27.40.2 - ife-router.odn.pnet · 172.24.10.12 - cis-ms-active.idn.pnet

©2019 IOActive, Inc. All Rights Reserved.

25

Exploitability
· File `AimCfg.xml' · NIM's Boundary Router

· 172.27.40.2 - ife-router.odn.pnet · 172.24.10.12 - cis-ms-active.idn.pnet

©2019 IOActive, Inc. All Rights Reserved.

26

©2019 IOActive, Inc. All Rights Reserved.

27

`duParseLUSFile' Memory Corruption
· `diskUtils.so'
­ Exercise vulnerable path from `ODLF.vxe' (Onboard Data Loading Function)
­ Caller allocates a fixed fileData structure (stack) ­ buffer is pointing to the attacker controlled LUS file.

©2019 IOActive, Inc. All Rights Reserved.

28

Exploitability

· The attacker can corrupt the stack buffer in a solid way, using
controllable values from the LUS file, which allows the attacker to effectively control the EIP and those registers required to initiate a ROP chain (if it's ever required)*

· A remote unauthenticated attacker can exercise the
vulnerable execution path. It is worth mentioning that any compromised LRU that is about to be updated may also trigger this vulnerability as the ODLF acts as a server/client.

©2019 IOActive, Inc. All Rights Reserved.

29

FsmTgtLdr.vxe ­ LUH Part Number Stack Overflow
· When parsing .LUH files (ARINC Load Upload
Headers), the part number length is not properly checked.

©2019 IOActive, Inc. All Rights Reserved.

30

Exploitability
· The attacker is able to corrupt the stack buffer in a solid
way, using controllable values from the LUH file, which allows the attacker to effectively control the EIP and those registers required to initiate a ROP chain.
· A remote unauthenticated attacker can exercise the
vulnerable execution path.

©2019 IOActive, Inc. All Rights Reserved.

31

VxWorks ­ Insecure Syscall Handlers Privilege Escalation
· RCE done, now let's jump to the Kernel. · CIS/MS Custom SysCall Group `FSMSYSTEM' · Invoked from user mode by using a CallGate

©2019 IOActive, Inc. All Rights Reserved.

32

VxWorks ­ Insecure Syscall Handlers Privilege Escalation
· They are not validating any pointer received from user-
mode, so it is possible to read/write arbitrary kernel memory
· They use insecure functions and other insecure
patterns, which can be used to trigger different kinds of vulnerabilities.

©2019 IOActive, Inc. All Rights Reserved.

33

`cissFwSetByDynFirewallRule' SysCall (0x224)
· It enables RTPs to add arbitrary firewall rules to the
CIS/MS packet filter
· Useful during exploitation to unblock CDN access.

©2019 IOActive, Inc. All Rights Reserved.

34

Syscall 0x224

©2019 IOActive, Inc. All Rights Reserved.

35

ODN to CDN

©2019 IOActive, Inc. All Rights Reserved.

36

Attack Scenario #1 ­ IFE to CDN
· Compromise IFE · EGM->CIS/MS · TFTP Exploit · SysCal 0x224 · CIS/MS to CDN

©2019 IOActive, Inc. All Rights Reserved.

37

Scenario #2 ­ Arbitrary LRU to CDN
· CIS/MS Data Load · Compromised LRU · ODLF.vxe exploit · LRU->CIS/MS->CDN

©2019 IOActive, Inc. All Rights Reserved.

38

Scenario #2.1 ­ Wireless LRU to CDN
· Wireless Emergency Lighting System

https://www.securaplane.com/products/wireless/

©2019 IOActive, Inc. All Rights Reserved.

39

Scenario #2.1 ­ Wireless LRU to CDN
· Onboard attacker (or supply chain) compromises WCU · WCU exploits ODLF.vxe vulnerabilities through RDC · Attacker gains access to the CDN
File: `AimCfg.xml'

©2019 IOActive, Inc. All Rights Reserved.

40

Scenario #3 ­ External Network to CDN

©2019 IOActive, Inc. All Rights Reserved.

41

Scenario #3 ­ External Network to CDN

· An attacker compromises an Internet-facing vulnerable LSAP proxy server.
· The attacker controls LSAP repository/uplink-downlink requests
(OBEDS.vxe/FTS_Manager.vxe)
· The Gatelink822 Airport's local infrastructure may also expose an attack vector.
· The attacker reaches the IDN through the TWLU/CWLU EGM rules.
· The attacker gains CDN access by exploiting any of the documented
vulnerabilities.
· IOActive discovered two vulnerable instances of Internet-accessible LSAP
proxy servers belonging to airlines operating Boeing aircraft and shared the details with Boeing..
· Gatelink822 infrastructure and reachability may vary between airports. As an
example, in Terminal 4S of the Barajas Adolfo Suarez Airport in Madrid (Spain), the Gatelink822 SSID is publicly broadcast throughout the terminal.

©2019 IOActive, Inc. All Rights Reserved.

42

Scenario #4 ­ Communication Link to CDN

©2019 IOActive, Inc. All Rights Reserved.

43

Scenario #4 ­ Communication Link to CDN
· TCU/SATCOM providers may assign a public IP that is
exposed to the Internet.
· An attacker gains access to the TCU/SATCOM device. · The attacker reaches the CIS/MS through the EGM
rules for TCU/SATCOM interfaces (if any, as SATCOM may be optional)
· The attacker gains CDN access by exploiting any of the
vulnerabilities documented in the CIS/MS services.

©2019 IOActive, Inc. All Rights Reserved.

44

Post Exploitation

· Initiate a potentially malicious firmware update in
Safety Critical Units
­ Potential Mitigation: Integrity controls
· Abuse maintenance (Circuit breakers, tests..) · Deceive maintenance engineers

We are just using the system in the way it was designed for.

©2019 IOActive, Inc. All Rights Reserved.

45

From CDN to Safety Critical Systems

21 Remote Data Concentrators

· Main Engine Data Concentrators · Brake System Control Cards · Valve Control Circuit Cards · Proximity Sensors Data Concentrators · Electric Motor Pump Controller · Electric Control Break Actuator · Fuel Quantity · Emergency Power Assist System · Wireless Emergency Light System · Ram Air Fan Controller · Maintenance Display Unit
©2019 IOActive, Inc. All Rights Reserved.

· Cabin Air Compressor · Shutoff Fuel Module · Refuel Control Panel · Wing Ice Protection System · Bus Power Control Unit · Electronic Control Unit · Secondary Power Distribution Unit · Engine Monitor Unit · Electronic Engine Control · Remote Power Distribution Unit · Graphics Generator Display · Flight Recorder · Audio Units
46

From CDN to Safety Critical Systems
Electronic Engine Controller ­ DataLoad A615A Rule

172.24.10.12 ­ CIS/MS FSM 10.73.2.0 ­ EEC_Controller 59 TFTP Port

©2019 IOActive, Inc. All Rights Reserved.

47

Maintenance Operations
· Wired: When the engineer is connected through one of the three wired ports in
the flight deck or equipment centers, it is possible to exercise any maintenance operation available on the system.
· Wireless: When the engineer is connected wirelessly through the
CWLU/TWLU, only a limited set of maintenance operations are enabled.
· Full Wireless: This mode enables the engineer who is wirelessly connected
through the CWLU/TWLU to `upgrade' from a Wireless connection to a Full Wireless mode, which is equivalent to the Wired mode. In order to enable all of the operations, the engineer needs to enter a code that is generated in the CIS/MS through the cabin interphones. If the code entered matches the locally generated challenge code, the engineer is upgraded to Full Wireless mode, and the CIS/MS unblocks CDN access for the engineer's Maintenance Terminal IP.

©2019 IOActive, Inc. All Rights Reserved.

48

Maintenance Operations
· Challenge Code Generator ­ OMLS.vxe (Onboard
Maintenance Laptop Function)

©2019 IOActive, Inc. All Rights Reserved.

49

Maintenance Operators
· Challenge received from Cabin Interphone

©2019 IOActive, Inc. All Rights Reserved.

50

Maintenance Operations
· Central Maintenance Computing Function (Hosted
Function at CCS)
· Deceive Technicians · Initiate tests · Circuit Breakers

©2019 IOActive, Inc. All Rights Reserved.

51

Responsible disclosure
· Boeing and Honeywell confirmed that these vulnerabilities
are present in the current 787's Core Network codebase
· The official response IOActive received from Boeing was that
they do not consider our reported findings exploitable vulnerabilities, as they could not reproduce these flaws.
· Boeing stated that they have `compiler-level' mitigations in
place that prevent the vulnerabilities from being exploited. No further details were shared.

©2019 IOActive, Inc. All Rights Reserved.

52

Responsible disclosure

· Versions
Boeing did not share with IOActive the version of the CIS/MS firmware they were using in their testing, despite the fact that this information was requested several times. This is a crucial part in any responsible vulnerability disclosure, even more important when discrepancies in the results exist.
· Testing plan
During the vulnerability coordination process IOActive did not have any visibility over the tests, methodologies, proof-of-concept code, exploitation techniques, or any technical details in general terms, that Boeing and partners implemented during their internal evaluation of the vulnerabilities. To help address this situation, IOActive offered to assist Boeing in reproducing these vulnerabilities at their own controlled environment. Unfortunately, Boeing declined.

©2019 IOActive, Inc. All Rights Reserved.

53

Responsible Disclosure

· Mitigations
Boeing communicated to IOActive that there are certain built-in compiler-level mitigations that, in their point of view, prevent these vulnerabilities from being successfully exploited. IOActive was unable to locate or validate the existence of those mitigations in the CIS/MS firmware version we analyzed. When asked, Boeing declined to answer whether these mitigations might have been added on a later version. Honeywell is checking it *today*

©2019 IOActive, Inc. All Rights Reserved.

54

Response from Boeing

· "IOActive reviewed only
one part of the 787 network using rudimentary tools" "IOActive chose to ignore our verified results"*

(*) Verified by those who consider that :
· IDA is a rudimentary tool · `sprintf' is an unexploitable function. · A ROP chain in an RTOS is not possible because there are not enough
functionalities
· Compiler-level mitigations can work even if they are not added to the resulting binary

©2019 IOActive, Inc. All Rights Reserved.

55

Mitigations (or the lack of them)
· NX/XD
­ 32-bit Pentium M ­ Unknown model ­ VxWorks MMU Initialization
· PAE/PSE bits cleared

©2019 IOActive, Inc. All Rights Reserved.

56

Mitigations (or the lack of them)
· GCC Stack Protection

©2019 IOActive, Inc. All Rights Reserved.

57

Conclusions

· We hope that a determined, highly capable third party can
safely confirm that these vulnerabilities are not exploitable due to the mitigation controls not visible to us during this analysis. We are confident owners and operators of these aircraft would welcome such independent validation and verification.
· We believe as strongly in safety as we do in security. We
provide these detailed findings herein so that all stakeholders, security industry and affected entities can form their own judgment as to the exploitability and impact of these confirmed software vulnerabilities.

©2019 IOActive, Inc. All Rights Reserved.

58

Thank you!

©2019 IOActive, Inc. All Rights Reserved.

59

