Invest in security to secure investments
Oracle PeopleSoft applications are under attacks!
Alexey Tyurin

About ERPScan
· The only 360-degree SAP Security solution - ERPScan Security Monitoring Suite for SAP
· Leader by the number of acknowledgements from SAP ( 150+ ) · 60+ presentations key security conferences worldwide · 25 Awards and nominations · Research team - 20 experts with experience in different areas
of security · Headquartered in Palo Alto (US) and Amsterdam (EU)
2

ERPScan and SAP
· Working together since 2007 "We would like to thank the world-class security experts of ERPScan for the highly
qualified job performed to help us assess the security of our pre-release products".
Senior Director, Head of Global Security Alliance Management Product Security, Technology and Innovation Platform SAP Labs, Palo Alto, USA
3

ERPScan and Oracle

· ERPScan researchers were acknowledged 15 times during quarterly Oracle patch updates since 2008

· Totally 40+ Vulnerabilities closed in Oracle Applications

­ Oracle Database ­ Oracle Peoplesoft ­ Oracle Weblogic ­ Oracle JDE ­ Oracle BI

Oracle provides recognition to people that have contributed to our Security-In-Depth program.
Oracle recognizes Alexander Polyakov from ERPScan for contributions to Oracle's
Security-In-Depth program.

4

About Me
· Director of Oracle Security department of the ERPScan company
· WEB/EBA/Network security fun · Hacked many online banking systems · Hacked many enterprise applications
Tweeter: @antyurin
5

Agenda
· Introduction to Oracle PeopleSoft · PeopleSoft Architecture · Attacks on back-end systems · External attacks on PeopleSoft
6

Introduction to Oracle PeopleSoft
7

What is it?
· Oracle PeopleSoft Apps: HRMS, FMS, SCM, CRM, EPM ... · Can work as one big portal or separately · Many implementations in different areas
8

Industries
· Large companies. HRMS/ FMS · Government. HRMS · Universities. Student Administration system
9

Regions
UK 13%
APAC 11% USA 72%
10

Industries

Agriculture&Food; 170

Utilities; 230

Pharmaceutical; 255

Telecommunications, 227

Computing&IT; 940

Manufacturing; 1160

Retail; 437

Educational; 1900 11

· Personal information
­ SSN ­ Salary data
· Payment information
­ Credit card data ­ Bank account data
· Bidding information
­ RFP ­ Prices

Why should we care

12

Why should we care
· Espionage
­ Theft of financial information ­ Corporate trade secret theft ­ Theft of supplier and customer lists ­ Stealing HR data Employee Data Theft
· Sabotage
­ Denial of service ­ Tampering with financial reports
· Fraud
­ False transactions ­ Modification of master data
13

Some cases
· Two Charged with Hacking PeopleSoft to Fix Grades (California state university) - 2007 ­ http://www.pcworld.com/article/139233/article.html
· Student sentenced to jail for hacking university grades (Florida A & M University) - 2009 ­ http://www.geek.com/news/student-sentenced-to-jail-for-hackinguniversity-grades-742411/
· Undergrad suspected in massive breach (University of Nebraska) - 2012 ­ http://www.computerworld.com/article/2503861/cybercrimehacking/undergrad-suspected-in-massive-univ--of-nebraska-breach.html
· Hacking Higher Education - last years ­ http://www.darkreading.com/security/hacking-higher-education/d/did/1109684
14

Some cases
15

Vulnerabilities in PeopleSoft
Some vulns every year, but no info for pentesting...
16

Oracle PeopleSoft Architecture
17

PeopleSoft Internet Architecture
· Many applications, but they have one architecture · PeopleSoft Internet Architecture
­ Internet oriented since version 8
· Based on several special core technologies
18

PeopleSoft Internet Architecture
PeopleTools: · Technology · Developer tools · Framework · PeopleCode
All of the applications are created using PeopleTools.
19

PeopleSoft Internet Architecture
20

PeopleSoft Internet Architecture
Web server
· WebLogic /WebSphere · PS Servlets · Forwards request from a browser to an App Server
Application server
· PS Services + Tuxedo + Jolt · Business logic, SQL transaction management, Transport
Database server
· System Tables, PeopleTools metadata , PeopleSoft application data
21

