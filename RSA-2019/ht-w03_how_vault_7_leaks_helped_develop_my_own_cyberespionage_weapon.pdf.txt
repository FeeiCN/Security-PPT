SESSION ID: HT-W03
How Vault 7 Leaks Helped Develop My Own Cyber Espionage Weapon

Wayne Ronaldson
Red Team Lead Loop Secure @loop_secure

#RSAC

#RSAC

The difference between script kiddies and professionals is the difference between merely using other people's tools and writing your own.
"Charlie Miller

Presenter's Company

Logo ­ replace or delete on master slide

2

#RSAC
Vault Seven Leaks

AfterMidnight. Assassin. Athena. Hera. Pandemic. Grasshopper. Marble Framework. Wolfcreek.

Presenter's Company

Logo ­ replace or delete on master slide

3

#RSAC

Presenter's Company

Logo ­ replace or delete on master slide

4

#RSAC
Concept of Operations

Presenter's Company

Logo ­ replace or delete on master slide

5

#RSAC
Why Command & Control

Super awesome. Cobalt Strike, Canvas, Empire. Metasploit, Core Impact. State sponsored adversary. Digital espionage. Want long term implant. Only for high value targets. Mr. Robot stole one. This is my digital Everest.

Presenter's Company

Logo ­ replace or delete on master slide

6

#RSAC
Command & Control Wish List

Access easily.

Quick setup.

Secure communication.

Dashboard view.

Easy to operate.

Task driven.

Database.

Scalable.

Presenter's Company

Logo ­ replace or delete on master slide

7

#RSAC
Implant Wish List

DLL, EXE.

Task execution.

User land.

Audio capture.

Screen capture.

Keylogger.

Memory based.

Secure communication.

Presenter's Company

Logo ­ replace or delete on master slide

8

#RSAC

Sunday 15th October 2017
Day One

Presenter's Company

Logo ­ replace or delete on master slide

9

#RSAC

Presenter's Company

Logo ­ replace or delete on master slide

10

#RSAC
Implant Development

RESTful API. Python. C++. Post request. Get request. Beacon time. Encryption.

Presenter's Company

Logo ­ replace or delete on master slide

11

#RSAC

Presenter's Company

Logo ­ replace or delete on master slide

12

#RSAC
Command & Control Development

Python Flask.

RESTful API.

Ubuntu server.

PostgreSQL.

Web user interface.

Task commands.

Easy to deploy.

Lightweight.

Presenter's Company

Logo ­ replace or delete on master slide

13

#RSAC
Tasking

Asynchronous. User interface. Task commands. Callback period. Stored database. Process tasks. Task results.

Presenter's Company

Logo ­ replace or delete on master slide

14

#RSAC
Communication

Fetch tasks. HTTPS. Java Web Token. Proxy auto detect. Upload. Download.

Presenter's Company

Logo ­ replace or delete on master slide

15

#RSAC
Operational Window

When implant is active. Hibernate time. Before going active. Hibernation period. New JWT. JWT expiry. Callback period.

Presenter's Company

Logo ­ replace or delete on master slide

16

#RSAC
User Interface

Manage implants. Generate tasks. Targeting HVTs. Implant registration. List tasks. View results. Task commands..

Presenter's Company

Logo ­ replace or delete on master slide

17

#RSAC
System Survey

OS info. Network info. Mounted drives. Current process. Drivers. Installed software. Services. PSP. Persistence.
Presenter's Company Logo ­ replace or
delete on master slide

Audit. Scheduled tasks. Recently modified files. Recent USB devices. Passwords. Browsers. DNS cache. Recent RDP sessions. Shares.
18

#RSAC

Presenter's Company

Logo ­ replace or delete on master slide

19

#RSAC
Development Tradecraft

Do's
Obfuscate or encrypt all strings. Strip all debug symbols. Strip all debugging output. Minimize binary file size. Use end to end encryption. Use RFC compliant network protocols. Use GMT/UTC/Zulu as the time zone. Use variable size & timing of implant network communications.

Don'ts
Have "dirty words" in the binary. Perform operation that will cause the target to be unresponsive. Leave dates/times. Allow network traffic, such as c2. packets to be re-playable. Proper cleanup of network connections. Assume a "free" PSP product is the same as a "retail" copy.

Presenter's Company

Logo ­ replace or delete on master slide

20

#RSAC
Keylogger Code

Presenter's Company

Logo ­ replace or delete on master slide

21

#RSAC
Keylogger Code Obfuscated

Presenter's Company

Logo ­ replace or delete on master slide

22

#RSAC
WTF Was I Thinking
Pain. Agony. More pain. More agony. Insomnia. Swearing at myself. Swearing at my cat. And more swearing. Then more pain.
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC

Presenter's Company

Logo ­ replace or delete on master slide

24

#RSAC

Presenter's Company

Logo ­ replace or delete on master slide

25

#RSAC

Presenter's Company

Logo ­ replace or delete on master slide

26

Video

#RSAC
Operational Thoughts

Not detected.

Infrastructure tradecraft.

C2 off the internet.

EXE needs to blend in.

Persistence worked.

Terminal output.

No PowerShell.

Need add proxy detection.

Presenter's Company

Logo ­ replace or delete on master slide

28

#RSAC
Infrastructure Tradecraft

Operational security. SSL. SSH Keys. OpenVPN. Wiregaurd VPN. C2 runs local. No C2 on server.

Presenter's Company

Logo ­ replace or delete on master slide

29

#RSAC

Presenter's Company

Logo ­ replace or delete on master slide

30

Demo Overwatch Offensive

#RSAC

Presenter's Company

Logo ­ replace or delete on master slide

32

#RSAC
Why I Did This

Because it was fun.
Increase my own skill set.
To help understand why you should test your security posture against real-world attacks.
Empower security team to think like an attacker.
Demonstrate why custom tools can be so devastating to your environment.

Presenter's Company

Logo ­ replace or delete on master slide

33

Questions

