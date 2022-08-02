SESSION ID: HTA-R01
Owning SAP ASE: Chained Database Attack

Martin Rakhmanov
Senior Researcher Trustwave SpiderLabs

#RSAC

#RSAC
Agenda
 Why databases should be protected?  What is a chained attack  Piece one  Piece two  Defense  Q&A
2

#RSAC
Why it's important to keep databases secured?
 Regulatory compliance  Lost business costs  Company reputation
Cost of data breaches due to system or business process failures was $117 and the loss for data breaches caused by the employee or contractor negligence was $113
per compromised record. (http://resources.infosecinstitute.com/databasesvulnerabilities-costs-of-data-breaches-and-countermeasures/)
3

#RSAC
SAP Adaptive Server Enterprise
 Product with more than 25 years history  Used by major financial institutions: banks, insurance companies  SAP claims that ASE is secure database management system
"SAP ASE boasts over 30,000 customers, including 90% of the world's banks and security firms. These companies trust SAP ASE to keep their mission-critical systems up and running"
4

#RSAC
Vulnerabilities in ASE reported over last years

2011 2012 2013 2014 2015

Java vulnerabilities 2
2

Buffer overflows
4 4

1

Design errors SQL injections

1

6

3

2

1

1

2

+2

5

#RSAC
Chained database attack
 Two or more vulnerabilities chained to own the database 1. Break into the system 2. Elevate privileges to super user 3. Grab the data or do anything else
6

Two-phase commit "probe"

#RSAC

process: backdoor 15 years

old

#RSAC
What is "probe" login?
 Little known "probe" login exists on each ASE back from 12.5 (2001)
 Special processing in server login handler  Password is not used for authentication!  Negotiation callbacks mechanism is used instead
8

#RSAC
Probe login exists on any ASE
9

#RSAC
"probe" login details
10

#RSAC
Normal authentication process

Client

Send login request with login/password Respond with login success/failure

Server

11

#RSAC
12

#RSAC
Probe authentication process

Client

Send login request containing "probe" Respond with random challenge if login exists Send modified challenge using fixed algorithm Verify modified challenge and reply with status

Server

13

#RSAC
Transformation logic
 8 byte input is transformed into another 8 byte output using hardcoded function named com_uninitialize_tds_text (on Windows it could be found in the %SYBASE%\%SYBASE_OCS%\dll\libsybcomn.dll)
 Transformation is based on constant values, for example:
v4 = *(_BYTE *)(a1 + 3) ^ *(_BYTE *)(a2 + 1) ^ *(_BYTE *)(a1 + 2);
14

#RSAC
Build custom client for "probe" access
 Custom client connects to almost any SAP ASE instance  Runs arbitrary commands as unprivileged login "probe"  Helper in deploying further attacks, i.e. chained exploit
15

#RSAC
What does official documentation say...
16

#RSAC
Algorithm
 Set login name to "probe"  Set connection property CS_SEC_CHALLENGE  Setup negotiation callback routine  In the callback routine load libsybcomn.dll and forward
challenge processing to it  Connect  Do SQL/RPC commands of our choice!
17

#RSAC
Authentication callback setup
18

#RSAC
19

#RSAC
Countermeasures
 Lock "probe" login immediately (may have side effects)  Patch the database: 15.7 SP132, 16.0 SP01  Firewall: allow only connections from trusted hosts  Monitor database activity: watch for "probe" connections
This issue was reported by Trustwave to SAP in Jan 2014 and took two attempts to be fixed properly. Initially they "fixed" it by disallowing SQL text type...
20

#RSAC
Privilege escalation

#RSAC
Java subsystem
 If enabled allows anyone to invoke standard Java functionality via SQL bridge
 Contains many vulnerabilities, we pick two 
22

#RSAC
Vulnerability details: writing to disk via Java
 Custom SecurityManager implementation is buggy  The checkPermission method is incomplete  As a result, files outside $SYBASE can be read/written (there is a
check that the path must not be under the SYBASE home)
23

#RSAC
Compose exploit code: here a file is created with process owner details
Exploit code
24

#RSAC
Build the shared library on attacker's machine
25

#RSAC
Dump bytes of just compiled binary for transfer to the target via SQL
26

#RSAC
File read/write via java.io.RandomAccessFile to /tmp/evil.so on ASE filesystem
27

#RSAC
The command is executed on victim ASE to verify file upload
Results of transfer
28

#RSAC
Vulnerability details: code exec via Java
 Again, bad custom SecurityManager implementation  No checkLink method in the PCAJvmSecurityManager class  As a result, loading native libraries from disk is possible without
any security checks
29

#RSAC
Now it's time to load the exploit...
30

#RSAC
ASE filesystem
31

#RSAC
Advanced exploitation: memory patching
32

#RSAC
Advanced exploitation: compile the library
33

#RSAC
Before library loading: passwords are checked
34

#RSAC
After library loading: any password works!
35

#RSAC
Countermeasures
 Do not install/disable Java if not used  Patch the database: 15.7 ESD#3  Firewall again to allow only trusted client connections
36

#RSAC
Chained database attack: recap
 Use "probe" access vulnerability to make initial unprivileged connection
 Use file access Java vulnerability to upload attacker's code to the server
 Use native library loading vulnerability to trigger attacker's code execution
37

#RSAC
Summary
 Unauthorized access via "probe" login (CVE-2014-6284): all versions of SAP ASE up to 15.7 SP132, 16.0 SP01
 Java file access (CVE-2015-3328): 15.7 ESD#3  Java native library loading (CVE-2015-3311): 15.7 ESD#3
38

#RSAC
Apply what you've learned
 Inventory all databases in your company: manual inspection or use thirdparty products
 Disable unused functionality: see ASE documentation at https://help.sap.com/adaptive-server-enterprise/
 Patch your databases on time: updates at http://support.sap.com  Audit/monitor databases for suspicious activity: built-in auditing or third-
party products  Evaluate permissions granted to legitimate users: use custom scripts or
third-party products  Watch for new SAP security notes: https://service.sap.com/securitynotes/
39

#RSAC
ASE in Amazon Cloud
40

#RSAC
Resources
 SAP Adaptive Server Enterprise: https://help.sap.com/adaptiveserver-enterprise
 SAP Security Notes: https://service.sap.com/securitynotes/  Trustwave security advisories:
https://www.trustwave.com/Resources/Security-Advisories/
41

#RSAC
Q&A
Contact: Martin Rakhmanov martin.rakhmanov@gmail.com