Hacker's targets
· High privileged access in PeopleSoft ("PS" ­ super admin account)
­ Attacks on business logic ­ Critical information in PeopleSoft
· Remote Command Execution in OS
­ Access to a company's internal network ­ Critical information in PeopleSoft We can get RCE in OS if we have high priv. access. Conversely situation is true too
22

Attacks on back-end systems
23

Internal attacker
24

PeopleSoft "Back End" Authentication
· User ID ­ an account in PeopleSoft Application. · Connect ID ­ a low privileged account in the RDBMS · Access ID ­ a high privileged account in the RDBMS
25

PeopleSoft "Back End" Authentication
User authentication process: · User logs in with his User ID and password to the Application Server. · Application Server, in turn, connects to DBMS using Connect ID. User
ID and passwords for it stored in DBMS tables are compared to the ones that were entered by the user.
­ Connect ID has limited rights, only to retrieve User ID and encrypted password from DBMS tables.
· If the comparison went successful, Application Server retrieves the necessary Access ID with the encrypted password.
­ Access ID with the password are stored in PSACCESSPRFL table. ­ Access ID account has high privileges.
· Finally, the system reconnects to DBMS using Access ID with full access.
26

RDMBS accounts
Some facts : · Common Connect ID ­ "people" with password
"people"/"peop1e" · Default Access ID:
"SYSADM" for Oracle "sa" for MSSQL · Connect ID password is often the same as Access ID password
Let's try to perform dictionary attack on RDBMS
27

Connect ID access in RDBMS
Connect ID has: · Access to 3 tables · Users' passwords hashed with salt
· AccessID and its password is encrypted
28

Is Access ID encrypted?
· "The ACCESSID and ACCESSID password are stored and encrypted in the PeopleSoft security table PSACCESSPRFL."
http://docs.oracle.com/cd/E18083_01/pt851pbr0/eng/psbooks/tadm/chapter.htm?F ile=tadm/htm/tadm13.htm
· "The Symbolic ID is used as the key to retrieve the encrypted ACCESSID and ACCESSPSWD from PSACCESSPRFL"
http://docs.oracle.com/cd/E26239_01/pt851h3/eng/psbooks/tsec/chapter.htm?File= tsec/htm/tsec06.htm
Is Access ID really encrypted?
29

Is Access ID encrypted?
· Is Access ID really encrypted?
­ No.
· It's just XOR with a hardcoded key
­ sBzLcYlPrag= -> SYSADM ­ kCSYMM0Crag= -> sa ­ gjb8YZpHnJo= -> asdQWE12
· Some facts for a brute force attack:
­ Access ID max length ­ 8 symbols ­ Access ID's max password length ­ 10 symbols
· If we have Connect ID and network access to RDMBS, we can get Access ID.
30

Internal attacker
31

Attack on Developers
· 2-Tier ­ direct connection to DBMS.
­ Trusted developers (?) Some tools (like DataMover)
­ A config is stored in the Windows registry ­ "Encryption" is the same
· If we steal a config, we can have full access in RDBMS.
32

Developers
· 3-Tier ­ connection through Application Server.
­ A developer uses only his own PS User ID and password ­ It's possible to restrict access for a developer (read-only privs) ­ Application Server connects to a RDBMS with Access ID account. ­ Special "protocol" - WSH, WSL (Tuxedo). ­ It's a plain-text protocol. A user's password in each packet.
· Man in the middle attack will be useful
33

Developers
· 3-Tier ­ connection through Application Server. · Data inside packets look like plain SQL queries.
Can a 3-tier developer send any SQL command to a RDBMS with Access ID? It should be so!
34

Developers
3-Tier ­ connection through Application Server. · Weird Design. We see all queries of the default authentication
process between Application Server and RDMBS
· A 3-Tier developer knows an Access ID and its password
35

Attacks on front-end systems
36

External attacker
37

Google Dorks
38

WebLogic
· WebLogic management "/console" · On the same port with PeopleSoft application by default · Anyone can try to access the inside with default accounts
39

WebLogic. Users
· A default Weblogic has no additional accounts, except "system" with a custom password
­ Weblogic with PS has accounts: ­ system: Passw0rd (password) ­ main administrator ­ operator: password ­ operator role ­ monitor: password ­ monitor role
* The password of "system" is often changed to that of "PS" · WebLogic account bruteforcing is blocked by default If we get access to a Weblogic server with system account, we will get our goal ­ RCE
40

