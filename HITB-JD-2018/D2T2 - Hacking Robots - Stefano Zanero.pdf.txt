Hacking Robots
Lessons learned, current research and new perspectives
Stefano Zanero
Associate Professor, Politecnico di Milano
Joint work with: Davide Quarta, Marcello Pogliani, Mario Polino, Federico Maggi, Andrea M. Zanchettin

Industrial robots?

Industrial Robot Architecture (Standards)
Controller

Flexibly programmable

Screenshot of teach pendant + formatted code snippet on the side

"Implicit" parameters

"Implicit" parameters

Connected
(Part 1)

They are already meant to be connected

Services:

Well-known (FTP) +

custom (RobAPI)

LAN

Attack surface

USB port Radio

Connected Robots: Why?
 Now: monitoring & maintenance ISO 10218-2:2011
 Near future: active production planning and control  some vendors expose REST-like APIs  ... up to the use of mobile devices for commands
 Future: app/library stores  "Industrial" version of robotappstore.com?

We assess
attack impact by
reasoning on
requirements

Requirements: "Laws of Robotics"
Safety Accuracy Integrity

Requirements: "Laws of Robotics"

Safety Accuracy Integrity

Acknowledgements T.U. Munich, YouTube -- Dart Throwing with a Robotic Manipulator

Requirements: "Laws of Robotics"
Safety Accuracy Integrity

Robot-Specific Attack

Safety Accuracy Integrity

violating any of these requirements
via a digital vector

Control Loop Alteration

Attack 1 Safety Accuracy Integrity

Control Loop Alteration

Attack 1 Safety Accuracy Integrity

Control Loop Alteration

Attack 1 Safety Accuracy Integrity

Micro-defects in additive manufacturing
dr0wned - Cyber-Physical Attack with Additive Manufacturing Sofia Belikovetsky, Mark Yampolskiy, Jinghui Toh, Yuval Elovici

Calibration Tampering

Attack 2 Safety Accuracy Integrity

Calibration Tampering

Attack 2 Safety Accuracy Integrity

Production Logic Tampering

Attack 3 Safety Accuracy Integrity

Production Logic Tampering

Attack 3 Safety Accuracy Integrity

Displayed or Actual State Alteration
Attacks 4+5 Safety Accuracy Integrity

Displayed or Actual State Alteration
Attacks 4+5 Safety Accuracy Integrity

Displayed State Alteration PoC
Teach Pendant

Malicious DLL

Displayed State Alteration PoC
Teach Pendant

Malicious DLL

Standards & Regulations vs. Real World

Collaborative Robotics

let's compromise the controller

Services:

Well-known (FTP) +

custom (RobAPI)

LAN

USB port Radio

VxWorks 5.x RTOS (PPC)

FTP, RobAPI, ...

VxWorks 5.x RTOS (x86)

Windows CE (ARM) .NET >=3.5

Update problems

FlexPendant Axis Computer Microcontrollers

Update problems
How? FTP at boot .... plus, no code signing, nothing

FlexPendant Axis Computer Microcontrollers

Update problems
FlexPendant Axis Computer Microcontrollers
FTP? Credentials? Any credential is OK during boot!
ABBVU-DMRO-124644

Autoconfiguration is magic!

Autoconfiguration is magic!
ABBVU-DMRO-124642

Enter /command
FTP RETR /command/whatever read system info FTP STOR /command/command execute "commands"
ABBVU-DMRO-124642

Enter /command
FTP RETR /command/whatever read system info FTP STOR /command/command execute "commands"
ABBVU-DMRO-124642

Enter /command
FTP GET /command/whatever read, e.g., env. vars FTP PUT /command/command execute "commands"
shell reboot shell uas_disable + hard-coded credentials?  remote command execution
ABBVU-DMRO-124642

Enter /command
Let's look at cmddev_execute_command: shell  sprintf(buf, "%s", param) other commands  sprintf(buf, "cmddev_%s", arg)
overflow buf (on the stack)  remote code execution
ABBVU-DMRO-128238

Other buffer overflows
Ex. 1: RobAPI  Unauthenticated API endpoint  Unsanitized strcpy()  remote code execution Ex. 2: Flex Pendant (TpsStart.exe)  FTP write /command/timestampAAAAAAA.....AAAAAAA  file name > 512 bytes ~> Flex Pendant DoS
ABBVU-DMRO-124641, ABBVU-DMRO-124645

Takeaways
Some memory corruption Mostly logical vulnerabilities All the components blindly trust the main computer (lack of isolation)

Complete attack chain (1)

Complete attack chain (2)

Complete attack chain (3)

File protection
"Sensitive" files:  Users' credentials and permissions  Sensitive configuration parameters (e.g., PID)  Industry secrets (e.g., workpiece parameters)
Obfuscation: bitwise XOR with a "random" key. Key is derived from the file name. Or from the content. Or ...

That's how we implemented the attacks

Attack Surface
?

Attack Surface
Network Physical (but digital) Programming Languages

Network

Remote Exposure of Industrial Robots

Search

Entries Country

ABB Robotics

5

DK, SE

FANUC FTP

9

US, KR, FR, TW

Yaskawa

9

CA, JP

Kawasaki E Controller 4

DE

Mitsubishi FTP

1

ID

Overall

28

10

Not so many...
(yesterday I've just found 10 more)

Remote Exposure of Industrial Routers
...way many more!
Unknown which routers are actually robot-connected

Typical Issues
Trivially "Fingerprintable"  Verbose banners (beyond brand or model name)  Detailed technical material on vendor's website
 Technical manual: All vendors inspected  Firmware: 7/12 vendors

Typical Issues (1)
Outdated Software Components  Application software (e.g., DropBear SSH, BusyBox)  Libraries (including crypto libraries)  Compiler & kernel  Baseband firmware

Typical Issues (2)
Insecure Web Interface  Poor input sanitization  E.g., code coming straight from a "beginners" blog
Cut & paste

Physical Attack Surface

Programming Languages Attack Surface
UNTRUSTED INPUT
ROBOT MOVEMENT

Conclusions

Conclusions
Robots are increasingly being connected Industrial robot-specific class of attacks Barrier to entry: quite high, budget-wise

What should we do now?
Some vendors are very responsive As a community we really need
to push hard for countermeasures

Hints on Countermeasures
Short term Attack detection and deployment hardening
Medium term System hardening
Long term New standards, beyond safety issues

Questions?
Please reach out!
stefano.zanero@polimi.it @raistolo
Papers, slides, and FAQ http://robosec.org