WebLogic. Users
What about operator and monitor users? Almost nothing
41

WebLogic. Force browsing
Force browsing will help us. There are no sufficient authorization checks. Examples: 1) Browse a server's file system
42

WebLogic. Force browsing
2) How about installing a new application (RCE)? Yes, we can do it!
Some restrictions: · Only with .war/.jar extension · Only "local" files
43

WebLogic. Force browsing
How can we upload the file? Some attempts: 1. SSRF + "jar" trick
- No success. The file has a wrong extension
2. Via PS servlet
- No success. The file has a wrong extension
3. A classic "UNC" trick for bypassing only "local" files restriction.
We should use \\any_server\evil.jar + Success! But only for Windows OS
· If we have access to a Weblogic console, we can execute our code 44

DEMO
45

PeopleSoft Portal
46

PeopleSoft Users
· "PS" ­ super administrator · There are many default users. · Before PeopleTools 8.51: password = login
Like, PS:PS, VP1:VP1, PTDMO:PTDMO · After PeopleTools 8.51: password = PS's password
PS:Password, VP1:Password, PTDMO:Password · PS account bruteforcing is not blocked be default This is a pretty good situation for brute force attacks
47

· Information disclosure:

PeopleSoft Servlets

48

XXEs
· Some of input points: PSIGW/*, Business Interlink, SyncServ · !!!No authentication !!!
49

XXEs
· Common XXE injection impact:
­ We can read plain text files (not all) ­ SSRF ­ SSRF+gopher (if JDK <= 1.6) ­ SSRF+grab NTLM hashes/SMBRelay (if JDK <= 1.6 and OS = Windows) ­ Classic entities DoS? ­ SSRF+jar trick for file uploading + we can list directories and read XML files! (no binary)
CVE-2013-3800, CVE-2013-3819, CVE-2013-3821 Patched in CPU on the 16th July 2013 (cpujul2013)
50

Encryption
Encryption of password in config files:
­ Some passwords of PeopleSoft are stored in plaintext ­ Some ­ DES ­ Some ­ 3DES ­ Some ­ AES (Weblogic)
DES
­ The key for DES is hardcoded ­ Was used for encryption in the older systems ­ Has no ID at the beginning (such as "{V1.1}")
51

Encryption
3DES
­ The key for 3DES is standard by default. ­ You can check it. The string "{V1.1}" before an encrypted password
shows the key is default. ­ After each key regeneration, the number is changed (1.2, 1.3...). ­ Do you regenerate it?
AES
­ If you want to decrypt with AES, you need SerializedSystemIni.dat. ­ You can understand that it is AES by the "{AES}" string in the beginning of
an encrypted password.
52

XXE Attack Vectors
1. If we have network access to the RDBMS, we can read Connect ID, get Access ID and pwn PS DB.
1. From the multitude of configuration files, we can retrieve various accounts (in the case of v. 1.1 or an old PT version with DES). If an administrator re-use a password, we can try to login with the PS account in Portal.
53

PS IGW
· PS IGW supports remote configuration. There are opportunities to read and write a IGW configuration file via special XML requests. Auth is required.
· Old PT versions use "password" as a default password for different services. New PT versions use PS's password as a default password for different services
· No defense against brute force attack · The PS IGW password is stored in a config file. PS IGW's
password is DES/3DES encrypted. The file is readable via XXE.
54

PS IGW. Attack Vectors
· Turn on a XXE feature for a IGW's XML parser · Read a lot of different passwords · Change a path of Java classes location and get RCE * · Set a XSL transformation and get RCE * * Haven't been fully tested yet
55

PeopleSoft SSO
56

PeopleSoft SSO
· A PeopleSoft application supports his own Single Sign On technology
· A PS application sets a special "PS_TOKEN" cookie for a user after successful login. Another PS application checks the cookie and authenticates the user
· How does it work? Pre-Shared Key. · The same password should be set on each node
"Nodes represent any organization, application or system that will play a part in integrations."
· A node has a name. It is necessary to set nodes trusted by the system
· A user name should be in both applications
57

PS SSO

1. UserID + password 2. Access to PS + PS_TOKEN cookie

Node name ­ HRMS 1 Node Password ­ 123 Trusts to FMS1

Node name ­ FMS1 Node Password ­ 123 Trusts to HRMS1
58

PS_TOKEN
PS_TOKEN:
http://docs.oracle.com/cd/E15645_01/pt850pbr0/eng/psbooks/tsec/chapter.htm?File=t sec/htm/tsec10.htm
· UserID · Language Code · Date and Time Issued · Issuing System ­ Node name · Signature = SHA1_Hash ( UserID + Lang + Date Time issued +
Issuing System + Node Password )
Node Password is a "pre-shared key". This is only one unknown value
59

PS_TOKEN. Priv Escalation
What can we do in theory?
· Get a PS_TOKEN cookie · Get all necessary values and a signature from the PS_TOKEN. It's
base64 encoded · Make offline brute force attack on PS_TOKEN. Just add
passwords to the values and compare results of hash with a signature. · SHA1 ­ we can do it really fast with GPU
If we get a node password, we can create a new cookie with "PS" user name and get full access in PeopleSoft Application.
60

PS_TOKEN. Priv Escalation. Real Life
· Reverse Engineering (Thx for https://goo.gl/hRklU6 ) General view:
­ Magic/Static numbers ­ Lengths of parts ­ SHA-1 hash ­ Compressed data:
o UserID o Lang o Node Name o Date And Time
· Don't trust Oracle's documentation =( · Our new tool - "tockenchpoken" can parse, brute and re-create a PS_TOKEN
cookie
61

Worse than you think
· A PS application can consist of some nodes. But there must be one default local node. Of course, it trusts itself.
· There is a lot of situation when an administrator has to set a Node Password.
So we can perform the attack on a standalone PS application.
62

PS SSO

1. Login + password
2. Access to PS App + PS_TOKEN cookie 3. PS_TOKEN cookie
4. Access to PS

Node name ­ HRMS 1 Trusts to itself (HRMS1) Node Password ­ 123

63

DEMO
64

Worse than you think
Restriction: · As we want to get a PS_TOKEN cookie, we need to have valid
credentials on a PS server for the attack. And how about an anonymous attack?
65

Worse than you think
It looks like: · It's impossible to have access to some resources (components)
of a PS Portal without authentication. · But sometimes it's necessary. Like, "Jobs forms" or "Forgot
password?" · You must set up a special auto-login UserID in a PS application
with minimal privs · And, of course, the PS application gives you a PS_TOKEN cookie So, we can get PS_TOKEN and perform an attack "without" valid credentials.
66

Even worse than you think
· PS SSO can be used in other Oracle's application. Like, JD Edwards
· PS_TOKEN can be used for authentication in PS IGW · A PS_TOKEN cookie is often set for a parent domain
(.server.com) · There is a (default) value for a node password ­ "password"
How can we defense a PS application? · Use certificates instead of passwords · Set a really strong password for nodes (max ­ 24 symbols) · Set "No Authentication" for nodes
67

Overview
Internal attack vectors: · Get Connect ID -> Get Access ID - > Pwn PS · If you are a developer, you are an admin
External attack vectors: · Weblogic default account -> Authoriz bypass -> RCE · XXE -> Read configs -> Pwn PS · Brute PS IGW account ->...-> RCE · Get PS_TOKEN -> Brute a Node Password -> Create a new
PS_TOKEN -> Pwn PS
68

ERPScan ­ leaders in Research
60+ Innovative Presentations in security conferences in 25+ countries
69

ERPScan ­ featured in:
70

Research
ERPScan Research ­ Leadership in ERP Security · 300+ vulnerabilities in top vendors including SAP and Oracle · 60+ Innovative Presentations in security conferences in 25+
countries · Award-winning research papers "SAP Security in figures" · Authors of the Book about Oracle Database security · Experts in different areas from Mobile to Hardware
The company expertise is based on research conducted by
the ERPScan research center
71

About

Each ERP landscape is unique and we pay close attention to the requirements of our customers and prospects. ERPScan development team constantly addresses these specific needs and is actively involved in product advancement. If you wish to know whether our scanner addresses a particular aspect, or simply have a feature wish list, please e-mail us or give us a call. We will be glad to consider your suggestions for the next releases or monthly updates.

228 Hamilton Avenue, Fl. 3, Palo Alto, CA. 94301

Luna ArenA 238 Herikerbergweg, 1101 CM Amsterdam

USA HQ

EU HQ

www.erpscan.com info@erpscan.com

72

